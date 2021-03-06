class SessionsController < ApplicationController

  def new
    @user = User.new
    redirect_to users_path
  end

  def create
    @user = User.find_by_email(params[:session][:email].downcase)
    p 'these are the params #{params}'
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      # could flash errors here!
      render 'new'
    end
  end

  def destroy
    session.clear
    redirect_to new_user_path
  end
end

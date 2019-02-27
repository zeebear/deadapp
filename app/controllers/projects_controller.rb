class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @projects = policy_scope(Project).order(created_at: :desc)
  end

  def show
    authorize @project
  end

  def edit
    authorize @project
  end

  def update
    authorize @project
    @project.update(project_params)
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end

  # def reviews
  #   reviews = []
  #   self.bookings.each do |booking|

  #     reviews << booking.review if booking.review
  #   end
  #   return reviews
  # end

  # def rating
  #   reviews.map { |review| review.rating }.sum / reviews.count.to_f
  # end

USE [master]
GO
/****** Object:  Database [PRJ301_Assignment]    Script Date: 7/13/2022 11:43:20 AM ******/

 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRJ301_Assignment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PRJ301_Assignment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRJ301_Assignment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PRJ301_Assignment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PRJ301_Attendance] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRJ301_Assignment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRJ301_Attendance] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRJ301_Attendance] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRJ301_Attendance] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRJ301_Attendance] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRJ301_Attendance] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRJ301_Attendance] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PRJ301_Attendance] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRJ301_Attendance] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRJ301_Attendance] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRJ301_Attendance] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRJ301_Attendance] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRJ301_Attendance] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRJ301_Attendance] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRJ301_Attendance] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRJ301_Attendance] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PRJ301_Attendance] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRJ301_Attendance] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRJ301_Attendance] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRJ301_Attendance] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRJ301_Attendance] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRJ301_Attendance] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRJ301_Attendance] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRJ301_Attendance] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PRJ301_Attendance] SET  MULTI_USER 
GO
ALTER DATABASE [PRJ301_Attendance] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRJ301_Attendance] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRJ301_Attendance] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRJ301_Attendance] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRJ301_Attendance] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRJ301_Attendance] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PRJ301_Attendance] SET QUERY_STORE = OFF
GO
USE [PRJ301_Attendance]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 7/13/2022 11:43:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[StudentID] [varchar](30) NOT NULL,
	[SessionID] [int] NOT NULL,
	[Status] [varchar](20) NOT NULL,
	[Recordtime] [time](7) NOT NULL,
	[Comment] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[SessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 7/13/2022 11:43:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseID] [varchar](30) NOT NULL,
	[CourseName] [varchar](70) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 7/13/2022 11:43:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[GroupID] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [varchar](30) NOT NULL,
	[LectureID] [varchar](30) NOT NULL,
	[CourseID] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lecture]    Script Date: 7/13/2022 11:43:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecture](
	[LectureID] [varchar](30) NOT NULL,
	[LectureName] [nvarchar](50) NOT NULL,
	[LectureEmail] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LectureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 7/13/2022 11:43:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[RoomID] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 7/13/2022 11:43:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[SessionID] [int] IDENTITY(1,1) NOT NULL,
	[SessionNumber] [int] NOT NULL,
	[SessionDate] [date] NOT NULL,
	[Semester] [varchar](20) NOT NULL,
	[RoomID] [varchar](30) NOT NULL,
	[TimeslotID] [varchar](30) NOT NULL,
	[GroupID] [int] NOT NULL,
	[LectureID] [nchar](30) NOT NULL,
 CONSTRAINT [PK__Session__C9F4927084BA9C2A] PRIMARY KEY CLUSTERED 
(
	[SessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 7/13/2022 11:43:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentID] [varchar](30) NOT NULL,
	[StudentCode] [varchar](50) NOT NULL,
	[StudentSurname] [nvarchar](30) NOT NULL,
	[StudentMiddlename] [nvarchar](30) NOT NULL,
	[StudentGivenname] [nvarchar](30) NOT NULL,
	[StudentEmail] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentGroup]    Script Date: 7/13/2022 11:43:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentGroup](
	[StudentID] [varchar](30) NOT NULL,
	[GroupID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Timeslot]    Script Date: 7/13/2022 11:43:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timeslot](
	[TimeslotID] [varchar](30) NOT NULL,
	[start] [time](7) NOT NULL,
	[end] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TimeslotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE140155', 1, N'Present', CAST(N'15:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE140155', 2, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE140155', 3, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE140155', 15, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE140155', 18, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE140155', 19, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE140155', 20, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE140155', 21, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE140155', 22, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE140155', 23, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE140155', 24, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE140155', 25, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE140777', 1, N'Absent', CAST(N'15:00:00' AS Time), N'Late for class')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE140777', 2, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE140777', 3, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE140777', 15, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE140777', 18, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE140777', 19, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE140777', 20, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE140777', 21, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE140777', 22, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE140777', 23, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE140777', 24, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE140777', 25, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE141083', 7, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE141083', 8, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150167', 1, N'Absent', CAST(N'15:00:00' AS Time), N'Have a medical check up')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150167', 2, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150167', 3, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150167', 15, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150167', 18, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150167', 19, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150167', 20, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150167', 21, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150167', 22, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150167', 23, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150167', 24, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150167', 25, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150469', 7, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150469', 8, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150798', 1, N'Present', CAST(N'15:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150798', 2, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150798', 3, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150798', 15, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150798', 18, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150798', 19, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150798', 20, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150798', 21, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150798', 22, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150798', 23, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150798', 24, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150798', 25, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150819', 1, N'Present', CAST(N'15:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150819', 2, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150819', 3, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150819', 15, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150819', 18, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150819', 19, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150819', 20, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150819', 21, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150819', 22, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150819', 23, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150819', 24, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150819', 25, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150915', 1, N'Absent', CAST(N'15:00:00' AS Time), N'Late for class')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150915', 2, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150915', 3, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150915', 15, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150915', 18, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150915', 19, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150915', 20, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150915', 21, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150915', 22, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150915', 23, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150915', 24, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150915', 25, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151210', 1, N'Present', CAST(N'15:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151210', 2, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151210', 3, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151210', 15, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151210', 18, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151210', 19, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151210', 20, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151210', 21, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151210', 22, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151210', 23, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151210', 24, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151210', 25, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151282', 1, N'Present', CAST(N'15:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151282', 2, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151282', 3, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151282', 15, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151282', 18, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151282', 19, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151282', 20, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151282', 21, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151282', 22, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151282', 23, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151282', 24, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151282', 25, N'absent', CAST(N'19:00:00' AS Time), N'')
GO
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151297', 7, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151297', 8, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151356', 1, N'Present', CAST(N'15:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151356', 2, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151356', 3, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151356', 15, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151356', 18, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151356', 19, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151356', 20, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151356', 21, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151356', 22, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151356', 23, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151356', 24, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151356', 25, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151366', 7, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151366', 8, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151407', 7, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151407', 8, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151431', 1, N'Absent', CAST(N'15:00:00' AS Time), N'Late for class')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151431', 2, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151431', 3, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151431', 15, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151431', 18, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151431', 19, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151431', 20, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151431', 21, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151431', 22, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151431', 23, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151431', 24, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151431', 25, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153012', 1, N'Present', CAST(N'15:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153012', 2, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153012', 3, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153012', 15, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153012', 18, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153012', 19, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153012', 20, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153012', 21, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153012', 22, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153012', 23, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153012', 24, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153012', 25, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153276', 1, N'Present', CAST(N'15:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153276', 2, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153276', 3, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153276', 15, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153276', 18, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153276', 19, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153276', 20, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153276', 21, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153276', 22, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153276', 23, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153276', 24, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153276', 25, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153603', 1, N'Absent', CAST(N'15:00:00' AS Time), N'Late for class')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153603', 2, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153603', 3, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153603', 15, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153603', 18, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153603', 19, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153603', 20, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153603', 21, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153603', 22, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153603', 23, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153603', 24, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153603', 25, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153622', 1, N'Present', CAST(N'15:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153622', 2, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153622', 3, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153622', 15, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153622', 18, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153622', 19, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153622', 20, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153622', 21, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153622', 22, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153622', 23, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153622', 24, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153622', 25, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153773', 1, N'Present', CAST(N'15:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153773', 2, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153773', 3, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153773', 15, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153773', 18, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153773', 19, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153773', 20, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153773', 21, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153773', 22, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153773', 23, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153773', 24, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153773', 25, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE160085', 7, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE160085', 8, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE160328', 1, N'Present', CAST(N'15:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE160328', 2, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE160328', 3, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE160328', 15, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE160328', 18, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE160328', 19, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE160328', 20, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE160328', 21, N'present', CAST(N'19:00:00' AS Time), N'')
GO
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE160328', 22, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE160328', 23, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE160328', 24, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE160328', 25, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE160531', 7, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE160531', 8, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE160537', 7, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE160537', 8, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE160770', 7, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE160770', 8, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161149', 1, N'Absent', CAST(N'15:00:00' AS Time), N'Covid Checking')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161149', 2, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161149', 3, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161149', 15, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161149', 18, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161149', 19, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161149', 20, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161149', 21, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161149', 22, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161149', 23, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161149', 24, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161149', 25, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161318', 7, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161318', 8, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161499', 1, N'Present', CAST(N'15:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161499', 2, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161499', 3, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161499', 15, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161499', 18, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161499', 19, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161499', 20, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161499', 21, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161499', 22, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161499', 23, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161499', 24, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161499', 25, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161574', 1, N'Absent', CAST(N'15:00:00' AS Time), N'Join then out')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161574', 2, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161574', 3, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161574', 15, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161574', 18, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161574', 19, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161574', 20, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161574', 21, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161574', 22, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161574', 23, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161574', 24, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161574', 25, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161699', 1, N'Present', CAST(N'15:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161699', 2, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161699', 3, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161699', 15, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161699', 18, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161699', 19, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161699', 20, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161699', 21, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161699', 22, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161699', 23, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161699', 24, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161699', 25, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161701', 1, N'Present', CAST(N'15:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161701', 2, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161701', 3, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161701', 15, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161701', 18, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161701', 19, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161701', 20, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161701', 21, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161701', 22, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161701', 23, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161701', 24, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161701', 25, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161888', 1, N'Absent', CAST(N'15:00:00' AS Time), N'Join then out')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161888', 2, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161888', 3, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161888', 15, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161888', 18, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161888', 19, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161888', 20, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161888', 21, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161888', 22, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161888', 23, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161888', 24, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161888', 25, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161928', 1, N'Present', CAST(N'15:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161928', 2, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161928', 3, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161928', 15, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161928', 18, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161928', 19, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161928', 20, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161928', 21, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161928', 22, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161928', 23, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161928', 24, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161928', 25, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE162004', 1, N'Present', CAST(N'15:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE162004', 2, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE162004', 3, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE162004', 15, N'present', CAST(N'19:00:00' AS Time), N'')
GO
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE162004', 18, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE162004', 19, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE162004', 20, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE162004', 21, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE162004', 22, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE162004', 23, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE162004', 24, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE162004', 25, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163168', 7, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163168', 8, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163229', 7, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163229', 8, N'absent', CAST(N'19:00:00' AS Time), N'Blackout')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163350', 7, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163350', 8, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163366', 1, N'Absent', CAST(N'15:00:00' AS Time), N'Blackout')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163366', 2, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163366', 3, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163366', 15, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163366', 18, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163366', 19, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163366', 20, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163366', 21, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163366', 22, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163366', 23, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163366', 24, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163366', 25, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163411', 7, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163411', 8, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163419', 7, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163419', 8, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163428', 7, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163428', 8, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163444', 7, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163444', 8, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163538', 7, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163538', 8, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163585', 1, N'Present', CAST(N'15:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163585', 2, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163585', 3, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163585', 7, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163585', 8, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163585', 15, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163585', 18, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163585', 19, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163585', 20, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163585', 21, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163585', 22, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163585', 23, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163585', 24, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163585', 25, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163614', 7, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163614', 8, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163615', 7, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163615', 8, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163678', 7, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163678', 8, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163751', 7, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163751', 8, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163884', 1, N'Present', CAST(N'15:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163884', 2, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163884', 3, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163884', 15, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163884', 18, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163884', 19, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163884', 20, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163884', 21, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163884', 22, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163884', 23, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163884', 24, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163884', 25, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163937', 1, N'Present', CAST(N'15:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163937', 2, N'absent', CAST(N'19:00:00' AS Time), N'Covid')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163937', 3, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163937', 7, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163937', 8, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163937', 9, N'Present', CAST(N'08:13:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163937', 10, N'Absent', CAST(N'11:00:00' AS Time), N'late for class')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163937', 11, N'Absent', CAST(N'10:28:00' AS Time), N'Join then out')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163937', 12, N'Absent', CAST(N'11:32:00' AS Time), N'Blackout')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163937', 15, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163937', 18, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163937', 19, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163937', 20, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163937', 21, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163937', 22, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163937', 23, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163937', 24, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163937', 25, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163971', 7, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163971', 8, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164001', 1, N'Present', CAST(N'15:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164001', 2, N'Absent', CAST(N'15:45:00' AS Time), N'Dont do homework')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164001', 3, N'Absent', CAST(N'15:35:00' AS Time), N'Late for class')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164001', 4, N'Present', CAST(N'14:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164001', 5, N'Present', CAST(N'13:30:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164001', 6, N'Present', CAST(N'13:33:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164001', 7, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164001', 8, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164001', 15, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164001', 18, N'absent', CAST(N'19:00:00' AS Time), N'')
GO
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164001', 19, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164001', 20, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164001', 21, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164001', 22, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164001', 23, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164001', 24, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164001', 25, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164016', 1, N'Absent', CAST(N'15:00:00' AS Time), N'Have a funeral')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164016', 2, N'Absent', CAST(N'15:45:00' AS Time), N'Blackout')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164016', 3, N'Present', CAST(N'15:35:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164016', 4, N'Present', CAST(N'14:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164016', 5, N'Present', CAST(N'13:30:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164016', 6, N'Present', CAST(N'13:33:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164016', 7, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164016', 8, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164016', 9, N'Present', CAST(N'08:13:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164016', 10, N'Present', CAST(N'11:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164016', 11, N'Present', CAST(N'10:28:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164016', 12, N'Present', CAST(N'11:32:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164016', 15, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164016', 18, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164016', 19, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164016', 20, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164016', 21, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164016', 22, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164016', 23, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164016', 24, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164016', 25, N'present', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE169003', 7, N'absent', CAST(N'19:00:00' AS Time), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE169003', 8, N'absent', CAST(N'19:00:00' AS Time), N'')
GO
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (N'CSD201', N'Data Structures and Algorithms')
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (N'DBI202', N'Introduction to Databases')
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (N'IOT102', N'Internet of Things')
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (N'JPD113', N'Elementary Japanese 1-A1.1')
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (N'JPD123', N'Elementary Japanese 1-A1.2')
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (N'LAB211', N'OOP with Java Lab')
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (N'MAS291', N'Statistics and Probability')
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (N'PRJ301', N'Java Web Application Development')
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (N'PRO192', N'Object-Oriented Programming')
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (N'SWE201c', N'Introduction to Software Engineering')
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (N'WED201c', N'Web Design')
GO
SET IDENTITY_INSERT [dbo].[Group] ON 

INSERT [dbo].[Group] ([GroupID], [GroupName], [LectureID], [CourseID]) VALUES (1, N'SE1630', N'hongdt30', N'MAS291')
INSERT [dbo].[Group] ([GroupID], [GroupName], [LectureID], [CourseID]) VALUES (2, N'SE1623', N'sonhx', N'IOT102')
INSERT [dbo].[Group] ([GroupID], [GroupName], [LectureID], [CourseID]) VALUES (3, N'SE1623', N'sonnt5', N'PRJ301')
INSERT [dbo].[Group] ([GroupID], [GroupName], [LectureID], [CourseID]) VALUES (4, N'GD1611', N'thulx', N'JPD123')
INSERT [dbo].[Group] ([GroupID], [GroupName], [LectureID], [CourseID]) VALUES (5, N'SE1624', N'trungnt', N'SWE201c')
INSERT [dbo].[Group] ([GroupID], [GroupName], [LectureID], [CourseID]) VALUES (7, N'AI1604', N'sonnt5', N'MAS291')
INSERT [dbo].[Group] ([GroupID], [GroupName], [LectureID], [CourseID]) VALUES (8, N'AI1605', N'sonnt5', N'DBI202')
SET IDENTITY_INSERT [dbo].[Group] OFF
GO
INSERT [dbo].[Lecture] ([LectureID], [LectureName], [LectureEmail]) VALUES (N'hongdt30', N'Dương Thị Hồng', N'hongdt30@fpt.edu.vn')
INSERT [dbo].[Lecture] ([LectureID], [LectureName], [LectureEmail]) VALUES (N'Keiichiro', N'Someya Keiichiro', N'Keiichiro@fe.edu.vn')
INSERT [dbo].[Lecture] ([LectureID], [LectureName], [LectureEmail]) VALUES (N'sonhx', N'Hoàng Xuân Sơn', N'SonHX@fe.edu.vn')
INSERT [dbo].[Lecture] ([LectureID], [LectureName], [LectureEmail]) VALUES (N'sonnt5', N'Ngô Tùng Sơn', N'sonnt69@fe.edu.vn')
INSERT [dbo].[Lecture] ([LectureID], [LectureName], [LectureEmail]) VALUES (N'thulx', N'Lại Xuân Thu', N'ThuLX@fe.edu.vn')
INSERT [dbo].[Lecture] ([LectureID], [LectureName], [LectureEmail]) VALUES (N'trungnt', N'Nguyễn Tất Trung', N'TrungNT77@fe.edu.vn')
GO
INSERT [dbo].[Room] ([RoomID]) VALUES (N'AL-R202')
INSERT [dbo].[Room] ([RoomID]) VALUES (N'BE-219')
INSERT [dbo].[Room] ([RoomID]) VALUES (N'BE-305')
INSERT [dbo].[Room] ([RoomID]) VALUES (N'BE-315')
INSERT [dbo].[Room] ([RoomID]) VALUES (N'CI-420')
INSERT [dbo].[Room] ([RoomID]) VALUES (N'DE-225')
INSERT [dbo].[Room] ([RoomID]) VALUES (N'DE-C202')
INSERT [dbo].[Room] ([RoomID]) VALUES (N'DE-C203')
INSERT [dbo].[Room] ([RoomID]) VALUES (N'DE-C206')
GO
SET IDENTITY_INSERT [dbo].[Session] ON 

INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID], [LectureID]) VALUES (1, 1, CAST(N'2022-05-09' AS Date), N'Summer2022', N'DE-C202 ', N'Slot 5', 3, N'sonnt5                        ')
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID], [LectureID]) VALUES (2, 2, CAST(N'2022-05-11' AS Date), N'Summer2022', N'DE-C202 ', N'Slot 5', 3, N'sonnt5                        ')
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID], [LectureID]) VALUES (3, 3, CAST(N'2022-05-13' AS Date), N'Summer2022', N'DE-C202 ', N'Slot 5', 3, N'sonnt5                        ')
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID], [LectureID]) VALUES (4, 1, CAST(N'2022-05-09' AS Date), N'Summer2022', N'DE-C202 ', N'Slot 4', 2, N'sonhx                         ')
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID], [LectureID]) VALUES (5, 2, CAST(N'2022-05-11' AS Date), N'Summer2022', N'DE-C202 ', N'Slot 4', 2, N'sonhx                         ')
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID], [LectureID]) VALUES (6, 3, CAST(N'2022-05-13' AS Date), N'Summer2022', N'DE-C202 ', N'Slot 4', 2, N'sonhx                         ')
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID], [LectureID]) VALUES (7, 1, CAST(N'2022-05-10' AS Date), N'Summer2022', N'DE-C203', N'Slot 1', 1, N'hongdt30                      ')
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID], [LectureID]) VALUES (8, 2, CAST(N'2022-05-10' AS Date), N'Summer2022', N'DE-C203', N'Slot 2', 1, N'hongdt30                      ')
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID], [LectureID]) VALUES (9, 3, CAST(N'2022-05-12' AS Date), N'Summer2022', N'DE-C203', N'Slot 1', 1, N'hongdt30                      ')
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID], [LectureID]) VALUES (10, 1, CAST(N'2022-05-10' AS Date), N'Summer2022', N'DE-225', N'Slot 3', 4, N'thulx                         ')
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID], [LectureID]) VALUES (11, 2, CAST(N'2022-05-12' AS Date), N'Summer2022', N'DE-225', N'Slot 2', 4, N'thulx                         ')
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID], [LectureID]) VALUES (12, 3, CAST(N'2022-05-12' AS Date), N'Summer2022', N'DE-225', N'Slot 3', 4, N'thulx                         ')
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID], [LectureID]) VALUES (13, 1, CAST(N'2022-05-21' AS Date), N'Summer2022', N'BE-305', N'Slot 2', 5, N'trungnt                       ')
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID], [LectureID]) VALUES (14, 2, CAST(N'2022-06-11' AS Date), N'Summer2022', N'BE-305', N'Slot 2', 5, N'trungnt                       ')
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID], [LectureID]) VALUES (15, 4, CAST(N'2022-05-16' AS Date), N'Summer2022', N'DE-C202', N'Slot 5', 3, N'sonnt5                        ')
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID], [LectureID]) VALUES (16, 1, CAST(N'2022-05-09' AS Date), N'Summer2022', N'BE-305', N'Slot 1', 8, N'sonnt5                        ')
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID], [LectureID]) VALUES (18, 5, CAST(N'2022-05-18' AS Date), N'Summer2022', N'DE-C202 ', N'Slot 5', 3, N'sonnt5                        ')
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID], [LectureID]) VALUES (19, 6, CAST(N'2022-05-20' AS Date), N'Summer2022', N'DE-C202 ', N'Slot 5', 3, N'sonnt5                        ')
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID], [LectureID]) VALUES (20, 7, CAST(N'2022-05-23' AS Date), N'Summer2022', N'DE-C202 ', N'Slot 5', 3, N'sonnt5                        ')
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID], [LectureID]) VALUES (21, 8, CAST(N'2022-05-25' AS Date), N'Summer2022', N'DE-C202 ', N'Slot 5', 3, N'sonnt5                        ')
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID], [LectureID]) VALUES (22, 9, CAST(N'2022-05-27' AS Date), N'Summer2022', N'DE-C202 ', N'Slot 5', 3, N'sonnt5                        ')
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID], [LectureID]) VALUES (23, 10, CAST(N'2022-05-30' AS Date), N'Summer2022', N'DE-C202 ', N'Slot 5', 3, N'sonnt5                        ')
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID], [LectureID]) VALUES (24, 11, CAST(N'2022-06-01' AS Date), N'Summer2022', N'DE-C202 ', N'Slot 5', 3, N'sonnt5                        ')
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID], [LectureID]) VALUES (25, 12, CAST(N'2022-06-03' AS Date), N'Summer2022', N'DE-C202 ', N'Slot 5', 3, N'sonnt5                        ')
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID], [LectureID]) VALUES (26, 13, CAST(N'2022-06-06' AS Date), N'Summer2022', N'DE-C202 ', N'Slot 5', 3, N'sonnt5                        ')
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID], [LectureID]) VALUES (27, 14, CAST(N'2022-06-08' AS Date), N'Summer2022', N'DE-C202 ', N'Slot 5', 3, N'sonnt5                        ')
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID], [LectureID]) VALUES (28, 15, CAST(N'2022-06-10' AS Date), N'Summer2022', N'DE-C202 ', N'Slot 5', 3, N'sonnt5                        ')
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID], [LectureID]) VALUES (29, 16, CAST(N'2022-06-13' AS Date), N'Summer2022', N'DE-C202 ', N'Slot 5', 3, N'sonnt5                        ')
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID], [LectureID]) VALUES (30, 17, CAST(N'2022-06-15' AS Date), N'Summer2022', N'DE-C202 ', N'Slot 5', 3, N'sonnt5                        ')
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID], [LectureID]) VALUES (31, 18, CAST(N'2022-06-17' AS Date), N'Summer2022', N'DE-C202 ', N'Slot 5', 3, N'sonnt5                        ')
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID], [LectureID]) VALUES (32, 19, CAST(N'2022-06-20' AS Date), N'Summer2022', N'DE-C202 ', N'Slot 5', 3, N'sonnt5                        ')
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID], [LectureID]) VALUES (33, 20, CAST(N'2022-06-22' AS Date), N'Summer2022', N'DE-C202 ', N'Slot 5', 3, N'sonnt5                        ')
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID], [LectureID]) VALUES (34, 21, CAST(N'2022-06-24' AS Date), N'Summer2022', N'DE-C202 ', N'Slot 5', 3, N'sonnt5                        ')
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID], [LectureID]) VALUES (35, 22, CAST(N'2022-06-27' AS Date), N'Summer2022', N'DE-C202 ', N'Slot 5', 3, N'sonnt5                        ')
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID], [LectureID]) VALUES (36, 23, CAST(N'2022-06-29' AS Date), N'Summer2022', N'DE-C202 ', N'Slot 5', 3, N'sonnt5                        ')
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID], [LectureID]) VALUES (37, 24, CAST(N'2022-07-01' AS Date), N'Summer2022', N'DE-C202 ', N'Slot 5', 3, N'sonnt5                        ')
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID], [LectureID]) VALUES (38, 25, CAST(N'2022-07-11' AS Date), N'Summer2022', N'DE-C202 ', N'Slot 5', 3, N'sonnt5                        ')
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID], [LectureID]) VALUES (39, 26, CAST(N'2022-07-13' AS Date), N'Summer2022', N'DE-C202 ', N'Slot 5', 3, N'sonnt5                        ')
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID], [LectureID]) VALUES (40, 27, CAST(N'2022-07-15' AS Date), N'Summer2022', N'DE-C202 ', N'Slot 5', 3, N'sonnt5                        ')
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID], [LectureID]) VALUES (41, 28, CAST(N'2022-07-18' AS Date), N'Summer2022', N'DE-C202 ', N'Slot 5', 3, N'sonnt5                        ')
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID], [LectureID]) VALUES (42, 29, CAST(N'2022-07-20' AS Date), N'Summer2022', N'DE-C202 ', N'Slot 5', 3, N'sonnt5                        ')
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID], [LectureID]) VALUES (1025, 4, CAST(N'2022-05-17' AS Date), N'Summer2022', N'DE-C203', N'Slot 1', 1, N'hongdt30                      ')
SET IDENTITY_INSERT [dbo].[Session] OFF
GO
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HA160009', N'NganNHHA160009', N'Nguyễn', N'Hà', N'Ngân', N'NganNHHA160009@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE130904', N'HoangMVHE130904', N'Mai', N'Võ', N'Hoàng', N'HoangMVHE130904@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE130927', N'LinhLVTHE130927', N'Lê', N'Vũ Tuấn', N'Linh', N'LinhLVTHE130927@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE140155', N'HuyMDHE140155', N'Mai', N'Đức', N'Huy', N'HuyMDHE140155@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE140647', N'BangVLHE140647', N'Vũ', N'Lập', N'Bang', N'BangVLHE140647@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE140777', N'DatNTHE140777', N'Nguyễn', N'Thành', N'Đạt', N'DatNTHE140777@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE140954', N'HuyHMHE140954', N'Hoàng', N'Minh', N'Huy', N'HuyHMHE140954@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE140986', N'LongNBHE140986', N'Nguyễn', N'Bảo', N'Long', N'LongNBHE140986@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE141083', N'DongDVHE141083', N'Đinh', N'Văn', N'Đông', N'DongDVHE141083@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE141491', N'AnhNVHE141491', N'Nguyễn', N'Việt', N'Anh', N'AnhNVHE141491@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE141683', N'HuyBQHE141683', N'Bùi', N'Quốc', N'Huy', N'HuyBQHE141683@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE150013', N'MinhNHHE150013', N'Nguyễn', N'Hoàng', N'Minh', N'MinhNHHE150013@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE150167', N'QuyetNHHE150167', N'Nguyễn', N'Hữu', N'Quyết', N'QuyetNHHE150167@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE150469', N'DucTAHE150469', N'Trịnh', N'Anh', N'Đức', N'DucTAHE150469@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE150798', N'VuCQHE150798', N'Chu', N'Quang', N'Vũ', N'VuCQHE150798@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE150819', N'TuyenNVHE150819', N'Nguyễn', N'Văn', N'Tuyên', N'TuyenNVHE150819@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE150865', N'OanhNTKHE150865', N'Nguyễn', N'Thị Kim', N'Oanh', N'OanhNTKHE150865@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE150915', N'DungNTHE150915', N'Nguyễn', N'Tuấn', N'Dũng', N'DungNTHE150915@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE151158', N'ThanhTTHE151158', N'Trần', N'Tiến', N'Thành', N'ThanhTTHE151158@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE151192', N'MinhNAHE151192', N'Nguyễn', N'Anh', N'Minh', N'MinhNAHE151192@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE151210', N'KienVDHE151210', N'Vũ', N'Đức', N'Kiên', N'KienVDHE151210@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE151282', N'QuanLNMHE151282', N'Lê', N'Nguyễn Minh', N'Quân', N'QuanLNMHE151282@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE151297', N'BachHXHE151297', N'Hoàng', N'Xuân', N'Bách', N'BachHXHE151297@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE151321', N'HieuTVHE151321', N'Tạ', N'Văn', N'Hiếu', N'HieuTVHE151321@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE151356', N'TungNHHE151356', N'Nguyễn', N'Huy', N'Tùng', N'TungNHHE151356@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE151366', N'SonNNHE151366', N'Nguyễn', N'Ngọc', N'Sơn', N'SonNNHE151366@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE151407', N'AnhPHVHE151407', N'Phạm', N'Hữu Việt', N'Anh', N'AnhPHVHE151407@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE151431', N'TuyetDAHE151431', N'Đặng', N'Ánh', N'Tuyết', N'TuyetDAHE151431@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE153012', N'HuyPNDHE153012', N'Phan', N'Nguyễn Đăng', N'Huy', N'HuyPNDHE153012@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE153257', N'DungLAHE153257', N'Lê', N'Anh', N'Dũng', N'DungLAHE153257@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE153263', N'AnhLHHE153263', N'Lương', N'Huy', N'Anh', N'AnhLHHE153263@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE153276', N'AnhPQHE153276', N'Phạm', N'Quang', N'Anh', N'AnhPQHE153276@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE153306', N'DongPHHE153306', N'Phan', N'Hữu', N'Đông', N'DongPHHE153306@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE153311', N'HungNKHE153311', N'Nguyễn', N'Khâm', N'Hưng', N'HungNKHE153311@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE153330', N'HieuDNHE153330', N'Đinh', N'Nghĩa', N'Hiếu', N'HieuDNHE153330@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE153527', N'HieuLDLHE153527', N'Lương', N'Đức Lê', N'Hiệu', N'HieuLDLHE153527@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE153602', N'HoangCMHE153602', N'Cao', N'Mạnh', N'Hoàng', N'HoangCMHE153602@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE153603', N'ThuBTXHE153603', N'Bùi', N'Thị Xuân', N'Thu', N'ThuBTXHE153603@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE153622', N'HungNDHE153622', N'Nguyễn', N'Duy', N'Hưng', N'HungNDHE153622@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE153711', N'AnhPVHE153711', N'Phùng', N'Việt', N'Anh', N'AnhPVHE153711@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE153773', N'QuyetNVHE153773', N'Nguyễn', N'Văn', N'Quyết', N'QuyetNVHE153773@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE160085', N'MinhPNHE160085', N'Phạm', N'Nhật', N'Minh', N'MinhPNHE160085@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE160099', N'KhanhTMHE160099', N'Trần', N'Minh', N'Khánh', N'KhanhTMHE160099@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE160152', N'TungLQHE160152', N'Lê', N'Quang', N'Tùng', N'TungLQHE160152@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE160328', N'HaLHHE160328', N'Lê', N'Hải', N'Hà', N'HaLHHE160328@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE160369', N'ThuyenNAHE160369', N'Nguyễn', N'An', N'Thuyên', N'ThuyenNAHE160369@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE160473', N'ChauCNBHE160473', N'Cấn', N'Nguyễn Bảo', N'Châu', N'ChauCNBHE160473@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE160531', N'HoangNHHE160531', N'Nguyễn', N'Huy', N'Hoàng', N'HoangNHHE160531@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE160537', N'BinhPHHE160537', N'Phạm', N'Hải', N'Bình', N'BinhPHHE160537@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE160629', N'KienHDHE160629', N'Huỳnh', N'Đức', N'Kiên', N'KienHDHE160629@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE160643', N'AnhKTHHE160643', N'Khổng', N'Thị Hồng', N'Anh', N'AnhKTHHE160643@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE160770', N'ThanhNCHE160770', N'Nguyễn', N'Công', N'Thành', N'ThanhNCHE160770@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE160809', N'AnhVQHE160809', N'Vương', N'Quốc', N'Anh', N'AnhVQHE160809@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE160853', N'DanNTHE160853', N'Nguyễn', N'Thừa', N'Đan', N'DanNTHE160853@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161082', N'LyNPHE161082', N'Nguyễn', N'Phương', N'Ly', N'LyNPHE161082@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161089', N'HienTTHE161089', N'Trần', N'Trọng', N'Hiển', N'HienTTHE161089@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161149', N'LongPKHE161149', N'Phan', N'Kim', N'Long', N'LongPKHE161149@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161153', N'TuanKMHE161153', N'Kiều', N'Mạnh', N'Tuấn', N'TuanKMHE161153@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161201', N'TrungNDHE161201', N'Nguyễn', N'Đức', N'Trung', N'TrungNDHE161201@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161203', N'LamNHTHE161203', N'Nguyễn', N'Huy Tùng', N'Lâm', N'LamNHTHE161203@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161300', N'LinhVKHE161300', N'Vũ', N'Khánh', N'Linh', N'LinhVKHE161300@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161318', N'TungNQHE161318', N'Nguyễn', N'Quang', N'Tùng', N'TungNQHE161318@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161371', N'DatNMHE161371', N'Nguyễn', N'Minh', N'Đạt', N'DatNMHE161371@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161448', N'HaiPHHHE161448', N'Phạm', N'Hoàng Hồng', N'Hải', N'HaiPHHHE161448@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161496', N'PhuDQHE161496', N'Đào', N'Quang', N'Phú', N'PhuDQHE161496@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161499', N'HuyLQHE161499', N'Lê', N'Quang', N'Huy', N'HuyLQHE161499@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161530', N'HuyVNHE161530', N'Vũ', N'Ngọc', N'Huy', N'HuyVNHE161530@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161574', N'HoangPHHE161574', N'Phạm', N'Huy', N'Hoàng', N'HoangPHHE161574@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161575', N'MinhNDHE161575', N'Ngô', N'Đức', N'Minh', N'MinhNDHE161575@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161581', N'VuPLHE161581', N'Phạm', N'Long', N'Vũ', N'VuPLHE161581@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161637', N'HuyDTQHE161637', N'Đỗ', N'Trần Quang', N'Huy', N'HuyDTQHE161637@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161697', N'MinhDNHE161697', N'Đặng', N'Nhật', N'Minh', N'MinhDNHE161697@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161699', N'HungTQHE161699', N'Trần', N'Quốc', N'Hưng', N'HungTQHE161699@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161701', N'DatDTHE161701', N'Đoàn', N'Tiến', N'Đạt', N'DatDTHE161701@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161722', N'KhanhTQHE161722', N'Trương', N'Quốc', N'Khánh', N'KhanhTQHE161722@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161827', N'SonDCHE161827', N'Dương', N'Công', N'Sơn', N'SonDCHE161827@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161880', N'DuongVHHE161880', N'Vũ', N'Hoàng', N'Dương', N'DuongVHHE161880@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161887', N'MinhTDHE161887', N'Trần', N'Đức', N'Minh', N'MinhTDHE161887@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161888', N'SonKAHE161888', N'Kiều', N'Anh', N'Sơn', N'SonKAHE161888@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161928', N'BaoNNHE161928', N'Nguyễn', N'Ngọc', N'Bảo', N'BaoNNHE161928@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161943', N'VinhVHHE161943', N'Vũ', N'Hoàng', N'Vinh', N'VinhVHHE161943@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE162004', N'SonNHHE162004', N'Nguyễn', N'Hồng', N'Sơn', N'SonNHHE162004@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163016', N'LongNTHE163016', N'Nguyễn', N'Thanh', N'Long', N'LongNTHE163016@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163037', N'DungCQHE163037', N'Cao', N'Quốc', N'Dũng', N'DungCQHE163037@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163054', N'KienNHHE163054', N'Nguyễn', N'Hoàng', N'Kiên', N'KienNHHE163054@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163060', N'QuangTDHE163060', N'Triệu', N'Đình', N'Quang', N'QuangTDHE163060@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163087', N'MyDTTHE163087', N'Đỗ', N'Thị Trà', N'My', N'MyDTTHE163087@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163088', N'HoaBNHE163088', N'Bế', N'Ngọc', N'Hoa', N'HoaBNHE163088@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163104', N'HieuNVHE163104', N'Nguyễn', N'Văn', N'Hiếu', N'HieuNVHE163104@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163168', N'VietBHHE163168', N'Bùi', N'Hoàng', N'Việt', N'VietBHHE163168@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163189', N'KhanhPDHE163189', N'Phạm', N'Duy', N'Khánh', N'KhanhPDHE163189@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163229', N'LocCXHE163229', N'Cao', N'Xuân', N'Lộc', N'LocCXHE163229@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163253', N'MaiNTTHE163253', N'Nguyễn', N'Thị Tuyết', N'Mai', N'MaiNTTHE163253@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163324', N'DatTTHE163324', N'Trần', N'Tiến', N'Đạt', N'DatTTHE163324@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163340', N'ThuTVHE163340', N'Trần', N'Việt', N'Thu', N'ThuTVHE163340@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163350', N'AnhNLVHE163350', N'Nguyễn', N'Lê Việt', N'Anh', N'AnhNLVHE163350@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163366', N'VinhNTHE163366', N'Nguyễn', N'Thế', N'Vinh', N'VinhNTHE163366@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163386', N'KhaiDDHE163386', N'Đỗ', N'Đức', N'Khải', N'KhaiDDHE163386@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163387', N'LongNTHE163387', N'Nguyễn', N'Thành', N'Long', N'LongNTHE163387@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163390', N'DatNDHE163390', N'Nguyễn', N'Doãn', N'Đạt', N'DatNDHE163390@fpt.edu.vn')
GO
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163411', N'BachLCHE163411', N'Lê', N'Công', N'Bách', N'BachLCHE163411@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163419', N'AnhNVHE163419', N'Nguyễn', N'Vương', N'Anh', N'AnhNVHE163419@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163428', N'TrangDPHE163428', N'Dương', N'Phúc', N'Tráng', N'TrangDPHE163428@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163444', N'DucDHHE163444', N'Dương', N'Hải', N'Đức', N'DucDHHE163444@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163488', N'ManhNVHE163488', N'Nguyễn', N'Văn', N'Mạnh', N'ManhNVHE163488@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163519', N'ManhDNHE163519', N'Đỗ', N'Như', N'Mạnh', N'ManhDNHE163519@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163538', N'HuyNTDHE163538', N'Nguyễn', N'Trọng Đức', N'Huy', N'HuyNTDHE163538@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163585', N'VuNTHE163585', N'Nguyễn', N'Trung', N'Vũ', N'VuNTHE163585@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163594', N'TungLVHE163594', N'Lưu', N'Việt', N'Tùng', N'TungLVHE163594@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163614', N'MinhKTHE163614', N'Khuất', N'Tiến', N'Minh', N'MinhKTHE163614@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163615', N'DatNLMHE163615', N'Nguyễn', N'Lê Minh', N'Đạt', N'DatNLMHE163615@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163678', N'ChienHVHE163678', N'Hà', N'Viết', N'Chiến', N'ChienHVHE163678@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163751', N'NamDTHE163751', N'Đinh', N'Thế', N'Nam', N'NamDTHE163751@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163777', N'HoaNDHE163777', N'Nguyễn', N'Đức', N'Hoà', N'HoaNDHE163777@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163781', N'DangNHHE163781', N'Nguyễn', N'Hải', N'Đăng', N'DangNHHE163781@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163884', N'HoangNMHE163884', N'Nguyễn', N'Minh', N'Hoàng', N'HoangNMHE163884@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163937', N'MinhNHHE163937', N'Nguyễn', N'Hoàng', N'Minh', N'MinhNHHE163937@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163971', N'DungNDHE163971', N'Nguyễn', N'Đắc', N'Dũng', N'DungNDHE163971@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE164001', N'DuyNTHE164001', N'Nguyễn', N'Thế', N'Duy', N'DuyNTHE164001@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE164016', N'NguyenPDTHE164016', N'Phạm', N'Danh Trung', N'Nguyên', N'NguyenPDTHE164016@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE169003', N'HuyLNTHE169003', N'Lô', N'Nguyễn Thành', N'Huy', N'HuyLNTHE169003@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HS150072', N'LinhHHHS150072', N'Hứa', N'Hoài', N'Linh', N'LinhHHHS150072@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HS150447', N'NguyetTTAHS150447', N'Trần', N'Thị Ánh', N'Nguyệt', N'NguyetTTAHS150447@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HS153184', N'HienNDHS153184', N'Nguyễn', N'Đức', N'Hiển', N'HienNDHS153184@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HS160522', N'CuongNHHS160522', N'Nguyễn', N'Hùng', N'Cường', N'CuongNHHS160522@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HS160970', N'TungNXHS160970', N'Nguyễn', N'Xuân', N'Tùng', N'TungNXHS160970@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'SE04535', N'MinhTDQSE04535', N'Trần', N'Đặng Quang', N'Minh', N'MinhTDQSE04535@fpt.edu.vn')
GO
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HA160009', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE130904', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE130927', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE140155', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE140647', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE140777', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE140954', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE140986', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE141083', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE141491', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE141683', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE150013', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE150167', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE150469', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE150469', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE150798', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE150819', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE150865', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE150915', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE151158', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE151192', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE151210', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE151282', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE151297', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE151297', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE151297', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE151321', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE151356', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE151366', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE151366', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE151407', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE151407', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE151431', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE153012', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE153257', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE153263', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE153276', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE153306', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE153311', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE153330', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE153527', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE153602', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE153603', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE153622', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE153711', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE153773', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE160085', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE160099', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE160152', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE160328', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE160369', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE160473', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE160531', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE160537', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE160629', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE160643', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE160770', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE160809', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE160853', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161082', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161089', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161149', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161149', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161153', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161201', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161203', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161300', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161318', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161371', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161448', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161496', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161499', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161499', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161530', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161574', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161574', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161574', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161575', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161581', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161637', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161637', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161637', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161697', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161697', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161697', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161699', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161699', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161699', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161701', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161701', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161722', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161827', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161880', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161887', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161888', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161888', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161888', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161928', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161928', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161928', 5)
GO
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161943', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE162004', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163016', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163037', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163054', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163060', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163087', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163088', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163104', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163168', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163189', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163229', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163253', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163324', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163340', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163350', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163366', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163386', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163387', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163390', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163411', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163419', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163428', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163444', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163488', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163519', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163538', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163585', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163585', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163585', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163585', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163585', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163594', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163614', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163615', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163678', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163751', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163777', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163777', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163781', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163884', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163884', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163937', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163937', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163937', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163937', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163937', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163971', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE164001', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE164001', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE164001', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE164001', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE164001', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE164016', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE164016', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE164016', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE164016', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE164016', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE169003', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HS150072', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HS150447', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HS153184', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HS160522', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HS160970', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'SE04535', 5)
GO
INSERT [dbo].[Timeslot] ([TimeslotID], [start], [end]) VALUES (N'Slot 1', CAST(N'07:30:00' AS Time), CAST(N'09:00:00' AS Time))
INSERT [dbo].[Timeslot] ([TimeslotID], [start], [end]) VALUES (N'Slot 2', CAST(N'09:10:00' AS Time), CAST(N'10:40:00' AS Time))
INSERT [dbo].[Timeslot] ([TimeslotID], [start], [end]) VALUES (N'Slot 3', CAST(N'10:50:00' AS Time), CAST(N'12:20:00' AS Time))
INSERT [dbo].[Timeslot] ([TimeslotID], [start], [end]) VALUES (N'Slot 4', CAST(N'12:50:00' AS Time), CAST(N'14:20:00' AS Time))
INSERT [dbo].[Timeslot] ([TimeslotID], [start], [end]) VALUES (N'Slot 5', CAST(N'14:30:00' AS Time), CAST(N'16:00:00' AS Time))
INSERT [dbo].[Timeslot] ([TimeslotID], [start], [end]) VALUES (N'Slot 6', CAST(N'16:10:00' AS Time), CAST(N'17:40:00' AS Time))
INSERT [dbo].[Timeslot] ([TimeslotID], [start], [end]) VALUES (N'Slot 7', CAST(N'17:50:00' AS Time), CAST(N'19:20:00' AS Time))
INSERT [dbo].[Timeslot] ([TimeslotID], [start], [end]) VALUES (N'Slot 8', CAST(N'19:30:00' AS Time), CAST(N'21:00:00' AS Time))
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [fk_StudentSession_Sessin] FOREIGN KEY([SessionID])
REFERENCES [dbo].[Session] ([SessionID])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [fk_StudentSession_Sessin]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [fk_StudentSession_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [fk_StudentSession_Student]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [fk_Group_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [fk_Group_Course]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [fk_Group_Instrutor] FOREIGN KEY([LectureID])
REFERENCES [dbo].[Lecture] ([LectureID])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [fk_Group_Instrutor]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [fk_Session_Group] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Group] ([GroupID])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [fk_Session_Group]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [fk_Session_Room] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Room] ([RoomID])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [fk_Session_Room]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [fk_Session_Timeslot] FOREIGN KEY([TimeslotID])
REFERENCES [dbo].[Timeslot] ([TimeslotID])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [fk_Session_Timeslot]
GO
ALTER TABLE [dbo].[StudentGroup]  WITH CHECK ADD  CONSTRAINT [fk_StudentGroup_Group] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Group] ([GroupID])
GO
ALTER TABLE [dbo].[StudentGroup] CHECK CONSTRAINT [fk_StudentGroup_Group]
GO
ALTER TABLE [dbo].[StudentGroup]  WITH CHECK ADD  CONSTRAINT [fk_StudentGroup_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[StudentGroup] CHECK CONSTRAINT [fk_StudentGroup_Student]
GO
USE [master]
GO
ALTER DATABASE [PRJ301_Assignment] SET  READ_WRITE 
GO

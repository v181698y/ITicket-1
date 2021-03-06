USE [master]
GO
/****** Object:  Database [TicketSys]    Script Date: 2020/12/14 下午 04:19:27 ******/
CREATE DATABASE [TicketSys]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TicketSys', FILENAME = N'D:\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TicketSys.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TicketSys_log', FILENAME = N'D:\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TicketSys_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TicketSys] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TicketSys].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TicketSys] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TicketSys] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TicketSys] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TicketSys] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TicketSys] SET ARITHABORT OFF 
GO
ALTER DATABASE [TicketSys] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TicketSys] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TicketSys] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TicketSys] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TicketSys] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TicketSys] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TicketSys] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TicketSys] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TicketSys] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TicketSys] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TicketSys] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TicketSys] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TicketSys] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TicketSys] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TicketSys] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TicketSys] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TicketSys] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TicketSys] SET RECOVERY FULL 
GO
ALTER DATABASE [TicketSys] SET  MULTI_USER 
GO
ALTER DATABASE [TicketSys] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TicketSys] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TicketSys] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TicketSys] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TicketSys] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TicketSys] SET QUERY_STORE = OFF
GO
USE [TicketSys]
GO
/****** Object:  Table [dbo].[Activity]    Script Date: 2020/12/14 下午 04:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activity](
	[ActivityID] [int] IDENTITY(1,1) NOT NULL,
	[ActivityName] [nvarchar](50) NOT NULL,
	[SellerID] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Picture] [nvarchar](50) NOT NULL,
	[Information] [nvarchar](max) NOT NULL,
	[SubCategoryId] [int] NOT NULL,
	[Hostwords] [nvarchar](100) NOT NULL,
	[Map] [varchar](max) NULL,
	[ActivityStatusID] [int] NOT NULL,
	[DistrictId] [int] NOT NULL,
 CONSTRAINT [PK_Activity] PRIMARY KEY CLUSTERED 
(
	[ActivityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActivityFailedReason]    Script Date: 2020/12/14 下午 04:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityFailedReason](
	[ActivityFailedReasonID] [int] IDENTITY(1,1) NOT NULL,
	[FailedReason] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ActivityFailedReason] PRIMARY KEY CLUSTERED 
(
	[ActivityFailedReasonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActivityFavourite]    Script Date: 2020/12/14 下午 04:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityFavourite](
	[ActivityFavouriteId] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[ActivityId] [int] NOT NULL,
 CONSTRAINT [PK_ActivityFavourite] PRIMARY KEY CLUSTERED 
(
	[ActivityFavouriteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActivityStatus]    Script Date: 2020/12/14 下午 04:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityStatus](
	[ActivityStatusID] [int] NOT NULL,
	[ActivityStatusName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ActivityStatus] PRIMARY KEY CLUSTERED 
(
	[ActivityStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ad_Article_Activity]    Script Date: 2020/12/14 下午 04:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ad_Article_Activity](
	[AdID] [int] IDENTITY(1,1) NOT NULL,
	[ArticleID] [int] NOT NULL,
	[ActivityID] [int] NOT NULL,
 CONSTRAINT [PK_Ad_Article_Activity] PRIMARY KEY CLUSTERED 
(
	[AdID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Article]    Script Date: 2020/12/14 下午 04:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[ArticleID] [int] IDENTITY(1,1) NOT NULL,
	[ArticleTitle] [nvarchar](50) NOT NULL,
	[ArticleContent] [nvarchar](max) NOT NULL,
	[MemberID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Picture] [nvarchar](max) NULL,
	[ArticleCategoryID] [int] NOT NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[ArticleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Article_Emotion]    Script Date: 2020/12/14 下午 04:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article_Emotion](
	[ArticleEmotionId] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[ArticleId] [int] NOT NULL,
	[ActionId] [int] NOT NULL,
 CONSTRAINT [PK_Emtion] PRIMARY KEY CLUSTERED 
(
	[ArticleEmotionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Article_Report]    Script Date: 2020/12/14 下午 04:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article_Report](
	[Article_ReportId] [int] IDENTITY(1,1) NOT NULL,
	[ArticleId] [int] NOT NULL,
	[MemberId] [int] NOT NULL,
	[ReportId] [int] NOT NULL,
 CONSTRAINT [PK_Article_Report] PRIMARY KEY CLUSTERED 
(
	[Article_ReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArticleCategories]    Script Date: 2020/12/14 下午 04:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleCategories](
	[ArticleCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[ArticleCategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ArticleCategories] PRIMARY KEY CLUSTERED 
(
	[ArticleCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BanLIst]    Script Date: 2020/12/14 下午 04:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BanLIst](
	[BanId] [int] IDENTITY(1,1) NOT NULL,
	[BanMemberId] [int] NOT NULL,
	[AdminMemberId] [int] NOT NULL,
	[Reason] [nvarchar](50) NOT NULL,
	[EndTime] [datetime] NOT NULL,
 CONSTRAINT [PK_BanLIst] PRIMARY KEY CLUSTERED 
(
	[BanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2020/12/14 下午 04:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 2020/12/14 下午 04:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 2020/12/14 下午 04:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[CommentMemberID] [int] NOT NULL,
	[CommentActivityId] [int] NOT NULL,
	[CommentContent] [nvarchar](300) NOT NULL,
	[CommentScore] [int] NOT NULL,
	[CommentDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Districts]    Script Date: 2020/12/14 下午 04:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Districts](
	[DistrictId] [int] IDENTITY(1,1) NOT NULL,
	[DistrictName] [nvarchar](50) NOT NULL,
	[PostCode] [varchar](10) NOT NULL,
	[CityId] [int] NOT NULL,
 CONSTRAINT [PK_Districts] PRIMARY KEY CLUSTERED 
(
	[DistrictId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmotionAction]    Script Date: 2020/12/14 下午 04:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmotionAction](
	[EmotionActionId] [int] IDENTITY(1,1) NOT NULL,
	[EmotionActionName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_EmotionAction] PRIMARY KEY CLUSTERED 
(
	[EmotionActionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 2020/12/14 下午 04:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[MemberID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IDentityNumber] [char](10) NULL,
	[Passport] [varchar](20) NULL,
	[NickName] [nvarchar](50) NOT NULL,
	[BirthDate] [datetime] NULL,
	[Phone] [char](10) NULL,
	[Password] [nvarchar](50) NULL,
	[Point] [int] NOT NULL,
	[Address] [nvarchar](100) NULL,
	[MemberRoleId] [int] NOT NULL,
	[Icon] [nvarchar](max) NULL,
	[Sex] [bit] NULL,
	[DistrictId] [int] NULL,
	[RegisterCheckCode] [varchar](50) NULL,
	[provider] [nvarchar](50) NULL,
	[providerFB] [bit] NULL,
	[providerGO] [bit] NULL,
 CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberMissionStatusList]    Script Date: 2020/12/14 下午 04:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberMissionStatusList](
	[MissionStatusID] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [int] NOT NULL,
	[MissionID] [int] NOT NULL,
	[DateTime] [date] NOT NULL,
	[IsCompleted] [bit] NOT NULL,
 CONSTRAINT [PK_MemberMissionStatusList] PRIMARY KEY CLUSTERED 
(
	[MissionStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberRole]    Script Date: 2020/12/14 下午 04:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberRole](
	[MemberRoleId] [int] IDENTITY(1,1) NOT NULL,
	[MemberRoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MemberRole] PRIMARY KEY CLUSTERED 
(
	[MemberRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Missions]    Script Date: 2020/12/14 下午 04:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Missions](
	[MissionID] [int] IDENTITY(1,1) NOT NULL,
	[MissionName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[Reward] [int] NOT NULL,
	[Difficulty] [int] NOT NULL,
	[EndDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Missions] PRIMARY KEY CLUSTERED 
(
	[MissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Detail]    Script Date: 2020/12/14 下午 04:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Detail](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[TicketId] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Discount] [numeric](3, 2) NOT NULL,
 CONSTRAINT [PK_Order_Detail] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2020/12/14 下午 04:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[DistrictId] [int] NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[OrderStatus] [bit] NOT NULL,
	[OrderGuid] [varchar](20) NOT NULL,
	[PayPoint] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reply]    Script Date: 2020/12/14 下午 04:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reply](
	[ReplyID] [int] IDENTITY(1,1) NOT NULL,
	[ReplyContent] [nvarchar](50) NOT NULL,
	[MemberID] [int] NOT NULL,
	[ReplyDate] [datetime] NOT NULL,
	[ArticleID] [int] NOT NULL,
 CONSTRAINT [PK_Reply] PRIMARY KEY CLUSTERED 
(
	[ReplyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reply_Emotion]    Script Date: 2020/12/14 下午 04:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reply_Emotion](
	[ReplyEmotionId] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[ReplyId] [int] NOT NULL,
	[ActionId] [int] NOT NULL,
 CONSTRAINT [PK_Reply_Emotion] PRIMARY KEY CLUSTERED 
(
	[ReplyEmotionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reply_Report]    Script Date: 2020/12/14 下午 04:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reply_Report](
	[Reply_ReportId] [int] IDENTITY(1,1) NOT NULL,
	[ReportId] [int] NOT NULL,
	[MemberId] [int] NOT NULL,
	[ReplyId] [int] NOT NULL,
 CONSTRAINT [PK_Reply_Report] PRIMARY KEY CLUSTERED 
(
	[Reply_ReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report]    Script Date: 2020/12/14 下午 04:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[ReportId] [int] IDENTITY(1,1) NOT NULL,
	[ReportReason] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Report] PRIMARY KEY CLUSTERED 
(
	[ReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seller]    Script Date: 2020/12/14 下午 04:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seller](
	[SellerID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](50) NOT NULL,
	[TaxIDNumber] [char](8) NOT NULL,
	[SellerHomePage] [nvarchar](50) NULL,
	[SellerPhone] [nvarchar](50) NOT NULL,
	[SellerDeccription] [nvarchar](max) NULL,
	[MemberId] [int] NOT NULL,
	[fPass] [bit] NULL,
	[fFileName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Seller] PRIMARY KEY CLUSTERED 
(
	[SellerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 2020/12/14 下午 04:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCart](
	[ShoppingCartID] [int] IDENTITY(1,1) NOT NULL,
	[TicketID] [int] NOT NULL,
	[MemberID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_ShoppingCart] PRIMARY KEY CLUSTERED 
(
	[ShoppingCartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShortMessage]    Script Date: 2020/12/14 下午 04:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShortMessage](
	[ShortMessageID] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [int] NOT NULL,
	[MessageContent] [text] NOT NULL,
 CONSTRAINT [PK_ShortMessage] PRIMARY KEY CLUSTERED 
(
	[ShortMessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategories]    Script Date: 2020/12/14 下午 04:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategories](
	[SubCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[SubCategoryName] [nvarchar](50) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[SearchedTime] [int] NOT NULL,
 CONSTRAINT [PK_SubCategories] PRIMARY KEY CLUSTERED 
(
	[SubCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subscribes]    Script Date: 2020/12/14 下午 04:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscribes](
	[SubcribeID] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [int] NOT NULL,
	[SellerID] [int] NOT NULL,
 CONSTRAINT [PK_Subscribes] PRIMARY KEY CLUSTERED 
(
	[SubcribeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketCategory]    Script Date: 2020/12/14 下午 04:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketCategory](
	[TicketCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[TicketCategoryName] [nvarchar](5) NOT NULL,
	[ActivityId] [int] NOT NULL,
 CONSTRAINT [PK_TicketCategory] PRIMARY KEY CLUSTERED 
(
	[TicketCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketGroupDetail]    Script Date: 2020/12/14 下午 04:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketGroupDetail](
	[TicketGroupDetailId] [int] IDENTITY(1,1) NOT NULL,
	[TicketGroupId] [int] NOT NULL,
	[ActivityId] [int] NOT NULL,
 CONSTRAINT [PK_TicketGroupDetail] PRIMARY KEY CLUSTERED 
(
	[TicketGroupDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketGroups]    Script Date: 2020/12/14 下午 04:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketGroups](
	[TicketGroupId] [int] IDENTITY(1,1) NOT NULL,
	[TicketGroupName] [nvarchar](50) NOT NULL,
	[TicketGroupDiscount] [numeric](3, 2) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_TicketGroups] PRIMARY KEY CLUSTERED 
(
	[TicketGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketQRCodes]    Script Date: 2020/12/14 下午 04:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketQRCodes](
	[QRCodeId] [int] IDENTITY(1,1) NOT NULL,
	[QRCode] [nvarchar](50) NOT NULL,
	[OrderDetailId] [int] NOT NULL,
 CONSTRAINT [PK_TicketQRCodes] PRIMARY KEY CLUSTERED 
(
	[QRCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 2020/12/14 下午 04:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[TicketID] [int] IDENTITY(1,1) NOT NULL,
	[TicketCategoryId] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[UnitsInStock] [int] NOT NULL,
	[ActivityID] [int] NOT NULL,
	[TicketTimeId] [int] NOT NULL,
	[Discount] [numeric](3, 2) NOT NULL,
 CONSTRAINT [PK_Tickets] PRIMARY KEY CLUSTERED 
(
	[TicketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketTimes]    Script Date: 2020/12/14 下午 04:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketTimes](
	[TicketTimeId] [int] IDENTITY(1,1) NOT NULL,
	[TicketTime] [datetime] NOT NULL,
	[ActivityId] [int] NOT NULL,
 CONSTRAINT [PK_TicketTimes] PRIMARY KEY CLUSTERED 
(
	[TicketTimeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Activity] ON 

INSERT [dbo].[Activity] ([ActivityID], [ActivityName], [SellerID], [Description], [Address], [Picture], [Information], [SubCategoryId], [Hostwords], [Map], [ActivityStatusID], [DistrictId]) VALUES (36, N'樂在星弦音樂會', 5, N'長榮交響樂團將於12月17日(星期四晚上七時三十分，假台北國際會議中心演出長榮航空貴賓之夜-樂在星弦音樂會，指揮由長榮交響樂團駐團指揮莊文貞擔任，樂團將與歌手彭佳慧、蕭煌奇演出舊夢、自從、鹿港小鎮、愛作夢的人、候鳥、好好先生，樂團也將演出葛令卡：《盧斯蘭與魯蜜拉》序曲…等古典小品，節目精彩可期。

 

曲目：

《盧斯蘭與魯蜜拉》序曲、舊夢、自從、鹿港小鎮、愛作夢的人、候鳥、好好先生…等', N'台北國際會議中心大會堂', N'cf641fef-b14c-4f5e-9f43-c74ee8005e93.png', N'<h4>節目折扣優惠</h4><p><strong>刷元大銀行白金卡級以上、國泰世華(世界卡、尊榮御璽卡、尊榮白金卡、凰鳳鈦金卡)、中國信託信用卡、上海銀行卡、兆豐銀行信用卡卡友可享8折優惠。</strong></p><p><strong>國泰世華(普卡、金卡) 、台新銀行卡友9折。</strong></p><p><strong>功學社之友8折、&nbsp;長榮航空「無限萬哩遊」會員、長榮桂冠酒店房客8折。</strong></p><p><strong>身心障礙票及其必要陪同者一人5折、敬老票5折、學生憑證5折。</strong></p><h4><strong>注意事項</strong></h4><p><strong>配合防疫政策入場需配戴口罩</strong></p>', 29, N'長榮交響樂團將於12月17日(星期四晚上七時三十分，假台北國際會議中心演出長榮航空貴賓之夜-樂在星弦音樂會', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3615.0187710688574!2d121.5584739650062!3d25.033437033972618!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442abb61ab3d33f%3A0xab0d0f7ac395bff4!2z5Y-w5YyX5ZyL6Zqb5pyD6K2w5Lit5b-DKFRJQ0Mp!5e0!3m2!1szh-TW!2stw!4v1607859562224!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 1, 15)
INSERT [dbo].[Activity] ([ActivityID], [ActivityName], [SellerID], [Description], [Address], [Picture], [Information], [SubCategoryId], [Hostwords], [Map], [ActivityStatusID], [DistrictId]) VALUES (37, N'波哥雷里奇鋼琴獨奏會', 5, N'「無論傳統或反叛，只要有心，你會聽見波哥雷里奇，以及他永遠令人驚奇的藝術。」─焦元溥
★ 1978年，贏得義大利Casagrande鋼琴大賽首獎
★ 1980年蕭邦大賽，阿格麗希紅顏一怒為奇才，驚天轉身點亮了波哥雷里奇的萬丈光芒
★ 1981年，於卡內基音樂廳舉行個人獨奏，以巨大成功奠定其巨匠聲望，登上全球樂壇之巔
★ 1988年，被聯合國教科文組織遴選為「親善大使」
★ 千錘百鍊的完美技巧與獨特音樂性，風靡全球樂迷
★ 數十年來魅力不減，過往來台場場轟動，迴響熱烈！

反璞歸真的指尖鋒芒，阿格麗希欽點的天才鋼琴家 ─ 波哥雷里奇
1980年的蕭邦鋼琴大賽，因波哥雷里奇未入圍決賽，阿格麗希紅顏一怒為奇才，辭去評審職務，讓這位天才鋼琴家的傳奇故事，就此展開。', N'衛武營國家藝術文化中心 音樂廳', N'f99bb599-c217-4b74-a123-6f83194b4905.png', N'<p>【曲目介紹】<br>&nbsp;</p><p><strong>蕭邦（1810-1849）</strong></p><p>三首馬祖卡舞曲，作品59</p><p><i>Three Mazurkas</i>, Op. 59</p><p><br>第三號B小調鋼琴奏鳴曲，作品58</p><p>Sonata No. 3 in B minor, Op. 58</p><p><br>~ 中場休息 Intermission ~</p><p><br>降D大調搖籃曲，作品57</p><p><i>Berceuse</i> in D-flat major, Op. 57</p><p><br>F小調幻想曲，作品49</p><p><i>Fantaisie</i> in F minor, Op. 49</p><p><br>降A大調波蘭幻想曲，作品61</p><p><i>Polonaise-Fantaisie</i> in A-flat major, Op. 61</p><p>【演出者介紹】</p><p>鋼琴／波哥雷里奇</p><p>1958年出生於貝爾格勒，身為音樂家的兒子，波哥雷里奇從七歲開始接受音樂教育，並於十歲舉行第一場個人音樂會。自幼展現了不凡的天賦，他受邀到莫斯科繼續學習，至莫斯科音樂學院下屬中央音樂學校就讀。然而，真正改變影響他藝術成就的關鍵，是在遇見了傑出的喬治亞鋼琴家和教育家─Alisa Kezeradze之後，兩人在1976年後開始了卓越的合作。因為Alisa，波哥雷里奇重新定義了自己的詮釋，對音樂的獨特見解，加上無懈可擊的技巧，讓他在歷史上佔有一席之地，成為世界一流的鋼琴家。</p>', 32, N'純粹蕭邦，聽見澄澈透明的音樂靈魂,「無論傳統或反叛，只要有心，你會聽見波哥雷里奇，以及他永遠令人驚奇的藝術。」', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3682.802939874963!2d120.34057141469626!3d22.62383278515637!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x346e05eb39cf21eb%3A0x968c444b9b53483c!2z6KGb5q2m54ef5ZyL5a626Jed6KGT5paH5YyW5Lit5b-DIOaoueWGoOWkp-W7sw!5e0!3m2!1szh-TW!2stw!4v1607860288735!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 1, 287)
INSERT [dbo].[Activity] ([ActivityID], [ActivityName], [SellerID], [Description], [Address], [Picture], [Information], [SubCategoryId], [Hostwords], [Map], [ActivityStatusID], [DistrictId]) VALUES (38, N'冰雪奇緣夢幻特展', 5, N'主辦單位：
野獸國股份有限公司、時藝多媒體傳播股份有限公司、啟藝文化創意有限公司、遠雄創藝事業股份有限公司
授權單位：台灣華特迪士尼股份有限公司

展覽日期：2020/12/19(六)-2021/3/1(一) (除夕休館)
開放時間：11:00-20:00 (19:30停止售票及入場)
展覽地點：新光三越台北信義新天地 A11館6樓信義劇場', N'新光三越台北信義新天地 A11館6樓信義劇場', N'eded5ae7-76bc-4d49-9506-f134bc8039a2.png', N'<p>主辦單位：</p><p>野獸國股份有限公司、時藝多媒體傳播股份有限公司、啟藝文化創意有限公司、遠雄創藝事業股份有限公司</p><p>授權單位：台灣華特迪士尼股份有限公司</p><p>展覽日期：2020/12/19(六)-2021/3/1(一) (除夕休館)</p><p>開放時間：11:00-20:00 (19:30停止售票及入場)</p><p>展覽地點：新光三越台北信義新天地 A11館6樓信義劇場</p><p>節目票價</p><p>2020/10/28-2020/11/10 早鳥單人票230元</p><p>2020/11/11-2020/12/18 預售單人票250元&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p><p>2020/12/19-2021/03/01 展期單人票350元</p><p>&nbsp;</p><p>【現場票價】</p><p>全票350元： 一般民眾</p><p>優待票300元： 3歲以上兒童及本國學生</p><p>特惠票175元： 65歲(含)以上年長者或身心障礙者之陪同者</p><p>親子票499元： 一位成人及一位3歲(含)以上未滿12歲之兒童</p><p><br>【免票資格】</p><p>1.持有身心障礙手冊之民眾本人，入場需出示正本證件。</p><p>2.未滿3歲之兒童(108年以後出生)，需出示正本證件，並由至少一位成人持票陪同入場。</p><p>※未滿3歲兒童的年齡判定：109年入場，106年(含)後出生者；110年入場，107年(含)後出生者。<br><br>※未滿3歲兒童的年齡判定：109年入場，106年(含)後出生者；110年入場，107年(含)後出生者。</p>', 38, N'主辦單位：
野獸國股份有限公司、時藝多媒體傳播股份有限公司、啟藝文化創意有限公司、遠雄創藝事業股份有限公司
授權單位：台灣華特迪士尼股份有限公司', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.9266165199933!2d121.56508741474708!3d25.03656433397111!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442abba758ec241%3A0x6aaa5046d3d70a3a!2z5paw5YWJ5LiJ6LaK5Y-w5YyX5L-h576p5paw5aSp5ZywQTEx!5e0!3m2!1szh-TW!2stw!4v1607860908834!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 1, 15)
INSERT [dbo].[Activity] ([ActivityID], [ActivityName], [SellerID], [Description], [Address], [Picture], [Information], [SubCategoryId], [Hostwords], [Map], [ActivityStatusID], [DistrictId]) VALUES (39, N'大昆蟲展', 5, N'歡迎來到英賽克特王國(InsectKingdom)
一場結合生活、體驗、驚奇、寓教於樂最優質大型展覽
穿梭蟲洞探索未知的『甲』想世界。
五大展區的親密接觸，特別規劃大型實境籠形觀察室，
你就是置身其中的大昆蟲！身歷其境探訪英賽克特王國。

Zone1 蟲洞密道
穿梭人類與蟲蟲王國的秘密通道，在這裡將熟悉日常蟲蟲的生態，和蝴蝶，瓢蟲及甲蟲當朋友。

Zone2 戰鬥大草原
出了密道伴隨昆蟲鳴聲音樂歡迎進入蟲蟲武士們的練功場，和草原中的巨型鍬蟲武士及赫克力士長戟大兜蟲武士來個不期而遇拍照打卡，體驗一下蟲蟲是如何在草原走路練功。

Zone3 王者聖殿
這裡是蟲蟲族人的聖殿，來場與蟲蟲族人的零距離見面會，王國裡有稀有的甲蟲貴族統治者在這裡與大家互動，讓你一睹牠們的風采。更別錯過參觀已經安息蟲族的英雄墓園，蟲蟲英雄都被尊敬地封存在水晶棺木𥚃。

Zone4 聖甲夜光城
城中的黑夜裡好熱鬧！夜行蟲蟲們正在舉行螢光派對，化身聖甲金龜推著發光的彩色明珠配合跳動的音樂一起PARTY !

Zone5 英賽克特學院
學院裡到處可見蟲蟲的藝術品丶蟲蟲的音樂、賞心悅目的蟲蟲萬花筒，離開前需接受英賽克特學院蟲蟲博士們的挑戰，回答正確的人才能領到認證的「蟲蟲勳章」。', N'國立科學工藝博物館 第二特展廳', N'0c4e2c54-3427-4be9-8b69-bbbc84db2474.png', N'<p>-展期｜2020.12.25-2021.3.1</p><p>-地點｜國立科學工藝博物館第二特展廳</p><p>-開放時間｜週一至週日9:00-17:00 / 除夕休館一日</p><p>-主辦單位｜總經銷｜票倉國際科技（股）</p><p>歡迎來到英賽克特王國(InsectKingdom)</p><p>一場結合生活、體驗、驚奇、寓教於樂最優質大型展覽</p><p>穿梭蟲洞探索未知的『甲』想世界。</p><p>五大展區的親密接觸，特別規劃大型實境籠形觀察室，</p><p>你就是置身其中的大昆蟲！身歷其境探訪英賽克特王國。</p><p>&nbsp;</p><p><strong>Zone1 蟲洞密道</strong></p><p>穿梭人類與蟲蟲王國的秘密通道，在這裡將熟悉日常蟲蟲的生態，和蝴蝶，瓢蟲及甲蟲當朋友。</p><p>&nbsp;</p><p><strong>Zone2 戰鬥大草原</strong></p><p>出了密道伴隨昆蟲鳴聲音樂歡迎進入蟲蟲武士們的練功場，和草原中的巨型鍬蟲武士及赫克力士長戟大兜蟲武士來個不期而遇拍照打卡，體驗一下蟲蟲是如何在草原走路練功。<br>&nbsp;</p><p><strong>Zone3 王者聖殿</strong></p><p>這裡是蟲蟲族人的聖殿，來場與蟲蟲族人的零距離見面會，王國裡有稀有的甲蟲貴族統治者在這裡與大家互動，讓你一睹牠們的風采。更別錯過參觀已經安息蟲族的英雄墓園，蟲蟲英雄都被尊敬地封存在水晶棺木𥚃。</p><p>&nbsp;</p><p><strong>Zone4 聖甲夜光城</strong></p><p>城中的黑夜裡好熱鬧！夜行蟲蟲們正在舉行螢光派對，化身聖甲金龜推著發光的彩色明珠配合跳動的音樂一起PARTY !<br>&nbsp;</p><p><strong>Zone5 英賽克特學院</strong></p><p>學院裡到處可見蟲蟲的藝術品丶蟲蟲的音樂、賞心悅目的蟲蟲萬花筒，離開前需接受英賽克特學院蟲蟲博士們的挑戰，回答正確的人才能領到認證的「蟲蟲勳章」。</p><h4><strong>節目票價 Price</strong></h4><p><br>早鳥票220元(即日起至2020/12/24)</p><p>全票300元(2020/12/25-3/1)</p>', 37, N'歡迎來到英賽克特王國(InsectKingdom)
一場結合生活、體驗、驚奇、寓教於樂最優質大型展覽', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1841.1848444075495!2d120.32111565803508!3d22.64000104628701!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x346e04c2f0c9adf3%3A0x1a2756e5ee25f515!2z5ZyL56uL56eR5a245bel6Jed5Y2a54mp6aSo!5e0!3m2!1szh-TW!2stw!4v1607861749558!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 1, 269)
INSERT [dbo].[Activity] ([ActivityID], [ActivityName], [SellerID], [Description], [Address], [Picture], [Information], [SubCategoryId], [Hostwords], [Map], [ActivityStatusID], [DistrictId]) VALUES (40, N'聲音的建築展', 5, N'躍升日本甚至是全球設計界矚目的世界百大美術館—— 21_21 DESIGN SIGHT，睽違四年與啟藝再度合作。設計雜誌評選為 2020 全球必看的展覽，如果你曾被《 單位展 》打動，就絕對不能錯過。

 ✈ ✈ 東京移展到台北 ✈ ✈ 完整還原讓日本人驚艷的音樂空間

▩ 掀開感官！25 公尺寬巨幅投影首登場，親自走進視覺藝術的驚喜
▩ 解構聲音！實驗性音樂鬼才創作，搭配視覺藝術構建音樂建築空間
▩ 震撼登台！將習以為常的細節徹底翻轉，用設計角度解剖聲音與影像

打造這場超乎聲音與藝術純粹的音樂空間，以不同影像重複表現同一首樂曲，來構建出一場視覺與聽覺完美熔接的聲音建築展，邀請你親自走進超現實場域！', N'華山1914文化創意產業園區', N'0f2c6128-c34e-4df2-b219-91a3957d68f4.png', N'<p><strong>令人驚嘆的背後策展團隊</strong></p><p>▩ 中村勇吾｜展覽總監</p><p>譽為日本 Flash 教父，其作品被收入在巴黎龐畢度中心、維也納藝術村、倫敦設計博物館中。更與 UNIQLO 有著許多合作。由於他的建築設計背景，將空間與力學等概念注入 Flash 中，創造了許多互動的新模式，也成為全球 Flash 設計人員競相效仿的對象。</p><p><br>▩ 片山正通｜展場設計</p><p>有「空間潮流教父」之稱，曾操刀過數個國際知名的品牌空間，包含知名潮牌A BATHING APE的日本以及全球各分店、UNIQLO日本&amp;全球旗艦店、NIKE日本原宿東京旗艦店等，近年還為Lexus打造全新概念店Intersect by Lexus。引人入勝的空間策略，不切割有形的空間，而是切分無形的時間，在 25 公尺寬的巨幅投影打造的沉浸式劇院內，享受一場藝術與娛樂兼具的大秀。</p><p><br>▩ 北山雅和｜展覽主視覺 &amp; 黑膠裝幀設計</p><p>以黑色為基底，將「 AUDIO ARCHITECTURE 」一詞用線條的形式拆解、翻玩，光暈與格線層疊效果，如同黑暗深處透出光芒的設計，讓字體轉換為具空間感的結構，呼應主題。從展場4 米高巨型動態 LOGO到展覽限定版黑膠的設計，皆完美詮釋像建築一般的多層次結構。</p><p><br>究竟 “AUDIO ARHITECTURE” 他們將如何賦予聲音轉化為視覺藝術，光是看圖不夠過癮，唯有自己親身體驗，才能真正感受與音樂建築空間對話的過程。期待每個熱愛音樂和設計的靈魂，都能在這個期間限定的聲音建築內，找到一個舒適的角落，弛放感官、享受聯覺的快感。</p>', 36, N'躍升日本甚至是全球設計界矚目的世界百大美術館—— 21_21 DESIGN SIGHT，睽違四年與啟藝再度合作。設計雜誌評選為 2020 全球必看的展覽', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.6861294626938!2d121.52660381474732!3d25.044723633967326!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442a96523e0246d%3A0xf1c9276707165c71!2z6I-v5bGxMTkxNOaWh-WMluWJteaEj-eUoualreWckuWNgA!5e0!3m2!1szh-TW!2stw!4v1607862232110!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 1, 9)
INSERT [dbo].[Activity] ([ActivityID], [ActivityName], [SellerID], [Description], [Address], [Picture], [Information], [SubCategoryId], [Hostwords], [Map], [ActivityStatusID], [DistrictId]) VALUES (41, N'黏黏怪物研究所', 5, N'繼2017年「SML EXPO 黏黏怪物研究所十周年展」大獲好評，韓國大勢設計團隊「STICKY MONSTER LAB(黏黏怪物研究所)」睽違四年，帶來全新主題展覽「黏黏怪物研究所：登入計劃特展(SML WONDER EXPO)」，內含8大展覽主題以及免費入場快閃店，帶領觀眾揮別2020年所有的陰霾，一同登入黏黏怪物的虛擬奇幻世界!



////// 已登入 請享受 //////

每個人都是獨一無二的怪物。登入這個世界，你將慢慢變成黏黏怪物，學習Monster的聲音、變成Monster的外貌，進入Monster的城市、感受Monster的生活，看這世界的繁華城鎮、溫暖日常，感受最療癒的日落及照亮心靈的SML旋轉燈塔。體驗黏黏怪物的世界，找到專屬你的怪物模樣。

期間限定快閃店，免費入場參觀!

延續黏黏怪物研究所：登入計劃特展風格，奇幻開張!

除了快閃店限定公仔、SML限量盲盒，還有超過100樣期間限定商品，應有盡有，不管你是潮流boy、時尚girl，還是喜歡寫手帳的少男少女， SML快閃店都能滿足你的小慾望。

 

#錢沒有不見，只是變成你喜歡的樣子陪伴你❤

#讓SML陪伴你', N'松山文創園區 一號倉庫', N'bca11e21-e718-40eb-9111-3d2b51f7b0ef.png', N'<p><strong>#變身怪物第一步</strong></p><p><strong>聽見黏黏怪物的聲音</strong></p><p>變身成為黏黏怪物的重要步驟：學會Monster的聲音。你將進入Monster的身體裡，探索他們的內部構造、解構他們的聲音訊息，要變身成為黏黏怪物，請務必學會屬於Monster的語言。</p><p><strong>#變身怪物第二步</strong></p><p><strong>房子裡的的房子</strong></p><p>每棟建築物都是一隻擁有自我意識的MONSTER!在透明玻璃建成的聚落裡面，再小的房子都能找到自己的庇護所。等身大的房屋也能讓您親自拜訪一探究竟！</p><p><strong>#變身怪物第三步</strong></p><p><strong>怪物大腳丫</strong></p><p>有迷你的Monster，就一定有超巨型Monster，在這世界裡，你甚至只能看到他的腳，</p><p>但不知道為什麼，來到這裡的人類，都喜歡臣服在他的腳底下……希望你也一樣。</p><p><strong>#變身怪物第四步</strong></p><p><strong>放空chill 日落</strong></p><p>黏黏怪物世界中最療癒的存在！來到這區的Monster也會不自覺的一直盯著中間的夕陽看彷彿只要在暖暖的夕陽旁邊就可以得到舒壓的能量，邀請您一起坐在日落周圍，享受自在放鬆的時光</p><p><strong>#變身怪物第五步</strong></p><p><strong>SWE旋轉塔</strong></p><p>這座塔是黏黏怪物們的精神指標，盯著緩慢轉動的塔，彷彿就可以得到源源不絕的能量。</p><p>黏黏怪物的世界無奇不有，想看更多，趕快前往<strong>黏黏怪物研究所：登入計劃特展</strong>，等你來探索!</p>', 55, N'繼2017年「SML EXPO 黏黏怪物研究所十周年展」大獲好評，韓國大勢設計團隊「STICKY MONSTER LAB(黏黏怪物研究所)」睽違四年', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.6956760086587!2d121.55732161474732!3d25.044399783967485!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442abc0ac49edb7%3A0xb13d35d6bafc3576!2z5p2-5bGx5paH5Ym15ZyS5Y2A44Sn6Jmf5YCJ5bqr!5e0!3m2!1szh-TW!2stw!4v1607862776118!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 1, 15)
INSERT [dbo].[Activity] ([ActivityID], [ActivityName], [SellerID], [Description], [Address], [Picture], [Information], [SubCategoryId], [Hostwords], [Map], [ActivityStatusID], [DistrictId]) VALUES (42, N'戽斗恐龍叢林樂園', 5, N'『吼！吼！吼！』這是什麼聲音呢？台南有大事要發生了！？？

原來是恐龍啊！巨大的身形現身在古都台南中的一座神秘叢林樂園，咦！不過他們的下巴好像特別長耶～

大家都看過恐龍，但…「戽斗恐龍」你們看過嗎？！
是不是也被那長長的戽斗下巴給逗樂了呢！

從未見過的超巨型「戽斗恐龍」氣墊樂園，台灣首度震撼登場！

各式各樣巨型「戽斗恐龍」超近距離出現在各位眼前
搭配豐富氣墊遊戲區，讓小朋友能盡情自由跑跳玩耍，勇敢的探索叢林樂園每個角落
當然～不能錯過的是！還能享受被「超巨型戽斗恐龍」包圍的震撼氣息。

還沒計畫今年寒假親子旅遊嗎？
不用擔心啦！來台南旅遊一趟順便讓「戽斗恐龍」陪你一起遊玩！

邀請各位爸爸媽媽和寶貝們來到台南
一起勇闖「戽斗恐龍」的秘密基地！
讓今年的寒假作業留下美好的甜美回憶～！
', N'新光三越 台南西門店 西門廣場', N'c563e13b-dd3b-4fa8-bb5d-f20286b98517.png', N'<p>四大氣墊遊戲區：<br><strong>「戽斗暴龍巨無霸溜滑梯」</strong></p><p><br>高達七公尺的超巨型溜滑梯</p><p>一躍而下，享受溜下超長溜滑梯的瞬間速度快感！</p><p>保證讓孩子們捨不得離開，想一玩再玩！&nbsp;<br>&nbsp;</p><p><strong>「戽斗腕龍叢林大迷宮」</strong><br>走進這座充滿巨大樹木的迷宮中，彷彿來到了一個全新叢林世界</p><p><br>不用害怕，當你迷失方向時</p><p>只要輕輕抬起頭，就可以看到善良的「戽斗腕龍」給你指引出口喔朝著「戽斗腕龍」下巴前方前進吧，就可以順利到達叢林出口！</p><p><strong>「戽斗翼手龍飛天巢穴」</strong><br>在這座飛天巢穴中，有著「戽斗翼手龍」細心呵護的BABY恐龍蛋</p><p>踏入巢穴中，小朋友們可要注意腳步聲喔，輕快躲開即將孵化的恐龍蛋們</p><p>才能抵達「戽斗翼手龍」的秘密基地，秘密基地裡還藏有小翼手龍玩的小溜滑梯喔！</p><p>一起來陪可愛的 BABY 翼手龍玩吧～&nbsp;<br>&nbsp;</p><p><strong>「戽斗劍龍的大背鰭」</strong><br>悄悄的偷偷爬到「戽斗劍龍」的背上可不是一件簡單的挑戰喔！</p><p>要穿越無數茂密的背鰭，還不能驚動「戽斗劍龍」</p><p><br>得要善用小朋友身體的敏捷及勇氣呢！</p><p>邀請各位大小朋友，前往挑戰！</p>', 54, N'『吼！吼！吼！』這是什麼聲音呢？台南有大事要發生了！？？

原來是恐龍啊！巨大的身形現身在古都台南中的一座神秘叢林樂園，咦！不過他們的下巴好像特別長耶', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3672.991452773602!2d120.19692391470366!3d22.9873417849709!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x346e767bf4f993a7%3A0x39dcfbaa57d911d6!2z5paw5YWJ5LiJ6LaK5Y-w5Y2X5paw5aSp5Zyw!5e0!3m2!1szh-TW!2stw!4v1607868095192!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 1, 225)
INSERT [dbo].[Activity] ([ActivityID], [ActivityName], [SellerID], [Description], [Address], [Picture], [Information], [SubCategoryId], [Hostwords], [Map], [ActivityStatusID], [DistrictId]) VALUES (43, N'返校實境體驗展', 5, N'【返校Detention實境體驗展】內容還原自赤燭團隊於2017年1月上市，引起轟動的暢銷懸疑電腦遊戲─《返校Detention》，更是首次挑戰將電腦單機遊戲轉換成實境體驗性質的多元展覽。

展覽還原翠華中學的場景，包含了教室區、廁所區、校長室、音樂教室、輔導室、保健室、無限走廊等實境沉浸式體驗區，體驗者將化身讀書會成員，進入女主角方芮欣的輪迴，結合場景、演員、聲音、光影、氣味讓體驗者走進遊戲中的世界，一邊在詭譎氣氛中尋找真相，一邊感受那個發生在1960年代，寂寞而肅殺的氛圍及背後的秘密，並特別精選遊戲中的重要道具與場景實體化，讓觀眾可進行互動拍照，如：布袋戲台、關押犯人的監牢、象徵女主角方芮欣心境轉換的收音機、傳達自由可貴的紙飛機等，喚起體驗者的心理層思考。

本次活動承襲赤燭團隊開發《返校》的精神要素，讓觀眾能透過不同的體驗方式再次感受這個故事，去認識那個時代、記住那段歷史、珍惜現有的一切。

你能找到真相嗎? 你是忘記了，還是害怕想起來?', N'駁二藝術特區', N'd2eb06e5-7a4f-48e1-96f0-6b20e3717b7a.png', N'<p>線上售票</p><p>2020/11/19~2021/1/11</p><p>•預售票250元</p><p>•四人票900元<br>&nbsp;</p><p>2021/1/12~4/6</p><p>•全票350元</p><p>•雙人票650元</p><p>&nbsp;</p><p>現場售票</p><p>•全票350元：一般身分者適用。</p><p>•優惠票320元：年滿10歲以上、及持大專院校以下有效學生證件者，以當學期註冊章為憑，入場須驗證（碩博士生、社區大學、空中大學及在職進修不適用）。</p><p>•愛心票175元：65歲以上長者(憑證)，身心障礙人士(憑證)及一名必要陪同者適用，須與身障者同時入場。</p><p>•禁止入場：10歲以下兒童，輪椅使用者。</p>', 38, N'【返校Detention實境體驗展】內容還原自赤燭團隊於2017年1月上市，引起轟動的暢銷懸疑電腦遊戲─《返校Detention》', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3682.9061297116036!2d120.27934001469623!3d22.61998028515842!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x346e047620e1c45b%3A0xe6d6d1bd1c764df2!2z6aeB5LqM6Jed6KGT54m55Y2A!5e0!3m2!1szh-TW!2stw!4v1607868616179!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 1, 265)
INSERT [dbo].[Activity] ([ActivityID], [ActivityName], [SellerID], [Description], [Address], [Picture], [Information], [SubCategoryId], [Hostwords], [Map], [ActivityStatusID], [DistrictId]) VALUES (44, N'不可思議怪怪島', 5, N'【不可思議怪怪島】以親子體驗為藍圖 ‧ 打造海、陸、空奇幻場景主題樂園，大朋友、小朋友們，趕快搭上怪怪島專機，準備登島探險囉！

不可思議怪怪島，擁有《火山》、《叢林》、《沼澤》、《山谷》、《海洋》等豐富的自然生態場景，結合各展區場景，傳遞大自然的生態知識，搭配精心設計的冒險任務，讓大朋友、小朋友在挑戰任務的過程中，加深對自然生態、生物的認識，寓教於樂、增進親子關係。', N'華山1914文化創意產業園區 西1、西2館', N'089aedcd-dfd7-43f4-98da-128cd1423294.png', N'<p><strong>●可愛動物島民閃亮登場 ☆☆ 跟島民一起冒險吧！</strong></p><p>轟隆！【不可思議怪怪島】從天而降出現在華山文創園區！！居住在島上的可愛動物島民們，向廣大的小朋友發出召集令！</p><p>快跟著島民們登上怪怪島，探索神秘的冒險地圖吧！</p><p><strong>必玩亮點：</strong></p><p><strong>●怪怪島專機 超大飛機溜滑梯 到底有多高呢？</strong></p><p>想要前往神秘又奇幻的怪怪島，只能搭上唯一的交通工具《怪怪島專機》，搭上專機要仔細聽從★機長波波★<br>的指示，溜下巨大的溜滑梯登上怪怪島，探索島上秘境，展開有趣又刺激的冒險任務吧！</p><p><strong>●瘋狂火山 穿越障礙，蒐集火山能量！</strong></p><p>叢林裡的★國王奇奇★與猴子同伴們最喜歡吃的就是熱帶水果了，可是大家喜歡吃的都不一樣，想要通過叢林，就要分別找出各自喜歡吃的水果，準確餵食喔！</p><p><strong>●沼澤區 快速匍匐前進 才不會陷進去喔！</strong></p><p>黑漆漆的沼澤區，要順利前進，還不被虎視眈眈的沼澤生物盯上，就只能趴下身體，快速的匍匐前進，一定要小心注意，不要陷進去被沼澤吃掉了喔！</p><p><strong>●奇幻海洋 搭上海底列車 帶你認識驚奇的海底生物喔！</strong></p><p><strong>快跟上海洋守護者★救生員鯊鯊★搭上神奇的海底列車，一起認識深海裡的生物，暢遊怪怪島的奇幻海洋吧！還要幫助可愛的小魚們消除海洋的垃圾呦！探險隊員們趕快到怪怪島幫助島上可愛的動物島民吧！</strong></p>', 55, N'【不可思議怪怪島】以親子體驗為藍圖 ‧ 打造海、陸、空奇幻場景主題樂園，大朋友、小朋友們，趕快搭上怪怪島專機，準備登島探險囉！', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.6703892747037!2d121.5254999147472!3d25.045257583967064!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442a97acddfc78b%3A0xf1e5afeb2e84a902!2z6I-v5bGx5paH5Ym15ZyS5Y2AIOe0heejmuWFreWQiOmZouilvzHppKg!5e0!3m2!1szh-TW!2stw!4v1607869188736!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 1, 9)
INSERT [dbo].[Activity] ([ActivityID], [ActivityName], [SellerID], [Description], [Address], [Picture], [Information], [SubCategoryId], [Hostwords], [Map], [ActivityStatusID], [DistrictId]) VALUES (45, N'i-Ride高雄', 5, N'i-Ride讓環島變得更容易了，前往高雄軟體園區i-Ride KAOHSIUNG，暢玩全臺唯一全視角飛行體感遊戲，給您最獨特的環島飛行體驗。

i-Ride結合科技與娛樂的沉浸式體驗，將乘客座椅推進20米巨大球幕中，雙腳懸空隨著載具擺盪，並搭配多種感官特效，打造視覺、聽覺、嗅覺、觸覺與移動等五感體驗，感受翱翔於臺灣絕美的自然景觀與城市巷弄間的樂趣，讓您彷彿親臨真實場景中的各個角落，從天使的視角欣賞全臺各地美景及人文慶典，來趟身歷其境的娛樂飛行旅程。', N'高雄市前鎮區復興四路9號', N'739b3141-00b1-462a-9a77-183ce476d0b8.png', N'<p>取材臺灣豐富的地景及節慶特色，呈現鵝鑾鼻、三仙台、蘭嶼、池上、西螺大橋媽祖繞境及台南鹽水蜂炮等豐富景觀，讓您在短時間內上山下海、造訪數十個最具備「臺灣味」的特色景點！<br>不僅如此，「飛越臺灣」搭配實際錄製聲效、專業編曲配樂，讓每個音符都細膩地傳遞出臺灣景色與當地風俗民情的生命力。</p><p><strong>《飛越澳洲》</strong></p><p>從機艙一躍而下，穿越雲海跟隨跳傘員俯瞰澳洲陸地。<br>一路飛越最知名的大堡礁、十二使徒岩、塔斯馬尼亞搖籃山，<br>追逐狂奔的袋鼠、高速行駛的汽船、享受孤單的重機騎士，以最真實的感受沈浸其中。<br>不論您是否有曾經親自拜訪此地，都能透過「飛越澳洲」體驗最不一樣的文化風情。</p><p><strong>《飛越美國》</strong></p><p>這982萬平方公里遼闊的土地，孕育多樣民族文化與壯麗景觀，<br>自由、民主的核心價值，吸引著世界各地的人來此追逐美國夢。<br>i-Ride旅程飛越一萬六千公里，以老鷹的高度視野，俯瞰這片自由的土地以及勇者的家園。</p><p><strong>《飛越全世界》</strong></p><p>一場奇幻冒險的飛行旅程，<br>俯瞰照耀世界的自由女神；飛過金碧輝煌的杜拜濱海沙漠；<br>倘徉調色盤般的俄羅斯宮廷建築；探索神秘的埃及金字塔；<br>一起用最特別的方式環遊世界！</p>', 54, N'i-Ride讓環島變得更容易了，前往高雄軟體園區i-Ride KAOHSIUNG，暢玩全臺唯一全視角飛行體感遊戲，給您最獨特的環島飛行體驗。', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3683.3148495369433!2d120.29707961469603!3d22.60471498516633!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x346e03779143320b%3A0x165ba6b5b4b9dc86!2zODA26auY6ZuE5biC5YmN6Y6u5Y2A5b6p6IiI5Zub6LevOeiZnw!5e0!3m2!1szh-TW!2stw!4v1607869757249!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 1, 268)
INSERT [dbo].[Activity] ([ActivityID], [ActivityName], [SellerID], [Description], [Address], [Picture], [Information], [SubCategoryId], [Hostwords], [Map], [ActivityStatusID], [DistrictId]) VALUES (46, N'莫斯科古典芭蕾舞團', 5, N'俄羅斯三大芭蕾舞團之一  首度雙城雙舞碼巡演 聖誕鉅獻
莫斯科古典芭蕾舞團 

◎與莫斯科波修瓦劇院、聖彼得堡馬林斯基劇院，並列為俄國三大芭蕾舞團。
◎已在超過二百個俄國城市、以及在五大洲超過三十個國家演出。
◎七十五個芭蕾舞者與三十噸重的舞台布景、超過四千套的服裝，曾巡迴世界各地。
◎2018年首次來台演出，場場爆滿一票難求。', N'臺北國家戲劇院(台北市中正區中山南路21-1號)', N'e9b42052-0767-4587-a55c-5afc96165d6f.png', N'<p>《天鵝湖》是俄國作曲家柴可夫斯基第一部完成的完整芭蕾舞作品，取材於俄羅斯民間故事及德國作家的童話，被稱為「第一次使舞蹈作品具有了音樂的靈魂」。1877年3月4日在莫斯科波修瓦劇院首演，劇中黑白天鵝的雙重角色，及黑天鵝膾炙人口的32鞭轉，皆是每個女舞者都想挑戰的戲碼，更使本劇成為芭蕾舞同義詞，稱得上最受歡迎的古典芭蕾舞碼。</p><p>《胡桃鉗》是柴可夫斯基編寫的另一個芭蕾舞劇，原作為霍夫曼的一部叫作《胡桃鉗與老鼠王》的故事，柴可夫斯基後來根據大仲馬改編的版本加譜了芭蕾舞的音樂，成為現時的所見的版本，它是聖誕節的傳統節目，又被世人稱為聖誕芭蕾，是老少適宜的芭蕾觀看劇碼，其中一幕由花仙子伴著著名的《花之圓舞曲》跳出了一段華爾茲，更是讓世人對《胡桃鉗》耳熟能詳的代表作之一。</p>', 34, N'演出名稱：莫斯科古典芭蕾舞團
主辦單位：聯合數位文創
指定住宿：台北福華大飯店、高雄福華大飯店', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.9438780843943!2d121.51645061474693!3d25.035978583971428!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442a99e1c9b0373%3A0x99b7a63a01e8db42!2z5ZyL5a625oiy5YqH6Zmi!5e0!3m2!1szh-TW!2stw!4v1607870794936!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 1, 9)
INSERT [dbo].[Activity] ([ActivityID], [ActivityName], [SellerID], [Description], [Address], [Picture], [Information], [SubCategoryId], [Hostwords], [Map], [ActivityStatusID], [DistrictId]) VALUES (47, N'光良《今晚我不孤獨》巡迴演唱會', 5, N'光良出道近24年，創作並唱紅了多首主打歌，並一直堅持著自己的音樂夢想。會寫會唱情歌的人很多，但能在平凡中有不平凡的感動，有一點傷感卻又能像老朋友般誠實而直接地觸及你內心深處的感受的只有光良。


從《掌心》、《第一次》、《童話》、《約定》、《是你變了嗎》、一直唱到《回憶裡的瘋狂》、《那些愛過的事》、《九種使用孤獨的正確方式》、《不缺》都是他的內心獨白，都在向人們傳達他內心的情感和心境。同時光良也幫助不少藝人創作和制作歌曲，像劉若英的《我等你》、李心潔的《戀》、梁靜茹的《勇氣》等等。', N'台北小巨蛋', N'66721de1-f1af-40bd-9ed2-525d02a96ab5.png', N'<p><strong>【疫情相關注意事項說明】</strong></p><p><strong>因應COVID-19（新冠肺炎)疫情相關注意事項如下：&nbsp;</strong></p><p><strong>1.本活動為2021年1月的演出活動，目前販售之座位按正常座位銷售，日後隨疫情政策規範調整，主辦單位保有調整活動內容、銷售座位、數量及相關活動配合事項等權利。&nbsp;</strong></p><p><strong>2.本活動會因應政府對疫情的控制與變化所為的行政行為，而適時調整相關資訊與規範，請您諒解與留意。&nbsp;</strong></p><p><strong>3.最新公告或調整說明請密切關注udn瘋活動官網或udn售票網&nbsp;</strong></p><p>&nbsp;</p><p>【超商購票_票券實聯登記說明與超商購票須知】</p><p>★防疫人人有責，請至<a href="https://www.surveycake.com/s/WApYB">線上登記聯絡資訊</a>★</p><p>您好，依據衛生福利部疾病管制署發佈之「『COVID-19（新冠肺炎）』因應指引：公眾集會」所載，集會活動時，建議主辦單位事先掌握參加者的資訊。為遵守政府法令並保障您的權益，若您透過全台7-11 ibon、全家FamiPort或萊爾富Life-ET機台購票，請您完成購票後，務必於<strong>西元2020年11月09日前</strong>至udn瘋活動官網（https://uevent.udnfunlife.com/20200314TPE）登記參加者聯絡資訊。</p><p>屆時主辦單位將依照政府與小巨蛋公告之相關防疫辦法進行可能的調整。主辦單位需要您的聯絡資訊，針對可能的相關調整進行通知說明；若您未完成登記參加者聯絡資訊，將視為同意主辦單位依規範進行相關調整，包含座位、票區的更動。</p><p>本活動會因應政府對疫情的控制與變化所為的行政行為，而適時調整相關資訊與規範，請您諒解與留意。</p><p>＊本次蒐集之個人資料，僅用於主辦單位為提供活動調整通知與防疫措施提醒，得於活動期間蒐集您的個人資料。非經當事人同意，不轉做其他用途，亦不會公佈任何資訊。<br>&nbsp;</p><p>【節目資訊】</p><p>演出日期：2021/01/09 (六)</p><p>演出時間：19:30</p><p>演出地點：台北小巨蛋</p><p>演出地址：台北市松山區南京東路4段2號</p><p>啟售時間：2020/6/8(一)中午12點整</p><p>票　　價：$3800/$3600/$3400/$3000/$2600/$2200/$1600/$800 (全區對號入座)</p><p>主辦單位：udnFunLife 聯合數位文創、XYmusic 星娛音樂</p>', 42, N'像老朋友般熟悉誠實，聲音唱透你我內心的 光良

光良出道近24年，創作並唱紅了多首主打歌，並一直堅持著自己的音樂夢想。', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.4980594538615!2d121.54766211474735!3d25.051102783964343!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442abe81eb85771%3A0x682251d5c6f37a58!2z5Y-w5YyX5bCP5beo6JuL!5e0!3m2!1szh-TW!2stw!4v1607871322108!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 1, 12)
SET IDENTITY_INSERT [dbo].[Activity] OFF
GO
SET IDENTITY_INSERT [dbo].[ActivityFailedReason] ON 

INSERT [dbo].[ActivityFailedReason] ([ActivityFailedReasonID], [FailedReason]) VALUES (1, N'活動名稱')
INSERT [dbo].[ActivityFailedReason] ([ActivityFailedReasonID], [FailedReason]) VALUES (2, N'活動地點')
INSERT [dbo].[ActivityFailedReason] ([ActivityFailedReasonID], [FailedReason]) VALUES (3, N'活動場次時間')
INSERT [dbo].[ActivityFailedReason] ([ActivityFailedReasonID], [FailedReason]) VALUES (4, N'活動描述')
INSERT [dbo].[ActivityFailedReason] ([ActivityFailedReasonID], [FailedReason]) VALUES (5, N'活動資訊')
INSERT [dbo].[ActivityFailedReason] ([ActivityFailedReasonID], [FailedReason]) VALUES (6, N'活動簡介')
INSERT [dbo].[ActivityFailedReason] ([ActivityFailedReasonID], [FailedReason]) VALUES (7, N'活動圖片')
INSERT [dbo].[ActivityFailedReason] ([ActivityFailedReasonID], [FailedReason]) VALUES (8, N'其他')
SET IDENTITY_INSERT [dbo].[ActivityFailedReason] OFF
GO
INSERT [dbo].[ActivityStatus] ([ActivityStatusID], [ActivityStatusName]) VALUES (0, N'未審核')
INSERT [dbo].[ActivityStatus] ([ActivityStatusID], [ActivityStatusName]) VALUES (1, N'上架')
INSERT [dbo].[ActivityStatus] ([ActivityStatusID], [ActivityStatusName]) VALUES (2, N'下架')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (13, N'音樂劇')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (14, N'音樂')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (15, N'舞蹈')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (16, N'展覽')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (17, N'演唱會')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (18, N'戲劇')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (19, N'體育')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (20, N'親子')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (21, N'講座')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (22, N'其他')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Cities] ON 

INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (5, N'台北市')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (6, N'基隆市')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (7, N'新北市')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (8, N'宜蘭縣')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (9, N'桃園市')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (10, N'新竹市')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (11, N'新竹縣')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (12, N'苗栗縣')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (13, N'台中市')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (14, N'彰化縣')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (15, N'南投縣')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (16, N'嘉義市')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (17, N'嘉義縣')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (18, N'雲林縣')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (19, N'台南市')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (20, N'高雄市')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (21, N'澎湖縣')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (22, N'金門縣')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (23, N'屏東縣')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (24, N'台東縣')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (25, N'花蓮縣')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (26, N'連江縣')
SET IDENTITY_INSERT [dbo].[Cities] OFF
GO
SET IDENTITY_INSERT [dbo].[Districts] ON 

INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (9, N'中正區', N'100', 5)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (10, N'大同區', N'103', 5)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (11, N'中山區', N'104', 5)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (12, N'松山區', N'105', 5)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (13, N'大安區', N'106', 5)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (14, N'萬華區', N'108', 5)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (15, N'信義區', N'110', 5)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (16, N'士林區', N'111', 5)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (17, N'北投區', N'112', 5)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (18, N'內湖區', N'114', 5)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (19, N'南港區', N'115', 5)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (20, N'文山區', N'116', 5)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (21, N'仁愛區', N'200', 6)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (22, N'信義區', N'201', 6)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (23, N'中正區', N'202', 6)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (24, N'中山區', N'203', 6)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (25, N'安樂區', N'204', 6)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (26, N'暖暖區', N'205', 6)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (27, N'七堵區', N'206', 6)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (28, N'萬里區', N'207', 7)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (29, N'金山區', N'208', 7)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (30, N'板橋區', N'220', 7)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (31, N'汐止區', N'221', 7)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (32, N'深坑區', N'222', 7)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (33, N'石碇區', N'223', 7)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (34, N'瑞芳區', N'224', 7)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (35, N'平溪區', N'226', 7)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (36, N'雙溪區', N'227', 7)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (37, N'貢寮區', N'228', 7)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (38, N'新店區', N'231', 7)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (39, N'坪林區', N'232', 7)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (40, N'烏來區', N'233', 7)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (41, N'永和區', N'234', 7)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (42, N'中和區', N'235', 7)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (43, N'土城區', N'236', 7)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (44, N'三峽區', N'237', 7)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (45, N'樹林區', N'238', 7)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (46, N'鶯歌區', N'239', 7)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (47, N'三重區', N'241', 7)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (48, N'新莊區', N'242', 7)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (49, N'泰山區', N'243', 7)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (50, N'林口區', N'244', 7)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (51, N'蘆洲區', N'247', 7)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (52, N'五股區', N'248', 7)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (53, N'八里區', N'249', 7)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (54, N'淡水區', N'251', 7)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (55, N'三芝區', N'252', 7)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (56, N'石門區', N'253', 7)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (57, N'宜蘭市', N'260', 8)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (58, N'頭城鎮', N'261', 8)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (59, N'礁溪鄉', N'262', 8)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (60, N'壯圍鄉', N'263', 8)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (61, N'員山鄉', N'264', 8)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (62, N'羅東鎮', N'265', 8)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (63, N'三星鄉', N'266', 8)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (64, N'大同鄉', N'267', 8)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (65, N'五結鄉', N'268', 8)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (66, N'冬山鄉', N'269', 8)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (67, N'蘇澳鎮', N'270', 8)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (68, N'南澳鄉', N'272', 8)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (69, N'釣魚台列嶼', N'290', 8)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (70, N'中壢區', N'320', 9)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (71, N'平鎮區', N'324', 9)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (72, N'龍潭區', N'325', 9)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (73, N'楊梅區', N'326', 9)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (74, N'新屋區', N'327', 9)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (75, N'觀音區', N'328', 9)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (76, N'桃園區', N'330', 9)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (77, N'龜山區', N'333', 9)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (78, N'八德區', N'334', 9)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (79, N'大溪區', N'335', 9)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (80, N'復興區', N'336', 9)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (81, N'大園區', N'337', 9)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (82, N'蘆竹區', N'338', 9)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (83, N'東區', N'300', 10)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (84, N'北區', N'300', 10)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (85, N'香山區', N'300', 10)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (86, N'竹北市', N'302', 11)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (87, N'湖口鄉', N'303', 11)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (88, N'新豐鄉', N'304', 11)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (89, N'新埔鎮', N'305', 11)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (90, N'關西鎮', N'306', 11)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (91, N'芎林鄉', N'307', 11)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (92, N'寶山鄉', N'308', 11)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (93, N'竹東鎮', N'310', 11)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (94, N'五峰鄉', N'311', 11)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (95, N'橫山鄉', N'312', 11)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (96, N'尖石鄉', N'313', 11)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (97, N'北埔鄉', N'314', 11)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (98, N'峨眉鄉', N'315', 11)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (99, N'竹南鎮', N'350', 12)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (100, N'頭份市', N'351', 12)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (101, N'三灣鄉', N'352', 12)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (102, N'南庄鄉', N'353', 12)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (103, N'獅潭鄉', N'354', 12)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (104, N'後龍鎮', N'356', 12)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (105, N'通霄鎮', N'357', 12)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (106, N'苑裡鎮', N'358', 12)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (107, N'苗栗市', N'360', 12)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (108, N'造橋鄉', N'361', 12)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (109, N'頭屋鄉', N'362', 12)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (110, N'公館鄉', N'363', 12)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (111, N'大湖鄉', N'364', 12)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (112, N'泰安鄉', N'365', 12)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (113, N'銅鑼鄉', N'366', 12)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (114, N'三義鄉', N'367', 12)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (115, N'西湖鄉', N'368', 12)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (116, N'卓蘭鎮', N'369', 12)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (117, N'中區', N'400', 13)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (118, N'東區', N'401', 13)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (119, N'南區', N'402', 13)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (120, N'西區', N'403', 13)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (121, N'北區', N'404', 13)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (122, N'北屯區', N'406', 13)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (123, N'西屯區', N'407', 13)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (124, N'南屯區', N'408', 13)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (125, N'太平區', N'411', 13)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (126, N'大里區', N'412', 13)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (127, N'霧峰區', N'413', 13)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (128, N'烏日區', N'414', 13)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (129, N'豐原區', N'420', 13)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (130, N'后里區', N'421', 13)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (131, N'石岡區', N'422', 13)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (132, N'東勢區', N'423', 13)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (133, N'和平區', N'424', 13)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (134, N'新社區', N'426', 13)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (135, N'潭子區', N'427', 13)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (136, N'大雅區', N'428', 13)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (137, N'神岡區', N'429', 13)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (138, N'大肚區', N'432', 13)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (139, N'沙鹿區', N'433', 13)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (140, N'龍井區', N'434', 13)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (141, N'梧棲區', N'435', 13)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (142, N'清水區', N'436', 13)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (143, N'大甲區', N'437', 13)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (144, N'外埔區', N'438', 13)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (145, N'大安區', N'439', 13)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (146, N'彰化市', N'500', 14)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (147, N'芬園鄉', N'502', 14)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (148, N'花壇鄉', N'503', 14)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (149, N'秀水鄉', N'504', 14)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (150, N'鹿港鎮', N'505', 14)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (151, N'福興鄉', N'506', 14)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (152, N'線西鄉', N'507', 14)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (153, N'和美鎮', N'508', 14)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (154, N'伸港鄉', N'509', 14)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (155, N'員林市', N'510', 14)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (156, N'社頭鄉', N'511', 14)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (157, N'永靖鄉', N'512', 14)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (158, N'埔心鄉', N'513', 14)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (159, N'溪湖鎮', N'514', 14)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (160, N'大村鄉', N'515', 14)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (161, N'埔鹽鄉', N'516', 14)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (162, N'田中鎮', N'520', 14)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (163, N'北斗鎮', N'521', 14)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (164, N'田尾鄉', N'522', 14)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (165, N'埤頭鄉', N'523', 14)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (166, N'溪州鄉', N'524', 14)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (167, N'竹塘鄉', N'525', 14)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (168, N'二林鎮', N'526', 14)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (169, N'大城鄉', N'527', 14)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (170, N'芳苑鄉', N'528', 14)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (171, N'二水鄉', N'530', 14)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (172, N'南投市', N'540', 15)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (173, N'中寮鄉', N'541', 15)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (174, N'草屯鎮', N'542', 15)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (175, N'國姓鄉', N'544', 15)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (176, N'埔里鎮', N'545', 15)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (177, N'仁愛鄉', N'546', 15)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (178, N'名間鄉', N'551', 15)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (179, N'集集鎮', N'552', 15)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (180, N'水里鄉', N'553', 15)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (181, N'魚池鄉', N'555', 15)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (182, N'信義鄉', N'556', 15)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (183, N'竹山鎮', N'557', 15)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (184, N'鹿谷鄉', N'558', 15)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (185, N'東區', N'600', 16)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (186, N'西區', N'600', 16)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (187, N'番路鄉', N'602', 17)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (188, N'梅山鄉', N'603', 17)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (189, N'竹崎鄉', N'604', 17)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (190, N'阿里山', N'605', 17)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (191, N'中埔鄉', N'606', 17)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (192, N'大埔鄉', N'607', 17)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (193, N'水上鄉', N'608', 17)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (194, N'鹿草鄉', N'611', 17)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (195, N'太保市', N'612', 17)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (196, N'朴子市', N'613', 17)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (197, N'東石鄉', N'614', 17)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (198, N'六腳鄉', N'615', 17)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (199, N'新港鄉', N'616', 17)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (200, N'民雄鄉', N'621', 17)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (201, N'大林鎮', N'622', 17)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (202, N'溪口鄉', N'623', 17)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (203, N'義竹鄉', N'624', 17)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (204, N'布袋鎮', N'625', 17)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (205, N'斗南鎮', N'630', 18)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (206, N'大埤鄉', N'631', 18)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (207, N'虎尾鎮', N'632', 18)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (208, N'土庫鎮', N'633', 18)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (209, N'褒忠鄉', N'634', 18)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (210, N'東勢鄉', N'635', 18)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (211, N'台西鄉', N'636', 18)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (212, N'崙背鄉', N'637', 18)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (213, N'麥寮鄉', N'638', 18)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (214, N'斗六市', N'640', 18)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (215, N'林內鄉', N'643', 18)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (216, N'古坑鄉', N'646', 18)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (217, N'莿桐鄉', N'647', 18)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (218, N'西螺鎮', N'648', 18)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (219, N'二崙鄉', N'649', 18)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (220, N'北港鎮', N'651', 18)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (221, N'水林鄉', N'652', 18)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (222, N'口湖鄉', N'653', 18)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (223, N'四湖鄉', N'654', 18)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (224, N'元長鄉', N'655', 18)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (225, N'中西區', N'700', 19)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (226, N'東區', N'701', 19)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (227, N'南區', N'702', 19)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (228, N'北區', N'704', 19)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (229, N'安平區', N'708', 19)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (230, N'安南區', N'709', 19)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (231, N'永康區', N'710', 19)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (232, N'歸仁區', N'711', 19)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (233, N'新化區', N'712', 19)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (234, N'左鎮區', N'713', 19)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (235, N'玉井區', N'714', 19)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (236, N'楠西區', N'715', 19)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (237, N'南化區', N'716', 19)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (238, N'仁德區', N'717', 19)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (239, N'關廟區', N'718', 19)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (240, N'龍崎區', N'719', 19)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (241, N'官田區', N'720', 19)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (242, N'麻豆區', N'721', 19)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (243, N'佳里區', N'722', 19)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (244, N'西港區', N'723', 19)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (245, N'七股區', N'724', 19)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (246, N'將軍區', N'725', 19)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (247, N'學甲區', N'726', 19)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (248, N'北門區', N'727', 19)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (249, N'新營區', N'730', 19)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (250, N'後壁區', N'731', 19)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (251, N'白河區', N'732', 19)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (252, N'東山區', N'733', 19)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (253, N'六甲區', N'734', 19)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (254, N'下營區', N'735', 19)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (255, N'柳營區', N'736', 19)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (256, N'鹽水區', N'737', 19)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (257, N'善化區', N'741', 19)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (258, N'大內區', N'742', 19)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (259, N'山上區', N'743', 19)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (260, N'新市區', N'744', 19)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (261, N'安定區', N'745', 19)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (262, N'新興區', N'800', 20)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (263, N'前金區', N'801', 20)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (264, N'苓雅區', N'802', 20)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (265, N'鹽埕區', N'803', 20)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (266, N'鼓山區', N'804', 20)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (267, N'旗津區', N'805', 20)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (268, N'前鎮區', N'806', 20)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (269, N'三民區', N'807', 20)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (270, N'楠梓區', N'811', 20)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (271, N'小港區', N'812', 20)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (272, N'左營區', N'813', 20)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (273, N'仁武區', N'814', 20)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (274, N'大社區', N'815', 20)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (275, N'東沙群島', N'817', 20)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (276, N'南沙群島', N'819', 20)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (277, N'岡山區', N'820', 20)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (278, N'路竹區', N'821', 20)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (279, N'阿蓮區', N'822', 20)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (280, N'田寮區', N'823', 20)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (281, N'燕巢區', N'824', 20)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (282, N'橋頭區', N'825', 20)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (283, N'梓官區', N'826', 20)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (284, N'彌陀區', N'827', 20)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (285, N'永安區', N'828', 20)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (286, N'湖內區', N'829', 20)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (287, N'鳳山區', N'830', 20)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (288, N'大寮區', N'831', 20)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (289, N'林園區', N'832', 20)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (290, N'鳥松區', N'833', 20)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (291, N'大樹區', N'840', 20)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (292, N'旗山區', N'842', 20)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (293, N'美濃區', N'843', 20)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (294, N'六龜區', N'844', 20)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (295, N'內門區', N'845', 20)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (296, N'杉林區', N'846', 20)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (297, N'甲仙區', N'847', 20)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (298, N'桃源區', N'848', 20)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (299, N'那瑪夏區', N'849', 20)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (300, N'茂林區', N'851', 20)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (301, N'茄萣區', N'852', 20)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (302, N'馬公市', N'880', 21)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (303, N'西嶼鄉', N'881', 21)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (304, N'望安鄉', N'882', 21)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (305, N'七美鄉', N'883', 21)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (306, N'白沙鄉', N'884', 21)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (307, N'湖西鄉', N'885', 21)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (308, N'金沙鎮', N'890', 22)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (309, N'金湖鎮', N'891', 22)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (310, N'金寧鄉', N'892', 22)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (311, N'金城鎮', N'893', 22)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (312, N'烈嶼鄉', N'894', 22)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (313, N'烏坵鄉', N'896', 22)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (314, N'屏東市', N'900', 23)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (315, N'三地門鄉', N'901', 23)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (316, N'霧台鄉', N'902', 23)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (317, N'瑪家鄉', N'903', 23)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (318, N'九如鄉', N'904', 23)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (319, N'里港鄉', N'905', 23)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (320, N'高樹鄉', N'906', 23)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (321, N'鹽埔鄉', N'907', 23)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (322, N'長治鄉', N'908', 23)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (323, N'麟洛鄉', N'909', 23)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (324, N'竹田鄉', N'911', 23)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (325, N'內埔鄉', N'912', 23)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (326, N'萬丹鄉', N'913', 23)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (327, N'潮州鎮', N'920', 23)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (328, N'泰武鄉', N'921', 23)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (329, N'來義鄉', N'922', 23)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (330, N'萬巒鄉', N'923', 23)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (331, N'崁頂鄉', N'924', 23)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (332, N'新埤鄉', N'925', 23)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (333, N'南州鄉', N'926', 23)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (334, N'林邊鄉', N'927', 23)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (335, N'東港鎮', N'928', 23)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (336, N'琉球鄉', N'929', 23)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (337, N'佳冬鄉', N'931', 23)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (338, N'新園鄉', N'932', 23)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (339, N'枋寮鄉', N'940', 23)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (340, N'枋山鄉', N'941', 23)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (341, N'春日鄉', N'942', 23)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (342, N'獅子鄉', N'943', 23)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (343, N'車城鄉', N'944', 23)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (344, N'牡丹鄉', N'945', 23)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (345, N'恆春鎮', N'946', 23)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (346, N'滿州鄉', N'947', 23)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (347, N'台東市', N'950', 24)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (348, N'綠島鄉', N'951', 24)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (349, N'蘭嶼鄉', N'952', 24)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (350, N'延平鄉', N'953', 24)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (351, N'卑南鄉', N'954', 24)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (352, N'鹿野鄉', N'955', 24)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (353, N'關山鎮', N'956', 24)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (354, N'海端鄉', N'957', 24)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (355, N'池上鄉', N'958', 24)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (356, N'東河鄉', N'959', 24)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (357, N'成功鎮', N'961', 24)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (358, N'長濱鄉', N'962', 24)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (359, N'太麻里', N'963', 24)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (360, N'金峰鄉', N'964', 24)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (361, N'大武鄉', N'965', 24)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (362, N'達仁鄉', N'966', 24)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (363, N'花蓮市', N'970', 25)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (364, N'新城鄉', N'971', 25)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (365, N'秀林鄉', N'972', 25)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (366, N'吉安鄉', N'973', 25)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (367, N'壽豐鄉', N'974', 25)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (368, N'鳳林鎮', N'975', 25)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (369, N'光復鄉', N'976', 25)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (370, N'豐濱鄉', N'977', 25)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (371, N'瑞穗鄉', N'978', 25)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (372, N'萬榮鄉', N'979', 25)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (373, N'玉里鎮', N'981', 25)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (374, N'卓溪鄉', N'982', 25)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (375, N'富里鄉', N'983', 25)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (376, N'南竿鄉', N'209', 26)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (377, N'北竿鄉', N'210', 26)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (378, N'莒光鄉', N'211', 26)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (379, N'東引鄉', N'212', 26)
SET IDENTITY_INSERT [dbo].[Districts] OFF
GO
SET IDENTITY_INSERT [dbo].[Member] ON 

INSERT [dbo].[Member] ([MemberID], [Email], [Name], [IDentityNumber], [Passport], [NickName], [BirthDate], [Phone], [Password], [Point], [Address], [MemberRoleId], [Icon], [Sex], [DistrictId], [RegisterCheckCode], [provider], [providerFB], [providerGO]) VALUES (9, N'haoyan@gmail.com', N'Guest', NULL, NULL, N'Guest', NULL, NULL, N'Aa1!admin', 0, NULL, 3, NULL, NULL, NULL, N'8eUqWq9Zdl', NULL, NULL, NULL)
INSERT [dbo].[Member] ([MemberID], [Email], [Name], [IDentityNumber], [Passport], [NickName], [BirthDate], [Phone], [Password], [Point], [Address], [MemberRoleId], [Icon], [Sex], [DistrictId], [RegisterCheckCode], [provider], [providerFB], [providerGO]) VALUES (11, N'fantasysdo@yahoo.co.jp', N'Guest', NULL, NULL, N'Guest', NULL, NULL, N'Aa1!admin', 0, NULL, 3, NULL, NULL, NULL, N'eg2HLINXYb', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Member] OFF
GO
SET IDENTITY_INSERT [dbo].[MemberRole] ON 

INSERT [dbo].[MemberRole] ([MemberRoleId], [MemberRoleName]) VALUES (1, N'未驗證')
INSERT [dbo].[MemberRole] ([MemberRoleId], [MemberRoleName]) VALUES (2, N'普通會員')
INSERT [dbo].[MemberRole] ([MemberRoleId], [MemberRoleName]) VALUES (3, N'商家')
INSERT [dbo].[MemberRole] ([MemberRoleId], [MemberRoleName]) VALUES (4, N'管理者')
SET IDENTITY_INSERT [dbo].[MemberRole] OFF
GO
SET IDENTITY_INSERT [dbo].[Seller] ON 

INSERT [dbo].[Seller] ([SellerID], [CompanyName], [TaxIDNumber], [SellerHomePage], [SellerPhone], [SellerDeccription], [MemberId], [fPass], [fFileName]) VALUES (4, N'好言娛樂有限公司', N'98736279', NULL, N'0905664453', NULL, 9, 1, NULL)
INSERT [dbo].[Seller] ([SellerID], [CompanyName], [TaxIDNumber], [SellerHomePage], [SellerPhone], [SellerDeccription], [MemberId], [fPass], [fFileName]) VALUES (5, N'奇策士科技顧問股份有限公司', N'09836153', NULL, N'0988776254', NULL, 11, 1, NULL)
SET IDENTITY_INSERT [dbo].[Seller] OFF
GO
SET IDENTITY_INSERT [dbo].[SubCategories] ON 

INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (25, N'傳統', 13, 0)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (26, N'爵士', 13, 0)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (27, N'搖滾', 13, 0)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (28, N'民謠', 13, 0)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (29, N'管弦樂', 14, 1)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (30, N'合唱團', 14, 0)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (31, N'Live', 14, 0)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (32, N'獨奏', 14, 0)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (33, N'現代舞', 15, 0)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (34, N'芭蕾舞', 15, 0)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (35, N'街舞', 15, 0)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (36, N'藝術', 16, 0)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (37, N'科技', 16, 0)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (38, N'動漫游戲', 16, 0)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (39, N'生活', 16, 0)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (40, N'國內', 17, 0)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (41, N'國外', 17, 0)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (42, N'大牌明星', 17, 0)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (43, N'話劇', 18, 0)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (44, N'舞臺劇', 18, 0)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (45, N'戲曲', 18, 0)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (46, N'啞劇', 18, 0)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (47, N'籃球', 19, 0)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (48, N'棒球', 19, 0)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (49, N'足球', 19, 0)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (50, N'網球', 19, 0)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (51, N'其他', 19, 0)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (52, N'休閑運動', 20, 0)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (53, N'課程學習', 20, 0)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (54, N'親子同樂', 20, 0)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (55, N'深度體驗', 20, 2)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (56, N'其他', 22, 0)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (57, N'知識', 21, 0)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (58, N'產品', 21, 0)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (59, N'生活', 21, 0)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (60, N'成功學', 21, 0)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (61, N'科技', 21, 0)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (62, N'其他', 21, 0)
SET IDENTITY_INSERT [dbo].[SubCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[TicketCategory] ON 

INSERT [dbo].[TicketCategory] ([TicketCategoryId], [TicketCategoryName], [ActivityId]) VALUES (21, N'普通票', 36)
INSERT [dbo].[TicketCategory] ([TicketCategoryId], [TicketCategoryName], [ActivityId]) VALUES (22, N'A', 37)
INSERT [dbo].[TicketCategory] ([TicketCategoryId], [TicketCategoryName], [ActivityId]) VALUES (23, N'B', 37)
INSERT [dbo].[TicketCategory] ([TicketCategoryId], [TicketCategoryName], [ActivityId]) VALUES (24, N'C', 37)
INSERT [dbo].[TicketCategory] ([TicketCategoryId], [TicketCategoryName], [ActivityId]) VALUES (25, N'D', 37)
INSERT [dbo].[TicketCategory] ([TicketCategoryId], [TicketCategoryName], [ActivityId]) VALUES (26, N'全票', 38)
INSERT [dbo].[TicketCategory] ([TicketCategoryId], [TicketCategoryName], [ActivityId]) VALUES (27, N'優待票', 38)
INSERT [dbo].[TicketCategory] ([TicketCategoryId], [TicketCategoryName], [ActivityId]) VALUES (28, N'特惠票', 38)
INSERT [dbo].[TicketCategory] ([TicketCategoryId], [TicketCategoryName], [ActivityId]) VALUES (29, N'親子票', 38)
INSERT [dbo].[TicketCategory] ([TicketCategoryId], [TicketCategoryName], [ActivityId]) VALUES (30, N'早鳥票', 39)
INSERT [dbo].[TicketCategory] ([TicketCategoryId], [TicketCategoryName], [ActivityId]) VALUES (31, N'全票', 39)
INSERT [dbo].[TicketCategory] ([TicketCategoryId], [TicketCategoryName], [ActivityId]) VALUES (32, N'全票', 40)
INSERT [dbo].[TicketCategory] ([TicketCategoryId], [TicketCategoryName], [ActivityId]) VALUES (33, N'優惠票', 40)
INSERT [dbo].[TicketCategory] ([TicketCategoryId], [TicketCategoryName], [ActivityId]) VALUES (34, N'愛心票', 40)
INSERT [dbo].[TicketCategory] ([TicketCategoryId], [TicketCategoryName], [ActivityId]) VALUES (35, N'單人票', 41)
INSERT [dbo].[TicketCategory] ([TicketCategoryId], [TicketCategoryName], [ActivityId]) VALUES (36, N'雙人票', 41)
INSERT [dbo].[TicketCategory] ([TicketCategoryId], [TicketCategoryName], [ActivityId]) VALUES (37, N'贈品票', 41)
INSERT [dbo].[TicketCategory] ([TicketCategoryId], [TicketCategoryName], [ActivityId]) VALUES (38, N'全票', 42)
INSERT [dbo].[TicketCategory] ([TicketCategoryId], [TicketCategoryName], [ActivityId]) VALUES (39, N'親子票', 42)
INSERT [dbo].[TicketCategory] ([TicketCategoryId], [TicketCategoryName], [ActivityId]) VALUES (40, N'全票', 43)
INSERT [dbo].[TicketCategory] ([TicketCategoryId], [TicketCategoryName], [ActivityId]) VALUES (41, N'雙人票', 43)
INSERT [dbo].[TicketCategory] ([TicketCategoryId], [TicketCategoryName], [ActivityId]) VALUES (42, N'全票', 44)
INSERT [dbo].[TicketCategory] ([TicketCategoryId], [TicketCategoryName], [ActivityId]) VALUES (43, N'優待票', 44)
INSERT [dbo].[TicketCategory] ([TicketCategoryId], [TicketCategoryName], [ActivityId]) VALUES (44, N'全票', 45)
INSERT [dbo].[TicketCategory] ([TicketCategoryId], [TicketCategoryName], [ActivityId]) VALUES (45, N'回饋票', 45)
INSERT [dbo].[TicketCategory] ([TicketCategoryId], [TicketCategoryName], [ActivityId]) VALUES (46, N'愛心票', 45)
INSERT [dbo].[TicketCategory] ([TicketCategoryId], [TicketCategoryName], [ActivityId]) VALUES (47, N'胡桃鉗', 46)
INSERT [dbo].[TicketCategory] ([TicketCategoryId], [TicketCategoryName], [ActivityId]) VALUES (48, N'天鵝湖', 46)
INSERT [dbo].[TicketCategory] ([TicketCategoryId], [TicketCategoryName], [ActivityId]) VALUES (49, N'A區', 47)
INSERT [dbo].[TicketCategory] ([TicketCategoryId], [TicketCategoryName], [ActivityId]) VALUES (50, N'B區', 47)
INSERT [dbo].[TicketCategory] ([TicketCategoryId], [TicketCategoryName], [ActivityId]) VALUES (51, N'C區', 47)
SET IDENTITY_INSERT [dbo].[TicketCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Tickets] ON 

INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (41, 21, 1000, 110, 36, 21, CAST(0.50 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (42, 22, 3600, 30, 37, 22, CAST(0.00 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (43, 22, 3600, 30, 37, 23, CAST(0.00 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (44, 23, 3500, 20, 37, 22, CAST(0.00 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (45, 23, 3500, 20, 37, 23, CAST(0.00 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (46, 24, 3100, 30, 37, 22, CAST(0.00 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (47, 24, 3100, 30, 37, 23, CAST(0.00 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (48, 25, 3000, 15, 37, 22, CAST(0.00 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (49, 25, 3000, 15, 37, 23, CAST(0.00 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (50, 26, 350, 60, 38, 24, CAST(0.00 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (51, 27, 350, 40, 38, 24, CAST(0.20 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (52, 28, 350, 20, 38, 24, CAST(0.50 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (53, 29, 499, 30, 38, 24, CAST(0.00 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (54, 26, 350, 60, 38, 25, CAST(0.00 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (55, 27, 350, 40, 38, 25, CAST(0.20 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (56, 28, 350, 20, 38, 25, CAST(0.50 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (57, 29, 499, 30, 38, 25, CAST(0.00 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (58, 31, 300, 300, 39, 27, CAST(0.00 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (59, 30, 300, 250, 39, 26, CAST(0.30 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (60, 32, 350, 200, 40, 28, CAST(0.00 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (61, 33, 350, 100, 40, 28, CAST(0.15 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (62, 34, 350, 30, 40, 28, CAST(0.50 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (63, 32, 350, 200, 40, 29, CAST(0.00 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (64, 33, 350, 100, 40, 29, CAST(0.15 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (65, 34, 350, 30, 40, 29, CAST(0.50 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (66, 35, 230, 150, 41, 30, CAST(0.00 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (67, 36, 460, 100, 41, 30, CAST(0.10 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (68, 37, 280, 50, 41, 30, CAST(0.00 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (69, 38, 150, 80, 42, 31, CAST(0.00 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (70, 38, 150, 80, 42, 32, CAST(0.00 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (71, 39, 300, 90, 42, 31, CAST(0.30 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (72, 39, 399, 90, 42, 32, CAST(0.30 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (73, 40, 350, 150, 43, 33, CAST(0.00 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (74, 41, 700, 90, 43, 33, CAST(0.10 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (75, 40, 350, 150, 43, 34, CAST(0.00 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (76, 41, 700, 90, 43, 34, CAST(0.10 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (77, 42, 320, 210, 44, 35, CAST(0.00 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (78, 43, 320, 100, 44, 35, CAST(0.10 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (79, 44, 480, 50, 45, 36, CAST(0.00 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (80, 44, 480, 50, 45, 37, CAST(0.00 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (81, 45, 480, 90, 45, 36, CAST(0.30 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (82, 45, 480, 90, 45, 37, CAST(0.30 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (83, 46, 480, 40, 45, 36, CAST(0.50 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (84, 46, 480, 40, 45, 37, CAST(0.50 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (85, 47, 3300, 160, 46, 38, CAST(0.00 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (86, 47, 3300, 150, 46, 39, CAST(0.00 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (87, 47, 3300, 155, 46, 40, CAST(0.00 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (88, 48, 2800, 150, 46, 38, CAST(0.00 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (89, 48, 2800, 120, 46, 39, CAST(0.00 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (90, 48, 2800, 160, 46, 40, CAST(0.10 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (91, 49, 3800, 60, 47, 41, CAST(0.00 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (92, 50, 3000, 50, 47, 41, CAST(0.00 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (93, 51, 2200, 100, 47, 41, CAST(0.00 AS Numeric(3, 2)))
SET IDENTITY_INSERT [dbo].[Tickets] OFF
GO
SET IDENTITY_INSERT [dbo].[TicketTimes] ON 

INSERT [dbo].[TicketTimes] ([TicketTimeId], [TicketTime], [ActivityId]) VALUES (21, CAST(N'2020-12-17T19:30:00.000' AS DateTime), 36)
INSERT [dbo].[TicketTimes] ([TicketTimeId], [TicketTime], [ActivityId]) VALUES (22, CAST(N'2021-03-10T19:30:00.000' AS DateTime), 37)
INSERT [dbo].[TicketTimes] ([TicketTimeId], [TicketTime], [ActivityId]) VALUES (23, CAST(N'2021-03-11T19:30:00.000' AS DateTime), 37)
INSERT [dbo].[TicketTimes] ([TicketTimeId], [TicketTime], [ActivityId]) VALUES (24, CAST(N'2020-12-19T11:00:00.000' AS DateTime), 38)
INSERT [dbo].[TicketTimes] ([TicketTimeId], [TicketTime], [ActivityId]) VALUES (25, CAST(N'2021-03-01T11:00:00.000' AS DateTime), 38)
INSERT [dbo].[TicketTimes] ([TicketTimeId], [TicketTime], [ActivityId]) VALUES (26, CAST(N'2020-12-25T09:00:00.000' AS DateTime), 39)
INSERT [dbo].[TicketTimes] ([TicketTimeId], [TicketTime], [ActivityId]) VALUES (27, CAST(N'2021-03-01T09:00:00.000' AS DateTime), 39)
INSERT [dbo].[TicketTimes] ([TicketTimeId], [TicketTime], [ActivityId]) VALUES (28, CAST(N'2020-12-25T10:00:00.000' AS DateTime), 40)
INSERT [dbo].[TicketTimes] ([TicketTimeId], [TicketTime], [ActivityId]) VALUES (29, CAST(N'2021-04-06T10:00:00.000' AS DateTime), 40)
INSERT [dbo].[TicketTimes] ([TicketTimeId], [TicketTime], [ActivityId]) VALUES (30, CAST(N'2021-01-07T09:00:00.000' AS DateTime), 41)
INSERT [dbo].[TicketTimes] ([TicketTimeId], [TicketTime], [ActivityId]) VALUES (31, CAST(N'2021-01-08T11:00:00.000' AS DateTime), 42)
INSERT [dbo].[TicketTimes] ([TicketTimeId], [TicketTime], [ActivityId]) VALUES (32, CAST(N'2021-02-28T11:00:00.000' AS DateTime), 42)
INSERT [dbo].[TicketTimes] ([TicketTimeId], [TicketTime], [ActivityId]) VALUES (33, CAST(N'2021-03-08T19:00:00.000' AS DateTime), 43)
INSERT [dbo].[TicketTimes] ([TicketTimeId], [TicketTime], [ActivityId]) VALUES (34, CAST(N'2021-03-08T21:00:00.000' AS DateTime), 43)
INSERT [dbo].[TicketTimes] ([TicketTimeId], [TicketTime], [ActivityId]) VALUES (35, CAST(N'2020-12-26T10:00:00.000' AS DateTime), 44)
INSERT [dbo].[TicketTimes] ([TicketTimeId], [TicketTime], [ActivityId]) VALUES (36, CAST(N'2020-12-31T10:30:00.000' AS DateTime), 45)
INSERT [dbo].[TicketTimes] ([TicketTimeId], [TicketTime], [ActivityId]) VALUES (37, CAST(N'2020-12-31T12:30:00.000' AS DateTime), 45)
INSERT [dbo].[TicketTimes] ([TicketTimeId], [TicketTime], [ActivityId]) VALUES (38, CAST(N'2020-12-16T19:30:00.000' AS DateTime), 46)
INSERT [dbo].[TicketTimes] ([TicketTimeId], [TicketTime], [ActivityId]) VALUES (39, CAST(N'2020-12-17T19:30:00.000' AS DateTime), 46)
INSERT [dbo].[TicketTimes] ([TicketTimeId], [TicketTime], [ActivityId]) VALUES (40, CAST(N'2020-12-20T14:00:00.000' AS DateTime), 46)
INSERT [dbo].[TicketTimes] ([TicketTimeId], [TicketTime], [ActivityId]) VALUES (41, CAST(N'2021-01-09T19:30:00.000' AS DateTime), 47)
SET IDENTITY_INSERT [dbo].[TicketTimes] OFF
GO
ALTER TABLE [dbo].[Activity] ADD  CONSTRAINT [DF_Activity_ActivityStatusID]  DEFAULT ((0)) FOR [ActivityStatusID]
GO
ALTER TABLE [dbo].[Comment] ADD  CONSTRAINT [DF_Comment_CommentDate]  DEFAULT (getdate()) FOR [CommentDate]
GO
ALTER TABLE [dbo].[Member] ADD  CONSTRAINT [DF_Member_Point]  DEFAULT ((0)) FOR [Point]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_OrderStatus]  DEFAULT ((0)) FOR [OrderStatus]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_PayPoint]  DEFAULT ((0)) FOR [PayPoint]
GO
ALTER TABLE [dbo].[SubCategories] ADD  CONSTRAINT [DF_SubCategories_SearchedTime]  DEFAULT ((0)) FOR [SearchedTime]
GO
ALTER TABLE [dbo].[TicketGroups] ADD  CONSTRAINT [DF_TicketGroups_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_ActivityStatus] FOREIGN KEY([ActivityStatusID])
REFERENCES [dbo].[ActivityStatus] ([ActivityStatusID])
GO
ALTER TABLE [dbo].[Activity] CHECK CONSTRAINT [FK_Activity_ActivityStatus]
GO
ALTER TABLE [dbo].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_Districts] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[Districts] ([DistrictId])
GO
ALTER TABLE [dbo].[Activity] CHECK CONSTRAINT [FK_Activity_Districts]
GO
ALTER TABLE [dbo].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_Seller] FOREIGN KEY([SellerID])
REFERENCES [dbo].[Seller] ([SellerID])
GO
ALTER TABLE [dbo].[Activity] CHECK CONSTRAINT [FK_Activity_Seller]
GO
ALTER TABLE [dbo].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_SubCategories] FOREIGN KEY([SubCategoryId])
REFERENCES [dbo].[SubCategories] ([SubCategoryId])
GO
ALTER TABLE [dbo].[Activity] CHECK CONSTRAINT [FK_Activity_SubCategories]
GO
ALTER TABLE [dbo].[ActivityFavourite]  WITH CHECK ADD  CONSTRAINT [FK_ActivityFavourite_Activity] FOREIGN KEY([ActivityId])
REFERENCES [dbo].[Activity] ([ActivityID])
GO
ALTER TABLE [dbo].[ActivityFavourite] CHECK CONSTRAINT [FK_ActivityFavourite_Activity]
GO
ALTER TABLE [dbo].[ActivityFavourite]  WITH CHECK ADD  CONSTRAINT [FK_ActivityFavourite_Member] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[ActivityFavourite] CHECK CONSTRAINT [FK_ActivityFavourite_Member]
GO
ALTER TABLE [dbo].[Ad_Article_Activity]  WITH CHECK ADD  CONSTRAINT [FK_Ad_Article_Activity_Activity] FOREIGN KEY([ActivityID])
REFERENCES [dbo].[Activity] ([ActivityID])
GO
ALTER TABLE [dbo].[Ad_Article_Activity] CHECK CONSTRAINT [FK_Ad_Article_Activity_Activity]
GO
ALTER TABLE [dbo].[Ad_Article_Activity]  WITH CHECK ADD  CONSTRAINT [FK_Ad_Article_Activity_Article] FOREIGN KEY([ArticleID])
REFERENCES [dbo].[Article] ([ArticleID])
GO
ALTER TABLE [dbo].[Ad_Article_Activity] CHECK CONSTRAINT [FK_Ad_Article_Activity_Article]
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_ArticleCategories] FOREIGN KEY([ArticleCategoryID])
REFERENCES [dbo].[ArticleCategories] ([ArticleCategoryID])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_Article_ArticleCategories]
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_Member] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_Article_Member]
GO
ALTER TABLE [dbo].[Article_Emotion]  WITH CHECK ADD  CONSTRAINT [FK_Emotion_Article] FOREIGN KEY([ArticleId])
REFERENCES [dbo].[Article] ([ArticleID])
GO
ALTER TABLE [dbo].[Article_Emotion] CHECK CONSTRAINT [FK_Emotion_Article]
GO
ALTER TABLE [dbo].[Article_Emotion]  WITH CHECK ADD  CONSTRAINT [FK_Emotion_EmotionAction] FOREIGN KEY([ActionId])
REFERENCES [dbo].[EmotionAction] ([EmotionActionId])
GO
ALTER TABLE [dbo].[Article_Emotion] CHECK CONSTRAINT [FK_Emotion_EmotionAction]
GO
ALTER TABLE [dbo].[Article_Emotion]  WITH CHECK ADD  CONSTRAINT [FK_Emotion_Member] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[Article_Emotion] CHECK CONSTRAINT [FK_Emotion_Member]
GO
ALTER TABLE [dbo].[Article_Report]  WITH CHECK ADD  CONSTRAINT [FK_Article_Report_Article_Report] FOREIGN KEY([ArticleId])
REFERENCES [dbo].[Article] ([ArticleID])
GO
ALTER TABLE [dbo].[Article_Report] CHECK CONSTRAINT [FK_Article_Report_Article_Report]
GO
ALTER TABLE [dbo].[Article_Report]  WITH CHECK ADD  CONSTRAINT [FK_Article_Report_Member] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[Article_Report] CHECK CONSTRAINT [FK_Article_Report_Member]
GO
ALTER TABLE [dbo].[Article_Report]  WITH CHECK ADD  CONSTRAINT [FK_Article_Report_Report] FOREIGN KEY([ReportId])
REFERENCES [dbo].[Report] ([ReportId])
GO
ALTER TABLE [dbo].[Article_Report] CHECK CONSTRAINT [FK_Article_Report_Report]
GO
ALTER TABLE [dbo].[BanLIst]  WITH CHECK ADD  CONSTRAINT [FK_BanLIst_Member] FOREIGN KEY([BanMemberId])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[BanLIst] CHECK CONSTRAINT [FK_BanLIst_Member]
GO
ALTER TABLE [dbo].[BanLIst]  WITH CHECK ADD  CONSTRAINT [FK_BanLIst_Member1] FOREIGN KEY([AdminMemberId])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[BanLIst] CHECK CONSTRAINT [FK_BanLIst_Member1]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Activity] FOREIGN KEY([CommentActivityId])
REFERENCES [dbo].[Activity] ([ActivityID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Activity]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Member] FOREIGN KEY([CommentMemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Member]
GO
ALTER TABLE [dbo].[Districts]  WITH CHECK ADD  CONSTRAINT [FK_Districts_Districts] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([CityID])
GO
ALTER TABLE [dbo].[Districts] CHECK CONSTRAINT [FK_Districts_Districts]
GO
ALTER TABLE [dbo].[Member]  WITH CHECK ADD  CONSTRAINT [FK_Member_Districts] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[Districts] ([DistrictId])
GO
ALTER TABLE [dbo].[Member] CHECK CONSTRAINT [FK_Member_Districts]
GO
ALTER TABLE [dbo].[Member]  WITH CHECK ADD  CONSTRAINT [FK_Member_MemberRole] FOREIGN KEY([MemberRoleId])
REFERENCES [dbo].[MemberRole] ([MemberRoleId])
GO
ALTER TABLE [dbo].[Member] CHECK CONSTRAINT [FK_Member_MemberRole]
GO
ALTER TABLE [dbo].[MemberMissionStatusList]  WITH CHECK ADD  CONSTRAINT [FK_MemberMissionStatusList_Member] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[MemberMissionStatusList] CHECK CONSTRAINT [FK_MemberMissionStatusList_Member]
GO
ALTER TABLE [dbo].[MemberMissionStatusList]  WITH CHECK ADD  CONSTRAINT [FK_MemberMissionStatusList_Missions] FOREIGN KEY([MissionID])
REFERENCES [dbo].[Missions] ([MissionID])
GO
ALTER TABLE [dbo].[MemberMissionStatusList] CHECK CONSTRAINT [FK_MemberMissionStatusList_Missions]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_Detail_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_Order_Detail_Orders]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_Detail_Tickets1] FOREIGN KEY([TicketId])
REFERENCES [dbo].[Tickets] ([TicketID])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_Order_Detail_Tickets1]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Districts] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[Districts] ([DistrictId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Districts]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Member] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Member]
GO
ALTER TABLE [dbo].[Reply]  WITH CHECK ADD  CONSTRAINT [FK_Reply_Article] FOREIGN KEY([ArticleID])
REFERENCES [dbo].[Article] ([ArticleID])
GO
ALTER TABLE [dbo].[Reply] CHECK CONSTRAINT [FK_Reply_Article]
GO
ALTER TABLE [dbo].[Reply]  WITH CHECK ADD  CONSTRAINT [FK_Reply_Member] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[Reply] CHECK CONSTRAINT [FK_Reply_Member]
GO
ALTER TABLE [dbo].[Reply_Emotion]  WITH CHECK ADD  CONSTRAINT [FK_Reply_Emotion_EmotionAction] FOREIGN KEY([ActionId])
REFERENCES [dbo].[EmotionAction] ([EmotionActionId])
GO
ALTER TABLE [dbo].[Reply_Emotion] CHECK CONSTRAINT [FK_Reply_Emotion_EmotionAction]
GO
ALTER TABLE [dbo].[Reply_Emotion]  WITH CHECK ADD  CONSTRAINT [FK_Reply_Emotion_Member] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[Reply_Emotion] CHECK CONSTRAINT [FK_Reply_Emotion_Member]
GO
ALTER TABLE [dbo].[Reply_Emotion]  WITH CHECK ADD  CONSTRAINT [FK_Reply_Emotion_Reply] FOREIGN KEY([ReplyId])
REFERENCES [dbo].[Reply] ([ReplyID])
GO
ALTER TABLE [dbo].[Reply_Emotion] CHECK CONSTRAINT [FK_Reply_Emotion_Reply]
GO
ALTER TABLE [dbo].[Reply_Report]  WITH CHECK ADD  CONSTRAINT [FK_Reply_Report_Member] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[Reply_Report] CHECK CONSTRAINT [FK_Reply_Report_Member]
GO
ALTER TABLE [dbo].[Reply_Report]  WITH CHECK ADD  CONSTRAINT [FK_Reply_Report_Reply] FOREIGN KEY([ReplyId])
REFERENCES [dbo].[Reply] ([ReplyID])
GO
ALTER TABLE [dbo].[Reply_Report] CHECK CONSTRAINT [FK_Reply_Report_Reply]
GO
ALTER TABLE [dbo].[Reply_Report]  WITH CHECK ADD  CONSTRAINT [FK_Reply_Report_Report] FOREIGN KEY([ReportId])
REFERENCES [dbo].[Report] ([ReportId])
GO
ALTER TABLE [dbo].[Reply_Report] CHECK CONSTRAINT [FK_Reply_Report_Report]
GO
ALTER TABLE [dbo].[Seller]  WITH CHECK ADD  CONSTRAINT [FK_Seller_Member] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[Seller] CHECK CONSTRAINT [FK_Seller_Member]
GO
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCart_Member] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[ShoppingCart] CHECK CONSTRAINT [FK_ShoppingCart_Member]
GO
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCart_Tickets] FOREIGN KEY([TicketID])
REFERENCES [dbo].[Tickets] ([TicketID])
GO
ALTER TABLE [dbo].[ShoppingCart] CHECK CONSTRAINT [FK_ShoppingCart_Tickets]
GO
ALTER TABLE [dbo].[ShortMessage]  WITH CHECK ADD  CONSTRAINT [FK_ShortMessage_Member] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[ShortMessage] CHECK CONSTRAINT [FK_ShortMessage_Member]
GO
ALTER TABLE [dbo].[SubCategories]  WITH CHECK ADD  CONSTRAINT [FK_SubCategories_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[SubCategories] CHECK CONSTRAINT [FK_SubCategories_Categories]
GO
ALTER TABLE [dbo].[Subscribes]  WITH CHECK ADD  CONSTRAINT [FK_Subscribes_Member] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[Subscribes] CHECK CONSTRAINT [FK_Subscribes_Member]
GO
ALTER TABLE [dbo].[Subscribes]  WITH CHECK ADD  CONSTRAINT [FK_Subscribes_Seller] FOREIGN KEY([SellerID])
REFERENCES [dbo].[Seller] ([SellerID])
GO
ALTER TABLE [dbo].[Subscribes] CHECK CONSTRAINT [FK_Subscribes_Seller]
GO
ALTER TABLE [dbo].[TicketCategory]  WITH CHECK ADD  CONSTRAINT [FK_TicketCategory_Activity] FOREIGN KEY([ActivityId])
REFERENCES [dbo].[Activity] ([ActivityID])
GO
ALTER TABLE [dbo].[TicketCategory] CHECK CONSTRAINT [FK_TicketCategory_Activity]
GO
ALTER TABLE [dbo].[TicketGroupDetail]  WITH CHECK ADD  CONSTRAINT [FK_TicketGroupDetail_Activity] FOREIGN KEY([ActivityId])
REFERENCES [dbo].[Activity] ([ActivityID])
GO
ALTER TABLE [dbo].[TicketGroupDetail] CHECK CONSTRAINT [FK_TicketGroupDetail_Activity]
GO
ALTER TABLE [dbo].[TicketGroupDetail]  WITH CHECK ADD  CONSTRAINT [FK_TicketGroupDetail_TicketGroups] FOREIGN KEY([TicketGroupId])
REFERENCES [dbo].[TicketGroups] ([TicketGroupId])
GO
ALTER TABLE [dbo].[TicketGroupDetail] CHECK CONSTRAINT [FK_TicketGroupDetail_TicketGroups]
GO
ALTER TABLE [dbo].[TicketQRCodes]  WITH CHECK ADD  CONSTRAINT [FK_TicketQRCodes_Order_Detail] FOREIGN KEY([OrderDetailId])
REFERENCES [dbo].[Order_Detail] ([OrderDetailID])
GO
ALTER TABLE [dbo].[TicketQRCodes] CHECK CONSTRAINT [FK_TicketQRCodes_Order_Detail]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_Activity] FOREIGN KEY([ActivityID])
REFERENCES [dbo].[Activity] ([ActivityID])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_Activity]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_TicketCategory] FOREIGN KEY([TicketCategoryId])
REFERENCES [dbo].[TicketCategory] ([TicketCategoryId])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_TicketCategory]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_TicketTimes] FOREIGN KEY([TicketTimeId])
REFERENCES [dbo].[TicketTimes] ([TicketTimeId])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_TicketTimes]
GO
ALTER TABLE [dbo].[TicketTimes]  WITH CHECK ADD  CONSTRAINT [FK_TicketTimes_Activity] FOREIGN KEY([ActivityId])
REFERENCES [dbo].[Activity] ([ActivityID])
GO
ALTER TABLE [dbo].[TicketTimes] CHECK CONSTRAINT [FK_TicketTimes_Activity]
GO
/****** Object:  Trigger [dbo].[OrderDetail_Delete]    Script Date: 2020/12/14 下午 04:19:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[OrderDetail_Delete] on [dbo].[Order_Detail]
for delete as
update tickets set UnitsInStock = (UnitsInStock+deleted.quantity)
from tickets join deleted on tickets.ticketId = deleted.TicketId
GO
ALTER TABLE [dbo].[Order_Detail] ENABLE TRIGGER [OrderDetail_Delete]
GO
/****** Object:  Trigger [dbo].[OrderDetail_Insert]    Script Date: 2020/12/14 下午 04:19:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[OrderDetail_Insert] on [dbo].[Order_Detail]
for insert as
update tickets set UnitsInStock = (UnitsInStock-inserted.quantity)
from tickets join inserted on tickets.TicketID = inserted.TicketId
GO
ALTER TABLE [dbo].[Order_Detail] ENABLE TRIGGER [OrderDetail_Insert]
GO
/****** Object:  Trigger [dbo].[Order_Insert]    Script Date: 2020/12/14 下午 04:19:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
create trigger [dbo].[Order_Insert] on [dbo].[Orders]
for insert as
update member set point = (member.point - inserted.PayPoint)
from member join inserted on member.MemberID = inserted.MemberID
GO
ALTER TABLE [dbo].[Orders] ENABLE TRIGGER [Order_Insert]
GO
USE [master]
GO
ALTER DATABASE [TicketSys] SET  READ_WRITE 
GO

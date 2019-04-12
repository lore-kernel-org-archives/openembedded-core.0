Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 02B9F7DC17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 19:45:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44gpJj6hwyz5p;
	Fri, 12 Apr 2019 21:45:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1555098310;
	bh=bAe/9bTM6DF1Xf70KaOJhEprWP+nIt2D9t3qBTJg+7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G+YE7y3qmOkTb3C5GA8Mkd3MO0MzPbBkkmOQzPZobcoDrWl6gpHGitaDz0OwVsLjI
	dsjBQC4UeNjjzvZvghZxyYr/6eckICNUOy0FY3VdZ1SH2QUJ3icNKe4RvOjGrto8ef
	gwc+zGhKsaQfPx5OBJcpLpIUAAgwmZKKj1lWSDI5Oy7nSjWb0wOr1WO3eyuETcPjwU
	kFt2jNj1uPRRfAYqlfRJAHQElKddOQaSty35gRTEf/+qKqrzvnyyYAJgWMRXaUun2S
	pgd5jjDhNnJ/tqJmd+Of3t1It0sDOraW8McU12bFZAJx7BsjtfK/DwPnqMwaSpipga
	bcx86ek8v1dm0yI3vnlC9W1e6MNVb2DlhQmIp1ChCZP/62Xt6B/N3Smd/LjgRy6IOK
	/4ovbJhT1x9vwqJcO8nkpDCMWiy9wqMn8oinhkAq1VxfrDi6vQPM78dBbt/e7HO6cf
	Zx+oAAjbcm4dS+ZgkZhLn0yzc9DUiZk+Z0aAwTqY+MzhfB/pS8atMlxy8cl03qiU9t
	4gFsCG5xcFuvRlukKeo0+nejeub3gbzHaTPq/kxEKTEET2qNd/ERaiNYYrK6h+MJoH
	0SQJOLqVzfrO+kvu+8GilCU6Pxosz05Irh22Jr08GGEsAh3RJ2OT90sPwHh2oHHagN
	QcxaPY2yQFKk6NNMn7gnoeTY=
Date: Fri, 12 Apr 2019 22:45:07 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <20190412194507.GB19080@localhost>
References: <20190412123046.17510-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20190412123046.17510-1-daniel.thompson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] go: Allow bootstrapping using host go compiler
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Apr 2019 19:45:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Apr 12, 2019 at 01:30:46PM +0100, Daniel Thompson wrote:
> Currently go-native bootstraps without any dependency on the host go
> compiler by building go-1.4 (the last version written in C) and using
> that to build a more recent version of go. This does not work on host
> architectures, such as arm64, that are not supported by go-1.4. To
> support these host architectures we must rely on an existing host go
> compiler and use that to build go-native instead.
>...

Why is this the only option for you?

The clean way to bootstrap go would be by building gccgo and using that 
as starting point for the bootstrap.

Haven't tried how trivial or difficult it is to make that work,
but it sounds more long-term maintainable than having different
problems depending on what architecture and host distribution
is used - it doesn't sound like a good idea to have to test
and maintain all combinations, e.g. whether Go 1.6 on arm64
in Ubuntu 16.04 manages to bootstrap the latest Go.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed



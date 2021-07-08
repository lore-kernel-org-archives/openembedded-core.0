Received: from avasout07.plus.net (avasout07.plus.net [84.93.230.235])
 by mx.groups.io with SMTP id smtpd.web09.9185.1625732791579147686
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jul 2021 01:26:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=kYJhNBJC;
 spf=pass (domain: mcrowe.com, ip: 84.93.230.235, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id 1PMVmpYri6wwF1PMWmdjWK; Thu, 08 Jul 2021 09:26:29 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=TPXet2ta c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=kj9zAlcOel0A:10 a=e_q4qTt1xDgA:10 a=iGHA9ds3AAAA:8 a=jQBYA95EMZ-SVN9s6KAA:9
 a=CjuIK1q_8ugA:10 a=sK1cRYm3nf8A:10 a=Q8pDpoN9f6oA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	 s=20191005; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=0x/5jF+EjGGp4Ko9ammBjF3EmCk0W+gEsDP3r6SR7vo=; b=kYJhN
	BJCW/h+jtr2SDU7z8LhSJFbQWmj5CDDkPVS5wOPn8Cn6sGlgpmzWGrUS+7c32TXlG/2p1OaUEh9Q9
	WK54fslG5ZQfxCfT+LLUUS1DDRU0Q3kfccGSQm2H4lTPGN8NBwjmmHX7+1IGQvnEtf1v/WpB50RIP
	hYgWpu6yOlRFSPnjlQjvMFLL4nOrQDyfdHBvHSHtes53slm1mjLBASsuiZzB6fKltk1+1JaCAorlS
	UaOmz8Ia+HYh2skHiMalklRNCy47Bj55O4bh7pxRiWmfzG2cEzt4A0bUVuSIUF6gNBqJr4SBYQpPH
	YaIoAsBAI6/z9nRkuMm5Hc7/LyuKw==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1m1PMV-00071o-61; Thu, 08 Jul 2021 09:26:23 +0100
Date: Thu, 8 Jul 2021 09:26:23 +0100
From: "Mike Crowe" <yocto@mac.mcrowe.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] license: Drop adding RRECOMMENDS for license packages
Message-ID: <20210708082623.GA25489@mcrowe.com>
References: <20210707170607.2698337-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <20210707170607.2698337-1-richard.purdie@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Envelope: MS4wfMkxpTQWh2pHrcRrhXYvlKL/TgiXKBUBVnSefOgkYECxPTWdhs2rwt0Ig/3e3s0bsTbl37kbWxaWF9ogw4ucVK6LoKQHWw2B4cHaVW2UTxesgDNcZNxi
 V73c7VfO4DYl7lb6zGk9AMFExTN2f7JzrqzA/gGlzDgm2h6X0SicvWd31WQt0VoiKpNj8igpoSSZpw==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wednesday 07 July 2021 at 18:06:07 +0100, Richard Purdie wrote:
> This changes behaviour when LICENSE_CREATE_PACKAGE is in use. Packages
> no longer have RRECOMMENDS adding to them.
> 
> It was highlighted that this doesn't apply to PACKAGES_DYNAMIC, nor can
> it easily be made to do so. There is also a much easier way to handle this
> which is:
> 
> IMAGE_INSTALL_COMPLEMENTARY += "*-lic"
>
> which works on a per image basis and doesn't change the underlying
> package dependencies. I propose we switch to this instead.

The downside to this is that IMAGE_INSTALL_COMPLEMENTARY isn't documented
at https://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html so
I'd assumed it to be an implementation detail. (Adding it to the
documentation is presumably not difficult though.)

Since the equivalent for "*-dbg" is to add dbg-pkgs to IMAGE_FEATURES, I
think that adding:

 COMPLEMENTARY_GLOB[lic-pkgs] = "*-lic"

to license_image.bbclass is a cleaner solution. We could make the feature
imply LICENSE_CREATE_PACKAGE="1" but it feels strange for an image feature
to affect the packages when they are built so perhaps that isn't a good
idea.

Thanks.

Mike.

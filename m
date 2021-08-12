Received: from avasout03.plus.net (avasout03.plus.net [84.93.230.244])
 by mx.groups.io with SMTP id smtpd.web12.19357.1628754380036184463
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Aug 2021 00:46:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=N/jFW0xq;
 spf=pass (domain: mcrowe.com, ip: 84.93.230.244, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id E5PlmDRrKs9JuE5PmmVVTi; Thu, 12 Aug 2021 08:46:17 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=S85CPLkP c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=8nJEP1OIZ-IA:10 a=MhDmnRu9jo8A:10 a=Q4-j1AaZAAAA:8 a=-An2I_7KAAAA:8
 a=5uNNQWj-iSX-xtnPxn8A:9 a=wPNLvfGTeEIA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=Sq34B_EcNBM9_nrAYB9S:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	 s=20191005; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description;
	bh=vkkk71/K9Rw0o15Jfolm0Uy5urpoOkiHZ3b0R3KaQkc=; b=N/jFW0xqTrzG+t1em/IwCottId
	ex4UNGlOOicUSwhjmy93PT7W/f0lV2yd6FUCATeHy53RWFiRCmsfIzaKRVc7dc+kjIMqzjxQxrNI5
	tOT/sBbE1IkprZqM5x8Xo4Sq+OnoK2hI+w59SoaFSCDv3Mou6VfCD9EMDAOtZijT6jrBXfNd4urIo
	0XqPkAOXQ/AAVHpvZ5IGzNnAtGjj/e+jyeox831JdYcf0NAHYVE3AECbugM8XJFwI+cScnTiiP3h+
	LnQocdHUC93uwP4SkwgIedeSGZ5YYZ1SLKESetesk+H6zv9bfZfow8kypJ4Jd8Iwj5hf1MRYiyUpt
	rAGLg0tw==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1mE5Pk-0006XL-U7; Thu, 12 Aug 2021 08:46:08 +0100
Date: Thu, 12 Aug 2021 08:46:08 +0100
From: "Mike Crowe" <yocto@mac.mcrowe.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [pseudo][PATCH] fcntl: Add support for F_GETPIPE_SZ
Message-ID: <20210812074608.GA24313@mcrowe.com>
References: <20210811155821.863938-1-mac@mcrowe.com>
 <20a5e86d077daf76bfc1398729b3a8ab71f9633c.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <20a5e86d077daf76bfc1398729b3a8ab71f9633c.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Envelope: MS4wfF3HkFBGj9Razha8qPyh58fKfNzKnrQ4o1nb1lwlZM3pxDkLLE4Rm8G0vkVtPEgXlDP4bQIrKaDLRuYF7Zl1nh3GrzJFIzY2KQte5BMbhttUCHLglCog
 7wO76nrph5AUM4mLKwtSef/0fVD1ipC5MZh+u2UxNgLuPF00ByJt64pHKrBLVs2QRPhNPk2BfQ/BLw==
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wednesday 11 August 2021 at 22:38:23 +0100, Richard Purdie wrote:
> On Wed, 2021-08-11 at 16:58 +0100, Mike Crowe via lists.openembedded.org wrote:
> > When running the test suite on my Debian 11 box I see many occurrences
> > of:
> > 
> >  unknown fcntl argument 1032, assuming long argument.
> > 
> > (for example from test-execl.sh.)
> > 
> > It appears that this is F_GETPIPE_SZ and it takes no arguments. Let's
> > add it to avoid the warning messages.
> > 
> > I could add F_SETPIPE_SZ too, but that apparently takes an int argument
> > which would mean moving the va_arg call into the switch statement. :(
> > 
> > Signed-off-by: Mike Crowe <mac@mcrowe.com>
> > ---
> >  ports/linux/guts/fcntl.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/ports/linux/guts/fcntl.c b/ports/linux/guts/fcntl.c
> > index 434c7f3..e9c6140 100644
> > --- a/ports/linux/guts/fcntl.c
> > +++ b/ports/linux/guts/fcntl.c
> > @@ -37,6 +37,9 @@
> >  	case F_GETOWN:
> >  	case F_GETSIG:
> >  	case F_GETLEASE:
> > +#if defined(F_GETPIPE_SZ)
> > +        case F_GETPIPE_SZ:
> > +#endif
> >  		rc = real_fcntl(fd, cmd);
> >  		break;
> >  	/* long argument */
> 
> This goes make to making pseudo host specific which will break uninative/sstate.
> We'll probably have to add a define if it isn't defined to get the behaviour we 
> need.

Good point. I should have realised that.

> It is probably only a question of time before some program is using F_SETPIPE_SZ
> too :(

OK. I'll work on a new patch that supports F_GETPIPE_SZ and F_SETPIPE_SZ
without relying on the constants being available.

Thanks!

Mike.

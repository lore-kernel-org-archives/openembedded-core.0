Received: from avasout04.plus.net (avasout04.plus.net [212.159.14.19])
 by mx.groups.io with SMTP id smtpd.web08.3293.1630670966056921207
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Sep 2021 05:09:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=A3BO9QIc;
 spf=pass (domain: mcrowe.com, ip: 212.159.14.19, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id M80Ymapc58YYhM80ZmpVUk; Fri, 03 Sep 2021 13:09:24 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=PtkIkzE3 c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=kj9zAlcOel0A:10 a=7QKq2e-ADPsA:10 a=iGHA9ds3AAAA:8 a=pGLkceISAAAA:8
 a=IISSckBZxYtfD9Srpt0A:9 a=CjuIK1q_8ugA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=9ouTVc0/f2msTcEPlbd6mThs/Hg1PXoDk3Z2gAmz2+4=; b=A3BO9
	QIcajb8YK9rlq/z9p2O2rRvuCj1ZTfjRAZNKOyTItN9woO6n1p2JZLT6pir5ferg1z0UQkrojArEt
	uvGV6sGgvyWXTQDDKkkbLpp7iIxO53g8PMrrNHHZ5B2DUffmwFv5wBzomlkt74Q6muvr2+dD7BSLT
	ABAufsUpgZVFo2lBMfDgouOEBDkWpJha4LzTNysGFjKrfZxU7kUgoxeE1uXuAIDwol2VWaQxmYgsT
	mFEc9bR9/n2VjcTGby0UT09DaHiA1NMytnQeFmQfawe3Ot7Q21a4RxcExw2rna9Z326OglLZXw20C
	WmZxXOrAQvoiBQ58So6s84kAiC2Mw==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.94.2)
	(envelope-from <mac@mcrowe.com>)
	id 1mM80Y-00BtaR-8y; Fri, 03 Sep 2021 13:09:22 +0100
Date: Fri, 3 Sep 2021 13:09:22 +0100
From: "Mike Crowe" <yocto@mac.mcrowe.com>
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [RFC][PATCH] default-distrovars.inc: Set BBINCLUDELOGS to empty to disable printing failed task output multiple times
Message-ID: <YTIQcgybQZwZiPUm@mcrowe.com>
References: <20210903115521.1962799-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210903115521.1962799-1-Martin.Jansa@gmail.com>
X-CMAE-Envelope: MS4wfHb6E8wKPKfSmD0Q4u89S4roFmrUpe/HOWKC5cQ/Z/ZzxU5vFKlk4brjvmDS/pQ3QsCVRLOJDqf64wDUymqYRveqMDwmHv3S7HWUkD/1zJuuAxJfQHdT
 kHOCEYVJqYcVoljEC+gAnsZJc7gzQHQaeJt90xrmee/XqD6atlCRFpyPyyLrq/Jz9YM/BxEYJE9pkw==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Friday 03 September 2021 at 13:55:21 +0200, Martin Jansa wrote:
> * the output is shown 3 times with default configuration and 5 times when --verbose
>   is being used with knotty, there might be other use-cases where we actually need
>   this, but until the logging is resolved better, setting this to empty looks like
>   more reasonable option (considering that e.g. log.do_compile from chromium-x11
>   can be over 50MB long, generating 150MB+ cooker log)
> 
> * more details in:
>   https://bugzilla.yoctoproject.org/show_bug.cgi?id=14542
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/conf/distro/include/default-distrovars.inc | 6 ++++--
>  meta/conf/documentation.conf                    | 2 +-
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
> index f91df632d5..5035508b98 100644
> --- a/meta/conf/distro/include/default-distrovars.inc
> +++ b/meta/conf/distro/include/default-distrovars.inc
> @@ -33,8 +33,10 @@ BB_GENERATE_MIRROR_TARBALLS ??= "0"
>  
>  NO32LIBS ??= "1"
>  
> -# Default to emitting logfiles if a build fails.
> -BBINCLUDELOGS ??= "yes"
> +# Default logger already emits logfiles if a build fails, setting this to any non-empty value would just include more copies (prefixed with "|") in the output
> +# https://bugzilla.yoctoproject.org/show_bug.cgi?id=14542
> +BBINCLUDELOGS ??= ""
> +
>  SDK_VERSION ??= "nodistro.0"
>  DISTRO_VERSION ??= "nodistro.0"
>  
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index c5a38b0764..f4697e28d0 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -88,7 +88,7 @@ BBFILE_COLLECTIONS[doc] = "Lists the names of configured layers. These names are
>  BBFILE_PATTERN[doc] = "Variable that expands to match files from BBFILES in a particular layer. This variable is used in the layer.conf file and must be suffixed with the name of a layer."
>  BBFILE_PRIORITY[doc] = "Assigns the priority for recipe files in each layer. Setting this variable allows you to prioritize a layer against other layers that contain the same recipe."
>  BBFILES[doc] = "List of recipe files used by BitBake to build software."
> -BBINCLUDELOGS[doc] = "Variable that controls how BitBake displays logs on build failure."
> +BBINCLUDELOGS[doc] = "Variable that controls how BitBake displays logs on build failure. Set to empty if you don't want to have 2nd copy of failed task output (prefixed with '|') in the cooker log."
>  BBINCLUDELOGS_LINES[doc] = "Amount of log lines printed on failure."
>  BBLAYERS[doc] = "Lists the layers to enable during the build. This variable is defined in the bblayers.conf configuration file."
>  BBMASK[doc] = "Prevents BitBake from processing specific recipes or recipe append files."
> -- 
> 2.32.0

This patch (when applied to Dunfell) appears to solve the problem for me. I
now only get a single copy of the log output in both the output from
bitbake and the cooker log.

Whether it's the right solution or not I cannot say, though. :)

Thanks!

Mike.

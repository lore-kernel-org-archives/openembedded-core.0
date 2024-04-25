Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F377BC4345F
	for <webhook@archiver.kernel.org>; Thu, 25 Apr 2024 08:24:18 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.12025.1714033456978452472
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Apr 2024 01:24:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=eEJt7Ay+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B05F51C0007;
	Thu, 25 Apr 2024 08:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714033455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0EaFJLL8vfxLAo76GNzf47ico4POIivm6kRIcFATk1s=;
	b=eEJt7Ay+UJtEmG7Ms2MzxHyRh6XDiktMm+HxA2r/b45t0UDFWRLsnoWqwJWzh1ulNbuMil
	Xug7cKgugHW0s57+oD6mm58TDSwEsw10uP4z7gXo7ofzZm2tyzeYEe276qJ6sAu3giyRBJ
	2A2G45c12hrBOvq/wy9iNl6qu63qhO6qUqUAs1g/k+7fzS1MOju3CCLB10LFByaGsQhfMO
	FETIdXiXWC7d0Vbb9ugmh3RhZRciILyeW2RQq1OFl6Iz/fAN64abiT29ZecoVIFrfo877u
	YsTvMi+KKI2oXWIQl3e03Kd1xeMICjvCm+TWrky1mZPXKBYhZ6M+7osvxoczOw==
Date: Thu, 25 Apr 2024 10:24:13 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Joseph Mills <joseph.mills@cnhind.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/1] [mesa] Update do_install as needed per
 upstream changes
Message-ID: <202404250824138d2227a3@mail.local>
References: <20240422143921.3187890-1-joseph.mills@cnhind.com>
 <20240422143921.3187890-2-joseph.mills@cnhind.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240422143921.3187890-2-joseph.mills@cnhind.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Apr 2024 08:24:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198697

This causes the following failures:
https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4702/steps/13/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/106/builds/7874/steps/11/logs/stdio

On 22/04/2024 09:39:21-0500, Joseph Mills wrote:
> Signed-off-by: Joseph Mills <joseph.mills@cnhind.com>
> 
> Developer's Certificate of Origin 1.1
> 
> By making a contribution to this project, I certify that:
> 
> (a) The contribution was created in whole or in part by me and I
>     have the right to submit it under the open source license
>     indicated in the file; or
> 
> (b) The contribution is based upon previous work that, to the best
>     of my knowledge, is covered under an appropriate open source
>     license and I have the right under that license to submit that
>     work with modifications, whether created in whole or in part
>     by me, under the same open source license (unless I am
>     permitted to submit under a different license), as indicated
>     in the file; or
> 
> (c) The contribution was provided directly to me by some other
>     person who certified (a), (b) or (c) and I have not modified
>     it.
> 
> (d) I understand and agree that this project and the contribution
>     are public and that a record of the contribution (including all
>     personal information I submit with it, including my sign-off) is
>     maintained indefinitely and may be redistributed consistent with
>     this project or the open source license(s) involved.
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 6e96190084..f4fcf31df0 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -27,12 +27,12 @@ SRC_URI[sha256sum] = "94e28a8edad06d8ed2b83eb53f253b9eb5aa62c3080f939702e1b3039b
>  UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
>  
>  #because we cannot rely on the fact that all apps will use pkgconfig,
> -#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
> +#make eglplatform.h independent of USE_X11
>  do_install:append() {
>    # sed can't find EGL/eglplatform.h as it doesn't get installed when glvnd enabled.
>    # So, check if EGL/eglplatform.h exists before running sed.
>    if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)} && [ -f ${D}${includedir}/EGL/eglplatform.h ]; then
> -      sed -i -e 's/^#elif defined(__unix__) && defined(EGL_NO_X11)$/#elif defined(__unix__) \&\& defined(EGL_NO_X11) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
> +      sed -i -e 's/^#elif defined(USE_X11)$/#elif ${@bb.utils.contains('PACKAGECONFIG', 'x11', '1', '0', d)}/' ${D}${includedir}/EGL/eglplatform.h
>    fi
>  }
>  
> -- 
> 2.43.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198591): https://lists.openembedded.org/g/openembedded-core/message/198591
> Mute This Topic: https://lists.openembedded.org/mt/105670960/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


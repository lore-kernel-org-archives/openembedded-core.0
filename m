Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E75C433FE
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 22:12:46 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web12.3666.1667772763869261733
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 14:12:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cWTxR+TH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D1DC8240004;
	Sun,  6 Nov 2022 22:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667772761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1nCO3qdKyTF5fwkHeqT57IAlH5JDT/aDpCrqHkYMbww=;
	b=cWTxR+TH0PSDWmtrM6im7/UwGrmnak3jCuzHomJ8iInAZGS/aCsGdi9afl+4NU+UeJOTrS
	NELVT4lWo/C/l/fsIcAnomS2LLBbXexc/Bf3rAumas20BMHJ1eI8xSBtGRy9acUpoMCJd8
	3xUOYOjXTPT9gjTXrCuIn115kjrOrrF2PrTfDccSvVGv31tZ1kTrbl+sCrH2g5Xn9PVAD7
	ek34wTPKNb4OPcvuj+NwGCyzKJuUQmoyNEQNB2lWRrGwty+5am3h81yh82grq/pFDfAVRz
	5LMDi+ZAc1Tj0QxWjEyRPFpFOyaXbnkM7Oh2/FK2nNMym9KKIWrhH/dQnN+a4Q==
Date: Sun, 6 Nov 2022 23:12:40 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCH 2/2] gstreamer1.0-plugins-good: use libsoup-3.0
 by default
Message-ID: <Y2gxWH7vuDMlDH0m@mail.local>
References: <20221106080249.89929-1-f_l_k@t-online.de>
 <20221106080249.89929-2-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221106080249.89929-2-f_l_k@t-online.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 22:12:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172816

Hello,

This causes the following warning:

WARNING: gstreamer1.0-meta-base-1.0-r0 do_package_qa: QA Issue: gstreamer1.0-meta-base rdepends on gstreamer1.0-plugins-good-soup, but it isn't a build dependency? [build-deps]

https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/6120/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/6124/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/6107/steps/11/logs/stdio

On 06/11/2022 09:02:49+0100, Markus Volk wrote:
> - add a PACKAGECONFIG for soup3
> - add PACKAGECONFIG_SOUP variable as it is used in webkitgtk and epiphany
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../gstreamer/gstreamer1.0-plugins-good_1.20.3.bb      | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb
> index 0235935a4a..6d90fd5213 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb
> @@ -20,11 +20,14 @@ DEPENDS += "gstreamer1.0-plugins-base libcap zlib"
>  RPROVIDES:${PN}-pulseaudio += "${PN}-pulse"
>  RPROVIDES:${PN}-soup += "${PN}-souphttpsrc"
>  
> +PACKAGECONFIG_SOUP ?= "soup3"
> +
>  PACKAGECONFIG ??= " \
>      ${GSTREAMER_ORC} \
> +    ${PACKAGECONFIG_SOUP} \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio x11', d)} \
>      ${@bb.utils.contains('TUNE_FEATURES', 'm64', 'asm', '', d)} \
> -    bz2 cairo flac gdk-pixbuf gudev jpeg lame libpng mpg123 soup speex taglib v4l2 \
> +    bz2 cairo flac gdk-pixbuf gudev jpeg lame libpng mpg123 speex taglib v4l2 \
>  "
>  
>  X11DEPENDS = "virtual/libx11 libsm libxrender libxfixes libxdamage"
> @@ -53,8 +56,9 @@ PACKAGECONFIG[qt5]        = "-Dqt5=enabled,-Dqt5=disabled,qtbase qtdeclarative q
>  # instead of linking to it. And instead of using the default libsoup C headers, it
>  # uses its own stub header. Consequently, objdump will not show the libsoup .so as
>  # a dependency, and libsoup won't be added to an image. Fix this by setting libsoup
> -# as RDEPEND instead of DEPEND.
> -PACKAGECONFIG[soup]       = "-Dsoup=enabled,-Dsoup=disabled,,libsoup-2.4"
> +# as RDEPEND.
> +PACKAGECONFIG[soup2] = "-Dsoup=enabled,-Dsoup=disabled,libsoup-2.4,libsoup-2.4,,soup3"
> +PACKAGECONFIG[soup3] = ",,libsoup,libsoup,,soup2"
>  PACKAGECONFIG[speex]      = "-Dspeex=enabled,-Dspeex=disabled,speex"
>  PACKAGECONFIG[rpi]        = "-Drpicamsrc=enabled,-Drpicamsrc=disabled,userland"
>  PACKAGECONFIG[taglib]     = "-Dtaglib=enabled,-Dtaglib=disabled,taglib"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172761): https://lists.openembedded.org/g/openembedded-core/message/172761
> Mute This Topic: https://lists.openembedded.org/mt/94840953/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


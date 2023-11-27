Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E20B7C4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 19:44:10 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.104621.1701114245055603591
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 11:44:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=o/y0LvIa;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30C2940006;
	Mon, 27 Nov 2023 19:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701114242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G+MCxfZhQXE72sWmwSGIuAfrl0IBTFBs4l+t90Ahx2I=;
	b=o/y0LvIaRETfIw/cGpZZ5Qqty/i0U0FqZrvZTpRUaNgOI2iG+rDsgofCqFs9B4vcktzhfD
	Rbfox8/wKoQSTfbSUGFpn+KqXRMoLhzSt5FWkAr/7p39AqIXxfN7AQULTNvIl+tPvhxSC8
	v2rMxxh/8vRDn1fTqyQkYTNmwYF6GcUhGR2Q4C3M8Iu2vMley1BZeYOz0UgDSDcI3BOKBE
	RucV64k42SHwzA8MXdQT9v//6VsxyunHs8a/XkbVUBvejK2OXdaXLjuJZvmyUzDYvFCNZk
	oYI06mf5tvwlWuhXCpS3ccBh26RWc62DmQSpQx84yfe9yowX78hkqLnDmyHTqA==
Date: Mon, 27 Nov 2023 20:44:01 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCHv2] default-providers.inc: add PREFERRED_PROVIDER
 variables for llvm
Message-ID: <202311271944012140dbb6@mail.local>
References: <20231127102449.521512-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231127102449.521512-1-f_l_k@t-online.de>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 19:44:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191321

On 27/11/2023 11:24:49+0100, Markus Volk wrote:
> gallium-llvm needs to be built with clang if you, for example
> want to have support for opencl or want to build the intel-clc compiler.
> meta-clang recommends to set
> 
> PREFERRED_PROVIDER_llvm = "clang"
> PREFERRED_PROVIDER_llvm-native = "clang-native"
> 
> The current problem is that this is not taken into account in mesa and therefore
> both llvm and clang are included. This leads to files that are provided by both
> packages and would also unnecessarily increase the build time.
> 
> Add PREFERRED_PROVIDER_llvm and PREFERRED_PROVIDER_llvm-native and make sure that the mesa recipe takes these variables into account.
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---

Please always include a changelog here, especially when sending multiple
versions in rapid succession.

>  meta/conf/distro/include/default-providers.inc | 2 ++
>  meta/recipes-graphics/mesa/mesa.inc            | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
> index d18173c744..819d71628b 100644
> --- a/meta/conf/distro/include/default-providers.inc
> +++ b/meta/conf/distro/include/default-providers.inc
> @@ -37,6 +37,8 @@ PREFERRED_PROVIDER_dbus-glib ?= "dbus-glib"
>  PREFERRED_PROVIDER_dbus-glib-native ?= "dbus-glib-native"
>  PREFERRED_PROVIDER_gdk-pixbuf ?= "gdk-pixbuf"
>  PREFERRED_PROVIDER_libgcc ?= "libgcc"
> +PREFERRED_PROVIDER_llvm ?= "llvm"
> +PREFERRED_PROVIDER_llvm-native ?= "llvm-native"
>  PREFERRED_PROVIDER_nativesdk-libgcc ?= "nativesdk-libgcc"
>  PREFERRED_PROVIDER_linux-libc-headers ?= "linux-libc-headers"
>  PREFERRED_PROVIDER_nativesdk-linux-libc-headers ?= "nativesdk-linux-libc-headers"
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index e5c405a972..1a971242c9 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -183,7 +183,7 @@ GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',r600',
>  GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'virgl', ',virgl', '', d)}"
>  
>  PACKAGECONFIG[gallium] = "-Dgallium-drivers=${@strip_comma('${GALLIUMDRIVERS}')}, -Dgallium-drivers='', libdrm"
> -PACKAGECONFIG[gallium-llvm] = "-Dllvm=enabled -Dshared-llvm=enabled, -Dllvm=disabled, llvm llvm-native elfutils"
> +PACKAGECONFIG[gallium-llvm] = "-Dllvm=enabled -Dshared-llvm=enabled, -Dllvm=disabled, ${PREFERRED_PROVIDER_llvm} ${PREFERRED_PROVIDER_llvm-native} elfutils"
>  PACKAGECONFIG[xa]  = "-Dgallium-xa=enabled, -Dgallium-xa=disabled"
>  PACKAGECONFIG[va] = "-Dgallium-va=enabled,-Dgallium-va=disabled,libva-initial"
>  PACKAGECONFIG[vdpau] = "-Dgallium-vdpau=enabled,-Dgallium-vdpau=disabled,libvdpau"
> -- 
> 2.42.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191289): https://lists.openembedded.org/g/openembedded-core/message/191289
> Mute This Topic: https://lists.openembedded.org/mt/102826427/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


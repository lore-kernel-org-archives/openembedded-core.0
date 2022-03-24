Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE332C433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 13:26:12 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.10833.1648128371085868307
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Mar 2022 06:26:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Y6eqELPz;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 11A72240014;
	Thu, 24 Mar 2022 13:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1648128369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sy92Yu5/IWOQePuc//+MFmhe/pu5+P/4RfW/apZJMhg=;
	b=Y6eqELPzYu7CeGxRevO/XBkLUL/9Gm4bXgFfsmzEcYpbyZ7daHRa7fJjRAjKFBaTBlIS10
	wJN+KM5eS+EZYEHA5TtmAENv1JikI1kJMHP30sHVffEI7AzEQj/tUzo96jsOJRohRpGIJv
	Us13usaLsOSwXC4qnaS/CvzITRskWoJ5LA3IbaMY0NEYY6/JdQubr1LG9iElf/qVvdcjKq
	G8rtNcWukZRvx8I8aMuTjItKuKjNX+hF6atipeiuuEsBQ8do5wbQwVfSw90EZw7IWxWcH3
	q/JUNhCS/7rItNmWHP33XkokrWakuIVOYT0lbHIWQe21mUJYDi0PcTeCZAqTJQ==
Date: Thu, 24 Mar 2022 14:26:08 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3] qemu: Depend on libepoxy instead of
 virtual/libgl
Message-ID: <YjxxcJddO/Sjvw/s@piout.net>
References: <20220324021141.2159404-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220324021141.2159404-1-raj.khem@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Mar 2022 13:26:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163609

Hi Khem,

On 23/03/2022 19:11:41-0700, Khem Raj wrote:
> - This abstracts on GL/GLES implementations
> - Rename packageconfig to epoxy to match what code it doing underneath

This is not working either and I guess we will need to go and fix all
the layers using the glx packageconfig:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3413

> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Rename packageconfig to epoxy as it matches code
> v3: Depend on libepoxy instead of virtual/egl
> 
>  meta/recipes-devtools/qemu/qemu.inc      | 6 +++---
>  meta/recipes-devtools/qemu/qemu_6.2.0.bb | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index 78aea71cc05..e9d2dae0405 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -142,8 +142,8 @@ do_install:append() {
>  # END of qemu-mips workaround
>  
>  # Disable kvm/virgl/mesa on targets that do not support it
> -PACKAGECONFIG:remove:darwin = "kvm virglrenderer glx gtk+"
> -PACKAGECONFIG:remove:mingw32 = "kvm virglrenderer glx gtk+"
> +PACKAGECONFIG:remove:darwin = "kvm virglrenderer epoxy gtk+"
> +PACKAGECONFIG:remove:mingw32 = "kvm virglrenderer epoxy gtk+"
>  
>  PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,libsdl2"
>  PACKAGECONFIG[virtfs] = "--enable-virtfs --enable-attr --enable-cap-ng,--disable-virtfs,libcap-ng attr,"
> @@ -165,7 +165,7 @@ PACKAGECONFIG[nettle] = "--enable-nettle,--disable-nettle,nettle"
>  PACKAGECONFIG[libusb] = "--enable-libusb,--disable-libusb,libusb1"
>  PACKAGECONFIG[fdt] = "--enable-fdt,--disable-fdt,dtc"
>  PACKAGECONFIG[alsa] = "--audio-drv-list=default,,alsa-lib"
> -PACKAGECONFIG[glx] = "--enable-opengl,--disable-opengl,virtual/libgl"
> +PACKAGECONFIG[epoxy] = "--enable-opengl,--disable-opengl,libepoxy"
>  PACKAGECONFIG[lzo] = "--enable-lzo,--disable-lzo,lzo"
>  PACKAGECONFIG[numa] = "--enable-numa,--disable-numa,numactl"
>  PACKAGECONFIG[gnutls] = "--enable-gnutls,--disable-gnutls,gnutls"
> diff --git a/meta/recipes-devtools/qemu/qemu_6.2.0.bb b/meta/recipes-devtools/qemu/qemu_6.2.0.bb
> index c7eef0a9d5e..92857adf9c3 100644
> --- a/meta/recipes-devtools/qemu/qemu_6.2.0.bb
> +++ b/meta/recipes-devtools/qemu/qemu_6.2.0.bb
> @@ -17,9 +17,9 @@ EXTRA_OECONF:append:class-nativesdk = " --target-list=${@get_qemu_target_list(d)
>  PACKAGECONFIG ??= " \
>      fdt sdl kvm pie \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer glx', '', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer epoxy', '', d)} \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)} \
>  "
>  PACKAGECONFIG:class-nativesdk ??= "fdt sdl kvm pie \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer glx', '', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer epoxy', '', d)} \
>  "
> -- 
> 2.35.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163600): https://lists.openembedded.org/g/openembedded-core/message/163600
> Mute This Topic: https://lists.openembedded.org/mt/89991450/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


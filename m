Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70AE9C433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 22:56:24 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web10.4096.1648076183473506415
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Mar 2022 15:56:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VLbCP+J/;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6DF69200003;
	Wed, 23 Mar 2022 22:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1648076181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=71lieDakGY+4gm6umaByC3Pc2W8i12APCdoCjE9qQO0=;
	b=VLbCP+J/Hh1y+tV4ITbgWItjM8k7vaEz00tELmFyje92Ebas4/EonJnvHwF7K5dTFV31SN
	2EbFkHzbtJT64jY3k06BPDcJs3WBczL1wrrl2tWEPeCQRmtcR6cnm7qXIuqoGqJSliNSPF
	eHOi6ZyrujfVmxW/LPYWBCB3YMEULjpwCQu1cmG2uVmuGPk/MoV4Z0B1ZgKsAu5VVRMnF4
	sI1CLOP6hu+qc/Ke165hj8qpETIgRTsyRiSlSp4DHokyB7aRE2iERZFi9djuleMLV2KxQB
	uwgSS4xMgU9XpLts2G/ep0krnT8K+9nKOcvwFz0YjypRC47wenZiyXK7LEzP1g==
Date: Wed, 23 Mar 2022 23:56:21 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] qemu: Depend on virtual/egl
Message-ID: <YjullZwSDaEI8yeN@piout.net>
References: <20220323164228.1412729-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220323164228.1412729-1-raj.khem@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Mar 2022 22:56:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163596

Hi Khem,

I sent that to the autobuilders and I think this is the cause of these:

https://autobuilder.yoctoproject.org/typhoon/#builders/120/builds/954/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#builders/75/builds/4930/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#builders/15/builds/5220/steps/11/logs/stdio

On 23/03/2022 09:42:28-0700, Khem Raj wrote:
> - This abstracts on GL/GLES implementations
> - Rename packageconfig to epoxy to match what code it doing underneath
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Rename packageconfig to epoxy as it matches code
> 
>  meta/recipes-devtools/qemu/qemu.inc      | 6 +++---
>  meta/recipes-devtools/qemu/qemu_6.2.0.bb | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index 78aea71cc05..a0d65a9354e 100644
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
> +PACKAGECONFIG[epoxy] = "--enable-opengl,--disable-opengl,virtual/egl"
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
> View/Reply Online (#163590): https://lists.openembedded.org/g/openembedded-core/message/163590
> Mute This Topic: https://lists.openembedded.org/mt/89980121/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB976C43334
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 13:22:23 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.6013.1657113739307509879
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 06:22:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dBfeIxDf;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 061BDFF80C;
	Wed,  6 Jul 2022 13:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1657113737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ELZZkasQQBLfBsSruRwv9n452zQqXHrCvioSwANnQUo=;
	b=dBfeIxDfwJrTTKEnanl+tXmpcOOX7Otun81ukzo7MTj+hU4U+/Eajdyln0L37ASBV34wzZ
	8WRCmb7b6A+fBWD9RukLBPj8txuljPrSxuZIAwmfShUQIDxvZ6H368jKjd2qVepw58UhV5
	nzj435ie2/83W6D8To4wZHwvyGTWKGKWfSXs2DBzAfggHY8os3MBHWwGLo0yAoR5O4fDDO
	N3yHsGmTwPCms+da19FxnyIWqQ0W6IGkYrvq+p8mrepwO/4hUba9yQsWUHN0qQLlyJvxrR
	SOhYpGX/WO88DggPKg7DfM+YOaF728f01/tyOzZfpP/u+bCOxF2qetORV2Tz+A==
Date: Wed, 6 Jul 2022 15:22:16 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 4/7] wayland: update 1.20.0 -> 1.21.0
Message-ID: <YsWMiEtNqsWb60Q8@mail.local>
References: <20220705170339.771017-1-alex@linutronix.de>
 <20220705170339.771017-4-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220705170339.771017-4-alex@linutronix.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 13:22:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167723

Hello Alex,

I guess you have seen it in your build but this is probably the cause of
the meta-mingw failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/5467/steps/12/logs/stdio

On 05/07/2022 19:03:36+0200, Alexander Kanavin wrote:
> Drop the patch, as it is no longer necessary
> (genereated .pc defines everything as relative to the .pc path).
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  ...hardcode-the-path-to-wayland-scanner.patch | 27 -------------------
>  .../{wayland_1.20.0.bb => wayland_1.21.0.bb}  |  5 ++--
>  2 files changed, 2 insertions(+), 30 deletions(-)
>  delete mode 100644 meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-path-to-wayland-scanner.patch
>  rename meta/recipes-graphics/wayland/{wayland_1.20.0.bb => wayland_1.21.0.bb} (90%)
> 
> diff --git a/meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-path-to-wayland-scanner.patch b/meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-path-to-wayland-scanner.patch
> deleted file mode 100644
> index e3e71925b8..0000000000
> --- a/meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-path-to-wayland-scanner.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -From 3e7cd56611aeec274e48a4816bc7c21f74f15be0 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Mon, 17 Feb 2020 21:46:18 +0100
> -Subject: [PATCH] Do not hardcode the path to wayland-scanner
> -
> -This results in host contamination during builds.
> -
> -Upstream-Status: Inappropriate [oe-core specific]
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> -
> ----
> - src/meson.build | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/meson.build b/src/meson.build
> -index 15730a3..61edbc8 100644
> ---- a/src/meson.build
> -+++ b/src/meson.build
> -@@ -52,7 +52,7 @@ if get_option('scanner')
> - 			'datarootdir=' + join_paths('${prefix}', get_option('datadir')),
> - 			'pkgdatadir=' + join_paths('${datarootdir}', meson.project_name()),
> - 			'bindir=' + join_paths('${prefix}', get_option('bindir')),
> --			'wayland_scanner=${bindir}/wayland-scanner'
> -+			'wayland_scanner=wayland-scanner'
> - 		],
> - 		filebase: 'wayland-scanner'
> - 	)
> diff --git a/meta/recipes-graphics/wayland/wayland_1.20.0.bb b/meta/recipes-graphics/wayland/wayland_1.21.0.bb
> similarity index 90%
> rename from meta/recipes-graphics/wayland/wayland_1.20.0.bb
> rename to meta/recipes-graphics/wayland/wayland_1.21.0.bb
> index dd48a29dc4..ce59e601d2 100644
> --- a/meta/recipes-graphics/wayland/wayland_1.20.0.bb
> +++ b/meta/recipes-graphics/wayland/wayland_1.21.0.bb
> @@ -12,12 +12,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b31d8f53b6aaf2b4985d7dd7810a70d1 \
>  
>  DEPENDS = "expat libffi wayland-native"
>  
> -SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
> +SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz \
>             file://run-ptest \
> -           file://0002-Do-not-hardcode-the-path-to-wayland-scanner.patch \
>             file://0001-build-Fix-strndup-detection-on-MinGW.patch \
>             "
> -SRC_URI[sha256sum] = "b8a034154c7059772e0fdbd27dbfcda6c732df29cae56a82274f6ec5d7cd8725"
> +SRC_URI[sha256sum] = "6dc64d7fc16837a693a51cfdb2e568db538bfdc9f457d4656285bb9594ef11ac"
>  
>  UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
>  UPSTREAM_CHECK_REGEX = "wayland-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
> -- 
> 2.30.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167672): https://lists.openembedded.org/g/openembedded-core/message/167672
> Mute This Topic: https://lists.openembedded.org/mt/92189298/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


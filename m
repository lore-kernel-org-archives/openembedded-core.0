Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D21D7C4167B
	for <webhook@archiver.kernel.org>; Sat,  9 Dec 2023 23:47:23 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.32479.1702165637336938831
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Dec 2023 15:47:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=G3Hoe8mG;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8F44660003;
	Sat,  9 Dec 2023 23:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702165635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ecOLlg1dRfBodSSgIfQhi0nALY5y9psIQE0pHE5xTWA=;
	b=G3Hoe8mG6S12Urzqd8Uoq1yuyRcgp+E22jwzMCnZ/GOc+hfBsIQHJHPFaD9UNlHKud8pTE
	DfgAhe6svRc8OYIt0YYo3zQ0nJtsR1kr5EFAWpC+UQIO2Yk4vUSM2S6g0S+rdflDbbyCLU
	bItYjSk42HOBnOMN7bsaUUSIVU8/o30h7pNaoScgeTdy742npiqxT+EgXdyZiHyzpDUxp8
	vZ9artskmLfAw11HE9iKLmFbfxGtnj07Kxhm2n/uNxgQ51X3WD+k6OLdhG9ch8Fm7ePaKI
	Ao3K4QP+DCDgWAJzjDgv7RWZ9xek7jtUodjkxmKj2P29wNptuVHYm46m4goggA==
Date: Sun, 10 Dec 2023 00:47:14 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCH] mesa: upgrade 23.2.1 -> 23.3.0
Message-ID: <202312092347140752b3d5@mail.local>
References: <20231201142309.339816-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201142309.339816-1-f_l_k@t-online.de>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Dec 2023 23:47:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192107

This causes failures on the AB:

https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/6146/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6155/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/6141/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/6091/steps/14/logs/stdio

On 01/12/2023 15:23:09+0100, Markus Volk wrote:
> - build amd vulkan driver for x86 platforms
> - drop included patch
> [https://gitlab.freedesktop.org/mesa/mesa/-/blob/1fbdd37d4c1133ced5eb9812daa1fff04cbf5daa/meson.build#L1711]
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...e-cmake-dependency-detector-for-llvm.patch | 42 -------------------
>  .../{mesa-gl_23.2.1.bb => mesa-gl_23.3.0.bb}  |  0
>  meta/recipes-graphics/mesa/mesa.inc           |  7 ++--
>  .../mesa/{mesa_23.2.1.bb => mesa_23.3.0.bb}   |  0
>  4 files changed, 3 insertions(+), 46 deletions(-)
>  delete mode 100644 meta/recipes-graphics/mesa/files/0001-meson-Disable-cmake-dependency-detector-for-llvm.patch
>  rename meta/recipes-graphics/mesa/{mesa-gl_23.2.1.bb => mesa-gl_23.3.0.bb} (100%)
>  rename meta/recipes-graphics/mesa/{mesa_23.2.1.bb => mesa_23.3.0.bb} (100%)
> 
> diff --git a/meta/recipes-graphics/mesa/files/0001-meson-Disable-cmake-dependency-detector-for-llvm.patch b/meta/recipes-graphics/mesa/files/0001-meson-Disable-cmake-dependency-detector-for-llvm.patch
> deleted file mode 100644
> index 4cded0546d..0000000000
> --- a/meta/recipes-graphics/mesa/files/0001-meson-Disable-cmake-dependency-detector-for-llvm.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From 00d41cd5aa3f4b494dc276c9b4ccdc096310c91f Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Thu, 28 Sep 2023 15:34:22 -0700
> -Subject: [PATCH] meson: use llvm-config instead of cmake to fix linking errors with meson 1.2.1
> -
> -meson dependency auto dependency detection uses cmake and then
> -config-tool to process dependencies, in mesa the logic to detect llvm is
> -using auto detection which means if it finds cmake then it will try to
> -use cmake method. Cmake method works ok except a case when llvm-dev
> -package is installed on the build host then it generates its own
> -native.meson file and ignores OE supplied meson.native file which has
> -correct llvm-config tool specified which is pointing to llvm-config from
> -native sysroot. The generated meson.native file points to one found in
> -/usr/bin and there onwards detector finds native install of llvm and
> -configures that into building native mesa package.
> -
> -Since cmake detector does not always work, disable it by default and use
> -config-tool which works in all cases. This is suggested in below issues
> -too
> -
> -A similar issue is open in meson upstream [1] and mesa [2]
> -
> -[1] https://github.com/mesonbuild/meson/issues/10483
> -[2] https://gitlab.freedesktop.org/mesa/mesa/-/issues/6738
> -
> -Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25438]
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - meson.build | 1 +
> - 1 file changed, 1 insertion(+)
> -
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -1659,6 +1659,7 @@ with_llvm = false
> - if _llvm.allowed()
> -   dep_llvm = dependency(
> -     'llvm',
> -+    method : host_machine.system() == 'windows' ? 'auto' : 'config-tool',
> -     version : _llvm_version,
> -     modules : llvm_modules,
> -     optional_modules : llvm_optional_modules,
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_23.2.1.bb b/meta/recipes-graphics/mesa/mesa-gl_23.3.0.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-gl_23.2.1.bb
> rename to meta/recipes-graphics/mesa/mesa-gl_23.3.0.bb
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index e5c405a972..b3df71cb60 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -18,10 +18,9 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>             file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
>             file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
>             file://0001-gallium-Fix-build-with-llvm-17.patch \
> -           file://0001-meson-Disable-cmake-dependency-detector-for-llvm.patch \
>  "
>  
> -SRC_URI[sha256sum] = "64de0616fc2d801f929ab1ac2a4f16b3e2783c4309a724c8a259b20df8bbc1cc"
> +SRC_URI[sha256sum] = "50f729dd60ed6335b989095baad81ef5edf7cfdd4b4b48b9b955917cb07d69c5"
>  
>  UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
>  
> @@ -105,8 +104,8 @@ PACKAGECONFIG[dri3] = "-Ddri3=enabled, -Ddri3=disabled, xorgproto libxshmfence"
>  # Vulkan drivers need dri3 enabled
>  # amd could be enabled as well but requires gallium-llvm with llvm >= 3.9
>  VULKAN_DRIVERS = ""
> -VULKAN_DRIVERS:append:x86 = ",intel"
> -VULKAN_DRIVERS:append:x86-64 = ",intel"
> +VULKAN_DRIVERS:append:x86 = ",intel,amd"
> +VULKAN_DRIVERS:append:x86-64 = ",intel,amd"
>  # i686 is a 32 bit override for mesa-native
>  VULKAN_DRIVERS:append:i686 = ",intel"
>  VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
> diff --git a/meta/recipes-graphics/mesa/mesa_23.2.1.bb b/meta/recipes-graphics/mesa/mesa_23.3.0.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa_23.2.1.bb
> rename to meta/recipes-graphics/mesa/mesa_23.3.0.bb
> -- 
> 2.42.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191670): https://lists.openembedded.org/g/openembedded-core/message/191670
> Mute This Topic: https://lists.openembedded.org/mt/102916247/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


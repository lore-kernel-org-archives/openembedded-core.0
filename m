Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8D73C433FE
	for <webhook@archiver.kernel.org>; Sat, 12 Nov 2022 20:24:26 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web12.723.1668284661304437455
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Nov 2022 12:24:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hHNII9Bn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 077CB40003;
	Sat, 12 Nov 2022 20:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668284659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+XGWA/G4UvstPomj6eusjjg1Yt7mVh5nQIHD4cSup6U=;
	b=hHNII9BnyoJ2ZgFMgUI4tsHCX8gWPZOUtnvZ2ut88zrrn7gV8VCH7uVuYQI6alsu5UzDF4
	7/4gloXeBOP/ReVxAbjNwRSUX5RSmZbAkCvtB5PGjJ8TQcMU49QNeQanwWEwiHhjm4B9ao
	DIl8AaFdPbEaTTHbu/wEQ6eHyagIz8dWtXMzFAKjTbKRDt2m7668YkItPJqXZcGkFuUcMh
	tDl3eoic8PQ8avfwhCdulGJp3ziud5uxttCXFUTNXZd1p8nPv4R1kdju8R2soqYR+WVkyf
	zSbHj2e613EbeFMzZnup2WhuGq9o4Jfn8b6NM61x4H/XX5sLWZrgGhCL7Xc/ig==
Date: Sat, 12 Nov 2022 21:24:18 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Christoph Lauer <christoph.lauer@email.de>
Cc: openembedded-core@lists.openembedded.org,
	Christoph Lauer <christoph.lauer@xtronic.de>
Subject: Re: [OE-core] [PATCH] initial configs: set PREFERRED_PROVIDERs as
 weaker defaults
Message-ID: <Y3AA8sIAiX9qUYiU@mail.local>
References: <20221112155815.39110-1-christoph.lauer@email.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221112155815.39110-1-christoph.lauer@email.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Nov 2022 20:24:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173165

Hello,

On 12/11/2022 15:58:15+0000, Christoph Lauer wrote:
> From: Christoph Lauer <christoph.lauer@xtronic.de>
> 
> This gives BSP creators the flexibility to change PREFERRED_PROVIDERs with weak defaults
> 
> Signed-off-by: Christoph Lauer <christoph.lauer@xtronic.de>
> ---
>  .../conf/machine/beaglebone-yocto.conf        |  6 +-
>  meta-yocto-bsp/conf/machine/edgerouter.conf   |  2 +-

Please separate the oe-core changes from the meta-yocto changes else, it
is not possible to apply this patch. Your other patch has the same
issue.

>  .../machine/include/genericx86-common.inc     |  4 +-
>  meta/conf/bitbake.conf                        |  2 +-
>  .../conf/distro/include/default-providers.inc | 82 +++++++++----------
>  meta/conf/distro/include/tclibc-baremetal.inc | 10 +--
>  meta/conf/distro/include/tclibc-glibc.inc     | 16 ++--
>  meta/conf/distro/include/tclibc-musl.inc      | 14 ++--
>  meta/conf/distro/include/tclibc-newlib.inc    | 10 +--
>  meta/conf/distro/include/tcmode-default.inc   | 20 ++---
>  meta/conf/machine/include/qemu.inc            | 12 +--
>  meta/conf/machine/include/riscv/qemuriscv.inc |  2 +-
>  meta/conf/machine/qemux86-64.conf             | 10 +--
>  meta/conf/machine/qemux86.conf                | 10 +--
>  14 files changed, 100 insertions(+), 100 deletions(-)
> 
> diff --git a/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf b/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
> index 284559c50c..d5c5a4a2ef 100644
> --- a/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
> +++ b/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
> @@ -2,7 +2,7 @@
>  #@NAME: Beaglebone-yocto machine
>  #@DESCRIPTION: Reference machine configuration for http://beagleboard.org/bone and http://beagleboard.org/black boards
> 
> -PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
> +PREFERRED_PROVIDER_virtual/xserver ??= "xserver-xorg"
>  XSERVER ?= "xserver-xorg \
>             xf86-video-modesetting \
>             "
> @@ -23,14 +23,14 @@ do_image_wic[depends] += "mtools-native:do_populate_sysroot dosfstools-native:do
>  SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyO0 115200;ttyAMA0"
>  SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
> 
> -PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
> +PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"
>  PREFERRED_VERSION_linux-yocto ?= "5.15%"
> 
>  KERNEL_IMAGETYPE = "zImage"
>  KERNEL_DEVICETREE = "am335x-bone.dtb am335x-boneblack.dtb am335x-bonegreen.dtb"
>  KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
> 
> -PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot"
> +PREFERRED_PROVIDER_virtual/bootloader ??= "u-boot"
> 
>  SPL_BINARY = "MLO"
>  UBOOT_SUFFIX = "img"
> diff --git a/meta-yocto-bsp/conf/machine/edgerouter.conf b/meta-yocto-bsp/conf/machine/edgerouter.conf
> index 249864e9ce..367d2e091a 100644
> --- a/meta-yocto-bsp/conf/machine/edgerouter.conf
> +++ b/meta-yocto-bsp/conf/machine/edgerouter.conf
> @@ -10,7 +10,7 @@ KERNEL_IMAGETYPE = "vmlinux"
>  KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
>  KERNEL_IMAGE_STRIP_EXTRA_SECTIONS  = ".comment"
> 
> -PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
> +PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"
>  PREFERRED_VERSION_linux-yocto ?= "5.15%"
> 
>  SERIAL_CONSOLES = "115200;ttyS0"
> diff --git a/meta-yocto-bsp/conf/machine/include/genericx86-common.inc b/meta-yocto-bsp/conf/machine/include/genericx86-common.inc
> index 8c5e5522bc..2fe34dcd47 100644
> --- a/meta-yocto-bsp/conf/machine/include/genericx86-common.inc
> +++ b/meta-yocto-bsp/conf/machine/include/genericx86-common.inc
> @@ -3,8 +3,8 @@ require conf/machine/include/x86/qemuboot-x86.inc
>  MACHINE_FEATURES += "wifi efi pcbios"
> 
>  PREFERRED_VERSION_linux-yocto ?= "5.15%"
> -PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
> -PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
> +PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"
> +PREFERRED_PROVIDER_virtual/xserver ??= "xserver-xorg"
>  XSERVER ?= "${XSERVER_X86_BASE} \
>              ${XSERVER_X86_EXT} \
>              ${XSERVER_X86_I915} \
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index a1f0f624e9..dea573986d 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -758,7 +758,7 @@ FAKEROOTENV = "PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_LOCALSTATE
>  FAKEROOTNOENV = "PSEUDO_UNLOAD=1"
>  FAKEROOTDIRS = "${PSEUDO_LOCALSTATEDIR}"
>  FAKEROOTLOGS = "${WORKDIR}/pseudo/pseudo.log"
> -PREFERRED_PROVIDER_virtual/fakeroot-native ?= "pseudo-native"
> +PREFERRED_PROVIDER_virtual/fakeroot-native ??= "pseudo-native"
> 
>  ##################################################################
>  # Not sure about the rest of this yet.
> diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
> index 6defdca12d..95f02e1c98 100644
> --- a/meta/conf/distro/include/default-providers.inc
> +++ b/meta/conf/distro/include/default-providers.inc
> @@ -1,23 +1,23 @@
>  #
>  # Default virtual providers
>  #
> -PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
> -PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xorg"
> -PREFERRED_PROVIDER_virtual/egl ?= "mesa"
> -PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
> -PREFERRED_PROVIDER_virtual/libgl-native ?= "mesa-native"
> -PREFERRED_PROVIDER_virtual/nativesdk-libgl ?= "nativesdk-mesa"
> -PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
> -PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
> -PREFERRED_PROVIDER_virtual/libgles3 ?= "mesa"
> -PREFERRED_PROVIDER_virtual/mesa ?= "mesa"
> -PREFERRED_PROVIDER_virtual/update-alternatives ?= "opkg-utils"
> -PREFERRED_PROVIDER_virtual/update-alternatives-native ?= "opkg-utils-native"
> -PREFERRED_PROVIDER_virtual/libx11 ?= "libx11"
> -PREFERRED_PROVIDER_virtual/base-utils ?= "busybox"
> -PREFERRED_PROVIDER_xf86-video-intel ?= "xf86-video-intel"
> -PREFERRED_PROVIDER_virtual/make ?= "make"
> -PREFERRED_PROVIDER_virtual/make-native ?= "make-native"
> +PREFERRED_PROVIDER_virtual/xserver ??= "xserver-xorg"
> +PREFERRED_PROVIDER_virtual/xserver-xf86 ??= "xserver-xorg"
> +PREFERRED_PROVIDER_virtual/egl ??= "mesa"
> +PREFERRED_PROVIDER_virtual/libgl ??= "mesa"
> +PREFERRED_PROVIDER_virtual/libgl-native ??= "mesa-native"
> +PREFERRED_PROVIDER_virtual/nativesdk-libgl ??= "nativesdk-mesa"
> +PREFERRED_PROVIDER_virtual/libgles1 ??= "mesa"
> +PREFERRED_PROVIDER_virtual/libgles2 ??= "mesa"
> +PREFERRED_PROVIDER_virtual/libgles3 ??= "mesa"
> +PREFERRED_PROVIDER_virtual/mesa ??= "mesa"
> +PREFERRED_PROVIDER_virtual/update-alternatives ??= "opkg-utils"
> +PREFERRED_PROVIDER_virtual/update-alternatives-native ??= "opkg-utils-native"
> +PREFERRED_PROVIDER_virtual/libx11 ??= "libx11"
> +PREFERRED_PROVIDER_virtual/base-utils ??= "busybox"
> +PREFERRED_PROVIDER_xf86-video-intel ??= "xf86-video-intel"
> +PREFERRED_PROVIDER_virtual/make ??= "make"
> +PREFERRED_PROVIDER_virtual/make-native ??= "make-native"
> 
>  #
>  # Default virtual runtime providers
> @@ -33,29 +33,29 @@ VIRTUAL-RUNTIME_base-utils-syslog ?= "busybox-syslog"
>  #
>  # Default recipe providers
>  #
> -PREFERRED_PROVIDER_dbus-glib ?= "dbus-glib"
> -PREFERRED_PROVIDER_dbus-glib-native ?= "dbus-glib-native"
> -PREFERRED_PROVIDER_gdk-pixbuf ?= "gdk-pixbuf"
> -PREFERRED_PROVIDER_libgcc ?= "libgcc"
> -PREFERRED_PROVIDER_nativesdk-libgcc ?= "nativesdk-libgcc"
> -PREFERRED_PROVIDER_linux-libc-headers ?= "linux-libc-headers"
> -PREFERRED_PROVIDER_nativesdk-linux-libc-headers ?= "nativesdk-linux-libc-headers"
> -PREFERRED_PROVIDER_matchbox-panel ?= "matchbox-panel-2"
> -PREFERRED_PROVIDER_opkg ?= "opkg"
> -PREFERRED_PROVIDER_opkg-native ?= "opkg-native"
> -PREFERRED_PROVIDER_nativesdk-opkg ?= "nativesdk-opkg"
> -PREFERRED_PROVIDER_console-tools ?= "kbd"
> -PREFERRED_PROVIDER_gzip-native ?= "pigz-native"
> -PREFERRED_PROVIDER_udev ?= "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','eudev',d)}"
> +PREFERRED_PROVIDER_dbus-glib ??= "dbus-glib"
> +PREFERRED_PROVIDER_dbus-glib-native ??= "dbus-glib-native"
> +PREFERRED_PROVIDER_gdk-pixbuf ??= "gdk-pixbuf"
> +PREFERRED_PROVIDER_libgcc ??= "libgcc"
> +PREFERRED_PROVIDER_nativesdk-libgcc ??= "nativesdk-libgcc"
> +PREFERRED_PROVIDER_linux-libc-headers ??= "linux-libc-headers"
> +PREFERRED_PROVIDER_nativesdk-linux-libc-headers ??= "nativesdk-linux-libc-headers"
> +PREFERRED_PROVIDER_matchbox-panel ??= "matchbox-panel-2"
> +PREFERRED_PROVIDER_opkg ??= "opkg"
> +PREFERRED_PROVIDER_opkg-native ??= "opkg-native"
> +PREFERRED_PROVIDER_nativesdk-opkg ??= "nativesdk-opkg"
> +PREFERRED_PROVIDER_console-tools ??= "kbd"
> +PREFERRED_PROVIDER_gzip-native ??= "pigz-native"
> +PREFERRED_PROVIDER_udev ??= "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','eudev',d)}"
>  # Alternative is ltp-ddt in meta-oe: meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb
> -PREFERRED_PROVIDER_ltp ?= "ltp"
> -PREFERRED_PROVIDER_getopt ?= "util-linux-getopt"
> -PREFERRED_PROVIDER_openssl ?= "openssl"
> -PREFERRED_PROVIDER_openssl-native ?= "openssl-native"
> -PREFERRED_PROVIDER_nativesdk-openssl ?= "nativesdk-openssl"
> -PREFERRED_PROVIDER_pkgconfig ?= "pkgconfig"
> -PREFERRED_PROVIDER_nativesdk-pkgconfig ?= "nativesdk-pkgconfig"
> -PREFERRED_PROVIDER_pkgconfig-native ?= "pkgconfig-native"
> -PREFERRED_RPROVIDER_initd-functions ?= "initscripts"
> +PREFERRED_PROVIDER_ltp ??= "ltp"
> +PREFERRED_PROVIDER_getopt ??= "util-linux-getopt"
> +PREFERRED_PROVIDER_openssl ??= "openssl"
> +PREFERRED_PROVIDER_openssl-native ??= "openssl-native"
> +PREFERRED_PROVIDER_nativesdk-openssl ??= "nativesdk-openssl"
> +PREFERRED_PROVIDER_pkgconfig ??= "pkgconfig"
> +PREFERRED_PROVIDER_nativesdk-pkgconfig ??= "nativesdk-pkgconfig"
> +PREFERRED_PROVIDER_pkgconfig-native ??= "pkgconfig-native"
> +PREFERRED_RPROVIDER_initd-functions ??= "initscripts"
> 
> -PREFERRED_PROVIDER_nativesdk-mesa ?= "nativesdk-mesa"
> +PREFERRED_PROVIDER_nativesdk-mesa ??= "nativesdk-mesa"
> diff --git a/meta/conf/distro/include/tclibc-baremetal.inc b/meta/conf/distro/include/tclibc-baremetal.inc
> index f3d27bbaae..2eaafb8bdd 100644
> --- a/meta/conf/distro/include/tclibc-baremetal.inc
> +++ b/meta/conf/distro/include/tclibc-baremetal.inc
> @@ -8,11 +8,11 @@ LIBCOVERRIDE = ":libc-baremetal"
> 
>  ASSUME_PROVIDED += "virtual/libc virtual/libiconv virtual/crypt"
> 
> -PREFERRED_PROVIDER_virtual/libc ?= "musl"
> -PREFERRED_PROVIDER_virtual/libiconv ?= "musl"
> -PREFERRED_PROVIDER_virtual/libintl ?= "gettext"
> -PREFERRED_PROVIDER_virtual/nativesdk-libintl ?= "nativesdk-glibc"
> -PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-glibc"
> +PREFERRED_PROVIDER_virtual/libc ??= "musl"
> +PREFERRED_PROVIDER_virtual/libiconv ??= "musl"
> +PREFERRED_PROVIDER_virtual/libintl ??= "gettext"
> +PREFERRED_PROVIDER_virtual/nativesdk-libintl ??= "nativesdk-glibc"
> +PREFERRED_PROVIDER_virtual/nativesdk-libiconv ??= "nativesdk-glibc"
> 
>  USE_NLS ?= "no"
>  IMAGE_LINGUAS = ""
> diff --git a/meta/conf/distro/include/tclibc-glibc.inc b/meta/conf/distro/include/tclibc-glibc.inc
> index f48d16939e..df58259323 100644
> --- a/meta/conf/distro/include/tclibc-glibc.inc
> +++ b/meta/conf/distro/include/tclibc-glibc.inc
> @@ -6,14 +6,14 @@ LIBCEXTENSION = "${@['', '-gnu'][(d.getVar('ABIEXTENSION') or '') != '']}"
> 
>  LIBCOVERRIDE = ":libc-glibc"
> 
> -PREFERRED_PROVIDER_virtual/libiconv ?= "glibc"
> -PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-glibc"
> -PREFERRED_PROVIDER_virtual/nativesdk-libintl ?= "nativesdk-glibc"
> -PREFERRED_PROVIDER_virtual/libintl ?= "glibc"
> -PREFERRED_PROVIDER_virtual/libc ?= "glibc"
> -PREFERRED_PROVIDER_virtual/nativesdk-libc ?= "nativesdk-glibc"
> -PREFERRED_PROVIDER_virtual/libc-locale ?= "glibc-locale"
> -PREFERRED_PROVIDER_virtual/crypt ?= "libxcrypt"
> +PREFERRED_PROVIDER_virtual/libiconv ??= "glibc"
> +PREFERRED_PROVIDER_virtual/nativesdk-libiconv ??= "nativesdk-glibc"
> +PREFERRED_PROVIDER_virtual/nativesdk-libintl ??= "nativesdk-glibc"
> +PREFERRED_PROVIDER_virtual/libintl ??= "glibc"
> +PREFERRED_PROVIDER_virtual/libc ??= "glibc"
> +PREFERRED_PROVIDER_virtual/nativesdk-libc ??= "nativesdk-glibc"
> +PREFERRED_PROVIDER_virtual/libc-locale ??= "glibc-locale"
> +PREFERRED_PROVIDER_virtual/crypt ??= "libxcrypt"
> 
>  CXXFLAGS += "-fvisibility-inlines-hidden"
> 
> diff --git a/meta/conf/distro/include/tclibc-musl.inc b/meta/conf/distro/include/tclibc-musl.inc
> index 98d7a801ac..1dfa63ddfd 100644
> --- a/meta/conf/distro/include/tclibc-musl.inc
> +++ b/meta/conf/distro/include/tclibc-musl.inc
> @@ -6,13 +6,13 @@ LIBCEXTENSION = "-musl"
> 
>  LIBCOVERRIDE = ":libc-musl"
> 
> -PREFERRED_PROVIDER_virtual/libc ?= "musl"
> -PREFERRED_PROVIDER_virtual/libiconv ?= "musl"
> -PREFERRED_PROVIDER_virtual/libintl ?= "musl"
> -PREFERRED_PROVIDER_virtual/crypt ?= "musl"
> -PREFERRED_PROVIDER_virtual/libc-locale ?= "musl-locales"
> -PREFERRED_PROVIDER_virtual/nativesdk-libintl ?= "nativesdk-glibc"
> -PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-glibc"
> +PREFERRED_PROVIDER_virtual/libc ??= "musl"
> +PREFERRED_PROVIDER_virtual/libiconv ??= "musl"
> +PREFERRED_PROVIDER_virtual/libintl ??= "musl"
> +PREFERRED_PROVIDER_virtual/crypt ??= "musl"
> +PREFERRED_PROVIDER_virtual/libc-locale ??= "musl-locales"
> +PREFERRED_PROVIDER_virtual/nativesdk-libintl ??= "nativesdk-glibc"
> +PREFERRED_PROVIDER_virtual/nativesdk-libiconv ??= "nativesdk-glibc"
> 
>  DISTRO_FEATURES_BACKFILL_CONSIDERED += "ldconfig"
> 
> diff --git a/meta/conf/distro/include/tclibc-newlib.inc b/meta/conf/distro/include/tclibc-newlib.inc
> index 238b430e49..4ecb1d13c7 100644
> --- a/meta/conf/distro/include/tclibc-newlib.inc
> +++ b/meta/conf/distro/include/tclibc-newlib.inc
> @@ -5,11 +5,11 @@
>  LIBCEXTENSION = "-newlib"
>  LIBCOVERRIDE = ":libc-newlib"
> 
> -PREFERRED_PROVIDER_virtual/libc ?= "newlib"
> -PREFERRED_PROVIDER_virtual/libiconv ?= "newlib"
> -PREFERRED_PROVIDER_virtual/libintl ?= "newlib"
> -PREFERRED_PROVIDER_virtual/nativesdk-libintl ?= "nativesdk-glibc"
> -PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-glibc"
> +PREFERRED_PROVIDER_virtual/libc ??= "newlib"
> +PREFERRED_PROVIDER_virtual/libiconv ??= "newlib"
> +PREFERRED_PROVIDER_virtual/libintl ??= "newlib"
> +PREFERRED_PROVIDER_virtual/nativesdk-libintl ??= "nativesdk-glibc"
> +PREFERRED_PROVIDER_virtual/nativesdk-libiconv ??= "nativesdk-glibc"
> 
>  DISTRO_FEATURES_BACKFILL_CONSIDERED += "ldconfig"
> 
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> index 154a9a4ab0..d467aeb785 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -2,16 +2,16 @@
>  # Default toolchain configuration
>  #
> 
> -PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils = "binutils-cross-${TARGET_ARCH}"
> -PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "gcc-cross-${TARGET_ARCH}"
> -PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "gcc-cross-${TARGET_ARCH}"
> -PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}compilerlibs = "gcc-runtime"
> -PREFERRED_PROVIDER_gdb = "gdb"
> +PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils ??= "binutils-cross-${TARGET_ARCH}"
> +PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc ??= "gcc-cross-${TARGET_ARCH}"
> +PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ ??= "gcc-cross-${TARGET_ARCH}"
> +PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}compilerlibs ??= "gcc-runtime"
> +PREFERRED_PROVIDER_gdb ??= "gdb"
> 
> -PREFERRED_PROVIDER_virtual/${SDK_PREFIX}binutils-crosssdk ?= "binutils-crosssdk-${SDK_SYS}"
> -PREFERRED_PROVIDER_virtual/${SDK_PREFIX}gcc = "gcc-crosssdk-${SDK_SYS}"
> -PREFERRED_PROVIDER_virtual/${SDK_PREFIX}g++ = "gcc-crosssdk-${SDK_SYS}"
> -PREFERRED_PROVIDER_virtual/${SDK_PREFIX}compilerlibs = "nativesdk-gcc-runtime"
> +PREFERRED_PROVIDER_virtual/${SDK_PREFIX}binutils-crosssdk ??= "binutils-crosssdk-${SDK_SYS}"
> +PREFERRED_PROVIDER_virtual/${SDK_PREFIX}gcc ??= "gcc-crosssdk-${SDK_SYS}"
> +PREFERRED_PROVIDER_virtual/${SDK_PREFIX}g++ ??= "gcc-crosssdk-${SDK_SYS}"
> +PREFERRED_PROVIDER_virtual/${SDK_PREFIX}compilerlibs ??= "nativesdk-gcc-runtime"
> 
>  # Default libc config
>  PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
> @@ -68,7 +68,7 @@ PREFERRED_VERSION_nativesdk-qemu ?= "${QEMUVERSION}"
>  # Bootstrap Go using a binary release from golang.org.  If you want to bootstrap
>  # from source using the C-implemented Go 1.4 (only supports x86-64 hosts) then use
>  # go-native.
> -PREFERRED_PROVIDER_go-native ?= "go-binary-native"
> +PREFERRED_PROVIDER_go-native ??= "go-binary-native"
>  PREFERRED_VERSION_virtual/${TARGET_PREFIX}go ?= "${GOVERSION}"
>  PREFERRED_VERSION_go-cross-${TUNE_PKGARCH} ?= "${GOVERSION}"
>  PREFERRED_VERSION_go-crosssdk-${SDK_ARCH} ?= "${GOVERSION}"
> diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
> index 0d71bcbbad..d9bed7708d 100644
> --- a/meta/conf/machine/include/qemu.inc
> +++ b/meta/conf/machine/include/qemu.inc
> @@ -1,9 +1,9 @@
> -PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
> -PREFERRED_PROVIDER_virtual/egl ?= "mesa"
> -PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
> -PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
> -PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
> -PREFERRED_PROVIDER_virtual/libgles3 ?= "mesa"
> +PREFERRED_PROVIDER_virtual/xserver ??= "xserver-xorg"
> +PREFERRED_PROVIDER_virtual/egl ??= "mesa"
> +PREFERRED_PROVIDER_virtual/libgl ??= "mesa"
> +PREFERRED_PROVIDER_virtual/libgles1 ??= "mesa"
> +PREFERRED_PROVIDER_virtual/libgles2 ??= "mesa"
> +PREFERRED_PROVIDER_virtual/libgles3 ??= "mesa"
> 
>  XSERVER ?= "xserver-xorg \
>              ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-swrast xserver-xorg-extension-glx', '', d)} \
> diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/machine/include/riscv/qemuriscv.inc
> index 1d32b4a582..0b399ac1f9 100644
> --- a/meta/conf/machine/include/riscv/qemuriscv.inc
> +++ b/meta/conf/machine/include/riscv/qemuriscv.inc
> @@ -1,4 +1,4 @@
> -PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot"
> +PREFERRED_PROVIDER_virtual/bootloader ??= "u-boot"
> 
>  require conf/machine/include/qemu.inc
>  require conf/machine/include/riscv/tune-riscv.inc
> diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
> index 8640867911..fc0456c16b 100644
> --- a/meta/conf/machine/qemux86-64.conf
> +++ b/meta/conf/machine/qemux86-64.conf
> @@ -2,11 +2,11 @@
>  #@NAME: QEMU x86-64 machine
>  #@DESCRIPTION: Machine configuration for running an x86-64 system on QEMU
> 
> -PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
> -PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
> -PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
> -PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
> -PREFERRED_PROVIDER_virtual/libgles3 ?= "mesa"
> +PREFERRED_PROVIDER_virtual/xserver ??= "xserver-xorg"
> +PREFERRED_PROVIDER_virtual/libgl ??= "mesa"
> +PREFERRED_PROVIDER_virtual/libgles1 ??= "mesa"
> +PREFERRED_PROVIDER_virtual/libgles2 ??= "mesa"
> +PREFERRED_PROVIDER_virtual/libgles3 ??= "mesa"
> 
>  require conf/machine/include/qemu.inc
>  DEFAULTTUNE ?= "core2-64"
> diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
> index 1e072e1ae2..778d94379c 100644
> --- a/meta/conf/machine/qemux86.conf
> +++ b/meta/conf/machine/qemux86.conf
> @@ -2,11 +2,11 @@
>  #@NAME: QEMU x86 machine
>  #@DESCRIPTION: Machine configuration for running an x86 system on QEMU
> 
> -PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
> -PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
> -PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
> -PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
> -PREFERRED_PROVIDER_virtual/libgles3 ?= "mesa"
> +PREFERRED_PROVIDER_virtual/xserver ??= "xserver-xorg"
> +PREFERRED_PROVIDER_virtual/libgl ??= "mesa"
> +PREFERRED_PROVIDER_virtual/libgles1 ??= "mesa"
> +PREFERRED_PROVIDER_virtual/libgles2 ??= "mesa"
> +PREFERRED_PROVIDER_virtual/libgles3 ??= "mesa"
> 
>  require conf/machine/include/qemu.inc
>  DEFAULTTUNE ?= "core2-32"
> --
> 2.17.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173162): https://lists.openembedded.org/g/openembedded-core/message/173162
> Mute This Topic: https://lists.openembedded.org/mt/94982116/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


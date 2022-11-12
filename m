Return-Path: <christoph.lauer@email.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 376EFC433FE
	for <webhook@archiver.kernel.org>; Sat, 12 Nov 2022 15:59:00 +0000 (UTC)
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by mx.groups.io with SMTP id smtpd.web10.3975.1668268730804014486
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Nov 2022 07:58:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@email.de header.s=s29768273 header.b=qAKnpH09;
 spf=pass (domain: email.de, ip: 217.72.192.78, mailfrom: christoph.lauer@email.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=email.de;
	s=s29768273; t=1668268727;
	bh=me7sLMx/rHveOOQbMrpNCgI/wsEkdtlHjEap0XZleOo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=qAKnpH09FWMPLwXS0X8mRrSyebFRdGIS2rqUol8FslYCGT2+i5TZ4vNwz3VdD9QlR
	 UUanHnvj3bxuNSY/svcT//bO8/Qunxv/yOqAxrTt2wojGhrIuy5B5C4wnGTunbbpEf
	 sm9DvnjsTzK1VMpmjm3NLwsx2sPzMeLBSgt3Kvkwhqqmqvz5ehBreAUIvMKATbGtBT
	 GXnQBAwLS7pN/tWpIbgUgkmex1F+qAfc9OJyxfabaiS4tktX25uNOOSFarfgsrUzlz
	 sYskCnLTB3qn9prcIpJUCddHFg7t8pUWU6/yeduy8HxDqmTSuTA0J12edPulx1ahjY
	 Yv9d/FmguV37g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from xtr-acuyocto-p01.xtronic-net.com ([178.251.90.190]) by
 smtp.web.de (mrweb105 [213.165.67.124]) with ESMTPSA (Nemesis) id
 1MzkSZ-1pFQ5m2jPV-00vK7v; Sat, 12 Nov 2022 16:58:47 +0100
From: Christoph Lauer <christoph.lauer@email.de>
To: openembedded-core@lists.openembedded.org
Cc: Christoph Lauer <christoph.lauer@xtronic.de>
Subject: [PATCH] initial configs: set PREFERRED_PROVIDERs as weaker defaults
Date: Sat, 12 Nov 2022 15:58:15 +0000
Message-Id: <20221112155815.39110-1-christoph.lauer@email.de>
X-Mailer: git-send-email 2.17.1
X-Provags-ID: V03:K1:/3e+qggaoFln8CriMR/ZO9QuoP42if5sMzvDm9UqrE4cTPbDnBJ
 tvAQLHrcSDQUMSDFCuQ5RTT0KbLRO8YjF0zyN6JtmVjFqdPRjg7y7SHJNHERUkPeVQU0Yin
 iSzB/cuIZxfvAA/CsjA7I9shbV749wEw20INCO4qJkY0vtAX5GznLqt2aKQM9YlhFK8pBoy
 uBe2z3uuGToUix+8Vkg+Q==
UI-OutboundReport: notjunk:1;M01:P0:OFMYmWRfEn4=;sBdVIuiO1TxxMZV2bLy4hSjWPu/
 ebprXy/aj2msUW7CF66amhJjl9yVm14dY3TCTfUuM3fT9Lhr6F7Ve8lVkbj81jTfMzD30kdVi
 AmoT+IwmkdmvvcpTCJWjrPl6SXh8eJ3+9gvybI99CfwCYzdtaaIL+bt1KPYxz8fP1ev6VKImj
 64Qkm4JcX6c/vKTO9B09i6NGvZ6zdyFed/m5G6+0ZUVB6cufogwLTLuszw/STMoBJI3AjMeqO
 JBGwivyQ1M+ZTJHxoncPgbOsMgNAX87Xk2fBTQqfJK3gxHciqw63RRKzkoDYpq2SzZ+GvhCYW
 5XMm9FpGDsTsiekvKcHYie9iaat9UCNmB11tFQHh7eM0gqjoDNbJdKJRvOdxKLqmjLTsz7zMU
 OiQ+SphRAms02tJiEfA0bcql+ZaGJUWYptY8zyGlg1TY40htJNCPD1SNcs6KAJgGoYwbNxXBB
 JXr+vyJOO+N+XueTN+1Qb/SRzyLTGm1bujzj0fV8IEp0RML30h2hzqML3WlQcqkDNJ7tJxPDM
 U7NjNwKmuFOqeb00Mu1uwMv/qrEoL9QqanzDbF7VrtqA3tIFqOL+dDLefzzxI6jyIw0cAenAs
 ZnEVn27nYa6NoVGDS1j/Bro5Ze7+xvST5DhsB2lM8XWX8nf7Mwc8aBhG5fVRjCJmTGGyNbTzN
 P5DBu/HZVx7GRB7+S/Hjtf3p7lubJlvvhh3a0URYamP4mQ08YvdtBollfJJlpsuYpEDigwFdr
 +EIeYz+xLXVoLl2GFXKehPaU+1E1QNuPm/9ShwJsvzG8p7Qo8QSKE+fVqQz4hl59B409iqMtk
 5jc61437FpP0z0oI8IiZpdh5CCFgc4afNBoBYJfBw46cotqQqHK2LsyTrRIEw76nuraNVAFb5
 1/keUmbwqg7HoLvpO53gDxCb24x+Sh8LwJrBdnB6Ov0hWZ5tmEdWKnfcN37cO3ok1Gsq3uXj8
 4dvnTtA+ZvixdwuN1cjxAgnliGs=
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Nov 2022 15:59:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173162

From: Christoph Lauer <christoph.lauer@xtronic.de>

This gives BSP creators the flexibility to change PREFERRED_PROVIDERs with=
 weak defaults

Signed-off-by: Christoph Lauer <christoph.lauer@xtronic.de>
=2D--
 .../conf/machine/beaglebone-yocto.conf        |  6 +-
 meta-yocto-bsp/conf/machine/edgerouter.conf   |  2 +-
 .../machine/include/genericx86-common.inc     |  4 +-
 meta/conf/bitbake.conf                        |  2 +-
 .../conf/distro/include/default-providers.inc | 82 +++++++++----------
 meta/conf/distro/include/tclibc-baremetal.inc | 10 +--
 meta/conf/distro/include/tclibc-glibc.inc     | 16 ++--
 meta/conf/distro/include/tclibc-musl.inc      | 14 ++--
 meta/conf/distro/include/tclibc-newlib.inc    | 10 +--
 meta/conf/distro/include/tcmode-default.inc   | 20 ++---
 meta/conf/machine/include/qemu.inc            | 12 +--
 meta/conf/machine/include/riscv/qemuriscv.inc |  2 +-
 meta/conf/machine/qemux86-64.conf             | 10 +--
 meta/conf/machine/qemux86.conf                | 10 +--
 14 files changed, 100 insertions(+), 100 deletions(-)

diff --git a/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf b/meta-yoct=
o-bsp/conf/machine/beaglebone-yocto.conf
index 284559c50c..d5c5a4a2ef 100644
=2D-- a/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
+++ b/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
@@ -2,7 +2,7 @@
 #@NAME: Beaglebone-yocto machine
 #@DESCRIPTION: Reference machine configuration for http://beagleboard.org=
/bone and http://beagleboard.org/black boards

-PREFERRED_PROVIDER_virtual/xserver ?=3D "xserver-xorg"
+PREFERRED_PROVIDER_virtual/xserver ??=3D "xserver-xorg"
 XSERVER ?=3D "xserver-xorg \
            xf86-video-modesetting \
            "
@@ -23,14 +23,14 @@ do_image_wic[depends] +=3D "mtools-native:do_populate_=
sysroot dosfstools-native:do
 SERIAL_CONSOLES ?=3D "115200;ttyS0 115200;ttyO0 115200;ttyAMA0"
 SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"

-PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
+PREFERRED_PROVIDER_virtual/kernel ??=3D "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?=3D "5.15%"

 KERNEL_IMAGETYPE =3D "zImage"
 KERNEL_DEVICETREE =3D "am335x-bone.dtb am335x-boneblack.dtb am335x-bonegr=
een.dtb"
 KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT}"

-PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot"
+PREFERRED_PROVIDER_virtual/bootloader ??=3D "u-boot"

 SPL_BINARY =3D "MLO"
 UBOOT_SUFFIX =3D "img"
diff --git a/meta-yocto-bsp/conf/machine/edgerouter.conf b/meta-yocto-bsp/=
conf/machine/edgerouter.conf
index 249864e9ce..367d2e091a 100644
=2D-- a/meta-yocto-bsp/conf/machine/edgerouter.conf
+++ b/meta-yocto-bsp/conf/machine/edgerouter.conf
@@ -10,7 +10,7 @@ KERNEL_IMAGETYPE =3D "vmlinux"
 KERNEL_ALT_IMAGETYPE =3D "vmlinux.bin"
 KERNEL_IMAGE_STRIP_EXTRA_SECTIONS  =3D ".comment"

-PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
+PREFERRED_PROVIDER_virtual/kernel ??=3D "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?=3D "5.15%"

 SERIAL_CONSOLES =3D "115200;ttyS0"
diff --git a/meta-yocto-bsp/conf/machine/include/genericx86-common.inc b/m=
eta-yocto-bsp/conf/machine/include/genericx86-common.inc
index 8c5e5522bc..2fe34dcd47 100644
=2D-- a/meta-yocto-bsp/conf/machine/include/genericx86-common.inc
+++ b/meta-yocto-bsp/conf/machine/include/genericx86-common.inc
@@ -3,8 +3,8 @@ require conf/machine/include/x86/qemuboot-x86.inc
 MACHINE_FEATURES +=3D "wifi efi pcbios"

 PREFERRED_VERSION_linux-yocto ?=3D "5.15%"
-PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
-PREFERRED_PROVIDER_virtual/xserver ?=3D "xserver-xorg"
+PREFERRED_PROVIDER_virtual/kernel ??=3D "linux-yocto"
+PREFERRED_PROVIDER_virtual/xserver ??=3D "xserver-xorg"
 XSERVER ?=3D "${XSERVER_X86_BASE} \
             ${XSERVER_X86_EXT} \
             ${XSERVER_X86_I915} \
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index a1f0f624e9..dea573986d 100644
=2D-- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -758,7 +758,7 @@ FAKEROOTENV =3D "PSEUDO_PREFIX=3D${PSEUDO_SYSROOT}${pr=
efix_native} PSEUDO_LOCALSTATE
 FAKEROOTNOENV =3D "PSEUDO_UNLOAD=3D1"
 FAKEROOTDIRS =3D "${PSEUDO_LOCALSTATEDIR}"
 FAKEROOTLOGS =3D "${WORKDIR}/pseudo/pseudo.log"
-PREFERRED_PROVIDER_virtual/fakeroot-native ?=3D "pseudo-native"
+PREFERRED_PROVIDER_virtual/fakeroot-native ??=3D "pseudo-native"

 ##################################################################
 # Not sure about the rest of this yet.
diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/di=
stro/include/default-providers.inc
index 6defdca12d..95f02e1c98 100644
=2D-- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -1,23 +1,23 @@
 #
 # Default virtual providers
 #
-PREFERRED_PROVIDER_virtual/xserver ?=3D "xserver-xorg"
-PREFERRED_PROVIDER_virtual/xserver-xf86 ?=3D "xserver-xorg"
-PREFERRED_PROVIDER_virtual/egl ?=3D "mesa"
-PREFERRED_PROVIDER_virtual/libgl ?=3D "mesa"
-PREFERRED_PROVIDER_virtual/libgl-native ?=3D "mesa-native"
-PREFERRED_PROVIDER_virtual/nativesdk-libgl ?=3D "nativesdk-mesa"
-PREFERRED_PROVIDER_virtual/libgles1 ?=3D "mesa"
-PREFERRED_PROVIDER_virtual/libgles2 ?=3D "mesa"
-PREFERRED_PROVIDER_virtual/libgles3 ?=3D "mesa"
-PREFERRED_PROVIDER_virtual/mesa ?=3D "mesa"
-PREFERRED_PROVIDER_virtual/update-alternatives ?=3D "opkg-utils"
-PREFERRED_PROVIDER_virtual/update-alternatives-native ?=3D "opkg-utils-na=
tive"
-PREFERRED_PROVIDER_virtual/libx11 ?=3D "libx11"
-PREFERRED_PROVIDER_virtual/base-utils ?=3D "busybox"
-PREFERRED_PROVIDER_xf86-video-intel ?=3D "xf86-video-intel"
-PREFERRED_PROVIDER_virtual/make ?=3D "make"
-PREFERRED_PROVIDER_virtual/make-native ?=3D "make-native"
+PREFERRED_PROVIDER_virtual/xserver ??=3D "xserver-xorg"
+PREFERRED_PROVIDER_virtual/xserver-xf86 ??=3D "xserver-xorg"
+PREFERRED_PROVIDER_virtual/egl ??=3D "mesa"
+PREFERRED_PROVIDER_virtual/libgl ??=3D "mesa"
+PREFERRED_PROVIDER_virtual/libgl-native ??=3D "mesa-native"
+PREFERRED_PROVIDER_virtual/nativesdk-libgl ??=3D "nativesdk-mesa"
+PREFERRED_PROVIDER_virtual/libgles1 ??=3D "mesa"
+PREFERRED_PROVIDER_virtual/libgles2 ??=3D "mesa"
+PREFERRED_PROVIDER_virtual/libgles3 ??=3D "mesa"
+PREFERRED_PROVIDER_virtual/mesa ??=3D "mesa"
+PREFERRED_PROVIDER_virtual/update-alternatives ??=3D "opkg-utils"
+PREFERRED_PROVIDER_virtual/update-alternatives-native ??=3D "opkg-utils-n=
ative"
+PREFERRED_PROVIDER_virtual/libx11 ??=3D "libx11"
+PREFERRED_PROVIDER_virtual/base-utils ??=3D "busybox"
+PREFERRED_PROVIDER_xf86-video-intel ??=3D "xf86-video-intel"
+PREFERRED_PROVIDER_virtual/make ??=3D "make"
+PREFERRED_PROVIDER_virtual/make-native ??=3D "make-native"

 #
 # Default virtual runtime providers
@@ -33,29 +33,29 @@ VIRTUAL-RUNTIME_base-utils-syslog ?=3D "busybox-syslog=
"
 #
 # Default recipe providers
 #
-PREFERRED_PROVIDER_dbus-glib ?=3D "dbus-glib"
-PREFERRED_PROVIDER_dbus-glib-native ?=3D "dbus-glib-native"
-PREFERRED_PROVIDER_gdk-pixbuf ?=3D "gdk-pixbuf"
-PREFERRED_PROVIDER_libgcc ?=3D "libgcc"
-PREFERRED_PROVIDER_nativesdk-libgcc ?=3D "nativesdk-libgcc"
-PREFERRED_PROVIDER_linux-libc-headers ?=3D "linux-libc-headers"
-PREFERRED_PROVIDER_nativesdk-linux-libc-headers ?=3D "nativesdk-linux-lib=
c-headers"
-PREFERRED_PROVIDER_matchbox-panel ?=3D "matchbox-panel-2"
-PREFERRED_PROVIDER_opkg ?=3D "opkg"
-PREFERRED_PROVIDER_opkg-native ?=3D "opkg-native"
-PREFERRED_PROVIDER_nativesdk-opkg ?=3D "nativesdk-opkg"
-PREFERRED_PROVIDER_console-tools ?=3D "kbd"
-PREFERRED_PROVIDER_gzip-native ?=3D "pigz-native"
-PREFERRED_PROVIDER_udev ?=3D "${@bb.utils.contains('DISTRO_FEATURES','sys=
temd','systemd','eudev',d)}"
+PREFERRED_PROVIDER_dbus-glib ??=3D "dbus-glib"
+PREFERRED_PROVIDER_dbus-glib-native ??=3D "dbus-glib-native"
+PREFERRED_PROVIDER_gdk-pixbuf ??=3D "gdk-pixbuf"
+PREFERRED_PROVIDER_libgcc ??=3D "libgcc"
+PREFERRED_PROVIDER_nativesdk-libgcc ??=3D "nativesdk-libgcc"
+PREFERRED_PROVIDER_linux-libc-headers ??=3D "linux-libc-headers"
+PREFERRED_PROVIDER_nativesdk-linux-libc-headers ??=3D "nativesdk-linux-li=
bc-headers"
+PREFERRED_PROVIDER_matchbox-panel ??=3D "matchbox-panel-2"
+PREFERRED_PROVIDER_opkg ??=3D "opkg"
+PREFERRED_PROVIDER_opkg-native ??=3D "opkg-native"
+PREFERRED_PROVIDER_nativesdk-opkg ??=3D "nativesdk-opkg"
+PREFERRED_PROVIDER_console-tools ??=3D "kbd"
+PREFERRED_PROVIDER_gzip-native ??=3D "pigz-native"
+PREFERRED_PROVIDER_udev ??=3D "${@bb.utils.contains('DISTRO_FEATURES','sy=
stemd','systemd','eudev',d)}"
 # Alternative is ltp-ddt in meta-oe: meta-oe/recipes-devtools/ltp-ddt/ltp=
-ddt_0.0.4.bb
-PREFERRED_PROVIDER_ltp ?=3D "ltp"
-PREFERRED_PROVIDER_getopt ?=3D "util-linux-getopt"
-PREFERRED_PROVIDER_openssl ?=3D "openssl"
-PREFERRED_PROVIDER_openssl-native ?=3D "openssl-native"
-PREFERRED_PROVIDER_nativesdk-openssl ?=3D "nativesdk-openssl"
-PREFERRED_PROVIDER_pkgconfig ?=3D "pkgconfig"
-PREFERRED_PROVIDER_nativesdk-pkgconfig ?=3D "nativesdk-pkgconfig"
-PREFERRED_PROVIDER_pkgconfig-native ?=3D "pkgconfig-native"
-PREFERRED_RPROVIDER_initd-functions ?=3D "initscripts"
+PREFERRED_PROVIDER_ltp ??=3D "ltp"
+PREFERRED_PROVIDER_getopt ??=3D "util-linux-getopt"
+PREFERRED_PROVIDER_openssl ??=3D "openssl"
+PREFERRED_PROVIDER_openssl-native ??=3D "openssl-native"
+PREFERRED_PROVIDER_nativesdk-openssl ??=3D "nativesdk-openssl"
+PREFERRED_PROVIDER_pkgconfig ??=3D "pkgconfig"
+PREFERRED_PROVIDER_nativesdk-pkgconfig ??=3D "nativesdk-pkgconfig"
+PREFERRED_PROVIDER_pkgconfig-native ??=3D "pkgconfig-native"
+PREFERRED_RPROVIDER_initd-functions ??=3D "initscripts"

-PREFERRED_PROVIDER_nativesdk-mesa ?=3D "nativesdk-mesa"
+PREFERRED_PROVIDER_nativesdk-mesa ??=3D "nativesdk-mesa"
diff --git a/meta/conf/distro/include/tclibc-baremetal.inc b/meta/conf/dis=
tro/include/tclibc-baremetal.inc
index f3d27bbaae..2eaafb8bdd 100644
=2D-- a/meta/conf/distro/include/tclibc-baremetal.inc
+++ b/meta/conf/distro/include/tclibc-baremetal.inc
@@ -8,11 +8,11 @@ LIBCOVERRIDE =3D ":libc-baremetal"

 ASSUME_PROVIDED +=3D "virtual/libc virtual/libiconv virtual/crypt"

-PREFERRED_PROVIDER_virtual/libc ?=3D "musl"
-PREFERRED_PROVIDER_virtual/libiconv ?=3D "musl"
-PREFERRED_PROVIDER_virtual/libintl ?=3D "gettext"
-PREFERRED_PROVIDER_virtual/nativesdk-libintl ?=3D "nativesdk-glibc"
-PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?=3D "nativesdk-glibc"
+PREFERRED_PROVIDER_virtual/libc ??=3D "musl"
+PREFERRED_PROVIDER_virtual/libiconv ??=3D "musl"
+PREFERRED_PROVIDER_virtual/libintl ??=3D "gettext"
+PREFERRED_PROVIDER_virtual/nativesdk-libintl ??=3D "nativesdk-glibc"
+PREFERRED_PROVIDER_virtual/nativesdk-libiconv ??=3D "nativesdk-glibc"

 USE_NLS ?=3D "no"
 IMAGE_LINGUAS =3D ""
diff --git a/meta/conf/distro/include/tclibc-glibc.inc b/meta/conf/distro/=
include/tclibc-glibc.inc
index f48d16939e..df58259323 100644
=2D-- a/meta/conf/distro/include/tclibc-glibc.inc
+++ b/meta/conf/distro/include/tclibc-glibc.inc
@@ -6,14 +6,14 @@ LIBCEXTENSION =3D "${@['', '-gnu'][(d.getVar('ABIEXTENSI=
ON') or '') !=3D '']}"

 LIBCOVERRIDE =3D ":libc-glibc"

-PREFERRED_PROVIDER_virtual/libiconv ?=3D "glibc"
-PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?=3D "nativesdk-glibc"
-PREFERRED_PROVIDER_virtual/nativesdk-libintl ?=3D "nativesdk-glibc"
-PREFERRED_PROVIDER_virtual/libintl ?=3D "glibc"
-PREFERRED_PROVIDER_virtual/libc ?=3D "glibc"
-PREFERRED_PROVIDER_virtual/nativesdk-libc ?=3D "nativesdk-glibc"
-PREFERRED_PROVIDER_virtual/libc-locale ?=3D "glibc-locale"
-PREFERRED_PROVIDER_virtual/crypt ?=3D "libxcrypt"
+PREFERRED_PROVIDER_virtual/libiconv ??=3D "glibc"
+PREFERRED_PROVIDER_virtual/nativesdk-libiconv ??=3D "nativesdk-glibc"
+PREFERRED_PROVIDER_virtual/nativesdk-libintl ??=3D "nativesdk-glibc"
+PREFERRED_PROVIDER_virtual/libintl ??=3D "glibc"
+PREFERRED_PROVIDER_virtual/libc ??=3D "glibc"
+PREFERRED_PROVIDER_virtual/nativesdk-libc ??=3D "nativesdk-glibc"
+PREFERRED_PROVIDER_virtual/libc-locale ??=3D "glibc-locale"
+PREFERRED_PROVIDER_virtual/crypt ??=3D "libxcrypt"

 CXXFLAGS +=3D "-fvisibility-inlines-hidden"

diff --git a/meta/conf/distro/include/tclibc-musl.inc b/meta/conf/distro/i=
nclude/tclibc-musl.inc
index 98d7a801ac..1dfa63ddfd 100644
=2D-- a/meta/conf/distro/include/tclibc-musl.inc
+++ b/meta/conf/distro/include/tclibc-musl.inc
@@ -6,13 +6,13 @@ LIBCEXTENSION =3D "-musl"

 LIBCOVERRIDE =3D ":libc-musl"

-PREFERRED_PROVIDER_virtual/libc ?=3D "musl"
-PREFERRED_PROVIDER_virtual/libiconv ?=3D "musl"
-PREFERRED_PROVIDER_virtual/libintl ?=3D "musl"
-PREFERRED_PROVIDER_virtual/crypt ?=3D "musl"
-PREFERRED_PROVIDER_virtual/libc-locale ?=3D "musl-locales"
-PREFERRED_PROVIDER_virtual/nativesdk-libintl ?=3D "nativesdk-glibc"
-PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?=3D "nativesdk-glibc"
+PREFERRED_PROVIDER_virtual/libc ??=3D "musl"
+PREFERRED_PROVIDER_virtual/libiconv ??=3D "musl"
+PREFERRED_PROVIDER_virtual/libintl ??=3D "musl"
+PREFERRED_PROVIDER_virtual/crypt ??=3D "musl"
+PREFERRED_PROVIDER_virtual/libc-locale ??=3D "musl-locales"
+PREFERRED_PROVIDER_virtual/nativesdk-libintl ??=3D "nativesdk-glibc"
+PREFERRED_PROVIDER_virtual/nativesdk-libiconv ??=3D "nativesdk-glibc"

 DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "ldconfig"

diff --git a/meta/conf/distro/include/tclibc-newlib.inc b/meta/conf/distro=
/include/tclibc-newlib.inc
index 238b430e49..4ecb1d13c7 100644
=2D-- a/meta/conf/distro/include/tclibc-newlib.inc
+++ b/meta/conf/distro/include/tclibc-newlib.inc
@@ -5,11 +5,11 @@
 LIBCEXTENSION =3D "-newlib"
 LIBCOVERRIDE =3D ":libc-newlib"

-PREFERRED_PROVIDER_virtual/libc ?=3D "newlib"
-PREFERRED_PROVIDER_virtual/libiconv ?=3D "newlib"
-PREFERRED_PROVIDER_virtual/libintl ?=3D "newlib"
-PREFERRED_PROVIDER_virtual/nativesdk-libintl ?=3D "nativesdk-glibc"
-PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?=3D "nativesdk-glibc"
+PREFERRED_PROVIDER_virtual/libc ??=3D "newlib"
+PREFERRED_PROVIDER_virtual/libiconv ??=3D "newlib"
+PREFERRED_PROVIDER_virtual/libintl ??=3D "newlib"
+PREFERRED_PROVIDER_virtual/nativesdk-libintl ??=3D "nativesdk-glibc"
+PREFERRED_PROVIDER_virtual/nativesdk-libiconv ??=3D "nativesdk-glibc"

 DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "ldconfig"

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distr=
o/include/tcmode-default.inc
index 154a9a4ab0..d467aeb785 100644
=2D-- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -2,16 +2,16 @@
 # Default toolchain configuration
 #

-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils =3D "binutils-cross-$=
{TARGET_ARCH}"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc =3D "gcc-cross-${TARGET_AR=
CH}"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ =3D "gcc-cross-${TARGET_AR=
CH}"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}compilerlibs =3D "gcc-runtime"
-PREFERRED_PROVIDER_gdb =3D "gdb"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils ??=3D "binutils-cross=
-${TARGET_ARCH}"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc ??=3D "gcc-cross-${TARGET_=
ARCH}"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ ??=3D "gcc-cross-${TARGET_=
ARCH}"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}compilerlibs ??=3D "gcc-runtim=
e"
+PREFERRED_PROVIDER_gdb ??=3D "gdb"

-PREFERRED_PROVIDER_virtual/${SDK_PREFIX}binutils-crosssdk ?=3D "binutils-=
crosssdk-${SDK_SYS}"
-PREFERRED_PROVIDER_virtual/${SDK_PREFIX}gcc =3D "gcc-crosssdk-${SDK_SYS}"
-PREFERRED_PROVIDER_virtual/${SDK_PREFIX}g++ =3D "gcc-crosssdk-${SDK_SYS}"
-PREFERRED_PROVIDER_virtual/${SDK_PREFIX}compilerlibs =3D "nativesdk-gcc-r=
untime"
+PREFERRED_PROVIDER_virtual/${SDK_PREFIX}binutils-crosssdk ??=3D "binutils=
-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/${SDK_PREFIX}gcc ??=3D "gcc-crosssdk-${SDK_SYS=
}"
+PREFERRED_PROVIDER_virtual/${SDK_PREFIX}g++ ??=3D "gcc-crosssdk-${SDK_SYS=
}"
+PREFERRED_PROVIDER_virtual/${SDK_PREFIX}compilerlibs ??=3D "nativesdk-gcc=
-runtime"

 # Default libc config
 PREFERRED_PROVIDER_virtual/gettext ??=3D "gettext"
@@ -68,7 +68,7 @@ PREFERRED_VERSION_nativesdk-qemu ?=3D "${QEMUVERSION}"
 # Bootstrap Go using a binary release from golang.org.  If you want to bo=
otstrap
 # from source using the C-implemented Go 1.4 (only supports x86-64 hosts)=
 then use
 # go-native.
-PREFERRED_PROVIDER_go-native ?=3D "go-binary-native"
+PREFERRED_PROVIDER_go-native ??=3D "go-binary-native"
 PREFERRED_VERSION_virtual/${TARGET_PREFIX}go ?=3D "${GOVERSION}"
 PREFERRED_VERSION_go-cross-${TUNE_PKGARCH} ?=3D "${GOVERSION}"
 PREFERRED_VERSION_go-crosssdk-${SDK_ARCH} ?=3D "${GOVERSION}"
diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/includ=
e/qemu.inc
index 0d71bcbbad..d9bed7708d 100644
=2D-- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -1,9 +1,9 @@
-PREFERRED_PROVIDER_virtual/xserver ?=3D "xserver-xorg"
-PREFERRED_PROVIDER_virtual/egl ?=3D "mesa"
-PREFERRED_PROVIDER_virtual/libgl ?=3D "mesa"
-PREFERRED_PROVIDER_virtual/libgles1 ?=3D "mesa"
-PREFERRED_PROVIDER_virtual/libgles2 ?=3D "mesa"
-PREFERRED_PROVIDER_virtual/libgles3 ?=3D "mesa"
+PREFERRED_PROVIDER_virtual/xserver ??=3D "xserver-xorg"
+PREFERRED_PROVIDER_virtual/egl ??=3D "mesa"
+PREFERRED_PROVIDER_virtual/libgl ??=3D "mesa"
+PREFERRED_PROVIDER_virtual/libgles1 ??=3D "mesa"
+PREFERRED_PROVIDER_virtual/libgles2 ??=3D "mesa"
+PREFERRED_PROVIDER_virtual/libgles3 ??=3D "mesa"

 XSERVER ?=3D "xserver-xorg \
             ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-drive=
r-swrast xserver-xorg-extension-glx', '', d)} \
diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/mac=
hine/include/riscv/qemuriscv.inc
index 1d32b4a582..0b399ac1f9 100644
=2D-- a/meta/conf/machine/include/riscv/qemuriscv.inc
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc
@@ -1,4 +1,4 @@
-PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot"
+PREFERRED_PROVIDER_virtual/bootloader ??=3D "u-boot"

 require conf/machine/include/qemu.inc
 require conf/machine/include/riscv/tune-riscv.inc
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86=
-64.conf
index 8640867911..fc0456c16b 100644
=2D-- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -2,11 +2,11 @@
 #@NAME: QEMU x86-64 machine
 #@DESCRIPTION: Machine configuration for running an x86-64 system on QEMU

-PREFERRED_PROVIDER_virtual/xserver ?=3D "xserver-xorg"
-PREFERRED_PROVIDER_virtual/libgl ?=3D "mesa"
-PREFERRED_PROVIDER_virtual/libgles1 ?=3D "mesa"
-PREFERRED_PROVIDER_virtual/libgles2 ?=3D "mesa"
-PREFERRED_PROVIDER_virtual/libgles3 ?=3D "mesa"
+PREFERRED_PROVIDER_virtual/xserver ??=3D "xserver-xorg"
+PREFERRED_PROVIDER_virtual/libgl ??=3D "mesa"
+PREFERRED_PROVIDER_virtual/libgles1 ??=3D "mesa"
+PREFERRED_PROVIDER_virtual/libgles2 ??=3D "mesa"
+PREFERRED_PROVIDER_virtual/libgles3 ??=3D "mesa"

 require conf/machine/include/qemu.inc
 DEFAULTTUNE ?=3D "core2-64"
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.co=
nf
index 1e072e1ae2..778d94379c 100644
=2D-- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -2,11 +2,11 @@
 #@NAME: QEMU x86 machine
 #@DESCRIPTION: Machine configuration for running an x86 system on QEMU

-PREFERRED_PROVIDER_virtual/xserver ?=3D "xserver-xorg"
-PREFERRED_PROVIDER_virtual/libgl ?=3D "mesa"
-PREFERRED_PROVIDER_virtual/libgles1 ?=3D "mesa"
-PREFERRED_PROVIDER_virtual/libgles2 ?=3D "mesa"
-PREFERRED_PROVIDER_virtual/libgles3 ?=3D "mesa"
+PREFERRED_PROVIDER_virtual/xserver ??=3D "xserver-xorg"
+PREFERRED_PROVIDER_virtual/libgl ??=3D "mesa"
+PREFERRED_PROVIDER_virtual/libgles1 ??=3D "mesa"
+PREFERRED_PROVIDER_virtual/libgles2 ??=3D "mesa"
+PREFERRED_PROVIDER_virtual/libgles3 ??=3D "mesa"

 require conf/machine/include/qemu.inc
 DEFAULTTUNE ?=3D "core2-32"
=2D-
2.17.1



Return-Path: <crg7475@mailbox.org>
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	by mail.openembedded.org (Postfix) with ESMTP id 33C9B7F8A6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2020 14:00:20 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
	[IPv6:2001:67c:2050:105:465:1:1:0])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 47wddx1ChvzQlB7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2020 15:00:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	references:in-reply-to:message-id:date:date:subject:subject:from
	:from:received; s=mail20150812; t=1578837617; bh=hACMRTcaInwiQoj
	M6lAJBjJcwlvTTnEsgrCdLiGbjdU=; b=g59LqAoUPdG5nKTpF2GyU3vm2Wchgtt
	6XlKYDw4lgY5I4lfIo6NK5KsNyB+iFrrxjB6MOdS5BxchQfUl3Z5mW8jFXkvXFoN
	GuhyQgVccb1EjIdOgStzofWKVgFKIiQfp4KSOrSAtcRWqPtLF7PAvWCGDRomtEXf
	SITzeJg/t8S5iOS+h7Pen1zdzWwxGjMaB36ZqXDZ8t73vui+KIY5QqxK6jfd/N0Z
	F2GnLYGk/RQjkeKTo/8cjuz33v5t6jTEyImgmCK2JyNri06KzbgJPM3XGoedwAI3
	YohdNux48pd2WgTe9NOSno7vEK2/XsD2JGJKK5ICjuAb0L1fvImYzpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; t=1578837620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:in-reply-to:in-reply-to:references:references;
	bh=HQbKn2HDUnQ1CFH9hEFO9o2n3e8Y/xvQ4cMiX4OI0+M=;
	b=pufaQstFpVULUaUfHA5rFKpgYqEBBf3oCN281Q/hKH4Rd5AyEV3NfMEHHIyRedqDDA4zkv
	oKicwZDYDxSDQKG+9lzbfjdOCNM2LT3q79z7sbvyvBPP9w7cPsqJWCGxGM/HcZKGwnREdU
	qncTBkyGzDx5VnKa+OCDDrV2OBE5Qhn8g9UPTyrE/6uI8VL/Pl8oUabQiZzRuZ8UbQHEX3
	ok1Tfd+/dH0WK3r+lqgwUtqoyIplD41LZXTj+ncZWZytiYx01hNmX6qu4g8a/3X/B9t3cv
	A7v59Bu2Bylhe92kQIhiFp8kKDOF228vcDobsBwfNLtQj0wE+Y8eIAlIqqns6g==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de
	[80.241.56.117]) (amavisd-new, port 10030) with ESMTP id jdlRo6gOBBp2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2020 15:00:17 +0100 (CET)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Jan 2020 14:59:47 +0100
Message-Id: <20200112135954.23868-5-crg7475@mailbox.org>
In-Reply-To: <20200112135954.23868-1-crg7475@mailbox.org>
References: <20200112135954.23868-1-crg7475@mailbox.org>
Subject: [PATCH 05/12] gstreamer1.0-plugins-bad: Transition to meson based builds
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 12 Jan 2020 14:00:21 -0000

* Removed autotools/M4 related patch
  0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch.

* configure-allow-to-disable-libssh2.patch got replaced by the
  -Dcurl-ssh2 option.

* 0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch is a
  fix for GIR support in the meson.build file.

* New "closedcaption" packageconfigs added.

* Removed "flite" packageconfig since flite-alsa was removed from
  meta-openembedded due it being old and abandoned.

* gettext handling now part of gstreamer1.0-plugins-common.inc.
---
 ...even-when-cross-compiling-if-introsp.patch |  36 +++
 .../configure-allow-to-disable-libssh2.patch  |  61 -----
 .../gstreamer1.0-plugins-bad_1.16.1.bb        | 209 +++++++++---------
 3 files changed, 141 insertions(+), 165 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/configure-allow-to-disable-libssh2.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch
new file mode 100644
index 0000000000..1321852023
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch
@@ -0,0 +1,36 @@
+From 97a4d0cd7de8cfbf983acc7e37ba2f8fb73c3e19 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim-Philipp=20M=C3=BCller?= <tim@centricular.com>
+Date: Fri, 18 Oct 2019 00:39:12 +0100
+Subject: [PATCH 1/2] meson: build gir even when cross-compiling if
+ introspection was enabled explicitly
+
+This can be made to work in certain circumstances when
+cross-compiling, so default to not building g-i stuff
+when cross-compiling, but allow it if introspection was
+enabled explicitly via -Dintrospection=enabled.
+
+See gstreamer/gstreamer#454 and gstreamer/gstreamer#381.
+
+Upstream-Status: Backport [97a4d0cd7de8cfbf983acc7e37ba2f8fb73c3e19]
+
+Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 67aeeb4d0..7b3314bd9 100644
+--- a/meson.build
++++ b/meson.build
+@@ -411,7 +411,7 @@ python3 = import('python').find_installation()
+ 
+ gir = find_program('g-ir-scanner', required : get_option('introspection'))
+ gnome = import('gnome')
+-build_gir = gir.found() and not meson.is_cross_build()
++build_gir = gir.found() and (not meson.is_cross_build() or get_option('introspection').enabled())
+ gir_init_section = [ '--add-init-section=extern void gst_init(gint*,gchar**);' + \
+     'g_setenv("GST_REGISTRY_1.0", "@0@", TRUE);'.format(meson.current_build_dir() + '/gir_empty_registry.reg') + \
+     'g_setenv("GST_PLUGIN_PATH_1_0", "", TRUE);' + \
+-- 
+2.17.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/configure-allow-to-disable-libssh2.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/configure-allow-to-disable-libssh2.patch
deleted file mode 100644
index 25861b6b9d..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/configure-allow-to-disable-libssh2.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From f59c5269f92d59a5296cbfeeb682d42095cd88ad Mon Sep 17 00:00:00 2001
-From: Wenzong Fan <wenzong.fan@windriver.com>
-Date: Thu, 18 Sep 2014 02:24:07 -0400
-Subject: [PATCH] gstreamer1.0-plugins-bad: allow to disable libssh2
-
-libssh2 is automatically linked to if present, this undetermined
-dependency may cause build errors like:
-
-  .../x86_64-poky-linux/4.9.0/ld: cannot find -lssh2
-
-libssh2 isn't an oe-core recipe, so allow to disable it from
-configure.
-
-Upstream-Status: Pending
-
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
----
- configure.ac |   23 +++++++++++++++++------
- 1 file changed, 17 insertions(+), 6 deletions(-)
-
-Index: gst-plugins-bad-1.12.3/configure.ac
-===================================================================
---- gst-plugins-bad-1.12.3.orig/configure.ac
-+++ gst-plugins-bad-1.12.3/configure.ac
-@@ -1202,6 +1202,15 @@ AG_GST_CHECK_FEATURE(CHROMAPRINT, [chrom
- ])
- 
- dnl *** Curl ***
-+AC_ARG_ENABLE([libssh2],
-+     [  --enable-libssh2		enable LIBSSH2 support @<:@default=auto@:>@],
-+     [case "${enableval}" in
-+       yes)  NEED_SSH2=yes ;;
-+       no)   NEED_SSH2=no ;;
-+       auto) NEED_SSH2=auto ;;
-+       *) AC_MSG_ERROR([bad value ${enableval} for --enable-libssh2]) ;;
-+     esac],[NEED_SSH2=auto])
-+
- translit(dnm, m, l) AM_CONDITIONAL(USE_CURL, true)
- AG_GST_CHECK_FEATURE(CURL, [Curl plugin], curl, [
-   PKG_CHECK_MODULES(CURL, libcurl >= 7.35.0, [
-@@ -1224,12 +1233,14 @@ AG_GST_CHECK_FEATURE(CURL, [Curl plugin]
-   ])
-   AC_SUBST(CURL_CFLAGS)
-   AC_SUBST(CURL_LIBS)
--  PKG_CHECK_MODULES(SSH2, libssh2 >= 1.4.3, [
--    HAVE_SSH2="yes"
--    AC_DEFINE(HAVE_SSH2, 1, [Define if libssh2 is available])
--  ], [
--    HAVE_SSH2="no"
--  ])
-+  if test "x$NEED_SSH2" != "xno"; then
-+    PKG_CHECK_MODULES(SSH2, libssh2 >= 1.4.3, [
-+      HAVE_SSH2="yes"
-+      AC_DEFINE(HAVE_SSH2, 1, [Define if libssh2 is available])
-+    ], [
-+      HAVE_SSH2="no"
-+    ])
-+  fi
-   AM_CONDITIONAL(USE_SSH2, test "x$HAVE_SSH2" = "xyes")
-   AC_SUBST(SSH2_CFLAGS)
-   AC_SUBST(SSH2_LIBS)
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb
index ed3efab29f..56ae7a179e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb
@@ -1,12 +1,11 @@
-require gstreamer1.0-plugins.inc
+require gstreamer1.0-plugins-common.inc
 
 SRC_URI = " \
     https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-${PV}.tar.xz \
-    file://configure-allow-to-disable-libssh2.patch \
+    file://0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch \
     file://fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch \
     file://avoid-including-sys-poll.h-directly.patch \
     file://ensure-valid-sentinels-for-gst_structure_get-etc.patch \
-    file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
 "
 SRC_URI[md5sum] = "24d4d30ecc67d5cbc77c0475bcea1210"
 SRC_URI[sha256sum] = "56481c95339b8985af13bac19b18bc8da7118c2a7d9440ed70e7dcd799c2adb5"
@@ -19,7 +18,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
 
 DEPENDS += "gstreamer1.0-plugins-base"
 
-inherit gettext gobject-introspection
+inherit gobject-introspection
 
 PACKAGECONFIG ??= " \
     ${GSTREAMER_ORC} \
@@ -27,112 +26,114 @@ PACKAGECONFIG ??= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'directfb vulkan', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)} \
-    bz2 curl dash dtls hls rsvg sbc smoothstreaming sndfile ttml uvch264 webp \
+    bz2 closedcaption curl dash dtls hls rsvg sbc smoothstreaming sndfile \
+    ttml uvch264 webp \
 "
 
+PACKAGECONFIG[assrender]       = "-Dassrender=enabled,-Dassrender=disabled,libass"
+PACKAGECONFIG[bluez]           = "-Dbluez=enabled,-Dbluez=disabled,bluez5"
+PACKAGECONFIG[bz2]             = "-Dbz2=enabled,-Dbz2=disabled,bzip2"
+PACKAGECONFIG[closedcaption]   = "-Dclosedcaption=enabled,-Dclosedcaption=disabled,pango cairo"
+PACKAGECONFIG[curl]            = "-Dcurl=enabled,-Dcurl=disabled,curl"
+PACKAGECONFIG[dash]            = "-Ddash=enabled,-Ddash=disabled,libxml2"
+PACKAGECONFIG[dc1394]          = "-Ddc1394=enabled,-Ddc1394=disabled,libdc1394"
+PACKAGECONFIG[directfb]        = "-Ddirectfb=enabled,-Ddirectfb=disabled,directfb"
+PACKAGECONFIG[dtls]            = "-Ddtls=enabled,-Ddtls=disabled,openssl"
+PACKAGECONFIG[faac]            = "-Dfaac=enabled,-Dfaac=disabled,faac"
+PACKAGECONFIG[faad]            = "-Dfaad=enabled,-Dfaad=disabled,faad2"
+PACKAGECONFIG[fluidsynth]      = "-Dfluidsynth=enabled,-Dfluidsynth=disabled,fluidsynth"
+PACKAGECONFIG[hls]             = "-Dhls=enabled -Dhls-crypto=nettle,-Dhls=disabled,nettle"
 # the gl packageconfig enables OpenGL elements that haven't been ported
 # to -base yet. They depend on the gstgl library in -base, so we do
 # not add GL dependencies here, since these are taken care of in -base.
-
-PACKAGECONFIG[assrender]       = "--enable-assrender,--disable-assrender,libass"
-PACKAGECONFIG[bluez]           = "--enable-bluez,--disable-bluez,bluez5"
-PACKAGECONFIG[bz2]             = "--enable-bz2,--disable-bz2,bzip2"
-PACKAGECONFIG[curl]            = "--enable-curl,--disable-curl,curl"
-PACKAGECONFIG[dash]            = "--enable-dash,--disable-dash,libxml2"
-PACKAGECONFIG[dc1394]          = "--enable-dc1394,--disable-dc1394,libdc1394"
-PACKAGECONFIG[directfb]        = "--enable-directfb,--disable-directfb,directfb"
-PACKAGECONFIG[dtls]            = "--enable-dtls,--disable-dtls,openssl"
-PACKAGECONFIG[faac]            = "--enable-faac,--disable-faac,faac"
-PACKAGECONFIG[faad]            = "--enable-faad,--disable-faad,faad2"
-PACKAGECONFIG[flite]           = "--enable-flite,--disable-flite,flite-alsa"
-PACKAGECONFIG[fluidsynth]      = "--enable-fluidsynth,--disable-fluidsynth,fluidsynth"
-PACKAGECONFIG[hls]             = "--enable-hls --with-hls-crypto=nettle,--disable-hls,nettle"
-PACKAGECONFIG[gl]              = "--enable-gl,--disable-gl,"
-PACKAGECONFIG[kms]             = "--enable-kms,--disable-kms,libdrm"
-PACKAGECONFIG[libde265]        = "--enable-libde265,--disable-libde265,libde265"
-PACKAGECONFIG[libmms]          = "--enable-libmms,--disable-libmms,libmms"
-PACKAGECONFIG[libssh2]         = "--enable-libssh2,--disable-libssh2,libssh2"
-PACKAGECONFIG[lcms2]           = "--enable-lcms2,--disable-lcms2,lcms"
-PACKAGECONFIG[modplug]         = "--enable-modplug,--disable-modplug,libmodplug"
-PACKAGECONFIG[msdk]            = "--enable-msdk,--disable-msdk,intel-mediasdk"
-PACKAGECONFIG[neon]            = "--enable-neon,--disable-neon,neon"
-PACKAGECONFIG[openal]          = "--enable-openal,--disable-openal,openal-soft"
-PACKAGECONFIG[opencv]          = "--enable-opencv,--disable-opencv,opencv"
-PACKAGECONFIG[openh264]        = "--enable-openh264,--disable-openh264,openh264"
-PACKAGECONFIG[openjpeg]        = "--enable-openjpeg,--disable-openjpeg,openjpeg"
-PACKAGECONFIG[openmpt]         = "--enable-openmpt,--disable-openmpt,libopenmpt"
+PACKAGECONFIG[gl]              = "-Dgl=enabled,-Dgl=disabled,"
+PACKAGECONFIG[kms]             = "-Dkms=enabled,-Dkms=disabled,libdrm"
+PACKAGECONFIG[libde265]        = "-Dlibde265=enabled,-Dlibde265=disabled,libde265"
+PACKAGECONFIG[libmms]          = "-Dlibmms=enabled,-Dlibmms=disabled,libmms"
+PACKAGECONFIG[libssh2]         = "-Dcurl-ssh2=enabled,-Dcurl-ssh2=disabled,libssh2"
+PACKAGECONFIG[lcms2]           = "-Dcolormanagement=enabled,-Dcolormanagement=disabled,lcms"
+PACKAGECONFIG[modplug]         = "-Dmodplug=enabled,-Dmodplug=disabled,libmodplug"
+PACKAGECONFIG[msdk]            = "-Dmsdk=enabled,-Dmsdk=disabled,intel-mediasdk"
+PACKAGECONFIG[neon]            = "-Dneon=enabled,-Dneon=disabled,neon"
+PACKAGECONFIG[openal]          = "-Dopenal=enabled,-Dopenal=disabled,openal-soft"
+PACKAGECONFIG[opencv]          = "-Dopencv=enabled,-Dopencv=disabled,opencv"
+PACKAGECONFIG[openh264]        = "-Dopenh264=enabled,-Dopenh264=disabled,openh264"
+PACKAGECONFIG[openjpeg]        = "-Dopenjpeg=enabled,-Dopenjpeg=disabled,openjpeg"
+PACKAGECONFIG[openmpt]         = "-Dopenmpt=enabled,-Dopenmpt=disabled,libopenmpt"
 # the opus encoder/decoder elements are now in the -base package,
 # but the opus parser remains in -bad
-PACKAGECONFIG[opusparse]       = "--enable-opus,--disable-opus,libopus"
-PACKAGECONFIG[resindvd]        = "--enable-resindvd,--disable-resindvd,libdvdread libdvdnav"
-PACKAGECONFIG[rsvg]            = "--enable-rsvg,--disable-rsvg,librsvg"
-PACKAGECONFIG[rtmp]            = "--enable-rtmp,--disable-rtmp,rtmpdump"
-PACKAGECONFIG[sbc]             = "--enable-sbc,--disable-sbc,sbc"
-PACKAGECONFIG[sctp]            = "--enable-sctp,--disable-sctp,usrsctp"
-PACKAGECONFIG[smoothstreaming] = "--enable-smoothstreaming,--disable-smoothstreaming,libxml2"
-PACKAGECONFIG[sndfile]         = "--enable-sndfile,--disable-sndfile,libsndfile1"
-PACKAGECONFIG[srtp]            = "--enable-srtp,--disable-srtp,libsrtp"
-PACKAGECONFIG[tinyalsa]        = "--enable-tinyalsa,--disable-tinyalsa,tinyalsa"
-PACKAGECONFIG[ttml]            = "--enable-ttml,--disable-ttml,libxml2 pango cairo"
-PACKAGECONFIG[uvch264]         = "--enable-uvch264,--disable-uvch264,libusb1 libgudev"
-PACKAGECONFIG[voaacenc]        = "--enable-voaacenc,--disable-voaacenc,vo-aacenc"
-PACKAGECONFIG[voamrwbenc]      = "--enable-voamrwbenc,--disable-voamrwbenc,vo-amrwbenc"
-PACKAGECONFIG[vulkan]          = "--enable-vulkan,--disable-vulkan,vulkan-loader"
-PACKAGECONFIG[wayland]         = "--enable-wayland,--disable-wayland,wayland-native wayland wayland-protocols libdrm"
-PACKAGECONFIG[webp]            = "--enable-webp,--disable-webp,libwebp"
-PACKAGECONFIG[webrtc]          = "--enable-webrtc,--disable-webrtc,libnice"
-PACKAGECONFIG[webrtcdsp]       = "--enable-webrtcdsp,--disable-webrtcdsp,webrtc-audio-processing"
-PACKAGECONFIG[zbar]            = "--enable-zbar,--disable-zbar,zbar"
+PACKAGECONFIG[opusparse]       = "-Dopus=enabled,-Dopus=disabled,libopus"
+PACKAGECONFIG[resindvd]        = "-Dresindvd=enabled,-Dresindvd=disabled,libdvdread libdvdnav"
+PACKAGECONFIG[rsvg]            = "-Drsvg=enabled,-Drsvg=disabled,librsvg"
+PACKAGECONFIG[rtmp]            = "-Drtmp=enabled,-Drtmp=disabled,rtmpdump"
+PACKAGECONFIG[sbc]             = "-Dsbc=enabled,-Dsbc=disabled,sbc"
+PACKAGECONFIG[sctp]            = "-Dsctp=enabled,-Dsctp=disabled,usrsctp"
+PACKAGECONFIG[smoothstreaming] = "-Dsmoothstreaming=enabled,-Dsmoothstreaming=disabled,libxml2"
+PACKAGECONFIG[sndfile]         = "-Dsndfile=enabled,-Dsndfile=disabled,libsndfile1"
+PACKAGECONFIG[srtp]            = "-Dsrtp=enabled,-Dsrtp=disabled,libsrtp"
+PACKAGECONFIG[tinyalsa]        = "-Dtinyalsa=enabled,-Dtinyalsa=disabled,tinyalsa"
+PACKAGECONFIG[ttml]            = "-Dttml=enabled,-Dttml=disabled,libxml2 pango cairo"
+PACKAGECONFIG[uvch264]         = "-Duvch264=enabled,-Duvch264=disabled,libusb1 libgudev"
+PACKAGECONFIG[voaacenc]        = "-Dvoaacenc=enabled,-Dvoaacenc=disabled,vo-aacenc"
+PACKAGECONFIG[voamrwbenc]      = "-Dvoamrwbenc=enabled,-Dvoamrwbenc=disabled,vo-amrwbenc"
+PACKAGECONFIG[vulkan]          = "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-loader"
+PACKAGECONFIG[wayland]         = "-Dwayland=enabled,-Dwayland=disabled,wayland-native wayland wayland-protocols libdrm"
+PACKAGECONFIG[webp]            = "-Dwebp=enabled,-Dwebp=disabled,libwebp"
+PACKAGECONFIG[webrtc]          = "-Dwebrtc=enabled,-Dwebrtc=disabled,libnice"
+PACKAGECONFIG[webrtcdsp]       = "-Dwebrtcdsp=enabled,-Dwebrtcdsp=disabled,webrtc-audio-processing"
+PACKAGECONFIG[zbar]            = "-Dzbar=enabled,-Dzbar=disabled,zbar"
 
-# these plugins have no corresponding library in OE-core or meta-openembedded:
-#   openni2 winks direct3d directsound winscreencap apple_media iqa
-#   android_media avc bs2b chromaprint dts fdkaac gme gsm kate ladspa
-#   lv2 mpeg2enc mplex musepack nvenc ofa opensles soundtouch
-#   spandsp teletextdec vdpau wasapi wpe x265
+# these plugins currently have no corresponding library in OE-core or meta-openembedded:
+#   aom androidmedia applemedia bs2b chromaprint d3dvideosink
+#   directsound dts fdkaac gme gsm iq kate ladspa lv2 mpeg2enc
+#   mplex musepack nvdec nvenc ofa openexr openni2 opensles
+#   soundtouch spandsp srt teletext vdpau wasapi wildmidi winks
+#   winscreencap wpe x265
 
-EXTRA_OECONF += " \
-    --enable-decklink \
-    --enable-dvb \
-    --enable-fbdev \
-    --enable-ipcpipeline \
-    --enable-netsim \
-    --enable-shm \
-    --disable-android_media \
-    --disable-aom \
-    --disable-apple_media \
-    --disable-avc \
-    --disable-bs2b \
-    --disable-chromaprint \
-    --disable-direct3d \
-    --disable-directsound \
-    --disable-dts \
-    --disable-fdk_aac \
-    --disable-gme \
-    --disable-gsm \
-    --disable-iqa \
-    --disable-kate \
-    --disable-ladspa \
-    --disable-lv2 \
-    --disable-mpeg2enc \
-    --disable-mplex \
-    --disable-musepack \
-    --disable-nvenc \
-    --disable-ofa \
-    --disable-openexr \
-    --disable-openni2 \
-    --disable-opensles \
-    --disable-soundtouch \
-    --disable-spandsp \
-    --disable-srt \
-    --disable-teletextdec \
-    --disable-vdpau \
-    --disable-wasapi \
-    --disable-wildmidi \
-    --disable-winks \
-    --disable-winscreencap \
-    --disable-wpe \
-    --disable-x265 \
-    ${@bb.utils.contains("TUNE_FEATURES", "mx32", "--disable-yadif", "", d)} \
+EXTRA_OEMESON += " \
+    -Ddecklink=enabled \
+    -Ddvb=enabled \
+    -Dfbdev=enabled \
+    -Dipcpipeline=enabled \
+    -Dnetsim=enabled \
+    -Dshm=enabled \
+    -Daom=disabled \
+    -Dandroidmedia=disabled \
+    -Dapplemedia=disabled \
+    -Dbs2b=disabled \
+    -Dchromaprint=disabled \
+    -Dd3dvideosink=disabled \
+    -Ddirectsound=disabled \
+    -Ddts=disabled \
+    -Dfdkaac=disabled \
+    -Dflite=disabled \
+    -Dgme=disabled \
+    -Dgsm=disabled \
+    -Diqa=disabled \
+    -Dkate=disabled \
+    -Dladspa=disabled \
+    -Dlv2=disabled \
+    -Dmpeg2enc=disabled \
+    -Dmplex=disabled \
+    -Dmusepack=disabled \
+    -Dnvdec=disabled \
+    -Dnvenc=disabled \
+    -Dofa=disabled \
+    -Dopenexr=disabled \
+    -Dopenni2=disabled \
+    -Dopensles=disabled \
+    -Dsoundtouch=disabled \
+    -Dspandsp=disabled \
+    -Dsrt=disabled \
+    -Dteletext=disabled \
+    -Dvdpau=disabled \
+    -Dwasapi=disabled \
+    -Dwildmidi=disabled \
+    -Dwinks=disabled \
+    -Dwinscreencap=disabled \
+    -Dwpe=disabled \
+    -Dx265=disabled \
+    ${@bb.utils.contains("TUNE_FEATURES", "mx32", "-Dyadif=disabled", "", d)} \
 "
 
 export OPENCV_PREFIX = "${STAGING_DIR_TARGET}${prefix}"
@@ -140,6 +141,6 @@ export OPENCV_PREFIX = "${STAGING_DIR_TARGET}${prefix}"
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
 
-FILES_${PN}-freeverb += "${datadir}/gstreamer-${LIBV}/presets/GstFreeverb.prs"
-FILES_${PN}-opencv += "${datadir}/gst-plugins-bad/${LIBV}/opencv*"
-FILES_${PN}-voamrwbenc += "${datadir}/gstreamer-${LIBV}/presets/GstVoAmrwbEnc.prs"
+FILES_${PN}-freeverb += "${datadir}/gstreamer-1.0/presets/GstFreeverb.prs"
+FILES_${PN}-opencv += "${datadir}/gst-plugins-bad/1.0/opencv*"
+FILES_${PN}-voamrwbenc += "${datadir}/gstreamer-1.0/presets/GstVoAmrwbEnc.prs"
-- 
2.17.1



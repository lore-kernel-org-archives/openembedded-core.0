Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 486FE785DE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 21:37:10 +0000 (UTC)
Received: from localhost.localdomain (62-178-118-86.cable.dynamic.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 3701D4CB58
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 23:37:11 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Aug 2017 23:36:55 +0200
Message-Id: <1502487421-18235-5-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1502487421-18235-1-git-send-email-dv@pseudoterminal.org>
References: <1502487421-18235-1-git-send-email-dv@pseudoterminal.org>
Subject: [PATCH v2 04/10] gstreamer1.0-plugins-bad: upgrade to version 1.12.2
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
X-List-Received-Date: Fri, 11 Aug 2017 21:37:11 -0000

* Remove backported patches:
  1. 0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch
  2. 0001-smoothstreaming-use-the-duration-from-the-list-of-fr.patch
  3. 0001-mssdemux-improved-live-playback-support.patch

* Refreshed the following patches:
  1. 0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
     Extended patch to include fix for libgstallocators
  2. 0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch
     Updated to apply to 1.12.2
  3. gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch
     Updated to apply to 1.12.2

* Removed license checks in tta directory as it doesn't exist anymore.

* In 1.12.0, old unsupported plugins were removed. As a result, the
  list of unsupported plugins was removed.

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../gstreamer/gstreamer1.0-plugins-bad.inc         |  30 +-
 ...-don-t-hardcode-libtool-name-when-running.patch |  60 +-
 ...G_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch |  42 +-
 ...gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch |  21 +-
 ...1-mssdemux-improved-live-playback-support.patch | 929 ---------------------
 ...ming-implement-adaptivedemux-s-get_live_s.patch | 183 ----
 ...ming-use-the-duration-from-the-list-of-fr.patch |  62 --
 ....10.4.bb => gstreamer1.0-plugins-bad_1.12.2.bb} |  11 +-
 8 files changed, 89 insertions(+), 1249 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-mssdemux-improved-live-playback-support.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-smoothstreaming-use-the-duration-from-the-list-of-fr.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.10.4.bb => gstreamer1.0-plugins-bad_1.12.2.bb} (65%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index e964fef..4677f6d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -70,16 +70,11 @@ PACKAGECONFIG[vulkan]          = "--enable-vulkan,--disable-vulkan,vulkan"
 PACKAGECONFIG[wayland]         = "--enable-wayland,--disable-wayland,wayland-native wayland wayland-protocols"
 PACKAGECONFIG[webp]            = "--enable-webp,--disable-webp,libwebp"
 
-# these plugins have not been ported to 1.0 (yet):
-#   apexsink linsys nas timidity sdl xvid wininet
-#   sndio cdxaparse dccp faceoverlay hdvparse tta mve nuvdemux
-#   patchdetect sdi videomeasure
-
 # these plugins have no corresponding library in OE-core or meta-openembedded:
-#   openni2 winks direct3d directsound winscreencap acm apple_media
+#   openni2 winks direct3d directsound winscreencap acm apple_media iqa
 #   android_media avc bs2b chromaprint daala dts fdkaac gme gsm kate ladspa libde265
-#   lv2 mimic mpeg2enc mplex musepack nvenc ofa openh264 opensles pvr soundtouch spandsp
-#   spc teletextdec tinyalsa vdpau wasapi x265 zbar
+#   lv2 mpeg2enc mplex msdk musepack nvenc ofa openh264 opensles soundtouch spandsp
+#   spc teletextdec tinyalsa vdpau wasapi x265 zbar webrtcdsp
 
 # qt5 support is disabled, because it is not present in OE core, and requires more work than
 # just adding a packageconfig (it requires access to moc, uic, rcc, and qmake paths).
@@ -95,7 +90,6 @@ EXTRA_OECONF += " \
     --enable-vcd \
     --disable-acm \
     --disable-android_media \
-    --disable-apexsink \
     --disable-apple_media \
     --disable-avc \
     --disable-bs2b \
@@ -108,42 +102,34 @@ EXTRA_OECONF += " \
     --disable-fdk_aac \
     --disable-gme \
     --disable-gsm \
+    --disable-iqa \
     --disable-kate \
     --disable-ladspa \
     --disable-libde265 \
-    --disable-libvisual \
-    --disable-linsys \
     --disable-lv2 \
-    --disable-mimic \
     --disable-mpeg2enc \
     --disable-mplex \
+    --disable-msdk \
     --disable-musepack \
-    --disable-nas \
     --disable-nvenc \
     --disable-ofa \
     --disable-openexr \
     --disable-openh264 \
     --disable-openni2 \
     --disable-opensles \
-    --disable-pvr \
     --disable-qt \
-    --disable-sdl \
-    --disable-sdltest \
-    --disable-sndio \
     --disable-soundtouch \
     --disable-spandsp \
     --disable-spc \
     --disable-teletextdec \
-    --disable-timidity \
     --disable-tinyalsa \
     --disable-vdpau \
     --disable-wasapi \
+    --disable-webrtcdsp \
     --disable-wildmidi \
-    --disable-wininet \
     --disable-winks \
     --disable-winscreencap \
     --disable-x265 \
-    --disable-xvid \
     --disable-zbar \
     ${@bb.utils.contains("TUNE_FEATURES", "mx32", "--disable-yadif", "", d)} \
 "
@@ -157,3 +143,7 @@ FILES_${PN}-dev += "${libdir}/gstreamer-${LIBV}/include/gst/gl/gstglconfig.h"
 FILES_${PN}-freeverb += "${datadir}/gstreamer-${LIBV}/presets/GstFreeverb.prs"
 FILES_${PN}-opencv += "${datadir}/gst-plugins-bad/${LIBV}/opencv*"
 FILES_${PN}-voamrwbenc += "${datadir}/gstreamer-${LIBV}/presets/GstVoAmrwbEnc.prs"
+
+do_compile_prepend() {
+    export GIR_EXTRA_LIBS_PATH="${B}/gst-libs/gst/allocators/.libs"
+}
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
index 43f1ee0..8d99dc6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
@@ -1,4 +1,4 @@
-From cff6fbf555a072408c21da1e818209c9d3814dd3 Mon Sep 17 00:00:00 2001
+From 7592e793b3906355d76ca9a59f8fea2749ea2a4e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 27 Oct 2015 14:36:58 +0200
 Subject: [PATCH] Makefile.am: don't hardcode libtool name when running
@@ -7,17 +7,34 @@ Subject: [PATCH] Makefile.am: don't hardcode libtool name when running
 Upstream-Status: Pending [review on oe-core list]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
+%% original patch: 0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
+
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
 ---
- gst-libs/gst/gl/Makefile.am        | 2 +-
- gst-libs/gst/insertbin/Makefile.am | 2 +-
- gst-libs/gst/mpegts/Makefile.am    | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
+ gst-libs/gst/allocators/Makefile.am | 2 +-
+ gst-libs/gst/gl/Makefile.am         | 2 +-
+ gst-libs/gst/insertbin/Makefile.am  | 2 +-
+ gst-libs/gst/mpegts/Makefile.am     | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
 
-Index: gst-plugins-bad-1.10.1/gst-libs/gst/gl/Makefile.am
-===================================================================
---- gst-plugins-bad-1.10.1.orig/gst-libs/gst/gl/Makefile.am
-+++ gst-plugins-bad-1.10.1/gst-libs/gst/gl/Makefile.am
-@@ -171,7 +171,7 @@ GstGL-@GST_API_VERSION@.gir: $(INTROSPEC
+diff --git a/gst-libs/gst/allocators/Makefile.am b/gst-libs/gst/allocators/Makefile.am
+index e50d077..623f092 100644
+--- a/gst-libs/gst/allocators/Makefile.am
++++ b/gst-libs/gst/allocators/Makefile.am
+@@ -37,7 +37,7 @@ GstBadAllocators-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstbadalloca
+ 		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
+ 		--library=libgstbadallocators-@GST_API_VERSION@.la \
+ 		--include=Gst-@GST_API_VERSION@ \
+-		--libtool="$(top_builddir)/libtool" \
++		--libtool="$(LIBTOOL)" \
+ 		--pkg gstreamer-@GST_API_VERSION@ \
+ 		--pkg-export gstreamer-badallocators-@GST_API_VERSION@ \
+ 		--output $@ \
+diff --git a/gst-libs/gst/gl/Makefile.am b/gst-libs/gst/gl/Makefile.am
+index 2ae4773..dfa7a7d 100644
+--- a/gst-libs/gst/gl/Makefile.am
++++ b/gst-libs/gst/gl/Makefile.am
+@@ -178,7 +178,7 @@ GstGL-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstgl-@GST_API_VERSION@
  		--include=Gst-@GST_API_VERSION@ \
  		--include=GstBase-@GST_API_VERSION@ \
  		--include=GstVideo-@GST_API_VERSION@ \
@@ -26,11 +43,11 @@ Index: gst-plugins-bad-1.10.1/gst-libs/gst/gl/Makefile.am
  		--pkg gstreamer-@GST_API_VERSION@ \
  		--pkg gstreamer-base-@GST_API_VERSION@ \
  		--pkg gstreamer-video-@GST_API_VERSION@ \
-Index: gst-plugins-bad-1.10.1/gst-libs/gst/insertbin/Makefile.am
-===================================================================
---- gst-plugins-bad-1.10.1.orig/gst-libs/gst/insertbin/Makefile.am
-+++ gst-plugins-bad-1.10.1/gst-libs/gst/insertbin/Makefile.am
-@@ -45,7 +45,7 @@ GstInsertBin-@GST_API_VERSION@.gir: $(IN
+diff --git a/gst-libs/gst/insertbin/Makefile.am b/gst-libs/gst/insertbin/Makefile.am
+index 1f8ea30..4b98ef6 100644
+--- a/gst-libs/gst/insertbin/Makefile.am
++++ b/gst-libs/gst/insertbin/Makefile.am
+@@ -45,7 +45,7 @@ GstInsertBin-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstinsertbin-@GS
  		--library=libgstinsertbin-@GST_API_VERSION@.la \
  		--include=Gst-@GST_API_VERSION@ \
  		--include=GstBase-@GST_API_VERSION@ \
@@ -39,11 +56,11 @@ Index: gst-plugins-bad-1.10.1/gst-libs/gst/insertbin/Makefile.am
  		--pkg gstreamer-@GST_API_VERSION@ \
  		--pkg gstreamer-base-@GST_API_VERSION@ \
  		--pkg-export gstreamer-insertbin-@GST_API_VERSION@ \
-Index: gst-plugins-bad-1.10.1/gst-libs/gst/mpegts/Makefile.am
-===================================================================
---- gst-plugins-bad-1.10.1.orig/gst-libs/gst/mpegts/Makefile.am
-+++ gst-plugins-bad-1.10.1/gst-libs/gst/mpegts/Makefile.am
-@@ -79,7 +79,7 @@ GstMpegts-@GST_API_VERSION@.gir: $(INTRO
+diff --git a/gst-libs/gst/mpegts/Makefile.am b/gst-libs/gst/mpegts/Makefile.am
+index aeea32e..929d9cc 100644
+--- a/gst-libs/gst/mpegts/Makefile.am
++++ b/gst-libs/gst/mpegts/Makefile.am
+@@ -79,7 +79,7 @@ GstMpegts-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstmpegts-@GST_API_
  		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-video-@GST_API_VERSION@` \
  		--library=libgstmpegts-@GST_API_VERSION@.la \
  		--include=Gst-@GST_API_VERSION@ \
@@ -52,3 +69,6 @@ Index: gst-plugins-bad-1.10.1/gst-libs/gst/mpegts/Makefile.am
  		--pkg gstreamer-@GST_API_VERSION@ \
  		--pkg gstreamer-video-@GST_API_VERSION@ \
  		--pkg-export gstreamer-mpegts-@GST_API_VERSION@ \
+-- 
+2.4.0
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch
index 86a4495..48d93ab 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch
@@ -1,34 +1,38 @@
-From c271503d7e233428ac0323c51d6517113e26bef7 Mon Sep 17 00:00:00 2001
+From 7c8f68c5428380b930579dc9ef27c853264448fd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 1 Dec 2016 00:27:13 -0800
+Date: Mon, 15 May 2017 15:06:11 +0300
 Subject: [PATCH] Prepend PKG_CONFIG_SYSROOT_DIR to pkg-config output
 
 In cross environment we have to prepend the sysroot to the path found by
 pkgconfig since the path returned from pkgconfig does not have sysroot prefixed
 it ends up using the files from host system. If build host has wayland installed
-the build will succeed but if you dont have wayland-protocols installed on build host then
-it wont find the files on build host
+the build will succeed but if you dont have wayland-protocols installed on build
+host then it wont find the files on build host
 
-This should work ok with non sysrooted builds too since in those cases PKG_CONFIG_SYSROOT_DIR
-will be empty
+This should work ok with non sysrooted builds too since
+in those cases PKG_CONFIG_SYSROOT_DIR will be empty
 
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: gst-plugins-bad-1.10.1/configure.ac
-===================================================================
---- gst-plugins-bad-1.10.1.orig/configure.ac
-+++ gst-plugins-bad-1.10.1/configure.ac
-@@ -2233,7 +2233,7 @@ AG_GST_CHECK_FEATURE(WAYLAND, [wayland s
-     PKG_CHECK_MODULES(WAYLAND_PROTOCOLS, wayland-protocols >= 1.4, [
-       if test "x$wayland_scanner" != "x"; then
-         HAVE_WAYLAND="yes"
--        AC_SUBST(WAYLAND_PROTOCOLS_DATADIR, `$PKG_CONFIG --variable=pkgdatadir wayland-protocols`)
-+        AC_SUBST(WAYLAND_PROTOCOLS_DATADIR, ${WAYLAND_PROTOCOLS_SYSROOT_DIR}`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`)
-       else
-         AC_MSG_RESULT([wayland-scanner is required to build the wayland plugin])
-         HAVE_WAYLAND="no"
+diff --git a/configure.ac b/configure.ac
+index e307be6..83cdeb0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2272,7 +2272,7 @@ AG_GST_CHECK_FEATURE(WAYLAND, [wayland sink], wayland , [
+   PKG_CHECK_MODULES(WAYLAND, wayland-client >= 1.4.0 libdrm >= 2.4.55 wayland-protocols >= 1.4, [
+     if test "x$wayland_scanner" != "x"; then
+       HAVE_WAYLAND="yes"
+-      AC_SUBST(WAYLAND_PROTOCOLS_DATADIR, `$PKG_CONFIG --variable=pkgdatadir wayland-protocols`)
++      AC_SUBST(WAYLAND_PROTOCOLS_DATADIR, ${WAYLAND_PROTOCOLS_SYSROOT_DIR}`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`)
+     else
+       AC_MSG_RESULT([wayland-scanner is required to build the wayland plugin])
+       HAVE_WAYLAND="no"
+-- 
+2.4.0
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch
index 9fc91d8..2235a57 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch
@@ -1,24 +1,29 @@
-From a93ca63d01e7cd1e40b5be576992f77fac364bd5 Mon Sep 17 00:00:00 2001
+From 5622ca3b61603dc316a0f1fbede3f9aa353a5e48 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 21 Mar 2016 18:21:17 +0200
+Date: Fri, 12 May 2017 16:47:12 +0300
 Subject: [PATCH] gstreamer-gl.pc.in: don't append GL_CFLAGS to CFLAGS
 
 Dependencies' include directories should not be added in this way;
 it causes problems when cross-compiling in sysroot environments.
 
 Upstream-Status: Pending
+
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
 ---
  pkgconfig/gstreamer-gl.pc.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: gst-plugins-bad-1.10.1/pkgconfig/gstreamer-gl.pc.in
-===================================================================
---- gst-plugins-bad-1.10.1.orig/pkgconfig/gstreamer-gl.pc.in
-+++ gst-plugins-bad-1.10.1/pkgconfig/gstreamer-gl.pc.in
-@@ -10,4 +10,4 @@ Version: @VERSION@
+diff --git a/pkgconfig/gstreamer-gl.pc.in b/pkgconfig/gstreamer-gl.pc.in
+index 8e7a303..d167be1 100644
+--- a/pkgconfig/gstreamer-gl.pc.in
++++ b/pkgconfig/gstreamer-gl.pc.in
+@@ -13,4 +13,4 @@ Version: @VERSION@
  Requires: gstreamer-base-@GST_API_VERSION@ gstreamer-@GST_API_VERSION@
  
- Libs: -L${libdir} -lgstgl-@GST_API_VERSION@ @GL_LIBS@
+ Libs: -L${libdir} -lgstgl-@GST_API_VERSION@
 -Cflags: -I${includedir} -I${libdir}/gstreamer-@GST_API_VERSION@/include @GL_CFLAGS@
 +Cflags: -I${includedir} -I${libdir}/gstreamer-@GST_API_VERSION@/include
+-- 
+2.4.0
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-mssdemux-improved-live-playback-support.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-mssdemux-improved-live-playback-support.patch
deleted file mode 100644
index 4832c18..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-mssdemux-improved-live-playback-support.patch
+++ /dev/null
@@ -1,929 +0,0 @@
-From 73721ad4e9e2d32e1c8b6a3b4aaa98401530e58a Mon Sep 17 00:00:00 2001
-From: Philippe Normand <philn@igalia.com>
-Date: Tue, 29 Nov 2016 14:43:41 +0100
-Subject: [PATCH] mssdemux: improved live playback support
-
-When a MSS server hosts a live stream the fragments listed in the
-manifest usually don't have accurate timestamps and duration, except
-for the first fragment, which additionally stores timing information
-for the few upcoming fragments. In this scenario it is useless to
-periodically fetch and update the manifest and the fragments list can
-be incrementally built by parsing the first/current fragment.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=755036
----
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
- ext/smoothstreaming/Makefile.am               |   2 +
- ext/smoothstreaming/gstmssdemux.c             |  60 ++++++
- ext/smoothstreaming/gstmssfragmentparser.c    | 266 ++++++++++++++++++++++++++
- ext/smoothstreaming/gstmssfragmentparser.h    |  84 ++++++++
- ext/smoothstreaming/gstmssmanifest.c          | 158 ++++++++++++++-
- ext/smoothstreaming/gstmssmanifest.h          |   7 +
- gst-libs/gst/adaptivedemux/gstadaptivedemux.c |  27 ++-
- gst-libs/gst/adaptivedemux/gstadaptivedemux.h |  14 ++
- 8 files changed, 606 insertions(+), 12 deletions(-)
- create mode 100644 ext/smoothstreaming/gstmssfragmentparser.c
- create mode 100644 ext/smoothstreaming/gstmssfragmentparser.h
-
-diff --git a/ext/smoothstreaming/Makefile.am b/ext/smoothstreaming/Makefile.am
-index 4faf9df9f..a5e1ad6ae 100644
---- a/ext/smoothstreaming/Makefile.am
-+++ b/ext/smoothstreaming/Makefile.am
-@@ -13,8 +13,10 @@ libgstsmoothstreaming_la_LIBADD = \
- libgstsmoothstreaming_la_LDFLAGS = ${GST_PLUGIN_LDFLAGS}
- libgstsmoothstreaming_la_SOURCES = gstsmoothstreaming-plugin.c \
- 	gstmssdemux.c \
-+	gstmssfragmentparser.c \
- 	gstmssmanifest.c
- libgstsmoothstreaming_la_LIBTOOLFLAGS = --tag=disable-static
- 
- noinst_HEADERS = gstmssdemux.h \
-+	gstmssfragmentparser.h \
- 	gstmssmanifest.h
-diff --git a/ext/smoothstreaming/gstmssdemux.c b/ext/smoothstreaming/gstmssdemux.c
-index 12fb40497..120d9c22b 100644
---- a/ext/smoothstreaming/gstmssdemux.c
-+++ b/ext/smoothstreaming/gstmssdemux.c
-@@ -135,11 +135,18 @@ gst_mss_demux_stream_update_fragment_info (GstAdaptiveDemuxStream * stream);
- static gboolean gst_mss_demux_seek (GstAdaptiveDemux * demux, GstEvent * seek);
- static gint64
- gst_mss_demux_get_manifest_update_interval (GstAdaptiveDemux * demux);
-+static gint64
-+gst_mss_demux_stream_get_fragment_waiting_time (GstAdaptiveDemuxStream *
-+    stream);
- static GstFlowReturn
- gst_mss_demux_update_manifest_data (GstAdaptiveDemux * demux,
-     GstBuffer * buffer);
- static gboolean gst_mss_demux_get_live_seek_range (GstAdaptiveDemux * demux,
-     gint64 * start, gint64 * stop);
-+static GstFlowReturn gst_mss_demux_data_received (GstAdaptiveDemux * demux,
-+    GstAdaptiveDemuxStream * stream, GstBuffer * buffer);
-+static gboolean
-+gst_mss_demux_requires_periodical_playlist_update (GstAdaptiveDemux * demux);
- 
- static void
- gst_mss_demux_class_init (GstMssDemuxClass * klass)
-@@ -192,10 +199,15 @@ gst_mss_demux_class_init (GstMssDemuxClass * klass)
-       gst_mss_demux_stream_select_bitrate;
-   gstadaptivedemux_class->stream_update_fragment_info =
-       gst_mss_demux_stream_update_fragment_info;
-+  gstadaptivedemux_class->stream_get_fragment_waiting_time =
-+      gst_mss_demux_stream_get_fragment_waiting_time;
-   gstadaptivedemux_class->update_manifest_data =
-       gst_mss_demux_update_manifest_data;
-   gstadaptivedemux_class->get_live_seek_range =
-       gst_mss_demux_get_live_seek_range;
-+  gstadaptivedemux_class->data_received = gst_mss_demux_data_received;
-+  gstadaptivedemux_class->requires_periodical_playlist_update =
-+      gst_mss_demux_requires_periodical_playlist_update;
- 
-   GST_DEBUG_CATEGORY_INIT (mssdemux_debug, "mssdemux", 0, "mssdemux plugin");
- }
-@@ -650,6 +662,13 @@ gst_mss_demux_get_manifest_update_interval (GstAdaptiveDemux * demux)
-   return interval;
- }
- 
-+static gint64
-+gst_mss_demux_stream_get_fragment_waiting_time (GstAdaptiveDemuxStream * stream)
-+{
-+  /* Wait a second for live streams so we don't try premature fragments downloading */
-+  return GST_SECOND;
-+}
-+
- static GstFlowReturn
- gst_mss_demux_update_manifest_data (GstAdaptiveDemux * demux,
-     GstBuffer * buffer)
-@@ -670,3 +689,44 @@ gst_mss_demux_get_live_seek_range (GstAdaptiveDemux * demux, gint64 * start,
- 
-   return gst_mss_manifest_get_live_seek_range (mssdemux->manifest, start, stop);
- }
-+
-+static GstFlowReturn
-+gst_mss_demux_data_received (GstAdaptiveDemux * demux,
-+    GstAdaptiveDemuxStream * stream, GstBuffer * buffer)
-+{
-+  GstMssDemux *mssdemux = GST_MSS_DEMUX_CAST (demux);
-+  GstMssDemuxStream *mssstream = (GstMssDemuxStream *) stream;
-+  gsize available;
-+
-+  if (!gst_mss_manifest_is_live (mssdemux->manifest)) {
-+    return GST_ADAPTIVE_DEMUX_CLASS (parent_class)->data_received (demux,
-+        stream, buffer);
-+  }
-+
-+  if (gst_mss_stream_fragment_parsing_needed (mssstream->manifest_stream)) {
-+    gst_mss_manifest_live_adapter_push (mssstream->manifest_stream, buffer);
-+    available =
-+        gst_mss_manifest_live_adapter_available (mssstream->manifest_stream);
-+    // FIXME: try to reduce this minimal size.
-+    if (available < 4096) {
-+      return GST_FLOW_OK;
-+    } else {
-+      GST_LOG_OBJECT (stream->pad, "enough data, parsing fragment.");
-+      buffer =
-+          gst_mss_manifest_live_adapter_take_buffer (mssstream->manifest_stream,
-+          available);
-+      gst_mss_stream_parse_fragment (mssstream->manifest_stream, buffer);
-+    }
-+  }
-+
-+  return GST_ADAPTIVE_DEMUX_CLASS (parent_class)->data_received (demux, stream,
-+      buffer);
-+}
-+
-+static gboolean
-+gst_mss_demux_requires_periodical_playlist_update (GstAdaptiveDemux * demux)
-+{
-+  GstMssDemux *mssdemux = GST_MSS_DEMUX_CAST (demux);
-+
-+  return (!gst_mss_manifest_is_live (mssdemux->manifest));
-+}
-diff --git a/ext/smoothstreaming/gstmssfragmentparser.c b/ext/smoothstreaming/gstmssfragmentparser.c
-new file mode 100644
-index 000000000..b554d4f31
---- /dev/null
-+++ b/ext/smoothstreaming/gstmssfragmentparser.c
-@@ -0,0 +1,266 @@
-+/*
-+ * Microsoft Smooth-Streaming fragment parsing library
-+ *
-+ * gstmssfragmentparser.h
-+ *
-+ * Copyright (C) 2016 Igalia S.L
-+ * Copyright (C) 2016 Metrological
-+ *   Author: Philippe Normand <philn@igalia.com>
-+ *
-+ * This library is free software; you can redistribute it and/or
-+ * modify it under the terms of the GNU Library General Public
-+ * License as published by the Free Software Foundation; either
-+ * version 2.1 of the License, or (at your option) any later version.
-+ *
-+ * This library is distributed in the hope that it will be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+ * Library General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU Library General Public
-+ * License along with this library (COPYING); if not, write to the
-+ * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
-+ * Boston, MA 02111-1307, USA.
-+ */
-+
-+#include "gstmssfragmentparser.h"
-+#include <gst/base/gstbytereader.h>
-+#include <string.h>
-+
-+GST_DEBUG_CATEGORY_EXTERN (mssdemux_debug);
-+#define GST_CAT_DEFAULT mssdemux_debug
-+
-+void
-+gst_mss_fragment_parser_init (GstMssFragmentParser * parser)
-+{
-+  parser->status = GST_MSS_FRAGMENT_HEADER_PARSER_INIT;
-+  parser->tfrf.entries_count = 0;
-+}
-+
-+void
-+gst_mss_fragment_parser_clear (GstMssFragmentParser * parser)
-+{
-+  parser->tfrf.entries_count = 0;
-+  if (parser->tfrf.entries) {
-+    g_free (parser->tfrf.entries);
-+    parser->tfrf.entries = 0;
-+  }
-+}
-+
-+static gboolean
-+_parse_tfrf_box (GstMssFragmentParser * parser, GstByteReader * reader)
-+{
-+  guint8 version;
-+  guint32 flags = 0;
-+  guint8 fragment_count = 0;
-+  guint8 index = 0;
-+
-+  if (!gst_byte_reader_get_uint8 (reader, &version)) {
-+    GST_ERROR ("Error getting box's version field");
-+    return FALSE;
-+  }
-+
-+  if (!gst_byte_reader_get_uint24_be (reader, &flags)) {
-+    GST_ERROR ("Error getting box's flags field");
-+    return FALSE;
-+  }
-+
-+  gst_byte_reader_get_uint8 (reader, &fragment_count);
-+  parser->tfrf.entries_count = fragment_count;
-+  parser->tfrf.entries =
-+      g_malloc (sizeof (GstTfrfBoxEntry) * parser->tfrf.entries_count);
-+  for (index = 0; index < fragment_count; index++) {
-+    guint64 absolute_time = 0;
-+    guint64 absolute_duration = 0;
-+    if (version & 0x01) {
-+      gst_byte_reader_get_uint64_be (reader, &absolute_time);
-+      gst_byte_reader_get_uint64_be (reader, &absolute_duration);
-+    } else {
-+      guint32 time = 0;
-+      guint32 duration = 0;
-+      gst_byte_reader_get_uint32_be (reader, &time);
-+      gst_byte_reader_get_uint32_be (reader, &duration);
-+      time = ~time;
-+      duration = ~duration;
-+      absolute_time = ~time;
-+      absolute_duration = ~duration;
-+    }
-+    parser->tfrf.entries[index].time = absolute_time;
-+    parser->tfrf.entries[index].duration = absolute_duration;
-+  }
-+
-+  GST_LOG ("tfrf box parsed");
-+  return TRUE;
-+}
-+
-+static gboolean
-+_parse_tfxd_box (GstMssFragmentParser * parser, GstByteReader * reader)
-+{
-+  guint8 version;
-+  guint32 flags = 0;
-+  guint64 absolute_time = 0;
-+  guint64 absolute_duration = 0;
-+
-+  if (!gst_byte_reader_get_uint8 (reader, &version)) {
-+    GST_ERROR ("Error getting box's version field");
-+    return FALSE;
-+  }
-+
-+  if (!gst_byte_reader_get_uint24_be (reader, &flags)) {
-+    GST_ERROR ("Error getting box's flags field");
-+    return FALSE;
-+  }
-+
-+  if (version & 0x01) {
-+    gst_byte_reader_get_uint64_be (reader, &absolute_time);
-+    gst_byte_reader_get_uint64_be (reader, &absolute_duration);
-+  } else {
-+    guint32 time = 0;
-+    guint32 duration = 0;
-+    gst_byte_reader_get_uint32_be (reader, &time);
-+    gst_byte_reader_get_uint32_be (reader, &duration);
-+    time = ~time;
-+    duration = ~duration;
-+    absolute_time = ~time;
-+    absolute_duration = ~duration;
-+  }
-+
-+  parser->tfxd.time = absolute_time;
-+  parser->tfxd.duration = absolute_duration;
-+  GST_LOG ("tfxd box parsed");
-+  return TRUE;
-+}
-+
-+gboolean
-+gst_mss_fragment_parser_add_buffer (GstMssFragmentParser * parser,
-+    GstBuffer * buffer)
-+{
-+  GstByteReader reader;
-+  GstMapInfo info;
-+  guint32 size;
-+  guint32 fourcc;
-+  const guint8 *uuid;
-+  gboolean error = FALSE;
-+  gboolean mdat_box_found = FALSE;
-+
-+  static const guint8 tfrf_uuid[] = {
-+    0xd4, 0x80, 0x7e, 0xf2, 0xca, 0x39, 0x46, 0x95,
-+    0x8e, 0x54, 0x26, 0xcb, 0x9e, 0x46, 0xa7, 0x9f
-+  };
-+
-+  static const guint8 tfxd_uuid[] = {
-+    0x6d, 0x1d, 0x9b, 0x05, 0x42, 0xd5, 0x44, 0xe6,
-+    0x80, 0xe2, 0x14, 0x1d, 0xaf, 0xf7, 0x57, 0xb2
-+  };
-+
-+  static const guint8 piff_uuid[] = {
-+    0xa2, 0x39, 0x4f, 0x52, 0x5a, 0x9b, 0x4f, 0x14,
-+    0xa2, 0x44, 0x6c, 0x42, 0x7c, 0x64, 0x8d, 0xf4
-+  };
-+
-+  if (!gst_buffer_map (buffer, &info, GST_MAP_READ)) {
-+    return FALSE;
-+  }
-+
-+  gst_byte_reader_init (&reader, info.data, info.size);
-+  GST_TRACE ("Total buffer size: %u", gst_byte_reader_get_size (&reader));
-+
-+  size = gst_byte_reader_get_uint32_be_unchecked (&reader);
-+  fourcc = gst_byte_reader_get_uint32_le_unchecked (&reader);
-+  if (fourcc == GST_MSS_FRAGMENT_FOURCC_MOOF) {
-+    GST_TRACE ("moof box found");
-+    size = gst_byte_reader_get_uint32_be_unchecked (&reader);
-+    fourcc = gst_byte_reader_get_uint32_le_unchecked (&reader);
-+    if (fourcc == GST_MSS_FRAGMENT_FOURCC_MFHD) {
-+      gst_byte_reader_skip_unchecked (&reader, size - 8);
-+
-+      size = gst_byte_reader_get_uint32_be_unchecked (&reader);
-+      fourcc = gst_byte_reader_get_uint32_le_unchecked (&reader);
-+      if (fourcc == GST_MSS_FRAGMENT_FOURCC_TRAF) {
-+        size = gst_byte_reader_get_uint32_be_unchecked (&reader);
-+        fourcc = gst_byte_reader_get_uint32_le_unchecked (&reader);
-+        if (fourcc == GST_MSS_FRAGMENT_FOURCC_TFHD) {
-+          gst_byte_reader_skip_unchecked (&reader, size - 8);
-+
-+          size = gst_byte_reader_get_uint32_be_unchecked (&reader);
-+          fourcc = gst_byte_reader_get_uint32_le_unchecked (&reader);
-+          if (fourcc == GST_MSS_FRAGMENT_FOURCC_TRUN) {
-+            GST_TRACE ("trun box found, size: %" G_GUINT32_FORMAT, size);
-+            if (!gst_byte_reader_skip (&reader, size - 8)) {
-+              GST_WARNING ("Failed to skip trun box, enough data?");
-+              error = TRUE;
-+              goto beach;
-+            }
-+          }
-+        }
-+      }
-+    }
-+  }
-+
-+  while (!mdat_box_found) {
-+    GST_TRACE ("remaining data: %u", gst_byte_reader_get_remaining (&reader));
-+    if (!gst_byte_reader_get_uint32_be (&reader, &size)) {
-+      GST_WARNING ("Failed to get box size, enough data?");
-+      error = TRUE;
-+      break;
-+    }
-+
-+    GST_TRACE ("box size: %" G_GUINT32_FORMAT, size);
-+    if (!gst_byte_reader_get_uint32_le (&reader, &fourcc)) {
-+      GST_WARNING ("Failed to get fourcc, enough data?");
-+      error = TRUE;
-+      break;
-+    }
-+
-+    if (fourcc == GST_MSS_FRAGMENT_FOURCC_MDAT) {
-+      GST_LOG ("mdat box found");
-+      mdat_box_found = TRUE;
-+      break;
-+    }
-+
-+    if (fourcc != GST_MSS_FRAGMENT_FOURCC_UUID) {
-+      GST_ERROR ("invalid UUID fourcc: %" GST_FOURCC_FORMAT,
-+          GST_FOURCC_ARGS (fourcc));
-+      error = TRUE;
-+      break;
-+    }
-+
-+    if (!gst_byte_reader_peek_data (&reader, 16, &uuid)) {
-+      GST_ERROR ("not enough data in UUID box");
-+      error = TRUE;
-+      break;
-+    }
-+
-+    if (memcmp (uuid, piff_uuid, 16) == 0) {
-+      gst_byte_reader_skip_unchecked (&reader, size - 8);
-+      GST_LOG ("piff box detected");
-+    }
-+
-+    if (memcmp (uuid, tfrf_uuid, 16) == 0) {
-+      gst_byte_reader_get_data (&reader, 16, &uuid);
-+      if (!_parse_tfrf_box (parser, &reader)) {
-+        GST_ERROR ("txrf box parsing error");
-+        error = TRUE;
-+        break;
-+      }
-+    }
-+
-+    if (memcmp (uuid, tfxd_uuid, 16) == 0) {
-+      gst_byte_reader_get_data (&reader, 16, &uuid);
-+      if (!_parse_tfxd_box (parser, &reader)) {
-+        GST_ERROR ("tfrf box parsing error");
-+        error = TRUE;
-+        break;
-+      }
-+    }
-+  }
-+
-+beach:
-+
-+  if (!error)
-+    parser->status = GST_MSS_FRAGMENT_HEADER_PARSER_FINISHED;
-+
-+  GST_LOG ("Fragment parsing successful: %s", error ? "no" : "yes");
-+  gst_buffer_unmap (buffer, &info);
-+  return !error;
-+}
-diff --git a/ext/smoothstreaming/gstmssfragmentparser.h b/ext/smoothstreaming/gstmssfragmentparser.h
-new file mode 100644
-index 000000000..cf4711865
---- /dev/null
-+++ b/ext/smoothstreaming/gstmssfragmentparser.h
-@@ -0,0 +1,84 @@
-+/*
-+ * Microsoft Smooth-Streaming fragment parsing library
-+ *
-+ * gstmssfragmentparser.h
-+ *
-+ * Copyright (C) 2016 Igalia S.L
-+ * Copyright (C) 2016 Metrological
-+ *   Author: Philippe Normand <philn@igalia.com>
-+ *
-+ * This library is free software; you can redistribute it and/or
-+ * modify it under the terms of the GNU Library General Public
-+ * License as published by the Free Software Foundation; either
-+ * version 2.1 of the License, or (at your option) any later version.
-+ *
-+ * This library is distributed in the hope that it will be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+ * Library General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU Library General Public
-+ * License along with this library (COPYING); if not, write to the
-+ * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
-+ * Boston, MA 02111-1307, USA.
-+ */
-+
-+#ifndef __GST_MSS_FRAGMENT_PARSER_H__
-+#define __GST_MSS_FRAGMENT_PARSER_H__
-+
-+#include <gst/gst.h>
-+
-+G_BEGIN_DECLS
-+
-+#define GST_MSS_FRAGMENT_FOURCC_MOOF GST_MAKE_FOURCC('m','o','o','f')
-+#define GST_MSS_FRAGMENT_FOURCC_MFHD GST_MAKE_FOURCC('m','f','h','d')
-+#define GST_MSS_FRAGMENT_FOURCC_TRAF GST_MAKE_FOURCC('t','r','a','f')
-+#define GST_MSS_FRAGMENT_FOURCC_TFHD GST_MAKE_FOURCC('t','f','h','d')
-+#define GST_MSS_FRAGMENT_FOURCC_TRUN GST_MAKE_FOURCC('t','r','u','n')
-+#define GST_MSS_FRAGMENT_FOURCC_UUID GST_MAKE_FOURCC('u','u','i','d')
-+#define GST_MSS_FRAGMENT_FOURCC_MDAT GST_MAKE_FOURCC('m','d','a','t')
-+
-+typedef struct _GstTfxdBox
-+{
-+  guint8 version;
-+  guint32 flags;
-+
-+  guint64 time;
-+  guint64 duration;
-+} GstTfxdBox;
-+
-+typedef struct _GstTfrfBoxEntry
-+{
-+  guint64 time;
-+  guint64 duration;
-+} GstTfrfBoxEntry;
-+
-+typedef struct _GstTfrfBox
-+{
-+  guint8 version;
-+  guint32 flags;
-+
-+  gint entries_count;
-+  GstTfrfBoxEntry *entries;
-+} GstTfrfBox;
-+
-+typedef enum _GstFragmentHeaderParserStatus
-+{
-+  GST_MSS_FRAGMENT_HEADER_PARSER_INIT,
-+  GST_MSS_FRAGMENT_HEADER_PARSER_FINISHED
-+} GstFragmentHeaderParserStatus;
-+
-+typedef struct _GstMssFragmentParser
-+{
-+  GstFragmentHeaderParserStatus status;
-+  GstTfxdBox tfxd;
-+  GstTfrfBox tfrf;
-+} GstMssFragmentParser;
-+
-+void gst_mss_fragment_parser_init (GstMssFragmentParser * parser);
-+void gst_mss_fragment_parser_clear (GstMssFragmentParser * parser);
-+gboolean gst_mss_fragment_parser_add_buffer (GstMssFragmentParser * parser, GstBuffer * buf);
-+
-+G_END_DECLS
-+
-+#endif /* __GST_MSS_FRAGMENT_PARSER_H__ */
-diff --git a/ext/smoothstreaming/gstmssmanifest.c b/ext/smoothstreaming/gstmssmanifest.c
-index 144bbb42d..e1031ba55 100644
---- a/ext/smoothstreaming/gstmssmanifest.c
-+++ b/ext/smoothstreaming/gstmssmanifest.c
-@@ -1,5 +1,7 @@
- /* GStreamer
-  * Copyright (C) 2012 Smart TV Alliance
-+ * Copyright (C) 2016 Igalia S.L
-+ * Copyright (C) 2016 Metrological
-  *  Author: Thiago Sousa Santos <thiago.sousa.santos@collabora.com>, Collabora Ltd.
-  *
-  * gstmssmanifest.c:
-@@ -31,6 +33,7 @@
- #include <gst/codecparsers/gsth264parser.h>
- 
- #include "gstmssmanifest.h"
-+#include "gstmssfragmentparser.h"
- 
- GST_DEBUG_CATEGORY_EXTERN (mssdemux_debug);
- #define GST_CAT_DEFAULT mssdemux_debug
-@@ -74,12 +77,17 @@ struct _GstMssStream
-   gboolean active;              /* if the stream is currently being used */
-   gint selectedQualityIndex;
- 
-+  gboolean has_live_fragments;
-+  GstAdapter *live_adapter;
-+
-   GList *fragments;
-   GList *qualities;
- 
-   gchar *url;
-   gchar *lang;
- 
-+  GstMssFragmentParser fragment_parser;
-+
-   guint fragment_repetition_index;
-   GList *current_fragment;
-   GList *current_quality;
-@@ -96,6 +104,7 @@ struct _GstMssManifest
- 
-   gboolean is_live;
-   gint64 dvr_window;
-+  guint64 look_ahead_fragment_count;
- 
-   GString *protection_system_id;
-   gchar *protection_data;
-@@ -235,7 +244,8 @@ compare_bitrate (GstMssStreamQuality * a, GstMssStreamQuality * b)
- }
- 
- static void
--_gst_mss_stream_init (GstMssStream * stream, xmlNodePtr node)
-+_gst_mss_stream_init (GstMssManifest * manifest, GstMssStream * stream,
-+    xmlNodePtr node)
- {
-   xmlNodePtr iter;
-   GstMssFragmentListBuilder builder;
-@@ -248,9 +258,21 @@ _gst_mss_stream_init (GstMssStream * stream, xmlNodePtr node)
-   stream->url = (gchar *) xmlGetProp (node, (xmlChar *) MSS_PROP_URL);
-   stream->lang = (gchar *) xmlGetProp (node, (xmlChar *) MSS_PROP_LANGUAGE);
- 
-+  /* for live playback each fragment usually has timing
-+   * information for the few next look-ahead fragments so the
-+   * playlist can be built incrementally from the first fragment
-+   * of the manifest.
-+   */
-+
-+  GST_DEBUG ("Live stream: %s, look-ahead fragments: %" G_GUINT64_FORMAT,
-+      manifest->is_live ? "yes" : "no", manifest->look_ahead_fragment_count);
-+  stream->has_live_fragments = manifest->is_live
-+      && manifest->look_ahead_fragment_count;
-+
-   for (iter = node->children; iter; iter = iter->next) {
-     if (node_has_type (iter, MSS_NODE_STREAM_FRAGMENT)) {
--      gst_mss_fragment_list_builder_add (&builder, iter);
-+      if (!stream->has_live_fragments || !builder.fragments)
-+        gst_mss_fragment_list_builder_add (&builder, iter);
-     } else if (node_has_type (iter, MSS_NODE_STREAM_QUALITY)) {
-       GstMssStreamQuality *quality = gst_mss_stream_quality_new (iter);
-       stream->qualities = g_list_prepend (stream->qualities, quality);
-@@ -259,17 +281,24 @@ _gst_mss_stream_init (GstMssStream * stream, xmlNodePtr node)
-     }
-   }
- 
--  stream->fragments = g_list_reverse (builder.fragments);
-+  if (stream->has_live_fragments) {
-+    stream->live_adapter = gst_adapter_new ();
-+  }
-+
-+  if (builder.fragments) {
-+    stream->fragments = g_list_reverse (builder.fragments);
-+    stream->current_fragment = stream->fragments;
-+  }
- 
-   /* order them from smaller to bigger based on bitrates */
-   stream->qualities =
-       g_list_sort (stream->qualities, (GCompareFunc) compare_bitrate);
--
--  stream->current_fragment = stream->fragments;
-   stream->current_quality = stream->qualities;
- 
-   stream->regex_bitrate = g_regex_new ("\\{[Bb]itrate\\}", 0, 0, NULL);
-   stream->regex_position = g_regex_new ("\\{start[ _]time\\}", 0, 0, NULL);
-+
-+  gst_mss_fragment_parser_init (&stream->fragment_parser);
- }
- 
- 
-@@ -315,6 +344,7 @@ gst_mss_manifest_new (GstBuffer * data)
-   xmlNodePtr nodeiter;
-   gchar *live_str;
-   GstMapInfo mapinfo;
-+  gchar *look_ahead_fragment_count_str;
- 
-   if (!gst_buffer_map (data, &mapinfo, GST_MAP_READ)) {
-     return NULL;
-@@ -335,6 +365,7 @@ gst_mss_manifest_new (GstBuffer * data)
-   /* the entire file is always available for non-live streams */
-   if (!manifest->is_live) {
-     manifest->dvr_window = 0;
-+    manifest->look_ahead_fragment_count = 0;
-   } else {
-     /* if 0, or non-existent, the length is infinite */
-     gchar *dvr_window_str = (gchar *) xmlGetProp (root,
-@@ -346,6 +377,17 @@ gst_mss_manifest_new (GstBuffer * data)
-         manifest->dvr_window = 0;
-       }
-     }
-+
-+    look_ahead_fragment_count_str =
-+        (gchar *) xmlGetProp (root, (xmlChar *) "LookAheadFragmentCount");
-+    if (look_ahead_fragment_count_str) {
-+      manifest->look_ahead_fragment_count =
-+          g_ascii_strtoull (look_ahead_fragment_count_str, NULL, 10);
-+      xmlFree (look_ahead_fragment_count_str);
-+      if (manifest->look_ahead_fragment_count <= 0) {
-+        manifest->look_ahead_fragment_count = 0;
-+      }
-+    }
-   }
- 
-   for (nodeiter = root->children; nodeiter; nodeiter = nodeiter->next) {
-@@ -354,7 +396,7 @@ gst_mss_manifest_new (GstBuffer * data)
-       GstMssStream *stream = g_new0 (GstMssStream, 1);
- 
-       manifest->streams = g_slist_append (manifest->streams, stream);
--      _gst_mss_stream_init (stream, nodeiter);
-+      _gst_mss_stream_init (manifest, stream, nodeiter);
-     }
- 
-     if (nodeiter->type == XML_ELEMENT_NODE
-@@ -371,6 +413,11 @@ gst_mss_manifest_new (GstBuffer * data)
- static void
- gst_mss_stream_free (GstMssStream * stream)
- {
-+  if (stream->live_adapter) {
-+    gst_adapter_clear (stream->live_adapter);
-+    g_object_unref (stream->live_adapter);
-+  }
-+
-   g_list_free_full (stream->fragments, g_free);
-   g_list_free_full (stream->qualities,
-       (GDestroyNotify) gst_mss_stream_quality_free);
-@@ -379,6 +426,7 @@ gst_mss_stream_free (GstMssStream * stream)
-   g_regex_unref (stream->regex_position);
-   g_regex_unref (stream->regex_bitrate);
-   g_free (stream);
-+  gst_mss_fragment_parser_clear (&stream->fragment_parser);
- }
- 
- void
-@@ -1079,6 +1127,9 @@ GstFlowReturn
- gst_mss_stream_advance_fragment (GstMssStream * stream)
- {
-   GstMssStreamFragment *fragment;
-+  const gchar *stream_type_name =
-+      gst_mss_stream_type_name (gst_mss_stream_get_type (stream));
-+
-   g_return_val_if_fail (stream->active, GST_FLOW_ERROR);
- 
-   if (stream->current_fragment == NULL)
-@@ -1086,14 +1137,20 @@ gst_mss_stream_advance_fragment (GstMssStream * stream)
- 
-   fragment = stream->current_fragment->data;
-   stream->fragment_repetition_index++;
--  if (stream->fragment_repetition_index < fragment->repetitions) {
--    return GST_FLOW_OK;
--  }
-+  if (stream->fragment_repetition_index < fragment->repetitions)
-+    goto beach;
- 
-   stream->fragment_repetition_index = 0;
-   stream->current_fragment = g_list_next (stream->current_fragment);
-+
-+  GST_DEBUG ("Advanced to fragment #%d on %s stream", fragment->number,
-+      stream_type_name);
-   if (stream->current_fragment == NULL)
-     return GST_FLOW_EOS;
-+
-+beach:
-+  gst_mss_fragment_parser_clear (&stream->fragment_parser);
-+  gst_mss_fragment_parser_init (&stream->fragment_parser);
-   return GST_FLOW_OK;
- }
- 
-@@ -1173,6 +1230,11 @@ gst_mss_stream_seek (GstMssStream * stream, gboolean forward,
-   GST_DEBUG ("Stream %s seeking to %" G_GUINT64_FORMAT, stream->url, time);
-   for (iter = stream->fragments; iter; iter = g_list_next (iter)) {
-     fragment = iter->data;
-+    if (stream->has_live_fragments) {
-+      if (fragment->time + fragment->repetitions * fragment->duration > time)
-+        stream->current_fragment = iter;
-+      break;
-+    }
-     if (fragment->time + fragment->repetitions * fragment->duration > time) {
-       stream->current_fragment = iter;
-       stream->fragment_repetition_index =
-@@ -1256,9 +1318,14 @@ static void
- gst_mss_stream_reload_fragments (GstMssStream * stream, xmlNodePtr streamIndex)
- {
-   xmlNodePtr iter;
--  guint64 current_gst_time = gst_mss_stream_get_fragment_gst_timestamp (stream);
-+  guint64 current_gst_time;
-   GstMssFragmentListBuilder builder;
- 
-+  if (stream->has_live_fragments)
-+    return;
-+
-+  current_gst_time = gst_mss_stream_get_fragment_gst_timestamp (stream);
-+
-   gst_mss_fragment_list_builder_init (&builder);
- 
-   GST_DEBUG ("Current position: %" GST_TIME_FORMAT,
-@@ -1514,3 +1581,74 @@ gst_mss_manifest_get_live_seek_range (GstMssManifest * manifest, gint64 * start,
- 
-   return ret;
- }
-+
-+void
-+gst_mss_manifest_live_adapter_push (GstMssStream * stream, GstBuffer * buffer)
-+{
-+  gst_adapter_push (stream->live_adapter, buffer);
-+}
-+
-+gsize
-+gst_mss_manifest_live_adapter_available (GstMssStream * stream)
-+{
-+  return gst_adapter_available (stream->live_adapter);
-+}
-+
-+GstBuffer *
-+gst_mss_manifest_live_adapter_take_buffer (GstMssStream * stream, gsize nbytes)
-+{
-+  return gst_adapter_take_buffer (stream->live_adapter, nbytes);
-+}
-+
-+gboolean
-+gst_mss_stream_fragment_parsing_needed (GstMssStream * stream)
-+{
-+  return stream->fragment_parser.status == GST_MSS_FRAGMENT_HEADER_PARSER_INIT;
-+}
-+
-+void
-+gst_mss_stream_parse_fragment (GstMssStream * stream, GstBuffer * buffer)
-+{
-+  GstMssStreamFragment *current_fragment = NULL;
-+  const gchar *stream_type_name;
-+  guint8 index;
-+
-+  if (!stream->has_live_fragments)
-+    return;
-+
-+  if (!gst_mss_fragment_parser_add_buffer (&stream->fragment_parser, buffer))
-+    return;
-+
-+  current_fragment = stream->current_fragment->data;
-+  current_fragment->time = stream->fragment_parser.tfxd.time;
-+  current_fragment->duration = stream->fragment_parser.tfxd.duration;
-+
-+  stream_type_name =
-+      gst_mss_stream_type_name (gst_mss_stream_get_type (stream));
-+
-+  for (index = 0; index < stream->fragment_parser.tfrf.entries_count; index++) {
-+    GList *l = g_list_last (stream->fragments);
-+    GstMssStreamFragment *last;
-+    GstMssStreamFragment *fragment;
-+
-+    if (l == NULL)
-+      break;
-+
-+    last = (GstMssStreamFragment *) l->data;
-+
-+    if (last->time == stream->fragment_parser.tfrf.entries[index].time)
-+      continue;
-+
-+    fragment = g_new (GstMssStreamFragment, 1);
-+    fragment->number = last->number + 1;
-+    fragment->repetitions = 1;
-+    fragment->time = stream->fragment_parser.tfrf.entries[index].time;
-+    fragment->duration = stream->fragment_parser.tfrf.entries[index].duration;
-+
-+    stream->fragments = g_list_append (stream->fragments, fragment);
-+    GST_LOG ("Adding fragment number: %u to %s stream, time: %" G_GUINT64_FORMAT
-+        ", duration: %" G_GUINT64_FORMAT ", repetitions: %u",
-+        fragment->number, stream_type_name,
-+        fragment->time, fragment->duration, fragment->repetitions);
-+  }
-+}
-diff --git a/ext/smoothstreaming/gstmssmanifest.h b/ext/smoothstreaming/gstmssmanifest.h
-index 6b7b1f971..03b066ae5 100644
---- a/ext/smoothstreaming/gstmssmanifest.h
-+++ b/ext/smoothstreaming/gstmssmanifest.h
-@@ -26,6 +26,7 @@
- #include <glib.h>
- #include <gio/gio.h>
- #include <gst/gst.h>
-+#include <gst/base/gstadapter.h>
- 
- G_BEGIN_DECLS
- 
-@@ -73,5 +74,11 @@ const gchar * gst_mss_stream_get_lang (GstMssStream * stream);
- 
- const gchar * gst_mss_stream_type_name (GstMssStreamType streamtype);
- 
-+void gst_mss_manifest_live_adapter_push(GstMssStream * stream, GstBuffer * buffer);
-+gsize gst_mss_manifest_live_adapter_available(GstMssStream * stream);
-+GstBuffer * gst_mss_manifest_live_adapter_take_buffer(GstMssStream * stream, gsize nbytes);
-+gboolean gst_mss_stream_fragment_parsing_needed(GstMssStream * stream);
-+void gst_mss_stream_parse_fragment(GstMssStream * stream, GstBuffer * buffer);
-+
- G_END_DECLS
- #endif /* __GST_MSS_MANIFEST_H__ */
-diff --git a/gst-libs/gst/adaptivedemux/gstadaptivedemux.c b/gst-libs/gst/adaptivedemux/gstadaptivedemux.c
-index 634e4f388..ddca726b6 100644
---- a/gst-libs/gst/adaptivedemux/gstadaptivedemux.c
-+++ b/gst-libs/gst/adaptivedemux/gstadaptivedemux.c
-@@ -291,6 +291,9 @@ gst_adaptive_demux_wait_until (GstClock * clock, GCond * cond, GMutex * mutex,
-     GstClockTime end_time);
- static gboolean gst_adaptive_demux_clock_callback (GstClock * clock,
-     GstClockTime time, GstClockID id, gpointer user_data);
-+static gboolean
-+gst_adaptive_demux_requires_periodical_playlist_update_default (GstAdaptiveDemux
-+    * demux);
- 
- /* we can't use G_DEFINE_ABSTRACT_TYPE because we need the klass in the _init
-  * method to get to the padtemplates */
-@@ -412,6 +415,9 @@ gst_adaptive_demux_class_init (GstAdaptiveDemuxClass * klass)
-   klass->data_received = gst_adaptive_demux_stream_data_received_default;
-   klass->finish_fragment = gst_adaptive_demux_stream_finish_fragment_default;
-   klass->update_manifest = gst_adaptive_demux_update_manifest_default;
-+  klass->requires_periodical_playlist_update =
-+      gst_adaptive_demux_requires_periodical_playlist_update_default;
-+
- }
- 
- static void
-@@ -686,7 +692,9 @@ gst_adaptive_demux_sink_event (GstPad * pad, GstObject * parent,
-             demux->priv->stop_updates_task = FALSE;
-             g_mutex_unlock (&demux->priv->updates_timed_lock);
-             /* Task to periodically update the manifest */
--            gst_task_start (demux->priv->updates_task);
-+            if (demux_class->requires_periodical_playlist_update (demux)) {
-+              gst_task_start (demux->priv->updates_task);
-+            }
-           }
-         } else {
-           /* no streams */
-@@ -2125,6 +2133,13 @@ gst_adaptive_demux_stream_data_received_default (GstAdaptiveDemux * demux,
-   return gst_adaptive_demux_stream_push_buffer (stream, buffer);
- }
- 
-+static gboolean
-+gst_adaptive_demux_requires_periodical_playlist_update_default (GstAdaptiveDemux
-+    * demux)
-+{
-+  return TRUE;
-+}
-+
- static GstFlowReturn
- _src_chain (GstPad * pad, GstObject * parent, GstBuffer * buffer)
- {
-@@ -3338,7 +3353,15 @@ gst_adaptive_demux_stream_download_loop (GstAdaptiveDemuxStream * stream)
-       GST_DEBUG_OBJECT (stream->pad, "EOS, checking to stop download loop");
-       /* we push the EOS after releasing the object lock */
-       if (gst_adaptive_demux_is_live (demux)) {
--        if (gst_adaptive_demux_stream_wait_manifest_update (demux, stream)) {
-+        GstAdaptiveDemuxClass *demux_class =
-+            GST_ADAPTIVE_DEMUX_GET_CLASS (demux);
-+
-+        /* this might be a fragment download error, refresh the manifest, just in case */
-+        if (!demux_class->requires_periodical_playlist_update (demux)) {
-+          ret = gst_adaptive_demux_update_manifest (demux);
-+          break;
-+        } else if (gst_adaptive_demux_stream_wait_manifest_update (demux,
-+                stream)) {
-           goto end;
-         }
-         gst_task_stop (stream->download_task);
-diff --git a/gst-libs/gst/adaptivedemux/gstadaptivedemux.h b/gst-libs/gst/adaptivedemux/gstadaptivedemux.h
-index 780f4d93f..9a1a1b7d1 100644
---- a/gst-libs/gst/adaptivedemux/gstadaptivedemux.h
-+++ b/gst-libs/gst/adaptivedemux/gstadaptivedemux.h
-@@ -459,6 +459,20 @@ struct _GstAdaptiveDemuxClass
-    * selected period.
-    */
-   GstClockTime (*get_period_start_time) (GstAdaptiveDemux *demux);
-+
-+  /**
-+   * requires_periodical_playlist_update:
-+   * @demux: #GstAdaptiveDemux
-+   *
-+   * Some adaptive streaming protocols allow the client to download
-+   * the playlist once and build up the fragment list based on the
-+   * current fragment metadata. For those protocols the demuxer
-+   * doesn't need to periodically refresh the playlist. This vfunc
-+   * is relevant only for live playback scenarios.
-+   *
-+   * Return: %TRUE if the playlist needs to be refreshed periodically by the demuxer.
-+   */
-+  gboolean (*requires_periodical_playlist_update) (GstAdaptiveDemux * demux);
- };
- 
- GType    gst_adaptive_demux_get_type (void);
--- 
-2.11.0
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch
deleted file mode 100644
index 76d29e1..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch
+++ /dev/null
@@ -1,183 +0,0 @@
-From e9178fa082116d4bf733b184a8b6951112c17900 Mon Sep 17 00:00:00 2001
-From: Matthew Waters <matthew@centricular.com>
-Date: Thu, 10 Nov 2016 17:18:36 +1100
-Subject: [PATCH] smoothstreaming: implement adaptivedemux's
- get_live_seek_range()
-
-Allows seeking through the available fragments that are still available
-on the server as specified by the DVRWindowLength attribute in the
-manifest.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=774178
----
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
- ext/smoothstreaming/gstmssdemux.c    | 13 ++++++
- ext/smoothstreaming/gstmssmanifest.c | 84 ++++++++++++++++++++++++++++++++++++
- ext/smoothstreaming/gstmssmanifest.h |  1 +
- 3 files changed, 98 insertions(+)
-
-diff --git a/ext/smoothstreaming/gstmssdemux.c b/ext/smoothstreaming/gstmssdemux.c
-index 9d0aece2b..b66e19514 100644
---- a/ext/smoothstreaming/gstmssdemux.c
-+++ b/ext/smoothstreaming/gstmssdemux.c
-@@ -138,6 +138,8 @@ gst_mss_demux_get_manifest_update_interval (GstAdaptiveDemux * demux);
- static GstFlowReturn
- gst_mss_demux_update_manifest_data (GstAdaptiveDemux * demux,
-     GstBuffer * buffer);
-+static gboolean gst_mss_demux_get_live_seek_range (GstAdaptiveDemux * demux,
-+    gint64 * start, gint64 * stop);
- 
- static void
- gst_mss_demux_class_init (GstMssDemuxClass * klass)
-@@ -192,6 +194,8 @@ gst_mss_demux_class_init (GstMssDemuxClass * klass)
-       gst_mss_demux_stream_update_fragment_info;
-   gstadaptivedemux_class->update_manifest_data =
-       gst_mss_demux_update_manifest_data;
-+  gstadaptivedemux_class->get_live_seek_range =
-+      gst_mss_demux_get_live_seek_range;
- 
-   GST_DEBUG_CATEGORY_INIT (mssdemux_debug, "mssdemux", 0, "mssdemux plugin");
- }
-@@ -659,3 +663,12 @@ gst_mss_demux_update_manifest_data (GstAdaptiveDemux * demux,
-   gst_mss_manifest_reload_fragments (mssdemux->manifest, buffer);
-   return GST_FLOW_OK;
- }
-+
-+static gboolean
-+gst_mss_demux_get_live_seek_range (GstAdaptiveDemux * demux, gint64 * start,
-+    gint64 * stop)
-+{
-+  GstMssDemux *mssdemux = GST_MSS_DEMUX_CAST (demux);
-+
-+  return gst_mss_manifest_get_live_seek_range (mssdemux->manifest, start, stop);
-+}
-diff --git a/ext/smoothstreaming/gstmssmanifest.c b/ext/smoothstreaming/gstmssmanifest.c
-index 1b72e8de1..317b3cef9 100644
---- a/ext/smoothstreaming/gstmssmanifest.c
-+++ b/ext/smoothstreaming/gstmssmanifest.c
-@@ -42,6 +42,7 @@ GST_DEBUG_CATEGORY_EXTERN (mssdemux_debug);
- 
- #define MSS_PROP_BITRATE              "Bitrate"
- #define MSS_PROP_DURATION             "d"
-+#define MSS_PROP_DVR_WINDOW_LENGTH    "DVRWindowLength"
- #define MSS_PROP_LANGUAGE             "Language"
- #define MSS_PROP_NUMBER               "n"
- #define MSS_PROP_REPETITIONS          "r"
-@@ -94,6 +95,7 @@ struct _GstMssManifest
-   xmlNodePtr xmlrootnode;
- 
-   gboolean is_live;
-+  gint64 dvr_window;
- 
-   GString *protection_system_id;
-   gchar *protection_data;
-@@ -330,6 +332,22 @@ gst_mss_manifest_new (GstBuffer * data)
-     xmlFree (live_str);
-   }
- 
-+  /* the entire file is always available for non-live streams */
-+  if (!manifest->is_live) {
-+    manifest->dvr_window = 0;
-+  } else {
-+    /* if 0, or non-existent, the length is infinite */
-+    gchar *dvr_window_str = (gchar *) xmlGetProp (root,
-+        (xmlChar *) MSS_PROP_DVR_WINDOW_LENGTH);
-+    if (dvr_window_str) {
-+      manifest->dvr_window = g_ascii_strtoull (dvr_window_str, NULL, 10);
-+      xmlFree (dvr_window_str);
-+      if (manifest->dvr_window <= 0) {
-+        manifest->dvr_window = 0;
-+      }
-+    }
-+  }
-+
-   for (nodeiter = root->children; nodeiter; nodeiter = nodeiter->next) {
-     if (nodeiter->type == XML_ELEMENT_NODE
-         && (strcmp ((const char *) nodeiter->name, "StreamIndex") == 0)) {
-@@ -1406,3 +1424,69 @@ gst_mss_stream_get_lang (GstMssStream * stream)
- {
-   return stream->lang;
- }
-+
-+static GstClockTime
-+gst_mss_manifest_get_dvr_window_length_clock_time (GstMssManifest * manifest)
-+{
-+  gint64 timescale;
-+
-+  /* the entire file is always available for non-live streams */
-+  if (manifest->dvr_window == 0)
-+    return GST_CLOCK_TIME_NONE;
-+
-+  timescale = gst_mss_manifest_get_timescale (manifest);
-+  return (GstClockTime) gst_util_uint64_scale_round (manifest->dvr_window,
-+      GST_SECOND, timescale);
-+}
-+
-+static gboolean
-+gst_mss_stream_get_live_seek_range (GstMssStream * stream, gint64 * start,
-+    gint64 * stop)
-+{
-+  GList *l;
-+  GstMssStreamFragment *fragment;
-+  guint64 timescale = gst_mss_stream_get_timescale (stream);
-+
-+  g_return_val_if_fail (stream->active, FALSE);
-+
-+  /* XXX: assumes all the data in the stream is still available */
-+  l = g_list_first (stream->fragments);
-+  fragment = (GstMssStreamFragment *) l->data;
-+  *start = gst_util_uint64_scale_round (fragment->time, GST_SECOND, timescale);
-+
-+  l = g_list_last (stream->fragments);
-+  fragment = (GstMssStreamFragment *) l->data;
-+  *stop = gst_util_uint64_scale_round (fragment->time + fragment->duration *
-+      fragment->repetitions, GST_SECOND, timescale);
-+
-+  return TRUE;
-+}
-+
-+gboolean
-+gst_mss_manifest_get_live_seek_range (GstMssManifest * manifest, gint64 * start,
-+    gint64 * stop)
-+{
-+  GSList *iter;
-+  gboolean ret = FALSE;
-+
-+  for (iter = manifest->streams; iter; iter = g_slist_next (iter)) {
-+    GstMssStream *stream = iter->data;
-+
-+    if (stream->active) {
-+      /* FIXME: bound this correctly for multiple streams */
-+      if (!(ret = gst_mss_stream_get_live_seek_range (stream, start, stop)))
-+        break;
-+    }
-+  }
-+
-+  if (ret && gst_mss_manifest_is_live (manifest)) {
-+    GstClockTime dvr_window =
-+        gst_mss_manifest_get_dvr_window_length_clock_time (manifest);
-+
-+    if (GST_CLOCK_TIME_IS_VALID (dvr_window) && *stop - *start > dvr_window) {
-+      *start = *stop - dvr_window;
-+    }
-+  }
-+
-+  return ret;
-+}
-diff --git a/ext/smoothstreaming/gstmssmanifest.h b/ext/smoothstreaming/gstmssmanifest.h
-index af7419c23..6b7b1f971 100644
---- a/ext/smoothstreaming/gstmssmanifest.h
-+++ b/ext/smoothstreaming/gstmssmanifest.h
-@@ -54,6 +54,7 @@ void gst_mss_manifest_reload_fragments (GstMssManifest * manifest, GstBuffer * d
- GstClockTime gst_mss_manifest_get_min_fragment_duration (GstMssManifest * manifest);
- const gchar * gst_mss_manifest_get_protection_system_id (GstMssManifest * manifest);
- const gchar * gst_mss_manifest_get_protection_data (GstMssManifest * manifest);
-+gboolean gst_mss_manifest_get_live_seek_range (GstMssManifest * manifest, gint64 * start, gint64 * stop);
- 
- GstMssStreamType gst_mss_stream_get_type (GstMssStream *stream);
- GstCaps * gst_mss_stream_get_caps (GstMssStream * stream);
--- 
-2.11.0
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-smoothstreaming-use-the-duration-from-the-list-of-fr.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-smoothstreaming-use-the-duration-from-the-list-of-fr.patch
deleted file mode 100644
index 4e51040..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-smoothstreaming-use-the-duration-from-the-list-of-fr.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 0fbee8f37427b88339194b22ba9aa210772a8613 Mon Sep 17 00:00:00 2001
-From: Matthew Waters <matthew@centricular.com>
-Date: Thu, 10 Nov 2016 17:20:27 +1100
-Subject: [PATCH] smoothstreaming: use the duration from the list of fragments
- if not present in the manifest
-
-Provides a more accurate duration for live streams that may be minutes
-or hours in front of the earliest fragment.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=774178
----
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
- ext/smoothstreaming/gstmssmanifest.c | 24 ++++++++++++++++++++++++
- 1 file changed, 24 insertions(+)
-
-diff --git a/ext/smoothstreaming/gstmssmanifest.c b/ext/smoothstreaming/gstmssmanifest.c
-index 317b3cef9..144bbb42d 100644
---- a/ext/smoothstreaming/gstmssmanifest.c
-+++ b/ext/smoothstreaming/gstmssmanifest.c
-@@ -888,6 +888,7 @@ gst_mss_manifest_get_duration (GstMssManifest * manifest)
-   gchar *duration;
-   guint64 dur = -1;
- 
-+  /* try the property */
-   duration =
-       (gchar *) xmlGetProp (manifest->xmlrootnode,
-       (xmlChar *) MSS_PROP_STREAM_DURATION);
-@@ -895,6 +896,29 @@ gst_mss_manifest_get_duration (GstMssManifest * manifest)
-     dur = g_ascii_strtoull (duration, NULL, 10);
-     xmlFree (duration);
-   }
-+  /* else use the fragment list */
-+  if (dur <= 0) {
-+    guint64 max_dur = 0;
-+    GSList *iter;
-+
-+    for (iter = manifest->streams; iter; iter = g_slist_next (iter)) {
-+      GstMssStream *stream = iter->data;
-+
-+      if (stream->active) {
-+        if (stream->fragments) {
-+          GList *l = g_list_last (stream->fragments);
-+          GstMssStreamFragment *fragment = (GstMssStreamFragment *) l->data;
-+          guint64 frag_dur =
-+              fragment->time + fragment->duration * fragment->repetitions;
-+          max_dur = MAX (frag_dur, max_dur);
-+        }
-+      }
-+    }
-+
-+    if (max_dur != 0)
-+      dur = max_dur;
-+  }
-+
-   return dur;
- }
- 
--- 
-2.11.0
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.2.bb
similarity index 65%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.2.bb
index a769230..8321da0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.2.bb
@@ -1,9 +1,7 @@
 require gstreamer1.0-plugins-bad.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
-                    file://COPYING.LIB;md5=21682e4e8fea52413fd26c60acb907e5 \
-                    file://gst/tta/crc32.h;beginline=12;endline=29;md5=27db269c575d1e5317fffca2d33b3b50 \
-                    file://gst/tta/filters.h;beginline=12;endline=29;md5=8a08270656f2f8ad7bb3655b83138e5a"
+                    file://COPYING.LIB;md5=21682e4e8fea52413fd26c60acb907e5 "
 
 SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-${PV}.tar.xz \
@@ -15,15 +13,12 @@ SRC_URI = " \
     file://0009-glimagesink-Downrank-to-marginal.patch \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
     file://0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch \
-    file://0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch \
-    file://0001-smoothstreaming-use-the-duration-from-the-list-of-fr.patch \
-    file://0001-mssdemux-improved-live-playback-support.patch \
     file://link-with-libvchostif.patch \
     file://0001-vkdisplay-Use-ifdef-for-platform-specific-defines.patch \
     file://0002-vulkan-Use-the-generated-version-of-vkconfig.h.patch \
 "
-SRC_URI[md5sum] = "2757103e57a096a1a05b3ab85b8381af"
-SRC_URI[sha256sum] = "23ddae506b3a223b94869a0d3eea3e9a12e847f94d2d0e0b97102ce13ecd6966"
+SRC_URI[md5sum] = "5683f0ea91f9e1e0613b0f6f729980a7"
+SRC_URI[sha256sum] = "9c2c7edde4f59d74eb414e0701c55131f562e5c605a3ce9b091754f106c09e37"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
-- 
2.7.4



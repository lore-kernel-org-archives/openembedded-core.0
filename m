Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 9A50077087
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 08:32:21 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id DD1E8239D9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 09:32:18 +0100 (CET)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Nov 2015 09:32:09 +0100
Message-Id: <1446712332-17113-4-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1446712332-17113-1-git-send-email-dv@pseudoterminal.org>
References: <1446712332-17113-1-git-send-email-dv@pseudoterminal.org>
Subject: [PATCH 4/7] gstreamer1.0-plugins-bad: upgrade to version 1.6.1
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
X-List-Received-Date: Thu, 05 Nov 2015 08:32:23 -0000

0001-gl-do-not-check-for-GL-GLU-EGL-GLES2-libs-if-disable.patch is now
in upstream, and therefore not needed as a separate patch anymore.

0001-glimagesink-Downrank-to-marginal.patch didn't apply anymore, and
was adapted to the updated code.

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../gstreamer/gstreamer1.0-plugins-bad.inc         | 61 ++++++++++++++--------
 ...heck-for-GL-GLU-EGL-GLES2-libs-if-disable.patch | 41 ---------------
 .../0001-glimagesink-Downrank-to-marginal.patch    |  4 +-
 ..._1.4.5.bb => gstreamer1.0-plugins-bad_1.6.1.bb} |  8 ++-
 4 files changed, 44 insertions(+), 70 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gl-do-not-check-for-GL-GLU-EGL-GLES2-libs-if-disable.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.4.5.bb => gstreamer1.0-plugins-bad_1.6.1.bb} (59%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index cdedb60..f94b12f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -20,10 +20,12 @@ PACKAGECONFIG ??= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
-    orc curl uvch264 neon sndfile \
-    hls sbc dash bz2 smoothstreaming \
+    orc curl uvch264 neon sndfile hls sbc dash bz2 smoothstreaming rsvg dtls \
     "
 
+# gtk is not in the PACKAGECONFIG variable by default until
+# the transition to gtk+3 is finished
+#
 # dash = Dynamic Adaptive Streaming over HTTP
 PACKAGECONFIG[assrender]       = "--enable-assrender,--disable-assrender,libass"
 PACKAGECONFIG[curl]            = "--enable-curl,--disable-curl,curl"
@@ -55,36 +57,46 @@ PACKAGECONFIG[sndfile]         = "--enable-sndfile,--disable-sndfile,libsndfile1
 PACKAGECONFIG[webp]            = "--enable-webp,--disable-webp,libwebp"
 PACKAGECONFIG[rtmp]            = "--enable-rtmp,--disable-rtmp,rtmpdump"
 PACKAGECONFIG[libssh2]         = "--enable-libssh2,--disable-libssh2,libssh2"
+PACKAGECONFIG[dtls]            = "--enable-dtls,--disable-dtls,openssl"
+PACKAGECONFIG[gtk]             = "--enable-gtk3,--disable-gtk3,gtk+3"
+PACKAGECONFIG[srtp]            = "--enable-srtp,--disable-srtp,libsrtp"
+PACKAGECONFIG[voaacenc]        = "--enable-voaacenc,--disable-voaacenc,vo-aacenc"
+PACKAGECONFIG[voamrwbenc]      = "--enable-voamrwbenc,--disable-voamrwbenc,vo-amrwbenc"
+PACKAGECONFIG[resindvd]        = "--enable-resindvd,--disable-resindvd,libdvdread libdvdnav"
 
 # these plugins have not been ported to 1.0 (yet):
-#   directdraw vcd apexsink dc1394 lv2 linsys musepack mythtv
-#   nas timidity teletextdec sdl xvid wininet acm gsettings
-#   sndio qtwrapper cdxaparse dccp faceoverlay hdvparse tta
-#   mve nuvdemux osx_video patchdetect quicktime real sdi
-#   videomeasure gsettings
+#   apexsink dc1394 lv2 linsys musepack nas timidity teletextdec sdl xvid wininet
+#   acm gsettings sndio cdxaparse dccp faceoverlay hdvparse tta mve nuvdemux
+#   patchdetect real sdi videomeasure gsettings
 
 # these plugins have no corresponding library in OE-core or meta-openembedded:
-#   openni2 winks direct3d directdraw directsound winscreencap osx_video
-#   apple_media android_media avc chromaprint daala dts gme gsm kate ladspa mimic
-#   mpeg2enc mplex ofa openjpeg opensles pvr resindvd rtmp soundtouch spandsp spc
-#   srtp vdpau voaacenc voamrwbenc wasapi zbar
+#   openni2 winks direct3d directsound winscreencap
+#   apple_media android_media avc bs2b chromaprint daala dts gme gsm kate ladspa
+#   libde265 mimic mpeg2enc mplex ofa openh264 opensles pvr soundtouch spandsp
+#   spc vdpau wasapi x265 zbar
+
+# qt5 support is disabled, because it is not present in OE core, and requires more work than
+# just adding a packageconfig (it requires access to moc, uic, rcc, and qmake paths).
+# This is better done in a separate qt5 layer (which then should add a "qt5" packageconfig
+# in a gstreamer1.0-plugins-bad bbappend).
 
 EXTRA_OECONF += " \
     --enable-dvb \
     --enable-shm \
     --enable-fbdev \
     --enable-decklink \
+    --enable-vcd \
     --disable-acm \
     --disable-android_media \
     --disable-apexsink \
     --disable-apple_media \
     --disable-avc \
+    --disable-bs2b \
     --disable-chromaprint \
     --disable-cocoa \
     --disable-daala \
     --disable-dc1394 \
     --disable-direct3d \
-    --disable-directdraw \
     --disable-directsound \
     --disable-dts \
     --disable-gme \
@@ -92,44 +104,49 @@ EXTRA_OECONF += " \
     --disable-gsm \
     --disable-kate \
     --disable-ladspa \
+    --disable-libvisual \
+    --disable-libde265 \
     --disable-linsys \
     --disable-lv2 \
     --disable-mimic \
     --disable-mpeg2enc \
     --disable-mplex \
     --disable-musepack \
-    --disable-mythtv \
     --disable-nas \
     --disable-ofa \
+    --disable-openexr \
+    --disable-openh264 \
     --disable-openjpeg \
+    --disable-openni2 \
     --disable-opensles \
-    --disable-osx_video \
     --disable-pvr \
-    --disable-quicktime \
-    --disable-resindvd \
+    --disable-qt \
     --disable-sdl \
     --disable-sdltest \
     --disable-sndio \
     --disable-soundtouch \
     --disable-spandsp \
     --disable-spc \
-    --disable-srtp \
     --disable-teletextdec \
     --disable-timidity \
-    --disable-vcd \
     --disable-vdpau \
-    --disable-voaacenc \
-    --disable-voamrwbenc \
     --disable-wasapi \
     --disable-wildmidi \
     --disable-wininet \
+    --disable-winks \
     --disable-winscreencap \
+    --disable-x265 \
     --disable-xvid \
     --disable-zbar \
     ${@bb.utils.contains("TUNE_FEATURES", "mx32", "--disable-yadif", "", d)} \
     "
 
-ARM_INSTRUCTION_SET = "arm"
+OPENCV_PREFIX="${STAGING_DIR_TARGET}${prefix}"
+export OPENCV_PREFIX
 
-FILES_gstreamer1.0-plugins-bad-opencv += "${datadir}/gst-plugins-bad/1.0/opencv*"
+ARM_INSTRUCTION_SET = "arm"
 
+FILES_${PN}-opencv += "${datadir}/gst-plugins-bad/1.0/opencv*"
+FILES_${PN}-freeverb += "${datadir}/gstreamer-1.0/presets/GstFreeverb.prs"
+FILES_${PN}-voamrwbenc += "${datadir}/gstreamer-1.0/presets/GstVoAmrwbEnc.prs"
+FILES_${PN}-dev += "${libdir}/gstreamer-1.0/include/gst/gl/gstglconfig.h"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gl-do-not-check-for-GL-GLU-EGL-GLES2-libs-if-disable.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gl-do-not-check-for-GL-GLU-EGL-GLES2-libs-if-disable.patch
deleted file mode 100644
index 042a32c..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gl-do-not-check-for-GL-GLU-EGL-GLES2-libs-if-disable.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From deba0da45ec821209a7ed148a4521d562e6512cd Mon Sep 17 00:00:00 2001
-From: Carlos Rafael Giani <dv@pseudoterminal.org>
-Date: Wed, 27 Aug 2014 14:47:25 +0200
-Subject: [PATCH] gl: do not check for GL/GLU/EGL/GLES2 libs if disabled in
- configuration
-
-Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=735522]
-
-Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
----
- configure.ac | 14 ++++++++++----
- 1 file changed, 10 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 1a46afb..e85d4ba 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -661,10 +661,16 @@ case $host in
-     fi
-   ;;
-   *)
--    AG_GST_CHECK_LIBHEADER(GL, GL, glTexImage2D,, GL/gl.h)
--    AG_GST_CHECK_LIBHEADER(GLU, GLU, gluSphere,, GL/glu.h)
--    AG_GST_CHECK_LIBHEADER(GLES2, GLESv2, glTexImage2D,, GLES2/gl2.h)
--    AG_GST_CHECK_LIBHEADER(EGL, EGL, eglGetError,, EGL/egl.h)
-+    if test "x$NEED_GL" != "xno"; then
-+      AG_GST_CHECK_LIBHEADER(GL, GL, glTexImage2D,, GL/gl.h)
-+      AG_GST_CHECK_LIBHEADER(GLU, GLU, gluSphere,, GL/glu.h)
-+    fi
-+    if test "x$NEED_GLES2" != "xno"; then
-+      AG_GST_CHECK_LIBHEADER(GLES2, GLESv2, glTexImage2D,, GLES2/gl2.h)
-+    fi
-+    if test "x$NEED_EGL" != "xno"; then
-+      AG_GST_CHECK_LIBHEADER(EGL, EGL, eglGetError,, EGL/egl.h)
-+    fi
- 
-     old_LIBS=$LIBS
-     old_CFLAGS=$CFLAGS
--- 
-1.8.3.2
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-glimagesink-Downrank-to-marginal.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-glimagesink-Downrank-to-marginal.patch
index f677603..1085e95 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-glimagesink-Downrank-to-marginal.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-glimagesink-Downrank-to-marginal.patch
@@ -22,8 +22,8 @@ index a4b2540..0ccaacd 100644
  #endif
  
    if (!gst_element_register (plugin, "glimagesink",
--          GST_RANK_SECONDARY, GST_TYPE_GLIMAGE_SINK)) {
-+          GST_RANK_MARGINAL, GST_TYPE_GLIMAGE_SINK)) {
+-          GST_RANK_SECONDARY, gst_gl_image_sink_bin_get_type ())) {
++          GST_RANK_MARGINAL, gst_gl_image_sink_bin_get_type ())) {
      return FALSE;
    }
  
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.1.bb
similarity index 59%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.4.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.1.bb
index 6873669..eeb4771 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.4.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.1.bb
@@ -5,12 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
                     file://COPYING.LIB;md5=21682e4e8fea52413fd26c60acb907e5 \
                     file://gst/tta/crc32.h;beginline=12;endline=29;md5=27db269c575d1e5317fffca2d33b3b50"
 
-SRC_URI += "file://0001-gl-do-not-check-for-GL-GLU-EGL-GLES2-libs-if-disable.patch \
-           file://0001-glimagesink-Downrank-to-marginal.patch \
-           "
+SRC_URI += "file://0001-glimagesink-Downrank-to-marginal.patch"
 
-SRC_URI[md5sum] = "e0bb39412cf4a48fe0397bcf3a7cd451"
-SRC_URI[sha256sum] = "152fad7250683d72f9deb36c5685428338365fe4a4c87ffe15e38783b14f983c"
+SRC_URI[md5sum] = "c92d7d32de68e7293712bf9b6c99dc77"
+SRC_URI[sha256sum] = "e176a9af125f6874b3d6724aa7566a198fa225d3ece0a7ac2f2b51c57e525466"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
-- 
2.5.0



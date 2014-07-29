Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 140D570874
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 21:00:16 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 0A7FC33193
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 22:53:33 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jul 2014 22:53:20 +0200
Message-Id: <1406667203-14914-4-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1406667203-14914-1-git-send-email-dv@pseudoterminal.org>
References: <1406667203-14914-1-git-send-email-dv@pseudoterminal.org>
Subject: [PATCH 4/7] gstreamer1.0-plugins-bad: upgrade to 1.4.0
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
X-List-Received-Date: Tue, 29 Jul 2014 21:00:21 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../gstreamer/gstreamer1.0-plugins-bad.inc         | 29 ++++++++++++----------
 ..._1.2.4.bb => gstreamer1.0-plugins-bad_1.4.0.bb} |  4 +--
 2 files changed, 18 insertions(+), 15 deletions(-)
 rename recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.2.4.bb => gstreamer1.0-plugins-bad_1.4.0.bb} (75%)

diff --git a/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index ceb2de1..8ecc2aa 100644
--- a/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -11,16 +11,16 @@ inherit gettext
 
 PACKAGECONFIG ??= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'eglgles', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
-    orc curl uvch264 neon \
+    orc curl uvch264 neon sndfile \
     hls sbc dash bz2 smoothstreaming \
     "
 # dash = Dynamic Adaptive Streaming over HTTP
 PACKAGECONFIG[assrender]       = "--enable-assrender,--disable-assrender,libass"
 PACKAGECONFIG[curl]            = "--enable-curl,--disable-curl,curl"
-PACKAGECONFIG[eglgles]         = "--enable-eglgles,--disable-eglgles,virtual/egl virtual/libgles2"
+PACKAGECONFIG[gl]              = "--enable-gl,--disable-gl,virtual/egl virtual/libgles2"
 PACKAGECONFIG[faac]            = "--enable-faac,--disable-faac,faac"
 PACKAGECONFIG[faad]            = "--enable-faad,--disable-faad,faad2"
 PACKAGECONFIG[libmms]          = "--enable-libmms,--disable-libmms,libmms"
@@ -43,18 +43,25 @@ PACKAGECONFIG[schroedinger]    = "--enable-schro,--disable-schro,schroedinger"
 PACKAGECONFIG[smoothstreaming] = "--enable-smoothstreaming,--disable-smoothstreaming,libxml2"
 PACKAGECONFIG[bluez]           = "--enable-bluez,--disable-bluez,bluez4"
 PACKAGECONFIG[rsvg]            = "--enable-rsvg,--disable-rsvg,librsvg"
+PACKAGECONFIG[sndfile]         = "--enable-sndfile,--disable-sndfile,libsndfile1"
+PACKAGECONFIG[webp]            = "--enable-webp,--disable-webp,libwebp"
 
 # these plugins have not been ported to 1.0 (yet):
-#   directdraw vcd apexsink cdaudio dc1394 lv2 linsys musepack mythtv
-#   nas timidity teletextdec sdl sndfile xvid wininet acm gsettings
-#   sndio cdxaparse dccp faceoverlay hdvparse ivfparse jp2kdecimator
-#   linsys mve nuvdemux osx_video patchdetect quicktime real sdi stereo
-#   tta videomeasure videosignal vmnc
+#   directdraw vcd apexsink dc1394 lv2 linsys musepack mythtv
+#   nas timidity teletextdec sdl xvid wininet acm gsettings
+#   sndio qtwrapper cdxaparse dccp faceoverlay hdvparse tta
+#   mve nuvdemux osx_video patchdetect quicktime real sdi
+#   videomeasure gsettings
+
+# these plugins have no corresponding library in OE-core or meta-openembedded:
+#   openni2 winks direct3d directdraw directsound winscreencap osx_video
+#   apple_media android_media avc chromaprint daala dts gme gsm kate ladspa mimic
+#   mpeg2enc mplex ofa openjpeg opensles pvr resindvd rtmp soundtouch spandsp spc
+#   srtp vdpau voaacenc voamrwbenc wasapi zbar
 
 EXTRA_OECONF += " \
     --enable-dvb \
     --enable-shm \
-    --enable-mfc \
     --enable-fbdev \
     --enable-decklink \
     --disable-acm \
@@ -62,13 +69,11 @@ EXTRA_OECONF += " \
     --disable-apexsink \
     --disable-apple_media \
     --disable-avc \
-    --disable-cdaudio \
     --disable-chromaprint \
     --disable-daala \
     --disable-dc1394 \
     --disable-direct3d \
     --disable-directdraw \
-    --disable-directshow \
     --disable-directsound \
     --disable-dts \
     --disable-gme \
@@ -94,7 +99,6 @@ EXTRA_OECONF += " \
     --disable-rtmp \
     --disable-sdl \
     --disable-sdltest \
-    --disable-sndfile \
     --disable-sndio \
     --disable-soundtouch \
     --disable-spandsp \
@@ -107,7 +111,6 @@ EXTRA_OECONF += " \
     --disable-voaacenc \
     --disable-voamrwbenc \
     --disable-wasapi \
-    --disable-webp \
     --disable-wildmidi \
     --disable-wininet \
     --disable-winscreencap \
diff --git a/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.4.bb b/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.4.0.bb
similarity index 75%
rename from recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.4.bb
rename to recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.4.0.bb
index c57c98f..e6edb26 100644
--- a/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.4.bb
+++ b/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.4.0.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
                     file://gst/tta/filters.h;beginline=12;endline=29;md5=8a08270656f2f8ad7bb3655b83138e5a \
                     file://COPYING.LIB;md5=21682e4e8fea52413fd26c60acb907e5 \
                     file://gst/tta/crc32.h;beginline=12;endline=29;md5=27db269c575d1e5317fffca2d33b3b50"
-SRC_URI[md5sum] = "16c2050716383926909664aa6c6aca2b"
-SRC_URI[sha256sum] = "984c133ec9d5d705e313d9e2bbd1472b93c6567460602a9a316578925ffe2eca"
+SRC_URI[md5sum] = "3bc0fcfe8d16ad1295f0454c1fcb4ba3"
+SRC_URI[sha256sum] = "ff2cb754f7725b205aec66002b1406e440f3a03194b6cad2d126ef5cd00902f9"
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
-- 
1.8.3.2



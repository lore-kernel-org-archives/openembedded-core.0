Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 98A4778A29
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 10:07:19 +0000 (UTC)
Received: from localhost.localdomain (62-178-50-190.cable.dynamic.surfer.at
	[62.178.50.190]) by ptmx.org (Postfix) with ESMTPSA id 4161015C2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 12:07:20 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2018 12:07:11 +0200
Message-Id: <20180719100714.9639-3-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180719100714.9639-1-dv@pseudoterminal.org>
References: <20180719100714.9639-1-dv@pseudoterminal.org>
Subject: [PATCH v2 3/6] gstreamer1.0-plugin-bad: Update packageconfigs
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
X-List-Received-Date: Thu, 19 Jul 2018 10:07:20 -0000

* Add packageconfigs for gl, libde265, lcms2, openh264, tinyalsa, ttml,
  webrtc, webrtcdsp
* Add note about neon being dead (and --disable-neon config switch)
* Remove unnecessary gstglconfig.h line, since that file is no longer
  part of -bad (it is in -base now)
* Update EXTRA_OECONF flags, since new plugins got added to -bad
* Add ttml to the default packageconfigs since its dependencies are
  all in oe-core
---
 .../gstreamer1.0-plugins-bad_1.14.1.bb        | 35 ++++++++++++++-----
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.1.bb
index 0e477e5a9c..721df60b8d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.1.bb
@@ -27,9 +27,14 @@ PACKAGECONFIG ??= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'directfb vulkan', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
-    bz2 curl dash dtls hls rsvg sbc smoothstreaming sndfile uvch264 webp \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)} \
+    bz2 curl dash dtls hls rsvg sbc smoothstreaming sndfile ttml uvch264 webp \
 "
 
+# the gl packageconfig enables OpenGL elements that haven't been ported
+# to -base yet. They depend on the gstgl library in -base, so we do
+# not add GL dependencies here, since these are taken care of in -base.
+
 PACKAGECONFIG[assrender]       = "--enable-assrender,--disable-assrender,libass"
 PACKAGECONFIG[bluez]           = "--enable-bluez,--disable-bluez,${BLUEZ}"
 PACKAGECONFIG[bz2]             = "--enable-bz2,--disable-bz2,bzip2"
@@ -43,13 +48,17 @@ PACKAGECONFIG[faad]            = "--enable-faad,--disable-faad,faad2"
 PACKAGECONFIG[flite]           = "--enable-flite,--disable-flite,flite-alsa"
 PACKAGECONFIG[fluidsynth]      = "--enable-fluidsynth,--disable-fluidsynth,fluidsynth"
 PACKAGECONFIG[hls]             = "--enable-hls --with-hls-crypto=nettle,--disable-hls,nettle"
+PACKAGECONFIG[gl]              = "--enable-gl,--disable-gl,"
 PACKAGECONFIG[kms]             = "--enable-kms,--disable-kms,libdrm"
+PACKAGECONFIG[libde265]        = "--enable-libde265,--disable-libde265,libde265"
 PACKAGECONFIG[libmms]          = "--enable-libmms,--disable-libmms,libmms"
 PACKAGECONFIG[libssh2]         = "--enable-libssh2,--disable-libssh2,libssh2"
+PACKAGECONFIG[lcms2]           = "--enable-lcms2,--disable-lcms2,lcms"
 PACKAGECONFIG[modplug]         = "--enable-modplug,--disable-modplug,libmodplug"
 PACKAGECONFIG[neon]            = "--enable-neon,--disable-neon,neon"
 PACKAGECONFIG[openal]          = "--enable-openal,--disable-openal,openal-soft"
 PACKAGECONFIG[opencv]          = "--enable-opencv,--disable-opencv,opencv"
+PACKAGECONFIG[openh264]        = "--enable-openh264,--disable-openh264,openh264"
 PACKAGECONFIG[openjpeg]        = "--enable-openjpeg,--disable-openjpeg,openjpeg"
 # the opus encoder/decoder elements are now in the -base package,
 # but the opus parser remains in -bad
@@ -61,28 +70,38 @@ PACKAGECONFIG[sbc]             = "--enable-sbc,--disable-sbc,sbc"
 PACKAGECONFIG[smoothstreaming] = "--enable-smoothstreaming,--disable-smoothstreaming,libxml2"
 PACKAGECONFIG[sndfile]         = "--enable-sndfile,--disable-sndfile,libsndfile1"
 PACKAGECONFIG[srtp]            = "--enable-srtp,--disable-srtp,libsrtp"
+PACKAGECONFIG[tinyalsa]        = "--enable-tinyalsa,--disable-tinyalsa,tinyalsa"
+PACKAGECONFIG[ttml]            = "--enable-ttml,--disable-ttml,libxml2 pango cairo"
 PACKAGECONFIG[uvch264]         = "--enable-uvch264,--disable-uvch264,libusb1 libgudev"
 PACKAGECONFIG[voaacenc]        = "--enable-voaacenc,--disable-voaacenc,vo-aacenc"
 PACKAGECONFIG[voamrwbenc]      = "--enable-voamrwbenc,--disable-voamrwbenc,vo-amrwbenc"
 PACKAGECONFIG[vulkan]          = "--enable-vulkan,--disable-vulkan,vulkan"
 PACKAGECONFIG[wayland]         = "--enable-wayland,--disable-wayland,wayland-native wayland wayland-protocols libdrm"
 PACKAGECONFIG[webp]            = "--enable-webp,--disable-webp,libwebp"
+PACKAGECONFIG[webrtc]          = "--enable-webrtc,--disable-webrtc,libnice"
+PACKAGECONFIG[webrtcdsp]       = "--enable-webrtcdsp,--disable-webrtcdsp,webrtc-audio-processing"
 
 # these plugins have no corresponding library in OE-core or meta-openembedded:
 #   openni2 winks direct3d directsound winscreencap acm apple_media iqa
-#   android_media avc bs2b chromaprint daala dts fdkaac gme gsm kate ladspa libde265
-#   lv2 mpeg2enc mplex msdk musepack nvenc ofa openh264 opensles soundtouch spandsp
-#   spc teletextdec tinyalsa vdpau wasapi x265 zbar webrtcdsp
+#   android_media avc bs2b chromaprint daala dts fdkaac gme gsm kate ladspa
+#   lv2 mpeg2enc mplex msdk musepack nvenc ofa openmpt opensles soundtouch
+#   spandsp spc teletextdec vdpau wasapi x265 zbar
+
+# these plugins have been removed from oe-core because their upstream dependencies
+# are no longer maintained or available:
+#   neon
 
 EXTRA_OECONF += " \
     --enable-decklink \
     --enable-dvb \
     --enable-fbdev \
+    --enable-ipcpipeline \
     --enable-netsim \
     --enable-shm \
     --enable-vcd \
     --disable-acm \
     --disable-android_media \
+    --disable-aom \
     --disable-apple_media \
     --disable-avc \
     --disable-bs2b \
@@ -97,26 +116,25 @@ EXTRA_OECONF += " \
     --disable-iqa \
     --disable-kate \
     --disable-ladspa \
-    --disable-libde265 \
     --disable-lv2 \
     --disable-mpeg2enc \
     --disable-mplex \
     --disable-msdk \
     --disable-musepack \
+    --disable-neon \
     --disable-nvenc \
     --disable-ofa \
     --disable-openexr \
-    --disable-openh264 \
+    --disable-openmpt \
     --disable-openni2 \
     --disable-opensles \
     --disable-soundtouch \
     --disable-spandsp \
     --disable-spc \
+    --disable-srt \
     --disable-teletextdec \
-    --disable-tinyalsa \
     --disable-vdpau \
     --disable-wasapi \
-    --disable-webrtcdsp \
     --disable-wildmidi \
     --disable-winks \
     --disable-winscreencap \
@@ -130,7 +148,6 @@ export OPENCV_PREFIX = "${STAGING_DIR_TARGET}${prefix}"
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
 
-FILES_${PN}-dev += "${libdir}/gstreamer-${LIBV}/include/gst/gl/gstglconfig.h"
 FILES_${PN}-freeverb += "${datadir}/gstreamer-${LIBV}/presets/GstFreeverb.prs"
 FILES_${PN}-opencv += "${datadir}/gst-plugins-bad/${LIBV}/opencv*"
 FILES_${PN}-voamrwbenc += "${datadir}/gstreamer-${LIBV}/presets/GstVoAmrwbEnc.prs"
-- 
2.17.1



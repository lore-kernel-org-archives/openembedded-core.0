Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 566326A5A2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2013 19:46:30 +0000 (UTC)
Received: from localhost.localdomain (chello080108009040.14.11.vie.surfer.at
	[80.108.9.40]) by ptmx.org (Postfix) with ESMTPSA id A78C029212
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2013 20:46:30 +0100 (CET)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Nov 2013 20:47:34 +0100
Message-Id: <1383853654-8658-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.8.4.1
Subject: [PATCH] gstreamer1.0: upgrade to 1.2.0
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
X-List-Received-Date: Thu, 07 Nov 2013 19:46:30 -0000

starting with this version, the recipes enable Orc acceleration by
default

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../gstreamer/gstreamer1.0-libav.inc               |   2 +-
 .../gstreamer1.0-libav/libav_e500mc.patch          |  21 ----
 ...-libav_1.0.9.bb => gstreamer1.0-libav_1.2.0.bb} |  13 ++-
 .../gstreamer/gstreamer1.0-plugins-bad.inc         | 107 ++++++++++++---------
 ..._1.0.9.bb => gstreamer1.0-plugins-bad_1.2.0.bb} |   6 +-
 .../gstreamer/gstreamer1.0-plugins-base.inc        |   2 +-
 .../gstreamer/gstreamer1.0-plugins-base_1.0.9.bb   |  10 --
 .../gstreamer/gstreamer1.0-plugins-base_1.2.0.bb   |  10 ++
 .../gstreamer/gstreamer1.0-plugins-good.inc        |  13 ++-
 ...1.0.9.bb => gstreamer1.0-plugins-good_1.2.0.bb} |   6 +-
 .../gstreamer/gstreamer1.0-plugins-ugly.inc        |   2 +-
 ...1.0.9.bb => gstreamer1.0-plugins-ugly_1.2.0.bb} |   4 +-
 ...gstreamer1.0_1.0.9.bb => gstreamer1.0_1.2.0.bb} |   8 +-
 13 files changed, 101 insertions(+), 103 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/libav_e500mc.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.0.9.bb => gstreamer1.0-libav_1.2.0.bb} (68%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.0.9.bb => gstreamer1.0-plugins-bad_1.2.0.bb} (68%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.0.9.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.0.bb
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.0.9.bb => gstreamer1.0-plugins-good_1.2.0.bb} (62%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.0.9.bb => gstreamer1.0-plugins-ugly_1.2.0.bb} (66%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.0.9.bb => gstreamer1.0_1.2.0.bb} (52%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
index 3d996bc..ec5956a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
@@ -13,7 +13,7 @@ PR = "r1"
 # CAUTION: Using the system libav is not recommended. Since the libav API is changing all the time,
 # compilation errors (and other, more subtle bugs) can happen. It is usually better to rely on the
 # libav copy included in the gst-libav package.
-PACKAGECONFIG ??= " "
+PACKAGECONFIG ??= " orc "
 PACKAGECONFIG[libav] = "--with-system-libav,,libav"
 PACKAGECONFIG[lgpl]  = "--enable-lgpl,,"
 PACKAGECONFIG[yasm]  = "--enable-yasm,--disable-yasm,yasm-native"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/libav_e500mc.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/libav_e500mc.patch
deleted file mode 100644
index eba4988..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/libav_e500mc.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-diff --git a/gst-libs/ext/libav/configure b/gst-libs/ext/libav/configure
-index 8473069..4f74952 100755
---- a/gst-libs/ext/libav/configure
-+++ b/gst-libs/ext/libav/configure
-Fix gst-ffmpeg build issues for libav on e500mc (fsl-p4080)
-
-Upstream-Status: Backport
-
-Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
-
-@@ -2210,6 +2210,10 @@ elif enabled ppc; then
-             cpuflags="-mcpu=cell"
-             enable ldbrx
-         ;;
-+        e500mc)
-+            cpuflags="-mcpu=e500mc"
-+            disable altivec
-+        ;;
-         e500v2)
-             cpuflags="-mcpu=8548 -mhard-float -mfloat-gprs=double"
-             disable altivec
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.0.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.0.bb
similarity index 68%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.0.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.0.bb
index 0b6bd50..66fe83b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.0.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.0.bb
@@ -1,21 +1,20 @@
 include gstreamer1.0-libav.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605 \
-                    file://ext/libav/gstav.h;beginline=1;endline=18;md5=ff65467b0c53cdfa98d0684c1bc240a9 \
-                    file://gst-libs/ext/libav/LICENSE;md5=abc3b8cb02856aa7823bbbd162d16232 \
+                    file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
+                    file://ext/libav/gstav.h;beginline=1;endline=18;md5=a752c35267d8276fd9ca3db6994fca9c \
+                    file://gst-libs/ext/libav/LICENSE;md5=23a54f59b82572c203a559346e89ed57 \
                     file://gst-libs/ext/libav/COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://gst-libs/ext/libav/COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://gst-libs/ext/libav/COPYING.LGPLv2.1;md5=e344c8fa836c3a41c4cbd79d7bd3a379 \
+                    file://gst-libs/ext/libav/COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
                     file://gst-libs/ext/libav/COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
 SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz \
     file://0001-Disable-yasm-for-libav-when-disable-yasm.patch \
-    file://libav_e500mc.patch \
     "
-SRC_URI[md5sum] = "8414f8d4c4a239a74a3d5eadf3d14875"
-SRC_URI[sha256sum] = "759641c0597c24191322f40945b363b75df299a539ff4086650be6193028189a"
+SRC_URI[md5sum] = "382bc5a99d22a4fbf8e971c42bb72c01"
+SRC_URI[sha256sum] = "48721eb318ffffdd134edea754d0b65d76b08c8209a8d2c8a42bca1f799f9099"
 
 LIBAV_EXTRA_CONFIGURE_COMMON_ARG = "--target-os=linux \
   --cc='${CC}' --as='${CC}' --ld='${CC}' --nm='${NM}' --ar='${AR}' \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index a36335a..b7d025f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -4,96 +4,111 @@ LICENSE = "GPLv2+ & LGPLv2+ & LGPLv2.1+ "
 
 DEPENDS += "gstreamer1.0-plugins-base bzip2"
 
-SRC_URI[md5sum] = "d1493d1219b836a8cbf54f4fba962420"
-SRC_URI[sha256sum] = "5f49e6353fdc855834b5beb054b3a47ef5fa558006c7eda6d2ec07b36315c2ab"
-
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
 inherit gettext
 
 
 PACKAGECONFIG ??= " \
-    curl eglgles wayland \
+    orc curl eglgles wayland uvch264 directfb neon \
+    hls sbc dash bz2 smoothstreaming bluez \
     "
-
-PACKAGECONFIG[assrender] = "--enable-assrender,--disable-assrender,libass"
-PACKAGECONFIG[curl]      = "--enable-curl,--disable-curl,curl"
-PACKAGECONFIG[eglgles]   = "--enable-eglgles,--disable-eglgles,virtual/egl virtual/libgles2"
-PACKAGECONFIG[faad]      = "--enable-faad,--disable-faad,faad2"
-PACKAGECONFIG[libmms]    = "--enable-libmms,--disable-libmms,libmms"
-PACKAGECONFIG[modplug]   = "--enable-modplug,--disable-modplug,libmodplug"
-PACKAGECONFIG[mpg123]    = "--enable-mpg123,--disable-mpg123,mpg123"
-PACKAGECONFIG[opus]      = "--enable-opus,--disable-opus,libopus"
-PACKAGECONFIG[flite]     = "--enable-flite,--disable-flite,flite-alsa"
-PACKAGECONFIG[opencv]    = "--enable-opencv,--disable-opencv,opencv"
-PACKAGECONFIG[wayland]   = "--enable-wayland,--disable-wayland,wayland"
-
+# rsvg plugin requires librsvg >= 2.36
+# dash = Dynamic Adaptive Streaming over HTTP
+PACKAGECONFIG[assrender]       = "--enable-assrender,--disable-assrender,libass"
+PACKAGECONFIG[curl]            = "--enable-curl,--disable-curl,curl"
+PACKAGECONFIG[eglgles]         = "--enable-eglgles,--disable-eglgles,virtual/egl virtual/libgles2"
+PACKAGECONFIG[faac]            = "--enable-faac,--disable-faac,faac"
+PACKAGECONFIG[faad]            = "--enable-faad,--disable-faad,faad2"
+PACKAGECONFIG[libmms]          = "--enable-libmms,--disable-libmms,libmms"
+PACKAGECONFIG[modplug]         = "--enable-modplug,--disable-modplug,libmodplug"
+PACKAGECONFIG[mpg123]          = "--enable-mpg123,--disable-mpg123,mpg123"
+PACKAGECONFIG[opus]            = "--enable-opus,--disable-opus,libopus"
+PACKAGECONFIG[flite]           = "--enable-flite,--disable-flite,flite-alsa"
+PACKAGECONFIG[opencv]          = "--enable-opencv,--disable-opencv,opencv"
+PACKAGECONFIG[wayland]         = "--enable-wayland,--disable-wayland,wayland"
+PACKAGECONFIG[uvch264]         = "--enable-uvch264,--disable-uvch264,libusb1 udev"
+PACKAGECONFIG[directfb]        = "--enable-directfb,--disable-directfb,directfb"
+PACKAGECONFIG[neon]            = "--enable-neon,--disable-neon,neon"
+PACKAGECONFIG[openal]          = "--enable-openal,--disable-openal,openal-soft"
+PACKAGECONFIG[hls]             = "--enable-hls,--disable-hls,gnutls"
+PACKAGECONFIG[sbc]             = "--enable-sbc,--disable-sbc,sbc"
+PACKAGECONFIG[dash]            = "--enable-dash,--disable-dash,libxml2"
+PACKAGECONFIG[bz2]             = "--enable-bz2,--disable-bz2,bzip2"
+PACKAGECONFIG[fluidsynth]      = "--enable-fluidsynth,--disable-fluidsynth,fluidsynth"
+PACKAGECONFIG[schroedinger]    = "--enable-schro,--disable-schro,schroedinger"
+PACKAGECONFIG[smoothstreaming] = "--enable-smoothstreaming,--disable-smoothstreaming,libxml2"
+PACKAGECONFIG[bluez]           = "--enable-bluez,--disable-bluez,bluez4"
 
 
 # these plugins have not been ported to 1.0 (yet):
-#   directdraw vcd uvch264 apexsink cdaudio cog dc1394 directfb dirac fbdev jasper
-#   kate ladspa lv2 linsys musepack musicbrainz mythtv nas neon ofa openal rsvg
-#   timidity teletextdec wildmidi sdl sndfile xvid wininet acm gsettings sndio
-#mfc hls openjpeg sbc 
+#   directdraw vcd apexsink cdaudio dc1394 lv2 linsys musepack mythtv
+#   nas timidity teletextdec sdl sndfile xvid wininet acm gsettings
+#   sndio cdxaparse dccp faceoverlay hdvparse ivfparse jp2kdecimator
+#   linsys mve nuvdemux osx_video patchdetect quicktime real sdi stereo
+#   tta videomeasure videosignal vmnc
+
 EXTRA_OECONF += " \
     --enable-dvb \
     --enable-shm \
-    --disable-uvch264 \
-    --disable-vcd \
-    --disable-fbdev \
-    --disable-examples \
-    --disable-experimental \
-    --disable-celt \
-    --disable-chromaprint \
-    --disable-decklink \
-    --disable-dts \
-    --disable-faac \
-    --disable-gme \
-    --disable-gsm \
-    --disable-mpeg2enc \
-    --disable-mplex \
-    --disable-resindvd \
-    --disable-rtmp \
-    --disable-schro \
-    --disable-soundtouch \
-    --disable-spandsp \
-    --disable-vdpau \
+    --enable-mfc \
+    --enable-fbdev \
+    --enable-decklink \
     --disable-acm \
     --disable-android_media \
     --disable-apexsink \
     --disable-apple_media \
     --disable-avc \
     --disable-cdaudio \
-    --disable-cog \
+    --disable-chromaprint \
+    --disable-daala \
     --disable-dc1394 \
-    --disable-dirac \
     --disable-direct3d \
-    --disable-direct3d9 \
     --disable-directdraw \
-    --disable-directsound \
     --disable-directshow \
+    --disable-directsound \
+    --disable-dts \
+    --disable-gme \
     --disable-gsettings \
+    --disable-gsm \
     --disable-kate \
     --disable-ladspa \
     --disable-linsys \
     --disable-lv2 \
     --disable-mimic \
+    --disable-mpeg2enc \
+    --disable-mplex \
     --disable-musepack \
     --disable-mythtv \
     --disable-nas \
     --disable-ofa \
+    --disable-openjpeg \
+    --disable-opensles \
     --disable-osx_video \
     --disable-pvr \
     --disable-quicktime \
+    --disable-resindvd \
+    --disable-rsvg \
+    --disable-rtmp \
+    --disable-sdl \
+    --disable-sdltest \
+    --disable-sndfile \
     --disable-sndio \
+    --disable-soundtouch \
+    --disable-spandsp \
     --disable-spc \
-    --disable-swfdec \
+    --disable-srtp \
     --disable-teletextdec \
     --disable-timidity \
+    --disable-vcd \
+    --disable-vdpau \
     --disable-voaacenc \
     --disable-voamrwbenc \
+    --disable-wasapi \
+    --disable-webp \
     --disable-wildmidi \
     --disable-wininet \
+    --disable-winscreencap \
     --disable-xvid \
     --disable-zbar \
     ${GSTREAMER_1_0_ORC} \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.0.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.0.bb
similarity index 68%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.0.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.0.bb
index 9ce7991..48bc94a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.0.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.0.bb
@@ -3,10 +3,10 @@ include gstreamer1.0-plugins-bad.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
                     file://gst/tta/filters.h;beginline=12;endline=29;md5=8a08270656f2f8ad7bb3655b83138e5a \
                     file://COPYING.LIB;md5=21682e4e8fea52413fd26c60acb907e5 \
-                    file://gst/tta/crc32.h;beginline=12;endline=29;md5=71a904d99ce7ae0c1cf129891b98145c"
+                    file://gst/tta/crc32.h;beginline=12;endline=29;md5=27db269c575d1e5317fffca2d33b3b50"
 
-SRC_URI[md5sum] = "569e5122fd7bfd7bd861a537f0a28c60"
-SRC_URI[sha256sum] = "69d236b1d8188270a3f51f6710146d0ca63c2f1a9f6cfbab3399ef01b9498f75"
+SRC_URI[md5sum] = "4fd078e1b9d903d22b67872b616f1715"
+SRC_URI[sha256sum] = "a12fac6c106a7e4ae8bb2c7da508688d7db532b818319df2202f497cbd930afa"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
index 5002399..ebfa7cd 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
@@ -11,7 +11,7 @@ inherit gettext
 PACKAGECONFIG ??= " \
     ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
     ${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
-    ivorbis ogg theora vorbis \
+    orc ivorbis ogg theora vorbis \
     "
 
 X11DEPENDS = "virtual/libx11 libsm libxrender"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.0.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.0.9.bb
deleted file mode 100644
index 7b1e990..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.0.9.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-include gstreamer1.0-plugins-base.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
-                    file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=622921ffad8cb18ab906c56052788a3f \
-                    file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605 \
-                   "
-SRC_URI[md5sum] = "24af1986581d9c2cd3dc834ab64d133d"
-SRC_URI[sha256sum] = "963e3b83d651661f495ca2e44ccd2d5c61e986e9d7706246e568276689a372ea"
-
-S = "${WORKDIR}/gst-plugins-base-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.0.bb
new file mode 100644
index 0000000..cc4d11b
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.0.bb
@@ -0,0 +1,10 @@
+include gstreamer1.0-plugins-base.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
+                    file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607 \
+                    file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
+                   "
+SRC_URI[md5sum] = "d0f7bb7f6c781be127902bff89b87c5c"
+SRC_URI[sha256sum] = "8656e20bf4b675e5696fb4af193793351926d428ca02826c5667a6384729a45d"
+
+S = "${WORKDIR}/gst-plugins-base-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
index 19b16ca..b694988 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
@@ -11,7 +11,7 @@ inherit gettext gconf
 PACKAGECONFIG ??= " \
     ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
     ${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
-    cairo flac gdk-pixbuf jpeg libpng soup speex taglib \
+    orc cairo flac gdk-pixbuf jpeg libpng soup speex taglib \
     "
 
 X11DEPENDS = "virtual/libx11 libsm libxrender"
@@ -30,12 +30,17 @@ PACKAGECONFIG[speex]      = "--enable-speex,--disable-speex,speex"
 PACKAGECONFIG[taglib]     = "--enable-taglib,--disable-taglib,taglib"
 PACKAGECONFIG[vpx]        = "--enable-vpx,--disable-vpx,libvpx"
 PACKAGECONFIG[wavpack]    = "--enable-wavpack,--disable-wavpack,wavpack"
-PACKAGECONFIG[v4l]        = "--with-libv4l2,--without-libv4l2,libv4l"
+
+# the 1394 plugins require both libraw1394 and libiec61883
+# the former is included in meta-oe, the latter isn't
+# -> disabled
 
 EXTRA_OECONF += " \
+    --enable-oss \
+    --enable-gst_v4l2 \
+    --without-libv4l2 \
     --disable-directsound \
     --disable-waveform \
-    --disable-oss \
     --disable-oss4 \
     --disable-sunaudio \
     --disable-osx_audio \
@@ -43,9 +48,9 @@ EXTRA_OECONF += " \
     --disable-aalib \
     --disable-libcaca \
     --disable-libdv \
-    --disable-dv1394 \
     --disable-shout2 \
     --disable-examples \
+    --disable-dv1394 \
     ${GSTREAMER_1_0_ORC} \
 "
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.0.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.0.bb
similarity index 62%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.0.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.0.bb
index 1b65b7d..5d54f27 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.0.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.0.bb
@@ -1,11 +1,11 @@
 include gstreamer1.0-plugins-good.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
-                    file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=622921ffad8cb18ab906c56052788a3f \
+                    file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607 \
                     file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
 
-SRC_URI[md5sum] = "20bb77f201b044f4ba61de167c4466d7"
-SRC_URI[sha256sum] = "cfa2e617a76f93e9ddd4ae1109297e93fb4a06b152042b996231234a72c5a5ff"
+SRC_URI[md5sum] = "df96825d4154940fd934aa0a95b40836"
+SRC_URI[sha256sum] = "2256a6b2744ea18d8810642cf9061a2f12f4b7eba87d3fbc98004262b4f0fdfa"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
index 3f47949..0dd011b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
@@ -9,7 +9,7 @@ inherit gettext
 
 
 PACKAGECONFIG ??= " \
-    a52dec lame mad mpeg2dec \
+    orc a52dec lame mad mpeg2dec \
     "
 
 PACKAGECONFIG[a52dec]   = "--enable-a52dec,--disable-a52dec,liba52"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.0.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2.0.bb
similarity index 66%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.0.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2.0.bb
index 30fa3a3..a772877 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.0.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2.0.bb
@@ -3,8 +3,8 @@ include gstreamer1.0-plugins-ugly.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://tests/check/elements/xingmux.c;beginline=1;endline=21;md5=4c771b8af188724855cb99cadd390068 "
 
-SRC_URI[md5sum] = "ea8b4e05ed5beb982762b45aba266720"
-SRC_URI[sha256sum] = "11250fe9e44b0169c3a289e981b31874b483643ed78f619682ae1644d7088379"
+SRC_URI[md5sum] = "81c97981ed373bd77bb10f2ae555c166"
+SRC_URI[sha256sum] = "e4760af4b12bf97ba0a8001cfe733d9d52160a0ad81f6c6f0d0d3a9e798626de"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.0.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.2.0.bb
similarity index 52%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.0.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.2.0.bb
index e4b2f1e..98d5412 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.0.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.2.0.bb
@@ -1,13 +1,13 @@
 include gstreamer1.0.inc
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605 \
-                    file://gst/gst.h;beginline=1;endline=21;md5=8e5fe5e87d33a04479fde862e238eaa4"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
+                    file://gst/gst.h;beginline=1;endline=21;md5=e059138481205ee2c6fc1c079c016d0d"
 
 SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
     file://0001-Fix-crash-with-gst-inspect.patch \
     "
-SRC_URI[md5sum] = "cbbad73d703b811bc8bd18e47b36e534"
-SRC_URI[sha256sum] = "17a2c60a82baa461ef685ad3de187edb9c03a2c7e07513daba58a5a32efacaa3"
+SRC_URI[md5sum] = "250b4bec48b0986103f5aab75e43cef9"
+SRC_URI[sha256sum] = "94af5274299f845adf41cc504e0209b269acab7721293f49850fea27b4099463"
 S = "${WORKDIR}/gstreamer-${PV}"
 
-- 
1.8.4.1



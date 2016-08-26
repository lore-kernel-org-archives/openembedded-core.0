Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 3D8EC7707F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 18:53:33 +0000 (UTC)
Received: from localhost.localdomain (62-178-118-86.cable.dynamic.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 21F373C1F2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 20:53:30 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2016 20:53:20 +0200
Message-Id: <1472237600-11001-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] gstreamer1.0-plugins-bad: Fix packageconfigs and patches
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
X-List-Received-Date: Fri, 26 Aug 2016 18:53:35 -0000

This reintroduces fixes and changes which were introduced in the original
gstreamer1.0-plugins-bad 1.8.1 upgrade commit.

* packageconfigs changed since GStreamer 1.6.3
  (they often do between minor version increases like 1.6 -> 1.8)
* hls,tinyalsa packageconfigs moved into the .inc file
* vulkan packageconfig dropped since there are no vulkan libraries in OE
  (libxcb alone is not enough)
* reintroduced glimagesink downrank patch (it was removed because it was
  dangling before)
* fixed patch line numbers

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../gstreamer/gstreamer1.0-plugins-bad.inc         | 24 ++++++++++-----
 ...-don-t-hardcode-libtool-name-when-running.patch |  4 +--
 .../0009-glimagesink-Downrank-to-marginal.patch    | 32 ++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb    | 34 +---------------------
 .../gstreamer/gstreamer1.0-plugins-bad_git.bb      | 20 -------------
 5 files changed, 51 insertions(+), 63 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0009-glimagesink-Downrank-to-marginal.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index d8c8179..8f539e2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -38,7 +38,9 @@ PACKAGECONFIG[flite]           = "--enable-flite,--disable-flite,flite-alsa"
 PACKAGECONFIG[fluidsynth]      = "--enable-fluidsynth,--disable-fluidsynth,fluidsynth"
 PACKAGECONFIG[gles2]           = "--enable-gles2,--disable-gles2,virtual/libgles2"
 PACKAGECONFIG[gtk]             = "--enable-gtk3,--disable-gtk3,gtk+3"
-PACKAGECONFIG[hls]             = "--enable-hls,--disable-hls,nettle"
+# ensure OpenSSL is used for HLS AES description instead of nettle
+# (OpenSSL is a shared dependency with dtls)
+PACKAGECONFIG[hls]             = "--enable-hls --with-hls-crypto=openssl,--disable-hls,openssl"
 PACKAGECONFIG[libmms]          = "--enable-libmms,--disable-libmms,libmms"
 PACKAGECONFIG[libssh2]         = "--enable-libssh2,--disable-libssh2,libssh2"
 PACKAGECONFIG[modplug]         = "--enable-modplug,--disable-modplug,libmodplug"
@@ -46,7 +48,9 @@ PACKAGECONFIG[neon]            = "--enable-neon,--disable-neon,neon"
 PACKAGECONFIG[openal]          = "--enable-openal,--disable-openal,openal-soft"
 PACKAGECONFIG[opencv]          = "--enable-opencv,--disable-opencv,opencv"
 PACKAGECONFIG[opengl]          = "--enable-opengl,--disable-opengl,virtual/libgl libglu"
-PACKAGECONFIG[opus]            = "--enable-opus,--disable-opus,libopus"
+# the opus encoder/decoder elements are now in the -base package,
+# but the opus parser remains in -bad
+PACKAGECONFIG[opusparse]       = "--enable-opus,--disable-opus,libopus"
 PACKAGECONFIG[resindvd]        = "--enable-resindvd,--disable-resindvd,libdvdread libdvdnav"
 PACKAGECONFIG[rsvg]            = "--enable-rsvg,--disable-rsvg,librsvg"
 PACKAGECONFIG[rtmp]            = "--enable-rtmp,--disable-rtmp,rtmpdump"
@@ -62,15 +66,15 @@ PACKAGECONFIG[wayland]         = "--enable-wayland --enable-egl,--disable-waylan
 PACKAGECONFIG[webp]            = "--enable-webp,--disable-webp,libwebp"
 
 # these plugins have not been ported to 1.0 (yet):
-#   apexsink dc1394 lv2 linsys musepack nas timidity teletextdec sdl xvid wininet
-#   acm gsettings sndio cdxaparse dccp faceoverlay hdvparse tta mve nuvdemux
-#   patchdetect real sdi videomeasure gsettings
+#   apexsink dc1394 lv2 linsys musepack nas timidity sdl xvid wininet
+#   sndio cdxaparse dccp faceoverlay hdvparse tta mve nuvdemux
+#   patchdetect sdi videomeasure
 
 # these plugins have no corresponding library in OE-core or meta-openembedded:
-#   openni2 winks direct3d directsound winscreencap
+#   openni2 winks direct3d directsound winscreencap acm
 #   apple_media android_media avc bs2b chromaprint daala dts gme gsm kate ladspa
-#   libde265 mimic mpeg2enc mplex ofa openh264 opensles pvr soundtouch spandsp
-#   spc vdpau wasapi x265 zbar
+#   libde265 mimic mpeg2enc mplex nvenc ofa openh264 opensles pvr soundtouch spandsp
+#   spc teletextdec tinyalsa vdpau vulkan wasapi x265 zbar
 
 # qt5 support is disabled, because it is not present in OE core, and requires more work than
 # just adding a packageconfig (it requires access to moc, uic, rcc, and qmake paths).
@@ -81,6 +85,7 @@ EXTRA_OECONF += " \
     --enable-decklink \
     --enable-dvb \
     --enable-fbdev \
+    --enable-netsim \
     --enable-shm \
     --enable-vcd \
     --disable-acm \
@@ -109,6 +114,7 @@ EXTRA_OECONF += " \
     --disable-mplex \
     --disable-musepack \
     --disable-nas \
+    --disable-nvenc \
     --disable-ofa \
     --disable-openexr \
     --disable-openh264 \
@@ -125,7 +131,9 @@ EXTRA_OECONF += " \
     --disable-spc \
     --disable-teletextdec \
     --disable-timidity \
+    --disable-tinyalsa \
     --disable-vdpau \
+    --disable-vulkan \
     --disable-wasapi \
     --disable-wildmidi \
     --disable-wininet \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
index 154d340..33efc50 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
@@ -17,7 +17,7 @@ diff --git a/gst-libs/gst/gl/Makefile.am b/gst-libs/gst/gl/Makefile.am
 index f968357..7cc2c7a 100644
 --- a/gst-libs/gst/gl/Makefile.am
 +++ b/gst-libs/gst/gl/Makefile.am
-@@ -149,7 +149,7 @@ GstGL-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstgl-@GST_API_VERSION@
+@@ -167,7 +167,7 @@ GstGL-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstgl-@GST_API_VERSION@
  		--library=libgstgl-@GST_API_VERSION@.la \
  		--include=Gst-@GST_API_VERSION@ \
  		--include=GstBase-@GST_API_VERSION@ \
@@ -30,7 +30,7 @@ diff --git a/gst-libs/gst/insertbin/Makefile.am b/gst-libs/gst/insertbin/Makefil
 index 09eb97c..b746885 100644
 --- a/gst-libs/gst/insertbin/Makefile.am
 +++ b/gst-libs/gst/insertbin/Makefile.am
-@@ -43,7 +43,7 @@ GstInsertBin-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstinsertbin-@GS
+@@ -44,7 +44,7 @@ GstInsertBin-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstinsertbin-@GS
  		--library=libgstinsertbin-@GST_API_VERSION@.la \
  		--include=Gst-@GST_API_VERSION@ \
  		--include=GstBase-@GST_API_VERSION@ \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0009-glimagesink-Downrank-to-marginal.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0009-glimagesink-Downrank-to-marginal.patch
new file mode 100644
index 0000000..c81fb0f
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0009-glimagesink-Downrank-to-marginal.patch
@@ -0,0 +1,32 @@
+From c6b37a80806f9128de47f1ccc3f2354f8d436bb6 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 24 Sep 2015 19:47:32 +0300
+Subject: [PATCH] glimagesink: Downrank to marginal
+
+On desktop, where there is good OpenGL, xvimagesink will come up first,
+on other platforms, OpenGL can't be trusted because it's either software (like
+in a VM) or broken (like on embedded)., so let ximagesink come above.
+
+Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=751684]
+
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ ext/gl/gstopengl.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ext/gl/gstopengl.c b/ext/gl/gstopengl.c
+index a4b2540..0ccaacd 100644
+--- a/ext/gl/gstopengl.c
++++ b/ext/gl/gstopengl.c
+@@ -118,7 +118,7 @@ plugin_init (GstPlugin * plugin)
+ #endif
+ 
+   if (!gst_element_register (plugin, "glimagesink",
+-          GST_RANK_SECONDARY, gst_gl_image_sink_bin_get_type ())) {
++          GST_RANK_MARGINAL, gst_gl_image_sink_bin_get_type ())) {
+     return FALSE;
+   }
+ 
+-- 
+2.1.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb
index fb974a5..55fd121 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb
@@ -19,41 +19,9 @@ SRC_URI = " \
     file://0006-glcolorconvert-GLES3-deprecates-texture2D-and-it-doe.patch \
     file://0007-glplugin-gleffects-fix-little-rectangel-appears-at-t.patch \
     file://0008-gl-implement-GstGLMemoryEGL.patch \
+    file://0009-glimagesink-Downrank-to-marginal.patch \
 "
 SRC_URI[md5sum] = "83abc2e70684e7b195f18ca2992ef6e8"
 SRC_URI[sha256sum] = "d7995317530c8773ec088f94d9320909d41da61996b801ebacce9a56af493f97"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
-
-# over-ride the default hls PACKAGECONFIG in gstreamer1.0-plugins-bad.inc to
-# pass an additional --with-hls-crypto=XXX option (new in 1.7.x) and switch HLS
-# AES decryption from nettle to openssl (ie a shared dependency with dtls).
-# This should move back to the common .inc once the main recipe updates to 1.8.x
-PACKAGECONFIG[hls] = "--enable-hls --with-hls-crypto=openssl,--disable-hls,openssl"
-
-# The tinyalsa plugin was added prior to the 1.7.2 release
-# https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=c8bd74fa9a81398f57d976c478d2043f30188684
-PACKAGECONFIG[tinyalsa] = "--enable-tinyalsa,--disable-tinyalsa,tinyalsa"
-
-# The vulkan based video sink plugin was added prior to the 1.7.2 release
-# https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=5de6dd9f40629562acf90e35e1fa58464d66617d
-PACKAGECONFIG[vulkan] = "--enable-vulkan,--disable-vulkan,libxcb"
-
-# The dependency-less netsim plugin was added prior to the 1.7.2 release
-# https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=e3f9e854f08e82bfab11182c5a2aa6f9a0c73cd5
-EXTRA_OECONF += " \
-    --enable-netsim \
-"
-
-# In 1.6.2, the "--enable-hls" configure option generated an installable package
-# called "gstreamer1.0-plugins-bad-fragmented". In 1.7.1 that HLS plugin package
-# has become "gstreamer1.0-plugins-bad-hls". See:
-# http://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=efe62292a3d045126654d93239fdf4cc8e48ae08
-
-PACKAGESPLITFUNCS_append = " handle_hls_rename "
-
-python handle_hls_rename () {
-    d.setVar('RPROVIDES_gstreamer1.0-plugins-bad-hls', 'gstreamer1.0-plugins-bad-fragmented')
-    d.setVar('RREPLACES_gstreamer1.0-plugins-bad-hls', 'gstreamer1.0-plugins-bad-fragmented')
-    d.setVar('RCONFLICTS_gstreamer1.0-plugins-bad-hls', 'gstreamer1.0-plugins-bad-fragmented')
-}
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
index d3fbd12..1370380 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
@@ -27,26 +27,6 @@ SRCREV_FORMAT = "base"
 
 S = "${WORKDIR}/git"
 
-# over-ride the default hls PACKAGECONFIG in gstreamer1.0-plugins-bad.inc to
-# pass an additional --with-hls-crypto=XXX option (new in 1.7.x) and switch HLS
-# AES decryption from nettle to openssl (ie a shared dependency with dtls).
-# This should move back to the common .inc once the main recipe updates to 1.8.x
-PACKAGECONFIG[hls] = "--enable-hls --with-hls-crypto=openssl,--disable-hls,openssl"
-
-# The tinyalsa plugin was added prior to the 1.7.2 release
-# https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=c8bd74fa9a81398f57d976c478d2043f30188684
-PACKAGECONFIG[tinyalsa] = "--enable-tinyalsa,--disable-tinyalsa,tinyalsa"
-
-# The vulkan based video sink plugin was added prior to the 1.7.2 release
-# https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=5de6dd9f40629562acf90e35e1fa58464d66617d
-PACKAGECONFIG[vulkan] = "--enable-vulkan,--disable-vulkan,libxcb"
-
-# The dependency-less netsim plugin was added prior to the 1.7.2 release
-# https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=e3f9e854f08e82bfab11182c5a2aa6f9a0c73cd5
-EXTRA_OECONF += " \
-    --enable-netsim \
-"
-
 do_configure_prepend() {
 	${S}/autogen.sh --noconfigure
 }
-- 
2.7.4



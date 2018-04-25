Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5F3F571D79
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 06:41:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w3P6ftEV029699
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2018 23:41:56 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 24 Apr 2018 23:41:55 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Apr 2018 14:12:58 +0800
Message-ID: <d3d364ef6108718c365b356cd87a4f10155eb77f.1524636386.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1524636386.git.kai.kang@windriver.com>
References: <cover.1524636386.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/8] gstreamer1.0-plugins-base: 1.12.4 -> 1.14.0
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
X-List-Received-Date: Wed, 25 Apr 2018 06:41:55 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade gstreamer1.0-plugins-base from 1.12.4 to 1.14.0.

* add packageconfigs 'wayland', 'opengl', 'egl' and 'wayland' and
  configure option '--disable-cocoa' from -bad that related plugins have
  been moved from -bad to -base
* backport patch to fix compile error: Couldn't find include 'GstVideo-1.0.gir'
* update and refresh patches

Add and refresh following patches from gstreamer1.0-plugins-bad too:

* 0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch
* 0009-glimagesink-Downrank-to-marginal.patch
* link-with-libvchostif.patch

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../gstreamer/gstreamer1.0-plugins-base.inc        | 13 +++++-
 ...-don-t-hardcode-libtool-name-when-running.patch | 32 +++++++------
 ...-up-GstVideo-1.0.gir-from-local-build-dir.patch | 46 ++++++++++++++++++
 ...gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch |  4 +-
 ...-prefix-calls-to-pkg-config-with-PKG_CONF.patch | 54 +++++++++++++---------
 ...t-need_segment-after-sink-pad-received-GS.patch |  8 ++--
 .../0009-glimagesink-Downrank-to-marginal.patch    |  0
 .../link-with-libvchostif.patch                    | 16 +++++--
 ...make-gio_unix_2_0-dependency-configurable.patch |  4 +-
 ...12.4.bb => gstreamer1.0-plugins-base_1.14.0.bb} | 10 +++-
 10 files changed, 135 insertions(+), 52 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-gl-pick-up-GstVideo-1.0.gir-from-local-build-dir.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad => gstreamer1.0-plugins-base}/0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch (87%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad => gstreamer1.0-plugins-base}/0009-glimagesink-Downrank-to-marginal.patch (100%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad => gstreamer1.0-plugins-base}/link-with-libvchostif.patch (85%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.12.4.bb => gstreamer1.0-plugins-base_1.14.0.bb} (64%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
index 08130c1da4..9befa9568b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
@@ -15,9 +15,15 @@ inherit gettext
 
 PACKAGES_DYNAMIC =+ "^libgst.*"
 
+# opengl packageconfig factored out to make it easy for distros
+# and BSP layers to pick either (desktop) opengl, gles2, or no GL
+PACKAGECONFIG_GL ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gles2 egl', '', d)}"
+
 PACKAGECONFIG ??= " \
     ${GSTREAMER_ORC} \
+    ${PACKAGECONFIG_GL} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa x11', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland egl', '', d)} \
     gio-unix-2.0 ogg pango theora vorbis \
 "
 
@@ -27,18 +33,23 @@ X11DISABLEOPTS = "--disable-x --disable-xvideo --disable-xshm"
 
 PACKAGECONFIG[alsa]         = "--enable-alsa,--disable-alsa,alsa-lib"
 PACKAGECONFIG[cdparanoia]   = "--enable-cdparanoia,--disable-cdparanoia,cdparanoia"
+PACKAGECONFIG[egl]          = "--enable-egl,--disable-egl,virtual/egl"
 PACKAGECONFIG[gio-unix-2.0] = "--enable-gio_unix_2_0,--disable-gio_unix_2_0,glib-2.0"
+PACKAGECONFIG[gles2]        = "--enable-gles2,--disable-gles2,virtual/libgles2"
 PACKAGECONFIG[ivorbis]      = "--enable-ivorbis,--disable-ivorbis,tremor"
+PACKAGECONFIG[opengl]       = "--enable-opengl,--disable-opengl,virtual/libgl"
 PACKAGECONFIG[ogg]          = "--enable-ogg,--disable-ogg,libogg"
 PACKAGECONFIG[opus]         = "--enable-opus,--disable-opus,libopus"
 PACKAGECONFIG[pango]        = "--enable-pango,--disable-pango,pango"
 PACKAGECONFIG[theora]       = "--enable-theora,--disable-theora,libtheora"
 PACKAGECONFIG[visual]       = "--enable-libvisual,--disable-libvisual,libvisual"
 PACKAGECONFIG[vorbis]       = "--enable-vorbis,--disable-vorbis,libvorbis"
+PACKAGECONFIG[wayland]      = "--enable-wayland,--disable-wayland,wayland-native wayland wayland-protocols libdrm"
 PACKAGECONFIG[x11]          = "${X11ENABLEOPTS},${X11DISABLEOPTS},${X11DEPENDS}"
 
 EXTRA_OECONF += " \
     --enable-zlib \
+    --disable-cocoa \
 "
 
 CACHED_CONFIGUREVARS_append_x86 = " ac_cv_header_emmintrin_h=no ac_cv_header_xmmintrin_h=no"
@@ -46,5 +57,5 @@ CACHED_CONFIGUREVARS_append_x86 = " ac_cv_header_emmintrin_h=no ac_cv_header_xmm
 FILES_${MLPREFIX}libgsttag-1.0 += "${datadir}/gst-plugins-base/1.0/license-translations.dict"
 
 do_compile_prepend() {
-        export GIR_EXTRA_LIBS_PATH="${B}/gst-libs/gst/tag/.libs:${B}/gst-libs/gst/video/.libs:${B}/gst-libs/gst/audio/.libs:${B}/gst-libs/gst/rtp/.libs"
+        export GIR_EXTRA_LIBS_PATH="${B}/gst-libs/gst/tag/.libs:${B}/gst-libs/gst/video/.libs:${B}/gst-libs/gst/audio/.libs:${B}/gst-libs/gst/rtp/.libs:${B}/gst-libs/gst/allocators/.libs/"
 }
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
index 094bdac846..815fd77156 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
@@ -6,11 +6,15 @@ Subject: [PATCH 1/4] Makefile.am: don't hardcode libtool name when running
 
 Upstream-Status: Pending [review on oe-core maillist]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+Update patch context. Remove patch of gst-libs/gst/fft/Makefile.am that the
+rule has been removed. Add patch for gst-libs/gst/gl/Makefile.am at same time.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
  gst-libs/gst/allocators/Makefile.am | 2 +-
  gst-libs/gst/app/Makefile.am        | 2 +-
  gst-libs/gst/audio/Makefile.am      | 2 +-
- gst-libs/gst/fft/Makefile.am        | 2 +-
  gst-libs/gst/pbutils/Makefile.am    | 2 +-
  gst-libs/gst/riff/Makefile.am       | 2 +-
  gst-libs/gst/rtp/Makefile.am        | 2 +-
@@ -59,19 +63,6 @@ index 275d222..2374196 100644
  		--pkg gstreamer-@GST_API_VERSION@ \
  		--pkg gstreamer-base-@GST_API_VERSION@ \
  		--pkg-export gstreamer-audio-@GST_API_VERSION@ \
-diff --git a/gst-libs/gst/fft/Makefile.am b/gst-libs/gst/fft/Makefile.am
-index 09b3d68..f545354 100644
---- a/gst-libs/gst/fft/Makefile.am
-+++ b/gst-libs/gst/fft/Makefile.am
-@@ -65,7 +65,7 @@ GstFft-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstfft-@GST_API_VERSIO
- 		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
- 		--library=libgstfft-@GST_API_VERSION@.la \
- 		--include=Gst-@GST_API_VERSION@ \
--		--libtool="$(top_builddir)/libtool" \
-+		--libtool="$(LIBTOOL)" \
- 		--pkg gstreamer-@GST_API_VERSION@ \
- 		--pkg-export gstreamer-fft-@GST_API_VERSION@ \
- 		--output $@ \
 diff --git a/gst-libs/gst/pbutils/Makefile.am b/gst-libs/gst/pbutils/Makefile.am
 index 64d5eb0..91dc214 100644
 --- a/gst-libs/gst/pbutils/Makefile.am
@@ -163,6 +154,19 @@ index 5d31fa1..ac64eb3 100644
  		--pkg gstreamer-@GST_API_VERSION@ \
  		--pkg gstreamer-base-@GST_API_VERSION@ \
  		--pkg-export gstreamer-video-@GST_API_VERSION@ \
+diff --git a/gst-libs/gst/gl/Makefile.am b/gst-libs/gst/gl/Makefile.am
+index 7f2b8ae..ab6cc55 100644
+--- a/gst-libs/gst/gl/Makefile.am
++++ b/gst-libs/gst/gl/Makefile.am
+@@ -193,7 +193,7 @@ GstGL-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstgl-@GST_API_VERSION@
+ 		--include=Gst-@GST_API_VERSION@ \
+ 		--include=GstBase-@GST_API_VERSION@ \
+ 		--include=GstVideo-@GST_API_VERSION@ \
+-		--libtool="$(top_builddir)/libtool" \
++		--libtool="$(LIBTOOL)" \
+ 		--pkg gstreamer-@GST_API_VERSION@ \
+ 		--pkg gstreamer-base-@GST_API_VERSION@ \
+ 		--pkg gstreamer-video-@GST_API_VERSION@ \
 -- 
 2.6.2
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-gl-pick-up-GstVideo-1.0.gir-from-local-build-dir.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-gl-pick-up-GstVideo-1.0.gir-from-local-build-dir.patch
new file mode 100644
index 0000000000..c13115efb3
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-gl-pick-up-GstVideo-1.0.gir-from-local-build-dir.patch
@@ -0,0 +1,46 @@
+Upstream-Status: Backport
+
+Backport from gstreamer upstream: https://cgit.freedesktop.org/gstreamer/gst-plugins-base/commit/?h=1.14&id=9261296858cb149767ceac44fd6bd13cc0de0d21
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From df66d00876d035ab64c1e3b6a17e16b920fae2b9 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim-Philipp=20M=C3=BCller?= <tim@centricular.com>
+Date: Tue, 27 Mar 2018 10:43:16 +0100
+Subject: [PATCH] gl: pick up GstVideo-1.0.gir from local build dir
+
+https://bugzilla.gnome.org/show_bug.cgi?id=794708
+---
+ gst-libs/gst/gl/Makefile.am | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/gst-libs/gst/gl/Makefile.am b/gst-libs/gst/gl/Makefile.am
+index a3bbc94b0..2df038545 100644
+--- a/gst-libs/gst/gl/Makefile.am
++++ b/gst-libs/gst/gl/Makefile.am
+@@ -185,9 +185,10 @@ GstGL-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstgl-@GST_API_VERSION@
+ 		-I$(top_builddir)/gst-libs \
+ 		$(GST_PLUGINS_BASE_CFLAGS) \
+ 		$(GL_CFLAGS) \
++		--add-include-path="$(top_builddir)/gst-libs/gst/video/" \
+ 		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
+ 		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
+-		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-video-@GST_API_VERSION@` \
++		--library-path="$(top_builddir)/gst-libs/gst/video/" \
+ 		--library=libgstgl-@GST_API_VERSION@.la \
+ 		--include=Gst-@GST_API_VERSION@ \
+ 		--include=GstBase-@GST_API_VERSION@ \
+@@ -216,9 +217,9 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
+ 		$(INTROSPECTION_COMPILER) \
+ 		--includedir=$(srcdir) \
+ 		--includedir=$(builddir) \
++		--includedir="$(top_builddir)/gst-libs/gst/video/" \
+ 		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
+ 		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
+-		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-video-@GST_API_VERSION@` \
+ 		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
+ 
+ CLEANFILES = $(BUILT_GIRSOURCES) $(typelibs_DATA)
+-- 
+2.17.0
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch
similarity index 87%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch
index 2235a57afa..1d0e62a8fe 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch
@@ -15,11 +15,11 @@ Signed-off-by: Maxin B. John <maxin.john@intel.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pkgconfig/gstreamer-gl.pc.in b/pkgconfig/gstreamer-gl.pc.in
-index 8e7a303..d167be1 100644
+index dc672a97b..8c290bab5 100644
 --- a/pkgconfig/gstreamer-gl.pc.in
 +++ b/pkgconfig/gstreamer-gl.pc.in
 @@ -13,4 +13,4 @@ Version: @VERSION@
- Requires: gstreamer-base-@GST_API_VERSION@ gstreamer-@GST_API_VERSION@
+ Requires: gstreamer-video-@GST_API_VERSION@ gstreamer-base-@GST_API_VERSION@ gstreamer-@GST_API_VERSION@
  
  Libs: -L${libdir} -lgstgl-@GST_API_VERSION@
 -Cflags: -I${includedir} -I${libdir}/gstreamer-@GST_API_VERSION@/include @GL_CFLAGS@
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch
index 6616e2cf0d..1ef3de8433 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch
@@ -6,11 +6,15 @@ Subject: [PATCH 2/4] Makefile.am: prefix calls to pkg-config with
 
 Upstream-Status: Pending [review on oe-core maillist]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+Update context and remove patch for gst-libs/gst/fft/Makefile.am that the rule
+has been removed. And add patch for gst-libs/gst/gl/Makefile.am
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
  gst-libs/gst/allocators/Makefile.am |  4 ++--
  gst-libs/gst/app/Makefile.am        |  4 ++--
  gst-libs/gst/audio/Makefile.am      | 12 ++++++------
- gst-libs/gst/fft/Makefile.am        |  4 ++--
  gst-libs/gst/pbutils/Makefile.am    | 12 ++++++------
  gst-libs/gst/riff/Makefile.am       |  8 ++++----
  gst-libs/gst/rtp/Makefile.am        |  8 ++++----
@@ -89,28 +93,6 @@ Index: gst-plugins-base-1.12.3/gst-libs/gst/audio/Makefile.am
  		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
  
  CLEANFILES += $(BUILT_GIRSOURCES) $(typelibs_DATA)
-Index: gst-plugins-base-1.12.3/gst-libs/gst/fft/Makefile.am
-===================================================================
---- gst-plugins-base-1.12.3.orig/gst-libs/gst/fft/Makefile.am
-+++ gst-plugins-base-1.12.3/gst-libs/gst/fft/Makefile.am
-@@ -63,7 +63,7 @@ GstFft-@GST_API_VERSION@.gir: $(INTROSPE
- 		--c-include "gst/fft/fft.h" \
- 		-I$(top_srcdir)/gst-libs \
- 		-I$(top_builddir)/gst-libs \
--		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
- 		--library=libgstfft-@GST_API_VERSION@.la \
- 		--include=Gst-@GST_API_VERSION@ \
- 		--libtool="$(LIBTOOL)" \
-@@ -87,7 +87,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=
- 		$(INTROSPECTION_COMPILER) \
- 		--includedir=$(srcdir) \
- 		--includedir=$(builddir) \
--		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
- 		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
- 
- CLEANFILES = $(BUILT_GIRSOURCES) $(typelibs_DATA)
 Index: gst-plugins-base-1.12.3/gst-libs/gst/pbutils/Makefile.am
 ===================================================================
 --- gst-plugins-base-1.12.3.orig/gst-libs/gst/pbutils/Makefile.am
@@ -293,3 +275,29 @@ Index: gst-plugins-base-1.12.3/gst-libs/gst/video/Makefile.am
  		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
  
  CLEANFILES += $(BUILT_GIRSOURCES) $(typelibs_DATA)
+Index: gst-plugins-base-1.14.0/gst-libs/gst/gl/Makefile.am
+===================================================================
+--- a/gst-libs/gst/gl/Makefile.am
++++ b/gst-libs/gst/gl/Makefile.am
+@@ -186,8 +186,8 @@ GstGL-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstgl-@GST_API_VERSION@
+ 		$(GST_PLUGINS_BASE_CFLAGS) \
+ 		$(GL_CFLAGS) \
+ 		--add-include-path="$(top_builddir)/gst-libs/gst/video/" \
+-		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
+-		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
++		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
++		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
+ 		--library-path="$(top_builddir)/gst-libs/gst/video/" \
+ 		--library=libgstgl-@GST_API_VERSION@.la \
+ 		--include=Gst-@GST_API_VERSION@ \
+@@ -218,8 +218,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
+ 		--includedir=$(srcdir) \
+ 		--includedir=$(builddir) \
+ 		--includedir="$(top_builddir)/gst-libs/gst/video/" \
+-		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
+-		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
++		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
++		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
+ 		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
+ 
+ CLEANFILES = $(BUILT_GIRSOURCES) $(typelibs_DATA)
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-subparse-set-need_segment-after-sink-pad-received-GS.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-subparse-set-need_segment-after-sink-pad-received-GS.patch
index b924e38824..438f4ebbf2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-subparse-set-need_segment-after-sink-pad-received-GS.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-subparse-set-need_segment-after-sink-pad-received-GS.patch
@@ -20,7 +20,7 @@ new mode 100755
 index b565e93..7741ccc
 --- a/gst/subparse/gstsubparse.c
 +++ b/gst/subparse/gstsubparse.c
-@@ -266,22 +266,20 @@ gst_sub_parse_src_event (GstPad * pad, GstObject * parent, GstEvent * event)
+@@ -270,24 +270,20 @@ gst_sub_parse_src_event (GstPad * pad, GstObject * parent, GstEvent * event)
          goto beach;
        }
  
@@ -45,13 +45,15 @@ index b565e93..7741ccc
 -        GST_DEBUG_OBJECT (self, "segment after seek: %" GST_SEGMENT_FORMAT,
 -            &self->segment);
 -
--        self->need_segment = TRUE;
+-        /* will mark need_segment when receiving segment from upstream,
+-         * after FLUSH and all that has happened,
+-         * rather than racing with chain */
 -      } else {
 +      if (!ret) {
          GST_WARNING_OBJECT (self, "seek to 0 bytes failed");
        }
  
-@@ -1641,8 +1639,10 @@ gst_sub_parse_sink_event (GstPad * pad, GstObject * parent, GstEvent * event)
+@@ -1873,8 +1869,10 @@ gst_sub_parse_sink_event (GstPad * pad, GstObject * parent, GstEvent * event)
        gst_event_parse_segment (event, &s);
        if (s->format == GST_FORMAT_TIME)
          gst_event_copy_segment (event, &self->segment);
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0009-glimagesink-Downrank-to-marginal.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0009-glimagesink-Downrank-to-marginal.patch
similarity index 100%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0009-glimagesink-Downrank-to-marginal.patch
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0009-glimagesink-Downrank-to-marginal.patch
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/link-with-libvchostif.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/link-with-libvchostif.patch
similarity index 85%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/link-with-libvchostif.patch
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/link-with-libvchostif.patch
index c382b17586..965622f3c9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/link-with-libvchostif.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/link-with-libvchostif.patch
@@ -20,11 +20,17 @@ With this explicit link, plugins fail during runtime
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Upstream-Status: Pending
-Index: gst-plugins-bad-1.10.4/configure.ac
-===================================================================
---- gst-plugins-bad-1.10.4.orig/configure.ac
-+++ gst-plugins-bad-1.10.4/configure.ac
-@@ -785,7 +785,7 @@ case $host in
+
+
+Move patch from gstreamer1.0-plugins-bad and rebase for gstreamer1.0-plugins-base.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+diff --git a/m4/gst-gl.m4 b/m4/gst-gl.m4
+index 1e9724094..ab7774c5c 100644
+--- a/m4/gst-gl.m4
++++ b/m4/gst-gl.m4
+@@ -231,7 +231,7 @@ case $host in
                              HAVE_EGL=yes
                              HAVE_GLES2=yes
                              HAVE_EGL_RPI=yes
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/make-gio_unix_2_0-dependency-configurable.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/make-gio_unix_2_0-dependency-configurable.patch
index 413eff0695..f4599035df 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/make-gio_unix_2_0-dependency-configurable.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/make-gio_unix_2_0-dependency-configurable.patch
@@ -25,8 +25,8 @@ diff --git a/configure.ac b/configure.ac
 index 9c52aeb..26cacd6 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -752,9 +752,16 @@ AC_SUBST(FT2_CFLAGS)
- fi dnl of EXT plugins
+@@ -809,9 +809,16 @@ AM_CONDITIONAL(HAVE_PNG, test "x$HAVE_PNG" = "xyes")
+ AM_CONDITIONAL(HAVE_JPEG, test "x$HAVE_JPEG" = "xyes")
  
  dnl *** gio-unix-2.0 for tests/check/pipelines/tcp.c ***
 +AC_ARG_ENABLE([gio_unix_2_0],
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.12.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.0.bb
similarity index 64%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.12.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.0.bb
index dd895bbcb1..743355b509 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.12.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.0.bb
@@ -10,9 +10,15 @@ SRC_URI = " \
     file://0003-ssaparse-enhance-SSA-text-lines-parsing.patch \
     file://0004-subparse-set-need_segment-after-sink-pad-received-GS.patch \
     file://make-gio_unix_2_0-dependency-configurable.patch \
+    file://link-with-libvchostif.patch \
+    file://0009-glimagesink-Downrank-to-marginal.patch \
+    file://0001-gl-pick-up-GstVideo-1.0.gir-from-local-build-dir.patch \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
+    file://0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch \
 "
-SRC_URI[md5sum] = "b35b04071f69b8ab69a7f3a497ff0131"
-SRC_URI[sha256sum] = "4c306b03df0212f1b8903784e29bb3493319ba19ebebf13b0c56a17870292282"
+SRC_URI[md5sum] = "370271327dd23110421a9c2927ac989a"
+SRC_URI[sha256sum] = "7e904660ff56e02b036cf7fdfb77a50a540828ca9d2614d69ba931772e5b6940"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
+
+FILES_${PN}-dev += "${libdir}/gstreamer-1.0/include"
-- 
2.14.1



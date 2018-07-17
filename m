Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 099307888B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 09:44:50 +0000 (UTC)
Received: from localhost.localdomain (62-178-50-190.cable.dynamic.surfer.at
	[62.178.50.190]) by ptmx.org (Postfix) with ESMTPSA id 781BF10DB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 11:35:33 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2018 11:35:18 +0200
Message-Id: <20180717093523.5582-1-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/6] gstreamer1.0-plugin-base: Update packageconfigs
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
X-List-Received-Date: Tue, 17 Jul 2018 09:44:50 -0000

* Always enable zlib, since it is part of oe-core, and dependencies that
  are in oe-core can be always enabled
* The jpeg packageconfig is not needed, since there are no configuration
  switches to enable or disable it, and libjpeg-turbo is part of oe-core
* libpng is a dependency, and is part of oe-core, so add it to DEPENDS
* There is no libvisual recipe in oe-core or in meta-openembedded, so
  the visual packageconfig needs to go
* Reorder the packageconfigs alphabetically

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../gstreamer1.0-plugins-base_1.14.1.bb       | 26 +++++++++++--------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.1.bb
index 8d7d3c6192..52722ff615 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.1.bb
@@ -24,18 +24,21 @@ SRC_URI[sha256sum] = "1026c7c3082d825d9b5d034c1a6dd8a4ebab60eb3738b0a0afde4ad2dc
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
-DEPENDS += "iso-codes util-linux"
+DEPENDS += "iso-codes util-linux zlib libgudev libdrm jpeg libpng"
 
 inherit gettext
 
 PACKAGES_DYNAMIC =+ "^libgst.*"
 
+# opengl packageconfig factored out to make it easy for distros
+# and BSP layers to pick either (desktop) opengl, gles2, or no GL
 PACKAGECONFIG_GL ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gles2 egl', '', d)}"
+
 PACKAGECONFIG ??= " \
     ${GSTREAMER_ORC} \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa x11', d)} \
-    gio-unix-2.0 ogg pango theora vorbis zlib jpeg \
     ${PACKAGECONFIG_GL} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa x11', d)} \
+    gio-unix-2.0 ogg pango theora vorbis \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland egl', '', d)} \
 "
 
@@ -45,26 +48,27 @@ X11DISABLEOPTS = "--disable-x --disable-xvideo --disable-xshm"
 
 PACKAGECONFIG[alsa]         = "--enable-alsa,--disable-alsa,alsa-lib"
 PACKAGECONFIG[cdparanoia]   = "--enable-cdparanoia,--disable-cdparanoia,cdparanoia"
+PACKAGECONFIG[egl]          = "--enable-egl,--disable-egl,virtual/egl"
 PACKAGECONFIG[gio-unix-2.0] = "--enable-gio_unix_2_0,--disable-gio_unix_2_0,glib-2.0"
+PACKAGECONFIG[gles2]        = "--enable-gles2,--disable-gles2,virtual/libgles2"
 PACKAGECONFIG[ivorbis]      = "--enable-ivorbis,--disable-ivorbis,tremor"
 PACKAGECONFIG[ogg]          = "--enable-ogg,--disable-ogg,libogg"
+PACKAGECONFIG[opengl]       = "--enable-opengl,--disable-opengl,virtual/libgl libglu"
 PACKAGECONFIG[opus]         = "--enable-opus,--disable-opus,libopus"
 PACKAGECONFIG[pango]        = "--enable-pango,--disable-pango,pango"
 PACKAGECONFIG[theora]       = "--enable-theora,--disable-theora,libtheora"
-PACKAGECONFIG[visual]       = "--enable-libvisual,--disable-libvisual,libvisual"
 PACKAGECONFIG[vorbis]       = "--enable-vorbis,--disable-vorbis,libvorbis"
 PACKAGECONFIG[x11]          = "${X11ENABLEOPTS},${X11DISABLEOPTS},${X11DEPENDS}"
-PACKAGECONFIG[zlib]         = "--enable-zlib,--disable-zlib,zlib"
-PACKAGECONFIG[opengl]       = "--enable-opengl,--disable-opengl,virtual/libgl libglu"
-PACKAGECONFIG[gles2]        = "--enable-gles2,--disable-gles2,virtual/libgles2"
-PACKAGECONFIG[egl]          = "--enable-egl,--disable-egl,virtual/egl"
 PACKAGECONFIG[wayland]      = "--enable-wayland,--disable-wayland,wayland-native wayland wayland-protocols libdrm"
-PACKAGECONFIG[jpeg]         = ",,jpeg"
 
+EXTRA_OECONF += " \
+    --enable-zlib \
+    --disable-libvisual \
+"
+
+FILES_${PN}-dev += "${libdir}/gstreamer-${LIBV}/include/gst/gl/gstglconfig.h"
 FILES_${MLPREFIX}libgsttag-1.0 += "${datadir}/gst-plugins-base/1.0/license-translations.dict"
 
 do_compile_prepend() {
         export GIR_EXTRA_LIBS_PATH="${B}/gst-libs/gst/tag/.libs:${B}/gst-libs/gst/video/.libs:${B}/gst-libs/gst/audio/.libs:${B}/gst-libs/gst/rtp/.libs:${B}/gst-libs/gst/allocators/.libs"
 }
-
-FILES_${PN}-dev += "${libdir}/gstreamer-${LIBV}/include/gst/gl/gstglconfig.h"
-- 
2.17.1



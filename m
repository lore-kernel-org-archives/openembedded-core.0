Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B92676FF9D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 15:07:45 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 09 Mar 2016 07:06:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,311,1455004800"; d="scan'208";a="933083703"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 09 Mar 2016 07:06:29 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:02:00 +0200
Message-Id: <baa5b34ef3343a6f206bb45e4a0fefa1e8a7a740.1457535622.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 14/24] clutter: enable gobject introspection
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
X-List-Received-Date: Wed, 09 Mar 2016 15:07:46 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-graphics/clutter/clutter-1.0.inc     | 5 ++---
 meta/recipes-graphics/clutter/clutter-gst-3.0.inc | 4 +---
 meta/recipes-graphics/clutter/clutter-gtk-1.0.inc | 3 +--
 meta/recipes-graphics/cogl/cogl-1.0.inc           | 8 +++++---
 meta/recipes-graphics/mx/mx.inc                   | 5 ++---
 5 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-graphics/clutter/clutter-1.0.inc b/meta/recipes-graphics/clutter/clutter-1.0.inc
index 0ace1ce..c6ecd08 100644
--- a/meta/recipes-graphics/clutter/clutter-1.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-1.0.inc
@@ -2,7 +2,7 @@ SUMMARY = "Graphics library for creating hardware-accelerated user interfaces"
 HOMEPAGE = "http://www.clutter-project.org/"
 LICENSE = "LGPLv2.1+"
 
-inherit clutter ptest-gnome distro_features_check upstream-version-is-even
+inherit clutter ptest-gnome distro_features_check upstream-version-is-even gobject-introspection
 # depends on cogl-1.0 which needs opengl
 REQUIRED_DISTRO_FEATURES ?= "opengl"
 
@@ -19,8 +19,7 @@ EDEPENDS_EVDEV = "libxkbcommon"
 ERDEPENDS_EVDEV = "xkeyboard-config"
 
 # Disable pretty much everything, override in platform specific set up
-EXTRA_OECONF += "--disable-introspection	\
-	     	 --disable-quartz-backend	\
+EXTRA_OECONF += "--disable-quartz-backend	\
 	     	 --disable-win32-backend	\
 	     	 --disable-gdk-backend		\
 	     	 --disable-cex100-backend	\
diff --git a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
index 4f7b4a3..4c87798 100644
--- a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
@@ -2,7 +2,7 @@ SUMMARY = "GStreamer integration library for Clutter"
 HOMEPAGE = "http://www.clutter-project.org/"
 LICENSE = "LGPLv2+"
 
-inherit clutter distro_features_check upstream-version-is-even
+inherit clutter distro_features_check upstream-version-is-even gobject-introspection
 # depends on clutter-1.0 which depends on cogl-1.0
 REQUIRED_DISTRO_FEATURES ?= "opengl"
 
@@ -12,8 +12,6 @@ DEPENDS = "gstreamer1.0-plugins-base gstreamer1.0-plugins-bad clutter-1.0 libgud
 RDEPENDS_${PN} += "gstreamer1.0-meta-base"
 PACKAGES  =+ "${PN}-examples"
 
-EXTRA_OECONF += "--disable-introspection"
-
 FILES_${PN}          += "${libdir}/gstreamer-1.0/lib*.so"
 FILES_${PN}-dev      += "${libdir}/gstreamer-1.0/*.la"
 FILES_${PN}-examples  = "${bindir}/video-player ${bindir}/video-sink"
diff --git a/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc b/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc
index b07d3b9..05c4e5f 100644
--- a/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc
@@ -2,7 +2,7 @@ SUMMARY = "Library for embedding a Clutter canvas in a GTK+ application"
 HOMEPAGE = "http://www.clutter-project.org/"
 LICENSE = "LGPLv2+"
 
-inherit clutter distro_features_check upstream-version-is-even
+inherit clutter distro_features_check upstream-version-is-even gobject-introspection
 # depends on clutter-1.0 which depends on cogl-1.0
 REQUIRED_DISTRO_FEATURES ?= "opengl"
 # depends on gtk+3
@@ -12,5 +12,4 @@ DEPENDS = "clutter-1.0 gtk+3"
 PACKAGES  =+ "${PN}-examples"
 AUTOTOOLS_AUXDIR = "${S}/build"
 
-EXTRA_OECONF += "--disable-introspection"
 
diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graphics/cogl/cogl-1.0.inc
index b56bfec..fc7cffe 100644
--- a/meta/recipes-graphics/cogl/cogl-1.0.inc
+++ b/meta/recipes-graphics/cogl/cogl-1.0.inc
@@ -2,7 +2,7 @@ SUMMARY = "Modern 3D graphics API with associated utility APIs"
 HOMEPAGE = "http://wiki.clutter-project.org/wiki/Cogl"
 LICENSE = "MIT"
 
-inherit clutter distro_features_check upstream-version-is-even
+inherit clutter distro_features_check upstream-version-is-even gobject-introspection
 # cogl-1.0 needs opengl to build
 REQUIRED_DISTRO_FEATURES ?= "opengl"
 
@@ -26,8 +26,7 @@ ERDEPENDS_GL    = "libgl"
 ERDEPENDS_GLES2 = "libgles2"
 
 # GLESv1 is rarely tested, so disable it
-EXTRA_OECONF += "--disable-introspection	\
-	       	 --enable-examples-install	\
+EXTRA_OECONF += "--enable-examples-install	\
 	       	 --enable-debug		 	\
 	       	 --disable-gles1		\
 	         --disable-cairo                \
@@ -58,6 +57,9 @@ PACKAGECONFIG ??= "cogl-pango gles2 \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'glx egl-x11', '', d)} \
                    "
 
+do_compile_prepend() {
+        export GIR_EXTRA_LIBS_PATH="${B}/cogl/.libs"
+}
 
 FILES_${PN}-examples = "${bindir}/* ${datadir}/cogl/examples-data/*"
 FILES_libcogl = "${libdir}/libcogl${SOLIBS}"
diff --git a/meta/recipes-graphics/mx/mx.inc b/meta/recipes-graphics/mx/mx.inc
index aa4915d..4f10957 100644
--- a/meta/recipes-graphics/mx/mx.inc
+++ b/meta/recipes-graphics/mx/mx.inc
@@ -1,7 +1,7 @@
 SUMMARY = "Clutter based UI widget library"
 LICENSE = "LGPLv2.1"
 
-inherit clutter autotools-brokensep distro_features_check
+inherit clutter autotools-brokensep distro_features_check gobject-introspection
 # depends on clutter-1.0 which depends on cogl-1.0
 REQUIRED_DISTRO_FEATURES = "opengl"
 
@@ -9,8 +9,7 @@ DEPENDS = "clutter-1.0 dbus-glib gdk-pixbuf"
 
 SRC_URI = "http://source.clutter-project.org/sources/mx/${@get_verdir("${PV}")}/mx-${PV}.tar.xz"
 
-EXTRA_OECONF = "--disable-introspection		\
-	        --disable-gtk-doc		\
+EXTRA_OECONF = "--disable-gtk-doc		\
 	        --disable-gtk-widgets		\
 		--with-dbus			\
 		--with-winsys=none		\
-- 
2.7.0



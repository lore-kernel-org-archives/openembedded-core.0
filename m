Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BD5A66E630
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 14:29:13 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Nov 2015 06:29:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,347,1444719600"; d="scan'208";a="829574758"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 26 Nov 2015 06:29:14 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Nov 2015 16:26:20 +0200
Message-Id: <792e5be46d05f197d2cd0e581ed4fb42c740741c.1448547850.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
References: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
References: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 17/29] clutter: enable gobject introspection
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
X-List-Received-Date: Thu, 26 Nov 2015 14:29:13 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-graphics/clutter/clutter-1.0.inc     | 5 ++---
 meta/recipes-graphics/clutter/clutter-gst-3.0.inc | 4 +---
 meta/recipes-graphics/clutter/clutter-gtk-1.0.inc | 3 +--
 meta/recipes-graphics/cogl/cogl-1.0.inc           | 8 +++++---
 meta/recipes-graphics/mx/mx.inc                   | 5 ++---
 5 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-graphics/clutter/clutter-1.0.inc b/meta/recipes-graphics/clutter/clutter-1.0.inc
index 5d0f55c..fa5972d 100644
--- a/meta/recipes-graphics/clutter/clutter-1.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-1.0.inc
@@ -2,7 +2,7 @@ SUMMARY = "Graphics library for creating hardware-accelerated user interfaces"
 HOMEPAGE = "http://www.clutter-project.org/"
 LICENSE = "LGPLv2.1+"
 
-inherit clutter ptest-gnome distro_features_check
+inherit clutter ptest-gnome distro_features_check gobject-introspection
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
index 67c7590..17d7907 100644
--- a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
@@ -2,7 +2,7 @@ SUMMARY = "GStreamer integration library for Clutter"
 HOMEPAGE = "http://www.clutter-project.org/"
 LICENSE = "LGPLv2+"
 
-inherit clutter distro_features_check
+inherit clutter distro_features_check gobject-introspection
 # depends on clutter-1.0 which depends on cogl-1.0
 REQUIRED_DISTRO_FEATURES ?= "opengl"
 
@@ -12,8 +12,6 @@ DEPENDS = "gstreamer1.0-plugins-base gstreamer1.0-plugins-bad clutter-1.0"
 RDEPENDS_${PN} += "gstreamer1.0-meta-base"
 PACKAGES  =+ "${PN}-examples"
 
-EXTRA_OECONF += "--disable-introspection"
-
 FILES_${PN}          += "${libdir}/gstreamer-1.0/lib*.so"
 FILES_${PN}-dev      += "${libdir}/gstreamer-1.0/*.la"
 FILES_${PN}-dbg      += "${libdir}/gstreamer-1.0/.debug/lib*.so"
diff --git a/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc b/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc
index 688eed2..6d56592 100644
--- a/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc
@@ -2,7 +2,7 @@ SUMMARY = "Library for embedding a Clutter canvas in a GTK+ application"
 HOMEPAGE = "http://www.clutter-project.org/"
 LICENSE = "LGPLv2+"
 
-inherit clutter distro_features_check
+inherit clutter distro_features_check gobject-introspection
 # depends on clutter-1.0 which depends on cogl-1.0
 REQUIRED_DISTRO_FEATURES ?= "opengl"
 # depends on gtk+3
@@ -12,5 +12,4 @@ DEPENDS = "clutter-1.0 gtk+3"
 PACKAGES  =+ "${PN}-examples"
 AUTOTOOLS_AUXDIR = "${S}/build"
 
-EXTRA_OECONF += "--disable-introspection"
 
diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graphics/cogl/cogl-1.0.inc
index 88d84ea..e00a66f 100644
--- a/meta/recipes-graphics/cogl/cogl-1.0.inc
+++ b/meta/recipes-graphics/cogl/cogl-1.0.inc
@@ -2,7 +2,7 @@ SUMMARY = "Modern 3D graphics API with associated utility APIs"
 HOMEPAGE = "http://wiki.clutter-project.org/wiki/Cogl"
 LICENSE = "MIT"
 
-inherit clutter distro_features_check
+inherit clutter distro_features_check gobject-introspection
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
2.6.2



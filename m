Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 326B965CBC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 14:50:12 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 09 Nov 2015 06:50:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,266,1444719600"; d="scan'208";a="596917653"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Nov 2015 06:50:11 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Nov 2015 16:50:40 +0200
Message-Id: <e90cd8b8f23ee228bf146d09ce8fae919bbe7501.1447080392.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 18/29] clutter: enable gobject introspection
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
X-List-Received-Date: Mon, 09 Nov 2015 14:50:12 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-graphics/clutter/clutter-1.0.inc     | 5 ++---
 meta/recipes-graphics/clutter/clutter-gst-3.0.inc | 4 +---
 meta/recipes-graphics/clutter/clutter-gtk-1.0.inc | 3 +--
 meta/recipes-graphics/cogl/cogl-1.0.inc           | 8 +++++---
 meta/recipes-graphics/mx/mx.inc                   | 5 ++---
 5 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-graphics/clutter/clutter-1.0.inc b/meta/recipes-graphics/clutter/clutter-1.0.inc
index da21cee..0f059f9 100644
--- a/meta/recipes-graphics/clutter/clutter-1.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-1.0.inc
@@ -2,7 +2,7 @@ SUMMARY = "Graphics library for creating hardware-accelerated user interfaces"
 HOMEPAGE = "http://www.clutter-project.org/"
 LICENSE = "LGPLv2.1+"
 
-inherit clutter ptest-gnome
+inherit clutter ptest-gnome gobject-introspection
 
 DEPENDS = "pango glib-2.0 json-glib atk udev cogl-1.0"
 PACKAGE_BEFORE_PN += "${PN}-examples"
@@ -17,8 +17,7 @@ EDEPENDS_EVDEV = "libxkbcommon"
 ERDEPENDS_EVDEV = "xkeyboard-config"
 
 # Disable pretty much everything, override in platform specific set up
-EXTRA_OECONF += "--disable-introspection	\
-	     	 --disable-quartz-backend	\
+EXTRA_OECONF += "--disable-quartz-backend	\
 	     	 --disable-win32-backend	\
 	     	 --disable-gdk-backend		\
 	     	 --disable-cex100-backend	\
diff --git a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
index d4fed71..b184e0f 100644
--- a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
@@ -2,7 +2,7 @@ SUMMARY = "GStreamer integration library for Clutter"
 HOMEPAGE = "http://www.clutter-project.org/"
 LICENSE = "LGPLv2+"
 
-inherit clutter
+inherit clutter gobject-introspection
 
 SRC_URI += "file://0001-Install-example-binary-needed-for-core-image-clutter.patch"
 
@@ -10,8 +10,6 @@ DEPENDS = "gstreamer1.0-plugins-base gstreamer1.0-plugins-bad clutter-1.0"
 RDEPENDS_${PN} += "gstreamer1.0-meta-base"
 PACKAGES  =+ "${PN}-examples"
 
-EXTRA_OECONF += "--disable-introspection"
-
 FILES_${PN}          += "${libdir}/gstreamer-1.0/lib*.so"
 FILES_${PN}-dev      += "${libdir}/gstreamer-1.0/*.la"
 FILES_${PN}-dbg      += "${libdir}/gstreamer-1.0/.debug/lib*.so"
diff --git a/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc b/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc
index 45898b4..f411cfe 100644
--- a/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc
@@ -2,11 +2,10 @@ SUMMARY = "Library for embedding a Clutter canvas in a GTK+ application"
 HOMEPAGE = "http://www.clutter-project.org/"
 LICENSE = "LGPLv2+"
 
-inherit clutter
+inherit clutter gobject-introspection
 
 DEPENDS = "clutter-1.0 gtk+3"
 PACKAGES  =+ "${PN}-examples"
 AUTOTOOLS_AUXDIR = "${S}/build"
 
-EXTRA_OECONF += "--disable-introspection"
 
diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graphics/cogl/cogl-1.0.inc
index 3da31c8..11425f9 100644
--- a/meta/recipes-graphics/cogl/cogl-1.0.inc
+++ b/meta/recipes-graphics/cogl/cogl-1.0.inc
@@ -2,7 +2,7 @@ SUMMARY = "Modern 3D graphics API with associated utility APIs"
 HOMEPAGE = "http://wiki.clutter-project.org/wiki/Cogl"
 LICENSE = "MIT"
 
-inherit clutter
+inherit clutter gobject-introspection
 
 DEPENDS = "glib-2.0 gdk-pixbuf"
 PACKAGES =+ "${PN}-examples \
@@ -24,8 +24,7 @@ ERDEPENDS_GL    = "libgl"
 ERDEPENDS_GLES2 = "libgles2"
 
 # GLESv1 is rarely tested, so disable it
-EXTRA_OECONF += "--disable-introspection	\
-	       	 --enable-examples-install	\
+EXTRA_OECONF += "--enable-examples-install	\
 	       	 --enable-debug		 	\
 	       	 --disable-gles1		\
 	         --disable-cairo                \
@@ -56,6 +55,9 @@ PACKAGECONFIG ??= "cogl-pango gles2 \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'glx egl-x11', '', d)} \
                    "
 
+do_compile_prepend() {
+        export GIR_EXTRA_LIBS_PATH="${B}/cogl/.libs"
+}
 
 FILES_${PN}-examples = "${bindir}/* ${datadir}/cogl/examples-data/*"
 FILES_libcogl = "${libdir}/libcogl${SOLIBS}"
diff --git a/meta/recipes-graphics/mx/mx.inc b/meta/recipes-graphics/mx/mx.inc
index ee7f186..024c4cf 100644
--- a/meta/recipes-graphics/mx/mx.inc
+++ b/meta/recipes-graphics/mx/mx.inc
@@ -1,14 +1,13 @@
 SUMMARY = "Clutter based UI widget library"
 LICENSE = "LGPLv2.1"
 
-inherit clutter autotools-brokensep
+inherit clutter autotools-brokensep gobject-introspection
 
 DEPENDS = "clutter-1.0 dbus-glib gdk-pixbuf"
 
 SRC_URI = "http://source.clutter-project.org/sources/mx/${@get_verdir("${PV}")}/mx-${PV}.tar.xz"
 
-EXTRA_OECONF = "--disable-introspection		\
-	        --disable-gtk-doc		\
+EXTRA_OECONF = "--disable-gtk-doc		\
 	        --disable-gtk-widgets		\
 		--with-dbus			\
 		--with-winsys=none		\
-- 
2.1.4



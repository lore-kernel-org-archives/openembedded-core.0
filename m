Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CCFA972CFD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 13:58:23 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 18 May 2015 06:58:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,453,1427785200"; d="scan'208";a="495065441"
Received: from linux-8hqz.fi.intel.com (HELO linux-8hqz.site.fi.intel.com)
	([10.237.68.142])
	by FMSMGA003.fm.intel.com with ESMTP; 18 May 2015 06:58:24 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 May 2015 16:58:36 +0300
Message-Id: <1431957520-14510-3-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1431957520-14510-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1431957520-14510-1-git-send-email-alexander.kanavin@linux.intel.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 2/6] clutter-gst: update to latest upstream version 3.0.4
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
X-List-Received-Date: Mon, 18 May 2015 13:58:24 -0000

From: Alexander Kanavin <alex.kanavin@gmail.com>

This also makes it GStreamer 1.0 compatible

https://bugzilla.yoctoproject.org/show_bug.cgi?id=6294

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../clutter/clutter-gst-1.0-1.6.0/cogl-1.14.patch  | 48 ----------------------
 .../clutter-gst-1.0-1.6.0/enable-tests.patch       | 23 -----------
 meta/recipes-graphics/clutter/clutter-gst-1.0.inc  | 18 --------
 .../clutter/clutter-gst-1.0_1.6.0.bb               |  9 ----
 ...mple-binary-needed-for-core-image-clutter.patch | 33 +++++++++++++++
 .../clutter-gst-3.0-3.0.4/enable-tests.patch       | 23 +++++++++++
 meta/recipes-graphics/clutter/clutter-gst-3.0.inc  | 18 ++++++++
 .../clutter/clutter-gst-3.0_3.0.4.bb               |  7 ++++
 .../packagegroups/packagegroup-core-clutter.bb     |  2 +-
 9 files changed, 82 insertions(+), 99 deletions(-)
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gst-1.0-1.6.0/cogl-1.14.patch
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gst-1.0-1.6.0/enable-tests.patch
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gst-1.0.inc
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gst-1.0_1.6.0.bb
 create mode 100644 meta/recipes-graphics/clutter/clutter-gst-3.0-3.0.4/0001-Install-example-binary-needed-for-core-image-clutter.patch
 create mode 100644 meta/recipes-graphics/clutter/clutter-gst-3.0-3.0.4/enable-tests.patch
 create mode 100644 meta/recipes-graphics/clutter/clutter-gst-3.0.inc
 create mode 100644 meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.4.bb

diff --git a/meta/recipes-graphics/clutter/clutter-gst-1.0-1.6.0/cogl-1.14.patch b/meta/recipes-graphics/clutter/clutter-gst-1.0-1.6.0/cogl-1.14.patch
deleted file mode 100644
index d009e44..0000000
--- a/meta/recipes-graphics/clutter/clutter-gst-1.0-1.6.0/cogl-1.14.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 1ae4c3e7b1e2c33892590f9ac7bf0e892a5bcbd5 Mon Sep 17 00:00:00 2001
-From: Tomas Frydrych <tomas@sleepfive.com>
-Date: Thu, 11 Oct 2012 08:53:03 +0100
-Subject: [PATCH] ClutterGstVideoSink: fix includes so we can build against
- cogl-1.14
-
-Cogl 1.14 exposes various GL types through the public API but it does not
-pull in the GL type definitions through its public headers; specifically
-compilation will fail due to undefined GL_TEXTURE_2D. So include the headers
-the hard way.
-
-Upstream-Status: Submitted @ https://bugzilla.gnome.org/show_bug.cgi?id=700509
-Signed-off-by: Tomas Frydrych <tomas@sleepfive.com>
----
- clutter-gst/clutter-gst-video-sink.c |   17 +++++++++++++++++
- 1 file changed, 17 insertions(+)
-
-diff --git a/clutter-gst/clutter-gst-video-sink.c b/clutter-gst/clutter-gst-video-sink.c
-index 9b4b53c..f092581 100644
---- a/clutter-gst/clutter-gst-video-sink.c
-+++ b/clutter-gst/clutter-gst-video-sink.c
-@@ -42,6 +42,23 @@
- #include "config.h"
- #endif
-
-+/*
-+ * cogl-1.14 exposes generic GL types in the API, but not the actual includes.
-+ */
-+#include <cogl/cogl.h>
-+
-+#ifdef COGL_HAS_GLES1
-+#include <GLES/gl.h>
-+#include <GLES/glext.h>
-+#elif COGL_HAS_GLES2
-+#include <GLES2/gl2.h>
-+#include <GLES2/gl2ext.h>
-+#elif COGL_HAS_GL
-+#include <GL/gl.h>
-+#else
-+#error Unknown cogl configuration
-+#endif
-+
- #include "clutter-gst-video-sink.h"
- #include "clutter-gst-util.h"
- #include "clutter-gst-private.h"
---
-1.7.10.4
-
diff --git a/meta/recipes-graphics/clutter/clutter-gst-1.0-1.6.0/enable-tests.patch b/meta/recipes-graphics/clutter/clutter-gst-1.0-1.6.0/enable-tests.patch
deleted file mode 100644
index b3aec39..0000000
--- a/meta/recipes-graphics/clutter/clutter-gst-1.0-1.6.0/enable-tests.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Install example binary needed for core-image-clutter
-
-Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
-
-Upstream-Status: Inappropriate [configuration]
-
-Imported from clutter-gst-1.8 package, git://git.openembedded.org/openembedded,
-commit ae28ee3f7a060b9e0d13154a84f2444a98490b5b, updated for clutter-gst 1.6
-
-Signed-off-by: Tomas Frydrych <tomas@sleepfive.com>
-
-Index: git/examples/Makefile.am
-===================================================================
---- git.orig/examples/Makefile.am	2011-01-31 10:14:23.000000000 +0800
-+++ git/examples/Makefile.am	2011-01-31 10:14:34.000000000 +0800
-@@ -1,6 +1,6 @@
- NULL = #
- 
--noinst_PROGRAMS = video-player video-sink video-sink-navigation
-+bin_PROGRAMS = video-player video-sink video-sink-navigation
- 
- INCLUDES = -I$(top_srcdir) \
- 	   $(MAINTAINER_CFLAGS) \
diff --git a/meta/recipes-graphics/clutter/clutter-gst-1.0.inc b/meta/recipes-graphics/clutter/clutter-gst-1.0.inc
deleted file mode 100644
index bb05ede..0000000
--- a/meta/recipes-graphics/clutter/clutter-gst-1.0.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "GStreamer integration library for Clutter"
-HOMEPAGE = "http://www.clutter-project.org/"
-LICENSE = "LGPLv2+"
-
-inherit clutter
-
-SRC_URI += "file://enable-tests.patch"
-
-DEPENDS = "gst-plugins-base gst-plugins-bad clutter-1.0"
-RDEPENDS_${PN} += "gst-meta-base"
-PACKAGES  =+ "${PN}-examples"
-
-EXTRA_OECONF += "--disable-introspection"
-
-FILES_${PN}          += "${libdir}/gstreamer-0.10/lib*.so"
-FILES_${PN}-dev      += "${libdir}/gstreamer-0.10/*.la"
-FILES_${PN}-dbg      += "${libdir}/gstreamer-0.10/.debug/lib*.so"
-FILES_${PN}-examples  = "${bindir}/video-player ${bindir}/video-sink"
diff --git a/meta/recipes-graphics/clutter/clutter-gst-1.0_1.6.0.bb b/meta/recipes-graphics/clutter/clutter-gst-1.0_1.6.0.bb
deleted file mode 100644
index dc5cc13..0000000
--- a/meta/recipes-graphics/clutter/clutter-gst-1.0_1.6.0.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require clutter-gst-1.0.inc
-
-SRC_URI += "file://cogl-1.14.patch"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
-                    file://clutter-gst/clutter-gst.h;beginline=1;endline=24;md5=95baacba194e814c110ea3bdf25ddbf4"
-
-SRC_URI[archive.md5sum] = "d60ab0118730cecd5dd9988ad7da034b"
-SRC_URI[archive.sha256sum] = "abc879cdd562f1640a825131405f4327a427bfe65b805ebc25d0c78909c8c622"
diff --git a/meta/recipes-graphics/clutter/clutter-gst-3.0-3.0.4/0001-Install-example-binary-needed-for-core-image-clutter.patch b/meta/recipes-graphics/clutter/clutter-gst-3.0-3.0.4/0001-Install-example-binary-needed-for-core-image-clutter.patch
new file mode 100644
index 0000000..0b26b99
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter-gst-3.0-3.0.4/0001-Install-example-binary-needed-for-core-image-clutter.patch
@@ -0,0 +1,33 @@
+From d77c711277bf075ce0545c19b322f040c49c778a Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 30 Apr 2015 12:19:13 +0300
+Subject: [PATCH] Install example binary needed for core-image-clutter
+
+Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
+
+Upstream-Status: Inappropriate [configuration]
+
+Imported from clutter-gst-1.8 package, git://git.openembedded.org/openembedded,
+commit ae28ee3f7a060b9e0d13154a84f2444a98490b5b, updated for clutter-gst 3.0
+
+Signed-off-by: Tomas Frydrych <tomas@sleepfive.com>
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ examples/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/examples/Makefile.am b/examples/Makefile.am
+index bfbc1b5..09655e3 100644
+--- a/examples/Makefile.am
++++ b/examples/Makefile.am
+@@ -1,6 +1,6 @@
+ NULL = #
+ 
+-noinst_PROGRAMS = camera-player video-player video-sink video-sink-navigation video-content
++bin_PROGRAMS = camera-player video-player video-sink video-sink-navigation video-content
+ 
+ AM_CPPFLAGS = -I$(top_srcdir) \
+ 		$(MAINTAINER_CFLAGS) \
+-- 
+2.1.4
+
diff --git a/meta/recipes-graphics/clutter/clutter-gst-3.0-3.0.4/enable-tests.patch b/meta/recipes-graphics/clutter/clutter-gst-3.0-3.0.4/enable-tests.patch
new file mode 100644
index 0000000..b3aec39
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter-gst-3.0-3.0.4/enable-tests.patch
@@ -0,0 +1,23 @@
+Install example binary needed for core-image-clutter
+
+Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
+
+Upstream-Status: Inappropriate [configuration]
+
+Imported from clutter-gst-1.8 package, git://git.openembedded.org/openembedded,
+commit ae28ee3f7a060b9e0d13154a84f2444a98490b5b, updated for clutter-gst 1.6
+
+Signed-off-by: Tomas Frydrych <tomas@sleepfive.com>
+
+Index: git/examples/Makefile.am
+===================================================================
+--- git.orig/examples/Makefile.am	2011-01-31 10:14:23.000000000 +0800
++++ git/examples/Makefile.am	2011-01-31 10:14:34.000000000 +0800
+@@ -1,6 +1,6 @@
+ NULL = #
+ 
+-noinst_PROGRAMS = video-player video-sink video-sink-navigation
++bin_PROGRAMS = video-player video-sink video-sink-navigation
+ 
+ INCLUDES = -I$(top_srcdir) \
+ 	   $(MAINTAINER_CFLAGS) \
diff --git a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
new file mode 100644
index 0000000..d4fed71
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
@@ -0,0 +1,18 @@
+SUMMARY = "GStreamer integration library for Clutter"
+HOMEPAGE = "http://www.clutter-project.org/"
+LICENSE = "LGPLv2+"
+
+inherit clutter
+
+SRC_URI += "file://0001-Install-example-binary-needed-for-core-image-clutter.patch"
+
+DEPENDS = "gstreamer1.0-plugins-base gstreamer1.0-plugins-bad clutter-1.0"
+RDEPENDS_${PN} += "gstreamer1.0-meta-base"
+PACKAGES  =+ "${PN}-examples"
+
+EXTRA_OECONF += "--disable-introspection"
+
+FILES_${PN}          += "${libdir}/gstreamer-1.0/lib*.so"
+FILES_${PN}-dev      += "${libdir}/gstreamer-1.0/*.la"
+FILES_${PN}-dbg      += "${libdir}/gstreamer-1.0/.debug/lib*.so"
+FILES_${PN}-examples  = "${bindir}/video-player ${bindir}/video-sink"
diff --git a/meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.4.bb b/meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.4.bb
new file mode 100644
index 0000000..dbc66e1
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.4.bb
@@ -0,0 +1,7 @@
+require clutter-gst-3.0.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
+                    file://clutter-gst/clutter-gst.h;beginline=1;endline=24;md5=95baacba194e814c110ea3bdf25ddbf4"
+
+SRC_URI[archive.md5sum] = "0b4283e6ccf5ee5d9f5fb635230fc714"
+SRC_URI[archive.sha256sum] = "c61011732428c74923a52cc7629903bd910ecad22634d58f7b0c1dc55235162a"
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
index 7540821..9d67e5f 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
@@ -16,6 +16,6 @@ PACKAGES = "\
 SUMMARY_${PN}-core = "Clutter graphics library"
 RDEPENDS_${PN}-core = "\
     clutter-1.0 \
-    clutter-gst-1.0 \
+    clutter-gst-3.0 \
     clutter-gtk-1.0 \
     "
-- 
2.1.4



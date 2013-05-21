Return-Path: <tf+lists.yocto@r-finger.com>
Received: from r-finger.com (r-finger.com [178.79.160.5])
	by mail.openembedded.org (Postfix) with ESMTP id 36DB061A80
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 11:04:24 +0000 (UTC)
Received: from i7-990x.r-finger.com
	(host86-137-102-112.range86-137.btcentralplus.com [86.137.102.112])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 00236952D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 12:04:24 +0100 (BST)
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2013 12:04:16 +0100
Message-Id: <1369134259-12091-6-git-send-email-tf+lists.yocto@r-finger.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1369134259-12091-1-git-send-email-tf+lists.yocto@r-finger.com>
References: <1368789942-7476-1-git-send-email-tf+lists.yocto@r-finger.com>
	<1369134259-12091-1-git-send-email-tf+lists.yocto@r-finger.com>
Subject: [PATCH v3 5/8] New clutter-gst recipe (1.6.0)
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
X-List-Received-Date: Tue, 21 May 2013 11:04:24 -0000

From: Tomas Frydrych <tomas@sleepfive.com>


Signed-off-by: Tomas Frydrych <tomas@sleepfive.com>
---
 meta/recipes-graphics/clutter/clutter-gst-1.0.inc  |   19 ++++++++
 .../clutter/clutter-gst-1.0_1.6.0.bb               |    9 ++++
 .../clutter/clutter-gst-1.6/cogl-1.14.patch        |   48 ++++++++++++++++++++
 .../clutter/clutter-gst/enable-tests.patch         |   23 ++++++++++
 4 files changed, 99 insertions(+)
 create mode 100644 meta/recipes-graphics/clutter/clutter-gst-1.0.inc
 create mode 100644 meta/recipes-graphics/clutter/clutter-gst-1.0_1.6.0.bb
 create mode 100644 meta/recipes-graphics/clutter/clutter-gst-1.6/cogl-1.14.patch
 create mode 100644 meta/recipes-graphics/clutter/clutter-gst/enable-tests.patch

diff --git a/meta/recipes-graphics/clutter/clutter-gst-1.0.inc b/meta/recipes-graphics/clutter/clutter-gst-1.0.inc
new file mode 100644
index 0000000..eebfd09
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter-gst-1.0.inc
@@ -0,0 +1,19 @@
+DESCRIPTION = "Clutter GStreamer"
+HOMEPAGE = "http://www.clutter-project.org/"
+LICENSE = "LGPLv2+"
+
+inherit clutter
+
+SRC_URI += "file://enable-tests.patch"
+
+DEPENDS = "gst-plugins-base gst-plugins-bad clutter-1.0"
+RDEPENDS_${PN} += "gst-meta-base"
+PACKAGES  =+ "${PN}-examples"
+
+EXTRA_OECONF += "--disable-introspection"
+
+FILES_${PN}          += "${libdir}/gstreamer-0.10/lib*.so"
+FILES_${PN}-dev      += "${libdir}/gstreamer-0.10/*.la"
+FILES_${PN}-dbg      += "${libdir}/gstreamer-0.10/.debug/lib*.so"
+FILES_${PN}-examples  = "${bindir}/video-player ${bindir}/video-sink"
+
diff --git a/meta/recipes-graphics/clutter/clutter-gst-1.0_1.6.0.bb b/meta/recipes-graphics/clutter/clutter-gst-1.0_1.6.0.bb
new file mode 100644
index 0000000..dc5cc13
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter-gst-1.0_1.6.0.bb
@@ -0,0 +1,9 @@
+require clutter-gst-1.0.inc
+
+SRC_URI += "file://cogl-1.14.patch"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
+                    file://clutter-gst/clutter-gst.h;beginline=1;endline=24;md5=95baacba194e814c110ea3bdf25ddbf4"
+
+SRC_URI[archive.md5sum] = "d60ab0118730cecd5dd9988ad7da034b"
+SRC_URI[archive.sha256sum] = "abc879cdd562f1640a825131405f4327a427bfe65b805ebc25d0c78909c8c622"
diff --git a/meta/recipes-graphics/clutter/clutter-gst-1.6/cogl-1.14.patch b/meta/recipes-graphics/clutter/clutter-gst-1.6/cogl-1.14.patch
new file mode 100644
index 0000000..a46b448
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter-gst-1.6/cogl-1.14.patch
@@ -0,0 +1,48 @@
+From 1ae4c3e7b1e2c33892590f9ac7bf0e892a5bcbd5 Mon Sep 17 00:00:00 2001
+From: Tomas Frydrych <tomas@sleepfive.com>
+Date: Thu, 11 Oct 2012 08:53:03 +0100
+Subject: [PATCH] ClutterGstVideoSink: fix includes so we can build against
+ cogl-1.14
+
+Cogl 1.14 exposes various GL types through the public API but it does not
+pull in the GL type definitions through its public headers; specifically
+compilation will fail due to undefined GL_TEXTURE_2D. So include the headers
+the hard way.
+
+Upstream-status: Submitted @ https://bugzilla.gnome.org/show_bug.cgi?id=700509
+Signed-off-by: Tomas Frydrych <tomas@sleepfive.com>
+---
+ clutter-gst/clutter-gst-video-sink.c |   17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+
+diff --git a/clutter-gst/clutter-gst-video-sink.c b/clutter-gst/clutter-gst-video-sink.c
+index 9b4b53c..f092581 100644
+--- a/clutter-gst/clutter-gst-video-sink.c
++++ b/clutter-gst/clutter-gst-video-sink.c
+@@ -42,6 +42,23 @@
+ #include "config.h"
+ #endif
+
++/*
++ * cogl-1.14 exposes generic GL types in the API, but not the actual includes.
++ */
++#include <cogl/cogl.h>
++
++#ifdef COGL_HAS_GLES1
++#include <GLES/gl.h>
++#include <GLES/glext.h>
++#elif COGL_HAS_GLES2
++#include <GLES2/gl2.h>
++#include <GLES2/gl2ext.h>
++#elif COGL_HAS_GL
++#include <GL/gl.h>
++#else
++#error Unknown cogl configuration
++#endif
++
+ #include "clutter-gst-video-sink.h"
+ #include "clutter-gst-util.h"
+ #include "clutter-gst-private.h"
+--
+1.7.10.4
+
diff --git a/meta/recipes-graphics/clutter/clutter-gst/enable-tests.patch b/meta/recipes-graphics/clutter/clutter-gst/enable-tests.patch
new file mode 100644
index 0000000..b3aec39
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter-gst/enable-tests.patch
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
-- 
1.7.10.4



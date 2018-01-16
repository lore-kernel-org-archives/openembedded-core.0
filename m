Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 068FB78673
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jan 2018 14:57:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jan 2018 06:57:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,368,1511856000"; d="scan'208";a="10824098"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga008.fm.intel.com with ESMTP; 16 Jan 2018 06:57:35 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jan 2018 16:57:49 +0200
Message-Id: <20180116145749.2064-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
Subject: [PATCH] gstreamer: correctly set GST_PLUGIN_SCANNER_1_0
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
X-List-Received-Date: Tue, 16 Jan 2018 14:57:36 -0000

The order was wrong: GST_PLUGIN_SCANNER_1_0 was previously set before
GTKDOC_EXTRA_ENVIRONMENT and so was overriden by upstream setting it
from there. This changes the location of GST_PLUGIN_SCANNER_1_0 setting
to come after GTKDOC_EXTRA_ENVIRONMENT.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../gstreamer/files/gtk-doc-tweaks.patch           | 36 +++++++++++++++++-----
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/files/gtk-doc-tweaks.patch b/meta/recipes-multimedia/gstreamer/files/gtk-doc-tweaks.patch
index 593d5bb043b..d86c78d7934 100644
--- a/meta/recipes-multimedia/gstreamer/files/gtk-doc-tweaks.patch
+++ b/meta/recipes-multimedia/gstreamer/files/gtk-doc-tweaks.patch
@@ -1,3 +1,8 @@
+From 7018ca1c4bf26c8317e7fcd2e7e4e648195f42ca Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Wed, 20 Dec 2017 13:03:03 +0000
+Subject: [PATCH] gstreamer: use a patch instead of sed to fix gtk-doc
+
 Patch the gtk-doc makefiles so that the qemu wrapper is used to run transient
 binaries instead of libtool wrapper or running them directly.
 
@@ -7,19 +12,36 @@ issues during build on x86_64.
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
---- a/common/gtk-doc.mak.orig	2017-12-20 12:43:20.586474397 +0000
-+++ b/common/gtk-doc.mak	2017-12-20 12:45:20.758874995 +0000
-@@ -8,3 +8,3 @@
+---
+ common/gtk-doc.mak | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/common/gtk-doc.mak b/common/gtk-doc.mak
+index 3f83491..e5cb0d1 100644
+--- a/common/gtk-doc.mak
++++ b/common/gtk-doc.mak
+@@ -6,11 +6,11 @@
+ if GTK_DOC_USE_LIBTOOL
+ GTKDOC_CC = $(LIBTOOL) --tag=CC --mode=compile $(CC) $(INCLUDES) $(GTKDOC_DEPS_CFLAGS) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
  GTKDOC_LD = $(LIBTOOL) --tag=CC --mode=link $(CC) $(GTKDOC_DEPS_LIBS) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS)
 -GTKDOC_RUN = $(LIBTOOL) --mode=execute
 +GTKDOC_RUN = $(top_builddir)/gtkdoc-qemuwrapper
  else
-@@ -12,3 +12,3 @@
+ GTKDOC_CC = $(CC) $(INCLUDES) $(GTKDOC_DEPS_CFLAGS) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
  GTKDOC_LD = $(CC) $(GTKDOC_DEPS_LIBS) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS)
 -GTKDOC_RUN =
 +GTKDOC_RUN = $(top_builddir)/gtkdoc-qemuwrapper
  endif
-@@ -99,2 +99,3 @@
- 	    fi; \
+ 
+ # We set GPATH here; this gives us semantics for GNU make
+@@ -101,6 +101,7 @@ scan-build.stamp: $(HFILE_GLOB) $(CFILE_GLOB)
+ 	    GST_PLUGIN_PATH_1_0=					\
+ 	    GST_REGISTRY_1_0=doc-registry.xml				\
+ 	    $(GTKDOC_EXTRA_ENVIRONMENT)					\
 +	    GST_PLUGIN_SCANNER_1_0="$(top_builddir)/libs/gst/helpers/gst-plugin-scanner-dummy" \
- 	    GST_PLUGIN_SYSTEM_PATH_1_0=`cd $(top_builddir) && pwd`	\
+ 	    CC="$(GTKDOC_CC)" LD="$(GTKDOC_LD)" RUN="$(GTKDOC_RUN)"	\
+ 	    CFLAGS="$(GTKDOC_CFLAGS) $(CFLAGS)"				\
+ 	    LDFLAGS="$(GTKDOC_LIBS) $(LDFLAGS)"				\
+-- 
+2.15.1
+
-- 
2.15.1



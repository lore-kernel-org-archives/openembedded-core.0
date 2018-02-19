Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 271C57846C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 08:34:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Feb 2018 00:34:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,534,1511856000"; d="scan'208";a="19464538"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga006.jf.intel.com with ESMTP; 19 Feb 2018 00:34:57 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 6C4135802D1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 00:34:56 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Feb 2018 10:36:57 +0200
Message-Id: <1519029438-11092-7-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
References: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 06/27] gstreamer1.0-plugins-base: remove PKG_CONFIG_SYSROOT_DIR work-around
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
X-List-Received-Date: Mon, 19 Feb 2018 08:34:56 -0000

We are moving from freedesktop.org's pkg-config to pkgconf.
This enables us to remove the following patch as PKG_CONFIG_SYSROOT_DIR
behaves consistently with pkgconf:

1) 0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../gstreamer/gstreamer1.0-plugins-base.inc        |   1 -
 ...-prefix-calls-to-pkg-config-with-PKG_CONF.patch | 298 ---------------------
 2 files changed, 299 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
index 08130c1..0d0a83b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
@@ -2,7 +2,6 @@ require gstreamer1.0-plugins.inc
 
 SRC_URI_append = "\
     file://0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch \
-    file://0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch \
     file://0003-riff-add-missing-include-directories-when-calling-in.patch \
     file://0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch \
 "
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch
deleted file mode 100644
index 0a8bc9b..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch
+++ /dev/null
@@ -1,298 +0,0 @@
-From 990b653c7b6de1937ec759019982d6c5f15770f7 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 26 Oct 2015 16:38:18 +0200
-Subject: [PATCH 2/4] Makefile.am: prefix calls to pkg-config with
- PKG_CONFIG_SYSROOT_DIR
-
-Upstream-Status: Pending [review on oe-core maillist]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- gst-libs/gst/allocators/Makefile.am |  4 ++--
- gst-libs/gst/app/Makefile.am        |  4 ++--
- gst-libs/gst/audio/Makefile.am      | 12 ++++++------
- gst-libs/gst/fft/Makefile.am        |  4 ++--
- gst-libs/gst/pbutils/Makefile.am    | 12 ++++++------
- gst-libs/gst/riff/Makefile.am       |  8 ++++----
- gst-libs/gst/rtp/Makefile.am        |  8 ++++----
- gst-libs/gst/rtsp/Makefile.am       |  4 ++--
- gst-libs/gst/sdp/Makefile.am        |  4 ++--
- gst-libs/gst/tag/Makefile.am        |  8 ++++----
- gst-libs/gst/video/Makefile.am      |  8 ++++----
- 11 files changed, 38 insertions(+), 38 deletions(-)
-
-diff --git a/gst-libs/gst/allocators/Makefile.am b/gst-libs/gst/allocators/Makefile.am
-index bc7f53a..0ef5f86 100644
---- a/gst-libs/gst/allocators/Makefile.am
-+++ b/gst-libs/gst/allocators/Makefile.am
-@@ -35,7 +35,7 @@ GstAllocators-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstallocators-@
- 		--c-include "gst/allocators/allocators.h" \
- 		-I$(top_srcdir)/gst-libs \
- 		-I$(top_builddir)/gst-libs \
--		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
- 		--library=libgstallocators-@GST_API_VERSION@.la \
- 		--include=Gst-@GST_API_VERSION@ \
- 		--libtool="$(LIBTOOL)" \
-@@ -59,7 +59,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
- 		$(INTROSPECTION_COMPILER) \
- 		--includedir=$(srcdir) \
- 		--includedir=$(builddir) \
--		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
- 		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
- 
- CLEANFILES = $(BUILT_GIRSOURCES) $(typelibs_DATA)
-diff --git a/gst-libs/gst/app/Makefile.am b/gst-libs/gst/app/Makefile.am
-index dcc2fe0..dc076cb 100644
---- a/gst-libs/gst/app/Makefile.am
-+++ b/gst-libs/gst/app/Makefile.am
-@@ -48,8 +48,8 @@ GstApp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstapp-@GST_API_VERSIO
- 		--c-include "gst/app/app.h" \
- 		-I$(top_srcdir)/gst-libs \
- 		-I$(top_builddir)/gst-libs \
--		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
--		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
-+		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
- 		--library=libgstapp-@GST_API_VERSION@.la \
- 		--include=Gst-@GST_API_VERSION@ \
- 		--include=GstBase-@GST_API_VERSION@ \
-diff --git a/gst-libs/gst/audio/Makefile.am b/gst-libs/gst/audio/Makefile.am
-index 2374196..295eb42 100644
---- a/gst-libs/gst/audio/Makefile.am
-+++ b/gst-libs/gst/audio/Makefile.am
-@@ -106,12 +106,12 @@ GstAudio-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstaudio-@GST_API_VE
- 		-I$(top_srcdir)/gst-libs \
- 		-I$(top_builddir)/gst-libs \
- 		--c-include "gst/audio/audio.h" \
--		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
--		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
-+		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
- 		--add-include-path="$(top_builddir)/gst-libs/gst/tag/" \
- 		--library=libgstaudio-@GST_API_VERSION@.la \
--		--library-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=libdir gstreamer-@GST_API_VERSION@` \
--		--library-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=libdir gstreamer-base-@GST_API_VERSION@` \
-+		--library-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=libdir gstreamer-@GST_API_VERSION@` \
-+		--library-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=libdir gstreamer-base-@GST_API_VERSION@` \
- 		--library-path="$(top_builddir)/gst-libs/gst/tag/" \
- 		--include=Gst-@GST_API_VERSION@ \
- 		--include=GstBase-@GST_API_VERSION@ \
-@@ -140,8 +140,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
- 		--includedir=$(srcdir) \
- 		--includedir=$(builddir) \
- 		--includedir="$(top_builddir)/gst-libs/gst/tag/" \
--		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
--		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
-+		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
- 		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
- 
- CLEANFILES += $(BUILT_GIRSOURCES) $(typelibs_DATA)
-diff --git a/gst-libs/gst/fft/Makefile.am b/gst-libs/gst/fft/Makefile.am
-index f545354..1bb6243 100644
---- a/gst-libs/gst/fft/Makefile.am
-+++ b/gst-libs/gst/fft/Makefile.am
-@@ -62,7 +62,7 @@ GstFft-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstfft-@GST_API_VERSIO
- 		--c-include "gst/fft/fft.h" \
- 		-I$(top_srcdir)/gst-libs \
- 		-I$(top_builddir)/gst-libs \
--		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
- 		--library=libgstfft-@GST_API_VERSION@.la \
- 		--include=Gst-@GST_API_VERSION@ \
- 		--libtool="$(LIBTOOL)" \
-@@ -86,7 +86,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
- 		$(INTROSPECTION_COMPILER) \
- 		--includedir=$(srcdir) \
- 		--includedir=$(builddir) \
--		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
- 		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
- 
- CLEANFILES = $(BUILT_GIRSOURCES) $(typelibs_DATA)
-diff --git a/gst-libs/gst/pbutils/Makefile.am b/gst-libs/gst/pbutils/Makefile.am
-index 91dc214..dc8e1d3 100644
---- a/gst-libs/gst/pbutils/Makefile.am
-+++ b/gst-libs/gst/pbutils/Makefile.am
-@@ -84,14 +84,14 @@ GstPbutils-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstpbutils-@GST_AP
- 		--c-include "gst/pbutils/pbutils.h" \
- 		-I$(top_srcdir)/gst-libs \
- 		-I$(top_builddir)/gst-libs \
--		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
--		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
-+		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
- 		--add-include-path="$(top_builddir)/gst-libs/gst/tag/" \
- 		--add-include-path="$(top_builddir)/gst-libs/gst/video/" \
- 		--add-include-path="$(top_builddir)/gst-libs/gst/audio/" \
- 		--library=libgstpbutils-@GST_API_VERSION@.la \
--		--library-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=libdir gstreamer-@GST_API_VERSION@` \
--		--library-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=libdir gstreamer-base-@GST_API_VERSION@` \
-+		--library-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=libdir gstreamer-@GST_API_VERSION@` \
-+		--library-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=libdir gstreamer-base-@GST_API_VERSION@` \
- 		--library-path="$(top_builddir)/gst-libs/gst/tag/" \
- 		--library-path="$(top_builddir)/gst-libs/gst/video/" \
- 		--library-path="$(top_builddir)/gst-libs/gst/audio/" \
-@@ -124,8 +124,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
- 		$(INTROSPECTION_COMPILER) \
- 		--includedir=$(srcdir) \
- 		--includedir=$(builddir) \
--		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
--		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
-+		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
- 		--includedir="$(top_builddir)/gst-libs/gst/tag/" \
- 		--includedir="$(top_builddir)/gst-libs/gst/video/" \
- 		--includedir="$(top_builddir)/gst-libs/gst/audio/" \
-diff --git a/gst-libs/gst/riff/Makefile.am b/gst-libs/gst/riff/Makefile.am
-index 3bd8fc0..0a115cc 100644
---- a/gst-libs/gst/riff/Makefile.am
-+++ b/gst-libs/gst/riff/Makefile.am
-@@ -41,8 +41,8 @@ libgstriff_@GST_API_VERSION@_la_LDFLAGS = $(GST_LIB_LDFLAGS) $(GST_ALL_LDFLAGS)
- #		--c-include "gst/riff/riff.h" \
- #		--add-include-path=$(builddir)/../tag \
- #		--add-include-path=$(builddir)/../audio \
--#		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
--#		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
-+#		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+#		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
- #		--library=libgstriff-@GST_API_VERSION@.la \
- #		--include=GstAudio-@GST_API_VERSION@ \
- #		--include=GstTag-@GST_API_VERSION@ \
-@@ -73,8 +73,8 @@ libgstriff_@GST_API_VERSION@_la_LDFLAGS = $(GST_LIB_LDFLAGS) $(GST_ALL_LDFLAGS)
- #		--includedir=$(builddir) \
- #		--includedir=$(builddir)/../tag \
- #		--includedir=$(builddir)/../audio \
--#		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
--#		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
-+#		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+#		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
- #		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
- #
- #CLEANFILES = $(BUILT_GIRSOURCES) $(typelibs_DATA)
-diff --git a/gst-libs/gst/rtp/Makefile.am b/gst-libs/gst/rtp/Makefile.am
-index f5445c1..527c0b4 100644
---- a/gst-libs/gst/rtp/Makefile.am
-+++ b/gst-libs/gst/rtp/Makefile.am
-@@ -60,8 +60,8 @@ GstRtp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstrtp-@GST_API_VERSIO
- 		--c-include "gst/rtp/rtp.h" \
- 		-I$(top_builddir)/gst-libs \
- 		-I$(top_srcdir)/gst-libs \
--		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
--		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
-+		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
- 		--library=libgstrtp-@GST_API_VERSION@.la \
- 		--include=Gst-@GST_API_VERSION@ \
- 		--include=GstBase-@GST_API_VERSION@ \
-@@ -88,8 +88,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
- 		$(INTROSPECTION_COMPILER) \
- 		--includedir=$(srcdir) \
- 		--includedir=$(builddir) \
--		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
--		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
-+		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
- 		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
- 
- CLEANFILES += $(BUILT_GIRSOURCES) $(typelibs_DATA)
-diff --git a/gst-libs/gst/rtsp/Makefile.am b/gst-libs/gst/rtsp/Makefile.am
-index 9b0b258..4f6d9f8 100644
---- a/gst-libs/gst/rtsp/Makefile.am
-+++ b/gst-libs/gst/rtsp/Makefile.am
-@@ -67,7 +67,7 @@ GstRtsp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstrtsp-@GST_API_VERS
- 		-I$(top_builddir)/gst-libs \
- 		-I$(top_srcdir)/gst-libs \
- 		--add-include-path=$(builddir)/../sdp \
--		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
- 		--library=libgstrtsp-@GST_API_VERSION@.la \
- 		--include=Gio-2.0 \
- 		--include=Gst-@GST_API_VERSION@ \
-@@ -97,7 +97,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
- 		--includedir=$(srcdir) \
- 		--includedir=$(builddir) \
- 		--includedir=$(builddir)/../sdp \
--		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
- 		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
- 
- CLEANFILES += $(BUILT_GIRSOURCES) $(typelibs_DATA)
-diff --git a/gst-libs/gst/sdp/Makefile.am b/gst-libs/gst/sdp/Makefile.am
-index 0e149b8..9aa0512 100644
---- a/gst-libs/gst/sdp/Makefile.am
-+++ b/gst-libs/gst/sdp/Makefile.am
-@@ -29,7 +29,7 @@ GstSdp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstsdp-@GST_API_VERSIO
- 		--warn-all \
- 		--c-include "gst/sdp/sdp.h" \
- 		-I$(top_srcdir)/gst-libs \
--		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
- 		--library=libgstsdp-@GST_API_VERSION@.la \
- 		--include=Gst-@GST_API_VERSION@ \
- 		--libtool="$(LIBTOOL)" \
-@@ -53,7 +53,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
- 		$(INTROSPECTION_COMPILER) \
- 		--includedir=$(srcdir) \
- 		--includedir=$(builddir) \
--		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
- 		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
- 
- CLEANFILES = $(BUILT_GIRSOURCES) $(typelibs_DATA)
-diff --git a/gst-libs/gst/tag/Makefile.am b/gst-libs/gst/tag/Makefile.am
-index cafafd3..ba99279 100644
---- a/gst-libs/gst/tag/Makefile.am
-+++ b/gst-libs/gst/tag/Makefile.am
-@@ -40,8 +40,8 @@ GstTag-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgsttag-@GST_API_VERSIO
- 		--c-include "gst/tag/tag.h" \
- 		-I$(top_srcdir)/gst-libs \
- 		-I$(top_builddir)/gst-libs \
--		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
--		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
-+		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
- 		--library=libgsttag-@GST_API_VERSION@.la \
- 		--include=Gst-@GST_API_VERSION@ \
- 		--include=GstBase-@GST_API_VERSION@ \
-@@ -68,8 +68,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
- 		$(INTROSPECTION_COMPILER) \
- 		--includedir=$(srcdir) \
- 		--includedir=$(builddir) \
--		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
--		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
-+		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
- 		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
- 
- CLEANFILES = $(BUILT_GIRSOURCES) $(typelibs_DATA)
-diff --git a/gst-libs/gst/video/Makefile.am b/gst-libs/gst/video/Makefile.am
-index ac64eb3..342c8c6 100644
---- a/gst-libs/gst/video/Makefile.am
-+++ b/gst-libs/gst/video/Makefile.am
-@@ -111,8 +111,8 @@ GstVideo-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstvideo-@GST_API_VE
- 		--c-include "gst/video/video.h" \
- 		-I$(top_srcdir)/gst-libs \
- 		-I$(top_builddir)/gst-libs \
--		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
--		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
-+		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
- 		--library=libgstvideo-@GST_API_VERSION@.la \
- 		--include=Gst-@GST_API_VERSION@ \
- 		--include=GstBase-@GST_API_VERSION@ \
-@@ -139,8 +139,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
- 		$(INTROSPECTION_COMPILER) \
- 		--includedir=$(srcdir) \
- 		--includedir=$(builddir) \
--		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
--		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
-+		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
- 		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
- 
- CLEANFILES += $(BUILT_GIRSOURCES) $(typelibs_DATA)
--- 
-2.6.2
-
-- 
2.4.0



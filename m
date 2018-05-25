Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 4058B60110
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 06:20:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 May 2018 23:20:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,439,1520924400"; d="scan'208";a="61569611"
Received: from anmitta2-mobl1.png.intel.com ([10.221.23.24])
	by orsmga002.jf.intel.com with ESMTP; 24 May 2018 23:20:31 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 May 2018 14:20:05 +0800
Message-Id: <20180525062014.22022-3-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180525062014.22022-1-anuj.mittal@intel.com>
References: <20180525062014.22022-1-anuj.mittal@intel.com>
Subject: [PATCH 03/12] gstreamer1.0-plugins-base: upgrade 1.14.0 -> 1.14.1
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
X-List-Received-Date: Fri, 25 May 2018 06:20:31 -0000

Bugfixes only. Please see:

https://gstreamer.freedesktop.org/releases/1.14/#1.14.1

Remove a backport patch and rebase one other patch.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...stVideo-1.0.gir-from-local-build-dir.patch | 42 -------------------
 ...ix-calls-to-pkg-config-with-PKG_CONF.patch | 21 ++++------
 ...bb => gstreamer1.0-plugins-base_1.14.1.bb} |  5 +--
 3 files changed, 11 insertions(+), 57 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-gl-pick-up-GstVideo-1.0.gir-from-local-build-dir.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.14.0.bb => gstreamer1.0-plugins-base_1.14.1.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-gl-pick-up-GstVideo-1.0.gir-from-local-build-dir.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-gl-pick-up-GstVideo-1.0.gir-from-local-build-dir.patch
deleted file mode 100644
index eba72db96b..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-gl-pick-up-GstVideo-1.0.gir-from-local-build-dir.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 1a7c457cf209e853148865f196edc12ba8d5c10c Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Tim-Philipp=20M=C3=BCller?= <tim@centricular.com>
-Date: Tue, 27 Mar 2018 10:43:16 +0100
-Subject: [PATCH] gl: pick up GstVideo-1.0.gir from local build dir
-
-https://bugzilla.gnome.org/show_bug.cgi?id=794708
-
-Upstream-Status: Backport [https://cgit.freedesktop.org/gstreamer/gst-plugins-base/commit/?h=1.14&id=9261296858cb149767ceac44fd6bd13cc0de0d21]
-
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
-
----
- gst-libs/gst/gl/Makefile.am | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/gst-libs/gst/gl/Makefile.am b/gst-libs/gst/gl/Makefile.am
-index fc15a6d..ab6cc55 100644
---- a/gst-libs/gst/gl/Makefile.am
-+++ b/gst-libs/gst/gl/Makefile.am
-@@ -185,9 +185,10 @@ GstGL-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstgl-@GST_API_VERSION@
- 		-I$(top_builddir)/gst-libs \
- 		$(GST_PLUGINS_BASE_CFLAGS) \
- 		$(GL_CFLAGS) \
-+		--add-include-path="$(top_builddir)/gst-libs/gst/video/" \
- 		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
- 		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
--		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-video-@GST_API_VERSION@` \
-+		--library-path="$(top_builddir)/gst-libs/gst/video/" \
- 		--library=libgstgl-@GST_API_VERSION@.la \
- 		--include=Gst-@GST_API_VERSION@ \
- 		--include=GstBase-@GST_API_VERSION@ \
-@@ -216,9 +217,9 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
- 		$(INTROSPECTION_COMPILER) \
- 		--includedir=$(srcdir) \
- 		--includedir=$(builddir) \
-+		--includedir="$(top_builddir)/gst-libs/gst/video/" \
- 		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
- 		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
--		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-video-@GST_API_VERSION@` \
- 		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
- 
- CLEANFILES = $(BUILT_GIRSOURCES) $(typelibs_DATA)
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch
index 377c89a11d..2e1190ba01 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch
@@ -1,4 +1,4 @@
-From 77b88eae845060d38cf788651f66a7ae98f9b199 Mon Sep 17 00:00:00 2001
+From 9601fc0cd6751a1affdc8717217b95931db31d7f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 5 Apr 2018 10:26:25 +0800
 Subject: [PATCH] Makefile.am: prefix calls to pkg-config with
@@ -12,7 +12,7 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
  gst-libs/gst/allocators/Makefile.am |  4 ++--
  gst-libs/gst/app/Makefile.am        |  4 ++--
  gst-libs/gst/audio/Makefile.am      | 12 ++++++------
- gst-libs/gst/gl/Makefile.am         | 12 ++++++------
+ gst-libs/gst/gl/Makefile.am         |  8 ++++----
  gst-libs/gst/pbutils/Makefile.am    | 12 ++++++------
  gst-libs/gst/riff/Makefile.am       |  8 ++++----
  gst-libs/gst/rtp/Makefile.am        |  8 ++++----
@@ -20,7 +20,7 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
  gst-libs/gst/sdp/Makefile.am        |  4 ++--
  gst-libs/gst/tag/Makefile.am        |  8 ++++----
  gst-libs/gst/video/Makefile.am      |  8 ++++----
- 11 files changed, 42 insertions(+), 42 deletions(-)
+ 11 files changed, 40 insertions(+), 40 deletions(-)
 
 diff --git a/gst-libs/gst/allocators/Makefile.am b/gst-libs/gst/allocators/Makefile.am
 index 1ecc950..d6417ac 100644
@@ -92,32 +92,29 @@ index 7fb65f2..5379f79 100644
  
  CLEANFILES += $(BUILT_GIRSOURCES) $(typelibs_DATA)
 diff --git a/gst-libs/gst/gl/Makefile.am b/gst-libs/gst/gl/Makefile.am
-index 16f829f..fc15a6d 100644
+index 3276d7f..0cdfe26 100644
 --- a/gst-libs/gst/gl/Makefile.am
 +++ b/gst-libs/gst/gl/Makefile.am
-@@ -185,9 +185,9 @@ GstGL-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstgl-@GST_API_VERSION@
- 		-I$(top_builddir)/gst-libs \
+@@ -186,9 +186,9 @@ GstGL-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstgl-@GST_API_VERSION@
  		$(GST_PLUGINS_BASE_CFLAGS) \
  		$(GL_CFLAGS) \
+ 		--add-include-path="$(top_builddir)/gst-libs/gst/video/" \
 -		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
 -		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
--		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-video-@GST_API_VERSION@` \
+ 		--library-path="$(top_builddir)/gst-libs/gst/video/" \
 +		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
 +		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
-+		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-video-@GST_API_VERSION@` \
  		--library=libgstgl-@GST_API_VERSION@.la \
  		--include=Gst-@GST_API_VERSION@ \
  		--include=GstBase-@GST_API_VERSION@ \
-@@ -216,9 +216,9 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
- 		$(INTROSPECTION_COMPILER) \
+@@ -218,8 +218,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
  		--includedir=$(srcdir) \
  		--includedir=$(builddir) \
+ 		--includedir="$(top_builddir)/gst-libs/gst/video/" \
 -		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
 -		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
--		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-video-@GST_API_VERSION@` \
 +		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
 +		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
-+		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-video-@GST_API_VERSION@` \
  		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
  
  CLEANFILES = $(BUILT_GIRSOURCES) $(typelibs_DATA)
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.1.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.1.bb
index 08397a03a8..8d7d3c6192 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.1.bb
@@ -18,10 +18,9 @@ SRC_URI = " \
             file://0009-glimagesink-Downrank-to-marginal.patch \
             file://0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch \
             file://link-with-libvchostif.patch \
-            file://0001-gl-pick-up-GstVideo-1.0.gir-from-local-build-dir.patch \
             "
-SRC_URI[md5sum] = "370271327dd23110421a9c2927ac989a"
-SRC_URI[sha256sum] = "7e904660ff56e02b036cf7fdfb77a50a540828ca9d2614d69ba931772e5b6940"
+SRC_URI[md5sum] = "c42154ab6f85c59f0e449d8d7e290342"
+SRC_URI[sha256sum] = "1026c7c3082d825d9b5d034c1a6dd8a4ebab60eb3738b0a0afde4ad2dc0b0db5"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
-- 
2.17.0



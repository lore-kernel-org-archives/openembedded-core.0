Return-Path: <anuj.mittal@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 07C2779C9B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 05:49:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Feb 2019 21:49:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,367,1544515200"; d="scan'208";a="144143800"
Received: from anmitta2-mobl1.png.intel.com ([10.221.21.114])
	by fmsmga004.fm.intel.com with ESMTP; 13 Feb 2019 21:49:02 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Feb 2019 13:48:57 +0800
Message-Id: <20190214054857.18876-4-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190214054857.18876-1-anuj.mittal@intel.com>
References: <20190214054857.18876-1-anuj.mittal@intel.com>
Subject: [PATCH 4/4] cairo: upgrade 1.14.12 -> 1.16.0
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
X-List-Received-Date: Thu, 14 Feb 2019 05:49:02 -0000

* For changes, see:

https://www.cairographics.org/releases/ChangeLog.cairo-1.16.0

* Remove the backported patch.

* libcairo-trace isn't a version lib anymore, fix the packaging and
include it in perf-utils.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../cairo/0001-cairo-Fix-CVE-2017-9814.patch  | 45 -------------------
 .../{cairo_1.14.12.bb => cairo_1.16.0.bb}     |  8 ++--
 2 files changed, 3 insertions(+), 50 deletions(-)
 delete mode 100644 meta/recipes-graphics/cairo/cairo/0001-cairo-Fix-CVE-2017-9814.patch
 rename meta/recipes-graphics/cairo/{cairo_1.14.12.bb => cairo_1.16.0.bb} (92%)

diff --git a/meta/recipes-graphics/cairo/cairo/0001-cairo-Fix-CVE-2017-9814.patch b/meta/recipes-graphics/cairo/cairo/0001-cairo-Fix-CVE-2017-9814.patch
deleted file mode 100644
index 7d02ab9474..0000000000
--- a/meta/recipes-graphics/cairo/cairo/0001-cairo-Fix-CVE-2017-9814.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 042421e9e3d266ad0bb7805132041ef51ad3234d Mon Sep 17 00:00:00 2001
-From: Adrian Johnson <ajohnson@redneon.com>
-Date: Wed, 16 Aug 2017 22:52:35 -0400
-Subject: [PATCH] cairo: Fix CVE-2017-9814
-
-The bug happens because in some scenarios the variable size can
-have a value of 0 at line 1288. And malloc(0) is not returning
-NULL as some people could expect:
-
-    https://stackoverflow.com/questions/1073157/zero-size-malloc
-
-malloc(0) returns the smallest chunk possible. So the line 1290
-with the return is not execute. And the execution continues with
-an invalid map.
-
-Since the size is 0 the variable map is not initialized correctly
-at load_trutype_table. So, later when the variable map is accessed
-previous values from a freed chunk are used. This could allows an
-attacker to control the variable map.
-
-This patch have not merge in upstream now.
-
-Upstream-Status: Backport [https://bugs.freedesktop.org/show_bug.cgi?id=101547]
-CVE: CVE-2017-9814
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
----
- src/cairo-truetype-subset.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/cairo-truetype-subset.c b/src/cairo-truetype-subset.c
-index e3449a0..f77d11c 100644
---- a/src/cairo-truetype-subset.c
-+++ b/src/cairo-truetype-subset.c
-@@ -1285,7 +1285,7 @@ _cairo_truetype_reverse_cmap (cairo_scaled_font_t *scaled_font,
- 	return CAIRO_INT_STATUS_UNSUPPORTED;
- 
-     size = be16_to_cpu (map->length);
--    map = malloc (size);
-+    map = _cairo_malloc (size);
-     if (unlikely (map == NULL))
- 	return _cairo_error (CAIRO_STATUS_NO_MEMORY);
- 
--- 
-2.8.1
-
diff --git a/meta/recipes-graphics/cairo/cairo_1.14.12.bb b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
similarity index 92%
rename from meta/recipes-graphics/cairo/cairo_1.14.12.bb
rename to meta/recipes-graphics/cairo/cairo_1.16.0.bb
index ad6745f60d..3e176930cc 100644
--- a/meta/recipes-graphics/cairo/cairo_1.14.12.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
@@ -24,11 +24,10 @@ DEPENDS = "fontconfig glib-2.0 libpng pixman zlib"
 
 SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz \
            file://cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff \ 
-           file://0001-cairo-Fix-CVE-2017-9814.patch \
           "
 
-SRC_URI[md5sum] = "9f0db9dbfca0966be8acd682e636d165"
-SRC_URI[sha256sum] = "8c90f00c500b2299c0a323dd9beead2a00353752b2092ead558139bd67f7bf16"
+SRC_URI[md5sum] = "f19e0353828269c22bd72e271243a552"
+SRC_URI[sha256sum] = "5e7b29b3f113ef870d1e3ecf8adf21f923396401604bda16d44be45e66052331"
 
 inherit autotools pkgconfig upstream-version-is-even gtk-doc multilib_script
 
@@ -81,7 +80,6 @@ DESCRIPTION_cairo-perf-utils = "The Cairo library performance utilities"
 FILES_${PN} = "${libdir}/libcairo.so.*"
 FILES_${PN}-gobject = "${libdir}/libcairo-gobject.so.*"
 FILES_${PN}-script-interpreter = "${libdir}/libcairo-script-interpreter.so.*"
-FILES_${PN}-perf-utils = "${bindir}/cairo-trace* ${libdir}/cairo/*.la ${libdir}/cairo/libcairo-trace.so.*"
-FILES_${PN}-dev += "${libdir}/cairo/*.so"
+FILES_${PN}-perf-utils = "${bindir}/cairo-trace* ${libdir}/cairo/*.la ${libdir}/cairo/libcairo-trace.so"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1



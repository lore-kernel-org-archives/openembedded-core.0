Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5A87771AE6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 10:22:30 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 21 Oct 2016 03:22:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,375,1473145200"; d="scan'208";a="182256757"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga004.fm.intel.com with ESMTP; 21 Oct 2016 03:22:32 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Oct 2016 13:22:11 +0300
Message-Id: <53f0e27c2fce830df4f0d39d6a5dae07ce43a23a.1477032779.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <e5ffe5ce81bc8eed3714e3e8199c0f977088779f.1477032779.git.jussi.kukkonen@intel.com>
References: <e5ffe5ce81bc8eed3714e3e8199c0f977088779f.1477032779.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1477032779.git.jussi.kukkonen@intel.com>
References: <cover.1477032779.git.jussi.kukkonen@intel.com>
Subject: [PATCH 13/15] libx11: Upgrade 1.6.3 -> 1.6.4
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
X-List-Received-Date: Fri, 21 Oct 2016 10:22:30 -0000

Maintenance release. libx11-xcb no longer links against libx11.

Remove backported patch.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../libx11/libX11-Add-missing-NULL-check.patch     | 72 ----------------------
 meta/recipes-graphics/xorg-lib/libx11_1.6.3.bb     | 11 ----
 meta/recipes-graphics/xorg-lib/libx11_1.6.4.bb     | 10 +++
 3 files changed, 10 insertions(+), 83 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11/libX11-Add-missing-NULL-check.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11_1.6.3.bb
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11_1.6.4.bb

diff --git a/meta/recipes-graphics/xorg-lib/libx11/libX11-Add-missing-NULL-check.patch b/meta/recipes-graphics/xorg-lib/libx11/libX11-Add-missing-NULL-check.patch
deleted file mode 100644
index f2abf7c..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11/libX11-Add-missing-NULL-check.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 4d85d5f3bd8afac893738fd88e19d8cb5cf998ff Mon Sep 17 00:00:00 2001
-From: Drew Moseley <drew_moseley@mentor.com>
-Date: Sun, 27 Jul 2014 13:10:07 -0400
-Subject: [PATCH] libX11: Add missing NULL check on im and im->methods
-
-Upstream-Status: Backport (c827edcd1c4a7f920aa25208083b5b58d60d2b44)
-Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
-
----
- src/xlibi18n/ICWrap.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff -ru libX11-1.6.2-orig/src/xlibi18n/ICWrap.c libX11-1.6.2/src/xlibi18n/ICWrap.c
---- libX11-1.6.2-orig/src/xlibi18n/ICWrap.c	2014-07-27 13:38:29.586666449 -0400
-+++ libX11-1.6.2/src/xlibi18n/ICWrap.c	2014-07-27 13:41:39.671609030 -0400
-@@ -169,7 +169,7 @@
-     va_list var;
-     int     total_count;
-     XIMArg *args;
--    char   *ret;
-+    char   *ret = NULL;
- 
-     /*
-      * so count the stuff dangling here
-@@ -185,7 +185,8 @@
-     _XIMVaToNestedList(var, total_count, &args);
-     va_end(var);
- 
--    ret = (*im->methods->set_values) (im, args);
-+    if (im && im->methods)
-+	ret = (*im->methods->set_values) (im, args);
-     Xfree(args);
-     return ret;
- }
-@@ -196,7 +197,7 @@
-     va_list var;
-     int     total_count;
-     XIMArg *args;
--    char   *ret;
-+    char   *ret = NULL;
- 
-     /*
-      * so count the stuff dangling here
-@@ -212,7 +213,8 @@
-     _XIMVaToNestedList(var, total_count, &args);
-     va_end(var);
- 
--    ret = (*im->methods->get_values) (im, args);
-+    if (im && im->methods)
-+	ret = (*im->methods->get_values) (im, args);
-     Xfree(args);
-     return ret;
- }
-@@ -228,7 +230,7 @@
-     va_list var;
-     int     total_count;
-     XIMArg *args;
--    XIC     ic;
-+    XIC     ic = NULL;
- 
-     /*
-      * so count the stuff dangling here
-@@ -244,7 +246,8 @@
-     _XIMVaToNestedList(var, total_count, &args);
-     va_end(var);
- 
--    ic = (XIC) (*im->methods->create_ic) (im, args);
-+    if (im && im->methods)
-+	ic = (XIC) (*im->methods->create_ic) (im, args);
-     Xfree(args);
-     if (ic) {
- 	ic->core.next = im->core.ic_chain;
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.3.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.3.bb
deleted file mode 100644
index 8e531c7..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11_1.6.3.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require libx11.inc
-inherit gettext
-
-BBCLASSEXTEND = "native nativesdk"
-
-SRC_URI += "file://disable_tests.patch \
-            file://libX11-Add-missing-NULL-check.patch \
-           "
-
-SRC_URI[md5sum] = "2e36b73f8a42143142dda8129f02e4e0"
-SRC_URI[sha256sum] = "cf31a7c39f2f52e8ebd0db95640384e63451f9b014eed2bb7f5de03e8adc8111"
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.4.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.4.bb
new file mode 100644
index 0000000..caa95fb
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.6.4.bb
@@ -0,0 +1,10 @@
+require libx11.inc
+inherit gettext
+
+BBCLASSEXTEND = "native nativesdk"
+
+SRC_URI += "file://disable_tests.patch \
+           "
+
+SRC_URI[md5sum] = "6d54227082f3aa2c596f0b3a3fbb9175"
+SRC_URI[sha256sum] = "b7c748be3aa16ec2cbd81edc847e9b6ee03f88143ab270fb59f58a044d34e441"
-- 
2.1.4



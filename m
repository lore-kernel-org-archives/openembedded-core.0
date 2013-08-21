Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 3F50A6B8A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 23:14:42 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 21 Aug 2013 16:14:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,930,1367996400"; d="scan'208";a="285060188"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.105])
	by AZSMGA002.ch.intel.com with ESMTP; 21 Aug 2013 16:14:42 -0700
From: Saul Wold <sgw@linux.intel.com>
To: kai.kang@windriver.com,
	openembedded-core@lists.openembedded.org
Date: Wed, 21 Aug 2013 16:14:33 -0700
Message-Id: <1377126875-9856-3-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1377126875-9856-1-git-send-email-sgw@linux.intel.com>
References: <1377126875-9856-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 2/4] libx11-diet: upgrade to 1.6.1
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
X-List-Received-Date: Wed, 21 Aug 2013 23:14:43 -0000

From: Kai Kang <kai.kang@windriver.com>

Deleted keysymdef_include patch

Signed-off-by: Kai Kang <kai.kang@windriver.com>

[sgw - Removed PR]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../{libx11-diet_1.5.0.bb => libx11-diet_1.6.1.bb} |  7 ++--
 .../xorg-lib/libx11/keysymdef_include.patch        | 42 ----------------------
 2 files changed, 2 insertions(+), 47 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libx11-diet_1.5.0.bb => libx11-diet_1.6.1.bb} (65%)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11/keysymdef_include.patch

diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.1.bb
similarity index 65%
rename from meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
rename to meta/recipes-graphics/xorg-lib/libx11-diet_1.6.1.bb
index 0b50f09..3c3b8e7 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.1.bb
@@ -3,10 +3,7 @@ require libx11.inc
 DESCRIPTION += " Support for XCMS and XLOCALE is disabled in \
 this version."
 
-PR = "${INC_PR}.4"
-
 SRC_URI += "file://X18NCMSstubs.diff \
-            file://keysymdef_include.patch \
             file://fix-disable-xlocale.diff \
             file://fix-utf8-wrong-define.patch \
            "
@@ -14,8 +11,8 @@ SRC_URI += "file://X18NCMSstubs.diff \
 RPROVIDES_${PN}-dev = "libx11-dev"
 RPROVIDES_${PN}-locale = "libx11-locale"
 
-SRC_URI[md5sum] = "78b4b3bab4acbdf0abcfca30a8c70cc6"
-SRC_URI[sha256sum] = "c382efd7e92bfc3cef39a4b7f1ecf2744ba4414a705e3bc1e697f75502bd4d86"
+SRC_URI[md5sum] = "bc5fc459ec25a50c5a7e27035b89e579"
+SRC_URI[sha256sum] = "10a54fc16b58b4f5a5eed4d080c357a82fd2f42d09af625c1f5df50650701892"
 
 EXTRA_OECONF += "--disable-xlocale"
 
diff --git a/meta/recipes-graphics/xorg-lib/libx11/keysymdef_include.patch b/meta/recipes-graphics/xorg-lib/libx11/keysymdef_include.patch
deleted file mode 100644
index 8c50bb7..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11/keysymdef_include.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From d45b3fc19fbe95c41afc4e51d768df6d42332010 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Wed, 12 Sep 2012 13:39:40 +0000
-Subject: Allow overriding location of keysymdef.h
-
-Currently keysymdef.h is found by using the includedir of xproto.  This doesn't
-work when cross-compiling with a sysroot as that ends up being /usr/include/X11,
-not a path into the cross-build environment.
-
-So, add an option to allow explicitly specifying the location of keysymdef.h,
-and verify that the specified or found path exists.
-
-(original patch by Martin Jansa <martin.jansa@gmail.com>, revised by myself)
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-Reviewed-by: Dan Nicholson <dbn.lists@gmail.com>
-Reviewed-by: Daniel Stone <daniel@fooishbar.org>
----
-diff --git a/configure.ac b/configure.ac
-index 48a0c8a..a45f9d9 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -306,7 +306,15 @@ AC_CHECK_FUNC(poll, [AC_DEFINE(USE_POLL, 1, [poll() function is available])], )
- # Find keysymdef.h
- #
- AC_MSG_CHECKING([keysym definitions])
--KEYSYMDEFDIR=`$PKG_CONFIG --variable=includedir xproto`/X11
-+AC_ARG_WITH([keysymdefdir],
-+        [AC_HELP_STRING([--with-keysymdefdir=DIR], [The location of keysymdef.h (defaults to xproto include dir)])],
-+        [KEYSYMDEFDIR=$withval],
-+        [KEYSYMDEFDIR=`$PKG_CONFIG --variable=includedir xproto`/X11])
-+
-+if test ! -d "$KEYSYMDEFDIR"; then
-+	AC_MSG_ERROR([$KEYSYMDEFDIR doesn't exist or isn't a directory])
-+fi
-+
- FILES="keysymdef.h XF86keysym.h Sunkeysym.h DECkeysym.h HPkeysym.h"
- for i in $FILES; do
-     if test -f "$KEYSYMDEFDIR/$i"; then
---
-cgit v0.9.0.2-2-gbebe
-- 
1.8.3.1



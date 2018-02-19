Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A525571B50
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 08:35:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Feb 2018 00:35:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,534,1511856000"; d="scan'208";a="18705610"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga007.fm.intel.com with ESMTP; 19 Feb 2018 00:35:01 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 8C6265802D1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 00:35:00 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Feb 2018 10:37:01 +0200
Message-Id: <1519029438-11092-11-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
References: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 10/27] vala: remove PKG_CONFIG_SYSROOT_DIR work-around
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
X-List-Received-Date: Mon, 19 Feb 2018 08:35:01 -0000

We are moving from freedesktop.org's pkg-config to pkgconf.
This helps us to remove the following patch as PKG_CONFIG_SYSROOT_DIR
behaves consistently with pkgconf:

1) 0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch | 38 ----------------------
 meta/recipes-devtools/vala/vala_0.38.6.bb          |  1 -
 2 files changed, 39 deletions(-)
 delete mode 100644 meta/recipes-devtools/vala/vala/0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch

diff --git a/meta/recipes-devtools/vala/vala/0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch b/meta/recipes-devtools/vala/vala/0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch
deleted file mode 100644
index ecab0fc..0000000
--- a/meta/recipes-devtools/vala/vala/0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From dbb1c58e86f2af4613f3ac9571d9b163d4bca675 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 23 Oct 2015 16:13:54 +0300
-Subject: [PATCH] vapigen.m4: use $PKG_CONFIG_SYSROOT_DIR
-
-This is necessary in cross-compiling environments, where directories
-returned by pkg-config should be prefixed with sysroot location.
-
-Upstream-Status: Pending [review in oe-core list]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- vapigen/vapigen.m4 | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/vapigen/vapigen.m4 b/vapigen/vapigen.m4
-index 2c435e7..6228991 100644
---- a/vapigen/vapigen.m4
-+++ b/vapigen/vapigen.m4
-@@ -82,12 +82,12 @@ AC_DEFUN([VAPIGEN_CHECK],
- 
-   AS_CASE([$enable_vala],
-     [yes], [
--      VAPIGEN=`$PKG_CONFIG --variable=vapigen $vapigen_pkg_name`
--      VAPIGEN_MAKEFILE=`$PKG_CONFIG --variable=datadir $vapigen_pkg_name`/vala/Makefile.vapigen
-+      VAPIGEN=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=vapigen $vapigen_pkg_name`
-+      VAPIGEN_MAKEFILE=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=datadir $vapigen_pkg_name`/vala/Makefile.vapigen
-       AS_IF([test "x$2" = "x"], [
--          VAPIGEN_VAPIDIR=`$PKG_CONFIG --variable=vapidir $vapigen_pkg_name`
-+          VAPIGEN_VAPIDIR=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=vapidir $vapigen_pkg_name`
-         ], [
--          VAPIGEN_VAPIDIR=`$PKG_CONFIG --variable=vapidir_versioned $vapigen_pkg_name`
-+          VAPIGEN_VAPIDIR=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=vapidir_versioned $vapigen_pkg_name`
-         ])
-     ])
- 
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/vala/vala_0.38.6.bb b/meta/recipes-devtools/vala/vala_0.38.6.bb
index b0b8e00..f1a2a51 100644
--- a/meta/recipes-devtools/vala/vala_0.38.6.bb
+++ b/meta/recipes-devtools/vala/vala_0.38.6.bb
@@ -1,7 +1,6 @@
 require ${BPN}.inc
 
 SRC_URI += " file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch \
-             file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch \
 	     file://disable-graphviz.patch \
 	     file://0001-Disable-valadoc.patch \
 "
-- 
2.4.0



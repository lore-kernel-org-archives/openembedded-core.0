Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7FCA96E5FC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 08:35:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Feb 2018 00:35:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,534,1511856000"; d="scan'208";a="18703446"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga007.jf.intel.com with ESMTP; 19 Feb 2018 00:35:19 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id CA2B15802D1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 00:35:18 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Feb 2018 10:37:18 +0200
Message-Id: <1519029438-11092-28-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
References: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 27/27] librsvg: unset PKG_CONFIG_SYSROOT_DIR for relative path
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
X-List-Received-Date: Mon, 19 Feb 2018 08:35:18 -0000

pkgconf needs to unset PKG_CONFIG_SYSROOT_DIR for relative path.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../0001-configure.ac-fix-build-with-pkgconf.patch | 32 ++++++++++++++++++++++
 meta/recipes-gnome/librsvg/librsvg_2.40.20.bb      |  4 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/0001-configure.ac-fix-build-with-pkgconf.patch

diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-configure.ac-fix-build-with-pkgconf.patch b/meta/recipes-gnome/librsvg/librsvg/0001-configure.ac-fix-build-with-pkgconf.patch
new file mode 100644
index 0000000..54c0e35
--- /dev/null
+++ b/meta/recipes-gnome/librsvg/librsvg/0001-configure.ac-fix-build-with-pkgconf.patch
@@ -0,0 +1,32 @@
+From 5935c18d1748f9b3324a4b13980df54d9a8c779f Mon Sep 17 00:00:00 2001
+From: "Maxin B. John" <maxin.john@intel.com>
+Date: Sun, 18 Feb 2018 13:41:28 +0200
+Subject: [PATCH] configure.ac: fix build with pkgconf
+
+pkgconf requires to unset PKG_CONFIG_SYSROOT_DIR for relative path.
+
+Upstream-Status: Inappropriate [specific to pkgconf]
+
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 8852862..7151503 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -170,8 +170,8 @@ if test "$enable_pixbuf_loader" = "yes"; then
+ 
+   # First try the standalone gdk-pixbuf
+   gdk_pixbuf_binary_version="`$PKG_CONFIG --variable=gdk_pixbuf_binary_version gdk-pixbuf-2.0`"
+-  gdk_pixbuf_binarydir="`$PKG_CONFIG --variable=gdk_pixbuf_binarydir gdk-pixbuf-2.0`"
+-  gdk_pixbuf_moduledir=`$PKG_CONFIG --variable gdk_pixbuf_moduledir gdk-pixbuf-2.0`
++  gdk_pixbuf_binarydir="`unset PKG_CONFIG_SYSROOT_DIR; $PKG_CONFIG --variable=gdk_pixbuf_binarydir gdk-pixbuf-2.0`"
++  gdk_pixbuf_moduledir=`unset PKG_CONFIG_SYSROOT_DIR; $PKG_CONFIG --variable gdk_pixbuf_moduledir gdk-pixbuf-2.0`
+   gdk_pixbuf_cache_file=`$PKG_CONFIG --variable gdk_pixbuf_cache_file gdk-pixbuf-2.0`
+ fi
+ 
+-- 
+2.4.0
+
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb b/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
index cd44530..edd37c3 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
@@ -12,7 +12,9 @@ BBCLASSEXTEND = "native"
 
 inherit autotools pkgconfig gnomebase gtk-doc pixbufcache upstream-version-is-even gobject-introspection
 
-SRC_URI += "file://gtk-option.patch"
+SRC_URI += "file://gtk-option.patch \
+            file://0001-configure.ac-fix-build-with-pkgconf.patch \
+           "
 
 SRC_URI[archive.md5sum] = "4949d313b0c5d9161a5c259104af5568"
 SRC_URI[archive.sha256sum] = "cff4dd3c3b78bfe99d8fcfad3b8ba1eee3289a0823c0e118d78106be6b84c92b"
-- 
2.4.0



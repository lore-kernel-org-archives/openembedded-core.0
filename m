Return-Path: <maxin.john@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id C71B96E672
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 08:35:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Feb 2018 00:35:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,534,1511856000"; d="scan'208";a="19176366"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga008.jf.intel.com with ESMTP; 19 Feb 2018 00:35:17 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id D501658030D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 00:35:16 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Feb 2018 10:37:16 +0200
Message-Id: <1519029438-11092-26-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
References: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 25/27] glib-networking: unset PKG_CONFIG_SYSROOT_DIR for relative path
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
X-List-Received-Date: Mon, 19 Feb 2018 08:35:16 -0000

pkgconf needs to unset PKG_CONFIG_SYSROOT_DIR for relative path.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...c-unset-PKG_CONFIG_SYSROOT_DIR-for-relati.patch | 31 ++++++++++++++++++++++
 .../glib-networking/glib-networking_2.54.1.bb      |  2 ++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-core/glib-networking/glib-networking/0001-configure.ac-unset-PKG_CONFIG_SYSROOT_DIR-for-relati.patch

diff --git a/meta/recipes-core/glib-networking/glib-networking/0001-configure.ac-unset-PKG_CONFIG_SYSROOT_DIR-for-relati.patch b/meta/recipes-core/glib-networking/glib-networking/0001-configure.ac-unset-PKG_CONFIG_SYSROOT_DIR-for-relati.patch
new file mode 100644
index 0000000..08879b9
--- /dev/null
+++ b/meta/recipes-core/glib-networking/glib-networking/0001-configure.ac-unset-PKG_CONFIG_SYSROOT_DIR-for-relati.patch
@@ -0,0 +1,31 @@
+From f0fe611b1b24cbeafed380b1956ab21b09419c64 Mon Sep 17 00:00:00 2001
+From: "Maxin B. John" <maxin.john@intel.com>
+Date: Fri, 16 Feb 2018 16:12:22 +0200
+Subject: [PATCH] configure.ac: unset PKG_CONFIG_SYSROOT_DIR for relative path
+
+pkgconf requires unsetting  PKG_CONFIG_SYSROOT_DIR to find
+the relative path of giomoduledir.
+
+Upstream-Status: Inappropriate [specific to pkgconf]
+
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index ddee2a7..e31f397 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -35,7 +35,7 @@ dnl *****************************
+ AM_PATH_GLIB_2_0(2.46.0,,AC_MSG_ERROR(GLIB not found),gio)
+ GLIB_CFLAGS="$GLIB_CFLAGS -DGLIB_VERSION_MIN_REQUIRED=GLIB_VERSION_2_46"
+ 
+-GIO_MODULE_DIR=$($PKG_CONFIG --variable giomoduledir gio-2.0)
++GIO_MODULE_DIR=$(unset PKG_CONFIG_SYSROOT_DIR; $PKG_CONFIG --variable giomoduledir gio-2.0)
+ AS_IF([test "$GIO_MODULE_DIR" = ""],
+       [AC_MSG_FAILURE(GIO_MODULE_DIR is missing from gio-2.0.pc)])
+ AC_SUBST(GIO_MODULE_DIR)
+-- 
+2.4.0
+
diff --git a/meta/recipes-core/glib-networking/glib-networking_2.54.1.bb b/meta/recipes-core/glib-networking/glib-networking_2.54.1.bb
index 2a6f8af..c9dceae 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.54.1.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.54.1.bb
@@ -9,6 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 SECTION = "libs"
 DEPENDS = "glib-2.0"
 
+SRC_URI_append = " file://0001-configure.ac-unset-PKG_CONFIG_SYSROOT_DIR-for-relati.patch"
+
 SRC_URI[archive.md5sum] = "99867463f182c2767bce0c74bc9cc981"
 SRC_URI[archive.sha256sum] = "eaa787b653015a0de31c928e9a17eb57b4ce23c8cf6f277afaec0d685335012f"
 
-- 
2.4.0



Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id DAD4F65CC6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 08:35:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Feb 2018 00:35:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,534,1511856000"; d="scan'208";a="18866108"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga008.fm.intel.com with ESMTP; 19 Feb 2018 00:35:18 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id E9FC75802D1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 00:35:17 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Feb 2018 10:37:17 +0200
Message-Id: <1519029438-11092-27-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
References: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 26/27] btrfs-tools: unset PKG_CONFIG_SYSROOT_DIR for relative path
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
X-List-Received-Date: Mon, 19 Feb 2018 08:35:17 -0000

pkgconf needs to unset PKG_CONFIG_SYSROOT_DIR for relative path.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...c-unset-PKG_CONFIG_SYSROOT_DIR-for-relati.patch | 31 ++++++++++++++++++++++
 .../btrfs-tools/btrfs-tools_4.13.3.bb              |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-configure.ac-unset-PKG_CONFIG_SYSROOT_DIR-for-relati.patch

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-configure.ac-unset-PKG_CONFIG_SYSROOT_DIR-for-relati.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-configure.ac-unset-PKG_CONFIG_SYSROOT_DIR-for-relati.patch
new file mode 100644
index 0000000..2fcee50
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-configure.ac-unset-PKG_CONFIG_SYSROOT_DIR-for-relati.patch
@@ -0,0 +1,31 @@
+From 5aca78ff82a5f79ec33c4eda1e5d8c214ee14e65 Mon Sep 17 00:00:00 2001
+From: "Maxin B. John" <maxin.john@intel.com>
+Date: Fri, 16 Feb 2018 09:44:48 +0200
+Subject: [PATCH] configure.ac: unset  PKG_CONFIG_SYSROOT_DIR for relative path
+
+pkgconf requires unsetting  PKG_CONFIG_SYSROOT_DIR to find the relative
+path.
+
+Upstream-Status: Inappropriate [specific to pkgconf]
+
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 290dc1d..305337d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -204,7 +204,7 @@ AC_SUBST(BTRFSRESTORE_ZSTD)
+ # on earlier releases.
+ UDEVDIR=
+ if pkg-config udev --atleast-version 190; then
+-	UDEVDIR="$(pkg-config udev --variable=udevdir)"
++	UDEVDIR="'unset PKG_CONFIG_SYSROOT_DIR; $(pkg-config udev --variable=udevdir)'"
+ fi
+ AC_SUBST(UDEVDIR)
+ 
+-- 
+2.4.0
+
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.13.3.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.13.3.bb
index 263fc65..8ec652f 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.13.3.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.13.3.bb
@@ -18,6 +18,7 @@ SRCREV = "a7a1ea0f4f2a1d6eeeb3d106e062c7f1034f16d4"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Makefile-build-mktables-using-native-gcc.patch \
            file://0001-Fix-build-with-musl-missing-header-include-for-dev_t.patch \
+           file://0001-configure.ac-unset-PKG_CONFIG_SYSROOT_DIR-for-relati.patch \
            "
 
 inherit autotools-brokensep pkgconfig manpages
-- 
2.4.0



Return-Path: <jonathan.yong@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A5CC077A01
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 04:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490673785; x=1522209785;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=EUmNwm0qWTb3tBCvTksQQ/rOE3NPC+2PjzlDUi/ouU8=;
	b=MUpRO4ek9/D2D5PcmQ9AklAbNIIsgMwKz7o374uaCnD670Uo3TuKhQTH
	W/F9Cgc0cIijU9coMsB0uTCkkWxE5w==;
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Mar 2017 21:03:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,235,1486454400"; d="scan'208";a="81705259"
Received: from vanguard-01.png.intel.com ([10.221.118.162])
	by fmsmga006.fm.intel.com with ESMTP; 27 Mar 2017 21:03:03 -0700
From: "Yong, Jonathan" <jonathan.yong@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 04:02:01 +0000
Message-Id: <20170328040201.20341-3-jonathan.yong@intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170328040201.20341-1-jonathan.yong@intel.com>
References: <20170328040201.20341-1-jonathan.yong@intel.com>
Subject: [PATCH] f2fs-tools: Update to Version 1.8.0
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
X-List-Received-Date: Tue, 28 Mar 2017 04:03:03 -0000

Signed-off-by: Yong, Jonathan <jonathan.yong@intel.com>
---
 .../0002-Fix-mkfs-out-of-tree-builds.patch         | 27 ++++++++++++++++++++++
 .../{f2fs-tools_1.4.0.bb => f2fs-tools_1.8.0.bb}   |  5 ++--
 2 files changed, 30 insertions(+), 2 deletions(-)
 create mode 100644 meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0002-Fix-mkfs-out-of-tree-builds.patch
 rename meta-filesystems/recipes-utils/f2fs-tools/{f2fs-tools_1.4.0.bb => f2fs-tools_1.8.0.bb} (81%)

diff --git a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0002-Fix-mkfs-out-of-tree-builds.patch b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0002-Fix-mkfs-out-of-tree-builds.patch
new file mode 100644
index 0000000..3aadf3c
--- /dev/null
+++ b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0002-Fix-mkfs-out-of-tree-builds.patch
@@ -0,0 +1,27 @@
+From 1d4f6b6a945eabb364a2035d5ef0b69f68a87f74 Mon Sep 17 00:00:00 2001
+From: "Yong, Jonathan" <jonathan.yong@intel.com>
+Date: Mon, 27 Mar 2017 08:34:06 +0000
+Subject: [PATCH] Fix mkfs out of tree builds
+
+Libraries are built in builddir, not srcdir, fix Makefile.am
+accordingly.
+
+Signed-off-by: Yong, Jonathan <jonathan.yong@intel.com>
+---
+ mkfs/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mkfs/Makefile.am b/mkfs/Makefile.am
+index 8b4c16c..ae211b2 100644
+--- a/mkfs/Makefile.am
++++ b/mkfs/Makefile.am
+@@ -10,5 +10,5 @@ lib_LTLIBRARIES = libf2fs_format.la
+ libf2fs_format_la_SOURCES = f2fs_format_main.c f2fs_format.c f2fs_format_utils.c
+ libf2fs_format_la_CFLAGS = -DWITH_BLKDISCARD
+ libf2fs_format_la_CPPFLAGS = -I$(top_srcdir)/include
+-libf2fs_format_la_LDFLAGS = -luuid -L$(top_srcdir)/lib -lf2fs \
++libf2fs_format_la_LDFLAGS = -luuid -L$(top_builddir)/lib -lf2fs \
+ 	-version-info $(FMT_CURRENT):$(FMT_REVISION):$(FMT_AGE)
+-- 
+2.10.2
+
diff --git a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.4.0.bb b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.8.0.bb
similarity index 81%
rename from meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.4.0.bb
rename to meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.8.0.bb
index 1a558e7..691cb6e 100644
--- a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.4.0.bb
+++ b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.8.0.bb
@@ -7,9 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=362b4b2594cd362b874a97718faa51d3"
 # to provide libuuid
 DEPENDS = "util-linux"
 
-SRCREV = "baac4b4e6f41ceb02511da49dd3707674f3fea21"
+SRCREV = "1e7aedf99b85d16f94d1d8ad2fcf846403bb2174"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git \
-    file://0001-Remove-AC_CHECK_FILE-for-cross-compilation.patch"
+    file://0001-Remove-AC_CHECK_FILE-for-cross-compilation.patch \
+    file://0002-Fix-mkfs-out-of-tree-builds.patch"
 S = "${WORKDIR}/git"
 
 inherit pkgconfig autotools
-- 
2.10.2



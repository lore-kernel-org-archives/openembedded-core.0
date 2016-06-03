Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4B70F77444
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 09:15:16 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 03 Jun 2016 02:15:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,411,1459839600"; d="scan'208";a="994440181"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jun 2016 02:15:16 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jun 2016 12:14:45 +0300
Message-Id: <31634cc2cc3c629644ae3700f6c4953e63edaabe.1464945141.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
References: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
References: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 08/25] btrfs-tools: update to 4.5.3
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
X-List-Received-Date: Fri, 03 Jun 2016 09:15:16 -0000

Drop fix-symlink-creation-multiple-times.patch (merged upstream).

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../fix-symlink-creation-multiple-times.patch      | 46 ----------------------
 .../{btrfs-tools_4.4.bb => btrfs-tools_4.5.3.bb}   |  3 +-
 2 files changed, 1 insertion(+), 48 deletions(-)
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/fix-symlink-creation-multiple-times.patch
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_4.4.bb => btrfs-tools_4.5.3.bb} (89%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix-symlink-creation-multiple-times.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix-symlink-creation-multiple-times.patch
deleted file mode 100644
index a945496..0000000
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix-symlink-creation-multiple-times.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 05ab78e9183575e38f342e05a056cb7bcd1e52e1 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 18 Feb 2016 20:41:28 -0500
-Subject: [PATCH] btrfs-progs: fix symlink creation multiple times
-
-The rule to create symlink in Makefile caused parallel issue:
-$ make -j 40 DESTDIR=/image install BUILD_VERBOSE=1
-...
-  1     [LN]     libbtrfs.so.0
-  2     [LN]     libbtrfs.so
-  3 ln -s -f libbtrfs.so.0.1 libbtrfs.so.0
-  4 ln -s -f libbtrfs.so.0.1 libbtrfs.so.0
-  5 ln -s -f libbtrfs.so.0.1 libbtrfs.so
-  6 ln -s -f libbtrfs.so.0.1 libbtrfs.so
-...
-
-It failed occasionally:
-...
-|symlinkat: couldn't stat 'git/libbtrfs.so' even though symlink
-creation succeeded (No such file or directory).
-|ln: failed to create symbolic link 'libbtrfs.so': No such file or directory
-...
-
-Upstream-Status: Submitted [linux-btrfs@vger.kernel.org]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- Makefile.in | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 1f4002e..16eeaf9 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -236,8 +236,7 @@ $(libs_static): $(libbtrfs_objects)
- 
- $(lib_links):
- 	@echo "    [LN]     $@"
--	$(Q)$(LN_S) -f libbtrfs.so.0.1 libbtrfs.so.0
--	$(Q)$(LN_S) -f libbtrfs.so.0.1 libbtrfs.so
-+	$(Q)$(LN_S) -f libbtrfs.so.0.1 $@
- 
- # keep intermediate files from the below implicit rules around
- .PRECIOUS: $(addsuffix .o,$(progs))
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.4.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.5.3.bb
similarity index 89%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_4.4.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_4.5.3.bb
index 32e7bae..50fe66e 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.4.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.5.3.bb
@@ -13,10 +13,9 @@ SECTION = "base"
 DEPENDS = "util-linux attr e2fsprogs lzo acl"
 RDEPENDS_${PN} = "libgcc"
 
-SRCREV = "21258fab2caeade405a15ba932d373b364aa6e8c"
+SRCREV = "b72438362b2dbce880cefe9427ffe0947a94e060"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://fix-parallel.patch \
-           file://fix-symlink-creation-multiple-times.patch \
 "
 
 inherit autotools-brokensep pkgconfig
-- 
2.8.1



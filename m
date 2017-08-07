Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 6ECA66FF78
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Aug 2017 13:14:05 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Aug 2017 06:14:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,338,1498546800"; d="scan'208";a="136634472"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 07 Aug 2017 06:14:04 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Aug 2017 16:10:42 +0300
Message-Id: <20170807131042.34726-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.13.2
Subject: [PATCHv2] btrfs-tools: update to 4.12
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
X-List-Received-Date: Mon, 07 Aug 2017 13:14:05 -0000

Add a patch to force a native build for a helper binary
(which is not installed or used outside of the build process).

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...-Makefile-build-mktables-using-native-gcc.patch | 30 ++++++++++++++++++++++
 .../{btrfs-tools_4.11.1.bb => btrfs-tools_4.12.bb} |  6 +++--
 2 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Makefile-build-mktables-using-native-gcc.patch
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_4.11.1.bb => btrfs-tools_4.12.bb} (88%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Makefile-build-mktables-using-native-gcc.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Makefile-build-mktables-using-native-gcc.patch
new file mode 100644
index 00000000000..a81900ee7e7
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Makefile-build-mktables-using-native-gcc.patch
@@ -0,0 +1,30 @@
+From e58369f6d36bc51eb59d6afa34c1cae3ff0810ef Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 7 Aug 2017 14:10:38 +0300
+Subject: [PATCH] Makefile: build mktables using native gcc
+
+It's a throwaway helper binary used during build, and so it needs to
+be native.
+
+Upstream-Status: Inappropriate [oe specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index b3e2b63..347aaf1 100644
+--- a/Makefile
++++ b/Makefile
+@@ -323,7 +323,7 @@ version.h: version.sh version.h.in configure.ac
+ 
+ mktables: kernel-lib/mktables.c
+ 	@echo "    [CC]     $@"
+-	$(Q)$(CC) $(CFLAGS) $< -o $@
++	$(Q)$(BUILD_CC) $(BUILD_CFLAGS) $< -o $@
+ 
+ kernel-lib/tables.c: mktables
+ 	@echo "    [TABLE]  $@"
+-- 
+2.13.2
+
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.11.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.12.bb
similarity index 88%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_4.11.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_4.12.bb
index a7b42e9546b..c3cc89c2b0f 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.11.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.12.bb
@@ -14,8 +14,10 @@ DEPENDS = "util-linux attr e2fsprogs lzo acl"
 DEPENDS_append_class-target = " udev"
 RDEPENDS_${PN} = "libgcc"
 
-SRCREV = "88221fc081a7a0979a012f243b66cf097382cc8f"
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git"
+SRCREV = "0607132c3200bcead1426e6dc685432008de95de"
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
+           file://0001-Makefile-build-mktables-using-native-gcc.patch \
+           "
 
 inherit autotools-brokensep pkgconfig manpages
 
-- 
2.13.2



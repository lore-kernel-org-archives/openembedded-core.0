Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 581E475894
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 16:01:52 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 28 Sep 2015 09:01:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,603,1437462000"; d="scan'208";a="814596728"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 28 Sep 2015 09:01:45 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 6250E6A4087;
	Mon, 28 Sep 2015 09:00:49 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Sep 2015 19:01:34 +0300
Message-Id: <1443456094-6220-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] recipes-extended: remove duplicate recipe and .wks
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
X-List-Received-Date: Mon, 28 Sep 2015 16:01:57 -0000

Removed wic-image-minimal.bb and wic-image-minimal.wks as they're
also present in meta-selftest/recipes-test/images/

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/recipes-extended/images/wic-image-minimal.bb  | 14 --------------
 meta/recipes-extended/images/wic-image-minimal.wks | 10 ----------
 2 files changed, 24 deletions(-)
 delete mode 100644 meta/recipes-extended/images/wic-image-minimal.bb
 delete mode 100644 meta/recipes-extended/images/wic-image-minimal.wks

diff --git a/meta/recipes-extended/images/wic-image-minimal.bb b/meta/recipes-extended/images/wic-image-minimal.bb
deleted file mode 100644
index 073c569..0000000
--- a/meta/recipes-extended/images/wic-image-minimal.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "An example of partitioned image."
-
-IMAGE_INSTALL = "packagegroup-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP}"
-
-IMAGE_FSTYPES = "wic.bz2"
-RM_OLD_IMAGE = "1"
-
-# core-image-minimal is referenced in .wks, so we need its rootfs
-# to be ready before our rootfs
-do_rootfs[depends] += "core-image-minimal:do_rootfs"
-
-IMAGE_ROOTFS_EXTRA_SPACE = "2000"
-
-inherit image
diff --git a/meta/recipes-extended/images/wic-image-minimal.wks b/meta/recipes-extended/images/wic-image-minimal.wks
deleted file mode 100644
index 29cd8f2..0000000
--- a/meta/recipes-extended/images/wic-image-minimal.wks
+++ /dev/null
@@ -1,10 +0,0 @@
-# short-description: Example of partitioned image with complex layout
-# long-description: This image contains boot partition and 3 rootfs partitions
-# created from core-image-minimal and wic-image-minimal image recipes.
-
-part /boot --source bootimg-pcbios --ondisk sda --label boot --active --align 1024
-part / --source rootfs --ondisk sda --fstype=ext2 --label platform --align 1024
-part /core --source rootfs --rootfs-dir=core-image-minimal --ondisk sda --fstype=ext2 --label core --align 1024
-part /backup --source rootfs --rootfs-dir=wic-image-minimal --ondisk sda --fstype=ext2 --label backup --align 1024
-
-bootloader  --timeout=0  --append="rootwait console=tty0"
-- 
2.1.4



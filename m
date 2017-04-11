Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 8086277CE4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 18:24:09 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 11 Apr 2017 11:24:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,186,1488873600"; d="scan'208";a="86189916"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 11 Apr 2017 11:24:10 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id AD01A6A4006;
	Tue, 11 Apr 2017 11:24:00 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Apr 2017 21:11:32 +0300
Message-Id: <1491934292-32582-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] wic-image-minimal: stop using core-image-minimal
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
X-List-Received-Date: Tue, 11 Apr 2017 18:24:09 -0000

Removed dependency to core-image-minimal rootfs from the
recipe and .wks file. This was a bad idea as recipes are
not allowed to use other recipe's rootfs or anything else
from workdir.

This should also fix test_qemu test case when rm_work is
enabled.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta-selftest/recipes-test/images/wic-image-minimal.bb  | 4 ----
 meta-selftest/recipes-test/images/wic-image-minimal.wks | 3 +--
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta-selftest/recipes-test/images/wic-image-minimal.bb b/meta-selftest/recipes-test/images/wic-image-minimal.bb
index 9594697..e1da203 100644
--- a/meta-selftest/recipes-test/images/wic-image-minimal.bb
+++ b/meta-selftest/recipes-test/images/wic-image-minimal.bb
@@ -10,10 +10,6 @@ WKS_FILE_DEPENDS = "syslinux syslinux-native dosfstools-native mtools-native gpt
 
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-# core-image-minimal is referenced in .wks, so we need its rootfs
-# to be ready before our rootfs
-do_rootfs[depends] += "core-image-minimal:do_image core-image-minimal:do_rootfs_wicenv"
-
 IMAGE_ROOTFS_EXTRA_SPACE = "2000"
 
 inherit image
diff --git a/meta-selftest/recipes-test/images/wic-image-minimal.wks b/meta-selftest/recipes-test/images/wic-image-minimal.wks
index 3e08cf4..9410b68 100644
--- a/meta-selftest/recipes-test/images/wic-image-minimal.wks
+++ b/meta-selftest/recipes-test/images/wic-image-minimal.wks
@@ -4,7 +4,6 @@
 
 part /boot --source bootimg-pcbios --ondisk sda --label boot --active --align 1024
 part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024 --use-uuid
-part /mnt --source rootfs --rootfs-dir=core-image-minimal --ondisk sda --fstype=ext4 --label core --align 1024
-part backup --source rootfs --rootfs-dir=wic-image-minimal --ondisk sda --fstype=ext4 --label backup --align 1024
+part /mnt --source rootfs --rootfs-dir=wic-image-minimal --ondisk sda --fstype=ext4 --label core --align 1024
 
 bootloader --ptable gpt --timeout=0  --append="rootwait console=tty0"
-- 
2.1.4



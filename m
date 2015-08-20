Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id CF8BF76AB4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 11:56:57 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 20 Aug 2015 04:56:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,714,1432623600"; d="scan'208";a="787471399"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 20 Aug 2015 04:56:58 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 72AD56A4005
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 04:56:09 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Aug 2015 14:56:26 +0300
Message-Id: <c2dd466f15d2190e2bf0f41daddd7bf10da4ce4f.1440071413.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1440071413.git.ed.bartosh@linux.intel.com>
References: <cover.1440071413.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1440071413.git.ed.bartosh@linux.intel.com>
References: <cover.1440071413.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 13/17] wic-image-minimal: add wic image recipe and .wks
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
X-List-Received-Date: Thu, 20 Aug 2015 11:56:58 -0000

Added example of recipe and .wks file to create partitioned image.

This image is using quite complex partitioning scheme.
It uses its own rootfs to populate two partitions in two different ways.
It also uses core-image-minimal rootfs to populate another partition.

This is how wic reports about artifacts used to create this image:
  ROOTFS_DIR: tmp/work/qemux86_64-poky-linux/wic-image-minimal/1.0-r0/rootfs
  ROOTFS_DIR["/core"]: tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs
  ROOTFS_DIR["/backup"]: tmp/work/qemux86_64-poky-linux/wic-image-minimal/1.0-r0/rootfs
  BOOTIMG_DIR: tmp/sysroots/qemux86-64/usr/share
  KERNEL_DIR: tmp/deploy/images/qemux86-64
  NATIVE_SYSROOT: tmp/sysroots/x86_64-linux

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/recipes-extended/images/wic-image-minimal.bb  | 14 ++++++++++++++
 meta/recipes-extended/images/wic-image-minimal.wks | 10 ++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-extended/images/wic-image-minimal.bb
 create mode 100644 meta/recipes-extended/images/wic-image-minimal.wks

diff --git a/meta/recipes-extended/images/wic-image-minimal.bb b/meta/recipes-extended/images/wic-image-minimal.bb
new file mode 100644
index 0000000..073c569
--- /dev/null
+++ b/meta/recipes-extended/images/wic-image-minimal.bb
@@ -0,0 +1,14 @@
+SUMMARY = "An example of partitioned image."
+
+IMAGE_INSTALL = "packagegroup-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP}"
+
+IMAGE_FSTYPES = "wic.bz2"
+RM_OLD_IMAGE = "1"
+
+# core-image-minimal is referenced in .wks, so we need its rootfs
+# to be ready before our rootfs
+do_rootfs[depends] += "core-image-minimal:do_rootfs"
+
+IMAGE_ROOTFS_EXTRA_SPACE = "2000"
+
+inherit image
diff --git a/meta/recipes-extended/images/wic-image-minimal.wks b/meta/recipes-extended/images/wic-image-minimal.wks
new file mode 100644
index 0000000..29cd8f2
--- /dev/null
+++ b/meta/recipes-extended/images/wic-image-minimal.wks
@@ -0,0 +1,10 @@
+# short-description: Example of partitioned image with complex layout
+# long-description: This image contains boot partition and 3 rootfs partitions
+# created from core-image-minimal and wic-image-minimal image recipes.
+
+part /boot --source bootimg-pcbios --ondisk sda --label boot --active --align 1024
+part / --source rootfs --ondisk sda --fstype=ext2 --label platform --align 1024
+part /core --source rootfs --rootfs-dir=core-image-minimal --ondisk sda --fstype=ext2 --label core --align 1024
+part /backup --source rootfs --rootfs-dir=wic-image-minimal --ondisk sda --fstype=ext2 --label backup --align 1024
+
+bootloader  --timeout=0  --append="rootwait console=tty0"
-- 
2.1.4



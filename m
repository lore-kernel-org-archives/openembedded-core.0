Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QlyuZ-00028m-Mr
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 09:52:12 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Jul 2011 00:47:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,275,1309762800"; d="scan'208";a="31949393"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.61])
	by azsmga001.ch.intel.com with ESMTP; 27 Jul 2011 00:47:36 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2011 00:47:22 -0700
Message-Id: <bfa80fa1aadef06de82d6347a22eac5c6868d4cc.1311752531.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
Subject: [Consolidated & Tested 32/35] Remove -live.bb recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Jul 2011 07:52:13 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta-rt/images/core-image-minimal-rt-live.bb       |   15 --------------
 meta/recipes-core/images/core-image-live.inc       |   21 --------------------
 .../recipes-core/images/core-image-minimal-live.bb |   11 ----------
 .../recipes-extended/images/core-image-lsb-live.bb |   11 ----------
 .../images/core-image-lsb-sdk-live.bb              |   11 ----------
 meta/recipes-sato/images/core-image-sato-live.bb   |   11 ----------
 .../images/core-image-sato-sdk-live.bb             |   11 ----------
 7 files changed, 0 insertions(+), 91 deletions(-)
 delete mode 100644 meta-rt/images/core-image-minimal-rt-live.bb
 delete mode 100644 meta/recipes-core/images/core-image-live.inc
 delete mode 100644 meta/recipes-core/images/core-image-minimal-live.bb
 delete mode 100644 meta/recipes-extended/images/core-image-lsb-live.bb
 delete mode 100644 meta/recipes-extended/images/core-image-lsb-sdk-live.bb
 delete mode 100644 meta/recipes-sato/images/core-image-sato-live.bb
 delete mode 100644 meta/recipes-sato/images/core-image-sato-sdk-live.bb

diff --git a/meta-rt/images/core-image-minimal-rt-live.bb b/meta-rt/images/core-image-minimal-rt-live.bb
deleted file mode 100644
index 9e0fdba..0000000
--- a/meta-rt/images/core-image-minimal-rt-live.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-#
-# Copyright (C) 2010 Intel Corporation.
-#
-
-DESCRIPTION = "Bootable Live Minimal Real-Time Linux Image"
-
-require recipes-core/images/core-image-live.inc
-
-LABELS += "boot install"
-
-ROOTFS = "${DEPLOY_DIR_IMAGE}/core-image-minimal-rt-${MACHINE}.ext3"
-
-LICENSE = "MIT"
-
-do_bootimg[depends] += "core-image-minimal-rt:do_rootfs"
diff --git a/meta/recipes-core/images/core-image-live.inc b/meta/recipes-core/images/core-image-live.inc
deleted file mode 100644
index 2c9b3fb..0000000
--- a/meta/recipes-core/images/core-image-live.inc
+++ /dev/null
@@ -1,21 +0,0 @@
-AUTO_SYSLINUXCFG = "1"
-INITRD = "${DEPLOY_DIR_IMAGE}/core-image-minimal-initramfs-${MACHINE}.cpio.gz"
-APPEND += "root=/dev/ram0 "
-TIMEOUT = "10"
-
-EXCLUDE_FROM_WORLD = "1"
-
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-
-do_bootimg[depends] += "core-image-minimal-initramfs:do_rootfs"
-
-inherit bootimg
-
-do_bootimg_prepend () {
-	import bb
-	fstypes = bb.data.getVar('IMAGE_FSTYPES', d, True)
-	if 'ext3' not in fstypes:
-		bb.msg.fatal(bb.msg.domain.Build, "ext3 not in IMAGE_FSTYPES")
-}
-
diff --git a/meta/recipes-core/images/core-image-minimal-live.bb b/meta/recipes-core/images/core-image-minimal-live.bb
deleted file mode 100644
index 0ce2afb..0000000
--- a/meta/recipes-core/images/core-image-minimal-live.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-DESCRIPTION = "Minimal Bootable Live Image"
-
-require core-image-live.inc
-
-LABELS += "boot install"
-
-ROOTFS = "${DEPLOY_DIR_IMAGE}/core-image-minimal-${MACHINE}.ext3"
-
-LICENSE = "MIT"
-
-do_bootimg[depends] += "core-image-minimal:do_rootfs"
diff --git a/meta/recipes-extended/images/core-image-lsb-live.bb b/meta/recipes-extended/images/core-image-lsb-live.bb
deleted file mode 100644
index 72f10f7..0000000
--- a/meta/recipes-extended/images/core-image-lsb-live.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-DESCRIPTION = "LSB Bootable Live Image"
-
-require recipes-core/images/core-image-live.inc
-
-LABELS += "boot install"
-
-ROOTFS = "${DEPLOY_DIR_IMAGE}/core-image-lsb-${MACHINE}.ext3"
-
-LICENSE = "MIT"
-
-do_bootimg[depends] += "core-image-lsb:do_rootfs"
diff --git a/meta/recipes-extended/images/core-image-lsb-sdk-live.bb b/meta/recipes-extended/images/core-image-lsb-sdk-live.bb
deleted file mode 100644
index b01ae06..0000000
--- a/meta/recipes-extended/images/core-image-lsb-sdk-live.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-DESCRIPTION = "LSB SDK Bootable Live Image"
-
-require recipes-core/images/core-image-live.inc
-
-LABELS += "boot install"
-
-ROOTFS = "${DEPLOY_DIR_IMAGE}/core-image-lsb-sdk-${MACHINE}.ext3"
-
-LICENSE = "MIT"
-
-do_bootimg[depends] += "core-image-lsb-sdk:do_rootfs"
diff --git a/meta/recipes-sato/images/core-image-sato-live.bb b/meta/recipes-sato/images/core-image-sato-live.bb
deleted file mode 100644
index 9511ca6..0000000
--- a/meta/recipes-sato/images/core-image-sato-live.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-DESCRIPTION = "Sato Bootable Live Image"
-
-require recipes-core/images/core-image-live.inc
-
-LABELS += "boot install"
-
-ROOTFS = "${DEPLOY_DIR_IMAGE}/core-image-sato-${MACHINE}.ext3"
-
-LICENSE = "MIT"
-
-do_bootimg[depends] += "core-image-sato:do_rootfs"
diff --git a/meta/recipes-sato/images/core-image-sato-sdk-live.bb b/meta/recipes-sato/images/core-image-sato-sdk-live.bb
deleted file mode 100644
index f11d895..0000000
--- a/meta/recipes-sato/images/core-image-sato-sdk-live.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-DESCRIPTION = "Bootable Live Sato SDK Image"
-
-require recipes-core/images/core-image-live.inc
-
-LABELS += "boot install"
-
-ROOTFS = "${DEPLOY_DIR_IMAGE}/core-image-sato-sdk-${MACHINE}.ext3"
-
-LICENSE = "MIT"
-
-do_bootimg[depends] += "core-image-sato-sdk:do_rootfs"
-- 
1.7.3.4




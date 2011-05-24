Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QOlJj-0000Ef-Nw
	for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 08:42:11 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 May 2011 23:39:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,260,1304319600"; 
   d="scan'208";a="6647276"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.133])
	by fmsmga002.fm.intel.com with ESMTP; 23 May 2011 23:38:07 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 May 2011 23:38:03 -0700
Message-Id: <53e096ed690901bafdc3087b1591db60d16c6d0b.1306218459.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306218459.git.sgw@linux.intel.com>
References: <cover.1306218459.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306218459.git.sgw@linux.intel.com>
References: <cover.1306218459.git.sgw@linux.intel.com>
Subject: [RFC 1/2] IMAGE_ROOTFS_SIZE Cleanup
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
X-List-Received-Date: Tue, 24 May 2011 06:42:12 -0000

This basic cleanup removes the _ext2/3 overrides from places they
no longer belong since they did not allow further overrides. In doing
this the core-image-minimal* recipes can now set a reasonably small
rootfs so that it's a realistic size for minimal.

The new default for minimal is 8M and will be adujsted upward by the
IMAGE_OVERHEAD_FACTOR (of 1.2).

This fixes the ROOTFS_SIZE usage in the IMAGE_CMD_<fstype> code

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/image_types.bbclass                   |    7 +++++--
 meta/conf/distro/include/default-distrovars.inc    |    2 --
 meta/conf/machine/include/qemu.inc                 |    2 --
 .../images/core-image-minimal-initramfs.bb         |    2 ++
 meta/recipes-core/images/core-image-minimal.bb     |    2 ++
 5 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index ec0cafd..69f859e 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -21,22 +21,25 @@ runimagecmd () {
 }
 
 IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 ${EXTRA_IMAGECMD}"
+
 IMAGE_CMD_cramfs = "mkcramfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cramfs ${EXTRA_IMAGECMD}"
+
 IMAGE_CMD_ext2 = "genext2fs -b $ROOTFS_SIZE -d ${IMAGE_ROOTFS} ${EXTRA_IMAGECMD} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2"
 IMAGE_CMD_ext2.gz () {
 	rm -rf ${DEPLOY_DIR_IMAGE}/tmp.gz && mkdir ${DEPLOY_DIR_IMAGE}/tmp.gz
-	genext2fs -b ${IMAGE_ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${EXTRA_IMAGECMD} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2
+	genext2fs -b $ROOTFS_SIZE -d ${IMAGE_ROOTFS} ${EXTRA_IMAGECMD} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2
 	gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2
 	mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2.gz
 	rmdir ${DEPLOY_DIR_IMAGE}/tmp.gz
 }
+
 IMAGE_CMD_ext3 () {
 	genext2fs -b $ROOTFS_SIZE -d ${IMAGE_ROOTFS} ${EXTRA_IMAGECMD} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3
 	tune2fs -j ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3
 }
 IMAGE_CMD_ext3.gz () {
 	rm -rf ${DEPLOY_DIR_IMAGE}/tmp.gz && mkdir ${DEPLOY_DIR_IMAGE}/tmp.gz
-	genext2fs -b ${IMAGE_ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${EXTRA_IMAGECMD} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3
+	genext2fs -b $ROOTFS_SIZE -d ${IMAGE_ROOTFS} ${EXTRA_IMAGECMD} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3
 	tune2fs -j ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3
 	gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3
 	mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3.gz
diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 1aa45c8..4b68a0a 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -1,7 +1,5 @@
 QA_LOGFILE = "${TMPDIR}/qa.log"
 
-IMAGE_ROOTFS_SIZE_ext2 ?= "131072"
-
 OEINCLUDELOGS ?= "yes"
 KERNEL_CONSOLE ?= "ttyS0"
 
diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index 4122a88..9ef242f 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -6,8 +6,6 @@ MACHINE_FEATURES = "kernel26 apm alsa pcmcia bluetooth irda usbgadget screen"
 IMAGE_FSTYPES ?= "tar.bz2 ext3"
 
 ROOT_FLASH_SIZE = "280"
-IMAGE_ROOTFS_SIZE_ext2 ?= "280000"
-IMAGE_ROOTFS_SIZE_ext3 ?= "280000"
 
 # Don't include kernels in standard images
 RDEPENDS_kernel-base = ""
diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/meta/recipes-core/images/core-image-minimal-initramfs.bb
index 21aaa6c..3246d5c 100644
--- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
+++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
@@ -8,3 +8,5 @@ IMAGE_LINGUAS = ""
 LICENSE = "MIT"
 
 inherit core-image
+
+IMAGE_ROOTFS_SIZE = "8192"
diff --git a/meta/recipes-core/images/core-image-minimal.bb b/meta/recipes-core/images/core-image-minimal.bb
index aa00e67..743e121 100644
--- a/meta/recipes-core/images/core-image-minimal.bb
+++ b/meta/recipes-core/images/core-image-minimal.bb
@@ -9,5 +9,7 @@ LICENSE = "MIT"
 
 inherit core-image
 
+IMAGE_ROOTFS_SIZE = "8192"
+
 # remove not needed ipkg informations
 ROOTFS_POSTPROCESS_COMMAND += "remove_packaging_data_files ; "
-- 
1.7.3.4




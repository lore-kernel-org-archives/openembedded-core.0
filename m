Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QP9hD-0002N1-5x
	for openembedded-core@lists.openembedded.org;
	Wed, 25 May 2011 10:44:04 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 25 May 2011 01:40:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,266,1304319600"; 
   d="scan'208";a="1223595"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.133])
	by azsmga001.ch.intel.com with ESMTP; 25 May 2011 01:40:53 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2011 01:40:38 -0700
Message-Id: <d3f6e1e6106ab539e73c19037915b2e4a5f2efa9.1306312621.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306312621.git.sgw@linux.intel.com>
References: <cover.1306312621.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306312621.git.sgw@linux.intel.com>
References: <cover.1306312621.git.sgw@linux.intel.com>
Subject: [Updated Consolidated Pull 16/19] IMAGE_ROOTFS_SIZE Cleanup
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
X-List-Received-Date: Wed, 25 May 2011 08:44:04 -0000

This basic cleanup removes the _ext2/3 overrides from places they
no longer belong since they did not allow further overrides. In doing
this the core-image-minimal* recipes can now set a reasonably small
rootfs so that it's a realistic size for minimal.

The new default for minimal is 8M and will be adujsted upward by the
IMAGE_OVERHEAD_FACTOR (default of 1.3).

This also fixes the ROOTFS_SIZE usage in the IMAGE_CMD_<fstype> code

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/image_types.bbclass                   |    7 +++++--
 meta/conf/bitbake.conf                             |    4 ----
 meta/conf/distro/include/default-distrovars.inc    |    2 --
 meta/conf/machine/include/qemu.inc                 |    2 --
 .../images/core-image-minimal-initramfs.bb         |    2 ++
 meta/recipes-core/images/core-image-minimal.bb     |    2 ++
 6 files changed, 9 insertions(+), 10 deletions(-)

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
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index a0af672..18028f3 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -645,10 +645,6 @@ PCMCIA_MANAGER ?= "pcmcia-cs"
 DEFAULT_TASK_PROVIDER ?= "task-base"
 MACHINE_TASK_PROVIDER ?= "${DEFAULT_TASK_PROVIDER}"
 IMAGE_ROOTFS_SIZE ?= "65536"
-IMAGE_ROOTFS_SIZE_ext2 ?= "65536"
-IMAGE_ROOTFS_SIZE_ext2.gz ?= "65536"
-IMAGE_ROOTFS_SIZE_ext3 ?= "65536"
-IMAGE_ROOTFS_SIZE_ext3.gz ?= "65536"
 
 # Forcefully set CACHE now so future changes to things like 
 # MACHINE don't change the path to the cache
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




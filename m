Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1Q2lyK-0006pg-CZ
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Mar 2011 15:57:12 +0100
Received: by rex (Postfix, from userid 1000)
	id C378E21AB2; Thu, 24 Mar 2011 14:49:29 +0000 (GMT)
Message-Id: <3c534247e08700eb18b27886d80e874006ee0cb8.1300978024.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1300978024.git.richard.purdie@linuxfoundation.org>
References: <cover.1300978024.git.richard.purdie@linuxfoundation.org>
Old-Date: Thu, 24 Mar 2011 14:32:40 +0000
Date: Thu, 24 Mar 2011 14:49:29 +0000
To: openembedded-core@lists.openembedded.org
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/2] image_types.bbclass: Drop IMAGE_EXTRA_OPTION in favour of the more standard EXTRA_IMAGECMD
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
X-List-Received-Date: Thu, 24 Mar 2011 14:57:13 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image_types.bbclass |   13 +++++++++----
 meta/conf/bitbake.conf           |    3 ---
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 5c9bcd1..f11a7ed 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -23,21 +23,21 @@ runimagecmd () {
 IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 ${EXTRA_IMAGECMD}"
 IMAGE_CMD_yaffs2 = "mkyaffs2image ${EXTRA_IMAGECMD} ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.yaffs2"
 IMAGE_CMD_cramfs = "mkcramfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cramfs ${EXTRA_IMAGECMD}"
-IMAGE_CMD_ext2 = "genext2fs -b $ROOTFS_SIZE -d ${IMAGE_ROOTFS} ${IMAGE_EXTRA_OPTION} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2 ${EXTRA_IMAGECMD}"
+IMAGE_CMD_ext2 = "genext2fs -b $ROOTFS_SIZE -d ${IMAGE_ROOTFS} ${EXTRA_IMAGECMD} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2"
 IMAGE_CMD_ext2.gz () {
 	rm -rf ${DEPLOY_DIR_IMAGE}/tmp.gz && mkdir ${DEPLOY_DIR_IMAGE}/tmp.gz
-	genext2fs -b ${IMAGE_ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${IMAGE_EXTRA_OPTION} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2 ${EXTRA_IMAGECMD}
+	genext2fs -b ${IMAGE_ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${EXTRA_IMAGECMD} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2
 	gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2
 	mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2.gz
 	rmdir ${DEPLOY_DIR_IMAGE}/tmp.gz
 }
 IMAGE_CMD_ext3 () {
-	genext2fs -b $ROOTFS_SIZE -d ${IMAGE_ROOTFS} ${IMAGE_EXTRA_OPTION} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}
+	genext2fs -b $ROOTFS_SIZE -d ${IMAGE_ROOTFS} ${EXTRA_IMAGECMD} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3
 	tune2fs -j ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3
 }
 IMAGE_CMD_ext3.gz () {
 	rm -rf ${DEPLOY_DIR_IMAGE}/tmp.gz && mkdir ${DEPLOY_DIR_IMAGE}/tmp.gz
-	genext2fs -b ${IMAGE_ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${IMAGE_EXTRA_OPTION} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}
+	genext2fs -b ${IMAGE_ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${EXTRA_IMAGECMD} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3
 	tune2fs -j ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3
 	gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3
 	mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3.gz
@@ -65,6 +65,11 @@ IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_
 EXTRA_IMAGECMD = ""
 EXTRA_IMAGECMD_jffs2 = "--pad --little-endian --eraseblock=0x40000"
 EXTRA_IMAGECMD_yaffs2 = "1"
+# Change these if you want default genext2fs behavior (i.e. create minimal inode number)
+EXTRA_IMAGECMD_ext2 ?= "-i 8192"
+EXTRA_IMAGECMD_ext2.gz ?= "-i 8192"
+EXTRA_IMAGECMD_ext3 ?= "-i 8192"
+EXTRA_IMAGECMD_ext3.gz ?= "-i 8192"
 
 IMAGE_DEPENDS = ""
 IMAGE_DEPENDS_jffs2 = "mtd-utils-native"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8e89945..6b6b2ee 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -352,9 +352,6 @@ IMAGE_LINK_NAME = "${IMAGE_BASENAME}-${MACHINE}"
 # fixed extra space
 IMAGE_OVERHEAD_FACTOR ?= 1.3
 
-# Comment this option if you want default genext2fs behavior (i.e. create minimal inode number)
-IMAGE_EXTRA_OPTION ?= "-i 8192"
-
 EXTRA_IMAGEDEPENDS = ""
 
 ##################################################################
-- 
1.7.4.1




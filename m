Received: from db3ehsobe005.messaging.microsoft.com ([213.199.154.143]
	helo=DB3EHSOBE005.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1R98Rg-0000f2-SB
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 06:42:04 +0200
Received: from mail25-db3-R.bigfish.com (10.3.81.248) by
	DB3EHSOBE005.bigfish.com (10.3.84.25) with Microsoft SMTP Server id
	14.1.225.22; Thu, 29 Sep 2011 04:21:26 +0000
Received: from mail25-db3 (localhost.localdomain [127.0.0.1])	by
	mail25-db3-R.bigfish.com (Postfix) with ESMTP id 541CB190314	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 04:21:26 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h65h)
X-Spam-TCS-SCL: 4:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail25-db3 (localhost.localdomain [127.0.0.1]) by mail25-db3
	(MessageSwitch) id 131727008651072_11812;
	Thu, 29 Sep 2011 04:21:26 +0000 (UTC)
Received: from DB3EHSMHS002.bigfish.com (unknown [10.3.81.240])	by
	mail25-db3.bigfish.com (Postfix) with ESMTP id 03057748059	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 04:21:26 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS002.bigfish.com
	(10.3.87.102) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 29 Sep 2011 04:21:25 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server id 14.1.323.7; Wed, 28 Sep 2011 23:21:12 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	p8T4LAKr024559	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 23:21:11 -0500 (CDT)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Sep 2011 23:20:58 -0500
Message-ID: <1317270070-14250-4-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <1317270070-14250-1-git-send-email-msm@freescale.com>
References: <1317270070-14250-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 04/16] Add support for generating ext2.bz2{, .u-boot} images
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
X-List-Received-Date: Thu, 29 Sep 2011 04:42:05 -0000
Content-Type: text/plain

Machines can now add ext2.bz2 and ext2.bz2.u-boot images as a
generated image type. This also adds an extra parameter to
oe_mkimage which is the image compression type for mkimage

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/classes/image_types.bbclass       |    9 ++++++++-
 meta/classes/image_types_uboot.bbclass |   14 +++++++++-----
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index c24b326..4619ebe 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -46,6 +46,13 @@ IMAGE_CMD_ext2.gz () {
 	mv ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}/${IMAGE_NAME}.rootfs.ext2.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2.gz
 	rmdir ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}
 }
+IMAGE_CMD_ext2.bz2 () {
+	rm -rf ${DEPLOY_DIR_IMAGE}/tmp.gz && mkdir ${DEPLOY_DIR_IMAGE}/tmp.gz
+	genext2fs -b $ROOTFS_SIZE -d ${IMAGE_ROOTFS} ${EXTRA_IMAGECMD} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2
+	bzip2 -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2
+	mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2.bz2 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2.bz2
+	rmdir ${DEPLOY_DIR_IMAGE}/tmp.gz
+}
 
 IMAGE_CMD_ext3 () {
 	genext2fs -b $ROOTFS_SIZE -d ${IMAGE_ROOTFS} ${EXTRA_IMAGECMD} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3
@@ -141,4 +148,4 @@ IMAGE_DEPENDS_ubi = "mtd-utils-native"
 IMAGE_DEPENDS_ubifs = "mtd-utils-native"
 
 # This variable is available to request which values are suitable for IMAGE_FSTYPES
-IMAGE_TYPES = "jffs2 cramfs ext2 ext2.gz ext3 ext3.gz live squashfs squashfs-lzma ubi tar tar.gz tar.bz2 tar.xz cpio cpio.gz cpio.xz cpio.lzma"
+IMAGE_TYPES = "jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz live squashfs squashfs-lzma ubi tar tar.gz tar.bz2 tar.xz cpio cpio.gz cpio.xz cpio.lzma"
diff --git a/meta/classes/image_types_uboot.bbclass b/meta/classes/image_types_uboot.bbclass
index 10fa2f7..aee88a6 100644
--- a/meta/classes/image_types_uboot.bbclass
+++ b/meta/classes/image_types_uboot.bbclass
@@ -1,20 +1,24 @@
 inherit image_types kernel-arch
 
 oe_mkimage () {
-    mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk -C gzip -n ${IMAGE_NAME} \
+    mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk -C $2 -n ${IMAGE_NAME} \
         -d ${DEPLOY_DIR_IMAGE}/$1 ${DEPLOY_DIR_IMAGE}/$1.u-boot
 }
 
 IMAGE_DEPENDS_ext2.gz.u-boot = "genext2fs-native e2fsprogs-native u-boot-mkimage-native"
 IMAGE_CMD_ext2.gz.u-boot      = "${IMAGE_CMD_ext2.gz} \
-                                 oe_mkimage ${IMAGE_NAME}.rootfs.ext2.gz"
+                                 oe_mkimage ${IMAGE_NAME}.rootfs.ext2.gz gzip"
+
+IMAGE_DEPENDS_ext2.bz2.u-boot = "genext2fs-native e2fsprogs-native u-boot-mkimage-native"
+IMAGE_CMD_ext2.bz2.u-boot      = "${IMAGE_CMD_ext2.bz2} \
+                                 oe_mkimage ${IMAGE_NAME}.rootfs.ext2.bz2 bzip2"
 
 IMAGE_DEPENDS_ext3.gz.u-boot = "genext2fs-native e2fsprogs-native u-boot-mkimage-native"
 IMAGE_CMD_ext3.gz.u-boot      = "${IMAGE_CMD_ext3.gz} \
-                                 oe_mkimage ${IMAGE_NAME}.rootfs.ext3.gz"
+                                 oe_mkimage ${IMAGE_NAME}.rootfs.ext3.gz gzip"
 
 IMAGE_DEPENDS_ext4.gz.u-boot = "genext2fs-native e2fsprogs-native u-boot-mkimage-native"
 IMAGE_CMD_ext4.gz.u-boot      = "${IMAGE_CMD_ext4.gz} \
-                                 oe_mkimage ${IMAGE_NAME}.rootfs.ext4.gz"
+                                 oe_mkimage ${IMAGE_NAME}.rootfs.ext4.gz gzip"
 
-IMAGE_TYPES += "ext2.gz.u-boot ext3.gz.u-boot ext4.gz.u-boot"
+IMAGE_TYPES += "ext2.gz.u-boot ext2.bz2.u-boot ext3.gz.u-boot ext4.gz.u-boot"
-- 
1.7.6.1





Received: from db3ehsobe003.messaging.microsoft.com ([213.199.154.141]
	helo=DB3EHSOBE003.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1R98SR-0000jL-8f
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 06:42:52 +0200
Received: from mail61-db3-R.bigfish.com (10.3.81.241) by
	DB3EHSOBE003.bigfish.com (10.3.84.23) with Microsoft SMTP Server id
	14.1.225.22; Thu, 29 Sep 2011 04:22:15 +0000
Received: from mail61-db3 (localhost.localdomain [127.0.0.1])	by
	mail61-db3-R.bigfish.com (Postfix) with ESMTP id 00BCE9601A4	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 04:22:14 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h64h)
X-Spam-TCS-SCL: 3:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,
Received: from mail61-db3 (localhost.localdomain [127.0.0.1]) by mail61-db3
	(MessageSwitch) id 1317270078664762_12531;
	Thu, 29 Sep 2011 04:21:18 +0000 (UTC)
Received: from DB3EHSMHS014.bigfish.com (unknown [10.3.81.242])	by
	mail61-db3.bigfish.com (Postfix) with ESMTP id 36FAD2F0054	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 04:21:18 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS014.bigfish.com
	(10.3.87.114) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 29 Sep 2011 04:21:15 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server id 14.1.323.7; Wed, 28 Sep 2011 23:21:12 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	p8T4LAKs024559	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 23:21:12 -0500 (CDT)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Sep 2011 23:20:59 -0500
Message-ID: <1317270070-14250-5-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <1317270070-14250-1-git-send-email-msm@freescale.com>
References: <1317270070-14250-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 05/16] Add support for generating ext2.lzma{, .u-boot} images
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
X-List-Received-Date: Thu, 29 Sep 2011 04:42:52 -0000
Content-Type: text/plain

Machines can now add ext2.lzma and ext2.lzma.u-boot images as a
generated image type.

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/classes/image_types.bbclass       |   11 ++++++++++-
 meta/classes/image_types_uboot.bbclass |    6 +++++-
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 4619ebe..2260915 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -53,6 +53,13 @@ IMAGE_CMD_ext2.bz2 () {
 	mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2.bz2 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2.bz2
 	rmdir ${DEPLOY_DIR_IMAGE}/tmp.gz
 }
+IMAGE_CMD_ext2.lzma () {
+	rm -rf ${DEPLOY_DIR_IMAGE}/tmp.gz && mkdir ${DEPLOY_DIR_IMAGE}/tmp.gz
+	genext2fs -b $ROOTFS_SIZE -d ${IMAGE_ROOTFS} ${EXTRA_IMAGECMD} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2
+	lzma -f -7 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2
+	mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2.lzma ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2.lzma
+	rmdir ${DEPLOY_DIR_IMAGE}/tmp.gz
+}
 
 IMAGE_CMD_ext3 () {
 	genext2fs -b $ROOTFS_SIZE -d ${IMAGE_ROOTFS} ${EXTRA_IMAGECMD} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3
@@ -134,6 +141,8 @@ IMAGE_DEPENDS_jffs2 = "mtd-utils-native"
 IMAGE_DEPENDS_cramfs = "cramfs-native"
 IMAGE_DEPENDS_ext2 = "genext2fs-native"
 IMAGE_DEPENDS_ext2.gz = "genext2fs-native"
+IMAGE_DEPENDS_ext2.bz2 = "genext2fs-native"
+IMAGE_DEPENDS_ext2.lzma = "genext2fs-native"
 IMAGE_DEPENDS_ext3 = "genext2fs-native e2fsprogs-native"
 IMAGE_DEPENDS_ext3.gz = "genext2fs-native e2fsprogs-native"
 IMAGE_DEPENDS_ext4 = "genext2fs-native e2fsprogs-native"
@@ -148,4 +157,4 @@ IMAGE_DEPENDS_ubi = "mtd-utils-native"
 IMAGE_DEPENDS_ubifs = "mtd-utils-native"
 
 # This variable is available to request which values are suitable for IMAGE_FSTYPES
-IMAGE_TYPES = "jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz live squashfs squashfs-lzma ubi tar tar.gz tar.bz2 tar.xz cpio cpio.gz cpio.xz cpio.lzma"
+IMAGE_TYPES = "jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz ext2.lzma live squashfs squashfs-lzma ubi tar tar.gz tar.bz2 tar.xz cpio cpio.gz cpio.xz cpio.lzma"
diff --git a/meta/classes/image_types_uboot.bbclass b/meta/classes/image_types_uboot.bbclass
index aee88a6..65dc91b 100644
--- a/meta/classes/image_types_uboot.bbclass
+++ b/meta/classes/image_types_uboot.bbclass
@@ -13,6 +13,10 @@ IMAGE_DEPENDS_ext2.bz2.u-boot = "genext2fs-native e2fsprogs-native u-boot-mkimag
 IMAGE_CMD_ext2.bz2.u-boot      = "${IMAGE_CMD_ext2.bz2} \
                                  oe_mkimage ${IMAGE_NAME}.rootfs.ext2.bz2 bzip2"
 
+IMAGE_DEPENDS_ext2.lzma.u-boot = "genext2fs-native e2fsprogs-native u-boot-mkimage-native"
+IMAGE_CMD_ext2.lzma.u-boot      = "${IMAGE_CMD_ext2.lzma} \
+                                 oe_mkimage ${IMAGE_NAME}.rootfs.ext2.lzma lzma"
+
 IMAGE_DEPENDS_ext3.gz.u-boot = "genext2fs-native e2fsprogs-native u-boot-mkimage-native"
 IMAGE_CMD_ext3.gz.u-boot      = "${IMAGE_CMD_ext3.gz} \
                                  oe_mkimage ${IMAGE_NAME}.rootfs.ext3.gz gzip"
@@ -21,4 +25,4 @@ IMAGE_DEPENDS_ext4.gz.u-boot = "genext2fs-native e2fsprogs-native u-boot-mkimage
 IMAGE_CMD_ext4.gz.u-boot      = "${IMAGE_CMD_ext4.gz} \
                                  oe_mkimage ${IMAGE_NAME}.rootfs.ext4.gz gzip"
 
-IMAGE_TYPES += "ext2.gz.u-boot ext2.bz2.u-boot ext3.gz.u-boot ext4.gz.u-boot"
+IMAGE_TYPES += "ext2.gz.u-boot ext2.bz2.u-boot ext2.lzma.u-boot ext3.gz.u-boot ext4.gz.u-boot"
-- 
1.7.6.1





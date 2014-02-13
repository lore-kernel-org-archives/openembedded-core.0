Return-Path: <dbaryshkov@gmail.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 974CD6B87C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 12:06:44 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id t61so7397730wes.36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 04:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=Kd2D2zac5ri4kIStpFqGi7KSBVAIDCPp+UA91dAz6wo=;
	b=zp20jTxZwlXDZwk1q3RENTiy9Rv4XbdofshJ+oJ1pfe6T0Cm3Rxv8H0pwslDsS6F2M
	LH7iaKUCu9UXZ2Bu/c2InGglAWvCOjP6lOFeyeAVeIGQ6aA0sICPhrfm61/c0KXQPwnp
	s9vZQQvhih3GI31N2wxYdKhS1gP1pxY84Xe4XiTA9yaTlORttwMTWx6T2NK0lvodPT3l
	aVcjY5YcPrp+xW6IQg0vnA0ZxIMdb1OvB3afxkIZx18hqfZFRTzi1LPfK07iG8aFwUi7
	53rvrz+2FwreltX2FGUIBPknpzr92Bt5JyTCBy89AOd0zft8Cgx5wsPJWWzu0pB016XY
	Q/MQ==
X-Received: by 10.180.12.14 with SMTP id u14mr6235225wib.0.1392293204525;
	Thu, 13 Feb 2014 04:06:44 -0800 (PST)
Received: from fangorn.rup.mentorg.com (nat-min.mentorg.com. [139.181.32.34])
	by mx.google.com with ESMTPSA id
	z1sm4044172wjq.19.2014.02.13.04.06.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Feb 2014 04:06:43 -0800 (PST)
Sender: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Feb 2014 16:06:21 +0400
Message-Id: <1392293182-7483-1-git-send-email-dmitry_eremin@mentor.com>
X-Mailer: git-send-email 1.8.5.2
Subject: [PATCH 1/2] image_types bbclass: use compression framework for jffs2 sum images
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
X-List-Received-Date: Thu, 13 Feb 2014 12:06:45 -0000

I got hit by a missing dependency in generation of sum.jffs2 images - at
runtime, when images are generated using bitbake pool, it is possible
for sum.jffs2 image to be scheduled for generation before jffs2 image is
fully generated.

Insted of adding additional hacks, reimplement sum.jffs2 generation as a
compression scheme on top of plain jffs2 images. For now support for
sum.jffs2 images is left in, it will be removed by the subsequent
commit.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
---
 meta/classes/image_types.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 393bfa8..be56abb 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -33,6 +33,7 @@ XZ_COMPRESSION_LEVEL ?= "-e -6"
 XZ_INTEGRITY_CHECK ?= "crc32"
 XZ_THREADS ?= "-T 0"
 
+JFFS2_SUM_EXTRA_ARGS ?= ""
 IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 ${EXTRA_IMAGECMD}"
 IMAGE_CMD_sum.jffs2 = "sumtool -i ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.sum.jffs2 ${EXTRA_IMAGECMD}"
 
@@ -128,19 +129,21 @@ IMAGE_DEPENDS_ubi = "mtd-utils-native"
 IMAGE_DEPENDS_ubifs = "mtd-utils-native"
 
 # This variable is available to request which values are suitable for IMAGE_FSTYPES
-IMAGE_TYPES = "jffs2 sum.jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz ext2.lzma btrfs iso hddimg squashfs squashfs-xz ubi ubifs tar tar.gz tar.bz2 tar.xz tar.lz4 cpio cpio.gz cpio.xz cpio.lzma cpio.lz4 vmdk elf"
+IMAGE_TYPES = "jffs2 jffs2.sum sum.jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz ext2.lzma btrfs iso hddimg squashfs squashfs-xz ubi ubifs tar tar.gz tar.bz2 tar.xz tar.lz4 cpio cpio.gz cpio.xz cpio.lzma cpio.lz4 vmdk elf"
 
-COMPRESSIONTYPES = "gz bz2 lzma xz lz4"
+COMPRESSIONTYPES = "gz bz2 lzma xz lz4 sum"
 COMPRESS_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}.rootfs.${type}"
 COMPRESS_CMD_gz = "gzip -f -9 -c ${IMAGE_NAME}.rootfs.${type} > ${IMAGE_NAME}.rootfs.${type}.gz"
 COMPRESS_CMD_bz2 = "bzip2 -f -k ${IMAGE_NAME}.rootfs.${type}"
 COMPRESS_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}.rootfs.${type} > ${IMAGE_NAME}.rootfs.${type}.xz"
 COMPRESS_CMD_lz4 = "lz4c -9 -c ${IMAGE_NAME}.rootfs.${type} > ${IMAGE_NAME}.rootfs.${type}.lz4"
+COMPRESS_CMD_sum = "sumtool -i ${IMAGE_NAME}.rootfs.${type} -o ${IMAGE_NAME}.rootfs.${type}.sum ${JFFS2_SUM_EXTRA_ARGS}"
 COMPRESS_DEPENDS_lzma = "xz-native"
 COMPRESS_DEPENDS_gz = ""
 COMPRESS_DEPENDS_bz2 = ""
 COMPRESS_DEPENDS_xz = "xz-native"
 COMPRESS_DEPENDS_lz4 = "lz4-native"
+COMPRESS_DEPENDS_sum = "mtd-utils-native"
 
 RUNNABLE_IMAGE_TYPES ?= "ext2 ext3"
 RUNNABLE_MACHINE_PATTERNS ?= "qemu"
-- 
1.8.5.2



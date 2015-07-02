Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 34950607BB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jul 2015 07:19:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t627JP6a026709
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Jul 2015 00:19:25 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Thu, 2 Jul 2015 00:19:25 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 2 Jul 2015 15:18:59 +0800
Message-ID: <1435821539-20315-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] image_types_uboot: remove the middle file
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
X-List-Received-Date: Thu, 02 Jul 2015 07:19:27 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

The .gz, .bz2 or .lzma are middle files for making gz.u-boot,
bz2.u-boot, or lzma.u-boot. It should be removed once the final
image is generated. Otherwise, even RM_OLD_IMAGE = 1, it can't
be removed, moreover more and more middle files are genrated via
'bitbake *-image'

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/classes/image_types_uboot.bbclass | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/image_types_uboot.bbclass b/meta/classes/image_types_uboot.bbclass
index 07837b5..081bca2 100644
--- a/meta/classes/image_types_uboot.bbclass
+++ b/meta/classes/image_types_uboot.bbclass
@@ -3,6 +3,9 @@ inherit image_types kernel-arch
 oe_mkimage () {
     mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk -C $2 -n ${IMAGE_NAME} \
         -d ${DEPLOY_DIR_IMAGE}/$1 ${DEPLOY_DIR_IMAGE}/$1.u-boot
+    if [ x$3 = x"clean" ]; then
+        rm $1
+    fi
 }
 
 COMPRESSIONTYPES += "gz.u-boot bz2.u-boot lzma.u-boot u-boot"
@@ -11,13 +14,13 @@ COMPRESS_DEPENDS_u-boot = "u-boot-mkimage-native"
 COMPRESS_CMD_u-boot      = "oe_mkimage ${IMAGE_NAME}.rootfs.${type} none"
 
 COMPRESS_DEPENDS_gz.u-boot = "u-boot-mkimage-native"
-COMPRESS_CMD_gz.u-boot      = "${COMPRESS_CMD_gz}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.gz gzip"
+COMPRESS_CMD_gz.u-boot      = "${COMPRESS_CMD_gz}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.gz gzip clean"
 
 COMPRESS_DEPENDS_bz2.u-boot = "u-boot-mkimage-native"
-COMPRESS_CMD_bz2.u-boot      = "${COMPRESS_CMD_bz2}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.bz2 bzip2"
+COMPRESS_CMD_bz2.u-boot      = "${COMPRESS_CMD_bz2}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.bz2 bzip2 clean"
 
 COMPRESS_DEPENDS_lzma.u-boot = "u-boot-mkimage-native"
-COMPRESS_CMD_lzma.u-boot      = "${COMPRESS_CMD_lzma}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.lzma lzma"
+COMPRESS_CMD_lzma.u-boot      = "${COMPRESS_CMD_lzma}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.lzma lzma clean"
 
 IMAGE_TYPES += "ext2.u-boot ext2.gz.u-boot ext2.bz2.u-boot ext2.lzma.u-boot ext3.gz.u-boot ext4.gz.u-boot"
 
-- 
1.9.1



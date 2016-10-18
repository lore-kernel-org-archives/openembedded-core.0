Return-Path: <vesa.jaaskelainen@vaisala.com>
Received: from hel-mailgw-01.vaisala.com (hel-mailgw-01.vaisala.com
	[193.143.230.17])
	by mail.openembedded.org (Postfix) with ESMTP id E85C371998
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 15:46:41 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2CsBACPQwZY/+EBGKxcHgYMgzwBAQEBAYFwtmKCD4IIhiGCPhMBAgEBAQEBAQGBCYULDwFGGRwCJgJyoTOdMYx2DCaBB45hgnWCPh0FjzSKVJAIj3VJkDIgA4QMG4FWb4gZAQEB
X-IPAS-Result: A2CsBACPQwZY/+EBGKxcHgYMgzwBAQEBAYFwtmKCD4IIhiGCPhMBAgEBAQEBAQGBCYULDwFGGRwCJgJyoTOdMYx2DCaBB45hgnWCPh0FjzSKVJAIj3VJkDIgA4QMG4FWb4gZAQEB
X-IronPort-AV: E=Sophos;i="5.31,362,1473109200"; d="scan'208";a="32275081"
Received: from hel-smtp.corp.vaisala.com ([172.24.1.225])
	by hel-mailgw-01.vaisala.com with ESMTP; 18 Oct 2016 18:46:19 +0300
Received: from debian8-vej-yoctovm.corp.vaisala.com ([172.24.65.132]) by
	HEL-SMTP.corp.vaisala.com over TLS secured channel with
	Microsoft SMTPSVC(8.5.9600.16384); Tue, 18 Oct 2016 18:46:19 +0300
From: =?UTF-8?q?Vesa=20J=C3=A4=C3=A4skel=C3=A4inen?=
	<vesa.jaaskelainen@vaisala.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Oct 2016 18:46:09 +0300
Message-Id: <1476805570-81549-1-git-send-email-vesa.jaaskelainen@vaisala.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
X-OriginalArrivalTime: 18 Oct 2016 15:46:19.0178 (UTC)
	FILETIME=[C4BC80A0:01D22956]
Subject: [PATCH 1/2] image_types: Add support to compress initramfs with lz4
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
X-List-Received-Date: Tue, 18 Oct 2016 15:46:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changed to use lz4 as lz4c seems to be deprecated.

Removed use of redirection in favor of using output file.

As Linux kernel supports only legacy format for initial ramdisk add
COMPRESS_CMD_lz4_legacy mode in case some users are using newer format.

Signed-off-by: Vesa Jääskeläinen <vesa.jaaskelainen@vaisala.com>
---
 meta/classes/image_types.bbclass       | 3 ++-
 meta/classes/image_types_uboot.bbclass | 5 ++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index a7fffbc..772cb35 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -333,7 +333,8 @@ CONVERSION_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
 CONVERSION_CMD_gz = "gzip -f -9 -c ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
 CONVERSION_CMD_bz2 = "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
 CONVERSION_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz"
-CONVERSION_CMD_lz4 = "lz4c -9 -c ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
+CONVERSION_CMD_lz4 = "lz4 -9 -z ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
+CONVERSION_CMD_lz4_legacy = "lz4 -9 -z -l ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
 CONVERSION_CMD_zip = "zip ${ZIP_COMPRESSION_LEVEL} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.zip ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
 CONVERSION_CMD_sum = "sumtool -i ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sum ${JFFS2_SUM_EXTRA_ARGS}"
 CONVERSION_CMD_md5sum = "md5sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.md5sum"
diff --git a/meta/classes/image_types_uboot.bbclass b/meta/classes/image_types_uboot.bbclass
index 6c8c1ff..49028fa 100644
--- a/meta/classes/image_types_uboot.bbclass
+++ b/meta/classes/image_types_uboot.bbclass
@@ -8,7 +8,7 @@ oe_mkimage () {
     fi
 }
 
-CONVERSIONTYPES += "gz.u-boot bz2.u-boot lzma.u-boot u-boot"
+CONVERSIONTYPES += "gz.u-boot bz2.u-boot lz4.u-boot lzma.u-boot u-boot"
 
 CONVERSION_DEPENDS_u-boot = "u-boot-mkimage-native"
 CONVERSION_CMD_u-boot      = "oe_mkimage ${IMAGE_NAME}.rootfs.${type} none"
@@ -19,6 +19,9 @@ CONVERSION_CMD_gz.u-boot      = "${CONVERSION_CMD_gz}; oe_mkimage ${IMAGE_NAME}.
 CONVERSION_DEPENDS_bz2.u-boot = "u-boot-mkimage-native"
 CONVERSION_CMD_bz2.u-boot      = "${CONVERSION_CMD_bz2}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.bz2 bzip2 clean"
 
+CONVERSION_DEPENDS_lz4.u-boot = "u-boot-mkimage-native"
+CONVERSION_CMD_lz4.u-boot      = "${CONVERSION_CMD_lz4_legacy}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.lz4 lz4 clean"
+
 CONVERSION_DEPENDS_lzma.u-boot = "u-boot-mkimage-native"
 CONVERSION_CMD_lzma.u-boot      = "${CONVERSION_CMD_lzma}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.lzma lzma clean"
 
-- 
2.1.4



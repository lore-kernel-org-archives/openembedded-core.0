Return-Path: <sgw@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 12CC9786F4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 01:10:37 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Dec 2017 17:10:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,362,1508828400"; d="scan'208";a="184030300"
Received: from swold-mobl2.jf.intel.com ([10.24.10.97])
	by fmsmga006.fm.intel.com with ESMTP; 04 Dec 2017 17:10:36 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon,  4 Dec 2017 17:10:33 -0800
Message-Id: <20171205011035.14908-2-sgw@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171205011035.14908-1-sgw@linux.intel.com>
References: <20171205011035.14908-1-sgw@linux.intel.com>
Subject: [PATCH 1/3][RFC] image_types: Remove ELF type
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
X-List-Received-Date: Tue, 05 Dec 2017 01:10:37 -0000

As warned in a proir commit, it's time to remove the elf image type,
it is not long used anywhere (that I am aware of) and the mkelfimage
tool has been removed from the upstream coreboot code base.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/image_types.bbclass | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index d09d1277eaa..7bb9292be35 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -147,16 +147,6 @@ IMAGE_CMD_cpio () {
 	fi
 }
 
-ELF_KERNEL ?= "${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}"
-ELF_APPEND ?= "ramdisk_size=32768 root=/dev/ram0 rw console="
-
-IMAGE_CMD_elf () {
-	test -f ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.elf && rm -f ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.elf
-	mkelfImage --kernel=${ELF_KERNEL} --initrd=${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.cpio.gz --output=${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.elf --append='${ELF_APPEND}' ${EXTRA_IMAGECMD}
-}
-
-IMAGE_TYPEDEP_elf = "cpio.gz"
-
 UBI_VOLNAME ?= "${MACHINE}-rootfs"
 
 multiubi_mkfs() {
@@ -230,7 +220,6 @@ EXTRA_IMAGECMD_ext2 ?= "-i 4096"
 EXTRA_IMAGECMD_ext3 ?= "-i 4096"
 EXTRA_IMAGECMD_ext4 ?= "-i 4096"
 EXTRA_IMAGECMD_btrfs ?= "-n 4096"
-EXTRA_IMAGECMD_elf ?= ""
 
 do_image_jffs2[depends] += "mtd-utils-native:do_populate_sysroot"
 do_image_cramfs[depends] += "util-linux-native:do_populate_sysroot"
@@ -242,7 +231,6 @@ do_image_squashfs[depends] += "squashfs-tools-native:do_populate_sysroot"
 do_image_squashfs_xz[depends] += "squashfs-tools-native:do_populate_sysroot"
 do_image_squashfs_lzo[depends] += "squashfs-tools-native:do_populate_sysroot"
 do_image_squashfs_lz4[depends] += "squashfs-tools-native:do_populate_sysroot"
-do_image_elf[depends] += "virtual/kernel:do_populate_sysroot mkelfimage-native:do_populate_sysroot"
 do_image_ubi[depends] += "mtd-utils-native:do_populate_sysroot"
 do_image_ubifs[depends] += "mtd-utils-native:do_populate_sysroot"
 do_image_multiubi[depends] += "mtd-utils-native:do_populate_sysroot"
@@ -261,7 +249,6 @@ IMAGE_TYPES = " \
     ubi ubifs multiubi \
     tar tar.gz tar.bz2 tar.xz tar.lz4 \
     cpio cpio.gz cpio.xz cpio.lzma cpio.lz4 \
-    elf \
     wic wic.gz wic.bz2 wic.lzma \
     container \
 "
-- 
2.13.6



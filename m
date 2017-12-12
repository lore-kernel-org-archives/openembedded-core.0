Return-Path: <sgw@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id D788A78858
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 00:32:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Dec 2017 16:32:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,393,1508828400"; 
   d="scan'208";a="2042602"
Received: from swold-mobl2.jf.intel.com (HELO swold-mobl2.amr.intel.com)
	([10.254.41.228])
	by orsmga006.jf.intel.com with ESMTP; 11 Dec 2017 16:32:06 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon, 11 Dec 2017 16:32:01 -0800
Message-Id: <20171212003202.4209-4-sgw@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171212003202.4209-1-sgw@linux.intel.com>
References: <20171212003202.4209-1-sgw@linux.intel.com>
Subject: [PATCH v2 3/4] image_types: Remove ELF type
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
X-List-Received-Date: Tue, 12 Dec 2017 00:32:05 -0000

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



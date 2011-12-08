Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RYZhC-0007dK-9M
	for openembedded-core@openembedded.org; Thu, 08 Dec 2011 09:51:14 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 08 Dec 2011 00:44:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="99987697"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.35])
	by fmsmga002.fm.intel.com with ESMTP; 08 Dec 2011 00:44:19 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Thu,  8 Dec 2011 00:44:02 -0800
Message-Id: <2cb6a0d7aaa1ba712a899ee77a4c720da4e50214.1323333676.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1323333676.git.sgw@linux.intel.com>
References: <cover.1323333676.git.sgw@linux.intel.com>
In-Reply-To: <cover.1323333676.git.sgw@linux.intel.com>
References: <cover.1323333676.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 02/17] image_types.bbclass: implement jffs2 summary images (sum.jffs2)
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
X-List-Received-Date: Thu, 08 Dec 2011 08:51:14 -0000

From: Andrea Adami <andrea.adami@gmail.com>

* Building the jffs2 filesystem to include summary information speeds up
* the mount process considerably at the cost of increased size.
* The rate of speedup is generally higher on NAND chips and on the chips
* where the erase block size is large.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta/classes/image_types.bbclass |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 29b6380..bd4b7bc 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -35,6 +35,8 @@ XZ_COMPRESSION_LEVEL ?= "-e -9"
 XZ_INTEGRITY_CHECK ?= "crc32"
 
 IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 ${EXTRA_IMAGECMD}"
+IMAGE_CMD_sum.jffs2 = "${IMAGE_CMD_jffs2} && sumtool -i ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 \
+	-o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.sum.jffs2 ${EXTRA_IMAGECMD}"
 
 IMAGE_CMD_cramfs = "mkcramfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cramfs ${EXTRA_IMAGECMD}"
 
@@ -138,6 +140,7 @@ EXTRA_IMAGECMD_btrfs ?= ""
 
 IMAGE_DEPENDS = ""
 IMAGE_DEPENDS_jffs2 = "mtd-utils-native"
+IMAGE_DEPENDS_sum.jffs2 = "mtd-utils-native"
 IMAGE_DEPENDS_cramfs = "cramfs-native"
 IMAGE_DEPENDS_ext2 = "genext2fs-native"
 IMAGE_DEPENDS_ext2.gz = "genext2fs-native"
@@ -157,4 +160,4 @@ IMAGE_DEPENDS_ubi = "mtd-utils-native"
 IMAGE_DEPENDS_ubifs = "mtd-utils-native"
 
 # This variable is available to request which values are suitable for IMAGE_FSTYPES
-IMAGE_TYPES = "jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz ext2.lzma live squashfs squashfs-lzma ubi tar tar.gz tar.bz2 tar.xz cpio cpio.gz cpio.xz cpio.lzma"
+IMAGE_TYPES = "jffs2 sum.jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz ext2.lzma live squashfs squashfs-lzma ubi tar tar.gz tar.bz2 tar.xz cpio cpio.gz cpio.xz cpio.lzma"
-- 
1.7.6.4




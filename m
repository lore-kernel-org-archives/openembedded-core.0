Received: from smtp205.alice.it ([82.57.200.101])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RY4Xo-0007bg-H0
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 00:35:28 +0100
Received: from mizar.localdomain (87.14.251.117) by smtp205.alice.it
	(8.6.023.02) id 4ECA5FDA02EDBB16; Wed, 7 Dec 2011 00:23:20 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Dec 2011 00:23:06 +0100
Message-Id: <68e1fafa3ed455dd26cfbfe2a76b3cbdb5b7bfc2.1323212403.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1323212403.git.andrea.adami@gmail.com>
References: <cover.1323212403.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1323212403.git.andrea.adami@gmail.com>
References: <cover.1323212403.git.andrea.adami@gmail.com>
Subject: [PATCH 1/2] image_types.bbclass: implement jffs2 summary images (sum.jffs2)
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
X-List-Received-Date: Tue, 06 Dec 2011 23:35:28 -0000

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
1.7.3.4




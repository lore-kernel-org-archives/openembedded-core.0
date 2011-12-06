Received: from smtp205.alice.it ([82.57.200.101])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RY4Xo-0007bh-HB
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 00:35:28 +0100
Received: from mizar.localdomain (87.14.251.117) by smtp205.alice.it
	(8.6.023.02) id 4ECA5FDA02EDBB38; Wed, 7 Dec 2011 00:23:21 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Dec 2011 00:23:07 +0100
Message-Id: <3448040a06507769d6e62cc2ccf3bdc6a2dfeb43.1323212403.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1323212403.git.andrea.adami@gmail.com>
References: <cover.1323212403.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1323212403.git.andrea.adami@gmail.com>
References: <cover.1323212403.git.andrea.adami@gmail.com>
Subject: [PATCH 2/2] image_types.bbclass: disable cleanmarkers for jffs2 images
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

* Add '-n' to suppress cleanmarker nodes since jffs2
* is usually used for NAND flash and the cleanmarkers are created in
* the OOB area by flash_eraseall -j
*
* From man pages: -n, --no-cleanmarkers
* Do not write cleanmarker nodes to the beginning of each erase block.
* This option can be useful for creating JFFS2 images for use on NAND flash,
* and for creating images which are to be used on a variety of hardware with differing eraseblock sizes.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta/classes/image_types.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index bd4b7bc..489fbe1 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -34,9 +34,9 @@ runimagecmd () {
 XZ_COMPRESSION_LEVEL ?= "-e -9"
 XZ_INTEGRITY_CHECK ?= "crc32"
 
-IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 ${EXTRA_IMAGECMD}"
+IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 -n ${EXTRA_IMAGECMD}"
 IMAGE_CMD_sum.jffs2 = "${IMAGE_CMD_jffs2} && sumtool -i ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 \
-	-o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.sum.jffs2 ${EXTRA_IMAGECMD}"
+	-o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.sum.jffs2 -n ${EXTRA_IMAGECMD}"
 
 IMAGE_CMD_cramfs = "mkcramfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cramfs ${EXTRA_IMAGECMD}"
 
-- 
1.7.3.4




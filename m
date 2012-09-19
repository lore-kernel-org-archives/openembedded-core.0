Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TEMOO-0000MX-DI
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 17:40:48 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 Sep 2012 08:28:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,447,1344236400"; d="scan'208";a="224100130"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.229])
	by fmsmga002.fm.intel.com with ESMTP; 19 Sep 2012 08:28:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Sep 2012 08:28:05 -0700
Message-Id: <1348068485-993-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH v2] image_types: fix squashfs-lzma image creation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Sep 2012 15:40:48 -0000

This removes the dependency on a seperate binary which we
don't seem to have. So, use mksquashfs's -comp lzma to
replace that functionality

[YOCTO #3126]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/image_types.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 8d76cc9..bdb67b4 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -166,7 +166,7 @@ IMAGE_CMD_btrfs () {
 }
 
 IMAGE_CMD_squashfs = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs ${EXTRA_IMAGECMD} -noappend"
-IMAGE_CMD_squashfs-lzma = "mksquashfs-lzma ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs-lzma ${EXTRA_IMAGECMD} -noappend"
+IMAGE_CMD_squashfs-lzma = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs-lzma ${EXTRA_IMAGECMD} -noappend -comp lzma"
 IMAGE_CMD_tar = "cd ${IMAGE_ROOTFS} && tar -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar ."
 
 CPIO_TOUCH_INIT () {
@@ -225,7 +225,7 @@ IMAGE_DEPENDS_ext3 = "genext2fs-native e2fsprogs-native"
 IMAGE_DEPENDS_ext4 = "genext2fs-native e2fsprogs-native"
 IMAGE_DEPENDS_btrfs = "btrfs-tools-native"
 IMAGE_DEPENDS_squashfs = "squashfs-tools-native"
-IMAGE_DEPENDS_squashfs-lzma = "squashfs-lzma-tools-native"
+IMAGE_DEPENDS_squashfs-lzma = "squashfs-tools-native"
 IMAGE_DEPENDS_elf = "virtual/kernel mkelfimage-native"
 IMAGE_DEPENDS_ubi = "mtd-utils-native"
 IMAGE_DEPENDS_ubifs = "mtd-utils-native"
-- 
1.7.7.6




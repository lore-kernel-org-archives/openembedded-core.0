Received: from 75-148-42-21-colorado.hfc.comcastbusiness.net ([75.148.42.21]
	helo=judge.camp.se-eng.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raymondd@beast.se-eng.com>) id 1SkdTQ-0004ZP-Li
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 17:51:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by judge.camp.se-eng.com (Postfix) with ESMTP id 3D841139142
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 09:40:12 -0600 (MDT)
X-Virus-Scanned: amavisd-new at camp.se-eng.com
Received: from judge.camp.se-eng.com ([127.0.0.1])
	by localhost (judge.camp.se-eng.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ayu+F7ImZGKM; Fri, 29 Jun 2012 09:40:11 -0600 (MDT)
Received: from beast (beast.camp.se-eng.com [172.20.202.96])
	by judge.camp.se-eng.com (Postfix) with ESMTP id 3A665139140;
	Fri, 29 Jun 2012 09:40:11 -0600 (MDT)
Received: by beast (Postfix, from userid 1000)
	id 1868B2C6DC; Fri, 29 Jun 2012 09:41:40 -0600 (MDT)
From: Raymond Danks <ray.danks@se-eng.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jun 2012 09:41:36 -0600
Message-Id: <1340984497-32423-1-git-send-email-ray.danks@se-eng.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1340396533-5386-2-git-send-email-ray.danks@se-eng.com>
References: <1340396533-5386-2-git-send-email-ray.danks@se-eng.com>
Subject: [PATCH 1/2 v2] image_types: Add elf image type
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
X-List-Received-Date: Fri, 29 Jun 2012 15:51:09 -0000

On x86, an ELF image file may be stored as a coreboot payload.
The image file is constructed, using the mkelfimage utility,
from a kernel and an initrd.

Signed-off-by: Raymond Danks <ray.danks@se-eng.com>
---
This was originally submitted to the openembedded project:
http://patches.openembedded.org/patch/7689/

v2:
 Include KERNEL_IMAGETYPE for location of ELF_KERNEL

 meta/classes/image_types.bbclass |   18 +++++++++++++++++-
 1 files changed, 17 insertions(+), 1 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 55f122e..12419f4 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -7,6 +7,12 @@ def get_imagecmds(d):
     ctypes = d.getVar('COMPRESSIONTYPES', True).split()
     cimages = {}
 
+    if "elf" in alltypes:
+        alltypes.remove("elf")
+        if "cpio.gz" not in alltypes:
+                alltypes.append("cpio.gz")
+        alltypes.append("elf")
+
     # Filter out all the compressed images from types
     for type in alltypes:
         basetype = None
@@ -173,6 +179,14 @@ IMAGE_CMD_cpio () {
 	cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
 }
 
+ELF_KERNEL ?= ${STAGING_DIR_HOST}/kernel/${KERNEL_IMAGETYPE}
+ELF_APPEND ?= "ramdisk_size=32768 root=/dev/ram0 rw console=" 
+
+IMAGE_CMD_elf () {
+	test -f ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.elf && rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.elf 
+	mkelfImage --kernel=${ELF_KERNEL} --initrd=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.elf --append='${ELF_APPEND}' ${EXTRA_IMAGECMD}
+}
+
 UBI_VOLNAME ?= "${MACHINE}-rootfs"
 
 IMAGE_CMD_ubi () {
@@ -199,6 +213,7 @@ EXTRA_IMAGECMD_ext2 ?= "-i 8192"
 EXTRA_IMAGECMD_ext3 ?= "-i 8192"
 EXTRA_IMAGECMD_ext4 ?= "-i 8192"
 EXTRA_IMAGECMD_btrfs ?= ""
+EXTRA_IMAGECMD_elf ?= ""
 
 IMAGE_DEPENDS = ""
 IMAGE_DEPENDS_jffs2 = "mtd-utils-native"
@@ -210,11 +225,12 @@ IMAGE_DEPENDS_ext4 = "genext2fs-native e2fsprogs-native"
 IMAGE_DEPENDS_btrfs = "btrfs-tools-native"
 IMAGE_DEPENDS_squashfs = "squashfs-tools-native"
 IMAGE_DEPENDS_squashfs-lzma = "squashfs-lzma-tools-native"
+IMAGE_DEPENDS_elf = "virtual/kernel mkelfimage-native"
 IMAGE_DEPENDS_ubi = "mtd-utils-native"
 IMAGE_DEPENDS_ubifs = "mtd-utils-native"
 
 # This variable is available to request which values are suitable for IMAGE_FSTYPES
-IMAGE_TYPES = "jffs2 sum.jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz ext2.lzma btrfs live squashfs squashfs-lzma ubi tar tar.gz tar.bz2 tar.xz cpio cpio.gz cpio.xz cpio.lzma vmdk"
+IMAGE_TYPES = "jffs2 sum.jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz ext2.lzma btrfs live squashfs squashfs-lzma ubi tar tar.gz tar.bz2 tar.xz cpio cpio.gz cpio.xz cpio.lzma vmdk elf"
 
 COMPRESSIONTYPES = "gz bz2 lzma xz"
 COMPRESS_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}.rootfs.${type}"
-- 
1.7.0.4




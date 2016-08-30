Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 51BC2731BA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 09:30:50 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 30 Aug 2016 02:30:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,255,1470726000"; d="scan'208";a="754986880"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Aug 2016 02:30:52 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 734BD6A4080
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 02:30:31 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Aug 2016 12:29:34 +0300
Message-Id: <9e65436d7f34280ca0d184964bce6bb4ae8b32a3.1472548574.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1472548574.git.ed.bartosh@linux.intel.com>
References: <cover.1472548574.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1472548574.git.ed.bartosh@linux.intel.com>
References: <cover.1472548574.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 01/18] image-live.bbclass: deploy images to DEPLOYDIR
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
X-List-Received-Date: Tue, 30 Aug 2016 09:30:50 -0000

Changed deployment directory from DEPLOY_DIR_IMAGE to DEPLOYDIR
to make sstate machinery to do final deployment and generate
manifest.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image-live.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index f0e6647..1294b11 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -43,7 +43,7 @@ ROOT_LIVE ?= "root=/dev/ram0"
 INITRD_IMAGE_LIVE ?= "core-image-minimal-initramfs"
 INITRD_LIVE ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE_LIVE}-${MACHINE}.cpio.gz"
 
-ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.ext4"
+ROOTFS ?= "${DEPLOYDIR}/${IMAGE_LINK_NAME}.ext4"
 
 IMAGE_TYPEDEP_live = "ext4"
 IMAGE_TYPEDEP_iso = "ext4"
@@ -144,14 +144,14 @@ build_iso() {
 	if [ "${PCBIOS}" = "1" ] && [ "${EFI}" != "1" ] ; then
 		# PCBIOS only media
 		mkisofs -V ${BOOTIMG_VOLUME_ID} \
-		        -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \
+		        -o ${DEPLOYDIR}/${IMAGE_NAME}.iso \
 			-b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} \
 			$mkisofs_compress_opts \
 			${MKISOFS_OPTIONS} $mkisofs_iso_level ${ISODIR}
 	else
 		# EFI only OR EFI+PCBIOS
 		mkisofs -A ${BOOTIMG_VOLUME_ID} -V ${BOOTIMG_VOLUME_ID} \
-		        -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \
+		        -o ${DEPLOYDIR}/${IMAGE_NAME}.iso \
 			-b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} \
 			$mkisofs_compress_opts ${MKISOFS_OPTIONS} $mkisofs_iso_level \
 			-eltorito-alt-boot -eltorito-platform efi \
@@ -160,7 +160,7 @@ build_iso() {
 		isohybrid_args="-u"
 	fi
 
-	isohybrid $isohybrid_args ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso
+	isohybrid $isohybrid_args ${DEPLOYDIR}/${IMAGE_NAME}.iso
 }
 
 build_fat_img() {
@@ -252,13 +252,13 @@ build_hddimg() {
 			fi
 		fi
 
-		build_fat_img ${HDDDIR} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg
+		build_fat_img ${HDDDIR} ${DEPLOYDIR}/${IMAGE_NAME}.hddimg
 
 		if [ "${PCBIOS}" = "1" ]; then
 			syslinux_hddimg_install
 		fi
 
-		chmod 644 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg
+		chmod 644 ${DEPLOYDIR}/${IMAGE_NAME}.hddimg
 	fi
 }
 
-- 
2.1.4



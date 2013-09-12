Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 42FB36C013
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 17:20:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8CHK5JK005443
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Sep 2013 10:20:05 -0700 (PDT)
Received: from splat.wrs.com (128.224.60.28) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 12 Sep 2013 10:20:05 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Thu, 12 Sep 2013 12:19:46 -0500
Message-ID: <1379006387-20186-5-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1379006387-20186-1-git-send-email-jason.wessel@windriver.com>
References: <1379006387-20186-1-git-send-email-jason.wessel@windriver.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com
Subject: [PATCH 4/5] bootimage.bbclass: Improve EFI & PCBIOS+EFI ISO support
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
X-List-Received-Date: Thu, 12 Sep 2013 17:20:03 -0000
Content-Type: text/plain

Using the latest mkisofs it is possible to generate 3 different types
of ISO images, which can be used in various scenarios.

1) PCBIOS Only ISO
   - This option remains unchanged by this commit
   - Uses syslinux menus
   - Can be directly copied with dd to a USB device
   - Can be burned to optical media

2) EFI Only ISO
   - Uses grub 2 menus
   - Can be burned to optical media
   - If you want to use this image on a USB device
     extra steps must be taken in order to format the USB
     device with fat32, and copy an EFI loader which will
     in turn load the iso image

3) PCBIOS / EFI ISO
   - This is a hybrid image ISO that will work for case 1 or 2
     as above with the same restrictions and boot menu types
     depending on what type of firmware is installed on
     the hardware or depending on if EFI or "Legacy Boot" is
     enabled on some UEFI firmwares.

[YOCTO #4100]

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/classes/bootimg.bbclass |   37 ++++++++++++++++++++++++++++++++++---
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index 2ed7017..b4301e8 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -35,6 +35,7 @@ EXCLUDE_FROM_WORLD = "1"
 
 HDDDIR = "${S}/hddimg"
 ISODIR = "${S}/iso"
+EFIIMGDIR = "${S}/efi_img"
 COMPACT_ISODIR = "${S}/iso.z"
 
 BOOTIMG_VOLUME_ID   ?= "boot"
@@ -109,19 +110,49 @@ build_iso() {
 		mkisofs_opts="-R -z -D -l"
 	fi
 
-	if [ "${PCBIOS}" = "1" ]; then
+	if [ "${EFI}" = "1" ] ; then
+		# Build a EFI directory to create efi.img
+		mkdir -p ${EFIIMGDIR}/${EFIDIR}
+		cp ${ISODIR}/${EFIDIR}/* ${EFIIMGDIR}${EFIDIR}
+		cp ${ISODIR}/vmlinuz ${EFIIMGDIR}
+		GRUB_IMAGE="bootia32.efi"
+		if [ "${TARGET_ARCH}" = "x86_64" ]; then
+			GRUB_IMAGE="bootx64.efi"
+		fi
+		echo "EFI\\BOOT\\${GRUB_IMAGE}" > ${EFIIMGDIR}/startup.nsh
+		if [ -f "${ISODIR}/initrd" ] ; then
+			cp ${ISODIR}/initrd ${EFIIMGDIR}
+		fi
+		build_fat_img ${EFIIMGDIR} ${ISODIR}/efi.img
+	fi
+
+	# Three ways to build the media
+	if [ "${PCBIOS}" = "1" -a "${EFI}" = "1" ]; then
+		# 1) Build EFI + PCBIOS hybrid
+		mkisofs -A ${BOOTIMG_VOLUME_ID} -V ${BOOTIMG_VOLUME_ID} \
+		        -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \
+			-b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} $mkisofs_opts \
+			${MKISOFS_OPTIONS} \
+			-eltorito-alt-boot -eltorito-platform efi \
+			-b efi.img -no-emul-boot \
+			${ISODIR}
+	elif [ "${PCBIOS}" = "1" ] ; then
+		# 2) Build PCBIOS only media
 		mkisofs -V ${BOOTIMG_VOLUME_ID} \
 		        -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \
 			-b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} $mkisofs_opts \
 			${MKISOFS_OPTIONS} ${ISODIR}
 	else
-		bbnote "EFI-only ISO images are untested, please provide feedback."
 		mkisofs -V ${BOOTIMG_VOLUME_ID} \
 		        -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \
+			-eltorito-alt-boot -eltorito-platform efi \
+			-b efi.img -no-emul-boot \
 			-r ${ISODIR}
 	fi
 
-	isohybrid ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso
+	if [ "${PCBIOS}" = "1" ]; then
+		isohybrid ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso
+	fi
 
 	cd ${DEPLOY_DIR_IMAGE}
 	rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.iso
-- 
1.7.9.5



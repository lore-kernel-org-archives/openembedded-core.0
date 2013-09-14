Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 65CFE6C765
	for <Openembedded-core@lists.openembedded.org>;
	Sat, 14 Sep 2013 00:09:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8E09DR3023797
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 13 Sep 2013 17:09:13 -0700 (PDT)
Received: from splat.wrs.com (128.224.60.28) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 13 Sep 2013 17:09:13 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Fri, 13 Sep 2013 19:09:01 -0500
Message-ID: <1379117343-29877-6-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1379117343-29877-1-git-send-email-jason.wessel@windriver.com>
References: <1379117343-29877-1-git-send-email-jason.wessel@windriver.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com
Subject: [v2 PATCH 5/7] bootimage.bbclass, grub-efi.bbclass: Improve EFI & PCBIOS+EFI ISO support
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
X-List-Received-Date: Sat, 14 Sep 2013 00:09:14 -0000
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

The syslinux.bbclass is now always required because that is where the
isohybrid dependencies come from as well as the configuration data for
the isohybrid.  The isohybrid is the secret sauce which allows the ISO
to work as optical media or as a disk image on USB or a HDD/SSD.

[YOCTO #4100]

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/classes/bootimg.bbclass  |   33 +++++++++++++++++++++------------
 meta/classes/grub-efi.bbclass |    8 ++++++++
 2 files changed, 29 insertions(+), 12 deletions(-)

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index bd211fb..756a287 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -32,6 +32,7 @@ EXCLUDE_FROM_WORLD = "1"
 
 HDDDIR = "${S}/hddimg"
 ISODIR = "${S}/iso"
+EFIIMGDIR = "${S}/efi_img"
 
 BOOTIMG_VOLUME_ID   ?= "boot"
 BOOTIMG_EXTRA_SPACE ?= "512"
@@ -48,15 +49,10 @@ def pcbios(d):
         pcbios = base_contains("MACHINE_FEATURES", "efi", "0", "1", d)
     return pcbios
 
-def pcbios_class(d):
-    if d.getVar("PCBIOS", True) == "1":
-        return "syslinux"
-    return ""
-
 PCBIOS = "${@pcbios(d)}"
-PCBIOS_CLASS = "${@pcbios_class(d)}"
 
-inherit ${PCBIOS_CLASS}
+# The syslinux is required for the isohybrid command and boot catalog
+inherit syslinux
 inherit ${EFI_CLASS}
 
 populate() {
@@ -90,21 +86,34 @@ build_iso() {
 	fi
 	if [ "${EFI}" = "1" ]; then
 		grubefi_iso_populate
+		build_fat_img ${EFIIMGDIR} ${ISODIR}/efi.img
 	fi
 
-	if [ "${PCBIOS}" = "1" ]; then
+	# EFI only
+	if [ "${PCBIOS}" != "1" ] && [ "${EFI}" = "1" ] ; then
+		mkdir -p ${ISODIR}/${ISOLINUXDIR}
+		install -m 0644 ${STAGING_DATADIR}/syslinux/isolinux.bin ${ISODIR}${ISOLINUXDIR}
+	fi
+
+	if [ "${PCBIOS}" = "1" ] && [ "${EFI}" != "1" ] ; then
+		# PCBIOS only media
 		mkisofs -V ${BOOTIMG_VOLUME_ID} \
 		        -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \
 			-b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} -r \
 			${MKISOFS_OPTIONS} ${ISODIR}
 	else
-		bbnote "EFI-only ISO images are untested, please provide feedback."
-		mkisofs -V ${BOOTIMG_VOLUME_ID} \
+		# EFI only OR EFI+PCIBIOS
+		mkisofs -A ${BOOTIMG_VOLUME_ID} -V ${BOOTIMG_VOLUME_ID} \
 		        -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \
-			-r ${ISODIR}
+			-b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} \
+			-r ${MKISOFS_OPTIONS} \
+			-eltorito-alt-boot -eltorito-platform efi \
+			-b efi.img -no-emul-boot \
+			${ISODIR}
+		isohybrid_args="-u"
 	fi
 
-	isohybrid ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso
+	isohybrid $isohybrid_args ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso
 
 	cd ${DEPLOY_DIR_IMAGE}
 	rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.iso
diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index c6f5d4e..c21babb 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -41,6 +41,14 @@ grubefi_populate() {
 
 grubefi_iso_populate() {
 	grubefi_populate ${ISODIR}
+	# Build a EFI directory to create efi.img
+	mkdir -p ${EFIIMGDIR}/${EFIDIR}
+	cp ${ISODIR}/${EFIDIR}/* ${EFIIMGDIR}${EFIDIR}
+	cp ${ISODIR}/vmlinuz ${EFIIMGDIR}
+	echo "EFI\\BOOT\\${GRUB_IMAGE}" > ${EFIIMGDIR}/startup.nsh
+	if [ -f "${ISODIR}/initrd" ] ; then
+		cp ${ISODIR}/initrd ${EFIIMGDIR}
+	fi
 }
 
 grubefi_hddimg_populate() {
-- 
1.7.9.5



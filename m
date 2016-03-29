Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B467F6FF04
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2016 07:59:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2T7xCa9019080
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2016 00:59:12 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 29 Mar 2016 00:59:12 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Mar 2016 00:59:09 -0700
Message-ID: <3148e125ec883b341b1bbbc8bb3f8845bde01eb2.1459238263.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1459238263.git.liezhi.yang@windriver.com>
References: <cover.1459238263.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] image-live.bbclass/image-vm.bbclass: remove duplicated code
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
X-List-Received-Date: Tue, 29 Mar 2016 07:59:11 -0000
Content-Type: text/plain

Move the common code to image.bbclass and remove duplicated ones.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/image-live.bbclass | 58 ++++++-----------------------------------
 meta/classes/image-vm.bbclass   | 51 +-----------------------------------
 meta/classes/image.bbclass      | 46 ++++++++++++++++++++++++++++++++
 3 files changed, 55 insertions(+), 100 deletions(-)

diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index 9c725c0..335b800 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -70,52 +70,11 @@ MKISOFS_OPTIONS = "-no-emul-boot -boot-load-size 4 -boot-info-table"
 BOOTIMG_VOLUME_ID   ?= "boot"
 BOOTIMG_EXTRA_SPACE ?= "512"
 
-EFI = "${@bb.utils.contains("MACHINE_FEATURES", "efi", "1", "0", d)}"
-EFI_PROVIDER ?= "grub-efi"
-EFI_CLASS = "${@bb.utils.contains("MACHINE_FEATURES", "efi", "${EFI_PROVIDER}", "", d)}"
-
-KERNEL_IMAGETYPE ??= "bzImage"
-
-# Include legacy boot if MACHINE_FEATURES includes "pcbios" or if it does not
-# contain "efi". This way legacy is supported by default if neither is
-# specified, maintaining the original behavior.
-def pcbios(d):
-    pcbios = bb.utils.contains("MACHINE_FEATURES", "pcbios", "1", "0", d)
-    if pcbios == "0":
-        pcbios = bb.utils.contains("MACHINE_FEATURES", "efi", "0", "1", d)
-    return pcbios
-
-PCBIOS = "${@pcbios(d)}"
-PCBIOS_CLASS = "${@['','syslinux'][d.getVar('PCBIOS', True) == '1']}"
-
-inherit ${EFI_CLASS}
-inherit ${PCBIOS_CLASS}
-
-populate() {
-	DEST=$1
-	install -d ${DEST}
-
-	# Install kernel, initrd, and rootfs.img in DEST for all loaders to use.
-	install -m 0644 ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE} ${DEST}/vmlinuz
-
-	# initrd is made of concatenation of multiple filesystem images
-	if [ -n "${INITRD}" ]; then
-		rm -f ${DEST}/initrd
-		for fs in ${INITRD}
-		do
-			if [ -s "${fs}" ]; then
-				cat ${fs} >> ${DEST}/initrd
-			else
-				bbfatal "${fs} is invalid. initrd image creation failed."
-			fi
-		done
-		chmod 0644 ${DEST}/initrd
-	fi
-
-	if [ -n "${ROOTFS}" ] && [ -s "${ROOTFS}" ]; then
-		install -m 0644 ${ROOTFS} ${DEST}/rootfs.img
+populate_live() {
+    populate $1
+	if [ -s "${ROOTFS}" ]; then
+		install -m 0644 ${ROOTFS} $1/rootfs.img
 	fi
-
 }
 
 build_iso() {
@@ -127,14 +86,13 @@ build_iso() {
 	# ${INITRD} is a list of multiple filesystem images
 	for fs in ${INITRD}
 	do
-		if [ ! -s "${fs}" ]; then
-			bbnote "ISO image will not be created. ${fs} is invalid."
+		if [ ! -s "$fs" ]; then
+			bbnote "ISO image will not be created. $fs is invalid."
 			return
 		fi
 	done
 
-
-	populate ${ISODIR}
+	populate_live ${ISODIR}
 
 	if [ "${PCBIOS}" = "1" ]; then
 		syslinux_iso_populate ${ISODIR}
@@ -274,7 +232,7 @@ build_fat_img() {
 build_hddimg() {
 	# Create an HDD image
 	if [ "${NOHDD}" != "1" ] ; then
-		populate ${HDDDIR}
+		populate_live ${HDDDIR}
 
 		if [ "${PCBIOS}" = "1" ]; then
 			syslinux_hddimg_populate ${HDDDIR}
diff --git a/meta/classes/image-vm.bbclass b/meta/classes/image-vm.bbclass
index ced8eac..57f04a4 100644
--- a/meta/classes/image-vm.bbclass
+++ b/meta/classes/image-vm.bbclass
@@ -43,63 +43,14 @@ do_bootdirectdisk[depends] += "${@'${INITRD_IMAGE_VM}:do_image_complete' if '${I
 BOOTDD_VOLUME_ID   ?= "boot"
 BOOTDD_EXTRA_SPACE ?= "16384"
 
-EFI = "${@bb.utils.contains("MACHINE_FEATURES", "efi", "1", "0", d)}"
-EFI_PROVIDER ?= "grub-efi"
-EFI_CLASS = "${@bb.utils.contains("MACHINE_FEATURES", "efi", "${EFI_PROVIDER}", "", d)}"
-
-# Include legacy boot if MACHINE_FEATURES includes "pcbios" or if it does not
-# contain "efi". This way legacy is supported by default if neither is
-# specified, maintaining the original behavior.
-def pcbios(d):
-    pcbios = bb.utils.contains("MACHINE_FEATURES", "pcbios", "1", "0", d)
-    if pcbios == "0":
-        pcbios = bb.utils.contains("MACHINE_FEATURES", "efi", "0", "1", d)
-    return pcbios
-
-def pcbios_class(d):
-    if d.getVar("PCBIOS", True) == "1":
-        return "syslinux"
-    return ""
-
-PCBIOS = "${@pcbios(d)}"
-PCBIOS_CLASS = "${@pcbios_class(d)}"
-
-# Get the build_syslinux_cfg() function from the syslinux class
-inherit ${PCBIOS_CLASS}
-inherit ${EFI_CLASS}
-
 DISK_SIGNATURE ?= "${DISK_SIGNATURE_GENERATED}"
 
-boot_direct_populate() {
-	dest=$1
-	install -d $dest
-
-	# Install bzImage, initrd, and rootfs.img in DEST for all loaders to use.
-	if [ -e ${DEPLOY_DIR_IMAGE}/bzImage ]; then
-		install -m 0644 ${DEPLOY_DIR_IMAGE}/bzImage $dest/vmlinuz
-	fi
-
-	# initrd is made of concatenation of multiple filesystem images
-	if [ -n "${INITRD}" ]; then
-		rm -f $dest/initrd
-		for fs in ${INITRD}
-		do
-			if [ -s "${fs}" ]; then
-				cat ${fs} >> $dest/initrd
-			else
-				bbfatal "${fs} is invalid. initrd image creation failed."
-			fi
-		done
-		chmod 0644 $dest/initrd
-	fi
-}
-
 build_boot_dd() {
 	HDDDIR="${S}/hdd/boot"
 	HDDIMG="${S}/hdd.image"
 	IMAGE=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hdddirect
 
-	boot_direct_populate $HDDDIR
+	populate $HDDDIR
 
 	if [ "${PCBIOS}" = "1" ]; then
 		syslinux_hddimg_populate $HDDDIR
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 62ff07e..5c1973a 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -552,3 +552,49 @@ def set_live_vm_vars(d, suffix):
         elif d.getVar(var_with_suffix, True):
             d.setVar(var, d.getVar(var_with_suffix, True))
 
+
+EFI = "${@bb.utils.contains("MACHINE_FEATURES", "efi", "1", "0", d)}"
+EFI_PROVIDER ?= "grub-efi"
+EFI_CLASS = "${@bb.utils.contains("MACHINE_FEATURES", "efi", "${EFI_PROVIDER}", "", d)}"
+
+# Include legacy boot if MACHINE_FEATURES includes "pcbios" or if it does not
+# contain "efi". This way legacy is supported by default if neither is
+# specified, maintaining the original behavior.
+def pcbios(d):
+    pcbios = bb.utils.contains("MACHINE_FEATURES", "pcbios", "1", "0", d)
+    if pcbios == "0":
+        pcbios = bb.utils.contains("MACHINE_FEATURES", "efi", "0", "1", d)
+    return pcbios
+
+PCBIOS = "${@pcbios(d)}"
+PCBIOS_CLASS = "${@['','syslinux'][d.getVar('PCBIOS', True) == '1']}"
+
+inherit ${EFI_CLASS}
+inherit ${PCBIOS_CLASS}
+
+KERNEL_IMAGETYPE ??= "bzImage"
+
+populate() {
+	dest=$1
+	install -d $dest
+
+	# Install bzImage, initrd, and rootfs.img in DEST for all loaders to use.
+	if [ -e ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE} ]; then
+		install -m 0644 ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE} $dest/vmlinuz
+	fi
+
+	# initrd is made of concatenation of multiple filesystem images
+	if [ -n "${INITRD}" ]; then
+		rm -f $dest/initrd
+		for fs in ${INITRD}
+		do
+			if [ -s "$fs" ]; then
+				cat $fs >> $dest/initrd
+			else
+				bbfatal "$fs is invalid. initrd image creation failed."
+			fi
+		done
+		chmod 0644 $dest/initrd
+	fi
+}
+
-- 
2.7.4



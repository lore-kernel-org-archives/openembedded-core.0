Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6A2316FF84
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 07:23:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2U7NGO8006293
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 00:23:16 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 30 Mar 2016 00:23:15 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Mar 2016 00:23:11 -0700
Message-ID: <a4bf6602981801338c27c94125a270a88a269096.1459322435.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1459322435.git.liezhi.yang@windriver.com>
References: <cover.1459322435.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] image-live.bbclass/image-vm.bbclass: remove duplicated code
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
X-List-Received-Date: Wed, 30 Mar 2016 07:23:15 -0000
Content-Type: text/plain

Move the common code to live_vm_common.bbclass and remove duplicated ones.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/image-live.bbclass     | 60 +++++++------------------------------
 meta/classes/image-vm.bbclass       | 53 ++------------------------------
 meta/classes/image.bbclass          | 12 --------
 meta/classes/live-vm-common.bbclass | 58 +++++++++++++++++++++++++++++++++++
 4 files changed, 71 insertions(+), 112 deletions(-)
 create mode 100644 meta/classes/live-vm-common.bbclass

diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index 9c725c0..c114f50 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -25,6 +25,8 @@
 # ${HDDIMG_ID} - FAT image volume-id
 # ${ROOTFS} - indicates a filesystem image to include as the root filesystem (optional)
 
+inherit live-vm-common
+
 do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
                         mtools-native:do_populate_sysroot \
                         cdrtools-native:do_populate_sysroot \
@@ -70,52 +72,11 @@ MKISOFS_OPTIONS = "-no-emul-boot -boot-load-size 4 -boot-info-table"
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
+    populate_kernel $1
+	if [ -s "${ROOTFS}" ]; then
+		install -m 0644 ${ROOTFS} $1/rootfs.img
 	fi
-
 }
 
 build_iso() {
@@ -127,14 +88,13 @@ build_iso() {
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
@@ -274,7 +234,7 @@ build_fat_img() {
 build_hddimg() {
 	# Create an HDD image
 	if [ "${NOHDD}" != "1" ] ; then
-		populate ${HDDDIR}
+		populate_live ${HDDDIR}
 
 		if [ "${PCBIOS}" = "1" ]; then
 			syslinux_hddimg_populate ${HDDDIR}
diff --git a/meta/classes/image-vm.bbclass b/meta/classes/image-vm.bbclass
index ced8eac..66712a6 100644
--- a/meta/classes/image-vm.bbclass
+++ b/meta/classes/image-vm.bbclass
@@ -15,6 +15,8 @@
 # We have to push the msdos parition table size > 16MB so fat 16 is used as parted
 # won't touch fat12 partitions.
 
+inherit live-vm-common
+
 do_bootdirectdisk[depends] += "dosfstools-native:do_populate_sysroot \
                                virtual/kernel:do_deploy \
                                syslinux:do_populate_sysroot \
@@ -43,63 +45,14 @@ do_bootdirectdisk[depends] += "${@'${INITRD_IMAGE_VM}:do_image_complete' if '${I
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
+	populate_kernel $HDDDIR
 
 	if [ "${PCBIOS}" = "1" ]; then
 		syslinux_hddimg_populate $HDDDIR
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 62ff07e..0667a6a 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -540,15 +540,3 @@ do_bundle_initramfs () {
 }
 addtask bundle_initramfs after do_image_complete
 
-# Some of the vars for vm and live image are conflicted, this function
-# is used for fixing the problem.
-def set_live_vm_vars(d, suffix):
-    vars = ['GRUB_CFG', 'SYSLINUX_CFG', 'ROOT', 'LABELS', 'INITRD']
-    for var in vars:
-        var_with_suffix = var + '_' + suffix
-        if d.getVar(var, True):
-            bb.warn('Found potential conflicted var %s, please use %s rather than %s' % \
-                (var, var_with_suffix, var))
-        elif d.getVar(var_with_suffix, True):
-            d.setVar(var, d.getVar(var_with_suffix, True))
-
diff --git a/meta/classes/live-vm-common.bbclass b/meta/classes/live-vm-common.bbclass
new file mode 100644
index 0000000..c751385
--- /dev/null
+++ b/meta/classes/live-vm-common.bbclass
@@ -0,0 +1,58 @@
+# Some of the vars for vm and live image are conflicted, this function
+# is used for fixing the problem.
+def set_live_vm_vars(d, suffix):
+    vars = ['GRUB_CFG', 'SYSLINUX_CFG', 'ROOT', 'LABELS', 'INITRD']
+    for var in vars:
+        var_with_suffix = var + '_' + suffix
+        if d.getVar(var, True):
+            bb.warn('Found potential conflicted var %s, please use %s rather than %s' % \
+                (var, var_with_suffix, var))
+        elif d.getVar(var_with_suffix, True):
+            d.setVar(var, d.getVar(var_with_suffix, True))
+
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
+populate_kernel() {
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



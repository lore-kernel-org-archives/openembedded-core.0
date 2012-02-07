Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RutvH-0004HG-Hz
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 23:54:04 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Feb 2012 14:45:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122206363"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.116])
	by fmsmga002.fm.intel.com with ESMTP; 07 Feb 2012 14:45:58 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2012 14:45:22 -0800
Message-Id: <5209016cf4c4c8f649e37dc8857b3fbcfe8dd8c8.1328654424.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1328654424.git.sgw@linux.intel.com>
References: <cover.1328654424.git.sgw@linux.intel.com>
In-Reply-To: <cover.1328654424.git.sgw@linux.intel.com>
References: <cover.1328654424.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 02/35] bootimg: Use the same OS files for each boot method
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
X-List-Received-Date: Tue, 07 Feb 2012 22:54:04 -0000

From: Darren Hart <dvhart@linux.intel.com>

Fixes [YOCTO #1951]

The do_bootimg code can generate hybrid efi+pcbios images (syslinux and
grub-efi) to boot on platforms with both EFI and legacy BIOS options. The
current implementation copies the kernel, initrd, and rootfs twice,
unnecessarily bloating the image size. This is an especially egregious bug
on -sato images.

Update the classes to use a common install of the kernel, initrd, and rootfs to
the root of the boot media. Grub-efi, syslinux, and isolinux can all reference
this location explicitly with a leading slash.

Tested with an EFI+PCBIOS image in both EFI and PCBIOS boot modes on two
platforms. No ISO image testing was performed.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/classes/bootimg.bbclass  |   31 ++++++++++++++++++++++++-------
 meta/classes/grub-efi.bbclass |   28 +++++++++-------------------
 meta/classes/syslinux.bbclass |   34 +++++++++++++---------------------
 3 files changed, 46 insertions(+), 47 deletions(-)

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index a717600..1d1a3d0 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -8,13 +8,13 @@
 # End result is two things:
 #
 # 1. A .hddimg file which is an msdos filesystem containing syslinux, a kernel,
-# an initrd and a rootfs image. These can be written to harddisks directly and 
+# an initrd and a rootfs image. These can be written to harddisks directly and
 # also booted on USB flash disks (write them there with dd).
 #
 # 2. A CD .iso image
 
-# Boot process is that the initrd will boot and process which label was selected 
-# in syslinux. Actions based on the label are then performed (e.g. installing to 
+# Boot process is that the initrd will boot and process which label was selected
+# in syslinux. Actions based on the label are then performed (e.g. installing to
 # an hdd)
 
 # External variables (also used by syslinux.bbclass)
@@ -29,8 +29,8 @@ do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
 PACKAGES = " "
 EXCLUDE_FROM_WORLD = "1"
 
-HDDDIR = "${S}/hdd/boot"
-ISODIR = "${S}/cd"
+HDDDIR = "${S}/hddimg"
+ISODIR = "${S}/iso"
 
 BOOTIMG_VOLUME_ID   ?= "boot"
 BOOTIMG_EXTRA_SPACE ?= "512"
@@ -58,6 +58,22 @@ PCBIOS_CLASS = ${@pcbios_class(d)}
 inherit ${PCBIOS_CLASS}
 inherit ${EFI_CLASS}
 
+populate() {
+	DEST=$1
+	install -d ${DEST}
+
+	# Install bzImage, initrd, and rootfs.img in DEST for all loaders to use.
+	install -m 0644 ${STAGING_DIR_HOST}/kernel/bzImage ${DEST}/vmlinuz
+
+	if [ -n "${INITRD}" ] && [ -s "${INITRD}" ]; then
+		install -m 0644 ${INITRD} ${DEST}/initrd
+	fi
+
+	if [ -n "${ROOTFS}" ] && [ -s "${ROOTFS}" ]; then
+		install -m 0644 ${ROOTFS} ${DEST}/rootfs.img
+	fi
+
+}
 
 build_iso() {
 	# Only create an ISO if we have an INITRD and NOISO was not set
@@ -66,7 +82,7 @@ build_iso() {
 		return
 	fi
 
-	install -d ${ISODIR}
+	populate ${ISODIR}
 
 	if [ "${PCBIOS}" = "1" ]; then
 		syslinux_iso_populate
@@ -95,7 +111,8 @@ build_iso() {
 build_hddimg() {
 	# Create an HDD image
 	if [ "${NOHDD}" != "1" ] ; then
-		install -d ${HDDDIR}
+		populate ${HDDDIR}
+
 		if [ "${PCBIOS}" = "1" ]; then
 			syslinux_hddimg_populate
 		fi
diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index 762322b..1efb43b 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -22,39 +22,29 @@ GRUB_TIMEOUT ?= "10"
 GRUB_OPTS ?= "serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1"
 
 EFIDIR = "/EFI/BOOT"
-GRUB_HDDDIR = "${HDDDIR}${EFIDIR}"
-GRUB_ISODIR = "${ISODIR}${EFIDIR}"
 
 grubefi_populate() {
+	# DEST must be the root of the image so that EFIDIR is not
+	# nested under a top level directory.
 	DEST=$1
 
-	install -d ${DEST}
-
-	install -m 0644 ${STAGING_DIR_HOST}/kernel/bzImage ${DEST}/vmlinuz
-
-	if [ -n "${INITRD}" ] && [ -s "${INITRD}" ]; then 
-    		install -m 0644 ${INITRD} ${DEST}/initrd
-	fi
-
-	if [ -n "${ROOTFS}" ] && [ -s "${ROOTFS}" ]; then 
-    		install -m 0644 ${ROOTFS} ${DEST}/rootfs.img
-	fi
+	install -d ${DEST}${EFIDIR}
 
 	GRUB_IMAGE="bootia32.efi"
 	if [ "${TARGET_ARCH}" = "x86_64" ]; then
 		GRUB_IMAGE="bootx64.efi"
 	fi
-	install -m 0644 ${DEPLOY_DIR_IMAGE}/${GRUB_IMAGE} ${DEST}
+	install -m 0644 ${DEPLOY_DIR_IMAGE}/${GRUB_IMAGE} ${DEST}${EFIDIR}
 
-	install -m 0644 ${GRUBCFG} ${DEST}
+	install -m 0644 ${GRUBCFG} ${DEST}${EFIDIR}
 }
 
 grubefi_iso_populate() {
-	grubefi_populate ${GRUB_ISODIR}
+	grubefi_populate ${ISODIR}
 }
 
 grubefi_hddimg_populate() {
-	grubefi_populate ${GRUB_HDDDIR}
+	grubefi_populate ${HDDDIR}
 }
 
 python build_grub_cfg() {
@@ -109,7 +99,7 @@ python build_grub_cfg() {
         bb.data.update_data(localdata)
 
         cfgfile.write('\nmenuentry \'%s\'{\n' % (label))
-        cfgfile.write('linux ${EFIDIR}/vmlinuz LABEL=%s' % (label))
+        cfgfile.write('linux /vmlinuz LABEL=%s' % (label))
 
         append = localdata.getVar('APPEND', True)
         initrd = localdata.getVar('INITRD', True)
@@ -119,7 +109,7 @@ python build_grub_cfg() {
         cfgfile.write('\n')
    
         if initrd:
-            cfgfile.write('initrd ${EFIDIR}/initrd')
+            cfgfile.write('initrd /initrd')
         cfgfile.write('\n}\n')
 
     cfgfile.close()
diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index 91c4275..1569074 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -18,42 +18,34 @@ do_bootimg[depends] += "syslinux:do_populate_sysroot \
 SYSLINUXCFG  = "${S}/syslinux.cfg"
 SYSLINUXMENU = "${S}/menu"
 
-SYSLINUX_ISODIR = "${ISODIR}/isolinux"
-SYSLINUX_HDDDIR = "${HDDDIR}"
+ISOLINUXDIR = "/isolinux"
+SYSLINUXDIR = "/"
 ISO_BOOTIMG = "isolinux/isolinux.bin"
 ISO_BOOTCAT = "isolinux/boot.cat"
 MKISOFS_OPTIONS = "-no-emul-boot -boot-load-size 4 -boot-info-table"
 
 syslinux_populate() {
 	DEST=$1
-	CFGNAME=$2
+	BOOTDIR=$2
+	CFGNAME=$3
 
-	install -d ${DEST}
-
-	# Install the kernel, initrd, and rootfs
-	install -m 0644 ${STAGING_DIR_HOST}/kernel/bzImage ${DEST}/vmlinuz
-	if [ -n "${INITRD}" ] && [ -s "${INITRD}" ]; then
-		install -m 0644 ${INITRD} ${DEST}/initrd
-	fi
-	if [ -n "${ROOTFS}" ] && [ -s "${ROOTFS}" ]; then
-		install -m 0644 ${ROOTFS} ${DEST}/rootfs.img
-	fi
+	install -d ${DEST}${BOOTDIR}
 
 	# Install the config files
-	install -m 0644 ${SYSLINUXCFG} ${DEST}/${CFGNAME}
+	install -m 0644 ${SYSLINUXCFG} ${DEST}${BOOTDIR}/${CFGNAME}
 	if [ -f ${SYSLINUXMENU} ]; then
-		install -m 0644 ${SYSLINUXMENU} ${DEST}
+		install -m 0644 ${SYSLINUXMENU} ${DEST}${BOOTDIR}
 	fi
 }
 
 syslinux_iso_populate() {
-	syslinux_populate ${SYSLINUX_ISODIR} isolinux.cfg
-	install -m 0644 ${STAGING_LIBDIR}/syslinux/isolinux.bin ${SYSLINUX_ISODIR}
+	syslinux_populate ${ISODIR} ${ISOLINUXDIR} isolinux.cfg
+	install -m 0644 ${STAGING_LIBDIR}/syslinux/isolinux.bin ${ISODIR}${ISOLINUXDIR}
 }
 
 syslinux_hddimg_populate() {
-	syslinux_populate ${SYSLINUX_HDDDIR} syslinux.cfg
-	install -m 0444 ${STAGING_LIBDIR}/syslinux/ldlinux.sys ${SYSLINUX_HDDDIR}/ldlinux.sys
+	syslinux_populate ${HDDDIR} ${SYSLINUXDIR} syslinux.cfg
+	install -m 0444 ${STAGING_LIBDIR}/syslinux/ldlinux.sys ${HDDDIR}${SYSLINUXDIR}/ldlinux.sys
 }
 
 syslinux_hddimg_install() {
@@ -187,7 +179,7 @@ python build_syslinux_cfg () {
 		localdata.setVar('OVERRIDES', label + ':' + overrides)
 		bb.data.update_data(localdata)
 	
-		cfgfile.write('LABEL %s\nKERNEL vmlinuz\n' % (label))
+		cfgfile.write('LABEL %s\nKERNEL /vmlinuz\n' % (label))
 
 		append = localdata.getVar('APPEND', 1)
 		initrd = localdata.getVar('INITRD', 1)
@@ -196,7 +188,7 @@ python build_syslinux_cfg () {
 			cfgfile.write('APPEND ')
 
 			if initrd:
-				cfgfile.write('initrd=initrd ')
+				cfgfile.write('initrd=/initrd ')
 
 			cfgfile.write('LABEL=%s '% (label))
 
-- 
1.7.6.5




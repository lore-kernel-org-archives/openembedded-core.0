Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3DD5B60649
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 22:09:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8BM9ksB022725
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 15:09:46 -0700 (PDT)
Received: from splat.wrs.com (128.224.60.28) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 11 Sep 2013 15:09:46 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Wed, 11 Sep 2013 17:09:30 -0500
Message-ID: <1378937370-29730-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] bootimage.bbclass, zisofs-tools-native: add ability to compress ISO images
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
X-List-Received-Date: Wed, 11 Sep 2013 22:09:45 -0000
Content-Type: text/plain

The mkzftree is needed to allow ISO images to be compressed with
minimal runtime overhead.  Below is an example of the savings on a
core-image-minimal.

Before ls -l:
24117248 core-image-minimal-qemux86-64.iso

Using the mkzftree ls -l:
16777216 core-image-minimal-qemux86-64.iso

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/classes/bootimg.bbclass                       |   21 ++++++++++++++--
 .../zisofs-tools/zisofs-tools-native_1.0.8.bb      |   26 ++++++++++++++++++++
 2 files changed, 45 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/zisofs-tools/zisofs-tools-native_1.0.8.bb

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index 90a241d..b312e0d 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -19,19 +19,23 @@
 
 # External variables (also used by syslinux.bbclass)
 # ${INITRD} - indicates a filesystem image to use as an initrd (optional)
+# ${COMPRESSISO}
 # ${NOISO}  - skip building the ISO image if set to 1
 # ${NOHDD}  - skip building the HDD image if set to 1
 # ${ROOTFS} - indicates a filesystem image to include as the root filesystem (optional)
 
+COMPRESSISO ?= ""
 do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
                         mtools-native:do_populate_sysroot \
-                        cdrtools-native:do_populate_sysroot"
+                        cdrtools-native:do_populate_sysroot \
+                        ${@oe.utils.ifelse(d.getVar('COMPRESSISO'),'zisofs-tools-native:do_populate_sysroot','')}"
 
 PACKAGES = " "
 EXCLUDE_FROM_WORLD = "1"
 
 HDDDIR = "${S}/hddimg"
 ISODIR = "${S}/iso"
+COMPACT_ISODIR = "${S}/iso.z"
 
 BOOTIMG_VOLUME_ID   ?= "boot"
 BOOTIMG_EXTRA_SPACE ?= "512"
@@ -92,10 +96,23 @@ build_iso() {
 		grubefi_iso_populate
 	fi
 
+	if [ "${COMPRESSISO}" = "1" ] ; then
+		# create compact directory, compress iso
+		mkdir -p ${COMPACT_ISODIR}
+		mkzftree -z 9 -p 4 -F ${ISODIR}/rootfs.img ${COMPACT_ISODIR}/rootfs.img
+
+		# move compact iso to iso, then remove compact directory
+		mv ${COMPACT_ISODIR}/rootfs.img ${ISODIR}/rootfs.img
+		rm -Rf ${COMPACT_ISODIR}
+		mkisofs_opts="-r"
+	else
+		mkisofs_opts="-R -z -D -l"
+	fi
+
 	if [ "${PCBIOS}" = "1" ]; then
 		mkisofs -V ${BOOTIMG_VOLUME_ID} \
 		        -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \
-			-b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} -r \
+			-b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} $mkisofs_opts \
 			${MKISOFS_OPTIONS} ${ISODIR}
 	else
 		bbnote "EFI-only ISO images are untested, please provide feedback."
diff --git a/meta/recipes-devtools/zisofs-tools/zisofs-tools-native_1.0.8.bb b/meta/recipes-devtools/zisofs-tools/zisofs-tools-native_1.0.8.bb
new file mode 100644
index 0000000..b590854
--- /dev/null
+++ b/meta/recipes-devtools/zisofs-tools/zisofs-tools-native_1.0.8.bb
@@ -0,0 +1,26 @@
+# zisofs-tools-native OE build file
+# Copyright (C) 1989, 1991 Free Software Foundation, Inc.
+SUMMARY = "A set of tools for iso file compression"
+DESCRIPTION = "A set of tools for iso file compression"
+HOMEPAGE = "http://http://freecode.com/projects/zisofs-tools"
+SECTION = "console/utils"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+PR = "r0"
+
+SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/zisofs-tools/zisofs-tools-${PV}.tar.bz2/2d0ed8c9a1f60b45f949b136f9be1f6c/zisofs-tools-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "2d0ed8c9a1f60b45f949b136f9be1f6c"
+SRC_URI[sha256sum] = "ae4e53e4914934d41660248fb59d3c8761f1f1fd180d5ec993c17ddb3afd04f3"
+
+inherit native
+
+STAGE_TEMP = "${WORKDIR}/image-temp"
+
+do_install() {
+	install -d ${STAGE_TEMP}
+	make install INSTALLROOT=${STAGE_TEMP}
+
+	install -d ${D}${bindir}/
+	install ${STAGE_TEMP}/usr/bin/* ${D}${bindir}/
+}
-- 
1.7.9.5



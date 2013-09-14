Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 73F736C796
	for <Openembedded-core@lists.openembedded.org>;
	Sat, 14 Sep 2013 00:09:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8E09Epj023800
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 13 Sep 2013 17:09:14 -0700 (PDT)
Received: from splat.wrs.com (128.224.60.28) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 13 Sep 2013 17:09:14 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Fri, 13 Sep 2013 19:09:03 -0500
Message-ID: <1379117343-29877-8-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1379117343-29877-1-git-send-email-jason.wessel@windriver.com>
References: <1379117343-29877-1-git-send-email-jason.wessel@windriver.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com
Subject: [v2 PATCH 7/7] bootimage.bbclass, zisofs-tools-native: add ability to compress ISO images
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

The mkzftree is needed to allow ISO images to be compressed with
minimal runtime overhead.  Below is an example of the savings on a
core-image-minimal.

Before ls -l:
24117248 core-image-minimal-qemux86-64.iso

Using the mkzftree ls -l:
16777216 core-image-minimal-qemux86-64.iso

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/classes/bootimg.bbclass                       |   24 +++++++++++++++++---
 .../zisofs-tools/zisofs-tools-native_1.0.8.bb      |   19 ++++++++++++++++
 2 files changed, 40 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/zisofs-tools/zisofs-tools-native_1.0.8.bb

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index 756a287..e9e4e8d 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -19,13 +19,15 @@
 
 # External variables (also used by syslinux.bbclass)
 # ${INITRD} - indicates a filesystem image to use as an initrd (optional)
+# ${COMPRESSISO} - Transparent compress ISO, reduce size ~40% if set to 1
 # ${NOISO}  - skip building the ISO image if set to 1
 # ${NOHDD}  - skip building the HDD image if set to 1
 # ${ROOTFS} - indicates a filesystem image to include as the root filesystem (optional)
 
 do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
                         mtools-native:do_populate_sysroot \
-                        cdrtools-native:do_populate_sysroot"
+                        cdrtools-native:do_populate_sysroot \
+                        ${@oe.utils.ifelse(d.getVar('COMPRESSISO'),'zisofs-tools-native:do_populate_sysroot','')}"
 
 PACKAGES = " "
 EXCLUDE_FROM_WORLD = "1"
@@ -33,6 +35,8 @@ EXCLUDE_FROM_WORLD = "1"
 HDDDIR = "${S}/hddimg"
 ISODIR = "${S}/iso"
 EFIIMGDIR = "${S}/efi_img"
+COMPACT_ISODIR = "${S}/iso.z"
+COMPRESSISO ?= ""
 
 BOOTIMG_VOLUME_ID   ?= "boot"
 BOOTIMG_EXTRA_SPACE ?= "512"
@@ -95,18 +99,32 @@ build_iso() {
 		install -m 0644 ${STAGING_DATADIR}/syslinux/isolinux.bin ${ISODIR}${ISOLINUXDIR}
 	fi
 
+	if [ "${COMPRESSISO}" = "1" ] ; then
+		# create compact directory, compress iso
+		mkdir -p ${COMPACT_ISODIR}
+		mkzftree -z 9 -p 4 -F ${ISODIR}/rootfs.img ${COMPACT_ISODIR}/rootfs.img
+
+		# move compact iso to iso, then remove compact directory
+		mv ${COMPACT_ISODIR}/rootfs.img ${ISODIR}/rootfs.img
+		rm -Rf ${COMPACT_ISODIR}
+		mkisofs_compress_opts="-R -z -D -l"
+	else
+		mkisofs_compress_opts="-r"
+	fi
+
 	if [ "${PCBIOS}" = "1" ] && [ "${EFI}" != "1" ] ; then
 		# PCBIOS only media
 		mkisofs -V ${BOOTIMG_VOLUME_ID} \
 		        -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \
-			-b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} -r \
+			-b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} \
+			$mkisofs_compress_opts \
 			${MKISOFS_OPTIONS} ${ISODIR}
 	else
 		# EFI only OR EFI+PCIBIOS
 		mkisofs -A ${BOOTIMG_VOLUME_ID} -V ${BOOTIMG_VOLUME_ID} \
 		        -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \
 			-b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} \
-			-r ${MKISOFS_OPTIONS} \
+			$mkisofs_compress_opts ${MKISOFS_OPTIONS} \
 			-eltorito-alt-boot -eltorito-platform efi \
 			-b efi.img -no-emul-boot \
 			${ISODIR}
diff --git a/meta/recipes-devtools/zisofs-tools/zisofs-tools-native_1.0.8.bb b/meta/recipes-devtools/zisofs-tools/zisofs-tools-native_1.0.8.bb
new file mode 100644
index 0000000..1501307
--- /dev/null
+++ b/meta/recipes-devtools/zisofs-tools/zisofs-tools-native_1.0.8.bb
@@ -0,0 +1,19 @@
+# zisofs-tools-native OE build file
+# Copyright (C) 1989, 1991 Free Software Foundation, Inc.
+SUMMARY = "A set of tools for iso file compression"
+DESCRIPTION = "A set of tools for iso file compression"
+HOMEPAGE = "http://http://freecode.com/projects/zisofs-tools"
+SECTION = "console/utils"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/zisofs-tools/zisofs-tools-${PV}.tar.bz2/2d0ed8c9a1f60b45f949b136f9be1f6c/zisofs-tools-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "2d0ed8c9a1f60b45f949b136f9be1f6c"
+SRC_URI[sha256sum] = "ae4e53e4914934d41660248fb59d3c8761f1f1fd180d5ec993c17ddb3afd04f3"
+
+inherit native
+
+do_install() {
+	oe_runmake install INSTALLROOT=${D} bindir=${bindir}
+}
-- 
1.7.9.5



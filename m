Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A5F44601D4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 11:11:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Feb 2018 03:11:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,501,1511856000"; d="scan'208";a="17464956"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga008.jf.intel.com with ESMTP; 12 Feb 2018 03:11:40 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Feb 2018 13:05:16 +0200
Message-Id: <20180212110521.16974-5-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180212110521.16974-1-alexander.kanavin@linux.intel.com>
References: <20180212110521.16974-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 05/10] image-live.bbclass: drop support for compressed ISO images
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
X-List-Received-Date: Mon, 12 Feb 2018 11:11:39 -0000

While modern Linux kernels still support it, the userspace tools
haven't been updated in over a decade. Also, squashfs provides
both better performance, and better compression ratio:

https://elinux.org/Squash_Fs_Comparisons

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/image-live.bbclass                      | 17 ++---------------
 meta/conf/distro/include/maintainers.inc             |  1 -
 .../zisofs-tools/zisofs-tools-native_1.0.8.bb        | 20 --------------------
 3 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-devtools/zisofs-tools/zisofs-tools-native_1.0.8.bb

diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index 1623c15988b..966277c6785 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -19,7 +19,6 @@
 
 # External variables (also used by syslinux.bbclass)
 # ${INITRD} - indicates a list of filesystem images to concatenate and use as an initrd (optional)
-# ${COMPRESSISO} - Transparent compress ISO, reduce size ~40% if set to 1
 # ${NOISO}  - skip building the ISO image if set to 1
 # ${NOHDD}  - skip building the HDD image if set to 1
 # ${HDDIMG_ID} - FAT image volume-id
@@ -33,7 +32,6 @@ do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
                         virtual/kernel:do_deploy \
                         ${MLPREFIX}syslinux:do_populate_sysroot \
                         syslinux-native:do_populate_sysroot \
-                        ${@oe.utils.ifelse(d.getVar('COMPRESSISO', False),'zisofs-tools-native:do_populate_sysroot','')} \
                         ${PN}:do_image_${@d.getVar('LIVE_ROOTFS_TYPE').replace('-', '_')} \
                         "
 
@@ -65,7 +63,6 @@ HDDDIR = "${S}/hddimg"
 ISODIR = "${S}/iso"
 EFIIMGDIR = "${S}/efi_img"
 COMPACT_ISODIR = "${S}/iso.z"
-COMPRESSISO ?= "0"
 
 ISOLINUXDIR ?= "/isolinux"
 ISO_BOOTIMG = "isolinux/isolinux.bin"
@@ -115,18 +112,8 @@ build_iso() {
 		install -m 0644 ${STAGING_DATADIR}/syslinux/isolinux.bin ${ISODIR}${ISOLINUXDIR}
 	fi
 
-	if [ "${COMPRESSISO}" = "1" ] ; then
-		# create compact directory, compress iso
-		mkdir -p ${COMPACT_ISODIR}
-		mkzftree -z 9 -p 4 -F ${ISODIR}/rootfs.img ${COMPACT_ISODIR}/rootfs.img
-
-		# move compact iso to iso, then remove compact directory
-		mv ${COMPACT_ISODIR}/rootfs.img ${ISODIR}/rootfs.img
-		rm -Rf ${COMPACT_ISODIR}
-		mkisofs_compress_opts="-R -z -D -l"
-	else
-		mkisofs_compress_opts="-r"
-	fi
+	# We used to have support for zisofs; this is a relic of that
+	mkisofs_compress_opts="-r"
 
 	# Check the size of ${ISODIR}/rootfs.img, use mkisofs -iso-level 3
 	# when it exceeds 3.8GB, the specification is 4G - 1 bytes, we need
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 16a15a3865e..24bf6b96a7e 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -803,5 +803,4 @@ RECIPE_MAINTAINER_pn-xwininfo = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-xz = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-yasm = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-zip = "Denys Dmytriyenko <denys@ti.com>"
-RECIPE_MAINTAINER_pn-zisofs-tools-native = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-zlib = "Denys Dmytriyenko <denys@ti.com>"
diff --git a/meta/recipes-devtools/zisofs-tools/zisofs-tools-native_1.0.8.bb b/meta/recipes-devtools/zisofs-tools/zisofs-tools-native_1.0.8.bb
deleted file mode 100644
index 021c05839c0..00000000000
--- a/meta/recipes-devtools/zisofs-tools/zisofs-tools-native_1.0.8.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-# zisofs-tools-native OE build file
-# Copyright (C) 1989, 1991 Free Software Foundation, Inc.
-SUMMARY = "Utilities for creating compressed CD-ROM filesystems"
-HOMEPAGE = "http://freecode.com/projects/zisofs-tools"
-SECTION = "console/utils"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-DEPENDS = "zlib-native"
-
-SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/zisofs-tools/zisofs-tools-${PV}.tar.bz2/2d0ed8c9a1f60b45f949b136f9be1f6c/zisofs-tools-${PV}.tar.bz2"
-
-SRC_URI[md5sum] = "2d0ed8c9a1f60b45f949b136f9be1f6c"
-SRC_URI[sha256sum] = "ae4e53e4914934d41660248fb59d3c8761f1f1fd180d5ec993c17ddb3afd04f3"
-
-inherit native
-
-do_install() {
-	oe_runmake install INSTALLROOT=${D} bindir=${bindir}
-}
-- 
2.15.1



Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id A62D57320F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 14:51:17 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id z76so31618926iof.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Mar 2016 06:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uun03QhdYI6v9KJsjtpGsNnoYed1ZZbgnphTL7pbzso=;
	b=F+mIr+OAZVABcPsfqKP45so3b/VUIGetiuS9UtcWpuDaKy4tL1EkWgKVoPPxggEOEW
	gFMchSTN45dupxnwtEloEHxB9mdWYiMQlDb+JUoBX6Sgy1GG+CqxQ4DHoqvkNOpaKLIf
	XlzeRmdl96rmEQiGVTwhby6c8svInpyKqxbJX7y0ifBt0TfYk2keqnzQtOMK0CuDCE8S
	LVGPke49GbP/V19D7+Sqy+WWh0Jw2TmtiDitRrohHrTZbjTXF77Qwi/lGJcD45M/605E
	wTsyWbGbVJ9Ktf/xlPoUhxpH7Xb3irvplqNyc7xHBBkuOhfJ+W0ZVC2IGzu/9E8/OGl1
	aLHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uun03QhdYI6v9KJsjtpGsNnoYed1ZZbgnphTL7pbzso=;
	b=G1FV3zZWc/5Y1bBUfMcFP1bDbRTU/wJnhsmZ3H4WuTwfdrXIMJ+mqUBkGGVIOGvIQZ
	NHbffumItV8uVcqoVUpj7RaOiTkry4wBdItxdYWzfVVKcH9c6piC43k07CjKjoY8/OVq
	5fNk0goFzGcCbrSgtpgYNKZZ9jNaxhuanVSrFB6We0bK8o1NIsEAdCUfUA4SrkfvB+v9
	eG889+oQTyuj6QMBEUSHK8Rwx3hkOuewTY/5AYnnSIArOeLFsAmNur3NBdXHeZTEVh8s
	SeQkgAI0Dy6WTCeX2ViQ+e3Y8OtWIB18NvBdpnz8I6mhhQ7RWt7wTaONj1swM666/IiM
	LVcQ==
X-Gm-Message-State: AD7BkJJmvl9WZzTvEsvm5CMCJIng21S4RGasH3n08pErGNIZJdBHL9ZjglAnOboZl3Npz6oN
X-Received: by 10.107.186.87 with SMTP id k84mr22750266iof.91.1457362278126;
	Mon, 07 Mar 2016 06:51:18 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A56D71.dip0.t-ipconnect.de.
	[87.165.109.113])
	by smtp.gmail.com with ESMTPSA id qt3sm4812448igb.2.2016.03.07.06.51.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Mar 2016 06:51:17 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Mar 2016 15:51:13 +0100
Message-Id: <1bf0ef92a07ad075ae59bb83d7cf353a2a8f05e2.1457361747.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1457361747.git.patrick.ohly@intel.com>
References: <cover.1457361747.git.patrick.ohly@intel.com>
Subject: [PATCH 1/2] image creation: allow overriding .rootfs suffix
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
X-List-Received-Date: Mon, 07 Mar 2016 14:51:18 -0000

By default, the image file name contains ".rootfs" to distinguish the
image file from other files created during image building. However,
for certain image types (for example, .hddimg) the ".rootfs" suffix is
redundant because the type suffix alone already uniquely identifies
the main image file (core-image-minimal-intel-corei7-64.hddimg instead
of core-image-minimal-intel-corei7-64.rootfs.hddimg).

With this change, distros that prefer the shorter image name can
override the .rootfs suffix like this:
   IMAGE_NAME_ROOTFS = "${@ '' if <using special image type> else '${IMAGE_NAME_ROOTFS_DEFAULT}'}"

The exact logic when to remove the extra suffix depends on the distro
and how it enables its own image type.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/image.bbclass       |  4 +--
 meta/classes/image_types.bbclass | 63 ++++++++++++++++++++++------------------
 2 files changed, 36 insertions(+), 31 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 02612ad..081a0b3 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -387,7 +387,7 @@ python () {
                     subimages.append(realt + "." + ctype)
 
         if realt not in alltypes:
-            cmds.append(localdata.expand("\trm ${IMAGE_NAME}.rootfs.${type}"))
+            cmds.append(localdata.expand("\trm ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"))
         else:
             subimages.append(realt)
 
@@ -474,7 +474,7 @@ python create_symlinks() {
     manifest_name = d.getVar('IMAGE_MANIFEST', True)
     taskname = d.getVar("BB_CURRENTTASK", True)
     subimages = (d.getVarFlag("do_" + taskname, 'subimages', False) or "").split()
-    imgsuffix = d.getVarFlag("do_" + taskname, 'imgsuffix', True) or ".rootfs."
+    imgsuffix = d.getVarFlag("do_" + taskname, 'imgsuffix', True) or "${IMAGE_NAME_SUFFIX}."
     os.chdir(deploy_dir)
 
     if not link_name:
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index db8cb37..22719ad 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -1,3 +1,8 @@
+# IMAGE_NAME is the base name for everything produced when building images.
+# The actual image that contains the rootfs has an additional suffix (.rootfs
+# by default) followed by additional suffices which describe the format (.ext4,
+# .ext4.xz, etc.).
+IMAGE_NAME_SUFFIX ??= ".rootfs"
 
 # The default aligment of the size of the rootfs is set to 1KiB. In case
 # you're using the SD card emulation of a QEMU system simulator you may
@@ -36,9 +41,9 @@ XZ_INTEGRITY_CHECK ?= "crc32"
 XZ_THREADS ?= "-T 0"
 
 JFFS2_SUM_EXTRA_ARGS ?= ""
-IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 ${EXTRA_IMAGECMD}"
+IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.jffs2 ${EXTRA_IMAGECMD}"
 
-IMAGE_CMD_cramfs = "mkfs.cramfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cramfs ${EXTRA_IMAGECMD}"
+IMAGE_CMD_cramfs = "mkfs.cramfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cramfs ${EXTRA_IMAGECMD}"
 
 oe_mkext234fs () {
 	fstype=$1
@@ -58,8 +63,8 @@ oe_mkext234fs () {
 		eval COUNT=\"$MIN_COUNT\"
 	fi
 	# Create a sparse image block
-	dd if=/dev/zero of=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.$fstype seek=$ROOTFS_SIZE count=$COUNT bs=1024
-	mkfs.$fstype -F $extra_imagecmd ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.$fstype -d ${IMAGE_ROOTFS}
+	dd if=/dev/zero of=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype seek=$ROOTFS_SIZE count=$COUNT bs=1024
+	mkfs.$fstype -F $extra_imagecmd ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype -d ${IMAGE_ROOTFS}
 }
 
 IMAGE_CMD_ext2 = "oe_mkext234fs ext2 ${EXTRA_IMAGECMD}"
@@ -69,16 +74,16 @@ IMAGE_CMD_ext4 = "oe_mkext234fs ext4 ${EXTRA_IMAGECMD}"
 MIN_BTRFS_SIZE ?= "16384"
 IMAGE_CMD_btrfs () {
 	if [ ${ROOTFS_SIZE} -gt ${MIN_BTRFS_SIZE} ]; then
-		dd if=/dev/zero of=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.btrfs count=${ROOTFS_SIZE} bs=1024
-		mkfs.btrfs ${EXTRA_IMAGECMD} -r ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.btrfs
+		dd if=/dev/zero of=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.btrfs count=${ROOTFS_SIZE} bs=1024
+		mkfs.btrfs ${EXTRA_IMAGECMD} -r ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.btrfs
 	else
 		bbfatal "Rootfs is too small for BTRFS (Rootfs Actual Size: ${ROOTFS_SIZE}, BTRFS Minimum Size: ${MIN_BTRFS_SIZE})"
 	fi
 }
 
-IMAGE_CMD_squashfs = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs ${EXTRA_IMAGECMD} -noappend"
-IMAGE_CMD_squashfs-xz = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs-xz ${EXTRA_IMAGECMD} -noappend -comp xz"
-IMAGE_CMD_squashfs-lzo = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs-lzo ${EXTRA_IMAGECMD} -noappend -comp lzo"
+IMAGE_CMD_squashfs = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs ${EXTRA_IMAGECMD} -noappend"
+IMAGE_CMD_squashfs-xz = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs-xz ${EXTRA_IMAGECMD} -noappend -comp xz"
+IMAGE_CMD_squashfs-lzo = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs-lzo ${EXTRA_IMAGECMD} -noappend -comp lzo"
 
 # By default, tar from the host is used, which can be quite old. If
 # you need special parameters (like --xattrs) which are only supported
@@ -91,18 +96,18 @@ IMAGE_CMD_squashfs-lzo = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE
 # In practice, it turned out to be not needed when creating archives and
 # required when extracting, but it seems prudent to use it in both cases.
 IMAGE_CMD_TAR ?= "tar"
-IMAGE_CMD_tar = "${IMAGE_CMD_TAR} -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar -C ${IMAGE_ROOTFS} ."
+IMAGE_CMD_tar = "${IMAGE_CMD_TAR} -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C ${IMAGE_ROOTFS} ."
 
 do_image_cpio[cleandirs] += "${WORKDIR}/cpio_append"
 IMAGE_CMD_cpio () {
-	(cd ${IMAGE_ROOTFS} && find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
+	(cd ${IMAGE_ROOTFS} && find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)
 	if [ ! -L ${IMAGE_ROOTFS}/init -a ! -e ${IMAGE_ROOTFS}/init ]; then
 		if [ -L ${IMAGE_ROOTFS}/sbin/init -o -e ${IMAGE_ROOTFS}/sbin/init ]; then
 			ln -sf /sbin/init ${WORKDIR}/cpio_append/init
 		else
 			touch ${WORKDIR}/cpio_append/init
 		fi
-		(cd  ${WORKDIR}/cpio_append && echo ./init | cpio -oA -H newc -F ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
+		(cd  ${WORKDIR}/cpio_append && echo ./init | cpio -oA -H newc -F ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)
 	fi
 }
 
@@ -110,8 +115,8 @@ ELF_KERNEL ?= "${STAGING_DIR_HOST}/usr/src/kernel/${KERNEL_IMAGETYPE}"
 ELF_APPEND ?= "ramdisk_size=32768 root=/dev/ram0 rw console="
 
 IMAGE_CMD_elf () {
-	test -f ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.elf && rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.elf
-	mkelfImage --kernel=${ELF_KERNEL} --initrd=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.elf --append='${ELF_APPEND}' ${EXTRA_IMAGECMD}
+	test -f ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.elf && rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.elf
+	mkelfImage --kernel=${ELF_KERNEL} --initrd=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio.gz --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.elf --append='${ELF_APPEND}' ${EXTRA_IMAGECMD}
 }
 IMAGE_TYPEDEP_elf = "cpio.gz"
 
@@ -128,13 +133,13 @@ multiubi_mkfs() {
 
 	echo \[ubifs\] > ubinize${vname}-${IMAGE_NAME}.cfg
 	echo mode=ubi >> ubinize${vname}-${IMAGE_NAME}.cfg
-	echo image=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${vname}.rootfs.ubifs >> ubinize${vname}-${IMAGE_NAME}.cfg
+	echo image=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubifs >> ubinize${vname}-${IMAGE_NAME}.cfg
 	echo vol_id=0 >> ubinize${vname}-${IMAGE_NAME}.cfg
 	echo vol_type=dynamic >> ubinize${vname}-${IMAGE_NAME}.cfg
 	echo vol_name=${UBI_VOLNAME} >> ubinize${vname}-${IMAGE_NAME}.cfg
 	echo vol_flags=autoresize >> ubinize${vname}-${IMAGE_NAME}.cfg
-	mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${vname}.rootfs.ubifs ${mkubifs_args}
-	ubinize -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${vname}.rootfs.ubi ${ubinize_args} ubinize${vname}-${IMAGE_NAME}.cfg
+	mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubifs ${mkubifs_args}
+	ubinize -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubi ${ubinize_args} ubinize${vname}-${IMAGE_NAME}.cfg
 
 	# Cleanup cfg file
 	mv ubinize${vname}-${IMAGE_NAME}.cfg ${DEPLOY_DIR_IMAGE}/
@@ -142,12 +147,12 @@ multiubi_mkfs() {
 	# Create own symlinks for 'named' volumes
 	if [ -n "$vname" ]; then
 		cd ${DEPLOY_DIR_IMAGE}
-		if [ -e ${IMAGE_NAME}${vname}.rootfs.ubifs ]; then
-			ln -sf ${IMAGE_NAME}${vname}.rootfs.ubifs \
+		if [ -e ${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubifs ]; then
+			ln -sf ${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubifs \
 			${IMAGE_LINK_NAME}${vname}.ubifs
 		fi
-		if [ -e ${IMAGE_NAME}${vname}.rootfs.ubi ]; then
-			ln -sf ${IMAGE_NAME}${vname}.rootfs.ubi \
+		if [ -e ${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubi ]; then
+			ln -sf ${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubi \
 			${IMAGE_LINK_NAME}${vname}.ubi
 		fi
 		cd -
@@ -168,7 +173,7 @@ IMAGE_CMD_ubi () {
 	multiubi_mkfs "${MKUBIFS_ARGS}" "${UBINIZE_ARGS}"
 }
 
-IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs ${MKUBIFS_ARGS}"
+IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.ubifs ${MKUBIFS_ARGS}"
 
 WKS_FILE ?= "${IMAGE_BASENAME}.${MACHINE}.wks"
 WKS_FILES ?= "${WKS_FILE} ${IMAGE_BASENAME}.wks"
@@ -193,7 +198,7 @@ IMAGE_CMD_wic () {
 	fi
 
 	BUILDDIR="${TOPDIR}" wic create "$wks" --vars "${STAGING_DIR_TARGET}/imgdata/" -e "${IMAGE_BASENAME}" -o "$out/"
-	mv "$out/build/$(basename "${wks%.wks}")"*.direct "$out.rootfs.wic"
+	mv "$out/build/$(basename "${wks%.wks}")"*.direct "$out${IMAGE_NAME_SUFFIX}.wic"
 	rm -rf "$out/"
 }
 IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES"
@@ -255,12 +260,12 @@ IMAGE_TYPES = " \
 "
 
 COMPRESSIONTYPES = "gz bz2 lzma xz lz4 sum"
-COMPRESS_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}.rootfs.${type}"
-COMPRESS_CMD_gz = "gzip -f -9 -c ${IMAGE_NAME}.rootfs.${type} > ${IMAGE_NAME}.rootfs.${type}.gz"
-COMPRESS_CMD_bz2 = "pbzip2 -f -k ${IMAGE_NAME}.rootfs.${type}"
-COMPRESS_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}.rootfs.${type} > ${IMAGE_NAME}.rootfs.${type}.xz"
-COMPRESS_CMD_lz4 = "lz4c -9 -c ${IMAGE_NAME}.rootfs.${type} > ${IMAGE_NAME}.rootfs.${type}.lz4"
-COMPRESS_CMD_sum = "sumtool -i ${IMAGE_NAME}.rootfs.${type} -o ${IMAGE_NAME}.rootfs.${type}.sum ${JFFS2_SUM_EXTRA_ARGS}"
+COMPRESS_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
+COMPRESS_CMD_gz = "gzip -f -9 -c ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
+COMPRESS_CMD_bz2 = "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
+COMPRESS_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz"
+COMPRESS_CMD_lz4 = "lz4c -9 -c ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
+COMPRESS_CMD_sum = "sumtool -i ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sum ${JFFS2_SUM_EXTRA_ARGS}"
 COMPRESS_DEPENDS_lzma = "xz-native"
 COMPRESS_DEPENDS_gz = ""
 COMPRESS_DEPENDS_bz2 = "pbzip2-native"
-- 
2.1.4



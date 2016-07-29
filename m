Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9B1B7607A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 15:35:25 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 29 Jul 2016 08:35:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,440,1464678000"; d="scan'208";a="741536039"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 29 Jul 2016 08:35:25 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 3DBF46A4006;
	Fri, 29 Jul 2016 08:35:13 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jul 2016 17:58:52 +0300
Message-Id: <1469804332-18697-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] image.bbclass: rename COMPRESS(ION) to CONVERSION
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
X-List-Received-Date: Fri, 29 Jul 2016 15:35:27 -0000

From: Patrick Ohly <patrick.ohly@intel.com>

With the enhanced functionality, the term "compression" is no longer
accurate, because the mechanism also gets used for conversion
operations that do not actually compress data.

It is possible to remove this naming problem in a backward-compatible
manner by including COMPRESSIONTYPES in CONVERSIONTYPES and checking for
the old COMPRESS_CMD/DEPENDS as fallbacks.

[YOCTO #9346]

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image.bbclass             |  9 +++---
 meta/classes/image_types.bbclass       | 50 +++++++++++++++++-----------------
 meta/classes/image_types_uboot.bbclass | 18 ++++++------
 3 files changed, 39 insertions(+), 38 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index af789f4..c06dee2 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -118,7 +118,7 @@ def rootfs_variables(d):
                  'IMAGE_ROOTFS_MAXSIZE','IMAGE_NAME','IMAGE_LINK_NAME','IMAGE_MANIFEST','DEPLOY_DIR_IMAGE','RM_OLD_IMAGE','IMAGE_FSTYPES','IMAGE_INSTALL_COMPLEMENTARY','IMAGE_LINGUAS',
                  'MULTILIBRE_ALLOW_REP','MULTILIB_TEMP_ROOTFS','MULTILIB_VARIANTS','MULTILIBS','ALL_MULTILIB_PACKAGE_ARCHS','MULTILIB_GLOBAL_VARIANTS','BAD_RECOMMENDATIONS','NO_RECOMMENDATIONS',
                  'PACKAGE_ARCHS','PACKAGE_CLASSES','TARGET_VENDOR','TARGET_ARCH','TARGET_OS','OVERRIDES','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_URI','INTERCEPT_DIR','USE_DEVFS',
-                 'COMPRESSIONTYPES', 'IMAGE_GEN_DEBUGFS', 'ROOTFS_RO_UNNEEDED']
+                 'CONVERSIONTYPES', 'IMAGE_GEN_DEBUGFS', 'ROOTFS_RO_UNNEEDED']
     variables.extend(rootfs_command_variables(d))
     variables.extend(variable_depends(d))
     return " ".join(variables)
@@ -343,7 +343,7 @@ python setup_debugfs () {
 
 python () {
     vardeps = set()
-    # We allow COMPRESSIONTYPES to have duplicates. That avoids breaking
+    # We allow CONVERSIONTYPES to have duplicates. That avoids breaking
     # derived distros when OE-core or some other layer independently adds
     # the same type. There is still only one command for each type, but
     # presumably the commands will do the same when the type is the same,
@@ -351,7 +351,7 @@ python () {
     #
     # Without de-duplication, gen_conversion_cmds() below
     # would create the same compression command multiple times.
-    ctypes = set(d.getVar('COMPRESSIONTYPES', True).split())
+    ctypes = set(d.getVar('CONVERSIONTYPES', True).split())
     old_overrides = d.getVar('OVERRIDES', 0)
 
     def _image_base_type(type):
@@ -456,9 +456,10 @@ python () {
                     # Create input image first.
                     gen_conversion_cmds(type)
                     localdata.setVar('type', type)
-                    cmd = "\t" + localdata.getVar("COMPRESS_CMD_" + ctype, True)
+                    cmd = "\t" + (localdata.getVar("CONVERSION_CMD_" + ctype, True) or localdata.getVar("COMPRESS_CMD_" + ctype, True))
                     if cmd not in cmds:
                         cmds.append(cmd)
+                    vardeps.add('CONVERSION_CMD_' + ctype)
                     vardeps.add('COMPRESS_CMD_' + ctype)
                     subimage = type + "." + ctype
                     if subimage not in subimages:
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 2b97397..4d92866 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -29,7 +29,7 @@ def imagetypes_getdepends(d):
         for typedepends in (d.getVar("IMAGE_TYPEDEP_%s" % basetype, True) or "").split():
             adddep(d.getVar('IMAGE_DEPENDS_%s' % typedepends, True) , deps)
         for ctype in resttypes:
-            adddep(d.getVar("COMPRESS_DEPENDS_%s" % ctype, True), deps)
+            adddep(d.getVar("CONVERSION_DEPENDS_%s" % ctype, True), deps)
 
     # Sort the set so that ordering is consistant
     return " ".join(sorted(deps))
@@ -214,7 +214,7 @@ IMAGE_CMD_wic () {
 IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES"
 
 # Rebuild when the wks file or vars in WICVARS change
-USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join('wic.%s' % c for c in '${COMPRESSIONTYPES}'.split()), '1', '', d)}"
+USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join('wic.%s' % c for c in '${CONVERSIONTYPES}'.split()), '1', '', d)}"
 WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' % os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
 do_image_wic[file-checksums] += "${WKS_FILE_CHECKSUM}"
 
@@ -316,29 +316,29 @@ IMAGE_TYPES = " \
     wic wic.gz wic.bz2 wic.lzma \
 "
 
-COMPRESSIONTYPES = "gz bz2 lzma xz lz4 zip sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap"
-COMPRESS_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
-COMPRESS_CMD_gz = "gzip -f -9 -c ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
-COMPRESS_CMD_bz2 = "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
-COMPRESS_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz"
-COMPRESS_CMD_lz4 = "lz4c -9 -c ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
-COMPRESS_CMD_zip = "zip ${ZIP_COMPRESSION_LEVEL} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.zip ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
-COMPRESS_CMD_sum = "sumtool -i ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sum ${JFFS2_SUM_EXTRA_ARGS}"
-COMPRESS_CMD_md5sum = "md5sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.md5sum"
-COMPRESS_CMD_sha1sum = "sha1sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha1sum"
-COMPRESS_CMD_sha224sum = "sha224sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha224sum"
-COMPRESS_CMD_sha256sum = "sha256sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha256sum"
-COMPRESS_CMD_sha384sum = "sha384sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha384sum"
-COMPRESS_CMD_sha512sum = "sha512sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha512sum"
-COMPRESS_CMD_bmap = "bmaptool create ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.bmap"
-COMPRESS_DEPENDS_lzma = "xz-native"
-COMPRESS_DEPENDS_gz = ""
-COMPRESS_DEPENDS_bz2 = "pbzip2-native"
-COMPRESS_DEPENDS_xz = "xz-native"
-COMPRESS_DEPENDS_lz4 = "lz4-native"
-COMPRESS_DEPENDS_zip = "zip-native"
-COMPRESS_DEPENDS_sum = "mtd-utils-native"
-COMPRESS_DEPENDS_bmap = "bmap-tools-native"
+CONVERSIONTYPES = "gz bz2 lzma xz lz4 zip sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap"
+CONVERSION_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
+CONVERSION_CMD_gz = "gzip -f -9 -c ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
+CONVERSION_CMD_bz2 = "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
+CONVERSION_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz"
+CONVERSION_CMD_lz4 = "lz4c -9 -c ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
+CONVERSION_CMD_zip = "zip ${ZIP_COMPRESSION_LEVEL} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.zip ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
+CONVERSION_CMD_sum = "sumtool -i ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sum ${JFFS2_SUM_EXTRA_ARGS}"
+CONVERSION_CMD_md5sum = "md5sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.md5sum"
+CONVERSION_CMD_sha1sum = "sha1sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha1sum"
+CONVERSION_CMD_sha224sum = "sha224sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha224sum"
+CONVERSION_CMD_sha256sum = "sha256sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha256sum"
+CONVERSION_CMD_sha384sum = "sha384sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha384sum"
+CONVERSION_CMD_sha512sum = "sha512sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha512sum"
+CONVERSION_CMD_bmap = "bmaptool create ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.bmap"
+CONVERSION_DEPENDS_lzma = "xz-native"
+CONVERSION_DEPENDS_gz = ""
+CONVERSION_DEPENDS_bz2 = "pbzip2-native"
+CONVERSION_DEPENDS_xz = "xz-native"
+CONVERSION_DEPENDS_lz4 = "lz4-native"
+CONVERSION_DEPENDS_zip = "zip-native"
+CONVERSION_DEPENDS_sum = "mtd-utils-native"
+CONVERSION_DEPENDS_bmap = "bmap-tools-native"
 
 RUNNABLE_IMAGE_TYPES ?= "ext2 ext3 ext4"
 RUNNABLE_MACHINE_PATTERNS ?= "qemu"
diff --git a/meta/classes/image_types_uboot.bbclass b/meta/classes/image_types_uboot.bbclass
index 19e4aa2..f72d9b2 100644
--- a/meta/classes/image_types_uboot.bbclass
+++ b/meta/classes/image_types_uboot.bbclass
@@ -8,19 +8,19 @@ oe_mkimage () {
     fi
 }
 
-COMPRESSIONTYPES += "gz.u-boot bz2.u-boot lzma.u-boot u-boot"
+CONVERSIONTYPES += "gz.u-boot bz2.u-boot lzma.u-boot u-boot"
 
-COMPRESS_DEPENDS_u-boot = "u-boot-mkimage-native"
-COMPRESS_CMD_u-boot      = "oe_mkimage ${IMAGE_NAME}.rootfs.${type} none"
+CONVERSION_DEPENDS_u-boot = "u-boot-mkimage-native"
+CONVERSION_CMD_u-boot      = "oe_mkimage ${IMAGE_NAME}.rootfs.${type} none"
 
-COMPRESS_DEPENDS_gz.u-boot = "u-boot-mkimage-native"
-COMPRESS_CMD_gz.u-boot      = "${COMPRESS_CMD_gz}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.gz gzip clean"
+CONVERSION_DEPENDS_gz.u-boot = "u-boot-mkimage-native"
+CONVERSION_CMD_gz.u-boot      = "${CONVERSION_CMD_gz}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.gz gzip clean"
 
-COMPRESS_DEPENDS_bz2.u-boot = "u-boot-mkimage-native"
-COMPRESS_CMD_bz2.u-boot      = "${COMPRESS_CMD_bz2}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.bz2 bzip2 clean"
+CONVERSION_DEPENDS_bz2.u-boot = "u-boot-mkimage-native"
+CONVERSION_CMD_bz2.u-boot      = "${CONVERSION_CMD_bz2}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.bz2 bzip2 clean"
 
-COMPRESS_DEPENDS_lzma.u-boot = "u-boot-mkimage-native"
-COMPRESS_CMD_lzma.u-boot      = "${COMPRESS_CMD_lzma}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.lzma lzma clean"
+CONVERSION_DEPENDS_lzma.u-boot = "u-boot-mkimage-native"
+CONVERSION_CMD_lzma.u-boot      = "${CONVERSION_CMD_lzma}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.lzma lzma clean"
 
 IMAGE_TYPES += "ext2.u-boot ext2.gz.u-boot ext2.bz2.u-boot ext2.lzma.u-boot ext3.gz.u-boot ext4.gz.u-boot cpio.gz.u-boot"
 
-- 
2.1.4



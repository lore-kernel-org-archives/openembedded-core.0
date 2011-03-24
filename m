Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1Q2lyK-0006pf-CG
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Mar 2011 15:57:12 +0100
Received: by rex (Postfix, from userid 1000)
	id 9497121819; Thu, 24 Mar 2011 14:49:29 +0000 (GMT)
Message-Id: <a5c403f0fc71f38c0669691da7f637303ea09a27.1300978024.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1300978024.git.richard.purdie@linuxfoundation.org>
References: <cover.1300978024.git.richard.purdie@linuxfoundation.org>
Old-Date: Thu, 24 Mar 2011 14:26:31 +0000
Date: Thu, 24 Mar 2011 14:49:29 +0000
To: openembedded-core@lists.openembedded.org
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 1/2] bitbake.conf/image.bbclass: Move image type information into image_types.bbclass
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
X-List-Received-Date: Thu, 24 Mar 2011 14:57:13 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Image generation code in .conf files is hard to read as it needs to be
single line. By moving this to a separate class, multiline functions
can be used instead improving readability. It also declutters
bitbake.conf.

There is no real functional change with this patch but it highlights
the need for improvements in places such as the IMAGE_EXTRA_OPTION
ext* specific variable which makes no sense.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image.bbclass       |   22 +----------
 meta/classes/image_types.bbclass |   81 ++++++++++++++++++++++++++++++++++++++
 meta/conf/bitbake.conf           |   41 -------------------
 3 files changed, 82 insertions(+), 62 deletions(-)
 create mode 100644 meta/classes/image_types.bbclass

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index eb0d970..aa842c7 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -64,27 +64,7 @@ def get_devtable_list(d):
         str += " %s" % bb.which(bb.data.getVar('BBPATH', d, 1), devtable)
     return str
 
-def get_imagecmds(d):
-    cmds = "\n"
-    old_overrides = bb.data.getVar('OVERRIDES', d, 0)
-    for type in bb.data.getVar('IMAGE_FSTYPES', d, True).split():
-        localdata = bb.data.createCopy(d)
-        localdata.setVar('OVERRIDES', '%s:%s' % (type, old_overrides))
-        bb.data.update_data(localdata)
-        localdata.setVar('type', type)
-        cmd = localdata.getVar("IMAGE_CMD_" + type, True)
-        localdata.setVar('cmd', cmd)
-        cmds += localdata.getVar("runimagecmd", True)
-    return cmds
-
-runimagecmd () {
-	# Image generation code for image type ${type}
-	ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{size = $1 * ${IMAGE_OVERHEAD_FACTOR}; print (size > ${IMAGE_ROOTFS_SIZE} ? size : ${IMAGE_ROOTFS_SIZE}) }'`
-	${cmd}
-	cd ${DEPLOY_DIR_IMAGE}/
-	rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.${type}
-	ln -s ${IMAGE_NAME}.rootfs.${type} ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.${type}
-}
+inherit image_types
 
 IMAGE_POSTPROCESS_COMMAND ?= ""
 MACHINE_POSTPROCESS_COMMAND ?= ""
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
new file mode 100644
index 0000000..5c9bcd1
--- /dev/null
+++ b/meta/classes/image_types.bbclass
@@ -0,0 +1,81 @@
+def get_imagecmds(d):
+    cmds = "\n"
+    old_overrides = bb.data.getVar('OVERRIDES', d, 0)
+    for type in bb.data.getVar('IMAGE_FSTYPES', d, True).split():
+        localdata = bb.data.createCopy(d)
+        localdata.setVar('OVERRIDES', '%s:%s' % (type, old_overrides))
+        bb.data.update_data(localdata)
+        localdata.setVar('type', type)
+        cmd = localdata.getVar("IMAGE_CMD_" + type, True)
+        localdata.setVar('cmd', cmd)
+        cmds += localdata.getVar("runimagecmd", True)
+    return cmds
+
+runimagecmd () {
+	# Image generation code for image type ${type}
+	ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{size = $1 * ${IMAGE_OVERHEAD_FACTOR}; print (size > ${IMAGE_ROOTFS_SIZE} ? size : ${IMAGE_ROOTFS_SIZE}) }'`
+	${cmd}
+	cd ${DEPLOY_DIR_IMAGE}/
+	rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.${type}
+	ln -s ${IMAGE_NAME}.rootfs.${type} ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.${type}
+}
+
+IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 ${EXTRA_IMAGECMD}"
+IMAGE_CMD_yaffs2 = "mkyaffs2image ${EXTRA_IMAGECMD} ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.yaffs2"
+IMAGE_CMD_cramfs = "mkcramfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cramfs ${EXTRA_IMAGECMD}"
+IMAGE_CMD_ext2 = "genext2fs -b $ROOTFS_SIZE -d ${IMAGE_ROOTFS} ${IMAGE_EXTRA_OPTION} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2 ${EXTRA_IMAGECMD}"
+IMAGE_CMD_ext2.gz () {
+	rm -rf ${DEPLOY_DIR_IMAGE}/tmp.gz && mkdir ${DEPLOY_DIR_IMAGE}/tmp.gz
+	genext2fs -b ${IMAGE_ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${IMAGE_EXTRA_OPTION} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2 ${EXTRA_IMAGECMD}
+	gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2
+	mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2.gz
+	rmdir ${DEPLOY_DIR_IMAGE}/tmp.gz
+}
+IMAGE_CMD_ext3 () {
+	genext2fs -b $ROOTFS_SIZE -d ${IMAGE_ROOTFS} ${IMAGE_EXTRA_OPTION} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}
+	tune2fs -j ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3
+}
+IMAGE_CMD_ext3.gz () {
+	rm -rf ${DEPLOY_DIR_IMAGE}/tmp.gz && mkdir ${DEPLOY_DIR_IMAGE}/tmp.gz
+	genext2fs -b ${IMAGE_ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${IMAGE_EXTRA_OPTION} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}
+	tune2fs -j ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3
+	gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3
+	mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3.gz
+	rmdir ${DEPLOY_DIR_IMAGE}/tmp.gz
+}
+IMAGE_CMD_squashfs = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs ${EXTRA_IMAGECMD} -noappend"
+IMAGE_CMD_squashfs-lzma = "mksquashfs-lzma ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs-lzma ${EXTRA_IMAGECMD} -noappend"
+IMAGE_CMD_tar = "cd ${IMAGE_ROOTFS} && tar -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar ."
+IMAGE_CMD_tar.gz = "cd ${IMAGE_ROOTFS} && tar -zcvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar.gz ."
+IMAGE_CMD_tar.bz2 = "cd ${IMAGE_ROOTFS} && tar -jcvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar.bz2 ."
+IMAGE_CMD_cpio = "cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)"
+IMAGE_CMD_cpio.gz = "cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | gzip -c -9 >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz)"
+IMAGE_CMD_ubi () {
+	echo \[ubifs\] > ubinize.cfg 
+	echo mode=ubi >> ubinize.cfg
+	echo image=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs >> ubinize.cfg 
+	echo vol_id=0 >> ubinize.cfg 
+	echo vol_type=dynamic >> ubinize.cfg 
+	echo vol_name=${UBI_VOLNAME} >> ubinize.cfg 
+	echo vol_flags=autoresize >> ubinize.cfg
+	mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs ${MKUBIFS_ARGS} && ubinize -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${UBINIZE_ARGS} ubinize.cfg
+}
+IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img ${MKUBIFS_ARGS}"
+
+EXTRA_IMAGECMD = ""
+EXTRA_IMAGECMD_jffs2 = "--pad --little-endian --eraseblock=0x40000"
+EXTRA_IMAGECMD_yaffs2 = "1"
+
+IMAGE_DEPENDS = ""
+IMAGE_DEPENDS_jffs2 = "mtd-utils-native"
+IMAGE_DEPENDS_yaffs2 = "yaffs2-utils-native"
+IMAGE_DEPENDS_cramfs = "cramfs-native"
+IMAGE_DEPENDS_ext2 = "genext2fs-native"
+IMAGE_DEPENDS_ext2.gz = "genext2fs-native"
+IMAGE_DEPENDS_ext3 = "genext2fs-native e2fsprogs-native"
+IMAGE_DEPENDS_ext3.gz = "genext2fs-native e2fsprogs-native"
+IMAGE_DEPENDS_squashfs = "squashfs-tools-native"
+IMAGE_DEPENDS_squashfs-lzma = "squashfs-lzma-tools-native"
+IMAGE_DEPENDS_ubi = "mtd-utils-native"
+IMAGE_DEPENDS_ubifs = "mtd-utils-native"
+
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 22532db..8e89945 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -355,47 +355,6 @@ IMAGE_OVERHEAD_FACTOR ?= 1.3
 # Comment this option if you want default genext2fs behavior (i.e. create minimal inode number)
 IMAGE_EXTRA_OPTION ?= "-i 8192"
 
-IMAGE_CMD = ""
-IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 ${EXTRA_IMAGECMD}"
-IMAGE_CMD_yaffs2 = "mkyaffs2image ${EXTRA_IMAGECMD} ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.yaffs2"
-IMAGE_CMD_cramfs = "mkcramfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cramfs ${EXTRA_IMAGECMD}"
-IMAGE_CMD_ext2 = "genext2fs -b $ROOTFS_SIZE -d ${IMAGE_ROOTFS} ${IMAGE_EXTRA_OPTION} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2 ${EXTRA_IMAGECMD}"
-IMAGE_CMD_ext2.gz = "rm -rf ${DEPLOY_DIR_IMAGE}/tmp.gz && mkdir ${DEPLOY_DIR_IMAGE}/tmp.gz; genext2fs -b ${IMAGE_ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${IMAGE_EXTRA_OPTION} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2 ${EXTRA_IMAGECMD}; gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2; mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2.gz; rmdir ${DEPLOY_DIR_IMAGE}/tmp.gz"
-IMAGE_CMD_ext3 = "genext2fs -b $ROOTFS_SIZE -d ${IMAGE_ROOTFS} ${IMAGE_EXTRA_OPTION} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3"
-IMAGE_CMD_ext3.gz = "rm -rf ${DEPLOY_DIR_IMAGE}/tmp.gz && mkdir ${DEPLOY_DIR_IMAGE}/tmp.gz; genext2fs -b ${IMAGE_ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${IMAGE_EXTRA_OPTION} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3; gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3; mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3.gz; rmdir ${DEPLOY_DIR_IMAGE}/tmp.gz"
-IMAGE_CMD_squashfs = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs ${EXTRA_IMAGECMD} -noappend"
-IMAGE_CMD_squashfs-lzma = "mksquashfs-lzma ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs-lzma ${EXTRA_IMAGECMD} -noappend"
-IMAGE_CMD_tar = "cd ${IMAGE_ROOTFS} && tar -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar ."
-IMAGE_CMD_tar.gz = "cd ${IMAGE_ROOTFS} && tar -zcvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar.gz ."
-IMAGE_CMD_tar.bz2 = "cd ${IMAGE_ROOTFS} && tar -jcvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar.bz2 ."
-IMAGE_CMD_cpio = "cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)"
-IMAGE_CMD_cpio.gz = "cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | gzip -c -9 >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz)"
-IMAGE_CMD_ubi = "echo \[ubifs\] > ubinize.cfg ; echo mode=ubi >> ubinize.cfg ; echo image=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs >> ubinize.cfg ; echo vol_id=0 >> ubinize.cfg ; echo vol_type=dynamic >> ubinize.cfg ; echo vol_name=${UBI_VOLNAME} >> ubinize.cfg ; echo vol_flags=autoresize >> ubinize.cfg;mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs ${MKUBIFS_ARGS} && ubinize -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${UBINIZE_ARGS} ubinize.cfg"
-IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img ${MKUBIFS_ARGS}"
-
-EXTRA_IMAGECMD = ""
-EXTRA_IMAGECMD_jffs2 = "--pad --little-endian --eraseblock=0x40000"
-EXTRA_IMAGECMD_yaffs2 = "1"
-EXTRA_IMAGECMD_squashfs = ""
-EXTRA_IMAGECMD_squashfs-lzma = ""
-EXTRA_IMAGECMD_cpio = ""
-EXTRA_IMAGECMD_cpio.gz = ""
-EXTRA_IMAGECMD_ubi = ""
-EXTRA_IMAGECMD_ubifs = ""
-
-IMAGE_DEPENDS = ""
-IMAGE_DEPENDS_jffs2 = "mtd-utils-native"
-IMAGE_DEPENDS_yaffs2 = "yaffs2-utils-native"
-IMAGE_DEPENDS_cramfs = "cramfs-native"
-IMAGE_DEPENDS_ext2 = "genext2fs-native"
-IMAGE_DEPENDS_ext2.gz = "genext2fs-native"
-IMAGE_DEPENDS_ext3 = "genext2fs-native e2fsprogs-native"
-IMAGE_DEPENDS_ext3.gz = "genext2fs-native e2fsprogs-native"
-IMAGE_DEPENDS_squashfs = "squashfs-tools-native"
-IMAGE_DEPENDS_squashfs-lzma = "squashfs-lzma-tools-native"
-IMAGE_DEPENDS_ubi = "mtd-utils-native"
-IMAGE_DEPENDS_ubifs = "mtd-utils-native"
-
 EXTRA_IMAGEDEPENDS = ""
 
 ##################################################################
-- 
1.7.4.1




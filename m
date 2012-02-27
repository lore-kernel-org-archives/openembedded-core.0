Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S203x-0000Ek-V4 for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 13:52:23 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1RChtbI027283
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 12:43:55 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26957-05 for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 12:43:51 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1RChlcb027277
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 12:43:48 GMT
Message-ID: <1330346629.4593.20.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Feb 2012 12:43:49 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] image_types: Refactor compression code into a generic compression solution
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
X-List-Received-Date: Mon, 27 Feb 2012 12:52:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The current approach of adding each different compressed image type doesn't
scale. This patch changes the code so compressed images for each form are
automatically available using the form <type>.<compression type> in
IMAGE_FSTYPES. This doesn't change any existing externally visible behaviour
and the image generation process becomes more efficient as a result too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 54ab157..4db55ff 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -75,9 +75,7 @@ inherit image-${IMAGE_TYPE}
 
 python () {
     deps = d.getVarFlag('do_rootfs', 'depends') or ""
-    for type in (d.getVar('IMAGE_FSTYPES', True) or "").split():
-        for dep in ((d.getVar('IMAGE_DEPENDS_%s' % type) or "").split() or []):
-            deps += " %s:do_populate_sysroot" % dep
+    deps += imagetypes_getdepends(d)
     for dep in (d.getVar('EXTRA_IMAGEDEPENDS', True) or "").split():
         deps += " %s:do_populate_sysroot" % dep
     d.setVarFlag('do_rootfs', 'depends', deps)
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 3b26162..0fb68e7 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -2,7 +2,21 @@ def get_imagecmds(d):
     cmds = "\n"
     old_overrides = d.getVar('OVERRIDES', 0)
 
+    alltypes = d.getVar('IMAGE_FSTYPES', True).split()
     types = d.getVar('IMAGE_FSTYPES', True).split()
+    ctypes = d.getVar('COMPRESSIONTYPES', True).split()
+    cimages = {}
+
+    # Filter out all the compressed images from types
+    for type in types:
+        for ctype in ctypes:
+            if type.endswith("." + ctype):
+                basetype = type.rsplit(".", 1)[0]
+                types[types.index(type)] = basetype
+                if type not in cimages:
+                    cimages[basetype] = []
+                cimages[basetype].append(ctype)
+
     # Live images will be processed via inheriting bbclass and 
     # does not get processed here.
     # live images also depend on ext3 so ensure its present
@@ -11,11 +25,24 @@ def get_imagecmds(d):
             types.append("ext3")
         types.remove("live")
 
+    cmds += "	rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.*"
     for type in types:
+        ccmd = []
+        subimages = []
         localdata = bb.data.createCopy(d)
         localdata.setVar('OVERRIDES', '%s:%s' % (type, old_overrides))
         bb.data.update_data(localdata)
         localdata.setVar('type', type)
+        if type in cimages:
+            for ctype in cimages[type]:
+                ccmd.append("\t" + localdata.getVar("COMPRESS_CMD_" + ctype, True))
+                subimages.append(type + "." + ctype)
+        if type not in alltypes:
+            ccmd.append(localdata.expand("\trm ${IMAGE_NAME}.rootfs.${type}"))
+        else:
+            subimages.append(type)
+        localdata.setVar('ccmd', "\n".join(ccmd))
+        localdata.setVar('subimages', " ".join(subimages))
         cmd = localdata.getVar("IMAGE_CMD", True)
         localdata.setVar('cmd', cmd)
         cmds += localdata.getVar("runimagecmd", True)
@@ -25,10 +52,36 @@ runimagecmd () {
 	# Image generation code for image type ${type}
 	ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{base_size = ($1 * ${IMAGE_OVERHEAD_FACTOR});  OFMT = "%.0f" ; print ((base_size > ${IMAGE_ROOTFS_SIZE} ? base_size : ${IMAGE_ROOTFS_SIZE}) + ${IMAGE_ROOTFS_EXTRA_SPACE}) }'`
 	${cmd}
+	# Now create the needed compressed versions
 	cd ${DEPLOY_DIR_IMAGE}/
-	rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.${type}
-	ln -s ${IMAGE_NAME}.rootfs.${type} ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.${type}
-}
+        ${ccmd}
+	# And create the symlinks
+        for type in ${subimages}; do
+		ln -s ${IMAGE_NAME}.rootfs.$type ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.$type
+	done
+}
+
+def imagetypes_getdepends(d):
+    def adddep(depstr, deps):
+        for i in (depstr or "").split():
+            if i not in deps:
+                deps.append(i)
+
+    deps = []
+    ctypes = d.getVar('COMPRESSIONTYPES', True).split()
+    for type in (d.getVar('IMAGE_FSTYPES', True) or "").split():
+        basetype = type
+        for ctype in ctypes:
+            if type.endswith("." + ctype):
+                basetype = type.rsplit(".", 1)[0]
+                adddep(d.getVar("COMPRESS_DEPENDS_%s" % ctype, True), deps)
+                break
+        adddep(d.getVar('IMAGE_DEPENDS_%s' % basetype, True) , deps)
+
+    depstr = ""
+    for dep in deps:
+        depstr += " " + dep + ":do_populate_sysroot"
+    return depstr
 
 
 XZ_COMPRESSION_LEVEL ?= "-e -9"
@@ -46,40 +99,11 @@ IMAGE_CMD_ext2 () {
 	mv ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}/${IMAGE_NAME}.rootfs.ext2 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2
 	rmdir ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}
 }
-IMAGE_CMD_ext2.gz () {
-	rm -rf ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN} && mkdir ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}
-	genext2fs -b $ROOTFS_SIZE -i 4096 -d ${IMAGE_ROOTFS} ${EXTRA_IMAGECMD} ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}/${IMAGE_NAME}.rootfs.ext2
-	gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}/${IMAGE_NAME}.rootfs.ext2
-	mv ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}/${IMAGE_NAME}.rootfs.ext2.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2.gz
-	rmdir ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}
-}
-IMAGE_CMD_ext2.bz2 () {
-	rm -rf ${DEPLOY_DIR_IMAGE}/tmp.gz && mkdir ${DEPLOY_DIR_IMAGE}/tmp.gz
-	genext2fs -b $ROOTFS_SIZE -i 4096 -d ${IMAGE_ROOTFS} ${EXTRA_IMAGECMD} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2
-	bzip2 -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2
-	mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2.bz2 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2.bz2
-	rmdir ${DEPLOY_DIR_IMAGE}/tmp.gz
-}
-IMAGE_CMD_ext2.lzma () {
-	rm -rf ${DEPLOY_DIR_IMAGE}/tmp.gz && mkdir ${DEPLOY_DIR_IMAGE}/tmp.gz
-	genext2fs -b $ROOTFS_SIZE -i 4096 -d ${IMAGE_ROOTFS} ${EXTRA_IMAGECMD} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2
-	lzma -f -7 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2
-	mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2.lzma ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2.lzma
-	rmdir ${DEPLOY_DIR_IMAGE}/tmp.gz
-}
 
 IMAGE_CMD_ext3 () {
 	genext2fs -b $ROOTFS_SIZE -i 4096 -d ${IMAGE_ROOTFS} ${EXTRA_IMAGECMD} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3
 	tune2fs -j ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3
 }
-IMAGE_CMD_ext3.gz () {
-	rm -rf ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN} && mkdir ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}
-	genext2fs -b $ROOTFS_SIZE -i 4096 -d ${IMAGE_ROOTFS} ${EXTRA_IMAGECMD} ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}/${IMAGE_NAME}.rootfs.ext3
-	tune2fs -j ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}/${IMAGE_NAME}.rootfs.ext3
-	gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}/${IMAGE_NAME}.rootfs.ext3
-	mv ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}/${IMAGE_NAME}.rootfs.ext3.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3.gz
-	rmdir ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}
-}
 
 oe_mkext4fs () {
 	genext2fs -b $ROOTFS_SIZE -i 4096 -d ${IMAGE_ROOTFS} ${EXTRA_IMAGECMD} $1
@@ -97,13 +121,6 @@ oe_mkext4fs () {
 IMAGE_CMD_ext4 () {
 	oe_mkext4fs ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4
 }
-IMAGE_CMD_ext4.gz () {
-	rm -rf ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN} && mkdir ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}
-	oe_mkext4fs ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}/${IMAGE_NAME}.rootfs.ext4
-	gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}/${IMAGE_NAME}.rootfs.ext4
-	mv ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}/${IMAGE_NAME}.rootfs.ext4.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4.gz
-	rmdir ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}
-}
 
 IMAGE_CMD_btrfs () {
 	mkfs.btrfs -b `expr ${ROOTFS_SIZE} \* 1024` ${EXTRA_IMAGECMD} -r ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.btrfs
@@ -112,9 +129,6 @@ IMAGE_CMD_btrfs () {
 IMAGE_CMD_squashfs = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs ${EXTRA_IMAGECMD} -noappend"
 IMAGE_CMD_squashfs-lzma = "mksquashfs-lzma ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs-lzma ${EXTRA_IMAGECMD} -noappend"
 IMAGE_CMD_tar = "cd ${IMAGE_ROOTFS} && tar -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar ."
-IMAGE_CMD_tar.gz = "cd ${IMAGE_ROOTFS} && tar -zcvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar.gz ."
-IMAGE_CMD_tar.bz2 = "cd ${IMAGE_ROOTFS} && tar -jcvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar.bz2 ."
-IMAGE_CMD_tar.xz = "cd ${IMAGE_ROOTFS} && tar --xz -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar.xz ."
 
 CPIO_TOUCH_INIT () {
 	if [ ! -L ${IMAGE_ROOTFS}/init ]
@@ -126,18 +140,6 @@ IMAGE_CMD_cpio () {
 	${CPIO_TOUCH_INIT}
 	cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
 }
-IMAGE_CMD_cpio.gz () {
-	${CPIO_TOUCH_INIT}
-	cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | gzip -c -9 >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz)
-}
-IMAGE_CMD_cpio.xz () {
-	${CPIO_TOUCH_INIT}
-	cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | xz -c ${XZ_COMPRESSION_LEVEL} --check=${XZ_INTEGRITY_CHECK} > ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.xz) ${EXTRA_IMAGECMD}
-}
-IMAGE_CMD_cpio.lzma () {
-	${CPIO_TOUCH_INIT}
-	cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | xz --format=lzma -c ${XZ_COMPRESSION_LEVEL} --check=${XZ_INTEGRITY_CHECK} >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.lzma) ${EXTRA_IMAGECMD}
-}
 
 UBI_VOLNAME ?= "${MACHINE}-rootfs"
 
@@ -159,9 +161,7 @@ EXTRA_IMAGECMD = ""
 EXTRA_IMAGECMD_jffs2 ?= "--pad --little-endian --eraseblock=0x40000"
 # Change these if you want default genext2fs behavior (i.e. create minimal inode number)
 EXTRA_IMAGECMD_ext2 ?= "-i 8192"
-EXTRA_IMAGECMD_ext2.gz ?= "-i 8192"
 EXTRA_IMAGECMD_ext3 ?= "-i 8192"
-EXTRA_IMAGECMD_ext3.gz ?= "-i 8192"
 EXTRA_IMAGECMD_btrfs ?= ""
 
 IMAGE_DEPENDS = ""
@@ -169,22 +169,25 @@ IMAGE_DEPENDS_jffs2 = "mtd-utils-native"
 IMAGE_DEPENDS_sum.jffs2 = "mtd-utils-native"
 IMAGE_DEPENDS_cramfs = "cramfs-native"
 IMAGE_DEPENDS_ext2 = "genext2fs-native"
-IMAGE_DEPENDS_ext2.gz = "genext2fs-native"
-IMAGE_DEPENDS_ext2.bz2 = "genext2fs-native"
-IMAGE_DEPENDS_ext2.lzma = "genext2fs-native xz-native"
 IMAGE_DEPENDS_ext3 = "genext2fs-native e2fsprogs-native"
-IMAGE_DEPENDS_ext3.gz = "genext2fs-native e2fsprogs-native"
 IMAGE_DEPENDS_ext4 = "genext2fs-native e2fsprogs-native"
-IMAGE_DEPENDS_ext4.gz = "genext2fs-native e2fsprogs-native"
 IMAGE_DEPENDS_btrfs = "btrfs-tools-native"
 IMAGE_DEPENDS_squashfs = "squashfs-tools-native"
 IMAGE_DEPENDS_squashfs-lzma = "squashfs-lzma-tools-native"
-IMAGE_DEPENDS_tar.xz = "tar-native xz-native"
-IMAGE_DEPENDS_cpio.lzma = "xz-native"
-IMAGE_DEPENDS_cpio.xz = "xz-native"
 IMAGE_DEPENDS_ubi = "mtd-utils-native"
 IMAGE_DEPENDS_ubifs = "mtd-utils-native"
 IMAGE_DEPENDS_vmdk = "qemu-native"
 
 # This variable is available to request which values are suitable for IMAGE_FSTYPES
 IMAGE_TYPES = "jffs2 sum.jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz ext2.lzma btrfs live squashfs squashfs-lzma ubi tar tar.gz tar.bz2 tar.xz cpio cpio.gz cpio.xz cpio.lzma vmdk"
+
+COMPRESSIONTYPES = "gz bz2 lzma xy"
+COMPRESS_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}.rootfs.${type}"
+COMPRESS_CMD_gz = "gzip -f -9 -c ${IMAGE_NAME}.rootfs.${type} > ${IMAGE_NAME}.rootfs.${type}.gz"
+COMPRESS_CMD_bz2 = "bzip2 -k ${IMAGE_NAME}.rootfs.${type}"
+COMPRESS_CMD_xy = "xz -k -c ${XZ_COMPRESSION_LEVEL} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}.rootfs.${type}"
+COMPRESS_DEPENDS_lzma = "xz-native"
+COMPRESS_DEPENDS_gz = ""
+COMPRESS_DEPENDS_bz2 = ""
+COMPRESS_DEPENDS_xy = "xz-native"
+





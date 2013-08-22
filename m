Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 462356B451
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 13:13:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7MDDWHD018688
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 22 Aug 2013 06:13:32 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 22 Aug 2013 06:13:30 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Aug 2013 09:13:14 -0400
Message-ID: <56e547586b84e14e7c445a54c94d0f0eb2e6ab28.1377175027.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1377175027.git.liezhi.yang@windriver.com>
References: <cover.1377175027.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com
Subject: [PATCH 6/6] image_types.bbclass: replace genext2fs with populate-extfs.sh
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
X-List-Received-Date: Thu, 22 Aug 2013 13:13:30 -0000
Content-Type: text/plain

* The benefits:
  - Really support ext4

  - Support the sparse file (we lost the sparse file in the image in the
    past, the sparse file became into the common file)

  - Fix the error reported by fsck: (ext2/ext3)
      Inode 1025, i_size is 16384, should be 17408.

  - Have a uniform code for ext2/3/4 generation

* Comments from Darren Hart:
Basically, genext2fs doesn't support creating ext4 filesystems. It
creates, as I understand it, an ext2 filesystem, then adds a journal,
and sets some bits. It can't support the newer features like extents. So
what we end up with is a bit of a hack for a filesystem.

The ext tools (e2fsprogs) unfortunately don't provide an integrated
solution for generating prepopulated filesystem images as many other
mkfs* tools do. One thing missing was symlink support in libext2fs. I
added that support and demonstrated a script which uses the e2fsprogs
debugfs tool that can populate the newly formatted filesystem from a
directory and without root privileges.

[YOCTO #3848]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/image_types.bbclass |   46 +++++++++++++++-----------------------
 1 file changed, 18 insertions(+), 28 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 0e5a9a8..c168ed5 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -141,34 +141,24 @@ IMAGE_CMD_sum.jffs2 = "${IMAGE_CMD_jffs2} && sumtool -i ${DEPLOY_DIR_IMAGE}/${IM
 
 IMAGE_CMD_cramfs = "mkcramfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cramfs ${EXTRA_IMAGECMD}"
 
-IMAGE_CMD_ext2 () {
-	rm -rf ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN} && mkdir ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}
-	genext2fs -b $ROOTFS_SIZE -d ${IMAGE_ROOTFS} ${EXTRA_IMAGECMD} ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}/${IMAGE_NAME}.rootfs.ext2
-	mv ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}/${IMAGE_NAME}.rootfs.ext2 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2
-	rmdir ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}
-}
+oe_mkext234fs () {
+	fstype=$1
+	extra_imagecmd=""
 
-IMAGE_CMD_ext3 () {
-	genext2fs -b $ROOTFS_SIZE -d ${IMAGE_ROOTFS} ${EXTRA_IMAGECMD} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3
-	tune2fs -j ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3
-}
+	if [ $# -gt 1 ]; then
+		shift
+		extra_imagecmd=$@
+	fi
 
-oe_mkext4fs () {
-	genext2fs -b $ROOTFS_SIZE -d ${IMAGE_ROOTFS} ${EXTRA_IMAGECMD} $1
-	tune2fs -O extents,uninit_bg,dir_index,has_journal,filetype $1
-	e2fsck -yfDC0 $1 || chk=$?
-	case $chk in
-	0|1|2)
-	    ;;
-	*)
-	    return $chk
-	    ;;
-	esac
+	# Create a sparse image block
+	dd if=/dev/zero of=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.$fstype seek=$ROOTFS_SIZE count=0 bs=1k
+	mkfs.$fstype -F $extra_imagecmd ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.$fstype
+	populate-extfs.sh ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.$fstype
 }
 
-IMAGE_CMD_ext4 () {
-	oe_mkext4fs ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4
-}
+IMAGE_CMD_ext2 = "oe_mkext234fs ext2 ${EXTRA_IMAGECMD}"
+IMAGE_CMD_ext3 = "oe_mkext234fs ext3 ${EXTRA_IMAGECMD}"
+IMAGE_CMD_ext4 = "oe_mkext234fs ext4 ${EXTRA_IMAGECMD}"
 
 IMAGE_CMD_btrfs () {
 	mkfs.btrfs -b `expr ${ROOTFS_SIZE} \* 1024` ${EXTRA_IMAGECMD} -r ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.btrfs
@@ -218,7 +208,7 @@ JFFS2_ENDIANNESS ?= "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '--little-
 JFFS2_ERASEBLOCK ?= "0x40000"
 EXTRA_IMAGECMD_jffs2 ?= "--pad ${JFFS2_ENDIANNESS} --eraseblock=${JFFS2_ERASEBLOCK} --no-cleanmarkers"
 
-# Change these if you want default genext2fs behavior (i.e. create minimal inode number)
+# Change these if you want default mkfs behavior (i.e. create minimal inode number)
 EXTRA_IMAGECMD_ext2 ?= "-i 8192"
 EXTRA_IMAGECMD_ext3 ?= "-i 8192"
 EXTRA_IMAGECMD_ext4 ?= "-i 8192"
@@ -229,9 +219,9 @@ IMAGE_DEPENDS = ""
 IMAGE_DEPENDS_jffs2 = "mtd-utils-native"
 IMAGE_DEPENDS_sum.jffs2 = "mtd-utils-native"
 IMAGE_DEPENDS_cramfs = "cramfs-native"
-IMAGE_DEPENDS_ext2 = "genext2fs-native"
-IMAGE_DEPENDS_ext3 = "genext2fs-native e2fsprogs-native"
-IMAGE_DEPENDS_ext4 = "genext2fs-native e2fsprogs-native"
+IMAGE_DEPENDS_ext2 = "e2fsprogs-native"
+IMAGE_DEPENDS_ext3 = "e2fsprogs-native"
+IMAGE_DEPENDS_ext4 = "e2fsprogs-native"
 IMAGE_DEPENDS_btrfs = "btrfs-tools-native"
 IMAGE_DEPENDS_squashfs = "squashfs-tools-native"
 IMAGE_DEPENDS_squashfs-xz = "squashfs-tools-native"
-- 
1.7.10.4



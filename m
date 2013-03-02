Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UBkAk-0003F9-Eh
	for openembedded-core@lists.openembedded.org;
	Sat, 02 Mar 2013 12:00:25 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r22Ahk1W019966
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 2 Mar 2013 02:43:46 -0800 (PST)
Received: from pek-usp-3.wrs.com (128.224.163.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Sat, 2 Mar 2013 02:43:44 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 2 Mar 2013 18:46:42 +0800
Message-ID: <31706045a390b7c56f1aa01063c09f78e683cea6.1362217827.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1362217827.git.liezhi.yang@windriver.com>
References: <cover.1362217827.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com
Subject: [RFC PATCH 2/2] image_types.bbclass: replace genext2fs with populate-extfs.sh
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 02 Mar 2013 11:00:30 -0000
Content-Type: text/plain

Comments from Darren Hart:
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

This patches integrate this stage of development into OE-Core. We can
go about this in two ways. One is to just prototype this in a branch and
use it to validate the functionality and not make any changes to oe-core
image generation until mke2fs has initial directory support. The other
is to merge this and get broader testing of the concept and later move
to the full mke2fs implementation once it becomes available. I
understand the resistance to the latter, but long term I think it will
result in a more robust solution as we will have caught more of the
corner cases and have been able to do a better job integrating into
mke2fs the first time.

[YOCTO #3848]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/image_types.bbclass | 45 +++++++++++++++-------------------------
 1 file changed, 17 insertions(+), 28 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 6bb113d..7d543b3 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -135,34 +135,23 @@ IMAGE_CMD_sum.jffs2 = "${IMAGE_CMD_jffs2} && sumtool -i ${DEPLOY_DIR_IMAGE}/${IM
 
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
-	tune2fs -O extents,uninit_bg,dir_index,has_journal $1
-	e2fsck -yfDC0 $1 || chk=$?
-	case $chk in
-	0|1|2)
-	    ;;
-	*)
-	    return $chk
-	    ;;
-	esac
+	dd if=/dev/zero of=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.$fstype count=$ROOTFS_SIZE bs=1k
+	yes | mkfs.$fstype $extra_imagecmd ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.$fstype
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
@@ -212,7 +201,7 @@ JFFS2_ENDIANNESS ?= "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '--little-
 JFFS2_ERASEBLOCK ?= "0x40000"
 EXTRA_IMAGECMD_jffs2 ?= "--pad ${JFFS2_ENDIANNESS} --eraseblock=${JFFS2_ERASEBLOCK} --no-cleanmarkers"
 
-# Change these if you want default genext2fs behavior (i.e. create minimal inode number)
+# Change these if you want default mkfs behavior (i.e. create minimal inode number)
 EXTRA_IMAGECMD_ext2 ?= "-i 8192"
 EXTRA_IMAGECMD_ext3 ?= "-i 8192"
 EXTRA_IMAGECMD_ext4 ?= "-i 8192"
@@ -223,9 +212,9 @@ IMAGE_DEPENDS = ""
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
 IMAGE_DEPENDS_squashfs-lzma = "squashfs-tools-native"
-- 
1.7.11.2




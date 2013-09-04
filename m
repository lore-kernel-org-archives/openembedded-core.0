Return-Path: <valentin.popa@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id A4F316BD57
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2013 08:42:12 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 04 Sep 2013 01:42:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,1020,1367996400"; d="scan'208";a="290630882"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.58])
	by AZSMGA002.ch.intel.com with ESMTP; 04 Sep 2013 01:42:12 -0700
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Sep 2013 11:43:22 +0300
Message-Id: <1378284202-2781-1-git-send-email-valentin.popa@intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] HOB: split live into iso and hddimg
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
X-List-Received-Date: Wed, 04 Sep 2013 08:42:13 -0000

changes to split live into iso and hddimg without
adding a new image type class.

[YOCTO #3197]
---
 meta/classes/image.bbclass       | 12 +++++++++++-
 meta/classes/image_types.bbclass | 14 ++++++++++----
 2 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index ea59c36..ef99ecc 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -87,11 +87,21 @@ do_rootfs[depends] += "makedevs-native:do_populate_sysroot virtual/fakeroot-nati
 do_rootfs[depends] += "virtual/update-alternatives-native:do_populate_sysroot update-rc.d-native:do_populate_sysroot"
 do_rootfs[recrdeptask] += "do_packagedata"
 
-IMAGE_TYPE_live = '${@base_contains("IMAGE_FSTYPES", "live", "live", "empty", d)}'
+NOISO = '${@base_contains("IMAGE_FSTYPES", "iso", "0", "1", d)}'
+NOHDD = '${@base_contains("IMAGE_FSTYPES", "hddimg", "0", "1", d)}'
+
+def build_live(d):
+    if d.getVar('NOISO', True) == "0" or d.getVar('NOHDD', True) == "0":
+        return "live"
+    else:
+        return "empty"
+
+IMAGE_TYPE_live = '${@build_live(d)}'
 inherit image-${IMAGE_TYPE_live}
 IMAGE_TYPE_vmdk = '${@base_contains("IMAGE_FSTYPES", "vmdk", "vmdk", "empty", d)}'
 inherit image-${IMAGE_TYPE_vmdk}
 
+
 python () {
     deps = " " + imagetypes_getdepends(d)
     d.appendVarFlag('do_rootfs', 'depends', deps)
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index c168ed5..4eb4157 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -43,12 +43,18 @@ def get_imagecmds(d):
         if "ext3" not in alltypes:
             alltypes.append("ext3")
         types.remove("vmdk")
-    if "live" in types:
+    if "iso" in types:
         if "ext3" not in types:
             types.append("ext3")
         if "ext3" not in alltypes:
             alltypes.append("ext3")
-        types.remove("live")
+        types.remove("iso")
+    if "hddimg" in types:
+        if "ext3" not in types:
+            types.append("ext3")
+        if "ext3" not in alltypes:
+            alltypes.append("ext3")
+        types.remove("hddimg")
 
     if d.getVar('IMAGE_LINK_NAME', True):
         if d.getVar('RM_OLD_IMAGE', True) == "1":
@@ -115,7 +121,7 @@ def imagetypes_getdepends(d):
     deps = []
     ctypes = d.getVar('COMPRESSIONTYPES', True).split()
     for type in (d.getVar('IMAGE_FSTYPES', True) or "").split():
-        if type == "vmdk" or type == "live":
+        if type == "vmdk" or type == "iso" or type == "hddimg":
             type = "ext3"
         basetype = type
         for ctype in ctypes:
@@ -230,7 +236,7 @@ IMAGE_DEPENDS_ubi = "mtd-utils-native"
 IMAGE_DEPENDS_ubifs = "mtd-utils-native"
 
 # This variable is available to request which values are suitable for IMAGE_FSTYPES
-IMAGE_TYPES = "jffs2 sum.jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz ext2.lzma btrfs live squashfs squashfs-xz ubi ubifs tar tar.gz tar.bz2 tar.xz cpio cpio.gz cpio.xz cpio.lzma vmdk elf"
+IMAGE_TYPES = "jffs2 sum.jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz ext2.lzma btrfs squashfs squashfs-xz ubi ubifs tar tar.gz tar.bz2 tar.xz cpio cpio.gz cpio.xz cpio.lzma vmdk elf iso hddimg"
 
 COMPRESSIONTYPES = "gz bz2 lzma xz"
 COMPRESS_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}.rootfs.${type}"
-- 
1.8.1.2



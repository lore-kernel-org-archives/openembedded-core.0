Return-Path: <valentin.popa@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4515261005
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2013 12:32:43 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Sep 2013 05:32:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,992,1371106800"; d="scan'208";a="408064401"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.58])
	by fmsmga002.fm.intel.com with ESMTP; 27 Sep 2013 05:32:43 -0700
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Sep 2013 15:34:24 +0300
Message-Id: <1380285264-15761-1-git-send-email-valentin.popa@intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH_V6] image types: split live into iso and hddimg
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
X-List-Received-Date: Fri, 27 Sep 2013 12:32:43 -0000

Changes to split live into iso and hddimg without
adding a new image type class.
This patch has only a visible effect on HOB and solves
part 2 of #3197

[YOCTO #3197]

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 meta/classes/image.bbclass       | 12 +++++++++++-
 meta/classes/image_types.bbclass | 13 +++++++++----
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 7650594..422a826 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -90,7 +90,17 @@ do_rootfs[depends] += "makedevs-native:do_populate_sysroot virtual/fakeroot-nati
 do_rootfs[depends] += "virtual/update-alternatives-native:do_populate_sysroot update-rc.d-native:do_populate_sysroot"
 do_rootfs[recrdeptask] += "do_packagedata"
 
-IMAGE_TYPE_live = '${@base_contains("IMAGE_FSTYPES", "live", "live", "empty", d)}'
+def build_live(d):
+    if base_contains("IMAGE_FSTYPES", "live", "live", "0", d) == "0": # live is not set but hob might set iso or hddimg
+        d.setVar('NOISO', base_contains('IMAGE_FSTYPES', "iso", "0", "1", d))
+        d.setVar('NOHDD', base_contains('IMAGE_FSTYPES', "hddimg", "0", "1", d))
+        if d.getVar('NOISO', True) == "0" or d.getVar('NOHDD', True) == "0":
+            return "live"
+        return "empty"
+    return "live"
+
+IMAGE_TYPE_live = "${@build_live(d)}"
+
 inherit image-${IMAGE_TYPE_live}
 IMAGE_TYPE_vmdk = '${@base_contains("IMAGE_FSTYPES", "vmdk", "vmdk", "empty", d)}'
 inherit image-${IMAGE_TYPE_vmdk}
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 8c49169..9ead059 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -43,12 +43,17 @@ def get_imagecmds(d):
         if "ext3" not in alltypes:
             alltypes.append("ext3")
         types.remove("vmdk")
-    if "live" in types:
+    if "live" in types or "iso" in types or "hddimg" in types:
         if "ext3" not in types:
             types.append("ext3")
         if "ext3" not in alltypes:
             alltypes.append("ext3")
-        types.remove("live")
+        if "live" in types:
+            types.remove("live")
+        if "iso" in types:
+            types.remove("iso")
+        if "hddimg" in types:
+            types.remove("hddimg")
 
     if d.getVar('IMAGE_LINK_NAME', True):
         if d.getVar('RM_OLD_IMAGE', True) == "1":
@@ -115,7 +120,7 @@ def imagetypes_getdepends(d):
     deps = []
     ctypes = d.getVar('COMPRESSIONTYPES', True).split()
     for type in (d.getVar('IMAGE_FSTYPES', True) or "").split():
-        if type == "vmdk" or type == "live":
+        if type == "vmdk" or type == "live" or type == "iso" or type == "hddimg":
             type = "ext3"
         basetype = type
         for ctype in ctypes:
@@ -230,7 +235,7 @@ IMAGE_DEPENDS_ubi = "mtd-utils-native"
 IMAGE_DEPENDS_ubifs = "mtd-utils-native"
 
 # This variable is available to request which values are suitable for IMAGE_FSTYPES
-IMAGE_TYPES = "jffs2 sum.jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz ext2.lzma btrfs live squashfs squashfs-xz ubi ubifs tar tar.gz tar.bz2 tar.xz cpio cpio.gz cpio.xz cpio.lzma vmdk elf"
+IMAGE_TYPES = "jffs2 sum.jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz ext2.lzma btrfs iso hddimg squashfs squashfs-xz ubi ubifs tar tar.gz tar.bz2 tar.xz cpio cpio.gz cpio.xz cpio.lzma vmdk elf"
 
 COMPRESSIONTYPES = "gz bz2 lzma xz"
 COMPRESS_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}.rootfs.${type}"
-- 
1.8.1.2



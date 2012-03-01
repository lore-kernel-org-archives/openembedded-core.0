Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S30qp-0008UE-3j
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 08:54:59 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 29 Feb 2012 23:46:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="72182145"
Received: from unknown (HELO swold-mobl.myhome.westell.com) ([10.255.15.82])
	by AZSMGA002.ch.intel.com with ESMTP; 29 Feb 2012 23:46:29 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Feb 2012 23:46:21 -0800
Message-Id: <c96db42b0725ef58deca548bf6af74b5c2c9089a.1330587785.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1330587785.git.sgw@linux.intel.com>
References: <cover.1330587785.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330587785.git.sgw@linux.intel.com>
References: <cover.1330587785.git.sgw@linux.intel.com>
Subject: [PATCH 3/4] image-vmdk: Create image_vmdk class and setup image and image_types to use it
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
X-List-Received-Date: Thu, 01 Mar 2012 07:54:59 -0000

This creates a new image_vmdk class similar to live. The image_vmdk
class needs to have a hddimg created by the image-live class, so it
inherits it directly.

The changes to image_types is to ensure that both live and vmdk images
get the ext3 tools and dependencies.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/image-vmdk.bbclass  |   22 ++++++++++++++++++++++
 meta/classes/image.bbclass       |    6 ++++--
 meta/classes/image_types.bbclass |   15 +++++++++------
 3 files changed, 35 insertions(+), 8 deletions(-)
 create mode 100644 meta/classes/image-vmdk.bbclass

diff --git a/meta/classes/image-vmdk.bbclass b/meta/classes/image-vmdk.bbclass
new file mode 100644
index 0000000..d3e5481
--- /dev/null
+++ b/meta/classes/image-vmdk.bbclass
@@ -0,0 +1,22 @@
+
+SYSLINUX_PROMPT = "0"
+SYSLINUX_TIMEOUT = "1"
+SYSLINUX_LABELS = "boot"
+
+# creating VMDK relies on having a live hddimg so ensure we
+# inherit it here.
+inherit image-live
+
+create_vmdk_image () {
+	qemu-img convert -O vmdk ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.vmdk
+}
+
+python do_vmdkimg() {
+        bb.build.exec_func('create_vmdk_image', d)
+}
+
+addtask vmdkimg after do_bootimg before do_build
+do_vmdkimg[nostamp] = "1"
+
+do_vmdkimg[depends] += "qemu-native:do_populate_sysroot" 
+
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index ec75cc1..dfce381 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -70,8 +70,10 @@ LDCONFIGDEPEND_libc-uclibc = ""
 do_rootfs[depends] += "makedevs-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot ${LDCONFIGDEPEND}"
 do_rootfs[depends] += "virtual/update-alternatives-native:do_populate_sysroot update-rc.d-native:do_populate_sysroot"
 
-IMAGE_TYPE = '${@base_contains("IMAGE_FSTYPES", "live", "live", "empty", d)}'
-inherit image-${IMAGE_TYPE}
+IMAGE_TYPE_live = '${@base_contains("IMAGE_FSTYPES", "live", "live", "empty", d)}'
+inherit image-${IMAGE_TYPE_live}
+IMAGE_TYPE_vmdk = '${@base_contains("IMAGE_FSTYPES", "vmdk", "vmdk", "empty", d)}'
+inherit image-${IMAGE_TYPE_vmdk}
 
 python () {
     deps = d.getVarFlag('do_rootfs', 'depends') or ""
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 5b48a09..f756c39 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -18,9 +18,13 @@ def get_imagecmds(d):
                 cimages[basetype].append(ctype)
                 break
 
-    # Live images will be processed via inheriting bbclass and 
-    # does not get processed here.
-    # live images also depend on ext3 so ensure its present
+    # Live and VMDK images will be processed via inheriting
+    # bbclass and does not get processed here.
+    # vmdk depend on live images also depend on ext3 so ensure its present
+    if "vmdk" in types:
+        if "ext3" not in types:
+            types.append("ext3")
+        types.remove("vmdk")
     if "live" in types:
         if "ext3" not in types:
             types.append("ext3")
@@ -75,6 +79,8 @@ def imagetypes_getdepends(d):
     deps = []
     ctypes = d.getVar('COMPRESSIONTYPES', True).split()
     for type in (d.getVar('IMAGE_FSTYPES', True) or "").split():
+        if type == "vmdk" or type == "live":
+            type = "ext3"
         basetype = type
         for ctype in ctypes:
             if type.endswith("." + ctype):
@@ -160,8 +166,6 @@ IMAGE_CMD_ubi () {
 }
 IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs ${MKUBIFS_ARGS}"
 
-IMAGE_CMD_vmdk = "qemu-img convert -O vmdk ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hdddirect ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.vmdk"
-
 EXTRA_IMAGECMD = ""
 EXTRA_IMAGECMD_jffs2 ?= "--pad --little-endian --eraseblock=0x40000"
 # Change these if you want default genext2fs behavior (i.e. create minimal inode number)
@@ -181,7 +185,6 @@ IMAGE_DEPENDS_squashfs = "squashfs-tools-native"
 IMAGE_DEPENDS_squashfs-lzma = "squashfs-lzma-tools-native"
 IMAGE_DEPENDS_ubi = "mtd-utils-native"
 IMAGE_DEPENDS_ubifs = "mtd-utils-native"
-IMAGE_DEPENDS_vmdk = "qemu-native"
 
 # This variable is available to request which values are suitable for IMAGE_FSTYPES
 IMAGE_TYPES = "jffs2 sum.jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz ext2.lzma btrfs live squashfs squashfs-lzma ubi tar tar.gz tar.bz2 tar.xz cpio cpio.gz cpio.xz cpio.lzma vmdk"
-- 
1.7.7.6




Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QlyuZ-00028v-Ic
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 09:52:11 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Jul 2011 00:47:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,275,1309762800"; d="scan'208";a="31949397"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.61])
	by azsmga001.ch.intel.com with ESMTP; 27 Jul 2011 00:47:37 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2011 00:47:24 -0700
Message-Id: <32b657583d80fc2bd481b1e5ea12af01dda14e49.1311752531.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
Subject: [Consolidated & Tested 34/35] classes/image*: Revamp creation of live images
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
X-List-Received-Date: Wed, 27 Jul 2011 07:52:13 -0000

This creates a live image as an IMAGE_FSTYPES, thus removing the
need to have additional -live.bb recipes.  To create a live image
one just needs to add live to the IMAGE_FSTYPES list

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/image-live.bbclass  |   13 +++++++++++++
 meta/classes/image.bbclass       |    3 +++
 meta/classes/image_types.bbclass |   15 +++++++++++++--
 3 files changed, 29 insertions(+), 2 deletions(-)
 create mode 100644 meta/classes/image-empty.bbclass
 create mode 100644 meta/classes/image-live.bbclass

diff --git a/meta/classes/image-empty.bbclass b/meta/classes/image-empty.bbclass
new file mode 100644
index 0000000..e69de29
diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
new file mode 100644
index 0000000..2568d5c
--- /dev/null
+++ b/meta/classes/image-live.bbclass
@@ -0,0 +1,13 @@
+
+AUTO_SYSLINUXCFG = "1"
+INITRD = "${DEPLOY_DIR_IMAGE}/core-image-minimal-initramfs-${MACHINE}.cpio.gz"
+APPEND += "root=/dev/ram0 "
+TIMEOUT = "10"
+LABELS += "boot install"
+
+ROOTFS = "${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}-${MACHINE}.ext3"
+
+do_bootimg[depends] += "core-image-minimal-initramfs:do_rootfs"
+do_bootimg[depends] += "${IMAGE_BASENAME}:do_rootfs"
+
+inherit image-live
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index edfb2d6..79a56f0 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -29,6 +29,9 @@ LDCONFIGDEPEND_libc-uclibc = ""
 do_rootfs[depends] += "makedevs-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot ${LDCONFIGDEPEND}"
 do_rootfs[depends] += "virtual/update-alternatives-native:do_populate_sysroot update-rc.d-native:do_populate_sysroot"
 
+IMAGE_TYPE = ${@base_contains("IMAGE_FSTYPES", "live", "live", "empty", d)}
+inherit image-${IMAGE_TYPE}
+
 python () {
     deps = bb.data.getVarFlag('do_rootfs', 'depends', d) or ""
     for type in (bb.data.getVar('IMAGE_FSTYPES', d, True) or "").split():
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index f1aef86..cd901c1 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -1,7 +1,18 @@
+
 def get_imagecmds(d):
     cmds = "\n"
     old_overrides = bb.data.getVar('OVERRIDES', d, 0)
-    for type in bb.data.getVar('IMAGE_FSTYPES', d, True).split():
+
+    types = bb.data.getVar('IMAGE_FSTYPES', d, True).split()
+    # Live images will be processed via inheriting bbclass and 
+    # does not get processed here.
+    # live images also depend on ext3 so ensure its present
+    if "live" in types:
+        if "ext3" not in types:
+            types.append("ext3")
+        types.remove("live")
+
+    for type in types:
         localdata = bb.data.createCopy(d)
         localdata.setVar('OVERRIDES', '%s:%s' % (type, old_overrides))
         bb.data.update_data(localdata)
@@ -103,4 +114,4 @@ IMAGE_DEPENDS_ubi = "mtd-utils-native"
 IMAGE_DEPENDS_ubifs = "mtd-utils-native"
 
 # This variable is available to request which values are suitable for IMAGE_FSTYPES
-IMAGE_TYPES = "jffs2 cramfs ext2 ext2.gz ext3 ext3.gz squashfs squashfs-lzma ubi tar tar.gz tar.bz2 tar.xz cpio cpio.gz cpio.xz cpio.lzma"
+IMAGE_TYPES = "jffs2 cramfs ext2 ext2.gz ext3 ext3.gz live squashfs squashfs-lzma ubi tar tar.gz tar.bz2 tar.xz cpio cpio.gz cpio.xz cpio.lzma"
-- 
1.7.3.4




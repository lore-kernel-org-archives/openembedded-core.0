Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qld09-00005I-Pu
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 10:28:29 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 26 Jul 2011 01:24:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,268,1309762800"; d="scan'208";a="34539816"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.61])
	by fmsmga001.fm.intel.com with ESMTP; 26 Jul 2011 01:24:15 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2011 01:24:08 -0700
Message-Id: <1f4c4205e480da53c3af9bb89f8d49a73fdc1c1e.1311668437.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311668437.git.sgw@linux.intel.com>
References: <cover.1311668437.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311668437.git.sgw@linux.intel.com>
References: <cover.1311668437.git.sgw@linux.intel.com>
Subject: [RFC-WIP 1/3] classes/image*: Revamp creation of live images
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
X-List-Received-Date: Tue, 26 Jul 2011 08:28:30 -0000

This creates a live image as an IMAGE_FSTYPES, thus removing the
need to have additional -live.bb recipes.  To create a live image
one just needs to add live to the IMAGE_FSTYPES list

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../{bootimg.bbclass => image-live.bbclass}        |   11 +++++++++++
 meta/classes/image.bbclass                         |    3 +++
 meta/classes/image_types.bbclass                   |   20 ++++++++++++++++++--
 3 files changed, 32 insertions(+), 2 deletions(-)
 create mode 100644 meta/classes/image-empty.bbclass
 rename meta/classes/{bootimg.bbclass => image-live.bbclass} (91%)

diff --git a/meta/classes/image-empty.bbclass b/meta/classes/image-empty.bbclass
new file mode 100644
index 0000000..e69de29
diff --git a/meta/classes/bootimg.bbclass b/meta/classes/image-live.bbclass
similarity index 91%
rename from meta/classes/bootimg.bbclass
rename to meta/classes/image-live.bbclass
index 49ee85e..c9cd524 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -25,6 +25,17 @@
 # ${APPEND} - an override list of append strings for each label
 # ${SYSLINUX_OPTS} - additional options to add to the syslinux file ';' delimited 
 
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
 do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
                        syslinux:do_populate_sysroot \
                        syslinux-native:do_populate_sysroot \
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
index 1108802..1efdf06 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -1,7 +1,23 @@
+
 def get_imagecmds(d):
     cmds = "\n"
     old_overrides = bb.data.getVar('OVERRIDES', d, 0)
-    for type in bb.data.getVar('IMAGE_FSTYPES', d, True).split():
+
+    types = bb.data.getVar('IMAGE_FSTYPES', d, True).split()
+    try:
+        live_pos = types.index("live")
+        try:
+            ext3_pos = types.index("ext3")
+        except ValueError:
+            types.insert(live_pos, "ext3")
+        else:
+            if ext3_pos > live_pos:
+                types.pop(live_pos)
+                #types.append("live")
+    except ValueError:
+        pass
+
+    for type in types:
         localdata = bb.data.createCopy(d)
         localdata.setVar('OVERRIDES', '%s:%s' % (type, old_overrides))
         bb.data.update_data(localdata)
@@ -103,4 +119,4 @@ IMAGE_DEPENDS_ubi = "mtd-utils-native"
 IMAGE_DEPENDS_ubifs = "mtd-utils-native"
 
 # This variable is available to request which values are suitable for IMAGE_FSTYPES
-IMAGE_TYPES = "jffs2 cramfs ext2 ext2.gz ext3 ext3.gz squashfs squashfs-lzma ubi"
+IMAGE_TYPES = "jffs2 cramfs ext2 ext2.gz ext3 ext3.gz live squashfs squashfs-lzma ubi"
-- 
1.7.3.4




Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0D5307847D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 15:22:55 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jun 2017 08:22:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,347,1493708400"; d="scan'208";a="868713618"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 16 Jun 2017 08:22:56 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 97BED58027E;
	Fri, 16 Jun 2017 08:22:55 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 18:21:26 +0300
Message-Id: <1497626486-10681-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1497624074.24449.14.camel@linuxfoundation.org>
References: <1497624074.24449.14.camel@linuxfoundation.org>
Subject: [PATCH v5] image_types.bbclass: get rid of IMAGE_DEPENDS
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
X-List-Received-Date: Fri, 16 Jun 2017 15:22:56 -0000

The IMAGE_DEPENDS_<type> variables can be set to add dependencies for
individual image types.  Those dependencies are added to the do_rootfs
task, while they really should be added to the specific image type tasks.

These variables are not documented anywhere.

Replaced usage of IMAGE_DEPENDS_<type> with explicitly added
dependencies to do_image_<type> tasks.

[YOCTO #11302]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image_types.bbclass | 45 ++++++++++++++++++++++++----------------
 1 file changed, 27 insertions(+), 18 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 7749b00..82ef65f 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -26,20 +26,31 @@ def imagetypes_getdepends(d):
     fstypes = set((d.getVar('IMAGE_FSTYPES') or "").split())
     fstypes |= set((d.getVar('IMAGE_FSTYPES_DEBUGFS') or "").split())
 
+    deprecated = set()
     deps = set()
     for typestring in fstypes:
         basetype, resttypes = split_types(typestring)
-        adddep(d.getVar('IMAGE_DEPENDS_%s' % basetype) , deps)
+
+        var = "IMAGE_DEPENDS_%s" % basetype
+        if d.getVar(var) is not None:
+            deprecated.add(var)
 
         for typedepends in (d.getVar("IMAGE_TYPEDEP_%s" % basetype) or "").split():
             base, rest = split_types(typedepends)
-            adddep(d.getVar('IMAGE_DEPENDS_%s' % base) , deps)
             resttypes += rest
 
+            var = "IMAGE_DEPENDS_%s" % base
+            if d.getVar(var) is not None:
+                deprecated.add(var)
+
         for ctype in resttypes:
             adddep(d.getVar("CONVERSION_DEPENDS_%s" % ctype), deps)
             adddep(d.getVar("COMPRESS_DEPENDS_%s" % ctype), deps)
 
+    if deprecated:
+        bb.fatal('Deprecated variable(s) found: "%s". '
+                 'Use do_image_<type>[depends] += "<recipe>:<task>" instead' % ', '.join(deprecated))
+
     # Sort the set so that ordering is consistant
     return " ".join(sorted(deps))
 
@@ -101,7 +112,7 @@ IMAGE_CMD_squashfs-lzo = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAM
 # you need special parameters (like --xattrs) which are only supported
 # by GNU tar upstream >= 1.27, then override that default:
 # IMAGE_CMD_TAR = "tar --xattrs --xattrs-include=*"
-# IMAGE_DEPENDS_tar_append = " tar-replacement-native"
+# do_image_tar[depends] += "tar-replacement-native:do_populate_sysroot"
 # EXTRANATIVEPATH += "tar-native"
 #
 # The GNU documentation does not specify whether --xattrs-include is necessary.
@@ -209,21 +220,19 @@ EXTRA_IMAGECMD_ext4 ?= "-i 4096"
 EXTRA_IMAGECMD_btrfs ?= "-n 4096"
 EXTRA_IMAGECMD_elf ?= ""
 
-IMAGE_DEPENDS = ""
-IMAGE_DEPENDS_jffs2 = "mtd-utils-native"
-IMAGE_DEPENDS_cramfs = "util-linux-native"
-IMAGE_DEPENDS_ext2 = "e2fsprogs-native"
-IMAGE_DEPENDS_ext3 = "e2fsprogs-native"
-IMAGE_DEPENDS_ext4 = "e2fsprogs-native"
-IMAGE_DEPENDS_btrfs = "btrfs-tools-native"
-IMAGE_DEPENDS_squashfs = "squashfs-tools-native"
-IMAGE_DEPENDS_squashfs-xz = "squashfs-tools-native"
-IMAGE_DEPENDS_squashfs-lzo = "squashfs-tools-native"
-IMAGE_DEPENDS_elf = "virtual/kernel mkelfimage-native"
-IMAGE_DEPENDS_ubi = "mtd-utils-native"
-IMAGE_DEPENDS_ubifs = "mtd-utils-native"
-IMAGE_DEPENDS_multiubi = "mtd-utils-native"
-IMAGE_DEPENDS_wic = "parted-native"
+do_image_jffs2[depends] += "mtd-utils-native:do_populate_sysroot"
+do_image_cramfs[depends] += "util-linux-native:do_populate_sysroot"
+do_image_ext2[depends] += "e2fsprogs-native:do_populate_sysroot"
+do_image_ext3[depends] += "e2fsprogs-native:do_populate_sysroot"
+do_image_ext4[depends] += "e2fsprogs-native:do_populate_sysroot"
+do_image_btrfs[depends] += "btrfs-tools-native:do_populate_sysroot"
+do_image_squashfs[depends] += "squashfs-tools-native:do_populate_sysroot"
+do_image_squashfs-xz[depends] += "squashfs-tools-native:do_populate_sysroot"
+do_image_squashfs-lzo[depends] += "squashfs-tools-native:do_populate_sysroot"
+do_image_elf[depends] += "virtual/kernel-native:do_populate_sysroot mkelfimage-native:do_populate_sysroot"
+do_image_ubi[depends] += "mtd-utils-native:do_populate_sysroot"
+do_image_ubifs[depends] += "mtd-utils-native:do_populate_sysroot"
+do_image_multiubi[depends] += "mtd-utils-native:do_populate_sysroot"
 
 # This variable is available to request which values are suitable for IMAGE_FSTYPES
 IMAGE_TYPES = " \
-- 
2.1.4



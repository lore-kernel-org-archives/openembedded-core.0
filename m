Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3C22F731CB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 04:44:57 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 08 May 2016 21:44:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,599,1455004800"; d="scan'208";a="99608841"
Received: from hschan-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.140.99])
	by fmsmga004.fm.intel.com with ESMTP; 08 May 2016 21:44:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 May 2016 16:43:32 +1200
Message-Id: <29259d2220b8e6e577a3efaa160b77e3366fb6d5.1462768634.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1462768634.git.paul.eggleton@linux.intel.com>
References: <cover.1462768634.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1462768634.git.paul.eggleton@linux.intel.com>
References: <cover.1462768634.git.paul.eggleton@linux.intel.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Tom Zanussi <tom.zanussi@intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [RFC PATCH 6/6] classes/image: check kernel config supports IMAGE_FSTYPES items
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
X-List-Received-Date: Mon, 09 May 2016 04:44:57 -0000

A lot of the IMAGE_FSTYPES items require the appropriate filesystem
driver to be enabled in the kernel configuration; e.g. in order to read
a btrfs filesystem, the kernel must enable CONFIG_BTRFS_FS. Add a check
to ensure that is the case.

Fixes [YOCTO #5574].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/image.bbclass       | 23 +++++++++++++++++++++++
 meta/classes/image_types.bbclass | 11 +++++++++++
 2 files changed, 34 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 4542e95..c56b053 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -238,9 +238,32 @@ do_rootfs[cleandirs] += "${S}"
 do_rootfs[umask] = "022"
 addtask rootfs before do_build
 
+inherit kernel-check
+
+def check_image_fstypes_kernel(d):
+    """
+    Check that the kernel we have built has the appropriate config options enabled
+    to support the image formats specified in IMAGE_FSTYPES
+    """
+    fstypes = (d.getVar('IMAGE_FSTYPES', True) or '').split()
+    ctypes = (d.getVar('COMPRESSIONTYPES', True) or '').split()
+    for fstype in fstypes:
+        kernconfig = (d.getVar('IMAGE_TYPE_KERNEL_OPTIONS_' + fstype, True) or '').split()
+        for ctype in ctypes:
+            if fstype.endswith("." + ctype):
+                basetype = fstype[:-len("." + ctype)]
+                kernconfig.extend((d.getVar('IMAGE_TYPE_KERNEL_OPTIONS_' + basetype, True) or '').split())
+        kernconfig = list(set(kernconfig))
+        if kernconfig:
+            missing, diffvalue = check_kernel_config_options(kernconfig, d)
+            if missing or diffvalue:
+                bb.warn('IMAGE_FSTYPES contains %s, but the following required kernel configuration items are not present in the kernel configuration:\n  %s' % (fstype, '\n  '.join(missing + ['%s=%s (actual value %s)' % item for item in diffvalue])))
+
 fakeroot python do_image () {
     from oe.utils import execute_pre_post_process
 
+    check_image_fstypes_kernel(d)
+
     pre_process_cmds = d.getVar("IMAGE_PREPROCESS_COMMAND", True)
 
     execute_pre_post_process(d, pre_process_cmds)
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 53af7ca..dd79726 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -240,6 +240,17 @@ IMAGE_DEPENDS_ubifs = "mtd-utils-native"
 IMAGE_DEPENDS_multiubi = "mtd-utils-native"
 IMAGE_DEPENDS_wic = "parted-native"
 
+IMAGE_TYPE_KERNEL_OPTIONS_jffs2 = "CONFIG_JFFS2_FS"
+IMAGE_TYPE_KERNEL_OPTIONS_jffs2.sum = "CONFIG_JFFS2_SUMMARY"
+IMAGE_TYPE_KERNEL_OPTIONS_cramfs = "CONFIG_CRAMFS"
+IMAGE_TYPE_KERNEL_OPTIONS_ext2 = "CONFIG_EXT2_FS|CONFIG_EXT4_USE_FOR_EXT23"
+IMAGE_TYPE_KERNEL_OPTIONS_ext3 = "CONFIG_EXT3_FS|CONFIG_EXT4_USE_FOR_EXT23"
+IMAGE_TYPE_KERNEL_OPTIONS_ext4 = "CONFIG_EXT4_FS"
+IMAGE_TYPE_KERNEL_OPTIONS_btrfs = "CONFIG_BTRFS_FS"
+IMAGE_TYPE_KERNEL_OPTIONS_squashfs = "CONFIG_SQUASHFS"
+IMAGE_TYPE_KERNEL_OPTIONS_squashfs-xz = "CONFIG_SQUASHFS_XZ"
+IMAGE_TYPE_KERNEL_OPTIONS_squashfs-lzo = "CONFIG_SQUASHFS_LZO"
+
 # This variable is available to request which values are suitable for IMAGE_FSTYPES
 IMAGE_TYPES = " \
     jffs2 jffs2.sum \
-- 
2.5.5



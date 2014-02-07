Return-Path: <tom.zanussi@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D85AE6E903
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2014 22:19:28 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 07 Feb 2014 14:15:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,803,1384329600"; d="scan'208";a="479862269"
Received: from unknown (HELO localhost) ([10.255.13.139])
	by orsmga002.jf.intel.com with ESMTP; 07 Feb 2014 14:19:29 -0800
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Feb 2014 16:19:28 -0600
Message-Id: <bffdae93a64a9b3a717eb09c57223ed44da26068.1391811371.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1391811371.git.tom.zanussi@linux.intel.com>
References: <cover.1391811371.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 1/1] wic: Honor --size for --source partititions
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
X-List-Received-Date: Fri, 07 Feb 2014 22:19:29 -0000

Instead of simply creating partitions large enough to contain the
contents of a --source partition (and adding a pre-specified amount of
padding), use the --size used in the partition .wks statement.

If --size isn't used, or is smaller than the actual --source size,
retain the current behavior.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 .../lib/mic/kickstart/custom_commands/partition.py | 57 +++++++++++++++++++---
 scripts/lib/mic/plugins/source/bootimg-efi.py      | 10 +++-
 scripts/lib/mic/plugins/source/bootimg-pcbios.py   | 10 +++-
 scripts/lib/mic/utils/oe/misc.py                   |  1 +
 4 files changed, 68 insertions(+), 10 deletions(-)

diff --git a/scripts/lib/mic/kickstart/custom_commands/partition.py b/scripts/lib/mic/kickstart/custom_commands/partition.py
index 4974a87..91d751e 100644
--- a/scripts/lib/mic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/mic/kickstart/custom_commands/partition.py
@@ -56,6 +56,12 @@ class Wic_PartData(Mic_PartData):
 
         return retval
 
+    def get_size(self):
+        """
+        Accessor for partition size, 0 or --size before set_size().
+        """
+        return self.size
+
     def set_size(self, size):
         """
         Accessor for actual partition size, which must be set by source
@@ -70,6 +76,29 @@ class Wic_PartData(Mic_PartData):
         """
         self.source_file = source_file
 
+    def get_extra_block_count(self, current_blocks):
+        """
+        The --size param is reflected in self.size (in MB), and we already
+        have current_blocks (1k) blocks, calculate and return the
+        number of (1k) blocks we need to add to get to --size, 0 if
+        we're already there or beyond.
+        """
+        msger.debug("Requested partition size for %s: %d" % \
+                    (self.mountpoint, self.size))
+
+        if not self.size:
+            return 0
+
+        requested_blocks = self.size * 1024
+
+        msger.debug("Requested blocks %d, current_blocks %d" % \
+                    (requested_blocks, current_blocks))
+
+        if requested_blocks > current_blocks:
+            return requested_blocks - current_blocks
+        else:
+            return 0
+
     def prepare(self, cr, cr_workdir, oe_builddir, rootfs_dir, bootimg_dir,
                 kernel_dir, native_sysroot):
         """
@@ -147,16 +176,22 @@ class Wic_PartData(Mic_PartData):
         """
         populate_script = "%s/usr/bin/populate-extfs.sh" % native_sysroot
 
-        image_extra_space = 10240
-
         image_rootfs = rootfs_dir
         rootfs = "%s/rootfs.%s" % (cr_workdir, self.fstype)
 
         du_cmd = "du -ks %s" % image_rootfs
         rc, out = exec_cmd(du_cmd)
-        actual_rootfs_size = out.split()[0]
+        actual_rootfs_size = int(out.split()[0])
+
+        extra_blocks = self.get_extra_block_count(actual_rootfs_size)
+
+        if extra_blocks < IMAGE_EXTRA_SPACE:
+            extra_blocks = IMAGE_EXTRA_SPACE
+
+        rootfs_size = actual_rootfs_size + extra_blocks
 
-        rootfs_size = int(actual_rootfs_size) + image_extra_space
+        msger.debug("Added %d extra blocks to %s to get to %d total blocks" % \
+                    (extra_blocks, self.mountpoint, rootfs_size))
 
         dd_cmd = "dd if=/dev/zero of=%s bs=1024 seek=%d count=0 bs=1k" % \
             (rootfs, rootfs_size)
@@ -187,16 +222,22 @@ class Wic_PartData(Mic_PartData):
 
         Currently handles ext2/3/4 and btrfs.
         """
-        image_extra_space = 10240
-
         image_rootfs = rootfs_dir
         rootfs = "%s/rootfs.%s" % (cr_workdir, self.fstype)
 
         du_cmd = "du -ks %s" % image_rootfs
         rc, out = exec_cmd(du_cmd)
-        actual_rootfs_size = out.split()[0]
+        actual_rootfs_size = int(out.split()[0])
+
+        extra_blocks = self.get_extra_block_count(actual_rootfs_size)
+
+        if extra_blocks < IMAGE_EXTRA_SPACE:
+            extra_blocks = IMAGE_EXTRA_SPACE
+
+        rootfs_size = actual_rootfs_size + extra_blocks
 
-        rootfs_size = int(actual_rootfs_size) + image_extra_space
+        msger.debug("Added %d extra blocks to %s to get to %d total blocks" % \
+                    (extra_blocks, self.mountpoint, rootfs_size))
 
         dd_cmd = "dd if=/dev/zero of=%s bs=1024 seek=%d count=0 bs=1k" % \
             (rootfs, rootfs_size)
diff --git a/scripts/lib/mic/plugins/source/bootimg-efi.py b/scripts/lib/mic/plugins/source/bootimg-efi.py
index 3e0997b..1974b06 100644
--- a/scripts/lib/mic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/mic/plugins/source/bootimg-efi.py
@@ -131,7 +131,15 @@ class BootimgEFIPlugin(SourcePlugin):
         rc, out = exec_cmd(du_cmd)
         blocks = int(out.split()[0])
 
-        blocks += BOOTDD_EXTRA_SPACE
+        extra_blocks = part.get_extra_block_count(blocks)
+
+        if extra_blocks < BOOTDD_EXTRA_SPACE:
+            extra_blocks = BOOTDD_EXTRA_SPACE
+
+        blocks += extra_blocks
+
+        msger.debug("Added %d extra blocks to %s to get to %d total blocks" % \
+                    (extra_blocks, part.mountpoint, blocks))
 
         # Ensure total sectors is an integral number of sectors per
         # track or mcopy will complain. Sectors are 512 bytes, and we
diff --git a/scripts/lib/mic/plugins/source/bootimg-pcbios.py b/scripts/lib/mic/plugins/source/bootimg-pcbios.py
index 3cd446f..fad150f 100644
--- a/scripts/lib/mic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/mic/plugins/source/bootimg-pcbios.py
@@ -154,7 +154,15 @@ class BootimgPcbiosPlugin(SourcePlugin):
         rc, out = exec_cmd(du_cmd)
         blocks = int(out.split()[0])
 
-        blocks += BOOTDD_EXTRA_SPACE
+        extra_blocks = part.get_extra_block_count(blocks)
+
+        if extra_blocks < BOOTDD_EXTRA_SPACE:
+            extra_blocks = BOOTDD_EXTRA_SPACE
+
+        blocks += extra_blocks
+
+        msger.debug("Added %d extra blocks to %s to get to %d total blocks" % \
+                    (extra_blocks, part.mountpoint, blocks))
 
         # Ensure total sectors is an integral number of sectors per
         # track or mcopy will complain. Sectors are 512 bytes, and we
diff --git a/scripts/lib/mic/utils/oe/misc.py b/scripts/lib/mic/utils/oe/misc.py
index 77dfe03..6b01955 100644
--- a/scripts/lib/mic/utils/oe/misc.py
+++ b/scripts/lib/mic/utils/oe/misc.py
@@ -108,6 +108,7 @@ def add_wks_var(key, val):
     wks_vars[key] = val
 
 BOOTDD_EXTRA_SPACE = 16384
+IMAGE_EXTRA_SPACE = 10240
 
 __bitbake_env_lines = ""
 
-- 
1.8.3.1



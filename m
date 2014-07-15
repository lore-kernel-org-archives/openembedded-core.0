Return-Path: <tom.zanussi@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A8D3470652
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 15:43:40 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 15 Jul 2014 08:43:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,666,1400050800"; d="scan'208";a="562117787"
Received: from gmacartn-mobl.ger.corp.intel.com (HELO localhost)
	([10.255.13.33])
	by fmsmga001.fm.intel.com with ESMTP; 15 Jul 2014 08:43:41 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jul 2014 10:43:35 -0500
Message-Id: <f131a43f65ae3850ac0eb4b925542bf9378b5f7f.1405438752.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <f27d93432eef12967210dfe6dbfdc451371bd1d6.1405438752.git.tom.zanussi@linux.intel.com>
References: <f27d93432eef12967210dfe6dbfdc451371bd1d6.1405438752.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1405438752.git.tom.zanussi@linux.intel.com>
References: <cover.1405438752.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 2/5] wic: Add vfat support
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
X-List-Received-Date: Tue, 15 Jul 2014 15:43:41 -0000

Add vfat as a supported rootfs type (in addition to the current
ext2/3/4 and btrfs support).

vfat partitions can now be created using --source rootfs along with
--fstype=vfat, or without --source but specifying a --size.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 .../lib/mic/kickstart/custom_commands/partition.py | 74 ++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/scripts/lib/mic/kickstart/custom_commands/partition.py b/scripts/lib/mic/kickstart/custom_commands/partition.py
index 75ad6ad..4662bdd 100644
--- a/scripts/lib/mic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/mic/kickstart/custom_commands/partition.py
@@ -186,6 +186,11 @@ class Wic_PartData(Mic_PartData):
                                              rootfs_dir, native_sysroot,
                                              pseudo)
 
+        elif self.fstype.startswith("vfat"):
+            return self.prepare_rootfs_vfat(cr_workdir, oe_builddir,
+                                            rootfs_dir, native_sysroot,
+                                            pseudo)
+
     def prepare_rootfs_ext(self, cr_workdir, oe_builddir, rootfs_dir,
                            native_sysroot, pseudo):
         """
@@ -270,6 +275,53 @@ class Wic_PartData(Mic_PartData):
         self.size = rootfs_size
         self.source_file = rootfs
 
+    def prepare_rootfs_vfat(self, cr_workdir, oe_builddir, rootfs_dir,
+                            native_sysroot, pseudo):
+        """
+        Prepare content for a vfat rootfs partition.
+        """
+        image_rootfs = rootfs_dir
+        rootfs = "%s/rootfs_%s.%s" % (cr_workdir, self.label, self.fstype)
+
+        du_cmd = "du -bks %s" % image_rootfs
+        rc, out = exec_cmd(du_cmd)
+        blocks = int(out.split()[0])
+
+        extra_blocks = self.get_extra_block_count(blocks)
+
+        if extra_blocks < BOOTDD_EXTRA_SPACE:
+            extra_blocks = BOOTDD_EXTRA_SPACE
+
+        blocks += extra_blocks
+
+        msger.debug("Added %d extra blocks to %s to get to %d total blocks" % \
+                    (extra_blocks, self.mountpoint, blocks))
+
+        # Ensure total sectors is an integral number of sectors per
+        # track or mcopy will complain. Sectors are 512 bytes, and we
+        # generate images with 32 sectors per track. This calculation is
+        # done in blocks, thus the mod by 16 instead of 32.
+        blocks += (16 - (blocks % 16))
+
+        dosfs_cmd = "mkdosfs -n boot -S 512 -C %s %d" % (rootfs, blocks)
+        exec_native_cmd(dosfs_cmd, native_sysroot)
+
+        mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (rootfs, image_rootfs)
+        rc, out = exec_native_cmd(mcopy_cmd, native_sysroot)
+        if rc:
+            msger.error("ERROR: mcopy returned '%s' instead of 0 (which you probably don't want to ignore, use --debug for details)" % rc)
+
+        chmod_cmd = "chmod 644 %s" % rootfs
+        exec_cmd(chmod_cmd)
+
+        # get the rootfs size in the right units for kickstart (Mb)
+        du_cmd = "du -Lbms %s" % rootfs
+        rc, out = exec_cmd(du_cmd)
+        rootfs_size = out.split()[0]
+
+        self.set_size(rootfs_size)
+        self.set_source_file(rootfs)
+
     def prepare_empty_partition(self, cr_workdir, oe_builddir, native_sysroot):
         """
         Prepare an empty partition.
@@ -280,6 +332,9 @@ class Wic_PartData(Mic_PartData):
         elif self.fstype.startswith("btrfs"):
             return self.prepare_empty_partition_btrfs(cr_workdir, oe_builddir,
                                                       native_sysroot)
+        elif self.fstype.startswith("vfat"):
+            return self.prepare_empty_partition_vfat(cr_workdir, oe_builddir,
+                                                     native_sysroot)
 
     def prepare_empty_partition_ext(self, cr_workdir, oe_builddir,
                                     native_sysroot):
@@ -322,6 +377,25 @@ class Wic_PartData(Mic_PartData):
 
         return 0
 
+    def prepare_empty_partition_vfat(self, cr_workdir, oe_builddir,
+                                     native_sysroot):
+        """
+        Prepare an empty vfat partition.
+        """
+        fs = "%s/fs.%s" % (cr_workdir, self.fstype)
+
+        blocks = self.size * 1024
+
+        dosfs_cmd = "mkdosfs -n boot -S 512 -C %s %d" % (fs, blocks)
+        exec_native_cmd(dosfs_cmd, native_sysroot)
+
+        chmod_cmd = "chmod 644 %s" % fs
+        exec_cmd(chmod_cmd)
+
+        self.source_file = fs
+
+        return 0
+
     def prepare_swap_partition(self, cr_workdir, oe_builddir, native_sysroot):
         """
         Prepare a swap partition.
-- 
1.8.3.1



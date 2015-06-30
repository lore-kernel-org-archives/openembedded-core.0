Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C72CB75C66
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 08:53:00 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 30 Jun 2015 01:53:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,376,1432623600"; d="scan'208";a="755700488"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 30 Jun 2015 01:53:02 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 8019D6A4005;
	Tue, 30 Jun 2015 01:52:22 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jun 2015 11:51:44 +0300
Message-Id: <1435654312-18177-13-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1435654312-18177-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1435654312-18177-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v2 12/20] wic: Refactor prepare_empty_partition API
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
X-List-Received-Date: Tue, 30 Jun 2015 08:53:00 -0000

Moved code out of prepare_empty_partition* methods
to avoid code duplication.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
index 0741bb2..4e8a6a8 100644
--- a/scripts/lib/wic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
@@ -160,11 +160,15 @@ class Wic_PartData(Mic_PartData):
                 self.prepare_swap_partition(cr_workdir, oe_builddir,
                                             native_sysroot)
             elif self.fstype:
+                rootfs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
+                if os.path.isfile(rootfs):
+                    os.remove(rootfs)
                 for prefix in ("ext", "btrfs", "vfat", "squashfs"):
                     if self.fstype.startswith(prefix):
                         method = getattr(self,
                                          "prepare_empty_partition_" + prefix)
-                        method(cr_workdir, oe_builddir, native_sysroot)
+                        method(rootfs, oe_builddir, native_sysroot)
+                        self.source_file = rootfs
                         break
             return
 
@@ -383,16 +387,13 @@ class Wic_PartData(Mic_PartData):
 
         return 0
 
-    def prepare_empty_partition_ext(self, cr_workdir, oe_builddir,
+    def prepare_empty_partition_ext(self, rootfs, oe_builddir,
                                     native_sysroot):
         """
         Prepare an empty ext2/3/4 partition.
         """
-        fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
-
-        os.path.isfile(fs) and os.remove(fs)
         dd_cmd = "dd if=/dev/zero of=%s bs=1k seek=%d count=0" % \
-            (fs, self.size)
+            (rootfs, self.size)
         exec_cmd(dd_cmd)
 
         extra_imagecmd = "-i 8192"
@@ -402,23 +403,16 @@ class Wic_PartData(Mic_PartData):
             label_str = "-L %s" % self.label
 
         mkfs_cmd = "mkfs.%s -F %s %s %s" % \
-            (self.fstype, extra_imagecmd, label_str, fs)
+            (self.fstype, extra_imagecmd, label_str, rootfs)
         exec_native_cmd(mkfs_cmd, native_sysroot)
 
-        self.source_file = fs
-
-        return 0
-
-    def prepare_empty_partition_btrfs(self, cr_workdir, oe_builddir,
+    def prepare_empty_partition_btrfs(self, rootfs, oe_builddir,
                                       native_sysroot):
         """
         Prepare an empty btrfs partition.
         """
-        fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
-
-        os.path.isfile(fs) and os.remove(fs)
         dd_cmd = "dd if=/dev/zero of=%s bs=1k seek=%d count=0" % \
-            (fs, self.size)
+            (rootfs, self.size)
         exec_cmd(dd_cmd)
 
         label_str = ""
@@ -426,21 +420,14 @@ class Wic_PartData(Mic_PartData):
             label_str = "-L %s" % self.label
 
         mkfs_cmd = "mkfs.%s -b %d %s %s" % \
-            (self.fstype, self.size * 1024, label_str, fs)
+            (self.fstype, self.size * 1024, label_str, rootfs)
         exec_native_cmd(mkfs_cmd, native_sysroot)
 
-        self.source_file = fs
-
-        return 0
-
-    def prepare_empty_partition_vfat(self, cr_workdir, oe_builddir,
+    def prepare_empty_partition_vfat(self, rootfs, oe_builddir,
                                      native_sysroot):
         """
         Prepare an empty vfat partition.
         """
-        fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
-        os.path.isfile(fs) and os.remove(fs)
-
         blocks = self.size
 
         label_str = "-n boot"
@@ -453,10 +440,6 @@ class Wic_PartData(Mic_PartData):
         chmod_cmd = "chmod 644 %s" % fs
         exec_cmd(chmod_cmd)
 
-        self.source_file = fs
-
-        return 0
-
     def prepare_empty_partition_squashfs(self, cr_workdir, oe_builddir,
                                          native_sysroot):
         """
@@ -484,9 +467,6 @@ class Wic_PartData(Mic_PartData):
         fs_size = out.split()[0]
 
         self.size = fs_size
-        self.source_file = fs
-
-        return 0
 
     def prepare_swap_partition(self, cr_workdir, oe_builddir, native_sysroot):
         """
@@ -505,10 +485,6 @@ class Wic_PartData(Mic_PartData):
         mkswap_cmd = "mkswap %s -U %s %s" % (label_str, str(uuid.uuid1()), fs)
         exec_native_cmd(mkswap_cmd, native_sysroot)
 
-        self.source_file = fs
-
-        return 0
-
 class Wic_Partition(Mic_Partition):
     removedKeywords = Mic_Partition.removedKeywords
     removedAttrs = Mic_Partition.removedAttrs
-- 
2.1.4



Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 7F3E7719E2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 11:44:58 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga105.jf.intel.com with ESMTP; 06 Jul 2017 04:44:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,317,1496127600"; d="scan'208";a="282878425"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 06 Jul 2017 04:44:58 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 8689E580562
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 04:44:57 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 14:32:33 +0300
Message-Id: <71555c926e8e0eb6f5084006de5411c53e871636.1499340568.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1499340568.git.ed.bartosh@linux.intel.com>
References: <cover.1499340568.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 1/3] wic: implement wks option --mkfs-extraopts
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
X-List-Received-Date: Thu, 06 Jul 2017 11:44:58 -0000

This option specifies extra options to pass to mkfs.<fstype> utilities.

[YOCTO #11709]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/ksparser.py  |  1 +
 scripts/lib/wic/partition.py | 39 ++++++++++++++++++++++++---------------
 2 files changed, 25 insertions(+), 15 deletions(-)

diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 47afda4..99b66ee 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -139,6 +139,7 @@ class KickStart():
         part.add_argument('--fstype', default='vfat',
                           choices=('ext2', 'ext3', 'ext4', 'btrfs',
                                    'squashfs', 'vfat', 'msdos', 'swap'))
+        part.add_argument('--mkfs-extraopts', default='')
         part.add_argument('--label')
         part.add_argument('--no-table', action='store_true')
         part.add_argument('--ondisk', '--ondrive', dest='disk', default='sda')
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 5aa68c9..b623bb9 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -46,6 +46,7 @@ class Partition():
         self.fsopts = args.fsopts
         self.fstype = args.fstype
         self.label = args.label
+        self.mkfs_extraopts = args.mkfs_extraopts
         self.mountpoint = args.mountpoint
         self.no_table = args.no_table
         self.num = None
@@ -256,14 +257,14 @@ class Partition():
         with open(rootfs, 'w') as sparse:
             os.ftruncate(sparse.fileno(), rootfs_size * 1024)
 
-        extra_imagecmd = "-i 8192"
+        extraopts = self.mkfs_extraopts or "-F -i 8192"
 
         label_str = ""
         if self.label:
             label_str = "-L %s" % self.label
 
-        mkfs_cmd = "mkfs.%s -F %s %s %s -d %s" % \
-            (self.fstype, extra_imagecmd, rootfs, label_str, rootfs_dir)
+        mkfs_cmd = "mkfs.%s %s %s %s -d %s" % \
+            (self.fstype, extraopts, rootfs, label_str, rootfs_dir)
         exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
 
         mkfs_cmd = "fsck.%s -pvfD %s" % (self.fstype, rootfs)
@@ -289,8 +290,9 @@ class Partition():
         if self.label:
             label_str = "-L %s" % self.label
 
-        mkfs_cmd = "mkfs.%s -b %d -r %s %s %s" % \
-            (self.fstype, rootfs_size * 1024, rootfs_dir, label_str, rootfs)
+        mkfs_cmd = "mkfs.%s -b %d -r %s %s %s %s" % \
+            (self.fstype, rootfs_size * 1024, rootfs_dir, label_str,
+             self.mkfs_extraopts, rootfs)
         exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
 
     def prepare_rootfs_msdos(self, rootfs, oe_builddir, rootfs_dir,
@@ -312,8 +314,10 @@ class Partition():
         if self.fstype == 'msdos':
             size_str = "-F 16" # FAT 16
 
-        dosfs_cmd = "mkdosfs %s -S 512 %s -C %s %d" % (label_str, size_str,
-                                                       rootfs, rootfs_size)
+        extraopts = self.mkfs_extraopts or '-S 512'
+
+        dosfs_cmd = "mkdosfs %s %s %s -C %s %d" % \
+                    (label_str, size_str, extraopts, rootfs, rootfs_size)
         exec_native_cmd(dosfs_cmd, native_sysroot)
 
         mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (rootfs, rootfs_dir)
@@ -329,8 +333,9 @@ class Partition():
         """
         Prepare content for a squashfs rootfs partition.
         """
-        squashfs_cmd = "mksquashfs %s %s -noappend" % \
-                       (rootfs_dir, rootfs)
+        extraopts = self.mkfs_extraopts or '-noappend'
+        squashfs_cmd = "mksquashfs %s %s %s" % \
+                       (rootfs_dir, rootfs, extraopts)
         exec_native_cmd(squashfs_cmd, native_sysroot, pseudo=pseudo)
 
     def prepare_empty_partition_ext(self, rootfs, oe_builddir,
@@ -342,14 +347,14 @@ class Partition():
         with open(rootfs, 'w') as sparse:
             os.ftruncate(sparse.fileno(), size * 1024)
 
-        extra_imagecmd = "-i 8192"
+        extraopts = self.mkfs_extraopts or "-i 8192"
 
         label_str = ""
         if self.label:
             label_str = "-L %s" % self.label
 
         mkfs_cmd = "mkfs.%s -F %s %s %s" % \
-            (self.fstype, extra_imagecmd, label_str, rootfs)
+            (self.fstype, extraopts, label_str, rootfs)
         exec_native_cmd(mkfs_cmd, native_sysroot)
 
     def prepare_empty_partition_btrfs(self, rootfs, oe_builddir,
@@ -365,8 +370,9 @@ class Partition():
         if self.label:
             label_str = "-L %s" % self.label
 
-        mkfs_cmd = "mkfs.%s -b %d %s %s" % \
-            (self.fstype, self.size * 1024, label_str, rootfs)
+        mkfs_cmd = "mkfs.%s -b %d %s %s %s" % \
+                   (self.fstype, self.size * 1024, label_str,
+                    self.mkfs_extraopts, rootfs)
         exec_native_cmd(mkfs_cmd, native_sysroot)
 
     def prepare_empty_partition_msdos(self, rootfs, oe_builddir,
@@ -384,8 +390,11 @@ class Partition():
         if self.fstype == 'msdos':
             size_str = "-F 16" # FAT 16
 
-        dosfs_cmd = "mkdosfs %s -S 512 %s -C %s %d" % (label_str, size_str,
-                                                       rootfs, blocks)
+        extraopts = self.mkfs_extraopts or '-S 512'
+
+        dosfs_cmd = "mkdosfs %s %s %s -C %s %d" % \
+                    (label_str, extraopts, size_str, rootfs, blocks)
+
         exec_native_cmd(dosfs_cmd, native_sysroot)
 
         chmod_cmd = "chmod 644 %s" % rootfs
-- 
2.1.4



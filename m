Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 4B0D177D56
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 18:45:14 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga105.jf.intel.com with ESMTP; 30 Mar 2017 11:45:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,248,1486454400"; d="scan'208";a="1148952319"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 30 Mar 2017 11:45:16 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 812662C8001
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 11:45:08 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Mar 2017 21:43:46 +0300
Message-Id: <67b987dd2a42e12022f18ead9ee6c3bf1f5ca470.1490898545.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1490898545.git.ed.bartosh@linux.intel.com>
References: <cover.1490898545.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 4/9] wic: support 'msdos' fstype
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
X-List-Received-Date: Thu, 30 Mar 2017 18:45:15 -0000

Added prepare_empty_partition_msdos and prepare_rootfs_msdos
methods to support 'msdos' filesystem type.

Created aliases prepare_empty_partition_vfat and prepare_rootfs_vfat
to continue supporting creation of vfat patitiions.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/partition.py | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 28ad3e6..d59351c 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -290,10 +290,10 @@ class Partition():
             (self.fstype, rootfs_size * 1024, rootfs_dir, label_str, rootfs)
         exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
 
-    def prepare_rootfs_vfat(self, rootfs, oe_builddir, rootfs_dir,
-                            native_sysroot, pseudo):
+    def prepare_rootfs_msdos(self, rootfs, oe_builddir, rootfs_dir,
+                             native_sysroot, pseudo):
         """
-        Prepare content for a vfat rootfs partition.
+        Prepare content for a msdos/vfat rootfs partition.
         """
         du_cmd = "du -bks %s" % rootfs_dir
         out = exec_cmd(du_cmd)
@@ -314,6 +314,8 @@ class Partition():
         chmod_cmd = "chmod 644 %s" % rootfs
         exec_cmd(chmod_cmd)
 
+    prepare_rootfs_vfat = prepare_rootfs_msdos
+
     def prepare_rootfs_squashfs(self, rootfs, oe_builddir, rootfs_dir,
                                 native_sysroot, pseudo):
         """
@@ -359,8 +361,8 @@ class Partition():
             (self.fstype, self.size * 1024, label_str, rootfs)
         exec_native_cmd(mkfs_cmd, native_sysroot)
 
-    def prepare_empty_partition_vfat(self, rootfs, oe_builddir,
-                                     native_sysroot):
+    def prepare_empty_partition_msdos(self, rootfs, oe_builddir,
+                                      native_sysroot):
         """
         Prepare an empty vfat partition.
         """
@@ -376,6 +378,8 @@ class Partition():
         chmod_cmd = "chmod 644 %s" % rootfs
         exec_cmd(chmod_cmd)
 
+    prepare_empty_partition_vfat = prepare_empty_partition_msdos
+
     def prepare_empty_partition_squashfs(self, cr_workdir, oe_builddir,
                                          native_sysroot):
         """
-- 
2.1.4



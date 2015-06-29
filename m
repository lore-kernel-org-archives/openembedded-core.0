Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id CDF456070C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 19:11:34 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 29 Jun 2015 12:11:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,371,1432623600"; d="scan'208";a="596919976"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 29 Jun 2015 12:11:34 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id BA7006A4083;
	Mon, 29 Jun 2015 12:10:54 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jun 2015 22:10:24 +0300
Message-Id: <1435605033-11509-12-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1435605033-11509-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1435605033-11509-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 11/20] wic: Call methods better way
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
X-List-Received-Date: Mon, 29 Jun 2015 19:11:35 -0000

Shortened code by using getattr to obtain a method to call for
prepare_empty_partition_* and prepare_rootfs_* methods.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
index e3ae3ce..0741bb2 100644
--- a/scripts/lib/wic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
@@ -160,8 +160,12 @@ class Wic_PartData(Mic_PartData):
                 self.prepare_swap_partition(cr_workdir, oe_builddir,
                                             native_sysroot)
             elif self.fstype:
-                self.prepare_empty_partition(cr_workdir, oe_builddir,
-                                             native_sysroot)
+                for prefix in ("ext", "btrfs", "vfat", "squashfs"):
+                    if self.fstype.startswith(prefix):
+                        method = getattr(self,
+                                         "prepare_empty_partition_" + prefix)
+                        method(cr_workdir, oe_builddir, native_sysroot)
+                        break
             return
 
         plugins = pluginmgr.get_source_plugins()
@@ -223,23 +227,11 @@ class Wic_PartData(Mic_PartData):
         if os.path.isfile(rootfs):
             os.remove(rootfs)
 
-        if self.fstype.startswith("ext"):
-            return self.prepare_rootfs_ext(rootfs, oe_builddir,
-                                           rootfs_dir, native_sysroot,
-                                           pseudo)
-        elif self.fstype.startswith("btrfs"):
-            return self.prepare_rootfs_btrfs(rootfs, oe_builddir,
-                                             rootfs_dir, native_sysroot,
-                                             pseudo)
-
-        elif self.fstype.startswith("vfat"):
-            return self.prepare_rootfs_vfat(rootfs, oe_builddir,
-                                            rootfs_dir, native_sysroot,
-                                            pseudo)
-        elif self.fstype.startswith("squashfs"):
-            return self.prepare_rootfs_squashfs(rootfs, oe_builddir,
-                                                rootfs_dir, native_sysroot,
-                                                pseudo)
+        for prefix in ("ext", "btrfs", "vfat", "squashfs"):
+            if self.fstype.startswith(prefix):
+                method = getattr(self, "prepare_rootfs_" + prefix)
+                return method(rootfs, oe_builddir, rootfs_dir,
+                              native_sysroot, pseudo)
 
     def prepare_rootfs_ext(self, rootfs, oe_builddir, rootfs_dir,
                            native_sysroot, pseudo):
@@ -391,23 +383,6 @@ class Wic_PartData(Mic_PartData):
 
         return 0
 
-    def prepare_empty_partition(self, cr_workdir, oe_builddir, native_sysroot):
-        """
-        Prepare an empty partition.
-        """
-        if self.fstype.startswith("ext"):
-            return self.prepare_empty_partition_ext(cr_workdir, oe_builddir,
-                                                    native_sysroot)
-        elif self.fstype.startswith("btrfs"):
-            return self.prepare_empty_partition_btrfs(cr_workdir, oe_builddir,
-                                                      native_sysroot)
-        elif self.fstype.startswith("vfat"):
-            return self.prepare_empty_partition_vfat(cr_workdir, oe_builddir,
-                                                     native_sysroot)
-        elif self.fstype.startswith("squashfs"):
-            return self.prepare_empty_partition_squashfs(cr_workdir, oe_builddir,
-                                                         native_sysroot)
-
     def prepare_empty_partition_ext(self, cr_workdir, oe_builddir,
                                     native_sysroot):
         """
-- 
2.1.4



Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8DC7F6070C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 19:11:35 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 29 Jun 2015 12:11:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,371,1432623600"; d="scan'208";a="737099227"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 29 Jun 2015 12:11:37 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 882176A4083;
	Mon, 29 Jun 2015 12:10:57 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jun 2015 22:10:26 +0300
Message-Id: <1435605033-11509-14-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1435605033-11509-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1435605033-11509-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 13/20] wic: Remove duplicated code
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

Moved duplicated code of geting rootfs size
out of prepare_rootfs* methods.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
index 4e8a6a8..72f617a 100644
--- a/scripts/lib/wic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
@@ -234,8 +234,16 @@ class Wic_PartData(Mic_PartData):
         for prefix in ("ext", "btrfs", "vfat", "squashfs"):
             if self.fstype.startswith(prefix):
                 method = getattr(self, "prepare_rootfs_" + prefix)
-                return method(rootfs, oe_builddir, rootfs_dir,
-                              native_sysroot, pseudo)
+                method(rootfs, oe_builddir, rootfs_dir, native_sysroot, pseudo)
+
+                self.source_file = rootfs
+
+                # get the rootfs size in the right units for kickstart (kB)
+                du_cmd = "du -Lbks %s" % rootfs
+                out = exec_cmd(du_cmd)
+                self.size = out.split()[0]
+
+                break
 
     def prepare_rootfs_ext(self, rootfs, oe_builddir, rootfs_dir,
                            native_sysroot, pseudo):
@@ -270,16 +278,6 @@ class Wic_PartData(Mic_PartData):
             (self.fstype, extra_imagecmd, rootfs, label_str, rootfs_dir)
         exec_native_cmd(pseudo + mkfs_cmd, native_sysroot)
 
-        # get the rootfs size in the right units for kickstart (kB)
-        du_cmd = "du -Lbks %s" % rootfs
-        out = exec_cmd(du_cmd)
-        rootfs_size = out.split()[0]
-
-        self.size = rootfs_size
-        self.source_file = rootfs
-
-        return 0
-
     def prepare_rootfs_btrfs(self, rootfs, oe_builddir, rootfs_dir,
                              native_sysroot, pseudo):
         """
@@ -313,14 +311,6 @@ class Wic_PartData(Mic_PartData):
             (self.fstype, rootfs_size * 1024, rootfs_dir, label_str, rootfs)
         exec_native_cmd(pseudo + mkfs_cmd, native_sysroot)
 
-        # get the rootfs size in the right units for kickstart (kB)
-        du_cmd = "du -Lbks %s" % rootfs
-        out = exec_cmd(du_cmd)
-        rootfs_size = out.split()[0]
-
-        self.size = rootfs_size
-        self.source_file = rootfs
-
     def prepare_rootfs_vfat(self, rootfs, oe_builddir, rootfs_dir,
                             native_sysroot, pseudo):
         """
@@ -360,14 +350,6 @@ class Wic_PartData(Mic_PartData):
         chmod_cmd = "chmod 644 %s" % rootfs
         exec_cmd(chmod_cmd)
 
-        # get the rootfs size in the right units for kickstart (kB)
-        du_cmd = "du -Lbks %s" % rootfs
-        out = exec_cmd(du_cmd)
-        rootfs_size = out.split()[0]
-
-        self.set_size(rootfs_size)
-        self.set_source_file(rootfs)
-
     def prepare_rootfs_squashfs(self, rootfs, oe_builddir, rootfs_dir,
                                 native_sysroot, pseudo):
         """
@@ -377,16 +359,6 @@ class Wic_PartData(Mic_PartData):
                        (rootfs_dir, rootfs)
         exec_native_cmd(pseudo + squashfs_cmd, native_sysroot)
 
-        # get the rootfs size in the right units for kickstart (kB)
-        du_cmd = "du -Lbks %s" % rootfs
-        out = exec_cmd(du_cmd)
-        rootfs_size = out.split()[0]
-
-        self.size = rootfs_size
-        self.source_file = rootfs
-
-        return 0
-
     def prepare_empty_partition_ext(self, rootfs, oe_builddir,
                                     native_sysroot):
         """
-- 
2.1.4



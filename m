Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B9690607FC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 19:11:28 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 29 Jun 2015 12:11:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,371,1432623600"; d="scan'208";a="719797719"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 29 Jun 2015 12:11:30 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 6FA836A4083;
	Mon, 29 Jun 2015 12:10:50 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jun 2015 22:10:21 +0300
Message-Id: <1435605033-11509-9-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1435605033-11509-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1435605033-11509-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 08/20] wic: Refactor prepare_rootfs API
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
X-List-Received-Date: Mon, 29 Jun 2015 19:11:29 -0000

Moved code out of prepare_roots* methods to avoid code duplication.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
index 324ea69..489ebe3 100644
--- a/scripts/lib/wic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
@@ -219,34 +219,36 @@ class Wic_PartData(Mic_PartData):
         pseudo += "export PSEUDO_NOSYMLINKEXP=%s;" % p_nosymlinkexp
         pseudo += "%s/usr/bin/pseudo " % native_sysroot
 
+        rootfs = "%s/rootfs_%s.%s" % (cr_workdir, self.label, self.fstype)
+        if os.path.isfile(rootfs):
+            os.remove(rootfs)
+
         if self.fstype.startswith("ext"):
-            return self.prepare_rootfs_ext(cr_workdir, oe_builddir,
+            return self.prepare_rootfs_ext(rootfs, oe_builddir,
                                            rootfs_dir, native_sysroot,
                                            pseudo)
         elif self.fstype.startswith("btrfs"):
-            return self.prepare_rootfs_btrfs(cr_workdir, oe_builddir,
+            return self.prepare_rootfs_btrfs(rootfs, oe_builddir,
                                              rootfs_dir, native_sysroot,
                                              pseudo)
 
         elif self.fstype.startswith("vfat"):
-            return self.prepare_rootfs_vfat(cr_workdir, oe_builddir,
+            return self.prepare_rootfs_vfat(rootfs, oe_builddir,
                                             rootfs_dir, native_sysroot,
                                             pseudo)
         elif self.fstype.startswith("squashfs"):
-            return self.prepare_rootfs_squashfs(cr_workdir, oe_builddir,
+            return self.prepare_rootfs_squashfs(rootfs, oe_builddir,
                                                 rootfs_dir, native_sysroot,
                                                 pseudo)
 
-    def prepare_rootfs_ext(self, cr_workdir, oe_builddir, rootfs_dir,
+    def prepare_rootfs_ext(self, rootfs, oe_builddir, rootfs_dir,
                            native_sysroot, pseudo):
         """
         Prepare content for an ext2/3/4 rootfs partition.
         """
 
         image_rootfs = rootfs_dir
-        rootfs = "%s/rootfs_%s.%s" % (cr_workdir, self.label ,self.fstype)
 
-        os.path.isfile(rootfs) and os.remove(rootfs)
         du_cmd = "du -ks %s" % image_rootfs
         out = exec_cmd(du_cmd)
         actual_rootfs_size = int(out.split()[0])
@@ -285,7 +287,7 @@ class Wic_PartData(Mic_PartData):
 
         return 0
 
-    def prepare_rootfs_btrfs(self, cr_workdir, oe_builddir, rootfs_dir,
+    def prepare_rootfs_btrfs(self, rootfs, oe_builddir, rootfs_dir,
                              native_sysroot, pseudo):
         """
         Prepare content for a btrfs rootfs partition.
@@ -293,9 +295,7 @@ class Wic_PartData(Mic_PartData):
         Currently handles ext2/3/4 and btrfs.
         """
         image_rootfs = rootfs_dir
-        rootfs = "%s/rootfs_%s.%s" % (cr_workdir, self.label, self.fstype)
 
-        os.path.isfile(rootfs) and os.remove(rootfs)
         du_cmd = "du -ks %s" % image_rootfs
         out = exec_cmd(du_cmd)
         actual_rootfs_size = int(out.split()[0])
@@ -330,15 +330,13 @@ class Wic_PartData(Mic_PartData):
         self.size = rootfs_size
         self.source_file = rootfs
 
-    def prepare_rootfs_vfat(self, cr_workdir, oe_builddir, rootfs_dir,
+    def prepare_rootfs_vfat(self, rootfs, oe_builddir, rootfs_dir,
                             native_sysroot, pseudo):
         """
         Prepare content for a vfat rootfs partition.
         """
         image_rootfs = rootfs_dir
-        rootfs = "%s/rootfs_%s.%s" % (cr_workdir, self.label, self.fstype)
 
-        os.path.isfile(rootfs) and os.remove(rootfs)
         du_cmd = "du -bks %s" % image_rootfs
         out = exec_cmd(du_cmd)
         blocks = int(out.split()[0])
@@ -381,15 +379,13 @@ class Wic_PartData(Mic_PartData):
         self.set_size(rootfs_size)
         self.set_source_file(rootfs)
 
-    def prepare_rootfs_squashfs(self, cr_workdir, oe_builddir, rootfs_dir,
+    def prepare_rootfs_squashfs(self, rootfs, oe_builddir, rootfs_dir,
                                 native_sysroot, pseudo):
         """
         Prepare content for a squashfs rootfs partition.
         """
         image_rootfs = rootfs_dir
-        rootfs = "%s/rootfs_%s.%s" % (cr_workdir, self.label ,self.fstype)
 
-        os.path.isfile(rootfs) and os.remove(rootfs)
         squashfs_cmd = "mksquashfs %s %s -noappend" % \
                        (image_rootfs, rootfs)
         exec_native_cmd(pseudo + squashfs_cmd, native_sysroot)
-- 
2.1.4



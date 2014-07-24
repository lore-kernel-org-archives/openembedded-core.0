Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id B004470788
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 12:12:24 +0000 (UTC)
Received: from localhost.localdomain (unknown [46.170.72.194])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 82F5011582AF;
	Thu, 24 Jul 2014 14:12:14 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Jul 2014 14:11:50 +0200
Message-Id: <1406203910-16569-1-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1406147959.6335.44.camel@empanada>
References: <1406147959.6335.44.camel@empanada>
Subject: [PATCH v2] wic: squashfs partition support
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
X-List-Received-Date: Thu, 24 Jul 2014 12:12:32 -0000

It is possible to instruct wic to create a squashfs partition by setting
--fstype=squashfs in *.wks. For now this is only useable for rootfs
partitions (note that you must have squashfs support in the kernel). An
attempt to create an empty partition will produce a warning.

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
---
 .../lib/mic/kickstart/custom_commands/partition.py | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/scripts/lib/mic/kickstart/custom_commands/partition.py b/scripts/lib/mic/kickstart/custom_commands/partition.py
index d0f1b78..ce90aa1 100644
--- a/scripts/lib/mic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/mic/kickstart/custom_commands/partition.py
@@ -25,6 +25,8 @@
 #
 
 import shutil
+import os
+import tempfile
 
 from pykickstart.commands.partition import *
 from mic.utils.oe.misc import *
@@ -192,6 +194,10 @@ class Wic_PartData(Mic_PartData):
             return self.prepare_rootfs_vfat(cr_workdir, oe_builddir,
                                             rootfs_dir, native_sysroot,
                                             pseudo)
+        elif self.fstype.startswith("squashfs"):
+            return self.prepare_rootfs_squashfs(cr_workdir, oe_builddir,
+                                                rootfs_dir, native_sysroot,
+                                                pseudo)
 
     def prepare_rootfs_ext(self, cr_workdir, oe_builddir, rootfs_dir,
                            native_sysroot, pseudo):
@@ -324,6 +330,28 @@ class Wic_PartData(Mic_PartData):
         self.set_size(rootfs_size)
         self.set_source_file(rootfs)
 
+    def prepare_rootfs_squashfs(self, cr_workdir, oe_builddir, rootfs_dir,
+                                native_sysroot, pseudo):
+        """
+        Prepare content for a squashfs rootfs partition.
+        """
+        image_rootfs = rootfs_dir
+        rootfs = "%s/rootfs_%s.%s" % (cr_workdir, self.label ,self.fstype)
+
+        squashfs_cmd = "mksquashfs %s %s -noappend" % \
+                       (image_rootfs, rootfs)
+        rc, out = exec_native_cmd(pseudo + squashfs_cmd, native_sysroot)
+
+        # get the rootfs size in the right units for kickstart (Mb)
+        du_cmd = "du -Lbms %s" % rootfs
+        rc, out = exec_cmd(du_cmd)
+        rootfs_size = out.split()[0]
+
+        self.size = rootfs_size
+        self.source_file = rootfs
+
+        return 0
+
     def prepare_empty_partition(self, cr_workdir, oe_builddir, native_sysroot):
         """
         Prepare an empty partition.
@@ -337,6 +365,9 @@ class Wic_PartData(Mic_PartData):
         elif self.fstype.startswith("vfat"):
             return self.prepare_empty_partition_vfat(cr_workdir, oe_builddir,
                                                      native_sysroot)
+        elif self.fstype.startswith("squashfs"):
+            return self.prepare_empty_partition_squashfs(cr_workdir, oe_builddir,
+                                                         native_sysroot)
 
     def prepare_empty_partition_ext(self, cr_workdir, oe_builddir,
                                     native_sysroot):
@@ -398,6 +429,36 @@ class Wic_PartData(Mic_PartData):
 
         return 0
 
+    def prepare_empty_partition_squashfs(self, cr_workdir, oe_builddir,
+                                         native_sysroot):
+        """
+        Prepare an empty squashfs partition.
+        """
+        msger.warning("Creating of an empty squashfs %s partition was attempted. " \
+                      "Proceeding as requested." % self.mountpoint)
+
+        fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
+
+        # it is not possible to create a squashfs without source data,
+        # thus prepare an empty temp dir that is used as source
+        tmpdir = tempfile.mkdtemp()
+
+        squashfs_cmd = "mksquashfs %s %s -noappend" % \
+                       (tmpdir, fs)
+        rc, out = exec_native_cmd(squashfs_cmd, native_sysroot)
+
+        os.rmdir(tmpdir)
+
+        # get the rootfs size in the right units for kickstart (Mb)
+        du_cmd = "du -Lbms %s" % fs
+        rc, out = exec_cmd(du_cmd)
+        fs_size = out.split()[0]
+
+        self.size = fs_size
+        self.source_file = fs
+
+        return 0
+
     def prepare_swap_partition(self, cr_workdir, oe_builddir, native_sysroot):
         """
         Prepare a swap partition.
-- 
1.9.0



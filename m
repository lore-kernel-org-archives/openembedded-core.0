Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 7C72F70834
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 10:37:23 +0000 (UTC)
Received: from localhost.localdomain (unknown [78.10.193.111])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 9DFA431623FE;
	Wed, 23 Jul 2014 12:37:22 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Jul 2014 12:37:17 +0200
Message-Id: <1406111837-4287-1-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH] wic: squashfs partition support
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
X-List-Received-Date: Wed, 23 Jul 2014 10:37:26 -0000

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
---
 .../lib/mic/kickstart/custom_commands/partition.py | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/scripts/lib/mic/kickstart/custom_commands/partition.py b/scripts/lib/mic/kickstart/custom_commands/partition.py
index d0f1b78..c4d0113 100644
--- a/scripts/lib/mic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/mic/kickstart/custom_commands/partition.py
@@ -192,6 +192,10 @@ class Wic_PartData(Mic_PartData):
             return self.prepare_rootfs_vfat(cr_workdir, oe_builddir,
                                             rootfs_dir, native_sysroot,
                                             pseudo)
+        elif self.fstype.startswith("squashfs"):
+            return self.prepare_rootfs_squashfs(cr_workdir, oe_builddir,
+                                                rootfs_dir, native_sysroot,
+                                                pseudo)
 
     def prepare_rootfs_ext(self, cr_workdir, oe_builddir, rootfs_dir,
                            native_sysroot, pseudo):
@@ -324,6 +328,28 @@ class Wic_PartData(Mic_PartData):
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
-- 
1.9.0



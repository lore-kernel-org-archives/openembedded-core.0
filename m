Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.1397.1611246150445140456
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 08:22:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: s8JaCF5j2zAmPmcK1iRKQ170mnu0BlQ8rhEw7BzyWBwSWdLz+ggyk9/1BtQR4RXnPoDL1mkmZr
 PoVM2GCcpR3w==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="166392500"
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="166392500"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 08:22:39 -0800
IronPort-SDR: l/3PYFZViUrDXmqTKMKXhPB97jn9m8bQUir5ggWpgD8oDsqOFVBRvrxTATr6mQAiWQZ2xm+nlu
 zE6u+hFLe7ow==
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="427413882"
Received: from yonshuta-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.145.18])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 08:22:37 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 17/20] wic: Optimise fstab modification for ext2/3/4 and msdos partitions
Date: Fri, 22 Jan 2021 00:22:02 +0800
Message-Id: <a56b9dbfeb410d235b5af2c5a846b3f1360d2d1d.1611245974.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1611245974.git.anuj.mittal@intel.com>
References: <cover.1611245974.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Barker <pbarker@konsulko.com>

The fix for [Yocto #13994] required the rootfs directory to be copied
(using hardlinks if possible) when modifying the fstab file under wic.

We can optimise this copy away for filesystems where we have the tools
to modify the contents of the partition image after it is created. For
ext2/3/4 filesystems we have the debugfs tool and for msdos/vfat
filesystems we have the mcopy tool. So for any of these filesystems we
skip the modification of the fstab file in the rootfs directory (and
skip the associated copy unless it is otherwise necessary) and update
the contents of fstab directly in the partition image.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5fb8ae0e9159597d7eaa9307a3a8543800bf9405)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/wic/partition.py             | 27 +++++++++++++++++++-----
 scripts/lib/wic/plugins/source/rootfs.py |  9 +++++---
 2 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index f59eceb23d..e574f40c47 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -55,6 +55,8 @@ class Partition():
         self.fsuuid = args.fsuuid
         self.type = args.type
         self.updated_fstab_path = None
+        self.has_fstab = False
+        self.update_fstab_in_rootfs = False
 
         self.lineno = lineno
         self.source_file = ""
@@ -125,6 +127,8 @@ class Partition():
         partition command parameters.
         """
         self.updated_fstab_path = updated_fstab_path
+        if self.updated_fstab_path and not (self.fstype.startswith("ext") or self.fstype == "msdos"):
+            self.update_fstab_in_rootfs = True
 
         if not self.source:
             if not self.size and not self.fixed_size:
@@ -250,7 +254,7 @@ class Partition():
 
         prefix = "ext" if self.fstype.startswith("ext") else self.fstype
         method = getattr(self, "prepare_rootfs_" + prefix)
-        method(rootfs, oe_builddir, rootfs_dir, native_sysroot, pseudo)
+        method(rootfs, cr_workdir, oe_builddir, rootfs_dir, native_sysroot, pseudo)
         self.source_file = rootfs
 
         # get the rootfs size in the right units for kickstart (kB)
@@ -258,7 +262,7 @@ class Partition():
         out = exec_cmd(du_cmd)
         self.size = int(out.split()[0])
 
-    def prepare_rootfs_ext(self, rootfs, oe_builddir, rootfs_dir,
+    def prepare_rootfs_ext(self, rootfs, cr_workdir, oe_builddir, rootfs_dir,
                            native_sysroot, pseudo):
         """
         Prepare content for an ext2/3/4 rootfs partition.
@@ -282,10 +286,19 @@ class Partition():
             (self.fstype, extraopts, rootfs, label_str, self.fsuuid, rootfs_dir)
         exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
 
+        if self.updated_fstab_path and self.has_fstab:
+            debugfs_script_path = os.path.join(cr_workdir, "debugfs_script")
+            with open(debugfs_script_path, "w") as f:
+                f.write("cd etc\n")
+                f.write("rm fstab\n")
+                f.write("write %s fstab\n" % (self.updated_fstab_path))
+            debugfs_cmd = "debugfs -w -f %s %s" % (debugfs_script_path, rootfs)
+            exec_native_cmd(debugfs_cmd, native_sysroot)
+
         mkfs_cmd = "fsck.%s -pvfD %s" % (self.fstype, rootfs)
         exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
 
-    def prepare_rootfs_btrfs(self, rootfs, oe_builddir, rootfs_dir,
+    def prepare_rootfs_btrfs(self, rootfs, cr_workdir, oe_builddir, rootfs_dir,
                              native_sysroot, pseudo):
         """
         Prepare content for a btrfs rootfs partition.
@@ -308,7 +321,7 @@ class Partition():
              self.mkfs_extraopts, self.fsuuid, rootfs)
         exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
 
-    def prepare_rootfs_msdos(self, rootfs, oe_builddir, rootfs_dir,
+    def prepare_rootfs_msdos(self, rootfs, cr_workdir, oe_builddir, rootfs_dir,
                              native_sysroot, pseudo):
         """
         Prepare content for a msdos/vfat rootfs partition.
@@ -337,12 +350,16 @@ class Partition():
         mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (rootfs, rootfs_dir)
         exec_native_cmd(mcopy_cmd, native_sysroot)
 
+        if self.updated_fstab_path and self.has_fstab:
+            mcopy_cmd = "mcopy -i %s %s ::/etc/fstab" % (rootfs, self.updated_fstab_path)
+            exec_native_cmd(mcopy_cmd, native_sysroot)
+
         chmod_cmd = "chmod 644 %s" % rootfs
         exec_cmd(chmod_cmd)
 
     prepare_rootfs_vfat = prepare_rootfs_msdos
 
-    def prepare_rootfs_squashfs(self, rootfs, oe_builddir, rootfs_dir,
+    def prepare_rootfs_squashfs(self, rootfs, cr_workdir, oe_builddir, rootfs_dir,
                                 native_sysroot, pseudo):
         """
         Prepare content for a squashfs rootfs partition.
diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index 6fd415af5b..96d940a91d 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -94,6 +94,7 @@ class RootfsPlugin(SourcePlugin):
                                "it is not a valid path, exiting" % part.rootfs_dir)
 
         part.rootfs_dir = cls.__get_rootfs_dir(rootfs_dir)
+        part.has_fstab = os.path.exists(os.path.join(part.rootfs_dir, "etc/fstab"))
         pseudo_dir = os.path.join(part.rootfs_dir, "../pseudo")
         if not os.path.lexists(pseudo_dir):
             logger.warn("%s folder does not exist. "
@@ -103,7 +104,7 @@ class RootfsPlugin(SourcePlugin):
         new_rootfs = None
         new_pseudo = None
         # Handle excluded paths.
-        if part.exclude_path or part.include_path or part.change_directory or part.updated_fstab_path:
+        if part.exclude_path or part.include_path or part.change_directory or part.update_fstab_in_rootfs:
             # We need a new rootfs directory we can safely modify without
             # interfering with other tasks. Copy to workdir.
             new_rootfs = os.path.realpath(os.path.join(cr_workdir, "rootfs%d" % part.lineno))
@@ -214,8 +215,10 @@ class RootfsPlugin(SourcePlugin):
                     rm_cmd = "rm -rf %s" % (full_path)
                     exec_native_cmd(rm_cmd, native_sysroot, pseudo)
 
-            has_fstab = os.path.exists(os.path.join(new_rootfs, "etc/fstab"))
-            if part.updated_fstab_path and has_fstab:
+            # Update part.has_fstab here as fstab may have been added or
+            # removed by the above modifications.
+            part.has_fstab = os.path.exists(os.path.join(new_rootfs, "etc/fstab"))
+            if part.update_fstab_in_rootfs and part.has_fstab:
                 fstab_path = os.path.join(new_rootfs, "etc/fstab")
                 # Assume that fstab should always be owned by root with fixed permissions
                 install_cmd = "install -m 0644 %s %s" % (part.updated_fstab_path, fstab_path)
-- 
2.29.2


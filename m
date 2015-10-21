Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 214B376104
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Oct 2015 13:11:00 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 21 Oct 2015 06:08:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,712,1437462000"; d="scan'208";a="831708603"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 21 Oct 2015 06:08:41 -0700
Received: from localhost.localdomain (lbworker-161.fi.intel.com
	[10.237.71.161])
	by linux.intel.com (Postfix) with ESMTP id 6A80C6A4083;
	Wed, 21 Oct 2015 06:07:40 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Oct 2015 13:08:36 +0000
Message-Id: <1445432916-7538-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] wic: exec_native_cmd: implement support for pseudo
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
X-List-Received-Date: Wed, 21 Oct 2015 13:11:03 -0000

Wic runs some tools through pseudo, which makes exec_native_cmd
to fail and throw cryptic error message when tool is not baked:
For example:
  Error: exec_cmd: 'export
  PSEUDO_PREFIX=/media/ssd/poky-build/tmp/sysroots/x86_64-linux/usr;export
  PSEUDO_LOCALSTATEDIR=/media/ssd/poky-build/tmp/work/qemux86-poky-linux/ ...
  PSEUDO_PASSWD=/media/ssd/poky-build/tmp/work/qemux86-poky-linux/ ...
  PSEUDO_NOSYMLINKEXP=1;/media/ssd/poky-build/tmp/sysroots/ ...
  mkfs.ext4 -F -i 8192 /var/tmp/wic/build/rootfs_platform.7.ext4 -L
  platform -d
  /media/ssd/poky-build/tmp/work/qemux86-poky-linux/core-image-minimal/...
  returned '1' instead of 0

Made exec_native_cmd aware of pseudo and properly report
errors when command is not found.

[YOCTO #6204]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/kickstart/custom_commands/partition.py |  6 +++---
 scripts/lib/wic/utils/oe/misc.py                       | 12 +++++++-----
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
index eee25a4..babc006 100644
--- a/scripts/lib/wic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
@@ -297,7 +297,7 @@ class Wic_PartData(FC4_PartData):
 
         mkfs_cmd = "mkfs.%s -F %s %s %s -d %s" % \
             (self.fstype, extra_imagecmd, rootfs, label_str, rootfs_dir)
-        exec_native_cmd(pseudo + mkfs_cmd, native_sysroot)
+        exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
 
     def prepare_rootfs_btrfs(self, rootfs, oe_builddir, rootfs_dir,
                              native_sysroot, pseudo):
@@ -330,7 +330,7 @@ class Wic_PartData(FC4_PartData):
 
         mkfs_cmd = "mkfs.%s -b %d -r %s %s %s" % \
             (self.fstype, rootfs_size * 1024, rootfs_dir, label_str, rootfs)
-        exec_native_cmd(pseudo + mkfs_cmd, native_sysroot)
+        exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
 
     def prepare_rootfs_vfat(self, rootfs, oe_builddir, rootfs_dir,
                             native_sysroot, pseudo):
@@ -378,7 +378,7 @@ class Wic_PartData(FC4_PartData):
         """
         squashfs_cmd = "mksquashfs %s %s -noappend" % \
                        (rootfs_dir, rootfs)
-        exec_native_cmd(pseudo + squashfs_cmd, native_sysroot)
+        exec_native_cmd(squashfs_cmd, native_sysroot, pseudo=pseudo)
 
     def prepare_empty_partition_ext(self, rootfs, oe_builddir,
                                     native_sysroot):
diff --git a/scripts/lib/wic/utils/oe/misc.py b/scripts/lib/wic/utils/oe/misc.py
index 7370d93..dcfdd14 100644
--- a/scripts/lib/wic/utils/oe/misc.py
+++ b/scripts/lib/wic/utils/oe/misc.py
@@ -83,7 +83,7 @@ def exec_cmd(cmd_and_args, as_shell=False, catch=3):
     return out
 
 
-def exec_native_cmd(cmd_and_args, native_sysroot, catch=3):
+def exec_native_cmd(cmd_and_args, native_sysroot, catch=3, pseudo=""):
     """
     Execute native command, catching stderr, stdout
 
@@ -91,19 +91,21 @@ def exec_native_cmd(cmd_and_args, native_sysroot, catch=3):
 
     Always need to execute native commands as_shell
     """
+    args = cmd_and_args.split()
+    if pseudo:
+        cmd_and_args = pseudo + cmd_and_args
     native_paths = \
         "export PATH=%s/sbin:%s/usr/sbin:%s/usr/bin" % \
         (native_sysroot, native_sysroot, native_sysroot)
     native_cmd_and_args = "%s;%s" % (native_paths, cmd_and_args)
     msger.debug("exec_native_cmd: %s" % cmd_and_args)
 
-    args = cmd_and_args.split()
     msger.debug(args)
 
     ret, out = _exec_cmd(native_cmd_and_args, True, catch)
-
-    if ret == 127: # shell command-not-found
-        prog = args[0]
+    prog = args[0]
+    if ret == 127 or (pseudo and ret == 1 and out == "Can't find '%s' in $PATH." % prog):
+       # shell command-not-found or pseudo can't find command to run
         msg = "A native program %s required to build the image "\
               "was not found (see details above).\n\n" % prog
         recipe = NATIVE_RECIPES.get(prog)
-- 
2.1.4



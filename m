Return-Path: <chee.yang.lee@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 6BFB47F8C1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 06:28:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Nov 2019 22:28:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,224,1571727600"; d="scan'208";a="209994589"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga006.jf.intel.com with ESMTP; 20 Nov 2019 22:28:53 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Nov 2019 14:28:52 +0800
Message-Id: <1574317732-41708-1-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2] wic: 'wic cp' to copy from image
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
X-List-Received-Date: Thu, 21 Nov 2019 06:28:53 -0000

From: Chee Yang Lee <chee.yang.lee@intel.com>

currently 'wic cp' only works for copy file from local storage to
wic image.

enhance 'wic cp' to copy file/directory from wic image to local storage.

include selftest and 'wic help' updates.

[YOCTO#12169]

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 17 +++++++++++++++++
 scripts/lib/wic/engine.py           | 35 +++++++++++++++++++++++++++--------
 scripts/lib/wic/help.py             | 29 +++++++++++++++++++----------
 scripts/wic                         | 16 +++++++++++++---
 4 files changed, 76 insertions(+), 21 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index ea75300..3ed4cab 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -866,6 +866,13 @@ class Wic2(WicTestCase):
             self.assertEqual(8, len(result.output.split('\n')))
             self.assertTrue(os.path.basename(testdir) in result.output)
 
+            # copy the file from the partition and check if it success
+            dest = '%s-cp' % testfile.name
+            runCmd("wic cp %s:1/%s %s -n %s" % (images[0],
+                    os.path.basename(testfile.name), dest, sysroot))
+            self.assertTrue(os.path.exists(dest))
+
+
     def test_wic_rm(self):
         """Test removing files and directories from the the wic image."""
         runCmd("wic create mkefidisk "
@@ -1005,6 +1012,16 @@ class Wic2(WicTestCase):
             newdirs = set(line.split()[-1] for line in result.output.split('\n') if line)
             self.assertEqual(newdirs.difference(dirs), set([os.path.basename(testfile.name)]))
 
+            # check if the file to copy is in the partition
+            result = runCmd("wic ls %s:2/etc/ -n %s" % (images[0], sysroot))
+            self.assertTrue('fstab' in [line.split()[-1] for line in result.output.split('\n') if line])
+
+            # copy file from the partition, replace the temporary file content with it and
+            # check for the file size to validate the copy
+            runCmd("wic cp %s:2/etc/fstab %s -n %s" % (images[0], testfile.name, sysroot))
+            self.assertTrue(os.stat(testfile.name).st_size > 0)
+
+
     def test_wic_rm_ext(self):
         """Test removing files from the ext partition."""
         runCmd("wic create mkefidisk "
diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 18776fa..713219b 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -322,16 +322,31 @@ class Disk:
                                                    self._get_part_image(pnum),
                                                    path))
 
-    def copy(self, src, pnum, path):
+    def copy(self, src, dest):
         """Copy partition image into wic image."""
+        pnum =  dest.part if isinstance(src, str) else src.part
+
         if self.partitions[pnum].fstype.startswith('ext'):
-            cmd = "printf 'cd {}\nwrite {} {}\n' | {} -w {}".\
-                      format(path, src, os.path.basename(src),
+            if isinstance(src, str):
+                cmd = "printf 'cd {}\nwrite {} {}\n' | {} -w {}".\
+                      format(os.path.dirname(dest.path), src, os.path.basename(src),
                              self.debugfs, self._get_part_image(pnum))
+            else: # copy from wic
+                # run both dump and rdump to support both files and directory
+                cmd = "printf 'cd {}\ndump /{} {}\nrdump /{} {}\n' | {} {}".\
+                      format(os.path.dirname(src.path), src.path,
+                             dest, src.path, dest, self.debugfs,
+                             self._get_part_image(pnum))
         else: # fat
-            cmd = "{} -i {} -snop {} ::{}".format(self.mcopy,
+            if isinstance(src, str):
+                cmd = "{} -i {} -snop {} ::{}".format(self.mcopy,
+                                                  self._get_part_image(pnum),
+                                                  src, dest.path)
+            else:
+                cmd = "{} -i {} -snop ::{} {}".format(self.mcopy,
                                                   self._get_part_image(pnum),
-                                                  src, path)
+                                                  src.path, dest)
+
         exec_cmd(cmd, as_shell=True)
         self._put_part_image(pnum)
 
@@ -523,11 +538,15 @@ def wic_ls(args, native_sysroot):
 
 def wic_cp(args, native_sysroot):
     """
-    Copy local file or directory to the vfat partition of
+    Copy file or directory to/from the vfat/ext partition of
     partitioned image.
     """
-    disk = Disk(args.dest.image, native_sysroot)
-    disk.copy(args.src, args.dest.part, args.dest.path)
+    if isinstance(args.dest, str):
+        disk = Disk(args.src.image, native_sysroot)
+    else:
+        disk = Disk(args.dest.image, native_sysroot)
+    disk.copy(args.src, args.dest)
+
 
 def wic_rm(args, native_sysroot):
     """
diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 968cc0e..72b26a8 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -341,12 +341,15 @@ DESCRIPTION
 
 wic_cp_usage = """
 
- Copy files and directories to the vfat or ext* partition
+ Copy files and directories to/from the vfat or ext* partition
 
- usage: wic cp <src> <image>:<partition>[<path>] [--native-sysroot <path>]
+ usage: wic cp <src> <dest> [--native-sysroot <path>]
 
- This command  copies local files or directories to the vfat or ext* partitions
-of partitioned  image.
+ source/destination image in format <image>:<partition>[<path>]
+
+ This command copies files or directories either
+  - from local to vfat or ext* partitions of partitioned image
+  - from vfat or ext* partitions of partitioned image to local
 
  See 'wic help cp' for more detailed instructions.
 
@@ -355,16 +358,18 @@ of partitioned  image.
 wic_cp_help = """
 
 NAME
-    wic cp - copy files and directories to the vfat or ext* partitions
+    wic cp - copy files and directories to/from the vfat or ext* partitions
 
 SYNOPSIS
-    wic cp <src> <image>:<partition>
-    wic cp <src> <image>:<partition><path>
-    wic cp <src> <image>:<partition><path> --native-sysroot <path>
+    wic cp <src> <dest>:<partition>
+    wic cp <src>:<partition> <dest>
+    wic cp <src> <dest-image>:<partition><path>
+    wic cp <src> <dest-image>:<partition><path> --native-sysroot <path>
 
 DESCRIPTION
-    This command copies files and directories to the vfat or ext* partition of
-    the partitioned image.
+    This command copies files or directories either
+      - from local to vfat or ext* partitions of partitioned image
+      - from vfat or ext* partitions of partitioned image to local
 
     The first form of it copies file or directory to the root directory of
     the partition:
@@ -397,6 +402,10 @@ DESCRIPTION
                4 files                   0 bytes
                                 15 675 392 bytes free
 
+    The third form of the command copies file or directory from the specified directory
+    on the partition to local:
+       $ wic cp tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1/vmlinuz test
+
     The -n option is used to specify the path to the native sysroot
     containing the tools(parted and mtools) to use.
 """
diff --git a/scripts/wic b/scripts/wic
index 1a71730..5950d88 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -392,9 +392,9 @@ def imgpathtype(arg):
 
 def wic_init_parser_cp(subparser):
     subparser.add_argument("src",
-                        help="source spec")
-    subparser.add_argument("dest", type=imgpathtype,
-                        help="image spec: <image>:<vfat partition>[<path>]")
+                        help="image spec: <image>:<vfat partition>[<path>] or <file>")
+    subparser.add_argument("dest",
+                        help="image spec: <image>:<vfat partition>[<path>] or <file>")
     subparser.add_argument("-n", "--native-sysroot",
                         help="path to the native sysroot containing the tools")
 
@@ -519,6 +519,16 @@ def main(argv):
                 hlpt[0](hlpt[1], hlpt[2])
             return 0
 
+    # validate wic cp src and dest parameter to identify which one of it is
+    # image and cast it into imgtype
+    if args.command == "cp":
+        if ":" in args.dest:
+            args.dest = imgtype(args.dest)
+        elif ":" in args.src:
+            args.src = imgtype(args.src)
+        else:
+            raise argparse.ArgumentTypeError("no image or partition number specified.")
+
     return hlp.invoke_subcommand(args, parser, hlp.wic_help_usage, subcommands)
 
 
-- 
2.7.4



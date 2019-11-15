Return-Path: <chee.yang.lee@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 66AC07FBCD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2019 01:58:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Nov 2019 17:58:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,306,1569308400"; d="scan'208";a="257629554"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by FMSMGA003.fm.intel.com with ESMTP; 14 Nov 2019 17:58:50 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Nov 2019 09:58:48 +0800
Message-Id: <1573783128-17519-2-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573783128-17519-1-git-send-email-chee.yang.lee@intel.com>
References: <1573783128-17519-1-git-send-email-chee.yang.lee@intel.com>
Subject: [PATCH 2/2] wic: rm with -r flag support
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
X-List-Received-Date: Fri, 15 Nov 2019 01:58:51 -0000

From: Chee Yang Lee <chee.yang.lee@intel.com>

wic currently unable to remove non-empty directory in ext* partition.
enable wic rm to remove non-empty directory and all the sub-content
with -r flag.
update help documents for 'wic rm'.
[YOCTO #12404]

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 scripts/lib/wic/engine.py | 62 ++++++++++++++++++++++++++++++++++-------------
 scripts/lib/wic/help.py   |  4 +++
 scripts/wic               |  3 +++
 3 files changed, 52 insertions(+), 17 deletions(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 18776fa..7e66207 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -19,6 +19,7 @@ import os
 import tempfile
 import json
 import subprocess
+import re
 
 from collections import namedtuple, OrderedDict
 from distutils.spawn import find_executable
@@ -335,25 +336,52 @@ class Disk:
         exec_cmd(cmd, as_shell=True)
         self._put_part_image(pnum)
 
-    def remove(self, pnum, path):
+    def remove_ext(self, pnum, path, recursive):
+        """
+        Remove files/dirs and their contents from the partition.
+        This only applies to ext* partition.
+        """
+        abs_path = re.sub('\/\/+', '/', path)
+        cmd = "{} {} -wR 'rm \"{}\"'".format(self.debugfs,
+                                            self._get_part_image(pnum),
+                                            abs_path)
+        out = exec_cmd(cmd , as_shell=True)
+        for line in out.splitlines():
+            if line.startswith("rm:"):
+                if "file is a directory" in line:
+                    if recursive:
+                        # loop through content and delete them one by one if
+                        # flaged with -r
+                        subdirs = iter(self.dir(pnum, abs_path).splitlines())
+                        next(subdirs)
+                        for subdir in subdirs:
+                            dir = subdir.split(':')[1].split(" ", 1)[1]
+                            if not dir == "." and not dir == "..":
+                                self.remove_ext(pnum, "%s/%s" % (abs_path, dir), recursive)
+
+                    rmdir_out = exec_cmd("{} {} -wR 'rmdir \"{}\"'".format(self.debugfs,
+                                                    self._get_part_image(pnum),
+                                                    abs_path.rstrip('/'))
+                                                    , as_shell=True)
+
+                    for rmdir_line in rmdir_out.splitlines():
+                        if "directory not empty" in rmdir_line:
+                            raise WicError("Could not complete operation: \n%s \n"
+                                            "use -r to remove non-empty directory" % rmdir_line)
+                        if rmdir_line.startswith("rmdir:"):
+                            raise WicError("Could not complete operation: \n%s "
+                                            "\n%s" % (str(line), rmdir_line))
+
+                else:
+                    raise WicError("Could not complete operation: \n%s "
+                                    "\nUnable to remove %s" % (str(line), abs_path))
+
+    def remove(self, pnum, path, recursive):
         """Remove files/dirs from the partition."""
         partimg = self._get_part_image(pnum)
         if self.partitions[pnum].fstype.startswith('ext'):
-            cmd = "{} {} -wR 'rm {}'".format(self.debugfs,
-                                                self._get_part_image(pnum),
-                                                path)
-            out = exec_cmd(cmd , as_shell=True)
-            for line in out.splitlines():
-                if line.startswith("rm:"):
-                    if "file is a directory" in line:
-                        # Try rmdir to see if this is an empty directory. This won't delete
-                        # any non empty directory so let user know about any error that this might
-                        # generate.
-                        print(exec_cmd("{} {} -wR 'rmdir {}'".format(self.debugfs,
-                                                    self._get_part_image(pnum),
-                                                    path), as_shell=True))
-                    else:
-                        raise WicError("Could not complete operation: wic %s" % str(line))
+            self.remove_ext(pnum, path, recursive)
+
         else: # fat
             cmd = "{} -i {} ::{}".format(self.mdel, partimg, path)
             try:
@@ -535,7 +563,7 @@ def wic_rm(args, native_sysroot):
     partitioned image.
     """
     disk = Disk(args.path.image, native_sysroot)
-    disk.remove(args.path.part, args.path.path)
+    disk.remove(args.path.part, args.path.path, args.recursive_delete)
 
 def wic_write(args, native_sysroot):
     """
diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 968cc0e..812ebe3 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -422,6 +422,7 @@ NAME
 SYNOPSIS
     wic rm <src> <image>:<partition><path>
     wic rm <src> <image>:<partition><path> --native-sysroot <path>
+    wic rm -r <image>:<partition><path>
 
 DESCRIPTION
     This command removes files or directories from the vfat or ext* partition of the
@@ -456,6 +457,9 @@ DESCRIPTION
 
     The -n option is used to specify the path to the native sysroot
     containing the tools(parted and mtools) to use.
+
+    The -r option is used to remove directories and their contents
+    recursively,this only applies to ext* partition.
 """
 
 wic_write_usage = """
diff --git a/scripts/wic b/scripts/wic
index 1a71730..ea61410 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -403,6 +403,9 @@ def wic_init_parser_rm(subparser):
                         help="path: <image>:<vfat partition><path>")
     subparser.add_argument("-n", "--native-sysroot",
                         help="path to the native sysroot containing the tools")
+    subparser.add_argument("-r", dest="recursive_delete", action="store_true", default=False,
+                        help="remove directories and their contents recursively, "
+                        " this only applies to ext* partition")
 
 def expandtype(rules):
     """
-- 
2.7.4



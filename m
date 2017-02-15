Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 7850177305
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 09:02:04 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 15 Feb 2017 01:02:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,165,1484035200"; d="scan'208";a="1094972711"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 15 Feb 2017 01:02:01 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 920E26A4006
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 01:00:58 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Feb 2017 10:38:31 +0200
Message-Id: <9a32e42974df6a7645391a00284df3fb4b34e0ed.1487110279.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1487110279.git.ed.bartosh@linux.intel.com>
References: <cover.1487110279.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 08/11] wic: raise WicError in core modules
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
X-List-Received-Date: Wed, 15 Feb 2017 09:02:04 -0000

Replaced sys.exit with raising WicError in the core wic modules.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/engine.py       | 21 ++++++++-----------
 scripts/lib/wic/partition.py    | 46 +++++++++++++++++++----------------------
 scripts/lib/wic/utils/misc.py   |  6 +++---
 scripts/lib/wic/utils/runner.py |  6 +++---
 4 files changed, 36 insertions(+), 43 deletions(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 2ccd510..38a68ed 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -30,8 +30,8 @@
 
 import logging
 import os
-import sys
 
+from wic.errors import WicError
 from wic.plugin import pluginmgr
 from wic.utils.misc import get_bitbake_var
 
@@ -44,8 +44,7 @@ def verify_build_env():
     Returns True if it is, false otherwise
     """
     if not os.environ.get("BUILDDIR"):
-        logger.error("BUILDDIR not found, exiting. (Did you forget to source oe-init-build-env?)")
-        sys.exit(1)
+        raise WicError("BUILDDIR not found, exiting. (Did you forget to source oe-init-build-env?)")
 
     return True
 
@@ -180,8 +179,7 @@ def wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
     try:
         oe_builddir = os.environ["BUILDDIR"]
     except KeyError:
-        logger.error("BUILDDIR not found, exiting. (Did you forget to source oe-init-build-env?)")
-        sys.exit(1)
+        raise WicError("BUILDDIR not found, exiting. (Did you forget to source oe-init-build-env?)")
 
     if not os.path.exists(options.outdir):
         os.makedirs(options.outdir)
@@ -189,8 +187,7 @@ def wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
     pname = 'direct'
     plugin_class = pluginmgr.get_plugins('imager').get(pname)
     if not plugin_class:
-        logger.error('Unknown plugin: %s', pname)
-        sys.exit(1)
+        raise WicError('Unknown plugin: %s' % pname)
 
     plugin = plugin_class(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
                           native_sysroot, oe_builddir, options)
@@ -217,11 +214,11 @@ def wic_list(args, scripts_path):
         wks_file = args[0]
         fullpath = find_canned_image(scripts_path, wks_file)
         if not fullpath:
-            logger.error("No image named %s found, exiting. "
-                         "(Use 'wic list images' to list available images, or "
-                         "specify a fully-qualified OE kickstart (.wks) "
-                         "filename)\n", wks_file)
-            sys.exit(1)
+            raise WicError("No image named %s found, exiting. "
+                           "(Use 'wic list images' to list available images, "
+                           "or specify a fully-qualified OE kickstart (.wks) "
+                           "filename)" % wks_file)
+
         list_canned_image_help(scripts_path, fullpath)
         return True
 
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 349054f..c5c439a 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -26,9 +26,9 @@
 
 import logging
 import os
-import sys
 import tempfile
 
+from wic.errors import WicError
 from wic.utils.misc import exec_cmd, exec_native_cmd, get_bitbake_var
 from wic.plugin import pluginmgr
 
@@ -98,9 +98,9 @@ class Partition():
         if self.fixed_size:
             rootfs_size = self.fixed_size
             if actual_rootfs_size > rootfs_size:
-                logger.error("Actual rootfs size (%d kB) is larger than allowed size %d kB",
-                             actual_rootfs_size, rootfs_size)
-                sys.exit(1)
+                raise WicError("Actual rootfs size (%d kB) is larger than "
+                               "allowed size %d kB" %
+                               (actual_rootfs_size, rootfs_size))
         else:
             extra_blocks = self.get_extra_block_count(actual_rootfs_size)
             if extra_blocks < self.extra_space:
@@ -131,10 +131,10 @@ class Partition():
         """
         if not self.source:
             if not self.size and not self.fixed_size:
-                logger.error("The %s partition has a size of zero. Please "
-                             "specify a non-zero --size/--fixed-size for that "
-                             "partition.", self.mountpoint)
-                sys.exit(1)
+                raise WicError("The %s partition has a size of zero. Please "
+                               "specify a non-zero --size/--fixed-size for that "
+                               "partition." % self.mountpoint)
+
             if self.fstype and self.fstype == "swap":
                 self.prepare_swap_partition(cr_workdir, oe_builddir,
                                             native_sysroot)
@@ -156,12 +156,11 @@ class Partition():
         plugins = pluginmgr.get_source_plugins()
 
         if self.source not in plugins:
-            logger.error("The '%s' --source specified for %s doesn't exist.\n\t"
-                         "See 'wic list source-plugins' for a list of available"
-                         " --sources.\n\tSee 'wic help source-plugins' for "
-                         "details on adding a new source plugin.",
-                         self.source, self.mountpoint)
-            sys.exit(1)
+            raise WicError("The '%s' --source specified for %s doesn't exist.\n\t"
+                           "See 'wic list source-plugins' for a list of available"
+                           " --sources.\n\tSee 'wic help source-plugins' for "
+                           "details on adding a new source plugin." %
+                           (self.source, self.mountpoint))
 
         srcparams_dict = {}
         if self.sourceparams:
@@ -191,16 +190,14 @@ class Partition():
         # further processing required Partition.size to be an integer, make
         # sure that it is one
         if not isinstance(self.size, int):
-            logger.error("Partition %s internal size is not an integer. "
-                         "This a bug in source plugin %s and needs to be fixed.",
-                         self.mountpoint, self.source)
-            sys.exit(1)
+            raise WicError("Partition %s internal size is not an integer. "
+                           "This a bug in source plugin %s and needs to be fixed." %
+                           (self.mountpoint, self.source))
 
         if self.fixed_size and self.size > self.fixed_size:
-            logger.error("File system image of partition %s is larger (%d kB) "
-                         "than its allowed size %d kB",
-                          self.mountpoint, self.size, self.fixed_size)
-            sys.exit(1)
+            raise WicError("File system image of partition %s is "
+                           "larger (%d kB) than its allowed size %d kB" %
+                           (self.mountpoint, self.size, self.fixed_size))
 
     def prepare_rootfs_from_fs_image(self, cr_workdir, oe_builddir,
                                      rootfs_dir):
@@ -240,9 +237,8 @@ class Partition():
             os.remove(rootfs)
 
         if not self.fstype:
-            logger.error("File system for partition %s not specified in kickstart, "
-                         "use --fstype option", self.mountpoint)
-            sys.exit(1)
+            raise WicError("File system for partition %s not specified in "
+                           "kickstart, use --fstype option" % self.mountpoint)
 
         # Get rootfs size from bitbake variable if it's not set in .ks file
         if not self.size:
diff --git a/scripts/lib/wic/utils/misc.py b/scripts/lib/wic/utils/misc.py
index b7b835a..94fdab2 100644
--- a/scripts/lib/wic/utils/misc.py
+++ b/scripts/lib/wic/utils/misc.py
@@ -33,6 +33,7 @@ import re
 from collections import defaultdict
 from distutils import spawn
 
+from wic.errors import WicError
 from wic.utils import runner
 
 logger = logging.getLogger('wic')
@@ -74,9 +75,8 @@ def _exec_cmd(cmd_and_args, as_shell=False, catch=3):
         ret, out = runner.runtool(args, catch)
     out = out.strip()
     if ret != 0:
-        logger.error("_exec_cmd: %s returned '%s' instead of 0\noutput: %s" % \
-                    (cmd_and_args, ret, out))
-        sys.exit(1)
+        raise WicError("_exec_cmd: %s returned '%s' instead of 0\noutput: %s" % \
+                       (cmd_and_args, ret, out))
 
     logger.debug("_exec_cmd: output for %s (rc = %d): %s",
                  cmd_and_args, ret, out)
diff --git a/scripts/lib/wic/utils/runner.py b/scripts/lib/wic/utils/runner.py
index d27dcc7..5ede192 100644
--- a/scripts/lib/wic/utils/runner.py
+++ b/scripts/lib/wic/utils/runner.py
@@ -18,7 +18,8 @@
 import logging
 import os
 import subprocess
-import sys
+
+from wic.errors import WicError
 
 logger = logging.getLogger('wic')
 
@@ -72,8 +73,7 @@ def runtool(cmdln_or_args, catch=1):
     except OSError as err:
         if err.errno == 2:
             # [Errno 2] No such file or directory
-            logger.error('Cannot run command: %s, lost dependency?', cmd)
-            sys.exit(1)
+            raise WicError('Cannot run command: %s, lost dependency?' % cmd)
         else:
             raise # relay
     finally:
-- 
2.1.4



Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 366B2784C9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 13:21:40 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 16 Jun 2017 06:21:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,347,1493708400"; d="scan'208";a="1161293466"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2017 06:21:42 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id A8239580399
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 06:21:41 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 16:19:29 +0300
Message-Id: <61dfd1133b0e83fb3acfc45ab5bcce3e94561abf.1497618833.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1497618833.git.ed.bartosh@linux.intel.com>
References: <cover.1497618833.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 3/4] wic: code cleanup
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
X-List-Received-Date: Fri, 16 Jun 2017 13:21:41 -0000

Split long lines.
Removed unused imports.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/filemap.py               | 8 ++------
 scripts/lib/wic/misc.py                  | 4 ++--
 scripts/lib/wic/partition.py             | 1 -
 scripts/lib/wic/pluginbase.py            | 1 -
 scripts/lib/wic/plugins/source/rootfs.py | 2 +-
 5 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/scripts/lib/wic/filemap.py b/scripts/lib/wic/filemap.py
index 6d11355..77e32b9 100644
--- a/scripts/lib/wic/filemap.py
+++ b/scripts/lib/wic/filemap.py
@@ -34,13 +34,9 @@ def get_block_size(file_obj):
     Returns block size for file object 'file_obj'. Errors are indicated by the
     'IOError' exception.
     """
-
-    from fcntl import ioctl
-    import struct
-
     # Get the block size of the host file-system for the image file by calling
     # the FIGETBSZ ioctl (number 2).
-    binary_data = ioctl(file_obj, 2, struct.pack('I', 0))
+    binary_data = fcntl.ioctl(file_obj, 2, struct.pack('I', 0))
     return struct.unpack('I', binary_data)[0]
 
 class ErrorNotSupp(Exception):
@@ -228,7 +224,7 @@ class FilemapSeek(_FilemapBase):
         try:
             tmp_obj = tempfile.TemporaryFile("w+", dir=directory)
         except IOError as err:
-            raise ErrorNotSupp("cannot create a temporary in \"%s\": %s"
+            raise ErrorNotSupp("cannot create a temporary in \"%s\": %s" \
                               % (directory, err))
 
         try:
diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
index e1df824..3ebae0a 100644
--- a/scripts/lib/wic/misc.py
+++ b/scripts/lib/wic/misc.py
@@ -164,8 +164,8 @@ def exec_native_cmd(cmd_and_args, native_sysroot, pseudo=""):
               "was not found (see details above).\n\n" % prog
         recipe = NATIVE_RECIPES.get(prog)
         if recipe:
-            msg += "Please make sure wic-tools have %s-native in its DEPENDS, bake it with 'bitbake wic-tools' "\
-                   "and try again.\n" % recipe
+            msg += "Please make sure wic-tools have %s-native in its DEPENDS, "\
+                   "build it with 'bitbake wic-tools' and try again.\n" % recipe
         else:
             msg += "Wic failed to find a recipe to build native %s. Please "\
                    "file a bug against wic.\n" % prog
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 1851c4a..5aa68c9 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -26,7 +26,6 @@
 
 import logging
 import os
-import tempfile
 
 from wic import WicError
 from wic.misc import exec_cmd, exec_native_cmd, get_bitbake_var
diff --git a/scripts/lib/wic/pluginbase.py b/scripts/lib/wic/pluginbase.py
index 08f9979..c009820 100644
--- a/scripts/lib/wic/pluginbase.py
+++ b/scripts/lib/wic/pluginbase.py
@@ -137,4 +137,3 @@ class SourcePlugin(metaclass=PluginMeta):
         'prepares' the partition to be incorporated into the image.
         """
         logger.debug("SourcePlugin: do_prepare_partition: part: %s", part)
-
diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index 1b9f68b..4dc4cb8 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -34,7 +34,7 @@ from oe.path import copyhardlinktree
 
 from wic import WicError
 from wic.pluginbase import SourcePlugin
-from wic.misc import get_bitbake_var, exec_cmd
+from wic.misc import get_bitbake_var
 
 logger = logging.getLogger('wic')
 
-- 
2.1.4



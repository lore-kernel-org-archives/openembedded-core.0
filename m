Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 64ED1772E3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 14:11:31 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 01 Feb 2017 06:11:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,320,1477983600"; d="scan'208";a="1120668550"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 01 Feb 2017 06:11:31 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 8051C6A4006
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 06:10:32 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2017 15:48:18 +0200
Message-Id: <2dab846a19b4e7267bd83ca596a7ed0ddd7cdf54.1485953483.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485953483.git.ed.bartosh@linux.intel.com>
References: <cover.1485953483.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 11/18] wic: partition: simlify calling plugin methods
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
X-List-Received-Date: Wed, 01 Feb 2017 14:11:31 -0000

Replaced parse_sourceparams function with list comprehension.
Used local variables instead of attributes.
Moved global variable to the local scope.

[YOCTO #10619]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/partition.py     | 53 +++++++++++++++++++---------------------
 scripts/lib/wic/utils/oe/misc.py | 23 -----------------
 2 files changed, 25 insertions(+), 51 deletions(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 49d1327..094a8c3 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -27,16 +27,10 @@
 import os
 import tempfile
 
-from wic.utils.oe.misc import msger, parse_sourceparams
+from wic.utils.oe.misc import msger
 from wic.utils.oe.misc import exec_cmd, exec_native_cmd, get_bitbake_var
 from wic.plugin import pluginmgr
 
-partition_methods = {
-    "do_stage_partition":None,
-    "do_prepare_partition":None,
-    "do_configure_partition":None,
-}
-
 class Partition():
 
     def __init__(self, args, lineno):
@@ -129,9 +123,6 @@ class Partition():
         Prepare content for individual partitions, depending on
         partition command parameters.
         """
-        if self.sourceparams:
-            self.sourceparams_dict = parse_sourceparams(self.sourceparams)
-
         if not self.source:
             if not self.size and not self.fixed_size:
                 msger.error("The %s partition has a size of zero. Please "
@@ -164,24 +155,30 @@ class Partition():
                         "details on adding a new source plugin." % \
                         (self.source, self.mountpoint))
 
-        self._source_methods = pluginmgr.get_source_plugin_methods(\
-                                   self.source, partition_methods)
-        self._source_methods["do_configure_partition"](self, self.sourceparams_dict,
-                                                       creator, cr_workdir,
-                                                       oe_builddir,
-                                                       bootimg_dir,
-                                                       kernel_dir,
-                                                       native_sysroot)
-        self._source_methods["do_stage_partition"](self, self.sourceparams_dict,
-                                                   creator, cr_workdir,
-                                                   oe_builddir,
-                                                   bootimg_dir, kernel_dir,
-                                                   native_sysroot)
-        self._source_methods["do_prepare_partition"](self, self.sourceparams_dict,
-                                                     creator, cr_workdir,
-                                                     oe_builddir,
-                                                     bootimg_dir, kernel_dir, rootfs_dir,
-                                                     native_sysroot)
+        srcparams_dict = {}
+        if self.sourceparams:
+            # Split sourceparams string of the form key1=val1[,key2=val2,...]
+            # into a dict.  Also accepts valueless keys i.e. without =
+            splitted = self.sourceparams.split(',')
+            srcparams_dict = dict(par.split('=') for par in splitted if par)
+
+        partition_methods = {
+            "do_stage_partition": None,
+            "do_prepare_partition": None,
+            "do_configure_partition": None
+        }
+
+        methods = pluginmgr.get_source_plugin_methods(self.source,
+                                                      partition_methods)
+        methods["do_configure_partition"](self, srcparams_dict, creator,
+                                          cr_workdir, oe_builddir, bootimg_dir,
+                                          kernel_dir, native_sysroot)
+        methods["do_stage_partition"](self, srcparams_dict, creator,
+                                      cr_workdir, oe_builddir, bootimg_dir,
+                                      kernel_dir, native_sysroot)
+        methods["do_prepare_partition"](self, srcparams_dict, creator,
+                                        cr_workdir, oe_builddir, bootimg_dir,
+                                        kernel_dir, rootfs_dir, native_sysroot)
 
         # further processing required Partition.size to be an integer, make
         # sure that it is one
diff --git a/scripts/lib/wic/utils/oe/misc.py b/scripts/lib/wic/utils/oe/misc.py
index 3737c4b..6781d83 100644
--- a/scripts/lib/wic/utils/oe/misc.py
+++ b/scripts/lib/wic/utils/oe/misc.py
@@ -222,26 +222,3 @@ def get_bitbake_var(var, image=None, cache=True):
     get_var method of BB_VARS singleton.
     """
     return BB_VARS.get_var(var, image, cache)
-
-def parse_sourceparams(sourceparams):
-    """
-    Split sourceparams string of the form key1=val1[,key2=val2,...]
-    into a dict.  Also accepts valueless keys i.e. without =.
-
-    Returns dict of param key/val pairs (note that val may be None).
-    """
-    params_dict = {}
-
-    params = sourceparams.split(',')
-    if params:
-        for par in params:
-            if not par:
-                continue
-            if not '=' in par:
-                key = par
-                val = None
-            else:
-                key, val = par.split('=')
-            params_dict[key] = val
-
-    return params_dict
-- 
2.1.4



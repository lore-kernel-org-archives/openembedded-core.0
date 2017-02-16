Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 74022772EA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 15:56:39 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Feb 2017 07:56:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,169,1484035200"; d="scan'208";a="934663132"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 16 Feb 2017 07:56:39 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id E1A576A4080
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 07:56:38 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Feb 2017 17:33:34 +0200
Message-Id: <667ccefb15e4d3b2fadd76a66a58ca9520a7d0de.1487257345.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1487257345.git.ed.bartosh@linux.intel.com>
References: <cover.1487257345.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 07/10] wic: remove PluginMgr.get_plugin_methods
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
X-List-Received-Date: Thu, 16 Feb 2017 15:56:39 -0000

Call methods directly instead of getting them with
get_plugin_methods and then calling.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/help.py                  |  7 +------
 scripts/lib/wic/partition.py             | 20 ++++++++------------
 scripts/lib/wic/plugin.py                | 17 -----------------
 scripts/lib/wic/plugins/imager/direct.py | 10 ++++------
 4 files changed, 13 insertions(+), 41 deletions(-)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 196896c..c08ad34 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -373,12 +373,7 @@ DESCRIPTION
 
     This scheme is extensible - adding more hooks is a simple matter
     of adding more plugin methods to SourcePlugin and derived classes.
-    The code that then needs to call the plugin methods uses
-    plugin.get_plugin_methods() to find the method(s) needed by
-    the call; this is done by filling up a dict with keys containing
-    the method names of interest - on success, these will be filled in
-    with the actual methods. Please see the implementation for
-    examples and details.
+    Please see the implementation for details.
 """
 
 wic_overview_help = """
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 1f384be..adf44b7 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -170,20 +170,16 @@ class Partition():
             splitted = self.sourceparams.split(',')
             srcparams_dict = dict(par.split('=') for par in splitted if par)
 
-        partition_methods = ["do_configure_partition", "do_stage_partition",
-                             "do_prepare_partition"]
-
-        methods = PluginMgr.get_plugin_methods('source', self.source,
-                                               partition_methods)
-        methods["do_configure_partition"](self, srcparams_dict, creator,
-                                          cr_workdir, oe_builddir, bootimg_dir,
-                                          kernel_dir, native_sysroot)
-        methods["do_stage_partition"](self, srcparams_dict, creator,
+        plugin = PluginMgr.get_plugins('source')[self.source]
+        plugin.do_configure_partition(self, srcparams_dict, creator,
                                       cr_workdir, oe_builddir, bootimg_dir,
                                       kernel_dir, native_sysroot)
-        methods["do_prepare_partition"](self, srcparams_dict, creator,
-                                        cr_workdir, oe_builddir, bootimg_dir,
-                                        kernel_dir, rootfs_dir, native_sysroot)
+        plugin.do_stage_partition(self, srcparams_dict, creator,
+                                  cr_workdir, oe_builddir, bootimg_dir,
+                                  kernel_dir, native_sysroot)
+        plugin.do_prepare_partition(self, srcparams_dict, creator,
+                                    cr_workdir, oe_builddir, bootimg_dir,
+                                    kernel_dir, rootfs_dir, native_sysroot)
 
         # further processing required Partition.size to be an integer, make
         # sure that it is one
diff --git a/scripts/lib/wic/plugin.py b/scripts/lib/wic/plugin.py
index b45478c..36a120b 100644
--- a/scripts/lib/wic/plugin.py
+++ b/scripts/lib/wic/plugin.py
@@ -62,20 +62,3 @@ class PluginMgr:
                 cls._loaded.append(ppath)
 
         return pluginbase.get_plugins(ptype)
-
-    @classmethod
-    def get_plugin_methods(cls, ptype, pname, methods):
-        """
-        The methods param is a dict with the method names to find.  On
-        return, the dict values will be filled in with pointers to the
-        corresponding methods.  If one or more methods are not found,
-        None is returned.
-        """
-        result = {}
-        plugin = cls.get_plugins(ptype).get(pname)
-        for method in methods:
-            if not hasattr(plugin, method):
-                raise WicError("Unimplemented %s plugin interface for: %s" %
-                               (method, pname))
-            result[method] = getattr(plugin, method)
-        return result
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 4ab1955..7221648 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -197,12 +197,10 @@ class DirectPlugin(ImagerPlugin):
         source_plugin = self.ks.bootloader.source
         disk_name = self.parts[0].disk
         if source_plugin:
-            name = "do_install_disk"
-            method = PluginMgr.get_plugin_methods('source', source_plugin,
-                                                   [name])[name]
-            method(self._image, disk_name, self, self.workdir,
-                   self.oe_builddir, self.bootimg_dir,
-                   self.kernel_dir, self.native_sysroot)
+            plugin = PluginMgr.get_plugins('source')[source_plugin]
+            plugin.do_install_disk(self._image, disk_name, self, self.workdir,
+                                   self.oe_builddir, self.bootimg_dir,
+                                   self.kernel_dir, self.native_sysroot)
 
         full_path = self._image.path
         # Generate .bmap
-- 
2.1.4



Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1BD05772B4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 15:56:34 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga105.fm.intel.com with ESMTP; 16 Feb 2017 07:56:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,169,1484035200"; d="scan'208";a="66591309"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 16 Feb 2017 07:56:35 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 714B06A4082
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 07:56:34 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Feb 2017 17:33:30 +0200
Message-Id: <20506e77d31a03a93c563ea1d373a18b97c55e1b.1487257345.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1487257345.git.ed.bartosh@linux.intel.com>
References: <cover.1487257345.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 03/10] wic: reimplement PluginMgr.get_plugin_methods
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
X-List-Received-Date: Thu, 16 Feb 2017 15:56:35 -0000

Simplified the implementation of get_plugin_methods:
- get rid of looping over the dicrtionary, used access by key instead
- get rid of filling a dictionary that passed as a parameter

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/help.py                  |  2 +-
 scripts/lib/wic/partition.py             | 13 +++++--------
 scripts/lib/wic/plugin.py                | 22 +++++++++-------------
 scripts/lib/wic/plugins/imager/direct.py | 10 +++++-----
 4 files changed, 20 insertions(+), 27 deletions(-)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 4aba12d..196896c 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -374,7 +374,7 @@ DESCRIPTION
     This scheme is extensible - adding more hooks is a simple matter
     of adding more plugin methods to SourcePlugin and derived classes.
     The code that then needs to call the plugin methods uses
-    plugin.get_source_plugin_methods() to find the method(s) needed by
+    plugin.get_plugin_methods() to find the method(s) needed by
     the call; this is done by filling up a dict with keys containing
     the method names of interest - on success, these will be filled in
     with the actual methods. Please see the implementation for
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index d3cd593..1f384be 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -170,14 +170,11 @@ class Partition():
             splitted = self.sourceparams.split(',')
             srcparams_dict = dict(par.split('=') for par in splitted if par)
 
-        partition_methods = {
-            "do_stage_partition": None,
-            "do_prepare_partition": None,
-            "do_configure_partition": None
-        }
-
-        methods = PluginMgr.get_source_plugin_methods(self.source,
-                                                      partition_methods)
+        partition_methods = ["do_configure_partition", "do_stage_partition",
+                             "do_prepare_partition"]
+
+        methods = PluginMgr.get_plugin_methods('source', self.source,
+                                               partition_methods)
         methods["do_configure_partition"](self, srcparams_dict, creator,
                                           cr_workdir, oe_builddir, bootimg_dir,
                                           kernel_dir, native_sysroot)
diff --git a/scripts/lib/wic/plugin.py b/scripts/lib/wic/plugin.py
index 064243d..c200822 100644
--- a/scripts/lib/wic/plugin.py
+++ b/scripts/lib/wic/plugin.py
@@ -109,22 +109,18 @@ class PluginMgr:
         return pluginbase.get_plugins(ptype)
 
     @classmethod
-    def get_source_plugin_methods(cls, source_name, methods):
+    def get_plugin_methods(cls, ptype, pname, methods):
         """
         The methods param is a dict with the method names to find.  On
         return, the dict values will be filled in with pointers to the
         corresponding methods.  If one or more methods are not found,
         None is returned.
         """
-        return_methods = None
-        for _source_name, klass in cls.get_plugins('source').items():
-            if _source_name == source_name:
-                for _method_name in methods:
-                    if not hasattr(klass, _method_name):
-                        logger.warning("Unimplemented %s source interface for: %s",
-                                       _method_name, _source_name)
-                        return None
-                    func = getattr(klass, _method_name)
-                    methods[_method_name] = func
-                    return_methods = methods
-        return return_methods
+        result = {}
+        plugin = cls.get_plugins(ptype).get(pname)
+        for method in methods:
+            if not hasattr(plugin, method):
+                raise WicError("Unimplemented %s plugin interface for: %s" %
+                               (method, pname))
+            result[method] = getattr(plugin, method)
+        return result
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index b93273e..4ab1955 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -198,11 +198,11 @@ class DirectPlugin(ImagerPlugin):
         disk_name = self.parts[0].disk
         if source_plugin:
             name = "do_install_disk"
-            methods = PluginMgr.get_source_plugin_methods(source_plugin,
-                                                          {name: None})
-            methods["do_install_disk"](self._image, disk_name, self, self.workdir,
-                                       self.oe_builddir, self.bootimg_dir,
-                                       self.kernel_dir, self.native_sysroot)
+            method = PluginMgr.get_plugin_methods('source', source_plugin,
+                                                   [name])[name]
+            method(self._image, disk_name, self, self.workdir,
+                   self.oe_builddir, self.bootimg_dir,
+                   self.kernel_dir, self.native_sysroot)
 
         full_path = self._image.path
         # Generate .bmap
-- 
2.1.4



Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id C439B6010D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 15:56:24 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 16 Feb 2017 07:56:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,169,1484035200"; d="scan'208";a="46219666"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 16 Feb 2017 07:56:24 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 309816A4080
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 07:56:23 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Feb 2017 17:33:28 +0200
Message-Id: <60c10b3ade82ecdf0bb07fdbd563589f0efd6c33.1487257345.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1487257345.git.ed.bartosh@linux.intel.com>
References: <cover.1487257345.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 01/10] wic: use PluginMgr directly
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
X-List-Received-Date: Thu, 16 Feb 2017 15:56:24 -0000

Instead of making a singleton object of PluginMgr class
it's simpler to use PluginMgr class directly as any class
is a singleton.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/engine.py                |  6 +--
 scripts/lib/wic/help.py                  |  4 +-
 scripts/lib/wic/partition.py             |  6 +--
 scripts/lib/wic/plugin.py                | 83 ++++++++++++++------------------
 scripts/lib/wic/plugins/imager/direct.py |  4 +-
 5 files changed, 47 insertions(+), 56 deletions(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index c29924b..98e7b95 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -32,7 +32,7 @@ import logging
 import os
 
 from wic import WicError
-from wic.plugin import pluginmgr
+from wic.plugin import PluginMgr
 from wic.utils.misc import get_bitbake_var
 
 logger = logging.getLogger('wic')
@@ -139,7 +139,7 @@ def list_source_plugins():
     """
     List the available source plugins i.e. plugins available for --source.
     """
-    plugins = pluginmgr.get_source_plugins()
+    plugins = PluginMgr.get_source_plugins()
 
     for plugin in plugins:
         print("  %s" % plugin)
@@ -185,7 +185,7 @@ def wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
         os.makedirs(options.outdir)
 
     pname = 'direct'
-    plugin_class = pluginmgr.get_plugins('imager').get(pname)
+    plugin_class = PluginMgr.get_plugins('imager').get(pname)
     if not plugin_class:
         raise WicError('Unknown plugin: %s' % pname)
 
diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 47e3d16..4aba12d 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -28,7 +28,7 @@
 import subprocess
 import logging
 
-from wic.plugin import pluginmgr, PLUGIN_TYPES
+from wic.plugin import PluginMgr, PLUGIN_TYPES
 
 logger = logging.getLogger('wic')
 
@@ -68,7 +68,7 @@ def get_wic_plugins_help():
     result = wic_plugins_help
     for plugin_type in PLUGIN_TYPES:
         result += '\n\n%s PLUGINS\n\n' % plugin_type.upper()
-        for name, plugin in pluginmgr.get_plugins(plugin_type).items():
+        for name, plugin in PluginMgr.get_plugins(plugin_type).items():
             result += "\n %s plugin:\n" % name
             if plugin.__doc__:
                 result += plugin.__doc__
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 8e531e4..f8d4274 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -30,7 +30,7 @@ import tempfile
 
 from wic import WicError
 from wic.utils.misc import exec_cmd, exec_native_cmd, get_bitbake_var
-from wic.plugin import pluginmgr
+from wic.plugin import PluginMgr
 
 logger = logging.getLogger('wic')
 
@@ -154,7 +154,7 @@ class Partition():
                         break
             return
 
-        plugins = pluginmgr.get_source_plugins()
+        plugins = PluginMgr.get_source_plugins()
 
         if self.source not in plugins:
             raise WicError("The '%s' --source specified for %s doesn't exist.\n\t"
@@ -176,7 +176,7 @@ class Partition():
             "do_configure_partition": None
         }
 
-        methods = pluginmgr.get_source_plugin_methods(self.source,
+        methods = PluginMgr.get_source_plugin_methods(self.source,
                                                       partition_methods)
         methods["do_configure_partition"](self, srcparams_dict, creator,
                                           cr_workdir, oe_builddir, bootimg_dir,
diff --git a/scripts/lib/wic/plugin.py b/scripts/lib/wic/plugin.py
index ac55ecf..7632c3a 100644
--- a/scripts/lib/wic/plugin.py
+++ b/scripts/lib/wic/plugin.py
@@ -22,8 +22,6 @@ import logging
 from wic import pluginbase, WicError
 from wic.utils.misc import get_bitbake_var
 
-__ALL__ = ['PluginMgr', 'pluginmgr']
-
 PLUGIN_TYPES = ["imager", "source"]
 
 PLUGIN_DIR = "/lib/wic/plugins" # relative to scripts
@@ -31,32 +29,22 @@ SCRIPTS_PLUGIN_DIR = "scripts" + PLUGIN_DIR
 
 logger = logging.getLogger('wic')
 
-class PluginMgr():
+class PluginMgr:
     plugin_dirs = {}
-
-    # make the manager class as singleton
-    _instance = None
-    def __new__(cls, *args, **kwargs):
-        if not cls._instance:
-            cls._instance = super(PluginMgr, cls).__new__(cls, *args, **kwargs)
-
-        return cls._instance
-
-    def __init__(self):
-        wic_path = os.path.dirname(__file__)
-        eos = wic_path.rfind('scripts') + len('scripts')
-        scripts_path = wic_path[:eos]
-        self.scripts_path = scripts_path
-        self.plugin_dir = scripts_path + PLUGIN_DIR
-        self.layers_path = None
-
-    def _build_plugin_dir_list(self, plugin_dir, ptype):
-        if self.layers_path is None:
-            self.layers_path = get_bitbake_var("BBLAYERS")
+    wic_path = os.path.dirname(__file__)
+    eos = wic_path.rfind('scripts') + len('scripts')
+    scripts_path = wic_path[:eos]
+    plugin_dir = scripts_path + PLUGIN_DIR
+    layers_path = None
+
+    @classmethod
+    def _build_plugin_dir_list(cls, plugin_dir, ptype):
+        if cls.layers_path is None:
+            cls.layers_path = get_bitbake_var("BBLAYERS")
         layer_dirs = []
 
-        if self.layers_path is not None:
-            for layer_path in self.layers_path.split():
+        if cls.layers_path is not None:
+            for layer_path in cls.layers_path.split():
                 path = os.path.join(layer_path, SCRIPTS_PLUGIN_DIR, ptype)
                 layer_dirs.append(path)
 
@@ -65,25 +53,28 @@ class PluginMgr():
 
         return layer_dirs
 
-    def append_dirs(self, dirs):
+    @classmethod
+    def append_dirs(cls, dirs):
         for path in dirs:
-            self._add_plugindir(path)
+            cls._add_plugindir(path)
 
         # load all the plugins AGAIN
-        self._load_all()
+        cls._load_all()
 
-    def _add_plugindir(self, path):
+    @classmethod
+    def _add_plugindir(cls, path):
         path = os.path.abspath(os.path.expanduser(path))
 
         if not os.path.isdir(path):
             return
 
-        if path not in self.plugin_dirs:
-            self.plugin_dirs[path] = False
+        if path not in cls.plugin_dirs:
+            cls.plugin_dirs[path] = False
             # the value True/False means "loaded"
 
-    def _load_all(self):
-        for (pdir, loaded) in self.plugin_dirs.items():
+    @classmethod
+    def _load_all(cls):
+        for (pdir, loaded) in cls.plugin_dirs.items():
             if loaded:
                 continue
 
@@ -91,12 +82,11 @@ class PluginMgr():
             for mod in [x[:-3] for x in os.listdir(pdir) if x.endswith(".py")]:
                 if mod and mod != '__init__':
                     if mod in sys.modules:
-                        #self.plugin_dirs[pdir] = True
                         logger.warning("Module %s already exists, skip", mod)
                     else:
                         try:
                             pymod = __import__(mod)
-                            self.plugin_dirs[pdir] = True
+                            cls.plugin_dirs[pdir] = True
                             logger.debug("Plugin module %s:%s imported",
                                          mod, pymod.__file__)
                         except ImportError as err:
@@ -105,30 +95,33 @@ class PluginMgr():
 
             del sys.path[0]
 
-    def get_plugins(self, ptype):
+    @classmethod
+    def get_plugins(cls, ptype):
         """ the return value is dict of name:class pairs """
 
         if ptype not in PLUGIN_TYPES:
             raise WicError('%s is not valid plugin type' % ptype)
 
-        plugins_dir = self._build_plugin_dir_list(self.plugin_dir, ptype)
+        plugins_dir = cls._build_plugin_dir_list(cls.plugin_dir, ptype)
 
-        self.append_dirs(plugins_dir)
+        cls.append_dirs(plugins_dir)
 
         return pluginbase.get_plugins(ptype)
 
-    def get_source_plugins(self):
+    @classmethod
+    def get_source_plugins(cls):
         """
         Return list of available source plugins.
         """
-        plugins_dir = self._build_plugin_dir_list(self.plugin_dir, 'source')
+        plugins_dir = cls._build_plugin_dir_list(cls.plugin_dir, 'source')
 
-        self.append_dirs(plugins_dir)
+        cls.append_dirs(plugins_dir)
 
-        return self.get_plugins('source')
+        return cls.get_plugins('source')
 
 
-    def get_source_plugin_methods(self, source_name, methods):
+    @classmethod
+    def get_source_plugin_methods(cls, source_name, methods):
         """
         The methods param is a dict with the method names to find.  On
         return, the dict values will be filled in with pointers to the
@@ -136,7 +129,7 @@ class PluginMgr():
         None is returned.
         """
         return_methods = None
-        for _source_name, klass in self.get_plugins('source').items():
+        for _source_name, klass in cls.get_plugins('source').items():
             if _source_name == source_name:
                 for _method_name in methods:
                     if not hasattr(klass, _method_name):
@@ -147,5 +140,3 @@ class PluginMgr():
                     methods[_method_name] = func
                     return_methods = methods
         return return_methods
-
-pluginmgr = PluginMgr()
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 6d1ed8c..b93273e 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -35,7 +35,7 @@ from time import strftime
 from wic import WicError
 from wic.filemap import sparse_copy
 from wic.ksparser import KickStart, KickStartError
-from wic.plugin import pluginmgr
+from wic.plugin import PluginMgr
 from wic.pluginbase import ImagerPlugin
 from wic.utils.misc import get_bitbake_var, exec_cmd, exec_native_cmd
 
@@ -198,7 +198,7 @@ class DirectPlugin(ImagerPlugin):
         disk_name = self.parts[0].disk
         if source_plugin:
             name = "do_install_disk"
-            methods = pluginmgr.get_source_plugin_methods(source_plugin,
+            methods = PluginMgr.get_source_plugin_methods(source_plugin,
                                                           {name: None})
             methods["do_install_disk"](self._image, disk_name, self, self.workdir,
                                        self.oe_builddir, self.bootimg_dir,
-- 
2.1.4



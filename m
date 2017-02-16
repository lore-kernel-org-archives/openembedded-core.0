Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id DF287772CF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 15:56:36 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Feb 2017 07:56:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,169,1484035200"; d="scan'208";a="226111327"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 16 Feb 2017 07:56:36 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 91AAF6A4082
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 07:56:35 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Feb 2017 17:33:31 +0200
Message-Id: <efdef4df27cdcf7b4db1bd05b6b966093d41f34e.1487257345.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1487257345.git.ed.bartosh@linux.intel.com>
References: <cover.1487257345.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 04/10] wic: reimplement PluginMgr.get_plugins
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
X-List-Received-Date: Thu, 16 Feb 2017 15:56:37 -0000

Removed all private methods and complicated logic.
Put all code to get plugins into get_plugins method.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugin.py | 99 +++++++++++++----------------------------------
 1 file changed, 27 insertions(+), 72 deletions(-)

diff --git a/scripts/lib/wic/plugin.py b/scripts/lib/wic/plugin.py
index c200822..b45478c 100644
--- a/scripts/lib/wic/plugin.py
+++ b/scripts/lib/wic/plugin.py
@@ -16,95 +16,50 @@
 # Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 
 import os
-import sys
 import logging
 
+from importlib.machinery import SourceFileLoader
+
 from wic import pluginbase, WicError
 from wic.utils.misc import get_bitbake_var
 
 PLUGIN_TYPES = ["imager", "source"]
 
-PLUGIN_DIR = "/lib/wic/plugins" # relative to scripts
-SCRIPTS_PLUGIN_DIR = "scripts" + PLUGIN_DIR
+SCRIPTS_PLUGIN_DIR = "scripts/lib/wic/plugins"
 
 logger = logging.getLogger('wic')
 
 class PluginMgr:
-    plugin_dirs = {}
-    wic_path = os.path.dirname(__file__)
-    eos = wic_path.rfind('scripts') + len('scripts')
-    scripts_path = wic_path[:eos]
-    plugin_dir = scripts_path + PLUGIN_DIR
-    layers_path = None
-
-    @classmethod
-    def _build_plugin_dir_list(cls, plugin_dir, ptype):
-        if cls.layers_path is None:
-            cls.layers_path = get_bitbake_var("BBLAYERS")
-        layer_dirs = []
-
-        if cls.layers_path is not None:
-            for layer_path in cls.layers_path.split():
-                path = os.path.join(layer_path, SCRIPTS_PLUGIN_DIR, ptype)
-                layer_dirs.append(path)
-
-        path = os.path.join(plugin_dir, ptype)
-        layer_dirs.append(path)
-
-        return layer_dirs
-
-    @classmethod
-    def append_dirs(cls, dirs):
-        for path in dirs:
-            cls._add_plugindir(path)
-
-        # load all the plugins AGAIN
-        cls._load_all()
-
-    @classmethod
-    def _add_plugindir(cls, path):
-        path = os.path.abspath(os.path.expanduser(path))
-
-        if not os.path.isdir(path):
-            return
-
-        if path not in cls.plugin_dirs:
-            cls.plugin_dirs[path] = False
-            # the value True/False means "loaded"
-
-    @classmethod
-    def _load_all(cls):
-        for (pdir, loaded) in cls.plugin_dirs.items():
-            if loaded:
-                continue
-
-            sys.path.insert(0, pdir)
-            for mod in [x[:-3] for x in os.listdir(pdir) if x.endswith(".py")]:
-                if mod and mod != '__init__':
-                    if mod in sys.modules:
-                        logger.warning("Module %s already exists, skip", mod)
-                    else:
-                        try:
-                            pymod = __import__(mod)
-                            cls.plugin_dirs[pdir] = True
-                            logger.debug("Plugin module %s:%s imported",
-                                         mod, pymod.__file__)
-                        except ImportError as err:
-                            logger.warning('Failed to load plugin %s/%s: %s',
-                                           os.path.basename(pdir), mod, err)
-
-            del sys.path[0]
+    _plugin_dirs = []
+    _loaded = []
 
     @classmethod
     def get_plugins(cls, ptype):
-        """ the return value is dict of name:class pairs """
-
+        """Get dictionary of <plugin_name>:<class> pairs."""
         if ptype not in PLUGIN_TYPES:
             raise WicError('%s is not valid plugin type' % ptype)
 
-        plugins_dir = cls._build_plugin_dir_list(cls.plugin_dir, ptype)
-
-        cls.append_dirs(plugins_dir)
+        # collect plugin directories
+        if not cls._plugin_dirs:
+            cls._plugin_dirs = [os.path.join(os.path.dirname(__file__), 'plugins')]
+            layers = get_bitbake_var("BBLAYERS") or ''
+            for layer_path in layers.split():
+                path = os.path.join(layer_path, SCRIPTS_PLUGIN_DIR)
+                path = os.path.abspath(os.path.expanduser(path))
+                if path not in cls._plugin_dirs and os.path.isdir(path):
+                    cls._plugin_dirs.insert(0, path)
+
+        # load plugins
+        for pdir in cls._plugin_dirs:
+            ppath = os.path.join(pdir, ptype)
+            if ppath not in cls._loaded:
+                if os.path.isdir(ppath):
+                    for fname in os.listdir(ppath):
+                        if fname.endswith('.py'):
+                            mname = fname[:-3]
+                            mpath = os.path.join(ppath, fname)
+                            SourceFileLoader(mname, mpath).load_module()
+                cls._loaded.append(ppath)
 
         return pluginbase.get_plugins(ptype)
 
-- 
2.1.4



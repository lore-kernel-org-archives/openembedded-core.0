Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3746177302
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 15:56:59 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Feb 2017 07:56:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,169,1484035200"; d="scan'208";a="1128389991"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 16 Feb 2017 07:56:41 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 249BE6A4082
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 07:56:40 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Feb 2017 17:33:36 +0200
Message-Id: <09ccdb35eaa05497338976dd15ebf681a5b41f52.1487257345.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1487257345.git.ed.bartosh@linux.intel.com>
References: <cover.1487257345.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 09/10] wic: move PluginMgr class to pluginbase
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
X-List-Received-Date: Thu, 16 Feb 2017 15:56:59 -0000

As PluginMgr class contains only one method it's
better to move it to pluginbase to have all plugin
related APIs in one module.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/engine.py                |  2 +-
 scripts/lib/wic/help.py                  |  2 +-
 scripts/lib/wic/partition.py             |  2 +-
 scripts/lib/wic/plugin.py                | 66 --------------------------------
 scripts/lib/wic/pluginbase.py            | 47 +++++++++++++++++++++--
 scripts/lib/wic/plugins/imager/direct.py |  3 +-
 6 files changed, 48 insertions(+), 74 deletions(-)
 delete mode 100644 scripts/lib/wic/plugin.py

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 4d0901d..f59821f 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -32,7 +32,7 @@ import logging
 import os
 
 from wic import WicError
-from wic.plugin import PluginMgr
+from wic.pluginbase import PluginMgr
 from wic.utils.misc import get_bitbake_var
 
 logger = logging.getLogger('wic')
diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index c08ad34..148da89 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -28,7 +28,7 @@
 import subprocess
 import logging
 
-from wic.plugin import PluginMgr, PLUGIN_TYPES
+from wic.pluginbase import PluginMgr, PLUGIN_TYPES
 
 logger = logging.getLogger('wic')
 
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index adf44b7..6ef8d7f 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -30,7 +30,7 @@ import tempfile
 
 from wic import WicError
 from wic.utils.misc import exec_cmd, exec_native_cmd, get_bitbake_var
-from wic.plugin import PluginMgr
+from wic.pluginbase import PluginMgr
 
 logger = logging.getLogger('wic')
 
diff --git a/scripts/lib/wic/plugin.py b/scripts/lib/wic/plugin.py
deleted file mode 100644
index 094a878..0000000
--- a/scripts/lib/wic/plugin.py
+++ /dev/null
@@ -1,66 +0,0 @@
-#!/usr/bin/env python -tt
-#
-# Copyright (c) 2011 Intel, Inc.
-#
-# This program is free software; you can redistribute it and/or modify it
-# under the terms of the GNU General Public License as published by the Free
-# Software Foundation; version 2 of the License
-#
-# This program is distributed in the hope that it will be useful, but
-# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-# or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
-# for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc., 59
-# Temple Place - Suite 330, Boston, MA 02111-1307, USA.
-
-import os
-import logging
-
-from importlib.machinery import SourceFileLoader
-
-from wic import pluginbase, WicError
-from wic.utils.misc import get_bitbake_var
-
-PLUGIN_TYPES = ["imager", "source"]
-
-SCRIPTS_PLUGIN_DIR = "scripts/lib/wic/plugins"
-
-logger = logging.getLogger('wic')
-
-class PluginMgr:
-    _plugin_dirs = []
-    _plugins = {}
-
-    @classmethod
-    def get_plugins(cls, ptype):
-        """Get dictionary of <plugin_name>:<class> pairs."""
-        if ptype not in PLUGIN_TYPES:
-            raise WicError('%s is not valid plugin type' % ptype)
-
-        if ptype in cls._plugins:
-            return cls._plugins[ptype]
-
-        # collect plugin directories
-        if not cls._plugin_dirs:
-            cls._plugin_dirs = [os.path.join(os.path.dirname(__file__), 'plugins')]
-            layers = get_bitbake_var("BBLAYERS") or ''
-            for layer_path in layers.split():
-                path = os.path.join(layer_path, SCRIPTS_PLUGIN_DIR)
-                path = os.path.abspath(os.path.expanduser(path))
-                if path not in cls._plugin_dirs and os.path.isdir(path):
-                    cls._plugin_dirs.insert(0, path)
-
-        # load plugins
-        for pdir in cls._plugin_dirs:
-            ppath = os.path.join(pdir, ptype)
-            if os.path.isdir(ppath):
-                for fname in os.listdir(ppath):
-                    if fname.endswith('.py'):
-                        mname = fname[:-3]
-                        mpath = os.path.join(ppath, fname)
-                        SourceFileLoader(mname, mpath).load_module()
-
-        cls._plugins[ptype] = pluginbase.get_plugins(ptype)
-        return cls._plugins[ptype]
diff --git a/scripts/lib/wic/pluginbase.py b/scripts/lib/wic/pluginbase.py
index 743170a..93f0b66 100644
--- a/scripts/lib/wic/pluginbase.py
+++ b/scripts/lib/wic/pluginbase.py
@@ -15,16 +15,59 @@
 # with this program; if not, write to the Free Software Foundation, Inc., 59
 # Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 
-__all__ = ['ImagerPlugin', 'SourcePlugin', 'get_plugins']
+__all__ = ['ImagerPlugin', 'SourcePlugin']
 
+import os
 import logging
 
 from collections import defaultdict
+from importlib.machinery import SourceFileLoader
 
 from wic import WicError
+from wic.utils.misc import get_bitbake_var
+
+PLUGIN_TYPES = ["imager", "source"]
+
+SCRIPTS_PLUGIN_DIR = "scripts/lib/wic/plugins"
 
 logger = logging.getLogger('wic')
 
+class PluginMgr:
+    _plugin_dirs = []
+    _plugins = {}
+
+    @classmethod
+    def get_plugins(cls, ptype):
+        """Get dictionary of <plugin_name>:<class> pairs."""
+        if ptype not in PLUGIN_TYPES:
+            raise WicError('%s is not valid plugin type' % ptype)
+
+        if ptype in cls._plugins:
+            return cls._plugins[ptype]
+
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
+            if os.path.isdir(ppath):
+                for fname in os.listdir(ppath):
+                    if fname.endswith('.py'):
+                        mname = fname[:-3]
+                        mpath = os.path.join(ppath, fname)
+                        SourceFileLoader(mname, mpath).load_module()
+
+        cls._plugins[ptype] = PluginMeta.plugins.get(ptype)
+        return cls._plugins[ptype]
+
 class PluginMeta(type):
     plugins = defaultdict(dict)
     def __new__(cls, name, bases, attrs):
@@ -97,5 +140,3 @@ class SourcePlugin(metaclass=PluginMeta):
         """
         logger.debug("SourcePlugin: do_prepare_partition: part: %s", part)
 
-def get_plugins(typen):
-    return PluginMeta.plugins.get(typen)
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 7221648..b7e324a 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -35,8 +35,7 @@ from time import strftime
 from wic import WicError
 from wic.filemap import sparse_copy
 from wic.ksparser import KickStart, KickStartError
-from wic.plugin import PluginMgr
-from wic.pluginbase import ImagerPlugin
+from wic.pluginbase import PluginMgr, ImagerPlugin
 from wic.utils.misc import get_bitbake_var, exec_cmd, exec_native_cmd
 
 logger = logging.getLogger('wic')
-- 
2.1.4



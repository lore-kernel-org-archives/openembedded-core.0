Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id DAA1877305
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 15:56:42 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 16 Feb 2017 07:56:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,169,1484035200"; d="scan'208";a="65991907"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 16 Feb 2017 07:56:43 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 464C86A4080
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 07:56:42 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Feb 2017 17:33:37 +0200
Message-Id: <682180f34e3c6ce54e02c64bf585465f5a64c253.1487257345.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1487257345.git.ed.bartosh@linux.intel.com>
References: <cover.1487257345.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 10/10] wic: pluginbase: use global dictionary
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
X-List-Received-Date: Thu, 16 Feb 2017 15:56:43 -0000

Made PluginMeta to populate global PLUGINS dictionary that
is accessed by PluginMgr. This should make the code more
understandable as PluginMgr don't need to get data directly
from PlugnMeta attribute.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/pluginbase.py | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/scripts/lib/wic/pluginbase.py b/scripts/lib/wic/pluginbase.py
index 93f0b66..fb3d179 100644
--- a/scripts/lib/wic/pluginbase.py
+++ b/scripts/lib/wic/pluginbase.py
@@ -32,9 +32,10 @@ SCRIPTS_PLUGIN_DIR = "scripts/lib/wic/plugins"
 
 logger = logging.getLogger('wic')
 
+PLUGINS = defaultdict(dict)
+
 class PluginMgr:
     _plugin_dirs = []
-    _plugins = {}
 
     @classmethod
     def get_plugins(cls, ptype):
@@ -42,9 +43,6 @@ class PluginMgr:
         if ptype not in PLUGIN_TYPES:
             raise WicError('%s is not valid plugin type' % ptype)
 
-        if ptype in cls._plugins:
-            return cls._plugins[ptype]
-
         # collect plugin directories
         if not cls._plugin_dirs:
             cls._plugin_dirs = [os.path.join(os.path.dirname(__file__), 'plugins')]
@@ -55,25 +53,25 @@ class PluginMgr:
                 if path not in cls._plugin_dirs and os.path.isdir(path):
                     cls._plugin_dirs.insert(0, path)
 
-        # load plugins
-        for pdir in cls._plugin_dirs:
-            ppath = os.path.join(pdir, ptype)
-            if os.path.isdir(ppath):
-                for fname in os.listdir(ppath):
-                    if fname.endswith('.py'):
-                        mname = fname[:-3]
-                        mpath = os.path.join(ppath, fname)
-                        SourceFileLoader(mname, mpath).load_module()
+        if ptype not in PLUGINS:
+            # load all ptype plugins
+            for pdir in cls._plugin_dirs:
+                ppath = os.path.join(pdir, ptype)
+                if os.path.isdir(ppath):
+                    for fname in os.listdir(ppath):
+                        if fname.endswith('.py'):
+                            mname = fname[:-3]
+                            mpath = os.path.join(ppath, fname)
+                            logger.debug("loading plugin module %s", mpath)
+                            SourceFileLoader(mname, mpath).load_module()
 
-        cls._plugins[ptype] = PluginMeta.plugins.get(ptype)
-        return cls._plugins[ptype]
+        return PLUGINS.get(ptype)
 
 class PluginMeta(type):
-    plugins = defaultdict(dict)
     def __new__(cls, name, bases, attrs):
         class_type = type.__new__(cls, name, bases, attrs)
         if 'name' in attrs:
-            cls.plugins[class_type.wic_plugin_type][attrs['name']] = class_type
+            PLUGINS[class_type.wic_plugin_type][attrs['name']] = class_type
 
         return class_type
 
-- 
2.1.4



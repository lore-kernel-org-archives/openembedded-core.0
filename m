Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2BF1777301
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 15:56:40 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Feb 2017 07:56:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,169,1484035200"; d="scan'208";a="65501365"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 16 Feb 2017 07:56:40 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 0E1126A4080
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 07:56:39 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Feb 2017 17:33:35 +0200
Message-Id: <80f761961e590fdd63931546567d042f38b4b869.1487257345.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1487257345.git.ed.bartosh@linux.intel.com>
References: <cover.1487257345.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 08/10] wic: plugin: cache results in get_plugins
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
X-List-Received-Date: Thu, 16 Feb 2017 15:56:40 -0000

Store results of PluginMgr.get_plugins to avoid
loading plugins more than once.

This should speed up finding plugins.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugin.py | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/scripts/lib/wic/plugin.py b/scripts/lib/wic/plugin.py
index 36a120b..094a878 100644
--- a/scripts/lib/wic/plugin.py
+++ b/scripts/lib/wic/plugin.py
@@ -31,7 +31,7 @@ logger = logging.getLogger('wic')
 
 class PluginMgr:
     _plugin_dirs = []
-    _loaded = []
+    _plugins = {}
 
     @classmethod
     def get_plugins(cls, ptype):
@@ -39,6 +39,9 @@ class PluginMgr:
         if ptype not in PLUGIN_TYPES:
             raise WicError('%s is not valid plugin type' % ptype)
 
+        if ptype in cls._plugins:
+            return cls._plugins[ptype]
+
         # collect plugin directories
         if not cls._plugin_dirs:
             cls._plugin_dirs = [os.path.join(os.path.dirname(__file__), 'plugins')]
@@ -52,13 +55,12 @@ class PluginMgr:
         # load plugins
         for pdir in cls._plugin_dirs:
             ppath = os.path.join(pdir, ptype)
-            if ppath not in cls._loaded:
-                if os.path.isdir(ppath):
-                    for fname in os.listdir(ppath):
-                        if fname.endswith('.py'):
-                            mname = fname[:-3]
-                            mpath = os.path.join(ppath, fname)
-                            SourceFileLoader(mname, mpath).load_module()
-                cls._loaded.append(ppath)
+            if os.path.isdir(ppath):
+                for fname in os.listdir(ppath):
+                    if fname.endswith('.py'):
+                        mname = fname[:-3]
+                        mpath = os.path.join(ppath, fname)
+                        SourceFileLoader(mname, mpath).load_module()
 
-        return pluginbase.get_plugins(ptype)
+        cls._plugins[ptype] = pluginbase.get_plugins(ptype)
+        return cls._plugins[ptype]
-- 
2.1.4



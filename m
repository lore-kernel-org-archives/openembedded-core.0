Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 993387723C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 15:56:57 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Feb 2017 07:56:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,169,1484035200"; d="scan'208";a="822551386"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 16 Feb 2017 07:56:34 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 5A5D76A4080
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 07:56:33 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Feb 2017 17:33:29 +0200
Message-Id: <b996950e3d4ce951485133d527f576991b514f6f.1487257345.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1487257345.git.ed.bartosh@linux.intel.com>
References: <cover.1487257345.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 02/10] wic: remove PluginMgr.get_source_plugins
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
X-List-Received-Date: Thu, 16 Feb 2017 15:56:57 -0000

Used get_plugins('source') instead of get_source_plugins to
unify and simplify API to get plugins.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/engine.py    |  2 +-
 scripts/lib/wic/partition.py |  2 +-
 scripts/lib/wic/plugin.py    | 12 ------------
 3 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 98e7b95..4d0901d 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -139,7 +139,7 @@ def list_source_plugins():
     """
     List the available source plugins i.e. plugins available for --source.
     """
-    plugins = PluginMgr.get_source_plugins()
+    plugins = PluginMgr.get_plugins('source')
 
     for plugin in plugins:
         print("  %s" % plugin)
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index f8d4274..d3cd593 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -154,7 +154,7 @@ class Partition():
                         break
             return
 
-        plugins = PluginMgr.get_source_plugins()
+        plugins = PluginMgr.get_plugins('source')
 
         if self.source not in plugins:
             raise WicError("The '%s' --source specified for %s doesn't exist.\n\t"
diff --git a/scripts/lib/wic/plugin.py b/scripts/lib/wic/plugin.py
index 7632c3a..064243d 100644
--- a/scripts/lib/wic/plugin.py
+++ b/scripts/lib/wic/plugin.py
@@ -109,18 +109,6 @@ class PluginMgr:
         return pluginbase.get_plugins(ptype)
 
     @classmethod
-    def get_source_plugins(cls):
-        """
-        Return list of available source plugins.
-        """
-        plugins_dir = cls._build_plugin_dir_list(cls.plugin_dir, 'source')
-
-        cls.append_dirs(plugins_dir)
-
-        return cls.get_plugins('source')
-
-
-    @classmethod
     def get_source_plugin_methods(cls, source_name, methods):
         """
         The methods param is a dict with the method names to find.  On
-- 
2.1.4



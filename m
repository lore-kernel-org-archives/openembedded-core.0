Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B323C70149
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 15:27:04 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 May 2016 08:26:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,577,1455004800"; d="scan'208";a="946151724"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 04 May 2016 08:26:56 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 149A66A4007
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 09:14:30 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 May 2016 16:06:15 +0300
Message-Id: <f64f9ffc58148f6cbba9757450f056d4bd879159.1462365339.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1462365339.git.ed.bartosh@linux.intel.com>
References: <cover.1462365339.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1462365339.git.ed.bartosh@linux.intel.com>
References: <cover.1462365339.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 02/14] wic: use items instead of iteritems
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
X-List-Received-Date: Wed, 04 May 2016 15:27:04 -0000

Dictionary method 'iteritems' doesn't exist in Python 3.
Replaced 'iteritems' with 'items' to be able to run the
code under both Python 3 and Python 2.

[YOCTO #9412]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/conf.py    | 2 +-
 scripts/lib/wic/creator.py | 2 +-
 scripts/lib/wic/help.py    | 2 +-
 scripts/lib/wic/plugin.py  | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/wic/conf.py b/scripts/lib/wic/conf.py
index f7d56d0..070ec30 100644
--- a/scripts/lib/wic/conf.py
+++ b/scripts/lib/wic/conf.py
@@ -70,7 +70,7 @@ class ConfigMgr(object):
         self.create = {}
 
         # initialize the values with defaults
-        for sec, vals in self.DEFAULTS.iteritems():
+        for sec, vals in self.DEFAULTS.items():
             setattr(self, sec, vals)
 
     def __set_ksconf(self, ksconf):
diff --git a/scripts/lib/wic/creator.py b/scripts/lib/wic/creator.py
index 5231297..d0158fb 100644
--- a/scripts/lib/wic/creator.py
+++ b/scripts/lib/wic/creator.py
@@ -41,7 +41,7 @@ class Creator(object):
 
         # get cmds from pluginmgr
         # mix-in do_subcmd interface
-        for subcmd, klass in pluginmgr.get_plugins('imager').iteritems():
+        for subcmd, klass in pluginmgr.get_plugins('imager').items():
             if not hasattr(klass, 'do_create'):
                 msger.warning("Unsupported subcmd: %s" % subcmd)
                 continue
diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 158b6c1..7dcc717 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -66,7 +66,7 @@ def get_wic_plugins_help():
     result = wic_plugins_help
     for plugin_type in PLUGIN_TYPES:
         result += '\n\n%s PLUGINS\n\n' % plugin_type.upper()
-        for name, plugin in pluginmgr.get_plugins(plugin_type).iteritems():
+        for name, plugin in pluginmgr.get_plugins(plugin_type).items():
             result += "\n %s plugin:\n" % name
             if plugin.__doc__:
                 result += plugin.__doc__
diff --git a/scripts/lib/wic/plugin.py b/scripts/lib/wic/plugin.py
index ccfdfcb..80c609c 100644
--- a/scripts/lib/wic/plugin.py
+++ b/scripts/lib/wic/plugin.py
@@ -81,7 +81,7 @@ class PluginMgr(object):
             # the value True/False means "loaded"
 
     def _load_all(self):
-        for (pdir, loaded) in self.plugin_dirs.iteritems():
+        for (pdir, loaded) in self.plugin_dirs.items():
             if loaded:
                 continue
 
@@ -135,7 +135,7 @@ class PluginMgr(object):
         None is returned.
         """
         return_methods = None
-        for _source_name, klass in self.get_plugins('source').iteritems():
+        for _source_name, klass in self.get_plugins('source').items():
             if _source_name == source_name:
                 for _method_name in methods.keys():
                     if not hasattr(klass, _method_name):
-- 
2.1.4



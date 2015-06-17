Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id DE7F872491
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 08:50:29 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 17 Jun 2015 01:50:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,632,1427785200"; d="scan'208";a="712488020"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 17 Jun 2015 01:50:30 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id AEE686A4083;
	Wed, 17 Jun 2015 01:49:53 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jun 2015 09:56:44 +0300
Message-Id: <1434524204-13115-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] wic: Integrated plugin docstrings into 'wic help plugins' output
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
X-List-Received-Date: Wed, 17 Jun 2015 08:50:30 -0000

Added mechanism to show docstrings of plugin classes as a part of
plugins help page.
For missing plugins the following warning message is shown:
<class '<plugin class spec>'> is missing docstring.

[YOCTO #7118]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/image/help.py | 18 ++++++++++++++++++
 scripts/wic               |  2 +-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/image/help.py b/scripts/lib/image/help.py
index a546c7c..9321149 100644
--- a/scripts/lib/image/help.py
+++ b/scripts/lib/image/help.py
@@ -28,6 +28,7 @@
 import subprocess
 import logging
 
+from wic.plugin import pluginmgr, PLUGIN_TYPES
 
 def subcommand_error(args):
     logging.info("invalid subcommand %s" % args[0])
@@ -55,6 +56,23 @@ def wic_help(args, usage_str, subcommands):
         print(usage_str)
 
 
+def get_wic_plugins_help():
+    """
+    Combine wic_plugins_help with the help for every known
+    source plugin.
+    """
+    result = wic_plugins_help
+    for plugin_type in PLUGIN_TYPES:
+        result += '\n\n%s PLUGINS\n\n' % plugin_type.upper()
+        for name, plugin in pluginmgr.get_plugins(plugin_type).iteritems():
+            result += "\n %s plugin:\n" % name
+            if plugin.__doc__:
+                result += plugin.__doc__
+            else:
+                result += "\n    %s is missing docstring\n" % plugin
+    return result
+
+
 def invoke_subcommand(args, parser, main_command_usage, subcommands):
     """
     Dispatch to subcommand handler borrowed from combo-layer.
diff --git a/scripts/wic b/scripts/wic
index d48e45d..a38ecc0 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -277,7 +277,7 @@ subcommands = {
                   hlp.wic_list_help],
     "plugins":   [wic_help_topic_subcommand,
                   wic_help_topic_usage,
-                  hlp.wic_plugins_help],
+                  hlp.get_wic_plugins_help()],
     "overview":  [wic_help_topic_subcommand,
                   wic_help_topic_usage,
                   hlp.wic_overview_help],
-- 
2.1.4



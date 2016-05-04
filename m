Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 80971731FC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 15:27:41 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 04 May 2016 08:27:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,577,1455004800"; d="scan'208";a="972537022"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 04 May 2016 08:27:33 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 050A06A4007
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 09:15:07 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 May 2016 16:06:21 +0300
Message-Id: <27644c46f2f07cfcf801b3c77ab3bbcc50f55935.1462365339.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1462365339.git.ed.bartosh@linux.intel.com>
References: <cover.1462365339.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1462365339.git.ed.bartosh@linux.intel.com>
References: <cover.1462365339.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 08/14] wic: refactor pluginbase
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
X-List-Received-Date: Wed, 04 May 2016 15:27:42 -0000

Wic plugin machinery implemented using metaclasses.

Reimplemented plugin machinery using this advice from
https://wiki.python.org/moin/PortingToPy3k/BilingualQuickRef
Syntax for creating instances with different metaclasses is very
different between Python 2 and 3. Use the ability to call type instances
as a way to portably create such instances.

Now it should work under both Python 2 and Python 3.

[YOCTO #9412]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/pluginbase.py | 42 ++++++++++++++----------------------------
 1 file changed, 14 insertions(+), 28 deletions(-)

diff --git a/scripts/lib/wic/pluginbase.py b/scripts/lib/wic/pluginbase.py
index ee8fe95..e737dee 100644
--- a/scripts/lib/wic/pluginbase.py
+++ b/scripts/lib/wic/pluginbase.py
@@ -15,34 +15,26 @@
 # with this program; if not, write to the Free Software Foundation, Inc., 59
 # Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 
-from wic import msger
-
-class _Plugin(object):
-    class __metaclass__(type):
-        def __init__(cls, name, bases, attrs):
-            if not hasattr(cls, 'plugins'):
-                cls.plugins = {}
-
-            elif 'wic_plugin_type' in attrs:
-                if attrs['wic_plugin_type'] not in cls.plugins:
-                    cls.plugins[attrs['wic_plugin_type']] = {}
+__all__ = ['ImagerPlugin', 'SourcePlugin', 'get_plugins']
 
-            elif hasattr(cls, 'wic_plugin_type') and 'name' in attrs:
-                cls.plugins[cls.wic_plugin_type][attrs['name']] = cls
+import sys
+from collections import defaultdict
 
-        def show_plugins(cls):
-            for cls in cls.plugins[cls.wic_plugin_type]:
-                print cls
+from wic import msger
 
-        def get_plugins(cls):
-            return cls.plugins
+class PluginMeta(type):
+    plugins = defaultdict(dict)
+    def __new__(cls, name, bases, attrs):
+        class_type = type.__new__(cls, name, bases, attrs)
+        if 'name' in attrs:
+            cls.plugins[class_type.wic_plugin_type][attrs['name']] = class_type
 
+        return class_type
 
-class ImagerPlugin(_Plugin):
+class ImagerPlugin(PluginMeta("Plugin", (), {})):
     wic_plugin_type = "imager"
 
-
-class SourcePlugin(_Plugin):
+class SourcePlugin(PluginMeta("Plugin", (), {})):
     wic_plugin_type = "source"
     """
     The methods that can be implemented by --source plugins.
@@ -99,10 +91,4 @@ class SourcePlugin(_Plugin):
         msger.debug("SourcePlugin: do_prepare_partition: part: %s" % part)
 
 def get_plugins(typen):
-    plugins = ImagerPlugin.get_plugins()
-    if typen in plugins:
-        return plugins[typen]
-    else:
-        return None
-
-__all__ = ['ImagerPlugin', 'SourcePlugin', 'get_plugins']
+    return PluginMeta.plugins.get(typen)
-- 
2.1.4



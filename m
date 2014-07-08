Return-Path: <tom.zanussi@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id CBDB7703F9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jul 2014 14:52:10 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 08 Jul 2014 07:51:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,625,1400050800"; d="scan'208";a="454502557"
Received: from gmacartn-mobl.ger.corp.intel.com (HELO localhost)
	([10.255.13.3])
	by azsmga001.ch.intel.com with ESMTP; 08 Jul 2014 07:51:57 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jul 2014 09:51:52 -0500
Message-Id: <62d5079dcc2b71362fb5930ca600e8936a040049.1404830754.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1404830754.git.tom.zanussi@linux.intel.com>
References: <cover.1404830754.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 1/5] wic: Add command to list available source plugins
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
X-List-Received-Date: Tue, 08 Jul 2014 14:52:11 -0000

Add a 'wic list source-plugins' command enabling users to get a list
of valid partition --sources.  This is useful not only for determining
sources to use in .wks partition statements, but also for making sense
of errors in .wks partition processing.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/image/engine.py | 13 +++++++++++++
 scripts/lib/mic/plugin.py   | 16 ++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/scripts/lib/image/engine.py b/scripts/lib/image/engine.py
index 1256236..b850bb9 100644
--- a/scripts/lib/image/engine.py
+++ b/scripts/lib/image/engine.py
@@ -174,6 +174,16 @@ def list_canned_image_help(scripts_path, fullpath):
             break
 
 
+def list_source_plugins():
+    """
+    List the available source plugins i.e. plugins available for --source.
+    """
+    plugins = pluginmgr.get_source_plugins()
+
+    for plugin in plugins:
+        print "  %s" % plugin
+
+
 def wic_create(args, wks_file, rootfs_dir, bootimg_dir, kernel_dir,
                native_sysroot, hdddir, staging_data_dir, scripts_path,
                image_output_dir, debug, properties_file, properties=None):
@@ -258,6 +268,9 @@ def wic_list(args, scripts_path, properties_file):
         if args[0] == "images":
             list_canned_images(scripts_path)
             return True
+        elif args[0] == "source-plugins":
+            list_source_plugins()
+            return True
         elif args[0] == "properties":
             return True
         else:
diff --git a/scripts/lib/mic/plugin.py b/scripts/lib/mic/plugin.py
index 585fd6d..f836950 100644
--- a/scripts/lib/mic/plugin.py
+++ b/scripts/lib/mic/plugin.py
@@ -117,6 +117,22 @@ class PluginMgr(object):
 
         return pluginbase.get_plugins(ptype)
 
+    def get_source_plugins(self):
+        """
+        Return list of available source plugins.
+        """
+        plugins_dir = self._build_plugin_dir_list(self.plugin_dir, 'source')
+
+        self.append_dirs(plugins_dir)
+
+        plugins = []
+
+        for _source_name, klass in self.get_plugins('source').iteritems():
+            plugins.append(_source_name)
+
+        return plugins
+
+
     def get_source_plugin_methods(self, source_name, methods):
         """
         The methods param is a dict with the method names to find.  On
-- 
1.8.3.1



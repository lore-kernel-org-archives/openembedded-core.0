Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 6AC23772E4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 14:11:27 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP; 01 Feb 2017 06:11:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,320,1477983600"; d="scan'208";a="38265025"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 01 Feb 2017 06:11:28 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 24DB26A4006
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 06:10:28 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2017 15:48:15 +0200
Message-Id: <e736442e6435615eaa6296b9136d5aeea0487802.1485953483.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485953483.git.ed.bartosh@linux.intel.com>
References: <cover.1485953483.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 08/18] wic: simplified code of direct_plugin
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
X-List-Received-Date: Wed, 01 Feb 2017 14:11:28 -0000

Removed unused methods.
Got rid of get_default_source_plugin and _full_name methods.

[YOCTO #10619]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/imager/direct_plugin.py | 24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/scripts/lib/wic/plugins/imager/direct_plugin.py b/scripts/lib/wic/plugins/imager/direct_plugin.py
index 1d0d3ff..9cd7068 100644
--- a/scripts/lib/wic/plugins/imager/direct_plugin.py
+++ b/scripts/lib/wic/plugins/imager/direct_plugin.py
@@ -93,9 +93,6 @@ class DiskImage():
         self.device = device
         self.created = False
 
-    def exists(self):
-        return os.path.exists(self.device)
-
     def create(self):
         if self.created:
             return
@@ -229,26 +226,9 @@ class DirectImageCreator:
         # partitions list from kickstart file
         return self.ks.partitions
 
-    def _full_name(self, name, extention):
-        """ Construct full file name for a file we generate. """
-        return "%s-%s.%s" % (self.name, name, extention)
-
     def _full_path(self, path, name, extention):
         """ Construct full file path to a file we generate. """
-        return os.path.join(path, self._full_name(name, extention))
-
-    def get_default_source_plugin(self):
-        """
-        The default source plugin i.e. the plugin that's consulted for
-        overall image generation tasks outside of any particular
-        partition.  For convenience, we just hang it off the
-        bootloader handler since it's the one non-partition object in
-        any setup.  By default the default plugin is set to the same
-        plugin as the /boot partition; since we hang it off the
-        bootloader object, the default can be explicitly set using the
-        --source bootloader param.
-        """
-        return self.ks.bootloader.source
+        return os.path.join(path, "%s-%s.%s" % (self.name, name, extention))
 
     #
     # Actual implemention
@@ -346,7 +326,7 @@ class DirectImageCreator:
         For example, prepare the image to be bootable by e.g.
         creating and installing a bootloader configuration.
         """
-        source_plugin = self.get_default_source_plugin()
+        source_plugin = self.ks.bootloader.source
         if source_plugin:
             name = "do_install_disk"
             methods = pluginmgr.get_source_plugin_methods(source_plugin,
-- 
2.1.4



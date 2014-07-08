Return-Path: <tom.zanussi@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8B4B7703F9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jul 2014 14:52:12 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 08 Jul 2014 07:52:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,625,1400050800"; d="scan'208";a="566758691"
Received: from gmacartn-mobl.ger.corp.intel.com (HELO localhost)
	([10.255.13.3])
	by fmsmga002.fm.intel.com with ESMTP; 08 Jul 2014 07:52:05 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jul 2014 09:51:56 -0500
Message-Id: <d94d6edc2459e91b19eda41c74252a4978732feb.1404830754.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <62d5079dcc2b71362fb5930ca600e8936a040049.1404830754.git.tom.zanussi@linux.intel.com>
References: <62d5079dcc2b71362fb5930ca600e8936a040049.1404830754.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1404830754.git.tom.zanussi@linux.intel.com>
References: <cover.1404830754.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 5/5] wic: Add general 'plugins' help topic
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
X-List-Received-Date: Tue, 08 Jul 2014 14:52:13 -0000

Add a category for help topics with an initial help topic discussing
source plugins.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/image/help.py | 101 +++++++++++++++++++++++++++++++++++++++++++++-
 scripts/wic               |  15 ++++---
 2 files changed, 109 insertions(+), 7 deletions(-)

diff --git a/scripts/lib/image/help.py b/scripts/lib/image/help.py
index 6de7ab0..a4f27ab 100644
--- a/scripts/lib/image/help.py
+++ b/scripts/lib/image/help.py
@@ -87,7 +87,11 @@ wic_usage = """
     create            Create a new OpenEmbedded image
     list              List available values for options and image properties
 
- See 'wic help COMMAND' for more information on a specific command.
+ Help topics:
+    plugins            wic plugins - Overview and API
+
+ See 'wic help <COMMAND or HELP TOPIC>' for more information on a specific
+ command or help topic.
 """
 
 wic_help_usage = """
@@ -323,3 +327,98 @@ DESCRIPTION
         ["offset", "offset of the partition within the image"]
 
 """
+
+wic_plugins_help = """
+
+NAME
+    wic plugins - Overview and API
+
+DESCRIPTION
+    plugins allow wic functionality to be extended and specialized by
+    users.  This section documents the plugin interface, which is
+    currently restricted to 'source' plugins.
+
+    'Source' plugins provide a mechanism to customize various aspects
+    of the image generation process in wic, mainly the contents of
+    partitions.
+
+    Source plugins provide a mechanism for mapping values specified in
+    .wks files using the --source keyword to a particular plugin
+    implementation that populates a corresponding partition.
+
+    A source plugin is created as a subclass of SourcePlugin (see
+    scripts/lib/mic/pluginbase.py) and the plugin file containing it
+    is added to scripts/lib/mic/plugins/source/ to make the plugin
+    implementation available to the wic implementation.
+
+    Source plugins can also be implemented and added by external
+    layers - any plugins found in a scripts/lib/mic/plugins/source/
+    directory in an external layer will also be made available.
+
+    When the wic implementation needs to invoke a partition-specific
+    implementation, it looks for the plugin that has the same name as
+    the --source param given to that partition.  For example, if the
+    partition is set up like this:
+
+      part /boot --source bootimg-pcbios   ...
+
+    then the methods defined as class members of the plugin having the
+    matching bootimg-pcbios .name class member would be used.
+
+    To be more concrete, here's the plugin definition that would match
+    a '--source bootimg-pcbios' usage, along with an example method
+    that would be called by the wic implementation when it needed to
+    invoke an implementation-specific partition-preparation function:
+
+    class BootimgPcbiosPlugin(SourcePlugin):
+        name = 'bootimg-pcbios'
+
+    @classmethod
+        def do_prepare_partition(self, part, ...)
+
+    If the subclass itself doesn't implement a function, a 'default'
+    version in a superclass will be located and used, which is why all
+    plugins must be derived from SourcePlugin.
+
+    The SourcePlugin class defines the following methods, which is the
+    current set of methods that can be implemented/overridden by
+    --source plugins.  Any methods not implemented by a SourcePlugin
+    subclass inherit the implementations present in the SourcePlugin
+    class (see the SourcePlugin source for details):
+
+      do_prepare_partition()
+          Called to do the actual content population for a partition
+          i.e. it 'prepares' the final partition image which will be
+          incorporated into the disk image.
+
+      do_configure_partition()
+          Called before do_prepare_partition(), typically used to
+          create custom configuration files for a partition, for
+          example syslinux or grub config files.
+
+      do_install_disk()
+          Called after all partitions have been prepared and assembled
+          into a disk image.  This provides a hook to allow
+          finalization of a disk image e.g. to write an MBR to it.
+
+      do_stage_partition()
+          Special content staging hook called before
+          do_prepare_partition(), normally empty.
+
+          Typically, a partition will just use the passed-in parame
+          e.g straight bootimg_dir, etc, but in some cases, things
+          need to be more tailored e.g. to use a deploy dir + /boot,
+          etc.  This hook allows those files to be staged in a
+          customized fashion.  Not that get_bitbake_var() allows you
+          to acces non-standard variables that you might want to use
+          for this.
+
+    This scheme is extensible - adding more hooks is a simple matter
+    of adding more plugin methods to SourcePlugin and derived classes.
+    The code that then needs to call the plugin methods the uses
+    plugin.get_source_plugin_methods() to find the method(s) needed by
+    the call; this is done by filling up a dict with keys containing
+    the method names of interest - on success, these will be filled in
+    with the actual methods. Please see the implementation for
+    examples and details.
+"""
diff --git a/scripts/wic b/scripts/wic
index 00eddfd..ac3ed16 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -240,12 +240,15 @@ wic_help_topic_usage = """
 """
 
 subcommands = {
-    "create": [wic_create_subcommand,
-               wic_create_usage,
-               wic_create_help],
-    "list":   [wic_list_subcommand,
-               wic_list_usage,
-               wic_list_help],
+    "create":  [wic_create_subcommand,
+                wic_create_usage,
+                wic_create_help],
+    "list":    [wic_list_subcommand,
+                wic_list_usage,
+                wic_list_help],
+    "plugins": [wic_help_topic_subcommand,
+                wic_help_topic_usage,
+                wic_plugins_help],
 }
 
 
-- 
1.8.3.1



Return-Path: <tom.zanussi@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 203AE6EC91
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2014 01:17:08 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Feb 2014 17:12:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,776,1384329600"; d="scan'208";a="449256320"
Received: from unknown (HELO localhost) ([10.255.13.52])
	by orsmga001.jf.intel.com with ESMTP; 03 Feb 2014 17:17:08 -0800
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Feb 2014 19:16:57 -0600
Message-Id: <617ff6f4aa905c488f6893cb34411f38d8c3819f.1391476329.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <77905d08bc13b7b0e12ee12aa77ccf4f4c4adc00.1391476329.git.tom.zanussi@linux.intel.com>
References: <77905d08bc13b7b0e12ee12aa77ccf4f4c4adc00.1391476329.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1391476329.git.tom.zanussi@linux.intel.com>
References: <cover.1391476329.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 4/7] wic: Add SourcePlugin class
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
X-List-Received-Date: Tue, 04 Feb 2014 01:17:08 -0000

Define the SourcePlugin class, which is the class that should be
subclassed to create a 'source' plugin.

'Source' plugins provide a mechanism to customize various aspects of
the image generation process in wic, mainly the contents of
partitions.

The initial version of wic defined a --source param for partitions,
which was in the first revision hard-coded to two possible values:
rootfs and bootimg.

This patch essentially removes the hard-coded --bootimg param and
replaces it with a plugin system that maps the value specified as
--source to a particular 'source' plugin instead.

A 'source' plugin is created as a subclass of SourcePlugin and the
plugin file containing it is added to scriptsl/lib/mic/plugins/source/
to make the plugin implementation available to the wic implementation.

When the wic implementation needs to invoke a partition-specific
implementation, it looks for the plugin that has the same name as the
--source param given to that partition.  For example, if the partition
is set up like this:

  part /boot --source bootimg-pcbios   ...

then the methods defined as class members of the plugin having the
matching .name class member would be used.

To be more concrete, here's the plugin definition that would match a
'--source bootimg-pcbios' usage, along with an example method that
would be called by the wic implementation when it needed to invoke an
implementation-specific partition-preparation function:

  class BootimgPcbiosPlugin(SourcePlugin):
      name = 'bootimg-pcbios'

  @classmethod
      def do_prepare_partition(self, part, ...)

If the subclass itself doesn't implement a function, a 'default'
version in a superclass will be located and used, which is why all
plugins must be derived from SourcePlugin.

This scheme is extensible - adding more hooks is a simple matter of
adding more plugin methods to SourcePlugin and derived classes.  The
code that then needs to call the plugin methods the uses
plugin.get_source_plugin_methods() to find the method(s) needed by the
call; this is done by filling up a dict with keys containing the
methon names of interest - on success, these will be filled in with
the actual methods. fPlease see the implementation for examples and
details.

Note that a source plugin need not restrict itself to methods that
apply directly to partitions - methods can also be defined for higher
level processing such as at the 'disk' level.  The
get_default_source_plugin() of DirectImageCreator allows the default
source plugin to be retrieved; by default this is set to be the same
plugin used for the /boot partition, but that can be overridden by
specifying a different --source and therefore different plugin on the
'bootloader' line.  This isn't ideal, but it avoids forcing a new
high-level object to be defined for that purpose.

Note that the '--source rootfs' param remains as its current
hard-coded value, which is just the rootfs to be used to populate the
partition - by default, that's just the value of the bitbake
ROOTFS_DIR variable (or whatever was passed in using the -r param).
Note that this also could also be overridden by creating a source
plugin using a different name; at this point, unlike with bootimg,
there's been no need to do so.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/mic/plugin.py     | 23 ++++++++++++++++--
 scripts/lib/mic/pluginbase.py | 55 ++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 75 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/mic/plugin.py b/scripts/lib/mic/plugin.py
index 7c296e9..df03c15 100644
--- a/scripts/lib/mic/plugin.py
+++ b/scripts/lib/mic/plugin.py
@@ -19,13 +19,12 @@ import os, sys
 
 from mic import msger
 from mic import pluginbase
-from mic.conf import configmgr
 from mic.utils import errors
 
 
 __ALL__ = ['PluginMgr', 'pluginmgr']
 
-PLUGIN_TYPES = ["imager", "backend"] # TODO  "hook"
+PLUGIN_TYPES = ["imager", "source"] # TODO  "hook"
 
 
 class PluginMgr(object):
@@ -99,4 +98,24 @@ class PluginMgr(object):
 
         return pluginbase.get_plugins(ptype)
 
+    def get_source_plugin_methods(self, source_name, methods):
+        """
+        The methods param is a dict with the method names to find.  On
+        return, the dict values will be filled in with pointers to the
+        corresponding methods.  If one or more methods are not found,
+        None is returned.
+        """
+        return_methods = None
+        for _source_name, klass in self.get_plugins('source').iteritems():
+            if _source_name == source_name:
+                for _method_name in methods.keys():
+                    if not hasattr(klass, _method_name):
+                        msger.warning("Unimplemented %s source interface for: %s"\
+                                      % (_method_name, _source_name))
+                        return None
+                    func = getattr(klass, _method_name)
+                    methods[_method_name] = func
+                    return_methods = methods
+        return return_methods
+
 pluginmgr = PluginMgr()
diff --git a/scripts/lib/mic/pluginbase.py b/scripts/lib/mic/pluginbase.py
index 2f9d720..e26b525 100644
--- a/scripts/lib/mic/pluginbase.py
+++ b/scripts/lib/mic/pluginbase.py
@@ -80,6 +80,59 @@ class ImagerPlugin(_Plugin):
     def do_chroot(self):
         pass
 
+class SourcePlugin(_Plugin):
+    mic_plugin_type = "source"
+    """
+    The methods that can be implemented by --source plugins.
+
+    Any methods not implemented in a subclass inherit these.
+    """
+
+    @classmethod
+    def do_install_disk(self, disk, disk_name, cr, workdir, oe_builddir,
+                        bootimg_dir, kernel_dir, native_sysroot):
+        """
+        Called after all partitions have been prepared and assembled into a
+        disk image.  This provides a hook to allow finalization of a
+        disk image e.g. to write an MBR to it.
+        """
+        msger.debug("SourcePlugin: do_install_disk: disk: %s" % disk_name)
+
+    @classmethod
+    def do_stage_partition(self, part, cr, workdir, oe_builddir, bootimg_dir,
+                           kernel_dir, native_sysroot):
+        """
+        Special content staging hook called before do_prepare_partition(),
+        normally empty.
+
+        Typically, a partition will just use the passed-in parame e.g
+        straight bootimg_dir, etc, but in some cases, things need to
+        be more tailored e.g. to use a deploy dir + /boot, etc.  This
+        hook allows those files to be staged in a customized fashion.
+        Not that get_bitbake_var() allows you to acces non-standard
+        variables that you might want to use for this.
+        """
+        msger.debug("SourcePlugin: do_stage_partition: part: %s" % part)
+
+    @classmethod
+    def do_configure_partition(self, part, cr, cr_workdir, oe_builddir,
+                               bootimg_dir, kernel_dir, native_sysroot):
+        """
+        Called before do_prepare_partition(), typically used to create
+        custom configuration files for a partition, for example
+        syslinux or grub config files.
+        """
+        msger.debug("SourcePlugin: do_configure_partition: part: %s" % part)
+
+    @classmethod
+    def do_prepare_partition(self, part, cr, cr_workdir, oe_builddir, bootimg_dir,
+                             kernel_dir, native_sysroot):
+        """
+        Called to do the actual content population for a partition i.e. it
+        'prepares' the partition to be incorporated into the image.
+        """
+        msger.debug("SourcePlugin: do_prepare_partition: part: %s" % part)
+
 class BackendPlugin(_Plugin):
     mic_plugin_type="backend"
 
@@ -93,4 +146,4 @@ def get_plugins(typen):
     else:
         return None
 
-__all__ = ['ImagerPlugin', 'BackendPlugin', 'get_plugins']
+__all__ = ['ImagerPlugin', 'BackendPlugin', 'SourcePlugin', 'get_plugins']
-- 
1.8.3.1



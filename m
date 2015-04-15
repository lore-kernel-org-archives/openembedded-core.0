Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 074246ABF7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 20:47:18 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 15 Apr 2015 13:47:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,583,1422950400"; d="scan'208";a="695886642"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 15 Apr 2015 13:47:20 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id DD5DF6A408F;
	Wed, 15 Apr 2015 13:46:55 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Apr 2015 23:47:10 +0300
Message-Id: <1429130830-14746-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] wic: code cleanup: wildcard imports
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
X-List-Received-Date: Wed, 15 Apr 2015 20:47:19 -0000

Here is what PEP8(Style Guide for Python Code) says about this:

Wildcard imports (from <module> import *) should be avoided, as they
make it unclear which names are present in the namespace, confusing
both readers and many automated tools.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/image/engine.py                        | 18 +++++-----
 scripts/lib/wic/imager/direct.py                   |  1 -
 scripts/lib/wic/plugin.py                          |  2 +-
 scripts/lib/wic/plugins/source/bootimg-efi.py      |  8 ++---
 .../lib/wic/plugins/source/bootimg-partition.py    |  2 +-
 scripts/lib/wic/plugins/source/bootimg-pcbios.py   |  9 ++---
 scripts/lib/wic/plugins/source/fsimage.py          |  2 +-
 scripts/lib/wic/plugins/source/rawcopy.py          |  2 +-
 scripts/lib/wic/plugins/source/rootfs.py           |  9 ++---
 scripts/lib/wic/utils/fs_related.py                |  5 +--
 scripts/lib/wic/utils/partitionedfs.py             |  4 +--
 scripts/wic                                        | 41 +++++++++++-----------
 12 files changed, 43 insertions(+), 60 deletions(-)

diff --git a/scripts/lib/image/engine.py b/scripts/lib/image/engine.py
index 68d1ce2..05c2638 100644
--- a/scripts/lib/image/engine.py
+++ b/scripts/lib/image/engine.py
@@ -42,7 +42,7 @@ from wic.utils import cmdln, misc, errors
 from wic.conf import configmgr
 from wic.plugin import pluginmgr
 from wic.__version__ import VERSION
-from wic.utils.oe.misc import *
+from wic.utils.oe import misc
 
 
 def verify_build_env():
@@ -65,19 +65,19 @@ def find_artifacts(image_name):
     Gather the build artifacts for the current image (the image_name
     e.g. core-image-minimal) for the current MACHINE set in local.conf
     """
-    bitbake_env_lines = get_bitbake_env_lines()
+    bitbake_env_lines = misc.get_bitbake_env_lines()
 
     rootfs_dir = kernel_dir = bootimg_dir = native_sysroot = ""
 
     for line in bitbake_env_lines.split('\n'):
-        if (get_line_val(line, "IMAGE_ROOTFS")):
-            rootfs_dir = get_line_val(line, "IMAGE_ROOTFS")
+        if (misc.get_line_val(line, "IMAGE_ROOTFS")):
+            rootfs_dir = misc.get_line_val(line, "IMAGE_ROOTFS")
             continue
-        if (get_line_val(line, "DEPLOY_DIR_IMAGE")):
-            kernel_dir = get_line_val(line, "DEPLOY_DIR_IMAGE")
+        if (misc.get_line_val(line, "DEPLOY_DIR_IMAGE")):
+            kernel_dir = misc.get_line_val(line, "DEPLOY_DIR_IMAGE")
             continue
-        if (get_line_val(line, "STAGING_DIR_NATIVE")):
-            native_sysroot = get_line_val(line, "STAGING_DIR_NATIVE")
+        if (misc.get_line_val(line, "STAGING_DIR_NATIVE")):
+            native_sysroot = misc.get_line_val(line, "STAGING_DIR_NATIVE")
             continue
 
     return (rootfs_dir, kernel_dir, bootimg_dir, native_sysroot)
@@ -87,7 +87,7 @@ CANNED_IMAGE_DIR = "lib/image/canned-wks" # relative to scripts
 SCRIPTS_CANNED_IMAGE_DIR = "scripts/" + CANNED_IMAGE_DIR
 
 def build_canned_image_list(dl):
-    layers_path = get_bitbake_var("BBLAYERS")
+    layers_path = misc.get_bitbake_var("BBLAYERS")
     canned_wks_layer_dirs = []
 
     if layers_path is not None:
diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
index 0e687bd..9a7d0f5 100644
--- a/scripts/lib/wic/imager/direct.py
+++ b/scripts/lib/wic/imager/direct.py
@@ -32,7 +32,6 @@ from wic.utils import fs_related, runner, misc
 from wic.utils.partitionedfs import Image
 from wic.utils.errors import CreatorError, ImageError
 from wic.imager.baseimager import BaseImageCreator
-from wic.utils.oe.misc import *
 from wic.plugin import pluginmgr
 
 disk_methods = {
diff --git a/scripts/lib/wic/plugin.py b/scripts/lib/wic/plugin.py
index 41a8017..9872d20 100644
--- a/scripts/lib/wic/plugin.py
+++ b/scripts/lib/wic/plugin.py
@@ -20,7 +20,7 @@ import os, sys
 from wic import msger
 from wic import pluginbase
 from wic.utils import errors
-from wic.utils.oe.misc import *
+from wic.utils.oe.misc import get_bitbake_var
 
 __ALL__ = ['PluginMgr', 'pluginmgr']
 
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 883378e..2fc0357 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -29,13 +29,9 @@ import shutil
 
 from wic.utils.errors import ImageError
 from wic import kickstart, msger
-from wic.utils import misc, fs_related, errors, runner, cmdln
-from wic.conf import configmgr
-from wic.plugin import pluginmgr
-import wic.imager.direct as direct
 from wic.pluginbase import SourcePlugin
-from wic.utils.oe.misc import *
-from wic.imager.direct import DirectImageCreator
+from wic.utils.oe.misc import exec_cmd, exec_native_cmd, get_bitbake_var, \
+                              BOOTDD_EXTRA_SPACE
 
 class BootimgEFIPlugin(SourcePlugin):
     name = 'bootimg-efi'
diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg-partition.py
index c5eb7b8..909e59b 100644
--- a/scripts/lib/wic/plugins/source/bootimg-partition.py
+++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
@@ -28,7 +28,7 @@ import re
 
 from wic import msger
 from wic.pluginbase import SourcePlugin
-from wic.utils.oe.misc import *
+from wic.utils.oe.misc import exec_cmd, get_bitbake_var
 from glob import glob
 
 class BootimgPartitionPlugin(SourcePlugin):
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index 2280867..9c63855 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -28,13 +28,10 @@ import os
 
 from wic.utils.errors import ImageError
 from wic import kickstart, msger
-from wic.utils import misc, fs_related, errors, runner, cmdln
-from wic.conf import configmgr
-from wic.plugin import pluginmgr
-import wic.imager.direct as direct
+from wic.utils import runner
 from wic.pluginbase import SourcePlugin
-from wic.utils.oe.misc import *
-from wic.imager.direct import DirectImageCreator
+from wic.utils.oe.misc import exec_cmd, exec_native_cmd, \
+                              get_bitbake_var, BOOTDD_EXTRA_SPACE
 
 class BootimgPcbiosPlugin(SourcePlugin):
     name = 'bootimg-pcbios'
diff --git a/scripts/lib/wic/plugins/source/fsimage.py b/scripts/lib/wic/plugins/source/fsimage.py
index 4a090ba..ef56cf2 100644
--- a/scripts/lib/wic/plugins/source/fsimage.py
+++ b/scripts/lib/wic/plugins/source/fsimage.py
@@ -19,7 +19,7 @@ import os
 
 from wic import msger
 from wic.pluginbase import SourcePlugin
-from wic.utils.oe.misc import *
+from wic.utils.oe.misc import get_bitbake_var
 
 class FSImagePlugin(SourcePlugin):
     name = 'fsimage'
diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/plugins/source/rawcopy.py
index ca6b721..444c026 100644
--- a/scripts/lib/wic/plugins/source/rawcopy.py
+++ b/scripts/lib/wic/plugins/source/rawcopy.py
@@ -19,7 +19,7 @@ import os
 
 from wic import msger
 from wic.pluginbase import SourcePlugin
-from wic.utils.oe.misc import *
+from wic.utils.oe.misc import exec_cmd, get_bitbake_var
 
 class RawCopyPlugin(SourcePlugin):
     name = 'rawcopy'
diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index 6f5d9bb..7d44430 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -27,14 +27,9 @@
 
 import os
 
-from wic import kickstart, msger
-from wic.utils import misc, fs_related, errors, runner, cmdln
-from wic.conf import configmgr
-from wic.plugin import pluginmgr
-import wic.imager.direct as direct
+from wic import msger
 from wic.pluginbase import SourcePlugin
-from wic.utils.oe.misc import *
-from wic.imager.direct import DirectImageCreator
+from wic.utils.oe.misc import find_bitbake_env_lines, find_artifact
 
 class RootfsPlugin(SourcePlugin):
     name = 'rootfs'
diff --git a/scripts/lib/wic/utils/fs_related.py b/scripts/lib/wic/utils/fs_related.py
index fb9054d..2e74461 100644
--- a/scripts/lib/wic/utils/fs_related.py
+++ b/scripts/lib/wic/utils/fs_related.py
@@ -20,10 +20,7 @@ from __future__ import with_statement
 import os
 import errno
 
-from wic import msger
-from wic.utils import runner
-from wic.utils.errors import *
-from wic.utils.oe.misc import *
+from wic.utils.oe.misc import exec_cmd
 
 def makedirs(dirname):
     """A version of os.makedirs() that doesn't throw an
diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index 40d6e88..1c9e3ea 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -19,10 +19,8 @@
 # Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 
 from wic import msger
-from wic.utils import runner
 from wic.utils.errors import ImageError
-from wic.utils.fs_related import *
-from wic.utils.oe.misc import *
+from wic.utils.oe.misc import exec_cmd, exec_native_cmd
 
 # Overhead of the MBR partitioning scheme (just one sector)
 MBR_OVERHEAD = 1
diff --git a/scripts/wic b/scripts/wic
index 5bedd90..4b438f7 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -43,8 +43,9 @@ lib_path = scripts_path + '/lib'
 bitbake_path = os.path.join(scripts_path, '../bitbake/lib')
 sys.path = sys.path + [lib_path, bitbake_path]
 
-from image.help import *
-from image.engine import *
+from wic.utils.oe.misc import find_bitbake_env_lines, set_bitbake_env_lines
+from image import engine
+from image import help as hlp
 
 from bb import cookerdata
 from bb.main import bitbake_main, BitBakeConfigParameters
@@ -122,7 +123,7 @@ def wic_create_subcommand(args, usage_str):
 
     if options.build_check and not options.properties_file:
         print "Checking basic build environment..."
-        if not verify_build_env():
+        if not engine.verify_build_env():
             print "Couldn't verify build environment, exiting\n"
             sys.exit(1)
         else:
@@ -148,7 +149,7 @@ def wic_create_subcommand(args, usage_str):
                 sys.exit(1)
 
         (rootfs_dir, kernel_dir, bootimg_dir, native_sysroot) \
-            = find_artifacts(options.image_name)
+            = engine.find_artifacts(options.image_name)
 
     else:
         if options.build_rootfs:
@@ -158,7 +159,7 @@ def wic_create_subcommand(args, usage_str):
     wks_file = args[0]
 
     if not wks_file.endswith(".wks"):
-        wks_file = find_canned_image(scripts_path, wks_file)
+        wks_file = engine.find_canned_image(scripts_path, wks_file)
         if not wks_file:
             print "No image named %s found, exiting.  (Use 'wic list images' to list available images, or specify a fully-qualified OE kickstart (.wks) filename)\n" % wks_file
             sys.exit(1)
@@ -213,9 +214,9 @@ def wic_create_subcommand(args, usage_str):
     rootfs_dir = rootfs_dir_to_args(krootfs_dir)
 
     print "Creating image(s)...\n"
-    wic_create(args, wks_file, rootfs_dir, bootimg_dir, kernel_dir,
-               native_sysroot, scripts_path, image_output_dir,
-               options.debug, options.properties_file)
+    engine.wic_create(args, wks_file, rootfs_dir, bootimg_dir, kernel_dir,
+                      native_sysroot, scripts_path, image_output_dir,
+                      options.debug, options.properties_file)
 
 
 def wic_list_subcommand(args, usage_str):
@@ -237,7 +238,7 @@ def wic_list_subcommand(args, usage_str):
         sys.exit(1)
     set_bitbake_env_lines(bitbake_env_lines)
 
-    if not wic_list(args, scripts_path, options.properties_file):
+    if not engine.wic_list(args, scripts_path, options.properties_file):
         logging.error("Bad list arguments, exiting\n")
         parser.print_help()
         sys.exit(1)
@@ -258,20 +259,20 @@ wic_help_topic_usage = """
 
 subcommands = {
     "create":    [wic_create_subcommand,
-                  wic_create_usage,
-                  wic_create_help],
+                  hlp.wic_create_usage,
+                  hlp.wic_create_help],
     "list":      [wic_list_subcommand,
-                  wic_list_usage,
-                  wic_list_help],
+                  hlp.wic_list_usage,
+                  hlp.wic_list_help],
     "plugins":   [wic_help_topic_subcommand,
                   wic_help_topic_usage,
-                  wic_plugins_help],
-    "overview":   [wic_help_topic_subcommand,
+                  hlp.wic_plugins_help],
+    "overview":  [wic_help_topic_subcommand,
                   wic_help_topic_usage,
-                  wic_overview_help],
-    "kickstart":  [wic_help_topic_subcommand,
+                  hlp.wic_overview_help],
+    "kickstart": [wic_help_topic_subcommand,
                   wic_help_topic_usage,
-                  wic_kickstart_help],
+                  hlp.wic_kickstart_help],
 }
 
 
@@ -281,7 +282,7 @@ def start_logging(loglevel):
 
 def main(argv):
     parser = optparse.OptionParser(version="wic version %s" % __version__,
-                                   usage=wic_usage)
+                                   usage=hlp.wic_usage)
 
     parser.disable_interspersed_args()
 
@@ -293,7 +294,7 @@ def main(argv):
                 parser.print_help()
                 sys.exit(1)
 
-    invoke_subcommand(args, parser, wic_help_usage, subcommands)
+    hlp.invoke_subcommand(args, parser, hlp.wic_help_usage, subcommands)
 
 
 if __name__ == "__main__":
-- 
2.1.4



Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D5ACC6070C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 19:11:22 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 29 Jun 2015 12:11:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,371,1432623600"; d="scan'208";a="719797699"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 29 Jun 2015 12:11:24 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id B21B86A4083;
	Mon, 29 Jun 2015 12:10:44 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jun 2015 22:10:17 +0300
Message-Id: <1435605033-11509-5-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1435605033-11509-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1435605033-11509-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 04/20] wic: Refactor getting bitbake variables
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
X-List-Received-Date: Mon, 29 Jun 2015 19:11:23 -0000

Wic gets bitbake variables by parsing output of 'bitbake -e' command.

This implementation improves this procedure as it runs 'bitbake -e' only
when API is called and does it only once, i.e. in a "lazy" way. As parsing
results are cached 'bitbake -e' is run only once and results are parsed
only once per requested set of variables.

get_bitbake_var became the only API call. It replaces find_artifacts,
find_artifact, find_bitbake_env_lines, get_bitbake_env_lines,
set_bitbake_env_lines and get_line_val calls making API much more clear.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/scripts/lib/image/engine.py b/scripts/lib/image/engine.py
index 47950f8..92dcc5a 100644
--- a/scripts/lib/image/engine.py
+++ b/scripts/lib/image/engine.py
@@ -60,29 +60,6 @@ def verify_build_env():
     return True
 
 
-def find_artifacts(image_name):
-    """
-    Gather the build artifacts for the current image (the image_name
-    e.g. core-image-minimal) for the current MACHINE set in local.conf
-    """
-    bitbake_env_lines = misc.get_bitbake_env_lines()
-
-    rootfs_dir = kernel_dir = bootimg_dir = native_sysroot = ""
-
-    for line in bitbake_env_lines.split('\n'):
-        if misc.get_line_val(line, "IMAGE_ROOTFS"):
-            rootfs_dir = misc.get_line_val(line, "IMAGE_ROOTFS")
-            continue
-        if misc.get_line_val(line, "DEPLOY_DIR_IMAGE"):
-            kernel_dir = misc.get_line_val(line, "DEPLOY_DIR_IMAGE")
-            continue
-        if misc.get_line_val(line, "STAGING_DIR_NATIVE"):
-            native_sysroot = misc.get_line_val(line, "STAGING_DIR_NATIVE")
-            continue
-
-    return (rootfs_dir, kernel_dir, bootimg_dir, native_sysroot)
-
-
 CANNED_IMAGE_DIR = "lib/image/canned-wks" # relative to scripts
 SCRIPTS_CANNED_IMAGE_DIR = "scripts/" + CANNED_IMAGE_DIR
 
diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index 12fbf67..a90712b 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -29,7 +29,7 @@ import os
 
 from wic import msger
 from wic.pluginbase import SourcePlugin
-from wic.utils.oe.misc import find_bitbake_env_lines, find_artifact
+from wic.utils.oe.misc import get_bitbake_var
 
 class RootfsPlugin(SourcePlugin):
     """
@@ -43,12 +43,7 @@ class RootfsPlugin(SourcePlugin):
         if os.path.isdir(rootfs_dir):
             return rootfs_dir
 
-        bitbake_env_lines = find_bitbake_env_lines(rootfs_dir)
-        if not bitbake_env_lines:
-            msg = "Couldn't get bitbake environment, exiting."
-            msger.error(msg)
-
-        image_rootfs_dir = find_artifact(bitbake_env_lines, "IMAGE_ROOTFS")
+        image_rootfs_dir = get_bitbake_var("IMAGE_ROOTFS", rootfs_dir)
         if not os.path.isdir(image_rootfs_dir):
             msg = "No valid artifact IMAGE_ROOTFS from image named"
             msg += " %s has been found at %s, exiting.\n" % \
diff --git a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
index 533eaa7..76e7b03 100644
--- a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
+++ b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
@@ -59,11 +59,7 @@ class RootfsPlugin(SourcePlugin):
         if os.path.isdir(rootfs_dir):
             return rootfs_dir
 
-        bitbake_env_lines = misc.find_bitbake_env_lines(rootfs_dir)
-        if not bitbake_env_lines:
-            msger.error("Couldn't get bitbake environment, exiting.")
-
-        image_rootfs_dir = misc.find_artifact(bitbake_env_lines, "IMAGE_ROOTFS")
+        image_rootfs_dir = misc.get_bitbake_var("IMAGE_ROOTFS", rootfs_dir)
         if not os.path.isdir(image_rootfs_dir):
             msg = "No valid artifact IMAGE_ROOTFS from image named"
             msg += " %s has been found at %s, exiting.\n" % \
diff --git a/scripts/lib/wic/utils/oe/misc.py b/scripts/lib/wic/utils/oe/misc.py
index 2f916dd..5d6dadb 100644
--- a/scripts/lib/wic/utils/oe/misc.py
+++ b/scripts/lib/wic/utils/oe/misc.py
@@ -25,6 +25,8 @@
 # Tom Zanussi <tom.zanussi (at] linux.intel.com>
 #
 
+from collections import defaultdict
+
 from wic import msger
 from wic.utils import runner
 
@@ -108,62 +110,40 @@ def add_wks_var(key, val):
 
 BOOTDD_EXTRA_SPACE = 16384
 
-__bitbake_env_lines = ""
-
-def set_bitbake_env_lines(bitbake_env_lines):
-    global __bitbake_env_lines
-    __bitbake_env_lines = bitbake_env_lines
+_BITBAKE_VARS = defaultdict(dict)
 
-def get_bitbake_env_lines():
-    return __bitbake_env_lines
-
-def find_bitbake_env_lines(image_name):
-    """
-    If image_name is empty, plugins might still be able to use the
-    environment, so set it regardless.
+def get_bitbake_var(var, image=None):
     """
-    if image_name:
-        bitbake_env_cmd = "bitbake -e %s" % image_name
-    else:
-        bitbake_env_cmd = "bitbake -e"
-    rc, bitbake_env_lines = __exec_cmd(bitbake_env_cmd)
-    if rc != 0:
-        print "Couldn't get '%s' output." % bitbake_env_cmd
-        print "Bitbake failed with error:\n%s\n" % bitbake_env_lines
-        return None
-
-    return bitbake_env_lines
-
-def find_artifact(bitbake_env_lines, variable):
+    Get bitbake variable value lazy way, i.e. run
+    'bitbake -e' only when variable is requested.
     """
-    Gather the build artifact for the current image (the image_name
-    e.g. core-image-minimal) for the current MACHINE set in local.conf
-    """
-    retval = ""
-
-    for line in bitbake_env_lines.split('\n'):
-        if get_line_val(line, variable):
-            retval = get_line_val(line, variable)
-            break
-
-    return retval
+    global _BITBAKE_VARS
+
+    if image not in _BITBAKE_VARS:
+        # Get bitbake -e output
+        cmd = "bitbake -e"
+        if image:
+            cmd += " %s" % image
+        rc, lines = __exec_cmd(cmd)
+        if rc:
+            print "Couldn't get '%s' output." % cmd
+            print "Bitbake failed with error:\n%s\n" % lines
+            return
+
+        # Parse bitbake -e output
+        for line in lines.split('\n'):
+            if "=" not in line:
+                continue
+            try:
+                key, val = line.split("=")
+            except ValueError:
+                continue
+            key = key.strip()
+            val = val.strip()
+            if key.replace('_', '').isalnum():
+                _BITBAKE_VARS[image][key] = val.strip('"')
 
-def get_line_val(line, key):
-    """
-    Extract the value from the VAR="val" string
-    """
-    if line.startswith(key + "="):
-        stripped_line = line.split('=')[1]
-        stripped_line = stripped_line.replace('\"', '')
-        return stripped_line
-    return None
-
-def get_bitbake_var(key):
-    for line in __bitbake_env_lines.split('\n'):
-        if get_line_val(line, key):
-            val = get_line_val(line, key)
-            return val
-    return None
+    return _BITBAKE_VARS[image].get(var)
 
 def parse_sourceparams(sourceparams):
     """
diff --git a/scripts/wic b/scripts/wic
index a39ec95..b75d122 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -52,7 +52,7 @@ if bitbake_exe:
 else:
     bitbake_main = None
 
-from wic.utils.oe.misc import find_bitbake_env_lines, set_bitbake_env_lines
+from wic.utils.oe.misc import get_bitbake_var
 from wic.utils.errors import WicError
 from image import engine
 from image import help as hlp
@@ -141,12 +141,6 @@ def wic_create_subcommand(args, usage_str):
         else:
             print "Done.\n"
 
-    bitbake_env_lines = find_bitbake_env_lines(options.image_name)
-    if not bitbake_env_lines:
-        print "Couldn't get bitbake environment, exiting."
-        sys.exit(1)
-    set_bitbake_env_lines(bitbake_env_lines)
-
     bootimg_dir = ""
 
     if options.image_name:
@@ -160,9 +154,10 @@ def wic_create_subcommand(args, usage_str):
                             cookerdata.CookerConfiguration()):
                 sys.exit(1)
 
-        (rootfs_dir, kernel_dir, bootimg_dir, native_sysroot) \
-            = engine.find_artifacts(options.image_name)
-
+        rootfs_dir = get_bitbake_var("IMAGE_ROOTFS", options.image_name)
+        kernel_dir = get_bitbake_var("DEPLOY_DIR_IMAGE", options.image_name)
+        native_sysroot = get_bitbake_var("STAGING_DIR_NATIVE",
+                                         options.image_name)
     else:
         if options.build_rootfs:
             print "Image name is not specified, exiting. (Use -e/--image-name to specify it)\n"
@@ -244,12 +239,6 @@ def wic_list_subcommand(args, usage_str):
 
     (options, args) = parser.parse_args(args)
 
-    bitbake_env_lines = find_bitbake_env_lines(None)
-    if not bitbake_env_lines:
-        print "Couldn't get bitbake environment, exiting."
-        sys.exit(1)
-    set_bitbake_env_lines(bitbake_env_lines)
-
     if not engine.wic_list(args, scripts_path, options.properties_file):
         logging.error("Bad list arguments, exiting\n")
         parser.print_help()
-- 
2.1.4



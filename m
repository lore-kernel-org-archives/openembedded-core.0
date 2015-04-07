Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id BF00F60043
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 09:57:44 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 07 Apr 2015 02:57:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,537,1422950400"; d="scan'208";a="552028155"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 07 Apr 2015 02:57:45 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id B90526A408D;
	Tue,  7 Apr 2015 02:57:22 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Apr 2015 12:57:41 +0300
Message-Id: <1428400661-19372-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] wic: Implement --build-rootfs command line option
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
X-List-Received-Date: Tue, 07 Apr 2015 09:57:44 -0000

-f/--build-rootfs option makes wic to run bitbake <image> to
produce rootfs. This option requires image name to be specified
with -e/--image-name.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/image/help.py | 10 ++++++----
 scripts/wic               | 25 ++++++++++++++++++++++---
 2 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/scripts/lib/image/help.py b/scripts/lib/image/help.py
index e1eb265..e365a07 100644
--- a/scripts/lib/image/help.py
+++ b/scripts/lib/image/help.py
@@ -111,7 +111,7 @@ wic_create_usage = """
             [-i <JSON PROPERTY FILE> | --infile <JSON PROPERTY_FILE>]
             [-e | --image-name] [-s, --skip-build-check] [-D, --debug]
             [-r, --rootfs-dir] [-b, --bootimg-dir]
-            [-k, --kernel-dir] [-n, --native-sysroot]
+            [-k, --kernel-dir] [-n, --native-sysroot] [-f, --build-rootfs]
 
  This command creates an OpenEmbedded image based on the 'OE kickstart
  commands' found in the <wks file>.
@@ -132,7 +132,7 @@ SYNOPSIS
         [-i <JSON PROPERTY FILE> | --infile <JSON PROPERTY_FILE>]
         [-e | --image-name] [-s, --skip-build-check] [-D, --debug]
         [-r, --rootfs-dir] [-b, --bootimg-dir]
-        [-k, --kernel-dir] [-n, --native-sysroot]
+        [-k, --kernel-dir] [-n, --native-sysroot] [-f, --build-rootfs]
 
 DESCRIPTION
     This command creates an OpenEmbedded image based on the 'OE
@@ -167,6 +167,8 @@ DESCRIPTION
     The -n option is used to specify the path to the native sysroot
     containing the tools to use to build the image.
 
+    The -f option is used to build rootfs by running "bitbake <image>"
+
     The -s option is used to skip the build check.  The build check is
     a simple sanity check used to determine whether the user has
     sourced the build environment so that the -e option can operate
@@ -528,8 +530,8 @@ DESCRIPTION
        usage: wic create <wks file or image name> [-o <DIRNAME> | ...]
             [-i <JSON PROPERTY FILE> | --infile <JSON PROPERTY_FILE>]
             [-e | --image-name] [-s, --skip-build-check] [-D, --debug]
-            [-r, --rootfs-dir] [-b, --bootimg-dir]
-            [-k, --kernel-dir] [-n, --native-sysroot]
+            [-r, --rootfs-dir] [-b, --bootimg-dir] [-k, --kernel-dir]
+            [-n, --native-sysroot] [-f, --build-rootfs]
 
        This command creates an OpenEmbedded image based on the 'OE
        kickstart commands' found in the <wks file>.
diff --git a/scripts/wic b/scripts/wic
index e7df60f..feff302 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -40,11 +40,15 @@ import logging
 # External modules
 scripts_path = os.path.abspath(os.path.dirname(os.path.abspath(sys.argv[0])))
 lib_path = scripts_path + '/lib'
-sys.path = sys.path + [lib_path]
+bitbake_path = os.path.join(scripts_path, '../bitbake/lib')
+sys.path = sys.path + [lib_path, bitbake_path]
 
 from image.help import *
 from image.engine import *
 
+from bb import cookerdata
+from bb.main import bitbake_main, BitBakeConfigParameters
+
 def rootfs_dir_to_args(krootfs_dir):
     """
     Get a rootfs_dir dict and serialize to string
@@ -94,6 +98,7 @@ def wic_create_subcommand(args, usage_str):
                       action = "store", help = "path to the native sysroot containing the tools to use to build the image")
     parser.add_option("-p", "--skip-build-check", dest = "build_check",
                       action = "store_false", default = True, help = "skip the build check")
+    parser.add_option("-f", "--build-rootfs", action="store_true", help = "build rootfs")
     parser.add_option("-D", "--debug", dest = "debug", action = "store_true",
                       default = False, help = "output debug information")
 
@@ -123,8 +128,6 @@ def wic_create_subcommand(args, usage_str):
         else:
             print "Done.\n"
 
-    print "Creating image(s)...\n"
-
     bitbake_env_lines = find_bitbake_env_lines(options.image_name)
     if not bitbake_env_lines:
         print "Couldn't get bitbake environment, exiting."
@@ -134,9 +137,24 @@ def wic_create_subcommand(args, usage_str):
     bootimg_dir = ""
 
     if options.image_name:
+        if options.build_rootfs:
+            argv = ["bitbake", options.image_name]
+            if options.debug:
+                argv.append("--debug")
+
+            print "Building rootfs...\n"
+            if bitbake_main(BitBakeConfigParameters(argv),
+                            cookerdata.CookerConfiguration()):
+                sys.exit(1)
+
         (rootfs_dir, kernel_dir, bootimg_dir, native_sysroot) \
             = find_artifacts(options.image_name)
 
+    else:
+        if options.build_rootfs:
+            print "Image name is not specified, exiting. (Use -e/--image-name to specify it)\n"
+            sys.exit(1)
+
     wks_file = args[0]
 
     if not wks_file.endswith(".wks"):
@@ -194,6 +212,7 @@ def wic_create_subcommand(args, usage_str):
 
     rootfs_dir = rootfs_dir_to_args(krootfs_dir)
 
+    print "Creating image(s)...\n"
     wic_create(args, wks_file, rootfs_dir, bootimg_dir, kernel_dir,
                native_sysroot, scripts_path, image_output_dir,
                options.debug, options.properties_file)
-- 
2.1.4



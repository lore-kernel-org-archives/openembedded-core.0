Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 464186AC37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 23:34:58 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Oct 2017 16:34:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,433,1503385200"; d="scan'208";a="327784094"
Received: from swold-mobl2.jf.intel.com ([10.24.8.86])
	by fmsmga004.fm.intel.com with ESMTP; 25 Oct 2017 16:34:56 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Wed, 25 Oct 2017 16:34:56 -0700
Message-Id: <20171025233456.19951-1-sgw@linux.intel.com>
X-Mailer: git-send-email 2.13.5
Subject: [PATCH] wic: Subcommands now use a common verify_native_sysroot()
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
X-List-Received-Date: Wed, 25 Oct 2017 23:34:59 -0000

Change the parsing order so that --vars and --native-sysroot can be
available to all subcommands, this also allows us to use a single
function to verify or build the wic-tools native-sysroot needed for
the commands, to ensure we don't use the possibly bad host commands.

[YOCTO #12173]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 scripts/wic | 51 ++++++++++++++++++++++++++++-----------------------
 1 file changed, 28 insertions(+), 23 deletions(-)

diff --git a/scripts/wic b/scripts/wic
index 097084a6033..3b4e2df86a5 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -105,6 +105,23 @@ class RootfsArgAction(argparse.Action):
 
         namespace.__dict__['rootfs_dir'][key] = rootfs_dir
 
+def verify_native_sysroot(options):
+    if options.vars_dir:
+        BB_VARS.vars_dir = options.vars_dir
+
+    if options.native_sysroot:
+        native_sysroot = options.native_sysroot
+    else:
+        native_sysroot = get_bitbake_var("RECIPE_SYSROOT_NATIVE", "wic-tools")
+
+    if not native_sysroot or not os.path.isdir(native_sysroot):
+        logger.info("Building wic-tools...\n")
+        if bitbake_main(BitBakeConfigParameters("bitbake wic-tools".split()),
+                        cookerdata.CookerConfiguration()):
+            raise WicError("bitbake wic-tools failed")
+
+    if not native_sysroot:
+        raise WicError("Unable to find the location of the native tools sysroot")
 
 def wic_create_subcommand(options, usage_str):
     """
@@ -164,15 +181,7 @@ def wic_create_subcommand(options, usage_str):
                            "(Use -e/--image-name to specify it)")
         native_sysroot = options.native_sysroot
 
-    if not options.vars_dir and (not native_sysroot or not os.path.isdir(native_sysroot)):
-        logger.info("Building wic-tools...\n")
-        if bitbake_main(BitBakeConfigParameters("bitbake wic-tools".split()),
-                        cookerdata.CookerConfiguration()):
-            raise WicError("bitbake wic-tools failed")
-        native_sysroot = get_bitbake_var("RECIPE_SYSROOT_NATIVE", "wic-tools")
-
-    if not native_sysroot:
-        raise WicError("Unable to find the location of the native tools sysroot")
+    verify_native_sysroot(options)
 
     wks_file = options.wks_file
 
@@ -241,6 +250,7 @@ def wic_ls_subcommand(args, usage_str):
     Command-line handling for list content of images.
     The real work is done by engine.wic_ls()
     """
+    verify_native_sysroot(args)
     engine.wic_ls(args, args.native_sysroot)
 
 def wic_cp_subcommand(args, usage_str):
@@ -248,6 +258,7 @@ def wic_cp_subcommand(args, usage_str):
     Command-line handling for copying files/dirs to images.
     The real work is done by engine.wic_cp()
     """
+    verify_native_sysroot(args)
     engine.wic_cp(args, args.native_sysroot)
 
 def wic_rm_subcommand(args, usage_str):
@@ -255,6 +266,7 @@ def wic_rm_subcommand(args, usage_str):
     Command-line handling for removing files/dirs from images.
     The real work is done by engine.wic_rm()
     """
+    verify_native_sysroot(args)
     engine.wic_rm(args, args.native_sysroot)
 
 def wic_write_subcommand(args, usage_str):
@@ -262,6 +274,7 @@ def wic_write_subcommand(args, usage_str):
     Command-line handling for writing images.
     The real work is done by engine.wic_write()
     """
+    verify_native_sysroot(args)
     engine.wic_write(args, args.native_sysroot)
 
 def wic_help_subcommand(args, usage_str):
@@ -332,9 +345,6 @@ def wic_init_parser_create(subparser):
     subparser.add_argument("-k", "--kernel-dir", dest="kernel_dir",
                       help="path to the dir containing the kernel to use "
                            "in the .wks bootimg")
-    subparser.add_argument("-n", "--native-sysroot", dest="native_sysroot",
-                      help="path to the native sysroot containing the tools "
-                           "to use to build the image")
     subparser.add_argument("-s", "--skip-build-check", dest="build_check",
                       action="store_false", default=True, help="skip the build check")
     subparser.add_argument("-f", "--build-rootfs", action="store_true", help="build rootfs")
@@ -344,9 +354,6 @@ def wic_init_parser_create(subparser):
     subparser.add_argument("-m", "--bmap", action="store_true", help="generate .bmap")
     subparser.add_argument("--no-fstab-update" ,action="store_true",
                       help="Do not change fstab file.")
-    subparser.add_argument("-v", "--vars", dest='vars_dir',
-                      help="directory with <image>.env files that store "
-                           "bitbake variables")
     subparser.add_argument("-D", "--debug", dest="debug", action="store_true",
                       default=False, help="output debug information")
     return
@@ -386,8 +393,6 @@ def imgtype(arg):
 def wic_init_parser_ls(subparser):
     subparser.add_argument("path", type=imgtype,
                         help="image spec: <image>[:<vfat partition>[<path>]]")
-    subparser.add_argument("-n", "--native-sysroot",
-                        help="path to the native sysroot containing the tools")
 
 def imgpathtype(arg):
     img = imgtype(arg)
@@ -400,14 +405,10 @@ def wic_init_parser_cp(subparser):
                         help="source spec")
     subparser.add_argument("dest", type=imgpathtype,
                         help="image spec: <image>:<vfat partition>[<path>]")
-    subparser.add_argument("-n", "--native-sysroot",
-                        help="path to the native sysroot containing the tools")
 
 def wic_init_parser_rm(subparser):
     subparser.add_argument("path", type=imgpathtype,
                         help="path: <image>:<vfat partition><path>")
-    subparser.add_argument("-n", "--native-sysroot",
-                        help="path to the native sysroot containing the tools")
 
 def expandtype(rules):
     """
@@ -447,8 +448,6 @@ def wic_init_parser_write(subparser):
                         help="target file or device")
     subparser.add_argument("-e", "--expand", type=expandtype,
                         help="expand rules: auto or <partition>:<size>[,<partition>:<size>]")
-    subparser.add_argument("-n", "--native-sysroot",
-                        help="path to the native sysroot containing the tools")
 
 def wic_init_parser_help(subparser):
     helpparsers = subparser.add_subparsers(dest='help_topic', help=hlp.wic_usage)
@@ -490,6 +489,12 @@ subcommands = {
 
 
 def init_parser(parser):
+    parser.add_argument("-v", "--vars", dest='vars_dir',
+                      help="directory with <image>.env files that store "
+                           "bitbake variables")
+    parser.add_argument("-n", "--native-sysroot", dest="native_sysroot",
+                      help="path to the native sysroot containing the tools "
+                           "needed to build the image")
     parser.add_argument("--version", action="version",
         version="%(prog)s {version}".format(version=__version__))
     subparsers = parser.add_subparsers(dest='command', help=hlp.wic_usage)
-- 
2.13.5



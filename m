Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B1D7571E4A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 09:02:27 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Feb 2017 01:02:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,165,1484035200"; d="scan'208";a="821115545"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 15 Feb 2017 01:01:59 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 665376A4082
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 01:00:57 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Feb 2017 10:38:30 +0200
Message-Id: <292004a7420e9f864ef78d1044ddc85057e6dad6.1487110279.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1487110279.git.ed.bartosh@linux.intel.com>
References: <cover.1487110279.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 07/11] wic: raise WicError in main module
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
X-List-Received-Date: Wed, 15 Feb 2017 09:02:27 -0000

Replaced sys.exit with raising WicError in main module.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/wic | 56 +++++++++++++++++++++++---------------------------------
 1 file changed, 23 insertions(+), 33 deletions(-)

diff --git a/scripts/wic b/scripts/wic
index b12c743..b8be5b8 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -140,13 +140,11 @@ def wic_create_subcommand(args, usage_str):
     (options, args) = parser.parse_args(args)
 
     if len(args) != 1:
-        logger.error("Wrong number of arguments, exiting\n")
         parser.print_help()
-        sys.exit(1)
+        raise WicError("Wrong number of arguments, exiting")
 
     if options.build_rootfs and not bitbake_main:
-        logger.error("Can't build roofs as bitbake is not in the $PATH")
-        sys.exit(1)
+        raise WicError("Can't build roofs as bitbake is not in the $PATH")
 
     if not options.image_name:
         missed = []
@@ -157,9 +155,8 @@ def wic_create_subcommand(args, usage_str):
             if not val:
                 missed.append(opt)
         if missed:
-            logger.error("The following build artifacts are not specified: %s",
-                         ", ".join(missed))
-            sys.exit(1)
+            raise WicError("The following build artifacts are not specified: %s" %
+                           ", ".join(missed))
 
     if options.image_name:
         BB_VARS.default_image = options.image_name
@@ -170,8 +167,7 @@ def wic_create_subcommand(args, usage_str):
         BB_VARS.vars_dir = options.vars_dir
 
     if options.build_check and not engine.verify_build_env():
-        logger.error("Couldn't verify build environment, exiting\n")
-        sys.exit(1)
+        raise WicError("Couldn't verify build environment, exiting")
 
     bootimg_dir = ""
 
@@ -187,7 +183,7 @@ def wic_create_subcommand(args, usage_str):
             logger.info("Building rootfs...\n")
             if bitbake_main(BitBakeConfigParameters(argv),
                             cookerdata.CookerConfiguration()):
-                sys.exit(1)
+                raise WicError("bitbake exited with error")
 
         rootfs_dir = get_bitbake_var("IMAGE_ROOTFS", options.image_name)
         kernel_dir = get_bitbake_var("DEPLOY_DIR_IMAGE", options.image_name)
@@ -195,29 +191,28 @@ def wic_create_subcommand(args, usage_str):
                                          "wic-tools", cache=False)
     else:
         if options.build_rootfs:
-            logger.error("Image name is not specified, exiting. (Use -e/--image-name to specify it)\n")
-            sys.exit(1)
+            raise WicError("Image name is not specified, exiting. "
+                           "(Use -e/--image-name to specify it)")
         native_sysroot = options.native_sysroot
 
     if not native_sysroot or not os.path.isdir(native_sysroot):
         logger.info("Building wic-tools...\n")
         if bitbake_main(BitBakeConfigParameters("bitbake wic-tools".split()),
                         cookerdata.CookerConfiguration()):
-            sys.exit(1)
+            raise WicError("bitbake wic-tools failed")
         native_sysroot = get_bitbake_var("RECIPE_SYSROOT_NATIVE", "wic-tools")
         if not native_sysroot:
-            logger.info("Unable to find the location of the native tools sysroot to use\n")
-            sys.exit(1)
+            raise WicError("Unable to find the location of the native "
+                           "tools sysroot to use")
 
     wks_file = args[0]
 
     if not wks_file.endswith(".wks"):
         wks_file = engine.find_canned_image(scripts_path, wks_file)
         if not wks_file:
-            logger.error("No image named %s found, exiting.  (Use 'wic list images' "\
-                  "to list available images, or specify a fully-qualified OE "\
-                  "kickstart (.wks) filename)\n" % args[0])
-            sys.exit(1)
+            raise WicError("No image named %s found, exiting.  (Use 'wic list images' "
+                           "to list available images, or specify a fully-qualified OE "
+                           "kickstart (.wks) filename)" % args[0])
 
     if not options.image_name:
         rootfs_dir = ''
@@ -227,17 +222,13 @@ def wic_create_subcommand(args, usage_str):
         kernel_dir = options.kernel_dir
         native_sysroot = options.native_sysroot
         if rootfs_dir and not os.path.isdir(rootfs_dir):
-            logger.error("--roofs-dir (-r) not found, exiting\n")
-            sys.exit(1)
+            raise WicError("--roofs-dir (-r) not found, exiting")
         if not os.path.isdir(bootimg_dir):
-            logger.error("--bootimg-dir (-b) not found, exiting\n")
-            sys.exit(1)
+            raise WicError("--bootimg-dir (-b) not found, exiting")
         if not os.path.isdir(kernel_dir):
-            logger.error("--kernel-dir (-k) not found, exiting\n")
-            sys.exit(1)
+            raise WicError("--kernel-dir (-k) not found, exiting")
         if not os.path.isdir(native_sysroot):
-            logger.error("--native-sysroot (-n) not found, exiting\n")
-            sys.exit(1)
+            raise WicError("--native-sysroot (-n) not found, exiting")
     else:
         not_found = not_found_dir = ""
         if not os.path.isdir(rootfs_dir):
@@ -249,12 +240,11 @@ def wic_create_subcommand(args, usage_str):
         if not_found:
             if not not_found_dir:
                 not_found_dir = "Completely missing artifact - wrong image (.wks) used?"
-            logger.error("Build artifacts not found, exiting.")
+            logger.info("Build artifacts not found, exiting.")
             logger.info("  (Please check that the build artifacts for the machine")
             logger.info("   selected in local.conf actually exist and that they")
             logger.info("   are the correct artifacts for the image (.wks file)).\n")
-            logger.info("The artifact that couldn't be found was %s:\n  %s", not_found, not_found_dir)
-            sys.exit(1)
+            raise WicError("The artifact that couldn't be found was %s:\n  %s", not_found, not_found_dir)
 
     krootfs_dir = options.rootfs_dir
     if krootfs_dir is None:
@@ -277,9 +267,8 @@ def wic_list_subcommand(args, usage_str):
     args = parser.parse_args(args)[1]
 
     if not engine.wic_list(args, scripts_path):
-        logger.error("Bad list arguments, exiting\n")
         parser.print_help()
-        sys.exit(1)
+        raise WicError("Bad list arguments, exiting")
 
 
 def wic_help_topic_subcommand(args, usage_str):
@@ -326,7 +315,7 @@ def main(argv):
         if args[0] == "help":
             if len(args) == 1:
                 parser.print_help()
-                sys.exit(1)
+                raise WicError("help command requires parameter")
 
     return hlp.invoke_subcommand(args, parser, hlp.wic_help_usage, subcommands)
 
@@ -335,5 +324,6 @@ if __name__ == "__main__":
     try:
         sys.exit(main(sys.argv[1:]))
     except WicError as err:
+        print()
         logger.error(err)
         sys.exit(1)
-- 
2.1.4



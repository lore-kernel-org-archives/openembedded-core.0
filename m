Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id E090477248
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 09:01:38 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Feb 2017 01:01:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,165,1484035200"; d="scan'208";a="66005616"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 15 Feb 2017 01:01:39 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 8BFD36A4006
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 01:00:36 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Feb 2017 10:38:24 +0200
Message-Id: <063d07ba0c67792dd3dea5086ea58ed21ab763e5.1487110279.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1487110279.git.ed.bartosh@linux.intel.com>
References: <cover.1487110279.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 01/11] wic: setup logging in the main wic module
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
X-List-Received-Date: Wed, 15 Feb 2017 09:01:39 -0000

Set up wic logger using standerd logging module.
This is going to replace custom msger module.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/wic | 77 +++++++++++++++++++++++++++++++++++--------------------------
 1 file changed, 44 insertions(+), 33 deletions(-)

diff --git a/scripts/wic b/scripts/wic
index 1b7d7df..f3e93da 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -56,6 +56,23 @@ from wic.utils.errors import WicError
 from wic import engine
 from wic import help as hlp
 
+
+def wic_logger():
+    """Create and convfigure wic logger."""
+    logger = logging.getLogger('wic')
+    logger.setLevel(logging.INFO)
+
+    handler = logging.StreamHandler()
+
+    formatter = logging.Formatter('%(levelname)s: %(message)s')
+    handler.setFormatter(formatter)
+
+    logger.addHandler(handler)
+
+    return logger
+
+logger = wic_logger()
+
 def rootfs_dir_to_args(krootfs_dir):
     """
     Get a rootfs_dir dict and serialize to string
@@ -123,12 +140,12 @@ def wic_create_subcommand(args, usage_str):
     (options, args) = parser.parse_args(args)
 
     if len(args) != 1:
-        logging.error("Wrong number of arguments, exiting\n")
+        logger.error("Wrong number of arguments, exiting\n")
         parser.print_help()
         sys.exit(1)
 
     if options.build_rootfs and not bitbake_main:
-        logging.error("Can't build roofs as bitbake is not in the $PATH")
+        logger.error("Can't build roofs as bitbake is not in the $PATH")
         sys.exit(1)
 
     if not options.image_name:
@@ -140,8 +157,8 @@ def wic_create_subcommand(args, usage_str):
             if not val:
                 missed.append(opt)
         if missed:
-            print("The following build artifacts are not specified:")
-            print("  " + ", ".join(missed))
+            logger.error("The following build artifacts are not specified: %s",
+                         ", ".join(missed))
             sys.exit(1)
 
     if options.image_name:
@@ -152,23 +169,22 @@ def wic_create_subcommand(args, usage_str):
     if options.vars_dir:
         BB_VARS.vars_dir = options.vars_dir
 
-    if options.build_check:
-        print("Checking basic build environment...")
-        if not engine.verify_build_env():
-            print("Couldn't verify build environment, exiting\n")
-            sys.exit(1)
-        else:
-            print("Done.\n")
+    if options.build_check and not engine.verify_build_env():
+        logger.error("Couldn't verify build environment, exiting\n")
+        sys.exit(1)
 
     bootimg_dir = ""
 
+    if options.debug:
+        logger.setLevel(logging.DEBUG)
+
     if options.image_name:
         if options.build_rootfs:
             argv = ["bitbake", options.image_name]
             if options.debug:
                 argv.append("--debug")
 
-            print("Building rootfs...\n")
+            logger.info("Building rootfs...\n")
             if bitbake_main(BitBakeConfigParameters(argv),
                             cookerdata.CookerConfiguration()):
                 sys.exit(1)
@@ -179,18 +195,18 @@ def wic_create_subcommand(args, usage_str):
                                          "wic-tools", cache=False)
     else:
         if options.build_rootfs:
-            print("Image name is not specified, exiting. (Use -e/--image-name to specify it)\n")
+            logger.error("Image name is not specified, exiting. (Use -e/--image-name to specify it)\n")
             sys.exit(1)
         native_sysroot = options.native_sysroot
 
     if not native_sysroot or not os.path.isdir(native_sysroot):
-        print("Building wic-tools...\n")
+        logger.info("Building wic-tools...\n")
         if bitbake_main(BitBakeConfigParameters("bitbake wic-tools".split()),
                         cookerdata.CookerConfiguration()):
             sys.exit(1)
         native_sysroot = get_bitbake_var("RECIPE_SYSROOT_NATIVE", "wic-tools")
         if not native_sysroot:
-            print("Unable to find the location of the native tools sysroot to use\n")
+            logger.info("Unable to find the location of the native tools sysroot to use\n")
             sys.exit(1)
 
     wks_file = args[0]
@@ -198,7 +214,7 @@ def wic_create_subcommand(args, usage_str):
     if not wks_file.endswith(".wks"):
         wks_file = engine.find_canned_image(scripts_path, wks_file)
         if not wks_file:
-            print("No image named %s found, exiting.  (Use 'wic list images' "\
+            logger.error("No image named %s found, exiting.  (Use 'wic list images' "\
                   "to list available images, or specify a fully-qualified OE "\
                   "kickstart (.wks) filename)\n" % args[0])
             sys.exit(1)
@@ -211,16 +227,16 @@ def wic_create_subcommand(args, usage_str):
         kernel_dir = options.kernel_dir
         native_sysroot = options.native_sysroot
         if rootfs_dir and not os.path.isdir(rootfs_dir):
-            print("--roofs-dir (-r) not found, exiting\n")
+            logger.error("--roofs-dir (-r) not found, exiting\n")
             sys.exit(1)
         if not os.path.isdir(bootimg_dir):
-            print("--bootimg-dir (-b) not found, exiting\n")
+            logger.error("--bootimg-dir (-b) not found, exiting\n")
             sys.exit(1)
         if not os.path.isdir(kernel_dir):
-            print("--kernel-dir (-k) not found, exiting\n")
+            logger.error("--kernel-dir (-k) not found, exiting\n")
             sys.exit(1)
         if not os.path.isdir(native_sysroot):
-            print("--native-sysroot (-n) not found, exiting\n")
+            logger.error("--native-sysroot (-n) not found, exiting\n")
             sys.exit(1)
     else:
         not_found = not_found_dir = ""
@@ -233,12 +249,11 @@ def wic_create_subcommand(args, usage_str):
         if not_found:
             if not not_found_dir:
                 not_found_dir = "Completely missing artifact - wrong image (.wks) used?"
-            print("Build artifacts not found, exiting.")
-            print("  (Please check that the build artifacts for the machine")
-            print("   selected in local.conf actually exist and that they")
-            print("   are the correct artifacts for the image (.wks file)).\n")
-            print("The artifact that couldn't be found was %s:\n  %s" % \
-                (not_found, not_found_dir))
+            logger.error("Build artifacts not found, exiting.")
+            logger.info("  (Please check that the build artifacts for the machine")
+            logger.info("   selected in local.conf actually exist and that they")
+            logger.info("   are the correct artifacts for the image (.wks file)).\n")
+            logger.info("The artifact that couldn't be found was %s:\n  %s", not_found, not_found_dir)
             sys.exit(1)
 
     krootfs_dir = options.rootfs_dir
@@ -248,7 +263,7 @@ def wic_create_subcommand(args, usage_str):
 
     rootfs_dir = rootfs_dir_to_args(krootfs_dir)
 
-    print("Creating image(s)...\n")
+    logger.info("Creating image(s)...\n")
     engine.wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
                       native_sysroot, options)
 
@@ -262,7 +277,7 @@ def wic_list_subcommand(args, usage_str):
     args = parser.parse_args(args)[1]
 
     if not engine.wic_list(args, scripts_path):
-        logging.error("Bad list arguments, exiting\n")
+        logger.error("Bad list arguments, exiting\n")
         parser.print_help()
         sys.exit(1)
 
@@ -299,10 +314,6 @@ subcommands = {
 }
 
 
-def start_logging(loglevel):
-    logging.basicConfig(filename='wic.log', filemode='w', level=loglevel)
-
-
 def main(argv):
     parser = optparse.OptionParser(version="wic version %s" % __version__,
                                    usage=hlp.wic_usage)
@@ -324,6 +335,6 @@ if __name__ == "__main__":
     try:
         sys.exit(main(sys.argv[1:]))
     except WicError as err:
-        print("ERROR:", err, file=sys.stderr)
+        logger.error(err)
         sys.exit(1)
 
-- 
2.1.4



Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9423773194
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 15:26:42 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 04 May 2016 08:26:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,577,1455004800"; d="scan'208";a="972536199"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 04 May 2016 08:26:43 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 5B79B6A4007
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 09:14:15 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 May 2016 16:06:14 +0300
Message-Id: <0fe4123e79143ae08ea5cea28b78bbcbe26ccc9d.1462365339.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1462365339.git.ed.bartosh@linux.intel.com>
References: <cover.1462365339.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1462365339.git.ed.bartosh@linux.intel.com>
References: <cover.1462365339.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 01/14] wic: replace print statements with print function
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
X-List-Received-Date: Wed, 04 May 2016 15:26:43 -0000

Print statements have been replaced with print function in
Python 3. Replaced them in wic code to be able to run it
under both Python 2 and Python 3.

[YOCTO #9412]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/engine.py        | 20 +++++++++----------
 scripts/lib/wic/help.py          |  2 +-
 scripts/lib/wic/utils/oe/misc.py |  8 ++++----
 scripts/wic                      | 43 ++++++++++++++++++++--------------------
 4 files changed, 37 insertions(+), 36 deletions(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 76b93e8..5d35c46 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -44,7 +44,7 @@ def verify_build_env():
     Returns True if it is, false otherwise
     """
     if not os.environ.get("BUILDDIR"):
-        print "BUILDDIR not found, exiting. (Did you forget to source oe-init-build-env?)"
+        print("BUILDDIR not found, exiting. (Did you forget to source oe-init-build-env?)")
         sys.exit(1)
 
     return True
@@ -107,7 +107,7 @@ def list_canned_images(scripts_path):
                                 desc = line[idx + len("short-description:"):].strip()
                                 break
                     basename = os.path.splitext(fname)[0]
-                    print "  %s\t\t%s" % (basename.ljust(30), desc)
+                    print("  %s\t\t%s" % (basename.ljust(30), desc))
 
 
 def list_canned_image_help(scripts_path, fullpath):
@@ -120,15 +120,15 @@ def list_canned_image_help(scripts_path, fullpath):
             if not found:
                 idx = line.find("long-description:")
                 if idx != -1:
-                    print
-                    print line[idx + len("long-description:"):].strip()
+                    print()
+                    print(line[idx + len("long-description:"):].strip())
                     found = True
                 continue
             if not line.strip():
                 break
             idx = line.find("#")
             if idx != -1:
-                print line[idx + len("#:"):].rstrip()
+                print(line[idx + len("#:"):].rstrip())
             else:
                 break
 
@@ -140,7 +140,7 @@ def list_source_plugins():
     plugins = pluginmgr.get_source_plugins()
 
     for plugin in plugins:
-        print "  %s" % plugin
+        print("  %s" % plugin)
 
 
 def wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
@@ -178,7 +178,7 @@ def wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
     try:
         oe_builddir = os.environ["BUILDDIR"]
     except KeyError:
-        print "BUILDDIR not found, exiting. (Did you forget to source oe-init-build-env?)"
+        print("BUILDDIR not found, exiting. (Did you forget to source oe-init-build-env?)")
         sys.exit(1)
 
     if debug:
@@ -189,7 +189,7 @@ def wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
     crobj.main(["direct", native_sysroot, kernel_dir, bootimg_dir, rootfs_dir,
                 wks_file, image_output_dir, oe_builddir, compressor or ""])
 
-    print "\nThe image(s) were created using OE kickstart file:\n  %s" % wks_file
+    print("\nThe image(s) were created using OE kickstart file:\n  %s" % wks_file)
 
 
 def wic_list(args, scripts_path):
@@ -209,10 +209,10 @@ def wic_list(args, scripts_path):
         wks_file = args[0]
         fullpath = find_canned_image(scripts_path, wks_file)
         if not fullpath:
-            print "No image named %s found, exiting. "\
+            print("No image named %s found, exiting. "\
                   "(Use 'wic list images' to list available images, or "\
                   "specify a fully-qualified OE kickstart (.wks) "\
-                  "filename)\n" % wks_file
+                  "filename)\n" % wks_file)
             sys.exit(1)
         list_canned_image_help(scripts_path, fullpath)
         return True
diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 394e3fd..158b6c1 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -55,7 +55,7 @@ def wic_help(args, usage_str, subcommands):
     Subcommand help dispatcher.
     """
     if len(args) == 1 or not display_help(args[1], subcommands):
-        print usage_str
+        print(usage_str)
 
 
 def get_wic_plugins_help():
diff --git a/scripts/lib/wic/utils/oe/misc.py b/scripts/lib/wic/utils/oe/misc.py
index a3cbe5f..11209be 100644
--- a/scripts/lib/wic/utils/oe/misc.py
+++ b/scripts/lib/wic/utils/oe/misc.py
@@ -187,8 +187,8 @@ class BitbakeVars(defaultdict):
                         for line in varsfile:
                             self._parse_line(line, image)
                 else:
-                    print "Couldn't get bitbake variable from %s." % fname
-                    print "File %s doesn't exist." % fname
+                    print("Couldn't get bitbake variable from %s." % fname)
+                    print("File %s doesn't exist." % fname)
                     return
             else:
                 # Get bitbake -e output
@@ -202,8 +202,8 @@ class BitbakeVars(defaultdict):
                 msger.set_loglevel(log_level)
 
                 if ret:
-                    print "Couldn't get '%s' output." % cmd
-                    print "Bitbake failed with error:\n%s\n" % lines
+                    print("Couldn't get '%s' output." % cmd)
+                    print("Bitbake failed with error:\n%s\n" % lines)
                     return
 
                 # Parse bitbake -e output
diff --git a/scripts/wic b/scripts/wic
index 2286f20..11c8316 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -28,6 +28,7 @@
 # AUTHORS
 # Tom Zanussi <tom.zanussi (at] linux.intel.com>
 #
+from __future__ import print_function
 
 __version__ = "0.2.0"
 
@@ -140,8 +141,8 @@ def wic_create_subcommand(args, usage_str):
             if not val:
                 missed.append(opt)
         if missed:
-            print "The following build artifacts are not specified:"
-            print "  " + ", ".join(missed)
+            print("The following build artifacts are not specified:")
+            print("  " + ", ".join(missed))
             sys.exit(1)
 
     if options.image_name:
@@ -153,12 +154,12 @@ def wic_create_subcommand(args, usage_str):
         BB_VARS.vars_dir = options.vars_dir
 
     if options.build_check:
-        print "Checking basic build environment..."
+        print("Checking basic build environment...")
         if not engine.verify_build_env():
-            print "Couldn't verify build environment, exiting\n"
+            print("Couldn't verify build environment, exiting\n")
             sys.exit(1)
         else:
-            print "Done.\n"
+            print("Done.\n")
 
     bootimg_dir = ""
 
@@ -168,7 +169,7 @@ def wic_create_subcommand(args, usage_str):
             if options.debug:
                 argv.append("--debug")
 
-            print "Building rootfs...\n"
+            print("Building rootfs...\n")
             if bitbake_main(BitBakeConfigParameters(argv),
                             cookerdata.CookerConfiguration()):
                 sys.exit(1)
@@ -179,7 +180,7 @@ def wic_create_subcommand(args, usage_str):
                                          options.image_name)
     else:
         if options.build_rootfs:
-            print "Image name is not specified, exiting. (Use -e/--image-name to specify it)\n"
+            print("Image name is not specified, exiting. (Use -e/--image-name to specify it)\n")
             sys.exit(1)
 
     wks_file = args[0]
@@ -187,9 +188,9 @@ def wic_create_subcommand(args, usage_str):
     if not wks_file.endswith(".wks"):
         wks_file = engine.find_canned_image(scripts_path, wks_file)
         if not wks_file:
-            print "No image named %s found, exiting.  (Use 'wic list images' "\
+            print("No image named %s found, exiting.  (Use 'wic list images' "\
                   "to list available images, or specify a fully-qualified OE "\
-                  "kickstart (.wks) filename)\n" % args[0]
+                  "kickstart (.wks) filename)\n" % args[0])
             sys.exit(1)
 
     image_output_dir = ""
@@ -204,16 +205,16 @@ def wic_create_subcommand(args, usage_str):
         kernel_dir = options.kernel_dir
         native_sysroot = options.native_sysroot
         if rootfs_dir and not os.path.isdir(rootfs_dir):
-            print "--roofs-dir (-r) not found, exiting\n"
+            print("--roofs-dir (-r) not found, exiting\n")
             sys.exit(1)
         if not os.path.isdir(bootimg_dir):
-            print "--bootimg-dir (-b) not found, exiting\n"
+            print("--bootimg-dir (-b) not found, exiting\n")
             sys.exit(1)
         if not os.path.isdir(kernel_dir):
-            print "--kernel-dir (-k) not found, exiting\n"
+            print("--kernel-dir (-k) not found, exiting\n")
             sys.exit(1)
         if not os.path.isdir(native_sysroot):
-            print "--native-sysroot (-n) not found, exiting\n"
+            print("--native-sysroot (-n) not found, exiting\n")
             sys.exit(1)
     else:
         not_found = not_found_dir = ""
@@ -226,12 +227,12 @@ def wic_create_subcommand(args, usage_str):
         if not_found:
             if not not_found_dir:
                 not_found_dir = "Completely missing artifact - wrong image (.wks) used?"
-            print "Build artifacts not found, exiting."
-            print "  (Please check that the build artifacts for the machine"
-            print "   selected in local.conf actually exist and that they"
-            print "   are the correct artifacts for the image (.wks file)).\n"
-            print "The artifact that couldn't be found was %s:\n  %s" % \
-                (not_found, not_found_dir)
+            print("Build artifacts not found, exiting.")
+            print("  (Please check that the build artifacts for the machine")
+            print("   selected in local.conf actually exist and that they")
+            print("   are the correct artifacts for the image (.wks file)).\n")
+            print("The artifact that couldn't be found was %s:\n  %s" % \
+                (not_found, not_found_dir))
             sys.exit(1)
 
     krootfs_dir = options.rootfs_dir
@@ -241,7 +242,7 @@ def wic_create_subcommand(args, usage_str):
 
     rootfs_dir = rootfs_dir_to_args(krootfs_dir)
 
-    print "Creating image(s)...\n"
+    print("Creating image(s)...\n")
     engine.wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
                       native_sysroot, scripts_path, image_output_dir,
                       options.compressor, options.debug)
@@ -318,6 +319,6 @@ if __name__ == "__main__":
     try:
         sys.exit(main(sys.argv[1:]))
     except WicError as err:
-        print >> sys.stderr, "ERROR:", err
+        print("ERROR:", err, file=sys.stderr)
         sys.exit(1)
 
-- 
2.1.4



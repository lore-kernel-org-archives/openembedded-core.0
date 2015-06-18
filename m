Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2C3CB73306
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 09:02:28 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 18 Jun 2015 02:02:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,638,1427785200"; d="scan'208";a="729809394"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 18 Jun 2015 02:02:29 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 876C92E055B;
	Thu, 18 Jun 2015 02:01:52 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jun 2015 12:01:54 +0300
Message-Id: <1434618114-18021-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1434549161-12235-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1434549161-12235-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [PATCH v2] wic: removed unused command line option
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
X-List-Received-Date: Thu, 18 Jun 2015 09:02:31 -0000

Removed -i/--infile wic command line option.
Removed properties_file and properties arguments of
wic_create function.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/image/engine.py | 7 ++-----
 scripts/lib/image/help.py   | 7 -------
 scripts/wic                 | 8 +++-----
 3 files changed, 5 insertions(+), 17 deletions(-)

diff --git a/scripts/lib/image/engine.py b/scripts/lib/image/engine.py
index c568d69..29099ee 100644
--- a/scripts/lib/image/engine.py
+++ b/scripts/lib/image/engine.py
@@ -178,9 +178,8 @@ def list_source_plugins():
         print "  %s" % plugin
 
 
-def wic_create(args, wks_file, rootfs_dir, bootimg_dir, kernel_dir,
-               native_sysroot, scripts_path, image_output_dir, debug,
-               properties_file, properties=None):
+def wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
+               native_sysroot, scripts_path, image_output_dir, debug):
     """Create image
 
     wks_file - user-defined OE kickstart file
@@ -190,8 +189,6 @@ def wic_create(args, wks_file, rootfs_dir, bootimg_dir, kernel_dir,
     native_sysroot - absolute path to the build's native sysroots dir
     scripts_path - absolute path to /scripts dir
     image_output_dir - dirname to create for image
-    properties_file - use values from this file if nonempty i.e no prompting
-    properties - use values from this string if nonempty i.e no prompting
 
     Normally, the values for the build artifacts values are determined
     by 'wic -e' from the output of the 'bitbake -e' command given an
diff --git a/scripts/lib/image/help.py b/scripts/lib/image/help.py
index 886437b..fe66548 100644
--- a/scripts/lib/image/help.py
+++ b/scripts/lib/image/help.py
@@ -149,7 +149,6 @@ NAME
 
 SYNOPSIS
     wic create <wks file or image name> [-o <DIRNAME> | --outdir <DIRNAME>]
-        [-i <JSON PROPERTY FILE> | --infile <JSON PROPERTY_FILE>]
         [-e | --image-name] [-s, --skip-build-check] [-D, --debug]
         [-r, --rootfs-dir] [-b, --bootimg-dir]
         [-k, --kernel-dir] [-n, --native-sysroot] [-f, --build-rootfs]
@@ -219,12 +218,6 @@ DESCRIPTION
     The -o option can be used to place the image in a directory with a
     different name and location.
 
-    As an alternative to the wks file, the image-specific properties
-    that define the values that will be used to generate a particular
-    image can be specified on the command-line using the -i option and
-    supplying a JSON object consisting of the set of name:value pairs
-    needed by image creation.
-
     The set of properties available for a given image type can be
     listed using the 'wic list' command.
 """
diff --git a/scripts/wic b/scripts/wic
index a38ecc0..7b0c3b2 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -91,8 +91,6 @@ def wic_create_subcommand(args, usage_str):
 
     parser.add_option("-o", "--outdir", dest="outdir",
                       action="store", help="name of directory to create image in")
-    parser.add_option("-i", "--infile", dest="properties_file",
-                      action="store", help="name of file containing the values for image properties as a JSON file")
     parser.add_option("-e", "--image-name", dest="image_name",
                       action="store", help="name of the image to use the artifacts from e.g. core-image-sato")
     parser.add_option("-r", "--rootfs-dir", dest="rootfs_dir",
@@ -132,7 +130,7 @@ def wic_create_subcommand(args, usage_str):
     if not options.image_name:
         options.build_check = False
 
-    if options.build_check and not options.properties_file:
+    if options.build_check:
         print "Checking basic build environment..."
         if not engine.verify_build_env():
             print "Couldn't verify build environment, exiting\n"
@@ -225,9 +223,9 @@ def wic_create_subcommand(args, usage_str):
     rootfs_dir = rootfs_dir_to_args(krootfs_dir)
 
     print "Creating image(s)...\n"
-    engine.wic_create(args, wks_file, rootfs_dir, bootimg_dir, kernel_dir,
+    engine.wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
                       native_sysroot, scripts_path, image_output_dir,
-                      options.debug, options.properties_file)
+                      options.debug)
 
 
 def wic_list_subcommand(args, usage_str):
-- 
2.1.4



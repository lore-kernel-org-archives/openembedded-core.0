Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4DEA865CBB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 19:50:22 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 19 May 2016 12:50:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,335,1459839600"; d="scan'208";a="705895762"
Received: from jhibarra-mobl1.zpn.intel.com ([10.219.17.45])
	by FMSMGA003.fm.intel.com with ESMTP; 19 May 2016 12:50:22 -0700
From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 May 2016 14:51:54 -0500
Message-Id: <1463687514-25018-1-git-send-email-humberto.ibarra.lopez@intel.com>
X-Mailer: git-send-email 2.4.11
Subject: [PATCH] scripts/bitbake-whatchanged: migrate from optparse to argparse
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
X-List-Received-Date: Thu, 19 May 2016 19:50:25 -0000

The script bitbake-whatchanged uses optparse library, which is
deprecated since python 2.7. This migrates to argparse library.

[Yocto #9634]

Signed-off-by: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
---
 scripts/bitbake-whatchanged | 32 ++++++++++++--------------------
 1 file changed, 12 insertions(+), 20 deletions(-)

diff --git a/scripts/bitbake-whatchanged b/scripts/bitbake-whatchanged
index af54d16..a20adb2 100755
--- a/scripts/bitbake-whatchanged
+++ b/scripts/bitbake-whatchanged
@@ -25,7 +25,7 @@ import shutil
 import re
 import warnings
 import subprocess
-from optparse import OptionParser
+import argparse
 
 scripts_path = os.path.abspath(os.path.dirname(os.path.abspath(sys.argv[0])))
 lib_path = scripts_path + '/lib'
@@ -38,6 +38,8 @@ bitbakepath = scriptpath.add_bitbake_lib_path()
 if not bitbakepath:
     sys.stderr.write("Unable to find bitbake by searching parent directory of this script or PATH\n")
     sys.exit(1)
+scriptpath.add_oe_lib_path()
+import argparse_oe
 
 import bb.siggen
 import bb.process
@@ -219,9 +221,7 @@ def main():
     3) Use bb.siggen.compare_sigfiles to diff the old and new stamps
     """
 
-    parser = OptionParser(
-        version = "1.0",
-        usage = """%prog [options] [package ...]
+    parser = argparse_oe.ArgumentParser(usage = """%(prog)s [options] [package ...]
 print what will be done between the current and last builds, for example:
 
     $ bitbake core-image-sato
@@ -236,17 +236,9 @@ Note:
     The "nostamp" task is not included.
 """
 )
-    parser.add_option("-v", "--verbose", help = "print the verbose changes",
-               action = "store_true", dest = "verbose")
-
-    options, args = parser.parse_args(sys.argv)
-
-    verbose = options.verbose
-
-    if len(args) != 2:
-        parser.error("Incorrect number of arguments")
-    else:
-        recipe = args[1]
+    parser.add_argument("recipe", help="recipe to check")
+    parser.add_argument("-v", "--verbose", help = "print the verbose changes", action = "store_true")
+    args = parser.parse_args()
 
     # Get the STAMPS_DIR
     print("Figuring out the STAMPS_DIR ...")
@@ -256,7 +248,7 @@ Note:
     except:
         raise
     if not stampsdir:
-        print("ERROR: No STAMPS_DIR found for '%s'" % recipe, file=sys.stderr)
+        print("ERROR: No STAMPS_DIR found for '%s'" % args.recipe, file=sys.stderr)
         return 2
     stampsdir = stampsdir.rstrip("\n")
     if not os.path.isdir(stampsdir):
@@ -272,7 +264,7 @@ Note:
     try:
         # Generate the new stamps dir
         print("Generating the new stamps ... (need several minutes)")
-        cmdline = "STAMPS_DIR=%s bitbake -S none %s" % (new_stampsdir, recipe)
+        cmdline = "STAMPS_DIR=%s bitbake -S none %s" % (new_stampsdir, args.recipe)
         # FIXME
         # The "bitbake -S" may fail, not fatal error, the stamps will still
         # be generated, this might be a bug of "bitbake -S".
@@ -310,17 +302,17 @@ Note:
         # PV (including PE) and PR changed
         # Let the bb.siggen handle them if verbose
         cnt_rv = {}
-        if not verbose:
+        if not args.verbose:
             for i in ('pv', 'pr'):
                cnt_rv[i] = print_vrchanged(new_recon, old_recon, i)
 
         # Dependencies changed (use bitbake-diffsigs)
-        cnt_dep = print_depchanged(new_recon, old_recon, verbose)
+        cnt_dep = print_depchanged(new_recon, old_recon, args.verbose)
 
         total_changed = cnt_added + (cnt_rv.get('pv') or 0) + (cnt_rv.get('pr') or 0) + cnt_dep
 
         print("\n=== Summary: (%s changed, %s unchanged)" % (total_changed, cnt_unchanged))
-        if verbose:
+        if args.verbose:
             print("Newly added: %s\nDependencies changed: %s\n" % \
                 (cnt_added, cnt_dep))
         else:
-- 
2.4.11



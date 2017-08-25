Return-Path: <daniela.plascencia@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 03F327847C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 18:46:55 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga104.jf.intel.com with ESMTP; 25 Aug 2017 11:46:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,426,1498546800"; d="scan'208";a="304461763"
Received: from dplascen-mobl2.zpn.intel.com ([10.219.128.135])
	by fmsmga004.fm.intel.com with ESMTP; 25 Aug 2017 11:46:56 -0700
From: daniela.plascencia@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Aug 2017 13:49:56 -0500
Message-Id: <1503686996-29982-1-git-send-email-daniela.plascencia@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Cc: Daniela Plascencia <daniela.plascencia@linux.intel.com>
Subject: [PATCH] scripts/buildhistory-diff: use of argparse instead of optparse
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
X-List-Received-Date: Fri, 25 Aug 2017 18:46:56 -0000

From: Daniela Plascencia <daniela.plascencia@linux.intel.com>

Optparse is deprecated since version 2.7 and won't be developed further.
Argparse should be used instead as it provides better tools for parsing
and handling arguments.

[YOCTO #9635]

Signed-off-by: Daniela Plascencia <daniela.plascencia@linux.intel.com>
---
 scripts/buildhistory-diff | 127 ++++++++++++++++++++++++++--------------------
 1 file changed, 72 insertions(+), 55 deletions(-)

diff --git a/scripts/buildhistory-diff b/scripts/buildhistory-diff
index 1b2e0d1..5404297 100755
--- a/scripts/buildhistory-diff
+++ b/scripts/buildhistory-diff
@@ -7,7 +7,7 @@
 
 import sys
 import os
-import optparse
+import argparse
 from distutils.version import LooseVersion
 
 # Ensure PythonGit is installed (buildhistory_analysis needs it)
@@ -17,49 +17,70 @@ except ImportError:
     print("Please install GitPython (python3-git) 0.3.4 or later in order to use this script")
     sys.exit(1)
 
+def get_args_parser():
+    description = "Reports significant differences in the buildhistory repository."
+
+    parser = argparse.ArgumentParser(description=description,
+                                     usage="""
+    %(prog)s [options] [from-revision [to-revision]]
+    (if not specified, from-revision defaults to build-minus-1, and to-revision defaults to HEAD)""")
+
+    parser.add_argument('-p', '--buildhistory-dir',
+                        action='store',
+                        dest='buildhistory_dir',
+                        default='buildhistory/',
+                        help="Specify path to buildhistory directory (defaults to buildhistory/ under cwd)")
+    parser.add_argument('-v', '--report-version',
+                        action='store_true',
+                        dest='report_ver',
+                        default=False,
+                        help="Report changes in PKGE/PKGV/PKGR even when the values are still the default (PE/PV/PR)")
+    parser.add_argument('-a', '--report-all',
+                        action='store_true',
+                        dest='report_all',
+                        default='False',
+                        help="Report all changes, not just the default significant ones")
+    parser.add_argument('-s', '---signatures',
+                        action='store_true',
+                        dest='sigs',
+                        default=False,
+                        help="Report list of signatures differing instead of output")
+    parser.add_argument('-S', '--signatures-with-diff',
+                        action='store_true',
+                        dest='sigsdiff',
+                        default=False,
+                        help="Report on actual signature differences instead of output (requires signature data to have been generated, either by running the actual tasks or using bitbake -S)")
+    parser.add_argument('-e', '--exclude-path',
+                        action='append',
+                        help="Exclude path from the output")
+    parser.add_argument('revisions',
+                        default = ['build-minus-1', 'HEAD'],
+                        nargs='*',
+                        help=argparse.SUPPRESS)
+    return parser
+
 def main():
-    parser = optparse.OptionParser(
-        description = "Reports significant differences in the buildhistory repository.",
-        usage = """
-    %prog [options] [from-revision [to-revision]]
-(if not specified, from-revision defaults to build-minus-1, and to-revision defaults to HEAD)""")
-
-    parser.add_option("-p", "--buildhistory-dir",
-            help = "Specify path to buildhistory directory (defaults to buildhistory/ under cwd)",
-            action="store", dest="buildhistory_dir", default='buildhistory/')
-    parser.add_option("-v", "--report-version",
-            help = "Report changes in PKGE/PKGV/PKGR even when the values are still the default (PE/PV/PR)",
-            action="store_true", dest="report_ver", default=False)
-    parser.add_option("-a", "--report-all",
-            help = "Report all changes, not just the default significant ones",
-            action="store_true", dest="report_all", default=False)
-    parser.add_option("-s", "--signatures",
-            help = "Report list of signatures differing instead of output",
-            action="store_true", dest="sigs", default=False)
-    parser.add_option("-S", "--signatures-with-diff",
-            help = "Report on actual signature differences instead of output (requires signature data to have been generated, either by running the actual tasks or using bitbake -S)",
-            action="store_true", dest="sigsdiff", default=False)
-    parser.add_option("-e", "--exclude-path", action="append",
-            help = "exclude path from the output")
-
-    options, args = parser.parse_args(sys.argv)
-
-    if len(args) > 3:
-        sys.stderr.write('Invalid argument(s) specified: %s\n\n' % ' '.join(args[3:]))
-        parser.print_help()
-        sys.exit(1)
+
+    parser = get_args_parser()
+    args = parser.parse_args()
 
     if LooseVersion(git.__version__) < '0.3.1':
         sys.stderr.write("Version of GitPython is too old, please install GitPython (python-git) 0.3.1 or later in order to use this script\n")
         sys.exit(1)
 
-    if not os.path.exists(options.buildhistory_dir):
-        if options.buildhistory_dir == 'buildhistory/':
+    if len(args.revisions) > 2:
+        sys.stderr.write('Invalid argument(s) specified: %s\n\n' % ' '.join(args.revisions[2:]))
+        parser.print_help()
+
+        sys.exit(1)
+    if not os.path.exists(args.buildhistory_dir):
+        if args.buildhistory_dir == 'buildhistory/':
             cwd = os.getcwd()
             if os.path.basename(cwd) == 'buildhistory':
-                options.buildhistory_dir = cwd
-    if not os.path.exists(options.buildhistory_dir):
-        sys.stderr.write('Buildhistory directory "%s" does not exist\n\n' % options.buildhistory_dir)
+                args.buildhistory_dir = cwd
+
+    if not os.path.exists(args.buildhistory_dir):
+        sys.stderr.write('Buildhistory directory "%s" does not exist\n\n' % args.buildhistory_dir)
         parser.print_help()
         sys.exit(1)
 
@@ -73,32 +94,29 @@ def main():
     scriptpath.add_oe_lib_path()
     # Set path to bitbake lib dir so the buildhistory_analysis module can load bb.utils
     bitbakepath = scriptpath.add_bitbake_lib_path()
+
     if not bitbakepath:
         sys.stderr.write("Unable to find bitbake by searching parent directory of this script or PATH\n")
         sys.exit(1)
 
-    from oe.buildhistory_analysis import process_changes
-
-    fromrev = 'build-minus-1'
-    torev = 'HEAD'
-    if len(args) > 1:
-        if len(args) == 2 and '..' in args[1]:
-            revs = args[1].split('..')
-            fromrev = revs[0]
-            if revs[1]:
-                torev = revs[1]
+    if len(args.revisions) == 1:
+        if '..'  in args.revisions[0]:
+            fromrev, torev = args.revisions[0].split('..')
         else:
-            fromrev = args[1]
-    if len(args) > 2:
-        torev = args[2]
+            fromrev, torev = args.revisions[0], 'HEAD'
+    elif len(args.revisions) == 2:
+        fromrev, torev = args.revisions
+
+    from oe.buildhistory_analysis import process_changes
 
     import gitdb
+
     try:
-        changes = process_changes(options.buildhistory_dir, fromrev, torev,
-                                  options.report_all, options.report_ver, options.sigs,
-                                  options.sigsdiff, options.exclude_path)
-    except gitdb.exc.BadObject as e:
-        if len(args) == 1:
+        changes = process_changes(args.buildhistory_dir, fromrev, torev,
+                                  args.report_all, args.report_ver, args.sigs,
+                                  args.sigsdiff, args.exclude_path)
+    except gitdb.exc.BadName as e:
+        if not args.fromrev:
             sys.stderr.write("Unable to find previous build revision in buildhistory repository\n\n")
             parser.print_help()
         else:
@@ -112,6 +130,5 @@ def main():
 
     sys.exit(0)
 
-
 if __name__ == "__main__":
     main()
-- 
2.1.4



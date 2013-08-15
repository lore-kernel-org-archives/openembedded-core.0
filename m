Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1613D6B7B6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 17:05:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 15 Aug 2013 10:04:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,886,1367996400"; d="scan'208";a="381478995"
Received: from timevans-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.122.206])
	by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2013 10:04:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2013 18:04:39 +0100
Message-Id: <34e2a9461d29813823ca6aa598cc94262bda8e00.1376585082.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1376585082.git.paul.eggleton@linux.intel.com>
References: <cover.1376585082.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1376585082.git.paul.eggleton@linux.intel.com>
References: <cover.1376585082.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 6/7] buildhistory-diff: improve command-line handling
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
X-List-Received-Date: Thu, 15 Aug 2013 17:05:26 -0000

Improve command-line argument handling of buildhistory-diff to make it
easier to use.

* Default buildhistory directory to buildhistory/ under the current
  directory and require an option to set it (since most users will
  likely run buildhistory-diff from the build directory and keep
  BUILDHISTORY_DIR at its default location)
* Default from-revision to "build-minus-1" to get the difference from
  the previous build with no arguments
* Allow from/to revisions to be specified by from..to (since git accepts
  this form).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/buildhistory-diff | 54 ++++++++++++++++++++++++++++++++++-------------
 1 file changed, 39 insertions(+), 15 deletions(-)

diff --git a/scripts/buildhistory-diff b/scripts/buildhistory-diff
index 30c2c08..b82240d 100755
--- a/scripts/buildhistory-diff
+++ b/scripts/buildhistory-diff
@@ -7,6 +7,7 @@
 
 import sys
 import os
+import optparse
 from distutils.version import LooseVersion
 
 # Ensure PythonGit is installed (buildhistory_analysis needs it)
@@ -17,14 +18,30 @@ except ImportError:
     sys.exit(1)
 
 def main():
+    parser = optparse.OptionParser(
+        description = "Reports significant differences in the buildhistory repository.",
+        usage = """
+    %prog [options] [from-revision [to-revision]]
+(if not specified, from-revision defaults to build-minus-1, and to-revision defaults to HEAD)""")
+
+    parser.add_option("-p", "--buildhistory-dir",
+            help = "Specify path to buildhistory directory (defaults to buildhistory/ under cwd)",
+            action="store", dest="buildhistory_dir", default='buildhistory/')
+
+    options, args = parser.parse_args(sys.argv)
+
+    if len(args) > 3:
+        sys.stderr.write('Invalid argument(s) specified: %s\n\n' % ' '.join(args[3:]))
+        parser.print_help()
+        sys.exit(1)
+
     if LooseVersion(git.__version__) < '0.3.1':
         sys.stderr.write("Version of GitPython is too old, please install GitPython (python-git) 0.3.1 or later in order to use this script\n")
         sys.exit(1)
 
-    if len(sys.argv) < 3 or '--help' in sys.argv:
-        print("Report significant differences in the buildhistory repository")
-        print("Syntax: %s <buildhistory-path> <since-revision> [to-revision]" % os.path.basename(sys.argv[0]))
-        print("If to-revision is not specified, it defaults to HEAD")
+    if not os.path.exists(options.buildhistory_dir):
+        sys.stderr.write('Buildhistory directory "%s" does not exist\n\n' % options.buildhistory_dir)
+        parser.print_help()
         sys.exit(1)
 
     # Set path to OE lib dir so we can import the buildhistory_analysis module
@@ -47,21 +64,28 @@ def main():
     sys.path[0:0] = [newpath, bitbakepath + '/lib']
     import oe.buildhistory_analysis
 
-    buildhistory_dir = sys.argv[1]
-    if not os.path.exists(buildhistory_dir):
-        sys.stderr.write('Specified buildhistory directory "%s" does not exist\n' % buildhistory_dir)
-        sys.exit(1)
-
-    if len(sys.argv) > 3:
-        torev = sys.argv[3]
-    else:
-        torev = 'HEAD'
+    fromrev = 'build-minus-1'
+    torev = 'HEAD'
+    if len(args) > 1:
+        if len(args) == 2 and '..' in args[1]:
+            revs = args[1].split('..')
+            fromrev = revs[0]
+            if revs[1]:
+                torev = revs[1]
+        else:
+            fromrev = args[1]
+    if len(args) > 2:
+        torev = args[2]
 
     import gitdb
     try:
-        changes = oe.buildhistory_analysis.process_changes(buildhistory_dir, sys.argv[2], torev)
+        changes = oe.buildhistory_analysis.process_changes(options.buildhistory_dir, fromrev, torev)
     except gitdb.exc.BadObject as e:
-        sys.stderr.write('Specified git revision "%s" is not valid\n' % e.args[0])
+        if len(args) == 1:
+            sys.stderr.write("Unable to find previous build revision in buildhistory repository\n\n")
+            parser.print_help()
+        else:
+            sys.stderr.write('Specified git revision "%s" is not valid\n' % e.args[0])
         sys.exit(1)
 
     for chg in changes:
-- 
1.8.1.2



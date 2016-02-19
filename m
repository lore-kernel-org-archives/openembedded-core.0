Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 170E9771FD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 21:32:38 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 19 Feb 2016 13:32:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,472,1449561600"; d="scan'208";a="907094762"
Received: from humberto-desktop.zpn.intel.com ([10.219.5.34])
	by fmsmga001.fm.intel.com with ESMTP; 19 Feb 2016 13:32:37 -0800
From: humberto.ibarra.lopez@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Feb 2016 15:29:31 -0600
Message-Id: <1455917372-10008-2-git-send-email-humberto.ibarra.lopez@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455917372-10008-1-git-send-email-humberto.ibarra.lopez@intel.com>
References: <1455917372-10008-1-git-send-email-humberto.ibarra.lopez@intel.com>
Subject: [PATCH v3 1/2] scripts/oe-selftest: Add filtering to the coverage data gathered by oe-selftest
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
X-List-Received-Date: Fri, 19 Feb 2016 21:32:39 -0000

From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>

When --coverage is used, oe-selftest gathers coverage data from the testcases
executed. The command lacks a way of filtering which files to gather coverage
data from.

This patch adds three options to specify which files should be considered.
The --coverage-source option specifies folders, while --coverage-include and
--coverage-omit specify patterns to have an extra level of filtering.

Some examples:

1. oe-selftest --run-all-tests --coverage

Gathers coverage data from the default poky folders

2. oe-selftest --run-all-tests --coverage --coverage-include /home/me/poky/scripts/*

Gathers coverage data only for the files located under '/home/me/poky/scripts'

3. oe-selftest --run-all-tests -coverage --coverage-omit /home/me/poky/meta*

Gathers coverage data. Files inside all the folders starting with 'meta' under
'/home/me/poky' are omited

4. oe-selftest --run-all-tests --coverage --coverage-source /home/me/poky/bitbake

Gathers coverage data only from files inside the folder: '/home/me/poky/bitbake'

[Yocto #8920]

Signed-off-by: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
---
 scripts/oe-selftest | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index 4eb404b..f3865e4 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -78,6 +78,9 @@ def get_args_parser():
     group.add_argument('--list-modules', required=False, action="store_true", dest="list_modules", default=False, help='List all available test modules.')
     group.add_argument('--list-classes', required=False, action="store_true", dest="list_allclasses", default=False, help='List all available test classes.')
     parser.add_argument('--coverage', action="store_true", help="Run code coverage when testing")
+    parser.add_argument('--coverage-source', dest="coverage_source", nargs="+", help="Specifiy the directories to take coverage from")
+    parser.add_argument('--coverage-include', dest="coverage_include", nargs="+", help="Specify extra patterns to include into the coverage measurement")
+    parser.add_argument('--coverage-omit', dest="coverage_omit", nargs="+", help="Specify with extra patterns to exclude from the coverage measurement")
     group.add_argument('--run-tests-by', required=False, dest='run_tests_by', default=False, nargs='*',
                        help='run-tests-by <name|class|module|id|tag> <list of tests|classes|modules|ids|tags>')
     group.add_argument('--list-tests-by', required=False, dest='list_tests_by', default=False, nargs='*',
@@ -369,7 +372,7 @@ def list_tags():
 
     print 'Tags:\t%s' % ', '.join(str(x) for x in tags)
 
-def coverage_setup(run_tests, run_all_tests):
+def coverage_setup(run_tests, run_all_tests, coverage_source, coverage_include, coverage_omit):
     """ Set up the coverage measurement for the testcases to be run """
     builddir = os.environ.get("BUILDDIR")
     coveragerc = "%s/.coveragerc" % builddir
@@ -384,10 +387,25 @@ def coverage_setup(run_tests, run_all_tests):
         cps.write("branch = True\n")
         # Measure just BBLAYERS, scripts and bitbake folders
         cps.write("source = \n")
-        for layer in get_bb_var('BBLAYERS').split():
-            cps.write("    %s\n" % layer)
-        cps.write("    %s\n" % os.path.dirname(os.path.realpath(__file__)))
-        cps.write("    %s\n" % os.path.join(os.path.dirname(os.path.dirname(os.path.realpath(__file__))),'bitbake'))
+        if coverage_source:
+            for directory in coverage_source:
+                if not os.path.isdir(directory):
+                    log.warn("Directory %s is not valid.", directory)
+                cps.write("    %s\n" % directory)
+        else:
+            for layer in get_bb_var('BBLAYERS').split():
+                cps.write("    %s\n" % layer)
+            cps.write("    %s\n" % os.path.dirname(os.path.realpath(__file__)))
+            cps.write("    %s\n" % os.path.join(os.path.dirname(os.path.dirname(os.path.realpath(__file__))),'bitbake'))
+
+        if coverage_include:
+            cps.write("include = \n")
+            for pattern in coverage_include:
+                cps.write("    %s\n" % pattern)
+        if coverage_omit:
+            cps.write("omit = \n")
+            for pattern in coverage_omit:
+                cps.write("    %s\n" % pattern)
 
         return coveragerc
 
@@ -550,7 +568,7 @@ def buildResultClass(args):
 
         def startTestRun(self):
             """ Setup coverage before running any testcase """
-            if args.coverage:
+            if args.coverage or args.coverage_source or args.coverage_include or args.coverage_omit:
                 try:
                     # check if user can do coverage
                     import coverage
@@ -561,7 +579,7 @@ def buildResultClass(args):
                     # value indicates where the coverage configuration file resides
                     # More info on https://pypi.python.org/pypi/coverage
                     if not os.environ.get('COVERAGE_PROCESS_START'):
-                        os.environ['COVERAGE_PROCESS_START'] = coverage_setup(args.run_tests, args.run_all_tests)
+                        os.environ['COVERAGE_PROCESS_START'] = coverage_setup(args.run_tests, args.run_all_tests, args.coverage_source, args.coverage_include, args.coverage_omit)
 
                     self.coverage_installed = True
                 except:
-- 
1.9.1



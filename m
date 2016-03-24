Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 47C37606A8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 16:25:04 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 Mar 2016 09:25:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,382,1455004800"; d="scan'208";a="943523950"
Received: from jhibarra-desk.zpn.intel.com ([10.219.24.147])
	by fmsmga002.fm.intel.com with ESMTP; 23 Mar 2016 09:25:00 -0700
From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Mar 2016 18:32:02 -0600
Message-Id: <1458779522-3127-1-git-send-email-humberto.ibarra.lopez@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] scripts:/oe-selftest: Use timestamp instead of test names in coverage data file
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
X-List-Received-Date: Wed, 23 Mar 2016 16:25:05 -0000

This fixes the problem by changing the name to the coverage data file,
using the timestamp as an identifier.

The name for the coverage data file is constructed based on the tests
ran; this has created a couple of issues so far, affecting coverage report.

If --run-tests-by option is given, the data file name won't have any
identifier, causing following runs to overwrite themselves. On the
other hand, if too many tests are given, the file name exceeds linux
limits and fails to store the coverage data all together.

[Yocto #9253]

Signed-off-by: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
---
 scripts/oe-selftest | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index d18348d..9b61bfa 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -364,16 +364,21 @@ def list_tags():
 
     print 'Tags:\t%s' % ', '.join(str(x) for x in tags)
 
-def coverage_setup(run_tests, run_all_tests, coverage_source, coverage_include, coverage_omit):
+def coverage_setup(coverage_source, coverage_include, coverage_omit):
     """ Set up the coverage measurement for the testcases to be run """
+    import datetime
+    import subprocess
     builddir = os.environ.get("BUILDDIR")
+    pokydir = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
+    curcommit= subprocess.check_output(["git", "--git-dir", os.path.join(pokydir, ".git"), "rev-parse", "HEAD"])
     coveragerc = "%s/.coveragerc" % builddir
     data_file = "%s/.coverage." % builddir
-    data_file += ((run_tests and '.'.join(run_tests)) or
-        (run_all_tests and "all_tests") or "")
+    data_file += datetime.datetime.now().strftime('%Y%m%dT%H%M%S')
     if os.path.isfile(data_file):
         os.remove(data_file)
     with open(coveragerc, 'w') as cps:
+        cps.write("# Generated with command '%s'\n" % " ".join(sys.argv))
+        cps.write("# HEAD commit %s\n" % curcommit.strip())
         cps.write("[run]\n")
         cps.write("data_file = %s\n" % data_file)
         cps.write("branch = True\n")
@@ -586,7 +591,7 @@ def buildResultClass(args):
                 # value indicates where the coverage configuration file resides
                 # More info on https://pypi.python.org/pypi/coverage
                 if not os.environ.get('COVERAGE_PROCESS_START'):
-                    os.environ['COVERAGE_PROCESS_START'] = coverage_setup(args.run_tests, args.run_all_tests, args.coverage_source, args.coverage_include, args.coverage_omit)
+                    os.environ['COVERAGE_PROCESS_START'] = coverage_setup(args.coverage_source, args.coverage_include, args.coverage_omit)
 
                 # Use default site.USER_SITE and write corresponding config file
                 site.ENABLE_USER_SITE = True
-- 
2.1.4



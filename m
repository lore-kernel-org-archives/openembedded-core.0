Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5C98162134
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 15:05:40 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 18 Nov 2015 07:05:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,313,1444719600"; d="scan'208";a="602579942"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Nov 2015 07:05:41 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Nov 2015 15:04:17 +0000
Message-Id: <1447859057-27359-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Cc: paul.eggleton@linux.intel.com, eduard.bartosh@intel.com
Subject: [PATCH] oe-selftest: Enable code coverage on unit tests
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
X-List-Received-Date: Wed, 18 Nov 2015 15:05:42 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Enable code coverage through the library 'python coverage'. In case the environment
variable COVERAGE_PROCESS_START is present (one of the requisites for measuring
sub-processes; the second one is including some coverage statements into the
python sitecustomize.py file) it will be taken into account, otherwise it is 
exported with value '.coveragerc'. The latter value is a configuration file 
(also automatically created) with some default settings. Once tests are
executed, a coverage report is shown on the log and the coverage output data is stored
with name '.coverage.<args>' where '<args>' is the name of the  unit tests executed
or 'all_tests' when running with --run-all-tests. This output data can be latter used
for better reporting using the same tool (coverage).

As briefly indicate before, measuring sub-process implies setting the env variable 
COVERAGE_PROCESS_START (done automatically by the oe-selftest code with this patch if
not already set) and creating a sitecustomize.py as explained on [1]. 
If either one of these is missing, complete coverage will be incomplete.

Current measurements for 'oe-selftest --run-all-tests' indicate that current coverage
is around 42 % taking into account BBLAYERS, bitbake and scripts folders. More details
on [2], indicating the coverage per file/module.

This tasks has been done together with Humberto Ibarra <humberto.ibarra.lopez@linux.intel.com>

[YOCTO #8679]

[1] http://coverage.readthedocs.org/en/latest/subprocess.html
[2] https://bugzilla.yoctoproject.org/attachment.cgi?id=2854

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 scripts/oe-selftest | 61 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index 91e2dd2..9679962 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -30,6 +30,7 @@ import sys
 import unittest
 import logging
 import argparse
+import subprocess
 
 sys.path.insert(0, os.path.dirname(os.path.realpath(__file__)) + '/lib')
 import scriptpath
@@ -70,6 +71,7 @@ def get_args_parser():
     group.add_argument('--run-all-tests', required=False, action="store_true", dest="run_all_tests", default=False, help='Run all (unhidden) tests')
     group.add_argument('--list-modules', required=False, action="store_true", dest="list_modules", default=False, help='List all available test modules.')
     group.add_argument('--list-classes', required=False, action="store_true", dest="list_allclasses", default=False, help='List all available test classes.')
+    parser.add_argument('--coverage', action="store_true", help="Run code coverage when testing")
     return parser
 
 
@@ -197,6 +199,42 @@ def main():
         if not preflight_check():
             return 1
 
+        if args.coverage:
+            try:
+                # check if user can do coverage
+                import coverage
+                log.info("Coverage is enabled")
+            except:
+                log.warn(("python coverage is not installed\n",
+                          "Make sure you are also coverage takes into account sub-process\n",
+                          "More info on https://pypi.python.org/pypi/coverage\n"))
+
+            # In case the user has not set the variable COVERAGE_PROCESS_START,
+            # create a default one and export it. The COVERAGE_PROCESS_START
+            # value indicates where the coverage configuration file resides
+            # More info on https://pypi.python.org/pypi/coverage
+            coverage_process_start = os.environ.get('COVERAGE_PROCESS_START')
+            if not coverage_process_start:
+                builddir = os.environ.get("BUILDDIR")
+                coveragerc = "%s/.coveragerc" % builddir
+                data_file = "%s/.coverage." % builddir
+                data_file += ((args.run_tests and ".".join(args.run_tests)) or
+                                  (args.run_all_tests and ".all_tests") or '')
+                if os.path.isfile(data_file):
+                    os.remove(data_file)
+                with open(coveragerc, 'w') as cps:
+                    cps.write("[run]\n")
+                    cps.write("data_file = %s\n" % data_file)
+                    cps.write("branch = True\n")
+                    # Measure just BBLAYERS, scripts and bitbake folders
+                    cps.write("source = \n")
+                    for layer in get_bb_var('BBLAYERS').split():
+                        cps.write("    %s\n" % layer)
+                    cps.write("    %s\n" % os.path.dirname(os.path.realpath(__file__)))
+                    cps.write("    %s\n" % os.path.join(os.path.dirname(os.path.dirname(os.path.realpath(__file__))),'bitbake'))
+
+                coverage_process_start = os.environ["COVERAGE_PROCESS_START"] = coveragerc
+
         testslist = get_tests(exclusive_modules=(args.run_tests or []), include_hidden=False)
         suite = unittest.TestSuite()
         loader = unittest.TestLoader()
@@ -216,6 +254,29 @@ def main():
         add_include()
         result = runner.run(suite)
         log.info("Finished")
+
+        if args.coverage:
+            with open(coverage_process_start) as ccf:
+                log.info("Coverage configuration file (%s)" % coverage_process_start)
+                log.info("===========================")
+                log.info("\n%s" % "".join(ccf.readlines()))
+
+            try:
+                # depending on the version, coverage command is named 'python-coverage' or 'coverage',
+                # where the latter is for newer versions
+                coverage_cmd = "python-coverage"
+                subprocess.check_call(coverage_cmd, stderr=subprocess.PIPE, shell=True)
+            except subprocess.CalledProcessError:
+                coverage_cmd = "coverage"
+                pass
+
+            log.info("Coverage Report")
+            log.info("===============")
+            p = subprocess.Popen("%s report" % coverage_cmd, shell=True,
+                                 stdout=subprocess.PIPE, stderr=subprocess.STDOUT, stdin=subprocess.PIPE)
+            cov_output, cov_err = p.communicate()
+            log.info("\n%s" % cov_output)
+
         if result.wasSuccessful():
             return 0
         else:
-- 
1.8.4.5



Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 23E697723F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 21:32:39 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 19 Feb 2016 13:32:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,472,1449561600"; d="scan'208";a="907094781"
Received: from humberto-desktop.zpn.intel.com ([10.219.5.34])
	by fmsmga001.fm.intel.com with ESMTP; 19 Feb 2016 13:32:39 -0800
From: humberto.ibarra.lopez@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Feb 2016 15:29:32 -0600
Message-Id: <1455917372-10008-3-git-send-email-humberto.ibarra.lopez@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455917372-10008-1-git-send-email-humberto.ibarra.lopez@intel.com>
References: <1455917372-10008-1-git-send-email-humberto.ibarra.lopez@intel.com>
Subject: [PATCH v3 2/2] scripts/oe-selftest: Use site.USER_SITE to run coverage configuration code for sub-process
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

Coverage in oe-selftest currently requires to create or modify
a sitecustomize.py file according the coverage tool setup instructions
(http://coverage.readthedocs.org/). This file has to be located in
the system's python folder, which is not a good solution since this
folder is not accesible to non-privileged users.

The best solution so far is to create this file in the home directory.
This is implemented by creating the temporal file in the user site
default folder.

[Yocto #8930]

Signed-off-by: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
---
 scripts/oe-selftest | 46 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 34 insertions(+), 12 deletions(-)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index f3865e4..bd9cbe0 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -553,6 +553,7 @@ def main():
 
 def buildResultClass(args):
     """Build a Result Class to use in the testcase execution"""
+    import site
 
     class StampedResult(unittest.TextTestResult):
         """
@@ -568,26 +569,41 @@ def buildResultClass(args):
 
         def startTestRun(self):
             """ Setup coverage before running any testcase """
+
+            # variable holding the coverage configuration file allowing subprocess to be measured
+            self.coveragepth = None
+
+            # indicates the system if coverage is currently installed
+            self.coverage_installed = True
+
             if args.coverage or args.coverage_source or args.coverage_include or args.coverage_omit:
                 try:
                     # check if user can do coverage
                     import coverage
-                    log.info("Coverage is enabled")
-
-                    # In case the user has not set the variable COVERAGE_PROCESS_START,
-                    # create a default one and export it. The COVERAGE_PROCESS_START
-                    # value indicates where the coverage configuration file resides
-                    # More info on https://pypi.python.org/pypi/coverage
-                    if not os.environ.get('COVERAGE_PROCESS_START'):
-                        os.environ['COVERAGE_PROCESS_START'] = coverage_setup(args.run_tests, args.run_all_tests, args.coverage_source, args.coverage_include, args.coverage_omit)
-
-                    self.coverage_installed = True
                 except:
                     log.warn('\n'.join(["python coverage is not installed",
                         "Make sure your coverage takes into account sub-process",
                         "More info on https://pypi.python.org/pypi/coverage"]))
                     self.coverage_installed = False
 
+                if self.coverage_installed:
+                    log.info("Coverage is enabled")
+
+                # In case the user has not set the variable COVERAGE_PROCESS_START,
+                # create a default one and export it. The COVERAGE_PROCESS_START
+                # value indicates where the coverage configuration file resides
+                # More info on https://pypi.python.org/pypi/coverage
+                if not os.environ.get('COVERAGE_PROCESS_START'):
+                    os.environ['COVERAGE_PROCESS_START'] = coverage_setup(args.run_tests, args.run_all_tests, args.coverage_source, args.coverage_include, args.coverage_omit)
+
+                # Use default site.USER_SITE and write corresponding config file
+                site.ENABLE_USER_SITE = True
+                if not os.path.exists(site.USER_SITE):
+                    os.makedirs(site.USER_SITE)
+                self.coveragepth = os.path.join(site.USER_SITE, "coverage.pth")
+                with open(self.coveragepth, 'w') as cps:
+                    cps.write('import sys,site; sys.path.extend(site.getsitepackages()); import coverage; coverage.process_startup();')
+
         def stopTestRun(self):
             """ Report coverage data after the testcases are run """
 
@@ -599,8 +615,14 @@ def buildResultClass(args):
 
                 log.info("Coverage Report")
                 log.info("===============")
-
-                coverage_report()
+                try:
+                    coverage_report()
+                    # remove the pth file
+                finally:
+                    try:
+                        os.remove(self.coveragepth)
+                    except OSError:
+                        log.warn("Expected temporal file from coverage is missing, ignoring removal.")
 
     return StampedResult
 
-- 
1.9.1



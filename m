Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id AEEBA7713D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Apr 2016 19:08:54 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 05 Apr 2016 12:08:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,445,1455004800"; d="scan'208";a="778683029"
Received: from jhibarra-desk.zpn.intel.com ([10.219.17.169])
	by orsmga003.jf.intel.com with ESMTP; 05 Apr 2016 12:08:56 -0700
From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Apr 2016 22:15:54 -0500
Message-Id: <1459912554-1192-4-git-send-email-humberto.ibarra.lopez@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1459912554-1192-1-git-send-email-humberto.ibarra.lopez@intel.com>
References: <1459912554-1192-1-git-send-email-humberto.ibarra.lopez@intel.com>
Subject: [PATCH 3/3] scripts/oe-selftest: avoid the creation of coverage file when coverage not installed
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
X-List-Received-Date: Tue, 05 Apr 2016 19:08:54 -0000

Coverage subprocessing file is being created even when coverage
is not installed, which causes errors of "module not found" to
be send to the oe-selftest output.

This patch adds indent to the block of code creating this coverage
file, so it can only be executed when coverage is actually
installed.

[Yocto #9334]

Signed-off-by: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
---
 scripts/oe-selftest | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index 375ba5c..3d2dffb 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -584,20 +584,20 @@ def buildResultClass(args):
                 if self.coverage_installed:
                     log.info("Coverage is enabled")
 
-                # In case the user has not set the variable COVERAGE_PROCESS_START,
-                # create a default one and export it. The COVERAGE_PROCESS_START
-                # value indicates where the coverage configuration file resides
-                # More info on https://pypi.python.org/pypi/coverage
-                if not os.environ.get('COVERAGE_PROCESS_START'):
-                    os.environ['COVERAGE_PROCESS_START'] = coverage_setup(args.coverage_source, args.coverage_include, args.coverage_omit)
-
-                # Use default site.USER_SITE and write corresponding config file
-                site.ENABLE_USER_SITE = True
-                if not os.path.exists(site.USER_SITE):
-                    os.makedirs(site.USER_SITE)
-                self.coveragepth = os.path.join(site.USER_SITE, "coverage.pth")
-                with open(self.coveragepth, 'w') as cps:
-                    cps.write('import sys,site; sys.path.extend(site.getsitepackages()); import coverage; coverage.process_startup();')
+                    # In case the user has not set the variable COVERAGE_PROCESS_START,
+                    # create a default one and export it. The COVERAGE_PROCESS_START
+                    # value indicates where the coverage configuration file resides
+                    # More info on https://pypi.python.org/pypi/coverage
+                    if not os.environ.get('COVERAGE_PROCESS_START'):
+                        os.environ['COVERAGE_PROCESS_START'] = coverage_setup(args.coverage_source, args.coverage_include, args.coverage_omit)
+
+                    # Use default site.USER_SITE and write corresponding config file
+                    site.ENABLE_USER_SITE = True
+                    if not os.path.exists(site.USER_SITE):
+                        os.makedirs(site.USER_SITE)
+                    self.coveragepth = os.path.join(site.USER_SITE, "coverage.pth")
+                    with open(self.coveragepth, 'w') as cps:
+                        cps.write('import sys,site; sys.path.extend(site.getsitepackages()); import coverage; coverage.process_startup();')
 
         def stopTestRun(self):
             """ Report coverage data after the testcases are run """
-- 
2.1.4



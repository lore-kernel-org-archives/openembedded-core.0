Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3D3BE770D8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Apr 2016 19:08:53 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 05 Apr 2016 12:08:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,445,1455004800"; d="scan'208";a="778683017"
Received: from jhibarra-desk.zpn.intel.com ([10.219.17.169])
	by orsmga003.jf.intel.com with ESMTP; 05 Apr 2016 12:08:55 -0700
From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Apr 2016 22:15:53 -0500
Message-Id: <1459912554-1192-3-git-send-email-humberto.ibarra.lopez@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1459912554-1192-1-git-send-email-humberto.ibarra.lopez@intel.com>
References: <1459912554-1192-1-git-send-email-humberto.ibarra.lopez@intel.com>
Subject: [PATCH 2/3] scripts/oe-selftest: remove coverage file if any coverage option is given
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
X-List-Received-Date: Tue, 05 Apr 2016 19:08:53 -0000

Coverage temporal file for sub-processing is being removed only
when the --coverage option was found. This is wrong since the
file is created when any coverage option (source, include or omit)
is given, even if --coverage is not one of them.

This patch makes sure to remove the file if any coverage option was
given.

Signed-off-by: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
---
 scripts/oe-selftest | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index 2348b47..375ba5c 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -602,22 +602,23 @@ def buildResultClass(args):
         def stopTestRun(self):
             """ Report coverage data after the testcases are run """
 
-            if args.coverage and self.coverage_installed:
-                with open(os.environ['COVERAGE_PROCESS_START']) as ccf:
-                    log.info("Coverage configuration file (%s)" % os.environ.get('COVERAGE_PROCESS_START'))
-                    log.info("===========================")
-                    log.info("\n%s" % "".join(ccf.readlines()))
-
-                log.info("Coverage Report")
-                log.info("===============")
-                try:
-                    coverage_report()
-                    # remove the pth file
-                finally:
+            if args.coverage or args.coverage_source or args.coverage_include or args.coverage_omit:
+                if self.coverage_installed:
+                    with open(os.environ['COVERAGE_PROCESS_START']) as ccf:
+                        log.info("Coverage configuration file (%s)" % os.environ.get('COVERAGE_PROCESS_START'))
+                        log.info("===========================")
+                        log.info("\n%s" % "".join(ccf.readlines()))
+
+                    log.info("Coverage Report")
+                    log.info("===============")
                     try:
-                        os.remove(self.coveragepth)
-                    except OSError:
-                        log.warn("Expected temporal file from coverage is missing, ignoring removal.")
+                        coverage_report()
+                    finally:
+                        # remove the pth file
+                        try:
+                            os.remove(self.coveragepth)
+                        except OSError:
+                            log.warn("Expected temporal file from coverage is missing, ignoring removal.")
 
     return StampedResult
 
-- 
2.1.4



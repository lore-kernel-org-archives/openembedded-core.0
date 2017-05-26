Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id AC4387833A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 20:38:59 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 May 2017 13:39:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,399,1491289200"; d="scan'208";a="266887886"
Received: from tsriniv-mobl.amr.corp.intel.com (HELO
	alimonb-mobl1.amr.corp.intel.com) ([10.254.103.51])
	by fmsmga004.fm.intel.com with ESMTP; 26 May 2017 13:38:59 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 May 2017 15:37:53 -0500
Message-Id: <f9994313cd64a9ed88ea63a531ab64f2a3ff001c.1495830706.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1495830706.git.anibal.limon@linux.intel.com>
References: <cover.1495830706.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1495830706.git.anibal.limon@linux.intel.com>
References: <cover.1495830706.git.anibal.limon@linux.intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 27/36] oeqa/core/context: Include a _pre_run method
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
X-List-Received-Date: Fri, 26 May 2017 20:39:00 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

This pre runner will serve to allow Test components executes code
previously of the run a suite.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/core/context.py   | 4 ++++
 meta/lib/oeqa/core/exception.py | 3 +++
 scripts/oe-test                 | 3 +++
 3 files changed, 10 insertions(+)

diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index 6667f46..5f399fd 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -143,6 +143,9 @@ class OETestContextExecutor(object):
 
         self.module_paths = args.CASES_PATHS
 
+    def _pre_run(self):
+        pass
+
     def run(self, logger, args):
         self._process_args(logger, args)
 
@@ -152,6 +155,7 @@ class OETestContextExecutor(object):
         if args.list_tests:
             rc = self.tc.listTests(args.list_tests, **self.tc_kwargs['run'])
         else:
+            self._pre_run()
             rc = self.tc.runTests(**self.tc_kwargs['run'])
             rc.logSummary(self.name)
             rc.logDetails()
diff --git a/meta/lib/oeqa/core/exception.py b/meta/lib/oeqa/core/exception.py
index 97ef19d..a07961a 100644
--- a/meta/lib/oeqa/core/exception.py
+++ b/meta/lib/oeqa/core/exception.py
@@ -15,3 +15,6 @@ class OEQADependency(OEQAException):
 
 class OEQAMissingManifest(OEQAException):
     pass
+
+class OEQAPreRun(OEQAException):
+    pass
diff --git a/scripts/oe-test b/scripts/oe-test
index a1d282d..f90d85b 100755
--- a/scripts/oe-test
+++ b/scripts/oe-test
@@ -26,6 +26,7 @@ except ImportError:
     pass
 
 from oeqa.core.context import OETestContextExecutor
+from oeqa.core.exception import OEQAPreRun
 
 logger = scriptutils.logger_create('oe-test')
 
@@ -92,6 +93,8 @@ def main():
         ret = err.code
     except argparse_oe.ArgumentUsageError as ae:
         parser.error_subcommand(ae.message, ae.subcommand)
+    except OEQAPreRun as pr:
+        ret = 1
 
     return ret
 
-- 
2.1.4



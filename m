Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 19EF3782CA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 20:38:12 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 May 2017 13:38:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,399,1491289200"; d="scan'208";a="266887585"
Received: from tsriniv-mobl.amr.corp.intel.com (HELO
	alimonb-mobl1.amr.corp.intel.com) ([10.254.103.51])
	by fmsmga004.fm.intel.com with ESMTP; 26 May 2017 13:38:12 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 May 2017 15:37:30 -0500
Message-Id: <236486229bb3ac2e7511238abb1d6f0fd88b3652.1495830706.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1495830706.git.anibal.limon@linux.intel.com>
References: <cover.1495830706.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1495830706.git.anibal.limon@linux.intel.com>
References: <cover.1495830706.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 04/36] oeqa/core: Don't expose OEStreamLogger in OETestContext
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
X-List-Received-Date: Fri, 26 May 2017 20:38:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The OEStreamLogger class is used for redirect PyUnit output
to a certain logger so there is not need to expose at level
of OETestContext because only OETestRunner needs to know.

[YOCTO #11450]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/core/context.py | 6 ++----
 meta/lib/oeqa/core/runner.py  | 3 +++
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index 4476750..2628651 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -10,12 +10,11 @@ import collections
 import re
 
 from oeqa.core.loader import OETestLoader
-from oeqa.core.runner import OETestRunner, OEStreamLogger, xmlEnabled
+from oeqa.core.runner import OETestRunner, xmlEnabled
 
 class OETestContext(object):
     loaderClass = OETestLoader
     runnerClass = OETestRunner
-    streamLoggerClass = OEStreamLogger
 
     files_dir = os.path.abspath(os.path.join(os.path.dirname(
         os.path.abspath(__file__)), "../files"))
@@ -52,8 +51,7 @@ class OETestContext(object):
         self.suites = self.loader.discover()
 
     def runTests(self):
-        streamLogger = self.streamLoggerClass(self.logger)
-        self.runner = self.runnerClass(self, stream=streamLogger, verbosity=2)
+        self.runner = self.runnerClass(self, verbosity=2)
 
         self._run_start_time = time.time()
         result = self.runner.run(self.suites)
diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 44ffecb..40fbf3b 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -48,12 +48,15 @@ class OETestResult(_TestResult):
         super(OETestResult, self).startTest(test)
 
 class OETestRunner(_TestRunner):
+    streamLoggerClass = OEStreamLogger
+
     def __init__(self, tc, *args, **kwargs):
         if xmlEnabled:
             if not kwargs.get('output'):
                 kwargs['output'] = os.path.join(os.getcwd(),
                         'TestResults_%s_%s' % (time.strftime("%Y%m%d%H%M%S"), os.getpid()))
 
+        kwargs['stream'] = self.streamLoggerClass(tc.logger)
         super(OETestRunner, self).__init__(*args, **kwargs)
         self.tc = tc
         self.resultclass = OETestResult
-- 
2.1.4



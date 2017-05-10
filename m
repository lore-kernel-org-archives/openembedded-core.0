Return-Path: <anibal.limon@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id EFE5071BA8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 19:48:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 10 May 2017 12:48:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,320,1491289200"; d="scan'208";a="1128735178"
Received: from rnpawar-mobl3.amr.corp.intel.com (HELO
	alimonb-mobl1.zpn.intel.com) ([10.254.59.138])
	by orsmga001.jf.intel.com with ESMTP; 10 May 2017 12:48:00 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 May 2017 14:47:13 -0500
Message-Id: <656eadf23e16bf648a3bfa995f28898737d8299a.1494445222.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1494445222.git.anibal.limon@linux.intel.com>
References: <cover.1494445222.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1494445222.git.anibal.limon@linux.intel.com>
References: <cover.1494445222.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, juan.m.cruz.alcaraz@intel.com
Subject: [PATCH 13/17] oeqa/core/decorator/depends: Add support for threading mode
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
X-List-Received-Date: Wed, 10 May 2017 19:48:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The _skipTestDependency needs to know if the thread mode is
enabled because the _results are by thread.

[YOCTO #11450]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/core/decorator/depends.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/decorator/depends.py b/meta/lib/oeqa/core/decorator/depends.py
index 195711c..baa0434 100644
--- a/meta/lib/oeqa/core/decorator/depends.py
+++ b/meta/lib/oeqa/core/decorator/depends.py
@@ -3,6 +3,7 @@
 
 from unittest import SkipTest
 
+from oeqa.core.threaded import OETestRunnerThreaded
 from oeqa.core.exception import OEQADependency
 
 from . import OETestDiscover, registerDecorator
@@ -63,7 +64,12 @@ def _order_test_case_by_depends(cases, depends):
     return [cases[case_id] for case_id in cases_ordered]
 
 def _skipTestDependency(case, depends):
-    results = case.tc._results
+    if isinstance(case.tc.runner, OETestRunnerThreaded):
+        import threading
+        results = case.tc._results[threading.get_ident()]
+    else:
+        results = case.tc._results
+
     skipReasons = ['errors', 'failures', 'skipped']
 
     for reason in skipReasons:
-- 
2.1.4



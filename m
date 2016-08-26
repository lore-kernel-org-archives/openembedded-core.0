Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id BBD4A731FC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 07:33:13 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 26 Aug 2016 00:33:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,580,1464678000"; d="scan'208";a="1020615511"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 26 Aug 2016 00:33:14 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2016 10:33:08 +0300
Message-Id: <1472196791-24336-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1472196791-24336-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1472196791-24336-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 1/4] oeqa.buildperf: fix checking of invalid results
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
X-List-Received-Date: Fri, 26 Aug 2016 07:33:14 -0000

The test status check done when writing globalres log was incorrect.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 97be58f..e4a7948 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -175,7 +175,7 @@ class BuildPerfTestResult(unittest.TextTestResult):
 
         values = ['0'] * 12
         for status, (test, msg) in self.all_results():
-            if status not in ['SUCCESS', 'FAILURE', 'EXP_SUCCESS']:
+            if status in ['ERROR', 'SKIPPED']:
                 continue
             (t_ind, t_len), (s_ind, s_len) = gr_map[test.name]
             if t_ind is not None:
-- 
2.6.6



Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 86FF171AFA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 11:12:41 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jan 2017 03:12:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,253,1477983600"; d="scan'208";a="1114934237"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga002.fm.intel.com with ESMTP; 19 Jan 2017 03:12:41 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2017 13:12:29 +0200
Message-Id: <20170119111239.22506-2-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170119111239.22506-1-markus.lehtonen@linux.intel.com>
References: <20170119111239.22506-1-markus.lehtonen@linux.intel.com>
Subject: [PATCH 01/11] oeqa.buildperf: prevent a crash on unexpected success
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
X-List-Received-Date: Thu, 19 Jan 2017 11:12:42 -0000

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 59dd025..4955914 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -137,7 +137,7 @@ class BuildPerfTestResult(unittest.TextTestResult):
     def addSuccess(self, test):
         """Record results from successful tests"""
         super(BuildPerfTestResult, self).addSuccess(test)
-        self.successes.append((test, None))
+        self.successes.append(test)
 
     def startTest(self, test):
         """Pre-test hook"""
@@ -165,7 +165,10 @@ class BuildPerfTestResult(unittest.TextTestResult):
                       'SKIPPED': self.skipped}
         for status, tests in result_map.items():
             for test in tests:
-                yield (status, test)
+                if isinstance(test, tuple):
+                    yield (status, test)
+                else:
+                    yield (status, (test, None))
 
 
     def update_globalres_file(self, filename):
-- 
2.10.2



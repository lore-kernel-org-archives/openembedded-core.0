Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6FDE679CC7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:31 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id e11so1017970plt.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=tZBpKRgNV5Baaa0Wl0ADxCn1DapHfSJ7OQaHwdwXFGc=;
	b=NUn4UZkpnJ5Dq0Gv4E1G8xMCi3iSl5NO7IginWv9Axb3jQJWl/Jk0zhNoJGdvM0pMG
	8th519T2BSrOR/yzWqSw3/Ak8W5JWhfPY+jMHuBQMx2j5P6bKvVT/l4HEIAuXtddD3D6
	5AxlVOaDAPiew68M4LM1yMygrqoF4WIGNY9dxnCaEzjJuqKfwR4uxjWMk8Nf0PneI6Ya
	crJ2XrZPMosrVkKGB7t7ACw+pKGZnnY0m7n52RLXY9IjEJ9G9yClA8wAaeG10G+F4Yyn
	vP0WcOYFR7GqNE5rVit5sU3oZBjuBF2vTVq9zBJQGiCTM9HZSowWNvR7NXDF1Suosqpb
	i3BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=tZBpKRgNV5Baaa0Wl0ADxCn1DapHfSJ7OQaHwdwXFGc=;
	b=HtL85VOqn8jWWvePCKx2EzLs5FF3rxUXFDPCpYOVNKztFzKKN6JqFh5yYtDJZHCvG0
	ki47k4ZjpnquwMPZ3kK74fSGH+Zf+9zMJcScEi5I640tTXanDJ4xZ4PIHlIAPP0uMpBT
	mw+OFMlZOD199VjP02aYqBcRcw6K8ONOM0Jih+3nyp9so55F0tgiFs2EcqjNRMUjZKv2
	TrZYcf/4bf+t9oZ+yE40/ZdLEN942VHbhrQLGJ3chExJzuS9GdNjii5Fizw/IN/qqe8f
	bTxiNoAoQTGjrA8AAF6Sd5xyIhJ3/uk0tk4ZYrrVnQsF+qIMFqj9VGdekCGfXMRG4tdR
	OTKA==
X-Gm-Message-State: AA+aEWY0EA0DvbDXwY1+iYdefqrVo0ztmQWbucij1njjvSJM1mN7vbaU
	uku+xj3xp93YbrRAabJnLa4pKOVZ
X-Google-Smtp-Source: AFSGD/WY6N708cAEm02Y0TWD9L1W7WkLhQWCVeQhkm3ZPcK5+THwbv7BsB/PEJRll0BRhw51qVpCJA==
X-Received: by 2002:a17:902:9f93:: with SMTP id
	g19mr415470plq.195.1544737172286; 
	Thu, 13 Dec 2018 13:39:32 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:31 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:34 -0800
Message-Id: <bd2ca5df66076f10c5af81f42218b5434fb9dabe.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 26/45] oeqa/runner: Ensure we don't print misleading results output
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
X-List-Received-Date: Thu, 13 Dec 2018 21:39:31 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The current code assumes if something isn't a failure of some
kind, it was a pass. When test case IDs weren't matching, this lead
to very confusing output where things would fail, then be listed as
passing.

This adds code to track successes, ensuring we don't end up in this
position again with unmatched entries being listed as UNKNOWN.

(From OE-Core rev: 4374c296d8963e4f6a1aa7bef7983ad0a1c2fcff)

(From OE-Core rev: bcb2948773d76befef2be787be6d25cf544e49a9)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/runner.py | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 16345fa..374d30c 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -42,6 +42,8 @@ class OETestResult(_TestResult):
     def __init__(self, tc, *args, **kwargs):
         super(OETestResult, self).__init__(*args, **kwargs)
 
+        self.successes = []
+
         self.tc = tc
         self._tc_map_results()
 
@@ -58,6 +60,7 @@ class OETestResult(_TestResult):
         self.tc._results['errors'] = self.errors
         self.tc._results['skipped'] = self.skipped
         self.tc._results['expectedFailures'] = self.expectedFailures
+        self.tc._results['successes'] = self.successes
 
     def logSummary(self, component, context_msg=''):
         elapsed_time = self.tc._run_end_time - self.tc._run_start_time
@@ -115,13 +118,18 @@ class OETestResult(_TestResult):
 
         return (found, None)
 
+    def addSuccess(self, test):
+        #Added so we can keep track of successes too
+        self.successes.append((test, None))
+        super(OETestResult, self).addSuccess(test)
+
     def logDetails(self):
         self.tc.logger.info("RESULTS:")
         for case_name in self.tc._registry['cases']:
             case = self.tc._registry['cases'][case_name]
 
-            result_types = ['failures', 'errors', 'skipped', 'expectedFailures']
-            result_desc = ['FAILED', 'ERROR', 'SKIPPED', 'EXPECTEDFAIL']
+            result_types = ['failures', 'errors', 'skipped', 'expectedFailures', 'successes']
+            result_desc = ['FAILED', 'ERROR', 'SKIPPED', 'EXPECTEDFAIL', 'PASSED']
 
             fail = False
             desc = None
@@ -143,7 +151,7 @@ class OETestResult(_TestResult):
                     oeid, desc))
             else:
                 self.tc.logger.info("RESULTS - %s - Testcase %s: %s" % (case.id(),
-                    oeid, 'PASSED'))
+                    oeid, 'UNKNOWN'))
 
 class OEListTestsResult(object):
     def wasSuccessful(self):
-- 
2.7.4



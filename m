Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id E932675260
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2018 15:36:48 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id h20-v6so13320256wmb.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2018 08:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=04a5h/hTzkdPsrNlGozPXtlhDPkS4Uj+5bf3Q9jJ0I8=;
	b=WFB/+hJPQHZD/C0kltv0EREcTabLAT8+OULE4Szzz59M+aoft+BxE21cJbGYDkfFbU
	Wfg0mg5lto4z7W//ssQ8kKQw6+3b6t+7eaJXXgjjkmJCyQ1SA6GvOSUxfgmZHHvaOcC5
	8xHoSOP6axd4gEAFULz3GUEAWYAgwnc0lk/l4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=04a5h/hTzkdPsrNlGozPXtlhDPkS4Uj+5bf3Q9jJ0I8=;
	b=MB9KzT8/9AB81CR7fyGVkWgrcacLoR8n8g3wqu8mzRF34/ycc50zW3jBTqSlZZauSq
	N92+47MMfc1Lb2C6LvN/PJEqStbB5BmFdmVlOfcryyybuHcLdegIgs1d6dGuQYRMTYbB
	vmOkhcZzEp4H7qJAkEl1jVisq/QXOyCXxWRjmA+/X+RP7wBZ3jw/IC2IQN4J6cSlDWzT
	8KqcJQcPc1xFMrMLfuCEytkwMaPa/NhVYezQ7CW9dbzMhzFfmzNGDE8Gpu25ksNBEJoV
	qCaq+JnYErLh7uvNSExnC7HcYwAQUNarz3mb3/MfGNZAQYvvE8J78/Ouh/xN/Jk6FHqW
	BQwQ==
X-Gm-Message-State: AOUpUlESxqXHkUWpieCO90Qu/jFYx8oTbRaO2aC4OmoCbWsnm0fOhLJg
	PskLek0SCmO0hMseO58ZdopQQMXif8Y=
X-Google-Smtp-Source: AAOMgpeBVIchrNAQyEC91Rm2zAmOIHoJ/1CRyawJ48zUdQCBlcR1+vmTm60uHBZW7Uvyrzql51Un2A==
X-Received: by 2002:a1c:1745:: with SMTP id 66-v6mr7577119wmx.38.1531669009411;
	Sun, 15 Jul 2018 08:36:49 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z9-v6sm54571558wre.49.2018.07.15.08.36.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Jul 2018 08:36:48 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 15 Jul 2018 16:36:33 +0100
Message-Id: <20180715153641.21029-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180715153641.21029-1-richard.purdie@linuxfoundation.org>
References: <20180715153641.21029-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 04/12] oeqa/runner: Ensure we don't print misleading results output
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
X-List-Received-Date: Sun, 15 Jul 2018 15:36:49 -0000

The current code assumes if something isn't a failure of some
kind, it was a pass. When test case IDs weren't matching, this lead
to very confusing output where things would fail, then be listed as
passing.

This adds code to track successes, ensuring we don't end up in this
position again with unmatched entries being listed as UNKNOWN.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/runner.py | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 16345fab2ec..374d30cc38d 100644
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
2.17.1



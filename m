Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6DE8EB64DD
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 11:02:09 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.4702.1689937321069384463
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 21 Jul 2023 04:02:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MlUP422+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BFD5540008;
	Fri, 21 Jul 2023 11:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689937319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3kd0jQBP0YykqdaLseu4K1gPOh6hevaVe30rnYfzV/Y=;
	b=MlUP422+UmWm3glCk5jOq/xNvFznaprRnvrfx6nqhww6QNqdo840rllOblbNxX/ngKnqeb
	QhRZgpe8vz4YooYzOeiMZyWTbCHqkCmLO1UgVUrQoqfSVdbHXCwKDwzqHzQJYHz7MfbDQv
	YEw86vQ5y11uW+KBRQMRrkkDHVeCRam81x7Sf7OHA19j/LIdvPg3fqQrc4le8Ll6+gA3+L
	6ua6El2BkFVrlsZ/G/PujPIxYTvG7h5llHqjIK1O9c4di9K/LJOEsiWY0mutfp3ooDu+ow
	V6Pur+SSMPP2peKqz+Y3LWyl0lo6QPdvknv4hxg/8SMClN72tKiS0pKHsVMidQ==
From: alexis.lothore@bootlin.com
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH] scripts/resulttool: add mention about new detected tests
Date: Fri, 21 Jul 2023 13:02:06 +0200
Message-ID: <20230721110206.32921-1-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 11:02:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184683

From: Alexis Lothoré <alexis.lothore@bootlin.com>

Some regression reports show a lot of "PASSED->None" transitions. When such
big lot of identical transitions are observed, it could be that tests are
now failing, but it could also be that some tests has been renamed.

To detect such case, add a log in regression report to report the number of
new tests (i.e: tests that are present in target results but not in base
result). This new log also allows to know about newly added tests bases

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
This commit is a follow-up to [1], which discusses the issue with the
regression report from 4.3_M2 build.
A example of this regression report being updated with the "newly added
tests count" log can be found here: [2]

[1] https://lore.kernel.org/yocto/e7e05ead7e1740041e7633d71943345460472964.camel@linuxfoundation.org/
[2] https://pastebin.com/WQdgrpA0
---
 scripts/lib/resulttool/regression.py | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/resulttool/regression.py b/scripts/lib/resulttool/regression.py
index 1facbcd85e1e..f80a9182a9a9 100644
--- a/scripts/lib/resulttool/regression.py
+++ b/scripts/lib/resulttool/regression.py
@@ -178,6 +178,8 @@ def compare_result(logger, base_name, target_name, base_result, target_result):
     base_result = base_result.get('result')
     target_result = target_result.get('result')
     result = {}
+    new_tests = 0
+
     if base_result and target_result:
         for k in base_result:
             base_testcase = base_result[k]
@@ -189,6 +191,13 @@ def compare_result(logger, base_name, target_name, base_result, target_result):
                     result[k] = {'base': base_status, 'target': target_status}
             else:
                 logger.error('Failed to retrieved base test case status: %s' % k)
+
+        # Also count new tests that were not present in base results: it
+        # could be newly added tests, but it could also highlights some tests
+        # renames or fixed faulty ptests
+        for k in target_result:
+            if k not in base_result:
+                new_tests += 1
     if result:
         new_pass_count = sum(test['target'] is not None and test['target'].startswith("PASS") for test in result.values())
         # Print a regression report only if at least one test has a regression status (FAIL, SKIPPED, absent...)
@@ -200,10 +209,13 @@ def compare_result(logger, base_name, target_name, base_result, target_result):
             if new_pass_count > 0:
                 resultstring += f'    Additionally, {new_pass_count} previously failing test(s) is/are now passing\n'
         else:
-            resultstring = "Improvement: %s\n             %s\n             (+%d test(s) passing)" % (base_name, target_name, new_pass_count)
+            resultstring = "Improvement: %s\n             %s\n             (+%d test(s) passing)\n" % (base_name, target_name, new_pass_count)
             result = None
     else:
-        resultstring = "Match:       %s\n             %s" % (base_name, target_name)
+        resultstring = "Match:       %s\n             %s\n" % (base_name, target_name)
+
+    if new_tests > 0:
+        resultstring += f'    Additionally, {new_tests} new test(s) is/are present\n'
     return result, resultstring
 
 def get_results(logger, source):
-- 
2.41.0



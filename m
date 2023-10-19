Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 686AFCDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 09:52:49 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.23633.1697709161947860309
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 02:52:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RSS5Rbzc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2CF1E40016;
	Thu, 19 Oct 2023 09:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697709160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dWeATHt+TeBFFj54Np1Fj4SyExLc+pf5xTmg9DqZ/jc=;
	b=RSS5RbzcIlsEY8g370GPvM3F8vBfTHRFuMWVtCQWoUqgMH797JWXcvF+qnryZpDX7ignHT
	FvKDX6ktzAqoxlzB7rPLebl1aBOIdWV0ghtWKlC+YpsMnn9O0YqXpwxqH775kJiYHriJhC
	znNt/CaTBFlnZbI4opEihYJCBWJc5vudub/tA8K6bSDkk+qBVrwN+filESlYrVBk3W6m+k
	q6WrpXvLu1sKSkkAx8uWPatgPq++NKDNi+B1XMSo5/HiNMgLdFN6ZLWkvs+aTfaD1d37ce
	j4u3g2Th1NSWkY6ez73FCCeVl5G44a/jQSWjBHHH0FueldT+1mkuVBdo5Y8Q+w==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH 1/2] scripts/resulttool: limit the number of changes displayed per test
Date: Thu, 19 Oct 2023 11:53:51 +0200
Message-ID: <20231019095352.25923-2-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231019095352.25923-1-alexis.lothore@bootlin.com>
References: <20231019095352.25923-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 09:52:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189439

From: Alexis Lothoré <alexis.lothore@bootlin.com>

Most of the changes list generated in regression reports fall in one
of the two following categories:
- there is only a few (<10) changes listed and the info is
  valuable/relevant
- the list is huge (> 100 ? 1000 ?) and basically tells us that the whole
  tests category suffers the same status (test missing, test failing, test
  skipped, etc)

Prevent those huge, worthless lists by limiting the output for each test
result pair:
- current default limit is arbitrarily set to 50
- limit can still be overriden with a new "-l"/"--limit" flag, either with
  custom value, or with 0 to print the whole lists of changes

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 scripts/lib/resulttool/regression.py | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/resulttool/regression.py b/scripts/lib/resulttool/regression.py
index 3d64b8f4af7c..5c5ed6e6a670 100644
--- a/scripts/lib/resulttool/regression.py
+++ b/scripts/lib/resulttool/regression.py
@@ -78,6 +78,8 @@ STATUS_STRINGS = {
     "None": "No matching test result"
 }
 
+REGRESSIONS_DISPLAY_LIMIT=50
+
 def test_has_at_least_one_matching_tag(test, tag_list):
     return "oetags" in test and any(oetag in tag_list for oetag in test["oetags"])
 
@@ -181,11 +183,12 @@ def get_status_str(raw_status):
     raw_status_lower = raw_status.lower() if raw_status else "None"
     return STATUS_STRINGS.get(raw_status_lower, raw_status)
 
-def compare_result(logger, base_name, target_name, base_result, target_result):
+def compare_result(logger, base_name, target_name, base_result, target_result, display_limit):
     base_result = base_result.get('result')
     target_result = target_result.get('result')
     result = {}
     new_tests = 0
+    regressions_count = 0
 
     if base_result and target_result:
         for k in base_result:
@@ -212,7 +215,14 @@ def compare_result(logger, base_name, target_name, base_result, target_result):
             resultstring = "Regression:  %s\n             %s\n" % (base_name, target_name)
             for k in sorted(result):
                 if not result[k]['target'] or not result[k]['target'].startswith("PASS"):
-                    resultstring += '    %s: %s -> %s\n' % (k, get_status_str(result[k]['base']), get_status_str(result[k]['target']))
+                    # Count regressions only if we have to limit the number of
+                    # displayed regressions
+                    if display_limit > 0:
+                        regressions_count = regressions_count + 1
+                    if regressions_count <= display_limit:
+                        resultstring += '    %s: %s -> %s\n' % (k, get_status_str(result[k]['base']), get_status_str(result[k]['target']))
+            if regressions_count > display_limit:
+                resultstring += f'    [...]\n    (In total, {regressions_count} regressions/status changes detected)\n'
             if new_pass_count > 0:
                 resultstring += f'    Additionally, {new_pass_count} previously failing test(s) is/are now passing\n'
         else:
@@ -263,6 +273,10 @@ def regression_common(args, logger, base_results, target_results):
     if args.target_result_id:
         target_results = resultutils.filter_resultsdata(target_results, args.target_result_id)
 
+    display_limit=REGRESSIONS_DISPLAY_LIMIT
+    if args.limit:
+        display_limit=int(args.limit)
+
     fixup_ptest_names(base_results, logger)
     fixup_ptest_names(target_results, logger)
 
@@ -280,7 +294,7 @@ def regression_common(args, logger, base_results, target_results):
                 for b in target.copy():
                     if not can_be_compared(logger, base_results[a][c], target_results[a][b]):
                         continue
-                    res, resstr = compare_result(logger, c, b, base_results[a][c], target_results[a][b])
+                    res, resstr = compare_result(logger, c, b, base_results[a][c], target_results[a][b], display_limit)
                     if not res:
                         matches.append(resstr)
                         base.remove(c)
@@ -291,7 +305,7 @@ def regression_common(args, logger, base_results, target_results):
                 for b in target:
                     if not can_be_compared(logger, base_results[a][c], target_results[a][b]):
                         continue
-                    res, resstr = compare_result(logger, c, b, base_results[a][c], target_results[a][b])
+                    res, resstr = compare_result(logger, c, b, base_results[a][c], target_results[a][b], display_limit)
                     if res:
                         regressions.append(resstr)
         else:
@@ -403,4 +417,5 @@ def register_commands(subparsers):
     parser_build.add_argument('--commit-number', help="Revision number to search for, redundant if --commit is specified")
     parser_build.add_argument('--commit2', help="Revision to compare with")
     parser_build.add_argument('--commit-number2', help="Revision number to compare with, redundant if --commit2 is specified")
+    parser_build.add_argument('-l', '--limit', default=REGRESSIONS_DISPLAY_LIMIT, help="Maximum number of changes to display per test. Can be set to 0 to print all changes")
 
-- 
2.42.0



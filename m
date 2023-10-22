Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72167C25B42
	for <webhook@archiver.kernel.org>; Sun, 22 Oct 2023 17:49:05 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.103460.1697996934731249052
 for <Openembedded-core@lists.openembedded.org>;
 Sun, 22 Oct 2023 10:48:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KLavJQr4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F17A1E0004;
	Sun, 22 Oct 2023 17:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697996933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BQdKol0rV2WRIfYQSV58X1fgrx9/ULYzMBwSPZhE9hk=;
	b=KLavJQr4ErM1mpvK1Zs5/bckKowNOV0uQKswxUQ4Dw9cFipi+8OCv0j/dDh7kP4e+2c918
	EY1PT3562s3RaO2JoGYQ/Idzgt4W+WIVIv61QHzL6T9o9qGeJU7as5ZtrlO/BtZQsrNtjE
	ZEQbWVUF3ns6dnBmPGwc1m/ssHT56Yu26dp/fhjMprQLvOWwzGP/RHiCFgMrHWR67tZp8f
	xLZxhRufrxO/ngAduvvS/gU9WT8tkOaM0Ga5SUc5WX7AM07PFNkeBdhO8vl+QkbM7s8iYu
	D7jkYkoJlCk0bmccmy18NfG+Suq6nxzV9Ibp9a1TPSnZV3j4vTbzrQ/el2W+wA==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH v2 1/4] scripts/resulttool: limit the number of changes displayed per test
Date: Sun, 22 Oct 2023 19:49:35 +0200
Message-ID: <20231022174938.7012-2-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231022174938.7012-1-alexis.lothore@bootlin.com>
References: <20231022174938.7012-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Oct 2023 17:49:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189608

From: Alexis Lothoré <alexis.lothore@bootlin.com>

Most of the changes list generated in regression reports fall in one
of the two following categories:
- there is only a few (<10) changes listed and the info is
  valuable/relevant
- the list is huge (> 100 ? 1000 ?) and basically tells us that the whole
  tests category suffers the same status (test missing, test failing, test
  skipped, etc)

Prevent those huge, worthless lists by limiting the output for each test
group:
- current default limit is arbitrarily set to 50
- limit can still be overriden with a new "-l"/"--limit" flag, either with
  custom value, or with 0 to print the whole lists of changes
- limit is applied per test family: currently it distinguishes only types
  of ptests, but it can be adapted to other kind of tests

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
Changes in v2:
- set the display limit per test category instead of one general limit
- add a "per group" count, additionally to the general regression count
- print total regressions count and "per group" regressions count on top of
  detailed report instead of bottom
- fix resulttool selftests
---
 scripts/lib/resulttool/regression.py | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/resulttool/regression.py b/scripts/lib/resulttool/regression.py
index 3d64b8f4af7c..d98504f4ced8 100644
--- a/scripts/lib/resulttool/regression.py
+++ b/scripts/lib/resulttool/regression.py
@@ -78,6 +78,8 @@ STATUS_STRINGS = {
     "None": "No matching test result"
 }
 
+REGRESSIONS_DISPLAY_LIMIT=50
+
 def test_has_at_least_one_matching_tag(test, tag_list):
     return "oetags" in test and any(oetag in tag_list for oetag in test["oetags"])
 
@@ -181,11 +183,15 @@ def get_status_str(raw_status):
     raw_status_lower = raw_status.lower() if raw_status else "None"
     return STATUS_STRINGS.get(raw_status_lower, raw_status)
 
-def compare_result(logger, base_name, target_name, base_result, target_result):
+def compare_result(logger, base_name, target_name, base_result, target_result, display_limit=None):
     base_result = base_result.get('result')
     target_result = target_result.get('result')
     result = {}
     new_tests = 0
+    regressions = {}
+    resultstring = ""
+
+    display_limit = int(display_limit) if display_limit else REGRESSIONS_DISPLAY_LIMIT
 
     if base_result and target_result:
         for k in base_result:
@@ -212,7 +218,17 @@ def compare_result(logger, base_name, target_name, base_result, target_result):
             resultstring = "Regression:  %s\n             %s\n" % (base_name, target_name)
             for k in sorted(result):
                 if not result[k]['target'] or not result[k]['target'].startswith("PASS"):
-                    resultstring += '    %s: %s -> %s\n' % (k, get_status_str(result[k]['base']), get_status_str(result[k]['target']))
+                    # Differentiate each ptest kind when listing regressions
+                    key = '.'.join(k.split('.')[:2]) if k.startswith('ptest') else k
+                    # Append new regression to corresponding test family
+                    regressions[key] = regressions.setdefault(key, []) + ['        %s: %s -> %s\n' % (k, get_status_str(result[k]['base']), get_status_str(result[k]['target']))]
+            resultstring += f"    Total: {sum([len(regressions[r]) for r in regressions])} new regression(s):\n"
+            for k in regressions:
+                resultstring += f"    {len(regressions[k])} regression(s) for {k}\n"
+                count_to_print=min([display_limit, len(regressions[k])]) if display_limit > 0 else len(regressions[k])
+                resultstring += ''.join(regressions[k][:count_to_print])
+                if count_to_print < len(regressions[k]):
+                    resultstring+='        [...]\n'
             if new_pass_count > 0:
                 resultstring += f'    Additionally, {new_pass_count} previously failing test(s) is/are now passing\n'
         else:
@@ -280,7 +296,7 @@ def regression_common(args, logger, base_results, target_results):
                 for b in target.copy():
                     if not can_be_compared(logger, base_results[a][c], target_results[a][b]):
                         continue
-                    res, resstr = compare_result(logger, c, b, base_results[a][c], target_results[a][b])
+                    res, resstr = compare_result(logger, c, b, base_results[a][c], target_results[a][b], args.limit)
                     if not res:
                         matches.append(resstr)
                         base.remove(c)
@@ -291,7 +307,7 @@ def regression_common(args, logger, base_results, target_results):
                 for b in target:
                     if not can_be_compared(logger, base_results[a][c], target_results[a][b]):
                         continue
-                    res, resstr = compare_result(logger, c, b, base_results[a][c], target_results[a][b])
+                    res, resstr = compare_result(logger, c, b, base_results[a][c], target_results[a][b], args.limit)
                     if res:
                         regressions.append(resstr)
         else:
@@ -403,4 +419,5 @@ def register_commands(subparsers):
     parser_build.add_argument('--commit-number', help="Revision number to search for, redundant if --commit is specified")
     parser_build.add_argument('--commit2', help="Revision to compare with")
     parser_build.add_argument('--commit-number2', help="Revision number to compare with, redundant if --commit2 is specified")
+    parser_build.add_argument('-l', '--limit', default=REGRESSIONS_DISPLAY_LIMIT, help="Maximum number of changes to display per test. Can be set to 0 to print all changes")
 
-- 
2.42.0



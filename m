Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53357C7EE30
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 18:10:50 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.31412.1677607841424292878
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Feb 2023 10:10:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=APv6p0VI;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: alexis.lothore@bootlin.com)
Received: (Authenticated sender: alexis.lothore@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CBC83100012;
	Tue, 28 Feb 2023 18:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677607840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+tiNaNPBfVSQfRsh8p6X53eS0F+1MHfIqXiSXbSubz0=;
	b=APv6p0VI2n60WDEgD9A8R4FyOIbnTZ3K2MnfnAjyob2zkjEF67uKM1+txuVE5zY3d+k6sa
	/cmleev5M+s0Mb+z+8fFbZSxWhA/FR+RQTVCX8zevKNRU6Wf1XRX+Zp94rmB10tOYgsaGE
	JnZtAV6FNfLNOG4FDb6h1ngby5vRoIjlIy2yo+fqdXzF9kSMdwoTM1LlNqK0J8mxaN84Xc
	1x6u1NVphtfTSxHKAzZeG2D8H0Y4LHqbF26BDCcN3XruWgTOhXbIQBAa1ZuDlJPka1Orf9
	upBsxIHJwbWDXC3yEEhVTOtpRhM35ZW46pCtndQqTM02tN2Yq86jwssNiDrZRQ==
From: alexis.lothore@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com,
	thomas.petazzoni@bootlin.com
Subject: [PATCH 6/6] scripts/resulttool: do not count newly passing tests as regressions
Date: Tue, 28 Feb 2023 19:10:52 +0100
Message-Id: <20230228181052.4191521-9-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230228181052.4191521-1-alexis.lothore@bootlin.com>
References: <20230228181052.4191521-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 18:10:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177855

From: Alexis Lothoré <alexis.lothore@bootlin.com>

resulttool regression module simply compare a base test status to a target test
result status. This approach raises many false positives since all XXX -> PASS
transitions (XXX being any status different from PASS) are flagged as
regression.

- Do not list XXX -> PASS transitions in regression  report, instead count them
  and print a summary of "newly passing tests"
- If an inspected pair has only "newly passing tests", do not print detailed
  list and print it as "Improvement" instead of "Regression"

Updated output example looks like the following:
[...]
Improvement: oeselftest_fedora-37_qemux86-64_20230127010225
             oeselftest_ubuntu-22.04_qemux86-64_20230226120516
             (+1 test(s) passing)
[...]
Match:       oeselftest_almalinux-8.7_qemuarm64_20230127015830
             oeselftest_almalinux-8.7_qemuarm64_20230227015258
[...]
Regression:  oeselftest_almalinux-9.1_qemumips_20230127000217
             oeselftest_opensuseleap-15.4_qemumips_20230226130046
    ptestresult.glibc-user.debug/tst-read-chk-cancel: PASS -> None
    ptestresult.glibc-user.nptl/tst-mutexpi4: PASS -> FAIL
    ptestresult.glibc-user.nptl/tst-mutexpi5a: PASS -> FAIL
    Additionally, 44 previously failing test(s) is/are now passing

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 scripts/lib/resulttool/regression.py | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/resulttool/regression.py b/scripts/lib/resulttool/regression.py
index d7f0b16ca98..1facbcd85e1 100644
--- a/scripts/lib/resulttool/regression.py
+++ b/scripts/lib/resulttool/regression.py
@@ -190,11 +190,20 @@ def compare_result(logger, base_name, target_name, base_result, target_result):
             else:
                 logger.error('Failed to retrieved base test case status: %s' % k)
     if result:
-        resultstring = "Regression: %s\n            %s\n" % (base_name, target_name)
-        for k in sorted(result):
-            resultstring += '    %s: %s -> %s\n' % (k, result[k]['base'], result[k]['target'])
+        new_pass_count = sum(test['target'] is not None and test['target'].startswith("PASS") for test in result.values())
+        # Print a regression report only if at least one test has a regression status (FAIL, SKIPPED, absent...)
+        if new_pass_count < len(result):
+            resultstring = "Regression:  %s\n             %s\n" % (base_name, target_name)
+            for k in sorted(result):
+                if not result[k]['target'] or not result[k]['target'].startswith("PASS"):
+                    resultstring += '    %s: %s -> %s\n' % (k, result[k]['base'], result[k]['target'])
+            if new_pass_count > 0:
+                resultstring += f'    Additionally, {new_pass_count} previously failing test(s) is/are now passing\n'
+        else:
+            resultstring = "Improvement: %s\n             %s\n             (+%d test(s) passing)" % (base_name, target_name, new_pass_count)
+            result = None
     else:
-        resultstring = "Match: %s\n       %s" % (base_name, target_name)
+        resultstring = "Match:       %s\n             %s" % (base_name, target_name)
     return result, resultstring
 
 def get_results(logger, source):
@@ -269,9 +278,9 @@ def regression_common(args, logger, base_results, target_results):
         else:
             notfound.append("%s not found in target" % a)
     print("\n".join(sorted(matches)))
+    print("\n")
     print("\n".join(sorted(regressions)))
     print("\n".join(sorted(notfound)))
-
     return 0
 
 def regression_git(args, logger):
-- 
2.39.1



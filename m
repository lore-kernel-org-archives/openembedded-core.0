Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97AFDCDB474
	for <webhook@archiver.kernel.org>; Sun, 22 Oct 2023 17:49:05 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.103461.1697996935013503866
 for <Openembedded-core@lists.openembedded.org>;
 Sun, 22 Oct 2023 10:48:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CzY1/J8o;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7FCE4E0006;
	Sun, 22 Oct 2023 17:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697996933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8qFDqs0CIE77srTuCv14ZOAThd/Pwa+890knaw2wJbk=;
	b=CzY1/J8oFX1lrxLptCjvwJUMWmLl5v/NZZX0y8XW6EGanZy7SCz9GOK63g9NV5InuhoHr1
	6R2hPGlVgfcX/a7/K3HPaji1gyJkCYe7o6lzD5qVyCCN2NMsnVJtwytFIpZ+z2vMv2BPbf
	ZqJq1FjndgQo6pCEpCQFKoStvvyJKeVBYPBwcwlrcqbbIpyaAQXzI7Mmgvuh7arz3bpRhQ
	I4/wXDzyh3Q215Tn5pZQrVCWrJlBMIc8xATBJohsR8mZD7fXt94LENaNQfHuH1DUQ+A/eh
	/Wt2YtsVEpVgFE1hB8wBOdmVosp3F1AHY2388w71BNwCunYrWg92mSaHv1lsow==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH v2 3/4] scripts/resulttool: make additional info more compact
Date: Sun, 22 Oct 2023 19:49:37 +0200
Message-ID: <20231022174938.7012-4-alexis.lothore@bootlin.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189607

From: Alexis Lothoré <alexis.lothore@bootlin.com>

Since "matched" and "improved" tests are not as important as regressions,
reduce the place they take in the regression report:

- merge "matched" and "improved" tests, while removing the label
- add a single line of additional info per pair

Those changes make the "Matches and improvements" look like the following
sample:

oeselftest_almalinux-9.2_qemux86-64_20230910083156
oeselftest_almalinux-8.8_qemux86-64_20231018010951
    -> +7 test(s) present

oeselftest_almalinux-9.2_qemux86-64_20230911010538
oeselftest_debian-11_qemux86-64_20231017150459

oeselftest_debian-11_qemux86-64_20230910012927
oeselftest_debian-11_qemux86-64_20231017151319
    -> +7 test(s) present
[...]

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 scripts/lib/resulttool/regression.py | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/resulttool/regression.py b/scripts/lib/resulttool/regression.py
index 560d102e172c..8fbe5a54783a 100644
--- a/scripts/lib/resulttool/regression.py
+++ b/scripts/lib/resulttool/regression.py
@@ -186,6 +186,18 @@ def get_status_str(raw_status):
     raw_status_lower = raw_status.lower() if raw_status else "None"
     return STATUS_STRINGS.get(raw_status_lower, raw_status)
 
+def get_additional_info_line(new_pass_count, new_tests):
+    result=[]
+    if new_tests:
+        result.append(f'+{new_tests} test(s) present')
+    if new_pass_count:
+        result.append(f'+{new_pass_count} test(s) now passing')
+
+    if not result:
+        return ""
+
+    return '    -> ' + ', '.join(result) + '\n'
+
 def compare_result(logger, base_name, target_name, base_result, target_result, display_limit=None):
     base_result = base_result.get('result')
     target_result = target_result.get('result')
@@ -193,6 +205,8 @@ def compare_result(logger, base_name, target_name, base_result, target_result, d
     new_tests = 0
     regressions = {}
     resultstring = ""
+    new_tests = 0
+    new_pass_count = 0
 
     display_limit = int(display_limit) if display_limit else REGRESSIONS_DISPLAY_LIMIT
 
@@ -234,14 +248,19 @@ def compare_result(logger, base_name, target_name, base_result, target_result, d
                     resultstring+='        [...]\n'
             if new_pass_count > 0:
                 resultstring += f'    Additionally, {new_pass_count} previously failing test(s) is/are now passing\n'
+            if new_tests > 0:
+                resultstring += f'    Additionally, {new_tests} new test(s) is/are present\n'
         else:
-            resultstring = "Improvement: %s\n             %s\n             (+%d test(s) passing)\n" % (base_name, target_name, new_pass_count)
+            resultstring = "%s\n%s\n" % (base_name, target_name)
             result = None
     else:
-        resultstring = "Match:       %s\n             %s\n" % (base_name, target_name)
+        resultstring = "%s\n%s\n" % (base_name, target_name)
+
+    if not result:
+        additional_info = get_additional_info_line(new_pass_count, new_tests)
+        if additional_info:
+            resultstring += additional_info
 
-    if new_tests > 0:
-        resultstring += f'    Additionally, {new_tests} new test(s) is/are present\n'
     return result, resultstring
 
 def get_results(logger, source):
-- 
2.42.0



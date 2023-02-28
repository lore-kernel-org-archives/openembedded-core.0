Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8658CC7EE33
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 18:10:40 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.31355.1677607837255983553
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Feb 2023 10:10:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kt/CaPQy;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: alexis.lothore@bootlin.com)
Received: (Authenticated sender: alexis.lothore@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A6660100005;
	Tue, 28 Feb 2023 18:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677607836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jdhv5J5uXoxFm30YIAvsGV8jjaRhkTuxANhDW0rUmIk=;
	b=kt/CaPQyyTmktzpTlOt3r1DhBuvuj6EJW1dnVd7LCNIHe7003PED8qsf7KhqHlkDKP6RLv
	UiJ6pQyfjhvvr5MuH1SDIalwvOjUZ15wnGpC4sHUEvKrheXO8/Cvrnt6QDZyIy5Hfrt78V
	aBDu8HpGLgd/a0OpoCnoX+eJFRwAMpZL1PaIXN8n/2qEKqqn9do49BIPYbRReE8soH6Lwx
	KjNEo8Ctpfbv/6r7PVaIVR4j2FVETeW+DMWT5Qnn1Rrhd4oyZTc8Q9LGLa/N7Vc73srntb
	6BN7cNo/0eKOtVdjSo86INZwkd1y8cIe7iVpPNVwvHK5fhaUsgcrz5BVt570Ew==
From: alexis.lothore@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com,
	thomas.petazzoni@bootlin.com
Subject: [PATCH 1/6] scripts/resulttool: call fixup_ptest_names in regression_common
Date: Tue, 28 Feb 2023 19:10:45 +0100
Message-Id: <20230228181052.4191521-2-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230228181052.4191521-1-alexis.lothore@bootlin.com>
References: <20230228181052.4191521-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 18:10:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177850

From: Alexis Lothoré <alexis.lothore@bootlin.com>

ptests names not only need to be fixed for regression based on git testresults
but also for testsresults provided "manually"

Move ptests naming fixup in regression_common to share the fixup between both
regression use cases

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 scripts/lib/resulttool/regression.py | 41 ++++++++++++++--------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/scripts/lib/resulttool/regression.py b/scripts/lib/resulttool/regression.py
index 74fd5f38951..ad377c596b6 100644
--- a/scripts/lib/resulttool/regression.py
+++ b/scripts/lib/resulttool/regression.py
@@ -206,12 +206,32 @@ def regression(args, logger):
 
     regression_common(args, logger, base_results, target_results)
 
+# Some test case naming is poor and contains random strings, particularly lttng/babeltrace.
+# Truncating the test names works since they contain file and line number identifiers
+# which allows us to match them without the random components.
+def fixup_ptest_names(results, logger):
+    for r in results:
+        for i in results[r]:
+            tests = list(results[r][i]['result'].keys())
+            for test in tests:
+                new = None
+                if test.startswith(("ptestresult.lttng-tools.", "ptestresult.babeltrace.", "ptestresult.babeltrace2")) and "_-_" in test:
+                    new = test.split("_-_")[0]
+                elif test.startswith(("ptestresult.curl.")) and "__" in test:
+                    new = test.split("__")[0]
+                if new:
+                    results[r][i]['result'][new] = results[r][i]['result'][test]
+                    del results[r][i]['result'][test]
+
 def regression_common(args, logger, base_results, target_results):
     if args.base_result_id:
         base_results = resultutils.filter_resultsdata(base_results, args.base_result_id)
     if args.target_result_id:
         target_results = resultutils.filter_resultsdata(target_results, args.target_result_id)
 
+    fixup_ptest_names(base_results, logger)
+    fixup_ptest_names(target_results, logger)
+
     matches = []
     regressions = []
     notfound = []
@@ -248,24 +268,6 @@ def regression_common(args, logger, base_results, target_results):
 
     return 0
 
-# Some test case naming is poor and contains random strings, particularly lttng/babeltrace.
-# Truncating the test names works since they contain file and line number identifiers
-# which allows us to match them without the random components.
-def fixup_ptest_names(results, logger):
-    for r in results:
-        for i in results[r]:
-            tests = list(results[r][i]['result'].keys())
-            for test in tests:
-                new = None
-                if test.startswith(("ptestresult.lttng-tools.", "ptestresult.babeltrace.", "ptestresult.babeltrace2")) and "_-_" in test:
-                    new = test.split("_-_")[0]
-                elif test.startswith(("ptestresult.curl.")) and "__" in test:
-                    new = test.split("__")[0]
-                if new:
-                    results[r][i]['result'][new] = results[r][i]['result'][test]
-                    del results[r][i]['result'][test]
-
-
 def regression_git(args, logger):
     base_results = {}
     target_results = {}
@@ -327,9 +329,6 @@ def regression_git(args, logger):
     base_results = resultutils.git_get_result(repo, revs[index1][2])
     target_results = resultutils.git_get_result(repo, revs[index2][2])
 
-    fixup_ptest_names(base_results, logger)
-    fixup_ptest_names(target_results, logger)
-
     regression_common(args, logger, base_results, target_results)
 
     return 0
-- 
2.39.1



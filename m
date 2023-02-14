Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88866C6379F
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 16:53:25 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.12510.1676393595460063016
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 08:53:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AzYOA+ih;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexis.lothore@bootlin.com)
Received: (Authenticated sender: alexis.lothore@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D495CFF80B;
	Tue, 14 Feb 2023 16:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676393594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=heB1vGl9ENAmE+gwjcV10BuYSuD6f+MBxv3U3Vd+yzU=;
	b=AzYOA+ihH3/D6+C2kwwNsSe7MBPEsDdwRnPc6OG5OJX9QVwqy2NYOhPhyBw7eTjRfpzqUs
	AoET3f7PGU2/CxP+ZJYzYbMdHGcUZFNiwu1yC4A46H455I2shI5SwSLXQXPFhlSXefdBhb
	u7/SZXl5MFHrLw8xMovSCVca9GNbt1cGgNutYC8jqaRp1cw1FOkFOJXRiNHc6vMIqKVTUI
	PWGkl4+4FNpFBqh8RVxPUsIlQ3TtmjdvesUjWRySrcS5qBQr3e3qyxgD0uPyL9+0lZpY4o
	VNFGFpiWO/fS/DHD6j0J2fs88bQlaj8JVe4ATeSeZeLimx0UjsBZNFgXizgQhA==
From: alexis.lothore@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com,
	thomas.petazzoni@bootlin.com
Subject: [PATCH v2 3/4] scripts/resulttool/regression: add metadata filtering for oeselftest
Date: Tue, 14 Feb 2023 17:53:08 +0100
Message-Id: <20230214165309.63527-4-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214165309.63527-1-alexis.lothore@bootlin.com>
References: <20230214165309.63527-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 16:53:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177164

From: Alexis Lothoré <alexis.lothore@bootlin.com>

When generating regression reports, many false positive can be observed since
some tests results are compared while the corresponding tests sets are not the
same, as it can be seen for example for oeselftest tests (oeselftest is run
multiple time but with different parameters, resulting in different tests sets)

Add a filtering mechanism in resulttool regression module to enable a better
matching between tests. The METADATA_MATCH_TABLE defines that when the TEST_TYPE
is "oeselftest", then resulttool should filter pairs based on
OESELFTEST_METADATA appended to test configuration. If metadata is absent from
"base" test results, tests are marked "comparable" to preserve compatibility
with test results which still do not have those new metadata.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 scripts/lib/resulttool/regression.py | 34 ++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/scripts/lib/resulttool/regression.py b/scripts/lib/resulttool/regression.py
index 9f952951b3..64d1eeee37 100644
--- a/scripts/lib/resulttool/regression.py
+++ b/scripts/lib/resulttool/regression.py
@@ -12,6 +12,36 @@ import json
 from oeqa.utils.git import GitRepo
 import oeqa.utils.gitarchive as gitarchive
 
+METADATA_MATCH_TABLE={
+    "oeselftest": "OESELFTEST_METADATA"
+}
+
+
+def metadata_matches(base_configuration, target_configuration):
+    """
+    For passed base and target, check test type. If test type matches one of
+    properties described in METADATA_MATCH_TABLE, compare metadata if it is
+    present in base. Return true if metadata matches, or if base lacks some
+    data (either TEST_TYPE or the corresponding metadata)
+    """
+    test_type=base_configuration.get('TEST_TYPE')
+    metadata_key=METADATA_MATCH_TABLE.get(test_type)
+    if metadata_key not in base_configuration:
+        return True
+
+    if target_configuration.get(metadata_key) != base_configuration[metadata_key]:
+        return False
+
+    return True
+
+def can_be_compared(base_configuration, target_configuration):
+    """
+    Some tests are not relevant to be compared, for example some oeselftest
+    run with different tests sets or parameters. Return true if tests can be
+    compared
+    """
+    return metadata_matches(base_configuration, target_configuration)
+
 def compare_result(logger, base_name, target_name, base_result, target_result):
     base_result = base_result.get('result')
     target_result = target_result.get('result')
@@ -62,6 +92,8 @@ def regression_common(args, logger, base_results, target_results):
             # removing any pairs which match
             for c in base.copy():
                 for b in target.copy():
+                    if not can_be_compared(base_results[a][c]['configuration'], target_results[a][b]['configuration']):
+                        continue
                     res, resstr = compare_result(logger, c, b, base_results[a][c], target_results[a][b])
                     if not res:
                         matches.append(resstr)
@@ -71,6 +103,8 @@ def regression_common(args, logger, base_results, target_results):
             # Should only now see regressions, we may not be able to match multiple pairs directly
             for c in base:
                 for b in target:
+                    if not can_be_compared(base_results[a][c]['configuration'], target_results[a][b]['configuration']):
+                        continue
                     res, resstr = compare_result(logger, c, b, base_results[a][c], target_results[a][b])
                     if res:
                         regressions.append(resstr)
-- 
2.39.1



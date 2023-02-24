Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9578AC7EE31
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 16:46:01 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.22869.1677257155218692058
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 08:45:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Cb1iBAyB;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: alexis.lothore@bootlin.com)
Received: (Authenticated sender: alexis.lothore@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 99832100003;
	Fri, 24 Feb 2023 16:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677257153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wny86nfBwibXwGz6ynB3IsyCgb9YKCAKsUpGs7je1uM=;
	b=Cb1iBAyBWPMC1Skz+jhHUnFyNmZftFG8g9ZNKnvlVZjv/d+ceQBJ7AJXXLlLgHxqMfmg/T
	TMqaArvOJ4OzljOSwRxiO9pdK6sNkTset2Gy25GthyuOoyerGOB5haQDBzvfaTktcF/t6T
	y05/chKGe7hDTyUAfVwcUuiFOGYshjzNEfboAWCe+F1KRWrsoy6M5jGz03AdVw38Hddl0a
	nqFGb3Z2Z2vzDyE0DQkz6N6MQCDYx7qUS95OByymLeNf4e6JMCA7QRd65OXtlLWWirmLcC
	VgY593npvonaxdhrg5uYLR1P+K7QzMqL0Zb90w0/I7BH7U+8ZB2b7HF/gviG3w==
From: alexis.lothore@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com,
	thomas.petazzoni@bootlin.com
Subject: [PATCH v3 1/6] scripts/oe-selftest: append metadata to tests results
Date: Fri, 24 Feb 2023 17:45:50 +0100
Message-Id: <20230224164555.67634-2-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230224164555.67634-1-alexis.lothore@bootlin.com>
References: <20230224164555.67634-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 16:46:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177699

From: Alexis Lothoré <alexis.lothore@bootlin.com>

Many stored results TEST_TYPE are set to "oeselftest", however all those
tests are not run with the same sets of parameters, so those tests results may
not be comparable.

Attach relevant parameters as tests metadata to allow identifying tests
configuration so we can compare tests only when they are run with the same
parameters.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 meta/lib/oeqa/selftest/context.py | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index c7dd03ce378..8cc46283ed0 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -22,6 +22,17 @@ from oeqa.core.exception import OEQAPreRun, OEQATestNotFound
 
 from oeqa.utils.commands import runCmd, get_bb_vars, get_test_layer
 
+OESELFTEST_METADATA=["run_all_tests", "run_tests", "skips", "machine", "select_tags", "exclude_tags"]
+
+def get_oeselftest_metadata(args):
+    result = {}
+    raw_args = vars(args)
+    for metadata in OESELFTEST_METADATA:
+        if metadata in raw_args:
+            result[metadata] = raw_args[metadata]
+
+    return result
+
 class NonConcurrentTestSuite(unittest.TestSuite):
     def __init__(self, suite, processes, setupfunc, removefunc):
         super().__init__([suite])
@@ -334,12 +345,14 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         import platform
         from oeqa.utils.metadata import metadata_from_bb
         metadata = metadata_from_bb()
+        oeselftest_metadata = get_oeselftest_metadata(args)
         configuration = {'TEST_TYPE': 'oeselftest',
                         'STARTTIME': args.test_start_time,
                         'MACHINE': self.tc.td["MACHINE"],
                         'HOST_DISTRO': oe.lsb.distro_identifier().replace(' ', '-'),
                         'HOST_NAME': metadata['hostname'],
-                        'LAYERS': metadata['layers']}
+                        'LAYERS': metadata['layers'],
+                        'OESELFTEST_METADATA':oeselftest_metadata}
         return configuration
 
     def get_result_id(self, configuration):
-- 
2.39.1



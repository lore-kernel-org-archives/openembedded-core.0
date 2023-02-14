Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB7C2C05027
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 13:52:44 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.7218.1676382755413927752
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 05:52:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=b600H4mU;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexis.lothore@bootlin.com)
Received: (Authenticated sender: alexis.lothore@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 864826001E;
	Tue, 14 Feb 2023 13:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676382754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PCryuzwuTY3LihaztfrnyLxpzqhPYDg+ZmkWNWki/ls=;
	b=b600H4mUQsp3UBRnDOhZWqmLWEWrwHbxp0b2tZL7i+U04bA8iw+VnSy5jI1CodOJLzylld
	KAwOEdVjcqKWeXTsigRLw26oxGz8jAdl5t/RN7MRY+lc5GHVCaNlBgUJI+MKlT3tkVWW0z
	lpFMF33NjIrcRW2GnIoYyn12TqGbp52UYl3maUT5MPx6tLZVSDnLJ6Ox7vfFrV3YcyP3Mr
	BgW8f+WS4yDB0F/bTpneagRPqKYV/9vQp4uhrECocnESFDyFV1TLY8fqE2lPapSvRxs0cu
	qU5LwVZxDgl1iW/TEyQipqxIw9euFrSRH7imn3/P8ReVtFccCrKMe35tfU5Suw==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com,
	thomas.petazzoni@bootlin.com
Subject: [PATCH 1/4] scripts/oe-selftest: append metadata to tests results
Date: Tue, 14 Feb 2023 14:52:11 +0100
Message-Id: <20230214135214.42413-2-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214135214.42413-1-alexis.lothore@bootlin.com>
References: <20230214135214.42413-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 13:52:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177142

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
index c7dd03ce37..8cc46283ed 100644
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



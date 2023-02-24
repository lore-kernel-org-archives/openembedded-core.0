Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7871CC7EE23
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 16:46:01 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.22871.1677257157557812787
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 08:45:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ooNH8LnW;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: alexis.lothore@bootlin.com)
Received: (Authenticated sender: alexis.lothore@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E90D9100008;
	Fri, 24 Feb 2023 16:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677257156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8b/VdszHhGr2cAhz112sW2HJEtRicSFp0i4Lzvd2UpU=;
	b=ooNH8LnWbehs3re4m3DXCdMXfl/Utla9El9JyjeKz6QSYiKUzcWBS5BlIPcOU8naHHAvmV
	t4H+1K0/KL6QRO46wez8z4Jb0KrCaiGXt76vXtI1sYz8ciMB5fnUFFQ4h2sjB2+0Rt3Fr2
	qekYpX4uxYNlVlFPdFutcBRzGMJ/OKqLVzGdJqx0c+mF0D469hDH+cYSt1eH4Nbx9hMWs6
	eS1CQ2Ld8TjXMyxu/LUcK91va/TriKFcv3QzN7AusAGd09vmZfZVed67WZj7xoFMsGT3Nm
	GbE2W4LjmW3KQPlVFf+MLZkUpckxwEtCvxB3/AX6d/TazBFL8IAFU6IcUk9SHw==
From: alexis.lothore@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com,
	thomas.petazzoni@bootlin.com
Subject: [PATCH v3 6/6] oeqa/selftest: add test for yocto_testresults_query.py
Date: Fri, 24 Feb 2023 17:45:55 +0100
Message-Id: <20230224164555.67634-7-alexis.lothore@bootlin.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177704

From: Alexis Lothoré <alexis.lothore@bootlin.com>

Add some tests for new yocto_testresults_query.py helper. First test is taken
from yocto-autobuilder-helper feature which has moved in yocto_testresults_query

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 .../cases/yoctotestresultsquerytests.py       | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/yoctotestresultsquerytests.py

diff --git a/meta/lib/oeqa/selftest/cases/yoctotestresultsquerytests.py b/meta/lib/oeqa/selftest/cases/yoctotestresultsquerytests.py
new file mode 100644
index 00000000000..312edb64319
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/yoctotestresultsquerytests.py
@@ -0,0 +1,39 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+import os
+import sys
+import subprocess
+import shutil
+from oeqa.selftest.case import OESelftestTestCase
+from yocto_testresults_query import get_sha1, create_workdir
+basepath = os.path.abspath(os.path.dirname(__file__) + '/../../../../../')
+lib_path = basepath + '/scripts/lib'
+sys.path = sys.path + [lib_path]
+
+
+class TestResultsQueryTests(OESelftestTestCase):
+    def test_get_sha1(self):
+        test_data_get_sha1 = [
+            {"input": "yocto-4.0", "expected": "00cfdde791a0176c134f31e5a09eff725e75b905"},
+            {"input": "4.1_M1", "expected": "95066dde6861ee08fdb505ab3e0422156cc24fae"},
+        ]
+        for data in test_data_get_sha1:
+            test_name = data["input"]
+            with self.subTest(f"Test SHA1 from {test_name}"):
+                self.assertEqual(
+                    get_sha1(basepath, data["input"]), data["expected"])
+
+    def test_create_workdir(self):
+        workdir = create_workdir()
+        try:
+            url = subprocess.check_output(
+                ["git", "-C", workdir, "remote", "get-url", "origin"]).strip().decode("utf-8")
+        except:
+            shutil.rmtree(workdir, ignore_errors=True)
+            self.fail(f"Can not execute git commands in {workdir}")
+        shutil.rmtree(workdir)
+        self.assertEqual(url, "git://git.yoctoproject.org/yocto-testresults")
-- 
2.39.1



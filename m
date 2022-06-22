Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E24CCA481
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 10:33:51 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web12.5620.1655894025982636574
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 03:33:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=msuqcAsH;
 spf=pass (domain: gmail.com, ip: 209.85.218.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id t5so732802eje.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 03:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fVzUdEQtYCEMNZ4BkUSf64NYSOpz4gqJg7Pl22v6FgU=;
        b=msuqcAsHW5xiMMrJo6QLeR6EzIW9D5qPao/WYwhEnAqO84ybPLgwhkWKGX3K67uIwo
         dIiW3jmdWvF06RpUWPk+9vx04ClkdNozzuxBV/iyLgbX7Nx+BdqVF1PZ/BdYxq88NLnd
         NzBN/tq0kCQnmuplpo9PzC7XTsJ7Mt4SH/cj5s7IBmqaJuAbPAGVurnmGwy9j3U9lFjb
         LtpUfp7IHQdKXYvABfRaUH5sMAmoi3XjOVXyvUVCZpGmiswEPZqD/pNpAtL7EkB8gGmc
         YVS0i+SwhyzgdAVVT6WDjo5+WI3h8qc0u2YZ4n5luh/EKgmvetBG20Y+u6e7LFUQPGDD
         Zm3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fVzUdEQtYCEMNZ4BkUSf64NYSOpz4gqJg7Pl22v6FgU=;
        b=LuLerovwxrs+T7Ovi5P79pn3KaNXKPgA3yejrwssGGcFcwMrFXufoFODTr6+bAorkG
         5/0k1gxqRi54iE6SI3P/Hl2JsGPMlBjbO7gEcroceUauapgLpCY4XlFOvvpyULrKiUn0
         RrcmjBNt6nrnkqflxYPvT4jMbci+Aso6li+xf44V9ikBMwdx77oCJyaLNBKxHEJaesO0
         jxRpDYzYpLApDl50tyUl7k5R46R+7yPr2nAlz0fNfTLQV9V5vezkvb+9jWlSikUDfgbe
         T6jBy/gpZfUP1CJaRcUuZhG998zRugx+NW5ouqUAVtBaQk8gABLwlU8AIdZ+26/2RZlz
         75Mw==
X-Gm-Message-State: AJIora808qYJ36dy6WNoUdy/pIVa/wiO6MbXqP8Y1NaaT8fFZY1RCzgX
	lf3FWtEIFj8yTAIvhVY+vijeiq/pvtLg+g==
X-Google-Smtp-Source: 
 AGRyM1srfs3Uz8F5uiNqwRdUtHl2gPLBNEZQzHPwN+X1ridPaTeT8LBqX78OgQW4V01OFp8hX91Hcg==
X-Received: by 2002:a17:907:a064:b0:711:c819:3cbf with SMTP id
 ia4-20020a170907a06400b00711c8193cbfmr2632681ejc.460.1655894024360;
        Wed, 22 Jun 2022 03:33:44 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 lb21-20020a170907785500b007219c20dcd8sm6315826ejc.196.2022.06.22.03.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 03:33:43 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH 3/6] oeqa/sdk: add a test class for running SDK tests
 directly in a Yocto build
Date: Wed, 22 Jun 2022 12:33:09 +0200
Message-Id: <20220622103312.1098389-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220622103312.1098389-1-alex@linutronix.de>
References: <20220622103312.1098389-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 10:33:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167230

This is a simpler version of the same class in testsdk.py, as it does not
need to unpack and set up the SDK, and can proceed to the tests straight away.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/sdk/testmetaidesupport.py | 43 +++++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 meta/lib/oeqa/sdk/testmetaidesupport.py

diff --git a/meta/lib/oeqa/sdk/testmetaidesupport.py b/meta/lib/oeqa/sdk/testmetaidesupport.py
new file mode 100644
index 0000000000..2ff76fd8e0
--- /dev/null
+++ b/meta/lib/oeqa/sdk/testmetaidesupport.py
@@ -0,0 +1,43 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+class TestSDK(object):
+    def run(self, d):
+        import json
+        import logging
+        from oeqa.sdk.context import OESDKTestContext, OESDKTestContextExecutor
+        from oeqa.utils import make_logger_bitbake_compatible
+
+        pn = d.getVar("PN")
+
+        logger = make_logger_bitbake_compatible(logging.getLogger("BitBake"))
+
+        sdk_dir = d.expand("${WORKDIR}/testsdk/")
+        bb.utils.remove(sdk_dir, True)
+        bb.utils.mkdirhier(sdk_dir)
+
+        sdk_envs = OESDKTestContextExecutor._get_sdk_environs(d.getVar("DEPLOY_DIR_IMAGE"))
+        tdname = d.expand("${DEPLOY_DIR_IMAGE}/${PN}.testdata.json")
+        test_data = json.load(open(tdname, "r"))
+
+        host_pkg_manifest = {"cmake-native":"", "gcc-cross":"", "gettext-native":"", "meson-native":"", "perl-native":"", "python3-core-native":"", }
+        target_pkg_manifest = {"gtk+3":""}
+
+        for s in sdk_envs:
+            bb.plain("meta-ide-support based SDK testing environment: %s" % s)
+
+            sdk_env = sdk_envs[s]
+
+            tc = OESDKTestContext(td=test_data, logger=logger, sdk_dir=sdk_dir,
+                sdk_env=sdk_env, target_pkg_manifest=target_pkg_manifest,
+                host_pkg_manifest=host_pkg_manifest)
+
+            tc.loadTests(OESDKTestContextExecutor.default_cases)
+
+            results = tc.runTests()
+            if results:
+                results.logSummary(pn)
+
+            if (not results) or (not results.wasSuccessful()):
+                bb.fatal('%s - FAILED' % (pn,), forcelog=True)
-- 
2.30.2



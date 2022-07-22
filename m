Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11677CCA48C
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 18:39:38 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web08.11359.1658515169257500002
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 11:39:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ALwi7uB1;
 spf=pass (domain: gmail.com, ip: 209.85.218.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id z23so9915296eju.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 11:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fVzUdEQtYCEMNZ4BkUSf64NYSOpz4gqJg7Pl22v6FgU=;
        b=ALwi7uB1+1t27DIn2FB+/ieOrp1GlPMmykcHvlo+qbdoc0U/A0xy/ipLC+J/pFb69q
         d4K4qr6DDAcveC1CCfYyCgu8mje8aQY/c+3K9qRv03NKS4MwYuJQzacAfU3hGuwjQZ5M
         T73Hro1uoOz4JFREkqYfuybDaTaRQ+thV+dhNaPYqb36Fc7WQU9HCo9KXnm9Hhqgmbyi
         Fe3p6+ro8Ter2Xg3TPggdPdZFiTLmOgRWmLbuDKJPEt5c5RKN3dbib2IRrQ2IgGcaiZL
         8UE3eXhD10gG/ub4ZV5I9BY4R5e2Lwp2Bmi+BIvIIWrQFax+AN34N2wLhG+DyANrMFTA
         ldgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fVzUdEQtYCEMNZ4BkUSf64NYSOpz4gqJg7Pl22v6FgU=;
        b=PjP4dkcsQFKXWAWLFXDuk4xXsR5hGYa3x8eZO/i/EnbrlKvMlJp1ToHqBfKqW4SpQa
         gWP8zFzScogTrVVPxTY+9GlzsjLxqrMgk2CmEBoD4ENVuC1ntETyH6Dlb8HC6rwmyxey
         XqkZA0miy9uiszY0EP6jy9OtGFDuJKwL3rrd0xd3QZXnKg5W9ISgainIOzcSnbJ1rz7Q
         OhRod5IQONFtEBiDL9FCS+L9DD5ZFTp574mqfMJ4+z8Yg5lUIPAcZihssNBQriNeP3Xj
         838rdbBk5XhvEKPFv87Y+EOOuS5/ulfg7IjhXX0cXvcZZnQZtO6RP0RxE+cmnAQgttiC
         10/A==
X-Gm-Message-State: AJIora8OD+tBueeq7AQeWC5/Kw9XxBUMpM4K8moh+80dZNQ0iU7n494p
	VvrjZqFeBHtFiCiN4/iHZEh/jLFdviY=
X-Google-Smtp-Source: 
 AGRyM1vBXMaE8nyUPIYF/DqMRDtqgH4YcrmMFK5AEGT7o+A7r4je8rbzKQmhXL+4Iy6Q658F69wcfQ==
X-Received: by 2002:a17:906:58d1:b0:72e:e049:cf00 with SMTP id
 e17-20020a17090658d100b0072ee049cf00mr889100ejs.361.1658515167746;
        Fri, 22 Jul 2022 11:39:27 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 bt8-20020a0564020a4800b0043bba5ed21csm2931885edb.15.2022.07.22.11.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 11:39:27 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/6] oeqa/sdk: add a test class for running SDK tests directly
 in a Yocto build
Date: Fri, 22 Jul 2022 20:39:13 +0200
Message-Id: <20220722183916.360600-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220722183916.360600-1-alex@linutronix.de>
References: <20220722183916.360600-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Jul 2022 18:39:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168420

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



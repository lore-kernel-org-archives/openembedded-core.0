Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8745C433FE
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 14:36:36 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web09.7492.1653489396199149259
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=xt/oHImk;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id b5so11696888plx.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=aIWsstHF5eZ1aNCdO0AYOi0TXnrOlpkNMyKZTl8lp2M=;
        b=xt/oHImkntRdQdVMdTcj/8715leXSnSa/HRvjt+M5Vw4D2cuyVXwDgbJX5omtckaLX
         NLx8/oqtuXvR3qn+GO/9Veww8iecISwN7KgyPwMSwuF/lJDv8b0jvnd9AwewOsPY0yH1
         oxJ8Bq2N2IG4n4/5YIC3t4BiPmyi7cxapShJkAY/OegFpRJQwgt0ACLOCyTGF1PwxUV2
         MRHQUcAdhnde3+1yUfm6Q9ZljbuUB+/GlJ5CFHke5xe2qJWGxVHV2A0yA01Za9eloIB9
         vceJjyiBQ4yd0NrD/RylAogdN9Hi9MGeUHWM2ZKDW3014FzQnXg07/Wmk9FHffkz2U81
         LZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aIWsstHF5eZ1aNCdO0AYOi0TXnrOlpkNMyKZTl8lp2M=;
        b=lRB4oUQgfKwlxfT1lhtBjRl1LbrSY0KPWrJkDqMQue0zoqBqMge7NlQ8qL07u40g4H
         8FPFbo32Pn+gt+d7NUj4mHT5AZSo6oWFYkaUHjtv2wMAvzhGNxa6jayaflD0i6QSA4Jo
         OvlkcLTvvALCeKfgqI2lZ8nRK8oq9s7ANDxGldWHPNtV5RPg+jaJUpgxtRHyzItw3XFE
         dw4M8XBQid0+YhuTabm8ToM+QEcvPzSOB5Zn/MQ9WM9zKz/sKKBo83wSv7r1Welwp92H
         gmX3h5R1iecNIEw3P9ZhRytDG0qS+yyOwgStI3OwlqZ60B6muLjhKcNhzCHEuyQSIBO9
         EArQ==
X-Gm-Message-State: AOAM533uTXKYr+5K7ZiIAxPZxfPjIgy65GlTmXPHCJABve6lZhJQvsCC
	LoZjJA7oSOU0iYHEPDmUXLATe033QK8aUD5d
X-Google-Smtp-Source: 
 ABdhPJwWyLzzQaVlnBuRSLKk9px5Tj2GpvY+WWMqWDSsV5eSD2YIlHOAChe3NquNprKYjwxZBlwpdg==
X-Received: by 2002:a17:90b:4c4d:b0:1df:a164:7055 with SMTP id
 np13-20020a17090b4c4d00b001dfa1647055mr10735578pjb.180.1653489395129;
        Wed, 25 May 2022 07:36:35 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h6-20020a170902f70600b0015eb200cc00sm9399287plo.138.2022.05.25.07.36.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 07:36:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/4] oeqa/selftest/cve_check: add tests for recipe
 and image reports
Date: Wed, 25 May 2022 04:36:11 -1000
Message-Id: 
 <add860e1a69f848097bbc511137a62d5746e5019.1653489126.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1653489126.git.steve@sakoman.com>
References: <cover.1653489126.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 14:36:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166149

From: Ross Burton <ross.burton@arm.com>

Add a test to verify that the JSON reports are generated correctly for
both single recipe builds and image builds.

More tests are needed, but this is better than nothing.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit df0f35555b09c4bc75470eb45ec9c74e6587d460)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/cve_check.py | 77 ++++++++++++++++++++++-
 1 file changed, 76 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/cve_check.py b/meta/lib/oeqa/selftest/cases/cve_check.py
index d1947baffc..2f26f606d7 100644
--- a/meta/lib/oeqa/selftest/cases/cve_check.py
+++ b/meta/lib/oeqa/selftest/cases/cve_check.py
@@ -1,9 +1,13 @@
-from oe.cve_check import Version
+import json
+import os
 from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, get_bb_vars
 
 class CVECheck(OESelftestTestCase):
 
     def test_version_compare(self):
+        from oe.cve_check import Version
+
         result = Version("100") > Version("99")
         self.assertTrue( result, msg="Failed to compare version '100' > '99'")
         result = Version("2.3.1") > Version("2.2.3")
@@ -42,3 +46,74 @@ class CVECheck(OESelftestTestCase):
         self.assertTrue( result ,msg="Failed to compare version with suffix '1.0p2' > '1.0p1'")
         result = Version("1.0_patch2","patch") < Version("1.0_patch3","patch")
         self.assertTrue( result ,msg="Failed to compare version with suffix '1.0_patch2' < '1.0_patch3'")
+
+
+    def test_recipe_report_json(self):
+        config = """
+INHERIT += "cve-check"
+CVE_CHECK_FORMAT_JSON = "1"
+"""
+        self.write_config(config)
+
+        vars = get_bb_vars(["CVE_CHECK_SUMMARY_DIR", "CVE_CHECK_SUMMARY_FILE_NAME_JSON"])
+        summary_json = os.path.join(vars["CVE_CHECK_SUMMARY_DIR"], vars["CVE_CHECK_SUMMARY_FILE_NAME_JSON"])
+        recipe_json = os.path.join(vars["CVE_CHECK_SUMMARY_DIR"], "m4-native_cve.json")
+
+        try:
+            os.remove(summary_json)
+            os.remove(recipe_json)
+        except FileNotFoundError:
+            pass
+
+        bitbake("m4-native -c cve_check")
+
+        def check_m4_json(filename):
+            with open(filename) as f:
+                report = json.load(f)
+            self.assertEqual(report["version"], "1")
+            self.assertEqual(len(report["package"]), 1)
+            package = report["package"][0]
+            self.assertEqual(package["name"], "m4-native")
+            found_cves = { issue["id"]: issue["status"] for issue in package["issue"]}
+            self.assertIn("CVE-2008-1687", found_cves)
+            self.assertEqual(found_cves["CVE-2008-1687"], "Patched")
+
+        self.assertExists(summary_json)
+        check_m4_json(summary_json)
+        self.assertExists(recipe_json)
+        check_m4_json(recipe_json)
+
+
+    def test_image_json(self):
+        config = """
+INHERIT += "cve-check"
+CVE_CHECK_FORMAT_JSON = "1"
+"""
+        self.write_config(config)
+
+        vars = get_bb_vars(["CVE_CHECK_DIR", "CVE_CHECK_SUMMARY_DIR", "CVE_CHECK_SUMMARY_FILE_NAME_JSON"])
+        report_json = os.path.join(vars["CVE_CHECK_SUMMARY_DIR"], vars["CVE_CHECK_SUMMARY_FILE_NAME_JSON"])
+        print(report_json)
+        try:
+            os.remove(report_json)
+        except FileNotFoundError:
+            pass
+
+        bitbake("core-image-minimal-initramfs")
+        self.assertExists(report_json)
+
+        # Check that the summary report lists at least one package
+        with open(report_json) as f:
+            report = json.load(f)
+        self.assertEqual(report["version"], "1")
+        self.assertGreater(len(report["package"]), 1)
+
+        # Check that a random recipe wrote a recipe report to deploy/cve/
+        recipename = report["package"][0]["name"]
+        recipe_report = os.path.join(vars["CVE_CHECK_DIR"], recipename + "_cve.json")
+        self.assertExists(recipe_report)
+        with open(recipe_report) as f:
+            report = json.load(f)
+        self.assertEqual(report["version"], "1")
+        self.assertEqual(len(report["package"]), 1)
+        self.assertEqual(report["package"][0]["name"], recipename)
-- 
2.25.1



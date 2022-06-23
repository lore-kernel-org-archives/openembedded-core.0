Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3692C433EF
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 17:43:05 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.8.1656006179398797660
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jun 2022 10:42:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F+Mzd2e3;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id i10so25206856wrc.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jun 2022 10:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Wr8v7hKORbYlbN//klj368A3ZSZVRM7qJ66rrpGhvOI=;
        b=F+Mzd2e3uCxPQC8JiTFzuXU2nrA3+rp3vM2pUyC0CWV8ZuIoOZhJm3mLCfNs4FdSBn
         KVnZbz17Um0E2VAqu+ZAEt+WzQQPFvg8KIETPuxDTCYGC3ms5YzqCeEfto09ScDDSY45
         tNv2ANBxZk1P2Rm0sT+gqNMbqKVJ3Zx42fgf6tpp4Op/kEshM7VnI6jA1N0LZ8+LeQmQ
         GXqzgFPqFgLVDasmNnxS1nu7u4TLc66ppLq3rGz9NzCCAuWdO5p3w6aoZTlr7E32jyeW
         7zBCCV83X/dP1PoXYGx2rjL94qUh/R9SL7Crh3DHVLMKL0PHoVH7sedJ17VMcF/4WXeU
         2Z5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wr8v7hKORbYlbN//klj368A3ZSZVRM7qJ66rrpGhvOI=;
        b=GXoISYRzlgoBo3I+8INwrl8+BUG1rSduDBkeGUPXEn9RUwtRIinsVDJtT1tVGjAJrx
         WhUIreBGSd7jV40cQEbhaGI3EhykDG4O9Ds2N4wL8zd66yE7nbNRCVIjVO7NPzu31nC7
         pG6bfhgcPhUkX8Gv2OFmW1KOP/dRR1wp2udY2QUjfr1JU60UnmRcfM4G+3tRY9uw49zN
         k1hPK3Wk+y3NJnB+4SijDWl5Bt5YNnaLH7mxEhJw8IgRfXLFO2dvgB8tMgvxKEUU0IS5
         7sVsLwAX/+Gw6JK5Bnh02VOnEugJgJ1VHA+4JWZIbng1XUDX1JdeEWFExCJzTf2FWVOt
         I+Mw==
X-Gm-Message-State: AJIora/vVxSELvay7Zt+ZQAzdWM1vY532q6EPP5r9QXSBkxVWyHcyCC4
	1XYr/ktjQs82wDTO1cyx/hzpvpAZMIb3pA==
X-Google-Smtp-Source: 
 AGRyM1skdfOEe1JpZsJaHzztH17byXcfAK9QnALv4z8kZc3XDXEe3i/7OtKqWIttVangv+iijP0wAA==
X-Received: by 2002:a05:6000:1f05:b0:21b:a1b6:1829 with SMTP id
 bv5-20020a0560001f0500b0021ba1b61829mr8410488wrb.697.1656006177513;
        Thu, 23 Jun 2022 10:42:57 -0700 (PDT)
Received: from localhost.localdomain ([80.215.178.159])
        by smtp.gmail.com with ESMTPSA id
 p7-20020a05600c418700b003a0279f5935sm28066wmh.9.2022.06.23.10.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 10:42:57 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
To: openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH 2/2] oeqa/selftest/cve_check: add tests for Ignored
 and partial reports
Date: Thu, 23 Jun 2022 19:42:30 +0200
Message-Id: <20220623174230.1495034-2-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220623174230.1495034-1-rybczynska@gmail.com>
References: <20220623174230.1495034-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jun 2022 17:43:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167282

Add testcases for partial reports with CVE_CHECK_REPORT_PATCHED and
Ignored CVEs.

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry-picked from 3f7639b90004973782a2e74925fd2e9a764c1090)
---
 meta/lib/oeqa/selftest/cases/cve_check.py | 82 +++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/cve_check.py b/meta/lib/oeqa/selftest/cases/cve_check.py
index 2f26f606d7..d0b2213703 100644
--- a/meta/lib/oeqa/selftest/cases/cve_check.py
+++ b/meta/lib/oeqa/selftest/cases/cve_check.py
@@ -117,3 +117,85 @@ CVE_CHECK_FORMAT_JSON = "1"
         self.assertEqual(report["version"], "1")
         self.assertEqual(len(report["package"]), 1)
         self.assertEqual(report["package"][0]["name"], recipename)
+
+
+    def test_recipe_report_json_unpatched(self):
+        config = """
+INHERIT += "cve-check"
+CVE_CHECK_FORMAT_JSON = "1"
+CVE_CHECK_REPORT_PATCHED = "0"
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
+            #m4 had only Patched CVEs, so the issues array will be empty
+            self.assertEqual(package["issue"], [])
+
+        self.assertExists(summary_json)
+        check_m4_json(summary_json)
+        self.assertExists(recipe_json)
+        check_m4_json(recipe_json)
+
+
+    def test_recipe_report_json_ignored(self):
+        config = """
+INHERIT += "cve-check"
+CVE_CHECK_FORMAT_JSON = "1"
+CVE_CHECK_REPORT_PATCHED = "1"
+"""
+        self.write_config(config)
+
+        vars = get_bb_vars(["CVE_CHECK_SUMMARY_DIR", "CVE_CHECK_SUMMARY_FILE_NAME_JSON"])
+        summary_json = os.path.join(vars["CVE_CHECK_SUMMARY_DIR"], vars["CVE_CHECK_SUMMARY_FILE_NAME_JSON"])
+        recipe_json = os.path.join(vars["CVE_CHECK_SUMMARY_DIR"], "logrotate_cve.json")
+
+        try:
+            os.remove(summary_json)
+            os.remove(recipe_json)
+        except FileNotFoundError:
+            pass
+
+        bitbake("logrotate -c cve_check")
+
+        def check_m4_json(filename):
+            with open(filename) as f:
+                report = json.load(f)
+            self.assertEqual(report["version"], "1")
+            self.assertEqual(len(report["package"]), 1)
+            package = report["package"][0]
+            self.assertEqual(package["name"], "logrotate")
+            found_cves = { issue["id"]: issue["status"] for issue in package["issue"]}
+            # m4 CVE should not be in logrotate
+            self.assertNotIn("CVE-2008-1687", found_cves)
+            # logrotate has both Patched and Ignored CVEs
+            self.assertIn("CVE-2011-1098", found_cves)
+            self.assertEqual(found_cves["CVE-2011-1098"], "Patched")
+            self.assertIn("CVE-2011-1548", found_cves)
+            self.assertEqual(found_cves["CVE-2011-1548"], "Ignored")
+            self.assertIn("CVE-2011-1549", found_cves)
+            self.assertEqual(found_cves["CVE-2011-1549"], "Ignored")
+            self.assertIn("CVE-2011-1550", found_cves)
+            self.assertEqual(found_cves["CVE-2011-1550"], "Ignored")
+
+        self.assertExists(summary_json)
+        check_m4_json(summary_json)
+        self.assertExists(recipe_json)
+        check_m4_json(recipe_json)
-- 
2.33.0



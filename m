Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 748BDCCA481
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 23:28:28 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web12.1267.1655854101064638960
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 16:28:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=p3VODvYf;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id d14so10918778pjs.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 16:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wYWfLwibhHJafoHxjI+zr8gb50lowFkjwWfm93UeMRU=;
        b=p3VODvYf5xU9rmMTPNIv2CnGqx/BoN9cvjt4SlBX7+GU/QT4qTwHqTK/XcgRItM2lK
         w4qYmS1/K/Zl2oaaga+YGIRgt7gTjlNRo78kuwgDbGW6YZ3hexiv31cfT7pWCdieK0M4
         VxnVTTeX2ZkcW2/rwKX1Ry1okuZF7e44WTTtmuHKOBVNcKPhJ0AWNk2M/FOeTKXhZyzJ
         K81IZdloWGBl2eePBtUKr433UoE08fJaIBcTNNDomFXU49k2OZN0e/526VGtDKnwylAu
         KCX9OEkSKZ4FAdcUpjeCcsyaveG3xg+zZaeYw6yUe8U8qC8VfVgWUEt26CxubngLZNvi
         EI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wYWfLwibhHJafoHxjI+zr8gb50lowFkjwWfm93UeMRU=;
        b=CbmyBFm8H1/NdhM0KLI0VSlv5eXPDlgzvWdPJScf1LKnYZTGEu3eOaZipzwO/ju76P
         hlX27qEoSNgmppdExFYEOfFJs91HD2IOtl0Y9K5g8pd+q+9xNqy2xC8caW4ttzvOJbLk
         +qW5hso/vIgecSxJiipJZn+1iZMEjczr5pRjYn5QGlgUGF7xiVjimTs0NF9DiNgNK5TB
         hladz/2dSfrTI4tNc5Xviw3EF1th/PGvoqOJcg7i5gYgqkPOJpAtp+2sis9lEajosuUV
         Y6gSZr8VtTGxGjphbQ3FaPIEtFCk4L+9w6LoB4+BDseUBQZNfjk9tgh66ddGwFiwpEzK
         C/Zg==
X-Gm-Message-State: AJIora+9HEJ8JQ3UIHiK3lpzIXYEqAEoFGAAfAC8Yzf3xVImf3y0D/l7
	N5tW9FXZPZjQQ6UsO/7oNqEMPcSdeLlO4nT6
X-Google-Smtp-Source: 
 AGRyM1vLsHK28WmDxiwBjmWN5unKvKNnN8VnwHyNBAA1cLtv6Ke/Z4JCh/kWMAHToHHkcEZpjlsLeg==
X-Received: by 2002:a17:902:a60a:b0:168:b5f7:4148 with SMTP id
 u10-20020a170902a60a00b00168b5f74148mr31683718plq.47.1655854100010;
        Tue, 21 Jun 2022 16:28:20 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 z9-20020a1709027e8900b0015e8d4eb209sm11323565pla.83.2022.06.21.16.28.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 16:28:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/13] oeqa/selftest/cve_check: add tests for
 Ignored and partial reports
Date: Tue, 21 Jun 2022 13:27:48 -1000
Message-Id: 
 <feabc35372e78575ff04ea207b34f2d278a75d00.1655848177.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655848177.git.steve@sakoman.com>
References: <cover.1655848177.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 23:28:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167192

From: Marta Rybczynska <rybczynska@gmail.com>

Add testcases for partial reports with CVE_CHECK_REPORT_PATCHED and
Ignored CVEs.

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3f7639b90004973782a2e74925fd2e9a764c1090)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1



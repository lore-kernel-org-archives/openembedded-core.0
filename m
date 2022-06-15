Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0515C43334
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 13:22:06 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web08.4753.1655299322347011724
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 06:22:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bwiiPk4R;
 spf=pass (domain: gmail.com, ip: 209.85.128.46,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id
 m32-20020a05600c3b2000b0039756bb41f2so1112578wms.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 06:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dm7dJd21Xo3YcwLXQPgbV0CNmWVSTD7B5+7rI6GRij0=;
        b=bwiiPk4RKgZKU5xBbW7k1tca++TK1vRaDmBo3xLsi7cyVwXO9T2o8zjzEyTOTPa/SK
         b/63mvWZDbyHLPKcE1gRORa/HseQyR8HryzYKfLmSZNAn3e5bcTN3Bz+Oujr6TeJvAXU
         phytgFUMuVeIJ1Mp6OnD2vlDcYjxMjwcGCdbxQd54X/bqZ2XD1YrmDarTuWGCj98p6uY
         HQkrUGDp21jXaMAmcEHPjQRVLDYL+8fw0sU0sVwnFCJGmREEoQPoEva0ljYjJE4fBwvG
         isB8osFWuM+Df0ReZtUUl6B3A/ZHoOPMEzRzqxovbcXZmzErhwSPf2agS760duYTwHg4
         WarA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dm7dJd21Xo3YcwLXQPgbV0CNmWVSTD7B5+7rI6GRij0=;
        b=kUDZ/VGaILCz5G3z13ZSJhoK3lbfWsNagRH2ldOnNmJ0umoa/+CJ+KVd1WLZM8gK9Z
         q0KUFZVZ0sCe+s3AQboyv/YJFOJ4sxJmd9atN7pM8Elxv30RGiGwCxEvojqfVnzpwDsD
         V1g2mEnQzd+wsuAgGI3hnmyaPaWkeJlvh/jDLlOvcEK4kq/WvE+QY0PcoiI5pUHGOCVc
         zCFPLfwf60/RL1Bey2HxtMwS7nuhelv8fSemv1wu7wwZShSFLoE9KlG1PIGrwM21832W
         tP2DsoibpX8UuH6h3op0Iz6/Ke8lNbsoBzZnnQj79WN8C78nfSMZdRxjPmStw3Nnx5iE
         IC6w==
X-Gm-Message-State: AOAM532vwkUkc4y/on6v4xJa/NWqE50+MNKFPA5lvk9lhrwDGzeIYbns
	w/4rK70K+HApnwcRcLo4AP4vzHT/l1YAFg==
X-Google-Smtp-Source: 
 ABdhPJx5wPR7yUPRasbUn+U1nE8ZoicHGQWgSvuKSkMqzZsuwGu8G4H6L5Bz55yC3wZFwA3+ZPMiaw==
X-Received: by 2002:a05:600c:3acd:b0:39c:7930:7b57 with SMTP id
 d13-20020a05600c3acd00b0039c79307b57mr9834538wms.73.1655299320301;
        Wed, 15 Jun 2022 06:22:00 -0700 (PDT)
Received: from localhost.localdomain ([80.215.138.27])
        by smtp.gmail.com with ESMTPSA id
 g16-20020a05600c4ed000b003974860e15esm2973088wmq.40.2022.06.15.06.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 06:21:59 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
To: openembedded-core@lists.openembedded.org,
	ross.burton@arm.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH v2 2/2] oeqa/selftest/cve_check: add tests for Ignored and
 partial reports
Date: Wed, 15 Jun 2022 15:21:48 +0200
Message-Id: <20220615132148.2432070-1-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 13:22:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166987

Add testcases for partial reports with CVE_CHECK_REPORT_PATCHED and
Ignored CVEs.

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
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



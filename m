Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28259CCA47B
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 16:23:42 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.27161.1656606204037309604
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 09:23:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=4uil7Fhg;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id q18so17422962pld.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 09:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MAPUQBUNKdmxwkAoHHdKIerCaZp9I/EOCcno12iEL28=;
        b=4uil7FhgMX0dOBsbhdDe1+aT/bGcaouyjNcmuKC5vyhjx4LGdPWTI9d9L1uGoza5U6
         a9689XX0I4Byb8WMSckOKbfo8Ywb5W8RD7PWy9U4KOfI/74V1DM5Vc9QHUgYGODMr2k5
         AlyvpFG4kRd6D9S8n9yeMCcZBYZZZ5vNdPkRxoT88hwilhRVJblev8wCSG51d8OMQai+
         ONMCX/4esABI0oCPJstmQOtv03jks7EpYIEb1qekyEyCM8nktdUAiXRzINIe4fiOYuol
         f9APj5jXjDmhEY8wI5pG5zH+syOHXRFJe9/fJgZ7/ec+u3hjZbmX3W7vfS2Z227PYxoI
         Cb/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MAPUQBUNKdmxwkAoHHdKIerCaZp9I/EOCcno12iEL28=;
        b=1D7WK7F3zCmCRda0zaF5/u7Iyjocb5wep0q+qYiJO/c9q3DuhlIp7ph/fVxyBcqk6n
         R+y9Mr9eZeK1NjqgAD1jJ8BSPflWeuKD4hfoFdVFxaaK0BlvDIcAUUtzMx7X1Iy4EoZG
         E796gVSLuZO4zo9NasYTDfXM1gTYGshm4uKoY00ChthUDy+j++A0D+96bjxnQzqcFYfB
         v7VzKNnBeewgUVK6kf4PXgaBEt/XuRd/9bbdYmGP2QOa0O5EGae+wRpykJTvd1RUTxYi
         t6oYuFOmGEP+kTy5KodGzKJ4freK0lYMl8XDnToWwNRFQOdJWmsLohstR/cG7liUeHAo
         p9dQ==
X-Gm-Message-State: AJIora9vB7behztBQzdlfxwctqL44jrM78IceYjorlSionA/udyM/cvx
	dGJWdMnXNUPb7bvKtKHyFTsKpqCFGRtC69jv
X-Google-Smtp-Source: 
 AGRyM1vgevxPKDwlsWcY3jx6HnTnTrRFd0f1sQiAUVzMsTM6BV+TZsU252y+3wEBIjHuOrW4wOSkMQ==
X-Received: by 2002:a17:90b:3b84:b0:1ec:e86c:3c34 with SMTP id
 pc4-20020a17090b3b8400b001ece86c3c34mr10958140pjb.174.1656606219762;
        Thu, 30 Jun 2022 09:23:39 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 t129-20020a625f87000000b005259578e8fcsm10517611pfb.181.2022.06.30.09.23.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 09:23:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/12] oeqa/selftest/cve_check: add tests for
 Ignored and partial reports
Date: Thu, 30 Jun 2022 06:23:07 -1000
Message-Id: 
 <577d297babd7b399f631c8a95155265f08c5e193.1656605800.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656605800.git.steve@sakoman.com>
References: <cover.1656605800.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 16:23:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167423

From: Marta Rybczynska <rybczynska@gmail.com>

Add testcases for partial reports with CVE_CHECK_REPORT_PATCHED and
Ignored CVEs.

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry-picked from 3f7639b90004973782a2e74925fd2e9a764c1090)
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



Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C15EC433EF
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 14:30:16 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.7517.1653489008642391742
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:30:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=KU8TiEuq;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id n10so19856130pjh.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=aIWsstHF5eZ1aNCdO0AYOi0TXnrOlpkNMyKZTl8lp2M=;
        b=KU8TiEuqHg8FPqXEdY8S6qsKvLRFyUATfflFr+PiFTs3xbuUjuZNwQkzjvDfqavHfX
         EtAxdXVX5xEXaeXyE46acxk8Ysy4l44CK+MllIKQNP9T7XQIUqe9uEVpgCmHrXJxWybp
         4qJIdF4EU6RwGLVBxUIuzVuQjUdebJor3BhBjnrODwAxO4PcKnvcEriYdSqUnvKJlXsX
         rdcy8lrUDFYUoHctk62ISUO28iSzYLlePkzR12o1ixKKLj6OjS8jGHv983vLBH3yDfOY
         GyQeAIPf5mYYJziQBLYIAzOpEgDeN5AzmsXxUJzOxKQsdxhc9gWAr0Y+ol58f3taNM79
         6TdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aIWsstHF5eZ1aNCdO0AYOi0TXnrOlpkNMyKZTl8lp2M=;
        b=k7uLn5ukAS6gTtcYJWBwmCIH+fRndhVnsnO17KaC3+wUdJ4p+xglQ0VnW3RdzViPOr
         s9sdDpbW6UeXRoaUqMYIfr1p1XJmPlA+kZjlcMW5Xq621HEjavq3tC+gyEFoR8pJ9hjJ
         BWIWIKs+FJ51oB1uSjcSs4X/u6Z4/3MneIaTIadVa4UiPq9ZR9lZ7Z31x33LxtLTQM6H
         wn8sED8gHIscoc+jXBwDNxMmnqhnS5QwkF+QNSDd7XdEIfV0TtoZItbPRZ8d1VLvFWvc
         AoDWVsDzxuw+DBV5nI6yDfREZi6VVfmDum6wggcpdroSX78TWHzGJqgBcksF3bDNlfod
         GC/A==
X-Gm-Message-State: AOAM532Hk7t2QgUgqP0e3in0tWAFsv3LXrC/VXC6kvx0IdpLAv+j3PaI
	zXSrA1ULJAXUup8lifQCAlwajcHXThwhvU2g
X-Google-Smtp-Source: 
 ABdhPJwKylJHrzMqY8clHqNvK2lpu0UBdH0FEVH4BlXy9MC5DB9Uac1h+xKVCq4TCY0s/qZJAATGuA==
X-Received: by 2002:a17:903:1108:b0:156:73a7:7c1 with SMTP id
 n8-20020a170903110800b0015673a707c1mr32395083plh.101.1653489007266;
        Wed, 25 May 2022 07:30:07 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a8-20020a656408000000b003db141a5f26sm8553837pgv.1.2022.05.25.07.30.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 07:30:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/19] oeqa/selftest/cve_check: add tests for
 recipe and image reports
Date: Wed, 25 May 2022 04:29:30 -1000
Message-Id: 
 <61e8e3c7f0b7161ff678a0ef4992261c7a1b96b0.1653488418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1653488418.git.steve@sakoman.com>
References: <cover.1653488418.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 14:30:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166128

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



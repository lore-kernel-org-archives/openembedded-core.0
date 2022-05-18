Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8C0FC433F5
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 15:40:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.6523.1652888416969883810
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 08:40:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF92C23A;
	Wed, 18 May 2022 08:40:15 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E3463F718;
	Wed, 18 May 2022 08:40:15 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] oeqa/selftest/cve_check: add tests for recipe and image
 reports
Date: Wed, 18 May 2022 16:40:13 +0100
Message-Id: <20220518154013.2372773-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 15:40:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165857

Add a test to verify that the JSON reports are generated correctly for
both single recipe builds and image builds.

More tests are needed, but this is better than nothing.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/cve_check.py | 77 ++++++++++++++++++++++-
 1 file changed, 76 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/cve_check.py b/meta/lib/oeqa/se=
lftest/cases/cve_check.py
index d1947baffc4..2f26f606d79 100644
--- a/meta/lib/oeqa/selftest/cases/cve_check.py
+++ b/meta/lib/oeqa/selftest/cases/cve_check.py
@@ -1,9 +1,13 @@
-from oe.cve_check import Version
+import json
+import os
 from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, get_bb_vars
=20
 class CVECheck(OESelftestTestCase):
=20
     def test_version_compare(self):
+        from oe.cve_check import Version
+
         result =3D Version("100") > Version("99")
         self.assertTrue( result, msg=3D"Failed to compare version '100' =
> '99'")
         result =3D Version("2.3.1") > Version("2.2.3")
@@ -42,3 +46,74 @@ class CVECheck(OESelftestTestCase):
         self.assertTrue( result ,msg=3D"Failed to compare version with s=
uffix '1.0p2' > '1.0p1'")
         result =3D Version("1.0_patch2","patch") < Version("1.0_patch3",=
"patch")
         self.assertTrue( result ,msg=3D"Failed to compare version with s=
uffix '1.0_patch2' < '1.0_patch3'")
+
+
+    def test_recipe_report_json(self):
+        config =3D """
+INHERIT +=3D "cve-check"
+CVE_CHECK_FORMAT_JSON =3D "1"
+"""
+        self.write_config(config)
+
+        vars =3D get_bb_vars(["CVE_CHECK_SUMMARY_DIR", "CVE_CHECK_SUMMAR=
Y_FILE_NAME_JSON"])
+        summary_json =3D os.path.join(vars["CVE_CHECK_SUMMARY_DIR"], var=
s["CVE_CHECK_SUMMARY_FILE_NAME_JSON"])
+        recipe_json =3D os.path.join(vars["CVE_CHECK_SUMMARY_DIR"], "m4-=
native_cve.json")
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
+                report =3D json.load(f)
+            self.assertEqual(report["version"], "1")
+            self.assertEqual(len(report["package"]), 1)
+            package =3D report["package"][0]
+            self.assertEqual(package["name"], "m4-native")
+            found_cves =3D { issue["id"]: issue["status"] for issue in p=
ackage["issue"]}
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
+        config =3D """
+INHERIT +=3D "cve-check"
+CVE_CHECK_FORMAT_JSON =3D "1"
+"""
+        self.write_config(config)
+
+        vars =3D get_bb_vars(["CVE_CHECK_DIR", "CVE_CHECK_SUMMARY_DIR", =
"CVE_CHECK_SUMMARY_FILE_NAME_JSON"])
+        report_json =3D os.path.join(vars["CVE_CHECK_SUMMARY_DIR"], vars=
["CVE_CHECK_SUMMARY_FILE_NAME_JSON"])
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
+            report =3D json.load(f)
+        self.assertEqual(report["version"], "1")
+        self.assertGreater(len(report["package"]), 1)
+
+        # Check that a random recipe wrote a recipe report to deploy/cve=
/
+        recipename =3D report["package"][0]["name"]
+        recipe_report =3D os.path.join(vars["CVE_CHECK_DIR"], recipename=
 + "_cve.json")
+        self.assertExists(recipe_report)
+        with open(recipe_report) as f:
+            report =3D json.load(f)
+        self.assertEqual(report["version"], "1")
+        self.assertEqual(len(report["package"]), 1)
+        self.assertEqual(report["package"][0]["name"], recipename)
--=20
2.25.1



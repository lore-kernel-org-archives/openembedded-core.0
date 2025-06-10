Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F912C5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 10:41:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.83982.1749552077924530697
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 03:41:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62741169C
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 03:40:58 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 42C223F673
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 03:41:17 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest/sanity: add test case for the recipe-naming sanity check
Date: Tue, 10 Jun 2025 11:41:15 +0100
Message-ID: <20250610104115.2291973-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 10:41:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218340

Add a pair of test recipes to meta-selftest, and a new test module to
collect test cases for the recipe_qa/package_qa checks.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipename/nativesdk-recipename-test.bb   |  6 +++++
 .../recipename/recipename-test-native.bb      |  6 +++++
 meta/lib/oeqa/selftest/cases/sanity.py        | 27 +++++++++++++++++++
 3 files changed, 39 insertions(+)
 create mode 100644 meta-selftest/recipes-test/recipename/nativesdk-recip=
ename-test.bb
 create mode 100644 meta-selftest/recipes-test/recipename/recipename-test=
-native.bb
 create mode 100644 meta/lib/oeqa/selftest/cases/sanity.py

diff --git a/meta-selftest/recipes-test/recipename/nativesdk-recipename-t=
est.bb b/meta-selftest/recipes-test/recipename/nativesdk-recipename-test.=
bb
new file mode 100644
index 00000000000..c5342150b23
--- /dev/null
+++ b/meta-selftest/recipes-test/recipename/nativesdk-recipename-test.bb
@@ -0,0 +1,6 @@
+SUMMARY =3D "Recipe that is called nativesdk- but does not inherit nativ=
esdk"
+LICENSE =3D "CLOSED"
+
+INHIBIT_DEFAULT_DEPS =3D "1"
+
+EXCLUDE_FROM_WORLD =3D "1"
diff --git a/meta-selftest/recipes-test/recipename/recipename-test-native=
.bb b/meta-selftest/recipes-test/recipename/recipename-test-native.bb
new file mode 100644
index 00000000000..2a05f6c617b
--- /dev/null
+++ b/meta-selftest/recipes-test/recipename/recipename-test-native.bb
@@ -0,0 +1,6 @@
+SUMMARY =3D "Recipe that is called -native but does not inherit native"
+LICENSE =3D "CLOSED"
+
+INHIBIT_DEFAULT_DEPS =3D "1"
+
+EXCLUDE_FROM_WORLD =3D "1"
diff --git a/meta/lib/oeqa/selftest/cases/sanity.py b/meta/lib/oeqa/selft=
est/cases/sanity.py
new file mode 100644
index 00000000000..50ad0a141da
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/sanity.py
@@ -0,0 +1,27 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake
+
+class RecipeQaTests(OESelftestTestCase):
+    """
+    Tests to exercise the recipe_qa checks.
+    """
+
+    def test_recipe_naming(self):
+        """
+        Exercise the recipe-naming check.
+        """
+        self.write_config('ERROR_QA =3D "recipe-naming"')
+
+        for recipe in ("recipename-test-native", "nativesdk-recipename-t=
est"):
+            with self.subTest(recipe=3Drecipe):
+                res =3D bitbake(f"{recipe} -c recipe_qa -f", ignore_stat=
us=3DTrue)
+                # bitbake should have failed
+                self.assertNotEqual(res.status, 0)
+                # The recipe-naming test should be in the output
+                self.assertRegex(res.output, fr"do_recipe_qa.*{recipe}.*=
\[recipe-naming\]")
--=20
2.43.0



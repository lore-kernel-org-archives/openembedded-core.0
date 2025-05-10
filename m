Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 974C2C3ABD9
	for <webhook@archiver.kernel.org>; Sat, 10 May 2025 08:44:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6809.1746866648885446440
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 May 2025 01:44:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9906C1595
	for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 01:43:57 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3C7F73F5A1
	for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 01:44:08 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/23] oeqa/sdk: add simple test that the manifests are not empty
Date: Sat, 10 May 2025 09:43:39 +0100
Message-ID: <20250510084400.269726-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250510084400.269726-1-ross.burton@arm.com>
References: <20250510084400.269726-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 08:44:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216254

Simple test to sanity check that the generated SDK manifest was parsed
correctly and isn't empty.

This test is complicated by the fact that minimal eSDKs without a
toolchain do in fact have an empty manifest, so also check for that.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/sdk/cases/manifest.py | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta/lib/oeqa/sdk/cases/manifest.py

diff --git a/meta/lib/oeqa/sdk/cases/manifest.py b/meta/lib/oeqa/sdk/case=
s/manifest.py
new file mode 100644
index 00000000000..ee59a5f3386
--- /dev/null
+++ b/meta/lib/oeqa/sdk/cases/manifest.py
@@ -0,0 +1,26 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+from oeqa.sdk.case import OESDKTestCase
+from oeqa.sdkext.context import OESDKExtTestContext
+
+
+class ManifestTest(OESDKTestCase):
+    def test_manifests(self):
+        """
+        Verify that the host and target manifests are not empty, unless =
this is
+        a minimal eSDK without toolchain in which case they should be em=
pty.
+        """
+        if (
+            isinstance(self.tc, OESDKExtTestContext)
+            and self.td.get("SDK_EXT_TYPE") =3D=3D "minimal"
+            and self.td.get("SDK_INCLUDE_TOOLCHAIN") =3D=3D "0"
+        ):
+            self.assertEqual(self.tc.target_pkg_manifest, {})
+            self.assertEqual(self.tc.host_pkg_manifest, {})
+        else:
+            self.assertNotEqual(self.tc.target_pkg_manifest, {})
+            self.assertNotEqual(self.tc.host_pkg_manifest, {})
--=20
2.43.0



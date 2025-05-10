Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 971E1C3ABD5
	for <webhook@archiver.kernel.org>; Sat, 10 May 2025 08:44:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6620.1746866649536105295
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 May 2025 01:44:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40A7F153B
	for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 01:43:58 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D93503F5A1
	for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 01:44:08 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/23] oeqa/selftest/sdk: add test to verify the manifests are generated correctly
Date: Sat, 10 May 2025 09:43:40 +0100
Message-ID: <20250510084400.269726-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250510084400.269726-1-ross.burton@arm.com>
References: <20250510084400.269726-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 08:44:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216255

Add a test that builds a SDK with specific packages in the host and
target sections, and verifies that they're listed in the manifest.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/sdk.py | 39 +++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/sdk.py

diff --git a/meta/lib/oeqa/selftest/cases/sdk.py b/meta/lib/oeqa/selftest=
/cases/sdk.py
new file mode 100644
index 00000000000..39713650295
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/sdk.py
@@ -0,0 +1,39 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+import os.path
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, get_bb_vars
+
+class SDKTests(OESelftestTestCase):
+
+    def load_manifest(self, filename):
+        manifest =3D {}
+        with open(filename) as f:
+            for line in f:
+                name, arch, version =3D line.split(maxsplit=3D3)
+                manifest[name] =3D (version, arch)
+        return manifest
+
+    def test_sdk_manifests(self):
+        image =3D "core-image-minimal"
+
+        self.write_config("""
+TOOLCHAIN_HOST_TASK:append =3D " nativesdk-selftest-hello"
+IMAGE_INSTALL:append =3D " selftest-hello"
+""")
+
+        bitbake(f"{image} -c populate_sdk")
+        vars =3D get_bb_vars(['SDK_DEPLOY', 'TOOLCHAIN_OUTPUTNAME'], ima=
ge)
+
+        path =3D os.path.join(vars["SDK_DEPLOY"], vars["TOOLCHAIN_OUTPUT=
NAME"] + ".host.manifest")
+        self.assertNotEqual(os.path.getsize(path), 0, msg=3D"Host manife=
st is empty")
+        self.assertIn("nativesdk-selftest-hello", self.load_manifest(pat=
h))
+
+        path =3D os.path.join(vars["SDK_DEPLOY"], vars["TOOLCHAIN_OUTPUT=
NAME"] + ".target.manifest")
+        self.assertNotEqual(os.path.getsize(path), 0, msg=3D"Target mani=
fest is empty")
+        self.assertIn("selftest-hello", self.load_manifest(path))
--=20
2.43.0



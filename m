Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 215CED3B7ED
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 09:49:41 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4845.1765187379849501527
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Dec 2025 01:49:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=XvFlqida;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 377404E41AE9;
	Mon,  8 Dec 2025 09:49:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 07FBA60707;
	Mon,  8 Dec 2025 09:49:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A3286102F2443;
	Mon,  8 Dec 2025 10:49:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765187377; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=8PQ7e3Fmf+NiNTPcDb83f5cYxLBeRhmiPCnq03OfUAk=;
	b=XvFlqida2JE7CgFopRI1jMINFFFBqQPwI0R8DWOM14uSp55RgIkCt41qiGCJGNQ0WN0ffo
	vsG7s6e0mi9OFgL7Mc+BnhW80k1yg9FvdJD7QhKjOwKczU8MWJDvyQ3oI+eAMj60NKnjld
	EjCbVFWVup0mkIDcoKtsbH3tq0N87jx6TkEyF9Tug/MtijV7zVtQjtSLYGu9tShf2hsz8p
	D7NeCB0+xFbeB129FTWSfrZgls1JEi6BaRBQPn1d15TfjKwLUxrX0aLYeZQ7crNoTJ4IP3
	esHaKIlhblE2ZFdnlW3S7GIA60Bryz3qDYk+xLgnNWQZi0XTAg2rpjWAzsyPvg==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Pascal Eberhard <pascal.eberhard@se.com>,
	"Kamel Bouhara (Schneider Electric)" <kamel.bouhara@bootlin.com>
Subject: [PATCH v5 3/3] oeqa/selftest: oe-selftest: Add SPDX tests for kernel config and PACKAGECONFIG
Date: Mon,  8 Dec 2025 10:49:29 +0100
Message-ID: <20251208094929.46495-4-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251208094929.46495-1-kamel.bouhara@bootlin.com>
References: <20251208094929.46495-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Dec 2025 09:49:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227386

From: "Kamel Bouhara (Schneider Electric)" <kamel.bouhara@bootlin.com>

Add test_kernel_config_spdx and test_packageconfig_spdx to verify
SPDX document generation includes kernel configuration and package
feature metadata when enabled.

Signed-off-by: Kamel Bouhara (Schneider Electric) <kamel.bouhara@bootlin.=
com>
---
 meta/lib/oeqa/selftest/cases/spdx.py | 58 ++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftes=
t/cases/spdx.py
index f548dd4be7..367f1a760a 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -357,3 +357,61 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase=
):
             1,
             f"Expected exactly 1 occurrence of ANNOTATION2, found {annot=
ation2_count}",
         )
+
+    def test_kernel_config_spdx(self):
+        kernel_recipe =3D get_bb_var("PREFERRED_PROVIDER_virtual/kernel"=
)
+        spdx_file =3D f"recipe-{kernel_recipe}.spdx.json"
+        spdx_path =3D f"{{DEPLOY_DIR_SPDX}}/{{SSTATE_PKGARCH}}/recipes/{=
spdx_file}"
+
+        # Make sure kernel is configured first
+        bitbake(f"-c configure {kernel_recipe}")
+
+        objset =3D self.check_recipe_spdx(
+            kernel_recipe,
+            spdx_path,
+            task=3D"do_create_kernel_config_spdx",
+            extraconf=3D"""\
+                INHERIT +=3D "create-spdx"
+                SPDX_INCLUDE_KERNEL_CONFIG =3D "1"
+                """,
+        )
+
+        # Check that at least one CONFIG_* entry exists
+        found_kernel_config =3D False
+        for build_obj in objset.foreach_type(oe.spdx30.build_Build):
+            if getattr(build_obj, "build_buildType", "") =3D=3D "https:/=
/openembedded.org/kernel-configuration":
+                found_kernel_config =3D True
+                self.assertTrue(
+                    len(getattr(build_obj, "build_parameter", [])) > 0,
+                    "Kernel configuration build_Build has no CONFIG_* en=
tries"
+                )
+                break
+
+        self.assertTrue(found_kernel_config, "Kernel configuration build=
_Build not found in SPDX output")
+
+    def test_packageconfig_spdx(self):
+        objset =3D self.check_recipe_spdx(
+            "tar",
+            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/recipes/recipe-tar.spdx.=
json",
+            extraconf=3D"""\
+                INHERIT +=3D "create-spdx"
+                SPDX_INCLUDE_PACKAGECONFIG =3D "1"
+                """,
+        )
+
+        found_entries =3D []
+        for build_obj in objset.foreach_type(oe.spdx30.build_Build):
+            for param in getattr(build_obj, "build_parameter", []):
+                if param.key.startswith("PACKAGECONFIG:"):
+                    found_entries.append((param.key, param.value))
+
+        self.assertTrue(
+            found_entries,
+            "No PACKAGECONFIG entries found in SPDX output for 'tar'"
+        )
+
+        for key, value in found_entries:
+            self.assertIn(
+                value, ["enabled", "disabled"],
+                f"Unexpected PACKAGECONFIG value '{value}' for {key}"
+            )
--=20
2.43.0



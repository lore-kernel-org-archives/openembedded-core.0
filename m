Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 346F2D5B16C
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 15:54:46 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.52234.1765814084230158581
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 07:54:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=zygL6TRv;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 974F8C19D1E;
	Mon, 15 Dec 2025 15:54:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 011FC60664;
	Mon, 15 Dec 2025 15:54:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 806CC119426D3;
	Mon, 15 Dec 2025 16:54:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765814081; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=PeGnVTVPhcrlBTkgBoGMZl76TjRRp33D7zda0HgYH/k=;
	b=zygL6TRvP3pV562FVBE23WPoMbZeVWrzxlmjS2MA3zqW9oLMtuEB1gGuNrY7cnaUZ2IRgU
	gZPS5COm6w5Qv4lgwS8jIotofPLlUFQA4jCcVSwuqFpfEGrFLEGAqQdIEKEHirqXTPGsKQ
	BZKrEyFCyd46KOtXfE1ED/pNdskbxUU3EqfNaoKI1K3WNgegkyktIBeRAeoEkCv4VAyZhd
	tZ9N5AR9jYdmhHilGC+B5T8P2TZdGf96MnYEnT2KLV9ET7Em1pt1sJB2cjFqXwhxWDEvmg
	J2jyGW2i2LVfuT+CtJFQ5QNjUDXTbg8BDk/GH4y1WUdi8sS8BgOgKURHpPVqbA==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Pascal Eberhard <pascal.eberhard@se.com>,
	"Kamel Bouhara (Schneider Electric)" <kamel.bouhara@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap 3/3] oeqa/selftest: oe-selftest: Add SPDX tests for kernel config and PACKAGECONFIG
Date: Mon, 15 Dec 2025 16:54:24 +0100
Message-ID: <20251215155424.237662-4-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251215155424.237662-1-kamel.bouhara@bootlin.com>
References: <20251215155424.237662-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 15:54:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227746

From: "Kamel Bouhara (Schneider Electric)" <kamel.bouhara@bootlin.com>

Add test_kernel_config_spdx and test_packageconfig_spdx to verify
SPDX document generation includes kernel configuration and package
feature metadata when enabled.

Signed-off-by: Kamel Bouhara (Schneider Electric) <kamel.bouhara@bootlin.=
com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2f0ab110d7521510c60e0493ef3cb021130758cd)
Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
---
 meta/lib/oeqa/selftest/cases/spdx.py | 57 ++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftes=
t/cases/spdx.py
index 8cd4e83ca2..035f3fe336 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -286,3 +286,60 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase=
):
                 break
         else:
             self.assertTrue(False, "Unable to find imported Host SpdxID"=
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



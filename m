Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D015D116F5
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 11:00:36 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16161.1764241226556605539
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 03:00:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=GNKF4n1l;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0ED5C1A1DB7;
	Thu, 27 Nov 2025 11:00:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D94C96068C;
	Thu, 27 Nov 2025 11:00:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A8C99102F275A;
	Thu, 27 Nov 2025 12:00:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764241224; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=v3jQfxdOJ6tOxcQiXUmfIB2+hxDREoTnnjB7VOypO2U=;
	b=GNKF4n1lgdQyBWzG7uBwxYsoZyQg9e+/ZgSJ6XvHVlPWX6Xio1xH1/SHD8Cdxo7e44kmDG
	yPcWQRx8ztZiCmDzgsSvNsTIoe5F5fWpEoqxxFuNqAUuG02CU8ZTYaFarcYlvPkyd0Q4jN
	wJHzp9IEFJ5c/3zg0aPnzxl08DFHR9XlpFOlmis7PZOVcLUROQQjz7atigrFec5DSRG3ej
	ojxQ1j9Ri8Xc+3G+MFbbwcfo66T8PYo+i29JOmC81T05rKYnuBOlPtPaG1A1Y80xl19M23
	s1FGrMA0nZHfPhLoRpzryqPEnxW35ptSMWIUQLSZFhMY3kc6VbO2ZJ19ZajxKw==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Pascal Eberhard <pascal.eberhard@se.com>,
	"Kamel Bouhara (Schneider Electric)" <kamel.bouhara@bootlin.com>
Subject: [PATCH v4 1/3] kernel.bbclass: Add task to export kernel configuration to SPDX
Date: Thu, 27 Nov 2025 12:00:16 +0100
Message-ID: <20251127110018.183232-2-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251127110018.183232-1-kamel.bouhara@bootlin.com>
References: <20251127110018.183232-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 11:00:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226834

From: "Kamel Bouhara (Schneider Electric)" <kamel.bouhara@bootlin.com>

Introduce a new bitbake task do_create_kernel_config_spdx that extracts
the kernel configuration from ${B}/.config and exports it into the
recipe's SPDX document as a separate build_Build object.

The kernel config parameters are stored as SPDX DictionaryEntry objects
and linked to the main kernel build using an ancestorOf relationship.

This enables the kernel build's configuration to be explicitly captured
in the SPDX document for compliance, auditing, and reproducibility.

The task is gated by SPDX_INCLUDE_KERNEL_CONFIG (default =3D "0").

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Kamel Bouhara (Schneider Electric) <kamel.bouhara@bootlin.=
com>
---
 meta/classes-recipe/kernel.bbclass   | 64 ++++++++++++++++++++++++++++
 meta/classes/create-spdx-3.0.bbclass |  6 +++
 2 files changed, 70 insertions(+)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/ker=
nel.bbclass
index 003a155e79..f989b31c47 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -864,5 +864,69 @@ addtask deploy after do_populate_sysroot do_packaged=
ata
=20
 EXPORT_FUNCTIONS do_deploy
=20
+python __anonymous() {
+    inherits =3D (d.getVar("INHERIT") or "")
+    if "create-spdx" in inherits:
+        bb.build.addtask('do_create_kernel_config_spdx', 'do_populate_li=
c do_deploy', 'do_create_spdx', d)
+}
+
+python do_create_kernel_config_spdx() {
+    if d.getVar("SPDX_INCLUDE_KERNEL_CONFIG", True) =3D=3D "1":
+        import oe.spdx30
+        import oe.spdx30_tasks
+        from pathlib import Path
+        from datetime import datetime, timezone
+
+        pkg_arch =3D d.getVar("SSTATE_PKGARCH")
+        deploydir =3D Path(d.getVar("SPDXDEPLOY"))
+        pn =3D d.getVar("PN")
+
+        config_path =3D d.expand("${B}/.config")
+        kernel_params =3D []
+        if not os.path.exists(config_path):
+            bb.warn(f"SPDX: Kernel config file not found at: {config_pat=
h}")
+            return
+
+        try:
+            with open(config_path, 'r') as f:
+                for line in f:
+                    line =3D line.strip()
+                    if not line or line.startswith("#"):
+                        continue
+                    if "=3D" in line:
+                        key, value =3D line.split("=3D", 1)
+                        kernel_params.append(oe.spdx30.DictionaryEntry(
+                            key=3Dkey,
+                            value=3Dvalue.strip('"')
+                        ))
+            bb.note(f"Parsed {len(kernel_params)} kernel config entries =
from {config_path}")
+        except Exception as e:
+            bb.error(f"Failed to parse kernel config file: {e}")
+
+        build, build_objset =3D oe.sbom30.find_root_obj_in_jsonld(
+            d, "recipes", f"recipe-{pn}", oe.spdx30.build_Build
+        )
+
+        kernel_build =3D build_objset.add_root(
+            oe.spdx30.build_Build(
+                _id=3Dbuild_objset.new_spdxid("kernel-config"),
+                creationInfo=3Dbuild_objset.doc.creationInfo,
+                build_buildType=3D"https://openembedded.org/kernel-confi=
guration",
+                build_parameter=3Dkernel_params
+            )
+        )
+
+        oe.spdx30_tasks.set_timestamp_now(d, kernel_build, "build_buildS=
tartTime")
+
+        build_objset.new_relationship(
+            [build],
+            oe.spdx30.RelationshipType.ancestorOf,
+            [kernel_build]
+        )
+
+        oe.sbom30.write_jsonld_doc(d, build_objset, deploydir / pkg_arch=
 / "recipes" / f"recipe-{pn}.spdx.json")
+}
+do_create_kernel_config_spdx[depends] =3D "virtual/kernel:do_configure"
+
 # Add using Device Tree support
 inherit kernel-devicetree
diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-s=
pdx-3.0.bbclass
index a6d2d44e34..f4f7a77d86 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -50,6 +50,12 @@ SPDX_INCLUDE_TIMESTAMPS[doc] =3D "Include time stamps =
in SPDX output. This is \
     useful if you want to know when artifacts were produced and when bui=
lds \
     occurred, but will result in non-reproducible SPDX output"
=20
+SPDX_INCLUDE_KERNEL_CONFIG ??=3D "0"
+SPDX_INCLUDE_KERNEL_CONFIG[doc] =3D "If set to '1', the .config file for=
 the kernel will be parsed \
+and each CONFIG_* value will be included in the Build.build_parameter li=
st as DictionaryEntry \
+items. Set to '0' to disable exporting kernel configuration to improve p=
erformance or reduce \
+SPDX document size."
+
 SPDX_IMPORTS ??=3D ""
 SPDX_IMPORTS[doc] =3D "SPDX_IMPORTS is the base variable that describes =
how to \
     reference external SPDX ids. Each import is defined as a key in this=
 \
--=20
2.43.0



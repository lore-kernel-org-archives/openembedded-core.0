Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2156BD3B7E2
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 09:49:41 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4843.1765187377271145947
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Dec 2025 01:49:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=O6SP7kQg;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4769BC180C4;
	Mon,  8 Dec 2025 09:49:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 047E760707;
	Mon,  8 Dec 2025 09:49:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A8DBF102F2486;
	Mon,  8 Dec 2025 10:49:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765187374; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=v3jQfxdOJ6tOxcQiXUmfIB2+hxDREoTnnjB7VOypO2U=;
	b=O6SP7kQgPeXHtFSRS0w6g6m1K3Bxu5ibA2svivNVFvqca7j5h3V7jtGHMdORC27pAdSE+v
	OOEvaKOROcvN2yNbWH8D7D7kJshtQOSxj+xs6Z7df16MRzzv8lGFGm1Dl+wrZnmCY6QajB
	iKb8JmdS3aRQeBBAHPXtnmNRG7x443LAIhDN0RG22KUG0srtQAm/6szq9vJ0b2A66D1EKm
	oyQIW0MUUWnj4v6Wo+pElDkQczgj+Y2R9uFn4cUCc3rFSQUBAhj8fvsCq6du1x3u/RcKt9
	nGePB7ZzZBVlZW9uFdqzctUvpkGtmD5Es7QgrAjtjHgTL8tE5Fy9VyL/UZ5Zlw==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Pascal Eberhard <pascal.eberhard@se.com>,
	"Kamel Bouhara (Schneider Electric)" <kamel.bouhara@bootlin.com>
Subject: [PATCH v5 1/3] kernel.bbclass: Add task to export kernel configuration to SPDX
Date: Mon,  8 Dec 2025 10:49:27 +0100
Message-ID: <20251208094929.46495-2-kamel.bouhara@bootlin.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227384

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



Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44C8ED5B846
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 15:54:46 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.52233.1765814081966863663
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 07:54:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=gJ1WWO76;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4A40A1A21E1
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 15:54:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 205FF60664;
	Mon, 15 Dec 2025 15:54:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 44A51119426CF;
	Mon, 15 Dec 2025 16:54:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765814075; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=PKfhtknpGX8YDBr8ZTyzb2xSlK12nbqhlHDP9MJNm1A=;
	b=gJ1WWO76cGBFTlZQ5xEPctK2422vSimwhjn1LujhsB2EyIl51VfdPY9osxbqfMn157k+N8
	GXHzMbSQOk7PfV63fdZhttJ7IHCF3opaE+RXfJs43XJJSBZDMdmCJjerTp48FgyOG0mA48
	OTlzQ7hFTdPBW4qe1w3uLcdH1FBnKR6XhLE80+7fK2A03WYwkVdGL1vjeNOdpMKBqGGhSh
	Yr5JvOrZxiNZXxK/eLCQ6NDb7VJ4WsrFmgml37ouy428A5EywQxZIzKVp1hzNuXoWCVpWy
	TqV1ClFcDbGfVFv1dTuYcjlH//jjR8sfF7GpU6R55UrKuEJE4tWpdqBqQGGw+g==
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
Subject: [scarthgap 2/3] spdx30_tasks: Add support for exporting PACKAGECONFIG to SPDX
Date: Mon, 15 Dec 2025 16:54:23 +0100
Message-ID: <20251215155424.237662-3-kamel.bouhara@bootlin.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227745

From: "Kamel Bouhara (Schneider Electric)" <kamel.bouhara@bootlin.com>

Introduce the SPDX_INCLUDE_PACKAGECONFIG variable, which when enabled cau=
ses
PACKAGECONFIG features to be recorded in the SPDX document as build param=
eters.

Each feature is recorded as a DictionaryEntry with key PACKAGECONFIG:<fea=
ture>
and value enabled or disabled, depending on whether the feature is active=
 in
the current build.

This makes the build-time configuration more transparent in SPDX output a=
nd
improves reproducibility tracking.

This makes the build-time configuration more transparent in SPDX output a=
nd
improves reproducibility tracking. In particular, it allows consumers of =
the
SBOM to identify enabled/disabled features that may affect security postu=
re
or feature set.

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Kamel Bouhara (Schneider Electric) <kamel.bouhara@bootlin.=
com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7ec61ac40345a5c0ef1ce20513a4596989c91ef4)
---
 meta/classes/create-spdx-3.0.bbclass |  5 +++++
 meta/lib/oe/spdx30_tasks.py          | 20 ++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-s=
pdx-3.0.bbclass
index 15c31ba9a3..6125e8b547 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -56,6 +56,11 @@ and each CONFIG_* value will be included in the Build.=
build_parameter list as Di
 items. Set to '0' to disable exporting kernel configuration to improve p=
erformance or reduce \
 SPDX document size."
=20
+SPDX_INCLUDE_PACKAGECONFIG ??=3D "0"
+SPDX_INCLUDE_PACKAGECONFIG[doc] =3D "If set to '1', each PACKAGECONFIG f=
eature is recorded in the \
+build_Build object's build_parameter list as a DictionaryEntry with key =
\
+'PACKAGECONFIG:<feature>' and value 'enabled' or 'disabled'"
+
 SPDX_IMPORTS ??=3D ""
 SPDX_IMPORTS[doc] =3D "SPDX_IMPORTS is the base variable that describes =
how to \
     reference external SPDX ids. Each import is defined as a key in this=
 \
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index e425958991..a3d848ceb1 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -809,6 +809,26 @@ def create_spdx(d):
             sorted(list(build_inputs)) + sorted(list(debug_source_ids)),
         )
=20
+    if d.getVar("SPDX_INCLUDE_PACKAGECONFIG", True) !=3D "0":
+        packageconfig =3D (d.getVar("PACKAGECONFIG") or "").split()
+        all_features =3D (d.getVarFlags("PACKAGECONFIG") or {}).keys()
+
+        if all_features:
+            enabled =3D set(packageconfig)
+            all_features_set =3D set(all_features)
+            disabled =3D all_features_set - enabled
+
+            for feature in sorted(all_features):
+                status =3D "enabled" if feature in enabled else "disable=
d"
+                build.build_parameter.append(
+                    oe.spdx30.DictionaryEntry(
+                        key=3Df"PACKAGECONFIG:{feature}",
+                        value=3Dstatus
+                    )
+                )
+
+            bb.note(f"Added PACKAGECONFIG entries: {len(enabled)} enable=
d, {len(disabled)} disabled")
+
     oe.sbom30.write_recipe_jsonld_doc(d, build_objset, "recipes", deploy=
dir)
=20
=20
--=20
2.43.0



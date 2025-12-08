Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14432D3B7DE
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 09:49:41 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4947.1765187378246285611
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Dec 2025 01:49:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=gesCA53G;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AAD224E41AE5
	for <openembedded-core@lists.openembedded.org>; Mon,  8 Dec 2025 09:49:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7F1FB60707;
	Mon,  8 Dec 2025 09:49:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3B9C5102F2491;
	Mon,  8 Dec 2025 10:49:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765187376; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=v4xeXLiqeedTfvAyGsMttsqf/UmOn6nRkPZ8ATAApl0=;
	b=gesCA53GmdOimTCwTeAXFAuYMKktOVWq+QPNj9Gk0SWSWCS0h20zLKvDfyA6nh2CVRVlUa
	foQfdTo9kIMqwoutmErp7ei5sYs8xZogqjoNnVDH7pmcSQ6+9YEGVPunbjQ1MMmI9QB2iB
	Y+mEID9qaDZHSVsZ1O16l12lgKBTrEE3KorQH17O18N849XqAs8h78oYxaRB89GRod4uwk
	maFydQsFGCW6TZEUwA8G1jcKV382YZ2eh+fwoxwq5oIj95jJ0Em9pnQdrbNM+000YPHIRg
	R2ok4f1MeUlhIp/d9KeZFSNtKHgndw/QnZfVqt7eAjsaEIt2hrs4HOwpbr8feQ==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Pascal Eberhard <pascal.eberhard@se.com>,
	"Kamel Bouhara (Schneider Electric)" <kamel.bouhara@bootlin.com>
Subject: [PATCH v5 2/3] spdx30_tasks: Add support for exporting PACKAGECONFIG to SPDX
Date: Mon,  8 Dec 2025 10:49:28 +0100
Message-ID: <20251208094929.46495-3-kamel.bouhara@bootlin.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227385

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
---
 meta/classes/create-spdx-3.0.bbclass |  5 +++++
 meta/lib/oe/spdx30_tasks.py          | 20 ++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-s=
pdx-3.0.bbclass
index f4f7a77d86..96c0b9722b 100644
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
index 4d11b3c289..f731a709e3 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -813,6 +813,26 @@ def create_spdx(d):
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



Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ABBACCF9E3
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 13:15:21 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11088.1762521316345442861
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 05:15:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=MAva6Pp7;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 064FA4E41595;
	Fri,  7 Nov 2025 13:15:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CB34F606A6;
	Fri,  7 Nov 2025 13:15:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 743D9118525BC;
	Fri,  7 Nov 2025 14:15:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762521314; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=kLbJ7VqAM4fK1f8R1/G+dwV0Julxyg4eL61zgEJ2iIo=;
	b=MAva6Pp7KYuZ0bM+prrHPJc3X/ZWye8djpYYGpj6v5B7lWM/VrNFMfriIObcUfRn7ygsYV
	FRkj+f2OWPGdWJUIAj9+V8ojwFLypcb0dy4WDUGMEsEqYlEzSoY8mh798E44ItsMBHQZl4
	0mIO5pK71jFqo4YkxPXqCFZfmHd/EOLffq8jKtTRRvDyYum3x1JpkQyLUGvXKsh9Z7XV0A
	DPSgC6UL/UlCX5bkEWLNcb4Bef2fdjHMtKKcknzAIAhTm7Mw0P7aqByZvJoZLb5jl91sqx
	QBWOFwXYKkKC4l+1yr2Wi6IADdJhsnVkJyTSosBr8pnIysGkHzieN0COgdWKdA==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap v4 04/17] classes-global/staging: Exclude do_create_spdx from automatic sysroot extension
Date: Fri,  7 Nov 2025 14:14:38 +0100
Message-ID: <20251107131502.3857600-5-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251107131502.3857600-1-kamel.bouhara@bootlin.com>
References: <20251107131502.3857600-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 13:15:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226040

From: Joshua Watt <JPEWhacker@gmail.com>

do_create_spdx is a outlier in that it doesn't need the RSS to be
extended just because it depends on do_populate_sysroot. In fact, it
only depends on do_populate_sysroot so it can see the actual recipes
sysroot, and attempting to extend the sysroot can cause problems for
some recipes (e.g. if a recipe does do_populate_sysroot[noexec] =3D "1")

As such, explicitly exclude do_create_spdx from extending the sysroot
just because it depends on do_populate_sysroot.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/staging.bbclass | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/st=
aging.bbclass
index 3678a1b441..c2213ffa2b 100644
--- a/meta/classes-global/staging.bbclass
+++ b/meta/classes-global/staging.bbclass
@@ -652,10 +652,17 @@ python do_prepare_recipe_sysroot () {
 addtask do_prepare_recipe_sysroot before do_configure after do_fetch
=20
 python staging_taskhandler() {
+    EXCLUDED_TASKS =3D (
+        "do_prepare_recipe_sysroot",
+        "do_create_spdx",
+    )
     bbtasks =3D e.tasklist
     for task in bbtasks:
+        if task in EXCLUDED_TASKS:
+            continue
+
         deps =3D d.getVarFlag(task, "depends")
-        if task !=3D 'do_prepare_recipe_sysroot' and (task =3D=3D "do_co=
nfigure" or (deps and "populate_sysroot" in deps)):
+        if task =3D=3D "do_configure" or (deps and "populate_sysroot" in=
 deps):
             d.prependVarFlag(task, "prefuncs", "extend_recipe_sysroot ")
 }
 staging_taskhandler[eventmask] =3D "bb.event.RecipeTaskPreProcess"
--=20
2.43.0



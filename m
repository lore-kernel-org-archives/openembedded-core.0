Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F24A2CCFA09
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 16:27:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1520.1762187228685480407
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 08:27:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=IDzkWCgj;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 60DA51A1851;
	Mon,  3 Nov 2025 16:27:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3124760628;
	Mon,  3 Nov 2025 16:27:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 360C510B501AD;
	Mon,  3 Nov 2025 17:27:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762187226; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=kLbJ7VqAM4fK1f8R1/G+dwV0Julxyg4eL61zgEJ2iIo=;
	b=IDzkWCgjCrnlzbzXEJmRqc7yLP1bONbQ3h+mJDRZQLC7LPdRCYzDmhJbRLrxeMJydehYQb
	+IRDRiZi8Jxv0zoAMSnNyai8RODYWkAPvgAWNnHsx/f/XevNoxTXjymMg7OGvk1DOKG5s/
	yA13uC2z0szrFmUPyAjVI5+AbVNDsHUQdkugLHb0oibHtFMD2oxwwa+T22woluHXn7F89D
	KA57U3wSKhtiu3u8232FdnRmhJ/neTOd8kc39ye65Iac33N7NJr9KJrh5f0yLdbUVQWN33
	LsUgrLZb5HG6RDqD1+oOuCC7F5EPV2965YVsHNj0THfhWpLRQmFE/3BfzYGmxA==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap v3 04/16] classes-global/staging: Exclude do_create_spdx from automatic sysroot extension
Date: Mon,  3 Nov 2025 17:26:30 +0100
Message-ID: <20251103162654.1714239-5-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251103162654.1714239-1-kamel.bouhara@bootlin.com>
References: <20251103162654.1714239-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 16:27:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225671

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



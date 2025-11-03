Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BDA4CCFA0D
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 16:27:24 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1637.1762187240127209083
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 08:27:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=al8g4tN1;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 067E5C0D7B4
	for <openembedded-core@lists.openembedded.org>; Mon,  3 Nov 2025 16:26:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CD3FB60628;
	Mon,  3 Nov 2025 16:27:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7320C10B501B0;
	Mon,  3 Nov 2025 17:27:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762187238; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=3ONSi+kkNT/9VNFjvPUjvosu8OoTrU3pkm+SaANhDhE=;
	b=al8g4tN1kZ/pm6d0or61zaRoXSHxXzKqHIHusA1ysWox18b5BaBkrtC49LbhZBLQ/xr15G
	qI1Jgw1tJkChOWpvnLUBU2dPFc9cyiZE9g96jc/oR6gKVAf9oXzwk5KDz6e3GKe5bEXVpt
	rPUkRxhslJUJXZJlMtN5OevET6vOejywwkJ208adXtBVjCjxe7Gm7fZ2S/JByaXJHsqTL5
	td3GTpqwSHyVkZzmgz5648gK9LqEUPXMYJhRnCDo50Hc7DQZkl/0SwliAV8yqMbh9f+d0H
	FTeiaUZ82vm0w1OZIYUBgZ3Esy4WzJrgYWGZf1ra7NIMK/kpGOBQEpQaPhufqQ==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Pascal Eberhard <pascal.eberhard@se.com>,
	"Kamel Bouhara (Schneider Electric)" <kamel.bouhara@bootlin.com>
Subject: [scarthgap v3 10/16] classes/create-spdx-2.2: align DEPLOY_DIR_SPDX with SPDX_VERSION layout
Date: Mon,  3 Nov 2025 17:26:36 +0100
Message-ID: <20251103162654.1714239-11-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251103162654.1714239-1-kamel.bouhara@bootlin.com>
References: <20251103162654.1714239-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 16:27:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225677

From: "Kamel Bouhara (Schneider Electric)" <kamel.bouhara@bootlin.com>

Upstream commit 544d46e4169a ("selftest/spdx: Fix for SPDX_VERSION additi=
on")
updated the selftests to expect SPDX artifacts under:

    ${DEPLOY_DIR}/spdx/${SPDX_VERSION}/

However, in this branch the effective SPDX output was still being
written to:

    ${DEPLOY_DIR}/spdx/${PACKAGE_ARCH}/

without the version subdirectory. This caused SPDX selftests such as
test_spdx_tar to fail with missing file errors, e.g.:

    AssertionError: .../deploy/spdx/SPDX-1.1/core2-64/packages/tar.spdx.j=
son does not exist

Update create-spdx-2.2.bbclass so that DEPLOY_DIR_SPDX includes
${SPDX_VERSION}, matching the expected deploy structure and restoring
successful SPDX selftests.

Signed-off-by: Kamel Bouhara (Schneider Electric) <kamel.bouhara@bootlin.=
com>
---
 meta/classes/create-spdx-2.2.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-s=
pdx-2.2.bbclass
index 1fc11ad7ac..f5adcc548d 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -4,7 +4,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
=20
-DEPLOY_DIR_SPDX ??=3D "${DEPLOY_DIR}/spdx"
+SPDX_VERSION =3D "2.2"
+DEPLOY_DIR_SPDX ??=3D "${DEPLOY_DIR}/spdx/${SPDX_VERSION}"
=20
 # The product name that the CVE database uses.  Defaults to BPN, but may=
 need to
 # be overriden per recipe (for example tiff.bb sets CVE_PRODUCT=3Dlibtif=
f).
--=20
2.43.0



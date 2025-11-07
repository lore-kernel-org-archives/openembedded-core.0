Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55EDACCF9E3
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 13:15:31 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11169.1762521322676273317
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 05:15:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=ZSGb9VHM;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 622931A1922
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Nov 2025 13:15:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3AACC606A6;
	Fri,  7 Nov 2025 13:15:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C906118525CF;
	Fri,  7 Nov 2025 14:15:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762521320; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=UlxaD+oomwvpzeb//hIpf8nPBLT0mFMygGrIMCyF440=;
	b=ZSGb9VHM+rqRSUlGLFNgrOry4Osrm8gLeBn4+wfJlyZn70DNurKX/SXoQ6Ynq6s9czAEdq
	9MNzfu5b9G+1WmOH30YOfW/MtTjU7nxPl2YHQ4v5lIJc4eTxfJaCA0GerjdLFTALZ0syhl
	H0heQ8vbijbOvgmuN3Uf1hptfdQtz1uLkUJ4gPPYkOADYw4DdyARbiAFeGHvztLeOz2CeZ
	Z68A7L1f5mlHPPeLWu392uWm76PufVgzmNZIO4/VyJPJsW7zNtImbQwUjG+YPs+uCcY1zd
	pEmelm1lDNReACzO35Y4vOVt5jabMHxRiecs2REOBNUUZSwU7S1wqXp9MkVPGA==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Pascal Eberhard <pascal.eberhard@se.com>,
	"Kamel Bouhara (Schneider Electric)" <kamel.bouhara@bootlin.com>
Subject: [scarthgap v4 10/17] classes/create-spdx-2.2: align DEPLOY_DIR_SPDX with SPDX_VERSION layout
Date: Fri,  7 Nov 2025 14:14:44 +0100
Message-ID: <20251107131502.3857600-11-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251107131502.3857600-1-kamel.bouhara@bootlin.com>
References: <20251107131502.3857600-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 13:15:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226046

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
 meta/classes/create-spdx-2.2.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-s=
pdx-2.2.bbclass
index 1fc11ad7ac..aee7fbac13 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
=20
-DEPLOY_DIR_SPDX ??=3D "${DEPLOY_DIR}/spdx"
+DEPLOY_DIR_SPDX ??=3D "${DEPLOY_DIR}/spdx/${SPDX_VERSION}"
=20
 # The product name that the CVE database uses.  Defaults to BPN, but may=
 need to
 # be overriden per recipe (for example tiff.bb sets CVE_PRODUCT=3Dlibtif=
f).
--=20
2.43.0



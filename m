Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF5A0D1A617
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 12:33:07 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8976.1767961985804102955
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jan 2026 04:33:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=bH7sJRqc;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4CB201A2742;
	Fri,  9 Jan 2026 12:33:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2267F60734;
	Fri,  9 Jan 2026 12:33:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 72BA7103C8924;
	Fri,  9 Jan 2026 13:32:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767961980; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GX94qt2gxbdV3Mz696vRwMEfL6JtSS6+N6DBZ1eRSW0=;
	b=bH7sJRqc3PD0aubEJwb8Z+4xDOEdt7IRPDiqlON+owZmcGJnLLuY9G4EdWApJwkgifnAsL
	qOmMU8+/fVmhQ/gPa3bmahwxFCzNn/tQgsz0uvzBt25WtezWkpwPrUPifQ1ra/RKaKYa5n
	ClFLOOFNpYBFc07Yi4KjKd9ND5PPtoNjw1+nr4TgX75JMGihWtaLFNecDOhYYFcizzbTZY
	91pxagJxa/2HQS3bvt36vXoZDIvJbwhgDdE0zjk2MHrg/LhSv10hhphIJHjfw8QO/mE3CR
	iT3dAfZtR9YoBvAb4NrK4dVTQA1cMFrj3sgKKI9ryfzSNTalcvP0sxPArlXbzQ==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	thomas.perrot@bootlin.com,
	raj.khem@gmail.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH v1 2/2] mesa-gl: fix QA issue in do_package
Date: Fri,  9 Jan 2026 13:32:32 +0100
Message-ID: <20260109123232.1199822-3-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260109123232.1199822-1-joaomarcos.costa@bootlin.com>
References: <20260109123232.1199822-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 12:33:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229105

Whenever 'vdpau' PACKAGECONFIG is enabled, a 'installed-vs-shipped'
error is raised. This happens because there is no
'mesa-gl-vdpau-drivers' package, even though a FILES:${PN}-vdpau-drivers
is defined.

Fix it by replacing the hardcoded package name in 'mesa-vdpau-drivers' by
'${PN}'.

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index a35dff3347..8fe8055d17 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -242,7 +242,7 @@ PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
              libopencl-mesa \
              libteflon \
              mesa-megadriver mesa-vulkan-drivers \
-             mesa-vdpau-drivers mesa-tools \
+             ${PN}-vdpau-drivers mesa-tools \
             "
=20
 # For the packages that make up the OpenGL interfaces, inject variables =
so that
--=20
2.47.0



Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9117DCDB47C
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 12:08:44 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19594.1782216519930192154
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 05:08:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=fC/hGRnH;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CD280C6B385
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 12:08:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 449FE601C2;
	Tue, 23 Jun 2026 12:08:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 59722106C8415;
	Tue, 23 Jun 2026 14:08:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782216517; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZGoDJ/mcr/ESuARz2QuztDQqnBFVi25sDpq0+1/EISk=;
	b=fC/hGRnHcZa69ooy3ho+92p+UdgWve7lWOyFpuWmg2Nevieh2OP+Hc7/ZdXZT4u4ML4nZa
	r9tKEEtpaLKNGe2Ff/NmaJElaklCNYI9C7T/I51QFijiaBXL9mdSyQ81YNL+ON95SXjmZ6
	p1Cz7JPNHVms7GtB9q+IqEtEPiCqLAusYHRTV2W0se0UuXaHBOP8MfgAE7x8jlvs8fN77J
	nBFCzUhNLoLAjE1hHr10FDIUU+lZqSzMbCLJIiEz6kFpFUvhFSe7+JC8vdmkpalz+iNv7S
	DTE1GaWfRUvdwuIiNuT5DpMFQHX88KsiYARoIBQcOdKSbStuHhlgTZiS4tWfCA==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	raj.khem@gmail.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH v2 2/5] llvm-project-source.inc: fix end of line in triple variable
Date: Tue, 23 Jun 2026 14:08:15 +0200
Message-ID: <20260623120818.110754-3-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260623120818.110754-1-joaomarcos.costa@bootlin.com>
References: <20260623120818.110754-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 12:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239361

After the return statement, a "," is present while a ";" is expected.

This leads to something like:

...return "x86_64-poky-linux",

Fix this syntax error by replacing "," with a ";".

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta/recipes-devtools/clang/llvm-project-source.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/clang/llvm-project-source.inc b/meta/r=
ecipes-devtools/clang/llvm-project-source.inc
index 6540d1cc7c..85b5ef06dc 100644
--- a/meta/recipes-devtools/clang/llvm-project-source.inc
+++ b/meta/recipes-devtools/clang/llvm-project-source.inc
@@ -71,7 +71,7 @@ python do_preconfigure() {
         distro_id =3D distro.split(":")[0].replace('-','_')
         distro_triple =3D distro.split(":")[1]
         case +=3D '\\n    .Case("' + distro_id + '", Distro::' + distro_=
id.upper() + ')'
-        triple +=3D '\\n   if (Distro.Is' + distro_id.upper() + '())\\n =
    return "x86_64-' + distro_triple + '-linux",'
+        triple +=3D '\\n   if (Distro.Is' + distro_id.upper() + '())\\n =
    return "x86_64-' + distro_triple + '-linux";'
         name +=3D '\\n    '+ distro_id.upper() + ','
         check +=3D '\\nbool Is' + distro_id.upper() + '() const { return=
 DistroVal =3D=3D ' + distro_id.upper() + '; }'
         oe_names +=3D  distro_id.upper() + ' ||'
--=20
2.43.0



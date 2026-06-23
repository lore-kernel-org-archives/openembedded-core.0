Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF1E9CDB46F
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 12:08:54 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19596.1782216524855841546
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 05:08:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=zsQTRTSZ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9FE931A0871
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 12:08:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 31183601C2;
	Tue, 23 Jun 2026 12:08:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 41F1A106C8477;
	Tue, 23 Jun 2026 14:08:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782216521; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KRLjpp+kDsjxmkVVsFzU8HdHlA281PXgWCG13xuHtVI=;
	b=zsQTRTSZe7/Pbdpa61eLBWchNPGGn5Q/DOMOSkavm4ktD4f2o5Dm75uYxa9YO2clxo73Mn
	RnhyuEUWw5/pOG62uNMt7L41gj9genrwgONyaCtJhCFpciKyY/d6z412O4os7wvcxfWzIa
	xSM3yYFeb3o0F/fdARylbWOR/zfZjdpdSQFUJCTTs6sSrgCS45lq2HyJ+u6WABQtfBx/5h
	4zc06VbbApSUQCcIEmph38u8Y0/jr2GF1VLywuN0IbCIV1OXmr5b68yGrO3AG2kAdYfDPG
	LG34Prjf0Wt2s6U1n1b6tm2eEqWhtyzOe/ZgcapZycKtAQMPys3Wxl52RLF2vw==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	raj.khem@gmail.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH v2 4/5] llvm-project-source.inc: add vardeps to do_preconfigure
Date: Tue, 23 Jun 2026 14:08:17 +0200
Message-ID: <20260623120818.110754-5-joaomarcos.costa@bootlin.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 12:08:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239363

The task's signature should change if CLANG_EXTRA_OE_DISTRO and/or
CLANG_EXTRA_OE_VENDORS, considering the couple of for loops in
do_preconfigure iterate over their values.

By adding them to 'vardeps', bitbake will correctly detect if
do_preconfigure needs to be executed.

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta/recipes-devtools/clang/llvm-project-source.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/clang/llvm-project-source.inc b/meta/r=
ecipes-devtools/clang/llvm-project-source.inc
index 85b5ef06dc..84d4bae0ab 100644
--- a/meta/recipes-devtools/clang/llvm-project-source.inc
+++ b/meta/recipes-devtools/clang/llvm-project-source.inc
@@ -90,4 +90,5 @@ python do_preconfigure() {
=20
 do_patch[vardepsexclude] +=3D "MULTILIBS MULTILIB_VARIANTS"
 addtask do_preconfigure after do_patch
+do_preconfigure[vardeps] +=3D "CLANG_EXTRA_OE_DISTRO CLANG_EXTRA_OE_VEND=
ORS"
 do_create_spdx[depends] +=3D "${PN}:do_preconfigure"
--=20
2.43.0



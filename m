Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C28DFF885E
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 13:09:13 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44510.1777295351708063572
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 06:09:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=qizJLLrc;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 717F5C5CD4A;
	Mon, 27 Apr 2026 13:09:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 498C3600D1;
	Mon, 27 Apr 2026 13:09:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 91E5D10728039;
	Mon, 27 Apr 2026 15:09:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777295348; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=d5ZZm8YZ1X1LYF4bjxvYdWQ+qfw/3TE8gfFK4Vhr2J0=;
	b=qizJLLrcx411B0yEcPSWeryHek93im0lH6nzyOGxgbcOesL9/aaLkDVshy/uFxHZnuiivV
	rMygpl3dfahzEDQGWVtd2jUuB62baWEdxo0DXjteUlhIqOxCdzeR0pIRA7Tr0GGxFx0qG/
	x5jmihJsJMWi/CWPr+vNBTCNOiQ4871V/ClTnbtxQtRn8wUgSBtCA+/HwjheXKlzVkdQ8A
	XlZ8SUahKBNFAMV2J+mu6v0YsnGAZY6+tRqeJ8u7wEEz9msKSSMb5heLrxU5FmQF+rAug0
	BeWdmwV7Oql5Bmy+zJPUWY34s9L8PN2ZS4Nd9bjuee52NS98n4EJDrui9/cFtg==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	quentin.schulz@cherry.de,
	qi.chen@windriver.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH v2 2/3] classes-global: insane.bbclass : simplify conditional operations with bb.utils.filter
Date: Mon, 27 Apr 2026 15:08:45 +0200
Message-ID: <20260427130846.96013-3-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260427130846.96013-1-joaomarcos.costa@bootlin.com>
References: <20260427130846.96013-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 13:09:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236010

The append override on ERROR_QA uses bb.utils.contains to check for a
string inside a variable, and return the exact same string if true.

This can be simplified by a call to bb.utils.filter, since the result is
the same, and the inline is shorter.

Replace "bb.utils.contains(A, 'a', 'a', '', d)" by "bb.utils.filter(A, 'a=
', d)".

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta/classes-global/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/ins=
ane.bbclass
index feddfe0335..04700be71c 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -46,7 +46,7 @@ ERROR_QA ?=3D "\
     ${CHECKLAYER_REQUIRED_TESTS}"
=20
 # Add usrmerge QA check based on distro feature
-ERROR_QA:append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge',=
 ' usrmerge', '', d)}"
+ERROR_QA:append =3D " ${@bb.utils.filter('DISTRO_FEATURES', 'usrmerge', =
d)}"
 WARN_QA:append:layer-core =3D " missing-metadata missing-maintainer"
=20
 FAKEROOT_QA =3D "host-user-contaminated"
--=20
2.47.0



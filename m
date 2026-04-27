Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4434FF8862
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 13:09:03 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44872.1777295336814826082
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 06:08:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Vd7lJHTu;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 721191A3442;
	Mon, 27 Apr 2026 13:08:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3FFB0600D1;
	Mon, 27 Apr 2026 13:08:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 48D8D107281F2;
	Mon, 27 Apr 2026 15:08:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777295333; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=t0pKiMs71oRknRuyc3odWF4uOkmEj96IkoD7k5p1Z5s=;
	b=Vd7lJHTusHU7YmIGBcGd9EQATL/97ebMSS/7TUKsrGuISpimVkEQ6NpMCO8wPU4+SCv6so
	tb5xPFvUexeqCHl2JWTvtTz1IpcMLe4h/K09GSl71UpQRe5n1KGBMZwNjEOaS2q/vZ8VG2
	gYg4Udn456NzptbsCTuVfLUqp6RynKHQIRb7+4PpcKmwecyWfOJu36/Orw/4ks51sAFD1y
	Z/xWlXMtrQh1HRV+bk4iHcFrsj5oXxWgrnPhY8ZxPIWjI6G0Zc19vv1Tc/yfSHhShduyVi
	09iePWnwdGiMHSAv5pVnHUlCqnrPudtWRMr5+QjEOgbkxibtIUpIkQfoA2GHPQ==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	quentin.schulz@cherry.de,
	qi.chen@windriver.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH v2 0/3] Simplify conditional operations with bb.utils.filter
Date: Mon, 27 Apr 2026 15:08:43 +0200
Message-ID: <20260427130846.96013-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 13:09:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236008

Hello,

This patch series applies overall the same change, but to specific scopes=
:
the recipes, insane.bbclass, and a couple .inc files. The idea here is to
address the comments and concerns raised in v1.

Considering now I'm providing separate patches, the review process can be
focused on points where the debate is still ongoing, while the rest (i.e.=
, the
recipes) can be picked.

Changes since v1:
- v1 was actually one single patch providing all of the changes
- the .strip() workaround was not provided in feature-arm-vfp.inc.

Jo=C3=A3o Marcos Costa (3):
  meta: simplify conditional operations with bb.utils.filter
  classes-global: insane.bbclass : simplify conditional operations with b=
b.utils.filter
  machine: include: arm: simplify conditional operations with bb.utils.fi=
lter

 meta/classes-global/insane.bbclass                        | 2 +-
 meta/conf/machine/include/arm/feature-arm-neon.inc        | 8 ++++----
 meta/conf/machine/include/arm/feature-arm-vfp.inc         | 8 ++++----
 meta/recipes-connectivity/connman/connman_2.0.bb          | 2 +-
 meta/recipes-core/coreutils/coreutils_9.10.bb             | 2 +-
 meta/recipes-core/ovmf/ovmf_git.bb                        | 2 +-
 meta/recipes-extended/at/at_3.2.5.bb                      | 2 +-
 meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb          | 2 +-
 meta/recipes-graphics/waffle/waffle_1.8.1.bb              | 2 +-
 .../gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb          | 2 +-
 10 files changed, 16 insertions(+), 16 deletions(-)

--=20
2.47.0



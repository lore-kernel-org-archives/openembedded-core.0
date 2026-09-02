Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB363C624D3
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 18:09:57 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2061.1788372592788368615
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 11:09:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=aIb5xA4v;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8BF0D4E414CE
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 18:09:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 598666053C
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 18:09:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E0D9A11C78E0A;
	Wed,  2 Sep 2026 20:09:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788372585; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=k9o+7EnlcCfXm6vuyboxeOJJ6kwSan7UOsINiZAKqso=;
	b=aIb5xA4vFMUzpGtNaPMNP7wp3MzmvmXStY2+H1GgKm1S+dVjpKEbnfckiEPmatvujnF4HY
	zCYjpC8fV10gg0ArBHwrBiIB85zeQNGl4leD0zjSODKuv9yK3KzMDimeRyWRspPlJiFDsh
	lisn8j5gPdbFYOYyg6Z1QRZTv0jUREM63kleFleMTCyjD0q28ijZWvieWmrGcUbmEPGoEs
	hvHoBaWrOhC+kqA1JL01n79VOB0iDmXal5sDdGgI5I9dyU0Y8Y32X1kTAcKijLUHvmGcVB
	tnUPfLrhXm8dw0Ttgb9Y70iNlNDs9/CyTHnwpFhnyoaOiEcnac6SnkkxURXAQg==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH v2 0/4] oeqa/selftest/reproducible: Use a fake time during
 build
Date: Wed, 02 Sep 2026 20:09:41 +0200
Message-Id: <20260902-mathieu-reproducible-faketime-v2-0-9496dff5bde3@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGVmmGoC/43NQQ6CMBCF4auQWTumLWjQFfcwLEo7yESgpC1EQ
 3p3Kydw+b3F/3YI5JkC3IsdPG0c2M0Z6lSAGfT8JGSbDUqoq7gJiZOOA9OKnhbv7Gq4Gwl7/aL
 IE2FlpSzLkqw2PeTG4qnn99F/tNkDh+j857jb5G/9t7xJFEjayFpdqrpSqumciyPPZ+MmaFNKX
 1Yq+N/MAAAA
X-Change-ID: 20260901-mathieu-reproducible-faketime-4d11333edacf
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788372584; l=1374;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=GZ62oVaWR3jWrAVhufFzC331QQ8NPSaS0/T2Wr73N6U=;
 b=uA+vQBO3nkKckCWBN22yaO3kTpFEzelen5SLxTY+yyIC1h5ZoFzPy7g00QWq+zSjKMRaOOGHb
 A5f80tLJQBKC6v9e4pGReeovkV6EImG63/fBin+LpFddL3bOspir170
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 18:09:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244985

Implement some long standing idea: use a fake time during the second
half of the reproducible tests, helping to find potentially hidden
reproducibility issues.
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13509

No regression seen with current master branch:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/4878

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
Changes in v2:
- upgrade faketime and fix build
- Link to v1: https://lore.kernel.org/r/20260901-mathieu-reproducible-faketime-v1-0-eac182548422@bootlin.com

---
Mathieu Dubois-Briand (4):
      libfaketime: Import recipe from meta-oe
      libfaketime: update 0.9.12 -> 0.9.13
      libfaketime: Fix builds on 32 bits platforms
      oeqa/selftest/reproducible: Use a fake time during build

 meta/conf/distro/include/maintainers.inc           |  1 +
 meta/lib/oeqa/selftest/cases/reproducible.py       | 28 +++++++++----
 ....c-do-not-declare-__time64-when-D_TIME_BI.patch | 46 ++++++++++++++++++++++
 .../libfaketime/libfaketime_0.9.13.bb              | 34 ++++++++++++++++
 4 files changed, 102 insertions(+), 7 deletions(-)
---
base-commit: db81c1a42a0f552d9a8ec124f004ae2063d58c33
change-id: 20260901-mathieu-reproducible-faketime-4d11333edacf

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>



Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBDBCCA5FCE
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 13:39:14 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20291.1791207552657850697
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 06:39:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=aWtQ/Vla;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4289B4E4117C;
	Mon,  5 Oct 2026 13:39:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1558E601A5;
	Mon,  5 Oct 2026 13:39:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 79D9E10330374;
	Mon,  5 Oct 2026 15:39:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791207545; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=8IQc07ZHzKKCavbWxmh8pkXwZGdl6YQzPIVaoE0Syts=;
	b=aWtQ/VlasOCk2cat6OHce49D4XAtFT2uoHAS8KHElY/ZKZ+O7OgGTD9zvEM9deFNWrmZHx
	hr7xE640V9Dh6Qjh/iA9mJFwwrM/6Wpa77ExcxOOZnNH3MlSE97ySrs0/iCqcW9GDU7J/B
	ux75T3qoM7/wszUIg6IgrOtfTrKcOZfmQNbTvsR4+YX6+ojZgfwU7Vari07NJZ+38nifMj
	TOQLCNtFlndIXC4vHvtBhAGxhHWiiwGAbw6dQBopaj9QrJ7DUqFHg5qJUCL2/oBliLHVID
	SQIpRyQIzFxLQmQiKtAvFJ2WAZf46fwfdAObLVGcDINVs/97lRf3CCYL4AwHOA==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	tgamblin@baylibre.com,
	ross.burton@arm.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH v4 0/1] recipes-support/gnutls: disable slow tests for RISCV64
Date: Mon,  5 Oct 2026 15:38:49 +0200
Message-ID: <20261005133850.2350694-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 13:39:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247241

Hello,

After Trevor's investigation, I was able to remove only the most time
consuming test cases.

Changes since v3:
- replace the arch. specific patch by a variable to extend
  test_disallowlist in run-ptest
Changes since v2:
- now we only remove the tests that take longer than 60000ms, so I
  brought back mini-dtls-hello-verify-48, tls12-ffdhe, and
  x509sign-verify-*
Changes since v1 [1]:
- patched the tests instead of entirely disabling gnutls ptests
- updated the title accordingly

Best regards,

[1] https://lists.openembedded.org/g/openembedded-core/message/246201

Jo=C3=A3o Marcos Costa (1):
  recipes-support/gnutls: disable slow tests for RISCV64

 meta/recipes-support/gnutls/gnutls/run-ptest |  1 +
 meta/recipes-support/gnutls/gnutls_3.8.13.bb | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

--=20
2.55.0



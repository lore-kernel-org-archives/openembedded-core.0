Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 631F0C55ABA
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 11:36:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38285.1785929799997730248
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 04:36:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=AT2XXnMH;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4905C153B
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Aug 2026 04:36:35 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DDE7E3F66F
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Aug 2026 04:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785929799; bh=E+RJVr+KVnt+0b98XUkH8cr9BMVsTnxmqayqvh3WiWE=;
	h=From:To:Subject:Date:From;
	b=AT2XXnMHfJ01yLT7kAHF5gg3LgZGSbFc67R4SnCNFUL0XEvbmfH5ikG7H1WeIcKd8
	 Dl2TTyH84hPQ338qSS0tMyHB2h3twZa8ybk5elIcmFAU+goA8XV+qNLwEDqL5+bbAu
	 oRoyiGZMqtsLM9UzkvYCHLjsoOUupuD9KeQpO8lI=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] systemd: add missing libucontext dependency on musl
Date: Wed,  5 Aug 2026 12:36:32 +0100
Message-ID: <20260805113634.79174-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 11:36:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242861

This library is needed when building with musl since v261[1].

[1] systemd 8533513aff ("Introduce support for running code in fibers")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/systemd/systemd_261.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_261.1.bb b/meta/recipes-co=
re/systemd/systemd_261.1.bb
index 575717bb893..b025580bab4 100644
--- a/meta/recipes-core/systemd/systemd_261.1.bb
+++ b/meta/recipes-core/systemd/systemd_261.1.bb
@@ -5,6 +5,7 @@ PROVIDES =3D "udev"
 PE =3D "1"
=20
 DEPENDS =3D "gperf-native libcap util-linux python3-jinja2-native"
+DEPENDS:append:libc-musl =3D " libucontext"
=20
 SECTION =3D "base/shell"
=20
--=20
2.43.0



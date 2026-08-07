Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF07C5AC7A
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 10:35:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39803.1786098945514672428
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2026 03:35:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=XXybYT4C;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 037EE1516
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Aug 2026 03:35:41 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A01103F9A2
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Aug 2026 03:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786098945; bh=BHWd9i4rU/N9eiwhibD/yZN0WHCv2ZSi1ueci70dgjE=;
	h=From:To:Subject:Date:From;
	b=XXybYT4C/5ESSnj7QvhTxuJ6zkDFwxpZhq3ieMUHV15YIYfcoVfhN3nvD5xn+o6xF
	 OUUgGbtkB6NmeGKJDBrognYBoTaIPOjVDuM0lnuW/6de4Fky/qvTRQye/b8uHE3CgF
	 GjfMcqnFHS+OIOrtcU8sbBfBuV9mq+wzHeNEOiqE=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/2] systemd: add missing libucontext dependency on musl
Date: Fri,  7 Aug 2026 11:35:39 +0100
Message-ID: <20260807103540.3404860-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 10:35:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243003

This library is needed when building with musl since v261[1].

[1] systemd 8533513aff ("Introduce support for running code in fibers")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/systemd/systemd_261.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_261.2.bb b/meta/recipes-co=
re/systemd/systemd_261.2.bb
index b295a69548f..80e1aa07d17 100644
--- a/meta/recipes-core/systemd/systemd_261.2.bb
+++ b/meta/recipes-core/systemd/systemd_261.2.bb
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



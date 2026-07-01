Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 364ACC43602
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 16:13:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49050.1782922398701208108
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 09:13:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=tIBhvm8t;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B337216A3
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Jul 2026 09:13:13 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AFBEF3F673
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Jul 2026 09:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782922398; bh=707KA2XUJ7tjTWDiUqv2AhGY6ZSuo8E4H20Q+FjZWU8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tIBhvm8tTJpdx1M66M3aqw9nWkWsw7BuuVVRi4og1oRY75qxP9yW0kNeqHN7kbSUU
	 Voao/lFEHp2uYOKGuzkZfuyNOqh/Kn1tpT3701b9N3x++QTJ5vzNiKTWABMt1BzJcP
	 UXODIf52xh709siM3T8IsecqVjj8U9TiaBVPvvpU=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] at-spi2-core: inherit python3-dir not python3targetconfig
Date: Wed,  1 Jul 2026 17:13:12 +0100
Message-ID: <20260701161313.981064-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701161313.981064-1-ross.burton@arm.com>
References: <20260701161313.981064-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 16:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239994

Now that meson.bbclass tells meson where to install Python files this
recipe just needs to know the value of PYTHON_SITEPACKAGES_DIR for
FILES, so just inherit python3-dir to remove a dependency on the target
python recipe.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/atk/at-spi2-core_2.60.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.60.4.bb b/meta/recip=
es-support/atk/at-spi2-core_2.60.4.bb
index 5068cb82fe7..9472e06b1de 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.60.4.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.60.4.bb
@@ -23,7 +23,7 @@ DEPENDS =3D " \
 PROVIDES +=3D "atk at-spi2-atk"
 RPROVIDES:${PN} +=3D "atk at-spi2-atk"
=20
-inherit gnomebase gi-docgen gettext systemd upstream-version-is-even gob=
ject-introspection python3targetconfig
+inherit gnomebase gi-docgen gettext systemd upstream-version-is-even gob=
ject-introspection python3-dir
=20
 EXTRA_OEMESON =3D " -Dsystemd_user_dir=3D${systemd_user_unitdir} \
                   -Ddbus_daemon=3D${bindir}/dbus-daemon"
--=20
2.43.0



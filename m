Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 761DAC2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 15:43:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.15962.1747323790561528079
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 08:43:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4330D14BF
	for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 08:42:58 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8BF1C3F63F
	for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 08:43:09 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] cryptodev-linux: clean up do_install
Date: Thu, 15 May 2025 16:43:05 +0100
Message-ID: <20250515154305.201372-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 15:43:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216690

The upstream Makefile now supports installing the headers directly[1],
so use the target instead of calling install manually.

[1] https://github.com/cryptodev-linux/cryptodev-linux/commit/e3962fea4e1=
816df420c36ad72845f90dfcfb611

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-kernel/cryptodev/cryptodev-linux_1.14.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/cryptodev/cryptodev-linux_1.14.bb b/meta=
/recipes-kernel/cryptodev/cryptodev-linux_1.14.bb
index d5ea9d85293..451a8d7ef87 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev-linux_1.14.bb
+++ b/meta/recipes-kernel/cryptodev/cryptodev-linux_1.14.bb
@@ -4,9 +4,8 @@ SUMMARY =3D "A /dev/crypto device driver header file"
=20
 do_compile[noexec] =3D "1"
=20
-# Just install cryptodev.h which is the only header file needed to be ex=
ported
 do_install() {
-	install -D ${S}/crypto/cryptodev.h ${D}${includedir}/crypto/cryptodev.h
+	oe_runmake headers_install DESTDIR=3D"${D}"
 }
=20
 ALLOW_EMPTY:${PN} =3D "1"
--=20
2.43.0



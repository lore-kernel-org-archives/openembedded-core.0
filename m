Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3DF9C61CE8
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 20:30:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.4754.1749760206442687725
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 13:30:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3250152B
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 13:29:45 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 736393F673
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 13:30:05 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libtheora: disable all 32-bit arm assembler
Date: Thu, 12 Jun 2025 21:30:01 +0100
Message-ID: <20250612203001.281873-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 20:30:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218535

The 32-bit Arm assembler is mostly broken. In 1.1.0 it was never used,
and 1.2.0 tries to enable it and there are a number of different ways it
can fail (some gcc/architecture combinations, and all clang builds).

Until this is fixed upstream, simply disable assembler entirely.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb b/meta/=
recipes-multimedia/libtheora/libtheora_1.2.0.bb
index 361d2c6e4a3..1a1b5fce06e 100644
--- a/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb
+++ b/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb
@@ -19,6 +19,11 @@ inherit autotools pkgconfig
=20
 EXTRA_OECONF =3D "--disable-examples --disable-doc"
=20
+# theora 1.2.0 has broken 32-bit arm assembler, see:
+# https://gitlab.xiph.org/xiph/theora/-/issues/2339
+# https://gitlab.xiph.org/xiph/theora/-/issues/2340
+EXTRA_OECONF:append:arm =3D " --disable-asm"
+
 # these old architectures don't support all the instructions from the as=
m source files
 EXTRA_OECONF:append:armv4 =3D " --disable-asm "
 EXTRA_OECONF:append:armv5 =3D " --disable-asm "
--=20
2.43.0



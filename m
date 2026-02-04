Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22ACFE9D403
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 15:34:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23212.1770219268511126653
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 07:34:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB855339
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Feb 2026 07:34:21 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AE33C3F778
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Feb 2026 07:34:27 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gawk: trim native build configuration
Date: Wed,  4 Feb 2026 15:34:22 +0000
Message-ID: <20260204153422.1904772-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 15:34:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230548

When we build gawk-native it is only for use in builds where the host
gawk output isn't reproducible across versions[1]. As such it doesn't
need support for readline or mprf, and by removing those from gawk-native
we can get building gawk-native sooner.

[1] oe-core c5bbf0a60b ("gawk: use native gawk when building glibc and gr=
ub")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/gawk/gawk_5.3.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/gawk/gawk_5.3.2.bb b/meta/recipes-exte=
nded/gawk/gawk_5.3.2.bb
index 01602f4f27..324f2c463a 100644
--- a/meta/recipes-extended/gawk/gawk_5.3.2.bb
+++ b/meta/recipes-extended/gawk/gawk_5.3.2.bb
@@ -15,6 +15,9 @@ LICENSE:${PN} =3D "GPL-3.0-or-later"
 LICENSE:${PN}:append =3D " ${@bb.utils.contains('PACKAGECONFIG', 'pma-if=
-64bit', ' & AGPL-3.0-or-later', '', d)}"
=20
 PACKAGECONFIG ??=3D "readline mpfr"
+# Make native builds lean
+PACKAGECONFIG:class-native =3D ""
+
 PACKAGECONFIG[readline] =3D "--with-readline,--without-readline,readline=
"
 PACKAGECONFIG[mpfr] =3D "--with-mpfr,--without-mpfr, mpfr"
 # pma: persistent memory allocator:
--=20
2.43.0



Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6125C3DA49
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 16:11:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.560.1721146276737942237
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jul 2024 09:11:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 76A5E1063
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 09:11:41 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D3F173F766
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 09:11:15 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] openssl: disable tests unless ptest is enabled
Date: Tue, 16 Jul 2024 17:11:11 +0100
Message-Id: <20240716161111.1750655-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 16:11:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202124

The upstream Makefile always builds the tests unless they're explicitly
disabled. Whilst this doesn't make a difference to the final package and
sysroot output, disabling the tests for openssl-native reduces the size
of the build tree from 659M to 78M and reduces the CPU time used by 30%.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/openssl/openssl_3.3.1.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.3.1.bb b/meta/re=
cipes-connectivity/openssl/openssl_3.3.1.bb
index 0ad84951e65..f8f22541534 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.3.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.3.1.bb
@@ -35,6 +35,8 @@ PACKAGECONFIG[manpages] =3D ""
 B =3D "${WORKDIR}/build"
 do_configure[cleandirs] =3D "${B}"
=20
+EXTRA_OECONF =3D "${@bb.utils.contains('PTEST_ENABLED', '1', '', 'no-tes=
ts', d)}"
+
 #| ./libcrypto.so: undefined reference to `getcontext'
 #| ./libcrypto.so: undefined reference to `setcontext'
 #| ./libcrypto.so: undefined reference to `makecontext'
@@ -43,8 +45,8 @@ EXTRA_OECONF:append:libc-musl:powerpc64 =3D " no-asm"
=20
 # adding devrandom prevents openssl from using getrandom() which is not =
available on older glibc versions
 # (native versions can be built with newer glibc, but then relocated ont=
o a system with older glibc)
-EXTRA_OECONF:class-native =3D "--with-rand-seed=3Dos,devrandom"
-EXTRA_OECONF:class-nativesdk =3D "--with-rand-seed=3Dos,devrandom"
+EXTRA_OECONF:append:class-native =3D " --with-rand-seed=3Dos,devrandom"
+EXTRA_OECONF:append:class-nativesdk =3D " --with-rand-seed=3Dos,devrando=
m"
=20
 # Relying on hardcoded built-in paths causes openssl-native to not be re=
locateable from sstate.
 CFLAGS:append:class-native =3D " -DOPENSSLDIR=3D/not/builtin -DENGINESDI=
R=3D/not/builtin"
--=20
2.34.1



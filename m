Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3449EC41513
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 14:48:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.16871.1721314116384619052
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 07:48:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5950E106F
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 07:49:01 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AC3E03F762
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 07:48:35 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] openssl: strip the test suite
Date: Thu, 18 Jul 2024 15:48:28 +0100
Message-Id: <20240718144829.2504384-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240718144829.2504384-1-ross.burton@arm.com>
References: <20240718144829.2504384-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 14:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202227

The test suite is huge because every test binary is statically linked to
libssl and/or libcrypto. This bloats the size of the -dbg package hugely,
so strip the test suite before packaging.

This reduces the size of openssl-dbg by 90% from ~1.2GB to ~120MB, and
reduces the size of the build tree from ~1.9GB to ~800MB.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/openssl/openssl_3.3.1.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.3.1.bb b/meta/re=
cipes-connectivity/openssl/openssl_3.3.1.bb
index f8f22541534..36d2f87c265 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.3.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.3.1.bb
@@ -146,6 +146,13 @@ do_configure () {
 	perl ${B}/configdata.pm --dump
 }
=20
+do_compile:append () {
+	# The test suite binaries are large and we don't need the debugging in =
them
+	if test -d ${B}/test; then
+		find ${B}/test -type f -executable -exec ${STRIP} {} \;
+	fi
+}
+
 do_install () {
 	oe_runmake DESTDIR=3D"${D}" MANDIR=3D"${mandir}" MANSUFFIX=3Dssl instal=
l_sw install_ssldirs ${@bb.utils.contains('PACKAGECONFIG', 'manpages', 'i=
nstall_docs', '', d)}
=20
@@ -252,6 +259,9 @@ RDEPENDS:${PN}-ptest +=3D "openssl-bin perl perl-modu=
les bash sed"
=20
 RDEPENDS:${PN}-bin +=3D "openssl-conf"
=20
+# The test suite is installed stripped
+INSANE_SKIP:${PN} =3D "already-stripped"
+
 BBCLASSEXTEND =3D "native nativesdk"
=20
 CVE_PRODUCT =3D "openssl:openssl"
--=20
2.34.1



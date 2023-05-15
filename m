Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D03CC7EE2C
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 13:30:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.88211.1684157398181623813
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 06:29:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 687C32F4;
	Mon, 15 May 2023 06:30:42 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 45C223F67D;
	Mon, 15 May 2023 06:29:57 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/8] gnutls: add PACKAGECONFIG for DANE
Date: Mon, 15 May 2023 14:29:48 +0100
Message-Id: <20230515132955.2231164-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 13:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181251

From: Ross Burton <ross.burton@arm.com>

DANE (DNS-based Authentication of Named Entities) allows certificates to
be bound to DNS entries.

This requires unbound which is not part of oe-core.  Add a PACKAGECONFIG
but disable by default.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/gnutls/gnutls_3.8.0.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/gnutls/gnutls_3.8.0.bb b/meta/recipes-s=
upport/gnutls/gnutls_3.8.0.bb
index 7ddd2420bd5..e6b9a527a6d 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.0.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.0.bb
@@ -40,10 +40,10 @@ PACKAGECONFIG[libtasn1] =3D "--with-included-libtasn1=
=3Dno,--with-included-libtasn1,
 PACKAGECONFIG[p11-kit] =3D "--with-p11-kit,--without-p11-kit,p11-kit"
 PACKAGECONFIG[tpm] =3D "--with-tpm,--without-tpm,trousers"
 PACKAGECONFIG[fips] =3D "--enable-fips140-mode --with-libdl-prefix=3D${S=
TAGING_BASELIBDIR}"
+PACKAGECONFIG[dane] =3D "--enable-libdane,--disable-libdane,unbound"
=20
 EXTRA_OECONF =3D " \
     --enable-doc \
-    --disable-libdane \
     --disable-rpath \
     --enable-openssl-compatibility \
     --with-libpthread-prefix=3D${STAGING_DIR_HOST}${prefix} \
@@ -73,9 +73,11 @@ do_compile:append() {
         oe_runmake ${PARALLEL_MAKE} -C tests buildtest-TESTS
 }
=20
-PACKAGES =3D+ "${PN}-openssl ${PN}-xx ${PN}-fips"
+PACKAGES =3D+ "${PN}-dane ${PN}-openssl ${PN}-xx ${PN}-fips"
=20
 FILES:${PN}-dev +=3D "${bindir}/gnutls-cli-debug"
+
+FILES:${PN}-dane =3D "${libdir}/libgnutls-dane.so.*"
 FILES:${PN}-openssl =3D "${libdir}/libgnutls-openssl.so.*"
 FILES:${PN}-xx =3D "${libdir}/libgnutlsxx.so.*"
 FILES:${PN}-fips =3D "${bindir}/fipshmac"
--=20
2.34.1



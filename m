Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B37DAC531D2
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 13:55:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24008.1784814920410576187
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 06:55:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=jzLeN1h2;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B603D1477
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 06:55:15 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 826303F66F
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 06:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784814919; bh=oE3rfdguClGmyTD2a/+Y9IAJN2AK8WF8ewgStH17aI8=;
	h=From:To:Subject:Date:From;
	b=jzLeN1h2OYe7AUjk76Bet04YLMGvkY+45bwOPxFI5c30n8jEKfAqPJTReVSrYXum7
	 DXhYZ6prIFp7o5KxMe0lmI0qptD042Uw+7gkpc6NX7uf9iSa9Y7KYjxk6Dt5IQg9ss
	 cSd6UFGsz6SVCb8nSoJ/XKxwxDXoWXfy51j/r8h8=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] curl: add option for libpsl, the Public Suffix List library
Date: Thu, 23 Jul 2026 14:55:12 +0100
Message-ID: <20260723135515.1297700-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 13:55:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241844

Instead of hardcoding this to disabled, add a PACKAGECONFIG.

No behavioural changes in this patch.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/curl/curl_8.21.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_8.21.0.bb b/meta/recipes-supp=
ort/curl/curl_8.21.0.bb
index d245e7fe60f..399b915dee8 100644
--- a/meta/recipes-support/curl/curl_8.21.0.bb
+++ b/meta/recipes-support/curl/curl_8.21.0.bb
@@ -55,6 +55,7 @@ PACKAGECONFIG[ldap] =3D "--enable-ldap,--disable-ldap,o=
penldap"
 PACKAGECONFIG[ldaps] =3D "--enable-ldaps,--disable-ldaps,openldap"
 PACKAGECONFIG[libgsasl] =3D "--with-libgsasl,--without-libgsasl,libgsasl=
"
 PACKAGECONFIG[libidn] =3D "--with-libidn2,--without-libidn2,libidn2"
+PACKAGECONFIG[libpsl] =3D "--with-libpsl,--without-libpsl,libpsl"
 PACKAGECONFIG[libssh] =3D "--with-libssh,--without-libssh,libssh"
 PACKAGECONFIG[libssh2] =3D "--with-libssh2,--without-libssh2,libssh2"
 PACKAGECONFIG[mbedtls] =3D "--with-mbedtls,--without-mbedtls,mbedtls"
@@ -85,7 +86,6 @@ CURL_CA_BUNDLE_BASE_DIR:class-target =3D "${sysconfdir}=
"
=20
 EXTRA_OECONF =3D " \
     --disable-libcurl-option \
-    --without-libpsl \
     --enable-optimize \
     --with-ca-bundle=3D${CURL_CA_BUNDLE_BASE_DIR}/ssl/certs/ca-certifica=
tes.crt \
     ${@'--without-ssl' if (bb.utils.filter('PACKAGECONFIG', 'gnutls mbed=
tls openssl schannel', d) =3D=3D '') else ''} \
--=20
2.43.0



Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C228DC46467
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 14:18:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.24724.1673446676751836562
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 06:17:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E1CEFEC;
	Wed, 11 Jan 2023 06:18:38 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D14B13F71A;
	Wed, 11 Jan 2023 06:17:55 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] curl: don't enable debug builds
Date: Wed, 11 Jan 2023 14:17:53 +0000
Message-Id: <20230111141753.1249071-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 14:18:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175740

In oe-core 27824261 --enable-debug was added to the configure arguments
to turn on debugging symbols.  However, enabling debug mode does more
than turn on debugging symbols and introduces some codepaths that can be
controlled with environment variables.  Bluntly, the curl maintainer
says that --enable-debug should not be used in production:

https://curl.se/mail/lib-2023-01/0039.html

I did a build and verified that the curl-dbg package doesn't massively
shrink, so the debug symbols are still being built.

Remove the debug options and hide them behind a PACKAGECONFIG, with a
comment that it should not be used in production.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/curl/curl_7.87.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/curl/curl_7.87.0.bb b/meta/recipes-supp=
ort/curl/curl_7.87.0.bb
index a3ad66f1aa3..9956a284228 100644
--- a/meta/recipes-support/curl/curl_7.87.0.bb
+++ b/meta/recipes-support/curl/curl_7.87.0.bb
@@ -32,6 +32,8 @@ PACKAGECONFIG:class-nativesdk =3D "ipv6 openssl proxy r=
andom threaded-resolver ver
 PACKAGECONFIG[ares] =3D "--enable-ares,--disable-ares,c-ares,,,threaded-=
resolver"
 PACKAGECONFIG[brotli] =3D "--with-brotli,--without-brotli,brotli"
 PACKAGECONFIG[builtinmanual] =3D "--enable-manual,--disable-manual"
+# Don't use this in production
+PACKAGECONFIG[debug] =3D "--enable-debug,--disable-debug"
 PACKAGECONFIG[dict] =3D "--enable-dict,--disable-dict,"
 PACKAGECONFIG[gnutls] =3D "--with-gnutls,--without-gnutls,gnutls"
 PACKAGECONFIG[gopher] =3D "--enable-gopher,--disable-gopher,"
@@ -68,9 +70,7 @@ EXTRA_OECONF =3D " \
     --enable-crypto-auth \
     --with-ca-bundle=3D${sysconfdir}/ssl/certs/ca-certificates.crt \
     --without-libpsl \
-    --enable-debug \
     --enable-optimize \
-    --disable-curldebug \
     ${@'--without-ssl' if (bb.utils.filter('PACKAGECONFIG', 'gnutls mbed=
tls nss openssl', d) =3D=3D '') else ''} \
 "
=20
--=20
2.34.1



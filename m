Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6469C531CF
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 13:55:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24009.1784814920976886662
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 06:55:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=TRvFD+QQ;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64A761595
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 06:55:16 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 348613F66F
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 06:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784814920; bh=yJEleY7inMSdS8mxRMC5g8nIxDXu1V+AFRbbynNDByU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TRvFD+QQrqv4qkKsU1tnOxj/LL79jy+2CLWUHYLzE66z7B4k/vuADyDecmCFGbFX/
	 sKpUDyqCaWBSrIzmEK1UC2fL53frO2U+EjwIqLEZ++hoessj6MyX8jEUdHvaznrM6u
	 zQSofYE5euTJeav/lLsPDf9cc7w0m45HXZN47XRY=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] curl: enable libpsl in target builds
Date: Thu, 23 Jul 2026 14:55:13 +0100
Message-ID: <20260723135515.1297700-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723135515.1297700-1-ross.burton@arm.com>
References: <20260723135515.1297700-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 13:55:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241845

The Public Suffix List[1] is a list of domains that people can register
domains under, for example ".com" or ".co.uk".  This is useful because
it means browsers and other HTTP using tools can prevent malicious
web sites from setting privacy-damaging "supercookies".

In the interest of being more secure out of the box, enable libpsl in
target builds of curl.

[1] https://publicsuffix.org

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/curl/curl_8.21.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_8.21.0.bb b/meta/recipes-supp=
ort/curl/curl_8.21.0.bb
index 399b915dee8..e8c024d18a7 100644
--- a/meta/recipes-support/curl/curl_8.21.0.bb
+++ b/meta/recipes-support/curl/curl_8.21.0.bb
@@ -29,7 +29,7 @@ CVE_STATUS[CVE-2024-32928] =3D "ignored: CURLOPT_SSL_VE=
RIFYPEER was disabled on go
 inherit autotools pkgconfig binconfig multilib_header ptest
=20
 COMMON_PACKAGECONFIG =3D "basic-auth bearer-auth digest-auth ipfs negoti=
ate-auth openssl proxy threaded-resolver verbose zlib"
-PACKAGECONFIG ??=3D "${COMMON_PACKAGECONFIG} ${@bb.utils.filter('DISTRO_=
FEATURES', 'ipv6', d)} aws libidn"
+PACKAGECONFIG ??=3D "${COMMON_PACKAGECONFIG} ${@bb.utils.filter('DISTRO_=
FEATURES', 'ipv6', d)} aws libidn libpsl"
 PACKAGECONFIG:class-native =3D "${COMMON_PACKAGECONFIG} ipv6"
 PACKAGECONFIG:class-nativesdk =3D "${COMMON_PACKAGECONFIG} ipv6"
=20
--=20
2.43.0



Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B42FFC531CA
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 13:55:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24080.1784814921792873692
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 06:55:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=OgNJ+q7L;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 168811477
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 06:55:17 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DAA323F66F
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 06:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784814921; bh=JOnzQ5ILlsnMmCislkMqXgItB/oa73Qkq6z4Z29ETUI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OgNJ+q7Lk78OIqTCvB93XjcMVsQTjUu/Qb3iHqebO3W5Ox1XQlCHk5GO3MHOQtoqJ
	 /o3UolGa+FArZ9FOudjzwMppe776Qc6JjherA8afY9akkArfGX5azHVE1Oh5pZybYV
	 n5T9KCKWejoVZ0EihOoWbWpnYabMxqSt1IOXo3Oc=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] wget: enable libpsl in target builds
Date: Thu, 23 Jul 2026 14:55:14 +0100
Message-ID: <20260723135515.1297700-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723135515.1297700-1-ross.burton@arm.com>
References: <20260723135515.1297700-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 13:55:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241846

The Public Suffix List[1] is a list of domains that people can register
domains under, for example ".com" or ".co.uk".  This is useful because
it means browsers and other HTTP using tools can prevent malicious
web sites from setting privacy-damaging "supercookies".

In the interest of being more secure out of the box, enable libpsl in
builds of wget (note that we never build wget-native, as it is provided
by the host).

[1] https://publicsuffix.org

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/wget/wget_1.25.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/wget/wget_1.25.0.bb b/meta/recipes-ext=
ended/wget/wget_1.25.0.bb
index 10b2bc19a5d..1d202df9f42 100644
--- a/meta/recipes-extended/wget/wget_1.25.0.bb
+++ b/meta/recipes-extended/wget/wget_1.25.0.bb
@@ -25,7 +25,7 @@ EXTRA_OECONF =3D "--without-libgnutls-prefix --without-=
libssl-prefix \
 EXTRA_OEMAKE +=3D 'TOOLCHAIN_OPTIONS=3D"${TOOLCHAIN_OPTIONS}" \
                  DEBUG_PREFIX_MAP=3D"${DEBUG_PREFIX_MAP}"'
=20
-PACKAGECONFIG ??=3D "gnutls pcre2 zlib \
+PACKAGECONFIG ??=3D "gnutls pcre2 zlib libpsl \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ares] =3D "--with-cares,--without-cares,c-ares"
 PACKAGECONFIG[gnutls] =3D "--with-ssl=3Dgnutls,,gnutls"
--=20
2.43.0



Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B4E5C531FA
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 08:06:36 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14634.1784880393387239311
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 01:06:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Vbxc0MVT;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 26EE81A11E0
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 08:06:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F0C2F60395
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 08:06:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1A91811C11B02;
	Fri, 24 Jul 2026 10:06:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784880390; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=llr4F1HWmnLHHHH3vJCD/qS4UufpPgMhLtQCccAfhcA=;
	b=Vbxc0MVTNdwk0Od3z6T1u29+oAHUCgeGKUIy3qLtM9P6Qyhdipkrs4kvKIs1XtD5zqeXcp
	Lef8WaTkUkysAutWxtQo/0xnmqI6iR7b5JoJPl0jKvrFZQvUXLiVg4FOrrI/IFSy7rw619
	zKiS3yJz3yetExxmenFOL81bK41hxMYzfZdOgTB5FKYdbKDTyiB4tEG5btJJE92T4OGaWa
	24IHsrDotz1kKI2+ocmHXYwPEl1jfc0KUmRQPxcNdvAxAi9AJlSlOUzNYMN1whxHq6R2Dw
	DgvqONPG0vtX5yxDdol+zEFxMl6vFsEnOdB/Cj7zlqR2tYEiLthwJv1sx3+S1w==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [scarthgap][PATCH] curl: add annotation for CVE-2026-10536
Date: Fri, 24 Jul 2026 10:06:24 +0200
Message-ID: <20260724080624.700264-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 08:06:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241907

This CVE is detailed here: https://curl.se/docs/CVE-2026-10536.html

and the fix essentially consolidates the fact that HTTP2 stream
dependency is deprecated.

While oe-core provides a PACKAGECONFIG to enable HTTP2, it is not
actually used so the affected part of the code is not compiled. For
instance, in the do_configure logs:

"""
(...)
HTTP2: no (--with-nghttp2, --with-hyper)
(...)
"""

Ignore this CVE unless 'nghttp2' is enabled.

Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.co=
sta@bootlin.com>
---
 meta/recipes-support/curl/curl_8.7.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-suppo=
rt/curl/curl_8.7.1.bb
index 276526f01e..3e48c58fa7 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -53,6 +53,7 @@ CVE_STATUS[CVE-2024-32928] =3D "ignored: CURLOPT_SSL_VE=
RIFYPEER was disabled on go
 CVE_STATUS[CVE-2025-0725] =3D "not-applicable-config: gzip decompression=
 of content-encoded HTTP responses with the `CURLOPT_ACCEPT_ENCODING` opt=
ion, using zlib 1.2.0.3 or older"
 CVE_STATUS[CVE-2025-5025] =3D "${@bb.utils.contains('PACKAGECONFIG', 'op=
enssl', 'not-applicable-config: applicable only with wolfssl','unpatched'=
,d)}"
 CVE_STATUS[CVE-2025-10966] =3D "${@bb.utils.contains('PACKAGECONFIG', 'o=
penssl', 'not-applicable-config: applicable only with wolfssl','unpatched=
',d)}"
+CVE_STATUS[CVE-2026-10536] =3D "${@bb.utils.contains('PACKAGECONFIG', 'n=
ghttp2', 'unpatched', 'not-applicable-config: applicable only with HTTP/2=
', d)}"
=20
=20
 inherit autotools pkgconfig binconfig multilib_header ptest
--=20
2.47.0



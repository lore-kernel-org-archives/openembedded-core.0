Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2AE6C531F9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 08:18:56 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14909.1784881135097925614
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 01:18:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=STXI3PQ4;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D66BC4E40F1D
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 08:18:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AC76760395
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 08:18:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D120B11C11053;
	Fri, 24 Jul 2026 10:18:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784881132; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=zpfFvVkveqw7x0zcyEAYrz6l5odsDdYmhYOld9Wmybw=;
	b=STXI3PQ4/38vPUi5EtYUDMkGWwG4r9r4/Ed2h+OtJF/hEIVCay9UIYYmJAAlChIzpT1Svl
	nBBPMeMl1SmTyIAP5ScXseBdlpUwEaO2ohqKxH96FlqOPsuBO5E/p26kyE2BtEQIqvaY2N
	Sj2g8a0fJKUUKrFHCVVu1I39g0ZCispNh795CpyrGMA99rD1suNYBOI7I7xVCYNpZ8CK38
	+P7UzV48NLeCY6Kf/qd+J0RmfrMJqa0oJIIyfGGsFEtNX8ql5As05BxbSCHczJm/9RuHN8
	ZpQT/HSkIR1XSsZ3HzjFHVffNNEHKw1GzB30amVGRvxUXoGqyt+qUYQ8A8IHkA==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [wrynose][PATCH] curl: add annotation for CVE-2026-10536
Date: Fri, 24 Jul 2026 10:18:35 +0200
Message-ID: <20260724081835.704523-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 08:18:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241908

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
 meta/recipes-support/curl/curl_8.19.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-supp=
ort/curl/curl_8.19.0.bb
index 3326f478b5..06708eef2b 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -28,6 +28,7 @@ SRC_URI[sha256sum] =3D "4eb41489790d19e190d7ac7e18e8285=
7cdd68af8f4e66b292ced562d33
 # Curl has used many names over the years...
 CVE_PRODUCT =3D "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:l=
ibcurl daniel_stenberg:curl"
 CVE_STATUS[CVE-2024-32928] =3D "ignored: CURLOPT_SSL_VERIFYPEER was disa=
bled on google cloud services causing a potential man in the middle attac=
k"
+CVE_STATUS[CVE-2026-10536] =3D "${@bb.utils.contains('PACKAGECONFIG', 'n=
ghttp2', 'unpatched', 'not-applicable-config: applicable only with HTTP/2=
', d)}"
=20
 inherit autotools pkgconfig binconfig multilib_header ptest
=20
--=20
2.47.0



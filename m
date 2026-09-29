Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80234CA5FA5
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 13:28:18 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7782.1790688494743901694
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 06:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=KKqziBsz;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 59E841A1050;
	Tue, 29 Sep 2026 13:28:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2DA84601BD;
	Tue, 29 Sep 2026 13:28:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1DF1F10328845;
	Tue, 29 Sep 2026 15:28:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790688491; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=/bQH/JIOjXQzzDly3TeeV0y3mWSJKZUZKkl3ZMrjsxE=;
	b=KKqziBszacB7sx8P3j52eHixZpYoZBJYzn/SQkEzYX+Ju/EHyLQ3EI21Im/D9plVGi/5YJ
	PalSLPavbwjrRBNz/kNroGtlmxkCvaI+x/K1z9FLTGHyKyn+vwT+8+5Aim7HJ3IsjUjEZe
	DZSNADDVVomsJ275pkEQdBjAL46pWawb3bFmGAzwbD357pO/9vETre7NH/qnbAcGO/HXif
	g0xrYGLWVF+jvxcjPP6kgl7Xq1PDwgvtB381m5LObt8q50liYYChETsDK+C/IPWCN772M+
	OZZaum2AW3xSve8GuobTrKpePngWV0n/k5diSSQe7FQcjStLdAuqJQgF4+7VTg==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	deeratho@cisco.com,
	yoann.congal@smile.fr,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
Subject: [scarthgap][PATCH] curl: set CVE_STATUS for CVE-2026-9547
Date: Tue, 29 Sep 2026 15:28:04 +0200
Message-ID: <20260929132804.1795602-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 13:28:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246868

From: Deepak Rathore <deeratho@cisco.com>

Analysis:
- CVE-2026-9547 is tied to the libssh backend. [1]
- Wrynose curl 8.19.0 does not enable or expose the libssh
  backend in the recipe. [2]
- Hence mark this CVE as not-applicable-config for the default
  Wrynose recipe configuration.

Reference:
[1] https://curl.se/docs/CVE-2026-9547.html
[2] https://git.openembedded.org/openembedded-core/tree/meta/recipes-supp=
ort/curl/curl_8.19.0.bb?h=3Dwrynose

This is a backport of the change below, from wrynose branch:
"e32fc16287f0: curl: set CVE_STATUS for CVE-2026-9547"

Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.co=
sta@bootlin.com>
---
 meta/recipes-support/curl/curl_8.7.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-suppo=
rt/curl/curl_8.7.1.bb
index ade637adf3..c6665f8f6b 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -60,6 +60,7 @@ CVE_STATUS[CVE-2025-10966] =3D "${@bb.utils.contains('P=
ACKAGECONFIG', 'openssl', '
 CVE_STATUS[CVE-2026-10536] =3D "${@bb.utils.contains('PACKAGECONFIG', 'n=
ghttp2', 'unpatched', 'not-applicable-config: applicable only with HTTP/2=
', d)}"
 CVE_STATUS[CVE-2026-8458] =3D "${@bb.utils.contains('PACKAGECONFIG', 'kr=
b5 negotiate-auth', 'unpatched', 'not-applicable-config: applicable only =
with GSS-API-backed Negotiate authentication', d)}"
 CVE_STATUS[CVE-2026-82209] =3D "not-applicable-config: public suffix lis=
t support is disabled by the recipe with --without-libpsl"
+CVE_STATUS[CVE-2026-9547] =3D "not-applicable-config: vulnerable libssh =
backend is not enabled by the recipe"
=20
 inherit autotools pkgconfig binconfig multilib_header ptest
=20
--=20
2.55.0



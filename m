Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7293.1793976108530186685
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 06:41:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=vixx7CDv;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C65E84E4145C
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 14:41:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 96C875FFBC;
	Fri,  6 Nov 2026 14:41:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 76D06103292BC;
	Fri,  6 Nov 2026 15:41:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793976105; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eNa4x2GHDQB6a2LJil2C+3+O+y0dOB8Zn3yIj/pN4ZE=;
	b=vixx7CDviPE8g3RUGuIDF3K310AVTfAJLrwKcZtKv4fgWx7hCSJcd/myD+JSxSavRpYUzR
	5+g3nBIcn6ykLawBPWMLUgOXPaksd/P2B3ymdSlmGyauaKRY2Z4BxHAZw5qgfr9OHEDuMJ
	v02veepVSSPuKPP0x003kdp5C3HKC55VYFmV7F8JFZ8NFymP92eOaoppCDEQ7V20cT/R/E
	9sF0vYzcy/izninuYbHCQzpkVMVJhlwZCFTCTqJF+lFBvxNfUrJBCubm16JB3N5HGJjE2f
	XHfKDL1SgMtflpzOMPIY2tz0BoflkpNXajkxwFMC2cX8FKpE0L2PMxCFkMzKpg==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	yoann.congal@smile.fr,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
Subject: [scarthgap][PATCH 1/7] curl: fix CVE-2026-86409
Date: Fri,  6 Nov 2026 15:41:28 +0100
Message-ID: <20261106144134.1370928-2-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261106144134.1370928-1-joaomarcos.costa@bootlin.com>
References: <20261106144134.1370928-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249656

This vulnerability, marked as High [1], was fixed upstream [2] since
v8.22.0.

Backport the fix to curl v8.7.1.

The only changes not included in the backport are the ones related to
test1978, which is not available in v8.7.1.

[1] https://nvd.nist.gov/vuln/detail/cve-2026-86409
[2] https://curl.se/docs/CVE-2026-86409.html

Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.co=
sta@bootlin.com>
---
 .../curl/curl/CVE-2026-86409.patch            | 36 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-86409.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-86409.patch b/meta/r=
ecipes-support/curl/curl/CVE-2026-86409.patch
new file mode 100644
index 0000000000..55a4def13b
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-86409.patch
@@ -0,0 +1,36 @@
+From 0d375942119d6a8fe6a4c6874a2f1f05d3312ad0 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Jo=3DC3=3DA3o=3D20Marcos=3D20Costa?=3D <joaomarcos.cos=
ta@bootlin.com>
+Date: Thu, 5 Nov 2026 17:55:56 +0100
+Subject: [PATCH] setopt: make NULL CURLOPT_AWS_SIGV4 disable aws-sigv4 a=
uth
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Disable `CURLAUTH_AWS_SIGV4` when `CURLOPT_AWS_SIGV4` is set to NULL.
+Syncing behavior with `CURLAUTH_HTTPSIG`.
+
+Reported-by: Stanislav Fort
+
+Closes #22681
+
+CVE: CVE-2026-86409
+Upstream-Status: Backport [https://github.com/curl/curl/commit/c3c70440e=
8d9938c0bb732595751e8aebc614f24]
+
+Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
+---
+ lib/setopt.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/setopt.c b/lib/setopt.c
+index 8a5a5d7c33..bcf41807e7 100644
+--- a/lib/setopt.c
++++ b/lib/setopt.c
+@@ -693,6 +693,8 @@ CURLcode Curl_vsetopt(struct Curl_easy *data, CURLop=
tion option, va_list param)
+      */
+     if(data->set.str[STRING_AWS_SIGV4])
+       data->set.httpauth =3D CURLAUTH_AWS_SIGV4;
++    else
++      data->set.httpauth &=3D ~(uint32_t)CURLAUTH_AWS_SIGV4;
+     break;
+ #endif
+=20
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-suppo=
rt/curl/curl_8.7.1.bb
index ab33d4aa77..18123ece3c 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -43,6 +43,7 @@ SRC_URI =3D "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-13608.patch \
            file://CVE-2026-8286.patch \
            file://CVE-2026-80230.patch \
+           file://CVE-2026-86409.patch \
            "
=20
 SRC_URI:append:class-nativesdk =3D " \
--=20
2.55.0


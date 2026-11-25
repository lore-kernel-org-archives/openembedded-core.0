Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41719.1795613248137846868
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 05:27:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=EaoSaQ9B;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 54E80C69149;
	Wed, 25 Nov 2026 13:27:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7584160480;
	Wed, 25 Nov 2026 13:27:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8102711E6956F;
	Wed, 25 Nov 2026 14:27:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795613242; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=s2BsdC53q95B8chYcN8nrivJtbamciqGNDKbsIRDhn4=;
	b=EaoSaQ9B3Lv2oPDBT9qOsCTxI/eQkvDdX5yWvxgWGJ87yAurhTQ5moCtDKYS4JfzTSl/ME
	ikGhaYy8Jdbr7HGhCS0yOiCll1AJDT1MEXsNqcz8ey741p7wDMfS1oiotlRCmBj7k1dFLI
	z1k+QQTeUHWQOgCnoz7e0JHok/1ra0sD9SaXg8O+AGTnEw6PQfFtMNLD9ESJjxATAgse5D
	MOF+PxafbryT61NiJQKVQ5PkKGQsGG9r+SsslkyBngn5m8nJi0utJKsS6g5TeyT7nSANyC
	MbbX0P5oKhvPCPfe7ZF3WRwc2pzZd8ZaaAjm+IafXICoRuIzyPFjhLvvDZbMVA==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	yoann.congal@smile.fr,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
Subject: [blacksail][PATCH v2 2/4] curl: fix CVE-2026-92386
Date: Wed, 25 Nov 2026 14:26:17 +0100
Message-ID: <20261125132619.3518022-3-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261125132619.3518022-1-joaomarcos.costa@bootlin.com>
References: <20261125132619.3518022-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 13:27:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251185

This vulnerability, marked as High [1], was fixed upstream [2] since
v8.23.0.

Backport the fix to curl v8.22.0.

[1] https://nvd.nist.gov/vuln/detail/cve-2026-92386
[2] https://curl.se/docs/CVE-2026-92386.html

Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.co=
sta@bootlin.com>
---
 .../curl/curl/CVE-2026-92386.patch            | 33 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.22.0.bb      |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92386.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-92386.patch b/meta/r=
ecipes-support/curl/curl/CVE-2026-92386.patch
new file mode 100644
index 0000000000..3e8f249b69
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-92386.patch
@@ -0,0 +1,33 @@
+From 58eac7dbcf37290774f48b3464266dcc080fd700 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 16 Sep 2026 11:09:18 +0200
+Subject: [PATCH] cookie: accept slightly longer lines in cookie jars
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Closes #22964
+
+CVE: CVE-2026-92386
+Upstream-Status: Backport [https://github.com/curl/curl/commit/445aa87e1=
3f91c94bc742f54343a2eac924e1765]
+
+Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
+---
+ lib/cookie.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/lib/cookie.c b/lib/cookie.c
+index 3255668ec7..12aae672dc 100644
+--- a/lib/cookie.c
++++ b/lib/cookie.c
+@@ -1181,7 +1181,9 @@ static CURLcode cookie_load(struct Curl_easy *data=
, const char *file,
+   if(fp) {
+     struct dynbuf buf;
+     bool eof =3D FALSE;
+-    curlx_dyn_init(&buf, MAX_COOKIE_LINE);
++    /* accept a little longer lines so that a full cookie fits and does=
 not
++       abort the file read */
++    curlx_dyn_init(&buf, MAX_COOKIE_LINE + 48);
+     do {
+       result =3D Curl_get_line(&buf, fp, &eof);
+       if(!result) {
diff --git a/meta/recipes-support/curl/curl_8.22.0.bb b/meta/recipes-supp=
ort/curl/curl_8.22.0.bb
index 979e416249..4c6a088e62 100644
--- a/meta/recipes-support/curl/curl_8.22.0.bb
+++ b/meta/recipes-support/curl/curl_8.22.0.bb
@@ -18,6 +18,7 @@ SRC_URI =3D " \
     file://CVE-2026-92388-2.patch \
     file://CVE-2026-92389.patch \
     file://CVE-2026-87865.patch \
+    file://CVE-2026-92386.patch \
 "
=20
 SRC_URI:append:class-nativesdk =3D " \
--=20
2.55.0


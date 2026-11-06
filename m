Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7468.1793976111975781542
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 06:41:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Qp0QvGKY;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 21D694E4145C
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 14:41:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E3EB75FFBC;
	Fri,  6 Nov 2026 14:41:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D95BE103292BC;
	Fri,  6 Nov 2026 15:41:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793976109; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PJ38XVN28VUaFmVL8m2KIaYbz7qh4tRT8k7gdSFtgxA=;
	b=Qp0QvGKYpzbIjNBKKNGNQEQ1NRvH5sN5cWWLrdojVU9flqr68ozFbNSqoHkPHA6dbbEhBI
	vAx4MdFQQ1UW3dNmciuAOBmBerifB+f0HBvYeM9PmGRVxzasY8vSiunBBey/prUlLDKt3/
	oqBHATZ6KlzSso/9V9INj6eom6KUWypIkry113lUyy+7Rn3Z/b8XhjSquS+VwG9pY7dpsz
	XBiHVBtfm2bcUJbaGMK7cIXMc7bTJxjfSIKXEO1ky7YBZEzrOQQ0HaHxlVxtRcV+/WeRKQ
	GXgq8KNJMsQsR6cMoRKf96xAf4sIpISDLrAtSgvlvvw9xUYOt6Unip4FChv9jQ==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	yoann.congal@smile.fr,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
Subject: [scarthgap][PATCH 4/7] curl: fix CVE-2026-92386
Date: Fri,  6 Nov 2026 15:41:31 +0100
Message-ID: <20261106144134.1370928-5-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261106144134.1370928-1-joaomarcos.costa@bootlin.com>
References: <20261106144134.1370928-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:41:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249659

This vulnerability, marked as High [1], was fixed upstream [2] since
v8.23.0.

Backport the fix to curl v8.7.1.

[1] https://nvd.nist.gov/vuln/detail/cve-2026-92386
[2] https://curl.se/docs/CVE-2026-92386.html

Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.co=
sta@bootlin.com>
---
 .../curl/curl/CVE-2026-92386.patch            | 32 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92386.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-92386.patch b/meta/r=
ecipes-support/curl/curl/CVE-2026-92386.patch
new file mode 100644
index 0000000000..9ad6044d8c
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-92386.patch
@@ -0,0 +1,32 @@
+From a83871b1853ec4fcb514d10d24378b57135b5169 Mon Sep 17 00:00:00 2001
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
+Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
+---
+ lib/cookie.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/lib/cookie.c b/lib/cookie.c
+index 67494d2855..7f7cd741c9 100644
+--- a/lib/cookie.c
++++ b/lib/cookie.c
+@@ -1244,7 +1244,9 @@ struct CookieInfo *Curl_cookie_init(struct Curl_ea=
sy *data,
+     c->running =3D FALSE; /* this is not running, this is init */
+     if(fp) {
+       struct dynbuf buf;
+-      Curl_dyn_init(&buf, MAX_COOKIE_LINE);
++      /* accept a little longer lines so that a full cookie fits and do=
es not
++         abort the file read */
++      Curl_dyn_init(&buf, MAX_COOKIE_LINE + 48);
+       while(Curl_get_line(&buf, fp)) {
+         char *lineptr =3D Curl_dyn_ptr(&buf);
+         bool headerline =3D FALSE;
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-suppo=
rt/curl/curl_8.7.1.bb
index 40de36e151..12db6c0c24 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -46,6 +46,7 @@ SRC_URI =3D "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-86409.patch \
            file://CVE-2026-87864.patch \
            file://CVE-2026-87865.patch \
+           file://CVE-2026-92386.patch \
            "
=20
 SRC_URI:append:class-nativesdk =3D " \
--=20
2.55.0


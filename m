Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7466.1793976110152604853
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 06:41:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=XFYvWXB0;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 35D5A4E4145B
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 14:41:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0C0635FFBC;
	Fri,  6 Nov 2026 14:41:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EDAAC103288D3;
	Fri,  6 Nov 2026 15:41:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793976107; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NOjiPoXQ9xpq12AtAKluSyqQcRi7cAy52Ihgn1hq9Mk=;
	b=XFYvWXB0RcOzSh7iBJ2WTgfeU3ew3aAiQcwZ0vDKxRBOTFue7LCHFNSPlRuvKb2U9uvtBY
	UfAcVoEQup6FTrb0WCsRFEqFaIuuqtSKzLZ5v/8hAKeZsyP+gpsUK8wZzGnlg0Qa1jmvaZ
	Jid+5Khe3/Cx+ujSc8j0jzhnOk7ejg9tG/eeMVfDdA8Y0lQo+2N6sOHxLypgSB1rG5GDWc
	DK9HrOOzxJSUw2BPnedkJT94VWheKaDq+MbDvElNwULWoHVyAdh+YVMoA9Ri4hIhqjracS
	UWFr5nivPKPztZt7xm3haDLlioRQIODHkCL/IosdQPKSvMOJGMIAro9iOPhpYA==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	yoann.congal@smile.fr,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
Subject: [scarthgap][PATCH 2/7] curl: fix CVE-2026-87864
Date: Fri,  6 Nov 2026 15:41:29 +0100
Message-ID: <20261106144134.1370928-3-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261106144134.1370928-1-joaomarcos.costa@bootlin.com>
References: <20261106144134.1370928-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:41:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249657

This vulnerability, marked as High [1], was fixed upstream [2] since
v8.22.0.

Backport the fix to curl v8.7.1.

[1] https://nvd.nist.gov/vuln/detail/cve-2026-87864
[2] https://curl.se/docs/CVE-2026-87864.html

Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.co=
sta@bootlin.com>
---
 .../curl/curl/CVE-2026-87864.patch            | 55 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-87864.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-87864.patch b/meta/r=
ecipes-support/curl/curl/CVE-2026-87864.patch
new file mode 100644
index 0000000000..a8b7e887e8
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-87864.patch
@@ -0,0 +1,55 @@
+From af73dab33be1161ed09aa20247e26d344a12f4d8 Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Thu, 27 Aug 2026 09:47:53 +0200
+Subject: [PATCH] imap: APPEND CRLF fix
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Deny an APPEND operation with CRLF conversion requested as we are unable
+to predict the final upload size and APPEND requires us to announce it
+before starting the upload.
+
+The check for unknown sizes had already been there, but the crlf
+conversion that renders a known size unknown was not accounted for.
+
+Closes #22702
+
+CVE: CVE-2026-87864
+Upstream-Status: Backport [https://github.com/curl/curl/commit/3b547de30=
1342b347fb3c6ea6ae7979070793a66]
+
+Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
+---
+ lib/imap.c | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/lib/imap.c b/lib/imap.c
+index 0e013e740a..6e4194b0cf 100644
+--- a/lib/imap.c
++++ b/lib/imap.c
+@@ -790,7 +790,6 @@ static CURLcode imap_perform_append(struct Curl_easy=
 *data)
+       result =3D Curl_creader_set_mime(data, &data->set.mimepost);
+     if(result)
+       return result;
+-    data->state.infilesize =3D Curl_creader_client_length(data);
+   }
+   else
+ #endif
+@@ -800,9 +799,15 @@ static CURLcode imap_perform_append(struct Curl_eas=
y *data)
+       return result;
+   }
+=20
+-  /* Check we know the size of the upload */
++  /* Check we know the size of the upload. This takes all readers
++   * into account. Especially crlf conversions which make the size
++   * unpredictable, e.g. -1. */
++  data->state.infilesize =3D Curl_creader_total_length(data);
+   if(data->state.infilesize < 0) {
+-    failf(data, "Cannot APPEND with unknown input file size");
++    if(data->set.crlf)
++      failf(data, "Cannot APPEND with CRLF conversion making size unkno=
wn");
++    else
++      failf(data, "Cannot APPEND with unknown input file size");
+     return CURLE_UPLOAD_FAILED;
+   }
+=20
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-suppo=
rt/curl/curl_8.7.1.bb
index 18123ece3c..9ca79a14fc 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -44,6 +44,7 @@ SRC_URI =3D "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-8286.patch \
            file://CVE-2026-80230.patch \
            file://CVE-2026-86409.patch \
+           file://CVE-2026-87864.patch \
            "
=20
 SRC_URI:append:class-nativesdk =3D " \
--=20
2.55.0


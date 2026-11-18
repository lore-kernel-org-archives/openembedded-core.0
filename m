Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9761.1794998011648263826
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 02:33:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=chggbEUj;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 982414E41626
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 10:33:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6DB0B5FE9B;
	Wed, 18 Nov 2026 10:33:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D6C2511BC1048;
	Wed, 18 Nov 2026 11:33:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794998008; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5ZEtMy2oYOC/DXu+KbQWsMkX9rPuES84HC6421hp44s=;
	b=chggbEUjZxyi9MIMEXgBaZe1VED6YO6bY/yvjzHuL8gto8jjRSldi8ZLlkA1tbR6QNY1YP
	9uVndP/zr8ewJpOkbLu+j50LTIOowYdg7NcAvK9VS3KfKFCWrO9fUos+4Uh3pEv2wOhuMK
	sAZuHSBvllXyodjk3AKnNMPFgOVRH9KWSWciuFM1qh48sNSNorEp9Fw5Jzk4ypMT0W3gQK
	FmA/VrUuUFL7O4R8YFLf3W/WmuHCwuf7fQUFr872Y/OeAwOYNFWU5KaZ5oid4eOzi2s+x1
	WoRSiyAK6SGK3B0w11UVkXmDCys0yG+eKkFmb8MeWpTQXhJHInTdRxO10lHEHQ==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	yoann.congal@smile.fr,
	bastien.jauny@smile.fr,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
Subject: [blacksail][PATCH 2/2] expat: fix CVE-2026-117610
Date: Wed, 18 Nov 2026 11:30:42 +0100
Message-ID: <20261118103042.1825679-3-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261118103042.1825679-1-joaomarcos.costa@bootlin.com>
References: <20261118103042.1825679-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 10:33:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250536

This vulnerability, marked as High [1], was fixed upstream [2] since
2.10.0.

Backport the fix to expat v2.8.3.

This backport is actually partial. PR#1444 adds a second commit providing=
 a
new test case, but the code uses helper functions not yet
defined/available. A few other commits would also need to be backported s=
o
that the test compiles at v2.8.3.

[1] https://nvd.nist.gov/vuln/detail/cve-2026-117610
[2] https://github.com/libexpat/libexpat/pull/1444

Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.co=
sta@bootlin.com>
---
 .../expat/expat/CVE-2026-117610.patch         | 30 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.8.5.bb        |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-117610.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-117610.patch b/meta/r=
ecipes-core/expat/expat/CVE-2026-117610.patch
new file mode 100644
index 0000000000..5843b4ac85
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-117610.patch
@@ -0,0 +1,30 @@
+From 731159c29d2df0f98ba3a4c61e4bf5d0075acb63 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Mon, 26 Oct 2026 17:39:32 +0100
+Subject: [PATCH] lib: Fix initial non-final empty subparser call with a
+ handler
+
+CVE: CVE-2026-117610
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/144=
4/commits/bfc28346fa3efeb8ca56c17437d24a7344e5feab]
+Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
+
+---
+ lib/xmlparse.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index cb8839be..75c3a806 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -3227,6 +3227,11 @@ externalEntityInitProcessor2(XML_Parser parser, c=
onst char *start,
+     }
+     parser->m_eventPtr =3D start;
+     return XML_ERROR_PARTIAL_CHAR;
++  case XML_TOK_NONE:
++    if (! parser->m_parsingStatus.finalBuffer) {
++      *endPtr =3D start;
++    }
++    return XML_ERROR_NONE;
+   }
+   parser->m_processor =3D externalEntityInitProcessor3;
+   return externalEntityInitProcessor3(parser, start, end, endPtr);
diff --git a/meta/recipes-core/expat/expat_2.8.5.bb b/meta/recipes-core/e=
xpat/expat_2.8.5.bb
index cca713d95f..2ee4a78afc 100644
--- a/meta/recipes-core/expat/expat_2.8.5.bb
+++ b/meta/recipes-core/expat/expat_2.8.5.bb
@@ -14,6 +14,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/R_${VERSION_TA=
G}/expat-${PV}.tar.bz2  \
            file://CVE-2026-77214.patch \
            file://CVE-2026-118370-01.patch \
            file://CVE-2026-118370-02.patch \
+           file://CVE-2026-117610.patch \
            "
=20
 GITHUB_BASE_URI =3D "https://github.com/libexpat/libexpat/releases/"
--=20
2.55.0


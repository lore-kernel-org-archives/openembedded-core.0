Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10162.1793802329361244966
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 06:25:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=m+RnFIjw;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2F6234E41404
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Nov 2026 14:25:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F0D1B60770
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Nov 2026 14:25:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1ACA7103291FD;
	Wed,  4 Nov 2026 15:25:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793802322; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=M1G9PK793qpXyBqE0PUduKCafqTPjv0tNvBL90609mY=;
	b=m+RnFIjw4gBjRhffVRgazSSZ4nPNSWF+4qKhNzVq3npq6hqYnqAUwNvDqfTdKAnKALXnUN
	DwM2Ngt/Swsv2janGCE5COrgKZz58K74YOyxtEJMl6dcV3fbCPRS2hQqtdxpczlZgslTUQ
	5eRLp5osvm9mnT5F4uR12uQmPrJYLaj2GftLEtTdadrnnHPRULm4S4wX2d49XJwpG3Q1L8
	TxiQD7AXHRC1+7UKpKl7ekI5RP5Da5xmkwoRL9RRUfCSheZ4O6dvQMNzJsqkxWRwfaRwCa
	p49iO3j8VMr2vHrDkqPrwyyfvshv3xMV0yKwYzBxWbtOeAzDoANkinKhIYvw6g==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
Subject: [scarthgap][PATCH] expat: fix CVE-2026-117610
Date: Wed,  4 Nov 2026 15:25:12 +0100
Message-ID: <20261104142512.1562219-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 14:25:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249383

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
 meta/recipes-core/expat/expat_2.8.3.bb        |  1 +
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
diff --git a/meta/recipes-core/expat/expat_2.8.3.bb b/meta/recipes-core/e=
xpat/expat_2.8.3.bb
index 6d08a3fd94..1e7e4e0e5d 100644
--- a/meta/recipes-core/expat/expat_2.8.3.bb
+++ b/meta/recipes-core/expat/expat_2.8.3.bb
@@ -18,6 +18,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/R_${VERSION_TA=
G}/expat-${PV}.tar.bz2  \
            file://CVE-2026-76957-02.patch \
            file://CVE-2026-93990-01.patch \
            file://CVE-2026-93990-02.patch \
+           file://CVE-2026-117610.patch \
            "
=20
 GITHUB_BASE_URI =3D "https://github.com/libexpat/libexpat/releases/"
--=20
2.55.0


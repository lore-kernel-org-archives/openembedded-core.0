Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9606.1793800635749513131
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 05:57:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=aYqNYZas;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 085F84E413FD
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Nov 2026 13:57:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CA90860770
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Nov 2026 13:57:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B6D6B103291D1;
	Wed,  4 Nov 2026 14:57:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793800629; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=gZA0lPHtrD+yD9IQteliVOh7zLQWW2x+vBKQZotzM+c=;
	b=aYqNYZase7obd84no99ftWSehkVqDafTE2pZctOglfi+tLGLrnStswbB7DaiTwI5foxMHQ
	qrOCIG86QfBiFNJLtR3tybGAhKCi5hEb2QDXSzGKIvV+e+LkUaz7acDHKn+yjI4vu7+FKg
	5uvigjNoPIMfrmim1DqmOzuPJGcJ8msIoJB/09ZRURTpfyFHQm9c+e6+jwtpsbB4l8xTPV
	op02UiBaEclyx7RBfZE22K2DD3/EBhcbOYZ0i6+C8K61Sri8bMHAtftRT8LPKJWKkcVWTU
	Ueay2sOeeHLHE05Uu/XJcmCGkx7B7ht/kwsWT8YPjFvfstqCqQZx5XiZX6awqQ==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
Subject: [scarthgap][PATCH] expat: fix CVE-2026-118370
Date: Wed,  4 Nov 2026 14:56:56 +0100
Message-ID: <20261104135656.1546935-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 13:57:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249381

From: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.costa@bootl=
in.com>

This vulnerability, marked as High [1], was fixed upstream [2] since
2.10.0.

Backport the fix to expat v2.8.3.

[1] https://nvd.nist.gov/vuln/detail/cve-2026-118370
[2] https://github.com/libexpat/libexpat/pull/1450

Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.co=
sta@bootlin.com>
---
 .../expat/expat/CVE-2026-118370-01.patch      | 58 +++++++++++++++++++
 .../expat/expat/CVE-2026-118370-02.patch      | 29 ++++++++++
 meta/recipes-core/expat/expat_2.8.3.bb        |  2 +
 3 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-118370-01.patc=
h
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-118370-02.patc=
h

diff --git a/meta/recipes-core/expat/expat/CVE-2026-118370-01.patch b/met=
a/recipes-core/expat/expat/CVE-2026-118370-01.patch
new file mode 100644
index 0000000000..aa4fe2df28
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-118370-01.patch
@@ -0,0 +1,58 @@
+From a135244f77776c56d825cd81efd8f98abe014841 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 27 Oct 2026 15:20:33 +0100
+Subject: [PATCH] lib: Protect `attIndex` in `storeAtts` from signed inte=
ger
+ overflow
+
+.. by migrating to `size_t`
+
+CVE: CVE-2026-118370
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/145=
0]
+
+Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
+---
+ lib/xmlparse.c | 15 ++++++++++-----
+ 1 file changed, 10 insertions(+), 5 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index cb8839be..dadf647a 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -3858,7 +3858,7 @@ storeAtts(XML_Parser parser, const ENCODING *enc, =
const char *attStr,
+           TAG_NAME *tagNamePtr, BINDING **bindingsPtr,
+           enum XML_Account account) {
+   DTD *const dtd =3D parser->m_dtd; /* save one level of indirection */
+-  int attIndex =3D 0;
++  size_t attIndex =3D 0;
+   XML_Char *uri;
+   int nPrefixes =3D 0;
+   BINDING *binding;
+@@ -4037,11 +4037,16 @@ storeAtts(XML_Parser parser, const ENCODING *enc=
, const char *attStr,
+   }
+=20
+   /* set-up for XML_GetSpecifiedAttributeCount and XML_GetIdAttributeIn=
dex */
+-  parser->m_nSpecifiedAtts =3D attIndex;
++  // Detect and reject integer overflow
++  if (attIndex > INT_MAX)
++    return XML_ERROR_NO_MEMORY;
++  parser->m_nSpecifiedAtts =3D (int)attIndex;
+   if (elementType->idAtt && (elementType->idAtt->name)[-1]) {
+-    for (int i =3D 0; i < attIndex; i +=3D 2)
++    for (size_t i =3D 0; i < attIndex; i +=3D 2)
+       if (appAtts[i] =3D=3D elementType->idAtt->name) {
+-        parser->m_idAttIndex =3D i;
++        if (i > INT_MAX)
++          return XML_ERROR_NO_MEMORY;
++        parser->m_idAttIndex =3D (int)i;
+         break;
+       }
+   } else
+@@ -4074,7 +4079,7 @@ storeAtts(XML_Parser parser, const ENCODING *enc, =
const char *attStr,
+=20
+   /* expand prefixed attribute names, check for duplicates,
+      and clear flags that say whether attributes were specified */
+-  int i =3D 0;
++  size_t i =3D 0;
+   if (nPrefixes) {
+     unsigned int j; /* hash table index */
+     unsigned long version =3D parser->m_nsAttsVersion;
diff --git a/meta/recipes-core/expat/expat/CVE-2026-118370-02.patch b/met=
a/recipes-core/expat/expat/CVE-2026-118370-02.patch
new file mode 100644
index 0000000000..1d8d1d4907
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-118370-02.patch
@@ -0,0 +1,29 @@
+From d39404514bc51901b1e673b88bf5ec5bc6bf657a Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 27 Oct 2026 17:57:19 +0100
+Subject: [PATCH] lib: Protect `nPrefixes` in `storeAtts` from signed int=
eger
+ overflow
+
+.. by migrating to `size_t`
+
+CVE: CVE-2026-118370
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/145=
0]
+
+Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
+---
+ lib/xmlparse.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index dadf647a..e248043e 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -3860,7 +3860,7 @@ storeAtts(XML_Parser parser, const ENCODING *enc, =
const char *attStr,
+   DTD *const dtd =3D parser->m_dtd; /* save one level of indirection */
+   size_t attIndex =3D 0;
+   XML_Char *uri;
+-  int nPrefixes =3D 0;
++  size_t nPrefixes =3D 0;
+   BINDING *binding;
+   const XML_Char *localPart;
+=20
diff --git a/meta/recipes-core/expat/expat_2.8.3.bb b/meta/recipes-core/e=
xpat/expat_2.8.3.bb
index 6d08a3fd94..ff46beae8c 100644
--- a/meta/recipes-core/expat/expat_2.8.3.bb
+++ b/meta/recipes-core/expat/expat_2.8.3.bb
@@ -18,6 +18,8 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/R_${VERSION_TA=
G}/expat-${PV}.tar.bz2  \
            file://CVE-2026-76957-02.patch \
            file://CVE-2026-93990-01.patch \
            file://CVE-2026-93990-02.patch \
+           file://CVE-2026-118370-01.patch \
+           file://CVE-2026-118370-02.patch \
            "
=20
 GITHUB_BASE_URI =3D "https://github.com/libexpat/libexpat/releases/"
--=20
2.55.0


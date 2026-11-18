Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9759.1794998009819950162
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 02:33:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=JFMrl5kU;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BF165C4CBEA
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 10:33:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 00B535FE9B;
	Wed, 18 Nov 2026 10:33:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A546A11BC1067;
	Wed, 18 Nov 2026 11:33:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794998007; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5GEfmiSJ14U60/siinrPGYW2PA2RriBZflhaFiFM+Bs=;
	b=JFMrl5kUagYi9jhWVvs7koacQEqEgkYWez1Q4tRzgAjkxIhZRVNMk0owceB656h50uIUpr
	xiVnm4HwYQr0wbzfTs7iSDoLhsjk/KFaAPK7JOtfAOWYHx575W0NtzW6Y/NhNWaS93SvI7
	FVQWUtZd6QPuNc/5wpXBBm3/smv6V5lAz06gcUKlq5jjjJOIiK/DBh07lSENZORUssWRYK
	QG8eL5hHMwdJBnWmlkJZXfR4mbm0xi2u3m+XGYX7WExUzGTKx5KgmfLMtFodq4ssuMyTwi
	ZZqDL+fXbLv1RjfHNs3Fei1LXhbctXteDiDU5NrQwfDn2h2s3mHC01w+hgWahQ==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	yoann.congal@smile.fr,
	bastien.jauny@smile.fr,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
Subject: [blacksail][PATCH 1/2] expat: fix CVE-2026-118370
Date: Wed, 18 Nov 2026 11:30:41 +0100
Message-ID: <20261118103042.1825679-2-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261118103042.1825679-1-joaomarcos.costa@bootlin.com>
References: <20261118103042.1825679-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 10:33:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250535

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
 meta/recipes-core/expat/expat_2.8.5.bb        |  2 +
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
diff --git a/meta/recipes-core/expat/expat_2.8.5.bb b/meta/recipes-core/e=
xpat/expat_2.8.5.bb
index 125d0e1f82..cca713d95f 100644
--- a/meta/recipes-core/expat/expat_2.8.5.bb
+++ b/meta/recipes-core/expat/expat_2.8.5.bb
@@ -12,6 +12,8 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/R_${VERSION_TA=
G}/expat-${PV}.tar.bz2  \
            file://run-ptest \
            file://CVE-2026-102633.patch \
            file://CVE-2026-77214.patch \
+           file://CVE-2026-118370-01.patch \
+           file://CVE-2026-118370-02.patch \
            "
=20
 GITHUB_BASE_URI =3D "https://github.com/libexpat/libexpat/releases/"
--=20
2.55.0


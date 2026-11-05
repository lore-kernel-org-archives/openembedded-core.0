Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35606.1793888329058778887
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 06:18:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Xyo7Fo4x;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C82671A094D;
	Thu,  5 Nov 2026 14:18:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 90F505FF85;
	Thu,  5 Nov 2026 14:18:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 92315103291F9;
	Thu,  5 Nov 2026 15:18:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793888326; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Y9b+JrERidHv/i6uHSmwP7mcFflQFCEPpmeC6r2GjK8=;
	b=Xyo7Fo4xP72axvxXROt5+8j/+w2eeYzu9BS8ytlIlit5vhZlzFDTnAvYGYMMX/wLQvN/0e
	v6tIsRvurD1KzDD6GoF9z7JcMKrBDTWqHV+HmlRoc2xTRh/q8fSclrHORr3TDJc875dPP6
	jQGfsuUTuViC94NquXJWJM9g85rH55aP+h/QjwaY2wvLlc7KeGifh4lxhynP1KwUNf3/bW
	pdXxkrPJC4Ed68B4tUXthOFIyT2pvgmzrMW1993OlApxsex3dQbb8atM1rtInEd09A4E0p
	FYjF/DHaNj/F9kW+zZqIRE/yYMQbD6JgXyd4xOXk3CPDrlmQQ7rS7ichANjNoQ==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	yoann.congal@smile.fr,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
Subject: [scarthgap][PATCH 1/3] sqlite3: fix CVE-2026-119373
Date: Thu,  5 Nov 2026 15:18:25 +0100
Message-ID: <20261105141827.2142719-2-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105141827.2142719-1-joaomarcos.costa@bootlin.com>
References: <20261105141827.2142719-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 14:18:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249554

This vulnerability, marked as High [1], was fixed upstream [2] since
3.54.0.

Backport the fix to sqlite v3.45.3.

[1] https://nvd.nist.gov/vuln/detail/cve-2026-119373
[2] https://github.com/sqlite/sqlite/commit/e1c9934f9f11a499029abb020ea71=
5a08970da80

Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.co=
sta@bootlin.com>
---
 .../sqlite/sqlite3/CVE-2026-119373.patch      | 48 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |  3 +-
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119373.p=
atch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119373.patch b/=
meta/recipes-support/sqlite/sqlite3/CVE-2026-119373.patch
new file mode 100644
index 0000000000..ff89746e6c
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119373.patch
@@ -0,0 +1,48 @@
+From ab37658e91b4a19923eb930a9e2ee62b561a4ec6 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Jo=3DC3=3DA3o=3D20Marcos=3D20Costa?=3D <joaomarcos.cos=
ta@bootlin.com>
+Date: Wed, 4 Nov 2026 16:38:46 +0100
+Subject: [PATCH] In fts5, account for the possibility of negative docids=
 when
+ allocating a buffer to store the results of merging detail=3Dnone prefi=
x lists.
+ Fix for report [bugs:/info/2026-08-04T08:49:27Z | 2026-08-04T08:49:27Z]=
.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+FossilOrigin-Name: a7f8c92f623e9cbe8a61266d949916acc9e5110c94dff4aa6fd1a=
d2ea8a60d4e
+
+CVE: CVE-2026-119373
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/e1c99=
34f9f11a499029abb020ea715a08970da80]
+
+Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
+---
+ sqlite3.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 6acf46a..2b1e6b9 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -244805,7 +244805,7 @@ static void fts5MergeRowidLists(
+   (void)nBuf;
+   memset(&out, 0, sizeof(out));
+   assert( nBuf=3D=3D1 );
+-  sqlite3Fts5BufferSize(&p->rc, &out, p1->n + p2->n);
++  sqlite3Fts5BufferSize(&p->rc, &out, p1->n + p2->n + 9);
+   if( p->rc ) return;
+=20
+   fts5NextRowid(p1, &i1, &iRowid1);
+@@ -244813,12 +244813,12 @@ static void fts5MergeRowidLists(
+   while( i1>=3D0 || i2>=3D0 ){
+     if( i1>=3D0 && (i2<0 || iRowid1<iRowid2) ){
+       assert( iOut=3D=3D0 || iRowid1>iOut );
+-      fts5BufferSafeAppendVarint(&out, iRowid1 - iOut);
++      fts5BufferSafeAppendVarint(&out, (u64)iRowid1 - (u64)iOut);
+       iOut =3D iRowid1;
+       fts5NextRowid(p1, &i1, &iRowid1);
+     }else{
+       assert( iOut=3D=3D0 || iRowid2>iOut );
+-      fts5BufferSafeAppendVarint(&out, iRowid2 - iOut);
++      fts5BufferSafeAppendVarint(&out, (u64)iRowid2 - (u64)iOut);
+       iOut =3D iRowid2;
+       if( i1>=3D0 && iRowid1=3D=3DiRowid2 ){
+         fts5NextRowid(p1, &i1, &iRowid1);
diff --git a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb b/meta/recipes=
-support/sqlite/sqlite3_3.45.3.bb
index 975f3bdab8..e7c5bcdac4 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
@@ -10,6 +10,7 @@ SRC_URI =3D "http://www.sqlite.org/2024/sqlite-autoconf=
-${SQLITE_PV}.tar.gz \
            file://CVE-2025-7709.patch \
            file://CVE-2025-70873.patch \
            file://CVE-2026-11822_CVE-2026-11824.patch \
-          "
+           file://CVE-2026-119373.patch \
+"
 SRC_URI[sha256sum] =3D "b2809ca53124c19c60f42bf627736eae011afdcc205bb482=
70a5ee9a38191531"
=20
--=20
2.55.0


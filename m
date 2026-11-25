Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43430.1795618530126058736
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 06:55:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=AajS3HGO;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 39C334E4177F
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 14:55:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0826B60480;
	Wed, 25 Nov 2026 14:55:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C222F11E69800;
	Wed, 25 Nov 2026 15:55:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795618523; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xsZ6JkmWIj39NbkRbmRSKPQNRpQNLWoSFBkghqizH0U=;
	b=AajS3HGONSLjwsJsDjQ21lg9f1h2+emGJorh9q6eI02Mc5xSZp7VaY9RlPk9Dq/eGTlbqp
	S8woCrWmHuG8UBJryH7jDS3a0ZKWHazNfI+VBWUuP/PTtR79/rYBcyY9qWNa8K9lIRC7F2
	sfKE1Ur5yZ/tiqZATg5NmRAcueq0WbvRWqA02kHbzs60G/1p35CpkapkNZ7Ok7U8dU/zon
	1wmQR+oGDUEPnqBWJJwje7qvviM5riWNWyjAu2AeXdkkqvI+BL3ntdiVPAXR3/Y+VrF/45
	49XkgMBBUMGqpOXs89o2ve3C1Bzjw5gKecWgFoArYKh0PBfPPINy216oPkH56g==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	yoann.congal@smile.fr,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
Subject: [scarthgap][PATCH v2 3/3] sqlite3: fix CVE-2026-119379
Date: Wed, 25 Nov 2026 15:52:39 +0100
Message-ID: <20261125145239.4173659-4-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261125145239.4173659-1-joaomarcos.costa@bootlin.com>
References: <20261125145239.4173659-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 14:55:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251194

This vulnerability, marked as High [1], was fixed upstream [2] since
3.54.0.

Backport the fix to sqlite v3.45.3.

[1] https://nvd.nist.gov/vuln/detail/cve-2026-119379
[2] https://github.com/sqlite/sqlite/commit/64459c87cc702d600704fb77ee40c=
a1782398a52

Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.co=
sta@bootlin.com>
---
 .../sqlite/sqlite3/CVE-2026-119379.patch      | 70 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119379.p=
atch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119379.patch b/=
meta/recipes-support/sqlite/sqlite3/CVE-2026-119379.patch
new file mode 100644
index 0000000000..32fdbbc5d2
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119379.patch
@@ -0,0 +1,70 @@
+From 56618802689fc81664d5e461da93026998a6b6bb Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Jo=3DC3=3DA3o=3D20Marcos=3D20Costa?=3D <joaomarcos.cos=
ta@bootlin.com>
+Date: Thu, 5 Nov 2026 12:06:23 +0100
+Subject: [PATCH] Avoid a buffer overrun when processing a strategically
+ corrupted changeset. Report [bugs:/info/2026-08-16T10:15:25Z |
+ 2026-08-16T10:15:25Z].
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+FossilOrigin-Name: 3f57024aecea0f3b565ed823cf94b085031c481fd6323c1f2e431=
9a53500864f
+
+CVE: CVE-2026-119379
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/64459=
c87cc702d600704fb77ee40ca1782398a52]
+
+Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
+---
+ sqlite3.c | 9 ++++-----
+ 1 file changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 2b1e6b9..88b1810 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -228393,9 +228393,9 @@ static int sessionChangesetApply(
+   int schemaMismatch =3D 0;
+   int rc =3D SQLITE_OK;             /* Return code */
+   const char *zTab =3D 0;           /* Name of current table */
+-  int nTab =3D 0;                   /* Result of sqlite3Strlen30(zTab) =
*/
+   SessionApplyCtx sApply;         /* changeset_apply() context object *=
/
+   int bPatchset;
++  int bNew =3D 0;                   /* True for first entry of new tabl=
e */
+=20
+   assert( xConflict!=3D0 );
+=20
+@@ -228411,15 +228411,16 @@ static int sessionChangesetApply(
+   if( rc=3D=3DSQLITE_OK ){
+     rc =3D sqlite3_exec(db, "PRAGMA defer_foreign_keys =3D 1", 0, 0, 0)=
;
+   }
+-  while( rc=3D=3DSQLITE_OK && SQLITE_ROW=3D=3Dsqlite3changeset_next(pIt=
er) ){
++  while( rc=3D=3DSQLITE_OK && SQLITE_ROW=3D=3DsessionChangesetNext(pIte=
r, 0, 0,&bNew) ){
+     int nCol;
+     int op;
+     const char *zNew;
+=20
+     sqlite3changeset_op(pIter, &zNew, &nCol, &op, 0);
+=20
+-    if( zTab=3D=3D0 || sqlite3_strnicmp(zNew, zTab, nTab+1) ){
++    if( bNew ){
+       u8 *abPK;
++      bNew =3D 0;
+=20
+       rc =3D sessionRetryConstraints(
+           db, pIter->bPatchset, zTab, &sApply, xConflict, pCtx
+@@ -228454,7 +228455,6 @@ static int sessionChangesetApply(
+           rc =3D SQLITE_NOMEM;
+           break;
+         }
+-        nTab =3D (int)strlen(zTab);
+         sApply.azCol =3D (const char **)zTab;
+       }else{
+         int nMinCol =3D 0;
+@@ -228506,7 +228506,6 @@ static int sessionChangesetApply(
+             sApply.bStat1 =3D 0;
+           }
+         }
+-        nTab =3D sqlite3Strlen30(zTab);
+       }
+     }
+=20
diff --git a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb b/meta/recipes=
-support/sqlite/sqlite3_3.45.3.bb
index 1ff7c4f2ee..9dceb63d98 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
@@ -14,6 +14,7 @@ SRC_URI =3D "http://www.sqlite.org/2024/sqlite-autoconf=
-${SQLITE_PV}.tar.gz \
            file://CVE-2026-119374-pre1.patch \
            file://CVE-2026-119374-pre2.patch \
            file://CVE-2026-119374.patch \
+           file://CVE-2026-119379.patch \
 "
 SRC_URI[sha256sum] =3D "b2809ca53124c19c60f42bf627736eae011afdcc205bb482=
70a5ee9a38191531"
=20
--=20
2.55.0


Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35396.1793888330180153991
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 06:18:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=j1lEcjBf;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 843F21A09F3
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Nov 2026 14:18:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5356B5FF85;
	Thu,  5 Nov 2026 14:18:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7689A103292A7;
	Thu,  5 Nov 2026 15:18:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793888327; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QoDkQYXwu+B6safCUHGwuUs/RJTksA/BcWQ0WdXxZBo=;
	b=j1lEcjBfXa2b/fWpC2ViYyk81hEQhwzjs3ptBHeFsiSuS0ovI2Rbt0jeoRkiwhWp7T31Xo
	MMqnrDJcMbhsIiGIeyRS7h7RHBuQkKOn8A0bjs+0r/089wnOnYjSN6nZq2uzyU7rVPgcV1
	s32D64+zaG6V25NOL2GT/xqHiGQ1F3eIgjo2GcgUzWI1kgP78i0iJLRmJn7PEM4SATKcAY
	8KtY2kPHJ6T+j+IkEHRJ+MRffvcnsxwDmuLwAyIPiXdJHKrucAPHszBcuc36rdcjehQCMn
	w23mPQpEBy0K6+4IaATdKCDHDTYxc9el+y9ohgYfsbwCSE22j9ZYL1iBBjlatg==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	yoann.congal@smile.fr,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
Subject: [scarthgap][PATCH 2/3] sqlite3: fix CVE-2026-119374
Date: Thu,  5 Nov 2026 15:18:26 +0100
Message-ID: <20261105141827.2142719-3-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105141827.2142719-1-joaomarcos.costa@bootlin.com>
References: <20261105141827.2142719-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 14:18:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249555

This vulnerability, marked as High [1], was fixed upstream [2] since
3.54.0.

Backport the fix to sqlite v3.45.3.

Some function/macro definitions are required to compile the backported
code, and they are provided in the *-pre.patch.

[1] https://nvd.nist.gov/vuln/detail/cve-2026-119374
[2] https://github.com/sqlite/sqlite/commit/d9de6eedbe918c074c7556400fa21=
df5960704d9

Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.co=
sta@bootlin.com>
---
 .../sqlite/sqlite3/CVE-2026-119374-pre.patch  | 73 +++++++++++++++++++
 .../sqlite/sqlite3/CVE-2026-119374.patch      | 67 +++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |  2 +
 3 files changed, 142 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119374-p=
re.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119374.p=
atch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119374-pre.patc=
h b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119374-pre.patch
new file mode 100644
index 0000000000..1192cef006
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119374-pre.patch
@@ -0,0 +1,73 @@
+From 315df7b9dc2ac2abc55c3636439fd532e3090ef6 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Jo=3DC3=3DA3o=3D20Marcos=3D20Costa?=3D <joaomarcos.cos=
ta@bootlin.com>
+Date: Thu, 5 Nov 2026 11:48:59 +0100
+Subject: [PATCH] sqlite3.c: add fts5IndexCorrupt* and FTS5_CORRUPT_* hel=
pers
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+These functions/macros come from multiple upstream commits, and are requ=
ired by
+the backport for CVE-2026-119374.
+
+Upstream-Status: Backport [multiple changes from v3.54.1]
+
+Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
+---
+ sqlite3.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 44 insertions(+)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 2b1e6b9..4d0513e 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -239371,6 +239371,50 @@ struct Fts5SegIter {
+   u8 bDel;                        /* True if the delete flag is set */
+ };
+=20
++void sqlite3Fts5ConfigErrmsg(Fts5Config *pConfig, const char *zFmt, ...=
){
++  va_list ap;                     /* ... printf arguments */
++  char *zMsg =3D 0;
++
++  va_start(ap, zFmt);
++  zMsg =3D sqlite3_vmprintf(zFmt, ap);
++  if( pConfig->pzErrmsg ){
++    *pConfig->pzErrmsg =3D zMsg;
++  }else{
++    sqlite3_free(zMsg);
++  }
++
++  va_end(ap);
++}
++
++static int fts5IndexCorruptRowid(Fts5Index *pIdx, i64 iRowid){
++  pIdx->rc =3D FTS5_CORRUPT;
++  sqlite3Fts5ConfigErrmsg(pIdx->pConfig,=20
++      "fts5: corruption found reading blob %lld from table \"%s\"",=20
++      iRowid, pIdx->pConfig->zName
++  );
++  return SQLITE_CORRUPT_VTAB;
++}
++#define FTS5_CORRUPT_ROWID(pIdx, iRowid) fts5IndexCorruptRowid(pIdx, iR=
owid)
++
++static int fts5IndexCorruptIter(Fts5Index *pIdx, Fts5SegIter *pIter){
++  pIdx->rc =3D FTS5_CORRUPT;
++  sqlite3Fts5ConfigErrmsg(pIdx->pConfig,=20
++      "fts5: corruption on page %d, segment %d, table \"%s\"",=20
++      pIter->iLeafPgno, pIter->pSeg->iSegid, pIdx->pConfig->zName
++  );
++  return SQLITE_CORRUPT_VTAB;
++}
++#define FTS5_CORRUPT_ITER(pIdx, pIter) fts5IndexCorruptIter(pIdx, pIter=
)
++
++static int fts5IndexCorruptIdx(Fts5Index *pIdx){
++  pIdx->rc =3D FTS5_CORRUPT;
++  sqlite3Fts5ConfigErrmsg(pIdx->pConfig,=20
++      "fts5: corruption in table \"%s\"", pIdx->pConfig->zName
++  );
++  return SQLITE_CORRUPT_VTAB;
++}
++#define FTS5_CORRUPT_IDX(pIdx) fts5IndexCorruptIdx(pIdx)
++
+ /*
+ ** Array of tombstone pages. Reference counted.
+ */
diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119374.patch b/=
meta/recipes-support/sqlite/sqlite3/CVE-2026-119374.patch
new file mode 100644
index 0000000000..1ea9f2d1ee
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119374.patch
@@ -0,0 +1,67 @@
+From 68bb719b1c9aba46b0de9464c5c1ef5f76aab9d8 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Jo=3DC3=3DA3o=3D20Marcos=3D20Costa?=3D <joaomarcos.cos=
ta@bootlin.com>
+Date: Wed, 4 Nov 2026 17:07:06 +0100
+Subject: [PATCH] Fix a problem in fts5 secure-delete code that could lea=
d to a
+ buffer overrun when dealing with a strategically corrupted database. Pr=
oblem
+ reported by YEONBA.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+FossilOrigin-Name: 9cd4f9e9205c5a5096388397a39349db9ff5377d19095c6b20388=
ff799969c31
+
+CVE: CVE-2026-119374
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/d9de6=
eedbe918c074c7556400fa21df5960704d9]
+
+Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
+---
+ sqlite3.c | 17 +++++++++++------
+ 1 file changed, 11 insertions(+), 6 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 4d0513e..3ba2e27 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -244287,31 +244287,36 @@ static void fts5DoSecureDelete(
+     const int nMove =3D nPg - iNextOff;     /* Number of bytes to move =
*/
+     int nShift =3D iNextOff - iOff;         /* Distance to move them */
+=20
++    int nNewPg =3D 0;
+     int iPrevKeyOut =3D 0;
+-    int iKeyIn =3D 0;
++    i64 iKeyIn =3D 0;
+=20
+     memmove(&aPg[iOff], &aPg[iNextOff], nMove);
+     iPgIdx -=3D nShift;
+-    nPg =3D iPgIdx;
++    nNewPg =3D iPgIdx;
+     fts5PutU16(&aPg[2], iPgIdx);
+=20
+     for(iIdx=3D0; iIdx<nIdx; /* no-op */){
+       u32 iVal =3D 0;
+       iIdx +=3D fts5GetVarint32(&aIdx[iIdx], iVal);
+       iKeyIn +=3D iVal;
++      if( iKeyIn>nPg ){
++        FTS5_CORRUPT_IDX(p);
++        break;
++      }
+       if( iKeyIn!=3DiDelKeyOff ){
+         int iKeyOut =3D (iKeyIn - (iKeyIn>iOff ? nShift : 0));
+-        nPg +=3D sqlite3Fts5PutVarint(&aPg[nPg], iKeyOut - iPrevKeyOut)=
;
++        nNewPg +=3D sqlite3Fts5PutVarint(&aPg[nNewPg], iKeyOut - iPrevK=
eyOut);
+         iPrevKeyOut =3D iKeyOut;
+       }
+     }
+=20
+-    if( iPgIdx=3D=3DnPg && nIdx>0 && pSeg->iLeafPgno!=3D1 ){
++    if( p->rc=3D=3DSQLITE_OK && iPgIdx=3D=3DnNewPg && nIdx>0 && pSeg->i=
LeafPgno!=3D1 ){
+       fts5SecureDeleteIdxEntry(p, iSegid, pSeg->iLeafPgno);
+     }
+=20
+-    assert_nc( nPg>4 || fts5GetU16(aPg)=3D=3D0 );
+-    fts5DataWrite(p, FTS5_SEGMENT_ROWID(iSegid,pSeg->iLeafPgno), aPg, n=
Pg);
++    assert_nc( nNewPg>4 || fts5GetU16(aPg)=3D=3D0 );
++    fts5DataWrite(p, FTS5_SEGMENT_ROWID(iSegid,pSeg->iLeafPgno), aPg, n=
NewPg);
+   }
+   sqlite3_free(aIdx);
+ }
diff --git a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb b/meta/recipes=
-support/sqlite/sqlite3_3.45.3.bb
index e7c5bcdac4..5d70e765e5 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
@@ -11,6 +11,8 @@ SRC_URI =3D "http://www.sqlite.org/2024/sqlite-autoconf=
-${SQLITE_PV}.tar.gz \
            file://CVE-2025-70873.patch \
            file://CVE-2026-11822_CVE-2026-11824.patch \
            file://CVE-2026-119373.patch \
+           file://CVE-2026-119374-pre.patch \
+           file://CVE-2026-119374.patch \
 "
 SRC_URI[sha256sum] =3D "b2809ca53124c19c60f42bf627736eae011afdcc205bb482=
70a5ee9a38191531"
=20
--=20
2.55.0


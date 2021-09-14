Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.5573.1631594420098183296
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Sep 2021 21:40:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: changqing.li@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 18E4eIB1001211
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Sep 2021 21:40:18 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 18E4eIqq016095
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Sep 2021 21:40:18 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 13 Sep 2021 21:40:16 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Mon, 13 Sep 2021 21:40:15 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 13 Sep 2021 21:40:14 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH] sqlite3: fix CVE-2021-36690
Date: Tue, 14 Sep 2021 12:35:50 +0800
Message-ID: <20210914043550.6941-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

refer:
https://nvd.nist.gov/vuln/detail/CVE-2021-36690
https://www.sqlite.org/forum/forumpost/718c0a8d17
https://sqlite.org/src/info/b1e0c22ec981cf5f

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../sqlite/sqlite3/CVE-2021-36690.patch       | 62 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.35.0.bb |  4 +-
 2 files changed, 65 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2021-36690.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2021-36690.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2021-36690.patch
new file mode 100644
index 0000000000..d383696e42
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2021-36690.patch
@@ -0,0 +1,62 @@
+From c286324a7ff1e98355b638fb821614a65ee03c0c Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 14 Sep 2021 11:28:54 +0800
+Subject: [PATCH] Fix an issue with the SQLite Expert extension when a column
+ has no collating sequence. Forum post 78165fa250.
+
+Upstream-Status: Backport [https://sqlite.org/src/info/b1e0c22ec981cf5f]
+CVE: CVE-2021-36690
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ shell.c | 14 +++++++++-----
+ 1 file changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/shell.c b/shell.c
+index de8a665..69a5c05 100644
+--- a/shell.c
++++ b/shell.c
+@@ -9054,11 +9054,13 @@ static int idxGetTableInfo(
+   rc = idxPrintfPrepareStmt(db, &p1, pzErrmsg, "PRAGMA table_xinfo=%Q", zTab);
+   while( rc==SQLITE_OK && SQLITE_ROW==sqlite3_step(p1) ){
+     const char *zCol = (const char*)sqlite3_column_text(p1, 1);
++    const char *zColSeq = 0;
+     nByte += 1 + STRLEN(zCol);
+     rc = sqlite3_table_column_metadata(
+-        db, "main", zTab, zCol, 0, &zCol, 0, 0, 0
++        db, "main", zTab, zCol, 0, &zColSeq, 0, 0, 0
+     );
+-    nByte += 1 + STRLEN(zCol);
++    if( zColSeq==0 ) zColSeq = "binary";
++    nByte += 1 + STRLEN(zColSeq);
+     nCol++;
+     nPk += (sqlite3_column_int(p1, 5)>0);
+   }
+@@ -9078,6 +9080,7 @@ static int idxGetTableInfo(
+   nCol = 0;
+   while( rc==SQLITE_OK && SQLITE_ROW==sqlite3_step(p1) ){
+     const char *zCol = (const char*)sqlite3_column_text(p1, 1);
++    const char *zColSeq = 0;
+     int nCopy = STRLEN(zCol) + 1;
+     pNew->aCol[nCol].zName = pCsr;
+     pNew->aCol[nCol].iPk = (sqlite3_column_int(p1, 5)==1 && nPk==1);
+@@ -9085,12 +9088,13 @@ static int idxGetTableInfo(
+     pCsr += nCopy;
+ 
+     rc = sqlite3_table_column_metadata(
+-        db, "main", zTab, zCol, 0, &zCol, 0, 0, 0
++        db, "main", zTab, zCol, 0, &zColSeq, 0, 0, 0
+     );
+     if( rc==SQLITE_OK ){
+-      nCopy = STRLEN(zCol) + 1;
++      if( zColSeq==0 ) zColSeq = "binary";
++      nCopy = STRLEN(zColSeq) + 1;
+       pNew->aCol[nCol].zColl = pCsr;
+-      memcpy(pCsr, zCol, nCopy);
++      memcpy(pCsr, zColSeq, nCopy);
+       pCsr += nCopy;
+     }
+ 
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.35.0.bb b/meta/recipes-support/sqlite/sqlite3_3.35.0.bb
index 127065bbc1..8b2732640f 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.35.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.35.0.bb
@@ -3,7 +3,9 @@ require sqlite3.inc
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
-SRC_URI = "http://www.sqlite.org/2021/sqlite-autoconf-${SQLITE_PV}.tar.gz"
+SRC_URI = "http://www.sqlite.org/2021/sqlite-autoconf-${SQLITE_PV}.tar.gz \
+           file://CVE-2021-36690.patch \
+"
 SRC_URI[sha256sum] = "3dfb3f143c83695a555c7dd9e06ed924f9d273c287989874e102656724baf2d0"
 
 # -19242 is only an issue in specific development branch commits
-- 
2.17.1


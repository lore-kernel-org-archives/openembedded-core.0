Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.780.1588272169332475720
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 11:42:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ssajal@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 03UIgBRp032384
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 11:42:38 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Thu, 30 Apr 2020
 11:42:26 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 20885)	id 01EFC900506;
 Thu, 30 Apr 2020 11:42:25 -0700 (PDT)
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] sqlite: backport CVE fixes
Date: Thu, 30 Apr 2020 11:42:16 -0700
Message-ID: <20200430184216.170709-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Fixes CVE-2020-11655 and CVE-2020-11656

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 .../sqlite/files/CVE-2020-11655.patch         | 32 +++++++++
 .../sqlite/files/CVE-2020-11656.patch         | 70 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.31.1.bb |  2 +
 3 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2020-11655.patch
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2020-11656.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2020-11655.patch b/meta/recipes-support/sqlite/files/CVE-2020-11655.patch
new file mode 100644
index 0000000000..e30c482bbb
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2020-11655.patch
@@ -0,0 +1,32 @@
+From a4601326d61bf1a11151ac6b78b50804bfd03b4d Mon Sep 17 00:00:00 2001
+From: Sakib Sajal <sakib.sajal@windriver.com>
+Date: Thu, 30 Apr 2020 10:46:16 -0700
+Subject: [PATCH 2/2] In the event of a semantic error in an aggregate query,
+ early-out the resetAccumulator() function to prevent problems due to
+ incomplete or incorrect initialization of the AggInfo object. Fix for ticket
+ [af4556bb5c285c08].
+
+FossilOrigin-Name: 4a302b42c7bf5e11ddb5522ca999f74aba397d3a7eb91b1844bb02852f772441
+Upstream Status: Backport [c415d91007e1680e4eb17def583b202c3c83c718]
+
+CVE: CVE-2020-11655
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ sqlite3.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 1df6633..726adf7 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -133242,6 +133242,7 @@ static void resetAccumulator(Parse *pParse, AggInfo *pAggInfo){
+   struct AggInfo_func *pFunc;
+   int nReg = pAggInfo->nFunc + pAggInfo->nColumn;
+   if( nReg==0 ) return;
++  if( pParse->nErr ) return;
+ #ifdef SQLITE_DEBUG
+   /* Verify that all AggInfo registers are within the range specified by
+   ** AggInfo.mnReg..AggInfo.mxReg */
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/sqlite/files/CVE-2020-11656.patch b/meta/recipes-support/sqlite/files/CVE-2020-11656.patch
new file mode 100644
index 0000000000..b88a724e8c
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2020-11656.patch
@@ -0,0 +1,70 @@
+From 2d69a520d027eb73eb6da9f2653d23e33b10e8bb Mon Sep 17 00:00:00 2001
+From: Sakib Sajal <sakib.sajal@windriver.com>
+Date: Thu, 30 Apr 2020 10:14:36 -0700
+Subject: [PATCH 1/2] Fix a case when a pointer might be used after
+ being freed in  the ALTER TABLE code. Fix for [4722bdab08cb1].
+
+FossilOrigin-Name: d09f8c3621d5f7f8c6d99d7d82bcaa8421855b3f470bea2b26c858106382b906
+Upstream Status: Backport [fb99e388ec7f30fe43e4878236e3695ff24ae58d]
+
+[PATCH 2/2] Do not suppress errors when resolving references in an ORDER
+ BY clause belonging to a compound SELECT within a view or trigger within
+ ALTER TABLE. Fix for ticket [a10a14e9b4ba2].
+
+FossilOrigin-Name: 684293882c302600e112cf52553c19d84fdb31663d96e5dd7f8ac17dda00a026
+Upstream Status: Backport [4db7ab53f9c30e2e22731ace93ab6b18eef6c4ae]
+
+The two patches were converted to amalgamation format.
+
+CVE: CVE-2020-11656
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ sqlite3.c | 18 +++++++++++++++++-
+ 1 file changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 64fae04..1df6633 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -97945,7 +97945,7 @@ static int resolveOrderByTermToExprList(
+   nc.nErr = 0;
+   db = pParse->db;
+   savedSuppErr = db->suppressErr;
+-  db->suppressErr = 1;
++  if( IN_RENAME_OBJECT==0 ) db->suppressErr = 1;
+   rc = sqlite3ResolveExprNames(&nc, pE);
+   db->suppressErr = savedSuppErr;
+   if( rc ) return 0;
+@@ -105383,6 +105383,21 @@ static void renameWalkWith(Walker *pWalker, Select *pSelect){
+   }
+ }
+ 
++/*
++** Unmap all tokens in the IdList object passed as the second argument.
++*/
++static void unmapColumnIdlistNames(
++  Parse *pParse,
++  IdList *pIdList
++){
++  if( pIdList ){
++    int ii;
++    for(ii=0; ii<pIdList->nId; ii++){
++      sqlite3RenameTokenRemap(pParse, 0, (void*)pIdList->a[ii].zName);
++    }
++  }
++}
++
+ /*
+ ** Walker callback used by sqlite3RenameExprUnmap().
+ */
+@@ -105404,6 +105419,7 @@ static int renameUnmapSelectCb(Walker *pWalker, Select *p){
+     for(i=0; i<pSrc->nSrc; i++){
+       sqlite3RenameTokenRemap(pParse, 0, (void*)pSrc->a[i].zName);
+       if( sqlite3WalkExpr(pWalker, pSrc->a[i].pOn) ) return WRC_Abort;
++      unmapColumnIdlistNames(pParse, pSrc->a[i].pUsing);
+     }
+   }
+ 
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
index de564e2698..57a791385c 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed0
 
 SRC_URI = "http://www.sqlite.org/2020/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2020-9327.patch \
+           file://CVE-2020-11656.patch \
+           file://CVE-2020-11655.patch \
            "
 SRC_URI[md5sum] = "2d0a553534c521504e3ac3ad3b90f125"
 SRC_URI[sha256sum] = "62284efebc05a76f909c580ffa5c008a7d22a1287285d68b7825a2b6b51949ae"
-- 
2.17.1


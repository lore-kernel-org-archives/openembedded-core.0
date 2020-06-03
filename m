Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.11022.1591181539183436874
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 03:52:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,467,1583164800"; 
   d="scan'208";a="93757504"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 03 Jun 2020 18:52:17 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 5A2FB4BCC8BF
	for <openembedded-core@lists.openembedded.org>; Wed,  3 Jun 2020 18:52:14 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 3 Jun 2020 18:52:14 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] sqlite: upgrade 3.31.1 -> 3.32.1
Date: Wed, 3 Jun 2020 18:52:00 +0800
Message-ID: <1591181521-15405-4-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1591181521-15405-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1591181521-15405-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 5A2FB4BCC8BF.A89CE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

CVE-2020-11655.patch
CVE-2020-11656.patch
CVE-2020-9327.patch
removed since they are included in 3.32.1

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../sqlite/files/CVE-2020-11655.patch         |  32 ----
 .../sqlite/files/CVE-2020-11656.patch         |  70 ---------
 .../sqlite/files/CVE-2020-9327.patch          | 141 ------------------
 .../{sqlite3_3.31.1.bb => sqlite3_3.32.1.bb}  |  10 +-
 4 files changed, 3 insertions(+), 250 deletions(-)
 delete mode 100644 meta/recipes-support/sqlite/files/CVE-2020-11655.patch
 delete mode 100644 meta/recipes-support/sqlite/files/CVE-2020-11656.patch
 delete mode 100644 meta/recipes-support/sqlite/files/CVE-2020-9327.patch
 rename meta/recipes-support/sqlite/{sqlite3_3.31.1.bb => sqlite3_3.32.1.bb} (50%)

diff --git a/meta/recipes-support/sqlite/files/CVE-2020-11655.patch b/meta/recipes-support/sqlite/files/CVE-2020-11655.patch
deleted file mode 100644
index e30c482bbb..0000000000
--- a/meta/recipes-support/sqlite/files/CVE-2020-11655.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From a4601326d61bf1a11151ac6b78b50804bfd03b4d Mon Sep 17 00:00:00 2001
-From: Sakib Sajal <sakib.sajal@windriver.com>
-Date: Thu, 30 Apr 2020 10:46:16 -0700
-Subject: [PATCH 2/2] In the event of a semantic error in an aggregate query,
- early-out the resetAccumulator() function to prevent problems due to
- incomplete or incorrect initialization of the AggInfo object. Fix for ticket
- [af4556bb5c285c08].
-
-FossilOrigin-Name: 4a302b42c7bf5e11ddb5522ca999f74aba397d3a7eb91b1844bb02852f772441
-Upstream Status: Backport [c415d91007e1680e4eb17def583b202c3c83c718]
-
-CVE: CVE-2020-11655
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- sqlite3.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/sqlite3.c b/sqlite3.c
-index 1df6633..726adf7 100644
---- a/sqlite3.c
-+++ b/sqlite3.c
-@@ -133242,6 +133242,7 @@ static void resetAccumulator(Parse *pParse, AggInfo *pAggInfo){
-   struct AggInfo_func *pFunc;
-   int nReg = pAggInfo->nFunc + pAggInfo->nColumn;
-   if( nReg==0 ) return;
-+  if( pParse->nErr ) return;
- #ifdef SQLITE_DEBUG
-   /* Verify that all AggInfo registers are within the range specified by
-   ** AggInfo.mnReg..AggInfo.mxReg */
--- 
-2.17.1
-
diff --git a/meta/recipes-support/sqlite/files/CVE-2020-11656.patch b/meta/recipes-support/sqlite/files/CVE-2020-11656.patch
deleted file mode 100644
index b88a724e8c..0000000000
--- a/meta/recipes-support/sqlite/files/CVE-2020-11656.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 2d69a520d027eb73eb6da9f2653d23e33b10e8bb Mon Sep 17 00:00:00 2001
-From: Sakib Sajal <sakib.sajal@windriver.com>
-Date: Thu, 30 Apr 2020 10:14:36 -0700
-Subject: [PATCH 1/2] Fix a case when a pointer might be used after
- being freed in  the ALTER TABLE code. Fix for [4722bdab08cb1].
-
-FossilOrigin-Name: d09f8c3621d5f7f8c6d99d7d82bcaa8421855b3f470bea2b26c858106382b906
-Upstream Status: Backport [fb99e388ec7f30fe43e4878236e3695ff24ae58d]
-
-[PATCH 2/2] Do not suppress errors when resolving references in an ORDER
- BY clause belonging to a compound SELECT within a view or trigger within
- ALTER TABLE. Fix for ticket [a10a14e9b4ba2].
-
-FossilOrigin-Name: 684293882c302600e112cf52553c19d84fdb31663d96e5dd7f8ac17dda00a026
-Upstream Status: Backport [4db7ab53f9c30e2e22731ace93ab6b18eef6c4ae]
-
-The two patches were converted to amalgamation format.
-
-CVE: CVE-2020-11656
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- sqlite3.c | 18 +++++++++++++++++-
- 1 file changed, 17 insertions(+), 1 deletion(-)
-
-diff --git a/sqlite3.c b/sqlite3.c
-index 64fae04..1df6633 100644
---- a/sqlite3.c
-+++ b/sqlite3.c
-@@ -97945,7 +97945,7 @@ static int resolveOrderByTermToExprList(
-   nc.nErr = 0;
-   db = pParse->db;
-   savedSuppErr = db->suppressErr;
--  db->suppressErr = 1;
-+  if( IN_RENAME_OBJECT==0 ) db->suppressErr = 1;
-   rc = sqlite3ResolveExprNames(&nc, pE);
-   db->suppressErr = savedSuppErr;
-   if( rc ) return 0;
-@@ -105383,6 +105383,21 @@ static void renameWalkWith(Walker *pWalker, Select *pSelect){
-   }
- }
- 
-+/*
-+** Unmap all tokens in the IdList object passed as the second argument.
-+*/
-+static void unmapColumnIdlistNames(
-+  Parse *pParse,
-+  IdList *pIdList
-+){
-+  if( pIdList ){
-+    int ii;
-+    for(ii=0; ii<pIdList->nId; ii++){
-+      sqlite3RenameTokenRemap(pParse, 0, (void*)pIdList->a[ii].zName);
-+    }
-+  }
-+}
-+
- /*
- ** Walker callback used by sqlite3RenameExprUnmap().
- */
-@@ -105404,6 +105419,7 @@ static int renameUnmapSelectCb(Walker *pWalker, Select *p){
-     for(i=0; i<pSrc->nSrc; i++){
-       sqlite3RenameTokenRemap(pParse, 0, (void*)pSrc->a[i].zName);
-       if( sqlite3WalkExpr(pWalker, pSrc->a[i].pOn) ) return WRC_Abort;
-+      unmapColumnIdlistNames(pParse, pSrc->a[i].pUsing);
-     }
-   }
- 
--- 
-2.17.1
-
diff --git a/meta/recipes-support/sqlite/files/CVE-2020-9327.patch b/meta/recipes-support/sqlite/files/CVE-2020-9327.patch
deleted file mode 100644
index fecbbabce8..0000000000
--- a/meta/recipes-support/sqlite/files/CVE-2020-9327.patch
+++ /dev/null
@@ -1,141 +0,0 @@
-From 45d491851e1bca378de158a5e279fd584ce548e4 Mon Sep 17 00:00:00 2001
-From: "D. Richard Hipp" <drh@hwaci.com>
-Date: Mon, 17 Feb 2020 00:12:04 +0000
-Subject: [PATCH] [PATCH 1/2]  Take care when checking the table of a TK_COLUMN
-  expression node to see if the table is a virtual table to first ensure that 
- the Expr.y.pTab pointer is not null due to generated column optimizations. 
- Ticket [4374860b29383380].
-
-FossilOrigin-Name: 9d0d4ab95dc0c56e053c2924ed322a9ea7b25439e6f74599f706905a1994e454
-
-[PATCH 2/2] A better (smaller and faster) solution to ticket
- [4374860b29383380].
-
-FossilOrigin-Name: abc473fb8fb999005dc79a360e34f97b3b25429decf1820dd2afa5c19577753d
-
-The two patches were converted to amalgamation format
-
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
-Upstream-Status: Backport
-CVE: CVE-2020-9327
----
- sqlite3.c | 35 ++++++++++++++++++++++++-----------
- sqlite3.h |  2 +-
- 2 files changed, 25 insertions(+), 12 deletions(-)
-
-diff --git a/sqlite3.c b/sqlite3.c
-index 55dc686..64fae04 100644
---- a/sqlite3.c
-+++ b/sqlite3.c
-@@ -1167,7 +1167,7 @@ extern "C" {
- */
- #define SQLITE_VERSION        "3.31.1"
- #define SQLITE_VERSION_NUMBER 3031001
--#define SQLITE_SOURCE_ID      "2020-01-27 19:55:54 3bfa9cc97da10598521b342961df8f5f68c7388fa117345eeb516eaa837bb4d6"
-+#define SQLITE_SOURCE_ID      "2020-01-27 19:55:54 3bfa9cc97da10598521b342961df8f5f68c7388fa117345eeb516eaa837balt1"
- 
- /*
- ** CAPI3REF: Run-Time Library Version Numbers
-@@ -17428,8 +17428,11 @@ struct Table {
- */
- #ifndef SQLITE_OMIT_VIRTUALTABLE
- #  define IsVirtual(X)      ((X)->nModuleArg)
-+#  define ExprIsVtab(X)  \
-+              ((X)->op==TK_COLUMN && (X)->y.pTab!=0 && (X)->y.pTab->nModuleArg)
- #else
- #  define IsVirtual(X)      0
-+#  define ExprIsVtab(X)     0
- #endif
- 
- /*
-@@ -104133,19 +104136,25 @@ static int impliesNotNullRow(Walker *pWalker, Expr *pExpr){
-     case TK_LT:
-     case TK_LE:
-     case TK_GT:
--    case TK_GE:
-+    case TK_GE: {
-+      Expr *pLeft = pExpr->pLeft;
-+      Expr *pRight = pExpr->pRight;
-       testcase( pExpr->op==TK_EQ );
-       testcase( pExpr->op==TK_NE );
-       testcase( pExpr->op==TK_LT );
-       testcase( pExpr->op==TK_LE );
-       testcase( pExpr->op==TK_GT );
-       testcase( pExpr->op==TK_GE );
--      if( (pExpr->pLeft->op==TK_COLUMN && IsVirtual(pExpr->pLeft->y.pTab))
--       || (pExpr->pRight->op==TK_COLUMN && IsVirtual(pExpr->pRight->y.pTab))
-+      /* The y.pTab=0 assignment in wherecode.c always happens after the
-+      ** impliesNotNullRow() test */
-+      if( (pLeft->op==TK_COLUMN && ALWAYS(pLeft->y.pTab!=0)
-+                               && IsVirtual(pLeft->y.pTab))
-+       || (pRight->op==TK_COLUMN && ALWAYS(pRight->y.pTab!=0)
-+                               && IsVirtual(pRight->y.pTab))
-       ){
--       return WRC_Prune;
-+        return WRC_Prune;
-       }
--
-+    }
-     default:
-       return WRC_Continue;
-   }
-@@ -142591,7 +142600,8 @@ static int isAuxiliaryVtabOperator(
-     **       MATCH(expression,vtab_column)
-     */
-     pCol = pList->a[1].pExpr;
--    if( pCol->op==TK_COLUMN && IsVirtual(pCol->y.pTab) ){
-+    testcase( pCol->op==TK_COLUMN && pCol->y.pTab==0 );
-+    if( ExprIsVtab(pCol) ){
-       for(i=0; i<ArraySize(aOp); i++){
-         if( sqlite3StrICmp(pExpr->u.zToken, aOp[i].zOp)==0 ){
-           *peOp2 = aOp[i].eOp2;
-@@ -142613,7 +142623,8 @@ static int isAuxiliaryVtabOperator(
-     ** with function names in an arbitrary case.
-     */
-     pCol = pList->a[0].pExpr;
--    if( pCol->op==TK_COLUMN && IsVirtual(pCol->y.pTab) ){
-+    testcase( pCol->op==TK_COLUMN && pCol->y.pTab==0 );
-+    if( ExprIsVtab(pCol) ){
-       sqlite3_vtab *pVtab;
-       sqlite3_module *pMod;
-       void (*xNotUsed)(sqlite3_context*,int,sqlite3_value**);
-@@ -142636,10 +142647,12 @@ static int isAuxiliaryVtabOperator(
-     int res = 0;
-     Expr *pLeft = pExpr->pLeft;
-     Expr *pRight = pExpr->pRight;
--    if( pLeft->op==TK_COLUMN && IsVirtual(pLeft->y.pTab) ){
-+    testcase( pLeft->op==TK_COLUMN && pLeft->y.pTab==0 );
-+    if( ExprIsVtab(pLeft) ){
-       res++;
-     }
--    if( pRight && pRight->op==TK_COLUMN && IsVirtual(pRight->y.pTab) ){
-+    testcase( pRight && pRight->op==TK_COLUMN && pRight->y.pTab==0 );
-+    if( pRight && ExprIsVtab(pRight) ){
-       res++;
-       SWAP(Expr*, pLeft, pRight);
-     }
-@@ -228440,7 +228453,7 @@ SQLITE_API int sqlite3_stmt_init(
- #endif /* !defined(SQLITE_CORE) || defined(SQLITE_ENABLE_STMTVTAB) */
- 
- /************** End of stmt.c ************************************************/
--#if __LINE__!=228443
-+#if __LINE__!=228456
- #undef SQLITE_SOURCE_ID
- #define SQLITE_SOURCE_ID      "2020-01-27 19:55:54 3bfa9cc97da10598521b342961df8f5f68c7388fa117345eeb516eaa837balt2"
- #endif
-diff --git a/sqlite3.h b/sqlite3.h
-index cef6eea..5b9796c 100644
---- a/sqlite3.h
-+++ b/sqlite3.h
-@@ -125,7 +125,7 @@ extern "C" {
- */
- #define SQLITE_VERSION        "3.31.1"
- #define SQLITE_VERSION_NUMBER 3031001
--#define SQLITE_SOURCE_ID      "2020-01-27 19:55:54 3bfa9cc97da10598521b342961df8f5f68c7388fa117345eeb516eaa837bb4d6"
-+#define SQLITE_SOURCE_ID      "2020-01-27 19:55:54 3bfa9cc97da10598521b342961df8f5f68c7388fa117345eeb516eaa837balt1"
- 
- /*
- ** CAPI3REF: Run-Time Library Version Numbers
--- 
-2.25.1
-
diff --git a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb b/meta/recipes-support/sqlite/sqlite3_3.32.1.bb
similarity index 50%
rename from meta/recipes-support/sqlite/sqlite3_3.31.1.bb
rename to meta/recipes-support/sqlite/sqlite3_3.32.1.bb
index 57a791385c..d6081f10ad 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.32.1.bb
@@ -3,13 +3,9 @@ require sqlite3.inc
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
-SRC_URI = "http://www.sqlite.org/2020/sqlite-autoconf-${SQLITE_PV}.tar.gz \
-           file://CVE-2020-9327.patch \
-           file://CVE-2020-11656.patch \
-           file://CVE-2020-11655.patch \
-           "
-SRC_URI[md5sum] = "2d0a553534c521504e3ac3ad3b90f125"
-SRC_URI[sha256sum] = "62284efebc05a76f909c580ffa5c008a7d22a1287285d68b7825a2b6b51949ae"
+SRC_URI = "http://www.sqlite.org/2020/sqlite-autoconf-${SQLITE_PV}.tar.gz"
+SRC_URI[md5sum] = "bc7afc06f1e30b09ac930957af68d723"
+SRC_URI[sha256sum] = "486748abfb16abd8af664e3a5f03b228e5f124682b0c942e157644bf6fff7d10"
 
 # -19242 is only an issue in specific development branch commits
 CVE_CHECK_WHITELIST += "CVE-2019-19242"
-- 
2.17.1




Return-Path: <anuj.mittal@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A421A60C1E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2020 00:45:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2020 17:45:07 -0700
X-IronPort-AV: E=Sophos;i="5.70,530,1574150400"; d="scan'208";a="245196888"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.141.167])
	by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2020 17:45:06 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Mar 2020 08:45:00 +0800
Message-Id: <20200309004502.4096343-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH 1/3] sqlite3: fix CVE-2020-9327
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Mar 2020 00:45:07 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../sqlite/files/CVE-2020-9327.patch          | 141 ++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.31.1.bb |   1 +
 2 files changed, 142 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2020-9327.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2020-9327.patch b/meta/recipes-support/sqlite/files/CVE-2020-9327.patch
new file mode 100644
index 0000000000..fecbbabce8
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2020-9327.patch
@@ -0,0 +1,141 @@
+From 45d491851e1bca378de158a5e279fd584ce548e4 Mon Sep 17 00:00:00 2001
+From: "D. Richard Hipp" <drh@hwaci.com>
+Date: Mon, 17 Feb 2020 00:12:04 +0000
+Subject: [PATCH] [PATCH 1/2]  Take care when checking the table of a TK_COLUMN
+  expression node to see if the table is a virtual table to first ensure that 
+ the Expr.y.pTab pointer is not null due to generated column optimizations. 
+ Ticket [4374860b29383380].
+
+FossilOrigin-Name: 9d0d4ab95dc0c56e053c2924ed322a9ea7b25439e6f74599f706905a1994e454
+
+[PATCH 2/2] A better (smaller and faster) solution to ticket
+ [4374860b29383380].
+
+FossilOrigin-Name: abc473fb8fb999005dc79a360e34f97b3b25429decf1820dd2afa5c19577753d
+
+The two patches were converted to amalgamation format
+
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+Upstream-Status: Backport
+CVE: CVE-2020-9327
+---
+ sqlite3.c | 35 ++++++++++++++++++++++++-----------
+ sqlite3.h |  2 +-
+ 2 files changed, 25 insertions(+), 12 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 55dc686..64fae04 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -1167,7 +1167,7 @@ extern "C" {
+ */
+ #define SQLITE_VERSION        "3.31.1"
+ #define SQLITE_VERSION_NUMBER 3031001
+-#define SQLITE_SOURCE_ID      "2020-01-27 19:55:54 3bfa9cc97da10598521b342961df8f5f68c7388fa117345eeb516eaa837bb4d6"
++#define SQLITE_SOURCE_ID      "2020-01-27 19:55:54 3bfa9cc97da10598521b342961df8f5f68c7388fa117345eeb516eaa837balt1"
+ 
+ /*
+ ** CAPI3REF: Run-Time Library Version Numbers
+@@ -17428,8 +17428,11 @@ struct Table {
+ */
+ #ifndef SQLITE_OMIT_VIRTUALTABLE
+ #  define IsVirtual(X)      ((X)->nModuleArg)
++#  define ExprIsVtab(X)  \
++              ((X)->op==TK_COLUMN && (X)->y.pTab!=0 && (X)->y.pTab->nModuleArg)
+ #else
+ #  define IsVirtual(X)      0
++#  define ExprIsVtab(X)     0
+ #endif
+ 
+ /*
+@@ -104133,19 +104136,25 @@ static int impliesNotNullRow(Walker *pWalker, Expr *pExpr){
+     case TK_LT:
+     case TK_LE:
+     case TK_GT:
+-    case TK_GE:
++    case TK_GE: {
++      Expr *pLeft = pExpr->pLeft;
++      Expr *pRight = pExpr->pRight;
+       testcase( pExpr->op==TK_EQ );
+       testcase( pExpr->op==TK_NE );
+       testcase( pExpr->op==TK_LT );
+       testcase( pExpr->op==TK_LE );
+       testcase( pExpr->op==TK_GT );
+       testcase( pExpr->op==TK_GE );
+-      if( (pExpr->pLeft->op==TK_COLUMN && IsVirtual(pExpr->pLeft->y.pTab))
+-       || (pExpr->pRight->op==TK_COLUMN && IsVirtual(pExpr->pRight->y.pTab))
++      /* The y.pTab=0 assignment in wherecode.c always happens after the
++      ** impliesNotNullRow() test */
++      if( (pLeft->op==TK_COLUMN && ALWAYS(pLeft->y.pTab!=0)
++                               && IsVirtual(pLeft->y.pTab))
++       || (pRight->op==TK_COLUMN && ALWAYS(pRight->y.pTab!=0)
++                               && IsVirtual(pRight->y.pTab))
+       ){
+-       return WRC_Prune;
++        return WRC_Prune;
+       }
+-
++    }
+     default:
+       return WRC_Continue;
+   }
+@@ -142591,7 +142600,8 @@ static int isAuxiliaryVtabOperator(
+     **       MATCH(expression,vtab_column)
+     */
+     pCol = pList->a[1].pExpr;
+-    if( pCol->op==TK_COLUMN && IsVirtual(pCol->y.pTab) ){
++    testcase( pCol->op==TK_COLUMN && pCol->y.pTab==0 );
++    if( ExprIsVtab(pCol) ){
+       for(i=0; i<ArraySize(aOp); i++){
+         if( sqlite3StrICmp(pExpr->u.zToken, aOp[i].zOp)==0 ){
+           *peOp2 = aOp[i].eOp2;
+@@ -142613,7 +142623,8 @@ static int isAuxiliaryVtabOperator(
+     ** with function names in an arbitrary case.
+     */
+     pCol = pList->a[0].pExpr;
+-    if( pCol->op==TK_COLUMN && IsVirtual(pCol->y.pTab) ){
++    testcase( pCol->op==TK_COLUMN && pCol->y.pTab==0 );
++    if( ExprIsVtab(pCol) ){
+       sqlite3_vtab *pVtab;
+       sqlite3_module *pMod;
+       void (*xNotUsed)(sqlite3_context*,int,sqlite3_value**);
+@@ -142636,10 +142647,12 @@ static int isAuxiliaryVtabOperator(
+     int res = 0;
+     Expr *pLeft = pExpr->pLeft;
+     Expr *pRight = pExpr->pRight;
+-    if( pLeft->op==TK_COLUMN && IsVirtual(pLeft->y.pTab) ){
++    testcase( pLeft->op==TK_COLUMN && pLeft->y.pTab==0 );
++    if( ExprIsVtab(pLeft) ){
+       res++;
+     }
+-    if( pRight && pRight->op==TK_COLUMN && IsVirtual(pRight->y.pTab) ){
++    testcase( pRight && pRight->op==TK_COLUMN && pRight->y.pTab==0 );
++    if( pRight && ExprIsVtab(pRight) ){
+       res++;
+       SWAP(Expr*, pLeft, pRight);
+     }
+@@ -228440,7 +228453,7 @@ SQLITE_API int sqlite3_stmt_init(
+ #endif /* !defined(SQLITE_CORE) || defined(SQLITE_ENABLE_STMTVTAB) */
+ 
+ /************** End of stmt.c ************************************************/
+-#if __LINE__!=228443
++#if __LINE__!=228456
+ #undef SQLITE_SOURCE_ID
+ #define SQLITE_SOURCE_ID      "2020-01-27 19:55:54 3bfa9cc97da10598521b342961df8f5f68c7388fa117345eeb516eaa837balt2"
+ #endif
+diff --git a/sqlite3.h b/sqlite3.h
+index cef6eea..5b9796c 100644
+--- a/sqlite3.h
++++ b/sqlite3.h
+@@ -125,7 +125,7 @@ extern "C" {
+ */
+ #define SQLITE_VERSION        "3.31.1"
+ #define SQLITE_VERSION_NUMBER 3031001
+-#define SQLITE_SOURCE_ID      "2020-01-27 19:55:54 3bfa9cc97da10598521b342961df8f5f68c7388fa117345eeb516eaa837bb4d6"
++#define SQLITE_SOURCE_ID      "2020-01-27 19:55:54 3bfa9cc97da10598521b342961df8f5f68c7388fa117345eeb516eaa837balt1"
+ 
+ /*
+ ** CAPI3REF: Run-Time Library Version Numbers
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
index 903d66ab29..de564e2698 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
@@ -4,6 +4,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2020/sqlite-autoconf-${SQLITE_PV}.tar.gz \
+           file://CVE-2020-9327.patch \
            "
 SRC_URI[md5sum] = "2d0a553534c521504e3ac3ad3b90f125"
 SRC_URI[sha256sum] = "62284efebc05a76f909c580ffa5c008a7d22a1287285d68b7825a2b6b51949ae"
-- 
2.24.1



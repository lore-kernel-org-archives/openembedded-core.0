Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4054BC87FD1
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 11:10:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.19254.1754392210906649740
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Aug 2025 04:10:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=031295e941=divya.chellam@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 575AV1C8622729
	for <openembedded-core@lists.openembedded.org>; Tue, 5 Aug 2025 04:10:10 -0700
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 489j6gtdbp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 04:10:10 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 5 Aug 2025 04:10:08 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][walnascar][PATCH 1/1] sqlite3: fix CVE-2025-6965
Date: Tue, 5 Aug 2025 16:39:38 +0530
Message-ID: <20250805110938.1612112-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Authority-Analysis: v=2.4 cv=d5n1yQjE c=1 sm=1 tr=0 ts=6891e692 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=2OwXVqhp2XgA:10 a=xNf9USuDAAAA:8 a=NEAV23lmAAAA:8
 a=mLKua8RHAAAA:8 a=t7CeM3EgAAAA:8 a=cBZIqdlC0Zup8oHfoQ0A:9
 a=ewTM_9iNE6a0vsrYD_ou:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: TqFLskjAOm9JoPOWy8mdAxpGNdLw0gnI
X-Proofpoint-ORIG-GUID: TqFLskjAOm9JoPOWy8mdAxpGNdLw0gnI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA4MSBTYWx0ZWRfX6aMusn3ycNSG
 Wf5edJJDHlUzk+sbS0y0ayoV8YgNtd/ARgg2/KaymSfikV3aOioAPXo54E2MPScfwRbP4BxjYI1
 FE/0wjoDWpLe7AWhfl+ZtcL3eaLcENVWw3MZg2+lwIRKcfKnF2RbRnVi8knJldv9mCXnShAup6T
 Lyqov4idWhy1EvgsWwuwts2FdaEVoZV+Wzsxow0UmE29GxZ9gN2DqAZFR4h6ggnDMi0CLGdTWYB
 F7kNKuOiepxqGu3l9GEOYZOaXXIiR+nSRgI/iRc+TArT5oTH8f+EBwEe/C2uh80b/Gh9PDapp25
 xGsusYqVsUxXwncx2kAGtGvEXD+3elKkPrfYnaWmZUkNS5UTZL+womzKKMGJ06ZnR929I8uvw86
 UxADQWUN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_03,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2508020100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 11:10:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221468

From: Divya Chellam <divya.chellam@windriver.com>

There exists a vulnerability in SQLite versions before 3.50.2 where the
number of aggregate terms could exceed the number of columns available.
This could lead to a memory corruption issue.

Reference:
https://security-tracker.debian.org/tracker/CVE-2025-6965

Upstream-patch:
https://github.com/sqlite/sqlite/commit/c52e9d97d485a3eb168e3f8f3674a7bc4b419703

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../sqlite/sqlite3/CVE-2025-6965.patch        | 117 ++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.48.0.bb |   1 +
 2 files changed, 118 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2025-6965.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2025-6965.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2025-6965.patch
new file mode 100644
index 0000000000..42fb31ed5c
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2025-6965.patch
@@ -0,0 +1,117 @@
+From c52e9d97d485a3eb168e3f8f3674a7bc4b419703 Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Fri, 27 Jun 2025 19:02:21 +0000
+Subject: [PATCH] Raise an error right away if the number of aggregate terms in
+ a query exceeds the maximum number of columns.
+
+FossilOrigin-Name: 5508b56fd24016c13981ec280ecdd833007c9d8dd595edb295b984c2b487b5c8
+
+CVE: CVE-2025-6965
+
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/c52e9d97d485a3eb168e3f8f3674a7bc4b419703]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ sqlite3.c | 30 ++++++++++++++++++++++++++----
+ 1 file changed, 26 insertions(+), 4 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 146047d..c78f58b 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -15257,6 +15257,14 @@ typedef INT16_TYPE LogEst;
+ #define LARGEST_UINT64 (0xffffffff|(((u64)0xffffffff)<<32))
+ #define SMALLEST_INT64 (((i64)-1) - LARGEST_INT64)
+ 
++/*
++** Macro SMXV(n) return the maximum value that can be held in variable n,
++** assuming n is a signed integer type.  UMXV(n) is similar for unsigned
++** integer types.
++*/
++#define SMXV(n) ((((i64)1)<<(sizeof(n)*8-1))-1)
++#define UMXV(n) ((((i64)1)<<(sizeof(n)*8))-1)
++
+ /*
+ ** Round up a number to the next larger multiple of 8.  This is used
+ ** to force 8-byte alignment on 64-bit architectures.
+@@ -19046,7 +19054,7 @@ struct AggInfo {
+                           ** from source tables rather than from accumulators */
+   u8 useSortingIdx;       /* In direct mode, reference the sorting index rather
+                           ** than the source table */
+-  u16 nSortingColumn;     /* Number of columns in the sorting index */
++  u32 nSortingColumn;     /* Number of columns in the sorting index */
+   int sortingIdx;         /* Cursor number of the sorting index */
+   int sortingIdxPTab;     /* Cursor number of pseudo-table */
+   int iFirstReg;          /* First register in range for aCol[] and aFunc[] */
+@@ -19055,8 +19063,8 @@ struct AggInfo {
+     Table *pTab;             /* Source table */
+     Expr *pCExpr;            /* The original expression */
+     int iTable;              /* Cursor number of the source table */
+-    i16 iColumn;             /* Column number within the source table */
+-    i16 iSorterColumn;       /* Column number in the sorting index */
++    int iColumn;             /* Column number within the source table */
++    int iSorterColumn;       /* Column number in the sorting index */
+   } *aCol;
+   int nColumn;            /* Number of used entries in aCol[] */
+   int nAccumulator;       /* Number of columns that show through to the output.
+@@ -116445,7 +116453,9 @@ static void findOrCreateAggInfoColumn(
+ ){
+   struct AggInfo_col *pCol;
+   int k;
++  int mxTerm = pParse->db->aLimit[SQLITE_LIMIT_COLUMN];
+ 
++  assert( mxTerm <= SMXV(i16) );
+   assert( pAggInfo->iFirstReg==0 );
+   pCol = pAggInfo->aCol;
+   for(k=0; k<pAggInfo->nColumn; k++, pCol++){
+@@ -116463,6 +116473,10 @@ static void findOrCreateAggInfoColumn(
+     assert( pParse->db->mallocFailed );
+     return;
+   }
++  if( k>mxTerm ){
++    sqlite3ErrorMsg(pParse, "more than %d aggregate terms", mxTerm);
++    k = mxTerm;
++  }
+   pCol = &pAggInfo->aCol[k];
+   assert( ExprUseYTab(pExpr) );
+   pCol->pTab = pExpr->y.pTab;
+@@ -116496,6 +116510,7 @@ fix_up_expr:
+   if( pExpr->op==TK_COLUMN ){
+     pExpr->op = TK_AGG_COLUMN;
+   }
++  assert( k <= SMXV(pExpr->iAgg) );
+   pExpr->iAgg = (i16)k;
+ }
+ 
+@@ -116580,13 +116595,19 @@ static int analyzeAggregate(Walker *pWalker, Expr *pExpr){
+         ** function that is already in the pAggInfo structure
+         */
+         struct AggInfo_func *pItem = pAggInfo->aFunc;
++        int mxTerm = pParse->db->aLimit[SQLITE_LIMIT_COLUMN];
++        assert( mxTerm <= SMXV(i16) );
+         for(i=0; i<pAggInfo->nFunc; i++, pItem++){
+           if( NEVER(pItem->pFExpr==pExpr) ) break;
+           if( sqlite3ExprCompare(0, pItem->pFExpr, pExpr, -1)==0 ){
+             break;
+           }
+         }
+-        if( i>=pAggInfo->nFunc ){
++        if( i>mxTerm ){
++          sqlite3ErrorMsg(pParse, "more than %d aggregate terms", mxTerm);
++          i = mxTerm;
++          assert( i<pAggInfo->nFunc );
++        }else if( i>=pAggInfo->nFunc ){
+           /* pExpr is original.  Make a new entry in pAggInfo->aFunc[]
+           */
+           u8 enc = ENC(pParse->db);
+@@ -116640,6 +116661,7 @@ static int analyzeAggregate(Walker *pWalker, Expr *pExpr){
+         */
+         assert( !ExprHasProperty(pExpr, EP_TokenOnly|EP_Reduced) );
+         ExprSetVVAProperty(pExpr, EP_NoReduce);
++        assert( i <= SMXV(pExpr->iAgg) );
+         pExpr->iAgg = (i16)i;
+         pExpr->pAggInfo = pAggInfo;
+         return WRC_Prune;
+-- 
+2.40.0
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb b/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
index 11f103dddc..6c9f1ed5d9 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed0
 SRC_URI = "http://www.sqlite.org/2025/sqlite-autoconf-${SQLITE_PV}.tar.gz \
     file://CVE-2025-3277.patch \
     file://CVE-2025-29088.patch \
+    file://CVE-2025-6965.patch \
 "
 SRC_URI[sha256sum] = "ac992f7fca3989de7ed1fe99c16363f848794c8c32a158dafd4eb927a2e02fd5"
 
-- 
2.40.0



Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54D5CC87FCB
	for <webhook@archiver.kernel.org>; Sun,  3 Aug 2025 08:53:06 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.14150.1754211178759838609
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Aug 2025 01:53:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=BzHCDr+/;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20250803085253fa5cc0d83002347391-4cdevl@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20250803085253fa5cc0d83002347391
        for <openembedded-core@lists.openembedded.org>;
        Sun, 03 Aug 2025 10:52:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=29Nwj3wGEiFNE4Bmdc2Ori1rwpEi4YuyX9EsI3Tiqys=;
 b=BzHCDr+/BYIBsW7HCvileGEh9Kik3m90Ytg6hy92k2PVENTCuCfPqkYbey7Rk/E8904v8y
 0B7SAc+jqPTmLCGDsP65fLXfsmMbq3Ea5wWFe3Sv6Xuzs/CVcwRtBX4RgBWXeLdew5lacud+
 LvGxRq8gC6TT69PzsnsTkAvPr/LeL5ofRLzcBrldC7Ng4PwuphOEwcU9zDiInNHp+/YR2TrV
 wmet6odq0MH7h9VSfU5uSNl9dLOhfH722ejzXgnAtmGootUChFlj4hPToMdFJ7XmI/BGGBtk
 sT6P7B/ZXmU0eaRab/gFBMClVbgx92Czt9MdDVo7v09KxwFWwZz8xjxg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] sqlite3: patch CVE-2025-7458
Date: Sun,  3 Aug 2025 10:52:07 +0200
Message-Id: <20250803085207.2273326-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Aug 2025 08:53:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221407

From: Peter Marko <peter.marko@siemens.com>

Pick patch [1] listed in [2].
Also pick another patch which is precondition to this one introducing
variable needed for the check.

[1] https://sqlite.org/src/info/12ad822d9b827777
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-7458

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...mpts-to-improve-the-detection-of-cov.patch | 91 +++++++++++++++++++
 .../sqlite/files/CVE-2025-7458.patch          | 32 +++++++
 meta/recipes-support/sqlite/sqlite3_3.38.5.bb |  2 +
 3 files changed, 125 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/0001-This-branch-attempts-to-improve-the-detection-of-cov.patch
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2025-7458.patch

diff --git a/meta/recipes-support/sqlite/files/0001-This-branch-attempts-to-improve-the-detection-of-cov.patch b/meta/recipes-support/sqlite/files/0001-This-branch-attempts-to-improve-the-detection-of-cov.patch
new file mode 100644
index 0000000000..8fb037bb0f
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/0001-This-branch-attempts-to-improve-the-detection-of-cov.patch
@@ -0,0 +1,91 @@
+From f55a7dad195994f2bb24db7df0a0515502386fe2 Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Sat, 22 Oct 2022 14:16:02 +0000
+Subject: [PATCH] This branch attempts to improve the detection of covering
+ indexes.  This first check-in merely improves a parameter name to
+ sqlite3WhereBegin() to be more descriptive of what it contains, and ensures
+ that a subroutine is not inlines so that sqlite3WhereBegin() runs slightly
+ faster.
+
+FossilOrigin-Name: cadf5f6bb1ce0492ef858ada476288e8057afd3609caa18b09c818d3845d7244
+
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/f55a7dad195994f2bb24db7df0a0515502386fe2]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ sqlite3.c | 28 +++++++++++++---------------
+ 1 file changed, 13 insertions(+), 15 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 4cbc2d0..b7ed991 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -147371,9 +147371,7 @@ struct WhereInfo {
+   ExprList *pOrderBy;       /* The ORDER BY clause or NULL */
+   ExprList *pResultSet;     /* Result set of the query */
+   Expr *pWhere;             /* The complete WHERE clause */
+-#ifndef SQLITE_OMIT_VIRTUALTABLE
+-  Select *pLimit;           /* Used to access LIMIT expr/registers for vtabs */
+-#endif
++  Select *pSelect;          /* The entire SELECT statement containing WHERE */
+   int aiCurOnePass[2];      /* OP_OpenWrite cursors for the ONEPASS opt */
+   int iContinue;            /* Jump here to continue with next record */
+   int iBreak;               /* Jump here to break out of the loop */
+@@ -149070,9 +149068,9 @@ SQLITE_PRIVATE Bitmask sqlite3WhereCodeOneLoopStart(
+          && pLoop->u.vtab.bOmitOffset
+         ){
+           assert( pTerm->eOperator==WO_AUX );
+-          assert( pWInfo->pLimit!=0 );
+-          assert( pWInfo->pLimit->iOffset>0 );
+-          sqlite3VdbeAddOp2(v, OP_Integer, 0, pWInfo->pLimit->iOffset);
++          assert( pWInfo->pSelect!=0 );
++          assert( pWInfo->pSelect->iOffset>0 );
++          sqlite3VdbeAddOp2(v, OP_Integer, 0, pWInfo->pSelect->iOffset);
+           VdbeComment((v,"Zero OFFSET counter"));
+         }
+       }
+@@ -151830,10 +151828,10 @@ static void whereAddLimitExpr(
+ ** exist only so that they may be passed to the xBestIndex method of the
+ ** single virtual table in the FROM clause of the SELECT.
+ */
+-SQLITE_PRIVATE void sqlite3WhereAddLimit(WhereClause *pWC, Select *p){
+-  assert( p==0 || (p->pGroupBy==0 && (p->selFlags & SF_Aggregate)==0) );
+-  if( (p && p->pLimit)                                          /* 1 */
+-   && (p->selFlags & (SF_Distinct|SF_Aggregate))==0             /* 2 */
++SQLITE_PRIVATE void SQLITE_NOINLINE sqlite3WhereAddLimit(WhereClause *pWC, Select *p){
++  assert( p!=0 && p->pLimit!=0 );                 /* 1 -- checked by caller */
++  assert( p->pGroupBy==0 && (p->selFlags & SF_Aggregate)==0 );
++  if( (p->selFlags & (SF_Distinct|SF_Aggregate))==0             /* 2 */
+    && (p->pSrc->nSrc==1 && IsVirtual(p->pSrc->a[0].pTab))       /* 3 */
+   ){
+     ExprList *pOrderBy = p->pOrderBy;
+@@ -157427,7 +157425,7 @@ SQLITE_PRIVATE WhereInfo *sqlite3WhereBegin(
+   Expr *pWhere,           /* The WHERE clause */
+   ExprList *pOrderBy,     /* An ORDER BY (or GROUP BY) clause, or NULL */
+   ExprList *pResultSet,   /* Query result set.  Req'd for DISTINCT */
+-  Select *pLimit,         /* Use this LIMIT/OFFSET clause, if any */
++  Select *pSelect,        /* The entire SELECT statement */
+   u16 wctrlFlags,         /* The WHERE_* flags defined in sqliteInt.h */
+   int iAuxArg             /* If WHERE_OR_SUBCLAUSE is set, index cursor number
+                           ** If WHERE_USE_LIMIT, then the limit amount */
+@@ -157504,9 +157502,7 @@ SQLITE_PRIVATE WhereInfo *sqlite3WhereBegin(
+   pWInfo->wctrlFlags = wctrlFlags;
+   pWInfo->iLimit = iAuxArg;
+   pWInfo->savedNQueryLoop = pParse->nQueryLoop;
+-#ifndef SQLITE_OMIT_VIRTUALTABLE
+-  pWInfo->pLimit = pLimit;
+-#endif
++  pWInfo->pSelect = pSelect;
+   memset(&pWInfo->nOBSat, 0,
+          offsetof(WhereInfo,sWC) - offsetof(WhereInfo,nOBSat));
+   memset(&pWInfo->a[0], 0, sizeof(WhereLoop)+nTabList*sizeof(WhereLevel));
+@@ -157575,7 +157571,9 @@ SQLITE_PRIVATE WhereInfo *sqlite3WhereBegin(
+ 
+   /* Analyze all of the subexpressions. */
+   sqlite3WhereExprAnalyze(pTabList, &pWInfo->sWC);
+-  sqlite3WhereAddLimit(&pWInfo->sWC, pLimit);
++  if( pSelect && pSelect->pLimit ){
++    sqlite3WhereAddLimit(&pWInfo->sWC, pSelect);
++  }
+   if( db->mallocFailed ) goto whereBeginError;
+ 
+   /* Special case: WHERE terms that do not refer to any tables in the join
diff --git a/meta/recipes-support/sqlite/files/CVE-2025-7458.patch b/meta/recipes-support/sqlite/files/CVE-2025-7458.patch
new file mode 100644
index 0000000000..6b041d9332
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2025-7458.patch
@@ -0,0 +1,32 @@
+From b816ca9994e03a8bc829b49452b8158a731e81a9 Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Thu, 16 Mar 2023 20:54:29 +0000
+Subject: [PATCH] Correctly handle SELECT DISTINCT ... ORDER BY when all of the
+ result set terms are constant and there are more result set terms than ORDER
+ BY terms. Fix for these tickets: [c36cdb4afd504dc1], [4051a7f931d9ba24],
+ [d6fd512f50513ab7].
+
+FossilOrigin-Name: 12ad822d9b827777526ca5ed5bf3e678d600294fc9b5c25482dfff2a021328a4
+
+CVE: CVE-2025-7458
+Upstream-Status: Backport [github.com/sqlite/sqlite/commit/b816ca9994e03a8bc829b49452b8158a731e81a9]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ sqlite3.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 19d0438..6d92184 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -156989,6 +156989,10 @@ static int wherePathSolver(WhereInfo *pWInfo, LogEst nRowEst){
+       if( pFrom->isOrdered==pWInfo->pOrderBy->nExpr ){
+         pWInfo->eDistinct = WHERE_DISTINCT_ORDERED;
+       }
++      if( pWInfo->pSelect->pOrderBy
++       && pWInfo->nOBSat > pWInfo->pSelect->pOrderBy->nExpr ){
++        pWInfo->nOBSat = pWInfo->pSelect->pOrderBy->nExpr;
++      }
+     }else{
+       pWInfo->nOBSat = pFrom->isOrdered;
+       pWInfo->revMask = pFrom->revLoop;
diff --git a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
index 656e2d8bd8..86d9b4b33b 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
@@ -10,6 +10,8 @@ SRC_URI = "http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2023-7104.patch \
            file://CVE-2025-29088.patch \
            file://CVE-2025-6965.patch \
+           file://0001-This-branch-attempts-to-improve-the-detection-of-cov.patch \
+           file://CVE-2025-7458.patch \
            "
 SRC_URI[sha256sum] = "5af07de982ba658fd91a03170c945f99c971f6955bc79df3266544373e39869c"
 


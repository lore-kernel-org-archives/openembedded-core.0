Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web12.12297.1604673425994501209
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2020 06:37:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=jFqnYBdd;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id g7so1512745pfc.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2020 06:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=gY1R3z/K2ef5qsNvjdKHsC/kcv3MK7TdS93F7cdVKlk=;
        b=jFqnYBddYz8DJWvCKjeYOCeJxXeXWd1UwjFoHtZwQLTsH6VLjlfwOCNLbnlFMNqS2T
         64th2g6WSCvKSNps+dOEgSSgbsBuDOFuouMjk4vH7S5WR2vMXABlp46h/AWduubAS7f2
         d4DGmnqU8PHoLKcqorhe2EWydzpyItSKZYiwcrDtsxSP3ouPSoGDBwr7WoSnnaqHkvd4
         r22HDxtYmQ/leiAdBakBKlwaWVxTfbxZiCE1vtCZMwkovqL78B0rP/qGdvAwjtSzocPA
         Wb8/pV6UAAhQxf9sWN9dpbpOgdclSbew9XrX3jmPpxKP+kpjEqPOqoAPyjU2TFXdiDKR
         f6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=gY1R3z/K2ef5qsNvjdKHsC/kcv3MK7TdS93F7cdVKlk=;
        b=Xzo/iUTTxofQ9fnrF77GxTw89Pk/xEHG/pU8QkINfQzaGV1YlYJaHNCwK39LB4vCn1
         bAvzqLEuSN7LvUboEKoxOTTbnciGWRLqiZP4SQbf8rOTdDyvuMrcGoYnnBtXHqkDxD4k
         W5EiRNvuD+JlXRhlvkHPvebF5DqlUNmIcmgvyQAQ4Us58lDMXRI9LCX5bUmJroncyH6c
         QHeUXJN769Fym+y0qIR2Nw7hbq1xZ4HCdeNP0SdFXtAieeqk3zkOxehYOFEoS+ntxAEC
         02v8WqKpKg6pWZ2G9TqQF6k5tlBmb983O9UHHBkG5uJ5VkL2wzuI5fjjU3TgXfjO3ko3
         kxvQ==
X-Gm-Message-State: AOAM530zUEoSc0mHarcWLB7pPOoelr+fTjoLm4ZwWNYjnz6Oh8g1YSAk
	jQOT0qUm2hU+kVMIi4zirvFhbg3X2GVN++oq
X-Google-Smtp-Source: ABdhPJx7nf+y9vp+Dgk9KAtBmfMv/v8bAXN+pDYcJOTaKpkTYaKLRGwFuY4feti+zC7+mXr6awUZ/w==
X-Received: by 2002:a63:e:: with SMTP id 14mr1932415pga.253.1604673424964;
        Fri, 06 Nov 2020 06:37:04 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id jy19sm2765166pjb.9.2020.11.06.06.37.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 06:37:04 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/20] sqlite3: fix CVE-2020-13435
Date: Fri,  6 Nov 2020 04:35:32 -1000
Message-Id: <4780662ebaba0931ac0084d40670d9be93c0da9b.1604672839.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1604672838.git.steve@sakoman.com>
References: <cover.1604672838.git.steve@sakoman.com>

CVE: CVE-2020-13435

Reference: https://nvd.nist.gov/vuln/detail/CVE-2020-13435

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../sqlite/files/CVE-2020-13435.patch         | 219 ++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.31.1.bb |   1 +
 2 files changed, 220 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2020-13435.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2020-13435.patch b/meta/recipes-support/sqlite/files/CVE-2020-13435.patch
new file mode 100644
index 0000000000..d726e50a27
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2020-13435.patch
@@ -0,0 +1,219 @@
+From e40cc16b472071f553700c7208394e6cf73d5688 Mon Sep 17 00:00:00 2001
+From: drh <drh@noemail.net>
+Date: Sun, 24 May 2020 03:01:36 +0000
+Subject: [PATCH] Combination of patches to fix CVE2020-13435
+
+Combines:
+
+Move some utility Walker callbacks into the walker.c source file, as they seem to belong there better.
+When rewriting a query for window functions, if the rewrite changes the depth of TK_AGG_FUNCTION nodes, be sure to adjust the Expr.op2 field appropriately. Fix for ticket [7a5279a25c57adf1]
+Defensive code that tries to prevent a recurrence of problems like the one described in ticket [7a5279a25c57adf1]
+
+FossilOrigin-Name: dac438236f7c5419d4e7e094e8b3f19f83cd3b1a18bc8acb14aee90d4514fa3c
+FossilOrigin-Name: ad7bb70af9bb68d192137188bb2528f1e9e43ad164c925174ca1dafc9e1f5339
+FossilOrigin-Name: 572105de1d44bca4f18c99d373458889163611384eebbc9659474874ee1701f4
+
+Upstream-Status: Backport
+CVE: CVE-2020-13435
+
+Reference to upstream patches:
+https://github.com/sqlite/sqlite/commit/e40cc16b472071f553700c7208394e6cf73d5688
+https://github.com/sqlite/sqlite/commit/c37577bb2dfb602a5cdbba8322a01b548c34c185
+https://github.com/sqlite/sqlite/commit/0934d640456bb168a8888ae388643c5160afe501
+
+Patches combined and converted to amalgamation format
+
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+---
+diff --git a/sqlite3.c b/sqlite3.c
+index 5ff2c14..02892f8 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -18965,6 +18965,9 @@ SQLITE_PRIVATE int sqlite3WalkSelectFrom(Walker*, Select*);
+ SQLITE_PRIVATE int sqlite3ExprWalkNoop(Walker*, Expr*);
+ SQLITE_PRIVATE int sqlite3SelectWalkNoop(Walker*, Select*);
+ SQLITE_PRIVATE int sqlite3SelectWalkFail(Walker*, Select*);
++SQLITE_PRIVATE int sqlite3WalkerDepthIncrease(Walker*,Select*);
++SQLITE_PRIVATE void sqlite3WalkerDepthDecrease(Walker*,Select*);
++
+ #ifdef SQLITE_DEBUG
+ SQLITE_PRIVATE void sqlite3SelectWalkAssert2(Walker*, Select*);
+ #endif
+@@ -96773,6 +96776,43 @@ SQLITE_PRIVATE int sqlite3WalkSelect(Walker *pWalker, Select *p){
+   return WRC_Continue;
+ }
+ 
++/* Increase the walkerDepth when entering a subquery, and
++** descrease when leaving the subquery.
++*/
++SQLITE_PRIVATE int sqlite3WalkerDepthIncrease(Walker *pWalker, Select *pSelect){
++  UNUSED_PARAMETER(pSelect);
++  pWalker->walkerDepth++;
++  return WRC_Continue;
++}
++SQLITE_PRIVATE void sqlite3WalkerDepthDecrease(Walker *pWalker, Select *pSelect){
++  UNUSED_PARAMETER(pSelect);
++  pWalker->walkerDepth--;
++}
++
++
++/*
++** No-op routine for the parse-tree walker.
++**
++** When this routine is the Walker.xExprCallback then expression trees
++** are walked without any actions being taken at each node.  Presumably,
++** when this routine is used for Walker.xExprCallback then 
++** Walker.xSelectCallback is set to do something useful for every 
++** subquery in the parser tree.
++*/
++SQLITE_PRIVATE int sqlite3ExprWalkNoop(Walker *NotUsed, Expr *NotUsed2){
++  UNUSED_PARAMETER2(NotUsed, NotUsed2);
++  return WRC_Continue;
++}
++
++/*
++** No-op routine for the parse-tree walker for SELECT statements.
++** subquery in the parser tree.
++*/
++SQLITE_PRIVATE int sqlite3SelectWalkNoop(Walker *NotUsed, Select *NotUsed2){
++  UNUSED_PARAMETER2(NotUsed, NotUsed2);
++  return WRC_Continue;
++}
++
+ /************** End of walker.c **********************************************/
+ /************** Begin file resolve.c *****************************************/
+ /*
+@@ -96801,6 +96841,8 @@ SQLITE_PRIVATE int sqlite3WalkSelect(Walker *pWalker, Select *p){
+ **
+ ** incrAggFunctionDepth(pExpr,n) is the main routine.  incrAggDepth(..)
+ ** is a helper function - a callback for the tree walker.
++**
++** See also the sqlite3WindowExtraAggFuncDepth() routine in window.c
+ */
+ static int incrAggDepth(Walker *pWalker, Expr *pExpr){
+   if( pExpr->op==TK_AGG_FUNCTION ) pExpr->op2 += pWalker->u.n;
+@@ -102459,7 +102501,10 @@ expr_code_doover:
+   switch( op ){
+     case TK_AGG_COLUMN: {
+       AggInfo *pAggInfo = pExpr->pAggInfo;
+-      struct AggInfo_col *pCol = &pAggInfo->aCol[pExpr->iAgg];
++      struct AggInfo_col *pCol;
++      assert( pAggInfo!=0 );
++      assert( pExpr->iAgg>=0 && pExpr->iAgg<pAggInfo->nColumn );
++      pCol = &pAggInfo->aCol[pExpr->iAgg];
+       if( !pAggInfo->directMode ){
+         assert( pCol->iMem>0 );
+         return pCol->iMem;
+@@ -102753,7 +102798,10 @@ expr_code_doover:
+     }
+     case TK_AGG_FUNCTION: {
+       AggInfo *pInfo = pExpr->pAggInfo;
+-      if( pInfo==0 ){
++      if( pInfo==0
++       || NEVER(pExpr->iAgg<0)
++       || NEVER(pExpr->iAgg>=pInfo->nFunc)
++      ){
+         assert( !ExprHasProperty(pExpr, EP_IntValue) );
+         sqlite3ErrorMsg(pParse, "misuse of aggregate: %s()", pExpr->u.zToken);
+       }else{
+@@ -104492,15 +104540,6 @@ static int analyzeAggregate(Walker *pWalker, Expr *pExpr){
+   }
+   return WRC_Continue;
+ }
+-static int analyzeAggregatesInSelect(Walker *pWalker, Select *pSelect){
+-  UNUSED_PARAMETER(pSelect);
+-  pWalker->walkerDepth++;
+-  return WRC_Continue;
+-}
+-static void analyzeAggregatesInSelectEnd(Walker *pWalker, Select *pSelect){
+-  UNUSED_PARAMETER(pSelect);
+-  pWalker->walkerDepth--;
+-}
+ 
+ /*
+ ** Analyze the pExpr expression looking for aggregate functions and
+@@ -104514,8 +104553,8 @@ static void analyzeAggregatesInSelectEnd(Walker *pWalker, Select *pSelect){
+ SQLITE_PRIVATE void sqlite3ExprAnalyzeAggregates(NameContext *pNC, Expr *pExpr){
+   Walker w;
+   w.xExprCallback = analyzeAggregate;
+-  w.xSelectCallback = analyzeAggregatesInSelect;
+-  w.xSelectCallback2 = analyzeAggregatesInSelectEnd;
++  w.xSelectCallback = sqlite3WalkerDepthIncrease;
++  w.xSelectCallback2 = sqlite3WalkerDepthDecrease;
+   w.walkerDepth = 0;
+   w.u.pNC = pNC;
+   w.pParse = 0;
+@@ -133065,29 +133104,6 @@ static int selectExpander(Walker *pWalker, Select *p){
+   return WRC_Continue;
+ }
+ 
+-/*
+-** No-op routine for the parse-tree walker.
+-**
+-** When this routine is the Walker.xExprCallback then expression trees
+-** are walked without any actions being taken at each node.  Presumably,
+-** when this routine is used for Walker.xExprCallback then 
+-** Walker.xSelectCallback is set to do something useful for every 
+-** subquery in the parser tree.
+-*/
+-SQLITE_PRIVATE int sqlite3ExprWalkNoop(Walker *NotUsed, Expr *NotUsed2){
+-  UNUSED_PARAMETER2(NotUsed, NotUsed2);
+-  return WRC_Continue;
+-}
+-
+-/*
+-** No-op routine for the parse-tree walker for SELECT statements.
+-** subquery in the parser tree.
+-*/
+-SQLITE_PRIVATE int sqlite3SelectWalkNoop(Walker *NotUsed, Select *NotUsed2){
+-  UNUSED_PARAMETER2(NotUsed, NotUsed2);
+-  return WRC_Continue;
+-}
+-
+ #if SQLITE_DEBUG
+ /*
+ ** Always assert.  This xSelectCallback2 implementation proves that the
+@@ -150225,6 +150241,23 @@ static ExprList *exprListAppendList(
+   return pList;
+ }
+ 
++/*
++** When rewriting a query, if the new subquery in the FROM clause
++** contains TK_AGG_FUNCTION nodes that refer to an outer query,
++** then we have to increase the Expr->op2 values of those nodes
++** due to the extra subquery layer that was added.
++**
++** See also the incrAggDepth() routine in resolve.c
++*/
++static int sqlite3WindowExtraAggFuncDepth(Walker *pWalker, Expr *pExpr){
++  if( pExpr->op==TK_AGG_FUNCTION
++   && pExpr->op2>=pWalker->walkerDepth
++  ){
++    pExpr->op2++;
++  }
++  return WRC_Continue;
++}
++
+ /*
+ ** If the SELECT statement passed as the second argument does not invoke
+ ** any SQL window functions, this function is a no-op. Otherwise, it 
+@@ -150333,6 +150366,7 @@ SQLITE_PRIVATE int sqlite3WindowRewrite(Parse *pParse, Select *p){
+     p->pSrc = sqlite3SrcListAppend(pParse, 0, 0, 0);
+     if( p->pSrc ){
+       Table *pTab2;
++      Walker w;
+       p->pSrc->a[0].pSelect = pSub;
+       sqlite3SrcListAssignCursors(pParse, p->pSrc);
+       pSub->selFlags |= SF_Expanded;
+@@ -150347,6 +150381,11 @@ SQLITE_PRIVATE int sqlite3WindowRewrite(Parse *pParse, Select *p){
+         pTab->tabFlags |= TF_Ephemeral;
+         p->pSrc->a[0].pTab = pTab;
+         pTab = pTab2;
++        memset(&w, 0, sizeof(w));
++        w.xExprCallback = sqlite3WindowExtraAggFuncDepth;
++        w.xSelectCallback = sqlite3WalkerDepthIncrease;
++        w.xSelectCallback2 = sqlite3WalkerDepthDecrease;
++        sqlite3WalkSelect(&w, pSub);
+       }
+     }else{
+       sqlite3SelectDelete(db, pSub);
diff --git a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
index c8225fff15..4ef1da703b 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
@@ -9,6 +9,7 @@ SRC_URI = "http://www.sqlite.org/2020/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2020-11655.patch \
            file://CVE-2020-15358.patch \
            file://CVE-2020-13434.patch \
+           file://CVE-2020-13435.patch \
            "
 SRC_URI[md5sum] = "2d0a553534c521504e3ac3ad3b90f125"
 SRC_URI[sha256sum] = "62284efebc05a76f909c580ffa5c008a7d22a1287285d68b7825a2b6b51949ae"
-- 
2.17.1


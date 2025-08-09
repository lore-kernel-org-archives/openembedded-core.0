Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD44ACA0EC1
	for <webhook@archiver.kernel.org>; Sat,  9 Aug 2025 14:44:31 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.7606.1754750671142169669
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Aug 2025 07:44:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=UWIdFDhJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-76bf3dafaa5so3964524b3a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 09 Aug 2025 07:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1754750670; x=1755355470; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eO4+FmG8t07guRkDESvczjmYXSFj5/tHWcQ3jhV2tBk=;
        b=UWIdFDhJGiDeTSr88f8cSMiqKBceDDLVsyoxxavjD40+y9pTkmNu6CX49Gw50wB59e
         ag5bl27JnYnXjIkQx54W42oqi1VPWkJT8LYyuTZkXjC5u1p461mq/WTeQkv4WfoSTINH
         BJShR2JtpryUVuv553L+dgi3rN8BFJanOCWcE7QLAnKSMJXnp4WOH7u8wi/Og2Djpwve
         slmySmdYMRmcWj3b/NcsjY/pYZwXGQD1Tf63P7CQ+9PJDTpMX48WoHsotH5SuQ5kYYNj
         26o7EheNt0Zja8FxSSAswIrPZCEveqQL7gbJQAN1a3TgZ0GJTORX/kv/RX9vinJpCZst
         Mbbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754750670; x=1755355470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eO4+FmG8t07guRkDESvczjmYXSFj5/tHWcQ3jhV2tBk=;
        b=fu2R074D2Wp+JS7/uKxoCGYixqADlynnld0XZR9DRndtoGq/oo8ygNjCRBZrwBhjiM
         8ZJl48MUccedQ21pKyQqSmMTil1jd0oy2ouTW6V53wWdzaGIeoZsDj3Ty4Bdh0C+v41Q
         fKgb7TC73dVoeoszHOEFFSO5ia6aHy7P6B9yCf/I9TVW824DuQo7tphj/2m6tfLmJjLT
         tXy8OpOEAHeSdLD+B2Ic3LPnYlm9ygUQTZdZUFOdJd4J7PQUBJJ7v9ZSdXpzNjkTyNlz
         jZxqfr3Cnwk+HTMzjz1CXTjnHwCYQc5toXwKfhJ2GU6v9o2WX4XgEmvo14/Z0gkLvhNT
         gGXw==
X-Gm-Message-State: AOJu0YyyvWpltECQENDKCHgI3kvYW/39/Em3/qcvyrEg/21jeZ2QpUYJ
	VQARheZ1z6ZxVxu+abtzhku22oVELJiKA42PXwyla8tVapi7DGvrdHc2ZqC5kxJsfTyioxIdTpT
	qpCoC
X-Gm-Gg: ASbGncu0KSXV8eFk+1LnKUq1jirKjB3HPPUO/D+MY6UingHKKGCYx8m+KZOVQN/7YOD
	HathUd4mrVi/nOS/KtGM7htkZRmkY1Ww/ZsHfp9j1QR4PImw2OFM1jmnHUJBm8zUblEyrum+T5W
	9Zsv/z8mePQR+HRtgeB1m4DaUsDXWO/JI+St1XwRR5prDpaXE9y0iNel1XOgZFtTMJfSJZaXPZq
	OpW7YC0FuMJzaf6t5ecKP3xxQs+9PMoziZiai3XlEnIf2MTWuGHSvAWl/VqUy5DXM7TBbuqDY7B
	+huuTCLzpsG0TPZ/mpRoeZ4avtrFPDJYRdHsvPh7Vju1i0lVZiFnTncIaQQUCk0HORbcVid45LD
	tvUrA8iDdDsUHIQ==
X-Google-Smtp-Source: AGHT+IHmZHkgRrcTZn/zinjt0wi6ApHXcZ31YUl/smdPMbEohQIbHC082BhafTvggx7iPONBP9sxbQ==
X-Received: by 2002:a05:6a20:3d82:b0:23d:48fc:652b with SMTP id adf61e73a8af0-24055662df5mr10350342637.12.1754750670182;
        Sat, 09 Aug 2025 07:44:30 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:e40b:779f:346e:b2b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b428f4c8639sm5736428a12.43.2025.08.09.07.44.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 07:44:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 2/6] sqlite3: patch CVE-2025-6965
Date: Sat,  9 Aug 2025 07:44:18 -0700
Message-ID: <de442af2a5a08518e61d0c76484a3099bac6d46d.1754750560.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754750560.git.steve@sakoman.com>
References: <cover.1754750560.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Aug 2025 14:44:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221677

From: Peter Marko <peter.marko@siemens.com>

Pick patch [1] mentioned in NVD report [2] from github mirror [3].

[1] https://www.sqlite.org/src/info/5508b56fd24016c13981ec280ecdd833007c9d8dd595edb295b984c2b487b5c8
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-6965
[3] https://github.com/sqlite/sqlite/commit/c52e9d97d485a3eb168e3f8f3674a7bc4b419703

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../sqlite/sqlite3/CVE-2025-6965.patch        | 112 ++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.48.0.bb |   1 +
 2 files changed, 113 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2025-6965.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2025-6965.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2025-6965.patch
new file mode 100644
index 0000000000..9b2f4409b3
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2025-6965.patch
@@ -0,0 +1,112 @@
+From c52e9d97d485a3eb168e3f8f3674a7bc4b419703 Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Fri, 27 Jun 2025 19:02:21 +0000
+Subject: [PATCH] Raise an error right away if the number of aggregate terms in
+ a query exceeds the maximum number of columns.
+
+FossilOrigin-Name: 5508b56fd24016c13981ec280ecdd833007c9d8dd595edb295b984c2b487b5c8
+
+CVE: CVE-2025-6965
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/c52e9d97d485a3eb168e3f8f3674a7bc4b419703]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
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
2.43.0



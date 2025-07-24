Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 643EDC87FD1
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 21:35:50 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.5245.1753392947357112036
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 14:35:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PaahxMOT;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so1454782b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 14:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753392946; x=1753997746; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oa5zTJaZA4m77/2sa2tWWx4PrS+t+PDhKVg4thpOUO0=;
        b=PaahxMOTguFRG60tSlGJJHg78NuCpDHTxwQtQpCDRPrTy3Xe+cIr5DshKwO6E56SsB
         w4WujDs8tfvq3EWPYvwx+BJNqx07eEcq3Jc8/UmyLcENhENtkAk3Jxf/5lnOCKaN0qgC
         8+/kt0/w+fdlu+dXsHELn3c/NjQxwk1Sc06B7X3K+fwhyT+P6lwkTT3JcrANdNFC/okU
         nV/wBq1vGzLrpZBSokoby6n0FtFp39iGV75RN1iqy8kxtHZMegrAWUO/WBRB7aOrpwWN
         utl3rJjd7Lo2lAipRhw8g9RSlFuaZ0phgzx2O5dBq95VB8Bm0vZccf1hUSNkkBwrFO+f
         5F1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753392946; x=1753997746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oa5zTJaZA4m77/2sa2tWWx4PrS+t+PDhKVg4thpOUO0=;
        b=N8oArCYNGkkJr4GhByRxgFj549yXT0DhB/Q08u693PtBO1+m2p1PwQ4fV05gM2nb+v
         kW6+PLLKre/kWSjnKQyKbmpmOjOhrI31glpEXhy/9RPXKPvSAK2JEHQ28PuxOhjFkbDL
         baYynNQQgDCAilMUdMfo+xReo7FNbKgNjowvO4ktWNX+RO/PMiFmnNSwE1MdryfGgcwx
         D4HsUcrDtRjl4XyZtL+fRsC20WIre3ozdK73XKEjNS/MW3+ENWJ0Fl4qRy0JJN6BCqao
         cHSEg/6X9XyGcZvRHoDLNSEaihHjZPXHzrgzhAIJHHxm35H25VMd755K/HcFJEN0U0vs
         K+rQ==
X-Gm-Message-State: AOJu0Ywe1t0MTUfNjVrx//dE3T3jbDEzl3gHhq9cdME1WOf39WcdQW0H
	Dj8PKK+MhetYwIQHIGOnSBViWJVLRVOq06Z44+2tbbP3QQU7yY7xwdf9Ed2/5Qv2MNkW8bIxeK0
	nasuI
X-Gm-Gg: ASbGncu8y6LE9Et+Vyx2E8PemIhrgiDHzc4gyKjSynn4cCTWeJxUYG1yP3U47IX7GzU
	HowwqNdoLfiG50g54Ynxw9fLa8jwac7OxlnAhutV2LUGm0QleVMEwRdWpfNWpkS/yu/Kn9QDQ/t
	XLpV5zCwCoAfEHJDW6/fT/bFQ68upZWddrDHRMoJBvoPr4IR4KUGdFbOoyQX7Umk7coRtr4z3bM
	RVI9gA1uJTNoK8Q1ElRSMFiybGUs7pKAT5fchuO/o7s4k6hGzM2lXGysk90pgtZQAAsdnvqxD1d
	wWDQjiAVrQoH9NP4c/MOjd3dEb07fyr10jRofWTcssJaQT8YqO/46SZm6yvqmtjMAHtWkRmouaY
	fDG+D0ZsAsz1+
X-Google-Smtp-Source: AGHT+IFGM6rYONSt7eEMO2gu3TKFC0uPbg+N+hcYxJKAasHYCRfTk1d61BAYgEOCxIvNvwEpyIRIBg==
X-Received: by 2002:aa7:9ec2:0:b0:736:b400:b58f with SMTP id d2e1a72fcca58-761eb23c508mr3684122b3a.0.1753392946384;
        Thu, 24 Jul 2025 14:35:46 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:e2fc:f94:bcdc:cb9e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-761ae158129sm2253735b3a.32.2025.07.24.14.35.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 14:35:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/16] sqlite3: fix CVE-2025-6965
Date: Thu, 24 Jul 2025 14:35:20 -0700
Message-ID: <43ac67fcc22e59dbc7eff2a00ae8421b952af654.1753392770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753392770.git.steve@sakoman.com>
References: <cover.1753392770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 21:35:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220877

From: Roland Kovacs <roland.kovacs@est.tech>

There exists a vulnerability in SQLite versions before 3.50.2 where the
number of aggregate terms could exceed the number of columns available.
This could lead to a memory corruption issue.

Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.42.inc                |   3 -
 .../sqlite/sqlite3/CVE-2025-6965.patch        | 112 ++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |   1 +
 3 files changed, 113 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2025-6965.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 9aa3096b4f..fb34ea9763 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -53,10 +53,7 @@ SRC_URI = "\
      file://CVE-2025-1179.patch \
      file://0022-CVE-2025-5245.patch \
      file://0022-CVE-2025-5244.patch \
-<<<<<<< HEAD
      file://0023-CVE-2025-7546.patch \
-=======
      file://0023-CVE-2025-7545.patch \
->>>>>>> binutils: Fix CVE-2025-7545
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2025-6965.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2025-6965.patch
new file mode 100644
index 0000000000..233d8697ec
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2025-6965.patch
@@ -0,0 +1,112 @@
+From a91c0d55011d06858726d4783fd16ed8ec71e793 Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Fri, 27 Jun 2025 19:02:21 +0000
+Subject: [PATCH] Raise an error right away if the number of aggregate terms in
+ a query exceeds the maximum number of columns.
+
+FossilOrigin-Name: 5508b56fd24016c13981ec280ecdd833007c9d8dd595edb295b984c2b487b5c8
+
+CVE: CVE-2025-6965
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/c52e9d97d485a3eb168e3f8f3674a7bc4b419703]
+Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
+---
+ sqlite3.c | 30 ++++++++++++++++++++++++++----
+ 1 file changed, 26 insertions(+), 4 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 1ee8de4a85..5c7c126076 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -15000,6 +15000,14 @@ typedef INT16_TYPE LogEst;
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
+@@ -18785,7 +18793,7 @@ struct AggInfo {
+                           ** from source tables rather than from accumulators */
+   u8 useSortingIdx;       /* In direct mode, reference the sorting index rather
+                           ** than the source table */
+-  u16 nSortingColumn;     /* Number of columns in the sorting index */
++  u32 nSortingColumn;     /* Number of columns in the sorting index */
+   int sortingIdx;         /* Cursor number of the sorting index */
+   int sortingIdxPTab;     /* Cursor number of pseudo-table */
+   int iFirstReg;          /* First register in range for aCol[] and aFunc[] */
+@@ -18794,8 +18802,8 @@ struct AggInfo {
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
+@@ -115162,7 +115170,9 @@ static void findOrCreateAggInfoColumn(
+ ){
+   struct AggInfo_col *pCol;
+   int k;
++  int mxTerm = pParse->db->aLimit[SQLITE_LIMIT_COLUMN];
+ 
++  assert( mxTerm <= SMXV(i16) );
+   assert( pAggInfo->iFirstReg==0 );
+   pCol = pAggInfo->aCol;
+   for(k=0; k<pAggInfo->nColumn; k++, pCol++){
+@@ -115180,6 +115190,10 @@ static void findOrCreateAggInfoColumn(
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
+@@ -115213,6 +115227,7 @@ fix_up_expr:
+   if( pExpr->op==TK_COLUMN ){
+     pExpr->op = TK_AGG_COLUMN;
+   }
++  assert( k <= SMXV(pExpr->iAgg) );
+   pExpr->iAgg = (i16)k;
+ }
+ 
+@@ -115297,13 +115312,19 @@ static int analyzeAggregate(Walker *pWalker, Expr *pExpr){
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
+@@ -115357,6 +115378,7 @@ static int analyzeAggregate(Walker *pWalker, Expr *pExpr){
+         */
+         assert( !ExprHasProperty(pExpr, EP_TokenOnly|EP_Reduced) );
+         ExprSetVVAProperty(pExpr, EP_NoReduce);
++        assert( i <= SMXV(pExpr->iAgg) );
+         pExpr->iAgg = (i16)i;
+         pExpr->pAggInfo = pAggInfo;
+         return WRC_Prune;
diff --git a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
index d39cb3805b..60a8f1449b 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed0
 SRC_URI = "http://www.sqlite.org/2024/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2025-3277.patch \
            file://CVE-2025-29088.patch \
+           file://CVE-2025-6965.patch \
           "
 SRC_URI[sha256sum] = "b2809ca53124c19c60f42bf627736eae011afdcc205bb48270a5ee9a38191531"
 
-- 
2.43.0



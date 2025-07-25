Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 225BEC87FD1
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 18:44:47 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.26638.1753469084521907433
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jul 2025 11:44:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=fTUtrP8l;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-234b9dfb842so22457285ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 11:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753469084; x=1754073884; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0/X4H1xGyV9CThq9C3i6aVwRdt+1/QHoZDnU52k1v6w=;
        b=fTUtrP8l5Ry8V5yZgl7q8pFtklRBOY13YxI+5w3pNlOW1oSEEXbqv3POx9mOkvmdxS
         CVidUKC//SlUjAvjVAQPCMOjveolXs5lKXaBsyaqAnT8toNJHel2zwoLNU9d0g9gjZXo
         pJVk/e7hVHwJbCeaNzLPU4sOLyUsvERWDp33cv3LFqKpftLq4E7fySjHkGV2dbORACHN
         Y0S4VZ2nPm6+vNRb4/3jMswnnQMq81PcTYEkDUcQs3eAnG94C7h0wDnQBW2TfF9DssLr
         NESFA8cozs3dEhIYjY7xPsuOWlLt8Qk2oBy9zGmidvReFUXqiHDbzJnth4y2yo8uLQJE
         Pbjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753469084; x=1754073884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/X4H1xGyV9CThq9C3i6aVwRdt+1/QHoZDnU52k1v6w=;
        b=cL/Gegnr70GOvja2qqi7OXmV/QjQLHd0nt/fufAo5FrljqO2p7XBidl9El1+9NqT8h
         T970phG1c1V4GGkKm4hhk01GJBc/HPyPIySXow1PLA1zeiypQLPN4JBVnRFSD/x8c3GT
         ENNjC2dXumlTCcKagg5IYt/t/Ot2e9umZ2IHo9XRcUkrmgHEwrxShnN2F/4c2jbpinkm
         QqylvvCAMykf59dl7cR6uipu9VPDU5mp2/BPX18avE1F4epYUZ6nVNx4GzSykCnkKCNi
         T9pBifB2Ii1YdB5Mt2bN8qlzlnAAl0UghNyKEcWKxnHgyzGET/IOtqVDVB36/HKv5UtG
         dtxQ==
X-Gm-Message-State: AOJu0YxiW6gwQ32pNTAQ9Bj0gWswqIbKGvBQ3d8ojinIYa4A7GUNAcin
	V0cwRaEoZEKHLcX2teqq15rYtZVizNe8GEDeBZ+UDWQ+9kBG6oU2HKvmG4pSP6dySSCse/IZSsq
	/Lk2L
X-Gm-Gg: ASbGnctFwt8BP/kg/0LvNJy1w7c+2/SPWUS79EkMJzVdCuhIKvyqz1ddcaJne1WDXec
	VOnkEvnLTBCblCANqhNrEVS4Fwz7na1h5b1KFA2UPEA6ie7dcuQ8qH+a7E9P6/r0KoZmmjsF4Ya
	MlAlOUy7ycFa8j+UlRb0+g7yaKPzXU5yFWNRJuKETh5ZirvhPmP7AC5nmlCCMtI6tJTQB3N6NDC
	u4V298tehj4dupifgTFkpEzIJWPm9AKbpEuNMwyzwWTgE1rWuNcXslxZEtNjrD1ud2Eg/Mctc0M
	UbsnhpnxiSW6YlA458SGfnIJNA+4aD/rD03F0MqBMLbwCLYJL4dY4mcEmrfiHqCwBw2nOamLhK0
	hZLaVOaRhlHYu2w==
X-Google-Smtp-Source: AGHT+IHTRI0FLLfNSC6bm2JdmcrBA8N7wKB8NLRh/bVVKWoGOIkLHUb6BmxjeiUQ/mP7vTfH1kBWuQ==
X-Received: by 2002:a17:902:db02:b0:234:966c:a2f3 with SMTP id d9443c01a7336-23fb315a9demr45226975ad.27.1753469083556;
        Fri, 25 Jul 2025 11:44:43 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:b695:a542:567c:1988])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe537f8asm2451225ad.167.2025.07.25.11.44.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 11:44:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap V2 04/16] sqlite3: fix CVE-2025-6965
Date: Fri, 25 Jul 2025 11:44:18 -0700
Message-ID: <52499a5ea3b4ba145914aca873844ab718953289.1753468892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753468892.git.steve@sakoman.com>
References: <cover.1753468892.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 18:44:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220920

From: Roland Kovacs <roland.kovacs@est.tech>

There exists a vulnerability in SQLite versions before 3.50.2 where the
number of aggregate terms could exceed the number of columns available.
This could lead to a memory corruption issue.

Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../sqlite/sqlite3/CVE-2025-6965.patch        | 112 ++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |   1 +
 2 files changed, 113 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2025-6965.patch

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



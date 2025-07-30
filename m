Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A79ECC87FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 19:06:03 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.43870.1753902358985192617
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 12:05:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=P9+7z5KA;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2403ca0313aso1850485ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 12:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753902358; x=1754507158; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cKshnvBcMwwplFI6A5saBd1rEgq9MjDLLv3jZZuF/ws=;
        b=P9+7z5KA3e7ImeHu/71JY6K1Wc4giIULW+1NArMMEDmwqR4NruVTNqoWrEO2auAZKA
         TRqhPI15d3QAOeM31d7t8yy0kLf4W300EbWMzA2kuNz1bqbhVWdNaNmPchCXslzLMppj
         b8vq8BtXjFAuVVbpiqT6pt9fACVsGCGHuCCfToeIjRSlS1V6gMKMuOFdXpBH8TmKQ/xc
         5ZF4PT1AbCJy2S0Q7tbwdU5bNNA10MROH4VPGZQkxBG+7I1qIYVs3fu0lTHTNMOoJIcc
         N9E7Rq/yP44GGBRRBMTreN2CQ+bsNYfnzaoOEfrwdFgehiBUGebxj5w5QCnnjm0AWDn7
         5qoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753902358; x=1754507158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cKshnvBcMwwplFI6A5saBd1rEgq9MjDLLv3jZZuF/ws=;
        b=jMgGiJx2uT9R0BC+zsVsj/gSpj/BxYstSSun+nI60TpoFK/W7mnc/B8s8Swqa0EmlU
         EvEz1icZn+jlo9R/ozDPleR6iJLZJv/dJIHWjH5EF/hwMuW8OW7iAitGMj9LQ4t/lPlL
         V79WSL94oUztUC+98tdrDGwxmdASM0i4T8Md01eU1i4HwLhU83Xaw95hQUZod58I9Wfb
         G52ojbW65XfKlOX3PqK6uzwGJSExyjijyzGtWjORoCeNHXZHJGDxBMExXnqwGljkCb+C
         4ZOT5d5/Dwpx68tz7SFgWD0xdrZ2BW6CaOds2AXLrCo5EAGw6elJUu6M7U/oHlVPHoM1
         23tA==
X-Gm-Message-State: AOJu0YxmxGXSCw7Rwu7VN+zwfL3BpwURppvCCwv734xhWyH7gbScpS2C
	4azusUZuSUEqOg1Er6SBGp4U0EDSgfGg7UHETssysbTi/hC5uk3Nuvg7+pgQtAMoQhsYjHH/GCl
	7CpiG
X-Gm-Gg: ASbGncsaMZXfGpoFGIGb1F8xLYqKJJ46MIdVPbedEBd4XNiW5It+esjkULZIocUh10J
	vB9gbFWuxTEPteBN1CDNj9Uk/SVPAjGXEMbfeWFuvVmIoCgd0K8xPRRkjz6JZ30Cxmi00ViYwJh
	AF7G1DqbJsHYpfzKmQ0/6ldHHUvzC0RBprayboLvf0T8VDJyNtAO0jNudciSDzwvbW4D8Pqg8kN
	vVFWp/alVIswNLlRYhIl/1VhW6Tu1sLiDyA9EMZHucI2WQUNANOmkOSlUDjNOfkv3+Zg8TtIckO
	aJHxNaJ/ZfPeRYSQSEjJXdvEtvE/d1mQuzeK21TqQztc90Psyi33dUsWOAGJobDJCNWxLlPPWsC
	yvKJTkJYMcliu
X-Google-Smtp-Source: AGHT+IH1Suo/sC7k+FM029UVpYUjVdLggJfSC2z9fhciswD6dX1icj46KgOm9jyYfDD+qX6DuZqVOg==
X-Received: by 2002:a17:903:298d:b0:23f:adfa:3a63 with SMTP id d9443c01a7336-24096aa431bmr64943315ad.16.1753902358039;
        Wed, 30 Jul 2025 12:05:58 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:58fd:da9:30d5:829a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-240a48b77d3sm22129025ad.117.2025.07.30.12.05.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 12:05:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/10] sqlite3: Fix CVE-2025-6965
Date: Wed, 30 Jul 2025 12:05:34 -0700
Message-ID: <b4a2f74ba0b40abcdf56c4b58cae5f7ce145d511.1753902181.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753902181.git.steve@sakoman.com>
References: <cover.1753902181.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 19:06:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221148

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://github.com/sqlite/sqlite/commit/c52e9d97d485a3eb168e3f8f3674a7bc4b419703

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../sqlite/files/CVE-2025-6965.patch          | 115 ++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.38.5.bb |   1 +
 2 files changed, 116 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2025-6965.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2025-6965.patch b/meta/recipes-support/sqlite/files/CVE-2025-6965.patch
new file mode 100644
index 0000000000..e3e087ed32
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2025-6965.patch
@@ -0,0 +1,115 @@
+From c52e9d97d485a3eb168e3f8f3674a7bc4b419703 Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Fri, 27 Jun 2025 19:02:21 +0000
+Subject: [PATCH] Raise an error right away if the number of aggregate terms in
+ a query exceeds the maximum number of columns.
+
+FossilOrigin-Name: 5508b56fd24016c13981ec280ecdd833007c9d8dd595edb295b984c2b487b5c8
+
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/c52e9d97d485a3eb168e3f8f3674a7bc4b419703]
+CVE: CVE-2025-6965
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ sqlite3.c | 31 +++++++++++++++++++++++++++----
+ 1 file changed, 27 insertions(+), 4 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 27bea6f..19d0438 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -14354,6 +14354,14 @@ typedef INT16_TYPE LogEst;
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
+@@ -17939,7 +17947,7 @@ struct AggInfo {
+                           ** than the source table */
+   int sortingIdx;         /* Cursor number of the sorting index */
+   int sortingIdxPTab;     /* Cursor number of pseudo-table */
+-  int nSortingColumn;     /* Number of columns in the sorting index */
++  u32 nSortingColumn;     /* Number of columns in the sorting index */
+   int mnReg, mxReg;       /* Range of registers allocated for aCol and aFunc */
+   ExprList *pGroupBy;     /* The group by clause */
+   struct AggInfo_col {    /* For each column used in source tables */
+@@ -17947,8 +17955,8 @@ struct AggInfo {
+     Expr *pCExpr;            /* The original expression */
+     int iTable;              /* Cursor number of the source table */
+     int iMem;                /* Memory location that acts as accumulator */
+-    i16 iColumn;             /* Column number within the source table */
+-    i16 iSorterColumn;       /* Column number in the sorting index */
++    int iColumn;             /* Column number within the source table */
++    int iSorterColumn;       /* Column number in the sorting index */
+   } *aCol;
+   int nColumn;            /* Number of used entries in aCol[] */
+   int nAccumulator;       /* Number of columns that show through to the output.
+@@ -108641,6 +108649,9 @@ static int analyzeAggregate(Walker *pWalker, Expr *pExpr){
+             ** is not an entry there already.
+             */
+             int k;
++            int mxTerm = pParse->db->aLimit[SQLITE_LIMIT_COLUMN];
++
++	    assert( mxTerm <= SMXV(i16) );
+             pCol = pAggInfo->aCol;
+             for(k=0; k<pAggInfo->nColumn; k++, pCol++){
+               if( pCol->iTable==pExpr->iTable &&
+@@ -108648,6 +108659,10 @@ static int analyzeAggregate(Walker *pWalker, Expr *pExpr){
+                 break;
+               }
+             }
++	    if( k>mxTerm ){
++	      sqlite3ErrorMsg(pParse, "more than %d aggregate terms", mxTerm);
++	      k = mxTerm;
++	    }
+             if( (k>=pAggInfo->nColumn)
+              && (k = addAggInfoColumn(pParse->db, pAggInfo))>=0
+             ){
+@@ -108685,6 +108700,7 @@ static int analyzeAggregate(Walker *pWalker, Expr *pExpr){
+             ExprSetVVAProperty(pExpr, EP_NoReduce);
+             pExpr->pAggInfo = pAggInfo;
+             pExpr->op = TK_AGG_COLUMN;
++	    assert( k <= SMXV(pExpr->iAgg) );
+             pExpr->iAgg = (i16)k;
+             break;
+           } /* endif pExpr->iTable==pItem->iCursor */
+@@ -108700,13 +108716,19 @@ static int analyzeAggregate(Walker *pWalker, Expr *pExpr){
+         ** function that is already in the pAggInfo structure
+         */
+         struct AggInfo_func *pItem = pAggInfo->aFunc;
++	int mxTerm = pParse->db->aLimit[SQLITE_LIMIT_COLUMN];
++	assert( mxTerm <= SMXV(i16) );
+         for(i=0; i<pAggInfo->nFunc; i++, pItem++){
+           if( pItem->pFExpr==pExpr ) break;
+           if( sqlite3ExprCompare(0, pItem->pFExpr, pExpr, -1)==0 ){
+             break;
+           }
+         }
+-        if( i>=pAggInfo->nFunc ){
++        if( i>mxTerm ){
++	  sqlite3ErrorMsg(pParse, "more than %d aggregate terms", mxTerm);
++	  i = mxTerm;
++	  assert( i<pAggInfo->nFunc );
++	}else if( i>=pAggInfo->nFunc ){
+           /* pExpr is original.  Make a new entry in pAggInfo->aFunc[]
+           */
+           u8 enc = ENC(pParse->db);
+@@ -108731,6 +108753,7 @@ static int analyzeAggregate(Walker *pWalker, Expr *pExpr){
+         */
+         assert( !ExprHasProperty(pExpr, EP_TokenOnly|EP_Reduced) );
+         ExprSetVVAProperty(pExpr, EP_NoReduce);
++	assert( i <= SMXV(pExpr->iAgg) );
+         pExpr->iAgg = (i16)i;
+         pExpr->pAggInfo = pAggInfo;
+         return WRC_Prune;
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
index f47a9871e2..656e2d8bd8 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
@@ -9,6 +9,7 @@ SRC_URI = "http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2023-36191.patch \
            file://CVE-2023-7104.patch \
            file://CVE-2025-29088.patch \
+           file://CVE-2025-6965.patch \
            "
 SRC_URI[sha256sum] = "5af07de982ba658fd91a03170c945f99c971f6955bc79df3266544373e39869c"
 
-- 
2.43.0



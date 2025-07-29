Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F048FC87FC9
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 10:02:10 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.3447.1753783325907342707
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 03:02:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=MzTi5mGU;
 spf=pass (domain: mvista.com, ip: 209.85.210.177, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7682560a2f2so901844b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 03:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1753783325; x=1754388125; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=50km3meZO7K0bUDOXfHjSs1j6PSVorXZFwP79x7Eh/0=;
        b=MzTi5mGUTML2KAk0pqf0O5SeS1+CJqMcekZCBXW8qzXX+hPLrBaOBuUa0GDHbGHtgn
         P3I4T/C58fDBvCrse++ZeMai7Z1wxUOLt7JO4jiszSltvdD1bpkuUoZhPD586yT6NwBG
         aKY1iHaHHBpxsbyOXrBQQg2JD3sJxEtDBGNjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753783325; x=1754388125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=50km3meZO7K0bUDOXfHjSs1j6PSVorXZFwP79x7Eh/0=;
        b=nPpeuDlbS301dI+tBQQPs+RNtg4EheJNVdEe+g9FxwkIui2enXz2/j+x89vo95vhVR
         V+gFtZupSlT+EKUjIkmr3BqYS/lSItcnE2OPBKzOV9fWQpRzVovZvqwyhoHk2SQm8Szy
         zi3etpXGs2yGvBEkSNJT2oONw1F88NbV+JAFrWpf5wLMemMnPcJSl2VXpLkF+YFoxewa
         vxSaKXd3HiuGcjKPe/czwMNyokjZwg3F7f39Pv9kbudOUeJP7TC1BHbYVwLZSMv9pTjY
         ZqErXz2+uZAcMaAdrvhTAjBnJqVObA8kLnAVJt8r8WQI8c0VqhhmFoMCpm53KPVrPyfi
         H0qQ==
X-Gm-Message-State: AOJu0Yzk3vvETxUHzwl5xJCesZcOr4OFKnDux3NuPO1HmjI825BIlKQC
	UaVLRmfhXXObsSPQoRCxxWH+Vog0YWjbNeiFFLZHYt4JBaSxPf26SbOzgw0RGnjdTZ6SoTv5b7F
	kQW1C
X-Gm-Gg: ASbGncuxccif1asrpuRYKRrsQWthkP5R1yjqBvU1OzvARr2saqM+EuXbuxovQGOMpnK
	9MS2iNlq9iqokK3wZ/v6wuGR9WJ5sVGenpjqgyroDT2mDM6MNZ3UtpmtMZxTLksqa6tWvWs4sE8
	ziEN+iNHHEHr59ko+aHdMejxD0cHNCQ37Ivc1ZyfZ2EF4rKKfDxken41z9BdI3zZUPopPd1UOuA
	RYlPZIPFdyaWPqeGAmWZFwO+JRJ5qSwTiv0FygVTaspX3+hDNOISyst0zhyTuC+6NW+SCOJbFi8
	Q8U9snmbcSVEdJVtcVWV+NfqEUQKoL8q8cPhSGQiO/6y432DmZj7js6KA8CJ7XcuENlxk/3E3jT
	gi2jelGzWcrWYg/XQ/+ZLHy+y9XagBs+uSw==
X-Google-Smtp-Source: AGHT+IEGN5IeQayBb8ThZbWVYcwWCQhxyvWmpTqF2bQJhDxt6OmpoRu77ZezLUaGM85rZhUeEdmIig==
X-Received: by 2002:a05:6a21:3394:b0:220:1843:3b7b with SMTP id adf61e73a8af0-23dadb4b969mr4946386637.4.1753783324699;
        Tue, 29 Jul 2025 03:02:04 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.195.239])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640ad06762sm7676614b3a.80.2025.07.29.03.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 03:02:04 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] sqlite3: Fix CVE-2025-6965
Date: Tue, 29 Jul 2025 15:31:56 +0530
Message-Id: <20250729100156.2323541-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 10:02:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221055

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://github.com/sqlite/sqlite/commit/c52e9d97d485a3eb168e3f8f3674a7bc4b419703

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
2.25.1



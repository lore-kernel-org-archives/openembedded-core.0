Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C54FD74955
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 03:23:36 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9352.1766114612859513943
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 19:23:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KuV9t2Nd;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a2ea96930cso11693885ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 19:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766114612; x=1766719412; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=74ziLZQdwvJLKpm1y1kgiF/wh/XACFYW27SoMnjwPNg=;
        b=KuV9t2NdGsz427PW0DB3P4j2SIfk9WoaFts/aWXo9H3rpISUXJKgeBfaC7iLnv4G0a
         rDKKCdlCmqpDKLlIFJXwqLtYmQiwUbUcCy6qKX1qo1kYZBIu2ow/rfgScjPKcUl5R5bv
         5TSIpodZ2pr9rJkNt/vu/FMGJhkJ06yqGVidsoylE1Dx1Ve6l8yHm7IjG4/nTyUrS1O+
         3Gl+7K75tJg7gu3xin6jCLtw2M04s96LDMH/1rcnasN8/Y4KRyA1niftky6pnsZ6Rxnp
         ikCSajFii7zZrzLjO3PJew2q1p2D60SAXVLB7qWMvFtMCFkUV/ZyS4uOn41AELW4Szuq
         beXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766114612; x=1766719412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=74ziLZQdwvJLKpm1y1kgiF/wh/XACFYW27SoMnjwPNg=;
        b=wfZZJDDVFvdkqWI9/lxKkDjcGoP/vSP8JME8a91YQOCfl6lLe0hIFU3hQeOJ+DQqme
         D83ARpGQ3I7LSi6HTFvRiPVfu1tHUoSWJ5KRXRGKTXdece3Tir0t3ej4IdTFb2r15EtE
         qBvIc5feMxaP3HlGuQ0LosQIBz1ciu2L0h7pSLJpqhf53U3JaYFgTQdmraB/uF9LpENl
         GpMz8vAIQe2afRAJFjjtpVPrNQEkQXA0tTLLZMOZlNDk3RM0AAqsMImTW4x+MPtmNxZJ
         9NwqizqFKbkp5+9N2r+fUMRew2PYvoOKY/SZ5H+PHAETzbuIxp9q6Cl+juyc1ZkQv9Wb
         IHew==
X-Gm-Message-State: AOJu0Yxmg7doJuz7mcvn64KVbhRj+FBvcvAkbDNWXsDWGOcsaWLX9FVz
	AEGe/cRaLL40aPAz2OBYBWvQGTuKhNgT4f/q1fXq9343h3AjevVjPVLts22jcw==
X-Gm-Gg: AY/fxX5Vquf4jtfFXGlZT87TzAnjz+wrBswIvMpXIeC63U/gvbrb+DAhfDQQg89VPeh
	9fBP9DcapYmWjyEy1oeErrAQxxW3L5CwQfR9fnuRAdlazCWo8ukA+v5U4PANALJhhHaCJAQlVbg
	AcpKXw5bZTxq1O4zaTmlufifyWBdM89wb3lMtpVFerrvEMWvFmIshzN1CtQJ59rc9jjqBIq1bH2
	fsA/Bf4MWZ9NJTKqFDkPucDARY4AlmEjj+neUkoXxBoBWVTOx3ivB4KV6/47hILJFc+2Uk7mUDQ
	n2PDo+9gXlxFKrTfEDMfmKHelLNKOlN33/6s3aSlI97u87KVDPObrt3x8aeU5u0XufntLdN3Q6I
	aUJ1x9I7xJyayag9pNtxgfjZwBhDr4FwP7JLSYrDjYBwb/2Ab92jKJHoaj4EPuqRAL9YJI0x0Hs
	0SN3TiEgW1fZF0C2BzdTfcGv0x
X-Google-Smtp-Source: AGHT+IFbbvL+2clH04P3QPJUHcfhFBt4Bqb5HJBiGMysADlOXFXjVchODOaojprHja09Uz//CUWC4g==
X-Received: by 2002:a17:902:ccd1:b0:2a1:3dae:8f22 with SMTP id d9443c01a7336-2a2f2a4f425mr12104675ad.61.1766114611973;
        Thu, 18 Dec 2025 19:23:31 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b12a7dasm753360b3a.22.2025.12.18.19.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 19:23:31 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH v2 29/29] sqlite3: patch CVE-2025-6965
Date: Fri, 19 Dec 2025 08:52:08 +0530
Message-ID: <20251219032209.960840-30-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
References: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 03:23:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228197

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2025-6965

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../sqlite/files/CVE-2025-6965.patch          | 117 ++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.48.0.bb |   1 +
 2 files changed, 118 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2025-6965.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2025-6965.patch b/meta/recipes-support/sqlite/files/CVE-2025-6965.patch
new file mode 100644
index 0000000000..510155dc27
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2025-6965.patch
@@ -0,0 +1,117 @@
+From a96cef81fdb28deada1e788d4b8248c8d5db9854 Mon Sep 17 00:00:00 2001
+From: Ankur Tyagi <ankur.tyagi85@gmail.com>
+Date: Fri, 19 Dec 2025 00:11:46 +0530
+Subject: [PATCH] Raise an error right away if the number of aggregate terms in
+ a query exceeds the maximum number of columns.
+
+FossilOrigin-Name: 5508b56fd24016c13981ec280ecdd833007c9d8dd595edb295b984c2b487b5c8
+
+Macro SMXV and UMXV were introduced by following commit:
+https://github.com/sqlite/sqlite/commit/ef86b942b9ffbfc2086da7865effea3e7950c7a0#diff-1c98d9decb23a7ef76f550fa8bced43ea6267338174cef9465d1b990ac3fb80e
+
+CVE: CVE-2025-6965
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/c52e9d97d485a3eb168e3f8f3674a7bc4b419703]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ sqlite3.c | 31 +++++++++++++++++++++++++++----
+ 1 file changed, 27 insertions(+), 4 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 8a43734131..98d8106d6a 100644
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
+@@ -116463,6 +116473,11 @@ static void findOrCreateAggInfoColumn(
+     assert( pParse->db->mallocFailed );
+     return;
+   }
++
++  if( k>mxTerm ){
++    sqlite3ErrorMsg(pParse, "more than %d aggregate terms", mxTerm);
++    k = mxTerm;
++  }
+   pCol = &pAggInfo->aCol[k];
+   assert( ExprUseYTab(pExpr) );
+   pCol->pTab = pExpr->y.pTab;
+@@ -116496,6 +116511,7 @@ fix_up_expr:
+   if( pExpr->op==TK_COLUMN ){
+     pExpr->op = TK_AGG_COLUMN;
+   }
++  assert( k <= SMXV(pExpr->iAgg) );
+   pExpr->iAgg = (i16)k;
+ }
+ 
+@@ -116580,13 +116596,19 @@ static int analyzeAggregate(Walker *pWalker, Expr *pExpr){
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
+@@ -116640,6 +116662,7 @@ static int analyzeAggregate(Walker *pWalker, Expr *pExpr){
+         */
+         assert( !ExprHasProperty(pExpr, EP_TokenOnly|EP_Reduced) );
+         ExprSetVVAProperty(pExpr, EP_NoReduce);
++        assert( i <= SMXV(pExpr->iAgg) );
+         pExpr->iAgg = (i16)i;
+         pExpr->pAggInfo = pAggInfo;
+         return WRC_Prune;
diff --git a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb b/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
index 4988231a0c..c9ff062255 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed0
 
 SRC_URI = "http://www.sqlite.org/2025/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2025-3277.patch \
+           file://CVE-2025-6965.patch \
 "
 SRC_URI[sha256sum] = "ac992f7fca3989de7ed1fe99c16363f848794c8c32a158dafd4eb927a2e02fd5"
 


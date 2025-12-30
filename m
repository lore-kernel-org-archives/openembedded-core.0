Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F294EE49AB
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 20:12:25 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71731.1767125539491426570
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 12:12:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YtlBZY3H;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a09757004cso131621625ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 12:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767125539; x=1767730339; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pMQIVBCIMij/H03eiaiTjUin23/3vu/kaRSdAhgDGd0=;
        b=YtlBZY3HauvdvmVFmgrhF5+8jjxcKZjnN4LuNTJK/Bk60NDV9y/3wwQwW6BIaXm+dZ
         AtBgp9f/m8ELpkaxTRuk+ccTyHYiuNmhIQFaLx1CZWRn3DMEIi1IwndwKevQpi8hIpqM
         BzvDkEK2axRhvkuGh2Zb1uIrM2sKFUo/Sk0KakIDc9pmtN4PWY0GvP1eOIbq56yRZ4nl
         bLP5e+fUmtRFyIlRaUasTgKdjd374Dgwg5Jaj1YQzmKWFrwQneZ4VlA8jJEBbnfdk5kx
         xgVgL3d3++hqC2LgIwDtHdSPE+zWfVD5h+61wCWgS4xsMy+2ro9R8nXir7rm9yCz6RRs
         t3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767125539; x=1767730339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pMQIVBCIMij/H03eiaiTjUin23/3vu/kaRSdAhgDGd0=;
        b=u5s+NfGjqcYD1jwORMXJve7bETXOl2in7fJ2hvQAEMxxfe8DbEGcB42+LvF5XLi3mc
         cICtaN2GhpIvxJvhzNs/mEpoX8Ty2vB6g3qj5RtxROlyaF5lu601EWE13OBxjRKK0vd1
         IUsbMOciIc2LPKU7hrrAPLU0iWAZtIaScrsZsP7FZ+YshC1/4Kv7YiUD1wjJLD9e+num
         0DUJuqIXeW8DAqRgbj19PWo5xElbjo3RN0u5Vkky1eqt9mifzrGp2iQE6m7zj6GfOc1a
         C7OEc8RoquU8J9aWz2IbsiRoqbXwjllezrpxF4QzGla+9PNfsL3/kZQkMYQcP18jlRee
         KN1A==
X-Gm-Message-State: AOJu0Yzow3YdCLjP44MfHcgsgA8j8+CyxQ9NKdH6H4BHsm3QC4eZ64nM
	EiaxpxsjS2fGaroM/ftGQQF1XqbNZOKjWRSGUDlAmVqJrl51CS5MBiduPYNhAefGVFm6h/cy573
	lKL+/
X-Gm-Gg: AY/fxX69l+8N8xLBuP8jfDeJcifpxmEsWLy2T6nVyOLNBUiYxkbtkNcc5msvASd5nd0
	mGEjlVShH0nHnoWa7aNnuo9E82wcs1+/kk8KEy5fLdBNae8lRCm3788vGE5LSMV/PMwRXkPQxFS
	+KCUR7yF41pKB+uyQgGgAzyf+Ypw2MElg7gt9Dk7FB+JABLvbY31OpFcj/IkpACxc4GcBKk/z+4
	N8Q2vhmxT7fFyY4BgJv6mqJp0xFnZsXso9xjvy45RrlQHuHlegzjqpXyh/tHK21G2sPforpC9f9
	iZWSV/6x9FpaBnF0T1/cUq6ByPfur4MTikxKXMiJ4/mFYXME98t9qCgZJeT8y7W7G0RwM2tbgh+
	Vg5HILt+zpD2rAGFFTrNsTmSKtd6gVCbiitdOqugYeKEsRfjuSVj7/2EwWsnEPUzGBPNCQ0U85x
	R09Q==
X-Google-Smtp-Source: AGHT+IHTqN+43uIJNVCxLKbiarjn5eG4BVN2bGi5D6OpxTQSR6nL7tjSh702QWe7aH/O96RGki0qOQ==
X-Received: by 2002:a17:902:ccc3:b0:2a0:97d2:a25d with SMTP id d9443c01a7336-2a2f2426c84mr391337265ad.15.1767125537856;
        Tue, 30 Dec 2025 12:12:17 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:501f:80a7:5971:3e87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c83325sm310391365ad.34.2025.12.30.12.12.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 12:12:17 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 05/29] sqlite3: patch CVE-2025-6965
Date: Tue, 30 Dec 2025 12:11:35 -0800
Message-ID: <0f1ecc1b79ebd1e3a10db4ef383b99e00ecd540f.1767106395.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767106395.git.steve@sakoman.com>
References: <cover.1767106395.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 20:12:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228697

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2025-6965

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
 
-- 
2.43.0



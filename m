Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web12.13334.1589207971568667094
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2020 07:39:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=xWARYJeV;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.193, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f193.google.com with SMTP id 18so4830347pfv.8
        for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2020 07:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=oldXUEN08OeEMg1+aNyWP2a7g025xj5EkRZizcfWEjM=;
        b=xWARYJeVZOxCuOzJqi2JWgzc9xlmtCzoGxMLNYpTzJcAGzxzZUiGfaKm7lWkSNr9oZ
         tDhHcCzyZkA/LWGX1LvJp3ISW3Plvl1czcbKO4h1EJ+QzZvmWhtoDj/m7tuTroH6QYii
         DXwHwfl1Uh6PHbsF4w0AFYhe3M+dyE1vGyEQzVtqZDg5532oSFTo7zZ72IYIKl5t8s2m
         6D0o8a8WuA/JWwYszJN+MoC/kLEqlyJJ51Tsi9nRvZOHWIPtrhiBXgUoXvPNuqiMLDOD
         Iuf+j7ZNXrbCUFgxm3fx8TKjZaoMhz9ipjsl8TNu5JZXFkwSkbfB5j9y+P3Xm92hnjX/
         xb3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=oldXUEN08OeEMg1+aNyWP2a7g025xj5EkRZizcfWEjM=;
        b=ktw7auItWnELI2CXZokzmgRd3z7hkoIYKiKj0Jw//CZYkieZ92SF5ezzpabP1yasES
         16FgnAG6q+Zc8J3/mEvzjguNiOK38v0/luybjO/q1fXOoJQBI3gmKiYIqL64zLaTa3fE
         lSrZLbpDY1I/cIMTIfWRKwVGC9OyUoLACQYPB6+q9tVy3hZbkFIGP7jPfUE9mPQxL7fS
         NhBtKRnoAVji8Xf8eFr+eheRKPesK7n5Scvly5ThHXOu/sraQYwiMsmXR7x55EKGnEWT
         rcl3BTYtEhWHJm0eeHw3ak/+YODhwrMj2DMWq0e0lIg16hdJOOOc4kQdhZIsq9fdsumM
         X2dw==
X-Gm-Message-State: AGi0PuZ0X3AsJw29WOfKW2p0kVBEfaSdmT7Fq2fikpdGSDMoaEksGlnO
	r767QeKF8p9BOCnPJZDL/5vp6sqCcrA0RQ==
X-Google-Smtp-Source: APiQypIkDC+JvL2RnWRMdv1/l3iA6Z0qZ6vqlFyjurkpP7S9wslaGVsS5zwWqQkLDnY0AQa8jeQpsg==
X-Received: by 2002:a62:7bcf:: with SMTP id w198mr15895729pfc.226.1589207970437;
        Mon, 11 May 2020 07:39:30 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 6sm9337202pfj.123.2020.05.11.07.39.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 07:39:29 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/8] sqlite: backport CVE fixes
Date: Mon, 11 May 2020 04:38:46 -1000
Message-Id: <e63a38ca6ea95c0dbc79d5024c0cec31062d2e39.1589207495.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589207495.git.steve@sakoman.com>
References: <cover.1589207495.git.steve@sakoman.com>

From: Sakib Sajal <sakib.sajal@windriver.com>

Fixes CVE-2020-11655 and CVE-2020-11656

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../sqlite/files/CVE-2020-11655.patch         | 32 +++++++++
 .../sqlite/files/CVE-2020-11656.patch         | 70 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.31.1.bb |  2 +
 3 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2020-11655.patch
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2020-11656.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2020-11655.patch b/meta/recipes-support/sqlite/files/CVE-2020-11655.patch
new file mode 100644
index 0000000000..e30c482bbb
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2020-11655.patch
@@ -0,0 +1,32 @@
+From a4601326d61bf1a11151ac6b78b50804bfd03b4d Mon Sep 17 00:00:00 2001
+From: Sakib Sajal <sakib.sajal@windriver.com>
+Date: Thu, 30 Apr 2020 10:46:16 -0700
+Subject: [PATCH 2/2] In the event of a semantic error in an aggregate query,
+ early-out the resetAccumulator() function to prevent problems due to
+ incomplete or incorrect initialization of the AggInfo object. Fix for ticket
+ [af4556bb5c285c08].
+
+FossilOrigin-Name: 4a302b42c7bf5e11ddb5522ca999f74aba397d3a7eb91b1844bb02852f772441
+Upstream Status: Backport [c415d91007e1680e4eb17def583b202c3c83c718]
+
+CVE: CVE-2020-11655
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ sqlite3.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 1df6633..726adf7 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -133242,6 +133242,7 @@ static void resetAccumulator(Parse *pParse, AggInfo *pAggInfo){
+   struct AggInfo_func *pFunc;
+   int nReg = pAggInfo->nFunc + pAggInfo->nColumn;
+   if( nReg==0 ) return;
++  if( pParse->nErr ) return;
+ #ifdef SQLITE_DEBUG
+   /* Verify that all AggInfo registers are within the range specified by
+   ** AggInfo.mnReg..AggInfo.mxReg */
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/sqlite/files/CVE-2020-11656.patch b/meta/recipes-support/sqlite/files/CVE-2020-11656.patch
new file mode 100644
index 0000000000..b88a724e8c
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2020-11656.patch
@@ -0,0 +1,70 @@
+From 2d69a520d027eb73eb6da9f2653d23e33b10e8bb Mon Sep 17 00:00:00 2001
+From: Sakib Sajal <sakib.sajal@windriver.com>
+Date: Thu, 30 Apr 2020 10:14:36 -0700
+Subject: [PATCH 1/2] Fix a case when a pointer might be used after
+ being freed in  the ALTER TABLE code. Fix for [4722bdab08cb1].
+
+FossilOrigin-Name: d09f8c3621d5f7f8c6d99d7d82bcaa8421855b3f470bea2b26c858106382b906
+Upstream Status: Backport [fb99e388ec7f30fe43e4878236e3695ff24ae58d]
+
+[PATCH 2/2] Do not suppress errors when resolving references in an ORDER
+ BY clause belonging to a compound SELECT within a view or trigger within
+ ALTER TABLE. Fix for ticket [a10a14e9b4ba2].
+
+FossilOrigin-Name: 684293882c302600e112cf52553c19d84fdb31663d96e5dd7f8ac17dda00a026
+Upstream Status: Backport [4db7ab53f9c30e2e22731ace93ab6b18eef6c4ae]
+
+The two patches were converted to amalgamation format.
+
+CVE: CVE-2020-11656
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ sqlite3.c | 18 +++++++++++++++++-
+ 1 file changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 64fae04..1df6633 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -97945,7 +97945,7 @@ static int resolveOrderByTermToExprList(
+   nc.nErr = 0;
+   db = pParse->db;
+   savedSuppErr = db->suppressErr;
+-  db->suppressErr = 1;
++  if( IN_RENAME_OBJECT==0 ) db->suppressErr = 1;
+   rc = sqlite3ResolveExprNames(&nc, pE);
+   db->suppressErr = savedSuppErr;
+   if( rc ) return 0;
+@@ -105383,6 +105383,21 @@ static void renameWalkWith(Walker *pWalker, Select *pSelect){
+   }
+ }
+ 
++/*
++** Unmap all tokens in the IdList object passed as the second argument.
++*/
++static void unmapColumnIdlistNames(
++  Parse *pParse,
++  IdList *pIdList
++){
++  if( pIdList ){
++    int ii;
++    for(ii=0; ii<pIdList->nId; ii++){
++      sqlite3RenameTokenRemap(pParse, 0, (void*)pIdList->a[ii].zName);
++    }
++  }
++}
++
+ /*
+ ** Walker callback used by sqlite3RenameExprUnmap().
+ */
+@@ -105404,6 +105419,7 @@ static int renameUnmapSelectCb(Walker *pWalker, Select *p){
+     for(i=0; i<pSrc->nSrc; i++){
+       sqlite3RenameTokenRemap(pParse, 0, (void*)pSrc->a[i].zName);
+       if( sqlite3WalkExpr(pWalker, pSrc->a[i].pOn) ) return WRC_Abort;
++      unmapColumnIdlistNames(pParse, pSrc->a[i].pUsing);
+     }
+   }
+ 
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
index de564e2698..57a791385c 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed0
 
 SRC_URI = "http://www.sqlite.org/2020/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2020-9327.patch \
+           file://CVE-2020-11656.patch \
+           file://CVE-2020-11655.patch \
            "
 SRC_URI[md5sum] = "2d0a553534c521504e3ac3ad3b90f125"
 SRC_URI[sha256sum] = "62284efebc05a76f909c580ffa5c008a7d22a1287285d68b7825a2b6b51949ae"
-- 
2.17.1


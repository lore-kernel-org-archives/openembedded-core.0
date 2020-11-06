Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web12.12301.1604673433349400924
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2020 06:37:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=VZzgQWLC;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id q10so1522888pfn.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2020 06:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=l6uO/gXMu79SXoAFiIGx5bTgUriZMH15UXEKnIZcNgM=;
        b=VZzgQWLCS/U/xbq5ye2COUyIEtTw38a6kVdI/UFrSXTqeov9df9Tbix8tepQ0scigb
         P0gQpNUsoZiwkziiDgWF0ZT4hMx1IO2aU4EfAJfaX7RDPOUYIeTiD0isKMzPOhFtYw3S
         5QsngdulCt/ttcZXq59lED/X4Uh/dxqm+qX07WwcekueOETIEL0yMvRbAsqWo9P5xOEG
         EN0JLd8gBs1R2OQlgkyCmG5BdIvNL0LJC3WFMS6py3gM3pWvnWXCe9wWrUKyqpJVSvqT
         HpXI2qqiIniJmNnvEVuVWpU2zcylbJdqOqsaedQ65sWeF9AOJb7CZxymUNoy+nKkOK0N
         olLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=l6uO/gXMu79SXoAFiIGx5bTgUriZMH15UXEKnIZcNgM=;
        b=KoNW01Px12Fz+7bVyHQXkzMkJFOIifvXBWVNglcCStkRLDUnl2SXq3CPcKYmjsyO1w
         OfuyRuwiOWBETGtVKG+YrVeZ8a/cGNa/Lugl773ZoQYznwyBMQcTrO5r4Ycx8wXhI5Q5
         d7QZwgzIxlkiRzImO//OIjUQs0B/AFUOOUgEXLtwMFOWqGouLiTmvUzMkcu65BX/K/SF
         6puLOnlK+RSl4p1qGNUhOwQYma1Aw/ZjecgY1qO/0c7+plB85EJz6ZiJeHO6+T65hBjW
         CEqyhUKP+O99+GoldIJWWMdtGqLq/dvsHSp2GIKtpsqsNvEwa9hRV/5falX1qY53+Keb
         LylQ==
X-Gm-Message-State: AOAM533n46e4lA80Dxga1w05Qn17Cddiv9NwQNPz5ocvgSjE+uprpXM7
	pJE8jpzn4nhfRN/3BvvhamLLfgsjq6ndfC2a
X-Google-Smtp-Source: ABdhPJz9scRTCRkUKBMWszDr1CifomAJtWzrN5DkRGZwrA3Stp2JNvAWjXEdm/vR/i6ltj9DUmpwag==
X-Received: by 2002:a63:6647:: with SMTP id a68mr1926945pgc.7.1604673432325;
        Fri, 06 Nov 2020 06:37:12 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id jy19sm2765166pjb.9.2020.11.06.06.37.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 06:37:11 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 19/20] sqlite3: fix CVE-2020-13631
Date: Fri,  6 Nov 2020 04:35:34 -1000
Message-Id: <582f253d6781a006841a436a49c3f7fdddc5bb7b.1604672839.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1604672838.git.steve@sakoman.com>
References: <cover.1604672838.git.steve@sakoman.com>

CVE: CVE-2020-13631

Reference: https://nvd.nist.gov/vuln/detail/CVE-2020-13631

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../sqlite/files/CVE-2020-13631.patch         | 99 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.31.1.bb |  1 +
 2 files changed, 100 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2020-13631.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2020-13631.patch b/meta/recipes-support/sqlite/files/CVE-2020-13631.patch
new file mode 100644
index 0000000000..0277c0cf22
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2020-13631.patch
@@ -0,0 +1,99 @@
+From 3d863b5e4efb2305d64f87a2128289d1c3ce09b6 Mon Sep 17 00:00:00 2001
+From: drh <drh@noemail.net>
+Date: Thu, 14 May 2020 21:16:52 +0000
+Subject: [PATCH] Do not allow a virtual table to be renamed into the name of
+ one of its shadows.
+
+FossilOrigin-Name: eca0ba2cf4c0fdf757bae19c6397a48245adb99e8017ddc28f01804072a30b2c
+
+Upstream-Status: Backport
+CVE: CVE-2020-13631
+
+Reference to upstream patch:
+https://github.com/sqlite/sqlite/commit/3d863b5e4efb2305d64f87a2128289d1c3ce09b6
+
+Patch converted to amalgamation format
+
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+---
+ sqlite3.c | 39 ++++++++++++++++++++++++++++++---------
+ 1 file changed, 30 insertions(+), 9 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index e72fabb..282e106 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -19948,8 +19948,10 @@ SQLITE_PRIVATE    Module *sqlite3VtabCreateModule(
+ SQLITE_PRIVATE int sqlite3ReadOnlyShadowTables(sqlite3 *db);
+ #ifndef SQLITE_OMIT_VIRTUALTABLE
+ SQLITE_PRIVATE   int sqlite3ShadowTableName(sqlite3 *db, const char *zName);
++SQLITE_PRIVATE   int sqlite3IsShadowTableOf(sqlite3*,Table*,const char*);
+ #else
+ # define sqlite3ShadowTableName(A,B) 0
++# define sqlite3IsShadowTableOf(A,B,C) 0
+ #endif
+ SQLITE_PRIVATE int sqlite3VtabEponymousTableInit(Parse*,Module*);
+ SQLITE_PRIVATE void sqlite3VtabEponymousTableClear(sqlite3*,Module*);
+@@ -104793,7 +104795,10 @@ SQLITE_PRIVATE void sqlite3AlterRenameTable(
+   /* Check that a table or index named 'zName' does not already exist
+   ** in database iDb. If so, this is an error.
+   */
+-  if( sqlite3FindTable(db, zName, zDb) || sqlite3FindIndex(db, zName, zDb) ){
++  if( sqlite3FindTable(db, zName, zDb)
++   || sqlite3FindIndex(db, zName, zDb)
++   || sqlite3IsShadowTableOf(db, pTab, zName)
++  ){
+     sqlite3ErrorMsg(pParse, 
+         "there is already another table or index with this name: %s", zName);
+     goto exit_rename_table;
+@@ -111303,6 +111308,28 @@ static void convertToWithoutRowidTable(Parse *pParse, Table *pTab){
+   recomputeColumnsNotIndexed(pPk);
+ }
+ 
++
++#ifndef SQLITE_OMIT_VIRTUALTABLE
++/*
++** Return true if pTab is a virtual table and zName is a shadow table name
++** for that virtual table.
++*/
++SQLITE_PRIVATE int sqlite3IsShadowTableOf(sqlite3 *db, Table *pTab, const char *zName){
++  int nName;                    /* Length of zName */
++  Module *pMod;                 /* Module for the virtual table */
++
++  if( !IsVirtual(pTab) ) return 0;
++  nName = sqlite3Strlen30(pTab->zName);
++  if( sqlite3_strnicmp(zName, pTab->zName, nName)!=0 ) return 0;
++  if( zName[nName]!='_' ) return 0;
++  pMod = (Module*)sqlite3HashFind(&db->aModule, pTab->azModuleArg[0]);
++  if( pMod==0 ) return 0;
++  if( pMod->pModule->iVersion<3 ) return 0;
++  if( pMod->pModule->xShadowName==0 ) return 0;
++  return pMod->pModule->xShadowName(zName+nName+1);
++}
++#endif /* ifndef SQLITE_OMIT_VIRTUALTABLE */
++
+ #ifndef SQLITE_OMIT_VIRTUALTABLE
+ /*
+ ** Return true if zName is a shadow table name in the current database
+@@ -111314,8 +111341,6 @@ static void convertToWithoutRowidTable(Parse *pParse, Table *pTab){
+ SQLITE_PRIVATE int sqlite3ShadowTableName(sqlite3 *db, const char *zName){
+   char *zTail;                  /* Pointer to the last "_" in zName */
+   Table *pTab;                  /* Table that zName is a shadow of */
+-  Module *pMod;                 /* Module for the virtual table */
+-
+   zTail = strrchr(zName, '_');
+   if( zTail==0 ) return 0;
+   *zTail = 0;
+@@ -111323,11 +111348,7 @@ SQLITE_PRIVATE int sqlite3ShadowTableName(sqlite3 *db, const char *zName){
+   *zTail = '_';
+   if( pTab==0 ) return 0;
+   if( !IsVirtual(pTab) ) return 0;
+-  pMod = (Module*)sqlite3HashFind(&db->aModule, pTab->azModuleArg[0]);
+-  if( pMod==0 ) return 0;
+-  if( pMod->pModule->iVersion<3 ) return 0;
+-  if( pMod->pModule->xShadowName==0 ) return 0;
+-  return pMod->pModule->xShadowName(zTail+1);
++  return sqlite3IsShadowTableOf(db, pTab, zName);
+ }
+ #endif /* ifndef SQLITE_OMIT_VIRTUALTABLE */
+ 
diff --git a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
index ace9423e8d..5d45d1f1ab 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
@@ -11,6 +11,7 @@ SRC_URI = "http://www.sqlite.org/2020/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2020-13434.patch \
            file://CVE-2020-13435.patch \
            file://CVE-2020-13630.patch \
+           file://CVE-2020-13631.patch \
            "
 SRC_URI[md5sum] = "2d0a553534c521504e3ac3ad3b90f125"
 SRC_URI[sha256sum] = "62284efebc05a76f909c580ffa5c008a7d22a1287285d68b7825a2b6b51949ae"
-- 
2.17.1


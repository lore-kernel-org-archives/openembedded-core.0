Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46A94C5B549
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 15:33:41 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.927.1748446418281889715
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 08:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pA+h+GZ3;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7398d65476eso810599b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 08:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748446417; x=1749051217; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cd73h8oInFujM4GUlEgry2gjWapvi8vM3UewcLSk96s=;
        b=pA+h+GZ3osBqcNRBdOk+O4CzuWKa7aLcxebL9kMFS5BHSKoHQIb1zceQ1z1RyvboVk
         ZviPFdrWgk9tEV5oCV7Trq491rpDEjqo7A+OSmdDSu46YlZlkIZ+48BHg33Fej8esVha
         x0/SL+EikHScoRiir5/rM4Clx6G5uZ/0mzbFinKu7mSk7a9eq0jhGl96IDEBeJtS3hVW
         eLWt5xIvkr3Yk8HwQ+DzXFPw18mWqQZQSJulg9fQXse22nwYZZvC5b144ZhwpJXRs5f8
         ivgt6LRAliYou0kayjG8TKxKkceV/UebHD2fXgXcT21QYtVhJsrQFE+0zxIFF0YHdC/9
         MS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748446417; x=1749051217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cd73h8oInFujM4GUlEgry2gjWapvi8vM3UewcLSk96s=;
        b=sLQhz8cC6houUPIMngOL97BTifk5NHkvUgjydxvPr9maFQgq5bNRJVGsG/ukl2mX2Q
         so8QzrkVWQxGQLoGdZYFfF3659r4hGiLQYJ7LyV5fDPL/DRwmrf4LPIHroYPWLEn0bLZ
         s7pmHAqc2KadOzZO5nkEeKiwNbjOZngBAuSK4JdSLEF0bqBawsVhHAdkvxIyNq45mqva
         E6fKnvB79wtcNh6FB8z0xOy+oTproM8Vlz4onRsTWfnmDSut5DwkgAzrI9GMft+Ovgv0
         /0FiWwA/5WGt5ZYCV5B1Mnir4p1iqSY2DQk8UOyhwnKxnrHLJ4+vcCRgH/emsycIc/Pt
         /pSA==
X-Gm-Message-State: AOJu0YwykFwla9dpFsagvwHVAFF62tPWR9iRYSwNsLcsE0Jh6T4npkLm
	rRKcTxprUTSNDCX+fMFTPJlf8y4vZt8klpMQRxpXnMpo3eZbkCrtqZlSQKn+ldsxHGo0Bo8pPgO
	t0lQX
X-Gm-Gg: ASbGncvJlxC2MO6ytqlhLfLQ2Qvy5kgwNB1k1xsHDzdzUWlggIEAUWz9JBzNzdprn1n
	UrnrHBya89vgefjK2vvSl6iR+eedeDAXwV5aTBfFD+amY+G8adfXZYALo04rU0UJ2oVa+r8ahvQ
	2Kd8qFFdq2LvyV1OJaBdZ8uXnk8ZXdhb88gHekRApRU5wadMKfwa2bfsvl+qZWxWFgZx4QHveh1
	eZSr57PUSAPP2Y3bzHLteBLAQ6DKcH9RAl1YWRf3wO2wJ4qd1EXamDgel4yySmWi9mzu/IXlJtI
	8rxBKz91tT4+QlAQ8HDqy0SOGZUIQeDi+4tLWshCQlM=
X-Google-Smtp-Source: AGHT+IGOWfkkSyXqqLJ/4j8M6osiFcOcbeXZ2+M76dFt/q/ikZMtIMSK4Ha50ILknz8TFzuILzEhqg==
X-Received: by 2002:a05:6a00:3d14:b0:742:b9d2:dc8f with SMTP id d2e1a72fcca58-747ad443aaemr50814b3a.1.1748446417178;
        Wed, 28 May 2025 08:33:37 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2f2f:1884:f4cc:456c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-746e343c1basm1400268b3a.132.2025.05.28.08.33.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 08:33:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 02/14] sqlite3: patch CVE-2025-29088
Date: Wed, 28 May 2025 08:33:11 -0700
Message-ID: <bf22e18843bf10418e7f8f182036eaf78de98413.1748446235.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748446235.git.steve@sakoman.com>
References: <cover.1748446235.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 15:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217366

From: Peter Marko <peter.marko@siemens.com>

Pick commit [1] mentioned in [2].

[1] https://github.com/sqlite/sqlite/commit/56d2fd008b108109f489339f5fd55212bb50afd4
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-29088

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../sqlite/sqlite3/CVE-2025-29088.patch       | 179 ++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.48.0.bb |   1 +
 2 files changed, 180 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2025-29088.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2025-29088.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2025-29088.patch
new file mode 100644
index 0000000000..12a025fdd8
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2025-29088.patch
@@ -0,0 +1,179 @@
+From 57d1e61dda969659f59a0b7841c7d0287d724bc6 Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Mon, 17 Feb 2025 14:16:49 +0000
+Subject: [PATCH] Harden the SQLITE_DBCONFIG_LOOKASIDE interface against
+ misuse, such as described in [forum:/forumpost/48f365daec|forum post
+ 48f365daec].  Enhancements to the SQLITE_DBCONFIG_LOOKASIDE documentation. 
+ Test cases in TH3.
+
+FossilOrigin-Name: 1ec4c308c76c69fba031184254fc3340f07607cfbf8342b13713ab445563d377
+
+CVE: CVE-2025-29088
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/56d2fd008b108109f489339f5fd55212bb50afd4]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ sqlite3.c | 42 +++++++++++++++++++++++---------------
+ sqlite3.h | 60 +++++++++++++++++++++++++++++++++++++------------------
+ 2 files changed, 67 insertions(+), 35 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 24d0d954d9..2574a43f3e 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -182001,17 +182001,22 @@ SQLITE_API int sqlite3_config(int op, ...){
+ ** If lookaside is already active, return SQLITE_BUSY.
+ **
+ ** The sz parameter is the number of bytes in each lookaside slot.
+-** The cnt parameter is the number of slots.  If pStart is NULL the
+-** space for the lookaside memory is obtained from sqlite3_malloc().
+-** If pStart is not NULL then it is sz*cnt bytes of memory to use for
+-** the lookaside memory.
++** The cnt parameter is the number of slots.  If pBuf is NULL the
++** space for the lookaside memory is obtained from sqlite3_malloc()
++** or similar.  If pBuf is not NULL then it is sz*cnt bytes of memory
++** to use for the lookaside memory.
+ */
+-static int setupLookaside(sqlite3 *db, void *pBuf, int sz, int cnt){
++static int setupLookaside(
++  sqlite3 *db,    /* Database connection being configured */
++  void *pBuf,     /* Memory to use for lookaside.  May be NULL */
++  int sz,         /* Desired size of each lookaside memory slot */
++  int cnt         /* Number of slots to allocate */
++){
+ #ifndef SQLITE_OMIT_LOOKASIDE
+-  void *pStart;
+-  sqlite3_int64 szAlloc = sz*(sqlite3_int64)cnt;
+-  int nBig;   /* Number of full-size slots */
+-  int nSm;    /* Number smaller LOOKASIDE_SMALL-byte slots */
++  void *pStart;          /* Start of the lookaside buffer */
++  sqlite3_int64 szAlloc; /* Total space set aside for lookaside memory */
++  int nBig;              /* Number of full-size slots */
++  int nSm;               /* Number smaller LOOKASIDE_SMALL-byte slots */
+ 
+   if( sqlite3LookasideUsed(db,0)>0 ){
+     return SQLITE_BUSY;
+@@ -182024,17 +182029,22 @@ static int setupLookaside(sqlite3 *db, void *pBuf, int sz, int cnt){
+     sqlite3_free(db->lookaside.pStart);
+   }
+   /* The size of a lookaside slot after ROUNDDOWN8 needs to be larger
+-  ** than a pointer to be useful.
++  ** than a pointer and small enough to fit in a u16.
+   */
+-  sz = ROUNDDOWN8(sz);  /* IMP: R-33038-09382 */
++  sz = ROUNDDOWN8(sz);
+   if( sz<=(int)sizeof(LookasideSlot*) ) sz = 0;
+-  if( cnt<0 ) cnt = 0;
+-  if( sz==0 || cnt==0 ){
++  if( sz>65528 ) sz = 65528;
++  /* Count must be at least 1 to be useful, but not so large as to use
++  ** more than 0x7fff0000 total bytes for lookaside. */
++  if( cnt<1 ) cnt = 0;
++  if( sz>0 && cnt>(0x7fff0000/sz) ) cnt = 0x7fff0000/sz;
++  szAlloc = (i64)sz*(i64)cnt;
++  if( szAlloc==0 ){
+     sz = 0;
+     pStart = 0;
+   }else if( pBuf==0 ){
+     sqlite3BeginBenignMalloc();
+-    pStart = sqlite3Malloc( szAlloc );  /* IMP: R-61949-35727 */
++    pStart = sqlite3Malloc( szAlloc );
+     sqlite3EndBenignMalloc();
+     if( pStart ) szAlloc = sqlite3MallocSize(pStart);
+   }else{
+@@ -182043,10 +182053,10 @@ static int setupLookaside(sqlite3 *db, void *pBuf, int sz, int cnt){
+ #ifndef SQLITE_OMIT_TWOSIZE_LOOKASIDE
+   if( sz>=LOOKASIDE_SMALL*3 ){
+     nBig = szAlloc/(3*LOOKASIDE_SMALL+sz);
+-    nSm = (szAlloc - sz*nBig)/LOOKASIDE_SMALL;
++    nSm = (szAlloc - (i64)sz*(i64)nBig)/LOOKASIDE_SMALL;
+   }else if( sz>=LOOKASIDE_SMALL*2 ){
+     nBig = szAlloc/(LOOKASIDE_SMALL+sz);
+-    nSm = (szAlloc - sz*nBig)/LOOKASIDE_SMALL;
++    nSm = (szAlloc - (i64)sz*(i64)nBig)/LOOKASIDE_SMALL;
+   }else
+ #endif /* SQLITE_OMIT_TWOSIZE_LOOKASIDE */
+   if( sz>0 ){
+diff --git a/sqlite3.h b/sqlite3.h
+index 2618b37a7b..056511f577 100644
+--- a/sqlite3.h
++++ b/sqlite3.h
+@@ -1989,13 +1989,16 @@ struct sqlite3_mem_methods {
+ **
+ ** [[SQLITE_CONFIG_LOOKASIDE]] <dt>SQLITE_CONFIG_LOOKASIDE</dt>
+ ** <dd> ^(The SQLITE_CONFIG_LOOKASIDE option takes two arguments that determine
+-** the default size of lookaside memory on each [database connection].
++** the default size of [lookaside memory] on each [database connection].
+ ** The first argument is the
+-** size of each lookaside buffer slot and the second is the number of
+-** slots allocated to each database connection.)^  ^(SQLITE_CONFIG_LOOKASIDE
+-** sets the <i>default</i> lookaside size. The [SQLITE_DBCONFIG_LOOKASIDE]
+-** option to [sqlite3_db_config()] can be used to change the lookaside
+-** configuration on individual connections.)^ </dd>
++** size of each lookaside buffer slot ("sz") and the second is the number of
++** slots allocated to each database connection ("cnt").)^
++** ^(SQLITE_CONFIG_LOOKASIDE sets the <i>default</i> lookaside size.
++** The [SQLITE_DBCONFIG_LOOKASIDE] option to [sqlite3_db_config()] can
++** be used to change the lookaside configuration on individual connections.)^
++** The [-DSQLITE_DEFAULT_LOOKASIDE] option can be used to change the
++** default lookaside configuration at compile-time.
++** </dd>
+ **
+ ** [[SQLITE_CONFIG_PCACHE2]] <dt>SQLITE_CONFIG_PCACHE2</dt>
+ ** <dd> ^(The SQLITE_CONFIG_PCACHE2 option takes a single argument which is
+@@ -2225,24 +2228,43 @@ struct sqlite3_mem_methods {
+ ** <dt>SQLITE_DBCONFIG_LOOKASIDE</dt>
+ ** <dd> ^This option takes three additional arguments that determine the
+ ** [lookaside memory allocator] configuration for the [database connection].
+-** ^The first argument (the third parameter to [sqlite3_db_config()] is a
++** <ol>
++** <li><p>The first argument ("buf") is a
+ ** pointer to a memory buffer to use for lookaside memory.
+-** ^The first argument after the SQLITE_DBCONFIG_LOOKASIDE verb
+-** may be NULL in which case SQLite will allocate the
+-** lookaside buffer itself using [sqlite3_malloc()]. ^The second argument is the
+-** size of each lookaside buffer slot.  ^The third argument is the number of
+-** slots.  The size of the buffer in the first argument must be greater than
+-** or equal to the product of the second and third arguments.  The buffer
+-** must be aligned to an 8-byte boundary.  ^If the second argument to
+-** SQLITE_DBCONFIG_LOOKASIDE is not a multiple of 8, it is internally
+-** rounded down to the next smaller multiple of 8.  ^(The lookaside memory
++** The first argument may be NULL in which case SQLite will allocate the
++** lookaside buffer itself using [sqlite3_malloc()].
++** <li><P>The second argument ("sz") is the
++** size of each lookaside buffer slot.  Lookaside is disabled if "sz"
++** is less than 8.  The "sz" argument should be a multiple of 8 less than
++** 65536.  If "sz" does not meet this constraint, it is reduced in size until
++** it does.
++** <li><p>The third argument ("cnt") is the number of slots. Lookaside is disabled
++** if "cnt"is less than 1.  The "cnt" value will be reduced, if necessary, so
++** that the product of "sz" and "cnt" does not exceed 2,147,418,112.  The "cnt"
++** parameter is usually chosen so that the product of "sz" and "cnt" is less
++** than 1,000,000.
++** </ol>
++** <p>If the "buf" argument is not NULL, then it must
++** point to a memory buffer with a size that is greater than
++** or equal to the product of "sz" and "cnt".
++** The buffer must be aligned to an 8-byte boundary.
++** The lookaside memory
+ ** configuration for a database connection can only be changed when that
+ ** connection is not currently using lookaside memory, or in other words
+-** when the "current value" returned by
+-** [sqlite3_db_status](D,[SQLITE_DBSTATUS_LOOKASIDE_USED],...) is zero.
++** when the value returned by [SQLITE_DBSTATUS_LOOKASIDE_USED] is zero.
+ ** Any attempt to change the lookaside memory configuration when lookaside
+ ** memory is in use leaves the configuration unchanged and returns
+-** [SQLITE_BUSY].)^</dd>
++** [SQLITE_BUSY].
++** If the "buf" argument is NULL and an attempt
++** to allocate memory based on "sz" and "cnt" fails, then
++** lookaside is silently disabled.
++** <p>
++** The [SQLITE_CONFIG_LOOKASIDE] configuration option can be used to set the
++** default lookaside configuration at initialization.  The
++** [-DSQLITE_DEFAULT_LOOKASIDE] option can be used to set the default lookaside
++** configuration at compile-time.  Typical values for lookaside are 1200 for
++** "sz" and 40 to 100 for "cnt".
++** </dd>
+ **
+ ** [[SQLITE_DBCONFIG_ENABLE_FKEY]]
+ ** <dt>SQLITE_DBCONFIG_ENABLE_FKEY</dt>
diff --git a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb b/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
index 86983f21bd..11f103dddc 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed0
 
 SRC_URI = "http://www.sqlite.org/2025/sqlite-autoconf-${SQLITE_PV}.tar.gz \
     file://CVE-2025-3277.patch \
+    file://CVE-2025-29088.patch \
 "
 SRC_URI[sha256sum] = "ac992f7fca3989de7ed1fe99c16363f848794c8c32a158dafd4eb927a2e02fd5"
 
-- 
2.43.0



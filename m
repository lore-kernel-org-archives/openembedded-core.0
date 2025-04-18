Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A753C369AB
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 22:18:24 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.811.1745014700733450884
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Apr 2025 15:18:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=YcXgUl9m;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2025041822181751bc74dc9ce7fd0dc3-vn8_zu@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2025041822181751bc74dc9ce7fd0dc3
        for <openembedded-core@lists.openembedded.org>;
        Sat, 19 Apr 2025 00:18:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=wYTmZSqTh7sLwh86tq/s98XG+iBM/iFLW7O70S/wPQ4=;
 b=YcXgUl9mdxM+xy+lzA6M+9QMYe4pz1Hm8PEtD995TSlF4RZqOQuW3I2gihpzJ8lFh0+gvo
 ddH0OjpoioLLfMrJeLXg97MkS/xZPfj0AgR17S2lCclxZ49bYtFNCyZ2beq7hOhqvR8GDPPX
 vmbGs+ICFV5ExiGXXiFzqjYzNJsv5RkhDxN+dyFAFHOTFjZNPGCd7qUXAZpvm43zzyRJ04o4
 Qvg00Lj4GbAZUQBj8BBJBtRa5uy/vcpU0+YTtA6lqTfeWJdcQwF4YnNP70ND2nXLvAdbnkb/
 4rEoPRoAX49ZBBNrWrHN0lLpOXPoSjdT6MHrK7Rll7AQXIR57s2ZXLFQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] sqlite3: patch CVE-2025-29088
Date: Sat, 19 Apr 2025 00:17:30 +0200
Message-Id: <20250418221730.2113302-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 22:18:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215144

From: Peter Marko <peter.marko@siemens.com>

Pick commit [1] mentioned in [2].

[1] https://github.com/sqlite/sqlite/commit/56d2fd008b108109f489339f5fd55212bb50afd4
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-29088

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../sqlite/files/CVE-2025-29088.patch         | 179 ++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.38.5.bb |   1 +
 2 files changed, 180 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2025-29088.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2025-29088.patch b/meta/recipes-support/sqlite/files/CVE-2025-29088.patch
new file mode 100644
index 0000000000..470ee9564c
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2025-29088.patch
@@ -0,0 +1,179 @@
+From 40f668e88d70d47b17652ca629d5f36fafaae0e8 Mon Sep 17 00:00:00 2001
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
+index 0b979f7a7d..27bea6f2e0 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -169267,17 +169267,22 @@ SQLITE_API int sqlite3_config(int op, ...){
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
+@@ -169290,17 +169295,22 @@ static int setupLookaside(sqlite3 *db, void *pBuf, int sz, int cnt){
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
+@@ -169309,10 +169319,10 @@ static int setupLookaside(sqlite3 *db, void *pBuf, int sz, int cnt){
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
+index de393da9dc..04e6b616d5 100644
+--- a/sqlite3.h
++++ b/sqlite3.h
+@@ -1914,13 +1914,16 @@ struct sqlite3_mem_methods {
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
+@@ -2133,24 +2136,43 @@ struct sqlite3_mem_methods {
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
+-** [sqlite3_db_status](D,[SQLITE_CONFIG_LOOKASIDE],...) is zero.
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
diff --git a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
index 0a7a136c53..f47a9871e2 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
@@ -8,6 +8,7 @@ SRC_URI = "http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2022-46908.patch \
            file://CVE-2023-36191.patch \
            file://CVE-2023-7104.patch \
+           file://CVE-2025-29088.patch \
            "
 SRC_URI[sha256sum] = "5af07de982ba658fd91a03170c945f99c971f6955bc79df3266544373e39869c"
 


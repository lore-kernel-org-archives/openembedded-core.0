Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70644C54E90
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 20:21:54 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.1130.1747772504849132049
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 13:21:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=fhrdXGwa;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202505202021425f9c3a0a51c31f5313-na9idb@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202505202021425f9c3a0a51c31f5313
        for <openembedded-core@lists.openembedded.org>;
        Tue, 20 May 2025 22:21:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=1WOuO5yJP6TPGO/nRPZcZSnsAeK1nXFpopNbw0L2QvA=;
 b=fhrdXGwaLD+BoVJuqWkYyjECvB0qE0Ef962LTYEZ+K/xqp93NqtcXe1sl5CAqLq0i+QQ/i
 e6N0/uVQNZKrq04cqENf5usziryRIsFL1+r3/EWW6heSctQ+gzqgxiuBmXAp1SCR8feyr9tT
 vy5txwIC+GY64sxu/4+dXznlOyUYz0yblv17hlE1DFQFb/8hedajvOQVOFcaMZ8U8iEm8P2x
 27z25n1n1jHRtqjmNRh0T6wGM7Zi91vNmczqPB3+F/H3ZCS2wJwQMGM2ccrJwtkNb1V9wZgp
 4NeDZt8bjWbc7JvBSt3nQA55h20x2Y96HsTLDhulLaQlQ5MhdFsATJhg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][walnascar][PATCH 2/8] sqlite3: patch CVE-2025-29088
Date: Tue, 20 May 2025 22:20:27 +0200
Message-Id: <20250520202033.2352749-2-peter.marko@siemens.com>
In-Reply-To: <20250520202033.2352749-1-peter.marko@siemens.com>
References: <20250520202033.2352749-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 20:21:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216944

From: Peter Marko <peter.marko@siemens.com>

Pick commit [1] mentioned in [2].

[1] https://github.com/sqlite/sqlite/commit/56d2fd008b108109f489339f5fd55212bb50afd4
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-29088

Signed-off-by: Peter Marko <peter.marko@siemens.com>
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
 


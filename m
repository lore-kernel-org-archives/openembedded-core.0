Return-Path: <jianxun.zhang@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 31D4460620
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2016 20:13:47 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP; 13 Oct 2016 13:13:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,489,1473145200"; d="scan'208";a="19325722"
Received: from chang-s2600cp.jf.intel.com ([10.54.77.22])
	by fmsmga006.fm.intel.com with ESMTP; 13 Oct 2016 13:13:49 -0700
From: Jianxun Zhang <jianxun.zhang@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2016 13:16:34 -0700
Message-Id: <1476389794-109684-1-git-send-email-jianxun.zhang@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH V2] sqlite3: Revert ad601c7962 from 3.14.1 amalgamation package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Oct 2016 20:13:51 -0000

It turns out this change between 3.12.2 and 3.13 introduces
a 2% increase of build time based on statistic data in
bz10367.

The added patch is forged by diffing the new sqlite3.c
generated from reverting the change in raw source of sqlite3
project, and then manually migrate the delta to a sqlite3.c
from the 3.14.1 tarball package because what recipes reference
is actually a generated C code (amalgamation) release package
and we cannot apply the real change to 3.14.1 cleanly due to
so many changes happened.

Fixes [YOCTO #10367]

Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
---
V2 adds "Upstream Status: Inappropriate" in the commit msg in the patch file.

Thanks to Saul's reminder.

 ...1c7962-that-brings-2-increase-of-build-ti.patch | 56 ++++++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.14.1.bb      |  5 +-
 2 files changed, 60 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/sqlite/files/0001-revert-ad601c7962-that-brings-2-increase-of-build-ti.patch

diff --git a/meta/recipes-support/sqlite/files/0001-revert-ad601c7962-that-brings-2-increase-of-build-ti.patch b/meta/recipes-support/sqlite/files/0001-revert-ad601c7962-that-brings-2-increase-of-build-ti.patch
new file mode 100644
index 0000000..26540b2
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/0001-revert-ad601c7962-that-brings-2-increase-of-build-ti.patch
@@ -0,0 +1,56 @@
+From 4b286b441e8efa9a34eb0db8227748ebffd91c35 Mon Sep 17 00:00:00 2001
+From: Jianxun Zhang <jianxun.zhang@linux.intel.com>
+Date: Thu, 13 Oct 2016 09:24:21 -0700
+Subject: [PATCH] revert ad601c7962 that brings 2% increase of build time.
+
+The comment of the change in sqlite fossil project is:
+"For in-memory databases, it does not matter if pcache
+entries are marked "clean" or "writable"."
+
+Upstream Status: Inappropriate
+
+Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
+---
+ sqlite3.c | 12 +++---------
+ 1 file changed, 3 insertions(+), 9 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index ccddfe6..ecae550 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -13146,7 +13146,7 @@ struct PgHdr {
+   sqlite3_pcache_page *pPage;    /* Pcache object page handle */
+   void *pData;                   /* Page data */
+   void *pExtra;                  /* Extra content */
+-  PgHdr *pDirty;                 /* Transient list of dirty sorted by pgno */
++  PgHdr *pDirty;                 /* Transient list of dirty pages */
+   Pager *pPager;                 /* The pager this page is part of */
+   Pgno pgno;                     /* Page number for this page */
+ #ifdef SQLITE_CHECK_PAGES
+@@ -43504,13 +43504,7 @@ bitvec_end:
+ /* #include "sqliteInt.h" */
+ 
+ /*
+-** A complete page cache is an instance of this structure.  Every
+-** entry in the cache holds a single page of the database file.  The
+-** btree layer only operates on the cached copy of the database pages.
+-**
+-** A page cache entry is "clean" if it exactly matches what is currently
+-** on disk.  A page is "dirty" if it has been modified and needs to be
+-** persisted to disk.
++** A complete page cache is an instance of this structure.
+ **
+ ** pDirty, pDirtyTail, pSynced:
+ **   All dirty pages are linked into the doubly linked list using
+@@ -48314,7 +48308,7 @@ static int pager_end_transaction(Pager *pPager, int hasMaster, int bCommit){
+   pPager->pInJournal = 0;
+   pPager->nRec = 0;
+   if( rc==SQLITE_OK ){
+-    if( pagerFlushOnCommit(pPager, bCommit) ){
++    if( MEMDB || pagerFlushOnCommit(pPager, bCommit) ){
+       sqlite3PcacheCleanAll(pPager->pPCache);
+     }else{
+       sqlite3PcacheClearWritable(pPager->pPCache);
+-- 
+2.7.4
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.14.1.bb b/meta/recipes-support/sqlite/sqlite3_3.14.1.bb
index 3af0d2f..7c8fa40 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.14.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.14.1.bb
@@ -3,7 +3,10 @@ require sqlite3.inc
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b3570bb0"
 
-SRC_URI = "http://www.sqlite.org/2016/sqlite-autoconf-${SQLITE_PV}.tar.gz"
+SRC_URI = "\
+  http://www.sqlite.org/2016/sqlite-autoconf-${SQLITE_PV}.tar.gz \
+  file://0001-revert-ad601c7962-that-brings-2-increase-of-build-ti.patch \
+  "
 
 SRC_URI[md5sum] = "3634a90a3f49541462bcaed3474b2684"
 SRC_URI[sha256sum] = "bc7182476900017becb81565ecea7775d46ab747a97281aa610f4f45881c47a6"
-- 
2.7.4



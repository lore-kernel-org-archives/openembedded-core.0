Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 60E8F605BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 12:18:24 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 10 Jan 2017 04:18:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,344,1477983600"; d="scan'208";a="920868945"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 10 Jan 2017 04:18:23 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id 38CD06A4080
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 04:17:31 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2017 14:18:38 +0200
Message-Id: <1484050718-30306-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] sqlite3: upgrade to 3.16.2
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
X-List-Received-Date: Tue, 10 Jan 2017 12:18:25 -0000

3.15.2 -> 3.16.2

1. Updated the SRC_URI for releases in 2017
2. Removed the following revert patch as the fix is present in this release:
        a) 0001-revert-ad601c7962-that-brings-2-increase-of-build-ti.patch

[YOCTO #10695]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...1c7962-that-brings-2-increase-of-build-ti.patch | 56 ----------------------
 meta/recipes-support/sqlite/sqlite3_3.15.2.bb      | 12 -----
 meta/recipes-support/sqlite/sqlite3_3.16.2.bb      | 11 +++++
 3 files changed, 11 insertions(+), 68 deletions(-)
 delete mode 100644 meta/recipes-support/sqlite/files/0001-revert-ad601c7962-that-brings-2-increase-of-build-ti.patch
 delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.15.2.bb
 create mode 100644 meta/recipes-support/sqlite/sqlite3_3.16.2.bb

diff --git a/meta/recipes-support/sqlite/files/0001-revert-ad601c7962-that-brings-2-increase-of-build-ti.patch b/meta/recipes-support/sqlite/files/0001-revert-ad601c7962-that-brings-2-increase-of-build-ti.patch
deleted file mode 100644
index 26540b2..0000000
--- a/meta/recipes-support/sqlite/files/0001-revert-ad601c7962-that-brings-2-increase-of-build-ti.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 4b286b441e8efa9a34eb0db8227748ebffd91c35 Mon Sep 17 00:00:00 2001
-From: Jianxun Zhang <jianxun.zhang@linux.intel.com>
-Date: Thu, 13 Oct 2016 09:24:21 -0700
-Subject: [PATCH] revert ad601c7962 that brings 2% increase of build time.
-
-The comment of the change in sqlite fossil project is:
-"For in-memory databases, it does not matter if pcache
-entries are marked "clean" or "writable"."
-
-Upstream Status: Inappropriate
-
-Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
----
- sqlite3.c | 12 +++---------
- 1 file changed, 3 insertions(+), 9 deletions(-)
-
-diff --git a/sqlite3.c b/sqlite3.c
-index ccddfe6..ecae550 100644
---- a/sqlite3.c
-+++ b/sqlite3.c
-@@ -13146,7 +13146,7 @@ struct PgHdr {
-   sqlite3_pcache_page *pPage;    /* Pcache object page handle */
-   void *pData;                   /* Page data */
-   void *pExtra;                  /* Extra content */
--  PgHdr *pDirty;                 /* Transient list of dirty sorted by pgno */
-+  PgHdr *pDirty;                 /* Transient list of dirty pages */
-   Pager *pPager;                 /* The pager this page is part of */
-   Pgno pgno;                     /* Page number for this page */
- #ifdef SQLITE_CHECK_PAGES
-@@ -43504,13 +43504,7 @@ bitvec_end:
- /* #include "sqliteInt.h" */
- 
- /*
--** A complete page cache is an instance of this structure.  Every
--** entry in the cache holds a single page of the database file.  The
--** btree layer only operates on the cached copy of the database pages.
--**
--** A page cache entry is "clean" if it exactly matches what is currently
--** on disk.  A page is "dirty" if it has been modified and needs to be
--** persisted to disk.
-+** A complete page cache is an instance of this structure.
- **
- ** pDirty, pDirtyTail, pSynced:
- **   All dirty pages are linked into the doubly linked list using
-@@ -48314,7 +48308,7 @@ static int pager_end_transaction(Pager *pPager, int hasMaster, int bCommit){
-   pPager->pInJournal = 0;
-   pPager->nRec = 0;
-   if( rc==SQLITE_OK ){
--    if( pagerFlushOnCommit(pPager, bCommit) ){
-+    if( MEMDB || pagerFlushOnCommit(pPager, bCommit) ){
-       sqlite3PcacheCleanAll(pPager->pPCache);
-     }else{
-       sqlite3PcacheClearWritable(pPager->pPCache);
--- 
-2.7.4
-
diff --git a/meta/recipes-support/sqlite/sqlite3_3.15.2.bb b/meta/recipes-support/sqlite/sqlite3_3.15.2.bb
deleted file mode 100644
index 20bc515..0000000
--- a/meta/recipes-support/sqlite/sqlite3_3.15.2.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require sqlite3.inc
-
-LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b3570bb0"
-
-SRC_URI = "\
-  http://www.sqlite.org/2016/sqlite-autoconf-${SQLITE_PV}.tar.gz \
-  file://0001-revert-ad601c7962-that-brings-2-increase-of-build-ti.patch \
-  "
-
-SRC_URI[md5sum] = "6b4fc0d8f7f02dd56bbde10a7c497a05"
-SRC_URI[sha256sum] = "07b35063b9386865b78226cdaca9a299d938a87aaa8fdc4d73edb0cef30f3149"
diff --git a/meta/recipes-support/sqlite/sqlite3_3.16.2.bb b/meta/recipes-support/sqlite/sqlite3_3.16.2.bb
new file mode 100644
index 0000000..cfbe198
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3_3.16.2.bb
@@ -0,0 +1,11 @@
+require sqlite3.inc
+
+LICENSE = "PD"
+LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b3570bb0"
+
+SRC_URI = "\
+  http://www.sqlite.org/2017/sqlite-autoconf-${SQLITE_PV}.tar.gz \
+  "
+SRC_URI[md5sum] = "5a153ef1fd2fa5845ada74deabc68e32"
+SRC_URI[sha256sum] = "65cc0c3e9366f50c0679c5ccd31432cea894bc4a3e8947dabab88c8693263615"
+
-- 
2.4.0



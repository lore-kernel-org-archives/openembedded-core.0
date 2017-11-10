Return-Path: <maxin.john@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9F901785D6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 12:00:18 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga105.fm.intel.com with ESMTP; 10 Nov 2017 04:00:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,374,1505804400"; d="scan'208";a="174742181"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 10 Nov 2017 04:00:19 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id BB57A5801AD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 04:00:18 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Nov 2017 14:00:27 +0200
Message-Id: <1510315228-24186-7-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1510315228-24186-1-git-send-email-maxin.john@intel.com>
References: <1510315228-24186-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 6/7] sqlite3: upgrade to 3.21.0
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
X-List-Received-Date: Fri, 10 Nov 2017 12:00:18 -0000

Remove upstreamed patch:
        1. sqlite3-fix-CVE-2017-13685.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../sqlite/files/sqlite3-fix-CVE-2017-13685.patch  | 57 ----------------------
 .../{sqlite3_3.20.0.bb => sqlite3_3.21.0.bb}       |  5 +-
 2 files changed, 2 insertions(+), 60 deletions(-)
 delete mode 100644 meta/recipes-support/sqlite/files/sqlite3-fix-CVE-2017-13685.patch
 rename meta/recipes-support/sqlite/{sqlite3_3.20.0.bb => sqlite3_3.21.0.bb} (52%)

diff --git a/meta/recipes-support/sqlite/files/sqlite3-fix-CVE-2017-13685.patch b/meta/recipes-support/sqlite/files/sqlite3-fix-CVE-2017-13685.patch
deleted file mode 100644
index aac428c..0000000
--- a/meta/recipes-support/sqlite/files/sqlite3-fix-CVE-2017-13685.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-Fix CVE-2017-13685
-
-The dump_callback function in SQLite 3.20.0 allows remote attackers to
-cause a denial of service (EXC_BAD_ACCESS and application crash) via a
-crafted file.
-
-References:
-https://sqlite.org/src/info/02f0f4c54f2819b3
-http://www.mail-archive.com/sqlite-users%40mailinglists.sqlite.org/msg105314.html
-
-Upstream-Status: Backport [https://sqlite.org/src/info/cf0d3715caac9149]
-
-CVE: CVE-2017-13685
-
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
-
-Index: src/shell.c
-==================================================================
---- src/shell.c
-+++ src/shell.c
-@@ -2657,10 +2657,11 @@
-   int *aiType      /* Column types */
- ){
-   int i;
-   ShellState *p = (ShellState*)pArg;
- 
-+  if( azArg==0 ) return 0;
-   switch( p->cMode ){
-     case MODE_Line: {
-       int w = 5;
-       if( azArg==0 ) break;
-       for(i=0; i<nArg; i++){
-@@ -3007,10 +3008,11 @@
- */
- static int captureOutputCallback(void *pArg, int nArg, char **azArg, char **az){
-   ShellText *p = (ShellText*)pArg;
-   int i;
-   UNUSED_PARAMETER(az);
-+  if( azArg==0 ) return 0;
-   if( p->n ) appendText(p, "|", 0);
-   for(i=0; i<nArg; i++){
-     if( i ) appendText(p, ",", 0);
-     if( azArg[i] ) appendText(p, azArg[i], 0);
-   }
-@@ -3888,11 +3890,11 @@
-   const char *zType;
-   const char *zSql;
-   ShellState *p = (ShellState *)pArg;
- 
-   UNUSED_PARAMETER(azNotUsed);
--  if( nArg!=3 ) return 1;
-+  if( nArg!=3 || azArg==0 ) return 0;
-   zTable = azArg[0];
-   zType = azArg[1];
-   zSql = azArg[2];
- 
-   if( strcmp(zTable, "sqlite_sequence")==0 ){
diff --git a/meta/recipes-support/sqlite/sqlite3_3.20.0.bb b/meta/recipes-support/sqlite/sqlite3_3.21.0.bb
similarity index 52%
rename from meta/recipes-support/sqlite/sqlite3_3.20.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.21.0.bb
index e508258..1d51733 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.20.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.21.0.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed0
 
 SRC_URI = "\
   http://www.sqlite.org/2017/sqlite-autoconf-${SQLITE_PV}.tar.gz \
-  file://sqlite3-fix-CVE-2017-13685.patch \
   "
-SRC_URI[md5sum] = "e262a28b73cc330e7e83520c8ce14e4d"
-SRC_URI[sha256sum] = "3814c6f629ff93968b2b37a70497cfe98b366bf587a2261a56a5f750af6ae6a0"
+SRC_URI[md5sum] = "7913de4c3126ba3c24689cb7a199ea31"
+SRC_URI[sha256sum] = "d7dd516775005ad87a57f428b6f86afd206cb341722927f104d3f0cf65fbbbe3"
-- 
2.4.0



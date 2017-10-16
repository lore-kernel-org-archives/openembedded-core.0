Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6CD947197E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 09:31:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v9G9VXUO002227
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 02:31:33 -0700
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 16 Oct 2017 02:31:32 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Oct 2017 02:31:32 -0700
Message-ID: <20171016093132.131344-1-wenzong.fan@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH] sqlite3: fix CVE-2017-13685
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
X-List-Received-Date: Mon, 16 Oct 2017 09:31:33 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

The dump_callback function in SQLite 3.20.0 allows remote attackers to
cause a denial of service (EXC_BAD_ACCESS and application crash) via a
crafted file.

Backport patch to fix the issue. Some references:
https://sqlite.org/src/info/02f0f4c54f2819b3
http://www.mail-archive.com/sqlite-users%40mailinglists.sqlite.org/msg105314.html

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../sqlite/files/sqlite3-fix-CVE-2017-13685.patch  | 57 ++++++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.20.0.bb      |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/sqlite3-fix-CVE-2017-13685.patch

diff --git a/meta/recipes-support/sqlite/files/sqlite3-fix-CVE-2017-13685.patch b/meta/recipes-support/sqlite/files/sqlite3-fix-CVE-2017-13685.patch
new file mode 100644
index 0000000000..aac428c821
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/sqlite3-fix-CVE-2017-13685.patch
@@ -0,0 +1,57 @@
+Fix CVE-2017-13685
+
+The dump_callback function in SQLite 3.20.0 allows remote attackers to
+cause a denial of service (EXC_BAD_ACCESS and application crash) via a
+crafted file.
+
+References:
+https://sqlite.org/src/info/02f0f4c54f2819b3
+http://www.mail-archive.com/sqlite-users%40mailinglists.sqlite.org/msg105314.html
+
+Upstream-Status: Backport [https://sqlite.org/src/info/cf0d3715caac9149]
+
+CVE: CVE-2017-13685
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+
+Index: src/shell.c
+==================================================================
+--- src/shell.c
++++ src/shell.c
+@@ -2657,10 +2657,11 @@
+   int *aiType      /* Column types */
+ ){
+   int i;
+   ShellState *p = (ShellState*)pArg;
+ 
++  if( azArg==0 ) return 0;
+   switch( p->cMode ){
+     case MODE_Line: {
+       int w = 5;
+       if( azArg==0 ) break;
+       for(i=0; i<nArg; i++){
+@@ -3007,10 +3008,11 @@
+ */
+ static int captureOutputCallback(void *pArg, int nArg, char **azArg, char **az){
+   ShellText *p = (ShellText*)pArg;
+   int i;
+   UNUSED_PARAMETER(az);
++  if( azArg==0 ) return 0;
+   if( p->n ) appendText(p, "|", 0);
+   for(i=0; i<nArg; i++){
+     if( i ) appendText(p, ",", 0);
+     if( azArg[i] ) appendText(p, azArg[i], 0);
+   }
+@@ -3888,11 +3890,11 @@
+   const char *zType;
+   const char *zSql;
+   ShellState *p = (ShellState *)pArg;
+ 
+   UNUSED_PARAMETER(azNotUsed);
+-  if( nArg!=3 ) return 1;
++  if( nArg!=3 || azArg==0 ) return 0;
+   zTable = azArg[0];
+   zType = azArg[1];
+   zSql = azArg[2];
+ 
+   if( strcmp(zTable, "sqlite_sequence")==0 ){
diff --git a/meta/recipes-support/sqlite/sqlite3_3.20.0.bb b/meta/recipes-support/sqlite/sqlite3_3.20.0.bb
index 417c36202d..e50825833e 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.20.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.20.0.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed0
 
 SRC_URI = "\
   http://www.sqlite.org/2017/sqlite-autoconf-${SQLITE_PV}.tar.gz \
+  file://sqlite3-fix-CVE-2017-13685.patch \
   "
 SRC_URI[md5sum] = "e262a28b73cc330e7e83520c8ce14e4d"
 SRC_URI[sha256sum] = "3814c6f629ff93968b2b37a70497cfe98b366bf587a2261a56a5f750af6ae6a0"
-- 
2.13.0



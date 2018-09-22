Return-Path: <okaya@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 9935A798C5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Sep 2018 01:40:04 +0000 (UTC)
Received: from
	sinanubuntu1604.mkjiurmyylmellclgttazegk5f.bx.internal.cloudapp.net
	(unknown [137.117.33.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id CC36D2157F;
	Sat, 22 Sep 2018 01:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1537580406;
	bh=qsVEE/3W9n/wpMkz2V/NCbHOOw5bmaEPLYAuXnj9ekY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g55iKy403leRWKbcHczX/WfjIZ0uKcvR4f7MAFpvhFA+YZJKmXxf0mp7oc+BPXi86
	uAK9dov2xphIUa+nS5Xhii97x7oSVtLPuP17tEjBgJmuK8Tn9ESLB+fBpXpegd6iRe
	ybG8HZPys5PgE1CN5PVrC0pcr0Yg2rwsIv8/OQ4g=
From: Sinan Kaya <okaya@kernel.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Sep 2018 01:40:03 +0000
Message-Id: <20180922014003.31866-3-okaya@kernel.org>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20180922014003.31866-1-okaya@kernel.org>
References: <20180922014003.31866-1-okaya@kernel.org>
MIME-Version: 1.0
Subject: [sumo] [PATCH v2 3/3] sqlite3: CVE-2018-8740
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
X-List-Received-Date: Sat, 22 Sep 2018 01:40:04 -0000
Content-Transfer-Encoding: 8bit

* CVE-2018-8740
In SQLite through 3.22.0, databases whose schema is corrupted
using a CREATE TABLE AS statement could cause a NULL pointer dereference,
related to build.c and prepare.c.

Affects sqlite3 <= 3.22.0

CVE: CVE-2018-8740
Ref: https://access.redhat.com/security/cve/cve-2018-8740
Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 .../sqlite/files/CVE-2018-8740.patch          | 47 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.22.0.bb |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2018-8740.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2018-8740.patch b/meta/recipes-support/sqlite/files/CVE-2018-8740.patch
new file mode 100644
index 0000000000..5d95e37afe
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2018-8740.patch
@@ -0,0 +1,47 @@
+From 19aed4d2be46c4516caf2bee31f79044bbd1d57d Mon Sep 17 00:00:00 2001
+From: Sinan Kaya <okaya@kernel.org>
+Date: Fri, 21 Sep 2018 16:22:01 +0000
+Subject: [PATCH] Detect databases whose schema is corrupted using a CREATE TABLE AS statement and issue an appropriate error message
+
+Upstream-Status: Backport [ https://www.sqlite.org/cgi/src/vdiff?from=1774f1c3baf0bc3d&to=d75e67654aa9620b&diff=1&w]
+Signed-off-by: Sinan Kaya <okaya@kernel.org>
+---
+ sqlite3.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 73c69ef..6863bc6 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -103474,8 +103474,6 @@ SQLITE_PRIVATE void sqlite3EndTable(
+   p = pParse->pNewTable;
+   if( p==0 ) return;
+ 
+-  assert( !db->init.busy || !pSelect );
+-
+   /* If the db->init.busy is 1 it means we are reading the SQL off the
+   ** "sqlite_master" or "sqlite_temp_master" table on the disk.
+   ** So do not write to the disk again.  Extract the root page number
+@@ -103486,6 +103484,10 @@ SQLITE_PRIVATE void sqlite3EndTable(
+   ** table itself.  So mark it read-only.
+   */
+   if( db->init.busy ){
++    if( pSelect ){
++     sqlite3ErrorMsg(pParse, "");
++     return;
++    }
+     p->tnum = db->init.newTnum;
+     if( p->tnum==1 ) p->tabFlags |= TF_Readonly;
+   }
+@@ -117813,7 +117815,7 @@ static void corruptSchema(
+     char *z;
+     if( zObj==0 ) zObj = "?";
+     z = sqlite3MPrintf(db, "malformed database schema (%s)", zObj);
+-    if( zExtra ) z = sqlite3MPrintf(db, "%z - %s", z, zExtra);
++    if( zExtra && zExtra[0] ) z = sqlite3MPrintf(db, "%z - %s", z, zExtra);
+     sqlite3DbFree(db, *pData->pzErrMsg);
+     *pData->pzErrMsg = z;
+   }
+-- 
+2.19.0
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.22.0.bb b/meta/recipes-support/sqlite/sqlite3_3.22.0.bb
index ef88659e97..b90f89886a 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.22.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.22.0.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed0
 
 SRC_URI = "\
   http://www.sqlite.org/2018/sqlite-autoconf-${SQLITE_PV}.tar.gz \
+  file://CVE-2018-8740.patch \
   "
 SRC_URI[md5sum] = "96b5648d542e8afa6ab7ffb8db8ddc3d"
 SRC_URI[sha256sum] = "2824ab1238b706bc66127320afbdffb096361130e23291f26928a027b885c612"
-- 
2.19.0



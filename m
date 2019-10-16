Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 88A0A7C127
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 02:05:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x9G25OC9014457
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 19:05:24 -0700 (PDT)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Tue, 15 Oct 2019 19:05:18 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Oct 2019 10:05:17 +0800
Message-ID: <20191016020517.20354-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [zeus][PATCH] sqlite3: fix CVE-2019-16168
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
X-List-Received-Date: Wed, 16 Oct 2019 02:05:23 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../files/0001-Fix-CVE-2019-16168.patch       | 40 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.29.0.bb |  3 +-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/sqlite/files/0001-Fix-CVE-2019-16168.patch

diff --git a/meta/recipes-support/sqlite/files/0001-Fix-CVE-2019-16168.patch b/meta/recipes-support/sqlite/files/0001-Fix-CVE-2019-16168.patch
new file mode 100644
index 0000000000..7c4a65b3cd
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/0001-Fix-CVE-2019-16168.patch
@@ -0,0 +1,40 @@
+From fcf06b0b426e6c243d6ca2d6c6a02830717ab6a3 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 15 Oct 2019 13:22:52 +0800
+Subject: [PATCH] Fix CVE-2019-16168
+
+CVE: CVE-2019-16168
+
+Upstream-Status: Backport [https://www.sqlite.org/src/vpatch?from=4f5b2d938194fab7&to=98357d8c1263920b]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ sqlite3.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 61bfdeb..b3e6ae2 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -105933,7 +105933,9 @@ static void decodeIntArray(
+       if( sqlite3_strglob("unordered*", z)==0 ){
+         pIndex->bUnordered = 1;
+       }else if( sqlite3_strglob("sz=[0-9]*", z)==0 ){
+-        pIndex->szIdxRow = sqlite3LogEst(sqlite3Atoi(z+3));
++        int sz = sqlite3Atoi(z+3);
++        if( sz<2 ) sz = 2;
++        pIndex->szIdxRow = sqlite3LogEst(sz);
+       }else if( sqlite3_strglob("noskipscan*", z)==0 ){
+         pIndex->noSkipScan = 1;
+       }
+@@ -143260,6 +143262,7 @@ static int whereLoopAddBtreeIndex(
+     ** it to pNew->rRun, which is currently set to the cost of the index
+     ** seek only. Then, if this is a non-covering index, add the cost of
+     ** visiting the rows in the main table.  */
++    assert( pSrc->pTab->szTabRow>0 );
+     rCostIdx = pNew->nOut + 1 + (15*pProbe->szIdxRow)/pSrc->pTab->szTabRow;
+     pNew->rRun = sqlite3LogEstAdd(rLogSize, rCostIdx);
+     if( (pNew->wsFlags & (WHERE_IDX_ONLY|WHERE_IPK))==0 ){
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.29.0.bb b/meta/recipes-support/sqlite/sqlite3_3.29.0.bb
index 07e36bede7..34066fbe89 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.29.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.29.0.bb
@@ -3,6 +3,7 @@ require sqlite3.inc
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
-SRC_URI = "http://www.sqlite.org/2019/sqlite-autoconf-${SQLITE_PV}.tar.gz"
+SRC_URI = "http://www.sqlite.org/2019/sqlite-autoconf-${SQLITE_PV}.tar.gz \
+           file://0001-Fix-CVE-2019-16168.patch"
 SRC_URI[md5sum] = "8f3dfe83387e62ecb91c7c5c09c688dc"
 SRC_URI[sha256sum] = "8e7c1e2950b5b04c5944a981cb31fffbf9d2ddda939d536838ebc854481afd5b"
-- 
2.17.1



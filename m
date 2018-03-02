Return-Path: <andrej.valek@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id D3D6A7897D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 08:14:04 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id w228E4Wb002551
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Mar 2018 09:14:04 +0100
Received: from dev.vm6.ccp.siemens.com (sk1d124c.siemens.sk [163.242.57.217])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id w228E4Uj015074;
	Fri, 2 Mar 2018 09:14:04 +0100
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 61B3574CEF2;
	Fri,  2 Mar 2018 09:14:04 +0100 (CET)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Mar 2018 09:13:51 +0100
Message-Id: <20180302081351.18541-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] busybox: fix CVE-2017-15873
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
X-List-Received-Date: Fri, 02 Mar 2018 08:14:05 -0000

Signed-off-by: Radovan Scasny <radovan.scasny@siemens.com>
Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../busybox/busybox/CVE-2017-15873.patch           | 95 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.27.2.bb        |  1 +
 2 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2017-15873.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2017-15873.patch b/meta/recipes-core/busybox/busybox/CVE-2017-15873.patch
new file mode 100644
index 0000000000..5a027c9bcc
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2017-15873.patch
@@ -0,0 +1,95 @@
+busybox-1.27.2: Fix CVE-2017-15873
+
+[No upstream tracking] -- https://bugs.busybox.net/show_bug.cgi?id=10431
+
+bunzip2: fix runCnt overflow
+
+The get_next_block function in archival/libarchive/decompress_bunzip2.c
+in BusyBox 1.27.2 has an Integer Overflow that may lead to a write 
+access violation.
+
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=0402cb32df015d9372578e3db27db47b33d5c7b0]
+CVE: CVE-2017-15873
+bug: 10431
+Signed-off-by: Radovan Scasny <radovan.scasny@siemens.com>
+
+diff --git a/archival/libarchive/decompress_bunzip2.c b/archival/libarchive/decompress_bunzip2.c
+index 7cd18f5..bec89ed 100644
+--- a/archival/libarchive/decompress_bunzip2.c
++++ b/archival/libarchive/decompress_bunzip2.c
+@@ -156,15 +156,15 @@ static unsigned get_bits(bunzip_data *bd, int bits_wanted)
+ static int get_next_block(bunzip_data *bd)
+ {
+ 	struct group_data *hufGroup;
+-	int dbufCount, dbufSize, groupCount, *base, *limit, selector,
+-		i, j, runPos, symCount, symTotal, nSelectors, byteCount[256];
+-	int runCnt = runCnt; /* for compiler */
++	int groupCount, *base, *limit, selector,
++		i, j, symCount, symTotal, nSelectors, byteCount[256];
+ 	uint8_t uc, symToByte[256], mtfSymbol[256], *selectors;
+ 	uint32_t *dbuf;
+ 	unsigned origPtr, t;
++	unsigned dbufCount, runPos;
++	unsigned runCnt = runCnt; /* for compiler */
+ 
+ 	dbuf = bd->dbuf;
+-	dbufSize = bd->dbufSize;
+ 	selectors = bd->selectors;
+ 
+ /* In bbox, we are ok with aborting through setjmp which is set up in start_bunzip */
+@@ -187,7 +187,7 @@ static int get_next_block(bunzip_data *bd)
+ 	   it didn't actually work. */
+ 	if (get_bits(bd, 1)) return RETVAL_OBSOLETE_INPUT;
+ 	origPtr = get_bits(bd, 24);
+-	if ((int)origPtr > dbufSize) return RETVAL_DATA_ERROR;
++	if (origPtr > bd->dbufSize) return RETVAL_DATA_ERROR;
+ 
+ 	/* mapping table: if some byte values are never used (encoding things
+ 	   like ascii text), the compression code removes the gaps to have fewer
+@@ -435,7 +435,14 @@ static int get_next_block(bunzip_data *bd)
+ 			   symbols, but a run of length 0 doesn't mean anything in this
+ 			   context).  Thus space is saved. */
+ 			runCnt += (runPos << nextSym); /* +runPos if RUNA; +2*runPos if RUNB */
+-			if (runPos < dbufSize) runPos <<= 1;
++//The 32-bit overflow of runCnt wasn't yet seen, but probably can happen.
++//This would be the fix (catches too large count way before it can overflow):
++//			if (runCnt > bd->dbufSize) {
++//				dbg("runCnt:%u > dbufSize:%u RETVAL_DATA_ERROR",
++//						runCnt, bd->dbufSize);
++//				return RETVAL_DATA_ERROR;
++//			}
++			if (runPos < bd->dbufSize) runPos <<= 1;
+ 			goto end_of_huffman_loop;
+ 		}
+ 
+@@ -445,14 +452,15 @@ static int get_next_block(bunzip_data *bd)
+ 		   literal used is the one at the head of the mtfSymbol array.) */
+ 		if (runPos != 0) {
+ 			uint8_t tmp_byte;
+-			if (dbufCount + runCnt > dbufSize) {
+-				dbg("dbufCount:%d+runCnt:%d %d > dbufSize:%d RETVAL_DATA_ERROR",
+-						dbufCount, runCnt, dbufCount + runCnt, dbufSize);
++			if (dbufCount + runCnt > bd->dbufSize) {
++				dbg("dbufCount:%u+runCnt:%u %u > dbufSize:%u RETVAL_DATA_ERROR",
++						dbufCount, runCnt, dbufCount + runCnt, bd->dbufSize);
+ 				return RETVAL_DATA_ERROR;
+ 			}
+ 			tmp_byte = symToByte[mtfSymbol[0]];
+ 			byteCount[tmp_byte] += runCnt;
+-			while (--runCnt >= 0) dbuf[dbufCount++] = (uint32_t)tmp_byte;
++			while ((int)--runCnt >= 0)
++				dbuf[dbufCount++] = (uint32_t)tmp_byte;
+ 			runPos = 0;
+ 		}
+ 
+@@ -466,7 +474,7 @@ static int get_next_block(bunzip_data *bd)
+ 		   first symbol in the mtf array, position 0, would have been handled
+ 		   as part of a run above.  Therefore 1 unused mtf position minus
+ 		   2 non-literal nextSym values equals -1.) */
+-		if (dbufCount >= dbufSize) return RETVAL_DATA_ERROR;
++		if (dbufCount >= bd->dbufSize) return RETVAL_DATA_ERROR;
+ 		i = nextSym - 1;
+ 		uc = mtfSymbol[i];
+ 
+-- 
+cgit v0.12
diff --git a/meta/recipes-core/busybox/busybox_1.27.2.bb b/meta/recipes-core/busybox/busybox_1.27.2.bb
index 6c1f4888cf..36a6342aaf 100644
--- a/meta/recipes-core/busybox/busybox_1.27.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.27.2.bb
@@ -43,6 +43,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://runlevel \
            file://makefile-libbb-race.patch \
            file://CVE-2011-5325.patch \
+           file://CVE-2017-15873.patch \
            file://busybox-CVE-2017-16544.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
-- 
2.11.0



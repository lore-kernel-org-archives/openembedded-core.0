Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 2EB6C6173C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 21:56:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48PQJn5Pjxz40
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 22:56:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582322185;
	bh=Lbv3FZujnZd861df5BzafEj/g57g7jwMlRohfguF6WE=;
	h=From:To:Subject:Date:From;
	b=W4DQOZdANRuQL+nZWvDATcwL1jb8m+IsyMSmvrANpQFW+7JuCC2HUNGCkjw/L3wR6
	ANxWMwYiATeE6lre2k2AHrb1p3+kM555s10EVd+UFya4DOMNLJJCILHC5NOzvaROWb
	cf1b4iqo6Zjvp3W6LXLE1+PwzbJQXpheLuBgh4b61OxdXwrQjsVBGiOUizuW9NLMpt
	ZMjTeNwMGhIGT8dwJL2z4q8UGcE6xKoSJUumDPIwpjvDCCPT4bsW2OHWqgC+AAWQRQ
	XbDbwddu1zR4Bh7L5/a3ui+/FSmRNjIjavuu965B14YOFIQRwnMcM5jZywQymDSFk0
	+GSZlrtO0JeEvXCMHTtRXpj/qyhaZNNzbp3IoR2XnyFYJLb+BIsFl2T0vA+1C8ksBA
	psCA75VV8+uV+B3pb8t66/BWK+5d8o+FEywBjYUf9gSKzdU4F/wSVr8fVXMB/5VzsK
	w0mIn1HDIsjpDuTEnccAJcg0CZcoQUflu1u0OyIhCYMDyFT11lN47Arynp+3E3PJt2
	QRDOxvlcMEI5R4tdPptIDihqZp+231U28vSvqs97L4dN9DvwygTa+gxtakKbv95A88
	2hKsUaIRXY6Cwf3MuzH2FHGXj8vxMLubL2K4g1wBcHfJWu0iN34X0cgKCKqsQHZpnQ
	v0UtA2dYC8zbRFG/Z07YsdOQ=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Feb 2020 23:56:23 +0200
Message-Id: <20200221215624.4102-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH 1/2] sqlite3: fix CVE-2019-16168
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
X-List-Received-Date: Fri, 21 Feb 2020 21:56:28 -0000

From: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../files/0001-Fix-CVE-2019-16168.patch       | 40 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.27.2.bb |  1 +
 2 files changed, 41 insertions(+)
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
diff --git a/meta/recipes-support/sqlite/sqlite3_3.27.2.bb b/meta/recipes-support/sqlite/sqlite3_3.27.2.bb
index 4bdb04f4d1..2888a56ee9 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.27.2.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.27.2.bb
@@ -7,6 +7,7 @@ SRC_URI = "\
   http://www.sqlite.org/2019/sqlite-autoconf-${SQLITE_PV}.tar.gz \
   file://CVE-2019-9936.patch \
   file://CVE-2019-9937.patch \
+  file://0001-Fix-CVE-2019-16168.patch \
   "
 
 SRC_URI[md5sum] = "1f72631ce6e8efa5b4a6e55a43b3bdc0"
-- 
2.17.1



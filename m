Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 509927E428
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 21:41:28 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id t1so2768107pgc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 14:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ewkGSRcMMCiBXeERIu/cCFTbQGdHQqOygn0TvVb0PLE=;
	b=anLOK8DqmjbUUUhAQ3Njg8TRQ6SLcD+Aqz5y5iWi8dlp2qrCV+bcYTRBz7SNX+L7p0
	LrW39GCDLPzSizLKkVsZhUk29csZPNNQd82hfIMuT3xaDNcIqazKcCxZp2Nb5hIFho/Q
	8vwnOh6dNvEH6hLCWPFJKLvekilmMX0elvnLkW8mWGzc3iW4ADcfKApQyak9WEsK4if4
	H0eXM4H+GRFMqzklctJ5qcSmaJqwEZR4h/3BSPFRvfHYCzfzY51PD+/qSTQe226Aktbk
	f97j44PiOZn8piwgaaFy+WT/kvnuB33vAsF+4/otQVcHq+xN5Dx/CwSqSvAVUtWrdoOK
	uZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ewkGSRcMMCiBXeERIu/cCFTbQGdHQqOygn0TvVb0PLE=;
	b=mPBgsRRD01v54P4r2zk83IvvbjMJZ92ndFvkha+knrRp1HLHuA1nA2SNq/1GB6dHgw
	lDL2g2FCBREwaVu1SU6pEfrLSsxPeA6eMtoBmg0MAUAbgWpPaISYngC2hXhQH7lYWwwq
	X17Z1LA+DtyMDSkhNxLQGZCZ/81kiyomwf70MNFW7hQ3z+DKH1+FKh16X/A+vQt+B8oL
	lloE1DPiB1ZrbGv99kDWo3/xzhozGKkEPji3QOUjwh8aveXppcFcUCCUTb1wy7ZmXFf1
	FqgrEauEYTJ0fFO1OrCAXjYnfwxZszrB4wu5gNiTZBMigmej5DtlAZK5CLjMC6xFO/1k
	b9iA==
X-Gm-Message-State: APjAAAWOanFhuBYE1xjnUwVQpPrAz6jHT7ZzwNLhrvWniRtoHrZtBzD4
	pornfTWOq7YEZG+wrzAC1amoQnuJ
X-Google-Smtp-Source: APXvYqzEFm7oSAJ4T91Ku1cbXddtMblIWdBBlQdHZkHwNvkxkyVpVcwoGxed52hEeskntC5IiaeO8w==
X-Received: by 2002:a63:ee0b:: with SMTP id e11mr5685669pgi.453.1559252489016; 
	Thu, 30 May 2019 14:41:29 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:4865:9151:ec2:e220])
	by smtp.gmail.com with ESMTPSA id
	c142sm4189189pfb.171.2019.05.30.14.41.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 May 2019 14:41:28 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2019 14:41:25 -0700
Message-Id: <1559252485-2953-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559252485-2953-1-git-send-email-akuster808@gmail.com>
References: <1559252485-2953-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [thud][PATCH 3/3] sqlite3: Security fixes CVE-2019-9936, 9937
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
X-List-Received-Date: Thu, 30 May 2019 21:41:28 -0000

From: Armin Kuster <akuster@mvista.com>

Source: OpenEmbedded.org
MR: 98324, 97484
Type: Security Fix
Disposition: Backport from https://git.openembedded.org/openembedded-core/commit/meta/recipes-support/sqlite?h=warrior&id=4ec161ea684b305b303f32e96ce23f472c82e1a1
ChangeID: 9bb19b8794f532caee85893dc8cb5d037b3a8eec
Description:

Backports from Warrior with minor fixups for thud

Fixes:
CVE-2019-9936
CVE-2019-9937

Affects < 3.27.2

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../sqlite/files/CVE-2019-9936.patch               |  31 ++++
 .../sqlite/files/CVE-2019-9937.patch               | 189 +++++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.23.1.bb      |   2 +
 3 files changed, 222 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2019-9936.patch
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2019-9937.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2019-9936.patch b/meta/recipes-support/sqlite/files/CVE-2019-9936.patch
new file mode 100644
index 0000000..91ac0e0
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2019-9936.patch
@@ -0,0 +1,31 @@
+Running fts5 prefix queries inside a transaction could trigger a heap-based
+buffer over-read in fts5HashEntrySort in sqlite3.c, which may lead to an
+information leak.
+
+CVE: CVE-2019-9936
+Upstream-Status: Backport [https://sqlite.org/src/vpatch?from=45c73deb440496e8&to=b3fa58dd7403dbd4]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+[refreshed for Thud]
+Affects < 3.27.2
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ sqlite3.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+Index: sqlite-autoconf-3230100/sqlite3.c
+===================================================================
+--- sqlite-autoconf-3230100.orig/sqlite3.c
++++ sqlite-autoconf-3230100/sqlite3.c
+@@ -196437,7 +196437,9 @@ static int fts5HashEntrySort(
+   for(iSlot=0; iSlot<pHash->nSlot; iSlot++){
+     Fts5HashEntry *pIter;
+     for(pIter=pHash->aSlot[iSlot]; pIter; pIter=pIter->pHashNext){
+-      if( pTerm==0 || 0==memcmp(fts5EntryKey(pIter), pTerm, nTerm) ){
++      if( pTerm==0
++       || (pIter->nKey+1>=nTerm && 0==memcmp(fts5EntryKey(pIter), pTerm, nTerm))
++      ){
+         Fts5HashEntry *pEntry = pIter;
+         pEntry->pScanNext = 0;
+         for(i=0; ap[i]; i++){
diff --git a/meta/recipes-support/sqlite/files/CVE-2019-9937.patch b/meta/recipes-support/sqlite/files/CVE-2019-9937.patch
new file mode 100644
index 0000000..337df0d
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2019-9937.patch
@@ -0,0 +1,189 @@
+Interleaving reads and writes in a single transaction with an fts5 virtual table
+will lead to a NULL Pointer Dereference in fts5ChunkIterate in sqlite3.c.
+
+CVE: CVE-2019-9937
+Upstream-Status: Backport [https://sqlite.org/src/vpatch?from=c2f50aa4e7bad882&to=45c73deb440496e8]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+[Refreshed for thud]
+Affects <= 3.27.2
+Signed-off-by: Armin kuster <akuster@mvista.com>
+
+---
+ sqlite3.c | 83 ++++++++++++++++++++++++++++++++++++++-----------------
+ 1 file changed, 57 insertions(+), 26 deletions(-)
+
+Index: sqlite-autoconf-3230100/sqlite3.c
+===================================================================
+--- sqlite-autoconf-3230100.orig/sqlite3.c
++++ sqlite-autoconf-3230100/sqlite3.c
+@@ -189439,8 +189439,9 @@ static void sqlite3Fts5HashClear(Fts5Has
+ 
+ static int sqlite3Fts5HashQuery(
+   Fts5Hash*,                      /* Hash table to query */
++  int nPre,
+   const char *pTerm, int nTerm,   /* Query term */
+-  const u8 **ppDoclist,           /* OUT: Pointer to doclist for pTerm */
++  void **ppObj,			  /* OUT: Pointer to doclist for pTerm */
+   int *pnDoclist                  /* OUT: Size of doclist in bytes */
+ );
+ 
+@@ -196179,19 +196180,25 @@ static int fts5HashResize(Fts5Hash *pHas
+   return SQLITE_OK;
+ }
+ 
+-static void fts5HashAddPoslistSize(Fts5Hash *pHash, Fts5HashEntry *p){
++static int fts5HashAddPoslistSize(
++  Fts5Hash *pHash,
++  Fts5HashEntry *p,
++  Fts5HashEntry *p2
++){
++  int nRet = 0;
+   if( p->iSzPoslist ){
+-    u8 *pPtr = (u8*)p;
++    u8 *pPtr = p2 ? (u8*)p2 : (u8*)p;
++    int nData = p->nData;
+     if( pHash->eDetail==FTS5_DETAIL_NONE ){
+-      assert( p->nData==p->iSzPoslist );
++      assert( nData==p->iSzPosList );
+       if( p->bDel ){
+-        pPtr[p->nData++] = 0x00;
++        pPtr[nData++] = 0x00;
+         if( p->bContent ){
+-          pPtr[p->nData++] = 0x00;
++          pPtr[nData++] = 0x00;
+         }
+       }
+     }else{
+-      int nSz = (p->nData - p->iSzPoslist - 1);       /* Size in bytes */
++      int nSz = (nData - p->iSzPoslist - 1);       /* Size in bytes */
+       int nPos = nSz*2 + p->bDel;                     /* Value of nPos field */
+ 
+       assert( p->bDel==0 || p->bDel==1 );
+@@ -196201,14 +196208,19 @@ static void fts5HashAddPoslistSize(Fts5H
+         int nByte = sqlite3Fts5GetVarintLen((u32)nPos);
+         memmove(&pPtr[p->iSzPoslist + nByte], &pPtr[p->iSzPoslist + 1], nSz);
+         sqlite3Fts5PutVarint(&pPtr[p->iSzPoslist], nPos);
+-        p->nData += (nByte-1);
++        nData += (nByte-1);
+       }
+     }
+ 
+-    p->iSzPoslist = 0;
+-    p->bDel = 0;
+-    p->bContent = 0;
++    nRet = nData - p->nData;
++    if( p2 == 0 ){
++      p->iSzPoslist = 0;
++      p->bDel = 0;
++      p->bContent = 0;
++      p->nData = nData;
++    }
+   }
++  return nRet;
+ }
+ 
+ /*
+@@ -196320,7 +196332,7 @@ static int sqlite3Fts5HashWrite(
+   /* If this is a new rowid, append the 4-byte size field for the previous
+   ** entry, and the new rowid for this entry.  */
+   if( iRowid!=p->iRowid ){
+-    fts5HashAddPoslistSize(pHash, p);
++    fts5HashAddPoslistSize(pHash, p, 0);
+     p->nData += sqlite3Fts5PutVarint(&pPtr[p->nData], iRowid - p->iRowid);
+     p->iRowid = iRowid;
+     bNew = 1;
+@@ -196467,8 +196479,9 @@ static int fts5HashEntrySort(
+ */
+ static int sqlite3Fts5HashQuery(
+   Fts5Hash *pHash,                /* Hash table to query */
++  int nPre,
+   const char *pTerm, int nTerm,   /* Query term */
+-  const u8 **ppDoclist,           /* OUT: Pointer to doclist for pTerm */
++  void **ppOut,			  /* OUT: Pointer to new object */
+   int *pnDoclist                  /* OUT: Size of doclist in bytes */
+ ){
+   unsigned int iHash = fts5HashKey(pHash->nSlot, (const u8*)pTerm, nTerm);
+@@ -196481,11 +196494,20 @@ static int sqlite3Fts5HashQuery(
+   }
+ 
+   if( p ){
+-    fts5HashAddPoslistSize(pHash, p);
+-    *ppDoclist = (const u8*)&zKey[nTerm+1];
+-    *pnDoclist = p->nData - (sizeof(Fts5HashEntry) + nTerm + 1);
++    int nHashPre = sizeof(Fts5HashEntry) + nTerm + 1;
++    int nList = p->nData - nHashPre;
++    u8 *pRet = (u8*)(*ppOut = sqlite3_malloc64(nPre + nList + 10));
++    if ( pRet ){
++       Fts5HashEntry *pFaux = (Fts5HashEntry*)&pRet[nPre-nHashPre];
++       memcpy(&pRet[nPre], &((u8*)p)[nHashPre], nList);
++       nList += fts5HashAddPoslistSize(pHash, p, pFaux);
++       *pnDoclist = nList;
++    }else{
++       *pnDoclist = 0;
++       return SQLITE_NOMEM;
++    }
+   }else{
+-    *ppDoclist = 0;
++    *ppOut = 0;
+     *pnDoclist = 0;
+   }
+ 
+@@ -196518,7 +196540,7 @@ static void sqlite3Fts5HashScanEntry(
+   if( (p = pHash->pScan) ){
+     char *zKey = fts5EntryKey(p);
+     int nTerm = (int)strlen(zKey);
+-    fts5HashAddPoslistSize(pHash, p);
++    fts5HashAddPoslistSize(pHash, p, 0);
+     *pzTerm = zKey;
+     *ppDoclist = (const u8*)&zKey[nTerm+1];
+     *pnDoclist = p->nData - (sizeof(Fts5HashEntry) + nTerm + 1);
+@@ -198979,31 +199001,40 @@ static void fts5SegIterHashInit(
+   int flags,                      /* Mask of FTS5INDEX_XXX flags */
+   Fts5SegIter *pIter              /* Object to populate */
+ ){
+-  const u8 *pList = 0;
+   int nList = 0;
+   const u8 *z = 0;
+   int n = 0;
++  Fts5Data *pLeaf = 0;
+ 
+   assert( p->pHash );
+   assert( p->rc==SQLITE_OK );
+ 
+   if( pTerm==0 || (flags & FTS5INDEX_QUERY_SCAN) ){
++    const u8 *pList = 0;
++
+     p->rc = sqlite3Fts5HashScanInit(p->pHash, (const char*)pTerm, nTerm);
+     sqlite3Fts5HashScanEntry(p->pHash, (const char**)&z, &pList, &nList);
+     n = (z ? (int)strlen((const char*)z) : 0);
++    if ( pList ){
++      pLeaf = fts5IdxMalloc(p, sizeof(Fts5Data));
++      if ( pLeaf ){
++        pLeaf->p = pList;
++      }
++    }
+   }else{
+-    pIter->flags |= FTS5_SEGITER_ONETERM;
+-    sqlite3Fts5HashQuery(p->pHash, (const char*)pTerm, nTerm, &pList, &nList);
++    p->rc = sqlite3Fts5HashQuery(p->pHash, sizeof(Fts5Data),
++        (const char*)pTerm, nTerm, (void**)&pLeaf, &nList
++    );
++    if( pLeaf ){
++      pLeaf->p = (u8*)&pLeaf[1];
++    }
+     z = pTerm;
+     n = nTerm;
++    pIter->flags |= FTS5_SEGITER_ONETERM;
+   }
+ 
+-  if( pList ){
+-    Fts5Data *pLeaf;
++  if( pLeaf ){
+     sqlite3Fts5BufferSet(&p->rc, &pIter->term, n, z);
+-    pLeaf = fts5IdxMalloc(p, sizeof(Fts5Data));
+-    if( pLeaf==0 ) return;
+-    pLeaf->p = (u8*)pList;
+     pLeaf->nn = pLeaf->szLeaf = nList;
+     pIter->pLeaf = pLeaf;
+     pIter->iLeafOffset = fts5GetVarint(pLeaf->p, (u64*)&pIter->iRowid);
diff --git a/meta/recipes-support/sqlite/sqlite3_3.23.1.bb b/meta/recipes-support/sqlite/sqlite3_3.23.1.bb
index d214ea1..d4f6dc4 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.23.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.23.1.bb
@@ -7,6 +7,8 @@ SRC_URI = "\
   http://www.sqlite.org/2018/sqlite-autoconf-${SQLITE_PV}.tar.gz \
   file://CVE-2018-20505.patch \
   file://CVE-2018-20506.patch \
+  file://CVE-2019-9936.patch \
+  file://CVE-2019-9937.patch \
   "
 SRC_URI[md5sum] = "99a51b40a66872872a91c92f6d0134fa"
 SRC_URI[sha256sum] = "92842b283e5e744eff5da29ed3c69391de7368fccc4d0ee6bf62490ce555ef25"
-- 
2.7.4



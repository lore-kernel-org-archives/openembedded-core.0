Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id BA86A7D20C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 23:30:08 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id y13so348178wrd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 16:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Dlug38K42a6BvgEWnAeMLXhBcGnPMmYNk6P7FLOnR78=;
	b=z0ahBH3SkpBJyybjVpw9KiiftT/gB0JgyxHYeLpgqy2LRgy9oNM+8csV++QZtQa0bJ
	+es+9CCMlNwD7vL+egSHIJQ+YU/HhrYOSrQzrvB36Vx6Ct6e0UZHcuWLw0MLFzldCxSn
	cyjP4KG0N4LQhLhjXwKG2OiJHUjYTJSMDkOzcFNaWjXIA6A4DNBOgB4KuX3zA+gtRyja
	PpPmEa9YbEEzsDhJQ9liNqKzsIEYf0EqKJtXsSaIluEeH9zFBoRbCoJals4M4UVEPp9o
	Lj42jTD4BTJo10IdZPRaCy79x/6TPFaNL8pVYk7i34JVwzDs99jlsTv18Y5A+cnIVC1U
	gGZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Dlug38K42a6BvgEWnAeMLXhBcGnPMmYNk6P7FLOnR78=;
	b=SYvvNtl5HSBud7AYNhqspb7e+IIrRPFukSCQZ/k3pdumvqOH5gQIrtNia0whBmHVIs
	pplHVKAuJMFqAVcA2yCGiJU/gmv0z7vDvgnEUwAO1urTmDv2JiMNDvvooqkf3YmKIIO7
	HHTzdlWjpx8xvs4sMXhR5Yc+J6EWXVHubZmHHXdK2ljCXXUyiPwM4XFIII5cBqv6uKsD
	b+0qHIdzSp0hZKqbbPCHPzELYYX2giaUm8MLyb+OQoT5Qi9dTfUur73LLI/k944vFw8r
	7g2we8NgDyNY3E8O5YOaD6JYa4nqfFTS7Z91Ni1gp2icakS8ijM35UlVVHo3+e6ucwDt
	Yx9w==
X-Gm-Message-State: APjAAAUg6x1XBJG+AMhD6w4z3DORIwOkRA7X3Kesivzj0sXQfYO+yHjF
	0kC+D+unleF8MaUXjpC3P7iZ34EvmlQ=
X-Google-Smtp-Source: APXvYqy6zGAToVpcypv4Se84SZUoZXSSlmMiMCoWJfvvsYgehN2HQOKXAYK1f23Bq7NYnkR6H1QS6A==
X-Received: by 2002:adf:8bc5:: with SMTP id w5mr24128232wra.226.1553815808986; 
	Thu, 28 Mar 2019 16:30:08 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id c8sm456173wrx.6.2019.03.28.16.30.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Mar 2019 16:30:07 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Mar 2019 23:30:04 +0000
Message-Id: <20190328233004.27675-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] sqlite3: fix CVE-2019-9936 and CVE-2019-9937
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
X-List-Received-Date: Thu, 28 Mar 2019 23:30:09 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../sqlite/sqlite3/CVE-2019-9936.patch             |  28 +++
 .../sqlite/sqlite3/CVE-2019-9937.patch             | 187 +++++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.27.2.bb      |   2 +
 3 files changed, 217 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2019-9936.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2019-9937.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2019-9936.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2019-9936.patch
new file mode 100644
index 00000000000..1b907b9d4dd
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2019-9936.patch
@@ -0,0 +1,28 @@
+Running fts5 prefix queries inside a transaction could trigger a heap-based
+buffer over-read in fts5HashEntrySort in sqlite3.c, which may lead to an
+information leak.
+
+CVE: CVE-2019-9936
+Upstream-Status: Backport [https://sqlite.org/src/vpatch?from=45c73deb440496e8&to=b3fa58dd7403dbd4]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ sqlite3.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 4729f45..65527d8 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -207759,7 +207759,9 @@ static int fts5HashEntrySort(
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
+-- 
+2.20.1
diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2019-9937.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2019-9937.patch
new file mode 100644
index 00000000000..baa5666ddaa
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2019-9937.patch
@@ -0,0 +1,187 @@
+Interleaving reads and writes in a single transaction with an fts5 virtual table
+will lead to a NULL Pointer Dereference in fts5ChunkIterate in sqlite3.c.
+
+CVE: CVE-2019-9937
+Upstream-Status: Backport [https://sqlite.org/src/vpatch?from=c2f50aa4e7bad882&to=45c73deb440496e8]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+---
+ sqlite3.c | 83 ++++++++++++++++++++++++++++++++++++++-----------------
+ 1 file changed, 57 insertions(+), 26 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 65527d8..b1a8799 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -200668,8 +200668,9 @@ static void sqlite3Fts5HashClear(Fts5Hash*);
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
+@@ -207501,19 +207502,25 @@ static int fts5HashResize(Fts5Hash *pHash){
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
+@@ -207523,14 +207530,19 @@ static void fts5HashAddPoslistSize(Fts5Hash *pHash, Fts5HashEntry *p){
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
+@@ -207642,7 +207654,7 @@ static int sqlite3Fts5HashWrite(
+   /* If this is a new rowid, append the 4-byte size field for the previous
+   ** entry, and the new rowid for this entry.  */
+   if( iRowid!=p->iRowid ){
+-    fts5HashAddPoslistSize(pHash, p);
++    fts5HashAddPoslistSize(pHash, p, 0);
+     p->nData += sqlite3Fts5PutVarint(&pPtr[p->nData], iRowid - p->iRowid);
+     p->iRowid = iRowid;
+     bNew = 1;
+@@ -207789,8 +207801,9 @@ static int fts5HashEntrySort(
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
+@@ -207804,11 +207817,20 @@ static int sqlite3Fts5HashQuery(
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
+@@ -207841,7 +207863,7 @@ static void sqlite3Fts5HashScanEntry(
+   if( (p = pHash->pScan) ){
+     char *zKey = fts5EntryKey(p);
+     int nTerm = (int)strlen(zKey);
+-    fts5HashAddPoslistSize(pHash, p);
++    fts5HashAddPoslistSize(pHash, p, 0);
+     *pzTerm = zKey;
+     *ppDoclist = (const u8*)&zKey[nTerm+1];
+     *pnDoclist = p->nData - (sizeof(Fts5HashEntry) + nTerm + 1);
+@@ -210311,31 +210333,40 @@ static void fts5SegIterHashInit(
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
+-- 
+2.20.1
diff --git a/meta/recipes-support/sqlite/sqlite3_3.27.2.bb b/meta/recipes-support/sqlite/sqlite3_3.27.2.bb
index 22fec21454b..4bdb04f4d1f 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.27.2.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.27.2.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed0
 
 SRC_URI = "\
   http://www.sqlite.org/2019/sqlite-autoconf-${SQLITE_PV}.tar.gz \
+  file://CVE-2019-9936.patch \
+  file://CVE-2019-9937.patch \
   "
 
 SRC_URI[md5sum] = "1f72631ce6e8efa5b4a6e55a43b3bdc0"
-- 
2.11.0



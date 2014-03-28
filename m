Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1EA3A6F3AF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 09:43:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2S9hvSl024627
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Mar 2014 02:43:57 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Fri, 28 Mar 2014 02:43:57 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Mar 2014 17:43:37 +0800
Message-ID: <b88cf67b0f7824d86770c313e91ee778a793ba10.1395997035.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1395997035.git.hongxu.jia@windriver.com>
References: <cover.1395997035.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 3/4] nss-3.15.1: fix CVE-2013-1741
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
X-List-Received-Date: Fri, 28 Mar 2014 09:43:57 -0000
Content-Type: text/plain

From: "yanjun.zhu" <yanjun.zhu@windriver.com>

Integer overflow in Mozilla Network Security Services (NSS)
3.15 before 3.15.3 allows remote attackers to cause a denial
of service or possibly have unspecified other impact via a
large size value.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-1741
Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../nss/files/nss-3.15.1-fix-CVE-2013-1741.patch   | 92 ++++++++++++++++++++++
 meta/recipes-support/nss/nss.inc                   |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-support/nss/files/nss-3.15.1-fix-CVE-2013-1741.patch

diff --git a/meta/recipes-support/nss/files/nss-3.15.1-fix-CVE-2013-1741.patch b/meta/recipes-support/nss/files/nss-3.15.1-fix-CVE-2013-1741.patch
new file mode 100644
index 0000000..21da0c0
--- /dev/null
+++ b/meta/recipes-support/nss/files/nss-3.15.1-fix-CVE-2013-1741.patch
@@ -0,0 +1,92 @@
+Upstream-Status: backport
+yanjun.zhu <yanjun.zhu@windriver.com>
+--- a/nss/lib/util/secport.c
++++ b/nss/lib/util/secport.c
+@@ -69,13 +69,22 @@ PORTCharConversionFunc ucs4Utf8ConvertFu
+ PORTCharConversionFunc ucs2Utf8ConvertFunc;
+ PORTCharConversionWSwapFunc  ucs2AsciiConvertFunc;
+ 
++/* NSPR memory allocation functions (PR_Malloc, PR_Calloc, and PR_Realloc)
++ * use the PRUint32 type for the size parameter. Before we pass a size_t or
++ * unsigned long size to these functions, we need to ensure it is <= half of
++ * the maximum PRUint32 value to avoid truncation and catch a negative size.
++ */
++#define MAX_SIZE (PR_UINT32_MAX >> 1)
++
+ void *
+ PORT_Alloc(size_t bytes)
+ {
+-    void *rv;
++    void *rv = NULL;
+ 
+-    /* Always allocate a non-zero amount of bytes */
+-    rv = (void *)PR_Malloc(bytes ? bytes : 1);
++    if (bytes <= MAX_SIZE) {
++	/* Always allocate a non-zero amount of bytes */
++	rv = PR_Malloc(bytes ? bytes : 1);
++    }
+     if (!rv) {
+ 	++port_allocFailures;
+ 	PORT_SetError(SEC_ERROR_NO_MEMORY);
+@@ -86,9 +95,11 @@ PORT_Alloc(size_t bytes)
+ void *
+ PORT_Realloc(void *oldptr, size_t bytes)
+ {
+-    void *rv;
++    void *rv = NULL;
+ 
+-    rv = (void *)PR_Realloc(oldptr, bytes);
++    if (bytes <= MAX_SIZE) {
++	rv = PR_Realloc(oldptr, bytes);
++    }
+     if (!rv) {
+ 	++port_allocFailures;
+ 	PORT_SetError(SEC_ERROR_NO_MEMORY);
+@@ -99,10 +110,12 @@ PORT_Realloc(void *oldptr, size_t bytes)
+ void *
+ PORT_ZAlloc(size_t bytes)
+ {
+-    void *rv;
++    void *rv = NULL;
+ 
+-    /* Always allocate a non-zero amount of bytes */
+-    rv = (void *)PR_Calloc(1, bytes ? bytes : 1);
++    if (bytes <= MAX_SIZE) {
++	/* Always allocate a non-zero amount of bytes */
++	rv = PR_Calloc(1, bytes ? bytes : 1);
++    }
+     if (!rv) {
+ 	++port_allocFailures;
+ 	PORT_SetError(SEC_ERROR_NO_MEMORY);
+@@ -209,6 +222,10 @@ PORT_NewArena(unsigned long chunksize)
+ {
+     PORTArenaPool *pool;
+     
++    if (chunksize > MAX_SIZE) {
++	PORT_SetError(SEC_ERROR_NO_MEMORY);
++	return NULL;
++    }
+     pool = PORT_ZNew(PORTArenaPool);
+     if (!pool) {
+ 	return NULL;
+@@ -224,8 +241,6 @@ PORT_NewArena(unsigned long chunksize)
+     return(&pool->arena);
+ }
+ 
+-#define MAX_SIZE 0x7fffffffUL
+-
+ void *
+ PORT_ArenaAlloc(PLArenaPool *arena, size_t size)
+ {
+@@ -330,6 +345,11 @@ PORT_ArenaGrow(PLArenaPool *arena, void 
+     PORTArenaPool *pool = (PORTArenaPool *)arena;
+     PORT_Assert(newsize >= oldsize);
+     
++    if (newsize > MAX_SIZE) {
++	PORT_SetError(SEC_ERROR_NO_MEMORY);
++	return NULL;
++    }
++
+     if (ARENAPOOL_MAGIC == pool->magic ) {
+ 	PZ_Lock(pool->lock);
+ 	/* Do we do a THREADMARK check here? */
diff --git a/meta/recipes-support/nss/nss.inc b/meta/recipes-support/nss/nss.inc
index a6aeed8..6364562 100644
--- a/meta/recipes-support/nss/nss.inc
+++ b/meta/recipes-support/nss/nss.inc
@@ -16,6 +16,7 @@ SRC_URI = "\
     file://nss-fix-support-cross-compiling.patch \
     file://nss-no-rpath-for-cross-compiling.patch \
     file://nss-fix-incorrect-shebang-of-perl.patch \
+    file://nss-3.15.1-fix-CVE-2013-1741.patch \
 "
 SRC_URI_append_class-target = "\
     file://nss.pc.in \
-- 
1.8.1.2



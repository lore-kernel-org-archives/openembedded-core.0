Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 685CFCCD1A5
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 19:20:17 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.21780.1761074414480585028
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Oct 2025 12:20:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=JhfTlINd;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-202510211920085db337bf2e0002074c-7cq2tw@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202510211920085db337bf2e0002074c
        for <openembedded-core@lists.openembedded.org>;
        Tue, 21 Oct 2025 21:20:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=5CNHysaDdHxrBLJ9ChxHLcGUaLrWkR+5pPk1NhF3WdI=;
 b=JhfTlINdeZ2NYFnLnCmMBJdfsiDd6vA6WtiIYb9GfLN878czWnwvpBbIbVQVpK2Fd8ErLY
 LuA0u1bgdgYooPRLirqjA6hsi9iwt6dI+UOMEVj+SOnTumSX4E1pp0t17YSfX8oQZOSp1fhM
 ajlCp+2ee9r8vq8gIsSR8BgdMr+aJ2WaQqMF7ynoafp8ScVNGuL8PX53B9Lvwiwn2yINoaWO
 q27rJaxKDWItfNCzqmF6fZDpZZl8qcRBt5fx7+FYcGMI+aK0lSC3KUnDB72cNLEXB9pGKJ70
 Zgld9Ebws+cict34EuOnGz3JZAJ0Q0l6QTuHcZGPtvNU8iAVumqZOJDA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH v2] expat: patch CVE-2025-59375
Date: Tue, 21 Oct 2025 21:19:57 +0200
Message-Id: <20251021191957.1760034-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Oct 2025 19:20:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225163

From: Peter Marko <peter.marko@siemens.com>

Pick patch from PR mentioning this CVE [1]

It's a complex patch so I have checked diff of 2.6.4 and commit before
these patches landed. There were no changes in memory allocations.
Also version in scarthgap is still not that much different from current
upstream master.
Ptests pass.

Also picked one documentation commit  (-00) to resolve patch conflict.

Following conflicts were resolved manually:
* commit "mass-cppcheck.sh: Activate in-code suppression comments" was
  skipped as it only edited github actions not yet available in 2.6.4
* commit "lib: Implement tracking of dynamic memory allocations"
  ale had conflict in github actions not yet available in 2.6.4
* commit "fuzz: Be robust towards NULL return from XML_ExternalEntityParserCreate"
  edited file "expat/fuzz/xml_lpm_fuzzer.cpp" which is not present in
  our version yet. Since we're not using fuzzying, this is not needed.
* the final changelog commit needed lot conflict resolution actions

Finally picked PR fixing regression [2] together with two minor commits
to have a clean cherry-picks.
Also here the Changes commit needed conflict resolution.

[1] https://github.com/libexpat/libexpat/pull/1034
[2] https://github.com/libexpat/libexpat/pull/1048

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
v2: added commits from PR [2]

 .../expat/expat/CVE-2025-59375-00.patch       |  52 ++
 .../expat/expat/CVE-2025-59375-01.patch       |  48 ++
 .../expat/expat/CVE-2025-59375-02.patch       | 109 ++++
 .../expat/expat/CVE-2025-59375-03.patch       | 127 ++++
 .../expat/expat/CVE-2025-59375-04.patch       |  62 ++
 .../expat/expat/CVE-2025-59375-05.patch       |  64 ++
 .../expat/expat/CVE-2025-59375-06.patch       |  68 +++
 .../expat/expat/CVE-2025-59375-07.patch       |  52 ++
 .../expat/expat/CVE-2025-59375-08.patch       | 577 ++++++++++++++++++
 .../expat/expat/CVE-2025-59375-09.patch       |  43 ++
 .../expat/expat/CVE-2025-59375-10.patch       |  54 ++
 .../expat/expat/CVE-2025-59375-11.patch       |  66 ++
 .../expat/expat/CVE-2025-59375-12.patch       |  58 ++
 .../expat/expat/CVE-2025-59375-13.patch       | 309 ++++++++++
 .../expat/expat/CVE-2025-59375-14.patch       | 122 ++++
 .../expat/expat/CVE-2025-59375-15.patch       |  70 +++
 .../expat/expat/CVE-2025-59375-16.patch       | 146 +++++
 .../expat/expat/CVE-2025-59375-17.patch       |  28 +
 .../expat/expat/CVE-2025-59375-18.patch       |  74 +++
 .../expat/expat/CVE-2025-59375-19.patch       | 103 ++++
 .../expat/expat/CVE-2025-59375-20.patch       | 285 +++++++++
 .../expat/expat/CVE-2025-59375-21.patch       | 196 ++++++
 .../expat/expat/CVE-2025-59375-22.patch       |  37 ++
 .../expat/expat/CVE-2025-59375-23.patch       |  47 ++
 .../expat/expat/CVE-2025-59375-24.patch       |  36 ++
 meta/recipes-core/expat/expat_2.6.4.bb        |  25 +
 26 files changed, 2858 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-00.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-01.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-02.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-03.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-04.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-05.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-06.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-07.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-08.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-09.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-10.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-11.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-12.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-13.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-14.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-15.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-16.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-17.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-18.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-19.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-20.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-21.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-22.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-23.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-24.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2025-59375-00.patch b/meta/recipes-core/expat/expat/CVE-2025-59375-00.patch
new file mode 100644
index 00000000000..e3cbd0f6048
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2025-59375-00.patch
@@ -0,0 +1,52 @@
+From 87321ac84a0d6cb42ee64a591adc79c1ec37fb5b Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 2 Sep 2025 20:52:29 +0200
+Subject: [PATCH] xmlwf: Mention supported environment variables in --help
+ output
+
+CVE: CVE-2025-59375
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/87321ac84a0d6cb42ee64a591adc79c1ec37fb5b]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ xmlwf/xmlwf.c          | 8 ++++++++
+ xmlwf/xmlwf_helpgen.py | 8 ++++++++
+ 2 files changed, 16 insertions(+)
+
+diff --git a/xmlwf/xmlwf.c b/xmlwf/xmlwf.c
+index ec7e51c9..8cfc73ca 100644
+--- a/xmlwf/xmlwf.c
++++ b/xmlwf/xmlwf.c
+@@ -926,6 +926,14 @@ usage(const XML_Char *prog, int rc) {
+       T("  -h, --help     show this [h]elp message and exit\n")
+       T("  -v, --version  show program's [v]ersion number and exit\n")
+       T("\n")
++      T("environment variables:\n")
++      T("  EXPAT_ACCOUNTING_DEBUG=(0|1|2|3)\n")
++      T("                 Control verbosity of accounting debugging (default: 0)\n")
++      T("  EXPAT_ENTITY_DEBUG=(0|1)\n")
++      T("                 Control verbosity of entity debugging (default: 0)\n")
++      T("  EXPAT_ENTROPY_DEBUG=(0|1)\n")
++      T("                 Control verbosity of entropy debugging (default: 0)\n")
++      T("\n")
+       T("exit status:\n")
+       T("  0              the input files are well-formed and the output (if requested) was written successfully\n")
+       T("  1              could not allocate data structures, signals a serious problem with execution environment\n")
+diff --git a/xmlwf/xmlwf_helpgen.py b/xmlwf/xmlwf_helpgen.py
+index c3257f0e..39a3dc13 100755
+--- a/xmlwf/xmlwf_helpgen.py
++++ b/xmlwf/xmlwf_helpgen.py
+@@ -32,6 +32,14 @@
+ import argparse
+ 
+ epilog = """
++environment variables:
++  EXPAT_ACCOUNTING_DEBUG=(0|1|2|3)
++                 Control verbosity of accounting debugging (default: 0)
++  EXPAT_ENTITY_DEBUG=(0|1)
++                 Control verbosity of entity debugging (default: 0)
++  EXPAT_ENTROPY_DEBUG=(0|1)
++                 Control verbosity of entropy debugging (default: 0)
++
+ exit status:
+   0              the input files are well-formed and the output (if requested) was written successfully
+   1              could not allocate data structures, signals a serious problem with execution environment
diff --git a/meta/recipes-core/expat/expat/CVE-2025-59375-01.patch b/meta/recipes-core/expat/expat/CVE-2025-59375-01.patch
new file mode 100644
index 00000000000..6708bbef45c
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2025-59375-01.patch
@@ -0,0 +1,48 @@
+From 0872c189db6e457084fca335662a9cb49e8ec4c7 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Mon, 1 Sep 2025 18:06:59 +0200
+Subject: [PATCH] lib: Make function dtdCreate use macro MALLOC
+
+.. and give its body access to the parser for upcoming changes
+
+CVE: CVE-2025-59375
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/0872c189db6e457084fca335662a9cb49e8ec4c7]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/xmlparse.c | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 25f786ec..b9d6eed1 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -555,7 +555,7 @@ static XML_Bool setContext(XML_Parser parser, const XML_Char *context);
+ 
+ static void FASTCALL normalizePublicId(XML_Char *s);
+ 
+-static DTD *dtdCreate(const XML_Memory_Handling_Suite *ms);
++static DTD *dtdCreate(XML_Parser parser);
+ /* do not call if m_parentParser != NULL */
+ static void dtdReset(DTD *p, const XML_Memory_Handling_Suite *ms);
+ static void dtdDestroy(DTD *p, XML_Bool isDocEntity,
+@@ -1166,7 +1166,7 @@ parserCreate(const XML_Char *encodingName,
+   if (dtd)
+     parser->m_dtd = dtd;
+   else {
+-    parser->m_dtd = dtdCreate(&parser->m_mem);
++    parser->m_dtd = dtdCreate(parser);
+     if (parser->m_dtd == NULL) {
+       FREE(parser, parser->m_dataBuf);
+       FREE(parser, parser->m_atts);
+@@ -7126,8 +7126,9 @@ normalizePublicId(XML_Char *publicId) {
+ }
+ 
+ static DTD *
+-dtdCreate(const XML_Memory_Handling_Suite *ms) {
+-  DTD *p = ms->malloc_fcn(sizeof(DTD));
++dtdCreate(XML_Parser parser) {
++  const XML_Memory_Handling_Suite *const ms = &parser->m_mem;
++  DTD *p = MALLOC(parser, sizeof(DTD));
+   if (p == NULL)
+     return p;
+   poolInit(&(p->pool), ms);
diff --git a/meta/recipes-core/expat/expat/CVE-2025-59375-02.patch b/meta/recipes-core/expat/expat/CVE-2025-59375-02.patch
new file mode 100644
index 00000000000..b0543370ad8
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2025-59375-02.patch
@@ -0,0 +1,109 @@
+From 8768dadae479d9f2e984b747fb2ba79bb78de94f Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Mon, 1 Sep 2025 18:10:26 +0200
+Subject: [PATCH] lib: Make string pools use macros MALLOC, FREE, REALLOC
+
+CVE: CVE-2025-59375
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/8768dadae479d9f2e984b747fb2ba79bb78de94f]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/xmlparse.c | 27 +++++++++++++--------------
+ 1 file changed, 13 insertions(+), 14 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index b9d6eed1..a56c71ea 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -357,7 +357,7 @@ typedef struct {
+   const XML_Char *end;
+   XML_Char *ptr;
+   XML_Char *start;
+-  const XML_Memory_Handling_Suite *mem;
++  XML_Parser parser;
+ } STRING_POOL;
+ 
+ /* The XML_Char before the name is used to determine whether
+@@ -574,8 +574,7 @@ static void FASTCALL hashTableIterInit(HASH_TABLE_ITER *iter,
+                                        const HASH_TABLE *table);
+ static NAMED *FASTCALL hashTableIterNext(HASH_TABLE_ITER *iter);
+ 
+-static void FASTCALL poolInit(STRING_POOL *pool,
+-                              const XML_Memory_Handling_Suite *ms);
++static void FASTCALL poolInit(STRING_POOL *pool, XML_Parser parser);
+ static void FASTCALL poolClear(STRING_POOL *pool);
+ static void FASTCALL poolDestroy(STRING_POOL *pool);
+ static XML_Char *poolAppend(STRING_POOL *pool, const ENCODING *enc,
+@@ -1200,8 +1199,8 @@ parserCreate(const XML_Char *encodingName,
+ 
+   parser->m_protocolEncodingName = NULL;
+ 
+-  poolInit(&parser->m_tempPool, &(parser->m_mem));
+-  poolInit(&parser->m_temp2Pool, &(parser->m_mem));
++  poolInit(&parser->m_tempPool, parser);
++  poolInit(&parser->m_temp2Pool, parser);
+   parserInit(parser, encodingName);
+ 
+   if (encodingName && ! parser->m_protocolEncodingName) {
+@@ -7131,8 +7130,8 @@ dtdCreate(XML_Parser parser) {
+   DTD *p = MALLOC(parser, sizeof(DTD));
+   if (p == NULL)
+     return p;
+-  poolInit(&(p->pool), ms);
+-  poolInit(&(p->entityValuePool), ms);
++  poolInit(&(p->pool), parser);
++  poolInit(&(p->entityValuePool), parser);
+   hashTableInit(&(p->generalEntities), ms);
+   hashTableInit(&(p->elementTypes), ms);
+   hashTableInit(&(p->attributeIds), ms);
+@@ -7596,13 +7595,13 @@ hashTableIterNext(HASH_TABLE_ITER *iter) {
+ }
+ 
+ static void FASTCALL
+-poolInit(STRING_POOL *pool, const XML_Memory_Handling_Suite *ms) {
++poolInit(STRING_POOL *pool, XML_Parser parser) {
+   pool->blocks = NULL;
+   pool->freeBlocks = NULL;
+   pool->start = NULL;
+   pool->ptr = NULL;
+   pool->end = NULL;
+-  pool->mem = ms;
++  pool->parser = parser;
+ }
+ 
+ static void FASTCALL
+@@ -7629,13 +7628,13 @@ poolDestroy(STRING_POOL *pool) {
+   BLOCK *p = pool->blocks;
+   while (p) {
+     BLOCK *tem = p->next;
+-    pool->mem->free_fcn(p);
++    FREE(pool->parser, p);
+     p = tem;
+   }
+   p = pool->freeBlocks;
+   while (p) {
+     BLOCK *tem = p->next;
+-    pool->mem->free_fcn(p);
++    FREE(pool->parser, p);
+     p = tem;
+   }
+ }
+@@ -7790,8 +7789,8 @@ poolGrow(STRING_POOL *pool) {
+     if (bytesToAllocate == 0)
+       return XML_FALSE;
+ 
+-    temp = (BLOCK *)pool->mem->realloc_fcn(pool->blocks,
+-                                           (unsigned)bytesToAllocate);
++    temp = (BLOCK *)REALLOC(pool->parser, pool->blocks,
++                            (unsigned)bytesToAllocate);
+     if (temp == NULL)
+       return XML_FALSE;
+     pool->blocks = temp;
+@@ -7831,7 +7830,7 @@ poolGrow(STRING_POOL *pool) {
+     if (bytesToAllocate == 0)
+       return XML_FALSE;
+ 
+-    tem = pool->mem->malloc_fcn(bytesToAllocate);
++    tem = MALLOC(pool->parser, bytesToAllocate);
+     if (! tem)
+       return XML_FALSE;
+     tem->size = blockSize;
diff --git a/meta/recipes-core/expat/expat/CVE-2025-59375-03.patch b/meta/recipes-core/expat/expat/CVE-2025-59375-03.patch
new file mode 100644
index 00000000000..b8c2c595e1a
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2025-59375-03.patch
@@ -0,0 +1,127 @@
+From 4fc6f1ee9f2b282cfe446bf645c992e37f8c3e15 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Mon, 1 Sep 2025 18:14:09 +0200
+Subject: [PATCH] lib: Make function hash tables use macros MALLOC and FREE
+
+CVE: CVE-2025-59375
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/4fc6f1ee9f2b282cfe446bf645c992e37f8c3e15]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/xmlparse.c | 34 ++++++++++++++++------------------
+ 1 file changed, 16 insertions(+), 18 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index a56c71ea..a65b0265 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -234,7 +234,7 @@ typedef struct {
+   unsigned char power;
+   size_t size;
+   size_t used;
+-  const XML_Memory_Handling_Suite *mem;
++  XML_Parser parser;
+ } HASH_TABLE;
+ 
+ static size_t keylen(KEY s);
+@@ -566,8 +566,7 @@ static int copyEntityTable(XML_Parser oldParser, HASH_TABLE *newTable,
+                            STRING_POOL *newPool, const HASH_TABLE *oldTable);
+ static NAMED *lookup(XML_Parser parser, HASH_TABLE *table, KEY name,
+                      size_t createSize);
+-static void FASTCALL hashTableInit(HASH_TABLE *table,
+-                                   const XML_Memory_Handling_Suite *ms);
++static void FASTCALL hashTableInit(HASH_TABLE *table, XML_Parser parser);
+ static void FASTCALL hashTableClear(HASH_TABLE *table);
+ static void FASTCALL hashTableDestroy(HASH_TABLE *table);
+ static void FASTCALL hashTableIterInit(HASH_TABLE_ITER *iter,
+@@ -7126,19 +7125,18 @@ normalizePublicId(XML_Char *publicId) {
+ 
+ static DTD *
+ dtdCreate(XML_Parser parser) {
+-  const XML_Memory_Handling_Suite *const ms = &parser->m_mem;
+   DTD *p = MALLOC(parser, sizeof(DTD));
+   if (p == NULL)
+     return p;
+   poolInit(&(p->pool), parser);
+   poolInit(&(p->entityValuePool), parser);
+-  hashTableInit(&(p->generalEntities), ms);
+-  hashTableInit(&(p->elementTypes), ms);
+-  hashTableInit(&(p->attributeIds), ms);
+-  hashTableInit(&(p->prefixes), ms);
++  hashTableInit(&(p->generalEntities), parser);
++  hashTableInit(&(p->elementTypes), parser);
++  hashTableInit(&(p->attributeIds), parser);
++  hashTableInit(&(p->prefixes), parser);
+ #ifdef XML_DTD
+   p->paramEntityRead = XML_FALSE;
+-  hashTableInit(&(p->paramEntities), ms);
++  hashTableInit(&(p->paramEntities), parser);
+ #endif /* XML_DTD */
+   p->defaultPrefix.name = NULL;
+   p->defaultPrefix.binding = NULL;
+@@ -7473,7 +7471,7 @@ lookup(XML_Parser parser, HASH_TABLE *table, KEY name, size_t createSize) {
+     /* table->size is a power of 2 */
+     table->size = (size_t)1 << INIT_POWER;
+     tsize = table->size * sizeof(NAMED *);
+-    table->v = table->mem->malloc_fcn(tsize);
++    table->v = MALLOC(table->parser, tsize);
+     if (! table->v) {
+       table->size = 0;
+       return NULL;
+@@ -7513,7 +7511,7 @@ lookup(XML_Parser parser, HASH_TABLE *table, KEY name, size_t createSize) {
+       }
+ 
+       size_t tsize = newSize * sizeof(NAMED *);
+-      NAMED **newV = table->mem->malloc_fcn(tsize);
++      NAMED **newV = MALLOC(table->parser, tsize);
+       if (! newV)
+         return NULL;
+       memset(newV, 0, tsize);
+@@ -7529,7 +7527,7 @@ lookup(XML_Parser parser, HASH_TABLE *table, KEY name, size_t createSize) {
+           }
+           newV[j] = table->v[i];
+         }
+-      table->mem->free_fcn(table->v);
++      FREE(table->parser, table->v);
+       table->v = newV;
+       table->power = newPower;
+       table->size = newSize;
+@@ -7542,7 +7540,7 @@ lookup(XML_Parser parser, HASH_TABLE *table, KEY name, size_t createSize) {
+       }
+     }
+   }
+-  table->v[i] = table->mem->malloc_fcn(createSize);
++  table->v[i] = MALLOC(table->parser, createSize);
+   if (! table->v[i])
+     return NULL;
+   memset(table->v[i], 0, createSize);
+@@ -7555,7 +7553,7 @@ static void FASTCALL
+ hashTableClear(HASH_TABLE *table) {
+   size_t i;
+   for (i = 0; i < table->size; i++) {
+-    table->mem->free_fcn(table->v[i]);
++    FREE(table->parser, table->v[i]);
+     table->v[i] = NULL;
+   }
+   table->used = 0;
+@@ -7565,17 +7563,17 @@ static void FASTCALL
+ hashTableDestroy(HASH_TABLE *table) {
+   size_t i;
+   for (i = 0; i < table->size; i++)
+-    table->mem->free_fcn(table->v[i]);
+-  table->mem->free_fcn(table->v);
++    FREE(table->parser, table->v[i]);
++  FREE(table->parser, table->v);
+ }
+ 
+ static void FASTCALL
+-hashTableInit(HASH_TABLE *p, const XML_Memory_Handling_Suite *ms) {
++hashTableInit(HASH_TABLE *p, XML_Parser parser) {
+   p->power = 0;
+   p->size = 0;
+   p->used = 0;
+   p->v = NULL;
+-  p->mem = ms;
++  p->parser = parser;
+ }
+ 
+ static void FASTCALL
diff --git a/meta/recipes-core/expat/expat/CVE-2025-59375-04.patch b/meta/recipes-core/expat/expat/CVE-2025-59375-04.patch
new file mode 100644
index 00000000000..78d9e2fc91b
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2025-59375-04.patch
@@ -0,0 +1,62 @@
+From 51487ad9d760faa4809b0f8e189d2f666317e41a Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Mon, 1 Sep 2025 17:45:50 +0200
+Subject: [PATCH] lib: Make function copyString use macro MALLOC
+
+CVE: CVE-2025-59375
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/51487ad9d760faa4809b0f8e189d2f666317e41a]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/xmlparse.c | 11 +++++------
+ 1 file changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index a65b0265..c0576abd 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -593,8 +593,7 @@ static XML_Content *build_model(XML_Parser parser);
+ static ELEMENT_TYPE *getElementType(XML_Parser parser, const ENCODING *enc,
+                                     const char *ptr, const char *end);
+ 
+-static XML_Char *copyString(const XML_Char *s,
+-                            const XML_Memory_Handling_Suite *memsuite);
++static XML_Char *copyString(const XML_Char *s, XML_Parser parser);
+ 
+ static unsigned long generate_hash_secret_salt(XML_Parser parser);
+ static XML_Bool startParsing(XML_Parser parser);
+@@ -1231,7 +1230,7 @@ parserInit(XML_Parser parser, const XML_Char *encodingName) {
+   parser->m_processor = prologInitProcessor;
+   XmlPrologStateInit(&parser->m_prologState);
+   if (encodingName != NULL) {
+-    parser->m_protocolEncodingName = copyString(encodingName, &(parser->m_mem));
++    parser->m_protocolEncodingName = copyString(encodingName, parser);
+   }
+   parser->m_curBase = NULL;
+   XmlInitEncoding(&parser->m_initEncoding, &parser->m_encoding, 0);
+@@ -1419,7 +1418,7 @@ XML_SetEncoding(XML_Parser parser, const XML_Char *encodingName) {
+     parser->m_protocolEncodingName = NULL;
+   else {
+     /* Copy the new encoding name into allocated memory */
+-    parser->m_protocolEncodingName = copyString(encodingName, &(parser->m_mem));
++    parser->m_protocolEncodingName = copyString(encodingName, parser);
+     if (! parser->m_protocolEncodingName)
+       return XML_STATUS_ERROR;
+   }
+@@ -8064,7 +8063,7 @@ getElementType(XML_Parser parser, const ENCODING *enc, const char *ptr,
+ }
+ 
+ static XML_Char *
+-copyString(const XML_Char *s, const XML_Memory_Handling_Suite *memsuite) {
++copyString(const XML_Char *s, XML_Parser parser) {
+   size_t charsRequired = 0;
+   XML_Char *result;
+ 
+@@ -8076,7 +8075,7 @@ copyString(const XML_Char *s, const XML_Memory_Handling_Suite *memsuite) {
+   charsRequired++;
+ 
+   /* Now allocate space for the copy */
+-  result = memsuite->malloc_fcn(charsRequired * sizeof(XML_Char));
++  result = MALLOC(parser, charsRequired * sizeof(XML_Char));
+   if (result == NULL)
+     return NULL;
+   /* Copy the original into place */
diff --git a/meta/recipes-core/expat/expat/CVE-2025-59375-05.patch b/meta/recipes-core/expat/expat/CVE-2025-59375-05.patch
new file mode 100644
index 00000000000..37b882fbf49
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2025-59375-05.patch
@@ -0,0 +1,64 @@
+From b3f0bda5f5e979781469532f7c304f7e223568d5 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Mon, 1 Sep 2025 17:48:02 +0200
+Subject: [PATCH] lib: Make function dtdReset use macro FREE
+
+CVE: CVE-2025-59375
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/b3f0bda5f5e979781469532f7c304f7e223568d5]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/xmlparse.c | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index c0576abd..65fcce30 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -557,7 +557,7 @@ static void FASTCALL normalizePublicId(XML_Char *s);
+ 
+ static DTD *dtdCreate(XML_Parser parser);
+ /* do not call if m_parentParser != NULL */
+-static void dtdReset(DTD *p, const XML_Memory_Handling_Suite *ms);
++static void dtdReset(DTD *p, XML_Parser parser);
+ static void dtdDestroy(DTD *p, XML_Bool isDocEntity,
+                        const XML_Memory_Handling_Suite *ms);
+ static int dtdCopy(XML_Parser oldParser, DTD *newDtd, const DTD *oldDtd,
+@@ -1382,7 +1382,7 @@ XML_ParserReset(XML_Parser parser, const XML_Char *encodingName) {
+   FREE(parser, (void *)parser->m_protocolEncodingName);
+   parser->m_protocolEncodingName = NULL;
+   parserInit(parser, encodingName);
+-  dtdReset(parser->m_dtd, &parser->m_mem);
++  dtdReset(parser->m_dtd, parser);
+   return XML_TRUE;
+ }
+ 
+@@ -7155,7 +7155,7 @@ dtdCreate(XML_Parser parser) {
+ }
+ 
+ static void
+-dtdReset(DTD *p, const XML_Memory_Handling_Suite *ms) {
++dtdReset(DTD *p, XML_Parser parser) {
+   HASH_TABLE_ITER iter;
+   hashTableIterInit(&iter, &(p->elementTypes));
+   for (;;) {
+@@ -7163,7 +7163,7 @@ dtdReset(DTD *p, const XML_Memory_Handling_Suite *ms) {
+     if (! e)
+       break;
+     if (e->allocDefaultAtts != 0)
+-      ms->free_fcn(e->defaultAtts);
++      FREE(parser, e->defaultAtts);
+   }
+   hashTableClear(&(p->generalEntities));
+ #ifdef XML_DTD
+@@ -7180,9 +7180,9 @@ dtdReset(DTD *p, const XML_Memory_Handling_Suite *ms) {
+ 
+   p->in_eldecl = XML_FALSE;
+ 
+-  ms->free_fcn(p->scaffIndex);
++  FREE(parser, p->scaffIndex);
+   p->scaffIndex = NULL;
+-  ms->free_fcn(p->scaffold);
++  FREE(parser, p->scaffold);
+   p->scaffold = NULL;
+ 
+   p->scaffLevel = 0;
diff --git a/meta/recipes-core/expat/expat/CVE-2025-59375-06.patch b/meta/recipes-core/expat/expat/CVE-2025-59375-06.patch
new file mode 100644
index 00000000000..04f975a458f
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2025-59375-06.patch
@@ -0,0 +1,68 @@
+From 53a3eda0ae2e0317afd071b72b41976053d82732 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Mon, 1 Sep 2025 17:50:59 +0200
+Subject: [PATCH] lib: Make function dtdDestroy use macro FREE
+
+CVE: CVE-2025-59375
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/53a3eda0ae2e0317afd071b72b41976053d82732]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/xmlparse.c | 16 +++++++---------
+ 1 file changed, 7 insertions(+), 9 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 65fcce30..e7df97da 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -558,8 +558,7 @@ static void FASTCALL normalizePublicId(XML_Char *s);
+ static DTD *dtdCreate(XML_Parser parser);
+ /* do not call if m_parentParser != NULL */
+ static void dtdReset(DTD *p, XML_Parser parser);
+-static void dtdDestroy(DTD *p, XML_Bool isDocEntity,
+-                       const XML_Memory_Handling_Suite *ms);
++static void dtdDestroy(DTD *p, XML_Bool isDocEntity, XML_Parser parser);
+ static int dtdCopy(XML_Parser oldParser, DTD *newDtd, const DTD *oldDtd,
+                    const XML_Memory_Handling_Suite *ms);
+ static int copyEntityTable(XML_Parser oldParser, HASH_TABLE *newTable,
+@@ -1685,8 +1684,7 @@ XML_ParserFree(XML_Parser parser) {
+ #else
+   if (parser->m_dtd)
+ #endif /* XML_DTD */
+-    dtdDestroy(parser->m_dtd, (XML_Bool)! parser->m_parentParser,
+-               &parser->m_mem);
++    dtdDestroy(parser->m_dtd, (XML_Bool)! parser->m_parentParser, parser);
+   FREE(parser, (void *)parser->m_atts);
+ #ifdef XML_ATTR_INFO
+   FREE(parser, (void *)parser->m_attInfo);
+@@ -7196,7 +7194,7 @@ dtdReset(DTD *p, XML_Parser parser) {
+ }
+ 
+ static void
+-dtdDestroy(DTD *p, XML_Bool isDocEntity, const XML_Memory_Handling_Suite *ms) {
++dtdDestroy(DTD *p, XML_Bool isDocEntity, XML_Parser parser) {
+   HASH_TABLE_ITER iter;
+   hashTableIterInit(&iter, &(p->elementTypes));
+   for (;;) {
+@@ -7204,7 +7202,7 @@ dtdDestroy(DTD *p, XML_Bool isDocEntity, const XML_Memory_Handling_Suite *ms) {
+     if (! e)
+       break;
+     if (e->allocDefaultAtts != 0)
+-      ms->free_fcn(e->defaultAtts);
++      FREE(parser, e->defaultAtts);
+   }
+   hashTableDestroy(&(p->generalEntities));
+ #ifdef XML_DTD
+@@ -7216,10 +7214,10 @@ dtdDestroy(DTD *p, XML_Bool isDocEntity, const XML_Memory_Handling_Suite *ms) {
+   poolDestroy(&(p->pool));
+   poolDestroy(&(p->entityValuePool));
+   if (isDocEntity) {
+-    ms->free_fcn(p->scaffIndex);
+-    ms->free_fcn(p->scaffold);
++    FREE(parser, p->scaffIndex);
++    FREE(parser, p->scaffold);
+   }
+-  ms->free_fcn(p);
++  FREE(parser, p);
+ }
+ 
+ /* Do a deep copy of the DTD. Return 0 for out of memory, non-zero otherwise.
diff --git a/meta/recipes-core/expat/expat/CVE-2025-59375-07.patch b/meta/recipes-core/expat/expat/CVE-2025-59375-07.patch
new file mode 100644
index 00000000000..7eff0009d2c
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2025-59375-07.patch
@@ -0,0 +1,52 @@
+From 4e7a5d03daf672f20c73d40dc8970385c18b30d3 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Mon, 1 Sep 2025 17:52:58 +0200
+Subject: [PATCH] lib: Make function dtdCopy use macro MALLOC
+
+CVE: CVE-2025-59375
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/4e7a5d03daf672f20c73d40dc8970385c18b30d3]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/xmlparse.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index e7df97da..9f0a8b3e 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -560,7 +560,7 @@ static DTD *dtdCreate(XML_Parser parser);
+ static void dtdReset(DTD *p, XML_Parser parser);
+ static void dtdDestroy(DTD *p, XML_Bool isDocEntity, XML_Parser parser);
+ static int dtdCopy(XML_Parser oldParser, DTD *newDtd, const DTD *oldDtd,
+-                   const XML_Memory_Handling_Suite *ms);
++                   XML_Parser parser);
+ static int copyEntityTable(XML_Parser oldParser, HASH_TABLE *newTable,
+                            STRING_POOL *newPool, const HASH_TABLE *oldTable);
+ static NAMED *lookup(XML_Parser parser, HASH_TABLE *table, KEY name,
+@@ -1572,7 +1572,7 @@ XML_ExternalEntityParserCreate(XML_Parser oldParser, const XML_Char *context,
+   parser->m_prologState.inEntityValue = oldInEntityValue;
+   if (context) {
+ #endif /* XML_DTD */
+-    if (! dtdCopy(oldParser, parser->m_dtd, oldDtd, &parser->m_mem)
++    if (! dtdCopy(oldParser, parser->m_dtd, oldDtd, parser)
+         || ! setContext(parser, context)) {
+       XML_ParserFree(parser);
+       return NULL;
+@@ -7225,7 +7225,7 @@ dtdDestroy(DTD *p, XML_Bool isDocEntity, XML_Parser parser) {
+ */
+ static int
+ dtdCopy(XML_Parser oldParser, DTD *newDtd, const DTD *oldDtd,
+-        const XML_Memory_Handling_Suite *ms) {
++        XML_Parser parser) {
+   HASH_TABLE_ITER iter;
+ 
+   /* Copy the prefix table. */
+@@ -7306,7 +7306,7 @@ dtdCopy(XML_Parser oldParser, DTD *newDtd, const DTD *oldDtd,
+       }
+ #endif
+       newE->defaultAtts
+-          = ms->malloc_fcn(oldE->nDefaultAtts * sizeof(DEFAULT_ATTRIBUTE));
++          = MALLOC(parser, oldE->nDefaultAtts * sizeof(DEFAULT_ATTRIBUTE));
+       if (! newE->defaultAtts) {
+         return 0;
+       }
diff --git a/meta/recipes-core/expat/expat/CVE-2025-59375-08.patch b/meta/recipes-core/expat/expat/CVE-2025-59375-08.patch
new file mode 100644
index 00000000000..deda31bebcd
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2025-59375-08.patch
@@ -0,0 +1,577 @@
+From cfce28e171676fe6f70d17b97ed8a59eaeb83f15 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Mon, 1 Sep 2025 17:34:58 +0200
+Subject: [PATCH] lib: Implement tracking of dynamic memory allocations
+
+**PLEASE NOTE** that distributors intending to backport (or cherry-pick)
+this fix need to copy 99% of the related pull request, not just this
+commit, to not end up with a state that literally does both too much and
+too little at the same time. Appending ".diff" to the pull request URL
+could be of help.
+
+CVE: CVE-2025-59375
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/cfce28e171676fe6f70d17b97ed8a59eaeb83f15]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/expat.h            |  15 +-
+ lib/internal.h         |   5 +
+ lib/libexpat.def.cmake |   3 +
+ lib/xmlparse.c         | 337 +++++++++++++++++++++++++++++++++++++++--
+ tests/basic_tests.c    |   4 +
+ tests/nsalloc_tests.c  |   5 +
+ xmlwf/xmlwf.c          |   2 +
+ xmlwf/xmlwf_helpgen.py |   2 +
+ 8 files changed, 361 insertions(+), 12 deletions(-)
+
+diff --git a/lib/expat.h b/lib/expat.h
+index 610e1ddc..66a253c1 100644
+--- a/lib/expat.h
++++ b/lib/expat.h
+@@ -1032,7 +1032,10 @@ enum XML_FeatureEnum {
+   XML_FEATURE_BILLION_LAUGHS_ATTACK_PROTECTION_MAXIMUM_AMPLIFICATION_DEFAULT,
+   XML_FEATURE_BILLION_LAUGHS_ATTACK_PROTECTION_ACTIVATION_THRESHOLD_DEFAULT,
+   /* Added in Expat 2.6.0. */
+-  XML_FEATURE_GE
++  XML_FEATURE_GE,
++  /* Added in Expat 2.7.2. */
++  XML_FEATURE_ALLOC_TRACKER_MAXIMUM_AMPLIFICATION_DEFAULT,
++  XML_FEATURE_ALLOC_TRACKER_ACTIVATION_THRESHOLD_DEFAULT,
+   /* Additional features must be added to the end of this enum. */
+ };
+ 
+@@ -1057,6 +1060,16 @@ XML_SetBillionLaughsAttackProtectionMaximumAmplification(
+ XMLPARSEAPI(XML_Bool)
+ XML_SetBillionLaughsAttackProtectionActivationThreshold(
+     XML_Parser parser, unsigned long long activationThresholdBytes);
++
++/* Added in Expat 2.7.2. */
++XMLPARSEAPI(XML_Bool)
++XML_SetAllocTrackerMaximumAmplification(XML_Parser parser,
++                                        float maximumAmplificationFactor);
++
++/* Added in Expat 2.7.2. */
++XMLPARSEAPI(XML_Bool)
++XML_SetAllocTrackerActivationThreshold(
++    XML_Parser parser, unsigned long long activationThresholdBytes);
+ #endif
+ 
+ /* Added in Expat 2.6.0. */
+diff --git a/lib/internal.h b/lib/internal.h
+index 6bde6ae6..eb67cf50 100644
+--- a/lib/internal.h
++++ b/lib/internal.h
+@@ -145,6 +145,11 @@
+   100.0f
+ #define EXPAT_BILLION_LAUGHS_ATTACK_PROTECTION_ACTIVATION_THRESHOLD_DEFAULT    \
+   8388608 // 8 MiB, 2^23
++
++#define EXPAT_ALLOC_TRACKER_MAXIMUM_AMPLIFICATION_DEFAULT 100.0f
++#define EXPAT_ALLOC_TRACKER_ACTIVATION_THRESHOLD_DEFAULT                       \
++  67108864 // 64 MiB, 2^26
++
+ /* NOTE END */
+ 
+ #include "expat.h" // so we can use type XML_Parser below
+diff --git a/lib/libexpat.def.cmake b/lib/libexpat.def.cmake
+index 10ee9cd6..7a3a7ec0 100644
+--- a/lib/libexpat.def.cmake
++++ b/lib/libexpat.def.cmake
+@@ -79,3 +79,6 @@ EXPORTS
+ @_EXPAT_COMMENT_DTD_OR_GE@ XML_SetBillionLaughsAttackProtectionMaximumAmplification @70
+ ; added with version 2.6.0
+   XML_SetReparseDeferralEnabled @71
++; added with version 2.7.2
++@_EXPAT_COMMENT_DTD_OR_GE@ XML_SetAllocTrackerMaximumAmplification @72
++@_EXPAT_COMMENT_DTD_OR_GE@ XML_SetAllocTrackerActivationThreshold @73
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 9f0a8b3e..fcf1cfdd 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -452,6 +452,14 @@ typedef struct accounting {
+   unsigned long long activationThresholdBytes;
+ } ACCOUNTING;
+ 
++typedef struct MALLOC_TRACKER {
++  XmlBigCount bytesAllocated;
++  XmlBigCount peakBytesAllocated; // updated live only for debug level >=2
++  unsigned long debugLevel;
++  float maximumAmplificationFactor; // >=1.0
++  XmlBigCount activationThresholdBytes;
++} MALLOC_TRACKER;
++
+ typedef struct entity_stats {
+   unsigned int countEverOpened;
+   unsigned int currentDepth;
+@@ -599,7 +607,8 @@ static XML_Bool startParsing(XML_Parser parser);
+ 
+ static XML_Parser parserCreate(const XML_Char *encodingName,
+                                const XML_Memory_Handling_Suite *memsuite,
+-                               const XML_Char *nameSep, DTD *dtd);
++                               const XML_Char *nameSep, DTD *dtd,
++                               XML_Parser parentParser);
+ 
+ static void parserInit(XML_Parser parser, const XML_Char *encodingName);
+ 
+@@ -769,14 +778,220 @@ struct XML_ParserStruct {
+   unsigned long m_hash_secret_salt;
+ #if XML_GE == 1
+   ACCOUNTING m_accounting;
++  MALLOC_TRACKER m_alloc_tracker;
+   ENTITY_STATS m_entity_stats;
+ #endif
+   XML_Bool m_reenter;
+ };
+ 
+-#define MALLOC(parser, s) (parser->m_mem.malloc_fcn((s)))
+-#define REALLOC(parser, p, s) (parser->m_mem.realloc_fcn((p), (s)))
+-#define FREE(parser, p) (parser->m_mem.free_fcn((p)))
++#if XML_GE == 1
++#  define MALLOC(parser, s) (expat_malloc((parser), (s), __LINE__))
++#  define REALLOC(parser, p, s) (expat_realloc((parser), (p), (s), __LINE__))
++#  define FREE(parser, p) (expat_free((parser), (p), __LINE__))
++#else
++#  define MALLOC(parser, s) (parser->m_mem.malloc_fcn((s)))
++#  define REALLOC(parser, p, s) (parser->m_mem.realloc_fcn((p), (s)))
++#  define FREE(parser, p) (parser->m_mem.free_fcn((p)))
++#endif
++
++#if XML_GE == 1
++static void
++expat_heap_stat(XML_Parser rootParser, char operator, XmlBigCount absDiff,
++                XmlBigCount newTotal, XmlBigCount peakTotal, int sourceLine) {
++  // NOTE: This can be +infinity or -nan
++  const float amplification
++      = (float)newTotal / (float)rootParser->m_accounting.countBytesDirect;
++  fprintf(
++      stderr,
++      "expat: Allocations(%p): Direct " EXPAT_FMT_ULL("10") ", allocated %c" EXPAT_FMT_ULL(
++          "10") " to " EXPAT_FMT_ULL("10") " (" EXPAT_FMT_ULL("10") " peak), amplification %8.2f (xmlparse.c:%d)\n",
++      (void *)rootParser, rootParser->m_accounting.countBytesDirect, operator,
++      absDiff, newTotal, peakTotal, (double)amplification, sourceLine);
++}
++
++static bool
++expat_heap_increase_tolerable(XML_Parser rootParser, XmlBigCount increase,
++                              int sourceLine) {
++  assert(rootParser != NULL);
++  assert(increase > 0);
++
++  XmlBigCount newTotal = 0;
++  bool tolerable = true;
++
++  // Detect integer overflow
++  if ((XmlBigCount)-1 - rootParser->m_alloc_tracker.bytesAllocated < increase) {
++    tolerable = false;
++  } else {
++    newTotal = rootParser->m_alloc_tracker.bytesAllocated + increase;
++
++    if (newTotal >= rootParser->m_alloc_tracker.activationThresholdBytes) {
++      assert(newTotal > 0);
++      // NOTE: This can be +infinity when dividing by zero but not -nan
++      const float amplification
++          = (float)newTotal / (float)rootParser->m_accounting.countBytesDirect;
++      if (amplification
++          > rootParser->m_alloc_tracker.maximumAmplificationFactor) {
++        tolerable = false;
++      }
++    }
++  }
++
++  if (! tolerable && (rootParser->m_alloc_tracker.debugLevel >= 1)) {
++    expat_heap_stat(rootParser, '+', increase, newTotal, newTotal, sourceLine);
++  }
++
++  return tolerable;
++}
++
++static void *
++expat_malloc(XML_Parser parser, size_t size, int sourceLine) {
++  // Detect integer overflow
++  if (SIZE_MAX - size < sizeof(size_t)) {
++    return NULL;
++  }
++
++  const XML_Parser rootParser = getRootParserOf(parser, NULL);
++  assert(rootParser->m_parentParser == NULL);
++
++  const size_t bytesToAllocate = sizeof(size_t) + size;
++
++  if ((XmlBigCount)-1 - rootParser->m_alloc_tracker.bytesAllocated
++      < bytesToAllocate) {
++    return NULL; // i.e. signal integer overflow as out-of-memory
++  }
++
++  if (! expat_heap_increase_tolerable(rootParser, bytesToAllocate,
++                                      sourceLine)) {
++    return NULL; // i.e. signal violation as out-of-memory
++  }
++
++  // Actually allocate
++  void *const mallocedPtr = parser->m_mem.malloc_fcn(bytesToAllocate);
++
++  if (mallocedPtr == NULL) {
++    return NULL;
++  }
++
++  // Update in-block recorded size
++  *(size_t *)mallocedPtr = size;
++
++  // Update accounting
++  rootParser->m_alloc_tracker.bytesAllocated += bytesToAllocate;
++
++  // Report as needed
++  if (rootParser->m_alloc_tracker.debugLevel >= 2) {
++    if (rootParser->m_alloc_tracker.bytesAllocated
++        > rootParser->m_alloc_tracker.peakBytesAllocated) {
++      rootParser->m_alloc_tracker.peakBytesAllocated
++          = rootParser->m_alloc_tracker.bytesAllocated;
++    }
++    expat_heap_stat(rootParser, '+', bytesToAllocate,
++                    rootParser->m_alloc_tracker.bytesAllocated,
++                    rootParser->m_alloc_tracker.peakBytesAllocated, sourceLine);
++  }
++
++  return (char *)mallocedPtr + sizeof(size_t);
++}
++
++static void
++expat_free(XML_Parser parser, void *ptr, int sourceLine) {
++  assert(parser != NULL);
++
++  if (ptr == NULL) {
++    return;
++  }
++
++  const XML_Parser rootParser = getRootParserOf(parser, NULL);
++  assert(rootParser->m_parentParser == NULL);
++
++  // Extract size (to the eyes of malloc_fcn/realloc_fcn) and
++  // the original pointer returned by malloc/realloc
++  void *const mallocedPtr = (char *)ptr - sizeof(size_t);
++  const size_t bytesAllocated = sizeof(size_t) + *(size_t *)mallocedPtr;
++
++  // Update accounting
++  assert(rootParser->m_alloc_tracker.bytesAllocated >= bytesAllocated);
++  rootParser->m_alloc_tracker.bytesAllocated -= bytesAllocated;
++
++  // Report as needed
++  if (rootParser->m_alloc_tracker.debugLevel >= 2) {
++    expat_heap_stat(rootParser, '-', bytesAllocated,
++                    rootParser->m_alloc_tracker.bytesAllocated,
++                    rootParser->m_alloc_tracker.peakBytesAllocated, sourceLine);
++  }
++
++  // NOTE: This may be freeing rootParser, so freeing has to come last
++  parser->m_mem.free_fcn(mallocedPtr);
++}
++
++static void *
++expat_realloc(XML_Parser parser, void *ptr, size_t size, int sourceLine) {
++  assert(parser != NULL);
++
++  if (ptr == NULL) {
++    return expat_malloc(parser, size, sourceLine);
++  }
++
++  if (size == 0) {
++    expat_free(parser, ptr, sourceLine);
++    return NULL;
++  }
++
++  const XML_Parser rootParser = getRootParserOf(parser, NULL);
++  assert(rootParser->m_parentParser == NULL);
++
++  // Extract original size (to the eyes of the caller) and the original
++  // pointer returned by malloc/realloc
++  void *mallocedPtr = (char *)ptr - sizeof(size_t);
++  const size_t prevSize = *(size_t *)mallocedPtr;
++
++  // Classify upcoming change
++  const bool isIncrease = (size > prevSize);
++  const size_t absDiff
++      = (size > prevSize) ? (size - prevSize) : (prevSize - size);
++
++  // Ask for permission from accounting
++  if (isIncrease) {
++    if (! expat_heap_increase_tolerable(rootParser, absDiff, sourceLine)) {
++      return NULL; // i.e. signal violation as out-of-memory
++    }
++  }
++
++  // Actually allocate
++  mallocedPtr = parser->m_mem.realloc_fcn(mallocedPtr, sizeof(size_t) + size);
++
++  if (mallocedPtr == NULL) {
++    return NULL;
++  }
++
++  // Update accounting
++  if (isIncrease) {
++    assert((XmlBigCount)-1 - rootParser->m_alloc_tracker.bytesAllocated
++           >= absDiff);
++    rootParser->m_alloc_tracker.bytesAllocated += absDiff;
++  } else { // i.e. decrease
++    assert(rootParser->m_alloc_tracker.bytesAllocated >= absDiff);
++    rootParser->m_alloc_tracker.bytesAllocated -= absDiff;
++  }
++
++  // Report as needed
++  if (rootParser->m_alloc_tracker.debugLevel >= 2) {
++    if (rootParser->m_alloc_tracker.bytesAllocated
++        > rootParser->m_alloc_tracker.peakBytesAllocated) {
++      rootParser->m_alloc_tracker.peakBytesAllocated
++          = rootParser->m_alloc_tracker.bytesAllocated;
++    }
++    expat_heap_stat(rootParser, isIncrease ? '+' : '-', absDiff,
++                    rootParser->m_alloc_tracker.bytesAllocated,
++                    rootParser->m_alloc_tracker.peakBytesAllocated, sourceLine);
++  }
++
++  // Update in-block recorded size
++  *(size_t *)mallocedPtr = size;
++
++  return (char *)mallocedPtr + sizeof(size_t);
++}
++#endif // XML_GE == 1
+ 
+ XML_Parser XMLCALL
+ XML_ParserCreate(const XML_Char *encodingName) {
+@@ -1096,19 +1311,40 @@ XML_Parser XMLCALL
+ XML_ParserCreate_MM(const XML_Char *encodingName,
+                     const XML_Memory_Handling_Suite *memsuite,
+                     const XML_Char *nameSep) {
+-  return parserCreate(encodingName, memsuite, nameSep, NULL);
++  return parserCreate(encodingName, memsuite, nameSep, NULL, NULL);
+ }
+ 
+ static XML_Parser
+ parserCreate(const XML_Char *encodingName,
+              const XML_Memory_Handling_Suite *memsuite, const XML_Char *nameSep,
+-             DTD *dtd) {
+-  XML_Parser parser;
++             DTD *dtd, XML_Parser parentParser) {
++  XML_Parser parser = NULL;
++
++#if XML_GE == 1
++  const size_t increase = sizeof(size_t) + sizeof(struct XML_ParserStruct);
++
++  if (parentParser != NULL) {
++    const XML_Parser rootParser = getRootParserOf(parentParser, NULL);
++    if (! expat_heap_increase_tolerable(rootParser, increase, __LINE__)) {
++      return NULL;
++    }
++  }
++#else
++  UNUSED_P(parentParser);
++#endif
+ 
+   if (memsuite) {
+     XML_Memory_Handling_Suite *mtemp;
++#if XML_GE == 1
++    void *const sizeAndParser = memsuite->malloc_fcn(
++        sizeof(size_t) + sizeof(struct XML_ParserStruct));
++    if (sizeAndParser != NULL) {
++      *(size_t *)sizeAndParser = sizeof(struct XML_ParserStruct);
++      parser = (XML_Parser)((char *)sizeAndParser + sizeof(size_t));
++#else
+     parser = memsuite->malloc_fcn(sizeof(struct XML_ParserStruct));
+     if (parser != NULL) {
++#endif
+       mtemp = (XML_Memory_Handling_Suite *)&(parser->m_mem);
+       mtemp->malloc_fcn = memsuite->malloc_fcn;
+       mtemp->realloc_fcn = memsuite->realloc_fcn;
+@@ -1116,18 +1352,67 @@ parserCreate(const XML_Char *encodingName,
+     }
+   } else {
+     XML_Memory_Handling_Suite *mtemp;
++#if XML_GE == 1
++    void *const sizeAndParser
++        = (XML_Parser)malloc(sizeof(size_t) + sizeof(struct XML_ParserStruct));
++    if (sizeAndParser != NULL) {
++      *(size_t *)sizeAndParser = sizeof(struct XML_ParserStruct);
++      parser = (XML_Parser)((char *)sizeAndParser + sizeof(size_t));
++#else
+     parser = (XML_Parser)malloc(sizeof(struct XML_ParserStruct));
+     if (parser != NULL) {
++#endif
+       mtemp = (XML_Memory_Handling_Suite *)&(parser->m_mem);
+       mtemp->malloc_fcn = malloc;
+       mtemp->realloc_fcn = realloc;
+       mtemp->free_fcn = free;
+     }
+-  }
++  } // cppcheck-suppress[memleak symbolName=sizeAndParser] // Cppcheck >=2.18.0
+ 
+   if (! parser)
+     return parser;
+ 
++#if XML_GE == 1
++  // Initialize .m_alloc_tracker
++  memset(&parser->m_alloc_tracker, 0, sizeof(MALLOC_TRACKER));
++  if (parentParser == NULL) {
++    parser->m_alloc_tracker.debugLevel
++        = getDebugLevel("EXPAT_MALLOC_DEBUG", 0u);
++    parser->m_alloc_tracker.maximumAmplificationFactor
++        = EXPAT_ALLOC_TRACKER_MAXIMUM_AMPLIFICATION_DEFAULT;
++    parser->m_alloc_tracker.activationThresholdBytes
++        = EXPAT_ALLOC_TRACKER_ACTIVATION_THRESHOLD_DEFAULT;
++
++    // NOTE: This initialization needs to come this early because these fields
++    //       are read by allocation tracking code
++    parser->m_parentParser = NULL;
++    parser->m_accounting.countBytesDirect = 0;
++  } else {
++    parser->m_parentParser = parentParser;
++  }
++
++  // Record XML_ParserStruct allocation we did a few lines up before
++  const XML_Parser rootParser = getRootParserOf(parser, NULL);
++  assert(rootParser->m_parentParser == NULL);
++  assert(SIZE_MAX - rootParser->m_alloc_tracker.bytesAllocated >= increase);
++  rootParser->m_alloc_tracker.bytesAllocated += increase;
++
++  // Report on allocation
++  if (rootParser->m_alloc_tracker.debugLevel >= 2) {
++    if (rootParser->m_alloc_tracker.bytesAllocated
++        > rootParser->m_alloc_tracker.peakBytesAllocated) {
++      rootParser->m_alloc_tracker.peakBytesAllocated
++          = rootParser->m_alloc_tracker.bytesAllocated;
++    }
++
++    expat_heap_stat(rootParser, '+', increase,
++                    rootParser->m_alloc_tracker.bytesAllocated,
++                    rootParser->m_alloc_tracker.peakBytesAllocated, __LINE__);
++  }
++#else
++  parser->m_parentParser = NULL;
++#endif // XML_GE == 1
++
+   parser->m_buffer = NULL;
+   parser->m_bufferLim = NULL;
+ 
+@@ -1291,7 +1576,6 @@ parserInit(XML_Parser parser, const XML_Char *encodingName) {
+   parser->m_unknownEncodingMem = NULL;
+   parser->m_unknownEncodingRelease = NULL;
+   parser->m_unknownEncodingData = NULL;
+-  parser->m_parentParser = NULL;
+   parser->m_parsingStatus.parsing = XML_INITIALIZED;
+   // Reentry can only be triggered inside m_processor calls
+   parser->m_reenter = XML_FALSE;
+@@ -1526,9 +1810,10 @@ XML_ExternalEntityParserCreate(XML_Parser oldParser, const XML_Char *context,
+   */
+   if (parser->m_ns) {
+     XML_Char tmp[2] = {parser->m_namespaceSeparator, 0};
+-    parser = parserCreate(encodingName, &parser->m_mem, tmp, newDtd);
++    parser = parserCreate(encodingName, &parser->m_mem, tmp, newDtd, oldParser);
+   } else {
+-    parser = parserCreate(encodingName, &parser->m_mem, NULL, newDtd);
++    parser
++        = parserCreate(encodingName, &parser->m_mem, NULL, newDtd, oldParser);
+   }
+ 
+   if (! parser)
+@@ -2708,6 +2993,13 @@ XML_GetFeatureList(void) {
+        EXPAT_BILLION_LAUGHS_ATTACK_PROTECTION_ACTIVATION_THRESHOLD_DEFAULT},
+       /* Added in Expat 2.6.0. */
+       {XML_FEATURE_GE, XML_L("XML_GE"), 0},
++      /* Added in Expat 2.7.2. */
++      {XML_FEATURE_ALLOC_TRACKER_MAXIMUM_AMPLIFICATION_DEFAULT,
++       XML_L("XML_AT_MAX_AMP"),
++       (long int)EXPAT_ALLOC_TRACKER_MAXIMUM_AMPLIFICATION_DEFAULT},
++      {XML_FEATURE_ALLOC_TRACKER_ACTIVATION_THRESHOLD_DEFAULT,
++       XML_L("XML_AT_ACT_THRES"),
++       (long int)EXPAT_ALLOC_TRACKER_ACTIVATION_THRESHOLD_DEFAULT},
+ #endif
+       {XML_FEATURE_END, NULL, 0}};
+ 
+@@ -2736,6 +3028,29 @@ XML_SetBillionLaughsAttackProtectionActivationThreshold(
+   parser->m_accounting.activationThresholdBytes = activationThresholdBytes;
+   return XML_TRUE;
+ }
++
++XML_Bool XMLCALL
++XML_SetAllocTrackerMaximumAmplification(XML_Parser parser,
++                                        float maximumAmplificationFactor) {
++  if ((parser == NULL) || (parser->m_parentParser != NULL)
++      || isnan(maximumAmplificationFactor)
++      || (maximumAmplificationFactor < 1.0f)) {
++    return XML_FALSE;
++  }
++  parser->m_alloc_tracker.maximumAmplificationFactor
++      = maximumAmplificationFactor;
++  return XML_TRUE;
++}
++
++XML_Bool XMLCALL
++XML_SetAllocTrackerActivationThreshold(
++    XML_Parser parser, unsigned long long activationThresholdBytes) {
++  if ((parser == NULL) || (parser->m_parentParser != NULL)) {
++    return XML_FALSE;
++  }
++  parser->m_alloc_tracker.activationThresholdBytes = activationThresholdBytes;
++  return XML_TRUE;
++}
+ #endif /* XML_GE == 1 */
+ 
+ XML_Bool XMLCALL
+diff --git a/tests/basic_tests.c b/tests/basic_tests.c
+index 129db1d8..0231e094 100644
+--- a/tests/basic_tests.c
++++ b/tests/basic_tests.c
+@@ -3089,6 +3089,10 @@ START_TEST(test_buffer_can_grow_to_max) {
+   for (int i = 0; i < num_prefixes; ++i) {
+     set_subtest("\"%s\"", prefixes[i]);
+     XML_Parser parser = XML_ParserCreate(NULL);
++#if XML_GE == 1
++    assert_true(XML_SetAllocTrackerActivationThreshold(parser, (size_t)-1)
++                == XML_TRUE); // i.e. deactivate
++#endif
+     const int prefix_len = (int)strlen(prefixes[i]);
+     const enum XML_Status s
+         = _XML_Parse_SINGLE_BYTES(parser, prefixes[i], prefix_len, XML_FALSE);
+diff --git a/tests/nsalloc_tests.c b/tests/nsalloc_tests.c
+index 48520f42..0a594e14 100644
+--- a/tests/nsalloc_tests.c
++++ b/tests/nsalloc_tests.c
+@@ -454,10 +454,15 @@ START_TEST(test_nsalloc_realloc_attributes) {
+     nsalloc_teardown();
+     nsalloc_setup();
+   }
++#if XML_GE == 1
++  assert_true(
++      i == 0); // because expat_realloc relies on expat_malloc to some extent
++#else
+   if (i == 0)
+     fail("Parsing worked despite failing reallocations");
+   else if (i == max_realloc_count)
+     fail("Parsing failed at max reallocation count");
++#endif
+ }
+ END_TEST
+ 
+diff --git a/xmlwf/xmlwf.c b/xmlwf/xmlwf.c
+index 8cfc73ca..b9d0a7fc 100644
+--- a/xmlwf/xmlwf.c
++++ b/xmlwf/xmlwf.c
+@@ -933,6 +933,8 @@ usage(const XML_Char *prog, int rc) {
+       T("                 Control verbosity of entity debugging (default: 0)\n")
+       T("  EXPAT_ENTROPY_DEBUG=(0|1)\n")
+       T("                 Control verbosity of entropy debugging (default: 0)\n")
++      T("  EXPAT_MALLOC_DEBUG=(0|1|2)\n")
++      T("                 Control verbosity of allocation tracker (default: 0)\n")
+       T("\n")
+       T("exit status:\n")
+       T("  0              the input files are well-formed and the output (if requested) was written successfully\n")
+diff --git a/xmlwf/xmlwf_helpgen.py b/xmlwf/xmlwf_helpgen.py
+index 39a3dc13..2360820d 100755
+--- a/xmlwf/xmlwf_helpgen.py
++++ b/xmlwf/xmlwf_helpgen.py
+@@ -39,6 +39,8 @@ environment variables:
+                  Control verbosity of entity debugging (default: 0)
+   EXPAT_ENTROPY_DEBUG=(0|1)
+                  Control verbosity of entropy debugging (default: 0)
++  EXPAT_MALLOC_DEBUG=(0|1|2)
++                 Control verbosity of allocation tracker (default: 0)
+ 
+ exit status:
+   0              the input files are well-formed and the output (if requested) was written successfully
diff --git a/meta/recipes-core/expat/expat/CVE-2025-59375-09.patch b/meta/recipes-core/expat/expat/CVE-2025-59375-09.patch
new file mode 100644
index 00000000000..364c28183ac
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2025-59375-09.patch
@@ -0,0 +1,43 @@
+From 1270e5bc0836d296ac4970fc9e1cf53d83972083 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sun, 7 Sep 2025 12:18:08 +0200
+Subject: [PATCH] lib: Make XML_MemFree and XML_FreeContentModel match their
+ siblings
+
+.. XML_MemMalloc and XML_MemRealloc in structure, prior to upcoming changes
+
+CVE: CVE-2025-59375
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/1270e5bc0836d296ac4970fc9e1cf53d83972083]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/xmlparse.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index fcf1cfdd..5d27cd45 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -2772,8 +2772,9 @@ XML_GetCurrentColumnNumber(XML_Parser parser) {
+ 
+ void XMLCALL
+ XML_FreeContentModel(XML_Parser parser, XML_Content *model) {
+-  if (parser != NULL)
+-    FREE(parser, model);
++  if (parser == NULL)
++    return;
++  FREE(parser, model);
+ }
+ 
+ void *XMLCALL
+@@ -2792,8 +2793,9 @@ XML_MemRealloc(XML_Parser parser, void *ptr, size_t size) {
+ 
+ void XMLCALL
+ XML_MemFree(XML_Parser parser, void *ptr) {
+-  if (parser != NULL)
+-    FREE(parser, ptr);
++  if (parser == NULL)
++    return;
++  FREE(parser, ptr);
+ }
+ 
+ void XMLCALL
diff --git a/meta/recipes-core/expat/expat/CVE-2025-59375-10.patch b/meta/recipes-core/expat/expat/CVE-2025-59375-10.patch
new file mode 100644
index 00000000000..fe5452000e1
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2025-59375-10.patch
@@ -0,0 +1,54 @@
+From 96c7467281c72028aada525c1d3822512758b266 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sun, 7 Sep 2025 12:06:43 +0200
+Subject: [PATCH] lib: Exclude XML_Mem* functions from allocation tracking
+
+.. so that allocations by the user application
+are not being limited.
+
+CVE: CVE-2025-59375
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/96c7467281c72028aada525c1d3822512758b266]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/xmlparse.c | 16 +++++++++++++---
+ 1 file changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 5d27cd45..8145a049 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -2781,21 +2781,31 @@ void *XMLCALL
+ XML_MemMalloc(XML_Parser parser, size_t size) {
+   if (parser == NULL)
+     return NULL;
+-  return MALLOC(parser, size);
++
++  // NOTE: We are avoiding MALLOC(..) here to not include
++  //       user allocations with allocation tracking and limiting.
++  return parser->m_mem.malloc_fcn(size);
+ }
+ 
+ void *XMLCALL
+ XML_MemRealloc(XML_Parser parser, void *ptr, size_t size) {
+   if (parser == NULL)
+     return NULL;
+-  return REALLOC(parser, ptr, size);
++
++  // NOTE: We are avoiding REALLOC(..) here to not include
++  //       user allocations with allocation tracking and limiting.
++  return parser->m_mem.realloc_fcn(ptr, size);
+ }
+ 
+ void XMLCALL
+ XML_MemFree(XML_Parser parser, void *ptr) {
+   if (parser == NULL)
+     return;
+-  FREE(parser, ptr);
++
++  // NOTE: We are avoiding FREE(..) here because XML_MemMalloc and
++  //       XML_MemRealloc are not using MALLOC(..) and REALLOC(..)
++  //       but plain .malloc_fcn(..) and .realloc_fcn(..), internally.
++  parser->m_mem.free_fcn(ptr);
+ }
+ 
+ void XMLCALL
diff --git a/meta/recipes-core/expat/expat/CVE-2025-59375-11.patch b/meta/recipes-core/expat/expat/CVE-2025-59375-11.patch
new file mode 100644
index 00000000000..be892a78046
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2025-59375-11.patch
@@ -0,0 +1,66 @@
+From ae4086198d710a62a0a1560007b81307dba72909 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 9 Sep 2025 21:34:28 +0200
+Subject: [PATCH] lib: Exclude the main input buffer from allocation tracking
+
+.. so that control of the input buffer size remains with the
+application using Expat
+
+CVE: CVE-2025-59375
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/ae4086198d710a62a0a1560007b81307dba72909]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/xmlparse.c | 19 +++++++++++++++----
+ 1 file changed, 15 insertions(+), 4 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 8145a049..00139b94 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -1975,7 +1975,10 @@ XML_ParserFree(XML_Parser parser) {
+   FREE(parser, (void *)parser->m_attInfo);
+ #endif
+   FREE(parser, parser->m_groupConnector);
+-  FREE(parser, parser->m_buffer);
++  // NOTE: We are avoiding FREE(..) here because parser->m_buffer
++  //       is not being allocated with MALLOC(..) but with plain
++  //       .malloc_fcn(..).
++  parser->m_mem.free_fcn(parser->m_buffer);
+   FREE(parser, parser->m_dataBuf);
+   FREE(parser, parser->m_nsAtts);
+   FREE(parser, parser->m_unknownEncodingMem);
+@@ -2567,7 +2570,9 @@ XML_GetBuffer(XML_Parser parser, int len) {
+         parser->m_errorCode = XML_ERROR_NO_MEMORY;
+         return NULL;
+       }
+-      newBuf = (char *)MALLOC(parser, bufferSize);
++      // NOTE: We are avoiding MALLOC(..) here to leave limiting
++      //       the input size to the application using Expat.
++      newBuf = (char *)parser->m_mem.malloc_fcn(bufferSize);
+       if (newBuf == 0) {
+         parser->m_errorCode = XML_ERROR_NO_MEMORY;
+         return NULL;
+@@ -2578,7 +2583,10 @@ XML_GetBuffer(XML_Parser parser, int len) {
+         memcpy(newBuf, &parser->m_bufferPtr[-keep],
+                EXPAT_SAFE_PTR_DIFF(parser->m_bufferEnd, parser->m_bufferPtr)
+                    + keep);
+-        FREE(parser, parser->m_buffer);
++        // NOTE: We are avoiding FREE(..) here because parser->m_buffer
++        //       is not being allocated with MALLOC(..) but with plain
++        //       .malloc_fcn(..).
++        parser->m_mem.free_fcn(parser->m_buffer);
+         parser->m_buffer = newBuf;
+         parser->m_bufferEnd
+             = parser->m_buffer
+@@ -2594,7 +2602,10 @@ XML_GetBuffer(XML_Parser parser, int len) {
+       if (parser->m_bufferPtr) {
+         memcpy(newBuf, parser->m_bufferPtr,
+                EXPAT_SAFE_PTR_DIFF(parser->m_bufferEnd, parser->m_bufferPtr));
+-        FREE(parser, parser->m_buffer);
++        // NOTE: We are avoiding FREE(..) here because parser->m_buffer
++        //       is not being allocated with MALLOC(..) but with plain
++        //       .malloc_fcn(..).
++        parser->m_mem.free_fcn(parser->m_buffer);
+         parser->m_bufferEnd
+             = newBuf
+               + EXPAT_SAFE_PTR_DIFF(parser->m_bufferEnd, parser->m_bufferPtr);
diff --git a/meta/recipes-core/expat/expat/CVE-2025-59375-12.patch b/meta/recipes-core/expat/expat/CVE-2025-59375-12.patch
new file mode 100644
index 00000000000..9e036a52849
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2025-59375-12.patch
@@ -0,0 +1,58 @@
+From 7e35240dc97e9fd4f609e31f27c27b659535e436 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Thu, 11 Sep 2025 00:27:05 +0200
+Subject: [PATCH] lib: Exclude the content model from allocation tracking
+
+.. so that applications that are not using XML_FreeContentModel
+but plain free(..) or .free_fcn() to free the content model's
+memory are safe
+
+CVE: CVE-2025-59375
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/7e35240dc97e9fd4f609e31f27c27b659535e436]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/xmlparse.c | 16 +++++++++++++---
+ 1 file changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 00139b94..d0b6e0cd 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -2785,7 +2785,10 @@ void XMLCALL
+ XML_FreeContentModel(XML_Parser parser, XML_Content *model) {
+   if (parser == NULL)
+     return;
+-  FREE(parser, model);
++
++  // NOTE: We are avoiding FREE(..) here because the content model
++  //       has been created using plain .malloc_fcn(..) rather than MALLOC(..).
++  parser->m_mem.free_fcn(model);
+ }
+ 
+ void *XMLCALL
+@@ -6063,8 +6066,12 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+     case XML_ROLE_CONTENT_EMPTY:
+       if (dtd->in_eldecl) {
+         if (parser->m_elementDeclHandler) {
++          // NOTE: We are avoiding MALLOC(..) here to so that
++          //       applications that are not using XML_FreeContentModel but
++          //       plain free(..) or .free_fcn() to free the content model's
++          //       memory are safe.
+           XML_Content *content
+-              = (XML_Content *)MALLOC(parser, sizeof(XML_Content));
++              = (XML_Content *)parser->m_mem.malloc_fcn(sizeof(XML_Content));
+           if (! content)
+             return XML_ERROR_NO_MEMORY;
+           content->quant = XML_CQUANT_NONE;
+@@ -8278,7 +8285,10 @@ build_model(XML_Parser parser) {
+   const size_t allocsize = (dtd->scaffCount * sizeof(XML_Content)
+                             + (dtd->contentStringLen * sizeof(XML_Char)));
+ 
+-  ret = (XML_Content *)MALLOC(parser, allocsize);
++  // NOTE: We are avoiding MALLOC(..) here to so that
++  //       applications that are not using XML_FreeContentModel but plain
++  //       free(..) or .free_fcn() to free the content model's memory are safe.
++  ret = (XML_Content *)parser->m_mem.malloc_fcn(allocsize);
+   if (! ret)
+     return NULL;
+ 
diff --git a/meta/recipes-core/expat/expat/CVE-2025-59375-13.patch b/meta/recipes-core/expat/expat/CVE-2025-59375-13.patch
new file mode 100644
index 00000000000..209dd83a4b6
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2025-59375-13.patch
@@ -0,0 +1,309 @@
+From 31f9053c3c46741f4daf2ea2bdea75f40f720d42 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 2 Sep 2025 22:36:49 +0200
+Subject: [PATCH] tests: Cover allocation tracking and limiting with tests
+
+CVE: CVE-2025-59375
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/31f9053c3c46741f4daf2ea2bdea75f40f720d42]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/internal.h      |   3 +
+ lib/xmlparse.c      |  12 +++
+ tests/alloc_tests.c | 214 ++++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 229 insertions(+)
+
+diff --git a/lib/internal.h b/lib/internal.h
+index eb67cf50..6e087858 100644
+--- a/lib/internal.h
++++ b/lib/internal.h
+@@ -173,6 +173,9 @@ extern
+ #endif
+     XML_Bool g_reparseDeferralEnabledDefault; // written ONLY in runtests.c
+ #if defined(XML_TESTING)
++void *expat_malloc(XML_Parser parser, size_t size, int sourceLine);
++void expat_free(XML_Parser parser, void *ptr, int sourceLine);
++void *expat_realloc(XML_Parser parser, void *ptr, size_t size, int sourceLine);
+ extern unsigned int g_bytesScanned; // used for testing only
+ #endif
+ 
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index d0b6e0cd..6e9c6fb2 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -843,7 +843,11 @@ expat_heap_increase_tolerable(XML_Parser rootParser, XmlBigCount increase,
+   return tolerable;
+ }
+ 
++#  if defined(XML_TESTING)
++void *
++#  else
+ static void *
++#  endif
+ expat_malloc(XML_Parser parser, size_t size, int sourceLine) {
+   // Detect integer overflow
+   if (SIZE_MAX - size < sizeof(size_t)) {
+@@ -893,7 +897,11 @@ expat_malloc(XML_Parser parser, size_t size, int sourceLine) {
+   return (char *)mallocedPtr + sizeof(size_t);
+ }
+ 
++#  if defined(XML_TESTING)
++void
++#  else
+ static void
++#  endif
+ expat_free(XML_Parser parser, void *ptr, int sourceLine) {
+   assert(parser != NULL);
+ 
+@@ -924,7 +932,11 @@ expat_free(XML_Parser parser, void *ptr, int sourceLine) {
+   parser->m_mem.free_fcn(mallocedPtr);
+ }
+ 
++#  if defined(XML_TESTING)
++void *
++#  else
+ static void *
++#  endif
+ expat_realloc(XML_Parser parser, void *ptr, size_t size, int sourceLine) {
+   assert(parser != NULL);
+ 
+diff --git a/tests/alloc_tests.c b/tests/alloc_tests.c
+index 4c3e2af4..275f92d5 100644
+--- a/tests/alloc_tests.c
++++ b/tests/alloc_tests.c
+@@ -46,10 +46,16 @@
+ #  undef NDEBUG /* because test suite relies on assert(...) at the moment */
+ #endif
+ 
++#include <math.h> /* NAN, INFINITY */
++#include <stdbool.h>
++#include <stdint.h> /* for SIZE_MAX */
+ #include <string.h>
+ #include <assert.h>
+ 
++#include "expat_config.h"
++
+ #include "expat.h"
++#include "internal.h"
+ #include "common.h"
+ #include "minicheck.h"
+ #include "dummy.h"
+@@ -2085,6 +2091,203 @@ START_TEST(test_alloc_reset_after_external_entity_parser_create_fail) {
+ }
+ END_TEST
+ 
++START_TEST(test_alloc_tracker_size_recorded) {
++  XML_Memory_Handling_Suite memsuite = {malloc, realloc, free};
++
++  bool values[] = {true, false};
++  for (size_t i = 0; i < sizeof(values) / sizeof(values[0]); i++) {
++    const bool useMemSuite = values[i];
++    set_subtest("useMemSuite=%d", (int)useMemSuite);
++    XML_Parser parser = useMemSuite
++                            ? XML_ParserCreate_MM(NULL, &memsuite, XCS("|"))
++                            : XML_ParserCreate(NULL);
++
++#if XML_GE == 1
++    void *ptr = expat_malloc(parser, 10, -1);
++
++    assert_true(ptr != NULL);
++    assert_true(*((size_t *)ptr - 1) == 10);
++
++    assert_true(expat_realloc(parser, ptr, SIZE_MAX / 2, -1) == NULL);
++
++    assert_true(*((size_t *)ptr - 1) == 10); // i.e. unchanged
++
++    ptr = expat_realloc(parser, ptr, 20, -1);
++
++    assert_true(ptr != NULL);
++    assert_true(*((size_t *)ptr - 1) == 20);
++
++    expat_free(parser, ptr, -1);
++#endif
++
++    XML_ParserFree(parser);
++  }
++}
++END_TEST
++
++START_TEST(test_alloc_tracker_maximum_amplification) {
++  if (g_reparseDeferralEnabledDefault == XML_TRUE) {
++    return;
++  }
++
++  XML_Parser parser = XML_ParserCreate(NULL);
++
++  // Get .m_accounting.countBytesDirect from 0 to 3
++  const char *const chunk = "<e>";
++  assert_true(_XML_Parse_SINGLE_BYTES(parser, chunk, (int)strlen(chunk),
++                                      /*isFinal=*/XML_FALSE)
++              == XML_STATUS_OK);
++
++#if XML_GE == 1
++  // Stop activation threshold from interfering
++  assert_true(XML_SetAllocTrackerActivationThreshold(parser, 0) == XML_TRUE);
++
++  // Exceed maximum amplification: should be rejected.
++  assert_true(expat_malloc(parser, 1000, -1) == NULL);
++
++  // Increase maximum amplification, and try the same amount once more: should
++  // work.
++  assert_true(XML_SetAllocTrackerMaximumAmplification(parser, 3000.0f)
++              == XML_TRUE);
++
++  void *const ptr = expat_malloc(parser, 1000, -1);
++  assert_true(ptr != NULL);
++  expat_free(parser, ptr, -1);
++#endif
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
++START_TEST(test_alloc_tracker_threshold) {
++  XML_Parser parser = XML_ParserCreate(NULL);
++
++#if XML_GE == 1
++  // Exceed maximum amplification *before* (default) threshold: should work.
++  void *const ptr = expat_malloc(parser, 1000, -1);
++  assert_true(ptr != NULL);
++  expat_free(parser, ptr, -1);
++
++  // Exceed maximum amplification *after* threshold: should be rejected.
++  assert_true(XML_SetAllocTrackerActivationThreshold(parser, 999) == XML_TRUE);
++  assert_true(expat_malloc(parser, 1000, -1) == NULL);
++#endif
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
++START_TEST(test_alloc_tracker_getbuffer_unlimited) {
++  XML_Parser parser = XML_ParserCreate(NULL);
++
++#if XML_GE == 1
++  // Artificially lower threshold
++  assert_true(XML_SetAllocTrackerActivationThreshold(parser, 0) == XML_TRUE);
++
++  // Self-test: Prove that threshold is as rejecting as expected
++  assert_true(expat_malloc(parser, 1000, -1) == NULL);
++#endif
++  // XML_GetBuffer should be allowed to pass, though
++  assert_true(XML_GetBuffer(parser, 1000) != NULL);
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
++START_TEST(test_alloc_tracker_api) {
++  XML_Parser parserWithoutParent = XML_ParserCreate(NULL);
++  XML_Parser parserWithParent = XML_ExternalEntityParserCreate(
++      parserWithoutParent, XCS("entity123"), NULL);
++  if (parserWithoutParent == NULL)
++    fail("parserWithoutParent is NULL");
++  if (parserWithParent == NULL)
++    fail("parserWithParent is NULL");
++
++#if XML_GE == 1
++  // XML_SetAllocTrackerMaximumAmplification, error cases
++  if (XML_SetAllocTrackerMaximumAmplification(NULL, 123.0f) == XML_TRUE)
++    fail("Call with NULL parser is NOT supposed to succeed");
++  if (XML_SetAllocTrackerMaximumAmplification(parserWithParent, 123.0f)
++      == XML_TRUE)
++    fail("Call with non-root parser is NOT supposed to succeed");
++  if (XML_SetAllocTrackerMaximumAmplification(parserWithoutParent, NAN)
++      == XML_TRUE)
++    fail("Call with NaN limit is NOT supposed to succeed");
++  if (XML_SetAllocTrackerMaximumAmplification(parserWithoutParent, -1.0f)
++      == XML_TRUE)
++    fail("Call with negative limit is NOT supposed to succeed");
++  if (XML_SetAllocTrackerMaximumAmplification(parserWithoutParent, 0.9f)
++      == XML_TRUE)
++    fail("Call with positive limit <1.0 is NOT supposed to succeed");
++
++  // XML_SetAllocTrackerMaximumAmplification, success cases
++  if (XML_SetAllocTrackerMaximumAmplification(parserWithoutParent, 1.0f)
++      == XML_FALSE)
++    fail("Call with positive limit >=1.0 is supposed to succeed");
++  if (XML_SetAllocTrackerMaximumAmplification(parserWithoutParent, 123456.789f)
++      == XML_FALSE)
++    fail("Call with positive limit >=1.0 is supposed to succeed");
++  if (XML_SetAllocTrackerMaximumAmplification(parserWithoutParent, INFINITY)
++      == XML_FALSE)
++    fail("Call with positive limit >=1.0 is supposed to succeed");
++
++  // XML_SetAllocTrackerActivationThreshold, error cases
++  if (XML_SetAllocTrackerActivationThreshold(NULL, 123) == XML_TRUE)
++    fail("Call with NULL parser is NOT supposed to succeed");
++  if (XML_SetAllocTrackerActivationThreshold(parserWithParent, 123) == XML_TRUE)
++    fail("Call with non-root parser is NOT supposed to succeed");
++
++  // XML_SetAllocTrackerActivationThreshold, success cases
++  if (XML_SetAllocTrackerActivationThreshold(parserWithoutParent, 123)
++      == XML_FALSE)
++    fail("Call with non-NULL parentless parser is supposed to succeed");
++#endif // XML_GE == 1
++
++  XML_ParserFree(parserWithParent);
++  XML_ParserFree(parserWithoutParent);
++}
++END_TEST
++
++START_TEST(test_mem_api_cycle) {
++  XML_Parser parser = XML_ParserCreate(NULL);
++
++  void *ptr = XML_MemMalloc(parser, 10);
++
++  assert_true(ptr != NULL);
++  memset(ptr, 'x', 10); // assert writability, with ASan in mind
++
++  ptr = XML_MemRealloc(parser, ptr, 20);
++
++  assert_true(ptr != NULL);
++  memset(ptr, 'y', 20); // assert writability, with ASan in mind
++
++  XML_MemFree(parser, ptr);
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
++START_TEST(test_mem_api_unlimited) {
++  XML_Parser parser = XML_ParserCreate(NULL);
++
++#if XML_GE == 1
++  assert_true(XML_SetAllocTrackerActivationThreshold(parser, 0) == XML_TRUE);
++#endif
++
++  void *ptr = XML_MemMalloc(parser, 1000);
++
++  assert_true(ptr != NULL);
++
++  ptr = XML_MemRealloc(parser, ptr, 2000);
++
++  assert_true(ptr != NULL);
++
++  XML_MemFree(parser, ptr);
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
+ void
+ make_alloc_test_case(Suite *s) {
+   TCase *tc_alloc = tcase_create("allocation tests");
+@@ -2151,4 +2354,15 @@ make_alloc_test_case(Suite *s) {
+ 
+   tcase_add_test__ifdef_xml_dtd(
+       tc_alloc, test_alloc_reset_after_external_entity_parser_create_fail);
++
++  tcase_add_test__ifdef_xml_dtd(tc_alloc, test_alloc_tracker_size_recorded);
++  tcase_add_test__ifdef_xml_dtd(tc_alloc,
++                                test_alloc_tracker_maximum_amplification);
++  tcase_add_test__ifdef_xml_dtd(tc_alloc, test_alloc_tracker_threshold);
++  tcase_add_test__ifdef_xml_dtd(tc_alloc,
++                                test_alloc_tracker_getbuffer_unlimited);
++  tcase_add_test__ifdef_xml_dtd(tc_alloc, test_alloc_tracker_api);
++
++  tcase_add_test(tc_alloc, test_mem_api_cycle);
++  tcase_add_test__ifdef_xml_dtd(tc_alloc, test_mem_api_unlimited);
+ }
diff --git a/meta/recipes-core/expat/expat/CVE-2025-59375-14.patch b/meta/recipes-core/expat/expat/CVE-2025-59375-14.patch
new file mode 100644
index 00000000000..a339cc3f4b2
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2025-59375-14.patch
@@ -0,0 +1,122 @@
+From 78366891a586f293aeff60a14a55e4afe1169586 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 2 Sep 2025 16:44:00 +0200
+Subject: [PATCH] xmlwf: Wire allocation tracker config to existing arguments
+ -a and -b
+
+CVE: CVE-2025-59375
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/78366891a586f293aeff60a14a55e4afe1169586]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ doc/xmlwf.xml          | 26 ++++++++++++++++++++------
+ xmlwf/xmlwf.c          |  7 +++++--
+ xmlwf/xmlwf_helpgen.py |  4 ++--
+ 3 files changed, 27 insertions(+), 10 deletions(-)
+
+diff --git a/doc/xmlwf.xml b/doc/xmlwf.xml
+index 17e9cf51..65d8ae9b 100644
+--- a/doc/xmlwf.xml
++++ b/doc/xmlwf.xml
+@@ -158,19 +158,31 @@ supports both.
+         <listitem>
+           <para>
+             Sets the maximum tolerated amplification factor
+-            for protection against billion laughs attacks (default: 100.0).
++            for protection against amplification attacks
++            like the billion laughs attack
++            (default: 100.0
++            for the sum of direct and indirect output and also
++            for allocations of dynamic memory).
+             The amplification factor is calculated as ..
+           </para>
+           <literallayout>
+             amplification := (direct + indirect) / direct
+           </literallayout>
+           <para>
+-            .. while parsing, whereas
++            .. with regard to use of entities and ..
++          </para>
++          <literallayout>
++            amplification := allocated / direct
++          </literallayout>
++          <para>
++            .. with regard to dynamic memory while parsing.
+             &lt;direct&gt; is the number of bytes read
+-              from the primary document in parsing and
++              from the primary document in parsing,
+             &lt;indirect&gt; is the number of bytes
+               added by expanding entities and reading of external DTD files,
+-              combined.
++              combined, and
++            &lt;allocated&gt; is the total number of bytes of dynamic memory
++              allocated (and not freed) per hierarchy of parsers.
+           </para>
+           <para>
+             <emphasis>NOTE</emphasis>:
+@@ -185,8 +197,10 @@ supports both.
+         <listitem>
+           <para>
+             Sets the number of output bytes (including amplification)
+-            needed to activate protection against billion laughs attacks
+-            (default: 8 MiB).
++            needed to activate protection against amplification attacks
++            like billion laughs
++            (default: 8 MiB for the sum of direct and indirect output,
++            and 64 MiB for allocations of dynamic memory).
+             This can be thought of as an &quot;activation threshold&quot;.
+           </para>
+           <para>
+diff --git a/xmlwf/xmlwf.c b/xmlwf/xmlwf.c
+index b9d0a7fc..14206d9e 100644
+--- a/xmlwf/xmlwf.c
++++ b/xmlwf/xmlwf.c
+@@ -913,11 +913,11 @@ usage(const XML_Char *prog, int rc) {
+       T("  -t             write no XML output for [t]iming of plain parsing\n")
+       T("  -N             enable adding doctype and [n]otation declarations\n")
+       T("\n")
+-      T("billion laughs attack protection:\n")
++      T("amplification attack protection (e.g. billion laughs):\n")
+       T("  NOTE: If you ever need to increase these values for non-attack payload, please file a bug report.\n")
+       T("\n")
+       T("  -a FACTOR      set maximum tolerated [a]mplification factor (default: 100.0)\n")
+-      T("  -b BYTES       set number of output [b]ytes needed to activate (default: 8 MiB)\n")
++      T("  -b BYTES       set number of output [b]ytes needed to activate (default: 8 MiB/64 MiB)\n")
+       T("\n")
+       T("reparse deferral:\n")
+       T("  -q             disable reparse deferral, and allow [q]uadratic parse runtime with large tokens\n")
+@@ -1181,12 +1181,15 @@ tmain(int argc, XML_Char **argv) {
+ #if XML_GE == 1
+       XML_SetBillionLaughsAttackProtectionMaximumAmplification(
+           parser, attackMaximumAmplification);
++      XML_SetAllocTrackerMaximumAmplification(parser,
++                                              attackMaximumAmplification);
+ #endif
+     }
+     if (attackThresholdGiven) {
+ #if XML_GE == 1
+       XML_SetBillionLaughsAttackProtectionActivationThreshold(
+           parser, attackThresholdBytes);
++      XML_SetAllocTrackerActivationThreshold(parser, attackThresholdBytes);
+ #else
+       (void)attackThresholdBytes; // silence -Wunused-but-set-variable
+ #endif
+diff --git a/xmlwf/xmlwf_helpgen.py b/xmlwf/xmlwf_helpgen.py
+index 2360820d..e91c285c 100755
+--- a/xmlwf/xmlwf_helpgen.py
++++ b/xmlwf/xmlwf_helpgen.py
+@@ -84,13 +84,13 @@ output_mode.add_argument('-m', action='store_true', help='write [m]eta XML, not
+ output_mode.add_argument('-t', action='store_true', help='write no XML output for [t]iming of plain parsing')
+ output_related.add_argument('-N', action='store_true', help='enable adding doctype and [n]otation declarations')
+ 
+-billion_laughs = parser.add_argument_group('billion laughs attack protection',
++billion_laughs = parser.add_argument_group('amplification attack protection (e.g. billion laughs)',
+                                            description='NOTE: '
+                                                        'If you ever need to increase these values '
+                                                        'for non-attack payload, please file a bug report.')
+ billion_laughs.add_argument('-a', metavar='FACTOR',
+                             help='set maximum tolerated [a]mplification factor (default: 100.0)')
+-billion_laughs.add_argument('-b', metavar='BYTES', help='set number of output [b]ytes needed to activate (default: 8 MiB)')
++billion_laughs.add_argument('-b', metavar='BYTES', help='set number of output [b]ytes needed to activate (default: 8 MiB/64 MiB)')
+ 
+ reparse_deferral = parser.add_argument_group('reparse deferral')
+ reparse_deferral.add_argument('-q', metavar='FACTOR',
diff --git a/meta/recipes-core/expat/expat/CVE-2025-59375-15.patch b/meta/recipes-core/expat/expat/CVE-2025-59375-15.patch
new file mode 100644
index 00000000000..8d068441928
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2025-59375-15.patch
@@ -0,0 +1,70 @@
+From 5ae51be57ed0ca1e87582881d07ea9c29c4f7c05 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Wed, 3 Sep 2025 17:06:41 +0200
+Subject: [PATCH] fuzz: Be robust towards NULL return from
+ XML_ExternalEntityParserCreate
+
+CVE: CVE-2025-59375
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/5ae51be57ed0ca1e87582881d07ea9c29c4f7c05]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ fuzz/xml_parse_fuzzer.c       | 14 ++++++++------
+ fuzz/xml_parsebuffer_fuzzer.c | 14 ++++++++------
+ 2 files changed, 16 insertions(+), 12 deletions(-)
+
+diff --git a/fuzz/xml_parse_fuzzer.c b/fuzz/xml_parse_fuzzer.c
+index 90c38549..29ab33ff 100644
+--- a/fuzz/xml_parse_fuzzer.c
++++ b/fuzz/xml_parse_fuzzer.c
+@@ -89,15 +89,17 @@ LLVMFuzzerTestOneInput(const uint8_t *data, size_t size) {
+ 
+   XML_Parser externalEntityParser
+       = XML_ExternalEntityParserCreate(parentParser, "e1", NULL);
+-  assert(externalEntityParser);
+-  ParseOneInput(externalEntityParser, data, size);
+-  XML_ParserFree(externalEntityParser);
++  if (externalEntityParser != NULL) {
++    ParseOneInput(externalEntityParser, data, size);
++    XML_ParserFree(externalEntityParser);
++  }
+ 
+   XML_Parser externalDtdParser
+       = XML_ExternalEntityParserCreate(parentParser, NULL, NULL);
+-  assert(externalDtdParser);
+-  ParseOneInput(externalDtdParser, data, size);
+-  XML_ParserFree(externalDtdParser);
++  if (externalDtdParser != NULL) {
++    ParseOneInput(externalDtdParser, data, size);
++    XML_ParserFree(externalDtdParser);
++  }
+ 
+   // finally frees this parser which served as parent
+   XML_ParserFree(parentParser);
+diff --git a/fuzz/xml_parsebuffer_fuzzer.c b/fuzz/xml_parsebuffer_fuzzer.c
+index 0db67dce..38b9981b 100644
+--- a/fuzz/xml_parsebuffer_fuzzer.c
++++ b/fuzz/xml_parsebuffer_fuzzer.c
+@@ -101,15 +101,17 @@ LLVMFuzzerTestOneInput(const uint8_t *data, size_t size) {
+ 
+   XML_Parser externalEntityParser
+       = XML_ExternalEntityParserCreate(parentParser, "e1", NULL);
+-  assert(externalEntityParser);
+-  ParseOneInput(externalEntityParser, data, size);
+-  XML_ParserFree(externalEntityParser);
++  if (externalEntityParser != NULL) {
++    ParseOneInput(externalEntityParser, data, size);
++    XML_ParserFree(externalEntityParser);
++  }
+ 
+   XML_Parser externalDtdParser
+       = XML_ExternalEntityParserCreate(parentParser, NULL, NULL);
+-  assert(externalDtdParser);
+-  ParseOneInput(externalDtdParser, data, size);
+-  XML_ParserFree(externalDtdParser);
++  if (externalDtdParser != NULL) {
++    ParseOneInput(externalDtdParser, data, size);
++    XML_ParserFree(externalDtdParser);
++  }
+ 
+   // finally frees this parser which served as parent
+   XML_ParserFree(parentParser);
diff --git a/meta/recipes-core/expat/expat/CVE-2025-59375-16.patch b/meta/recipes-core/expat/expat/CVE-2025-59375-16.patch
new file mode 100644
index 00000000000..a276347d83d
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2025-59375-16.patch
@@ -0,0 +1,146 @@
+From d6246c31a1238d065b4d9690d3bac740326f6485 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Wed, 3 Sep 2025 01:28:03 +0200
+Subject: [PATCH] docs: Document the two allocation tracking API functions
+
+CVE: CVE-2025-59375
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/d6246c31a1238d065b4d9690d3bac740326f6485]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ doc/reference.html | 116 +++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 116 insertions(+)
+
+diff --git a/doc/reference.html b/doc/reference.html
+index 89476710..81da4e6c 100644
+--- a/doc/reference.html
++++ b/doc/reference.html
+@@ -157,6 +157,8 @@ interface.</p>
+       <ul>
+         <li><a href="#XML_SetBillionLaughsAttackProtectionMaximumAmplification">XML_SetBillionLaughsAttackProtectionMaximumAmplification</a></li>
+         <li><a href="#XML_SetBillionLaughsAttackProtectionActivationThreshold">XML_SetBillionLaughsAttackProtectionActivationThreshold</a></li>
++        <li><a href="#XML_SetAllocTrackerMaximumAmplification">XML_SetAllocTrackerMaximumAmplification</a></li>
++        <li><a href="#XML_SetAllocTrackerActivationThreshold">XML_SetAllocTrackerActivationThreshold</a></li>
+         <li><a href="#XML_SetReparseDeferralEnabled">XML_SetReparseDeferralEnabled</a></li>
+       </ul>
+     </li>
+@@ -2262,6 +2264,120 @@ XML_SetBillionLaughsAttackProtectionActivationThreshold(XML_Parser p,
+   </p>
+ </div>
+ 
++<h4 id="XML_SetAllocTrackerMaximumAmplification">XML_SetAllocTrackerMaximumAmplification</h4>
++<pre class="fcndec">
++/* Added in Expat 2.7.2. */
++XML_Bool
++XML_SetAllocTrackerMaximumAmplification(XML_Parser p,
++                                        float maximumAmplificationFactor);
++</pre>
++<div class="fcndef">
++  <p>
++    Sets the maximum tolerated amplification factor
++    between direct input and bytes of dynamic memory allocated
++    (default: <code>100.0</code>)
++    of parser <code>p</code> to <code>maximumAmplificationFactor</code>, and
++    returns <code>XML_TRUE</code> upon success and <code>XML_FALSE</code> upon error.
++  </p>
++
++  <p>
++    <strong>Note:</strong>
++    There are three types of allocations that intentionally bypass tracking and limiting:
++  </p>
++  <ul>
++    <li>
++      application calls to functions
++      <code><a href="#XML_MemMalloc">XML_MemMalloc</a></code>
++      and
++      <code><a href="#XML_MemRealloc">XML_MemRealloc</a></code>
++      &mdash;
++      <em>healthy</em> use of these two functions continues to be a responsibility
++      of the application using Expat
++      &mdash;,
++    </li>
++    <li>
++      the main character buffer used by functions
++      <code><a href="#XML_GetBuffer">XML_GetBuffer</a></code>
++      and
++      <code><a href="#XML_ParseBuffer">XML_ParseBuffer</a></code>
++      (and thus also by plain
++      <code><a href="#XML_Parse">XML_Parse</a></code>), and
++    </li>
++    <li>
++      the <a href="#XML_SetElementDeclHandler">content model memory</a>
++      (that is passed to the
++      <a href="#XML_SetElementDeclHandler">element declaration handler</a>
++      and freed by a call to
++      <code><a href="#XML_FreeContentModel">XML_FreeContentModel</a></code>).
++    </li>
++  </ul>
++
++  <p>The amplification factor is calculated as ..</p>
++  <pre>amplification := allocated / direct</pre>
++  <p>
++    .. while parsing, whereas
++    <code>direct</code> is the number of bytes read from the primary document in parsing and
++    <code>allocated</code> is the number of bytes of dynamic memory allocated in the parser hierarchy.
++  </p>
++
++  <p>For a call to <code>XML_SetAllocTrackerMaximumAmplification</code> to succeed:</p>
++  <ul>
++    <li>parser <code>p</code> must be a non-<code>NULL</code> root parser (without any parent parsers) and</li>
++    <li><code>maximumAmplificationFactor</code> must be non-<code>NaN</code> and greater than or equal to <code>1.0</code>.</li>
++  </ul>
++
++  <p>
++    <strong>Note:</strong>
++    If you ever need to increase this value for non-attack payload,
++    please <a href="https://github.com/libexpat/libexpat/issues">file a bug report</a>.
++  </p>
++
++  <p>
++    <strong>Note:</strong>
++    Amplifications factors greater than 100 can been observed near the start of parsing
++    even with benign files in practice.
++
++    So if you do reduce the maximum allowed amplification,
++    please make sure that the activation threshold is still big enough
++    to not end up with undesired false positives (i.e. benign files being rejected).
++  </p>
++</div>
++
++<h4 id="XML_SetAllocTrackerActivationThreshold">XML_SetAllocTrackerActivationThreshold</h4>
++<pre class="fcndec">
++/* Added in Expat 2.7.2. */
++XML_Bool
++XML_SetAllocTrackerActivationThreshold(XML_Parser p,
++                                       unsigned long long activationThresholdBytes);
++</pre>
++<div class="fcndef">
++  <p>
++    Sets number of allocated bytes of dynamic memory
++    needed to activate protection against disproportionate use of RAM
++    (default: <code>64 MiB</code>)
++    of parser <code>p</code> to <code>activationThresholdBytes</code>, and
++    returns <code>XML_TRUE</code> upon success and <code>XML_FALSE</code> upon error.
++  </p>
++
++  <p>
++    <strong>Note:</strong>
++    For types of allocations that intentionally bypass tracking and limiting, please see
++    <code><a href="#XML_SetAllocTrackerMaximumAmplification">XML_SetAllocTrackerMaximumAmplification</a></code>
++    above.
++  </p>
++
++  <p>For a call to <code>XML_SetAllocTrackerActivationThreshold</code> to succeed:</p>
++  <ul>
++    <li>parser <code>p</code> must be a non-<code>NULL</code> root parser (without any parent parsers).</li>
++  </ul>
++
++  <p>
++    <strong>Note:</strong>
++    If you ever need to increase this value for non-attack payload,
++    please <a href="https://github.com/libexpat/libexpat/issues">file a bug report</a>.
++  </p>
++</div>
++
+ <h4 id="XML_SetReparseDeferralEnabled">XML_SetReparseDeferralEnabled</h4>
+ <pre class="fcndec">
+ /* Added in Expat 2.6.0. */
diff --git a/meta/recipes-core/expat/expat/CVE-2025-59375-17.patch b/meta/recipes-core/expat/expat/CVE-2025-59375-17.patch
new file mode 100644
index 00000000000..ca0e3a34f73
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2025-59375-17.patch
@@ -0,0 +1,28 @@
+From a6a2a49367f03f5d8a73c9027b45b59953ca27d8 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Wed, 10 Sep 2025 19:52:39 +0200
+Subject: [PATCH] docs: Promote the contract to call XML_FreeContentModel
+
+.. when registering a custom element declaration handler
+(via a call to function XML_SetElementDeclHandler)
+
+CVE: CVE-2025-59375
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/a6a2a49367f03f5d8a73c9027b45b59953ca27d8]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ doc/reference.html | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/doc/reference.html b/doc/reference.html
+index 81da4e6c..564fc1b2 100644
+--- a/doc/reference.html
++++ b/doc/reference.html
+@@ -1902,7 +1902,7 @@ struct XML_cp {
+ <p>Sets a handler for element declarations in a DTD. The handler gets
+ called with the name of the element in the declaration and a pointer
+ to a structure that contains the element model. It's the user code's 
+-responsibility to free model when finished with it. See <code>
++responsibility to free model when finished with via a call to <code>
+ <a href="#XML_FreeContentModel">XML_FreeContentModel</a></code>.
+ There is no need to free the model from the handler, it can be kept
+ around and freed at a later stage.</p>
diff --git a/meta/recipes-core/expat/expat/CVE-2025-59375-18.patch b/meta/recipes-core/expat/expat/CVE-2025-59375-18.patch
new file mode 100644
index 00000000000..c29b3018254
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2025-59375-18.patch
@@ -0,0 +1,74 @@
+From a21a3a8299e1ee0b0ae5ae2886a0746d088cf135 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sun, 7 Sep 2025 16:00:35 +0200
+Subject: [PATCH] Changes: Document allocation tracking
+
+CVE: CVE-2025-59375
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/a21a3a8299e1ee0b0ae5ae2886a0746d088cf135]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ Changes | 37 +++++++++++++++++++++++++++++++++++++
+ 1 file changed, 37 insertions(+)
+
+diff --git a/Changes b/Changes
+index cb752151..ceb5c5dc 100644
+--- a/Changes
++++ b/Changes
+@@ -30,6 +30,36 @@
+ !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
+ 
+ Patches:
++        Security fixes:
++     #1018 #1034  CVE-2025-59375 -- Disallow use of disproportional amounts of
++                    dynamic memory from within an Expat parser (e.g. previously
++                    a ~250 KiB sized document was able to cause allocation of
++                    ~800 MiB from the heap, i.e. an "amplification" of factor
++                    ~3,300); once a threshold (that defaults to 64 MiB) is
++                    reached, a maximum amplification factor (that defaults to
++                    100.0) is enforced, and violating documents are rejected
++                    with an out-of-memory error.
++                    There are two new API functions to fine-tune this new
++                    behavior:
++                      - XML_SetAllocTrackerActivationThreshold
++                      - XML_SetAllocTrackerMaximumAmplification .
++                    If you ever need to increase these defaults for non-attack
++                    XML payload, please file a bug report with libexpat.
++                      There is also a new environment variable
++                    EXPAT_MALLOC_DEBUG=(0|1|2) to control the verbosity
++                    of allocations debugging at runtime, disabled by default.
++                      Known impact is (reliable and easy) denial of service:
++                    CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H/E:H/RL:O/RC:C
++                    (Base Score: 7.5, Temporal Score: 7.2)
++                    Please note that a layer of compression around XML can
++                    significantly reduce the minimum attack payload size.
++                      Distributors intending to backport (or cherry-pick) the
++                    fix need to copy 99% of the related pull request, not just
++                    the "lib: Implement tracking of dynamic memory allocations"
++                    commit, to not end up with a state that literally does both
++                    too much and too little at the same time. Appending ".diff"
++                    to the pull request URL could be of help.
++
+         Bug fixes:
+        #980 #989  Restore event pointer behavior from Expat 2.6.4
+                     (that the fix to CVE-2024-8176 changed in 2.7.0);
+@@ -39,6 +69,10 @@ Patches:
+                     - XML_GetCurrentColumnNumber
+                     - XML_GetCurrentLineNumber
+                     - XML_GetInputContext
++        #1034  docs: Promote the contract to call function
++                    XML_FreeContentModel when registering a custom
++                    element declaration handler (via a call to function
++                    XML_SetElementDeclHandler)
+ 
+         Special thanks to:
+             Berkay Eren Ürün
+@@ -71,6 +105,9 @@ Patches:
+             Linutronix
+             Red Hat
+             Siemens
++                 and
++            OSS-Fuzz / ClusterFuzz
++            Perl XML::Parser
+ 
+ Release 2.6.4 Wed November 6 2024
+         Security fixes:
diff --git a/meta/recipes-core/expat/expat/CVE-2025-59375-19.patch b/meta/recipes-core/expat/expat/CVE-2025-59375-19.patch
new file mode 100644
index 00000000000..afd4d91d03d
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2025-59375-19.patch
@@ -0,0 +1,103 @@
+From f4b5bb033dc4430bbd31dcae8a55f988360bcec5 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Wed, 17 Sep 2025 23:14:02 +0200
+Subject: [PATCH] lib: Document and regression-proof absence of integer
+ overflow from expat_realloc
+
+Matthew Fernandez (@Smattr) and I teamed up on whether function expat_realloc
+could be vulnerable to integer overflow in line:
+
+  mallocedPtr = parser->m_mem.realloc_fcn(mallocedPtr, sizeof(size_t) + size);
+                                                                      ^
+We ended up with a mathematical proof that, fortunately, the current code
+already is safe from overflow.
+
+The proof uses technique "proof by contradiction". Let's assume, there *was* a
+risk of integer overflow. For a risk of overflow, these four conditions would
+all need to be met, together:
+
+(1) `SIZE_MAX < sizeof(size_t) + size`
+    or we would not hit an overflow on `size_t`.
+
+(2) `size > prevSize`
+    or `expat_malloc` would have already not allocated earlier
+    as `expat_realloc` relies on `expat_malloc` for the initial allocation.
+
+(3) `rootParser->m_alloc_tracker.bytesAllocated >= sizeof(size_t) + prevSize`
+    or the previous allocation would be gone already or have bypassed accounting.
+    The code is not thread-safe in general, race conditions are off the table.
+
+(4) `rootParser->m_alloc_tracker.bytesAllocated + (size - prevSize) <= SIZE_MAX`
+    or `expat_heap_increase_tolerable` would have returned `false` and
+    the overflow line would not be reached.
+
+We encoded this for the Z3 Theorem Prover (https://github.com/Z3Prover/z3)
+and ended up with this document:
+
+  $ cat proof_v2.smt2
+  ; Copyright (c) 2025 Matthew Fernandez <matthew.fernandez@gmail.com>
+  ; Copyright (c) 2025 Sebastian Pipping <sebastian@pipping.org>
+  ; Licensed under the MIT license
+
+  ; (1), (2), (3), (4) form a contradiction
+
+  ; define `SIZE_MAX`
+  (declare-fun SIZE_MAX () (_ BitVec 64))
+  (assert (= SIZE_MAX #xffffffffffffffff))
+
+  ; define `sizeof(size_t)`
+  (declare-fun sizeof_size_t () (_ BitVec 64))
+  (assert (= sizeof_size_t #x0000000000000008))
+
+  ; claim we have inputs `size`, `prevSize`, and `bytesAllocated`
+  (declare-fun size () (_ BitVec 64))
+  (declare-fun prevSize () (_ BitVec 64))
+  (declare-fun bytesAllocated () (_ BitVec 64))
+
+  ; assume `SIZE_MAX - sizeof(size_t) < size` (1)
+  (assert (bvult (bvsub SIZE_MAX sizeof_size_t) size))
+
+  ; assume `bytesAllocated >= sizeof(size_t) + prevSize` (3)
+  (assert (bvuge bytesAllocated (bvadd sizeof_size_t prevSize)))
+
+  ; assume `bytesAllocated - prevSize <= SIZE_MAX - size` (4)
+  (assert (bvule (bvsub bytesAllocated prevSize) (bvsub SIZE_MAX size)))
+
+  ; assume `SIZE_MAX - sizeof(size_t) >= prevSize` (anti-overflow for 3)
+  (assert (bvuge (bvsub SIZE_MAX sizeof_size_t) prevSize))
+
+  ; prove we have a contradiction
+  (check-sat)
+
+Note that we operate on fixed-size bit vectors here, and hence had
+to transform the assertions to not allow integer overflow by themselves.
+
+Z3 confirms the contradiction, and thus the absence of integer overflow:
+
+  $ z3 -smt2 -model proof_v2.smt2
+  unsat
+
+Co-authored-by: Matthew Fernandez <matthew.fernandez@gmail.com>
+
+CVE: CVE-2025-59375
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/f4b5bb033dc4430bbd31dcae8a55f988360bcec5]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/xmlparse.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index de159493..24fd7b97 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -969,6 +969,10 @@ expat_realloc(XML_Parser parser, void *ptr, size_t size, int sourceLine) {
+     }
+   }
+ 
++  // NOTE: Integer overflow detection has already been done for us
++  //       by expat_heap_increase_tolerable(..) above
++  assert(SIZE_MAX - sizeof(size_t) >= size);
++
+   // Actually allocate
+   mallocedPtr = parser->m_mem.realloc_fcn(mallocedPtr, sizeof(size_t) + size);
+ 
diff --git a/meta/recipes-core/expat/expat/CVE-2025-59375-20.patch b/meta/recipes-core/expat/expat/CVE-2025-59375-20.patch
new file mode 100644
index 00000000000..80628f20fb9
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2025-59375-20.patch
@@ -0,0 +1,285 @@
+From faf36f806c9065bfd9f0567b01924d5e27c4911c Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Mon, 15 Sep 2025 18:05:23 +0200
+Subject: [PATCH] lib: Drop casts around malloc/realloc returns that C99 does
+ not need
+
+CVE: CVE-2025-59375
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/faf36f806c9065bfd9f0567b01924d5e27c4911c]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/xmlparse.c | 80 ++++++++++++++++++++++----------------------------
+ 1 file changed, 35 insertions(+), 45 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 6e9c6fb2..fb8ad2e7 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -1370,12 +1370,12 @@ parserCreate(const XML_Char *encodingName,
+     XML_Memory_Handling_Suite *mtemp;
+ #if XML_GE == 1
+     void *const sizeAndParser
+-        = (XML_Parser)malloc(sizeof(size_t) + sizeof(struct XML_ParserStruct));
++        = malloc(sizeof(size_t) + sizeof(struct XML_ParserStruct));
+     if (sizeAndParser != NULL) {
+       *(size_t *)sizeAndParser = sizeof(struct XML_ParserStruct);
+       parser = (XML_Parser)((char *)sizeAndParser + sizeof(size_t));
+ #else
+-    parser = (XML_Parser)malloc(sizeof(struct XML_ParserStruct));
++    parser = malloc(sizeof(struct XML_ParserStruct));
+     if (parser != NULL) {
+ #endif
+       mtemp = (XML_Memory_Handling_Suite *)&(parser->m_mem);
+@@ -1433,23 +1433,20 @@ parserCreate(const XML_Char *encodingName,
+   parser->m_bufferLim = NULL;
+ 
+   parser->m_attsSize = INIT_ATTS_SIZE;
+-  parser->m_atts
+-      = (ATTRIBUTE *)MALLOC(parser, parser->m_attsSize * sizeof(ATTRIBUTE));
++  parser->m_atts = MALLOC(parser, parser->m_attsSize * sizeof(ATTRIBUTE));
+   if (parser->m_atts == NULL) {
+     FREE(parser, parser);
+     return NULL;
+   }
+ #ifdef XML_ATTR_INFO
+-  parser->m_attInfo = (XML_AttrInfo *)MALLOC(
+-      parser, parser->m_attsSize * sizeof(XML_AttrInfo));
++  parser->m_attInfo = MALLOC(parser, parser->m_attsSize * sizeof(XML_AttrInfo));
+   if (parser->m_attInfo == NULL) {
+     FREE(parser, parser->m_atts);
+     FREE(parser, parser);
+     return NULL;
+   }
+ #endif
+-  parser->m_dataBuf
+-      = (XML_Char *)MALLOC(parser, INIT_DATA_BUF_SIZE * sizeof(XML_Char));
++  parser->m_dataBuf = MALLOC(parser, INIT_DATA_BUF_SIZE * sizeof(XML_Char));
+   if (parser->m_dataBuf == NULL) {
+     FREE(parser, parser->m_atts);
+ #ifdef XML_ATTR_INFO
+@@ -2588,7 +2585,7 @@ XML_GetBuffer(XML_Parser parser, int len) {
+       }
+       // NOTE: We are avoiding MALLOC(..) here to leave limiting
+       //       the input size to the application using Expat.
+-      newBuf = (char *)parser->m_mem.malloc_fcn(bufferSize);
++      newBuf = parser->m_mem.malloc_fcn(bufferSize);
+       if (newBuf == 0) {
+         parser->m_errorCode = XML_ERROR_NO_MEMORY;
+         return NULL;
+@@ -3133,7 +3130,7 @@ storeRawNames(XML_Parser parser) {
+       return XML_FALSE;
+     bufSize = nameLen + (int)rawNameLen;
+     if (bufSize > tag->bufEnd - tag->buf) {
+-      char *temp = (char *)REALLOC(parser, tag->buf, bufSize);
++      char *temp = REALLOC(parser, tag->buf, bufSize);
+       if (temp == NULL)
+         return XML_FALSE;
+       /* if tag->name.str points to tag->buf (only when namespace
+@@ -3459,10 +3456,10 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+         tag = parser->m_freeTagList;
+         parser->m_freeTagList = parser->m_freeTagList->parent;
+       } else {
+-        tag = (TAG *)MALLOC(parser, sizeof(TAG));
++        tag = MALLOC(parser, sizeof(TAG));
+         if (! tag)
+           return XML_ERROR_NO_MEMORY;
+-        tag->buf = (char *)MALLOC(parser, INIT_TAG_BUF_SIZE);
++        tag->buf = MALLOC(parser, INIT_TAG_BUF_SIZE);
+         if (! tag->buf) {
+           FREE(parser, tag);
+           return XML_ERROR_NO_MEMORY;
+@@ -3495,7 +3492,7 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+           }
+           bufSize = (int)(tag->bufEnd - tag->buf) << 1;
+           {
+-            char *temp = (char *)REALLOC(parser, tag->buf, bufSize);
++            char *temp = REALLOC(parser, tag->buf, bufSize);
+             if (temp == NULL)
+               return XML_ERROR_NO_MEMORY;
+             tag->buf = temp;
+@@ -3874,8 +3871,8 @@ storeAtts(XML_Parser parser, const ENCODING *enc, const char *attStr,
+     }
+ #endif
+ 
+-    temp = (ATTRIBUTE *)REALLOC(parser, (void *)parser->m_atts,
+-                                parser->m_attsSize * sizeof(ATTRIBUTE));
++    temp = REALLOC(parser, (void *)parser->m_atts,
++                   parser->m_attsSize * sizeof(ATTRIBUTE));
+     if (temp == NULL) {
+       parser->m_attsSize = oldAttsSize;
+       return XML_ERROR_NO_MEMORY;
+@@ -3893,8 +3890,8 @@ storeAtts(XML_Parser parser, const ENCODING *enc, const char *attStr,
+     }
+ #  endif
+ 
+-    temp2 = (XML_AttrInfo *)REALLOC(parser, (void *)parser->m_attInfo,
+-                                    parser->m_attsSize * sizeof(XML_AttrInfo));
++    temp2 = REALLOC(parser, (void *)parser->m_attInfo,
++                    parser->m_attsSize * sizeof(XML_AttrInfo));
+     if (temp2 == NULL) {
+       parser->m_attsSize = oldAttsSize;
+       return XML_ERROR_NO_MEMORY;
+@@ -4070,8 +4067,7 @@ storeAtts(XML_Parser parser, const ENCODING *enc, const char *attStr,
+       }
+ #endif
+ 
+-      temp = (NS_ATT *)REALLOC(parser, parser->m_nsAtts,
+-                               nsAttsSize * sizeof(NS_ATT));
++      temp = REALLOC(parser, parser->m_nsAtts, nsAttsSize * sizeof(NS_ATT));
+       if (! temp) {
+         /* Restore actual size of memory in m_nsAtts */
+         parser->m_nsAttsPower = oldNsAttsPower;
+@@ -4252,7 +4248,7 @@ storeAtts(XML_Parser parser, const ENCODING *enc, const char *attStr,
+     }
+ #endif
+ 
+-    uri = (XML_Char *)MALLOC(parser, (n + EXPAND_SPARE) * sizeof(XML_Char));
++    uri = MALLOC(parser, (n + EXPAND_SPARE) * sizeof(XML_Char));
+     if (! uri)
+       return XML_ERROR_NO_MEMORY;
+     binding->uriAlloc = n + EXPAND_SPARE;
+@@ -4498,8 +4494,8 @@ addBinding(XML_Parser parser, PREFIX *prefix, const ATTRIBUTE_ID *attId,
+       }
+ #endif
+ 
+-      XML_Char *temp = (XML_Char *)REALLOC(
+-          parser, b->uri, sizeof(XML_Char) * (len + EXPAND_SPARE));
++      XML_Char *temp
++          = REALLOC(parser, b->uri, sizeof(XML_Char) * (len + EXPAND_SPARE));
+       if (temp == NULL)
+         return XML_ERROR_NO_MEMORY;
+       b->uri = temp;
+@@ -4507,7 +4503,7 @@ addBinding(XML_Parser parser, PREFIX *prefix, const ATTRIBUTE_ID *attId,
+     }
+     parser->m_freeBindingList = b->nextTagBinding;
+   } else {
+-    b = (BINDING *)MALLOC(parser, sizeof(BINDING));
++    b = MALLOC(parser, sizeof(BINDING));
+     if (! b)
+       return XML_ERROR_NO_MEMORY;
+ 
+@@ -4525,8 +4521,7 @@ addBinding(XML_Parser parser, PREFIX *prefix, const ATTRIBUTE_ID *attId,
+     }
+ #endif
+ 
+-    b->uri
+-        = (XML_Char *)MALLOC(parser, sizeof(XML_Char) * (len + EXPAND_SPARE));
++    b->uri = MALLOC(parser, sizeof(XML_Char) * (len + EXPAND_SPARE));
+     if (! b->uri) {
+       FREE(parser, b);
+       return XML_ERROR_NO_MEMORY;
+@@ -5897,7 +5892,7 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+               return XML_ERROR_NO_MEMORY;
+             }
+ 
+-            char *const new_connector = (char *)REALLOC(
++            char *const new_connector = REALLOC(
+                 parser, parser->m_groupConnector, parser->m_groupSize *= 2);
+             if (new_connector == NULL) {
+               parser->m_groupSize /= 2;
+@@ -5917,15 +5912,14 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+             }
+ #endif
+ 
+-            int *const new_scaff_index = (int *)REALLOC(
++            int *const new_scaff_index = REALLOC(
+                 parser, dtd->scaffIndex, parser->m_groupSize * sizeof(int));
+             if (new_scaff_index == NULL)
+               return XML_ERROR_NO_MEMORY;
+             dtd->scaffIndex = new_scaff_index;
+           }
+         } else {
+-          parser->m_groupConnector
+-              = (char *)MALLOC(parser, parser->m_groupSize = 32);
++          parser->m_groupConnector = MALLOC(parser, parser->m_groupSize = 32);
+           if (! parser->m_groupConnector) {
+             parser->m_groupSize = 0;
+             return XML_ERROR_NO_MEMORY;
+@@ -6086,8 +6080,7 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+           //       applications that are not using XML_FreeContentModel but
+           //       plain free(..) or .free_fcn() to free the content model's
+           //       memory are safe.
+-          XML_Content *content
+-              = (XML_Content *)parser->m_mem.malloc_fcn(sizeof(XML_Content));
++          XML_Content *content = parser->m_mem.malloc_fcn(sizeof(XML_Content));
+           if (! content)
+             return XML_ERROR_NO_MEMORY;
+           content->quant = XML_CQUANT_NONE;
+@@ -6364,8 +6357,7 @@ processEntity(XML_Parser parser, ENTITY *entity, XML_Bool betweenDecl,
+     openEntity = *freeEntityList;
+     *freeEntityList = openEntity->next;
+   } else {
+-    openEntity
+-        = (OPEN_INTERNAL_ENTITY *)MALLOC(parser, sizeof(OPEN_INTERNAL_ENTITY));
++    openEntity = MALLOC(parser, sizeof(OPEN_INTERNAL_ENTITY));
+     if (! openEntity)
+       return XML_ERROR_NO_MEMORY;
+   }
+@@ -7164,8 +7156,8 @@ defineAttribute(ELEMENT_TYPE *type, ATTRIBUTE_ID *attId, XML_Bool isCdata,
+   if (type->nDefaultAtts == type->allocDefaultAtts) {
+     if (type->allocDefaultAtts == 0) {
+       type->allocDefaultAtts = 8;
+-      type->defaultAtts = (DEFAULT_ATTRIBUTE *)MALLOC(
+-          parser, type->allocDefaultAtts * sizeof(DEFAULT_ATTRIBUTE));
++      type->defaultAtts
++          = MALLOC(parser, type->allocDefaultAtts * sizeof(DEFAULT_ATTRIBUTE));
+       if (! type->defaultAtts) {
+         type->allocDefaultAtts = 0;
+         return 0;
+@@ -7190,8 +7182,8 @@ defineAttribute(ELEMENT_TYPE *type, ATTRIBUTE_ID *attId, XML_Bool isCdata,
+       }
+ #endif
+ 
+-      temp = (DEFAULT_ATTRIBUTE *)REALLOC(parser, type->defaultAtts,
+-                                          (count * sizeof(DEFAULT_ATTRIBUTE)));
++      temp = REALLOC(parser, type->defaultAtts,
++                     (count * sizeof(DEFAULT_ATTRIBUTE)));
+       if (temp == NULL)
+         return 0;
+       type->allocDefaultAtts = count;
+@@ -8145,8 +8137,7 @@ poolGrow(STRING_POOL *pool) {
+     if (bytesToAllocate == 0)
+       return XML_FALSE;
+ 
+-    temp = (BLOCK *)REALLOC(pool->parser, pool->blocks,
+-                            (unsigned)bytesToAllocate);
++    temp = REALLOC(pool->parser, pool->blocks, (unsigned)bytesToAllocate);
+     if (temp == NULL)
+       return XML_FALSE;
+     pool->blocks = temp;
+@@ -8217,7 +8208,7 @@ nextScaffoldPart(XML_Parser parser) {
+       return -1;
+     }
+ #endif
+-    dtd->scaffIndex = (int *)MALLOC(parser, parser->m_groupSize * sizeof(int));
++    dtd->scaffIndex = MALLOC(parser, parser->m_groupSize * sizeof(int));
+     if (! dtd->scaffIndex)
+       return -1;
+     dtd->scaffIndex[0] = 0;
+@@ -8240,14 +8231,13 @@ nextScaffoldPart(XML_Parser parser) {
+       }
+ #endif
+ 
+-      temp = (CONTENT_SCAFFOLD *)REALLOC(
+-          parser, dtd->scaffold, dtd->scaffSize * 2 * sizeof(CONTENT_SCAFFOLD));
++      temp = REALLOC(parser, dtd->scaffold,
++                     dtd->scaffSize * 2 * sizeof(CONTENT_SCAFFOLD));
+       if (temp == NULL)
+         return -1;
+       dtd->scaffSize *= 2;
+     } else {
+-      temp = (CONTENT_SCAFFOLD *)MALLOC(parser, INIT_SCAFFOLD_ELEMENTS
+-                                                    * sizeof(CONTENT_SCAFFOLD));
++      temp = MALLOC(parser, INIT_SCAFFOLD_ELEMENTS * sizeof(CONTENT_SCAFFOLD));
+       if (temp == NULL)
+         return -1;
+       dtd->scaffSize = INIT_SCAFFOLD_ELEMENTS;
+@@ -8304,7 +8294,7 @@ build_model(XML_Parser parser) {
+   // NOTE: We are avoiding MALLOC(..) here to so that
+   //       applications that are not using XML_FreeContentModel but plain
+   //       free(..) or .free_fcn() to free the content model's memory are safe.
+-  ret = (XML_Content *)parser->m_mem.malloc_fcn(allocsize);
++  ret = parser->m_mem.malloc_fcn(allocsize);
+   if (! ret)
+     return NULL;
+ 
diff --git a/meta/recipes-core/expat/expat/CVE-2025-59375-21.patch b/meta/recipes-core/expat/expat/CVE-2025-59375-21.patch
new file mode 100644
index 00000000000..38bc0d1dd8b
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2025-59375-21.patch
@@ -0,0 +1,196 @@
+From 4b43b8dacc96fd538254e17a69abc9745c3a2ed4 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Fri, 19 Sep 2025 23:32:46 +0200
+Subject: [PATCH] lib: Fix alignment of internal allocations for some non-amd64
+ architectures
+
+sparc32 is known to be affected.
+
+CVE: CVE-2025-59375
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/4b43b8dacc96fd538254e17a69abc9745c3a2ed4]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/internal.h      |  6 ++++++
+ lib/xmlparse.c      | 38 ++++++++++++++++++++++----------------
+ tests/alloc_tests.c | 13 ++++++++++---
+ 3 files changed, 38 insertions(+), 19 deletions(-)
+
+diff --git a/lib/internal.h b/lib/internal.h
+index 6e087858..8f5edf48 100644
+--- a/lib/internal.h
++++ b/lib/internal.h
+@@ -108,6 +108,7 @@
+ #endif
+ 
+ #include <limits.h> // ULONG_MAX
++#include <stddef.h> // size_t
+ 
+ #if defined(_WIN32)                                                            \
+     && (! defined(__USE_MINGW_ANSI_STDIO)                                      \
+@@ -150,6 +151,11 @@
+ #define EXPAT_ALLOC_TRACKER_ACTIVATION_THRESHOLD_DEFAULT                       \
+   67108864 // 64 MiB, 2^26
+ 
++// NOTE: If function expat_alloc was user facing, EXPAT_MALLOC_ALIGNMENT would
++//       have to take sizeof(long double) into account
++#define EXPAT_MALLOC_ALIGNMENT sizeof(long long) // largest parser (sub)member
++#define EXPAT_MALLOC_PADDING ((EXPAT_MALLOC_ALIGNMENT) - sizeof(size_t))
++
+ /* NOTE END */
+ 
+ #include "expat.h" // so we can use type XML_Parser below
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 24fd7b97..ce29ab6f 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -850,14 +850,14 @@ static void *
+ #  endif
+ expat_malloc(XML_Parser parser, size_t size, int sourceLine) {
+   // Detect integer overflow
+-  if (SIZE_MAX - size < sizeof(size_t)) {
++  if (SIZE_MAX - size < sizeof(size_t) + EXPAT_MALLOC_PADDING) {
+     return NULL;
+   }
+ 
+   const XML_Parser rootParser = getRootParserOf(parser, NULL);
+   assert(rootParser->m_parentParser == NULL);
+ 
+-  const size_t bytesToAllocate = sizeof(size_t) + size;
++  const size_t bytesToAllocate = sizeof(size_t) + EXPAT_MALLOC_PADDING + size;
+ 
+   if ((XmlBigCount)-1 - rootParser->m_alloc_tracker.bytesAllocated
+       < bytesToAllocate) {
+@@ -894,7 +894,7 @@ expat_malloc(XML_Parser parser, size_t size, int sourceLine) {
+                     rootParser->m_alloc_tracker.peakBytesAllocated, sourceLine);
+   }
+ 
+-  return (char *)mallocedPtr + sizeof(size_t);
++  return (char *)mallocedPtr + sizeof(size_t) + EXPAT_MALLOC_PADDING;
+ }
+ 
+ #  if defined(XML_TESTING)
+@@ -914,8 +914,9 @@ expat_free(XML_Parser parser, void *ptr, int sourceLine) {
+ 
+   // Extract size (to the eyes of malloc_fcn/realloc_fcn) and
+   // the original pointer returned by malloc/realloc
+-  void *const mallocedPtr = (char *)ptr - sizeof(size_t);
+-  const size_t bytesAllocated = sizeof(size_t) + *(size_t *)mallocedPtr;
++  void *const mallocedPtr = (char *)ptr - EXPAT_MALLOC_PADDING - sizeof(size_t);
++  const size_t bytesAllocated
++      = sizeof(size_t) + EXPAT_MALLOC_PADDING + *(size_t *)mallocedPtr;
+ 
+   // Update accounting
+   assert(rootParser->m_alloc_tracker.bytesAllocated >= bytesAllocated);
+@@ -954,7 +955,7 @@ expat_realloc(XML_Parser parser, void *ptr, size_t size, int sourceLine) {
+ 
+   // Extract original size (to the eyes of the caller) and the original
+   // pointer returned by malloc/realloc
+-  void *mallocedPtr = (char *)ptr - sizeof(size_t);
++  void *mallocedPtr = (char *)ptr - EXPAT_MALLOC_PADDING - sizeof(size_t);
+   const size_t prevSize = *(size_t *)mallocedPtr;
+ 
+   // Classify upcoming change
+@@ -971,10 +972,11 @@ expat_realloc(XML_Parser parser, void *ptr, size_t size, int sourceLine) {
+ 
+   // NOTE: Integer overflow detection has already been done for us
+   //       by expat_heap_increase_tolerable(..) above
+-  assert(SIZE_MAX - sizeof(size_t) >= size);
++  assert(SIZE_MAX - sizeof(size_t) - EXPAT_MALLOC_PADDING >= size);
+ 
+   // Actually allocate
+-  mallocedPtr = parser->m_mem.realloc_fcn(mallocedPtr, sizeof(size_t) + size);
++  mallocedPtr = parser->m_mem.realloc_fcn(
++      mallocedPtr, sizeof(size_t) + EXPAT_MALLOC_PADDING + size);
+ 
+   if (mallocedPtr == NULL) {
+     return NULL;
+@@ -1005,7 +1007,7 @@ expat_realloc(XML_Parser parser, void *ptr, size_t size, int sourceLine) {
+   // Update in-block recorded size
+   *(size_t *)mallocedPtr = size;
+ 
+-  return (char *)mallocedPtr + sizeof(size_t);
++  return (char *)mallocedPtr + sizeof(size_t) + EXPAT_MALLOC_PADDING;
+ }
+ #endif // XML_GE == 1
+ 
+@@ -1337,7 +1339,8 @@ parserCreate(const XML_Char *encodingName,
+   XML_Parser parser = NULL;
+ 
+ #if XML_GE == 1
+-  const size_t increase = sizeof(size_t) + sizeof(struct XML_ParserStruct);
++  const size_t increase
++      = sizeof(size_t) + EXPAT_MALLOC_PADDING + sizeof(struct XML_ParserStruct);
+ 
+   if (parentParser != NULL) {
+     const XML_Parser rootParser = getRootParserOf(parentParser, NULL);
+@@ -1352,11 +1355,13 @@ parserCreate(const XML_Char *encodingName,
+   if (memsuite) {
+     XML_Memory_Handling_Suite *mtemp;
+ #if XML_GE == 1
+-    void *const sizeAndParser = memsuite->malloc_fcn(
+-        sizeof(size_t) + sizeof(struct XML_ParserStruct));
++    void *const sizeAndParser
++        = memsuite->malloc_fcn(sizeof(size_t) + EXPAT_MALLOC_PADDING
++                               + sizeof(struct XML_ParserStruct));
+     if (sizeAndParser != NULL) {
+       *(size_t *)sizeAndParser = sizeof(struct XML_ParserStruct);
+-      parser = (XML_Parser)((char *)sizeAndParser + sizeof(size_t));
++      parser = (XML_Parser)((char *)sizeAndParser + sizeof(size_t)
++                            + EXPAT_MALLOC_PADDING);
+ #else
+     parser = memsuite->malloc_fcn(sizeof(struct XML_ParserStruct));
+     if (parser != NULL) {
+@@ -1369,11 +1374,12 @@ parserCreate(const XML_Char *encodingName,
+   } else {
+     XML_Memory_Handling_Suite *mtemp;
+ #if XML_GE == 1
+-    void *const sizeAndParser
+-        = malloc(sizeof(size_t) + sizeof(struct XML_ParserStruct));
++    void *const sizeAndParser = malloc(sizeof(size_t) + EXPAT_MALLOC_PADDING
++                                       + sizeof(struct XML_ParserStruct));
+     if (sizeAndParser != NULL) {
+       *(size_t *)sizeAndParser = sizeof(struct XML_ParserStruct);
+-      parser = (XML_Parser)((char *)sizeAndParser + sizeof(size_t));
++      parser = (XML_Parser)((char *)sizeAndParser + sizeof(size_t)
++                            + EXPAT_MALLOC_PADDING);
+ #else
+     parser = malloc(sizeof(struct XML_ParserStruct));
+     if (parser != NULL) {
+diff --git a/tests/alloc_tests.c b/tests/alloc_tests.c
+index 644a4952..dabdf0da 100644
+--- a/tests/alloc_tests.c
++++ b/tests/alloc_tests.c
+@@ -2091,6 +2091,13 @@ START_TEST(test_alloc_reset_after_external_entity_parser_create_fail) {
+ }
+ END_TEST
+ 
++#if XML_GE == 1
++static size_t
++sizeRecordedFor(void *ptr) {
++  return *(size_t *)((char *)ptr - EXPAT_MALLOC_PADDING - sizeof(size_t));
++}
++#endif // XML_GE == 1
++
+ START_TEST(test_alloc_tracker_size_recorded) {
+   XML_Memory_Handling_Suite memsuite = {malloc, realloc, free};
+ 
+@@ -2106,16 +2113,16 @@ START_TEST(test_alloc_tracker_size_recorded) {
+     void *ptr = expat_malloc(parser, 10, -1);
+ 
+     assert_true(ptr != NULL);
+-    assert_true(*((size_t *)ptr - 1) == 10);
++    assert_true(sizeRecordedFor(ptr) == 10);
+ 
+     assert_true(expat_realloc(parser, ptr, SIZE_MAX / 2, -1) == NULL);
+ 
+-    assert_true(*((size_t *)ptr - 1) == 10); // i.e. unchanged
++    assert_true(sizeRecordedFor(ptr) == 10); // i.e. unchanged
+ 
+     ptr = expat_realloc(parser, ptr, 20, -1);
+ 
+     assert_true(ptr != NULL);
+-    assert_true(*((size_t *)ptr - 1) == 20);
++    assert_true(sizeRecordedFor(ptr) == 20);
+ 
+     expat_free(parser, ptr, -1);
+ #endif
diff --git a/meta/recipes-core/expat/expat/CVE-2025-59375-22.patch b/meta/recipes-core/expat/expat/CVE-2025-59375-22.patch
new file mode 100644
index 00000000000..9716be80841
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2025-59375-22.patch
@@ -0,0 +1,37 @@
+From 5cc0010ad93868ec03248e4ac814272bc7d607bc Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Fri, 19 Sep 2025 22:50:54 +0200
+Subject: [PATCH] tests: Fix test guard for test related to allocation tracking
+
+CVE: CVE-2025-59375
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/5cc0010ad93868ec03248e4ac814272bc7d607bc]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ tests/alloc_tests.c | 14 ++++++--------
+ 1 file changed, 6 insertions(+), 8 deletions(-)
+
+diff --git a/tests/alloc_tests.c b/tests/alloc_tests.c
+index dabdf0da..045447b0 100644
+--- a/tests/alloc_tests.c
++++ b/tests/alloc_tests.c
+@@ -2362,14 +2362,12 @@ make_alloc_test_case(Suite *s) {
+   tcase_add_test__ifdef_xml_dtd(
+       tc_alloc, test_alloc_reset_after_external_entity_parser_create_fail);
+ 
+-  tcase_add_test__ifdef_xml_dtd(tc_alloc, test_alloc_tracker_size_recorded);
+-  tcase_add_test__ifdef_xml_dtd(tc_alloc,
+-                                test_alloc_tracker_maximum_amplification);
+-  tcase_add_test__ifdef_xml_dtd(tc_alloc, test_alloc_tracker_threshold);
+-  tcase_add_test__ifdef_xml_dtd(tc_alloc,
+-                                test_alloc_tracker_getbuffer_unlimited);
+-  tcase_add_test__ifdef_xml_dtd(tc_alloc, test_alloc_tracker_api);
++  tcase_add_test__if_xml_ge(tc_alloc, test_alloc_tracker_size_recorded);
++  tcase_add_test__if_xml_ge(tc_alloc, test_alloc_tracker_maximum_amplification);
++  tcase_add_test__if_xml_ge(tc_alloc, test_alloc_tracker_threshold);
++  tcase_add_test__if_xml_ge(tc_alloc, test_alloc_tracker_getbuffer_unlimited);
++  tcase_add_test__if_xml_ge(tc_alloc, test_alloc_tracker_api);
+ 
+   tcase_add_test(tc_alloc, test_mem_api_cycle);
+-  tcase_add_test__ifdef_xml_dtd(tc_alloc, test_mem_api_unlimited);
++  tcase_add_test__if_xml_ge(tc_alloc, test_mem_api_unlimited);
+ }
diff --git a/meta/recipes-core/expat/expat/CVE-2025-59375-23.patch b/meta/recipes-core/expat/expat/CVE-2025-59375-23.patch
new file mode 100644
index 00000000000..60327df22b7
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2025-59375-23.patch
@@ -0,0 +1,47 @@
+From 343594dc344e543acb7478d1283b50b299a1c110 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Fri, 19 Sep 2025 22:46:01 +0200
+Subject: [PATCH] tests: Add new test test_alloc_tracker_pointer_alignment
+
+CVE: CVE-2025-59375
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/343594dc344e543acb7478d1283b50b299a1c110]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ tests/alloc_tests.c | 17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+
+diff --git a/tests/alloc_tests.c b/tests/alloc_tests.c
+index 045447b0..5ae6c6a7 100644
+--- a/tests/alloc_tests.c
++++ b/tests/alloc_tests.c
+@@ -2132,6 +2132,22 @@ START_TEST(test_alloc_tracker_size_recorded) {
+ }
+ END_TEST
+ 
++START_TEST(test_alloc_tracker_pointer_alignment) {
++  XML_Parser parser = XML_ParserCreate(NULL);
++#if XML_GE == 1
++  assert_true(sizeof(long long) >= sizeof(size_t)); // self-test
++  long long *const ptr
++      = (long long *)expat_malloc(parser, 4 * sizeof(long long), -1);
++  ptr[0] = 0LL;
++  ptr[1] = 1LL;
++  ptr[2] = 2LL;
++  ptr[3] = 3LL;
++  expat_free(parser, ptr, -1);
++#endif
++  XML_ParserFree(parser);
++}
++END_TEST
++
+ START_TEST(test_alloc_tracker_maximum_amplification) {
+   if (g_reparseDeferralEnabledDefault == XML_TRUE) {
+     return;
+@@ -2363,6 +2379,7 @@ make_alloc_test_case(Suite *s) {
+       tc_alloc, test_alloc_reset_after_external_entity_parser_create_fail);
+ 
+   tcase_add_test__if_xml_ge(tc_alloc, test_alloc_tracker_size_recorded);
++  tcase_add_test__if_xml_ge(tc_alloc, test_alloc_tracker_pointer_alignment);
+   tcase_add_test__if_xml_ge(tc_alloc, test_alloc_tracker_maximum_amplification);
+   tcase_add_test__if_xml_ge(tc_alloc, test_alloc_tracker_threshold);
+   tcase_add_test__if_xml_ge(tc_alloc, test_alloc_tracker_getbuffer_unlimited);
diff --git a/meta/recipes-core/expat/expat/CVE-2025-59375-24.patch b/meta/recipes-core/expat/expat/CVE-2025-59375-24.patch
new file mode 100644
index 00000000000..e51b2bb3277
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2025-59375-24.patch
@@ -0,0 +1,36 @@
+From 6fe5df59a1229ca647d365a0e3a7e17fee4d4548 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Fri, 19 Sep 2025 23:49:18 +0200
+Subject: [PATCH] Changes: Document pull request #1047
+
+CVE: CVE-2025-59375
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/6fe5df59a1229ca647d365a0e3a7e17fee4d4548]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ Changes | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/Changes b/Changes
+index 706a4ae1..58c222d9 100644
+--- a/Changes
++++ b/Changes
+@@ -61,6 +61,9 @@ Patches:
+                     to the pull request URL could be of help.
+ 
+         Bug fixes:
++     #1046 #1047  Fix alignment of internal allocations for some non-amd64
++                    architectures (e.g. sparc32); fixes up on the fix to
++                    CVE-2025-59375 in release 2.7.2 from #1034
+        #980 #989  Restore event pointer behavior from Expat 2.6.4
+                     (that the fix to CVE-2024-8176 changed in 2.7.0);
+                     affected API functions are:
+@@ -76,7 +79,9 @@ Patches:
+ 
+         Special thanks to:
+             Berkay Eren Ürün
++            Rolf Eike Beer
+                  and
++            Clang/GCC UndefinedBehaviorSanitizer
+             Perl XML::Parser
+ 
+         Security fixes:
diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/expat/expat_2.6.4.bb
index 816beaa8a3d..1d2d818ecf7 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -16,6 +16,31 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2024-8176-03.patch \
            file://CVE-2024-8176-04.patch \
            file://CVE-2024-8176-05.patch \
+           file://CVE-2025-59375-00.patch \
+           file://CVE-2025-59375-01.patch \
+           file://CVE-2025-59375-02.patch \
+           file://CVE-2025-59375-03.patch \
+           file://CVE-2025-59375-04.patch \
+           file://CVE-2025-59375-05.patch \
+           file://CVE-2025-59375-06.patch \
+           file://CVE-2025-59375-07.patch \
+           file://CVE-2025-59375-08.patch \
+           file://CVE-2025-59375-09.patch \
+           file://CVE-2025-59375-10.patch \
+           file://CVE-2025-59375-11.patch \
+           file://CVE-2025-59375-12.patch \
+           file://CVE-2025-59375-13.patch \
+           file://CVE-2025-59375-14.patch \
+           file://CVE-2025-59375-15.patch \
+           file://CVE-2025-59375-16.patch \
+           file://CVE-2025-59375-17.patch \
+           file://CVE-2025-59375-18.patch \
+           file://CVE-2025-59375-19.patch \
+           file://CVE-2025-59375-20.patch \
+           file://CVE-2025-59375-21.patch \
+           file://CVE-2025-59375-22.patch \
+           file://CVE-2025-59375-23.patch \
+           file://CVE-2025-59375-24.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"


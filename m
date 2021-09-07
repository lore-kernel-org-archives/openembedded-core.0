Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web12.254.1631025895032570012
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Sep 2021 07:44:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=lBcSg4NJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.50, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f50.google.com with SMTP id g66-20020a9d12c8000000b0051aeba607f1so13020423otg.11
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Sep 2021 07:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5W1ZfRy+0h2MYJZKwXVoEA7qmgWbIT3em627vw9k7yM=;
        b=lBcSg4NJJE/DUDt+VoHRkWDPSXVIZqbemqtdrr7uk/NVEezSNAnng42k7uXcN9+PPX
         ZDNd9SxVGF3iHr4/4j4C+QHJJmr6s4An9ylMQNgjOccqwZytVwUPYRXHqpo+Zy1pJz0/
         m72L32G8jWbG0VcEM5NXrZK7w6MBsRN+4bqEDxbPyMrnipAt1e4tAW+5N/QTYyeYYvDG
         V3i3mbuOWi6aiIiGvkEMZoYb602DKTLpEddeoGm/johngDOO/CvAvd+MPD1exM+3+gNS
         8pVj1Hc+Cy2T/8u91KQFexnm/DvnOX4LLh3Abuu9ovftGbBLDMi9AoGMCmTpzhc5sA2h
         9odg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5W1ZfRy+0h2MYJZKwXVoEA7qmgWbIT3em627vw9k7yM=;
        b=DNui/cR7dOtHioWOvxaeGWh/Haf6lXNWadMCqQnCl38b4jMM+FktpgBlduTyYPmszU
         z6mD0GZ3KNiTkqornmo0NqUREmPXfp6oWhYUOTINYTsEJCZN8rCAlyg7KZPjvLay4BWw
         gHsaPIp6n0i9ujetb86KPOPpuud37rMPZ7YsrO6qaayy1+DuFZmzIX0P/qZfhXfZG4xB
         C/H9UtLgn159TN+0HNwux/qov5omK6iw4eXDkgQzWR4DXPq7zTxRIx7WESF7rzluEjnS
         GqgQge3k0dYwvoXVUR9mPTsmG69noB+ZEhL8bWSi0h0sJWZ/gak+dXkgBfwIQkYYjBsm
         5dpQ==
X-Gm-Message-State: AOAM531R4q94VgtUlHwyYM0l7SgUcCpufxdsRN4Mdf3IVGynweHUEBDf
	xSYvgK0QZnC8v70UaYJz7E7gDoma1+crASEY
X-Google-Smtp-Source: ABdhPJzfeh/o2G/7G6Ma8pANrTGtEMWNetMrmzXTUM2cCoPMYyrOR1iVyw+8RJ38LYvXv9LHQ8Ynbg==
X-Received: by 2002:a05:6830:1009:: with SMTP id a9mr15457885otp.220.1631025889855;
        Tue, 07 Sep 2021 07:44:49 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id q22sm1313761oof.14.2021.09.07.07.44.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 07:44:49 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/5] lighttpd: Add patch for reuse large memory chunks
Date: Tue,  7 Sep 2021 04:44:06 -1000
Message-Id: <ec8765b68f6e6695060fe8289d1ddd3b54f333a3.1631025627.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1631025627.git.steve@sakoman.com>
References: <cover.1631025627.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Purushottam Choudhary <purushottamchoudhary29@gmail.com>

Added 0001-core-reuse-large-mem-chunks-fix-mem-usage-fixes-3033.patch
to fix large memory usage for large file downloads
from dynamic backends reuse or release large memory chunks.

Also, added patch to set default chunk size 8k earlier it was 4k.

This issue is caused by a bug in the lighttpd 1.4.55 version and
has been fixed in lighttpd 1.4.58. Hence, it is not needed for
master and hardknott branch because lighttpd has 1.4.59 version.

Link: https://redmine.lighttpd.net/projects/lighttpd/repository/14/revisions/7ba521ffb4959f6f74a609d5d4acafc29a038337
Link: https://git.lighttpd.net/lighttpd/lighttpd1.4/commit/304e46d4f808c46cbb025edfacf2913a30ce8855

Signed-off-by: Purushottam Choudhary <purushottamchoudhary29@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...or-pcre-dependency-instead-of-config.patch |  10 +-
 ...-mem-chunks-fix-mem-usage-fixes-3033.patch | 224 ++++++++++++++++++
 .../lighttpd/default-chunk-size-8k.patch      |  35 +++
 .../lighttpd/lighttpd_1.4.55.bb               |   2 +
 4 files changed, 265 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-extended/lighttpd/lighttpd/0001-core-reuse-large-mem-chunks-fix-mem-usage-fixes-3033.patch
 create mode 100644 meta/recipes-extended/lighttpd/lighttpd/default-chunk-size-8k.patch

diff --git a/meta/recipes-extended/lighttpd/lighttpd/0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch b/meta/recipes-extended/lighttpd/lighttpd/0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch
index f17bdce2c0..44b9136b05 100644
--- a/meta/recipes-extended/lighttpd/lighttpd/0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch
+++ b/meta/recipes-extended/lighttpd/lighttpd/0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch
@@ -1,4 +1,4 @@
-From 22afc5d9aaa215c3c87ba21c77d47da44ab3b113 Mon Sep 17 00:00:00 2001
+From f918d5ba6ff1d439822be063237aea2705ea27b8 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 26 Aug 2016 18:20:32 +0300
 Subject: [PATCH] Use pkg-config for pcre dependency instead of -config script.
@@ -6,15 +6,16 @@ Subject: [PATCH] Use pkg-config for pcre dependency instead of -config script.
 RP 2014/5/22
 Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  configure.ac | 16 ++++++++++++----
  1 file changed, 12 insertions(+), 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 5383cec..c29a902 100644
+index dbddfb9..62cf17f 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -651,10 +651,18 @@ AC_ARG_WITH([pcre],
+@@ -748,10 +748,18 @@ AC_ARG_WITH([pcre],
  )
  AC_MSG_RESULT([$WITH_PCRE])
  
@@ -37,6 +38,3 @@ index 5383cec..c29a902 100644
    else
      AC_PATH_PROG([PCRECONFIG], [pcre-config])
      if test -n "$PCRECONFIG"; then
--- 
-2.15.0
-
diff --git a/meta/recipes-extended/lighttpd/lighttpd/0001-core-reuse-large-mem-chunks-fix-mem-usage-fixes-3033.patch b/meta/recipes-extended/lighttpd/lighttpd/0001-core-reuse-large-mem-chunks-fix-mem-usage-fixes-3033.patch
new file mode 100644
index 0000000000..e226366112
--- /dev/null
+++ b/meta/recipes-extended/lighttpd/lighttpd/0001-core-reuse-large-mem-chunks-fix-mem-usage-fixes-3033.patch
@@ -0,0 +1,224 @@
+From a566fe4cc9f9d0ef9cfdcbc13159ef0644e91c9c Mon Sep 17 00:00:00 2001
+From: Glenn Strauss <gstrauss@gluelogic.com>
+Date: Wed, 23 Dec 2020 23:14:47 -0500
+Subject: [PATCH] reuse large mem chunks (fix mem usage) (fixes #3033)
+
+(cherry picked from commit 7ba521ffb4959f6f74a609d5d4acafc29a038337)
+
+(thx flynn)
+
+fix large memory usage for large file downloads from dynamic backends
+
+reuse or release large memory chunks
+
+x-ref:
+  "Memory Growth with PUT and full buffered streams"
+  https://redmine.lighttpd.net/issues/3033
+
+Upstream-Status: Backport
+Comment: Hunk refreshed to make it backword compatible.
+https://redmine.lighttpd.net/projects/lighttpd/repository/14/revisions/7ba521ffb4959f6f74a609d5d4acafc29a038337
+Signed-off-by: Purushottam Choudhary <Purushottam.Choudhary@kpit.com>
+
+---
+ src/chunk.c            | 99 +++++++++++++++++++++++++++++++++---------
+ src/chunk.h            |  2 +
+ src/http-header-glue.c |  2 +-
+ 3 files changed, 82 insertions(+), 21 deletions(-)
+
+diff --git a/src/chunk.c b/src/chunk.c
+index 133308f..d7259b9 100644
+--- a/src/chunk.c
++++ b/src/chunk.c
+@@ -28,16 +28,20 @@
+ static size_t chunk_buf_sz = 8192;
+ static chunk *chunks, *chunks_oversized;
+ static chunk *chunk_buffers;
++static int chunks_oversized_n;
+ static array *chunkqueue_default_tempdirs = NULL;
+ static off_t chunkqueue_default_tempfile_size = DEFAULT_TEMPFILE_SIZE;
+ 
+ void chunkqueue_set_chunk_size (size_t sz)
+ {
+-    chunk_buf_sz = sz > 0 ? ((sz + 1023) & ~1023uL) : 8192;
++    size_t x = 1024;
++    while (x < sz && x < (1u << 30)) x <<= 1;
++    chunk_buf_sz = sz > 0 ? x : 8192;
+ }
+ 
+ void chunkqueue_set_tempdirs_default_reset (void)
+ {
++    chunk_buf_sz = 8192;
+     chunkqueue_default_tempdirs = NULL;
+     chunkqueue_default_tempfile_size = DEFAULT_TEMPFILE_SIZE;
+ }
+@@ -120,15 +124,49 @@ static void chunk_free(chunk *c) {
+ 	free(c);
+ }
+ 
+-buffer * chunk_buffer_acquire(void) {
++static chunk * chunk_pop_oversized(size_t sz) {
++    /* future: might have buckets of certain sizes, up to socket buf sizes */
++    if (chunks_oversized && chunks_oversized->mem->size >= sz) {
++        --chunks_oversized_n;
++        chunk *c = chunks_oversized;
++        chunks_oversized = c->next;
++        return c;
++    }
++    return NULL;
++}
++
++static void chunk_push_oversized(chunk * const c, const size_t sz) {
++    if (chunks_oversized_n < 64 && chunk_buf_sz >= 4096) {
++        ++chunks_oversized_n;
++        chunk **co = &chunks_oversized;
++        while (*co && sz < (*co)->mem->size) co = &(*co)->next;
++        c->next = *co;
++        *co = c;
++    }
++    else
++        chunk_free(c);
++}
++
++static buffer * chunk_buffer_acquire_sz(size_t sz) {
+     chunk *c;
+     buffer *b;
+-    if (chunks) {
+-        c = chunks;
+-        chunks = c->next;
++    if (sz <= chunk_buf_sz) {
++        if (chunks) {
++            c = chunks;
++            chunks = c->next;
++        }
++        else
++            c = chunk_init(chunk_buf_sz);
++            /* future: might choose to pop from chunks_oversized, if available
++             * (even if larger than sz) rather than allocating new chunk
++             * (and if doing so, might replace chunks_oversized_n) */
+     }
+     else {
+-        c = chunk_init(chunk_buf_sz);
++        /*(round up to nearest chunk_buf_sz)*/
++        sz = (sz + (chunk_buf_sz-1)) & ~(chunk_buf_sz-1);
++        c = chunk_pop_oversized(sz);
++        if (NULL == c)
++            c = chunk_init(sz);
+     }
+     c->next = chunk_buffers;
+     chunk_buffers = c;
+@@ -137,21 +175,47 @@ buffer * chunk_buffer_acquire(void) {
+     return b;
+ }
+ 
++buffer * chunk_buffer_acquire(void) {
++    return chunk_buffer_acquire_sz(chunk_buf_sz);
++}
++
+ void chunk_buffer_release(buffer *b) {
+     if (NULL == b) return;
+-    if (b->size >= chunk_buf_sz && chunk_buffers) {
++    if (chunk_buffers) {
+         chunk *c = chunk_buffers;
+         chunk_buffers = c->next;
+         c->mem = b;
+-        c->next = chunks;
+-        chunks = c;
+         buffer_clear(b);
++        if (b->size == chunk_buf_sz) {
++            c->next = chunks;
++            chunks = c;
++        }
++        else if (b->size > chunk_buf_sz)
++            chunk_push_oversized(c, b->size);
++        else
++            chunk_free(c);
+     }
+     else {
+         buffer_free(b);
+     }
+ }
+ 
++size_t chunk_buffer_prepare_append(buffer * const b, size_t sz) {
++    if (sz > chunk_buffer_string_space(b)) {
++        sz += b->used ? b->used : 1;
++        buffer * const cb = chunk_buffer_acquire_sz(sz);
++        /* swap buffer contents and copy original b->ptr into larger b->ptr */
++        /*(this does more than buffer_move())*/
++        buffer tb = *b;
++        *b = *cb;
++        *cb = tb;
++        if ((b->used = tb.used))
++            memcpy(b->ptr, tb.ptr, tb.used);
++        chunk_buffer_release(cb);
++    }
++    return chunk_buffer_string_space(b);
++}
++
+ static chunk * chunk_acquire(size_t sz) {
+     if (sz <= chunk_buf_sz) {
+         if (chunks) {
+@@ -162,13 +226,10 @@ static chunk * chunk_acquire(size_t sz) {
+         sz = chunk_buf_sz;
+     }
+     else {
+-        sz = (sz + 8191) & ~8191uL;
+-        /* future: might have buckets of certain sizes, up to socket buf sizes*/
+-        if (chunks_oversized && chunks_oversized->mem->size >= sz) {
+-            chunk *c = chunks_oversized;
+-            chunks_oversized = c->next;
+-            return c;
+-        }
++        /*(round up to nearest chunk_buf_sz)*/
++        sz = (sz + (chunk_buf_sz-1)) & ~(chunk_buf_sz-1);
++        chunk *c = chunk_pop_oversized(sz);
++        if (c) return c;
+     }
+ 
+     return chunk_init(sz);
+@@ -183,10 +244,7 @@ static void chunk_release(chunk *c) {
+     }
+     else if (sz > chunk_buf_sz) {
+         chunk_reset(c);
+-        chunk **co = &chunks_oversized;
+-        while (*co && sz < (*co)->mem->size) co = &(*co)->next;
+-        c->next = *co;
+-        *co = c;
++        chunk_push_oversized(c, sz);
+     }
+     else {
+         chunk_free(c);
+@@ -205,6 +263,7 @@ void chunkqueue_chunk_pool_clear(void)
+         chunk_free(c);
+     }
+     chunks_oversized = NULL;
++    chunks_oversized_n = 0;
+ }
+ 
+ void chunkqueue_chunk_pool_free(void)
+diff --git a/src/chunk.h b/src/chunk.h
+index 4c6b7e4..93f343c 100644
+--- a/src/chunk.h
++++ b/src/chunk.h
+@@ -50,6 +50,8 @@ typedef struct {
+ buffer * chunk_buffer_acquire(void);
+ void chunk_buffer_release(buffer *b);
+ 
++size_t chunk_buffer_prepare_append (buffer *b, size_t sz);
++
+ void chunkqueue_chunk_pool_clear(void);
+ void chunkqueue_chunk_pool_free(void);
+ 
+diff --git a/src/http-header-glue.c b/src/http-header-glue.c
+index d54f00c..2231fba 100644
+--- a/src/http-header-glue.c
++++ b/src/http-header-glue.c
+@@ -1267,7 +1267,7 @@ handler_t http_response_read(server *srv, connection *con, http_response_opts *o
+         if (avail < toread) {
+             /*(add avail+toread to reduce allocations when ioctl EOPNOTSUPP)*/
+             avail = avail ? avail - 1 + toread : toread;
+-            buffer_string_prepare_append(b, avail);
++            avail = chunk_buffer_prepare_append(b, avail);
+         }
+ 
+         n = read(fd, b->ptr+buffer_string_length(b), avail);
diff --git a/meta/recipes-extended/lighttpd/lighttpd/default-chunk-size-8k.patch b/meta/recipes-extended/lighttpd/lighttpd/default-chunk-size-8k.patch
new file mode 100644
index 0000000000..fd75ca6e26
--- /dev/null
+++ b/meta/recipes-extended/lighttpd/lighttpd/default-chunk-size-8k.patch
@@ -0,0 +1,35 @@
+From 2e08ee1d404e308f15551277e92b7605ddfa96a8 Mon Sep 17 00:00:00 2001
+From: Glenn Strauss <gstrauss@gluelogic.com>
+Date: Fri, 29 Nov 2019 18:18:52 -0500
+Subject: [PATCH] default chunk size 8k (was 4k)
+
+Upstream-Status: Backport
+Comment: No hunk refreshed
+https://git.lighttpd.net/lighttpd/lighttpd1.4/commit/304e46d4f808c46cbb025edfacf2913a30ce8855
+Signed-off-by: Purushottam Choudhary <Purushottam.Choudhary@kpit.com>
+---
+ src/chunk.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/chunk.c b/src/chunk.c
+index 09dd3f1..133308f 100644
+--- a/src/chunk.c
++++ b/src/chunk.c
+@@ -25,7 +25,7 @@
+ #define DEFAULT_TEMPFILE_SIZE (1 * 1024 * 1024)
+ #define MAX_TEMPFILE_SIZE (128 * 1024 * 1024)
+ 
+-static size_t chunk_buf_sz = 4096;
++static size_t chunk_buf_sz = 8192;
+ static chunk *chunks, *chunks_oversized;
+ static chunk *chunk_buffers;
+ static array *chunkqueue_default_tempdirs = NULL;
+@@ -33,7 +33,7 @@ static off_t chunkqueue_default_tempfile_size = DEFAULT_TEMPFILE_SIZE;
+ 
+ void chunkqueue_set_chunk_size (size_t sz)
+ {
+-    chunk_buf_sz = sz > 0 ? ((sz + 1023) & ~1023uL) : 4096;
++    chunk_buf_sz = sz > 0 ? ((sz + 1023) & ~1023uL) : 8192;
+ }
+ 
+ void chunkqueue_set_tempdirs_default_reset (void)
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.55.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.55.bb
index 35a268a03f..737d6ebf7c 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.55.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.55.bb
@@ -18,6 +18,8 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
         file://lighttpd.conf \
         file://lighttpd \
         file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch \
+        file://default-chunk-size-8k.patch \
+        file://0001-core-reuse-large-mem-chunks-fix-mem-usage-fixes-3033.patch \
         "
 
 SRC_URI[md5sum] = "be4bda2c28bcbdac6eb941528f6edf03"
-- 
2.25.1


Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web08.2951.1630668723306729115
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Sep 2021 04:32:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KPXQTPXC;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: purushottamchoudhary29@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id c5so2232126plz.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Sep 2021 04:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=xvbkrA9JS+Y+yU7atxqF7exUSV1R7ts6iOa8vOcQbNA=;
        b=KPXQTPXCIMqPEfVbINX99MAioUdeWmn4OeIRXPEwpDNr0W4BaTEYBVAbTnQlWe6/18
         0nhqJ88TDtoLavvBHCT0znUS6VoX8HFrciyUmqwL3yU6w6Bl453gmTT2/2ecD9cOwk/P
         EqI0FU71hfTA2m/M5KqaBIsfWwsiIqc6K+qIF4X0rU7hgDXexU4Bw04qY2N5Bk4PTkpG
         zD8AHFp9gUyDz8crYDnkyVHWab4u1zTW7TGmyhDXM4p0Vi63yYPrtkHhsLhye1NZZV37
         14Vf4ww+lrS0eCDn906PxKLiJ+hjwrQeW62IvF5FH1edwVgqh5pTCWYUD2AZbIlho8AR
         3TWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=xvbkrA9JS+Y+yU7atxqF7exUSV1R7ts6iOa8vOcQbNA=;
        b=bDoxjrb4OceK7elU5ZgDP1Ln9Dl98lgSc5zqGMEy4Yu41lH/pgu0FoJAJ1GlURR2f4
         V0XtAoDOta2nHRDFCfJylBuzv3N3UsmdUr6KTIEnQ8FT3iqT3cl3btwwnELblM5Jtc+D
         5KM3dvUTOP/1FRnPLVS6D4kuuNN3d6KWgQOUMJQfWffmlTUM5RyLkrR33j5LK2bTwFaP
         lSt2TU/Wt9JxLXjwb87OZ517Hp4EPbjbXkxAQjusC44PrOagTMrC9C13oSDI6M3S3N6y
         1h6ArAIMEkwFKZnryU65HtJp9THFIfLSP0JSe0inSvnKX6eiH4RcZLBLbsjKBsT2sjux
         emNw==
X-Gm-Message-State: AOAM533hupAaNG+E90h/74ygRLFp4fmOmn9/6i9qc/W/wUY54KsMBw01
	yByTdw/F6dvQy1d6guzgIgxMBR6E5Pp+fkPq
X-Google-Smtp-Source: ABdhPJz/nQeO3g7daCP3uQIJiVoGTxD8r7ik8TLvtD6/NnBrJxm0qIUDTzXRoJ4r1PlCR4dUuutcrw==
X-Received: by 2002:a17:90a:428e:: with SMTP id p14mr9516043pjg.92.1630668722487;
        Fri, 03 Sep 2021 04:32:02 -0700 (PDT)
Return-Path: <purushottamchoudhary29@gmail.com>
Received: from localhost.localdomain ([2405:201:a410:a032:59c:8a68:5421:44fa])
        by smtp.gmail.com with ESMTPSA id w17sm1941240pfq.111.2021.09.03.04.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 04:32:02 -0700 (PDT)
From: "Purushottam Choudhary" <purushottamchoudhary29@gmail.com>
To: openembedded-core@lists.openembedded.org,
	anuj.mittal@intel.com
Cc: Mikko.Rapeli@bmw.de,
	nisha.parrakat@kpit.com
Subject: [poky][dunfell][PATCHv6] lighttpd: Add patch for reuse large memory chunks
Date: Fri,  3 Sep 2021 17:01:35 +0530
Message-Id: <20210903113135.28607-1-purushottamchoudhary29@gmail.com>
X-Mailer: git-send-email 2.17.1

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
2.17.1


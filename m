Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web08.52839.1629285403660395538
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 04:16:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u7Kuv/EN;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: purushottamchoudhary29@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id c17so1894778pgc.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 04:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=WPgdBj7eeZXy6+kRXrWiC+WrOFb5myiy/DIMkWJX1Dg=;
        b=u7Kuv/ENLiicVJe1InOwWjEUfk2wVUQCexbDCoz2wtgEpvng9WiWelWc6afMBRuBWs
         1f8mgtFQfkh/+ug4p60vn6/k8srG6uqTX+QEcxarFiHytjDeeXaUW+Wrce1ljAvJlTwF
         xZpQQGsCy6c2eYdD8E0mhp1/ZX1C4fVsIWr9zFuAxj+eTbwJFbVyYugfSiL0m+Y0bOyi
         Y4EAXHXguBntWFLd/lXT7JAMFDx82GA8i+YtjpmqNCvqr2XeRaOQWVNwnnbB375yvsyE
         OLZQpaZLfjctFAf0dU2g5KU9kIOIiB33EGeoPNMKF9lKgNwg/HHGE2sdUcwRTRUH2af1
         oG9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=WPgdBj7eeZXy6+kRXrWiC+WrOFb5myiy/DIMkWJX1Dg=;
        b=hr+QM0HhlvhrKXWeGE4jKcz77uweVTgLWCSJB14DH7KNAtI3Rxa0vQIU8thBu3z7K/
         +Qgj3JMFrg+zEYde+mjhg3hH222F8Zq7O1LXL8tKu2d3IL6mtn6bdhXQBsQju5Oh1H/U
         QZB8onrXDgo1k3OgmgqLq2oFrQQafyYNs9TKm1sf8lqQukjzhDG4fM9+fHa/FU9mfHsk
         JuPehfqBlAjBRA0p6YZ2+j3gb6UKlmJmngoKfvKCmO8OBsSZCH5fIh5y/46+E0F4Ze4f
         rE3LIYW9pfvYg2QfoiobeC8Kg7JlfAdwWJ0uo1Wdu7inFIH8wh+4EXUw1fNwffBsgbvZ
         PCIQ==
X-Gm-Message-State: AOAM533tMQv6HjRdVcl9bpcuK3w95/fta0OFhTkHijns2Q0tfi1VQ4fF
	0TZbgVq0moVpMKJf1fBg2xhAy08WIKL6BS3v
X-Google-Smtp-Source: ABdhPJwhMavuAdIttuTzl0MCh/CvHYSzNtVJUhxBjJB64Dv7JbEQ7fOjg4xdu1ZkSZ5PuGbKtO3UhA==
X-Received: by 2002:a05:6a00:225c:b0:3e1:a127:dd96 with SMTP id i28-20020a056a00225c00b003e1a127dd96mr8992710pfu.0.1629285402764;
        Wed, 18 Aug 2021 04:16:42 -0700 (PDT)
Return-Path: <purushottamchoudhary29@gmail.com>
Received: from localhost.localdomain ([2405:201:a410:a032:952c:4f07:375c:a133])
        by smtp.gmail.com with ESMTPSA id bv4sm4946588pjb.27.2021.08.18.04.16.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Aug 2021 04:16:42 -0700 (PDT)
From: "Purushottam Choudhary" <purushottamchoudhary29@gmail.com>
To: openembedded-core@lists.openembedded.org,
	sakoman@gmail.com
Cc: nisha.parrakat@kpit.com,
	Mikko.Rapeli@bmw.de
Subject: [poky][dunfell][PATCHv5] lighttpd: Add patch for reuse large memory chunks
Date: Wed, 18 Aug 2021 16:46:30 +0530
Message-Id: <1629285390-24529-1-git-send-email-purushottamchoudhary29@gmail.com>
X-Mailer: git-send-email 2.7.4

Added 0001-core-reuse-large-mem-chunks-fix-mem-usage-fixes-3033.patch
to fix large memory usage for large file downloads
from dynamic backends reuse or release large memory chunks.

This issue is caused by a bug in the lighttpd 1.4.55 version and
has been fixed in lighttpd 1.4.58. Hence, it is not needed for
master and hardknott branch because lighttpd has 1.4.59 version.

Link: https://redmine.lighttpd.net/projects/lighttpd/repository/14/revisions/7ba521ffb4959f6f74a609d5d4acafc29a038337

Signed-off-by: Purushottam Choudhary <purushottamchoudhary29@gmail.com>
---
 ...fig-for-pcre-dependency-instead-of-config.patch |  10 +-
 ...large-mem-chunks-fix-mem-usage-fixes-3033.patch | 221 +++++++++++++++++++++
 meta/recipes-extended/lighttpd/lighttpd_1.4.55.bb  |   1 +
 3 files changed, 226 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-extended/lighttpd/lighttpd/0001-core-reuse-large-mem-chunks-fix-mem-usage-fixes-3033.patch

diff --git a/meta/recipes-extended/lighttpd/lighttpd/0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch b/meta/recipes-extended/lighttpd/lighttpd/0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch
index f17bdce..edf2a07 100644
--- a/meta/recipes-extended/lighttpd/lighttpd/0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch
+++ b/meta/recipes-extended/lighttpd/lighttpd/0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch
@@ -1,4 +1,4 @@
-From 22afc5d9aaa215c3c87ba21c77d47da44ab3b113 Mon Sep 17 00:00:00 2001
+From 4744f5b1cde08c056986ebaf900ee99141084a0d Mon Sep 17 00:00:00 2001
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
index 0000000..d288c9f
--- /dev/null
+++ b/meta/recipes-extended/lighttpd/lighttpd/0001-core-reuse-large-mem-chunks-fix-mem-usage-fixes-3033.patch
@@ -0,0 +1,221 @@
+From 1cf72f27c465a5d000391f53bc33aaeac5e6d2b5 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport
+https://redmine.lighttpd.net/projects/lighttpd/repository/14/revisions/7ba521ffb4959f6f74a609d5d4acafc29a038337
+Signed-off-by: Purushottam Choudhary <Purushottam.Choudhary@kpit.com>
+x-ref:
+  "Memory Growth with PUT and full buffered streams"
+  https://redmine.lighttpd.net/issues/3033
+
+---
+ src/chunk.c            | 99 ++++++++++++++++++++++++++++++++++++++++----------
+ src/chunk.h            |  2 +
+ src/http-header-glue.c |  2 +-
+ 3 files changed, 82 insertions(+), 21 deletions(-)
+
+diff --git a/src/chunk.c b/src/chunk.c
+index 09dd3f1..ffb3795 100644
+--- a/src/chunk.c
++++ b/src/chunk.c
+@@ -28,16 +28,20 @@
+ static size_t chunk_buf_sz = 4096;
+ static chunk *chunks, *chunks_oversized;
+ static chunk *chunk_buffers;
++static int chunks_oversized_n;
+ static array *chunkqueue_default_tempdirs = NULL;
+ static off_t chunkqueue_default_tempfile_size = DEFAULT_TEMPFILE_SIZE;
+ 
+ void chunkqueue_set_chunk_size (size_t sz)
+ {
+-    chunk_buf_sz = sz > 0 ? ((sz + 1023) & ~1023uL) : 4096;
++    size_t x = 1024;
++    while (x < sz && x < (1u << 30)) x <<= 1;
++    chunk_buf_sz = sz > 0 ? x : 4096;
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
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.55.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.55.bb
index 35a268a..5329465 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.55.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.55.bb
@@ -18,6 +18,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
         file://lighttpd.conf \
         file://lighttpd \
         file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch \
+        file://0001-core-reuse-large-mem-chunks-fix-mem-usage-fixes-3033.patch \
         "
 
 SRC_URI[md5sum] = "be4bda2c28bcbdac6eb941528f6edf03"
-- 
2.7.4


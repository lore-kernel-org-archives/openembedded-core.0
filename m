Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1AF3971A74
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Feb 2019 21:16:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x11LGaeJ018456
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 1 Feb 2019 13:16:36 -0800 (PST)
Received: from fidler.wrs.com (172.25.44.4) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.435.0;
	Fri, 1 Feb 2019 13:16:29 -0800
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Feb 2019 16:16:28 -0500
Message-ID: <20190201211628.29409-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Subject: [PATCH] libsolv: upgrade from 0.7.2 to 0.7.3
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
X-List-Received-Date: Fri, 01 Feb 2019 21:16:37 -0000
Content-Type: text/plain

Also drop the musl specific fopencookie patches since musl
added support for fopencookie in:
   06184334 implement the fopencookie extension to stdio
in December 2017 so it has been in musl since v1.1.19.
There was no change in libsolv's configure log when building
with musl and these patches dropped.

libsolv NEWS
------------
Version 0.7.3
- selected bug fixes:
  * fixed a couple of null pointer derefs and potential memory
    leaks
  * made disfavoring recommended packages work if strong recommends
    is enabled
  * no longer disable infarch rules when they don't conflict with
    the job
- new features:
  * do favor evaluation before pruning allowing to (dis)favor
    specific package versions

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 ...-fallback-fopencookie-implementation.patch | 251 ------------------
 ...-internal-fopencookie-implementation.patch | 105 --------
 .../{libsolv_0.7.2.bb => libsolv_0.7.3.bb}    |   5 +-
 3 files changed, 1 insertion(+), 360 deletions(-)
 delete mode 100644 meta/recipes-extended/libsolv/libsolv/0001-Add-fallback-fopencookie-implementation.patch
 delete mode 100644 meta/recipes-extended/libsolv/libsolv/0002-Fixes-to-internal-fopencookie-implementation.patch
 rename meta/recipes-extended/libsolv/{libsolv_0.7.2.bb => libsolv_0.7.3.bb} (74%)

diff --git a/meta/recipes-extended/libsolv/libsolv/0001-Add-fallback-fopencookie-implementation.patch b/meta/recipes-extended/libsolv/libsolv/0001-Add-fallback-fopencookie-implementation.patch
deleted file mode 100644
index e5cb60dd56..0000000000
--- a/meta/recipes-extended/libsolv/libsolv/0001-Add-fallback-fopencookie-implementation.patch
+++ /dev/null
@@ -1,251 +0,0 @@
-From 47c6f1b4332a9e4935c48cca826786a6b8fe6f59 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Neal=20Gompa=20=28=E3=83=8B=E3=83=BC=E3=83=AB=E3=83=BB?=
- =?UTF-8?q?=E3=82=B3=E3=82=99=E3=83=B3=E3=83=8F=E3=82=9A=29?=
- <ngompa13@gmail.com>
-Date: Wed, 11 Nov 2015 20:32:17 -0500
-Subject: [PATCH 1/2] Add fallback fopencookie() implementation
-
-In environments where neither fopencookie() nor funopen()
-are implemented, we need to provide a suitable implementation
-of fopencookie() that we can use.
-
-Alex Kanavin: rebased CMakeLists.txt change to apply to latest upstream code.
-
-Upstream-Status: Denied [https://github.com/openSUSE/libsolv/pull/112]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- ext/CMakeLists.txt                     |   7 ++
- ext/solv_xfopen.c                      |  10 +--
- ext/solv_xfopen_fallback_fopencookie.c | 123 +++++++++++++++++++++++++++++++++
- ext/solv_xfopen_fallback_fopencookie.h |  28 ++++++++
- 4 files changed, 164 insertions(+), 4 deletions(-)
- create mode 100644 ext/solv_xfopen_fallback_fopencookie.c
- create mode 100644 ext/solv_xfopen_fallback_fopencookie.h
-
-diff --git a/ext/CMakeLists.txt b/ext/CMakeLists.txt
-index b8917a2..fac6c32 100644
---- a/ext/CMakeLists.txt
-+++ b/ext/CMakeLists.txt
-@@ -4,6 +4,13 @@ SET (libsolvext_SRCS
- SET (libsolvext_HEADERS
-     tools_util.h solv_xfopen.h testcase.h)
- 
-+IF (NOT HAVE_FOPENCOOKIE AND NOT HAVE_FUNOPEN)
-+    SET (libsolvext_SRCS ${libsolvext_SRCS}
-+        solv_xfopen_fallback_fopencookie.c)
-+    SET (libsolvext_HEADERS ${libsolvext_HEADERS}
-+        solv_xfopen_fallback_fopencookie.h)
-+ENDIF (NOT HAVE_FOPENCOOKIE AND NOT HAVE_FUNOPEN)
-+
- IF (ENABLE_RPMDB OR ENABLE_RPMPKG)
-     SET (libsolvext_SRCS ${libsolvext_SRCS}
-         pool_fileconflicts.c repo_rpmdb.c)
-diff --git a/ext/solv_xfopen.c b/ext/solv_xfopen.c
-index 2c64bb6..eb3a3ad 100644
---- a/ext/solv_xfopen.c
-+++ b/ext/solv_xfopen.c
-@@ -12,6 +12,10 @@
- #include <string.h>
- #include <fcntl.h>
- 
-+#if !defined(HAVE_FUNOPEN) && !defined(HAVE_FOPENCOOKIE)
-+#include "solv_xfopen_fallback_fopencookie.h"
-+#endif
-+
- #include "solv_xfopen.h"
- #include "util.h"
- 
-@@ -21,7 +25,7 @@ static FILE *cookieopen(void *cookie, const char *mode,
- 	ssize_t (*cwrite)(void *, const char *, size_t),
- 	int (*cclose)(void *))
- {
--#ifdef HAVE_FUNOPEN
-+#if defined(HAVE_FUNOPEN) && !defined(HAVE_FOPENCOOKIE)
-   if (!cookie)
-     return 0;
-   return funopen(cookie,
-@@ -30,7 +34,7 @@ static FILE *cookieopen(void *cookie, const char *mode,
-       (fpos_t (*)(void *, fpos_t, int))NULL,					/* seekfn */
-       cclose
-       );
--#elif defined(HAVE_FOPENCOOKIE)
-+#else
-   cookie_io_functions_t cio;
- 
-   if (!cookie)
-@@ -42,8 +46,6 @@ static FILE *cookieopen(void *cookie, const char *mode,
-     cio.write = cwrite;
-   cio.close = cclose;
-   return  fopencookie(cookie, *mode == 'w' ? "w" : "r", cio);
--#else
--# error Need to implement custom I/O
- #endif
- }
- 
-diff --git a/ext/solv_xfopen_fallback_fopencookie.c b/ext/solv_xfopen_fallback_fopencookie.c
-new file mode 100644
-index 0000000..0ce2571
---- /dev/null
-+++ b/ext/solv_xfopen_fallback_fopencookie.c
-@@ -0,0 +1,123 @@
-+/* 
-+ *	Provides a very limited fopencookie() for environments with a libc
-+ *	that lacks it.
-+ *	
-+ *	Author: zhasha
-+ *	Modified for libsolv by Neal Gompa
-+ *	
-+ *	This program is licensed under the BSD license, read LICENSE.BSD
-+ *	for further information.
-+ *
-+ */
-+
-+#define _LARGEFILE64_SOURCE 1
-+#include <pthread.h>
-+#include <stdio.h>
-+#include <stdlib.h>
-+#include <unistd.h>
-+#include <fcntl.h>
-+#include <sys/types.h>
-+#include <errno.h>
-+#include "solv_xfopen_fallback_fopencookie.h"
-+
-+extern int pipe2(int[2], int);
-+
-+struct ctx {
-+    int fd;
-+    void *cookie;
-+    struct cookie_io_functions_t io;
-+    char buf[1024];
-+};
-+
-+static void *proxy(void *arg)
-+{
-+    struct ctx *ctx = arg;
-+    ssize_t r;
-+    size_t n;
-+
-+    pthread_detach(pthread_self());
-+
-+    while (1) {
-+        r = ctx->io.read ?
-+            (ctx->io.read)(ctx->cookie, ctx->buf, sizeof(ctx->buf)) :
-+            read(ctx->fd, ctx->buf, sizeof(ctx->buf));
-+        if (r < 0) {
-+            if (errno != EINTR) { break; }
-+            continue;
-+        }
-+        if (r == 0) { break; }
-+
-+        while (n > 0) {
-+            r = ctx->io.write ?
-+                (ctx->io.write)(ctx->cookie, ctx->buf + ((size_t)r - n), n) :
-+                write(ctx->fd, ctx->buf + ((size_t)r - n), n);
-+            if (r < 0) {
-+                if (errno != EINTR) { break; }
-+                continue;
-+            }
-+            if (r == 0) { break; }
-+
-+            n -= (size_t)r;
-+        }
-+        if (n > 0) { break; }
-+    }
-+
-+    if (ctx->io.close) { (ctx->io.close)(ctx->cookie); }
-+    close(ctx->fd);
-+    return NULL;
-+}
-+
-+FILE *fopencookie(void *cookie, const char *mode, struct cookie_io_functions_t io)
-+{
-+    struct ctx *ctx = NULL;
-+    int rd = 0, wr = 0;
-+    int p[2] = { -1, -1 };
-+    FILE *f = NULL;
-+    pthread_t dummy;
-+
-+    switch (mode[0]) {
-+        case 'a':
-+        case 'r': rd = 1; break;
-+        case 'w': wr = 1; break;
-+        default:
-+            errno = EINVAL;
-+            return NULL;
-+    }
-+    switch (mode[1]) {
-+        case '\0': break;
-+        case '+':
-+            if (mode[2] == '\0') {
-+                errno = ENOTSUP;
-+                return NULL;
-+            }
-+        default:
-+            errno = EINVAL;
-+            return NULL;
-+    }
-+    if (io.seek) {
-+        errno = ENOTSUP;
-+        return NULL;
-+    }
-+
-+    ctx = malloc(sizeof(*ctx));
-+    if (!ctx) { return NULL; }
-+    if (pipe2(p, O_CLOEXEC) != 0) { goto err; }
-+    if ((f = fdopen(p[wr], mode)) == NULL) { goto err; }
-+    p[wr] = -1;
-+    ctx->fd = p[rd];
-+    ctx->cookie = cookie;
-+    ctx->io.read = rd ? io.read : NULL;
-+    ctx->io.write = wr ? io.write : NULL;
-+    ctx->io.seek = NULL;
-+    ctx->io.close = io.close;
-+    if (pthread_create(&dummy, NULL, proxy, ctx) != 0) { goto err; }
-+
-+    return f;
-+
-+err:
-+    if (p[0] >= 0) { close(p[0]); }
-+    if (p[1] >= 0) { close(p[1]); }
-+    if (f) { fclose(f); }
-+    free(ctx);
-+    return NULL;
-+}
-diff --git a/ext/solv_xfopen_fallback_fopencookie.h b/ext/solv_xfopen_fallback_fopencookie.h
-new file mode 100644
-index 0000000..6a7bfee
---- /dev/null
-+++ b/ext/solv_xfopen_fallback_fopencookie.h
-@@ -0,0 +1,28 @@
-+/* 
-+ *	Provides a very limited fopencookie() for environments with a libc
-+ *	that lacks it.
-+ *	
-+ *	Author: zhasha
-+ *	Modified for libsolv by Neal Gompa
-+ *	
-+ *	This program is licensed under the BSD license, read LICENSE.BSD
-+ *	for further information.
-+ *	
-+ */
-+
-+#ifndef SOLV_XFOPEN_FALLBACK_FOPENCOOKIE_H
-+#define SOLV_XFOPEN_FALLBACK_FOPENCOOKIE_H
-+
-+#include <stdio.h>
-+#include <stdint.h>
-+
-+typedef struct cookie_io_functions_t {
-+    ssize_t (*read)(void *, char *, size_t);
-+    ssize_t (*write)(void *, const char *, size_t);
-+    int (*seek)(void *, off64_t, int);
-+    int (*close)(void *);
-+} cookie_io_functions_t;
-+
-+FILE *fopencookie(void *cookie, const char *mode, struct cookie_io_functions_t io);
-+
-+#endif
--- 
-2.4.0
-
diff --git a/meta/recipes-extended/libsolv/libsolv/0002-Fixes-to-internal-fopencookie-implementation.patch b/meta/recipes-extended/libsolv/libsolv/0002-Fixes-to-internal-fopencookie-implementation.patch
deleted file mode 100644
index 93b8cc9c18..0000000000
--- a/meta/recipes-extended/libsolv/libsolv/0002-Fixes-to-internal-fopencookie-implementation.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-From 84e12bf7ece49073c559dfd58005132a6099a964 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Neal=20Gompa=20=28=E3=83=8B=E3=83=BC=E3=83=AB=E3=83=BB?=
- =?UTF-8?q?=E3=82=B3=E3=82=99=E3=83=B3=E3=83=8F=E3=82=9A=29?=
- <ngompa13@gmail.com>
-Date: Mon, 23 Nov 2015 18:19:41 -0500
-Subject: [PATCH 2/2] Fixes to internal fopencookie() implementation
-
-Credits to the fixes go to nsz on #musl on Freenode,
-who gloriously fixed the implementation such that
-the tests all pass.
-
-Upstream-Status: Denied [https://github.com/openSUSE/libsolv/pull/112]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- ext/solv_xfopen_fallback_fopencookie.c | 19 ++++++++++---------
- ext/solv_xfopen_fallback_fopencookie.h | 10 +++++-----
- 2 files changed, 15 insertions(+), 14 deletions(-)
-
-diff --git a/ext/solv_xfopen_fallback_fopencookie.c b/ext/solv_xfopen_fallback_fopencookie.c
-index 0ce2571..89426a9 100644
---- a/ext/solv_xfopen_fallback_fopencookie.c
-+++ b/ext/solv_xfopen_fallback_fopencookie.c
-@@ -1,10 +1,10 @@
--/* 
-+/*
-  *	Provides a very limited fopencookie() for environments with a libc
-  *	that lacks it.
-- *	
-- *	Author: zhasha
-+ *
-+ *	Authors: zhasha & nsz
-  *	Modified for libsolv by Neal Gompa
-- *	
-+ *
-  *	This program is licensed under the BSD license, read LICENSE.BSD
-  *	for further information.
-  *
-@@ -33,7 +33,7 @@ static void *proxy(void *arg)
- {
-     struct ctx *ctx = arg;
-     ssize_t r;
--    size_t n;
-+    size_t n, k;
- 
-     pthread_detach(pthread_self());
- 
-@@ -47,17 +47,18 @@ static void *proxy(void *arg)
-         }
-         if (r == 0) { break; }
- 
-+        n = r, k = 0;
-         while (n > 0) {
-             r = ctx->io.write ?
--                (ctx->io.write)(ctx->cookie, ctx->buf + ((size_t)r - n), n) :
--                write(ctx->fd, ctx->buf + ((size_t)r - n), n);
-+                (ctx->io.write)(ctx->cookie, ctx->buf + k, n) :
-+                write(ctx->fd, ctx->buf + k, n);
-             if (r < 0) {
-                 if (errno != EINTR) { break; }
-                 continue;
-             }
-             if (r == 0) { break; }
- 
--            n -= (size_t)r;
-+            n -= r, k += r;
-         }
-         if (n > 0) { break; }
-     }
-@@ -77,8 +78,8 @@ FILE *fopencookie(void *cookie, const char *mode, struct cookie_io_functions_t i
- 
-     switch (mode[0]) {
-         case 'a':
--        case 'r': rd = 1; break;
-         case 'w': wr = 1; break;
-+        case 'r': rd = 1; break;
-         default:
-             errno = EINVAL;
-             return NULL;
-diff --git a/ext/solv_xfopen_fallback_fopencookie.h b/ext/solv_xfopen_fallback_fopencookie.h
-index 6a7bfee..7223e3f 100644
---- a/ext/solv_xfopen_fallback_fopencookie.h
-+++ b/ext/solv_xfopen_fallback_fopencookie.h
-@@ -1,13 +1,13 @@
--/* 
-+/*
-  *	Provides a very limited fopencookie() for environments with a libc
-  *	that lacks it.
-- *	
-- *	Author: zhasha
-+ *
-+ *	Authors: zhasha & nsz
-  *	Modified for libsolv by Neal Gompa
-- *	
-+ *
-  *	This program is licensed under the BSD license, read LICENSE.BSD
-  *	for further information.
-- *	
-+ *
-  */
- 
- #ifndef SOLV_XFOPEN_FALLBACK_FOPENCOOKIE_H
--- 
-2.4.0
-
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.2.bb b/meta/recipes-extended/libsolv/libsolv_0.7.3.bb
similarity index 74%
rename from meta/recipes-extended/libsolv/libsolv_0.7.2.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.3.bb
index 6e3993b05e..44757ac54f 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.2.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.3.bb
@@ -8,11 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
 DEPENDS = "expat zlib"
 
 SRC_URI = "git://github.com/openSUSE/libsolv.git"
-SRC_URI_append_libc-musl = " file://0001-Add-fallback-fopencookie-implementation.patch \
-                             file://0002-Fixes-to-internal-fopencookie-implementation.patch \
-                           "
 
-SRCREV = "1c0141962a9eef7f4bc1fdcac7099f3f6a95ec23"
+SRCREV = "dc7d0f1c3113f2c8217563166906bef3eb5d1ee1"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.17.0



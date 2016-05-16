Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CEF43731BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 12:15:21 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 16 May 2016 05:15:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,627,1455004800"; d="scan'208";a="981977034"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 16 May 2016 05:15:21 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 0AF886A4007
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 06:02:52 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 May 2016 15:15:29 +0300
Message-Id: <1463400929-28739-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1463400929-28739-1-git-send-email-maxin.john@intel.com>
References: <1463400929-28739-1-git-send-email-maxin.john@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] libsolv: upgrade to 0.6.20
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
X-List-Received-Date: Mon, 16 May 2016 12:15:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

0.6.19 -> 0.6.20

Added the following patch to fix build with musl:
        0001-Add-fallback-fopencookie-implementation.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...1-Add-fallback-fopencookie-implementation.patch | 254 +++++++++++++++++++++
 meta/recipes-extended/libsolv/libsolv_git.bb       |   8 +-
 2 files changed, 259 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-extended/libsolv/libsolv/0001-Add-fallback-fopencookie-implementation.patch

diff --git a/meta/recipes-extended/libsolv/libsolv/0001-Add-fallback-fopencookie-implementation.patch b/meta/recipes-extended/libsolv/libsolv/0001-Add-fallback-fopencookie-implementation.patch
new file mode 100644
index 0000000..24e2228b
--- /dev/null
+++ b/meta/recipes-extended/libsolv/libsolv/0001-Add-fallback-fopencookie-implementation.patch
@@ -0,0 +1,254 @@
+From 5b6e113f548bd8a2b100267bc5d54cee861a4b98 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Neal=20Gompa=20=28=E3=83=8B=E3=83=BC=E3=83=AB=E3=83=BB?=
+ =?UTF-8?q?=E3=82=B3=E3=82=99=E3=83=B3=E3=83=8F=E3=82=9A=29?=
+ <ngompa13@gmail.com>
+Date: Wed, 11 Nov 2015 20:32:17 -0500
+Subject: [PATCH] Add fallback fopencookie() implementation
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+In environments where neither fopencookie() nor funopen()
+are implemented, we need to provide a suitable implementation
+of fopencookie() that we can use.
+
+Upstream-Status: Submitted [ https://github.com/openSUSE/libsolv/pull/112 ]
+
+Signed-off-by: Neal Gompa (ニール・ゴンパ) <ngompa13@gmail.com>com>
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ ext/CMakeLists.txt                     |   7 ++
+ ext/solv_xfopen.c                      |  10 +--
+ ext/solv_xfopen_fallback_fopencookie.c | 124 +++++++++++++++++++++++++++++++++
+ ext/solv_xfopen_fallback_fopencookie.h |  28 ++++++++
+ 4 files changed, 165 insertions(+), 4 deletions(-)
+ create mode 100644 ext/solv_xfopen_fallback_fopencookie.c
+ create mode 100644 ext/solv_xfopen_fallback_fopencookie.h
+
+diff --git a/ext/CMakeLists.txt b/ext/CMakeLists.txt
+index ad52495..4f282ce 100644
+--- a/ext/CMakeLists.txt
++++ b/ext/CMakeLists.txt
+@@ -4,6 +4,13 @@ SET (libsolvext_SRCS
+ SET (libsolvext_HEADERS
+     tools_util.h solv_xfopen.h testcase.h)
+ 
++IF (NOT HAVE_FOPENCOOKIE AND NOT HAVE_FUNOPEN)
++    SET (libsolvext_SRCS ${libsolvext_SRCS}
++        solv_xfopen_fallback_fopencookie.c)
++    SET (libsolvext_HEADERS ${libsolvext_HEADERS}
++        solv_xfopen_fallback_fopencookie.h)
++ENDIF (NOT HAVE_FOPENCOOKIE AND NOT HAVE_FUNOPEN)
++
+ IF (ENABLE_RPMDB)
+     SET (libsolvext_SRCS ${libsolvext_SRCS}
+         pool_fileconflicts.c repo_rpmdb.c)
+diff --git a/ext/solv_xfopen.c b/ext/solv_xfopen.c
+index b0421bf..31345dd 100644
+--- a/ext/solv_xfopen.c
++++ b/ext/solv_xfopen.c
+@@ -13,6 +13,10 @@
+ #include <zlib.h>
+ #include <fcntl.h>
+ 
++#if !defined(HAVE_FUNOPEN) && !defined(HAVE_FOPENCOOKIE)
++#include "solv_xfopen_fallback_fopencookie.h"
++#endif
++
+ #include "solv_xfopen.h"
+ #include "util.h"
+ 
+@@ -39,7 +43,7 @@ static FILE *cookieopen(void *cookie, const char *mode,
+ 	ssize_t (*cwrite)(void *, const char *, size_t),
+ 	int (*cclose)(void *))
+ {
+-#ifdef HAVE_FUNOPEN
++#if defined(HAVE_FUNOPEN) && !defined(HAVE_FOPENCOOKIE)
+   if (!cookie)
+     return 0;
+   return funopen(cookie,
+@@ -48,7 +52,7 @@ static FILE *cookieopen(void *cookie, const char *mode,
+       (fpos_t (*)(void *, fpos_t, int))NULL,					/* seekfn */
+       cclose
+       );
+-#elif defined(HAVE_FOPENCOOKIE)
++#else
+   cookie_io_functions_t cio;
+ 
+   if (!cookie)
+@@ -60,8 +64,6 @@ static FILE *cookieopen(void *cookie, const char *mode,
+     cio.write = cwrite;
+   cio.close = cclose;
+   return  fopencookie(cookie, *mode == 'w' ? "w" : "r", cio);
+-#else
+-# error Need to implement custom I/O
+ #endif
+ }
+ 
+diff --git a/ext/solv_xfopen_fallback_fopencookie.c b/ext/solv_xfopen_fallback_fopencookie.c
+new file mode 100644
+index 0000000..89426a9
+--- /dev/null
++++ b/ext/solv_xfopen_fallback_fopencookie.c
+@@ -0,0 +1,124 @@
++/*
++ *	Provides a very limited fopencookie() for environments with a libc
++ *	that lacks it.
++ *
++ *	Authors: zhasha & nsz
++ *	Modified for libsolv by Neal Gompa
++ *
++ *	This program is licensed under the BSD license, read LICENSE.BSD
++ *	for further information.
++ *
++ */
++
++#define _LARGEFILE64_SOURCE 1
++#include <pthread.h>
++#include <stdio.h>
++#include <stdlib.h>
++#include <unistd.h>
++#include <fcntl.h>
++#include <sys/types.h>
++#include <errno.h>
++#include "solv_xfopen_fallback_fopencookie.h"
++
++extern int pipe2(int[2], int);
++
++struct ctx {
++    int fd;
++    void *cookie;
++    struct cookie_io_functions_t io;
++    char buf[1024];
++};
++
++static void *proxy(void *arg)
++{
++    struct ctx *ctx = arg;
++    ssize_t r;
++    size_t n, k;
++
++    pthread_detach(pthread_self());
++
++    while (1) {
++        r = ctx->io.read ?
++            (ctx->io.read)(ctx->cookie, ctx->buf, sizeof(ctx->buf)) :
++            read(ctx->fd, ctx->buf, sizeof(ctx->buf));
++        if (r < 0) {
++            if (errno != EINTR) { break; }
++            continue;
++        }
++        if (r == 0) { break; }
++
++        n = r, k = 0;
++        while (n > 0) {
++            r = ctx->io.write ?
++                (ctx->io.write)(ctx->cookie, ctx->buf + k, n) :
++                write(ctx->fd, ctx->buf + k, n);
++            if (r < 0) {
++                if (errno != EINTR) { break; }
++                continue;
++            }
++            if (r == 0) { break; }
++
++            n -= r, k += r;
++        }
++        if (n > 0) { break; }
++    }
++
++    if (ctx->io.close) { (ctx->io.close)(ctx->cookie); }
++    close(ctx->fd);
++    return NULL;
++}
++
++FILE *fopencookie(void *cookie, const char *mode, struct cookie_io_functions_t io)
++{
++    struct ctx *ctx = NULL;
++    int rd = 0, wr = 0;
++    int p[2] = { -1, -1 };
++    FILE *f = NULL;
++    pthread_t dummy;
++
++    switch (mode[0]) {
++        case 'a':
++        case 'w': wr = 1; break;
++        case 'r': rd = 1; break;
++        default:
++            errno = EINVAL;
++            return NULL;
++    }
++    switch (mode[1]) {
++        case '\0': break;
++        case '+':
++            if (mode[2] == '\0') {
++                errno = ENOTSUP;
++                return NULL;
++            }
++        default:
++            errno = EINVAL;
++            return NULL;
++    }
++    if (io.seek) {
++        errno = ENOTSUP;
++        return NULL;
++    }
++
++    ctx = malloc(sizeof(*ctx));
++    if (!ctx) { return NULL; }
++    if (pipe2(p, O_CLOEXEC) != 0) { goto err; }
++    if ((f = fdopen(p[wr], mode)) == NULL) { goto err; }
++    p[wr] = -1;
++    ctx->fd = p[rd];
++    ctx->cookie = cookie;
++    ctx->io.read = rd ? io.read : NULL;
++    ctx->io.write = wr ? io.write : NULL;
++    ctx->io.seek = NULL;
++    ctx->io.close = io.close;
++    if (pthread_create(&dummy, NULL, proxy, ctx) != 0) { goto err; }
++
++    return f;
++
++err:
++    if (p[0] >= 0) { close(p[0]); }
++    if (p[1] >= 0) { close(p[1]); }
++    if (f) { fclose(f); }
++    free(ctx);
++    return NULL;
++}
+diff --git a/ext/solv_xfopen_fallback_fopencookie.h b/ext/solv_xfopen_fallback_fopencookie.h
+new file mode 100644
+index 0000000..7223e3f
+--- /dev/null
++++ b/ext/solv_xfopen_fallback_fopencookie.h
+@@ -0,0 +1,28 @@
++/*
++ *	Provides a very limited fopencookie() for environments with a libc
++ *	that lacks it.
++ *
++ *	Authors: zhasha & nsz
++ *	Modified for libsolv by Neal Gompa
++ *
++ *	This program is licensed under the BSD license, read LICENSE.BSD
++ *	for further information.
++ *
++ */
++
++#ifndef SOLV_XFOPEN_FALLBACK_FOPENCOOKIE_H
++#define SOLV_XFOPEN_FALLBACK_FOPENCOOKIE_H
++
++#include <stdio.h>
++#include <stdint.h>
++
++typedef struct cookie_io_functions_t {
++    ssize_t (*read)(void *, char *, size_t);
++    ssize_t (*write)(void *, const char *, size_t);
++    int (*seek)(void *, off64_t, int);
++    int (*close)(void *);
++} cookie_io_functions_t;
++
++FILE *fopencookie(void *cookie, const char *mode, struct cookie_io_functions_t io);
++
++#endif
+-- 
+2.4.0
+
diff --git a/meta/recipes-extended/libsolv/libsolv_git.bb b/meta/recipes-extended/libsolv/libsolv_git.bb
index fb81c8a..a16897e 100644
--- a/meta/recipes-extended/libsolv/libsolv_git.bb
+++ b/meta/recipes-extended/libsolv/libsolv_git.bb
@@ -7,12 +7,14 @@ LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
 
 DEPENDS = "expat zlib"
 
-PV = "0.6.19"
+PV = "0.6.20"
 
 SRC_URI = "git://github.com/openSUSE/libsolv.git \
            file://0001-CMakeLists.txt-fix-MAN_INSTALL_DIR.patch \
-"
-SRCREV = "4c5af401a89858d4cebbfe40c59a0031ff9db5b0"
+          "
+SRC_URI_append_libc-musl = " file://0001-Add-fallback-fopencookie-implementation.patch"
+
+SRCREV = "513c572b10e18bea5ac78709267de4b739cb31e7"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.4.0



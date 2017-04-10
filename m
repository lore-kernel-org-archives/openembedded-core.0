Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AA36D71A3A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 20:58:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v3AKwhY3028450
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 10 Apr 2017 13:58:43 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 10 Apr 2017 13:58:43 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Apr 2017 15:58:28 -0500
Message-ID: <20170410205828.93764-2-mark.hatle@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170410205828.93764-1-mark.hatle@windriver.com>
References: <20170410205828.93764-1-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libsolve: 0001-Add-fallback-fopencookie-implementation.patch fix attribution
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
X-List-Received-Date: Mon, 10 Apr 2017 20:58:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This patch has no technical change, but attempts to properly restore the
attribution of the original patch to Neal Gompa.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 ...1-Add-fallback-fopencookie-implementation.patch | 186 +++++++++++++++++----
 1 file changed, 150 insertions(+), 36 deletions(-)

diff --git a/meta/recipes-extended/libsolv/libsolv/0001-Add-fallback-fopencookie-implementation.patch b/meta/recipes-extended/libsolv/libsolv/0001-Add-fallback-fopencookie-implementation.patch
index 851fe57569..c75611cfd8 100644
--- a/meta/recipes-extended/libsolv/libsolv/0001-Add-fallback-fopencookie-implementation.patch
+++ b/meta/recipes-extended/libsolv/libsolv/0001-Add-fallback-fopencookie-implementation.patch
@@ -1,30 +1,48 @@
-From 0a8e50f7322832efdaf33da87839fbba05a755de Mon Sep 17 00:00:00 2001
-From: "Maxin B. John" <maxin.john@intel.com>
-Date: Mon, 21 Nov 2016 11:46:00 +0200
-Subject: [PATCH] Add fallback fopencookie() implementation
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
+Add the following patch to fix build with musl:
+
+Original patch from:
+ https://patch-diff.githubusercontent.com/raw/openSUSE/libsolv/pull/112.patch
+
+Patch was original integrated (dcc5d6bc2e3e5848f36fe1001b8cb65576047b7d)
+ by Maxin B. John <maxin.john@intel.com>:
+    0.6.19 -> 0.6.20
+
+    Added the following patch to fix build with musl:
+        0001-Add-fallback-fopencookie-implementation.patch
+
+Later updated (60d6c0018c6855e669ced66c420b761d9e7ddd78)
+ by Maxin B. John <maxin.john@intel.com>:
+    libsolv: upgrade to 0.6.24
+    Refreshed the following patch:
+        a) 0001-Add-fallback-fopencookie-implementation.patch
+
+The later update modified the ext/CMakeLists.txt.
+
+Upstream-Status: Submitted [ https://github.com/openSUSE/libsolv/pull/112 ]
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+From 63ab8d928ab38f9686405d186d427f2496a9cce5 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Neal=20Gompa=20=28=E3=83=8B=E3=83=BC=E3=83=AB=E3=83=BB?=
+ =?UTF-8?q?=E3=82=B3=E3=82=99=E3=83=B3=E3=83=8F=E3=82=9A=29?=
+ <ngompa13@gmail.com>
+Date: Wed, 11 Nov 2015 20:32:17 -0500
+Subject: [PATCH 1/2] Add fallback fopencookie() implementation
 
 In environments where neither fopencookie() nor funopen()
 are implemented, we need to provide a suitable implementation
 of fopencookie() that we can use.
-
-Upstream-Status: Denied [ https://github.com/openSUSE/libsolv/pull/112 ]
-
-Signed-off-by: Neal Gompa (ニール・ゴンパ) <ngompa13@gmail.com>
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
 ---
  ext/CMakeLists.txt                     |   7 ++
  ext/solv_xfopen.c                      |  10 +--
- ext/solv_xfopen_fallback_fopencookie.c | 124 +++++++++++++++++++++++++++++++++
+ ext/solv_xfopen_fallback_fopencookie.c | 123 +++++++++++++++++++++++++++++++++
  ext/solv_xfopen_fallback_fopencookie.h |  28 ++++++++
- 4 files changed, 165 insertions(+), 4 deletions(-)
+ 4 files changed, 164 insertions(+), 4 deletions(-)
  create mode 100644 ext/solv_xfopen_fallback_fopencookie.c
  create mode 100644 ext/solv_xfopen_fallback_fopencookie.h
 
 diff --git a/ext/CMakeLists.txt b/ext/CMakeLists.txt
-index 586eda8..477a2ef 100644
+index ad52495..4f282ce 100644
 --- a/ext/CMakeLists.txt
 +++ b/ext/CMakeLists.txt
 @@ -4,6 +4,13 @@ SET (libsolvext_SRCS
@@ -38,7 +56,8 @@ index 586eda8..477a2ef 100644
 +        solv_xfopen_fallback_fopencookie.h)
 +ENDIF (NOT HAVE_FOPENCOOKIE AND NOT HAVE_FUNOPEN)
 +
- IF (ENABLE_RPMDB OR ENABLE_RPMPKG)
+-IF (ENABLE_RPMDB)
++IF (ENABLE_RPMDB OR ENABLE_RPMPKG)
      SET (libsolvext_SRCS ${libsolvext_SRCS}
          pool_fileconflicts.c repo_rpmdb.c)
 diff --git a/ext/solv_xfopen.c b/ext/solv_xfopen.c
@@ -85,17 +104,17 @@ index b0421bf..31345dd 100644
  
 diff --git a/ext/solv_xfopen_fallback_fopencookie.c b/ext/solv_xfopen_fallback_fopencookie.c
 new file mode 100644
-index 0000000..89426a9
+index 0000000..0ce2571
 --- /dev/null
 +++ b/ext/solv_xfopen_fallback_fopencookie.c
-@@ -0,0 +1,124 @@
-+/*
+@@ -0,0 +1,123 @@
++/* 
 + *	Provides a very limited fopencookie() for environments with a libc
 + *	that lacks it.
-+ *
-+ *	Authors: zhasha & nsz
++ *	
++ *	Author: zhasha
 + *	Modified for libsolv by Neal Gompa
-+ *
++ *	
 + *	This program is licensed under the BSD license, read LICENSE.BSD
 + *	for further information.
 + *
@@ -124,7 +143,7 @@ index 0000000..89426a9
 +{
 +    struct ctx *ctx = arg;
 +    ssize_t r;
-+    size_t n, k;
++    size_t n;
 +
 +    pthread_detach(pthread_self());
 +
@@ -138,18 +157,17 @@ index 0000000..89426a9
 +        }
 +        if (r == 0) { break; }
 +
-+        n = r, k = 0;
 +        while (n > 0) {
 +            r = ctx->io.write ?
-+                (ctx->io.write)(ctx->cookie, ctx->buf + k, n) :
-+                write(ctx->fd, ctx->buf + k, n);
++                (ctx->io.write)(ctx->cookie, ctx->buf + ((size_t)r - n), n) :
++                write(ctx->fd, ctx->buf + ((size_t)r - n), n);
 +            if (r < 0) {
 +                if (errno != EINTR) { break; }
 +                continue;
 +            }
 +            if (r == 0) { break; }
 +
-+            n -= r, k += r;
++            n -= (size_t)r;
 +        }
 +        if (n > 0) { break; }
 +    }
@@ -169,8 +187,8 @@ index 0000000..89426a9
 +
 +    switch (mode[0]) {
 +        case 'a':
-+        case 'w': wr = 1; break;
 +        case 'r': rd = 1; break;
++        case 'w': wr = 1; break;
 +        default:
 +            errno = EINVAL;
 +            return NULL;
@@ -215,20 +233,20 @@ index 0000000..89426a9
 +}
 diff --git a/ext/solv_xfopen_fallback_fopencookie.h b/ext/solv_xfopen_fallback_fopencookie.h
 new file mode 100644
-index 0000000..7223e3f
+index 0000000..6a7bfee
 --- /dev/null
 +++ b/ext/solv_xfopen_fallback_fopencookie.h
 @@ -0,0 +1,28 @@
-+/*
++/* 
 + *	Provides a very limited fopencookie() for environments with a libc
 + *	that lacks it.
-+ *
-+ *	Authors: zhasha & nsz
++ *	
++ *	Author: zhasha
 + *	Modified for libsolv by Neal Gompa
-+ *
++ *	
 + *	This program is licensed under the BSD license, read LICENSE.BSD
 + *	for further information.
-+ *
++ *	
 + */
 +
 +#ifndef SOLV_XFOPEN_FALLBACK_FOPENCOOKIE_H
@@ -247,6 +265,102 @@ index 0000000..7223e3f
 +FILE *fopencookie(void *cookie, const char *mode, struct cookie_io_functions_t io);
 +
 +#endif
--- 
-2.4.0
 
+From 18987b909007435ca878289d0e7d516052710f73 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Neal=20Gompa=20=28=E3=83=8B=E3=83=BC=E3=83=AB=E3=83=BB?=
+ =?UTF-8?q?=E3=82=B3=E3=82=99=E3=83=B3=E3=83=8F=E3=82=9A=29?=
+ <ngompa13@gmail.com>
+Date: Mon, 23 Nov 2015 18:19:41 -0500
+Subject: [PATCH 2/2] Fixes to internal fopencookie() implementation
+
+Credits to the fixes go to nsz on #musl on Freenode,
+who gloriously fixed the implementation such that
+the tests all pass.
+---
+ ext/solv_xfopen_fallback_fopencookie.c | 19 ++++++++++---------
+ ext/solv_xfopen_fallback_fopencookie.h | 10 +++++-----
+ 2 files changed, 15 insertions(+), 14 deletions(-)
+
+diff --git a/ext/solv_xfopen_fallback_fopencookie.c b/ext/solv_xfopen_fallback_fopencookie.c
+index 0ce2571..89426a9 100644
+--- a/ext/solv_xfopen_fallback_fopencookie.c
++++ b/ext/solv_xfopen_fallback_fopencookie.c
+@@ -1,10 +1,10 @@
+-/* 
++/*
+  *	Provides a very limited fopencookie() for environments with a libc
+  *	that lacks it.
+- *	
+- *	Author: zhasha
++ *
++ *	Authors: zhasha & nsz
+  *	Modified for libsolv by Neal Gompa
+- *	
++ *
+  *	This program is licensed under the BSD license, read LICENSE.BSD
+  *	for further information.
+  *
+@@ -33,7 +33,7 @@ static void *proxy(void *arg)
+ {
+     struct ctx *ctx = arg;
+     ssize_t r;
+-    size_t n;
++    size_t n, k;
+ 
+     pthread_detach(pthread_self());
+ 
+@@ -47,17 +47,18 @@ static void *proxy(void *arg)
+         }
+         if (r == 0) { break; }
+ 
++        n = r, k = 0;
+         while (n > 0) {
+             r = ctx->io.write ?
+-                (ctx->io.write)(ctx->cookie, ctx->buf + ((size_t)r - n), n) :
+-                write(ctx->fd, ctx->buf + ((size_t)r - n), n);
++                (ctx->io.write)(ctx->cookie, ctx->buf + k, n) :
++                write(ctx->fd, ctx->buf + k, n);
+             if (r < 0) {
+                 if (errno != EINTR) { break; }
+                 continue;
+             }
+             if (r == 0) { break; }
+ 
+-            n -= (size_t)r;
++            n -= r, k += r;
+         }
+         if (n > 0) { break; }
+     }
+@@ -77,8 +78,8 @@ FILE *fopencookie(void *cookie, const char *mode, struct cookie_io_functions_t i
+ 
+     switch (mode[0]) {
+         case 'a':
+-        case 'r': rd = 1; break;
+         case 'w': wr = 1; break;
++        case 'r': rd = 1; break;
+         default:
+             errno = EINVAL;
+             return NULL;
+diff --git a/ext/solv_xfopen_fallback_fopencookie.h b/ext/solv_xfopen_fallback_fopencookie.h
+index 6a7bfee..7223e3f 100644
+--- a/ext/solv_xfopen_fallback_fopencookie.h
++++ b/ext/solv_xfopen_fallback_fopencookie.h
+@@ -1,13 +1,13 @@
+-/* 
++/*
+  *	Provides a very limited fopencookie() for environments with a libc
+  *	that lacks it.
+- *	
+- *	Author: zhasha
++ *
++ *	Authors: zhasha & nsz
+  *	Modified for libsolv by Neal Gompa
+- *	
++ *
+  *	This program is licensed under the BSD license, read LICENSE.BSD
+  *	for further information.
+- *	
++ *
+  */
+ 
+ #ifndef SOLV_XFOPEN_FALLBACK_FOPENCOOKIE_H
-- 
2.11.0



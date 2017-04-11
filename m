Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4F73177CEE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 09:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491902601; x=1523438601;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=BiW+4So+7i6d/gRJP37x59INTcdn+e51MOjmvMS1Xk4=;
	b=hwne1DV6VR68Prvu0jS23/yYnERXzcV31iouX4pF1CbCeI8LhjAvv5ei
	8PZveGVql1bxEBRgqdbNGUvqsMVSSA==;
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Apr 2017 02:23:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,184,1488873600"; d="scan'208";a="1118111246"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 11 Apr 2017 02:23:19 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	ngompa13@gmail.com
Date: Tue, 11 Apr 2017 12:22:43 +0300
Message-Id: <20170411092243.12262-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] libsolv: correctly attribute musl fixing patches
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
X-List-Received-Date: Tue, 11 Apr 2017 09:23:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Also, they were previously squashed into a single patch; restore
the original two-patch arrangement.

As requested here:
http://lists.openembedded.org/pipermail/openembedded-core/2017-April/135460.html

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...1-Add-fallback-fopencookie-implementation.patch |  60 ++++++------
 ...es-to-internal-fopencookie-implementation.patch | 104 +++++++++++++++++++++
 meta/recipes-extended/libsolv/libsolv_0.6.26.bb    |   6 +-
 3 files changed, 137 insertions(+), 33 deletions(-)
 create mode 100644 meta/recipes-extended/libsolv/libsolv/0002-Fixes-to-internal-fopencookie-implementation.patch

diff --git a/meta/recipes-extended/libsolv/libsolv/0001-Add-fallback-fopencookie-implementation.patch b/meta/recipes-extended/libsolv/libsolv/0001-Add-fallback-fopencookie-implementation.patch
index 851fe575695..a575d0ebce7 100644
--- a/meta/recipes-extended/libsolv/libsolv/0001-Add-fallback-fopencookie-implementation.patch
+++ b/meta/recipes-extended/libsolv/libsolv/0001-Add-fallback-fopencookie-implementation.patch
@@ -1,25 +1,24 @@
-From 0a8e50f7322832efdaf33da87839fbba05a755de Mon Sep 17 00:00:00 2001
-From: "Maxin B. John" <maxin.john@intel.com>
-Date: Mon, 21 Nov 2016 11:46:00 +0200
-Subject: [PATCH] Add fallback fopencookie() implementation
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
+From 4d9b6ec30b78d00ead0a22eb5d047dcdba37e99c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Neal=20Gompa=20=28=E3=83=8B=E3=83=BC=E3=83=AB=E3=83=BB?=
+ =?UTF-8?q?=E3=82=B3=E3=82=99=E3=83=B3=E3=83=8F=E3=82=9A=29?=
+ <ngompa13@gmail.com>
+Date: Wed, 11 Nov 2015 20:32:17 -0500
+Subject: [PATCH 1/2] Add fallback fopencookie() implementation
 
 In environments where neither fopencookie() nor funopen()
 are implemented, we need to provide a suitable implementation
 of fopencookie() that we can use.
 
-Upstream-Status: Denied [ https://github.com/openSUSE/libsolv/pull/112 ]
+Alex Kanavin: rebased CMakeLists.txt change to apply to latest upstream code.
 
-Signed-off-by: Neal Gompa (ニール・ゴンパ) <ngompa13@gmail.com>
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
+Upstream-Status: Denied [https://github.com/openSUSE/libsolv/pull/112]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
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
 
@@ -85,17 +84,17 @@ index b0421bf..31345dd 100644
  
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
@@ -124,7 +123,7 @@ index 0000000..89426a9
 +{
 +    struct ctx *ctx = arg;
 +    ssize_t r;
-+    size_t n, k;
++    size_t n;
 +
 +    pthread_detach(pthread_self());
 +
@@ -138,18 +137,17 @@ index 0000000..89426a9
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
@@ -169,8 +167,8 @@ index 0000000..89426a9
 +
 +    switch (mode[0]) {
 +        case 'a':
-+        case 'w': wr = 1; break;
 +        case 'r': rd = 1; break;
++        case 'w': wr = 1; break;
 +        default:
 +            errno = EINVAL;
 +            return NULL;
@@ -215,20 +213,20 @@ index 0000000..89426a9
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
@@ -248,5 +246,5 @@ index 0000000..7223e3f
 +
 +#endif
 -- 
-2.4.0
+2.11.0
 
diff --git a/meta/recipes-extended/libsolv/libsolv/0002-Fixes-to-internal-fopencookie-implementation.patch b/meta/recipes-extended/libsolv/libsolv/0002-Fixes-to-internal-fopencookie-implementation.patch
new file mode 100644
index 00000000000..efb4e3ad7ef
--- /dev/null
+++ b/meta/recipes-extended/libsolv/libsolv/0002-Fixes-to-internal-fopencookie-implementation.patch
@@ -0,0 +1,104 @@
+From 99b10cdf6a0f8a24e1670c1813b1d9563ae3f5b5 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Neal=20Gompa=20=28=E3=83=8B=E3=83=BC=E3=83=AB=E3=83=BB?=
+ =?UTF-8?q?=E3=82=B3=E3=82=99=E3=83=B3=E3=83=8F=E3=82=9A=29?=
+ <ngompa13@gmail.com>
+Date: Mon, 23 Nov 2015 18:19:41 -0500
+Subject: [PATCH 2/2] Fixes to internal fopencookie() implementation
+
+Credits to the fixes go to nsz on #musl on Freenode,
+who gloriously fixed the implementation such that
+the tests all pass.
+
+Upstream-Status: Denied [https://github.com/openSUSE/libsolv/pull/112]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
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
+-- 
+2.11.0
+
diff --git a/meta/recipes-extended/libsolv/libsolv_0.6.26.bb b/meta/recipes-extended/libsolv/libsolv_0.6.26.bb
index c90f5834f5b..42d63aeb136 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.6.26.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.6.26.bb
@@ -8,8 +8,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
 DEPENDS = "expat zlib rpm"
 
 SRC_URI = "git://github.com/openSUSE/libsolv.git \
-          "
-SRC_URI_append_libc-musl = " file://0001-Add-fallback-fopencookie-implementation.patch"
+           "
+SRC_URI_append_libc-musl = " file://0001-Add-fallback-fopencookie-implementation.patch \
+                             file://0002-Fixes-to-internal-fopencookie-implementation.patch \
+                           "
 
 SRCREV = "ba32f8286d3deec6faaabc79762a4760e9af0a07"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.11.0



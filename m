Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id ADF7A73C60
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Apr 2015 17:37:12 +0000 (UTC)
Received: by igblo3 with SMTP id lo3so25068150igb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Apr 2015 10:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=m2K+A/O3wurJEwrC3GUo/wFB94+gWmGwraI7LT8Lqc8=;
	b=L16Pm0/HigxJxvMBMuYHS+l35rCXbgIgb9xXIkRgyCjHgWT8UIFv9VWdWTw7YOHJUC
	VqiiofRWCe43QJ47ZV8pISuWUWRefD85KGt59xeiaDRjPuhMmmGt638tUrqYydkWVNVw
	8dOJOn6bAR6AqPtRmyxsdBkMqo6fw0r5+ZH/5WONBcXsgquOUx9/k0fyx0+OyGAaaem0
	CEqyUhS5XV0Igz7rPQjW+GhyRPzt8r44bB0UP8rV8RSam0oJjElAlvb99J+KjaujifQQ
	3DDTlJXridrvDiT81GxbwiBLqcQhZYgcg5fJc2ulR7QWuTg7JFh1Vd8E6d8ruPSX7DvW
	XeEw==
X-Received: by 10.50.41.66 with SMTP id d2mr39553071igl.38.1428341834010;
	Mon, 06 Apr 2015 10:37:14 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id 7sm3063135iol.43.2015.04.06.10.37.13
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Apr 2015 10:37:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Apr 2015 17:36:46 +0000
Message-Id: <704d682f8aa5c1468491aae7a6355e181a1b99dc.1428341478.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
References: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
In-Reply-To: <cover.1428341477.git.raj.khem@gmail.com>
References: <cover.1428341477.git.raj.khem@gmail.com>
Subject: [PATCH 18/24] mesa: Fix building with musl
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
X-List-Received-Date: Mon, 06 Apr 2015 17:37:12 -0000

backport needed patches
add a patch to use _NP macros only on glibc
based linux and not on all linux

Change-Id: Ib43bec9d222856f8e7acb9f0143b406517f049c8
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...D_MUTEX_RECURSIVE_NP-is-specific-to-glibc.patch | 29 ++++++++++++
 ...002-mesa-simplify-detection-of-fpclassify.patch | 53 ++++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa_10.4.4.bb          |  5 +-
 3 files changed, 86 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/mesa/mesa/0001-PTHREAD_MUTEX_RECURSIVE_NP-is-specific-to-glibc.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa/0002-mesa-simplify-detection-of-fpclassify.patch

diff --git a/meta/recipes-graphics/mesa/mesa/0001-PTHREAD_MUTEX_RECURSIVE_NP-is-specific-to-glibc.patch b/meta/recipes-graphics/mesa/mesa/0001-PTHREAD_MUTEX_RECURSIVE_NP-is-specific-to-glibc.patch
new file mode 100644
index 0000000..52443d8
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa/0001-PTHREAD_MUTEX_RECURSIVE_NP-is-specific-to-glibc.patch
@@ -0,0 +1,29 @@
+From 46cdd464efbada13478f5e39a50aef85599ff91b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 4 Apr 2015 15:50:53 -0700
+Subject: [PATCH 1/2] PTHREAD_MUTEX_RECURSIVE_NP is specific to glibc
+
+use glibc guard around it
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+---
+ include/c11/threads_posix.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/c11/threads_posix.h b/include/c11/threads_posix.h
+index f9c165d..c641de4 100644
+--- a/include/c11/threads_posix.h
++++ b/include/c11/threads_posix.h
+@@ -178,7 +178,7 @@ mtx_init(mtx_t *mtx, int type)
+         return thrd_error;
+     pthread_mutexattr_init(&attr);
+     if ((type & mtx_recursive) != 0) {
+-#if defined(__linux__) || defined(__linux)
++#if defined __GLIBC__ && (defined(__linux__) || defined(__linux))
+         pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE_NP);
+ #else
+         pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
+-- 
+2.1.4
+
diff --git a/meta/recipes-graphics/mesa/mesa/0002-mesa-simplify-detection-of-fpclassify.patch b/meta/recipes-graphics/mesa/mesa/0002-mesa-simplify-detection-of-fpclassify.patch
new file mode 100644
index 0000000..dd7a188
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa/0002-mesa-simplify-detection-of-fpclassify.patch
@@ -0,0 +1,53 @@
+From c09606093c6b8e47d7cb6745eff192184eaaae07 Mon Sep 17 00:00:00 2001
+From: Felix Janda <felix.janda@posteo.de>
+Date: Fri, 23 Jan 2015 17:57:15 +0100
+Subject: [PATCH 2/2] mesa: simplify detection of fpclassify
+
+Fixes compilation with musl libc.
+
+Reviewed-by: Ian Romanick <ian.d.romanick@intel.com>
+Upstream-Status: Backport
+---
+ src/mesa/main/querymatrix.c | 18 +++++++-----------
+ 1 file changed, 7 insertions(+), 11 deletions(-)
+
+diff --git a/src/mesa/main/querymatrix.c b/src/mesa/main/querymatrix.c
+index eb36c76..ef85175 100644
+--- a/src/mesa/main/querymatrix.c
++++ b/src/mesa/main/querymatrix.c
+@@ -37,8 +37,12 @@
+ #define INT_TO_FIXED(x) ((GLfixed) ((x) << 16))
+ #define FLOAT_TO_FIXED(x) ((GLfixed) ((x) * 65536.0))
+ 
+-#if defined(_MSC_VER)
+-#if _MSC_VER < 1800  /* Not required on VS2013 and above. */
++#if defined(fpclassify)
++/* ISO C99 says that fpclassify is a macro.  Assume that any implementation
++ * of fpclassify, whether it's in a C99 compiler or not, will be a macro.
++ */
++#elif defined(_MSC_VER)
++/* Not required on VS2013 and above. */
+ /* Oddly, the fpclassify() function doesn't exist in such a form
+  * on MSVC.  This is an implementation using slightly different
+  * lower-level Windows functions.
+@@ -71,16 +75,8 @@ fpclassify(double x)
+             return FP_NAN;
+     }
+ }
+-#endif  /* _MSC_VER < 1800 */
+-
+-#elif defined(__APPLE__) || defined(__CYGWIN__) || defined(__FreeBSD__) || \
+-     defined(__OpenBSD__) || defined(__NetBSD__) || defined(__DragonFly__) || \
+-     (defined(__sun) && defined(__C99FEATURES__)) || defined(__MINGW32__) || \
+-     (defined(__sun) && defined(__GNUC__)) || defined(ANDROID) || defined(__HAIKU__)
+-
+-/* fpclassify is available. */
+ 
+-#elif !defined(_XOPEN_SOURCE) || _XOPEN_SOURCE < 600
++#else
+ 
+ enum {FP_NAN, FP_INFINITE, FP_ZERO, FP_SUBNORMAL, FP_NORMAL}
+ fpclassify(double x)
+-- 
+2.1.4
+
diff --git a/meta/recipes-graphics/mesa/mesa_10.4.4.bb b/meta/recipes-graphics/mesa/mesa_10.4.4.bb
index 8140411..8472408 100644
--- a/meta/recipes-graphics/mesa/mesa_10.4.4.bb
+++ b/meta/recipes-graphics/mesa/mesa_10.4.4.bb
@@ -1,6 +1,9 @@
 require ${BPN}.inc
 
-SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2"
+SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
+           file://0001-PTHREAD_MUTEX_RECURSIVE_NP-is-specific-to-glibc.patch \
+	   file://0002-mesa-simplify-detection-of-fpclassify.patch \
+          "
 
 SRC_URI[md5sum] = "62faf98ac79c5587f8e917e187419e6c"
 SRC_URI[sha256sum] = "f18a967e9c4d80e054b2fdff8c130ce6e6d1f8eecfc42c9f354f8628d8b4df1c"
-- 
2.1.4



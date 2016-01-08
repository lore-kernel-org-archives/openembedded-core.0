Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id D7D4976809
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:42 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id n135so198827025qka.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=chovNVE85Ir3YLQyqm1pG2YrQPnh1hCUaSZB/Z6e/pU=;
	b=MtviAOWf1thC+nPYzF8i/eY7HlKp3/OTL29Xu7QSraP6fdNIx8IRgk69/hDKjzWLI0
	lvWeMX2IMnL6eERCZk0hucwmJN76qoaJguYc4H36pf0jL/USFH06CTqb/HHzEY4KOfuz
	YfyGJ4LhwSJTo2xHqGmtEkS/L8IW0dvv/GqxpAKLTp5FThCtJQuwfLNEPDgCzdABFCvT
	Vz8lAltvWB99NPMPA2CYVFwBbM4sg1sp+thbJIWlddXUQey04/M8Edqa5vbGOyJXwrBf
	opKO7zQKfz4HfRAT95ckL16uma1jLy7OytIRLNdXN89J+x/6HymOQakcvxjBr24hUShV
	090Q==
X-Received: by 10.55.204.135 with SMTP id n7mr90573006qkl.36.1452248383553;
	Fri, 08 Jan 2016 02:19:43 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:18:52 +0000
Message-Id: <555844c65d44169bb4478d4470a802ebc2fe2f94.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 24/53] directfb: Fix build with musl
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:43 -0000

compar_fn_t, sigval_t and non-posix recursive mutexes
are not available in musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/directfb/directfb.inc        |  5 ++
 .../directfb/directfb/compar_fn_t.patch            | 62 ++++++++++++++++++++++
 .../directfb/directfb/union-sigval.patch           | 19 +++++++
 .../directfb/use-PTHREAD_MUTEX_RECURSIVE.patch     | 19 +++++++
 4 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-graphics/directfb/directfb/compar_fn_t.patch
 create mode 100644 meta/recipes-graphics/directfb/directfb/union-sigval.patch
 create mode 100644 meta/recipes-graphics/directfb/directfb/use-PTHREAD_MUTEX_RECURSIVE.patch

diff --git a/meta/recipes-graphics/directfb/directfb.inc b/meta/recipes-graphics/directfb/directfb.inc
index 603aba3..3a79a8f 100644
--- a/meta/recipes-graphics/directfb/directfb.inc
+++ b/meta/recipes-graphics/directfb/directfb.inc
@@ -16,7 +16,12 @@ SRC_URI = "http://www.directfb.org/downloads/Core/DirectFB-1.7/DirectFB-${PV}.ta
            file://fusion.patch \
            file://bashism.patch \
            file://0001-gfx-direct-Aboid-usng-VLAs-and-printf-formats.patch \
+           file://compar_fn_t.patch \
           "
+SRC_URI_append_libc-musl = "\
+                            file://union-sigval.patch \
+                            file://use-PTHREAD_MUTEX_RECURSIVE.patch \
+                           "
 
 S = "${WORKDIR}/DirectFB-${PV}"
 
diff --git a/meta/recipes-graphics/directfb/directfb/compar_fn_t.patch b/meta/recipes-graphics/directfb/directfb/compar_fn_t.patch
new file mode 100644
index 0000000..ee4d900
--- /dev/null
+++ b/meta/recipes-graphics/directfb/directfb/compar_fn_t.patch
@@ -0,0 +1,62 @@
+test for __compar_fn_t and if not defined by libc then define it
+help make directfb compile with musl
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: DirectFB-1.7.7/configure.in
+===================================================================
+--- DirectFB-1.7.7.orig/configure.in
++++ DirectFB-1.7.7/configure.in
+@@ -112,6 +112,17 @@ AC_CHECK_SIZEOF(long)
+ AC_CHECK_SIZEOF(long long)
+ AC_CHECK_FUNCS(fork)
+ 
++AC_CACHE_CHECK([for compar_fn_t in stdlib.h],ccache_cv_COMPAR_FN_T, [
++    AC_TRY_COMPILE(
++        [#include <stdlib.h>],
++        [void test_fn(void) { qsort(NULL, 0, 0, (__compar_fn_t)NULL); }],
++        ccache_cv_COMPAR_FN_T=yes,
++        ccache_cv_COMPAR_FN_T=no)])
++if test x"$ccache_cv_COMPAR_FN_T" = x"yes"; then
++   AC_DEFINE(HAVE_COMPAR_FN_T, 1,
++             Define to 1 if you have the `__compar_fn_t' typedef.)
++fi
++
+ AC_PATH_PROGS(PERL, perl5 perl)
+ 
+ AC_PATH_PROG(MAN2HTML, man2html, no)
+Index: DirectFB-1.7.7/inputdrivers/lirc/lirc.c
+===================================================================
+--- DirectFB-1.7.7.orig/inputdrivers/lirc/lirc.c
++++ DirectFB-1.7.7/inputdrivers/lirc/lirc.c
+@@ -59,6 +59,11 @@
+ 
+ #include <core/input_driver.h>
+ 
++#if HAVE_COMPAR_FN_T
++#define COMPAR_FN_T __compar_fn_t
++#else
++typedef int (*COMPAR_FN_T)(const void *, const void *);
++#endif
+ 
+ DFB_INPUT_DRIVER( lirc )
+ 
+@@ -97,7 +102,7 @@ static DFBInputDeviceKeySymbol lirc_pars
+           qsort ( keynames,
+                   D_ARRAY_SIZE( keynames ),
+                   sizeof(keynames[0]),
+-                  (__compar_fn_t) keynames_sort_compare );
++                  (COMPAR_FN_T) keynames_sort_compare );
+           keynames_sorted = true;
+      }
+ 
+@@ -124,7 +129,7 @@ static DFBInputDeviceKeySymbol lirc_pars
+                symbol_name = bsearch( name, keynames,
+                                       D_ARRAY_SIZE( keynames ),
+                                       sizeof(keynames[0]),
+-                                      (__compar_fn_t) keynames_compare );
++                                      (COMPAR_FN_T) keynames_compare );
+                if (symbol_name)
+                     return symbol_name->symbol;
+                break;
diff --git a/meta/recipes-graphics/directfb/directfb/union-sigval.patch b/meta/recipes-graphics/directfb/directfb/union-sigval.patch
new file mode 100644
index 0000000..29f45c7
--- /dev/null
+++ b/meta/recipes-graphics/directfb/directfb/union-sigval.patch
@@ -0,0 +1,19 @@
+This patch is taken from gentoo musl overlay
+sigval_t is glibc only construct, we use a union of sigval
+which pretty much is same effect as sigval_t
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+diff -Naur DirectFB-1.7.6.orig/lib/direct/os/linux/glibc/system.c DirectFB-1.7.6/lib/direct/os/linux/glibc/system.c
+--- DirectFB-1.7.6.orig/lib/direct/os/linux/glibc/system.c	2014-07-15 02:54:58.000000000 -0400
++++ DirectFB-1.7.6/lib/direct/os/linux/glibc/system.c	2015-07-18 16:55:35.077989166 -0400
+@@ -111,7 +111,7 @@
+ void
+ direct_trap( const char *domain, int sig )
+ {
+-     sigval_t val;
++     union sigval val;
+ 
+      if (direct_config->delay_trap_ms) {
+           D_LOG( Direct_Trap, VERBOSE, "NOT RAISING signal %d from %s, waiting for %dms... attach gdb --pid=%d\n", sig, domain, direct_config->delay_trap_ms, getpid() );
diff --git a/meta/recipes-graphics/directfb/directfb/use-PTHREAD_MUTEX_RECURSIVE.patch b/meta/recipes-graphics/directfb/directfb/use-PTHREAD_MUTEX_RECURSIVE.patch
new file mode 100644
index 0000000..e65f59e
--- /dev/null
+++ b/meta/recipes-graphics/directfb/directfb/use-PTHREAD_MUTEX_RECURSIVE.patch
@@ -0,0 +1,19 @@
+This patch is taken from gentoo musl overlay
+uses recursive mutex directly instead of non-posix version
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+
+diff -Naur DirectFB-1.7.6.orig/lib/direct/os/linux/glibc/mutex.h DirectFB-1.7.6/lib/direct/os/linux/glibc/mutex.h
+--- DirectFB-1.7.6.orig/lib/direct/os/linux/glibc/mutex.h	2013-12-18 19:16:24.000000000 -0500
++++ DirectFB-1.7.6/lib/direct/os/linux/glibc/mutex.h	2015-07-18 16:57:47.178982835 -0400
+@@ -46,7 +46,7 @@
+ /**********************************************************************************************************************/
+ 
+ #define DIRECT_MUTEX_INITIALIZER(name)            { PTHREAD_MUTEX_INITIALIZER }
+-#define DIRECT_RECURSIVE_MUTEX_INITIALIZER(name)  { PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP }
++#define DIRECT_RECURSIVE_MUTEX_INITIALIZER(name)  { PTHREAD_MUTEX_RECURSIVE }
+ 
+ #endif
+ 
-- 
2.7.0



Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id B4094731AE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:20 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id 65so142172525pff.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=1SV+J66qbTfoXYqqEE+q9gVavTorJYVrKkbC8EvMgGg=;
	b=EWn/mwN0tqH62zGC7czy9BzFhWDAnqXUWHRzsN/iah1yNYYVJY2ig93AlJoCjeHIF+
	Vmw5Z48aKjoxE62IIkcDQiMPTiI6PDQImf+nZT5FApBo+3iQBJh0l9a6GWuaaXCPLRUq
	YBejqFhW4tYnDsGvUSUoeThuJ99LHTqNIQ37aNTPX+nxvglG7up5UDOVRaLpIdlfOFoC
	mJCk/9H82FvIVTJVjJNMZV/y3IA6g8aNdJ3mruvxilW+ltkCS4u91SFEtkJR2X+MtMYE
	MOUpgNlk0OZk/3EUZ+gfgbOqoTEpUp8K6gcJ9SAbPjzdNec6QPqU8Ccoxbg0dfwehMag
	3c/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=1SV+J66qbTfoXYqqEE+q9gVavTorJYVrKkbC8EvMgGg=;
	b=R5Jr0kPx2vz9VPmxwYMTHW/KLRjsjAbH0PSA0+enWbr2PWxr0VUqgoJgtxZVhyC1Bm
	27w2fWmXwjKeyZjjR/AzvYW09iC8XNIM6hOWsh/LKKz/yYQqxvxvZR0KqzBwyhyhZyc1
	H1GE51Rv+lPX1er9aKmIDZWsc8GZdf4JVkpGamMChsV66JIsKZc+jn9oLndsIe9crEcR
	a/+Q09fvBTIpU/bzvf976yYo9j/6CG9hKK96NLavW/QXFLqQiTOPXowR2RXqWCr2urVz
	Eh+ZQV/aUeQqXhf5QmNW5D6oC1fSj70wMEyKIsLX3O4p7mqrjb/JELxtrhNaCp1Sp/mZ
	BlOg==
X-Gm-Message-State: ALoCoQl/guJ95Jv4vSVOWFVmjylHmMUEOcquuRYK3possW8ZuM7HIkiNuHAQHpQ3FFKdZ5TH+0tkf+gmU2Xf6gCwVCoTPJc3kw==
X-Received: by 10.98.79.140 with SMTP id f12mr28875355pfj.102.1453030641766;
	Sun, 17 Jan 2016 03:37:21 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:35:56 -0800
Message-Id: <70963c1a2a4650c166623acfff2e51ffee8169dd.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 23/73] directfb: Fix build with musl
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:20 -0000

compar_fn_t, sigval_t and non-posix recursive mutexes
are not available in musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/directfb/directfb.inc        |   3 +
 .../directfb/directfb/compar_fn_t.patch            |  62 +++++++++++
 .../directfb/directfb/union-sigval.patch           |  19 ++++
 .../directfb/use-PTHREAD_MUTEX_RECURSIVE.patch     | 116 +++++++++++++++++++++
 4 files changed, 200 insertions(+)
 create mode 100644 meta/recipes-graphics/directfb/directfb/compar_fn_t.patch
 create mode 100644 meta/recipes-graphics/directfb/directfb/union-sigval.patch
 create mode 100644 meta/recipes-graphics/directfb/directfb/use-PTHREAD_MUTEX_RECURSIVE.patch

diff --git a/meta/recipes-graphics/directfb/directfb.inc b/meta/recipes-graphics/directfb/directfb.inc
index 603aba3..be39b83 100644
--- a/meta/recipes-graphics/directfb/directfb.inc
+++ b/meta/recipes-graphics/directfb/directfb.inc
@@ -16,6 +16,9 @@ SRC_URI = "http://www.directfb.org/downloads/Core/DirectFB-1.7/DirectFB-${PV}.ta
            file://fusion.patch \
            file://bashism.patch \
            file://0001-gfx-direct-Aboid-usng-VLAs-and-printf-formats.patch \
+           file://compar_fn_t.patch \
+           file://union-sigval.patch \
+           file://use-PTHREAD_MUTEX_RECURSIVE.patch \
           "
 
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
index 0000000..ac48f68
--- /dev/null
+++ b/meta/recipes-graphics/directfb/directfb/use-PTHREAD_MUTEX_RECURSIVE.patch
@@ -0,0 +1,116 @@
+Remove use of DIRECT_RECURSIVE_MUTEX_INITIALIZER its not portable
+use portable way to initialize recursive mutex using pthread_once() and direct_recursive_mutex_init()
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Index: DirectFB-1.7.7/lib/direct/os/linux/glibc/mutex.h
+===================================================================
+--- DirectFB-1.7.7.orig/lib/direct/os/linux/glibc/mutex.h
++++ DirectFB-1.7.7/lib/direct/os/linux/glibc/mutex.h
+@@ -46,7 +46,6 @@ struct __D_DirectMutex {
+ /**********************************************************************************************************************/
+ 
+ #define DIRECT_MUTEX_INITIALIZER(name)            { PTHREAD_MUTEX_INITIALIZER }
+-#define DIRECT_RECURSIVE_MUTEX_INITIALIZER(name)  { PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP }
+ 
+ #endif
+ 
+Index: DirectFB-1.7.7/lib/direct/trace.c
+===================================================================
+--- DirectFB-1.7.7.orig/lib/direct/trace.c
++++ DirectFB-1.7.7/lib/direct/trace.c
+@@ -89,8 +89,15 @@ struct __D_DirectTraceBuffer {
+ /**************************************************************************************************/
+ 
+ static DirectLink  *buffers;
+-static DirectMutex  buffers_lock = DIRECT_RECURSIVE_MUTEX_INITIALIZER(buffers_lock);
+ 
++static pthread_once_t buffers_lock_init_once = PTHREAD_ONCE_INIT;
++static DirectMutex buffers_lock;
++
++static void
++buffers_lock_init( void )
++{
++     direct_recursive_mutex_init(&buffers_lock);
++}
+ /**************************************************************************************************/
+ 
+ __dfb_no_instrument_function__
+@@ -113,6 +120,7 @@ get_trace_buffer( void )
+ 
+           D_MAGIC_SET( buffer, DirectTraceBuffer );
+ 
++          pthread_once(&buffers_lock_init_once, buffers_lock_init);
+           direct_mutex_lock( &buffers_lock );
+           direct_list_append( &buffers, &buffer->link );
+           direct_mutex_unlock( &buffers_lock );
+@@ -138,8 +146,14 @@ typedef struct {
+ } SymbolTable;
+ 
+ static DirectLink  *tables      = NULL;
+-static DirectMutex  tables_lock = DIRECT_RECURSIVE_MUTEX_INITIALIZER(tables_lock);
++static pthread_once_t tables_lock_init_once = PTHREAD_ONCE_INIT;
++static DirectMutex tables_lock;
+ 
++static void
++tables_lock_init( void )
++{
++     direct_recursive_mutex_init(&tabless_lock);
++}
+ 
+ __dfb_no_instrument_function__
+ static void
+@@ -370,6 +384,7 @@ direct_trace_lookup_symbol( const char *
+      Symbol      *symbol;
+      SymbolTable *table;
+ 
++     pthread_once(&tables_lock_init_once, tables_lock_init);
+      direct_mutex_lock( &tables_lock );
+ 
+      table = find_table( filename );
+@@ -514,6 +529,7 @@ direct_trace_print_stacks()
+      DirectTraceBuffer *b;
+      DirectTraceBuffer *buffer = get_trace_buffer();
+ 
++     pthread_once(&buffers_lock_init_once, buffers_lock_init);
+      direct_mutex_lock( &buffers_lock );
+ 
+      if (buffer && buffer->level)
+@@ -611,6 +627,7 @@ direct_trace_free_buffer( DirectTraceBuf
+      D_MAGIC_ASSERT( buffer, DirectTraceBuffer );
+ 
+      if (buffer->thread) {
++          pthread_once(&buffers_lock_init_once, buffers_lock_init);
+           direct_mutex_lock( &buffers_lock );
+           direct_list_remove( &buffers, &buffer->link );
+           direct_mutex_unlock( &buffers_lock );
+Index: DirectFB-1.7.7/src/directfb.c
+===================================================================
+--- DirectFB-1.7.7.orig/src/directfb.c
++++ DirectFB-1.7.7/src/directfb.c
+@@ -99,6 +99,15 @@ const unsigned int directfb_micro_versio
+ const unsigned int directfb_binary_age    = DIRECTFB_BINARY_AGE;
+ const unsigned int directfb_interface_age = DIRECTFB_INTERFACE_AGE;
+ 
++static pthread_once_t lock_init_once = PTHREAD_ONCE_INIT;
++static DirectMutex lock;
++
++static void
++lock_init( void )
++{
++     direct_recursive_mutex_init(&lock);
++}
++
+ const char *
+ DirectFBCheckVersion( unsigned int required_major,
+                       unsigned int required_minor,
+@@ -215,8 +224,7 @@ DirectFBCreate( IDirectFB **interface_pt
+      if (dfb_config->remote.host)
+           return CreateRemote( dfb_config->remote.host, dfb_config->remote.port, interface_ptr );
+ 
+-     static DirectMutex lock = DIRECT_RECURSIVE_MUTEX_INITIALIZER(lock);
+-
++     pthread_once(&lock_init_once, lock_init);
+      direct_mutex_lock( &lock );
+ 
+      if (!dfb_config->no_singleton && idirectfb_singleton) {
-- 
2.7.0



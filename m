Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D40287268B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Dec 2014 05:10:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBN5A66Q006362
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 21:10:06 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 22 Dec 2014 21:10:05 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Dec 2014 13:09:55 +0800
Message-ID: <fbacfe30047277ec91144a9ecba291c3879ae6e4.1419309149.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419309149.git.hongxu.jia@windriver.com>
References: <cover.1419309149.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] directfb: upgrade to 1.7.6
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
X-List-Received-Date: Tue, 23 Dec 2014 05:10:07 -0000
Content-Type: text/plain

- Drop fixsepbuild.patch which has been merged to 1.7.6
- Drop obsolete rename-no-instrument-function-macro.patch

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../directfb/directfb/fixsepbuild.patch            |  19 --
 .../rename-no-instrument-function-macro.patch      | 345 ---------------------
 .../{directfb_1.7.4.bb => directfb_1.7.6.bb}       |   8 +-
 3 files changed, 3 insertions(+), 369 deletions(-)
 delete mode 100644 meta/recipes-graphics/directfb/directfb/fixsepbuild.patch
 delete mode 100644 meta/recipes-graphics/directfb/directfb/rename-no-instrument-function-macro.patch
 rename meta/recipes-graphics/directfb/{directfb_1.7.4.bb => directfb_1.7.6.bb} (58%)

diff --git a/meta/recipes-graphics/directfb/directfb/fixsepbuild.patch b/meta/recipes-graphics/directfb/directfb/fixsepbuild.patch
deleted file mode 100644
index 94a9ba5..0000000
--- a/meta/recipes-graphics/directfb/directfb/fixsepbuild.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Fix out of tree builds
-
-Upstream-Status: Pending
-
-RP 2013/03/21
-
-Index: DirectFB-1.6.1/configure.in
-===================================================================
---- DirectFB-1.6.1.orig/configure.in	2013-03-19 01:38:28.174004720 +0000
-+++ DirectFB-1.6.1/configure.in	2013-03-21 12:18:10.253113675 +0000
-@@ -111,7 +111,7 @@
- AC_PATH_TOOL(FLUXCOMP, fluxcomp)
- AC_SUBST(FLUXCOMP)
- if test -z "$FLUXCOMP"; then
--  if ! test -e src/core/CoreDFB.cpp; then
-+  if ! test -e $srcdir/src/core/CoreDFB.cpp; then
-     AC_MSG_ERROR([
- *** DirectFB compilation requires fluxcomp ***
- 
diff --git a/meta/recipes-graphics/directfb/directfb/rename-no-instrument-function-macro.patch b/meta/recipes-graphics/directfb/directfb/rename-no-instrument-function-macro.patch
deleted file mode 100644
index 443df5a..0000000
--- a/meta/recipes-graphics/directfb/directfb/rename-no-instrument-function-macro.patch
+++ /dev/null
@@ -1,345 +0,0 @@
-Rename __no_instrument_function__ macro to avoid conficting redefinitions
-of the same symbol.
-
-Upstream-Status: Pending
-Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
-
-Index: DirectFB-1.6.1/lib/direct/clock.c
-===================================================================
---- DirectFB-1.6.1.orig/lib/direct/clock.c	2012-06-29 19:01:11.000000000 +0300
-+++ DirectFB-1.6.1/lib/direct/clock.c	2013-01-05 18:03:24.000000000 +0200
-@@ -36,28 +36,28 @@
- 
- /**********************************************************************************************************************/
- 
--__no_instrument_function__
-+__dfb_no_instrument_function__
- long long
- direct_clock_get_micros( void )
- {
-      return direct_clock_get_time( DIRECT_CLOCK_SESSION );
- }
- 
--__no_instrument_function__
-+__dfb_no_instrument_function__
- long long
- direct_clock_get_millis( void )
- {
-      return direct_clock_get_time( DIRECT_CLOCK_SESSION ) / 1000LL;
- }
- 
--__no_instrument_function__
-+__dfb_no_instrument_function__
- long long
- direct_clock_get_abs_micros( void )
- {
-      return direct_clock_get_time( DIRECT_CLOCK_REALTIME );
- }
- 
--__no_instrument_function__
-+__dfb_no_instrument_function__
- long long
- direct_clock_get_abs_millis( void )
- {
-Index: DirectFB-1.6.1/lib/direct/debug.c
-===================================================================
---- DirectFB-1.6.1.orig/lib/direct/debug.c	2012-06-29 19:01:11.000000000 +0300
-+++ DirectFB-1.6.1/lib/direct/debug.c	2013-01-05 18:03:49.000000000 +0200
-@@ -48,7 +48,7 @@
- 
- #if DIRECT_BUILD_DEBUGS  /* Build with debug support? */
-   
--__no_instrument_function__
-+__dfb_no_instrument_function__
- void
- direct_debug_log( DirectLogDomain *domain,
-               unsigned int     debug_level,  /* 1-9, 0 = info */
-@@ -63,7 +63,7 @@
-      va_end( ap );
- }
- 
--__no_instrument_function__
-+__dfb_no_instrument_function__
- void
- direct_debug_at( DirectLogDomain *domain,
-                  const char      *format, ... )
-@@ -77,7 +77,7 @@
- 
- #endif /* DIRECT_BUILD_DEBUGS */
- 
--__no_instrument_function__
-+__dfb_no_instrument_function__
- void
- direct_debug_at_always( DirectLogDomain *domain,
-                         const char      *format, ... )
-@@ -93,7 +93,7 @@
- 
- #if DIRECT_BUILD_DEBUGS  /* Build with debug support? */
- 
--__no_instrument_function__
-+__dfb_no_instrument_function__
- void
- direct_break( const char *func,
-               const char *file,
-@@ -123,7 +123,7 @@
-           direct_trap( "Break", SIGABRT );
- }
- 
--__no_instrument_function__
-+__dfb_no_instrument_function__
- void
- direct_assertion( const char *exp,
-                   const char *func,
-@@ -144,7 +144,7 @@
-           direct_trap( "Assertion", SIGTRAP );
- }
- 
--__no_instrument_function__
-+__dfb_no_instrument_function__
- void
- direct_assumption( const char *exp,
-                    const char *func,
-Index: DirectFB-1.6.1/lib/direct/interface.c
-===================================================================
---- DirectFB-1.6.1.orig/lib/direct/interface.c	2012-06-29 19:01:11.000000000 +0300
-+++ DirectFB-1.6.1/lib/direct/interface.c	2013-01-05 18:04:56.000000000 +0200
-@@ -522,7 +522,7 @@
- 
- /**************************************************************************************************/
- 
--__no_instrument_function__
-+__dfb_no_instrument_function__
- static InterfaceDesc *
- allocate_interface_desc( void )
- {
-@@ -543,7 +543,7 @@
-      return &alloc_list[alloc_count++];
- }
- 
--__no_instrument_function__
-+__dfb_no_instrument_function__
- static __inline__ void
- fill_interface_desc( InterfaceDesc     *desc,
-                      const void        *interface_ptr,
-@@ -565,7 +565,7 @@
- 
- /**************************************************************************************************/
- 
--__no_instrument_function__
-+__dfb_no_instrument_function__
- void
- direct_dbg_interface_add( const char *func,
-                           const char *file,
-@@ -586,7 +586,7 @@
-      direct_mutex_unlock( &alloc_lock );
- }
- 
--__no_instrument_function__
-+__dfb_no_instrument_function__
- void
- direct_dbg_interface_remove( const char *func,
-                              const char *file,
-Index: DirectFB-1.6.1/lib/direct/log.c
-===================================================================
---- DirectFB-1.6.1.orig/lib/direct/log.c	2012-06-29 19:01:11.000000000 +0300
-+++ DirectFB-1.6.1/lib/direct/log.c	2013-01-05 18:04:18.000000000 +0200
-@@ -128,7 +128,7 @@
-      return DR_OK;
- }
- 
--__no_instrument_function__
-+__dfb_no_instrument_function__
- DirectResult
- direct_log_printf( DirectLog  *log,
-                    const char *format, ... )
-@@ -197,7 +197,7 @@
-      return DR_OK;
- }
- 
--__no_instrument_function__
-+__dfb_no_instrument_function__
- void
- direct_log_lock( DirectLog *log )
- {
-@@ -211,7 +211,7 @@
-      direct_mutex_lock( &log->lock );
- }
- 
--__no_instrument_function__
-+__dfb_no_instrument_function__
- void
- direct_log_unlock( DirectLog *log )
- {
-@@ -262,7 +262,7 @@
- 
- /**********************************************************************************************************************/
- 
--__no_instrument_function__
-+__dfb_no_instrument_function__
- DirectLog *
- direct_log_default( void )
- {
-Index: DirectFB-1.6.1/lib/direct/log_domain.c
-===================================================================
---- DirectFB-1.6.1.orig/lib/direct/log_domain.c	2012-06-29 19:01:11.000000000 +0300
-+++ DirectFB-1.6.1/lib/direct/log_domain.c	2013-01-05 18:04:38.000000000 +0200
-@@ -69,7 +69,7 @@
- 
- /**********************************************************************************************************************/
- 
--__no_instrument_function__
-+__dfb_no_instrument_function__
- static __inline__ LogDomainEntry *
- lookup_domain( const char *name, bool sub );
- 
-@@ -104,7 +104,7 @@
-      return NULL;
- }
- 
--__no_instrument_function__
-+__dfb_no_instrument_function__
- static DirectLogLevel
- check_domain( DirectLogDomain *domain );
- 
-@@ -207,7 +207,7 @@
- /* FIXME: merge following */
- 
- 
--__no_instrument_function__
-+__dfb_no_instrument_function__
- DirectResult
- direct_log_domain_vprintf( DirectLogDomain *domain,
-                            DirectLogLevel   level,
-@@ -268,7 +268,7 @@
-      return DR_OK;
- }
- 
--__no_instrument_function__
-+__dfb_no_instrument_function__
- DirectResult
- direct_log_domain_log( DirectLogDomain *domain,
-                        DirectLogLevel   level,
-Index: DirectFB-1.6.1/lib/direct/mem.c
-===================================================================
---- DirectFB-1.6.1.orig/lib/direct/mem.c	2012-06-29 19:01:11.000000000 +0300
-+++ DirectFB-1.6.1/lib/direct/mem.c	2013-01-05 18:03:08.000000000 +0200
-@@ -121,7 +121,7 @@
- 
- /**********************************************************************************************************************/
- 
--__no_instrument_function__
-+__dfb_no_instrument_function__
- static __inline__ MemDesc *
- fill_mem_desc( MemDesc *desc, int bytes, const char *func, const char *file, int line, DirectTraceBuffer *trace )
- {
-Index: DirectFB-1.6.1/lib/direct/messages.c
-===================================================================
---- DirectFB-1.6.1.orig/lib/direct/messages.c	2012-06-29 19:01:11.000000000 +0300
-+++ DirectFB-1.6.1/lib/direct/messages.c	2013-01-05 18:02:57.000000000 +0200
-@@ -40,7 +40,7 @@
- 
- #if DIRECT_BUILD_TEXT
- 
--__no_instrument_function__
-+__dfb_no_instrument_function__
- void
- direct_messages_info( const char *format, ... )
- {
-@@ -57,7 +57,7 @@
-      direct_log_printf( NULL, "(*) %s", buf );
- }
- 
--__no_instrument_function__
-+__dfb_no_instrument_function__
- void
- direct_messages_error( const char *format, ... )
- {
-@@ -76,7 +76,7 @@
-      direct_trace_print_stack( NULL );
- }
- 
--__no_instrument_function__
-+__dfb_no_instrument_function__
- void
- direct_messages_derror( DirectResult result, const char *format, ... )
- {
-@@ -95,7 +95,7 @@
-      direct_trace_print_stack( NULL );
- }
- 
--__no_instrument_function__
-+__dfb_no_instrument_function__
- void
- direct_messages_perror( int erno, const char *format, ... )
- {
-@@ -114,7 +114,7 @@
-      direct_trace_print_stack( NULL );
- }
- 
--__no_instrument_function__
-+__dfb_no_instrument_function__
- void
- direct_messages_dlerror( const char *dlerr, const char *format, ... )
- {
-@@ -133,7 +133,7 @@
-      direct_trace_print_stack( NULL );
- }
- 
--__no_instrument_function__
-+__dfb_no_instrument_function__
- void
- direct_messages_once( const char *func,
-                       const char *file,
-@@ -155,7 +155,7 @@
-      direct_trace_print_stack( NULL );
- }
- 
--__no_instrument_function__
-+__dfb_no_instrument_function__
- void
- direct_messages_unimplemented( const char *func,
-                                const char *file,
-@@ -166,7 +166,7 @@
-      direct_trace_print_stack( NULL );
- }
- 
--__no_instrument_function__
-+__dfb_no_instrument_function__
- void
- direct_messages_bug( const char *func,
-                      const char *file,
-@@ -188,7 +188,7 @@
-      direct_trace_print_stack( NULL );
- }
- 
--__no_instrument_function__
-+__dfb_no_instrument_function__
- void
- direct_messages_warn( const char *func,
-                       const char *file,
-Index: DirectFB-1.6.1/lib/direct/os/linux/glibc/types.h
-===================================================================
---- DirectFB-1.6.1.orig/lib/direct/os/linux/glibc/types.h	2012-06-29 19:01:11.000000000 +0300
-+++ DirectFB-1.6.1/lib/direct/os/linux/glibc/types.h	2013-01-05 18:06:04.000000000 +0200
-@@ -74,7 +74,7 @@
- 
- #define __inline__                      inline
- #define D_UNUSED                        __attribute__((unused))
--#define __no_instrument_function__      __attribute__((no_instrument_function))
-+#define __dfb_no_instrument_function__  __attribute__((no_instrument_function))
- #define __constructor__                 __attribute__((constructor))
- #define __destructor__                  __attribute__((destructor))
- #define __typeof__(x)                   typeof(x)
-Index: DirectFB-1.6.1/lib/direct/util.c
-===================================================================
---- DirectFB-1.6.1.orig/lib/direct/util.c	2012-06-29 19:01:11.000000000 +0300
-+++ DirectFB-1.6.1/lib/direct/util.c	2013-01-05 18:03:59.000000000 +0200
-@@ -110,7 +110,7 @@
- /*
-  * translates errno to DirectResult
-  */
--__no_instrument_function__
-+__dfb_no_instrument_function__
- DirectResult
- errno2result( int erno )
- {
diff --git a/meta/recipes-graphics/directfb/directfb_1.7.4.bb b/meta/recipes-graphics/directfb/directfb_1.7.6.bb
similarity index 58%
rename from meta/recipes-graphics/directfb/directfb_1.7.4.bb
rename to meta/recipes-graphics/directfb/directfb_1.7.6.bb
index 39b006e..d25d987 100644
--- a/meta/recipes-graphics/directfb/directfb_1.7.4.bb
+++ b/meta/recipes-graphics/directfb/directfb_1.7.6.bb
@@ -1,11 +1,9 @@
 require directfb.inc
 
-RV = "1.7-4"
+RV = "1.7-6"
 
 DEPENDS += "sysfsutils"
 
-SRC_URI += "file://fixsepbuild.patch"
-
 EXTRA_OECONF = "\
   --enable-freetype=yes \
   --enable-zlib \
@@ -19,5 +17,5 @@ EXTRA_OECONF = "\
 
 LEAD_SONAME = "libdirectfb-1.7.so.0"
 
-SRC_URI[md5sum] = "f5bdacde77fc653279819796ae11341e"
-SRC_URI[sha256sum] = "20ccd60011c788e50c940ab566943d050679067bc84dc37ca447f1b4af08481b"
+SRC_URI[md5sum] = "8a7bb06b3f58599b230b4cf314004512"
+SRC_URI[sha256sum] = "44f32bacfb842ea234599532f8481fe41b5bd2310d2bd101508eb3a5df26c9e1"
-- 
1.9.1



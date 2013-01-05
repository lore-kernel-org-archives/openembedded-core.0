Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Andrei.Gherzan@windriver.com>) id 1Tra97-000595-BL
	for openembedded-core@lists.openembedded.org;
	Sat, 05 Jan 2013 21:15:09 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r05GbtpG024065
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 5 Jan 2013 08:37:55 -0800 (PST)
Received: from localhost.localdomain (128.224.170.79) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Sat, 5 Jan 2013 08:37:54 -0800
From: Andrei Gherzan <andrei.gherzan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 5 Jan 2013 18:38:13 +0200
Message-ID: <1357403893-4155-1-git-send-email-andrei.gherzan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.170.79]
Subject: [PATCH 1/1] directfb: Rename __no_instrument_function__ macro to avoid conflicting redefinitions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 05 Jan 2013 20:15:09 -0000
Content-Type: text/plain

From: Andrei Gherzan <andrei@gherzan.ro>

The macro was renamed to __dfb_no_instrument_function__ . This will avoid build
errors while compiling gst-plugins-bad with directfb support.

This happens because gstreamer uses this macro to pass it to __attribute__. So,
if we include directfb.h before, the gstreamer definition will end up:
__attribute__ ((__attribute__((no_instrument_function)))).

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 .../rename-no-instrument-function-macro.patch      |  345 ++++++++++++++++++++
 meta/recipes-graphics/directfb/directfb_1.6.1.bb   |    5 +-
 2 files changed, 348 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/directfb/directfb/rename-no-instrument-function-macro.patch

diff --git a/meta/recipes-graphics/directfb/directfb/rename-no-instrument-function-macro.patch b/meta/recipes-graphics/directfb/directfb/rename-no-instrument-function-macro.patch
new file mode 100644
index 0000000..443df5a
--- /dev/null
+++ b/meta/recipes-graphics/directfb/directfb/rename-no-instrument-function-macro.patch
@@ -0,0 +1,345 @@
+Rename __no_instrument_function__ macro to avoid conficting redefinitions
+of the same symbol.
+
+Upstream-Status: Pending
+Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
+
+Index: DirectFB-1.6.1/lib/direct/clock.c
+===================================================================
+--- DirectFB-1.6.1.orig/lib/direct/clock.c	2012-06-29 19:01:11.000000000 +0300
++++ DirectFB-1.6.1/lib/direct/clock.c	2013-01-05 18:03:24.000000000 +0200
+@@ -36,28 +36,28 @@
+ 
+ /**********************************************************************************************************************/
+ 
+-__no_instrument_function__
++__dfb_no_instrument_function__
+ long long
+ direct_clock_get_micros( void )
+ {
+      return direct_clock_get_time( DIRECT_CLOCK_SESSION );
+ }
+ 
+-__no_instrument_function__
++__dfb_no_instrument_function__
+ long long
+ direct_clock_get_millis( void )
+ {
+      return direct_clock_get_time( DIRECT_CLOCK_SESSION ) / 1000LL;
+ }
+ 
+-__no_instrument_function__
++__dfb_no_instrument_function__
+ long long
+ direct_clock_get_abs_micros( void )
+ {
+      return direct_clock_get_time( DIRECT_CLOCK_REALTIME );
+ }
+ 
+-__no_instrument_function__
++__dfb_no_instrument_function__
+ long long
+ direct_clock_get_abs_millis( void )
+ {
+Index: DirectFB-1.6.1/lib/direct/debug.c
+===================================================================
+--- DirectFB-1.6.1.orig/lib/direct/debug.c	2012-06-29 19:01:11.000000000 +0300
++++ DirectFB-1.6.1/lib/direct/debug.c	2013-01-05 18:03:49.000000000 +0200
+@@ -48,7 +48,7 @@
+ 
+ #if DIRECT_BUILD_DEBUGS  /* Build with debug support? */
+   
+-__no_instrument_function__
++__dfb_no_instrument_function__
+ void
+ direct_debug_log( DirectLogDomain *domain,
+               unsigned int     debug_level,  /* 1-9, 0 = info */
+@@ -63,7 +63,7 @@
+      va_end( ap );
+ }
+ 
+-__no_instrument_function__
++__dfb_no_instrument_function__
+ void
+ direct_debug_at( DirectLogDomain *domain,
+                  const char      *format, ... )
+@@ -77,7 +77,7 @@
+ 
+ #endif /* DIRECT_BUILD_DEBUGS */
+ 
+-__no_instrument_function__
++__dfb_no_instrument_function__
+ void
+ direct_debug_at_always( DirectLogDomain *domain,
+                         const char      *format, ... )
+@@ -93,7 +93,7 @@
+ 
+ #if DIRECT_BUILD_DEBUGS  /* Build with debug support? */
+ 
+-__no_instrument_function__
++__dfb_no_instrument_function__
+ void
+ direct_break( const char *func,
+               const char *file,
+@@ -123,7 +123,7 @@
+           direct_trap( "Break", SIGABRT );
+ }
+ 
+-__no_instrument_function__
++__dfb_no_instrument_function__
+ void
+ direct_assertion( const char *exp,
+                   const char *func,
+@@ -144,7 +144,7 @@
+           direct_trap( "Assertion", SIGTRAP );
+ }
+ 
+-__no_instrument_function__
++__dfb_no_instrument_function__
+ void
+ direct_assumption( const char *exp,
+                    const char *func,
+Index: DirectFB-1.6.1/lib/direct/interface.c
+===================================================================
+--- DirectFB-1.6.1.orig/lib/direct/interface.c	2012-06-29 19:01:11.000000000 +0300
++++ DirectFB-1.6.1/lib/direct/interface.c	2013-01-05 18:04:56.000000000 +0200
+@@ -522,7 +522,7 @@
+ 
+ /**************************************************************************************************/
+ 
+-__no_instrument_function__
++__dfb_no_instrument_function__
+ static InterfaceDesc *
+ allocate_interface_desc( void )
+ {
+@@ -543,7 +543,7 @@
+      return &alloc_list[alloc_count++];
+ }
+ 
+-__no_instrument_function__
++__dfb_no_instrument_function__
+ static __inline__ void
+ fill_interface_desc( InterfaceDesc     *desc,
+                      const void        *interface_ptr,
+@@ -565,7 +565,7 @@
+ 
+ /**************************************************************************************************/
+ 
+-__no_instrument_function__
++__dfb_no_instrument_function__
+ void
+ direct_dbg_interface_add( const char *func,
+                           const char *file,
+@@ -586,7 +586,7 @@
+      direct_mutex_unlock( &alloc_lock );
+ }
+ 
+-__no_instrument_function__
++__dfb_no_instrument_function__
+ void
+ direct_dbg_interface_remove( const char *func,
+                              const char *file,
+Index: DirectFB-1.6.1/lib/direct/log.c
+===================================================================
+--- DirectFB-1.6.1.orig/lib/direct/log.c	2012-06-29 19:01:11.000000000 +0300
++++ DirectFB-1.6.1/lib/direct/log.c	2013-01-05 18:04:18.000000000 +0200
+@@ -128,7 +128,7 @@
+      return DR_OK;
+ }
+ 
+-__no_instrument_function__
++__dfb_no_instrument_function__
+ DirectResult
+ direct_log_printf( DirectLog  *log,
+                    const char *format, ... )
+@@ -197,7 +197,7 @@
+      return DR_OK;
+ }
+ 
+-__no_instrument_function__
++__dfb_no_instrument_function__
+ void
+ direct_log_lock( DirectLog *log )
+ {
+@@ -211,7 +211,7 @@
+      direct_mutex_lock( &log->lock );
+ }
+ 
+-__no_instrument_function__
++__dfb_no_instrument_function__
+ void
+ direct_log_unlock( DirectLog *log )
+ {
+@@ -262,7 +262,7 @@
+ 
+ /**********************************************************************************************************************/
+ 
+-__no_instrument_function__
++__dfb_no_instrument_function__
+ DirectLog *
+ direct_log_default( void )
+ {
+Index: DirectFB-1.6.1/lib/direct/log_domain.c
+===================================================================
+--- DirectFB-1.6.1.orig/lib/direct/log_domain.c	2012-06-29 19:01:11.000000000 +0300
++++ DirectFB-1.6.1/lib/direct/log_domain.c	2013-01-05 18:04:38.000000000 +0200
+@@ -69,7 +69,7 @@
+ 
+ /**********************************************************************************************************************/
+ 
+-__no_instrument_function__
++__dfb_no_instrument_function__
+ static __inline__ LogDomainEntry *
+ lookup_domain( const char *name, bool sub );
+ 
+@@ -104,7 +104,7 @@
+      return NULL;
+ }
+ 
+-__no_instrument_function__
++__dfb_no_instrument_function__
+ static DirectLogLevel
+ check_domain( DirectLogDomain *domain );
+ 
+@@ -207,7 +207,7 @@
+ /* FIXME: merge following */
+ 
+ 
+-__no_instrument_function__
++__dfb_no_instrument_function__
+ DirectResult
+ direct_log_domain_vprintf( DirectLogDomain *domain,
+                            DirectLogLevel   level,
+@@ -268,7 +268,7 @@
+      return DR_OK;
+ }
+ 
+-__no_instrument_function__
++__dfb_no_instrument_function__
+ DirectResult
+ direct_log_domain_log( DirectLogDomain *domain,
+                        DirectLogLevel   level,
+Index: DirectFB-1.6.1/lib/direct/mem.c
+===================================================================
+--- DirectFB-1.6.1.orig/lib/direct/mem.c	2012-06-29 19:01:11.000000000 +0300
++++ DirectFB-1.6.1/lib/direct/mem.c	2013-01-05 18:03:08.000000000 +0200
+@@ -121,7 +121,7 @@
+ 
+ /**********************************************************************************************************************/
+ 
+-__no_instrument_function__
++__dfb_no_instrument_function__
+ static __inline__ MemDesc *
+ fill_mem_desc( MemDesc *desc, int bytes, const char *func, const char *file, int line, DirectTraceBuffer *trace )
+ {
+Index: DirectFB-1.6.1/lib/direct/messages.c
+===================================================================
+--- DirectFB-1.6.1.orig/lib/direct/messages.c	2012-06-29 19:01:11.000000000 +0300
++++ DirectFB-1.6.1/lib/direct/messages.c	2013-01-05 18:02:57.000000000 +0200
+@@ -40,7 +40,7 @@
+ 
+ #if DIRECT_BUILD_TEXT
+ 
+-__no_instrument_function__
++__dfb_no_instrument_function__
+ void
+ direct_messages_info( const char *format, ... )
+ {
+@@ -57,7 +57,7 @@
+      direct_log_printf( NULL, "(*) %s", buf );
+ }
+ 
+-__no_instrument_function__
++__dfb_no_instrument_function__
+ void
+ direct_messages_error( const char *format, ... )
+ {
+@@ -76,7 +76,7 @@
+      direct_trace_print_stack( NULL );
+ }
+ 
+-__no_instrument_function__
++__dfb_no_instrument_function__
+ void
+ direct_messages_derror( DirectResult result, const char *format, ... )
+ {
+@@ -95,7 +95,7 @@
+      direct_trace_print_stack( NULL );
+ }
+ 
+-__no_instrument_function__
++__dfb_no_instrument_function__
+ void
+ direct_messages_perror( int erno, const char *format, ... )
+ {
+@@ -114,7 +114,7 @@
+      direct_trace_print_stack( NULL );
+ }
+ 
+-__no_instrument_function__
++__dfb_no_instrument_function__
+ void
+ direct_messages_dlerror( const char *dlerr, const char *format, ... )
+ {
+@@ -133,7 +133,7 @@
+      direct_trace_print_stack( NULL );
+ }
+ 
+-__no_instrument_function__
++__dfb_no_instrument_function__
+ void
+ direct_messages_once( const char *func,
+                       const char *file,
+@@ -155,7 +155,7 @@
+      direct_trace_print_stack( NULL );
+ }
+ 
+-__no_instrument_function__
++__dfb_no_instrument_function__
+ void
+ direct_messages_unimplemented( const char *func,
+                                const char *file,
+@@ -166,7 +166,7 @@
+      direct_trace_print_stack( NULL );
+ }
+ 
+-__no_instrument_function__
++__dfb_no_instrument_function__
+ void
+ direct_messages_bug( const char *func,
+                      const char *file,
+@@ -188,7 +188,7 @@
+      direct_trace_print_stack( NULL );
+ }
+ 
+-__no_instrument_function__
++__dfb_no_instrument_function__
+ void
+ direct_messages_warn( const char *func,
+                       const char *file,
+Index: DirectFB-1.6.1/lib/direct/os/linux/glibc/types.h
+===================================================================
+--- DirectFB-1.6.1.orig/lib/direct/os/linux/glibc/types.h	2012-06-29 19:01:11.000000000 +0300
++++ DirectFB-1.6.1/lib/direct/os/linux/glibc/types.h	2013-01-05 18:06:04.000000000 +0200
+@@ -74,7 +74,7 @@
+ 
+ #define __inline__                      inline
+ #define D_UNUSED                        __attribute__((unused))
+-#define __no_instrument_function__      __attribute__((no_instrument_function))
++#define __dfb_no_instrument_function__  __attribute__((no_instrument_function))
+ #define __constructor__                 __attribute__((constructor))
+ #define __destructor__                  __attribute__((destructor))
+ #define __typeof__(x)                   typeof(x)
+Index: DirectFB-1.6.1/lib/direct/util.c
+===================================================================
+--- DirectFB-1.6.1.orig/lib/direct/util.c	2012-06-29 19:01:11.000000000 +0300
++++ DirectFB-1.6.1/lib/direct/util.c	2013-01-05 18:03:59.000000000 +0200
+@@ -110,7 +110,7 @@
+ /*
+  * translates errno to DirectResult
+  */
+-__no_instrument_function__
++__dfb_no_instrument_function__
+ DirectResult
+ errno2result( int erno )
+ {
diff --git a/meta/recipes-graphics/directfb/directfb_1.6.1.bb b/meta/recipes-graphics/directfb/directfb_1.6.1.bb
index a6012ca..52f78c6 100644
--- a/meta/recipes-graphics/directfb/directfb_1.6.1.bb
+++ b/meta/recipes-graphics/directfb/directfb_1.6.1.bb
@@ -1,11 +1,12 @@
 require directfb.inc
 
 RV = "1.6-0"
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 DEPENDS += "sysfsutils"
 
-SRC_URI += "file://fix-compilation-with-zlib.patch"
+SRC_URI += "file://fix-compilation-with-zlib.patch \
+            file://rename-no-instrument-function-macro.patch"
 
 EXTRA_OECONF = "\
   --enable-freetype=yes \
-- 
1.7.9.5




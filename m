Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1SUd1k-0008J3-6j
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 14:08:26 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 May 2012 04:57:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="167054651"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.104.85])
	by fmsmga002.fm.intel.com with ESMTP; 16 May 2012 04:57:14 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 May 2012 14:58:32 +0300
Message-Id: <1337169512-2431-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] gnutls: update to 2.12.19
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 May 2012 12:08:26 -0000

Tested with curl in qemux86/core-image-lsb.

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 .../gnutls/gnutls-2.12.18/configure-fix.patch      |   65 ----------
 .../correct_rpl_gettimeofday_signature.patch       |   57 ---------
 .../gnutls-2.12.18/fix-gettext-version.patch       |   46 -------
 .../gnutls/gnutls-2.12.18/gnutls-openssl.patch     |  126 --------------------
 .../gnutls-2.12.18/gnutls-texinfo-euro.patch       |   18 ---
 .../gnutls/gnutls-2.12.19/configure-fix.patch      |   65 ++++++++++
 .../correct_rpl_gettimeofday_signature.patch       |   57 +++++++++
 .../gnutls-2.12.19/fix-gettext-version.patch       |   46 +++++++
 .../gnutls/gnutls-2.12.19/gnutls-openssl.patch     |  126 ++++++++++++++++++++
 .../gnutls-2.12.19/gnutls-texinfo-euro.patch       |   18 +++
 meta/recipes-support/gnutls/gnutls_2.12.18.bb      |   19 ---
 meta/recipes-support/gnutls/gnutls_2.12.19.bb      |   19 +++
 12 files changed, 331 insertions(+), 331 deletions(-)
 delete mode 100644 meta/recipes-support/gnutls/gnutls-2.12.18/configure-fix.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls-2.12.18/correct_rpl_gettimeofday_signature.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls-2.12.18/fix-gettext-version.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls-2.12.18/gnutls-openssl.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls-2.12.18/gnutls-texinfo-euro.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls-2.12.19/configure-fix.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls-2.12.19/correct_rpl_gettimeofday_signature.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls-2.12.19/fix-gettext-version.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls-2.12.19/gnutls-openssl.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls-2.12.19/gnutls-texinfo-euro.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls_2.12.18.bb
 create mode 100644 meta/recipes-support/gnutls/gnutls_2.12.19.bb

diff --git a/meta/recipes-support/gnutls/gnutls-2.12.18/configure-fix.patch b/meta/recipes-support/gnutls/gnutls-2.12.18/configure-fix.patch
deleted file mode 100644
index 14f87e0..0000000
--- a/meta/recipes-support/gnutls/gnutls-2.12.18/configure-fix.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-Upstream-Status: Inappropriate [distribution]
-
-rebased from original configure_madness.patch
-
-libtasn1 provides an .pc file in upstream,
-and a libgcrypt.pc is added in libgcrypt recipe,
-so use Requires.private for these two.
-
-against 2.8.6
-
-07/02/2010 - qhe
-
----
-Index: gnutls-2.12.11/lib/configure.ac
-===================================================================
---- gnutls-2.12.11.orig/lib/configure.ac
-+++ gnutls-2.12.11/lib/configure.ac
-@@ -126,8 +126,8 @@ lgl_INIT
- AC_CHECK_FUNCS(getrusage,,)
- AC_LIB_HAVE_LINKFLAGS(pthread,, [#include <pthread.h>], [pthread_mutex_lock (0);])
- 
--LIBGNUTLS_LIBS="-L${libdir} -lgnutls $LIBS"
--LIBGNUTLS_CFLAGS="-I${includedir}"
-+LIBGNUTLS_LIBS="-lgnutls $LIBS"
-+LIBGNUTLS_CFLAGS=""
- AC_SUBST(LIBGNUTLS_LIBS)
- AC_SUBST(LIBGNUTLS_CFLAGS)
- 
-Index: gnutls-2.12.11/lib/gnutls.pc.in
-===================================================================
---- gnutls-2.12.11.orig/lib/gnutls.pc.in
-+++ gnutls-2.12.11/lib/gnutls.pc.in
-@@ -20,6 +20,4 @@ Description: Transport Security Layer im
- URL: http://www.gnu.org/software/gnutls/
- Version: @VERSION@
- Libs: -L${libdir} -lgnutls
--Libs.private: @LTLIBGCRYPT@ @LTLIBNETTLE@ @NETTLE_LIBS@ @GNUTLS_ZLIB_LIBS_PRIVATE@
--@GNUTLS_REQUIRES_PRIVATE@
- Cflags: -I${includedir}
-Index: gnutls-2.12.11/libextra/configure.ac
-===================================================================
---- gnutls-2.12.11.orig/libextra/configure.ac
-+++ gnutls-2.12.11/libextra/configure.ac
-@@ -41,8 +41,8 @@ LIBGNUTLS_EXTRA_HOOKS
- 
- xgl_INIT
- 
--LIBGNUTLS_EXTRA_LIBS="-L${libdir} -lgnutls-extra $LZO_LIBS $LIBGNUTLS_LIBS"
--LIBGNUTLS_EXTRA_CFLAGS="-I${includedir}"
-+LIBGNUTLS_EXTRA_LIBS="-lgnutls-extra $LZO_LIBS $LIBGNUTLS_LIBS"
-+LIBGNUTLS_EXTRA_CFLAGS=""
- AC_SUBST(LIBGNUTLS_EXTRA_LIBS)
- AC_SUBST(LIBGNUTLS_EXTRA_CFLAGS)
- 
-Index: gnutls-2.12.11/libextra/gnutls-extra.pc.in
-===================================================================
---- gnutls-2.12.11.orig/libextra/gnutls-extra.pc.in
-+++ gnutls-2.12.11/libextra/gnutls-extra.pc.in
-@@ -22,5 +22,5 @@ URL: http://www.gnu.org/software/gnutls/
- Requires: gnutls
- Version: @VERSION@
- Libs: -L${libdir} -lgnutls-extra
--Libs.private: @LIBGNUTLS_EXTRA_LIBS@
-+Libs.private: -llzo2
- Cflags: -I${includedir}
diff --git a/meta/recipes-support/gnutls/gnutls-2.12.18/correct_rpl_gettimeofday_signature.patch b/meta/recipes-support/gnutls/gnutls-2.12.18/correct_rpl_gettimeofday_signature.patch
deleted file mode 100644
index b8f0d72..0000000
--- a/meta/recipes-support/gnutls/gnutls-2.12.18/correct_rpl_gettimeofday_signature.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-Currently we fail on uclibc like below
-
-| In file included from /home/kraj/work/angstrom/sources/openembedded-core/build/tmp-uclibc/sysroots/qemuarm/usr/include/sys/procfs.h:32:0,
-|                  from /home/kraj/work/angstrom/sources/openembedded-core/build/tmp-uclibc/sysroots/qemuarm/usr/include/sys/ucontext.h:26,
-|                  from /home/kraj/work/angstrom/sources/openembedded-core/build/tmp-uclibc/sysroots/qemuarm/usr/include/signal.h:392,
-|                  from ../../gl/signal.h:52,
-|                  from ../../gl/sys/select.h:58,
-|                  from /home/kraj/work/angstrom/sources/openembedded-core/build/tmp-uclibc/sysroots/qemuarm/usr/include/sys/types.h:220,
-|                  from ../../gl/sys/types.h:28,
-|                  from ../../lib/includes/gnutls/gnutls.h:46,
-|                  from ex-cxx.cpp:3:
-| ../../gl/sys/time.h:396:66: error: conflicting declaration 'void* restrict'
-| ../../gl/sys/time.h:396:50: error: 'restrict' has a previous declaration as 'timeval* restrict'
-| make[4]: *** [ex-cxx.o] Error 1
-| make[4]: *** Waiting for unfinished jobs....
-
-
-GCC detects that we call 'restrict' as param name in function
-signatures and complains since both params are called 'restrict'
-therefore we use __restrict to denote the C99 keywork
-
-This only happens of uclibc since this code is not excercised with
-eglibc otherwise we will have same issue there too
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-
-Index: gnutls-2.12.14/gl/sys_time.in.h
-===================================================================
---- gnutls-2.12.14.orig/gl/sys_time.in.h	2012-01-15 10:54:39.517285351 -0800
-+++ gnutls-2.12.14/gl/sys_time.in.h	2012-01-15 10:59:23.773299108 -0800
-@@ -82,20 +82,20 @@
- #    define gettimeofday rpl_gettimeofday
- #   endif
- _GL_FUNCDECL_RPL (gettimeofday, int,
--                  (struct timeval *restrict, void *restrict)
-+                  (struct timeval *__restrict, void *__restrict)
-                   _GL_ARG_NONNULL ((1)));
- _GL_CXXALIAS_RPL (gettimeofday, int,
--                  (struct timeval *restrict, void *restrict));
-+                  (struct timeval *__restrict, void *__restrict));
- #  else
- #   if !@HAVE_GETTIMEOFDAY@
- _GL_FUNCDECL_SYS (gettimeofday, int,
--                  (struct timeval *restrict, void *restrict)
-+                  (struct timeval *__restrict, void *__restrict)
-                   _GL_ARG_NONNULL ((1)));
- #   endif
- /* Need to cast, because on glibc systems, by default, the second argument is
-                                                   struct timezone *.  */
- _GL_CXXALIAS_SYS_CAST (gettimeofday, int,
--                       (struct timeval *restrict, void *restrict));
-+                       (struct timeval *__restrict, void *__restrict));
- #  endif
- _GL_CXXALIASWARN (gettimeofday);
- # elif defined GNULIB_POSIXCHECK
diff --git a/meta/recipes-support/gnutls/gnutls-2.12.18/fix-gettext-version.patch b/meta/recipes-support/gnutls/gnutls-2.12.18/fix-gettext-version.patch
deleted file mode 100644
index 4c9137a..0000000
--- a/meta/recipes-support/gnutls/gnutls-2.12.18/fix-gettext-version.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-Index: gnutls-2.12.14/lib/po/Makefile.in.in
-===================================================================
---- gnutls-2.12.14.orig/lib/po/Makefile.in.in
-+++ gnutls-2.12.14/lib/po/Makefile.in.in
-@@ -8,8 +8,8 @@
- # Please note that the actual code of GNU gettext is covered by the GNU
- # General Public License and is *not* in the public domain.
- #
--# Origin: gettext-0.17
--GETTEXT_MACRO_VERSION = 0.17
-+# Origin: gettext-0.18
-+GETTEXT_MACRO_VERSION = 0.18
- 
- PACKAGE = @PACKAGE@
- VERSION = @VERSION@
-Index: gnutls-2.12.14/lib/m4/po.m4
-===================================================================
---- gnutls-2.12.14.orig/lib/m4/po.m4
-+++ gnutls-2.12.14/lib/m4/po.m4
-@@ -29,7 +29,7 @@ AC_DEFUN([AM_PO_SUBDIRS],
- 
-   dnl Release version of the gettext macros. This is used to ensure that
-   dnl the gettext macros and po/Makefile.in.in are in sync.
--  AC_SUBST([GETTEXT_MACRO_VERSION], [0.17])
-+  AC_SUBST([GETTEXT_MACRO_VERSION], [0.18])
- 
-   dnl Perform the following tests also if --disable-nls has been given,
-   dnl because they are needed for "make dist" to work.
-Index: gnutls-2.12.14/lib/configure.ac
-===================================================================
---- gnutls-2.12.14.orig/lib/configure.ac
-+++ gnutls-2.12.14/lib/configure.ac
-@@ -39,7 +39,7 @@ AC_PROG_LIBTOOL
- LIBGNUTLS_HOOKS
- 
- AM_GNU_GETTEXT([external])
--AM_GNU_GETTEXT_VERSION([0.17])
-+AM_GNU_GETTEXT_VERSION([0.18])
- 
- AC_C_BIGENDIAN
- 
diff --git a/meta/recipes-support/gnutls/gnutls-2.12.18/gnutls-openssl.patch b/meta/recipes-support/gnutls/gnutls-2.12.18/gnutls-openssl.patch
deleted file mode 100644
index ef70674..0000000
--- a/meta/recipes-support/gnutls/gnutls-2.12.18/gnutls-openssl.patch
+++ /dev/null
@@ -1,126 +0,0 @@
-Upstream-Status: Backport
-
-Index: gnutls-1.6.0/libextra/gnutls_openssl.c
-===================================================================
---- gnutls-1.6.0.orig/libextra/gnutls_openssl.c	2006-08-13 22:34:09.000000000 +0200
-+++ gnutls-1.6.0/libextra/gnutls_openssl.c	2006-12-12 15:07:59.002227000 +0100
-@@ -256,12 +256,17 @@
-   ssl->rfd = (gnutls_transport_ptr_t) - 1;
-   ssl->wfd = (gnutls_transport_ptr_t) - 1;
- 
-+  ssl->ssl_peek_buffer = NULL;
-+  ssl->ssl_peek_buffer_size = ssl->ssl_peek_avail = 0;
-+
-   return ssl;
- }
- 
- void
- SSL_free (SSL * ssl)
- {
-+  if (ssl->ssl_peek_buffer)
-+    free(ssl->ssl_peek_buffer);
-   gnutls_certificate_free_credentials (ssl->gnutls_cred);
-   gnutls_deinit (ssl->gnutls_state);
-   free (ssl);
-@@ -285,6 +290,7 @@
- SSL_set_fd (SSL * ssl, int fd)
- {
-   gnutls_transport_set_ptr (ssl->gnutls_state, GNUTLS_INT_TO_POINTER (fd));
-+  ssl->rfd = ssl->wfd = fd;
-   return 1;
- }
- 
-@@ -310,6 +316,17 @@
-   return 1;
- }
- 
-+int SSL_get_rfd(SSL *ssl)
-+{
-+  return ssl->rfd;
-+}
-+
-+int SSL_get_wfd(SSL *ssl)
-+{
-+  return ssl->wfd;
-+}
-+
-+
- void
- SSL_set_bio (SSL * ssl, BIO * rbio, BIO * wbio)
- {
-@@ -325,6 +342,8 @@
- int
- SSL_pending (SSL * ssl)
- {
-+  if (ssl->ssl_peek_avail)
-+    return ssl->ssl_peek_avail;
-   return gnutls_record_check_pending (ssl->gnutls_state);
- }
- 
-@@ -480,11 +499,50 @@
-   return 1;
- }
- 
-+int SSL_peek(SSL *ssl, void *buf, int len)
-+{
-+  if (len > ssl->ssl_peek_buffer_size) {
-+    ssl->ssl_peek_buffer = realloc (ssl->ssl_peek_buffer, len);
-+    ssl->ssl_peek_buffer_size = len;
-+  }
-+
-+  if (ssl->ssl_peek_avail == 0) {
-+
-+    int ret;
-+    
-+    ret = gnutls_record_recv(ssl->gnutls_state, ssl->ssl_peek_buffer, len);
-+    ssl->last_error = ret;
-+    
-+    if (ret > 0)
-+      ssl->ssl_peek_avail += ret;
-+  }
-+
-+  if (len > ssl->ssl_peek_avail)
-+    len = ssl->ssl_peek_avail;
-+
-+  memcpy (buf, ssl->ssl_peek_buffer, len);
-+
-+  return len;
-+}
-+
- int
- SSL_read (SSL * ssl, void *buf, int len)
- {
-   int ret;
- 
-+  if (ssl->ssl_peek_avail) {
-+    int n = (ssl->ssl_peek_avail > len) ? len : ssl->ssl_peek_avail;
-+
-+    memcpy (buf, ssl->ssl_peek_buffer, n);
-+
-+    if (ssl->ssl_peek_avail > n)
-+      memmove (ssl->ssl_peek_buffer, ssl->ssl_peek_buffer + n, ssl->ssl_peek_avail - n);
-+
-+    ssl->ssl_peek_avail -= n;
-+
-+    return n;
-+  }
-+
-   ret = gnutls_record_recv (ssl->gnutls_state, buf, len);
-   ssl->last_error = ret;
- 
-Index: gnutls-1.6.0/includes/gnutls/openssl.h
-===================================================================
---- gnutls-1.6.0.orig/libextra/includes/gnutls/openssl.h	2006-03-08 11:44:58.000000000 +0100
-+++ gnutls-1.6.0/libextra/includes/gnutls/openssl.h	2006-12-12 15:07:26.032227000 +0100
-@@ -164,6 +164,11 @@
- 
-     gnutls_transport_ptr_t rfd;
-     gnutls_transport_ptr_t wfd;
-+
-+    char *ssl_peek_buffer;
-+    size_t ssl_peek_buffer_size;
-+    size_t ssl_peek_avail;
-+
-   };
- 
- #define rbio gnutls_state
diff --git a/meta/recipes-support/gnutls/gnutls-2.12.18/gnutls-texinfo-euro.patch b/meta/recipes-support/gnutls/gnutls-2.12.18/gnutls-texinfo-euro.patch
deleted file mode 100644
index 10e3774..0000000
--- a/meta/recipes-support/gnutls/gnutls-2.12.18/gnutls-texinfo-euro.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Upstream-Status: Backport
-
-The version of texinfo in Debian Sarge does not understand the @euro{} command.
-This patch replaces the @euro{} command with the word "euro".
-
---- gnutls-1.3.5/doc/gnutls.texi.orig	2006-04-26 08:06:40.918268000 +0930
-+++ gnutls-1.3.5/doc/gnutls.texi	2006-04-26 08:06:52.446515440 +0930
-@@ -11,8 +11,8 @@
- long as it is difficult enough to generate two different messages with
- the same hash algorithm output. In that case the same signature could
- be used as a proof for both messages. Nobody wants to sign an innocent
--message of donating 1 @euro{} to Greenpeace and find out that he
--donated 1.000.000 @euro{} to Bad Inc.
-+message of donating 1 euro to Greenpeace and find out that he
-+donated 1.000.000 euro to Bad Inc.
- 
- For a hash algorithm to be called cryptographic the following three
- requirements must hold
diff --git a/meta/recipes-support/gnutls/gnutls-2.12.19/configure-fix.patch b/meta/recipes-support/gnutls/gnutls-2.12.19/configure-fix.patch
new file mode 100644
index 0000000..14f87e0
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls-2.12.19/configure-fix.patch
@@ -0,0 +1,65 @@
+Upstream-Status: Inappropriate [distribution]
+
+rebased from original configure_madness.patch
+
+libtasn1 provides an .pc file in upstream,
+and a libgcrypt.pc is added in libgcrypt recipe,
+so use Requires.private for these two.
+
+against 2.8.6
+
+07/02/2010 - qhe
+
+---
+Index: gnutls-2.12.11/lib/configure.ac
+===================================================================
+--- gnutls-2.12.11.orig/lib/configure.ac
++++ gnutls-2.12.11/lib/configure.ac
+@@ -126,8 +126,8 @@ lgl_INIT
+ AC_CHECK_FUNCS(getrusage,,)
+ AC_LIB_HAVE_LINKFLAGS(pthread,, [#include <pthread.h>], [pthread_mutex_lock (0);])
+ 
+-LIBGNUTLS_LIBS="-L${libdir} -lgnutls $LIBS"
+-LIBGNUTLS_CFLAGS="-I${includedir}"
++LIBGNUTLS_LIBS="-lgnutls $LIBS"
++LIBGNUTLS_CFLAGS=""
+ AC_SUBST(LIBGNUTLS_LIBS)
+ AC_SUBST(LIBGNUTLS_CFLAGS)
+ 
+Index: gnutls-2.12.11/lib/gnutls.pc.in
+===================================================================
+--- gnutls-2.12.11.orig/lib/gnutls.pc.in
++++ gnutls-2.12.11/lib/gnutls.pc.in
+@@ -20,6 +20,4 @@ Description: Transport Security Layer im
+ URL: http://www.gnu.org/software/gnutls/
+ Version: @VERSION@
+ Libs: -L${libdir} -lgnutls
+-Libs.private: @LTLIBGCRYPT@ @LTLIBNETTLE@ @NETTLE_LIBS@ @GNUTLS_ZLIB_LIBS_PRIVATE@
+-@GNUTLS_REQUIRES_PRIVATE@
+ Cflags: -I${includedir}
+Index: gnutls-2.12.11/libextra/configure.ac
+===================================================================
+--- gnutls-2.12.11.orig/libextra/configure.ac
++++ gnutls-2.12.11/libextra/configure.ac
+@@ -41,8 +41,8 @@ LIBGNUTLS_EXTRA_HOOKS
+ 
+ xgl_INIT
+ 
+-LIBGNUTLS_EXTRA_LIBS="-L${libdir} -lgnutls-extra $LZO_LIBS $LIBGNUTLS_LIBS"
+-LIBGNUTLS_EXTRA_CFLAGS="-I${includedir}"
++LIBGNUTLS_EXTRA_LIBS="-lgnutls-extra $LZO_LIBS $LIBGNUTLS_LIBS"
++LIBGNUTLS_EXTRA_CFLAGS=""
+ AC_SUBST(LIBGNUTLS_EXTRA_LIBS)
+ AC_SUBST(LIBGNUTLS_EXTRA_CFLAGS)
+ 
+Index: gnutls-2.12.11/libextra/gnutls-extra.pc.in
+===================================================================
+--- gnutls-2.12.11.orig/libextra/gnutls-extra.pc.in
++++ gnutls-2.12.11/libextra/gnutls-extra.pc.in
+@@ -22,5 +22,5 @@ URL: http://www.gnu.org/software/gnutls/
+ Requires: gnutls
+ Version: @VERSION@
+ Libs: -L${libdir} -lgnutls-extra
+-Libs.private: @LIBGNUTLS_EXTRA_LIBS@
++Libs.private: -llzo2
+ Cflags: -I${includedir}
diff --git a/meta/recipes-support/gnutls/gnutls-2.12.19/correct_rpl_gettimeofday_signature.patch b/meta/recipes-support/gnutls/gnutls-2.12.19/correct_rpl_gettimeofday_signature.patch
new file mode 100644
index 0000000..b8f0d72
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls-2.12.19/correct_rpl_gettimeofday_signature.patch
@@ -0,0 +1,57 @@
+Currently we fail on uclibc like below
+
+| In file included from /home/kraj/work/angstrom/sources/openembedded-core/build/tmp-uclibc/sysroots/qemuarm/usr/include/sys/procfs.h:32:0,
+|                  from /home/kraj/work/angstrom/sources/openembedded-core/build/tmp-uclibc/sysroots/qemuarm/usr/include/sys/ucontext.h:26,
+|                  from /home/kraj/work/angstrom/sources/openembedded-core/build/tmp-uclibc/sysroots/qemuarm/usr/include/signal.h:392,
+|                  from ../../gl/signal.h:52,
+|                  from ../../gl/sys/select.h:58,
+|                  from /home/kraj/work/angstrom/sources/openembedded-core/build/tmp-uclibc/sysroots/qemuarm/usr/include/sys/types.h:220,
+|                  from ../../gl/sys/types.h:28,
+|                  from ../../lib/includes/gnutls/gnutls.h:46,
+|                  from ex-cxx.cpp:3:
+| ../../gl/sys/time.h:396:66: error: conflicting declaration 'void* restrict'
+| ../../gl/sys/time.h:396:50: error: 'restrict' has a previous declaration as 'timeval* restrict'
+| make[4]: *** [ex-cxx.o] Error 1
+| make[4]: *** Waiting for unfinished jobs....
+
+
+GCC detects that we call 'restrict' as param name in function
+signatures and complains since both params are called 'restrict'
+therefore we use __restrict to denote the C99 keywork
+
+This only happens of uclibc since this code is not excercised with
+eglibc otherwise we will have same issue there too
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+
+Index: gnutls-2.12.14/gl/sys_time.in.h
+===================================================================
+--- gnutls-2.12.14.orig/gl/sys_time.in.h	2012-01-15 10:54:39.517285351 -0800
++++ gnutls-2.12.14/gl/sys_time.in.h	2012-01-15 10:59:23.773299108 -0800
+@@ -82,20 +82,20 @@
+ #    define gettimeofday rpl_gettimeofday
+ #   endif
+ _GL_FUNCDECL_RPL (gettimeofday, int,
+-                  (struct timeval *restrict, void *restrict)
++                  (struct timeval *__restrict, void *__restrict)
+                   _GL_ARG_NONNULL ((1)));
+ _GL_CXXALIAS_RPL (gettimeofday, int,
+-                  (struct timeval *restrict, void *restrict));
++                  (struct timeval *__restrict, void *__restrict));
+ #  else
+ #   if !@HAVE_GETTIMEOFDAY@
+ _GL_FUNCDECL_SYS (gettimeofday, int,
+-                  (struct timeval *restrict, void *restrict)
++                  (struct timeval *__restrict, void *__restrict)
+                   _GL_ARG_NONNULL ((1)));
+ #   endif
+ /* Need to cast, because on glibc systems, by default, the second argument is
+                                                   struct timezone *.  */
+ _GL_CXXALIAS_SYS_CAST (gettimeofday, int,
+-                       (struct timeval *restrict, void *restrict));
++                       (struct timeval *__restrict, void *__restrict));
+ #  endif
+ _GL_CXXALIASWARN (gettimeofday);
+ # elif defined GNULIB_POSIXCHECK
diff --git a/meta/recipes-support/gnutls/gnutls-2.12.19/fix-gettext-version.patch b/meta/recipes-support/gnutls/gnutls-2.12.19/fix-gettext-version.patch
new file mode 100644
index 0000000..4c9137a
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls-2.12.19/fix-gettext-version.patch
@@ -0,0 +1,46 @@
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Index: gnutls-2.12.14/lib/po/Makefile.in.in
+===================================================================
+--- gnutls-2.12.14.orig/lib/po/Makefile.in.in
++++ gnutls-2.12.14/lib/po/Makefile.in.in
+@@ -8,8 +8,8 @@
+ # Please note that the actual code of GNU gettext is covered by the GNU
+ # General Public License and is *not* in the public domain.
+ #
+-# Origin: gettext-0.17
+-GETTEXT_MACRO_VERSION = 0.17
++# Origin: gettext-0.18
++GETTEXT_MACRO_VERSION = 0.18
+ 
+ PACKAGE = @PACKAGE@
+ VERSION = @VERSION@
+Index: gnutls-2.12.14/lib/m4/po.m4
+===================================================================
+--- gnutls-2.12.14.orig/lib/m4/po.m4
++++ gnutls-2.12.14/lib/m4/po.m4
+@@ -29,7 +29,7 @@ AC_DEFUN([AM_PO_SUBDIRS],
+ 
+   dnl Release version of the gettext macros. This is used to ensure that
+   dnl the gettext macros and po/Makefile.in.in are in sync.
+-  AC_SUBST([GETTEXT_MACRO_VERSION], [0.17])
++  AC_SUBST([GETTEXT_MACRO_VERSION], [0.18])
+ 
+   dnl Perform the following tests also if --disable-nls has been given,
+   dnl because they are needed for "make dist" to work.
+Index: gnutls-2.12.14/lib/configure.ac
+===================================================================
+--- gnutls-2.12.14.orig/lib/configure.ac
++++ gnutls-2.12.14/lib/configure.ac
+@@ -39,7 +39,7 @@ AC_PROG_LIBTOOL
+ LIBGNUTLS_HOOKS
+ 
+ AM_GNU_GETTEXT([external])
+-AM_GNU_GETTEXT_VERSION([0.17])
++AM_GNU_GETTEXT_VERSION([0.18])
+ 
+ AC_C_BIGENDIAN
+ 
diff --git a/meta/recipes-support/gnutls/gnutls-2.12.19/gnutls-openssl.patch b/meta/recipes-support/gnutls/gnutls-2.12.19/gnutls-openssl.patch
new file mode 100644
index 0000000..ef70674
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls-2.12.19/gnutls-openssl.patch
@@ -0,0 +1,126 @@
+Upstream-Status: Backport
+
+Index: gnutls-1.6.0/libextra/gnutls_openssl.c
+===================================================================
+--- gnutls-1.6.0.orig/libextra/gnutls_openssl.c	2006-08-13 22:34:09.000000000 +0200
++++ gnutls-1.6.0/libextra/gnutls_openssl.c	2006-12-12 15:07:59.002227000 +0100
+@@ -256,12 +256,17 @@
+   ssl->rfd = (gnutls_transport_ptr_t) - 1;
+   ssl->wfd = (gnutls_transport_ptr_t) - 1;
+ 
++  ssl->ssl_peek_buffer = NULL;
++  ssl->ssl_peek_buffer_size = ssl->ssl_peek_avail = 0;
++
+   return ssl;
+ }
+ 
+ void
+ SSL_free (SSL * ssl)
+ {
++  if (ssl->ssl_peek_buffer)
++    free(ssl->ssl_peek_buffer);
+   gnutls_certificate_free_credentials (ssl->gnutls_cred);
+   gnutls_deinit (ssl->gnutls_state);
+   free (ssl);
+@@ -285,6 +290,7 @@
+ SSL_set_fd (SSL * ssl, int fd)
+ {
+   gnutls_transport_set_ptr (ssl->gnutls_state, GNUTLS_INT_TO_POINTER (fd));
++  ssl->rfd = ssl->wfd = fd;
+   return 1;
+ }
+ 
+@@ -310,6 +316,17 @@
+   return 1;
+ }
+ 
++int SSL_get_rfd(SSL *ssl)
++{
++  return ssl->rfd;
++}
++
++int SSL_get_wfd(SSL *ssl)
++{
++  return ssl->wfd;
++}
++
++
+ void
+ SSL_set_bio (SSL * ssl, BIO * rbio, BIO * wbio)
+ {
+@@ -325,6 +342,8 @@
+ int
+ SSL_pending (SSL * ssl)
+ {
++  if (ssl->ssl_peek_avail)
++    return ssl->ssl_peek_avail;
+   return gnutls_record_check_pending (ssl->gnutls_state);
+ }
+ 
+@@ -480,11 +499,50 @@
+   return 1;
+ }
+ 
++int SSL_peek(SSL *ssl, void *buf, int len)
++{
++  if (len > ssl->ssl_peek_buffer_size) {
++    ssl->ssl_peek_buffer = realloc (ssl->ssl_peek_buffer, len);
++    ssl->ssl_peek_buffer_size = len;
++  }
++
++  if (ssl->ssl_peek_avail == 0) {
++
++    int ret;
++    
++    ret = gnutls_record_recv(ssl->gnutls_state, ssl->ssl_peek_buffer, len);
++    ssl->last_error = ret;
++    
++    if (ret > 0)
++      ssl->ssl_peek_avail += ret;
++  }
++
++  if (len > ssl->ssl_peek_avail)
++    len = ssl->ssl_peek_avail;
++
++  memcpy (buf, ssl->ssl_peek_buffer, len);
++
++  return len;
++}
++
+ int
+ SSL_read (SSL * ssl, void *buf, int len)
+ {
+   int ret;
+ 
++  if (ssl->ssl_peek_avail) {
++    int n = (ssl->ssl_peek_avail > len) ? len : ssl->ssl_peek_avail;
++
++    memcpy (buf, ssl->ssl_peek_buffer, n);
++
++    if (ssl->ssl_peek_avail > n)
++      memmove (ssl->ssl_peek_buffer, ssl->ssl_peek_buffer + n, ssl->ssl_peek_avail - n);
++
++    ssl->ssl_peek_avail -= n;
++
++    return n;
++  }
++
+   ret = gnutls_record_recv (ssl->gnutls_state, buf, len);
+   ssl->last_error = ret;
+ 
+Index: gnutls-1.6.0/includes/gnutls/openssl.h
+===================================================================
+--- gnutls-1.6.0.orig/libextra/includes/gnutls/openssl.h	2006-03-08 11:44:58.000000000 +0100
++++ gnutls-1.6.0/libextra/includes/gnutls/openssl.h	2006-12-12 15:07:26.032227000 +0100
+@@ -164,6 +164,11 @@
+ 
+     gnutls_transport_ptr_t rfd;
+     gnutls_transport_ptr_t wfd;
++
++    char *ssl_peek_buffer;
++    size_t ssl_peek_buffer_size;
++    size_t ssl_peek_avail;
++
+   };
+ 
+ #define rbio gnutls_state
diff --git a/meta/recipes-support/gnutls/gnutls-2.12.19/gnutls-texinfo-euro.patch b/meta/recipes-support/gnutls/gnutls-2.12.19/gnutls-texinfo-euro.patch
new file mode 100644
index 0000000..10e3774
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls-2.12.19/gnutls-texinfo-euro.patch
@@ -0,0 +1,18 @@
+Upstream-Status: Backport
+
+The version of texinfo in Debian Sarge does not understand the @euro{} command.
+This patch replaces the @euro{} command with the word "euro".
+
+--- gnutls-1.3.5/doc/gnutls.texi.orig	2006-04-26 08:06:40.918268000 +0930
++++ gnutls-1.3.5/doc/gnutls.texi	2006-04-26 08:06:52.446515440 +0930
+@@ -11,8 +11,8 @@
+ long as it is difficult enough to generate two different messages with
+ the same hash algorithm output. In that case the same signature could
+ be used as a proof for both messages. Nobody wants to sign an innocent
+-message of donating 1 @euro{} to Greenpeace and find out that he
+-donated 1.000.000 @euro{} to Bad Inc.
++message of donating 1 euro to Greenpeace and find out that he
++donated 1.000.000 euro to Bad Inc.
+ 
+ For a hash algorithm to be called cryptographic the following three
+ requirements must hold
diff --git a/meta/recipes-support/gnutls/gnutls_2.12.18.bb b/meta/recipes-support/gnutls/gnutls_2.12.18.bb
deleted file mode 100644
index 7355855..0000000
--- a/meta/recipes-support/gnutls/gnutls_2.12.18.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-require gnutls.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://gnutls-openssl.patch \
-            file://correct_rpl_gettimeofday_signature.patch \
-            file://configure-fix.patch \
-           "
-
-SRC_URI[md5sum] = "e9215d00d2930e09bc8f23f02b54f2d1"
-SRC_URI[sha256sum] = "780b12e3f05191316390611a3d9d982d29ca3f3abc234517b2fc542064b6f07a"
-
-python() {
-    if not ((d.getVar("INCOMPATIBLE_LICENSE", True) or "").find("GPLv3") != -1):
-        # if GPLv3 add patch
-        src_uri = (d.getVar("SRC_URI", False) or "").split()
-        src_uri.append("file://fix-gettext-version.patch")
-        d.setVar("SRC_URI", " ".join(src_uri))
-}
diff --git a/meta/recipes-support/gnutls/gnutls_2.12.19.bb b/meta/recipes-support/gnutls/gnutls_2.12.19.bb
new file mode 100644
index 0000000..7d76510
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls_2.12.19.bb
@@ -0,0 +1,19 @@
+require gnutls.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://gnutls-openssl.patch \
+            file://correct_rpl_gettimeofday_signature.patch \
+            file://configure-fix.patch \
+           "
+
+SRC_URI[md5sum] = "14228b34e3d8ed176a617df40693b441"
+SRC_URI[sha256sum] = "8f167b39de4e2fddd83f7e29c98ce2e7fc76f4d79ccf4d3d66d1379b971160ec"
+
+python() {
+    if not ((d.getVar("INCOMPATIBLE_LICENSE", True) or "").find("GPLv3") != -1):
+        # if GPLv3 add patch
+        src_uri = (d.getVar("SRC_URI", False) or "").split()
+        src_uri.append("file://fix-gettext-version.patch")
+        d.setVar("SRC_URI", " ".join(src_uri))
+}
-- 
1.7.4.1




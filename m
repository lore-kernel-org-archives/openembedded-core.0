Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A6B136A465
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 06:09:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6F69n7J010922
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Jul 2013 23:09:49 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Sun, 14 Jul 2013 23:09:49 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Jul 2013 14:09:46 +0800
Message-ID: <7908e2a1a7faa8f8b09c5e682c9ed44a1b18a5ff.1373868174.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1373868174.git.jackie.huang@windriver.com>
References: <cover.1373868174.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] msmtp: add GPLv2 compatiable version 1.4.12
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
X-List-Received-Date: Mon, 15 Jul 2013 06:09:48 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Take existing recipe from oe-core and downrev for GPLv2 compatiable
version. Add patch to deal with issues when building in bitbake.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../msmtp-fixup-api-and-compiler-warning.patch     |  239 ++++++++++++++++++++
 meta/recipes-extended/msmtp/msmtp_1.4.12.bb        |   33 +++
 2 files changed, 272 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-extended/msmtp/msmtp-1.4.12/msmtp-fixup-api-and-compiler-warning.patch
 create mode 100644 meta/recipes-extended/msmtp/msmtp_1.4.12.bb

diff --git a/meta/recipes-extended/msmtp/msmtp-1.4.12/msmtp-fixup-api-and-compiler-warning.patch b/meta/recipes-extended/msmtp/msmtp-1.4.12/msmtp-fixup-api-and-compiler-warning.patch
new file mode 100644
index 0000000..cbe0c40
--- /dev/null
+++ b/meta/recipes-extended/msmtp/msmtp-1.4.12/msmtp-fixup-api-and-compiler-warning.patch
@@ -0,0 +1,239 @@
+Upstream-Status: Pending
+
+diff -Naur msmtp-1.4.12/configure.ac msmtp-1.4.12-wrs/configure.ac
+--- msmtp-1.4.12/configure.ac	
++++ msmtp-1.4.12-wrs/configure.ac
+@@ -40,8 +40,8 @@
+ dnl System
+ case "${target}" in *-*-mingw32*) windows=yes ;; *) windows=no ;; esac
+ 
+-dnl gnulib 
+-gl_INIT
++#dnl gnulib 
++#gl_INIT
+ 
+ dnl Gettext
+ AM_GNU_GETTEXT([external])
+diff -Naur msmtp-1.4.12/gnulib/base64.c msmtp-1.4.12-wrs/gnulib/base64.c
+--- msmtp-1.4.12/gnulib/base64.c
++++ msmtp-1.4.12-wrs/gnulib/base64.c
+@@ -64,8 +64,8 @@
+    possible.  If OUTLEN is larger than BASE64_LENGTH(INLEN), also zero
+    terminate the output buffer. */
+ void
+-base64_encode (const char *restrict in, size_t inlen,
+-	       char *restrict out, size_t outlen)
++base64_encode (const char *in, size_t inlen,
++	       char *out, size_t outlen)
+ {
+   static const char b64str[64] =
+     "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
+@@ -310,8 +310,8 @@
+    that, when applicable, you must remove any line terminators that is
+    part of the data stream before calling this function.  */
+ bool
+-base64_decode (const char *restrict in, size_t inlen,
+-	       char *restrict out, size_t *outlen)
++base64_decode (const char *in, size_t inlen,
++	       char *out, size_t *outlen)
+ {
+   size_t outleft = *outlen;
+ 
+diff -Naur msmtp-1.4.12/gnulib/base64.h msmtp-1.4.12-wrs/gnulib/base64.h
+--- msmtp-1.4.12/gnulib/base64.h
++++ msmtp-1.4.12-wrs/gnulib/base64.h
+@@ -31,13 +31,13 @@
+ 
+ extern bool isbase64 (char ch);
+ 
+-extern void base64_encode (const char *restrict in, size_t inlen,
+-			   char *restrict out, size_t outlen);
++extern void base64_encode (const char *in, size_t inlen,
++			   char *out, size_t outlen);
+ 
+ extern size_t base64_encode_alloc (const char *in, size_t inlen, char **out);
+ 
+-extern bool base64_decode (const char *restrict in, size_t inlen,
+-			   char *restrict out, size_t *outlen);
++extern bool base64_decode (const char *in, size_t inlen,
++			   char *out, size_t *outlen);
+ 
+ extern bool base64_decode_alloc (const char *in, size_t inlen,
+ 				 char **out, size_t *outlen);
+diff -Naur msmtp-1.4.12/gnulib/Makefile.am msmtp-1.4.12-wrs/gnulib/Makefile.am
+--- msmtp-1.4.12/gnulib/Makefile.am
++++ msmtp-1.4.12-wrs/gnulib/Makefile.am
+@@ -59,20 +59,18 @@
+ 
+ ## begin gnulib module crypto/hmac-md5
+ 
++libgnu_a_SOURCES += hmac-md5.c
+ 
+ EXTRA_DIST += hmac-md5.c hmac.h
+ 
+-EXTRA_libgnu_a_SOURCES += hmac-md5.c
+-
+ ## end   gnulib module crypto/hmac-md5
+ 
+ ## begin gnulib module crypto/md5
+ 
++libgnu_a_SOURCES += md5.c
+ 
+ EXTRA_DIST += md5.c md5.h
+ 
+-EXTRA_libgnu_a_SOURCES += md5.c
+-
+ ## end   gnulib module crypto/md5
+ 
+ ## begin gnulib module getdelim
+@@ -149,11 +147,10 @@
+ 
+ ## begin gnulib module memxor
+ 
++libgnu_a_SOURCES += memxor.c
+ 
+ EXTRA_DIST += memxor.c memxor.h
+ 
+-EXTRA_libgnu_a_SOURCES += memxor.c
+-
+ ## end   gnulib module memxor
+ 
+ ## begin gnulib module size_max
+@@ -219,47 +216,6 @@
+ 
+ ## end   gnulib module stdint
+ 
+-## begin gnulib module stdio
+-
+-BUILT_SOURCES += stdio.h
+-
+-# We need the following in order to create <stdio.h> when the system
+-# doesn't have one that works with the given compiler.
+-stdio.h: stdio_.h
+-	rm -f $@-t $@
+-	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */' && \
+-	  sed -e 's|@''ABSOLUTE_STDIO_H''@|$(ABSOLUTE_STDIO_H)|g' \
+-	      -e 's|@''GNULIB_FPRINTF_POSIX''@|$(GNULIB_FPRINTF_POSIX)|g' \
+-	      -e 's|@''GNULIB_PRINTF_POSIX''@|$(GNULIB_PRINTF_POSIX)|g' \
+-	      -e 's|@''GNULIB_SNPRINTF''@|$(GNULIB_SNPRINTF)|g' \
+-	      -e 's|@''GNULIB_SPRINTF_POSIX''@|$(GNULIB_SPRINTF_POSIX)|g' \
+-	      -e 's|@''GNULIB_VFPRINTF_POSIX''@|$(GNULIB_VFPRINTF_POSIX)|g' \
+-	      -e 's|@''GNULIB_VPRINTF_POSIX''@|$(GNULIB_VPRINTF_POSIX)|g' \
+-	      -e 's|@''GNULIB_VSNPRINTF''@|$(GNULIB_VSNPRINTF)|g' \
+-	      -e 's|@''GNULIB_VSPRINTF_POSIX''@|$(GNULIB_VSPRINTF_POSIX)|g' \
+-	      -e 's|@''GNULIB_VASPRINTF''@|$(GNULIB_VASPRINTF)|g' \
+-	      -e 's|@''REPLACE_FPRINTF''@|$(REPLACE_FPRINTF)|g' \
+-	      -e 's|@''REPLACE_VFPRINTF''@|$(REPLACE_VFPRINTF)|g' \
+-	      -e 's|@''REPLACE_PRINTF''@|$(REPLACE_PRINTF)|g' \
+-	      -e 's|@''REPLACE_VPRINTF''@|$(REPLACE_VPRINTF)|g' \
+-	      -e 's|@''REPLACE_SNPRINTF''@|$(REPLACE_SNPRINTF)|g' \
+-	      -e 's|@''HAVE_DECL_SNPRINTF''@|$(HAVE_DECL_SNPRINTF)|g' \
+-	      -e 's|@''REPLACE_VSNPRINTF''@|$(REPLACE_VSNPRINTF)|g' \
+-	      -e 's|@''HAVE_DECL_VSNPRINTF''@|$(HAVE_DECL_VSNPRINTF)|g' \
+-	      -e 's|@''REPLACE_SPRINTF''@|$(REPLACE_SPRINTF)|g' \
+-	      -e 's|@''REPLACE_VSPRINTF''@|$(REPLACE_VSPRINTF)|g' \
+-	      -e 's|@''HAVE_VASPRINTF''@|$(HAVE_VASPRINTF)|g' \
+-	      -e 's|@''REPLACE_VASPRINTF''@|$(REPLACE_VASPRINTF)|g' \
+-	      -e '/definition of GL_LINK_WARNING/r $(LINK_WARNING_H)' \
+-	      < $(srcdir)/stdio_.h; \
+-	} > $@-t
+-	mv $@-t $@
+-MOSTLYCLEANFILES += stdio.h stdio.h-t
+-
+-EXTRA_DIST += stdio_.h
+-
+-## end   gnulib module stdio
+-
+ ## begin gnulib module sys_socket
+ 
+ BUILT_SOURCES += $(SYS_SOCKET_H)
+@@ -302,40 +258,6 @@
+ 
+ ## end   gnulib module sysexits
+ 
+-## begin gnulib module unistd
+-
+-BUILT_SOURCES += unistd.h
+-
+-# We need the following in order to create an empty placeholder for
+-# <unistd.h> when the system doesn't have one.
+-unistd.h: unistd_.h
+-	rm -f $@-t $@
+-	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
+-	  sed -e 's|@''HAVE_UNISTD_H''@|$(HAVE_UNISTD_H)|g' \
+-	      -e 's|@''ABSOLUTE_UNISTD_H''@|$(ABSOLUTE_UNISTD_H)|g' \
+-	      -e 's|@''GNULIB_CHOWN''@|$(GNULIB_CHOWN)|g' \
+-	      -e 's|@''GNULIB_DUP2''@|$(GNULIB_DUP2)|g' \
+-	      -e 's|@''GNULIB_FCHDIR''@|$(GNULIB_FCHDIR)|g' \
+-	      -e 's|@''GNULIB_FTRUNCATE''@|$(GNULIB_FTRUNCATE)|g' \
+-	      -e 's|@''GNULIB_GETCWD''@|$(GNULIB_GETCWD)|g' \
+-	      -e 's|@''GNULIB_GETLOGIN_R''@|$(GNULIB_GETLOGIN_R)|g' \
+-	      -e 's|@''GNULIB_READLINK''@|$(GNULIB_READLINK)|g' \
+-	      -e 's|@''HAVE_DUP2''@|$(HAVE_DUP2)|g' \
+-	      -e 's|@''HAVE_FTRUNCATE''@|$(HAVE_FTRUNCATE)|g' \
+-	      -e 's|@''HAVE_READLINK''@|$(HAVE_READLINK)|g' \
+-	      -e 's|@''HAVE_DECL_GETLOGIN_R''@|$(HAVE_DECL_GETLOGIN_R)|g' \
+-	      -e 's|@''REPLACE_CHOWN''@|$(REPLACE_CHOWN)|g' \
+-	      -e 's|@''REPLACE_FCHDIR''@|$(REPLACE_FCHDIR)|g' \
+-	      -e 's|@''REPLACE_GETCWD''@|$(REPLACE_GETCWD)|g' \
+-	      < $(srcdir)/unistd_.h; \
+-	} > $@-t
+-	mv $@-t $@
+-MOSTLYCLEANFILES += unistd.h unistd.h-t
+-
+-EXTRA_DIST += unistd_.h
+-
+-## end   gnulib module unistd
+-
+ ## begin gnulib module vasnprintf
+ 
+ 
+@@ -375,11 +297,10 @@
+ 
+ ## begin gnulib module xalloc
+ 
++libgnu_a_SOURCES += xmalloc.c
+ 
+ EXTRA_DIST += xalloc.h xmalloc.c
+ 
+-EXTRA_libgnu_a_SOURCES += xmalloc.c
+-
+ ## end   gnulib module xalloc
+ 
+ ## begin gnulib module xsize
+diff -Naur msmtp-1.4.12/gnulib/memxor.c msmtp-1.4.12-wrs/gnulib/memxor.c
+--- msmtp-1.4.12/gnulib/memxor.c
++++ msmtp-1.4.12-wrs/gnulib/memxor.c
+@@ -23,7 +23,7 @@
+ #include "memxor.h"
+ 
+ void *
+-memxor (void *restrict dest, const void *restrict src, size_t n)
++memxor (void *dest, const void *src, size_t n)
+ {
+   char const *s = src;
+   char *d = dest;
+diff -Naur msmtp-1.4.12/gnulib/memxor.h msmtp-1.4.12-wrs/gnulib/memxor.h
+--- msmtp-1.4.12/gnulib/memxor.h
++++ msmtp-1.4.12-wrs/gnulib/memxor.h
+@@ -26,6 +26,6 @@
+ /* Compute binary exclusive OR of memory areas DEST and SRC, putting
+    the result in DEST, of length N bytes.  Returns a pointer to
+    DEST. */
+-void *memxor (void *restrict dest, const void *restrict src, size_t n);
++void *memxor (void *dest, const void *src, size_t n);
+ 
+ #endif /* MEMXOR_H */
+diff -Naur msmtp-1.4.12/gnulib/xsize.h msmtp-1.4.12-wrs/gnulib/xsize.h
+--- msmtp-1.4.12/gnulib/xsize.h	
++++ msmtp-1.4.12-wrs/gnulib/xsize.h
+@@ -24,9 +24,7 @@
+ 
+ /* Get SIZE_MAX.  */
+ #include <limits.h>
+-#if HAVE_STDINT_H
+ # include <stdint.h>
+-#endif
+ 
+ /* The size of memory objects is often computed through expressions of
+    type size_t. Example:
diff --git a/meta/recipes-extended/msmtp/msmtp_1.4.12.bb b/meta/recipes-extended/msmtp/msmtp_1.4.12.bb
new file mode 100644
index 0000000..86b2731
--- /dev/null
+++ b/meta/recipes-extended/msmtp/msmtp_1.4.12.bb
@@ -0,0 +1,33 @@
+#
+# Copyright (C) 2012 Wind River Systems, Inc.
+#
+SUMMARY = "msmtp is an SMTP client."
+DESCRIPTION = "A sendmail replacement for use in MTAs like mutt"
+HOMEPAGE = "http://msmtp.sourceforge.net/"
+SECTION = "console/network"
+
+LICENSE = "GPLv2"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+DEPENDS = "zlib gnutls"
+PR = "r1"
+
+#Recipe modified from recipe in oe-core msmtp_1.4.28.bb
+#sha1=45941880bc903c87c1810e82016ff9853414009c
+
+SRC_URI = "http://sourceforge.net/projects/msmtp/files/msmtp/${PV}/${BPN}-${PV}.tar.bz2 \
+           file://msmtp-fixup-api-and-compiler-warning.patch \
+           "
+
+SRC_URI[md5sum] = "ba5b61d5f7667d288f1cfadccfff8ac5"
+SRC_URI[sha256sum] = "ab794bb014cdaeae0a1460a7aca1869dab8c93383bf01f41aca41b3d99b69509"
+
+EXTRA_OECONF += "--with-libgnutls-prefix=${STAGING_DIR}/${HOST_SYS}"
+
+inherit gettext autotools update-alternatives
+
+ALTERNATIVE_${PN} = "sendmail"
+ALTERNATIVE_TARGET[sendmail] = "${bindir}/msmtp"
+ALTERNATIVE_LINK_NAME[sendmail] = "${sbindir}/sendmail"
+ALTERNATIVE_PRIORITY = "100"
-- 
1.7.4.1



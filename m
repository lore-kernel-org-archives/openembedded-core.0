Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5B39E7E365
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 01:32:38 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id n27so424885pgm.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 18:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Dqa3W6Qa+F5g4aCbwBMjkoXvkz+GzblnesHZRpkdPxE=;
	b=OLrRSt1ysI4dplhvxsBI8JiM5le6QH5Qb5BHEaD/d6YAmmGa0SDNOttbGV5LEzxYJK
	aEH0XiL9G9qCqsd2Xf7tRssqdc6rJ/HLL8cJ+e7m5biznpo1C//v0moeKX5jVrEXaEsj
	RDWabAXg095t8SVV4fsg/OWnKFjDNaVFgH6wqV3o83qypWO6sPNMgO3bHzdF7UY/xU8w
	knwcuIJfsH34xbjB6avzHB1LN0ODc/WYuIRWScuJsh/CZmU8kVoGkNzq2+DPG6LhpGHS
	aOgEPvlx82RTv/+VYkvRdW0rWAPPtgbBWQYubZcMS26MMaiFF4sepwRXbCHbgSP6AEbG
	uwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Dqa3W6Qa+F5g4aCbwBMjkoXvkz+GzblnesHZRpkdPxE=;
	b=sUtclkFE2yHG+1LrQ16EcSQtxxDJ83HfUKHmQPWgztECDA7O0/YqaaQwBMlF/ac+8h
	2xZml4MTNebwVJ/eRKVKUasdvQceq9kP0OXiugrPmcff6NNlZQX06s4uUF9UTa2v6wBp
	ht7aVokndcf2hiTDu3c/IEoIs+Sph2NPjzQ3iVnL3SMZPqgE30qKs6XiB/3R5bS6ztrU
	zrDlrrijQoizk51dWpX81v5sFyrnU49kde8SoyxBf/gAUFHtN3vpOdSg73E4F/+c2tJ9
	x0YoNSgmbiiUrdWjKAuUsBuSPyOiMoSDKfv6Ge4vos9dvFyyOjLdynLWfPq39JCwDbUh
	j3YA==
X-Gm-Message-State: APjAAAVlEGBrrwQDM5EkmgXSjlPBJ0GEidVVX7psVBD7wooN9biUAYF/
	RdHYJlO5Il0vPRttnZ2HBglkPFAGBKs=
X-Google-Smtp-Source: APXvYqy+mmL8Tq3yer+95m8swvaAKNfWiLoILdIF430fY/UNSYpZvWNclCN/keZ4jKanCaLFGPY9ow==
X-Received: by 2002:aa7:808d:: with SMTP id v13mr60823890pff.198.1558488758693;
	Tue, 21 May 2019 18:32:38 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::3506])
	by smtp.gmail.com with ESMTPSA id
	p64sm34197147pfp.72.2019.05.21.18.32.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 May 2019 18:32:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2019 18:32:28 -0700
Message-Id: <20190522013228.7591-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190522013228.7591-1-raj.khem@gmail.com>
References: <20190522013228.7591-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] elfutils: Fix eu-* utils builds for musl
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
X-List-Received-Date: Wed, 22 May 2019 01:32:38 -0000
Content-Transfer-Encoding: 8bit

Re-organize the musl patches in three different areas namely
libs, utils and tests, this will help maintain them in future
version bumps

Add obstack dependency on musl targets which is needed for eu-*

PN and PN-binutils is not empty anymore on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../elfutils/elfutils_0.176.bb                |  15 +-
 ...-err-variable-and-function-conflicts.patch |  91 --------
 ...ternatives-for-glibc-assumptions-hel.patch | 196 ------------------
 .../elfutils/files/musl-libs.patch            | 111 ++++++++++
 .../elfutils/files/musl-obstack-fts.patch     | 105 ++++++++++
 .../files/{musl.patch => musl-tests.patch}    |   0
 .../elfutils/files/musl-utils.patch           | 136 ++++++++++++
 7 files changed, 359 insertions(+), 295 deletions(-)
 delete mode 100644 meta/recipes-devtools/elfutils/files/0001-fix-err-variable-and-function-conflicts.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/musl-libs.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/musl-obstack-fts.patch
 rename meta/recipes-devtools/elfutils/files/{musl.patch => musl-tests.patch} (100%)
 create mode 100644 meta/recipes-devtools/elfutils/files/musl-utils.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.176.bb b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
index 157551e6af..1729e44d5f 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.176.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
@@ -4,7 +4,7 @@ SECTION = "base"
 LICENSE = "GPLv2 & LGPLv3+ & GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "libtool bzip2 zlib virtual/libintl"
-DEPENDS_append_libc-musl = " argp-standalone fts "
+DEPENDS_append_libc-musl = " argp-standalone fts musl-obstack "
 # The Debian patches below are from:
 # http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.175-1.debian.tar.xz
 SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
@@ -31,12 +31,13 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://0001-skip-the-test-when-gcc-not-deployed.patch \
            file://run-ptest \
            file://ptest.patch \
-           file://musl.patch \
            "
-SRC_URI_append_libc-musl = " file://0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch \
-                             file://0001-fix-err-variable-and-function-conflicts.patch \
-"
-
+SRC_URI_append_libc-musl = " \
+           file://musl-obstack-fts.patch \
+           file://musl-libs.patch \
+           file://musl-utils.patch \
+           file://musl-tests.patch \
+           "
 SRC_URI[md5sum] = "077e4f49320cad82bf17a997068b1db9"
 SRC_URI[sha256sum] = "eb5747c371b0af0f71e86215a5ebb88728533c3a104a43d4231963f308cd1023"
 
@@ -73,8 +74,6 @@ do_install_ptest() {
 EXTRA_OEMAKE_class-native = ""
 EXTRA_OEMAKE_class-nativesdk = ""
 
-ALLOW_EMPTY_${PN}_libc-musl = "1"
-
 BBCLASSEXTEND = "native nativesdk"
 
 # Package utilities separately
diff --git a/meta/recipes-devtools/elfutils/files/0001-fix-err-variable-and-function-conflicts.patch b/meta/recipes-devtools/elfutils/files/0001-fix-err-variable-and-function-conflicts.patch
deleted file mode 100644
index 433db133b2..0000000000
--- a/meta/recipes-devtools/elfutils/files/0001-fix-err-variable-and-function-conflicts.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 2c50fe7068bd6911958c6d851aef88179e73bb21 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <Mingli.Yu@windriver.com>
-Date: Tue, 16 Apr 2019 15:30:38 +0800
-Subject: [PATCH] fix err variable and function conflicts
-
-There comes below build failure with musl when
-ptest enabled.
-| In file included from ../../elfutils-0.176/tests/dwfl-proc-attach.c:33:
-| ../../elfutils-0.176/lib/system.h:63:35: error: called object 'err' is not a function or function pointer
-|  #define error(status, errno, ...) err(status, __VA_ARGS__)
-|                                    ^~~
-| ../../elfutils-0.176/tests/dwfl-proc-attach.c:92:5: note: in expansion of macro 'error'
-|      error (-1, 0, "dwfl_linux_proc_attach pid %d: %s", pid,
-|      ^~~~~
-| ../../elfutils-0.176/tests/dwfl-proc-attach.c:79:7: note: declared here
-|    int err;
-|        ^~~
-
-It is because there is no error.h in musl and
-the patch 0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch
-has updated to use err.h to replace error.h
-and also added macro definiton as below when
-use musl.
- #define error(status, errno, ...) err(status, __VA_ARGS__)
-
-And in err.h, there is below logic:
-_Noreturn void err(int, const char *, ...);
-
-But when ptest enabled, there comes below error
-as there is both variable and function defined
-to be err in tests/dwfl-proc-attach.c.
-So change the err variable's name to workaround
-the build failure with musl.
-
-Upstream-Status: Inappropriate [workaround in musl]
-
-Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
----
- tests/dwfl-proc-attach.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-Index: elfutils-0.176/tests/dwfl-proc-attach.c
-===================================================================
---- elfutils-0.176.orig/tests/dwfl-proc-attach.c
-+++ elfutils-0.176/tests/dwfl-proc-attach.c
-@@ -76,10 +76,10 @@ main (int argc __attribute__ ((unused)),
-       char **argv __attribute__ ((unused)))
- {
-   /* Create two extra threads to iterate through.  */
--  int err;
--  if ((err = pthread_create (&thread1, NULL, sleeper, NULL)) != 0)
-+  int err1;
-+  if ((err1 = pthread_create (&thread1, NULL, sleeper, NULL)) != 0)
-     error (-1, err, "Couldn't create thread1");
--  if ((err = pthread_create (&thread2, NULL, sleeper, NULL)) != 0)
-+  if ((err1 = pthread_create (&thread2, NULL, sleeper, NULL)) != 0)
-     error (-1, err, "Couldn't create thread2");
- 
-   Dwfl *dwfl = dwfl_begin (&proc_callbacks);
-Index: elfutils-0.176/tests/backtrace.c
-===================================================================
---- elfutils-0.176.orig/tests/backtrace.c
-+++ elfutils-0.176/tests/backtrace.c
-@@ -219,23 +219,23 @@ dump (Dwfl *dwfl)
- {
-   ptrdiff_t ptrdiff = dwfl_getmodules (dwfl, dump_modules, NULL, 0);
-   assert (ptrdiff == 0);
--  bool err = false;
-+  bool err1 = false;
-   switch (dwfl_getthreads (dwfl, thread_callback, NULL))
-     {
-     case 0:
-       break;
-     case DWARF_CB_ABORT:
--      err = true;
-+      err1 = true;
-       break;
-     case -1:
-       error (0, 0, "dwfl_getthreads: %s", dwfl_errmsg (-1));
--      err = true;
-+      err1 = true;
-       break;
-     default:
-       abort ();
-     }
-   callback_verify (0, 0, 0, NULL, dwfl);
--  if (err)
-+  if (err1)
-     exit (EXIT_FAILURE);
- }
- 
diff --git a/meta/recipes-devtools/elfutils/files/0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch b/meta/recipes-devtools/elfutils/files/0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch
deleted file mode 100644
index 10cdac646c..0000000000
--- a/meta/recipes-devtools/elfutils/files/0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch
+++ /dev/null
@@ -1,196 +0,0 @@
-From 990d377a92f4bab04bf6820fc81b3dcb6cf5e31d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 2 Jul 2018 09:52:23 +0800
-Subject: [PATCH] build: Provide alternatives for glibc assumptions helps
- compiling it on musl
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Rebase to 0.175
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
----
- Makefile.am                      |  2 +-
- lib/fixedsizehash.h              |  1 -
- lib/system.h                     | 12 +++++++++++-
- libdw/Makefile.am                |  3 ++-
- libdwfl/dwfl_build_id_find_elf.c |  1 +
- libdwfl/dwfl_error.c             |  4 +++-
- libdwfl/dwfl_module_getdwarf.c   |  1 +
- libdwfl/libdwfl_crc32_file.c     |  9 +++++++++
- libdwfl/linux-kernel-modules.c   |  1 +
- libelf/elf.h                     |  8 ++++++--
- libelf/libelf.h                  |  1 +
- libelf/libelfP.h                 |  1 +
- 12 files changed, 37 insertions(+), 7 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 2ff444e..41f77df 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -28,7 +28,7 @@ pkginclude_HEADERS = version.h
- 
- # Add doc back when we have some real content.
- SUBDIRS = config m4 lib libelf libebl libdwelf libdwfl libdw libcpu libasm \
--	  backends src po tests
-+	  backends po tests
- 
- EXTRA_DIST = elfutils.spec GPG-KEY NOTES CONTRIBUTING \
- 	     COPYING COPYING-GPLV2 COPYING-LGPLV3
-diff --git a/lib/fixedsizehash.h b/lib/fixedsizehash.h
-index dac2a5f..43016fc 100644
---- a/lib/fixedsizehash.h
-+++ b/lib/fixedsizehash.h
-@@ -30,7 +30,6 @@
- #include <errno.h>
- #include <stdlib.h>
- #include <string.h>
--#include <sys/cdefs.h>
- 
- #include <system.h>
- 
-diff --git a/lib/system.h b/lib/system.h
-index 292082b..308a762 100644
---- a/lib/system.h
-+++ b/lib/system.h
-@@ -30,7 +30,7 @@
- #define LIB_SYSTEM_H	1
- 
- #include <errno.h>
--#include <error.h>
-+#include <err.h>
- #include <stddef.h>
- #include <stdint.h>
- #include <sys/param.h>
-@@ -51,6 +51,8 @@
- #else
- # error "Unknown byte order"
- #endif
-+
-+#define error(status, errno, ...) err(status, __VA_ARGS__)
- 
- #ifndef MAX
- #define MAX(m, n) ((m) < (n) ? (n) : (m))
-diff --git a/libdw/Makefile.am b/libdw/Makefile.am
-index 7a3d532..7ac1241 100644
---- a/libdw/Makefile.am
-+++ b/libdw/Makefile.am
-@@ -108,7 +108,8 @@ am_libdw_pic_a_OBJECTS = $(libdw_a_SOURCES:.c=.os)
- libdw_so_LIBS = libdw_pic.a ../libdwelf/libdwelf_pic.a \
- 	  ../libdwfl/libdwfl_pic.a ../libebl/libebl.a
- libdw_so_DEPS = ../lib/libeu.a ../libelf/libelf.so
--libdw_so_LDLIBS = $(libdw_so_DEPS) -ldl -lz $(argp_LDADD) $(zip_LIBS)
-+fts_LDADD = -lfts
-+libdw_so_LDLIBS = $(libdw_so_DEPS) -ldl -lz $(argp_LDADD) $(zip_LIBS) $(fts_LDADD)
- libdw_so_SOURCES =
- libdw.so$(EXEEXT): $(srcdir)/libdw.map $(libdw_so_LIBS) $(libdw_so_DEPS)
- # The rpath is necessary for libebl because its $ORIGIN use will
-diff --git a/libdwfl/dwfl_build_id_find_elf.c b/libdwfl/dwfl_build_id_find_elf.c
-index cc6c3f6..b06ab59 100644
---- a/libdwfl/dwfl_build_id_find_elf.c
-+++ b/libdwfl/dwfl_build_id_find_elf.c
-@@ -31,6 +31,7 @@
- #endif
- 
- #include "libdwflP.h"
-+#include "system.h"
- #include <inttypes.h>
- #include <fcntl.h>
- #include <unistd.h>
-diff --git a/libdwfl/dwfl_error.c b/libdwfl/dwfl_error.c
-index 7bcf61c..c345797 100644
---- a/libdwfl/dwfl_error.c
-+++ b/libdwfl/dwfl_error.c
-@@ -140,6 +140,7 @@ __libdwfl_seterrno (Dwfl_Error error)
- const char *
- dwfl_errmsg (int error)
- {
-+  static __thread char s[64] = "";
-   if (error == 0 || error == -1)
-     {
-       int last_error = global_error;
-@@ -154,7 +155,8 @@ dwfl_errmsg (int error)
-   switch (error &~ 0xffff)
-     {
-     case OTHER_ERROR (ERRNO):
--      return strerror_r (error & 0xffff, "bad", 0);
-+      strerror_r (error & 0xffff, s, sizeof(s));
-+      return s;
-     case OTHER_ERROR (LIBELF):
-       return elf_errmsg (error & 0xffff);
-     case OTHER_ERROR (LIBDW):
-diff --git a/libdwfl/dwfl_module_getdwarf.c b/libdwfl/dwfl_module_getdwarf.c
-index 56e6105..f4a0649 100644
---- a/libdwfl/dwfl_module_getdwarf.c
-+++ b/libdwfl/dwfl_module_getdwarf.c
-@@ -35,6 +35,7 @@
- #include <fcntl.h>
- #include <string.h>
- #include <unistd.h>
-+#include "system.h"
- #include "../libdw/libdwP.h"	/* DWARF_E_* values are here.  */
- #include "../libelf/libelfP.h"
- #include "system.h"
-diff --git a/libdwfl/linux-kernel-modules.c b/libdwfl/linux-kernel-modules.c
-index 360e4ee..b5aa397 100644
---- a/libdwfl/linux-kernel-modules.c
-+++ b/libdwfl/linux-kernel-modules.c
-@@ -41,6 +41,7 @@
- 
- #include "libelfP.h"
- #include "libdwflP.h"
-+#include "system.h"
- #include <inttypes.h>
- #include <errno.h>
- #include <stdio.h>
-diff --git a/libelf/elf.h b/libelf/elf.h
-index 5dc632b..14da1b7 100644
---- a/libelf/elf.h
-+++ b/libelf/elf.h
-@@ -21,7 +21,9 @@
- 
- #include <features.h>
- 
--__BEGIN_DECLS
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
- 
- /* Standard ELF types.  */
- 
-@@ -3937,6 +3939,8 @@ enum
- #define R_METAG_TLS_LE_HI16	60
- #define R_METAG_TLS_LE_LO16	61
- 
--__END_DECLS
-+#ifdef __cplusplus
-+}
-+#endif
- 
- #endif	/* elf.h */
-diff --git a/libelf/libelf.h b/libelf/libelf.h
-index 1ff11c9..c21e018 100644
---- a/libelf/libelf.h
-+++ b/libelf/libelf.h
-@@ -29,6 +29,7 @@
- #ifndef _LIBELF_H
- #define _LIBELF_H 1
- 
-+#include <fcntl.h>
- #include <stdint.h>
- #include <sys/types.h>
- 
-diff --git a/libelf/libelfP.h b/libelf/libelfP.h
-index 9f3e8e9..10a347a 100644
---- a/libelf/libelfP.h
-+++ b/libelf/libelfP.h
-@@ -32,6 +32,7 @@
- 
- #include <ar.h>
- #include <gelf.h>
-+#include <libelf.h>
- 
- #include <errno.h>
- #include <stdbool.h>
diff --git a/meta/recipes-devtools/elfutils/files/musl-libs.patch b/meta/recipes-devtools/elfutils/files/musl-libs.patch
new file mode 100644
index 0000000000..51ca630ef8
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/musl-libs.patch
@@ -0,0 +1,111 @@
+Collection of fixes needed to compile libelf and other libraries
+provided by elfutils for musl targets
+
+error is glibc specific API, so this patch will mostly not accepted
+upstream given that elfutils has been closely tied to glibc
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Inappropriate [workaround for musl]
+
+--- /dev/null
++++ b/lib/error.h
+@@ -0,0 +1,27 @@
++#ifndef _ERROR_H_
++#define _ERROR_H_
++
++#include <stdarg.h>
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++#include <errno.h>
++
++static unsigned int error_message_count = 0;
++
++static inline void error(int status, int errnum, const char* format, ...)
++{
++	va_list ap;
++	fprintf(stderr, "%s: ", program_invocation_name);
++	va_start(ap, format);
++	vfprintf(stderr, format, ap);
++	va_end(ap);
++	if (errnum)
++		fprintf(stderr, ": %s", strerror(errnum));
++	fprintf(stderr, "\n");
++	error_message_count++;
++	if (status)
++		exit(status);
++}
++
++#endif	/* _ERROR_H_ */
+--- a/lib/fixedsizehash.h
++++ b/lib/fixedsizehash.h
+@@ -30,7 +30,6 @@
+ #include <errno.h>
+ #include <stdlib.h>
+ #include <string.h>
+-#include <sys/cdefs.h>
+ 
+ #include <system.h>
+ 
+--- a/lib/libeu.h
++++ b/lib/libeu.h
+@@ -29,6 +29,7 @@
+ #ifndef LIBEU_H
+ #define LIBEU_H
+ 
++#include "system.h"
+ #include <stddef.h>
+ #include <stdint.h>
+ 
+--- a/libdwfl/dwfl_error.c
++++ b/libdwfl/dwfl_error.c
+@@ -154,7 +154,16 @@ dwfl_errmsg (int error)
+   switch (error &~ 0xffff)
+     {
+     case OTHER_ERROR (ERRNO):
++#if defined(__GLIBC__)
+       return strerror_r (error & 0xffff, "bad", 0);
++#else
++      {
++        static __thread char buf[128] = "";
++        if (strerror_r (error & 0xffff, buf, sizeof(buf)) == 0)
++          return buf;
++      }
++      return "strerror_r() failed";
++#endif
+     case OTHER_ERROR (LIBELF):
+       return elf_errmsg (error & 0xffff);
+     case OTHER_ERROR (LIBDW):
+--- a/libdwfl/linux-kernel-modules.c
++++ b/libdwfl/linux-kernel-modules.c
+@@ -50,6 +50,7 @@
+ #include <sys/utsname.h>
+ #include <fcntl.h>
+ #include <unistd.h>
++#include "system.h"
+ 
+ /* If fts.h is included before config.h, its indirect inclusions may not
+    give us the right LFS aliases of these functions, so map them manually.  */
+--- a/libelf/elf.h
++++ b/libelf/elf.h
+@@ -21,7 +21,9 @@
+ 
+ #include <features.h>
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ 
+ /* Standard ELF types.  */
+ 
+@@ -3937,6 +3939,7 @@ enum
+ #define R_METAG_TLS_LE_HI16	60
+ #define R_METAG_TLS_LE_LO16	61
+ 
+-__END_DECLS
+-
++#ifdef __cplusplus
++}
++#endif
+ #endif	/* elf.h */
diff --git a/meta/recipes-devtools/elfutils/files/musl-obstack-fts.patch b/meta/recipes-devtools/elfutils/files/musl-obstack-fts.patch
new file mode 100644
index 0000000000..0fb7eb9236
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/musl-obstack-fts.patch
@@ -0,0 +1,105 @@
+Look for libfts and libobstack during configure, these
+libraries are external to libc when using musl, whereas
+on glibc these libraries are provided in libc itself.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Inappropriate [workaround for musl]
+--- a/configure.ac
++++ b/configure.ac
+@@ -494,6 +494,60 @@ else
+ fi
+ AC_SUBST([argp_LDADD])
+ 
++dnl Check if we have fts available from our libc
++AC_LINK_IFELSE(
++	[AC_LANG_PROGRAM(
++		[#if !defined(__x86_64__)
++		#undef  _FILE_OFFSET_BITS
++		#define _FILE_OFFSET_BITS 32
++		#endif
++		#include <fts.h>],
++		[FTS* fts = 0; return fts_close(fts); return 0;]
++		)],
++	[libc_has_fts="true"],
++	[libc_has_fts="false"]
++)
++
++dnl If our libc doesn't provide fts, then test for libfts
++if test "$libc_has_fts" = "false" ; then
++	AC_MSG_WARN("libc does not have fts")
++	AC_CHECK_LIB([fts], [fts_close], [have_fts="true"], [have_fts="false"])
++
++	if test "$have_fts" = "false"; then
++		AC_MSG_ERROR("no libfts found")
++	else
++		fts_LDADD="-lfts"
++	fi
++else
++	fts_LDADD=""
++fi
++AC_SUBST([fts_LDADD])
++
++dnl Check if we have obstack available from our libc
++AC_LINK_IFELSE(
++	[AC_LANG_PROGRAM(
++		[#include <obstack.h>],
++		[_obstack_begin(0, 0, 0, NULL, NULL); return 0;]
++		)],
++	[libc_has_obstack="true"],
++	[libc_has_obstack="false"]
++)
++
++dnl If our libc doesn't provide obstack, then test for libobstack
++if test "$libc_has_obstack" = "false" ; then
++	AC_MSG_WARN("libc does not have obstack")
++	AC_CHECK_LIB([obstack], [_obstack_begin], [have_obstack="true"], [have_obstack="false"])
++
++	if test "$have_obstack" = "false"; then
++		AC_MSG_ERROR("no libobstack found")
++	else
++		obstack_LDADD="-lobstack"
++	fi
++else
++	obstack_LDADD=""
++fi
++AC_SUBST([obstack_LDADD])
++
+ dnl The directories with content.
+ 
+ dnl Documentation.
+--- a/libdw/Makefile.am
++++ b/libdw/Makefile.am
+@@ -108,7 +108,7 @@ am_libdw_pic_a_OBJECTS = $(libdw_a_SOURC
+ libdw_so_LIBS = libdw_pic.a ../libdwelf/libdwelf_pic.a \
+ 	  ../libdwfl/libdwfl_pic.a ../libebl/libebl.a
+ libdw_so_DEPS = ../lib/libeu.a ../libelf/libelf.so
+-libdw_so_LDLIBS = $(libdw_so_DEPS) -ldl -lz $(argp_LDADD) $(zip_LIBS)
++libdw_so_LDLIBS = $(libdw_so_DEPS) -ldl -lz $(argp_LDADD) $(fts_LDADD) $(zip_LIBS)
+ libdw_so_SOURCES =
+ libdw.so$(EXEEXT): $(srcdir)/libdw.map $(libdw_so_LIBS) $(libdw_so_DEPS)
+ # The rpath is necessary for libebl because its $ORIGIN use will
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -68,8 +68,8 @@ ar_no_Wstack_usage = yes
+ unstrip_no_Wstack_usage = yes
+ 
+ readelf_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) $(argp_LDADD) -ldl
+-nm_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) $(argp_LDADD) -ldl \
+-	   $(demanglelib)
++nm_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) $(argp_LDADD) \
++	   $(obstack_LDADD) -ldl $(demanglelib)
+ size_LDADD = $(libelf) $(libeu) $(argp_LDADD)
+ strip_LDADD = $(libebl) $(libelf) $(libdw) $(libeu) $(argp_LDADD) -ldl
+ elflint_LDADD  = $(libebl) $(libelf) $(libeu) $(argp_LDADD) -ldl
+@@ -77,9 +77,9 @@ findtextrel_LDADD = $(libdw) $(libelf) $
+ addr2line_LDADD = $(libdw) $(libelf) $(libeu) $(argp_LDADD) $(demanglelib)
+ elfcmp_LDADD = $(libebl) $(libelf) $(libeu) $(argp_LDADD) -ldl
+ objdump_LDADD  = $(libasm) $(libebl) $(libelf) $(libeu) $(argp_LDADD) -ldl
+-ranlib_LDADD = libar.a $(libelf) $(libeu) $(argp_LDADD)
++ranlib_LDADD = libar.a $(libelf) $(libeu) $(argp_LDADD) $(obstack_LDADD)
+ strings_LDADD = $(libelf) $(libeu) $(argp_LDADD)
+-ar_LDADD = libar.a $(libelf) $(libeu) $(argp_LDADD)
++ar_LDADD = libar.a $(libelf) $(libeu) $(argp_LDADD) $(obstack_LDADD)
+ unstrip_LDADD = $(libebl) $(libelf) $(libdw) $(libeu) $(argp_LDADD) -ldl
+ stack_LDADD = $(libebl) $(libelf) $(libdw) $(libeu) $(argp_LDADD) -ldl $(demanglelib)
+ elfcompress_LDADD = $(libebl) $(libelf) $(libdw) $(libeu) $(argp_LDADD)
diff --git a/meta/recipes-devtools/elfutils/files/musl.patch b/meta/recipes-devtools/elfutils/files/musl-tests.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/files/musl.patch
rename to meta/recipes-devtools/elfutils/files/musl-tests.patch
diff --git a/meta/recipes-devtools/elfutils/files/musl-utils.patch b/meta/recipes-devtools/elfutils/files/musl-utils.patch
new file mode 100644
index 0000000000..4547bbbf16
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/musl-utils.patch
@@ -0,0 +1,136 @@
+Provide missing defines which otherwise are available on glibc system headers
+
+Alter the error API to match posix version
+use qsort instead of qsort_r which is glibc specific API
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Inappropriate [workaround for musl]
+--- a/src/arlib.h
++++ b/src/arlib.h
+@@ -29,6 +29,12 @@
+ #include <stdint.h>
+ #include <sys/types.h>
+ 
++#if !defined(ALLPERMS)
++# define ALLPERMS (S_ISUID|S_ISGID|S_ISVTX|S_IRWXU|S_IRWXG|S_IRWXO) /* 07777 */
++#endif
++#if !defined(DEFFILEMODE)
++# define DEFFILEMODE (S_IRUSR|S_IWUSR|S_IRGRP|S_IWGRP|S_IROTH|S_IWOTH)/* 0666*/
++#endif
+ 
+ /* State of -D/-U flags.  */
+ extern bool arlib_deterministic_output;
+--- a/src/elfcompress.c
++++ b/src/elfcompress.c
+@@ -37,6 +37,13 @@
+ #include "libeu.h"
+ #include "printversion.h"
+ 
++#if !defined(ALLPERMS)
++# define ALLPERMS (S_ISUID|S_ISGID|S_ISVTX|S_IRWXU|S_IRWXG|S_IRWXO) /* 07777 */
++#endif
++#if !defined(FNM_EXTMATCH)
++# define FNM_EXTMATCH ( 1 << 5)
++#endif
++
+ /* Name and version of program.  */
+ ARGP_PROGRAM_VERSION_HOOK_DEF = print_version;
+ 
+--- a/src/readelf.c
++++ b/src/readelf.c
+@@ -4792,10 +4792,11 @@ listptr_base (struct listptr *p)
+   return cudie_base (&cu);
+ }
+ 
++static const char *listptr_name;
++
+ static int
+-compare_listptr (const void *a, const void *b, void *arg)
++compare_listptr (const void *a, const void *b)
+ {
+-  const char *name = arg;
+   struct listptr *p1 = (void *) a;
+   struct listptr *p2 = (void *) b;
+ 
+@@ -4811,21 +4812,21 @@ compare_listptr (const void *a, const vo
+ 	  p1->warned = p2->warned = true;
+ 	  error (0, 0,
+ 		 gettext ("%s %#" PRIx64 " used with different address sizes"),
+-		 name, (uint64_t) p1->offset);
++		 listptr_name, (uint64_t) p1->offset);
+ 	}
+       if (p1->dwarf64 != p2->dwarf64)
+ 	{
+ 	  p1->warned = p2->warned = true;
+ 	  error (0, 0,
+ 		 gettext ("%s %#" PRIx64 " used with different offset sizes"),
+-		 name, (uint64_t) p1->offset);
++		 listptr_name, (uint64_t) p1->offset);
+ 	}
+       if (listptr_base (p1) != listptr_base (p2))
+ 	{
+ 	  p1->warned = p2->warned = true;
+ 	  error (0, 0,
+ 		 gettext ("%s %#" PRIx64 " used with different base addresses"),
+-		 name, (uint64_t) p1->offset);
++		 listptr_name, (uint64_t) p1->offset);
+ 	}
+       if (p1->attr != p2 ->attr)
+ 	{
+@@ -4833,7 +4834,7 @@ compare_listptr (const void *a, const vo
+ 	  error (0, 0,
+ 		 gettext ("%s %#" PRIx64
+ 			  " used with different attribute %s and %s"),
+-		 name, (uint64_t) p1->offset, dwarf_attr_name (p2->attr),
++		 listptr_name, (uint64_t) p1->offset, dwarf_attr_name (p2->attr),
+ 		 dwarf_attr_name (p2->attr));
+ 	}
+     }
+@@ -4905,8 +4906,11 @@ static void
+ sort_listptr (struct listptr_table *table, const char *name)
+ {
+   if (table->n > 0)
+-    qsort_r (table->table, table->n, sizeof table->table[0],
+-	     &compare_listptr, (void *) name);
++    {
++      listptr_name = name;
++      qsort (table->table, table->n, sizeof table->table[0],
++	    &compare_listptr);
++    }
+ }
+ 
+ static bool
+--- a/src/strip.c
++++ b/src/strip.c
+@@ -46,6 +46,13 @@
+ #include <system.h>
+ #include <printversion.h>
+ 
++#if !defined(ACCESSPERMS)
++# define ACCESSPERMS (S_IRWXU|S_IRWXG|S_IRWXO) /* 0777 */
++#endif
++#if !defined(FNM_EXTMATCH)
++# define FNM_EXTMATCH (1 << 5) /* Use ksh-like extended matching. */
++#endif
++
+ typedef uint8_t GElf_Byte;
+ 
+ /* Name and version of program.  */
+--- a/src/unstrip.c
++++ b/src/unstrip.c
+@@ -56,6 +56,15 @@
+ # define _(str) gettext (str)
+ #endif
+ 
++#ifndef strndupa
++#define strndupa(s, n) \
++       ({const char *__in = (s); \
++         size_t __len = strnlen (__in, (n)) + 1; \
++         char *__out = (char *) alloca (__len); \
++         __out[__len-1] = '\0'; \
++         (char *) memcpy (__out, __in, __len-1);})
++#endif
++
+ /* Name and version of program.  */
+ ARGP_PROGRAM_VERSION_HOOK_DEF = print_version;
+ 
-- 
2.21.0



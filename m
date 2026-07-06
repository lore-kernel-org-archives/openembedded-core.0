Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19F2DC44500
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 13:50:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.151458.1783345814797725744
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 06:50:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=CIeMwTKr;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7A852BCB
	for <openembedded-core@lists.openembedded.org>; Mon,  6 Jul 2026 06:50:09 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 71EB13F7B4
	for <openembedded-core@lists.openembedded.org>; Mon,  6 Jul 2026 06:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783345814; bh=Gy6Cl5tUIO02dQmRJzneCpBeQFzOlOZA4BYlPjlttow=;
	h=From:To:Subject:Date:From;
	b=CIeMwTKri0IMQ4KWwEP9BFLJFqUmk1UjsLNhObjTxxtd4kOxLTZZW7rBZlG3hAYGp
	 ruGqC+M9Z7KbhQcvl7RZFDucU7MsRjextSPD5dDva5ML+Fmx1Ot7NFdTflEcWjF/C5
	 7mxA611Cf0hoQ6HypxFcIGnhvXU6ZfwmKliIENIE=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] nasm: upgrade 3.01 -> 3.02
Date: Mon,  6 Jul 2026 14:50:09 +0100
Message-ID: <20260706135009.1818867-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 13:50:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240271

Drop the backported C23 patch, and replace the debug-prefix-map patches
with backports that are now merged upstream (thanks Joshua Watt).

Out-of-tree builds work again, so switch back to autotools.

Upstream release notes:
- Fix build problems on C23 compilers using a pre-C23 version of <stdbool=
.h>.
- The immediate form of the JMPE instruction (opcode 0F B8) has been
  changed to an absolute address.
- Various build fixes.
- Corrections to assembling encodings.
- Corrections to disassembling.
- Whole bunch of minor fixes to operand sizes, operand size prefixes.
- Add support for C2y-style \o escape sequences, braced escape
  sequences, and as NASM extensions, decimal escape sequences (\d) and
  control-character escape sequences (\^).
- Fix generation of the short opcodes for ADD, OR, ADC, SBB, AND, SUB,
  XOR, and CMP AL,imm8.
- Fix truncation of the generated constant to 63 bits when invoking a
  single-line macro when an argument is defined as =3D/b or =3D/ub.
- Add an %env() preprocessor function as a more robust and flexible
  alternative to the %! construct.
- The maximum number of multi-line macro parameters is now a
  configurable limit.
- The --limi- options and %pragma limit now accept the keywords
  default, maximum, and reset.
- Fix parsing of seg:offs=E2=80=93style FAR pointers in EQU.
- Fix the %clear preprocessor directive hanging when given parameters.
- Fix a crash when -M directives were used in response files.
- New listing option -Lc to include the contents of INCBIN files.
- New listing option -Lt to include the output from every iteration of
  TIMES and ALIGN directives.
- The %pragma list options directive now support resetting options to
  their command-line default.
- New predefined macros __?LIST_OPTIONS?__ and
  __?LIST_OPTIONS_DEFAULT?__ to query the active and command-line
  default listing options.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...0001-compiler.h-Backport-C23-support.patch |  96 --
 .../0001-nasmlib-file-add-nasm_remove.patch   |  80 ++
 .../nasm/nasm/0001-stdlib-Add-strlcat.patch   | 114 ---
 .../0002-Add-debug-prefix-map-option.patch    | 328 -------
 ...ndling-of-primary-input-output-files.patch | 819 ++++++++++++++++++
 .../0003-Add-debug-prefix-map-option.patch    | 409 +++++++++
 .../nasm/{nasm_3.01.bb =3D> nasm_3.02.bb}       |  11 +-
 7 files changed, 1313 insertions(+), 544 deletions(-)
 delete mode 100644 meta/recipes-devtools/nasm/nasm/0001-compiler.h-Backp=
ort-C23-support.patch
 create mode 100644 meta/recipes-devtools/nasm/nasm/0001-nasmlib-file-add=
-nasm_remove.patch
 delete mode 100644 meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlc=
at.patch
 delete mode 100644 meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix=
-map-option.patch
 create mode 100644 meta/recipes-devtools/nasm/nasm/0002-Refactor-the-han=
dling-of-primary-input-output-files.patch
 create mode 100644 meta/recipes-devtools/nasm/nasm/0003-Add-debug-prefix=
-map-option.patch
 rename meta/recipes-devtools/nasm/{nasm_3.01.bb =3D> nasm_3.02.bb} (62%)

diff --git a/meta/recipes-devtools/nasm/nasm/0001-compiler.h-Backport-C23=
-support.patch b/meta/recipes-devtools/nasm/nasm/0001-compiler.h-Backport=
-C23-support.patch
deleted file mode 100644
index e1820870dd1..00000000000
--- a/meta/recipes-devtools/nasm/nasm/0001-compiler.h-Backport-C23-suppor=
t.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From e402e82d34569b4642ffbb3344c7240d1ea07776 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 9 Dec 2025 17:17:36 -0800
-Subject: [PATCH] compiler.h: Backport C23 support
-
-These is a collection of changes done to compiler.h post
-3.01 release. It fixes build with non-glibc ( musl )
-builds especially with clang compiler which is more
-fussy
-
-Brings in squashed changed for compiler.h from
-
-https://github.com/netwide-assembler/nasm/commit/44e89ba9b650b5e1533bca4=
3682e167f51a3511f
-https://github.com/netwide-assembler/nasm/commit/746e7c9efa37cec9a44d84a=
1e96b8c38f385cc1f
-https://github.com/netwide-assembler/nasm/commit/44ec97993a28ba109f98c45=
14e27cef813720399#diff-8e3e9367147ea2bbe07af8d84c1e07f80f5e19ca2328242632=
4e396ee05947ba
-https://github.com/netwide-assembler/nasm/commit/f4f7d18c06449a1859a62a1=
0e7e24ca644032dff#diff-8e3e9367147ea2bbe07af8d84c1e07f80f5e19ca2328242632=
4e396ee05947ba
-
-Upstream-Status: Backport [Above patches from master branch]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- include/compiler.h | 42 ++++++++++++++++++------------------------
- 1 file changed, 18 insertions(+), 24 deletions(-)
-
---- a/include/compiler.h
-+++ b/include/compiler.h
-@@ -185,19 +185,10 @@ char * pure_func strrchrnul(const char *
- size_t strlcat(char *, const char *, size_t);
- #endif
-
--#if !defined(__cplusplus) || (__STDC_VERSION >=3D 202311L)
- /* C++ and C23 have bool, false, and true as proper keywords */
-+#if !defined(__cplusplus) && (__STDC_VERSION__ < 202311L)
- # ifdef HAVE_STDBOOL_H
--/* If <stdbool.h> exists, include it explicitly to prevent it from
--   begin included later, causing the "bool" macro to be defined. */
- #  include <stdbool.h>
--#  ifdef bool
--/* Force bool to be a typedef instead of a macro. What a "clever" hack
--   this is... */
--    typedef bool                /* The macro definition of bool */
--#  undef bool
--        bool;                   /* No longer the macro definition */
--#  endif
- # elif defined(HAVE___BOOL)
-    typedef _Bool bool;
- #  define false 0
-@@ -205,14 +196,10 @@ size_t strlcat(char *, const char *, siz
- # else
- /* This is a bit dangerous, because casting to this ersatz bool
-    will not produce the same result as the standard (bool) cast.
--   Instead, use the bool() constructor-style macro defined below. */
-+   Instead, use the explicit construct !!x instead of relying on
-+   implicit conversions or casts. */
- typedef enum bool { false, true } bool;
- # endif
--/* This amounts to a C++-style conversion cast to bool.  This works
--   because C ignores an argument-taking macro when used without an
--   argument and because bool was redefined as a typedef if it previousl=
y
--   was defined as a macro (see above.) */
--# define bool(x) ((bool)!!(x))
- #endif
-
- /* Create a NULL pointer of the same type as the address of
-@@ -325,11 +312,11 @@ static inline void *mempset(void *dst, i
-  * less likely to be taken.
-  */
- #ifdef HAVE___BUILTIN_EXPECT
--# define likely(x)	__builtin_expect(bool(x), true)
--# define unlikely(x)	__builtin_expect(bool(x), false)
-+# define likely(x)	__builtin_expect(!!(x), true)
-+# define unlikely(x)	__builtin_expect(!!(x), false)
- #else
--# define likely(x)	bool(x)
--# define unlikely(x)	bool(x)
-+# define likely(x)	(!!(x))
-+# define unlikely(x)	(!!(x))
- #endif
-
- #ifdef HAVE___BUILTIN_PREFETCH
-@@ -486,4 +473,15 @@ static inline unsigned int watcom_switch
- # define default case BOGUS_CASE: default
- #endif
-
-+#ifndef unreachable              /* C23 defines as a macro in <stddef.h=
> */
-+# ifdef HAVE___BUILTIN_UNREACHABLE
-+#  define unreachable() __builtin_unreachable()
-+# else
-+#  define unreachable() do { abort(); } while(1)
-+# endif
-+#endif
-+
-+/* This should be set from main() */
-+extern const char *_progname;
-+
- #endif	/* NASM_COMPILER_H */
diff --git a/meta/recipes-devtools/nasm/nasm/0001-nasmlib-file-add-nasm_r=
emove.patch b/meta/recipes-devtools/nasm/nasm/0001-nasmlib-file-add-nasm_=
remove.patch
new file mode 100644
index 00000000000..89a5a061166
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm/0001-nasmlib-file-add-nasm_remove.p=
atch
@@ -0,0 +1,80 @@
+From a2702fa236877a97e9ee8c6dddff0637e7d341d4 Mon Sep 17 00:00:00 2001
+From: "H. Peter Anvin (Intel)" <hpa@zytor.com>
+Date: Mon, 29 Jun 2026 13:30:03 -0700
+Subject: [PATCH 1/3] nasmlib/file: add nasm_remove()
+
+Add nasm_remove() to mangle a filename if necessary before calling
+an OS-specific remove() function. This allows calling _wremove() on
+Windows.
+
+Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
+
+Upstream-Status: Backport [9d94cac7aea790664096a95cb16e3c00c4ed9e3e]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ include/nasmlib.h |  3 +++
+ nasmlib/file.c    | 23 +++++++++++++++++++++++
+ 2 files changed, 26 insertions(+)
+
+diff --git a/include/nasmlib.h b/include/nasmlib.h
+index 529fb0660..8e768cf68 100644
+--- a/include/nasmlib.h
++++ b/include/nasmlib.h
+@@ -548,6 +548,9 @@ off_t nasm_file_size_by_path(const char *pathname);
+ bool nasm_file_time(time_t *t, const char *pathname);
+ void fwritezero(off_t bytes, FILE *fp);
+=20
++/* Remove a file; explicitly defined to ignore a NULL or empty pathname=
 */
++int nasm_remove(const char *pathname);
++
+ /* Sign-extend a value to an arbitrary number of bits */
+ static inline int64_t const_func sext(int64_t value, unsigned int bits)
+ {
+diff --git a/nasmlib/file.c b/nasmlib/file.c
+index c8088326a..9de4c234c 100644
+--- a/nasmlib/file.c
++++ b/nasmlib/file.c
+@@ -80,6 +80,7 @@ static inline void os_free_filename(os_filename filena=
me)
+=20
+ # define os_fopen  _wfopen
+ # define os_access _waccess
++# define os_remove _wremove
+=20
+ /*
+  * On Win32/64, we have to use the _wstati64() function. Note that
+@@ -120,6 +121,7 @@ static inline void os_set_binary_mode(FILE *f) {
+ }
+=20
+ # define os_fopen  fopen
++# define os_remove remove
+=20
+ #if defined(HAVE_FACCESSAT) && defined(AT_EACCESS)
+ static inline int os_access(os_filename pathname, int mode)
+@@ -402,3 +404,24 @@ bool nasm_file_time(time_t *t, const char *pathname=
)
+     return false;               /* No idea how to do this on this OS */
+ #endif
+ }
++
++/*
++ * Delete a file (allows NULL as input -> do nothing)
++ */
++int nasm_remove(const char *pathname)
++{
++    int rv;
++    os_filename osfname;
++
++    if (!pathname || !*pathname)
++        return 0;
++
++    osfname =3D os_mangle_filename(pathname);
++    if (!osfname)
++        return false;
++
++    rv =3D os_remove(osfname);
++    os_free_filename(osfname);
++
++    return rv;
++}
+--=20
+2.43.0
+
diff --git a/meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patc=
h b/meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patch
deleted file mode 100644
index 9d747420724..00000000000
--- a/meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-From 680220e772dfa381829983fa73b915416f676894 Mon Sep 17 00:00:00 2001
-From: Joshua Watt <JPEWhacker@gmail.com>
-Date: Tue, 19 Nov 2019 12:47:30 -0600
-Subject: [PATCH] stdlib: Add strlcat
-
-Adds strlcat which can be used to safely concatenate strings
-
-Upstream-Status: Submitted [https://bugzilla.nasm.us/show_bug.cgi?id=3D3=
392635]
-Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
-
----
- Makefile.in        |  2 +-
- configure.ac       |  2 ++
- include/compiler.h |  4 ++++
- stdlib/strlcat.c   | 42 ++++++++++++++++++++++++++++++++++++++++++
- 4 files changed, 49 insertions(+), 1 deletion(-)
- create mode 100644 stdlib/strlcat.c
-
-diff --git a/Makefile.in b/Makefile.in
-index fcf33ab..d91f7ab 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -174,7 +174,7 @@ LIBOBJ_W =3D \
- # files to LIBOBJ_W, notably $(OUTPUTOBJ)
- LIBOBJ_NW =3D \
- 	stdlib/snprintf.$(O) stdlib/vsnprintf.$(O) stdlib/strlcpy.$(O) \
--	stdlib/strnlen.$(O) stdlib/strrchrnul.$(O) \
-+	stdlib/strnlen.$(O) stdlib/strrchrnul.$(O) stdlib/strlcat.$(O) \
- 	\
- 	asm/directbl.$(O) \
- 	asm/pptok.$(O) \
-diff --git a/configure.ac b/configure.ac
-index 448eeb2..f79c96c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -229,6 +229,7 @@ PA_FUNC_SNPRINTF
- PA_FUNC_VSNPRINTF
- AC_CHECK_FUNCS([strlcpy])
- AC_CHECK_FUNCS([strrchrnul])
-+AC_CHECK_FUNCS([strlcat])
-=20
- dnl These types are POSIX-specific, and Windows does it differently...
- AC_CHECK_TYPES([struct stat], [AC_CHECK_FUNCS([stat fstat])])
-@@ -246,6 +247,7 @@ AC_CHECK_DECLS(strsep)
- AC_CHECK_DECLS(strlcpy)
- AC_CHECK_DECLS(strnlen)
- AC_CHECK_DECLS(strrchrnul)
-+AC_CHECK_DECLS(strlcat)
-=20
- dnl Check for missing types
- AC_TYPE_UINTMAX_T
-diff --git a/include/compiler.h b/include/compiler.h
-index 0ecd4e8..41c1cbf 100644
---- a/include/compiler.h
-+++ b/include/compiler.h
-@@ -181,6 +181,10 @@ size_t strlcpy(char *, const char *, size_t);
- char * pure_func strrchrnul(const char *, int);
- #endif
-=20
-+#if !defined(HAVE_STRLCAT) || !HAVE_DECL_STRLCAT
-+size_t strlcat(char *, const char *, size_t);
-+#endif
-+
- #if !defined(__cplusplus) || (__STDC_VERSION >=3D 202311L)
- /* C++ and C23 have bool, false, and true as proper keywords */
- # ifdef HAVE_STDBOOL_H
-diff --git a/stdlib/strlcat.c b/stdlib/strlcat.c
-new file mode 100644
-index 0000000..c7cbd59
---- /dev/null
-+++ b/stdlib/strlcat.c
-@@ -0,0 +1,42 @@
-+/*
-+ * Copyright (c) 2019 Garmin Ltd. or its subsidiaries
-+ *
-+ * Permission to use, copy, modify, and distribute this software for an=
y
-+ * purpose with or without fee is hereby granted, provided that the abo=
ve
-+ * copyright notice and this permission notice appear in all copies.
-+ *
-+ * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRAN=
TIES
-+ * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
-+ * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE =
FOR
-+ * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAG=
ES
-+ * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN A=
N
-+ * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT=
 OF
-+ * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
-+ */
-+
-+#include "compiler.h"
-+
-+/*
-+ * Concatenate src string to dest of size size. The destination buffer =
will
-+ * have no more than size-1 character when the operation finishes. Alwa=
ys NUL
-+ * terminates, unless size =3D=3D 0 or dest has no NUL terminator. Retu=
rns
-+ * strlen(initial dest) + strlen(src); if retval >=3D size, truncation =
occurred.
-+ */
-+#ifndef HAVE_STRLCAT
-+
-+size_t strlcat(char *dest, const char *src, size_t size)
-+{
-+    size_t n;
-+
-+    /* find the NULL terminator in dest */
-+    for (n =3D 0; i < size && dest[n] !=3D '\0'; n++)
-+        ;
-+
-+    /* destination was not NULL terminated. Return the initial size */
-+    if (n =3D=3D size)
-+        return size;
-+
-+    return strlcpy(&dest[n], src, size - n) + n;
-+}
-+
-+#endif
diff --git a/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-op=
tion.patch b/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-op=
tion.patch
deleted file mode 100644
index f5b67fe3bb9..00000000000
--- a/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.pa=
tch
+++ /dev/null
@@ -1,328 +0,0 @@
-From 10baf9f75e4e4e2fb37a579c68672141858aea5e Mon Sep 17 00:00:00 2001
-From: Joshua Watt <JPEWhacker@gmail.com>
-Date: Tue, 19 Nov 2019 13:12:17 -0600
-Subject: [PATCH] Add --debug-prefix-map option
-
-Adds an option to remap file prefixes in output object files. This is
-analogous to the "-fdebug-prefix-map" option in GCC, and allows files to
-be built in a reproducible manner regardless of the build directory.
-
-Upstream-Status: Submitted [https://bugzilla.nasm.us/show_bug.cgi?id=3D3=
392635]
-Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
----
- asm/nasm.c              | 28 ++++++++++++++++++++++++++--
- include/nasmlib.h       |  9 +++++++++
- nasm.txt                |  3 +++
- nasmlib/filename.c      | 20 ++++++++++++++++++++
- output/outas86.c        |  4 +++-
- output/outcoff.c        |  4 ++--
- output/outelf.c         | 13 ++++++++-----
- output/outieee.c        |  2 +-
- output/outobj.c         |  2 +-
- stdlib/strlcat.c        |  2 +-
- test/elfdebugprefix.asm |  5 +++++
- test/performtest.pl     | 12 ++++++++++--
- 12 files changed, 89 insertions(+), 15 deletions(-)
- create mode 100644 test/elfdebugprefix.asm
-
-diff --git a/asm/nasm.c b/asm/nasm.c
-index 49fa00e..ff117cf 100644
---- a/asm/nasm.c
-+++ b/asm/nasm.c
-@@ -913,7 +913,8 @@ enum text_options {
-     OPT_DEBUG,
-     OPT_INFO,
-     OPT_REPRODUCIBLE,
--    OPT_BITS
-+    OPT_BITS,
-+    OPT_DEBUG_PREFIX_MAP
- };
- enum need_arg {
-     ARG_NO,
-@@ -952,6 +953,7 @@ static const struct textargs textopts[] =3D {
-     {"debug",    OPT_DEBUG, ARG_MAYBE, 0},
-     {"reproducible", OPT_REPRODUCIBLE, ARG_NO, 0},
-     {"bits",     OPT_BITS, ARG_YES, 0},
-+    {"debug-prefix-map", OPT_DEBUG_PREFIX_MAP, true, 0},
-     {NULL, OPT_BOGUS, ARG_NO, 0}
- };
-=20
-@@ -1337,6 +1339,26 @@ static bool process_arg(char *p, char *q, int pas=
s)
-                 case OPT_REPRODUCIBLE:
-                     reproducible =3D true;
-                     break;
-+                case OPT_DEBUG_PREFIX_MAP: {
-+                    struct debug_prefix_list *d;
-+                    char *c;
-+                    c =3D strchr(param, '=3D');
-+
-+                    if (!c) {
-+                        nasm_error(ERR_NONFATAL | ERR_NOFILE | ERR_USAG=
E,
-+                                   "option `--%s' must be of the form `=
BASE=3DDEST'", p);
-+                        break;
-+                    }
-+
-+                    *c =3D '\0';
-+                    d =3D nasm_malloc(sizeof(*d));
-+                    d->next =3D debug_prefixes;
-+                    d->base =3D nasm_strdup(param);
-+                    d->dest =3D nasm_strdup(c + 1);
-+                    debug_prefixes =3D d;
-+                    *c =3D '=3D';
-+                    }
-+                    break;
-                 case OPT_HELP:
-                     /* Allow --help topic without *requiring* topic */
-                     if (!param)
-@@ -2428,7 +2450,9 @@ static void help(FILE *out, const char *what)
-                 "    -w+x           enable warning x %s(also -Wx)\n"
-                 "    -w-x           disable warning x (also -Wno-x)\n"
-                 "    -w[+-]error    promote all warnings to errors (als=
o -Werror)\n"
--                "    -w[+-]error=3Dx  promote warning x to errors (also=
 -Werror=3Dx)\n",
-+                "    -w[+-]error=3Dx  promote warning x to errors (also=
 -Werror=3Dx)\n"
-+                "   --debug-prefix-map base=3Ddest\n"
-+                "                  remap paths starting with 'base' to =
'dest' in output files\n",
-                 SEE("-w"));
-     }
-     if (help_is(with, 'w')) {
-diff --git a/include/nasmlib.h b/include/nasmlib.h
-index ed4222b..aafbf00 100644
---- a/include/nasmlib.h
-+++ b/include/nasmlib.h
-@@ -334,10 +334,19 @@ static inline const char *nasm_digit_chars(bool uc=
ase)
-  */
- int32_t seg_alloc(void);
-=20
-+struct debug_prefix_list {
-+    struct debug_prefix_list *next;
-+    char *base;
-+    char *dest;
-+};
-+
-+extern struct debug_prefix_list *debug_prefixes;
-+
- /*
-  * Add/replace or remove an extension to the end of a filename
-  */
- const char *filename_set_extension(const char *inname, const char *exte=
nsion);
-+char *filename_debug_remap(char *dest, char const *inname, size_t len);
-=20
- /*
-  * Utility macros...
-diff --git a/nasm.txt b/nasm.txt
-index 950c361..8447409 100644
---- a/nasm.txt
-+++ b/nasm.txt
-@@ -146,6 +146,9 @@ OPTIONS
- --postfix::
- 	Prepend or append (respectively) the given argument to all global or
- 	extern variables.
-+--debug-prefix-map 'BASE=3DDEST'::
-+    Map file names beginning with 'BASE' to 'DEST' when encoding them i=
n
-+    output object files.
-=20
- SYNTAX
- ------
-diff --git a/nasmlib/filename.c b/nasmlib/filename.c
-index 2c29d38..0e27f69 100644
---- a/nasmlib/filename.c
-+++ b/nasmlib/filename.c
-@@ -9,6 +9,8 @@
- #include "nasmlib.h"
- #include "error.h"
-=20
-+struct debug_prefix_list *debug_prefixes =3D NULL;
-+
- /*
-  * Add/modify a filename extension, assumed to be a period-delimited
-  * field at the very end of the filename.  Returns a newly allocated
-@@ -31,3 +33,21 @@ const char *filename_set_extension(const char *inname=
, const char *extension)
-=20
-     return p;
- }
-+
-+char *filename_debug_remap(char *dest, char const *in, size_t len)
-+{
-+    struct debug_prefix_list *d;
-+    size_t n;
-+
-+    for (d =3D debug_prefixes; d !=3D NULL; d =3D d->next) {
-+        n =3D strlen(d->base);
-+        if (strncmp(in, d->base, n) =3D=3D 0) {
-+            strlcpy(dest, d->dest, len);
-+            strlcat(dest, &in[n], len);
-+            return dest;
-+        }
-+    }
-+
-+    strlcpy(dest, in, len);
-+    return dest;
-+}
-\ No newline at end of file
-diff --git a/output/outas86.c b/output/outas86.c
-index 0640af7..c654bbe 100644
---- a/output/outas86.c
-+++ b/output/outas86.c
-@@ -80,6 +80,8 @@ static void as86_sect_write(struct Section *, const ui=
nt8_t *,
-=20
- static void as86_init(void)
- {
-+    char filename[FILENAME_MAX];
-+
-     stext.data =3D saa_init(1L);
-     stext.datalen =3D 0L;
-     stext.head =3D stext.last =3D NULL;
-@@ -101,7 +103,7 @@ static void as86_init(void)
-     strslen =3D 0;
-=20
-     /* as86 module name =3D input file minus extension */
--    as86_add_string(filename_set_extension(inname, ""));
-+    as86_add_string(filename_debug_remap(filename, filename_set_extensi=
on(inname, ""), sizeof(filename)));
- }
-=20
- static void as86_cleanup(void)
-diff --git a/output/outcoff.c b/output/outcoff.c
-index d38085d..b490bb6 100644
---- a/output/outcoff.c
-+++ b/output/outcoff.c
-@@ -1231,7 +1231,7 @@ static void coff_symbol(char *name, int32_t strpos=
, int32_t value,
-=20
- static void coff_write_symbols(void)
- {
--    char filename[18];
-+    char filename[19];
-     uint32_t i;
-=20
-     /*
-@@ -1241,7 +1241,7 @@ static void coff_write_symbols(void)
-     if (reproducible)
-         memset(filename, 0, 18);
-     else
--        strncpy(filename, inname, 18);
-+        filename_debug_remap(filename, inname, 19);
-     nasm_write(filename, 18, ofile);
-=20
-     /*
-diff --git a/output/outelf.c b/output/outelf.c
-index 7288dda..9847c6e 100644
---- a/output/outelf.c
-+++ b/output/outelf.c
-@@ -516,8 +516,8 @@ static void elf_init(void)
-     const char * const *p;
-     const char * cur_path =3D nasm_realpath(inname);
-=20
--    strlcpy(elf_module, inname, sizeof(elf_module));
--    strlcpy(elf_dir, nasm_dirname(cur_path), sizeof(elf_dir));
-+    filename_debug_remap(elf_module, inname, sizeof(elf_module));
-+    filename_debug_remap(elf_dir, nasm_dirname(cur_path), sizeof(elf_di=
r));
-     sects =3D NULL;
-     nsects =3D sectlen =3D 0;
-     syms =3D saa_init((int32_t)sizeof(struct elf_symbol));
-@@ -3551,13 +3551,17 @@ static void dwarf_findfile(const char * fname)
-     if (dwarf_clist && !(strcmp(fname, dwarf_clist->filename)))
-         return;
-=20
-+    char * fname_remapped =3D nasm_malloc(FILENAME_MAX);
-+    filename_debug_remap(fname_remapped,fname,FILENAME_MAX);
-+
-     /* search for match */
-     match =3D 0;
-     if (dwarf_flist) {
-         match =3D dwarf_flist;
-         for (finx =3D 0; finx < dwarf_numfiles; finx++) {
--            if (!(strcmp(fname, match->filename))) {
-+            if (!(strcmp(fname_remapped, match->filename))) {
-                 dwarf_clist =3D match;
-+                nasm_free(fname_remapped);
-                 return;
-             }
-             match =3D match->next;
-@@ -3568,8 +3572,7 @@ static void dwarf_findfile(const char * fname)
-     dwarf_clist =3D nasm_malloc(sizeof(struct linelist));
-     dwarf_numfiles++;
-     dwarf_clist->line =3D dwarf_numfiles;
--    dwarf_clist->filename =3D nasm_malloc(strlen(fname) + 1);
--    strcpy(dwarf_clist->filename,fname);
-+    dwarf_clist->filename =3D fname_remapped;
-     dwarf_clist->next =3D 0;
-     if (!dwarf_flist) {     /* if first entry */
-         dwarf_flist =3D dwarf_elist =3D dwarf_clist;
-diff --git a/output/outieee.c b/output/outieee.c
-index 9e26cec..3643eeb 100644
---- a/output/outieee.c
-+++ b/output/outieee.c
-@@ -178,7 +178,7 @@ static void ieee_unqualified_name(char *, char *);
-  */
- static void ieee_init(void)
- {
--    strlcpy(ieee_infile, inname, sizeof(ieee_infile));
-+    filename_debug_remap(ieee_infile, inname, sizeof(ieee_infile));
-     any_segs =3D false;
-     fpubhead =3D NULL;
-     fpubtail =3D &fpubhead;
-diff --git a/output/outobj.c b/output/outobj.c
-index 685c593..e3eb34a 100644
---- a/output/outobj.c
-+++ b/output/outobj.c
-@@ -656,7 +656,7 @@ static const char *get_default_class(const char *seg=
ment)
-=20
- static void obj_init(void)
- {
--    strlcpy(obj_infile, inname, sizeof(obj_infile));
-+    filename_debug_remap(obj_infile, inname, sizeof(obj_infile));
-     first_seg =3D seg_alloc();
-     any_segs =3D false;
-     fpubhead =3D NULL;
-diff --git a/stdlib/strlcat.c b/stdlib/strlcat.c
-index c7cbd59..92a873d 100644
---- a/stdlib/strlcat.c
-+++ b/stdlib/strlcat.c
-@@ -29,7 +29,7 @@ size_t strlcat(char *dest, const char *src, size_t siz=
e)
-     size_t n;
-=20
-     /* find the NULL terminator in dest */
--    for (n =3D 0; i < size && dest[n] !=3D '\0'; n++)
-+    for (n =3D 0; n < size && dest[n] !=3D '\0'; n++)
-         ;
-=20
-     /* destination was not NULL terminated. Return the initial size */
-diff --git a/test/elfdebugprefix.asm b/test/elfdebugprefix.asm
-new file mode 100644
-index 0000000..bf845ce
---- /dev/null
-+++ b/test/elfdebugprefix.asm
-@@ -0,0 +1,5 @@
-+;Testname=3Dunoptimized; Arguments=3D-O0 --debug-prefix-map elf=3DELF -=
felf -oelfdebugprefix.o; Files=3Dstdout stderr elfdebugprefix.o; Validate=
=3Dreadelf --wide --symbols elfdebugprefix.o | grep 'FILE.*ELFdebugprefix=
.asm'
-+
-+	  SECTION .text
-+test:			; [1]
-+	  ret
-diff --git a/test/performtest.pl b/test/performtest.pl
-index 46b1bdf..2426848 100755
---- a/test/performtest.pl
-+++ b/test/performtest.pl
-@@ -42,14 +42,22 @@ sub perform {
-     TEST:
-     while(<TESTFILE>) {
-         #See if there is a test case
--        last unless /Testname=3D(.*);\s*Arguments=3D(.*);\s*Files=3D(.*=
)/;
--        my ($subname, $arguments, $files) =3D ($1, $2, $3);
-+        last unless /Testname=3D(.*);\s*Arguments=3D(.*);\s*Files=3D([^=
;]*)(?:;\s*Validate=3D(.*))?/;
-+        my ($subname, $arguments, $files, $validate) =3D ($1, $2, $3, $=
4);
-+        chomp $files;
-         debugprint("$subname | $arguments | $files");
-=20
-         #Call nasm with this test case
-         system("$nasm $arguments $testpath > $stdoutfile 2> $stderrfile=
");
-         debugprint("$nasm $arguments $testpath > $stdoutfile 2> $stderr=
file ----> $?");
-=20
-+        if($validate) {
-+            if(system("$validate >> $stdoutfile 2>> $stderrfile") !=3D =
0) {
-+                print "Test $testname/$subname validation failed\n";
-+                $globalresult =3D 1;
-+            }
-+        }
-+
-         #Move the output to the test dir
-         mkpath("$outputdir/$testname/$subname");
-         foreach(split / /,$files) {
diff --git a/meta/recipes-devtools/nasm/nasm/0002-Refactor-the-handling-o=
f-primary-input-output-files.patch b/meta/recipes-devtools/nasm/nasm/0002=
-Refactor-the-handling-of-primary-input-output-files.patch
new file mode 100644
index 00000000000..241246807b6
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm/0002-Refactor-the-handling-of-prima=
ry-input-output-files.patch
@@ -0,0 +1,819 @@
+From 18da80d75da4ace14166aea942efabcecc9bacc5 Mon Sep 17 00:00:00 2001
+From: "H. Peter Anvin (Intel)" <hpa@zytor.com>
+Date: Mon, 29 Jun 2026 13:33:42 -0700
+Subject: [PATCH 2/3] Refactor the handling of primary input/output files
+
+Replace the direct setting of variables for input and output variables
+with accessors. This allows for properly tracking the lifetimes of the
+data and allows for things like checking of the overwrite of the
+primary input file to be centralized.
+
+It isn't possible *in the general case* to check for overwrite of
+*any* of the input files, although in the particularly important case
+of the assembler proper it ought to be possible to do a bit better:
+
+it should be able to guard for overwrites of non-primary input files
+except for the error file or the list file if and only if -Lp is used.
+
+That is, however, a latter project.
+
+Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+Upstream-Status: Backport [720a32672c9db10ae85e5fe2e61aa69b51e8d598]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ Makefile.in             |   2 +-
+ Mkfiles/msvc.mak        |   2 +-
+ Mkfiles/openwcom.mak    |   2 +-
+ asm/error.c             |  13 ++-
+ asm/nasm.c              | 175 ++++++++++++++++++++++++----------------
+ common/files.c          |  64 +++++++++++++++
+ include/files.h         |  43 ++++++++++
+ include/nasm.h          |   3 -
+ output/codeview.c       |   3 +-
+ output/outas86.c        |   5 +-
+ output/outbin.c         |   3 +-
+ output/outcoff.c        |   3 +-
+ output/outdbg.c         |   5 +-
+ output/outelf.c         |   6 +-
+ output/outieee.c        |   3 +-
+ output/outmacho.c       |   3 +-
+ output/outobj.c         |   3 +-
+ travis/test/mout.stderr |   3 +-
+ 18 files changed, 249 insertions(+), 92 deletions(-)
+ create mode 100644 common/files.c
+ create mode 100644 include/files.h
+
+diff --git a/Makefile.in b/Makefile.in
+index 030a2ef2e..6b8bfc2a1 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -165,7 +165,7 @@ LIBOBJ_COM =3D \
+ 	nasmlib/perfhash.$(O) nasmlib/badenum.$(O) \
+ 	nasmlib/readnum.$(O) \
+ 	\
+-	common/common.$(O) common/errstubs.$(O) \
++	common/common.$(O) common/errstubs.$(O) common/files.$(O) \
+ 	\
+ 	x86/insnsa.$(O) x86/insnsb.$(O) x86/insnsn.$(O) \
+ 	x86/regs.$(O) x86/regvals.$(O) x86/regflags.$(O) \
+diff --git a/Mkfiles/msvc.mak b/Mkfiles/msvc.mak
+index 4117df2e4..981f93206 100644
+--- a/Mkfiles/msvc.mak
++++ b/Mkfiles/msvc.mak
+@@ -117,7 +117,7 @@ LIBOBJ_COM =3D \
+ 	nasmlib\perfhash.obj nasmlib\badenum.obj \
+ 	nasmlib\readnum.obj \
+ 	\
+-	common\common.obj common\errstubs.obj \
++	common\common.obj common\errstubs.obj common\files.obj \
+ 	\
+ 	x86\insnsa.obj x86\insnsb.obj x86\insnsn.obj \
+ 	x86\regs.obj x86\regvals.obj x86\regflags.obj \
+diff --git a/Mkfiles/openwcom.mak b/Mkfiles/openwcom.mak
+index f2ec979b8..b3cba01aa 100644
+--- a/Mkfiles/openwcom.mak
++++ b/Mkfiles/openwcom.mak
+@@ -114,7 +114,7 @@ LIBOBJ_COM =3D &
+ 	nasmlib/perfhash.obj nasmlib/badenum.obj &
+ 	nasmlib/readnum.obj &
+ 	&
+-	common/common.obj common/errstubs.obj &
++	common/common.obj common/errstubs.obj common/files.obj &
+ 	&
+ 	x86/insnsa.obj x86/insnsb.obj x86/insnsn.obj &
+ 	x86/regs.obj x86/regvals.obj x86/regflags.obj &
+diff --git a/asm/error.c b/asm/error.c
+index a43f0696c..77f498389 100644
+--- a/asm/error.c
++++ b/asm/error.c
+@@ -8,6 +8,7 @@
+ #include "compiler.h"
+ #include "nasmlib.h"
+ #include "error.h"
++#include "files.h"
+ #include "listing.h"
+ #include "srcfile.h"
+ #include "strlist.h"
+@@ -411,10 +412,14 @@ static struct src_location error_where(errflags se=
verity)
+         where =3D src_where_error();
+=20
+         if (!where.filename) {
+-            where.filename =3D
+-            inname && inname[0] ? inname :
+-                outname && outname[0] ? outname :
+-                NULL;
++            enum filenames fn;
++            for (fn =3D FN_INFILE; fn <=3D FN_OUTFILE; fn++) {
++                const char *name =3D get_filename(fn);
++                if (name && *name) {
++                    where.filename =3D name;
++                    break;
++                }
++            }
+             where.lineno =3D 0;
+         }
+     }
+diff --git a/asm/nasm.c b/asm/nasm.c
+index 020e1ce3f..383f38876 100644
+--- a/asm/nasm.c
++++ b/asm/nasm.c
+@@ -27,6 +27,7 @@
+ #include "iflag.h"
+ #include "quote.h"
+ #include "ver.h"
++#include "files.h"
+ #include "error.h"
+=20
+ /*
+@@ -68,11 +69,6 @@ int64_t _passn;
+=20
+ struct compile_time official_compile_time;
+=20
+-const char *inname;
+-const char *outname;
+-static const char *listname;
+-static const char *errname;
+-
+ static int64_t globallineno;    /* for forward-reference tracking */
+=20
+ const struct ofmt *ofmt =3D &OF_DEFAULT;
+@@ -109,7 +105,6 @@ static unsigned int operating_mode;
+ static bool depend_emit_phony =3D false;
+ static bool depend_missing_ok =3D false;
+ static char *depend_target =3D NULL;
+-static char *depend_file =3D NULL;
+ struct strlist *depend_list;
+=20
+ static inline bool terminate_after_phase(void)
+@@ -439,6 +434,7 @@ static void emit_dependencies(struct strlist *list)
+     bool wmake =3D (quote_for_make =3D=3D quote_for_wmake);
+     const char *wrapstr, *nulltarget;
+     const struct strlist_entry *l;
++    const char * const depend_file =3D get_filename(FN_DEPENDFILE);
+=20
+     if (!list)
+         return;
+@@ -579,6 +575,59 @@ static void timestamp(void)
+     }
+ }
+=20
++static const char *fix_outfile_name(void)
++{
++    const char * const outname =3D get_filename(FN_OUTFILE);
++    const char *inname;
++    char *newname;
++
++    if (outname)
++        return outname;         /* Output file already set */
++
++    if (operating_mode & OP_PREPROCESS)
++        return NULL;            /* Preprocessing to stdout */
++
++    /*
++     * No filename specified, and not in preprocessing mode, create
++     * a default output file name.
++     */
++    inname =3D get_filename(FN_INFILE);
++    newname =3D filename_set_extension(inname, ofmt->extension);
++    if (!strcmp(newname, inname)) {
++        nasm_strdupto(&newname, "nasm.out");
++        nasm_warn(WARN_OTHER,
++                  "default output file same as input, using `%s' for ou=
tput\n",
++                  newname);
++    }
++    return set_filename(FN_OUTFILE, newname);
++}
++
++static const char *fix_dependfile_name(void)
++{
++    const char * const depend_file =3D get_filename(FN_DEPENDFILE);
++    const char *outname, *inname;
++    char *newname;
++
++    if (depend_file)
++        return depend_file;
++
++    if (!(operating_mode & ~OP_DEPEND))
++        return NULL;            /* ONLY doing dependencies -> stdout */
++
++    outname =3D get_filename(FN_OUTFILE);
++    if (outname) {
++        newname =3D nasm_strcat(outname, ".d");
++    } else {
++        inname =3D get_filename(FN_INFILE);
++        if (inname)
++            newname =3D filename_set_extension(inname, ".d");
++        else
++            newname =3D nasm_strdup("nasm.d");
++    }
++
++    return set_filename(FN_DEPENDFILE, newname);
++}
++
+ int main(int argc, char **argv)
+ {
+     /* Do these as early as possible */
+@@ -649,31 +698,18 @@ int main(int argc, char **argv)
+     error_init();
+     memcpy(nasm_limit_from_cmdline, nasm_limit, sizeof nasm_limit);
+=20
+-    /* Dependency filename if we are also doing other things */
+-    if (!depend_file && (operating_mode & ~OP_DEPEND)) {
+-        if (outname)
+-            depend_file =3D nasm_strcat(outname, ".d");
+-        else
+-            depend_file =3D filename_set_extension(inname, ".d");
+-    }
+-
+     /*
+-     * If no output file name provided and this
+-     * is preprocess mode, we're perfectly
+-     * fine to output into stdout.
++     * Set output and depend file names to defaults as needed.
++     * Call fix_dependfile_name() first - its defaults depend on
++     * whether or not the outfile name is a generated default.
+      */
+-    if (!outname && !(operating_mode & OP_PREPROCESS)) {
+-        outname =3D filename_set_extension(inname, ofmt->extension);
+-        if (!strcmp(outname, inname)) {
+-            outname =3D "nasm.out";
+-            nasm_warn(WARN_OTHER, "default output file same as input, u=
sing `%s' for output\n", outname);
+-        }
+-    }
++    fix_dependfile_name();
++    fix_outfile_name();
+=20
+     depend_list =3D (operating_mode & OP_DEPEND) ? strlist_alloc(true) =
: NULL;
+=20
+     if (!depend_target)
+-        depend_target =3D quote_for_make(outname);
++        depend_target =3D quote_for_make(get_filename(FN_OUTFILE));
+=20
+     reset_global_defaults(cmd_sb);
+=20
+@@ -685,7 +721,7 @@ int main(int argc, char **argv)
+             if (depend_missing_ok)
+                 pp_include_path(NULL);    /* "assume generated" */
+=20
+-            pp_reset(inname, PP_DEPS, depend_list);
++            pp_reset(get_filename(FN_INFILE), PP_DEPS, depend_list);
+             ofile =3D NULL;
+             while ((line =3D pp_getline()))
+                 nasm_free(line);
+@@ -697,6 +733,7 @@ int main(int argc, char **argv)
+             char *quoted_file_name =3D nasm_quote_filename(file_name);
+             int32_t linnum  =3D 0;
+             int32_t lineinc =3D 0;
++            const char *outname =3D get_filename(FN_OUTFILE);
+=20
+             if (outname) {
+                 ofile =3D nasm_open_write(outname, NF_TEXT);
+@@ -710,7 +747,7 @@ int main(int argc, char **argv)
+             location.known =3D false;
+=20
+             _pass_type =3D PASS_PREPROC;
+-            pp_reset(inname, PP_PREPROC, depend_list);
++            pp_reset(get_filename(FN_INFILE), PP_PREPROC, depend_list);
+             error_pass_start(true);
+=20
+             while ((line =3D pp_getline())) {
+@@ -763,6 +800,7 @@ int main(int argc, char **argv)
+     }
+=20
+     if (operating_mode & OP_NORMAL) {
++        const char *outname =3D get_filename(FN_OUTFILE);
+         ofile =3D nasm_open_write(outname, (ofmt->flags & OFMT_TEXT) ? =
NF_TEXT : NF_BINARY);
+         if (!ofile)
+             nasm_fatalf(ERR_PERROR, "unable to open output file `%s'", =
outname);
+@@ -770,7 +808,7 @@ int main(int argc, char **argv)
+         ofmt->init();
+         dfmt->init();
+=20
+-        assemble_file(inname, depend_list);
++        assemble_file(get_filename(FN_INFILE), depend_list);
+=20
+         if (!terminate_after_phase()) {
+             ofmt->cleanup();
+@@ -795,7 +833,7 @@ int main(int argc, char **argv)
+     stdscan_cleanup();
+     src_free();
+     strlist_free(&include_path);
+-    nasm_free(depend_file);
++    cleanup_filenames();
+     nasm_free(depend_target);
+=20
+     return terminate_after_phase();
+@@ -826,17 +864,6 @@ static char *get_param(char *p, char *q, bool *adva=
nce)
+     return r;
+ }
+=20
+-/*
+- * Copy a filename
+- */
+-static void copy_filename(const char **dst, const char *src, const char=
 *what)
+-{
+-    if (*dst)
+-        nasm_fatal("more than one %s file specified: %s\n", what, src);
+-
+-    *dst =3D nasm_strdup(src);
+-}
+-
+ /*
+  * Convert a string to a POSIX make-safe form; returns a newly allocate=
d
+  * string.
+@@ -1079,7 +1106,7 @@ static bool process_arg(char *p, char *q, int pass=
)
+=20
+         case 'o':       /* output file */
+             if (pass =3D=3D 2)
+-                copy_filename(&outname, param, "output");
++                copy_filename(FN_OUTFILE, param);
+             break;
+=20
+         case 'f':       /* output format */
+@@ -1165,7 +1192,7 @@ static bool process_arg(char *p, char *q, int pass=
)
+=20
+         case 'l':       /* listing file */
+             if (pass =3D=3D 2)
+-                copy_filename(&listname, param, "listing");
++                copy_filename(FN_LISTFILE, param);
+             break;
+=20
+         case 'L':        /* listing options */
+@@ -1175,7 +1202,7 @@ static bool process_arg(char *p, char *q, int pass=
)
+=20
+         case 'Z':       /* error messages file */
+             if (pass =3D=3D 1)
+-                copy_filename(&errname, param, "error");
++                copy_filename(FN_ERRFILE, param);
+             break;
+=20
+         case 'F':       /* specify debug format */
+@@ -1279,12 +1306,12 @@ static bool process_arg(char *p, char *q, int pa=
ss)
+                 case 'D':
+                     operating_mode |=3D OP_DEPEND;
+                     if (q && (q[0] !=3D '-' || q[1] =3D=3D '\0')) {
+-                        nasm_strdupto(&depend_file, q);
++                        copy_filename(FN_DEPENDFILE, q);
+                         advance =3D true;
+                     }
+                     break;
+                 case 'F':
+-                    nasm_strdupto(&depend_file, q);
++                    copy_filename(FN_DEPENDFILE, q);
+                     advance =3D true;
+                     break;
+                 case 'T':
+@@ -1449,8 +1476,12 @@ static bool process_arg(char *p, char *q, int pas=
s)
+             break;
+         }
+     } else if (pass =3D=3D 2) {
+-        /* In theory we could allow multiple input files... */
+-        copy_filename(&inname, p, "input");
++        /*
++         * In theory we could allow multiple input files, but that
++         * would require making this a list, and probably would require
++         * some other more complicated changes.
++         */
++        copy_filename(FN_INFILE, p);
+     }
+=20
+     return advance;
+@@ -1571,6 +1602,23 @@ static void open_and_process_respfile(char *respf=
ile, int pass)
+     }
+ }
+=20
++static void open_errfile(const char *errfile)
++{
++    if (!errfile || !*errfile)
++        return;
++
++    if (errfile[0] =3D=3D '-' && !errfile[1]) {
++        erropt.file =3D stdout;
++        return;
++    }
++
++    erropt.file =3D nasm_open_write(errfile, NF_TEXT);
++    if (!erropt.file) {
++        nasm_fatalf(ERR_PERROR, "cannot open file `%s' for error messag=
es",
++                    errfile);
++    }
++}
++
+ static void parse_cmdline(int argc, char **argv, int pass)
+ {
+     char *envreal, *envcopy =3D NULL;
+@@ -1621,23 +1669,12 @@ static void parse_cmdline(int argc, char **argv,=
 int pass)
+     if (pass !=3D 2)
+         return;
+=20
+-    if (!inname)
++    if (!get_filename(FN_INFILE))
+         nasm_fatalf(ERR_USAGE, "no input file specified");
+-    else if ((errname && !strcmp(inname, errname)) ||
+-             (outname && !strcmp(inname, outname)) ||
+-             (listname &&  !strcmp(inname, listname))  ||
+-             (depend_file && !strcmp(inname, depend_file)))
+-        nasm_fatal("will not overwrite input file");
+=20
+-    if (errname) {
+-        FILE *error_file =3D nasm_open_write(errname, NF_TEXT);
+-        if (erropt.file) {
+-            erropt.file =3D error_file;
+-        } else {
+-            nasm_fatalf(ERR_PERROR, "cannot open file `%s' for error me=
ssages",
+-                       errname);
+-        }
+-    }
++    check_overwrite_files();
++
++    open_errfile(get_filename(FN_ERRFILE));
+ }
+=20
+ static void forward_refs(insn *instruction)
+@@ -1714,12 +1751,13 @@ static void assemble_file(const char *fname, str=
uct strlist *depend_list)
+=20
+     prev_offset_changed =3D INT64_MAX;
+=20
+-    if (listname && !keep_all) {
+-        /* Remove the list file in case we die before the output pass *=
/
+-        remove(listname);
+-    }
++    /* Remove the list file in case we die before the output pass */
++    if (!keep_all)
++        nasm_remove(get_filename(FN_LISTFILE));
+=20
+     while (!terminate_after_phase() && !pass_final()) {
++        const char *listname;
++
+         _passn++;
+         switch (pass_type()) {
+         case PASS_INIT:
+@@ -1745,6 +1783,7 @@ static void assemble_file(const char *fname, struc=
t strlist *depend_list)
+         reset_global_defaults(cmd_sb);
+=20
+         cpu =3D cmd_cpu;
++        listname =3D get_filename(FN_LISTFILE);
+         if (listname) {
+             if (list_on_this_pass()) {
+                 /*
+@@ -1758,7 +1797,7 @@ static void assemble_file(const char *fname, struc=
t strlist *depend_list)
+                  */
+                 lfmt->cleanup();
+                 if (!keep_all)
+-                    remove(listname);
++                    nasm_remove(listname);
+             }
+         }
+=20
+@@ -1865,7 +1904,7 @@ void close_output(bool error)
+     } else {
+         fclose(ofile);
+         if (error && !keep_all)
+-            remove(outname);
++            nasm_remove(get_filename(FN_OUTFILE));
+     }
+     ofile =3D NULL;
+ }
+diff --git a/common/files.c b/common/files.c
+new file mode 100644
+index 000000000..8b01657d2
+--- /dev/null
++++ b/common/files.c
+@@ -0,0 +1,64 @@
++/* SPDX-License-Identifier: BSD-2-Clause */
++/* Copyright 2026 The NASM Authors - All Rights Reserved */
++
++#include "compiler.h"
++#include "files.h"
++#include "error.h"
++
++static const char * const filename_names[FN_NFILES] =3D {
++    "input",
++    "output",
++    "error",
++    "list",
++    "dependency"
++};
++
++const char *_filenames[FN_NFILES];
++
++const char *copy_filename(enum filenames fn, const char *src)
++{
++    return set_filename(fn, nasm_strdup(src));
++}
++
++const char *set_filename(enum filenames fn, char *src)
++{
++    const char **dstp, *dst;
++    nasm_assert((size_t)fn < ARRAY_SIZE(_filenames));
++
++    dstp =3D &_filenames[fn];
++    dst =3D *dstp;
++
++    if (dst) {
++        nasm_fatal("more than one %s file specified: %s and %s",
++                   filename_names[fn], dst, src);
++    }
++
++    return *dstp =3D src;
++}
++
++void check_overwrite_files(void)
++{
++    enum filenames fn;
++    const char *inname =3D get_filename(FN_INFILE);
++
++    if (!inname)
++        return;
++
++    for (fn =3D FN_INFILE+1; fn < FN_NFILES; fn++) {
++        const char *outname =3D get_filename(fn);
++        if (outname && !strcmp(inname, outname)) {
++            nasm_fatal("%s file would overwrite input file",
++                       filename_names[fn]);
++        }
++    }
++}
++
++void cleanup_filenames(void)
++{
++    enum filenames fn;
++
++    for (fn =3D 0; fn < FN_NFILES; fn++) {
++        nasm_free((char *)_filenames[fn]);
++        _filenames[fn] =3D NULL;
++    }
++}
+diff --git a/include/files.h b/include/files.h
+new file mode 100644
+index 000000000..314dea184
+--- /dev/null
++++ b/include/files.h
+@@ -0,0 +1,43 @@
++/* SPDX-License-Identifier: BSD-2-Clause */
++/* Copyright 2026 The NASM Authors - All Rights Reserved */
++
++#ifndef NASM_FILES_H
++#define NASM_FILES_H 1
++
++#include "compiler.h"
++#include "nasmlib.h"            /* For nasm_assert() */
++
++/*
++ * Primary file names set on the command line etc.
++ * Wrapped in accessors to make them as constant as possible.
++ */
++enum filenames {
++    /* These two entries must be first, in this order */
++    FN_INFILE,                  /* Primary input file */
++    FN_OUTFILE,                 /* Primary output file */
++
++    FN_ERRFILE,                 /* Error message file */
++    FN_LISTFILE,                /* Listing file */
++    FN_DEPENDFILE,              /* Dependency file */
++    FN_NFILES
++};
++
++extern const char *_filenames[FN_NFILES];
++
++static inline const char *get_filename(enum filenames fn)
++{
++    nasm_assert((size_t)fn < ARRAY_SIZE(_filenames));
++    return _filenames[fn];
++}
++
++/*
++ * copy_filename() makes a private copy for the files subsystem,
++ * set_nocopy() expects an allocated string for the files subsystem to
++ * take over.
++ */
++const char *copy_filename(enum filenames fn, const char *src);
++const char *set_filename(enum filenames fn, char *src);
++void check_overwrite_files(void);
++void cleanup_filenames(void);
++
++#endif /* NASM_FILES_H */
+diff --git a/include/nasm.h b/include/nasm.h
+index e81c3ec82..136f2741b 100644
+--- a/include/nasm.h
++++ b/include/nasm.h
+@@ -1575,9 +1575,6 @@ struct globalopt {
+ extern struct globalopt globl;
+ void reset_global_defaults(int bits);
+=20
+-extern const char *inname;	/* primary input filename */
+-extern const char *outname;     /* output filename */
+-
+ /*
+  * Switch to a different segment and return the current offset
+  */
+diff --git a/output/codeview.c b/output/codeview.c
+index 0e89d571b..553cb7353 100644
+--- a/output/codeview.c
++++ b/output/codeview.c
+@@ -11,6 +11,7 @@
+=20
+ #include "nasm.h"
+ #include "nasmlib.h"
++#include "files.h"
+ #include "error.h"
+ #include "preproc.h"
+ #include "saa.h"
+@@ -277,7 +278,7 @@ static void cv8_cleanup(void)
+     struct coff_Section *symbol_sect =3D coff_sects[cv8_state.symbol_se=
ct];
+     struct coff_Section *type_sect =3D coff_sects[cv8_state.type_sect];
+=20
+-    cv8_state.outfile.name =3D nasm_realpath(outname);
++    cv8_state.outfile.name =3D nasm_realpath(get_filename(FN_OUTFILE));
+     cv8_state.outfile.namebytes =3D strlen(cv8_state.outfile.name) + 1;
+=20
+     build_symbol_table(symbol_sect);
+diff --git a/output/outas86.c b/output/outas86.c
+index edbd244cc..8b7891862 100644
+--- a/output/outas86.c
++++ b/output/outas86.c
+@@ -12,6 +12,7 @@
+=20
+ #include "nasm.h"
+ #include "nasmlib.h"
++#include "files.h"
+ #include "error.h"
+ #include "saa.h"
+ #include "raa.h"
+@@ -25,7 +26,7 @@ struct Piece {
+     int type;                   /* 0 =3D absolute, 1 =3D seg, 2 =3D sym=
 */
+     int32_t offset;		/* relative offset */
+     int number;			/* symbol/segment number (4=3Dbss) */
+-    int32_t bytes;	        /* size of reloc or of absolute data */
++    int32_t bytes;              /* size of reloc or of absolute data */
+     bool relative;		/* relative address? */
+ };
+=20
+@@ -103,7 +104,7 @@ static void as86_init(void)
+     strslen =3D 0;
+=20
+     /* as86 module name =3D input file minus extension */
+-    module_name =3D filename_set_extension(inname, "");
++    module_name =3D filename_set_extension(get_filename(FN_INFILE), "")=
;
+     as86_add_string(module_name);
+     nasm_free(module_name);
+ }
+diff --git a/output/outbin.c b/output/outbin.c
+index c5886b4cf..7f7d8f7b3 100644
+--- a/output/outbin.c
++++ b/output/outbin.c
+@@ -49,6 +49,7 @@
+=20
+ #include "nasm.h"
+ #include "nasmlib.h"
++#include "files.h"
+ #include "error.h"
+ #include "saa.h"
+ #include "stdscan.h"
+@@ -543,7 +544,7 @@ static void bin_cleanup(void)
+         for (h =3D 63; h; h--)
+             fputc('-', rf);
+         fprintf(rf, "\n\nSource file:  %s\nOutput file:  %s\n\n",
+-                inname, outname);
++                get_filename(FN_INFILE), get_filename(FN_OUTFILE));
+=20
+         if (map_control & MAP_ORIGIN) { /* Display program origin. */
+             fprintf(rf, "-- Program origin ");
+diff --git a/output/outcoff.c b/output/outcoff.c
+index adcaf3a41..8a0a3216c 100644
+--- a/output/outcoff.c
++++ b/output/outcoff.c
+@@ -15,6 +15,7 @@
+ #include "nasm.h"
+ #include "nasmlib.h"
+ #include "ilog2.h"
++#include "files.h"
+ #include "error.h"
+ #include "saa.h"
+ #include "raa.h"
+@@ -1341,7 +1342,7 @@ static void coff_write_symbols(void)
+     if (reproducible)
+         memset(filename, 0, 18);
+     else
+-        strncpy(filename, inname, 18);
++        strncpy(filename, get_filename(FN_INFILE), 18);
+     nasm_write(filename, 18, ofile);
+=20
+     /*
+diff --git a/output/outdbg.c b/output/outdbg.c
+index 174de15bc..599b01869 100644
+--- a/output/outdbg.c
++++ b/output/outdbg.c
+@@ -13,6 +13,7 @@
+=20
+ #include "nasm.h"
+ #include "nasmlib.h"
++#include "files.h"
+ #include "outform.h"
+ #include "outlib.h"
+ #include "insns.h"
+@@ -36,8 +37,8 @@ static void dbg_init(void)
+ {
+     dbgsect =3D NULL;
+     fprintf(ofile, "NASM Output format debug dump\n");
+-    fprintf(ofile, "input file  =3D %s\n", inname);
+-    fprintf(ofile, "output file =3D %s\n", outname);
++    fprintf(ofile, "input file  =3D %s\n", get_filename(FN_INFILE));
++    fprintf(ofile, "output file =3D %s\n", get_filename(FN_OUTFILE));
+     init_seg =3D seg_alloc();
+ }
+=20
+diff --git a/output/outelf.c b/output/outelf.c
+index 2a0566b4f..0f20ddf6d 100644
+--- a/output/outelf.c
++++ b/output/outelf.c
+@@ -10,6 +10,7 @@
+=20
+ #include "nasm.h"
+ #include "nasmlib.h"
++#include "files.h"
+ #include "error.h"
+ #include "saa.h"
+ #include "raa.h"
+@@ -510,10 +511,11 @@ static void elf64_init(void)
+=20
+ static void elf_populate_dirs(void)
+ {
+-    char *cur_path =3D nasm_realpath(inname);
++    const char * const infile =3D get_filename(FN_INFILE);
++    char *cur_path =3D nasm_realpath(infile);
+     char *dir_name =3D nasm_dirname(cur_path);
+=20
+-    strlcpy(elf_module, inname, sizeof(elf_module));
++    strlcpy(elf_module, infile, sizeof(elf_module));
+     strlcpy(elf_dir, dir_name, sizeof(elf_dir));
+=20
+     nasm_free(dir_name);
+diff --git a/output/outieee.c b/output/outieee.c
+index 9e26cec90..a00f25dc6 100644
+--- a/output/outieee.c
++++ b/output/outieee.c
+@@ -45,6 +45,7 @@
+ #include "nasmlib.h"
+ #include "asmutil.h"
+ #include "error.h"
++#include "files.h"
+ #include "ver.h"
+=20
+ #include "outform.h"
+@@ -178,7 +179,7 @@ static void ieee_unqualified_name(char *, char *);
+  */
+ static void ieee_init(void)
+ {
+-    strlcpy(ieee_infile, inname, sizeof(ieee_infile));
++    strlcpy(ieee_infile, get_filename(FN_INFILE), sizeof(ieee_infile));
+     any_segs =3D false;
+     fpubhead =3D NULL;
+     fpubtail =3D &fpubhead;
+diff --git a/output/outmacho.c b/output/outmacho.c
+index d0e2a2fd5..233f1f93a 100644
+--- a/output/outmacho.c
++++ b/output/outmacho.c
+@@ -14,6 +14,7 @@
+ #include "nasmlib.h"
+ #include "ilog2.h"
+ #include "labels.h"
++#include "files.h"
+ #include "error.h"
+ #include "saa.h"
+ #include "raa.h"
+@@ -324,7 +325,7 @@ static int32_t macho_gotpcrel_sect;
+=20
+ static void macho_init(void)
+ {
+-    module_name =3D inname;
++    module_name =3D get_filename(FN_INFILE);
+     sects =3D NULL;
+     sectstail =3D &sects;
+=20
+diff --git a/output/outobj.c b/output/outobj.c
+index 685c5933e..2059a0cac 100644
+--- a/output/outobj.c
++++ b/output/outobj.c
+@@ -17,6 +17,7 @@
+ #include "error.h"
+ #include "stdscan.h"
+ #include "eval.h"
++#include "files.h"
+ #include "ver.h"
+=20
+ #include "outform.h"
+@@ -656,7 +657,7 @@ static const char *get_default_class(const char *seg=
ment)
+=20
+ static void obj_init(void)
+ {
+-    strlcpy(obj_infile, inname, sizeof(obj_infile));
++    strlcpy(obj_infile, get_filename(FN_INFILE), sizeof(obj_infile));
+     first_seg =3D seg_alloc();
+     any_segs =3D false;
+     fpubhead =3D NULL;
+--=20
+2.43.0
+
diff --git a/meta/recipes-devtools/nasm/nasm/0003-Add-debug-prefix-map-op=
tion.patch b/meta/recipes-devtools/nasm/nasm/0003-Add-debug-prefix-map-op=
tion.patch
new file mode 100644
index 00000000000..6e342c00c4f
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm/0003-Add-debug-prefix-map-option.pa=
tch
@@ -0,0 +1,409 @@
+From a54a37ccc630fe05403c67e9efdae2b81c52edbd Mon Sep 17 00:00:00 2001
+From: Joshua Watt <JPEWhacker@gmail.com>
+Date: Tue, 19 Nov 2019 13:12:17 -0600
+Subject: [PATCH 3/3] Add --debug-prefix-map option
+
+Adds an option to remap file prefixes in output object files. This is
+analogous to the "-fdebug-prefix-map" option in GCC, and allows files to
+be built in a reproducible manner regardless of the build directory.
+
+[ hpa: this still needs to be documented in doc/running.src. ]
+
+Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
+Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
+
+Upstream-Status: Backport [851460a10b3378c7e04f602c8a7d005b22fe538b]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ asm/nasm.c                                |  72 +++++++++++++++++++---
+ asm/preproc.c                             |   4 +-
+ common/files.c                            |   3 +-
+ include/files.h                           |   1 +
+ include/nasm.h                            |   2 +-
+ nasm.txt                                  |   4 ++
+ output/outas86.c                          |   2 +-
+ output/outcoff.c                          |   2 +-
+ output/outelf.c                           |   2 +-
+ output/outieee.c                          |   2 +-
+ output/outmacho.c                         |   2 +-
+ output/outobj.c                           |   2 +-
+ test/elfdebugprefix.asm                   |   6 ++
+ test/performtest.pl                       |  12 +++-
+ 18 files changed, 123 insertions(+), 19 deletions(-)
+
+diff --git a/asm/nasm.c b/asm/nasm.c
+index 383f38876..f55dfaf4c 100644
+--- a/asm/nasm.c
++++ b/asm/nasm.c
+@@ -42,11 +42,17 @@ struct forwrefinfo {            /* info held on forw=
ard refs. */
+     int operand;
+ };
+=20
++struct debug_prefix_list {
++    struct debug_prefix_list *next;
++    char *base;
++    char *dest;
++};
++
+ const char *_progname;
+=20
+ static void open_and_process_respfile(char *, int);
+ static void parse_cmdline(int, char **, int);
+-static void assemble_file(const char *, struct strlist *);
++static void assemble_file(const char *, char const *, struct strlist *)=
;
+ static void help(FILE *out, const char *what);
+=20
+ static bool using_debug_info;
+@@ -81,6 +87,8 @@ FILE *ofile =3D NULL;
+ enum optimization optimizing =3D OPTIM_DEFAULT;
+ static int cmd_sb =3D 16;    /* by default */
+=20
++static struct debug_prefix_list *debug_prefixes =3D NULL;
++
+ iflag_t cpu, cmd_cpu;
+=20
+ struct location location;
+@@ -721,7 +729,7 @@ int main(int argc, char **argv)
+             if (depend_missing_ok)
+                 pp_include_path(NULL);    /* "assume generated" */
+=20
+-            pp_reset(get_filename(FN_INFILE), PP_DEPS, depend_list);
++            pp_reset(get_filename(FN_INFILE), get_filename(FN_MAPPED_IN=
FILE), PP_DEPS, depend_list);
+             ofile =3D NULL;
+             while ((line =3D pp_getline()))
+                 nasm_free(line);
+@@ -747,7 +755,7 @@ int main(int argc, char **argv)
+             location.known =3D false;
+=20
+             _pass_type =3D PASS_PREPROC;
+-            pp_reset(get_filename(FN_INFILE), PP_PREPROC, depend_list);
++            pp_reset(get_filename(FN_INFILE), get_filename(FN_MAPPED_IN=
FILE), PP_PREPROC, depend_list);
+             error_pass_start(true);
+=20
+             while ((line =3D pp_getline())) {
+@@ -808,7 +816,7 @@ int main(int argc, char **argv)
+         ofmt->init();
+         dfmt->init();
+=20
+-        assemble_file(get_filename(FN_INFILE), depend_list);
++        assemble_file(get_filename(FN_INFILE), get_filename(FN_MAPPED_I=
NFILE), depend_list);
+=20
+         if (!terminate_after_phase()) {
+             ofmt->cleanup();
+@@ -864,6 +872,30 @@ static char *get_param(char *p, char *q, bool *adva=
nce)
+     return r;
+ }
+=20
++/*
++ * Apply debug prefix mappings to a path buffer
++ */
++static char *debug_prefix_remap(char const* path)
++{
++    struct debug_prefix_list *d;
++    size_t n;
++
++    for (d =3D debug_prefixes; d !=3D NULL; d =3D d->next) {
++        n =3D strlen(d->base);
++        if (strncmp(path, d->base, n) =3D=3D 0) {
++            size_t prefix_len =3D strlen(d->dest);
++            size_t suffix_len =3D strlen(path) - n;
++            size_t len =3D prefix_len + suffix_len + 1;
++            char* out =3D nasm_malloc(len);
++            strlcpy(out, d->dest, len);
++            strlcpy(&out[prefix_len], &path[n], len - prefix_len);
++            return out;
++        }
++    }
++
++    return nasm_strdup(path);
++}
++
+ /*
+  * Convert a string to a POSIX make-safe form; returns a newly allocate=
d
+  * string.
+@@ -1030,7 +1062,8 @@ enum text_options {
+     OPT_DEBUG,
+     OPT_INFO,
+     OPT_REPRODUCIBLE,
+-    OPT_BITS
++    OPT_BITS,
++    OPT_DEBUG_PREFIX_MAP
+ };
+ enum need_arg {
+     ARG_NO,
+@@ -1069,6 +1102,7 @@ static const struct textargs textopts[] =3D {
+     {"debug",    OPT_DEBUG, ARG_MAYBE, 0},
+     {"reproducible", OPT_REPRODUCIBLE, ARG_NO, 0},
+     {"bits",     OPT_BITS, ARG_YES, 0},
++    {"debug-prefix-map", OPT_DEBUG_PREFIX_MAP, ARG_YES, 0},
+     {NULL, OPT_BOGUS, ARG_NO, 0}
+ };
+=20
+@@ -1455,6 +1489,26 @@ static bool process_arg(char *p, char *q, int pas=
s)
+                 case OPT_REPRODUCIBLE:
+                     reproducible =3D true;
+                     break;
++                case OPT_DEBUG_PREFIX_MAP: {
++                    struct debug_prefix_list *d;
++                    char *c;
++                    c =3D strchr(param, '=3D');
++
++                    if (!c) {
++                        nasm_error(ERR_NONFATAL | ERR_NOFILE | ERR_USAG=
E,
++                                   "option `--%s' must be of the form `=
BASE=3DDEST'", p);
++                        break;
++                    }
++
++                    *c =3D '\0';
++                    d =3D nasm_malloc(sizeof(*d));
++                    d->next =3D debug_prefixes;
++                    d->base =3D nasm_strdup(param);
++                    d->dest =3D nasm_strdup(c + 1);
++                    debug_prefixes =3D d;
++                    *c =3D '=3D';
++                    }
++                    break;
+                 case OPT_HELP:
+                     /* Allow --help topic without *requiring* topic */
+                     if (!param)
+@@ -1672,6 +1726,8 @@ static void parse_cmdline(int argc, char **argv, i=
nt pass)
+     if (!get_filename(FN_INFILE))
+         nasm_fatalf(ERR_USAGE, "no input file specified");
+=20
++    set_filename(FN_MAPPED_INFILE, debug_prefix_remap(get_filename(FN_I=
NFILE)));
++
+     check_overwrite_files();
+=20
+     open_errfile(get_filename(FN_ERRFILE));
+@@ -1724,7 +1780,7 @@ void print_final_report(bool failure)
+     }
+ }
+=20
+-static void assemble_file(const char *fname, struct strlist *depend_lis=
t)
++static void assemble_file(const char *fname, char const* mapped_fname, =
struct strlist *depend_list)
+ {
+     static int64_t stall_count =3D 0; /* Make sure we make forward prog=
ress... */
+     char *line;
+@@ -1814,7 +1870,7 @@ static void assemble_file(const char *fname, struc=
t strlist *depend_list)
+             location.known =3D true;
+         ofmt->reset();
+         switch_segment(ofmt->section(NULL, &globl.bits));
+-        pp_reset(fname, PP_NORMAL, depend_list);
++        pp_reset(fname, mapped_fname, PP_NORMAL, depend_list);
+=20
+         globallineno =3D 0;
+=20
+@@ -2203,6 +2259,8 @@ static void help(FILE *out, const char *what)
+             "    --lprefix str  prepend the given string to local symbo=
ls\n"
+             "    --lpostfix str append the given string to local symbol=
s\n"
+             "    --reproducible attempt to produce run-to-run identical=
 output\n"
++            "    --debug-prefix-map base=3Ddest\n"
++            "                   remap paths starting with 'base' to 'de=
st' in output files\n"
+             , out);
+     }
+     if (help_is(with, HW_LIMIT)) {
+diff --git a/asm/preproc.c b/asm/preproc.c
+index 037b1704e..eebb1238a 100644
+--- a/asm/preproc.c
++++ b/asm/preproc.c
+@@ -8638,7 +8638,7 @@ static void pp_reset_stdmac(enum preproc_mode mode=
)
+     define_smacro("__?PASS?__", true, make_tok_num(NULL, apass), NULL);
+ }
+=20
+-void pp_reset(const char *file, enum preproc_mode mode,
++void pp_reset(const char *file, char const* mapped_fname, enum preproc_=
mode mode,
+               struct strlist *dep_list)
+ {
+     cstk =3D NULL;
+@@ -8677,7 +8677,7 @@ void pp_reset(const char *file, enum preproc_mode =
mode,
+ 	nasm_fatalf(ERR_NOFILE, "unable to open input file `%s'%s%s",
+                     file, errno ? " " : "", errno ? strerror(errno) : "=
");
+     }
+-    src_set(0, file);
++    src_set(0, mapped_fname);
+     istk->where =3D src_where();
+     istk->lineinc =3D 1;
+=20
+diff --git a/common/files.c b/common/files.c
+index 8b01657d2..842777438 100644
+--- a/common/files.c
++++ b/common/files.c
+@@ -7,6 +7,7 @@
+=20
+ static const char * const filename_names[FN_NFILES] =3D {
+     "input",
++    "mapped-input",
+     "output",
+     "error",
+     "list",
+@@ -44,7 +45,7 @@ void check_overwrite_files(void)
+     if (!inname)
+         return;
+=20
+-    for (fn =3D FN_INFILE+1; fn < FN_NFILES; fn++) {
++    for (fn =3D FN_INFILE+2; fn < FN_NFILES; fn++) {
+         const char *outname =3D get_filename(fn);
+         if (outname && !strcmp(inname, outname)) {
+             nasm_fatal("%s file would overwrite input file",
+diff --git a/include/files.h b/include/files.h
+index 314dea184..610e24b90 100644
+--- a/include/files.h
++++ b/include/files.h
+@@ -14,6 +14,7 @@
+ enum filenames {
+     /* These two entries must be first, in this order */
+     FN_INFILE,                  /* Primary input file */
++    FN_MAPPED_INFILE,           /* Debug mapped input file */
+     FN_OUTFILE,                 /* Primary output file */
+=20
+     FN_ERRFILE,                 /* Error message file */
+diff --git a/include/nasm.h b/include/nasm.h
+index 136f2741b..21439ea77 100644
+--- a/include/nasm.h
++++ b/include/nasm.h
+@@ -458,7 +458,7 @@ void pp_init(enum preproc_opt opt);
+  * of the pass, an error reporting function, an evaluator
+  * function, and a listing generator to talk to.
+  */
+-void pp_reset(const char *file, enum preproc_mode mode,
++void pp_reset(const char *file, const char* mapped_fname, enum preproc_=
mode mode,
+               struct strlist *deplist);
+=20
+ /*
+diff --git a/nasm.txt b/nasm.txt
+index 950c361a2..784618ca8 100644
+--- a/nasm.txt
++++ b/nasm.txt
+@@ -147,6 +147,10 @@ OPTIONS
+ 	Prepend or append (respectively) the given argument to all global or
+ 	extern variables.
+=20
++--debug-prefix-map 'BASE=3DDEST'::
++    Map file names beginning with 'BASE' to 'DEST' when encoding them i=
n
++    output object files.
++
+ SYNTAX
+ ------
+ This man page does not fully describe the syntax of *nasm*'s assembly l=
anguage,
+diff --git a/output/outas86.c b/output/outas86.c
+index 8b7891862..4853ff822 100644
+--- a/output/outas86.c
++++ b/output/outas86.c
+@@ -104,7 +104,7 @@ static void as86_init(void)
+     strslen =3D 0;
+=20
+     /* as86 module name =3D input file minus extension */
+-    module_name =3D filename_set_extension(get_filename(FN_INFILE), "")=
;
++    module_name =3D filename_set_extension(get_filename(FN_MAPPED_INFIL=
E), "");
+     as86_add_string(module_name);
+     nasm_free(module_name);
+ }
+diff --git a/output/outcoff.c b/output/outcoff.c
+index 8a0a3216c..812376300 100644
+--- a/output/outcoff.c
++++ b/output/outcoff.c
+@@ -1342,7 +1342,7 @@ static void coff_write_symbols(void)
+     if (reproducible)
+         memset(filename, 0, 18);
+     else
+-        strncpy(filename, get_filename(FN_INFILE), 18);
++        strncpy(filename, get_filename(FN_MAPPED_INFILE), 18);
+     nasm_write(filename, 18, ofile);
+=20
+     /*
+diff --git a/output/outelf.c b/output/outelf.c
+index 0f20ddf6d..1490ab0c8 100644
+--- a/output/outelf.c
++++ b/output/outelf.c
+@@ -511,7 +511,7 @@ static void elf64_init(void)
+=20
+ static void elf_populate_dirs(void)
+ {
+-    const char * const infile =3D get_filename(FN_INFILE);
++    const char * const infile =3D get_filename(FN_MAPPED_INFILE);
+     char *cur_path =3D nasm_realpath(infile);
+     char *dir_name =3D nasm_dirname(cur_path);
+=20
+diff --git a/output/outieee.c b/output/outieee.c
+index a00f25dc6..38f9f4778 100644
+--- a/output/outieee.c
++++ b/output/outieee.c
+@@ -179,7 +179,7 @@ static void ieee_unqualified_name(char *, char *);
+  */
+ static void ieee_init(void)
+ {
+-    strlcpy(ieee_infile, get_filename(FN_INFILE), sizeof(ieee_infile));
++    strlcpy(ieee_infile, get_filename(FN_MAPPED_INFILE), sizeof(ieee_in=
file));
+     any_segs =3D false;
+     fpubhead =3D NULL;
+     fpubtail =3D &fpubhead;
+diff --git a/output/outmacho.c b/output/outmacho.c
+index 233f1f93a..1831789fb 100644
+--- a/output/outmacho.c
++++ b/output/outmacho.c
+@@ -325,7 +325,7 @@ static int32_t macho_gotpcrel_sect;
+=20
+ static void macho_init(void)
+ {
+-    module_name =3D get_filename(FN_INFILE);
++    module_name =3D get_filename(FN_MAPPED_INFILE);
+     sects =3D NULL;
+     sectstail =3D &sects;
+=20
+diff --git a/output/outobj.c b/output/outobj.c
+index 2059a0cac..d824fe412 100644
+--- a/output/outobj.c
++++ b/output/outobj.c
+@@ -657,7 +657,7 @@ static const char *get_default_class(const char *seg=
ment)
+=20
+ static void obj_init(void)
+ {
+-    strlcpy(obj_infile, get_filename(FN_INFILE), sizeof(obj_infile));
++    strlcpy(obj_infile, get_filename(FN_MAPPED_INFILE), sizeof(obj_infi=
le));
+     first_seg =3D seg_alloc();
+     any_segs =3D false;
+     fpubhead =3D NULL;
+diff --git a/test/elfdebugprefix.asm b/test/elfdebugprefix.asm
+new file mode 100644
+index 000000000..a67ba29c8
+--- /dev/null
++++ b/test/elfdebugprefix.asm
+@@ -0,0 +1,6 @@
++;Testname=3Dunoptimized; Arguments=3D-O0 --debug-prefix-map elf=3DELF -=
felf -oelfdebugprefix.o; Files=3Dstdout stderr elfdebugprefix.o; Validate=
=3Dreadelf --wide --symbols elfdebugprefix.o | grep 'FILE.*ELFdebugprefix=
.asm'
++
++	  SECTION .text
++test:			; [1]
++	  ret
++
+diff --git a/test/performtest.pl b/test/performtest.pl
+index 46b1bdfa7..2426848fb 100755
+--- a/test/performtest.pl
++++ b/test/performtest.pl
+@@ -42,14 +42,22 @@ sub perform {
+     TEST:
+     while(<TESTFILE>) {
+         #See if there is a test case
+-        last unless /Testname=3D(.*);\s*Arguments=3D(.*);\s*Files=3D(.*=
)/;
+-        my ($subname, $arguments, $files) =3D ($1, $2, $3);
++        last unless /Testname=3D(.*);\s*Arguments=3D(.*);\s*Files=3D([^=
;]*)(?:;\s*Validate=3D(.*))?/;
++        my ($subname, $arguments, $files, $validate) =3D ($1, $2, $3, $=
4);
++        chomp $files;
+         debugprint("$subname | $arguments | $files");
+=20
+         #Call nasm with this test case
+         system("$nasm $arguments $testpath > $stdoutfile 2> $stderrfile=
");
+         debugprint("$nasm $arguments $testpath > $stdoutfile 2> $stderr=
file ----> $?");
+=20
++        if($validate) {
++            if(system("$validate >> $stdoutfile 2>> $stderrfile") !=3D =
0) {
++                print "Test $testname/$subname validation failed\n";
++                $globalresult =3D 1;
++            }
++        }
++
+         #Move the output to the test dir
+         mkpath("$outputdir/$testname/$subname");
+         foreach(split / /,$files) {
+--=20
+2.43.0
+
diff --git a/meta/recipes-devtools/nasm/nasm_3.01.bb b/meta/recipes-devto=
ols/nasm/nasm_3.02.bb
similarity index 62%
rename from meta/recipes-devtools/nasm/nasm_3.01.bb
rename to meta/recipes-devtools/nasm/nasm_3.02.bb
index 837aaad9abf..9dee8f5f254 100644
--- a/meta/recipes-devtools/nasm/nasm_3.01.bb
+++ b/meta/recipes-devtools/nasm/nasm_3.02.bb
@@ -8,16 +8,15 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6178dc4f5355=
e40552448080e67a214b"
 DEPENDS =3D "zlib"
=20
 SRC_URI =3D "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.=
tar.bz2 \
-           file://0001-stdlib-Add-strlcat.patch \
-           file://0002-Add-debug-prefix-map-option.patch \
-           file://0001-compiler.h-Backport-C23-support.patch \
+           file://0001-nasmlib-file-add-nasm_remove.patch \
+           file://0002-Refactor-the-handling-of-primary-input-output-fil=
es.patch \
+           file://0003-Add-debug-prefix-map-option.patch \
            "
-
-SRC_URI[sha256sum] =3D "7a7b1ff3b0eef3247862f2fbe4ca605ccef770545d7af797=
9eba84a9d045c0b1"
+SRC_URI[sha256sum] =3D "ce7ed93281615379e4a9d4e76503c64a79c1d5ca696dbe14=
8f16cf0b93e239af"
=20
 EXTRA_AUTORECONF:append =3D " -I autoconf/m4"
=20
-inherit autotools-brokensep
+inherit autotools
=20
 BBCLASSEXTEND =3D "native"
=20
--=20
2.43.0



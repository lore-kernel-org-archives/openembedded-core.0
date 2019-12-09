Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
	[209.85.166.42])
	by mail.openembedded.org (Postfix) with ESMTP id BA0F47F8A1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2019 04:03:21 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id s2so13245581iog.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Dec 2019 20:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=6BuMkkMQLmM8526bdFVX03Z1v48z7VvCUWDb3fwOwkU=;
	b=b2k3tO/0x4ckNtjGUJhgCYvNvElOGX3r+TCh0zv52n7T94Yql+q+ufcXYM7COXbt2+
	x18krh7TJga9+Ek18nLQ8Lo69+xfyxLBAgCAInYJlTii6cXSt9zPqedKhyniGn1c/TRf
	w2Q2C0gk5fpytIk+UsyUsIfiDqajGF0AQuK+IWp8V+y0PgAu5MbVUF8vfTwggQ0TTX9E
	r5DjgkBmGmZOVI/kNALvCp0keAsEzT9gNzdQidGYl5K/P0KSPGSRHjm1r4a1CCCg3ovx
	wkzUzMRI+uvt7kOqWu2AuYcxjzyCtb8RXX5pd4VW/vt6LbbZNDf6ca8wtteMV1iGbqfj
	+0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6BuMkkMQLmM8526bdFVX03Z1v48z7VvCUWDb3fwOwkU=;
	b=FmCmRPmVx6nOSialAnkyzfnlPkhuTZkAjP57XXZ/yZV9plX7O8I6nXX+DhJS05Vy6k
	wpyJrzjJf0KPWqMt//hLrxg/K4knqwA8PZ0gmnThLYSFlMZ6SBVm0R0KLUkk3D39HJWq
	+64vioNpMgvRji+Q3QtkLROXptYw8Mu4/qkGRt9vryg8+/tsv9Kz+Bhl0MWFSFGkQgb8
	cSUV9w/u6eeaMk4ziaGkcWnSkrKULVIwQ1S6bwPkuV1ImGrrkx5k7n/tPdl6AVBO4k9z
	Gz74OqKIlioEEkI6UbFnyqVoxqeheMxZaCUcj6eD6gpxJazFy3lLb8h9DNsSvF0rW5IN
	HimQ==
X-Gm-Message-State: APjAAAXbd3HNJD7mIXaMIO9u0rnVlJ4ApbYB0ADe2t2r8IU7K8GGmAhW
	IVy/8nHdb5KWIOrLu0RNNCuBnn1H6OQ=
X-Google-Smtp-Source: APXvYqzokXlG90tLle8Lx5Z2r9IHgdetmn6yHiSvntShFAKFk7JanHvTLhu7+ShtHMeh2m5+uY2edQ==
X-Received: by 2002:a6b:6e18:: with SMTP id d24mr10494251ioh.301.1575864202039;
	Sun, 08 Dec 2019 20:03:22 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	v21sm3465649ios.69.2019.12.08.20.03.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Dec 2019 20:03:21 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Dec 2019 22:03:11 -0600
Message-Id: <20191209040312.3475750-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191209040312.3475750-1-JPEWhacker@gmail.com>
References: <20191209040312.3475750-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] nasm: Add debug-prefix-map option
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
X-List-Received-Date: Mon, 09 Dec 2019 04:03:22 -0000
Content-Transfer-Encoding: 8bit

Adds an option to nasm to change the prefix for file paths encoded in
the object files. This allows builds to be reproducible regardless of
the build directory.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../nasm/nasm/0001-stdlib-Add-strlcat.patch   | 117 +++++++
 .../0002-Add-debug-prefix-map-option.patch    | 325 ++++++++++++++++++
 meta/recipes-devtools/nasm/nasm_2.14.02.bb    |   2 +
 3 files changed, 444 insertions(+)
 create mode 100644 meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patch
 create mode 100644 meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch

diff --git a/meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patch b/meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patch
new file mode 100644
index 00000000000..d94fd3290e4
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patch
@@ -0,0 +1,117 @@
+From 8a204171004fa0d7d21389530c744d215e99efb0 Mon Sep 17 00:00:00 2001
+From: Joshua Watt <JPEWhacker@gmail.com>
+Date: Tue, 19 Nov 2019 12:47:30 -0600
+Subject: [PATCH 1/2] stdlib: Add strlcat
+
+Adds strlcat which can be used to safely concatenate strings
+
+Upstream-Status: Submitted [https://bugzilla.nasm.us/show_bug.cgi?id=3392635]
+Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
+---
+ Makefile.in        |  2 +-
+ configure.ac       |  2 ++
+ include/compiler.h |  4 ++++
+ stdlib/strlcat.c   | 43 +++++++++++++++++++++++++++++++++++++++++++
+ 4 files changed, 50 insertions(+), 1 deletion(-)
+ create mode 100644 stdlib/strlcat.c
+
+diff --git a/Makefile.in b/Makefile.in
+index 32ef3d91..ff7eb447 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -93,7 +93,7 @@ NASM =	asm/nasm.$(O)
+ NDISASM = disasm/ndisasm.$(O)
+ 
+ LIBOBJ = stdlib/snprintf.$(O) stdlib/vsnprintf.$(O) stdlib/strlcpy.$(O) \
+-	stdlib/strnlen.$(O) stdlib/strrchrnul.$(O) \
++	stdlib/strnlen.$(O) stdlib/strrchrnul.$(O) stdlib/strlcat.$(O) \
+ 	\
+ 	nasmlib/ver.$(O) \
+ 	nasmlib/crc64.$(O) nasmlib/malloc.$(O) nasmlib/errfile.$(O) \
+diff --git a/configure.ac b/configure.ac
+index 38b3b596..b4e88778 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -152,6 +152,7 @@ AC_CHECK_FUNCS([vsnprintf _vsnprintf])
+ AC_CHECK_FUNCS([snprintf _snprintf])
+ AC_CHECK_FUNCS([strlcpy])
+ AC_CHECK_FUNCS([strrchrnul])
++AC_CHECK_FUNCS([strlcat])
+ 
+ dnl These types are POSIX-specific, and Windows does it differently...
+ AC_CHECK_TYPES([struct _stati64])
+@@ -170,6 +171,7 @@ AC_CHECK_DECLS(strsep)
+ AC_CHECK_DECLS(strlcpy)
+ AC_CHECK_DECLS(strnlen)
+ AC_CHECK_DECLS(strrchrnul)
++AC_CHECK_DECLS(strlcat)
+ 
+ dnl Check for missing types
+ AC_TYPE_UINTPTR_T
+diff --git a/include/compiler.h b/include/compiler.h
+index 4178c98e..8153d297 100644
+--- a/include/compiler.h
++++ b/include/compiler.h
+@@ -159,6 +159,10 @@ size_t strlcpy(char *, const char *, size_t);
+ char *strrchrnul(const char *, int);
+ #endif
+ 
++#if !defined(HAVE_STRLCAT) || !HAVE_DECL_STRLCAT
++size_t strlcat(char *, const char *, size_t);
++#endif
++
+ #ifndef __cplusplus		/* C++ has false, true, bool as keywords */
+ # ifdef HAVE_STDBOOL_H
+ #  include <stdbool.h>
+diff --git a/stdlib/strlcat.c b/stdlib/strlcat.c
+new file mode 100644
+index 00000000..7084d460
+--- /dev/null
++++ b/stdlib/strlcat.c
+@@ -0,0 +1,43 @@
++/*
++ * Copyright (c) 2019 Garmin Ltd. or its subsidiaries
++ *
++ * Permission to use, copy, modify, and distribute this software for any
++ * purpose with or without fee is hereby granted, provided that the above
++ * copyright notice and this permission notice appear in all copies.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
++ * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
++ * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
++ * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
++ * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
++ * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
++ * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
++ */
++
++#include "compiler.h"
++
++/*
++ * Concatenate src string to dest of size size. The destination buffer will
++ * have no more than size-1 character when the operation finishes. Always NUL
++ * terminates, unless size == 0 or dest has no NUL terminator. Returns
++ * strlen(initial dest) + strlen(src); if retval >= size, truncation occurred.
++ */
++#ifndef HAVE_STRLCAT
++
++size_t strlcat(char *dest, const char *src, size_t size)
++{
++    size_t n;
++
++    /* find the NULL terminator in dest */
++    for (n = 0; i < size && dest[n] != '\0'; n++)
++        ;
++
++    /* destination was not NULL terminated. Return the initial size */
++    if (n == size)
++        return size;
++
++    return strlcpy(&dest[n], src, size - n) + n;
++}
++
++#endif
++
+-- 
+2.23.0
+
diff --git a/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch b/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch
new file mode 100644
index 00000000000..bbfae2e8a50
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch
@@ -0,0 +1,325 @@
+From fa677c1caf6b8192971920cf5c1aa8cb33c74605 Mon Sep 17 00:00:00 2001
+From: Joshua Watt <JPEWhacker@gmail.com>
+Date: Tue, 19 Nov 2019 13:12:17 -0600
+Subject: [PATCH 2/2] Add --debug-prefix-map option
+
+Adds an option to remap file prefixes in output object files. This is
+analogous to the "-fdebug-prefix-map" option in GCC, and allows files to
+be built in a reproducible manner regardless of the build directory.
+
+Upstream-Status: Submitted [https://bugzilla.nasm.us/show_bug.cgi?id=3392635]
+Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
+---
+ asm/nasm.c              | 28 ++++++++++++++++++++++++++--
+ include/nasmlib.h       |  9 +++++++++
+ nasm.txt                |  4 ++++
+ nasmlib/filename.c      | 20 ++++++++++++++++++++
+ output/outas86.c        |  4 +++-
+ output/outcoff.c        |  4 ++--
+ output/outelf.c         |  8 ++++----
+ output/outieee.c        |  2 +-
+ output/outobj.c         |  2 +-
+ stdlib/strlcat.c        |  2 +-
+ test/elfdebugprefix.asm |  6 ++++++
+ test/performtest.pl     | 12 ++++++++++--
+ 12 files changed, 87 insertions(+), 14 deletions(-)
+ create mode 100644 test/elfdebugprefix.asm
+
+diff --git a/asm/nasm.c b/asm/nasm.c
+index 1c5a5fc5..5d45103c 100644
+--- a/asm/nasm.c
++++ b/asm/nasm.c
+@@ -841,7 +841,8 @@ enum text_options {
+     OPT_BEFORE,
+     OPT_LIMIT,
+     OPT_KEEP_ALL,
+-    OPT_NO_LINE
++    OPT_NO_LINE,
++    OPT_DEBUG_PREFIX_MAP
+ };
+ struct textargs {
+     const char *label;
+@@ -866,6 +867,7 @@ static const struct textargs textopts[] = {
+     {"limit-",   OPT_LIMIT,   true, 0},
+     {"keep-all", OPT_KEEP_ALL, false, 0},
+     {"no-line",  OPT_NO_LINE, false, 0},
++    {"debug-prefix-map", OPT_DEBUG_PREFIX_MAP, true, 0},
+     {NULL, OPT_BOGUS, false, 0}
+ };
+ 
+@@ -1217,6 +1219,26 @@ static bool process_arg(char *p, char *q, int pass)
+                 case OPT_NO_LINE:
+                     pp_noline = true;
+                     break;
++                case OPT_DEBUG_PREFIX_MAP: {
++                    struct debug_prefix_list *d;
++                    char *c;
++                    c = strchr(param, '=');
++
++                    if (!c) {
++                        nasm_error(ERR_NONFATAL | ERR_NOFILE | ERR_USAGE,
++                                   "option `--%s' must be of the form `BASE=DEST'", p);
++                        break;
++                    }
++
++                    *c = '\0';
++                    d = nasm_malloc(sizeof(*d));
++                    d->next = debug_prefixes;
++                    d->base = nasm_strdup(param);
++                    d->dest = nasm_strdup(c + 1);
++                    debug_prefixes = d;
++                    *c = '=';
++                    }
++                    break;
+                 case OPT_HELP:
+                     help(0);
+                     exit(0);
+@@ -2010,7 +2032,9 @@ static void help(const char xopt)
+          "   --lpostfix str append the given string to all other symbols\n"
+          "   --keep-all     output files will not be removed even if an error happens\n"
+          "   --no-line      ignore %%line directives in input\n"
+-         "   --limit-X val  set execution limit X\n");
++         "   --limit-X val  set execution limit X\n"
++         "   --debug-prefix-map base=dest\n"
++         "                  remap paths starting with 'base' to 'dest' in output files\n");
+ 
+     for (i = 0; i <= LIMIT_MAX; i++) {
+         printf("                     %-15s %s (default ",
+diff --git a/include/nasmlib.h b/include/nasmlib.h
+index e57d0e6d..cf921547 100644
+--- a/include/nasmlib.h
++++ b/include/nasmlib.h
+@@ -195,10 +195,19 @@ int64_t readstrnum(char *str, int length, bool *warn);
+  */
+ int32_t seg_alloc(void);
+ 
++struct debug_prefix_list {
++    struct debug_prefix_list *next;
++    char *base;
++    char *dest;
++};
++
++extern struct debug_prefix_list *debug_prefixes;
++
+ /*
+  * Add/replace or remove an extension to the end of a filename
+  */
+ const char *filename_set_extension(const char *inname, const char *extension);
++char *filename_debug_remap(char *dest, char const *inname, size_t len);
+ 
+ /*
+  * Utility macros...
+diff --git a/nasm.txt b/nasm.txt
+index a28202f9..443c06b2 100644
+--- a/nasm.txt
++++ b/nasm.txt
+@@ -147,6 +147,10 @@ OPTIONS
+ 	Prepend or append (respectively) the given argument to all global or
+ 	extern variables.
+ 
++--debug-prefix-map 'BASE=DEST'::
++    Map file names beginning with 'BASE' to 'DEST' when encoding them in
++    output object files.
++
+ SYNTAX
+ ------
+ This man page does not fully describe the syntax of *nasm*'s assembly language,
+diff --git a/nasmlib/filename.c b/nasmlib/filename.c
+index 172ae0bc..fda2be41 100644
+--- a/nasmlib/filename.c
++++ b/nasmlib/filename.c
+@@ -39,6 +39,8 @@
+ #include "nasmlib.h"
+ #include "error.h"
+ 
++struct debug_prefix_list *debug_prefixes = NULL;
++
+ /*
+  * Add/modify a filename extension, assumed to be a period-delimited
+  * field at the very end of the filename.  Returns a newly allocated
+@@ -61,3 +63,21 @@ const char *filename_set_extension(const char *inname, const char *extension)
+ 
+     return p;
+ }
++
++char *filename_debug_remap(char *dest, char const *in, size_t len)
++{
++    struct debug_prefix_list *d;
++    size_t n;
++
++    for (d = debug_prefixes; d != NULL; d = d->next) {
++        n = strlen(d->base);
++        if (strncmp(in, d->base, n) == 0) {
++            strlcpy(dest, d->dest, len);
++            strlcat(dest, &in[n], len);
++            return dest;
++        }
++    }
++
++    strlcpy(dest, in, len);
++    return dest;
++}
+diff --git a/output/outas86.c b/output/outas86.c
+index 3f9867b9..d5f4f966 100644
+--- a/output/outas86.c
++++ b/output/outas86.c
+@@ -113,6 +113,8 @@ static void as86_sect_write(struct Section *, const uint8_t *,
+ 
+ static void as86_init(void)
+ {
++    char filename[FILENAME_MAX];
++
+     stext.data = saa_init(1L);
+     stext.datalen = 0L;
+     stext.head = stext.last = NULL;
+@@ -134,7 +136,7 @@ static void as86_init(void)
+     strslen = 0;
+ 
+     /* as86 module name = input file minus extension */
+-    as86_add_string(filename_set_extension(inname, ""));
++    as86_add_string(filename_debug_remap(filename, filename_set_extension(inname, ""), sizeof(filename)));
+ }
+ 
+ static void as86_cleanup(void)
+diff --git a/output/outcoff.c b/output/outcoff.c
+index a2fd302c..bcf576fb 100644
+--- a/output/outcoff.c
++++ b/output/outcoff.c
+@@ -1070,14 +1070,14 @@ static void coff_symbol(char *name, int32_t strpos, int32_t value,
+ 
+ static void coff_write_symbols(void)
+ {
+-    char filename[18];
++    char filename[19];
+     uint32_t i;
+ 
+     /*
+      * The `.file' record, and the file name auxiliary record.
+      */
+     coff_symbol(".file", 0L, 0L, -2, 0, 0x67, 1);
+-    strncpy(filename, inname, 18);
++    filename_debug_remap(filename, inname, 19);
+     nasm_write(filename, 18, ofile);
+ 
+     /*
+diff --git a/output/outelf.c b/output/outelf.c
+index de99d076..203b5dc0 100644
+--- a/output/outelf.c
++++ b/output/outelf.c
+@@ -1,5 +1,5 @@
+ /* ----------------------------------------------------------------------- *
+- *   
++ *
+  *   Copyright 1996-2017 The NASM Authors - All Rights Reserved
+  *   See the file AUTHORS included with the NASM distribution for
+  *   the specific copyright holders.
+@@ -14,7 +14,7 @@
+  *     copyright notice, this list of conditions and the following
+  *     disclaimer in the documentation and/or other materials provided
+  *     with the distribution.
+- *     
++ *
+  *     THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
+  *     CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
+  *     INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
+@@ -315,7 +315,7 @@ elf_directive(enum directive directive, char *value, int pass)
+ 
+ static void elf_init(void)
+ {
+-    strlcpy(elf_module, inname, sizeof(elf_module));
++    filename_debug_remap(elf_module, inname, sizeof(elf_module));
+     sects = NULL;
+     nsects = sectlen = 0;
+     syms = saa_init((int32_t)sizeof(struct elf_symbol));
+@@ -868,7 +868,7 @@ static void elf32_out(int32_t segto, const void *data,
+                       " segment base references");
+             } else {
+                 if (wrt == NO_SEG) {
+-                    /* 
++                    /*
+                      * The if() is a hack to deal with compilers which
+                      * don't handle switch() statements with 64-bit
+                      * expressions.
+diff --git a/output/outieee.c b/output/outieee.c
+index 3a28942d..f61824e4 100644
+--- a/output/outieee.c
++++ b/output/outieee.c
+@@ -209,7 +209,7 @@ static void ieee_unqualified_name(char *, char *);
+  */
+ static void ieee_init(void)
+ {
+-    strlcpy(ieee_infile, inname, sizeof(ieee_infile));
++    filename_debug_remap(ieee_infile, inname, sizeof(ieee_infile));
+     any_segs = false;
+     fpubhead = NULL;
+     fpubtail = &fpubhead;
+diff --git a/output/outobj.c b/output/outobj.c
+index b4f2c499..55bba4a1 100644
+--- a/output/outobj.c
++++ b/output/outobj.c
+@@ -640,7 +640,7 @@ static enum directive_result obj_directive(enum directive, char *, int);
+ 
+ static void obj_init(void)
+ {
+-    strlcpy(obj_infile, inname, sizeof(obj_infile));
++    filename_debug_remap(obj_infile, inname, sizeof(obj_infile));
+     first_seg = seg_alloc();
+     any_segs = false;
+     fpubhead = NULL;
+diff --git a/stdlib/strlcat.c b/stdlib/strlcat.c
+index 7084d460..ee93dea3 100644
+--- a/stdlib/strlcat.c
++++ b/stdlib/strlcat.c
+@@ -29,7 +29,7 @@ size_t strlcat(char *dest, const char *src, size_t size)
+     size_t n;
+ 
+     /* find the NULL terminator in dest */
+-    for (n = 0; i < size && dest[n] != '\0'; n++)
++    for (n = 0; n < size && dest[n] != '\0'; n++)
+         ;
+ 
+     /* destination was not NULL terminated. Return the initial size */
+diff --git a/test/elfdebugprefix.asm b/test/elfdebugprefix.asm
+new file mode 100644
+index 00000000..a67ba29c
+--- /dev/null
++++ b/test/elfdebugprefix.asm
+@@ -0,0 +1,6 @@
++;Testname=unoptimized; Arguments=-O0 --debug-prefix-map elf=ELF -felf -oelfdebugprefix.o; Files=stdout stderr elfdebugprefix.o; Validate=readelf --wide --symbols elfdebugprefix.o | grep 'FILE.*ELFdebugprefix.asm'
++
++	  SECTION .text
++test:			; [1]
++	  ret
++
+diff --git a/test/performtest.pl b/test/performtest.pl
+index f7865b39..096f9604 100755
+--- a/test/performtest.pl
++++ b/test/performtest.pl
+@@ -42,14 +42,22 @@ sub perform {
+     TEST:
+     while(<TESTFILE>) {
+         #See if there is a test case
+-        last unless /Testname=(.*);\s*Arguments=(.*);\s*Files=(.*)/;
+-        my ($subname, $arguments, $files) = ($1, $2, $3);
++        last unless /Testname=(.*);\s*Arguments=(.*);\s*Files=([^;]*)(?:;\s*Validate=(.*))?/;
++        my ($subname, $arguments, $files, $validate) = ($1, $2, $3, $4);
++        chomp $files;
+         debugprint("$subname | $arguments | $files");
+ 
+         #Call nasm with this test case
+         system("$nasm $arguments $testpath > $stdoutfile 2> $stderrfile");
+         debugprint("$nasm $arguments $testpath > $stdoutfile 2> $stderrfile ----> $?");
+ 
++        if($validate) {
++            if(system("$validate >> $stdoutfile 2>> $stderrfile") != 0) {
++                print "Test $testname/$subname validation failed\n";
++                $globalresult = 1;
++            }
++        }
++
+         #Move the output to the test dir
+         mkpath("$outputdir/$testname/$subname");
+         foreach(split / /,$files) {
+-- 
+2.23.0
+
diff --git a/meta/recipes-devtools/nasm/nasm_2.14.02.bb b/meta/recipes-devtools/nasm/nasm_2.14.02.bb
index bd4ecea8b65..f8a8d76e99f 100644
--- a/meta/recipes-devtools/nasm/nasm_2.14.02.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.14.02.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=90904486f8fbf1861cf42752e1a39efe"
 SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
            file://CVE-2018-19755.patch \
            file://CVE-2019-14248.patch \
+           file://0001-stdlib-Add-strlcat.patch \
+           file://0002-Add-debug-prefix-map-option.patch \
            "
 
 SRC_URI[md5sum] = "3f489aa48ad2aa1f967dc5e293bbd06f"
-- 
2.23.0



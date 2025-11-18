Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90968CED260
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 10:01:49 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9051.1763460109213468378
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Nov 2025 02:01:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UXw3DeXw;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2957850c63bso54852375ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 02:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763460108; x=1764064908; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m2e1Uj8m3DwD6UCHG8kVfJNvZdsTosp/GYRUUwatZKg=;
        b=UXw3DeXw4leCpZwyY2vnnRxL6MAggQ1RmmNBeRNpu/i5Buk3GqwaN0QB399kgPafkd
         qqKzD6Je3O08voDYYa7x9EJf4WDTLgVHo2xrPVB9Dyxc1Be5xGjbFEMNK3ndX94DftrV
         hgvPo9mQG8N63TKnnJz5aibqIxpGfHevW/IOUhOqKoDbZa6Ao7yK02sDgzjPbzH3j7gV
         KUB7YVnV+38q+DE9FjGBPt9gQHQ+FEOdUnsa6lpdxHooL96kSfwIkXVSeYUUIZv5f+GT
         4bp2eOvwu8zBZsSuD0OgPQbbpEMip9wp+SDObUtKNAXMa37KvgpGpR+JV4xfo2RtOjGC
         hJ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763460108; x=1764064908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2e1Uj8m3DwD6UCHG8kVfJNvZdsTosp/GYRUUwatZKg=;
        b=pJ0pl1yXzlD2yFOeNPQ+DgqYTAufame00RLO13zm2NcKJPesqNSmnV895mx7RXi5U9
         JXTjMv6+1A0eUr16NMDaFABRN4IEJ1Rcp3LcTUBaXT9DcXomsX5NrMzqJLN9+hBUBZQ3
         TICkjpyymIGSq3WNl3Zz14xseI/b4uau9dy/cT17sQmVNmOMgQQm1iPAEvXhgM7qx7bd
         nRnQpxoUc1kkXImbw+/NAdA7bSDsM9/k9HgnMeGsgr7dRpZ3OYB0nevREqUNd8YojKGj
         xrEvSt56lpAsBZ6S32h+/Ia3Cv79I+pSkfQfHE1jRMpHfU4FURDpeCzWDUkdmqpEp0Wm
         P+Pw==
X-Gm-Message-State: AOJu0YyM8U43RUZr9lA0w/AslIPktv9pLQcKANpmfMieiC2GXnE3Nao8
	lrAqMnhTfDSIIBEpMlarBsbO9kCD9hKeRzXMuXn/ixHqEbVT9xt+ahBynGbIjg==
X-Gm-Gg: ASbGncvv3fEfUCRt6psD9NhkSYbdVQMFIFRbirPuJNEZnf1JFm7wzdPr2cWJBYctuCt
	tvtbJLqtqRhNTF6tNuGHLANWsxc9vfGPVs4kAqH52Zz/ncyPtzsMtjKXMFCsLWjx5yOeIJiaVd6
	6x8r5s4OCumhtcDLXvDGj+8k6qP/cqUNRyPYPackaYBACVxqUdF6PABkDpOe3CqP37J668vc+3n
	Lki4PqtzhaVH+FR7A8Bf8DeL9b47yOp40/KtGDVnRFVskfhKzBSQD7PUx8qOSF31Ox0rujpkhY8
	Qol/N+m7fckO3nqpxncWsWZNZsBLUa0HkxVESPxXqQ5zonu5Dqt5dWCepfBMmFsid0wbNHAuWt9
	FQ556OZ0kU7jBeYiPI/k20KimVz1SWqvTtab3NS3ekgUbvgca/pjKJDbwSMA4VSMcVg6jrL6YXN
	nvGjOvaRZL+TwxhcOhO6663fxG
X-Google-Smtp-Source: AGHT+IHqkr4bWLSnDWwqh6trWIbCPiyJUbcozoUAhLJ4cCscSe9ewHODkGv8UZy/RYjdqw4WE423pw==
X-Received: by 2002:a17:902:e803:b0:297:dd99:ff13 with SMTP id d9443c01a7336-299f55887bamr33738695ad.17.1763460108245;
        Tue, 18 Nov 2025 02:01:48 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.126.249])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36db25bfbsm15354131a12.1.2025.11.18.02.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 02:01:47 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH v2] nasm: upgrade 2.16.03 -> 3.01
Date: Tue, 18 Nov 2025 23:01:40 +1300
Message-ID: <20251118100140.1584703-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 10:01:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226516

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

License-Update: Copyright year updated to 2025 and upstream replaced verbose copyright headers with SPDX tags

Refreshed patches for the new version.

Release Note:
https://www.nasm.us/docs/3.01/nasmac.html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
Changes in v2:
- updated license checksum
---
 .../nasm/nasm/0001-stdlib-Add-strlcat.patch   |  43 ++++---
 .../0002-Add-debug-prefix-map-option.patch    | 114 +++++++++---------
 .../nasm/{nasm_2.16.03.bb => nasm_3.01.bb}    |   4 +-
 3 files changed, 81 insertions(+), 80 deletions(-)
 rename meta/recipes-devtools/nasm/{nasm_2.16.03.bb => nasm_3.01.bb} (78%)

diff --git a/meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patch b/meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patch
index 1b8e947c56..9d74742072 100644
--- a/meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patch
+++ b/meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patch
@@ -12,64 +12,64 @@ Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
  Makefile.in        |  2 +-
  configure.ac       |  2 ++
  include/compiler.h |  4 ++++
- stdlib/strlcat.c   | 43 +++++++++++++++++++++++++++++++++++++++++++
- 4 files changed, 50 insertions(+), 1 deletion(-)
+ stdlib/strlcat.c   | 42 ++++++++++++++++++++++++++++++++++++++++++
+ 4 files changed, 49 insertions(+), 1 deletion(-)
  create mode 100644 stdlib/strlcat.c
 
 diff --git a/Makefile.in b/Makefile.in
-index b85ebee..045fabe 100644
+index fcf33ab..d91f7ab 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -104,7 +104,7 @@ PROGOBJ = $(NASM) $(NDISASM)
- PROGS   = nasm$(X) ndisasm$(X)
- 
- LIBOBJ_NW = stdlib/snprintf.$(O) stdlib/vsnprintf.$(O) stdlib/strlcpy.$(O) \
+@@ -174,7 +174,7 @@ LIBOBJ_W = \
+ # files to LIBOBJ_W, notably $(OUTPUTOBJ)
+ LIBOBJ_NW = \
+ 	stdlib/snprintf.$(O) stdlib/vsnprintf.$(O) stdlib/strlcpy.$(O) \
 -	stdlib/strnlen.$(O) stdlib/strrchrnul.$(O) \
 +	stdlib/strnlen.$(O) stdlib/strrchrnul.$(O) stdlib/strlcat.$(O) \
  	\
- 	nasmlib/ver.$(O) \
- 	nasmlib/alloc.$(O) nasmlib/asprintf.$(O) nasmlib/errfile.$(O) \
+ 	asm/directbl.$(O) \
+ 	asm/pptok.$(O) \
 diff --git a/configure.ac b/configure.ac
-index 42cd198..e206338 100644
+index 448eeb2..f79c96c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -236,6 +236,7 @@ PA_FUNC_SNPRINTF
+@@ -229,6 +229,7 @@ PA_FUNC_SNPRINTF
  PA_FUNC_VSNPRINTF
  AC_CHECK_FUNCS([strlcpy])
  AC_CHECK_FUNCS([strrchrnul])
 +AC_CHECK_FUNCS([strlcat])
  
  dnl These types are POSIX-specific, and Windows does it differently...
- AC_CHECK_TYPES([struct _stati64])
-@@ -255,6 +256,7 @@ AC_CHECK_DECLS(strsep)
+ AC_CHECK_TYPES([struct stat], [AC_CHECK_FUNCS([stat fstat])])
+@@ -246,6 +247,7 @@ AC_CHECK_DECLS(strsep)
  AC_CHECK_DECLS(strlcpy)
  AC_CHECK_DECLS(strnlen)
  AC_CHECK_DECLS(strrchrnul)
 +AC_CHECK_DECLS(strlcat)
  
  dnl Check for missing types
- AC_TYPE_UINTPTR_T
+ AC_TYPE_UINTMAX_T
 diff --git a/include/compiler.h b/include/compiler.h
-index 407c160..b64da6a 100644
+index 0ecd4e8..41c1cbf 100644
 --- a/include/compiler.h
 +++ b/include/compiler.h
-@@ -169,6 +169,10 @@ size_t strlcpy(char *, const char *, size_t);
- char *strrchrnul(const char *, int);
+@@ -181,6 +181,10 @@ size_t strlcpy(char *, const char *, size_t);
+ char * pure_func strrchrnul(const char *, int);
  #endif
  
 +#if !defined(HAVE_STRLCAT) || !HAVE_DECL_STRLCAT
 +size_t strlcat(char *, const char *, size_t);
 +#endif
 +
- #ifndef __cplusplus		/* C++ has false, true, bool as keywords */
+ #if !defined(__cplusplus) || (__STDC_VERSION >= 202311L)
+ /* C++ and C23 have bool, false, and true as proper keywords */
  # ifdef HAVE_STDBOOL_H
- #  include <stdbool.h>
 diff --git a/stdlib/strlcat.c b/stdlib/strlcat.c
 new file mode 100644
-index 0000000..7084d46
+index 0000000..c7cbd59
 --- /dev/null
 +++ b/stdlib/strlcat.c
-@@ -0,0 +1,43 @@
+@@ -0,0 +1,42 @@
 +/*
 + * Copyright (c) 2019 Garmin Ltd. or its subsidiaries
 + *
@@ -112,4 +112,3 @@ index 0000000..7084d46
 +}
 +
 +#endif
-+
diff --git a/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch b/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch
index 84fcca0fe1..f5b67fe3bb 100644
--- a/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch
+++ b/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch
@@ -1,4 +1,4 @@
-From e28c8883050d34d18ee2d66dfeece51e13adb6d5 Mon Sep 17 00:00:00 2001
+From 10baf9f75e4e4e2fb37a579c68672141858aea5e Mon Sep 17 00:00:00 2001
 From: Joshua Watt <JPEWhacker@gmail.com>
 Date: Tue, 19 Nov 2019 13:12:17 -0600
 Subject: [PATCH] Add --debug-prefix-map option
@@ -9,11 +9,10 @@ be built in a reproducible manner regardless of the build directory.
 
 Upstream-Status: Submitted [https://bugzilla.nasm.us/show_bug.cgi?id=3392635]
 Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
-
 ---
- asm/nasm.c              | 24 ++++++++++++++++++++++++
+ asm/nasm.c              | 28 ++++++++++++++++++++++++++--
  include/nasmlib.h       |  9 +++++++++
- nasm.txt                |  4 ++++
+ nasm.txt                |  3 +++
  nasmlib/filename.c      | 20 ++++++++++++++++++++
  output/outas86.c        |  4 +++-
  output/outcoff.c        |  4 ++--
@@ -21,32 +20,34 @@ Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
  output/outieee.c        |  2 +-
  output/outobj.c         |  2 +-
  stdlib/strlcat.c        |  2 +-
- test/elfdebugprefix.asm |  6 ++++++
+ test/elfdebugprefix.asm |  5 +++++
  test/performtest.pl     | 12 ++++++++++--
- 12 files changed, 89 insertions(+), 13 deletions(-)
+ 12 files changed, 89 insertions(+), 15 deletions(-)
  create mode 100644 test/elfdebugprefix.asm
 
 diff --git a/asm/nasm.c b/asm/nasm.c
-index 76c70f6..08ff119 100644
+index 49fa00e..ff117cf 100644
 --- a/asm/nasm.c
 +++ b/asm/nasm.c
-@@ -939,6 +939,7 @@ enum text_options {
-     OPT_KEEP_ALL,
-     OPT_NO_LINE,
+@@ -913,7 +913,8 @@ enum text_options {
      OPT_DEBUG,
-+    OPT_DEBUG_PREFIX_MAP,
-     OPT_REPRODUCIBLE
+     OPT_INFO,
+     OPT_REPRODUCIBLE,
+-    OPT_BITS
++    OPT_BITS,
++    OPT_DEBUG_PREFIX_MAP
  };
  enum need_arg {
-@@ -971,6 +972,7 @@ static const struct textargs textopts[] = {
-     {"keep-all", OPT_KEEP_ALL, ARG_NO, 0},
-     {"no-line",  OPT_NO_LINE, ARG_NO, 0},
+     ARG_NO,
+@@ -952,6 +953,7 @@ static const struct textargs textopts[] = {
      {"debug",    OPT_DEBUG, ARG_MAYBE, 0},
-+    {"debug-prefix-map", OPT_DEBUG_PREFIX_MAP, true, 0},
      {"reproducible", OPT_REPRODUCIBLE, ARG_NO, 0},
+     {"bits",     OPT_BITS, ARG_YES, 0},
++    {"debug-prefix-map", OPT_DEBUG_PREFIX_MAP, true, 0},
      {NULL, OPT_BOGUS, ARG_NO, 0}
  };
-@@ -1335,6 +1337,26 @@ static bool process_arg(char *p, char *q, int pass)
+ 
+@@ -1337,6 +1339,26 @@ static bool process_arg(char *p, char *q, int pass)
                  case OPT_REPRODUCIBLE:
                      reproducible = true;
                      break;
@@ -71,22 +72,24 @@ index 76c70f6..08ff119 100644
 +                    }
 +                    break;
                  case OPT_HELP:
-                     help(stdout);
-                     exit(0);
-@@ -2298,6 +2320,8 @@ static void help(FILE *out)
-         "    -w-x          disable warning x (also -Wno-x)\n"
-         "    -w[+-]error   promote all warnings to errors (also -Werror)\n"
-         "    -w[+-]error=x promote warning x to errors (also -Werror=x)\n"
-+        "   --debug-prefix-map base=dest\n"
-+        "                  remap paths starting with 'base' to 'dest' in output files\n"
-         , out);
- 
-     fprintf(out, "       %-20s %s\n",
+                     /* Allow --help topic without *requiring* topic */
+                     if (!param)
+@@ -2428,7 +2450,9 @@ static void help(FILE *out, const char *what)
+                 "    -w+x           enable warning x %s(also -Wx)\n"
+                 "    -w-x           disable warning x (also -Wno-x)\n"
+                 "    -w[+-]error    promote all warnings to errors (also -Werror)\n"
+-                "    -w[+-]error=x  promote warning x to errors (also -Werror=x)\n",
++                "    -w[+-]error=x  promote warning x to errors (also -Werror=x)\n"
++                "   --debug-prefix-map base=dest\n"
++                "                  remap paths starting with 'base' to 'dest' in output files\n",
+                 SEE("-w"));
+     }
+     if (help_is(with, 'w')) {
 diff --git a/include/nasmlib.h b/include/nasmlib.h
-index 87a7fc6..a3e5144 100644
+index ed4222b..aafbf00 100644
 --- a/include/nasmlib.h
 +++ b/include/nasmlib.h
-@@ -250,10 +250,19 @@ int64_t readstrnum(char *str, int length, bool *warn);
+@@ -334,10 +334,19 @@ static inline const char *nasm_digit_chars(bool ucase)
   */
  int32_t seg_alloc(void);
  
@@ -107,25 +110,24 @@ index 87a7fc6..a3e5144 100644
  /*
   * Utility macros...
 diff --git a/nasm.txt b/nasm.txt
-index 950c361..784618c 100644
+index 950c361..8447409 100644
 --- a/nasm.txt
 +++ b/nasm.txt
-@@ -147,6 +147,10 @@ OPTIONS
+@@ -146,6 +146,9 @@ OPTIONS
+ --postfix::
  	Prepend or append (respectively) the given argument to all global or
  	extern variables.
- 
 +--debug-prefix-map 'BASE=DEST'::
 +    Map file names beginning with 'BASE' to 'DEST' when encoding them in
 +    output object files.
-+
+ 
  SYNTAX
  ------
- This man page does not fully describe the syntax of *nasm*'s assembly language,
 diff --git a/nasmlib/filename.c b/nasmlib/filename.c
-index 172ae0b..fda2be4 100644
+index 2c29d38..0e27f69 100644
 --- a/nasmlib/filename.c
 +++ b/nasmlib/filename.c
-@@ -39,6 +39,8 @@
+@@ -9,6 +9,8 @@
  #include "nasmlib.h"
  #include "error.h"
  
@@ -134,7 +136,7 @@ index 172ae0b..fda2be4 100644
  /*
   * Add/modify a filename extension, assumed to be a period-delimited
   * field at the very end of the filename.  Returns a newly allocated
-@@ -61,3 +63,21 @@ const char *filename_set_extension(const char *inname, const char *extension)
+@@ -31,3 +33,21 @@ const char *filename_set_extension(const char *inname, const char *extension)
  
      return p;
  }
@@ -156,11 +158,12 @@ index 172ae0b..fda2be4 100644
 +    strlcpy(dest, in, len);
 +    return dest;
 +}
+\ No newline at end of file
 diff --git a/output/outas86.c b/output/outas86.c
-index 54b22f8..c4a412c 100644
+index 0640af7..c654bbe 100644
 --- a/output/outas86.c
 +++ b/output/outas86.c
-@@ -110,6 +110,8 @@ static void as86_sect_write(struct Section *, const uint8_t *,
+@@ -80,6 +80,8 @@ static void as86_sect_write(struct Section *, const uint8_t *,
  
  static void as86_init(void)
  {
@@ -169,7 +172,7 @@ index 54b22f8..c4a412c 100644
      stext.data = saa_init(1L);
      stext.datalen = 0L;
      stext.head = stext.last = NULL;
-@@ -131,7 +133,7 @@ static void as86_init(void)
+@@ -101,7 +103,7 @@ static void as86_init(void)
      strslen = 0;
  
      /* as86 module name = input file minus extension */
@@ -179,10 +182,10 @@ index 54b22f8..c4a412c 100644
  
  static void as86_cleanup(void)
 diff --git a/output/outcoff.c b/output/outcoff.c
-index c2b4eb6..e242db2 100644
+index d38085d..b490bb6 100644
 --- a/output/outcoff.c
 +++ b/output/outcoff.c
-@@ -1259,7 +1259,7 @@ static void coff_symbol(char *name, int32_t strpos, int32_t value,
+@@ -1231,7 +1231,7 @@ static void coff_symbol(char *name, int32_t strpos, int32_t value,
  
  static void coff_write_symbols(void)
  {
@@ -191,7 +194,7 @@ index c2b4eb6..e242db2 100644
      uint32_t i;
  
      /*
-@@ -1269,7 +1269,7 @@ static void coff_write_symbols(void)
+@@ -1241,7 +1241,7 @@ static void coff_write_symbols(void)
      if (reproducible)
          memset(filename, 0, 18);
      else
@@ -201,10 +204,10 @@ index c2b4eb6..e242db2 100644
  
      /*
 diff --git a/output/outelf.c b/output/outelf.c
-index ad8d210..29f1dc1 100644
+index 7288dda..9847c6e 100644
 --- a/output/outelf.c
 +++ b/output/outelf.c
-@@ -546,8 +546,8 @@ static void elf_init(void)
+@@ -516,8 +516,8 @@ static void elf_init(void)
      const char * const *p;
      const char * cur_path = nasm_realpath(inname);
  
@@ -215,7 +218,7 @@ index ad8d210..29f1dc1 100644
      sects = NULL;
      nsects = sectlen = 0;
      syms = saa_init((int32_t)sizeof(struct elf_symbol));
-@@ -3590,13 +3590,17 @@ static void dwarf_findfile(const char * fname)
+@@ -3551,13 +3551,17 @@ static void dwarf_findfile(const char * fname)
      if (dwarf_clist && !(strcmp(fname, dwarf_clist->filename)))
          return;
  
@@ -234,7 +237,7 @@ index ad8d210..29f1dc1 100644
                  return;
              }
              match = match->next;
-@@ -3607,8 +3611,7 @@ static void dwarf_findfile(const char * fname)
+@@ -3568,8 +3572,7 @@ static void dwarf_findfile(const char * fname)
      dwarf_clist = nasm_malloc(sizeof(struct linelist));
      dwarf_numfiles++;
      dwarf_clist->line = dwarf_numfiles;
@@ -245,10 +248,10 @@ index ad8d210..29f1dc1 100644
      if (!dwarf_flist) {     /* if first entry */
          dwarf_flist = dwarf_elist = dwarf_clist;
 diff --git a/output/outieee.c b/output/outieee.c
-index 7ba9036..796e5af 100644
+index 9e26cec..3643eeb 100644
 --- a/output/outieee.c
 +++ b/output/outieee.c
-@@ -207,7 +207,7 @@ static void ieee_unqualified_name(char *, char *);
+@@ -178,7 +178,7 @@ static void ieee_unqualified_name(char *, char *);
   */
  static void ieee_init(void)
  {
@@ -258,10 +261,10 @@ index 7ba9036..796e5af 100644
      fpubhead = NULL;
      fpubtail = &fpubhead;
 diff --git a/output/outobj.c b/output/outobj.c
-index 281839d..fc336c1 100644
+index 685c593..e3eb34a 100644
 --- a/output/outobj.c
 +++ b/output/outobj.c
-@@ -644,7 +644,7 @@ static enum directive_result obj_directive(enum directive, char *);
+@@ -656,7 +656,7 @@ static const char *get_default_class(const char *segment)
  
  static void obj_init(void)
  {
@@ -271,7 +274,7 @@ index 281839d..fc336c1 100644
      any_segs = false;
      fpubhead = NULL;
 diff --git a/stdlib/strlcat.c b/stdlib/strlcat.c
-index 7084d46..ee93dea 100644
+index c7cbd59..92a873d 100644
 --- a/stdlib/strlcat.c
 +++ b/stdlib/strlcat.c
 @@ -29,7 +29,7 @@ size_t strlcat(char *dest, const char *src, size_t size)
@@ -285,16 +288,15 @@ index 7084d46..ee93dea 100644
      /* destination was not NULL terminated. Return the initial size */
 diff --git a/test/elfdebugprefix.asm b/test/elfdebugprefix.asm
 new file mode 100644
-index 0000000..a67ba29
+index 0000000..bf845ce
 --- /dev/null
 +++ b/test/elfdebugprefix.asm
-@@ -0,0 +1,6 @@
+@@ -0,0 +1,5 @@
 +;Testname=unoptimized; Arguments=-O0 --debug-prefix-map elf=ELF -felf -oelfdebugprefix.o; Files=stdout stderr elfdebugprefix.o; Validate=readelf --wide --symbols elfdebugprefix.o | grep 'FILE.*ELFdebugprefix.asm'
 +
 +	  SECTION .text
 +test:			; [1]
 +	  ret
-+
 diff --git a/test/performtest.pl b/test/performtest.pl
 index 46b1bdf..2426848 100755
 --- a/test/performtest.pl
diff --git a/meta/recipes-devtools/nasm/nasm_2.16.03.bb b/meta/recipes-devtools/nasm/nasm_3.01.bb
similarity index 78%
rename from meta/recipes-devtools/nasm/nasm_2.16.03.bb
rename to meta/recipes-devtools/nasm/nasm_3.01.bb
index 281f3940e7..4f4b47d665 100644
--- a/meta/recipes-devtools/nasm/nasm_2.16.03.bb
+++ b/meta/recipes-devtools/nasm/nasm_3.01.bb
@@ -3,14 +3,14 @@ SECTION = "devel"
 HOMEPAGE = "http://www.nasm.us/"
 DESCRIPTION = "The Netwide Assembler (NASM) is an assembler and disassembler for the Intel x86 architecture."
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=90904486f8fbf1861cf42752e1a39efe"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6178dc4f5355e40552448080e67a214b"
 
 SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
            file://0001-stdlib-Add-strlcat.patch \
            file://0002-Add-debug-prefix-map-option.patch \
            "
 
-SRC_URI[sha256sum] = "bef3de159bcd61adf98bb7cc87ee9046e944644ad76b7633f18ab063edb29e57"
+SRC_URI[sha256sum] = "7a7b1ff3b0eef3247862f2fbe4ca605ccef770545d7af7979eba84a9d045c0b1"
 
 EXTRA_AUTORECONF:append = " -I autoconf/m4"
 


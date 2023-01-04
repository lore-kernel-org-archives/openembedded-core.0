Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5877DC5479D
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:01 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.9362.1672830357307718609
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:05:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VkGPFR+B;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id h16so32516995wrz.12
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TdFLGzMb3HnFLgzIAEvGKu8/j8Dc+5FOssMpVpnyGpA=;
        b=VkGPFR+BTAtYM1kqIWh1G4GU9we9t/KOfEf81s4LSl9gfVZ89mWCQ/rWyYFYSFSlTc
         s+/e0/zltEiSTA90fcO4yu2Wj6QPOXmK3QLN4j05WfjGK5xjM0kvAYPVM6qbrEbJWHwu
         lzcUaJW/k9ws7k13pTCrLO3baCaOrhH2RQ51/AlrHI9NFWRQUy5UlbM3WKUN15jMTKbO
         8g8UXlym9s1WCFSk83BSSAaYz2aSRKKZF4zdO5QvqBm2A8F+Kl8w/UJEudkLy5LJCo1O
         Jnjo/I8XaKdCKTZorL94pYN97gxSbOYi7cibktoULvBZmez++VLJL7S1whGN1I+Gms3x
         GkVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TdFLGzMb3HnFLgzIAEvGKu8/j8Dc+5FOssMpVpnyGpA=;
        b=RUBJdyWIpMrZWNzagHtK742tlcMGE6LIkncpzaV1070G/Pg5dWl304ICwrB9kAsWal
         DaCZj9hLPCvXHdAI0ymBFUZSaBYp6uypt2EcRCz4Nvugc++dUtKgTdjgx9IIBj8U8+XD
         CxsAN9n+Z7xleIvt/bUQ3X09WCBD5X5U9iat/VEPibQWaoJBFJLDcDSD0l9m3f8Mgevt
         CxhiTSUEqyZdlAI5nLCqa09VkhH3G+a9PqzGljXrQismjvXrELNU3/e0HxFbItuXTEfx
         fSY2heM/+hs27jq3jJGyDhCcKVEn0eIu4CdNTDB5wZF5hkni2HmYWCcvWf+Wk8OVnMgs
         TUow==
X-Gm-Message-State: AFqh2kpmUbeFokMPHiSxhEUCGEXFfDBlX7MkiZDCSUTTu7Cy1+Z485ZH
	IN1a+U/p+ndS+iZyZkmCZYCMgG+pSzQ=
X-Google-Smtp-Source: AMrXdXuoYvRpVQrzLKEDIc3+B5QfX90bOQ+8RlQV/gvvfUccovlMP10qdgzl5Wb0UzZaRTuaEUhnyA==
X-Received: by 2002:a5d:420f:0:b0:287:be8d:a2f with SMTP id n15-20020a5d420f000000b00287be8d0a2fmr17833571wrq.67.1672830355745;
        Wed, 04 Jan 2023 03:05:55 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:05:55 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/77] nasm: update 2.15.05 -> 2.16.01
Date: Wed,  4 Jan 2023 12:04:35 +0100
Message-Id: <20230104110548.2537259-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175389

adjust 0002-Add-debug-prefix-map-option.patch to account for
https://github.com/netwide-assembler/nasm/commit/f2a6eb4aaca361c1ebe374bf07765790eecf8869
and add a chunk to it that guarantees source paths not leaking into debug sections
that list source filenames.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../nasm/nasm/0001-stdlib-Add-strlcat.patch   | 18 ++---
 .../0002-Add-debug-prefix-map-option.patch    | 74 +++++++++++++------
 .../nasm/{nasm_2.15.05.bb => nasm_2.16.01.bb} |  2 +-
 3 files changed, 63 insertions(+), 31 deletions(-)
 rename meta/recipes-devtools/nasm/{nasm_2.15.05.bb => nasm_2.16.01.bb} (88%)

diff --git a/meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patch b/meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patch
index 0ede8a8328..1b8e947c56 100644
--- a/meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patch
+++ b/meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patch
@@ -1,4 +1,4 @@
-From 1c5023002bad3a5b0bbc181fdb324160beace733 Mon Sep 17 00:00:00 2001
+From 680220e772dfa381829983fa73b915416f676894 Mon Sep 17 00:00:00 2001
 From: Joshua Watt <JPEWhacker@gmail.com>
 Date: Tue, 19 Nov 2019 12:47:30 -0600
 Subject: [PATCH] stdlib: Add strlcat
@@ -17,23 +17,23 @@ Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
  create mode 100644 stdlib/strlcat.c
 
 diff --git a/Makefile.in b/Makefile.in
-index bfae1f8..156dc4c 100644
+index b85ebee..045fabe 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -101,7 +101,7 @@ NASM =	asm/nasm.$(O)
- NDISASM = disasm/ndisasm.$(O)
+@@ -104,7 +104,7 @@ PROGOBJ = $(NASM) $(NDISASM)
+ PROGS   = nasm$(X) ndisasm$(X)
  
- LIBOBJ = stdlib/snprintf.$(O) stdlib/vsnprintf.$(O) stdlib/strlcpy.$(O) \
+ LIBOBJ_NW = stdlib/snprintf.$(O) stdlib/vsnprintf.$(O) stdlib/strlcpy.$(O) \
 -	stdlib/strnlen.$(O) stdlib/strrchrnul.$(O) \
 +	stdlib/strnlen.$(O) stdlib/strrchrnul.$(O) stdlib/strlcat.$(O) \
  	\
  	nasmlib/ver.$(O) \
  	nasmlib/alloc.$(O) nasmlib/asprintf.$(O) nasmlib/errfile.$(O) \
 diff --git a/configure.ac b/configure.ac
-index 7b72769..14fd033 100644
+index 42cd198..e206338 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -234,6 +234,7 @@ PA_FUNC_SNPRINTF
+@@ -236,6 +236,7 @@ PA_FUNC_SNPRINTF
  PA_FUNC_VSNPRINTF
  AC_CHECK_FUNCS([strlcpy])
  AC_CHECK_FUNCS([strrchrnul])
@@ -41,7 +41,7 @@ index 7b72769..14fd033 100644
  
  dnl These types are POSIX-specific, and Windows does it differently...
  AC_CHECK_TYPES([struct _stati64])
-@@ -253,6 +254,7 @@ AC_CHECK_DECLS(strsep)
+@@ -255,6 +256,7 @@ AC_CHECK_DECLS(strsep)
  AC_CHECK_DECLS(strlcpy)
  AC_CHECK_DECLS(strnlen)
  AC_CHECK_DECLS(strrchrnul)
@@ -50,7 +50,7 @@ index 7b72769..14fd033 100644
  dnl Check for missing types
  AC_TYPE_UINTPTR_T
 diff --git a/include/compiler.h b/include/compiler.h
-index b4fd3a8..7fb4821 100644
+index 407c160..b64da6a 100644
 --- a/include/compiler.h
 +++ b/include/compiler.h
 @@ -169,6 +169,10 @@ size_t strlcpy(char *, const char *, size_t);
diff --git a/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch b/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch
index 9f4c8dc0bd..84fcca0fe1 100644
--- a/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch
+++ b/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch
@@ -1,4 +1,4 @@
-From 81d6519499dcfebe7d21e65e002a8885a4e8d852 Mon Sep 17 00:00:00 2001
+From e28c8883050d34d18ee2d66dfeece51e13adb6d5 Mon Sep 17 00:00:00 2001
 From: Joshua Watt <JPEWhacker@gmail.com>
 Date: Tue, 19 Nov 2019 13:12:17 -0600
 Subject: [PATCH] Add --debug-prefix-map option
@@ -17,17 +17,17 @@ Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
  nasmlib/filename.c      | 20 ++++++++++++++++++++
  output/outas86.c        |  4 +++-
  output/outcoff.c        |  4 ++--
- output/outelf.c         |  2 +-
+ output/outelf.c         | 13 ++++++++-----
  output/outieee.c        |  2 +-
  output/outobj.c         |  2 +-
  stdlib/strlcat.c        |  2 +-
  test/elfdebugprefix.asm |  6 ++++++
  test/performtest.pl     | 12 ++++++++++--
- 12 files changed, 82 insertions(+), 9 deletions(-)
+ 12 files changed, 89 insertions(+), 13 deletions(-)
  create mode 100644 test/elfdebugprefix.asm
 
 diff --git a/asm/nasm.c b/asm/nasm.c
-index e5ae89a..7a7f8b4 100644
+index 76c70f6..08ff119 100644
 --- a/asm/nasm.c
 +++ b/asm/nasm.c
 @@ -939,6 +939,7 @@ enum text_options {
@@ -46,7 +46,7 @@ index e5ae89a..7a7f8b4 100644
      {"reproducible", OPT_REPRODUCIBLE, ARG_NO, 0},
      {NULL, OPT_BOGUS, ARG_NO, 0}
  };
-@@ -1337,6 +1339,26 @@ static bool process_arg(char *p, char *q, int pass)
+@@ -1335,6 +1337,26 @@ static bool process_arg(char *p, char *q, int pass)
                  case OPT_REPRODUCIBLE:
                      reproducible = true;
                      break;
@@ -73,7 +73,7 @@ index e5ae89a..7a7f8b4 100644
                  case OPT_HELP:
                      help(stdout);
                      exit(0);
-@@ -2304,6 +2326,8 @@ static void help(FILE *out)
+@@ -2298,6 +2320,8 @@ static void help(FILE *out)
          "    -w-x          disable warning x (also -Wno-x)\n"
          "    -w[+-]error   promote all warnings to errors (also -Werror)\n"
          "    -w[+-]error=x promote warning x to errors (also -Werror=x)\n"
@@ -83,7 +83,7 @@ index e5ae89a..7a7f8b4 100644
  
      fprintf(out, "       %-20s %s\n",
 diff --git a/include/nasmlib.h b/include/nasmlib.h
-index 438178d..4c3e90d 100644
+index 87a7fc6..a3e5144 100644
 --- a/include/nasmlib.h
 +++ b/include/nasmlib.h
 @@ -250,10 +250,19 @@ int64_t readstrnum(char *str, int length, bool *warn);
@@ -107,7 +107,7 @@ index 438178d..4c3e90d 100644
  /*
   * Utility macros...
 diff --git a/nasm.txt b/nasm.txt
-index cc7fa27..d3485c9 100644
+index 950c361..784618c 100644
 --- a/nasm.txt
 +++ b/nasm.txt
 @@ -147,6 +147,10 @@ OPTIONS
@@ -179,10 +179,10 @@ index 54b22f8..c4a412c 100644
  
  static void as86_cleanup(void)
 diff --git a/output/outcoff.c b/output/outcoff.c
-index 58fa024..14baf7b 100644
+index c2b4eb6..e242db2 100644
 --- a/output/outcoff.c
 +++ b/output/outcoff.c
-@@ -1072,14 +1072,14 @@ static void coff_symbol(char *name, int32_t strpos, int32_t value,
+@@ -1259,7 +1259,7 @@ static void coff_symbol(char *name, int32_t strpos, int32_t value,
  
  static void coff_write_symbols(void)
  {
@@ -191,29 +191,61 @@ index 58fa024..14baf7b 100644
      uint32_t i;
  
      /*
-      * The `.file' record, and the file name auxiliary record.
-      */
-     coff_symbol(".file", 0L, 0L, -2, 0, 0x67, 1);
--    strncpy(filename, inname, 18);
-+    filename_debug_remap(filename, inname, 19);
+@@ -1269,7 +1269,7 @@ static void coff_write_symbols(void)
+     if (reproducible)
+         memset(filename, 0, 18);
+     else
+-        strncpy(filename, inname, 18);
++        filename_debug_remap(filename, inname, 19);
      nasm_write(filename, 18, ofile);
  
      /*
 diff --git a/output/outelf.c b/output/outelf.c
-index 61af020..1292958 100644
+index ad8d210..29f1dc1 100644
 --- a/output/outelf.c
 +++ b/output/outelf.c
-@@ -553,7 +553,7 @@ static void elf_init(void)
-     };
+@@ -546,8 +546,8 @@ static void elf_init(void)
      const char * const *p;
+     const char * cur_path = nasm_realpath(inname);
  
 -    strlcpy(elf_module, inname, sizeof(elf_module));
+-    strlcpy(elf_dir, nasm_dirname(cur_path), sizeof(elf_dir));
 +    filename_debug_remap(elf_module, inname, sizeof(elf_module));
++    filename_debug_remap(elf_dir, nasm_dirname(cur_path), sizeof(elf_dir));
      sects = NULL;
      nsects = sectlen = 0;
      syms = saa_init((int32_t)sizeof(struct elf_symbol));
+@@ -3590,13 +3590,17 @@ static void dwarf_findfile(const char * fname)
+     if (dwarf_clist && !(strcmp(fname, dwarf_clist->filename)))
+         return;
+ 
++    char * fname_remapped = nasm_malloc(FILENAME_MAX);
++    filename_debug_remap(fname_remapped,fname,FILENAME_MAX);
++
+     /* search for match */
+     match = 0;
+     if (dwarf_flist) {
+         match = dwarf_flist;
+         for (finx = 0; finx < dwarf_numfiles; finx++) {
+-            if (!(strcmp(fname, match->filename))) {
++            if (!(strcmp(fname_remapped, match->filename))) {
+                 dwarf_clist = match;
++                nasm_free(fname_remapped);
+                 return;
+             }
+             match = match->next;
+@@ -3607,8 +3611,7 @@ static void dwarf_findfile(const char * fname)
+     dwarf_clist = nasm_malloc(sizeof(struct linelist));
+     dwarf_numfiles++;
+     dwarf_clist->line = dwarf_numfiles;
+-    dwarf_clist->filename = nasm_malloc(strlen(fname) + 1);
+-    strcpy(dwarf_clist->filename,fname);
++    dwarf_clist->filename = fname_remapped;
+     dwarf_clist->next = 0;
+     if (!dwarf_flist) {     /* if first entry */
+         dwarf_flist = dwarf_elist = dwarf_clist;
 diff --git a/output/outieee.c b/output/outieee.c
-index 6d6d4b2..cdb8333 100644
+index 7ba9036..796e5af 100644
 --- a/output/outieee.c
 +++ b/output/outieee.c
 @@ -207,7 +207,7 @@ static void ieee_unqualified_name(char *, char *);
@@ -226,7 +258,7 @@ index 6d6d4b2..cdb8333 100644
      fpubhead = NULL;
      fpubtail = &fpubhead;
 diff --git a/output/outobj.c b/output/outobj.c
-index 56b43f9..fefea94 100644
+index 281839d..fc336c1 100644
 --- a/output/outobj.c
 +++ b/output/outobj.c
 @@ -644,7 +644,7 @@ static enum directive_result obj_directive(enum directive, char *);
@@ -264,7 +296,7 @@ index 0000000..a67ba29
 +	  ret
 +
 diff --git a/test/performtest.pl b/test/performtest.pl
-index f7865b3..096f960 100755
+index 46b1bdf..2426848 100755
 --- a/test/performtest.pl
 +++ b/test/performtest.pl
 @@ -42,14 +42,22 @@ sub perform {
diff --git a/meta/recipes-devtools/nasm/nasm_2.15.05.bb b/meta/recipes-devtools/nasm/nasm_2.16.01.bb
similarity index 88%
rename from meta/recipes-devtools/nasm/nasm_2.15.05.bb
rename to meta/recipes-devtools/nasm/nasm_2.16.01.bb
index edc17aeebf..219cc49360 100644
--- a/meta/recipes-devtools/nasm/nasm_2.15.05.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.16.01.bb
@@ -10,7 +10,7 @@ SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
            file://0002-Add-debug-prefix-map-option.patch \
            "
 
-SRC_URI[sha256sum] = "3c4b8339e5ab54b1bcb2316101f8985a5da50a3f9e504d43fa6f35668bee2fd0"
+SRC_URI[sha256sum] = "35b6ad2ee048d41c4779f073f3efca7762a822b7d2d4ef4e8df24cf65747bb2e"
 
 EXTRA_AUTORECONF:append = " -I autoconf/m4"
 
-- 
2.30.2



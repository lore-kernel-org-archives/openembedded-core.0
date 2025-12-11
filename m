Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD5A5D3E78A
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 03:10:29 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3.1765422623313912254
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 19:10:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mbbRRdKu;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-3f5c9275b31so248693fac.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 19:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765422622; x=1766027422; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WR/ad1YclSFKzzApqOqVUAJCDZv2Qxce2e4/C5F8l7Q=;
        b=mbbRRdKu8zFnzdtvnEy6mnPMM2r9p57ORL8mkGaZGRmdyiUgSalBdbWb2o3cK1kZqt
         fpZCSa+FqaZwycLKEfgKA3HrATqF4P3LQyiqCQvg4mvK0b+Lwp5ogvpuRVdHY9z7W3Vx
         UpKIy6ML5TREJ7lxp7f13Ie3+yKtfZoeTKbTX8hib9eODputMKVsFbXJ+aUTTXmm8cgd
         hG8Xi6vk2SUrIK6lXBQKA6V1MAbtwOo2l/ZelgJegcv9Bs1PRSzCytrmpQbs1gEI1sLm
         G1r3rXdJmWLYtutVLLC9QILE/b9BRyESPLZWtptacl61fFtWxmPHXG805bRxiawgyKkC
         DvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765422622; x=1766027422;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WR/ad1YclSFKzzApqOqVUAJCDZv2Qxce2e4/C5F8l7Q=;
        b=Q96+QeJlJ/gPufEbKpKDm2FjbCetVgkym+u/XPorzp1PJjFoe4PVFcM6Z1evXNUvqk
         az7HxZ4wO4U+7FxO6CjHQxw8IJoNWsJ7B+gWBZkiAVXSjO0DQ7sZOSpkM0PG0iyns0tm
         TQoMCfnfHxkz49EU5L8NU5YJuhqovJFokRi6Ji66PxTMFuOgBC0ErnihwfYLgXxNVnkd
         CWkiqI6Kv4eEVYTG4rBybWDlAmlVFE23JJ30MiD53cTMDWid5sYh29jRb06rWxPTdzFv
         xjmt0s0NcpBkfWVv0ZC9h0w4yg8hHnOlMAF79lIxCQ2vHs+XZ2nZo+mND6dHD8FWDJvF
         NbvQ==
X-Gm-Message-State: AOJu0YzB6zkbeqPtMe399UFVCh8tNaCJH2Ry+PjgJQIVIpMQ0AumBrkE
	vBPG18NJ3i4krLXDqsQjsYKi+9sHN/8bqSmPJWOvAvrLjRrk9KgL+R+LCGBwHLjNErIenpa3Th4
	/ZZvrV2edYCV6JMoevXSVLxfwnIFalPc=
X-Gm-Gg: AY/fxX4XRvu1SC6AQgVQR/W9LO1ejqSQ6xZUHYi076csah7/P3JsRi5IbDM5TMhaaBz
	OgFBismpg8jNx/26ZsceTTuAIWjOdguqeXlNLBym6FKcr3bOhLQm7pO3DR/bmaw/FhtXQseQZ/h
	rjNa4B+ZsvfD/jEmTuhOn4AwG/WwryS9GLs1Z521Mo50HNv2jTiyQyBbLyEcdZlpUTXecCoen4P
	Fwh5sneENcfMcsoqZ0looFTZTF/ShU8Xxx//6LWBM07SoDwf5cpAdJu7bUpgfoVclNUeiAJvEyo
	HjvFF/R8Bf37FAkEoWrP/bopZBQ=
X-Google-Smtp-Source: AGHT+IHOF3+Oti2303p5Wvonqif/PQ9Xs8K4syBO8VDvIEbozfH3mO6D4qMhgfTF1W1lgsiP9pycKNqBiu4gJTu0Ffs=
X-Received: by 2002:a05:6870:2489:b0:3ec:4657:83d2 with SMTP id
 586e51a60fabf-3f5bd95b0e5mr2819316fac.4.1765422622259; Wed, 10 Dec 2025
 19:10:22 -0800 (PST)
MIME-Version: 1.0
References: <20251126034801.1997488-1-ankur.tyagi85@gmail.com> <CAMKF1so2MHdvOJsn_mF2Gb_yBzPoWq4qwi6-F2Qx1HJmQPM+Sw@mail.gmail.com>
In-Reply-To: <CAMKF1so2MHdvOJsn_mF2Gb_yBzPoWq4qwi6-F2Qx1HJmQPM+Sw@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 11 Dec 2025 08:40:09 +0530
X-Gm-Features: AQt7F2qg7CtGsHAajFOaySEjzL3_C2DTbuAdwpgLxig9w4ima6A0LZte1aAa3zY
Message-ID: <CADySD0Gpq1fNQuZfNgiW=uRg5m2PciRotW6cV99hiFKGxUXvaQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3 1/2] nasm: upgrade 2.16.03 -> 3.01
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000473fe00645a47c27"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 03:10:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227510

--000000000000473fe00645a47c27
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I see you have sent aom fix as well, thank you.

On Wed, Dec 10, 2025, 11:37 PM Khem Raj <raj.khem@gmail.com> wrote:

> there is aom recipe in meta-openembedded which now fails to build with
> this version
>
> -- The ASM_NASM compiler identification is NASM
>    -- Found assembler:
> /home/kraj200/yoe/build/tmp/work/x86-64-v3-yoe-linux/aom/3.12.1/recipe-sy=
sroot-native/usr/bin/nasm
>    CMake Error at build/cmake/aom_optimization.cmake:219 (message):
>      Unsupported nasm: multipass optimization not supported.
>    Call Stack (most recent call first):
>      build/cmake/aom_configure.cmake:172 (test_nasm)
>      CMakeLists.txt:69 (include)
>
> On Tue, Nov 25, 2025 at 7:48=E2=80=AFPM Ankur Tyagi via lists.openembedde=
d.org
> <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>
>> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>>
>> License-Update: Copyright year updated to 2025 and upstream replaced
>> verbose copyright headers with SPDX tags
>>
>> Refreshed patches for the new version.
>>
>> Release Note:
>> https://www.nasm.us/docs/3.01/nasmac.html
>>
>> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
>> ---
>> Changes in v3:
>> - no change
>> Changes in v2:
>> - updated license checksum
>> ---
>>  .../nasm/nasm/0001-stdlib-Add-strlcat.patch   |  43 ++++---
>>  .../0002-Add-debug-prefix-map-option.patch    | 114 +++++++++---------
>>  .../nasm/{nasm_2.16.03.bb =3D> nasm_3.01.bb}    |   4 +-
>>  3 files changed, 81 insertions(+), 80 deletions(-)
>>  rename meta/recipes-devtools/nasm/{nasm_2.16.03.bb =3D> nasm_3.01.bb}
>> (78%)
>>
>> diff --git
>> a/meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patch
>> b/meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patch
>> index 1b8e947c56..9d74742072 100644
>> --- a/meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patch
>> +++ b/meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patch
>> @@ -12,64 +12,64 @@ Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>>   Makefile.in        |  2 +-
>>   configure.ac       |  2 ++
>>   include/compiler.h |  4 ++++
>> - stdlib/strlcat.c   | 43 +++++++++++++++++++++++++++++++++++++++++++
>> - 4 files changed, 50 insertions(+), 1 deletion(-)
>> + stdlib/strlcat.c   | 42 ++++++++++++++++++++++++++++++++++++++++++
>> + 4 files changed, 49 insertions(+), 1 deletion(-)
>>   create mode 100644 stdlib/strlcat.c
>>
>>  diff --git a/Makefile.in b/Makefile.in
>> -index b85ebee..045fabe 100644
>> +index fcf33ab..d91f7ab 100644
>>  --- a/Makefile.in
>>  +++ b/Makefile.in
>> -@@ -104,7 +104,7 @@ PROGOBJ =3D $(NASM) $(NDISASM)
>> - PROGS   =3D nasm$(X) ndisasm$(X)
>> -
>> - LIBOBJ_NW =3D stdlib/snprintf.$(O) stdlib/vsnprintf.$(O)
>> stdlib/strlcpy.$(O) \
>> +@@ -174,7 +174,7 @@ LIBOBJ_W =3D \
>> + # files to LIBOBJ_W, notably $(OUTPUTOBJ)
>> + LIBOBJ_NW =3D \
>> +       stdlib/snprintf.$(O) stdlib/vsnprintf.$(O) stdlib/strlcpy.$(O) \
>>  -      stdlib/strnlen.$(O) stdlib/strrchrnul.$(O) \
>>  +      stdlib/strnlen.$(O) stdlib/strrchrnul.$(O) stdlib/strlcat.$(O) \
>>         \
>> -       nasmlib/ver.$(O) \
>> -       nasmlib/alloc.$(O) nasmlib/asprintf.$(O) nasmlib/errfile.$(O) \
>> +       asm/directbl.$(O) \
>> +       asm/pptok.$(O) \
>>  diff --git a/configure.ac b/configure.ac
>> -index 42cd198..e206338 100644
>> +index 448eeb2..f79c96c 100644
>>  --- a/configure.ac
>>  +++ b/configure.ac
>> -@@ -236,6 +236,7 @@ PA_FUNC_SNPRINTF
>> +@@ -229,6 +229,7 @@ PA_FUNC_SNPRINTF
>>   PA_FUNC_VSNPRINTF
>>   AC_CHECK_FUNCS([strlcpy])
>>   AC_CHECK_FUNCS([strrchrnul])
>>  +AC_CHECK_FUNCS([strlcat])
>>
>>   dnl These types are POSIX-specific, and Windows does it differently...
>> - AC_CHECK_TYPES([struct _stati64])
>> -@@ -255,6 +256,7 @@ AC_CHECK_DECLS(strsep)
>> + AC_CHECK_TYPES([struct stat], [AC_CHECK_FUNCS([stat fstat])])
>> +@@ -246,6 +247,7 @@ AC_CHECK_DECLS(strsep)
>>   AC_CHECK_DECLS(strlcpy)
>>   AC_CHECK_DECLS(strnlen)
>>   AC_CHECK_DECLS(strrchrnul)
>>  +AC_CHECK_DECLS(strlcat)
>>
>>   dnl Check for missing types
>> - AC_TYPE_UINTPTR_T
>> + AC_TYPE_UINTMAX_T
>>  diff --git a/include/compiler.h b/include/compiler.h
>> -index 407c160..b64da6a 100644
>> +index 0ecd4e8..41c1cbf 100644
>>  --- a/include/compiler.h
>>  +++ b/include/compiler.h
>> -@@ -169,6 +169,10 @@ size_t strlcpy(char *, const char *, size_t);
>> - char *strrchrnul(const char *, int);
>> +@@ -181,6 +181,10 @@ size_t strlcpy(char *, const char *, size_t);
>> + char * pure_func strrchrnul(const char *, int);
>>   #endif
>>
>>  +#if !defined(HAVE_STRLCAT) || !HAVE_DECL_STRLCAT
>>  +size_t strlcat(char *, const char *, size_t);
>>  +#endif
>>  +
>> - #ifndef __cplusplus           /* C++ has false, true, bool as keywords
>> */
>> + #if !defined(__cplusplus) || (__STDC_VERSION >=3D 202311L)
>> + /* C++ and C23 have bool, false, and true as proper keywords */
>>   # ifdef HAVE_STDBOOL_H
>> - #  include <stdbool.h>
>>  diff --git a/stdlib/strlcat.c b/stdlib/strlcat.c
>>  new file mode 100644
>> -index 0000000..7084d46
>> +index 0000000..c7cbd59
>>  --- /dev/null
>>  +++ b/stdlib/strlcat.c
>> -@@ -0,0 +1,43 @@
>> +@@ -0,0 +1,42 @@
>>  +/*
>>  + * Copyright (c) 2019 Garmin Ltd. or its subsidiaries
>>  + *
>> @@ -112,4 +112,3 @@ index 0000000..7084d46
>>  +}
>>  +
>>  +#endif
>> -+
>> diff --git
>> a/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch
>> b/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch
>> index 84fcca0fe1..f5b67fe3bb 100644
>> ---
>> a/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch
>> +++
>> b/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch
>> @@ -1,4 +1,4 @@
>> -From e28c8883050d34d18ee2d66dfeece51e13adb6d5 Mon Sep 17 00:00:00 2001
>> +From 10baf9f75e4e4e2fb37a579c68672141858aea5e Mon Sep 17 00:00:00 2001
>>  From: Joshua Watt <JPEWhacker@gmail.com>
>>  Date: Tue, 19 Nov 2019 13:12:17 -0600
>>  Subject: [PATCH] Add --debug-prefix-map option
>> @@ -9,11 +9,10 @@ be built in a reproducible manner regardless of the
>> build directory.
>>
>>  Upstream-Status: Submitted [
>> https://bugzilla.nasm.us/show_bug.cgi?id=3D3392635]
>>  Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>> -
>>  ---
>> - asm/nasm.c              | 24 ++++++++++++++++++++++++
>> + asm/nasm.c              | 28 ++++++++++++++++++++++++++--
>>   include/nasmlib.h       |  9 +++++++++
>> - nasm.txt                |  4 ++++
>> + nasm.txt                |  3 +++
>>   nasmlib/filename.c      | 20 ++++++++++++++++++++
>>   output/outas86.c        |  4 +++-
>>   output/outcoff.c        |  4 ++--
>> @@ -21,32 +20,34 @@ Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>>   output/outieee.c        |  2 +-
>>   output/outobj.c         |  2 +-
>>   stdlib/strlcat.c        |  2 +-
>> - test/elfdebugprefix.asm |  6 ++++++
>> + test/elfdebugprefix.asm |  5 +++++
>>   test/performtest.pl     | 12 ++++++++++--
>> - 12 files changed, 89 insertions(+), 13 deletions(-)
>> + 12 files changed, 89 insertions(+), 15 deletions(-)
>>   create mode 100644 test/elfdebugprefix.asm
>>
>>  diff --git a/asm/nasm.c b/asm/nasm.c
>> -index 76c70f6..08ff119 100644
>> +index 49fa00e..ff117cf 100644
>>  --- a/asm/nasm.c
>>  +++ b/asm/nasm.c
>> -@@ -939,6 +939,7 @@ enum text_options {
>> -     OPT_KEEP_ALL,
>> -     OPT_NO_LINE,
>> +@@ -913,7 +913,8 @@ enum text_options {
>>       OPT_DEBUG,
>> -+    OPT_DEBUG_PREFIX_MAP,
>> -     OPT_REPRODUCIBLE
>> +     OPT_INFO,
>> +     OPT_REPRODUCIBLE,
>> +-    OPT_BITS
>> ++    OPT_BITS,
>> ++    OPT_DEBUG_PREFIX_MAP
>>   };
>>   enum need_arg {
>> -@@ -971,6 +972,7 @@ static const struct textargs textopts[] =3D {
>> -     {"keep-all", OPT_KEEP_ALL, ARG_NO, 0},
>> -     {"no-line",  OPT_NO_LINE, ARG_NO, 0},
>> +     ARG_NO,
>> +@@ -952,6 +953,7 @@ static const struct textargs textopts[] =3D {
>>       {"debug",    OPT_DEBUG, ARG_MAYBE, 0},
>> -+    {"debug-prefix-map", OPT_DEBUG_PREFIX_MAP, true, 0},
>>       {"reproducible", OPT_REPRODUCIBLE, ARG_NO, 0},
>> +     {"bits",     OPT_BITS, ARG_YES, 0},
>> ++    {"debug-prefix-map", OPT_DEBUG_PREFIX_MAP, true, 0},
>>       {NULL, OPT_BOGUS, ARG_NO, 0}
>>   };
>> -@@ -1335,6 +1337,26 @@ static bool process_arg(char *p, char *q, int
>> pass)
>> +
>> +@@ -1337,6 +1339,26 @@ static bool process_arg(char *p, char *q, int
>> pass)
>>                   case OPT_REPRODUCIBLE:
>>                       reproducible =3D true;
>>                       break;
>> @@ -71,22 +72,24 @@ index 76c70f6..08ff119 100644
>>  +                    }
>>  +                    break;
>>                   case OPT_HELP:
>> -                     help(stdout);
>> -                     exit(0);
>> -@@ -2298,6 +2320,8 @@ static void help(FILE *out)
>> -         "    -w-x          disable warning x (also -Wno-x)\n"
>> -         "    -w[+-]error   promote all warnings to errors (also
>> -Werror)\n"
>> -         "    -w[+-]error=3Dx promote warning x to errors (also
>> -Werror=3Dx)\n"
>> -+        "   --debug-prefix-map base=3Ddest\n"
>> -+        "                  remap paths starting with 'base' to 'dest'
>> in output files\n"
>> -         , out);
>> -
>> -     fprintf(out, "       %-20s %s\n",
>> +                     /* Allow --help topic without *requiring* topic */
>> +                     if (!param)
>> +@@ -2428,7 +2450,9 @@ static void help(FILE *out, const char *what)
>> +                 "    -w+x           enable warning x %s(also -Wx)\n"
>> +                 "    -w-x           disable warning x (also -Wno-x)\n"
>> +                 "    -w[+-]error    promote all warnings to errors
>> (also -Werror)\n"
>> +-                "    -w[+-]error=3Dx  promote warning x to errors (als=
o
>> -Werror=3Dx)\n",
>> ++                "    -w[+-]error=3Dx  promote warning x to errors (als=
o
>> -Werror=3Dx)\n"
>> ++                "   --debug-prefix-map base=3Ddest\n"
>> ++                "                  remap paths starting with 'base' to
>> 'dest' in output files\n",
>> +                 SEE("-w"));
>> +     }
>> +     if (help_is(with, 'w')) {
>>  diff --git a/include/nasmlib.h b/include/nasmlib.h
>> -index 87a7fc6..a3e5144 100644
>> +index ed4222b..aafbf00 100644
>>  --- a/include/nasmlib.h
>>  +++ b/include/nasmlib.h
>> -@@ -250,10 +250,19 @@ int64_t readstrnum(char *str, int length, bool
>> *warn);
>> +@@ -334,10 +334,19 @@ static inline const char *nasm_digit_chars(bool
>> ucase)
>>    */
>>   int32_t seg_alloc(void);
>>
>> @@ -107,25 +110,24 @@ index 87a7fc6..a3e5144 100644
>>   /*
>>    * Utility macros...
>>  diff --git a/nasm.txt b/nasm.txt
>> -index 950c361..784618c 100644
>> +index 950c361..8447409 100644
>>  --- a/nasm.txt
>>  +++ b/nasm.txt
>> -@@ -147,6 +147,10 @@ OPTIONS
>> +@@ -146,6 +146,9 @@ OPTIONS
>> + --postfix::
>>         Prepend or append (respectively) the given argument to all globa=
l
>> or
>>         extern variables.
>> -
>>  +--debug-prefix-map 'BASE=3DDEST'::
>>  +    Map file names beginning with 'BASE' to 'DEST' when encoding them =
in
>>  +    output object files.
>> -+
>> +
>>   SYNTAX
>>   ------
>> - This man page does not fully describe the syntax of *nasm*'s assembly
>> language,
>>  diff --git a/nasmlib/filename.c b/nasmlib/filename.c
>> -index 172ae0b..fda2be4 100644
>> +index 2c29d38..0e27f69 100644
>>  --- a/nasmlib/filename.c
>>  +++ b/nasmlib/filename.c
>> -@@ -39,6 +39,8 @@
>> +@@ -9,6 +9,8 @@
>>   #include "nasmlib.h"
>>   #include "error.h"
>>
>> @@ -134,7 +136,7 @@ index 172ae0b..fda2be4 100644
>>   /*
>>    * Add/modify a filename extension, assumed to be a period-delimited
>>    * field at the very end of the filename.  Returns a newly allocated
>> -@@ -61,3 +63,21 @@ const char *filename_set_extension(const char
>> *inname, const char *extension)
>> +@@ -31,3 +33,21 @@ const char *filename_set_extension(const char
>> *inname, const char *extension)
>>
>>       return p;
>>   }
>> @@ -156,11 +158,12 @@ index 172ae0b..fda2be4 100644
>>  +    strlcpy(dest, in, len);
>>  +    return dest;
>>  +}
>> +\ No newline at end of file
>>  diff --git a/output/outas86.c b/output/outas86.c
>> -index 54b22f8..c4a412c 100644
>> +index 0640af7..c654bbe 100644
>>  --- a/output/outas86.c
>>  +++ b/output/outas86.c
>> -@@ -110,6 +110,8 @@ static void as86_sect_write(struct Section *, const
>> uint8_t *,
>> +@@ -80,6 +80,8 @@ static void as86_sect_write(struct Section *, const
>> uint8_t *,
>>
>>   static void as86_init(void)
>>   {
>> @@ -169,7 +172,7 @@ index 54b22f8..c4a412c 100644
>>       stext.data =3D saa_init(1L);
>>       stext.datalen =3D 0L;
>>       stext.head =3D stext.last =3D NULL;
>> -@@ -131,7 +133,7 @@ static void as86_init(void)
>> +@@ -101,7 +103,7 @@ static void as86_init(void)
>>       strslen =3D 0;
>>
>>       /* as86 module name =3D input file minus extension */
>> @@ -179,10 +182,10 @@ index 54b22f8..c4a412c 100644
>>
>>   static void as86_cleanup(void)
>>  diff --git a/output/outcoff.c b/output/outcoff.c
>> -index c2b4eb6..e242db2 100644
>> +index d38085d..b490bb6 100644
>>  --- a/output/outcoff.c
>>  +++ b/output/outcoff.c
>> -@@ -1259,7 +1259,7 @@ static void coff_symbol(char *name, int32_t
>> strpos, int32_t value,
>> +@@ -1231,7 +1231,7 @@ static void coff_symbol(char *name, int32_t
>> strpos, int32_t value,
>>
>>   static void coff_write_symbols(void)
>>   {
>> @@ -191,7 +194,7 @@ index c2b4eb6..e242db2 100644
>>       uint32_t i;
>>
>>       /*
>> -@@ -1269,7 +1269,7 @@ static void coff_write_symbols(void)
>> +@@ -1241,7 +1241,7 @@ static void coff_write_symbols(void)
>>       if (reproducible)
>>           memset(filename, 0, 18);
>>       else
>> @@ -201,10 +204,10 @@ index c2b4eb6..e242db2 100644
>>
>>       /*
>>  diff --git a/output/outelf.c b/output/outelf.c
>> -index ad8d210..29f1dc1 100644
>> +index 7288dda..9847c6e 100644
>>  --- a/output/outelf.c
>>  +++ b/output/outelf.c
>> -@@ -546,8 +546,8 @@ static void elf_init(void)
>> +@@ -516,8 +516,8 @@ static void elf_init(void)
>>       const char * const *p;
>>       const char * cur_path =3D nasm_realpath(inname);
>>
>> @@ -215,7 +218,7 @@ index ad8d210..29f1dc1 100644
>>       sects =3D NULL;
>>       nsects =3D sectlen =3D 0;
>>       syms =3D saa_init((int32_t)sizeof(struct elf_symbol));
>> -@@ -3590,13 +3590,17 @@ static void dwarf_findfile(const char * fname)
>> +@@ -3551,13 +3551,17 @@ static void dwarf_findfile(const char * fname)
>>       if (dwarf_clist && !(strcmp(fname, dwarf_clist->filename)))
>>           return;
>>
>> @@ -234,7 +237,7 @@ index ad8d210..29f1dc1 100644
>>                   return;
>>               }
>>               match =3D match->next;
>> -@@ -3607,8 +3611,7 @@ static void dwarf_findfile(const char * fname)
>> +@@ -3568,8 +3572,7 @@ static void dwarf_findfile(const char * fname)
>>       dwarf_clist =3D nasm_malloc(sizeof(struct linelist));
>>       dwarf_numfiles++;
>>       dwarf_clist->line =3D dwarf_numfiles;
>> @@ -245,10 +248,10 @@ index ad8d210..29f1dc1 100644
>>       if (!dwarf_flist) {     /* if first entry */
>>           dwarf_flist =3D dwarf_elist =3D dwarf_clist;
>>  diff --git a/output/outieee.c b/output/outieee.c
>> -index 7ba9036..796e5af 100644
>> +index 9e26cec..3643eeb 100644
>>  --- a/output/outieee.c
>>  +++ b/output/outieee.c
>> -@@ -207,7 +207,7 @@ static void ieee_unqualified_name(char *, char *);
>> +@@ -178,7 +178,7 @@ static void ieee_unqualified_name(char *, char *);
>>    */
>>   static void ieee_init(void)
>>   {
>> @@ -258,10 +261,10 @@ index 7ba9036..796e5af 100644
>>       fpubhead =3D NULL;
>>       fpubtail =3D &fpubhead;
>>  diff --git a/output/outobj.c b/output/outobj.c
>> -index 281839d..fc336c1 100644
>> +index 685c593..e3eb34a 100644
>>  --- a/output/outobj.c
>>  +++ b/output/outobj.c
>> -@@ -644,7 +644,7 @@ static enum directive_result obj_directive(enum
>> directive, char *);
>> +@@ -656,7 +656,7 @@ static const char *get_default_class(const char
>> *segment)
>>
>>   static void obj_init(void)
>>   {
>> @@ -271,7 +274,7 @@ index 281839d..fc336c1 100644
>>       any_segs =3D false;
>>       fpubhead =3D NULL;
>>  diff --git a/stdlib/strlcat.c b/stdlib/strlcat.c
>> -index 7084d46..ee93dea 100644
>> +index c7cbd59..92a873d 100644
>>  --- a/stdlib/strlcat.c
>>  +++ b/stdlib/strlcat.c
>>  @@ -29,7 +29,7 @@ size_t strlcat(char *dest, const char *src, size_t
>> size)
>> @@ -285,16 +288,15 @@ index 7084d46..ee93dea 100644
>>       /* destination was not NULL terminated. Return the initial size */
>>  diff --git a/test/elfdebugprefix.asm b/test/elfdebugprefix.asm
>>  new file mode 100644
>> -index 0000000..a67ba29
>> +index 0000000..bf845ce
>>  --- /dev/null
>>  +++ b/test/elfdebugprefix.asm
>> -@@ -0,0 +1,6 @@
>> +@@ -0,0 +1,5 @@
>>  +;Testname=3Dunoptimized; Arguments=3D-O0 --debug-prefix-map elf=3DELF =
-felf
>> -oelfdebugprefix.o; Files=3Dstdout stderr elfdebugprefix.o; Validate=3Dr=
eadelf
>> --wide --symbols elfdebugprefix.o | grep 'FILE.*ELFdebugprefix.asm'
>>  +
>>  +        SECTION .text
>>  +test:                 ; [1]
>>  +        ret
>> -+
>>  diff --git a/test/performtest.pl b/test/performtest.pl
>>  index 46b1bdf..2426848 100755
>>  --- a/test/performtest.pl
>> diff --git a/meta/recipes-devtools/nasm/nasm_2.16.03.bb
>> b/meta/recipes-devtools/nasm/nasm_3.01.bb
>> similarity index 78%
>> rename from meta/recipes-devtools/nasm/nasm_2.16.03.bb
>> rename to meta/recipes-devtools/nasm/nasm_3.01.bb
>> index 281f3940e7..4f4b47d665 100644
>> --- a/meta/recipes-devtools/nasm/nasm_2.16.03.bb
>> +++ b/meta/recipes-devtools/nasm/nasm_3.01.bb
>> @@ -3,14 +3,14 @@ SECTION =3D "devel"
>>  HOMEPAGE =3D "http://www.nasm.us/"
>>  DESCRIPTION =3D "The Netwide Assembler (NASM) is an assembler and
>> disassembler for the Intel x86 architecture."
>>  LICENSE =3D "BSD-2-Clause"
>> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D90904486f8fbf1861cf42752e1a3=
9efe"
>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6178dc4f5355e40552448080e67a=
214b"
>>
>>  SRC_URI =3D "
>> http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
>>             file://0001-stdlib-Add-strlcat.patch \
>>             file://0002-Add-debug-prefix-map-option.patch \
>>             "
>>
>> -SRC_URI[sha256sum] =3D
>> "bef3de159bcd61adf98bb7cc87ee9046e944644ad76b7633f18ab063edb29e57"
>> +SRC_URI[sha256sum] =3D
>> "7a7b1ff3b0eef3247862f2fbe4ca605ccef770545d7af7979eba84a9d045c0b1"
>>
>>  EXTRA_AUTORECONF:append =3D " -I autoconf/m4"
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#226798):
>> https://lists.openembedded.org/g/openembedded-core/message/226798
>> Mute This Topic: https://lists.openembedded.org/mt/116480717/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--000000000000473fe00645a47c27
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>I see you have sent aom fix as well, thank you.<br><=
br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Dec 10, 2025, 11:37 PM Khem Raj &lt;<a href=3D"mail=
to:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><div dir=3D"ltr">there is aom recipe in meta-openembe=
dded which now fails to build with this version<div><br></div><div>-- The A=
SM_NASM compiler identification is NASM<br>=C2=A0 =C2=A0-- Found assembler:=
 /home/kraj200/yoe/build/tmp/work/x86-64-v3-yoe-linux/aom/3.12.1/recipe-sys=
root-native/usr/bin/nasm<br>=C2=A0 =C2=A0CMake Error at build/cmake/aom_opt=
imization.cmake:219 (message):<br>=C2=A0 =C2=A0 =C2=A0Unsupported nasm: mul=
tipass optimization not supported.<br>=C2=A0 =C2=A0Call Stack (most recent =
call first):<br>=C2=A0 =C2=A0 =C2=A0build/cmake/aom_configure.cmake:172 (te=
st_nasm)<br>=C2=A0 =C2=A0 =C2=A0CMakeLists.txt:69 (include)<br></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue=
, Nov 25, 2025 at 7:48=E2=80=AFPM Ankur Tyagi via <a href=3D"http://lists.o=
penembedded.org" target=3D"_blank" rel=3D"noreferrer">lists.openembedded.or=
g</a> &lt;ankur.tyagi85=3D<a href=3D"mailto:gmail.com@lists.openembedded.or=
g" target=3D"_blank" rel=3D"noreferrer">gmail.com@lists.openembedded.org</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fro=
m: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" target=3D"_bl=
ank" rel=3D"noreferrer">ankur.tyagi85@gmail.com</a>&gt;<br>
<br>
License-Update: Copyright year updated to 2025 and upstream replaced verbos=
e copyright headers with SPDX tags<br>
<br>
Refreshed patches for the new version.<br>
<br>
Release Note:<br>
<a href=3D"https://www.nasm.us/docs/3.01/nasmac.html" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">https://www.nasm.us/docs/3.01/nasmac.html</a><br=
>
<br>
Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" t=
arget=3D"_blank" rel=3D"noreferrer">ankur.tyagi85@gmail.com</a>&gt;<br>
---<br>
Changes in v3:<br>
- no change<br>
Changes in v2:<br>
- updated license checksum<br>
---<br>
=C2=A0.../nasm/nasm/0001-stdlib-Add-strlcat.patch=C2=A0 =C2=A0|=C2=A0 43 ++=
++---<br>
=C2=A0.../0002-Add-debug-prefix-map-option.patch=C2=A0 =C2=A0 | 114 +++++++=
++---------<br>
=C2=A0.../nasm/{<a href=3D"http://nasm_2.16.03.bb" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">nasm_2.16.03.bb</a> =3D&gt; <a href=3D"http://nasm_=
3.01.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">nasm_3.01.bb</a>}=
=C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A03 files changed, 81 insertions(+), 80 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/nasm/{<a href=3D"http://nasm_2.16.03.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">nasm_2.16.03.bb</a> =3D&gt=
; <a href=3D"http://nasm_3.01.bb" rel=3D"noreferrer noreferrer" target=3D"_=
blank">nasm_3.01.bb</a>} (78%)<br>
<br>
diff --git a/meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patch =
b/meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patch<br>
index 1b8e947c56..9d74742072 100644<br>
--- a/meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patch<br>
+++ b/meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patch<br>
@@ -12,64 +12,64 @@ Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWha=
cker@gmail.com" target=3D"_blank" rel=3D"noreferrer">JPEWhacker@gmail.com</=
a>&gt;<br>
=C2=A0 Makefile.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0 <a href=3D"http://configure.ac" rel=3D"noreferrer noreferrer" target=
=3D"_blank">configure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 ++<br>
=C2=A0 include/compiler.h |=C2=A0 4 ++++<br>
- stdlib/strlcat.c=C2=A0 =C2=A0| 43 +++++++++++++++++++++++++++++++++++++++=
++++<br>
- 4 files changed, 50 insertions(+), 1 deletion(-)<br>
+ stdlib/strlcat.c=C2=A0 =C2=A0| 42 +++++++++++++++++++++++++++++++++++++++=
+++<br>
+ 4 files changed, 49 insertions(+), 1 deletion(-)<br>
=C2=A0 create mode 100644 stdlib/strlcat.c<br>
<br>
=C2=A0diff --git a/Makefile.in b/Makefile.in<br>
-index b85ebee..045fabe 100644<br>
+index fcf33ab..d91f7ab 100644<br>
=C2=A0--- a/Makefile.in<br>
=C2=A0+++ b/Makefile.in<br>
-@@ -104,7 +104,7 @@ PROGOBJ =3D $(NASM) $(NDISASM)<br>
- PROGS=C2=A0 =C2=A0=3D nasm$(X) ndisasm$(X)<br>
- <br>
- LIBOBJ_NW =3D stdlib/snprintf.$(O) stdlib/vsnprintf.$(O) stdlib/strlcpy.$=
(O) \<br>
+@@ -174,7 +174,7 @@ LIBOBJ_W =3D \<br>
+ # files to LIBOBJ_W, notably $(OUTPUTOBJ)<br>
+ LIBOBJ_NW =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0stdlib/snprintf.$(O) stdlib/vsnprintf.$(O) stdl=
ib/strlcpy.$(O) \<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 stdlib/strnlen.$(O) stdlib/strrchrnul.$(O) \<br=
>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 stdlib/strnlen.$(O) stdlib/strrchrnul.$(O) stdl=
ib/strlcat.$(O) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0nasmlib/ver.$(O) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0nasmlib/alloc.$(O) nasmlib/asprintf.$(O) nasmli=
b/errfile.$(O) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0asm/directbl.$(O) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0asm/pptok.$(O) \<br>
=C2=A0diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" =
rel=3D"noreferrer noreferrer" target=3D"_blank">configure.ac</a><br>
-index 42cd198..e206338 100644<br>
+index 448eeb2..f79c96c 100644<br>
=C2=A0--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">configure.ac</a><br>
=C2=A0+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">configure.ac</a><br>
-@@ -236,6 +236,7 @@ PA_FUNC_SNPRINTF<br>
+@@ -229,6 +229,7 @@ PA_FUNC_SNPRINTF<br>
=C2=A0 PA_FUNC_VSNPRINTF<br>
=C2=A0 AC_CHECK_FUNCS([strlcpy])<br>
=C2=A0 AC_CHECK_FUNCS([strrchrnul])<br>
=C2=A0+AC_CHECK_FUNCS([strlcat])<br>
<br>
=C2=A0 dnl These types are POSIX-specific, and Windows does it differently.=
..<br>
- AC_CHECK_TYPES([struct _stati64])<br>
-@@ -255,6 +256,7 @@ AC_CHECK_DECLS(strsep)<br>
+ AC_CHECK_TYPES([struct stat], [AC_CHECK_FUNCS([stat fstat])])<br>
+@@ -246,6 +247,7 @@ AC_CHECK_DECLS(strsep)<br>
=C2=A0 AC_CHECK_DECLS(strlcpy)<br>
=C2=A0 AC_CHECK_DECLS(strnlen)<br>
=C2=A0 AC_CHECK_DECLS(strrchrnul)<br>
=C2=A0+AC_CHECK_DECLS(strlcat)<br>
<br>
=C2=A0 dnl Check for missing types<br>
- AC_TYPE_UINTPTR_T<br>
+ AC_TYPE_UINTMAX_T<br>
=C2=A0diff --git a/include/compiler.h b/include/compiler.h<br>
-index 407c160..b64da6a 100644<br>
+index 0ecd4e8..41c1cbf 100644<br>
=C2=A0--- a/include/compiler.h<br>
=C2=A0+++ b/include/compiler.h<br>
-@@ -169,6 +169,10 @@ size_t strlcpy(char *, const char *, size_t);<br>
- char *strrchrnul(const char *, int);<br>
+@@ -181,6 +181,10 @@ size_t strlcpy(char *, const char *, size_t);<br>
+ char * pure_func strrchrnul(const char *, int);<br>
=C2=A0 #endif<br>
<br>
=C2=A0+#if !defined(HAVE_STRLCAT) || !HAVE_DECL_STRLCAT<br>
=C2=A0+size_t strlcat(char *, const char *, size_t);<br>
=C2=A0+#endif<br>
=C2=A0+<br>
- #ifndef __cplusplus=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* C++ has fa=
lse, true, bool as keywords */<br>
+ #if !defined(__cplusplus) || (__STDC_VERSION &gt;=3D 202311L)<br>
+ /* C++ and C23 have bool, false, and true as proper keywords */<br>
=C2=A0 # ifdef HAVE_STDBOOL_H<br>
- #=C2=A0 include &lt;stdbool.h&gt;<br>
=C2=A0diff --git a/stdlib/strlcat.c b/stdlib/strlcat.c<br>
=C2=A0new file mode 100644<br>
-index 0000000..7084d46<br>
+index 0000000..c7cbd59<br>
=C2=A0--- /dev/null<br>
=C2=A0+++ b/stdlib/strlcat.c<br>
-@@ -0,0 +1,43 @@<br>
+@@ -0,0 +1,42 @@<br>
=C2=A0+/*<br>
=C2=A0+ * Copyright (c) 2019 Garmin Ltd. or its subsidiaries<br>
=C2=A0+ *<br>
@@ -112,4 +112,3 @@ index 0000000..7084d46<br>
=C2=A0+}<br>
=C2=A0+<br>
=C2=A0+#endif<br>
-+<br>
diff --git a/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-opti=
on.patch b/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option=
.patch<br>
index 84fcca0fe1..f5b67fe3bb 100644<br>
--- a/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patc=
h<br>
+++ b/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patc=
h<br>
@@ -1,4 +1,4 @@<br>
-From e28c8883050d34d18ee2d66dfeece51e13adb6d5 Mon Sep 17 00:00:00 2001<br>
+From 10baf9f75e4e4e2fb37a579c68672141858aea5e Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com" target=
=3D"_blank" rel=3D"noreferrer">JPEWhacker@gmail.com</a>&gt;<br>
=C2=A0Date: Tue, 19 Nov 2019 13:12:17 -0600<br>
=C2=A0Subject: [PATCH] Add --debug-prefix-map option<br>
@@ -9,11 +9,10 @@ be built in a reproducible manner regardless of the build=
 directory.<br>
<br>
=C2=A0Upstream-Status: Submitted [<a href=3D"https://bugzilla.nasm.us/show_=
bug.cgi?id=3D3392635" rel=3D"noreferrer noreferrer" target=3D"_blank">https=
://bugzilla.nasm.us/show_bug.cgi?id=3D3392635</a>]<br>
=C2=A0Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com=
" target=3D"_blank" rel=3D"noreferrer">JPEWhacker@gmail.com</a>&gt;<br>
-<br>
=C2=A0---<br>
- asm/nasm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 24 +++++++++=
+++++++++++++++<br>
+ asm/nasm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 28 +++++++++=
+++++++++++++++++--<br>
=C2=A0 include/nasmlib.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 9 +++++++++<br>
- nasm.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4=
 ++++<br>
+ nasm.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3=
 +++<br>
=C2=A0 nasmlib/filename.c=C2=A0 =C2=A0 =C2=A0 | 20 ++++++++++++++++++++<br>
=C2=A0 output/outas86.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +++-<br>
=C2=A0 output/outcoff.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
@@ -21,32 +20,34 @@ Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWha=
cker@gmail.com" target=3D"_blank" rel=3D"noreferrer">JPEWhacker@gmail.com</=
a>&gt;<br>
=C2=A0 output/outieee.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0 output/outobj.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0 stdlib/strlcat.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
- test/elfdebugprefix.asm |=C2=A0 6 ++++++<br>
+ test/elfdebugprefix.asm |=C2=A0 5 +++++<br>
=C2=A0 test/<a href=3D"http://performtest.pl" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">performtest.pl</a>=C2=A0 =C2=A0 =C2=A0| 12 ++++++++++--<=
br>
- 12 files changed, 89 insertions(+), 13 deletions(-)<br>
+ 12 files changed, 89 insertions(+), 15 deletions(-)<br>
=C2=A0 create mode 100644 test/elfdebugprefix.asm<br>
<br>
=C2=A0diff --git a/asm/nasm.c b/asm/nasm.c<br>
-index 76c70f6..08ff119 100644<br>
+index 49fa00e..ff117cf 100644<br>
=C2=A0--- a/asm/nasm.c<br>
=C2=A0+++ b/asm/nasm.c<br>
-@@ -939,6 +939,7 @@ enum text_options {<br>
-=C2=A0 =C2=A0 =C2=A0OPT_KEEP_ALL,<br>
-=C2=A0 =C2=A0 =C2=A0OPT_NO_LINE,<br>
+@@ -913,7 +913,8 @@ enum text_options {<br>
=C2=A0 =C2=A0 =C2=A0 OPT_DEBUG,<br>
-+=C2=A0 =C2=A0 OPT_DEBUG_PREFIX_MAP,<br>
-=C2=A0 =C2=A0 =C2=A0OPT_REPRODUCIBLE<br>
+=C2=A0 =C2=A0 =C2=A0OPT_INFO,<br>
+=C2=A0 =C2=A0 =C2=A0OPT_REPRODUCIBLE,<br>
+-=C2=A0 =C2=A0 OPT_BITS<br>
++=C2=A0 =C2=A0 OPT_BITS,<br>
++=C2=A0 =C2=A0 OPT_DEBUG_PREFIX_MAP<br>
=C2=A0 };<br>
=C2=A0 enum need_arg {<br>
-@@ -971,6 +972,7 @@ static const struct textargs textopts[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0{&quot;keep-all&quot;, OPT_KEEP_ALL, ARG_NO, 0},<br>
-=C2=A0 =C2=A0 =C2=A0{&quot;no-line&quot;,=C2=A0 OPT_NO_LINE, ARG_NO, 0},<b=
r>
+=C2=A0 =C2=A0 =C2=A0ARG_NO,<br>
+@@ -952,6 +953,7 @@ static const struct textargs textopts[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 {&quot;debug&quot;,=C2=A0 =C2=A0 OPT_DEBUG, ARG_MAYBE,=
 0},<br>
-+=C2=A0 =C2=A0 {&quot;debug-prefix-map&quot;, OPT_DEBUG_PREFIX_MAP, true, =
0},<br>
=C2=A0 =C2=A0 =C2=A0 {&quot;reproducible&quot;, OPT_REPRODUCIBLE, ARG_NO, 0=
},<br>
+=C2=A0 =C2=A0 =C2=A0{&quot;bits&quot;,=C2=A0 =C2=A0 =C2=A0OPT_BITS, ARG_YE=
S, 0},<br>
++=C2=A0 =C2=A0 {&quot;debug-prefix-map&quot;, OPT_DEBUG_PREFIX_MAP, true, =
0},<br>
=C2=A0 =C2=A0 =C2=A0 {NULL, OPT_BOGUS, ARG_NO, 0}<br>
=C2=A0 };<br>
-@@ -1335,6 +1337,26 @@ static bool process_arg(char *p, char *q, int pass)=
<br>
+ <br>
+@@ -1337,6 +1339,26 @@ static bool process_arg(char *p, char *q, int pass)=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case OPT_REP=
RODUCIBLE:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 reproducible =3D true;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
@@ -71,22 +72,24 @@ index 76c70f6..08ff119 100644<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case OPT_HEL=
P:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0help(stdout);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0exit(0);<br>
-@@ -2298,6 +2320,8 @@ static void help(FILE *out)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 -w-x=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 disable warning x (also -Wno-x)\n&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 -w[+-]error=C2=A0 =
=C2=A0promote all warnings to errors (also -Werror)\n&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 -w[+-]error=3Dx prom=
ote warning x to errors (also -Werror=3Dx)\n&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0--debug-prefix-map base=3D=
dest\n&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 remap paths starting with &#39;base&#39; to &#39;d=
est&#39; in output files\n&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0, out);<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0fprintf(out, &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0%-20s %s=
\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* Allow --help topic without *requiring* topic */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if (!param)<br>
+@@ -2428,7 +2450,9 @@ static void help(FILE *out, const char *what)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=C2=A0=
 =C2=A0 -w+x=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enable warning x %s(al=
so -Wx)\n&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=C2=A0=
 =C2=A0 -w-x=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0disable warning x (als=
o -Wno-x)\n&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=C2=A0=
 =C2=A0 -w[+-]error=C2=A0 =C2=A0 promote all warnings to errors (also -Werr=
or)\n&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=
=A0 -w[+-]error=3Dx=C2=A0 promote warning x to errors (also -Werror=3Dx)\n&=
quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=
=A0 -w[+-]error=3Dx=C2=A0 promote warning x to errors (also -Werror=3Dx)\n&=
quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=
=A0--debug-prefix-map base=3Ddest\n&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remap paths starting w=
ith &#39;base&#39; to &#39;dest&#39; in output files\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SEE(&quot;-w=
&quot;));<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0if (help_is(with, &#39;w&#39;)) {<br>
=C2=A0diff --git a/include/nasmlib.h b/include/nasmlib.h<br>
-index 87a7fc6..a3e5144 100644<br>
+index ed4222b..aafbf00 100644<br>
=C2=A0--- a/include/nasmlib.h<br>
=C2=A0+++ b/include/nasmlib.h<br>
-@@ -250,10 +250,19 @@ int64_t readstrnum(char *str, int length, bool *warn=
);<br>
+@@ -334,10 +334,19 @@ static inline const char *nasm_digit_chars(bool ucas=
e)<br>
=C2=A0 =C2=A0*/<br>
=C2=A0 int32_t seg_alloc(void);<br>
<br>
@@ -107,25 +110,24 @@ index 87a7fc6..a3e5144 100644<br>
=C2=A0 /*<br>
=C2=A0 =C2=A0* Utility macros...<br>
=C2=A0diff --git a/nasm.txt b/nasm.txt<br>
-index 950c361..784618c 100644<br>
+index 950c361..8447409 100644<br>
=C2=A0--- a/nasm.txt<br>
=C2=A0+++ b/nasm.txt<br>
-@@ -147,6 +147,10 @@ OPTIONS<br>
+@@ -146,6 +146,9 @@ OPTIONS<br>
+ --postfix::<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Prepend or append (respectively) the given argu=
ment to all global or<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 extern variables.<br>
- <br>
=C2=A0+--debug-prefix-map &#39;BASE=3DDEST&#39;::<br>
=C2=A0+=C2=A0 =C2=A0 Map file names beginning with &#39;BASE&#39; to &#39;D=
EST&#39; when encoding them in<br>
=C2=A0+=C2=A0 =C2=A0 output object files.<br>
-+<br>
+ <br>
=C2=A0 SYNTAX<br>
=C2=A0 ------<br>
- This man page does not fully describe the syntax of *nasm*&#39;s assembly=
 language,<br>
=C2=A0diff --git a/nasmlib/filename.c b/nasmlib/filename.c<br>
-index 172ae0b..fda2be4 100644<br>
+index 2c29d38..0e27f69 100644<br>
=C2=A0--- a/nasmlib/filename.c<br>
=C2=A0+++ b/nasmlib/filename.c<br>
-@@ -39,6 +39,8 @@<br>
+@@ -9,6 +9,8 @@<br>
=C2=A0 #include &quot;nasmlib.h&quot;<br>
=C2=A0 #include &quot;error.h&quot;<br>
<br>
@@ -134,7 +136,7 @@ index 172ae0b..fda2be4 100644<br>
=C2=A0 /*<br>
=C2=A0 =C2=A0* Add/modify a filename extension, assumed to be a period-deli=
mited<br>
=C2=A0 =C2=A0* field at the very end of the filename.=C2=A0 Returns a newly=
 allocated<br>
-@@ -61,3 +63,21 @@ const char *filename_set_extension(const char *inname, =
const char *extension)<br>
+@@ -31,3 +33,21 @@ const char *filename_set_extension(const char *inname, =
const char *extension)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 return p;<br>
=C2=A0 }<br>
@@ -156,11 +158,12 @@ index 172ae0b..fda2be4 100644<br>
=C2=A0+=C2=A0 =C2=A0 strlcpy(dest, in, len);<br>
=C2=A0+=C2=A0 =C2=A0 return dest;<br>
=C2=A0+}<br>
+\ No newline at end of file<br>
=C2=A0diff --git a/output/outas86.c b/output/outas86.c<br>
-index 54b22f8..c4a412c 100644<br>
+index 0640af7..c654bbe 100644<br>
=C2=A0--- a/output/outas86.c<br>
=C2=A0+++ b/output/outas86.c<br>
-@@ -110,6 +110,8 @@ static void as86_sect_write(struct Section *, const ui=
nt8_t *,<br>
+@@ -80,6 +80,8 @@ static void as86_sect_write(struct Section *, const uint=
8_t *,<br>
<br>
=C2=A0 static void as86_init(void)<br>
=C2=A0 {<br>
@@ -169,7 +172,7 @@ index 54b22f8..c4a412c 100644<br>
=C2=A0 =C2=A0 =C2=A0 stext.data =3D saa_init(1L);<br>
=C2=A0 =C2=A0 =C2=A0 stext.datalen =3D 0L;<br>
=C2=A0 =C2=A0 =C2=A0 stext.head =3D stext.last =3D NULL;<br>
-@@ -131,7 +133,7 @@ static void as86_init(void)<br>
+@@ -101,7 +103,7 @@ static void as86_init(void)<br>
=C2=A0 =C2=A0 =C2=A0 strslen =3D 0;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 /* as86 module name =3D input file minus extension */<=
br>
@@ -179,10 +182,10 @@ index 54b22f8..c4a412c 100644<br>
<br>
=C2=A0 static void as86_cleanup(void)<br>
=C2=A0diff --git a/output/outcoff.c b/output/outcoff.c<br>
-index c2b4eb6..e242db2 100644<br>
+index d38085d..b490bb6 100644<br>
=C2=A0--- a/output/outcoff.c<br>
=C2=A0+++ b/output/outcoff.c<br>
-@@ -1259,7 +1259,7 @@ static void coff_symbol(char *name, int32_t strpos, =
int32_t value,<br>
+@@ -1231,7 +1231,7 @@ static void coff_symbol(char *name, int32_t strpos, =
int32_t value,<br>
<br>
=C2=A0 static void coff_write_symbols(void)<br>
=C2=A0 {<br>
@@ -191,7 +194,7 @@ index c2b4eb6..e242db2 100644<br>
=C2=A0 =C2=A0 =C2=A0 uint32_t i;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 /*<br>
-@@ -1269,7 +1269,7 @@ static void coff_write_symbols(void)<br>
+@@ -1241,7 +1241,7 @@ static void coff_write_symbols(void)<br>
=C2=A0 =C2=A0 =C2=A0 if (reproducible)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(filename, 0, 18);<br>
=C2=A0 =C2=A0 =C2=A0 else<br>
@@ -201,10 +204,10 @@ index c2b4eb6..e242db2 100644<br>
<br>
=C2=A0 =C2=A0 =C2=A0 /*<br>
=C2=A0diff --git a/output/outelf.c b/output/outelf.c<br>
-index ad8d210..29f1dc1 100644<br>
+index 7288dda..9847c6e 100644<br>
=C2=A0--- a/output/outelf.c<br>
=C2=A0+++ b/output/outelf.c<br>
-@@ -546,8 +546,8 @@ static void elf_init(void)<br>
+@@ -516,8 +516,8 @@ static void elf_init(void)<br>
=C2=A0 =C2=A0 =C2=A0 const char * const *p;<br>
=C2=A0 =C2=A0 =C2=A0 const char * cur_path =3D nasm_realpath(inname);<br>
<br>
@@ -215,7 +218,7 @@ index ad8d210..29f1dc1 100644<br>
=C2=A0 =C2=A0 =C2=A0 sects =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0 nsects =3D sectlen =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 syms =3D saa_init((int32_t)sizeof(struct elf_symbol));=
<br>
-@@ -3590,13 +3590,17 @@ static void dwarf_findfile(const char * fname)<br>
+@@ -3551,13 +3551,17 @@ static void dwarf_findfile(const char * fname)<br>
=C2=A0 =C2=A0 =C2=A0 if (dwarf_clist &amp;&amp; !(strcmp(fname, dwarf_clist=
-&gt;filename)))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
<br>
@@ -234,7 +237,7 @@ index ad8d210..29f1dc1 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 match =3D match-&gt;next;<=
br>
-@@ -3607,8 +3611,7 @@ static void dwarf_findfile(const char * fname)<br>
+@@ -3568,8 +3572,7 @@ static void dwarf_findfile(const char * fname)<br>
=C2=A0 =C2=A0 =C2=A0 dwarf_clist =3D nasm_malloc(sizeof(struct linelist));<=
br>
=C2=A0 =C2=A0 =C2=A0 dwarf_numfiles++;<br>
=C2=A0 =C2=A0 =C2=A0 dwarf_clist-&gt;line =3D dwarf_numfiles;<br>
@@ -245,10 +248,10 @@ index ad8d210..29f1dc1 100644<br>
=C2=A0 =C2=A0 =C2=A0 if (!dwarf_flist) {=C2=A0 =C2=A0 =C2=A0/* if first ent=
ry */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dwarf_flist =3D dwarf_elist =3D dwarf_cl=
ist;<br>
=C2=A0diff --git a/output/outieee.c b/output/outieee.c<br>
-index 7ba9036..796e5af 100644<br>
+index 9e26cec..3643eeb 100644<br>
=C2=A0--- a/output/outieee.c<br>
=C2=A0+++ b/output/outieee.c<br>
-@@ -207,7 +207,7 @@ static void ieee_unqualified_name(char *, char *);<br>
+@@ -178,7 +178,7 @@ static void ieee_unqualified_name(char *, char *);<br>
=C2=A0 =C2=A0*/<br>
=C2=A0 static void ieee_init(void)<br>
=C2=A0 {<br>
@@ -258,10 +261,10 @@ index 7ba9036..796e5af 100644<br>
=C2=A0 =C2=A0 =C2=A0 fpubhead =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0 fpubtail =3D &amp;fpubhead;<br>
=C2=A0diff --git a/output/outobj.c b/output/outobj.c<br>
-index 281839d..fc336c1 100644<br>
+index 685c593..e3eb34a 100644<br>
=C2=A0--- a/output/outobj.c<br>
=C2=A0+++ b/output/outobj.c<br>
-@@ -644,7 +644,7 @@ static enum directive_result obj_directive(enum direct=
ive, char *);<br>
+@@ -656,7 +656,7 @@ static const char *get_default_class(const char *segme=
nt)<br>
<br>
=C2=A0 static void obj_init(void)<br>
=C2=A0 {<br>
@@ -271,7 +274,7 @@ index 281839d..fc336c1 100644<br>
=C2=A0 =C2=A0 =C2=A0 any_segs =3D false;<br>
=C2=A0 =C2=A0 =C2=A0 fpubhead =3D NULL;<br>
=C2=A0diff --git a/stdlib/strlcat.c b/stdlib/strlcat.c<br>
-index 7084d46..ee93dea 100644<br>
+index c7cbd59..92a873d 100644<br>
=C2=A0--- a/stdlib/strlcat.c<br>
=C2=A0+++ b/stdlib/strlcat.c<br>
=C2=A0@@ -29,7 +29,7 @@ size_t strlcat(char *dest, const char *src, size_t =
size)<br>
@@ -285,16 +288,15 @@ index 7084d46..ee93dea 100644<br>
=C2=A0 =C2=A0 =C2=A0 /* destination was not NULL terminated. Return the ini=
tial size */<br>
=C2=A0diff --git a/test/elfdebugprefix.asm b/test/elfdebugprefix.asm<br>
=C2=A0new file mode 100644<br>
-index 0000000..a67ba29<br>
+index 0000000..bf845ce<br>
=C2=A0--- /dev/null<br>
=C2=A0+++ b/test/elfdebugprefix.asm<br>
-@@ -0,0 +1,6 @@<br>
+@@ -0,0 +1,5 @@<br>
=C2=A0+;Testname=3Dunoptimized; Arguments=3D-O0 --debug-prefix-map elf=3DEL=
F -felf -oelfdebugprefix.o; Files=3Dstdout stderr elfdebugprefix.o; Validat=
e=3Dreadelf --wide --symbols elfdebugprefix.o | grep &#39;FILE.*ELFdebugpre=
fix.asm&#39;<br>
=C2=A0+<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 SECTION .text<br>
=C2=A0+test:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;=
 [1]<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret<br>
-+<br>
=C2=A0diff --git a/test/<a href=3D"http://performtest.pl" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">performtest.pl</a> b/test/<a href=3D"http://=
performtest.pl" rel=3D"noreferrer noreferrer" target=3D"_blank">performtest=
.pl</a><br>
=C2=A0index 46b1bdf..2426848 100755<br>
=C2=A0--- a/test/<a href=3D"http://performtest.pl" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">performtest.pl</a><br>
diff --git a/meta/recipes-devtools/nasm/<a href=3D"http://nasm_2.16.03.bb" =
rel=3D"noreferrer noreferrer" target=3D"_blank">nasm_2.16.03.bb</a> b/meta/=
recipes-devtools/nasm/<a href=3D"http://nasm_3.01.bb" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">nasm_3.01.bb</a><br>
similarity index 78%<br>
rename from meta/recipes-devtools/nasm/<a href=3D"http://nasm_2.16.03.bb" r=
el=3D"noreferrer noreferrer" target=3D"_blank">nasm_2.16.03.bb</a><br>
rename to meta/recipes-devtools/nasm/<a href=3D"http://nasm_3.01.bb" rel=3D=
"noreferrer noreferrer" target=3D"_blank">nasm_3.01.bb</a><br>
index 281f3940e7..4f4b47d665 100644<br>
--- a/meta/recipes-devtools/nasm/<a href=3D"http://nasm_2.16.03.bb" rel=3D"=
noreferrer noreferrer" target=3D"_blank">nasm_2.16.03.bb</a><br>
+++ b/meta/recipes-devtools/nasm/<a href=3D"http://nasm_3.01.bb" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">nasm_3.01.bb</a><br>
@@ -3,14 +3,14 @@ SECTION =3D &quot;devel&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://www.nasm.us/" rel=3D"noreferrer =
noreferrer" target=3D"_blank">http://www.nasm.us/</a>&quot;<br>
=C2=A0DESCRIPTION =3D &quot;The Netwide Assembler (NASM) is an assembler an=
d disassembler for the Intel x86 architecture.&quot;<br>
=C2=A0LICENSE =3D &quot;BSD-2-Clause&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D90904486f8fbf1861cf42752e1=
a39efe&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D6178dc4f5355e40552448080e6=
7a214b&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://www.nasm.us/pub/nasm/releasebuild=
s/$%7BPV%7D/nasm-$%7BPV%7D.tar.bz2" rel=3D"noreferrer noreferrer" target=3D=
"_blank">http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2=
</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-stdlib-Add-strlcat.pa=
tch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-Add-debug-prefix-map-=
option.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;bef3de159bcd61adf98bb7cc87ee9046e944644ad76b7=
633f18ab063edb29e57&quot;<br>
+SRC_URI[sha256sum] =3D &quot;7a7b1ff3b0eef3247862f2fbe4ca605ccef770545d7af=
7979eba84a9d045c0b1&quot;<br>
<br>
=C2=A0EXTRA_AUTORECONF:append =3D &quot; -I autoconf/m4&quot;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#226798): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/226798" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/226798</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116480717/199=
7914" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/116480717/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>
</blockquote></div></div></div>

--000000000000473fe00645a47c27--


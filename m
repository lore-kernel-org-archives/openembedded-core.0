Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D39DC48295
	for <webhook@archiver.kernel.org>; Sat,  3 Feb 2024 00:27:38 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.8483.1706920056244062428
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Feb 2024 16:27:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QelxtxYZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6ddb1115e82so1605298b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 16:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706920055; x=1707524855; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mnkEmiMd4p6S3Ad8F367NMKWijFhmo/RaDYZ0XhTO3U=;
        b=QelxtxYZ19z28wnRSe51rqaygb3cR74vFzruEAQE/7krMi28EyHf2zUvrgfN5uVF00
         lyj0JWK3IV4WLoE+XtOLGGbVyo6Zw2MJfj+gZ8Uc7q29Mr2LuPSNaAI3nfZtctJUgq0a
         QG1SRGTmX1ySA9E1PMYwFqIx/NkAfaJJs7k2es/7PdO1z097jwAJoE+2ad1ZaOBa4brz
         017NfQPHPzAcb8uuaZkX6XwVr6D94TSBlinV1AiXcJW1GS8v0r1D+cQ93XjOXaF2UeLv
         Z0lDRztHqQYWHYPpA2ZmXQqxm76lR8ttLfAiLkjvRPywz6i84TPh9f/XB2IkvIgogXIp
         Dn5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706920055; x=1707524855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mnkEmiMd4p6S3Ad8F367NMKWijFhmo/RaDYZ0XhTO3U=;
        b=Yn4KtqxoHjNLycUQYTi6dAYKRaFcB5jIrrhaTs9VfbHmVNjo9N99mxy+XVzHbZzznq
         06Jin7Fq/mab997oWbjbHHsw9caWmfNecxVnmqi1OxEK7dPEy0y7T0Oac59I6FPpCvif
         mJE53+dwaJmuwsAMwR/JDTMVKWQMTc0wUoElFkEl+dV+qfm7YPLaiAcPKvUB+44Qd7Q4
         2WkOtE2P7KbuUXHKRG4T2AGpdEAGUav1dK/1qDMx9QquA4G/3T9ndEaLBLKjBiytlw+o
         LLGEcliHKRjy7p7gHAXy6GT4o0mb7ZQmqjUr2nnr99dXHYYWqCiM96r6w6xYzmZ4THpw
         +lMQ==
X-Gm-Message-State: AOJu0Yzhf7FHarfmvvsXEDMlYT0gGVXrkLNlxuPF21iKaKk8v5W86wHw
	JWyipcH/rZXEstoXUS4LTIK8JkxXvsl/KGz65Lmx4v9AL7i4ftD1KGJOV36dLLU=
X-Google-Smtp-Source: AGHT+IHf5jhRCZ+LRdmZXh7m8jocOY14NvlRCbPh5nzwsJ2gs1GePaPrcjNTHj3IFasbWAQiPJVfyw==
X-Received: by 2002:a05:6a21:918b:b0:19c:acad:658 with SMTP id tp11-20020a056a21918b00b0019cacad0658mr10771785pzb.0.1706920054575;
        Fri, 02 Feb 2024 16:27:34 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::f19a])
        by smtp.gmail.com with ESMTPSA id d3-20020aa78143000000b006dbdac1595esm2299742pfn.141.2024.02.02.16.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 16:27:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] binutils: Upgrade to binutils 2.42
Date: Fri,  2 Feb 2024 16:27:29 -0800
Message-ID: <20240203002730.3887088-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 00:27:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194823

Release Notes are here [1]

[1] https://sourceware.org/pipermail/binutils/2024-January/132213.html

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Update SRCREV to get to latest on 2.39 branch

 meta/conf/distro/include/tcmode-default.inc   |    2 +-
 .../{binutils-2.41.inc => binutils-2.42.inc}  |    9 +-
 ....41.bb => binutils-cross-canadian_2.42.bb} |    0
 ...41.bb => binutils-cross-testsuite_2.42.bb} |    0
 ...s-cross_2.41.bb => binutils-cross_2.42.bb} |    0
 ...ssdk_2.41.bb => binutils-crosssdk_2.42.bb} |    0
 ...s-crosssdk-Generate-relocatable-SDKs.patch |   14 +-
 ...o-not-generate-linker-script-directo.patch |    6 +-
 ...dk-Search-for-alternative-ld.so.conf.patch |   24 +-
 ...004-Point-scripts-location-to-libdir.patch |   10 +-
 ...stro-compiler-point-to-the-wrong-ins.patch |    4 +-
 ...-system-directories-when-cross-linki.patch |   38 +-
 ...ect-assembling-for-ppc-wait-mnemonic.patch |    4 +-
 .../binutils/0008-Use-libtool-2.4.patch       | 2546 ++++++++---------
 ...h-in-libtool-when-sysroot-is-enabled.patch |    4 +-
 .../0010-sync-with-OE-libtool-changes.patch   |    4 +-
 ...or-clang-before-checking-gcc-version.patch |   10 +-
 ...-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch |    8 +-
 ...sing-_Alignof-when-using-C11-or-newe.patch |    6 +-
 ...-pe-dll.o-entry-deom-targ_extra_ofil.patch |    6 +-
 ...d-with-64bit-file-offset-on-32bit-ma.patch |   55 -
 .../{binutils_2.41.bb => binutils_2.42.bb}    |    0
 22 files changed, 1294 insertions(+), 1456 deletions(-)
 rename meta/recipes-devtools/binutils/{binutils-2.41.inc => binutils-2.42.inc} (89%)
 rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.41.bb => binutils-cross-canadian_2.42.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-cross-testsuite_2.41.bb => binutils-cross-testsuite_2.42.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-cross_2.41.bb => binutils-cross_2.42.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.41.bb => binutils-crosssdk_2.42.bb} (100%)
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0015-gprofng-Fix-build-with-64bit-file-offset-on-32bit-ma.patch
 rename meta/recipes-devtools/binutils/{binutils_2.41.bb => binutils_2.42.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index a12b202e432..fa86bf4842a 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -18,7 +18,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
 GCCVERSION ?= "13.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
-BINUVERSION ?= "2.41%"
+BINUVERSION ?= "2.42%"
 GDBVERSION ?= "14.%"
 GLIBCVERSION ?= "2.38%"
 LINUXLIBCVERSION ?= "6.6%"
diff --git a/meta/recipes-devtools/binutils/binutils-2.41.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
similarity index 89%
rename from meta/recipes-devtools/binutils/binutils-2.41.inc
rename to meta/recipes-devtools/binutils/binutils-2.42.inc
index 804f092965e..f48a1eb2494 100644
--- a/meta/recipes-devtools/binutils/binutils-2.41.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -12,13 +12,13 @@ LIC_FILES_CHKSUM="\
 
 # When upgrading to 2.42, please make sure there is no trailing .0, so
 # that upstream version check can work correctly.
-PV = "2.41"
-CVE_VERSION = "2.41"
-SRCBRANCH ?= "binutils-2_41-branch"
+PV = "2.42"
+CVE_VERSION = "2.42"
+SRCBRANCH ?= "binutils-2_42-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV ?= "c1321df4eb0a136304205085cd4913dd4eb01054"
+SRCREV ?= "42cde237366398f6e318232f4ce080bef42f0371"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
@@ -33,6 +33,5 @@ SRC_URI = "\
      file://0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch \
      file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
-     file://0015-gprofng-Fix-build-with-64bit-file-offset-on-32bit-ma.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.41.bb b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.42.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross-canadian_2.41.bb
rename to meta/recipes-devtools/binutils/binutils-cross-canadian_2.42.bb
diff --git a/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.41.bb b/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.42.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross-testsuite_2.41.bb
rename to meta/recipes-devtools/binutils/binutils-cross-testsuite_2.42.bb
diff --git a/meta/recipes-devtools/binutils/binutils-cross_2.41.bb b/meta/recipes-devtools/binutils/binutils-cross_2.42.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross_2.41.bb
rename to meta/recipes-devtools/binutils/binutils-cross_2.42.bb
diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.41.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.42.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-crosssdk_2.41.bb
rename to meta/recipes-devtools/binutils/binutils-crosssdk_2.42.bb
diff --git a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
index ef7e1c43179..148c9a29db0 100644
--- a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
+++ b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
@@ -1,4 +1,4 @@
-From 95e23fba624c90d0e62c1adaf2bcc4f3cd3175c0 Mon Sep 17 00:00:00 2001
+From 07237f83e4bfefab6473ed7c7b601d9d23b11edd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:58:54 +0000
 Subject: [PATCH] binutils-crosssdk: Generate relocatable SDKs
@@ -21,7 +21,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 6 insertions(+), 3 deletions(-)
 
 diff --git a/gold/layout.cc b/gold/layout.cc
-index b94855f8662..51f2d74d79d 100644
+index b43ae841a6c..6101a95195b 100644
 --- a/gold/layout.cc
 +++ b/gold/layout.cc
 @@ -5102,7 +5102,7 @@ Layout::create_interp(const Target* target)
@@ -34,10 +34,10 @@ index b94855f8662..51f2d74d79d 100644
    Output_section_data* odata = new Output_data_const(interp, len, 1);
  
 diff --git a/ld/genscripts.sh b/ld/genscripts.sh
-index 382bd07ffe2..9fbd0c4cb8a 100755
+index d6ceb3fe4f5..365c0e778cc 100755
 --- a/ld/genscripts.sh
 +++ b/ld/genscripts.sh
-@@ -304,6 +304,7 @@ DATA_ALIGNMENT_u="${DATA_ALIGNMENT_u-${DATA_ALIGNMENT_r}}"
+@@ -298,6 +298,7 @@ DATA_ALIGNMENT_u="${DATA_ALIGNMENT_u-${DATA_ALIGNMENT_r}}"
  LD_FLAG=r
  DATA_ALIGNMENT=${DATA_ALIGNMENT_r}
  DEFAULT_DATA_ALIGNMENT="ALIGN(${SEGMENT_SIZE})"
@@ -45,7 +45,7 @@ index 382bd07ffe2..9fbd0c4cb8a 100755
  ( echo "/* Script for -r */"
    source_sh ${CUSTOMIZER_SCRIPT}
    source_sh ${srcdir}/scripttempl/${SCRIPT_NAME}.sc
-@@ -312,10 +313,12 @@ DEFAULT_DATA_ALIGNMENT="ALIGN(${SEGMENT_SIZE})"
+@@ -306,10 +307,12 @@ DEFAULT_DATA_ALIGNMENT="ALIGN(${SEGMENT_SIZE})"
  LD_FLAG=u
  DATA_ALIGNMENT=${DATA_ALIGNMENT_u}
  CONSTRUCTING=" "
@@ -59,10 +59,10 @@ index 382bd07ffe2..9fbd0c4cb8a 100755
  DATA_ALIGNMENT=${DATA_ALIGNMENT_}
  RELOCATING=" "
 diff --git a/ld/scripttempl/elf.sc b/ld/scripttempl/elf.sc
-index 1e3c5aa8504..b8d1977b3f0 100644
+index fae7c2ad71c..7fe37eb1874 100644
 --- a/ld/scripttempl/elf.sc
 +++ b/ld/scripttempl/elf.sc
-@@ -148,8 +148,8 @@ if test -z "$DATA_SEGMENT_ALIGN"; then
+@@ -150,8 +150,8 @@ if test -z "$DATA_SEGMENT_ALIGN"; then
      DATA_SEGMENT_RELRO_END=". = DATA_SEGMENT_RELRO_END (${SEPARATE_GOTPLT-0}, .);"
    fi
  fi
diff --git a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
index 3ea6923fd87..bea1be9e832 100644
--- a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
+++ b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
@@ -1,4 +1,4 @@
-From 2b3017e7dab4d929d3ab664c5e6f94226b0a6d31 Mon Sep 17 00:00:00 2001
+From 4988a5a42289e43ab0fbd87793f293e263dc3dc1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 6 Mar 2017 23:37:05 -0800
 Subject: [PATCH] binutils-cross: Do not generate linker script directories
@@ -22,10 +22,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 25 deletions(-)
 
 diff --git a/ld/genscripts.sh b/ld/genscripts.sh
-index 9fbd0c4cb8a..6be07038c9b 100755
+index 365c0e778cc..b0893fda3c5 100755
 --- a/ld/genscripts.sh
 +++ b/ld/genscripts.sh
-@@ -235,31 +235,6 @@ append_to_lib_path()
+@@ -229,31 +229,6 @@ append_to_lib_path()
    fi
  }
  
diff --git a/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch b/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
index ace279bd848..6f23abc2508 100644
--- a/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
+++ b/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
@@ -1,4 +1,4 @@
-From c00ead7264dc1335cb43222cb742b95614666be8 Mon Sep 17 00:00:00 2001
+From a0047134327e312a22f798bd328becf4053a6973 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 19 Feb 2020 09:51:16 -0800
 Subject: [PATCH] binutils-nativesdk: Search for alternative ld.so.conf in SDK
@@ -29,38 +29,38 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  5 files changed, 7 insertions(+), 3 deletions(-)
 
 diff --git a/ld/Makefile.am b/ld/Makefile.am
-index c3adbb0ccad..ce0f7e7f85d 100644
+index f9ee05b1400..07801c2c3ac 100644
 --- a/ld/Makefile.am
 +++ b/ld/Makefile.am
 @@ -42,7 +42,8 @@ ZLIBINC = @zlibinc@
  
- ELF_CLFAGS=-DELF_LIST_OPTIONS=@elf_list_options@ \
+ ELF_CFLAGS=-DELF_LIST_OPTIONS=@elf_list_options@ \
  	   -DELF_SHLIB_LIST_OPTIONS=@elf_shlib_list_options@ \
 -	   -DELF_PLT_UNWIND_LIST_OPTIONS=@elf_plt_unwind_list_options@
 +	   -DELF_PLT_UNWIND_LIST_OPTIONS=@elf_plt_unwind_list_options@ \
 +           -DSYSCONFDIR="\"$(sysconfdir)\""
  WARN_CFLAGS = @WARN_CFLAGS@
  NO_WERROR = @NO_WERROR@
- AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS) $(JANSSON_CFLAGS) $(ZSTD_CFLAGS)
+ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CFLAGS) $(JANSSON_CFLAGS) $(ZSTD_CFLAGS)
 diff --git a/ld/Makefile.in b/ld/Makefile.in
-index d1a56026437..9d86aed12c6 100644
+index abb0565718f..6329a12a0d6 100644
 --- a/ld/Makefile.in
 +++ b/ld/Makefile.in
-@@ -566,7 +566,8 @@ ZLIB = @zlibdir@ -lz
+@@ -576,7 +576,8 @@ ZLIB = @zlibdir@ -lz
  ZLIBINC = @zlibinc@
- ELF_CLFAGS = -DELF_LIST_OPTIONS=@elf_list_options@ \
+ ELF_CFLAGS = -DELF_LIST_OPTIONS=@elf_list_options@ \
  	   -DELF_SHLIB_LIST_OPTIONS=@elf_shlib_list_options@ \
 -	   -DELF_PLT_UNWIND_LIST_OPTIONS=@elf_plt_unwind_list_options@
 +	   -DELF_PLT_UNWIND_LIST_OPTIONS=@elf_plt_unwind_list_options@ \
 +           -DSYSCONFDIR="\"$(sysconfdir)\""
  
- AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS) $(JANSSON_CFLAGS) $(ZSTD_CFLAGS)
+ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CFLAGS) $(JANSSON_CFLAGS) $(ZSTD_CFLAGS)
  
 diff --git a/ld/ldelf.c b/ld/ldelf.c
-index f9a6819366f..1519f8ac4e5 100644
+index 2852851dcd5..187b359af86 100644
 --- a/ld/ldelf.c
 +++ b/ld/ldelf.c
-@@ -936,7 +936,7 @@ ldelf_check_ld_so_conf (const struct bfd_link_needed_list *l, int force,
+@@ -939,7 +939,7 @@ ldelf_check_ld_so_conf (const struct bfd_link_needed_list *l, int force,
  
        info.path = NULL;
        info.len = info.alloc = 0;
@@ -70,7 +70,7 @@ index f9a6819366f..1519f8ac4e5 100644
        if (!ldelf_parse_ld_so_conf (&info, tmppath))
  	{
 diff --git a/ld/ldmain.c b/ld/ldmain.c
-index 06ac2c64fa8..5c38e8cd313 100644
+index e90c2021b33..01b306e58a1 100644
 --- a/ld/ldmain.c
 +++ b/ld/ldmain.c
 @@ -69,6 +69,7 @@ char *program_name;
@@ -82,7 +82,7 @@ index 06ac2c64fa8..5c38e8cd313 100644
  /* The canonical representation of ld_sysroot.  */
  char *ld_canon_sysroot;
 diff --git a/ld/ldmain.h b/ld/ldmain.h
-index dda124b96e8..ba06a7d7be2 100644
+index 0238aed0ebd..2dd00db13b3 100644
 --- a/ld/ldmain.h
 +++ b/ld/ldmain.h
 @@ -23,6 +23,7 @@
diff --git a/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch b/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch
index 0747e40491e..b2e9ef1ff82 100644
--- a/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch
+++ b/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch
@@ -1,4 +1,4 @@
-From d2d1281b0b76f96c64a2043772c52c85f58994d5 Mon Sep 17 00:00:00 2001
+From 1647f124bf0b48ca90189ecbd9ddd4b2c348ce03 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:09:58 +0000
 Subject: [PATCH] Point scripts location to libdir
@@ -12,10 +12,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/ld/Makefile.am b/ld/Makefile.am
-index ce0f7e7f85d..2e36ab4efc4 100644
+index 07801c2c3ac..a2bcffecf73 100644
 --- a/ld/Makefile.am
 +++ b/ld/Makefile.am
-@@ -51,7 +51,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS) $(JANSSON_CFLAGS) $(ZSTD_CFLAGS)
+@@ -51,7 +51,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CFLAGS) $(JANSSON_CFLAGS) $(ZSTD_CFLAGS)
  # We put the scripts in the directory $(scriptdir)/ldscripts.
  # We can't put the scripts in $(datadir) because the SEARCH_DIR
  # directives need to be different for native and cross linkers.
@@ -25,10 +25,10 @@ index ce0f7e7f85d..2e36ab4efc4 100644
  EMUL = @EMUL@
  EMULATION_OFILES = @EMULATION_OFILES@
 diff --git a/ld/Makefile.in b/ld/Makefile.in
-index 9d86aed12c6..c21c554e432 100644
+index 6329a12a0d6..15311048855 100644
 --- a/ld/Makefile.in
 +++ b/ld/Makefile.in
-@@ -574,7 +574,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS) $(JANSSON_CFLAGS) $(ZSTD_CFLAGS)
+@@ -584,7 +584,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CFLAGS) $(JANSSON_CFLAGS) $(ZSTD_CFLAGS)
  # We put the scripts in the directory $(scriptdir)/ldscripts.
  # We can't put the scripts in $(datadir) because the SEARCH_DIR
  # directives need to be different for native and cross linkers.
diff --git a/meta/recipes-devtools/binutils/binutils/0005-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch b/meta/recipes-devtools/binutils/binutils/0005-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
index 9fe8b73d870..fbb4418e56b 100644
--- a/meta/recipes-devtools/binutils/binutils/0005-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
+++ b/meta/recipes-devtools/binutils/binutils/0005-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
@@ -1,4 +1,4 @@
-From 5564cdf1433255a00acb427fb5b0656b772b2651 Mon Sep 17 00:00:00 2001
+From 1e09d056a802c0d12bdf31aceead3725b69bd626 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:39:01 +0000
 Subject: [PATCH] don't let the distro compiler point to the wrong installation
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/libiberty/Makefile.in b/libiberty/Makefile.in
-index f9fbba23e2c..93495e45d6f 100644
+index 85c4b6b6ef8..cb6e91c8f9b 100644
 --- a/libiberty/Makefile.in
 +++ b/libiberty/Makefile.in
 @@ -385,7 +385,8 @@ install-strip: install
diff --git a/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-directories-when-cross-linki.patch b/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-directories-when-cross-linki.patch
index 9b09ec09cb5..1dcea9fe288 100644
--- a/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-directories-when-cross-linki.patch
+++ b/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-directories-when-cross-linki.patch
@@ -1,4 +1,4 @@
-From 41b09c6a9d78a31db0f3c70d27c05475292bde7e Mon Sep 17 00:00:00 2001
+From 7a6074edd927273ae6924dc676ca2fdf127ce542 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 15 Jan 2016 06:31:09 +0000
 Subject: [PATCH] warn for uses of system directories when cross linking
@@ -63,10 +63,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  9 files changed, 87 insertions(+), 2 deletions(-)
 
 diff --git a/ld/config.in b/ld/config.in
-index ad0dc6a106c..d21edaddce7 100644
+index 52d62f06ff0..b5944e7ba55 100644
 --- a/ld/config.in
 +++ b/ld/config.in
-@@ -58,6 +58,9 @@
+@@ -70,6 +70,9 @@
     language is requested. */
  #undef ENABLE_NLS
  
@@ -77,10 +77,10 @@ index ad0dc6a106c..d21edaddce7 100644
  #undef EXTRA_SHLIB_EXTENSION
  
 diff --git a/ld/configure b/ld/configure
-index 1503936432f..29896853a90 100755
+index add770f883c..867f3f62c88 100755
 --- a/ld/configure
 +++ b/ld/configure
-@@ -839,6 +839,7 @@ with_lib_path
+@@ -844,6 +844,7 @@ with_lib_path
  enable_targets
  enable_64_bit_bfd
  with_sysroot
@@ -88,7 +88,7 @@ index 1503936432f..29896853a90 100755
  enable_gold
  enable_got
  enable_compressed_debug_sections
-@@ -1521,6 +1522,8 @@ Optional Features:
+@@ -1534,6 +1535,8 @@ Optional Features:
    --enable-checking       enable run-time checks
    --enable-targets        alternative target configurations
    --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
@@ -97,7 +97,7 @@ index 1503936432f..29896853a90 100755
    --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
    --enable-got=<type>     GOT handling scheme (target, single, negative,
                            multigot)
-@@ -15483,6 +15486,19 @@ fi
+@@ -15566,6 +15569,19 @@ fi
  
  
  
@@ -118,7 +118,7 @@ index 1503936432f..29896853a90 100755
  if test "${enable_gold+set}" = set; then :
    enableval=$enable_gold; case "${enableval}" in
 diff --git a/ld/configure.ac b/ld/configure.ac
-index 77edac3258c..a74dac63038 100644
+index 4a11787ae71..104a531fb0f 100644
 --- a/ld/configure.ac
 +++ b/ld/configure.ac
 @@ -103,6 +103,16 @@ AC_SUBST(use_sysroot)
@@ -139,10 +139,10 @@ index 77edac3258c..a74dac63038 100644
  dnl "install_as_default" is set to false if gold is the default linker.
  dnl "installed_linker" is the installed BFD linker name.
 diff --git a/ld/ld.h b/ld/ld.h
-index a0f8a15c7a9..e3db345f3a5 100644
+index 54d9079678c..9f0163b2911 100644
 --- a/ld/ld.h
 +++ b/ld/ld.h
-@@ -163,6 +163,14 @@ typedef struct
+@@ -166,6 +166,14 @@ typedef struct
       in the linker script.  */
    bool force_group_allocation;
  
@@ -158,11 +158,11 @@ index a0f8a15c7a9..e3db345f3a5 100644
    enum endian_enum endian;
  
 diff --git a/ld/ld.texi b/ld/ld.texi
-index aa8b1aa86eb..9bc4bc28823 100644
+index 4fda259a552..22685f5f1dd 100644
 --- a/ld/ld.texi
 +++ b/ld/ld.texi
-@@ -3059,6 +3059,18 @@ creation of the metadata note, if one had been enabled by an earlier
- occurrence of the --package-metdata option.
+@@ -3119,6 +3119,18 @@ creation of the metadata note, if one had been enabled by an earlier
+ occurrence of the --package-metadata option.
  If the linker has been built with libjansson, then the JSON string
  will be validated.
 +
@@ -181,7 +181,7 @@ index aa8b1aa86eb..9bc4bc28823 100644
  
  @c man end
 diff --git a/ld/ldfile.c b/ld/ldfile.c
-index df7c9cbd65e..0c965593225 100644
+index dc9875d8813..49d899ee49d 100644
 --- a/ld/ldfile.c
 +++ b/ld/ldfile.c
 @@ -327,6 +327,23 @@ ldfile_add_library_path (const char *name, bool cmdline)
@@ -209,7 +209,7 @@ index df7c9cbd65e..0c965593225 100644
  
  /* Try to open a BFD for a lang_input_statement.  */
 diff --git a/ld/ldlex.h b/ld/ldlex.h
-index 87cac02141d..d1a478fb827 100644
+index 161a9d4d8dc..757fe2f7650 100644
 --- a/ld/ldlex.h
 +++ b/ld/ldlex.h
 @@ -147,6 +147,8 @@ enum option_values
@@ -222,7 +222,7 @@ index 87cac02141d..d1a478fb827 100644
    OPTION_PRINT_OUTPUT_FORMAT,
    OPTION_PRINT_SYSROOT,
 diff --git a/ld/ldmain.c b/ld/ldmain.c
-index 5c38e8cd313..04eed320aca 100644
+index 01b306e58a1..eddefc24332 100644
 --- a/ld/ldmain.c
 +++ b/ld/ldmain.c
 @@ -326,6 +326,8 @@ main (int argc, char **argv)
@@ -253,10 +253,10 @@ index 5c38e8cd313..04eed320aca 100644
      {
        if (error_count < MAX_ERRORS_IN_A_ROW)
 diff --git a/ld/lexsup.c b/ld/lexsup.c
-index fe8722313fe..1df7af3ccaa 100644
+index 099dff8ecde..e9939000b2e 100644
 --- a/ld/lexsup.c
 +++ b/ld/lexsup.c
-@@ -629,6 +629,14 @@ static const struct ld_option ld_options[] =
+@@ -642,6 +642,14 @@ static const struct ld_option ld_options[] =
  		   "                                <method> is: share-unconflicted (default),\n"
  		   "                                             share-duplicated"),
      TWO_DASHES },
@@ -271,7 +271,7 @@ index fe8722313fe..1df7af3ccaa 100644
  };
  
  #define OPTION_COUNT ARRAY_SIZE (ld_options)
-@@ -1787,6 +1795,13 @@ parse_args (unsigned argc, char **argv)
+@@ -1818,6 +1826,13 @@ parse_args (unsigned argc, char **argv)
  
  	case OPTION_PRINT_MAP_LOCALS:
  	  config.print_map_locals = true;
diff --git a/meta/recipes-devtools/binutils/binutils/0007-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch b/meta/recipes-devtools/binutils/binutils/0007-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
index d39979068e7..7bf4ecabe15 100644
--- a/meta/recipes-devtools/binutils/binutils/0007-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
+++ b/meta/recipes-devtools/binutils/binutils/0007-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
@@ -1,4 +1,4 @@
-From 7f04e82ac2ded9a7f68dba9fabf1251d680bd0b9 Mon Sep 17 00:00:00 2001
+From 9784134b2670b284fb4d31360964a14d1e9a070d Mon Sep 17 00:00:00 2001
 From: Zhenhua Luo <zhenhua.luo@nxp.com>
 Date: Sat, 11 Jun 2016 22:08:29 -0500
 Subject: [PATCH] fix the incorrect assembling for ppc wait mnemonic
@@ -14,7 +14,7 @@ Signed-off-by: Zhenhua Luo <zhenhua.luo@nxp.com>
  1 file changed, 1 insertion(+), 3 deletions(-)
 
 diff --git a/opcodes/ppc-opc.c b/opcodes/ppc-opc.c
-index 37f1aeb780c..45774c7cf79 100644
+index e55bfe846cd..66b37e36e6f 100644
 --- a/opcodes/ppc-opc.c
 +++ b/opcodes/ppc-opc.c
 @@ -7138,8 +7138,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
diff --git a/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch b/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch
index 432c4310324..ebaa3c55b55 100644
--- a/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch
+++ b/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch
@@ -1,4 +1,4 @@
-From 8fc55f06d8950607f22e81f51c67dd4e6b4f6742 Mon Sep 17 00:00:00 2001
+From 952a0e386cb925190561ad6b33a2dedacec1056b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 14 Feb 2016 17:04:07 +0000
 Subject: [PATCH] Use libtool 2.4
@@ -19,24 +19,24 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  gprof/Makefile.in                   |    3 +
  gprof/configure                     | 1331 +++++++++---
  gprofng/Makefile.in                 |    2 +
- gprofng/configure                   | 1701 ++++++++++++----
+ gprofng/configure                   | 1693 ++++++++++++----
  gprofng/doc/Makefile.in             |    2 +
  gprofng/gp-display-html/Makefile.in |    2 +
  gprofng/libcollector/Makefile.in    |    2 +
- gprofng/libcollector/configure      | 1703 ++++++++++++----
+ gprofng/libcollector/configure      | 1693 ++++++++++++----
  gprofng/src/Makefile.in             |    2 +
  ld/Makefile.in                      |    3 +
- ld/configure                        | 1704 ++++++++++++----
+ ld/configure                        | 1694 ++++++++++++----
  libbacktrace/Makefile.in            |  108 +-
  libbacktrace/aclocal.m4             |   73 +-
  libbacktrace/configure              | 1441 +++++++++----
  libctf/Makefile.in                  |    2 +
- libctf/configure                    | 1330 +++++++++---
+ libctf/configure                    | 1334 +++++++++---
  libsframe/Makefile.in               |  344 ++--
  libsframe/aclocal.m4                |  220 +-
  libsframe/configure                 | 1553 ++++++++++----
- libtool.m4                          | 1093 ++++++----
- ltmain.sh                           | 2925 ++++++++++++++++++---------
+ libtool.m4                          | 1085 ++++++----
+ ltmain.sh                           | 2921 ++++++++++++++++++---------
  ltoptions.m4                        |    2 +-
  ltversion.m4                        |   12 +-
  lt~obsolete.m4                      |    2 +-
@@ -44,13 +44,13 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  opcodes/configure                   | 1331 +++++++++---
  zlib/Makefile.in                    |    3 +
  zlib/configure                      | 1331 +++++++++---
- 35 files changed, 16108 insertions(+), 6126 deletions(-)
+ 35 files changed, 16094 insertions(+), 6104 deletions(-)
 
 diff --git a/bfd/Makefile.in b/bfd/Makefile.in
-index 4edfedee924..ed7257f2e96 100644
+index faaa0c424b8..5371e093163 100644
 --- a/bfd/Makefile.in
 +++ b/bfd/Makefile.in
-@@ -334,6 +334,7 @@ DATADIRNAME = @DATADIRNAME@
+@@ -340,6 +340,7 @@ DATADIRNAME = @DATADIRNAME@
  DEBUGDIR = @DEBUGDIR@
  DEFS = @DEFS@
  DEPDIR = @DEPDIR@
@@ -58,7 +58,7 @@ index 4edfedee924..ed7257f2e96 100644
  DSYMUTIL = @DSYMUTIL@
  DUMPBIN = @DUMPBIN@
  ECHO_C = @ECHO_C@
-@@ -368,6 +369,7 @@ LN_S = @LN_S@
+@@ -379,6 +380,7 @@ LTLIBINTL = @LTLIBINTL@
  LTLIBOBJS = @LTLIBOBJS@
  MAINT = @MAINT@
  MAKEINFO = @MAKEINFO@
@@ -66,7 +66,7 @@ index 4edfedee924..ed7257f2e96 100644
  MKDIR_P = @MKDIR_P@
  MKINSTALLDIRS = @MKINSTALLDIRS@
  MSGFMT = @MSGFMT@
-@@ -414,6 +416,7 @@ abs_builddir = @abs_builddir@
+@@ -425,6 +427,7 @@ abs_builddir = @abs_builddir@
  abs_srcdir = @abs_srcdir@
  abs_top_builddir = @abs_top_builddir@
  abs_top_srcdir = @abs_top_srcdir@
@@ -75,10 +75,10 @@ index 4edfedee924..ed7257f2e96 100644
  ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
  all_backends = @all_backends@
 diff --git a/bfd/configure b/bfd/configure
-index abc24a93028..f4c8ea4e54b 100755
+index 0a6e96c5b3b..970732f338a 100755
 --- a/bfd/configure
 +++ b/bfd/configure
-@@ -706,6 +706,9 @@ OTOOL
+@@ -712,6 +712,9 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -88,7 +88,7 @@ index abc24a93028..f4c8ea4e54b 100755
  OBJDUMP
  LN_S
  NM
-@@ -824,6 +827,7 @@ enable_static
+@@ -830,6 +833,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -96,7 +96,7 @@ index abc24a93028..f4c8ea4e54b 100755
  enable_libtool_lock
  enable_plugins
  enable_largefile
-@@ -1514,6 +1518,8 @@ Optional Packages:
+@@ -1526,6 +1530,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -105,7 +105,7 @@ index abc24a93028..f4c8ea4e54b 100755
    --with-mmap             try using mmap for BFD input files if available
    --with-separate-debug-dir=DIR
                            Look for global separate debug info in DIR
-@@ -5043,8 +5049,8 @@ esac
+@@ -5063,8 +5069,8 @@ esac
  
  
  
@@ -116,7 +116,7 @@ index abc24a93028..f4c8ea4e54b 100755
  
  
  
-@@ -5084,7 +5090,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -5104,7 +5110,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -125,7 +125,7 @@ index abc24a93028..f4c8ea4e54b 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -5777,8 +5783,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -5797,8 +5803,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -136,7 +136,7 @@ index abc24a93028..f4c8ea4e54b 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -5827,6 +5833,80 @@ esac
+@@ -5847,6 +5853,80 @@ esac
  
  
  
@@ -217,7 +217,7 @@ index abc24a93028..f4c8ea4e54b 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if ${lt_cv_ld_reload_flag+:} false; then :
-@@ -5843,6 +5923,11 @@ case $reload_flag in
+@@ -5863,6 +5943,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -229,7 +229,7 @@ index abc24a93028..f4c8ea4e54b 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -6011,7 +6096,8 @@ mingw* | pw32*)
+@@ -6031,7 +6116,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -239,7 +239,7 @@ index abc24a93028..f4c8ea4e54b 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6165,6 +6251,21 @@ esac
+@@ -6190,6 +6276,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -261,7 +261,7 @@ index abc24a93028..f4c8ea4e54b 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6180,6 +6281,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -6205,6 +6306,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -419,7 +419,7 @@ index abc24a93028..f4c8ea4e54b 100755
  plugin_option=
  plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
  for plugin in $plugin_names; do
-@@ -6194,8 +6446,10 @@ for plugin in $plugin_names; do
+@@ -6219,8 +6471,10 @@ for plugin in $plugin_names; do
  done
  
  if test -n "$ac_tool_prefix"; then
@@ -432,7 +432,7 @@ index abc24a93028..f4c8ea4e54b 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_AR+:} false; then :
-@@ -6211,7 +6465,7 @@ do
+@@ -6236,7 +6490,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -441,7 +441,7 @@ index abc24a93028..f4c8ea4e54b 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6231,11 +6485,15 @@ $as_echo "no" >&6; }
+@@ -6256,11 +6510,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -460,7 +460,7 @@ index abc24a93028..f4c8ea4e54b 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_ac_ct_AR+:} false; then :
-@@ -6251,7 +6509,7 @@ do
+@@ -6276,7 +6534,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -469,7 +469,7 @@ index abc24a93028..f4c8ea4e54b 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6270,6 +6528,10 @@ else
+@@ -6295,6 +6553,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -480,7 +480,7 @@ index abc24a93028..f4c8ea4e54b 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6281,25 +6543,20 @@ ac_tool_warned=yes ;;
+@@ -6306,25 +6568,20 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -516,7 +516,7 @@ index abc24a93028..f4c8ea4e54b 100755
  
  
  
-@@ -6310,6 +6567,63 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+@@ -6335,6 +6592,63 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
  
  
  
@@ -580,7 +580,7 @@ index abc24a93028..f4c8ea4e54b 100755
  
  if test -n "$ac_tool_prefix"; then
    # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
-@@ -6650,8 +6964,8 @@ esac
+@@ -6675,8 +6989,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -591,7 +591,7 @@ index abc24a93028..f4c8ea4e54b 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -6687,6 +7001,7 @@ for ac_symprfx in "" "_"; do
+@@ -6712,6 +7026,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -599,7 +599,7 @@ index abc24a93028..f4c8ea4e54b 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -6728,6 +7043,18 @@ _LT_EOF
+@@ -6753,6 +7068,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -618,7 +618,7 @@ index abc24a93028..f4c8ea4e54b 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -6739,7 +7066,7 @@ _LT_EOF
+@@ -6764,7 +7091,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -627,7 +627,7 @@ index abc24a93028..f4c8ea4e54b 100755
    const char *name;
    void       *address;
  }
-@@ -6765,8 +7092,8 @@ static const void *lt_preloaded_setup() {
+@@ -6790,8 +7117,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -638,7 +638,7 @@ index abc24a93028..f4c8ea4e54b 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -6776,8 +7103,8 @@ _LT_EOF
+@@ -6801,8 +7128,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -649,7 +649,7 @@ index abc24a93028..f4c8ea4e54b 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -6814,6 +7141,14 @@ else
+@@ -6839,6 +7166,14 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -664,7 +664,7 @@ index abc24a93028..f4c8ea4e54b 100755
  
  
  
-@@ -6832,6 +7167,47 @@ fi
+@@ -6857,6 +7192,47 @@ fi
  
  
  
@@ -712,7 +712,7 @@ index abc24a93028..f4c8ea4e54b 100755
  
  
  
-@@ -7041,6 +7417,123 @@ esac
+@@ -7066,6 +7442,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -836,7 +836,7 @@ index abc24a93028..f4c8ea4e54b 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7604,6 +8097,8 @@ _LT_EOF
+@@ -7629,6 +8122,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -845,7 +845,7 @@ index abc24a93028..f4c8ea4e54b 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -8155,8 +8650,6 @@ fi
+@@ -8182,8 +8677,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -854,7 +854,7 @@ index abc24a93028..f4c8ea4e54b 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8322,6 +8815,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8349,6 +8842,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -867,7 +867,7 @@ index abc24a93028..f4c8ea4e54b 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8384,7 +8883,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8411,7 +8910,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -876,7 +876,7 @@ index abc24a93028..f4c8ea4e54b 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8441,13 +8940,17 @@ case $host_os in
+@@ -8468,13 +8967,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -900,7 +900,7 @@ index abc24a93028..f4c8ea4e54b 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8508,6 +9011,11 @@ fi
+@@ -8535,6 +9038,11 @@ fi
  
  
  
@@ -912,7 +912,7 @@ index abc24a93028..f4c8ea4e54b 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -8858,7 +9366,8 @@ _LT_EOF
+@@ -8885,7 +9393,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -922,7 +922,7 @@ index abc24a93028..f4c8ea4e54b 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -8957,12 +9466,12 @@ _LT_EOF
+@@ -8984,12 +9493,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -937,7 +937,7 @@ index abc24a93028..f4c8ea4e54b 100755
  	  fi
  	  ;;
  	esac
-@@ -8976,8 +9485,8 @@ _LT_EOF
+@@ -9003,8 +9512,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -948,7 +948,7 @@ index abc24a93028..f4c8ea4e54b 100755
        fi
        ;;
  
-@@ -8995,8 +9504,8 @@ _LT_EOF
+@@ -9022,8 +9531,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -959,7 +959,7 @@ index abc24a93028..f4c8ea4e54b 100755
        else
  	ld_shlibs=no
        fi
-@@ -9042,8 +9551,8 @@ _LT_EOF
+@@ -9069,8 +9578,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -970,7 +970,7 @@ index abc24a93028..f4c8ea4e54b 100755
        else
  	ld_shlibs=no
        fi
-@@ -9173,7 +9682,13 @@ _LT_EOF
+@@ -9200,7 +9709,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -985,7 +985,7 @@ index abc24a93028..f4c8ea4e54b 100755
  /* end confdefs.h.  */
  
  int
-@@ -9186,22 +9701,29 @@ main ()
+@@ -9213,22 +9728,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -1028,7 +1028,7 @@ index abc24a93028..f4c8ea4e54b 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9213,7 +9735,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9240,7 +9762,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -1043,7 +1043,7 @@ index abc24a93028..f4c8ea4e54b 100755
  /* end confdefs.h.  */
  
  int
-@@ -9226,22 +9754,29 @@ main ()
+@@ -9253,22 +9781,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -1086,7 +1086,7 @@ index abc24a93028..f4c8ea4e54b 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9286,20 +9821,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9313,20 +9848,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -1164,7 +1164,7 @@ index abc24a93028..f4c8ea4e54b 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9360,7 +9938,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9387,7 +9965,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -1173,7 +1173,7 @@ index abc24a93028..f4c8ea4e54b 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9368,7 +9946,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9395,7 +9973,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -1182,7 +1182,7 @@ index abc24a93028..f4c8ea4e54b 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9384,7 +9962,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9411,7 +9989,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -1191,8 +1191,8 @@ index abc24a93028..f4c8ea4e54b 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9408,10 +9986,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
- 	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
+@@ -9435,10 +10013,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+ 	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
 -	  archive_cmds='$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
@@ -1204,7 +1204,7 @@ index abc24a93028..f4c8ea4e54b 100755
  	  ;;
  	esac
        else
-@@ -9490,23 +10068,36 @@ fi
+@@ -9517,23 +10095,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -1249,7 +1249,7 @@ index abc24a93028..f4c8ea4e54b 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9591,7 +10182,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9618,7 +10209,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -1258,7 +1258,7 @@ index abc24a93028..f4c8ea4e54b 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9610,9 +10201,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9637,9 +10228,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -1270,7 +1270,7 @@ index abc24a93028..f4c8ea4e54b 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10188,8 +10779,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10215,8 +10806,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -1282,7 +1282,7 @@ index abc24a93028..f4c8ea4e54b 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10222,13 +10814,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10249,13 +10841,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -1355,16 +1355,16 @@ index abc24a93028..f4c8ea4e54b 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -11106,7 +11756,7 @@ else
+@@ -11157,7 +11807,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11109 "configure"
+-#line 11160 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11150,10 +11800,10 @@ else
+@@ -11201,10 +11851,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -1377,16 +1377,16 @@ index abc24a93028..f4c8ea4e54b 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11212,7 +11862,7 @@ else
+@@ -11263,7 +11913,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11215 "configure"
+-#line 11266 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11256,10 +11906,10 @@ else
+@@ -11307,10 +11957,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -1399,7 +1399,7 @@ index abc24a93028..f4c8ea4e54b 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -13707,7 +14357,7 @@ SHARED_LDFLAGS=
+@@ -15691,7 +16341,7 @@ SHARED_LDFLAGS=
  if test "$enable_shared" = "yes"; then
    x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
    if test -n "$x"; then
@@ -1408,7 +1408,7 @@ index abc24a93028..f4c8ea4e54b 100755
    fi
  fi
  
-@@ -16326,13 +16976,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -18313,13 +18963,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -1429,7 +1429,7 @@ index abc24a93028..f4c8ea4e54b 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -16347,14 +17004,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -18334,14 +18991,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -1448,7 +1448,7 @@ index abc24a93028..f4c8ea4e54b 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -16387,12 +17047,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -18374,12 +19034,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -1462,7 +1462,7 @@ index abc24a93028..f4c8ea4e54b 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -16447,8 +17107,13 @@ reload_flag \
+@@ -18434,8 +19094,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -1476,7 +1476,7 @@ index abc24a93028..f4c8ea4e54b 100755
  STRIP \
  RANLIB \
  CC \
-@@ -16458,12 +17123,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -18445,12 +19110,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -1492,7 +1492,7 @@ index abc24a93028..f4c8ea4e54b 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -16479,7 +17146,6 @@ no_undefined_flag \
+@@ -18466,7 +19133,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -1500,7 +1500,7 @@ index abc24a93028..f4c8ea4e54b 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -16515,6 +17181,7 @@ module_cmds \
+@@ -18502,6 +19168,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -1508,7 +1508,7 @@ index abc24a93028..f4c8ea4e54b 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -17283,7 +17950,8 @@ $as_echo X"$file" |
+@@ -19278,7 +19945,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -1518,7 +1518,7 @@ index abc24a93028..f4c8ea4e54b 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -17386,19 +18054,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -19381,19 +20049,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -1562,7 +1562,7 @@ index abc24a93028..f4c8ea4e54b 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -17428,6 +18119,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -19423,6 +20114,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -1575,7 +1575,7 @@ index abc24a93028..f4c8ea4e54b 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -17437,6 +18134,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -19432,6 +20129,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -1585,7 +1585,7 @@ index abc24a93028..f4c8ea4e54b 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -17551,12 +18251,12 @@ with_gcc=$GCC
+@@ -19546,12 +20246,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -1601,7 +1601,7 @@ index abc24a93028..f4c8ea4e54b 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -17643,9 +18343,6 @@ inherit_rpath=$inherit_rpath
+@@ -19638,9 +20338,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -1611,7 +1611,7 @@ index abc24a93028..f4c8ea4e54b 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -17661,6 +18358,9 @@ include_expsyms=$lt_include_expsyms
+@@ -19656,6 +20353,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -1621,7 +1621,7 @@ index abc24a93028..f4c8ea4e54b 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -17693,210 +18393,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -19688,210 +20388,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -1996,10 +1996,10 @@ index abc24a93028..f4c8ea4e54b 100755
    chmod +x "$ofile"
  
 diff --git a/bfd/configure.ac b/bfd/configure.ac
-index f044616f4d9..c2b2ab1ec68 100644
+index 7fcc5d4a947..f7191d3f30f 100644
 --- a/bfd/configure.ac
 +++ b/bfd/configure.ac
-@@ -274,7 +274,7 @@ changequote(,)dnl
+@@ -276,7 +276,7 @@ changequote(,)dnl
    x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
  changequote([,])dnl
    if test -n "$x"; then
@@ -2009,10 +2009,10 @@ index f044616f4d9..c2b2ab1ec68 100644
  fi
  
 diff --git a/binutils/Makefile.in b/binutils/Makefile.in
-index 2de46be1b30..70a04f1c538 100644
+index 842a6d99b54..037cccde038 100644
 --- a/binutils/Makefile.in
 +++ b/binutils/Makefile.in
-@@ -493,6 +493,7 @@ DEBUGINFOD_LIBS = @DEBUGINFOD_LIBS@
+@@ -495,6 +495,7 @@ DEBUGINFOD_LIBS = @DEBUGINFOD_LIBS@
  DEFS = @DEFS@
  DEMANGLER_NAME = @DEMANGLER_NAME@
  DEPDIR = @DEPDIR@
@@ -2020,7 +2020,7 @@ index 2de46be1b30..70a04f1c538 100644
  DLLTOOL_DEFS = @DLLTOOL_DEFS@
  DSYMUTIL = @DSYMUTIL@
  DUMPBIN = @DUMPBIN@
-@@ -534,6 +535,7 @@ LTLIBICONV = @LTLIBICONV@
+@@ -539,6 +540,7 @@ LTLIBINTL = @LTLIBINTL@
  LTLIBOBJS = @LTLIBOBJS@
  MAINT = @MAINT@
  MAKEINFO = @MAKEINFO@
@@ -2028,7 +2028,7 @@ index 2de46be1b30..70a04f1c538 100644
  MKDIR_P = @MKDIR_P@
  MKINSTALLDIRS = @MKINSTALLDIRS@
  MSGFMT = @MSGFMT@
-@@ -582,6 +584,7 @@ abs_builddir = @abs_builddir@
+@@ -587,6 +589,7 @@ abs_builddir = @abs_builddir@
  abs_srcdir = @abs_srcdir@
  abs_top_builddir = @abs_top_builddir@
  abs_top_srcdir = @abs_top_srcdir@
@@ -2037,10 +2037,10 @@ index 2de46be1b30..70a04f1c538 100644
  ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
  am__include = @am__include@
 diff --git a/binutils/configure b/binutils/configure
-index 4cd196ab74b..dca6f77919d 100755
+index 6f08b6bdcde..03d922de70e 100755
 --- a/binutils/configure
 +++ b/binutils/configure
-@@ -700,8 +700,11 @@ OTOOL
+@@ -704,8 +704,11 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -2052,7 +2052,7 @@ index 4cd196ab74b..dca6f77919d 100755
  OBJDUMP
  LN_S
  NM
-@@ -818,6 +821,7 @@ enable_static
+@@ -822,6 +825,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -2060,7 +2060,7 @@ index 4cd196ab74b..dca6f77919d 100755
  enable_libtool_lock
  enable_plugins
  enable_largefile
-@@ -1523,6 +1527,8 @@ Optional Packages:
+@@ -1529,6 +1533,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -2068,8 +2068,8 @@ index 4cd196ab74b..dca6f77919d 100755
 +                        (or the compiler's sysroot if not specified).
    --with-debuginfod       Enable debuginfo lookups with debuginfod
                            (auto/yes/no)
-   --with-system-zlib      use installed libz
-@@ -4723,8 +4729,8 @@ esac
+   --with-gnu-ld           assume the C compiler uses GNU ld default=no
+@@ -4733,8 +4739,8 @@ esac
  
  
  
@@ -2080,7 +2080,7 @@ index 4cd196ab74b..dca6f77919d 100755
  
  
  
-@@ -4764,7 +4770,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -4774,7 +4780,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -2089,7 +2089,7 @@ index 4cd196ab74b..dca6f77919d 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -5457,8 +5463,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -5467,8 +5473,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -2100,7 +2100,7 @@ index 4cd196ab74b..dca6f77919d 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -5507,6 +5513,80 @@ esac
+@@ -5517,6 +5523,80 @@ esac
  
  
  
@@ -2181,7 +2181,7 @@ index 4cd196ab74b..dca6f77919d 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if ${lt_cv_ld_reload_flag+:} false; then :
-@@ -5523,6 +5603,11 @@ case $reload_flag in
+@@ -5533,6 +5613,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -2193,7 +2193,7 @@ index 4cd196ab74b..dca6f77919d 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -5691,7 +5776,8 @@ mingw* | pw32*)
+@@ -5701,7 +5786,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -2203,7 +2203,7 @@ index 4cd196ab74b..dca6f77919d 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -5845,6 +5931,21 @@ esac
+@@ -5860,6 +5946,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -2225,7 +2225,7 @@ index 4cd196ab74b..dca6f77919d 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -5860,6 +5961,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -5875,6 +5976,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -2383,7 +2383,7 @@ index 4cd196ab74b..dca6f77919d 100755
  plugin_option=
  plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
  for plugin in $plugin_names; do
-@@ -5874,8 +6126,10 @@ for plugin in $plugin_names; do
+@@ -5889,8 +6141,10 @@ for plugin in $plugin_names; do
  done
  
  if test -n "$ac_tool_prefix"; then
@@ -2396,7 +2396,7 @@ index 4cd196ab74b..dca6f77919d 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_AR+:} false; then :
-@@ -5891,7 +6145,7 @@ do
+@@ -5906,7 +6160,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -2405,7 +2405,7 @@ index 4cd196ab74b..dca6f77919d 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -5911,11 +6165,15 @@ $as_echo "no" >&6; }
+@@ -5926,11 +6180,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -2424,7 +2424,7 @@ index 4cd196ab74b..dca6f77919d 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_ac_ct_AR+:} false; then :
-@@ -5931,7 +6189,7 @@ do
+@@ -5946,7 +6204,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -2433,7 +2433,7 @@ index 4cd196ab74b..dca6f77919d 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -5950,6 +6208,10 @@ else
+@@ -5965,6 +6223,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -2444,7 +2444,7 @@ index 4cd196ab74b..dca6f77919d 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -5961,29 +6223,81 @@ ac_tool_warned=yes ;;
+@@ -5976,25 +6238,19 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -2476,17 +2476,13 @@ index 4cd196ab74b..dca6f77919d 100755
 +  rm -f conftest.*
 +: ${AR=ar}
 +: ${AR_FLAGS=cru}
-+
-+
-+
-+
-+
-+
-+
-+
-+
-+
-+
+ 
+ 
+ 
+@@ -6006,6 +6262,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+ 
+ 
+ 
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE support" >&5
 +$as_echo_n "checking for archiver @FILE support... " >&6; }
 +if ${lt_cv_ar_at_file+:} false; then :
@@ -2499,7 +2495,7 @@ index 4cd196ab74b..dca6f77919d 100755
 +int
 +main ()
 +{
- 
++
 +  ;
 +  return 0;
 +}
@@ -2525,23 +2521,30 @@ index 4cd196ab74b..dca6f77919d 100755
 +        fi
 +      fi
 +      rm -f conftest.* libconftest.a
- 
++
 +fi
 +rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
- 
++
 +fi
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_ar_at_file" >&5
 +$as_echo "$lt_cv_ar_at_file" >&6; }
- 
++
 +if test "x$lt_cv_ar_at_file" = xno; then
 +  archiver_list_spec=
 +else
 +  archiver_list_spec=$lt_cv_ar_at_file
 +fi
- 
- 
- 
-@@ -6330,8 +6644,8 @@ esac
++
++
++
++
++
++
++
+ if test -n "$ac_tool_prefix"; then
+   # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
+ set dummy ${ac_tool_prefix}strip; ac_word=$2
+@@ -6345,8 +6659,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -2552,7 +2555,7 @@ index 4cd196ab74b..dca6f77919d 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -6367,6 +6681,7 @@ for ac_symprfx in "" "_"; do
+@@ -6382,6 +6696,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -2560,7 +2563,7 @@ index 4cd196ab74b..dca6f77919d 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -6408,6 +6723,18 @@ _LT_EOF
+@@ -6423,6 +6738,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -2579,7 +2582,7 @@ index 4cd196ab74b..dca6f77919d 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -6419,7 +6746,7 @@ _LT_EOF
+@@ -6434,7 +6761,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -2588,7 +2591,7 @@ index 4cd196ab74b..dca6f77919d 100755
    const char *name;
    void       *address;
  }
-@@ -6445,8 +6772,8 @@ static const void *lt_preloaded_setup() {
+@@ -6460,8 +6787,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -2599,7 +2602,7 @@ index 4cd196ab74b..dca6f77919d 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -6456,8 +6783,8 @@ _LT_EOF
+@@ -6471,8 +6798,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -2610,7 +2613,7 @@ index 4cd196ab74b..dca6f77919d 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -6494,6 +6821,19 @@ else
+@@ -6509,6 +6836,18 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -2626,11 +2629,10 @@ index 4cd196ab74b..dca6f77919d 100755
 +
 +
 +
-+
  
  
  
-@@ -6510,6 +6850,42 @@ fi
+@@ -6525,6 +6864,43 @@ fi
  
  
  
@@ -2638,6 +2640,7 @@ index 4cd196ab74b..dca6f77919d 100755
 +
 +
 +
++
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
 +$as_echo_n "checking for sysroot... " >&6; }
 +
@@ -2673,7 +2676,7 @@ index 4cd196ab74b..dca6f77919d 100755
  
  
  
-@@ -6721,6 +7097,123 @@ esac
+@@ -6736,6 +7112,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -2797,7 +2800,7 @@ index 4cd196ab74b..dca6f77919d 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7284,6 +7777,8 @@ _LT_EOF
+@@ -7299,6 +7792,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -2806,7 +2809,7 @@ index 4cd196ab74b..dca6f77919d 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -7866,8 +8361,6 @@ fi
+@@ -7883,8 +8378,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -2815,7 +2818,7 @@ index 4cd196ab74b..dca6f77919d 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8033,6 +8526,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8050,6 +8543,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -2828,7 +2831,7 @@ index 4cd196ab74b..dca6f77919d 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8095,7 +8594,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8112,7 +8611,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -2837,7 +2840,7 @@ index 4cd196ab74b..dca6f77919d 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8152,13 +8651,17 @@ case $host_os in
+@@ -8169,13 +8668,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -2861,7 +2864,7 @@ index 4cd196ab74b..dca6f77919d 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8219,6 +8722,11 @@ fi
+@@ -8236,6 +8739,11 @@ fi
  
  
  
@@ -2873,7 +2876,7 @@ index 4cd196ab74b..dca6f77919d 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -8569,7 +9077,8 @@ _LT_EOF
+@@ -8586,7 +9094,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -2883,7 +2886,7 @@ index 4cd196ab74b..dca6f77919d 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -8668,12 +9177,12 @@ _LT_EOF
+@@ -8685,12 +9194,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -2898,7 +2901,7 @@ index 4cd196ab74b..dca6f77919d 100755
  	  fi
  	  ;;
  	esac
-@@ -8687,8 +9196,8 @@ _LT_EOF
+@@ -8704,8 +9213,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -2909,7 +2912,7 @@ index 4cd196ab74b..dca6f77919d 100755
        fi
        ;;
  
-@@ -8706,8 +9215,8 @@ _LT_EOF
+@@ -8723,8 +9232,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -2920,7 +2923,7 @@ index 4cd196ab74b..dca6f77919d 100755
        else
  	ld_shlibs=no
        fi
-@@ -8753,8 +9262,8 @@ _LT_EOF
+@@ -8770,8 +9279,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -2931,7 +2934,7 @@ index 4cd196ab74b..dca6f77919d 100755
        else
  	ld_shlibs=no
        fi
-@@ -8884,7 +9393,13 @@ _LT_EOF
+@@ -8901,7 +9410,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -2946,7 +2949,7 @@ index 4cd196ab74b..dca6f77919d 100755
  /* end confdefs.h.  */
  
  int
-@@ -8897,22 +9412,29 @@ main ()
+@@ -8914,22 +9429,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -2989,7 +2992,7 @@ index 4cd196ab74b..dca6f77919d 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -8924,7 +9446,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8941,7 +9463,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -3004,7 +3007,7 @@ index 4cd196ab74b..dca6f77919d 100755
  /* end confdefs.h.  */
  
  int
-@@ -8937,22 +9465,29 @@ main ()
+@@ -8954,22 +9482,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -3047,7 +3050,7 @@ index 4cd196ab74b..dca6f77919d 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -8997,20 +9532,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9014,20 +9549,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -3125,7 +3128,7 @@ index 4cd196ab74b..dca6f77919d 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9071,7 +9649,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9088,7 +9666,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -3134,7 +3137,7 @@ index 4cd196ab74b..dca6f77919d 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9079,7 +9657,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9096,7 +9674,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -3143,7 +3146,7 @@ index 4cd196ab74b..dca6f77919d 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9095,7 +9673,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9112,7 +9690,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -3152,8 +3155,8 @@ index 4cd196ab74b..dca6f77919d 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9119,10 +9697,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
- 	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
+@@ -9136,10 +9714,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+ 	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
 -	  archive_cmds='$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
@@ -3165,7 +3168,7 @@ index 4cd196ab74b..dca6f77919d 100755
  	  ;;
  	esac
        else
-@@ -9201,23 +9779,36 @@ fi
+@@ -9218,23 +9796,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -3210,7 +3213,7 @@ index 4cd196ab74b..dca6f77919d 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9302,7 +9893,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9319,7 +9910,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -3219,7 +3222,7 @@ index 4cd196ab74b..dca6f77919d 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9321,9 +9912,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9338,9 +9929,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -3231,7 +3234,7 @@ index 4cd196ab74b..dca6f77919d 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -9899,8 +10490,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -9916,8 +10507,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -3243,7 +3246,7 @@ index 4cd196ab74b..dca6f77919d 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -9933,13 +10525,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -9950,13 +10542,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -3316,16 +3319,16 @@ index 4cd196ab74b..dca6f77919d 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10817,7 +11467,7 @@ else
+@@ -10858,7 +11508,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 10820 "configure"
+-#line 10861 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -10861,10 +11511,10 @@ else
+@@ -10902,10 +11552,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -3338,16 +3341,16 @@ index 4cd196ab74b..dca6f77919d 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -10923,7 +11573,7 @@ else
+@@ -10964,7 +11614,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 10926 "configure"
+-#line 10967 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -10967,10 +11617,10 @@ else
+@@ -11008,10 +11658,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -3360,7 +3363,7 @@ index 4cd196ab74b..dca6f77919d 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -15555,13 +16205,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -17164,13 +17814,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -3381,7 +3384,7 @@ index 4cd196ab74b..dca6f77919d 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -15576,14 +16233,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -17185,14 +17842,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -3400,7 +3403,7 @@ index 4cd196ab74b..dca6f77919d 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -15616,12 +16276,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -17225,12 +17885,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -3414,7 +3417,7 @@ index 4cd196ab74b..dca6f77919d 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -15676,8 +16336,13 @@ reload_flag \
+@@ -17285,8 +17945,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -3428,7 +3431,7 @@ index 4cd196ab74b..dca6f77919d 100755
  STRIP \
  RANLIB \
  CC \
-@@ -15687,12 +16352,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -17296,12 +17961,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -3444,7 +3447,7 @@ index 4cd196ab74b..dca6f77919d 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -15708,7 +16375,6 @@ no_undefined_flag \
+@@ -17317,7 +17984,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -3452,7 +3455,7 @@ index 4cd196ab74b..dca6f77919d 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -15744,6 +16410,7 @@ module_cmds \
+@@ -17353,6 +18019,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -3460,7 +3463,7 @@ index 4cd196ab74b..dca6f77919d 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -16509,7 +17176,8 @@ $as_echo X"$file" |
+@@ -18126,7 +18793,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -3470,7 +3473,7 @@ index 4cd196ab74b..dca6f77919d 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -16612,19 +17280,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -18229,19 +18897,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -3514,7 +3517,7 @@ index 4cd196ab74b..dca6f77919d 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -16654,6 +17345,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -18271,6 +18962,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -3527,7 +3530,7 @@ index 4cd196ab74b..dca6f77919d 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -16663,6 +17360,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -18280,6 +18977,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -3537,7 +3540,7 @@ index 4cd196ab74b..dca6f77919d 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -16777,12 +17477,12 @@ with_gcc=$GCC
+@@ -18394,12 +19094,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -3553,7 +3556,7 @@ index 4cd196ab74b..dca6f77919d 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -16869,9 +17569,6 @@ inherit_rpath=$inherit_rpath
+@@ -18486,9 +19186,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -3563,7 +3566,7 @@ index 4cd196ab74b..dca6f77919d 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -16887,6 +17584,9 @@ include_expsyms=$lt_include_expsyms
+@@ -18504,6 +19201,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -3573,7 +3576,7 @@ index 4cd196ab74b..dca6f77919d 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -16919,210 +17619,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -18536,210 +19236,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -3948,10 +3951,10 @@ index 4cd196ab74b..dca6f77919d 100755
    chmod +x "$ofile"
  
 diff --git a/gas/Makefile.in b/gas/Makefile.in
-index 427f42dfa3a..ec6615d34e3 100644
+index bc25765cb5b..c481d96a05a 100644
 --- a/gas/Makefile.in
 +++ b/gas/Makefile.in
-@@ -377,6 +377,7 @@ CYGPATH_W = @CYGPATH_W@
+@@ -384,6 +384,7 @@ CYGPATH_W = @CYGPATH_W@
  DATADIRNAME = @DATADIRNAME@
  DEFS = @DEFS@
  DEPDIR = @DEPDIR@
@@ -3959,7 +3962,7 @@ index 427f42dfa3a..ec6615d34e3 100644
  DSYMUTIL = @DSYMUTIL@
  DUMPBIN = @DUMPBIN@
  ECHO_C = @ECHO_C@
-@@ -413,6 +414,7 @@ LN_S = @LN_S@
+@@ -425,6 +426,7 @@ LTLIBINTL = @LTLIBINTL@
  LTLIBOBJS = @LTLIBOBJS@
  MAINT = @MAINT@
  MAKEINFO = @MAKEINFO@
@@ -3967,7 +3970,7 @@ index 427f42dfa3a..ec6615d34e3 100644
  MKDIR_P = @MKDIR_P@
  MKINSTALLDIRS = @MKINSTALLDIRS@
  MSGFMT = @MSGFMT@
-@@ -456,6 +458,7 @@ abs_builddir = @abs_builddir@
+@@ -468,6 +470,7 @@ abs_builddir = @abs_builddir@
  abs_srcdir = @abs_srcdir@
  abs_top_builddir = @abs_top_builddir@
  abs_top_srcdir = @abs_top_srcdir@
@@ -3976,10 +3979,10 @@ index 427f42dfa3a..ec6615d34e3 100644
  ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
  am__include = @am__include@
 diff --git a/gas/configure b/gas/configure
-index db1b80fc907..4bdd9705d8d 100755
+index e4c4bcb69a5..63ee2a1445d 100755
 --- a/gas/configure
 +++ b/gas/configure
-@@ -686,8 +686,11 @@ OTOOL
+@@ -692,8 +692,11 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -3991,7 +3994,7 @@ index db1b80fc907..4bdd9705d8d 100755
  OBJDUMP
  LN_S
  NM
-@@ -804,6 +807,7 @@ enable_static
+@@ -810,6 +813,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -3999,7 +4002,7 @@ index db1b80fc907..4bdd9705d8d 100755
  enable_libtool_lock
  enable_plugins
  enable_largefile
-@@ -1505,6 +1509,8 @@ Optional Packages:
+@@ -1517,6 +1521,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -4007,8 +4010,8 @@ index db1b80fc907..4bdd9705d8d 100755
 +                        (or the compiler's sysroot if not specified).
    --with-cpu=CPU          default cpu variant is CPU (currently only supported
                            on ARC)
-   --with-system-zlib      use installed libz
-@@ -4632,8 +4638,8 @@ esac
+   --with-gnu-ld           assume the C compiler uses GNU ld default=no
+@@ -4652,8 +4658,8 @@ esac
  
  
  
@@ -4019,7 +4022,7 @@ index db1b80fc907..4bdd9705d8d 100755
  
  
  
-@@ -4673,7 +4679,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -4693,7 +4699,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -4028,7 +4031,7 @@ index db1b80fc907..4bdd9705d8d 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -5366,8 +5372,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -5386,8 +5392,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -4039,7 +4042,7 @@ index db1b80fc907..4bdd9705d8d 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -5416,6 +5422,80 @@ esac
+@@ -5436,6 +5442,80 @@ esac
  
  
  
@@ -4120,7 +4123,7 @@ index db1b80fc907..4bdd9705d8d 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if ${lt_cv_ld_reload_flag+:} false; then :
-@@ -5432,6 +5512,11 @@ case $reload_flag in
+@@ -5452,6 +5532,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -4132,7 +4135,7 @@ index db1b80fc907..4bdd9705d8d 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -5600,7 +5685,8 @@ mingw* | pw32*)
+@@ -5620,7 +5705,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -4142,7 +4145,7 @@ index db1b80fc907..4bdd9705d8d 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -5754,6 +5840,21 @@ esac
+@@ -5779,6 +5865,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -4164,7 +4167,7 @@ index db1b80fc907..4bdd9705d8d 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -5769,6 +5870,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -5794,6 +5895,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -4322,7 +4325,7 @@ index db1b80fc907..4bdd9705d8d 100755
  plugin_option=
  plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
  for plugin in $plugin_names; do
-@@ -5783,8 +6035,10 @@ for plugin in $plugin_names; do
+@@ -5808,8 +6060,10 @@ for plugin in $plugin_names; do
  done
  
  if test -n "$ac_tool_prefix"; then
@@ -4335,7 +4338,7 @@ index db1b80fc907..4bdd9705d8d 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_AR+:} false; then :
-@@ -5800,7 +6054,7 @@ do
+@@ -5825,7 +6079,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -4344,7 +4347,7 @@ index db1b80fc907..4bdd9705d8d 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -5820,11 +6074,15 @@ $as_echo "no" >&6; }
+@@ -5845,11 +6099,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -4363,7 +4366,7 @@ index db1b80fc907..4bdd9705d8d 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_ac_ct_AR+:} false; then :
-@@ -5840,7 +6098,7 @@ do
+@@ -5865,7 +6123,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -4372,7 +4375,7 @@ index db1b80fc907..4bdd9705d8d 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -5859,6 +6117,10 @@ else
+@@ -5884,6 +6142,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -4383,7 +4386,7 @@ index db1b80fc907..4bdd9705d8d 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -5870,29 +6132,81 @@ ac_tool_warned=yes ;;
+@@ -5895,29 +6157,81 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -4480,7 +4483,7 @@ index db1b80fc907..4bdd9705d8d 100755
  
  
  
-@@ -6239,8 +6553,8 @@ esac
+@@ -6264,8 +6578,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -4491,7 +4494,7 @@ index db1b80fc907..4bdd9705d8d 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -6276,6 +6590,7 @@ for ac_symprfx in "" "_"; do
+@@ -6301,6 +6615,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -4499,7 +4502,7 @@ index db1b80fc907..4bdd9705d8d 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -6317,6 +6632,18 @@ _LT_EOF
+@@ -6342,6 +6657,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -4518,7 +4521,7 @@ index db1b80fc907..4bdd9705d8d 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -6328,7 +6655,7 @@ _LT_EOF
+@@ -6353,7 +6680,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -4527,7 +4530,7 @@ index db1b80fc907..4bdd9705d8d 100755
    const char *name;
    void       *address;
  }
-@@ -6354,8 +6681,8 @@ static const void *lt_preloaded_setup() {
+@@ -6379,8 +6706,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -4538,7 +4541,7 @@ index db1b80fc907..4bdd9705d8d 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -6365,8 +6692,8 @@ _LT_EOF
+@@ -6390,8 +6717,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -4549,7 +4552,7 @@ index db1b80fc907..4bdd9705d8d 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -6403,6 +6730,19 @@ else
+@@ -6428,6 +6755,19 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -4569,7 +4572,7 @@ index db1b80fc907..4bdd9705d8d 100755
  
  
  
-@@ -6419,6 +6759,42 @@ fi
+@@ -6444,6 +6784,42 @@ fi
  
  
  
@@ -4612,7 +4615,7 @@ index db1b80fc907..4bdd9705d8d 100755
  
  
  
-@@ -6630,6 +7006,123 @@ esac
+@@ -6655,6 +7031,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -4736,7 +4739,7 @@ index db1b80fc907..4bdd9705d8d 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7193,6 +7686,8 @@ _LT_EOF
+@@ -7218,6 +7711,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -4745,7 +4748,7 @@ index db1b80fc907..4bdd9705d8d 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -7775,8 +8270,6 @@ fi
+@@ -7802,8 +8297,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -4754,7 +4757,7 @@ index db1b80fc907..4bdd9705d8d 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -7942,6 +8435,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -7969,6 +8462,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -4767,7 +4770,7 @@ index db1b80fc907..4bdd9705d8d 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8004,7 +8503,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8031,7 +8530,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -4776,7 +4779,7 @@ index db1b80fc907..4bdd9705d8d 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8061,13 +8560,17 @@ case $host_os in
+@@ -8088,13 +8587,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -4800,7 +4803,7 @@ index db1b80fc907..4bdd9705d8d 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8128,6 +8631,11 @@ fi
+@@ -8155,6 +8658,11 @@ fi
  
  
  
@@ -4812,7 +4815,7 @@ index db1b80fc907..4bdd9705d8d 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -8478,7 +8986,8 @@ _LT_EOF
+@@ -8505,7 +9013,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -4822,7 +4825,7 @@ index db1b80fc907..4bdd9705d8d 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -8577,12 +9086,12 @@ _LT_EOF
+@@ -8604,12 +9113,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -4837,7 +4840,7 @@ index db1b80fc907..4bdd9705d8d 100755
  	  fi
  	  ;;
  	esac
-@@ -8596,8 +9105,8 @@ _LT_EOF
+@@ -8623,8 +9132,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -4848,7 +4851,7 @@ index db1b80fc907..4bdd9705d8d 100755
        fi
        ;;
  
-@@ -8615,8 +9124,8 @@ _LT_EOF
+@@ -8642,8 +9151,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -4859,7 +4862,7 @@ index db1b80fc907..4bdd9705d8d 100755
        else
  	ld_shlibs=no
        fi
-@@ -8662,8 +9171,8 @@ _LT_EOF
+@@ -8689,8 +9198,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -4870,7 +4873,7 @@ index db1b80fc907..4bdd9705d8d 100755
        else
  	ld_shlibs=no
        fi
-@@ -8793,7 +9302,13 @@ _LT_EOF
+@@ -8820,7 +9329,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -4885,7 +4888,7 @@ index db1b80fc907..4bdd9705d8d 100755
  /* end confdefs.h.  */
  
  int
-@@ -8806,22 +9321,29 @@ main ()
+@@ -8833,22 +9348,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -4928,7 +4931,7 @@ index db1b80fc907..4bdd9705d8d 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -8833,7 +9355,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8860,7 +9382,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -4943,7 +4946,7 @@ index db1b80fc907..4bdd9705d8d 100755
  /* end confdefs.h.  */
  
  int
-@@ -8846,22 +9374,29 @@ main ()
+@@ -8873,22 +9401,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -4986,7 +4989,7 @@ index db1b80fc907..4bdd9705d8d 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -8906,20 +9441,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8933,20 +9468,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -5064,7 +5067,7 @@ index db1b80fc907..4bdd9705d8d 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -8980,7 +9558,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9007,7 +9585,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -5073,7 +5076,7 @@ index db1b80fc907..4bdd9705d8d 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -8988,7 +9566,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9015,7 +9593,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -5082,7 +5085,7 @@ index db1b80fc907..4bdd9705d8d 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9004,7 +9582,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9031,7 +9609,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -5091,8 +5094,8 @@ index db1b80fc907..4bdd9705d8d 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9028,10 +9606,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
- 	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
+@@ -9055,10 +9633,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+ 	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
 -	  archive_cmds='$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
@@ -5104,7 +5107,7 @@ index db1b80fc907..4bdd9705d8d 100755
  	  ;;
  	esac
        else
-@@ -9110,23 +9688,36 @@ fi
+@@ -9137,23 +9715,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -5149,7 +5152,7 @@ index db1b80fc907..4bdd9705d8d 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9211,7 +9802,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9238,7 +9829,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -5158,7 +5161,7 @@ index db1b80fc907..4bdd9705d8d 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9230,9 +9821,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9257,9 +9848,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -5170,7 +5173,7 @@ index db1b80fc907..4bdd9705d8d 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -9808,8 +10399,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -9835,8 +10426,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -5182,7 +5185,7 @@ index db1b80fc907..4bdd9705d8d 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -9842,13 +10434,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -9869,13 +10461,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -5255,16 +5258,16 @@ index db1b80fc907..4bdd9705d8d 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10726,7 +11376,7 @@ else
+@@ -10777,7 +11427,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 10729 "configure"
+-#line 10780 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -10770,10 +11420,10 @@ else
+@@ -10821,10 +11471,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -5277,16 +5280,16 @@ index db1b80fc907..4bdd9705d8d 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -10832,7 +11482,7 @@ else
+@@ -10883,7 +11533,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 10835 "configure"
+-#line 10886 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -10876,10 +11526,10 @@ else
+@@ -10927,10 +11577,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -5299,7 +5302,7 @@ index db1b80fc907..4bdd9705d8d 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -15132,13 +15782,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -17080,13 +17730,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -5320,7 +5323,7 @@ index db1b80fc907..4bdd9705d8d 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -15153,14 +15810,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -17101,14 +17758,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -5339,7 +5342,7 @@ index db1b80fc907..4bdd9705d8d 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -15193,12 +15853,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -17141,12 +17801,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -5353,7 +5356,7 @@ index db1b80fc907..4bdd9705d8d 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -15253,8 +15913,13 @@ reload_flag \
+@@ -17201,8 +17861,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -5367,7 +5370,7 @@ index db1b80fc907..4bdd9705d8d 100755
  STRIP \
  RANLIB \
  CC \
-@@ -15264,12 +15929,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -17212,12 +17877,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -5383,7 +5386,7 @@ index db1b80fc907..4bdd9705d8d 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -15285,7 +15952,6 @@ no_undefined_flag \
+@@ -17233,7 +17900,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -5391,7 +5394,7 @@ index db1b80fc907..4bdd9705d8d 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -15321,6 +15987,7 @@ module_cmds \
+@@ -17269,6 +17935,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -5399,7 +5402,7 @@ index db1b80fc907..4bdd9705d8d 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -16093,7 +16760,8 @@ $as_echo X"$file" |
+@@ -18049,7 +18716,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -5409,7 +5412,7 @@ index db1b80fc907..4bdd9705d8d 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -16196,19 +16864,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -18152,19 +18820,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -5453,7 +5456,7 @@ index db1b80fc907..4bdd9705d8d 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -16238,6 +16929,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -18194,6 +18885,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -5466,7 +5469,7 @@ index db1b80fc907..4bdd9705d8d 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -16247,6 +16944,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -18203,6 +18900,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -5476,7 +5479,7 @@ index db1b80fc907..4bdd9705d8d 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -16361,12 +17061,12 @@ with_gcc=$GCC
+@@ -18317,12 +19017,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -5492,7 +5495,7 @@ index db1b80fc907..4bdd9705d8d 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -16453,9 +17153,6 @@ inherit_rpath=$inherit_rpath
+@@ -18409,9 +19109,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -5502,7 +5505,7 @@ index db1b80fc907..4bdd9705d8d 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -16471,6 +17168,9 @@ include_expsyms=$lt_include_expsyms
+@@ -18427,6 +19124,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -5512,7 +5515,7 @@ index db1b80fc907..4bdd9705d8d 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -16503,210 +17203,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -18459,210 +19159,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -5887,10 +5890,10 @@ index db1b80fc907..4bdd9705d8d 100755
    chmod +x "$ofile"
  
 diff --git a/gprof/Makefile.in b/gprof/Makefile.in
-index c9914e46d7d..1857eb8b5a8 100644
+index a7398231030..fc7a3d78db0 100644
 --- a/gprof/Makefile.in
 +++ b/gprof/Makefile.in
-@@ -321,6 +321,7 @@ CYGPATH_W = @CYGPATH_W@
+@@ -327,6 +327,7 @@ CYGPATH_W = @CYGPATH_W@
  DATADIRNAME = @DATADIRNAME@
  DEFS = @DEFS@
  DEPDIR = @DEPDIR@
@@ -5898,7 +5901,7 @@ index c9914e46d7d..1857eb8b5a8 100644
  DSYMUTIL = @DSYMUTIL@
  DUMPBIN = @DUMPBIN@
  ECHO_C = @ECHO_C@
-@@ -352,6 +353,7 @@ LN_S = @LN_S@
+@@ -363,6 +364,7 @@ LTLIBINTL = @LTLIBINTL@
  LTLIBOBJS = @LTLIBOBJS@
  MAINT = @MAINT@
  MAKEINFO = @MAKEINFO@
@@ -5906,7 +5909,7 @@ index c9914e46d7d..1857eb8b5a8 100644
  MKDIR_P = @MKDIR_P@
  MKINSTALLDIRS = @MKINSTALLDIRS@
  MSGFMT = @MSGFMT@
-@@ -387,6 +389,7 @@ abs_builddir = @abs_builddir@
+@@ -398,6 +400,7 @@ abs_builddir = @abs_builddir@
  abs_srcdir = @abs_srcdir@
  abs_top_builddir = @abs_top_builddir@
  abs_top_srcdir = @abs_top_srcdir@
@@ -5915,10 +5918,10 @@ index c9914e46d7d..1857eb8b5a8 100644
  ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
  am__include = @am__include@
 diff --git a/gprof/configure b/gprof/configure
-index 98ba6d7f5b3..113505b963c 100755
+index 6d5c3612d3d..b2d9125ab60 100755
 --- a/gprof/configure
 +++ b/gprof/configure
-@@ -663,8 +663,11 @@ OTOOL
+@@ -669,8 +669,11 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -5930,7 +5933,7 @@ index 98ba6d7f5b3..113505b963c 100755
  OBJDUMP
  LN_S
  NM
-@@ -781,6 +784,7 @@ enable_static
+@@ -787,6 +790,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -5938,16 +5941,16 @@ index 98ba6d7f5b3..113505b963c 100755
  enable_libtool_lock
  enable_plugins
  enable_largefile
-@@ -1443,6 +1447,8 @@ Optional Packages:
-   --with-pic              try to use only PIC/non-PIC objects [default=use
-                           both]
-   --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
+@@ -1462,6 +1466,8 @@ Optional Packages:
+   --with-libintl-prefix[=DIR]  search for libintl in DIR/include and DIR/lib
+   --without-libintl-prefix     don't search for libintl in includedir and libdir
+   --with-libintl-type=TYPE     type of library to search for (auto/static/shared)
 +  --with-libtool-sysroot=DIR Search for dependent libraries within DIR
 +                        (or the compiler's sysroot if not specified).
  
  Some influential environment variables:
    CC          C compiler command
-@@ -4510,8 +4516,8 @@ esac
+@@ -4530,8 +4536,8 @@ esac
  
  
  
@@ -5958,7 +5961,7 @@ index 98ba6d7f5b3..113505b963c 100755
  
  
  
-@@ -4551,7 +4557,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -4571,7 +4577,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -5967,7 +5970,7 @@ index 98ba6d7f5b3..113505b963c 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -5244,8 +5250,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -5264,8 +5270,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -5978,7 +5981,7 @@ index 98ba6d7f5b3..113505b963c 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -5294,6 +5300,80 @@ esac
+@@ -5314,6 +5320,80 @@ esac
  
  
  
@@ -6059,7 +6062,7 @@ index 98ba6d7f5b3..113505b963c 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if ${lt_cv_ld_reload_flag+:} false; then :
-@@ -5310,6 +5390,11 @@ case $reload_flag in
+@@ -5330,6 +5410,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -6071,7 +6074,7 @@ index 98ba6d7f5b3..113505b963c 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -5478,7 +5563,8 @@ mingw* | pw32*)
+@@ -5498,7 +5583,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -6081,7 +6084,7 @@ index 98ba6d7f5b3..113505b963c 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -5632,6 +5718,21 @@ esac
+@@ -5657,6 +5743,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -6103,7 +6106,7 @@ index 98ba6d7f5b3..113505b963c 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -5647,6 +5748,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -5672,6 +5773,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -6261,7 +6264,7 @@ index 98ba6d7f5b3..113505b963c 100755
  plugin_option=
  plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
  for plugin in $plugin_names; do
-@@ -5661,8 +5913,10 @@ for plugin in $plugin_names; do
+@@ -5686,8 +5938,10 @@ for plugin in $plugin_names; do
  done
  
  if test -n "$ac_tool_prefix"; then
@@ -6274,7 +6277,7 @@ index 98ba6d7f5b3..113505b963c 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_AR+:} false; then :
-@@ -5678,7 +5932,7 @@ do
+@@ -5703,7 +5957,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -6283,7 +6286,7 @@ index 98ba6d7f5b3..113505b963c 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -5698,11 +5952,15 @@ $as_echo "no" >&6; }
+@@ -5723,11 +5977,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -6302,7 +6305,7 @@ index 98ba6d7f5b3..113505b963c 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_ac_ct_AR+:} false; then :
-@@ -5718,7 +5976,7 @@ do
+@@ -5743,7 +6001,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -6311,7 +6314,7 @@ index 98ba6d7f5b3..113505b963c 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -5737,6 +5995,10 @@ else
+@@ -5762,6 +6020,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -6322,7 +6325,7 @@ index 98ba6d7f5b3..113505b963c 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -5748,25 +6010,19 @@ ac_tool_warned=yes ;;
+@@ -5773,25 +6035,19 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -6357,7 +6360,7 @@ index 98ba6d7f5b3..113505b963c 100755
  
  
  
-@@ -5778,6 +6034,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+@@ -5803,6 +6059,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
  
  
  
@@ -6422,7 +6425,7 @@ index 98ba6d7f5b3..113505b963c 100755
  if test -n "$ac_tool_prefix"; then
    # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
  set dummy ${ac_tool_prefix}strip; ac_word=$2
-@@ -6117,8 +6431,8 @@ esac
+@@ -6142,8 +6456,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -6433,7 +6436,7 @@ index 98ba6d7f5b3..113505b963c 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -6154,6 +6468,7 @@ for ac_symprfx in "" "_"; do
+@@ -6179,6 +6493,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -6441,7 +6444,7 @@ index 98ba6d7f5b3..113505b963c 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -6195,6 +6510,18 @@ _LT_EOF
+@@ -6220,6 +6535,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -6460,7 +6463,7 @@ index 98ba6d7f5b3..113505b963c 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -6206,7 +6533,7 @@ _LT_EOF
+@@ -6231,7 +6558,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -6469,7 +6472,7 @@ index 98ba6d7f5b3..113505b963c 100755
    const char *name;
    void       *address;
  }
-@@ -6232,8 +6559,8 @@ static const void *lt_preloaded_setup() {
+@@ -6257,8 +6584,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -6480,7 +6483,7 @@ index 98ba6d7f5b3..113505b963c 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -6243,8 +6570,8 @@ _LT_EOF
+@@ -6268,8 +6595,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -6491,7 +6494,7 @@ index 98ba6d7f5b3..113505b963c 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -6281,6 +6608,18 @@ else
+@@ -6306,6 +6633,18 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -6510,7 +6513,7 @@ index 98ba6d7f5b3..113505b963c 100755
  
  
  
-@@ -6297,6 +6636,43 @@ fi
+@@ -6322,6 +6661,43 @@ fi
  
  
  
@@ -6554,7 +6557,7 @@ index 98ba6d7f5b3..113505b963c 100755
  
  
  
-@@ -6508,6 +6884,123 @@ esac
+@@ -6533,6 +6909,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -6678,7 +6681,7 @@ index 98ba6d7f5b3..113505b963c 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7071,6 +7564,8 @@ _LT_EOF
+@@ -7096,6 +7589,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -6687,7 +6690,7 @@ index 98ba6d7f5b3..113505b963c 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -7653,8 +8148,6 @@ fi
+@@ -7680,8 +8175,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -6696,7 +6699,7 @@ index 98ba6d7f5b3..113505b963c 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -7820,6 +8313,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -7847,6 +8340,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -6709,7 +6712,7 @@ index 98ba6d7f5b3..113505b963c 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -7882,7 +8381,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -7909,7 +8408,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -6718,7 +6721,7 @@ index 98ba6d7f5b3..113505b963c 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -7939,13 +8438,17 @@ case $host_os in
+@@ -7966,13 +8465,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -6742,7 +6745,7 @@ index 98ba6d7f5b3..113505b963c 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8006,6 +8509,11 @@ fi
+@@ -8033,6 +8536,11 @@ fi
  
  
  
@@ -6754,7 +6757,7 @@ index 98ba6d7f5b3..113505b963c 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -8356,7 +8864,8 @@ _LT_EOF
+@@ -8383,7 +8891,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -6764,7 +6767,7 @@ index 98ba6d7f5b3..113505b963c 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -8455,12 +8964,12 @@ _LT_EOF
+@@ -8482,12 +8991,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -6779,7 +6782,7 @@ index 98ba6d7f5b3..113505b963c 100755
  	  fi
  	  ;;
  	esac
-@@ -8474,8 +8983,8 @@ _LT_EOF
+@@ -8501,8 +9010,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -6790,7 +6793,7 @@ index 98ba6d7f5b3..113505b963c 100755
        fi
        ;;
  
-@@ -8493,8 +9002,8 @@ _LT_EOF
+@@ -8520,8 +9029,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -6801,7 +6804,7 @@ index 98ba6d7f5b3..113505b963c 100755
        else
  	ld_shlibs=no
        fi
-@@ -8540,8 +9049,8 @@ _LT_EOF
+@@ -8567,8 +9076,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -6812,7 +6815,7 @@ index 98ba6d7f5b3..113505b963c 100755
        else
  	ld_shlibs=no
        fi
-@@ -8671,7 +9180,13 @@ _LT_EOF
+@@ -8698,7 +9207,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -6827,7 +6830,7 @@ index 98ba6d7f5b3..113505b963c 100755
  /* end confdefs.h.  */
  
  int
-@@ -8684,22 +9199,29 @@ main ()
+@@ -8711,22 +9226,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -6870,7 +6873,7 @@ index 98ba6d7f5b3..113505b963c 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -8711,7 +9233,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8738,7 +9260,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -6885,7 +6888,7 @@ index 98ba6d7f5b3..113505b963c 100755
  /* end confdefs.h.  */
  
  int
-@@ -8724,22 +9252,29 @@ main ()
+@@ -8751,22 +9279,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -6928,7 +6931,7 @@ index 98ba6d7f5b3..113505b963c 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -8784,20 +9319,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8811,20 +9346,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -7006,7 +7009,7 @@ index 98ba6d7f5b3..113505b963c 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -8858,7 +9436,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8885,7 +9463,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -7015,7 +7018,7 @@ index 98ba6d7f5b3..113505b963c 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -8866,7 +9444,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8893,7 +9471,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -7024,7 +7027,7 @@ index 98ba6d7f5b3..113505b963c 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -8882,7 +9460,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8909,7 +9487,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -7033,8 +7036,8 @@ index 98ba6d7f5b3..113505b963c 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -8906,10 +9484,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
- 	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
+@@ -8933,10 +9511,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+ 	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
 -	  archive_cmds='$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
@@ -7046,7 +7049,7 @@ index 98ba6d7f5b3..113505b963c 100755
  	  ;;
  	esac
        else
-@@ -8988,23 +9566,36 @@ fi
+@@ -9015,23 +9593,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -7091,7 +7094,7 @@ index 98ba6d7f5b3..113505b963c 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9089,7 +9680,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9116,7 +9707,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -7100,7 +7103,7 @@ index 98ba6d7f5b3..113505b963c 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9108,9 +9699,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9135,9 +9726,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -7112,7 +7115,7 @@ index 98ba6d7f5b3..113505b963c 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -9686,8 +10277,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -9713,8 +10304,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -7124,7 +7127,7 @@ index 98ba6d7f5b3..113505b963c 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -9720,13 +10312,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -9747,13 +10339,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -7197,16 +7200,16 @@ index 98ba6d7f5b3..113505b963c 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10604,7 +11254,7 @@ else
+@@ -10655,7 +11305,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 10607 "configure"
+-#line 10658 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -10648,10 +11298,10 @@ else
+@@ -10699,10 +11349,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -7219,16 +7222,16 @@ index 98ba6d7f5b3..113505b963c 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -10710,7 +11360,7 @@ else
+@@ -10761,7 +11411,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 10713 "configure"
+-#line 10764 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -10754,10 +11404,10 @@ else
+@@ -10805,10 +11455,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -7241,7 +7244,7 @@ index 98ba6d7f5b3..113505b963c 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -12795,13 +13445,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -14728,13 +15378,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -7262,7 +7265,7 @@ index 98ba6d7f5b3..113505b963c 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -12816,14 +13473,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -14749,14 +15406,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -7281,7 +7284,7 @@ index 98ba6d7f5b3..113505b963c 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -12856,12 +13516,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -14789,12 +15449,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -7295,7 +7298,7 @@ index 98ba6d7f5b3..113505b963c 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -12916,8 +13576,13 @@ reload_flag \
+@@ -14849,8 +15509,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -7309,7 +7312,7 @@ index 98ba6d7f5b3..113505b963c 100755
  STRIP \
  RANLIB \
  CC \
-@@ -12927,12 +13592,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -14860,12 +15525,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -7325,7 +7328,7 @@ index 98ba6d7f5b3..113505b963c 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -12948,7 +13615,6 @@ no_undefined_flag \
+@@ -14881,7 +15548,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -7333,7 +7336,7 @@ index 98ba6d7f5b3..113505b963c 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -12984,6 +13650,7 @@ module_cmds \
+@@ -14917,6 +15583,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -7341,7 +7344,7 @@ index 98ba6d7f5b3..113505b963c 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -13749,7 +14416,8 @@ $as_echo X"$file" |
+@@ -15690,7 +16357,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -7351,7 +7354,7 @@ index 98ba6d7f5b3..113505b963c 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -13852,19 +14520,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -15793,19 +16461,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -7395,7 +7398,7 @@ index 98ba6d7f5b3..113505b963c 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -13894,6 +14585,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -15835,6 +16526,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -7408,7 +7411,7 @@ index 98ba6d7f5b3..113505b963c 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -13903,6 +14600,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -15844,6 +16541,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -7418,7 +7421,7 @@ index 98ba6d7f5b3..113505b963c 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -14017,12 +14717,12 @@ with_gcc=$GCC
+@@ -15958,12 +16658,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -7434,7 +7437,7 @@ index 98ba6d7f5b3..113505b963c 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -14109,9 +14809,6 @@ inherit_rpath=$inherit_rpath
+@@ -16050,9 +16750,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -7444,7 +7447,7 @@ index 98ba6d7f5b3..113505b963c 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -14127,6 +14824,9 @@ include_expsyms=$lt_include_expsyms
+@@ -16068,6 +16765,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -7454,7 +7457,7 @@ index 98ba6d7f5b3..113505b963c 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -14159,210 +14859,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -16100,210 +16800,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -7829,7 +7832,7 @@ index 98ba6d7f5b3..113505b963c 100755
    chmod +x "$ofile"
  
 diff --git a/gprofng/Makefile.in b/gprofng/Makefile.in
-index 06b563cb8ef..b6ae509fd6c 100644
+index dbc868191b7..1ca6dd01f58 100644
 --- a/gprofng/Makefile.in
 +++ b/gprofng/Makefile.in
 @@ -253,6 +253,7 @@ CXXFLAGS = @CXXFLAGS@
@@ -7840,7 +7843,7 @@ index 06b563cb8ef..b6ae509fd6c 100644
  DSYMUTIL = @DSYMUTIL@
  DUMPBIN = @DUMPBIN@
  ECHO_C = @ECHO_C@
-@@ -290,6 +291,7 @@ LN_S = @LN_S@
+@@ -289,6 +290,7 @@ LN_S = @LN_S@
  LTLIBOBJS = @LTLIBOBJS@
  MAINT = @MAINT@
  MAKEINFO = @MAKEINFO@
@@ -7849,10 +7852,10 @@ index 06b563cb8ef..b6ae509fd6c 100644
  NM = @NM@
  NMEDIT = @NMEDIT@
 diff --git a/gprofng/configure b/gprofng/configure
-index 69eb806a17d..9e97e334544 100755
+index 6dfafb4e483..2dc8702f339 100755
 --- a/gprofng/configure
 +++ b/gprofng/configure
-@@ -672,6 +672,8 @@ OTOOL
+@@ -671,6 +671,8 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -7861,7 +7864,7 @@ index 69eb806a17d..9e97e334544 100755
  OBJDUMP
  LN_S
  NM
-@@ -802,6 +804,7 @@ enable_static
+@@ -801,6 +803,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -7869,7 +7872,7 @@ index 69eb806a17d..9e97e334544 100755
  enable_libtool_lock
  enable_werror_always
  enable_gprofng_tools
-@@ -1465,6 +1468,8 @@ Optional Packages:
+@@ -1464,6 +1467,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -7878,7 +7881,7 @@ index 69eb806a17d..9e97e334544 100755
    --with-jdk=PATH         specify prefix directory for installed JDK.
    --with-system-zlib      use installed libz
  
-@@ -6156,8 +6161,8 @@ esac
+@@ -6152,8 +6157,8 @@ esac
  
  
  
@@ -7889,7 +7892,7 @@ index 69eb806a17d..9e97e334544 100755
  
  
  
-@@ -6197,7 +6202,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -6193,7 +6198,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -7898,7 +7901,7 @@ index 69eb806a17d..9e97e334544 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -6890,8 +6895,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -6886,8 +6891,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -7909,7 +7912,7 @@ index 69eb806a17d..9e97e334544 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -6940,6 +6945,80 @@ esac
+@@ -6936,6 +6941,80 @@ esac
  
  
  
@@ -7990,7 +7993,7 @@ index 69eb806a17d..9e97e334544 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if ${lt_cv_ld_reload_flag+:} false; then :
-@@ -6956,6 +7035,11 @@ case $reload_flag in
+@@ -6952,6 +7031,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -8002,7 +8005,7 @@ index 69eb806a17d..9e97e334544 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -7124,7 +7208,8 @@ mingw* | pw32*)
+@@ -7120,7 +7204,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -8012,7 +8015,7 @@ index 69eb806a17d..9e97e334544 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -7278,6 +7363,21 @@ esac
+@@ -7279,6 +7364,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -8034,7 +8037,7 @@ index 69eb806a17d..9e97e334544 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -7293,6 +7393,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -7294,6 +7394,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -8192,7 +8195,7 @@ index 69eb806a17d..9e97e334544 100755
  plugin_option=
  plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
  for plugin in $plugin_names; do
-@@ -7307,8 +7558,10 @@ for plugin in $plugin_names; do
+@@ -7308,8 +7559,10 @@ for plugin in $plugin_names; do
  done
  
  if test -n "$ac_tool_prefix"; then
@@ -8205,7 +8208,7 @@ index 69eb806a17d..9e97e334544 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_AR+:} false; then :
-@@ -7324,7 +7577,7 @@ do
+@@ -7325,7 +7578,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -8214,7 +8217,7 @@ index 69eb806a17d..9e97e334544 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -7344,11 +7597,15 @@ $as_echo "no" >&6; }
+@@ -7345,11 +7598,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -8233,7 +8236,7 @@ index 69eb806a17d..9e97e334544 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_ac_ct_AR+:} false; then :
-@@ -7364,7 +7621,7 @@ do
+@@ -7365,7 +7622,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -8242,7 +8245,7 @@ index 69eb806a17d..9e97e334544 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -7383,6 +7640,10 @@ else
+@@ -7384,6 +7641,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -8253,7 +8256,7 @@ index 69eb806a17d..9e97e334544 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -7394,29 +7655,81 @@ ac_tool_warned=yes ;;
+@@ -7395,25 +7656,19 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -8285,16 +8288,12 @@ index 69eb806a17d..9e97e334544 100755
 +  rm -f conftest.*
 +: ${AR=ar}
 +: ${AR_FLAGS=cru}
-+
-+
-+
-+
-+
-+
-+
  
  
  
+@@ -7425,6 +7680,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+ 
+ 
  
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE support" >&5
 +$as_echo_n "checking for archiver @FILE support... " >&6; }
@@ -8347,10 +8346,17 @@ index 69eb806a17d..9e97e334544 100755
 +else
 +  archiver_list_spec=$lt_cv_ar_at_file
 +fi
- 
- 
- 
-@@ -7763,8 +8076,8 @@ esac
++
++
++
++
++
++
++
+ if test -n "$ac_tool_prefix"; then
+   # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
+ set dummy ${ac_tool_prefix}strip; ac_word=$2
+@@ -7764,8 +8077,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -8361,7 +8367,7 @@ index 69eb806a17d..9e97e334544 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -7800,6 +8113,7 @@ for ac_symprfx in "" "_"; do
+@@ -7801,6 +8114,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -8369,7 +8375,7 @@ index 69eb806a17d..9e97e334544 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -7841,6 +8155,18 @@ _LT_EOF
+@@ -7842,6 +8156,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -8388,7 +8394,7 @@ index 69eb806a17d..9e97e334544 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -7852,7 +8178,7 @@ _LT_EOF
+@@ -7853,7 +8179,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -8397,7 +8403,7 @@ index 69eb806a17d..9e97e334544 100755
    const char *name;
    void       *address;
  }
-@@ -7878,8 +8204,8 @@ static const void *lt_preloaded_setup() {
+@@ -7879,8 +8205,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -8408,7 +8414,7 @@ index 69eb806a17d..9e97e334544 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -7889,8 +8215,8 @@ _LT_EOF
+@@ -7890,8 +8216,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -8419,7 +8425,7 @@ index 69eb806a17d..9e97e334544 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7927,6 +8253,13 @@ else
+@@ -7928,6 +8254,14 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -8430,10 +8436,11 @@ index 69eb806a17d..9e97e334544 100755
 +  nm_file_list_spec='@'
 +fi
 +
++
  
  
  
-@@ -7946,6 +8279,48 @@ fi
+@@ -7946,6 +8280,47 @@ fi
  
  
  
@@ -8477,12 +8484,11 @@ index 69eb806a17d..9e97e334544 100755
 + { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
 +$as_echo "${lt_sysroot:-no}" >&6; }
 +
-+
 +
  
  
- # Check whether --enable-libtool-lock was given.
-@@ -8154,6 +8529,123 @@ esac
+ 
+@@ -8155,6 +8530,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -8606,7 +8612,7 @@ index 69eb806a17d..9e97e334544 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -8717,6 +9209,8 @@ _LT_EOF
+@@ -8718,6 +9210,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -8615,7 +8621,7 @@ index 69eb806a17d..9e97e334544 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -8785,6 +9279,16 @@ done
+@@ -8788,6 +9282,16 @@ done
  
  
  
@@ -8632,7 +8638,7 @@ index 69eb806a17d..9e97e334544 100755
  
  
  # Set options
-@@ -9270,8 +9774,6 @@ fi
+@@ -9273,8 +9777,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -8641,7 +8647,7 @@ index 69eb806a17d..9e97e334544 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -9437,6 +9939,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -9440,6 +9942,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -8654,7 +8660,7 @@ index 69eb806a17d..9e97e334544 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -9499,7 +10007,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -9502,7 +10010,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -8663,7 +8669,7 @@ index 69eb806a17d..9e97e334544 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -9556,13 +10064,17 @@ case $host_os in
+@@ -9559,13 +10067,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -8687,7 +8693,7 @@ index 69eb806a17d..9e97e334544 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -9623,6 +10135,11 @@ fi
+@@ -9626,6 +10138,11 @@ fi
  
  
  
@@ -8699,7 +8705,7 @@ index 69eb806a17d..9e97e334544 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -9973,7 +10490,8 @@ _LT_EOF
+@@ -9976,7 +10493,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -8709,7 +8715,7 @@ index 69eb806a17d..9e97e334544 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -10072,12 +10590,12 @@ _LT_EOF
+@@ -10075,12 +10593,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -8724,7 +8730,7 @@ index 69eb806a17d..9e97e334544 100755
  	  fi
  	  ;;
  	esac
-@@ -10091,8 +10609,8 @@ _LT_EOF
+@@ -10094,8 +10612,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -8735,7 +8741,7 @@ index 69eb806a17d..9e97e334544 100755
        fi
        ;;
  
-@@ -10110,8 +10628,8 @@ _LT_EOF
+@@ -10113,8 +10631,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -8746,7 +8752,7 @@ index 69eb806a17d..9e97e334544 100755
        else
  	ld_shlibs=no
        fi
-@@ -10157,8 +10675,8 @@ _LT_EOF
+@@ -10160,8 +10678,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -8757,7 +8763,7 @@ index 69eb806a17d..9e97e334544 100755
        else
  	ld_shlibs=no
        fi
-@@ -10288,7 +10806,13 @@ _LT_EOF
+@@ -10291,7 +10809,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -8772,7 +8778,7 @@ index 69eb806a17d..9e97e334544 100755
  /* end confdefs.h.  */
  
  int
-@@ -10301,22 +10825,29 @@ main ()
+@@ -10304,22 +10828,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -8815,7 +8821,7 @@ index 69eb806a17d..9e97e334544 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -10328,7 +10859,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10331,7 +10862,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -8830,7 +8836,7 @@ index 69eb806a17d..9e97e334544 100755
  /* end confdefs.h.  */
  
  int
-@@ -10341,22 +10878,29 @@ main ()
+@@ -10344,22 +10881,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -8873,7 +8879,7 @@ index 69eb806a17d..9e97e334544 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -10401,20 +10945,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10404,20 +10948,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -8951,7 +8957,7 @@ index 69eb806a17d..9e97e334544 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -10475,7 +11062,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10478,7 +11065,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -8960,7 +8966,7 @@ index 69eb806a17d..9e97e334544 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -10483,7 +11070,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10486,7 +11073,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -8969,7 +8975,7 @@ index 69eb806a17d..9e97e334544 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -10499,7 +11086,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10502,7 +11089,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -8978,8 +8984,8 @@ index 69eb806a17d..9e97e334544 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -10523,10 +11110,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
- 	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
+@@ -10526,10 +11113,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+ 	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
 -	  archive_cmds='$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
@@ -8991,7 +8997,7 @@ index 69eb806a17d..9e97e334544 100755
  	  ;;
  	esac
        else
-@@ -10605,23 +11192,36 @@ fi
+@@ -10608,23 +11195,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -9036,7 +9042,7 @@ index 69eb806a17d..9e97e334544 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -10706,7 +11306,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10709,7 +11309,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -9045,7 +9051,7 @@ index 69eb806a17d..9e97e334544 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -10725,9 +11325,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10728,9 +11328,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -9057,7 +9063,7 @@ index 69eb806a17d..9e97e334544 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -11303,8 +11903,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -11306,8 +11906,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -9069,7 +9075,7 @@ index 69eb806a17d..9e97e334544 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -11337,13 +11938,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -11340,13 +11941,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -9142,16 +9148,16 @@ index 69eb806a17d..9e97e334544 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -12221,7 +12880,7 @@ else
+@@ -12248,7 +12907,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 12224 "configure"
+-#line 12251 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -12265,10 +12924,10 @@ else
+@@ -12292,10 +12951,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -9164,16 +9170,16 @@ index 69eb806a17d..9e97e334544 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -12327,7 +12986,7 @@ else
+@@ -12354,7 +13013,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 12330 "configure"
+-#line 12357 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -12371,10 +13030,10 @@ else
+@@ -12398,10 +13057,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -9186,7 +9192,7 @@ index 69eb806a17d..9e97e334544 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -12766,6 +13425,7 @@ $RM -r conftest*
+@@ -12793,6 +13452,7 @@ $RM -r conftest*
  
    # Allow CC to be a program name with arguments.
    lt_save_CC=$CC
@@ -9194,7 +9200,7 @@ index 69eb806a17d..9e97e334544 100755
    lt_save_LD=$LD
    lt_save_GCC=$GCC
    GCC=$GXX
-@@ -12783,6 +13443,7 @@ $RM -r conftest*
+@@ -12810,6 +13470,7 @@ $RM -r conftest*
    fi
    test -z "${LDCXX+set}" || LD=$LDCXX
    CC=${CXX-"c++"}
@@ -9202,7 +9208,7 @@ index 69eb806a17d..9e97e334544 100755
    compiler=$CC
    compiler_CXX=$CC
    for cc_temp in $compiler""; do
-@@ -13065,7 +13726,13 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
+@@ -13092,7 +13753,13 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
            allow_undefined_flag_CXX='-berok'
            # Determine the default libpath from the value encoded in an empty
            # executable.
@@ -9217,7 +9223,7 @@ index 69eb806a17d..9e97e334544 100755
  /* end confdefs.h.  */
  
  int
-@@ -13078,22 +13745,29 @@ main ()
+@@ -13105,22 +13772,29 @@ main ()
  _ACEOF
  if ac_fn_cxx_try_link "$LINENO"; then :
  
@@ -9260,7 +9266,7 @@ index 69eb806a17d..9e97e334544 100755
  
            hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
  
-@@ -13106,7 +13780,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13133,7 +13807,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
            else
  	    # Determine the default libpath from the value encoded in an
  	    # empty executable.
@@ -9275,7 +9281,7 @@ index 69eb806a17d..9e97e334544 100755
  /* end confdefs.h.  */
  
  int
-@@ -13119,22 +13799,29 @@ main ()
+@@ -13146,22 +13826,29 @@ main ()
  _ACEOF
  if ac_fn_cxx_try_link "$LINENO"; then :
  
@@ -9318,7 +9324,7 @@ index 69eb806a17d..9e97e334544 100755
  
  	    hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
  	    # Warning - without using the other run time loading flags,
-@@ -13177,29 +13864,75 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13204,29 +13891,75 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
          ;;
  
        cygwin* | mingw* | pw32* | cegcc*)
@@ -9417,7 +9423,7 @@ index 69eb806a17d..9e97e334544 100755
        darwin* | rhapsody*)
  
  
-@@ -13305,7 +14038,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13332,7 +14065,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
              ;;
            *)
              if test "$GXX" = yes; then
@@ -9426,8 +9432,8 @@ index 69eb806a17d..9e97e334544 100755
              else
                # FIXME: insert proper C++ library support
                ld_shlibs_CXX=no
-@@ -13376,10 +14109,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
- 	            archive_cmds_CXX='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
+@@ -13403,10 +14136,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+ 	            archive_cmds_CXX='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
  	            ;;
  	          ia64*)
 -	            archive_cmds_CXX='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
@@ -9439,7 +9445,7 @@ index 69eb806a17d..9e97e334544 100755
  	            ;;
  	        esac
  	      fi
-@@ -13420,9 +14153,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13447,9 +14180,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
            *)
  	    if test "$GXX" = yes; then
  	      if test "$with_gnu_ld" = no; then
@@ -9451,32 +9457,7 @@ index 69eb806a17d..9e97e334544 100755
  	      fi
  	    fi
  	    link_all_deplibs_CXX=yes
-@@ -13492,20 +14225,20 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
- 	      prelink_cmds_CXX='tpldir=Template.dir~
- 		rm -rf $tpldir~
- 		$CC --prelink_objects --instantiation_dir $tpldir $objs $libobjs $compile_deplibs~
--		compile_command="$compile_command `find $tpldir -name \*.o | $NL2SP`"'
-+		compile_command="$compile_command `find $tpldir -name \*.o | sort | $NL2SP`"'
- 	      old_archive_cmds_CXX='tpldir=Template.dir~
- 		rm -rf $tpldir~
- 		$CC --prelink_objects --instantiation_dir $tpldir $oldobjs$old_deplibs~
--		$AR $AR_FLAGS $oldlib$oldobjs$old_deplibs `find $tpldir -name \*.o | $NL2SP`~
-+		$AR $AR_FLAGS $oldlib$oldobjs$old_deplibs `find $tpldir -name \*.o | sort | $NL2SP`~
- 		$RANLIB $oldlib'
- 	      archive_cmds_CXX='tpldir=Template.dir~
- 		rm -rf $tpldir~
- 		$CC --prelink_objects --instantiation_dir $tpldir $predep_objects $libobjs $deplibs $convenience $postdep_objects~
--		$CC -shared $pic_flag $predep_objects $libobjs $deplibs `find $tpldir -name \*.o | $NL2SP` $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
-+		$CC -shared $pic_flag $predep_objects $libobjs $deplibs `find $tpldir -name \*.o | sort | $NL2SP` $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
- 	      archive_expsym_cmds_CXX='tpldir=Template.dir~
- 		rm -rf $tpldir~
- 		$CC --prelink_objects --instantiation_dir $tpldir $predep_objects $libobjs $deplibs $convenience $postdep_objects~
--		$CC -shared $pic_flag $predep_objects $libobjs $deplibs `find $tpldir -name \*.o | $NL2SP` $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname ${wl}-retain-symbols-file ${wl}$export_symbols -o $lib'
-+		$CC -shared $pic_flag $predep_objects $libobjs $deplibs `find $tpldir -name \*.o | sort | $NL2SP` $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname ${wl}-retain-symbols-file ${wl}$export_symbols -o $lib'
- 	      ;;
- 	    *) # Version 6 and above use weak symbols
- 	      archive_cmds_CXX='$CC -shared $pic_flag $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
-@@ -13700,7 +14433,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13727,7 +14460,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	          archive_cmds_CXX='$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
  		  ;;
  	        *)
@@ -9485,7 +9466,7 @@ index 69eb806a17d..9e97e334544 100755
  		  ;;
  	      esac
  
-@@ -13746,7 +14479,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13773,7 +14506,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
        solaris*)
          case $cc_basename in
@@ -9494,7 +9475,7 @@ index 69eb806a17d..9e97e334544 100755
  	    # Sun C++ 4.2, 5.x and Centerline C++
              archive_cmds_need_lc_CXX=yes
  	    no_undefined_flag_CXX=' -zdefs'
-@@ -13787,9 +14520,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13814,9 +14547,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	    if test "$GXX" = yes && test "$with_gnu_ld" = no; then
  	      no_undefined_flag_CXX=' ${wl}-z ${wl}defs'
  	      if $CC --version | $GREP -v '^2\.7' > /dev/null; then
@@ -9506,7 +9487,7 @@ index 69eb806a17d..9e97e334544 100755
  
  	        # Commands to make compiler produce verbose output that lists
  	        # what "hidden" libraries, object files and flags are used when
-@@ -13924,6 +14657,13 @@ private:
+@@ -13952,6 +14685,13 @@ private:
  };
  _LT_EOF
  
@@ -9520,7 +9501,7 @@ index 69eb806a17d..9e97e334544 100755
  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
    (eval $ac_compile) 2>&5
    ac_status=$?
-@@ -13937,7 +14677,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -13965,7 +14705,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
    pre_test_object_deps_done=no
  
    for p in `eval "$output_verbose_link_cmd"`; do
@@ -9529,7 +9510,7 @@ index 69eb806a17d..9e97e334544 100755
  
      -L* | -R* | -l*)
         # Some compilers place space between "-{L,R}" and the path.
-@@ -13946,13 +14686,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -13974,13 +14714,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
            test $p = "-R"; then
  	 prev=$p
  	 continue
@@ -9556,7 +9537,7 @@ index 69eb806a17d..9e97e334544 100755
  	   # Internal compiler library paths should come after those
  	   # provided the user.  The postdeps already come after the
  	   # user supplied libs so there is no need to process them.
-@@ -13972,8 +14721,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -14000,8 +14749,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
  	   postdeps_CXX="${postdeps_CXX} ${prev}${p}"
  	 fi
         fi
@@ -9567,7 +9548,7 @@ index 69eb806a17d..9e97e334544 100755
      *.$objext)
         # This assumes that the test object file only shows up
         # once in the compiler output.
-@@ -14009,6 +14760,7 @@ else
+@@ -14037,6 +14788,7 @@ else
  fi
  
  $RM -f confest.$objext
@@ -9575,7 +9556,7 @@ index 69eb806a17d..9e97e334544 100755
  
  # PORTME: override above test on systems where it is broken
  case $host_os in
-@@ -14044,7 +14796,7 @@ linux*)
+@@ -14072,7 +14824,7 @@ linux*)
  
  solaris*)
    case $cc_basename in
@@ -9584,7 +9565,7 @@ index 69eb806a17d..9e97e334544 100755
      # The more standards-conforming stlport4 library is
      # incompatible with the Cstd library. Avoid specifying
      # it if it's in CXXFLAGS. Ignore libCrun as
-@@ -14109,8 +14861,6 @@ fi
+@@ -14137,8 +14889,6 @@ fi
  lt_prog_compiler_pic_CXX=
  lt_prog_compiler_static_CXX=
  
@@ -9593,7 +9574,7 @@ index 69eb806a17d..9e97e334544 100755
  
    # C++ specific cases for pic, static, wl, etc.
    if test "$GXX" = yes; then
-@@ -14215,6 +14965,11 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -14243,6 +14993,11 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	  ;;
  	esac
  	;;
@@ -9605,7 +9586,7 @@ index 69eb806a17d..9e97e334544 100755
        dgux*)
  	case $cc_basename in
  	  ec++*)
-@@ -14367,7 +15122,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -14395,7 +15150,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	;;
        solaris*)
  	case $cc_basename in
@@ -9614,7 +9595,7 @@ index 69eb806a17d..9e97e334544 100755
  	    # Sun C++ 4.2, 5.x and Centerline C++
  	    lt_prog_compiler_pic_CXX='-KPIC'
  	    lt_prog_compiler_static_CXX='-Bstatic'
-@@ -14432,10 +15187,17 @@ case $host_os in
+@@ -14460,10 +15215,17 @@ case $host_os in
      lt_prog_compiler_pic_CXX="$lt_prog_compiler_pic_CXX -DPIC"
      ;;
  esac
@@ -9635,7 +9616,7 @@ index 69eb806a17d..9e97e334544 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -14493,6 +15255,8 @@ fi
+@@ -14521,6 +15283,8 @@ fi
  
  
  
@@ -9644,7 +9625,7 @@ index 69eb806a17d..9e97e334544 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -14670,6 +15434,7 @@ fi
+@@ -14698,6 +15462,7 @@ fi
  $as_echo_n "checking whether the $compiler linker ($LD) supports shared libraries... " >&6; }
  
    export_symbols_cmds_CXX='$NM $libobjs $convenience | $global_symbol_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
@@ -9652,7 +9633,7 @@ index 69eb806a17d..9e97e334544 100755
    case $host_os in
    aix[4-9]*)
      # If we're using GNU nm, then we don't want the "-C" option.
-@@ -14684,15 +15449,20 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
+@@ -14712,15 +15477,20 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
      ;;
    pw32*)
      export_symbols_cmds_CXX="$ltdll_cmds"
@@ -9678,7 +9659,7 @@ index 69eb806a17d..9e97e334544 100755
  
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ld_shlibs_CXX" >&5
  $as_echo "$ld_shlibs_CXX" >&6; }
-@@ -14955,8 +15725,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -14983,8 +15753,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -9690,7 +9671,7 @@ index 69eb806a17d..9e97e334544 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -14988,13 +15759,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -15016,13 +15787,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -9763,7 +9744,7 @@ index 69eb806a17d..9e97e334544 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -15534,6 +16363,7 @@ fi
+@@ -15586,6 +16415,7 @@ fi
    fi # test -n "$compiler"
  
    CC=$lt_save_CC
@@ -9771,7 +9752,7 @@ index 69eb806a17d..9e97e334544 100755
    LDCXX=$LD
    LD=$lt_save_LD
    GCC=$lt_save_GCC
-@@ -17737,13 +18567,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -17738,13 +18568,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -9792,7 +9773,7 @@ index 69eb806a17d..9e97e334544 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -17758,14 +18595,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -17759,14 +18596,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -9811,7 +9792,7 @@ index 69eb806a17d..9e97e334544 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -17798,12 +18638,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -17799,12 +18639,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -9825,7 +9806,7 @@ index 69eb806a17d..9e97e334544 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -17842,8 +18682,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archive_cmds_CXX" | $SED "$delay_single_quote
+@@ -17843,8 +18683,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archive_cmds_CXX" | $SED "$delay_single_quote
  compiler_CXX='`$ECHO "$compiler_CXX" | $SED "$delay_single_quote_subst"`'
  GCC_CXX='`$ECHO "$GCC_CXX" | $SED "$delay_single_quote_subst"`'
  lt_prog_compiler_no_builtin_flag_CXX='`$ECHO "$lt_prog_compiler_no_builtin_flag_CXX" | $SED "$delay_single_quote_subst"`'
@@ -9835,7 +9816,7 @@ index 69eb806a17d..9e97e334544 100755
  lt_prog_compiler_static_CXX='`$ECHO "$lt_prog_compiler_static_CXX" | $SED "$delay_single_quote_subst"`'
  lt_cv_prog_compiler_c_o_CXX='`$ECHO "$lt_cv_prog_compiler_c_o_CXX" | $SED "$delay_single_quote_subst"`'
  archive_cmds_need_lc_CXX='`$ECHO "$archive_cmds_need_lc_CXX" | $SED "$delay_single_quote_subst"`'
-@@ -17870,12 +18710,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$hardcode_shlibpath_var_CXX" | $SED "$delay_
+@@ -17871,12 +18711,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$hardcode_shlibpath_var_CXX" | $SED "$delay_
  hardcode_automatic_CXX='`$ECHO "$hardcode_automatic_CXX" | $SED "$delay_single_quote_subst"`'
  inherit_rpath_CXX='`$ECHO "$inherit_rpath_CXX" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs_CXX='`$ECHO "$link_all_deplibs_CXX" | $SED "$delay_single_quote_subst"`'
@@ -9849,7 +9830,7 @@ index 69eb806a17d..9e97e334544 100755
  file_list_spec_CXX='`$ECHO "$file_list_spec_CXX" | $SED "$delay_single_quote_subst"`'
  hardcode_action_CXX='`$ECHO "$hardcode_action_CXX" | $SED "$delay_single_quote_subst"`'
  compiler_lib_search_dirs_CXX='`$ECHO "$compiler_lib_search_dirs_CXX" | $SED "$delay_single_quote_subst"`'
-@@ -17913,8 +18753,13 @@ reload_flag \
+@@ -17914,8 +18754,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -9863,7 +9844,7 @@ index 69eb806a17d..9e97e334544 100755
  STRIP \
  RANLIB \
  CC \
-@@ -17924,12 +18769,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -17925,12 +18770,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -9879,7 +9860,7 @@ index 69eb806a17d..9e97e334544 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -17945,7 +18792,6 @@ no_undefined_flag \
+@@ -17946,7 +18793,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -9887,7 +9868,7 @@ index 69eb806a17d..9e97e334544 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -17967,8 +18813,8 @@ LD_CXX \
+@@ -17968,8 +18814,8 @@ LD_CXX \
  reload_flag_CXX \
  compiler_CXX \
  lt_prog_compiler_no_builtin_flag_CXX \
@@ -9897,7 +9878,7 @@ index 69eb806a17d..9e97e334544 100755
  lt_prog_compiler_static_CXX \
  lt_cv_prog_compiler_c_o_CXX \
  export_dynamic_flag_spec_CXX \
-@@ -17980,7 +18826,6 @@ no_undefined_flag_CXX \
+@@ -17981,7 +18827,6 @@ no_undefined_flag_CXX \
  hardcode_libdir_flag_spec_CXX \
  hardcode_libdir_flag_spec_ld_CXX \
  hardcode_libdir_separator_CXX \
@@ -9905,7 +9886,7 @@ index 69eb806a17d..9e97e334544 100755
  exclude_expsyms_CXX \
  include_expsyms_CXX \
  file_list_spec_CXX \
-@@ -18014,6 +18859,7 @@ module_cmds \
+@@ -18015,6 +18860,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -9913,7 +9894,7 @@ index 69eb806a17d..9e97e334544 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -18028,7 +18874,8 @@ archive_expsym_cmds_CXX \
+@@ -18029,7 +18875,8 @@ archive_expsym_cmds_CXX \
  module_cmds_CXX \
  module_expsym_cmds_CXX \
  export_symbols_cmds_CXX \
@@ -9923,7 +9904,7 @@ index 69eb806a17d..9e97e334544 100755
      case \`eval \\\\\$ECHO \\\\""\\\\\$\$var"\\\\"\` in
      *[\\\\\\\`\\"\\\$]*)
        eval "lt_\$var=\\\\\\"\\\`\\\$ECHO \\"\\\$\$var\\" | \\\$SED -e \\"\\\$double_quote_subst\\" -e \\"\\\$sed_quote_subst\\" -e \\"\\\$delay_variable_subst\\"\\\`\\\\\\""
-@@ -18785,7 +19632,8 @@ $as_echo X"$file" |
+@@ -18786,7 +19633,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -9933,7 +9914,7 @@ index 69eb806a17d..9e97e334544 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -18888,19 +19736,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -18889,19 +19737,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -9977,7 +9958,7 @@ index 69eb806a17d..9e97e334544 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -18930,6 +19801,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -18931,6 +19802,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -9990,7 +9971,7 @@ index 69eb806a17d..9e97e334544 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -18939,6 +19816,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -18940,6 +19817,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -10000,7 +9981,7 @@ index 69eb806a17d..9e97e334544 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -19053,12 +19933,12 @@ with_gcc=$GCC
+@@ -19054,12 +19934,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -10016,7 +9997,7 @@ index 69eb806a17d..9e97e334544 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -19145,9 +20025,6 @@ inherit_rpath=$inherit_rpath
+@@ -19146,9 +20026,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -10026,7 +10007,7 @@ index 69eb806a17d..9e97e334544 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -19163,6 +20040,9 @@ include_expsyms=$lt_include_expsyms
+@@ -19164,6 +20041,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -10036,7 +10017,7 @@ index 69eb806a17d..9e97e334544 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -19209,210 +20089,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -19210,210 +20090,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -10410,7 +10391,7 @@ index 69eb806a17d..9e97e334544 100755
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-@@ -19440,12 +20279,12 @@ with_gcc=$GCC_CXX
+@@ -19441,12 +20280,12 @@ with_gcc=$GCC_CXX
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag_CXX
  
@@ -10426,7 +10407,7 @@ index 69eb806a17d..9e97e334544 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static_CXX
  
-@@ -19532,9 +20371,6 @@ inherit_rpath=$inherit_rpath_CXX
+@@ -19533,9 +20372,6 @@ inherit_rpath=$inherit_rpath_CXX
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs_CXX
  
@@ -10436,7 +10417,7 @@ index 69eb806a17d..9e97e334544 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols_CXX
  
-@@ -19550,6 +20386,9 @@ include_expsyms=$lt_include_expsyms_CXX
+@@ -19551,6 +20387,9 @@ include_expsyms=$lt_include_expsyms_CXX
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds_CXX
  
@@ -10447,7 +10428,7 @@ index 69eb806a17d..9e97e334544 100755
  file_list_spec=$lt_file_list_spec_CXX
  
 diff --git a/gprofng/doc/Makefile.in b/gprofng/doc/Makefile.in
-index 78f8ae11fc7..48058763422 100644
+index 3306c51b31c..6ab3d9636c8 100644
 --- a/gprofng/doc/Makefile.in
 +++ b/gprofng/doc/Makefile.in
 @@ -238,6 +238,7 @@ CXXFLAGS = @CXXFLAGS@
@@ -10458,7 +10439,7 @@ index 78f8ae11fc7..48058763422 100644
  DSYMUTIL = @DSYMUTIL@
  DUMPBIN = @DUMPBIN@
  ECHO_C = @ECHO_C@
-@@ -273,6 +274,7 @@ LN_S = @LN_S@
+@@ -272,6 +273,7 @@ LN_S = @LN_S@
  LTLIBOBJS = @LTLIBOBJS@
  MAINT = @MAINT@
  MAKEINFO = @MAKEINFO@
@@ -10467,7 +10448,7 @@ index 78f8ae11fc7..48058763422 100644
  NM = @NM@
  NMEDIT = @NMEDIT@
 diff --git a/gprofng/gp-display-html/Makefile.in b/gprofng/gp-display-html/Makefile.in
-index 21cc1c6623b..e989804603e 100644
+index 61c00cd6e46..edce3cb94c5 100644
 --- a/gprofng/gp-display-html/Makefile.in
 +++ b/gprofng/gp-display-html/Makefile.in
 @@ -197,6 +197,7 @@ CXXFLAGS = @CXXFLAGS@
@@ -10478,7 +10459,7 @@ index 21cc1c6623b..e989804603e 100644
  DSYMUTIL = @DSYMUTIL@
  DUMPBIN = @DUMPBIN@
  ECHO_C = @ECHO_C@
-@@ -232,6 +233,7 @@ LN_S = @LN_S@
+@@ -231,6 +232,7 @@ LN_S = @LN_S@
  LTLIBOBJS = @LTLIBOBJS@
  MAINT = @MAINT@
  MAKEINFO = @MAKEINFO@
@@ -10487,7 +10468,7 @@ index 21cc1c6623b..e989804603e 100644
  NM = @NM@
  NMEDIT = @NMEDIT@
 diff --git a/gprofng/libcollector/Makefile.in b/gprofng/libcollector/Makefile.in
-index dc76a76bd67..763b08822f2 100644
+index ce8755c80c9..91e29c29ab8 100644
 --- a/gprofng/libcollector/Makefile.in
 +++ b/gprofng/libcollector/Makefile.in
 @@ -316,6 +316,7 @@ CXXFLAGS = @CXXFLAGS@
@@ -10507,7 +10488,7 @@ index dc76a76bd67..763b08822f2 100644
  NM = @NM@
  NMEDIT = @NMEDIT@
 diff --git a/gprofng/libcollector/configure b/gprofng/libcollector/configure
-index 865ddb3d91d..31533528ee2 100755
+index b6737b96bd5..d1552932a75 100755
 --- a/gprofng/libcollector/configure
 +++ b/gprofng/libcollector/configure
 @@ -640,6 +640,8 @@ OTOOL
@@ -10670,7 +10651,7 @@ index 865ddb3d91d..31533528ee2 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -7090,6 +7175,21 @@ esac
+@@ -7095,6 +7180,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -10692,7 +10673,7 @@ index 865ddb3d91d..31533528ee2 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -7105,6 +7205,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -7110,6 +7210,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -10850,7 +10831,7 @@ index 865ddb3d91d..31533528ee2 100755
  plugin_option=
  plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
  for plugin in $plugin_names; do
-@@ -7119,8 +7370,10 @@ for plugin in $plugin_names; do
+@@ -7124,8 +7375,10 @@ for plugin in $plugin_names; do
  done
  
  if test -n "$ac_tool_prefix"; then
@@ -10863,7 +10844,7 @@ index 865ddb3d91d..31533528ee2 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_AR+:} false; then :
-@@ -7136,7 +7389,7 @@ do
+@@ -7141,7 +7394,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -10872,7 +10853,7 @@ index 865ddb3d91d..31533528ee2 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -7156,11 +7409,15 @@ $as_echo "no" >&6; }
+@@ -7161,11 +7414,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -10891,7 +10872,7 @@ index 865ddb3d91d..31533528ee2 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_ac_ct_AR+:} false; then :
-@@ -7176,7 +7433,7 @@ do
+@@ -7181,7 +7438,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -10900,7 +10881,7 @@ index 865ddb3d91d..31533528ee2 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -7195,6 +7452,10 @@ else
+@@ -7200,6 +7457,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -10911,7 +10892,7 @@ index 865ddb3d91d..31533528ee2 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -7206,29 +7467,81 @@ ac_tool_warned=yes ;;
+@@ -7211,25 +7472,19 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -10943,16 +10924,12 @@ index 865ddb3d91d..31533528ee2 100755
 +  rm -f conftest.*
 +: ${AR=ar}
 +: ${AR_FLAGS=cru}
-+
-+
-+
-+
-+
-+
-+
  
  
  
+@@ -7241,6 +7496,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+ 
+ 
  
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE support" >&5
 +$as_echo_n "checking for archiver @FILE support... " >&6; }
@@ -11005,10 +10982,17 @@ index 865ddb3d91d..31533528ee2 100755
 +else
 +  archiver_list_spec=$lt_cv_ar_at_file
 +fi
- 
- 
- 
-@@ -7575,8 +7888,8 @@ esac
++
++
++
++
++
++
++
+ if test -n "$ac_tool_prefix"; then
+   # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
+ set dummy ${ac_tool_prefix}strip; ac_word=$2
+@@ -7580,8 +7893,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -11019,7 +11003,7 @@ index 865ddb3d91d..31533528ee2 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -7612,6 +7925,7 @@ for ac_symprfx in "" "_"; do
+@@ -7617,6 +7930,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -11027,7 +11011,7 @@ index 865ddb3d91d..31533528ee2 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -7653,6 +7967,18 @@ _LT_EOF
+@@ -7658,6 +7972,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -11046,7 +11030,7 @@ index 865ddb3d91d..31533528ee2 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -7664,7 +7990,7 @@ _LT_EOF
+@@ -7669,7 +7995,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -11055,7 +11039,7 @@ index 865ddb3d91d..31533528ee2 100755
    const char *name;
    void       *address;
  }
-@@ -7690,8 +8016,8 @@ static const void *lt_preloaded_setup() {
+@@ -7695,8 +8021,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -11066,7 +11050,7 @@ index 865ddb3d91d..31533528ee2 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -7701,8 +8027,8 @@ _LT_EOF
+@@ -7706,8 +8032,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -11077,7 +11061,7 @@ index 865ddb3d91d..31533528ee2 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7739,6 +8065,13 @@ else
+@@ -7744,6 +8070,13 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -11091,7 +11075,7 @@ index 865ddb3d91d..31533528ee2 100755
  
  
  
-@@ -7758,6 +8091,48 @@ fi
+@@ -7763,6 +8096,48 @@ fi
  
  
  
@@ -11140,7 +11124,7 @@ index 865ddb3d91d..31533528ee2 100755
  
  
  # Check whether --enable-libtool-lock was given.
-@@ -7966,6 +8341,123 @@ esac
+@@ -7971,6 +8346,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -11264,7 +11248,7 @@ index 865ddb3d91d..31533528ee2 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -8529,6 +9021,8 @@ _LT_EOF
+@@ -8534,6 +9026,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -11273,7 +11257,7 @@ index 865ddb3d91d..31533528ee2 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -8597,6 +9091,16 @@ done
+@@ -8604,6 +9098,16 @@ done
  
  
  
@@ -11290,7 +11274,7 @@ index 865ddb3d91d..31533528ee2 100755
  
  
  # Set options
-@@ -9112,8 +9616,6 @@ fi
+@@ -9119,8 +9623,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -11299,7 +11283,7 @@ index 865ddb3d91d..31533528ee2 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -9279,6 +9781,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -9286,6 +9788,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -11312,7 +11296,7 @@ index 865ddb3d91d..31533528ee2 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -9341,7 +9849,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -9348,7 +9856,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -11321,7 +11305,7 @@ index 865ddb3d91d..31533528ee2 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -9398,13 +9906,17 @@ case $host_os in
+@@ -9405,13 +9913,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -11345,7 +11329,7 @@ index 865ddb3d91d..31533528ee2 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -9465,6 +9977,11 @@ fi
+@@ -9472,6 +9984,11 @@ fi
  
  
  
@@ -11357,7 +11341,7 @@ index 865ddb3d91d..31533528ee2 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -9815,7 +10332,8 @@ _LT_EOF
+@@ -9822,7 +10339,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -11367,7 +11351,7 @@ index 865ddb3d91d..31533528ee2 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -9914,12 +10432,12 @@ _LT_EOF
+@@ -9921,12 +10439,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -11382,7 +11366,7 @@ index 865ddb3d91d..31533528ee2 100755
  	  fi
  	  ;;
  	esac
-@@ -9933,8 +10451,8 @@ _LT_EOF
+@@ -9940,8 +10458,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -11393,7 +11377,7 @@ index 865ddb3d91d..31533528ee2 100755
        fi
        ;;
  
-@@ -9952,8 +10470,8 @@ _LT_EOF
+@@ -9959,8 +10477,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -11404,7 +11388,7 @@ index 865ddb3d91d..31533528ee2 100755
        else
  	ld_shlibs=no
        fi
-@@ -9999,8 +10517,8 @@ _LT_EOF
+@@ -10006,8 +10524,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -11415,7 +11399,7 @@ index 865ddb3d91d..31533528ee2 100755
        else
  	ld_shlibs=no
        fi
-@@ -10130,7 +10648,13 @@ _LT_EOF
+@@ -10137,7 +10655,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -11430,7 +11414,7 @@ index 865ddb3d91d..31533528ee2 100755
  /* end confdefs.h.  */
  
  int
-@@ -10143,22 +10667,29 @@ main ()
+@@ -10150,22 +10674,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -11473,7 +11457,7 @@ index 865ddb3d91d..31533528ee2 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -10170,7 +10701,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10177,7 +10708,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -11488,7 +11472,7 @@ index 865ddb3d91d..31533528ee2 100755
  /* end confdefs.h.  */
  
  int
-@@ -10183,22 +10720,29 @@ main ()
+@@ -10190,22 +10727,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -11531,11 +11515,10 @@ index 865ddb3d91d..31533528ee2 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -10242,21 +10786,64 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
-       # When not using gcc, we currently assume that we are using
+@@ -10250,20 +10794,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
--      # no search path for DLLs.
+       # no search path for DLLs.
 -      hardcode_libdir_flag_spec=' '
 -      allow_undefined_flag=unsupported
 -      # Tell ltmain to make .lib files, not .a files.
@@ -11550,7 +11533,6 @@ index 865ddb3d91d..31533528ee2 100755
 -      old_archive_cmds='lib -OUT:$oldlib$oldobjs$old_deplibs'
 -      fix_srcfile_path='`cygpath -w "$srcfile"`'
 -      enable_shared_with_static_runtimes=yes
-+      # no search path for DLLs.
 +      case $cc_basename in
 +      cl*)
 +	# Native MSVC
@@ -11611,7 +11593,7 @@ index 865ddb3d91d..31533528ee2 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -10317,7 +10904,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10324,7 +10911,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -11620,7 +11602,7 @@ index 865ddb3d91d..31533528ee2 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -10325,7 +10912,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10332,7 +10919,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -11629,7 +11611,7 @@ index 865ddb3d91d..31533528ee2 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -10341,7 +10928,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10348,7 +10935,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -11638,8 +11620,8 @@ index 865ddb3d91d..31533528ee2 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -10365,10 +10952,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
- 	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
+@@ -10372,10 +10959,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+ 	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
 -	  archive_cmds='$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
@@ -11651,7 +11633,7 @@ index 865ddb3d91d..31533528ee2 100755
  	  ;;
  	esac
        else
-@@ -10447,23 +11034,36 @@ fi
+@@ -10454,23 +11041,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -11696,7 +11678,7 @@ index 865ddb3d91d..31533528ee2 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -10548,7 +11148,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10555,7 +11155,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -11705,7 +11687,7 @@ index 865ddb3d91d..31533528ee2 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -10567,9 +11167,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10574,9 +11174,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -11717,7 +11699,7 @@ index 865ddb3d91d..31533528ee2 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -11145,8 +11745,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -11152,8 +11752,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -11729,7 +11711,7 @@ index 865ddb3d91d..31533528ee2 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -11179,13 +11780,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -11186,13 +11787,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -11802,16 +11784,16 @@ index 865ddb3d91d..31533528ee2 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -12063,7 +12722,7 @@ else
+@@ -12094,7 +12753,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 12066 "configure"
+-#line 12097 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -12107,10 +12766,10 @@ else
+@@ -12138,10 +12797,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -11824,16 +11806,16 @@ index 865ddb3d91d..31533528ee2 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -12169,7 +12828,7 @@ else
+@@ -12200,7 +12859,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 12172 "configure"
+-#line 12203 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -12213,10 +12872,10 @@ else
+@@ -12244,10 +12903,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -11846,7 +11828,7 @@ index 865ddb3d91d..31533528ee2 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -12608,6 +13267,7 @@ $RM -r conftest*
+@@ -12639,6 +13298,7 @@ $RM -r conftest*
  
    # Allow CC to be a program name with arguments.
    lt_save_CC=$CC
@@ -11854,7 +11836,7 @@ index 865ddb3d91d..31533528ee2 100755
    lt_save_LD=$LD
    lt_save_GCC=$GCC
    GCC=$GXX
-@@ -12625,6 +13285,7 @@ $RM -r conftest*
+@@ -12656,6 +13316,7 @@ $RM -r conftest*
    fi
    test -z "${LDCXX+set}" || LD=$LDCXX
    CC=${CXX-"c++"}
@@ -11862,7 +11844,7 @@ index 865ddb3d91d..31533528ee2 100755
    compiler=$CC
    compiler_CXX=$CC
    for cc_temp in $compiler""; do
-@@ -12907,7 +13568,13 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
+@@ -12938,7 +13599,13 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
            allow_undefined_flag_CXX='-berok'
            # Determine the default libpath from the value encoded in an empty
            # executable.
@@ -11877,7 +11859,7 @@ index 865ddb3d91d..31533528ee2 100755
  /* end confdefs.h.  */
  
  int
-@@ -12920,22 +13587,29 @@ main ()
+@@ -12951,22 +13618,29 @@ main ()
  _ACEOF
  if ac_fn_cxx_try_link "$LINENO"; then :
  
@@ -11920,7 +11902,7 @@ index 865ddb3d91d..31533528ee2 100755
  
            hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
  
-@@ -12948,7 +13622,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12979,7 +13653,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
            else
  	    # Determine the default libpath from the value encoded in an
  	    # empty executable.
@@ -11935,7 +11917,7 @@ index 865ddb3d91d..31533528ee2 100755
  /* end confdefs.h.  */
  
  int
-@@ -12961,22 +13641,29 @@ main ()
+@@ -12992,22 +13672,29 @@ main ()
  _ACEOF
  if ac_fn_cxx_try_link "$LINENO"; then :
  
@@ -11978,7 +11960,7 @@ index 865ddb3d91d..31533528ee2 100755
  
  	    hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
  	    # Warning - without using the other run time loading flags,
-@@ -13019,29 +13706,75 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13050,29 +13737,75 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
          ;;
  
        cygwin* | mingw* | pw32* | cegcc*)
@@ -12077,7 +12059,7 @@ index 865ddb3d91d..31533528ee2 100755
        darwin* | rhapsody*)
  
  
-@@ -13147,7 +13880,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13178,7 +13911,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
              ;;
            *)
              if test "$GXX" = yes; then
@@ -12086,8 +12068,8 @@ index 865ddb3d91d..31533528ee2 100755
              else
                # FIXME: insert proper C++ library support
                ld_shlibs_CXX=no
-@@ -13218,10 +13951,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
- 	            archive_cmds_CXX='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
+@@ -13249,10 +13982,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+ 	            archive_cmds_CXX='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
  	            ;;
  	          ia64*)
 -	            archive_cmds_CXX='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
@@ -12099,7 +12081,7 @@ index 865ddb3d91d..31533528ee2 100755
  	            ;;
  	        esac
  	      fi
-@@ -13262,9 +13995,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13293,9 +14026,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
            *)
  	    if test "$GXX" = yes; then
  	      if test "$with_gnu_ld" = no; then
@@ -12111,32 +12093,7 @@ index 865ddb3d91d..31533528ee2 100755
  	      fi
  	    fi
  	    link_all_deplibs_CXX=yes
-@@ -13334,20 +14067,20 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
- 	      prelink_cmds_CXX='tpldir=Template.dir~
- 		rm -rf $tpldir~
- 		$CC --prelink_objects --instantiation_dir $tpldir $objs $libobjs $compile_deplibs~
--		compile_command="$compile_command `find $tpldir -name \*.o | $NL2SP`"'
-+		compile_command="$compile_command `find $tpldir -name \*.o | sort | $NL2SP`"'
- 	      old_archive_cmds_CXX='tpldir=Template.dir~
- 		rm -rf $tpldir~
- 		$CC --prelink_objects --instantiation_dir $tpldir $oldobjs$old_deplibs~
--		$AR $AR_FLAGS $oldlib$oldobjs$old_deplibs `find $tpldir -name \*.o | $NL2SP`~
-+		$AR $AR_FLAGS $oldlib$oldobjs$old_deplibs `find $tpldir -name \*.o | sort | $NL2SP`~
- 		$RANLIB $oldlib'
- 	      archive_cmds_CXX='tpldir=Template.dir~
- 		rm -rf $tpldir~
- 		$CC --prelink_objects --instantiation_dir $tpldir $predep_objects $libobjs $deplibs $convenience $postdep_objects~
--		$CC -shared $pic_flag $predep_objects $libobjs $deplibs `find $tpldir -name \*.o | $NL2SP` $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
-+		$CC -shared $pic_flag $predep_objects $libobjs $deplibs `find $tpldir -name \*.o | sort | $NL2SP` $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
- 	      archive_expsym_cmds_CXX='tpldir=Template.dir~
- 		rm -rf $tpldir~
- 		$CC --prelink_objects --instantiation_dir $tpldir $predep_objects $libobjs $deplibs $convenience $postdep_objects~
--		$CC -shared $pic_flag $predep_objects $libobjs $deplibs `find $tpldir -name \*.o | $NL2SP` $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname ${wl}-retain-symbols-file ${wl}$export_symbols -o $lib'
-+		$CC -shared $pic_flag $predep_objects $libobjs $deplibs `find $tpldir -name \*.o | sort | $NL2SP` $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname ${wl}-retain-symbols-file ${wl}$export_symbols -o $lib'
- 	      ;;
- 	    *) # Version 6 and above use weak symbols
- 	      archive_cmds_CXX='$CC -shared $pic_flag $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
-@@ -13542,7 +14275,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13573,7 +14306,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	          archive_cmds_CXX='$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
  		  ;;
  	        *)
@@ -12145,7 +12102,7 @@ index 865ddb3d91d..31533528ee2 100755
  		  ;;
  	      esac
  
-@@ -13588,7 +14321,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13619,7 +14352,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
        solaris*)
          case $cc_basename in
@@ -12154,7 +12111,7 @@ index 865ddb3d91d..31533528ee2 100755
  	    # Sun C++ 4.2, 5.x and Centerline C++
              archive_cmds_need_lc_CXX=yes
  	    no_undefined_flag_CXX=' -zdefs'
-@@ -13629,9 +14362,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13660,9 +14393,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	    if test "$GXX" = yes && test "$with_gnu_ld" = no; then
  	      no_undefined_flag_CXX=' ${wl}-z ${wl}defs'
  	      if $CC --version | $GREP -v '^2\.7' > /dev/null; then
@@ -12166,7 +12123,7 @@ index 865ddb3d91d..31533528ee2 100755
  
  	        # Commands to make compiler produce verbose output that lists
  	        # what "hidden" libraries, object files and flags are used when
-@@ -13766,6 +14499,13 @@ private:
+@@ -13798,6 +14531,13 @@ private:
  };
  _LT_EOF
  
@@ -12180,7 +12137,7 @@ index 865ddb3d91d..31533528ee2 100755
  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
    (eval $ac_compile) 2>&5
    ac_status=$?
-@@ -13779,7 +14519,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -13811,7 +14551,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
    pre_test_object_deps_done=no
  
    for p in `eval "$output_verbose_link_cmd"`; do
@@ -12189,7 +12146,7 @@ index 865ddb3d91d..31533528ee2 100755
  
      -L* | -R* | -l*)
         # Some compilers place space between "-{L,R}" and the path.
-@@ -13788,13 +14528,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -13820,13 +14560,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
            test $p = "-R"; then
  	 prev=$p
  	 continue
@@ -12216,7 +12173,7 @@ index 865ddb3d91d..31533528ee2 100755
  	   # Internal compiler library paths should come after those
  	   # provided the user.  The postdeps already come after the
  	   # user supplied libs so there is no need to process them.
-@@ -13814,8 +14563,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -13846,8 +14595,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
  	   postdeps_CXX="${postdeps_CXX} ${prev}${p}"
  	 fi
         fi
@@ -12227,7 +12184,7 @@ index 865ddb3d91d..31533528ee2 100755
      *.$objext)
         # This assumes that the test object file only shows up
         # once in the compiler output.
-@@ -13851,6 +14602,7 @@ else
+@@ -13883,6 +14634,7 @@ else
  fi
  
  $RM -f confest.$objext
@@ -12235,7 +12192,7 @@ index 865ddb3d91d..31533528ee2 100755
  
  # PORTME: override above test on systems where it is broken
  case $host_os in
-@@ -13886,7 +14638,7 @@ linux*)
+@@ -13918,7 +14670,7 @@ linux*)
  
  solaris*)
    case $cc_basename in
@@ -12244,7 +12201,7 @@ index 865ddb3d91d..31533528ee2 100755
      # The more standards-conforming stlport4 library is
      # incompatible with the Cstd library. Avoid specifying
      # it if it's in CXXFLAGS. Ignore libCrun as
-@@ -13951,8 +14703,6 @@ fi
+@@ -13983,8 +14735,6 @@ fi
  lt_prog_compiler_pic_CXX=
  lt_prog_compiler_static_CXX=
  
@@ -12253,7 +12210,7 @@ index 865ddb3d91d..31533528ee2 100755
  
    # C++ specific cases for pic, static, wl, etc.
    if test "$GXX" = yes; then
-@@ -14057,6 +14807,11 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -14089,6 +14839,11 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	  ;;
  	esac
  	;;
@@ -12265,7 +12222,7 @@ index 865ddb3d91d..31533528ee2 100755
        dgux*)
  	case $cc_basename in
  	  ec++*)
-@@ -14209,7 +14964,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -14241,7 +14996,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	;;
        solaris*)
  	case $cc_basename in
@@ -12274,7 +12231,7 @@ index 865ddb3d91d..31533528ee2 100755
  	    # Sun C++ 4.2, 5.x and Centerline C++
  	    lt_prog_compiler_pic_CXX='-KPIC'
  	    lt_prog_compiler_static_CXX='-Bstatic'
-@@ -14274,10 +15029,17 @@ case $host_os in
+@@ -14306,10 +15061,17 @@ case $host_os in
      lt_prog_compiler_pic_CXX="$lt_prog_compiler_pic_CXX -DPIC"
      ;;
  esac
@@ -12295,7 +12252,7 @@ index 865ddb3d91d..31533528ee2 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -14335,6 +15097,8 @@ fi
+@@ -14367,6 +15129,8 @@ fi
  
  
  
@@ -12304,7 +12261,7 @@ index 865ddb3d91d..31533528ee2 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -14512,6 +15276,7 @@ fi
+@@ -14544,6 +15308,7 @@ fi
  $as_echo_n "checking whether the $compiler linker ($LD) supports shared libraries... " >&6; }
  
    export_symbols_cmds_CXX='$NM $libobjs $convenience | $global_symbol_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
@@ -12312,7 +12269,7 @@ index 865ddb3d91d..31533528ee2 100755
    case $host_os in
    aix[4-9]*)
      # If we're using GNU nm, then we don't want the "-C" option.
-@@ -14526,15 +15291,20 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
+@@ -14558,15 +15323,20 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
      ;;
    pw32*)
      export_symbols_cmds_CXX="$ltdll_cmds"
@@ -12338,7 +12295,7 @@ index 865ddb3d91d..31533528ee2 100755
  
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ld_shlibs_CXX" >&5
  $as_echo "$ld_shlibs_CXX" >&6; }
-@@ -14797,8 +15567,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -14829,8 +15599,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -12350,7 +12307,7 @@ index 865ddb3d91d..31533528ee2 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -14830,13 +15601,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -14862,13 +15633,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -12423,7 +12380,7 @@ index 865ddb3d91d..31533528ee2 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -15376,6 +16205,7 @@ fi
+@@ -15432,6 +16261,7 @@ fi
    fi # test -n "$compiler"
  
    CC=$lt_save_CC
@@ -12431,7 +12388,7 @@ index 865ddb3d91d..31533528ee2 100755
    LDCXX=$LD
    LD=$lt_save_LD
    GCC=$lt_save_GCC
-@@ -16303,13 +17133,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -16359,13 +17189,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -12452,7 +12409,7 @@ index 865ddb3d91d..31533528ee2 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -16324,14 +17161,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -16380,14 +17217,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -12471,7 +12428,7 @@ index 865ddb3d91d..31533528ee2 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -16364,12 +17204,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -16420,12 +17260,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -12485,7 +12442,7 @@ index 865ddb3d91d..31533528ee2 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -16408,8 +17248,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archive_cmds_CXX" | $SED "$delay_single_quote
+@@ -16464,8 +17304,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archive_cmds_CXX" | $SED "$delay_single_quote
  compiler_CXX='`$ECHO "$compiler_CXX" | $SED "$delay_single_quote_subst"`'
  GCC_CXX='`$ECHO "$GCC_CXX" | $SED "$delay_single_quote_subst"`'
  lt_prog_compiler_no_builtin_flag_CXX='`$ECHO "$lt_prog_compiler_no_builtin_flag_CXX" | $SED "$delay_single_quote_subst"`'
@@ -12495,7 +12452,7 @@ index 865ddb3d91d..31533528ee2 100755
  lt_prog_compiler_static_CXX='`$ECHO "$lt_prog_compiler_static_CXX" | $SED "$delay_single_quote_subst"`'
  lt_cv_prog_compiler_c_o_CXX='`$ECHO "$lt_cv_prog_compiler_c_o_CXX" | $SED "$delay_single_quote_subst"`'
  archive_cmds_need_lc_CXX='`$ECHO "$archive_cmds_need_lc_CXX" | $SED "$delay_single_quote_subst"`'
-@@ -16436,12 +17276,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$hardcode_shlibpath_var_CXX" | $SED "$delay_
+@@ -16492,12 +17332,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$hardcode_shlibpath_var_CXX" | $SED "$delay_
  hardcode_automatic_CXX='`$ECHO "$hardcode_automatic_CXX" | $SED "$delay_single_quote_subst"`'
  inherit_rpath_CXX='`$ECHO "$inherit_rpath_CXX" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs_CXX='`$ECHO "$link_all_deplibs_CXX" | $SED "$delay_single_quote_subst"`'
@@ -12509,7 +12466,7 @@ index 865ddb3d91d..31533528ee2 100755
  file_list_spec_CXX='`$ECHO "$file_list_spec_CXX" | $SED "$delay_single_quote_subst"`'
  hardcode_action_CXX='`$ECHO "$hardcode_action_CXX" | $SED "$delay_single_quote_subst"`'
  compiler_lib_search_dirs_CXX='`$ECHO "$compiler_lib_search_dirs_CXX" | $SED "$delay_single_quote_subst"`'
-@@ -16479,8 +17319,13 @@ reload_flag \
+@@ -16535,8 +17375,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -12523,7 +12480,7 @@ index 865ddb3d91d..31533528ee2 100755
  STRIP \
  RANLIB \
  CC \
-@@ -16490,12 +17335,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -16546,12 +17391,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -12539,7 +12496,7 @@ index 865ddb3d91d..31533528ee2 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -16511,7 +17358,6 @@ no_undefined_flag \
+@@ -16567,7 +17414,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -12547,7 +12504,7 @@ index 865ddb3d91d..31533528ee2 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -16533,8 +17379,8 @@ LD_CXX \
+@@ -16589,8 +17435,8 @@ LD_CXX \
  reload_flag_CXX \
  compiler_CXX \
  lt_prog_compiler_no_builtin_flag_CXX \
@@ -12557,7 +12514,7 @@ index 865ddb3d91d..31533528ee2 100755
  lt_prog_compiler_static_CXX \
  lt_cv_prog_compiler_c_o_CXX \
  export_dynamic_flag_spec_CXX \
-@@ -16546,7 +17392,6 @@ no_undefined_flag_CXX \
+@@ -16602,7 +17448,6 @@ no_undefined_flag_CXX \
  hardcode_libdir_flag_spec_CXX \
  hardcode_libdir_flag_spec_ld_CXX \
  hardcode_libdir_separator_CXX \
@@ -12565,7 +12522,7 @@ index 865ddb3d91d..31533528ee2 100755
  exclude_expsyms_CXX \
  include_expsyms_CXX \
  file_list_spec_CXX \
-@@ -16580,6 +17425,7 @@ module_cmds \
+@@ -16636,6 +17481,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -12573,7 +12530,7 @@ index 865ddb3d91d..31533528ee2 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -16594,7 +17440,8 @@ archive_expsym_cmds_CXX \
+@@ -16650,7 +17496,8 @@ archive_expsym_cmds_CXX \
  module_cmds_CXX \
  module_expsym_cmds_CXX \
  export_symbols_cmds_CXX \
@@ -12583,7 +12540,7 @@ index 865ddb3d91d..31533528ee2 100755
      case \`eval \\\\\$ECHO \\\\""\\\\\$\$var"\\\\"\` in
      *[\\\\\\\`\\"\\\$]*)
        eval "lt_\$var=\\\\\\"\\\`\\\$ECHO \\"\\\$\$var\\" | \\\$SED -e \\"\\\$double_quote_subst\\" -e \\"\\\$sed_quote_subst\\" -e \\"\\\$delay_variable_subst\\"\\\`\\\\\\""
-@@ -17348,7 +18195,8 @@ $as_echo X"$file" |
+@@ -17404,7 +18251,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -12593,7 +12550,7 @@ index 865ddb3d91d..31533528ee2 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -17451,19 +18299,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -17507,19 +18355,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -12637,7 +12594,7 @@ index 865ddb3d91d..31533528ee2 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -17493,6 +18364,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -17549,6 +18420,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -12650,7 +12607,7 @@ index 865ddb3d91d..31533528ee2 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -17502,6 +18379,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -17558,6 +18435,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -12660,7 +12617,7 @@ index 865ddb3d91d..31533528ee2 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -17616,12 +18496,12 @@ with_gcc=$GCC
+@@ -17672,12 +18552,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -12676,7 +12633,7 @@ index 865ddb3d91d..31533528ee2 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -17708,9 +18588,6 @@ inherit_rpath=$inherit_rpath
+@@ -17764,9 +18644,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -12686,7 +12643,7 @@ index 865ddb3d91d..31533528ee2 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -17726,6 +18603,9 @@ include_expsyms=$lt_include_expsyms
+@@ -17782,6 +18659,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -12696,7 +12653,7 @@ index 865ddb3d91d..31533528ee2 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -17772,210 +18652,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -17828,210 +18708,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -13070,7 +13027,7 @@ index 865ddb3d91d..31533528ee2 100755
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-@@ -18003,12 +18842,12 @@ with_gcc=$GCC_CXX
+@@ -18059,12 +18898,12 @@ with_gcc=$GCC_CXX
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag_CXX
  
@@ -13086,7 +13043,7 @@ index 865ddb3d91d..31533528ee2 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static_CXX
  
-@@ -18095,9 +18934,6 @@ inherit_rpath=$inherit_rpath_CXX
+@@ -18151,9 +18990,6 @@ inherit_rpath=$inherit_rpath_CXX
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs_CXX
  
@@ -13096,7 +13053,7 @@ index 865ddb3d91d..31533528ee2 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols_CXX
  
-@@ -18113,6 +18949,9 @@ include_expsyms=$lt_include_expsyms_CXX
+@@ -18169,6 +19005,9 @@ include_expsyms=$lt_include_expsyms_CXX
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds_CXX
  
@@ -13107,7 +13064,7 @@ index 865ddb3d91d..31533528ee2 100755
  file_list_spec=$lt_file_list_spec_CXX
  
 diff --git a/gprofng/src/Makefile.in b/gprofng/src/Makefile.in
-index b881268b0d9..cfc98458e79 100644
+index db763ef71b2..726dc69bf85 100644
 --- a/gprofng/src/Makefile.in
 +++ b/gprofng/src/Makefile.in
 @@ -321,6 +321,7 @@ CXXFLAGS = @CXXFLAGS@
@@ -13118,7 +13075,7 @@ index b881268b0d9..cfc98458e79 100644
  DSYMUTIL = @DSYMUTIL@
  DUMPBIN = @DUMPBIN@
  ECHO_C = @ECHO_C@
-@@ -356,6 +357,7 @@ LN_S = @LN_S@
+@@ -355,6 +356,7 @@ LN_S = @LN_S@
  LTLIBOBJS = @LTLIBOBJS@
  MAINT = @MAINT@
  MAKEINFO = @MAKEINFO@
@@ -13127,10 +13084,10 @@ index b881268b0d9..cfc98458e79 100644
  NM = @NM@
  NMEDIT = @NMEDIT@
 diff --git a/ld/Makefile.in b/ld/Makefile.in
-index c21c554e432..729e1f47e85 100644
+index 15311048855..71b39ee9311 100644
 --- a/ld/Makefile.in
 +++ b/ld/Makefile.in
-@@ -384,6 +384,7 @@ CYGPATH_W = @CYGPATH_W@
+@@ -390,6 +390,7 @@ CYGPATH_W = @CYGPATH_W@
  DATADIRNAME = @DATADIRNAME@
  DEFS = @DEFS@
  DEPDIR = @DEPDIR@
@@ -13138,7 +13095,7 @@ index c21c554e432..729e1f47e85 100644
  DSYMUTIL = @DSYMUTIL@
  DUMPBIN = @DUMPBIN@
  ECHO_C = @ECHO_C@
-@@ -434,6 +435,7 @@ LN_S = @LN_S@
+@@ -445,6 +446,7 @@ LTLIBINTL = @LTLIBINTL@
  LTLIBOBJS = @LTLIBOBJS@
  MAINT = @MAINT@
  MAKEINFO = @MAKEINFO@
@@ -13146,7 +13103,7 @@ index c21c554e432..729e1f47e85 100644
  MKDIR_P = @MKDIR_P@
  MKINSTALLDIRS = @MKINSTALLDIRS@
  MSGFMT = @MSGFMT@
-@@ -485,6 +487,7 @@ abs_builddir = @abs_builddir@
+@@ -495,6 +497,7 @@ abs_builddir = @abs_builddir@
  abs_srcdir = @abs_srcdir@
  abs_top_builddir = @abs_top_builddir@
  abs_top_srcdir = @abs_top_srcdir@
@@ -13155,10 +13112,10 @@ index c21c554e432..729e1f47e85 100644
  ac_ct_CXX = @ac_ct_CXX@
  ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
 diff --git a/ld/configure b/ld/configure
-index 29896853a90..9e93585f94e 100755
+index 867f3f62c88..60fbf749e61 100755
 --- a/ld/configure
 +++ b/ld/configure
-@@ -700,8 +700,11 @@ OTOOL
+@@ -705,8 +705,11 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -13170,7 +13127,7 @@ index 29896853a90..9e93585f94e 100755
  OBJDUMP
  LN_S
  NM
-@@ -831,6 +834,7 @@ enable_static
+@@ -836,6 +839,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -13178,7 +13135,7 @@ index 29896853a90..9e93585f94e 100755
  enable_libtool_lock
  enable_plugins
  enable_largefile
-@@ -1562,6 +1566,8 @@ Optional Packages:
+@@ -1581,6 +1585,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -13186,8 +13143,8 @@ index 29896853a90..9e93585f94e 100755
 +                        (or the compiler's sysroot if not specified).
    --with-lib-path=dir1:dir2...  set default LIB_PATH
    --with-sysroot=DIR Search for usr/lib et al within DIR.
-   --with-system-zlib      use installed libz
-@@ -5533,8 +5539,8 @@ esac
+   --with-gnu-ld           assume the C compiler uses GNU ld default=no
+@@ -5560,8 +5566,8 @@ esac
  
  
  
@@ -13198,7 +13155,7 @@ index 29896853a90..9e93585f94e 100755
  
  
  
-@@ -5574,7 +5580,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -5601,7 +5607,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -13207,7 +13164,7 @@ index 29896853a90..9e93585f94e 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -6267,8 +6273,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -6294,8 +6300,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -13218,7 +13175,7 @@ index 29896853a90..9e93585f94e 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -6317,6 +6323,80 @@ esac
+@@ -6344,6 +6350,80 @@ esac
  
  
  
@@ -13299,7 +13256,7 @@ index 29896853a90..9e93585f94e 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if ${lt_cv_ld_reload_flag+:} false; then :
-@@ -6333,6 +6413,11 @@ case $reload_flag in
+@@ -6360,6 +6440,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -13311,7 +13268,7 @@ index 29896853a90..9e93585f94e 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -6501,7 +6586,8 @@ mingw* | pw32*)
+@@ -6528,7 +6613,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -13321,7 +13278,7 @@ index 29896853a90..9e93585f94e 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6655,6 +6741,21 @@ esac
+@@ -6687,6 +6773,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -13343,7 +13300,7 @@ index 29896853a90..9e93585f94e 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6670,6 +6771,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -6702,6 +6803,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -13501,7 +13458,7 @@ index 29896853a90..9e93585f94e 100755
  plugin_option=
  plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
  for plugin in $plugin_names; do
-@@ -6684,8 +6936,10 @@ for plugin in $plugin_names; do
+@@ -6716,8 +6968,10 @@ for plugin in $plugin_names; do
  done
  
  if test -n "$ac_tool_prefix"; then
@@ -13514,7 +13471,7 @@ index 29896853a90..9e93585f94e 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_AR+:} false; then :
-@@ -6701,7 +6955,7 @@ do
+@@ -6733,7 +6987,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -13523,7 +13480,7 @@ index 29896853a90..9e93585f94e 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6721,11 +6975,15 @@ $as_echo "no" >&6; }
+@@ -6753,11 +7007,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -13542,7 +13499,7 @@ index 29896853a90..9e93585f94e 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_ac_ct_AR+:} false; then :
-@@ -6741,7 +6999,7 @@ do
+@@ -6773,7 +7031,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -13551,7 +13508,7 @@ index 29896853a90..9e93585f94e 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6760,6 +7018,10 @@ else
+@@ -6792,6 +7050,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -13562,7 +13519,7 @@ index 29896853a90..9e93585f94e 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6771,25 +7033,19 @@ ac_tool_warned=yes ;;
+@@ -6803,29 +7065,81 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -13594,12 +13551,16 @@ index 29896853a90..9e93585f94e 100755
 +  rm -f conftest.*
 +: ${AR=ar}
 +: ${AR_FLAGS=cru}
- 
- 
- 
-@@ -6801,6 +7057,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
- 
- 
++
++
++
++
++
++
++
++
++
++
  
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE support" >&5
 +$as_echo_n "checking for archiver @FILE support... " >&6; }
@@ -13613,7 +13574,7 @@ index 29896853a90..9e93585f94e 100755
 +int
 +main ()
 +{
-+
+ 
 +  ;
 +  return 0;
 +}
@@ -13642,27 +13603,20 @@ index 29896853a90..9e93585f94e 100755
 +
 +fi
 +rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
-+
+ 
 +fi
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_ar_at_file" >&5
 +$as_echo "$lt_cv_ar_at_file" >&6; }
-+
+ 
 +if test "x$lt_cv_ar_at_file" = xno; then
 +  archiver_list_spec=
 +else
 +  archiver_list_spec=$lt_cv_ar_at_file
 +fi
-+
-+
-+
-+
-+
-+
-+
- if test -n "$ac_tool_prefix"; then
-   # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
- set dummy ${ac_tool_prefix}strip; ac_word=$2
-@@ -7140,8 +7454,8 @@ esac
+ 
+ 
+ 
+@@ -7172,8 +7486,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -13673,7 +13627,7 @@ index 29896853a90..9e93585f94e 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -7177,6 +7491,7 @@ for ac_symprfx in "" "_"; do
+@@ -7209,6 +7523,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -13681,7 +13635,7 @@ index 29896853a90..9e93585f94e 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -7218,6 +7533,18 @@ _LT_EOF
+@@ -7250,6 +7565,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -13700,7 +13654,7 @@ index 29896853a90..9e93585f94e 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -7229,7 +7556,7 @@ _LT_EOF
+@@ -7261,7 +7588,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -13709,7 +13663,7 @@ index 29896853a90..9e93585f94e 100755
    const char *name;
    void       *address;
  }
-@@ -7255,8 +7582,8 @@ static const void *lt_preloaded_setup() {
+@@ -7287,8 +7614,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -13720,7 +13674,7 @@ index 29896853a90..9e93585f94e 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -7266,8 +7593,8 @@ _LT_EOF
+@@ -7298,8 +7625,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -13731,7 +13685,7 @@ index 29896853a90..9e93585f94e 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7304,6 +7631,17 @@ else
+@@ -7336,6 +7663,27 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -13746,30 +13700,34 @@ index 29896853a90..9e93585f94e 100755
 +
 +
 +
- 
- 
- 
-@@ -7320,6 +7658,44 @@ fi
- 
- 
- 
 +
 +
 +
 +
 +
 +
++
++
++
++
+ 
+ 
+ 
+@@ -7348,10 +7696,38 @@ fi
+ 
+ 
+ 
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
 +$as_echo_n "checking for sysroot... " >&6; }
-+
+ 
 +# Check whether --with-libtool-sysroot was given.
 +if test "${with_libtool_sysroot+set}" = set; then :
 +  withval=$with_libtool_sysroot;
 +else
 +  with_libtool_sysroot=no
 +fi
-+
-+
+ 
+ 
 +lt_sysroot=
 +case ${with_libtool_sysroot} in #(
 + yes)
@@ -13788,13 +13746,13 @@ index 29896853a90..9e93585f94e 100755
 +   as_fn_error $? "The sysroot must be an absolute path." "$LINENO" 5
 +   ;;
 +esac
-+
+ 
 + { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
 +$as_echo "${lt_sysroot:-no}" >&6; }
  
  
  
-@@ -7531,6 +7907,123 @@ esac
+@@ -7563,6 +7939,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -13918,7 +13876,7 @@ index 29896853a90..9e93585f94e 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -8094,6 +8587,8 @@ _LT_EOF
+@@ -8126,6 +8619,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -13927,7 +13885,7 @@ index 29896853a90..9e93585f94e 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -8162,6 +8657,16 @@ done
+@@ -8196,6 +8691,16 @@ done
  
  
  
@@ -13944,7 +13902,7 @@ index 29896853a90..9e93585f94e 100755
  
  
  # Set options
-@@ -8677,8 +9182,6 @@ fi
+@@ -8711,8 +9216,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -13953,7 +13911,7 @@ index 29896853a90..9e93585f94e 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8844,6 +9347,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8878,6 +9381,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -13966,7 +13924,7 @@ index 29896853a90..9e93585f94e 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8906,7 +9415,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8940,7 +9449,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -13975,7 +13933,7 @@ index 29896853a90..9e93585f94e 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8963,13 +9472,17 @@ case $host_os in
+@@ -8997,13 +9506,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -13999,7 +13957,7 @@ index 29896853a90..9e93585f94e 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -9030,6 +9543,11 @@ fi
+@@ -9064,6 +9577,11 @@ fi
  
  
  
@@ -14011,7 +13969,7 @@ index 29896853a90..9e93585f94e 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -9380,7 +9898,8 @@ _LT_EOF
+@@ -9414,7 +9932,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -14021,7 +13979,7 @@ index 29896853a90..9e93585f94e 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -9479,12 +9998,12 @@ _LT_EOF
+@@ -9513,12 +10032,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -14036,7 +13994,7 @@ index 29896853a90..9e93585f94e 100755
  	  fi
  	  ;;
  	esac
-@@ -9498,8 +10017,8 @@ _LT_EOF
+@@ -9532,8 +10051,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -14047,7 +14005,7 @@ index 29896853a90..9e93585f94e 100755
        fi
        ;;
  
-@@ -9517,8 +10036,8 @@ _LT_EOF
+@@ -9551,8 +10070,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -14058,7 +14016,7 @@ index 29896853a90..9e93585f94e 100755
        else
  	ld_shlibs=no
        fi
-@@ -9564,8 +10083,8 @@ _LT_EOF
+@@ -9598,8 +10117,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -14069,7 +14027,7 @@ index 29896853a90..9e93585f94e 100755
        else
  	ld_shlibs=no
        fi
-@@ -9695,7 +10214,13 @@ _LT_EOF
+@@ -9729,7 +10248,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -14084,7 +14042,7 @@ index 29896853a90..9e93585f94e 100755
  /* end confdefs.h.  */
  
  int
-@@ -9708,22 +10233,29 @@ main ()
+@@ -9742,22 +10267,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -14127,7 +14085,7 @@ index 29896853a90..9e93585f94e 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9735,7 +10267,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9769,7 +10301,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -14142,7 +14100,7 @@ index 29896853a90..9e93585f94e 100755
  /* end confdefs.h.  */
  
  int
-@@ -9748,22 +10286,29 @@ main ()
+@@ -9782,22 +10320,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -14185,11 +14143,10 @@ index 29896853a90..9e93585f94e 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9807,21 +10352,64 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
-       # When not using gcc, we currently assume that we are using
+@@ -9842,20 +10387,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
--      # no search path for DLLs.
+       # no search path for DLLs.
 -      hardcode_libdir_flag_spec=' '
 -      allow_undefined_flag=unsupported
 -      # Tell ltmain to make .lib files, not .a files.
@@ -14204,7 +14161,6 @@ index 29896853a90..9e93585f94e 100755
 -      old_archive_cmds='lib -OUT:$oldlib$oldobjs$old_deplibs'
 -      fix_srcfile_path='`cygpath -w "$srcfile"`'
 -      enable_shared_with_static_runtimes=yes
-+      # no search path for DLLs.
 +      case $cc_basename in
 +      cl*)
 +	# Native MSVC
@@ -14265,7 +14221,7 @@ index 29896853a90..9e93585f94e 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9882,7 +10470,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9916,7 +10504,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -14274,7 +14230,7 @@ index 29896853a90..9e93585f94e 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9890,7 +10478,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9924,7 +10512,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -14283,7 +14239,7 @@ index 29896853a90..9e93585f94e 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9906,7 +10494,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9940,7 +10528,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -14292,8 +14248,8 @@ index 29896853a90..9e93585f94e 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9930,10 +10518,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
- 	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
+@@ -9964,10 +10552,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+ 	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
 -	  archive_cmds='$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
@@ -14305,7 +14261,7 @@ index 29896853a90..9e93585f94e 100755
  	  ;;
  	esac
        else
-@@ -10012,23 +10600,36 @@ fi
+@@ -10046,23 +10634,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -14350,7 +14306,7 @@ index 29896853a90..9e93585f94e 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -10113,7 +10714,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10147,7 +10748,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -14359,7 +14315,7 @@ index 29896853a90..9e93585f94e 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -10132,9 +10733,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10166,9 +10767,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -14371,7 +14327,7 @@ index 29896853a90..9e93585f94e 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10710,8 +11311,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10744,8 +11345,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -14383,7 +14339,7 @@ index 29896853a90..9e93585f94e 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10744,13 +11346,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10778,13 +11380,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -14456,16 +14412,16 @@ index 29896853a90..9e93585f94e 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -11628,7 +12288,7 @@ else
+@@ -11686,7 +12346,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11628 "configure"
+-#line 11686 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11672,10 +12332,10 @@ else
+@@ -11730,10 +12390,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -14478,16 +14434,16 @@ index 29896853a90..9e93585f94e 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11734,7 +12394,7 @@ else
+@@ -11792,7 +12452,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11734 "configure"
+-#line 11792 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11778,10 +12438,10 @@ else
+@@ -11836,10 +12496,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -14500,7 +14456,7 @@ index 29896853a90..9e93585f94e 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -12173,6 +12833,7 @@ $RM -r conftest*
+@@ -12231,6 +12891,7 @@ $RM -r conftest*
  
    # Allow CC to be a program name with arguments.
    lt_save_CC=$CC
@@ -14508,7 +14464,7 @@ index 29896853a90..9e93585f94e 100755
    lt_save_LD=$LD
    lt_save_GCC=$GCC
    GCC=$GXX
-@@ -12190,6 +12851,7 @@ $RM -r conftest*
+@@ -12248,6 +12909,7 @@ $RM -r conftest*
    fi
    test -z "${LDCXX+set}" || LD=$LDCXX
    CC=${CXX-"c++"}
@@ -14516,7 +14472,7 @@ index 29896853a90..9e93585f94e 100755
    compiler=$CC
    compiler_CXX=$CC
    for cc_temp in $compiler""; do
-@@ -12472,7 +13134,13 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
+@@ -12530,7 +13192,13 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
            allow_undefined_flag_CXX='-berok'
            # Determine the default libpath from the value encoded in an empty
            # executable.
@@ -14531,7 +14487,7 @@ index 29896853a90..9e93585f94e 100755
  /* end confdefs.h.  */
  
  int
-@@ -12485,22 +13153,29 @@ main ()
+@@ -12543,22 +13211,29 @@ main ()
  _ACEOF
  if ac_fn_cxx_try_link "$LINENO"; then :
  
@@ -14574,7 +14530,7 @@ index 29896853a90..9e93585f94e 100755
  
            hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
  
-@@ -12513,7 +13188,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12571,7 +13246,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
            else
  	    # Determine the default libpath from the value encoded in an
  	    # empty executable.
@@ -14589,7 +14545,7 @@ index 29896853a90..9e93585f94e 100755
  /* end confdefs.h.  */
  
  int
-@@ -12526,22 +13207,29 @@ main ()
+@@ -12584,22 +13265,29 @@ main ()
  _ACEOF
  if ac_fn_cxx_try_link "$LINENO"; then :
  
@@ -14632,7 +14588,7 @@ index 29896853a90..9e93585f94e 100755
  
  	    hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
  	    # Warning - without using the other run time loading flags,
-@@ -12584,29 +13272,75 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12642,29 +13330,75 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
          ;;
  
        cygwin* | mingw* | pw32* | cegcc*)
@@ -14731,7 +14687,7 @@ index 29896853a90..9e93585f94e 100755
        darwin* | rhapsody*)
  
  
-@@ -12712,7 +13446,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12770,7 +13504,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
              ;;
            *)
              if test "$GXX" = yes; then
@@ -14740,8 +14696,8 @@ index 29896853a90..9e93585f94e 100755
              else
                # FIXME: insert proper C++ library support
                ld_shlibs_CXX=no
-@@ -12783,10 +13517,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
- 	            archive_cmds_CXX='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
+@@ -12841,10 +13575,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+ 	            archive_cmds_CXX='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
  	            ;;
  	          ia64*)
 -	            archive_cmds_CXX='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
@@ -14753,7 +14709,7 @@ index 29896853a90..9e93585f94e 100755
  	            ;;
  	        esac
  	      fi
-@@ -12827,9 +13561,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12885,9 +13619,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
            *)
  	    if test "$GXX" = yes; then
  	      if test "$with_gnu_ld" = no; then
@@ -14765,32 +14721,7 @@ index 29896853a90..9e93585f94e 100755
  	      fi
  	    fi
  	    link_all_deplibs_CXX=yes
-@@ -12899,20 +13633,20 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
- 	      prelink_cmds_CXX='tpldir=Template.dir~
- 		rm -rf $tpldir~
- 		$CC --prelink_objects --instantiation_dir $tpldir $objs $libobjs $compile_deplibs~
--		compile_command="$compile_command `find $tpldir -name \*.o | $NL2SP`"'
-+		compile_command="$compile_command `find $tpldir -name \*.o | sort | $NL2SP`"'
- 	      old_archive_cmds_CXX='tpldir=Template.dir~
- 		rm -rf $tpldir~
- 		$CC --prelink_objects --instantiation_dir $tpldir $oldobjs$old_deplibs~
--		$AR $AR_FLAGS $oldlib$oldobjs$old_deplibs `find $tpldir -name \*.o | $NL2SP`~
-+		$AR $AR_FLAGS $oldlib$oldobjs$old_deplibs `find $tpldir -name \*.o | sort | $NL2SP`~
- 		$RANLIB $oldlib'
- 	      archive_cmds_CXX='tpldir=Template.dir~
- 		rm -rf $tpldir~
- 		$CC --prelink_objects --instantiation_dir $tpldir $predep_objects $libobjs $deplibs $convenience $postdep_objects~
--		$CC -shared $pic_flag $predep_objects $libobjs $deplibs `find $tpldir -name \*.o | $NL2SP` $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
-+		$CC -shared $pic_flag $predep_objects $libobjs $deplibs `find $tpldir -name \*.o | sort | $NL2SP` $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
- 	      archive_expsym_cmds_CXX='tpldir=Template.dir~
- 		rm -rf $tpldir~
- 		$CC --prelink_objects --instantiation_dir $tpldir $predep_objects $libobjs $deplibs $convenience $postdep_objects~
--		$CC -shared $pic_flag $predep_objects $libobjs $deplibs `find $tpldir -name \*.o | $NL2SP` $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname ${wl}-retain-symbols-file ${wl}$export_symbols -o $lib'
-+		$CC -shared $pic_flag $predep_objects $libobjs $deplibs `find $tpldir -name \*.o | sort | $NL2SP` $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname ${wl}-retain-symbols-file ${wl}$export_symbols -o $lib'
- 	      ;;
- 	    *) # Version 6 and above use weak symbols
- 	      archive_cmds_CXX='$CC -shared $pic_flag $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
-@@ -13107,7 +13841,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13165,7 +13899,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	          archive_cmds_CXX='$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
  		  ;;
  	        *)
@@ -14799,7 +14730,7 @@ index 29896853a90..9e93585f94e 100755
  		  ;;
  	      esac
  
-@@ -13153,7 +13887,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13211,7 +13945,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
        solaris*)
          case $cc_basename in
@@ -14808,7 +14739,7 @@ index 29896853a90..9e93585f94e 100755
  	    # Sun C++ 4.2, 5.x and Centerline C++
              archive_cmds_need_lc_CXX=yes
  	    no_undefined_flag_CXX=' -zdefs'
-@@ -13194,9 +13928,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13252,9 +13986,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	    if test "$GXX" = yes && test "$with_gnu_ld" = no; then
  	      no_undefined_flag_CXX=' ${wl}-z ${wl}defs'
  	      if $CC --version | $GREP -v '^2\.7' > /dev/null; then
@@ -14820,7 +14751,7 @@ index 29896853a90..9e93585f94e 100755
  
  	        # Commands to make compiler produce verbose output that lists
  	        # what "hidden" libraries, object files and flags are used when
-@@ -13331,6 +14065,13 @@ private:
+@@ -13390,6 +14124,13 @@ private:
  };
  _LT_EOF
  
@@ -14834,7 +14765,7 @@ index 29896853a90..9e93585f94e 100755
  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
    (eval $ac_compile) 2>&5
    ac_status=$?
-@@ -13344,7 +14085,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -13403,7 +14144,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
    pre_test_object_deps_done=no
  
    for p in `eval "$output_verbose_link_cmd"`; do
@@ -14843,7 +14774,7 @@ index 29896853a90..9e93585f94e 100755
  
      -L* | -R* | -l*)
         # Some compilers place space between "-{L,R}" and the path.
-@@ -13353,13 +14094,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -13412,13 +14153,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
            test $p = "-R"; then
  	 prev=$p
  	 continue
@@ -14870,7 +14801,7 @@ index 29896853a90..9e93585f94e 100755
  	   # Internal compiler library paths should come after those
  	   # provided the user.  The postdeps already come after the
  	   # user supplied libs so there is no need to process them.
-@@ -13379,8 +14129,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -13438,8 +14188,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
  	   postdeps_CXX="${postdeps_CXX} ${prev}${p}"
  	 fi
         fi
@@ -14881,7 +14812,7 @@ index 29896853a90..9e93585f94e 100755
      *.$objext)
         # This assumes that the test object file only shows up
         # once in the compiler output.
-@@ -13416,6 +14168,7 @@ else
+@@ -13475,6 +14227,7 @@ else
  fi
  
  $RM -f confest.$objext
@@ -14889,7 +14820,7 @@ index 29896853a90..9e93585f94e 100755
  
  # PORTME: override above test on systems where it is broken
  case $host_os in
-@@ -13451,7 +14204,7 @@ linux*)
+@@ -13510,7 +14263,7 @@ linux*)
  
  solaris*)
    case $cc_basename in
@@ -14898,7 +14829,7 @@ index 29896853a90..9e93585f94e 100755
      # The more standards-conforming stlport4 library is
      # incompatible with the Cstd library. Avoid specifying
      # it if it's in CXXFLAGS. Ignore libCrun as
-@@ -13516,8 +14269,6 @@ fi
+@@ -13575,8 +14328,6 @@ fi
  lt_prog_compiler_pic_CXX=
  lt_prog_compiler_static_CXX=
  
@@ -14907,7 +14838,7 @@ index 29896853a90..9e93585f94e 100755
  
    # C++ specific cases for pic, static, wl, etc.
    if test "$GXX" = yes; then
-@@ -13622,6 +14373,11 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -13681,6 +14432,11 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	  ;;
  	esac
  	;;
@@ -14919,7 +14850,7 @@ index 29896853a90..9e93585f94e 100755
        dgux*)
  	case $cc_basename in
  	  ec++*)
-@@ -13774,7 +14530,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -13833,7 +14589,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	;;
        solaris*)
  	case $cc_basename in
@@ -14928,7 +14859,7 @@ index 29896853a90..9e93585f94e 100755
  	    # Sun C++ 4.2, 5.x and Centerline C++
  	    lt_prog_compiler_pic_CXX='-KPIC'
  	    lt_prog_compiler_static_CXX='-Bstatic'
-@@ -13839,10 +14595,17 @@ case $host_os in
+@@ -13898,10 +14654,17 @@ case $host_os in
      lt_prog_compiler_pic_CXX="$lt_prog_compiler_pic_CXX -DPIC"
      ;;
  esac
@@ -14949,7 +14880,7 @@ index 29896853a90..9e93585f94e 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -13900,6 +14663,8 @@ fi
+@@ -13959,6 +14722,8 @@ fi
  
  
  
@@ -14958,7 +14889,7 @@ index 29896853a90..9e93585f94e 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -14077,6 +14842,7 @@ fi
+@@ -14136,6 +14901,7 @@ fi
  $as_echo_n "checking whether the $compiler linker ($LD) supports shared libraries... " >&6; }
  
    export_symbols_cmds_CXX='$NM $libobjs $convenience | $global_symbol_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
@@ -14966,7 +14897,7 @@ index 29896853a90..9e93585f94e 100755
    case $host_os in
    aix[4-9]*)
      # If we're using GNU nm, then we don't want the "-C" option.
-@@ -14091,15 +14857,20 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
+@@ -14150,15 +14916,20 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
      ;;
    pw32*)
      export_symbols_cmds_CXX="$ltdll_cmds"
@@ -14992,7 +14923,7 @@ index 29896853a90..9e93585f94e 100755
  
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ld_shlibs_CXX" >&5
  $as_echo "$ld_shlibs_CXX" >&6; }
-@@ -14362,8 +15133,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -14421,8 +15192,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -15004,7 +14935,7 @@ index 29896853a90..9e93585f94e 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -14395,13 +15167,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -14454,13 +15226,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -15077,7 +15008,7 @@ index 29896853a90..9e93585f94e 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -14941,6 +15771,7 @@ fi
+@@ -15024,6 +15854,7 @@ fi
    fi # test -n "$compiler"
  
    CC=$lt_save_CC
@@ -15085,7 +15016,7 @@ index 29896853a90..9e93585f94e 100755
    LDCXX=$LD
    LD=$lt_save_LD
    GCC=$lt_save_GCC
-@@ -18322,13 +19153,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -20310,13 +21141,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -15106,7 +15037,7 @@ index 29896853a90..9e93585f94e 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -18343,14 +19181,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -20331,14 +21169,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -15125,7 +15056,7 @@ index 29896853a90..9e93585f94e 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -18383,12 +19224,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -20371,12 +21212,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -15139,7 +15070,7 @@ index 29896853a90..9e93585f94e 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -18427,8 +19268,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archive_cmds_CXX" | $SED "$delay_single_quote
+@@ -20415,8 +21256,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archive_cmds_CXX" | $SED "$delay_single_quote
  compiler_CXX='`$ECHO "$compiler_CXX" | $SED "$delay_single_quote_subst"`'
  GCC_CXX='`$ECHO "$GCC_CXX" | $SED "$delay_single_quote_subst"`'
  lt_prog_compiler_no_builtin_flag_CXX='`$ECHO "$lt_prog_compiler_no_builtin_flag_CXX" | $SED "$delay_single_quote_subst"`'
@@ -15149,7 +15080,7 @@ index 29896853a90..9e93585f94e 100755
  lt_prog_compiler_static_CXX='`$ECHO "$lt_prog_compiler_static_CXX" | $SED "$delay_single_quote_subst"`'
  lt_cv_prog_compiler_c_o_CXX='`$ECHO "$lt_cv_prog_compiler_c_o_CXX" | $SED "$delay_single_quote_subst"`'
  archive_cmds_need_lc_CXX='`$ECHO "$archive_cmds_need_lc_CXX" | $SED "$delay_single_quote_subst"`'
-@@ -18455,12 +19296,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$hardcode_shlibpath_var_CXX" | $SED "$delay_
+@@ -20443,12 +21284,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$hardcode_shlibpath_var_CXX" | $SED "$delay_
  hardcode_automatic_CXX='`$ECHO "$hardcode_automatic_CXX" | $SED "$delay_single_quote_subst"`'
  inherit_rpath_CXX='`$ECHO "$inherit_rpath_CXX" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs_CXX='`$ECHO "$link_all_deplibs_CXX" | $SED "$delay_single_quote_subst"`'
@@ -15163,7 +15094,7 @@ index 29896853a90..9e93585f94e 100755
  file_list_spec_CXX='`$ECHO "$file_list_spec_CXX" | $SED "$delay_single_quote_subst"`'
  hardcode_action_CXX='`$ECHO "$hardcode_action_CXX" | $SED "$delay_single_quote_subst"`'
  compiler_lib_search_dirs_CXX='`$ECHO "$compiler_lib_search_dirs_CXX" | $SED "$delay_single_quote_subst"`'
-@@ -18498,8 +19339,13 @@ reload_flag \
+@@ -20486,8 +21327,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -15177,7 +15108,7 @@ index 29896853a90..9e93585f94e 100755
  STRIP \
  RANLIB \
  CC \
-@@ -18509,12 +19355,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -20497,12 +21343,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -15193,7 +15124,7 @@ index 29896853a90..9e93585f94e 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -18530,7 +19378,6 @@ no_undefined_flag \
+@@ -20518,7 +21366,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -15201,7 +15132,7 @@ index 29896853a90..9e93585f94e 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -18552,8 +19399,8 @@ LD_CXX \
+@@ -20540,8 +21387,8 @@ LD_CXX \
  reload_flag_CXX \
  compiler_CXX \
  lt_prog_compiler_no_builtin_flag_CXX \
@@ -15211,7 +15142,7 @@ index 29896853a90..9e93585f94e 100755
  lt_prog_compiler_static_CXX \
  lt_cv_prog_compiler_c_o_CXX \
  export_dynamic_flag_spec_CXX \
-@@ -18565,7 +19412,6 @@ no_undefined_flag_CXX \
+@@ -20553,7 +21400,6 @@ no_undefined_flag_CXX \
  hardcode_libdir_flag_spec_CXX \
  hardcode_libdir_flag_spec_ld_CXX \
  hardcode_libdir_separator_CXX \
@@ -15219,7 +15150,7 @@ index 29896853a90..9e93585f94e 100755
  exclude_expsyms_CXX \
  include_expsyms_CXX \
  file_list_spec_CXX \
-@@ -18599,6 +19445,7 @@ module_cmds \
+@@ -20587,6 +21433,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -15227,7 +15158,7 @@ index 29896853a90..9e93585f94e 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -18613,7 +19460,8 @@ archive_expsym_cmds_CXX \
+@@ -20601,7 +21448,8 @@ archive_expsym_cmds_CXX \
  module_cmds_CXX \
  module_expsym_cmds_CXX \
  export_symbols_cmds_CXX \
@@ -15237,7 +15168,7 @@ index 29896853a90..9e93585f94e 100755
      case \`eval \\\\\$ECHO \\\\""\\\\\$\$var"\\\\"\` in
      *[\\\\\\\`\\"\\\$]*)
        eval "lt_\$var=\\\\\\"\\\`\\\$ECHO \\"\\\$\$var\\" | \\\$SED -e \\"\\\$double_quote_subst\\" -e \\"\\\$sed_quote_subst\\" -e \\"\\\$delay_variable_subst\\"\\\`\\\\\\""
-@@ -19378,7 +20226,8 @@ $as_echo X"$file" |
+@@ -21374,7 +22222,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -15247,7 +15178,7 @@ index 29896853a90..9e93585f94e 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -19481,19 +20330,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -21477,19 +22326,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -15291,7 +15222,7 @@ index 29896853a90..9e93585f94e 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -19523,6 +20395,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -21519,6 +22391,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -15304,7 +15235,7 @@ index 29896853a90..9e93585f94e 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -19532,6 +20410,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -21528,6 +22406,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -15314,7 +15245,7 @@ index 29896853a90..9e93585f94e 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -19646,12 +20527,12 @@ with_gcc=$GCC
+@@ -21642,12 +22523,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -15330,7 +15261,7 @@ index 29896853a90..9e93585f94e 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -19738,9 +20619,6 @@ inherit_rpath=$inherit_rpath
+@@ -21734,9 +22615,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -15340,7 +15271,7 @@ index 29896853a90..9e93585f94e 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -19756,6 +20634,9 @@ include_expsyms=$lt_include_expsyms
+@@ -21752,6 +22630,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -15350,7 +15281,7 @@ index 29896853a90..9e93585f94e 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -19802,210 +20683,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -21798,210 +22679,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -15724,7 +15655,7 @@ index 29896853a90..9e93585f94e 100755
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-@@ -20033,12 +20873,12 @@ with_gcc=$GCC_CXX
+@@ -22029,12 +22869,12 @@ with_gcc=$GCC_CXX
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag_CXX
  
@@ -15740,7 +15671,7 @@ index 29896853a90..9e93585f94e 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static_CXX
  
-@@ -20125,9 +20965,6 @@ inherit_rpath=$inherit_rpath_CXX
+@@ -22121,9 +22961,6 @@ inherit_rpath=$inherit_rpath_CXX
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs_CXX
  
@@ -15750,7 +15681,7 @@ index 29896853a90..9e93585f94e 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols_CXX
  
-@@ -20143,6 +20980,9 @@ include_expsyms=$lt_include_expsyms_CXX
+@@ -22139,6 +22976,9 @@ include_expsyms=$lt_include_expsyms_CXX
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds_CXX
  
@@ -16244,7 +16175,7 @@ index 528e6173930..d88a5ec84f2 100644
  # This file is free software; the Free Software Foundation
  # gives unlimited permission to copy and/or distribute it,
 diff --git a/libbacktrace/configure b/libbacktrace/configure
-index 406b67b8cbc..51f0a264cb7 100755
+index e5ca8ad9379..b7c4c4be78d 100755
 --- a/libbacktrace/configure
 +++ b/libbacktrace/configure
 @@ -680,7 +680,10 @@ OTOOL
@@ -16483,7 +16414,7 @@ index 406b67b8cbc..51f0a264cb7 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6568,6 +6666,21 @@ esac
+@@ -6573,6 +6671,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -16505,7 +16436,7 @@ index 406b67b8cbc..51f0a264cb7 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6583,6 +6696,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -6588,6 +6701,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -16663,7 +16594,7 @@ index 406b67b8cbc..51f0a264cb7 100755
  plugin_option=
  plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
  for plugin in $plugin_names; do
-@@ -6597,8 +6861,10 @@ for plugin in $plugin_names; do
+@@ -6602,8 +6866,10 @@ for plugin in $plugin_names; do
  done
  
  if test -n "$ac_tool_prefix"; then
@@ -16676,7 +16607,7 @@ index 406b67b8cbc..51f0a264cb7 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_AR+:} false; then :
-@@ -6614,7 +6880,7 @@ do
+@@ -6619,7 +6885,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -16685,7 +16616,7 @@ index 406b67b8cbc..51f0a264cb7 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6634,11 +6900,15 @@ $as_echo "no" >&6; }
+@@ -6639,11 +6905,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -16704,7 +16635,7 @@ index 406b67b8cbc..51f0a264cb7 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_ac_ct_AR+:} false; then :
-@@ -6654,7 +6924,7 @@ do
+@@ -6659,7 +6929,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -16713,7 +16644,7 @@ index 406b67b8cbc..51f0a264cb7 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6673,6 +6943,10 @@ else
+@@ -6678,6 +6948,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -16724,7 +16655,7 @@ index 406b67b8cbc..51f0a264cb7 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6684,31 +6958,83 @@ ac_tool_warned=yes ;;
+@@ -6689,31 +6963,83 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -16823,7 +16754,7 @@ index 406b67b8cbc..51f0a264cb7 100755
  
  
  
-@@ -7053,8 +7379,8 @@ esac
+@@ -7058,8 +7384,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -16834,7 +16765,7 @@ index 406b67b8cbc..51f0a264cb7 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -7090,6 +7416,7 @@ for ac_symprfx in "" "_"; do
+@@ -7095,6 +7421,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -16842,7 +16773,7 @@ index 406b67b8cbc..51f0a264cb7 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -7131,6 +7458,18 @@ _LT_EOF
+@@ -7136,6 +7463,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -16861,7 +16792,7 @@ index 406b67b8cbc..51f0a264cb7 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -7142,7 +7481,7 @@ _LT_EOF
+@@ -7147,7 +7486,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -16870,7 +16801,7 @@ index 406b67b8cbc..51f0a264cb7 100755
    const char *name;
    void       *address;
  }
-@@ -7168,8 +7507,8 @@ static const void *lt_preloaded_setup() {
+@@ -7173,8 +7512,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -16881,7 +16812,7 @@ index 406b67b8cbc..51f0a264cb7 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -7179,8 +7518,8 @@ _LT_EOF
+@@ -7184,8 +7523,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -16892,7 +16823,7 @@ index 406b67b8cbc..51f0a264cb7 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7217,6 +7556,18 @@ else
+@@ -7222,6 +7561,18 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -16911,7 +16842,7 @@ index 406b67b8cbc..51f0a264cb7 100755
  
  
  
-@@ -7233,6 +7584,43 @@ fi
+@@ -7238,6 +7589,43 @@ fi
  
  
  
@@ -16955,7 +16886,7 @@ index 406b67b8cbc..51f0a264cb7 100755
  
  
  
-@@ -7399,50 +7787,167 @@ _ACEOF
+@@ -7404,50 +7792,167 @@ _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
    lt_cv_cc_needs_belf=yes
  else
@@ -17162,7 +17093,7 @@ index 406b67b8cbc..51f0a264cb7 100755
  
  
    case $host_os in
-@@ -8007,6 +8512,8 @@ _LT_EOF
+@@ -8012,6 +8517,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -17171,7 +17102,7 @@ index 406b67b8cbc..51f0a264cb7 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -8589,8 +9096,6 @@ fi
+@@ -8596,8 +9103,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -17180,7 +17111,7 @@ index 406b67b8cbc..51f0a264cb7 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8756,6 +9261,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8763,6 +9268,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -17193,7 +17124,7 @@ index 406b67b8cbc..51f0a264cb7 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8818,7 +9329,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8825,7 +9336,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -17202,7 +17133,7 @@ index 406b67b8cbc..51f0a264cb7 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8875,13 +9386,17 @@ case $host_os in
+@@ -8882,13 +9393,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -17226,7 +17157,7 @@ index 406b67b8cbc..51f0a264cb7 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8942,6 +9457,11 @@ fi
+@@ -8949,6 +9464,11 @@ fi
  
  
  
@@ -17238,7 +17169,7 @@ index 406b67b8cbc..51f0a264cb7 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -9292,7 +9812,8 @@ _LT_EOF
+@@ -9299,7 +9819,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -17248,7 +17179,7 @@ index 406b67b8cbc..51f0a264cb7 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -9391,12 +9912,12 @@ _LT_EOF
+@@ -9398,12 +9919,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -17263,7 +17194,7 @@ index 406b67b8cbc..51f0a264cb7 100755
  	  fi
  	  ;;
  	esac
-@@ -9410,8 +9931,8 @@ _LT_EOF
+@@ -9417,8 +9938,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -17274,7 +17205,7 @@ index 406b67b8cbc..51f0a264cb7 100755
        fi
        ;;
  
-@@ -9429,8 +9950,8 @@ _LT_EOF
+@@ -9436,8 +9957,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -17285,7 +17216,7 @@ index 406b67b8cbc..51f0a264cb7 100755
        else
  	ld_shlibs=no
        fi
-@@ -9476,8 +9997,8 @@ _LT_EOF
+@@ -9483,8 +10004,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -17296,7 +17227,7 @@ index 406b67b8cbc..51f0a264cb7 100755
        else
  	ld_shlibs=no
        fi
-@@ -9607,7 +10128,13 @@ _LT_EOF
+@@ -9614,7 +10135,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -17311,7 +17242,7 @@ index 406b67b8cbc..51f0a264cb7 100755
  /* end confdefs.h.  */
  
  int
-@@ -9620,22 +10147,29 @@ main ()
+@@ -9627,22 +10154,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -17354,7 +17285,7 @@ index 406b67b8cbc..51f0a264cb7 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9647,7 +10181,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9654,7 +10188,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -17369,7 +17300,7 @@ index 406b67b8cbc..51f0a264cb7 100755
  /* end confdefs.h.  */
  
  int
-@@ -9660,22 +10200,29 @@ main ()
+@@ -9667,22 +10207,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -17412,7 +17343,7 @@ index 406b67b8cbc..51f0a264cb7 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9720,20 +10267,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9727,20 +10274,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -17490,7 +17421,7 @@ index 406b67b8cbc..51f0a264cb7 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9794,7 +10384,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9801,7 +10391,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -17499,7 +17430,7 @@ index 406b67b8cbc..51f0a264cb7 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9802,7 +10392,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9809,7 +10399,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -17508,7 +17439,7 @@ index 406b67b8cbc..51f0a264cb7 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9818,7 +10408,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9825,7 +10415,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -17517,8 +17448,8 @@ index 406b67b8cbc..51f0a264cb7 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9842,10 +10432,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
- 	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
+@@ -9849,10 +10439,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+ 	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
 -	  archive_cmds='$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
@@ -17530,7 +17461,7 @@ index 406b67b8cbc..51f0a264cb7 100755
  	  ;;
  	esac
        else
-@@ -9924,23 +10514,36 @@ fi
+@@ -9931,23 +10521,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -17575,7 +17506,7 @@ index 406b67b8cbc..51f0a264cb7 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -10025,7 +10628,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10032,7 +10635,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -17584,7 +17515,7 @@ index 406b67b8cbc..51f0a264cb7 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -10044,9 +10647,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10051,9 +10654,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -17596,7 +17527,7 @@ index 406b67b8cbc..51f0a264cb7 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10622,8 +11225,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10629,8 +11232,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -17608,7 +17539,7 @@ index 406b67b8cbc..51f0a264cb7 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10656,13 +11260,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10663,13 +11267,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -17681,16 +17612,16 @@ index 406b67b8cbc..51f0a264cb7 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -11540,7 +12202,7 @@ else
+@@ -11571,7 +12233,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11543 "configure"
+-#line 11574 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11584,10 +12246,10 @@ else
+@@ -11615,10 +12277,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -17703,16 +17634,16 @@ index 406b67b8cbc..51f0a264cb7 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11646,7 +12308,7 @@ else
+@@ -11677,7 +12339,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11649 "configure"
+-#line 11680 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11690,10 +12352,10 @@ else
+@@ -11721,10 +12383,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -17725,7 +17656,7 @@ index 406b67b8cbc..51f0a264cb7 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -14979,13 +15641,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -15010,13 +15672,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -17746,7 +17677,7 @@ index 406b67b8cbc..51f0a264cb7 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -15000,14 +15669,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -15031,14 +15700,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -17765,7 +17696,7 @@ index 406b67b8cbc..51f0a264cb7 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -15040,12 +15712,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -15071,12 +15743,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -17779,7 +17710,7 @@ index 406b67b8cbc..51f0a264cb7 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -15100,8 +15772,13 @@ reload_flag \
+@@ -15131,8 +15803,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -17793,7 +17724,7 @@ index 406b67b8cbc..51f0a264cb7 100755
  STRIP \
  RANLIB \
  CC \
-@@ -15111,12 +15788,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -15142,12 +15819,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -17809,7 +17740,7 @@ index 406b67b8cbc..51f0a264cb7 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -15132,7 +15811,6 @@ no_undefined_flag \
+@@ -15163,7 +15842,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -17817,7 +17748,7 @@ index 406b67b8cbc..51f0a264cb7 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -15168,6 +15846,7 @@ module_cmds \
+@@ -15199,6 +15877,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -17825,7 +17756,7 @@ index 406b67b8cbc..51f0a264cb7 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -15866,7 +16545,8 @@ esac ;;
+@@ -15897,7 +16576,8 @@ esac ;;
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -17835,7 +17766,7 @@ index 406b67b8cbc..51f0a264cb7 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -15969,19 +16649,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -16000,19 +16680,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -17879,7 +17810,7 @@ index 406b67b8cbc..51f0a264cb7 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -16011,6 +16714,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -16042,6 +16745,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -17892,7 +17823,7 @@ index 406b67b8cbc..51f0a264cb7 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -16020,6 +16729,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -16051,6 +16760,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -17902,7 +17833,7 @@ index 406b67b8cbc..51f0a264cb7 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -16134,12 +16846,12 @@ with_gcc=$GCC
+@@ -16165,12 +16877,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -17918,7 +17849,7 @@ index 406b67b8cbc..51f0a264cb7 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -16226,9 +16938,6 @@ inherit_rpath=$inherit_rpath
+@@ -16257,9 +16969,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -17928,7 +17859,7 @@ index 406b67b8cbc..51f0a264cb7 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -16244,6 +16953,9 @@ include_expsyms=$lt_include_expsyms
+@@ -16275,6 +16984,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -17938,7 +17869,7 @@ index 406b67b8cbc..51f0a264cb7 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -16276,210 +16988,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -16307,210 +17019,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -18313,10 +18244,10 @@ index 406b67b8cbc..51f0a264cb7 100755
    chmod +x "$ofile"
  
 diff --git a/libctf/Makefile.in b/libctf/Makefile.in
-index 3d2696bcc47..3bad01c3c9b 100644
+index 1cdf105a323..b69d6472e86 100644
 --- a/libctf/Makefile.in
 +++ b/libctf/Makefile.in
-@@ -392,6 +392,7 @@ CYGPATH_W = @CYGPATH_W@
+@@ -442,6 +442,7 @@ CYGPATH_W = @CYGPATH_W@
  DATADIRNAME = @DATADIRNAME@
  DEFS = @DEFS@
  DEPDIR = @DEPDIR@
@@ -18324,19 +18255,19 @@ index 3d2696bcc47..3bad01c3c9b 100644
  DSYMUTIL = @DSYMUTIL@
  DUMPBIN = @DUMPBIN@
  ECHO_C = @ECHO_C@
-@@ -426,6 +427,7 @@ LN_S = @LN_S@
+@@ -481,6 +482,7 @@ LTLIBINTL = @LTLIBINTL@
  LTLIBOBJS = @LTLIBOBJS@
  MAINT = @MAINT@
  MAKEINFO = @MAKEINFO@
 +MANIFEST_TOOL = @MANIFEST_TOOL@
  MKDIR_P = @MKDIR_P@
- NM = @NM@
- NMEDIT = @NMEDIT@
+ MKINSTALLDIRS = @MKINSTALLDIRS@
+ MSGFMT = @MSGFMT@
 diff --git a/libctf/configure b/libctf/configure
-index a0e40f49a80..42bc002c2b9 100755
+index 3701bd8e796..9e36ae7c51c 100755
 --- a/libctf/configure
 +++ b/libctf/configure
-@@ -668,6 +668,8 @@ OTOOL
+@@ -669,6 +669,8 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -18345,15 +18276,15 @@ index a0e40f49a80..42bc002c2b9 100755
  OBJDUMP
  LN_S
  NM
-@@ -799,6 +801,7 @@ enable_static
+@@ -814,6 +816,7 @@ enable_shared
+ enable_static
  with_pic
  enable_fast_install
- with_gnu_ld
 +with_libtool_sysroot
  enable_libtool_lock
  enable_largefile
  enable_werror_always
-@@ -1462,6 +1465,8 @@ Optional Packages:
+@@ -1486,6 +1489,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -18362,7 +18293,7 @@ index a0e40f49a80..42bc002c2b9 100755
    --with-system-zlib      use installed libz
  
  Some influential environment variables:
-@@ -5567,8 +5572,8 @@ esac
+@@ -7501,8 +7506,8 @@ esac
  
  
  
@@ -18373,7 +18304,7 @@ index a0e40f49a80..42bc002c2b9 100755
  
  
  
-@@ -5608,7 +5613,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -7542,7 +7547,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -18382,7 +18313,7 @@ index a0e40f49a80..42bc002c2b9 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -6301,8 +6306,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -8235,8 +8240,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -18393,7 +18324,7 @@ index a0e40f49a80..42bc002c2b9 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -6351,6 +6356,80 @@ esac
+@@ -8285,6 +8290,80 @@ esac
  
  
  
@@ -18474,7 +18405,7 @@ index a0e40f49a80..42bc002c2b9 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if ${lt_cv_ld_reload_flag+:} false; then :
-@@ -6367,6 +6446,11 @@ case $reload_flag in
+@@ -8301,6 +8380,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -18486,7 +18417,7 @@ index a0e40f49a80..42bc002c2b9 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -6535,7 +6619,8 @@ mingw* | pw32*)
+@@ -8469,7 +8553,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -18496,7 +18427,7 @@ index a0e40f49a80..42bc002c2b9 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6689,6 +6774,21 @@ esac
+@@ -8628,6 +8713,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -18518,7 +18449,7 @@ index a0e40f49a80..42bc002c2b9 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6704,6 +6804,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -8643,6 +8743,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -18676,7 +18607,7 @@ index a0e40f49a80..42bc002c2b9 100755
  plugin_option=
  plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
  for plugin in $plugin_names; do
-@@ -6718,8 +6969,10 @@ for plugin in $plugin_names; do
+@@ -8657,8 +8908,10 @@ for plugin in $plugin_names; do
  done
  
  if test -n "$ac_tool_prefix"; then
@@ -18689,7 +18620,7 @@ index a0e40f49a80..42bc002c2b9 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_AR+:} false; then :
-@@ -6735,7 +6988,7 @@ do
+@@ -8674,7 +8927,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -18698,7 +18629,7 @@ index a0e40f49a80..42bc002c2b9 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6755,11 +7008,15 @@ $as_echo "no" >&6; }
+@@ -8694,11 +8947,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -18717,7 +18648,7 @@ index a0e40f49a80..42bc002c2b9 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_ac_ct_AR+:} false; then :
-@@ -6775,7 +7032,7 @@ do
+@@ -8714,7 +8971,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -18726,7 +18657,7 @@ index a0e40f49a80..42bc002c2b9 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6794,6 +7051,10 @@ else
+@@ -8733,6 +8990,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -18737,7 +18668,7 @@ index a0e40f49a80..42bc002c2b9 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6805,25 +7066,19 @@ ac_tool_warned=yes ;;
+@@ -8744,25 +9005,19 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -18772,7 +18703,7 @@ index a0e40f49a80..42bc002c2b9 100755
  
  
  
-@@ -6835,6 +7090,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+@@ -8774,6 +9029,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
  
  
  
@@ -18837,7 +18768,7 @@ index a0e40f49a80..42bc002c2b9 100755
  if test -n "$ac_tool_prefix"; then
    # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
  set dummy ${ac_tool_prefix}strip; ac_word=$2
-@@ -7174,8 +7487,8 @@ esac
+@@ -9113,8 +9426,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -18848,7 +18779,7 @@ index a0e40f49a80..42bc002c2b9 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -7211,6 +7524,7 @@ for ac_symprfx in "" "_"; do
+@@ -9150,6 +9463,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -18856,7 +18787,7 @@ index a0e40f49a80..42bc002c2b9 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -7252,6 +7566,18 @@ _LT_EOF
+@@ -9191,6 +9505,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -18875,7 +18806,7 @@ index a0e40f49a80..42bc002c2b9 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -7263,7 +7589,7 @@ _LT_EOF
+@@ -9202,7 +9528,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -18884,7 +18815,7 @@ index a0e40f49a80..42bc002c2b9 100755
    const char *name;
    void       *address;
  }
-@@ -7289,8 +7615,8 @@ static const void *lt_preloaded_setup() {
+@@ -9228,8 +9554,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -18895,7 +18826,7 @@ index a0e40f49a80..42bc002c2b9 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -7300,8 +7626,8 @@ _LT_EOF
+@@ -9239,8 +9565,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -18906,7 +18837,7 @@ index a0e40f49a80..42bc002c2b9 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7338,6 +7664,17 @@ else
+@@ -9277,6 +9603,17 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -18924,7 +18855,7 @@ index a0e40f49a80..42bc002c2b9 100755
  
  
  
-@@ -7354,6 +7691,44 @@ fi
+@@ -9293,6 +9630,44 @@ fi
  
  
  
@@ -18969,7 +18900,7 @@ index a0e40f49a80..42bc002c2b9 100755
  
  
  
-@@ -7565,6 +7940,123 @@ esac
+@@ -9504,6 +9879,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -19093,7 +19024,7 @@ index a0e40f49a80..42bc002c2b9 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -8128,6 +8620,8 @@ _LT_EOF
+@@ -10067,6 +10559,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -19102,7 +19033,7 @@ index a0e40f49a80..42bc002c2b9 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -8680,8 +9174,6 @@ fi
+@@ -10621,8 +11115,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -19111,7 +19042,7 @@ index a0e40f49a80..42bc002c2b9 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8847,6 +9339,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -10788,6 +11280,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -19124,7 +19055,7 @@ index a0e40f49a80..42bc002c2b9 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8909,7 +9407,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -10850,7 +11348,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -19133,7 +19064,7 @@ index a0e40f49a80..42bc002c2b9 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8966,13 +9464,17 @@ case $host_os in
+@@ -10907,13 +11405,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -19157,7 +19088,7 @@ index a0e40f49a80..42bc002c2b9 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -9033,6 +9535,11 @@ fi
+@@ -10974,6 +11476,11 @@ fi
  
  
  
@@ -19169,7 +19100,7 @@ index a0e40f49a80..42bc002c2b9 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -9383,7 +9890,8 @@ _LT_EOF
+@@ -11324,7 +11831,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -19179,7 +19110,7 @@ index a0e40f49a80..42bc002c2b9 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -9482,12 +9990,12 @@ _LT_EOF
+@@ -11423,12 +11931,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -19194,7 +19125,7 @@ index a0e40f49a80..42bc002c2b9 100755
  	  fi
  	  ;;
  	esac
-@@ -9501,8 +10009,8 @@ _LT_EOF
+@@ -11442,8 +11950,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -19205,7 +19136,7 @@ index a0e40f49a80..42bc002c2b9 100755
        fi
        ;;
  
-@@ -9520,8 +10028,8 @@ _LT_EOF
+@@ -11461,8 +11969,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -19216,7 +19147,7 @@ index a0e40f49a80..42bc002c2b9 100755
        else
  	ld_shlibs=no
        fi
-@@ -9567,8 +10075,8 @@ _LT_EOF
+@@ -11508,8 +12016,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -19227,7 +19158,7 @@ index a0e40f49a80..42bc002c2b9 100755
        else
  	ld_shlibs=no
        fi
-@@ -9698,7 +10206,13 @@ _LT_EOF
+@@ -11639,7 +12147,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -19242,7 +19173,7 @@ index a0e40f49a80..42bc002c2b9 100755
  /* end confdefs.h.  */
  
  int
-@@ -9711,22 +10225,29 @@ main ()
+@@ -11652,22 +12166,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -19285,7 +19216,7 @@ index a0e40f49a80..42bc002c2b9 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9738,7 +10259,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -11679,7 +12200,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -19300,7 +19231,7 @@ index a0e40f49a80..42bc002c2b9 100755
  /* end confdefs.h.  */
  
  int
-@@ -9751,22 +10278,29 @@ main ()
+@@ -11692,22 +12219,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -19343,7 +19274,7 @@ index a0e40f49a80..42bc002c2b9 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9811,20 +10345,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -11752,20 +12286,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -19421,7 +19352,7 @@ index a0e40f49a80..42bc002c2b9 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9885,7 +10462,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -11826,7 +12403,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -19430,7 +19361,7 @@ index a0e40f49a80..42bc002c2b9 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9893,7 +10470,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -11834,7 +12411,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -19439,7 +19370,7 @@ index a0e40f49a80..42bc002c2b9 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9909,7 +10486,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -11850,7 +12427,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -19448,8 +19379,8 @@ index a0e40f49a80..42bc002c2b9 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9933,10 +10510,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
- 	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
+@@ -11874,10 +12451,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+ 	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
 -	  archive_cmds='$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
@@ -19461,7 +19392,7 @@ index a0e40f49a80..42bc002c2b9 100755
  	  ;;
  	esac
        else
-@@ -10015,23 +10592,36 @@ fi
+@@ -11956,23 +12533,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -19506,7 +19437,7 @@ index a0e40f49a80..42bc002c2b9 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -10116,7 +10706,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -12057,7 +12647,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -19515,7 +19446,7 @@ index a0e40f49a80..42bc002c2b9 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -10135,9 +10725,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -12076,9 +12666,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -19527,7 +19458,7 @@ index a0e40f49a80..42bc002c2b9 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10713,8 +11303,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -12654,8 +13244,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -19539,7 +19470,7 @@ index a0e40f49a80..42bc002c2b9 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10747,13 +11338,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -12688,13 +13279,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -19612,16 +19543,19 @@ index a0e40f49a80..42bc002c2b9 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -11631,7 +12280,7 @@ else
+@@ -13596,7 +14245,11 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11634 "configure"
++<<<<<<< HEAD
+ #line 13599 "configure"
++=======
 +#line $LINENO "configure"
++>>>>>>> b932158cf4c (Use libtool 2.4)
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11675,10 +12324,10 @@ else
+@@ -13640,10 +14293,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -19634,16 +19568,19 @@ index a0e40f49a80..42bc002c2b9 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11737,7 +12386,7 @@ else
+@@ -13702,7 +14355,11 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11740 "configure"
++<<<<<<< HEAD
+ #line 13705 "configure"
++=======
 +#line $LINENO "configure"
++>>>>>>> b932158cf4c (Use libtool 2.4)
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11781,10 +12430,10 @@ else
+@@ -13746,10 +14403,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -19656,7 +19593,7 @@ index a0e40f49a80..42bc002c2b9 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -15825,13 +16474,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -17797,13 +18454,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -19677,7 +19614,7 @@ index a0e40f49a80..42bc002c2b9 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -15846,14 +16502,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -17818,14 +18482,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -19696,7 +19633,7 @@ index a0e40f49a80..42bc002c2b9 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -15886,12 +16545,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -17858,12 +18525,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -19710,7 +19647,7 @@ index a0e40f49a80..42bc002c2b9 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -15946,8 +16605,13 @@ reload_flag \
+@@ -17918,8 +18585,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -19724,7 +19661,7 @@ index a0e40f49a80..42bc002c2b9 100755
  STRIP \
  RANLIB \
  CC \
-@@ -15957,12 +16621,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -17929,12 +18601,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -19740,7 +19677,7 @@ index a0e40f49a80..42bc002c2b9 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -15978,7 +16644,6 @@ no_undefined_flag \
+@@ -17950,7 +18624,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -19748,7 +19685,7 @@ index a0e40f49a80..42bc002c2b9 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -16014,6 +16679,7 @@ module_cmds \
+@@ -17986,6 +18659,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -19756,7 +19693,7 @@ index a0e40f49a80..42bc002c2b9 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -16771,7 +17437,8 @@ $as_echo X"$file" |
+@@ -18845,7 +19519,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -19766,7 +19703,7 @@ index a0e40f49a80..42bc002c2b9 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -16874,19 +17541,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -18948,19 +19623,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -19810,7 +19747,7 @@ index a0e40f49a80..42bc002c2b9 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -16916,6 +17606,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -18990,6 +19688,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -19823,7 +19760,7 @@ index a0e40f49a80..42bc002c2b9 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -16925,6 +17621,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -18999,6 +19703,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -19833,7 +19770,7 @@ index a0e40f49a80..42bc002c2b9 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -17039,12 +17738,12 @@ with_gcc=$GCC
+@@ -19113,12 +19820,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -19849,7 +19786,7 @@ index a0e40f49a80..42bc002c2b9 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -17131,9 +17830,6 @@ inherit_rpath=$inherit_rpath
+@@ -19205,9 +19912,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -19859,7 +19796,7 @@ index a0e40f49a80..42bc002c2b9 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -17149,6 +17845,9 @@ include_expsyms=$lt_include_expsyms
+@@ -19223,6 +19927,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -19869,7 +19806,7 @@ index a0e40f49a80..42bc002c2b9 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -17181,210 +17880,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -19255,210 +19962,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -20244,7 +20181,7 @@ index a0e40f49a80..42bc002c2b9 100755
    chmod +x "$ofile"
  
 diff --git a/libsframe/Makefile.in b/libsframe/Makefile.in
-index 08c780caa4a..7ea9c94c2af 100644
+index 9e3d268902b..c22ed33460a 100644
 --- a/libsframe/Makefile.in
 +++ b/libsframe/Makefile.in
 @@ -1,7 +1,7 @@
@@ -21309,7 +21246,7 @@ index b0cdd6b184d..c83d4f62ece 100644
  # This file is free software; the Free Software Foundation
  # gives unlimited permission to copy and/or distribute it,
 diff --git a/libsframe/configure b/libsframe/configure
-index f7ad9c5e29a..78e875956ae 100755
+index 1d9e5e10695..a234c4815b1 100755
 --- a/libsframe/configure
 +++ b/libsframe/configure
 @@ -658,6 +658,8 @@ OTOOL
@@ -21643,7 +21580,7 @@ index f7ad9c5e29a..78e875956ae 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6544,6 +6641,21 @@ esac
+@@ -6549,6 +6646,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -21665,7 +21602,7 @@ index f7ad9c5e29a..78e875956ae 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6559,6 +6671,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -6564,6 +6676,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -21823,7 +21760,7 @@ index f7ad9c5e29a..78e875956ae 100755
  plugin_option=
  plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
  for plugin in $plugin_names; do
-@@ -6573,8 +6836,10 @@ for plugin in $plugin_names; do
+@@ -6578,8 +6841,10 @@ for plugin in $plugin_names; do
  done
  
  if test -n "$ac_tool_prefix"; then
@@ -21836,7 +21773,7 @@ index f7ad9c5e29a..78e875956ae 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_AR+:} false; then :
-@@ -6590,7 +6855,7 @@ do
+@@ -6595,7 +6860,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -21845,7 +21782,7 @@ index f7ad9c5e29a..78e875956ae 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6610,11 +6875,15 @@ $as_echo "no" >&6; }
+@@ -6615,11 +6880,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -21864,7 +21801,7 @@ index f7ad9c5e29a..78e875956ae 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_ac_ct_AR+:} false; then :
-@@ -6630,7 +6899,7 @@ do
+@@ -6635,7 +6904,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -21873,7 +21810,7 @@ index f7ad9c5e29a..78e875956ae 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6649,6 +6918,10 @@ else
+@@ -6654,6 +6923,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -21884,7 +21821,7 @@ index f7ad9c5e29a..78e875956ae 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6660,29 +6933,81 @@ ac_tool_warned=yes ;;
+@@ -6665,29 +6938,81 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -21981,7 +21918,7 @@ index f7ad9c5e29a..78e875956ae 100755
  
  
  
-@@ -7029,8 +7354,8 @@ esac
+@@ -7034,8 +7359,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -21992,7 +21929,7 @@ index f7ad9c5e29a..78e875956ae 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -7066,6 +7391,7 @@ for ac_symprfx in "" "_"; do
+@@ -7071,6 +7396,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -22000,7 +21937,7 @@ index f7ad9c5e29a..78e875956ae 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -7107,6 +7433,18 @@ _LT_EOF
+@@ -7112,6 +7438,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -22019,7 +21956,7 @@ index f7ad9c5e29a..78e875956ae 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -7118,7 +7456,7 @@ _LT_EOF
+@@ -7123,7 +7461,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -22028,7 +21965,7 @@ index f7ad9c5e29a..78e875956ae 100755
    const char *name;
    void       *address;
  }
-@@ -7144,8 +7482,8 @@ static const void *lt_preloaded_setup() {
+@@ -7149,8 +7487,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -22039,7 +21976,7 @@ index f7ad9c5e29a..78e875956ae 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -7155,8 +7493,8 @@ _LT_EOF
+@@ -7160,8 +7498,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -22050,7 +21987,7 @@ index f7ad9c5e29a..78e875956ae 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7193,6 +7531,16 @@ else
+@@ -7198,6 +7536,16 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -22067,7 +22004,7 @@ index f7ad9c5e29a..78e875956ae 100755
  
  
  
-@@ -7209,6 +7557,45 @@ fi
+@@ -7214,6 +7562,45 @@ fi
  
  
  
@@ -22113,7 +22050,7 @@ index f7ad9c5e29a..78e875956ae 100755
  
  
  
-@@ -7414,11 +7801,128 @@ sparc*-*solaris*)
+@@ -7419,11 +7806,128 @@ sparc*-*solaris*)
        ;;
      esac
    fi
@@ -22245,7 +22182,7 @@ index f7ad9c5e29a..78e875956ae 100755
  
  
    case $host_os in
-@@ -7983,6 +8487,8 @@ _LT_EOF
+@@ -7988,6 +8492,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -22254,7 +22191,7 @@ index f7ad9c5e29a..78e875956ae 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -8535,8 +9041,6 @@ fi
+@@ -8542,8 +9048,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -22263,7 +22200,7 @@ index f7ad9c5e29a..78e875956ae 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8702,6 +9206,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8709,6 +9213,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -22276,7 +22213,7 @@ index f7ad9c5e29a..78e875956ae 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8764,7 +9274,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8771,7 +9281,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -22285,7 +22222,7 @@ index f7ad9c5e29a..78e875956ae 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8821,13 +9331,17 @@ case $host_os in
+@@ -8828,13 +9338,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -22309,7 +22246,7 @@ index f7ad9c5e29a..78e875956ae 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8888,6 +9402,11 @@ fi
+@@ -8895,6 +9409,11 @@ fi
  
  
  
@@ -22321,7 +22258,7 @@ index f7ad9c5e29a..78e875956ae 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -9238,7 +9757,8 @@ _LT_EOF
+@@ -9245,7 +9764,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -22331,7 +22268,7 @@ index f7ad9c5e29a..78e875956ae 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -9337,12 +9857,12 @@ _LT_EOF
+@@ -9344,12 +9864,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -22346,7 +22283,7 @@ index f7ad9c5e29a..78e875956ae 100755
  	  fi
  	  ;;
  	esac
-@@ -9356,8 +9876,8 @@ _LT_EOF
+@@ -9363,8 +9883,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -22357,7 +22294,7 @@ index f7ad9c5e29a..78e875956ae 100755
        fi
        ;;
  
-@@ -9375,8 +9895,8 @@ _LT_EOF
+@@ -9382,8 +9902,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -22368,7 +22305,7 @@ index f7ad9c5e29a..78e875956ae 100755
        else
  	ld_shlibs=no
        fi
-@@ -9422,8 +9942,8 @@ _LT_EOF
+@@ -9429,8 +9949,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -22379,7 +22316,7 @@ index f7ad9c5e29a..78e875956ae 100755
        else
  	ld_shlibs=no
        fi
-@@ -9553,7 +10073,13 @@ _LT_EOF
+@@ -9560,7 +10080,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -22394,7 +22331,7 @@ index f7ad9c5e29a..78e875956ae 100755
  /* end confdefs.h.  */
  
  int
-@@ -9566,22 +10092,29 @@ main ()
+@@ -9573,22 +10099,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -22437,7 +22374,7 @@ index f7ad9c5e29a..78e875956ae 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9593,7 +10126,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9600,7 +10133,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -22452,7 +22389,7 @@ index f7ad9c5e29a..78e875956ae 100755
  /* end confdefs.h.  */
  
  int
-@@ -9606,22 +10145,29 @@ main ()
+@@ -9613,22 +10152,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -22495,7 +22432,7 @@ index f7ad9c5e29a..78e875956ae 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9666,20 +10212,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9673,20 +10219,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -22573,7 +22510,7 @@ index f7ad9c5e29a..78e875956ae 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9740,7 +10329,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9747,7 +10336,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -22582,7 +22519,7 @@ index f7ad9c5e29a..78e875956ae 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9748,7 +10337,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9755,7 +10344,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -22591,7 +22528,7 @@ index f7ad9c5e29a..78e875956ae 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9764,7 +10353,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9771,7 +10360,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -22600,8 +22537,8 @@ index f7ad9c5e29a..78e875956ae 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9788,10 +10377,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
- 	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
+@@ -9795,10 +10384,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+ 	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
 -	  archive_cmds='$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
@@ -22613,7 +22550,7 @@ index f7ad9c5e29a..78e875956ae 100755
  	  ;;
  	esac
        else
-@@ -9870,23 +10459,36 @@ fi
+@@ -9877,23 +10466,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -22658,7 +22595,7 @@ index f7ad9c5e29a..78e875956ae 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9971,7 +10573,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9978,7 +10580,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -22667,7 +22604,7 @@ index f7ad9c5e29a..78e875956ae 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9990,9 +10592,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9997,9 +10599,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -22679,7 +22616,7 @@ index f7ad9c5e29a..78e875956ae 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10568,8 +11170,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10575,8 +11177,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -22691,7 +22628,7 @@ index f7ad9c5e29a..78e875956ae 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10602,13 +11205,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10609,13 +11212,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -22764,16 +22701,16 @@ index f7ad9c5e29a..78e875956ae 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -11486,7 +12147,7 @@ else
+@@ -11517,7 +12178,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11489 "configure"
+-#line 11520 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11530,10 +12191,10 @@ else
+@@ -11561,10 +12222,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -22786,16 +22723,16 @@ index f7ad9c5e29a..78e875956ae 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11592,7 +12253,7 @@ else
+@@ -11623,7 +12284,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11595 "configure"
+-#line 11626 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11636,10 +12297,10 @@ else
+@@ -11667,10 +12328,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -22808,7 +22745,7 @@ index f7ad9c5e29a..78e875956ae 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -13459,7 +14120,7 @@ cat >>$CONFIG_STATUS <<_ACEOF || ac_write_fail=1
+@@ -13490,7 +14151,7 @@ cat >>$CONFIG_STATUS <<_ACEOF || ac_write_fail=1
  #
  # INIT-COMMANDS
  #
@@ -22817,7 +22754,7 @@ index f7ad9c5e29a..78e875956ae 100755
  
  
  # The HP-UX ksh and POSIX shell print the target directory to stdout
-@@ -13497,13 +14158,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -13528,13 +14189,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -22838,7 +22775,7 @@ index f7ad9c5e29a..78e875956ae 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -13518,14 +14186,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -13549,14 +14217,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -22857,7 +22794,7 @@ index f7ad9c5e29a..78e875956ae 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -13558,12 +14229,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -13589,12 +14260,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -22871,7 +22808,7 @@ index f7ad9c5e29a..78e875956ae 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -13618,8 +14289,13 @@ reload_flag \
+@@ -13649,8 +14320,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -22885,7 +22822,7 @@ index f7ad9c5e29a..78e875956ae 100755
  STRIP \
  RANLIB \
  CC \
-@@ -13629,12 +14305,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -13660,12 +14336,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -22901,7 +22838,7 @@ index f7ad9c5e29a..78e875956ae 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -13650,7 +14328,6 @@ no_undefined_flag \
+@@ -13681,7 +14359,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -22909,7 +22846,7 @@ index f7ad9c5e29a..78e875956ae 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -13686,6 +14363,7 @@ module_cmds \
+@@ -13717,6 +14394,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -22917,7 +22854,7 @@ index f7ad9c5e29a..78e875956ae 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -14332,29 +15010,35 @@ $as_echo "$as_me: executing $ac_file commands" >&6;}
+@@ -14363,29 +15041,35 @@ $as_echo "$as_me: executing $ac_file commands" >&6;}
    # Older Autoconf quotes --file arguments for eval, but not when files
    # are listed without --file.  Let's play safe and only enable the eval
    # if we detect the quoting.
@@ -22972,7 +22909,7 @@ index f7ad9c5e29a..78e875956ae 100755
      sed '/^X\(.*[^/]\)\/\/*[^/][^/]*\/*$/{
  	    s//\1/
  	    q
-@@ -14372,53 +15056,50 @@ $as_echo X"$mf" |
+@@ -14403,53 +15087,50 @@ $as_echo X"$mf" |
  	    q
  	  }
  	  s/.*/./; q'`
@@ -23059,7 +22996,7 @@ index f7ad9c5e29a..78e875956ae 100755
  }
   ;;
      "libtool":C)
-@@ -14442,7 +15123,8 @@ $as_echo X"$file" |
+@@ -14473,7 +15154,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -23069,7 +23006,7 @@ index f7ad9c5e29a..78e875956ae 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -14545,19 +15227,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -14576,19 +15258,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -23113,7 +23050,7 @@ index f7ad9c5e29a..78e875956ae 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -14587,6 +15292,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -14618,6 +15323,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -23126,7 +23063,7 @@ index f7ad9c5e29a..78e875956ae 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -14596,6 +15307,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -14627,6 +15338,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -23136,7 +23073,7 @@ index f7ad9c5e29a..78e875956ae 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -14710,12 +15424,12 @@ with_gcc=$GCC
+@@ -14741,12 +15455,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -23152,7 +23089,7 @@ index f7ad9c5e29a..78e875956ae 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -14802,9 +15516,6 @@ inherit_rpath=$inherit_rpath
+@@ -14833,9 +15547,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -23162,7 +23099,7 @@ index f7ad9c5e29a..78e875956ae 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -14820,6 +15531,9 @@ include_expsyms=$lt_include_expsyms
+@@ -14851,6 +15562,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -23172,7 +23109,7 @@ index f7ad9c5e29a..78e875956ae 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -14852,210 +15566,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -14883,210 +15597,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -23547,7 +23484,7 @@ index f7ad9c5e29a..78e875956ae 100755
    chmod +x "$ofile"
  
 diff --git a/libtool.m4 b/libtool.m4
-index ad63ebbb385..b65c22bf80d 100644
+index e36fdd3c0e2..4acf9d67956 100644
 --- a/libtool.m4
 +++ b/libtool.m4
 @@ -1,7 +1,8 @@
@@ -23631,7 +23568,7 @@ index ad63ebbb385..b65c22bf80d 100644
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -1069,30 +1073,41 @@ m4_defun([_LT_DARWIN_LINKER_FEATURES],
+@@ -1071,30 +1075,41 @@ m4_defun([_LT_DARWIN_LINKER_FEATURES],
    fi
  ])
  
@@ -23689,7 +23626,7 @@ index ad63ebbb385..b65c22bf80d 100644
  ])# _LT_SYS_MODULE_PATH_AIX
  
  
-@@ -1117,7 +1132,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -1119,7 +1134,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  
  AC_MSG_CHECKING([how to print strings])
  # Test print first, because it will be a builtin if present.
@@ -23698,7 +23635,7 @@ index ad63ebbb385..b65c22bf80d 100644
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -1161,6 +1176,39 @@ _LT_DECL([], [ECHO], [1], [An echo program that protects backslashes])
+@@ -1163,6 +1178,39 @@ _LT_DECL([], [ECHO], [1], [An echo program that protects backslashes])
  ])# _LT_PROG_ECHO_BACKSLASH
  
  
@@ -23738,7 +23675,7 @@ index ad63ebbb385..b65c22bf80d 100644
  # _LT_ENABLE_LOCK
  # ---------------
  m4_defun([_LT_ENABLE_LOCK],
-@@ -1320,6 +1368,51 @@ need_locks="$enable_libtool_lock"
+@@ -1322,6 +1370,51 @@ need_locks="$enable_libtool_lock"
  ])# _LT_ENABLE_LOCK
  
  
@@ -23790,7 +23727,7 @@ index ad63ebbb385..b65c22bf80d 100644
  # _LT_CMD_OLD_ARCHIVE
  # -------------------
  m4_defun([_LT_CMD_OLD_ARCHIVE],
-@@ -1336,23 +1429,7 @@ for plugin in $plugin_names; do
+@@ -1338,23 +1431,7 @@ for plugin in $plugin_names; do
    fi
  done
  
@@ -23815,7 +23752,7 @@ index ad63ebbb385..b65c22bf80d 100644
  
  AC_CHECK_TOOL(STRIP, strip, :)
  test -z "$STRIP" && STRIP=:
-@@ -1653,7 +1730,7 @@ else
+@@ -1655,7 +1732,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
@@ -23824,7 +23761,7 @@ index ad63ebbb385..b65c22bf80d 100644
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -1697,10 +1774,10 @@ else
+@@ -1699,10 +1776,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -23837,7 +23774,7 @@ index ad63ebbb385..b65c22bf80d 100644
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -2240,8 +2317,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -2242,8 +2319,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -23849,7 +23786,7 @@ index ad63ebbb385..b65c22bf80d 100644
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -2274,13 +2352,71 @@ m4_if([$1], [],[
+@@ -2276,13 +2354,71 @@ m4_if([$1], [],[
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[[.]]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -23922,7 +23859,7 @@ index ad63ebbb385..b65c22bf80d 100644
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -2970,6 +3106,11 @@ case $reload_flag in
+@@ -2996,6 +3132,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -23934,7 +23871,7 @@ index ad63ebbb385..b65c22bf80d 100644
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -3036,7 +3177,8 @@ mingw* | pw32*)
+@@ -3062,7 +3203,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -23944,7 +23881,7 @@ index ad63ebbb385..b65c22bf80d 100644
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -3187,6 +3329,21 @@ tpf*)
+@@ -3218,6 +3360,21 @@ vxworks*)
    ;;
  esac
  ])
@@ -23966,7 +23903,7 @@ index ad63ebbb385..b65c22bf80d 100644
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -3194,7 +3351,11 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -3225,7 +3382,11 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  _LT_DECL([], [deplibs_check_method], [1],
      [Method to check whether dependent libraries are shared objects])
  _LT_DECL([], [file_magic_cmd], [1],
@@ -23979,7 +23916,7 @@ index ad63ebbb385..b65c22bf80d 100644
  ])# _LT_CHECK_MAGIC_METHOD
  
  
-@@ -3305,6 +3466,67 @@ dnl aclocal-1.4 backwards compatibility:
+@@ -3336,6 +3497,67 @@ dnl aclocal-1.4 backwards compatibility:
  dnl AC_DEFUN([AM_PROG_NM], [])
  dnl AC_DEFUN([AC_PROG_NM], [])
  
@@ -24047,7 +23984,7 @@ index ad63ebbb385..b65c22bf80d 100644
  
  # LT_LIB_M
  # --------
-@@ -3431,8 +3653,8 @@ esac
+@@ -3462,8 +3684,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -24058,7 +23995,7 @@ index ad63ebbb385..b65c22bf80d 100644
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -3468,6 +3690,7 @@ for ac_symprfx in "" "_"; do
+@@ -3499,6 +3721,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[[	 ]]\($symcode$symcode*\)[[	 ]][[	 ]]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -24066,7 +24003,7 @@ index ad63ebbb385..b65c22bf80d 100644
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -3501,6 +3724,18 @@ _LT_EOF
+@@ -3532,6 +3755,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -24085,7 +24022,7 @@ index ad63ebbb385..b65c22bf80d 100644
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -3512,7 +3747,7 @@ _LT_EOF
+@@ -3543,7 +3778,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -24094,7 +24031,7 @@ index ad63ebbb385..b65c22bf80d 100644
    const char *name;
    void       *address;
  }
-@@ -3538,15 +3773,15 @@ static const void *lt_preloaded_setup() {
+@@ -3569,15 +3804,15 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -24114,7 +24051,7 @@ index ad63ebbb385..b65c22bf80d 100644
  	else
  	  echo "cannot find nm_test_func in $nlist" >&AS_MESSAGE_LOG_FD
  	fi
-@@ -3579,6 +3814,13 @@ else
+@@ -3610,6 +3845,13 @@ else
    AC_MSG_RESULT(ok)
  fi
  
@@ -24128,7 +24065,7 @@ index ad63ebbb385..b65c22bf80d 100644
  _LT_DECL([global_symbol_pipe], [lt_cv_sys_global_symbol_pipe], [1],
      [Take the output of nm and produce a listing of raw symbols and C names])
  _LT_DECL([global_symbol_to_cdecl], [lt_cv_sys_global_symbol_to_cdecl], [1],
-@@ -3589,6 +3831,8 @@ _LT_DECL([global_symbol_to_c_name_address],
+@@ -3620,6 +3862,8 @@ _LT_DECL([global_symbol_to_c_name_address],
  _LT_DECL([global_symbol_to_c_name_address_lib_prefix],
      [lt_cv_sys_global_symbol_to_c_name_address_lib_prefix], [1],
      [Transform the output of nm in a C name address pair when lib prefix is needed])
@@ -24137,7 +24074,7 @@ index ad63ebbb385..b65c22bf80d 100644
  ]) # _LT_CMD_GLOBAL_SYMBOLS
  
  
-@@ -3600,7 +3844,6 @@ _LT_TAGVAR(lt_prog_compiler_wl, $1)=
+@@ -3631,7 +3875,6 @@ _LT_TAGVAR(lt_prog_compiler_wl, $1)=
  _LT_TAGVAR(lt_prog_compiler_pic, $1)=
  _LT_TAGVAR(lt_prog_compiler_static, $1)=
  
@@ -24145,7 +24082,7 @@ index ad63ebbb385..b65c22bf80d 100644
  m4_if([$1], [CXX], [
    # C++ specific cases for pic, static, wl, etc.
    if test "$GXX" = yes; then
-@@ -3706,6 +3949,12 @@ m4_if([$1], [CXX], [
+@@ -3737,6 +3980,12 @@ m4_if([$1], [CXX], [
  	  ;;
  	esac
  	;;
@@ -24158,7 +24095,7 @@ index ad63ebbb385..b65c22bf80d 100644
        dgux*)
  	case $cc_basename in
  	  ec++*)
-@@ -3858,7 +4107,7 @@ m4_if([$1], [CXX], [
+@@ -3889,7 +4138,7 @@ m4_if([$1], [CXX], [
  	;;
        solaris*)
  	case $cc_basename in
@@ -24167,7 +24104,7 @@ index ad63ebbb385..b65c22bf80d 100644
  	    # Sun C++ 4.2, 5.x and Centerline C++
  	    _LT_TAGVAR(lt_prog_compiler_pic, $1)='-KPIC'
  	    _LT_TAGVAR(lt_prog_compiler_static, $1)='-Bstatic'
-@@ -4081,6 +4330,12 @@ m4_if([$1], [CXX], [
+@@ -4112,6 +4361,12 @@ m4_if([$1], [CXX], [
  	_LT_TAGVAR(lt_prog_compiler_pic, $1)='--shared'
  	_LT_TAGVAR(lt_prog_compiler_static, $1)='--static'
  	;;
@@ -24180,7 +24117,7 @@ index ad63ebbb385..b65c22bf80d 100644
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -4143,7 +4398,7 @@ m4_if([$1], [CXX], [
+@@ -4174,7 +4429,7 @@ m4_if([$1], [CXX], [
        _LT_TAGVAR(lt_prog_compiler_pic, $1)='-KPIC'
        _LT_TAGVAR(lt_prog_compiler_static, $1)='-Bstatic'
        case $cc_basename in
@@ -24189,7 +24126,7 @@ index ad63ebbb385..b65c22bf80d 100644
  	_LT_TAGVAR(lt_prog_compiler_wl, $1)='-Qoption ld ';;
        *)
  	_LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,';;
-@@ -4200,9 +4455,11 @@ case $host_os in
+@@ -4231,9 +4486,11 @@ case $host_os in
      _LT_TAGVAR(lt_prog_compiler_pic, $1)="$_LT_TAGVAR(lt_prog_compiler_pic, $1)@&t@m4_if([$1],[],[ -DPIC],[m4_if([$1],[CXX],[ -DPIC],[])])"
      ;;
  esac
@@ -24204,7 +24141,7 @@ index ad63ebbb385..b65c22bf80d 100644
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -4221,6 +4478,8 @@ fi
+@@ -4252,6 +4509,8 @@ fi
  _LT_TAGDECL([pic_flag], [lt_prog_compiler_pic], [1],
  	[Additional compiler flags for building library objects])
  
@@ -24213,7 +24150,7 @@ index ad63ebbb385..b65c22bf80d 100644
  #
  # Check to make sure the static flag actually works.
  #
-@@ -4241,6 +4500,7 @@ _LT_TAGDECL([link_static_flag], [lt_prog_compiler_static], [1],
+@@ -4272,6 +4531,7 @@ _LT_TAGDECL([link_static_flag], [lt_prog_compiler_static], [1],
  m4_defun([_LT_LINKER_SHLIBS],
  [AC_REQUIRE([LT_PATH_LD])dnl
  AC_REQUIRE([LT_PATH_NM])dnl
@@ -24221,7 +24158,7 @@ index ad63ebbb385..b65c22bf80d 100644
  m4_require([_LT_FILEUTILS_DEFAULTS])dnl
  m4_require([_LT_DECL_EGREP])dnl
  m4_require([_LT_DECL_SED])dnl
-@@ -4249,6 +4509,7 @@ m4_require([_LT_TAG_COMPILER])dnl
+@@ -4280,6 +4540,7 @@ m4_require([_LT_TAG_COMPILER])dnl
  AC_MSG_CHECKING([whether the $compiler linker ($LD) supports shared libraries])
  m4_if([$1], [CXX], [
    _LT_TAGVAR(export_symbols_cmds, $1)='$NM $libobjs $convenience | $global_symbol_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
@@ -24229,7 +24166,7 @@ index ad63ebbb385..b65c22bf80d 100644
    case $host_os in
    aix[[4-9]]*)
      # If we're using GNU nm, then we don't want the "-C" option.
-@@ -4263,15 +4524,20 @@ m4_if([$1], [CXX], [
+@@ -4294,15 +4555,20 @@ m4_if([$1], [CXX], [
      ;;
    pw32*)
      _LT_TAGVAR(export_symbols_cmds, $1)="$ltdll_cmds"
@@ -24255,7 +24192,7 @@ index ad63ebbb385..b65c22bf80d 100644
  ], [
    runpath_var=
    _LT_TAGVAR(allow_undefined_flag, $1)=
-@@ -4439,7 +4705,8 @@ _LT_EOF
+@@ -4470,7 +4736,8 @@ _LT_EOF
        _LT_TAGVAR(allow_undefined_flag, $1)=unsupported
        _LT_TAGVAR(always_export_symbols, $1)=no
        _LT_TAGVAR(enable_shared_with_static_runtimes, $1)=yes
@@ -24265,7 +24202,7 @@ index ad63ebbb385..b65c22bf80d 100644
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          _LT_TAGVAR(archive_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -4538,12 +4805,12 @@ _LT_EOF
+@@ -4569,12 +4836,12 @@ _LT_EOF
  	  _LT_TAGVAR(whole_archive_flag_spec, $1)='--whole-archive$convenience --no-whole-archive'
  	  _LT_TAGVAR(hardcode_libdir_flag_spec, $1)=
  	  _LT_TAGVAR(hardcode_libdir_flag_spec_ld, $1)='-rpath $libdir'
@@ -24280,7 +24217,7 @@ index ad63ebbb385..b65c22bf80d 100644
  	  fi
  	  ;;
  	esac
-@@ -4557,8 +4824,8 @@ _LT_EOF
+@@ -4588,8 +4855,8 @@ _LT_EOF
  	_LT_TAGVAR(archive_cmds, $1)='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -24291,7 +24228,7 @@ index ad63ebbb385..b65c22bf80d 100644
        fi
        ;;
  
-@@ -4576,8 +4843,8 @@ _LT_EOF
+@@ -4607,8 +4874,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -24302,7 +24239,7 @@ index ad63ebbb385..b65c22bf80d 100644
        else
  	_LT_TAGVAR(ld_shlibs, $1)=no
        fi
-@@ -4623,8 +4890,8 @@ _LT_EOF
+@@ -4654,8 +4921,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -24313,7 +24250,7 @@ index ad63ebbb385..b65c22bf80d 100644
        else
  	_LT_TAGVAR(ld_shlibs, $1)=no
        fi
-@@ -4754,7 +5021,7 @@ _LT_EOF
+@@ -4785,7 +5052,7 @@ _LT_EOF
  	_LT_TAGVAR(allow_undefined_flag, $1)='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -24322,7 +24259,7 @@ index ad63ebbb385..b65c22bf80d 100644
          _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
          _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
        else
-@@ -4765,7 +5032,7 @@ _LT_EOF
+@@ -4796,7 +5063,7 @@ _LT_EOF
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -24331,7 +24268,7 @@ index ad63ebbb385..b65c22bf80d 100644
  	 _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
  	  # -berok will link without error, but may produce a broken library.
-@@ -4809,20 +5076,63 @@ _LT_EOF
+@@ -4840,20 +5107,63 @@ _LT_EOF
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -24409,7 +24346,7 @@ index ad63ebbb385..b65c22bf80d 100644
        ;;
  
      darwin* | rhapsody*)
-@@ -4856,7 +5166,7 @@ _LT_EOF
+@@ -4887,7 +5197,7 @@ _LT_EOF
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -24418,7 +24355,7 @@ index ad63ebbb385..b65c22bf80d 100644
        _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-R$libdir'
        _LT_TAGVAR(hardcode_direct, $1)=yes
        _LT_TAGVAR(hardcode_shlibpath_var, $1)=no
-@@ -4864,7 +5174,7 @@ _LT_EOF
+@@ -4895,7 +5205,7 @@ _LT_EOF
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -24427,7 +24364,7 @@ index ad63ebbb385..b65c22bf80d 100644
        else
  	_LT_TAGVAR(archive_cmds, $1)='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -4880,7 +5190,7 @@ _LT_EOF
+@@ -4911,7 +5221,7 @@ _LT_EOF
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -24436,8 +24373,8 @@ index ad63ebbb385..b65c22bf80d 100644
        else
  	_LT_TAGVAR(archive_cmds, $1)='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -4904,10 +5214,10 @@ _LT_EOF
- 	  _LT_TAGVAR(archive_cmds, $1)='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
+@@ -4935,10 +5245,10 @@ _LT_EOF
+ 	  _LT_TAGVAR(archive_cmds, $1)='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
 -	  _LT_TAGVAR(archive_cmds, $1)='$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
@@ -24449,7 +24386,7 @@ index ad63ebbb385..b65c22bf80d 100644
  	  ;;
  	esac
        else
-@@ -4954,16 +5264,31 @@ _LT_EOF
+@@ -4985,16 +5295,31 @@ _LT_EOF
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -24488,7 +24425,7 @@ index ad63ebbb385..b65c22bf80d 100644
        else
  	_LT_TAGVAR(archive_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	_LT_TAGVAR(archive_expsym_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -5048,7 +5373,7 @@ _LT_EOF
+@@ -5079,7 +5404,7 @@ _LT_EOF
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	_LT_TAGVAR(allow_undefined_flag, $1)=' ${wl}-expect_unresolved ${wl}\*'
@@ -24497,7 +24434,7 @@ index ad63ebbb385..b65c22bf80d 100644
  	_LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-rpath ${wl}$libdir'
        else
  	_LT_TAGVAR(allow_undefined_flag, $1)=' -expect_unresolved \*'
-@@ -5067,9 +5392,9 @@ _LT_EOF
+@@ -5098,9 +5423,9 @@ _LT_EOF
        _LT_TAGVAR(no_undefined_flag, $1)=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -24509,7 +24446,7 @@ index ad63ebbb385..b65c22bf80d 100644
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -5341,8 +5666,6 @@ _LT_TAGDECL([], [inherit_rpath], [0],
+@@ -5372,8 +5697,6 @@ _LT_TAGDECL([], [inherit_rpath], [0],
      to runtime path list])
  _LT_TAGDECL([], [link_all_deplibs], [0],
      [Whether libtool must link a program against all its dependency libraries])
@@ -24518,7 +24455,7 @@ index ad63ebbb385..b65c22bf80d 100644
  _LT_TAGDECL([], [always_export_symbols], [0],
      [Set to "yes" if exported symbols are required])
  _LT_TAGDECL([], [export_symbols_cmds], [2],
-@@ -5353,6 +5676,8 @@ _LT_TAGDECL([], [include_expsyms], [1],
+@@ -5384,6 +5707,8 @@ _LT_TAGDECL([], [include_expsyms], [1],
      [Symbols that must always be exported])
  _LT_TAGDECL([], [prelink_cmds], [2],
      [Commands necessary for linking programs (against libraries) with templates])
@@ -24527,7 +24464,7 @@ index ad63ebbb385..b65c22bf80d 100644
  _LT_TAGDECL([], [file_list_spec], [1],
      [Specify filename containing input files])
  dnl FIXME: Not yet implemented
-@@ -5454,6 +5779,7 @@ CC="$lt_save_CC"
+@@ -5485,6 +5810,7 @@ CC="$lt_save_CC"
  m4_defun([_LT_LANG_CXX_CONFIG],
  [m4_require([_LT_FILEUTILS_DEFAULTS])dnl
  m4_require([_LT_DECL_EGREP])dnl
@@ -24535,7 +24472,7 @@ index ad63ebbb385..b65c22bf80d 100644
  if test -n "$CXX" && ( test "X$CXX" != "Xno" &&
      ( (test "X$CXX" = "Xg++" && `g++ -v >/dev/null 2>&1` ) ||
      (test "X$CXX" != "Xg++"))) ; then
-@@ -5515,6 +5841,7 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -5546,6 +5872,7 @@ if test "$_lt_caught_CXX_error" != yes; then
  
    # Allow CC to be a program name with arguments.
    lt_save_CC=$CC
@@ -24543,7 +24480,7 @@ index ad63ebbb385..b65c22bf80d 100644
    lt_save_LD=$LD
    lt_save_GCC=$GCC
    GCC=$GXX
-@@ -5532,6 +5859,7 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -5563,6 +5890,7 @@ if test "$_lt_caught_CXX_error" != yes; then
    fi
    test -z "${LDCXX+set}" || LD=$LDCXX
    CC=${CXX-"c++"}
@@ -24551,7 +24488,7 @@ index ad63ebbb385..b65c22bf80d 100644
    compiler=$CC
    _LT_TAGVAR(compiler, $1)=$CC
    _LT_CC_BASENAME([$compiler])
-@@ -5695,7 +6023,7 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -5726,7 +6054,7 @@ if test "$_lt_caught_CXX_error" != yes; then
            _LT_TAGVAR(allow_undefined_flag, $1)='-berok'
            # Determine the default libpath from the value encoded in an empty
            # executable.
@@ -24560,7 +24497,7 @@ index ad63ebbb385..b65c22bf80d 100644
            _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
  
            _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -5707,7 +6035,7 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -5738,7 +6066,7 @@ if test "$_lt_caught_CXX_error" != yes; then
            else
  	    # Determine the default libpath from the value encoded in an
  	    # empty executable.
@@ -24569,7 +24506,7 @@ index ad63ebbb385..b65c22bf80d 100644
  	    _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
  	    # Warning - without using the other run time loading flags,
  	    # -berok will link without error, but may produce a broken library.
-@@ -5749,29 +6077,75 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -5780,29 +6108,75 @@ if test "$_lt_caught_CXX_error" != yes; then
          ;;
  
        cygwin* | mingw* | pw32* | cegcc*)
@@ -24668,7 +24605,7 @@ index ad63ebbb385..b65c22bf80d 100644
        darwin* | rhapsody*)
          _LT_DARWIN_LINKER_FEATURES($1)
  	;;
-@@ -5846,7 +6220,7 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -5877,7 +6251,7 @@ if test "$_lt_caught_CXX_error" != yes; then
              ;;
            *)
              if test "$GXX" = yes; then
@@ -24677,8 +24614,8 @@ index ad63ebbb385..b65c22bf80d 100644
              else
                # FIXME: insert proper C++ library support
                _LT_TAGVAR(ld_shlibs, $1)=no
-@@ -5917,10 +6291,10 @@ if test "$_lt_caught_CXX_error" != yes; then
- 	            _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
+@@ -5948,10 +6322,10 @@ if test "$_lt_caught_CXX_error" != yes; then
+ 	            _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
  	            ;;
  	          ia64*)
 -	            _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
@@ -24690,7 +24627,7 @@ index ad63ebbb385..b65c22bf80d 100644
  	            ;;
  	        esac
  	      fi
-@@ -5961,9 +6335,9 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -5992,9 +6366,9 @@ if test "$_lt_caught_CXX_error" != yes; then
            *)
  	    if test "$GXX" = yes; then
  	      if test "$with_gnu_ld" = no; then
@@ -24702,32 +24639,7 @@ index ad63ebbb385..b65c22bf80d 100644
  	      fi
  	    fi
  	    _LT_TAGVAR(link_all_deplibs, $1)=yes
-@@ -6033,20 +6407,20 @@ if test "$_lt_caught_CXX_error" != yes; then
- 	      _LT_TAGVAR(prelink_cmds, $1)='tpldir=Template.dir~
- 		rm -rf $tpldir~
- 		$CC --prelink_objects --instantiation_dir $tpldir $objs $libobjs $compile_deplibs~
--		compile_command="$compile_command `find $tpldir -name \*.o | $NL2SP`"'
-+		compile_command="$compile_command `find $tpldir -name \*.o | sort | $NL2SP`"'
- 	      _LT_TAGVAR(old_archive_cmds, $1)='tpldir=Template.dir~
- 		rm -rf $tpldir~
- 		$CC --prelink_objects --instantiation_dir $tpldir $oldobjs$old_deplibs~
--		$AR $AR_FLAGS $oldlib$oldobjs$old_deplibs `find $tpldir -name \*.o | $NL2SP`~
-+		$AR $AR_FLAGS $oldlib$oldobjs$old_deplibs `find $tpldir -name \*.o | sort | $NL2SP`~
- 		$RANLIB $oldlib'
- 	      _LT_TAGVAR(archive_cmds, $1)='tpldir=Template.dir~
- 		rm -rf $tpldir~
- 		$CC --prelink_objects --instantiation_dir $tpldir $predep_objects $libobjs $deplibs $convenience $postdep_objects~
--		$CC -shared $pic_flag $predep_objects $libobjs $deplibs `find $tpldir -name \*.o | $NL2SP` $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
-+		$CC -shared $pic_flag $predep_objects $libobjs $deplibs `find $tpldir -name \*.o | sort | $NL2SP` $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
- 	      _LT_TAGVAR(archive_expsym_cmds, $1)='tpldir=Template.dir~
- 		rm -rf $tpldir~
- 		$CC --prelink_objects --instantiation_dir $tpldir $predep_objects $libobjs $deplibs $convenience $postdep_objects~
--		$CC -shared $pic_flag $predep_objects $libobjs $deplibs `find $tpldir -name \*.o | $NL2SP` $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname ${wl}-retain-symbols-file ${wl}$export_symbols -o $lib'
-+		$CC -shared $pic_flag $predep_objects $libobjs $deplibs `find $tpldir -name \*.o | sort | $NL2SP` $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname ${wl}-retain-symbols-file ${wl}$export_symbols -o $lib'
- 	      ;;
- 	    *) # Version 6 and above use weak symbols
- 	      _LT_TAGVAR(archive_cmds, $1)='$CC -shared $pic_flag $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
-@@ -6241,7 +6615,7 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -6272,7 +6646,7 @@ if test "$_lt_caught_CXX_error" != yes; then
  	          _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
  		  ;;
  	        *)
@@ -24736,7 +24648,7 @@ index ad63ebbb385..b65c22bf80d 100644
  		  ;;
  	      esac
  
-@@ -6287,7 +6661,7 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -6318,7 +6692,7 @@ if test "$_lt_caught_CXX_error" != yes; then
  
        solaris*)
          case $cc_basename in
@@ -24745,7 +24657,7 @@ index ad63ebbb385..b65c22bf80d 100644
  	    # Sun C++ 4.2, 5.x and Centerline C++
              _LT_TAGVAR(archive_cmds_need_lc,$1)=yes
  	    _LT_TAGVAR(no_undefined_flag, $1)=' -zdefs'
-@@ -6328,9 +6702,9 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -6359,9 +6733,9 @@ if test "$_lt_caught_CXX_error" != yes; then
  	    if test "$GXX" = yes && test "$with_gnu_ld" = no; then
  	      _LT_TAGVAR(no_undefined_flag, $1)=' ${wl}-z ${wl}defs'
  	      if $CC --version | $GREP -v '^2\.7' > /dev/null; then
@@ -24757,7 +24669,7 @@ index ad63ebbb385..b65c22bf80d 100644
  
  	        # Commands to make compiler produce verbose output that lists
  	        # what "hidden" libraries, object files and flags are used when
-@@ -6459,6 +6833,7 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -6491,6 +6865,7 @@ if test "$_lt_caught_CXX_error" != yes; then
    fi # test -n "$compiler"
  
    CC=$lt_save_CC
@@ -24765,7 +24677,7 @@ index ad63ebbb385..b65c22bf80d 100644
    LDCXX=$LD
    LD=$lt_save_LD
    GCC=$lt_save_GCC
-@@ -6473,6 +6848,29 @@ AC_LANG_POP
+@@ -6505,6 +6880,29 @@ AC_LANG_POP
  ])# _LT_LANG_CXX_CONFIG
  
  
@@ -24795,7 +24707,7 @@ index ad63ebbb385..b65c22bf80d 100644
  # _LT_SYS_HIDDEN_LIBDEPS([TAGNAME])
  # ---------------------------------
  # Figure out "hidden" library dependencies from verbose
-@@ -6481,6 +6879,7 @@ AC_LANG_POP
+@@ -6513,6 +6911,7 @@ AC_LANG_POP
  # objects, libraries and library flags.
  m4_defun([_LT_SYS_HIDDEN_LIBDEPS],
  [m4_require([_LT_FILEUTILS_DEFAULTS])dnl
@@ -24803,7 +24715,7 @@ index ad63ebbb385..b65c22bf80d 100644
  # Dependencies to place before and after the object being linked:
  _LT_TAGVAR(predep_objects, $1)=
  _LT_TAGVAR(postdep_objects, $1)=
-@@ -6531,6 +6930,13 @@ public class foo {
+@@ -6563,6 +6962,13 @@ public class foo {
  };
  _LT_EOF
  ])
@@ -24817,7 +24729,7 @@ index ad63ebbb385..b65c22bf80d 100644
  dnl Parse the compiler output and extract the necessary
  dnl objects, libraries and library flags.
  if AC_TRY_EVAL(ac_compile); then
-@@ -6542,7 +6948,7 @@ if AC_TRY_EVAL(ac_compile); then
+@@ -6574,7 +6980,7 @@ if AC_TRY_EVAL(ac_compile); then
    pre_test_object_deps_done=no
  
    for p in `eval "$output_verbose_link_cmd"`; do
@@ -24826,7 +24738,7 @@ index ad63ebbb385..b65c22bf80d 100644
  
      -L* | -R* | -l*)
         # Some compilers place space between "-{L,R}" and the path.
-@@ -6551,13 +6957,22 @@ if AC_TRY_EVAL(ac_compile); then
+@@ -6583,13 +6989,22 @@ if AC_TRY_EVAL(ac_compile); then
            test $p = "-R"; then
  	 prev=$p
  	 continue
@@ -24853,7 +24765,7 @@ index ad63ebbb385..b65c22bf80d 100644
  	   # Internal compiler library paths should come after those
  	   # provided the user.  The postdeps already come after the
  	   # user supplied libs so there is no need to process them.
-@@ -6577,8 +6992,10 @@ if AC_TRY_EVAL(ac_compile); then
+@@ -6609,8 +7024,10 @@ if AC_TRY_EVAL(ac_compile); then
  	   _LT_TAGVAR(postdeps, $1)="${_LT_TAGVAR(postdeps, $1)} ${prev}${p}"
  	 fi
         fi
@@ -24864,7 +24776,7 @@ index ad63ebbb385..b65c22bf80d 100644
      *.$objext)
         # This assumes that the test object file only shows up
         # once in the compiler output.
-@@ -6614,6 +7031,7 @@ else
+@@ -6646,6 +7063,7 @@ else
  fi
  
  $RM -f confest.$objext
@@ -24872,7 +24784,7 @@ index ad63ebbb385..b65c22bf80d 100644
  
  # PORTME: override above test on systems where it is broken
  m4_if([$1], [CXX],
-@@ -6650,7 +7068,7 @@ linux*)
+@@ -6682,7 +7100,7 @@ linux*)
  
  solaris*)
    case $cc_basename in
@@ -24881,7 +24793,7 @@ index ad63ebbb385..b65c22bf80d 100644
      # The more standards-conforming stlport4 library is
      # incompatible with the Cstd library. Avoid specifying
      # it if it's in CXXFLAGS. Ignore libCrun as
-@@ -6763,7 +7181,9 @@ if test "$_lt_disable_F77" != yes; then
+@@ -6795,7 +7213,9 @@ if test "$_lt_disable_F77" != yes; then
    # Allow CC to be a program name with arguments.
    lt_save_CC="$CC"
    lt_save_GCC=$GCC
@@ -24891,7 +24803,7 @@ index ad63ebbb385..b65c22bf80d 100644
    compiler=$CC
    _LT_TAGVAR(compiler, $1)=$CC
    _LT_CC_BASENAME([$compiler])
-@@ -6817,6 +7237,7 @@ if test "$_lt_disable_F77" != yes; then
+@@ -6849,6 +7269,7 @@ if test "$_lt_disable_F77" != yes; then
  
    GCC=$lt_save_GCC
    CC="$lt_save_CC"
@@ -24899,7 +24811,7 @@ index ad63ebbb385..b65c22bf80d 100644
  fi # test "$_lt_disable_F77" != yes
  
  AC_LANG_POP
-@@ -6893,7 +7314,9 @@ if test "$_lt_disable_FC" != yes; then
+@@ -6925,7 +7346,9 @@ if test "$_lt_disable_FC" != yes; then
    # Allow CC to be a program name with arguments.
    lt_save_CC="$CC"
    lt_save_GCC=$GCC
@@ -24909,7 +24821,7 @@ index ad63ebbb385..b65c22bf80d 100644
    compiler=$CC
    GCC=$ac_cv_fc_compiler_gnu
  
-@@ -6949,7 +7372,8 @@ if test "$_lt_disable_FC" != yes; then
+@@ -6981,7 +7404,8 @@ if test "$_lt_disable_FC" != yes; then
    fi # test -n "$compiler"
  
    GCC=$lt_save_GCC
@@ -24919,7 +24831,7 @@ index ad63ebbb385..b65c22bf80d 100644
  fi # test "$_lt_disable_FC" != yes
  
  AC_LANG_POP
-@@ -6986,10 +7410,12 @@ _LT_COMPILER_BOILERPLATE
+@@ -7018,10 +7442,12 @@ _LT_COMPILER_BOILERPLATE
  _LT_LINKER_BOILERPLATE
  
  # Allow CC to be a program name with arguments.
@@ -24933,7 +24845,7 @@ index ad63ebbb385..b65c22bf80d 100644
  compiler=$CC
  _LT_TAGVAR(compiler, $1)=$CC
  _LT_TAGVAR(LD, $1)="$LD"
-@@ -7020,7 +7446,8 @@ fi
+@@ -7052,7 +7478,8 @@ fi
  AC_LANG_RESTORE
  
  GCC=$lt_save_GCC
@@ -24943,7 +24855,7 @@ index ad63ebbb385..b65c22bf80d 100644
  ])# _LT_LANG_GCJ_CONFIG
  
  
-@@ -7055,9 +7482,11 @@ _LT_LINKER_BOILERPLATE
+@@ -7087,9 +7514,11 @@ _LT_LINKER_BOILERPLATE
  
  # Allow CC to be a program name with arguments.
  lt_save_CC="$CC"
@@ -24955,7 +24867,7 @@ index ad63ebbb385..b65c22bf80d 100644
  compiler=$CC
  _LT_TAGVAR(compiler, $1)=$CC
  _LT_CC_BASENAME([$compiler])
-@@ -7070,7 +7499,8 @@ fi
+@@ -7102,7 +7531,8 @@ fi
  
  GCC=$lt_save_GCC
  AC_LANG_RESTORE
@@ -24965,7 +24877,7 @@ index ad63ebbb385..b65c22bf80d 100644
  ])# _LT_LANG_RC_CONFIG
  
  
-@@ -7129,6 +7559,15 @@ _LT_DECL([], [OBJDUMP], [1], [An object symbol dumper])
+@@ -7161,6 +7591,15 @@ _LT_DECL([], [OBJDUMP], [1], [An object symbol dumper])
  AC_SUBST([OBJDUMP])
  ])
  
@@ -24981,7 +24893,7 @@ index ad63ebbb385..b65c22bf80d 100644
  
  # _LT_DECL_SED
  # ------------
-@@ -7222,8 +7661,8 @@ m4_defun([_LT_CHECK_SHELL_FEATURES],
+@@ -7254,8 +7693,8 @@ m4_defun([_LT_CHECK_SHELL_FEATURES],
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -24992,7 +24904,7 @@ index ad63ebbb385..b65c22bf80d 100644
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -7262,206 +7701,162 @@ _LT_DECL([NL2SP], [lt_NL2SP], [1], [turn newlines into spaces])dnl
+@@ -7294,206 +7733,162 @@ _LT_DECL([NL2SP], [lt_NL2SP], [1], [turn newlines into spaces])dnl
  ])# _LT_CHECK_SHELL_FEATURES
  
  
@@ -25342,7 +25254,7 @@ index ad63ebbb385..b65c22bf80d 100644
 +         [0], [convert $build files to toolchain format])dnl
 +])# _LT_PATH_CONVERSION_FUNCTIONS
 diff --git a/ltmain.sh b/ltmain.sh
-index 9503ec85d70..70e856e0659 100644
+index 70990740b6c..7f7104ffc82 100644
 --- a/ltmain.sh
 +++ b/ltmain.sh
 @@ -1,10 +1,9 @@
@@ -27519,24 +27431,6 @@ index 9503ec85d70..70e856e0659 100644
  
  
  # func_extract_an_archive dir oldlib
-@@ -2917,7 +3801,7 @@ func_extract_archives ()
- 	    darwin_file=
- 	    darwin_files=
- 	    for darwin_file in $darwin_filelist; do
--	      darwin_files=`find unfat-$$ -name $darwin_file -print | $NL2SP`
-+	      darwin_files=`find unfat-$$ -name $darwin_file -print | sort | $NL2SP`
- 	      $LIPO -create -output "$darwin_file" $darwin_files
- 	    done # $darwin_filelist
- 	    $RM -rf unfat-$$
-@@ -2932,7 +3816,7 @@ func_extract_archives ()
-         func_extract_an_archive "$my_xdir" "$my_xabs"
- 	;;
-       esac
--      my_oldobjs="$my_oldobjs "`find $my_xdir -name \*.$objext -print -o -name \*.lo -print | $NL2SP`
-+      my_oldobjs="$my_oldobjs "`find $my_xdir -name \*.$objext -print -o -name \*.lo -print | sort | $NL2SP`
-     done
- 
-     func_extract_archives_result="$my_oldobjs"
 @@ -3014,7 +3898,110 @@ func_fallback_echo ()
  _LTECHO_EOF'
  }
@@ -30626,10 +30520,10 @@ index bf92b5e0790..c573da90c5c 100644
  # These exist entirely to fool aclocal when bootstrapping libtool.
  #
 diff --git a/opcodes/Makefile.in b/opcodes/Makefile.in
-index 2db307e8d7c..aa6e3e1b429 100644
+index 245479140c9..bfed90449bf 100644
 --- a/opcodes/Makefile.in
 +++ b/opcodes/Makefile.in
-@@ -292,6 +292,7 @@ CYGPATH_W = @CYGPATH_W@
+@@ -298,6 +298,7 @@ CYGPATH_W = @CYGPATH_W@
  DATADIRNAME = @DATADIRNAME@
  DEFS = @DEFS@
  DEPDIR = @DEPDIR@
@@ -30637,7 +30531,7 @@ index 2db307e8d7c..aa6e3e1b429 100644
  DSYMUTIL = @DSYMUTIL@
  DUMPBIN = @DUMPBIN@
  ECHO_C = @ECHO_C@
-@@ -325,6 +326,7 @@ LN_S = @LN_S@
+@@ -336,6 +337,7 @@ LTLIBINTL = @LTLIBINTL@
  LTLIBOBJS = @LTLIBOBJS@
  MAINT = @MAINT@
  MAKEINFO = @MAKEINFO@
@@ -30645,7 +30539,7 @@ index 2db307e8d7c..aa6e3e1b429 100644
  MKDIR_P = @MKDIR_P@
  MKINSTALLDIRS = @MKINSTALLDIRS@
  MSGFMT = @MSGFMT@
-@@ -363,6 +365,7 @@ abs_builddir = @abs_builddir@
+@@ -374,6 +376,7 @@ abs_builddir = @abs_builddir@
  abs_srcdir = @abs_srcdir@
  abs_top_builddir = @abs_top_builddir@
  abs_top_srcdir = @abs_top_srcdir@
@@ -30654,10 +30548,10 @@ index 2db307e8d7c..aa6e3e1b429 100644
  ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
  am__include = @am__include@
 diff --git a/opcodes/configure b/opcodes/configure
-index fc4109a1a47..6c42352868c 100755
+index 6cd3730c5a2..824f42ab20a 100755
 --- a/opcodes/configure
 +++ b/opcodes/configure
-@@ -682,6 +682,9 @@ OTOOL
+@@ -688,6 +688,9 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -30667,7 +30561,7 @@ index fc4109a1a47..6c42352868c 100755
  OBJDUMP
  LN_S
  NM
-@@ -800,6 +803,7 @@ enable_static
+@@ -806,6 +809,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -30675,16 +30569,16 @@ index fc4109a1a47..6c42352868c 100755
  enable_libtool_lock
  enable_checking
  enable_targets
-@@ -1468,6 +1472,8 @@ Optional Packages:
-   --with-pic              try to use only PIC/non-PIC objects [default=use
-                           both]
-   --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
+@@ -1487,6 +1491,8 @@ Optional Packages:
+   --with-libintl-prefix[=DIR]  search for libintl in DIR/include and DIR/lib
+   --without-libintl-prefix     don't search for libintl in includedir and libdir
+   --with-libintl-type=TYPE     type of library to search for (auto/static/shared)
 +  --with-libtool-sysroot=DIR Search for dependent libraries within DIR
 +                        (or the compiler's sysroot if not specified).
  
  Some influential environment variables:
    CC          C compiler command
-@@ -4977,8 +4983,8 @@ esac
+@@ -4997,8 +5003,8 @@ esac
  
  
  
@@ -30695,7 +30589,7 @@ index fc4109a1a47..6c42352868c 100755
  
  
  
-@@ -5018,7 +5024,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -5038,7 +5044,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -30704,7 +30598,7 @@ index fc4109a1a47..6c42352868c 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -5711,8 +5717,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -5731,8 +5737,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -30715,7 +30609,7 @@ index fc4109a1a47..6c42352868c 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -5761,6 +5767,80 @@ esac
+@@ -5781,6 +5787,80 @@ esac
  
  
  
@@ -30796,7 +30690,7 @@ index fc4109a1a47..6c42352868c 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if ${lt_cv_ld_reload_flag+:} false; then :
-@@ -5777,6 +5857,11 @@ case $reload_flag in
+@@ -5797,6 +5877,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -30808,7 +30702,7 @@ index fc4109a1a47..6c42352868c 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -5945,7 +6030,8 @@ mingw* | pw32*)
+@@ -5965,7 +6050,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -30818,7 +30712,7 @@ index fc4109a1a47..6c42352868c 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6099,6 +6185,21 @@ esac
+@@ -6124,6 +6210,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -30840,7 +30734,7 @@ index fc4109a1a47..6c42352868c 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6114,6 +6215,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -6139,6 +6240,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -30998,7 +30892,7 @@ index fc4109a1a47..6c42352868c 100755
  plugin_option=
  plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
  for plugin in $plugin_names; do
-@@ -6128,8 +6380,10 @@ for plugin in $plugin_names; do
+@@ -6153,8 +6405,10 @@ for plugin in $plugin_names; do
  done
  
  if test -n "$ac_tool_prefix"; then
@@ -31011,7 +30905,7 @@ index fc4109a1a47..6c42352868c 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_AR+:} false; then :
-@@ -6145,7 +6399,7 @@ do
+@@ -6170,7 +6424,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -31020,7 +30914,7 @@ index fc4109a1a47..6c42352868c 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6165,11 +6419,15 @@ $as_echo "no" >&6; }
+@@ -6190,11 +6444,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -31039,7 +30933,7 @@ index fc4109a1a47..6c42352868c 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_ac_ct_AR+:} false; then :
-@@ -6185,7 +6443,7 @@ do
+@@ -6210,7 +6468,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -31048,7 +30942,7 @@ index fc4109a1a47..6c42352868c 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6204,6 +6462,10 @@ else
+@@ -6229,6 +6487,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -31059,7 +30953,7 @@ index fc4109a1a47..6c42352868c 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6215,25 +6477,20 @@ ac_tool_warned=yes ;;
+@@ -6240,25 +6502,20 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -31095,7 +30989,7 @@ index fc4109a1a47..6c42352868c 100755
  
  
  
-@@ -6244,6 +6501,63 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+@@ -6269,6 +6526,63 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
  
  
  
@@ -31159,7 +31053,7 @@ index fc4109a1a47..6c42352868c 100755
  
  if test -n "$ac_tool_prefix"; then
    # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
-@@ -6584,8 +6898,8 @@ esac
+@@ -6609,8 +6923,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -31170,7 +31064,7 @@ index fc4109a1a47..6c42352868c 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -6621,6 +6935,7 @@ for ac_symprfx in "" "_"; do
+@@ -6646,6 +6960,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -31178,7 +31072,7 @@ index fc4109a1a47..6c42352868c 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -6662,6 +6977,18 @@ _LT_EOF
+@@ -6687,6 +7002,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -31197,7 +31091,7 @@ index fc4109a1a47..6c42352868c 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -6673,7 +7000,7 @@ _LT_EOF
+@@ -6698,7 +7025,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -31206,7 +31100,7 @@ index fc4109a1a47..6c42352868c 100755
    const char *name;
    void       *address;
  }
-@@ -6699,8 +7026,8 @@ static const void *lt_preloaded_setup() {
+@@ -6724,8 +7051,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -31217,7 +31111,7 @@ index fc4109a1a47..6c42352868c 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -6710,8 +7037,8 @@ _LT_EOF
+@@ -6735,8 +7062,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -31228,7 +31122,7 @@ index fc4109a1a47..6c42352868c 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -6748,6 +7075,14 @@ else
+@@ -6773,6 +7100,14 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -31243,7 +31137,7 @@ index fc4109a1a47..6c42352868c 100755
  
  
  
-@@ -6766,6 +7101,47 @@ fi
+@@ -6791,6 +7126,47 @@ fi
  
  
  
@@ -31291,7 +31185,7 @@ index fc4109a1a47..6c42352868c 100755
  
  
  
-@@ -6975,6 +7351,123 @@ esac
+@@ -7000,6 +7376,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -31415,7 +31309,7 @@ index fc4109a1a47..6c42352868c 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7538,6 +8031,8 @@ _LT_EOF
+@@ -7563,6 +8056,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -31424,7 +31318,7 @@ index fc4109a1a47..6c42352868c 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -8090,8 +8585,6 @@ fi
+@@ -8117,8 +8612,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -31433,7 +31327,7 @@ index fc4109a1a47..6c42352868c 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8257,6 +8750,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8284,6 +8777,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -31446,7 +31340,7 @@ index fc4109a1a47..6c42352868c 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8319,7 +8818,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8346,7 +8845,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -31455,7 +31349,7 @@ index fc4109a1a47..6c42352868c 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8376,13 +8875,17 @@ case $host_os in
+@@ -8403,13 +8902,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -31479,7 +31373,7 @@ index fc4109a1a47..6c42352868c 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8443,6 +8946,11 @@ fi
+@@ -8470,6 +8973,11 @@ fi
  
  
  
@@ -31491,7 +31385,7 @@ index fc4109a1a47..6c42352868c 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -8793,7 +9301,8 @@ _LT_EOF
+@@ -8820,7 +9328,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -31501,7 +31395,7 @@ index fc4109a1a47..6c42352868c 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -8892,12 +9401,12 @@ _LT_EOF
+@@ -8919,12 +9428,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -31516,7 +31410,7 @@ index fc4109a1a47..6c42352868c 100755
  	  fi
  	  ;;
  	esac
-@@ -8911,8 +9420,8 @@ _LT_EOF
+@@ -8938,8 +9447,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -31527,7 +31421,7 @@ index fc4109a1a47..6c42352868c 100755
        fi
        ;;
  
-@@ -8930,8 +9439,8 @@ _LT_EOF
+@@ -8957,8 +9466,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -31538,7 +31432,7 @@ index fc4109a1a47..6c42352868c 100755
        else
  	ld_shlibs=no
        fi
-@@ -8977,8 +9486,8 @@ _LT_EOF
+@@ -9004,8 +9513,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -31549,7 +31443,7 @@ index fc4109a1a47..6c42352868c 100755
        else
  	ld_shlibs=no
        fi
-@@ -9108,7 +9617,13 @@ _LT_EOF
+@@ -9135,7 +9644,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -31564,7 +31458,7 @@ index fc4109a1a47..6c42352868c 100755
  /* end confdefs.h.  */
  
  int
-@@ -9121,22 +9636,29 @@ main ()
+@@ -9148,22 +9663,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -31607,7 +31501,7 @@ index fc4109a1a47..6c42352868c 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9148,7 +9670,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9175,7 +9697,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -31622,7 +31516,7 @@ index fc4109a1a47..6c42352868c 100755
  /* end confdefs.h.  */
  
  int
-@@ -9161,22 +9689,29 @@ main ()
+@@ -9188,22 +9716,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -31665,7 +31559,7 @@ index fc4109a1a47..6c42352868c 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9221,20 +9756,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9248,20 +9783,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -31743,7 +31637,7 @@ index fc4109a1a47..6c42352868c 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9295,7 +9873,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9322,7 +9900,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -31752,7 +31646,7 @@ index fc4109a1a47..6c42352868c 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9303,7 +9881,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9330,7 +9908,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -31761,7 +31655,7 @@ index fc4109a1a47..6c42352868c 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9319,7 +9897,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9346,7 +9924,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -31770,8 +31664,8 @@ index fc4109a1a47..6c42352868c 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9343,10 +9921,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
- 	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
+@@ -9370,10 +9948,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+ 	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
 -	  archive_cmds='$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
@@ -31783,7 +31677,7 @@ index fc4109a1a47..6c42352868c 100755
  	  ;;
  	esac
        else
-@@ -9425,23 +10003,36 @@ fi
+@@ -9452,23 +10030,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -31828,7 +31722,7 @@ index fc4109a1a47..6c42352868c 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9526,7 +10117,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9553,7 +10144,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -31837,7 +31731,7 @@ index fc4109a1a47..6c42352868c 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9545,9 +10136,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9572,9 +10163,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -31849,7 +31743,7 @@ index fc4109a1a47..6c42352868c 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10123,8 +10714,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10150,8 +10741,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -31861,7 +31755,7 @@ index fc4109a1a47..6c42352868c 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10157,13 +10749,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10184,13 +10776,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -31934,16 +31828,16 @@ index fc4109a1a47..6c42352868c 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -11041,7 +11691,7 @@ else
+@@ -11092,7 +11742,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11044 "configure"
+-#line 11095 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11085,10 +11735,10 @@ else
+@@ -11136,10 +11786,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -31956,16 +31850,16 @@ index fc4109a1a47..6c42352868c 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11147,7 +11797,7 @@ else
+@@ -11198,7 +11848,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11150 "configure"
+-#line 11201 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11191,10 +11841,10 @@ else
+@@ -11242,10 +11892,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -31978,7 +31872,7 @@ index fc4109a1a47..6c42352868c 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -13414,13 +14064,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -15351,13 +16001,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -31999,7 +31893,7 @@ index fc4109a1a47..6c42352868c 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -13435,14 +14092,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -15372,14 +16029,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -32018,7 +31912,7 @@ index fc4109a1a47..6c42352868c 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -13475,12 +14135,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -15412,12 +16072,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -32032,7 +31926,7 @@ index fc4109a1a47..6c42352868c 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -13535,8 +14195,13 @@ reload_flag \
+@@ -15472,8 +16132,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -32046,7 +31940,7 @@ index fc4109a1a47..6c42352868c 100755
  STRIP \
  RANLIB \
  CC \
-@@ -13546,12 +14211,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -15483,12 +16148,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -32062,7 +31956,7 @@ index fc4109a1a47..6c42352868c 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -13567,7 +14234,6 @@ no_undefined_flag \
+@@ -15504,7 +16171,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -32070,7 +31964,7 @@ index fc4109a1a47..6c42352868c 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -13603,6 +14269,7 @@ module_cmds \
+@@ -15540,6 +16206,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -32078,7 +31972,7 @@ index fc4109a1a47..6c42352868c 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -14368,7 +15035,8 @@ $as_echo X"$file" |
+@@ -16313,7 +16980,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -32088,7 +31982,7 @@ index fc4109a1a47..6c42352868c 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -14471,19 +15139,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -16416,19 +17084,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -32132,7 +32026,7 @@ index fc4109a1a47..6c42352868c 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -14513,6 +15204,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -16458,6 +17149,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -32145,7 +32039,7 @@ index fc4109a1a47..6c42352868c 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -14522,6 +15219,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -16467,6 +17164,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -32155,7 +32049,7 @@ index fc4109a1a47..6c42352868c 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -14636,12 +15336,12 @@ with_gcc=$GCC
+@@ -16581,12 +17281,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -32171,7 +32065,7 @@ index fc4109a1a47..6c42352868c 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -14728,9 +15428,6 @@ inherit_rpath=$inherit_rpath
+@@ -16673,9 +17373,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -32181,7 +32075,7 @@ index fc4109a1a47..6c42352868c 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -14746,6 +15443,9 @@ include_expsyms=$lt_include_expsyms
+@@ -16691,6 +17388,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -32191,7 +32085,7 @@ index fc4109a1a47..6c42352868c 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -14778,210 +15478,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -16723,210 +17423,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -32566,7 +32460,7 @@ index fc4109a1a47..6c42352868c 100755
    chmod +x "$ofile"
  
 diff --git a/zlib/Makefile.in b/zlib/Makefile.in
-index 855c23eea23..0605835c14f 100644
+index dd8a21deba1..28628282c56 100644
 --- a/zlib/Makefile.in
 +++ b/zlib/Makefile.in
 @@ -281,6 +281,7 @@ CPPFLAGS = @CPPFLAGS@
@@ -32594,10 +32488,10 @@ index 855c23eea23..0605835c14f 100644
  ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
  am__include = @am__include@
 diff --git a/zlib/configure b/zlib/configure
-index e65ade3badd..35b44e2819c 100755
+index 2d551360683..e01d0a70438 100755
 --- a/zlib/configure
 +++ b/zlib/configure
-@@ -646,8 +646,11 @@ OTOOL
+@@ -648,8 +648,11 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -32609,15 +32503,15 @@ index e65ade3badd..35b44e2819c 100755
  OBJDUMP
  LN_S
  NM
-@@ -774,6 +777,7 @@ enable_static
+@@ -776,6 +779,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
 +with_libtool_sysroot
  enable_libtool_lock
  enable_host_shared
- '
-@@ -1428,6 +1432,8 @@ Optional Packages:
+ enable_host_pie
+@@ -1432,6 +1436,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -32626,7 +32520,7 @@ index e65ade3badd..35b44e2819c 100755
  
  Some influential environment variables:
    CC          C compiler command
-@@ -4186,8 +4192,8 @@ esac
+@@ -4190,8 +4196,8 @@ esac
  
  
  
@@ -32637,7 +32531,7 @@ index e65ade3badd..35b44e2819c 100755
  
  
  
-@@ -4227,7 +4233,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -4231,7 +4237,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -32646,7 +32540,7 @@ index e65ade3badd..35b44e2819c 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -5050,8 +5056,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -5054,8 +5060,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -32657,7 +32551,7 @@ index e65ade3badd..35b44e2819c 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -5100,6 +5106,80 @@ esac
+@@ -5104,6 +5110,80 @@ esac
  
  
  
@@ -32738,7 +32632,7 @@ index e65ade3badd..35b44e2819c 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if ${lt_cv_ld_reload_flag+:} false; then :
-@@ -5116,6 +5196,11 @@ case $reload_flag in
+@@ -5120,6 +5200,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -32750,7 +32644,7 @@ index e65ade3badd..35b44e2819c 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -5284,7 +5369,8 @@ mingw* | pw32*)
+@@ -5288,7 +5373,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -32760,7 +32654,7 @@ index e65ade3badd..35b44e2819c 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -5438,6 +5524,21 @@ esac
+@@ -5447,6 +5533,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -32782,7 +32676,7 @@ index e65ade3badd..35b44e2819c 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -5453,6 +5554,158 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -5462,6 +5563,158 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -32941,7 +32835,7 @@ index e65ade3badd..35b44e2819c 100755
  plugin_option=
  plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
  for plugin in $plugin_names; do
-@@ -5467,8 +5720,10 @@ for plugin in $plugin_names; do
+@@ -5476,8 +5729,10 @@ for plugin in $plugin_names; do
  done
  
  if test -n "$ac_tool_prefix"; then
@@ -32954,7 +32848,7 @@ index e65ade3badd..35b44e2819c 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_AR+:} false; then :
-@@ -5484,7 +5739,7 @@ do
+@@ -5493,7 +5748,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -32963,7 +32857,7 @@ index e65ade3badd..35b44e2819c 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -5504,11 +5759,15 @@ $as_echo "no" >&6; }
+@@ -5513,11 +5768,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -32982,7 +32876,7 @@ index e65ade3badd..35b44e2819c 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_ac_ct_AR+:} false; then :
-@@ -5524,7 +5783,7 @@ do
+@@ -5533,7 +5792,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -32991,7 +32885,7 @@ index e65ade3badd..35b44e2819c 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -5543,6 +5802,10 @@ else
+@@ -5552,6 +5811,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -33002,7 +32896,7 @@ index e65ade3badd..35b44e2819c 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -5554,25 +5817,19 @@ ac_tool_warned=yes ;;
+@@ -5563,25 +5826,19 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -33037,7 +32931,7 @@ index e65ade3badd..35b44e2819c 100755
  
  
  
-@@ -5584,6 +5841,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+@@ -5593,6 +5850,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
  
  
  
@@ -33102,7 +32996,7 @@ index e65ade3badd..35b44e2819c 100755
  if test -n "$ac_tool_prefix"; then
    # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
  set dummy ${ac_tool_prefix}strip; ac_word=$2
-@@ -5923,8 +6238,8 @@ esac
+@@ -5932,8 +6247,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -33113,7 +33007,7 @@ index e65ade3badd..35b44e2819c 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -5960,6 +6275,7 @@ for ac_symprfx in "" "_"; do
+@@ -5969,6 +6284,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -33121,7 +33015,7 @@ index e65ade3badd..35b44e2819c 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -6001,6 +6317,18 @@ _LT_EOF
+@@ -6010,6 +6326,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -33140,7 +33034,7 @@ index e65ade3badd..35b44e2819c 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -6012,7 +6340,7 @@ _LT_EOF
+@@ -6021,7 +6349,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -33149,7 +33043,7 @@ index e65ade3badd..35b44e2819c 100755
    const char *name;
    void       *address;
  }
-@@ -6038,8 +6366,8 @@ static const void *lt_preloaded_setup() {
+@@ -6047,8 +6375,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -33160,7 +33054,7 @@ index e65ade3badd..35b44e2819c 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -6049,8 +6377,8 @@ _LT_EOF
+@@ -6058,8 +6386,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -33171,7 +33065,7 @@ index e65ade3badd..35b44e2819c 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -6087,6 +6415,17 @@ else
+@@ -6096,6 +6424,17 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -33189,7 +33083,7 @@ index e65ade3badd..35b44e2819c 100755
  
  
  
-@@ -6104,6 +6443,43 @@ fi
+@@ -6113,6 +6452,43 @@ fi
  
  
  
@@ -33233,7 +33127,7 @@ index e65ade3badd..35b44e2819c 100755
  
  
  
-@@ -6318,6 +6694,123 @@ esac
+@@ -6327,6 +6703,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -33357,7 +33251,7 @@ index e65ade3badd..35b44e2819c 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -6884,6 +7377,8 @@ _LT_EOF
+@@ -6893,6 +7386,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -33366,7 +33260,7 @@ index e65ade3badd..35b44e2819c 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -7733,8 +8228,6 @@ fi
+@@ -7744,8 +8239,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -33375,7 +33269,7 @@ index e65ade3badd..35b44e2819c 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -7900,6 +8393,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -7911,6 +8404,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -33388,7 +33282,7 @@ index e65ade3badd..35b44e2819c 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -7962,7 +8461,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -7973,7 +8472,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -33397,7 +33291,7 @@ index e65ade3badd..35b44e2819c 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8019,13 +8518,17 @@ case $host_os in
+@@ -8030,13 +8529,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -33421,7 +33315,7 @@ index e65ade3badd..35b44e2819c 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8086,6 +8589,11 @@ fi
+@@ -8097,6 +8600,11 @@ fi
  
  
  
@@ -33433,7 +33327,7 @@ index e65ade3badd..35b44e2819c 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -8436,7 +8944,8 @@ _LT_EOF
+@@ -8447,7 +8955,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -33443,7 +33337,7 @@ index e65ade3badd..35b44e2819c 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -8535,12 +9044,12 @@ _LT_EOF
+@@ -8546,12 +9055,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -33458,7 +33352,7 @@ index e65ade3badd..35b44e2819c 100755
  	  fi
  	  ;;
  	esac
-@@ -8554,8 +9063,8 @@ _LT_EOF
+@@ -8565,8 +9074,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -33469,7 +33363,7 @@ index e65ade3badd..35b44e2819c 100755
        fi
        ;;
  
-@@ -8573,8 +9082,8 @@ _LT_EOF
+@@ -8584,8 +9093,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -33480,7 +33374,7 @@ index e65ade3badd..35b44e2819c 100755
        else
  	ld_shlibs=no
        fi
-@@ -8620,8 +9129,8 @@ _LT_EOF
+@@ -8631,8 +9140,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -33491,7 +33385,7 @@ index e65ade3badd..35b44e2819c 100755
        else
  	ld_shlibs=no
        fi
-@@ -8751,7 +9260,13 @@ _LT_EOF
+@@ -8762,7 +9271,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -33506,7 +33400,7 @@ index e65ade3badd..35b44e2819c 100755
    as_fn_error $? "Link tests are not allowed after GCC_NO_EXECUTABLES." "$LINENO" 5
  fi
  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
-@@ -8767,22 +9282,29 @@ main ()
+@@ -8778,22 +9293,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -33549,7 +33443,7 @@ index e65ade3badd..35b44e2819c 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -8794,7 +9316,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8805,7 +9327,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -33564,7 +33458,7 @@ index e65ade3badd..35b44e2819c 100755
    as_fn_error $? "Link tests are not allowed after GCC_NO_EXECUTABLES." "$LINENO" 5
  fi
  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
-@@ -8810,22 +9338,29 @@ main ()
+@@ -8821,22 +9349,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -33607,7 +33501,7 @@ index e65ade3badd..35b44e2819c 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -8870,20 +9405,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8881,20 +9416,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -33685,7 +33579,7 @@ index e65ade3badd..35b44e2819c 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -8944,7 +9522,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8955,7 +9533,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -33694,7 +33588,7 @@ index e65ade3badd..35b44e2819c 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -8952,7 +9530,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8963,7 +9541,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -33703,7 +33597,7 @@ index e65ade3badd..35b44e2819c 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -8968,7 +9546,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8979,7 +9557,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -33712,8 +33606,8 @@ index e65ade3badd..35b44e2819c 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -8992,10 +9570,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
- 	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
+@@ -9003,10 +9581,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+ 	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
 -	  archive_cmds='$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
@@ -33725,7 +33619,7 @@ index e65ade3badd..35b44e2819c 100755
  	  ;;
  	esac
        else
-@@ -9074,26 +9652,39 @@ fi
+@@ -9085,26 +9663,39 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -33773,7 +33667,7 @@ index e65ade3badd..35b44e2819c 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9178,7 +9769,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9189,7 +9780,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -33782,7 +33676,7 @@ index e65ade3badd..35b44e2819c 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9197,9 +9788,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9208,9 +9799,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -33794,7 +33688,7 @@ index e65ade3badd..35b44e2819c 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -9775,8 +10366,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -9786,8 +10377,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -33806,7 +33700,7 @@ index e65ade3badd..35b44e2819c 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -9809,13 +10401,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -9820,13 +10412,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -33879,16 +33773,16 @@ index e65ade3badd..35b44e2819c 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10711,7 +11361,7 @@ else
+@@ -10746,7 +11396,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 10714 "configure"
+-#line 10749 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -10755,10 +11405,10 @@ else
+@@ -10790,10 +11440,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -33901,16 +33795,16 @@ index e65ade3badd..35b44e2819c 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -10817,7 +11467,7 @@ else
+@@ -10852,7 +11502,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 10820 "configure"
+-#line 10855 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -10861,10 +11511,10 @@ else
+@@ -10896,10 +11546,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -33923,7 +33817,7 @@ index e65ade3badd..35b44e2819c 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -12334,13 +12984,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -12385,13 +13035,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -33944,7 +33838,7 @@ index e65ade3badd..35b44e2819c 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -12355,14 +13012,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -12406,14 +13063,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -33963,7 +33857,7 @@ index e65ade3badd..35b44e2819c 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -12395,12 +13055,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -12446,12 +13106,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -33977,7 +33871,7 @@ index e65ade3badd..35b44e2819c 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -12455,8 +13115,13 @@ reload_flag \
+@@ -12506,8 +13166,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -33991,7 +33885,7 @@ index e65ade3badd..35b44e2819c 100755
  STRIP \
  RANLIB \
  CC \
-@@ -12466,12 +13131,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -12517,12 +13182,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -34007,7 +33901,7 @@ index e65ade3badd..35b44e2819c 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -12487,7 +13154,6 @@ no_undefined_flag \
+@@ -12538,7 +13205,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -34015,7 +33909,7 @@ index e65ade3badd..35b44e2819c 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -12523,6 +13189,7 @@ module_cmds \
+@@ -12574,6 +13240,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -34023,7 +33917,7 @@ index e65ade3badd..35b44e2819c 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -13121,7 +13788,8 @@ $as_echo X"$file" |
+@@ -13172,7 +13839,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -34033,7 +33927,7 @@ index e65ade3badd..35b44e2819c 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -13224,19 +13892,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -13275,19 +13943,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -34077,7 +33971,7 @@ index e65ade3badd..35b44e2819c 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -13266,6 +13957,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -13317,6 +14008,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -34090,7 +33984,7 @@ index e65ade3badd..35b44e2819c 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -13275,6 +13972,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -13326,6 +14023,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -34100,7 +33994,7 @@ index e65ade3badd..35b44e2819c 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -13389,12 +14089,12 @@ with_gcc=$GCC
+@@ -13440,12 +14140,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -34116,7 +34010,7 @@ index e65ade3badd..35b44e2819c 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -13481,9 +14181,6 @@ inherit_rpath=$inherit_rpath
+@@ -13532,9 +14232,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -34126,7 +34020,7 @@ index e65ade3badd..35b44e2819c 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -13499,6 +14196,9 @@ include_expsyms=$lt_include_expsyms
+@@ -13550,6 +14247,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -34136,7 +34030,7 @@ index e65ade3badd..35b44e2819c 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -13531,210 +14231,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -13582,210 +14282,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
diff --git a/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch b/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
index acd827143ad..5f87c2ebf0c 100644
--- a/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
+++ b/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
@@ -1,4 +1,4 @@
-From 73d1af65ccfed87662342274d9ec33900786beb3 Mon Sep 17 00:00:00 2001
+From 37a395151679d74c98a23ad5c39ed02009487f9c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:42:38 +0000
 Subject: [PATCH] Fix rpath in libtool when sysroot is enabled
@@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 8 insertions(+), 2 deletions(-)
 
 diff --git a/ltmain.sh b/ltmain.sh
-index 70e856e0659..11ee684cccf 100644
+index 7f7104ffc82..f59eb4aa631 100644
 --- a/ltmain.sh
 +++ b/ltmain.sh
 @@ -8035,9 +8035,11 @@ EOF
diff --git a/meta/recipes-devtools/binutils/binutils/0010-sync-with-OE-libtool-changes.patch b/meta/recipes-devtools/binutils/binutils/0010-sync-with-OE-libtool-changes.patch
index faf5f2c0b8f..5f6708896d3 100644
--- a/meta/recipes-devtools/binutils/binutils/0010-sync-with-OE-libtool-changes.patch
+++ b/meta/recipes-devtools/binutils/binutils/0010-sync-with-OE-libtool-changes.patch
@@ -1,4 +1,4 @@
-From da9dc36e90c6cf7d3d3bf6f4e337261a93d63428 Mon Sep 17 00:00:00 2001
+From 8c2788cee8eb69c8bde5778129a6b66287868c3b Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 6 Mar 2017 23:33:27 -0800
 Subject: [PATCH] sync with OE libtool changes
@@ -26,7 +26,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 28 insertions(+), 6 deletions(-)
 
 diff --git a/ltmain.sh b/ltmain.sh
-index 11ee684cccf..3b19ac15328 100644
+index f59eb4aa631..ce97db42ce7 100644
 --- a/ltmain.sh
 +++ b/ltmain.sh
 @@ -8053,8 +8053,16 @@ EOF
diff --git a/meta/recipes-devtools/binutils/binutils/0011-Check-for-clang-before-checking-gcc-version.patch b/meta/recipes-devtools/binutils/binutils/0011-Check-for-clang-before-checking-gcc-version.patch
index 05c73171f5e..e753627a243 100644
--- a/meta/recipes-devtools/binutils/binutils/0011-Check-for-clang-before-checking-gcc-version.patch
+++ b/meta/recipes-devtools/binutils/binutils/0011-Check-for-clang-before-checking-gcc-version.patch
@@ -1,4 +1,4 @@
-From f6105e5202180627e9690884d483fd5b7dc28652 Mon Sep 17 00:00:00 2001
+From 11bbb4f62b0f914f59f3f01a9d835930f9eb1122 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 15 Apr 2020 14:17:20 -0700
 Subject: [PATCH] Check for clang before checking gcc version
@@ -18,10 +18,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index 9cb953a197e..b63b5cd3de0 100755
+index 670684d83d1..f9ba1c0a4f7 100755
 --- a/configure
 +++ b/configure
-@@ -5460,7 +5460,7 @@ ac_compiler_gnu=$ac_cv_cxx_compiler_gnu
+@@ -5432,7 +5432,7 @@ ac_compiler_gnu=$ac_cv_cxx_compiler_gnu
  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
  /* end confdefs.h.  */
  
@@ -31,10 +31,10 @@ index 9cb953a197e..b63b5cd3de0 100755
  #endif
  int main() {}
 diff --git a/configure.ac b/configure.ac
-index e95a9ed116e..2df870b86af 100644
+index 88b4800e298..6cd4530db56 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1444,7 +1444,7 @@ if test "$GCC" = yes; then
+@@ -1410,7 +1410,7 @@ if test "$GCC" = yes; then
    AC_MSG_CHECKING([whether g++ accepts -static-libstdc++ -static-libgcc])
    AC_LANG_PUSH(C++)
    AC_LINK_IFELSE([AC_LANG_SOURCE([
diff --git a/meta/recipes-devtools/binutils/binutils/0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch b/meta/recipes-devtools/binutils/binutils/0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
index 20eb943d65c..7059eb467c0 100644
--- a/meta/recipes-devtools/binutils/binutils/0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
+++ b/meta/recipes-devtools/binutils/binutils/0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
@@ -1,4 +1,4 @@
-From 13cbec5bc5c75dd4c3e1d5f3ca80e5b64f7116d1 Mon Sep 17 00:00:00 2001
+From 65c8ea481cda572b60d0949648df912e616d3884 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 10 Mar 2022 21:21:33 -0800
 Subject: [PATCH] Only generate an RPATH entry if LD_RUN_PATH is not empty
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/ld/ldelf.c b/ld/ldelf.c
-index 1519f8ac4e5..2a7c76dc29c 100644
+index 187b359af86..ad792f02d63 100644
 --- a/ld/ldelf.c
 +++ b/ld/ldelf.c
-@@ -1127,6 +1127,9 @@ ldelf_handle_dt_needed (struct elf_link_hash_table *htab,
+@@ -1130,6 +1130,9 @@ ldelf_handle_dt_needed (struct elf_link_hash_table *htab,
  		  && command_line.rpath == NULL)
  		{
  		  path = (const char *) getenv ("LD_RUN_PATH");
@@ -27,7 +27,7 @@ index 1519f8ac4e5..2a7c76dc29c 100644
  		  if (path
  		      && ldelf_search_needed (path, &n, force,
  					      is_linux, elfsize))
-@@ -1802,6 +1805,8 @@ ldelf_before_allocation (char *audit, char *depaudit,
+@@ -1805,6 +1808,8 @@ ldelf_before_allocation (char *audit, char *depaudit,
    rpath = command_line.rpath;
    if (rpath == NULL)
      rpath = (const char *) getenv ("LD_RUN_PATH");
diff --git a/meta/recipes-devtools/binutils/binutils/0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch b/meta/recipes-devtools/binutils/binutils/0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
index a6892e8af65..0b6065b60f1 100644
--- a/meta/recipes-devtools/binutils/binutils/0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
+++ b/meta/recipes-devtools/binutils/binutils/0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
@@ -1,4 +1,4 @@
-From 9d451ca9ca6bf34b43a089033565ae7570db2065 Mon Sep 17 00:00:00 2001
+From ad6942752570199d3959e344c432bc92d9fc43ad Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 15 Jan 2023 00:16:25 -0800
 Subject: [PATCH] Define alignof using _Alignof when using C11 or newer
@@ -25,10 +25,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 10 insertions(+)
 
 diff --git a/libiberty/sha1.c b/libiberty/sha1.c
-index 6c71e3ebb41..a2caf947d31 100644
+index 49e8e0b6c2b..72de5cc8ad6 100644
 --- a/libiberty/sha1.c
 +++ b/libiberty/sha1.c
-@@ -229,7 +229,17 @@ sha1_process_bytes (const void *buffer, size_t len, struct sha1_ctx *ctx)
+@@ -234,7 +234,17 @@ sha1_process_bytes (const void *buffer, size_t len, struct sha1_ctx *ctx)
    if (len >= 64)
      {
  #if !_STRING_ARCH_unaligned
diff --git a/meta/recipes-devtools/binutils/binutils/0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch b/meta/recipes-devtools/binutils/binutils/0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch
index 818d646ffe8..de1a6271d72 100644
--- a/meta/recipes-devtools/binutils/binutils/0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch
+++ b/meta/recipes-devtools/binutils/binutils/0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch
@@ -1,4 +1,4 @@
-From f0c39effd46d4dec0813276b1903d6deddcd82dc Mon Sep 17 00:00:00 2001
+From 6a21059fb86423304358693a200f1ad568cd6699 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Jan 2023 19:35:07 -0800
 Subject: [PATCH] Remove duplicate pe-dll.o entry deom targ_extra_ofiles
@@ -18,10 +18,10 @@ Cc: Zac Walker <zac.walker@linaro.org>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/ld/configure.tgt b/ld/configure.tgt
-index c62b9581d9b..e78644d04e2 100644
+index f937f78b876..830613744c2 100644
 --- a/ld/configure.tgt
 +++ b/ld/configure.tgt
-@@ -1055,7 +1055,7 @@ x86_64-*-cygwin)	targ_emul=i386pep ;
+@@ -1067,7 +1067,7 @@ x86_64-*-cygwin)	targ_emul=i386pep ;
  			;;
  x86_64-*-mingw*)	targ_emul=i386pep ;
  			targ_extra_emuls=i386pe
diff --git a/meta/recipes-devtools/binutils/binutils/0015-gprofng-Fix-build-with-64bit-file-offset-on-32bit-ma.patch b/meta/recipes-devtools/binutils/binutils/0015-gprofng-Fix-build-with-64bit-file-offset-on-32bit-ma.patch
deleted file mode 100644
index 3bb083819b7..00000000000
--- a/meta/recipes-devtools/binutils/binutils/0015-gprofng-Fix-build-with-64bit-file-offset-on-32bit-ma.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 15936ae7cdfd6814654eff367b5cfb2565ea6af8 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 31 Jul 2023 15:23:38 -0700
-Subject: [PATCH] gprofng: Fix build with 64bit file offset on 32bit machines
-
-gprofng/ChangeLog
-2023-07-31  Khem Raj <raj.khem@gmail.com>
-
-* libcollector/iotrace.c: Define open64, fgetpos64, and fsetpos64
-  only when __USE_LARGEFILE64 and __USE_FILE_OFFSET64 are not
-  defined.
-
-Upstream-Status: Submitted [https://sourceware.org/pipermail/binutils/2023-July/128741.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gprofng/libcollector/iotrace.c | 9 ++++++---
- 1 file changed, 6 insertions(+), 3 deletions(-)
-
-diff --git a/gprofng/libcollector/iotrace.c b/gprofng/libcollector/iotrace.c
-index c0ea7497b09..81c844048d9 100644
---- a/gprofng/libcollector/iotrace.c
-+++ b/gprofng/libcollector/iotrace.c
-@@ -1030,8 +1030,9 @@ gprofng_open64 (int(real_open64) (const char *, int, ...),
-   }
- 
- DCL_FUNC_VER (DCL_OPEN64, open64_2_2, open64@GLIBC_2.2)
-+#if !defined(__USE_LARGEFILE64)
- DCL_OPEN64 (open64)
--
-+#endif
- 
- #define F_ERROR_ARG     0
- #define F_INT_ARG       1
-@@ -2989,8 +2990,9 @@ DCL_FUNC_VER (DCL_FGETPOS64, fgetpos64_2_17, fgetpos64@GLIBC_2.17)
- DCL_FUNC_VER (DCL_FGETPOS64, fgetpos64_2_2_5, fgetpos64@GLIBC_2.2.5)
- DCL_FUNC_VER (DCL_FGETPOS64, fgetpos64_2_2, fgetpos64@GLIBC_2.2)
- DCL_FUNC_VER (DCL_FGETPOS64, fgetpos64_2_1, fgetpos64@GLIBC_2.1)
-+#if !defined(__USE_LARGEFILE64)
- DCL_FGETPOS64 (fgetpos64)
--
-+#endif
- /*------------------------------------------------------------- fsetpos */
- static int
- gprofng_fsetpos (int(real_fsetpos) (FILE *, const fpos_t *),
-@@ -3087,8 +3089,9 @@ DCL_FUNC_VER (DCL_FSETPOS64, fsetpos64_2_17, fsetpos64@GLIBC_2.17)
- DCL_FUNC_VER (DCL_FSETPOS64, fsetpos64_2_2_5, fsetpos64@GLIBC_2.2.5)
- DCL_FUNC_VER (DCL_FSETPOS64, fsetpos64_2_2, fsetpos64@GLIBC_2.2)
- DCL_FUNC_VER (DCL_FSETPOS64, fsetpos64_2_1, fsetpos64@GLIBC_2.1)
-+#if !defined(__USE_LARGEFILE64)
- DCL_FSETPOS64 (fsetpos64)
--
-+#endif
- /*------------------------------------------------------------- fsync */
- int
- fsync (int fildes)
diff --git a/meta/recipes-devtools/binutils/binutils_2.41.bb b/meta/recipes-devtools/binutils/binutils_2.42.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils_2.41.bb
rename to meta/recipes-devtools/binutils/binutils_2.42.bb
-- 
2.43.0



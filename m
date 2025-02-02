Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E99ECC0218F
	for <webhook@archiver.kernel.org>; Sun,  2 Feb 2025 21:09:54 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.73104.1738530587551699025
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Feb 2025 13:09:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V83w9wiz;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2156e078563so51858355ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Feb 2025 13:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738530587; x=1739135387; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1MWEwI5Ml3Xvv5nqbPu9hfNHxNFGu9Y06b4VIFNZCQ=;
        b=V83w9wizx12tGuIMq/Noo9WfNbNzx8VAu0McsR7j0X6iSRxwkLCx6jbOXtD9+GE1oT
         p19dJrvJOjVv8qQ3mYjZJvgFFaQiNO1RGbEdkNYF0XatqT+UJNFLehC1ExjlXjL6B7QH
         BbDJKJkHeTy/iG0GPaEk52ZVuymjh87RnxXzD0FdQqZwUiS4U7605K03opDJ516RUY5t
         GelBcg0RfK7Z7Uw9mqcY90W8Wz5iXO2bpVjYHlOLNLL1dRIL0S50yTCbiAuUxNFpmnu/
         7S6ICif8WjrZzMHJmjNpLzlrHzhovAGnkuiDX+7VJ8zgw0JUAZ+tCmJZbRFy7YUpAfpj
         0ymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738530587; x=1739135387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z1MWEwI5Ml3Xvv5nqbPu9hfNHxNFGu9Y06b4VIFNZCQ=;
        b=YeG2x8cRZtIBUHlyZ+452DU4Lk9bkiLb0dx0HyxBa7YY/pJWbwmCVTHJAMGXMBsgPX
         7knueTxHsl1Nk8wkpNVmXXALC8qfWI+Yk1s6cSps42Dro/7JKrLeNO2nIEu1VJhK7xNd
         iZYkZXaWDnu/pxgaGGXb61ufoWzfJla6Vysnff+gCbumHbNhIb6HfyDWIro+QS8/GRS9
         EiQDCyshlgZ5WNkCl/3JJHewBBJHzLzV+5SD0S6j+7kP+gIoFb6RQ58yuxM0r9a3/CAE
         nJ4Hr6pyvh2F7baj+0ZT3azNSU97V5vHZz4KF5rRee3gZ/hTQTJApBsNa/lANx2TAXVx
         gmjw==
X-Gm-Message-State: AOJu0YxGLWA9HGZfGKTXEf/Z5woT6NhfJZC9H4sswGcx/lMjw2t/n46S
	EWKcOmFyI7fu7fhyhLKpr+JE6bH7toXOCjlMmHUb+Lf7E1/hPD2yePI3qrd2
X-Gm-Gg: ASbGncskCZROyRX17z456iGQj+KpOt89Xmh2gTr5nGh4eMVmNBc/j0RUSqK4Mhep9nw
	e+yZ2FjypDcr/3ZBojvICYzDpuW0JSrA3r4wZvCKb5I2+QQ3S0gca0UVimBJxQlmbKfR5O44zLt
	JOkg2JAH/hMXluFC1hL6SLreSXm0Pw/1Jvc5JNe9dMrrvJDmaVA0FxznhGq2de/0vl2iGbiAPJM
	tC96Cj1U2MfYH7X+t9J046EBiLf92R/O6bAGYJLTDxs1J1BNCo/uR9JgzDbw+BMwvmXb9S3AIN0
	BPOZLnU=
X-Google-Smtp-Source: AGHT+IG0S+/EA4qjrVV9+kOhD72zHQy761Pmgp8WNTP31Mrna7uwQVP5pSvBHGytAc81vs9xcUNmhw==
X-Received: by 2002:a17:902:e54e:b0:215:b5c6:9ee8 with SMTP id d9443c01a7336-21dd7c4628amr278906745ad.7.1738530585286;
        Sun, 02 Feb 2025 13:09:45 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::c09e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de331f8d4sm61888825ad.224.2025.02.02.13.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 13:09:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] binutils: Upgrade to 2.44 release
Date: Sun,  2 Feb 2025 13:09:41 -0800
Message-ID: <20250202210941.823439-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Feb 2025 21:09:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210627

* Drop the CVE-2024-53589 patch, its included in 2.44
* Package newly rename gp-* to gprofng-* binaries and remove old gp-*
  symlinks

* Gold linker is now deprecated and will be removed in future release
  its already deleted in tarball releases

* Support for the Nios II target has been removed.

* Assembler:
    - Support for new architecture extensions for AArch64, Risc-V and
      x86.

* Linker:
      The default maximum page size was changed from 16KiB to 64KiB for
      LoongArch.

      This now supports mixed LTO and non-LTO object files in
      relocatable output.

      The ELF forms of the linker support a --image-base=<ADDR> option
      for compatibility with LLD.

      The --build-id= option now accepts an argument of "xx" which
      enables the use of the xxhash library.  This produces a 128-bit
      hash and is 2-4x faster than md5 or sha1.

      The ELF linker option --package-metadata supports percent-encoded
      and %[string] encoded JSON payloads.

* Disassembler:
      The RISC-V disassembler now supports -M,max option like QEMU to
      dump instruction without checking architecture support as usual.

* GprofNG:
      Support added for hardware event counters for Neoverse-N1,
      Ampere-1, and Appliedmicro processors.

Detailed release notes [1]

[1] https://lists.gnu.org/archive/html/info-gnu/2025-02/msg00001.html

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 ...{binutils-2.43.1.inc => binutils-2.44.inc} |   9 +-
 ...3.1.bb => binutils-cross-canadian_2.44.bb} |   0
 ...cross_2.43.1.bb => binutils-cross_2.44.bb} |   0
 ...dk_2.43.1.bb => binutils-crosssdk_2.44.bb} |   0
 ...e_2.43.1.bb => binutils-testsuite_2.44.bb} |   0
 meta/recipes-devtools/binutils/binutils.inc   |  14 +-
 ...s-crosssdk-Generate-relocatable-SDKs.patch |  14 +-
 ...o-not-generate-linker-script-directo.patch |   4 +-
 ...dk-Search-for-alternative-ld.so.conf.patch |  14 +-
 ...004-Point-scripts-location-to-libdir.patch |   6 +-
 ...stro-compiler-point-to-the-wrong-ins.patch |   4 +-
 ...-system-directories-when-cross-linki.patch |  61 +-
 ...ect-assembling-for-ppc-wait-mnemonic.patch |   4 +-
 .../binutils/0008-Use-libtool-2.4.patch       | 820 +++++++++---------
 ...h-in-libtool-when-sysroot-is-enabled.patch |   8 +-
 .../0010-sync-with-OE-libtool-changes.patch   |  10 +-
 ...or-clang-before-checking-gcc-version.patch |  10 +-
 ...-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch |   8 +-
 ...sing-_Alignof-when-using-C11-or-newe.patch |   4 +-
 ...-pe-dll.o-entry-deom-targ_extra_ofil.patch |   6 +-
 .../binutils/0015-CVE-2024-53589.patch        |  92 --
 .../{binutils_2.43.1.bb => binutils_2.44.bb}  |   2 +-
 23 files changed, 492 insertions(+), 600 deletions(-)
 rename meta/recipes-devtools/binutils/{binutils-2.43.1.inc => binutils-2.44.inc} (91%)
 rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.43.1.bb => binutils-cross-canadian_2.44.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-cross_2.43.1.bb => binutils-cross_2.44.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.43.1.bb => binutils-crosssdk_2.44.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-testsuite_2.43.1.bb => binutils-testsuite_2.44.bb} (100%)
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0015-CVE-2024-53589.patch
 rename meta/recipes-devtools/binutils/{binutils_2.43.1.bb => binutils_2.44.bb} (97%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 926bf0ff572..6affa6d7184 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -22,7 +22,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
 GCCVERSION ?= "14.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
-BINUVERSION ?= "2.43%"
+BINUVERSION ?= "2.44%"
 GDBVERSION ?= "16.%"
 GLIBCVERSION ?= "2.41%"
 LINUXLIBCVERSION ?= "6.12%"
diff --git a/meta/recipes-devtools/binutils/binutils-2.43.1.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
similarity index 91%
rename from meta/recipes-devtools/binutils/binutils-2.43.1.inc
rename to meta/recipes-devtools/binutils/binutils-2.44.inc
index daaae775450..76986964094 100644
--- a/meta/recipes-devtools/binutils/binutils-2.43.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -12,15 +12,15 @@ LIC_FILES_CHKSUM = "\
 
 # When upgrading to next major release, ensure that there is no trailing .0, so
 # that upstream version check can work correctly.
-PV = "2.43.1"
-CVE_VERSION = "2.43.1"
-SRCBRANCH ?= "binutils-2_43-branch"
+PV = "2.44"
+CVE_VERSION = "2.44"
+SRCBRANCH ?= "binutils-2_44-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
 CVE_STATUS[CVE-2023-25584] = "cpe-incorrect: Applies only for version 2.40 and earlier"
 
-SRCREV ?= "b82e2250574ef00faf7fcb1e95e14f22b1fa85af"
+SRCREV ?= "815d9a14cbbb3b81843f7566222c87fb22e7255d"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
@@ -35,6 +35,5 @@ SRC_URI = "\
      file://0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch \
      file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
-     file://0015-CVE-2024-53589.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.43.1.bb b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.44.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross-canadian_2.43.1.bb
rename to meta/recipes-devtools/binutils/binutils-cross-canadian_2.44.bb
diff --git a/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb b/meta/recipes-devtools/binutils/binutils-cross_2.44.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb
rename to meta/recipes-devtools/binutils/binutils-cross_2.44.bb
diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.43.1.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.44.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-crosssdk_2.43.1.bb
rename to meta/recipes-devtools/binutils/binutils-crosssdk_2.44.bb
diff --git a/meta/recipes-devtools/binutils/binutils-testsuite_2.43.1.bb b/meta/recipes-devtools/binutils/binutils-testsuite_2.44.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-testsuite_2.43.1.bb
rename to meta/recipes-devtools/binutils/binutils-testsuite_2.44.bb
diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index e1b903f1ebf..81443105f69 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -39,11 +39,11 @@ FILES:${PN}-staticdev += "${libdir}/gprofng/*.a"
 # list and reuse it.
 
 GPROFNGS = " \
-	gp-archive \
-	gp-collect-app \
-	gp-display-html \
-	gp-display-src \
-	gp-display-text \
+	gprofng-archive \
+	gprofng-collect-app \
+	gprofng-display-html \
+	gprofng-display-src \
+	gprofng-display-text \
 	gprofng \
 "
 
@@ -191,6 +191,10 @@ do_install () {
 	for alt in ${USE_ALTERNATIVES_FOR}; do
 		rm -f ${D}${bindir}/$alt
 	done
+	# remove old pre 2.44 release gprofng binary names
+	for f in gp-archive gp-collect-app gp-display-html gp-display-src gp-display-text; do
+		rm -f ${D}${bindir}/$f
+	done
 
 	oe_multilib_header bfd.h
 }
diff --git a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
index 3dd559e3961..2443897cad1 100644
--- a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
+++ b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
@@ -1,4 +1,4 @@
-From 56d41f0cc6a806d2e8d7dcbfb4cca4cd37fba835 Mon Sep 17 00:00:00 2001
+From df3faaf0a09fd828330d3bac45782868a04f7bc0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:58:54 +0000
 Subject: [PATCH] binutils-crosssdk: Generate relocatable SDKs
@@ -21,7 +21,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 6 insertions(+), 3 deletions(-)
 
 diff --git a/gold/layout.cc b/gold/layout.cc
-index b43ae841a6c..6101a95195b 100644
+index f690c67618e..9ded8368482 100644
 --- a/gold/layout.cc
 +++ b/gold/layout.cc
 @@ -5102,7 +5102,7 @@ Layout::create_interp(const Target* target)
@@ -34,7 +34,7 @@ index b43ae841a6c..6101a95195b 100644
    Output_section_data* odata = new Output_data_const(interp, len, 1);
  
 diff --git a/ld/genscripts.sh b/ld/genscripts.sh
-index a726b158161..5d2eb737efc 100755
+index 77a1fb465ad..5b51c23e141 100755
 --- a/ld/genscripts.sh
 +++ b/ld/genscripts.sh
 @@ -315,6 +315,7 @@ DATA_ALIGNMENT_u="${DATA_ALIGNMENT_u-${DATA_ALIGNMENT_r}}"
@@ -59,17 +59,17 @@ index a726b158161..5d2eb737efc 100755
  DATA_ALIGNMENT=${DATA_ALIGNMENT_}
  RELOCATING=" "
 diff --git a/ld/scripttempl/elf.sc b/ld/scripttempl/elf.sc
-index 54716110b61..da17fe5cbce 100644
+index be8d19fcf11..26ecd6dff80 100644
 --- a/ld/scripttempl/elf.sc
 +++ b/ld/scripttempl/elf.sc
-@@ -152,8 +152,8 @@ if test -z "$DATA_SEGMENT_ALIGN"; then
-     DATA_SEGMENT_RELRO_END=". = DATA_SEGMENT_RELRO_END (${SEPARATE_GOTPLT-0}, .);"
+@@ -197,8 +197,8 @@ if test -z "$DATA_SEGMENT_ALIGN"; then
    fi
  fi
+ 
 -if test -z "${INITIAL_READONLY_SECTIONS}${CREATE_SHLIB}"; then
 -  INITIAL_READONLY_SECTIONS=".interp       ${RELOCATING-0} : { *(.interp) }"
 +if test -z "${INITIAL_READONLY_SECTIONS}${CREATE_SHLIB}${PARTIAL_LINKING}"; then
 +  INITIAL_READONLY_SECTIONS=".interp       ${RELOCATING-0} : { *(.interp); . = 0x1000; }"
  fi
+ 
  if test -z "$PLT"; then
-   IPLT=".iplt         ${RELOCATING-0} : { *(.iplt) }"
diff --git a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
index 3ad1da38e6b..20459fce663 100644
--- a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
+++ b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
@@ -1,4 +1,4 @@
-From 4f2a54c468c448efdd44813273893ec9c541deaf Mon Sep 17 00:00:00 2001
+From 3105d7ecc3f16d66c19985a6557cd1e9becfab55 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 6 Mar 2017 23:37:05 -0800
 Subject: [PATCH] binutils-cross: Do not generate linker script directories
@@ -22,7 +22,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 25 deletions(-)
 
 diff --git a/ld/genscripts.sh b/ld/genscripts.sh
-index 5d2eb737efc..ad225b0071d 100755
+index 5b51c23e141..5d2c54706f8 100755
 --- a/ld/genscripts.sh
 +++ b/ld/genscripts.sh
 @@ -244,31 +244,6 @@ append_to_lib_path()
diff --git a/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch b/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
index ec8e40c132e..374fbd6f413 100644
--- a/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
+++ b/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
@@ -1,4 +1,4 @@
-From bbb86582536ba9e4ab0fb4656d4697542172ab78 Mon Sep 17 00:00:00 2001
+From d718e17e1668880a85ff05993f0027d9c9ad6935 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 19 Feb 2020 09:51:16 -0800
 Subject: [PATCH] binutils-nativesdk: Search for alternative ld.so.conf in SDK
@@ -29,7 +29,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  5 files changed, 7 insertions(+), 3 deletions(-)
 
 diff --git a/ld/Makefile.am b/ld/Makefile.am
-index 6a9833e5775..b2776d2a1f3 100644
+index ccff9289924..cf2c29e89a3 100644
 --- a/ld/Makefile.am
 +++ b/ld/Makefile.am
 @@ -42,7 +42,8 @@ ZLIBINC = @zlibinc@
@@ -43,7 +43,7 @@ index 6a9833e5775..b2776d2a1f3 100644
  NO_WERROR = @NO_WERROR@
  AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CFLAGS) $(JANSSON_CFLAGS) $(ZSTD_CFLAGS)
 diff --git a/ld/Makefile.in b/ld/Makefile.in
-index 8639e782cdf..19c19088724 100644
+index 3e24bd4deb2..23d4f1f3132 100644
 --- a/ld/Makefile.in
 +++ b/ld/Makefile.in
 @@ -576,7 +576,8 @@ ZLIB = @zlibdir@ -lz
@@ -57,10 +57,10 @@ index 8639e782cdf..19c19088724 100644
  AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CFLAGS) $(JANSSON_CFLAGS) $(ZSTD_CFLAGS)
  
 diff --git a/ld/ldelf.c b/ld/ldelf.c
-index 09691609fc0..e49c0217ae2 100644
+index 4a1aa044e70..f6f3ac11a76 100644
 --- a/ld/ldelf.c
 +++ b/ld/ldelf.c
-@@ -939,7 +939,7 @@ ldelf_check_ld_so_conf (const struct bfd_link_needed_list *l, int force,
+@@ -943,7 +943,7 @@ ldelf_check_ld_so_conf (const struct bfd_link_needed_list *l, int force,
  
        info.path = NULL;
        info.len = info.alloc = 0;
@@ -70,7 +70,7 @@ index 09691609fc0..e49c0217ae2 100644
        if (!ldelf_parse_ld_so_conf (&info, tmppath))
  	{
 diff --git a/ld/ldmain.c b/ld/ldmain.c
-index 037099b9d37..2f500d73c58 100644
+index f1c5f7035c5..cce4991b25a 100644
 --- a/ld/ldmain.c
 +++ b/ld/ldmain.c
 @@ -69,6 +69,7 @@ char *program_name;
@@ -82,7 +82,7 @@ index 037099b9d37..2f500d73c58 100644
  /* The canonical representation of ld_sysroot.  */
  char *ld_canon_sysroot;
 diff --git a/ld/ldmain.h b/ld/ldmain.h
-index 0238aed0ebd..2dd00db13b3 100644
+index 0baa3c305c3..899c4b591c6 100644
 --- a/ld/ldmain.h
 +++ b/ld/ldmain.h
 @@ -23,6 +23,7 @@
diff --git a/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch b/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch
index 572c2e840ba..8a24408f4ff 100644
--- a/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch
+++ b/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch
@@ -1,4 +1,4 @@
-From aa371816a7ad55af4b29ffc32b213a812f4c6216 Mon Sep 17 00:00:00 2001
+From 0ff4f23d3521a45835eaa03731c0b3351a50d8ba Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:09:58 +0000
 Subject: [PATCH] Point scripts location to libdir
@@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/ld/Makefile.am b/ld/Makefile.am
-index b2776d2a1f3..76ebecb5685 100644
+index cf2c29e89a3..0a6eaada129 100644
 --- a/ld/Makefile.am
 +++ b/ld/Makefile.am
 @@ -51,7 +51,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CFLAGS) $(JANSSON_CFLAGS) $(ZSTD_CFLAGS)
@@ -25,7 +25,7 @@ index b2776d2a1f3..76ebecb5685 100644
  EMUL = @EMUL@
  EMULATION_OFILES = @EMULATION_OFILES@
 diff --git a/ld/Makefile.in b/ld/Makefile.in
-index 19c19088724..4be38a75feb 100644
+index 23d4f1f3132..c3d08edbef1 100644
 --- a/ld/Makefile.in
 +++ b/ld/Makefile.in
 @@ -584,7 +584,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CFLAGS) $(JANSSON_CFLAGS) $(ZSTD_CFLAGS)
diff --git a/meta/recipes-devtools/binutils/binutils/0005-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch b/meta/recipes-devtools/binutils/binutils/0005-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
index 2b1d57a05ed..4a1cd34f29d 100644
--- a/meta/recipes-devtools/binutils/binutils/0005-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
+++ b/meta/recipes-devtools/binutils/binutils/0005-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
@@ -1,4 +1,4 @@
-From cf20233a1d53effa223a8b72ae9c0652a472a87a Mon Sep 17 00:00:00 2001
+From 340d2cf058b373ed4fbf6bcea4f6674eab23c73a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:39:01 +0000
 Subject: [PATCH] don't let the distro compiler point to the wrong installation
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/libiberty/Makefile.in b/libiberty/Makefile.in
-index b77a41c781c..9fb4d6f09c9 100644
+index b11df756b4b..f47269fdc0e 100644
 --- a/libiberty/Makefile.in
 +++ b/libiberty/Makefile.in
 @@ -385,7 +385,8 @@ install-strip: install
diff --git a/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-directories-when-cross-linki.patch b/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-directories-when-cross-linki.patch
index 0c429d7f2c4..e094c89d1a0 100644
--- a/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-directories-when-cross-linki.patch
+++ b/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-directories-when-cross-linki.patch
@@ -1,4 +1,4 @@
-From 26f6a7a397e62b5e974cf88f6d4d8ba9a3d51e3c Mon Sep 17 00:00:00 2001
+From e9297b35595d7dd6c50ce6ff7282eee248b7e479 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 15 Jan 2016 06:31:09 +0000
 Subject: [PATCH] warn for uses of system directories when cross linking
@@ -56,17 +56,17 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  ld/configure.ac | 10 ++++++++++
  ld/ld.h         |  8 ++++++++
  ld/ld.texi      | 12 ++++++++++++
- ld/ldfile.c     | 16 ++++++++++++++++
+ ld/ldfile.c     | 17 +++++++++++++++++
  ld/ldlex.h      |  2 ++
  ld/ldmain.c     |  6 ++++--
  ld/lexsup.c     | 15 +++++++++++++++
- 9 files changed, 86 insertions(+), 2 deletions(-)
+ 9 files changed, 87 insertions(+), 2 deletions(-)
 
 diff --git a/ld/config.in b/ld/config.in
-index f7c9da3d02a..e4fdbf6db5b 100644
+index 2d7b6406d2b..37cd12d20fa 100644
 --- a/ld/config.in
 +++ b/ld/config.in
-@@ -74,6 +74,9 @@
+@@ -78,6 +78,9 @@
     language is requested. */
  #undef ENABLE_NLS
  
@@ -77,7 +77,7 @@ index f7c9da3d02a..e4fdbf6db5b 100644
  #undef EXTRA_SHLIB_EXTENSION
  
 diff --git a/ld/configure b/ld/configure
-index 1d89e3b0677..dd770216b61 100755
+index 597d110f57a..d537ec391d2 100755
 --- a/ld/configure
 +++ b/ld/configure
 @@ -844,6 +844,7 @@ with_lib_path
@@ -88,7 +88,7 @@ index 1d89e3b0677..dd770216b61 100755
  enable_gold
  enable_got
  enable_compressed_debug_sections
-@@ -1535,6 +1536,8 @@ Optional Features:
+@@ -1537,6 +1538,8 @@ Optional Features:
    --enable-checking       enable run-time checks
    --enable-targets        alternative target configurations
    --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
@@ -97,7 +97,7 @@ index 1d89e3b0677..dd770216b61 100755
    --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
    --enable-got=<type>     GOT handling scheme (target, single, negative,
                            multigot)
-@@ -15566,6 +15569,19 @@ fi
+@@ -15571,6 +15574,19 @@ fi
  
  
  
@@ -118,7 +118,7 @@ index 1d89e3b0677..dd770216b61 100755
  if test "${enable_gold+set}" = set; then :
    enableval=$enable_gold; case "${enableval}" in
 diff --git a/ld/configure.ac b/ld/configure.ac
-index bdf51a062fa..3d370ff92ce 100644
+index 228f2ee4089..50a4b0f4db1 100644
 --- a/ld/configure.ac
 +++ b/ld/configure.ac
 @@ -102,6 +102,16 @@ AC_SUBST(use_sysroot)
@@ -139,7 +139,7 @@ index bdf51a062fa..3d370ff92ce 100644
  dnl "install_as_default" is set to false if gold is the default linker.
  dnl "installed_linker" is the installed BFD linker name.
 diff --git a/ld/ld.h b/ld/ld.h
-index 0dee944cf2a..83bd82d2a2e 100644
+index 254f0a097bb..daf777c65c8 100644
 --- a/ld/ld.h
 +++ b/ld/ld.h
 @@ -166,6 +166,14 @@ typedef struct
@@ -158,10 +158,10 @@ index 0dee944cf2a..83bd82d2a2e 100644
    enum endian_enum endian;
  
 diff --git a/ld/ld.texi b/ld/ld.texi
-index 89e3913317a..178908edf32 100644
+index f6384ad82dd..26479a6a232 100644
 --- a/ld/ld.texi
 +++ b/ld/ld.texi
-@@ -3245,6 +3245,18 @@ creation of the metadata note, if one had been enabled by an earlier
+@@ -3279,6 +3279,18 @@ creation of the metadata note, if one had been enabled by an earlier
  occurrence of the --package-metadata option.
  If the linker has been built with libjansson, then the JSON string
  will be validated.
@@ -181,14 +181,15 @@ index 89e3913317a..178908edf32 100644
  
  @c man end
 diff --git a/ld/ldfile.c b/ld/ldfile.c
-index 87be885d31a..86c8a5b267d 100644
+index 12551504ae6..8bea4e7048f 100644
 --- a/ld/ldfile.c
 +++ b/ld/ldfile.c
-@@ -319,6 +319,22 @@
-   *search_tail_ptr = new_dirs;
-   search_tail_ptr = &new_dirs->next;
-
-+ #ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
+@@ -328,6 +328,23 @@ ldfile_add_library_path (const char *name, bool cmdline)
+     new_dirs->name = concat (ld_sysroot, name + strlen ("$SYSROOT"), (const char *) NULL);
+   else
+     new_dirs->name = xstrdup (name);
++
++#ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
 +  if (command_line.poison_system_directories
 +  && ((!strncmp (name, "/lib", 4))
 +      || (!strncmp (name, "/usr/lib", 8))
@@ -204,14 +205,14 @@ index 87be885d31a..86c8a5b267d 100644
 +   }
 +#endif
 +
-   /* If a directory is marked as honoring sysroot, prepend the sysroot path
-      now.  */
-   if (name[0] == '=')
+ }
+ 
+ static void
 diff --git a/ld/ldlex.h b/ld/ldlex.h
-index defe3fcbbb9..aea75a25dc8 100644
+index b8b7d6b6829..a8faeb635c4 100644
 --- a/ld/ldlex.h
 +++ b/ld/ldlex.h
-@@ -149,6 +149,8 @@ enum option_values
+@@ -150,6 +150,8 @@ enum option_values
    OPTION_PLUGIN_OPT,
    OPTION_PLUGIN_SAVE_TEMPS,
  #endif /* BFD_SUPPORTS_PLUGINS */
@@ -221,10 +222,10 @@ index defe3fcbbb9..aea75a25dc8 100644
    OPTION_PRINT_OUTPUT_FORMAT,
    OPTION_PRINT_SYSROOT,
 diff --git a/ld/ldmain.c b/ld/ldmain.c
-index 2f500d73c58..8b1bf7ad6aa 100644
+index cce4991b25a..1859465635d 100644
 --- a/ld/ldmain.c
 +++ b/ld/ldmain.c
-@@ -348,6 +348,8 @@ main (int argc, char **argv)
+@@ -352,6 +352,8 @@ main (int argc, char **argv)
    command_line.warn_mismatch = true;
    command_line.warn_search_mismatch = true;
    command_line.check_section_addresses = -1;
@@ -233,7 +234,7 @@ index 2f500d73c58..8b1bf7ad6aa 100644
  
    /* We initialize DEMANGLING based on the environment variable
       COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
-@@ -1489,7 +1491,7 @@ undefined_symbol (struct bfd_link_info *info,
+@@ -1500,7 +1502,7 @@ undefined_symbol (struct bfd_link_info *info,
        argv[1] = "undefined-symbol";
        argv[2] = (char *) name;
        argv[3] = NULL;
@@ -242,7 +243,7 @@ index 2f500d73c58..8b1bf7ad6aa 100644
        if (verbose)
  	einfo (_("%P: About to run error handling script '%s' with arguments: '%s' '%s'\n"),
  	       argv[0], argv[1], argv[2]);
-@@ -1510,7 +1512,7 @@ undefined_symbol (struct bfd_link_info *info,
+@@ -1521,7 +1523,7 @@ undefined_symbol (struct bfd_link_info *info,
  	 carry on to issue the normal error message.  */
      }
  #endif /* SUPPORT_ERROR_HANDLING_SCRIPT */
@@ -252,10 +253,10 @@ index 2f500d73c58..8b1bf7ad6aa 100644
      {
        if (error_count < MAX_ERRORS_IN_A_ROW)
 diff --git a/ld/lexsup.c b/ld/lexsup.c
-index 4aa0124ce2f..65c90d48332 100644
+index 5399aa45b72..8f9a221bfba 100644
 --- a/ld/lexsup.c
 +++ b/ld/lexsup.c
-@@ -648,6 +648,14 @@ static const struct ld_option ld_options[] =
+@@ -650,6 +650,14 @@ static const struct ld_option ld_options[] =
  		   "                                <method> is: share-unconflicted (default),\n"
  		   "                                             share-duplicated"),
      TWO_DASHES },
@@ -270,7 +271,7 @@ index 4aa0124ce2f..65c90d48332 100644
  };
  
  #define OPTION_COUNT ARRAY_SIZE (ld_options)
-@@ -1834,6 +1842,13 @@ parse_args (unsigned argc, char **argv)
+@@ -1838,6 +1846,13 @@ parse_args (unsigned argc, char **argv)
  
  	case OPTION_PRINT_MAP_LOCALS:
  	  config.print_map_locals = true;
diff --git a/meta/recipes-devtools/binutils/binutils/0007-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch b/meta/recipes-devtools/binutils/binutils/0007-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
index 7144b7d18de..7101219bf44 100644
--- a/meta/recipes-devtools/binutils/binutils/0007-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
+++ b/meta/recipes-devtools/binutils/binutils/0007-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
@@ -1,4 +1,4 @@
-From bfc643d4044dccc917549f2db439cff165512b02 Mon Sep 17 00:00:00 2001
+From de07998ce2189c329220a76feb073438c4ec88f5 Mon Sep 17 00:00:00 2001
 From: Zhenhua Luo <zhenhua.luo@nxp.com>
 Date: Sat, 11 Jun 2016 22:08:29 -0500
 Subject: [PATCH] fix the incorrect assembling for ppc wait mnemonic
@@ -14,7 +14,7 @@ Signed-off-by: Zhenhua Luo <zhenhua.luo@nxp.com>
  1 file changed, 1 insertion(+), 3 deletions(-)
 
 diff --git a/opcodes/ppc-opc.c b/opcodes/ppc-opc.c
-index e55bfe846cd..66b37e36e6f 100644
+index aa4484ef9ab..81b6a4c2db9 100644
 --- a/opcodes/ppc-opc.c
 +++ b/opcodes/ppc-opc.c
 @@ -7138,8 +7138,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
diff --git a/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch b/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch
index 19dc7ab7bda..f8dcbd5e4d7 100644
--- a/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch
+++ b/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch
@@ -1,4 +1,4 @@
-From a5272ced746039b50606ebeb311c38adad49a817 Mon Sep 17 00:00:00 2001
+From dc3a330d6525c6276930c3175e5c878fe2cd9784 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 14 Feb 2016 17:04:07 +0000
 Subject: [PATCH] Use libtool 2.4
@@ -10,14 +10,14 @@ Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  bfd/Makefile.in                     |    3 +
- bfd/configure                       | 1333 +++++++++---
+ bfd/configure                       | 1333 ++++++++----
  bfd/configure.ac                    |    2 +-
  binutils/Makefile.in                |    3 +
- binutils/configure                  | 1331 +++++++++---
+ binutils/configure                  | 1331 ++++++++----
  gas/Makefile.in                     |    3 +
- gas/configure                       | 1331 +++++++++---
+ gas/configure                       | 1331 ++++++++----
  gprof/Makefile.in                   |    3 +
- gprof/configure                     | 1331 +++++++++---
+ gprof/configure                     | 1331 ++++++++----
  gprofng/Makefile.in                 |    2 +
  gprofng/configure                   | 1693 ++++++++++++----
  gprofng/doc/Makefile.in             |    2 +
@@ -31,23 +31,23 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  libbacktrace/aclocal.m4             |   73 +-
  libbacktrace/configure              | 1441 +++++++++----
  libctf/Makefile.in                  |    2 +
- libctf/configure                    | 1330 +++++++++---
+ libctf/configure                    | 1330 ++++++++----
  libsframe/Makefile.in               |  344 ++--
  libsframe/aclocal.m4                |  220 +-
  libsframe/configure                 | 1553 ++++++++++----
  libtool.m4                          | 1085 ++++++----
- ltmain.sh                           | 2921 ++++++++++++++++++---------
+ ltmain.sh                           | 2898 ++++++++++++++++++---------
  ltoptions.m4                        |    2 +-
  ltversion.m4                        |   12 +-
  lt~obsolete.m4                      |    2 +-
  opcodes/Makefile.in                 |    3 +
- opcodes/configure                   | 1331 +++++++++---
+ opcodes/configure                   | 1331 ++++++++----
  zlib/Makefile.in                    |    3 +
- zlib/configure                      | 1331 +++++++++---
- 35 files changed, 16090 insertions(+), 6108 deletions(-)
+ zlib/configure                      | 1331 ++++++++----
+ 35 files changed, 16078 insertions(+), 6097 deletions(-)
 
 diff --git a/bfd/Makefile.in b/bfd/Makefile.in
-index b3d97d478ea..8c19e1766fa 100644
+index ee674a36c5b..130a50d80b0 100644
 --- a/bfd/Makefile.in
 +++ b/bfd/Makefile.in
 @@ -340,6 +340,7 @@ DATADIRNAME = @DATADIRNAME@
@@ -75,7 +75,7 @@ index b3d97d478ea..8c19e1766fa 100644
  ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
  all_backends = @all_backends@
 diff --git a/bfd/configure b/bfd/configure
-index 9fe9cf6919f..37b2e6c3393 100755
+index b0f424dffc2..ba3fce10980 100755
 --- a/bfd/configure
 +++ b/bfd/configure
 @@ -712,6 +712,9 @@ OTOOL
@@ -1408,7 +1408,7 @@ index 9fe9cf6919f..37b2e6c3393 100755
    fi
  fi
  
-@@ -18316,13 +18966,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -18314,13 +18964,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -1429,7 +1429,7 @@ index 9fe9cf6919f..37b2e6c3393 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -18337,14 +18994,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -18335,14 +18992,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -1448,7 +1448,7 @@ index 9fe9cf6919f..37b2e6c3393 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -18377,12 +19037,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -18375,12 +19035,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -1462,7 +1462,7 @@ index 9fe9cf6919f..37b2e6c3393 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -18437,8 +19097,13 @@ reload_flag \
+@@ -18435,8 +19095,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -1476,7 +1476,7 @@ index 9fe9cf6919f..37b2e6c3393 100755
  STRIP \
  RANLIB \
  CC \
-@@ -18448,12 +19113,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -18446,12 +19111,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -1492,7 +1492,7 @@ index 9fe9cf6919f..37b2e6c3393 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -18469,7 +19136,6 @@ no_undefined_flag \
+@@ -18467,7 +19134,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -1500,7 +1500,7 @@ index 9fe9cf6919f..37b2e6c3393 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -18505,6 +19171,7 @@ module_cmds \
+@@ -18503,6 +19169,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -1508,7 +1508,7 @@ index 9fe9cf6919f..37b2e6c3393 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -19281,7 +19948,8 @@ $as_echo X"$file" |
+@@ -19279,7 +19946,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -1518,7 +1518,7 @@ index 9fe9cf6919f..37b2e6c3393 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -19384,19 +20052,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -19382,19 +20050,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -1562,7 +1562,7 @@ index 9fe9cf6919f..37b2e6c3393 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -19426,6 +20117,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -19424,6 +20115,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -1575,7 +1575,7 @@ index 9fe9cf6919f..37b2e6c3393 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -19435,6 +20132,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -19433,6 +20130,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -1585,7 +1585,7 @@ index 9fe9cf6919f..37b2e6c3393 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -19549,12 +20249,12 @@ with_gcc=$GCC
+@@ -19547,12 +20247,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -1601,7 +1601,7 @@ index 9fe9cf6919f..37b2e6c3393 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -19641,9 +20341,6 @@ inherit_rpath=$inherit_rpath
+@@ -19639,9 +20339,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -1611,7 +1611,7 @@ index 9fe9cf6919f..37b2e6c3393 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -19659,6 +20356,9 @@ include_expsyms=$lt_include_expsyms
+@@ -19657,6 +20354,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -1621,7 +1621,7 @@ index 9fe9cf6919f..37b2e6c3393 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -19691,210 +20391,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -19689,210 +20389,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -1996,7 +1996,7 @@ index 9fe9cf6919f..37b2e6c3393 100755
    chmod +x "$ofile"
  
 diff --git a/bfd/configure.ac b/bfd/configure.ac
-index 6bcfd1b7368..6aedf387cb9 100644
+index 90fad5417b3..1d57f289f18 100644
 --- a/bfd/configure.ac
 +++ b/bfd/configure.ac
 @@ -275,7 +275,7 @@ changequote(,)dnl
@@ -2009,7 +2009,7 @@ index 6bcfd1b7368..6aedf387cb9 100644
  fi
  
 diff --git a/binutils/Makefile.in b/binutils/Makefile.in
-index 67fa5b3b8d9..3273426119c 100644
+index 8029bc29d57..5b2b4b81426 100644
 --- a/binutils/Makefile.in
 +++ b/binutils/Makefile.in
 @@ -495,6 +495,7 @@ DEBUGINFOD_LIBS = @DEBUGINFOD_LIBS@
@@ -2037,7 +2037,7 @@ index 67fa5b3b8d9..3273426119c 100644
  ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
  am__include = @am__include@
 diff --git a/binutils/configure b/binutils/configure
-index e97f4cba053..6e6e08b350a 100755
+index caa7c3679e9..5b5c7b38028 100755
 --- a/binutils/configure
 +++ b/binutils/configure
 @@ -704,8 +704,11 @@ OTOOL
@@ -3363,7 +3363,7 @@ index e97f4cba053..6e6e08b350a 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -17393,13 +18043,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -17383,13 +18033,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -3384,7 +3384,7 @@ index e97f4cba053..6e6e08b350a 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -17414,14 +18071,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -17404,14 +18061,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -3403,7 +3403,7 @@ index e97f4cba053..6e6e08b350a 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -17454,12 +18114,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -17444,12 +18104,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -3417,7 +3417,7 @@ index e97f4cba053..6e6e08b350a 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -17514,8 +18174,13 @@ reload_flag \
+@@ -17504,8 +18164,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -3431,7 +3431,7 @@ index e97f4cba053..6e6e08b350a 100755
  STRIP \
  RANLIB \
  CC \
-@@ -17525,12 +18190,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -17515,12 +18180,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -3447,7 +3447,7 @@ index e97f4cba053..6e6e08b350a 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -17546,7 +18213,6 @@ no_undefined_flag \
+@@ -17536,7 +18203,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -3455,7 +3455,7 @@ index e97f4cba053..6e6e08b350a 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -17582,6 +18248,7 @@ module_cmds \
+@@ -17572,6 +18238,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -3463,7 +3463,7 @@ index e97f4cba053..6e6e08b350a 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -18355,7 +19022,8 @@ $as_echo X"$file" |
+@@ -18345,7 +19012,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -3473,7 +3473,7 @@ index e97f4cba053..6e6e08b350a 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -18458,19 +19126,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -18448,19 +19116,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -3517,7 +3517,7 @@ index e97f4cba053..6e6e08b350a 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -18500,6 +19191,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -18490,6 +19181,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -3530,7 +3530,7 @@ index e97f4cba053..6e6e08b350a 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -18509,6 +19206,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -18499,6 +19196,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -3540,7 +3540,7 @@ index e97f4cba053..6e6e08b350a 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -18623,12 +19323,12 @@ with_gcc=$GCC
+@@ -18613,12 +19313,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -3556,7 +3556,7 @@ index e97f4cba053..6e6e08b350a 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -18715,9 +19415,6 @@ inherit_rpath=$inherit_rpath
+@@ -18705,9 +19405,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -3566,7 +3566,7 @@ index e97f4cba053..6e6e08b350a 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -18733,6 +19430,9 @@ include_expsyms=$lt_include_expsyms
+@@ -18723,6 +19420,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -3576,7 +3576,7 @@ index e97f4cba053..6e6e08b350a 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -18765,210 +19465,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -18755,210 +19455,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -3951,7 +3951,7 @@ index e97f4cba053..6e6e08b350a 100755
    chmod +x "$ofile"
  
 diff --git a/gas/Makefile.in b/gas/Makefile.in
-index b57516369d7..1d5f5295102 100644
+index 1f24d4a5bbc..0147b491612 100644
 --- a/gas/Makefile.in
 +++ b/gas/Makefile.in
 @@ -384,6 +384,7 @@ CYGPATH_W = @CYGPATH_W@
@@ -3979,7 +3979,7 @@ index b57516369d7..1d5f5295102 100644
  ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
  am__include = @am__include@
 diff --git a/gas/configure b/gas/configure
-index a4d64ce5289..01c0c35ecad 100755
+index 085c87d564c..14b1dc0f121 100755
 --- a/gas/configure
 +++ b/gas/configure
 @@ -692,8 +692,11 @@ OTOOL
@@ -4002,7 +4002,7 @@ index a4d64ce5289..01c0c35ecad 100755
  enable_libtool_lock
  enable_plugins
  enable_largefile
-@@ -1517,6 +1521,8 @@ Optional Packages:
+@@ -1519,6 +1523,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -4011,7 +4011,7 @@ index a4d64ce5289..01c0c35ecad 100755
    --with-cpu=CPU          default cpu variant is CPU (currently only supported
                            on ARC)
    --with-gnu-ld           assume the C compiler uses GNU ld default=no
-@@ -4650,8 +4656,8 @@ esac
+@@ -4652,8 +4658,8 @@ esac
  
  
  
@@ -4022,7 +4022,7 @@ index a4d64ce5289..01c0c35ecad 100755
  
  
  
-@@ -4691,7 +4697,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -4693,7 +4699,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -4031,7 +4031,7 @@ index a4d64ce5289..01c0c35ecad 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -5384,8 +5390,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -5386,8 +5392,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -4042,7 +4042,7 @@ index a4d64ce5289..01c0c35ecad 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -5434,6 +5440,80 @@ esac
+@@ -5436,6 +5442,80 @@ esac
  
  
  
@@ -4123,7 +4123,7 @@ index a4d64ce5289..01c0c35ecad 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if ${lt_cv_ld_reload_flag+:} false; then :
-@@ -5450,6 +5530,11 @@ case $reload_flag in
+@@ -5452,6 +5532,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -4135,7 +4135,7 @@ index a4d64ce5289..01c0c35ecad 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -5618,7 +5703,8 @@ mingw* | pw32*)
+@@ -5620,7 +5705,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -4145,7 +4145,7 @@ index a4d64ce5289..01c0c35ecad 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -5777,6 +5863,21 @@ esac
+@@ -5779,6 +5865,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -4167,7 +4167,7 @@ index a4d64ce5289..01c0c35ecad 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -5792,6 +5893,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -5794,6 +5895,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -4325,7 +4325,7 @@ index a4d64ce5289..01c0c35ecad 100755
  plugin_option=
  plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
  for plugin in $plugin_names; do
-@@ -5806,8 +6058,10 @@ for plugin in $plugin_names; do
+@@ -5808,8 +6060,10 @@ for plugin in $plugin_names; do
  done
  
  if test -n "$ac_tool_prefix"; then
@@ -4338,7 +4338,7 @@ index a4d64ce5289..01c0c35ecad 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_AR+:} false; then :
-@@ -5823,7 +6077,7 @@ do
+@@ -5825,7 +6079,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -4347,7 +4347,7 @@ index a4d64ce5289..01c0c35ecad 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -5843,11 +6097,15 @@ $as_echo "no" >&6; }
+@@ -5845,11 +6099,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -4366,7 +4366,7 @@ index a4d64ce5289..01c0c35ecad 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_ac_ct_AR+:} false; then :
-@@ -5863,7 +6121,7 @@ do
+@@ -5865,7 +6123,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -4375,7 +4375,7 @@ index a4d64ce5289..01c0c35ecad 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -5882,6 +6140,10 @@ else
+@@ -5884,6 +6142,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -4386,7 +4386,7 @@ index a4d64ce5289..01c0c35ecad 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -5893,29 +6155,81 @@ ac_tool_warned=yes ;;
+@@ -5895,29 +6157,81 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -4483,7 +4483,7 @@ index a4d64ce5289..01c0c35ecad 100755
  
  
  
-@@ -6262,8 +6576,8 @@ esac
+@@ -6264,8 +6578,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -4494,7 +4494,7 @@ index a4d64ce5289..01c0c35ecad 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -6299,6 +6613,7 @@ for ac_symprfx in "" "_"; do
+@@ -6301,6 +6615,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -4502,7 +4502,7 @@ index a4d64ce5289..01c0c35ecad 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -6340,6 +6655,18 @@ _LT_EOF
+@@ -6342,6 +6657,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -4521,7 +4521,7 @@ index a4d64ce5289..01c0c35ecad 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -6351,7 +6678,7 @@ _LT_EOF
+@@ -6353,7 +6680,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -4530,7 +4530,7 @@ index a4d64ce5289..01c0c35ecad 100755
    const char *name;
    void       *address;
  }
-@@ -6377,8 +6704,8 @@ static const void *lt_preloaded_setup() {
+@@ -6379,8 +6706,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -4541,7 +4541,7 @@ index a4d64ce5289..01c0c35ecad 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -6388,8 +6715,8 @@ _LT_EOF
+@@ -6390,8 +6717,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -4552,7 +4552,7 @@ index a4d64ce5289..01c0c35ecad 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -6426,6 +6753,19 @@ else
+@@ -6428,6 +6755,19 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -4572,7 +4572,7 @@ index a4d64ce5289..01c0c35ecad 100755
  
  
  
-@@ -6442,6 +6782,42 @@ fi
+@@ -6444,6 +6784,42 @@ fi
  
  
  
@@ -4615,7 +4615,7 @@ index a4d64ce5289..01c0c35ecad 100755
  
  
  
-@@ -6653,6 +7029,123 @@ esac
+@@ -6655,6 +7031,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -4739,7 +4739,7 @@ index a4d64ce5289..01c0c35ecad 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7216,6 +7709,8 @@ _LT_EOF
+@@ -7218,6 +7711,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -4748,7 +4748,7 @@ index a4d64ce5289..01c0c35ecad 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -7800,8 +8295,6 @@ fi
+@@ -7802,8 +8297,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -4757,7 +4757,7 @@ index a4d64ce5289..01c0c35ecad 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -7967,6 +8460,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -7969,6 +8462,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -4770,7 +4770,7 @@ index a4d64ce5289..01c0c35ecad 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8029,7 +8528,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8031,7 +8530,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -4779,7 +4779,7 @@ index a4d64ce5289..01c0c35ecad 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8086,13 +8585,17 @@ case $host_os in
+@@ -8088,13 +8587,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -4803,7 +4803,7 @@ index a4d64ce5289..01c0c35ecad 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8153,6 +8656,11 @@ fi
+@@ -8155,6 +8658,11 @@ fi
  
  
  
@@ -4815,7 +4815,7 @@ index a4d64ce5289..01c0c35ecad 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -8503,7 +9011,8 @@ _LT_EOF
+@@ -8505,7 +9013,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -4825,7 +4825,7 @@ index a4d64ce5289..01c0c35ecad 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -8602,12 +9111,12 @@ _LT_EOF
+@@ -8604,12 +9113,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -4840,7 +4840,7 @@ index a4d64ce5289..01c0c35ecad 100755
  	  fi
  	  ;;
  	esac
-@@ -8621,8 +9130,8 @@ _LT_EOF
+@@ -8623,8 +9132,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -4851,7 +4851,7 @@ index a4d64ce5289..01c0c35ecad 100755
        fi
        ;;
  
-@@ -8640,8 +9149,8 @@ _LT_EOF
+@@ -8642,8 +9151,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -4862,7 +4862,7 @@ index a4d64ce5289..01c0c35ecad 100755
        else
  	ld_shlibs=no
        fi
-@@ -8687,8 +9196,8 @@ _LT_EOF
+@@ -8689,8 +9198,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -4873,7 +4873,7 @@ index a4d64ce5289..01c0c35ecad 100755
        else
  	ld_shlibs=no
        fi
-@@ -8818,7 +9327,13 @@ _LT_EOF
+@@ -8820,7 +9329,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -4888,7 +4888,7 @@ index a4d64ce5289..01c0c35ecad 100755
  /* end confdefs.h.  */
  
  int
-@@ -8831,22 +9346,29 @@ main ()
+@@ -8833,22 +9348,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -4931,7 +4931,7 @@ index a4d64ce5289..01c0c35ecad 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -8858,7 +9380,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8860,7 +9382,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -4946,7 +4946,7 @@ index a4d64ce5289..01c0c35ecad 100755
  /* end confdefs.h.  */
  
  int
-@@ -8871,22 +9399,29 @@ main ()
+@@ -8873,22 +9401,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -4989,7 +4989,7 @@ index a4d64ce5289..01c0c35ecad 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -8931,20 +9466,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8933,20 +9468,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -5067,7 +5067,7 @@ index a4d64ce5289..01c0c35ecad 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9005,7 +9583,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9007,7 +9585,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -5076,7 +5076,7 @@ index a4d64ce5289..01c0c35ecad 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9013,7 +9591,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9015,7 +9593,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -5085,7 +5085,7 @@ index a4d64ce5289..01c0c35ecad 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9029,7 +9607,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9031,7 +9609,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -5094,7 +5094,7 @@ index a4d64ce5289..01c0c35ecad 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9053,10 +9631,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9055,10 +9633,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -5107,7 +5107,7 @@ index a4d64ce5289..01c0c35ecad 100755
  	  ;;
  	esac
        else
-@@ -9135,23 +9713,36 @@ fi
+@@ -9137,23 +9715,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -5152,7 +5152,7 @@ index a4d64ce5289..01c0c35ecad 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9236,7 +9827,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9238,7 +9829,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -5161,7 +5161,7 @@ index a4d64ce5289..01c0c35ecad 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9255,9 +9846,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9257,9 +9848,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -5173,7 +5173,7 @@ index a4d64ce5289..01c0c35ecad 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -9833,8 +10424,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -9835,8 +10426,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -5185,7 +5185,7 @@ index a4d64ce5289..01c0c35ecad 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -9867,13 +10459,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -9869,13 +10461,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -5258,16 +5258,16 @@ index a4d64ce5289..01c0c35ecad 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10775,7 +11425,7 @@ else
+@@ -10777,7 +11427,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 10778 "configure"
+-#line 10780 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -10819,10 +11469,10 @@ else
+@@ -10821,10 +11471,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -5280,16 +5280,16 @@ index a4d64ce5289..01c0c35ecad 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -10881,7 +11531,7 @@ else
+@@ -10883,7 +11533,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 10884 "configure"
+-#line 10886 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -10925,10 +11575,10 @@ else
+@@ -10927,10 +11577,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -5302,7 +5302,7 @@ index a4d64ce5289..01c0c35ecad 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -17078,13 +17728,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -17049,13 +17699,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -5323,7 +5323,7 @@ index a4d64ce5289..01c0c35ecad 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -17099,14 +17756,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -17070,14 +17727,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -5342,7 +5342,7 @@ index a4d64ce5289..01c0c35ecad 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -17139,12 +17799,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -17110,12 +17770,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -5356,7 +5356,7 @@ index a4d64ce5289..01c0c35ecad 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -17199,8 +17859,13 @@ reload_flag \
+@@ -17170,8 +17830,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -5370,7 +5370,7 @@ index a4d64ce5289..01c0c35ecad 100755
  STRIP \
  RANLIB \
  CC \
-@@ -17210,12 +17875,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -17181,12 +17846,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -5386,7 +5386,7 @@ index a4d64ce5289..01c0c35ecad 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -17231,7 +17898,6 @@ no_undefined_flag \
+@@ -17202,7 +17869,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -5394,7 +5394,7 @@ index a4d64ce5289..01c0c35ecad 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -17267,6 +17933,7 @@ module_cmds \
+@@ -17238,6 +17904,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -5402,7 +5402,7 @@ index a4d64ce5289..01c0c35ecad 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -18047,7 +18714,8 @@ $as_echo X"$file" |
+@@ -18018,7 +18685,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -5412,7 +5412,7 @@ index a4d64ce5289..01c0c35ecad 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -18150,19 +18818,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -18121,19 +18789,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -5456,7 +5456,7 @@ index a4d64ce5289..01c0c35ecad 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -18192,6 +18883,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -18163,6 +18854,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -5469,7 +5469,7 @@ index a4d64ce5289..01c0c35ecad 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -18201,6 +18898,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -18172,6 +18869,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -5479,7 +5479,7 @@ index a4d64ce5289..01c0c35ecad 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -18315,12 +19015,12 @@ with_gcc=$GCC
+@@ -18286,12 +18986,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -5495,7 +5495,7 @@ index a4d64ce5289..01c0c35ecad 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -18407,9 +19107,6 @@ inherit_rpath=$inherit_rpath
+@@ -18378,9 +19078,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -5505,7 +5505,7 @@ index a4d64ce5289..01c0c35ecad 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -18425,6 +19122,9 @@ include_expsyms=$lt_include_expsyms
+@@ -18396,6 +19093,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -5515,7 +5515,7 @@ index a4d64ce5289..01c0c35ecad 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -18457,210 +19157,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -18428,210 +19128,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -5890,7 +5890,7 @@ index a4d64ce5289..01c0c35ecad 100755
    chmod +x "$ofile"
  
 diff --git a/gprof/Makefile.in b/gprof/Makefile.in
-index a7398231030..fc7a3d78db0 100644
+index 93fb378149a..6744cb1ff8c 100644
 --- a/gprof/Makefile.in
 +++ b/gprof/Makefile.in
 @@ -327,6 +327,7 @@ CYGPATH_W = @CYGPATH_W@
@@ -5918,7 +5918,7 @@ index a7398231030..fc7a3d78db0 100644
  ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
  am__include = @am__include@
 diff --git a/gprof/configure b/gprof/configure
-index e3c86d3f1ed..e5e6edbe821 100755
+index 47ed79d1df4..bfbf4c421f3 100755
 --- a/gprof/configure
 +++ b/gprof/configure
 @@ -669,8 +669,11 @@ OTOOL
@@ -7832,7 +7832,7 @@ index e3c86d3f1ed..e5e6edbe821 100755
    chmod +x "$ofile"
  
 diff --git a/gprofng/Makefile.in b/gprofng/Makefile.in
-index 5ced0e012eb..e6174273972 100644
+index f770dac57c5..dbdfd96c5ff 100644
 --- a/gprofng/Makefile.in
 +++ b/gprofng/Makefile.in
 @@ -254,6 +254,7 @@ CXXFLAGS = @CXXFLAGS@
@@ -7852,7 +7852,7 @@ index 5ced0e012eb..e6174273972 100644
  NM = @NM@
  NMEDIT = @NMEDIT@
 diff --git a/gprofng/configure b/gprofng/configure
-index cf3e9c3d0db..56e99cbe272 100755
+index 524dbe737ec..6aaed114536 100755
 --- a/gprofng/configure
 +++ b/gprofng/configure
 @@ -672,6 +672,8 @@ OTOOL
@@ -10428,7 +10428,7 @@ index cf3e9c3d0db..56e99cbe272 100755
  file_list_spec=$lt_file_list_spec_CXX
  
 diff --git a/gprofng/doc/Makefile.in b/gprofng/doc/Makefile.in
-index 5b57544d91a..da05c4cc0f0 100644
+index 162ae4b19c1..9e6017aa0ff 100644
 --- a/gprofng/doc/Makefile.in
 +++ b/gprofng/doc/Makefile.in
 @@ -238,6 +238,7 @@ CXXFLAGS = @CXXFLAGS@
@@ -10448,7 +10448,7 @@ index 5b57544d91a..da05c4cc0f0 100644
  NM = @NM@
  NMEDIT = @NMEDIT@
 diff --git a/gprofng/gp-display-html/Makefile.in b/gprofng/gp-display-html/Makefile.in
-index b667ae91617..1a6dcf47d34 100644
+index 2b8580f40f9..a01e34702d7 100644
 --- a/gprofng/gp-display-html/Makefile.in
 +++ b/gprofng/gp-display-html/Makefile.in
 @@ -198,6 +198,7 @@ CXXFLAGS = @CXXFLAGS@
@@ -10468,7 +10468,7 @@ index b667ae91617..1a6dcf47d34 100644
  NM = @NM@
  NMEDIT = @NMEDIT@
 diff --git a/gprofng/libcollector/Makefile.in b/gprofng/libcollector/Makefile.in
-index ce8755c80c9..91e29c29ab8 100644
+index 4448745f17e..ff20f8f0715 100644
 --- a/gprofng/libcollector/Makefile.in
 +++ b/gprofng/libcollector/Makefile.in
 @@ -316,6 +316,7 @@ CXXFLAGS = @CXXFLAGS@
@@ -10488,7 +10488,7 @@ index ce8755c80c9..91e29c29ab8 100644
  NM = @NM@
  NMEDIT = @NMEDIT@
 diff --git a/gprofng/libcollector/configure b/gprofng/libcollector/configure
-index 4c55f672332..5c175851e3c 100755
+index b1ba1edb35b..5a20f484c38 100755
 --- a/gprofng/libcollector/configure
 +++ b/gprofng/libcollector/configure
 @@ -640,6 +640,8 @@ OTOOL
@@ -13064,7 +13064,7 @@ index 4c55f672332..5c175851e3c 100755
  file_list_spec=$lt_file_list_spec_CXX
  
 diff --git a/gprofng/src/Makefile.in b/gprofng/src/Makefile.in
-index cef4b275305..8b769d439fa 100644
+index d0dec12e244..cf2745db706 100644
 --- a/gprofng/src/Makefile.in
 +++ b/gprofng/src/Makefile.in
 @@ -322,6 +322,7 @@ CXXFLAGS = @CXXFLAGS@
@@ -13084,7 +13084,7 @@ index cef4b275305..8b769d439fa 100644
  NM = @NM@
  NMEDIT = @NMEDIT@
 diff --git a/ld/Makefile.in b/ld/Makefile.in
-index 4be38a75feb..24b219d9df6 100644
+index c3d08edbef1..7ee6acd3e03 100644
 --- a/ld/Makefile.in
 +++ b/ld/Makefile.in
 @@ -390,6 +390,7 @@ CYGPATH_W = @CYGPATH_W@
@@ -13112,7 +13112,7 @@ index 4be38a75feb..24b219d9df6 100644
  ac_ct_CXX = @ac_ct_CXX@
  ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
 diff --git a/ld/configure b/ld/configure
-index dd770216b61..e8c5bc61d24 100755
+index d537ec391d2..de7b61bb612 100755
 --- a/ld/configure
 +++ b/ld/configure
 @@ -705,8 +705,11 @@ OTOOL
@@ -13135,7 +13135,7 @@ index dd770216b61..e8c5bc61d24 100755
  enable_libtool_lock
  enable_plugins
  enable_largefile
-@@ -1583,6 +1587,8 @@ Optional Packages:
+@@ -1586,6 +1590,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -13144,7 +13144,7 @@ index dd770216b61..e8c5bc61d24 100755
    --with-lib-path=dir1:dir2...  set default LIB_PATH
    --with-sysroot=DIR Search for usr/lib et al within DIR.
    --with-gnu-ld           assume the C compiler uses GNU ld default=no
-@@ -5560,8 +5566,8 @@ esac
+@@ -5565,8 +5571,8 @@ esac
  
  
  
@@ -13155,7 +13155,7 @@ index dd770216b61..e8c5bc61d24 100755
  
  
  
-@@ -5601,7 +5607,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -5606,7 +5612,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -13164,7 +13164,7 @@ index dd770216b61..e8c5bc61d24 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -6294,8 +6300,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -6299,8 +6305,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -13175,7 +13175,7 @@ index dd770216b61..e8c5bc61d24 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -6344,6 +6350,80 @@ esac
+@@ -6349,6 +6355,80 @@ esac
  
  
  
@@ -13256,7 +13256,7 @@ index dd770216b61..e8c5bc61d24 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if ${lt_cv_ld_reload_flag+:} false; then :
-@@ -6360,6 +6440,11 @@ case $reload_flag in
+@@ -6365,6 +6445,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -13268,7 +13268,7 @@ index dd770216b61..e8c5bc61d24 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -6528,7 +6613,8 @@ mingw* | pw32*)
+@@ -6533,7 +6618,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -13278,7 +13278,7 @@ index dd770216b61..e8c5bc61d24 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6687,6 +6773,21 @@ esac
+@@ -6692,6 +6778,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -13300,7 +13300,7 @@ index dd770216b61..e8c5bc61d24 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6702,6 +6803,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -6707,6 +6808,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -13458,7 +13458,7 @@ index dd770216b61..e8c5bc61d24 100755
  plugin_option=
  plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
  for plugin in $plugin_names; do
-@@ -6716,8 +6968,10 @@ for plugin in $plugin_names; do
+@@ -6721,8 +6973,10 @@ for plugin in $plugin_names; do
  done
  
  if test -n "$ac_tool_prefix"; then
@@ -13471,7 +13471,7 @@ index dd770216b61..e8c5bc61d24 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_AR+:} false; then :
-@@ -6733,7 +6987,7 @@ do
+@@ -6738,7 +6992,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -13480,7 +13480,7 @@ index dd770216b61..e8c5bc61d24 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6753,11 +7007,15 @@ $as_echo "no" >&6; }
+@@ -6758,11 +7012,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -13499,7 +13499,7 @@ index dd770216b61..e8c5bc61d24 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_ac_ct_AR+:} false; then :
-@@ -6773,7 +7031,7 @@ do
+@@ -6778,7 +7036,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -13508,7 +13508,7 @@ index dd770216b61..e8c5bc61d24 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6792,6 +7050,10 @@ else
+@@ -6797,6 +7055,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -13519,7 +13519,7 @@ index dd770216b61..e8c5bc61d24 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6803,29 +7065,81 @@ ac_tool_warned=yes ;;
+@@ -6808,29 +7070,81 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -13616,7 +13616,7 @@ index dd770216b61..e8c5bc61d24 100755
  
  
  
-@@ -7172,8 +7486,8 @@ esac
+@@ -7177,8 +7491,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -13627,7 +13627,7 @@ index dd770216b61..e8c5bc61d24 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -7209,6 +7523,7 @@ for ac_symprfx in "" "_"; do
+@@ -7214,6 +7528,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -13635,7 +13635,7 @@ index dd770216b61..e8c5bc61d24 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -7250,6 +7565,18 @@ _LT_EOF
+@@ -7255,6 +7570,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -13654,7 +13654,7 @@ index dd770216b61..e8c5bc61d24 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -7261,7 +7588,7 @@ _LT_EOF
+@@ -7266,7 +7593,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -13663,7 +13663,7 @@ index dd770216b61..e8c5bc61d24 100755
    const char *name;
    void       *address;
  }
-@@ -7287,8 +7614,8 @@ static const void *lt_preloaded_setup() {
+@@ -7292,8 +7619,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -13674,7 +13674,7 @@ index dd770216b61..e8c5bc61d24 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -7298,8 +7625,8 @@ _LT_EOF
+@@ -7303,8 +7630,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -13685,7 +13685,7 @@ index dd770216b61..e8c5bc61d24 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7336,6 +7663,27 @@ else
+@@ -7341,6 +7668,27 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -13713,7 +13713,7 @@ index dd770216b61..e8c5bc61d24 100755
  
  
  
-@@ -7348,10 +7696,38 @@ fi
+@@ -7353,10 +7701,38 @@ fi
  
  
  
@@ -13752,7 +13752,7 @@ index dd770216b61..e8c5bc61d24 100755
  
  
  
-@@ -7563,6 +7939,123 @@ esac
+@@ -7568,6 +7944,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -13876,7 +13876,7 @@ index dd770216b61..e8c5bc61d24 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -8126,6 +8619,8 @@ _LT_EOF
+@@ -8131,6 +8624,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -13885,7 +13885,7 @@ index dd770216b61..e8c5bc61d24 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -8196,6 +8691,16 @@ done
+@@ -8201,6 +8696,16 @@ done
  
  
  
@@ -13902,7 +13902,7 @@ index dd770216b61..e8c5bc61d24 100755
  
  
  # Set options
-@@ -8711,8 +9216,6 @@ fi
+@@ -8716,8 +9221,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -13911,7 +13911,7 @@ index dd770216b61..e8c5bc61d24 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8878,6 +9381,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8883,6 +9386,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -13924,7 +13924,7 @@ index dd770216b61..e8c5bc61d24 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8940,7 +9449,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8945,7 +9454,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -13933,7 +13933,7 @@ index dd770216b61..e8c5bc61d24 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8997,13 +9506,17 @@ case $host_os in
+@@ -9002,13 +9511,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -13957,7 +13957,7 @@ index dd770216b61..e8c5bc61d24 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -9064,6 +9577,11 @@ fi
+@@ -9069,6 +9582,11 @@ fi
  
  
  
@@ -13969,7 +13969,7 @@ index dd770216b61..e8c5bc61d24 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -9414,7 +9932,8 @@ _LT_EOF
+@@ -9419,7 +9937,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -13979,7 +13979,7 @@ index dd770216b61..e8c5bc61d24 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -9513,12 +10032,12 @@ _LT_EOF
+@@ -9518,12 +10037,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -13994,7 +13994,7 @@ index dd770216b61..e8c5bc61d24 100755
  	  fi
  	  ;;
  	esac
-@@ -9532,8 +10051,8 @@ _LT_EOF
+@@ -9537,8 +10056,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -14005,7 +14005,7 @@ index dd770216b61..e8c5bc61d24 100755
        fi
        ;;
  
-@@ -9551,8 +10070,8 @@ _LT_EOF
+@@ -9556,8 +10075,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -14016,7 +14016,7 @@ index dd770216b61..e8c5bc61d24 100755
        else
  	ld_shlibs=no
        fi
-@@ -9598,8 +10117,8 @@ _LT_EOF
+@@ -9603,8 +10122,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -14027,7 +14027,7 @@ index dd770216b61..e8c5bc61d24 100755
        else
  	ld_shlibs=no
        fi
-@@ -9729,7 +10248,13 @@ _LT_EOF
+@@ -9734,7 +10253,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -14042,7 +14042,7 @@ index dd770216b61..e8c5bc61d24 100755
  /* end confdefs.h.  */
  
  int
-@@ -9742,22 +10267,29 @@ main ()
+@@ -9747,22 +10272,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -14085,7 +14085,7 @@ index dd770216b61..e8c5bc61d24 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9769,7 +10301,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9774,7 +10306,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -14100,7 +14100,7 @@ index dd770216b61..e8c5bc61d24 100755
  /* end confdefs.h.  */
  
  int
-@@ -9782,22 +10320,29 @@ main ()
+@@ -9787,22 +10325,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -14143,7 +14143,7 @@ index dd770216b61..e8c5bc61d24 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9842,20 +10387,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9847,20 +10392,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -14221,7 +14221,7 @@ index dd770216b61..e8c5bc61d24 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9916,7 +10504,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9921,7 +10509,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -14230,7 +14230,7 @@ index dd770216b61..e8c5bc61d24 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9924,7 +10512,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9929,7 +10517,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -14239,7 +14239,7 @@ index dd770216b61..e8c5bc61d24 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9940,7 +10528,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9945,7 +10533,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -14248,7 +14248,7 @@ index dd770216b61..e8c5bc61d24 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9964,10 +10552,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9969,10 +10557,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -14261,7 +14261,7 @@ index dd770216b61..e8c5bc61d24 100755
  	  ;;
  	esac
        else
-@@ -10046,23 +10634,36 @@ fi
+@@ -10051,23 +10639,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -14306,7 +14306,7 @@ index dd770216b61..e8c5bc61d24 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -10147,7 +10748,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10152,7 +10753,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -14315,7 +14315,7 @@ index dd770216b61..e8c5bc61d24 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -10166,9 +10767,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10171,9 +10772,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -14327,7 +14327,7 @@ index dd770216b61..e8c5bc61d24 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10744,8 +11345,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10749,8 +11350,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -14339,7 +14339,7 @@ index dd770216b61..e8c5bc61d24 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10778,13 +11380,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10783,13 +11385,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -14412,16 +14412,16 @@ index dd770216b61..e8c5bc61d24 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -11686,7 +12346,7 @@ else
+@@ -11691,7 +12351,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11686 "configure"
+-#line 11691 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11730,10 +12390,10 @@ else
+@@ -11735,10 +12395,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -14434,16 +14434,16 @@ index dd770216b61..e8c5bc61d24 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11792,7 +12452,7 @@ else
+@@ -11797,7 +12457,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11792 "configure"
+-#line 11797 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11836,10 +12496,10 @@ else
+@@ -11841,10 +12501,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -14456,7 +14456,7 @@ index dd770216b61..e8c5bc61d24 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -12231,6 +12891,7 @@ $RM -r conftest*
+@@ -12236,6 +12896,7 @@ $RM -r conftest*
  
    # Allow CC to be a program name with arguments.
    lt_save_CC=$CC
@@ -14464,7 +14464,7 @@ index dd770216b61..e8c5bc61d24 100755
    lt_save_LD=$LD
    lt_save_GCC=$GCC
    GCC=$GXX
-@@ -12248,6 +12909,7 @@ $RM -r conftest*
+@@ -12253,6 +12914,7 @@ $RM -r conftest*
    fi
    test -z "${LDCXX+set}" || LD=$LDCXX
    CC=${CXX-"c++"}
@@ -14472,7 +14472,7 @@ index dd770216b61..e8c5bc61d24 100755
    compiler=$CC
    compiler_CXX=$CC
    for cc_temp in $compiler""; do
-@@ -12530,7 +13192,13 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
+@@ -12535,7 +13197,13 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
            allow_undefined_flag_CXX='-berok'
            # Determine the default libpath from the value encoded in an empty
            # executable.
@@ -14487,7 +14487,7 @@ index dd770216b61..e8c5bc61d24 100755
  /* end confdefs.h.  */
  
  int
-@@ -12543,22 +13211,29 @@ main ()
+@@ -12548,22 +13216,29 @@ main ()
  _ACEOF
  if ac_fn_cxx_try_link "$LINENO"; then :
  
@@ -14530,7 +14530,7 @@ index dd770216b61..e8c5bc61d24 100755
  
            hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
  
-@@ -12571,7 +13246,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12576,7 +13251,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
            else
  	    # Determine the default libpath from the value encoded in an
  	    # empty executable.
@@ -14545,7 +14545,7 @@ index dd770216b61..e8c5bc61d24 100755
  /* end confdefs.h.  */
  
  int
-@@ -12584,22 +13265,29 @@ main ()
+@@ -12589,22 +13270,29 @@ main ()
  _ACEOF
  if ac_fn_cxx_try_link "$LINENO"; then :
  
@@ -14588,7 +14588,7 @@ index dd770216b61..e8c5bc61d24 100755
  
  	    hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
  	    # Warning - without using the other run time loading flags,
-@@ -12642,29 +13330,75 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12647,29 +13335,75 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
          ;;
  
        cygwin* | mingw* | pw32* | cegcc*)
@@ -14687,7 +14687,7 @@ index dd770216b61..e8c5bc61d24 100755
        darwin* | rhapsody*)
  
  
-@@ -12770,7 +13504,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12775,7 +13509,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
              ;;
            *)
              if test "$GXX" = yes; then
@@ -14696,7 +14696,7 @@ index dd770216b61..e8c5bc61d24 100755
              else
                # FIXME: insert proper C++ library support
                ld_shlibs_CXX=no
-@@ -12841,10 +13575,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12846,10 +13580,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	            archive_cmds_CXX='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
  	            ;;
  	          ia64*)
@@ -14709,7 +14709,7 @@ index dd770216b61..e8c5bc61d24 100755
  	            ;;
  	        esac
  	      fi
-@@ -12885,9 +13619,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12890,9 +13624,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
            *)
  	    if test "$GXX" = yes; then
  	      if test "$with_gnu_ld" = no; then
@@ -14721,7 +14721,7 @@ index dd770216b61..e8c5bc61d24 100755
  	      fi
  	    fi
  	    link_all_deplibs_CXX=yes
-@@ -13165,7 +13899,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13170,7 +13904,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	          archive_cmds_CXX='$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
  		  ;;
  	        *)
@@ -14730,7 +14730,7 @@ index dd770216b61..e8c5bc61d24 100755
  		  ;;
  	      esac
  
-@@ -13211,7 +13945,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13216,7 +13950,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
        solaris*)
          case $cc_basename in
@@ -14739,7 +14739,7 @@ index dd770216b61..e8c5bc61d24 100755
  	    # Sun C++ 4.2, 5.x and Centerline C++
              archive_cmds_need_lc_CXX=yes
  	    no_undefined_flag_CXX=' -zdefs'
-@@ -13252,9 +13986,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13257,9 +13991,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	    if test "$GXX" = yes && test "$with_gnu_ld" = no; then
  	      no_undefined_flag_CXX=' ${wl}-z ${wl}defs'
  	      if $CC --version | $GREP -v '^2\.7' > /dev/null; then
@@ -14751,7 +14751,7 @@ index dd770216b61..e8c5bc61d24 100755
  
  	        # Commands to make compiler produce verbose output that lists
  	        # what "hidden" libraries, object files and flags are used when
-@@ -13390,6 +14124,13 @@ private:
+@@ -13395,6 +14129,13 @@ private:
  };
  _LT_EOF
  
@@ -14765,7 +14765,7 @@ index dd770216b61..e8c5bc61d24 100755
  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
    (eval $ac_compile) 2>&5
    ac_status=$?
-@@ -13403,7 +14144,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -13408,7 +14149,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
    pre_test_object_deps_done=no
  
    for p in `eval "$output_verbose_link_cmd"`; do
@@ -14774,7 +14774,7 @@ index dd770216b61..e8c5bc61d24 100755
  
      -L* | -R* | -l*)
         # Some compilers place space between "-{L,R}" and the path.
-@@ -13412,13 +14153,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -13417,13 +14158,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
            test $p = "-R"; then
  	 prev=$p
  	 continue
@@ -14801,7 +14801,7 @@ index dd770216b61..e8c5bc61d24 100755
  	   # Internal compiler library paths should come after those
  	   # provided the user.  The postdeps already come after the
  	   # user supplied libs so there is no need to process them.
-@@ -13438,8 +14188,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -13443,8 +14193,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
  	   postdeps_CXX="${postdeps_CXX} ${prev}${p}"
  	 fi
         fi
@@ -14812,7 +14812,7 @@ index dd770216b61..e8c5bc61d24 100755
      *.$objext)
         # This assumes that the test object file only shows up
         # once in the compiler output.
-@@ -13475,6 +14227,7 @@ else
+@@ -13480,6 +14232,7 @@ else
  fi
  
  $RM -f confest.$objext
@@ -14820,7 +14820,7 @@ index dd770216b61..e8c5bc61d24 100755
  
  # PORTME: override above test on systems where it is broken
  case $host_os in
-@@ -13510,7 +14263,7 @@ linux*)
+@@ -13515,7 +14268,7 @@ linux*)
  
  solaris*)
    case $cc_basename in
@@ -14829,7 +14829,7 @@ index dd770216b61..e8c5bc61d24 100755
      # The more standards-conforming stlport4 library is
      # incompatible with the Cstd library. Avoid specifying
      # it if it's in CXXFLAGS. Ignore libCrun as
-@@ -13575,8 +14328,6 @@ fi
+@@ -13580,8 +14333,6 @@ fi
  lt_prog_compiler_pic_CXX=
  lt_prog_compiler_static_CXX=
  
@@ -14838,7 +14838,7 @@ index dd770216b61..e8c5bc61d24 100755
  
    # C++ specific cases for pic, static, wl, etc.
    if test "$GXX" = yes; then
-@@ -13681,6 +14432,11 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -13686,6 +14437,11 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	  ;;
  	esac
  	;;
@@ -14850,7 +14850,7 @@ index dd770216b61..e8c5bc61d24 100755
        dgux*)
  	case $cc_basename in
  	  ec++*)
-@@ -13833,7 +14589,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -13838,7 +14594,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	;;
        solaris*)
  	case $cc_basename in
@@ -14859,7 +14859,7 @@ index dd770216b61..e8c5bc61d24 100755
  	    # Sun C++ 4.2, 5.x and Centerline C++
  	    lt_prog_compiler_pic_CXX='-KPIC'
  	    lt_prog_compiler_static_CXX='-Bstatic'
-@@ -13898,10 +14654,17 @@ case $host_os in
+@@ -13903,10 +14659,17 @@ case $host_os in
      lt_prog_compiler_pic_CXX="$lt_prog_compiler_pic_CXX -DPIC"
      ;;
  esac
@@ -14880,7 +14880,7 @@ index dd770216b61..e8c5bc61d24 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -13959,6 +14722,8 @@ fi
+@@ -13964,6 +14727,8 @@ fi
  
  
  
@@ -14889,7 +14889,7 @@ index dd770216b61..e8c5bc61d24 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -14136,6 +14901,7 @@ fi
+@@ -14141,6 +14906,7 @@ fi
  $as_echo_n "checking whether the $compiler linker ($LD) supports shared libraries... " >&6; }
  
    export_symbols_cmds_CXX='$NM $libobjs $convenience | $global_symbol_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
@@ -14897,7 +14897,7 @@ index dd770216b61..e8c5bc61d24 100755
    case $host_os in
    aix[4-9]*)
      # If we're using GNU nm, then we don't want the "-C" option.
-@@ -14150,15 +14916,20 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
+@@ -14155,15 +14921,20 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
      ;;
    pw32*)
      export_symbols_cmds_CXX="$ltdll_cmds"
@@ -14923,7 +14923,7 @@ index dd770216b61..e8c5bc61d24 100755
  
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ld_shlibs_CXX" >&5
  $as_echo "$ld_shlibs_CXX" >&6; }
-@@ -14421,8 +15192,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -14426,8 +15197,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -14935,7 +14935,7 @@ index dd770216b61..e8c5bc61d24 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -14454,13 +15226,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -14459,13 +15231,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -15008,7 +15008,7 @@ index dd770216b61..e8c5bc61d24 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -15024,6 +15854,7 @@ fi
+@@ -15029,6 +15859,7 @@ fi
    fi # test -n "$compiler"
  
    CC=$lt_save_CC
@@ -15016,7 +15016,7 @@ index dd770216b61..e8c5bc61d24 100755
    LDCXX=$LD
    LD=$lt_save_LD
    GCC=$lt_save_GCC
-@@ -20335,13 +21166,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -20389,13 +21220,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -15037,7 +15037,7 @@ index dd770216b61..e8c5bc61d24 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -20356,14 +21194,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -20410,14 +21248,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -15056,7 +15056,7 @@ index dd770216b61..e8c5bc61d24 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -20396,12 +21237,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -20450,12 +21291,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -15070,7 +15070,7 @@ index dd770216b61..e8c5bc61d24 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -20440,8 +21281,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archive_cmds_CXX" | $SED "$delay_single_quote
+@@ -20494,8 +21335,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archive_cmds_CXX" | $SED "$delay_single_quote
  compiler_CXX='`$ECHO "$compiler_CXX" | $SED "$delay_single_quote_subst"`'
  GCC_CXX='`$ECHO "$GCC_CXX" | $SED "$delay_single_quote_subst"`'
  lt_prog_compiler_no_builtin_flag_CXX='`$ECHO "$lt_prog_compiler_no_builtin_flag_CXX" | $SED "$delay_single_quote_subst"`'
@@ -15080,7 +15080,7 @@ index dd770216b61..e8c5bc61d24 100755
  lt_prog_compiler_static_CXX='`$ECHO "$lt_prog_compiler_static_CXX" | $SED "$delay_single_quote_subst"`'
  lt_cv_prog_compiler_c_o_CXX='`$ECHO "$lt_cv_prog_compiler_c_o_CXX" | $SED "$delay_single_quote_subst"`'
  archive_cmds_need_lc_CXX='`$ECHO "$archive_cmds_need_lc_CXX" | $SED "$delay_single_quote_subst"`'
-@@ -20468,12 +21309,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$hardcode_shlibpath_var_CXX" | $SED "$delay_
+@@ -20522,12 +21363,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$hardcode_shlibpath_var_CXX" | $SED "$delay_
  hardcode_automatic_CXX='`$ECHO "$hardcode_automatic_CXX" | $SED "$delay_single_quote_subst"`'
  inherit_rpath_CXX='`$ECHO "$inherit_rpath_CXX" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs_CXX='`$ECHO "$link_all_deplibs_CXX" | $SED "$delay_single_quote_subst"`'
@@ -15094,7 +15094,7 @@ index dd770216b61..e8c5bc61d24 100755
  file_list_spec_CXX='`$ECHO "$file_list_spec_CXX" | $SED "$delay_single_quote_subst"`'
  hardcode_action_CXX='`$ECHO "$hardcode_action_CXX" | $SED "$delay_single_quote_subst"`'
  compiler_lib_search_dirs_CXX='`$ECHO "$compiler_lib_search_dirs_CXX" | $SED "$delay_single_quote_subst"`'
-@@ -20511,8 +21352,13 @@ reload_flag \
+@@ -20565,8 +21406,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -15108,7 +15108,7 @@ index dd770216b61..e8c5bc61d24 100755
  STRIP \
  RANLIB \
  CC \
-@@ -20522,12 +21368,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -20576,12 +21422,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -15124,7 +15124,7 @@ index dd770216b61..e8c5bc61d24 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -20543,7 +21391,6 @@ no_undefined_flag \
+@@ -20597,7 +21445,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -15132,7 +15132,7 @@ index dd770216b61..e8c5bc61d24 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -20565,8 +21412,8 @@ LD_CXX \
+@@ -20619,8 +21466,8 @@ LD_CXX \
  reload_flag_CXX \
  compiler_CXX \
  lt_prog_compiler_no_builtin_flag_CXX \
@@ -15142,7 +15142,7 @@ index dd770216b61..e8c5bc61d24 100755
  lt_prog_compiler_static_CXX \
  lt_cv_prog_compiler_c_o_CXX \
  export_dynamic_flag_spec_CXX \
-@@ -20578,7 +21425,6 @@ no_undefined_flag_CXX \
+@@ -20632,7 +21479,6 @@ no_undefined_flag_CXX \
  hardcode_libdir_flag_spec_CXX \
  hardcode_libdir_flag_spec_ld_CXX \
  hardcode_libdir_separator_CXX \
@@ -15150,7 +15150,7 @@ index dd770216b61..e8c5bc61d24 100755
  exclude_expsyms_CXX \
  include_expsyms_CXX \
  file_list_spec_CXX \
-@@ -20612,6 +21458,7 @@ module_cmds \
+@@ -20666,6 +21512,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -15158,7 +15158,7 @@ index dd770216b61..e8c5bc61d24 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -20626,7 +21473,8 @@ archive_expsym_cmds_CXX \
+@@ -20680,7 +21527,8 @@ archive_expsym_cmds_CXX \
  module_cmds_CXX \
  module_expsym_cmds_CXX \
  export_symbols_cmds_CXX \
@@ -15168,7 +15168,7 @@ index dd770216b61..e8c5bc61d24 100755
      case \`eval \\\\\$ECHO \\\\""\\\\\$\$var"\\\\"\` in
      *[\\\\\\\`\\"\\\$]*)
        eval "lt_\$var=\\\\\\"\\\`\\\$ECHO \\"\\\$\$var\\" | \\\$SED -e \\"\\\$double_quote_subst\\" -e \\"\\\$sed_quote_subst\\" -e \\"\\\$delay_variable_subst\\"\\\`\\\\\\""
-@@ -21399,7 +22247,8 @@ $as_echo X"$file" |
+@@ -21453,7 +22301,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -15178,7 +15178,7 @@ index dd770216b61..e8c5bc61d24 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -21502,19 +22351,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -21556,19 +22405,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -15222,7 +15222,7 @@ index dd770216b61..e8c5bc61d24 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -21544,6 +22416,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -21598,6 +22470,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -15235,7 +15235,7 @@ index dd770216b61..e8c5bc61d24 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -21553,6 +22431,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -21607,6 +22485,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -15245,7 +15245,7 @@ index dd770216b61..e8c5bc61d24 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -21667,12 +22548,12 @@ with_gcc=$GCC
+@@ -21721,12 +22602,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -15261,7 +15261,7 @@ index dd770216b61..e8c5bc61d24 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -21759,9 +22640,6 @@ inherit_rpath=$inherit_rpath
+@@ -21813,9 +22694,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -15271,7 +15271,7 @@ index dd770216b61..e8c5bc61d24 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -21777,6 +22655,9 @@ include_expsyms=$lt_include_expsyms
+@@ -21831,6 +22709,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -15281,7 +15281,7 @@ index dd770216b61..e8c5bc61d24 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -21823,210 +22704,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -21877,210 +22758,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -15655,7 +15655,7 @@ index dd770216b61..e8c5bc61d24 100755
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-@@ -22054,12 +22894,12 @@ with_gcc=$GCC_CXX
+@@ -22108,12 +22948,12 @@ with_gcc=$GCC_CXX
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag_CXX
  
@@ -15671,7 +15671,7 @@ index dd770216b61..e8c5bc61d24 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static_CXX
  
-@@ -22146,9 +22986,6 @@ inherit_rpath=$inherit_rpath_CXX
+@@ -22200,9 +23040,6 @@ inherit_rpath=$inherit_rpath_CXX
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs_CXX
  
@@ -15681,7 +15681,7 @@ index dd770216b61..e8c5bc61d24 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols_CXX
  
-@@ -22164,6 +23001,9 @@ include_expsyms=$lt_include_expsyms_CXX
+@@ -22218,6 +23055,9 @@ include_expsyms=$lt_include_expsyms_CXX
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds_CXX
  
@@ -18248,7 +18248,7 @@ index 4ab612dc780..68f6b8566e9 100755
    chmod +x "$ofile"
  
 diff --git a/libctf/Makefile.in b/libctf/Makefile.in
-index 54f5daa79ee..ce780a7ccde 100644
+index 5d9587766dc..146b7a71685 100644
 --- a/libctf/Makefile.in
 +++ b/libctf/Makefile.in
 @@ -442,6 +442,7 @@ CYGPATH_W = @CYGPATH_W@
@@ -20179,7 +20179,7 @@ index 7466d56a18b..0325e438a47 100755
    chmod +x "$ofile"
  
 diff --git a/libsframe/Makefile.in b/libsframe/Makefile.in
-index 8915321da78..13c725a698d 100644
+index 13f4c26e2f1..e6e05b80d0e 100644
 --- a/libsframe/Makefile.in
 +++ b/libsframe/Makefile.in
 @@ -1,7 +1,7 @@
@@ -25252,7 +25252,7 @@ index e36fdd3c0e2..4acf9d67956 100644
 +         [0], [convert $build files to toolchain format])dnl
 +])# _LT_PATH_CONVERSION_FUNCTIONS
 diff --git a/ltmain.sh b/ltmain.sh
-index 70990740b6c..7f7104ffc82 100644
+index 1a710177fb2..09693d7b99b 100644
 --- a/ltmain.sh
 +++ b/ltmain.sh
 @@ -1,10 +1,9 @@
@@ -28462,39 +28462,19 @@ index 70990740b6c..7f7104ffc82 100644
  	done
  	IFS="$save_ifs"
  	func_stripname ' ' '' "$arg"
-@@ -4968,24 +5832,27 @@ func_mode_link ()
- 	arg="$func_quote_for_eval_result"
- 	;;
- 
--      # -64, -mips[0-9] enable 64-bit mode on the SGI compiler
--      # -r[0-9][0-9]* specifies the processor on the SGI compiler
--      # -xarch=*, -xtarget=* enable 64-bit mode on the Sun compiler
--      # +DA*, +DD* enable 64-bit mode on the HP compiler
--      # -q* pass through compiler args for the IBM compiler
--      # -m*, -t[45]*, -txscale* pass through architecture-specific
--      # compiler args for GCC
--      # -F/path gives path to uninstalled frameworks, gcc on darwin
--      # -p, -pg, --coverage, -fprofile-* pass through profiling flag for GCC
--      # @file GCC response files
--      # -tp=* Portland pgcc target processor selection
-+      # Flags to be passed through unchanged, with rationale:
-+      # -64, -mips[0-9]      enable 64-bit mode for the SGI compiler
-+      # -r[0-9][0-9]*        specify processor for the SGI compiler
-+      # -xarch=*, -xtarget=* enable 64-bit mode for the Sun compiler
-+      # +DA*, +DD*           enable 64-bit mode for the HP compiler
-+      # -q*                  compiler args for the IBM compiler
-+      # -m*, -t[45]*, -txscale* architecture-specific flags for GCC
-+      # -F/path              path to uninstalled frameworks, gcc on darwin
-+      # -p, -pg, --coverage, -fprofile-*  profiling flags for GCC
-+      # @file                GCC response files
-+      # -tp=*                Portland pgcc target processor selection
+@@ -4995,8 +5859,10 @@ func_mode_link ()
+       # -f{file|debug|macro|profile}-prefix-map=* needed for lto linking
+       # -Wa,*                Pass flags directly to the assembler
+       # -Werror, -Werror=*   Report (specified) warnings as errors
 +      # --sysroot=*          for sysroot support
 +      # -O*, -flto*, -fwhopr*, -fuse-linker-plugin GCC link-time optimization
        -64|-mips[0-9]|-r[0-9][0-9]*|-xarch=*|-xtarget=*|+DA*|+DD*|-q*|-m*| \
--      -t[45]*|-txscale*|-p|-pg|--coverage|-fprofile-*|-F*|@*|-tp=*)
+-      -t[45]*|-txscale*|-p|-pg|--coverage|-fprofile-*|-F*|@*|-tp=*| \
 +      -t[45]*|-txscale*|-p|-pg|--coverage|-fprofile-*|-F*|@*|-tp=*|--sysroot=*| \
-+      -O*|-flto*|-fwhopr*|-fuse-linker-plugin)
-         func_quote_for_eval "$arg"
+       -O*|-g*|-flto*|-fwhopr*|-fuse-linker-plugin|-fstack-protector*| \
+       -stdlib=*|-rtlib=*|--unwindlib=*| \
+       -specs=*|-fsanitize=*|-fno-sanitize*|-shared-libsan|-static-libsan| \
+@@ -5007,7 +5873,7 @@ func_mode_link ()
  	arg="$func_quote_for_eval_result"
          func_append compile_command " $arg"
          func_append finalize_command " $arg"
@@ -28503,7 +28483,7 @@ index 70990740b6c..7f7104ffc82 100644
          continue
          ;;
  
-@@ -4997,7 +5864,7 @@ func_mode_link ()
+@@ -5019,7 +5885,7 @@ func_mode_link ()
  
        *.$objext)
  	# A standard object.
@@ -28512,7 +28492,7 @@ index 70990740b6c..7f7104ffc82 100644
  	;;
  
        *.lo)
-@@ -5028,7 +5895,7 @@ func_mode_link ()
+@@ -5050,7 +5916,7 @@ func_mode_link ()
  
  	    if test "$prev" = dlfiles; then
  	      if test "$build_libtool_libs" = yes && test "$dlopen_support" = yes; then
@@ -28521,7 +28501,7 @@ index 70990740b6c..7f7104ffc82 100644
  		prev=
  		continue
  	      else
-@@ -5040,7 +5907,7 @@ func_mode_link ()
+@@ -5062,7 +5928,7 @@ func_mode_link ()
  	    # CHECK ME:  I think I busted this.  -Ossama
  	    if test "$prev" = dlprefiles; then
  	      # Preload the old-style object.
@@ -28530,7 +28510,7 @@ index 70990740b6c..7f7104ffc82 100644
  	      prev=
  	    fi
  
-@@ -5085,24 +5952,25 @@ func_mode_link ()
+@@ -5107,24 +5973,25 @@ func_mode_link ()
  
        *.$libext)
  	# An archive.
@@ -28561,7 +28541,7 @@ index 70990740b6c..7f7104ffc82 100644
  	fi
  	continue
  	;;
-@@ -5127,7 +5995,7 @@ func_mode_link ()
+@@ -5149,7 +6016,7 @@ func_mode_link ()
        func_fatal_help "the \`$prevarg' option requires an argument"
  
      if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then
@@ -28570,7 +28550,7 @@ index 70990740b6c..7f7104ffc82 100644
        func_append compile_command " $arg"
        func_append finalize_command " $arg"
      fi
-@@ -5144,11 +6012,13 @@ func_mode_link ()
+@@ -5166,11 +6033,13 @@ func_mode_link ()
      else
        shlib_search_path=
      fi
@@ -28586,7 +28566,7 @@ index 70990740b6c..7f7104ffc82 100644
      # Create the object directory.
      func_mkdir_p "$output_objdir"
  
-@@ -5169,12 +6039,12 @@ func_mode_link ()
+@@ -5191,12 +6060,12 @@ func_mode_link ()
      # Find all interdependent deplibs by searching for libraries
      # that are linked more than once (e.g. -la -lb -la)
      for deplib in $deplibs; do
@@ -28602,7 +28582,7 @@ index 70990740b6c..7f7104ffc82 100644
      done
  
      if test "$linkmode" = lib; then
-@@ -5187,9 +6057,9 @@ func_mode_link ()
+@@ -5209,9 +6078,9 @@ func_mode_link ()
        if $opt_duplicate_compiler_generated_deps; then
  	for pre_post_dep in $predeps $postdeps; do
  	  case "$pre_post_deps " in
@@ -28614,7 +28594,7 @@ index 70990740b6c..7f7104ffc82 100644
  	done
        fi
        pre_post_deps=
-@@ -5256,8 +6126,9 @@ func_mode_link ()
+@@ -5278,8 +6147,9 @@ func_mode_link ()
  	for lib in $dlprefiles; do
  	  # Ignore non-libtool-libs
  	  dependency_libs=
@@ -28625,7 +28605,7 @@ index 70990740b6c..7f7104ffc82 100644
  	  esac
  
  	  # Collect preopened libtool deplibs, except any this library
-@@ -5267,7 +6138,7 @@ func_mode_link ()
+@@ -5289,7 +6159,7 @@ func_mode_link ()
              deplib_base=$func_basename_result
  	    case " $weak_libs " in
  	    *" $deplib_base "*) ;;
@@ -28634,7 +28614,7 @@ index 70990740b6c..7f7104ffc82 100644
  	    esac
  	  done
  	done
-@@ -5288,11 +6159,11 @@ func_mode_link ()
+@@ -5310,11 +6180,11 @@ func_mode_link ()
  	    compile_deplibs="$deplib $compile_deplibs"
  	    finalize_deplibs="$deplib $finalize_deplibs"
  	  else
@@ -28648,7 +28628,7 @@ index 70990740b6c..7f7104ffc82 100644
  		esac
  	    fi
  	  fi
-@@ -5377,7 +6248,7 @@ func_mode_link ()
+@@ -5399,7 +6269,7 @@ func_mode_link ()
  	    if test "$linkmode" = lib ; then
  		case "$new_inherited_linker_flags " in
  		    *" $deplib "*) ;;
@@ -28657,7 +28637,7 @@ index 70990740b6c..7f7104ffc82 100644
  		esac
  	    fi
  	  fi
-@@ -5390,7 +6261,8 @@ func_mode_link ()
+@@ -5412,7 +6282,8 @@ func_mode_link ()
  	    test "$pass" = conv && continue
  	    newdependency_libs="$deplib $newdependency_libs"
  	    func_stripname '-L' '' "$deplib"
@@ -28667,7 +28647,7 @@ index 70990740b6c..7f7104ffc82 100644
  	    ;;
  	  prog)
  	    if test "$pass" = conv; then
-@@ -5404,7 +6276,8 @@ func_mode_link ()
+@@ -5426,7 +6297,8 @@ func_mode_link ()
  	      finalize_deplibs="$deplib $finalize_deplibs"
  	    fi
  	    func_stripname '-L' '' "$deplib"
@@ -28677,7 +28657,7 @@ index 70990740b6c..7f7104ffc82 100644
  	    ;;
  	  *)
  	    func_warning "\`-L' is ignored for archives/objects"
-@@ -5415,17 +6288,21 @@ func_mode_link ()
+@@ -5437,17 +6309,21 @@ func_mode_link ()
  	-R*)
  	  if test "$pass" = link; then
  	    func_stripname '-R' '' "$deplib"
@@ -28702,7 +28682,7 @@ index 70990740b6c..7f7104ffc82 100644
  	*.$libext)
  	  if test "$pass" = conv; then
  	    deplibs="$deplib $deplibs"
-@@ -5488,11 +6365,11 @@ func_mode_link ()
+@@ -5510,11 +6386,11 @@ func_mode_link ()
  	    if test "$pass" = dlpreopen || test "$dlopen_support" != yes || test "$build_libtool_libs" = no; then
  	      # If there is no dlopen support or we're linking statically,
  	      # we need to preload.
@@ -28716,7 +28696,7 @@ index 70990740b6c..7f7104ffc82 100644
  	    fi
  	  fi
  	  continue
-@@ -5538,7 +6415,7 @@ func_mode_link ()
+@@ -5560,7 +6436,7 @@ func_mode_link ()
  	  for tmp_inherited_linker_flag in $tmp_inherited_linker_flags; do
  	    case " $new_inherited_linker_flags " in
  	      *" $tmp_inherited_linker_flag "*) ;;
@@ -28725,7 +28705,7 @@ index 70990740b6c..7f7104ffc82 100644
  	    esac
  	  done
  	fi
-@@ -5546,8 +6423,8 @@ func_mode_link ()
+@@ -5568,8 +6444,8 @@ func_mode_link ()
  	if test "$linkmode,$pass" = "lib,link" ||
  	   test "$linkmode,$pass" = "prog,scan" ||
  	   { test "$linkmode" != prog && test "$linkmode" != lib; }; then
@@ -28736,7 +28716,7 @@ index 70990740b6c..7f7104ffc82 100644
  	fi
  
  	if test "$pass" = conv; then
-@@ -5558,20 +6435,20 @@ func_mode_link ()
+@@ -5580,20 +6456,20 @@ func_mode_link ()
  	      func_fatal_error "cannot find name of link library for \`$lib'"
  	    fi
  	    # It is a libtool convenience library, so add in its objects.
@@ -28762,7 +28742,7 @@ index 70990740b6c..7f7104ffc82 100644
  	  done
  	  continue
  	fi # $pass = conv
-@@ -5579,9 +6456,15 @@ func_mode_link ()
+@@ -5601,9 +6477,15 @@ func_mode_link ()
  
  	# Get the name of the library we link against.
  	linklib=
@@ -28781,7 +28761,7 @@ index 70990740b6c..7f7104ffc82 100644
  	if test -z "$linklib"; then
  	  func_fatal_error "cannot find name of link library for \`$lib'"
  	fi
-@@ -5598,9 +6481,9 @@ func_mode_link ()
+@@ -5620,9 +6502,9 @@ func_mode_link ()
  	    # statically, we need to preload.  We also need to preload any
  	    # dependent libraries so libltdl's deplib preloader doesn't
  	    # bomb out in the load deplibs phase.
@@ -28793,7 +28773,7 @@ index 70990740b6c..7f7104ffc82 100644
  	  fi
  	  continue
  	fi # $pass = dlopen
-@@ -5622,14 +6505,14 @@ func_mode_link ()
+@@ -5644,14 +6526,14 @@ func_mode_link ()
  
  	# Find the relevant object directory and library name.
  	if test "X$installed" = Xyes; then
@@ -28811,7 +28791,7 @@ index 70990740b6c..7f7104ffc82 100644
  	  fi
  	  test "X$hardcode_automatic" = Xyes && avoidtemprpath=yes
  	else
-@@ -5637,12 +6520,12 @@ func_mode_link ()
+@@ -5659,12 +6541,12 @@ func_mode_link ()
  	    dir="$ladir"
  	    absdir="$abs_ladir"
  	    # Remove this search path later
@@ -28826,7 +28806,7 @@ index 70990740b6c..7f7104ffc82 100644
  	  fi
  	fi # $installed = yes
  	func_stripname 'lib' '.la' "$laname"
-@@ -5653,20 +6536,46 @@ func_mode_link ()
+@@ -5675,20 +6557,46 @@ func_mode_link ()
  	  if test -z "$libdir" && test "$linkmode" = prog; then
  	    func_fatal_error "only libraries may -dlpreopen a convenience library: \`$lib'"
  	  fi
@@ -28887,7 +28867,7 @@ index 70990740b6c..7f7104ffc82 100644
  	fi # $pass = dlpreopen
  
  	if test -z "$libdir"; then
-@@ -5684,7 +6593,7 @@ func_mode_link ()
+@@ -5706,7 +6614,7 @@ func_mode_link ()
  
  
  	if test "$linkmode" = prog && test "$pass" != link; then
@@ -28896,7 +28876,7 @@ index 70990740b6c..7f7104ffc82 100644
  	  deplibs="$lib $deplibs"
  
  	  linkalldeplibs=no
-@@ -5697,7 +6606,8 @@ func_mode_link ()
+@@ -5719,7 +6627,8 @@ func_mode_link ()
  	  for deplib in $dependency_libs; do
  	    case $deplib in
  	    -L*) func_stripname '-L' '' "$deplib"
@@ -28906,7 +28886,7 @@ index 70990740b6c..7f7104ffc82 100644
  		 ;;
  	    esac
  	    # Need to link against all dependency_libs?
-@@ -5708,12 +6618,12 @@ func_mode_link ()
+@@ -5730,12 +6639,12 @@ func_mode_link ()
  	      # or/and link against static libraries
  	      newdependency_libs="$deplib $newdependency_libs"
  	    fi
@@ -28922,7 +28902,7 @@ index 70990740b6c..7f7104ffc82 100644
  	  done # for deplib
  	  continue
  	fi # $linkmode = prog...
-@@ -5728,7 +6638,7 @@ func_mode_link ()
+@@ -5750,7 +6659,7 @@ func_mode_link ()
  	      # Make sure the rpath contains only unique directories.
  	      case "$temp_rpath:" in
  	      *"$absdir:"*) ;;
@@ -28931,7 +28911,7 @@ index 70990740b6c..7f7104ffc82 100644
  	      esac
  	    fi
  
-@@ -5740,7 +6650,7 @@ func_mode_link ()
+@@ -5762,7 +6671,7 @@ func_mode_link ()
  	    *)
  	      case "$compile_rpath " in
  	      *" $absdir "*) ;;
@@ -28940,7 +28920,7 @@ index 70990740b6c..7f7104ffc82 100644
  	      esac
  	      ;;
  	    esac
-@@ -5749,7 +6659,7 @@ func_mode_link ()
+@@ -5771,7 +6680,7 @@ func_mode_link ()
  	    *)
  	      case "$finalize_rpath " in
  	      *" $libdir "*) ;;
@@ -28949,7 +28929,7 @@ index 70990740b6c..7f7104ffc82 100644
  	      esac
  	      ;;
  	    esac
-@@ -5774,12 +6684,12 @@ func_mode_link ()
+@@ -5796,12 +6705,12 @@ func_mode_link ()
  	  case $host in
  	  *cygwin* | *mingw* | *cegcc*)
  	      # No point in relinking DLLs because paths are not encoded
@@ -28964,7 +28944,7 @@ index 70990740b6c..7f7104ffc82 100644
  	      need_relink=yes
  	    fi
  	    ;;
-@@ -5814,7 +6724,7 @@ func_mode_link ()
+@@ -5836,7 +6745,7 @@ func_mode_link ()
  	    *)
  	      case "$compile_rpath " in
  	      *" $absdir "*) ;;
@@ -28973,7 +28953,7 @@ index 70990740b6c..7f7104ffc82 100644
  	      esac
  	      ;;
  	    esac
-@@ -5823,7 +6733,7 @@ func_mode_link ()
+@@ -5845,7 +6754,7 @@ func_mode_link ()
  	    *)
  	      case "$finalize_rpath " in
  	      *" $libdir "*) ;;
@@ -28982,7 +28962,7 @@ index 70990740b6c..7f7104ffc82 100644
  	      esac
  	      ;;
  	    esac
-@@ -5835,7 +6745,7 @@ func_mode_link ()
+@@ -5857,7 +6766,7 @@ func_mode_link ()
  	    shift
  	    realname="$1"
  	    shift
@@ -28991,7 +28971,7 @@ index 70990740b6c..7f7104ffc82 100644
  	    # use dlname if we got it. it's perfectly good, no?
  	    if test -n "$dlname"; then
  	      soname="$dlname"
-@@ -5848,7 +6758,7 @@ func_mode_link ()
+@@ -5870,7 +6779,7 @@ func_mode_link ()
  		versuffix="-$major"
  		;;
  	      esac
@@ -29000,7 +28980,7 @@ index 70990740b6c..7f7104ffc82 100644
  	    else
  	      soname="$realname"
  	    fi
-@@ -5877,7 +6787,7 @@ func_mode_link ()
+@@ -5899,7 +6808,7 @@ func_mode_link ()
  	    linklib=$newlib
  	  fi # test -n "$old_archive_from_expsyms_cmds"
  
@@ -29009,7 +28989,7 @@ index 70990740b6c..7f7104ffc82 100644
  	    add_shlibpath=
  	    add_dir=
  	    add=
-@@ -5933,7 +6843,7 @@ func_mode_link ()
+@@ -5955,7 +6864,7 @@ func_mode_link ()
  		if test -n "$inst_prefix_dir"; then
  		  case $libdir in
  		    [\\/]*)
@@ -29018,7 +28998,7 @@ index 70990740b6c..7f7104ffc82 100644
  		      ;;
  		  esac
  		fi
-@@ -5955,7 +6865,7 @@ func_mode_link ()
+@@ -5977,7 +6886,7 @@ func_mode_link ()
  	    if test -n "$add_shlibpath"; then
  	      case :$compile_shlibpath: in
  	      *":$add_shlibpath:"*) ;;
@@ -29027,7 +29007,7 @@ index 70990740b6c..7f7104ffc82 100644
  	      esac
  	    fi
  	    if test "$linkmode" = prog; then
-@@ -5969,13 +6879,13 @@ func_mode_link ()
+@@ -5991,13 +6900,13 @@ func_mode_link ()
  		 test "$hardcode_shlibpath_var" = yes; then
  		case :$finalize_shlibpath: in
  		*":$libdir:"*) ;;
@@ -29043,7 +29023,7 @@ index 70990740b6c..7f7104ffc82 100644
  	    add_shlibpath=
  	    add_dir=
  	    add=
-@@ -5989,7 +6899,7 @@ func_mode_link ()
+@@ -6011,7 +6920,7 @@ func_mode_link ()
  	    elif test "$hardcode_shlibpath_var" = yes; then
  	      case :$finalize_shlibpath: in
  	      *":$libdir:"*) ;;
@@ -29052,7 +29032,7 @@ index 70990740b6c..7f7104ffc82 100644
  	      esac
  	      add="-l$name"
  	    elif test "$hardcode_automatic" = yes; then
-@@ -6001,12 +6911,12 @@ func_mode_link ()
+@@ -6023,12 +6932,12 @@ func_mode_link ()
  	      fi
  	    else
  	      # We cannot seem to hardcode it, guess we'll fake it.
@@ -29067,7 +29047,7 @@ index 70990740b6c..7f7104ffc82 100644
  		    ;;
  		esac
  	      fi
-@@ -6083,27 +6993,33 @@ func_mode_link ()
+@@ -6105,27 +7014,33 @@ func_mode_link ()
  	           temp_xrpath=$func_stripname_result
  		   case " $xrpath " in
  		   *" $temp_xrpath "*) ;;
@@ -29107,7 +29087,7 @@ index 70990740b6c..7f7104ffc82 100644
  	  done
  
  	  if test "$link_all_deplibs" != no; then
-@@ -6113,8 +7029,10 @@ func_mode_link ()
+@@ -6135,8 +7050,10 @@ func_mode_link ()
  	      case $deplib in
  	      -L*) path="$deplib" ;;
  	      *.la)
@@ -29119,7 +29099,7 @@ index 70990740b6c..7f7104ffc82 100644
  		# We need an absolute path.
  		case $dir in
  		[\\/]* | [A-Za-z]:[\\/]*) absdir="$dir" ;;
-@@ -6130,7 +7048,7 @@ func_mode_link ()
+@@ -6152,7 +7069,7 @@ func_mode_link ()
  		case $host in
  		*-*-darwin*)
  		  depdepl=
@@ -29128,7 +29108,7 @@ index 70990740b6c..7f7104ffc82 100644
  		  if test -n "$deplibrary_names" ; then
  		    for tmp in $deplibrary_names ; do
  		      depdepl=$tmp
-@@ -6141,8 +7059,8 @@ func_mode_link ()
+@@ -6163,8 +7080,8 @@ func_mode_link ()
                        if test -z "$darwin_install_name"; then
                            darwin_install_name=`${OTOOL64} -L $depdepl  | awk '{if (NR == 2) {print $1;exit}}'`
                        fi
@@ -29139,7 +29119,7 @@ index 70990740b6c..7f7104ffc82 100644
  		      path=
  		    fi
  		  fi
-@@ -6152,7 +7070,7 @@ func_mode_link ()
+@@ -6174,7 +7091,7 @@ func_mode_link ()
  		  ;;
  		esac
  		else
@@ -29148,7 +29128,7 @@ index 70990740b6c..7f7104ffc82 100644
  		  test -z "$libdir" && \
  		    func_fatal_error "\`$deplib' is not a valid libtool archive"
  		  test "$absdir" != "$libdir" && \
-@@ -6192,7 +7110,7 @@ func_mode_link ()
+@@ -6214,7 +7131,7 @@ func_mode_link ()
  	  for dir in $newlib_search_path; do
  	    case "$lib_search_path " in
  	    *" $dir "*) ;;
@@ -29157,7 +29137,7 @@ index 70990740b6c..7f7104ffc82 100644
  	    esac
  	  done
  	  newlib_search_path=
-@@ -6205,7 +7123,7 @@ func_mode_link ()
+@@ -6227,7 +7144,7 @@ func_mode_link ()
  	fi
  	for var in $vars dependency_libs; do
  	  # Add libraries to $var in reverse order
@@ -29166,7 +29146,7 @@ index 70990740b6c..7f7104ffc82 100644
  	  new_libs=
  	  for deplib in $tmp_libs; do
  	    # FIXME: Pedantically, this is the right thing to do, so
-@@ -6250,13 +7168,13 @@ func_mode_link ()
+@@ -6272,13 +7189,13 @@ func_mode_link ()
  	    -L*)
  	      case " $tmp_libs " in
  	      *" $deplib "*) ;;
@@ -29183,7 +29163,7 @@ index 70990740b6c..7f7104ffc82 100644
  	done # for var
        fi
        # Last step: remove runtime libs from dependency_libs
-@@ -6269,7 +7187,7 @@ func_mode_link ()
+@@ -6291,7 +7208,7 @@ func_mode_link ()
  	  ;;
  	esac
  	if test -n "$i" ; then
@@ -29192,7 +29172,7 @@ index 70990740b6c..7f7104ffc82 100644
  	fi
        done
        dependency_libs=$tmp_libs
-@@ -6310,7 +7228,7 @@ func_mode_link ()
+@@ -6332,7 +7249,7 @@ func_mode_link ()
        # Now set the variables for building old libraries.
        build_libtool_libs=no
        oldlibs="$output"
@@ -29201,7 +29181,7 @@ index 70990740b6c..7f7104ffc82 100644
        ;;
  
      lib)
-@@ -6319,8 +7237,8 @@ func_mode_link ()
+@@ -6341,8 +7258,8 @@ func_mode_link ()
        lib*)
  	func_stripname 'lib' '.la' "$outputname"
  	name=$func_stripname_result
@@ -29212,7 +29192,7 @@ index 70990740b6c..7f7104ffc82 100644
  	;;
        *)
  	test "$module" = no && \
-@@ -6330,8 +7248,8 @@ func_mode_link ()
+@@ -6352,8 +7269,8 @@ func_mode_link ()
  	  # Add the "lib" prefix for modules if required
  	  func_stripname '' '.la' "$outputname"
  	  name=$func_stripname_result
@@ -29223,7 +29203,7 @@ index 70990740b6c..7f7104ffc82 100644
  	else
  	  func_stripname '' '.la' "$outputname"
  	  libname=$func_stripname_result
-@@ -6346,7 +7264,7 @@ func_mode_link ()
+@@ -6368,7 +7285,7 @@ func_mode_link ()
  	  echo
  	  $ECHO "*** Warning: Linking the shared library $output against the non-libtool"
  	  $ECHO "*** objects $objs is not portable!"
@@ -29232,7 +29212,7 @@ index 70990740b6c..7f7104ffc82 100644
  	fi
        fi
  
-@@ -6544,7 +7462,7 @@ func_mode_link ()
+@@ -6566,7 +7483,7 @@ func_mode_link ()
  	  done
  
  	  # Make executables depend on our current version.
@@ -29241,7 +29221,7 @@ index 70990740b6c..7f7104ffc82 100644
  	  ;;
  
  	qnx)
-@@ -6612,10 +7530,10 @@ func_mode_link ()
+@@ -6634,10 +7551,10 @@ func_mode_link ()
        fi
  
        func_generate_dlsyms "$libname" "$libname" "yes"
@@ -29254,7 +29234,7 @@ index 70990740b6c..7f7104ffc82 100644
  	# Remove our outputs, but don't remove object files since they
  	# may have been created when compiling PIC objects.
  	removelist=
-@@ -6631,7 +7549,7 @@ func_mode_link ()
+@@ -6653,7 +7570,7 @@ func_mode_link ()
  		   continue
  		 fi
  	       fi
@@ -29263,7 +29243,7 @@ index 70990740b6c..7f7104ffc82 100644
  	       ;;
  	    *) ;;
  	  esac
-@@ -6642,7 +7560,7 @@ func_mode_link ()
+@@ -6664,7 +7581,7 @@ func_mode_link ()
  
        # Now set the variables for building old libraries.
        if test "$build_old_libs" = yes && test "$build_libtool_libs" != convenience ; then
@@ -29272,7 +29252,7 @@ index 70990740b6c..7f7104ffc82 100644
  
  	# Transform .lo files to .o files.
  	oldobjs="$objs "`$ECHO "$libobjs" | $SP2NL | $SED "/\.${libext}$/d; $lo2o" | $NL2SP`
-@@ -6659,10 +7577,11 @@ func_mode_link ()
+@@ -6681,10 +7598,11 @@ func_mode_link ()
  	# If the user specified any rpath flags, then add them.
  	temp_xrpath=
  	for libdir in $xrpath; do
@@ -29286,7 +29266,7 @@ index 70990740b6c..7f7104ffc82 100644
  	  esac
  	done
  	if test "$hardcode_into_libs" != yes || test "$build_old_libs" = yes; then
-@@ -6676,7 +7595,7 @@ func_mode_link ()
+@@ -6698,7 +7616,7 @@ func_mode_link ()
        for lib in $old_dlfiles; do
  	case " $dlprefiles $dlfiles " in
  	*" $lib "*) ;;
@@ -29295,7 +29275,7 @@ index 70990740b6c..7f7104ffc82 100644
  	esac
        done
  
-@@ -6686,7 +7605,7 @@ func_mode_link ()
+@@ -6708,7 +7626,7 @@ func_mode_link ()
        for lib in $old_dlprefiles; do
  	case "$dlprefiles " in
  	*" $lib "*) ;;
@@ -29304,7 +29284,7 @@ index 70990740b6c..7f7104ffc82 100644
  	esac
        done
  
-@@ -6698,7 +7617,7 @@ func_mode_link ()
+@@ -6720,7 +7638,7 @@ func_mode_link ()
  	    ;;
  	  *-*-rhapsody* | *-*-darwin1.[012])
  	    # Rhapsody C library is in the System framework
@@ -29313,7 +29293,7 @@ index 70990740b6c..7f7104ffc82 100644
  	    ;;
  	  *-*-netbsd*)
  	    # Don't link with libc until the a.out ld.so is fixed.
-@@ -6715,7 +7634,7 @@ func_mode_link ()
+@@ -6737,7 +7655,7 @@ func_mode_link ()
  	  *)
  	    # Add libc to deplibs on all other systems if necessary.
  	    if test "$build_libtool_need_lc" = "yes"; then
@@ -29322,7 +29302,7 @@ index 70990740b6c..7f7104ffc82 100644
  	    fi
  	    ;;
  	  esac
-@@ -6764,18 +7683,18 @@ EOF
+@@ -6786,18 +7704,18 @@ EOF
  		if test "X$allow_libtool_libs_with_static_runtimes" = "Xyes" ; then
  		  case " $predeps $postdeps " in
  		  *" $i "*)
@@ -29345,7 +29325,7 @@ index 70990740b6c..7f7104ffc82 100644
  		  else
  		    droppeddeps=yes
  		    echo
-@@ -6789,7 +7708,7 @@ EOF
+@@ -6811,7 +7729,7 @@ EOF
  		fi
  		;;
  	      *)
@@ -29354,7 +29334,7 @@ index 70990740b6c..7f7104ffc82 100644
  		;;
  	      esac
  	    done
-@@ -6807,18 +7726,18 @@ EOF
+@@ -6829,18 +7747,18 @@ EOF
  		  if test "X$allow_libtool_libs_with_static_runtimes" = "Xyes" ; then
  		    case " $predeps $postdeps " in
  		    *" $i "*)
@@ -29377,7 +29357,7 @@ index 70990740b6c..7f7104ffc82 100644
  		    else
  		      droppeddeps=yes
  		      echo
-@@ -6840,7 +7759,7 @@ EOF
+@@ -6862,7 +7780,7 @@ EOF
  		fi
  		;;
  	      *)
@@ -29386,7 +29366,7 @@ index 70990740b6c..7f7104ffc82 100644
  		;;
  	      esac
  	    done
-@@ -6857,15 +7776,27 @@ EOF
+@@ -6879,15 +7797,27 @@ EOF
  	      if test "X$allow_libtool_libs_with_static_runtimes" = "Xyes" ; then
  		case " $predeps $postdeps " in
  		*" $a_deplib "*)
@@ -29417,7 +29397,7 @@ index 70990740b6c..7f7104ffc82 100644
  		  for potent_lib in $potential_libs; do
  		      # Follow soft links.
  		      if ls -lLd "$potent_lib" 2>/dev/null |
-@@ -6885,10 +7816,10 @@ EOF
+@@ -6907,10 +7837,10 @@ EOF
  			*) potlib=`$ECHO "$potlib" | $SED 's,[^/]*$,,'`"$potliblink";;
  			esac
  		      done
@@ -29430,7 +29410,7 @@ index 70990740b6c..7f7104ffc82 100644
  			a_deplib=""
  			break 2
  		      fi
-@@ -6913,7 +7844,7 @@ EOF
+@@ -6935,7 +7865,7 @@ EOF
  	      ;;
  	    *)
  	      # Add a -L argument.
@@ -29439,7 +29419,7 @@ index 70990740b6c..7f7104ffc82 100644
  	      ;;
  	    esac
  	  done # Gone through all deplibs.
-@@ -6929,20 +7860,20 @@ EOF
+@@ -6951,20 +7881,20 @@ EOF
  	      if test "X$allow_libtool_libs_with_static_runtimes" = "Xyes" ; then
  		case " $predeps $postdeps " in
  		*" $a_deplib "*)
@@ -29463,7 +29443,7 @@ index 70990740b6c..7f7104ffc82 100644
  		      a_deplib=""
  		      break 2
  		    fi
-@@ -6967,7 +7898,7 @@ EOF
+@@ -6989,7 +7919,7 @@ EOF
  	      ;;
  	    *)
  	      # Add a -L argument.
@@ -29472,7 +29452,7 @@ index 70990740b6c..7f7104ffc82 100644
  	      ;;
  	    esac
  	  done # Gone through all deplibs.
-@@ -7071,7 +8002,7 @@ EOF
+@@ -7093,7 +8023,7 @@ EOF
  	*)
  	  case " $deplibs " in
  	  *" -L$path/$objdir "*)
@@ -29481,7 +29461,7 @@ index 70990740b6c..7f7104ffc82 100644
  	  esac
  	  ;;
  	esac
-@@ -7081,10 +8012,10 @@ EOF
+@@ -7103,10 +8033,10 @@ EOF
  	-L*)
  	  case " $new_libs " in
  	  *" $deplib "*) ;;
@@ -29494,7 +29474,7 @@ index 70990740b6c..7f7104ffc82 100644
  	esac
        done
        deplibs="$new_libs"
-@@ -7101,10 +8032,12 @@ EOF
+@@ -7123,10 +8053,12 @@ EOF
  	  hardcode_libdirs=
  	  dep_rpath=
  	  rpath="$finalize_rpath"
@@ -29508,7 +29488,7 @@ index 70990740b6c..7f7104ffc82 100644
  		if test -z "$hardcode_libdirs"; then
  		  hardcode_libdirs="$libdir"
  		else
-@@ -7113,18 +8046,18 @@ EOF
+@@ -7135,18 +8067,18 @@ EOF
  		  *"$hardcode_libdir_separator$libdir$hardcode_libdir_separator"*)
  		    ;;
  		  *)
@@ -29531,7 +29511,7 @@ index 70990740b6c..7f7104ffc82 100644
  	      esac
  	    fi
  	  done
-@@ -7133,40 +8066,38 @@ EOF
+@@ -7155,40 +8087,38 @@ EOF
  	     test -n "$hardcode_libdirs"; then
  	    libdir="$hardcode_libdirs"
  	    if test -n "$hardcode_libdir_flag_spec_ld"; then
@@ -29581,7 +29561,7 @@ index 70990740b6c..7f7104ffc82 100644
  	else
  	  soname="$realname"
  	fi
-@@ -7178,7 +8109,7 @@ EOF
+@@ -7200,7 +8130,7 @@ EOF
  	linknames=
  	for link
  	do
@@ -29590,7 +29570,7 @@ index 70990740b6c..7f7104ffc82 100644
  	done
  
  	# Use standard objects if they are pic
-@@ -7189,7 +8120,7 @@ EOF
+@@ -7211,7 +8141,7 @@ EOF
  	if test -n "$export_symbols" && test -n "$include_expsyms"; then
  	  $opt_dry_run || cp "$export_symbols" "$output_objdir/$libname.uexp"
  	  export_symbols="$output_objdir/$libname.uexp"
@@ -29599,7 +29579,7 @@ index 70990740b6c..7f7104ffc82 100644
  	fi
  
  	orig_export_symbols=
-@@ -7220,13 +8151,45 @@ EOF
+@@ -7242,13 +8172,45 @@ EOF
  	    $opt_dry_run || $RM $export_symbols
  	    cmds=$export_symbols_cmds
  	    save_ifs="$IFS"; IFS='~'
@@ -29650,7 +29630,7 @@ index 70990740b6c..7f7104ffc82 100644
  		skipped_export=false
  	      else
  		# The command line is too long to execute in one step.
-@@ -7248,7 +8211,7 @@ EOF
+@@ -7270,7 +8232,7 @@ EOF
  	if test -n "$export_symbols" && test -n "$include_expsyms"; then
  	  tmp_export_symbols="$export_symbols"
  	  test -n "$orig_export_symbols" && tmp_export_symbols="$orig_export_symbols"
@@ -29659,7 +29639,7 @@ index 70990740b6c..7f7104ffc82 100644
  	fi
  
  	if test "X$skipped_export" != "X:" && test -n "$orig_export_symbols"; then
-@@ -7260,7 +8223,7 @@ EOF
+@@ -7282,7 +8244,7 @@ EOF
  	  # global variables. join(1) would be nice here, but unfortunately
  	  # isn't a blessed tool.
  	  $opt_dry_run || $SED -e '/[ ,]DATA/!d;s,\(.*\)\([ \,].*\),s|^\1$|\1\2|,' < $export_symbols > $output_objdir/$libname.filter
@@ -29668,7 +29648,7 @@ index 70990740b6c..7f7104ffc82 100644
  	  export_symbols=$output_objdir/$libname.def
  	  $opt_dry_run || $SED -f $output_objdir/$libname.filter < $orig_export_symbols > $export_symbols
  	fi
-@@ -7270,7 +8233,7 @@ EOF
+@@ -7292,7 +8254,7 @@ EOF
  	  case " $convenience " in
  	  *" $test_deplib "*) ;;
  	  *)
@@ -29677,7 +29657,7 @@ index 70990740b6c..7f7104ffc82 100644
  	    ;;
  	  esac
  	done
-@@ -7286,43 +8249,43 @@ EOF
+@@ -7308,43 +8270,43 @@ EOF
  	  fi
  	  if test -n "$whole_archive_flag_spec"; then
  	    save_libobjs=$libobjs
@@ -29732,7 +29712,7 @@ index 70990740b6c..7f7104ffc82 100644
  	    cmds=$archive_cmds
  	  fi
  	fi
-@@ -7366,10 +8329,13 @@ EOF
+@@ -7388,10 +8350,13 @@ EOF
  	    echo 'INPUT (' > $output
  	    for obj in $save_libobjs
  	    do
@@ -29748,7 +29728,7 @@ index 70990740b6c..7f7104ffc82 100644
  	  elif test -n "$save_libobjs" && test "X$skipped_export" != "X:" && test "X$file_list_spec" != X; then
  	    output=${output_objdir}/${output_la}.lnk
  	    func_verbose "creating linker input file list: $output"
-@@ -7383,15 +8349,17 @@ EOF
+@@ -7405,15 +8370,17 @@ EOF
  	    fi
  	    for obj
  	    do
@@ -29770,7 +29750,7 @@ index 70990740b6c..7f7104ffc82 100644
  	      func_len " $test_cmds"
  	      len0=$func_len_result
  	      len=$len0
-@@ -7411,12 +8379,12 @@ EOF
+@@ -7433,12 +8400,12 @@ EOF
  		  if test "$k" -eq 1 ; then
  		    # The first file doesn't have a previous command to add.
  		    reload_objs=$objlist
@@ -29785,7 +29765,7 @@ index 70990740b6c..7f7104ffc82 100644
  		  fi
  		  last_robj=$output_objdir/$output_la-${k}.$objext
  		  func_arith $k + 1
-@@ -7433,11 +8401,11 @@ EOF
+@@ -7455,11 +8422,11 @@ EOF
  	      # files will link in the last one created.
  	      test -z "$concat_cmds" || concat_cmds=$concat_cmds~
  	      reload_objs="$objlist $last_robj"
@@ -29800,7 +29780,7 @@ index 70990740b6c..7f7104ffc82 100644
  
  	    else
  	      output=
-@@ -7450,9 +8418,9 @@ EOF
+@@ -7472,9 +8439,9 @@ EOF
  	      libobjs=$output
  	      # Append the command to create the export file.
  	      test -z "$concat_cmds" || concat_cmds=$concat_cmds~
@@ -29812,7 +29792,7 @@ index 70990740b6c..7f7104ffc82 100644
  	      fi
  	    fi
  
-@@ -7471,7 +8439,7 @@ EOF
+@@ -7493,7 +8460,7 @@ EOF
  		lt_exit=$?
  
  		# Restore the uninstalled library and exit
@@ -29821,7 +29801,7 @@ index 70990740b6c..7f7104ffc82 100644
  		  ( cd "$output_objdir" && \
  		    $RM "${realname}T" && \
  		    $MV "${realname}U" "$realname" )
-@@ -7492,7 +8460,7 @@ EOF
+@@ -7514,7 +8481,7 @@ EOF
  	    if test -n "$export_symbols" && test -n "$include_expsyms"; then
  	      tmp_export_symbols="$export_symbols"
  	      test -n "$orig_export_symbols" && tmp_export_symbols="$orig_export_symbols"
@@ -29830,7 +29810,7 @@ index 70990740b6c..7f7104ffc82 100644
  	    fi
  
  	    if test -n "$orig_export_symbols"; then
-@@ -7504,7 +8472,7 @@ EOF
+@@ -7526,7 +8493,7 @@ EOF
  	      # global variables. join(1) would be nice here, but unfortunately
  	      # isn't a blessed tool.
  	      $opt_dry_run || $SED -e '/[ ,]DATA/!d;s,\(.*\)\([ \,].*\),s|^\1$|\1\2|,' < $export_symbols > $output_objdir/$libname.filter
@@ -29839,7 +29819,7 @@ index 70990740b6c..7f7104ffc82 100644
  	      export_symbols=$output_objdir/$libname.def
  	      $opt_dry_run || $SED -f $output_objdir/$libname.filter < $orig_export_symbols > $export_symbols
  	    fi
-@@ -7515,7 +8483,7 @@ EOF
+@@ -7537,7 +8504,7 @@ EOF
  	  output=$save_output
  
  	  if test -n "$convenience" && test -n "$whole_archive_flag_spec"; then
@@ -29848,7 +29828,7 @@ index 70990740b6c..7f7104ffc82 100644
  	    test "X$libobjs" = "X " && libobjs=
  	  fi
  	  # Expand the library linking commands again to reset the
-@@ -7539,23 +8507,23 @@ EOF
+@@ -7561,23 +8528,23 @@ EOF
  
  	if test -n "$delfiles"; then
  	  # Append the command to remove temporary files to $cmds.
@@ -29876,7 +29856,7 @@ index 70990740b6c..7f7104ffc82 100644
  	  $opt_silent || {
  	    func_quote_for_expand "$cmd"
  	    eval "func_echo $func_quote_for_expand_result"
-@@ -7564,7 +8532,7 @@ EOF
+@@ -7586,7 +8553,7 @@ EOF
  	    lt_exit=$?
  
  	    # Restore the uninstalled library and exit
@@ -29885,7 +29865,7 @@ index 70990740b6c..7f7104ffc82 100644
  	      ( cd "$output_objdir" && \
  	        $RM "${realname}T" && \
  		$MV "${realname}U" "$realname" )
-@@ -7576,8 +8544,8 @@ EOF
+@@ -7598,8 +8565,8 @@ EOF
  	IFS="$save_ifs"
  
  	# Restore the uninstalled library and exit
@@ -29896,7 +29876,7 @@ index 70990740b6c..7f7104ffc82 100644
  
  	  if test -n "$convenience"; then
  	    if test -z "$whole_archive_flag_spec"; then
-@@ -7656,17 +8624,20 @@ EOF
+@@ -7678,17 +8645,20 @@ EOF
  
        if test -n "$convenience"; then
  	if test -n "$whole_archive_flag_spec"; then
@@ -29919,7 +29899,7 @@ index 70990740b6c..7f7104ffc82 100644
        # Create the old-style object.
        reload_objs="$objs$old_deplibs "`$ECHO "$libobjs" | $SP2NL | $SED "/\.${libext}$/d; /\.lib$/d; $lo2o" | $NL2SP`" $reload_conv_objs" ### testsuite: skip nested quoting test
  
-@@ -7690,7 +8661,7 @@ EOF
+@@ -7712,7 +8682,7 @@ EOF
  	# Create an invalid libtool object if no PIC, so that we don't
  	# accidentally link it into a program.
  	# $show "echo timestamp > $libobj"
@@ -29928,7 +29908,7 @@ index 70990740b6c..7f7104ffc82 100644
  	exit $EXIT_SUCCESS
        fi
  
-@@ -7740,8 +8711,8 @@ EOF
+@@ -7762,8 +8732,8 @@ EOF
  	if test "$tagname" = CXX ; then
  	  case ${MACOSX_DEPLOYMENT_TARGET-10.0} in
  	    10.[0123])
@@ -29939,7 +29919,7 @@ index 70990740b6c..7f7104ffc82 100644
  	    ;;
  	  esac
  	fi
-@@ -7761,7 +8732,7 @@ EOF
+@@ -7783,7 +8753,7 @@ EOF
  	*)
  	  case " $compile_deplibs " in
  	  *" -L$path/$objdir "*)
@@ -29948,7 +29928,7 @@ index 70990740b6c..7f7104ffc82 100644
  	  esac
  	  ;;
  	esac
-@@ -7771,17 +8742,17 @@ EOF
+@@ -7793,17 +8763,17 @@ EOF
  	-L*)
  	  case " $new_libs " in
  	  *" $deplib "*) ;;
@@ -29970,7 +29950,7 @@ index 70990740b6c..7f7104ffc82 100644
  
        if test -n "$rpath$xrpath"; then
  	# If the user specified any rpath flags, then add them.
-@@ -7789,7 +8760,7 @@ EOF
+@@ -7811,7 +8781,7 @@ EOF
  	  # This is the magic to use -rpath.
  	  case "$finalize_rpath " in
  	  *" $libdir "*) ;;
@@ -29979,7 +29959,7 @@ index 70990740b6c..7f7104ffc82 100644
  	  esac
  	done
        fi
-@@ -7808,18 +8779,18 @@ EOF
+@@ -7830,18 +8800,18 @@ EOF
  	      *"$hardcode_libdir_separator$libdir$hardcode_libdir_separator"*)
  		;;
  	      *)
@@ -30002,7 +29982,7 @@ index 70990740b6c..7f7104ffc82 100644
  	  esac
  	fi
  	case $host in
-@@ -7828,12 +8799,12 @@ EOF
+@@ -7850,12 +8820,12 @@ EOF
  	  case :$dllsearchpath: in
  	  *":$libdir:"*) ;;
  	  ::) dllsearchpath=$libdir;;
@@ -30017,7 +29997,7 @@ index 70990740b6c..7f7104ffc82 100644
  	  esac
  	  ;;
  	esac
-@@ -7842,7 +8813,7 @@ EOF
+@@ -7864,7 +8834,7 @@ EOF
        if test -n "$hardcode_libdir_separator" &&
  	 test -n "$hardcode_libdirs"; then
  	libdir="$hardcode_libdirs"
@@ -30026,7 +30006,7 @@ index 70990740b6c..7f7104ffc82 100644
        fi
        compile_rpath="$rpath"
  
-@@ -7859,18 +8830,18 @@ EOF
+@@ -7881,18 +8851,18 @@ EOF
  	      *"$hardcode_libdir_separator$libdir$hardcode_libdir_separator"*)
  		;;
  	      *)
@@ -30049,7 +30029,7 @@ index 70990740b6c..7f7104ffc82 100644
  	  esac
  	fi
        done
-@@ -7878,7 +8849,7 @@ EOF
+@@ -7900,7 +8870,7 @@ EOF
        if test -n "$hardcode_libdir_separator" &&
  	 test -n "$hardcode_libdirs"; then
  	libdir="$hardcode_libdirs"
@@ -30058,7 +30038,7 @@ index 70990740b6c..7f7104ffc82 100644
        fi
        finalize_rpath="$rpath"
  
-@@ -7921,6 +8892,12 @@ EOF
+@@ -7943,6 +8913,12 @@ EOF
  	exit_status=0
  	func_show_eval "$link_command" 'exit_status=$?'
  
@@ -30071,7 +30051,7 @@ index 70990740b6c..7f7104ffc82 100644
  	# Delete the generated files.
  	if test -f "$output_objdir/${outputname}S.${objext}"; then
  	  func_show_eval '$RM "$output_objdir/${outputname}S.${objext}"'
-@@ -7943,7 +8920,7 @@ EOF
+@@ -7965,7 +8941,7 @@ EOF
  	  # We should set the runpath_var.
  	  rpath=
  	  for dir in $perm_rpath; do
@@ -30080,7 +30060,7 @@ index 70990740b6c..7f7104ffc82 100644
  	  done
  	  compile_var="$runpath_var=\"$rpath\$$runpath_var\" "
  	fi
-@@ -7951,7 +8928,7 @@ EOF
+@@ -7973,7 +8949,7 @@ EOF
  	  # We should set the runpath_var.
  	  rpath=
  	  for dir in $finalize_perm_rpath; do
@@ -30089,7 +30069,7 @@ index 70990740b6c..7f7104ffc82 100644
  	  done
  	  finalize_var="$runpath_var=\"$rpath\$$runpath_var\" "
  	fi
-@@ -7966,6 +8943,13 @@ EOF
+@@ -7988,6 +8964,13 @@ EOF
  	$opt_dry_run || $RM $output
  	# Link the executable and exit
  	func_show_eval "$link_command" 'exit $?'
@@ -30103,7 +30083,7 @@ index 70990740b6c..7f7104ffc82 100644
  	exit $EXIT_SUCCESS
        fi
  
-@@ -7999,6 +8983,12 @@ EOF
+@@ -8021,6 +9004,12 @@ EOF
  
        func_show_eval "$link_command" 'exit $?'
  
@@ -30116,7 +30096,7 @@ index 70990740b6c..7f7104ffc82 100644
        # Now create the wrapper script.
        func_verbose "creating $output"
  
-@@ -8096,7 +9086,7 @@ EOF
+@@ -8118,7 +9107,7 @@ EOF
  	else
  	  oldobjs="$old_deplibs $non_pic_objects"
  	  if test "$preload" = yes && test -f "$symfileobj"; then
@@ -30125,7 +30105,7 @@ index 70990740b6c..7f7104ffc82 100644
  	  fi
  	fi
  	addlibs="$old_convenience"
-@@ -8104,10 +9094,10 @@ EOF
+@@ -8126,10 +9115,10 @@ EOF
  
        if test -n "$addlibs"; then
  	gentop="$output_objdir/${outputname}x"
@@ -30138,7 +30118,7 @@ index 70990740b6c..7f7104ffc82 100644
        fi
  
        # Do each command in the archive commands.
-@@ -8118,10 +9108,10 @@ EOF
+@@ -8140,10 +9129,10 @@ EOF
  	# Add any objects from preloaded convenience libraries
  	if test -n "$dlprefiles"; then
  	  gentop="$output_objdir/${outputname}x"
@@ -30151,7 +30131,7 @@ index 70990740b6c..7f7104ffc82 100644
  	fi
  
  	# POSIX demands no paths to be encoded in archives.  We have
-@@ -8139,7 +9129,7 @@ EOF
+@@ -8161,7 +9150,7 @@ EOF
  	else
  	  echo "copying selected object files to avoid basename conflicts..."
  	  gentop="$output_objdir/${outputname}x"
@@ -30160,7 +30140,7 @@ index 70990740b6c..7f7104ffc82 100644
  	  func_mkdir_p "$gentop"
  	  save_oldobjs=$oldobjs
  	  oldobjs=
-@@ -8163,18 +9153,28 @@ EOF
+@@ -8185,18 +9174,28 @@ EOF
  		esac
  	      done
  	      func_show_eval "ln $obj $gentop/$newobj || cp $obj $gentop/$newobj"
@@ -30192,7 +30172,7 @@ index 70990740b6c..7f7104ffc82 100644
  	else
  	  # the command line is too long to link in one step, link in parts
  	  func_verbose "using piecewise archive linking..."
-@@ -8189,7 +9189,7 @@ EOF
+@@ -8211,7 +9210,7 @@ EOF
  	  do
  	    last_oldobj=$obj
  	  done
@@ -30201,7 +30181,7 @@ index 70990740b6c..7f7104ffc82 100644
  	  func_len " $test_cmds"
  	  len0=$func_len_result
  	  len=$len0
-@@ -8208,7 +9208,7 @@ EOF
+@@ -8230,7 +9229,7 @@ EOF
  		RANLIB=$save_RANLIB
  	      fi
  	      test -z "$concat_cmds" || concat_cmds=$concat_cmds~
@@ -30210,7 +30190,7 @@ index 70990740b6c..7f7104ffc82 100644
  	      objlist=
  	      len=$len0
  	    fi
-@@ -8216,9 +9216,9 @@ EOF
+@@ -8238,9 +9237,9 @@ EOF
  	  RANLIB=$save_RANLIB
  	  oldobjs=$objlist
  	  if test "X$oldobjs" = "X" ; then
@@ -30222,7 +30202,7 @@ index 70990740b6c..7f7104ffc82 100644
  	  fi
  	fi
        fi
-@@ -8268,12 +9268,23 @@ EOF
+@@ -8290,12 +9289,23 @@ EOF
  	      *.la)
  		func_basename "$deplib"
  		name="$func_basename_result"
@@ -30249,7 +30229,7 @@ index 70990740b6c..7f7104ffc82 100644
  	      esac
  	    done
  	    dependency_libs="$newdependency_libs"
-@@ -8284,12 +9295,14 @@ EOF
+@@ -8306,12 +9316,14 @@ EOF
  	      *.la)
  	        func_basename "$lib"
  		name="$func_basename_result"
@@ -30267,7 +30247,7 @@ index 70990740b6c..7f7104ffc82 100644
  	      esac
  	    done
  	    dlfiles="$newdlfiles"
-@@ -8303,10 +9316,11 @@ EOF
+@@ -8325,10 +9337,11 @@ EOF
  		# the library:
  		func_basename "$lib"
  		name="$func_basename_result"
@@ -30281,7 +30261,7 @@ index 70990740b6c..7f7104ffc82 100644
  		;;
  	      esac
  	    done
-@@ -8318,7 +9332,7 @@ EOF
+@@ -8340,7 +9353,7 @@ EOF
  		[\\/]* | [A-Za-z]:[\\/]*) abs="$lib" ;;
  		*) abs=`pwd`"/$lib" ;;
  	      esac
@@ -30290,7 +30270,7 @@ index 70990740b6c..7f7104ffc82 100644
  	    done
  	    dlfiles="$newdlfiles"
  	    newdlprefiles=
-@@ -8327,7 +9341,7 @@ EOF
+@@ -8349,7 +9362,7 @@ EOF
  		[\\/]* | [A-Za-z]:[\\/]*) abs="$lib" ;;
  		*) abs=`pwd`"/$lib" ;;
  	      esac
@@ -30299,7 +30279,7 @@ index 70990740b6c..7f7104ffc82 100644
  	    done
  	    dlprefiles="$newdlprefiles"
  	  fi
-@@ -8412,7 +9426,7 @@ relink_command=\"$relink_command\""
+@@ -8434,7 +9447,7 @@ relink_command=\"$relink_command\""
      exit $EXIT_SUCCESS
  }
  
@@ -30308,7 +30288,7 @@ index 70990740b6c..7f7104ffc82 100644
      func_mode_link ${1+"$@"}
  
  
-@@ -8432,9 +9446,9 @@ func_mode_uninstall ()
+@@ -8454,9 +9467,9 @@ func_mode_uninstall ()
      for arg
      do
        case $arg in
@@ -30321,7 +30301,7 @@ index 70990740b6c..7f7104ffc82 100644
        esac
      done
  
-@@ -8443,24 +9457,23 @@ func_mode_uninstall ()
+@@ -8465,24 +9478,23 @@ func_mode_uninstall ()
  
      rmdirs=
  
@@ -30353,7 +30333,7 @@ index 70990740b6c..7f7104ffc82 100644
  	esac
        fi
  
-@@ -8486,18 +9499,17 @@ func_mode_uninstall ()
+@@ -8508,18 +9520,17 @@ func_mode_uninstall ()
  
  	  # Delete the libtool libraries and symlinks.
  	  for n in $library_names; do
@@ -30378,7 +30358,7 @@ index 70990740b6c..7f7104ffc82 100644
  	    ;;
  	  uninstall)
  	    if test -n "$library_names"; then
-@@ -8525,19 +9537,19 @@ func_mode_uninstall ()
+@@ -8547,19 +9558,19 @@ func_mode_uninstall ()
  	  # Add PIC object to the list of files to remove.
  	  if test -n "$pic_object" &&
  	     test "$pic_object" != none; then
@@ -30401,7 +30381,7 @@ index 70990740b6c..7f7104ffc82 100644
  	  noexename=$name
  	  case $file in
  	  *.exe)
-@@ -8547,7 +9559,7 @@ func_mode_uninstall ()
+@@ -8569,7 +9580,7 @@ func_mode_uninstall ()
  	    noexename=$func_stripname_result
  	    # $file with .exe has already been added to rmfiles,
  	    # add $file without .exe
@@ -30410,7 +30390,7 @@ index 70990740b6c..7f7104ffc82 100644
  	    ;;
  	  esac
  	  # Do a test to see if this is a libtool program.
-@@ -8556,7 +9568,7 @@ func_mode_uninstall ()
+@@ -8578,7 +9589,7 @@ func_mode_uninstall ()
  	      func_ltwrapper_scriptname "$file"
  	      relink_command=
  	      func_source $func_ltwrapper_scriptname_result
@@ -30419,7 +30399,7 @@ index 70990740b6c..7f7104ffc82 100644
  	    else
  	      relink_command=
  	      func_source $dir/$noexename
-@@ -8564,12 +9576,12 @@ func_mode_uninstall ()
+@@ -8586,12 +9597,12 @@ func_mode_uninstall ()
  
  	    # note $name still contains .exe if it was in $file originally
  	    # as does the version of $file that was added into $rmfiles
@@ -30435,7 +30415,7 @@ index 70990740b6c..7f7104ffc82 100644
  	    fi
  	  fi
  	fi
-@@ -8577,7 +9589,6 @@ func_mode_uninstall ()
+@@ -8599,7 +9610,6 @@ func_mode_uninstall ()
        esac
        func_show_eval "$RM $rmfiles" 'exit_status=1'
      done
@@ -30443,7 +30423,7 @@ index 70990740b6c..7f7104ffc82 100644
  
      # Try to remove the ${objdir}s in the directories where we deleted files
      for dir in $rmdirs; do
-@@ -8589,16 +9600,16 @@ func_mode_uninstall ()
+@@ -8611,16 +9621,16 @@ func_mode_uninstall ()
      exit $exit_status
  }
  
@@ -30518,7 +30498,7 @@ index bf92b5e0790..c573da90c5c 100644
  # These exist entirely to fool aclocal when bootstrapping libtool.
  #
 diff --git a/opcodes/Makefile.in b/opcodes/Makefile.in
-index 57aaed26da8..9cca46c7dfd 100644
+index 4399354e5a9..4b1625febf3 100644
 --- a/opcodes/Makefile.in
 +++ b/opcodes/Makefile.in
 @@ -298,6 +298,7 @@ CYGPATH_W = @CYGPATH_W@
@@ -30546,7 +30526,7 @@ index 57aaed26da8..9cca46c7dfd 100644
  ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
  am__include = @am__include@
 diff --git a/opcodes/configure b/opcodes/configure
-index 313cbd436ed..e8ef4ba915b 100755
+index b326512ce3c..03f2b1bd64b 100755
 --- a/opcodes/configure
 +++ b/opcodes/configure
 @@ -688,6 +688,9 @@ OTOOL
@@ -31870,7 +31850,7 @@ index 313cbd436ed..e8ef4ba915b 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -15349,13 +15999,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -15348,13 +15998,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -31891,7 +31871,7 @@ index 313cbd436ed..e8ef4ba915b 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -15370,14 +16027,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -15369,14 +16026,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -31910,7 +31890,7 @@ index 313cbd436ed..e8ef4ba915b 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -15410,12 +16070,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -15409,12 +16069,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -31924,7 +31904,7 @@ index 313cbd436ed..e8ef4ba915b 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -15470,8 +16130,13 @@ reload_flag \
+@@ -15469,8 +16129,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -31938,7 +31918,7 @@ index 313cbd436ed..e8ef4ba915b 100755
  STRIP \
  RANLIB \
  CC \
-@@ -15481,12 +16146,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -15480,12 +16145,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -31954,7 +31934,7 @@ index 313cbd436ed..e8ef4ba915b 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -15502,7 +16169,6 @@ no_undefined_flag \
+@@ -15501,7 +16168,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -31962,7 +31942,7 @@ index 313cbd436ed..e8ef4ba915b 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -15538,6 +16204,7 @@ module_cmds \
+@@ -15537,6 +16203,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -31970,7 +31950,7 @@ index 313cbd436ed..e8ef4ba915b 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -16311,7 +16978,8 @@ $as_echo X"$file" |
+@@ -16310,7 +16977,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -31980,7 +31960,7 @@ index 313cbd436ed..e8ef4ba915b 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -16414,19 +17082,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -16413,19 +17081,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -32024,7 +32004,7 @@ index 313cbd436ed..e8ef4ba915b 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -16456,6 +17147,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -16455,6 +17146,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -32037,7 +32017,7 @@ index 313cbd436ed..e8ef4ba915b 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -16465,6 +17162,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -16464,6 +17161,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -32047,7 +32027,7 @@ index 313cbd436ed..e8ef4ba915b 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -16579,12 +17279,12 @@ with_gcc=$GCC
+@@ -16578,12 +17278,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -32063,7 +32043,7 @@ index 313cbd436ed..e8ef4ba915b 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -16671,9 +17371,6 @@ inherit_rpath=$inherit_rpath
+@@ -16670,9 +17370,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -32073,7 +32053,7 @@ index 313cbd436ed..e8ef4ba915b 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -16689,6 +17386,9 @@ include_expsyms=$lt_include_expsyms
+@@ -16688,6 +17385,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -32083,7 +32063,7 @@ index 313cbd436ed..e8ef4ba915b 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -16721,210 +17421,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -16720,210 +17420,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
diff --git a/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch b/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
index 72015134534..18f1e90aade 100644
--- a/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
+++ b/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
@@ -1,4 +1,4 @@
-From 7f8a2d32fa0951aa2f921a4401ce1cac664db129 Mon Sep 17 00:00:00 2001
+From 1967fbe2cbbb039e3b54666b55f6456325c58e91 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:42:38 +0000
 Subject: [PATCH] Fix rpath in libtool when sysroot is enabled
@@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 8 insertions(+), 2 deletions(-)
 
 diff --git a/ltmain.sh b/ltmain.sh
-index 7f7104ffc82..f59eb4aa631 100644
+index 09693d7b99b..39f0a5bde46 100644
 --- a/ltmain.sh
 +++ b/ltmain.sh
-@@ -8035,9 +8035,11 @@ EOF
+@@ -8056,9 +8056,11 @@ EOF
  	  test "$opt_mode" != relink && rpath="$compile_rpath$rpath"
  	  for libdir in $rpath; do
  	    if test -n "$hardcode_libdir_flag_spec"; then
@@ -36,7 +36,7 @@ index 7f7104ffc82..f59eb4aa631 100644
  		if test -z "$hardcode_libdirs"; then
  		  hardcode_libdirs="$libdir"
  		else
-@@ -8770,6 +8772,10 @@ EOF
+@@ -8791,6 +8793,10 @@ EOF
        hardcode_libdirs=
        for libdir in $compile_rpath $finalize_rpath; do
  	if test -n "$hardcode_libdir_flag_spec"; then
diff --git a/meta/recipes-devtools/binutils/binutils/0010-sync-with-OE-libtool-changes.patch b/meta/recipes-devtools/binutils/binutils/0010-sync-with-OE-libtool-changes.patch
index 0564980c13c..fb1463c4e21 100644
--- a/meta/recipes-devtools/binutils/binutils/0010-sync-with-OE-libtool-changes.patch
+++ b/meta/recipes-devtools/binutils/binutils/0010-sync-with-OE-libtool-changes.patch
@@ -1,4 +1,4 @@
-From 397884efce0bb7c3f1ff5e1da212e874c7eaf14b Mon Sep 17 00:00:00 2001
+From 6b37e476ee9f7feac837063cd0ca8e634fb76f90 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 6 Mar 2017 23:33:27 -0800
 Subject: [PATCH] sync with OE libtool changes
@@ -26,10 +26,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 28 insertions(+), 6 deletions(-)
 
 diff --git a/ltmain.sh b/ltmain.sh
-index f59eb4aa631..ce97db42ce7 100644
+index 39f0a5bde46..890719f2de0 100644
 --- a/ltmain.sh
 +++ b/ltmain.sh
-@@ -8053,8 +8053,16 @@ EOF
+@@ -8074,8 +8074,16 @@ EOF
  		  esac
  		fi
  	      else
@@ -48,7 +48,7 @@ index f59eb4aa631..ce97db42ce7 100644
  	      fi
  	    elif test -n "$runpath_var"; then
  	      case "$perm_rpath " in
-@@ -8790,8 +8798,16 @@ EOF
+@@ -8811,8 +8819,16 @@ EOF
  	      esac
  	    fi
  	  else
@@ -67,7 +67,7 @@ index f59eb4aa631..ce97db42ce7 100644
  	  fi
  	elif test -n "$runpath_var"; then
  	  case "$perm_rpath " in
-@@ -8841,8 +8857,14 @@ EOF
+@@ -8862,8 +8878,14 @@ EOF
  	      esac
  	    fi
  	  else
diff --git a/meta/recipes-devtools/binutils/binutils/0011-Check-for-clang-before-checking-gcc-version.patch b/meta/recipes-devtools/binutils/binutils/0011-Check-for-clang-before-checking-gcc-version.patch
index 728dee0908c..ddba0c33b63 100644
--- a/meta/recipes-devtools/binutils/binutils/0011-Check-for-clang-before-checking-gcc-version.patch
+++ b/meta/recipes-devtools/binutils/binutils/0011-Check-for-clang-before-checking-gcc-version.patch
@@ -1,4 +1,4 @@
-From 75a17814ee39346612a2ff582fe5466201fa56b3 Mon Sep 17 00:00:00 2001
+From 8942cfa25f5822d88f990c3a939c0a4f7832a0e2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 15 Apr 2020 14:17:20 -0700
 Subject: [PATCH] Check for clang before checking gcc version
@@ -18,10 +18,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index 7823f2c3784..52b6a1318ae 100755
+index bbfb5979546..fef4bd65124 100755
 --- a/configure
 +++ b/configure
-@@ -5432,7 +5432,7 @@ ac_compiler_gnu=$ac_cv_cxx_compiler_gnu
+@@ -5446,7 +5446,7 @@ ac_compiler_gnu=$ac_cv_cxx_compiler_gnu
  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
  /* end confdefs.h.  */
  
@@ -31,10 +31,10 @@ index 7823f2c3784..52b6a1318ae 100755
  #endif
  int main() {}
 diff --git a/configure.ac b/configure.ac
-index a390639bfa9..66b8de7d4fd 100644
+index f9694cdf901..54a3a968307 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1411,7 +1411,7 @@ if test "$GCC" = yes; then
+@@ -1419,7 +1419,7 @@ if test "$GCC" = yes; then
    AC_MSG_CHECKING([whether g++ accepts -static-libstdc++ -static-libgcc])
    AC_LANG_PUSH(C++)
    AC_LINK_IFELSE([AC_LANG_SOURCE([
diff --git a/meta/recipes-devtools/binutils/binutils/0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch b/meta/recipes-devtools/binutils/binutils/0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
index aaf90d25b7d..9abd85538fb 100644
--- a/meta/recipes-devtools/binutils/binutils/0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
+++ b/meta/recipes-devtools/binutils/binutils/0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
@@ -1,4 +1,4 @@
-From 508c79dbef580e52b1c47026dfe2fe5ae7be4d56 Mon Sep 17 00:00:00 2001
+From fecc7af84b2735fad82da304fce37f373d2c0f53 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 10 Mar 2022 21:21:33 -0800
 Subject: [PATCH] Only generate an RPATH entry if LD_RUN_PATH is not empty
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/ld/ldelf.c b/ld/ldelf.c
-index e49c0217ae2..069f2263c81 100644
+index f6f3ac11a76..77442fdc964 100644
 --- a/ld/ldelf.c
 +++ b/ld/ldelf.c
-@@ -1130,6 +1130,9 @@ ldelf_handle_dt_needed (struct elf_link_hash_table *htab,
+@@ -1134,6 +1134,9 @@ ldelf_handle_dt_needed (struct elf_link_hash_table *htab,
  		  && command_line.rpath == NULL)
  		{
  		  path = (const char *) getenv ("LD_RUN_PATH");
@@ -27,7 +27,7 @@ index e49c0217ae2..069f2263c81 100644
  		  if (path
  		      && ldelf_search_needed (path, &n, force,
  					      is_linux, elfsize))
-@@ -1805,6 +1808,8 @@ ldelf_before_allocation (char *audit, char *depaudit,
+@@ -1811,6 +1814,8 @@ ldelf_before_allocation (char *audit, char *depaudit,
    rpath = command_line.rpath;
    if (rpath == NULL)
      rpath = (const char *) getenv ("LD_RUN_PATH");
diff --git a/meta/recipes-devtools/binutils/binutils/0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch b/meta/recipes-devtools/binutils/binutils/0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
index 5027f0c6a5d..b075d9c58ba 100644
--- a/meta/recipes-devtools/binutils/binutils/0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
+++ b/meta/recipes-devtools/binutils/binutils/0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
@@ -1,4 +1,4 @@
-From aea8ba15afba280c9bc5ae22828fae4eed09db41 Mon Sep 17 00:00:00 2001
+From ea68b64a00dd236c6e062a9403bf8a4b2234aaa5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 15 Jan 2023 00:16:25 -0800
 Subject: [PATCH] Define alignof using _Alignof when using C11 or newer
@@ -25,7 +25,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 10 insertions(+)
 
 diff --git a/libiberty/sha1.c b/libiberty/sha1.c
-index 49e8e0b6c2b..72de5cc8ad6 100644
+index 27ceccc027b..a81332972d1 100644
 --- a/libiberty/sha1.c
 +++ b/libiberty/sha1.c
 @@ -234,7 +234,17 @@ sha1_process_bytes (const void *buffer, size_t len, struct sha1_ctx *ctx)
diff --git a/meta/recipes-devtools/binutils/binutils/0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch b/meta/recipes-devtools/binutils/binutils/0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch
index 2c38aeccdaf..411994b3427 100644
--- a/meta/recipes-devtools/binutils/binutils/0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch
+++ b/meta/recipes-devtools/binutils/binutils/0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch
@@ -1,4 +1,4 @@
-From d9b37b144a952283cefafdf679d06f842cafc955 Mon Sep 17 00:00:00 2001
+From f40157cc203a8c8348fb9a39d9fd830d6b4b23f7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Jan 2023 19:35:07 -0800
 Subject: [PATCH] Remove duplicate pe-dll.o entry deom targ_extra_ofiles
@@ -18,10 +18,10 @@ Cc: Zac Walker <zac.walker@linaro.org>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/ld/configure.tgt b/ld/configure.tgt
-index f937f78b876..830613744c2 100644
+index ea01ccf9a1b..923d6009f9a 100644
 --- a/ld/configure.tgt
 +++ b/ld/configure.tgt
-@@ -1067,7 +1067,7 @@ x86_64-*-cygwin)	targ_emul=i386pep ;
+@@ -1063,7 +1063,7 @@ x86_64-*-cygwin)	targ_emul=i386pep ;
  			;;
  x86_64-*-mingw*)	targ_emul=i386pep ;
  			targ_extra_emuls=i386pe
diff --git a/meta/recipes-devtools/binutils/binutils/0015-CVE-2024-53589.patch b/meta/recipes-devtools/binutils/binutils/0015-CVE-2024-53589.patch
deleted file mode 100644
index 380112a3baa..00000000000
--- a/meta/recipes-devtools/binutils/binutils/0015-CVE-2024-53589.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-Author: Alan Modra <amodra@gmail.com>
-Date:   Mon Nov 11 10:24:09 2024 +1030
-
-    Re: tekhex object file output fixes
-
-    Commit 8b5a212495 supported *ABS* symbols by allowing "section" to be
-    bfd_abs_section, but bfd_abs_section needs to be treated specially.
-    In particular, bfd_get_next_section_by_name (.., bfd_abs_section_ptr)
-    is invalid.
-
-            PR 32347
-            * tekhex.c (first_phase): Guard against modification of
-            _bfd_std_section[] entries.
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=e0323071916878e0634a6e24d8250e4faff67e88]
-CVE: CVE-2024-53589
-
-Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
-
-diff --git a/bfd/tekhex.c b/bfd/tekhex.c
-index aea2ebb23df..b305c1f96f1 100644
---- a/bfd/tekhex.c
-+++ b/bfd/tekhex.c
-@@ -361,6 +361,7 @@ first_phase (bfd *abfd, int type, char *src, char * src_end)
- {
-   asection *section, *alt_section;
-   unsigned int len;
-+  bfd_vma addr;
-   bfd_vma val;
-   char sym[17];			/* A symbol can only be 16chars long.  */
-
-@@ -368,20 +369,16 @@ first_phase (bfd *abfd, int type, char *src, char * src_end)
-     {
-     case '6':
-       /* Data record - read it and store it.  */
--      {
--	bfd_vma addr;
--
--	if (!getvalue (&src, &addr, src_end))
--	  return false;
--
--	while (*src && src < src_end - 1)
--	  {
--	    insert_byte (abfd, HEX (src), addr);
--	    src += 2;
--	    addr++;
--	  }
--	return true;
--      }
-+      if (!getvalue (&src, &addr, src_end))
-+       return false;
-+
-+      while (*src && src < src_end - 1)
-+       {
-+         insert_byte (abfd, HEX (src), addr);
-+         src += 2;
-+         addr++;
-+       }
-+      return true;
-
-     case '3':
-       /* Symbol record, read the segment.  */
-@@ -406,13 +403,16 @@ first_phase (bfd *abfd, int type, char *src, char * src_end)
-	    {
-	    case '1':		/* Section range.  */
-	      src++;
--	      if (!getvalue (&src, &section->vma, src_end))
-+             if (!getvalue (&src, &addr, src_end))
-		return false;
-	      if (!getvalue (&src, &val, src_end))
-		return false;
--	      if (val < section->vma)
--		val = section->vma;
--	      section->size = val - section->vma;
-+             if (bfd_is_const_section (section))
-+               break;
-+             section->vma = addr;
-+             if (val < addr)
-+               val = addr;
-+             section->size = val - addr;
-	      /* PR 17512: file: objdump-s-endless-loop.tekhex.
-		 Check for overlarge section sizes.  */
-	      if (section->size & 0x80000000)
-@@ -455,6 +455,8 @@ first_phase (bfd *abfd, int type, char *src, char * src_end)
-		  new_symbol->symbol.flags = BSF_LOCAL;
-		if (stype == '2' || stype == '6')
-		  new_symbol->symbol.section = bfd_abs_section_ptr;
-+               else if (bfd_is_const_section (section))
-+                 ;
-		else if (stype == '3' || stype == '7')
-		  {
-		    if ((section->flags & SEC_DATA) == 0)
diff --git a/meta/recipes-devtools/binutils/binutils_2.43.1.bb b/meta/recipes-devtools/binutils/binutils_2.44.bb
similarity index 97%
rename from meta/recipes-devtools/binutils/binutils_2.43.1.bb
rename to meta/recipes-devtools/binutils/binutils_2.44.bb
index 8594db9bfb5..99b5ce178de 100644
--- a/meta/recipes-devtools/binutils/binutils_2.43.1.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.44.bb
@@ -66,7 +66,7 @@ PARALLEL_MAKEINST:class-nativesdk = ""
 PACKAGE_BEFORE_PN += "libbfd libopcodes gprofng"
 FILES:libbfd = "${libdir}/libbfd-*.so.* ${libdir}/libbfd-*.so"
 FILES:libopcodes = "${libdir}/libopcodes-*.so.* ${libdir}/libopcodes-*.so"
-FILES:gprofng = "${sysconfdir}/gprofng.rc ${libdir}/gprofng/libgp-*.so ${libdir}/gprofng/libgprofng.so.* ${bindir}/gp-* ${bindir}/gprofng"
+FILES:gprofng = "${sysconfdir}/gprofng.rc ${libdir}/gprofng/libgp-*.so ${libdir}/gprofng/libgprofng.so.* ${bindir}/gprofng-* ${bindir}/gprofng"
 FILES:${PN}-dev += "${libdir}/libgprofng.so ${libdir}/libsframe.so"
 SRC_URI:append:class-nativesdk =  " file://0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch "
 


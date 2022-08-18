Date: Thu, 18 Aug 2022 21:48:30 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
Subject: Re: [OE-core] [PATCH v3 1/7] binutils: Upgrade to 2.39 release
Message-ID: <Yv6Xjjc9pGpJGXEa@mail.local>
References: <20220817070440.537761-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20220817070440.537761-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-id: <openembedded-core.lists.openembedded.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Richard Purdie <richard.purdie@linuxfoundation.org>

Hello Khem,

I got this failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/5719/steps/11/logs/stdio

On 17/08/2022 00:04:34-0700, Khem Raj wrote:
> Details of changes [1]
> 
> [1] https://sourceware.org/pipermail/binutils/2022-August/122246.html
> 
> (From OE-Core rev: a2458d4011e77868d6384b377a7a4cc1096c4ac3)
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/distro/include/tcmode-default.inc   |    2 +-
>  .../{binutils-2.38.inc => binutils-2.39.inc}  |   26 +-
>  ....38.bb => binutils-cross-canadian_2.39.bb} |    0
>  ...38.bb => binutils-cross-testsuite_2.39.bb} |    0
>  ...s-cross_2.38.bb => binutils-cross_2.39.bb} |    0
>  ...ssdk_2.38.bb => binutils-crosssdk_2.39.bb} |    0
>  ...s-crosssdk-Generate-relocatable-SDKs.patch |    2 +-
>  ...o-not-generate-linker-script-directo.patch |    2 +-
>  ...dk-Search-for-alternative-ld.so.conf.patch |   16 +-
>  ...004-Point-scripts-location-to-libdir.patch |   10 +-
>  ...tro-compiler-point-to-the-wrong-ins.patch} |    2 +-
>  ...system-directories-when-cross-linki.patch} |   42 +-
>  ...ct-assembling-for-ppc-wait-mnemonic.patch} |    8 +-
>  ...l-2.4.patch => 0008-Use-libtool-2.4.patch} | 8695 ++++++++++++++---
>  ...-in-libtool-when-sysroot-is-enabled.patch} |    2 +-
>  ...> 0010-sync-with-OE-libtool-changes.patch} |    2 +-
>  ...r-clang-before-checking-gcc-version.patch} |   10 +-
>  ...RPATH-entry-if-LD_RUN_PATH-is-not-e.patch} |   17 +-
>  .../0013-Avoid-as-info-race-condition.patch   |   75 -
>  .../binutils/0014-CVE-2019-1010204.patch      |   49 -
>  .../{binutils_2.38.bb => binutils_2.39.bb}    |    0
>  21 files changed, 7637 insertions(+), 1323 deletions(-)
>  rename meta/recipes-devtools/binutils/{binutils-2.38.inc => binutils-2.39.inc} (60%)
>  rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.38.bb => binutils-cross-canadian_2.39.bb} (100%)
>  rename meta/recipes-devtools/binutils/{binutils-cross-testsuite_2.38.bb => binutils-cross-testsuite_2.39.bb} (100%)
>  rename meta/recipes-devtools/binutils/{binutils-cross_2.38.bb => binutils-cross_2.39.bb} (100%)
>  rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.38.bb => binutils-crosssdk_2.39.bb} (100%)
>  rename meta/recipes-devtools/binutils/binutils/{0006-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch => 0005-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch} (94%)
>  rename meta/recipes-devtools/binutils/binutils/{0007-warn-for-uses-of-system-directories-when-cross-linki.patch => 0006-warn-for-uses-of-system-directories-when-cross-linki.patch} (91%)
>  rename meta/recipes-devtools/binutils/binutils/{0008-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch => 0007-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch} (85%)
>  rename meta/recipes-devtools/binutils/binutils/{0009-Use-libtool-2.4.patch => 0008-Use-libtool-2.4.patch} (75%)
>  rename meta/recipes-devtools/binutils/binutils/{0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch => 0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch} (96%)
>  rename meta/recipes-devtools/binutils/binutils/{0011-sync-with-OE-libtool-changes.patch => 0010-sync-with-OE-libtool-changes.patch} (97%)
>  rename meta/recipes-devtools/binutils/binutils/{0012-Check-for-clang-before-checking-gcc-version.patch => 0011-Check-for-clang-before-checking-gcc-version.patch} (84%)
>  rename meta/recipes-devtools/binutils/binutils/{0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch => 0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch} (70%)
>  delete mode 100644 meta/recipes-devtools/binutils/binutils/0013-Avoid-as-info-race-condition.patch
>  delete mode 100644 meta/recipes-devtools/binutils/binutils/0014-CVE-2019-1010204.patch
>  rename meta/recipes-devtools/binutils/{binutils_2.38.bb => binutils_2.39.bb} (100%)
> 
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> index 31c9dd5065..965cb20537 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -18,7 +18,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
>  
>  GCCVERSION ?= "12.%"
>  SDKGCCVERSION ?= "${GCCVERSION}"
> -BINUVERSION ?= "2.38%"
> +BINUVERSION ?= "2.39%"
>  GDBVERSION ?= "12.%"
>  GLIBCVERSION ?= "2.36"
>  LINUXLIBCVERSION ?= "5.19%"
> diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.39.inc
> similarity index 60%
> rename from meta/recipes-devtools/binutils/binutils-2.38.inc
> rename to meta/recipes-devtools/binutils/binutils-2.39.inc
> index 742ca86379..0976131ddb 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.38.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.39.inc
> @@ -12,26 +12,24 @@ LIC_FILES_CHKSUM="\
>  
>  # When upgrading to 2.39, please make sure there is no trailing .0, so
>  # that upstream version check can work correctly.
> -PV = "2.38"
> -CVE_VERSION = "2.38"
> -SRCBRANCH ?= "binutils-2_38-branch"
> +PV = "2.39"
> +CVE_VERSION = "2.39"
> +SRCBRANCH ?= "binutils-2_39-branch"
>  
>  UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
>  
> -SRCREV ?= "eed56ee299b9ef8754bb4e53f2e9cf2a7c28c04d"
> +SRCREV ?= "a58f83e8b85fa3c1564de530d68a14fc620c0027"
>  BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=git"
>  SRC_URI = "\
>       ${BINUTILS_GIT_URI} \
>       file://0004-Point-scripts-location-to-libdir.patch \
> -     file://0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch \
> -     file://0006-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch \
> -     file://0007-warn-for-uses-of-system-directories-when-cross-linki.patch \
> -     file://0008-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch \
> -     file://0009-Use-libtool-2.4.patch \
> -     file://0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch \
> -     file://0011-sync-with-OE-libtool-changes.patch \
> -     file://0012-Check-for-clang-before-checking-gcc-version.patch \
> -     file://0013-Avoid-as-info-race-condition.patch \
> -     file://0014-CVE-2019-1010204.patch \
> +     file://0005-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch \
> +     file://0006-warn-for-uses-of-system-directories-when-cross-linki.patch \
> +     file://0007-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch \
> +     file://0008-Use-libtool-2.4.patch \
> +     file://0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch \
> +     file://0010-sync-with-OE-libtool-changes.patch \
> +     file://0011-Check-for-clang-before-checking-gcc-version.patch \
> +     file://0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch \
>  "
>  S  = "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.38.bb b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.39.bb
> similarity index 100%
> rename from meta/recipes-devtools/binutils/binutils-cross-canadian_2.38.bb
> rename to meta/recipes-devtools/binutils/binutils-cross-canadian_2.39.bb
> diff --git a/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.38.bb b/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.39.bb
> similarity index 100%
> rename from meta/recipes-devtools/binutils/binutils-cross-testsuite_2.38.bb
> rename to meta/recipes-devtools/binutils/binutils-cross-testsuite_2.39.bb
> diff --git a/meta/recipes-devtools/binutils/binutils-cross_2.38.bb b/meta/recipes-devtools/binutils/binutils-cross_2.39.bb
> similarity index 100%
> rename from meta/recipes-devtools/binutils/binutils-cross_2.38.bb
> rename to meta/recipes-devtools/binutils/binutils-cross_2.39.bb
> diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.38.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.39.bb
> similarity index 100%
> rename from meta/recipes-devtools/binutils/binutils-crosssdk_2.38.bb
> rename to meta/recipes-devtools/binutils/binutils-crosssdk_2.39.bb
> diff --git a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
> index 719928be79..9a7ee494c8 100644
> --- a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
> @@ -1,4 +1,4 @@
> -From 07bb7fbdacaf9cd6a1a252ffbc98f4e05e305d50 Mon Sep 17 00:00:00 2001
> +From a0ac147aec127c66c9e38292faa50bb56d3c2a19 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 2 Mar 2015 01:58:54 +0000
>  Subject: [PATCH] binutils-crosssdk: Generate relocatable SDKs
> diff --git a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
> index a3f7d62898..cab9c0ed89 100644
> --- a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
> @@ -1,4 +1,4 @@
> -From f820ab7ea7e94d4df548be3388163ff2efb2ea96 Mon Sep 17 00:00:00 2001
> +From fd7065bfd20364679e3c3f329b19059bbc51ab02 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 6 Mar 2017 23:37:05 -0800
>  Subject: [PATCH] binutils-cross: Do not generate linker script directories
> diff --git a/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch b/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
> index 59a97c13c7..4fe5520010 100644
> --- a/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
> @@ -1,4 +1,4 @@
> -From b2ccd25828b40310caeb094c0413e3a30a4dc0a5 Mon Sep 17 00:00:00 2001
> +From 67735b3647f98ce0f010ff8b4f9b5c5da576cb17 Mon Sep 17 00:00:00 2001
>  From: Richard Purdie <richard.purdie@linuxfoundation.org>
>  Date: Wed, 19 Feb 2020 09:51:16 -0800
>  Subject: [PATCH] binutils-nativesdk: Search for alternative ld.so.conf in SDK
> @@ -29,7 +29,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   5 files changed, 7 insertions(+), 3 deletions(-)
>  
>  diff --git a/ld/Makefile.am b/ld/Makefile.am
> -index b55a873d927..61db131fb0d 100644
> +index d31021c13e2..29782385ca4 100644
>  --- a/ld/Makefile.am
>  +++ b/ld/Makefile.am
>  @@ -42,7 +42,8 @@ ZLIBINC = @zlibinc@
> @@ -41,12 +41,12 @@ index b55a873d927..61db131fb0d 100644
>  +           -DSYSCONFDIR="\"$(sysconfdir)\""
>   WARN_CFLAGS = @WARN_CFLAGS@
>   NO_WERROR = @NO_WERROR@
> - AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
> + AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS) $(JANSSON_CFLAGS)
>  diff --git a/ld/Makefile.in b/ld/Makefile.in
> -index 61e93eeaf1e..860eb21a785 100644
> +index ee0c98f65b0..04ee68a2c67 100644
>  --- a/ld/Makefile.in
>  +++ b/ld/Makefile.in
> -@@ -556,7 +556,8 @@ ZLIB = @zlibdir@ -lz
> +@@ -562,7 +562,8 @@ ZLIB = @zlibdir@ -lz
>   ZLIBINC = @zlibinc@
>   ELF_CLFAGS = -DELF_LIST_OPTIONS=@elf_list_options@ \
>   	   -DELF_SHLIB_LIST_OPTIONS=@elf_shlib_list_options@ \
> @@ -54,13 +54,13 @@ index 61e93eeaf1e..860eb21a785 100644
>  +	   -DELF_PLT_UNWIND_LIST_OPTIONS=@elf_plt_unwind_list_options@ \
>  +           -DSYSCONFDIR="\"$(sysconfdir)\""
>   
> - AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
> + AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS) $(JANSSON_CFLAGS)
>   
>  diff --git a/ld/ldelf.c b/ld/ldelf.c
> -index 121c25d948f..34cbc60e5e9 100644
> +index bfa0d54753a..0d61a3209ec 100644
>  --- a/ld/ldelf.c
>  +++ b/ld/ldelf.c
> -@@ -930,7 +930,7 @@ ldelf_check_ld_so_conf (const struct bfd_link_needed_list *l, int force,
> +@@ -936,7 +936,7 @@ ldelf_check_ld_so_conf (const struct bfd_link_needed_list *l, int force,
>   
>         info.path = NULL;
>         info.len = info.alloc = 0;
> diff --git a/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch b/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch
> index 8f323eb0c5..5b0f2ee308 100644
> --- a/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch
> @@ -1,4 +1,4 @@
> -From 7a7b777cdfded080aab1021fa6bcdb20345f5cfd Mon Sep 17 00:00:00 2001
> +From 2158e5bd4c6ea4db89e33d46ef25428e37bfc3a6 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 2 Mar 2015 01:09:58 +0000
>  Subject: [PATCH] Point scripts location to libdir
> @@ -12,10 +12,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   2 files changed, 2 insertions(+), 2 deletions(-)
>  
>  diff --git a/ld/Makefile.am b/ld/Makefile.am
> -index 61db131fb0d..5b5ee64d121 100644
> +index 29782385ca4..062e6b6814b 100644
>  --- a/ld/Makefile.am
>  +++ b/ld/Makefile.am
> -@@ -51,7 +51,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
> +@@ -51,7 +51,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS) $(JANSSON_CFLAGS)
>   # We put the scripts in the directory $(scriptdir)/ldscripts.
>   # We can't put the scripts in $(datadir) because the SEARCH_DIR
>   # directives need to be different for native and cross linkers.
> @@ -25,10 +25,10 @@ index 61db131fb0d..5b5ee64d121 100644
>   EMUL = @EMUL@
>   EMULATION_OFILES = @EMULATION_OFILES@
>  diff --git a/ld/Makefile.in b/ld/Makefile.in
> -index 860eb21a785..d719747919c 100644
> +index 04ee68a2c67..782d4017a60 100644
>  --- a/ld/Makefile.in
>  +++ b/ld/Makefile.in
> -@@ -564,7 +564,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
> +@@ -570,7 +570,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS) $(JANSSON_CFLAGS)
>   # We put the scripts in the directory $(scriptdir)/ldscripts.
>   # We can't put the scripts in $(datadir) because the SEARCH_DIR
>   # directives need to be different for native and cross linkers.
> diff --git a/meta/recipes-devtools/binutils/binutils/0006-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch b/meta/recipes-devtools/binutils/binutils/0005-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
> similarity index 94%
> rename from meta/recipes-devtools/binutils/binutils/0006-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
> rename to meta/recipes-devtools/binutils/binutils/0005-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
> index 507d0b1b2d..2495079508 100644
> --- a/meta/recipes-devtools/binutils/binutils/0006-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0005-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
> @@ -1,4 +1,4 @@
> -From fc9e8b99969bb32a4b009eab763bade6c554ef73 Mon Sep 17 00:00:00 2001
> +From e74d765a1a95253c9247228bd7ccbcabecdd8f7e Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 2 Mar 2015 01:39:01 +0000
>  Subject: [PATCH] don't let the distro compiler point to the wrong installation
> diff --git a/meta/recipes-devtools/binutils/binutils/0007-warn-for-uses-of-system-directories-when-cross-linki.patch b/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-directories-when-cross-linki.patch
> similarity index 91%
> rename from meta/recipes-devtools/binutils/binutils/0007-warn-for-uses-of-system-directories-when-cross-linki.patch
> rename to meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-directories-when-cross-linki.patch
> index 547bfcac68..00fb5aad1b 100644
> --- a/meta/recipes-devtools/binutils/binutils/0007-warn-for-uses-of-system-directories-when-cross-linki.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-directories-when-cross-linki.patch
> @@ -1,4 +1,4 @@
> -From 9fb1bafb20371d82b674778d2a8b5c9444fed417 Mon Sep 17 00:00:00 2001
> +From 2c43b1357db6b09d1645704afd3f45be6de0cf4d Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 15 Jan 2016 06:31:09 +0000
>  Subject: [PATCH] warn for uses of system directories when cross linking
> @@ -63,10 +63,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   9 files changed, 88 insertions(+), 2 deletions(-)
>  
>  diff --git a/ld/config.in b/ld/config.in
> -index 26d55a00d47..ffad464783c 100644
> +index d4c1fc420b5..1aece0b2c29 100644
>  --- a/ld/config.in
>  +++ b/ld/config.in
> -@@ -43,6 +43,9 @@
> +@@ -55,6 +55,9 @@
>      language is requested. */
>   #undef ENABLE_NLS
>   
> @@ -77,10 +77,10 @@ index 26d55a00d47..ffad464783c 100644
>   #undef EXTRA_SHLIB_EXTENSION
>   
>  diff --git a/ld/configure b/ld/configure
> -index 26150d62898..1f9ec8ec580 100755
> +index e58fb7f3a35..d0a467ac101 100755
>  --- a/ld/configure
>  +++ b/ld/configure
> -@@ -831,6 +831,7 @@ with_lib_path
> +@@ -836,6 +836,7 @@ with_lib_path
>   enable_targets
>   enable_64_bit_bfd
>   with_sysroot
> @@ -88,7 +88,7 @@ index 26150d62898..1f9ec8ec580 100755
>   enable_gold
>   enable_got
>   enable_compressed_debug_sections
> -@@ -1500,6 +1501,8 @@ Optional Features:
> +@@ -1514,6 +1515,8 @@ Optional Features:
>     --enable-checking       enable run-time checks
>     --enable-targets        alternative target configurations
>     --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
> @@ -97,7 +97,7 @@ index 26150d62898..1f9ec8ec580 100755
>     --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
>     --enable-got=<type>     GOT handling scheme (target, single, negative,
>                             multigot)
> -@@ -15312,6 +15315,19 @@ fi
> +@@ -15349,6 +15352,19 @@ fi
>   
>   
>   
> @@ -118,7 +118,7 @@ index 26150d62898..1f9ec8ec580 100755
>   if test "${enable_gold+set}" = set; then :
>     enableval=$enable_gold; case "${enableval}" in
>  diff --git a/ld/configure.ac b/ld/configure.ac
> -index 7f4cff079b7..57d1abff870 100644
> +index 4331d6b1302..e2976bc2926 100644
>  --- a/ld/configure.ac
>  +++ b/ld/configure.ac
>  @@ -102,6 +102,16 @@ AC_SUBST(use_sysroot)
> @@ -158,13 +158,13 @@ index f3086bf30de..db5064243c7 100644
>     enum endian_enum endian;
>   
>  diff --git a/ld/ld.texi b/ld/ld.texi
> -index fc75e9b3625..dca697d626e 100644
> +index eabbec8faa9..c4680e4947e 100644
>  --- a/ld/ld.texi
>  +++ b/ld/ld.texi
> -@@ -2892,6 +2892,18 @@ string identifying the original linked file does not change.
> - 
> - Passing @code{none} for @var{style} disables the setting from any
> - @code{--build-id} options earlier on the command line.
> +@@ -2947,6 +2947,18 @@ creation of the metadata note, if one had been enabled by an earlier
> + occurrence of the --package-metdata option.
> + If the linker has been built with libjansson, then the JSON string
> + will be validated.
>  +
>  +@kindex --no-poison-system-directories
>  +@item --no-poison-system-directories
> @@ -209,13 +209,13 @@ index 731ae5f7aed..dd8f03fd960 100644
>   
>   /* Try to open a BFD for a lang_input_statement.  */
>  diff --git a/ld/ldlex.h b/ld/ldlex.h
> -index bc58fea73cc..a1595589197 100644
> +index 57ade1f754b..64007ff8684 100644
>  --- a/ld/ldlex.h
>  +++ b/ld/ldlex.h
> -@@ -164,6 +164,8 @@ enum option_values
> -   OPTION_CTF_VARIABLES,
> -   OPTION_NO_CTF_VARIABLES,
> -   OPTION_CTF_SHARE_TYPES,
> +@@ -168,6 +168,8 @@ enum option_values
> +   OPTION_NO_WARN_EXECSTACK,
> +   OPTION_WARN_RWX_SEGMENTS,
> +   OPTION_NO_WARN_RWX_SEGMENTS,
>  +  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
>  +  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
>   };
> @@ -253,10 +253,10 @@ index 1ae90a77749..f40750fd816 100644
>       {
>         if (error_count < MAX_ERRORS_IN_A_ROW)
>  diff --git a/ld/lexsup.c b/ld/lexsup.c
> -index 5acc47ed5a0..d03c6136ccf 100644
> +index 9225f71b3ce..92fb66f1fa2 100644
>  --- a/ld/lexsup.c
>  +++ b/ld/lexsup.c
> -@@ -600,6 +600,14 @@ static const struct ld_option ld_options[] =
> +@@ -608,6 +608,14 @@ static const struct ld_option ld_options[] =
>   		   "                                <method> is: share-unconflicted (default),\n"
>   		   "                                             share-duplicated"),
>       TWO_DASHES },
> @@ -271,7 +271,7 @@ index 5acc47ed5a0..d03c6136ccf 100644
>   };
>   
>   #define OPTION_COUNT ARRAY_SIZE (ld_options)
> -@@ -1702,6 +1710,14 @@ parse_args (unsigned argc, char **argv)
> +@@ -1722,6 +1730,14 @@ parse_args (unsigned argc, char **argv)
>   	  config.print_map_discarded = true;
>   	  break;
>   
> diff --git a/meta/recipes-devtools/binutils/binutils/0008-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch b/meta/recipes-devtools/binutils/binutils/0007-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
> similarity index 85%
> rename from meta/recipes-devtools/binutils/binutils/0008-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
> rename to meta/recipes-devtools/binutils/binutils/0007-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
> index 648bdc13d2..4ae1580102 100644
> --- a/meta/recipes-devtools/binutils/binutils/0008-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0007-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
> @@ -1,4 +1,4 @@
> -From 00ae1ee97ad3ad0624798b28c6bab94a19b3ef39 Mon Sep 17 00:00:00 2001
> +From 883b6c0930410f8553b3bce0dd98131bc1694fa6 Mon Sep 17 00:00:00 2001
>  From: Zhenhua Luo <zhenhua.luo@nxp.com>
>  Date: Sat, 11 Jun 2016 22:08:29 -0500
>  Subject: [PATCH] fix the incorrect assembling for ppc wait mnemonic
> @@ -14,10 +14,10 @@ Signed-off-by: Zhenhua Luo <zhenhua.luo@nxp.com>
>   1 file changed, 1 insertion(+), 3 deletions(-)
>  
>  diff --git a/opcodes/ppc-opc.c b/opcodes/ppc-opc.c
> -index a424dd924de..406d5b60917 100644
> +index 7637d3e349e..8e074e13208 100644
>  --- a/opcodes/ppc-opc.c
>  +++ b/opcodes/ppc-opc.c
> -@@ -6378,8 +6378,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
> +@@ -6947,8 +6947,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
>   {"waitasec",	X(31,30),      XRTRARB_MASK, POWER8,	POWER9,		{0}},
>   {"waitrsv",	XWCPL(31,30,1,0),0xffffffff, POWER10,	EXT,		{0}},
>   {"pause_short",	XWCPL(31,30,2,0),0xffffffff, POWER10,	EXT,		{0}},
> @@ -26,7 +26,7 @@ index a424dd924de..406d5b60917 100644
>   
>   {"lwepx",	X(31,31),	X_MASK,	  E500MC|PPCA2, 0,		{RT, RA0, RB}},
>   
> -@@ -6433,7 +6431,7 @@ const struct powerpc_opcode powerpc_opcodes[] = {
> +@@ -7002,7 +7000,7 @@ const struct powerpc_opcode powerpc_opcodes[] = {
>   
>   {"waitrsv",	X(31,62)|(1<<21), 0xffffffff, E500MC|PPCA2, EXT,	{0}},
>   {"waitimpl",	X(31,62)|(2<<21), 0xffffffff, E500MC|PPCA2, EXT,	{0}},
> diff --git a/meta/recipes-devtools/binutils/binutils/0009-Use-libtool-2.4.patch b/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch
> similarity index 75%
> rename from meta/recipes-devtools/binutils/binutils/0009-Use-libtool-2.4.patch
> rename to meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch
> index 9f0209e274..21e2c4fd70 100644
> --- a/meta/recipes-devtools/binutils/binutils/0009-Use-libtool-2.4.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch
> @@ -1,4 +1,4 @@
> -From 9a0dea4d2f1f0f2c71f519e6195ef9cfacd9fda9 Mon Sep 17 00:00:00 2001
> +From 0f45262ef0d656c576adbb0b0f42b8f417895008 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Sun, 14 Feb 2016 17:04:07 +0000
>  Subject: [PATCH] Use libtool 2.4
> @@ -9,28 +9,75 @@ Upstream-Status: Pending
>  
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> - bfd/configure          | 1333 +++++++++++++-----
> - bfd/configure.ac       |    2 +-
> - binutils/configure     | 1331 +++++++++++++-----
> - gas/configure          | 1331 +++++++++++++-----
> - gprof/configure        | 1331 +++++++++++++-----
> - ld/configure           | 1704 +++++++++++++++++------
> - libbacktrace/configure | 1534 +++++++++++++++------
> - libctf/configure       | 1330 +++++++++++++-----
> - libtool.m4             | 1093 ++++++++++-----
> - ltmain.sh              | 2925 +++++++++++++++++++++++++++-------------
> - ltoptions.m4           |    2 +-
> - ltversion.m4           |   12 +-
> - lt~obsolete.m4         |    2 +-
> - opcodes/configure      | 1331 +++++++++++++-----
> - zlib/configure         | 1331 +++++++++++++-----
> - 15 files changed, 12067 insertions(+), 4525 deletions(-)
> + bfd/Makefile.in                     |    3 +
> + bfd/configure                       | 1333 +++++++++---
> + bfd/configure.ac                    |    2 +-
> + binutils/Makefile.in                |    3 +
> + binutils/configure                  | 1331 +++++++++---
> + gas/Makefile.in                     |    3 +
> + gas/configure                       | 1331 +++++++++---
> + gdbsupport/Makefile.in              |    1 +
> + gprof/Makefile.in                   |    3 +
> + gprof/configure                     | 1331 +++++++++---
> + gprofng/Makefile.in                 |    2 +
> + gprofng/configure                   | 1701 ++++++++++++----
> + gprofng/doc/Makefile.in             |    2 +
> + gprofng/gp-display-html/Makefile.in |    2 +
> + gprofng/libcollector/Makefile.in    |    2 +
> + gprofng/libcollector/configure      | 1703 ++++++++++++----
> + gprofng/src/Makefile.in             |    2 +
> + ld/Makefile.in                      |    3 +
> + ld/configure                        | 1704 ++++++++++++----
> + libbacktrace/Makefile.in            |    3 +
> + libbacktrace/configure              | 1331 +++++++++---
> + libctf/Makefile.in                  |    2 +
> + libctf/configure                    | 1330 +++++++++---
> + libtool.m4                          | 1093 ++++++----
> + ltmain.sh                           | 2925 ++++++++++++++++++---------
> + ltoptions.m4                        |    2 +-
> + ltversion.m4                        |   12 +-
> + lt~obsolete.m4                      |    2 +-
> + opcodes/Makefile.in                 |    3 +
> + opcodes/configure                   | 1331 +++++++++---
> + sim/Makefile.in                     |    3 +
> + zlib/Makefile.in                    |  204 +-
> + zlib/aclocal.m4                     |  218 +-
> + zlib/configure                      | 1554 +++++++++-----
> + 34 files changed, 14804 insertions(+), 5671 deletions(-)
>  
> +diff --git a/bfd/Makefile.in b/bfd/Makefile.in
> +index a26f74d7199..6edacdfeb0e 100644
> +--- a/bfd/Makefile.in
> ++++ b/bfd/Makefile.in
> +@@ -346,6 +346,7 @@ DATADIRNAME = @DATADIRNAME@
> + DEBUGDIR = @DEBUGDIR@
> + DEFS = @DEFS@
> + DEPDIR = @DEPDIR@
> ++DLLTOOL = @DLLTOOL@
> + DSYMUTIL = @DSYMUTIL@
> + DUMPBIN = @DUMPBIN@
> + ECHO_C = @ECHO_C@
> +@@ -380,6 +381,7 @@ LN_S = @LN_S@
> + LTLIBOBJS = @LTLIBOBJS@
> + MAINT = @MAINT@
> + MAKEINFO = @MAKEINFO@
> ++MANIFEST_TOOL = @MANIFEST_TOOL@
> + MKDIR_P = @MKDIR_P@
> + MKINSTALLDIRS = @MKINSTALLDIRS@
> + MSGFMT = @MSGFMT@
> +@@ -421,6 +423,7 @@ abs_builddir = @abs_builddir@
> + abs_srcdir = @abs_srcdir@
> + abs_top_builddir = @abs_top_builddir@
> + abs_top_srcdir = @abs_top_srcdir@
> ++ac_ct_AR = @ac_ct_AR@
> + ac_ct_CC = @ac_ct_CC@
> + ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
> + all_backends = @all_backends@
>  diff --git a/bfd/configure b/bfd/configure
> -index b23c9eebfd7..fb25d046cd2 100755
> +index 4f591b750d8..d90db11744b 100755
>  --- a/bfd/configure
>  +++ b/bfd/configure
> -@@ -707,6 +707,9 @@ OTOOL
> +@@ -702,6 +702,9 @@ OTOOL
>   LIPO
>   NMEDIT
>   DSYMUTIL
> @@ -40,7 +87,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   OBJDUMP
>   LN_S
>   NM
> -@@ -825,6 +828,7 @@ enable_static
> +@@ -820,6 +823,7 @@ enable_static
>   with_pic
>   enable_fast_install
>   with_gnu_ld
> @@ -48,7 +95,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   enable_libtool_lock
>   enable_plugins
>   enable_largefile
> -@@ -1509,6 +1513,8 @@ Optional Packages:
> +@@ -1504,6 +1508,8 @@ Optional Packages:
>     --with-pic              try to use only PIC/non-PIC objects [default=use
>                             both]
>     --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
> @@ -57,7 +104,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>     --with-mmap             try using mmap for BFD input files if available
>     --with-separate-debug-dir=DIR
>                             Look for global separate debug info in DIR
> -@@ -5029,8 +5035,8 @@ esac
> +@@ -5024,8 +5030,8 @@ esac
>   
>   
>   
> @@ -68,7 +115,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   
>   
>   
> -@@ -5070,7 +5076,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> +@@ -5065,7 +5071,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
>   $as_echo_n "checking how to print strings... " >&6; }
>   # Test print first, because it will be a builtin if present.
> @@ -77,7 +124,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>      test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
>     ECHO='print -r --'
>   elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
> -@@ -5757,8 +5763,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
> +@@ -5758,8 +5764,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
>   # Try some XSI features
>   xsi_shell=no
>   ( _lt_dummy="a/b/c"
> @@ -88,7 +135,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>       && eval 'test $(( 1 + 1 )) -eq 2 \
>       && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
>     && xsi_shell=yes
> -@@ -5807,6 +5813,80 @@ esac
> +@@ -5808,6 +5814,80 @@ esac
>   
>   
>   
> @@ -169,7 +216,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
>   $as_echo_n "checking for $LD option to reload object files... " >&6; }
>   if ${lt_cv_ld_reload_flag+:} false; then :
> -@@ -5823,6 +5903,11 @@ case $reload_flag in
> +@@ -5824,6 +5904,11 @@ case $reload_flag in
>   esac
>   reload_cmds='$LD$reload_flag -o $output$reload_objs'
>   case $host_os in
> @@ -181,7 +228,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>     darwin*)
>       if test "$GCC" = yes; then
>         reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
> -@@ -5991,7 +6076,8 @@ mingw* | pw32*)
> +@@ -5992,7 +6077,8 @@ mingw* | pw32*)
>       lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
>       lt_cv_file_magic_cmd='func_win32_libid'
>     else
> @@ -191,7 +238,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>       lt_cv_file_magic_cmd='$OBJDUMP -f'
>     fi
>     ;;
> -@@ -6145,6 +6231,21 @@ esac
> +@@ -6146,6 +6232,21 @@ esac
>   fi
>   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
>   $as_echo "$lt_cv_deplibs_check_method" >&6; }
> @@ -213,7 +260,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   file_magic_cmd=$lt_cv_file_magic_cmd
>   deplibs_check_method=$lt_cv_deplibs_check_method
>   test -z "$deplibs_check_method" && deplibs_check_method=unknown
> -@@ -6160,6 +6261,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
> +@@ -6161,6 +6262,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
>   
>   
>   
> @@ -371,7 +418,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   plugin_option=
>   plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
>   for plugin in $plugin_names; do
> -@@ -6174,8 +6426,10 @@ for plugin in $plugin_names; do
> +@@ -6175,8 +6427,10 @@ for plugin in $plugin_names; do
>   done
>   
>   if test -n "$ac_tool_prefix"; then
> @@ -384,7 +431,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_AR+:} false; then :
> -@@ -6191,7 +6445,7 @@ do
> +@@ -6192,7 +6446,7 @@ do
>     test -z "$as_dir" && as_dir=.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -393,7 +440,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -6211,11 +6465,15 @@ $as_echo "no" >&6; }
> +@@ -6212,11 +6466,15 @@ $as_echo "no" >&6; }
>   fi
>   
>   
> @@ -412,7 +459,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_ac_ct_AR+:} false; then :
> -@@ -6231,7 +6489,7 @@ do
> +@@ -6232,7 +6490,7 @@ do
>     test -z "$as_dir" && as_dir=.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -421,7 +468,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -6250,6 +6508,10 @@ else
> +@@ -6251,6 +6509,10 @@ else
>   $as_echo "no" >&6; }
>   fi
>   
> @@ -432,7 +479,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>     if test "x$ac_ct_AR" = x; then
>       AR="false"
>     else
> -@@ -6261,25 +6523,20 @@ ac_tool_warned=yes ;;
> +@@ -6262,25 +6524,20 @@ ac_tool_warned=yes ;;
>   esac
>       AR=$ac_ct_AR
>     fi
> @@ -468,7 +515,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   
>   
>   
> -@@ -6290,6 +6547,63 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
> +@@ -6291,6 +6548,63 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
>   
>   
>   
> @@ -532,7 +579,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   
>   if test -n "$ac_tool_prefix"; then
>     # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
> -@@ -6630,8 +6944,8 @@ esac
> +@@ -6631,8 +6945,8 @@ esac
>   lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
>   
>   # Transform an extracted symbol line into symbol name and symbol address
> @@ -543,7 +590,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   
>   # Handle CRLF in mingw tool chain
>   opt_cr=
> -@@ -6667,6 +6981,7 @@ for ac_symprfx in "" "_"; do
> +@@ -6668,6 +6982,7 @@ for ac_symprfx in "" "_"; do
>     else
>       lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
>     fi
> @@ -551,7 +598,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   
>     # Check to see that the pipe works correctly.
>     pipe_works=no
> -@@ -6708,6 +7023,18 @@ _LT_EOF
> +@@ -6709,6 +7024,18 @@ _LT_EOF
>         if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
>   	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
>   	  cat <<_LT_EOF > conftest.$ac_ext
> @@ -570,7 +617,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   #ifdef __cplusplus
>   extern "C" {
>   #endif
> -@@ -6719,7 +7046,7 @@ _LT_EOF
> +@@ -6720,7 +7047,7 @@ _LT_EOF
>   	  cat <<_LT_EOF >> conftest.$ac_ext
>   
>   /* The mapping between symbol names and symbols.  */
> @@ -579,7 +626,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>     const char *name;
>     void       *address;
>   }
> -@@ -6745,8 +7072,8 @@ static const void *lt_preloaded_setup() {
> +@@ -6746,8 +7073,8 @@ static const void *lt_preloaded_setup() {
>   _LT_EOF
>   	  # Now try linking the two files.
>   	  mv conftest.$ac_objext conftstm.$ac_objext
> @@ -590,7 +637,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   	  LIBS="conftstm.$ac_objext"
>   	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
>   	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
> -@@ -6756,8 +7083,8 @@ _LT_EOF
> +@@ -6757,8 +7084,8 @@ _LT_EOF
>     test $ac_status = 0; } && test -s conftest${ac_exeext}; then
>   	    pipe_works=yes
>   	  fi
> @@ -601,7 +648,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   	else
>   	  echo "cannot find nm_test_func in $nlist" >&5
>   	fi
> -@@ -6794,6 +7121,14 @@ else
> +@@ -6795,6 +7122,14 @@ else
>   $as_echo "ok" >&6; }
>   fi
>   
> @@ -616,7 +663,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   
>   
>   
> -@@ -6812,6 +7147,47 @@ fi
> +@@ -6813,6 +7148,47 @@ fi
>   
>   
>   
> @@ -664,7 +711,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   
>   
>   
> -@@ -7021,6 +7397,123 @@ esac
> +@@ -7022,6 +7398,123 @@ esac
>   
>   need_locks="$enable_libtool_lock"
>   
> @@ -788,7 +835,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   
>     case $host_os in
>       rhapsody* | darwin*)
> -@@ -7584,6 +8077,8 @@ _LT_EOF
> +@@ -7585,6 +8078,8 @@ _LT_EOF
>         $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
>         echo "$AR cru libconftest.a conftest.o" >&5
>         $AR cru libconftest.a conftest.o 2>&5
> @@ -797,7 +844,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>         cat > conftest.c << _LT_EOF
>   int main() { return 0;}
>   _LT_EOF
> -@@ -8135,8 +8630,6 @@ fi
> +@@ -8136,8 +8631,6 @@ fi
>   lt_prog_compiler_pic=
>   lt_prog_compiler_static=
>   
> @@ -806,7 +853,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   
>     if test "$GCC" = yes; then
>       lt_prog_compiler_wl='-Wl,'
> -@@ -8302,6 +8795,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -8303,6 +8796,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>   	lt_prog_compiler_pic='--shared'
>   	lt_prog_compiler_static='--static'
>   	;;
> @@ -819,7 +866,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>         pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
>           # Portland Group compilers (*not* the Pentium gcc compiler,
>   	# which looks to be a dead project)
> -@@ -8364,7 +8863,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -8365,7 +8864,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>         lt_prog_compiler_pic='-KPIC'
>         lt_prog_compiler_static='-Bstatic'
>         case $cc_basename in
> @@ -828,7 +875,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   	lt_prog_compiler_wl='-Qoption ld ';;
>         *)
>   	lt_prog_compiler_wl='-Wl,';;
> -@@ -8421,13 +8920,17 @@ case $host_os in
> +@@ -8422,13 +8921,17 @@ case $host_os in
>       lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
>       ;;
>   esac
> @@ -852,7 +899,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   
>   #
>   # Check to make sure the PIC flag actually works.
> -@@ -8488,6 +8991,11 @@ fi
> +@@ -8489,6 +8992,11 @@ fi
>   
>   
>   
> @@ -864,7 +911,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   #
>   # Check to make sure the static flag actually works.
>   #
> -@@ -8838,7 +9346,8 @@ _LT_EOF
> +@@ -8839,7 +9347,8 @@ _LT_EOF
>         allow_undefined_flag=unsupported
>         always_export_symbols=no
>         enable_shared_with_static_runtimes=yes
> @@ -874,7 +921,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   
>         if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
>           archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
> -@@ -8937,12 +9446,12 @@ _LT_EOF
> +@@ -8938,12 +9447,12 @@ _LT_EOF
>   	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
>   	  hardcode_libdir_flag_spec=
>   	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
> @@ -889,7 +936,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   	  fi
>   	  ;;
>   	esac
> -@@ -8956,8 +9465,8 @@ _LT_EOF
> +@@ -8957,8 +9466,8 @@ _LT_EOF
>   	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
>   	wlarc=
>         else
> @@ -900,7 +947,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>         fi
>         ;;
>   
> -@@ -8975,8 +9484,8 @@ _LT_EOF
> +@@ -8976,8 +9485,8 @@ _LT_EOF
>   
>   _LT_EOF
>         elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -911,7 +958,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>         else
>   	ld_shlibs=no
>         fi
> -@@ -9022,8 +9531,8 @@ _LT_EOF
> +@@ -9023,8 +9532,8 @@ _LT_EOF
>   
>       *)
>         if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -922,7 +969,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>         else
>   	ld_shlibs=no
>         fi
> -@@ -9153,7 +9662,13 @@ _LT_EOF
> +@@ -9154,7 +9663,13 @@ _LT_EOF
>   	allow_undefined_flag='-berok'
>           # Determine the default libpath from the value encoded in an
>           # empty executable.
> @@ -937,7 +984,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   /* end confdefs.h.  */
>   
>   int
> -@@ -9166,22 +9681,29 @@ main ()
> +@@ -9167,22 +9682,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>   
> @@ -980,7 +1027,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   
>           hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>           archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> -@@ -9193,7 +9715,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9194,7 +9716,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	else
>   	 # Determine the default libpath from the value encoded in an
>   	 # empty executable.
> @@ -995,7 +1042,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   /* end confdefs.h.  */
>   
>   int
> -@@ -9206,22 +9734,29 @@ main ()
> +@@ -9207,22 +9735,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>   
> @@ -1038,7 +1085,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   
>   	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>   	  # Warning - without using the other run time loading flags,
> -@@ -9266,20 +9801,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9267,20 +9802,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>         # Microsoft Visual C++.
>         # hardcode_libdir_flag_spec is actually meaningless, as there is
>         # no search path for DLLs.
> @@ -1116,7 +1163,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>         ;;
>   
>       darwin* | rhapsody*)
> -@@ -9340,7 +9918,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9341,7 +9919,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
>       freebsd* | dragonfly*)
> @@ -1125,7 +1172,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>         hardcode_libdir_flag_spec='-R$libdir'
>         hardcode_direct=yes
>         hardcode_shlibpath_var=no
> -@@ -9348,7 +9926,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9349,7 +9927,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       hpux9*)
>         if test "$GCC" = yes; then
> @@ -1134,7 +1181,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>         else
>   	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
>         fi
> -@@ -9364,7 +9942,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9365,7 +9943,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       hpux10*)
>         if test "$GCC" = yes && test "$with_gnu_ld" = no; then
> @@ -1143,7 +1190,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>         else
>   	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
>         fi
> -@@ -9388,10 +9966,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9389,10 +9967,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
>   	  ;;
>   	ia64*)
> @@ -1156,7 +1203,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   	  ;;
>   	esac
>         else
> -@@ -9470,23 +10048,36 @@ fi
> +@@ -9471,23 +10049,36 @@ fi
>   
>       irix5* | irix6* | nonstopux*)
>         if test "$GCC" = yes; then
> @@ -1201,7 +1248,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>         else
>   	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
>   	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
> -@@ -9571,7 +10162,7 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9572,7 +10163,7 @@ rm -f core conftest.err conftest.$ac_objext \
>       osf4* | osf5*)	# as osf3* with the addition of -msym flag
>         if test "$GCC" = yes; then
>   	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
> @@ -1210,7 +1257,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
>         else
>   	allow_undefined_flag=' -expect_unresolved \*'
> -@@ -9590,9 +10181,9 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9591,9 +10182,9 @@ rm -f core conftest.err conftest.$ac_objext \
>         no_undefined_flag=' -z defs'
>         if test "$GCC" = yes; then
>   	wlarc='${wl}'
> @@ -1222,7 +1269,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>         else
>   	case `$CC -V 2>&1` in
>   	*"Compilers 5.0"*)
> -@@ -10168,8 +10759,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -10169,8 +10760,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>     need_version=no
>     need_lib_prefix=no
>   
> @@ -1234,7 +1281,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>       library_names_spec='$libname.dll.a'
>       # DLL is installed to $(libdir)/../bin by postinstall_cmds
>       postinstall_cmds='base_file=`basename \${file}`~
> -@@ -10202,13 +10794,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -10203,13 +10795,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>         library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>         ;;
>       esac
> @@ -1307,16 +1354,16 @@ index b23c9eebfd7..fb25d046cd2 100755
>     # FIXME: first we should search . and the directory the executable is in
>     shlibpath_var=PATH
>     ;;
> -@@ -11086,7 +11736,7 @@ else
> +@@ -11087,7 +11737,7 @@ else
>     lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>     lt_status=$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 11089 "configure"
> +-#line 11090 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>   
>   #if HAVE_DLFCN_H
> -@@ -11130,10 +11780,10 @@ else
> +@@ -11131,10 +11781,10 @@ else
>   /* When -fvisbility=hidden is used, assume the code has been annotated
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -1329,16 +1376,16 @@ index b23c9eebfd7..fb25d046cd2 100755
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -11192,7 +11842,7 @@ else
> +@@ -11193,7 +11843,7 @@ else
>     lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>     lt_status=$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 11195 "configure"
> +-#line 11196 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>   
>   #if HAVE_DLFCN_H
> -@@ -11236,10 +11886,10 @@ else
> +@@ -11237,10 +11887,10 @@ else
>   /* When -fvisbility=hidden is used, assume the code has been annotated
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -1351,7 +1398,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -13224,7 +13874,7 @@ SHARED_LDFLAGS=
> +@@ -13225,7 +13875,7 @@ SHARED_LDFLAGS=
>   if test "$enable_shared" = "yes"; then
>     x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
>     if test -n "$x"; then
> @@ -1360,7 +1407,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>     fi
>   fi
>   
> -@@ -15879,13 +16529,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
> +@@ -15869,13 +16519,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
>   lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>   lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>   lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -1381,7 +1428,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>   RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>   old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
> -@@ -15900,14 +16557,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
> +@@ -15890,14 +16547,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
>   lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
> @@ -1400,7 +1447,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>   NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>   LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -15940,12 +16600,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
> +@@ -15930,12 +16590,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
>   hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
>   inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
>   link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
> @@ -1414,7 +1461,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
>   variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
>   need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
> -@@ -16000,8 +16660,13 @@ reload_flag \
> +@@ -15990,8 +16650,13 @@ reload_flag \
>   OBJDUMP \
>   deplibs_check_method \
>   file_magic_cmd \
> @@ -1428,7 +1475,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   STRIP \
>   RANLIB \
>   CC \
> -@@ -16011,12 +16676,14 @@ lt_cv_sys_global_symbol_pipe \
> +@@ -16001,12 +16666,14 @@ lt_cv_sys_global_symbol_pipe \
>   lt_cv_sys_global_symbol_to_cdecl \
>   lt_cv_sys_global_symbol_to_c_name_address \
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -1444,7 +1491,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   DSYMUTIL \
>   NMEDIT \
>   LIPO \
> -@@ -16032,7 +16699,6 @@ no_undefined_flag \
> +@@ -16022,7 +16689,6 @@ no_undefined_flag \
>   hardcode_libdir_flag_spec \
>   hardcode_libdir_flag_spec_ld \
>   hardcode_libdir_separator \
> @@ -1452,7 +1499,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   exclude_expsyms \
>   include_expsyms \
>   file_list_spec \
> -@@ -16068,6 +16734,7 @@ module_cmds \
> +@@ -16058,6 +16724,7 @@ module_cmds \
>   module_expsym_cmds \
>   export_symbols_cmds \
>   prelink_cmds \
> @@ -1460,7 +1507,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   postinstall_cmds \
>   postuninstall_cmds \
>   finish_cmds \
> -@@ -16837,7 +17504,8 @@ $as_echo X"$file" |
> +@@ -16826,7 +17493,8 @@ $as_echo X"$file" |
>   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>   #
>   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -1470,7 +1517,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   #   Written by Gordon Matzigkeit, 1996
>   #
>   #   This file is part of GNU Libtool.
> -@@ -16940,19 +17608,42 @@ SP2NL=$lt_lt_SP2NL
> +@@ -16929,19 +17597,42 @@ SP2NL=$lt_lt_SP2NL
>   # turn newlines into spaces.
>   NL2SP=$lt_lt_NL2SP
>   
> @@ -1514,7 +1561,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   # A symbol stripping program.
>   STRIP=$lt_STRIP
>   
> -@@ -16982,6 +17673,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
> +@@ -16971,6 +17662,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
>   # Transform the output of nm in a C name address pair when lib prefix is needed.
>   global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
>   
> @@ -1527,7 +1574,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   # The name of the directory that contains temporary libtool files.
>   objdir=$objdir
>   
> -@@ -16991,6 +17688,9 @@ MAGIC_CMD=$MAGIC_CMD
> +@@ -16980,6 +17677,9 @@ MAGIC_CMD=$MAGIC_CMD
>   # Must we lock files when doing compilation?
>   need_locks=$lt_need_locks
>   
> @@ -1537,7 +1584,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>   DSYMUTIL=$lt_DSYMUTIL
>   
> -@@ -17105,12 +17805,12 @@ with_gcc=$GCC
> +@@ -17094,12 +17794,12 @@ with_gcc=$GCC
>   # Compiler flag to turn off builtin functions.
>   no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
>   
> @@ -1553,7 +1600,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   # Compiler flag to prevent dynamic linking.
>   link_static_flag=$lt_lt_prog_compiler_static
>   
> -@@ -17197,9 +17897,6 @@ inherit_rpath=$inherit_rpath
> +@@ -17186,9 +17886,6 @@ inherit_rpath=$inherit_rpath
>   # Whether libtool must link a program against all its dependency libraries.
>   link_all_deplibs=$link_all_deplibs
>   
> @@ -1563,7 +1610,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   # Set to "yes" if exported symbols are required.
>   always_export_symbols=$always_export_symbols
>   
> -@@ -17215,6 +17912,9 @@ include_expsyms=$lt_include_expsyms
> +@@ -17204,6 +17901,9 @@ include_expsyms=$lt_include_expsyms
>   # Commands necessary for linking programs (against libraries) with templates.
>   prelink_cmds=$lt_prelink_cmds
>   
> @@ -1573,7 +1620,7 @@ index b23c9eebfd7..fb25d046cd2 100755
>   # Specify filename containing input files.
>   file_list_spec=$lt_file_list_spec
>   
> -@@ -17247,210 +17947,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
> +@@ -17236,210 +17936,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
>     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>     # text mode, it properly converts lines to CR/LF.  This bash problem
>     # is reportedly fixed, but why not run on old versions too?
> @@ -1948,10 +1995,10 @@ index b23c9eebfd7..fb25d046cd2 100755
>     chmod +x "$ofile"
>   
>  diff --git a/bfd/configure.ac b/bfd/configure.ac
> -index a9078965c40..22b5b7ea567 100644
> +index 6146efb5ae3..73e5e03d016 100644
>  --- a/bfd/configure.ac
>  +++ b/bfd/configure.ac
> -@@ -303,7 +303,7 @@ changequote(,)dnl
> +@@ -282,7 +282,7 @@ changequote(,)dnl
>     x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
>   changequote([,])dnl
>     if test -n "$x"; then
> @@ -1960,11 +2007,39 @@ index a9078965c40..22b5b7ea567 100644
>     fi
>   fi
>   
> +diff --git a/binutils/Makefile.in b/binutils/Makefile.in
> +index 78d32b350e3..ad4f2de7358 100644
> +--- a/binutils/Makefile.in
> ++++ b/binutils/Makefile.in
> +@@ -492,6 +492,7 @@ DEBUGINFOD_LIBS = @DEBUGINFOD_LIBS@
> + DEFS = @DEFS@
> + DEMANGLER_NAME = @DEMANGLER_NAME@
> + DEPDIR = @DEPDIR@
> ++DLLTOOL = @DLLTOOL@
> + DLLTOOL_DEFS = @DLLTOOL_DEFS@
> + DSYMUTIL = @DSYMUTIL@
> + DUMPBIN = @DUMPBIN@
> +@@ -533,6 +534,7 @@ LTLIBICONV = @LTLIBICONV@
> + LTLIBOBJS = @LTLIBOBJS@
> + MAINT = @MAINT@
> + MAKEINFO = @MAKEINFO@
> ++MANIFEST_TOOL = @MANIFEST_TOOL@
> + MKDIR_P = @MKDIR_P@
> + MKINSTALLDIRS = @MKINSTALLDIRS@
> + MSGFMT = @MSGFMT@
> +@@ -579,6 +581,7 @@ abs_builddir = @abs_builddir@
> + abs_srcdir = @abs_srcdir@
> + abs_top_builddir = @abs_top_builddir@
> + abs_top_srcdir = @abs_top_srcdir@
> ++ac_ct_AR = @ac_ct_AR@
> + ac_ct_CC = @ac_ct_CC@
> + ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
> + am__include = @am__include@
>  diff --git a/binutils/configure b/binutils/configure
> -index 8cde216cb1f..15f3f4eb874 100755
> +index 149815542f9..43952bde405 100755
>  --- a/binutils/configure
>  +++ b/binutils/configure
> -@@ -696,8 +696,11 @@ OTOOL
> +@@ -698,8 +698,11 @@ OTOOL
>   LIPO
>   NMEDIT
>   DSYMUTIL
> @@ -1976,7 +2051,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   OBJDUMP
>   LN_S
>   NM
> -@@ -814,6 +817,7 @@ enable_static
> +@@ -816,6 +819,7 @@ enable_static
>   with_pic
>   enable_fast_install
>   with_gnu_ld
> @@ -1984,7 +2059,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   enable_libtool_lock
>   enable_plugins
>   enable_largefile
> -@@ -1509,6 +1513,8 @@ Optional Packages:
> +@@ -1514,6 +1518,8 @@ Optional Packages:
>     --with-pic              try to use only PIC/non-PIC objects [default=use
>                             both]
>     --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
> @@ -1993,7 +2068,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>     --with-debuginfod       Enable debuginfo lookups with debuginfod
>                             (auto/yes/no)
>     --with-system-zlib      use installed libz
> -@@ -4883,8 +4889,8 @@ esac
> +@@ -4893,8 +4899,8 @@ esac
>   
>   
>   
> @@ -2004,7 +2079,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   
>   
>   
> -@@ -4924,7 +4930,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> +@@ -4934,7 +4940,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
>   $as_echo_n "checking how to print strings... " >&6; }
>   # Test print first, because it will be a builtin if present.
> @@ -2013,7 +2088,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>      test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
>     ECHO='print -r --'
>   elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
> -@@ -5611,8 +5617,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
> +@@ -5627,8 +5633,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
>   # Try some XSI features
>   xsi_shell=no
>   ( _lt_dummy="a/b/c"
> @@ -2024,7 +2099,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>       && eval 'test $(( 1 + 1 )) -eq 2 \
>       && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
>     && xsi_shell=yes
> -@@ -5661,6 +5667,80 @@ esac
> +@@ -5677,6 +5683,80 @@ esac
>   
>   
>   
> @@ -2105,7 +2180,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
>   $as_echo_n "checking for $LD option to reload object files... " >&6; }
>   if ${lt_cv_ld_reload_flag+:} false; then :
> -@@ -5677,6 +5757,11 @@ case $reload_flag in
> +@@ -5693,6 +5773,11 @@ case $reload_flag in
>   esac
>   reload_cmds='$LD$reload_flag -o $output$reload_objs'
>   case $host_os in
> @@ -2117,7 +2192,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>     darwin*)
>       if test "$GCC" = yes; then
>         reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
> -@@ -5845,7 +5930,8 @@ mingw* | pw32*)
> +@@ -5861,7 +5946,8 @@ mingw* | pw32*)
>       lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
>       lt_cv_file_magic_cmd='func_win32_libid'
>     else
> @@ -2127,7 +2202,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>       lt_cv_file_magic_cmd='$OBJDUMP -f'
>     fi
>     ;;
> -@@ -5999,6 +6085,21 @@ esac
> +@@ -6015,6 +6101,21 @@ esac
>   fi
>   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
>   $as_echo "$lt_cv_deplibs_check_method" >&6; }
> @@ -2149,7 +2224,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   file_magic_cmd=$lt_cv_file_magic_cmd
>   deplibs_check_method=$lt_cv_deplibs_check_method
>   test -z "$deplibs_check_method" && deplibs_check_method=unknown
> -@@ -6014,6 +6115,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
> +@@ -6030,6 +6131,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
>   
>   
>   
> @@ -2307,7 +2382,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   plugin_option=
>   plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
>   for plugin in $plugin_names; do
> -@@ -6028,8 +6280,10 @@ for plugin in $plugin_names; do
> +@@ -6044,8 +6296,10 @@ for plugin in $plugin_names; do
>   done
>   
>   if test -n "$ac_tool_prefix"; then
> @@ -2320,7 +2395,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_AR+:} false; then :
> -@@ -6045,7 +6299,7 @@ do
> +@@ -6061,7 +6315,7 @@ do
>     test -z "$as_dir" && as_dir=.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -2329,7 +2404,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -6065,11 +6319,15 @@ $as_echo "no" >&6; }
> +@@ -6081,11 +6335,15 @@ $as_echo "no" >&6; }
>   fi
>   
>   
> @@ -2348,7 +2423,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_ac_ct_AR+:} false; then :
> -@@ -6085,7 +6343,7 @@ do
> +@@ -6101,7 +6359,7 @@ do
>     test -z "$as_dir" && as_dir=.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -2357,7 +2432,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -6104,6 +6362,10 @@ else
> +@@ -6120,6 +6378,10 @@ else
>   $as_echo "no" >&6; }
>   fi
>   
> @@ -2368,7 +2443,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>     if test "x$ac_ct_AR" = x; then
>       AR="false"
>     else
> -@@ -6115,29 +6377,81 @@ ac_tool_warned=yes ;;
> +@@ -6131,29 +6393,81 @@ ac_tool_warned=yes ;;
>   esac
>       AR=$ac_ct_AR
>     fi
> @@ -2465,7 +2540,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   
>   
>   
> -@@ -6484,8 +6798,8 @@ esac
> +@@ -6500,8 +6814,8 @@ esac
>   lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
>   
>   # Transform an extracted symbol line into symbol name and symbol address
> @@ -2476,7 +2551,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   
>   # Handle CRLF in mingw tool chain
>   opt_cr=
> -@@ -6521,6 +6835,7 @@ for ac_symprfx in "" "_"; do
> +@@ -6537,6 +6851,7 @@ for ac_symprfx in "" "_"; do
>     else
>       lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
>     fi
> @@ -2484,7 +2559,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   
>     # Check to see that the pipe works correctly.
>     pipe_works=no
> -@@ -6562,6 +6877,18 @@ _LT_EOF
> +@@ -6578,6 +6893,18 @@ _LT_EOF
>         if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
>   	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
>   	  cat <<_LT_EOF > conftest.$ac_ext
> @@ -2503,7 +2578,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   #ifdef __cplusplus
>   extern "C" {
>   #endif
> -@@ -6573,7 +6900,7 @@ _LT_EOF
> +@@ -6589,7 +6916,7 @@ _LT_EOF
>   	  cat <<_LT_EOF >> conftest.$ac_ext
>   
>   /* The mapping between symbol names and symbols.  */
> @@ -2512,7 +2587,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>     const char *name;
>     void       *address;
>   }
> -@@ -6599,8 +6926,8 @@ static const void *lt_preloaded_setup() {
> +@@ -6615,8 +6942,8 @@ static const void *lt_preloaded_setup() {
>   _LT_EOF
>   	  # Now try linking the two files.
>   	  mv conftest.$ac_objext conftstm.$ac_objext
> @@ -2523,7 +2598,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   	  LIBS="conftstm.$ac_objext"
>   	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
>   	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
> -@@ -6610,8 +6937,8 @@ _LT_EOF
> +@@ -6626,8 +6953,8 @@ _LT_EOF
>     test $ac_status = 0; } && test -s conftest${ac_exeext}; then
>   	    pipe_works=yes
>   	  fi
> @@ -2534,7 +2609,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   	else
>   	  echo "cannot find nm_test_func in $nlist" >&5
>   	fi
> -@@ -6648,6 +6975,19 @@ else
> +@@ -6664,6 +6991,19 @@ else
>   $as_echo "ok" >&6; }
>   fi
>   
> @@ -2554,7 +2629,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   
>   
>   
> -@@ -6664,6 +7004,42 @@ fi
> +@@ -6680,6 +7020,42 @@ fi
>   
>   
>   
> @@ -2597,7 +2672,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   
>   
>   
> -@@ -6875,6 +7251,123 @@ esac
> +@@ -6891,6 +7267,123 @@ esac
>   
>   need_locks="$enable_libtool_lock"
>   
> @@ -2721,7 +2796,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   
>     case $host_os in
>       rhapsody* | darwin*)
> -@@ -7438,6 +7931,8 @@ _LT_EOF
> +@@ -7454,6 +7947,8 @@ _LT_EOF
>         $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
>         echo "$AR cru libconftest.a conftest.o" >&5
>         $AR cru libconftest.a conftest.o 2>&5
> @@ -2730,7 +2805,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>         cat > conftest.c << _LT_EOF
>   int main() { return 0;}
>   _LT_EOF
> -@@ -8020,8 +8515,6 @@ fi
> +@@ -8036,8 +8531,6 @@ fi
>   lt_prog_compiler_pic=
>   lt_prog_compiler_static=
>   
> @@ -2739,7 +2814,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   
>     if test "$GCC" = yes; then
>       lt_prog_compiler_wl='-Wl,'
> -@@ -8187,6 +8680,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -8203,6 +8696,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>   	lt_prog_compiler_pic='--shared'
>   	lt_prog_compiler_static='--static'
>   	;;
> @@ -2752,7 +2827,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>         pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
>           # Portland Group compilers (*not* the Pentium gcc compiler,
>   	# which looks to be a dead project)
> -@@ -8249,7 +8748,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -8265,7 +8764,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>         lt_prog_compiler_pic='-KPIC'
>         lt_prog_compiler_static='-Bstatic'
>         case $cc_basename in
> @@ -2761,7 +2836,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   	lt_prog_compiler_wl='-Qoption ld ';;
>         *)
>   	lt_prog_compiler_wl='-Wl,';;
> -@@ -8306,13 +8805,17 @@ case $host_os in
> +@@ -8322,13 +8821,17 @@ case $host_os in
>       lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
>       ;;
>   esac
> @@ -2785,7 +2860,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   
>   #
>   # Check to make sure the PIC flag actually works.
> -@@ -8373,6 +8876,11 @@ fi
> +@@ -8389,6 +8892,11 @@ fi
>   
>   
>   
> @@ -2797,7 +2872,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   #
>   # Check to make sure the static flag actually works.
>   #
> -@@ -8723,7 +9231,8 @@ _LT_EOF
> +@@ -8739,7 +9247,8 @@ _LT_EOF
>         allow_undefined_flag=unsupported
>         always_export_symbols=no
>         enable_shared_with_static_runtimes=yes
> @@ -2807,7 +2882,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   
>         if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
>           archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
> -@@ -8822,12 +9331,12 @@ _LT_EOF
> +@@ -8838,12 +9347,12 @@ _LT_EOF
>   	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
>   	  hardcode_libdir_flag_spec=
>   	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
> @@ -2822,7 +2897,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   	  fi
>   	  ;;
>   	esac
> -@@ -8841,8 +9350,8 @@ _LT_EOF
> +@@ -8857,8 +9366,8 @@ _LT_EOF
>   	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
>   	wlarc=
>         else
> @@ -2833,7 +2908,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>         fi
>         ;;
>   
> -@@ -8860,8 +9369,8 @@ _LT_EOF
> +@@ -8876,8 +9385,8 @@ _LT_EOF
>   
>   _LT_EOF
>         elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -2844,7 +2919,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>         else
>   	ld_shlibs=no
>         fi
> -@@ -8907,8 +9416,8 @@ _LT_EOF
> +@@ -8923,8 +9432,8 @@ _LT_EOF
>   
>       *)
>         if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -2855,7 +2930,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>         else
>   	ld_shlibs=no
>         fi
> -@@ -9038,7 +9547,13 @@ _LT_EOF
> +@@ -9054,7 +9563,13 @@ _LT_EOF
>   	allow_undefined_flag='-berok'
>           # Determine the default libpath from the value encoded in an
>           # empty executable.
> @@ -2870,7 +2945,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   /* end confdefs.h.  */
>   
>   int
> -@@ -9051,22 +9566,29 @@ main ()
> +@@ -9067,22 +9582,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>   
> @@ -2913,7 +2988,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   
>           hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>           archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> -@@ -9078,7 +9600,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9094,7 +9616,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	else
>   	 # Determine the default libpath from the value encoded in an
>   	 # empty executable.
> @@ -2928,7 +3003,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   /* end confdefs.h.  */
>   
>   int
> -@@ -9091,22 +9619,29 @@ main ()
> +@@ -9107,22 +9635,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>   
> @@ -2971,7 +3046,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   
>   	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>   	  # Warning - without using the other run time loading flags,
> -@@ -9151,20 +9686,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9167,20 +9702,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>         # Microsoft Visual C++.
>         # hardcode_libdir_flag_spec is actually meaningless, as there is
>         # no search path for DLLs.
> @@ -3049,7 +3124,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>         ;;
>   
>       darwin* | rhapsody*)
> -@@ -9225,7 +9803,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9241,7 +9819,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
>       freebsd* | dragonfly*)
> @@ -3058,7 +3133,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>         hardcode_libdir_flag_spec='-R$libdir'
>         hardcode_direct=yes
>         hardcode_shlibpath_var=no
> -@@ -9233,7 +9811,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9249,7 +9827,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       hpux9*)
>         if test "$GCC" = yes; then
> @@ -3067,7 +3142,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>         else
>   	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
>         fi
> -@@ -9249,7 +9827,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9265,7 +9843,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       hpux10*)
>         if test "$GCC" = yes && test "$with_gnu_ld" = no; then
> @@ -3076,7 +3151,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>         else
>   	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
>         fi
> -@@ -9273,10 +9851,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9289,10 +9867,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
>   	  ;;
>   	ia64*)
> @@ -3089,7 +3164,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   	  ;;
>   	esac
>         else
> -@@ -9355,23 +9933,36 @@ fi
> +@@ -9371,23 +9949,36 @@ fi
>   
>       irix5* | irix6* | nonstopux*)
>         if test "$GCC" = yes; then
> @@ -3134,7 +3209,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>         else
>   	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
>   	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
> -@@ -9456,7 +10047,7 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9472,7 +10063,7 @@ rm -f core conftest.err conftest.$ac_objext \
>       osf4* | osf5*)	# as osf3* with the addition of -msym flag
>         if test "$GCC" = yes; then
>   	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
> @@ -3143,7 +3218,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
>         else
>   	allow_undefined_flag=' -expect_unresolved \*'
> -@@ -9475,9 +10066,9 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9491,9 +10082,9 @@ rm -f core conftest.err conftest.$ac_objext \
>         no_undefined_flag=' -z defs'
>         if test "$GCC" = yes; then
>   	wlarc='${wl}'
> @@ -3155,7 +3230,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>         else
>   	case `$CC -V 2>&1` in
>   	*"Compilers 5.0"*)
> -@@ -10053,8 +10644,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -10069,8 +10660,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>     need_version=no
>     need_lib_prefix=no
>   
> @@ -3167,7 +3242,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>       library_names_spec='$libname.dll.a'
>       # DLL is installed to $(libdir)/../bin by postinstall_cmds
>       postinstall_cmds='base_file=`basename \${file}`~
> -@@ -10087,13 +10679,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -10103,13 +10695,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>         library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>         ;;
>       esac
> @@ -3240,16 +3315,16 @@ index 8cde216cb1f..15f3f4eb874 100755
>     # FIXME: first we should search . and the directory the executable is in
>     shlibpath_var=PATH
>     ;;
> -@@ -10971,7 +11621,7 @@ else
> +@@ -10987,7 +11637,7 @@ else
>     lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>     lt_status=$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 10974 "configure"
> +-#line 10990 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>   
>   #if HAVE_DLFCN_H
> -@@ -11015,10 +11665,10 @@ else
> +@@ -11031,10 +11681,10 @@ else
>   /* When -fvisbility=hidden is used, assume the code has been annotated
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -3262,16 +3337,16 @@ index 8cde216cb1f..15f3f4eb874 100755
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -11077,7 +11727,7 @@ else
> +@@ -11093,7 +11743,7 @@ else
>     lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>     lt_status=$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 11080 "configure"
> +-#line 11096 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>   
>   #if HAVE_DLFCN_H
> -@@ -11121,10 +11771,10 @@ else
> +@@ -11137,10 +11787,10 @@ else
>   /* When -fvisbility=hidden is used, assume the code has been annotated
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -3284,7 +3359,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -15505,13 +16155,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
> +@@ -15642,13 +16292,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
>   lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>   lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>   lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -3305,7 +3380,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>   RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>   old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
> -@@ -15526,14 +16183,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
> +@@ -15663,14 +16320,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
>   lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
> @@ -3324,7 +3399,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>   NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>   LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -15566,12 +16226,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
> +@@ -15703,12 +16363,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
>   hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
>   inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
>   link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
> @@ -3338,7 +3413,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
>   variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
>   need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
> -@@ -15626,8 +16286,13 @@ reload_flag \
> +@@ -15763,8 +16423,13 @@ reload_flag \
>   OBJDUMP \
>   deplibs_check_method \
>   file_magic_cmd \
> @@ -3352,7 +3427,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   STRIP \
>   RANLIB \
>   CC \
> -@@ -15637,12 +16302,14 @@ lt_cv_sys_global_symbol_pipe \
> +@@ -15774,12 +16439,14 @@ lt_cv_sys_global_symbol_pipe \
>   lt_cv_sys_global_symbol_to_cdecl \
>   lt_cv_sys_global_symbol_to_c_name_address \
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -3368,7 +3443,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   DSYMUTIL \
>   NMEDIT \
>   LIPO \
> -@@ -15658,7 +16325,6 @@ no_undefined_flag \
> +@@ -15795,7 +16462,6 @@ no_undefined_flag \
>   hardcode_libdir_flag_spec \
>   hardcode_libdir_flag_spec_ld \
>   hardcode_libdir_separator \
> @@ -3376,7 +3451,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   exclude_expsyms \
>   include_expsyms \
>   file_list_spec \
> -@@ -15694,6 +16360,7 @@ module_cmds \
> +@@ -15831,6 +16497,7 @@ module_cmds \
>   module_expsym_cmds \
>   export_symbols_cmds \
>   prelink_cmds \
> @@ -3384,7 +3459,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   postinstall_cmds \
>   postuninstall_cmds \
>   finish_cmds \
> -@@ -16459,7 +17126,8 @@ $as_echo X"$file" |
> +@@ -16596,7 +17263,8 @@ $as_echo X"$file" |
>   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>   #
>   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -3394,7 +3469,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   #   Written by Gordon Matzigkeit, 1996
>   #
>   #   This file is part of GNU Libtool.
> -@@ -16562,19 +17230,42 @@ SP2NL=$lt_lt_SP2NL
> +@@ -16699,19 +17367,42 @@ SP2NL=$lt_lt_SP2NL
>   # turn newlines into spaces.
>   NL2SP=$lt_lt_NL2SP
>   
> @@ -3438,7 +3513,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   # A symbol stripping program.
>   STRIP=$lt_STRIP
>   
> -@@ -16604,6 +17295,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
> +@@ -16741,6 +17432,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
>   # Transform the output of nm in a C name address pair when lib prefix is needed.
>   global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
>   
> @@ -3451,7 +3526,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   # The name of the directory that contains temporary libtool files.
>   objdir=$objdir
>   
> -@@ -16613,6 +17310,9 @@ MAGIC_CMD=$MAGIC_CMD
> +@@ -16750,6 +17447,9 @@ MAGIC_CMD=$MAGIC_CMD
>   # Must we lock files when doing compilation?
>   need_locks=$lt_need_locks
>   
> @@ -3461,7 +3536,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>   DSYMUTIL=$lt_DSYMUTIL
>   
> -@@ -16727,12 +17427,12 @@ with_gcc=$GCC
> +@@ -16864,12 +17564,12 @@ with_gcc=$GCC
>   # Compiler flag to turn off builtin functions.
>   no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
>   
> @@ -3477,7 +3552,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   # Compiler flag to prevent dynamic linking.
>   link_static_flag=$lt_lt_prog_compiler_static
>   
> -@@ -16819,9 +17519,6 @@ inherit_rpath=$inherit_rpath
> +@@ -16956,9 +17656,6 @@ inherit_rpath=$inherit_rpath
>   # Whether libtool must link a program against all its dependency libraries.
>   link_all_deplibs=$link_all_deplibs
>   
> @@ -3487,7 +3562,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   # Set to "yes" if exported symbols are required.
>   always_export_symbols=$always_export_symbols
>   
> -@@ -16837,6 +17534,9 @@ include_expsyms=$lt_include_expsyms
> +@@ -16974,6 +17671,9 @@ include_expsyms=$lt_include_expsyms
>   # Commands necessary for linking programs (against libraries) with templates.
>   prelink_cmds=$lt_prelink_cmds
>   
> @@ -3497,7 +3572,7 @@ index 8cde216cb1f..15f3f4eb874 100755
>   # Specify filename containing input files.
>   file_list_spec=$lt_file_list_spec
>   
> -@@ -16869,210 +17569,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
> +@@ -17006,210 +17706,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
>     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>     # text mode, it properly converts lines to CR/LF.  This bash problem
>     # is reportedly fixed, but why not run on old versions too?
> @@ -3871,8 +3946,36 @@ index 8cde216cb1f..15f3f4eb874 100755
>       (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
>     chmod +x "$ofile"
>   
> +diff --git a/gas/Makefile.in b/gas/Makefile.in
> +index c57d78f82c4..da370b21855 100644
> +--- a/gas/Makefile.in
> ++++ b/gas/Makefile.in
> +@@ -373,6 +373,7 @@ CYGPATH_W = @CYGPATH_W@
> + DATADIRNAME = @DATADIRNAME@
> + DEFS = @DEFS@
> + DEPDIR = @DEPDIR@
> ++DLLTOOL = @DLLTOOL@
> + DSYMUTIL = @DSYMUTIL@
> + DUMPBIN = @DUMPBIN@
> + ECHO_C = @ECHO_C@
> +@@ -409,6 +410,7 @@ LN_S = @LN_S@
> + LTLIBOBJS = @LTLIBOBJS@
> + MAINT = @MAINT@
> + MAKEINFO = @MAKEINFO@
> ++MANIFEST_TOOL = @MANIFEST_TOOL@
> + MKDIR_P = @MKDIR_P@
> + MKINSTALLDIRS = @MKINSTALLDIRS@
> + MSGFMT = @MSGFMT@
> +@@ -447,6 +449,7 @@ abs_builddir = @abs_builddir@
> + abs_srcdir = @abs_srcdir@
> + abs_top_builddir = @abs_top_builddir@
> + abs_top_srcdir = @abs_top_srcdir@
> ++ac_ct_AR = @ac_ct_AR@
> + ac_ct_CC = @ac_ct_CC@
> + ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
> + am__include = @am__include@
>  diff --git a/gas/configure b/gas/configure
> -index dc6a6682aa4..10364bd81da 100755
> +index 12c16faefd9..11b5127bf3a 100755
>  --- a/gas/configure
>  +++ b/gas/configure
>  @@ -681,8 +681,11 @@ OTOOL
> @@ -3924,7 +4027,7 @@ index dc6a6682aa4..10364bd81da 100755
>      test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
>     ECHO='print -r --'
>   elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
> -@@ -5336,8 +5342,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
> +@@ -5342,8 +5348,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
>   # Try some XSI features
>   xsi_shell=no
>   ( _lt_dummy="a/b/c"
> @@ -3935,7 +4038,7 @@ index dc6a6682aa4..10364bd81da 100755
>       && eval 'test $(( 1 + 1 )) -eq 2 \
>       && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
>     && xsi_shell=yes
> -@@ -5386,6 +5392,80 @@ esac
> +@@ -5392,6 +5398,80 @@ esac
>   
>   
>   
> @@ -4016,7 +4119,7 @@ index dc6a6682aa4..10364bd81da 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
>   $as_echo_n "checking for $LD option to reload object files... " >&6; }
>   if ${lt_cv_ld_reload_flag+:} false; then :
> -@@ -5402,6 +5482,11 @@ case $reload_flag in
> +@@ -5408,6 +5488,11 @@ case $reload_flag in
>   esac
>   reload_cmds='$LD$reload_flag -o $output$reload_objs'
>   case $host_os in
> @@ -4028,7 +4131,7 @@ index dc6a6682aa4..10364bd81da 100755
>     darwin*)
>       if test "$GCC" = yes; then
>         reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
> -@@ -5570,7 +5655,8 @@ mingw* | pw32*)
> +@@ -5576,7 +5661,8 @@ mingw* | pw32*)
>       lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
>       lt_cv_file_magic_cmd='func_win32_libid'
>     else
> @@ -4038,7 +4141,7 @@ index dc6a6682aa4..10364bd81da 100755
>       lt_cv_file_magic_cmd='$OBJDUMP -f'
>     fi
>     ;;
> -@@ -5724,6 +5810,21 @@ esac
> +@@ -5730,6 +5816,21 @@ esac
>   fi
>   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
>   $as_echo "$lt_cv_deplibs_check_method" >&6; }
> @@ -4060,7 +4163,7 @@ index dc6a6682aa4..10364bd81da 100755
>   file_magic_cmd=$lt_cv_file_magic_cmd
>   deplibs_check_method=$lt_cv_deplibs_check_method
>   test -z "$deplibs_check_method" && deplibs_check_method=unknown
> -@@ -5739,6 +5840,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
> +@@ -5745,6 +5846,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
>   
>   
>   
> @@ -4218,7 +4321,7 @@ index dc6a6682aa4..10364bd81da 100755
>   plugin_option=
>   plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
>   for plugin in $plugin_names; do
> -@@ -5753,8 +6005,10 @@ for plugin in $plugin_names; do
> +@@ -5759,8 +6011,10 @@ for plugin in $plugin_names; do
>   done
>   
>   if test -n "$ac_tool_prefix"; then
> @@ -4231,7 +4334,7 @@ index dc6a6682aa4..10364bd81da 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_AR+:} false; then :
> -@@ -5770,7 +6024,7 @@ do
> +@@ -5776,7 +6030,7 @@ do
>     test -z "$as_dir" && as_dir=.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -4240,7 +4343,7 @@ index dc6a6682aa4..10364bd81da 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -5790,11 +6044,15 @@ $as_echo "no" >&6; }
> +@@ -5796,11 +6050,15 @@ $as_echo "no" >&6; }
>   fi
>   
>   
> @@ -4259,7 +4362,7 @@ index dc6a6682aa4..10364bd81da 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_ac_ct_AR+:} false; then :
> -@@ -5810,7 +6068,7 @@ do
> +@@ -5816,7 +6074,7 @@ do
>     test -z "$as_dir" && as_dir=.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -4268,7 +4371,7 @@ index dc6a6682aa4..10364bd81da 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -5829,6 +6087,10 @@ else
> +@@ -5835,6 +6093,10 @@ else
>   $as_echo "no" >&6; }
>   fi
>   
> @@ -4279,7 +4382,7 @@ index dc6a6682aa4..10364bd81da 100755
>     if test "x$ac_ct_AR" = x; then
>       AR="false"
>     else
> -@@ -5840,29 +6102,81 @@ ac_tool_warned=yes ;;
> +@@ -5846,29 +6108,81 @@ ac_tool_warned=yes ;;
>   esac
>       AR=$ac_ct_AR
>     fi
> @@ -4376,7 +4479,7 @@ index dc6a6682aa4..10364bd81da 100755
>   
>   
>   
> -@@ -6209,8 +6523,8 @@ esac
> +@@ -6215,8 +6529,8 @@ esac
>   lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
>   
>   # Transform an extracted symbol line into symbol name and symbol address
> @@ -4387,7 +4490,7 @@ index dc6a6682aa4..10364bd81da 100755
>   
>   # Handle CRLF in mingw tool chain
>   opt_cr=
> -@@ -6246,6 +6560,7 @@ for ac_symprfx in "" "_"; do
> +@@ -6252,6 +6566,7 @@ for ac_symprfx in "" "_"; do
>     else
>       lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
>     fi
> @@ -4395,7 +4498,7 @@ index dc6a6682aa4..10364bd81da 100755
>   
>     # Check to see that the pipe works correctly.
>     pipe_works=no
> -@@ -6287,6 +6602,18 @@ _LT_EOF
> +@@ -6293,6 +6608,18 @@ _LT_EOF
>         if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
>   	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
>   	  cat <<_LT_EOF > conftest.$ac_ext
> @@ -4414,7 +4517,7 @@ index dc6a6682aa4..10364bd81da 100755
>   #ifdef __cplusplus
>   extern "C" {
>   #endif
> -@@ -6298,7 +6625,7 @@ _LT_EOF
> +@@ -6304,7 +6631,7 @@ _LT_EOF
>   	  cat <<_LT_EOF >> conftest.$ac_ext
>   
>   /* The mapping between symbol names and symbols.  */
> @@ -4423,7 +4526,7 @@ index dc6a6682aa4..10364bd81da 100755
>     const char *name;
>     void       *address;
>   }
> -@@ -6324,8 +6651,8 @@ static const void *lt_preloaded_setup() {
> +@@ -6330,8 +6657,8 @@ static const void *lt_preloaded_setup() {
>   _LT_EOF
>   	  # Now try linking the two files.
>   	  mv conftest.$ac_objext conftstm.$ac_objext
> @@ -4434,7 +4537,7 @@ index dc6a6682aa4..10364bd81da 100755
>   	  LIBS="conftstm.$ac_objext"
>   	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
>   	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
> -@@ -6335,8 +6662,8 @@ _LT_EOF
> +@@ -6341,8 +6668,8 @@ _LT_EOF
>     test $ac_status = 0; } && test -s conftest${ac_exeext}; then
>   	    pipe_works=yes
>   	  fi
> @@ -4445,7 +4548,7 @@ index dc6a6682aa4..10364bd81da 100755
>   	else
>   	  echo "cannot find nm_test_func in $nlist" >&5
>   	fi
> -@@ -6373,6 +6700,19 @@ else
> +@@ -6379,6 +6706,19 @@ else
>   $as_echo "ok" >&6; }
>   fi
>   
> @@ -4465,7 +4568,7 @@ index dc6a6682aa4..10364bd81da 100755
>   
>   
>   
> -@@ -6389,6 +6729,42 @@ fi
> +@@ -6395,6 +6735,42 @@ fi
>   
>   
>   
> @@ -4508,7 +4611,7 @@ index dc6a6682aa4..10364bd81da 100755
>   
>   
>   
> -@@ -6600,6 +6976,123 @@ esac
> +@@ -6606,6 +6982,123 @@ esac
>   
>   need_locks="$enable_libtool_lock"
>   
> @@ -4632,7 +4735,7 @@ index dc6a6682aa4..10364bd81da 100755
>   
>     case $host_os in
>       rhapsody* | darwin*)
> -@@ -7163,6 +7656,8 @@ _LT_EOF
> +@@ -7169,6 +7662,8 @@ _LT_EOF
>         $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
>         echo "$AR cru libconftest.a conftest.o" >&5
>         $AR cru libconftest.a conftest.o 2>&5
> @@ -4641,7 +4744,7 @@ index dc6a6682aa4..10364bd81da 100755
>         cat > conftest.c << _LT_EOF
>   int main() { return 0;}
>   _LT_EOF
> -@@ -7745,8 +8240,6 @@ fi
> +@@ -7751,8 +8246,6 @@ fi
>   lt_prog_compiler_pic=
>   lt_prog_compiler_static=
>   
> @@ -4650,7 +4753,7 @@ index dc6a6682aa4..10364bd81da 100755
>   
>     if test "$GCC" = yes; then
>       lt_prog_compiler_wl='-Wl,'
> -@@ -7912,6 +8405,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -7918,6 +8411,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>   	lt_prog_compiler_pic='--shared'
>   	lt_prog_compiler_static='--static'
>   	;;
> @@ -4663,7 +4766,7 @@ index dc6a6682aa4..10364bd81da 100755
>         pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
>           # Portland Group compilers (*not* the Pentium gcc compiler,
>   	# which looks to be a dead project)
> -@@ -7974,7 +8473,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -7980,7 +8479,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>         lt_prog_compiler_pic='-KPIC'
>         lt_prog_compiler_static='-Bstatic'
>         case $cc_basename in
> @@ -4672,7 +4775,7 @@ index dc6a6682aa4..10364bd81da 100755
>   	lt_prog_compiler_wl='-Qoption ld ';;
>         *)
>   	lt_prog_compiler_wl='-Wl,';;
> -@@ -8031,13 +8530,17 @@ case $host_os in
> +@@ -8037,13 +8536,17 @@ case $host_os in
>       lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
>       ;;
>   esac
> @@ -4696,7 +4799,7 @@ index dc6a6682aa4..10364bd81da 100755
>   
>   #
>   # Check to make sure the PIC flag actually works.
> -@@ -8098,6 +8601,11 @@ fi
> +@@ -8104,6 +8607,11 @@ fi
>   
>   
>   
> @@ -4708,7 +4811,7 @@ index dc6a6682aa4..10364bd81da 100755
>   #
>   # Check to make sure the static flag actually works.
>   #
> -@@ -8448,7 +8956,8 @@ _LT_EOF
> +@@ -8454,7 +8962,8 @@ _LT_EOF
>         allow_undefined_flag=unsupported
>         always_export_symbols=no
>         enable_shared_with_static_runtimes=yes
> @@ -4718,7 +4821,7 @@ index dc6a6682aa4..10364bd81da 100755
>   
>         if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
>           archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
> -@@ -8547,12 +9056,12 @@ _LT_EOF
> +@@ -8553,12 +9062,12 @@ _LT_EOF
>   	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
>   	  hardcode_libdir_flag_spec=
>   	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
> @@ -4733,7 +4836,7 @@ index dc6a6682aa4..10364bd81da 100755
>   	  fi
>   	  ;;
>   	esac
> -@@ -8566,8 +9075,8 @@ _LT_EOF
> +@@ -8572,8 +9081,8 @@ _LT_EOF
>   	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
>   	wlarc=
>         else
> @@ -4744,7 +4847,7 @@ index dc6a6682aa4..10364bd81da 100755
>         fi
>         ;;
>   
> -@@ -8585,8 +9094,8 @@ _LT_EOF
> +@@ -8591,8 +9100,8 @@ _LT_EOF
>   
>   _LT_EOF
>         elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -4755,7 +4858,7 @@ index dc6a6682aa4..10364bd81da 100755
>         else
>   	ld_shlibs=no
>         fi
> -@@ -8632,8 +9141,8 @@ _LT_EOF
> +@@ -8638,8 +9147,8 @@ _LT_EOF
>   
>       *)
>         if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -4766,7 +4869,7 @@ index dc6a6682aa4..10364bd81da 100755
>         else
>   	ld_shlibs=no
>         fi
> -@@ -8763,7 +9272,13 @@ _LT_EOF
> +@@ -8769,7 +9278,13 @@ _LT_EOF
>   	allow_undefined_flag='-berok'
>           # Determine the default libpath from the value encoded in an
>           # empty executable.
> @@ -4781,7 +4884,7 @@ index dc6a6682aa4..10364bd81da 100755
>   /* end confdefs.h.  */
>   
>   int
> -@@ -8776,22 +9291,29 @@ main ()
> +@@ -8782,22 +9297,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>   
> @@ -4824,7 +4927,7 @@ index dc6a6682aa4..10364bd81da 100755
>   
>           hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>           archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> -@@ -8803,7 +9325,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8809,7 +9331,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	else
>   	 # Determine the default libpath from the value encoded in an
>   	 # empty executable.
> @@ -4839,7 +4942,7 @@ index dc6a6682aa4..10364bd81da 100755
>   /* end confdefs.h.  */
>   
>   int
> -@@ -8816,22 +9344,29 @@ main ()
> +@@ -8822,22 +9350,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>   
> @@ -4882,7 +4985,7 @@ index dc6a6682aa4..10364bd81da 100755
>   
>   	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>   	  # Warning - without using the other run time loading flags,
> -@@ -8876,20 +9411,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8882,20 +9417,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>         # Microsoft Visual C++.
>         # hardcode_libdir_flag_spec is actually meaningless, as there is
>         # no search path for DLLs.
> @@ -4960,7 +5063,7 @@ index dc6a6682aa4..10364bd81da 100755
>         ;;
>   
>       darwin* | rhapsody*)
> -@@ -8950,7 +9528,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8956,7 +9534,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
>       freebsd* | dragonfly*)
> @@ -4969,7 +5072,7 @@ index dc6a6682aa4..10364bd81da 100755
>         hardcode_libdir_flag_spec='-R$libdir'
>         hardcode_direct=yes
>         hardcode_shlibpath_var=no
> -@@ -8958,7 +9536,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8964,7 +9542,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       hpux9*)
>         if test "$GCC" = yes; then
> @@ -4978,7 +5081,7 @@ index dc6a6682aa4..10364bd81da 100755
>         else
>   	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
>         fi
> -@@ -8974,7 +9552,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8980,7 +9558,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       hpux10*)
>         if test "$GCC" = yes && test "$with_gnu_ld" = no; then
> @@ -4987,7 +5090,7 @@ index dc6a6682aa4..10364bd81da 100755
>         else
>   	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
>         fi
> -@@ -8998,10 +9576,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9004,10 +9582,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
>   	  ;;
>   	ia64*)
> @@ -5000,7 +5103,7 @@ index dc6a6682aa4..10364bd81da 100755
>   	  ;;
>   	esac
>         else
> -@@ -9080,23 +9658,36 @@ fi
> +@@ -9086,23 +9664,36 @@ fi
>   
>       irix5* | irix6* | nonstopux*)
>         if test "$GCC" = yes; then
> @@ -5045,7 +5148,7 @@ index dc6a6682aa4..10364bd81da 100755
>         else
>   	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
>   	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
> -@@ -9181,7 +9772,7 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9187,7 +9778,7 @@ rm -f core conftest.err conftest.$ac_objext \
>       osf4* | osf5*)	# as osf3* with the addition of -msym flag
>         if test "$GCC" = yes; then
>   	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
> @@ -5054,7 +5157,7 @@ index dc6a6682aa4..10364bd81da 100755
>   	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
>         else
>   	allow_undefined_flag=' -expect_unresolved \*'
> -@@ -9200,9 +9791,9 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9206,9 +9797,9 @@ rm -f core conftest.err conftest.$ac_objext \
>         no_undefined_flag=' -z defs'
>         if test "$GCC" = yes; then
>   	wlarc='${wl}'
> @@ -5066,7 +5169,7 @@ index dc6a6682aa4..10364bd81da 100755
>         else
>   	case `$CC -V 2>&1` in
>   	*"Compilers 5.0"*)
> -@@ -9778,8 +10369,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -9784,8 +10375,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>     need_version=no
>     need_lib_prefix=no
>   
> @@ -5078,7 +5181,7 @@ index dc6a6682aa4..10364bd81da 100755
>       library_names_spec='$libname.dll.a'
>       # DLL is installed to $(libdir)/../bin by postinstall_cmds
>       postinstall_cmds='base_file=`basename \${file}`~
> -@@ -9812,13 +10404,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -9818,13 +10410,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>         library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>         ;;
>       esac
> @@ -5151,16 +5254,16 @@ index dc6a6682aa4..10364bd81da 100755
>     # FIXME: first we should search . and the directory the executable is in
>     shlibpath_var=PATH
>     ;;
> -@@ -10696,7 +11346,7 @@ else
> +@@ -10702,7 +11352,7 @@ else
>     lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>     lt_status=$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 10699 "configure"
> +-#line 10705 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>   
>   #if HAVE_DLFCN_H
> -@@ -10740,10 +11390,10 @@ else
> +@@ -10746,10 +11396,10 @@ else
>   /* When -fvisbility=hidden is used, assume the code has been annotated
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -5173,16 +5276,16 @@ index dc6a6682aa4..10364bd81da 100755
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -10802,7 +11452,7 @@ else
> +@@ -10808,7 +11458,7 @@ else
>     lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>     lt_status=$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 10805 "configure"
> +-#line 10811 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>   
>   #if HAVE_DLFCN_H
> -@@ -10846,10 +11496,10 @@ else
> +@@ -10852,10 +11502,10 @@ else
>   /* When -fvisbility=hidden is used, assume the code has been annotated
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -5195,7 +5298,7 @@ index dc6a6682aa4..10364bd81da 100755
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -14832,13 +15482,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
> +@@ -14834,13 +15484,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
>   lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>   lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>   lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -5216,7 +5319,7 @@ index dc6a6682aa4..10364bd81da 100755
>   STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>   RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>   old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
> -@@ -14853,14 +15510,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
> +@@ -14855,14 +15512,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
>   lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
> @@ -5235,7 +5338,7 @@ index dc6a6682aa4..10364bd81da 100755
>   DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>   NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>   LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -14893,12 +15553,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
> +@@ -14895,12 +15555,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
>   hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
>   inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
>   link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
> @@ -5249,7 +5352,7 @@ index dc6a6682aa4..10364bd81da 100755
>   file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
>   variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
>   need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
> -@@ -14953,8 +15613,13 @@ reload_flag \
> +@@ -14955,8 +15615,13 @@ reload_flag \
>   OBJDUMP \
>   deplibs_check_method \
>   file_magic_cmd \
> @@ -5263,7 +5366,7 @@ index dc6a6682aa4..10364bd81da 100755
>   STRIP \
>   RANLIB \
>   CC \
> -@@ -14964,12 +15629,14 @@ lt_cv_sys_global_symbol_pipe \
> +@@ -14966,12 +15631,14 @@ lt_cv_sys_global_symbol_pipe \
>   lt_cv_sys_global_symbol_to_cdecl \
>   lt_cv_sys_global_symbol_to_c_name_address \
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -5279,7 +5382,7 @@ index dc6a6682aa4..10364bd81da 100755
>   DSYMUTIL \
>   NMEDIT \
>   LIPO \
> -@@ -14985,7 +15652,6 @@ no_undefined_flag \
> +@@ -14987,7 +15654,6 @@ no_undefined_flag \
>   hardcode_libdir_flag_spec \
>   hardcode_libdir_flag_spec_ld \
>   hardcode_libdir_separator \
> @@ -5287,7 +5390,7 @@ index dc6a6682aa4..10364bd81da 100755
>   exclude_expsyms \
>   include_expsyms \
>   file_list_spec \
> -@@ -15021,6 +15687,7 @@ module_cmds \
> +@@ -15023,6 +15689,7 @@ module_cmds \
>   module_expsym_cmds \
>   export_symbols_cmds \
>   prelink_cmds \
> @@ -5295,7 +5398,7 @@ index dc6a6682aa4..10364bd81da 100755
>   postinstall_cmds \
>   postuninstall_cmds \
>   finish_cmds \
> -@@ -15793,7 +16460,8 @@ $as_echo X"$file" |
> +@@ -15795,7 +16462,8 @@ $as_echo X"$file" |
>   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>   #
>   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -5305,7 +5408,7 @@ index dc6a6682aa4..10364bd81da 100755
>   #   Written by Gordon Matzigkeit, 1996
>   #
>   #   This file is part of GNU Libtool.
> -@@ -15896,19 +16564,42 @@ SP2NL=$lt_lt_SP2NL
> +@@ -15898,19 +16566,42 @@ SP2NL=$lt_lt_SP2NL
>   # turn newlines into spaces.
>   NL2SP=$lt_lt_NL2SP
>   
> @@ -5349,7 +5452,7 @@ index dc6a6682aa4..10364bd81da 100755
>   # A symbol stripping program.
>   STRIP=$lt_STRIP
>   
> -@@ -15938,6 +16629,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
> +@@ -15940,6 +16631,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
>   # Transform the output of nm in a C name address pair when lib prefix is needed.
>   global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
>   
> @@ -5362,7 +5465,7 @@ index dc6a6682aa4..10364bd81da 100755
>   # The name of the directory that contains temporary libtool files.
>   objdir=$objdir
>   
> -@@ -15947,6 +16644,9 @@ MAGIC_CMD=$MAGIC_CMD
> +@@ -15949,6 +16646,9 @@ MAGIC_CMD=$MAGIC_CMD
>   # Must we lock files when doing compilation?
>   need_locks=$lt_need_locks
>   
> @@ -5372,7 +5475,7 @@ index dc6a6682aa4..10364bd81da 100755
>   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>   DSYMUTIL=$lt_DSYMUTIL
>   
> -@@ -16061,12 +16761,12 @@ with_gcc=$GCC
> +@@ -16063,12 +16763,12 @@ with_gcc=$GCC
>   # Compiler flag to turn off builtin functions.
>   no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
>   
> @@ -5388,7 +5491,7 @@ index dc6a6682aa4..10364bd81da 100755
>   # Compiler flag to prevent dynamic linking.
>   link_static_flag=$lt_lt_prog_compiler_static
>   
> -@@ -16153,9 +16853,6 @@ inherit_rpath=$inherit_rpath
> +@@ -16155,9 +16855,6 @@ inherit_rpath=$inherit_rpath
>   # Whether libtool must link a program against all its dependency libraries.
>   link_all_deplibs=$link_all_deplibs
>   
> @@ -5398,7 +5501,7 @@ index dc6a6682aa4..10364bd81da 100755
>   # Set to "yes" if exported symbols are required.
>   always_export_symbols=$always_export_symbols
>   
> -@@ -16171,6 +16868,9 @@ include_expsyms=$lt_include_expsyms
> +@@ -16173,6 +16870,9 @@ include_expsyms=$lt_include_expsyms
>   # Commands necessary for linking programs (against libraries) with templates.
>   prelink_cmds=$lt_prelink_cmds
>   
> @@ -5408,7 +5511,7 @@ index dc6a6682aa4..10364bd81da 100755
>   # Specify filename containing input files.
>   file_list_spec=$lt_file_list_spec
>   
> -@@ -16203,210 +16903,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
> +@@ -16205,210 +16905,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
>     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>     # text mode, it properly converts lines to CR/LF.  This bash problem
>     # is reportedly fixed, but why not run on old versions too?
> @@ -5782,8 +5885,48 @@ index dc6a6682aa4..10364bd81da 100755
>       (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
>     chmod +x "$ofile"
>   
> +diff --git a/gdbsupport/Makefile.in b/gdbsupport/Makefile.in
> +index bdceff3b56a..6aadae41031 100644
> +--- a/gdbsupport/Makefile.in
> ++++ b/gdbsupport/Makefile.in
> +@@ -233,6 +233,7 @@ CATOBJEXT = @CATOBJEXT@
> + CC = @CC@
> + CCDEPMODE = @CCDEPMODE@
> + CFLAGS = @CFLAGS@
> ++CONFIG_STATUS_DEPENDENCIES = @CONFIG_STATUS_DEPENDENCIES@
> + CPP = @CPP@
> + CPPFLAGS = @CPPFLAGS@
> + CXX = @CXX@
> +diff --git a/gprof/Makefile.in b/gprof/Makefile.in
> +index 5ef5ece74a9..9d7ce8b62b2 100644
> +--- a/gprof/Makefile.in
> ++++ b/gprof/Makefile.in
> +@@ -321,6 +321,7 @@ CYGPATH_W = @CYGPATH_W@
> + DATADIRNAME = @DATADIRNAME@
> + DEFS = @DEFS@
> + DEPDIR = @DEPDIR@
> ++DLLTOOL = @DLLTOOL@
> + DSYMUTIL = @DSYMUTIL@
> + DUMPBIN = @DUMPBIN@
> + ECHO_C = @ECHO_C@
> +@@ -352,6 +353,7 @@ LN_S = @LN_S@
> + LTLIBOBJS = @LTLIBOBJS@
> + MAINT = @MAINT@
> + MAKEINFO = @MAKEINFO@
> ++MANIFEST_TOOL = @MANIFEST_TOOL@
> + MKDIR_P = @MKDIR_P@
> + MKINSTALLDIRS = @MKINSTALLDIRS@
> + MSGFMT = @MSGFMT@
> +@@ -387,6 +389,7 @@ abs_builddir = @abs_builddir@
> + abs_srcdir = @abs_srcdir@
> + abs_top_builddir = @abs_top_builddir@
> + abs_top_srcdir = @abs_top_srcdir@
> ++ac_ct_AR = @ac_ct_AR@
> + ac_ct_CC = @ac_ct_CC@
> + ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
> + am__include = @am__include@
>  diff --git a/gprof/configure b/gprof/configure
> -index a7f788f0411..e7703613024 100755
> +index 5a59f1c1d0e..2506887d3b0 100755
>  --- a/gprof/configure
>  +++ b/gprof/configure
>  @@ -663,8 +663,11 @@ OTOOL
> @@ -5835,7 +5978,7 @@ index a7f788f0411..e7703613024 100755
>      test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
>     ECHO='print -r --'
>   elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
> -@@ -5238,8 +5244,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
> +@@ -5244,8 +5250,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
>   # Try some XSI features
>   xsi_shell=no
>   ( _lt_dummy="a/b/c"
> @@ -5846,7 +5989,7 @@ index a7f788f0411..e7703613024 100755
>       && eval 'test $(( 1 + 1 )) -eq 2 \
>       && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
>     && xsi_shell=yes
> -@@ -5288,6 +5294,80 @@ esac
> +@@ -5294,6 +5300,80 @@ esac
>   
>   
>   
> @@ -5927,7 +6070,7 @@ index a7f788f0411..e7703613024 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
>   $as_echo_n "checking for $LD option to reload object files... " >&6; }
>   if ${lt_cv_ld_reload_flag+:} false; then :
> -@@ -5304,6 +5384,11 @@ case $reload_flag in
> +@@ -5310,6 +5390,11 @@ case $reload_flag in
>   esac
>   reload_cmds='$LD$reload_flag -o $output$reload_objs'
>   case $host_os in
> @@ -5939,7 +6082,7 @@ index a7f788f0411..e7703613024 100755
>     darwin*)
>       if test "$GCC" = yes; then
>         reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
> -@@ -5472,7 +5557,8 @@ mingw* | pw32*)
> +@@ -5478,7 +5563,8 @@ mingw* | pw32*)
>       lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
>       lt_cv_file_magic_cmd='func_win32_libid'
>     else
> @@ -5949,7 +6092,7 @@ index a7f788f0411..e7703613024 100755
>       lt_cv_file_magic_cmd='$OBJDUMP -f'
>     fi
>     ;;
> -@@ -5626,6 +5712,21 @@ esac
> +@@ -5632,6 +5718,21 @@ esac
>   fi
>   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
>   $as_echo "$lt_cv_deplibs_check_method" >&6; }
> @@ -5971,7 +6114,7 @@ index a7f788f0411..e7703613024 100755
>   file_magic_cmd=$lt_cv_file_magic_cmd
>   deplibs_check_method=$lt_cv_deplibs_check_method
>   test -z "$deplibs_check_method" && deplibs_check_method=unknown
> -@@ -5641,6 +5742,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
> +@@ -5647,6 +5748,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
>   
>   
>   
> @@ -6129,7 +6272,7 @@ index a7f788f0411..e7703613024 100755
>   plugin_option=
>   plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
>   for plugin in $plugin_names; do
> -@@ -5655,8 +5907,10 @@ for plugin in $plugin_names; do
> +@@ -5661,8 +5913,10 @@ for plugin in $plugin_names; do
>   done
>   
>   if test -n "$ac_tool_prefix"; then
> @@ -6142,7 +6285,7 @@ index a7f788f0411..e7703613024 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_AR+:} false; then :
> -@@ -5672,7 +5926,7 @@ do
> +@@ -5678,7 +5932,7 @@ do
>     test -z "$as_dir" && as_dir=.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -6151,7 +6294,7 @@ index a7f788f0411..e7703613024 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -5692,11 +5946,15 @@ $as_echo "no" >&6; }
> +@@ -5698,11 +5952,15 @@ $as_echo "no" >&6; }
>   fi
>   
>   
> @@ -6170,7 +6313,7 @@ index a7f788f0411..e7703613024 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_ac_ct_AR+:} false; then :
> -@@ -5712,7 +5970,7 @@ do
> +@@ -5718,7 +5976,7 @@ do
>     test -z "$as_dir" && as_dir=.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -6179,7 +6322,7 @@ index a7f788f0411..e7703613024 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -5731,6 +5989,10 @@ else
> +@@ -5737,6 +5995,10 @@ else
>   $as_echo "no" >&6; }
>   fi
>   
> @@ -6190,7 +6333,7 @@ index a7f788f0411..e7703613024 100755
>     if test "x$ac_ct_AR" = x; then
>       AR="false"
>     else
> -@@ -5742,25 +6004,19 @@ ac_tool_warned=yes ;;
> +@@ -5748,25 +6010,19 @@ ac_tool_warned=yes ;;
>   esac
>       AR=$ac_ct_AR
>     fi
> @@ -6225,7 +6368,7 @@ index a7f788f0411..e7703613024 100755
>   
>   
>   
> -@@ -5772,6 +6028,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
> +@@ -5778,6 +6034,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
>   
>   
>   
> @@ -6290,7 +6433,7 @@ index a7f788f0411..e7703613024 100755
>   if test -n "$ac_tool_prefix"; then
>     # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
>   set dummy ${ac_tool_prefix}strip; ac_word=$2
> -@@ -6111,8 +6425,8 @@ esac
> +@@ -6117,8 +6431,8 @@ esac
>   lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
>   
>   # Transform an extracted symbol line into symbol name and symbol address
> @@ -6301,7 +6444,7 @@ index a7f788f0411..e7703613024 100755
>   
>   # Handle CRLF in mingw tool chain
>   opt_cr=
> -@@ -6148,6 +6462,7 @@ for ac_symprfx in "" "_"; do
> +@@ -6154,6 +6468,7 @@ for ac_symprfx in "" "_"; do
>     else
>       lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
>     fi
> @@ -6309,7 +6452,7 @@ index a7f788f0411..e7703613024 100755
>   
>     # Check to see that the pipe works correctly.
>     pipe_works=no
> -@@ -6189,6 +6504,18 @@ _LT_EOF
> +@@ -6195,6 +6510,18 @@ _LT_EOF
>         if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
>   	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
>   	  cat <<_LT_EOF > conftest.$ac_ext
> @@ -6328,7 +6471,7 @@ index a7f788f0411..e7703613024 100755
>   #ifdef __cplusplus
>   extern "C" {
>   #endif
> -@@ -6200,7 +6527,7 @@ _LT_EOF
> +@@ -6206,7 +6533,7 @@ _LT_EOF
>   	  cat <<_LT_EOF >> conftest.$ac_ext
>   
>   /* The mapping between symbol names and symbols.  */
> @@ -6337,7 +6480,7 @@ index a7f788f0411..e7703613024 100755
>     const char *name;
>     void       *address;
>   }
> -@@ -6226,8 +6553,8 @@ static const void *lt_preloaded_setup() {
> +@@ -6232,8 +6559,8 @@ static const void *lt_preloaded_setup() {
>   _LT_EOF
>   	  # Now try linking the two files.
>   	  mv conftest.$ac_objext conftstm.$ac_objext
> @@ -6348,7 +6491,7 @@ index a7f788f0411..e7703613024 100755
>   	  LIBS="conftstm.$ac_objext"
>   	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
>   	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
> -@@ -6237,8 +6564,8 @@ _LT_EOF
> +@@ -6243,8 +6570,8 @@ _LT_EOF
>     test $ac_status = 0; } && test -s conftest${ac_exeext}; then
>   	    pipe_works=yes
>   	  fi
> @@ -6359,7 +6502,7 @@ index a7f788f0411..e7703613024 100755
>   	else
>   	  echo "cannot find nm_test_func in $nlist" >&5
>   	fi
> -@@ -6275,6 +6602,18 @@ else
> +@@ -6281,6 +6608,18 @@ else
>   $as_echo "ok" >&6; }
>   fi
>   
> @@ -6378,7 +6521,7 @@ index a7f788f0411..e7703613024 100755
>   
>   
>   
> -@@ -6291,6 +6630,43 @@ fi
> +@@ -6297,6 +6636,43 @@ fi
>   
>   
>   
> @@ -6422,7 +6565,7 @@ index a7f788f0411..e7703613024 100755
>   
>   
>   
> -@@ -6502,6 +6878,123 @@ esac
> +@@ -6508,6 +6884,123 @@ esac
>   
>   need_locks="$enable_libtool_lock"
>   
> @@ -6546,7 +6689,7 @@ index a7f788f0411..e7703613024 100755
>   
>     case $host_os in
>       rhapsody* | darwin*)
> -@@ -7065,6 +7558,8 @@ _LT_EOF
> +@@ -7071,6 +7564,8 @@ _LT_EOF
>         $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
>         echo "$AR cru libconftest.a conftest.o" >&5
>         $AR cru libconftest.a conftest.o 2>&5
> @@ -6555,7 +6698,7 @@ index a7f788f0411..e7703613024 100755
>         cat > conftest.c << _LT_EOF
>   int main() { return 0;}
>   _LT_EOF
> -@@ -7647,8 +8142,6 @@ fi
> +@@ -7653,8 +8148,6 @@ fi
>   lt_prog_compiler_pic=
>   lt_prog_compiler_static=
>   
> @@ -6564,7 +6707,7 @@ index a7f788f0411..e7703613024 100755
>   
>     if test "$GCC" = yes; then
>       lt_prog_compiler_wl='-Wl,'
> -@@ -7814,6 +8307,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -7820,6 +8313,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>   	lt_prog_compiler_pic='--shared'
>   	lt_prog_compiler_static='--static'
>   	;;
> @@ -6577,7 +6720,7 @@ index a7f788f0411..e7703613024 100755
>         pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
>           # Portland Group compilers (*not* the Pentium gcc compiler,
>   	# which looks to be a dead project)
> -@@ -7876,7 +8375,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -7882,7 +8381,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>         lt_prog_compiler_pic='-KPIC'
>         lt_prog_compiler_static='-Bstatic'
>         case $cc_basename in
> @@ -6586,7 +6729,7 @@ index a7f788f0411..e7703613024 100755
>   	lt_prog_compiler_wl='-Qoption ld ';;
>         *)
>   	lt_prog_compiler_wl='-Wl,';;
> -@@ -7933,13 +8432,17 @@ case $host_os in
> +@@ -7939,13 +8438,17 @@ case $host_os in
>       lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
>       ;;
>   esac
> @@ -6610,7 +6753,7 @@ index a7f788f0411..e7703613024 100755
>   
>   #
>   # Check to make sure the PIC flag actually works.
> -@@ -8000,6 +8503,11 @@ fi
> +@@ -8006,6 +8509,11 @@ fi
>   
>   
>   
> @@ -6622,7 +6765,7 @@ index a7f788f0411..e7703613024 100755
>   #
>   # Check to make sure the static flag actually works.
>   #
> -@@ -8350,7 +8858,8 @@ _LT_EOF
> +@@ -8356,7 +8864,8 @@ _LT_EOF
>         allow_undefined_flag=unsupported
>         always_export_symbols=no
>         enable_shared_with_static_runtimes=yes
> @@ -6632,7 +6775,7 @@ index a7f788f0411..e7703613024 100755
>   
>         if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
>           archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
> -@@ -8449,12 +8958,12 @@ _LT_EOF
> +@@ -8455,12 +8964,12 @@ _LT_EOF
>   	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
>   	  hardcode_libdir_flag_spec=
>   	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
> @@ -6647,7 +6790,7 @@ index a7f788f0411..e7703613024 100755
>   	  fi
>   	  ;;
>   	esac
> -@@ -8468,8 +8977,8 @@ _LT_EOF
> +@@ -8474,8 +8983,8 @@ _LT_EOF
>   	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
>   	wlarc=
>         else
> @@ -6658,7 +6801,7 @@ index a7f788f0411..e7703613024 100755
>         fi
>         ;;
>   
> -@@ -8487,8 +8996,8 @@ _LT_EOF
> +@@ -8493,8 +9002,8 @@ _LT_EOF
>   
>   _LT_EOF
>         elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -6669,7 +6812,7 @@ index a7f788f0411..e7703613024 100755
>         else
>   	ld_shlibs=no
>         fi
> -@@ -8534,8 +9043,8 @@ _LT_EOF
> +@@ -8540,8 +9049,8 @@ _LT_EOF
>   
>       *)
>         if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -6680,7 +6823,7 @@ index a7f788f0411..e7703613024 100755
>         else
>   	ld_shlibs=no
>         fi
> -@@ -8665,7 +9174,13 @@ _LT_EOF
> +@@ -8671,7 +9180,13 @@ _LT_EOF
>   	allow_undefined_flag='-berok'
>           # Determine the default libpath from the value encoded in an
>           # empty executable.
> @@ -6695,7 +6838,7 @@ index a7f788f0411..e7703613024 100755
>   /* end confdefs.h.  */
>   
>   int
> -@@ -8678,22 +9193,29 @@ main ()
> +@@ -8684,22 +9199,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>   
> @@ -6738,7 +6881,7 @@ index a7f788f0411..e7703613024 100755
>   
>           hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>           archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> -@@ -8705,7 +9227,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8711,7 +9233,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	else
>   	 # Determine the default libpath from the value encoded in an
>   	 # empty executable.
> @@ -6753,7 +6896,7 @@ index a7f788f0411..e7703613024 100755
>   /* end confdefs.h.  */
>   
>   int
> -@@ -8718,22 +9246,29 @@ main ()
> +@@ -8724,22 +9252,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>   
> @@ -6796,7 +6939,7 @@ index a7f788f0411..e7703613024 100755
>   
>   	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>   	  # Warning - without using the other run time loading flags,
> -@@ -8778,20 +9313,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8784,20 +9319,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>         # Microsoft Visual C++.
>         # hardcode_libdir_flag_spec is actually meaningless, as there is
>         # no search path for DLLs.
> @@ -6874,7 +7017,7 @@ index a7f788f0411..e7703613024 100755
>         ;;
>   
>       darwin* | rhapsody*)
> -@@ -8852,7 +9430,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8858,7 +9436,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
>       freebsd* | dragonfly*)
> @@ -6883,7 +7026,7 @@ index a7f788f0411..e7703613024 100755
>         hardcode_libdir_flag_spec='-R$libdir'
>         hardcode_direct=yes
>         hardcode_shlibpath_var=no
> -@@ -8860,7 +9438,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8866,7 +9444,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       hpux9*)
>         if test "$GCC" = yes; then
> @@ -6892,7 +7035,7 @@ index a7f788f0411..e7703613024 100755
>         else
>   	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
>         fi
> -@@ -8876,7 +9454,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8882,7 +9460,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       hpux10*)
>         if test "$GCC" = yes && test "$with_gnu_ld" = no; then
> @@ -6901,7 +7044,7 @@ index a7f788f0411..e7703613024 100755
>         else
>   	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
>         fi
> -@@ -8900,10 +9478,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8906,10 +9484,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
>   	  ;;
>   	ia64*)
> @@ -6914,7 +7057,7 @@ index a7f788f0411..e7703613024 100755
>   	  ;;
>   	esac
>         else
> -@@ -8982,23 +9560,36 @@ fi
> +@@ -8988,23 +9566,36 @@ fi
>   
>       irix5* | irix6* | nonstopux*)
>         if test "$GCC" = yes; then
> @@ -6959,7 +7102,7 @@ index a7f788f0411..e7703613024 100755
>         else
>   	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
>   	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
> -@@ -9083,7 +9674,7 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9089,7 +9680,7 @@ rm -f core conftest.err conftest.$ac_objext \
>       osf4* | osf5*)	# as osf3* with the addition of -msym flag
>         if test "$GCC" = yes; then
>   	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
> @@ -6968,7 +7111,7 @@ index a7f788f0411..e7703613024 100755
>   	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
>         else
>   	allow_undefined_flag=' -expect_unresolved \*'
> -@@ -9102,9 +9693,9 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9108,9 +9699,9 @@ rm -f core conftest.err conftest.$ac_objext \
>         no_undefined_flag=' -z defs'
>         if test "$GCC" = yes; then
>   	wlarc='${wl}'
> @@ -6980,7 +7123,7 @@ index a7f788f0411..e7703613024 100755
>         else
>   	case `$CC -V 2>&1` in
>   	*"Compilers 5.0"*)
> -@@ -9680,8 +10271,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -9686,8 +10277,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>     need_version=no
>     need_lib_prefix=no
>   
> @@ -6992,7 +7135,7 @@ index a7f788f0411..e7703613024 100755
>       library_names_spec='$libname.dll.a'
>       # DLL is installed to $(libdir)/../bin by postinstall_cmds
>       postinstall_cmds='base_file=`basename \${file}`~
> -@@ -9714,13 +10306,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -9720,13 +10312,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>         library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>         ;;
>       esac
> @@ -7065,16 +7208,16 @@ index a7f788f0411..e7703613024 100755
>     # FIXME: first we should search . and the directory the executable is in
>     shlibpath_var=PATH
>     ;;
> -@@ -10598,7 +11248,7 @@ else
> +@@ -10604,7 +11254,7 @@ else
>     lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>     lt_status=$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 10601 "configure"
> +-#line 10607 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>   
>   #if HAVE_DLFCN_H
> -@@ -10642,10 +11292,10 @@ else
> +@@ -10648,10 +11298,10 @@ else
>   /* When -fvisbility=hidden is used, assume the code has been annotated
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -7087,16 +7230,16 @@ index a7f788f0411..e7703613024 100755
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -10704,7 +11354,7 @@ else
> +@@ -10710,7 +11360,7 @@ else
>     lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>     lt_status=$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 10707 "configure"
> +-#line 10713 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>   
>   #if HAVE_DLFCN_H
> -@@ -10748,10 +11398,10 @@ else
> +@@ -10754,10 +11404,10 @@ else
>   /* When -fvisbility=hidden is used, assume the code has been annotated
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -7109,7 +7252,7 @@ index a7f788f0411..e7703613024 100755
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -12771,13 +13421,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
> +@@ -12777,13 +13427,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
>   lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>   lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>   lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -7130,7 +7273,7 @@ index a7f788f0411..e7703613024 100755
>   STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>   RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>   old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
> -@@ -12792,14 +13449,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
> +@@ -12798,14 +13455,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
>   lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
> @@ -7149,7 +7292,7 @@ index a7f788f0411..e7703613024 100755
>   DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>   NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>   LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -12832,12 +13492,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
> +@@ -12838,12 +13498,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
>   hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
>   inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
>   link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
> @@ -7163,7 +7306,7 @@ index a7f788f0411..e7703613024 100755
>   file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
>   variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
>   need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
> -@@ -12892,8 +13552,13 @@ reload_flag \
> +@@ -12898,8 +13558,13 @@ reload_flag \
>   OBJDUMP \
>   deplibs_check_method \
>   file_magic_cmd \
> @@ -7177,7 +7320,7 @@ index a7f788f0411..e7703613024 100755
>   STRIP \
>   RANLIB \
>   CC \
> -@@ -12903,12 +13568,14 @@ lt_cv_sys_global_symbol_pipe \
> +@@ -12909,12 +13574,14 @@ lt_cv_sys_global_symbol_pipe \
>   lt_cv_sys_global_symbol_to_cdecl \
>   lt_cv_sys_global_symbol_to_c_name_address \
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -7193,7 +7336,7 @@ index a7f788f0411..e7703613024 100755
>   DSYMUTIL \
>   NMEDIT \
>   LIPO \
> -@@ -12924,7 +13591,6 @@ no_undefined_flag \
> +@@ -12930,7 +13597,6 @@ no_undefined_flag \
>   hardcode_libdir_flag_spec \
>   hardcode_libdir_flag_spec_ld \
>   hardcode_libdir_separator \
> @@ -7201,7 +7344,7 @@ index a7f788f0411..e7703613024 100755
>   exclude_expsyms \
>   include_expsyms \
>   file_list_spec \
> -@@ -12960,6 +13626,7 @@ module_cmds \
> +@@ -12966,6 +13632,7 @@ module_cmds \
>   module_expsym_cmds \
>   export_symbols_cmds \
>   prelink_cmds \
> @@ -7209,7 +7352,7 @@ index a7f788f0411..e7703613024 100755
>   postinstall_cmds \
>   postuninstall_cmds \
>   finish_cmds \
> -@@ -13725,7 +14392,8 @@ $as_echo X"$file" |
> +@@ -13731,7 +14398,8 @@ $as_echo X"$file" |
>   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>   #
>   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -7219,7 +7362,7 @@ index a7f788f0411..e7703613024 100755
>   #   Written by Gordon Matzigkeit, 1996
>   #
>   #   This file is part of GNU Libtool.
> -@@ -13828,19 +14496,42 @@ SP2NL=$lt_lt_SP2NL
> +@@ -13834,19 +14502,42 @@ SP2NL=$lt_lt_SP2NL
>   # turn newlines into spaces.
>   NL2SP=$lt_lt_NL2SP
>   
> @@ -7263,7 +7406,7 @@ index a7f788f0411..e7703613024 100755
>   # A symbol stripping program.
>   STRIP=$lt_STRIP
>   
> -@@ -13870,6 +14561,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
> +@@ -13876,6 +14567,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
>   # Transform the output of nm in a C name address pair when lib prefix is needed.
>   global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
>   
> @@ -7276,7 +7419,7 @@ index a7f788f0411..e7703613024 100755
>   # The name of the directory that contains temporary libtool files.
>   objdir=$objdir
>   
> -@@ -13879,6 +14576,9 @@ MAGIC_CMD=$MAGIC_CMD
> +@@ -13885,6 +14582,9 @@ MAGIC_CMD=$MAGIC_CMD
>   # Must we lock files when doing compilation?
>   need_locks=$lt_need_locks
>   
> @@ -7286,7 +7429,7 @@ index a7f788f0411..e7703613024 100755
>   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>   DSYMUTIL=$lt_DSYMUTIL
>   
> -@@ -13993,12 +14693,12 @@ with_gcc=$GCC
> +@@ -13999,12 +14699,12 @@ with_gcc=$GCC
>   # Compiler flag to turn off builtin functions.
>   no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
>   
> @@ -7302,7 +7445,7 @@ index a7f788f0411..e7703613024 100755
>   # Compiler flag to prevent dynamic linking.
>   link_static_flag=$lt_lt_prog_compiler_static
>   
> -@@ -14085,9 +14785,6 @@ inherit_rpath=$inherit_rpath
> +@@ -14091,9 +14791,6 @@ inherit_rpath=$inherit_rpath
>   # Whether libtool must link a program against all its dependency libraries.
>   link_all_deplibs=$link_all_deplibs
>   
> @@ -7312,7 +7455,7 @@ index a7f788f0411..e7703613024 100755
>   # Set to "yes" if exported symbols are required.
>   always_export_symbols=$always_export_symbols
>   
> -@@ -14103,6 +14800,9 @@ include_expsyms=$lt_include_expsyms
> +@@ -14109,6 +14806,9 @@ include_expsyms=$lt_include_expsyms
>   # Commands necessary for linking programs (against libraries) with templates.
>   prelink_cmds=$lt_prelink_cmds
>   
> @@ -7322,7 +7465,7 @@ index a7f788f0411..e7703613024 100755
>   # Specify filename containing input files.
>   file_list_spec=$lt_file_list_spec
>   
> -@@ -14135,210 +14835,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
> +@@ -14141,210 +14841,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
>     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>     # text mode, it properly converts lines to CR/LF.  This bash problem
>     # is reportedly fixed, but why not run on old versions too?
> @@ -7696,40 +7839,57 @@ index a7f788f0411..e7703613024 100755
>       (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
>     chmod +x "$ofile"
>   
> -diff --git a/ld/configure b/ld/configure
> -index 1f9ec8ec580..4a35108ce7c 100755
> ---- a/ld/configure
> -+++ b/ld/configure
> -@@ -695,8 +695,11 @@ OTOOL
> +diff --git a/gprofng/Makefile.in b/gprofng/Makefile.in
> +index fd5279b4df1..6e74c7b302a 100644
> +--- a/gprofng/Makefile.in
> ++++ b/gprofng/Makefile.in
> +@@ -253,6 +253,7 @@ CXXFLAGS = @CXXFLAGS@
> + CYGPATH_W = @CYGPATH_W@
> + DEFS = @DEFS@
> + DEPDIR = @DEPDIR@
> ++DLLTOOL = @DLLTOOL@
> + DSYMUTIL = @DSYMUTIL@
> + DUMPBIN = @DUMPBIN@
> + ECHO_C = @ECHO_C@
> +@@ -290,6 +291,7 @@ LN_S = @LN_S@
> + LTLIBOBJS = @LTLIBOBJS@
> + MAINT = @MAINT@
> + MAKEINFO = @MAKEINFO@
> ++MANIFEST_TOOL = @MANIFEST_TOOL@
> + MKDIR_P = @MKDIR_P@
> + NM = @NM@
> + NMEDIT = @NMEDIT@
> +diff --git a/gprofng/configure b/gprofng/configure
> +index ac14d126ac0..f8d7685a72e 100755
> +--- a/gprofng/configure
> ++++ b/gprofng/configure
> +@@ -672,6 +672,8 @@ OTOOL
>   LIPO
>   NMEDIT
>   DSYMUTIL
>  +MANIFEST_TOOL
> - RANLIB
> -+ac_ct_AR
> - AR
>  +DLLTOOL
>   OBJDUMP
>   LN_S
>   NM
> -@@ -823,6 +826,7 @@ enable_static
> +@@ -802,6 +804,7 @@ enable_static
>   with_pic
>   enable_fast_install
>   with_gnu_ld
>  +with_libtool_sysroot
>   enable_libtool_lock
> - enable_plugins
> - enable_largefile
> -@@ -1530,6 +1534,8 @@ Optional Packages:
> + enable_werror_always
> + enable_gprofng_tools
> +@@ -1465,6 +1468,8 @@ Optional Packages:
>     --with-pic              try to use only PIC/non-PIC objects [default=use
>                             both]
>     --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
>  +  --with-libtool-sysroot=DIR Search for dependent libraries within DIR
>  +                        (or the compiler's sysroot if not specified).
> -   --with-lib-path=dir1:dir2...  set default LIB_PATH
> -   --with-sysroot=DIR Search for usr/lib et al within DIR.
> +   --with-jdk=PATH         specify prefix directory for installed JDK.
>     --with-system-zlib      use installed libz
> -@@ -5368,8 +5374,8 @@ esac
> + 
> +@@ -6156,8 +6161,8 @@ esac
>   
>   
>   
> @@ -7740,7 +7900,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   
>   
>   
> -@@ -5409,7 +5415,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> +@@ -6197,7 +6202,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
>   $as_echo_n "checking how to print strings... " >&6; }
>   # Test print first, because it will be a builtin if present.
> @@ -7749,7 +7909,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>      test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
>     ECHO='print -r --'
>   elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
> -@@ -6096,8 +6102,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
> +@@ -6890,8 +6895,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
>   # Try some XSI features
>   xsi_shell=no
>   ( _lt_dummy="a/b/c"
> @@ -7760,7 +7920,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>       && eval 'test $(( 1 + 1 )) -eq 2 \
>       && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
>     && xsi_shell=yes
> -@@ -6146,6 +6152,80 @@ esac
> +@@ -6940,6 +6945,80 @@ esac
>   
>   
>   
> @@ -7841,7 +8001,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
>   $as_echo_n "checking for $LD option to reload object files... " >&6; }
>   if ${lt_cv_ld_reload_flag+:} false; then :
> -@@ -6162,6 +6242,11 @@ case $reload_flag in
> +@@ -6956,6 +7035,11 @@ case $reload_flag in
>   esac
>   reload_cmds='$LD$reload_flag -o $output$reload_objs'
>   case $host_os in
> @@ -7853,7 +8013,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>     darwin*)
>       if test "$GCC" = yes; then
>         reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
> -@@ -6330,7 +6415,8 @@ mingw* | pw32*)
> +@@ -7124,7 +7208,8 @@ mingw* | pw32*)
>       lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
>       lt_cv_file_magic_cmd='func_win32_libid'
>     else
> @@ -7863,7 +8023,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>       lt_cv_file_magic_cmd='$OBJDUMP -f'
>     fi
>     ;;
> -@@ -6484,6 +6570,21 @@ esac
> +@@ -7278,6 +7363,21 @@ esac
>   fi
>   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
>   $as_echo "$lt_cv_deplibs_check_method" >&6; }
> @@ -7885,7 +8045,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   file_magic_cmd=$lt_cv_file_magic_cmd
>   deplibs_check_method=$lt_cv_deplibs_check_method
>   test -z "$deplibs_check_method" && deplibs_check_method=unknown
> -@@ -6499,6 +6600,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
> +@@ -7293,6 +7393,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
>   
>   
>   
> @@ -8043,7 +8203,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   plugin_option=
>   plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
>   for plugin in $plugin_names; do
> -@@ -6513,8 +6765,10 @@ for plugin in $plugin_names; do
> +@@ -7307,8 +7558,10 @@ for plugin in $plugin_names; do
>   done
>   
>   if test -n "$ac_tool_prefix"; then
> @@ -8056,7 +8216,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_AR+:} false; then :
> -@@ -6530,7 +6784,7 @@ do
> +@@ -7324,7 +7577,7 @@ do
>     test -z "$as_dir" && as_dir=.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -8065,7 +8225,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -6550,11 +6804,15 @@ $as_echo "no" >&6; }
> +@@ -7344,11 +7597,15 @@ $as_echo "no" >&6; }
>   fi
>   
>   
> @@ -8084,7 +8244,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_ac_ct_AR+:} false; then :
> -@@ -6570,7 +6828,7 @@ do
> +@@ -7364,7 +7621,7 @@ do
>     test -z "$as_dir" && as_dir=.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -8093,7 +8253,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -6589,6 +6847,10 @@ else
> +@@ -7383,6 +7640,10 @@ else
>   $as_echo "no" >&6; }
>   fi
>   
> @@ -8104,7 +8264,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>     if test "x$ac_ct_AR" = x; then
>       AR="false"
>     else
> -@@ -6600,25 +6862,19 @@ ac_tool_warned=yes ;;
> +@@ -7394,29 +7655,81 @@ ac_tool_warned=yes ;;
>   esac
>       AR=$ac_ct_AR
>     fi
> @@ -8136,12 +8296,16 @@ index 1f9ec8ec580..4a35108ce7c 100755
>  +  rm -f conftest.*
>  +: ${AR=ar}
>  +: ${AR_FLAGS=cru}
> ++
> ++
> ++
> ++
> ++
> ++
> ++
>   
>   
>   
> -@@ -6630,6 +6886,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
> - 
> - 
>   
>  +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE support" >&5
>  +$as_echo_n "checking for archiver @FILE support... " >&6; }
> @@ -8194,17 +8358,10 @@ index 1f9ec8ec580..4a35108ce7c 100755
>  +else
>  +  archiver_list_spec=$lt_cv_ar_at_file
>  +fi
> -+
> -+
> -+
> -+
> -+
> -+
> -+
> - if test -n "$ac_tool_prefix"; then
> -   # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
> - set dummy ${ac_tool_prefix}strip; ac_word=$2
> -@@ -6969,8 +7283,8 @@ esac
> + 
> + 
> + 
> +@@ -7763,8 +8076,8 @@ esac
>   lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
>   
>   # Transform an extracted symbol line into symbol name and symbol address
> @@ -8215,7 +8372,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   
>   # Handle CRLF in mingw tool chain
>   opt_cr=
> -@@ -7006,6 +7320,7 @@ for ac_symprfx in "" "_"; do
> +@@ -7800,6 +8113,7 @@ for ac_symprfx in "" "_"; do
>     else
>       lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
>     fi
> @@ -8223,7 +8380,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   
>     # Check to see that the pipe works correctly.
>     pipe_works=no
> -@@ -7047,6 +7362,18 @@ _LT_EOF
> +@@ -7841,6 +8155,18 @@ _LT_EOF
>         if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
>   	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
>   	  cat <<_LT_EOF > conftest.$ac_ext
> @@ -8242,7 +8399,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   #ifdef __cplusplus
>   extern "C" {
>   #endif
> -@@ -7058,7 +7385,7 @@ _LT_EOF
> +@@ -7852,7 +8178,7 @@ _LT_EOF
>   	  cat <<_LT_EOF >> conftest.$ac_ext
>   
>   /* The mapping between symbol names and symbols.  */
> @@ -8251,7 +8408,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>     const char *name;
>     void       *address;
>   }
> -@@ -7084,8 +7411,8 @@ static const void *lt_preloaded_setup() {
> +@@ -7878,8 +8204,8 @@ static const void *lt_preloaded_setup() {
>   _LT_EOF
>   	  # Now try linking the two files.
>   	  mv conftest.$ac_objext conftstm.$ac_objext
> @@ -8262,7 +8419,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   	  LIBS="conftstm.$ac_objext"
>   	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
>   	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
> -@@ -7095,8 +7422,8 @@ _LT_EOF
> +@@ -7889,8 +8215,8 @@ _LT_EOF
>     test $ac_status = 0; } && test -s conftest${ac_exeext}; then
>   	    pipe_works=yes
>   	  fi
> @@ -8273,7 +8430,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   	else
>   	  echo "cannot find nm_test_func in $nlist" >&5
>   	fi
> -@@ -7133,6 +7460,17 @@ else
> +@@ -7927,6 +8253,13 @@ else
>   $as_echo "ok" >&6; }
>   fi
>   
> @@ -8284,14 +8441,10 @@ index 1f9ec8ec580..4a35108ce7c 100755
>  +  nm_file_list_spec='@'
>  +fi
>  +
> -+
> -+
> -+
> -+
>   
>   
>   
> -@@ -7149,6 +7487,44 @@ fi
> +@@ -7946,6 +8279,48 @@ fi
>   
>   
>   
> @@ -8301,6 +8454,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>  +
>  +
>  +
> ++
>  +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
>  +$as_echo_n "checking for sysroot... " >&6; }
>  +
> @@ -8333,10 +8487,13 @@ index 1f9ec8ec580..4a35108ce7c 100755
>  +
>  + { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
>  +$as_echo "${lt_sysroot:-no}" >&6; }
> ++
> ++
> ++
>   
>   
> - 
> -@@ -7360,6 +7736,123 @@ esac
> + # Check whether --enable-libtool-lock was given.
> +@@ -8154,6 +8529,123 @@ esac
>   
>   need_locks="$enable_libtool_lock"
>   
> @@ -8460,7 +8617,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   
>     case $host_os in
>       rhapsody* | darwin*)
> -@@ -7923,6 +8416,8 @@ _LT_EOF
> +@@ -8717,6 +9209,8 @@ _LT_EOF
>         $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
>         echo "$AR cru libconftest.a conftest.o" >&5
>         $AR cru libconftest.a conftest.o 2>&5
> @@ -8469,7 +8626,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>         cat > conftest.c << _LT_EOF
>   int main() { return 0;}
>   _LT_EOF
> -@@ -7991,6 +8486,16 @@ done
> +@@ -8785,6 +9279,16 @@ done
>   
>   
>   
> @@ -8486,7 +8643,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   
>   
>   # Set options
> -@@ -8506,8 +9011,6 @@ fi
> +@@ -9270,8 +9774,6 @@ fi
>   lt_prog_compiler_pic=
>   lt_prog_compiler_static=
>   
> @@ -8495,7 +8652,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   
>     if test "$GCC" = yes; then
>       lt_prog_compiler_wl='-Wl,'
> -@@ -8673,6 +9176,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -9437,6 +9939,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>   	lt_prog_compiler_pic='--shared'
>   	lt_prog_compiler_static='--static'
>   	;;
> @@ -8508,7 +8665,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>         pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
>           # Portland Group compilers (*not* the Pentium gcc compiler,
>   	# which looks to be a dead project)
> -@@ -8735,7 +9244,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -9499,7 +10007,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>         lt_prog_compiler_pic='-KPIC'
>         lt_prog_compiler_static='-Bstatic'
>         case $cc_basename in
> @@ -8517,7 +8674,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   	lt_prog_compiler_wl='-Qoption ld ';;
>         *)
>   	lt_prog_compiler_wl='-Wl,';;
> -@@ -8792,13 +9301,17 @@ case $host_os in
> +@@ -9556,13 +10064,17 @@ case $host_os in
>       lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
>       ;;
>   esac
> @@ -8541,7 +8698,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   
>   #
>   # Check to make sure the PIC flag actually works.
> -@@ -8859,6 +9372,11 @@ fi
> +@@ -9623,6 +10135,11 @@ fi
>   
>   
>   
> @@ -8553,7 +8710,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   #
>   # Check to make sure the static flag actually works.
>   #
> -@@ -9209,7 +9727,8 @@ _LT_EOF
> +@@ -9973,7 +10490,8 @@ _LT_EOF
>         allow_undefined_flag=unsupported
>         always_export_symbols=no
>         enable_shared_with_static_runtimes=yes
> @@ -8563,7 +8720,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   
>         if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
>           archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
> -@@ -9308,12 +9827,12 @@ _LT_EOF
> +@@ -10072,12 +10590,12 @@ _LT_EOF
>   	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
>   	  hardcode_libdir_flag_spec=
>   	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
> @@ -8578,7 +8735,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   	  fi
>   	  ;;
>   	esac
> -@@ -9327,8 +9846,8 @@ _LT_EOF
> +@@ -10091,8 +10609,8 @@ _LT_EOF
>   	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
>   	wlarc=
>         else
> @@ -8589,7 +8746,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>         fi
>         ;;
>   
> -@@ -9346,8 +9865,8 @@ _LT_EOF
> +@@ -10110,8 +10628,8 @@ _LT_EOF
>   
>   _LT_EOF
>         elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -8600,7 +8757,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>         else
>   	ld_shlibs=no
>         fi
> -@@ -9393,8 +9912,8 @@ _LT_EOF
> +@@ -10157,8 +10675,8 @@ _LT_EOF
>   
>       *)
>         if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -8611,7 +8768,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>         else
>   	ld_shlibs=no
>         fi
> -@@ -9524,7 +10043,13 @@ _LT_EOF
> +@@ -10288,7 +10806,13 @@ _LT_EOF
>   	allow_undefined_flag='-berok'
>           # Determine the default libpath from the value encoded in an
>           # empty executable.
> @@ -8626,7 +8783,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   /* end confdefs.h.  */
>   
>   int
> -@@ -9537,22 +10062,29 @@ main ()
> +@@ -10301,22 +10825,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>   
> @@ -8669,7 +8826,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   
>           hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>           archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> -@@ -9564,7 +10096,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -10328,7 +10859,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	else
>   	 # Determine the default libpath from the value encoded in an
>   	 # empty executable.
> @@ -8684,7 +8841,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   /* end confdefs.h.  */
>   
>   int
> -@@ -9577,22 +10115,29 @@ main ()
> +@@ -10341,22 +10878,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>   
> @@ -8727,11 +8884,10 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   
>   	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>   	  # Warning - without using the other run time loading flags,
> -@@ -9636,21 +10181,64 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> -       # When not using gcc, we currently assume that we are using
> +@@ -10401,20 +10945,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>         # Microsoft Visual C++.
>         # hardcode_libdir_flag_spec is actually meaningless, as there is
> --      # no search path for DLLs.
> +       # no search path for DLLs.
>  -      hardcode_libdir_flag_spec=' '
>  -      allow_undefined_flag=unsupported
>  -      # Tell ltmain to make .lib files, not .a files.
> @@ -8746,7 +8902,6 @@ index 1f9ec8ec580..4a35108ce7c 100755
>  -      old_archive_cmds='lib -OUT:$oldlib$oldobjs$old_deplibs'
>  -      fix_srcfile_path='`cygpath -w "$srcfile"`'
>  -      enable_shared_with_static_runtimes=yes
> -+      # no search path for DLLs.
>  +      case $cc_basename in
>  +      cl*)
>  +	# Native MSVC
> @@ -8807,7 +8962,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>         ;;
>   
>       darwin* | rhapsody*)
> -@@ -9711,7 +10299,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -10475,7 +11062,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
>       freebsd* | dragonfly*)
> @@ -8816,7 +8971,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>         hardcode_libdir_flag_spec='-R$libdir'
>         hardcode_direct=yes
>         hardcode_shlibpath_var=no
> -@@ -9719,7 +10307,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -10483,7 +11070,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       hpux9*)
>         if test "$GCC" = yes; then
> @@ -8825,7 +8980,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>         else
>   	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
>         fi
> -@@ -9735,7 +10323,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -10499,7 +11086,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       hpux10*)
>         if test "$GCC" = yes && test "$with_gnu_ld" = no; then
> @@ -8834,7 +8989,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>         else
>   	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
>         fi
> -@@ -9759,10 +10347,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -10523,10 +11110,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
>   	  ;;
>   	ia64*)
> @@ -8847,7 +9002,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   	  ;;
>   	esac
>         else
> -@@ -9841,23 +10429,36 @@ fi
> +@@ -10605,23 +11192,36 @@ fi
>   
>       irix5* | irix6* | nonstopux*)
>         if test "$GCC" = yes; then
> @@ -8892,7 +9047,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>         else
>   	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
>   	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
> -@@ -9942,7 +10543,7 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -10706,7 +11306,7 @@ rm -f core conftest.err conftest.$ac_objext \
>       osf4* | osf5*)	# as osf3* with the addition of -msym flag
>         if test "$GCC" = yes; then
>   	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
> @@ -8901,7 +9056,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
>         else
>   	allow_undefined_flag=' -expect_unresolved \*'
> -@@ -9961,9 +10562,9 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -10725,9 +11325,9 @@ rm -f core conftest.err conftest.$ac_objext \
>         no_undefined_flag=' -z defs'
>         if test "$GCC" = yes; then
>   	wlarc='${wl}'
> @@ -8913,7 +9068,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>         else
>   	case `$CC -V 2>&1` in
>   	*"Compilers 5.0"*)
> -@@ -10539,8 +11140,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -11303,8 +11903,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>     need_version=no
>     need_lib_prefix=no
>   
> @@ -8925,7 +9080,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>       library_names_spec='$libname.dll.a'
>       # DLL is installed to $(libdir)/../bin by postinstall_cmds
>       postinstall_cmds='base_file=`basename \${file}`~
> -@@ -10573,13 +11175,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -11337,13 +11938,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>         library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>         ;;
>       esac
> @@ -8998,16 +9153,16 @@ index 1f9ec8ec580..4a35108ce7c 100755
>     # FIXME: first we should search . and the directory the executable is in
>     shlibpath_var=PATH
>     ;;
> -@@ -11457,7 +12117,7 @@ else
> +@@ -12221,7 +12880,7 @@ else
>     lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>     lt_status=$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 11457 "configure"
> +-#line 12224 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>   
>   #if HAVE_DLFCN_H
> -@@ -11501,10 +12161,10 @@ else
> +@@ -12265,10 +12924,10 @@ else
>   /* When -fvisbility=hidden is used, assume the code has been annotated
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -9020,16 +9175,16 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -11563,7 +12223,7 @@ else
> +@@ -12327,7 +12986,7 @@ else
>     lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>     lt_status=$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 11563 "configure"
> +-#line 12330 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>   
>   #if HAVE_DLFCN_H
> -@@ -11607,10 +12267,10 @@ else
> +@@ -12371,10 +13030,10 @@ else
>   /* When -fvisbility=hidden is used, assume the code has been annotated
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -9042,7 +9197,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -12002,6 +12662,7 @@ $RM -r conftest*
> +@@ -12766,6 +13425,7 @@ $RM -r conftest*
>   
>     # Allow CC to be a program name with arguments.
>     lt_save_CC=$CC
> @@ -9050,7 +9205,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>     lt_save_LD=$LD
>     lt_save_GCC=$GCC
>     GCC=$GXX
> -@@ -12019,6 +12680,7 @@ $RM -r conftest*
> +@@ -12783,6 +13443,7 @@ $RM -r conftest*
>     fi
>     test -z "${LDCXX+set}" || LD=$LDCXX
>     CC=${CXX-"c++"}
> @@ -9058,7 +9213,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>     compiler=$CC
>     compiler_CXX=$CC
>     for cc_temp in $compiler""; do
> -@@ -12301,7 +12963,13 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
> +@@ -13065,7 +13726,13 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
>             allow_undefined_flag_CXX='-berok'
>             # Determine the default libpath from the value encoded in an empty
>             # executable.
> @@ -9073,7 +9228,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   /* end confdefs.h.  */
>   
>   int
> -@@ -12314,22 +12982,29 @@ main ()
> +@@ -13078,22 +13745,29 @@ main ()
>   _ACEOF
>   if ac_fn_cxx_try_link "$LINENO"; then :
>   
> @@ -9116,7 +9271,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   
>             hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
>   
> -@@ -12342,7 +13017,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -13106,7 +13780,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>             else
>   	    # Determine the default libpath from the value encoded in an
>   	    # empty executable.
> @@ -9131,7 +9286,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   /* end confdefs.h.  */
>   
>   int
> -@@ -12355,22 +13036,29 @@ main ()
> +@@ -13119,22 +13799,29 @@ main ()
>   _ACEOF
>   if ac_fn_cxx_try_link "$LINENO"; then :
>   
> @@ -9174,7 +9329,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   
>   	    hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
>   	    # Warning - without using the other run time loading flags,
> -@@ -12413,29 +13101,75 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -13177,29 +13864,75 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>           ;;
>   
>         cygwin* | mingw* | pw32* | cegcc*)
> @@ -9273,7 +9428,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>         darwin* | rhapsody*)
>   
>   
> -@@ -12541,7 +13275,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -13305,7 +14038,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>               ;;
>             *)
>               if test "$GXX" = yes; then
> @@ -9282,7 +9437,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>               else
>                 # FIXME: insert proper C++ library support
>                 ld_shlibs_CXX=no
> -@@ -12612,10 +13346,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -13376,10 +14109,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	            archive_cmds_CXX='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
>   	            ;;
>   	          ia64*)
> @@ -9295,7 +9450,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   	            ;;
>   	        esac
>   	      fi
> -@@ -12656,9 +13390,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -13420,9 +14153,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>             *)
>   	    if test "$GXX" = yes; then
>   	      if test "$with_gnu_ld" = no; then
> @@ -9307,7 +9462,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   	      fi
>   	    fi
>   	    link_all_deplibs_CXX=yes
> -@@ -12728,20 +13462,20 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -13492,20 +14225,20 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	      prelink_cmds_CXX='tpldir=Template.dir~
>   		rm -rf $tpldir~
>   		$CC --prelink_objects --instantiation_dir $tpldir $objs $libobjs $compile_deplibs~
> @@ -9332,7 +9487,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   	      ;;
>   	    *) # Version 6 and above use weak symbols
>   	      archive_cmds_CXX='$CC -shared $pic_flag $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
> -@@ -12936,7 +13670,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -13700,7 +14433,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	          archive_cmds_CXX='$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
>   		  ;;
>   	        *)
> @@ -9341,7 +9496,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   		  ;;
>   	      esac
>   
> -@@ -12982,7 +13716,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -13746,7 +14479,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>         solaris*)
>           case $cc_basename in
> @@ -9350,7 +9505,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   	    # Sun C++ 4.2, 5.x and Centerline C++
>               archive_cmds_need_lc_CXX=yes
>   	    no_undefined_flag_CXX=' -zdefs'
> -@@ -13023,9 +13757,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -13787,9 +14520,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	    if test "$GXX" = yes && test "$with_gnu_ld" = no; then
>   	      no_undefined_flag_CXX=' ${wl}-z ${wl}defs'
>   	      if $CC --version | $GREP -v '^2\.7' > /dev/null; then
> @@ -9362,7 +9517,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   
>   	        # Commands to make compiler produce verbose output that lists
>   	        # what "hidden" libraries, object files and flags are used when
> -@@ -13160,6 +13894,13 @@ private:
> +@@ -13924,6 +14657,13 @@ private:
>   };
>   _LT_EOF
>   
> @@ -9376,7 +9531,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
>     (eval $ac_compile) 2>&5
>     ac_status=$?
> -@@ -13173,7 +13914,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
> +@@ -13937,7 +14677,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
>     pre_test_object_deps_done=no
>   
>     for p in `eval "$output_verbose_link_cmd"`; do
> @@ -9385,7 +9540,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   
>       -L* | -R* | -l*)
>          # Some compilers place space between "-{L,R}" and the path.
> -@@ -13182,13 +13923,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
> +@@ -13946,13 +14686,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
>             test $p = "-R"; then
>   	 prev=$p
>   	 continue
> @@ -9412,7 +9567,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   	   # Internal compiler library paths should come after those
>   	   # provided the user.  The postdeps already come after the
>   	   # user supplied libs so there is no need to process them.
> -@@ -13208,8 +13958,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
> +@@ -13972,8 +14721,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
>   	   postdeps_CXX="${postdeps_CXX} ${prev}${p}"
>   	 fi
>          fi
> @@ -9423,7 +9578,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>       *.$objext)
>          # This assumes that the test object file only shows up
>          # once in the compiler output.
> -@@ -13245,6 +13997,7 @@ else
> +@@ -14009,6 +14760,7 @@ else
>   fi
>   
>   $RM -f confest.$objext
> @@ -9431,7 +9586,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   
>   # PORTME: override above test on systems where it is broken
>   case $host_os in
> -@@ -13280,7 +14033,7 @@ linux*)
> +@@ -14044,7 +14796,7 @@ linux*)
>   
>   solaris*)
>     case $cc_basename in
> @@ -9440,7 +9595,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>       # The more standards-conforming stlport4 library is
>       # incompatible with the Cstd library. Avoid specifying
>       # it if it's in CXXFLAGS. Ignore libCrun as
> -@@ -13345,8 +14098,6 @@ fi
> +@@ -14109,8 +14861,6 @@ fi
>   lt_prog_compiler_pic_CXX=
>   lt_prog_compiler_static_CXX=
>   
> @@ -9449,7 +9604,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   
>     # C++ specific cases for pic, static, wl, etc.
>     if test "$GXX" = yes; then
> -@@ -13451,6 +14202,11 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -14215,6 +14965,11 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>   	  ;;
>   	esac
>   	;;
> @@ -9461,7 +9616,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>         dgux*)
>   	case $cc_basename in
>   	  ec++*)
> -@@ -13603,7 +14359,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -14367,7 +15122,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>   	;;
>         solaris*)
>   	case $cc_basename in
> @@ -9470,7 +9625,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   	    # Sun C++ 4.2, 5.x and Centerline C++
>   	    lt_prog_compiler_pic_CXX='-KPIC'
>   	    lt_prog_compiler_static_CXX='-Bstatic'
> -@@ -13668,10 +14424,17 @@ case $host_os in
> +@@ -14432,10 +15187,17 @@ case $host_os in
>       lt_prog_compiler_pic_CXX="$lt_prog_compiler_pic_CXX -DPIC"
>       ;;
>   esac
> @@ -9491,7 +9646,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   
>   #
>   # Check to make sure the PIC flag actually works.
> -@@ -13729,6 +14492,8 @@ fi
> +@@ -14493,6 +15255,8 @@ fi
>   
>   
>   
> @@ -9500,7 +9655,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   #
>   # Check to make sure the static flag actually works.
>   #
> -@@ -13906,6 +14671,7 @@ fi
> +@@ -14670,6 +15434,7 @@ fi
>   $as_echo_n "checking whether the $compiler linker ($LD) supports shared libraries... " >&6; }
>   
>     export_symbols_cmds_CXX='$NM $libobjs $convenience | $global_symbol_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
> @@ -9508,7 +9663,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>     case $host_os in
>     aix[4-9]*)
>       # If we're using GNU nm, then we don't want the "-C" option.
> -@@ -13920,15 +14686,20 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
> +@@ -14684,15 +15449,20 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
>       ;;
>     pw32*)
>       export_symbols_cmds_CXX="$ltdll_cmds"
> @@ -9534,7 +9689,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   
>   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ld_shlibs_CXX" >&5
>   $as_echo "$ld_shlibs_CXX" >&6; }
> -@@ -14191,8 +14962,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -14955,8 +15725,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>     need_version=no
>     need_lib_prefix=no
>   
> @@ -9546,7 +9701,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>       library_names_spec='$libname.dll.a'
>       # DLL is installed to $(libdir)/../bin by postinstall_cmds
>       postinstall_cmds='base_file=`basename \${file}`~
> -@@ -14224,13 +14996,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -14988,13 +15759,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>         library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>         ;;
>       esac
> @@ -9619,7 +9774,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>     # FIXME: first we should search . and the directory the executable is in
>     shlibpath_var=PATH
>     ;;
> -@@ -14770,6 +15600,7 @@ fi
> +@@ -15534,6 +16363,7 @@ fi
>     fi # test -n "$compiler"
>   
>     CC=$lt_save_CC
> @@ -9627,7 +9782,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>     LDCXX=$LD
>     LD=$lt_save_LD
>     GCC=$lt_save_GCC
> -@@ -17830,13 +18661,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
> +@@ -17663,13 +18493,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
>   lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>   lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>   lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -9648,7 +9803,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>   RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>   old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
> -@@ -17851,14 +18689,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
> +@@ -17684,14 +18521,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
>   lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
> @@ -9667,7 +9822,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>   NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>   LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -17891,12 +18732,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
> +@@ -17724,12 +18564,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
>   hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
>   inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
>   link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
> @@ -9681,7 +9836,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
>   variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
>   need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
> -@@ -17935,8 +18776,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archive_cmds_CXX" | $SED "$delay_single_quote
> +@@ -17768,8 +18608,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archive_cmds_CXX" | $SED "$delay_single_quote
>   compiler_CXX='`$ECHO "$compiler_CXX" | $SED "$delay_single_quote_subst"`'
>   GCC_CXX='`$ECHO "$GCC_CXX" | $SED "$delay_single_quote_subst"`'
>   lt_prog_compiler_no_builtin_flag_CXX='`$ECHO "$lt_prog_compiler_no_builtin_flag_CXX" | $SED "$delay_single_quote_subst"`'
> @@ -9691,7 +9846,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   lt_prog_compiler_static_CXX='`$ECHO "$lt_prog_compiler_static_CXX" | $SED "$delay_single_quote_subst"`'
>   lt_cv_prog_compiler_c_o_CXX='`$ECHO "$lt_cv_prog_compiler_c_o_CXX" | $SED "$delay_single_quote_subst"`'
>   archive_cmds_need_lc_CXX='`$ECHO "$archive_cmds_need_lc_CXX" | $SED "$delay_single_quote_subst"`'
> -@@ -17963,12 +18804,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$hardcode_shlibpath_var_CXX" | $SED "$delay_
> +@@ -17796,12 +18636,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$hardcode_shlibpath_var_CXX" | $SED "$delay_
>   hardcode_automatic_CXX='`$ECHO "$hardcode_automatic_CXX" | $SED "$delay_single_quote_subst"`'
>   inherit_rpath_CXX='`$ECHO "$inherit_rpath_CXX" | $SED "$delay_single_quote_subst"`'
>   link_all_deplibs_CXX='`$ECHO "$link_all_deplibs_CXX" | $SED "$delay_single_quote_subst"`'
> @@ -9705,7 +9860,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   file_list_spec_CXX='`$ECHO "$file_list_spec_CXX" | $SED "$delay_single_quote_subst"`'
>   hardcode_action_CXX='`$ECHO "$hardcode_action_CXX" | $SED "$delay_single_quote_subst"`'
>   compiler_lib_search_dirs_CXX='`$ECHO "$compiler_lib_search_dirs_CXX" | $SED "$delay_single_quote_subst"`'
> -@@ -18006,8 +18847,13 @@ reload_flag \
> +@@ -17839,8 +18679,13 @@ reload_flag \
>   OBJDUMP \
>   deplibs_check_method \
>   file_magic_cmd \
> @@ -9719,7 +9874,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   STRIP \
>   RANLIB \
>   CC \
> -@@ -18017,12 +18863,14 @@ lt_cv_sys_global_symbol_pipe \
> +@@ -17850,12 +18695,14 @@ lt_cv_sys_global_symbol_pipe \
>   lt_cv_sys_global_symbol_to_cdecl \
>   lt_cv_sys_global_symbol_to_c_name_address \
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -9735,7 +9890,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   DSYMUTIL \
>   NMEDIT \
>   LIPO \
> -@@ -18038,7 +18886,6 @@ no_undefined_flag \
> +@@ -17871,7 +18718,6 @@ no_undefined_flag \
>   hardcode_libdir_flag_spec \
>   hardcode_libdir_flag_spec_ld \
>   hardcode_libdir_separator \
> @@ -9743,7 +9898,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   exclude_expsyms \
>   include_expsyms \
>   file_list_spec \
> -@@ -18060,8 +18907,8 @@ LD_CXX \
> +@@ -17893,8 +18739,8 @@ LD_CXX \
>   reload_flag_CXX \
>   compiler_CXX \
>   lt_prog_compiler_no_builtin_flag_CXX \
> @@ -9753,7 +9908,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   lt_prog_compiler_static_CXX \
>   lt_cv_prog_compiler_c_o_CXX \
>   export_dynamic_flag_spec_CXX \
> -@@ -18073,7 +18920,6 @@ no_undefined_flag_CXX \
> +@@ -17906,7 +18752,6 @@ no_undefined_flag_CXX \
>   hardcode_libdir_flag_spec_CXX \
>   hardcode_libdir_flag_spec_ld_CXX \
>   hardcode_libdir_separator_CXX \
> @@ -9761,7 +9916,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   exclude_expsyms_CXX \
>   include_expsyms_CXX \
>   file_list_spec_CXX \
> -@@ -18107,6 +18953,7 @@ module_cmds \
> +@@ -17940,6 +18785,7 @@ module_cmds \
>   module_expsym_cmds \
>   export_symbols_cmds \
>   prelink_cmds \
> @@ -9769,7 +9924,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   postinstall_cmds \
>   postuninstall_cmds \
>   finish_cmds \
> -@@ -18121,7 +18968,8 @@ archive_expsym_cmds_CXX \
> +@@ -17954,7 +18800,8 @@ archive_expsym_cmds_CXX \
>   module_cmds_CXX \
>   module_expsym_cmds_CXX \
>   export_symbols_cmds_CXX \
> @@ -9779,7 +9934,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>       case \`eval \\\\\$ECHO \\\\""\\\\\$\$var"\\\\"\` in
>       *[\\\\\\\`\\"\\\$]*)
>         eval "lt_\$var=\\\\\\"\\\`\\\$ECHO \\"\\\$\$var\\" | \\\$SED -e \\"\\\$double_quote_subst\\" -e \\"\\\$sed_quote_subst\\" -e \\"\\\$delay_variable_subst\\"\\\`\\\\\\""
> -@@ -18886,7 +19734,8 @@ $as_echo X"$file" |
> +@@ -18711,7 +19558,8 @@ $as_echo X"$file" |
>   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>   #
>   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -9789,7 +9944,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   #   Written by Gordon Matzigkeit, 1996
>   #
>   #   This file is part of GNU Libtool.
> -@@ -18989,19 +19838,42 @@ SP2NL=$lt_lt_SP2NL
> +@@ -18814,19 +19662,42 @@ SP2NL=$lt_lt_SP2NL
>   # turn newlines into spaces.
>   NL2SP=$lt_lt_NL2SP
>   
> @@ -9833,7 +9988,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   # A symbol stripping program.
>   STRIP=$lt_STRIP
>   
> -@@ -19031,6 +19903,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
> +@@ -18856,6 +19727,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
>   # Transform the output of nm in a C name address pair when lib prefix is needed.
>   global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
>   
> @@ -9846,7 +10001,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   # The name of the directory that contains temporary libtool files.
>   objdir=$objdir
>   
> -@@ -19040,6 +19918,9 @@ MAGIC_CMD=$MAGIC_CMD
> +@@ -18865,6 +19742,9 @@ MAGIC_CMD=$MAGIC_CMD
>   # Must we lock files when doing compilation?
>   need_locks=$lt_need_locks
>   
> @@ -9856,7 +10011,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>   DSYMUTIL=$lt_DSYMUTIL
>   
> -@@ -19154,12 +20035,12 @@ with_gcc=$GCC
> +@@ -18979,12 +19859,12 @@ with_gcc=$GCC
>   # Compiler flag to turn off builtin functions.
>   no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
>   
> @@ -9872,7 +10027,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   # Compiler flag to prevent dynamic linking.
>   link_static_flag=$lt_lt_prog_compiler_static
>   
> -@@ -19246,9 +20127,6 @@ inherit_rpath=$inherit_rpath
> +@@ -19071,9 +19951,6 @@ inherit_rpath=$inherit_rpath
>   # Whether libtool must link a program against all its dependency libraries.
>   link_all_deplibs=$link_all_deplibs
>   
> @@ -9882,7 +10037,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   # Set to "yes" if exported symbols are required.
>   always_export_symbols=$always_export_symbols
>   
> -@@ -19264,6 +20142,9 @@ include_expsyms=$lt_include_expsyms
> +@@ -19089,6 +19966,9 @@ include_expsyms=$lt_include_expsyms
>   # Commands necessary for linking programs (against libraries) with templates.
>   prelink_cmds=$lt_prelink_cmds
>   
> @@ -9892,7 +10047,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   # Specify filename containing input files.
>   file_list_spec=$lt_file_list_spec
>   
> -@@ -19310,210 +20191,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
> +@@ -19135,210 +20015,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
>     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>     # text mode, it properly converts lines to CR/LF.  This bash problem
>     # is reportedly fixed, but why not run on old versions too?
> @@ -10266,7 +10421,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>       (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
>     chmod +x "$ofile"
>   
> -@@ -19541,12 +20381,12 @@ with_gcc=$GCC_CXX
> +@@ -19366,12 +20205,12 @@ with_gcc=$GCC_CXX
>   # Compiler flag to turn off builtin functions.
>   no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag_CXX
>   
> @@ -10282,7 +10437,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   # Compiler flag to prevent dynamic linking.
>   link_static_flag=$lt_lt_prog_compiler_static_CXX
>   
> -@@ -19633,9 +20473,6 @@ inherit_rpath=$inherit_rpath_CXX
> +@@ -19458,9 +20297,6 @@ inherit_rpath=$inherit_rpath_CXX
>   # Whether libtool must link a program against all its dependency libraries.
>   link_all_deplibs=$link_all_deplibs_CXX
>   
> @@ -10292,7 +10447,7 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   # Set to "yes" if exported symbols are required.
>   always_export_symbols=$always_export_symbols_CXX
>   
> -@@ -19651,6 +20488,9 @@ include_expsyms=$lt_include_expsyms_CXX
> +@@ -19476,6 +20312,9 @@ include_expsyms=$lt_include_expsyms_CXX
>   # Commands necessary for linking programs (against libraries) with templates.
>   prelink_cmds=$lt_prelink_cmds_CXX
>   
> @@ -10302,39 +10457,97 @@ index 1f9ec8ec580..4a35108ce7c 100755
>   # Specify filename containing input files.
>   file_list_spec=$lt_file_list_spec_CXX
>   
> -diff --git a/libbacktrace/configure b/libbacktrace/configure
> -index a2f33c0f35d..90667680701 100755
> ---- a/libbacktrace/configure
> -+++ b/libbacktrace/configure
> -@@ -680,7 +680,10 @@ OTOOL
> +diff --git a/gprofng/doc/Makefile.in b/gprofng/doc/Makefile.in
> +index 4050586f6a8..394469e3768 100644
> +--- a/gprofng/doc/Makefile.in
> ++++ b/gprofng/doc/Makefile.in
> +@@ -237,6 +237,7 @@ CXXFLAGS = @CXXFLAGS@
> + CYGPATH_W = @CYGPATH_W@
> + DEFS = @DEFS@
> + DEPDIR = @DEPDIR@
> ++DLLTOOL = @DLLTOOL@
> + DSYMUTIL = @DSYMUTIL@
> + DUMPBIN = @DUMPBIN@
> + ECHO_C = @ECHO_C@
> +@@ -272,6 +273,7 @@ LN_S = @LN_S@
> + LTLIBOBJS = @LTLIBOBJS@
> + MAINT = @MAINT@
> + MAKEINFO = @MAKEINFO@
> ++MANIFEST_TOOL = @MANIFEST_TOOL@
> + MKDIR_P = @MKDIR_P@
> + NM = @NM@
> + NMEDIT = @NMEDIT@
> +diff --git a/gprofng/gp-display-html/Makefile.in b/gprofng/gp-display-html/Makefile.in
> +index 1206a79d3f0..2f763e5f760 100644
> +--- a/gprofng/gp-display-html/Makefile.in
> ++++ b/gprofng/gp-display-html/Makefile.in
> +@@ -200,6 +200,7 @@ CXXFLAGS = @CXXFLAGS@
> + CYGPATH_W = @CYGPATH_W@
> + DEFS = @DEFS@
> + DEPDIR = @DEPDIR@
> ++DLLTOOL = @DLLTOOL@
> + DSYMUTIL = @DSYMUTIL@
> + DUMPBIN = @DUMPBIN@
> + ECHO_C = @ECHO_C@
> +@@ -235,6 +236,7 @@ LN_S = @LN_S@
> + LTLIBOBJS = @LTLIBOBJS@
> + MAINT = @MAINT@
> + MAKEINFO = @MAKEINFO@
> ++MANIFEST_TOOL = @MANIFEST_TOOL@
> + MKDIR_P = @MKDIR_P@
> + NM = @NM@
> + NMEDIT = @NMEDIT@
> +diff --git a/gprofng/libcollector/Makefile.in b/gprofng/libcollector/Makefile.in
> +index 9372c6dea78..0cf4f58c0ec 100644
> +--- a/gprofng/libcollector/Makefile.in
> ++++ b/gprofng/libcollector/Makefile.in
> +@@ -316,6 +316,7 @@ CXXFLAGS = @CXXFLAGS@
> + CYGPATH_W = @CYGPATH_W@
> + DEFS = @DEFS@
> + DEPDIR = @DEPDIR@
> ++DLLTOOL = @DLLTOOL@
> + DSYMUTIL = @DSYMUTIL@
> + DUMPBIN = @DUMPBIN@
> + ECHO_C = @ECHO_C@
> +@@ -342,6 +343,7 @@ LN_S = @LN_S@
> + LTLIBOBJS = @LTLIBOBJS@
> + MAINT = @MAINT@
> + MAKEINFO = @MAKEINFO@
> ++MANIFEST_TOOL = @MANIFEST_TOOL@
> + MKDIR_P = @MKDIR_P@
> + NM = @NM@
> + NMEDIT = @NMEDIT@
> +diff --git a/gprofng/libcollector/configure b/gprofng/libcollector/configure
> +index ec38721ced2..d9daed11e3f 100755
> +--- a/gprofng/libcollector/configure
> ++++ b/gprofng/libcollector/configure
> +@@ -641,6 +641,8 @@ OTOOL
>   LIPO
>   NMEDIT
>   DSYMUTIL
>  +MANIFEST_TOOL
> -+ac_ct_AR
> - AR
>  +DLLTOOL
>   OBJDUMP
>   LN_S
>   NM
> -@@ -798,6 +801,7 @@ enable_static
> +@@ -770,6 +772,7 @@ enable_static
>   with_pic
>   enable_fast_install
>   with_gnu_ld
>  +with_libtool_sysroot
>   enable_libtool_lock
> - enable_largefile
> - enable_cet
> -@@ -1458,6 +1462,8 @@ Optional Packages:
> + '
> +       ac_precious_vars='build_alias
> +@@ -1425,6 +1428,8 @@ Optional Packages:
>     --with-pic              try to use only PIC/non-PIC objects [default=use
>                             both]
>     --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
>  +  --with-libtool-sysroot=DIR Search for dependent libraries within DIR
>  +                        (or the compiler's sysroot if not specified).
> -   --with-system-libunwind use installed libunwind
>   
>   Some influential environment variables:
> -@@ -5446,8 +5452,8 @@ esac
> +   CC          C compiler command
> +@@ -5969,8 +5974,8 @@ esac
>   
>   
>   
> @@ -10345,7 +10558,7 @@ index a2f33c0f35d..90667680701 100755
>   
>   
>   
> -@@ -5487,7 +5493,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> +@@ -6010,7 +6015,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
>   $as_echo_n "checking how to print strings... " >&6; }
>   # Test print first, because it will be a builtin if present.
> @@ -10354,99 +10567,7 @@ index a2f33c0f35d..90667680701 100755
>      test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
>     ECHO='print -r --'
>   elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
> -@@ -5818,48 +5824,49 @@ if ${lt_cv_path_NM+:} false; then :
> -   $as_echo_n "(cached) " >&6
> - else
> -   if test -n "$NM"; then
> --  # Let the user override the test.
> --  lt_cv_path_NM="$NM"
> --else
> --  lt_nm_to_check="${ac_tool_prefix}nm"
> --  if test -n "$ac_tool_prefix" && test "$build" = "$host"; then
> --    lt_nm_to_check="$lt_nm_to_check nm"
> --  fi
> --  for lt_tmp_nm in $lt_nm_to_check; do
> --    lt_save_ifs="$IFS"; IFS=$PATH_SEPARATOR
> --    for ac_dir in $PATH /usr/ccs/bin/elf /usr/ccs/bin /usr/ucb /bin; do
> --      IFS="$lt_save_ifs"
> --      test -z "$ac_dir" && ac_dir=.
> --      tmp_nm="$ac_dir/$lt_tmp_nm"
> --      if test -f "$tmp_nm" || test -f "$tmp_nm$ac_exeext" ; then
> --	# Check to see if the nm accepts a BSD-compat flag.
> --	# Adding the `sed 1q' prevents false positives on HP-UX, which says:
> --	#   nm: unknown option "B" ignored
> --	# Tru64's nm complains that /dev/null is an invalid object file
> --	case `"$tmp_nm" -B /dev/null 2>&1 | sed '1q'` in
> --	*/dev/null* | *'Invalid file or object type'*)
> --	  lt_cv_path_NM="$tmp_nm -B"
> --	  break
> --	  ;;
> --	*)
> --	  case `"$tmp_nm" -p /dev/null 2>&1 | sed '1q'` in
> --	  */dev/null*)
> --	    lt_cv_path_NM="$tmp_nm -p"
> --	    break
> --	    ;;
> --	  *)
> --	    lt_cv_path_NM=${lt_cv_path_NM="$tmp_nm"} # keep the first match, but
> --	    continue # so that we can try to find one that supports BSD flags
> --	    ;;
> --	  esac
> --	  ;;
> --	esac
> --      fi
> --    done
> --    IFS="$lt_save_ifs"
> --  done
> --  : ${lt_cv_path_NM=no}
> --fi
> -+   # Let the user override the nm to test.
> -+   lt_nm_to_check="$NM"
> -+ else
> -+   lt_nm_to_check="${ac_tool_prefix}nm"
> -+   if test -n "$ac_tool_prefix" && test "$build" = "$host"; then
> -+     lt_nm_to_check="$lt_nm_to_check nm"
> -+   fi
> -+ fi
> -+ for lt_tmp_nm in $lt_nm_to_check; do
> -+   lt_save_ifs="$IFS"; IFS=$PATH_SEPARATOR
> -+   for ac_dir in $PATH /usr/ccs/bin/elf /usr/ccs/bin /usr/ucb /bin; do
> -+     IFS="$lt_save_ifs"
> -+     test -z "$ac_dir" && ac_dir=.
> -+     case "$lt_tmp_nm" in
> -+     */*|*\\*) tmp_nm="$lt_tmp_nm";;
> -+     *) tmp_nm="$ac_dir/$lt_tmp_nm";;
> -+     esac
> -+     if test -f "$tmp_nm" || test -f "$tmp_nm$ac_exeext" ; then
> -+       # Check to see if the nm accepts a BSD-compat flag.
> -+       # Adding the `sed 1q' prevents false positives on HP-UX, which says:
> -+       #   nm: unknown option "B" ignored
> -+       case `"$tmp_nm" -B "$tmp_nm" 2>&1 | grep -v '^ *$' | sed '1q'` in
> -+       *$tmp_nm*) lt_cv_path_NM="$tmp_nm -B"
> -+	 break
> -+	 ;;
> -+       *)
> -+	 case `"$tmp_nm" -p "$tmp_nm" 2>&1 | grep -v '^ *$' | sed '1q'` in
> -+	 *$tmp_nm*)
> -+	   lt_cv_path_NM="$tmp_nm -p"
> -+	   break
> -+	   ;;
> -+	 *)
> -+	   lt_cv_path_NM=${lt_cv_path_NM="$tmp_nm"} # keep the first match, but
> -+	   continue # so that we can try to find one that supports BSD flags
> -+	   ;;
> -+	 esac
> -+	 ;;
> -+       esac
> -+     fi
> -+   done
> -+   IFS="$lt_save_ifs"
> -+ done
> -+ : ${lt_cv_path_NM=no}
> - fi
> - { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_path_NM" >&5
> - $as_echo "$lt_cv_path_NM" >&6; }
> -@@ -6173,8 +6180,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
> +@@ -6703,8 +6708,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
>   # Try some XSI features
>   xsi_shell=no
>   ( _lt_dummy="a/b/c"
> @@ -10457,7 +10578,7 @@ index a2f33c0f35d..90667680701 100755
>       && eval 'test $(( 1 + 1 )) -eq 2 \
>       && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
>     && xsi_shell=yes
> -@@ -6223,6 +6230,80 @@ esac
> +@@ -6753,6 +6758,80 @@ esac
>   
>   
>   
> @@ -10538,7 +10659,7 @@ index a2f33c0f35d..90667680701 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
>   $as_echo_n "checking for $LD option to reload object files... " >&6; }
>   if ${lt_cv_ld_reload_flag+:} false; then :
> -@@ -6239,6 +6320,11 @@ case $reload_flag in
> +@@ -6769,6 +6848,11 @@ case $reload_flag in
>   esac
>   reload_cmds='$LD$reload_flag -o $output$reload_objs'
>   case $host_os in
> @@ -10550,7 +10671,7 @@ index a2f33c0f35d..90667680701 100755
>     darwin*)
>       if test "$GCC" = yes; then
>         reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
> -@@ -6407,7 +6493,8 @@ mingw* | pw32*)
> +@@ -6937,7 +7021,8 @@ mingw* | pw32*)
>       lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
>       lt_cv_file_magic_cmd='func_win32_libid'
>     else
> @@ -10560,16 +10681,7 @@ index a2f33c0f35d..90667680701 100755
>       lt_cv_file_magic_cmd='$OBJDUMP -f'
>     fi
>     ;;
> -@@ -6480,7 +6567,7 @@ irix5* | irix6* | nonstopux*)
> -   ;;
> - 
> - # This must be Linux ELF.
> --linux* | k*bsd*-gnu | kopensolaris*-gnu | uclinuxfdpiceabi)
> -+linux* | k*bsd*-gnu | kopensolaris*-gnu)
> -   lt_cv_deplibs_check_method=pass_all
> -   ;;
> - 
> -@@ -6561,6 +6648,21 @@ esac
> +@@ -7091,6 +7176,21 @@ esac
>   fi
>   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
>   $as_echo "$lt_cv_deplibs_check_method" >&6; }
> @@ -10591,7 +10703,7 @@ index a2f33c0f35d..90667680701 100755
>   file_magic_cmd=$lt_cv_file_magic_cmd
>   deplibs_check_method=$lt_cv_deplibs_check_method
>   test -z "$deplibs_check_method" && deplibs_check_method=unknown
> -@@ -6574,11 +6676,177 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
> +@@ -7106,6 +7206,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
>   
>   
>   
> @@ -10605,11 +10717,7 @@ index a2f33c0f35d..90667680701 100755
>  +
>  +
>  +
> - 
> - 
> - if test -n "$ac_tool_prefix"; then
> --  # Extract the first word of "${ac_tool_prefix}ar", so it can be a program name with args.
> --set dummy ${ac_tool_prefix}ar; ac_word=$2
> ++if test -n "$ac_tool_prefix"; then
>  +  # Extract the first word of "${ac_tool_prefix}dlltool", so it can be a program name with args.
>  +set dummy ${ac_tool_prefix}dlltool; ac_word=$2
>  +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> @@ -10750,20 +10858,5299 @@ index a2f33c0f35d..90667680701 100755
>  +
>  +
>  +
> -+plugin_option=
> -+plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
> -+for plugin in $plugin_names; do
> -+  plugin_so=`${CC} ${CFLAGS} --print-prog-name $plugin`
> -+  if test x$plugin_so = x$plugin; then
> -+    plugin_so=`${CC} ${CFLAGS} --print-file-name $plugin`
> -+  fi
> -+  if test x$plugin_so != x$plugin; then
> -+    plugin_option="--plugin $plugin_so"
> -+    break
> -+  fi
> -+done
> + plugin_option=
> + plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
> + for plugin in $plugin_names; do
> +@@ -7120,8 +7371,10 @@ for plugin in $plugin_names; do
> + done
> + 
> + if test -n "$ac_tool_prefix"; then
> +-  # Extract the first word of "${ac_tool_prefix}ar", so it can be a program name with args.
> +-set dummy ${ac_tool_prefix}ar; ac_word=$2
> ++  for ac_prog in ar
> ++  do
> ++    # Extract the first word of "$ac_tool_prefix$ac_prog", so it can be a program name with args.
> ++set dummy $ac_tool_prefix$ac_prog; ac_word=$2
> + { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> + $as_echo_n "checking for $ac_word... " >&6; }
> + if ${ac_cv_prog_AR+:} false; then :
> +@@ -7137,7 +7390,7 @@ do
> +   test -z "$as_dir" && as_dir=.
> +     for ac_exec_ext in '' $ac_executable_extensions; do
> +   if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> +-    ac_cv_prog_AR="${ac_tool_prefix}ar"
> ++    ac_cv_prog_AR="$ac_tool_prefix$ac_prog"
> +     $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
> +     break 2
> +   fi
> +@@ -7157,11 +7410,15 @@ $as_echo "no" >&6; }
> + fi
> + 
> + 
> ++    test -n "$AR" && break
> ++  done
> + fi
> +-if test -z "$ac_cv_prog_AR"; then
> ++if test -z "$AR"; then
> +   ac_ct_AR=$AR
> +-  # Extract the first word of "ar", so it can be a program name with args.
> +-set dummy ar; ac_word=$2
> ++  for ac_prog in ar
> ++do
> ++  # Extract the first word of "$ac_prog", so it can be a program name with args.
> ++set dummy $ac_prog; ac_word=$2
> + { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> + $as_echo_n "checking for $ac_word... " >&6; }
> + if ${ac_cv_prog_ac_ct_AR+:} false; then :
> +@@ -7177,7 +7434,7 @@ do
> +   test -z "$as_dir" && as_dir=.
> +     for ac_exec_ext in '' $ac_executable_extensions; do
> +   if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> +-    ac_cv_prog_ac_ct_AR="ar"
> ++    ac_cv_prog_ac_ct_AR="$ac_prog"
> +     $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
> +     break 2
> +   fi
> +@@ -7196,6 +7453,10 @@ else
> + $as_echo "no" >&6; }
> + fi
> + 
> ++
> ++  test -n "$ac_ct_AR" && break
> ++done
> ++
> +   if test "x$ac_ct_AR" = x; then
> +     AR="false"
> +   else
> +@@ -7207,29 +7468,81 @@ ac_tool_warned=yes ;;
> + esac
> +     AR=$ac_ct_AR
> +   fi
> +-else
> +-  AR="$ac_cv_prog_AR"
> + fi
> + 
> +-test -z "$AR" && AR=ar
> +-if test -n "$plugin_option"; then
> +-  if $AR --help 2>&1 | grep -q "\--plugin"; then
> +-    touch conftest.c
> +-    $AR $plugin_option rc conftest.a conftest.c
> +-    if test "$?" != 0; then
> +-      { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Failed: $AR $plugin_option rc" >&5
> ++  touch conftest.c
> ++  $AR $plugin_option rc conftest.a conftest.c
> ++  if test "$?" != 0; then
> ++    { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Failed: $AR $plugin_option rc" >&5
> + $as_echo "$as_me: WARNING: Failed: $AR $plugin_option rc" >&2;}
> +-    else
> +-      AR="$AR $plugin_option"
> +-    fi
> +-    rm -f conftest.*
> ++  else
> ++    AR="$AR $plugin_option"
> +   fi
> +-fi
> +-test -z "$AR_FLAGS" && AR_FLAGS=cru
> ++  rm -f conftest.*
> ++: ${AR=ar}
> ++: ${AR_FLAGS=cru}
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> + 
> + 
> + 
> + 
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE support" >&5
> ++$as_echo_n "checking for archiver @FILE support... " >&6; }
> ++if ${lt_cv_ar_at_file+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  lt_cv_ar_at_file=no
> ++   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> ++/* end confdefs.h.  */
> ++
> ++int
> ++main ()
> ++{
> ++
> ++  ;
> ++  return 0;
> ++}
> ++_ACEOF
> ++if ac_fn_c_try_compile "$LINENO"; then :
> ++  echo conftest.$ac_objext > conftest.lst
> ++      lt_ar_try='$AR $AR_FLAGS libconftest.a @conftest.lst >&5'
> ++      { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$lt_ar_try\""; } >&5
> ++  (eval $lt_ar_try) 2>&5
> ++  ac_status=$?
> ++  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
> ++  test $ac_status = 0; }
> ++      if test "$ac_status" -eq 0; then
> ++	# Ensure the archiver fails upon bogus file names.
> ++	rm -f conftest.$ac_objext libconftest.a
> ++	{ { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$lt_ar_try\""; } >&5
> ++  (eval $lt_ar_try) 2>&5
> ++  ac_status=$?
> ++  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
> ++  test $ac_status = 0; }
> ++	if test "$ac_status" -ne 0; then
> ++          lt_cv_ar_at_file=@
> ++        fi
> ++      fi
> ++      rm -f conftest.* libconftest.a
> ++
> ++fi
> ++rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
> ++
> ++fi
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_ar_at_file" >&5
> ++$as_echo "$lt_cv_ar_at_file" >&6; }
> ++
> ++if test "x$lt_cv_ar_at_file" = xno; then
> ++  archiver_list_spec=
> ++else
> ++  archiver_list_spec=$lt_cv_ar_at_file
> ++fi
> + 
> + 
> + 
> +@@ -7576,8 +7889,8 @@ esac
> + lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
> + 
> + # Transform an extracted symbol line into symbol name and symbol address
> +-lt_cv_sys_global_symbol_to_c_name_address="sed -n -e 's/^: \([^ ]*\) $/  {\\\"\1\\\", (void *) 0},/p' -e 's/^$symcode* \([^ ]*\) \([^ ]*\)$/  {\"\2\", (void *) \&\2},/p'"
> +-lt_cv_sys_global_symbol_to_c_name_address_lib_prefix="sed -n -e 's/^: \([^ ]*\) $/  {\\\"\1\\\", (void *) 0},/p' -e 's/^$symcode* \([^ ]*\) \(lib[^ ]*\)$/  {\"\2\", (void *) \&\2},/p' -e 's/^$symcode* \([^ ]*\) \([^ ]*\)$/  {\"lib\2\", (void *) \&\2},/p'"
> ++lt_cv_sys_global_symbol_to_c_name_address="sed -n -e 's/^: \([^ ]*\)[ ]*$/  {\\\"\1\\\", (void *) 0},/p' -e 's/^$symcode* \([^ ]*\) \([^ ]*\)$/  {\"\2\", (void *) \&\2},/p'"
> ++lt_cv_sys_global_symbol_to_c_name_address_lib_prefix="sed -n -e 's/^: \([^ ]*\)[ ]*$/  {\\\"\1\\\", (void *) 0},/p' -e 's/^$symcode* \([^ ]*\) \(lib[^ ]*\)$/  {\"\2\", (void *) \&\2},/p' -e 's/^$symcode* \([^ ]*\) \([^ ]*\)$/  {\"lib\2\", (void *) \&\2},/p'"
> + 
> + # Handle CRLF in mingw tool chain
> + opt_cr=
> +@@ -7613,6 +7926,7 @@ for ac_symprfx in "" "_"; do
> +   else
> +     lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
> +   fi
> ++  lt_cv_sys_global_symbol_pipe="$lt_cv_sys_global_symbol_pipe | sed '/ __gnu_lto/d'"
> + 
> +   # Check to see that the pipe works correctly.
> +   pipe_works=no
> +@@ -7654,6 +7968,18 @@ _LT_EOF
> +       if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
> + 	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
> + 	  cat <<_LT_EOF > conftest.$ac_ext
> ++/* Keep this code in sync between libtool.m4, ltmain, lt_system.h, and tests.  */
> ++#if defined(_WIN32) || defined(__CYGWIN__) || defined(_WIN32_WCE)
> ++/* DATA imports from DLLs on WIN32 con't be const, because runtime
> ++   relocations are performed -- see ld's documentation on pseudo-relocs.  */
> ++# define LT_DLSYM_CONST
> ++#elif defined(__osf__)
> ++/* This system does not cope well with relocations in const data.  */
> ++# define LT_DLSYM_CONST
> ++#else
> ++# define LT_DLSYM_CONST const
> ++#endif
> ++
> + #ifdef __cplusplus
> + extern "C" {
> + #endif
> +@@ -7665,7 +7991,7 @@ _LT_EOF
> + 	  cat <<_LT_EOF >> conftest.$ac_ext
> + 
> + /* The mapping between symbol names and symbols.  */
> +-const struct {
> ++LT_DLSYM_CONST struct {
> +   const char *name;
> +   void       *address;
> + }
> +@@ -7691,8 +8017,8 @@ static const void *lt_preloaded_setup() {
> + _LT_EOF
> + 	  # Now try linking the two files.
> + 	  mv conftest.$ac_objext conftstm.$ac_objext
> +-	  lt_save_LIBS="$LIBS"
> +-	  lt_save_CFLAGS="$CFLAGS"
> ++	  lt_globsym_save_LIBS=$LIBS
> ++	  lt_globsym_save_CFLAGS=$CFLAGS
> + 	  LIBS="conftstm.$ac_objext"
> + 	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
> + 	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
> +@@ -7702,8 +8028,8 @@ _LT_EOF
> +   test $ac_status = 0; } && test -s conftest${ac_exeext}; then
> + 	    pipe_works=yes
> + 	  fi
> +-	  LIBS="$lt_save_LIBS"
> +-	  CFLAGS="$lt_save_CFLAGS"
> ++	  LIBS=$lt_globsym_save_LIBS
> ++	  CFLAGS=$lt_globsym_save_CFLAGS
> + 	else
> + 	  echo "cannot find nm_test_func in $nlist" >&5
> + 	fi
> +@@ -7740,6 +8066,13 @@ else
> + $as_echo "ok" >&6; }
> + fi
> + 
> ++# Response file support.
> ++if test "$lt_cv_nm_interface" = "MS dumpbin"; then
> ++  nm_file_list_spec='@'
> ++elif $NM --help 2>/dev/null | grep '[@]FILE' >/dev/null; then
> ++  nm_file_list_spec='@'
> ++fi
> ++
> + 
> + 
> + 
> +@@ -7759,6 +8092,48 @@ fi
> + 
> + 
> + 
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
> ++$as_echo_n "checking for sysroot... " >&6; }
> ++
> ++# Check whether --with-libtool-sysroot was given.
> ++if test "${with_libtool_sysroot+set}" = set; then :
> ++  withval=$with_libtool_sysroot;
> ++else
> ++  with_libtool_sysroot=no
> ++fi
> ++
> ++
> ++lt_sysroot=
> ++case ${with_libtool_sysroot} in #(
> ++ yes)
> ++   if test "$GCC" = yes; then
> ++     lt_sysroot=`$CC --print-sysroot 2>/dev/null`
> ++   fi
> ++   ;; #(
> ++ /*)
> ++   lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
> ++   ;; #(
> ++ no|'')
> ++   ;; #(
> ++ *)
> ++   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_libtool_sysroot}" >&5
> ++$as_echo "${with_libtool_sysroot}" >&6; }
> ++   as_fn_error $? "The sysroot must be an absolute path." "$LINENO" 5
> ++   ;;
> ++esac
> ++
> ++ { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
> ++$as_echo "${lt_sysroot:-no}" >&6; }
> ++
> ++
> ++
> + 
> + 
> + # Check whether --enable-libtool-lock was given.
> +@@ -7967,6 +8342,123 @@ esac
> + 
> + need_locks="$enable_libtool_lock"
> + 
> ++if test -n "$ac_tool_prefix"; then
> ++  # Extract the first word of "${ac_tool_prefix}mt", so it can be a program name with args.
> ++set dummy ${ac_tool_prefix}mt; ac_word=$2
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> ++$as_echo_n "checking for $ac_word... " >&6; }
> ++if ${ac_cv_prog_MANIFEST_TOOL+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  if test -n "$MANIFEST_TOOL"; then
> ++  ac_cv_prog_MANIFEST_TOOL="$MANIFEST_TOOL" # Let the user override the test.
> ++else
> ++as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
> ++for as_dir in $PATH
> ++do
> ++  IFS=$as_save_IFS
> ++  test -z "$as_dir" && as_dir=.
> ++    for ac_exec_ext in '' $ac_executable_extensions; do
> ++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> ++    ac_cv_prog_MANIFEST_TOOL="${ac_tool_prefix}mt"
> ++    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
> ++    break 2
> ++  fi
> ++done
> ++  done
> ++IFS=$as_save_IFS
> ++
> ++fi
> ++fi
> ++MANIFEST_TOOL=$ac_cv_prog_MANIFEST_TOOL
> ++if test -n "$MANIFEST_TOOL"; then
> ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $MANIFEST_TOOL" >&5
> ++$as_echo "$MANIFEST_TOOL" >&6; }
> ++else
> ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
> ++$as_echo "no" >&6; }
> ++fi
> ++
> ++
> ++fi
> ++if test -z "$ac_cv_prog_MANIFEST_TOOL"; then
> ++  ac_ct_MANIFEST_TOOL=$MANIFEST_TOOL
> ++  # Extract the first word of "mt", so it can be a program name with args.
> ++set dummy mt; ac_word=$2
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> ++$as_echo_n "checking for $ac_word... " >&6; }
> ++if ${ac_cv_prog_ac_ct_MANIFEST_TOOL+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  if test -n "$ac_ct_MANIFEST_TOOL"; then
> ++  ac_cv_prog_ac_ct_MANIFEST_TOOL="$ac_ct_MANIFEST_TOOL" # Let the user override the test.
> ++else
> ++as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
> ++for as_dir in $PATH
> ++do
> ++  IFS=$as_save_IFS
> ++  test -z "$as_dir" && as_dir=.
> ++    for ac_exec_ext in '' $ac_executable_extensions; do
> ++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> ++    ac_cv_prog_ac_ct_MANIFEST_TOOL="mt"
> ++    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
> ++    break 2
> ++  fi
> ++done
> ++  done
> ++IFS=$as_save_IFS
> ++
> ++fi
> ++fi
> ++ac_ct_MANIFEST_TOOL=$ac_cv_prog_ac_ct_MANIFEST_TOOL
> ++if test -n "$ac_ct_MANIFEST_TOOL"; then
> ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_ct_MANIFEST_TOOL" >&5
> ++$as_echo "$ac_ct_MANIFEST_TOOL" >&6; }
> ++else
> ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
> ++$as_echo "no" >&6; }
> ++fi
> ++
> ++  if test "x$ac_ct_MANIFEST_TOOL" = x; then
> ++    MANIFEST_TOOL=":"
> ++  else
> ++    case $cross_compiling:$ac_tool_warned in
> ++yes:)
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
> ++$as_echo "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
> ++ac_tool_warned=yes ;;
> ++esac
> ++    MANIFEST_TOOL=$ac_ct_MANIFEST_TOOL
> ++  fi
> ++else
> ++  MANIFEST_TOOL="$ac_cv_prog_MANIFEST_TOOL"
> ++fi
> ++
> ++test -z "$MANIFEST_TOOL" && MANIFEST_TOOL=mt
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking if $MANIFEST_TOOL is a manifest tool" >&5
> ++$as_echo_n "checking if $MANIFEST_TOOL is a manifest tool... " >&6; }
> ++if ${lt_cv_path_mainfest_tool+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  lt_cv_path_mainfest_tool=no
> ++  echo "$as_me:$LINENO: $MANIFEST_TOOL '-?'" >&5
> ++  $MANIFEST_TOOL '-?' 2>conftest.err > conftest.out
> ++  cat conftest.err >&5
> ++  if $GREP 'Manifest Tool' conftest.out > /dev/null; then
> ++    lt_cv_path_mainfest_tool=yes
> ++  fi
> ++  rm -f conftest*
> ++fi
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_path_mainfest_tool" >&5
> ++$as_echo "$lt_cv_path_mainfest_tool" >&6; }
> ++if test "x$lt_cv_path_mainfest_tool" != xyes; then
> ++  MANIFEST_TOOL=:
> ++fi
> ++
> ++
> ++
> ++
> ++
> + 
> +   case $host_os in
> +     rhapsody* | darwin*)
> +@@ -8530,6 +9022,8 @@ _LT_EOF
> +       $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
> +       echo "$AR cru libconftest.a conftest.o" >&5
> +       $AR cru libconftest.a conftest.o 2>&5
> ++      echo "$RANLIB libconftest.a" >&5
> ++      $RANLIB libconftest.a 2>&5
> +       cat > conftest.c << _LT_EOF
> + int main() { return 0;}
> + _LT_EOF
> +@@ -8598,6 +9092,16 @@ done
> + 
> + 
> + 
> ++func_stripname_cnf ()
> ++{
> ++  case ${2} in
> ++  .*) func_stripname_result=`$ECHO "${3}" | $SED "s%^${1}%%; s%\\\\${2}\$%%"`;;
> ++  *)  func_stripname_result=`$ECHO "${3}" | $SED "s%^${1}%%; s%${2}\$%%"`;;
> ++  esac
> ++} # func_stripname_cnf
> ++
> ++
> ++
> + 
> + 
> + # Set options
> +@@ -9113,8 +9617,6 @@ fi
> + lt_prog_compiler_pic=
> + lt_prog_compiler_static=
> + 
> +-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $compiler option to produce PIC" >&5
> +-$as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> + 
> +   if test "$GCC" = yes; then
> +     lt_prog_compiler_wl='-Wl,'
> +@@ -9280,6 +9782,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> + 	lt_prog_compiler_pic='--shared'
> + 	lt_prog_compiler_static='--static'
> + 	;;
> ++      nagfor*)
> ++	# NAG Fortran compiler
> ++	lt_prog_compiler_wl='-Wl,-Wl,,'
> ++	lt_prog_compiler_pic='-PIC'
> ++	lt_prog_compiler_static='-Bstatic'
> ++	;;
> +       pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
> +         # Portland Group compilers (*not* the Pentium gcc compiler,
> + 	# which looks to be a dead project)
> +@@ -9342,7 +9850,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +       lt_prog_compiler_pic='-KPIC'
> +       lt_prog_compiler_static='-Bstatic'
> +       case $cc_basename in
> +-      f77* | f90* | f95*)
> ++      f77* | f90* | f95* | sunf77* | sunf90* | sunf95*)
> + 	lt_prog_compiler_wl='-Qoption ld ';;
> +       *)
> + 	lt_prog_compiler_wl='-Wl,';;
> +@@ -9399,13 +9907,17 @@ case $host_os in
> +     lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
> +     ;;
> + esac
> +-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_prog_compiler_pic" >&5
> +-$as_echo "$lt_prog_compiler_pic" >&6; }
> +-
> +-
> +-
> +-
> + 
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $compiler option to produce PIC" >&5
> ++$as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> ++if ${lt_cv_prog_compiler_pic+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  lt_cv_prog_compiler_pic=$lt_prog_compiler_pic
> ++fi
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_prog_compiler_pic" >&5
> ++$as_echo "$lt_cv_prog_compiler_pic" >&6; }
> ++lt_prog_compiler_pic=$lt_cv_prog_compiler_pic
> + 
> + #
> + # Check to make sure the PIC flag actually works.
> +@@ -9466,6 +9978,11 @@ fi
> + 
> + 
> + 
> ++
> ++
> ++
> ++
> ++
> + #
> + # Check to make sure the static flag actually works.
> + #
> +@@ -9816,7 +10333,8 @@ _LT_EOF
> +       allow_undefined_flag=unsupported
> +       always_export_symbols=no
> +       enable_shared_with_static_runtimes=yes
> +-      export_symbols_cmds='$NM $libobjs $convenience | $global_symbol_pipe | $SED -e '\''/^[BCDGRS][ ]/s/.*[ ]\([^ ]*\)/\1 DATA/'\'' | $SED -e '\''/^[AITW][ ]/s/.*[ ]//'\'' | sort | uniq > $export_symbols'
> ++      export_symbols_cmds='$NM $libobjs $convenience | $global_symbol_pipe | $SED -e '\''/^[BCDGRS][ ]/s/.*[ ]\([^ ]*\)/\1 DATA/;s/^.*[ ]__nm__\([^ ]*\)[ ][^ ]*/\1 DATA/;/^I[ ]/d;/^[AITW][ ]/s/.* //'\'' | sort | uniq > $export_symbols'
> ++      exclude_expsyms='[_]+GLOBAL_OFFSET_TABLE_|[_]+GLOBAL__[FID]_.*|[_]+head_[A-Za-z0-9_]+_dll|[A-Za-z0-9_]+_dll_iname'
> + 
> +       if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
> +         archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
> +@@ -9915,12 +10433,12 @@ _LT_EOF
> + 	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
> + 	  hardcode_libdir_flag_spec=
> + 	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
> +-	  archive_cmds='$LD -shared $libobjs $deplibs $compiler_flags -soname $soname -o $lib'
> ++	  archive_cmds='$LD -shared $libobjs $deplibs $linker_flags -soname $soname -o $lib'
> + 	  if test "x$supports_anon_versioning" = xyes; then
> + 	    archive_expsym_cmds='echo "{ global:" > $output_objdir/$libname.ver~
> + 	      cat $export_symbols | sed -e "s/\(.*\)/\1;/" >> $output_objdir/$libname.ver~
> + 	      echo "local: *; };" >> $output_objdir/$libname.ver~
> +-	      $LD -shared $libobjs $deplibs $compiler_flags -soname $soname -version-script $output_objdir/$libname.ver -o $lib'
> ++	      $LD -shared $libobjs $deplibs $linker_flags -soname $soname -version-script $output_objdir/$libname.ver -o $lib'
> + 	  fi
> + 	  ;;
> + 	esac
> +@@ -9934,8 +10452,8 @@ _LT_EOF
> + 	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
> + 	wlarc=
> +       else
> +-	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
> +-	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
> ++	archive_cmds='$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
> ++	archive_expsym_cmds='$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
> +       fi
> +       ;;
> + 
> +@@ -9953,8 +10471,8 @@ _LT_EOF
> + 
> + _LT_EOF
> +       elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> +-	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
> +-	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
> ++	archive_cmds='$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
> ++	archive_expsym_cmds='$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
> +       else
> + 	ld_shlibs=no
> +       fi
> +@@ -10000,8 +10518,8 @@ _LT_EOF
> + 
> +     *)
> +       if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> +-	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
> +-	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
> ++	archive_cmds='$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
> ++	archive_expsym_cmds='$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
> +       else
> + 	ld_shlibs=no
> +       fi
> +@@ -10131,7 +10649,13 @@ _LT_EOF
> + 	allow_undefined_flag='-berok'
> +         # Determine the default libpath from the value encoded in an
> +         # empty executable.
> +-        cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> ++        if test "${lt_cv_aix_libpath+set}" = set; then
> ++  aix_libpath=$lt_cv_aix_libpath
> ++else
> ++  if ${lt_cv_aix_libpath_+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> + /* end confdefs.h.  */
> + 
> + int
> +@@ -10144,22 +10668,29 @@ main ()
> + _ACEOF
> + if ac_fn_c_try_link "$LINENO"; then :
> + 
> +-lt_aix_libpath_sed='
> +-    /Import File Strings/,/^$/ {
> +-	/^0/ {
> +-	    s/^0  *\(.*\)$/\1/
> +-	    p
> +-	}
> +-    }'
> +-aix_libpath=`dump -H conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
> +-# Check for a 64-bit object if we didn't find anything.
> +-if test -z "$aix_libpath"; then
> +-  aix_libpath=`dump -HX64 conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
> +-fi
> ++  lt_aix_libpath_sed='
> ++      /Import File Strings/,/^$/ {
> ++	  /^0/ {
> ++	      s/^0  *\([^ ]*\) *$/\1/
> ++	      p
> ++	  }
> ++      }'
> ++  lt_cv_aix_libpath_=`dump -H conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
> ++  # Check for a 64-bit object if we didn't find anything.
> ++  if test -z "$lt_cv_aix_libpath_"; then
> ++    lt_cv_aix_libpath_=`dump -HX64 conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
> ++  fi
> + fi
> + rm -f core conftest.err conftest.$ac_objext \
> +     conftest$ac_exeext conftest.$ac_ext
> +-if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> ++  if test -z "$lt_cv_aix_libpath_"; then
> ++    lt_cv_aix_libpath_="/usr/lib:/lib"
> ++  fi
> ++
> ++fi
> ++
> ++  aix_libpath=$lt_cv_aix_libpath_
> ++fi
> + 
> +         hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
> +         archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> +@@ -10171,7 +10702,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> + 	else
> + 	 # Determine the default libpath from the value encoded in an
> + 	 # empty executable.
> +-	 cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> ++	 if test "${lt_cv_aix_libpath+set}" = set; then
> ++  aix_libpath=$lt_cv_aix_libpath
> ++else
> ++  if ${lt_cv_aix_libpath_+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> + /* end confdefs.h.  */
> + 
> + int
> +@@ -10184,22 +10721,29 @@ main ()
> + _ACEOF
> + if ac_fn_c_try_link "$LINENO"; then :
> + 
> +-lt_aix_libpath_sed='
> +-    /Import File Strings/,/^$/ {
> +-	/^0/ {
> +-	    s/^0  *\(.*\)$/\1/
> +-	    p
> +-	}
> +-    }'
> +-aix_libpath=`dump -H conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
> +-# Check for a 64-bit object if we didn't find anything.
> +-if test -z "$aix_libpath"; then
> +-  aix_libpath=`dump -HX64 conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
> +-fi
> ++  lt_aix_libpath_sed='
> ++      /Import File Strings/,/^$/ {
> ++	  /^0/ {
> ++	      s/^0  *\([^ ]*\) *$/\1/
> ++	      p
> ++	  }
> ++      }'
> ++  lt_cv_aix_libpath_=`dump -H conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
> ++  # Check for a 64-bit object if we didn't find anything.
> ++  if test -z "$lt_cv_aix_libpath_"; then
> ++    lt_cv_aix_libpath_=`dump -HX64 conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
> ++  fi
> + fi
> + rm -f core conftest.err conftest.$ac_objext \
> +     conftest$ac_exeext conftest.$ac_ext
> +-if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> ++  if test -z "$lt_cv_aix_libpath_"; then
> ++    lt_cv_aix_libpath_="/usr/lib:/lib"
> ++  fi
> ++
> ++fi
> ++
> ++  aix_libpath=$lt_cv_aix_libpath_
> ++fi
> + 
> + 	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
> + 	  # Warning - without using the other run time loading flags,
> +@@ -10243,21 +10787,64 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +       # When not using gcc, we currently assume that we are using
> +       # Microsoft Visual C++.
> +       # hardcode_libdir_flag_spec is actually meaningless, as there is
> +-      # no search path for DLLs.
> +-      hardcode_libdir_flag_spec=' '
> +-      allow_undefined_flag=unsupported
> +-      # Tell ltmain to make .lib files, not .a files.
> +-      libext=lib
> +-      # Tell ltmain to make .dll files, not .so files.
> +-      shrext_cmds=".dll"
> +-      # FIXME: Setting linknames here is a bad hack.
> +-      archive_cmds='$CC -o $lib $libobjs $compiler_flags `func_echo_all "$deplibs" | $SED '\''s/ -lc$//'\''` -link -dll~linknames='
> +-      # The linker will automatically build a .lib file if we build a DLL.
> +-      old_archive_from_new_cmds='true'
> +-      # FIXME: Should let the user specify the lib program.
> +-      old_archive_cmds='lib -OUT:$oldlib$oldobjs$old_deplibs'
> +-      fix_srcfile_path='`cygpath -w "$srcfile"`'
> +-      enable_shared_with_static_runtimes=yes
> ++      # no search path for DLLs.
> ++      case $cc_basename in
> ++      cl*)
> ++	# Native MSVC
> ++	hardcode_libdir_flag_spec=' '
> ++	allow_undefined_flag=unsupported
> ++	always_export_symbols=yes
> ++	file_list_spec='@'
> ++	# Tell ltmain to make .lib files, not .a files.
> ++	libext=lib
> ++	# Tell ltmain to make .dll files, not .so files.
> ++	shrext_cmds=".dll"
> ++	# FIXME: Setting linknames here is a bad hack.
> ++	archive_cmds='$CC -o $output_objdir/$soname $libobjs $compiler_flags $deplibs -Wl,-dll~linknames='
> ++	archive_expsym_cmds='if test "x`$SED 1q $export_symbols`" = xEXPORTS; then
> ++	    sed -n -e 's/\\\\\\\(.*\\\\\\\)/-link\\\ -EXPORT:\\\\\\\1/' -e '1\\\!p' < $export_symbols > $output_objdir/$soname.exp;
> ++	  else
> ++	    sed -e 's/\\\\\\\(.*\\\\\\\)/-link\\\ -EXPORT:\\\\\\\1/' < $export_symbols > $output_objdir/$soname.exp;
> ++	  fi~
> ++	  $CC -o $tool_output_objdir$soname $libobjs $compiler_flags $deplibs "@$tool_output_objdir$soname.exp" -Wl,-DLL,-IMPLIB:"$tool_output_objdir$libname.dll.lib"~
> ++	  linknames='
> ++	# The linker will not automatically build a static lib if we build a DLL.
> ++	# _LT_TAGVAR(old_archive_from_new_cmds, )='true'
> ++	enable_shared_with_static_runtimes=yes
> ++	export_symbols_cmds='$NM $libobjs $convenience | $global_symbol_pipe | $SED -e '\''/^[BCDGRS][ ]/s/.*[ ]\([^ ]*\)/\1,DATA/'\'' | $SED -e '\''/^[AITW][ ]/s/.*[ ]//'\'' | sort | uniq > $export_symbols'
> ++	# Don't use ranlib
> ++	old_postinstall_cmds='chmod 644 $oldlib'
> ++	postlink_cmds='lt_outputfile="@OUTPUT@"~
> ++	  lt_tool_outputfile="@TOOL_OUTPUT@"~
> ++	  case $lt_outputfile in
> ++	    *.exe|*.EXE) ;;
> ++	    *)
> ++	      lt_outputfile="$lt_outputfile.exe"
> ++	      lt_tool_outputfile="$lt_tool_outputfile.exe"
> ++	      ;;
> ++	  esac~
> ++	  if test "$MANIFEST_TOOL" != ":" && test -f "$lt_outputfile.manifest"; then
> ++	    $MANIFEST_TOOL -manifest "$lt_tool_outputfile.manifest" -outputresource:"$lt_tool_outputfile" || exit 1;
> ++	    $RM "$lt_outputfile.manifest";
> ++	  fi'
> ++	;;
> ++      *)
> ++	# Assume MSVC wrapper
> ++	hardcode_libdir_flag_spec=' '
> ++	allow_undefined_flag=unsupported
> ++	# Tell ltmain to make .lib files, not .a files.
> ++	libext=lib
> ++	# Tell ltmain to make .dll files, not .so files.
> ++	shrext_cmds=".dll"
> ++	# FIXME: Setting linknames here is a bad hack.
> ++	archive_cmds='$CC -o $lib $libobjs $compiler_flags `func_echo_all "$deplibs" | $SED '\''s/ -lc$//'\''` -link -dll~linknames='
> ++	# The linker will automatically build a .lib file if we build a DLL.
> ++	old_archive_from_new_cmds='true'
> ++	# FIXME: Should let the user specify the lib program.
> ++	old_archive_cmds='lib -OUT:$oldlib$oldobjs$old_deplibs'
> ++	enable_shared_with_static_runtimes=yes
> ++	;;
> ++      esac
> +       ;;
> + 
> +     darwin* | rhapsody*)
> +@@ -10318,7 +10905,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> + 
> +     # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
> +     freebsd* | dragonfly*)
> +-      archive_cmds='$CC -shared -o $lib $libobjs $deplibs $compiler_flags'
> ++      archive_cmds='$CC -shared $pic_flag -o $lib $libobjs $deplibs $compiler_flags'
> +       hardcode_libdir_flag_spec='-R$libdir'
> +       hardcode_direct=yes
> +       hardcode_shlibpath_var=no
> +@@ -10326,7 +10913,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> + 
> +     hpux9*)
> +       if test "$GCC" = yes; then
> +-	archive_cmds='$RM $output_objdir/$soname~$CC -shared -fPIC ${wl}+b ${wl}$install_libdir -o $output_objdir/$soname $libobjs $deplibs $compiler_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
> ++	archive_cmds='$RM $output_objdir/$soname~$CC -shared $pic_flag ${wl}+b ${wl}$install_libdir -o $output_objdir/$soname $libobjs $deplibs $compiler_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
> +       else
> + 	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
> +       fi
> +@@ -10342,7 +10929,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> + 
> +     hpux10*)
> +       if test "$GCC" = yes && test "$with_gnu_ld" = no; then
> +-	archive_cmds='$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+b ${wl}$install_libdir -o $lib $libobjs $deplibs $compiler_flags'
> ++	archive_cmds='$CC -shared $pic_flag ${wl}+h ${wl}$soname ${wl}+b ${wl}$install_libdir -o $lib $libobjs $deplibs $compiler_flags'
> +       else
> + 	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
> +       fi
> +@@ -10366,10 +10953,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> + 	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
> + 	  ;;
> + 	ia64*)
> +-	  archive_cmds='$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
> ++	  archive_cmds='$CC -shared $pic_flag ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
> + 	  ;;
> + 	*)
> +-	  archive_cmds='$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+b ${wl}$install_libdir -o $lib $libobjs $deplibs $compiler_flags'
> ++	  archive_cmds='$CC -shared $pic_flag ${wl}+h ${wl}$soname ${wl}+b ${wl}$install_libdir -o $lib $libobjs $deplibs $compiler_flags'
> + 	  ;;
> + 	esac
> +       else
> +@@ -10448,23 +11035,36 @@ fi
> + 
> +     irix5* | irix6* | nonstopux*)
> +       if test "$GCC" = yes; then
> +-	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
> ++	archive_cmds='$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
> + 	# Try to use the -exported_symbol ld option, if it does not
> + 	# work, assume that -exports_file does not work either and
> + 	# implicitly export all symbols.
> +-        save_LDFLAGS="$LDFLAGS"
> +-        LDFLAGS="$LDFLAGS -shared ${wl}-exported_symbol ${wl}foo ${wl}-update_registry ${wl}/dev/null"
> +-        cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> ++	# This should be the same for all languages, so no per-tag cache variable.
> ++	{ $as_echo "$as_me:${as_lineno-$LINENO}: checking whether the $host_os linker accepts -exported_symbol" >&5
> ++$as_echo_n "checking whether the $host_os linker accepts -exported_symbol... " >&6; }
> ++if ${lt_cv_irix_exported_symbol+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  save_LDFLAGS="$LDFLAGS"
> ++	   LDFLAGS="$LDFLAGS -shared ${wl}-exported_symbol ${wl}foo ${wl}-update_registry ${wl}/dev/null"
> ++	   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> + /* end confdefs.h.  */
> +-int foo(void) {}
> ++int foo (void) { return 0; }
> + _ACEOF
> + if ac_fn_c_try_link "$LINENO"; then :
> +-  archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations ${wl}-exports_file ${wl}$export_symbols -o $lib'
> +-
> ++  lt_cv_irix_exported_symbol=yes
> ++else
> ++  lt_cv_irix_exported_symbol=no
> + fi
> + rm -f core conftest.err conftest.$ac_objext \
> +     conftest$ac_exeext conftest.$ac_ext
> +-        LDFLAGS="$save_LDFLAGS"
> ++           LDFLAGS="$save_LDFLAGS"
> ++fi
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_irix_exported_symbol" >&5
> ++$as_echo "$lt_cv_irix_exported_symbol" >&6; }
> ++	if test "$lt_cv_irix_exported_symbol" = yes; then
> ++          archive_expsym_cmds='$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations ${wl}-exports_file ${wl}$export_symbols -o $lib'
> ++	fi
> +       else
> + 	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
> + 	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
> +@@ -10549,7 +11149,7 @@ rm -f core conftest.err conftest.$ac_objext \
> +     osf4* | osf5*)	# as osf3* with the addition of -msym flag
> +       if test "$GCC" = yes; then
> + 	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
> +-	archive_cmds='$CC -shared${allow_undefined_flag} $libobjs $deplibs $compiler_flags ${wl}-msym ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
> ++	archive_cmds='$CC -shared${allow_undefined_flag} $pic_flag $libobjs $deplibs $compiler_flags ${wl}-msym ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
> + 	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
> +       else
> + 	allow_undefined_flag=' -expect_unresolved \*'
> +@@ -10568,9 +11168,9 @@ rm -f core conftest.err conftest.$ac_objext \
> +       no_undefined_flag=' -z defs'
> +       if test "$GCC" = yes; then
> + 	wlarc='${wl}'
> +-	archive_cmds='$CC -shared ${wl}-z ${wl}text ${wl}-h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
> ++	archive_cmds='$CC -shared $pic_flag ${wl}-z ${wl}text ${wl}-h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
> + 	archive_expsym_cmds='echo "{ global:" > $lib.exp~cat $export_symbols | $SED -e "s/\(.*\)/\1;/" >> $lib.exp~echo "local: *; };" >> $lib.exp~
> +-	  $CC -shared ${wl}-z ${wl}text ${wl}-M ${wl}$lib.exp ${wl}-h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags~$RM $lib.exp'
> ++	  $CC -shared $pic_flag ${wl}-z ${wl}text ${wl}-M ${wl}$lib.exp ${wl}-h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags~$RM $lib.exp'
> +       else
> + 	case `$CC -V 2>&1` in
> + 	*"Compilers 5.0"*)
> +@@ -11146,8 +11746,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +   need_version=no
> +   need_lib_prefix=no
> + 
> +-  case $GCC,$host_os in
> +-  yes,cygwin* | yes,mingw* | yes,pw32* | yes,cegcc*)
> ++  case $GCC,$cc_basename in
> ++  yes,*)
> ++    # gcc
> +     library_names_spec='$libname.dll.a'
> +     # DLL is installed to $(libdir)/../bin by postinstall_cmds
> +     postinstall_cmds='base_file=`basename \${file}`~
> +@@ -11180,13 +11781,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +       library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
> +       ;;
> +     esac
> ++    dynamic_linker='Win32 ld.exe'
> ++    ;;
> ++
> ++  *,cl*)
> ++    # Native MSVC
> ++    libname_spec='$name'
> ++    soname_spec='${libname}`echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
> ++    library_names_spec='${libname}.dll.lib'
> ++
> ++    case $build_os in
> ++    mingw*)
> ++      sys_lib_search_path_spec=
> ++      lt_save_ifs=$IFS
> ++      IFS=';'
> ++      for lt_path in $LIB
> ++      do
> ++        IFS=$lt_save_ifs
> ++        # Let DOS variable expansion print the short 8.3 style file name.
> ++        lt_path=`cd "$lt_path" 2>/dev/null && cmd //C "for %i in (".") do @echo %~si"`
> ++        sys_lib_search_path_spec="$sys_lib_search_path_spec $lt_path"
> ++      done
> ++      IFS=$lt_save_ifs
> ++      # Convert to MSYS style.
> ++      sys_lib_search_path_spec=`$ECHO "$sys_lib_search_path_spec" | sed -e 's|\\\\|/|g' -e 's| \\([a-zA-Z]\\):| /\\1|g' -e 's|^ ||'`
> ++      ;;
> ++    cygwin*)
> ++      # Convert to unix form, then to dos form, then back to unix form
> ++      # but this time dos style (no spaces!) so that the unix form looks
> ++      # like /cygdrive/c/PROGRA~1:/cygdr...
> ++      sys_lib_search_path_spec=`cygpath --path --unix "$LIB"`
> ++      sys_lib_search_path_spec=`cygpath --path --dos "$sys_lib_search_path_spec" 2>/dev/null`
> ++      sys_lib_search_path_spec=`cygpath --path --unix "$sys_lib_search_path_spec" | $SED -e "s/$PATH_SEPARATOR/ /g"`
> ++      ;;
> ++    *)
> ++      sys_lib_search_path_spec="$LIB"
> ++      if $ECHO "$sys_lib_search_path_spec" | $GREP ';[c-zC-Z]:/' >/dev/null; then
> ++        # It is most probably a Windows format PATH.
> ++        sys_lib_search_path_spec=`$ECHO "$sys_lib_search_path_spec" | $SED -e 's/;/ /g'`
> ++      else
> ++        sys_lib_search_path_spec=`$ECHO "$sys_lib_search_path_spec" | $SED -e "s/$PATH_SEPARATOR/ /g"`
> ++      fi
> ++      # FIXME: find the short name or the path components, as spaces are
> ++      # common. (e.g. "Program Files" -> "PROGRA~1")
> ++      ;;
> ++    esac
> ++
> ++    # DLL is installed to $(libdir)/../bin by postinstall_cmds
> ++    postinstall_cmds='base_file=`basename \${file}`~
> ++      dlpath=`$SHELL 2>&1 -c '\''. $dir/'\''\${base_file}'\''i; echo \$dlname'\''`~
> ++      dldir=$destdir/`dirname \$dlpath`~
> ++      test -d \$dldir || mkdir -p \$dldir~
> ++      $install_prog $dir/$dlname \$dldir/$dlname'
> ++    postuninstall_cmds='dldll=`$SHELL 2>&1 -c '\''. $file; echo \$dlname'\''`~
> ++      dlpath=$dir/\$dldll~
> ++       $RM \$dlpath'
> ++    shlibpath_overrides_runpath=yes
> ++    dynamic_linker='Win32 link.exe'
> +     ;;
> + 
> +   *)
> ++    # Assume MSVC wrapper
> +     library_names_spec='${libname}`echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext} $libname.lib'
> ++    dynamic_linker='Win32 ld.exe'
> +     ;;
> +   esac
> +-  dynamic_linker='Win32 ld.exe'
> +   # FIXME: first we should search . and the directory the executable is in
> +   shlibpath_var=PATH
> +   ;;
> +@@ -12064,7 +12723,7 @@ else
> +   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
> +   lt_status=$lt_dlunknown
> +   cat > conftest.$ac_ext <<_LT_EOF
> +-#line 12067 "configure"
> ++#line $LINENO "configure"
> + #include "confdefs.h"
> + 
> + #if HAVE_DLFCN_H
> +@@ -12108,10 +12767,10 @@ else
> + /* When -fvisbility=hidden is used, assume the code has been annotated
> +    correspondingly for the symbols needed.  */
> + #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> +-void fnord () __attribute__((visibility("default")));
> ++int fnord () __attribute__((visibility("default")));
> + #endif
> + 
> +-void fnord () { int i=42; }
> ++int fnord () { return 42; }
> + int main ()
> + {
> +   void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> +@@ -12170,7 +12829,7 @@ else
> +   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
> +   lt_status=$lt_dlunknown
> +   cat > conftest.$ac_ext <<_LT_EOF
> +-#line 12173 "configure"
> ++#line $LINENO "configure"
> + #include "confdefs.h"
> + 
> + #if HAVE_DLFCN_H
> +@@ -12214,10 +12873,10 @@ else
> + /* When -fvisbility=hidden is used, assume the code has been annotated
> +    correspondingly for the symbols needed.  */
> + #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> +-void fnord () __attribute__((visibility("default")));
> ++int fnord () __attribute__((visibility("default")));
> + #endif
> + 
> +-void fnord () { int i=42; }
> ++int fnord () { return 42; }
> + int main ()
> + {
> +   void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> +@@ -12609,6 +13268,7 @@ $RM -r conftest*
> + 
> +   # Allow CC to be a program name with arguments.
> +   lt_save_CC=$CC
> ++  lt_save_CFLAGS=$CFLAGS
> +   lt_save_LD=$LD
> +   lt_save_GCC=$GCC
> +   GCC=$GXX
> +@@ -12626,6 +13286,7 @@ $RM -r conftest*
> +   fi
> +   test -z "${LDCXX+set}" || LD=$LDCXX
> +   CC=${CXX-"c++"}
> ++  CFLAGS=$CXXFLAGS
> +   compiler=$CC
> +   compiler_CXX=$CC
> +   for cc_temp in $compiler""; do
> +@@ -12908,7 +13569,13 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
> +           allow_undefined_flag_CXX='-berok'
> +           # Determine the default libpath from the value encoded in an empty
> +           # executable.
> +-          cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> ++          if test "${lt_cv_aix_libpath+set}" = set; then
> ++  aix_libpath=$lt_cv_aix_libpath
> ++else
> ++  if ${lt_cv_aix_libpath__CXX+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> + /* end confdefs.h.  */
> + 
> + int
> +@@ -12921,22 +13588,29 @@ main ()
> + _ACEOF
> + if ac_fn_cxx_try_link "$LINENO"; then :
> + 
> +-lt_aix_libpath_sed='
> +-    /Import File Strings/,/^$/ {
> +-	/^0/ {
> +-	    s/^0  *\(.*\)$/\1/
> +-	    p
> +-	}
> +-    }'
> +-aix_libpath=`dump -H conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
> +-# Check for a 64-bit object if we didn't find anything.
> +-if test -z "$aix_libpath"; then
> +-  aix_libpath=`dump -HX64 conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
> +-fi
> ++  lt_aix_libpath_sed='
> ++      /Import File Strings/,/^$/ {
> ++	  /^0/ {
> ++	      s/^0  *\([^ ]*\) *$/\1/
> ++	      p
> ++	  }
> ++      }'
> ++  lt_cv_aix_libpath__CXX=`dump -H conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
> ++  # Check for a 64-bit object if we didn't find anything.
> ++  if test -z "$lt_cv_aix_libpath__CXX"; then
> ++    lt_cv_aix_libpath__CXX=`dump -HX64 conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
> ++  fi
> + fi
> + rm -f core conftest.err conftest.$ac_objext \
> +     conftest$ac_exeext conftest.$ac_ext
> +-if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> ++  if test -z "$lt_cv_aix_libpath__CXX"; then
> ++    lt_cv_aix_libpath__CXX="/usr/lib:/lib"
> ++  fi
> ++
> ++fi
> ++
> ++  aix_libpath=$lt_cv_aix_libpath__CXX
> ++fi
> + 
> +           hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
> + 
> +@@ -12949,7 +13623,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +           else
> + 	    # Determine the default libpath from the value encoded in an
> + 	    # empty executable.
> +-	    cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> ++	    if test "${lt_cv_aix_libpath+set}" = set; then
> ++  aix_libpath=$lt_cv_aix_libpath
> ++else
> ++  if ${lt_cv_aix_libpath__CXX+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> + /* end confdefs.h.  */
> + 
> + int
> +@@ -12962,22 +13642,29 @@ main ()
> + _ACEOF
> + if ac_fn_cxx_try_link "$LINENO"; then :
> + 
> +-lt_aix_libpath_sed='
> +-    /Import File Strings/,/^$/ {
> +-	/^0/ {
> +-	    s/^0  *\(.*\)$/\1/
> +-	    p
> +-	}
> +-    }'
> +-aix_libpath=`dump -H conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
> +-# Check for a 64-bit object if we didn't find anything.
> +-if test -z "$aix_libpath"; then
> +-  aix_libpath=`dump -HX64 conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
> +-fi
> ++  lt_aix_libpath_sed='
> ++      /Import File Strings/,/^$/ {
> ++	  /^0/ {
> ++	      s/^0  *\([^ ]*\) *$/\1/
> ++	      p
> ++	  }
> ++      }'
> ++  lt_cv_aix_libpath__CXX=`dump -H conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
> ++  # Check for a 64-bit object if we didn't find anything.
> ++  if test -z "$lt_cv_aix_libpath__CXX"; then
> ++    lt_cv_aix_libpath__CXX=`dump -HX64 conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
> ++  fi
> + fi
> + rm -f core conftest.err conftest.$ac_objext \
> +     conftest$ac_exeext conftest.$ac_ext
> +-if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> ++  if test -z "$lt_cv_aix_libpath__CXX"; then
> ++    lt_cv_aix_libpath__CXX="/usr/lib:/lib"
> ++  fi
> ++
> ++fi
> ++
> ++  aix_libpath=$lt_cv_aix_libpath__CXX
> ++fi
> + 
> + 	    hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
> + 	    # Warning - without using the other run time loading flags,
> +@@ -13020,29 +13707,75 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +         ;;
> + 
> +       cygwin* | mingw* | pw32* | cegcc*)
> +-        # _LT_TAGVAR(hardcode_libdir_flag_spec, CXX) is actually meaningless,
> +-        # as there is no search path for DLLs.
> +-        hardcode_libdir_flag_spec_CXX='-L$libdir'
> +-        export_dynamic_flag_spec_CXX='${wl}--export-all-symbols'
> +-        allow_undefined_flag_CXX=unsupported
> +-        always_export_symbols_CXX=no
> +-        enable_shared_with_static_runtimes_CXX=yes
> +-
> +-        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
> +-          archive_cmds_CXX='$CC -shared -nostdlib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
> +-          # If the export-symbols file already is a .def file (1st line
> +-          # is EXPORTS), use it as is; otherwise, prepend...
> +-          archive_expsym_cmds_CXX='if test "x`$SED 1q $export_symbols`" = xEXPORTS; then
> +-	    cp $export_symbols $output_objdir/$soname.def;
> +-          else
> +-	    echo EXPORTS > $output_objdir/$soname.def;
> +-	    cat $export_symbols >> $output_objdir/$soname.def;
> +-          fi~
> +-          $CC -shared -nostdlib $output_objdir/$soname.def $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
> +-        else
> +-          ld_shlibs_CXX=no
> +-        fi
> +-        ;;
> ++	case $GXX,$cc_basename in
> ++	,cl* | no,cl*)
> ++	  # Native MSVC
> ++	  # hardcode_libdir_flag_spec is actually meaningless, as there is
> ++	  # no search path for DLLs.
> ++	  hardcode_libdir_flag_spec_CXX=' '
> ++	  allow_undefined_flag_CXX=unsupported
> ++	  always_export_symbols_CXX=yes
> ++	  file_list_spec_CXX='@'
> ++	  # Tell ltmain to make .lib files, not .a files.
> ++	  libext=lib
> ++	  # Tell ltmain to make .dll files, not .so files.
> ++	  shrext_cmds=".dll"
> ++	  # FIXME: Setting linknames here is a bad hack.
> ++	  archive_cmds_CXX='$CC -o $output_objdir/$soname $libobjs $compiler_flags $deplibs -Wl,-dll~linknames='
> ++	  archive_expsym_cmds_CXX='if test "x`$SED 1q $export_symbols`" = xEXPORTS; then
> ++	      $SED -n -e 's/\\\\\\\(.*\\\\\\\)/-link\\\ -EXPORT:\\\\\\\1/' -e '1\\\!p' < $export_symbols > $output_objdir/$soname.exp;
> ++	    else
> ++	      $SED -e 's/\\\\\\\(.*\\\\\\\)/-link\\\ -EXPORT:\\\\\\\1/' < $export_symbols > $output_objdir/$soname.exp;
> ++	    fi~
> ++	    $CC -o $tool_output_objdir$soname $libobjs $compiler_flags $deplibs "@$tool_output_objdir$soname.exp" -Wl,-DLL,-IMPLIB:"$tool_output_objdir$libname.dll.lib"~
> ++	    linknames='
> ++	  # The linker will not automatically build a static lib if we build a DLL.
> ++	  # _LT_TAGVAR(old_archive_from_new_cmds, CXX)='true'
> ++	  enable_shared_with_static_runtimes_CXX=yes
> ++	  # Don't use ranlib
> ++	  old_postinstall_cmds_CXX='chmod 644 $oldlib'
> ++	  postlink_cmds_CXX='lt_outputfile="@OUTPUT@"~
> ++	    lt_tool_outputfile="@TOOL_OUTPUT@"~
> ++	    case $lt_outputfile in
> ++	      *.exe|*.EXE) ;;
> ++	      *)
> ++		lt_outputfile="$lt_outputfile.exe"
> ++		lt_tool_outputfile="$lt_tool_outputfile.exe"
> ++		;;
> ++	    esac~
> ++	    func_to_tool_file "$lt_outputfile"~
> ++	    if test "$MANIFEST_TOOL" != ":" && test -f "$lt_outputfile.manifest"; then
> ++	      $MANIFEST_TOOL -manifest "$lt_tool_outputfile.manifest" -outputresource:"$lt_tool_outputfile" || exit 1;
> ++	      $RM "$lt_outputfile.manifest";
> ++	    fi'
> ++	  ;;
> ++	*)
> ++	  # g++
> ++	  # _LT_TAGVAR(hardcode_libdir_flag_spec, CXX) is actually meaningless,
> ++	  # as there is no search path for DLLs.
> ++	  hardcode_libdir_flag_spec_CXX='-L$libdir'
> ++	  export_dynamic_flag_spec_CXX='${wl}--export-all-symbols'
> ++	  allow_undefined_flag_CXX=unsupported
> ++	  always_export_symbols_CXX=no
> ++	  enable_shared_with_static_runtimes_CXX=yes
> ++
> ++	  if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
> ++	    archive_cmds_CXX='$CC -shared -nostdlib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
> ++	    # If the export-symbols file already is a .def file (1st line
> ++	    # is EXPORTS), use it as is; otherwise, prepend...
> ++	    archive_expsym_cmds_CXX='if test "x`$SED 1q $export_symbols`" = xEXPORTS; then
> ++	      cp $export_symbols $output_objdir/$soname.def;
> ++	    else
> ++	      echo EXPORTS > $output_objdir/$soname.def;
> ++	      cat $export_symbols >> $output_objdir/$soname.def;
> ++	    fi~
> ++	    $CC -shared -nostdlib $output_objdir/$soname.def $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
> ++	  else
> ++	    ld_shlibs_CXX=no
> ++	  fi
> ++	  ;;
> ++	esac
> ++	;;
> +       darwin* | rhapsody*)
> + 
> + 
> +@@ -13148,7 +13881,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +             ;;
> +           *)
> +             if test "$GXX" = yes; then
> +-              archive_cmds_CXX='$RM $output_objdir/$soname~$CC -shared -nostdlib -fPIC ${wl}+b ${wl}$install_libdir -o $output_objdir/$soname $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
> ++              archive_cmds_CXX='$RM $output_objdir/$soname~$CC -shared -nostdlib $pic_flag ${wl}+b ${wl}$install_libdir -o $output_objdir/$soname $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
> +             else
> +               # FIXME: insert proper C++ library support
> +               ld_shlibs_CXX=no
> +@@ -13219,10 +13952,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> + 	            archive_cmds_CXX='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
> + 	            ;;
> + 	          ia64*)
> +-	            archive_cmds_CXX='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
> ++	            archive_cmds_CXX='$CC -shared -nostdlib $pic_flag ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
> + 	            ;;
> + 	          *)
> +-	            archive_cmds_CXX='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname ${wl}+b ${wl}$install_libdir -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
> ++	            archive_cmds_CXX='$CC -shared -nostdlib $pic_flag ${wl}+h ${wl}$soname ${wl}+b ${wl}$install_libdir -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
> + 	            ;;
> + 	        esac
> + 	      fi
> +@@ -13263,9 +13996,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +           *)
> + 	    if test "$GXX" = yes; then
> + 	      if test "$with_gnu_ld" = no; then
> +-	        archive_cmds_CXX='$CC -shared -nostdlib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
> ++	        archive_cmds_CXX='$CC -shared $pic_flag -nostdlib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
> + 	      else
> +-	        archive_cmds_CXX='$CC -shared -nostdlib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` -o $lib'
> ++	        archive_cmds_CXX='$CC -shared $pic_flag -nostdlib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` -o $lib'
> + 	      fi
> + 	    fi
> + 	    link_all_deplibs_CXX=yes
> +@@ -13335,20 +14068,20 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> + 	      prelink_cmds_CXX='tpldir=Template.dir~
> + 		rm -rf $tpldir~
> + 		$CC --prelink_objects --instantiation_dir $tpldir $objs $libobjs $compile_deplibs~
> +-		compile_command="$compile_command `find $tpldir -name \*.o | $NL2SP`"'
> ++		compile_command="$compile_command `find $tpldir -name \*.o | sort | $NL2SP`"'
> + 	      old_archive_cmds_CXX='tpldir=Template.dir~
> + 		rm -rf $tpldir~
> + 		$CC --prelink_objects --instantiation_dir $tpldir $oldobjs$old_deplibs~
> +-		$AR $AR_FLAGS $oldlib$oldobjs$old_deplibs `find $tpldir -name \*.o | $NL2SP`~
> ++		$AR $AR_FLAGS $oldlib$oldobjs$old_deplibs `find $tpldir -name \*.o | sort | $NL2SP`~
> + 		$RANLIB $oldlib'
> + 	      archive_cmds_CXX='tpldir=Template.dir~
> + 		rm -rf $tpldir~
> + 		$CC --prelink_objects --instantiation_dir $tpldir $predep_objects $libobjs $deplibs $convenience $postdep_objects~
> +-		$CC -shared $pic_flag $predep_objects $libobjs $deplibs `find $tpldir -name \*.o | $NL2SP` $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
> ++		$CC -shared $pic_flag $predep_objects $libobjs $deplibs `find $tpldir -name \*.o | sort | $NL2SP` $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
> + 	      archive_expsym_cmds_CXX='tpldir=Template.dir~
> + 		rm -rf $tpldir~
> + 		$CC --prelink_objects --instantiation_dir $tpldir $predep_objects $libobjs $deplibs $convenience $postdep_objects~
> +-		$CC -shared $pic_flag $predep_objects $libobjs $deplibs `find $tpldir -name \*.o | $NL2SP` $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname ${wl}-retain-symbols-file ${wl}$export_symbols -o $lib'
> ++		$CC -shared $pic_flag $predep_objects $libobjs $deplibs `find $tpldir -name \*.o | sort | $NL2SP` $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname ${wl}-retain-symbols-file ${wl}$export_symbols -o $lib'
> + 	      ;;
> + 	    *) # Version 6 and above use weak symbols
> + 	      archive_cmds_CXX='$CC -shared $pic_flag $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
> +@@ -13543,7 +14276,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> + 	          archive_cmds_CXX='$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
> + 		  ;;
> + 	        *)
> +-	          archive_cmds_CXX='$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-msym ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
> ++	          archive_cmds_CXX='$CC -shared $pic_flag -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-msym ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
> + 		  ;;
> + 	      esac
> + 
> +@@ -13589,7 +14322,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> + 
> +       solaris*)
> +         case $cc_basename in
> +-          CC*)
> ++          CC* | sunCC*)
> + 	    # Sun C++ 4.2, 5.x and Centerline C++
> +             archive_cmds_need_lc_CXX=yes
> + 	    no_undefined_flag_CXX=' -zdefs'
> +@@ -13630,9 +14363,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> + 	    if test "$GXX" = yes && test "$with_gnu_ld" = no; then
> + 	      no_undefined_flag_CXX=' ${wl}-z ${wl}defs'
> + 	      if $CC --version | $GREP -v '^2\.7' > /dev/null; then
> +-	        archive_cmds_CXX='$CC -shared -nostdlib $LDFLAGS $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-h $wl$soname -o $lib'
> ++	        archive_cmds_CXX='$CC -shared $pic_flag -nostdlib $LDFLAGS $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-h $wl$soname -o $lib'
> + 	        archive_expsym_cmds_CXX='echo "{ global:" > $lib.exp~cat $export_symbols | $SED -e "s/\(.*\)/\1;/" >> $lib.exp~echo "local: *; };" >> $lib.exp~
> +-		  $CC -shared -nostdlib ${wl}-M $wl$lib.exp -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags~$RM $lib.exp'
> ++		  $CC -shared $pic_flag -nostdlib ${wl}-M $wl$lib.exp -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags~$RM $lib.exp'
> + 
> + 	        # Commands to make compiler produce verbose output that lists
> + 	        # what "hidden" libraries, object files and flags are used when
> +@@ -13767,6 +14500,13 @@ private:
> + };
> + _LT_EOF
> + 
> ++
> ++_lt_libdeps_save_CFLAGS=$CFLAGS
> ++case "$CC $CFLAGS " in #(
> ++*\ -flto*\ *) CFLAGS="$CFLAGS -fno-lto" ;;
> ++*\ -fwhopr*\ *) CFLAGS="$CFLAGS -fno-whopr" ;;
> ++esac
> ++
> + if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
> +   (eval $ac_compile) 2>&5
> +   ac_status=$?
> +@@ -13780,7 +14520,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
> +   pre_test_object_deps_done=no
> + 
> +   for p in `eval "$output_verbose_link_cmd"`; do
> +-    case $p in
> ++    case ${prev}${p} in
> + 
> +     -L* | -R* | -l*)
> +        # Some compilers place space between "-{L,R}" and the path.
> +@@ -13789,13 +14529,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
> +           test $p = "-R"; then
> + 	 prev=$p
> + 	 continue
> +-       else
> +-	 prev=
> +        fi
> + 
> ++       # Expand the sysroot to ease extracting the directories later.
> ++       if test -z "$prev"; then
> ++         case $p in
> ++         -L*) func_stripname_cnf '-L' '' "$p"; prev=-L; p=$func_stripname_result ;;
> ++         -R*) func_stripname_cnf '-R' '' "$p"; prev=-R; p=$func_stripname_result ;;
> ++         -l*) func_stripname_cnf '-l' '' "$p"; prev=-l; p=$func_stripname_result ;;
> ++         esac
> ++       fi
> ++       case $p in
> ++       =*) func_stripname_cnf '=' '' "$p"; p=$lt_sysroot$func_stripname_result ;;
> ++       esac
> +        if test "$pre_test_object_deps_done" = no; then
> +-	 case $p in
> +-	 -L* | -R*)
> ++	 case ${prev} in
> ++	 -L | -R)
> + 	   # Internal compiler library paths should come after those
> + 	   # provided the user.  The postdeps already come after the
> + 	   # user supplied libs so there is no need to process them.
> +@@ -13815,8 +14564,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
> + 	   postdeps_CXX="${postdeps_CXX} ${prev}${p}"
> + 	 fi
> +        fi
> ++       prev=
> +        ;;
> + 
> ++    *.lto.$objext) ;; # Ignore GCC LTO objects
> +     *.$objext)
> +        # This assumes that the test object file only shows up
> +        # once in the compiler output.
> +@@ -13852,6 +14603,7 @@ else
> + fi
> + 
> + $RM -f confest.$objext
> ++CFLAGS=$_lt_libdeps_save_CFLAGS
> + 
> + # PORTME: override above test on systems where it is broken
> + case $host_os in
> +@@ -13887,7 +14639,7 @@ linux*)
> + 
> + solaris*)
> +   case $cc_basename in
> +-  CC*)
> ++  CC* | sunCC*)
> +     # The more standards-conforming stlport4 library is
> +     # incompatible with the Cstd library. Avoid specifying
> +     # it if it's in CXXFLAGS. Ignore libCrun as
> +@@ -13952,8 +14704,6 @@ fi
> + lt_prog_compiler_pic_CXX=
> + lt_prog_compiler_static_CXX=
> + 
> +-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $compiler option to produce PIC" >&5
> +-$as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> + 
> +   # C++ specific cases for pic, static, wl, etc.
> +   if test "$GXX" = yes; then
> +@@ -14058,6 +14808,11 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> + 	  ;;
> + 	esac
> + 	;;
> ++      mingw* | cygwin* | os2* | pw32* | cegcc*)
> ++	# This hack is so that the source file can tell whether it is being
> ++	# built for inclusion in a dll (and should export symbols for example).
> ++	lt_prog_compiler_pic_CXX='-DDLL_EXPORT'
> ++	;;
> +       dgux*)
> + 	case $cc_basename in
> + 	  ec++*)
> +@@ -14210,7 +14965,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> + 	;;
> +       solaris*)
> + 	case $cc_basename in
> +-	  CC*)
> ++	  CC* | sunCC*)
> + 	    # Sun C++ 4.2, 5.x and Centerline C++
> + 	    lt_prog_compiler_pic_CXX='-KPIC'
> + 	    lt_prog_compiler_static_CXX='-Bstatic'
> +@@ -14275,10 +15030,17 @@ case $host_os in
> +     lt_prog_compiler_pic_CXX="$lt_prog_compiler_pic_CXX -DPIC"
> +     ;;
> + esac
> +-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_prog_compiler_pic_CXX" >&5
> +-$as_echo "$lt_prog_compiler_pic_CXX" >&6; }
> +-
> + 
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $compiler option to produce PIC" >&5
> ++$as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> ++if ${lt_cv_prog_compiler_pic_CXX+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  lt_cv_prog_compiler_pic_CXX=$lt_prog_compiler_pic_CXX
> ++fi
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_prog_compiler_pic_CXX" >&5
> ++$as_echo "$lt_cv_prog_compiler_pic_CXX" >&6; }
> ++lt_prog_compiler_pic_CXX=$lt_cv_prog_compiler_pic_CXX
> + 
> + #
> + # Check to make sure the PIC flag actually works.
> +@@ -14336,6 +15098,8 @@ fi
> + 
> + 
> + 
> ++
> ++
> + #
> + # Check to make sure the static flag actually works.
> + #
> +@@ -14513,6 +15277,7 @@ fi
> + $as_echo_n "checking whether the $compiler linker ($LD) supports shared libraries... " >&6; }
> + 
> +   export_symbols_cmds_CXX='$NM $libobjs $convenience | $global_symbol_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
> ++  exclude_expsyms_CXX='_GLOBAL_OFFSET_TABLE_|_GLOBAL__F[ID]_.*'
> +   case $host_os in
> +   aix[4-9]*)
> +     # If we're using GNU nm, then we don't want the "-C" option.
> +@@ -14527,15 +15292,20 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
> +     ;;
> +   pw32*)
> +     export_symbols_cmds_CXX="$ltdll_cmds"
> +-  ;;
> ++    ;;
> +   cygwin* | mingw* | cegcc*)
> +-    export_symbols_cmds_CXX='$NM $libobjs $convenience | $global_symbol_pipe | $SED -e '\''/^[BCDGRS][ ]/s/.*[ ]\([^ ]*\)/\1 DATA/;/^.*[ ]__nm__/s/^.*[ ]__nm__\([^ ]*\)[ ][^ ]*/\1 DATA/;/^I[ ]/d;/^[AITW][ ]/s/.* //'\'' | sort | uniq > $export_symbols'
> +-  ;;
> ++    case $cc_basename in
> ++    cl*) ;;
> ++    *)
> ++      export_symbols_cmds_CXX='$NM $libobjs $convenience | $global_symbol_pipe | $SED -e '\''/^[BCDGRS][ ]/s/.*[ ]\([^ ]*\)/\1 DATA/;s/^.*[ ]__nm__\([^ ]*\)[ ][^ ]*/\1 DATA/;/^I[ ]/d;/^[AITW][ ]/s/.* //'\'' | sort | uniq > $export_symbols'
> ++      exclude_expsyms_CXX='[_]+GLOBAL_OFFSET_TABLE_|[_]+GLOBAL__[FID]_.*|[_]+head_[A-Za-z0-9_]+_dll|[A-Za-z0-9_]+_dll_iname'
> ++      ;;
> ++    esac
> ++    ;;
> +   *)
> +     export_symbols_cmds_CXX='$NM $libobjs $convenience | $global_symbol_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
> +-  ;;
> ++    ;;
> +   esac
> +-  exclude_expsyms_CXX='_GLOBAL_OFFSET_TABLE_|_GLOBAL__F[ID]_.*'
> + 
> + { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ld_shlibs_CXX" >&5
> + $as_echo "$ld_shlibs_CXX" >&6; }
> +@@ -14798,8 +15568,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +   need_version=no
> +   need_lib_prefix=no
> + 
> +-  case $GCC,$host_os in
> +-  yes,cygwin* | yes,mingw* | yes,pw32* | yes,cegcc*)
> ++  case $GCC,$cc_basename in
> ++  yes,*)
> ++    # gcc
> +     library_names_spec='$libname.dll.a'
> +     # DLL is installed to $(libdir)/../bin by postinstall_cmds
> +     postinstall_cmds='base_file=`basename \${file}`~
> +@@ -14831,13 +15602,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +       library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
> +       ;;
> +     esac
> ++    dynamic_linker='Win32 ld.exe'
> ++    ;;
> ++
> ++  *,cl*)
> ++    # Native MSVC
> ++    libname_spec='$name'
> ++    soname_spec='${libname}`echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
> ++    library_names_spec='${libname}.dll.lib'
> ++
> ++    case $build_os in
> ++    mingw*)
> ++      sys_lib_search_path_spec=
> ++      lt_save_ifs=$IFS
> ++      IFS=';'
> ++      for lt_path in $LIB
> ++      do
> ++        IFS=$lt_save_ifs
> ++        # Let DOS variable expansion print the short 8.3 style file name.
> ++        lt_path=`cd "$lt_path" 2>/dev/null && cmd //C "for %i in (".") do @echo %~si"`
> ++        sys_lib_search_path_spec="$sys_lib_search_path_spec $lt_path"
> ++      done
> ++      IFS=$lt_save_ifs
> ++      # Convert to MSYS style.
> ++      sys_lib_search_path_spec=`$ECHO "$sys_lib_search_path_spec" | sed -e 's|\\\\|/|g' -e 's| \\([a-zA-Z]\\):| /\\1|g' -e 's|^ ||'`
> ++      ;;
> ++    cygwin*)
> ++      # Convert to unix form, then to dos form, then back to unix form
> ++      # but this time dos style (no spaces!) so that the unix form looks
> ++      # like /cygdrive/c/PROGRA~1:/cygdr...
> ++      sys_lib_search_path_spec=`cygpath --path --unix "$LIB"`
> ++      sys_lib_search_path_spec=`cygpath --path --dos "$sys_lib_search_path_spec" 2>/dev/null`
> ++      sys_lib_search_path_spec=`cygpath --path --unix "$sys_lib_search_path_spec" | $SED -e "s/$PATH_SEPARATOR/ /g"`
> ++      ;;
> ++    *)
> ++      sys_lib_search_path_spec="$LIB"
> ++      if $ECHO "$sys_lib_search_path_spec" | $GREP ';[c-zC-Z]:/' >/dev/null; then
> ++        # It is most probably a Windows format PATH.
> ++        sys_lib_search_path_spec=`$ECHO "$sys_lib_search_path_spec" | $SED -e 's/;/ /g'`
> ++      else
> ++        sys_lib_search_path_spec=`$ECHO "$sys_lib_search_path_spec" | $SED -e "s/$PATH_SEPARATOR/ /g"`
> ++      fi
> ++      # FIXME: find the short name or the path components, as spaces are
> ++      # common. (e.g. "Program Files" -> "PROGRA~1")
> ++      ;;
> ++    esac
> ++
> ++    # DLL is installed to $(libdir)/../bin by postinstall_cmds
> ++    postinstall_cmds='base_file=`basename \${file}`~
> ++      dlpath=`$SHELL 2>&1 -c '\''. $dir/'\''\${base_file}'\''i; echo \$dlname'\''`~
> ++      dldir=$destdir/`dirname \$dlpath`~
> ++      test -d \$dldir || mkdir -p \$dldir~
> ++      $install_prog $dir/$dlname \$dldir/$dlname'
> ++    postuninstall_cmds='dldll=`$SHELL 2>&1 -c '\''. $file; echo \$dlname'\''`~
> ++      dlpath=$dir/\$dldll~
> ++       $RM \$dlpath'
> ++    shlibpath_overrides_runpath=yes
> ++    dynamic_linker='Win32 link.exe'
> +     ;;
> + 
> +   *)
> ++    # Assume MSVC wrapper
> +     library_names_spec='${libname}`echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext} $libname.lib'
> ++    dynamic_linker='Win32 ld.exe'
> +     ;;
> +   esac
> +-  dynamic_linker='Win32 ld.exe'
> +   # FIXME: first we should search . and the directory the executable is in
> +   shlibpath_var=PATH
> +   ;;
> +@@ -15377,6 +16206,7 @@ fi
> +   fi # test -n "$compiler"
> + 
> +   CC=$lt_save_CC
> ++  CFLAGS=$lt_save_CFLAGS
> +   LDCXX=$LD
> +   LD=$lt_save_LD
> +   GCC=$lt_save_GCC
> +@@ -16321,13 +17151,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
> + lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
> + lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
> + lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> ++lt_cv_to_host_file_cmd='`$ECHO "$lt_cv_to_host_file_cmd" | $SED "$delay_single_quote_subst"`'
> ++lt_cv_to_tool_file_cmd='`$ECHO "$lt_cv_to_tool_file_cmd" | $SED "$delay_single_quote_subst"`'
> + reload_flag='`$ECHO "$reload_flag" | $SED "$delay_single_quote_subst"`'
> + reload_cmds='`$ECHO "$reload_cmds" | $SED "$delay_single_quote_subst"`'
> + OBJDUMP='`$ECHO "$OBJDUMP" | $SED "$delay_single_quote_subst"`'
> + deplibs_check_method='`$ECHO "$deplibs_check_method" | $SED "$delay_single_quote_subst"`'
> + file_magic_cmd='`$ECHO "$file_magic_cmd" | $SED "$delay_single_quote_subst"`'
> ++file_magic_glob='`$ECHO "$file_magic_glob" | $SED "$delay_single_quote_subst"`'
> ++want_nocaseglob='`$ECHO "$want_nocaseglob" | $SED "$delay_single_quote_subst"`'
> ++DLLTOOL='`$ECHO "$DLLTOOL" | $SED "$delay_single_quote_subst"`'
> ++sharedlib_from_linklib_cmd='`$ECHO "$sharedlib_from_linklib_cmd" | $SED "$delay_single_quote_subst"`'
> + AR='`$ECHO "$AR" | $SED "$delay_single_quote_subst"`'
> + AR_FLAGS='`$ECHO "$AR_FLAGS" | $SED "$delay_single_quote_subst"`'
> ++archiver_list_spec='`$ECHO "$archiver_list_spec" | $SED "$delay_single_quote_subst"`'
> + STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
> + RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
> + old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
> +@@ -16342,14 +17179,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
> + lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
> + lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
> + lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
> ++nm_file_list_spec='`$ECHO "$nm_file_list_spec" | $SED "$delay_single_quote_subst"`'
> ++lt_sysroot='`$ECHO "$lt_sysroot" | $SED "$delay_single_quote_subst"`'
> + objdir='`$ECHO "$objdir" | $SED "$delay_single_quote_subst"`'
> + MAGIC_CMD='`$ECHO "$MAGIC_CMD" | $SED "$delay_single_quote_subst"`'
> + lt_prog_compiler_no_builtin_flag='`$ECHO "$lt_prog_compiler_no_builtin_flag" | $SED "$delay_single_quote_subst"`'
> +-lt_prog_compiler_wl='`$ECHO "$lt_prog_compiler_wl" | $SED "$delay_single_quote_subst"`'
> + lt_prog_compiler_pic='`$ECHO "$lt_prog_compiler_pic" | $SED "$delay_single_quote_subst"`'
> ++lt_prog_compiler_wl='`$ECHO "$lt_prog_compiler_wl" | $SED "$delay_single_quote_subst"`'
> + lt_prog_compiler_static='`$ECHO "$lt_prog_compiler_static" | $SED "$delay_single_quote_subst"`'
> + lt_cv_prog_compiler_c_o='`$ECHO "$lt_cv_prog_compiler_c_o" | $SED "$delay_single_quote_subst"`'
> + need_locks='`$ECHO "$need_locks" | $SED "$delay_single_quote_subst"`'
> ++MANIFEST_TOOL='`$ECHO "$MANIFEST_TOOL" | $SED "$delay_single_quote_subst"`'
> + DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
> + NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
> + LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> +@@ -16382,12 +17222,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
> + hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
> + inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
> + link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
> +-fix_srcfile_path='`$ECHO "$fix_srcfile_path" | $SED "$delay_single_quote_subst"`'
> + always_export_symbols='`$ECHO "$always_export_symbols" | $SED "$delay_single_quote_subst"`'
> + export_symbols_cmds='`$ECHO "$export_symbols_cmds" | $SED "$delay_single_quote_subst"`'
> + exclude_expsyms='`$ECHO "$exclude_expsyms" | $SED "$delay_single_quote_subst"`'
> + include_expsyms='`$ECHO "$include_expsyms" | $SED "$delay_single_quote_subst"`'
> + prelink_cmds='`$ECHO "$prelink_cmds" | $SED "$delay_single_quote_subst"`'
> ++postlink_cmds='`$ECHO "$postlink_cmds" | $SED "$delay_single_quote_subst"`'
> + file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
> + variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
> + need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
> +@@ -16426,8 +17266,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archive_cmds_CXX" | $SED "$delay_single_quote
> + compiler_CXX='`$ECHO "$compiler_CXX" | $SED "$delay_single_quote_subst"`'
> + GCC_CXX='`$ECHO "$GCC_CXX" | $SED "$delay_single_quote_subst"`'
> + lt_prog_compiler_no_builtin_flag_CXX='`$ECHO "$lt_prog_compiler_no_builtin_flag_CXX" | $SED "$delay_single_quote_subst"`'
> +-lt_prog_compiler_wl_CXX='`$ECHO "$lt_prog_compiler_wl_CXX" | $SED "$delay_single_quote_subst"`'
> + lt_prog_compiler_pic_CXX='`$ECHO "$lt_prog_compiler_pic_CXX" | $SED "$delay_single_quote_subst"`'
> ++lt_prog_compiler_wl_CXX='`$ECHO "$lt_prog_compiler_wl_CXX" | $SED "$delay_single_quote_subst"`'
> + lt_prog_compiler_static_CXX='`$ECHO "$lt_prog_compiler_static_CXX" | $SED "$delay_single_quote_subst"`'
> + lt_cv_prog_compiler_c_o_CXX='`$ECHO "$lt_cv_prog_compiler_c_o_CXX" | $SED "$delay_single_quote_subst"`'
> + archive_cmds_need_lc_CXX='`$ECHO "$archive_cmds_need_lc_CXX" | $SED "$delay_single_quote_subst"`'
> +@@ -16454,12 +17294,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$hardcode_shlibpath_var_CXX" | $SED "$delay_
> + hardcode_automatic_CXX='`$ECHO "$hardcode_automatic_CXX" | $SED "$delay_single_quote_subst"`'
> + inherit_rpath_CXX='`$ECHO "$inherit_rpath_CXX" | $SED "$delay_single_quote_subst"`'
> + link_all_deplibs_CXX='`$ECHO "$link_all_deplibs_CXX" | $SED "$delay_single_quote_subst"`'
> +-fix_srcfile_path_CXX='`$ECHO "$fix_srcfile_path_CXX" | $SED "$delay_single_quote_subst"`'
> + always_export_symbols_CXX='`$ECHO "$always_export_symbols_CXX" | $SED "$delay_single_quote_subst"`'
> + export_symbols_cmds_CXX='`$ECHO "$export_symbols_cmds_CXX" | $SED "$delay_single_quote_subst"`'
> + exclude_expsyms_CXX='`$ECHO "$exclude_expsyms_CXX" | $SED "$delay_single_quote_subst"`'
> + include_expsyms_CXX='`$ECHO "$include_expsyms_CXX" | $SED "$delay_single_quote_subst"`'
> + prelink_cmds_CXX='`$ECHO "$prelink_cmds_CXX" | $SED "$delay_single_quote_subst"`'
> ++postlink_cmds_CXX='`$ECHO "$postlink_cmds_CXX" | $SED "$delay_single_quote_subst"`'
> + file_list_spec_CXX='`$ECHO "$file_list_spec_CXX" | $SED "$delay_single_quote_subst"`'
> + hardcode_action_CXX='`$ECHO "$hardcode_action_CXX" | $SED "$delay_single_quote_subst"`'
> + compiler_lib_search_dirs_CXX='`$ECHO "$compiler_lib_search_dirs_CXX" | $SED "$delay_single_quote_subst"`'
> +@@ -16497,8 +17337,13 @@ reload_flag \
> + OBJDUMP \
> + deplibs_check_method \
> + file_magic_cmd \
> ++file_magic_glob \
> ++want_nocaseglob \
> ++DLLTOOL \
> ++sharedlib_from_linklib_cmd \
> + AR \
> + AR_FLAGS \
> ++archiver_list_spec \
> + STRIP \
> + RANLIB \
> + CC \
> +@@ -16508,12 +17353,14 @@ lt_cv_sys_global_symbol_pipe \
> + lt_cv_sys_global_symbol_to_cdecl \
> + lt_cv_sys_global_symbol_to_c_name_address \
> + lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> ++nm_file_list_spec \
> + lt_prog_compiler_no_builtin_flag \
> +-lt_prog_compiler_wl \
> + lt_prog_compiler_pic \
> ++lt_prog_compiler_wl \
> + lt_prog_compiler_static \
> + lt_cv_prog_compiler_c_o \
> + need_locks \
> ++MANIFEST_TOOL \
> + DSYMUTIL \
> + NMEDIT \
> + LIPO \
> +@@ -16529,7 +17376,6 @@ no_undefined_flag \
> + hardcode_libdir_flag_spec \
> + hardcode_libdir_flag_spec_ld \
> + hardcode_libdir_separator \
> +-fix_srcfile_path \
> + exclude_expsyms \
> + include_expsyms \
> + file_list_spec \
> +@@ -16551,8 +17397,8 @@ LD_CXX \
> + reload_flag_CXX \
> + compiler_CXX \
> + lt_prog_compiler_no_builtin_flag_CXX \
> +-lt_prog_compiler_wl_CXX \
> + lt_prog_compiler_pic_CXX \
> ++lt_prog_compiler_wl_CXX \
> + lt_prog_compiler_static_CXX \
> + lt_cv_prog_compiler_c_o_CXX \
> + export_dynamic_flag_spec_CXX \
> +@@ -16564,7 +17410,6 @@ no_undefined_flag_CXX \
> + hardcode_libdir_flag_spec_CXX \
> + hardcode_libdir_flag_spec_ld_CXX \
> + hardcode_libdir_separator_CXX \
> +-fix_srcfile_path_CXX \
> + exclude_expsyms_CXX \
> + include_expsyms_CXX \
> + file_list_spec_CXX \
> +@@ -16598,6 +17443,7 @@ module_cmds \
> + module_expsym_cmds \
> + export_symbols_cmds \
> + prelink_cmds \
> ++postlink_cmds \
> + postinstall_cmds \
> + postuninstall_cmds \
> + finish_cmds \
> +@@ -16612,7 +17458,8 @@ archive_expsym_cmds_CXX \
> + module_cmds_CXX \
> + module_expsym_cmds_CXX \
> + export_symbols_cmds_CXX \
> +-prelink_cmds_CXX; do
> ++prelink_cmds_CXX \
> ++postlink_cmds_CXX; do
> +     case \`eval \\\\\$ECHO \\\\""\\\\\$\$var"\\\\"\` in
> +     *[\\\\\\\`\\"\\\$]*)
> +       eval "lt_\$var=\\\\\\"\\\`\\\$ECHO \\"\\\$\$var\\" | \\\$SED -e \\"\\\$double_quote_subst\\" -e \\"\\\$sed_quote_subst\\" -e \\"\\\$delay_variable_subst\\"\\\`\\\\\\""
> +@@ -17366,7 +18213,8 @@ $as_echo X"$file" |
> + # NOTE: Changes made to this file will be lost: look at ltmain.sh.
> + #
> + #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> +-#                 2006, 2007, 2008, 2009 Free Software Foundation, Inc.
> ++#                 2006, 2007, 2008, 2009, 2010 Free Software Foundation,
> ++#                 Inc.
> + #   Written by Gordon Matzigkeit, 1996
> + #
> + #   This file is part of GNU Libtool.
> +@@ -17469,19 +18317,42 @@ SP2NL=$lt_lt_SP2NL
> + # turn newlines into spaces.
> + NL2SP=$lt_lt_NL2SP
> + 
> ++# convert \$build file names to \$host format.
> ++to_host_file_cmd=$lt_cv_to_host_file_cmd
> ++
> ++# convert \$build files to toolchain format.
> ++to_tool_file_cmd=$lt_cv_to_tool_file_cmd
> ++
> + # An object symbol dumper.
> + OBJDUMP=$lt_OBJDUMP
> + 
> + # Method to check whether dependent libraries are shared objects.
> + deplibs_check_method=$lt_deplibs_check_method
> + 
> +-# Command to use when deplibs_check_method == "file_magic".
> ++# Command to use when deplibs_check_method = "file_magic".
> + file_magic_cmd=$lt_file_magic_cmd
> + 
> ++# How to find potential files when deplibs_check_method = "file_magic".
> ++file_magic_glob=$lt_file_magic_glob
> ++
> ++# Find potential files using nocaseglob when deplibs_check_method = "file_magic".
> ++want_nocaseglob=$lt_want_nocaseglob
> ++
> ++# DLL creation program.
> ++DLLTOOL=$lt_DLLTOOL
> ++
> ++# Command to associate shared and link libraries.
> ++sharedlib_from_linklib_cmd=$lt_sharedlib_from_linklib_cmd
> ++
> + # The archiver.
> + AR=$lt_AR
> ++
> ++# Flags to create an archive.
> + AR_FLAGS=$lt_AR_FLAGS
> + 
> ++# How to feed a file listing to the archiver.
> ++archiver_list_spec=$lt_archiver_list_spec
> ++
> + # A symbol stripping program.
> + STRIP=$lt_STRIP
> + 
> +@@ -17511,6 +18382,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
> + # Transform the output of nm in a C name address pair when lib prefix is needed.
> + global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
> + 
> ++# Specify filename containing input files for \$NM.
> ++nm_file_list_spec=$lt_nm_file_list_spec
> ++
> ++# The root where to search for dependent libraries,and in which our libraries should be installed.
> ++lt_sysroot=$lt_sysroot
> ++
> + # The name of the directory that contains temporary libtool files.
> + objdir=$objdir
> + 
> +@@ -17520,6 +18397,9 @@ MAGIC_CMD=$MAGIC_CMD
> + # Must we lock files when doing compilation?
> + need_locks=$lt_need_locks
> + 
> ++# Manifest tool.
> ++MANIFEST_TOOL=$lt_MANIFEST_TOOL
> ++
> + # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
> + DSYMUTIL=$lt_DSYMUTIL
> + 
> +@@ -17634,12 +18514,12 @@ with_gcc=$GCC
> + # Compiler flag to turn off builtin functions.
> + no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
> + 
> +-# How to pass a linker flag through the compiler.
> +-wl=$lt_lt_prog_compiler_wl
> +-
> + # Additional compiler flags for building library objects.
> + pic_flag=$lt_lt_prog_compiler_pic
> + 
> ++# How to pass a linker flag through the compiler.
> ++wl=$lt_lt_prog_compiler_wl
> ++
> + # Compiler flag to prevent dynamic linking.
> + link_static_flag=$lt_lt_prog_compiler_static
> + 
> +@@ -17726,9 +18606,6 @@ inherit_rpath=$inherit_rpath
> + # Whether libtool must link a program against all its dependency libraries.
> + link_all_deplibs=$link_all_deplibs
> + 
> +-# Fix the shell variable \$srcfile for the compiler.
> +-fix_srcfile_path=$lt_fix_srcfile_path
> +-
> + # Set to "yes" if exported symbols are required.
> + always_export_symbols=$always_export_symbols
> + 
> +@@ -17744,6 +18621,9 @@ include_expsyms=$lt_include_expsyms
> + # Commands necessary for linking programs (against libraries) with templates.
> + prelink_cmds=$lt_prelink_cmds
> + 
> ++# Commands necessary for finishing linking programs.
> ++postlink_cmds=$lt_postlink_cmds
> ++
> + # Specify filename containing input files.
> + file_list_spec=$lt_file_list_spec
> + 
> +@@ -17790,210 +18670,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
> +   # if finds mixed CR/LF and LF-only lines.  Since sed operates in
> +   # text mode, it properly converts lines to CR/LF.  This bash problem
> +   # is reportedly fixed, but why not run on old versions too?
> +-  sed '/^# Generated shell functions inserted here/q' "$ltmain" >> "$cfgfile" \
> +-    || (rm -f "$cfgfile"; exit 1)
> +-
> +-  case $xsi_shell in
> +-  yes)
> +-    cat << \_LT_EOF >> "$cfgfile"
> +-
> +-# func_dirname file append nondir_replacement
> +-# Compute the dirname of FILE.  If nonempty, add APPEND to the result,
> +-# otherwise set result to NONDIR_REPLACEMENT.
> +-func_dirname ()
> +-{
> +-  case ${1} in
> +-    */*) func_dirname_result="${1%/*}${2}" ;;
> +-    *  ) func_dirname_result="${3}" ;;
> +-  esac
> +-}
> +-
> +-# func_basename file
> +-func_basename ()
> +-{
> +-  func_basename_result="${1##*/}"
> +-}
> +-
> +-# func_dirname_and_basename file append nondir_replacement
> +-# perform func_basename and func_dirname in a single function
> +-# call:
> +-#   dirname:  Compute the dirname of FILE.  If nonempty,
> +-#             add APPEND to the result, otherwise set result
> +-#             to NONDIR_REPLACEMENT.
> +-#             value returned in "$func_dirname_result"
> +-#   basename: Compute filename of FILE.
> +-#             value retuned in "$func_basename_result"
> +-# Implementation must be kept synchronized with func_dirname
> +-# and func_basename. For efficiency, we do not delegate to
> +-# those functions but instead duplicate the functionality here.
> +-func_dirname_and_basename ()
> +-{
> +-  case ${1} in
> +-    */*) func_dirname_result="${1%/*}${2}" ;;
> +-    *  ) func_dirname_result="${3}" ;;
> +-  esac
> +-  func_basename_result="${1##*/}"
> +-}
> +-
> +-# func_stripname prefix suffix name
> +-# strip PREFIX and SUFFIX off of NAME.
> +-# PREFIX and SUFFIX must not contain globbing or regex special
> +-# characters, hashes, percent signs, but SUFFIX may contain a leading
> +-# dot (in which case that matches only a dot).
> +-func_stripname ()
> +-{
> +-  # pdksh 5.2.14 does not do ${X%$Y} correctly if both X and Y are
> +-  # positional parameters, so assign one to ordinary parameter first.
> +-  func_stripname_result=${3}
> +-  func_stripname_result=${func_stripname_result#"${1}"}
> +-  func_stripname_result=${func_stripname_result%"${2}"}
> +-}
> +-
> +-# func_opt_split
> +-func_opt_split ()
> +-{
> +-  func_opt_split_opt=${1%%=*}
> +-  func_opt_split_arg=${1#*=}
> +-}
> +-
> +-# func_lo2o object
> +-func_lo2o ()
> +-{
> +-  case ${1} in
> +-    *.lo) func_lo2o_result=${1%.lo}.${objext} ;;
> +-    *)    func_lo2o_result=${1} ;;
> +-  esac
> +-}
> +-
> +-# func_xform libobj-or-source
> +-func_xform ()
> +-{
> +-  func_xform_result=${1%.*}.lo
> +-}
> +-
> +-# func_arith arithmetic-term...
> +-func_arith ()
> +-{
> +-  func_arith_result=$(( $* ))
> +-}
> +-
> +-# func_len string
> +-# STRING may not start with a hyphen.
> +-func_len ()
> +-{
> +-  func_len_result=${#1}
> +-}
> +-
> +-_LT_EOF
> +-    ;;
> +-  *) # Bourne compatible functions.
> +-    cat << \_LT_EOF >> "$cfgfile"
> +-
> +-# func_dirname file append nondir_replacement
> +-# Compute the dirname of FILE.  If nonempty, add APPEND to the result,
> +-# otherwise set result to NONDIR_REPLACEMENT.
> +-func_dirname ()
> +-{
> +-  # Extract subdirectory from the argument.
> +-  func_dirname_result=`$ECHO "${1}" | $SED "$dirname"`
> +-  if test "X$func_dirname_result" = "X${1}"; then
> +-    func_dirname_result="${3}"
> +-  else
> +-    func_dirname_result="$func_dirname_result${2}"
> +-  fi
> +-}
> +-
> +-# func_basename file
> +-func_basename ()
> +-{
> +-  func_basename_result=`$ECHO "${1}" | $SED "$basename"`
> +-}
> +-
> +-
> +-# func_stripname prefix suffix name
> +-# strip PREFIX and SUFFIX off of NAME.
> +-# PREFIX and SUFFIX must not contain globbing or regex special
> +-# characters, hashes, percent signs, but SUFFIX may contain a leading
> +-# dot (in which case that matches only a dot).
> +-# func_strip_suffix prefix name
> +-func_stripname ()
> +-{
> +-  case ${2} in
> +-    .*) func_stripname_result=`$ECHO "${3}" | $SED "s%^${1}%%; s%\\\\${2}\$%%"`;;
> +-    *)  func_stripname_result=`$ECHO "${3}" | $SED "s%^${1}%%; s%${2}\$%%"`;;
> +-  esac
> +-}
> +-
> +-# sed scripts:
> +-my_sed_long_opt='1s/^\(-[^=]*\)=.*/\1/;q'
> +-my_sed_long_arg='1s/^-[^=]*=//'
> +-
> +-# func_opt_split
> +-func_opt_split ()
> +-{
> +-  func_opt_split_opt=`$ECHO "${1}" | $SED "$my_sed_long_opt"`
> +-  func_opt_split_arg=`$ECHO "${1}" | $SED "$my_sed_long_arg"`
> +-}
> +-
> +-# func_lo2o object
> +-func_lo2o ()
> +-{
> +-  func_lo2o_result=`$ECHO "${1}" | $SED "$lo2o"`
> +-}
> +-
> +-# func_xform libobj-or-source
> +-func_xform ()
> +-{
> +-  func_xform_result=`$ECHO "${1}" | $SED 's/\.[^.]*$/.lo/'`
> +-}
> +-
> +-# func_arith arithmetic-term...
> +-func_arith ()
> +-{
> +-  func_arith_result=`expr "$@"`
> +-}
> +-
> +-# func_len string
> +-# STRING may not start with a hyphen.
> +-func_len ()
> +-{
> +-  func_len_result=`expr "$1" : ".*" 2>/dev/null || echo $max_cmd_len`
> +-}
> +-
> +-_LT_EOF
> +-esac
> +-
> +-case $lt_shell_append in
> +-  yes)
> +-    cat << \_LT_EOF >> "$cfgfile"
> +-
> +-# func_append var value
> +-# Append VALUE to the end of shell variable VAR.
> +-func_append ()
> +-{
> +-  eval "$1+=\$2"
> +-}
> +-_LT_EOF
> +-    ;;
> +-  *)
> +-    cat << \_LT_EOF >> "$cfgfile"
> +-
> +-# func_append var value
> +-# Append VALUE to the end of shell variable VAR.
> +-func_append ()
> +-{
> +-  eval "$1=\$$1\$2"
> +-}
> +-
> +-_LT_EOF
> +-    ;;
> +-  esac
> +-
> +-
> +-  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
> +-    || (rm -f "$cfgfile"; exit 1)
> +-
> +-  mv -f "$cfgfile" "$ofile" ||
> ++  sed '$q' "$ltmain" >> "$cfgfile" \
> ++     || (rm -f "$cfgfile"; exit 1)
> ++
> ++  if test x"$xsi_shell" = xyes; then
> ++  sed -e '/^func_dirname ()$/,/^} # func_dirname /c\
> ++func_dirname ()\
> ++{\
> ++\    case ${1} in\
> ++\      */*) func_dirname_result="${1%/*}${2}" ;;\
> ++\      *  ) func_dirname_result="${3}" ;;\
> ++\    esac\
> ++} # Extended-shell func_dirname implementation' "$cfgfile" > $cfgfile.tmp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=:
> ++
> ++
> ++  sed -e '/^func_basename ()$/,/^} # func_basename /c\
> ++func_basename ()\
> ++{\
> ++\    func_basename_result="${1##*/}"\
> ++} # Extended-shell func_basename implementation' "$cfgfile" > $cfgfile.tmp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=:
> ++
> ++
> ++  sed -e '/^func_dirname_and_basename ()$/,/^} # func_dirname_and_basename /c\
> ++func_dirname_and_basename ()\
> ++{\
> ++\    case ${1} in\
> ++\      */*) func_dirname_result="${1%/*}${2}" ;;\
> ++\      *  ) func_dirname_result="${3}" ;;\
> ++\    esac\
> ++\    func_basename_result="${1##*/}"\
> ++} # Extended-shell func_dirname_and_basename implementation' "$cfgfile" > $cfgfile.tmp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=:
> ++
> ++
> ++  sed -e '/^func_stripname ()$/,/^} # func_stripname /c\
> ++func_stripname ()\
> ++{\
> ++\    # pdksh 5.2.14 does not do ${X%$Y} correctly if both X and Y are\
> ++\    # positional parameters, so assign one to ordinary parameter first.\
> ++\    func_stripname_result=${3}\
> ++\    func_stripname_result=${func_stripname_result#"${1}"}\
> ++\    func_stripname_result=${func_stripname_result%"${2}"}\
> ++} # Extended-shell func_stripname implementation' "$cfgfile" > $cfgfile.tmp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=:
> ++
> ++
> ++  sed -e '/^func_split_long_opt ()$/,/^} # func_split_long_opt /c\
> ++func_split_long_opt ()\
> ++{\
> ++\    func_split_long_opt_name=${1%%=*}\
> ++\    func_split_long_opt_arg=${1#*=}\
> ++} # Extended-shell func_split_long_opt implementation' "$cfgfile" > $cfgfile.tmp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=:
> ++
> ++
> ++  sed -e '/^func_split_short_opt ()$/,/^} # func_split_short_opt /c\
> ++func_split_short_opt ()\
> ++{\
> ++\    func_split_short_opt_arg=${1#??}\
> ++\    func_split_short_opt_name=${1%"$func_split_short_opt_arg"}\
> ++} # Extended-shell func_split_short_opt implementation' "$cfgfile" > $cfgfile.tmp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=:
> ++
> ++
> ++  sed -e '/^func_lo2o ()$/,/^} # func_lo2o /c\
> ++func_lo2o ()\
> ++{\
> ++\    case ${1} in\
> ++\      *.lo) func_lo2o_result=${1%.lo}.${objext} ;;\
> ++\      *)    func_lo2o_result=${1} ;;\
> ++\    esac\
> ++} # Extended-shell func_lo2o implementation' "$cfgfile" > $cfgfile.tmp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=:
> ++
> ++
> ++  sed -e '/^func_xform ()$/,/^} # func_xform /c\
> ++func_xform ()\
> ++{\
> ++    func_xform_result=${1%.*}.lo\
> ++} # Extended-shell func_xform implementation' "$cfgfile" > $cfgfile.tmp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=:
> ++
> ++
> ++  sed -e '/^func_arith ()$/,/^} # func_arith /c\
> ++func_arith ()\
> ++{\
> ++    func_arith_result=$(( $* ))\
> ++} # Extended-shell func_arith implementation' "$cfgfile" > $cfgfile.tmp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=:
> ++
> ++
> ++  sed -e '/^func_len ()$/,/^} # func_len /c\
> ++func_len ()\
> ++{\
> ++    func_len_result=${#1}\
> ++} # Extended-shell func_len implementation' "$cfgfile" > $cfgfile.tmp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=:
> ++
> ++fi
> ++
> ++if test x"$lt_shell_append" = xyes; then
> ++  sed -e '/^func_append ()$/,/^} # func_append /c\
> ++func_append ()\
> ++{\
> ++    eval "${1}+=\\${2}"\
> ++} # Extended-shell func_append implementation' "$cfgfile" > $cfgfile.tmp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=:
> ++
> ++
> ++  sed -e '/^func_append_quoted ()$/,/^} # func_append_quoted /c\
> ++func_append_quoted ()\
> ++{\
> ++\    func_quote_for_eval "${2}"\
> ++\    eval "${1}+=\\\\ \\$func_quote_for_eval_result"\
> ++} # Extended-shell func_append_quoted implementation' "$cfgfile" > $cfgfile.tmp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=:
> ++
> ++
> ++  # Save a `func_append' function call where possible by direct use of '+='
> ++  sed -e 's%func_append \([a-zA-Z_]\{1,\}\) "%\1+="%g' $cfgfile > $cfgfile.tmp \
> ++    && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++      || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
> ++  test 0 -eq $? || _lt_function_replace_fail=:
> ++else
> ++  # Save a `func_append' function call even when '+=' is not available
> ++  sed -e 's%func_append \([a-zA-Z_]\{1,\}\) "%\1="$\1%g' $cfgfile > $cfgfile.tmp \
> ++    && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++      || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
> ++  test 0 -eq $? || _lt_function_replace_fail=:
> ++fi
> ++
> ++if test x"$_lt_function_replace_fail" = x":"; then
> ++  { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Unable to substitute extended shell functions in $ofile" >&5
> ++$as_echo "$as_me: WARNING: Unable to substitute extended shell functions in $ofile" >&2;}
> ++fi
> ++
> ++
> ++   mv -f "$cfgfile" "$ofile" ||
> +     (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
> +   chmod +x "$ofile"
> + 
> +@@ -18021,12 +18860,12 @@ with_gcc=$GCC_CXX
> + # Compiler flag to turn off builtin functions.
> + no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag_CXX
> + 
> +-# How to pass a linker flag through the compiler.
> +-wl=$lt_lt_prog_compiler_wl_CXX
> +-
> + # Additional compiler flags for building library objects.
> + pic_flag=$lt_lt_prog_compiler_pic_CXX
> + 
> ++# How to pass a linker flag through the compiler.
> ++wl=$lt_lt_prog_compiler_wl_CXX
> ++
> + # Compiler flag to prevent dynamic linking.
> + link_static_flag=$lt_lt_prog_compiler_static_CXX
> + 
> +@@ -18113,9 +18952,6 @@ inherit_rpath=$inherit_rpath_CXX
> + # Whether libtool must link a program against all its dependency libraries.
> + link_all_deplibs=$link_all_deplibs_CXX
> + 
> +-# Fix the shell variable \$srcfile for the compiler.
> +-fix_srcfile_path=$lt_fix_srcfile_path_CXX
> +-
> + # Set to "yes" if exported symbols are required.
> + always_export_symbols=$always_export_symbols_CXX
> + 
> +@@ -18131,6 +18967,9 @@ include_expsyms=$lt_include_expsyms_CXX
> + # Commands necessary for linking programs (against libraries) with templates.
> + prelink_cmds=$lt_prelink_cmds_CXX
> + 
> ++# Commands necessary for finishing linking programs.
> ++postlink_cmds=$lt_postlink_cmds_CXX
> ++
> + # Specify filename containing input files.
> + file_list_spec=$lt_file_list_spec_CXX
> + 
> +diff --git a/gprofng/src/Makefile.in b/gprofng/src/Makefile.in
> +index ba7fdd6e8ad..3a0fc5dbbe7 100644
> +--- a/gprofng/src/Makefile.in
> ++++ b/gprofng/src/Makefile.in
> +@@ -324,6 +324,7 @@ CXXFLAGS = @CXXFLAGS@
> + CYGPATH_W = @CYGPATH_W@
> + DEFS = @DEFS@
> + DEPDIR = @DEPDIR@
> ++DLLTOOL = @DLLTOOL@
> + DSYMUTIL = @DSYMUTIL@
> + DUMPBIN = @DUMPBIN@
> + ECHO_C = @ECHO_C@
> +@@ -359,6 +360,7 @@ LN_S = @LN_S@
> + LTLIBOBJS = @LTLIBOBJS@
> + MAINT = @MAINT@
> + MAKEINFO = @MAKEINFO@
> ++MANIFEST_TOOL = @MANIFEST_TOOL@
> + MKDIR_P = @MKDIR_P@
> + NM = @NM@
> + NMEDIT = @NMEDIT@
> +diff --git a/ld/Makefile.in b/ld/Makefile.in
> +index 782d4017a60..71bbe487aef 100644
> +--- a/ld/Makefile.in
> ++++ b/ld/Makefile.in
> +@@ -383,6 +383,7 @@ CYGPATH_W = @CYGPATH_W@
> + DATADIRNAME = @DATADIRNAME@
> + DEFS = @DEFS@
> + DEPDIR = @DEPDIR@
> ++DLLTOOL = @DLLTOOL@
> + DSYMUTIL = @DSYMUTIL@
> + DUMPBIN = @DUMPBIN@
> + ECHO_C = @ECHO_C@
> +@@ -433,6 +434,7 @@ LN_S = @LN_S@
> + LTLIBOBJS = @LTLIBOBJS@
> + MAINT = @MAINT@
> + MAKEINFO = @MAKEINFO@
> ++MANIFEST_TOOL = @MANIFEST_TOOL@
> + MKDIR_P = @MKDIR_P@
> + MKINSTALLDIRS = @MKINSTALLDIRS@
> + MSGFMT = @MSGFMT@
> +@@ -481,6 +483,7 @@ abs_builddir = @abs_builddir@
> + abs_srcdir = @abs_srcdir@
> + abs_top_builddir = @abs_top_builddir@
> + abs_top_srcdir = @abs_top_srcdir@
> ++ac_ct_AR = @ac_ct_AR@
> + ac_ct_CC = @ac_ct_CC@
> + ac_ct_CXX = @ac_ct_CXX@
> + ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
> +diff --git a/ld/configure b/ld/configure
> +index d0a467ac101..45b20013a45 100755
> +--- a/ld/configure
> ++++ b/ld/configure
> +@@ -700,8 +700,11 @@ OTOOL
> + LIPO
> + NMEDIT
> + DSYMUTIL
> ++MANIFEST_TOOL
> + RANLIB
> ++ac_ct_AR
> + AR
> ++DLLTOOL
> + OBJDUMP
> + LN_S
> + NM
> +@@ -828,6 +831,7 @@ enable_static
> + with_pic
> + enable_fast_install
> + with_gnu_ld
> ++with_libtool_sysroot
> + enable_libtool_lock
> + enable_plugins
> + enable_largefile
> +@@ -1552,6 +1556,8 @@ Optional Packages:
> +   --with-pic              try to use only PIC/non-PIC objects [default=use
> +                           both]
> +   --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
> ++  --with-libtool-sysroot=DIR Search for dependent libraries within DIR
> ++                        (or the compiler's sysroot if not specified).
> +   --with-lib-path=dir1:dir2...  set default LIB_PATH
> +   --with-sysroot=DIR Search for usr/lib et al within DIR.
> +   --with-system-zlib      use installed libz
> +@@ -5399,8 +5405,8 @@ esac
> + 
> + 
> + 
> +-macro_version='2.2.7a'
> +-macro_revision='1.3134'
> ++macro_version='2.4'
> ++macro_revision='1.3293'
> + 
> + 
> + 
> +@@ -5440,7 +5446,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> + { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
> + $as_echo_n "checking how to print strings... " >&6; }
> + # Test print first, because it will be a builtin if present.
> +-if test "X`print -r -- -n 2>/dev/null`" = X-n && \
> ++if test "X`( print -r -- -n ) 2>/dev/null`" = X-n && \
> +    test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
> +   ECHO='print -r --'
> + elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
> +@@ -6133,8 +6139,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
> + # Try some XSI features
> + xsi_shell=no
> + ( _lt_dummy="a/b/c"
> +-  test "${_lt_dummy##*/},${_lt_dummy%/*},"${_lt_dummy%"$_lt_dummy"}, \
> +-      = c,a/b,, \
> ++  test "${_lt_dummy##*/},${_lt_dummy%/*},${_lt_dummy#??}"${_lt_dummy%"$_lt_dummy"}, \
> ++      = c,a/b,b/c, \
> +     && eval 'test $(( 1 + 1 )) -eq 2 \
> +     && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
> +   && xsi_shell=yes
> +@@ -6183,6 +6189,80 @@ esac
> + 
> + 
> + 
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to convert $build file names to $host format" >&5
> ++$as_echo_n "checking how to convert $build file names to $host format... " >&6; }
> ++if ${lt_cv_to_host_file_cmd+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  case $host in
> ++  *-*-mingw* )
> ++    case $build in
> ++      *-*-mingw* ) # actually msys
> ++        lt_cv_to_host_file_cmd=func_convert_file_msys_to_w32
> ++        ;;
> ++      *-*-cygwin* )
> ++        lt_cv_to_host_file_cmd=func_convert_file_cygwin_to_w32
> ++        ;;
> ++      * ) # otherwise, assume *nix
> ++        lt_cv_to_host_file_cmd=func_convert_file_nix_to_w32
> ++        ;;
> ++    esac
> ++    ;;
> ++  *-*-cygwin* )
> ++    case $build in
> ++      *-*-mingw* ) # actually msys
> ++        lt_cv_to_host_file_cmd=func_convert_file_msys_to_cygwin
> ++        ;;
> ++      *-*-cygwin* )
> ++        lt_cv_to_host_file_cmd=func_convert_file_noop
> ++        ;;
> ++      * ) # otherwise, assume *nix
> ++        lt_cv_to_host_file_cmd=func_convert_file_nix_to_cygwin
> ++        ;;
> ++    esac
> ++    ;;
> ++  * ) # unhandled hosts (and "normal" native builds)
> ++    lt_cv_to_host_file_cmd=func_convert_file_noop
> ++    ;;
> ++esac
> ++
> ++fi
> ++
> ++to_host_file_cmd=$lt_cv_to_host_file_cmd
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_to_host_file_cmd" >&5
> ++$as_echo "$lt_cv_to_host_file_cmd" >&6; }
> ++
> ++
> ++
> ++
> ++
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to convert $build file names to toolchain format" >&5
> ++$as_echo_n "checking how to convert $build file names to toolchain format... " >&6; }
> ++if ${lt_cv_to_tool_file_cmd+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  #assume ordinary cross tools, or native build.
> ++lt_cv_to_tool_file_cmd=func_convert_file_noop
> ++case $host in
> ++  *-*-mingw* )
> ++    case $build in
> ++      *-*-mingw* ) # actually msys
> ++        lt_cv_to_tool_file_cmd=func_convert_file_msys_to_w32
> ++        ;;
> ++    esac
> ++    ;;
> ++esac
> ++
> ++fi
> ++
> ++to_tool_file_cmd=$lt_cv_to_tool_file_cmd
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_to_tool_file_cmd" >&5
> ++$as_echo "$lt_cv_to_tool_file_cmd" >&6; }
> ++
> ++
> ++
> ++
> ++
> + { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
> + $as_echo_n "checking for $LD option to reload object files... " >&6; }
> + if ${lt_cv_ld_reload_flag+:} false; then :
> +@@ -6199,6 +6279,11 @@ case $reload_flag in
> + esac
> + reload_cmds='$LD$reload_flag -o $output$reload_objs'
> + case $host_os in
> ++  cygwin* | mingw* | pw32* | cegcc*)
> ++    if test "$GCC" != yes; then
> ++      reload_cmds=false
> ++    fi
> ++    ;;
> +   darwin*)
> +     if test "$GCC" = yes; then
> +       reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
> +@@ -6367,7 +6452,8 @@ mingw* | pw32*)
> +     lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
> +     lt_cv_file_magic_cmd='func_win32_libid'
> +   else
> +-    lt_cv_deplibs_check_method='file_magic file format pei*-i386(.*architecture: i386)?'
> ++    # Keep this pattern in sync with the one in func_win32_libid.
> ++    lt_cv_deplibs_check_method='file_magic file format (pei*-i386(.*architecture: i386)?|pe-arm-wince|pe-x86-64)'
> +     lt_cv_file_magic_cmd='$OBJDUMP -f'
> +   fi
> +   ;;
> +@@ -6521,6 +6607,21 @@ esac
> + fi
> + { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
> + $as_echo "$lt_cv_deplibs_check_method" >&6; }
> ++
> ++file_magic_glob=
> ++want_nocaseglob=no
> ++if test "$build" = "$host"; then
> ++  case $host_os in
> ++  mingw* | pw32*)
> ++    if ( shopt | grep nocaseglob ) >/dev/null 2>&1; then
> ++      want_nocaseglob=yes
> ++    else
> ++      file_magic_glob=`echo aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ | $SED -e "s/\(..\)/s\/[\1]\/[\1]\/g;/g"`
> ++    fi
> ++    ;;
> ++  esac
> ++fi
> ++
> + file_magic_cmd=$lt_cv_file_magic_cmd
> + deplibs_check_method=$lt_cv_deplibs_check_method
> + test -z "$deplibs_check_method" && deplibs_check_method=unknown
> +@@ -6536,6 +6637,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
> + 
> + 
> + 
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> ++if test -n "$ac_tool_prefix"; then
> ++  # Extract the first word of "${ac_tool_prefix}dlltool", so it can be a program name with args.
> ++set dummy ${ac_tool_prefix}dlltool; ac_word=$2
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> ++$as_echo_n "checking for $ac_word... " >&6; }
> ++if ${ac_cv_prog_DLLTOOL+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  if test -n "$DLLTOOL"; then
> ++  ac_cv_prog_DLLTOOL="$DLLTOOL" # Let the user override the test.
> ++else
> ++as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
> ++for as_dir in $PATH
> ++do
> ++  IFS=$as_save_IFS
> ++  test -z "$as_dir" && as_dir=.
> ++    for ac_exec_ext in '' $ac_executable_extensions; do
> ++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> ++    ac_cv_prog_DLLTOOL="${ac_tool_prefix}dlltool"
> ++    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
> ++    break 2
> ++  fi
> ++done
> ++  done
> ++IFS=$as_save_IFS
> ++
> ++fi
> ++fi
> ++DLLTOOL=$ac_cv_prog_DLLTOOL
> ++if test -n "$DLLTOOL"; then
> ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $DLLTOOL" >&5
> ++$as_echo "$DLLTOOL" >&6; }
> ++else
> ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
> ++$as_echo "no" >&6; }
> ++fi
> ++
> ++
> ++fi
> ++if test -z "$ac_cv_prog_DLLTOOL"; then
> ++  ac_ct_DLLTOOL=$DLLTOOL
> ++  # Extract the first word of "dlltool", so it can be a program name with args.
> ++set dummy dlltool; ac_word=$2
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> ++$as_echo_n "checking for $ac_word... " >&6; }
> ++if ${ac_cv_prog_ac_ct_DLLTOOL+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  if test -n "$ac_ct_DLLTOOL"; then
> ++  ac_cv_prog_ac_ct_DLLTOOL="$ac_ct_DLLTOOL" # Let the user override the test.
> ++else
> ++as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
> ++for as_dir in $PATH
> ++do
> ++  IFS=$as_save_IFS
> ++  test -z "$as_dir" && as_dir=.
> ++    for ac_exec_ext in '' $ac_executable_extensions; do
> ++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> ++    ac_cv_prog_ac_ct_DLLTOOL="dlltool"
> ++    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
> ++    break 2
> ++  fi
> ++done
> ++  done
> ++IFS=$as_save_IFS
> ++
> ++fi
> ++fi
> ++ac_ct_DLLTOOL=$ac_cv_prog_ac_ct_DLLTOOL
> ++if test -n "$ac_ct_DLLTOOL"; then
> ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_ct_DLLTOOL" >&5
> ++$as_echo "$ac_ct_DLLTOOL" >&6; }
> ++else
> ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
> ++$as_echo "no" >&6; }
> ++fi
> ++
> ++  if test "x$ac_ct_DLLTOOL" = x; then
> ++    DLLTOOL="false"
> ++  else
> ++    case $cross_compiling:$ac_tool_warned in
> ++yes:)
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
> ++$as_echo "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
> ++ac_tool_warned=yes ;;
> ++esac
> ++    DLLTOOL=$ac_ct_DLLTOOL
> ++  fi
> ++else
> ++  DLLTOOL="$ac_cv_prog_DLLTOOL"
> ++fi
> ++
> ++test -z "$DLLTOOL" && DLLTOOL=dlltool
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to associate runtime and link libraries" >&5
> ++$as_echo_n "checking how to associate runtime and link libraries... " >&6; }
> ++if ${lt_cv_sharedlib_from_linklib_cmd+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  lt_cv_sharedlib_from_linklib_cmd='unknown'
> ++
> ++case $host_os in
> ++cygwin* | mingw* | pw32* | cegcc*)
> ++  # two different shell functions defined in ltmain.sh
> ++  # decide which to use based on capabilities of $DLLTOOL
> ++  case `$DLLTOOL --help 2>&1` in
> ++  *--identify-strict*)
> ++    lt_cv_sharedlib_from_linklib_cmd=func_cygming_dll_for_implib
> ++    ;;
> ++  *)
> ++    lt_cv_sharedlib_from_linklib_cmd=func_cygming_dll_for_implib_fallback
> ++    ;;
> ++  esac
> ++  ;;
> ++*)
> ++  # fallback: assume linklib IS sharedlib
> ++  lt_cv_sharedlib_from_linklib_cmd="$ECHO"
> ++  ;;
> ++esac
> ++
> ++fi
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_sharedlib_from_linklib_cmd" >&5
> ++$as_echo "$lt_cv_sharedlib_from_linklib_cmd" >&6; }
> ++sharedlib_from_linklib_cmd=$lt_cv_sharedlib_from_linklib_cmd
> ++test -z "$sharedlib_from_linklib_cmd" && sharedlib_from_linklib_cmd=$ECHO
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> + plugin_option=
> + plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
> + for plugin in $plugin_names; do
> +@@ -6550,8 +6802,10 @@ for plugin in $plugin_names; do
> + done
> + 
> + if test -n "$ac_tool_prefix"; then
> +-  # Extract the first word of "${ac_tool_prefix}ar", so it can be a program name with args.
> +-set dummy ${ac_tool_prefix}ar; ac_word=$2
> ++  for ac_prog in ar
> ++  do
> ++    # Extract the first word of "$ac_tool_prefix$ac_prog", so it can be a program name with args.
> ++set dummy $ac_tool_prefix$ac_prog; ac_word=$2
> + { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> + $as_echo_n "checking for $ac_word... " >&6; }
> + if ${ac_cv_prog_AR+:} false; then :
> +@@ -6567,7 +6821,7 @@ do
> +   test -z "$as_dir" && as_dir=.
> +     for ac_exec_ext in '' $ac_executable_extensions; do
> +   if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> +-    ac_cv_prog_AR="${ac_tool_prefix}ar"
> ++    ac_cv_prog_AR="$ac_tool_prefix$ac_prog"
> +     $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
> +     break 2
> +   fi
> +@@ -6587,11 +6841,15 @@ $as_echo "no" >&6; }
> + fi
> + 
> + 
> ++    test -n "$AR" && break
> ++  done
> + fi
> +-if test -z "$ac_cv_prog_AR"; then
> ++if test -z "$AR"; then
> +   ac_ct_AR=$AR
> +-  # Extract the first word of "ar", so it can be a program name with args.
> +-set dummy ar; ac_word=$2
> ++  for ac_prog in ar
> ++do
> ++  # Extract the first word of "$ac_prog", so it can be a program name with args.
> ++set dummy $ac_prog; ac_word=$2
> + { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> + $as_echo_n "checking for $ac_word... " >&6; }
> + if ${ac_cv_prog_ac_ct_AR+:} false; then :
> +@@ -6607,7 +6865,7 @@ do
> +   test -z "$as_dir" && as_dir=.
> +     for ac_exec_ext in '' $ac_executable_extensions; do
> +   if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> +-    ac_cv_prog_ac_ct_AR="ar"
> ++    ac_cv_prog_ac_ct_AR="$ac_prog"
> +     $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
> +     break 2
> +   fi
> +@@ -6626,6 +6884,10 @@ else
> + $as_echo "no" >&6; }
> + fi
> + 
> ++
> ++  test -n "$ac_ct_AR" && break
> ++done
> ++
> +   if test "x$ac_ct_AR" = x; then
> +     AR="false"
> +   else
> +@@ -6637,25 +6899,19 @@ ac_tool_warned=yes ;;
> + esac
> +     AR=$ac_ct_AR
> +   fi
> +-else
> +-  AR="$ac_cv_prog_AR"
> + fi
> + 
> +-test -z "$AR" && AR=ar
> +-if test -n "$plugin_option"; then
> +-  if $AR --help 2>&1 | grep -q "\--plugin"; then
> +-    touch conftest.c
> +-    $AR $plugin_option rc conftest.a conftest.c
> +-    if test "$?" != 0; then
> +-      { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Failed: $AR $plugin_option rc" >&5
> ++  touch conftest.c
> ++  $AR $plugin_option rc conftest.a conftest.c
> ++  if test "$?" != 0; then
> ++    { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Failed: $AR $plugin_option rc" >&5
> + $as_echo "$as_me: WARNING: Failed: $AR $plugin_option rc" >&2;}
> +-    else
> +-      AR="$AR $plugin_option"
> +-    fi
> +-    rm -f conftest.*
> ++  else
> ++    AR="$AR $plugin_option"
> +   fi
> +-fi
> +-test -z "$AR_FLAGS" && AR_FLAGS=cru
> ++  rm -f conftest.*
> ++: ${AR=ar}
> ++: ${AR_FLAGS=cru}
> + 
> + 
> + 
> +@@ -6667,6 +6923,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
> + 
> + 
> + 
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE support" >&5
> ++$as_echo_n "checking for archiver @FILE support... " >&6; }
> ++if ${lt_cv_ar_at_file+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  lt_cv_ar_at_file=no
> ++   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> ++/* end confdefs.h.  */
> ++
> ++int
> ++main ()
> ++{
> ++
> ++  ;
> ++  return 0;
> ++}
> ++_ACEOF
> ++if ac_fn_c_try_compile "$LINENO"; then :
> ++  echo conftest.$ac_objext > conftest.lst
> ++      lt_ar_try='$AR $AR_FLAGS libconftest.a @conftest.lst >&5'
> ++      { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$lt_ar_try\""; } >&5
> ++  (eval $lt_ar_try) 2>&5
> ++  ac_status=$?
> ++  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
> ++  test $ac_status = 0; }
> ++      if test "$ac_status" -eq 0; then
> ++	# Ensure the archiver fails upon bogus file names.
> ++	rm -f conftest.$ac_objext libconftest.a
> ++	{ { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$lt_ar_try\""; } >&5
> ++  (eval $lt_ar_try) 2>&5
> ++  ac_status=$?
> ++  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
> ++  test $ac_status = 0; }
> ++	if test "$ac_status" -ne 0; then
> ++          lt_cv_ar_at_file=@
> ++        fi
> ++      fi
> ++      rm -f conftest.* libconftest.a
> ++
> ++fi
> ++rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
> ++
> ++fi
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_ar_at_file" >&5
> ++$as_echo "$lt_cv_ar_at_file" >&6; }
> ++
> ++if test "x$lt_cv_ar_at_file" = xno; then
> ++  archiver_list_spec=
> ++else
> ++  archiver_list_spec=$lt_cv_ar_at_file
> ++fi
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> + if test -n "$ac_tool_prefix"; then
> +   # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
> + set dummy ${ac_tool_prefix}strip; ac_word=$2
> +@@ -7006,8 +7320,8 @@ esac
> + lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
> + 
> + # Transform an extracted symbol line into symbol name and symbol address
> +-lt_cv_sys_global_symbol_to_c_name_address="sed -n -e 's/^: \([^ ]*\) $/  {\\\"\1\\\", (void *) 0},/p' -e 's/^$symcode* \([^ ]*\) \([^ ]*\)$/  {\"\2\", (void *) \&\2},/p'"
> +-lt_cv_sys_global_symbol_to_c_name_address_lib_prefix="sed -n -e 's/^: \([^ ]*\) $/  {\\\"\1\\\", (void *) 0},/p' -e 's/^$symcode* \([^ ]*\) \(lib[^ ]*\)$/  {\"\2\", (void *) \&\2},/p' -e 's/^$symcode* \([^ ]*\) \([^ ]*\)$/  {\"lib\2\", (void *) \&\2},/p'"
> ++lt_cv_sys_global_symbol_to_c_name_address="sed -n -e 's/^: \([^ ]*\)[ ]*$/  {\\\"\1\\\", (void *) 0},/p' -e 's/^$symcode* \([^ ]*\) \([^ ]*\)$/  {\"\2\", (void *) \&\2},/p'"
> ++lt_cv_sys_global_symbol_to_c_name_address_lib_prefix="sed -n -e 's/^: \([^ ]*\)[ ]*$/  {\\\"\1\\\", (void *) 0},/p' -e 's/^$symcode* \([^ ]*\) \(lib[^ ]*\)$/  {\"\2\", (void *) \&\2},/p' -e 's/^$symcode* \([^ ]*\) \([^ ]*\)$/  {\"lib\2\", (void *) \&\2},/p'"
> + 
> + # Handle CRLF in mingw tool chain
> + opt_cr=
> +@@ -7043,6 +7357,7 @@ for ac_symprfx in "" "_"; do
> +   else
> +     lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
> +   fi
> ++  lt_cv_sys_global_symbol_pipe="$lt_cv_sys_global_symbol_pipe | sed '/ __gnu_lto/d'"
> + 
> +   # Check to see that the pipe works correctly.
> +   pipe_works=no
> +@@ -7084,6 +7399,18 @@ _LT_EOF
> +       if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
> + 	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
> + 	  cat <<_LT_EOF > conftest.$ac_ext
> ++/* Keep this code in sync between libtool.m4, ltmain, lt_system.h, and tests.  */
> ++#if defined(_WIN32) || defined(__CYGWIN__) || defined(_WIN32_WCE)
> ++/* DATA imports from DLLs on WIN32 con't be const, because runtime
> ++   relocations are performed -- see ld's documentation on pseudo-relocs.  */
> ++# define LT_DLSYM_CONST
> ++#elif defined(__osf__)
> ++/* This system does not cope well with relocations in const data.  */
> ++# define LT_DLSYM_CONST
> ++#else
> ++# define LT_DLSYM_CONST const
> ++#endif
> ++
> + #ifdef __cplusplus
> + extern "C" {
> + #endif
> +@@ -7095,7 +7422,7 @@ _LT_EOF
> + 	  cat <<_LT_EOF >> conftest.$ac_ext
> + 
> + /* The mapping between symbol names and symbols.  */
> +-const struct {
> ++LT_DLSYM_CONST struct {
> +   const char *name;
> +   void       *address;
> + }
> +@@ -7121,8 +7448,8 @@ static const void *lt_preloaded_setup() {
> + _LT_EOF
> + 	  # Now try linking the two files.
> + 	  mv conftest.$ac_objext conftstm.$ac_objext
> +-	  lt_save_LIBS="$LIBS"
> +-	  lt_save_CFLAGS="$CFLAGS"
> ++	  lt_globsym_save_LIBS=$LIBS
> ++	  lt_globsym_save_CFLAGS=$CFLAGS
> + 	  LIBS="conftstm.$ac_objext"
> + 	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
> + 	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
> +@@ -7132,8 +7459,8 @@ _LT_EOF
> +   test $ac_status = 0; } && test -s conftest${ac_exeext}; then
> + 	    pipe_works=yes
> + 	  fi
> +-	  LIBS="$lt_save_LIBS"
> +-	  CFLAGS="$lt_save_CFLAGS"
> ++	  LIBS=$lt_globsym_save_LIBS
> ++	  CFLAGS=$lt_globsym_save_CFLAGS
> + 	else
> + 	  echo "cannot find nm_test_func in $nlist" >&5
> + 	fi
> +@@ -7170,6 +7497,17 @@ else
> + $as_echo "ok" >&6; }
> + fi
> + 
> ++# Response file support.
> ++if test "$lt_cv_nm_interface" = "MS dumpbin"; then
> ++  nm_file_list_spec='@'
> ++elif $NM --help 2>/dev/null | grep '[@]FILE' >/dev/null; then
> ++  nm_file_list_spec='@'
> ++fi
> ++
> ++
> ++
> ++
> ++
> + 
> + 
> + 
> +@@ -7186,6 +7524,44 @@ fi
> + 
> + 
> + 
> ++
> ++
> ++
> ++
> ++
> ++
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
> ++$as_echo_n "checking for sysroot... " >&6; }
> ++
> ++# Check whether --with-libtool-sysroot was given.
> ++if test "${with_libtool_sysroot+set}" = set; then :
> ++  withval=$with_libtool_sysroot;
> ++else
> ++  with_libtool_sysroot=no
> ++fi
> ++
> ++
> ++lt_sysroot=
> ++case ${with_libtool_sysroot} in #(
> ++ yes)
> ++   if test "$GCC" = yes; then
> ++     lt_sysroot=`$CC --print-sysroot 2>/dev/null`
> ++   fi
> ++   ;; #(
> ++ /*)
> ++   lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
> ++   ;; #(
> ++ no|'')
> ++   ;; #(
> ++ *)
> ++   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_libtool_sysroot}" >&5
> ++$as_echo "${with_libtool_sysroot}" >&6; }
> ++   as_fn_error $? "The sysroot must be an absolute path." "$LINENO" 5
> ++   ;;
> ++esac
> ++
> ++ { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
> ++$as_echo "${lt_sysroot:-no}" >&6; }
> + 
> + 
> + 
> +@@ -7397,6 +7773,123 @@ esac
> + 
> + need_locks="$enable_libtool_lock"
> + 
> ++if test -n "$ac_tool_prefix"; then
> ++  # Extract the first word of "${ac_tool_prefix}mt", so it can be a program name with args.
> ++set dummy ${ac_tool_prefix}mt; ac_word=$2
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> ++$as_echo_n "checking for $ac_word... " >&6; }
> ++if ${ac_cv_prog_MANIFEST_TOOL+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  if test -n "$MANIFEST_TOOL"; then
> ++  ac_cv_prog_MANIFEST_TOOL="$MANIFEST_TOOL" # Let the user override the test.
> ++else
> ++as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
> ++for as_dir in $PATH
> ++do
> ++  IFS=$as_save_IFS
> ++  test -z "$as_dir" && as_dir=.
> ++    for ac_exec_ext in '' $ac_executable_extensions; do
> ++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> ++    ac_cv_prog_MANIFEST_TOOL="${ac_tool_prefix}mt"
> ++    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
> ++    break 2
> ++  fi
> ++done
> ++  done
> ++IFS=$as_save_IFS
> ++
> ++fi
> ++fi
> ++MANIFEST_TOOL=$ac_cv_prog_MANIFEST_TOOL
> ++if test -n "$MANIFEST_TOOL"; then
> ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $MANIFEST_TOOL" >&5
> ++$as_echo "$MANIFEST_TOOL" >&6; }
> ++else
> ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
> ++$as_echo "no" >&6; }
> ++fi
> ++
> ++
> ++fi
> ++if test -z "$ac_cv_prog_MANIFEST_TOOL"; then
> ++  ac_ct_MANIFEST_TOOL=$MANIFEST_TOOL
> ++  # Extract the first word of "mt", so it can be a program name with args.
> ++set dummy mt; ac_word=$2
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> ++$as_echo_n "checking for $ac_word... " >&6; }
> ++if ${ac_cv_prog_ac_ct_MANIFEST_TOOL+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  if test -n "$ac_ct_MANIFEST_TOOL"; then
> ++  ac_cv_prog_ac_ct_MANIFEST_TOOL="$ac_ct_MANIFEST_TOOL" # Let the user override the test.
> ++else
> ++as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
> ++for as_dir in $PATH
> ++do
> ++  IFS=$as_save_IFS
> ++  test -z "$as_dir" && as_dir=.
> ++    for ac_exec_ext in '' $ac_executable_extensions; do
> ++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> ++    ac_cv_prog_ac_ct_MANIFEST_TOOL="mt"
> ++    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
> ++    break 2
> ++  fi
> ++done
> ++  done
> ++IFS=$as_save_IFS
> ++
> ++fi
> ++fi
> ++ac_ct_MANIFEST_TOOL=$ac_cv_prog_ac_ct_MANIFEST_TOOL
> ++if test -n "$ac_ct_MANIFEST_TOOL"; then
> ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_ct_MANIFEST_TOOL" >&5
> ++$as_echo "$ac_ct_MANIFEST_TOOL" >&6; }
> ++else
> ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
> ++$as_echo "no" >&6; }
> ++fi
> ++
> ++  if test "x$ac_ct_MANIFEST_TOOL" = x; then
> ++    MANIFEST_TOOL=":"
> ++  else
> ++    case $cross_compiling:$ac_tool_warned in
> ++yes:)
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
> ++$as_echo "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
> ++ac_tool_warned=yes ;;
> ++esac
> ++    MANIFEST_TOOL=$ac_ct_MANIFEST_TOOL
> ++  fi
> ++else
> ++  MANIFEST_TOOL="$ac_cv_prog_MANIFEST_TOOL"
> ++fi
> ++
> ++test -z "$MANIFEST_TOOL" && MANIFEST_TOOL=mt
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking if $MANIFEST_TOOL is a manifest tool" >&5
> ++$as_echo_n "checking if $MANIFEST_TOOL is a manifest tool... " >&6; }
> ++if ${lt_cv_path_mainfest_tool+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  lt_cv_path_mainfest_tool=no
> ++  echo "$as_me:$LINENO: $MANIFEST_TOOL '-?'" >&5
> ++  $MANIFEST_TOOL '-?' 2>conftest.err > conftest.out
> ++  cat conftest.err >&5
> ++  if $GREP 'Manifest Tool' conftest.out > /dev/null; then
> ++    lt_cv_path_mainfest_tool=yes
> ++  fi
> ++  rm -f conftest*
> ++fi
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_path_mainfest_tool" >&5
> ++$as_echo "$lt_cv_path_mainfest_tool" >&6; }
> ++if test "x$lt_cv_path_mainfest_tool" != xyes; then
> ++  MANIFEST_TOOL=:
> ++fi
> ++
> ++
> ++
> ++
> ++
> + 
> +   case $host_os in
> +     rhapsody* | darwin*)
> +@@ -7960,6 +8453,8 @@ _LT_EOF
> +       $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
> +       echo "$AR cru libconftest.a conftest.o" >&5
> +       $AR cru libconftest.a conftest.o 2>&5
> ++      echo "$RANLIB libconftest.a" >&5
> ++      $RANLIB libconftest.a 2>&5
> +       cat > conftest.c << _LT_EOF
> + int main() { return 0;}
> + _LT_EOF
> +@@ -8028,6 +8523,16 @@ done
> + 
> + 
> + 
> ++func_stripname_cnf ()
> ++{
> ++  case ${2} in
> ++  .*) func_stripname_result=`$ECHO "${3}" | $SED "s%^${1}%%; s%\\\\${2}\$%%"`;;
> ++  *)  func_stripname_result=`$ECHO "${3}" | $SED "s%^${1}%%; s%${2}\$%%"`;;
> ++  esac
> ++} # func_stripname_cnf
> ++
> ++
> ++
> + 
> + 
> + # Set options
> +@@ -8543,8 +9048,6 @@ fi
> + lt_prog_compiler_pic=
> + lt_prog_compiler_static=
> + 
> +-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $compiler option to produce PIC" >&5
> +-$as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> + 
> +   if test "$GCC" = yes; then
> +     lt_prog_compiler_wl='-Wl,'
> +@@ -8710,6 +9213,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> + 	lt_prog_compiler_pic='--shared'
> + 	lt_prog_compiler_static='--static'
> + 	;;
> ++      nagfor*)
> ++	# NAG Fortran compiler
> ++	lt_prog_compiler_wl='-Wl,-Wl,,'
> ++	lt_prog_compiler_pic='-PIC'
> ++	lt_prog_compiler_static='-Bstatic'
> ++	;;
> +       pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
> +         # Portland Group compilers (*not* the Pentium gcc compiler,
> + 	# which looks to be a dead project)
> +@@ -8772,7 +9281,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +       lt_prog_compiler_pic='-KPIC'
> +       lt_prog_compiler_static='-Bstatic'
> +       case $cc_basename in
> +-      f77* | f90* | f95*)
> ++      f77* | f90* | f95* | sunf77* | sunf90* | sunf95*)
> + 	lt_prog_compiler_wl='-Qoption ld ';;
> +       *)
> + 	lt_prog_compiler_wl='-Wl,';;
> +@@ -8829,13 +9338,17 @@ case $host_os in
> +     lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
> +     ;;
> + esac
> +-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_prog_compiler_pic" >&5
> +-$as_echo "$lt_prog_compiler_pic" >&6; }
> +-
> +-
> +-
> +-
> + 
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $compiler option to produce PIC" >&5
> ++$as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> ++if ${lt_cv_prog_compiler_pic+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  lt_cv_prog_compiler_pic=$lt_prog_compiler_pic
> ++fi
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_prog_compiler_pic" >&5
> ++$as_echo "$lt_cv_prog_compiler_pic" >&6; }
> ++lt_prog_compiler_pic=$lt_cv_prog_compiler_pic
> + 
> + #
> + # Check to make sure the PIC flag actually works.
> +@@ -8896,6 +9409,11 @@ fi
> + 
> + 
> + 
> ++
> ++
> ++
> ++
> ++
> + #
> + # Check to make sure the static flag actually works.
> + #
> +@@ -9246,7 +9764,8 @@ _LT_EOF
> +       allow_undefined_flag=unsupported
> +       always_export_symbols=no
> +       enable_shared_with_static_runtimes=yes
> +-      export_symbols_cmds='$NM $libobjs $convenience | $global_symbol_pipe | $SED -e '\''/^[BCDGRS][ ]/s/.*[ ]\([^ ]*\)/\1 DATA/'\'' | $SED -e '\''/^[AITW][ ]/s/.*[ ]//'\'' | sort | uniq > $export_symbols'
> ++      export_symbols_cmds='$NM $libobjs $convenience | $global_symbol_pipe | $SED -e '\''/^[BCDGRS][ ]/s/.*[ ]\([^ ]*\)/\1 DATA/;s/^.*[ ]__nm__\([^ ]*\)[ ][^ ]*/\1 DATA/;/^I[ ]/d;/^[AITW][ ]/s/.* //'\'' | sort | uniq > $export_symbols'
> ++      exclude_expsyms='[_]+GLOBAL_OFFSET_TABLE_|[_]+GLOBAL__[FID]_.*|[_]+head_[A-Za-z0-9_]+_dll|[A-Za-z0-9_]+_dll_iname'
> + 
> +       if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
> +         archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
> +@@ -9345,12 +9864,12 @@ _LT_EOF
> + 	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
> + 	  hardcode_libdir_flag_spec=
> + 	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
> +-	  archive_cmds='$LD -shared $libobjs $deplibs $compiler_flags -soname $soname -o $lib'
> ++	  archive_cmds='$LD -shared $libobjs $deplibs $linker_flags -soname $soname -o $lib'
> + 	  if test "x$supports_anon_versioning" = xyes; then
> + 	    archive_expsym_cmds='echo "{ global:" > $output_objdir/$libname.ver~
> + 	      cat $export_symbols | sed -e "s/\(.*\)/\1;/" >> $output_objdir/$libname.ver~
> + 	      echo "local: *; };" >> $output_objdir/$libname.ver~
> +-	      $LD -shared $libobjs $deplibs $compiler_flags -soname $soname -version-script $output_objdir/$libname.ver -o $lib'
> ++	      $LD -shared $libobjs $deplibs $linker_flags -soname $soname -version-script $output_objdir/$libname.ver -o $lib'
> + 	  fi
> + 	  ;;
> + 	esac
> +@@ -9364,8 +9883,8 @@ _LT_EOF
> + 	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
> + 	wlarc=
> +       else
> +-	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
> +-	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
> ++	archive_cmds='$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
> ++	archive_expsym_cmds='$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
> +       fi
> +       ;;
> + 
> +@@ -9383,8 +9902,8 @@ _LT_EOF
> + 
> + _LT_EOF
> +       elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> +-	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
> +-	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
> ++	archive_cmds='$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
> ++	archive_expsym_cmds='$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
> +       else
> + 	ld_shlibs=no
> +       fi
> +@@ -9430,8 +9949,8 @@ _LT_EOF
> + 
> +     *)
> +       if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> +-	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
> +-	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
> ++	archive_cmds='$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
> ++	archive_expsym_cmds='$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
> +       else
> + 	ld_shlibs=no
> +       fi
> +@@ -9561,7 +10080,13 @@ _LT_EOF
> + 	allow_undefined_flag='-berok'
> +         # Determine the default libpath from the value encoded in an
> +         # empty executable.
> +-        cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> ++        if test "${lt_cv_aix_libpath+set}" = set; then
> ++  aix_libpath=$lt_cv_aix_libpath
> ++else
> ++  if ${lt_cv_aix_libpath_+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> + /* end confdefs.h.  */
> + 
> + int
> +@@ -9574,22 +10099,29 @@ main ()
> + _ACEOF
> + if ac_fn_c_try_link "$LINENO"; then :
> + 
> +-lt_aix_libpath_sed='
> +-    /Import File Strings/,/^$/ {
> +-	/^0/ {
> +-	    s/^0  *\(.*\)$/\1/
> +-	    p
> +-	}
> +-    }'
> +-aix_libpath=`dump -H conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
> +-# Check for a 64-bit object if we didn't find anything.
> +-if test -z "$aix_libpath"; then
> +-  aix_libpath=`dump -HX64 conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
> +-fi
> ++  lt_aix_libpath_sed='
> ++      /Import File Strings/,/^$/ {
> ++	  /^0/ {
> ++	      s/^0  *\([^ ]*\) *$/\1/
> ++	      p
> ++	  }
> ++      }'
> ++  lt_cv_aix_libpath_=`dump -H conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
> ++  # Check for a 64-bit object if we didn't find anything.
> ++  if test -z "$lt_cv_aix_libpath_"; then
> ++    lt_cv_aix_libpath_=`dump -HX64 conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
> ++  fi
> + fi
> + rm -f core conftest.err conftest.$ac_objext \
> +     conftest$ac_exeext conftest.$ac_ext
> +-if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> ++  if test -z "$lt_cv_aix_libpath_"; then
> ++    lt_cv_aix_libpath_="/usr/lib:/lib"
> ++  fi
> ++
> ++fi
> ++
> ++  aix_libpath=$lt_cv_aix_libpath_
> ++fi
> + 
> +         hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
> +         archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> +@@ -9601,7 +10133,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> + 	else
> + 	 # Determine the default libpath from the value encoded in an
> + 	 # empty executable.
> +-	 cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> ++	 if test "${lt_cv_aix_libpath+set}" = set; then
> ++  aix_libpath=$lt_cv_aix_libpath
> ++else
> ++  if ${lt_cv_aix_libpath_+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> + /* end confdefs.h.  */
> + 
> + int
> +@@ -9614,22 +10152,29 @@ main ()
> + _ACEOF
> + if ac_fn_c_try_link "$LINENO"; then :
> + 
> +-lt_aix_libpath_sed='
> +-    /Import File Strings/,/^$/ {
> +-	/^0/ {
> +-	    s/^0  *\(.*\)$/\1/
> +-	    p
> +-	}
> +-    }'
> +-aix_libpath=`dump -H conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
> +-# Check for a 64-bit object if we didn't find anything.
> +-if test -z "$aix_libpath"; then
> +-  aix_libpath=`dump -HX64 conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
> +-fi
> ++  lt_aix_libpath_sed='
> ++      /Import File Strings/,/^$/ {
> ++	  /^0/ {
> ++	      s/^0  *\([^ ]*\) *$/\1/
> ++	      p
> ++	  }
> ++      }'
> ++  lt_cv_aix_libpath_=`dump -H conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
> ++  # Check for a 64-bit object if we didn't find anything.
> ++  if test -z "$lt_cv_aix_libpath_"; then
> ++    lt_cv_aix_libpath_=`dump -HX64 conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
> ++  fi
> + fi
> + rm -f core conftest.err conftest.$ac_objext \
> +     conftest$ac_exeext conftest.$ac_ext
> +-if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> ++  if test -z "$lt_cv_aix_libpath_"; then
> ++    lt_cv_aix_libpath_="/usr/lib:/lib"
> ++  fi
> ++
> ++fi
> ++
> ++  aix_libpath=$lt_cv_aix_libpath_
> ++fi
> + 
> + 	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
> + 	  # Warning - without using the other run time loading flags,
> +@@ -9673,21 +10218,64 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +       # When not using gcc, we currently assume that we are using
> +       # Microsoft Visual C++.
> +       # hardcode_libdir_flag_spec is actually meaningless, as there is
> +-      # no search path for DLLs.
> +-      hardcode_libdir_flag_spec=' '
> +-      allow_undefined_flag=unsupported
> +-      # Tell ltmain to make .lib files, not .a files.
> +-      libext=lib
> +-      # Tell ltmain to make .dll files, not .so files.
> +-      shrext_cmds=".dll"
> +-      # FIXME: Setting linknames here is a bad hack.
> +-      archive_cmds='$CC -o $lib $libobjs $compiler_flags `func_echo_all "$deplibs" | $SED '\''s/ -lc$//'\''` -link -dll~linknames='
> +-      # The linker will automatically build a .lib file if we build a DLL.
> +-      old_archive_from_new_cmds='true'
> +-      # FIXME: Should let the user specify the lib program.
> +-      old_archive_cmds='lib -OUT:$oldlib$oldobjs$old_deplibs'
> +-      fix_srcfile_path='`cygpath -w "$srcfile"`'
> +-      enable_shared_with_static_runtimes=yes
> ++      # no search path for DLLs.
> ++      case $cc_basename in
> ++      cl*)
> ++	# Native MSVC
> ++	hardcode_libdir_flag_spec=' '
> ++	allow_undefined_flag=unsupported
> ++	always_export_symbols=yes
> ++	file_list_spec='@'
> ++	# Tell ltmain to make .lib files, not .a files.
> ++	libext=lib
> ++	# Tell ltmain to make .dll files, not .so files.
> ++	shrext_cmds=".dll"
> ++	# FIXME: Setting linknames here is a bad hack.
> ++	archive_cmds='$CC -o $output_objdir/$soname $libobjs $compiler_flags $deplibs -Wl,-dll~linknames='
> ++	archive_expsym_cmds='if test "x`$SED 1q $export_symbols`" = xEXPORTS; then
> ++	    sed -n -e 's/\\\\\\\(.*\\\\\\\)/-link\\\ -EXPORT:\\\\\\\1/' -e '1\\\!p' < $export_symbols > $output_objdir/$soname.exp;
> ++	  else
> ++	    sed -e 's/\\\\\\\(.*\\\\\\\)/-link\\\ -EXPORT:\\\\\\\1/' < $export_symbols > $output_objdir/$soname.exp;
> ++	  fi~
> ++	  $CC -o $tool_output_objdir$soname $libobjs $compiler_flags $deplibs "@$tool_output_objdir$soname.exp" -Wl,-DLL,-IMPLIB:"$tool_output_objdir$libname.dll.lib"~
> ++	  linknames='
> ++	# The linker will not automatically build a static lib if we build a DLL.
> ++	# _LT_TAGVAR(old_archive_from_new_cmds, )='true'
> ++	enable_shared_with_static_runtimes=yes
> ++	export_symbols_cmds='$NM $libobjs $convenience | $global_symbol_pipe | $SED -e '\''/^[BCDGRS][ ]/s/.*[ ]\([^ ]*\)/\1,DATA/'\'' | $SED -e '\''/^[AITW][ ]/s/.*[ ]//'\'' | sort | uniq > $export_symbols'
> ++	# Don't use ranlib
> ++	old_postinstall_cmds='chmod 644 $oldlib'
> ++	postlink_cmds='lt_outputfile="@OUTPUT@"~
> ++	  lt_tool_outputfile="@TOOL_OUTPUT@"~
> ++	  case $lt_outputfile in
> ++	    *.exe|*.EXE) ;;
> ++	    *)
> ++	      lt_outputfile="$lt_outputfile.exe"
> ++	      lt_tool_outputfile="$lt_tool_outputfile.exe"
> ++	      ;;
> ++	  esac~
> ++	  if test "$MANIFEST_TOOL" != ":" && test -f "$lt_outputfile.manifest"; then
> ++	    $MANIFEST_TOOL -manifest "$lt_tool_outputfile.manifest" -outputresource:"$lt_tool_outputfile" || exit 1;
> ++	    $RM "$lt_outputfile.manifest";
> ++	  fi'
> ++	;;
> ++      *)
> ++	# Assume MSVC wrapper
> ++	hardcode_libdir_flag_spec=' '
> ++	allow_undefined_flag=unsupported
> ++	# Tell ltmain to make .lib files, not .a files.
> ++	libext=lib
> ++	# Tell ltmain to make .dll files, not .so files.
> ++	shrext_cmds=".dll"
> ++	# FIXME: Setting linknames here is a bad hack.
> ++	archive_cmds='$CC -o $lib $libobjs $compiler_flags `func_echo_all "$deplibs" | $SED '\''s/ -lc$//'\''` -link -dll~linknames='
> ++	# The linker will automatically build a .lib file if we build a DLL.
> ++	old_archive_from_new_cmds='true'
> ++	# FIXME: Should let the user specify the lib program.
> ++	old_archive_cmds='lib -OUT:$oldlib$oldobjs$old_deplibs'
> ++	enable_shared_with_static_runtimes=yes
> ++	;;
> ++      esac
> +       ;;
> + 
> +     darwin* | rhapsody*)
> +@@ -9748,7 +10336,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> + 
> +     # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
> +     freebsd* | dragonfly*)
> +-      archive_cmds='$CC -shared -o $lib $libobjs $deplibs $compiler_flags'
> ++      archive_cmds='$CC -shared $pic_flag -o $lib $libobjs $deplibs $compiler_flags'
> +       hardcode_libdir_flag_spec='-R$libdir'
> +       hardcode_direct=yes
> +       hardcode_shlibpath_var=no
> +@@ -9756,7 +10344,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> + 
> +     hpux9*)
> +       if test "$GCC" = yes; then
> +-	archive_cmds='$RM $output_objdir/$soname~$CC -shared -fPIC ${wl}+b ${wl}$install_libdir -o $output_objdir/$soname $libobjs $deplibs $compiler_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
> ++	archive_cmds='$RM $output_objdir/$soname~$CC -shared $pic_flag ${wl}+b ${wl}$install_libdir -o $output_objdir/$soname $libobjs $deplibs $compiler_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
> +       else
> + 	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
> +       fi
> +@@ -9772,7 +10360,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> + 
> +     hpux10*)
> +       if test "$GCC" = yes && test "$with_gnu_ld" = no; then
> +-	archive_cmds='$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+b ${wl}$install_libdir -o $lib $libobjs $deplibs $compiler_flags'
> ++	archive_cmds='$CC -shared $pic_flag ${wl}+h ${wl}$soname ${wl}+b ${wl}$install_libdir -o $lib $libobjs $deplibs $compiler_flags'
> +       else
> + 	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
> +       fi
> +@@ -9796,10 +10384,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> + 	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
> + 	  ;;
> + 	ia64*)
> +-	  archive_cmds='$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
> ++	  archive_cmds='$CC -shared $pic_flag ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
> + 	  ;;
> + 	*)
> +-	  archive_cmds='$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+b ${wl}$install_libdir -o $lib $libobjs $deplibs $compiler_flags'
> ++	  archive_cmds='$CC -shared $pic_flag ${wl}+h ${wl}$soname ${wl}+b ${wl}$install_libdir -o $lib $libobjs $deplibs $compiler_flags'
> + 	  ;;
> + 	esac
> +       else
> +@@ -9878,23 +10466,36 @@ fi
> + 
> +     irix5* | irix6* | nonstopux*)
> +       if test "$GCC" = yes; then
> +-	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
> ++	archive_cmds='$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
> + 	# Try to use the -exported_symbol ld option, if it does not
> + 	# work, assume that -exports_file does not work either and
> + 	# implicitly export all symbols.
> +-        save_LDFLAGS="$LDFLAGS"
> +-        LDFLAGS="$LDFLAGS -shared ${wl}-exported_symbol ${wl}foo ${wl}-update_registry ${wl}/dev/null"
> +-        cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> ++	# This should be the same for all languages, so no per-tag cache variable.
> ++	{ $as_echo "$as_me:${as_lineno-$LINENO}: checking whether the $host_os linker accepts -exported_symbol" >&5
> ++$as_echo_n "checking whether the $host_os linker accepts -exported_symbol... " >&6; }
> ++if ${lt_cv_irix_exported_symbol+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  save_LDFLAGS="$LDFLAGS"
> ++	   LDFLAGS="$LDFLAGS -shared ${wl}-exported_symbol ${wl}foo ${wl}-update_registry ${wl}/dev/null"
> ++	   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> + /* end confdefs.h.  */
> +-int foo(void) {}
> ++int foo (void) { return 0; }
> + _ACEOF
> + if ac_fn_c_try_link "$LINENO"; then :
> +-  archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations ${wl}-exports_file ${wl}$export_symbols -o $lib'
> +-
> ++  lt_cv_irix_exported_symbol=yes
> ++else
> ++  lt_cv_irix_exported_symbol=no
> + fi
> + rm -f core conftest.err conftest.$ac_objext \
> +     conftest$ac_exeext conftest.$ac_ext
> +-        LDFLAGS="$save_LDFLAGS"
> ++           LDFLAGS="$save_LDFLAGS"
> ++fi
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_irix_exported_symbol" >&5
> ++$as_echo "$lt_cv_irix_exported_symbol" >&6; }
> ++	if test "$lt_cv_irix_exported_symbol" = yes; then
> ++          archive_expsym_cmds='$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations ${wl}-exports_file ${wl}$export_symbols -o $lib'
> ++	fi
> +       else
> + 	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
> + 	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
> +@@ -9979,7 +10580,7 @@ rm -f core conftest.err conftest.$ac_objext \
> +     osf4* | osf5*)	# as osf3* with the addition of -msym flag
> +       if test "$GCC" = yes; then
> + 	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
> +-	archive_cmds='$CC -shared${allow_undefined_flag} $libobjs $deplibs $compiler_flags ${wl}-msym ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
> ++	archive_cmds='$CC -shared${allow_undefined_flag} $pic_flag $libobjs $deplibs $compiler_flags ${wl}-msym ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
> + 	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
> +       else
> + 	allow_undefined_flag=' -expect_unresolved \*'
> +@@ -9998,9 +10599,9 @@ rm -f core conftest.err conftest.$ac_objext \
> +       no_undefined_flag=' -z defs'
> +       if test "$GCC" = yes; then
> + 	wlarc='${wl}'
> +-	archive_cmds='$CC -shared ${wl}-z ${wl}text ${wl}-h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
> ++	archive_cmds='$CC -shared $pic_flag ${wl}-z ${wl}text ${wl}-h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
> + 	archive_expsym_cmds='echo "{ global:" > $lib.exp~cat $export_symbols | $SED -e "s/\(.*\)/\1;/" >> $lib.exp~echo "local: *; };" >> $lib.exp~
> +-	  $CC -shared ${wl}-z ${wl}text ${wl}-M ${wl}$lib.exp ${wl}-h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags~$RM $lib.exp'
> ++	  $CC -shared $pic_flag ${wl}-z ${wl}text ${wl}-M ${wl}$lib.exp ${wl}-h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags~$RM $lib.exp'
> +       else
> + 	case `$CC -V 2>&1` in
> + 	*"Compilers 5.0"*)
> +@@ -10576,8 +11177,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +   need_version=no
> +   need_lib_prefix=no
> + 
> +-  case $GCC,$host_os in
> +-  yes,cygwin* | yes,mingw* | yes,pw32* | yes,cegcc*)
> ++  case $GCC,$cc_basename in
> ++  yes,*)
> ++    # gcc
> +     library_names_spec='$libname.dll.a'
> +     # DLL is installed to $(libdir)/../bin by postinstall_cmds
> +     postinstall_cmds='base_file=`basename \${file}`~
> +@@ -10610,13 +11212,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +       library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
> +       ;;
> +     esac
> ++    dynamic_linker='Win32 ld.exe'
> ++    ;;
> ++
> ++  *,cl*)
> ++    # Native MSVC
> ++    libname_spec='$name'
> ++    soname_spec='${libname}`echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
> ++    library_names_spec='${libname}.dll.lib'
> ++
> ++    case $build_os in
> ++    mingw*)
> ++      sys_lib_search_path_spec=
> ++      lt_save_ifs=$IFS
> ++      IFS=';'
> ++      for lt_path in $LIB
> ++      do
> ++        IFS=$lt_save_ifs
> ++        # Let DOS variable expansion print the short 8.3 style file name.
> ++        lt_path=`cd "$lt_path" 2>/dev/null && cmd //C "for %i in (".") do @echo %~si"`
> ++        sys_lib_search_path_spec="$sys_lib_search_path_spec $lt_path"
> ++      done
> ++      IFS=$lt_save_ifs
> ++      # Convert to MSYS style.
> ++      sys_lib_search_path_spec=`$ECHO "$sys_lib_search_path_spec" | sed -e 's|\\\\|/|g' -e 's| \\([a-zA-Z]\\):| /\\1|g' -e 's|^ ||'`
> ++      ;;
> ++    cygwin*)
> ++      # Convert to unix form, then to dos form, then back to unix form
> ++      # but this time dos style (no spaces!) so that the unix form looks
> ++      # like /cygdrive/c/PROGRA~1:/cygdr...
> ++      sys_lib_search_path_spec=`cygpath --path --unix "$LIB"`
> ++      sys_lib_search_path_spec=`cygpath --path --dos "$sys_lib_search_path_spec" 2>/dev/null`
> ++      sys_lib_search_path_spec=`cygpath --path --unix "$sys_lib_search_path_spec" | $SED -e "s/$PATH_SEPARATOR/ /g"`
> ++      ;;
> ++    *)
> ++      sys_lib_search_path_spec="$LIB"
> ++      if $ECHO "$sys_lib_search_path_spec" | $GREP ';[c-zC-Z]:/' >/dev/null; then
> ++        # It is most probably a Windows format PATH.
> ++        sys_lib_search_path_spec=`$ECHO "$sys_lib_search_path_spec" | $SED -e 's/;/ /g'`
> ++      else
> ++        sys_lib_search_path_spec=`$ECHO "$sys_lib_search_path_spec" | $SED -e "s/$PATH_SEPARATOR/ /g"`
> ++      fi
> ++      # FIXME: find the short name or the path components, as spaces are
> ++      # common. (e.g. "Program Files" -> "PROGRA~1")
> ++      ;;
> ++    esac
> ++
> ++    # DLL is installed to $(libdir)/../bin by postinstall_cmds
> ++    postinstall_cmds='base_file=`basename \${file}`~
> ++      dlpath=`$SHELL 2>&1 -c '\''. $dir/'\''\${base_file}'\''i; echo \$dlname'\''`~
> ++      dldir=$destdir/`dirname \$dlpath`~
> ++      test -d \$dldir || mkdir -p \$dldir~
> ++      $install_prog $dir/$dlname \$dldir/$dlname'
> ++    postuninstall_cmds='dldll=`$SHELL 2>&1 -c '\''. $file; echo \$dlname'\''`~
> ++      dlpath=$dir/\$dldll~
> ++       $RM \$dlpath'
> ++    shlibpath_overrides_runpath=yes
> ++    dynamic_linker='Win32 link.exe'
> +     ;;
> + 
> +   *)
> ++    # Assume MSVC wrapper
> +     library_names_spec='${libname}`echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext} $libname.lib'
> ++    dynamic_linker='Win32 ld.exe'
> +     ;;
> +   esac
> +-  dynamic_linker='Win32 ld.exe'
> +   # FIXME: first we should search . and the directory the executable is in
> +   shlibpath_var=PATH
> +   ;;
> +@@ -11494,7 +12154,7 @@ else
> +   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
> +   lt_status=$lt_dlunknown
> +   cat > conftest.$ac_ext <<_LT_EOF
> +-#line 11494 "configure"
> ++#line $LINENO "configure"
> + #include "confdefs.h"
> + 
> + #if HAVE_DLFCN_H
> +@@ -11538,10 +12198,10 @@ else
> + /* When -fvisbility=hidden is used, assume the code has been annotated
> +    correspondingly for the symbols needed.  */
> + #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> +-void fnord () __attribute__((visibility("default")));
> ++int fnord () __attribute__((visibility("default")));
> + #endif
> + 
> +-void fnord () { int i=42; }
> ++int fnord () { return 42; }
> + int main ()
> + {
> +   void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> +@@ -11600,7 +12260,7 @@ else
> +   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
> +   lt_status=$lt_dlunknown
> +   cat > conftest.$ac_ext <<_LT_EOF
> +-#line 11600 "configure"
> ++#line $LINENO "configure"
> + #include "confdefs.h"
> + 
> + #if HAVE_DLFCN_H
> +@@ -11644,10 +12304,10 @@ else
> + /* When -fvisbility=hidden is used, assume the code has been annotated
> +    correspondingly for the symbols needed.  */
> + #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> +-void fnord () __attribute__((visibility("default")));
> ++int fnord () __attribute__((visibility("default")));
> + #endif
> + 
> +-void fnord () { int i=42; }
> ++int fnord () { return 42; }
> + int main ()
> + {
> +   void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> +@@ -12039,6 +12699,7 @@ $RM -r conftest*
> + 
> +   # Allow CC to be a program name with arguments.
> +   lt_save_CC=$CC
> ++  lt_save_CFLAGS=$CFLAGS
> +   lt_save_LD=$LD
> +   lt_save_GCC=$GCC
> +   GCC=$GXX
> +@@ -12056,6 +12717,7 @@ $RM -r conftest*
> +   fi
> +   test -z "${LDCXX+set}" || LD=$LDCXX
> +   CC=${CXX-"c++"}
> ++  CFLAGS=$CXXFLAGS
> +   compiler=$CC
> +   compiler_CXX=$CC
> +   for cc_temp in $compiler""; do
> +@@ -12338,7 +13000,13 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
> +           allow_undefined_flag_CXX='-berok'
> +           # Determine the default libpath from the value encoded in an empty
> +           # executable.
> +-          cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> ++          if test "${lt_cv_aix_libpath+set}" = set; then
> ++  aix_libpath=$lt_cv_aix_libpath
> ++else
> ++  if ${lt_cv_aix_libpath__CXX+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> + /* end confdefs.h.  */
> + 
> + int
> +@@ -12351,22 +13019,29 @@ main ()
> + _ACEOF
> + if ac_fn_cxx_try_link "$LINENO"; then :
> + 
> +-lt_aix_libpath_sed='
> +-    /Import File Strings/,/^$/ {
> +-	/^0/ {
> +-	    s/^0  *\(.*\)$/\1/
> +-	    p
> +-	}
> +-    }'
> +-aix_libpath=`dump -H conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
> +-# Check for a 64-bit object if we didn't find anything.
> +-if test -z "$aix_libpath"; then
> +-  aix_libpath=`dump -HX64 conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
> +-fi
> ++  lt_aix_libpath_sed='
> ++      /Import File Strings/,/^$/ {
> ++	  /^0/ {
> ++	      s/^0  *\([^ ]*\) *$/\1/
> ++	      p
> ++	  }
> ++      }'
> ++  lt_cv_aix_libpath__CXX=`dump -H conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
> ++  # Check for a 64-bit object if we didn't find anything.
> ++  if test -z "$lt_cv_aix_libpath__CXX"; then
> ++    lt_cv_aix_libpath__CXX=`dump -HX64 conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
> ++  fi
> + fi
> + rm -f core conftest.err conftest.$ac_objext \
> +     conftest$ac_exeext conftest.$ac_ext
> +-if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> ++  if test -z "$lt_cv_aix_libpath__CXX"; then
> ++    lt_cv_aix_libpath__CXX="/usr/lib:/lib"
> ++  fi
> ++
> ++fi
> ++
> ++  aix_libpath=$lt_cv_aix_libpath__CXX
> ++fi
> + 
> +           hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
> + 
> +@@ -12379,7 +13054,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +           else
> + 	    # Determine the default libpath from the value encoded in an
> + 	    # empty executable.
> +-	    cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> ++	    if test "${lt_cv_aix_libpath+set}" = set; then
> ++  aix_libpath=$lt_cv_aix_libpath
> ++else
> ++  if ${lt_cv_aix_libpath__CXX+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> + /* end confdefs.h.  */
> + 
> + int
> +@@ -12392,22 +13073,29 @@ main ()
> + _ACEOF
> + if ac_fn_cxx_try_link "$LINENO"; then :
> + 
> +-lt_aix_libpath_sed='
> +-    /Import File Strings/,/^$/ {
> +-	/^0/ {
> +-	    s/^0  *\(.*\)$/\1/
> +-	    p
> +-	}
> +-    }'
> +-aix_libpath=`dump -H conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
> +-# Check for a 64-bit object if we didn't find anything.
> +-if test -z "$aix_libpath"; then
> +-  aix_libpath=`dump -HX64 conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
> +-fi
> ++  lt_aix_libpath_sed='
> ++      /Import File Strings/,/^$/ {
> ++	  /^0/ {
> ++	      s/^0  *\([^ ]*\) *$/\1/
> ++	      p
> ++	  }
> ++      }'
> ++  lt_cv_aix_libpath__CXX=`dump -H conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
> ++  # Check for a 64-bit object if we didn't find anything.
> ++  if test -z "$lt_cv_aix_libpath__CXX"; then
> ++    lt_cv_aix_libpath__CXX=`dump -HX64 conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
> ++  fi
> + fi
> + rm -f core conftest.err conftest.$ac_objext \
> +     conftest$ac_exeext conftest.$ac_ext
> +-if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> ++  if test -z "$lt_cv_aix_libpath__CXX"; then
> ++    lt_cv_aix_libpath__CXX="/usr/lib:/lib"
> ++  fi
> ++
> ++fi
> ++
> ++  aix_libpath=$lt_cv_aix_libpath__CXX
> ++fi
> + 
> + 	    hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
> + 	    # Warning - without using the other run time loading flags,
> +@@ -12450,29 +13138,75 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +         ;;
> + 
> +       cygwin* | mingw* | pw32* | cegcc*)
> +-        # _LT_TAGVAR(hardcode_libdir_flag_spec, CXX) is actually meaningless,
> +-        # as there is no search path for DLLs.
> +-        hardcode_libdir_flag_spec_CXX='-L$libdir'
> +-        export_dynamic_flag_spec_CXX='${wl}--export-all-symbols'
> +-        allow_undefined_flag_CXX=unsupported
> +-        always_export_symbols_CXX=no
> +-        enable_shared_with_static_runtimes_CXX=yes
> +-
> +-        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
> +-          archive_cmds_CXX='$CC -shared -nostdlib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
> +-          # If the export-symbols file already is a .def file (1st line
> +-          # is EXPORTS), use it as is; otherwise, prepend...
> +-          archive_expsym_cmds_CXX='if test "x`$SED 1q $export_symbols`" = xEXPORTS; then
> +-	    cp $export_symbols $output_objdir/$soname.def;
> +-          else
> +-	    echo EXPORTS > $output_objdir/$soname.def;
> +-	    cat $export_symbols >> $output_objdir/$soname.def;
> +-          fi~
> +-          $CC -shared -nostdlib $output_objdir/$soname.def $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
> +-        else
> +-          ld_shlibs_CXX=no
> +-        fi
> +-        ;;
> ++	case $GXX,$cc_basename in
> ++	,cl* | no,cl*)
> ++	  # Native MSVC
> ++	  # hardcode_libdir_flag_spec is actually meaningless, as there is
> ++	  # no search path for DLLs.
> ++	  hardcode_libdir_flag_spec_CXX=' '
> ++	  allow_undefined_flag_CXX=unsupported
> ++	  always_export_symbols_CXX=yes
> ++	  file_list_spec_CXX='@'
> ++	  # Tell ltmain to make .lib files, not .a files.
> ++	  libext=lib
> ++	  # Tell ltmain to make .dll files, not .so files.
> ++	  shrext_cmds=".dll"
> ++	  # FIXME: Setting linknames here is a bad hack.
> ++	  archive_cmds_CXX='$CC -o $output_objdir/$soname $libobjs $compiler_flags $deplibs -Wl,-dll~linknames='
> ++	  archive_expsym_cmds_CXX='if test "x`$SED 1q $export_symbols`" = xEXPORTS; then
> ++	      $SED -n -e 's/\\\\\\\(.*\\\\\\\)/-link\\\ -EXPORT:\\\\\\\1/' -e '1\\\!p' < $export_symbols > $output_objdir/$soname.exp;
> ++	    else
> ++	      $SED -e 's/\\\\\\\(.*\\\\\\\)/-link\\\ -EXPORT:\\\\\\\1/' < $export_symbols > $output_objdir/$soname.exp;
> ++	    fi~
> ++	    $CC -o $tool_output_objdir$soname $libobjs $compiler_flags $deplibs "@$tool_output_objdir$soname.exp" -Wl,-DLL,-IMPLIB:"$tool_output_objdir$libname.dll.lib"~
> ++	    linknames='
> ++	  # The linker will not automatically build a static lib if we build a DLL.
> ++	  # _LT_TAGVAR(old_archive_from_new_cmds, CXX)='true'
> ++	  enable_shared_with_static_runtimes_CXX=yes
> ++	  # Don't use ranlib
> ++	  old_postinstall_cmds_CXX='chmod 644 $oldlib'
> ++	  postlink_cmds_CXX='lt_outputfile="@OUTPUT@"~
> ++	    lt_tool_outputfile="@TOOL_OUTPUT@"~
> ++	    case $lt_outputfile in
> ++	      *.exe|*.EXE) ;;
> ++	      *)
> ++		lt_outputfile="$lt_outputfile.exe"
> ++		lt_tool_outputfile="$lt_tool_outputfile.exe"
> ++		;;
> ++	    esac~
> ++	    func_to_tool_file "$lt_outputfile"~
> ++	    if test "$MANIFEST_TOOL" != ":" && test -f "$lt_outputfile.manifest"; then
> ++	      $MANIFEST_TOOL -manifest "$lt_tool_outputfile.manifest" -outputresource:"$lt_tool_outputfile" || exit 1;
> ++	      $RM "$lt_outputfile.manifest";
> ++	    fi'
> ++	  ;;
> ++	*)
> ++	  # g++
> ++	  # _LT_TAGVAR(hardcode_libdir_flag_spec, CXX) is actually meaningless,
> ++	  # as there is no search path for DLLs.
> ++	  hardcode_libdir_flag_spec_CXX='-L$libdir'
> ++	  export_dynamic_flag_spec_CXX='${wl}--export-all-symbols'
> ++	  allow_undefined_flag_CXX=unsupported
> ++	  always_export_symbols_CXX=no
> ++	  enable_shared_with_static_runtimes_CXX=yes
> ++
> ++	  if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
> ++	    archive_cmds_CXX='$CC -shared -nostdlib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
> ++	    # If the export-symbols file already is a .def file (1st line
> ++	    # is EXPORTS), use it as is; otherwise, prepend...
> ++	    archive_expsym_cmds_CXX='if test "x`$SED 1q $export_symbols`" = xEXPORTS; then
> ++	      cp $export_symbols $output_objdir/$soname.def;
> ++	    else
> ++	      echo EXPORTS > $output_objdir/$soname.def;
> ++	      cat $export_symbols >> $output_objdir/$soname.def;
> ++	    fi~
> ++	    $CC -shared -nostdlib $output_objdir/$soname.def $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
> ++	  else
> ++	    ld_shlibs_CXX=no
> ++	  fi
> ++	  ;;
> ++	esac
> ++	;;
> +       darwin* | rhapsody*)
> + 
> + 
> +@@ -12578,7 +13312,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +             ;;
> +           *)
> +             if test "$GXX" = yes; then
> +-              archive_cmds_CXX='$RM $output_objdir/$soname~$CC -shared -nostdlib -fPIC ${wl}+b ${wl}$install_libdir -o $output_objdir/$soname $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
> ++              archive_cmds_CXX='$RM $output_objdir/$soname~$CC -shared -nostdlib $pic_flag ${wl}+b ${wl}$install_libdir -o $output_objdir/$soname $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
> +             else
> +               # FIXME: insert proper C++ library support
> +               ld_shlibs_CXX=no
> +@@ -12649,10 +13383,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> + 	            archive_cmds_CXX='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
> + 	            ;;
> + 	          ia64*)
> +-	            archive_cmds_CXX='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
> ++	            archive_cmds_CXX='$CC -shared -nostdlib $pic_flag ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
> + 	            ;;
> + 	          *)
> +-	            archive_cmds_CXX='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname ${wl}+b ${wl}$install_libdir -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
> ++	            archive_cmds_CXX='$CC -shared -nostdlib $pic_flag ${wl}+h ${wl}$soname ${wl}+b ${wl}$install_libdir -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
> + 	            ;;
> + 	        esac
> + 	      fi
> +@@ -12693,9 +13427,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +           *)
> + 	    if test "$GXX" = yes; then
> + 	      if test "$with_gnu_ld" = no; then
> +-	        archive_cmds_CXX='$CC -shared -nostdlib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
> ++	        archive_cmds_CXX='$CC -shared $pic_flag -nostdlib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
> + 	      else
> +-	        archive_cmds_CXX='$CC -shared -nostdlib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` -o $lib'
> ++	        archive_cmds_CXX='$CC -shared $pic_flag -nostdlib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` -o $lib'
> + 	      fi
> + 	    fi
> + 	    link_all_deplibs_CXX=yes
> +@@ -12765,20 +13499,20 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> + 	      prelink_cmds_CXX='tpldir=Template.dir~
> + 		rm -rf $tpldir~
> + 		$CC --prelink_objects --instantiation_dir $tpldir $objs $libobjs $compile_deplibs~
> +-		compile_command="$compile_command `find $tpldir -name \*.o | $NL2SP`"'
> ++		compile_command="$compile_command `find $tpldir -name \*.o | sort | $NL2SP`"'
> + 	      old_archive_cmds_CXX='tpldir=Template.dir~
> + 		rm -rf $tpldir~
> + 		$CC --prelink_objects --instantiation_dir $tpldir $oldobjs$old_deplibs~
> +-		$AR $AR_FLAGS $oldlib$oldobjs$old_deplibs `find $tpldir -name \*.o | $NL2SP`~
> ++		$AR $AR_FLAGS $oldlib$oldobjs$old_deplibs `find $tpldir -name \*.o | sort | $NL2SP`~
> + 		$RANLIB $oldlib'
> + 	      archive_cmds_CXX='tpldir=Template.dir~
> + 		rm -rf $tpldir~
> + 		$CC --prelink_objects --instantiation_dir $tpldir $predep_objects $libobjs $deplibs $convenience $postdep_objects~
> +-		$CC -shared $pic_flag $predep_objects $libobjs $deplibs `find $tpldir -name \*.o | $NL2SP` $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
> ++		$CC -shared $pic_flag $predep_objects $libobjs $deplibs `find $tpldir -name \*.o | sort | $NL2SP` $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
> + 	      archive_expsym_cmds_CXX='tpldir=Template.dir~
> + 		rm -rf $tpldir~
> + 		$CC --prelink_objects --instantiation_dir $tpldir $predep_objects $libobjs $deplibs $convenience $postdep_objects~
> +-		$CC -shared $pic_flag $predep_objects $libobjs $deplibs `find $tpldir -name \*.o | $NL2SP` $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname ${wl}-retain-symbols-file ${wl}$export_symbols -o $lib'
> ++		$CC -shared $pic_flag $predep_objects $libobjs $deplibs `find $tpldir -name \*.o | sort | $NL2SP` $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname ${wl}-retain-symbols-file ${wl}$export_symbols -o $lib'
> + 	      ;;
> + 	    *) # Version 6 and above use weak symbols
> + 	      archive_cmds_CXX='$CC -shared $pic_flag $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
> +@@ -12973,7 +13707,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> + 	          archive_cmds_CXX='$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
> + 		  ;;
> + 	        *)
> +-	          archive_cmds_CXX='$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-msym ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
> ++	          archive_cmds_CXX='$CC -shared $pic_flag -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-msym ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
> + 		  ;;
> + 	      esac
> + 
> +@@ -13019,7 +13753,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> + 
> +       solaris*)
> +         case $cc_basename in
> +-          CC*)
> ++          CC* | sunCC*)
> + 	    # Sun C++ 4.2, 5.x and Centerline C++
> +             archive_cmds_need_lc_CXX=yes
> + 	    no_undefined_flag_CXX=' -zdefs'
> +@@ -13060,9 +13794,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> + 	    if test "$GXX" = yes && test "$with_gnu_ld" = no; then
> + 	      no_undefined_flag_CXX=' ${wl}-z ${wl}defs'
> + 	      if $CC --version | $GREP -v '^2\.7' > /dev/null; then
> +-	        archive_cmds_CXX='$CC -shared -nostdlib $LDFLAGS $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-h $wl$soname -o $lib'
> ++	        archive_cmds_CXX='$CC -shared $pic_flag -nostdlib $LDFLAGS $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-h $wl$soname -o $lib'
> + 	        archive_expsym_cmds_CXX='echo "{ global:" > $lib.exp~cat $export_symbols | $SED -e "s/\(.*\)/\1;/" >> $lib.exp~echo "local: *; };" >> $lib.exp~
> +-		  $CC -shared -nostdlib ${wl}-M $wl$lib.exp -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags~$RM $lib.exp'
> ++		  $CC -shared $pic_flag -nostdlib ${wl}-M $wl$lib.exp -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags~$RM $lib.exp'
> + 
> + 	        # Commands to make compiler produce verbose output that lists
> + 	        # what "hidden" libraries, object files and flags are used when
> +@@ -13197,6 +13931,13 @@ private:
> + };
> + _LT_EOF
> + 
> ++
> ++_lt_libdeps_save_CFLAGS=$CFLAGS
> ++case "$CC $CFLAGS " in #(
> ++*\ -flto*\ *) CFLAGS="$CFLAGS -fno-lto" ;;
> ++*\ -fwhopr*\ *) CFLAGS="$CFLAGS -fno-whopr" ;;
> ++esac
> ++
> + if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
> +   (eval $ac_compile) 2>&5
> +   ac_status=$?
> +@@ -13210,7 +13951,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
> +   pre_test_object_deps_done=no
> + 
> +   for p in `eval "$output_verbose_link_cmd"`; do
> +-    case $p in
> ++    case ${prev}${p} in
> + 
> +     -L* | -R* | -l*)
> +        # Some compilers place space between "-{L,R}" and the path.
> +@@ -13219,13 +13960,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
> +           test $p = "-R"; then
> + 	 prev=$p
> + 	 continue
> +-       else
> +-	 prev=
> +        fi
> + 
> ++       # Expand the sysroot to ease extracting the directories later.
> ++       if test -z "$prev"; then
> ++         case $p in
> ++         -L*) func_stripname_cnf '-L' '' "$p"; prev=-L; p=$func_stripname_result ;;
> ++         -R*) func_stripname_cnf '-R' '' "$p"; prev=-R; p=$func_stripname_result ;;
> ++         -l*) func_stripname_cnf '-l' '' "$p"; prev=-l; p=$func_stripname_result ;;
> ++         esac
> ++       fi
> ++       case $p in
> ++       =*) func_stripname_cnf '=' '' "$p"; p=$lt_sysroot$func_stripname_result ;;
> ++       esac
> +        if test "$pre_test_object_deps_done" = no; then
> +-	 case $p in
> +-	 -L* | -R*)
> ++	 case ${prev} in
> ++	 -L | -R)
> + 	   # Internal compiler library paths should come after those
> + 	   # provided the user.  The postdeps already come after the
> + 	   # user supplied libs so there is no need to process them.
> +@@ -13245,8 +13995,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
> + 	   postdeps_CXX="${postdeps_CXX} ${prev}${p}"
> + 	 fi
> +        fi
> ++       prev=
> +        ;;
> + 
> ++    *.lto.$objext) ;; # Ignore GCC LTO objects
> +     *.$objext)
> +        # This assumes that the test object file only shows up
> +        # once in the compiler output.
> +@@ -13282,6 +14034,7 @@ else
> + fi
> + 
> + $RM -f confest.$objext
> ++CFLAGS=$_lt_libdeps_save_CFLAGS
> + 
> + # PORTME: override above test on systems where it is broken
> + case $host_os in
> +@@ -13317,7 +14070,7 @@ linux*)
> + 
> + solaris*)
> +   case $cc_basename in
> +-  CC*)
> ++  CC* | sunCC*)
> +     # The more standards-conforming stlport4 library is
> +     # incompatible with the Cstd library. Avoid specifying
> +     # it if it's in CXXFLAGS. Ignore libCrun as
> +@@ -13382,8 +14135,6 @@ fi
> + lt_prog_compiler_pic_CXX=
> + lt_prog_compiler_static_CXX=
> + 
> +-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $compiler option to produce PIC" >&5
> +-$as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> + 
> +   # C++ specific cases for pic, static, wl, etc.
> +   if test "$GXX" = yes; then
> +@@ -13488,6 +14239,11 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> + 	  ;;
> + 	esac
> + 	;;
> ++      mingw* | cygwin* | os2* | pw32* | cegcc*)
> ++	# This hack is so that the source file can tell whether it is being
> ++	# built for inclusion in a dll (and should export symbols for example).
> ++	lt_prog_compiler_pic_CXX='-DDLL_EXPORT'
> ++	;;
> +       dgux*)
> + 	case $cc_basename in
> + 	  ec++*)
> +@@ -13640,7 +14396,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> + 	;;
> +       solaris*)
> + 	case $cc_basename in
> +-	  CC*)
> ++	  CC* | sunCC*)
> + 	    # Sun C++ 4.2, 5.x and Centerline C++
> + 	    lt_prog_compiler_pic_CXX='-KPIC'
> + 	    lt_prog_compiler_static_CXX='-Bstatic'
> +@@ -13705,10 +14461,17 @@ case $host_os in
> +     lt_prog_compiler_pic_CXX="$lt_prog_compiler_pic_CXX -DPIC"
> +     ;;
> + esac
> +-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_prog_compiler_pic_CXX" >&5
> +-$as_echo "$lt_prog_compiler_pic_CXX" >&6; }
> +-
> + 
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $compiler option to produce PIC" >&5
> ++$as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> ++if ${lt_cv_prog_compiler_pic_CXX+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  lt_cv_prog_compiler_pic_CXX=$lt_prog_compiler_pic_CXX
> ++fi
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_prog_compiler_pic_CXX" >&5
> ++$as_echo "$lt_cv_prog_compiler_pic_CXX" >&6; }
> ++lt_prog_compiler_pic_CXX=$lt_cv_prog_compiler_pic_CXX
> + 
> + #
> + # Check to make sure the PIC flag actually works.
> +@@ -13766,6 +14529,8 @@ fi
> + 
> + 
> + 
> ++
> ++
> + #
> + # Check to make sure the static flag actually works.
> + #
> +@@ -13943,6 +14708,7 @@ fi
> + $as_echo_n "checking whether the $compiler linker ($LD) supports shared libraries... " >&6; }
> + 
> +   export_symbols_cmds_CXX='$NM $libobjs $convenience | $global_symbol_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
> ++  exclude_expsyms_CXX='_GLOBAL_OFFSET_TABLE_|_GLOBAL__F[ID]_.*'
> +   case $host_os in
> +   aix[4-9]*)
> +     # If we're using GNU nm, then we don't want the "-C" option.
> +@@ -13957,15 +14723,20 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
> +     ;;
> +   pw32*)
> +     export_symbols_cmds_CXX="$ltdll_cmds"
> +-  ;;
> ++    ;;
> +   cygwin* | mingw* | cegcc*)
> +-    export_symbols_cmds_CXX='$NM $libobjs $convenience | $global_symbol_pipe | $SED -e '\''/^[BCDGRS][ ]/s/.*[ ]\([^ ]*\)/\1 DATA/;/^.*[ ]__nm__/s/^.*[ ]__nm__\([^ ]*\)[ ][^ ]*/\1 DATA/;/^I[ ]/d;/^[AITW][ ]/s/.* //'\'' | sort | uniq > $export_symbols'
> +-  ;;
> ++    case $cc_basename in
> ++    cl*) ;;
> ++    *)
> ++      export_symbols_cmds_CXX='$NM $libobjs $convenience | $global_symbol_pipe | $SED -e '\''/^[BCDGRS][ ]/s/.*[ ]\([^ ]*\)/\1 DATA/;s/^.*[ ]__nm__\([^ ]*\)[ ][^ ]*/\1 DATA/;/^I[ ]/d;/^[AITW][ ]/s/.* //'\'' | sort | uniq > $export_symbols'
> ++      exclude_expsyms_CXX='[_]+GLOBAL_OFFSET_TABLE_|[_]+GLOBAL__[FID]_.*|[_]+head_[A-Za-z0-9_]+_dll|[A-Za-z0-9_]+_dll_iname'
> ++      ;;
> ++    esac
> ++    ;;
> +   *)
> +     export_symbols_cmds_CXX='$NM $libobjs $convenience | $global_symbol_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
> +-  ;;
> ++    ;;
> +   esac
> +-  exclude_expsyms_CXX='_GLOBAL_OFFSET_TABLE_|_GLOBAL__F[ID]_.*'
> + 
> + { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ld_shlibs_CXX" >&5
> + $as_echo "$ld_shlibs_CXX" >&6; }
> +@@ -14228,8 +14999,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +   need_version=no
> +   need_lib_prefix=no
> + 
> +-  case $GCC,$host_os in
> +-  yes,cygwin* | yes,mingw* | yes,pw32* | yes,cegcc*)
> ++  case $GCC,$cc_basename in
> ++  yes,*)
> ++    # gcc
> +     library_names_spec='$libname.dll.a'
> +     # DLL is installed to $(libdir)/../bin by postinstall_cmds
> +     postinstall_cmds='base_file=`basename \${file}`~
> +@@ -14261,13 +15033,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +       library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
> +       ;;
> +     esac
> ++    dynamic_linker='Win32 ld.exe'
> ++    ;;
> ++
> ++  *,cl*)
> ++    # Native MSVC
> ++    libname_spec='$name'
> ++    soname_spec='${libname}`echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
> ++    library_names_spec='${libname}.dll.lib'
> ++
> ++    case $build_os in
> ++    mingw*)
> ++      sys_lib_search_path_spec=
> ++      lt_save_ifs=$IFS
> ++      IFS=';'
> ++      for lt_path in $LIB
> ++      do
> ++        IFS=$lt_save_ifs
> ++        # Let DOS variable expansion print the short 8.3 style file name.
> ++        lt_path=`cd "$lt_path" 2>/dev/null && cmd //C "for %i in (".") do @echo %~si"`
> ++        sys_lib_search_path_spec="$sys_lib_search_path_spec $lt_path"
> ++      done
> ++      IFS=$lt_save_ifs
> ++      # Convert to MSYS style.
> ++      sys_lib_search_path_spec=`$ECHO "$sys_lib_search_path_spec" | sed -e 's|\\\\|/|g' -e 's| \\([a-zA-Z]\\):| /\\1|g' -e 's|^ ||'`
> ++      ;;
> ++    cygwin*)
> ++      # Convert to unix form, then to dos form, then back to unix form
> ++      # but this time dos style (no spaces!) so that the unix form looks
> ++      # like /cygdrive/c/PROGRA~1:/cygdr...
> ++      sys_lib_search_path_spec=`cygpath --path --unix "$LIB"`
> ++      sys_lib_search_path_spec=`cygpath --path --dos "$sys_lib_search_path_spec" 2>/dev/null`
> ++      sys_lib_search_path_spec=`cygpath --path --unix "$sys_lib_search_path_spec" | $SED -e "s/$PATH_SEPARATOR/ /g"`
> ++      ;;
> ++    *)
> ++      sys_lib_search_path_spec="$LIB"
> ++      if $ECHO "$sys_lib_search_path_spec" | $GREP ';[c-zC-Z]:/' >/dev/null; then
> ++        # It is most probably a Windows format PATH.
> ++        sys_lib_search_path_spec=`$ECHO "$sys_lib_search_path_spec" | $SED -e 's/;/ /g'`
> ++      else
> ++        sys_lib_search_path_spec=`$ECHO "$sys_lib_search_path_spec" | $SED -e "s/$PATH_SEPARATOR/ /g"`
> ++      fi
> ++      # FIXME: find the short name or the path components, as spaces are
> ++      # common. (e.g. "Program Files" -> "PROGRA~1")
> ++      ;;
> ++    esac
> ++
> ++    # DLL is installed to $(libdir)/../bin by postinstall_cmds
> ++    postinstall_cmds='base_file=`basename \${file}`~
> ++      dlpath=`$SHELL 2>&1 -c '\''. $dir/'\''\${base_file}'\''i; echo \$dlname'\''`~
> ++      dldir=$destdir/`dirname \$dlpath`~
> ++      test -d \$dldir || mkdir -p \$dldir~
> ++      $install_prog $dir/$dlname \$dldir/$dlname'
> ++    postuninstall_cmds='dldll=`$SHELL 2>&1 -c '\''. $file; echo \$dlname'\''`~
> ++      dlpath=$dir/\$dldll~
> ++       $RM \$dlpath'
> ++    shlibpath_overrides_runpath=yes
> ++    dynamic_linker='Win32 link.exe'
> +     ;;
> + 
> +   *)
> ++    # Assume MSVC wrapper
> +     library_names_spec='${libname}`echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext} $libname.lib'
> ++    dynamic_linker='Win32 ld.exe'
> +     ;;
> +   esac
> +-  dynamic_linker='Win32 ld.exe'
> +   # FIXME: first we should search . and the directory the executable is in
> +   shlibpath_var=PATH
> +   ;;
> +@@ -14807,6 +15637,7 @@ fi
> +   fi # test -n "$compiler"
> + 
> +   CC=$lt_save_CC
> ++  CFLAGS=$lt_save_CFLAGS
> +   LDCXX=$LD
> +   LD=$lt_save_LD
> +   GCC=$lt_save_GCC
> +@@ -18172,13 +19003,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
> + lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
> + lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
> + lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> ++lt_cv_to_host_file_cmd='`$ECHO "$lt_cv_to_host_file_cmd" | $SED "$delay_single_quote_subst"`'
> ++lt_cv_to_tool_file_cmd='`$ECHO "$lt_cv_to_tool_file_cmd" | $SED "$delay_single_quote_subst"`'
> + reload_flag='`$ECHO "$reload_flag" | $SED "$delay_single_quote_subst"`'
> + reload_cmds='`$ECHO "$reload_cmds" | $SED "$delay_single_quote_subst"`'
> + OBJDUMP='`$ECHO "$OBJDUMP" | $SED "$delay_single_quote_subst"`'
> + deplibs_check_method='`$ECHO "$deplibs_check_method" | $SED "$delay_single_quote_subst"`'
> + file_magic_cmd='`$ECHO "$file_magic_cmd" | $SED "$delay_single_quote_subst"`'
> ++file_magic_glob='`$ECHO "$file_magic_glob" | $SED "$delay_single_quote_subst"`'
> ++want_nocaseglob='`$ECHO "$want_nocaseglob" | $SED "$delay_single_quote_subst"`'
> ++DLLTOOL='`$ECHO "$DLLTOOL" | $SED "$delay_single_quote_subst"`'
> ++sharedlib_from_linklib_cmd='`$ECHO "$sharedlib_from_linklib_cmd" | $SED "$delay_single_quote_subst"`'
> + AR='`$ECHO "$AR" | $SED "$delay_single_quote_subst"`'
> + AR_FLAGS='`$ECHO "$AR_FLAGS" | $SED "$delay_single_quote_subst"`'
> ++archiver_list_spec='`$ECHO "$archiver_list_spec" | $SED "$delay_single_quote_subst"`'
> + STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
> + RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
> + old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
> +@@ -18193,14 +19031,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
> + lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
> + lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
> + lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
> ++nm_file_list_spec='`$ECHO "$nm_file_list_spec" | $SED "$delay_single_quote_subst"`'
> ++lt_sysroot='`$ECHO "$lt_sysroot" | $SED "$delay_single_quote_subst"`'
> + objdir='`$ECHO "$objdir" | $SED "$delay_single_quote_subst"`'
> + MAGIC_CMD='`$ECHO "$MAGIC_CMD" | $SED "$delay_single_quote_subst"`'
> + lt_prog_compiler_no_builtin_flag='`$ECHO "$lt_prog_compiler_no_builtin_flag" | $SED "$delay_single_quote_subst"`'
> +-lt_prog_compiler_wl='`$ECHO "$lt_prog_compiler_wl" | $SED "$delay_single_quote_subst"`'
> + lt_prog_compiler_pic='`$ECHO "$lt_prog_compiler_pic" | $SED "$delay_single_quote_subst"`'
> ++lt_prog_compiler_wl='`$ECHO "$lt_prog_compiler_wl" | $SED "$delay_single_quote_subst"`'
> + lt_prog_compiler_static='`$ECHO "$lt_prog_compiler_static" | $SED "$delay_single_quote_subst"`'
> + lt_cv_prog_compiler_c_o='`$ECHO "$lt_cv_prog_compiler_c_o" | $SED "$delay_single_quote_subst"`'
> + need_locks='`$ECHO "$need_locks" | $SED "$delay_single_quote_subst"`'
> ++MANIFEST_TOOL='`$ECHO "$MANIFEST_TOOL" | $SED "$delay_single_quote_subst"`'
> + DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
> + NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
> + LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> +@@ -18233,12 +19074,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
> + hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
> + inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
> + link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
> +-fix_srcfile_path='`$ECHO "$fix_srcfile_path" | $SED "$delay_single_quote_subst"`'
> + always_export_symbols='`$ECHO "$always_export_symbols" | $SED "$delay_single_quote_subst"`'
> + export_symbols_cmds='`$ECHO "$export_symbols_cmds" | $SED "$delay_single_quote_subst"`'
> + exclude_expsyms='`$ECHO "$exclude_expsyms" | $SED "$delay_single_quote_subst"`'
> + include_expsyms='`$ECHO "$include_expsyms" | $SED "$delay_single_quote_subst"`'
> + prelink_cmds='`$ECHO "$prelink_cmds" | $SED "$delay_single_quote_subst"`'
> ++postlink_cmds='`$ECHO "$postlink_cmds" | $SED "$delay_single_quote_subst"`'
> + file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
> + variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
> + need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
> +@@ -18277,8 +19118,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archive_cmds_CXX" | $SED "$delay_single_quote
> + compiler_CXX='`$ECHO "$compiler_CXX" | $SED "$delay_single_quote_subst"`'
> + GCC_CXX='`$ECHO "$GCC_CXX" | $SED "$delay_single_quote_subst"`'
> + lt_prog_compiler_no_builtin_flag_CXX='`$ECHO "$lt_prog_compiler_no_builtin_flag_CXX" | $SED "$delay_single_quote_subst"`'
> +-lt_prog_compiler_wl_CXX='`$ECHO "$lt_prog_compiler_wl_CXX" | $SED "$delay_single_quote_subst"`'
> + lt_prog_compiler_pic_CXX='`$ECHO "$lt_prog_compiler_pic_CXX" | $SED "$delay_single_quote_subst"`'
> ++lt_prog_compiler_wl_CXX='`$ECHO "$lt_prog_compiler_wl_CXX" | $SED "$delay_single_quote_subst"`'
> + lt_prog_compiler_static_CXX='`$ECHO "$lt_prog_compiler_static_CXX" | $SED "$delay_single_quote_subst"`'
> + lt_cv_prog_compiler_c_o_CXX='`$ECHO "$lt_cv_prog_compiler_c_o_CXX" | $SED "$delay_single_quote_subst"`'
> + archive_cmds_need_lc_CXX='`$ECHO "$archive_cmds_need_lc_CXX" | $SED "$delay_single_quote_subst"`'
> +@@ -18305,12 +19146,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$hardcode_shlibpath_var_CXX" | $SED "$delay_
> + hardcode_automatic_CXX='`$ECHO "$hardcode_automatic_CXX" | $SED "$delay_single_quote_subst"`'
> + inherit_rpath_CXX='`$ECHO "$inherit_rpath_CXX" | $SED "$delay_single_quote_subst"`'
> + link_all_deplibs_CXX='`$ECHO "$link_all_deplibs_CXX" | $SED "$delay_single_quote_subst"`'
> +-fix_srcfile_path_CXX='`$ECHO "$fix_srcfile_path_CXX" | $SED "$delay_single_quote_subst"`'
> + always_export_symbols_CXX='`$ECHO "$always_export_symbols_CXX" | $SED "$delay_single_quote_subst"`'
> + export_symbols_cmds_CXX='`$ECHO "$export_symbols_cmds_CXX" | $SED "$delay_single_quote_subst"`'
> + exclude_expsyms_CXX='`$ECHO "$exclude_expsyms_CXX" | $SED "$delay_single_quote_subst"`'
> + include_expsyms_CXX='`$ECHO "$include_expsyms_CXX" | $SED "$delay_single_quote_subst"`'
> + prelink_cmds_CXX='`$ECHO "$prelink_cmds_CXX" | $SED "$delay_single_quote_subst"`'
> ++postlink_cmds_CXX='`$ECHO "$postlink_cmds_CXX" | $SED "$delay_single_quote_subst"`'
> + file_list_spec_CXX='`$ECHO "$file_list_spec_CXX" | $SED "$delay_single_quote_subst"`'
> + hardcode_action_CXX='`$ECHO "$hardcode_action_CXX" | $SED "$delay_single_quote_subst"`'
> + compiler_lib_search_dirs_CXX='`$ECHO "$compiler_lib_search_dirs_CXX" | $SED "$delay_single_quote_subst"`'
> +@@ -18348,8 +19189,13 @@ reload_flag \
> + OBJDUMP \
> + deplibs_check_method \
> + file_magic_cmd \
> ++file_magic_glob \
> ++want_nocaseglob \
> ++DLLTOOL \
> ++sharedlib_from_linklib_cmd \
> + AR \
> + AR_FLAGS \
> ++archiver_list_spec \
> + STRIP \
> + RANLIB \
> + CC \
> +@@ -18359,12 +19205,14 @@ lt_cv_sys_global_symbol_pipe \
> + lt_cv_sys_global_symbol_to_cdecl \
> + lt_cv_sys_global_symbol_to_c_name_address \
> + lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> ++nm_file_list_spec \
> + lt_prog_compiler_no_builtin_flag \
> +-lt_prog_compiler_wl \
> + lt_prog_compiler_pic \
> ++lt_prog_compiler_wl \
> + lt_prog_compiler_static \
> + lt_cv_prog_compiler_c_o \
> + need_locks \
> ++MANIFEST_TOOL \
> + DSYMUTIL \
> + NMEDIT \
> + LIPO \
> +@@ -18380,7 +19228,6 @@ no_undefined_flag \
> + hardcode_libdir_flag_spec \
> + hardcode_libdir_flag_spec_ld \
> + hardcode_libdir_separator \
> +-fix_srcfile_path \
> + exclude_expsyms \
> + include_expsyms \
> + file_list_spec \
> +@@ -18402,8 +19249,8 @@ LD_CXX \
> + reload_flag_CXX \
> + compiler_CXX \
> + lt_prog_compiler_no_builtin_flag_CXX \
> +-lt_prog_compiler_wl_CXX \
> + lt_prog_compiler_pic_CXX \
> ++lt_prog_compiler_wl_CXX \
> + lt_prog_compiler_static_CXX \
> + lt_cv_prog_compiler_c_o_CXX \
> + export_dynamic_flag_spec_CXX \
> +@@ -18415,7 +19262,6 @@ no_undefined_flag_CXX \
> + hardcode_libdir_flag_spec_CXX \
> + hardcode_libdir_flag_spec_ld_CXX \
> + hardcode_libdir_separator_CXX \
> +-fix_srcfile_path_CXX \
> + exclude_expsyms_CXX \
> + include_expsyms_CXX \
> + file_list_spec_CXX \
> +@@ -18449,6 +19295,7 @@ module_cmds \
> + module_expsym_cmds \
> + export_symbols_cmds \
> + prelink_cmds \
> ++postlink_cmds \
> + postinstall_cmds \
> + postuninstall_cmds \
> + finish_cmds \
> +@@ -18463,7 +19310,8 @@ archive_expsym_cmds_CXX \
> + module_cmds_CXX \
> + module_expsym_cmds_CXX \
> + export_symbols_cmds_CXX \
> +-prelink_cmds_CXX; do
> ++prelink_cmds_CXX \
> ++postlink_cmds_CXX; do
> +     case \`eval \\\\\$ECHO \\\\""\\\\\$\$var"\\\\"\` in
> +     *[\\\\\\\`\\"\\\$]*)
> +       eval "lt_\$var=\\\\\\"\\\`\\\$ECHO \\"\\\$\$var\\" | \\\$SED -e \\"\\\$double_quote_subst\\" -e \\"\\\$sed_quote_subst\\" -e \\"\\\$delay_variable_subst\\"\\\`\\\\\\""
> +@@ -19228,7 +20076,8 @@ $as_echo X"$file" |
> + # NOTE: Changes made to this file will be lost: look at ltmain.sh.
> + #
> + #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> +-#                 2006, 2007, 2008, 2009 Free Software Foundation, Inc.
> ++#                 2006, 2007, 2008, 2009, 2010 Free Software Foundation,
> ++#                 Inc.
> + #   Written by Gordon Matzigkeit, 1996
> + #
> + #   This file is part of GNU Libtool.
> +@@ -19331,19 +20180,42 @@ SP2NL=$lt_lt_SP2NL
> + # turn newlines into spaces.
> + NL2SP=$lt_lt_NL2SP
> + 
> ++# convert \$build file names to \$host format.
> ++to_host_file_cmd=$lt_cv_to_host_file_cmd
> ++
> ++# convert \$build files to toolchain format.
> ++to_tool_file_cmd=$lt_cv_to_tool_file_cmd
> ++
> + # An object symbol dumper.
> + OBJDUMP=$lt_OBJDUMP
> + 
> + # Method to check whether dependent libraries are shared objects.
> + deplibs_check_method=$lt_deplibs_check_method
> + 
> +-# Command to use when deplibs_check_method == "file_magic".
> ++# Command to use when deplibs_check_method = "file_magic".
> + file_magic_cmd=$lt_file_magic_cmd
> + 
> ++# How to find potential files when deplibs_check_method = "file_magic".
> ++file_magic_glob=$lt_file_magic_glob
> ++
> ++# Find potential files using nocaseglob when deplibs_check_method = "file_magic".
> ++want_nocaseglob=$lt_want_nocaseglob
> ++
> ++# DLL creation program.
> ++DLLTOOL=$lt_DLLTOOL
> ++
> ++# Command to associate shared and link libraries.
> ++sharedlib_from_linklib_cmd=$lt_sharedlib_from_linklib_cmd
> ++
> + # The archiver.
> + AR=$lt_AR
> ++
> ++# Flags to create an archive.
> + AR_FLAGS=$lt_AR_FLAGS
> + 
> ++# How to feed a file listing to the archiver.
> ++archiver_list_spec=$lt_archiver_list_spec
> ++
> + # A symbol stripping program.
> + STRIP=$lt_STRIP
> + 
> +@@ -19373,6 +20245,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
> + # Transform the output of nm in a C name address pair when lib prefix is needed.
> + global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
> + 
> ++# Specify filename containing input files for \$NM.
> ++nm_file_list_spec=$lt_nm_file_list_spec
> ++
> ++# The root where to search for dependent libraries,and in which our libraries should be installed.
> ++lt_sysroot=$lt_sysroot
> ++
> + # The name of the directory that contains temporary libtool files.
> + objdir=$objdir
> + 
> +@@ -19382,6 +20260,9 @@ MAGIC_CMD=$MAGIC_CMD
> + # Must we lock files when doing compilation?
> + need_locks=$lt_need_locks
> + 
> ++# Manifest tool.
> ++MANIFEST_TOOL=$lt_MANIFEST_TOOL
> ++
> + # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
> + DSYMUTIL=$lt_DSYMUTIL
> + 
> +@@ -19496,12 +20377,12 @@ with_gcc=$GCC
> + # Compiler flag to turn off builtin functions.
> + no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
> + 
> +-# How to pass a linker flag through the compiler.
> +-wl=$lt_lt_prog_compiler_wl
> +-
> + # Additional compiler flags for building library objects.
> + pic_flag=$lt_lt_prog_compiler_pic
> + 
> ++# How to pass a linker flag through the compiler.
> ++wl=$lt_lt_prog_compiler_wl
> ++
> + # Compiler flag to prevent dynamic linking.
> + link_static_flag=$lt_lt_prog_compiler_static
> + 
> +@@ -19588,9 +20469,6 @@ inherit_rpath=$inherit_rpath
> + # Whether libtool must link a program against all its dependency libraries.
> + link_all_deplibs=$link_all_deplibs
> + 
> +-# Fix the shell variable \$srcfile for the compiler.
> +-fix_srcfile_path=$lt_fix_srcfile_path
> +-
> + # Set to "yes" if exported symbols are required.
> + always_export_symbols=$always_export_symbols
> + 
> +@@ -19606,6 +20484,9 @@ include_expsyms=$lt_include_expsyms
> + # Commands necessary for linking programs (against libraries) with templates.
> + prelink_cmds=$lt_prelink_cmds
> + 
> ++# Commands necessary for finishing linking programs.
> ++postlink_cmds=$lt_postlink_cmds
> ++
> + # Specify filename containing input files.
> + file_list_spec=$lt_file_list_spec
> + 
> +@@ -19652,210 +20533,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
> +   # if finds mixed CR/LF and LF-only lines.  Since sed operates in
> +   # text mode, it properly converts lines to CR/LF.  This bash problem
> +   # is reportedly fixed, but why not run on old versions too?
> +-  sed '/^# Generated shell functions inserted here/q' "$ltmain" >> "$cfgfile" \
> +-    || (rm -f "$cfgfile"; exit 1)
> +-
> +-  case $xsi_shell in
> +-  yes)
> +-    cat << \_LT_EOF >> "$cfgfile"
> +-
> +-# func_dirname file append nondir_replacement
> +-# Compute the dirname of FILE.  If nonempty, add APPEND to the result,
> +-# otherwise set result to NONDIR_REPLACEMENT.
> +-func_dirname ()
> +-{
> +-  case ${1} in
> +-    */*) func_dirname_result="${1%/*}${2}" ;;
> +-    *  ) func_dirname_result="${3}" ;;
> +-  esac
> +-}
> +-
> +-# func_basename file
> +-func_basename ()
> +-{
> +-  func_basename_result="${1##*/}"
> +-}
> +-
> +-# func_dirname_and_basename file append nondir_replacement
> +-# perform func_basename and func_dirname in a single function
> +-# call:
> +-#   dirname:  Compute the dirname of FILE.  If nonempty,
> +-#             add APPEND to the result, otherwise set result
> +-#             to NONDIR_REPLACEMENT.
> +-#             value returned in "$func_dirname_result"
> +-#   basename: Compute filename of FILE.
> +-#             value retuned in "$func_basename_result"
> +-# Implementation must be kept synchronized with func_dirname
> +-# and func_basename. For efficiency, we do not delegate to
> +-# those functions but instead duplicate the functionality here.
> +-func_dirname_and_basename ()
> +-{
> +-  case ${1} in
> +-    */*) func_dirname_result="${1%/*}${2}" ;;
> +-    *  ) func_dirname_result="${3}" ;;
> +-  esac
> +-  func_basename_result="${1##*/}"
> +-}
> +-
> +-# func_stripname prefix suffix name
> +-# strip PREFIX and SUFFIX off of NAME.
> +-# PREFIX and SUFFIX must not contain globbing or regex special
> +-# characters, hashes, percent signs, but SUFFIX may contain a leading
> +-# dot (in which case that matches only a dot).
> +-func_stripname ()
> +-{
> +-  # pdksh 5.2.14 does not do ${X%$Y} correctly if both X and Y are
> +-  # positional parameters, so assign one to ordinary parameter first.
> +-  func_stripname_result=${3}
> +-  func_stripname_result=${func_stripname_result#"${1}"}
> +-  func_stripname_result=${func_stripname_result%"${2}"}
> +-}
> +-
> +-# func_opt_split
> +-func_opt_split ()
> +-{
> +-  func_opt_split_opt=${1%%=*}
> +-  func_opt_split_arg=${1#*=}
> +-}
> +-
> +-# func_lo2o object
> +-func_lo2o ()
> +-{
> +-  case ${1} in
> +-    *.lo) func_lo2o_result=${1%.lo}.${objext} ;;
> +-    *)    func_lo2o_result=${1} ;;
> +-  esac
> +-}
> +-
> +-# func_xform libobj-or-source
> +-func_xform ()
> +-{
> +-  func_xform_result=${1%.*}.lo
> +-}
> +-
> +-# func_arith arithmetic-term...
> +-func_arith ()
> +-{
> +-  func_arith_result=$(( $* ))
> +-}
> +-
> +-# func_len string
> +-# STRING may not start with a hyphen.
> +-func_len ()
> +-{
> +-  func_len_result=${#1}
> +-}
> +-
> +-_LT_EOF
> +-    ;;
> +-  *) # Bourne compatible functions.
> +-    cat << \_LT_EOF >> "$cfgfile"
> +-
> +-# func_dirname file append nondir_replacement
> +-# Compute the dirname of FILE.  If nonempty, add APPEND to the result,
> +-# otherwise set result to NONDIR_REPLACEMENT.
> +-func_dirname ()
> +-{
> +-  # Extract subdirectory from the argument.
> +-  func_dirname_result=`$ECHO "${1}" | $SED "$dirname"`
> +-  if test "X$func_dirname_result" = "X${1}"; then
> +-    func_dirname_result="${3}"
> +-  else
> +-    func_dirname_result="$func_dirname_result${2}"
> +-  fi
> +-}
> +-
> +-# func_basename file
> +-func_basename ()
> +-{
> +-  func_basename_result=`$ECHO "${1}" | $SED "$basename"`
> +-}
> +-
> +-
> +-# func_stripname prefix suffix name
> +-# strip PREFIX and SUFFIX off of NAME.
> +-# PREFIX and SUFFIX must not contain globbing or regex special
> +-# characters, hashes, percent signs, but SUFFIX may contain a leading
> +-# dot (in which case that matches only a dot).
> +-# func_strip_suffix prefix name
> +-func_stripname ()
> +-{
> +-  case ${2} in
> +-    .*) func_stripname_result=`$ECHO "${3}" | $SED "s%^${1}%%; s%\\\\${2}\$%%"`;;
> +-    *)  func_stripname_result=`$ECHO "${3}" | $SED "s%^${1}%%; s%${2}\$%%"`;;
> +-  esac
> +-}
> +-
> +-# sed scripts:
> +-my_sed_long_opt='1s/^\(-[^=]*\)=.*/\1/;q'
> +-my_sed_long_arg='1s/^-[^=]*=//'
> +-
> +-# func_opt_split
> +-func_opt_split ()
> +-{
> +-  func_opt_split_opt=`$ECHO "${1}" | $SED "$my_sed_long_opt"`
> +-  func_opt_split_arg=`$ECHO "${1}" | $SED "$my_sed_long_arg"`
> +-}
> +-
> +-# func_lo2o object
> +-func_lo2o ()
> +-{
> +-  func_lo2o_result=`$ECHO "${1}" | $SED "$lo2o"`
> +-}
> +-
> +-# func_xform libobj-or-source
> +-func_xform ()
> +-{
> +-  func_xform_result=`$ECHO "${1}" | $SED 's/\.[^.]*$/.lo/'`
> +-}
> +-
> +-# func_arith arithmetic-term...
> +-func_arith ()
> +-{
> +-  func_arith_result=`expr "$@"`
> +-}
> +-
> +-# func_len string
> +-# STRING may not start with a hyphen.
> +-func_len ()
> +-{
> +-  func_len_result=`expr "$1" : ".*" 2>/dev/null || echo $max_cmd_len`
> +-}
> +-
> +-_LT_EOF
> +-esac
> +-
> +-case $lt_shell_append in
> +-  yes)
> +-    cat << \_LT_EOF >> "$cfgfile"
> +-
> +-# func_append var value
> +-# Append VALUE to the end of shell variable VAR.
> +-func_append ()
> +-{
> +-  eval "$1+=\$2"
> +-}
> +-_LT_EOF
> +-    ;;
> +-  *)
> +-    cat << \_LT_EOF >> "$cfgfile"
> +-
> +-# func_append var value
> +-# Append VALUE to the end of shell variable VAR.
> +-func_append ()
> +-{
> +-  eval "$1=\$$1\$2"
> +-}
> +-
> +-_LT_EOF
> +-    ;;
> +-  esac
> +-
> +-
> +-  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
> +-    || (rm -f "$cfgfile"; exit 1)
> +-
> +-  mv -f "$cfgfile" "$ofile" ||
> ++  sed '$q' "$ltmain" >> "$cfgfile" \
> ++     || (rm -f "$cfgfile"; exit 1)
> ++
> ++  if test x"$xsi_shell" = xyes; then
> ++  sed -e '/^func_dirname ()$/,/^} # func_dirname /c\
> ++func_dirname ()\
> ++{\
> ++\    case ${1} in\
> ++\      */*) func_dirname_result="${1%/*}${2}" ;;\
> ++\      *  ) func_dirname_result="${3}" ;;\
> ++\    esac\
> ++} # Extended-shell func_dirname implementation' "$cfgfile" > $cfgfile.tmp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=:
> ++
> ++
> ++  sed -e '/^func_basename ()$/,/^} # func_basename /c\
> ++func_basename ()\
> ++{\
> ++\    func_basename_result="${1##*/}"\
> ++} # Extended-shell func_basename implementation' "$cfgfile" > $cfgfile.tmp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=:
> ++
> ++
> ++  sed -e '/^func_dirname_and_basename ()$/,/^} # func_dirname_and_basename /c\
> ++func_dirname_and_basename ()\
> ++{\
> ++\    case ${1} in\
> ++\      */*) func_dirname_result="${1%/*}${2}" ;;\
> ++\      *  ) func_dirname_result="${3}" ;;\
> ++\    esac\
> ++\    func_basename_result="${1##*/}"\
> ++} # Extended-shell func_dirname_and_basename implementation' "$cfgfile" > $cfgfile.tmp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=:
> ++
> ++
> ++  sed -e '/^func_stripname ()$/,/^} # func_stripname /c\
> ++func_stripname ()\
> ++{\
> ++\    # pdksh 5.2.14 does not do ${X%$Y} correctly if both X and Y are\
> ++\    # positional parameters, so assign one to ordinary parameter first.\
> ++\    func_stripname_result=${3}\
> ++\    func_stripname_result=${func_stripname_result#"${1}"}\
> ++\    func_stripname_result=${func_stripname_result%"${2}"}\
> ++} # Extended-shell func_stripname implementation' "$cfgfile" > $cfgfile.tmp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=:
> ++
> ++
> ++  sed -e '/^func_split_long_opt ()$/,/^} # func_split_long_opt /c\
> ++func_split_long_opt ()\
> ++{\
> ++\    func_split_long_opt_name=${1%%=*}\
> ++\    func_split_long_opt_arg=${1#*=}\
> ++} # Extended-shell func_split_long_opt implementation' "$cfgfile" > $cfgfile.tmp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=:
> ++
> ++
> ++  sed -e '/^func_split_short_opt ()$/,/^} # func_split_short_opt /c\
> ++func_split_short_opt ()\
> ++{\
> ++\    func_split_short_opt_arg=${1#??}\
> ++\    func_split_short_opt_name=${1%"$func_split_short_opt_arg"}\
> ++} # Extended-shell func_split_short_opt implementation' "$cfgfile" > $cfgfile.tmp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=:
> ++
> ++
> ++  sed -e '/^func_lo2o ()$/,/^} # func_lo2o /c\
> ++func_lo2o ()\
> ++{\
> ++\    case ${1} in\
> ++\      *.lo) func_lo2o_result=${1%.lo}.${objext} ;;\
> ++\      *)    func_lo2o_result=${1} ;;\
> ++\    esac\
> ++} # Extended-shell func_lo2o implementation' "$cfgfile" > $cfgfile.tmp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=:
> ++
> ++
> ++  sed -e '/^func_xform ()$/,/^} # func_xform /c\
> ++func_xform ()\
> ++{\
> ++    func_xform_result=${1%.*}.lo\
> ++} # Extended-shell func_xform implementation' "$cfgfile" > $cfgfile.tmp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=:
> ++
> ++
> ++  sed -e '/^func_arith ()$/,/^} # func_arith /c\
> ++func_arith ()\
> ++{\
> ++    func_arith_result=$(( $* ))\
> ++} # Extended-shell func_arith implementation' "$cfgfile" > $cfgfile.tmp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=:
> ++
> ++
> ++  sed -e '/^func_len ()$/,/^} # func_len /c\
> ++func_len ()\
> ++{\
> ++    func_len_result=${#1}\
> ++} # Extended-shell func_len implementation' "$cfgfile" > $cfgfile.tmp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=:
> ++
> ++fi
> ++
> ++if test x"$lt_shell_append" = xyes; then
> ++  sed -e '/^func_append ()$/,/^} # func_append /c\
> ++func_append ()\
> ++{\
> ++    eval "${1}+=\\${2}"\
> ++} # Extended-shell func_append implementation' "$cfgfile" > $cfgfile.tmp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=:
> ++
> ++
> ++  sed -e '/^func_append_quoted ()$/,/^} # func_append_quoted /c\
> ++func_append_quoted ()\
> ++{\
> ++\    func_quote_for_eval "${2}"\
> ++\    eval "${1}+=\\\\ \\$func_quote_for_eval_result"\
> ++} # Extended-shell func_append_quoted implementation' "$cfgfile" > $cfgfile.tmp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=:
> ++
> ++
> ++  # Save a `func_append' function call where possible by direct use of '+='
> ++  sed -e 's%func_append \([a-zA-Z_]\{1,\}\) "%\1+="%g' $cfgfile > $cfgfile.tmp \
> ++    && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++      || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
> ++  test 0 -eq $? || _lt_function_replace_fail=:
> ++else
> ++  # Save a `func_append' function call even when '+=' is not available
> ++  sed -e 's%func_append \([a-zA-Z_]\{1,\}\) "%\1="$\1%g' $cfgfile > $cfgfile.tmp \
> ++    && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++      || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
> ++  test 0 -eq $? || _lt_function_replace_fail=:
> ++fi
> ++
> ++if test x"$_lt_function_replace_fail" = x":"; then
> ++  { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Unable to substitute extended shell functions in $ofile" >&5
> ++$as_echo "$as_me: WARNING: Unable to substitute extended shell functions in $ofile" >&2;}
> ++fi
> ++
> ++
> ++   mv -f "$cfgfile" "$ofile" ||
> +     (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
> +   chmod +x "$ofile"
> + 
> +@@ -19883,12 +20723,12 @@ with_gcc=$GCC_CXX
> + # Compiler flag to turn off builtin functions.
> + no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag_CXX
> + 
> +-# How to pass a linker flag through the compiler.
> +-wl=$lt_lt_prog_compiler_wl_CXX
> +-
> + # Additional compiler flags for building library objects.
> + pic_flag=$lt_lt_prog_compiler_pic_CXX
> + 
> ++# How to pass a linker flag through the compiler.
> ++wl=$lt_lt_prog_compiler_wl_CXX
> ++
> + # Compiler flag to prevent dynamic linking.
> + link_static_flag=$lt_lt_prog_compiler_static_CXX
> + 
> +@@ -19975,9 +20815,6 @@ inherit_rpath=$inherit_rpath_CXX
> + # Whether libtool must link a program against all its dependency libraries.
> + link_all_deplibs=$link_all_deplibs_CXX
> + 
> +-# Fix the shell variable \$srcfile for the compiler.
> +-fix_srcfile_path=$lt_fix_srcfile_path_CXX
> +-
> + # Set to "yes" if exported symbols are required.
> + always_export_symbols=$always_export_symbols_CXX
> + 
> +@@ -19993,6 +20830,9 @@ include_expsyms=$lt_include_expsyms_CXX
> + # Commands necessary for linking programs (against libraries) with templates.
> + prelink_cmds=$lt_prelink_cmds_CXX
> + 
> ++# Commands necessary for finishing linking programs.
> ++postlink_cmds=$lt_postlink_cmds_CXX
> ++
> + # Specify filename containing input files.
> + file_list_spec=$lt_file_list_spec_CXX
> + 
> +diff --git a/libbacktrace/Makefile.in b/libbacktrace/Makefile.in
> +index e6a4c8e2ef3..3547e3649b7 100644
> +--- a/libbacktrace/Makefile.in
> ++++ b/libbacktrace/Makefile.in
> +@@ -827,6 +827,7 @@ CPP = @CPP@
> + CPPFLAGS = @CPPFLAGS@
> + CYGPATH_W = @CYGPATH_W@
> + DEFS = @DEFS@
> ++DLLTOOL = @DLLTOOL@
> + DSYMUTIL = @DSYMUTIL@
> + DUMPBIN = @DUMPBIN@
> + DWZ = @DWZ@
> +@@ -854,6 +855,7 @@ LN_S = @LN_S@
> + LTLIBOBJS = @LTLIBOBJS@
> + MAINT = @MAINT@
> + MAKEINFO = @MAKEINFO@
> ++MANIFEST_TOOL = @MANIFEST_TOOL@
> + MKDIR_P = @MKDIR_P@
> + NM = @NM@
> + NMEDIT = @NMEDIT@
> +@@ -886,6 +888,7 @@ abs_builddir = @abs_builddir@
> + abs_srcdir = @abs_srcdir@
> + abs_top_builddir = @abs_top_builddir@
> + abs_top_srcdir = @abs_top_srcdir@
> ++ac_ct_AR = @ac_ct_AR@
> + ac_ct_CC = @ac_ct_CC@
> + ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
> + am__leading_dot = @am__leading_dot@
> +diff --git a/libbacktrace/configure b/libbacktrace/configure
> +index 406b67b8cbc..b648da40aab 100755
> +--- a/libbacktrace/configure
> ++++ b/libbacktrace/configure
> +@@ -680,7 +680,10 @@ OTOOL
> + LIPO
> + NMEDIT
> + DSYMUTIL
> ++MANIFEST_TOOL
> ++ac_ct_AR
> + AR
> ++DLLTOOL
> + OBJDUMP
> + LN_S
> + NM
> +@@ -798,6 +801,7 @@ enable_static
> + with_pic
> + enable_fast_install
> + with_gnu_ld
> ++with_libtool_sysroot
> + enable_libtool_lock
> + enable_largefile
> + enable_cet
> +@@ -1458,6 +1462,8 @@ Optional Packages:
> +   --with-pic              try to use only PIC/non-PIC objects [default=use
> +                           both]
> +   --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
> ++  --with-libtool-sysroot=DIR Search for dependent libraries within DIR
> ++                        (or the compiler's sysroot if not specified).
> +   --with-system-libunwind use installed libunwind
> + 
> + Some influential environment variables:
> +@@ -5446,8 +5452,8 @@ esac
> + 
> + 
> + 
> +-macro_version='2.2.7a'
> +-macro_revision='1.3134'
> ++macro_version='2.4'
> ++macro_revision='1.3293'
> + 
> + 
> + 
> +@@ -5487,7 +5493,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> + { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
> + $as_echo_n "checking how to print strings... " >&6; }
> + # Test print first, because it will be a builtin if present.
> +-if test "X`print -r -- -n 2>/dev/null`" = X-n && \
> ++if test "X`( print -r -- -n ) 2>/dev/null`" = X-n && \
> +    test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
> +   ECHO='print -r --'
> + elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
> +@@ -6180,8 +6186,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
> + # Try some XSI features
> + xsi_shell=no
> + ( _lt_dummy="a/b/c"
> +-  test "${_lt_dummy##*/},${_lt_dummy%/*},"${_lt_dummy%"$_lt_dummy"}, \
> +-      = c,a/b,, \
> ++  test "${_lt_dummy##*/},${_lt_dummy%/*},${_lt_dummy#??}"${_lt_dummy%"$_lt_dummy"}, \
> ++      = c,a/b,b/c, \
> +     && eval 'test $(( 1 + 1 )) -eq 2 \
> +     && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
> +   && xsi_shell=yes
> +@@ -6230,6 +6236,80 @@ esac
> + 
> + 
> + 
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to convert $build file names to $host format" >&5
> ++$as_echo_n "checking how to convert $build file names to $host format... " >&6; }
> ++if ${lt_cv_to_host_file_cmd+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  case $host in
> ++  *-*-mingw* )
> ++    case $build in
> ++      *-*-mingw* ) # actually msys
> ++        lt_cv_to_host_file_cmd=func_convert_file_msys_to_w32
> ++        ;;
> ++      *-*-cygwin* )
> ++        lt_cv_to_host_file_cmd=func_convert_file_cygwin_to_w32
> ++        ;;
> ++      * ) # otherwise, assume *nix
> ++        lt_cv_to_host_file_cmd=func_convert_file_nix_to_w32
> ++        ;;
> ++    esac
> ++    ;;
> ++  *-*-cygwin* )
> ++    case $build in
> ++      *-*-mingw* ) # actually msys
> ++        lt_cv_to_host_file_cmd=func_convert_file_msys_to_cygwin
> ++        ;;
> ++      *-*-cygwin* )
> ++        lt_cv_to_host_file_cmd=func_convert_file_noop
> ++        ;;
> ++      * ) # otherwise, assume *nix
> ++        lt_cv_to_host_file_cmd=func_convert_file_nix_to_cygwin
> ++        ;;
> ++    esac
> ++    ;;
> ++  * ) # unhandled hosts (and "normal" native builds)
> ++    lt_cv_to_host_file_cmd=func_convert_file_noop
> ++    ;;
> ++esac
> ++
> ++fi
> ++
> ++to_host_file_cmd=$lt_cv_to_host_file_cmd
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_to_host_file_cmd" >&5
> ++$as_echo "$lt_cv_to_host_file_cmd" >&6; }
> ++
> ++
> ++
> ++
> ++
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to convert $build file names to toolchain format" >&5
> ++$as_echo_n "checking how to convert $build file names to toolchain format... " >&6; }
> ++if ${lt_cv_to_tool_file_cmd+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  #assume ordinary cross tools, or native build.
> ++lt_cv_to_tool_file_cmd=func_convert_file_noop
> ++case $host in
> ++  *-*-mingw* )
> ++    case $build in
> ++      *-*-mingw* ) # actually msys
> ++        lt_cv_to_tool_file_cmd=func_convert_file_msys_to_w32
> ++        ;;
> ++    esac
> ++    ;;
> ++esac
> ++
> ++fi
> ++
> ++to_tool_file_cmd=$lt_cv_to_tool_file_cmd
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_to_tool_file_cmd" >&5
> ++$as_echo "$lt_cv_to_tool_file_cmd" >&6; }
> ++
> ++
> ++
> ++
> ++
> + { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
> + $as_echo_n "checking for $LD option to reload object files... " >&6; }
> + if ${lt_cv_ld_reload_flag+:} false; then :
> +@@ -6246,6 +6326,11 @@ case $reload_flag in
> + esac
> + reload_cmds='$LD$reload_flag -o $output$reload_objs'
> + case $host_os in
> ++  cygwin* | mingw* | pw32* | cegcc*)
> ++    if test "$GCC" != yes; then
> ++      reload_cmds=false
> ++    fi
> ++    ;;
> +   darwin*)
> +     if test "$GCC" = yes; then
> +       reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
> +@@ -6414,7 +6499,8 @@ mingw* | pw32*)
> +     lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
> +     lt_cv_file_magic_cmd='func_win32_libid'
> +   else
> +-    lt_cv_deplibs_check_method='file_magic file format pei*-i386(.*architecture: i386)?'
> ++    # Keep this pattern in sync with the one in func_win32_libid.
> ++    lt_cv_deplibs_check_method='file_magic file format (pei*-i386(.*architecture: i386)?|pe-arm-wince|pe-x86-64)'
> +     lt_cv_file_magic_cmd='$OBJDUMP -f'
> +   fi
> +   ;;
> +@@ -6568,6 +6654,21 @@ esac
> + fi
> + { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
> + $as_echo "$lt_cv_deplibs_check_method" >&6; }
> ++
> ++file_magic_glob=
> ++want_nocaseglob=no
> ++if test "$build" = "$host"; then
> ++  case $host_os in
> ++  mingw* | pw32*)
> ++    if ( shopt | grep nocaseglob ) >/dev/null 2>&1; then
> ++      want_nocaseglob=yes
> ++    else
> ++      file_magic_glob=`echo aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ | $SED -e "s/\(..\)/s\/[\1]\/[\1]\/g;/g"`
> ++    fi
> ++    ;;
> ++  esac
> ++fi
> ++
> + file_magic_cmd=$lt_cv_file_magic_cmd
> + deplibs_check_method=$lt_cv_deplibs_check_method
> + test -z "$deplibs_check_method" && deplibs_check_method=unknown
> +@@ -6583,6 +6684,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
> + 
> + 
> + 
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> ++if test -n "$ac_tool_prefix"; then
> ++  # Extract the first word of "${ac_tool_prefix}dlltool", so it can be a program name with args.
> ++set dummy ${ac_tool_prefix}dlltool; ac_word=$2
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> ++$as_echo_n "checking for $ac_word... " >&6; }
> ++if ${ac_cv_prog_DLLTOOL+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  if test -n "$DLLTOOL"; then
> ++  ac_cv_prog_DLLTOOL="$DLLTOOL" # Let the user override the test.
> ++else
> ++as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
> ++for as_dir in $PATH
> ++do
> ++  IFS=$as_save_IFS
> ++  test -z "$as_dir" && as_dir=.
> ++    for ac_exec_ext in '' $ac_executable_extensions; do
> ++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> ++    ac_cv_prog_DLLTOOL="${ac_tool_prefix}dlltool"
> ++    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
> ++    break 2
> ++  fi
> ++done
> ++  done
> ++IFS=$as_save_IFS
> ++
> ++fi
> ++fi
> ++DLLTOOL=$ac_cv_prog_DLLTOOL
> ++if test -n "$DLLTOOL"; then
> ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $DLLTOOL" >&5
> ++$as_echo "$DLLTOOL" >&6; }
> ++else
> ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
> ++$as_echo "no" >&6; }
> ++fi
> ++
> ++
> ++fi
> ++if test -z "$ac_cv_prog_DLLTOOL"; then
> ++  ac_ct_DLLTOOL=$DLLTOOL
> ++  # Extract the first word of "dlltool", so it can be a program name with args.
> ++set dummy dlltool; ac_word=$2
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> ++$as_echo_n "checking for $ac_word... " >&6; }
> ++if ${ac_cv_prog_ac_ct_DLLTOOL+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  if test -n "$ac_ct_DLLTOOL"; then
> ++  ac_cv_prog_ac_ct_DLLTOOL="$ac_ct_DLLTOOL" # Let the user override the test.
> ++else
> ++as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
> ++for as_dir in $PATH
> ++do
> ++  IFS=$as_save_IFS
> ++  test -z "$as_dir" && as_dir=.
> ++    for ac_exec_ext in '' $ac_executable_extensions; do
> ++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> ++    ac_cv_prog_ac_ct_DLLTOOL="dlltool"
> ++    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
> ++    break 2
> ++  fi
> ++done
> ++  done
> ++IFS=$as_save_IFS
> ++
> ++fi
> ++fi
> ++ac_ct_DLLTOOL=$ac_cv_prog_ac_ct_DLLTOOL
> ++if test -n "$ac_ct_DLLTOOL"; then
> ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_ct_DLLTOOL" >&5
> ++$as_echo "$ac_ct_DLLTOOL" >&6; }
> ++else
> ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
> ++$as_echo "no" >&6; }
> ++fi
> ++
> ++  if test "x$ac_ct_DLLTOOL" = x; then
> ++    DLLTOOL="false"
> ++  else
> ++    case $cross_compiling:$ac_tool_warned in
> ++yes:)
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
> ++$as_echo "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
> ++ac_tool_warned=yes ;;
> ++esac
> ++    DLLTOOL=$ac_ct_DLLTOOL
> ++  fi
> ++else
> ++  DLLTOOL="$ac_cv_prog_DLLTOOL"
> ++fi
> ++
> ++test -z "$DLLTOOL" && DLLTOOL=dlltool
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to associate runtime and link libraries" >&5
> ++$as_echo_n "checking how to associate runtime and link libraries... " >&6; }
> ++if ${lt_cv_sharedlib_from_linklib_cmd+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  lt_cv_sharedlib_from_linklib_cmd='unknown'
> ++
> ++case $host_os in
> ++cygwin* | mingw* | pw32* | cegcc*)
> ++  # two different shell functions defined in ltmain.sh
> ++  # decide which to use based on capabilities of $DLLTOOL
> ++  case `$DLLTOOL --help 2>&1` in
> ++  *--identify-strict*)
> ++    lt_cv_sharedlib_from_linklib_cmd=func_cygming_dll_for_implib
> ++    ;;
> ++  *)
> ++    lt_cv_sharedlib_from_linklib_cmd=func_cygming_dll_for_implib_fallback
> ++    ;;
> ++  esac
> ++  ;;
> ++*)
> ++  # fallback: assume linklib IS sharedlib
> ++  lt_cv_sharedlib_from_linklib_cmd="$ECHO"
> ++  ;;
> ++esac
> ++
> ++fi
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_sharedlib_from_linklib_cmd" >&5
> ++$as_echo "$lt_cv_sharedlib_from_linklib_cmd" >&6; }
> ++sharedlib_from_linklib_cmd=$lt_cv_sharedlib_from_linklib_cmd
> ++test -z "$sharedlib_from_linklib_cmd" && sharedlib_from_linklib_cmd=$ECHO
> ++
> ++
> ++
> ++
> ++
> ++
>  +
> -+if test -n "$ac_tool_prefix"; then
> + plugin_option=
> + plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
> + for plugin in $plugin_names; do
> +@@ -6597,8 +6849,10 @@ for plugin in $plugin_names; do
> + done
> + 
> + if test -n "$ac_tool_prefix"; then
> +-  # Extract the first word of "${ac_tool_prefix}ar", so it can be a program name with args.
> +-set dummy ${ac_tool_prefix}ar; ac_word=$2
>  +  for ac_prog in ar
>  +  do
>  +    # Extract the first word of "$ac_tool_prefix$ac_prog", so it can be a program name with args.
> @@ -10771,7 +16158,7 @@ index a2f33c0f35d..90667680701 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_AR+:} false; then :
> -@@ -6594,7 +6862,7 @@ do
> +@@ -6614,7 +6868,7 @@ do
>     test -z "$as_dir" && as_dir=.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -10780,7 +16167,7 @@ index a2f33c0f35d..90667680701 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -6614,11 +6882,15 @@ $as_echo "no" >&6; }
> +@@ -6634,11 +6888,15 @@ $as_echo "no" >&6; }
>   fi
>   
>   
> @@ -10799,7 +16186,7 @@ index a2f33c0f35d..90667680701 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_ac_ct_AR+:} false; then :
> -@@ -6634,7 +6906,7 @@ do
> +@@ -6654,7 +6912,7 @@ do
>     test -z "$as_dir" && as_dir=.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -10808,7 +16195,7 @@ index a2f33c0f35d..90667680701 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -6653,6 +6925,10 @@ else
> +@@ -6673,6 +6931,10 @@ else
>   $as_echo "no" >&6; }
>   fi
>   
> @@ -10819,7 +16206,7 @@ index a2f33c0f35d..90667680701 100755
>     if test "x$ac_ct_AR" = x; then
>       AR="false"
>     else
> -@@ -6664,12 +6940,21 @@ ac_tool_warned=yes ;;
> +@@ -6684,25 +6946,19 @@ ac_tool_warned=yes ;;
>   esac
>       AR=$ac_ct_AR
>     fi
> @@ -10828,24 +16215,33 @@ index a2f33c0f35d..90667680701 100755
>   fi
>   
>  -test -z "$AR" && AR=ar
> --test -z "$AR_FLAGS" && AR_FLAGS=cru
> +-if test -n "$plugin_option"; then
> +-  if $AR --help 2>&1 | grep -q "\--plugin"; then
> +-    touch conftest.c
> +-    $AR $plugin_option rc conftest.a conftest.c
> +-    if test "$?" != 0; then
> +-      { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Failed: $AR $plugin_option rc" >&5
>  +  touch conftest.c
>  +  $AR $plugin_option rc conftest.a conftest.c
>  +  if test "$?" != 0; then
>  +    { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Failed: $AR $plugin_option rc" >&5
> -+$as_echo "$as_me: WARNING: Failed: $AR $plugin_option rc" >&2;}
> + $as_echo "$as_me: WARNING: Failed: $AR $plugin_option rc" >&2;}
> +-    else
> +-      AR="$AR $plugin_option"
> +-    fi
> +-    rm -f conftest.*
>  +  else
>  +    AR="$AR $plugin_option"
> -+  fi
> +   fi
> +-fi
> +-test -z "$AR_FLAGS" && AR_FLAGS=cru
>  +  rm -f conftest.*
>  +: ${AR=ar}
>  +: ${AR_FLAGS=cru}
> -+
> -+
>   
>   
>   
> -@@ -6679,6 +6964,62 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
> +@@ -6714,6 +6970,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
>   
>   
>   
> @@ -10905,31 +16301,12 @@ index a2f33c0f35d..90667680701 100755
>  +
>  +
>  +
> - 
> - 
> ++
> ++
>   if test -n "$ac_tool_prefix"; then
> -@@ -6873,6 +7214,11 @@ else
> - fi
> - 
> - test -z "$RANLIB" && RANLIB=:
> -+if test -n "$plugin_option" && test "$RANLIB" != ":"; then
> -+  if $RANLIB --help 2>&1 | grep -q "\--plugin"; then
> -+    RANLIB="$RANLIB $plugin_option"
> -+  fi
> -+fi
> - 
> - 
> - 
> -@@ -6987,7 +7333,7 @@ osf*)
> -   symcode='[BCDEGQRST]'
> -   ;;
> - solaris*)
> --  symcode='[BDRT]'
> -+  symcode='[BCDRT]'
> -   ;;
> - sco3.2v5*)
> -   symcode='[DT]'
> -@@ -7015,8 +7361,8 @@ esac
> +   # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
> + set dummy ${ac_tool_prefix}strip; ac_word=$2
> +@@ -7053,8 +7367,8 @@ esac
>   lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
>   
>   # Transform an extracted symbol line into symbol name and symbol address
> @@ -10940,7 +16317,7 @@ index a2f33c0f35d..90667680701 100755
>   
>   # Handle CRLF in mingw tool chain
>   opt_cr=
> -@@ -7052,6 +7398,7 @@ for ac_symprfx in "" "_"; do
> +@@ -7090,6 +7404,7 @@ for ac_symprfx in "" "_"; do
>     else
>       lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
>     fi
> @@ -10948,7 +16325,7 @@ index a2f33c0f35d..90667680701 100755
>   
>     # Check to see that the pipe works correctly.
>     pipe_works=no
> -@@ -7093,6 +7440,18 @@ _LT_EOF
> +@@ -7131,6 +7446,18 @@ _LT_EOF
>         if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
>   	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
>   	  cat <<_LT_EOF > conftest.$ac_ext
> @@ -10967,7 +16344,7 @@ index a2f33c0f35d..90667680701 100755
>   #ifdef __cplusplus
>   extern "C" {
>   #endif
> -@@ -7104,7 +7463,7 @@ _LT_EOF
> +@@ -7142,7 +7469,7 @@ _LT_EOF
>   	  cat <<_LT_EOF >> conftest.$ac_ext
>   
>   /* The mapping between symbol names and symbols.  */
> @@ -10976,7 +16353,7 @@ index a2f33c0f35d..90667680701 100755
>     const char *name;
>     void       *address;
>   }
> -@@ -7130,8 +7489,8 @@ static const void *lt_preloaded_setup() {
> +@@ -7168,8 +7495,8 @@ static const void *lt_preloaded_setup() {
>   _LT_EOF
>   	  # Now try linking the two files.
>   	  mv conftest.$ac_objext conftstm.$ac_objext
> @@ -10987,7 +16364,7 @@ index a2f33c0f35d..90667680701 100755
>   	  LIBS="conftstm.$ac_objext"
>   	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
>   	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
> -@@ -7141,8 +7500,8 @@ _LT_EOF
> +@@ -7179,8 +7506,8 @@ _LT_EOF
>     test $ac_status = 0; } && test -s conftest${ac_exeext}; then
>   	    pipe_works=yes
>   	  fi
> @@ -10998,7 +16375,7 @@ index a2f33c0f35d..90667680701 100755
>   	else
>   	  echo "cannot find nm_test_func in $nlist" >&5
>   	fi
> -@@ -7179,6 +7538,17 @@ else
> +@@ -7217,6 +7544,18 @@ else
>   $as_echo "ok" >&6; }
>   fi
>   
> @@ -11013,10 +16390,11 @@ index a2f33c0f35d..90667680701 100755
>  +
>  +
>  +
> ++
>   
>   
>   
> -@@ -7195,6 +7565,44 @@ fi
> +@@ -7233,6 +7572,43 @@ fi
>   
>   
>   
> @@ -11025,7 +16403,6 @@ index a2f33c0f35d..90667680701 100755
>  +
>  +
>  +
> -+
>  +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
>  +$as_echo_n "checking for sysroot... " >&6; }
>  +
> @@ -11061,49 +16438,10 @@ index a2f33c0f35d..90667680701 100755
>   
>   
>   
> -@@ -7372,39 +7780,156 @@ ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $
> - ac_compiler_gnu=$ac_cv_c_compiler_gnu
> +@@ -7444,6 +7820,123 @@ esac
> + 
> + need_locks="$enable_libtool_lock"
>   
> - fi
> --{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_cc_needs_belf" >&5
> --$as_echo "$lt_cv_cc_needs_belf" >&6; }
> --  if test x"$lt_cv_cc_needs_belf" != x"yes"; then
> --    # this is probably gcc 2.8.0, egcs 1.0 or newer; no need for -belf
> --    CFLAGS="$SAVE_CFLAGS"
> -+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_cc_needs_belf" >&5
> -+$as_echo "$lt_cv_cc_needs_belf" >&6; }
> -+  if test x"$lt_cv_cc_needs_belf" != x"yes"; then
> -+    # this is probably gcc 2.8.0, egcs 1.0 or newer; no need for -belf
> -+    CFLAGS="$SAVE_CFLAGS"
> -+  fi
> -+  ;;
> -+sparc*-*solaris*)
> -+  # Find out which ABI we are using.
> -+  echo 'int i;' > conftest.$ac_ext
> -+  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
> -+  (eval $ac_compile) 2>&5
> -+  ac_status=$?
> -+  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
> -+  test $ac_status = 0; }; then
> -+    case `/usr/bin/file conftest.o` in
> -+    *64-bit*)
> -+      case $lt_cv_prog_gnu_ld in
> -+      yes*) LD="${LD-ld} -m elf64_sparc" ;;
> -+      *)
> -+	if ${LD-ld} -64 -r -o conftest2.o conftest.o >/dev/null 2>&1; then
> -+	  LD="${LD-ld} -64"
> -+	fi
> -+	;;
> -+      esac
> -+      ;;
> -+    esac
> -+  fi
> -+  rm -rf conftest*
> -+  ;;
> -+esac
> -+
> -+need_locks="$enable_libtool_lock"
> -+
>  +if test -n "$ac_tool_prefix"; then
>  +  # Extract the first word of "${ac_tool_prefix}mt", so it can be a program name with args.
>  +set dummy ${ac_tool_prefix}mt; ac_word=$2
> @@ -11191,28 +16529,7 @@ index a2f33c0f35d..90667680701 100755
>  +ac_tool_warned=yes ;;
>  +esac
>  +    MANIFEST_TOOL=$ac_ct_MANIFEST_TOOL
> -   fi
> --  ;;
> --sparc*-*solaris*)
> --  # Find out which ABI we are using.
> --  echo 'int i;' > conftest.$ac_ext
> --  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
> --  (eval $ac_compile) 2>&5
> --  ac_status=$?
> --  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
> --  test $ac_status = 0; }; then
> --    case `/usr/bin/file conftest.o` in
> --    *64-bit*)
> --      case $lt_cv_prog_gnu_ld in
> --      yes*) LD="${LD-ld} -m elf64_sparc" ;;
> --      *)
> --	if ${LD-ld} -64 -r -o conftest2.o conftest.o >/dev/null 2>&1; then
> --	  LD="${LD-ld} -64"
> --	fi
> --	;;
> --      esac
> --      ;;
> --    esac
> ++  fi
>  +else
>  +  MANIFEST_TOOL="$ac_cv_prog_MANIFEST_TOOL"
>  +fi
> @@ -11229,10 +16546,7 @@ index a2f33c0f35d..90667680701 100755
>  +  cat conftest.err >&5
>  +  if $GREP 'Manifest Tool' conftest.out > /dev/null; then
>  +    lt_cv_path_mainfest_tool=yes
> -   fi
> --  rm -rf conftest*
> --  ;;
> --esac
> ++  fi
>  +  rm -f conftest*
>  +fi
>  +{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_path_mainfest_tool" >&5
> @@ -11243,12 +16557,12 @@ index a2f33c0f35d..90667680701 100755
>  +
>  +
>  +
> - 
> --need_locks="$enable_libtool_lock"
> - 
> ++
> ++
>   
>     case $host_os in
> -@@ -7969,6 +8494,8 @@ _LT_EOF
> +     rhapsody* | darwin*)
> +@@ -8007,6 +8500,8 @@ _LT_EOF
>         $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
>         echo "$AR cru libconftest.a conftest.o" >&5
>         $AR cru libconftest.a conftest.o 2>&5
> @@ -11257,47 +16571,7 @@ index a2f33c0f35d..90667680701 100755
>         cat > conftest.c << _LT_EOF
>   int main() { return 0;}
>   _LT_EOF
> -@@ -7986,25 +8513,23 @@ _LT_EOF
> - fi
> - { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_ld_force_load" >&5
> - $as_echo "$lt_cv_ld_force_load" >&6; }
> --    # Allow for Darwin 4-7 (macOS 10.0-10.3) although these are not expect to
> --    # build without first building modern cctools / linker.
> --    case $host_cpu-$host_os in
> --    *-rhapsody* | *-darwin1.[012])
> -+    case $host_os in
> -+    rhapsody* | darwin1.[012])
> -       _lt_dar_allow_undefined='${wl}-undefined ${wl}suppress' ;;
> --    *-darwin1.*)
> -+    darwin1.*)
> -       _lt_dar_allow_undefined='${wl}-flat_namespace ${wl}-undefined ${wl}suppress' ;;
> --    *-darwin*)
> --      # darwin 5.x (macOS 10.1) onwards we only need to adjust when the
> --      # deployment target is forced to an earlier version.
> --      case ${MACOSX_DEPLOYMENT_TARGET-UNSET},$host in
> --	UNSET,*-darwin[89]*|UNSET,*-darwin[12][0123456789]*)
> --	  ;;
> -+    darwin*) # darwin 5.x on
> -+      # if running on 10.5 or later, the deployment target defaults
> -+      # to the OS version, if on x86, and 10.4, the deployment
> -+      # target defaults to 10.4. Don't you love it?
> -+      case ${MACOSX_DEPLOYMENT_TARGET-10.0},$host in
> -+	10.0,*86*-darwin8*|10.0,*-darwin[91]*)
> -+	  _lt_dar_allow_undefined='${wl}-undefined ${wl}dynamic_lookup' ;;
> - 	10.[012][,.]*)
> --	  _lt_dar_allow_undefined='${wl}-flat_namespace ${wl}-undefined ${wl}suppress'
> --	  ;;
> --	*)
> --	  ;;
> --     esac
> -+	  _lt_dar_allow_undefined='${wl}-flat_namespace ${wl}-undefined ${wl}suppress' ;;
> -+	10.*)
> -+	  _lt_dar_allow_undefined='${wl}-undefined ${wl}dynamic_lookup' ;;
> -+      esac
> -     ;;
> -   esac
> -     if test "$lt_cv_apple_cc_single_mod" = "yes"; then
> -@@ -8553,8 +9078,6 @@ fi
> +@@ -8589,8 +9084,6 @@ fi
>   lt_prog_compiler_pic=
>   lt_prog_compiler_static=
>   
> @@ -11306,7 +16580,7 @@ index a2f33c0f35d..90667680701 100755
>   
>     if test "$GCC" = yes; then
>       lt_prog_compiler_wl='-Wl,'
> -@@ -8720,6 +9243,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -8756,6 +9249,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>   	lt_prog_compiler_pic='--shared'
>   	lt_prog_compiler_static='--static'
>   	;;
> @@ -11319,7 +16593,7 @@ index a2f33c0f35d..90667680701 100755
>         pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
>           # Portland Group compilers (*not* the Pentium gcc compiler,
>   	# which looks to be a dead project)
> -@@ -8782,7 +9311,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -8818,7 +9317,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>         lt_prog_compiler_pic='-KPIC'
>         lt_prog_compiler_static='-Bstatic'
>         case $cc_basename in
> @@ -11328,7 +16602,7 @@ index a2f33c0f35d..90667680701 100755
>   	lt_prog_compiler_wl='-Qoption ld ';;
>         *)
>   	lt_prog_compiler_wl='-Wl,';;
> -@@ -8839,13 +9368,17 @@ case $host_os in
> +@@ -8875,13 +9374,17 @@ case $host_os in
>       lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
>       ;;
>   esac
> @@ -11352,7 +16626,7 @@ index a2f33c0f35d..90667680701 100755
>   
>   #
>   # Check to make sure the PIC flag actually works.
> -@@ -8906,6 +9439,11 @@ fi
> +@@ -8942,6 +9445,11 @@ fi
>   
>   
>   
> @@ -11364,7 +16638,7 @@ index a2f33c0f35d..90667680701 100755
>   #
>   # Check to make sure the static flag actually works.
>   #
> -@@ -9256,7 +9794,8 @@ _LT_EOF
> +@@ -9292,7 +9800,8 @@ _LT_EOF
>         allow_undefined_flag=unsupported
>         always_export_symbols=no
>         enable_shared_with_static_runtimes=yes
> @@ -11374,16 +16648,7 @@ index a2f33c0f35d..90667680701 100755
>   
>         if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
>           archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
> -@@ -9294,7 +9833,7 @@ _LT_EOF
> -       archive_expsym_cmds='sed "s,^,_," $export_symbols >$output_objdir/$soname.expsym~$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-h,$soname ${wl}--retain-symbols-file,$output_objdir/$soname.expsym ${wl}--image-base,`expr ${RANDOM-$$} % 4096 / 2 \* 262144 + 1342177280` -o $lib'
> -       ;;
> - 
> --    gnu* | linux* | tpf* | k*bsd*-gnu | kopensolaris*-gnu | uclinuxfdpiceabi)
> -+    gnu* | linux* | tpf* | k*bsd*-gnu | kopensolaris*-gnu)
> -       tmp_diet=no
> -       if test "$host_os" = linux-dietlibc; then
> - 	case $cc_basename in
> -@@ -9355,12 +9894,12 @@ _LT_EOF
> +@@ -9391,12 +9900,12 @@ _LT_EOF
>   	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
>   	  hardcode_libdir_flag_spec=
>   	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
> @@ -11398,7 +16663,7 @@ index a2f33c0f35d..90667680701 100755
>   	  fi
>   	  ;;
>   	esac
> -@@ -9374,8 +9913,8 @@ _LT_EOF
> +@@ -9410,8 +9919,8 @@ _LT_EOF
>   	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
>   	wlarc=
>         else
> @@ -11409,7 +16674,7 @@ index a2f33c0f35d..90667680701 100755
>         fi
>         ;;
>   
> -@@ -9393,8 +9932,8 @@ _LT_EOF
> +@@ -9429,8 +9938,8 @@ _LT_EOF
>   
>   _LT_EOF
>         elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -11420,7 +16685,7 @@ index a2f33c0f35d..90667680701 100755
>         else
>   	ld_shlibs=no
>         fi
> -@@ -9440,8 +9979,8 @@ _LT_EOF
> +@@ -9476,8 +9985,8 @@ _LT_EOF
>   
>       *)
>         if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -11431,7 +16696,7 @@ index a2f33c0f35d..90667680701 100755
>         else
>   	ld_shlibs=no
>         fi
> -@@ -9571,7 +10110,13 @@ _LT_EOF
> +@@ -9607,7 +10116,13 @@ _LT_EOF
>   	allow_undefined_flag='-berok'
>           # Determine the default libpath from the value encoded in an
>           # empty executable.
> @@ -11446,7 +16711,7 @@ index a2f33c0f35d..90667680701 100755
>   /* end confdefs.h.  */
>   
>   int
> -@@ -9584,22 +10129,29 @@ main ()
> +@@ -9620,22 +10135,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>   
> @@ -11489,7 +16754,7 @@ index a2f33c0f35d..90667680701 100755
>   
>           hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>           archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> -@@ -9611,7 +10163,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9647,7 +10169,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	else
>   	 # Determine the default libpath from the value encoded in an
>   	 # empty executable.
> @@ -11504,7 +16769,7 @@ index a2f33c0f35d..90667680701 100755
>   /* end confdefs.h.  */
>   
>   int
> -@@ -9624,22 +10182,29 @@ main ()
> +@@ -9660,22 +10188,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>   
> @@ -11547,7 +16812,7 @@ index a2f33c0f35d..90667680701 100755
>   
>   	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>   	  # Warning - without using the other run time loading flags,
> -@@ -9684,20 +10249,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9720,20 +10255,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>         # Microsoft Visual C++.
>         # hardcode_libdir_flag_spec is actually meaningless, as there is
>         # no search path for DLLs.
> @@ -11625,7 +16890,7 @@ index a2f33c0f35d..90667680701 100755
>         ;;
>   
>       darwin* | rhapsody*)
> -@@ -9758,7 +10366,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9794,7 +10372,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
>       freebsd* | dragonfly*)
> @@ -11634,7 +16899,7 @@ index a2f33c0f35d..90667680701 100755
>         hardcode_libdir_flag_spec='-R$libdir'
>         hardcode_direct=yes
>         hardcode_shlibpath_var=no
> -@@ -9766,7 +10374,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9802,7 +10380,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       hpux9*)
>         if test "$GCC" = yes; then
> @@ -11643,7 +16908,7 @@ index a2f33c0f35d..90667680701 100755
>         else
>   	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
>         fi
> -@@ -9782,7 +10390,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9818,7 +10396,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       hpux10*)
>         if test "$GCC" = yes && test "$with_gnu_ld" = no; then
> @@ -11652,12 +16917,8 @@ index a2f33c0f35d..90667680701 100755
>         else
>   	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
>         fi
> -@@ -9803,19 +10411,19 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> -       if test "$GCC" = yes && test "$with_gnu_ld" = no; then
> - 	case $host_cpu in
> - 	hppa*64*)
> --	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
> -+	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
> +@@ -9842,10 +10420,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> + 	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
>   	  ;;
>   	ia64*)
>  -	  archive_cmds='$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
> @@ -11669,14 +16930,7 @@ index a2f33c0f35d..90667680701 100755
>   	  ;;
>   	esac
>         else
> - 	case $host_cpu in
> - 	hppa*64*)
> --	  archive_cmds='$CC -b ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
> -+	  archive_cmds='$CC -b ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
> - 	  ;;
> - 	ia64*)
> - 	  archive_cmds='$CC -b ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
> -@@ -9888,23 +10496,36 @@ fi
> +@@ -9924,23 +10502,36 @@ fi
>   
>       irix5* | irix6* | nonstopux*)
>         if test "$GCC" = yes; then
> @@ -11721,7 +16975,7 @@ index a2f33c0f35d..90667680701 100755
>         else
>   	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
>   	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
> -@@ -9989,7 +10610,7 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -10025,7 +10616,7 @@ rm -f core conftest.err conftest.$ac_objext \
>       osf4* | osf5*)	# as osf3* with the addition of -msym flag
>         if test "$GCC" = yes; then
>   	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
> @@ -11730,7 +16984,7 @@ index a2f33c0f35d..90667680701 100755
>   	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
>         else
>   	allow_undefined_flag=' -expect_unresolved \*'
> -@@ -10008,9 +10629,9 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -10044,9 +10635,9 @@ rm -f core conftest.err conftest.$ac_objext \
>         no_undefined_flag=' -z defs'
>         if test "$GCC" = yes; then
>   	wlarc='${wl}'
> @@ -11742,7 +16996,7 @@ index a2f33c0f35d..90667680701 100755
>         else
>   	case `$CC -V 2>&1` in
>   	*"Compilers 5.0"*)
> -@@ -10586,8 +11207,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -10622,8 +11213,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>     need_version=no
>     need_lib_prefix=no
>   
> @@ -11754,7 +17008,7 @@ index a2f33c0f35d..90667680701 100755
>       library_names_spec='$libname.dll.a'
>       # DLL is installed to $(libdir)/../bin by postinstall_cmds
>       postinstall_cmds='base_file=`basename \${file}`~
> -@@ -10620,13 +11242,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -10656,13 +11248,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>         library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>         ;;
>       esac
> @@ -11827,39 +17081,16 @@ index a2f33c0f35d..90667680701 100755
>     # FIXME: first we should search . and the directory the executable is in
>     shlibpath_var=PATH
>     ;;
> -@@ -10708,7 +11388,7 @@ haiku*)
> -   soname_spec='${libname}${release}${shared_ext}$major'
> -   shlibpath_var=LIBRARY_PATH
> -   shlibpath_overrides_runpath=yes
> --  sys_lib_dlsearch_path_spec='/boot/home/config/lib /boot/common/lib /boot/beos/system/lib'
> -+  sys_lib_dlsearch_path_spec='/boot/home/config/lib /boot/common/lib /boot/system/lib'
> -   hardcode_into_libs=yes
> -   ;;
> - 
> -@@ -10815,12 +11495,7 @@ linux*oldld* | linux*aout* | linux*coff*)
> -   ;;
> - 
> - # This must be Linux ELF.
> --
> --# uclinux* changes (here and below) have been submitted to the libtool
> --# project, but have not yet been accepted: they are GCC-local changes
> --# for the time being.  (See
> --# https://lists.gnu.org/archive/html/libtool-patches/2018-05/msg00000.html)
> --linux* | k*bsd*-gnu | kopensolaris*-gnu | gnu* | uclinuxfdpiceabi)
> -+linux* | k*bsd*-gnu | kopensolaris*-gnu | gnu*)
> -   version_type=linux
> -   need_lib_prefix=no
> -   need_version=no
> -@@ -11509,7 +12184,7 @@ else
> +@@ -11540,7 +12190,7 @@ else
>     lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>     lt_status=$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 11512 "configure"
> +-#line 11543 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>   
>   #if HAVE_DLFCN_H
> -@@ -11553,10 +12228,10 @@ else
> +@@ -11584,10 +12234,10 @@ else
>   /* When -fvisbility=hidden is used, assume the code has been annotated
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -11872,16 +17103,16 @@ index a2f33c0f35d..90667680701 100755
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -11615,7 +12290,7 @@ else
> +@@ -11646,7 +12296,7 @@ else
>     lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>     lt_status=$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 11618 "configure"
> +-#line 11649 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>   
>   #if HAVE_DLFCN_H
> -@@ -11659,10 +12334,10 @@ else
> +@@ -11690,10 +12340,10 @@ else
>   /* When -fvisbility=hidden is used, assume the code has been annotated
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -11894,7 +17125,7 @@ index a2f33c0f35d..90667680701 100755
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -14948,13 +15623,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
> +@@ -14979,13 +15629,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
>   lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>   lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>   lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -11915,7 +17146,7 @@ index a2f33c0f35d..90667680701 100755
>   STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>   RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>   old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
> -@@ -14969,14 +15651,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
> +@@ -15000,14 +15657,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
>   lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
> @@ -11934,7 +17165,7 @@ index a2f33c0f35d..90667680701 100755
>   DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>   NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>   LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -15009,12 +15694,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
> +@@ -15040,12 +15700,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
>   hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
>   inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
>   link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
> @@ -11948,7 +17179,7 @@ index a2f33c0f35d..90667680701 100755
>   file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
>   variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
>   need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
> -@@ -15069,8 +15754,13 @@ reload_flag \
> +@@ -15100,8 +15760,13 @@ reload_flag \
>   OBJDUMP \
>   deplibs_check_method \
>   file_magic_cmd \
> @@ -11962,7 +17193,7 @@ index a2f33c0f35d..90667680701 100755
>   STRIP \
>   RANLIB \
>   CC \
> -@@ -15080,12 +15770,14 @@ lt_cv_sys_global_symbol_pipe \
> +@@ -15111,12 +15776,14 @@ lt_cv_sys_global_symbol_pipe \
>   lt_cv_sys_global_symbol_to_cdecl \
>   lt_cv_sys_global_symbol_to_c_name_address \
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -11978,7 +17209,7 @@ index a2f33c0f35d..90667680701 100755
>   DSYMUTIL \
>   NMEDIT \
>   LIPO \
> -@@ -15101,7 +15793,6 @@ no_undefined_flag \
> +@@ -15132,7 +15799,6 @@ no_undefined_flag \
>   hardcode_libdir_flag_spec \
>   hardcode_libdir_flag_spec_ld \
>   hardcode_libdir_separator \
> @@ -11986,7 +17217,7 @@ index a2f33c0f35d..90667680701 100755
>   exclude_expsyms \
>   include_expsyms \
>   file_list_spec \
> -@@ -15137,6 +15828,7 @@ module_cmds \
> +@@ -15168,6 +15834,7 @@ module_cmds \
>   module_expsym_cmds \
>   export_symbols_cmds \
>   prelink_cmds \
> @@ -11994,7 +17225,7 @@ index a2f33c0f35d..90667680701 100755
>   postinstall_cmds \
>   postuninstall_cmds \
>   finish_cmds \
> -@@ -15835,7 +16527,8 @@ esac ;;
> +@@ -15866,7 +16533,8 @@ esac ;;
>   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>   #
>   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -12004,7 +17235,7 @@ index a2f33c0f35d..90667680701 100755
>   #   Written by Gordon Matzigkeit, 1996
>   #
>   #   This file is part of GNU Libtool.
> -@@ -15938,19 +16631,42 @@ SP2NL=$lt_lt_SP2NL
> +@@ -15969,19 +16637,42 @@ SP2NL=$lt_lt_SP2NL
>   # turn newlines into spaces.
>   NL2SP=$lt_lt_NL2SP
>   
> @@ -12048,7 +17279,7 @@ index a2f33c0f35d..90667680701 100755
>   # A symbol stripping program.
>   STRIP=$lt_STRIP
>   
> -@@ -15980,6 +16696,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
> +@@ -16011,6 +16702,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
>   # Transform the output of nm in a C name address pair when lib prefix is needed.
>   global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
>   
> @@ -12061,7 +17292,7 @@ index a2f33c0f35d..90667680701 100755
>   # The name of the directory that contains temporary libtool files.
>   objdir=$objdir
>   
> -@@ -15989,6 +16711,9 @@ MAGIC_CMD=$MAGIC_CMD
> +@@ -16020,6 +16717,9 @@ MAGIC_CMD=$MAGIC_CMD
>   # Must we lock files when doing compilation?
>   need_locks=$lt_need_locks
>   
> @@ -12071,7 +17302,7 @@ index a2f33c0f35d..90667680701 100755
>   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>   DSYMUTIL=$lt_DSYMUTIL
>   
> -@@ -16103,12 +16828,12 @@ with_gcc=$GCC
> +@@ -16134,12 +16834,12 @@ with_gcc=$GCC
>   # Compiler flag to turn off builtin functions.
>   no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
>   
> @@ -12087,7 +17318,7 @@ index a2f33c0f35d..90667680701 100755
>   # Compiler flag to prevent dynamic linking.
>   link_static_flag=$lt_lt_prog_compiler_static
>   
> -@@ -16195,9 +16920,6 @@ inherit_rpath=$inherit_rpath
> +@@ -16226,9 +16926,6 @@ inherit_rpath=$inherit_rpath
>   # Whether libtool must link a program against all its dependency libraries.
>   link_all_deplibs=$link_all_deplibs
>   
> @@ -12097,7 +17328,7 @@ index a2f33c0f35d..90667680701 100755
>   # Set to "yes" if exported symbols are required.
>   always_export_symbols=$always_export_symbols
>   
> -@@ -16213,6 +16935,9 @@ include_expsyms=$lt_include_expsyms
> +@@ -16244,6 +16941,9 @@ include_expsyms=$lt_include_expsyms
>   # Commands necessary for linking programs (against libraries) with templates.
>   prelink_cmds=$lt_prelink_cmds
>   
> @@ -12107,7 +17338,7 @@ index a2f33c0f35d..90667680701 100755
>   # Specify filename containing input files.
>   file_list_spec=$lt_file_list_spec
>   
> -@@ -16245,210 +16970,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
> +@@ -16276,210 +16976,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
>     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>     # text mode, it properly converts lines to CR/LF.  This bash problem
>     # is reportedly fixed, but why not run on old versions too?
> @@ -12481,8 +17712,28 @@ index a2f33c0f35d..90667680701 100755
>       (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
>     chmod +x "$ofile"
>   
> +diff --git a/libctf/Makefile.in b/libctf/Makefile.in
> +index 1984f50867a..51a3dd26e87 100644
> +--- a/libctf/Makefile.in
> ++++ b/libctf/Makefile.in
> +@@ -393,6 +393,7 @@ CYGPATH_W = @CYGPATH_W@
> + DATADIRNAME = @DATADIRNAME@
> + DEFS = @DEFS@
> + DEPDIR = @DEPDIR@
> ++DLLTOOL = @DLLTOOL@
> + DSYMUTIL = @DSYMUTIL@
> + DUMPBIN = @DUMPBIN@
> + ECHO_C = @ECHO_C@
> +@@ -426,6 +427,7 @@ LN_S = @LN_S@
> + LTLIBOBJS = @LTLIBOBJS@
> + MAINT = @MAINT@
> + MAKEINFO = @MAKEINFO@
> ++MANIFEST_TOOL = @MANIFEST_TOOL@
> + MKDIR_P = @MKDIR_P@
> + NM = @NM@
> + NMEDIT = @NMEDIT@
>  diff --git a/libctf/configure b/libctf/configure
> -index de10fef84a1..1b0ee0d32c6 100755
> +index 8704bc215f4..c1bf438bda6 100755
>  --- a/libctf/configure
>  +++ b/libctf/configure
>  @@ -669,6 +669,8 @@ OTOOL
> @@ -12494,7 +17745,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   OBJDUMP
>   LN_S
>   NM
> -@@ -801,6 +803,7 @@ enable_static
> +@@ -800,6 +802,7 @@ enable_static
>   with_pic
>   enable_fast_install
>   with_gnu_ld
> @@ -12502,7 +17753,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   enable_libtool_lock
>   enable_largefile
>   enable_werror_always
> -@@ -1475,6 +1478,8 @@ Optional Packages:
> +@@ -1463,6 +1466,8 @@ Optional Packages:
>     --with-pic              try to use only PIC/non-PIC objects [default=use
>                             both]
>     --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
> @@ -12511,7 +17762,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>     --with-system-zlib      use installed libz
>   
>   Some influential environment variables:
> -@@ -5583,8 +5588,8 @@ esac
> +@@ -5571,8 +5576,8 @@ esac
>   
>   
>   
> @@ -12522,7 +17773,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   
>   
>   
> -@@ -5624,7 +5629,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> +@@ -5612,7 +5617,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
>   $as_echo_n "checking how to print strings... " >&6; }
>   # Test print first, because it will be a builtin if present.
> @@ -12531,7 +17782,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>      test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
>     ECHO='print -r --'
>   elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
> -@@ -6311,8 +6316,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
> +@@ -6305,8 +6310,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
>   # Try some XSI features
>   xsi_shell=no
>   ( _lt_dummy="a/b/c"
> @@ -12542,7 +17793,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>       && eval 'test $(( 1 + 1 )) -eq 2 \
>       && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
>     && xsi_shell=yes
> -@@ -6361,6 +6366,80 @@ esac
> +@@ -6355,6 +6360,80 @@ esac
>   
>   
>   
> @@ -12623,7 +17874,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
>   $as_echo_n "checking for $LD option to reload object files... " >&6; }
>   if ${lt_cv_ld_reload_flag+:} false; then :
> -@@ -6377,6 +6456,11 @@ case $reload_flag in
> +@@ -6371,6 +6450,11 @@ case $reload_flag in
>   esac
>   reload_cmds='$LD$reload_flag -o $output$reload_objs'
>   case $host_os in
> @@ -12635,7 +17886,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>     darwin*)
>       if test "$GCC" = yes; then
>         reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
> -@@ -6545,7 +6629,8 @@ mingw* | pw32*)
> +@@ -6539,7 +6623,8 @@ mingw* | pw32*)
>       lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
>       lt_cv_file_magic_cmd='func_win32_libid'
>     else
> @@ -12645,7 +17896,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>       lt_cv_file_magic_cmd='$OBJDUMP -f'
>     fi
>     ;;
> -@@ -6699,6 +6784,21 @@ esac
> +@@ -6693,6 +6778,21 @@ esac
>   fi
>   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
>   $as_echo "$lt_cv_deplibs_check_method" >&6; }
> @@ -12667,7 +17918,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   file_magic_cmd=$lt_cv_file_magic_cmd
>   deplibs_check_method=$lt_cv_deplibs_check_method
>   test -z "$deplibs_check_method" && deplibs_check_method=unknown
> -@@ -6714,6 +6814,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
> +@@ -6708,6 +6808,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
>   
>   
>   
> @@ -12825,7 +18076,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   plugin_option=
>   plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
>   for plugin in $plugin_names; do
> -@@ -6728,8 +6979,10 @@ for plugin in $plugin_names; do
> +@@ -6722,8 +6973,10 @@ for plugin in $plugin_names; do
>   done
>   
>   if test -n "$ac_tool_prefix"; then
> @@ -12838,7 +18089,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_AR+:} false; then :
> -@@ -6745,7 +6998,7 @@ do
> +@@ -6739,7 +6992,7 @@ do
>     test -z "$as_dir" && as_dir=.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -12847,7 +18098,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -6765,11 +7018,15 @@ $as_echo "no" >&6; }
> +@@ -6759,11 +7012,15 @@ $as_echo "no" >&6; }
>   fi
>   
>   
> @@ -12866,7 +18117,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_ac_ct_AR+:} false; then :
> -@@ -6785,7 +7042,7 @@ do
> +@@ -6779,7 +7036,7 @@ do
>     test -z "$as_dir" && as_dir=.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -12875,7 +18126,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -6804,6 +7061,10 @@ else
> +@@ -6798,6 +7055,10 @@ else
>   $as_echo "no" >&6; }
>   fi
>   
> @@ -12886,7 +18137,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>     if test "x$ac_ct_AR" = x; then
>       AR="false"
>     else
> -@@ -6815,25 +7076,19 @@ ac_tool_warned=yes ;;
> +@@ -6809,25 +7070,19 @@ ac_tool_warned=yes ;;
>   esac
>       AR=$ac_ct_AR
>     fi
> @@ -12921,7 +18172,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   
>   
>   
> -@@ -6845,6 +7100,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
> +@@ -6839,6 +7094,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
>   
>   
>   
> @@ -12986,7 +18237,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   if test -n "$ac_tool_prefix"; then
>     # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
>   set dummy ${ac_tool_prefix}strip; ac_word=$2
> -@@ -7184,8 +7497,8 @@ esac
> +@@ -7178,8 +7491,8 @@ esac
>   lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
>   
>   # Transform an extracted symbol line into symbol name and symbol address
> @@ -12997,7 +18248,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   
>   # Handle CRLF in mingw tool chain
>   opt_cr=
> -@@ -7221,6 +7534,7 @@ for ac_symprfx in "" "_"; do
> +@@ -7215,6 +7528,7 @@ for ac_symprfx in "" "_"; do
>     else
>       lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
>     fi
> @@ -13005,7 +18256,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   
>     # Check to see that the pipe works correctly.
>     pipe_works=no
> -@@ -7262,6 +7576,18 @@ _LT_EOF
> +@@ -7256,6 +7570,18 @@ _LT_EOF
>         if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
>   	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
>   	  cat <<_LT_EOF > conftest.$ac_ext
> @@ -13024,7 +18275,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   #ifdef __cplusplus
>   extern "C" {
>   #endif
> -@@ -7273,7 +7599,7 @@ _LT_EOF
> +@@ -7267,7 +7593,7 @@ _LT_EOF
>   	  cat <<_LT_EOF >> conftest.$ac_ext
>   
>   /* The mapping between symbol names and symbols.  */
> @@ -13033,7 +18284,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>     const char *name;
>     void       *address;
>   }
> -@@ -7299,8 +7625,8 @@ static const void *lt_preloaded_setup() {
> +@@ -7293,8 +7619,8 @@ static const void *lt_preloaded_setup() {
>   _LT_EOF
>   	  # Now try linking the two files.
>   	  mv conftest.$ac_objext conftstm.$ac_objext
> @@ -13044,7 +18295,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   	  LIBS="conftstm.$ac_objext"
>   	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
>   	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
> -@@ -7310,8 +7636,8 @@ _LT_EOF
> +@@ -7304,8 +7630,8 @@ _LT_EOF
>     test $ac_status = 0; } && test -s conftest${ac_exeext}; then
>   	    pipe_works=yes
>   	  fi
> @@ -13055,7 +18306,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   	else
>   	  echo "cannot find nm_test_func in $nlist" >&5
>   	fi
> -@@ -7348,6 +7674,14 @@ else
> +@@ -7342,6 +7668,14 @@ else
>   $as_echo "ok" >&6; }
>   fi
>   
> @@ -13070,7 +18321,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   
>   
>   
> -@@ -7366,6 +7700,47 @@ fi
> +@@ -7360,6 +7694,47 @@ fi
>   
>   
>   
> @@ -13118,7 +18369,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   
>   
>   
> -@@ -7575,6 +7950,123 @@ esac
> +@@ -7569,6 +7944,123 @@ esac
>   
>   need_locks="$enable_libtool_lock"
>   
> @@ -13242,7 +18493,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   
>     case $host_os in
>       rhapsody* | darwin*)
> -@@ -8138,6 +8630,8 @@ _LT_EOF
> +@@ -8132,6 +8624,8 @@ _LT_EOF
>         $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
>         echo "$AR cru libconftest.a conftest.o" >&5
>         $AR cru libconftest.a conftest.o 2>&5
> @@ -13251,7 +18502,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>         cat > conftest.c << _LT_EOF
>   int main() { return 0;}
>   _LT_EOF
> -@@ -8690,8 +9184,6 @@ fi
> +@@ -8684,8 +9178,6 @@ fi
>   lt_prog_compiler_pic=
>   lt_prog_compiler_static=
>   
> @@ -13260,7 +18511,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   
>     if test "$GCC" = yes; then
>       lt_prog_compiler_wl='-Wl,'
> -@@ -8857,6 +9349,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -8851,6 +9343,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>   	lt_prog_compiler_pic='--shared'
>   	lt_prog_compiler_static='--static'
>   	;;
> @@ -13273,7 +18524,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>         pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
>           # Portland Group compilers (*not* the Pentium gcc compiler,
>   	# which looks to be a dead project)
> -@@ -8919,7 +9417,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -8913,7 +9411,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>         lt_prog_compiler_pic='-KPIC'
>         lt_prog_compiler_static='-Bstatic'
>         case $cc_basename in
> @@ -13282,7 +18533,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   	lt_prog_compiler_wl='-Qoption ld ';;
>         *)
>   	lt_prog_compiler_wl='-Wl,';;
> -@@ -8976,13 +9474,17 @@ case $host_os in
> +@@ -8970,13 +9468,17 @@ case $host_os in
>       lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
>       ;;
>   esac
> @@ -13306,7 +18557,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   
>   #
>   # Check to make sure the PIC flag actually works.
> -@@ -9043,6 +9545,11 @@ fi
> +@@ -9037,6 +9539,11 @@ fi
>   
>   
>   
> @@ -13318,7 +18569,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   #
>   # Check to make sure the static flag actually works.
>   #
> -@@ -9393,7 +9900,8 @@ _LT_EOF
> +@@ -9387,7 +9894,8 @@ _LT_EOF
>         allow_undefined_flag=unsupported
>         always_export_symbols=no
>         enable_shared_with_static_runtimes=yes
> @@ -13328,7 +18579,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   
>         if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
>           archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
> -@@ -9492,12 +10000,12 @@ _LT_EOF
> +@@ -9486,12 +9994,12 @@ _LT_EOF
>   	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
>   	  hardcode_libdir_flag_spec=
>   	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
> @@ -13343,7 +18594,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   	  fi
>   	  ;;
>   	esac
> -@@ -9511,8 +10019,8 @@ _LT_EOF
> +@@ -9505,8 +10013,8 @@ _LT_EOF
>   	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
>   	wlarc=
>         else
> @@ -13354,7 +18605,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>         fi
>         ;;
>   
> -@@ -9530,8 +10038,8 @@ _LT_EOF
> +@@ -9524,8 +10032,8 @@ _LT_EOF
>   
>   _LT_EOF
>         elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -13365,7 +18616,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>         else
>   	ld_shlibs=no
>         fi
> -@@ -9577,8 +10085,8 @@ _LT_EOF
> +@@ -9571,8 +10079,8 @@ _LT_EOF
>   
>       *)
>         if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -13376,7 +18627,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>         else
>   	ld_shlibs=no
>         fi
> -@@ -9708,7 +10216,13 @@ _LT_EOF
> +@@ -9702,7 +10210,13 @@ _LT_EOF
>   	allow_undefined_flag='-berok'
>           # Determine the default libpath from the value encoded in an
>           # empty executable.
> @@ -13391,7 +18642,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   /* end confdefs.h.  */
>   
>   int
> -@@ -9721,22 +10235,29 @@ main ()
> +@@ -9715,22 +10229,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>   
> @@ -13434,7 +18685,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   
>           hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>           archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> -@@ -9748,7 +10269,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9742,7 +10263,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	else
>   	 # Determine the default libpath from the value encoded in an
>   	 # empty executable.
> @@ -13449,7 +18700,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   /* end confdefs.h.  */
>   
>   int
> -@@ -9761,22 +10288,29 @@ main ()
> +@@ -9755,22 +10282,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>   
> @@ -13492,7 +18743,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   
>   	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>   	  # Warning - without using the other run time loading flags,
> -@@ -9821,20 +10355,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9815,20 +10349,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>         # Microsoft Visual C++.
>         # hardcode_libdir_flag_spec is actually meaningless, as there is
>         # no search path for DLLs.
> @@ -13570,7 +18821,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>         ;;
>   
>       darwin* | rhapsody*)
> -@@ -9895,7 +10472,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9889,7 +10466,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
>       freebsd* | dragonfly*)
> @@ -13579,7 +18830,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>         hardcode_libdir_flag_spec='-R$libdir'
>         hardcode_direct=yes
>         hardcode_shlibpath_var=no
> -@@ -9903,7 +10480,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9897,7 +10474,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       hpux9*)
>         if test "$GCC" = yes; then
> @@ -13588,7 +18839,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>         else
>   	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
>         fi
> -@@ -9919,7 +10496,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9913,7 +10490,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       hpux10*)
>         if test "$GCC" = yes && test "$with_gnu_ld" = no; then
> @@ -13597,7 +18848,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>         else
>   	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
>         fi
> -@@ -9943,10 +10520,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9937,10 +10514,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
>   	  ;;
>   	ia64*)
> @@ -13610,7 +18861,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   	  ;;
>   	esac
>         else
> -@@ -10025,23 +10602,36 @@ fi
> +@@ -10019,23 +10596,36 @@ fi
>   
>       irix5* | irix6* | nonstopux*)
>         if test "$GCC" = yes; then
> @@ -13655,7 +18906,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>         else
>   	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
>   	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
> -@@ -10126,7 +10716,7 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -10120,7 +10710,7 @@ rm -f core conftest.err conftest.$ac_objext \
>       osf4* | osf5*)	# as osf3* with the addition of -msym flag
>         if test "$GCC" = yes; then
>   	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
> @@ -13664,7 +18915,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
>         else
>   	allow_undefined_flag=' -expect_unresolved \*'
> -@@ -10145,9 +10735,9 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -10139,9 +10729,9 @@ rm -f core conftest.err conftest.$ac_objext \
>         no_undefined_flag=' -z defs'
>         if test "$GCC" = yes; then
>   	wlarc='${wl}'
> @@ -13676,7 +18927,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>         else
>   	case `$CC -V 2>&1` in
>   	*"Compilers 5.0"*)
> -@@ -10723,8 +11313,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -10717,8 +11307,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>     need_version=no
>     need_lib_prefix=no
>   
> @@ -13688,7 +18939,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>       library_names_spec='$libname.dll.a'
>       # DLL is installed to $(libdir)/../bin by postinstall_cmds
>       postinstall_cmds='base_file=`basename \${file}`~
> -@@ -10757,13 +11348,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -10751,13 +11342,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>         library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>         ;;
>       esac
> @@ -13761,16 +19012,16 @@ index de10fef84a1..1b0ee0d32c6 100755
>     # FIXME: first we should search . and the directory the executable is in
>     shlibpath_var=PATH
>     ;;
> -@@ -11641,7 +12290,7 @@ else
> +@@ -11635,7 +12284,7 @@ else
>     lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>     lt_status=$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 11644 "configure"
> +-#line 11638 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>   
>   #if HAVE_DLFCN_H
> -@@ -11685,10 +12334,10 @@ else
> +@@ -11679,10 +12328,10 @@ else
>   /* When -fvisbility=hidden is used, assume the code has been annotated
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -13783,16 +19034,16 @@ index de10fef84a1..1b0ee0d32c6 100755
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -11747,7 +12396,7 @@ else
> +@@ -11741,7 +12390,7 @@ else
>     lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>     lt_status=$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 11750 "configure"
> +-#line 11744 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>   
>   #if HAVE_DLFCN_H
> -@@ -11791,10 +12440,10 @@ else
> +@@ -11785,10 +12434,10 @@ else
>   /* When -fvisbility=hidden is used, assume the code has been annotated
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -13805,7 +19056,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -14479,13 +15128,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
> +@@ -14473,13 +15122,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
>   lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>   lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>   lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -13826,7 +19077,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>   RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>   old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
> -@@ -14500,14 +15156,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
> +@@ -14494,14 +15150,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
>   lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
> @@ -13845,7 +19096,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>   NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>   LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -14540,12 +15199,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
> +@@ -14534,12 +15193,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
>   hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
>   inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
>   link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
> @@ -13859,7 +19110,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
>   variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
>   need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
> -@@ -14600,8 +15259,13 @@ reload_flag \
> +@@ -14594,8 +15253,13 @@ reload_flag \
>   OBJDUMP \
>   deplibs_check_method \
>   file_magic_cmd \
> @@ -13873,7 +19124,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   STRIP \
>   RANLIB \
>   CC \
> -@@ -14611,12 +15275,14 @@ lt_cv_sys_global_symbol_pipe \
> +@@ -14605,12 +15269,14 @@ lt_cv_sys_global_symbol_pipe \
>   lt_cv_sys_global_symbol_to_cdecl \
>   lt_cv_sys_global_symbol_to_c_name_address \
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -13889,7 +19140,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   DSYMUTIL \
>   NMEDIT \
>   LIPO \
> -@@ -14632,7 +15298,6 @@ no_undefined_flag \
> +@@ -14626,7 +15292,6 @@ no_undefined_flag \
>   hardcode_libdir_flag_spec \
>   hardcode_libdir_flag_spec_ld \
>   hardcode_libdir_separator \
> @@ -13897,7 +19148,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   exclude_expsyms \
>   include_expsyms \
>   file_list_spec \
> -@@ -14668,6 +15333,7 @@ module_cmds \
> +@@ -14662,6 +15327,7 @@ module_cmds \
>   module_expsym_cmds \
>   export_symbols_cmds \
>   prelink_cmds \
> @@ -13905,7 +19156,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   postinstall_cmds \
>   postuninstall_cmds \
>   finish_cmds \
> -@@ -15424,7 +16090,8 @@ $as_echo X"$file" |
> +@@ -15418,7 +16084,8 @@ $as_echo X"$file" |
>   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>   #
>   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -13915,7 +19166,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   #   Written by Gordon Matzigkeit, 1996
>   #
>   #   This file is part of GNU Libtool.
> -@@ -15527,19 +16194,42 @@ SP2NL=$lt_lt_SP2NL
> +@@ -15521,19 +16188,42 @@ SP2NL=$lt_lt_SP2NL
>   # turn newlines into spaces.
>   NL2SP=$lt_lt_NL2SP
>   
> @@ -13959,7 +19210,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   # A symbol stripping program.
>   STRIP=$lt_STRIP
>   
> -@@ -15569,6 +16259,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
> +@@ -15563,6 +16253,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
>   # Transform the output of nm in a C name address pair when lib prefix is needed.
>   global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
>   
> @@ -13972,7 +19223,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   # The name of the directory that contains temporary libtool files.
>   objdir=$objdir
>   
> -@@ -15578,6 +16274,9 @@ MAGIC_CMD=$MAGIC_CMD
> +@@ -15572,6 +16268,9 @@ MAGIC_CMD=$MAGIC_CMD
>   # Must we lock files when doing compilation?
>   need_locks=$lt_need_locks
>   
> @@ -13982,7 +19233,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>   DSYMUTIL=$lt_DSYMUTIL
>   
> -@@ -15692,12 +16391,12 @@ with_gcc=$GCC
> +@@ -15686,12 +16385,12 @@ with_gcc=$GCC
>   # Compiler flag to turn off builtin functions.
>   no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
>   
> @@ -13998,7 +19249,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   # Compiler flag to prevent dynamic linking.
>   link_static_flag=$lt_lt_prog_compiler_static
>   
> -@@ -15784,9 +16483,6 @@ inherit_rpath=$inherit_rpath
> +@@ -15778,9 +16477,6 @@ inherit_rpath=$inherit_rpath
>   # Whether libtool must link a program against all its dependency libraries.
>   link_all_deplibs=$link_all_deplibs
>   
> @@ -14008,7 +19259,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   # Set to "yes" if exported symbols are required.
>   always_export_symbols=$always_export_symbols
>   
> -@@ -15802,6 +16498,9 @@ include_expsyms=$lt_include_expsyms
> +@@ -15796,6 +16492,9 @@ include_expsyms=$lt_include_expsyms
>   # Commands necessary for linking programs (against libraries) with templates.
>   prelink_cmds=$lt_prelink_cmds
>   
> @@ -14018,7 +19269,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>   # Specify filename containing input files.
>   file_list_spec=$lt_file_list_spec
>   
> -@@ -15834,210 +16533,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
> +@@ -15828,210 +16527,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
>     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>     # text mode, it properly converts lines to CR/LF.  This bash problem
>     # is reportedly fixed, but why not run on old versions too?
> @@ -14393,7 +19644,7 @@ index de10fef84a1..1b0ee0d32c6 100755
>     chmod +x "$ofile"
>   
>  diff --git a/libtool.m4 b/libtool.m4
> -index a216bb14e99..e37c45ac0b1 100644
> +index ad63ebbb385..b65c22bf80d 100644
>  --- a/libtool.m4
>  +++ b/libtool.m4
>  @@ -1,7 +1,8 @@
> @@ -14825,7 +20076,7 @@ index a216bb14e99..e37c45ac0b1 100644
>   ])# _LT_CHECK_MAGIC_METHOD
>   
>   
> -@@ -3299,6 +3460,67 @@ dnl aclocal-1.4 backwards compatibility:
> +@@ -3305,6 +3466,67 @@ dnl aclocal-1.4 backwards compatibility:
>   dnl AC_DEFUN([AM_PROG_NM], [])
>   dnl AC_DEFUN([AC_PROG_NM], [])
>   
> @@ -14893,7 +20144,7 @@ index a216bb14e99..e37c45ac0b1 100644
>   
>   # LT_LIB_M
>   # --------
> -@@ -3425,8 +3647,8 @@ esac
> +@@ -3431,8 +3653,8 @@ esac
>   lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
>   
>   # Transform an extracted symbol line into symbol name and symbol address
> @@ -14904,7 +20155,7 @@ index a216bb14e99..e37c45ac0b1 100644
>   
>   # Handle CRLF in mingw tool chain
>   opt_cr=
> -@@ -3462,6 +3684,7 @@ for ac_symprfx in "" "_"; do
> +@@ -3468,6 +3690,7 @@ for ac_symprfx in "" "_"; do
>     else
>       lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[[	 ]]\($symcode$symcode*\)[[	 ]][[	 ]]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
>     fi
> @@ -14912,7 +20163,7 @@ index a216bb14e99..e37c45ac0b1 100644
>   
>     # Check to see that the pipe works correctly.
>     pipe_works=no
> -@@ -3495,6 +3718,18 @@ _LT_EOF
> +@@ -3501,6 +3724,18 @@ _LT_EOF
>         if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
>   	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
>   	  cat <<_LT_EOF > conftest.$ac_ext
> @@ -14931,7 +20182,7 @@ index a216bb14e99..e37c45ac0b1 100644
>   #ifdef __cplusplus
>   extern "C" {
>   #endif
> -@@ -3506,7 +3741,7 @@ _LT_EOF
> +@@ -3512,7 +3747,7 @@ _LT_EOF
>   	  cat <<_LT_EOF >> conftest.$ac_ext
>   
>   /* The mapping between symbol names and symbols.  */
> @@ -14940,7 +20191,7 @@ index a216bb14e99..e37c45ac0b1 100644
>     const char *name;
>     void       *address;
>   }
> -@@ -3532,15 +3767,15 @@ static const void *lt_preloaded_setup() {
> +@@ -3538,15 +3773,15 @@ static const void *lt_preloaded_setup() {
>   _LT_EOF
>   	  # Now try linking the two files.
>   	  mv conftest.$ac_objext conftstm.$ac_objext
> @@ -14960,7 +20211,7 @@ index a216bb14e99..e37c45ac0b1 100644
>   	else
>   	  echo "cannot find nm_test_func in $nlist" >&AS_MESSAGE_LOG_FD
>   	fi
> -@@ -3573,6 +3808,13 @@ else
> +@@ -3579,6 +3814,13 @@ else
>     AC_MSG_RESULT(ok)
>   fi
>   
> @@ -14974,7 +20225,7 @@ index a216bb14e99..e37c45ac0b1 100644
>   _LT_DECL([global_symbol_pipe], [lt_cv_sys_global_symbol_pipe], [1],
>       [Take the output of nm and produce a listing of raw symbols and C names])
>   _LT_DECL([global_symbol_to_cdecl], [lt_cv_sys_global_symbol_to_cdecl], [1],
> -@@ -3583,6 +3825,8 @@ _LT_DECL([global_symbol_to_c_name_address],
> +@@ -3589,6 +3831,8 @@ _LT_DECL([global_symbol_to_c_name_address],
>   _LT_DECL([global_symbol_to_c_name_address_lib_prefix],
>       [lt_cv_sys_global_symbol_to_c_name_address_lib_prefix], [1],
>       [Transform the output of nm in a C name address pair when lib prefix is needed])
> @@ -14983,7 +20234,7 @@ index a216bb14e99..e37c45ac0b1 100644
>   ]) # _LT_CMD_GLOBAL_SYMBOLS
>   
>   
> -@@ -3594,7 +3838,6 @@ _LT_TAGVAR(lt_prog_compiler_wl, $1)=
> +@@ -3600,7 +3844,6 @@ _LT_TAGVAR(lt_prog_compiler_wl, $1)=
>   _LT_TAGVAR(lt_prog_compiler_pic, $1)=
>   _LT_TAGVAR(lt_prog_compiler_static, $1)=
>   
> @@ -14991,7 +20242,7 @@ index a216bb14e99..e37c45ac0b1 100644
>   m4_if([$1], [CXX], [
>     # C++ specific cases for pic, static, wl, etc.
>     if test "$GXX" = yes; then
> -@@ -3700,6 +3943,12 @@ m4_if([$1], [CXX], [
> +@@ -3706,6 +3949,12 @@ m4_if([$1], [CXX], [
>   	  ;;
>   	esac
>   	;;
> @@ -15004,7 +20255,7 @@ index a216bb14e99..e37c45ac0b1 100644
>         dgux*)
>   	case $cc_basename in
>   	  ec++*)
> -@@ -3852,7 +4101,7 @@ m4_if([$1], [CXX], [
> +@@ -3858,7 +4107,7 @@ m4_if([$1], [CXX], [
>   	;;
>         solaris*)
>   	case $cc_basename in
> @@ -15013,7 +20264,7 @@ index a216bb14e99..e37c45ac0b1 100644
>   	    # Sun C++ 4.2, 5.x and Centerline C++
>   	    _LT_TAGVAR(lt_prog_compiler_pic, $1)='-KPIC'
>   	    _LT_TAGVAR(lt_prog_compiler_static, $1)='-Bstatic'
> -@@ -4075,6 +4324,12 @@ m4_if([$1], [CXX], [
> +@@ -4081,6 +4330,12 @@ m4_if([$1], [CXX], [
>   	_LT_TAGVAR(lt_prog_compiler_pic, $1)='--shared'
>   	_LT_TAGVAR(lt_prog_compiler_static, $1)='--static'
>   	;;
> @@ -15026,7 +20277,7 @@ index a216bb14e99..e37c45ac0b1 100644
>         pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
>           # Portland Group compilers (*not* the Pentium gcc compiler,
>   	# which looks to be a dead project)
> -@@ -4137,7 +4392,7 @@ m4_if([$1], [CXX], [
> +@@ -4143,7 +4398,7 @@ m4_if([$1], [CXX], [
>         _LT_TAGVAR(lt_prog_compiler_pic, $1)='-KPIC'
>         _LT_TAGVAR(lt_prog_compiler_static, $1)='-Bstatic'
>         case $cc_basename in
> @@ -15035,7 +20286,7 @@ index a216bb14e99..e37c45ac0b1 100644
>   	_LT_TAGVAR(lt_prog_compiler_wl, $1)='-Qoption ld ';;
>         *)
>   	_LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,';;
> -@@ -4194,9 +4449,11 @@ case $host_os in
> +@@ -4200,9 +4455,11 @@ case $host_os in
>       _LT_TAGVAR(lt_prog_compiler_pic, $1)="$_LT_TAGVAR(lt_prog_compiler_pic, $1)@&t@m4_if([$1],[],[ -DPIC],[m4_if([$1],[CXX],[ -DPIC],[])])"
>       ;;
>   esac
> @@ -15050,7 +20301,7 @@ index a216bb14e99..e37c45ac0b1 100644
>   
>   #
>   # Check to make sure the PIC flag actually works.
> -@@ -4215,6 +4472,8 @@ fi
> +@@ -4221,6 +4478,8 @@ fi
>   _LT_TAGDECL([pic_flag], [lt_prog_compiler_pic], [1],
>   	[Additional compiler flags for building library objects])
>   
> @@ -15059,7 +20310,7 @@ index a216bb14e99..e37c45ac0b1 100644
>   #
>   # Check to make sure the static flag actually works.
>   #
> -@@ -4235,6 +4494,7 @@ _LT_TAGDECL([link_static_flag], [lt_prog_compiler_static], [1],
> +@@ -4241,6 +4500,7 @@ _LT_TAGDECL([link_static_flag], [lt_prog_compiler_static], [1],
>   m4_defun([_LT_LINKER_SHLIBS],
>   [AC_REQUIRE([LT_PATH_LD])dnl
>   AC_REQUIRE([LT_PATH_NM])dnl
> @@ -15067,7 +20318,7 @@ index a216bb14e99..e37c45ac0b1 100644
>   m4_require([_LT_FILEUTILS_DEFAULTS])dnl
>   m4_require([_LT_DECL_EGREP])dnl
>   m4_require([_LT_DECL_SED])dnl
> -@@ -4243,6 +4503,7 @@ m4_require([_LT_TAG_COMPILER])dnl
> +@@ -4249,6 +4509,7 @@ m4_require([_LT_TAG_COMPILER])dnl
>   AC_MSG_CHECKING([whether the $compiler linker ($LD) supports shared libraries])
>   m4_if([$1], [CXX], [
>     _LT_TAGVAR(export_symbols_cmds, $1)='$NM $libobjs $convenience | $global_symbol_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
> @@ -15075,7 +20326,7 @@ index a216bb14e99..e37c45ac0b1 100644
>     case $host_os in
>     aix[[4-9]]*)
>       # If we're using GNU nm, then we don't want the "-C" option.
> -@@ -4257,15 +4518,20 @@ m4_if([$1], [CXX], [
> +@@ -4263,15 +4524,20 @@ m4_if([$1], [CXX], [
>       ;;
>     pw32*)
>       _LT_TAGVAR(export_symbols_cmds, $1)="$ltdll_cmds"
> @@ -15101,7 +20352,7 @@ index a216bb14e99..e37c45ac0b1 100644
>   ], [
>     runpath_var=
>     _LT_TAGVAR(allow_undefined_flag, $1)=
> -@@ -4433,7 +4699,8 @@ _LT_EOF
> +@@ -4439,7 +4705,8 @@ _LT_EOF
>         _LT_TAGVAR(allow_undefined_flag, $1)=unsupported
>         _LT_TAGVAR(always_export_symbols, $1)=no
>         _LT_TAGVAR(enable_shared_with_static_runtimes, $1)=yes
> @@ -15111,7 +20362,7 @@ index a216bb14e99..e37c45ac0b1 100644
>   
>         if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
>           _LT_TAGVAR(archive_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
> -@@ -4532,12 +4799,12 @@ _LT_EOF
> +@@ -4538,12 +4805,12 @@ _LT_EOF
>   	  _LT_TAGVAR(whole_archive_flag_spec, $1)='--whole-archive$convenience --no-whole-archive'
>   	  _LT_TAGVAR(hardcode_libdir_flag_spec, $1)=
>   	  _LT_TAGVAR(hardcode_libdir_flag_spec_ld, $1)='-rpath $libdir'
> @@ -15126,7 +20377,7 @@ index a216bb14e99..e37c45ac0b1 100644
>   	  fi
>   	  ;;
>   	esac
> -@@ -4551,8 +4818,8 @@ _LT_EOF
> +@@ -4557,8 +4824,8 @@ _LT_EOF
>   	_LT_TAGVAR(archive_cmds, $1)='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
>   	wlarc=
>         else
> @@ -15137,7 +20388,7 @@ index a216bb14e99..e37c45ac0b1 100644
>         fi
>         ;;
>   
> -@@ -4570,8 +4837,8 @@ _LT_EOF
> +@@ -4576,8 +4843,8 @@ _LT_EOF
>   
>   _LT_EOF
>         elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -15148,7 +20399,7 @@ index a216bb14e99..e37c45ac0b1 100644
>         else
>   	_LT_TAGVAR(ld_shlibs, $1)=no
>         fi
> -@@ -4617,8 +4884,8 @@ _LT_EOF
> +@@ -4623,8 +4890,8 @@ _LT_EOF
>   
>       *)
>         if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -15159,7 +20410,7 @@ index a216bb14e99..e37c45ac0b1 100644
>         else
>   	_LT_TAGVAR(ld_shlibs, $1)=no
>         fi
> -@@ -4748,7 +5015,7 @@ _LT_EOF
> +@@ -4754,7 +5021,7 @@ _LT_EOF
>   	_LT_TAGVAR(allow_undefined_flag, $1)='-berok'
>           # Determine the default libpath from the value encoded in an
>           # empty executable.
> @@ -15168,7 +20419,7 @@ index a216bb14e99..e37c45ac0b1 100644
>           _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
>           _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
>         else
> -@@ -4759,7 +5026,7 @@ _LT_EOF
> +@@ -4765,7 +5032,7 @@ _LT_EOF
>   	else
>   	 # Determine the default libpath from the value encoded in an
>   	 # empty executable.
> @@ -15177,7 +20428,7 @@ index a216bb14e99..e37c45ac0b1 100644
>   	 _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
>   	  # Warning - without using the other run time loading flags,
>   	  # -berok will link without error, but may produce a broken library.
> -@@ -4803,20 +5070,63 @@ _LT_EOF
> +@@ -4809,20 +5076,63 @@ _LT_EOF
>         # Microsoft Visual C++.
>         # hardcode_libdir_flag_spec is actually meaningless, as there is
>         # no search path for DLLs.
> @@ -15255,7 +20506,7 @@ index a216bb14e99..e37c45ac0b1 100644
>         ;;
>   
>       darwin* | rhapsody*)
> -@@ -4850,7 +5160,7 @@ _LT_EOF
> +@@ -4856,7 +5166,7 @@ _LT_EOF
>   
>       # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
>       freebsd* | dragonfly*)
> @@ -15264,7 +20515,7 @@ index a216bb14e99..e37c45ac0b1 100644
>         _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-R$libdir'
>         _LT_TAGVAR(hardcode_direct, $1)=yes
>         _LT_TAGVAR(hardcode_shlibpath_var, $1)=no
> -@@ -4858,7 +5168,7 @@ _LT_EOF
> +@@ -4864,7 +5174,7 @@ _LT_EOF
>   
>       hpux9*)
>         if test "$GCC" = yes; then
> @@ -15273,7 +20524,7 @@ index a216bb14e99..e37c45ac0b1 100644
>         else
>   	_LT_TAGVAR(archive_cmds, $1)='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
>         fi
> -@@ -4874,7 +5184,7 @@ _LT_EOF
> +@@ -4880,7 +5190,7 @@ _LT_EOF
>   
>       hpux10*)
>         if test "$GCC" = yes && test "$with_gnu_ld" = no; then
> @@ -15282,7 +20533,7 @@ index a216bb14e99..e37c45ac0b1 100644
>         else
>   	_LT_TAGVAR(archive_cmds, $1)='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
>         fi
> -@@ -4898,10 +5208,10 @@ _LT_EOF
> +@@ -4904,10 +5214,10 @@ _LT_EOF
>   	  _LT_TAGVAR(archive_cmds, $1)='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
>   	  ;;
>   	ia64*)
> @@ -15295,7 +20546,7 @@ index a216bb14e99..e37c45ac0b1 100644
>   	  ;;
>   	esac
>         else
> -@@ -4948,16 +5258,31 @@ _LT_EOF
> +@@ -4954,16 +5264,31 @@ _LT_EOF
>   
>       irix5* | irix6* | nonstopux*)
>         if test "$GCC" = yes; then
> @@ -15334,7 +20585,7 @@ index a216bb14e99..e37c45ac0b1 100644
>         else
>   	_LT_TAGVAR(archive_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
>   	_LT_TAGVAR(archive_expsym_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
> -@@ -5042,7 +5367,7 @@ _LT_EOF
> +@@ -5048,7 +5373,7 @@ _LT_EOF
>       osf4* | osf5*)	# as osf3* with the addition of -msym flag
>         if test "$GCC" = yes; then
>   	_LT_TAGVAR(allow_undefined_flag, $1)=' ${wl}-expect_unresolved ${wl}\*'
> @@ -15343,7 +20594,7 @@ index a216bb14e99..e37c45ac0b1 100644
>   	_LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-rpath ${wl}$libdir'
>         else
>   	_LT_TAGVAR(allow_undefined_flag, $1)=' -expect_unresolved \*'
> -@@ -5061,9 +5386,9 @@ _LT_EOF
> +@@ -5067,9 +5392,9 @@ _LT_EOF
>         _LT_TAGVAR(no_undefined_flag, $1)=' -z defs'
>         if test "$GCC" = yes; then
>   	wlarc='${wl}'
> @@ -15355,7 +20606,7 @@ index a216bb14e99..e37c45ac0b1 100644
>         else
>   	case `$CC -V 2>&1` in
>   	*"Compilers 5.0"*)
> -@@ -5335,8 +5660,6 @@ _LT_TAGDECL([], [inherit_rpath], [0],
> +@@ -5341,8 +5666,6 @@ _LT_TAGDECL([], [inherit_rpath], [0],
>       to runtime path list])
>   _LT_TAGDECL([], [link_all_deplibs], [0],
>       [Whether libtool must link a program against all its dependency libraries])
> @@ -15364,7 +20615,7 @@ index a216bb14e99..e37c45ac0b1 100644
>   _LT_TAGDECL([], [always_export_symbols], [0],
>       [Set to "yes" if exported symbols are required])
>   _LT_TAGDECL([], [export_symbols_cmds], [2],
> -@@ -5347,6 +5670,8 @@ _LT_TAGDECL([], [include_expsyms], [1],
> +@@ -5353,6 +5676,8 @@ _LT_TAGDECL([], [include_expsyms], [1],
>       [Symbols that must always be exported])
>   _LT_TAGDECL([], [prelink_cmds], [2],
>       [Commands necessary for linking programs (against libraries) with templates])
> @@ -15373,7 +20624,7 @@ index a216bb14e99..e37c45ac0b1 100644
>   _LT_TAGDECL([], [file_list_spec], [1],
>       [Specify filename containing input files])
>   dnl FIXME: Not yet implemented
> -@@ -5448,6 +5773,7 @@ CC="$lt_save_CC"
> +@@ -5454,6 +5779,7 @@ CC="$lt_save_CC"
>   m4_defun([_LT_LANG_CXX_CONFIG],
>   [m4_require([_LT_FILEUTILS_DEFAULTS])dnl
>   m4_require([_LT_DECL_EGREP])dnl
> @@ -15381,7 +20632,7 @@ index a216bb14e99..e37c45ac0b1 100644
>   if test -n "$CXX" && ( test "X$CXX" != "Xno" &&
>       ( (test "X$CXX" = "Xg++" && `g++ -v >/dev/null 2>&1` ) ||
>       (test "X$CXX" != "Xg++"))) ; then
> -@@ -5509,6 +5835,7 @@ if test "$_lt_caught_CXX_error" != yes; then
> +@@ -5515,6 +5841,7 @@ if test "$_lt_caught_CXX_error" != yes; then
>   
>     # Allow CC to be a program name with arguments.
>     lt_save_CC=$CC
> @@ -15389,7 +20640,7 @@ index a216bb14e99..e37c45ac0b1 100644
>     lt_save_LD=$LD
>     lt_save_GCC=$GCC
>     GCC=$GXX
> -@@ -5526,6 +5853,7 @@ if test "$_lt_caught_CXX_error" != yes; then
> +@@ -5532,6 +5859,7 @@ if test "$_lt_caught_CXX_error" != yes; then
>     fi
>     test -z "${LDCXX+set}" || LD=$LDCXX
>     CC=${CXX-"c++"}
> @@ -15397,7 +20648,7 @@ index a216bb14e99..e37c45ac0b1 100644
>     compiler=$CC
>     _LT_TAGVAR(compiler, $1)=$CC
>     _LT_CC_BASENAME([$compiler])
> -@@ -5689,7 +6017,7 @@ if test "$_lt_caught_CXX_error" != yes; then
> +@@ -5695,7 +6023,7 @@ if test "$_lt_caught_CXX_error" != yes; then
>             _LT_TAGVAR(allow_undefined_flag, $1)='-berok'
>             # Determine the default libpath from the value encoded in an empty
>             # executable.
> @@ -15406,7 +20657,7 @@ index a216bb14e99..e37c45ac0b1 100644
>             _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
>   
>             _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> -@@ -5701,7 +6029,7 @@ if test "$_lt_caught_CXX_error" != yes; then
> +@@ -5707,7 +6035,7 @@ if test "$_lt_caught_CXX_error" != yes; then
>             else
>   	    # Determine the default libpath from the value encoded in an
>   	    # empty executable.
> @@ -15415,7 +20666,7 @@ index a216bb14e99..e37c45ac0b1 100644
>   	    _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
>   	    # Warning - without using the other run time loading flags,
>   	    # -berok will link without error, but may produce a broken library.
> -@@ -5743,29 +6071,75 @@ if test "$_lt_caught_CXX_error" != yes; then
> +@@ -5749,29 +6077,75 @@ if test "$_lt_caught_CXX_error" != yes; then
>           ;;
>   
>         cygwin* | mingw* | pw32* | cegcc*)
> @@ -15514,7 +20765,7 @@ index a216bb14e99..e37c45ac0b1 100644
>         darwin* | rhapsody*)
>           _LT_DARWIN_LINKER_FEATURES($1)
>   	;;
> -@@ -5840,7 +6214,7 @@ if test "$_lt_caught_CXX_error" != yes; then
> +@@ -5846,7 +6220,7 @@ if test "$_lt_caught_CXX_error" != yes; then
>               ;;
>             *)
>               if test "$GXX" = yes; then
> @@ -15523,7 +20774,7 @@ index a216bb14e99..e37c45ac0b1 100644
>               else
>                 # FIXME: insert proper C++ library support
>                 _LT_TAGVAR(ld_shlibs, $1)=no
> -@@ -5911,10 +6285,10 @@ if test "$_lt_caught_CXX_error" != yes; then
> +@@ -5917,10 +6291,10 @@ if test "$_lt_caught_CXX_error" != yes; then
>   	            _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
>   	            ;;
>   	          ia64*)
> @@ -15536,7 +20787,7 @@ index a216bb14e99..e37c45ac0b1 100644
>   	            ;;
>   	        esac
>   	      fi
> -@@ -5955,9 +6329,9 @@ if test "$_lt_caught_CXX_error" != yes; then
> +@@ -5961,9 +6335,9 @@ if test "$_lt_caught_CXX_error" != yes; then
>             *)
>   	    if test "$GXX" = yes; then
>   	      if test "$with_gnu_ld" = no; then
> @@ -15548,7 +20799,7 @@ index a216bb14e99..e37c45ac0b1 100644
>   	      fi
>   	    fi
>   	    _LT_TAGVAR(link_all_deplibs, $1)=yes
> -@@ -6027,20 +6401,20 @@ if test "$_lt_caught_CXX_error" != yes; then
> +@@ -6033,20 +6407,20 @@ if test "$_lt_caught_CXX_error" != yes; then
>   	      _LT_TAGVAR(prelink_cmds, $1)='tpldir=Template.dir~
>   		rm -rf $tpldir~
>   		$CC --prelink_objects --instantiation_dir $tpldir $objs $libobjs $compile_deplibs~
> @@ -15573,7 +20824,7 @@ index a216bb14e99..e37c45ac0b1 100644
>   	      ;;
>   	    *) # Version 6 and above use weak symbols
>   	      _LT_TAGVAR(archive_cmds, $1)='$CC -shared $pic_flag $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
> -@@ -6235,7 +6609,7 @@ if test "$_lt_caught_CXX_error" != yes; then
> +@@ -6241,7 +6615,7 @@ if test "$_lt_caught_CXX_error" != yes; then
>   	          _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
>   		  ;;
>   	        *)
> @@ -15582,7 +20833,7 @@ index a216bb14e99..e37c45ac0b1 100644
>   		  ;;
>   	      esac
>   
> -@@ -6281,7 +6655,7 @@ if test "$_lt_caught_CXX_error" != yes; then
> +@@ -6287,7 +6661,7 @@ if test "$_lt_caught_CXX_error" != yes; then
>   
>         solaris*)
>           case $cc_basename in
> @@ -15591,7 +20842,7 @@ index a216bb14e99..e37c45ac0b1 100644
>   	    # Sun C++ 4.2, 5.x and Centerline C++
>               _LT_TAGVAR(archive_cmds_need_lc,$1)=yes
>   	    _LT_TAGVAR(no_undefined_flag, $1)=' -zdefs'
> -@@ -6322,9 +6696,9 @@ if test "$_lt_caught_CXX_error" != yes; then
> +@@ -6328,9 +6702,9 @@ if test "$_lt_caught_CXX_error" != yes; then
>   	    if test "$GXX" = yes && test "$with_gnu_ld" = no; then
>   	      _LT_TAGVAR(no_undefined_flag, $1)=' ${wl}-z ${wl}defs'
>   	      if $CC --version | $GREP -v '^2\.7' > /dev/null; then
> @@ -15603,7 +20854,7 @@ index a216bb14e99..e37c45ac0b1 100644
>   
>   	        # Commands to make compiler produce verbose output that lists
>   	        # what "hidden" libraries, object files and flags are used when
> -@@ -6453,6 +6827,7 @@ if test "$_lt_caught_CXX_error" != yes; then
> +@@ -6459,6 +6833,7 @@ if test "$_lt_caught_CXX_error" != yes; then
>     fi # test -n "$compiler"
>   
>     CC=$lt_save_CC
> @@ -15611,7 +20862,7 @@ index a216bb14e99..e37c45ac0b1 100644
>     LDCXX=$LD
>     LD=$lt_save_LD
>     GCC=$lt_save_GCC
> -@@ -6467,6 +6842,29 @@ AC_LANG_POP
> +@@ -6473,6 +6848,29 @@ AC_LANG_POP
>   ])# _LT_LANG_CXX_CONFIG
>   
>   
> @@ -15641,7 +20892,7 @@ index a216bb14e99..e37c45ac0b1 100644
>   # _LT_SYS_HIDDEN_LIBDEPS([TAGNAME])
>   # ---------------------------------
>   # Figure out "hidden" library dependencies from verbose
> -@@ -6475,6 +6873,7 @@ AC_LANG_POP
> +@@ -6481,6 +6879,7 @@ AC_LANG_POP
>   # objects, libraries and library flags.
>   m4_defun([_LT_SYS_HIDDEN_LIBDEPS],
>   [m4_require([_LT_FILEUTILS_DEFAULTS])dnl
> @@ -15649,7 +20900,7 @@ index a216bb14e99..e37c45ac0b1 100644
>   # Dependencies to place before and after the object being linked:
>   _LT_TAGVAR(predep_objects, $1)=
>   _LT_TAGVAR(postdep_objects, $1)=
> -@@ -6525,6 +6924,13 @@ public class foo {
> +@@ -6531,6 +6930,13 @@ public class foo {
>   };
>   _LT_EOF
>   ])
> @@ -15663,7 +20914,7 @@ index a216bb14e99..e37c45ac0b1 100644
>   dnl Parse the compiler output and extract the necessary
>   dnl objects, libraries and library flags.
>   if AC_TRY_EVAL(ac_compile); then
> -@@ -6536,7 +6942,7 @@ if AC_TRY_EVAL(ac_compile); then
> +@@ -6542,7 +6948,7 @@ if AC_TRY_EVAL(ac_compile); then
>     pre_test_object_deps_done=no
>   
>     for p in `eval "$output_verbose_link_cmd"`; do
> @@ -15672,7 +20923,7 @@ index a216bb14e99..e37c45ac0b1 100644
>   
>       -L* | -R* | -l*)
>          # Some compilers place space between "-{L,R}" and the path.
> -@@ -6545,13 +6951,22 @@ if AC_TRY_EVAL(ac_compile); then
> +@@ -6551,13 +6957,22 @@ if AC_TRY_EVAL(ac_compile); then
>             test $p = "-R"; then
>   	 prev=$p
>   	 continue
> @@ -15699,7 +20950,7 @@ index a216bb14e99..e37c45ac0b1 100644
>   	   # Internal compiler library paths should come after those
>   	   # provided the user.  The postdeps already come after the
>   	   # user supplied libs so there is no need to process them.
> -@@ -6571,8 +6986,10 @@ if AC_TRY_EVAL(ac_compile); then
> +@@ -6577,8 +6992,10 @@ if AC_TRY_EVAL(ac_compile); then
>   	   _LT_TAGVAR(postdeps, $1)="${_LT_TAGVAR(postdeps, $1)} ${prev}${p}"
>   	 fi
>          fi
> @@ -15710,7 +20961,7 @@ index a216bb14e99..e37c45ac0b1 100644
>       *.$objext)
>          # This assumes that the test object file only shows up
>          # once in the compiler output.
> -@@ -6608,6 +7025,7 @@ else
> +@@ -6614,6 +7031,7 @@ else
>   fi
>   
>   $RM -f confest.$objext
> @@ -15718,7 +20969,7 @@ index a216bb14e99..e37c45ac0b1 100644
>   
>   # PORTME: override above test on systems where it is broken
>   m4_if([$1], [CXX],
> -@@ -6644,7 +7062,7 @@ linux*)
> +@@ -6650,7 +7068,7 @@ linux*)
>   
>   solaris*)
>     case $cc_basename in
> @@ -15727,7 +20978,7 @@ index a216bb14e99..e37c45ac0b1 100644
>       # The more standards-conforming stlport4 library is
>       # incompatible with the Cstd library. Avoid specifying
>       # it if it's in CXXFLAGS. Ignore libCrun as
> -@@ -6757,7 +7175,9 @@ if test "$_lt_disable_F77" != yes; then
> +@@ -6763,7 +7181,9 @@ if test "$_lt_disable_F77" != yes; then
>     # Allow CC to be a program name with arguments.
>     lt_save_CC="$CC"
>     lt_save_GCC=$GCC
> @@ -15737,7 +20988,7 @@ index a216bb14e99..e37c45ac0b1 100644
>     compiler=$CC
>     _LT_TAGVAR(compiler, $1)=$CC
>     _LT_CC_BASENAME([$compiler])
> -@@ -6811,6 +7231,7 @@ if test "$_lt_disable_F77" != yes; then
> +@@ -6817,6 +7237,7 @@ if test "$_lt_disable_F77" != yes; then
>   
>     GCC=$lt_save_GCC
>     CC="$lt_save_CC"
> @@ -15745,7 +20996,7 @@ index a216bb14e99..e37c45ac0b1 100644
>   fi # test "$_lt_disable_F77" != yes
>   
>   AC_LANG_POP
> -@@ -6887,7 +7308,9 @@ if test "$_lt_disable_FC" != yes; then
> +@@ -6893,7 +7314,9 @@ if test "$_lt_disable_FC" != yes; then
>     # Allow CC to be a program name with arguments.
>     lt_save_CC="$CC"
>     lt_save_GCC=$GCC
> @@ -15755,7 +21006,7 @@ index a216bb14e99..e37c45ac0b1 100644
>     compiler=$CC
>     GCC=$ac_cv_fc_compiler_gnu
>   
> -@@ -6943,7 +7366,8 @@ if test "$_lt_disable_FC" != yes; then
> +@@ -6949,7 +7372,8 @@ if test "$_lt_disable_FC" != yes; then
>     fi # test -n "$compiler"
>   
>     GCC=$lt_save_GCC
> @@ -15765,7 +21016,7 @@ index a216bb14e99..e37c45ac0b1 100644
>   fi # test "$_lt_disable_FC" != yes
>   
>   AC_LANG_POP
> -@@ -6980,10 +7404,12 @@ _LT_COMPILER_BOILERPLATE
> +@@ -6986,10 +7410,12 @@ _LT_COMPILER_BOILERPLATE
>   _LT_LINKER_BOILERPLATE
>   
>   # Allow CC to be a program name with arguments.
> @@ -15779,7 +21030,7 @@ index a216bb14e99..e37c45ac0b1 100644
>   compiler=$CC
>   _LT_TAGVAR(compiler, $1)=$CC
>   _LT_TAGVAR(LD, $1)="$LD"
> -@@ -7014,7 +7440,8 @@ fi
> +@@ -7020,7 +7446,8 @@ fi
>   AC_LANG_RESTORE
>   
>   GCC=$lt_save_GCC
> @@ -15789,7 +21040,7 @@ index a216bb14e99..e37c45ac0b1 100644
>   ])# _LT_LANG_GCJ_CONFIG
>   
>   
> -@@ -7049,9 +7476,11 @@ _LT_LINKER_BOILERPLATE
> +@@ -7055,9 +7482,11 @@ _LT_LINKER_BOILERPLATE
>   
>   # Allow CC to be a program name with arguments.
>   lt_save_CC="$CC"
> @@ -15801,7 +21052,7 @@ index a216bb14e99..e37c45ac0b1 100644
>   compiler=$CC
>   _LT_TAGVAR(compiler, $1)=$CC
>   _LT_CC_BASENAME([$compiler])
> -@@ -7064,7 +7493,8 @@ fi
> +@@ -7070,7 +7499,8 @@ fi
>   
>   GCC=$lt_save_GCC
>   AC_LANG_RESTORE
> @@ -15811,7 +21062,7 @@ index a216bb14e99..e37c45ac0b1 100644
>   ])# _LT_LANG_RC_CONFIG
>   
>   
> -@@ -7123,6 +7553,15 @@ _LT_DECL([], [OBJDUMP], [1], [An object symbol dumper])
> +@@ -7129,6 +7559,15 @@ _LT_DECL([], [OBJDUMP], [1], [An object symbol dumper])
>   AC_SUBST([OBJDUMP])
>   ])
>   
> @@ -15827,7 +21078,7 @@ index a216bb14e99..e37c45ac0b1 100644
>   
>   # _LT_DECL_SED
>   # ------------
> -@@ -7216,8 +7655,8 @@ m4_defun([_LT_CHECK_SHELL_FEATURES],
> +@@ -7222,8 +7661,8 @@ m4_defun([_LT_CHECK_SHELL_FEATURES],
>   # Try some XSI features
>   xsi_shell=no
>   ( _lt_dummy="a/b/c"
> @@ -15838,7 +21089,7 @@ index a216bb14e99..e37c45ac0b1 100644
>       && eval 'test $(( 1 + 1 )) -eq 2 \
>       && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
>     && xsi_shell=yes
> -@@ -7256,206 +7695,162 @@ _LT_DECL([NL2SP], [lt_NL2SP], [1], [turn newlines into spaces])dnl
> +@@ -7262,206 +7701,162 @@ _LT_DECL([NL2SP], [lt_NL2SP], [1], [turn newlines into spaces])dnl
>   ])# _LT_CHECK_SHELL_FEATURES
>   
>   
> @@ -21471,8 +26722,36 @@ index bf92b5e0790..c573da90c5c 100644
>   
>   # These exist entirely to fool aclocal when bootstrapping libtool.
>   #
> +diff --git a/opcodes/Makefile.in b/opcodes/Makefile.in
> +index 2257b0872af..73aae3b210f 100644
> +--- a/opcodes/Makefile.in
> ++++ b/opcodes/Makefile.in
> +@@ -292,6 +292,7 @@ CYGPATH_W = @CYGPATH_W@
> + DATADIRNAME = @DATADIRNAME@
> + DEFS = @DEFS@
> + DEPDIR = @DEPDIR@
> ++DLLTOOL = @DLLTOOL@
> + DSYMUTIL = @DSYMUTIL@
> + DUMPBIN = @DUMPBIN@
> + ECHO_C = @ECHO_C@
> +@@ -325,6 +326,7 @@ LN_S = @LN_S@
> + LTLIBOBJS = @LTLIBOBJS@
> + MAINT = @MAINT@
> + MAKEINFO = @MAKEINFO@
> ++MANIFEST_TOOL = @MANIFEST_TOOL@
> + MKDIR_P = @MKDIR_P@
> + MKINSTALLDIRS = @MKINSTALLDIRS@
> + MSGFMT = @MSGFMT@
> +@@ -363,6 +365,7 @@ abs_builddir = @abs_builddir@
> + abs_srcdir = @abs_srcdir@
> + abs_top_builddir = @abs_top_builddir@
> + abs_top_srcdir = @abs_top_srcdir@
> ++ac_ct_AR = @ac_ct_AR@
> + ac_ct_CC = @ac_ct_CC@
> + ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
> + am__include = @am__include@
>  diff --git a/opcodes/configure b/opcodes/configure
> -index 6690a502b2f..badcc0776df 100755
> +index db023b48c28..c562aada2a4 100755
>  --- a/opcodes/configure
>  +++ b/opcodes/configure
>  @@ -682,6 +682,9 @@ OTOOL
> @@ -21522,7 +26801,7 @@ index 6690a502b2f..badcc0776df 100755
>      test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
>     ECHO='print -r --'
>   elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
> -@@ -5705,8 +5711,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
> +@@ -5711,8 +5717,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
>   # Try some XSI features
>   xsi_shell=no
>   ( _lt_dummy="a/b/c"
> @@ -21533,7 +26812,7 @@ index 6690a502b2f..badcc0776df 100755
>       && eval 'test $(( 1 + 1 )) -eq 2 \
>       && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
>     && xsi_shell=yes
> -@@ -5755,6 +5761,80 @@ esac
> +@@ -5761,6 +5767,80 @@ esac
>   
>   
>   
> @@ -21614,7 +26893,7 @@ index 6690a502b2f..badcc0776df 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
>   $as_echo_n "checking for $LD option to reload object files... " >&6; }
>   if ${lt_cv_ld_reload_flag+:} false; then :
> -@@ -5771,6 +5851,11 @@ case $reload_flag in
> +@@ -5777,6 +5857,11 @@ case $reload_flag in
>   esac
>   reload_cmds='$LD$reload_flag -o $output$reload_objs'
>   case $host_os in
> @@ -21626,7 +26905,7 @@ index 6690a502b2f..badcc0776df 100755
>     darwin*)
>       if test "$GCC" = yes; then
>         reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
> -@@ -5939,7 +6024,8 @@ mingw* | pw32*)
> +@@ -5945,7 +6030,8 @@ mingw* | pw32*)
>       lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
>       lt_cv_file_magic_cmd='func_win32_libid'
>     else
> @@ -21636,7 +26915,7 @@ index 6690a502b2f..badcc0776df 100755
>       lt_cv_file_magic_cmd='$OBJDUMP -f'
>     fi
>     ;;
> -@@ -6093,6 +6179,21 @@ esac
> +@@ -6099,6 +6185,21 @@ esac
>   fi
>   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
>   $as_echo "$lt_cv_deplibs_check_method" >&6; }
> @@ -21658,7 +26937,7 @@ index 6690a502b2f..badcc0776df 100755
>   file_magic_cmd=$lt_cv_file_magic_cmd
>   deplibs_check_method=$lt_cv_deplibs_check_method
>   test -z "$deplibs_check_method" && deplibs_check_method=unknown
> -@@ -6108,6 +6209,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
> +@@ -6114,6 +6215,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
>   
>   
>   
> @@ -21816,7 +27095,7 @@ index 6690a502b2f..badcc0776df 100755
>   plugin_option=
>   plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
>   for plugin in $plugin_names; do
> -@@ -6122,8 +6374,10 @@ for plugin in $plugin_names; do
> +@@ -6128,8 +6380,10 @@ for plugin in $plugin_names; do
>   done
>   
>   if test -n "$ac_tool_prefix"; then
> @@ -21829,7 +27108,7 @@ index 6690a502b2f..badcc0776df 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_AR+:} false; then :
> -@@ -6139,7 +6393,7 @@ do
> +@@ -6145,7 +6399,7 @@ do
>     test -z "$as_dir" && as_dir=.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -21838,7 +27117,7 @@ index 6690a502b2f..badcc0776df 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -6159,11 +6413,15 @@ $as_echo "no" >&6; }
> +@@ -6165,11 +6419,15 @@ $as_echo "no" >&6; }
>   fi
>   
>   
> @@ -21857,7 +27136,7 @@ index 6690a502b2f..badcc0776df 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_ac_ct_AR+:} false; then :
> -@@ -6179,7 +6437,7 @@ do
> +@@ -6185,7 +6443,7 @@ do
>     test -z "$as_dir" && as_dir=.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -21866,7 +27145,7 @@ index 6690a502b2f..badcc0776df 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -6198,6 +6456,10 @@ else
> +@@ -6204,6 +6462,10 @@ else
>   $as_echo "no" >&6; }
>   fi
>   
> @@ -21877,7 +27156,7 @@ index 6690a502b2f..badcc0776df 100755
>     if test "x$ac_ct_AR" = x; then
>       AR="false"
>     else
> -@@ -6209,25 +6471,20 @@ ac_tool_warned=yes ;;
> +@@ -6215,25 +6477,20 @@ ac_tool_warned=yes ;;
>   esac
>       AR=$ac_ct_AR
>     fi
> @@ -21913,7 +27192,7 @@ index 6690a502b2f..badcc0776df 100755
>   
>   
>   
> -@@ -6238,6 +6495,63 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
> +@@ -6244,6 +6501,63 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
>   
>   
>   
> @@ -21977,7 +27256,7 @@ index 6690a502b2f..badcc0776df 100755
>   
>   if test -n "$ac_tool_prefix"; then
>     # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
> -@@ -6578,8 +6892,8 @@ esac
> +@@ -6584,8 +6898,8 @@ esac
>   lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
>   
>   # Transform an extracted symbol line into symbol name and symbol address
> @@ -21988,7 +27267,7 @@ index 6690a502b2f..badcc0776df 100755
>   
>   # Handle CRLF in mingw tool chain
>   opt_cr=
> -@@ -6615,6 +6929,7 @@ for ac_symprfx in "" "_"; do
> +@@ -6621,6 +6935,7 @@ for ac_symprfx in "" "_"; do
>     else
>       lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
>     fi
> @@ -21996,7 +27275,7 @@ index 6690a502b2f..badcc0776df 100755
>   
>     # Check to see that the pipe works correctly.
>     pipe_works=no
> -@@ -6656,6 +6971,18 @@ _LT_EOF
> +@@ -6662,6 +6977,18 @@ _LT_EOF
>         if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
>   	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
>   	  cat <<_LT_EOF > conftest.$ac_ext
> @@ -22015,7 +27294,7 @@ index 6690a502b2f..badcc0776df 100755
>   #ifdef __cplusplus
>   extern "C" {
>   #endif
> -@@ -6667,7 +6994,7 @@ _LT_EOF
> +@@ -6673,7 +7000,7 @@ _LT_EOF
>   	  cat <<_LT_EOF >> conftest.$ac_ext
>   
>   /* The mapping between symbol names and symbols.  */
> @@ -22024,7 +27303,7 @@ index 6690a502b2f..badcc0776df 100755
>     const char *name;
>     void       *address;
>   }
> -@@ -6693,8 +7020,8 @@ static const void *lt_preloaded_setup() {
> +@@ -6699,8 +7026,8 @@ static const void *lt_preloaded_setup() {
>   _LT_EOF
>   	  # Now try linking the two files.
>   	  mv conftest.$ac_objext conftstm.$ac_objext
> @@ -22035,7 +27314,7 @@ index 6690a502b2f..badcc0776df 100755
>   	  LIBS="conftstm.$ac_objext"
>   	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
>   	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
> -@@ -6704,8 +7031,8 @@ _LT_EOF
> +@@ -6710,8 +7037,8 @@ _LT_EOF
>     test $ac_status = 0; } && test -s conftest${ac_exeext}; then
>   	    pipe_works=yes
>   	  fi
> @@ -22046,7 +27325,7 @@ index 6690a502b2f..badcc0776df 100755
>   	else
>   	  echo "cannot find nm_test_func in $nlist" >&5
>   	fi
> -@@ -6742,6 +7069,14 @@ else
> +@@ -6748,6 +7075,14 @@ else
>   $as_echo "ok" >&6; }
>   fi
>   
> @@ -22061,7 +27340,7 @@ index 6690a502b2f..badcc0776df 100755
>   
>   
>   
> -@@ -6760,6 +7095,47 @@ fi
> +@@ -6766,6 +7101,47 @@ fi
>   
>   
>   
> @@ -22109,7 +27388,7 @@ index 6690a502b2f..badcc0776df 100755
>   
>   
>   
> -@@ -6969,6 +7345,123 @@ esac
> +@@ -6975,6 +7351,123 @@ esac
>   
>   need_locks="$enable_libtool_lock"
>   
> @@ -22233,7 +27512,7 @@ index 6690a502b2f..badcc0776df 100755
>   
>     case $host_os in
>       rhapsody* | darwin*)
> -@@ -7532,6 +8025,8 @@ _LT_EOF
> +@@ -7538,6 +8031,8 @@ _LT_EOF
>         $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
>         echo "$AR cru libconftest.a conftest.o" >&5
>         $AR cru libconftest.a conftest.o 2>&5
> @@ -22242,7 +27521,7 @@ index 6690a502b2f..badcc0776df 100755
>         cat > conftest.c << _LT_EOF
>   int main() { return 0;}
>   _LT_EOF
> -@@ -8084,8 +8579,6 @@ fi
> +@@ -8090,8 +8585,6 @@ fi
>   lt_prog_compiler_pic=
>   lt_prog_compiler_static=
>   
> @@ -22251,7 +27530,7 @@ index 6690a502b2f..badcc0776df 100755
>   
>     if test "$GCC" = yes; then
>       lt_prog_compiler_wl='-Wl,'
> -@@ -8251,6 +8744,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -8257,6 +8750,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>   	lt_prog_compiler_pic='--shared'
>   	lt_prog_compiler_static='--static'
>   	;;
> @@ -22264,7 +27543,7 @@ index 6690a502b2f..badcc0776df 100755
>         pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
>           # Portland Group compilers (*not* the Pentium gcc compiler,
>   	# which looks to be a dead project)
> -@@ -8313,7 +8812,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -8319,7 +8818,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>         lt_prog_compiler_pic='-KPIC'
>         lt_prog_compiler_static='-Bstatic'
>         case $cc_basename in
> @@ -22273,7 +27552,7 @@ index 6690a502b2f..badcc0776df 100755
>   	lt_prog_compiler_wl='-Qoption ld ';;
>         *)
>   	lt_prog_compiler_wl='-Wl,';;
> -@@ -8370,13 +8869,17 @@ case $host_os in
> +@@ -8376,13 +8875,17 @@ case $host_os in
>       lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
>       ;;
>   esac
> @@ -22297,7 +27576,7 @@ index 6690a502b2f..badcc0776df 100755
>   
>   #
>   # Check to make sure the PIC flag actually works.
> -@@ -8437,6 +8940,11 @@ fi
> +@@ -8443,6 +8946,11 @@ fi
>   
>   
>   
> @@ -22309,7 +27588,7 @@ index 6690a502b2f..badcc0776df 100755
>   #
>   # Check to make sure the static flag actually works.
>   #
> -@@ -8787,7 +9295,8 @@ _LT_EOF
> +@@ -8793,7 +9301,8 @@ _LT_EOF
>         allow_undefined_flag=unsupported
>         always_export_symbols=no
>         enable_shared_with_static_runtimes=yes
> @@ -22319,7 +27598,7 @@ index 6690a502b2f..badcc0776df 100755
>   
>         if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
>           archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
> -@@ -8886,12 +9395,12 @@ _LT_EOF
> +@@ -8892,12 +9401,12 @@ _LT_EOF
>   	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
>   	  hardcode_libdir_flag_spec=
>   	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
> @@ -22334,7 +27613,7 @@ index 6690a502b2f..badcc0776df 100755
>   	  fi
>   	  ;;
>   	esac
> -@@ -8905,8 +9414,8 @@ _LT_EOF
> +@@ -8911,8 +9420,8 @@ _LT_EOF
>   	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
>   	wlarc=
>         else
> @@ -22345,7 +27624,7 @@ index 6690a502b2f..badcc0776df 100755
>         fi
>         ;;
>   
> -@@ -8924,8 +9433,8 @@ _LT_EOF
> +@@ -8930,8 +9439,8 @@ _LT_EOF
>   
>   _LT_EOF
>         elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -22356,7 +27635,7 @@ index 6690a502b2f..badcc0776df 100755
>         else
>   	ld_shlibs=no
>         fi
> -@@ -8971,8 +9480,8 @@ _LT_EOF
> +@@ -8977,8 +9486,8 @@ _LT_EOF
>   
>       *)
>         if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -22367,7 +27646,7 @@ index 6690a502b2f..badcc0776df 100755
>         else
>   	ld_shlibs=no
>         fi
> -@@ -9102,7 +9611,13 @@ _LT_EOF
> +@@ -9108,7 +9617,13 @@ _LT_EOF
>   	allow_undefined_flag='-berok'
>           # Determine the default libpath from the value encoded in an
>           # empty executable.
> @@ -22382,7 +27661,7 @@ index 6690a502b2f..badcc0776df 100755
>   /* end confdefs.h.  */
>   
>   int
> -@@ -9115,22 +9630,29 @@ main ()
> +@@ -9121,22 +9636,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>   
> @@ -22425,7 +27704,7 @@ index 6690a502b2f..badcc0776df 100755
>   
>           hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>           archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> -@@ -9142,7 +9664,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9148,7 +9670,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	else
>   	 # Determine the default libpath from the value encoded in an
>   	 # empty executable.
> @@ -22440,7 +27719,7 @@ index 6690a502b2f..badcc0776df 100755
>   /* end confdefs.h.  */
>   
>   int
> -@@ -9155,22 +9683,29 @@ main ()
> +@@ -9161,22 +9689,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>   
> @@ -22483,7 +27762,7 @@ index 6690a502b2f..badcc0776df 100755
>   
>   	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>   	  # Warning - without using the other run time loading flags,
> -@@ -9215,20 +9750,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9221,20 +9756,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>         # Microsoft Visual C++.
>         # hardcode_libdir_flag_spec is actually meaningless, as there is
>         # no search path for DLLs.
> @@ -22561,7 +27840,7 @@ index 6690a502b2f..badcc0776df 100755
>         ;;
>   
>       darwin* | rhapsody*)
> -@@ -9289,7 +9867,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9295,7 +9873,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
>       freebsd* | dragonfly*)
> @@ -22570,7 +27849,7 @@ index 6690a502b2f..badcc0776df 100755
>         hardcode_libdir_flag_spec='-R$libdir'
>         hardcode_direct=yes
>         hardcode_shlibpath_var=no
> -@@ -9297,7 +9875,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9303,7 +9881,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       hpux9*)
>         if test "$GCC" = yes; then
> @@ -22579,7 +27858,7 @@ index 6690a502b2f..badcc0776df 100755
>         else
>   	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
>         fi
> -@@ -9313,7 +9891,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9319,7 +9897,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       hpux10*)
>         if test "$GCC" = yes && test "$with_gnu_ld" = no; then
> @@ -22588,7 +27867,7 @@ index 6690a502b2f..badcc0776df 100755
>         else
>   	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
>         fi
> -@@ -9337,10 +9915,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9343,10 +9921,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
>   	  ;;
>   	ia64*)
> @@ -22601,7 +27880,7 @@ index 6690a502b2f..badcc0776df 100755
>   	  ;;
>   	esac
>         else
> -@@ -9419,23 +9997,36 @@ fi
> +@@ -9425,23 +10003,36 @@ fi
>   
>       irix5* | irix6* | nonstopux*)
>         if test "$GCC" = yes; then
> @@ -22646,7 +27925,7 @@ index 6690a502b2f..badcc0776df 100755
>         else
>   	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
>   	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
> -@@ -9520,7 +10111,7 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9526,7 +10117,7 @@ rm -f core conftest.err conftest.$ac_objext \
>       osf4* | osf5*)	# as osf3* with the addition of -msym flag
>         if test "$GCC" = yes; then
>   	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
> @@ -22655,7 +27934,7 @@ index 6690a502b2f..badcc0776df 100755
>   	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
>         else
>   	allow_undefined_flag=' -expect_unresolved \*'
> -@@ -9539,9 +10130,9 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9545,9 +10136,9 @@ rm -f core conftest.err conftest.$ac_objext \
>         no_undefined_flag=' -z defs'
>         if test "$GCC" = yes; then
>   	wlarc='${wl}'
> @@ -22667,7 +27946,7 @@ index 6690a502b2f..badcc0776df 100755
>         else
>   	case `$CC -V 2>&1` in
>   	*"Compilers 5.0"*)
> -@@ -10117,8 +10708,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -10123,8 +10714,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>     need_version=no
>     need_lib_prefix=no
>   
> @@ -22679,7 +27958,7 @@ index 6690a502b2f..badcc0776df 100755
>       library_names_spec='$libname.dll.a'
>       # DLL is installed to $(libdir)/../bin by postinstall_cmds
>       postinstall_cmds='base_file=`basename \${file}`~
> -@@ -10151,13 +10743,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -10157,13 +10749,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>         library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>         ;;
>       esac
> @@ -22752,16 +28031,16 @@ index 6690a502b2f..badcc0776df 100755
>     # FIXME: first we should search . and the directory the executable is in
>     shlibpath_var=PATH
>     ;;
> -@@ -11035,7 +11685,7 @@ else
> +@@ -11041,7 +11691,7 @@ else
>     lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>     lt_status=$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 11038 "configure"
> +-#line 11044 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>   
>   #if HAVE_DLFCN_H
> -@@ -11079,10 +11729,10 @@ else
> +@@ -11085,10 +11735,10 @@ else
>   /* When -fvisbility=hidden is used, assume the code has been annotated
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -22774,16 +28053,16 @@ index 6690a502b2f..badcc0776df 100755
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -11141,7 +11791,7 @@ else
> +@@ -11147,7 +11797,7 @@ else
>     lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>     lt_status=$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 11144 "configure"
> +-#line 11150 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>   
>   #if HAVE_DLFCN_H
> -@@ -11185,10 +11835,10 @@ else
> +@@ -11191,10 +11841,10 @@ else
>   /* When -fvisbility=hidden is used, assume the code has been annotated
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -22796,7 +28075,7 @@ index 6690a502b2f..badcc0776df 100755
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -13390,13 +14040,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
> +@@ -13396,13 +14046,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
>   lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>   lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>   lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -22817,7 +28096,7 @@ index 6690a502b2f..badcc0776df 100755
>   STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>   RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>   old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
> -@@ -13411,14 +14068,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
> +@@ -13417,14 +14074,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
>   lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
> @@ -22836,7 +28115,7 @@ index 6690a502b2f..badcc0776df 100755
>   DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>   NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>   LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -13451,12 +14111,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
> +@@ -13457,12 +14117,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
>   hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
>   inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
>   link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
> @@ -22850,7 +28129,7 @@ index 6690a502b2f..badcc0776df 100755
>   file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
>   variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
>   need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
> -@@ -13511,8 +14171,13 @@ reload_flag \
> +@@ -13517,8 +14177,13 @@ reload_flag \
>   OBJDUMP \
>   deplibs_check_method \
>   file_magic_cmd \
> @@ -22864,7 +28143,7 @@ index 6690a502b2f..badcc0776df 100755
>   STRIP \
>   RANLIB \
>   CC \
> -@@ -13522,12 +14187,14 @@ lt_cv_sys_global_symbol_pipe \
> +@@ -13528,12 +14193,14 @@ lt_cv_sys_global_symbol_pipe \
>   lt_cv_sys_global_symbol_to_cdecl \
>   lt_cv_sys_global_symbol_to_c_name_address \
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -22880,7 +28159,7 @@ index 6690a502b2f..badcc0776df 100755
>   DSYMUTIL \
>   NMEDIT \
>   LIPO \
> -@@ -13543,7 +14210,6 @@ no_undefined_flag \
> +@@ -13549,7 +14216,6 @@ no_undefined_flag \
>   hardcode_libdir_flag_spec \
>   hardcode_libdir_flag_spec_ld \
>   hardcode_libdir_separator \
> @@ -22888,7 +28167,7 @@ index 6690a502b2f..badcc0776df 100755
>   exclude_expsyms \
>   include_expsyms \
>   file_list_spec \
> -@@ -13579,6 +14245,7 @@ module_cmds \
> +@@ -13585,6 +14251,7 @@ module_cmds \
>   module_expsym_cmds \
>   export_symbols_cmds \
>   prelink_cmds \
> @@ -22896,7 +28175,7 @@ index 6690a502b2f..badcc0776df 100755
>   postinstall_cmds \
>   postuninstall_cmds \
>   finish_cmds \
> -@@ -14344,7 +15011,8 @@ $as_echo X"$file" |
> +@@ -14350,7 +15017,8 @@ $as_echo X"$file" |
>   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>   #
>   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -22906,7 +28185,7 @@ index 6690a502b2f..badcc0776df 100755
>   #   Written by Gordon Matzigkeit, 1996
>   #
>   #   This file is part of GNU Libtool.
> -@@ -14447,19 +15115,42 @@ SP2NL=$lt_lt_SP2NL
> +@@ -14453,19 +15121,42 @@ SP2NL=$lt_lt_SP2NL
>   # turn newlines into spaces.
>   NL2SP=$lt_lt_NL2SP
>   
> @@ -22950,7 +28229,7 @@ index 6690a502b2f..badcc0776df 100755
>   # A symbol stripping program.
>   STRIP=$lt_STRIP
>   
> -@@ -14489,6 +15180,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
> +@@ -14495,6 +15186,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
>   # Transform the output of nm in a C name address pair when lib prefix is needed.
>   global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
>   
> @@ -22963,7 +28242,7 @@ index 6690a502b2f..badcc0776df 100755
>   # The name of the directory that contains temporary libtool files.
>   objdir=$objdir
>   
> -@@ -14498,6 +15195,9 @@ MAGIC_CMD=$MAGIC_CMD
> +@@ -14504,6 +15201,9 @@ MAGIC_CMD=$MAGIC_CMD
>   # Must we lock files when doing compilation?
>   need_locks=$lt_need_locks
>   
> @@ -22973,7 +28252,7 @@ index 6690a502b2f..badcc0776df 100755
>   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>   DSYMUTIL=$lt_DSYMUTIL
>   
> -@@ -14612,12 +15312,12 @@ with_gcc=$GCC
> +@@ -14618,12 +15318,12 @@ with_gcc=$GCC
>   # Compiler flag to turn off builtin functions.
>   no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
>   
> @@ -22989,7 +28268,7 @@ index 6690a502b2f..badcc0776df 100755
>   # Compiler flag to prevent dynamic linking.
>   link_static_flag=$lt_lt_prog_compiler_static
>   
> -@@ -14704,9 +15404,6 @@ inherit_rpath=$inherit_rpath
> +@@ -14710,9 +15410,6 @@ inherit_rpath=$inherit_rpath
>   # Whether libtool must link a program against all its dependency libraries.
>   link_all_deplibs=$link_all_deplibs
>   
> @@ -22999,7 +28278,7 @@ index 6690a502b2f..badcc0776df 100755
>   # Set to "yes" if exported symbols are required.
>   always_export_symbols=$always_export_symbols
>   
> -@@ -14722,6 +15419,9 @@ include_expsyms=$lt_include_expsyms
> +@@ -14728,6 +15425,9 @@ include_expsyms=$lt_include_expsyms
>   # Commands necessary for linking programs (against libraries) with templates.
>   prelink_cmds=$lt_prelink_cmds
>   
> @@ -23009,7 +28288,7 @@ index 6690a502b2f..badcc0776df 100755
>   # Specify filename containing input files.
>   file_list_spec=$lt_file_list_spec
>   
> -@@ -14754,210 +15454,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
> +@@ -14760,210 +15460,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
>     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>     # text mode, it properly converts lines to CR/LF.  This bash problem
>     # is reportedly fixed, but why not run on old versions too?
> @@ -23383,8 +28662,838 @@ index 6690a502b2f..badcc0776df 100755
>       (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
>     chmod +x "$ofile"
>   
> +diff --git a/sim/Makefile.in b/sim/Makefile.in
> +index dbbaa84224a..f819bbe0bdd 100644
> +--- a/sim/Makefile.in
> ++++ b/sim/Makefile.in
> +@@ -744,6 +744,7 @@ C_DIALECT = @C_DIALECT@
> + DATADIRNAME = @DATADIRNAME@
> + DEFS = @DEFS@
> + DEPDIR = @DEPDIR@
> ++DLLTOOL = @DLLTOOL@
> + DSYMUTIL = @DSYMUTIL@
> + DTC = @DTC@
> + DUMPBIN = @DUMPBIN@
> +@@ -809,6 +810,7 @@ LN_S = @LN_S@
> + LTLIBOBJS = @LTLIBOBJS@
> + MAINT = @MAINT@
> + MAKEINFO = @MAKEINFO@
> ++MANIFEST_TOOL = @MANIFEST_TOOL@
> + MKDIR_P = @MKDIR_P@
> + NM = @NM@
> + NMEDIT = @NMEDIT@
> +@@ -859,6 +861,7 @@ abs_builddir = @abs_builddir@
> + abs_srcdir = @abs_srcdir@
> + abs_top_builddir = @abs_top_builddir@
> + abs_top_srcdir = @abs_top_srcdir@
> ++ac_ct_AR = @ac_ct_AR@
> + ac_ct_CC = @ac_ct_CC@
> + ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
> + am__include = @am__include@
> +diff --git a/zlib/Makefile.in b/zlib/Makefile.in
> +index c7584492a65..0605835c14f 100644
> +--- a/zlib/Makefile.in
> ++++ b/zlib/Makefile.in
> +@@ -1,7 +1,7 @@
> +-# Makefile.in generated by automake 1.16.5 from Makefile.am.
> ++# Makefile.in generated by automake 1.15.1 from Makefile.am.
> + # @configure_input@
> + 
> +-# Copyright (C) 1994-2021 Free Software Foundation, Inc.
> ++# Copyright (C) 1994-2017 Free Software Foundation, Inc.
> + 
> + # This Makefile.in is free software; the Free Software Foundation
> + # gives unlimited permission to copy and/or distribute it,
> +@@ -138,7 +138,6 @@ am__uninstall_files_from_dir = { \
> +   }
> + am__installdirs = "$(DESTDIR)$(toolexeclibdir)"
> + LIBRARIES = $(toolexeclib_LIBRARIES)
> +-LTLIBRARIES = $(noinst_LTLIBRARIES)
> + ARFLAGS = cru
> + AM_V_AR = $(am__v_AR_@AM_V@)
> + am__v_AR_ = $(am__v_AR_@AM_DEFAULT_V@)
> +@@ -161,6 +160,7 @@ am__objects_1 = libz_a-adler32.$(OBJEXT) libz_a-compress.$(OBJEXT) \
> + 	libz_a-zutil.$(OBJEXT)
> + @TARGET_LIBRARY_FALSE@am_libz_a_OBJECTS = $(am__objects_1)
> + libz_a_OBJECTS = $(am_libz_a_OBJECTS)
> ++LTLIBRARIES = $(noinst_LTLIBRARIES)
> + libzgcj_convenience_la_LIBADD =
> + am__libzgcj_convenience_la_SOURCES_DIST = adler32.c compress.c crc32.c \
> + 	crc32.h deflate.c deflate.h gzguts.h gzread.c gzclose.c \
> +@@ -192,22 +192,7 @@ am__v_at_0 = @
> + am__v_at_1 = 
> + DEFAULT_INCLUDES = -I.@am__isrc@
> + depcomp = $(SHELL) $(top_srcdir)/../depcomp
> +-am__maybe_remake_depfiles = depfiles
> +-am__depfiles_remade = ./$(DEPDIR)/adler32.Plo ./$(DEPDIR)/compress.Plo \
> +-	./$(DEPDIR)/crc32.Plo ./$(DEPDIR)/deflate.Plo \
> +-	./$(DEPDIR)/gzclose.Plo ./$(DEPDIR)/gzlib.Plo \
> +-	./$(DEPDIR)/gzread.Plo ./$(DEPDIR)/gzwrite.Plo \
> +-	./$(DEPDIR)/infback.Plo ./$(DEPDIR)/inffast.Plo \
> +-	./$(DEPDIR)/inflate.Plo ./$(DEPDIR)/inftrees.Plo \
> +-	./$(DEPDIR)/libz_a-adler32.Po ./$(DEPDIR)/libz_a-compress.Po \
> +-	./$(DEPDIR)/libz_a-crc32.Po ./$(DEPDIR)/libz_a-deflate.Po \
> +-	./$(DEPDIR)/libz_a-gzclose.Po ./$(DEPDIR)/libz_a-gzlib.Po \
> +-	./$(DEPDIR)/libz_a-gzread.Po ./$(DEPDIR)/libz_a-gzwrite.Po \
> +-	./$(DEPDIR)/libz_a-infback.Po ./$(DEPDIR)/libz_a-inffast.Po \
> +-	./$(DEPDIR)/libz_a-inflate.Po ./$(DEPDIR)/libz_a-inftrees.Po \
> +-	./$(DEPDIR)/libz_a-trees.Po ./$(DEPDIR)/libz_a-uncompr.Po \
> +-	./$(DEPDIR)/libz_a-zutil.Po ./$(DEPDIR)/trees.Plo \
> +-	./$(DEPDIR)/uncompr.Plo ./$(DEPDIR)/zutil.Plo
> ++am__depfiles_maybe = depfiles
> + am__mv = mv -f
> + COMPILE = $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
> + 	$(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
> +@@ -252,6 +237,9 @@ am__define_uniq_tagged_files = \
> +   unique=`for i in $$list; do \
> +     if test -f "$$i"; then echo $$i; else echo $(srcdir)/$$i; fi; \
> +   done | $(am__uniquify_input)`
> ++ETAGS = etags
> ++CTAGS = ctags
> ++CSCOPE = cscope
> + AM_RECURSIVE_TARGETS = cscope
> + am__DIST_COMMON = $(srcdir)/Makefile.in $(top_srcdir)/../compile \
> + 	$(top_srcdir)/../config.guess $(top_srcdir)/../config.sub \
> +@@ -272,8 +260,6 @@ am__post_remove_distdir = $(am__remove_distdir)
> + DIST_ARCHIVES = $(distdir).tar.gz
> + GZIP_ENV = --best
> + DIST_TARGETS = dist-gzip
> +-# Exists only to be overridden by the user if desired.
> +-AM_DISTCHECK_DVI_TARGET = dvi
> + distuninstallcheck_listfiles = find . -type f -print
> + am__distuninstallcheck_listfiles = $(distuninstallcheck_listfiles) \
> +   | sed 's|^\./|$(prefix)/|' | grep -v '$(infodir)/dir$$'
> +@@ -292,18 +278,16 @@ CFLAGS = @CFLAGS@
> + COMPPATH = @COMPPATH@
> + CPP = @CPP@
> + CPPFLAGS = @CPPFLAGS@
> +-CSCOPE = @CSCOPE@
> +-CTAGS = @CTAGS@
> + CYGPATH_W = @CYGPATH_W@
> + DEFS = @DEFS@
> + DEPDIR = @DEPDIR@
> ++DLLTOOL = @DLLTOOL@
> + DSYMUTIL = @DSYMUTIL@
> + DUMPBIN = @DUMPBIN@
> + ECHO_C = @ECHO_C@
> + ECHO_N = @ECHO_N@
> + ECHO_T = @ECHO_T@
> + EGREP = @EGREP@
> +-ETAGS = @ETAGS@
> + EXEEXT = @EXEEXT@
> + FGREP = @FGREP@
> + GREP = @GREP@
> +@@ -322,6 +306,7 @@ LN_S = @LN_S@
> + LTLIBOBJS = @LTLIBOBJS@
> + MAINT = @MAINT@
> + MAKEINFO = @MAKEINFO@
> ++MANIFEST_TOOL = @MANIFEST_TOOL@
> + MKDIR_P = @MKDIR_P@
> + NM = @NM@
> + NMEDIT = @NMEDIT@
> +@@ -348,6 +333,7 @@ abs_builddir = @abs_builddir@
> + abs_srcdir = @abs_srcdir@
> + abs_top_builddir = @abs_top_builddir@
> + abs_top_srcdir = @abs_top_srcdir@
> ++ac_ct_AR = @ac_ct_AR@
> + ac_ct_CC = @ac_ct_CC@
> + ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
> + am__include = @am__include@
> +@@ -491,8 +477,8 @@ Makefile: $(srcdir)/Makefile.in $(top_builddir)/config.status
> + 	    echo ' $(SHELL) ./config.status'; \
> + 	    $(SHELL) ./config.status;; \
> + 	  *) \
> +-	    echo ' cd $(top_builddir) && $(SHELL) ./config.status $@ $(am__maybe_remake_depfiles)'; \
> +-	    cd $(top_builddir) && $(SHELL) ./config.status $@ $(am__maybe_remake_depfiles);; \
> ++	    echo ' cd $(top_builddir) && $(SHELL) ./config.status $@ $(am__depfiles_maybe)'; \
> ++	    cd $(top_builddir) && $(SHELL) ./config.status $@ $(am__depfiles_maybe);; \
> + 	esac;
> + $(top_srcdir)/../multilib.am $(am__empty):
> + 
> +@@ -536,6 +522,11 @@ uninstall-toolexeclibLIBRARIES:
> + clean-toolexeclibLIBRARIES:
> + 	-test -z "$(toolexeclib_LIBRARIES)" || rm -f $(toolexeclib_LIBRARIES)
> + 
> ++libz.a: $(libz_a_OBJECTS) $(libz_a_DEPENDENCIES) $(EXTRA_libz_a_DEPENDENCIES) 
> ++	$(AM_V_at)-rm -f libz.a
> ++	$(AM_V_AR)$(libz_a_AR) libz.a $(libz_a_OBJECTS) $(libz_a_LIBADD)
> ++	$(AM_V_at)$(RANLIB) libz.a
> ++
> + clean-noinstLTLIBRARIES:
> + 	-test -z "$(noinst_LTLIBRARIES)" || rm -f $(noinst_LTLIBRARIES)
> + 	@list='$(noinst_LTLIBRARIES)'; \
> +@@ -547,11 +538,6 @@ clean-noinstLTLIBRARIES:
> + 	  rm -f $${locs}; \
> + 	}
> + 
> +-libz.a: $(libz_a_OBJECTS) $(libz_a_DEPENDENCIES) $(EXTRA_libz_a_DEPENDENCIES) 
> +-	$(AM_V_at)-rm -f libz.a
> +-	$(AM_V_AR)$(libz_a_AR) libz.a $(libz_a_OBJECTS) $(libz_a_LIBADD)
> +-	$(AM_V_at)$(RANLIB) libz.a
> +-
> + libzgcj_convenience.la: $(libzgcj_convenience_la_OBJECTS) $(libzgcj_convenience_la_DEPENDENCIES) $(EXTRA_libzgcj_convenience_la_DEPENDENCIES) 
> + 	$(AM_V_CCLD)$(LINK) $(am_libzgcj_convenience_la_rpath) $(libzgcj_convenience_la_OBJECTS) $(libzgcj_convenience_la_LIBADD) $(LIBS)
> + 
> +@@ -561,42 +547,36 @@ mostlyclean-compile:
> + distclean-compile:
> + 	-rm -f *.tab.c
> + 
> +-@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/adler32.Plo@am__quote@ # am--include-marker
> +-@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/compress.Plo@am__quote@ # am--include-marker
> +-@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/crc32.Plo@am__quote@ # am--include-marker
> +-@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/deflate.Plo@am__quote@ # am--include-marker
> +-@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/gzclose.Plo@am__quote@ # am--include-marker
> +-@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/gzlib.Plo@am__quote@ # am--include-marker
> +-@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/gzread.Plo@am__quote@ # am--include-marker
> +-@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/gzwrite.Plo@am__quote@ # am--include-marker
> +-@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/infback.Plo@am__quote@ # am--include-marker
> +-@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/inffast.Plo@am__quote@ # am--include-marker
> +-@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/inflate.Plo@am__quote@ # am--include-marker
> +-@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/inftrees.Plo@am__quote@ # am--include-marker
> +-@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/libz_a-adler32.Po@am__quote@ # am--include-marker
> +-@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/libz_a-compress.Po@am__quote@ # am--include-marker
> +-@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/libz_a-crc32.Po@am__quote@ # am--include-marker
> +-@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/libz_a-deflate.Po@am__quote@ # am--include-marker
> +-@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/libz_a-gzclose.Po@am__quote@ # am--include-marker
> +-@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/libz_a-gzlib.Po@am__quote@ # am--include-marker
> +-@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/libz_a-gzread.Po@am__quote@ # am--include-marker
> +-@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/libz_a-gzwrite.Po@am__quote@ # am--include-marker
> +-@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/libz_a-infback.Po@am__quote@ # am--include-marker
> +-@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/libz_a-inffast.Po@am__quote@ # am--include-marker
> +-@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/libz_a-inflate.Po@am__quote@ # am--include-marker
> +-@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/libz_a-inftrees.Po@am__quote@ # am--include-marker
> +-@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/libz_a-trees.Po@am__quote@ # am--include-marker
> +-@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/libz_a-uncompr.Po@am__quote@ # am--include-marker
> +-@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/libz_a-zutil.Po@am__quote@ # am--include-marker
> +-@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/trees.Plo@am__quote@ # am--include-marker
> +-@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/uncompr.Plo@am__quote@ # am--include-marker
> +-@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/zutil.Plo@am__quote@ # am--include-marker
> +-
> +-$(am__depfiles_remade):
> +-	@$(MKDIR_P) $(@D)
> +-	@echo '# dummy' >$@-t && $(am__mv) $@-t $@
> +-
> +-am--depfiles: $(am__depfiles_remade)
> ++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/adler32.Plo@am__quote@
> ++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/compress.Plo@am__quote@
> ++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/crc32.Plo@am__quote@
> ++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/deflate.Plo@am__quote@
> ++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/gzclose.Plo@am__quote@
> ++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/gzlib.Plo@am__quote@
> ++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/gzread.Plo@am__quote@
> ++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/gzwrite.Plo@am__quote@
> ++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/infback.Plo@am__quote@
> ++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/inffast.Plo@am__quote@
> ++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/inflate.Plo@am__quote@
> ++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/inftrees.Plo@am__quote@
> ++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/libz_a-adler32.Po@am__quote@
> ++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/libz_a-compress.Po@am__quote@
> ++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/libz_a-crc32.Po@am__quote@
> ++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/libz_a-deflate.Po@am__quote@
> ++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/libz_a-gzclose.Po@am__quote@
> ++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/libz_a-gzlib.Po@am__quote@
> ++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/libz_a-gzread.Po@am__quote@
> ++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/libz_a-gzwrite.Po@am__quote@
> ++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/libz_a-infback.Po@am__quote@
> ++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/libz_a-inffast.Po@am__quote@
> ++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/libz_a-inflate.Po@am__quote@
> ++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/libz_a-inftrees.Po@am__quote@
> ++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/libz_a-trees.Po@am__quote@
> ++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/libz_a-uncompr.Po@am__quote@
> ++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/libz_a-zutil.Po@am__quote@
> ++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/trees.Plo@am__quote@
> ++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/uncompr.Plo@am__quote@
> ++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/zutil.Plo@am__quote@
> + 
> + .c.o:
> + @am__fastdepCC_TRUE@	$(AM_V_CC)$(COMPILE) -MT $@ -MD -MP -MF $(DEPDIR)/$*.Tpo -c -o $@ $<
> +@@ -896,10 +876,8 @@ cscopelist-am: $(am__tagged_files)
> + distclean-tags:
> + 	-rm -f TAGS ID GTAGS GRTAGS GSYMS GPATH tags
> + 	-rm -f cscope.out cscope.in.out cscope.po.out cscope.files
> +-distdir: $(BUILT_SOURCES)
> +-	$(MAKE) $(AM_MAKEFLAGS) distdir-am
> + 
> +-distdir-am: $(DISTFILES)
> ++distdir: $(DISTFILES)
> + 	$(am__remove_distdir)
> + 	test -d "$(distdir)" || mkdir "$(distdir)"
> + 	@srcdirstrip=`echo "$(srcdir)" | sed 's/[].[^$$\\*]/\\\\&/g'`; \
> +@@ -954,10 +932,6 @@ dist-xz: distdir
> + 	tardir=$(distdir) && $(am__tar) | XZ_OPT=$${XZ_OPT--e} xz -c >$(distdir).tar.xz
> + 	$(am__post_remove_distdir)
> + 
> +-dist-zstd: distdir
> +-	tardir=$(distdir) && $(am__tar) | zstd -c $${ZSTD_CLEVEL-$${ZSTD_OPT--19}} >$(distdir).tar.zst
> +-	$(am__post_remove_distdir)
> +-
> + dist-tarZ: distdir
> + 	@echo WARNING: "Support for distribution archives compressed with" \
> + 		       "legacy program 'compress' is deprecated." >&2
> +@@ -1000,8 +974,6 @@ distcheck: dist
> + 	  eval GZIP= gzip $(GZIP_ENV) -dc $(distdir).shar.gz | unshar ;;\
> + 	*.zip*) \
> + 	  unzip $(distdir).zip ;;\
> +-	*.tar.zst*) \
> +-	  zstd -dc $(distdir).tar.zst | $(am__untar) ;;\
> + 	esac
> + 	chmod -R a-w $(distdir)
> + 	chmod u+w $(distdir)
> +@@ -1017,7 +989,7 @@ distcheck: dist
> + 	    $(DISTCHECK_CONFIGURE_FLAGS) \
> + 	    --srcdir=../.. --prefix="$$dc_install_base" \
> + 	  && $(MAKE) $(AM_MAKEFLAGS) \
> +-	  && $(MAKE) $(AM_MAKEFLAGS) $(AM_DISTCHECK_DVI_TARGET) \
> ++	  && $(MAKE) $(AM_MAKEFLAGS) dvi \
> + 	  && $(MAKE) $(AM_MAKEFLAGS) check \
> + 	  && $(MAKE) $(AM_MAKEFLAGS) install \
> + 	  && $(MAKE) $(AM_MAKEFLAGS) installcheck \
> +@@ -1113,36 +1085,7 @@ clean-am: clean-generic clean-libtool clean-local \
> + 
> + distclean: distclean-am
> + 	-rm -f $(am__CONFIG_DISTCLEAN_FILES)
> +-		-rm -f ./$(DEPDIR)/adler32.Plo
> +-	-rm -f ./$(DEPDIR)/compress.Plo
> +-	-rm -f ./$(DEPDIR)/crc32.Plo
> +-	-rm -f ./$(DEPDIR)/deflate.Plo
> +-	-rm -f ./$(DEPDIR)/gzclose.Plo
> +-	-rm -f ./$(DEPDIR)/gzlib.Plo
> +-	-rm -f ./$(DEPDIR)/gzread.Plo
> +-	-rm -f ./$(DEPDIR)/gzwrite.Plo
> +-	-rm -f ./$(DEPDIR)/infback.Plo
> +-	-rm -f ./$(DEPDIR)/inffast.Plo
> +-	-rm -f ./$(DEPDIR)/inflate.Plo
> +-	-rm -f ./$(DEPDIR)/inftrees.Plo
> +-	-rm -f ./$(DEPDIR)/libz_a-adler32.Po
> +-	-rm -f ./$(DEPDIR)/libz_a-compress.Po
> +-	-rm -f ./$(DEPDIR)/libz_a-crc32.Po
> +-	-rm -f ./$(DEPDIR)/libz_a-deflate.Po
> +-	-rm -f ./$(DEPDIR)/libz_a-gzclose.Po
> +-	-rm -f ./$(DEPDIR)/libz_a-gzlib.Po
> +-	-rm -f ./$(DEPDIR)/libz_a-gzread.Po
> +-	-rm -f ./$(DEPDIR)/libz_a-gzwrite.Po
> +-	-rm -f ./$(DEPDIR)/libz_a-infback.Po
> +-	-rm -f ./$(DEPDIR)/libz_a-inffast.Po
> +-	-rm -f ./$(DEPDIR)/libz_a-inflate.Po
> +-	-rm -f ./$(DEPDIR)/libz_a-inftrees.Po
> +-	-rm -f ./$(DEPDIR)/libz_a-trees.Po
> +-	-rm -f ./$(DEPDIR)/libz_a-uncompr.Po
> +-	-rm -f ./$(DEPDIR)/libz_a-zutil.Po
> +-	-rm -f ./$(DEPDIR)/trees.Plo
> +-	-rm -f ./$(DEPDIR)/uncompr.Plo
> +-	-rm -f ./$(DEPDIR)/zutil.Plo
> ++	-rm -rf ./$(DEPDIR)
> + 	-rm -f Makefile
> + distclean-am: clean-am distclean-compile distclean-generic \
> + 	distclean-libtool distclean-local distclean-tags
> +@@ -1190,36 +1133,7 @@ installcheck-am:
> + maintainer-clean: maintainer-clean-am
> + 	-rm -f $(am__CONFIG_DISTCLEAN_FILES)
> + 	-rm -rf $(top_srcdir)/autom4te.cache
> +-		-rm -f ./$(DEPDIR)/adler32.Plo
> +-	-rm -f ./$(DEPDIR)/compress.Plo
> +-	-rm -f ./$(DEPDIR)/crc32.Plo
> +-	-rm -f ./$(DEPDIR)/deflate.Plo
> +-	-rm -f ./$(DEPDIR)/gzclose.Plo
> +-	-rm -f ./$(DEPDIR)/gzlib.Plo
> +-	-rm -f ./$(DEPDIR)/gzread.Plo
> +-	-rm -f ./$(DEPDIR)/gzwrite.Plo
> +-	-rm -f ./$(DEPDIR)/infback.Plo
> +-	-rm -f ./$(DEPDIR)/inffast.Plo
> +-	-rm -f ./$(DEPDIR)/inflate.Plo
> +-	-rm -f ./$(DEPDIR)/inftrees.Plo
> +-	-rm -f ./$(DEPDIR)/libz_a-adler32.Po
> +-	-rm -f ./$(DEPDIR)/libz_a-compress.Po
> +-	-rm -f ./$(DEPDIR)/libz_a-crc32.Po
> +-	-rm -f ./$(DEPDIR)/libz_a-deflate.Po
> +-	-rm -f ./$(DEPDIR)/libz_a-gzclose.Po
> +-	-rm -f ./$(DEPDIR)/libz_a-gzlib.Po
> +-	-rm -f ./$(DEPDIR)/libz_a-gzread.Po
> +-	-rm -f ./$(DEPDIR)/libz_a-gzwrite.Po
> +-	-rm -f ./$(DEPDIR)/libz_a-infback.Po
> +-	-rm -f ./$(DEPDIR)/libz_a-inffast.Po
> +-	-rm -f ./$(DEPDIR)/libz_a-inflate.Po
> +-	-rm -f ./$(DEPDIR)/libz_a-inftrees.Po
> +-	-rm -f ./$(DEPDIR)/libz_a-trees.Po
> +-	-rm -f ./$(DEPDIR)/libz_a-uncompr.Po
> +-	-rm -f ./$(DEPDIR)/libz_a-zutil.Po
> +-	-rm -f ./$(DEPDIR)/trees.Plo
> +-	-rm -f ./$(DEPDIR)/uncompr.Plo
> +-	-rm -f ./$(DEPDIR)/zutil.Plo
> ++	-rm -rf ./$(DEPDIR)
> + 	-rm -f Makefile
> + maintainer-clean-am: distclean-am maintainer-clean-generic \
> + 	maintainer-clean-local
> +@@ -1241,17 +1155,17 @@ uninstall-am: uninstall-toolexeclibLIBRARIES
> + 
> + .MAKE: install-am install-strip
> + 
> +-.PHONY: CTAGS GTAGS TAGS all all-am all-local am--depfiles am--refresh \
> +-	check check-am clean clean-cscope clean-generic clean-libtool \
> ++.PHONY: CTAGS GTAGS TAGS all all-am all-local am--refresh check \
> ++	check-am clean clean-cscope clean-generic clean-libtool \
> + 	clean-local clean-noinstLTLIBRARIES clean-toolexeclibLIBRARIES \
> + 	cscope cscopelist-am ctags ctags-am dist dist-all dist-bzip2 \
> + 	dist-gzip dist-lzip dist-shar dist-tarZ dist-xz dist-zip \
> +-	dist-zstd distcheck distclean distclean-compile \
> +-	distclean-generic distclean-libtool distclean-local \
> +-	distclean-tags distcleancheck distdir distuninstallcheck dvi \
> +-	dvi-am html html-am info info-am install install-am \
> +-	install-data install-data-am install-dvi install-dvi-am \
> +-	install-exec install-exec-am install-exec-local install-html \
> ++	distcheck distclean distclean-compile distclean-generic \
> ++	distclean-libtool distclean-local distclean-tags \
> ++	distcleancheck distdir distuninstallcheck dvi dvi-am html \
> ++	html-am info info-am install install-am install-data \
> ++	install-data-am install-dvi install-dvi-am install-exec \
> ++	install-exec-am install-exec-local install-html \
> + 	install-html-am install-info install-info-am install-man \
> + 	install-pdf install-pdf-am install-ps install-ps-am \
> + 	install-strip install-toolexeclibLIBRARIES installcheck \
> +diff --git a/zlib/aclocal.m4 b/zlib/aclocal.m4
> +index 3538b0f0aea..e5eed57bd68 100644
> +--- a/zlib/aclocal.m4
> ++++ b/zlib/aclocal.m4
> +@@ -1,6 +1,6 @@
> +-# generated automatically by aclocal 1.16.5 -*- Autoconf -*-
> ++# generated automatically by aclocal 1.15.1 -*- Autoconf -*-
> + 
> +-# Copyright (C) 1996-2021 Free Software Foundation, Inc.
> ++# Copyright (C) 1996-2017 Free Software Foundation, Inc.
> + 
> + # This file is free software; the Free Software Foundation
> + # gives unlimited permission to copy and/or distribute it,
> +@@ -20,7 +20,7 @@ You have another version of autoconf.  It may work, but is not guaranteed to.
> + If you have problems, you may need to regenerate the build system entirely.
> + To do so, use the procedure documented by the package, typically 'autoreconf'.])])
> + 
> +-# Copyright (C) 2002-2021 Free Software Foundation, Inc.
> ++# Copyright (C) 2002-2017 Free Software Foundation, Inc.
> + #
> + # This file is free software; the Free Software Foundation
> + # gives unlimited permission to copy and/or distribute it,
> +@@ -32,10 +32,10 @@ To do so, use the procedure documented by the package, typically 'autoreconf'.])
> + # generated from the m4 files accompanying Automake X.Y.
> + # (This private macro should not be called outside this file.)
> + AC_DEFUN([AM_AUTOMAKE_VERSION],
> +-[am__api_version='1.16'
> ++[am__api_version='1.15'
> + dnl Some users find AM_AUTOMAKE_VERSION and mistake it for a way to
> + dnl require some minimum version.  Point them to the right macro.
> +-m4_if([$1], [1.16.5], [],
> ++m4_if([$1], [1.15.1], [],
> +       [AC_FATAL([Do not call $0, use AM_INIT_AUTOMAKE([$1]).])])dnl
> + ])
> + 
> +@@ -51,14 +51,14 @@ m4_define([_AM_AUTOCONF_VERSION], [])
> + # Call AM_AUTOMAKE_VERSION and AM_AUTOMAKE_VERSION so they can be traced.
> + # This function is AC_REQUIREd by AM_INIT_AUTOMAKE.
> + AC_DEFUN([AM_SET_CURRENT_AUTOMAKE_VERSION],
> +-[AM_AUTOMAKE_VERSION([1.16.5])dnl
> ++[AM_AUTOMAKE_VERSION([1.15.1])dnl
> + m4_ifndef([AC_AUTOCONF_VERSION],
> +   [m4_copy([m4_PACKAGE_VERSION], [AC_AUTOCONF_VERSION])])dnl
> + _AM_AUTOCONF_VERSION(m4_defn([AC_AUTOCONF_VERSION]))])
> + 
> + # AM_AUX_DIR_EXPAND                                         -*- Autoconf -*-
> + 
> +-# Copyright (C) 2001-2021 Free Software Foundation, Inc.
> ++# Copyright (C) 2001-2017 Free Software Foundation, Inc.
> + #
> + # This file is free software; the Free Software Foundation
> + # gives unlimited permission to copy and/or distribute it,
> +@@ -110,7 +110,7 @@ am_aux_dir=`cd "$ac_aux_dir" && pwd`
> + 
> + # AM_CONDITIONAL                                            -*- Autoconf -*-
> + 
> +-# Copyright (C) 1997-2021 Free Software Foundation, Inc.
> ++# Copyright (C) 1997-2017 Free Software Foundation, Inc.
> + #
> + # This file is free software; the Free Software Foundation
> + # gives unlimited permission to copy and/or distribute it,
> +@@ -141,7 +141,7 @@ AC_CONFIG_COMMANDS_PRE(
> + Usually this means the macro was only invoked conditionally.]])
> + fi])])
> + 
> +-# Copyright (C) 1999-2021 Free Software Foundation, Inc.
> ++# Copyright (C) 1999-2017 Free Software Foundation, Inc.
> + #
> + # This file is free software; the Free Software Foundation
> + # gives unlimited permission to copy and/or distribute it,
> +@@ -332,12 +332,13 @@ _AM_SUBST_NOTMAKE([am__nodep])dnl
> + 
> + # Generate code to set up dependency tracking.              -*- Autoconf -*-
> + 
> +-# Copyright (C) 1999-2021 Free Software Foundation, Inc.
> ++# Copyright (C) 1999-2017 Free Software Foundation, Inc.
> + #
> + # This file is free software; the Free Software Foundation
> + # gives unlimited permission to copy and/or distribute it,
> + # with or without modifications, as long as this notice is preserved.
> + 
> ++
> + # _AM_OUTPUT_DEPENDENCY_COMMANDS
> + # ------------------------------
> + AC_DEFUN([_AM_OUTPUT_DEPENDENCY_COMMANDS],
> +@@ -345,43 +346,49 @@ AC_DEFUN([_AM_OUTPUT_DEPENDENCY_COMMANDS],
> +   # Older Autoconf quotes --file arguments for eval, but not when files
> +   # are listed without --file.  Let's play safe and only enable the eval
> +   # if we detect the quoting.
> +-  # TODO: see whether this extra hack can be removed once we start
> +-  # requiring Autoconf 2.70 or later.
> +-  AS_CASE([$CONFIG_FILES],
> +-          [*\'*], [eval set x "$CONFIG_FILES"],
> +-          [*], [set x $CONFIG_FILES])
> ++  case $CONFIG_FILES in
> ++  *\'*) eval set x "$CONFIG_FILES" ;;
> ++  *)   set x $CONFIG_FILES ;;
> ++  esac
> +   shift
> +-  # Used to flag and report bootstrapping failures.
> +-  am_rc=0
> +-  for am_mf
> ++  for mf
> +   do
> +     # Strip MF so we end up with the name of the file.
> +-    am_mf=`AS_ECHO(["$am_mf"]) | sed -e 's/:.*$//'`
> +-    # Check whether this is an Automake generated Makefile which includes
> +-    # dependency-tracking related rules and includes.
> +-    # Grep'ing the whole file directly is not great: AIX grep has a line
> ++    mf=`echo "$mf" | sed -e 's/:.*$//'`
> ++    # Check whether this is an Automake generated Makefile or not.
> ++    # We used to match only the files named 'Makefile.in', but
> ++    # some people rename them; so instead we look at the file content.
> ++    # Grep'ing the first line is not enough: some people post-process
> ++    # each Makefile.in and add a new line on top of each file to say so.
> ++    # Grep'ing the whole file is not good either: AIX grep has a line
> +     # limit of 2048, but all sed's we know have understand at least 4000.
> +-    sed -n 's,^am--depfiles:.*,X,p' "$am_mf" | grep X >/dev/null 2>&1 \
> +-      || continue
> +-    am_dirpart=`AS_DIRNAME(["$am_mf"])`
> +-    am_filepart=`AS_BASENAME(["$am_mf"])`
> +-    AM_RUN_LOG([cd "$am_dirpart" \
> +-      && sed -e '/# am--include-marker/d' "$am_filepart" \
> +-        | $MAKE -f - am--depfiles]) || am_rc=$?
> ++    if sed -n 's,^#.*generated by automake.*,X,p' "$mf" | grep X >/dev/null 2>&1; then
> ++      dirpart=`AS_DIRNAME("$mf")`
> ++    else
> ++      continue
> ++    fi
> ++    # Extract the definition of DEPDIR, am__include, and am__quote
> ++    # from the Makefile without running 'make'.
> ++    DEPDIR=`sed -n 's/^DEPDIR = //p' < "$mf"`
> ++    test -z "$DEPDIR" && continue
> ++    am__include=`sed -n 's/^am__include = //p' < "$mf"`
> ++    test -z "$am__include" && continue
> ++    am__quote=`sed -n 's/^am__quote = //p' < "$mf"`
> ++    # Find all dependency output files, they are included files with
> ++    # $(DEPDIR) in their names.  We invoke sed twice because it is the
> ++    # simplest approach to changing $(DEPDIR) to its actual value in the
> ++    # expansion.
> ++    for file in `sed -n "
> ++      s/^$am__include $am__quote\(.*(DEPDIR).*\)$am__quote"'$/\1/p' <"$mf" | \
> ++	 sed -e 's/\$(DEPDIR)/'"$DEPDIR"'/g'`; do
> ++      # Make sure the directory exists.
> ++      test -f "$dirpart/$file" && continue
> ++      fdir=`AS_DIRNAME(["$file"])`
> ++      AS_MKDIR_P([$dirpart/$fdir])
> ++      # echo "creating $dirpart/$file"
> ++      echo '# dummy' > "$dirpart/$file"
> ++    done
> +   done
> +-  if test $am_rc -ne 0; then
> +-    AC_MSG_FAILURE([Something went wrong bootstrapping makefile fragments
> +-    for automatic dependency tracking.  If GNU make was not used, consider
> +-    re-running the configure script with MAKE="gmake" (or whatever is
> +-    necessary).  You can also try re-running configure with the
> +-    '--disable-dependency-tracking' option to at least be able to build
> +-    the package (albeit without support for automatic dependency tracking).])
> +-  fi
> +-  AS_UNSET([am_dirpart])
> +-  AS_UNSET([am_filepart])
> +-  AS_UNSET([am_mf])
> +-  AS_UNSET([am_rc])
> +-  rm -f conftest-deps.mk
> + }
> + ])# _AM_OUTPUT_DEPENDENCY_COMMANDS
> + 
> +@@ -390,17 +397,18 @@ AC_DEFUN([_AM_OUTPUT_DEPENDENCY_COMMANDS],
> + # -----------------------------
> + # This macro should only be invoked once -- use via AC_REQUIRE.
> + #
> +-# This code is only required when automatic dependency tracking is enabled.
> +-# This creates each '.Po' and '.Plo' makefile fragment that we'll need in
> +-# order to bootstrap the dependency handling code.
> ++# This code is only required when automatic dependency tracking
> ++# is enabled.  FIXME.  This creates each '.P' file that we will
> ++# need in order to bootstrap the dependency handling code.
> + AC_DEFUN([AM_OUTPUT_DEPENDENCY_COMMANDS],
> + [AC_CONFIG_COMMANDS([depfiles],
> +      [test x"$AMDEP_TRUE" != x"" || _AM_OUTPUT_DEPENDENCY_COMMANDS],
> +-     [AMDEP_TRUE="$AMDEP_TRUE" MAKE="${MAKE-make}"])])
> ++     [AMDEP_TRUE="$AMDEP_TRUE" ac_aux_dir="$ac_aux_dir"])
> ++])
> + 
> + # Do all the work for Automake.                             -*- Autoconf -*-
> + 
> +-# Copyright (C) 1996-2021 Free Software Foundation, Inc.
> ++# Copyright (C) 1996-2017 Free Software Foundation, Inc.
> + #
> + # This file is free software; the Free Software Foundation
> + # gives unlimited permission to copy and/or distribute it,
> +@@ -428,10 +436,6 @@ m4_defn([AC_PROG_CC])
> + # release and drop the old call support.
> + AC_DEFUN([AM_INIT_AUTOMAKE],
> + [AC_PREREQ([2.65])dnl
> +-m4_ifdef([_$0_ALREADY_INIT],
> +-  [m4_fatal([$0 expanded multiple times
> +-]m4_defn([_$0_ALREADY_INIT]))],
> +-  [m4_define([_$0_ALREADY_INIT], m4_expansion_stack)])dnl
> + dnl Autoconf wants to disallow AM_ names.  We explicitly allow
> + dnl the ones we care about.
> + m4_pattern_allow([^AM_[A-Z]+FLAGS$])dnl
> +@@ -468,7 +472,7 @@ m4_ifval([$3], [_AM_SET_OPTION([no-define])])dnl
> + [_AM_SET_OPTIONS([$1])dnl
> + dnl Diagnose old-style AC_INIT with new-style AM_AUTOMAKE_INIT.
> + m4_if(
> +-  m4_ifset([AC_PACKAGE_NAME], [ok]):m4_ifset([AC_PACKAGE_VERSION], [ok]),
> ++  m4_ifdef([AC_PACKAGE_NAME], [ok]):m4_ifdef([AC_PACKAGE_VERSION], [ok]),
> +   [ok:ok],,
> +   [m4_fatal([AC_INIT should be called with package and version arguments])])dnl
> +  AC_SUBST([PACKAGE], ['AC_PACKAGE_TARNAME'])dnl
> +@@ -491,8 +495,8 @@ AC_REQUIRE([AM_PROG_INSTALL_STRIP])dnl
> + AC_REQUIRE([AC_PROG_MKDIR_P])dnl
> + # For better backward compatibility.  To be removed once Automake 1.9.x
> + # dies out for good.  For more background, see:
> +-# <https://lists.gnu.org/archive/html/automake/2012-07/msg00001.html>
> +-# <https://lists.gnu.org/archive/html/automake/2012-07/msg00014.html>
> ++# <http://lists.gnu.org/archive/html/automake/2012-07/msg00001.html>
> ++# <http://lists.gnu.org/archive/html/automake/2012-07/msg00014.html>
> + AC_SUBST([mkdir_p], ['$(MKDIR_P)'])
> + # We need awk for the "check" target (and possibly the TAP driver).  The
> + # system "awk" is bad on some platforms.
> +@@ -520,20 +524,6 @@ AC_PROVIDE_IFELSE([AC_PROG_OBJCXX],
> + 		  [m4_define([AC_PROG_OBJCXX],
> + 			     m4_defn([AC_PROG_OBJCXX])[_AM_DEPENDENCIES([OBJCXX])])])dnl
> + ])
> +-# Variables for tags utilities; see am/tags.am
> +-if test -z "$CTAGS"; then
> +-  CTAGS=ctags
> +-fi
> +-AC_SUBST([CTAGS])
> +-if test -z "$ETAGS"; then
> +-  ETAGS=etags
> +-fi
> +-AC_SUBST([ETAGS])
> +-if test -z "$CSCOPE"; then
> +-  CSCOPE=cscope
> +-fi
> +-AC_SUBST([CSCOPE])
> +-
> + AC_REQUIRE([AM_SILENT_RULES])dnl
> + dnl The testsuite driver may need to know about EXEEXT, so add the
> + dnl 'am__EXEEXT' conditional if _AM_COMPILER_EXEEXT was seen.  This
> +@@ -573,7 +563,7 @@ END
> + Aborting the configuration process, to ensure you take notice of the issue.
> + 
> + You can download and install GNU coreutils to get an 'rm' implementation
> +-that behaves properly: <https://www.gnu.org/software/coreutils/>.
> ++that behaves properly: <http://www.gnu.org/software/coreutils/>.
> + 
> + If you want to complete the configuration process using your problematic
> + 'rm' anyway, export the environment variable ACCEPT_INFERIOR_RM_PROGRAM
> +@@ -615,7 +605,7 @@ for _am_header in $config_headers :; do
> + done
> + echo "timestamp for $_am_arg" >`AS_DIRNAME(["$_am_arg"])`/stamp-h[]$_am_stamp_count])
> + 
> +-# Copyright (C) 2001-2021 Free Software Foundation, Inc.
> ++# Copyright (C) 2001-2017 Free Software Foundation, Inc.
> + #
> + # This file is free software; the Free Software Foundation
> + # gives unlimited permission to copy and/or distribute it,
> +@@ -639,7 +629,7 @@ AC_SUBST([install_sh])])
> + # Add --enable-maintainer-mode option to configure.         -*- Autoconf -*-
> + # From Jim Meyering
> + 
> +-# Copyright (C) 1996-2021 Free Software Foundation, Inc.
> ++# Copyright (C) 1996-2017 Free Software Foundation, Inc.
> + #
> + # This file is free software; the Free Software Foundation
> + # gives unlimited permission to copy and/or distribute it,
> +@@ -674,7 +664,7 @@ AC_MSG_CHECKING([whether to enable maintainer-specific portions of Makefiles])
> + 
> + # Check to see how 'make' treats includes.	            -*- Autoconf -*-
> + 
> +-# Copyright (C) 2001-2021 Free Software Foundation, Inc.
> ++# Copyright (C) 2001-2017 Free Software Foundation, Inc.
> + #
> + # This file is free software; the Free Software Foundation
> + # gives unlimited permission to copy and/or distribute it,
> +@@ -682,42 +672,49 @@ AC_MSG_CHECKING([whether to enable maintainer-specific portions of Makefiles])
> + 
> + # AM_MAKE_INCLUDE()
> + # -----------------
> +-# Check whether make has an 'include' directive that can support all
> +-# the idioms we need for our automatic dependency tracking code.
> ++# Check to see how make treats includes.
> + AC_DEFUN([AM_MAKE_INCLUDE],
> +-[AC_MSG_CHECKING([whether ${MAKE-make} supports the include directive])
> +-cat > confinc.mk << 'END'
> ++[am_make=${MAKE-make}
> ++cat > confinc << 'END'
> + am__doit:
> +-	@echo this is the am__doit target >confinc.out
> ++	@echo this is the am__doit target
> + .PHONY: am__doit
> + END
> ++# If we don't find an include directive, just comment out the code.
> ++AC_MSG_CHECKING([for style of include used by $am_make])
> + am__include="#"
> + am__quote=
> +-# BSD make does it like this.
> +-echo '.include "confinc.mk" # ignored' > confmf.BSD
> +-# Other make implementations (GNU, Solaris 10, AIX) do it like this.
> +-echo 'include confinc.mk # ignored' > confmf.GNU
> +-_am_result=no
> +-for s in GNU BSD; do
> +-  AM_RUN_LOG([${MAKE-make} -f confmf.$s && cat confinc.out])
> +-  AS_CASE([$?:`cat confinc.out 2>/dev/null`],
> +-      ['0:this is the am__doit target'],
> +-      [AS_CASE([$s],
> +-          [BSD], [am__include='.include' am__quote='"'],
> +-          [am__include='include' am__quote=''])])
> +-  if test "$am__include" != "#"; then
> +-    _am_result="yes ($s style)"
> +-    break
> +-  fi
> +-done
> +-rm -f confinc.* confmf.*
> +-AC_MSG_RESULT([${_am_result}])
> +-AC_SUBST([am__include])])
> +-AC_SUBST([am__quote])])
> ++_am_result=none
> ++# First try GNU make style include.
> ++echo "include confinc" > confmf
> ++# Ignore all kinds of additional output from 'make'.
> ++case `$am_make -s -f confmf 2> /dev/null` in #(
> ++*the\ am__doit\ target*)
> ++  am__include=include
> ++  am__quote=
> ++  _am_result=GNU
> ++  ;;
> ++esac
> ++# Now try BSD make style include.
> ++if test "$am__include" = "#"; then
> ++   echo '.include "confinc"' > confmf
> ++   case `$am_make -s -f confmf 2> /dev/null` in #(
> ++   *the\ am__doit\ target*)
> ++     am__include=.include
> ++     am__quote="\""
> ++     _am_result=BSD
> ++     ;;
> ++   esac
> ++fi
> ++AC_SUBST([am__include])
> ++AC_SUBST([am__quote])
> ++AC_MSG_RESULT([$_am_result])
> ++rm -f confinc confmf
> ++])
> + 
> + # Fake the existence of programs that GNU maintainers use.  -*- Autoconf -*-
> + 
> +-# Copyright (C) 1997-2021 Free Software Foundation, Inc.
> ++# Copyright (C) 1997-2017 Free Software Foundation, Inc.
> + #
> + # This file is free software; the Free Software Foundation
> + # gives unlimited permission to copy and/or distribute it,
> +@@ -738,7 +735,12 @@ AC_DEFUN([AM_MISSING_HAS_RUN],
> + [AC_REQUIRE([AM_AUX_DIR_EXPAND])dnl
> + AC_REQUIRE_AUX_FILE([missing])dnl
> + if test x"${MISSING+set}" != xset; then
> +-  MISSING="\${SHELL} '$am_aux_dir/missing'"
> ++  case $am_aux_dir in
> ++  *\ * | *\	*)
> ++    MISSING="\${SHELL} \"$am_aux_dir/missing\"" ;;
> ++  *)
> ++    MISSING="\${SHELL} $am_aux_dir/missing" ;;
> ++  esac
> + fi
> + # Use eval to expand $SHELL
> + if eval "$MISSING --is-lightweight"; then
> +@@ -751,7 +753,7 @@ fi
> + 
> + # Helper functions for option handling.                     -*- Autoconf -*-
> + 
> +-# Copyright (C) 2001-2021 Free Software Foundation, Inc.
> ++# Copyright (C) 2001-2017 Free Software Foundation, Inc.
> + #
> + # This file is free software; the Free Software Foundation
> + # gives unlimited permission to copy and/or distribute it,
> +@@ -780,7 +782,7 @@ AC_DEFUN([_AM_SET_OPTIONS],
> + AC_DEFUN([_AM_IF_OPTION],
> + [m4_ifset(_AM_MANGLE_OPTION([$1]), [$2], [$3])])
> + 
> +-# Copyright (C) 1999-2021 Free Software Foundation, Inc.
> ++# Copyright (C) 1999-2017 Free Software Foundation, Inc.
> + #
> + # This file is free software; the Free Software Foundation
> + # gives unlimited permission to copy and/or distribute it,
> +@@ -827,7 +829,7 @@ AC_LANG_POP([C])])
> + # For backward compatibility.
> + AC_DEFUN_ONCE([AM_PROG_CC_C_O], [AC_REQUIRE([AC_PROG_CC])])
> + 
> +-# Copyright (C) 2001-2021 Free Software Foundation, Inc.
> ++# Copyright (C) 2001-2017 Free Software Foundation, Inc.
> + #
> + # This file is free software; the Free Software Foundation
> + # gives unlimited permission to copy and/or distribute it,
> +@@ -846,7 +848,7 @@ AC_DEFUN([AM_RUN_LOG],
> + 
> + # Check to make sure that the build environment is sane.    -*- Autoconf -*-
> + 
> +-# Copyright (C) 1996-2021 Free Software Foundation, Inc.
> ++# Copyright (C) 1996-2017 Free Software Foundation, Inc.
> + #
> + # This file is free software; the Free Software Foundation
> + # gives unlimited permission to copy and/or distribute it,
> +@@ -927,7 +929,7 @@ AC_CONFIG_COMMANDS_PRE(
> + rm -f conftest.file
> + ])
> + 
> +-# Copyright (C) 2009-2021 Free Software Foundation, Inc.
> ++# Copyright (C) 2009-2017 Free Software Foundation, Inc.
> + #
> + # This file is free software; the Free Software Foundation
> + # gives unlimited permission to copy and/or distribute it,
> +@@ -987,7 +989,7 @@ AC_SUBST([AM_BACKSLASH])dnl
> + _AM_SUBST_NOTMAKE([AM_BACKSLASH])dnl
> + ])
> + 
> +-# Copyright (C) 2001-2021 Free Software Foundation, Inc.
> ++# Copyright (C) 2001-2017 Free Software Foundation, Inc.
> + #
> + # This file is free software; the Free Software Foundation
> + # gives unlimited permission to copy and/or distribute it,
> +@@ -1015,7 +1017,7 @@ fi
> + INSTALL_STRIP_PROGRAM="\$(install_sh) -c -s"
> + AC_SUBST([INSTALL_STRIP_PROGRAM])])
> + 
> +-# Copyright (C) 2006-2021 Free Software Foundation, Inc.
> ++# Copyright (C) 2006-2017 Free Software Foundation, Inc.
> + #
> + # This file is free software; the Free Software Foundation
> + # gives unlimited permission to copy and/or distribute it,
> +@@ -1034,7 +1036,7 @@ AC_DEFUN([AM_SUBST_NOTMAKE], [_AM_SUBST_NOTMAKE($@)])
> + 
> + # Check how to create a tarball.                            -*- Autoconf -*-
> + 
> +-# Copyright (C) 2004-2021 Free Software Foundation, Inc.
> ++# Copyright (C) 2004-2017 Free Software Foundation, Inc.
> + #
> + # This file is free software; the Free Software Foundation
> + # gives unlimited permission to copy and/or distribute it,
>  diff --git a/zlib/configure b/zlib/configure
> -index db7845c5d42..cd59daa39b5 100755
> +index 0a9ad9e8ccb..35b44e2819c 100755
>  --- a/zlib/configure
>  +++ b/zlib/configure
>  @@ -646,8 +646,11 @@ OTOOL
> @@ -23399,7 +29508,35 @@ index db7845c5d42..cd59daa39b5 100755
>   OBJDUMP
>   LN_S
>   NM
> -@@ -774,6 +777,7 @@ enable_static
> +@@ -666,6 +669,7 @@ am__nodep
> + AMDEPBACKSLASH
> + AMDEP_FALSE
> + AMDEP_TRUE
> ++am__quote
> + am__include
> + DEPDIR
> + OBJEXT
> +@@ -683,9 +687,6 @@ AM_BACKSLASH
> + AM_DEFAULT_VERBOSITY
> + AM_DEFAULT_V
> + AM_V
> +-CSCOPE
> +-ETAGS
> +-CTAGS
> + am__untar
> + am__tar
> + AMTAR
> +@@ -760,8 +761,7 @@ PACKAGE_VERSION
> + PACKAGE_TARNAME
> + PACKAGE_NAME
> + PATH_SEPARATOR
> +-SHELL
> +-am__quote'
> ++SHELL'
> + ac_subst_files=''
> + ac_user_opts='
> + enable_option_checking
> +@@ -777,6 +777,7 @@ enable_static
>   with_pic
>   enable_fast_install
>   with_gnu_ld
> @@ -23407,7 +29544,7 @@ index db7845c5d42..cd59daa39b5 100755
>   enable_libtool_lock
>   enable_host_shared
>   '
> -@@ -1428,6 +1432,8 @@ Optional Packages:
> +@@ -1431,6 +1432,8 @@ Optional Packages:
>     --with-pic              try to use only PIC/non-PIC objects [default=use
>                             both]
>     --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
> @@ -23416,7 +29553,150 @@ index db7845c5d42..cd59daa39b5 100755
>   
>   Some influential environment variables:
>     CC          C compiler command
> -@@ -4186,8 +4192,8 @@ esac
> +@@ -2417,7 +2420,7 @@ test -n "$target_alias" &&
> + mkinstalldirs="`cd $ac_aux_dir && ${PWDCMD-pwd}`/mkinstalldirs"
> + 
> + 
> +-am__api_version='1.16'
> ++am__api_version='1.15'
> + 
> + # Find a good install program.  We prefer a C program (faster),
> + # so one script is as good as another.  But avoid the broken or
> +@@ -2593,7 +2596,12 @@ program_transform_name=`$as_echo "$program_transform_name" | sed "$ac_script"`
> + am_aux_dir=`cd "$ac_aux_dir" && pwd`
> + 
> + if test x"${MISSING+set}" != xset; then
> +-  MISSING="\${SHELL} '$am_aux_dir/missing'"
> ++  case $am_aux_dir in
> ++  *\ * | *\	*)
> ++    MISSING="\${SHELL} \"$am_aux_dir/missing\"" ;;
> ++  *)
> ++    MISSING="\${SHELL} $am_aux_dir/missing" ;;
> ++  esac
> + fi
> + # Use eval to expand $SHELL
> + if eval "$MISSING --is-lightweight"; then
> +@@ -2928,8 +2936,8 @@ MAKEINFO=${MAKEINFO-"${am_missing_run}makeinfo"}
> + 
> + # For better backward compatibility.  To be removed once Automake 1.9.x
> + # dies out for good.  For more background, see:
> +-# <https://lists.gnu.org/archive/html/automake/2012-07/msg00001.html>
> +-# <https://lists.gnu.org/archive/html/automake/2012-07/msg00014.html>
> ++# <http://lists.gnu.org/archive/html/automake/2012-07/msg00001.html>
> ++# <http://lists.gnu.org/archive/html/automake/2012-07/msg00014.html>
> + mkdir_p='$(MKDIR_P)'
> + 
> + # We need awk for the "check" target (and possibly the TAP driver).  The
> +@@ -2948,20 +2956,6 @@ am__tar='$${TAR-tar} chof - "$$tardir"' am__untar='$${TAR-tar} xf -'
> + 
> + 
> + 
> +-# Variables for tags utilities; see am/tags.am
> +-if test -z "$CTAGS"; then
> +-  CTAGS=ctags
> +-fi
> +-
> +-if test -z "$ETAGS"; then
> +-  ETAGS=etags
> +-fi
> +-
> +-if test -z "$CSCOPE"; then
> +-  CSCOPE=cscope
> +-fi
> +-
> +-
> + 
> + # POSIX will say in a future version that running "rm -f" with no argument
> + # is OK; and we want to be able to make that assumption in our Makefile
> +@@ -2994,7 +2988,7 @@ END
> + Aborting the configuration process, to ensure you take notice of the issue.
> + 
> + You can download and install GNU coreutils to get an 'rm' implementation
> +-that behaves properly: <https://www.gnu.org/software/coreutils/>.
> ++that behaves properly: <http://www.gnu.org/software/coreutils/>.
> + 
> + If you want to complete the configuration process using your problematic
> + 'rm' anyway, export the environment variable ACCEPT_INFERIOR_RM_PROGRAM
> +@@ -3998,45 +3992,45 @@ DEPDIR="${am__leading_dot}deps"
> + 
> + ac_config_commands="$ac_config_commands depfiles"
> + 
> +-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking whether ${MAKE-make} supports the include directive" >&5
> +-$as_echo_n "checking whether ${MAKE-make} supports the include directive... " >&6; }
> +-cat > confinc.mk << 'END'
> ++
> ++am_make=${MAKE-make}
> ++cat > confinc << 'END'
> + am__doit:
> +-	@echo this is the am__doit target >confinc.out
> ++	@echo this is the am__doit target
> + .PHONY: am__doit
> + END
> ++# If we don't find an include directive, just comment out the code.
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for style of include used by $am_make" >&5
> ++$as_echo_n "checking for style of include used by $am_make... " >&6; }
> + am__include="#"
> + am__quote=
> +-# BSD make does it like this.
> +-echo '.include "confinc.mk" # ignored' > confmf.BSD
> +-# Other make implementations (GNU, Solaris 10, AIX) do it like this.
> +-echo 'include confinc.mk # ignored' > confmf.GNU
> +-_am_result=no
> +-for s in GNU BSD; do
> +-  { echo "$as_me:$LINENO: ${MAKE-make} -f confmf.$s && cat confinc.out" >&5
> +-   (${MAKE-make} -f confmf.$s && cat confinc.out) >&5 2>&5
> +-   ac_status=$?
> +-   echo "$as_me:$LINENO: \$? = $ac_status" >&5
> +-   (exit $ac_status); }
> +-  case $?:`cat confinc.out 2>/dev/null` in #(
> +-  '0:this is the am__doit target') :
> +-    case $s in #(
> +-  BSD) :
> +-    am__include='.include' am__quote='"' ;; #(
> +-  *) :
> +-    am__include='include' am__quote='' ;;
> +-esac ;; #(
> +-  *) :
> +-     ;;
> ++_am_result=none
> ++# First try GNU make style include.
> ++echo "include confinc" > confmf
> ++# Ignore all kinds of additional output from 'make'.
> ++case `$am_make -s -f confmf 2> /dev/null` in #(
> ++*the\ am__doit\ target*)
> ++  am__include=include
> ++  am__quote=
> ++  _am_result=GNU
> ++  ;;
> + esac
> +-  if test "$am__include" != "#"; then
> +-    _am_result="yes ($s style)"
> +-    break
> +-  fi
> +-done
> +-rm -f confinc.* confmf.*
> +-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: ${_am_result}" >&5
> +-$as_echo "${_am_result}" >&6; }
> ++# Now try BSD make style include.
> ++if test "$am__include" = "#"; then
> ++   echo '.include "confinc"' > confmf
> ++   case `$am_make -s -f confmf 2> /dev/null` in #(
> ++   *the\ am__doit\ target*)
> ++     am__include=.include
> ++     am__quote="\""
> ++     _am_result=BSD
> ++     ;;
> ++   esac
> ++fi
> ++
> ++
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $_am_result" >&5
> ++$as_echo "$_am_result" >&6; }
> ++rm -f confinc confmf
> + 
> + # Check whether --enable-dependency-tracking was given.
> + if test "${enable_dependency_tracking+set}" = set; then :
> +@@ -4198,8 +4192,8 @@ esac
>   
>   
>   
> @@ -23427,7 +29707,7 @@ index db7845c5d42..cd59daa39b5 100755
>   
>   
>   
> -@@ -4227,7 +4233,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> +@@ -4239,7 +4233,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
>   $as_echo_n "checking how to print strings... " >&6; }
>   # Test print first, because it will be a builtin if present.
> @@ -23436,7 +29716,7 @@ index db7845c5d42..cd59daa39b5 100755
>      test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
>     ECHO='print -r --'
>   elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
> -@@ -5044,8 +5050,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
> +@@ -5062,8 +5056,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
>   # Try some XSI features
>   xsi_shell=no
>   ( _lt_dummy="a/b/c"
> @@ -23447,7 +29727,7 @@ index db7845c5d42..cd59daa39b5 100755
>       && eval 'test $(( 1 + 1 )) -eq 2 \
>       && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
>     && xsi_shell=yes
> -@@ -5094,6 +5100,80 @@ esac
> +@@ -5112,6 +5106,80 @@ esac
>   
>   
>   
> @@ -23528,7 +29808,7 @@ index db7845c5d42..cd59daa39b5 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
>   $as_echo_n "checking for $LD option to reload object files... " >&6; }
>   if ${lt_cv_ld_reload_flag+:} false; then :
> -@@ -5110,6 +5190,11 @@ case $reload_flag in
> +@@ -5128,6 +5196,11 @@ case $reload_flag in
>   esac
>   reload_cmds='$LD$reload_flag -o $output$reload_objs'
>   case $host_os in
> @@ -23540,7 +29820,7 @@ index db7845c5d42..cd59daa39b5 100755
>     darwin*)
>       if test "$GCC" = yes; then
>         reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
> -@@ -5278,7 +5363,8 @@ mingw* | pw32*)
> +@@ -5296,7 +5369,8 @@ mingw* | pw32*)
>       lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
>       lt_cv_file_magic_cmd='func_win32_libid'
>     else
> @@ -23550,7 +29830,7 @@ index db7845c5d42..cd59daa39b5 100755
>       lt_cv_file_magic_cmd='$OBJDUMP -f'
>     fi
>     ;;
> -@@ -5432,6 +5518,21 @@ esac
> +@@ -5450,6 +5524,21 @@ esac
>   fi
>   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
>   $as_echo "$lt_cv_deplibs_check_method" >&6; }
> @@ -23572,7 +29852,7 @@ index db7845c5d42..cd59daa39b5 100755
>   file_magic_cmd=$lt_cv_file_magic_cmd
>   deplibs_check_method=$lt_cv_deplibs_check_method
>   test -z "$deplibs_check_method" && deplibs_check_method=unknown
> -@@ -5447,6 +5548,158 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
> +@@ -5465,6 +5554,158 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
>   
>   
>   
> @@ -23731,7 +30011,7 @@ index db7845c5d42..cd59daa39b5 100755
>   plugin_option=
>   plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
>   for plugin in $plugin_names; do
> -@@ -5461,8 +5714,10 @@ for plugin in $plugin_names; do
> +@@ -5479,8 +5720,10 @@ for plugin in $plugin_names; do
>   done
>   
>   if test -n "$ac_tool_prefix"; then
> @@ -23744,7 +30024,7 @@ index db7845c5d42..cd59daa39b5 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_AR+:} false; then :
> -@@ -5478,7 +5733,7 @@ do
> +@@ -5496,7 +5739,7 @@ do
>     test -z "$as_dir" && as_dir=.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -23753,7 +30033,7 @@ index db7845c5d42..cd59daa39b5 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -5498,11 +5753,15 @@ $as_echo "no" >&6; }
> +@@ -5516,11 +5759,15 @@ $as_echo "no" >&6; }
>   fi
>   
>   
> @@ -23772,7 +30052,7 @@ index db7845c5d42..cd59daa39b5 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_ac_ct_AR+:} false; then :
> -@@ -5518,7 +5777,7 @@ do
> +@@ -5536,7 +5783,7 @@ do
>     test -z "$as_dir" && as_dir=.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -23781,7 +30061,7 @@ index db7845c5d42..cd59daa39b5 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -5537,6 +5796,10 @@ else
> +@@ -5555,6 +5802,10 @@ else
>   $as_echo "no" >&6; }
>   fi
>   
> @@ -23792,7 +30072,7 @@ index db7845c5d42..cd59daa39b5 100755
>     if test "x$ac_ct_AR" = x; then
>       AR="false"
>     else
> -@@ -5548,25 +5811,19 @@ ac_tool_warned=yes ;;
> +@@ -5566,25 +5817,22 @@ ac_tool_warned=yes ;;
>   esac
>       AR=$ac_ct_AR
>     fi
> @@ -23824,10 +30104,13 @@ index db7845c5d42..cd59daa39b5 100755
>  +  rm -f conftest.*
>  +: ${AR=ar}
>  +: ${AR_FLAGS=cru}
> ++
> ++
> ++
>   
>   
>   
> -@@ -5578,6 +5835,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
> +@@ -5593,6 +5841,61 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
>   
>   
>   
> @@ -23886,13 +30169,10 @@ index db7845c5d42..cd59daa39b5 100755
>  +
>  +
>  +
> -+
> -+
> -+
> - if test -n "$ac_tool_prefix"; then
> -   # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
> - set dummy ${ac_tool_prefix}strip; ac_word=$2
> -@@ -5917,8 +6232,8 @@ esac
> + 
> + 
> + 
> +@@ -5935,8 +6238,8 @@ esac
>   lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
>   
>   # Transform an extracted symbol line into symbol name and symbol address
> @@ -23903,7 +30183,7 @@ index db7845c5d42..cd59daa39b5 100755
>   
>   # Handle CRLF in mingw tool chain
>   opt_cr=
> -@@ -5954,6 +6269,7 @@ for ac_symprfx in "" "_"; do
> +@@ -5972,6 +6275,7 @@ for ac_symprfx in "" "_"; do
>     else
>       lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
>     fi
> @@ -23911,7 +30191,7 @@ index db7845c5d42..cd59daa39b5 100755
>   
>     # Check to see that the pipe works correctly.
>     pipe_works=no
> -@@ -5995,6 +6311,18 @@ _LT_EOF
> +@@ -6013,6 +6317,18 @@ _LT_EOF
>         if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
>   	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
>   	  cat <<_LT_EOF > conftest.$ac_ext
> @@ -23930,7 +30210,7 @@ index db7845c5d42..cd59daa39b5 100755
>   #ifdef __cplusplus
>   extern "C" {
>   #endif
> -@@ -6006,7 +6334,7 @@ _LT_EOF
> +@@ -6024,7 +6340,7 @@ _LT_EOF
>   	  cat <<_LT_EOF >> conftest.$ac_ext
>   
>   /* The mapping between symbol names and symbols.  */
> @@ -23939,7 +30219,7 @@ index db7845c5d42..cd59daa39b5 100755
>     const char *name;
>     void       *address;
>   }
> -@@ -6032,8 +6360,8 @@ static const void *lt_preloaded_setup() {
> +@@ -6050,8 +6366,8 @@ static const void *lt_preloaded_setup() {
>   _LT_EOF
>   	  # Now try linking the two files.
>   	  mv conftest.$ac_objext conftstm.$ac_objext
> @@ -23950,7 +30230,7 @@ index db7845c5d42..cd59daa39b5 100755
>   	  LIBS="conftstm.$ac_objext"
>   	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
>   	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
> -@@ -6043,8 +6371,8 @@ _LT_EOF
> +@@ -6061,8 +6377,8 @@ _LT_EOF
>     test $ac_status = 0; } && test -s conftest${ac_exeext}; then
>   	    pipe_works=yes
>   	  fi
> @@ -23961,7 +30241,7 @@ index db7845c5d42..cd59daa39b5 100755
>   	else
>   	  echo "cannot find nm_test_func in $nlist" >&5
>   	fi
> -@@ -6081,6 +6409,17 @@ else
> +@@ -6099,6 +6415,16 @@ else
>   $as_echo "ok" >&6; }
>   fi
>   
> @@ -23975,11 +30255,10 @@ index db7845c5d42..cd59daa39b5 100755
>  +
>  +
>  +
> -+
>   
>   
>   
> -@@ -6098,6 +6437,43 @@ fi
> +@@ -6116,6 +6442,44 @@ fi
>   
>   
>   
> @@ -23988,6 +30267,7 @@ index db7845c5d42..cd59daa39b5 100755
>  +
>  +
>  +
> ++
>  +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
>  +$as_echo_n "checking for sysroot... " >&6; }
>  +
> @@ -24023,10 +30303,18 @@ index db7845c5d42..cd59daa39b5 100755
>   
>   
>   
> -@@ -6312,6 +6688,123 @@ esac
> - 
> - need_locks="$enable_libtool_lock"
> - 
> +@@ -6324,11 +6688,128 @@ sparc*-*solaris*)
> +       ;;
> +     esac
> +   fi
> +-  rm -rf conftest*
> +-  ;;
> ++  rm -rf conftest*
> ++  ;;
> ++esac
> ++
> ++need_locks="$enable_libtool_lock"
> ++
>  +if test -n "$ac_tool_prefix"; then
>  +  # Extract the first word of "${ac_tool_prefix}mt", so it can be a program name with args.
>  +set dummy ${ac_tool_prefix}mt; ac_word=$2
> @@ -24112,7 +30400,7 @@ index db7845c5d42..cd59daa39b5 100755
>  +{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
>  +$as_echo "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
>  +ac_tool_warned=yes ;;
> -+esac
> + esac
>  +    MANIFEST_TOOL=$ac_ct_MANIFEST_TOOL
>  +  fi
>  +else
> @@ -24142,12 +30430,12 @@ index db7845c5d42..cd59daa39b5 100755
>  +
>  +
>  +
> -+
> -+
> + 
> +-need_locks="$enable_libtool_lock"
> + 
>   
>     case $host_os in
> -     rhapsody* | darwin*)
> -@@ -6878,6 +7371,8 @@ _LT_EOF
> +@@ -6896,6 +7377,8 @@ _LT_EOF
>         $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
>         echo "$AR cru libconftest.a conftest.o" >&5
>         $AR cru libconftest.a conftest.o 2>&5
> @@ -24156,7 +30444,7 @@ index db7845c5d42..cd59daa39b5 100755
>         cat > conftest.c << _LT_EOF
>   int main() { return 0;}
>   _LT_EOF
> -@@ -7727,8 +8222,6 @@ fi
> +@@ -7745,8 +8228,6 @@ fi
>   lt_prog_compiler_pic=
>   lt_prog_compiler_static=
>   
> @@ -24165,7 +30453,7 @@ index db7845c5d42..cd59daa39b5 100755
>   
>     if test "$GCC" = yes; then
>       lt_prog_compiler_wl='-Wl,'
> -@@ -7894,6 +8387,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -7912,6 +8393,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>   	lt_prog_compiler_pic='--shared'
>   	lt_prog_compiler_static='--static'
>   	;;
> @@ -24178,7 +30466,7 @@ index db7845c5d42..cd59daa39b5 100755
>         pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
>           # Portland Group compilers (*not* the Pentium gcc compiler,
>   	# which looks to be a dead project)
> -@@ -7956,7 +8455,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -7974,7 +8461,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>         lt_prog_compiler_pic='-KPIC'
>         lt_prog_compiler_static='-Bstatic'
>         case $cc_basename in
> @@ -24187,7 +30475,7 @@ index db7845c5d42..cd59daa39b5 100755
>   	lt_prog_compiler_wl='-Qoption ld ';;
>         *)
>   	lt_prog_compiler_wl='-Wl,';;
> -@@ -8013,13 +8512,17 @@ case $host_os in
> +@@ -8031,13 +8518,17 @@ case $host_os in
>       lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
>       ;;
>   esac
> @@ -24211,7 +30499,7 @@ index db7845c5d42..cd59daa39b5 100755
>   
>   #
>   # Check to make sure the PIC flag actually works.
> -@@ -8080,6 +8583,11 @@ fi
> +@@ -8098,6 +8589,11 @@ fi
>   
>   
>   
> @@ -24223,7 +30511,7 @@ index db7845c5d42..cd59daa39b5 100755
>   #
>   # Check to make sure the static flag actually works.
>   #
> -@@ -8430,7 +8938,8 @@ _LT_EOF
> +@@ -8448,7 +8944,8 @@ _LT_EOF
>         allow_undefined_flag=unsupported
>         always_export_symbols=no
>         enable_shared_with_static_runtimes=yes
> @@ -24233,7 +30521,7 @@ index db7845c5d42..cd59daa39b5 100755
>   
>         if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
>           archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
> -@@ -8529,12 +9038,12 @@ _LT_EOF
> +@@ -8547,12 +9044,12 @@ _LT_EOF
>   	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
>   	  hardcode_libdir_flag_spec=
>   	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
> @@ -24248,7 +30536,7 @@ index db7845c5d42..cd59daa39b5 100755
>   	  fi
>   	  ;;
>   	esac
> -@@ -8548,8 +9057,8 @@ _LT_EOF
> +@@ -8566,8 +9063,8 @@ _LT_EOF
>   	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
>   	wlarc=
>         else
> @@ -24259,7 +30547,7 @@ index db7845c5d42..cd59daa39b5 100755
>         fi
>         ;;
>   
> -@@ -8567,8 +9076,8 @@ _LT_EOF
> +@@ -8585,8 +9082,8 @@ _LT_EOF
>   
>   _LT_EOF
>         elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -24270,7 +30558,7 @@ index db7845c5d42..cd59daa39b5 100755
>         else
>   	ld_shlibs=no
>         fi
> -@@ -8614,8 +9123,8 @@ _LT_EOF
> +@@ -8632,8 +9129,8 @@ _LT_EOF
>   
>       *)
>         if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -24281,7 +30569,7 @@ index db7845c5d42..cd59daa39b5 100755
>         else
>   	ld_shlibs=no
>         fi
> -@@ -8745,7 +9254,13 @@ _LT_EOF
> +@@ -8763,7 +9260,13 @@ _LT_EOF
>   	allow_undefined_flag='-berok'
>           # Determine the default libpath from the value encoded in an
>           # empty executable.
> @@ -24296,7 +30584,7 @@ index db7845c5d42..cd59daa39b5 100755
>     as_fn_error $? "Link tests are not allowed after GCC_NO_EXECUTABLES." "$LINENO" 5
>   fi
>   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> -@@ -8761,22 +9276,29 @@ main ()
> +@@ -8779,22 +9282,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>   
> @@ -24339,7 +30627,7 @@ index db7845c5d42..cd59daa39b5 100755
>   
>           hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>           archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> -@@ -8788,7 +9310,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8806,7 +9316,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	else
>   	 # Determine the default libpath from the value encoded in an
>   	 # empty executable.
> @@ -24354,7 +30642,7 @@ index db7845c5d42..cd59daa39b5 100755
>     as_fn_error $? "Link tests are not allowed after GCC_NO_EXECUTABLES." "$LINENO" 5
>   fi
>   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> -@@ -8804,22 +9332,29 @@ main ()
> +@@ -8822,22 +9338,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>   
> @@ -24397,7 +30685,7 @@ index db7845c5d42..cd59daa39b5 100755
>   
>   	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>   	  # Warning - without using the other run time loading flags,
> -@@ -8864,20 +9399,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8882,20 +9405,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>         # Microsoft Visual C++.
>         # hardcode_libdir_flag_spec is actually meaningless, as there is
>         # no search path for DLLs.
> @@ -24475,7 +30763,7 @@ index db7845c5d42..cd59daa39b5 100755
>         ;;
>   
>       darwin* | rhapsody*)
> -@@ -8938,7 +9516,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8956,7 +9522,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
>       freebsd* | dragonfly*)
> @@ -24484,7 +30772,7 @@ index db7845c5d42..cd59daa39b5 100755
>         hardcode_libdir_flag_spec='-R$libdir'
>         hardcode_direct=yes
>         hardcode_shlibpath_var=no
> -@@ -8946,7 +9524,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8964,7 +9530,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       hpux9*)
>         if test "$GCC" = yes; then
> @@ -24493,7 +30781,7 @@ index db7845c5d42..cd59daa39b5 100755
>         else
>   	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
>         fi
> -@@ -8962,7 +9540,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8980,7 +9546,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       hpux10*)
>         if test "$GCC" = yes && test "$with_gnu_ld" = no; then
> @@ -24502,7 +30790,7 @@ index db7845c5d42..cd59daa39b5 100755
>         else
>   	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
>         fi
> -@@ -8986,10 +9564,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9004,10 +9570,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
>   	  ;;
>   	ia64*)
> @@ -24515,7 +30803,7 @@ index db7845c5d42..cd59daa39b5 100755
>   	  ;;
>   	esac
>         else
> -@@ -9068,26 +9646,39 @@ fi
> +@@ -9086,26 +9652,39 @@ fi
>   
>       irix5* | irix6* | nonstopux*)
>         if test "$GCC" = yes; then
> @@ -24563,7 +30851,7 @@ index db7845c5d42..cd59daa39b5 100755
>         else
>   	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
>   	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
> -@@ -9172,7 +9763,7 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9190,7 +9769,7 @@ rm -f core conftest.err conftest.$ac_objext \
>       osf4* | osf5*)	# as osf3* with the addition of -msym flag
>         if test "$GCC" = yes; then
>   	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
> @@ -24572,7 +30860,7 @@ index db7845c5d42..cd59daa39b5 100755
>   	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
>         else
>   	allow_undefined_flag=' -expect_unresolved \*'
> -@@ -9191,9 +9782,9 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9209,9 +9788,9 @@ rm -f core conftest.err conftest.$ac_objext \
>         no_undefined_flag=' -z defs'
>         if test "$GCC" = yes; then
>   	wlarc='${wl}'
> @@ -24584,7 +30872,7 @@ index db7845c5d42..cd59daa39b5 100755
>         else
>   	case `$CC -V 2>&1` in
>   	*"Compilers 5.0"*)
> -@@ -9769,8 +10360,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -9787,8 +10366,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>     need_version=no
>     need_lib_prefix=no
>   
> @@ -24596,7 +30884,7 @@ index db7845c5d42..cd59daa39b5 100755
>       library_names_spec='$libname.dll.a'
>       # DLL is installed to $(libdir)/../bin by postinstall_cmds
>       postinstall_cmds='base_file=`basename \${file}`~
> -@@ -9803,13 +10395,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -9821,13 +10401,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>         library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>         ;;
>       esac
> @@ -24669,16 +30957,16 @@ index db7845c5d42..cd59daa39b5 100755
>     # FIXME: first we should search . and the directory the executable is in
>     shlibpath_var=PATH
>     ;;
> -@@ -10705,7 +11355,7 @@ else
> +@@ -10723,7 +11361,7 @@ else
>     lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>     lt_status=$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 10708 "configure"
> +-#line 10726 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>   
>   #if HAVE_DLFCN_H
> -@@ -10749,10 +11399,10 @@ else
> +@@ -10767,10 +11405,10 @@ else
>   /* When -fvisbility=hidden is used, assume the code has been annotated
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -24691,16 +30979,16 @@ index db7845c5d42..cd59daa39b5 100755
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -10811,7 +11461,7 @@ else
> +@@ -10829,7 +11467,7 @@ else
>     lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>     lt_status=$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 10814 "configure"
> +-#line 10832 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>   
>   #if HAVE_DLFCN_H
> -@@ -10855,10 +11505,10 @@ else
> +@@ -10873,10 +11511,10 @@ else
>   /* When -fvisbility=hidden is used, assume the code has been annotated
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -24713,7 +31001,16 @@ index db7845c5d42..cd59daa39b5 100755
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -12328,13 +12978,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
> +@@ -12308,7 +12946,7 @@ CC="$CC"
> + CXX="$CXX"
> + GFORTRAN="$GFORTRAN"
> + GDC="$GDC"
> +-AMDEP_TRUE="$AMDEP_TRUE" MAKE="${MAKE-make}"
> ++AMDEP_TRUE="$AMDEP_TRUE" ac_aux_dir="$ac_aux_dir"
> + 
> + 
> + # The HP-UX ksh and POSIX shell print the target directory to stdout
> +@@ -12346,13 +12984,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
>   lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>   lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>   lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -24734,7 +31031,7 @@ index db7845c5d42..cd59daa39b5 100755
>   STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>   RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>   old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
> -@@ -12349,14 +13006,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
> +@@ -12367,14 +13012,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
>   lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
> @@ -24753,7 +31050,7 @@ index db7845c5d42..cd59daa39b5 100755
>   DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>   NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>   LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -12389,12 +13049,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
> +@@ -12407,12 +13055,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
>   hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
>   inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
>   link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
> @@ -24767,7 +31064,7 @@ index db7845c5d42..cd59daa39b5 100755
>   file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
>   variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
>   need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
> -@@ -12449,8 +13109,13 @@ reload_flag \
> +@@ -12467,8 +13115,13 @@ reload_flag \
>   OBJDUMP \
>   deplibs_check_method \
>   file_magic_cmd \
> @@ -24781,7 +31078,7 @@ index db7845c5d42..cd59daa39b5 100755
>   STRIP \
>   RANLIB \
>   CC \
> -@@ -12460,12 +13125,14 @@ lt_cv_sys_global_symbol_pipe \
> +@@ -12478,12 +13131,14 @@ lt_cv_sys_global_symbol_pipe \
>   lt_cv_sys_global_symbol_to_cdecl \
>   lt_cv_sys_global_symbol_to_c_name_address \
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -24797,7 +31094,7 @@ index db7845c5d42..cd59daa39b5 100755
>   DSYMUTIL \
>   NMEDIT \
>   LIPO \
> -@@ -12481,7 +13148,6 @@ no_undefined_flag \
> +@@ -12499,7 +13154,6 @@ no_undefined_flag \
>   hardcode_libdir_flag_spec \
>   hardcode_libdir_flag_spec_ld \
>   hardcode_libdir_separator \
> @@ -24805,7 +31102,7 @@ index db7845c5d42..cd59daa39b5 100755
>   exclude_expsyms \
>   include_expsyms \
>   file_list_spec \
> -@@ -12517,6 +13183,7 @@ module_cmds \
> +@@ -12535,6 +13189,7 @@ module_cmds \
>   module_expsym_cmds \
>   export_symbols_cmds \
>   prelink_cmds \
> @@ -24813,7 +31110,149 @@ index db7845c5d42..cd59daa39b5 100755
>   postinstall_cmds \
>   postuninstall_cmds \
>   finish_cmds \
> -@@ -13115,7 +13782,8 @@ $as_echo X"$file" |
> +@@ -13023,35 +13678,29 @@ esac ;;
> +   # Older Autoconf quotes --file arguments for eval, but not when files
> +   # are listed without --file.  Let's play safe and only enable the eval
> +   # if we detect the quoting.
> +-  # TODO: see whether this extra hack can be removed once we start
> +-  # requiring Autoconf 2.70 or later.
> +-  case $CONFIG_FILES in #(
> +-  *\'*) :
> +-    eval set x "$CONFIG_FILES" ;; #(
> +-  *) :
> +-    set x $CONFIG_FILES ;; #(
> +-  *) :
> +-     ;;
> +-esac
> ++  case $CONFIG_FILES in
> ++  *\'*) eval set x "$CONFIG_FILES" ;;
> ++  *)   set x $CONFIG_FILES ;;
> ++  esac
> +   shift
> +-  # Used to flag and report bootstrapping failures.
> +-  am_rc=0
> +-  for am_mf
> ++  for mf
> +   do
> +     # Strip MF so we end up with the name of the file.
> +-    am_mf=`$as_echo "$am_mf" | sed -e 's/:.*$//'`
> +-    # Check whether this is an Automake generated Makefile which includes
> +-    # dependency-tracking related rules and includes.
> +-    # Grep'ing the whole file directly is not great: AIX grep has a line
> ++    mf=`echo "$mf" | sed -e 's/:.*$//'`
> ++    # Check whether this is an Automake generated Makefile or not.
> ++    # We used to match only the files named 'Makefile.in', but
> ++    # some people rename them; so instead we look at the file content.
> ++    # Grep'ing the first line is not enough: some people post-process
> ++    # each Makefile.in and add a new line on top of each file to say so.
> ++    # Grep'ing the whole file is not good either: AIX grep has a line
> +     # limit of 2048, but all sed's we know have understand at least 4000.
> +-    sed -n 's,^am--depfiles:.*,X,p' "$am_mf" | grep X >/dev/null 2>&1 \
> +-      || continue
> +-    am_dirpart=`$as_dirname -- "$am_mf" ||
> +-$as_expr X"$am_mf" : 'X\(.*[^/]\)//*[^/][^/]*/*$' \| \
> +-	 X"$am_mf" : 'X\(//\)[^/]' \| \
> +-	 X"$am_mf" : 'X\(//\)$' \| \
> +-	 X"$am_mf" : 'X\(/\)' \| . 2>/dev/null ||
> +-$as_echo X"$am_mf" |
> ++    if sed -n 's,^#.*generated by automake.*,X,p' "$mf" | grep X >/dev/null 2>&1; then
> ++      dirpart=`$as_dirname -- "$mf" ||
> ++$as_expr X"$mf" : 'X\(.*[^/]\)//*[^/][^/]*/*$' \| \
> ++	 X"$mf" : 'X\(//\)[^/]' \| \
> ++	 X"$mf" : 'X\(//\)$' \| \
> ++	 X"$mf" : 'X\(/\)' \| . 2>/dev/null ||
> ++$as_echo X"$mf" |
> +     sed '/^X\(.*[^/]\)\/\/*[^/][^/]*\/*$/{
> + 	    s//\1/
> + 	    q
> +@@ -13069,50 +13718,53 @@ $as_echo X"$am_mf" |
> + 	    q
> + 	  }
> + 	  s/.*/./; q'`
> +-    am_filepart=`$as_basename -- "$am_mf" ||
> +-$as_expr X/"$am_mf" : '.*/\([^/][^/]*\)/*$' \| \
> +-	 X"$am_mf" : 'X\(//\)$' \| \
> +-	 X"$am_mf" : 'X\(/\)' \| . 2>/dev/null ||
> +-$as_echo X/"$am_mf" |
> +-    sed '/^.*\/\([^/][^/]*\)\/*$/{
> ++    else
> ++      continue
> ++    fi
> ++    # Extract the definition of DEPDIR, am__include, and am__quote
> ++    # from the Makefile without running 'make'.
> ++    DEPDIR=`sed -n 's/^DEPDIR = //p' < "$mf"`
> ++    test -z "$DEPDIR" && continue
> ++    am__include=`sed -n 's/^am__include = //p' < "$mf"`
> ++    test -z "$am__include" && continue
> ++    am__quote=`sed -n 's/^am__quote = //p' < "$mf"`
> ++    # Find all dependency output files, they are included files with
> ++    # $(DEPDIR) in their names.  We invoke sed twice because it is the
> ++    # simplest approach to changing $(DEPDIR) to its actual value in the
> ++    # expansion.
> ++    for file in `sed -n "
> ++      s/^$am__include $am__quote\(.*(DEPDIR).*\)$am__quote"'$/\1/p' <"$mf" | \
> ++	 sed -e 's/\$(DEPDIR)/'"$DEPDIR"'/g'`; do
> ++      # Make sure the directory exists.
> ++      test -f "$dirpart/$file" && continue
> ++      fdir=`$as_dirname -- "$file" ||
> ++$as_expr X"$file" : 'X\(.*[^/]\)//*[^/][^/]*/*$' \| \
> ++	 X"$file" : 'X\(//\)[^/]' \| \
> ++	 X"$file" : 'X\(//\)$' \| \
> ++	 X"$file" : 'X\(/\)' \| . 2>/dev/null ||
> ++$as_echo X"$file" |
> ++    sed '/^X\(.*[^/]\)\/\/*[^/][^/]*\/*$/{
> + 	    s//\1/
> + 	    q
> + 	  }
> +-	  /^X\/\(\/\/\)$/{
> ++	  /^X\(\/\/\)[^/].*/{
> + 	    s//\1/
> + 	    q
> + 	  }
> +-	  /^X\/\(\/\).*/{
> ++	  /^X\(\/\/\)$/{
> ++	    s//\1/
> ++	    q
> ++	  }
> ++	  /^X\(\/\).*/{
> + 	    s//\1/
> + 	    q
> + 	  }
> + 	  s/.*/./; q'`
> +-    { echo "$as_me:$LINENO: cd "$am_dirpart" \
> +-      && sed -e '/# am--include-marker/d' "$am_filepart" \
> +-        | $MAKE -f - am--depfiles" >&5
> +-   (cd "$am_dirpart" \
> +-      && sed -e '/# am--include-marker/d' "$am_filepart" \
> +-        | $MAKE -f - am--depfiles) >&5 2>&5
> +-   ac_status=$?
> +-   echo "$as_me:$LINENO: \$? = $ac_status" >&5
> +-   (exit $ac_status); } || am_rc=$?
> ++      as_dir=$dirpart/$fdir; as_fn_mkdir_p
> ++      # echo "creating $dirpart/$file"
> ++      echo '# dummy' > "$dirpart/$file"
> ++    done
> +   done
> +-  if test $am_rc -ne 0; then
> +-    { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
> +-$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
> +-as_fn_error $? "Something went wrong bootstrapping makefile fragments
> +-    for automatic dependency tracking.  If GNU make was not used, consider
> +-    re-running the configure script with MAKE=\"gmake\" (or whatever is
> +-    necessary).  You can also try re-running configure with the
> +-    '--disable-dependency-tracking' option to at least be able to build
> +-    the package (albeit without support for automatic dependency tracking).
> +-See \`config.log' for more details" "$LINENO" 5; }
> +-  fi
> +-  { am_dirpart=; unset am_dirpart;}
> +-  { am_filepart=; unset am_filepart;}
> +-  { am_mf=; unset am_mf;}
> +-  { am_rc=; unset am_rc;}
> +-  rm -f conftest-deps.mk
> + }
> +  ;;
> +     "libtool":C)
> +@@ -13136,7 +13788,8 @@ See \`config.log' for more details" "$LINENO" 5; }
>   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>   #
>   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -24823,7 +31262,7 @@ index db7845c5d42..cd59daa39b5 100755
>   #   Written by Gordon Matzigkeit, 1996
>   #
>   #   This file is part of GNU Libtool.
> -@@ -13218,19 +13886,42 @@ SP2NL=$lt_lt_SP2NL
> +@@ -13239,19 +13892,42 @@ SP2NL=$lt_lt_SP2NL
>   # turn newlines into spaces.
>   NL2SP=$lt_lt_NL2SP
>   
> @@ -24867,7 +31306,7 @@ index db7845c5d42..cd59daa39b5 100755
>   # A symbol stripping program.
>   STRIP=$lt_STRIP
>   
> -@@ -13260,6 +13951,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
> +@@ -13281,6 +13957,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
>   # Transform the output of nm in a C name address pair when lib prefix is needed.
>   global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
>   
> @@ -24880,7 +31319,7 @@ index db7845c5d42..cd59daa39b5 100755
>   # The name of the directory that contains temporary libtool files.
>   objdir=$objdir
>   
> -@@ -13269,6 +13966,9 @@ MAGIC_CMD=$MAGIC_CMD
> +@@ -13290,6 +13972,9 @@ MAGIC_CMD=$MAGIC_CMD
>   # Must we lock files when doing compilation?
>   need_locks=$lt_need_locks
>   
> @@ -24890,7 +31329,7 @@ index db7845c5d42..cd59daa39b5 100755
>   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>   DSYMUTIL=$lt_DSYMUTIL
>   
> -@@ -13383,12 +14083,12 @@ with_gcc=$GCC
> +@@ -13404,12 +14089,12 @@ with_gcc=$GCC
>   # Compiler flag to turn off builtin functions.
>   no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
>   
> @@ -24906,7 +31345,7 @@ index db7845c5d42..cd59daa39b5 100755
>   # Compiler flag to prevent dynamic linking.
>   link_static_flag=$lt_lt_prog_compiler_static
>   
> -@@ -13475,9 +14175,6 @@ inherit_rpath=$inherit_rpath
> +@@ -13496,9 +14181,6 @@ inherit_rpath=$inherit_rpath
>   # Whether libtool must link a program against all its dependency libraries.
>   link_all_deplibs=$link_all_deplibs
>   
> @@ -24916,7 +31355,7 @@ index db7845c5d42..cd59daa39b5 100755
>   # Set to "yes" if exported symbols are required.
>   always_export_symbols=$always_export_symbols
>   
> -@@ -13493,6 +14190,9 @@ include_expsyms=$lt_include_expsyms
> +@@ -13514,6 +14196,9 @@ include_expsyms=$lt_include_expsyms
>   # Commands necessary for linking programs (against libraries) with templates.
>   prelink_cmds=$lt_prelink_cmds
>   
> @@ -24926,7 +31365,7 @@ index db7845c5d42..cd59daa39b5 100755
>   # Specify filename containing input files.
>   file_list_spec=$lt_file_list_spec
>   
> -@@ -13525,210 +14225,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
> +@@ -13546,210 +14231,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
>     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>     # text mode, it properly converts lines to CR/LF.  This bash problem
>     # is reportedly fixed, but why not run on old versions too?
> diff --git a/meta/recipes-devtools/binutils/binutils/0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch b/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
> similarity index 96%
> rename from meta/recipes-devtools/binutils/binutils/0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
> rename to meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
> index 217ba5df85..2c4ffec4e6 100644
> --- a/meta/recipes-devtools/binutils/binutils/0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
> @@ -1,4 +1,4 @@
> -From 1c4581a059afe2799bb825b388ae92f8fa6f19a3 Mon Sep 17 00:00:00 2001
> +From 98410efc334e31ccfbdc0080fb293b0e06885454 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 2 Mar 2015 01:42:38 +0000
>  Subject: [PATCH] Fix rpath in libtool when sysroot is enabled
> diff --git a/meta/recipes-devtools/binutils/binutils/0011-sync-with-OE-libtool-changes.patch b/meta/recipes-devtools/binutils/binutils/0010-sync-with-OE-libtool-changes.patch
> similarity index 97%
> rename from meta/recipes-devtools/binutils/binutils/0011-sync-with-OE-libtool-changes.patch
> rename to meta/recipes-devtools/binutils/binutils/0010-sync-with-OE-libtool-changes.patch
> index 3607e36ef4..199aafcaee 100644
> --- a/meta/recipes-devtools/binutils/binutils/0011-sync-with-OE-libtool-changes.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0010-sync-with-OE-libtool-changes.patch
> @@ -1,4 +1,4 @@
> -From d71c715554a054c534954b0aa357ca699ed68430 Mon Sep 17 00:00:00 2001
> +From 84fc4ceafcbfad4c6ddc9d65f6a425bd62dd062e Mon Sep 17 00:00:00 2001
>  From: Ross Burton <ross.burton@intel.com>
>  Date: Mon, 6 Mar 2017 23:33:27 -0800
>  Subject: [PATCH] sync with OE libtool changes
> diff --git a/meta/recipes-devtools/binutils/binutils/0012-Check-for-clang-before-checking-gcc-version.patch b/meta/recipes-devtools/binutils/binutils/0011-Check-for-clang-before-checking-gcc-version.patch
> similarity index 84%
> rename from meta/recipes-devtools/binutils/binutils/0012-Check-for-clang-before-checking-gcc-version.patch
> rename to meta/recipes-devtools/binutils/binutils/0011-Check-for-clang-before-checking-gcc-version.patch
> index 8848c05ae0..f75ec2ee9d 100644
> --- a/meta/recipes-devtools/binutils/binutils/0012-Check-for-clang-before-checking-gcc-version.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0011-Check-for-clang-before-checking-gcc-version.patch
> @@ -1,4 +1,4 @@
> -From 787d7cd71d7886d3193c0fd747101c54ad7c3cd8 Mon Sep 17 00:00:00 2001
> +From 628c10087e6e11a7bc748437c5b695835b704aaf Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 15 Apr 2020 14:17:20 -0700
>  Subject: [PATCH] Check for clang before checking gcc version
> @@ -18,10 +18,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   2 files changed, 2 insertions(+), 2 deletions(-)
>  
>  diff --git a/configure b/configure
> -index 6a1da1665d8..916656dc233 100755
> +index be433ef6d5d..7494fbd2f06 100755
>  --- a/configure
>  +++ b/configure
> -@@ -5287,7 +5287,7 @@ ac_compiler_gnu=$ac_cv_cxx_compiler_gnu
> +@@ -5294,7 +5294,7 @@ ac_compiler_gnu=$ac_cv_cxx_compiler_gnu
>   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
>   /* end confdefs.h.  */
>   
> @@ -31,10 +31,10 @@ index 6a1da1665d8..916656dc233 100755
>   #endif
>   int main() {}
>  diff --git a/configure.ac b/configure.ac
> -index 2b10e9a1b02..677a0196c2b 100644
> +index 1651cbf3b02..2e2ecc47542 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -1309,7 +1309,7 @@ if test "$GCC" = yes; then
> +@@ -1323,7 +1323,7 @@ if test "$GCC" = yes; then
>     AC_MSG_CHECKING([whether g++ accepts -static-libstdc++ -static-libgcc])
>     AC_LANG_PUSH(C++)
>     AC_LINK_IFELSE([AC_LANG_SOURCE([
> diff --git a/meta/recipes-devtools/binutils/binutils/0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch b/meta/recipes-devtools/binutils/binutils/0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
> similarity index 70%
> rename from meta/recipes-devtools/binutils/binutils/0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
> rename to meta/recipes-devtools/binutils/binutils/0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
> index 997774020e..c4b4198910 100644
> --- a/meta/recipes-devtools/binutils/binutils/0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
> @@ -1,6 +1,6 @@
> -From edddb1f294d667eac94649ba0665fe464990ed18 Mon Sep 17 00:00:00 2001
> +From 63157cb403b6aa13147840c036a8555c4ea9c166 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
> -Date: Mon, 2 Mar 2015 01:27:17 +0000
> +Date: Thu, 10 Mar 2022 21:21:33 -0800
>  Subject: [PATCH] Only generate an RPATH entry if LD_RUN_PATH is not empty
>  
>  for cases where -rpath isn't specified. debian (#151024)
> @@ -10,23 +10,24 @@ Upstream-Status: Pending
>  Signed-off-by: Chris Chimelis <chris@debian.org>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> - ld/ldelf.c | 4 ++++
> - 1 file changed, 4 insertions(+)
> + ld/ldelf.c | 5 +++++
> + 1 file changed, 5 insertions(+)
>  
>  diff --git a/ld/ldelf.c b/ld/ldelf.c
> -index 34cbc60e5e9..b1965a9e96f 100644
> +index 0d61a3209ec..cd0da2013e2 100644
>  --- a/ld/ldelf.c
>  +++ b/ld/ldelf.c
> -@@ -1277,6 +1277,8 @@ ldelf_after_open (int use_libpath, int native, int is_linux, int is_freebsd,
> +@@ -1127,6 +1127,9 @@ ldelf_handle_dt_needed (struct elf_link_hash_table *htab,
>   		  && command_line.rpath == NULL)
>   		{
>   		  path = (const char *) getenv ("LD_RUN_PATH");
>  +		  if ((path) && (strlen (path) == 0))
> -+		      path = NULL;
> ++		    path = NULL;
> ++
>   		  if (path
>   		      && ldelf_search_needed (path, &n, force,
>   					      is_linux, elfsize))
> -@@ -1636,6 +1638,8 @@ ldelf_before_allocation (char *audit, char *depaudit,
> +@@ -1801,6 +1804,8 @@ ldelf_before_allocation (char *audit, char *depaudit,
>     rpath = command_line.rpath;
>     if (rpath == NULL)
>       rpath = (const char *) getenv ("LD_RUN_PATH");
> diff --git a/meta/recipes-devtools/binutils/binutils/0013-Avoid-as-info-race-condition.patch b/meta/recipes-devtools/binutils/binutils/0013-Avoid-as-info-race-condition.patch
> deleted file mode 100644
> index 3b3d0bb769..0000000000
> --- a/meta/recipes-devtools/binutils/binutils/0013-Avoid-as-info-race-condition.patch
> +++ /dev/null
> @@ -1,75 +0,0 @@
> -From 9a84a44d5df4618dd616137fa755bd71b7eacc5f Mon Sep 17 00:00:00 2001
> -From: Mike Frysinger <vapier@gentoo.org>
> -Date: Sun, 23 Jan 2022 12:44:24 -0500
> -Subject: [PATCH] gas: drop old cygnus install hack
> -
> -This was needed when gas was using the automake cygnus option, but
> -this was removed years ago by Simon in d0ac1c44885daf68f631befa37e
> -("Bump to autoconf 2.69 and automake 1.15.1").  So delete it here.
> -The info pages are already & still installed by default w/out it.
> -
> -Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=9a84a44d5df4618dd616137fa755bd71b7eacc5f]
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - gas/Makefile.in  | 14 +++++---------
> - gas/doc/local.mk |  4 ----
> - 2 files changed, 5 insertions(+), 13 deletions(-)
> -
> -diff --git a/gas/Makefile.in b/gas/Makefile.in
> -index 8f0a56fd8d6..67dac53f68c 100644
> ---- a/gas/Makefile.in
> -+++ b/gas/Makefile.in
> -@@ -1854,7 +1854,7 @@ info: info-recursive
> - 
> - info-am: $(INFO_DEPS) info-local
> - 
> --install-data-am: install-data-local install-info-am install-man
> -+install-data-am: install-info-am install-man
> - 
> - install-dvi: install-dvi-recursive
> - 
> -@@ -2008,10 +2008,10 @@ uninstall-man: uninstall-man1
> - 	distclean-DEJAGNU distclean-compile distclean-generic \
> - 	distclean-hdr distclean-libtool distclean-tags dvi dvi-am html \
> - 	html-am html-local info info-am info-local install install-am \
> --	install-data install-data-am install-data-local install-dvi \
> --	install-dvi-am install-exec install-exec-am install-exec-local \
> --	install-html install-html-am install-info install-info-am \
> --	install-man install-man1 install-pdf install-pdf-am install-ps \
> -+	install-data install-data-am install-dvi install-dvi-am \
> -+	install-exec install-exec-am install-exec-local install-html \
> -+	install-html-am install-info install-info-am install-man \
> -+	install-man1 install-pdf install-pdf-am install-ps \
> - 	install-ps-am install-strip installcheck installcheck-am \
> - 	installdirs installdirs-am maintainer-clean \
> - 	maintainer-clean-aminfo maintainer-clean-generic mostlyclean \
> -@@ -2211,10 +2211,6 @@ doc/asconfig.texi: doc/$(CONFIG).texi doc/$(am__dirstamp)
> - 	$(AM_V_GEN)cp $(srcdir)/doc/$(CONFIG).texi doc/asconfig.texi
> - 	$(AM_V_at)chmod u+w doc/asconfig.texi
> - 
> --# We want install to imply install-info as per GNU standards, despite the
> --# cygnus option.
> --install-data-local: install-info
> --
> - # Maintenance
> - 
> - # We need it for the taz target in ../Makefile.in.
> -diff --git a/gas/doc/local.mk b/gas/doc/local.mk
> -index c2de441257c..ac205cf08a2 100644
> ---- a/gas/doc/local.mk
> -+++ b/gas/doc/local.mk
> -@@ -101,10 +101,6 @@ CPU_DOCS = \
> - 	%D%/c-z80.texi \
> - 	%D%/c-z8k.texi
> - 
> --# We want install to imply install-info as per GNU standards, despite the
> --# cygnus option.
> --install-data-local: install-info
> --
> - # This one isn't ready for prime time yet.  Not even a little bit.
> - 
> - noinst_TEXINFOS = %D%/internals.texi
> --- 
> -2.27.0
> -
> diff --git a/meta/recipes-devtools/binutils/binutils/0014-CVE-2019-1010204.patch b/meta/recipes-devtools/binutils/binutils/0014-CVE-2019-1010204.patch
> deleted file mode 100644
> index dad4a62038..0000000000
> --- a/meta/recipes-devtools/binutils/binutils/0014-CVE-2019-1010204.patch
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -From 2a4fc266dbf77ed7ab83da16468e9ba627b8bc2d Mon Sep 17 00:00:00 2001
> -From: Nick Clifton <nickc@redhat.com>
> -Date: Mon, 27 Jun 2022 13:07:40 +0100
> -Subject: [PATCH] Have gold's File_read::do_read() function check the start
> - parameter
> -
> -	PR 23765
> -	* fileread.cc (File_read::do_read): Check start parameter before
> -	computing number of bytes to read.
> -
> -Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=2a4fc266dbf77ed7ab83da16468e9ba627b8bc2d]
> -
> -Signed-off-by: Pgowda <pgowda.cve@gmail.com>
> ----
> - gold/ChangeLog   | 6 ++++++
> - gold/fileread.cc | 6 ++++++
> - 2 files changed, 12 insertions(+)
> -
> -diff --git a/gold/ChangeLog b/gold/ChangeLog
> -index 5103dab7b67..8557dc6db7f 100644
> ---- a/gold/ChangeLog
> -+++ b/gold/ChangeLog
> -@@ -1,3 +1,9 @@
> -+2022-06-27  Nick Clifton  <nickc@redhat.com>
> -+
> -+	PR 23765
> -+	* fileread.cc (File_read::do_read): Check start parameter before
> -+	computing number of bytes to read.
> -+
> - 2022-02-17  Nick Clifton  <nickc@redhat.com>
> - 
> - 	* po/sr.po: Updated Serbian translation.
> -diff --git a/gold/fileread.cc b/gold/fileread.cc
> -index 2b653f78c2e..af2df215468 100644
> ---- a/gold/fileread.cc
> -+++ b/gold/fileread.cc
> -@@ -385,6 +385,12 @@ File_read::do_read(off_t start, section_
> -   ssize_t bytes;
> -   if (this->whole_file_view_ != NULL)
> -     {
> -+      // See PR 23765 for an example of a testcase that triggers this error.
> -+      if (((ssize_t) start) < 0)
> -+	gold_fatal(_("%s: read failed, starting offset (%#llx) less than zero"),
> -+		   this->filename().c_str(),
> -+		   static_cast<long long>(start));
> -+	
> -       bytes = this->size_ - start;
> -       if (static_cast<section_size_type>(bytes) >= size)
> - 	{
> diff --git a/meta/recipes-devtools/binutils/binutils_2.38.bb b/meta/recipes-devtools/binutils/binutils_2.39.bb
> similarity index 100%
> rename from meta/recipes-devtools/binutils/binutils_2.38.bb
> rename to meta/recipes-devtools/binutils/binutils_2.39.bb
> -- 
> 2.37.2
> 

> 
> 
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

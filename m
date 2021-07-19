Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.908.1626717616620262504
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jul 2021 11:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 1DEEB24000B;
	Mon, 19 Jul 2021 18:00:13 +0000 (UTC)
Date: Mon, 19 Jul 2021 20:00:13 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] binutils: Upgrade to 2.37 branch
Message-ID: <YPW9rZQoVh10TNda@piout.net>
References: <20210719042203.866762-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210719042203.866762-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Khem,


On 18/07/2021 21:22:03-0700, Khem Raj wrote:
> This is next/latest release branch for binutils
> Drop backports and CVE fixes which already are applied upstream
> 
> bfd_stdint.h has been removed in favor of using stdint.h
> 

This resulted in the following failures:

meta-mingw:
https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/3704/steps/12/logs/stdio

no-x11:
https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/3698/steps/14/logs/stdio

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc   |    2 +-
>  .../{binutils-2.36.inc => binutils-2.37.inc}  |   11 +-
>  ....36.bb => binutils-cross-canadian_2.37.bb} |    0
>  ...36.bb => binutils-cross-testsuite_2.37.bb} |    4 -
>  ...s-cross_2.36.bb => binutils-cross_2.37.bb} |    0
>  ...ssdk_2.36.bb => binutils-crosssdk_2.37.bb} |    0
>  meta/recipes-devtools/binutils/binutils.inc   |    2 -
>  ...s-crosssdk-Generate-relocatable-SDKs.patch |    2 +-
>  ...o-not-generate-linker-script-directo.patch |    2 +-
>  ...dk-Search-for-alternative-ld.so.conf.patch |   14 +-
>  ...iden-the-regexp-for-SH-architectures.patch |   10 +-
>  ...005-Point-scripts-location-to-libdir.patch |    8 +-
>  ...-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch |    8 +-
>  ...stro-compiler-point-to-the-wrong-ins.patch |    4 +-
>  ...-system-directories-when-cross-linki.patch |   84 +-
>  ...e-default-emulation-for-mips64-linux.patch |   10 +-
>  .../0010-Add-support-for-Netlogic-XLP.patch   |  119 +-
>  ...ect-assembling-for-ppc-wait-mnemonic.patch |   16 +-
>  .../0012-Detect-64-bit-MIPS-targets.patch     |    2 +-
>  .../binutils/0013-Use-libtool-2.4.patch       | 2017 +++++++++--------
>  ...h-in-libtool-when-sysroot-is-enabled.patch |    2 +-
>  .../0015-sync-with-OE-libtool-changes.patch   |    2 +-
>  ...or-clang-before-checking-gcc-version.patch |   10 +-
>  ...the-DW_FORM_strx-forms-to-the-BFD-li.patch |  183 --
>  .../0018-Add-DWARF-5-support-in-gold.patch    | 1374 -----------
>  .../binutils/binutils/CVE-2021-20197.patch    |  388 ----
>  .../{binutils_2.36.bb => binutils_2.37.bb}    |    0
>  27 files changed, 1281 insertions(+), 2993 deletions(-)
>  rename meta/recipes-devtools/binutils/{binutils-2.36.inc => binutils-2.37.inc} (85%)
>  rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.36.bb => binutils-cross-canadian_2.37.bb} (100%)
>  rename meta/recipes-devtools/binutils/{binutils-cross-testsuite_2.36.bb => binutils-cross-testsuite_2.37.bb} (94%)
>  rename meta/recipes-devtools/binutils/{binutils-cross_2.36.bb => binutils-cross_2.37.bb} (100%)
>  rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.36.bb => binutils-crosssdk_2.37.bb} (100%)
>  delete mode 100644 meta/recipes-devtools/binutils/binutils/0017-Add-support-for-the-DW_FORM_strx-forms-to-the-BFD-li.patch
>  delete mode 100644 meta/recipes-devtools/binutils/binutils/0018-Add-DWARF-5-support-in-gold.patch
>  delete mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2021-20197.patch
>  rename meta/recipes-devtools/binutils/{binutils_2.36.bb => binutils_2.37.bb} (100%)
> 
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> index 55a0abe69d..31e54e824b 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -18,7 +18,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
>  
>  GCCVERSION ?= "11.%"
>  SDKGCCVERSION ?= "${GCCVERSION}"
> -BINUVERSION ?= "2.36%"
> +BINUVERSION ?= "2.37%"
>  GDBVERSION ?= "10.%"
>  GLIBCVERSION ?= "2.34"
>  LINUXLIBCVERSION ?= "5.13%"
> diff --git a/meta/recipes-devtools/binutils/binutils-2.36.inc b/meta/recipes-devtools/binutils/binutils-2.37.inc
> similarity index 85%
> rename from meta/recipes-devtools/binutils/binutils-2.36.inc
> rename to meta/recipes-devtools/binutils/binutils-2.37.inc
> index d54e2a3457..99bbd5370e 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.36.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.37.inc
> @@ -12,13 +12,13 @@ LIC_FILES_CHKSUM="\
>  
>  # When upgrading to 2.37, please make sure there is no trailing .0, so
>  # that upstream version check can work correctly.
> -PV = "2.36.1"
> -CVE_VERSION = "2.36.1"
> -SRCBRANCH ?= "binutils-2_36-branch"
> +PV = "2.37"
> +CVE_VERSION = "2.37"
> +SRCBRANCH ?= "binutils-2_37-branch"
>  
>  UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
>  
> -SRCREV ?= "7651a4871c225925ffdfda0a8c91a6ed370cd9a1"
> +SRCREV ?= "bebfdeb46ddfce80bca9fd23a0261501f87bc892"
>  BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=git"
>  SRC_URI = "\
>       ${BINUTILS_GIT_URI} \
> @@ -35,8 +35,5 @@ SRC_URI = "\
>       file://0014-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch \
>       file://0015-sync-with-OE-libtool-changes.patch \
>       file://0016-Check-for-clang-before-checking-gcc-version.patch \
> -     file://0017-Add-support-for-the-DW_FORM_strx-forms-to-the-BFD-li.patch \
> -     file://0018-Add-DWARF-5-support-in-gold.patch \
> -     file://CVE-2021-20197.patch \
>  "
>  S  = "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.36.bb b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.37.bb
> similarity index 100%
> rename from meta/recipes-devtools/binutils/binutils-cross-canadian_2.36.bb
> rename to meta/recipes-devtools/binutils/binutils-cross-canadian_2.37.bb
> diff --git a/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.36.bb b/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.37.bb
> similarity index 94%
> rename from meta/recipes-devtools/binutils/binutils-cross-testsuite_2.36.bb
> rename to meta/recipes-devtools/binutils/binutils-cross-testsuite_2.37.bb
> index 07a8e7c417..ca99e91130 100644
> --- a/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.36.bb
> +++ b/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.37.bb
> @@ -15,9 +15,6 @@ do_configure[dirs] += "${B}/ld ${B}/bfd"
>  do_configure() {
>      # create config.h, oe enables initfini-array by default
>      echo "#define HAVE_INITFINI_ARRAY" > ${B}/ld/config.h
> -    # use the bfd_stdint.h from binutils-native, this is the same of the one
> -    # generated by binutils-cross
> -    cp ${RECIPE_SYSROOT_NATIVE}/usr/include/bfd_stdint.h ${B}/bfd/
>  }
>  
>  # target depends
> @@ -82,4 +79,3 @@ do_check() {
>      done
>  }
>  addtask check after do_configure
> -
> diff --git a/meta/recipes-devtools/binutils/binutils-cross_2.36.bb b/meta/recipes-devtools/binutils/binutils-cross_2.37.bb
> similarity index 100%
> rename from meta/recipes-devtools/binutils/binutils-cross_2.36.bb
> rename to meta/recipes-devtools/binutils/binutils-cross_2.37.bb
> diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.36.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.37.bb
> similarity index 100%
> rename from meta/recipes-devtools/binutils/binutils-crosssdk_2.36.bb
> rename to meta/recipes-devtools/binutils/binutils-crosssdk_2.37.bb
> diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
> index 81891963c8..e15a12b93e 100644
> --- a/meta/recipes-devtools/binutils/binutils.inc
> +++ b/meta/recipes-devtools/binutils/binutils.inc
> @@ -170,8 +170,6 @@ do_install () {
>  	done
>  
>  	oe_multilib_header bfd.h
> -        # bfd_stdint.h encodes the compiler name in the header
> -        sed -i ${D}${includedir}/bfd_stdint.h -e "s,${TARGET_PREFIX},,"
>  }
>  
>  inherit update-alternatives
> diff --git a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
> index 49dacfef81..53e30a0aaa 100644
> --- a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
> @@ -1,4 +1,4 @@
> -From 3b278a56a0e98d50ec62735598ee5f4b1834e8b3 Mon Sep 17 00:00:00 2001
> +From 257ad1ce148417e1cefe2332d8acc5c8216c2522 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 2 Mar 2015 01:58:54 +0000
>  Subject: [PATCH] binutils-crosssdk: Generate relocatable SDKs
> diff --git a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
> index d07947404f..a6ca41374a 100644
> --- a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
> @@ -1,4 +1,4 @@
> -From cf4c8a97b7dc1fe36a7d5dabed417fe18b15ad6b Mon Sep 17 00:00:00 2001
> +From 6e93d0328f499569db7ce6396f94f304ce340df8 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 6 Mar 2017 23:37:05 -0800
>  Subject: [PATCH] binutils-cross: Do not generate linker script directories
> diff --git a/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch b/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
> index cc37d30c53..3c4f706f2d 100644
> --- a/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
> @@ -1,4 +1,4 @@
> -From 9701cab0fdf6a0c011978ae140c4c12a962956f6 Mon Sep 17 00:00:00 2001
> +From d49016d3faf684319bf3ac37450558920d70be03 Mon Sep 17 00:00:00 2001
>  From: Richard Purdie <richard.purdie@linuxfoundation.org>
>  Date: Wed, 19 Feb 2020 09:51:16 -0800
>  Subject: [PATCH] binutils-nativesdk: Search for alternative ld.so.conf in SDK
> @@ -29,7 +29,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   5 files changed, 7 insertions(+), 3 deletions(-)
>  
>  diff --git a/ld/Makefile.am b/ld/Makefile.am
> -index 2c9a487335c..3b01357b651 100644
> +index f8e99325361..fd196541f59 100644
>  --- a/ld/Makefile.am
>  +++ b/ld/Makefile.am
>  @@ -42,7 +42,8 @@ ZLIBINC = @zlibinc@
> @@ -43,10 +43,10 @@ index 2c9a487335c..3b01357b651 100644
>   NO_WERROR = @NO_WERROR@
>   AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
>  diff --git a/ld/Makefile.in b/ld/Makefile.in
> -index b41941c89e2..a6382bf2a45 100644
> +index ef2e99e08da..cb8f5bfb70e 100644
>  --- a/ld/Makefile.in
>  +++ b/ld/Makefile.in
> -@@ -554,7 +554,8 @@ ZLIB = @zlibdir@ -lz
> +@@ -555,7 +555,8 @@ ZLIB = @zlibdir@ -lz
>   ZLIBINC = @zlibinc@
>   ELF_CLFAGS = -DELF_LIST_OPTIONS=@elf_list_options@ \
>   	   -DELF_SHLIB_LIST_OPTIONS=@elf_shlib_list_options@ \
> @@ -57,7 +57,7 @@ index b41941c89e2..a6382bf2a45 100644
>   AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
>   
>  diff --git a/ld/ldelf.c b/ld/ldelf.c
> -index f7407ab55a7..b25781cc0c4 100644
> +index 21e655bb55c..d1615003ede 100644
>  --- a/ld/ldelf.c
>  +++ b/ld/ldelf.c
>  @@ -911,7 +911,7 @@ ldelf_check_ld_so_conf (const struct bfd_link_needed_list *l, int force,
> @@ -70,7 +70,7 @@ index f7407ab55a7..b25781cc0c4 100644
>         if (!ldelf_parse_ld_so_conf (&info, tmppath))
>   	{
>  diff --git a/ld/ldmain.c b/ld/ldmain.c
> -index 863df0293ea..080b1c4c6c2 100644
> +index 42660eb9a3c..5a4a4d5da3d 100644
>  --- a/ld/ldmain.c
>  +++ b/ld/ldmain.c
>  @@ -70,6 +70,7 @@ char *program_name;
> @@ -82,7 +82,7 @@ index 863df0293ea..080b1c4c6c2 100644
>   /* The canonical representation of ld_sysroot.  */
>   char *ld_canon_sysroot;
>  diff --git a/ld/ldmain.h b/ld/ldmain.h
> -index 38e63922d31..0966914938c 100644
> +index 39d08a6c378..4c3519e7970 100644
>  --- a/ld/ldmain.h
>  +++ b/ld/ldmain.h
>  @@ -23,6 +23,7 @@
> diff --git a/meta/recipes-devtools/binutils/binutils/0004-configure-widen-the-regexp-for-SH-architectures.patch b/meta/recipes-devtools/binutils/binutils/0004-configure-widen-the-regexp-for-SH-architectures.patch
> index 1cd459ae81..f476ff210f 100644
> --- a/meta/recipes-devtools/binutils/binutils/0004-configure-widen-the-regexp-for-SH-architectures.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0004-configure-widen-the-regexp-for-SH-architectures.patch
> @@ -1,4 +1,4 @@
> -From 7e7512c82402363688cca6f1febea2c01cb03409 Mon Sep 17 00:00:00 2001
> +From b8d43b6b8d98e176346871c92935458b06598c5b Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 2 Mar 2015 01:07:33 +0000
>  Subject: [PATCH] configure: widen the regexp for SH architectures
> @@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   2 files changed, 2 insertions(+), 2 deletions(-)
>  
>  diff --git a/configure b/configure
> -index 68779feb42b..7b369071141 100755
> +index 3dd206525a7..e8ba1a1d3de 100755
>  --- a/configure
>  +++ b/configure
> -@@ -3887,7 +3887,7 @@ case "${target}" in
> +@@ -3892,7 +3892,7 @@ case "${target}" in
>     nvptx*-*-*)
>       noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
>       ;;
> @@ -27,10 +27,10 @@ index 68779feb42b..7b369071141 100755
>         sh*-*-elf)
>            ;;
>  diff --git a/configure.ac b/configure.ac
> -index d16a2757689..92f01fb3ed7 100644
> +index 797a624621e..3a8a3ae1f3b 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -1177,7 +1177,7 @@ case "${target}" in
> +@@ -1175,7 +1175,7 @@ case "${target}" in
>     nvptx*-*-*)
>       noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
>       ;;
> diff --git a/meta/recipes-devtools/binutils/binutils/0005-Point-scripts-location-to-libdir.patch b/meta/recipes-devtools/binutils/binutils/0005-Point-scripts-location-to-libdir.patch
> index dde0cb5d6d..7cd4a99d33 100644
> --- a/meta/recipes-devtools/binutils/binutils/0005-Point-scripts-location-to-libdir.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0005-Point-scripts-location-to-libdir.patch
> @@ -1,4 +1,4 @@
> -From 6a67d277941228d997b527990960413f8444fb81 Mon Sep 17 00:00:00 2001
> +From 1a9fcaae50e63b993019bd4dc00219e43421efdc Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 2 Mar 2015 01:09:58 +0000
>  Subject: [PATCH] Point scripts location to libdir
> @@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   2 files changed, 2 insertions(+), 2 deletions(-)
>  
>  diff --git a/ld/Makefile.am b/ld/Makefile.am
> -index 3b01357b651..b7a1f7491b0 100644
> +index fd196541f59..d94fa7e64e1 100644
>  --- a/ld/Makefile.am
>  +++ b/ld/Makefile.am
>  @@ -51,7 +51,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
> @@ -25,10 +25,10 @@ index 3b01357b651..b7a1f7491b0 100644
>   EMUL = @EMUL@
>   EMULATION_OFILES = @EMULATION_OFILES@
>  diff --git a/ld/Makefile.in b/ld/Makefile.in
> -index a6382bf2a45..5ee3a4971be 100644
> +index cb8f5bfb70e..9a58879c5ca 100644
>  --- a/ld/Makefile.in
>  +++ b/ld/Makefile.in
> -@@ -562,7 +562,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
> +@@ -563,7 +563,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
>   # We put the scripts in the directory $(scriptdir)/ldscripts.
>   # We can't put the scripts in $(datadir) because the SEARCH_DIR
>   # directives need to be different for native and cross linkers.
> diff --git a/meta/recipes-devtools/binutils/binutils/0006-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch b/meta/recipes-devtools/binutils/binutils/0006-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
> index caa5f0bdd3..d6b04fdae4 100644
> --- a/meta/recipes-devtools/binutils/binutils/0006-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0006-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
> @@ -1,4 +1,4 @@
> -From 8ad249270414a23a3e65c74fd67a8e4adaebec78 Mon Sep 17 00:00:00 2001
> +From 29517900352336708495d41902b5b7e8cc9a401a Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 2 Mar 2015 01:27:17 +0000
>  Subject: [PATCH] Only generate an RPATH entry if LD_RUN_PATH is not empty
> @@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 4 insertions(+)
>  
>  diff --git a/ld/ldelf.c b/ld/ldelf.c
> -index b25781cc0c4..77d7fb8ff03 100644
> +index d1615003ede..6a894285b11 100644
>  --- a/ld/ldelf.c
>  +++ b/ld/ldelf.c
> -@@ -1248,6 +1248,8 @@ ldelf_after_open (int use_libpath, int native, int is_linux, int is_freebsd,
> +@@ -1250,6 +1250,8 @@ ldelf_after_open (int use_libpath, int native, int is_linux, int is_freebsd,
>   		  && command_line.rpath == NULL)
>   		{
>   		  path = (const char *) getenv ("LD_RUN_PATH");
> @@ -26,7 +26,7 @@ index b25781cc0c4..77d7fb8ff03 100644
>   		  if (path
>   		      && ldelf_search_needed (path, &n, force,
>   					      is_linux, elfsize))
> -@@ -1608,6 +1610,8 @@ ldelf_before_allocation (char *audit, char *depaudit,
> +@@ -1610,6 +1612,8 @@ ldelf_before_allocation (char *audit, char *depaudit,
>     rpath = command_line.rpath;
>     if (rpath == NULL)
>       rpath = (const char *) getenv ("LD_RUN_PATH");
> diff --git a/meta/recipes-devtools/binutils/binutils/0007-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch b/meta/recipes-devtools/binutils/binutils/0007-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
> index b13a35e02f..39cef70bcd 100644
> --- a/meta/recipes-devtools/binutils/binutils/0007-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0007-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
> @@ -1,4 +1,4 @@
> -From 091870218f192a5698c4420adf938e7178553c07 Mon Sep 17 00:00:00 2001
> +From 37581c8ce9d98a1183706e12a2c9a73f7f40462d Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 2 Mar 2015 01:39:01 +0000
>  Subject: [PATCH] don't let the distro compiler point to the wrong installation
> @@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 2 insertions(+), 1 deletion(-)
>  
>  diff --git a/libiberty/Makefile.in b/libiberty/Makefile.in
> -index 788590957e1..1bca4aafeb7 100644
> +index 4f1213b983b..2ba18b75cac 100644
>  --- a/libiberty/Makefile.in
>  +++ b/libiberty/Makefile.in
>  @@ -367,7 +367,8 @@ install-strip: install
> diff --git a/meta/recipes-devtools/binutils/binutils/0008-warn-for-uses-of-system-directories-when-cross-linki.patch b/meta/recipes-devtools/binutils/binutils/0008-warn-for-uses-of-system-directories-when-cross-linki.patch
> index 5c148eaa95..c724dfd7a7 100644
> --- a/meta/recipes-devtools/binutils/binutils/0008-warn-for-uses-of-system-directories-when-cross-linki.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0008-warn-for-uses-of-system-directories-when-cross-linki.patch
> @@ -1,4 +1,4 @@
> -From bb48edf1a87bbc711e8978dd1e9112fe953dc1bf Mon Sep 17 00:00:00 2001
> +From 99e1565b9d2b929d4ee4e9da6f63766b22b23fc3 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 15 Jan 2016 06:31:09 +0000
>  Subject: [PATCH] warn for uses of system directories when cross linking
> @@ -62,11 +62,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   ld/lexsup.c     | 16 ++++++++++++++++
>   9 files changed, 86 insertions(+)
>  
> -diff --git a/ld/config.in b/ld/config.in
> -index 7b60d778587..37b8e9b6f6c 100644
>  --- a/ld/config.in
>  +++ b/ld/config.in
> -@@ -40,6 +40,9 @@
> +@@ -43,6 +43,9 @@
>      language is requested. */
>   #undef ENABLE_NLS
>   
> @@ -76,11 +74,9 @@ index 7b60d778587..37b8e9b6f6c 100644
>   /* Additional extension a shared object might have. */
>   #undef EXTRA_SHLIB_EXTENSION
>   
> -diff --git a/ld/configure b/ld/configure
> -index b0969791959..50bb04ce6a8 100755
>  --- a/ld/configure
>  +++ b/ld/configure
> -@@ -828,6 +828,7 @@ with_lib_path
> +@@ -829,6 +829,7 @@ with_lib_path
>   enable_targets
>   enable_64_bit_bfd
>   with_sysroot
> @@ -88,8 +84,8 @@ index b0969791959..50bb04ce6a8 100755
>   enable_gold
>   enable_got
>   enable_compressed_debug_sections
> -@@ -1496,6 +1497,8 @@ Optional Features:
> -   --disable-largefile     omit support for large files
> +@@ -1498,6 +1499,8 @@ Optional Features:
> +   --enable-checking       enable run-time checks
>     --enable-targets        alternative target configurations
>     --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
>  +  --enable-poison-system-directories
> @@ -97,7 +93,7 @@ index b0969791959..50bb04ce6a8 100755
>     --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
>     --enable-got=<type>     GOT handling scheme (target, single, negative,
>                             multigot)
> -@@ -15820,6 +15823,19 @@ fi
> +@@ -15215,6 +15218,19 @@ fi
>   
>   
>   
> @@ -117,11 +113,9 @@ index b0969791959..50bb04ce6a8 100755
>   # Check whether --enable-gold was given.
>   if test "${enable_gold+set}" = set; then :
>     enableval=$enable_gold; case "${enableval}" in
> -diff --git a/ld/configure.ac b/ld/configure.ac
> -index c9c69ab9245..59dab0a6ac4 100644
>  --- a/ld/configure.ac
>  +++ b/ld/configure.ac
> -@@ -94,6 +94,16 @@ AC_SUBST(use_sysroot)
> +@@ -106,6 +106,16 @@ AC_SUBST(use_sysroot)
>   AC_SUBST(TARGET_SYSTEM_ROOT)
>   AC_SUBST(TARGET_SYSTEM_ROOT_DEFINE)
>   
> @@ -138,30 +132,26 @@ index c9c69ab9245..59dab0a6ac4 100644
>   dnl Use --enable-gold to decide if this linker should be the default.
>   dnl "install_as_default" is set to false if gold is the default linker.
>   dnl "installed_linker" is the installed BFD linker name.
> -diff --git a/ld/ld.h b/ld/ld.h
> -index 93f5af92c7d..ff7f71a7b66 100644
>  --- a/ld/ld.h
>  +++ b/ld/ld.h
> -@@ -166,6 +166,14 @@ typedef struct
> +@@ -162,6 +162,14 @@ typedef struct
>        in the linker script.  */
> -   bfd_boolean force_group_allocation;
> +   bool force_group_allocation;
>   
>  +  /* If TRUE (the default) warn for uses of system directories when
>  +     cross linking.  */
> -+  bfd_boolean poison_system_directories;
> ++  bool poison_system_directories;
>  +
>  +  /* If TRUE (default FALSE) give an error for uses of system
>  +     directories when cross linking instead of a warning.  */
> -+  bfd_boolean error_poison_system_directories;
> ++  bool error_poison_system_directories;
>  +
>     /* Big or little endian as set on command line.  */
>     enum endian_enum endian;
>   
> -diff --git a/ld/ld.texi b/ld/ld.texi
> -index 7a602b9c6ab..cccbfbab3bb 100644
>  --- a/ld/ld.texi
>  +++ b/ld/ld.texi
> -@@ -2810,6 +2810,18 @@ string identifying the original linked file does not change.
> +@@ -2863,6 +2863,18 @@ string identifying the original linked f
>   
>   Passing @code{none} for @var{style} disables the setting from any
>   @code{--build-id} options earlier on the command line.
> @@ -180,11 +170,9 @@ index 7a602b9c6ab..cccbfbab3bb 100644
>   @end table
>   
>   @c man end
> -diff --git a/ld/ldfile.c b/ld/ldfile.c
> -index 81cb86d51e2..cd5c2752679 100644
>  --- a/ld/ldfile.c
>  +++ b/ld/ldfile.c
> -@@ -117,6 +117,23 @@ ldfile_add_library_path (const char *name, bfd_boolean cmdline)
> +@@ -117,6 +117,23 @@ ldfile_add_library_path (const char *nam
>       new_dirs->name = concat (ld_sysroot, name + strlen ("$SYSROOT"), (const char *) NULL);
>     else
>       new_dirs->name = xstrdup (name);
> @@ -208,11 +196,9 @@ index 81cb86d51e2..cd5c2752679 100644
>   }
>   
>   /* Try to open a BFD for a lang_input_statement.  */
> -diff --git a/ld/ldlex.h b/ld/ldlex.h
> -index b0101028321..77f5accb5d9 100644
>  --- a/ld/ldlex.h
>  +++ b/ld/ldlex.h
> -@@ -161,6 +161,8 @@ enum option_values
> +@@ -163,6 +163,8 @@ enum option_values
>     OPTION_CTF_VARIABLES,
>     OPTION_NO_CTF_VARIABLES,
>     OPTION_CTF_SHARE_TYPES,
> @@ -221,24 +207,38 @@ index b0101028321..77f5accb5d9 100644
>   };
>   
>   /* The initial parser states.  */
> -diff --git a/ld/ldmain.c b/ld/ldmain.c
> -index 080b1c4c6c2..78d8a2df278 100644
>  --- a/ld/ldmain.c
>  +++ b/ld/ldmain.c
> -@@ -324,6 +324,8 @@ main (int argc, char **argv)
> -   command_line.warn_mismatch = TRUE;
> -   command_line.warn_search_mismatch = TRUE;
> +@@ -321,6 +321,8 @@ main (int argc, char **argv)
> +   command_line.warn_mismatch = true;
> +   command_line.warn_search_mismatch = true;
>     command_line.check_section_addresses = -1;
> -+  command_line.poison_system_directories = TRUE;
> -+  command_line.error_poison_system_directories = FALSE;
> ++  command_line.poison_system_directories = true;
> ++  command_line.error_poison_system_directories = false;
>   
>     /* We initialize DEMANGLING based on the environment variable
>        COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
> -diff --git a/ld/lexsup.c b/ld/lexsup.c
> -index f005a58a045..5eb8439fef7 100644
> +@@ -1444,7 +1446,7 @@ undefined_symbol (struct bfd_link_info *
> +       argv[1] = "undefined-symbol";
> +       argv[2] = (char *) name;
> +       argv[3] = NULL;
> +-      
> ++
> +       if (verbose)
> + 	einfo (_("%P: About to run error handling script '%s' with arguments: '%s' '%s'\n"),
> + 	       argv[0], argv[1], argv[2]);
> +@@ -1465,7 +1467,7 @@ undefined_symbol (struct bfd_link_info *
> + 	 carry on to issue the normal error message.  */
> +     }
> + #endif /* SUPPORT_ERROR_HANDLING_SCRIPT */
> +-  
> ++
> +   if (section != NULL)
> +     {
> +       if (error_count < MAX_ERRORS_IN_A_ROW)
>  --- a/ld/lexsup.c
>  +++ b/ld/lexsup.c
> -@@ -591,6 +591,14 @@ static const struct ld_option ld_options[] =
> +@@ -595,6 +595,14 @@ static const struct ld_option ld_options
>   		   "                                <method> is: share-unconflicted (default),\n"
>   		   "                                             share-duplicated"),
>       TWO_DASHES },
> @@ -253,16 +253,16 @@ index f005a58a045..5eb8439fef7 100644
>   };
>   
>   #define OPTION_COUNT ARRAY_SIZE (ld_options)
> -@@ -1676,6 +1684,14 @@ parse_args (unsigned argc, char **argv)
> - 	  config.print_map_discarded = TRUE;
> +@@ -1686,6 +1694,14 @@ parse_args (unsigned argc, char **argv)
> + 	  config.print_map_discarded = true;
>   	  break;
>   
>  +	case OPTION_NO_POISON_SYSTEM_DIRECTORIES:
> -+	  command_line.poison_system_directories = FALSE;
> ++	  command_line.poison_system_directories = false;
>  +	  break;
>  +
>  +	case OPTION_ERROR_POISON_SYSTEM_DIRECTORIES:
> -+	  command_line.error_poison_system_directories = TRUE;
> ++	  command_line.error_poison_system_directories = true;
>  +	  break;
>  +
>   	case OPTION_DEPENDENCY_FILE:
> diff --git a/meta/recipes-devtools/binutils/binutils/0009-Change-default-emulation-for-mips64-linux.patch b/meta/recipes-devtools/binutils/binutils/0009-Change-default-emulation-for-mips64-linux.patch
> index b8a1939d36..fab92d52e6 100644
> --- a/meta/recipes-devtools/binutils/binutils/0009-Change-default-emulation-for-mips64-linux.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0009-Change-default-emulation-for-mips64-linux.patch
> @@ -1,4 +1,4 @@
> -From 5bd94030de598d3a13091dafaed3b956e0ab708f Mon Sep 17 00:00:00 2001
> +From fb6d52dda9c230baf869ed5f981581a7b5094b70 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 2 Mar 2015 01:44:14 +0000
>  Subject: [PATCH] Change default emulation for mips64*-*-linux
> @@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   2 files changed, 8 insertions(+), 8 deletions(-)
>  
>  diff --git a/bfd/config.bfd b/bfd/config.bfd
> -index e7b55b0dd78..2caf492e172 100644
> +index 30087e3b8f8..1896e11790c 100644
>  --- a/bfd/config.bfd
>  +++ b/bfd/config.bfd
> -@@ -896,12 +896,12 @@ case "${targ}" in
> +@@ -891,12 +891,12 @@ case "${targ}" in
>       targ_selvecs="mips_elf32_le_vec mips_elf64_be_vec mips_elf64_le_vec mips_ecoff_be_vec mips_ecoff_le_vec"
>       ;;
>     mips64*el-*-linux*)
> @@ -35,10 +35,10 @@ index e7b55b0dd78..2caf492e172 100644
>     mips*el-*-linux*)
>       targ_defvec=mips_elf32_trad_le_vec
>  diff --git a/ld/configure.tgt b/ld/configure.tgt
> -index 0c780b24d57..47431770a17 100644
> +index 6205d7c9872..c08533658e5 100644
>  --- a/ld/configure.tgt
>  +++ b/ld/configure.tgt
> -@@ -531,12 +531,12 @@ mips*-*-vxworks*)	targ_emul=elf32ebmipvxworks
> +@@ -530,12 +530,12 @@ mips*-*-vxworks*)	targ_emul=elf32ebmipvxworks
>   			;;
>   mips*-*-windiss)	targ_emul=elf32mipswindiss
>   			;;
> diff --git a/meta/recipes-devtools/binutils/binutils/0010-Add-support-for-Netlogic-XLP.patch b/meta/recipes-devtools/binutils/binutils/0010-Add-support-for-Netlogic-XLP.patch
> index fe2d02f29d..b2f7448a28 100644
> --- a/meta/recipes-devtools/binutils/binutils/0010-Add-support-for-Netlogic-XLP.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0010-Add-support-for-Netlogic-XLP.patch
> @@ -1,4 +1,4 @@
> -From c64a5ca02a55b748311032e2c7d9c4f87bd74c63 Mon Sep 17 00:00:00 2001
> +From 21920b7a3d10a7dae4c1f18a4bb185de78048e3f Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Sun, 14 Feb 2016 17:06:19 +0000
>  Subject: [PATCH] Add support for Netlogic XLP
> @@ -28,14 +28,14 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>   gas/configure         |  3 +++
>   gas/configure.ac      |  3 +++
>   include/elf/mips.h    |  1 +
> - include/opcode/mips.h |  6 ++++++
> + include/opcode/mips.h |  8 +++++++-
>   ld/configure.tgt      |  3 +++
>   opcodes/mips-dis.c    | 12 +++++-------
>   opcodes/mips-opc.c    | 31 ++++++++++++++++++++-----------
> - 15 files changed, 65 insertions(+), 21 deletions(-)
> + 15 files changed, 66 insertions(+), 22 deletions(-)
>  
>  diff --git a/bfd/aoutx.h b/bfd/aoutx.h
> -index 8025b8c5241..cdcb7876896 100644
> +index 17560bd8f54..10b1cad74e6 100644
>  --- a/bfd/aoutx.h
>  +++ b/bfd/aoutx.h
>  @@ -810,6 +810,7 @@ NAME (aout, machine_type) (enum bfd_architecture arch,
> @@ -47,7 +47,7 @@ index 8025b8c5241..cdcb7876896 100644
>   	  arch_flags = M_MIPS2;
>   	  break;
>  diff --git a/bfd/archures.c b/bfd/archures.c
> -index 8c1d32ca930..b4b2927ebc0 100644
> +index 390691bfba1..b0b7a5fa7a0 100644
>  --- a/bfd/archures.c
>  +++ b/bfd/archures.c
>  @@ -185,6 +185,7 @@ DESCRIPTION
> @@ -59,10 +59,10 @@ index 8c1d32ca930..b4b2927ebc0 100644
>   .#define bfd_mach_mipsisa32r2		33
>   .#define bfd_mach_mipsisa32r3		34
>  diff --git a/bfd/bfd-in2.h b/bfd/bfd-in2.h
> -index 7eff85b7eaa..6c9eb12865e 100644
> +index 57b3c453649..a00b0d44359 100644
>  --- a/bfd/bfd-in2.h
>  +++ b/bfd/bfd-in2.h
> -@@ -1590,6 +1590,7 @@ enum bfd_architecture
> +@@ -1562,6 +1562,7 @@ enum bfd_architecture
>   #define bfd_mach_mips_octeon3          6503
>   #define bfd_mach_mips_xlr              887682   /* decimal 'XLR'.  */
>   #define bfd_mach_mips_interaptiv_mr2   736550   /* decimal 'IA2'.  */
> @@ -71,10 +71,10 @@ index 7eff85b7eaa..6c9eb12865e 100644
>   #define bfd_mach_mipsisa32r2           33
>   #define bfd_mach_mipsisa32r3           34
>  diff --git a/bfd/config.bfd b/bfd/config.bfd
> -index 2caf492e172..e75417da4d8 100644
> +index 1896e11790c..8270fd2708d 100644
>  --- a/bfd/config.bfd
>  +++ b/bfd/config.bfd
> -@@ -879,6 +879,11 @@ case "${targ}" in
> +@@ -874,6 +874,11 @@ case "${targ}" in
>       targ_defvec=mips_elf32_le_vec
>       targ_selvecs="mips_elf32_be_vec mips_elf64_be_vec mips_elf64_le_vec"
>       ;;
> @@ -87,7 +87,7 @@ index 2caf492e172..e75417da4d8 100644
>       targ_defvec=mips_elf32_be_vec
>       targ_selvecs="mips_elf32_le_vec mips_elf64_be_vec mips_elf64_le_vec"
>  diff --git a/bfd/cpu-mips.c b/bfd/cpu-mips.c
> -index 5a944ceee81..c57d12ba3dd 100644
> +index 76b507e3c77..c1563cf4319 100644
>  --- a/bfd/cpu-mips.c
>  +++ b/bfd/cpu-mips.c
>  @@ -108,7 +108,8 @@ enum
> @@ -101,17 +101,17 @@ index 5a944ceee81..c57d12ba3dd 100644
>   
>   #define NN(index) (&arch_info_struct[(index) + 1])
>  @@ -163,7 +164,8 @@ static const bfd_arch_info_type arch_info_struct[] =
> -   N (64, 64, bfd_mach_mips_xlr, "mips:xlr",	   FALSE, NN(I_xlr)),
> -   N (32, 32, bfd_mach_mips_interaptiv_mr2, "mips:interaptiv-mr2", FALSE,
> +   N (64, 64, bfd_mach_mips_xlr, "mips:xlr",	   false, NN(I_xlr)),
> +   N (32, 32, bfd_mach_mips_interaptiv_mr2, "mips:interaptiv-mr2", false,
>        NN(I_interaptiv_mr2)),
> --  N (64, 64, bfd_mach_mips_micromips, "mips:micromips", FALSE, NULL)
> -+  N (64, 64, bfd_mach_mips_micromips, "mips:micromips", FALSE, NN(I_micromips)),
> -+  N (64, 64, bfd_mach_mips_xlp, "mips:xlp", FALSE, NULL)
> +-  N (64, 64, bfd_mach_mips_micromips, "mips:micromips", false, NULL)
> ++  N (64, 64, bfd_mach_mips_micromips, "mips:micromips", false, NN(I_micromips)),
> ++  N (64, 64, bfd_mach_mips_xlp, "mips:xlp", false, NULL)
>   };
>   
>   /* The default architecture is mips:3000, but with a machine number of
>  diff --git a/bfd/elfxx-mips.c b/bfd/elfxx-mips.c
> -index 3cbb3cf9495..0c6cd47b40c 100644
> +index e4827fd17de..fa8c2512837 100644
>  --- a/bfd/elfxx-mips.c
>  +++ b/bfd/elfxx-mips.c
>  @@ -6980,6 +6980,9 @@ _bfd_elf_mips_mach (flagword flags)
> @@ -124,7 +124,7 @@ index 3cbb3cf9495..0c6cd47b40c 100644
>       default:
>         switch (flags & EF_MIPS_ARCH)
>   	{
> -@@ -12335,6 +12338,10 @@ mips_set_isa_flags (bfd *abfd)
> +@@ -12339,6 +12342,10 @@ mips_set_isa_flags (bfd *abfd)
>         val = E_MIPS_ARCH_64R2 | E_MIPS_MACH_OCTEON2;
>         break;
>   
> @@ -135,7 +135,7 @@ index 3cbb3cf9495..0c6cd47b40c 100644
>       case bfd_mach_mipsisa32:
>         val = E_MIPS_ARCH_32;
>         break;
> -@@ -14352,6 +14359,7 @@ static const struct mips_mach_extension mips_mach_extensions[] =
> +@@ -14428,6 +14435,7 @@ static const struct mips_mach_extension mips_mach_extensions[] =
>     { bfd_mach_mips_gs264e, bfd_mach_mips_gs464e },
>     { bfd_mach_mips_gs464e, bfd_mach_mips_gs464 },
>     { bfd_mach_mips_gs464, bfd_mach_mipsisa64r2 },
> @@ -144,10 +144,10 @@ index 3cbb3cf9495..0c6cd47b40c 100644
>     /* MIPS64 extensions.  */
>     { bfd_mach_mipsisa64r2, bfd_mach_mipsisa64 },
>  diff --git a/binutils/readelf.c b/binutils/readelf.c
> -index ad16b4571c9..4bf2b732502 100644
> +index a6073f7ec80..2f2448b5eba 100644
>  --- a/binutils/readelf.c
>  +++ b/binutils/readelf.c
> -@@ -3502,6 +3502,7 @@ get_machine_flags (Filedata * filedata, unsigned e_flags, unsigned e_machine)
> +@@ -3613,6 +3613,7 @@ get_machine_flags (Filedata * filedata, unsigned e_flags, unsigned e_machine)
>   	    case E_MIPS_MACH_OCTEON3: strcat (buf, ", octeon3"); break;
>   	    case E_MIPS_MACH_XLR:  strcat (buf, ", xlr"); break;
>   	    case E_MIPS_MACH_IAMR2:  strcat (buf, ", interaptiv-mr2"); break;
> @@ -156,10 +156,10 @@ index ad16b4571c9..4bf2b732502 100644
>   	    /* We simply ignore the field in this case to avoid confusion:
>   	       MIPS ELF does not specify EF_MIPS_MACH, it is a GNU
>  diff --git a/gas/config/tc-mips.c b/gas/config/tc-mips.c
> -index 538b69710f5..b021b64f14b 100644
> +index 0201f816814..a3cfcdbe982 100644
>  --- a/gas/config/tc-mips.c
>  +++ b/gas/config/tc-mips.c
> -@@ -568,6 +568,7 @@ static int mips_32bitmode = 0;
> +@@ -570,6 +570,7 @@ static int mips_32bitmode = 0;
>      || mips_opts.arch == CPU_RM7000                    \
>      || mips_opts.arch == CPU_VR5500                    \
>      || mips_opts.micromips                             \
> @@ -167,7 +167,7 @@ index 538b69710f5..b021b64f14b 100644
>      )
>   
>   /* Whether the processor uses hardware interlocks to protect reads
> -@@ -597,6 +598,7 @@ static int mips_32bitmode = 0;
> +@@ -599,6 +600,7 @@ static int mips_32bitmode = 0;
>       && mips_opts.isa != ISA_MIPS3)                    \
>      || mips_opts.arch == CPU_R4300                     \
>      || mips_opts.micromips                             \
> @@ -175,7 +175,7 @@ index 538b69710f5..b021b64f14b 100644
>      )
>   
>   /* Whether the processor uses hardware interlocks to protect reads
> -@@ -20156,7 +20158,7 @@ static const struct mips_cpu_info mips_cpu_info_table[] =
> +@@ -20157,7 +20159,7 @@ static const struct mips_cpu_info mips_cpu_info_table[] =
>     /* Broadcom XLP.
>        XLP is mostly like XLR, with the prominent exception that it is
>        MIPS64R2 rather than MIPS64.  */
> @@ -185,10 +185,10 @@ index 538b69710f5..b021b64f14b 100644
>     /* MIPS 64 Release 6.  */
>     { "i6400",	      0, ASE_VIRT | ASE_MSA,	ISA_MIPS64R6, CPU_MIPS64R6},
>  diff --git a/gas/configure b/gas/configure
> -index d03432c6dc6..d5ae54925e9 100755
> +index 110d707f079..789d1b38b33 100755
>  --- a/gas/configure
>  +++ b/gas/configure
> -@@ -12761,6 +12761,9 @@ _ACEOF
> +@@ -12083,6 +12083,9 @@ _ACEOF
>   	  mipsisa64r6 | mipsisa64r6el)
>   	    mips_cpu=mips64r6
>   	    ;;
> @@ -199,10 +199,10 @@ index d03432c6dc6..d5ae54925e9 100755
>   	    mips_cpu=r3900
>   	    ;;
>  diff --git a/gas/configure.ac b/gas/configure.ac
> -index 82706561886..f1c27bf2878 100644
> +index 78efba88e23..c1b4ef6b3b0 100644
>  --- a/gas/configure.ac
>  +++ b/gas/configure.ac
> -@@ -332,6 +332,9 @@ changequote([,])dnl
> +@@ -331,6 +331,9 @@ changequote([,])dnl
>   	  mipsisa64r6 | mipsisa64r6el)
>   	    mips_cpu=mips64r6
>   	    ;;
> @@ -225,10 +225,19 @@ index 4bd86307120..2d7df22abf2 100644
>   #define E_MIPS_MACH_OCTEON3	0x008e0000
>   #define E_MIPS_MACH_5400	0x00910000
>  diff --git a/include/opcode/mips.h b/include/opcode/mips.h
> -index d1b4a2574ac..879c68fcfd4 100644
> +index 9add3c9d5bf..a99c53f652f 100644
>  --- a/include/opcode/mips.h
>  +++ b/include/opcode/mips.h
> -@@ -1260,6 +1260,8 @@ static const unsigned int mips_isa_table[] = {
> +@@ -1157,7 +1157,7 @@ mips_opcode_32bit_p (const struct mips_opcode *mo)
> + #define INSN_ISA32R3              8
> + #define INSN_ISA32R5              9
> + #define INSN_ISA32R6              10
> +-#define INSN_ISA64                11 
> ++#define INSN_ISA64                11
> + #define INSN_ISA64R2              12
> + #define INSN_ISA64R3              13
> + #define INSN_ISA64R5              14
> +@@ -1265,6 +1265,8 @@ static const unsigned int mips_isa_table[] = {
>   #define INSN_XLR                 0x00000020
>   /* Imagination interAptiv MR2.  */
>   #define INSN_INTERAPTIV_MR2	  0x04000000
> @@ -237,7 +246,7 @@ index d1b4a2574ac..879c68fcfd4 100644
>   
>   /* DSP ASE */
>   #define ASE_DSP			0x00000001
> -@@ -1384,6 +1386,7 @@ static const unsigned int mips_isa_table[] = {
> +@@ -1389,6 +1391,7 @@ static const unsigned int mips_isa_table[] = {
>   #define CPU_OCTEON3	6503
>   #define CPU_XLR     	887682   	/* decimal 'XLR'   */
>   #define CPU_INTERAPTIV_MR2 736550	/* decimal 'IA2'  */
> @@ -245,21 +254,21 @@ index d1b4a2574ac..879c68fcfd4 100644
>   
>   /* Return true if the given CPU is included in INSN_* mask MASK.  */
>   
> -@@ -1461,6 +1464,9 @@ cpu_is_member (int cpu, unsigned int mask)
> -       return ((mask & INSN_ISA_MASK) == INSN_ISA32R6)
> - 	     || ((mask & INSN_ISA_MASK) == INSN_ISA64R6);
> +@@ -1459,6 +1462,9 @@ cpu_is_member (int cpu, unsigned int mask)
> +     case CPU_INTERAPTIV_MR2:
> +       return (mask & INSN_INTERAPTIV_MR2) != 0;
>   
>  +    case CPU_XLP:
>  +      return (mask & INSN_XLP) != 0;
>  +
>       default:
> -       return FALSE;
> +       return false;
>       }
>  diff --git a/ld/configure.tgt b/ld/configure.tgt
> -index 47431770a17..f714744eab3 100644
> +index c08533658e5..7abf32215c2 100644
>  --- a/ld/configure.tgt
>  +++ b/ld/configure.tgt
> -@@ -510,6 +510,9 @@ mips*-sde-elf* | mips*-mti-elf* | mips*-img-elf*)
> +@@ -509,6 +509,9 @@ mips*-sde-elf* | mips*-mti-elf* | mips*-img-elf*)
>   			targ_emul=elf32btsmip
>   			targ_extra_emuls="elf32ltsmip elf32btsmipn32 elf64btsmip elf32ltsmipn32 elf64ltsmip"
>   			;;
> @@ -270,10 +279,10 @@ index 47431770a17..f714744eab3 100644
>   			targ_extra_emuls="elf32lr5900"
>   			targ_extra_libpath=$targ_extra_emuls
>  diff --git a/opcodes/mips-dis.c b/opcodes/mips-dis.c
> -index 317ced51204..6869f890656 100644
> +index 591caf11e28..00120afed47 100644
>  --- a/opcodes/mips-dis.c
>  +++ b/opcodes/mips-dis.c
> -@@ -674,13 +674,11 @@ const struct mips_arch_choice mips_arch_choices[] =
> +@@ -698,13 +698,11 @@ const struct mips_arch_choice mips_arch_choices[] =
>       mips_cp0sel_names_xlr, ARRAY_SIZE (mips_cp0sel_names_xlr),
>       mips_cp1_names_mips3264, mips_hwr_names_numeric },
>   
> @@ -293,10 +302,10 @@ index 317ced51204..6869f890656 100644
>     /* This entry, mips16, is here only for ISA/processor selection; do
>        not print its name.  */
>  diff --git a/opcodes/mips-opc.c b/opcodes/mips-opc.c
> -index b45eb40bf69..2f4eb5c0354 100644
> +index db72c039bfd..ff2fa614de1 100644
>  --- a/opcodes/mips-opc.c
>  +++ b/opcodes/mips-opc.c
> -@@ -328,6 +328,7 @@ decode_mips_operand (const char *p)
> +@@ -329,6 +329,7 @@ decode_mips_operand (const char *p)
>   #define IOCT3	INSN_OCTEON3
>   #define XLR     INSN_XLR
>   #define IAMR2	INSN_INTERAPTIV_MR2
> @@ -304,15 +313,15 @@ index b45eb40bf69..2f4eb5c0354 100644
>   #define IVIRT	ASE_VIRT
>   #define IVIRT64	ASE_VIRT64
>   
> -@@ -990,6 +991,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
> +@@ -991,6 +992,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
>   {"clo",			"U,s",		0x70000021, 0xfc0007ff, WR_1|RD_2,		0,		I32|N55,	0,	I37 },
>   {"clz",			"d,s",		0x00000050, 0xfc1f07ff, WR_1|RD_2,		0,		I37,		0,	0 },
>   {"clz",			"U,s",		0x70000020, 0xfc0007ff, WR_1|RD_2,		0,		I32|N55,	0,	I37 },
>  +{"crc",			"d,s,t",	0x7000001c, 0xfc0007ff,	WR_1|RD_2|RD_3,	0,		XLP, 		0,	0 },
>   /* ctc0 is at the bottom of the table.  */
> - {"ctc1",		"t,G",		0x44c00000, 0xffe007ff,	RD_1|WR_CC|CM,		0,		I1,		0,	0 },
> + {"ctc1",		"t,g",		0x44c00000, 0xffe007ff,	RD_1|WR_CC|CM,		0,		I1,		0,	0 },
>   {"ctc1",		"t,S",		0x44c00000, 0xffe007ff,	RD_1|WR_CC|CM,		0,		I1,		0,	0 },
> -@@ -1022,12 +1024,13 @@ const struct mips_opcode mips_builtin_opcodes[] =
> +@@ -1023,12 +1025,13 @@ const struct mips_opcode mips_builtin_opcodes[] =
>   {"daddiu",		"t,r,j",	0x64000000, 0xfc000000, WR_1|RD_2,		0,		I3,		0,	0 },
>   {"daddu",		"d,v,t",	0x0000002d, 0xfc0007ff, WR_1|RD_2|RD_3,		0,		I3,		0,	0 },
>   {"daddu",		"t,r,I",	0,    (int) M_DADDU_I,	INSN_MACRO,		0,		I3,		0,	0 },
> @@ -327,7 +336,7 @@ index b45eb40bf69..2f4eb5c0354 100644
>   /* dctr and dctw are used on the r5000.  */
>   {"dctr",		"o(b)",	 	0xbc050000, 0xfc1f0000, RD_2,			0,		I3,		0,	0 },
>   {"dctw",		"o(b)",		0xbc090000, 0xfc1f0000, RD_2,			0,		I3,		0,	0 },
> -@@ -1099,6 +1102,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
> +@@ -1100,6 +1103,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
>   {"dmfc0",		"t,G,H",	0x40200000, 0xffe007f8,	WR_1|RD_C0|LC,		0,		I64,		0,	0 },
>   {"dmfgc0",		"t,G",		0x40600100, 0xffe007ff, WR_1|RD_C0|LC,		0,		0,		IVIRT64, 0 },
>   {"dmfgc0",		"t,G,H",	0x40600100, 0xffe007f8, WR_1|RD_C0|LC,		0,		0,		IVIRT64, 0 },
> @@ -335,16 +344,16 @@ index b45eb40bf69..2f4eb5c0354 100644
>   {"dmt",			"",		0x41600bc1, 0xffffffff, TRAP,			0,		0,		MT32,	0 },
>   {"dmt",			"t",		0x41600bc1, 0xffe0ffff, WR_1|TRAP,		0,		0,		MT32,	0 },
>   {"dmtc0",		"t,G",		0x40a00000, 0xffe007ff,	RD_1|WR_C0|WR_CC|CM,	0,		I3,		0,	EE },
> -@@ -1114,6 +1118,8 @@ const struct mips_opcode mips_builtin_opcodes[] =
> - /* dmfc3 is at the bottom of the table.  */
> - /* dmtc3 is at the bottom of the table.  */
> +@@ -1113,6 +1117,8 @@ const struct mips_opcode mips_builtin_opcodes[] =
> + /* dmfc2 is at the bottom of the table.  */
> + /* dmtc2 is at the bottom of the table.  */
>   {"dmuh",		"d,s,t",	0x000000dc, 0xfc0007ff, WR_1|RD_2|RD_3,		0,		I69,		0,	0 },
>  +{"dmtur",		"t,d",		0x7000001f, 0xffe007ff,	RD_1,			0,		XLP,		0,	0 },
>  +{"dmul",		"d,s,t",	0x70000006, 0xfc0007ff,	WR_1|RD_2|RD_3,		0,		XLP,		0,	0 },
>   {"dmul",		"d,s,t",	0x0000009c, 0xfc0007ff, WR_1|RD_2|RD_3,		0,		I69,		0,	0 },
>   {"dmul",		"d,v,t",	0x70000003, 0xfc0007ff, WR_1|RD_2|RD_3|WR_HILO,	0,		IOCT,		0,	0 },
>   {"dmul",		"d,v,t",	0,    (int) M_DMUL,	INSN_MACRO,		0,		I3,		0,	M32|I69 },
> -@@ -1267,9 +1273,9 @@ const struct mips_opcode mips_builtin_opcodes[] =
> +@@ -1266,9 +1272,9 @@ const struct mips_opcode mips_builtin_opcodes[] =
>   {"ld",			"s,-b(+R)",	0xec180000, 0xfc1c0000, WR_1,			RD_pc,		I69,		0,	0 },
>   {"ld",			"t,A(b)",	0,    (int) M_LD_AB,	INSN_MACRO,		0,		I1,		0,	0 },
>   {"ld",			"t,o(b)",	0xdc000000, 0xfc000000, WR_1|RD_3|LM,		0,		I3,		0,	0 },
> @@ -357,7 +366,7 @@ index b45eb40bf69..2f4eb5c0354 100644
>   {"ldc1",		"T,o(b)",	0xd4000000, 0xfc000000, WR_1|RD_3|CLD|FP_D,	0,		I2,		0,	SF },
>   {"ldc1",		"E,o(b)",	0xd4000000, 0xfc000000, WR_1|RD_3|CLD|FP_D,	0,		I2,		0,	SF },
>   {"ldc1",		"T,A(b)",	0,    (int) M_LDC1_AB,	INSN_MACRO,		INSN2_M_FP_D,	I2,		0,	SF },
> -@@ -1438,7 +1444,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
> +@@ -1437,7 +1443,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
>   {"mflo",		"d,9",		0x00000012, 0xff9f07ff, WR_1|RD_LO,		0,		0,		D32,	0 },
>   {"mflo1",		"d",		0x70000012, 0xffff07ff,	WR_1|RD_LO,		0,		EE,		0,	0 },
>   {"mflhxu",		"d",		0x00000052, 0xffff07ff,	WR_1|MOD_HILO,		0,		0,		SMT,	0 },
> @@ -366,7 +375,7 @@ index b45eb40bf69..2f4eb5c0354 100644
>   {"mfsa",		"d",		0x00000028, 0xffff07ff,	WR_1,			0,		EE,		0,	0 },
>   {"min.ob",		"X,Y,Q",	0x78000006, 0xfc20003f,	WR_1|RD_2|RD_3|FP_D,	0,		SB1,		MX,	0 },
>   {"min.ob",		"D,S,Q",	0x48000006, 0xfc20003f,	WR_1|RD_2|RD_3|FP_D,	0,		N54,		0,	0 },
> -@@ -1483,10 +1489,13 @@ const struct mips_opcode mips_builtin_opcodes[] =
> +@@ -1482,10 +1488,13 @@ const struct mips_opcode mips_builtin_opcodes[] =
>   /* move is at the top of the table.  */
>   {"msgn.qh",		"X,Y,Q",	0x78200000, 0xfc20003f,	WR_1|RD_2|RD_3|FP_D,	0,		0,		MX,	0 },
>   {"msgsnd",		"t",		0,    (int) M_MSGSND,	INSN_MACRO,		0,		XLR,		0,	0 },
> @@ -382,7 +391,7 @@ index b45eb40bf69..2f4eb5c0354 100644
>   {"msub.d",		"D,R,S,T",	0x4c000029, 0xfc00003f, WR_1|RD_2|RD_3|RD_4|FP_D, 0,		I4_33,		0,	I37 },
>   {"msub.d",		"D,S,T",	0x46200019, 0xffe0003f,	WR_1|RD_2|RD_3|FP_D,	0,		IL2E,		0,	0 },
>   {"msub.d",		"D,S,T",	0x72200019, 0xffe0003f,	WR_1|RD_2|RD_3|FP_D,	0,		IL2F,		0,	0 },
> -@@ -1536,7 +1545,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
> +@@ -1535,7 +1544,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
>   {"mtlo",		"s,7",		0x00000013, 0xfc1fe7ff, RD_1|WR_LO,		0,		0,		D32,	0 },
>   {"mtlo1",		"s",		0x70000013, 0xfc1fffff,	RD_1|WR_LO,		0,		EE,		0,	0 },
>   {"mtlhx",		"s",		0x00000053, 0xfc1fffff,	RD_1|MOD_HILO,		0,		0,		SMT,	0 },
> @@ -391,7 +400,7 @@ index b45eb40bf69..2f4eb5c0354 100644
>   {"mtm0",		"s",		0x70000008, 0xfc1fffff, RD_1,			0,		IOCT,		0,	0 },
>   {"mtm0",    		"s,t",		0x70000008, 0xfc00ffff, RD_1|RD_2,		0,		IOCT3,		0,	0 },
>   {"mtm1",		"s",		0x7000000c, 0xfc1fffff, RD_1,			0,		IOCT,		0,	0 },
> -@@ -1978,9 +1987,9 @@ const struct mips_opcode mips_builtin_opcodes[] =
> +@@ -1977,9 +1986,9 @@ const struct mips_opcode mips_builtin_opcodes[] =
>   {"suxc1",		"S,t(b)",	0x4c00000d, 0xfc0007ff, RD_1|RD_2|RD_3|SM|FP_D,	0,		I5_33|N55,	0,	I37},
>   {"sw",			"t,o(b)",	0xac000000, 0xfc000000,	RD_1|RD_3|SM,		0,		I1,		0,	0 },
>   {"sw",			"t,A(b)",	0,    (int) M_SW_AB,	INSN_MACRO,		0,		I1,		0,	0 },
> @@ -401,6 +410,6 @@ index b45eb40bf69..2f4eb5c0354 100644
>  +{"swapw",		"t,b",		0x70000014, 0xfc00ffff, MOD_1|RD_2|SM,		0,		XLR|XLP,	0,	0 },
>  +{"swapwu",		"t,b",		0x70000015, 0xfc00ffff, MOD_1|RD_2|SM,		0,		XLR|XLP,	0,	0 },
>  +{"swapd",		"t,b",		0x70000016, 0xfc00ffff, MOD_1|RD_2|SM,		0,		XLR|XLP,	0,	0 },
> - {"swc0",		"E,o(b)",	0xe0000000, 0xfc000000,	RD_3|RD_C0|SM,		0,		I1,		0,	IOCT|IOCTP|IOCT2|I37 },
> - {"swc0",		"E,A(b)",	0,    (int) M_SWC0_AB,	INSN_MACRO,		0,		I1,		0,	IOCT|IOCTP|IOCT2|I37 },
> + {"swc0",		"E,o(b)",	0xe0000000, 0xfc000000,	RD_3|RD_C0|SM,		0,		I1,		0,	I2 },
> + {"swc0",		"E,A(b)",	0,    (int) M_SWC0_AB,	INSN_MACRO,		0,		I1,		0,	I2 },
>   {"swc1",		"T,o(b)",	0xe4000000, 0xfc000000,	RD_1|RD_3|SM|FP_S,	0,		I1,		0,	0 },
> diff --git a/meta/recipes-devtools/binutils/binutils/0011-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch b/meta/recipes-devtools/binutils/binutils/0011-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
> index 1041b7301e..389232c1e3 100644
> --- a/meta/recipes-devtools/binutils/binutils/0011-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0011-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
> @@ -1,4 +1,4 @@
> -From 7f4938d062146e40b4e6d427a5eca6cc6acaaeee Mon Sep 17 00:00:00 2001
> +From b77c5a67d4ac2513d0b4bab5e4dd1c33b339689b Mon Sep 17 00:00:00 2001
>  From: Zhenhua Luo <zhenhua.luo@nxp.com>
>  Date: Sat, 11 Jun 2016 22:08:29 -0500
>  Subject: [PATCH] fix the incorrect assembling for ppc wait mnemonic
> @@ -11,22 +11,22 @@ Upstream-Status: Pending
>   1 file changed, 1 insertion(+), 3 deletions(-)
>  
>  diff --git a/opcodes/ppc-opc.c b/opcodes/ppc-opc.c
> -index bbbadffad8f..72092355e12 100644
> +index 13d8b6c3c07..cd979f9c80c 100644
>  --- a/opcodes/ppc-opc.c
>  +++ b/opcodes/ppc-opc.c
> -@@ -6302,8 +6302,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
> +@@ -6378,8 +6378,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
>   {"waitasec",	X(31,30),      XRTRARB_MASK, POWER8,	POWER9,		{0}},
> - {"waitrsv",	XWCPL(31,30,1,0),0xffffffff, POWER10,	0,		{0}},
> - {"pause_short",	XWCPL(31,30,2,0),0xffffffff, POWER10,	0,		{0}},
> + {"waitrsv",	XWCPL(31,30,1,0),0xffffffff, POWER10,	EXT,		{0}},
> + {"pause_short",	XWCPL(31,30,2,0),0xffffffff, POWER10,	EXT,		{0}},
>  -{"wait",	X(31,30),	XWCPL_MASK,  POWER10,	0,		{WC, PL}},
>  -{"wait",	X(31,30),	XWC_MASK,    POWER9,	POWER10,	{WC}},
>   
>   {"lwepx",	X(31,31),	X_MASK,	  E500MC|PPCA2, 0,		{RT, RA0, RB}},
>   
> -@@ -6363,7 +6361,7 @@ const struct powerpc_opcode powerpc_opcodes[] = {
> +@@ -6433,7 +6431,7 @@ const struct powerpc_opcode powerpc_opcodes[] = {
>   
> - {"waitrsv",	X(31,62)|(1<<21), 0xffffffff, E500MC|PPCA2, 0,		{0}},
> - {"waitimpl",	X(31,62)|(2<<21), 0xffffffff, E500MC|PPCA2, 0,		{0}},
> + {"waitrsv",	X(31,62)|(1<<21), 0xffffffff, E500MC|PPCA2, EXT,	{0}},
> + {"waitimpl",	X(31,62)|(2<<21), 0xffffffff, E500MC|PPCA2, EXT,	{0}},
>  -{"wait",	X(31,62),	XWC_MASK,    E500MC|PPCA2, 0,		{WC}},
>  +{"wait",	X(31,62),	XWC_MASK,    E500MC|PPCA2|POWER9|POWER10, 0,	{WC}},
>   
> diff --git a/meta/recipes-devtools/binutils/binutils/0012-Detect-64-bit-MIPS-targets.patch b/meta/recipes-devtools/binutils/binutils/0012-Detect-64-bit-MIPS-targets.patch
> index 659ae799ad..04f81c6671 100644
> --- a/meta/recipes-devtools/binutils/binutils/0012-Detect-64-bit-MIPS-targets.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0012-Detect-64-bit-MIPS-targets.patch
> @@ -1,4 +1,4 @@
> -From bb229568e505f2276ca58b72fef6781034fa839f Mon Sep 17 00:00:00 2001
> +From 02374940dd34fddd2b04624af3f23e01f9cb81cd Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 31 Mar 2017 11:42:03 -0700
>  Subject: [PATCH] Detect 64-bit MIPS targets
> diff --git a/meta/recipes-devtools/binutils/binutils/0013-Use-libtool-2.4.patch b/meta/recipes-devtools/binutils/binutils/0013-Use-libtool-2.4.patch
> index d4067691cf..a75e72105f 100644
> --- a/meta/recipes-devtools/binutils/binutils/0013-Use-libtool-2.4.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0013-Use-libtool-2.4.patch
> @@ -1,4 +1,4 @@
> -From a1031fca1b6c1348c078bb8a9df6e7d29148dae1 Mon Sep 17 00:00:00 2001
> +From fd34d57c9e2a0bff1283a6707062ed4a42476b10 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Sun, 14 Feb 2016 17:04:07 +0000
>  Subject: [PATCH] Use libtool 2.4
> @@ -9,24 +9,24 @@ Upstream-Status: Pending
>  
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> - bfd/configure      | 1322 +++++++++++++++-----
> + bfd/configure      | 1340 +++++++++++++++-----
>   bfd/configure.ac   |    2 +-
> - binutils/configure | 1320 +++++++++++++++-----
> - gas/configure      | 1320 +++++++++++++++-----
> - gprof/configure    | 1320 +++++++++++++++-----
> - ld/configure       | 1695 ++++++++++++++++++-------
> - libctf/configure   | 1319 +++++++++++++++-----
> - libtool.m4         | 1080 +++++++++++-----
> + binutils/configure | 1338 +++++++++++++++-----
> + gas/configure      | 1338 +++++++++++++++-----
> + gprof/configure    | 1338 +++++++++++++++-----
> + ld/configure       | 1713 +++++++++++++++++++-------
> + libctf/configure   | 1337 +++++++++++++++-----
> + libtool.m4         | 1100 +++++++++++------
>   ltmain.sh          | 2925 +++++++++++++++++++++++++++++---------------
>   ltoptions.m4       |    2 +-
>   ltversion.m4       |   12 +-
>   lt~obsolete.m4     |    2 +-
> - opcodes/configure  | 1320 +++++++++++++++-----
> - zlib/configure     | 1320 +++++++++++++++-----
> - 14 files changed, 10931 insertions(+), 4028 deletions(-)
> + opcodes/configure  | 1338 +++++++++++++++-----
> + zlib/configure     | 1338 +++++++++++++++-----
> + 14 files changed, 10995 insertions(+), 4128 deletions(-)
>  
>  diff --git a/bfd/configure b/bfd/configure
> -index b3665c68c13..376b951d496 100755
> +index daa51244369..79d0c4b4623 100755
>  --- a/bfd/configure
>  +++ b/bfd/configure
>  @@ -705,6 +705,9 @@ OTOOL
> @@ -47,7 +47,7 @@ index b3665c68c13..376b951d496 100755
>   enable_libtool_lock
>   enable_plugins
>   enable_largefile
> -@@ -1505,6 +1509,8 @@ Optional Packages:
> +@@ -1507,6 +1511,8 @@ Optional Packages:
>     --with-pic              try to use only PIC/non-PIC objects [default=use
>                             both]
>     --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
> @@ -56,7 +56,7 @@ index b3665c68c13..376b951d496 100755
>     --with-mmap             try using mmap for BFD input files if available
>     --with-separate-debug-dir=DIR
>                             Look for global separate debug info in DIR
> -@@ -5694,8 +5700,8 @@ esac
> +@@ -4988,8 +4994,8 @@ esac
>   
>   
>   
> @@ -67,7 +67,7 @@ index b3665c68c13..376b951d496 100755
>   
>   
>   
> -@@ -5735,7 +5741,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> +@@ -5029,7 +5035,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
>   $as_echo_n "checking how to print strings... " >&6; }
>   # Test print first, because it will be a builtin if present.
> @@ -76,7 +76,7 @@ index b3665c68c13..376b951d496 100755
>      test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
>     ECHO='print -r --'
>   elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
> -@@ -6421,8 +6427,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
> +@@ -5715,8 +5721,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
>   # Try some XSI features
>   xsi_shell=no
>   ( _lt_dummy="a/b/c"
> @@ -87,7 +87,7 @@ index b3665c68c13..376b951d496 100755
>       && eval 'test $(( 1 + 1 )) -eq 2 \
>       && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
>     && xsi_shell=yes
> -@@ -6471,6 +6477,80 @@ esac
> +@@ -5765,6 +5771,80 @@ esac
>   
>   
>   
> @@ -168,7 +168,7 @@ index b3665c68c13..376b951d496 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
>   $as_echo_n "checking for $LD option to reload object files... " >&6; }
>   if ${lt_cv_ld_reload_flag+:} false; then :
> -@@ -6487,6 +6567,11 @@ case $reload_flag in
> +@@ -5781,6 +5861,11 @@ case $reload_flag in
>   esac
>   reload_cmds='$LD$reload_flag -o $output$reload_objs'
>   case $host_os in
> @@ -180,7 +180,7 @@ index b3665c68c13..376b951d496 100755
>     darwin*)
>       if test "$GCC" = yes; then
>         reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
> -@@ -6655,7 +6740,8 @@ mingw* | pw32*)
> +@@ -5949,7 +6034,8 @@ mingw* | pw32*)
>       lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
>       lt_cv_file_magic_cmd='func_win32_libid'
>     else
> @@ -190,7 +190,7 @@ index b3665c68c13..376b951d496 100755
>       lt_cv_file_magic_cmd='$OBJDUMP -f'
>     fi
>     ;;
> -@@ -6809,6 +6895,21 @@ esac
> +@@ -6103,6 +6189,21 @@ esac
>   fi
>   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
>   $as_echo "$lt_cv_deplibs_check_method" >&6; }
> @@ -212,7 +212,7 @@ index b3665c68c13..376b951d496 100755
>   file_magic_cmd=$lt_cv_file_magic_cmd
>   deplibs_check_method=$lt_cv_deplibs_check_method
>   test -z "$deplibs_check_method" && deplibs_check_method=unknown
> -@@ -6822,11 +6923,164 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
> +@@ -6118,6 +6219,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
>   
>   
>   
> @@ -226,11 +226,7 @@ index b3665c68c13..376b951d496 100755
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
> @@ -371,7 +367,15 @@ index b3665c68c13..376b951d496 100755
>  +
>  +
>  +
> -+if test -n "$ac_tool_prefix"; then
> + plugin_option=
> + plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
> + for plugin in $plugin_names; do
> +@@ -6132,8 +6384,10 @@ for plugin in $plugin_names; do
> + done
> + 
> + if test -n "$ac_tool_prefix"; then
> +-  # Extract the first word of "${ac_tool_prefix}ar", so it can be a program name with args.
> +-set dummy ${ac_tool_prefix}ar; ac_word=$2
>  +  for ac_prog in ar
>  +  do
>  +    # Extract the first word of "$ac_tool_prefix$ac_prog", so it can be a program name with args.
> @@ -379,7 +383,7 @@ index b3665c68c13..376b951d496 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_AR+:} false; then :
> -@@ -6842,7 +7096,7 @@ do
> +@@ -6149,7 +6403,7 @@ do
>     test -z "$as_dir" && as_dir=.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -388,7 +392,7 @@ index b3665c68c13..376b951d496 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -6862,11 +7116,15 @@ $as_echo "no" >&6; }
> +@@ -6169,11 +6423,15 @@ $as_echo "no" >&6; }
>   fi
>   
>   
> @@ -407,7 +411,7 @@ index b3665c68c13..376b951d496 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_ac_ct_AR+:} false; then :
> -@@ -6882,7 +7140,7 @@ do
> +@@ -6189,7 +6447,7 @@ do
>     test -z "$as_dir" && as_dir=.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -416,7 +420,7 @@ index b3665c68c13..376b951d496 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -6901,6 +7159,10 @@ else
> +@@ -6208,6 +6466,10 @@ else
>   $as_echo "no" >&6; }
>   fi
>   
> @@ -427,7 +431,7 @@ index b3665c68c13..376b951d496 100755
>     if test "x$ac_ct_AR" = x; then
>       AR="false"
>     else
> -@@ -6912,16 +7174,72 @@ ac_tool_warned=yes ;;
> +@@ -6219,25 +6481,20 @@ ac_tool_warned=yes ;;
>   esac
>       AR=$ac_ct_AR
>     fi
> @@ -436,20 +440,37 @@ index b3665c68c13..376b951d496 100755
>   fi
>   
>  -test -z "$AR" && AR=ar
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
>  -test -z "$AR_FLAGS" && AR_FLAGS=cru
> ++  rm -f conftest.*
>  +: ${AR=ar}
>  +: ${AR_FLAGS=cru}
>  +
> -+
> -+
> -+
> -+
> -+
> -+
> -+
> -+
> -+
> -+
> + 
> + 
> + 
> +@@ -6248,6 +6505,63 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
> + 
> + 
> + 
>  +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE support" >&5
>  +$as_echo_n "checking for archiver @FILE support... " >&6; }
>  +if ${lt_cv_ar_at_file+:} false; then :
> @@ -462,7 +483,7 @@ index b3665c68c13..376b951d496 100755
>  +int
>  +main ()
>  +{
> - 
> ++
>  +  ;
>  +  return 0;
>  +}
> @@ -488,23 +509,29 @@ index b3665c68c13..376b951d496 100755
>  +        fi
>  +      fi
>  +      rm -f conftest.* libconftest.a
> - 
> ++
>  +fi
>  +rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
> - 
> ++
>  +fi
>  +{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_ar_at_file" >&5
>  +$as_echo "$lt_cv_ar_at_file" >&6; }
> - 
> ++
>  +if test "x$lt_cv_ar_at_file" = xno; then
>  +  archiver_list_spec=
>  +else
>  +  archiver_list_spec=$lt_cv_ar_at_file
>  +fi
> ++
> ++
> ++
> ++
> ++
> ++
>   
> - 
> - 
> -@@ -7263,8 +7581,8 @@ esac
> + if test -n "$ac_tool_prefix"; then
> +   # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
> +@@ -6588,8 +6902,8 @@ esac
>   lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
>   
>   # Transform an extracted symbol line into symbol name and symbol address
> @@ -515,7 +542,7 @@ index b3665c68c13..376b951d496 100755
>   
>   # Handle CRLF in mingw tool chain
>   opt_cr=
> -@@ -7300,6 +7618,7 @@ for ac_symprfx in "" "_"; do
> +@@ -6625,6 +6939,7 @@ for ac_symprfx in "" "_"; do
>     else
>       lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
>     fi
> @@ -523,7 +550,7 @@ index b3665c68c13..376b951d496 100755
>   
>     # Check to see that the pipe works correctly.
>     pipe_works=no
> -@@ -7341,6 +7660,18 @@ _LT_EOF
> +@@ -6666,6 +6981,18 @@ _LT_EOF
>         if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
>   	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
>   	  cat <<_LT_EOF > conftest.$ac_ext
> @@ -542,7 +569,7 @@ index b3665c68c13..376b951d496 100755
>   #ifdef __cplusplus
>   extern "C" {
>   #endif
> -@@ -7352,7 +7683,7 @@ _LT_EOF
> +@@ -6677,7 +7004,7 @@ _LT_EOF
>   	  cat <<_LT_EOF >> conftest.$ac_ext
>   
>   /* The mapping between symbol names and symbols.  */
> @@ -551,7 +578,7 @@ index b3665c68c13..376b951d496 100755
>     const char *name;
>     void       *address;
>   }
> -@@ -7378,8 +7709,8 @@ static const void *lt_preloaded_setup() {
> +@@ -6703,8 +7030,8 @@ static const void *lt_preloaded_setup() {
>   _LT_EOF
>   	  # Now try linking the two files.
>   	  mv conftest.$ac_objext conftstm.$ac_objext
> @@ -562,7 +589,7 @@ index b3665c68c13..376b951d496 100755
>   	  LIBS="conftstm.$ac_objext"
>   	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
>   	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
> -@@ -7389,8 +7720,8 @@ _LT_EOF
> +@@ -6714,8 +7041,8 @@ _LT_EOF
>     test $ac_status = 0; } && test -s conftest${ac_exeext}; then
>   	    pipe_works=yes
>   	  fi
> @@ -573,7 +600,7 @@ index b3665c68c13..376b951d496 100755
>   	else
>   	  echo "cannot find nm_test_func in $nlist" >&5
>   	fi
> -@@ -7427,6 +7758,16 @@ else
> +@@ -6752,6 +7079,14 @@ else
>   $as_echo "ok" >&6; }
>   fi
>   
> @@ -585,12 +612,10 @@ index b3665c68c13..376b951d496 100755
>  +fi
>  +
>  +
> -+
> -+
>   
>   
>   
> -@@ -7443,6 +7784,45 @@ fi
> +@@ -6770,6 +7105,47 @@ fi
>   
>   
>   
> @@ -633,10 +658,12 @@ index b3665c68c13..376b951d496 100755
>  +
>  + { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
>  +$as_echo "${lt_sysroot:-no}" >&6; }
> ++
> ++
>   
>   
>   
> -@@ -7654,6 +8034,123 @@ esac
> +@@ -6979,6 +7355,123 @@ esac
>   
>   need_locks="$enable_libtool_lock"
>   
> @@ -760,7 +787,7 @@ index b3665c68c13..376b951d496 100755
>   
>     case $host_os in
>       rhapsody* | darwin*)
> -@@ -8217,6 +8714,8 @@ _LT_EOF
> +@@ -7542,6 +8035,8 @@ _LT_EOF
>         $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
>         echo "$AR cru libconftest.a conftest.o" >&5
>         $AR cru libconftest.a conftest.o 2>&5
> @@ -769,7 +796,7 @@ index b3665c68c13..376b951d496 100755
>         cat > conftest.c << _LT_EOF
>   int main() { return 0;}
>   _LT_EOF
> -@@ -8381,7 +8880,8 @@ fi
> +@@ -7706,7 +8201,8 @@ fi
>   LIBTOOL_DEPS="$ltmain"
>   
>   # Always use our own libtool.
> @@ -779,7 +806,7 @@ index b3665c68c13..376b951d496 100755
>   
>   
>   
> -@@ -8470,7 +8970,7 @@ aix3*)
> +@@ -7795,7 +8291,7 @@ aix3*)
>   esac
>   
>   # Global variables:
> @@ -788,7 +815,7 @@ index b3665c68c13..376b951d496 100755
>   can_build_shared=yes
>   
>   # All known linkers require a `.a' archive for static linking (except MSVC,
> -@@ -8768,8 +9268,6 @@ fi
> +@@ -8093,8 +8589,6 @@ fi
>   lt_prog_compiler_pic=
>   lt_prog_compiler_static=
>   
> @@ -797,7 +824,7 @@ index b3665c68c13..376b951d496 100755
>   
>     if test "$GCC" = yes; then
>       lt_prog_compiler_wl='-Wl,'
> -@@ -8935,6 +9433,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -8260,6 +8754,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>   	lt_prog_compiler_pic='--shared'
>   	lt_prog_compiler_static='--static'
>   	;;
> @@ -810,7 +837,7 @@ index b3665c68c13..376b951d496 100755
>         pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
>           # Portland Group compilers (*not* the Pentium gcc compiler,
>   	# which looks to be a dead project)
> -@@ -8997,7 +9501,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -8322,7 +8822,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>         lt_prog_compiler_pic='-KPIC'
>         lt_prog_compiler_static='-Bstatic'
>         case $cc_basename in
> @@ -819,7 +846,7 @@ index b3665c68c13..376b951d496 100755
>   	lt_prog_compiler_wl='-Qoption ld ';;
>         *)
>   	lt_prog_compiler_wl='-Wl,';;
> -@@ -9054,13 +9558,17 @@ case $host_os in
> +@@ -8379,13 +8879,17 @@ case $host_os in
>       lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
>       ;;
>   esac
> @@ -843,7 +870,7 @@ index b3665c68c13..376b951d496 100755
>   
>   #
>   # Check to make sure the PIC flag actually works.
> -@@ -9121,6 +9629,11 @@ fi
> +@@ -8446,6 +8950,11 @@ fi
>   
>   
>   
> @@ -855,7 +882,7 @@ index b3665c68c13..376b951d496 100755
>   #
>   # Check to make sure the static flag actually works.
>   #
> -@@ -9471,7 +9984,8 @@ _LT_EOF
> +@@ -8796,7 +9305,8 @@ _LT_EOF
>         allow_undefined_flag=unsupported
>         always_export_symbols=no
>         enable_shared_with_static_runtimes=yes
> @@ -865,7 +892,7 @@ index b3665c68c13..376b951d496 100755
>   
>         if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
>           archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
> -@@ -9570,12 +10084,12 @@ _LT_EOF
> +@@ -8895,12 +9405,12 @@ _LT_EOF
>   	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
>   	  hardcode_libdir_flag_spec=
>   	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
> @@ -880,7 +907,7 @@ index b3665c68c13..376b951d496 100755
>   	  fi
>   	  ;;
>   	esac
> -@@ -9589,8 +10103,8 @@ _LT_EOF
> +@@ -8914,8 +9424,8 @@ _LT_EOF
>   	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
>   	wlarc=
>         else
> @@ -891,7 +918,7 @@ index b3665c68c13..376b951d496 100755
>         fi
>         ;;
>   
> -@@ -9608,8 +10122,8 @@ _LT_EOF
> +@@ -8933,8 +9443,8 @@ _LT_EOF
>   
>   _LT_EOF
>         elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -902,7 +929,7 @@ index b3665c68c13..376b951d496 100755
>         else
>   	ld_shlibs=no
>         fi
> -@@ -9655,8 +10169,8 @@ _LT_EOF
> +@@ -8980,8 +9490,8 @@ _LT_EOF
>   
>       *)
>         if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -913,7 +940,7 @@ index b3665c68c13..376b951d496 100755
>         else
>   	ld_shlibs=no
>         fi
> -@@ -9786,7 +10300,13 @@ _LT_EOF
> +@@ -9111,7 +9621,13 @@ _LT_EOF
>   	allow_undefined_flag='-berok'
>           # Determine the default libpath from the value encoded in an
>           # empty executable.
> @@ -928,7 +955,7 @@ index b3665c68c13..376b951d496 100755
>   /* end confdefs.h.  */
>   
>   int
> -@@ -9799,22 +10319,29 @@ main ()
> +@@ -9124,22 +9640,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>   
> @@ -971,7 +998,7 @@ index b3665c68c13..376b951d496 100755
>   
>           hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>           archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> -@@ -9826,7 +10353,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9151,7 +9674,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	else
>   	 # Determine the default libpath from the value encoded in an
>   	 # empty executable.
> @@ -986,7 +1013,7 @@ index b3665c68c13..376b951d496 100755
>   /* end confdefs.h.  */
>   
>   int
> -@@ -9839,22 +10372,29 @@ main ()
> +@@ -9164,22 +9693,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>   
> @@ -1029,7 +1056,7 @@ index b3665c68c13..376b951d496 100755
>   
>   	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>   	  # Warning - without using the other run time loading flags,
> -@@ -9899,20 +10439,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9224,20 +9760,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>         # Microsoft Visual C++.
>         # hardcode_libdir_flag_spec is actually meaningless, as there is
>         # no search path for DLLs.
> @@ -1107,7 +1134,7 @@ index b3665c68c13..376b951d496 100755
>         ;;
>   
>       darwin* | rhapsody*)
> -@@ -9973,7 +10556,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9298,7 +9877,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
>       freebsd* | dragonfly*)
> @@ -1116,7 +1143,7 @@ index b3665c68c13..376b951d496 100755
>         hardcode_libdir_flag_spec='-R$libdir'
>         hardcode_direct=yes
>         hardcode_shlibpath_var=no
> -@@ -9981,7 +10564,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9306,7 +9885,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       hpux9*)
>         if test "$GCC" = yes; then
> @@ -1125,7 +1152,7 @@ index b3665c68c13..376b951d496 100755
>         else
>   	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
>         fi
> -@@ -9997,7 +10580,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9322,7 +9901,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       hpux10*)
>         if test "$GCC" = yes && test "$with_gnu_ld" = no; then
> @@ -1134,7 +1161,7 @@ index b3665c68c13..376b951d496 100755
>         else
>   	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
>         fi
> -@@ -10021,10 +10604,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9346,10 +9925,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
>   	  ;;
>   	ia64*)
> @@ -1147,7 +1174,7 @@ index b3665c68c13..376b951d496 100755
>   	  ;;
>   	esac
>         else
> -@@ -10103,23 +10686,36 @@ fi
> +@@ -9428,23 +10007,36 @@ fi
>   
>       irix5* | irix6* | nonstopux*)
>         if test "$GCC" = yes; then
> @@ -1192,7 +1219,7 @@ index b3665c68c13..376b951d496 100755
>         else
>   	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
>   	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
> -@@ -10204,7 +10800,7 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9529,7 +10121,7 @@ rm -f core conftest.err conftest.$ac_objext \
>       osf4* | osf5*)	# as osf3* with the addition of -msym flag
>         if test "$GCC" = yes; then
>   	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
> @@ -1201,7 +1228,7 @@ index b3665c68c13..376b951d496 100755
>   	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
>         else
>   	allow_undefined_flag=' -expect_unresolved \*'
> -@@ -10223,9 +10819,9 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9548,9 +10140,9 @@ rm -f core conftest.err conftest.$ac_objext \
>         no_undefined_flag=' -z defs'
>         if test "$GCC" = yes; then
>   	wlarc='${wl}'
> @@ -1213,7 +1240,7 @@ index b3665c68c13..376b951d496 100755
>         else
>   	case `$CC -V 2>&1` in
>   	*"Compilers 5.0"*)
> -@@ -10801,8 +11397,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -10126,8 +10718,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>     need_version=no
>     need_lib_prefix=no
>   
> @@ -1225,7 +1252,7 @@ index b3665c68c13..376b951d496 100755
>       library_names_spec='$libname.dll.a'
>       # DLL is installed to $(libdir)/../bin by postinstall_cmds
>       postinstall_cmds='base_file=`basename \${file}`~
> -@@ -10835,13 +11432,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -10160,13 +10753,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>         library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>         ;;
>       esac
> @@ -1298,7 +1325,7 @@ index b3665c68c13..376b951d496 100755
>     # FIXME: first we should search . and the directory the executable is in
>     shlibpath_var=PATH
>     ;;
> -@@ -10923,7 +11578,7 @@ haiku*)
> +@@ -10248,7 +10899,7 @@ haiku*)
>     soname_spec='${libname}${release}${shared_ext}$major'
>     shlibpath_var=LIBRARY_PATH
>     shlibpath_overrides_runpath=yes
> @@ -1307,16 +1334,16 @@ index b3665c68c13..376b951d496 100755
>     hardcode_into_libs=yes
>     ;;
>   
> -@@ -11719,7 +12374,7 @@ else
> +@@ -11044,7 +11695,7 @@ else
>     lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>     lt_status=$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 11722 "configure"
> +-#line 11047 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>   
>   #if HAVE_DLFCN_H
> -@@ -11763,10 +12418,10 @@ else
> +@@ -11088,10 +11739,10 @@ else
>   /* When -fvisbility=hidden is used, assume the code has been annotated
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -1329,16 +1356,16 @@ index b3665c68c13..376b951d496 100755
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -11825,7 +12480,7 @@ else
> +@@ -11150,7 +11801,7 @@ else
>     lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>     lt_status=$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 11828 "configure"
> +-#line 11153 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>   
>   #if HAVE_DLFCN_H
> -@@ -11869,10 +12524,10 @@ else
> +@@ -11194,10 +11845,10 @@ else
>   /* When -fvisbility=hidden is used, assume the code has been annotated
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -1351,16 +1378,16 @@ index b3665c68c13..376b951d496 100755
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -14599,7 +15254,7 @@ SHARED_LDFLAGS=
> +@@ -13114,7 +13765,7 @@ SHARED_LDFLAGS=
>   if test "$enable_shared" = "yes"; then
>     x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
>     if test -n "$x"; then
>  -    SHARED_LIBADD="-L`pwd`/../libiberty/pic -liberty"
>  +    SHARED_LIBADD="`pwd`/../libiberty/pic/libiberty.a"
>     fi
> + fi
>   
> -   case "${host}" in
> -@@ -17199,13 +17854,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
> +@@ -15762,13 +16413,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
>   lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>   lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>   lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -1381,7 +1408,7 @@ index b3665c68c13..376b951d496 100755
>   STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>   RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>   old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
> -@@ -17220,14 +17882,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
> +@@ -15783,14 +16441,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
>   lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
> @@ -1400,7 +1427,7 @@ index b3665c68c13..376b951d496 100755
>   DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>   NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>   LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -17260,12 +17925,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
> +@@ -15823,12 +16484,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
>   hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
>   inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
>   link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
> @@ -1414,7 +1441,7 @@ index b3665c68c13..376b951d496 100755
>   file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
>   variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
>   need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
> -@@ -17320,8 +17985,13 @@ reload_flag \
> +@@ -15883,8 +16544,13 @@ reload_flag \
>   OBJDUMP \
>   deplibs_check_method \
>   file_magic_cmd \
> @@ -1428,7 +1455,7 @@ index b3665c68c13..376b951d496 100755
>   STRIP \
>   RANLIB \
>   CC \
> -@@ -17331,12 +18001,14 @@ lt_cv_sys_global_symbol_pipe \
> +@@ -15894,12 +16560,14 @@ lt_cv_sys_global_symbol_pipe \
>   lt_cv_sys_global_symbol_to_cdecl \
>   lt_cv_sys_global_symbol_to_c_name_address \
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -1444,7 +1471,7 @@ index b3665c68c13..376b951d496 100755
>   DSYMUTIL \
>   NMEDIT \
>   LIPO \
> -@@ -17352,7 +18024,6 @@ no_undefined_flag \
> +@@ -15915,7 +16583,6 @@ no_undefined_flag \
>   hardcode_libdir_flag_spec \
>   hardcode_libdir_flag_spec_ld \
>   hardcode_libdir_separator \
> @@ -1452,7 +1479,7 @@ index b3665c68c13..376b951d496 100755
>   exclude_expsyms \
>   include_expsyms \
>   file_list_spec \
> -@@ -17388,6 +18059,7 @@ module_cmds \
> +@@ -15951,6 +16618,7 @@ module_cmds \
>   module_expsym_cmds \
>   export_symbols_cmds \
>   prelink_cmds \
> @@ -1460,7 +1487,7 @@ index b3665c68c13..376b951d496 100755
>   postinstall_cmds \
>   postuninstall_cmds \
>   finish_cmds \
> -@@ -18176,7 +18848,8 @@ $as_echo X"$file" |
> +@@ -16720,7 +17388,8 @@ $as_echo X"$file" |
>   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>   #
>   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -1470,7 +1497,7 @@ index b3665c68c13..376b951d496 100755
>   #   Written by Gordon Matzigkeit, 1996
>   #
>   #   This file is part of GNU Libtool.
> -@@ -18279,19 +18952,42 @@ SP2NL=$lt_lt_SP2NL
> +@@ -16823,19 +17492,42 @@ SP2NL=$lt_lt_SP2NL
>   # turn newlines into spaces.
>   NL2SP=$lt_lt_NL2SP
>   
> @@ -1514,7 +1541,7 @@ index b3665c68c13..376b951d496 100755
>   # A symbol stripping program.
>   STRIP=$lt_STRIP
>   
> -@@ -18321,6 +19017,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
> +@@ -16865,6 +17557,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
>   # Transform the output of nm in a C name address pair when lib prefix is needed.
>   global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
>   
> @@ -1527,7 +1554,7 @@ index b3665c68c13..376b951d496 100755
>   # The name of the directory that contains temporary libtool files.
>   objdir=$objdir
>   
> -@@ -18330,6 +19032,9 @@ MAGIC_CMD=$MAGIC_CMD
> +@@ -16874,6 +17572,9 @@ MAGIC_CMD=$MAGIC_CMD
>   # Must we lock files when doing compilation?
>   need_locks=$lt_need_locks
>   
> @@ -1537,7 +1564,7 @@ index b3665c68c13..376b951d496 100755
>   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>   DSYMUTIL=$lt_DSYMUTIL
>   
> -@@ -18444,12 +19149,12 @@ with_gcc=$GCC
> +@@ -16988,12 +17689,12 @@ with_gcc=$GCC
>   # Compiler flag to turn off builtin functions.
>   no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
>   
> @@ -1553,7 +1580,7 @@ index b3665c68c13..376b951d496 100755
>   # Compiler flag to prevent dynamic linking.
>   link_static_flag=$lt_lt_prog_compiler_static
>   
> -@@ -18536,9 +19241,6 @@ inherit_rpath=$inherit_rpath
> +@@ -17080,9 +17781,6 @@ inherit_rpath=$inherit_rpath
>   # Whether libtool must link a program against all its dependency libraries.
>   link_all_deplibs=$link_all_deplibs
>   
> @@ -1563,7 +1590,7 @@ index b3665c68c13..376b951d496 100755
>   # Set to "yes" if exported symbols are required.
>   always_export_symbols=$always_export_symbols
>   
> -@@ -18554,6 +19256,9 @@ include_expsyms=$lt_include_expsyms
> +@@ -17098,6 +17796,9 @@ include_expsyms=$lt_include_expsyms
>   # Commands necessary for linking programs (against libraries) with templates.
>   prelink_cmds=$lt_prelink_cmds
>   
> @@ -1573,7 +1600,7 @@ index b3665c68c13..376b951d496 100755
>   # Specify filename containing input files.
>   file_list_spec=$lt_file_list_spec
>   
> -@@ -18586,210 +19291,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
> +@@ -17130,210 +17831,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
>     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>     # text mode, it properly converts lines to CR/LF.  This bash problem
>     # is reportedly fixed, but why not run on old versions too?
> @@ -1948,23 +1975,23 @@ index b3665c68c13..376b951d496 100755
>     chmod +x "$ofile"
>   
>  diff --git a/bfd/configure.ac b/bfd/configure.ac
> -index 0797a08ff37..133d714cf18 100644
> +index 07a75ed1626..288374c504c 100644
>  --- a/bfd/configure.ac
>  +++ b/bfd/configure.ac
> -@@ -315,7 +315,7 @@ changequote(,)dnl
> +@@ -304,7 +304,7 @@ changequote(,)dnl
>     x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
>   changequote([,])dnl
>     if test -n "$x"; then
>  -    SHARED_LIBADD="-L`pwd`/../libiberty/pic -liberty"
>  +    SHARED_LIBADD="`pwd`/../libiberty/pic/libiberty.a"
>     fi
> + fi
>   
> -   case "${host}" in
>  diff --git a/binutils/configure b/binutils/configure
> -index 83b4b0172db..2154238189e 100755
> +index bf6461dab1e..8e6f6d30b4d 100755
>  --- a/binutils/configure
>  +++ b/binutils/configure
> -@@ -697,8 +697,11 @@ OTOOL
> +@@ -696,8 +696,11 @@ OTOOL
>   LIPO
>   NMEDIT
>   DSYMUTIL
> @@ -1976,7 +2003,7 @@ index 83b4b0172db..2154238189e 100755
>   OBJDUMP
>   LN_S
>   NM
> -@@ -815,6 +818,7 @@ enable_static
> +@@ -814,6 +817,7 @@ enable_static
>   with_pic
>   enable_fast_install
>   with_gnu_ld
> @@ -1984,7 +2011,7 @@ index 83b4b0172db..2154238189e 100755
>   enable_libtool_lock
>   enable_plugins
>   enable_largefile
> -@@ -1504,6 +1508,8 @@ Optional Packages:
> +@@ -1509,6 +1513,8 @@ Optional Packages:
>     --with-pic              try to use only PIC/non-PIC objects [default=use
>                             both]
>     --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
> @@ -1993,7 +2020,7 @@ index 83b4b0172db..2154238189e 100755
>     --with-debuginfod       Enable debuginfo lookups with debuginfod
>                             (auto/yes/no)
>     --with-system-zlib      use installed libz
> -@@ -5490,8 +5496,8 @@ esac
> +@@ -4844,8 +4850,8 @@ esac
>   
>   
>   
> @@ -2004,7 +2031,7 @@ index 83b4b0172db..2154238189e 100755
>   
>   
>   
> -@@ -5531,7 +5537,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> +@@ -4885,7 +4891,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
>   $as_echo_n "checking how to print strings... " >&6; }
>   # Test print first, because it will be a builtin if present.
> @@ -2013,7 +2040,7 @@ index 83b4b0172db..2154238189e 100755
>      test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
>     ECHO='print -r --'
>   elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
> -@@ -6217,8 +6223,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
> +@@ -5571,8 +5577,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
>   # Try some XSI features
>   xsi_shell=no
>   ( _lt_dummy="a/b/c"
> @@ -2024,7 +2051,7 @@ index 83b4b0172db..2154238189e 100755
>       && eval 'test $(( 1 + 1 )) -eq 2 \
>       && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
>     && xsi_shell=yes
> -@@ -6267,6 +6273,80 @@ esac
> +@@ -5621,6 +5627,80 @@ esac
>   
>   
>   
> @@ -2105,7 +2132,7 @@ index 83b4b0172db..2154238189e 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
>   $as_echo_n "checking for $LD option to reload object files... " >&6; }
>   if ${lt_cv_ld_reload_flag+:} false; then :
> -@@ -6283,6 +6363,11 @@ case $reload_flag in
> +@@ -5637,6 +5717,11 @@ case $reload_flag in
>   esac
>   reload_cmds='$LD$reload_flag -o $output$reload_objs'
>   case $host_os in
> @@ -2117,7 +2144,7 @@ index 83b4b0172db..2154238189e 100755
>     darwin*)
>       if test "$GCC" = yes; then
>         reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
> -@@ -6451,7 +6536,8 @@ mingw* | pw32*)
> +@@ -5805,7 +5890,8 @@ mingw* | pw32*)
>       lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
>       lt_cv_file_magic_cmd='func_win32_libid'
>     else
> @@ -2127,7 +2154,7 @@ index 83b4b0172db..2154238189e 100755
>       lt_cv_file_magic_cmd='$OBJDUMP -f'
>     fi
>     ;;
> -@@ -6605,6 +6691,21 @@ esac
> +@@ -5959,6 +6045,21 @@ esac
>   fi
>   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
>   $as_echo "$lt_cv_deplibs_check_method" >&6; }
> @@ -2149,7 +2176,7 @@ index 83b4b0172db..2154238189e 100755
>   file_magic_cmd=$lt_cv_file_magic_cmd
>   deplibs_check_method=$lt_cv_deplibs_check_method
>   test -z "$deplibs_check_method" && deplibs_check_method=unknown
> -@@ -6620,9 +6721,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
> +@@ -5974,6 +6075,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
>   
>   
>   
> @@ -2304,6 +2331,12 @@ index 83b4b0172db..2154238189e 100755
>  +
>  +
>  +
> + plugin_option=
> + plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
> + for plugin in $plugin_names; do
> +@@ -5988,8 +6240,10 @@ for plugin in $plugin_names; do
> + done
> + 
>   if test -n "$ac_tool_prefix"; then
>  -  # Extract the first word of "${ac_tool_prefix}ar", so it can be a program name with args.
>  -set dummy ${ac_tool_prefix}ar; ac_word=$2
> @@ -2314,7 +2347,7 @@ index 83b4b0172db..2154238189e 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_AR+:} false; then :
> -@@ -6638,7 +6892,7 @@ do
> +@@ -6005,7 +6259,7 @@ do
>     test -z "$as_dir" && as_dir=.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -2323,7 +2356,7 @@ index 83b4b0172db..2154238189e 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -6658,11 +6912,15 @@ $as_echo "no" >&6; }
> +@@ -6025,11 +6279,15 @@ $as_echo "no" >&6; }
>   fi
>   
>   
> @@ -2342,7 +2375,7 @@ index 83b4b0172db..2154238189e 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_ac_ct_AR+:} false; then :
> -@@ -6678,7 +6936,7 @@ do
> +@@ -6045,7 +6303,7 @@ do
>     test -z "$as_dir" && as_dir=.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -2351,7 +2384,7 @@ index 83b4b0172db..2154238189e 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -6697,6 +6955,10 @@ else
> +@@ -6064,6 +6322,10 @@ else
>   $as_echo "no" >&6; }
>   fi
>   
> @@ -2362,7 +2395,7 @@ index 83b4b0172db..2154238189e 100755
>     if test "x$ac_ct_AR" = x; then
>       AR="false"
>     else
> -@@ -6708,12 +6970,10 @@ ac_tool_warned=yes ;;
> +@@ -6075,29 +6337,81 @@ ac_tool_warned=yes ;;
>   esac
>       AR=$ac_ct_AR
>     fi
> @@ -2371,16 +2404,40 @@ index 83b4b0172db..2154238189e 100755
>   fi
>   
>  -test -z "$AR" && AR=ar
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
>  -test -z "$AR_FLAGS" && AR_FLAGS=cru
> ++  rm -f conftest.*
>  +: ${AR=ar}
>  +: ${AR_FLAGS=cru}
> - 
> - 
> - 
> -@@ -6725,6 +6985,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
> - 
> - 
> - 
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
> ++
>  +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE support" >&5
>  +$as_echo_n "checking for archiver @FILE support... " >&6; }
>  +if ${lt_cv_ar_at_file+:} false; then :
> @@ -2393,7 +2450,7 @@ index 83b4b0172db..2154238189e 100755
>  +int
>  +main ()
>  +{
> -+
> + 
>  +  ;
>  +  return 0;
>  +}
> @@ -2419,30 +2476,23 @@ index 83b4b0172db..2154238189e 100755
>  +        fi
>  +      fi
>  +      rm -f conftest.* libconftest.a
> -+
> + 
>  +fi
>  +rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
> -+
> + 
>  +fi
>  +{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_ar_at_file" >&5
>  +$as_echo "$lt_cv_ar_at_file" >&6; }
> -+
> + 
>  +if test "x$lt_cv_ar_at_file" = xno; then
>  +  archiver_list_spec=
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
> -@@ -7059,8 +7377,8 @@ esac
> + 
> + 
> + 
> +@@ -6444,8 +6758,8 @@ esac
>   lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
>   
>   # Transform an extracted symbol line into symbol name and symbol address
> @@ -2453,7 +2503,7 @@ index 83b4b0172db..2154238189e 100755
>   
>   # Handle CRLF in mingw tool chain
>   opt_cr=
> -@@ -7096,6 +7414,7 @@ for ac_symprfx in "" "_"; do
> +@@ -6481,6 +6795,7 @@ for ac_symprfx in "" "_"; do
>     else
>       lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
>     fi
> @@ -2461,7 +2511,7 @@ index 83b4b0172db..2154238189e 100755
>   
>     # Check to see that the pipe works correctly.
>     pipe_works=no
> -@@ -7137,6 +7456,18 @@ _LT_EOF
> +@@ -6522,6 +6837,18 @@ _LT_EOF
>         if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
>   	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
>   	  cat <<_LT_EOF > conftest.$ac_ext
> @@ -2480,7 +2530,7 @@ index 83b4b0172db..2154238189e 100755
>   #ifdef __cplusplus
>   extern "C" {
>   #endif
> -@@ -7148,7 +7479,7 @@ _LT_EOF
> +@@ -6533,7 +6860,7 @@ _LT_EOF
>   	  cat <<_LT_EOF >> conftest.$ac_ext
>   
>   /* The mapping between symbol names and symbols.  */
> @@ -2489,7 +2539,7 @@ index 83b4b0172db..2154238189e 100755
>     const char *name;
>     void       *address;
>   }
> -@@ -7174,8 +7505,8 @@ static const void *lt_preloaded_setup() {
> +@@ -6559,8 +6886,8 @@ static const void *lt_preloaded_setup() {
>   _LT_EOF
>   	  # Now try linking the two files.
>   	  mv conftest.$ac_objext conftstm.$ac_objext
> @@ -2500,7 +2550,7 @@ index 83b4b0172db..2154238189e 100755
>   	  LIBS="conftstm.$ac_objext"
>   	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
>   	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
> -@@ -7185,8 +7516,8 @@ _LT_EOF
> +@@ -6570,8 +6897,8 @@ _LT_EOF
>     test $ac_status = 0; } && test -s conftest${ac_exeext}; then
>   	    pipe_works=yes
>   	  fi
> @@ -2511,7 +2561,7 @@ index 83b4b0172db..2154238189e 100755
>   	else
>   	  echo "cannot find nm_test_func in $nlist" >&5
>   	fi
> -@@ -7223,6 +7554,21 @@ else
> +@@ -6608,6 +6935,19 @@ else
>   $as_echo "ok" >&6; }
>   fi
>   
> @@ -2528,15 +2578,15 @@ index 83b4b0172db..2154238189e 100755
>  +
>  +
>  +
> -+
> -+
>   
>   
>   
> -@@ -7239,6 +7585,40 @@ fi
> +@@ -6624,6 +6964,42 @@ fi
>   
>   
>   
> ++
> ++
>  +
>  +
>  +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
> @@ -2574,7 +2624,7 @@ index 83b4b0172db..2154238189e 100755
>   
>   
>   
> -@@ -7450,6 +7830,123 @@ esac
> +@@ -6835,6 +7211,123 @@ esac
>   
>   need_locks="$enable_libtool_lock"
>   
> @@ -2698,7 +2748,7 @@ index 83b4b0172db..2154238189e 100755
>   
>     case $host_os in
>       rhapsody* | darwin*)
> -@@ -8013,6 +8510,8 @@ _LT_EOF
> +@@ -7398,6 +7891,8 @@ _LT_EOF
>         $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
>         echo "$AR cru libconftest.a conftest.o" >&5
>         $AR cru libconftest.a conftest.o 2>&5
> @@ -2707,7 +2757,7 @@ index 83b4b0172db..2154238189e 100755
>         cat > conftest.c << _LT_EOF
>   int main() { return 0;}
>   _LT_EOF
> -@@ -8208,7 +8707,8 @@ fi
> +@@ -7593,7 +8088,8 @@ fi
>   LIBTOOL_DEPS="$ltmain"
>   
>   # Always use our own libtool.
> @@ -2717,7 +2767,7 @@ index 83b4b0172db..2154238189e 100755
>   
>   
>   
> -@@ -8297,7 +8797,7 @@ aix3*)
> +@@ -7682,7 +8178,7 @@ aix3*)
>   esac
>   
>   # Global variables:
> @@ -2726,7 +2776,7 @@ index 83b4b0172db..2154238189e 100755
>   can_build_shared=yes
>   
>   # All known linkers require a `.a' archive for static linking (except MSVC,
> -@@ -8595,8 +9095,6 @@ fi
> +@@ -7980,8 +8476,6 @@ fi
>   lt_prog_compiler_pic=
>   lt_prog_compiler_static=
>   
> @@ -2735,7 +2785,7 @@ index 83b4b0172db..2154238189e 100755
>   
>     if test "$GCC" = yes; then
>       lt_prog_compiler_wl='-Wl,'
> -@@ -8762,6 +9260,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -8147,6 +8641,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>   	lt_prog_compiler_pic='--shared'
>   	lt_prog_compiler_static='--static'
>   	;;
> @@ -2748,7 +2798,7 @@ index 83b4b0172db..2154238189e 100755
>         pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
>           # Portland Group compilers (*not* the Pentium gcc compiler,
>   	# which looks to be a dead project)
> -@@ -8824,7 +9328,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -8209,7 +8709,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>         lt_prog_compiler_pic='-KPIC'
>         lt_prog_compiler_static='-Bstatic'
>         case $cc_basename in
> @@ -2757,7 +2807,7 @@ index 83b4b0172db..2154238189e 100755
>   	lt_prog_compiler_wl='-Qoption ld ';;
>         *)
>   	lt_prog_compiler_wl='-Wl,';;
> -@@ -8881,13 +9385,17 @@ case $host_os in
> +@@ -8266,13 +8766,17 @@ case $host_os in
>       lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
>       ;;
>   esac
> @@ -2781,7 +2831,7 @@ index 83b4b0172db..2154238189e 100755
>   
>   #
>   # Check to make sure the PIC flag actually works.
> -@@ -8948,6 +9456,11 @@ fi
> +@@ -8333,6 +8837,11 @@ fi
>   
>   
>   
> @@ -2793,7 +2843,7 @@ index 83b4b0172db..2154238189e 100755
>   #
>   # Check to make sure the static flag actually works.
>   #
> -@@ -9298,7 +9811,8 @@ _LT_EOF
> +@@ -8683,7 +9192,8 @@ _LT_EOF
>         allow_undefined_flag=unsupported
>         always_export_symbols=no
>         enable_shared_with_static_runtimes=yes
> @@ -2803,7 +2853,7 @@ index 83b4b0172db..2154238189e 100755
>   
>         if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
>           archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
> -@@ -9397,12 +9911,12 @@ _LT_EOF
> +@@ -8782,12 +9292,12 @@ _LT_EOF
>   	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
>   	  hardcode_libdir_flag_spec=
>   	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
> @@ -2818,7 +2868,7 @@ index 83b4b0172db..2154238189e 100755
>   	  fi
>   	  ;;
>   	esac
> -@@ -9416,8 +9930,8 @@ _LT_EOF
> +@@ -8801,8 +9311,8 @@ _LT_EOF
>   	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
>   	wlarc=
>         else
> @@ -2829,7 +2879,7 @@ index 83b4b0172db..2154238189e 100755
>         fi
>         ;;
>   
> -@@ -9435,8 +9949,8 @@ _LT_EOF
> +@@ -8820,8 +9330,8 @@ _LT_EOF
>   
>   _LT_EOF
>         elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -2840,7 +2890,7 @@ index 83b4b0172db..2154238189e 100755
>         else
>   	ld_shlibs=no
>         fi
> -@@ -9482,8 +9996,8 @@ _LT_EOF
> +@@ -8867,8 +9377,8 @@ _LT_EOF
>   
>       *)
>         if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -2851,7 +2901,7 @@ index 83b4b0172db..2154238189e 100755
>         else
>   	ld_shlibs=no
>         fi
> -@@ -9613,7 +10127,13 @@ _LT_EOF
> +@@ -8998,7 +9508,13 @@ _LT_EOF
>   	allow_undefined_flag='-berok'
>           # Determine the default libpath from the value encoded in an
>           # empty executable.
> @@ -2866,7 +2916,7 @@ index 83b4b0172db..2154238189e 100755
>   /* end confdefs.h.  */
>   
>   int
> -@@ -9626,22 +10146,29 @@ main ()
> +@@ -9011,22 +9527,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>   
> @@ -2909,7 +2959,7 @@ index 83b4b0172db..2154238189e 100755
>   
>           hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>           archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> -@@ -9653,7 +10180,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9038,7 +9561,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	else
>   	 # Determine the default libpath from the value encoded in an
>   	 # empty executable.
> @@ -2924,7 +2974,7 @@ index 83b4b0172db..2154238189e 100755
>   /* end confdefs.h.  */
>   
>   int
> -@@ -9666,22 +10199,29 @@ main ()
> +@@ -9051,22 +9580,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>   
> @@ -2967,7 +3017,7 @@ index 83b4b0172db..2154238189e 100755
>   
>   	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>   	  # Warning - without using the other run time loading flags,
> -@@ -9726,20 +10266,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9111,20 +9647,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>         # Microsoft Visual C++.
>         # hardcode_libdir_flag_spec is actually meaningless, as there is
>         # no search path for DLLs.
> @@ -3045,7 +3095,7 @@ index 83b4b0172db..2154238189e 100755
>         ;;
>   
>       darwin* | rhapsody*)
> -@@ -9800,7 +10383,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9185,7 +9764,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
>       freebsd* | dragonfly*)
> @@ -3054,7 +3104,7 @@ index 83b4b0172db..2154238189e 100755
>         hardcode_libdir_flag_spec='-R$libdir'
>         hardcode_direct=yes
>         hardcode_shlibpath_var=no
> -@@ -9808,7 +10391,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9193,7 +9772,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       hpux9*)
>         if test "$GCC" = yes; then
> @@ -3063,7 +3113,7 @@ index 83b4b0172db..2154238189e 100755
>         else
>   	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
>         fi
> -@@ -9824,7 +10407,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9209,7 +9788,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       hpux10*)
>         if test "$GCC" = yes && test "$with_gnu_ld" = no; then
> @@ -3072,7 +3122,7 @@ index 83b4b0172db..2154238189e 100755
>         else
>   	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
>         fi
> -@@ -9848,10 +10431,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9233,10 +9812,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
>   	  ;;
>   	ia64*)
> @@ -3085,7 +3135,7 @@ index 83b4b0172db..2154238189e 100755
>   	  ;;
>   	esac
>         else
> -@@ -9930,23 +10513,36 @@ fi
> +@@ -9315,23 +9894,36 @@ fi
>   
>       irix5* | irix6* | nonstopux*)
>         if test "$GCC" = yes; then
> @@ -3130,7 +3180,7 @@ index 83b4b0172db..2154238189e 100755
>         else
>   	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
>   	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
> -@@ -10031,7 +10627,7 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9416,7 +10008,7 @@ rm -f core conftest.err conftest.$ac_objext \
>       osf4* | osf5*)	# as osf3* with the addition of -msym flag
>         if test "$GCC" = yes; then
>   	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
> @@ -3139,7 +3189,7 @@ index 83b4b0172db..2154238189e 100755
>   	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
>         else
>   	allow_undefined_flag=' -expect_unresolved \*'
> -@@ -10050,9 +10646,9 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9435,9 +10027,9 @@ rm -f core conftest.err conftest.$ac_objext \
>         no_undefined_flag=' -z defs'
>         if test "$GCC" = yes; then
>   	wlarc='${wl}'
> @@ -3151,7 +3201,7 @@ index 83b4b0172db..2154238189e 100755
>         else
>   	case `$CC -V 2>&1` in
>   	*"Compilers 5.0"*)
> -@@ -10628,8 +11224,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -10013,8 +10605,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>     need_version=no
>     need_lib_prefix=no
>   
> @@ -3163,7 +3213,7 @@ index 83b4b0172db..2154238189e 100755
>       library_names_spec='$libname.dll.a'
>       # DLL is installed to $(libdir)/../bin by postinstall_cmds
>       postinstall_cmds='base_file=`basename \${file}`~
> -@@ -10662,13 +11259,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -10047,13 +10640,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>         library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>         ;;
>       esac
> @@ -3236,7 +3286,7 @@ index 83b4b0172db..2154238189e 100755
>     # FIXME: first we should search . and the directory the executable is in
>     shlibpath_var=PATH
>     ;;
> -@@ -10750,7 +11405,7 @@ haiku*)
> +@@ -10135,7 +10786,7 @@ haiku*)
>     soname_spec='${libname}${release}${shared_ext}$major'
>     shlibpath_var=LIBRARY_PATH
>     shlibpath_overrides_runpath=yes
> @@ -3245,16 +3295,16 @@ index 83b4b0172db..2154238189e 100755
>     hardcode_into_libs=yes
>     ;;
>   
> -@@ -11546,7 +12201,7 @@ else
> +@@ -10931,7 +11582,7 @@ else
>     lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>     lt_status=$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 11549 "configure"
> +-#line 10934 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>   
>   #if HAVE_DLFCN_H
> -@@ -11590,10 +12245,10 @@ else
> +@@ -10975,10 +11626,10 @@ else
>   /* When -fvisbility=hidden is used, assume the code has been annotated
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -3267,16 +3317,16 @@ index 83b4b0172db..2154238189e 100755
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -11652,7 +12307,7 @@ else
> +@@ -11037,7 +11688,7 @@ else
>     lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>     lt_status=$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 11655 "configure"
> +-#line 11040 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>   
>   #if HAVE_DLFCN_H
> -@@ -11696,10 +12351,10 @@ else
> +@@ -11081,10 +11732,10 @@ else
>   /* When -fvisbility=hidden is used, assume the code has been annotated
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -3289,7 +3339,7 @@ index 83b4b0172db..2154238189e 100755
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -16308,13 +16963,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
> +@@ -15455,13 +16106,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
>   lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>   lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>   lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -3310,7 +3360,7 @@ index 83b4b0172db..2154238189e 100755
>   STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>   RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>   old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
> -@@ -16329,14 +16991,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
> +@@ -15476,14 +16134,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
>   lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
> @@ -3329,7 +3379,7 @@ index 83b4b0172db..2154238189e 100755
>   DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>   NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>   LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -16369,12 +17034,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
> +@@ -15516,12 +16177,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
>   hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
>   inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
>   link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
> @@ -3343,7 +3393,7 @@ index 83b4b0172db..2154238189e 100755
>   file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
>   variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
>   need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
> -@@ -16429,8 +17094,13 @@ reload_flag \
> +@@ -15576,8 +16237,13 @@ reload_flag \
>   OBJDUMP \
>   deplibs_check_method \
>   file_magic_cmd \
> @@ -3357,7 +3407,7 @@ index 83b4b0172db..2154238189e 100755
>   STRIP \
>   RANLIB \
>   CC \
> -@@ -16440,12 +17110,14 @@ lt_cv_sys_global_symbol_pipe \
> +@@ -15587,12 +16253,14 @@ lt_cv_sys_global_symbol_pipe \
>   lt_cv_sys_global_symbol_to_cdecl \
>   lt_cv_sys_global_symbol_to_c_name_address \
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -3373,7 +3423,7 @@ index 83b4b0172db..2154238189e 100755
>   DSYMUTIL \
>   NMEDIT \
>   LIPO \
> -@@ -16461,7 +17133,6 @@ no_undefined_flag \
> +@@ -15608,7 +16276,6 @@ no_undefined_flag \
>   hardcode_libdir_flag_spec \
>   hardcode_libdir_flag_spec_ld \
>   hardcode_libdir_separator \
> @@ -3381,7 +3431,7 @@ index 83b4b0172db..2154238189e 100755
>   exclude_expsyms \
>   include_expsyms \
>   file_list_spec \
> -@@ -16497,6 +17168,7 @@ module_cmds \
> +@@ -15644,6 +16311,7 @@ module_cmds \
>   module_expsym_cmds \
>   export_symbols_cmds \
>   prelink_cmds \
> @@ -3389,7 +3439,7 @@ index 83b4b0172db..2154238189e 100755
>   postinstall_cmds \
>   postuninstall_cmds \
>   finish_cmds \
> -@@ -17263,7 +17935,8 @@ $as_echo X"$file" |
> +@@ -16410,7 +17078,8 @@ $as_echo X"$file" |
>   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>   #
>   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -3399,7 +3449,7 @@ index 83b4b0172db..2154238189e 100755
>   #   Written by Gordon Matzigkeit, 1996
>   #
>   #   This file is part of GNU Libtool.
> -@@ -17366,19 +18039,42 @@ SP2NL=$lt_lt_SP2NL
> +@@ -16513,19 +17182,42 @@ SP2NL=$lt_lt_SP2NL
>   # turn newlines into spaces.
>   NL2SP=$lt_lt_NL2SP
>   
> @@ -3443,7 +3493,7 @@ index 83b4b0172db..2154238189e 100755
>   # A symbol stripping program.
>   STRIP=$lt_STRIP
>   
> -@@ -17408,6 +18104,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
> +@@ -16555,6 +17247,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
>   # Transform the output of nm in a C name address pair when lib prefix is needed.
>   global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
>   
> @@ -3456,7 +3506,7 @@ index 83b4b0172db..2154238189e 100755
>   # The name of the directory that contains temporary libtool files.
>   objdir=$objdir
>   
> -@@ -17417,6 +18119,9 @@ MAGIC_CMD=$MAGIC_CMD
> +@@ -16564,6 +17262,9 @@ MAGIC_CMD=$MAGIC_CMD
>   # Must we lock files when doing compilation?
>   need_locks=$lt_need_locks
>   
> @@ -3466,7 +3516,7 @@ index 83b4b0172db..2154238189e 100755
>   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>   DSYMUTIL=$lt_DSYMUTIL
>   
> -@@ -17531,12 +18236,12 @@ with_gcc=$GCC
> +@@ -16678,12 +17379,12 @@ with_gcc=$GCC
>   # Compiler flag to turn off builtin functions.
>   no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
>   
> @@ -3482,7 +3532,7 @@ index 83b4b0172db..2154238189e 100755
>   # Compiler flag to prevent dynamic linking.
>   link_static_flag=$lt_lt_prog_compiler_static
>   
> -@@ -17623,9 +18328,6 @@ inherit_rpath=$inherit_rpath
> +@@ -16770,9 +17471,6 @@ inherit_rpath=$inherit_rpath
>   # Whether libtool must link a program against all its dependency libraries.
>   link_all_deplibs=$link_all_deplibs
>   
> @@ -3492,7 +3542,7 @@ index 83b4b0172db..2154238189e 100755
>   # Set to "yes" if exported symbols are required.
>   always_export_symbols=$always_export_symbols
>   
> -@@ -17641,6 +18343,9 @@ include_expsyms=$lt_include_expsyms
> +@@ -16788,6 +17486,9 @@ include_expsyms=$lt_include_expsyms
>   # Commands necessary for linking programs (against libraries) with templates.
>   prelink_cmds=$lt_prelink_cmds
>   
> @@ -3502,7 +3552,7 @@ index 83b4b0172db..2154238189e 100755
>   # Specify filename containing input files.
>   file_list_spec=$lt_file_list_spec
>   
> -@@ -17673,210 +18378,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
> +@@ -16820,210 +17521,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
>     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>     # text mode, it properly converts lines to CR/LF.  This bash problem
>     # is reportedly fixed, but why not run on old versions too?
> @@ -3877,10 +3927,10 @@ index 83b4b0172db..2154238189e 100755
>     chmod +x "$ofile"
>   
>  diff --git a/gas/configure b/gas/configure
> -index d5ae54925e9..3ff1148d9dd 100755
> +index 789d1b38b33..7ac563a13ad 100755
>  --- a/gas/configure
>  +++ b/gas/configure
> -@@ -682,8 +682,11 @@ OTOOL
> +@@ -681,8 +681,11 @@ OTOOL
>   LIPO
>   NMEDIT
>   DSYMUTIL
> @@ -3892,7 +3942,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>   OBJDUMP
>   LN_S
>   NM
> -@@ -800,6 +803,7 @@ enable_static
> +@@ -799,6 +802,7 @@ enable_static
>   with_pic
>   enable_fast_install
>   with_gnu_ld
> @@ -3900,7 +3950,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>   enable_libtool_lock
>   enable_plugins
>   enable_largefile
> -@@ -1491,6 +1495,8 @@ Optional Packages:
> +@@ -1490,6 +1494,8 @@ Optional Packages:
>     --with-pic              try to use only PIC/non-PIC objects [default=use
>                             both]
>     --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
> @@ -3909,7 +3959,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>     --with-cpu=CPU          default cpu variant is CPU (currently only supported
>                             on ARC)
>     --with-system-zlib      use installed libz
> -@@ -5278,8 +5284,8 @@ esac
> +@@ -4569,8 +4575,8 @@ esac
>   
>   
>   
> @@ -3920,7 +3970,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>   
>   
>   
> -@@ -5319,7 +5325,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> +@@ -4610,7 +4616,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
>   $as_echo_n "checking how to print strings... " >&6; }
>   # Test print first, because it will be a builtin if present.
> @@ -3929,7 +3979,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>      test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
>     ECHO='print -r --'
>   elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
> -@@ -6005,8 +6011,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
> +@@ -5296,8 +5302,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
>   # Try some XSI features
>   xsi_shell=no
>   ( _lt_dummy="a/b/c"
> @@ -3940,7 +3990,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>       && eval 'test $(( 1 + 1 )) -eq 2 \
>       && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
>     && xsi_shell=yes
> -@@ -6055,6 +6061,80 @@ esac
> +@@ -5346,6 +5352,80 @@ esac
>   
>   
>   
> @@ -4021,7 +4071,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
>   $as_echo_n "checking for $LD option to reload object files... " >&6; }
>   if ${lt_cv_ld_reload_flag+:} false; then :
> -@@ -6071,6 +6151,11 @@ case $reload_flag in
> +@@ -5362,6 +5442,11 @@ case $reload_flag in
>   esac
>   reload_cmds='$LD$reload_flag -o $output$reload_objs'
>   case $host_os in
> @@ -4033,7 +4083,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>     darwin*)
>       if test "$GCC" = yes; then
>         reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
> -@@ -6239,7 +6324,8 @@ mingw* | pw32*)
> +@@ -5530,7 +5615,8 @@ mingw* | pw32*)
>       lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
>       lt_cv_file_magic_cmd='func_win32_libid'
>     else
> @@ -4043,7 +4093,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>       lt_cv_file_magic_cmd='$OBJDUMP -f'
>     fi
>     ;;
> -@@ -6393,6 +6479,21 @@ esac
> +@@ -5684,6 +5770,21 @@ esac
>   fi
>   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
>   $as_echo "$lt_cv_deplibs_check_method" >&6; }
> @@ -4065,7 +4115,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>   file_magic_cmd=$lt_cv_file_magic_cmd
>   deplibs_check_method=$lt_cv_deplibs_check_method
>   test -z "$deplibs_check_method" && deplibs_check_method=unknown
> -@@ -6408,9 +6509,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
> +@@ -5699,6 +5800,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
>   
>   
>   
> @@ -4220,6 +4270,12 @@ index d5ae54925e9..3ff1148d9dd 100755
>  +
>  +
>  +
> + plugin_option=
> + plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
> + for plugin in $plugin_names; do
> +@@ -5713,8 +5965,10 @@ for plugin in $plugin_names; do
> + done
> + 
>   if test -n "$ac_tool_prefix"; then
>  -  # Extract the first word of "${ac_tool_prefix}ar", so it can be a program name with args.
>  -set dummy ${ac_tool_prefix}ar; ac_word=$2
> @@ -4230,7 +4286,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_AR+:} false; then :
> -@@ -6426,7 +6680,7 @@ do
> +@@ -5730,7 +5984,7 @@ do
>     test -z "$as_dir" && as_dir=.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -4239,7 +4295,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -6446,11 +6700,15 @@ $as_echo "no" >&6; }
> +@@ -5750,11 +6004,15 @@ $as_echo "no" >&6; }
>   fi
>   
>   
> @@ -4258,7 +4314,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_ac_ct_AR+:} false; then :
> -@@ -6466,7 +6724,7 @@ do
> +@@ -5770,7 +6028,7 @@ do
>     test -z "$as_dir" && as_dir=.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -4267,7 +4323,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -6485,6 +6743,10 @@ else
> +@@ -5789,6 +6047,10 @@ else
>   $as_echo "no" >&6; }
>   fi
>   
> @@ -4278,7 +4334,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>     if test "x$ac_ct_AR" = x; then
>       AR="false"
>     else
> -@@ -6496,12 +6758,10 @@ ac_tool_warned=yes ;;
> +@@ -5800,29 +6062,81 @@ ac_tool_warned=yes ;;
>   esac
>       AR=$ac_ct_AR
>     fi
> @@ -4287,16 +4343,40 @@ index d5ae54925e9..3ff1148d9dd 100755
>   fi
>   
>  -test -z "$AR" && AR=ar
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
>  -test -z "$AR_FLAGS" && AR_FLAGS=cru
> ++  rm -f conftest.*
>  +: ${AR=ar}
>  +: ${AR_FLAGS=cru}
> - 
> - 
> - 
> -@@ -6513,6 +6773,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
> - 
> - 
> - 
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
> ++
>  +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE support" >&5
>  +$as_echo_n "checking for archiver @FILE support... " >&6; }
>  +if ${lt_cv_ar_at_file+:} false; then :
> @@ -4309,7 +4389,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>  +int
>  +main ()
>  +{
> -+
> + 
>  +  ;
>  +  return 0;
>  +}
> @@ -4335,30 +4415,23 @@ index d5ae54925e9..3ff1148d9dd 100755
>  +        fi
>  +      fi
>  +      rm -f conftest.* libconftest.a
> -+
> + 
>  +fi
>  +rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
> -+
> + 
>  +fi
>  +{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_ar_at_file" >&5
>  +$as_echo "$lt_cv_ar_at_file" >&6; }
> -+
> + 
>  +if test "x$lt_cv_ar_at_file" = xno; then
>  +  archiver_list_spec=
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
> -@@ -6847,8 +7165,8 @@ esac
> + 
> + 
> + 
> +@@ -6169,8 +6483,8 @@ esac
>   lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
>   
>   # Transform an extracted symbol line into symbol name and symbol address
> @@ -4369,7 +4442,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>   
>   # Handle CRLF in mingw tool chain
>   opt_cr=
> -@@ -6884,6 +7202,7 @@ for ac_symprfx in "" "_"; do
> +@@ -6206,6 +6520,7 @@ for ac_symprfx in "" "_"; do
>     else
>       lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
>     fi
> @@ -4377,7 +4450,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>   
>     # Check to see that the pipe works correctly.
>     pipe_works=no
> -@@ -6925,6 +7244,18 @@ _LT_EOF
> +@@ -6247,6 +6562,18 @@ _LT_EOF
>         if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
>   	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
>   	  cat <<_LT_EOF > conftest.$ac_ext
> @@ -4396,7 +4469,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>   #ifdef __cplusplus
>   extern "C" {
>   #endif
> -@@ -6936,7 +7267,7 @@ _LT_EOF
> +@@ -6258,7 +6585,7 @@ _LT_EOF
>   	  cat <<_LT_EOF >> conftest.$ac_ext
>   
>   /* The mapping between symbol names and symbols.  */
> @@ -4405,7 +4478,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>     const char *name;
>     void       *address;
>   }
> -@@ -6962,8 +7293,8 @@ static const void *lt_preloaded_setup() {
> +@@ -6284,8 +6611,8 @@ static const void *lt_preloaded_setup() {
>   _LT_EOF
>   	  # Now try linking the two files.
>   	  mv conftest.$ac_objext conftstm.$ac_objext
> @@ -4416,7 +4489,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>   	  LIBS="conftstm.$ac_objext"
>   	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
>   	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
> -@@ -6973,8 +7304,8 @@ _LT_EOF
> +@@ -6295,8 +6622,8 @@ _LT_EOF
>     test $ac_status = 0; } && test -s conftest${ac_exeext}; then
>   	    pipe_works=yes
>   	  fi
> @@ -4427,7 +4500,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>   	else
>   	  echo "cannot find nm_test_func in $nlist" >&5
>   	fi
> -@@ -7011,6 +7342,21 @@ else
> +@@ -6333,6 +6660,19 @@ else
>   $as_echo "ok" >&6; }
>   fi
>   
> @@ -4444,15 +4517,15 @@ index d5ae54925e9..3ff1148d9dd 100755
>  +
>  +
>  +
> -+
> -+
>   
>   
>   
> -@@ -7027,6 +7373,40 @@ fi
> +@@ -6349,6 +6689,42 @@ fi
>   
>   
>   
> ++
> ++
>  +
>  +
>  +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
> @@ -4490,7 +4563,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>   
>   
>   
> -@@ -7238,6 +7618,123 @@ esac
> +@@ -6560,6 +6936,123 @@ esac
>   
>   need_locks="$enable_libtool_lock"
>   
> @@ -4614,7 +4687,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>   
>     case $host_os in
>       rhapsody* | darwin*)
> -@@ -7801,6 +8298,8 @@ _LT_EOF
> +@@ -7123,6 +7616,8 @@ _LT_EOF
>         $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
>         echo "$AR cru libconftest.a conftest.o" >&5
>         $AR cru libconftest.a conftest.o 2>&5
> @@ -4623,7 +4696,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>         cat > conftest.c << _LT_EOF
>   int main() { return 0;}
>   _LT_EOF
> -@@ -7996,7 +8495,8 @@ fi
> +@@ -7318,7 +7813,8 @@ fi
>   LIBTOOL_DEPS="$ltmain"
>   
>   # Always use our own libtool.
> @@ -4633,7 +4706,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>   
>   
>   
> -@@ -8085,7 +8585,7 @@ aix3*)
> +@@ -7407,7 +7903,7 @@ aix3*)
>   esac
>   
>   # Global variables:
> @@ -4642,7 +4715,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>   can_build_shared=yes
>   
>   # All known linkers require a `.a' archive for static linking (except MSVC,
> -@@ -8383,8 +8883,6 @@ fi
> +@@ -7705,8 +8201,6 @@ fi
>   lt_prog_compiler_pic=
>   lt_prog_compiler_static=
>   
> @@ -4651,7 +4724,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>   
>     if test "$GCC" = yes; then
>       lt_prog_compiler_wl='-Wl,'
> -@@ -8550,6 +9048,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -7872,6 +8366,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>   	lt_prog_compiler_pic='--shared'
>   	lt_prog_compiler_static='--static'
>   	;;
> @@ -4664,7 +4737,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>         pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
>           # Portland Group compilers (*not* the Pentium gcc compiler,
>   	# which looks to be a dead project)
> -@@ -8612,7 +9116,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -7934,7 +8434,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>         lt_prog_compiler_pic='-KPIC'
>         lt_prog_compiler_static='-Bstatic'
>         case $cc_basename in
> @@ -4673,7 +4746,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>   	lt_prog_compiler_wl='-Qoption ld ';;
>         *)
>   	lt_prog_compiler_wl='-Wl,';;
> -@@ -8669,13 +9173,17 @@ case $host_os in
> +@@ -7991,13 +8491,17 @@ case $host_os in
>       lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
>       ;;
>   esac
> @@ -4697,7 +4770,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>   
>   #
>   # Check to make sure the PIC flag actually works.
> -@@ -8736,6 +9244,11 @@ fi
> +@@ -8058,6 +8562,11 @@ fi
>   
>   
>   
> @@ -4709,7 +4782,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>   #
>   # Check to make sure the static flag actually works.
>   #
> -@@ -9086,7 +9599,8 @@ _LT_EOF
> +@@ -8408,7 +8917,8 @@ _LT_EOF
>         allow_undefined_flag=unsupported
>         always_export_symbols=no
>         enable_shared_with_static_runtimes=yes
> @@ -4719,7 +4792,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>   
>         if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
>           archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
> -@@ -9185,12 +9699,12 @@ _LT_EOF
> +@@ -8507,12 +9017,12 @@ _LT_EOF
>   	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
>   	  hardcode_libdir_flag_spec=
>   	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
> @@ -4734,7 +4807,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>   	  fi
>   	  ;;
>   	esac
> -@@ -9204,8 +9718,8 @@ _LT_EOF
> +@@ -8526,8 +9036,8 @@ _LT_EOF
>   	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
>   	wlarc=
>         else
> @@ -4745,7 +4818,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>         fi
>         ;;
>   
> -@@ -9223,8 +9737,8 @@ _LT_EOF
> +@@ -8545,8 +9055,8 @@ _LT_EOF
>   
>   _LT_EOF
>         elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -4756,7 +4829,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>         else
>   	ld_shlibs=no
>         fi
> -@@ -9270,8 +9784,8 @@ _LT_EOF
> +@@ -8592,8 +9102,8 @@ _LT_EOF
>   
>       *)
>         if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -4767,7 +4840,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>         else
>   	ld_shlibs=no
>         fi
> -@@ -9401,7 +9915,13 @@ _LT_EOF
> +@@ -8723,7 +9233,13 @@ _LT_EOF
>   	allow_undefined_flag='-berok'
>           # Determine the default libpath from the value encoded in an
>           # empty executable.
> @@ -4782,7 +4855,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>   /* end confdefs.h.  */
>   
>   int
> -@@ -9414,22 +9934,29 @@ main ()
> +@@ -8736,22 +9252,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>   
> @@ -4825,7 +4898,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>   
>           hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>           archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> -@@ -9441,7 +9968,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8763,7 +9286,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	else
>   	 # Determine the default libpath from the value encoded in an
>   	 # empty executable.
> @@ -4840,7 +4913,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>   /* end confdefs.h.  */
>   
>   int
> -@@ -9454,22 +9987,29 @@ main ()
> +@@ -8776,22 +9305,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>   
> @@ -4883,7 +4956,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>   
>   	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>   	  # Warning - without using the other run time loading flags,
> -@@ -9514,20 +10054,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8836,20 +9372,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>         # Microsoft Visual C++.
>         # hardcode_libdir_flag_spec is actually meaningless, as there is
>         # no search path for DLLs.
> @@ -4961,7 +5034,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>         ;;
>   
>       darwin* | rhapsody*)
> -@@ -9588,7 +10171,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8910,7 +9489,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
>       freebsd* | dragonfly*)
> @@ -4970,7 +5043,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>         hardcode_libdir_flag_spec='-R$libdir'
>         hardcode_direct=yes
>         hardcode_shlibpath_var=no
> -@@ -9596,7 +10179,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8918,7 +9497,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       hpux9*)
>         if test "$GCC" = yes; then
> @@ -4979,7 +5052,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>         else
>   	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
>         fi
> -@@ -9612,7 +10195,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8934,7 +9513,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       hpux10*)
>         if test "$GCC" = yes && test "$with_gnu_ld" = no; then
> @@ -4988,7 +5061,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>         else
>   	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
>         fi
> -@@ -9636,10 +10219,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8958,10 +9537,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
>   	  ;;
>   	ia64*)
> @@ -5001,7 +5074,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>   	  ;;
>   	esac
>         else
> -@@ -9718,23 +10301,36 @@ fi
> +@@ -9040,23 +9619,36 @@ fi
>   
>       irix5* | irix6* | nonstopux*)
>         if test "$GCC" = yes; then
> @@ -5046,7 +5119,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>         else
>   	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
>   	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
> -@@ -9819,7 +10415,7 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9141,7 +9733,7 @@ rm -f core conftest.err conftest.$ac_objext \
>       osf4* | osf5*)	# as osf3* with the addition of -msym flag
>         if test "$GCC" = yes; then
>   	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
> @@ -5055,7 +5128,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>   	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
>         else
>   	allow_undefined_flag=' -expect_unresolved \*'
> -@@ -9838,9 +10434,9 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9160,9 +9752,9 @@ rm -f core conftest.err conftest.$ac_objext \
>         no_undefined_flag=' -z defs'
>         if test "$GCC" = yes; then
>   	wlarc='${wl}'
> @@ -5067,7 +5140,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>         else
>   	case `$CC -V 2>&1` in
>   	*"Compilers 5.0"*)
> -@@ -10416,8 +11012,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -9738,8 +10330,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>     need_version=no
>     need_lib_prefix=no
>   
> @@ -5079,7 +5152,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>       library_names_spec='$libname.dll.a'
>       # DLL is installed to $(libdir)/../bin by postinstall_cmds
>       postinstall_cmds='base_file=`basename \${file}`~
> -@@ -10450,13 +11047,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -9772,13 +10365,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>         library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>         ;;
>       esac
> @@ -5152,7 +5225,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>     # FIXME: first we should search . and the directory the executable is in
>     shlibpath_var=PATH
>     ;;
> -@@ -10538,7 +11193,7 @@ haiku*)
> +@@ -9860,7 +10511,7 @@ haiku*)
>     soname_spec='${libname}${release}${shared_ext}$major'
>     shlibpath_var=LIBRARY_PATH
>     shlibpath_overrides_runpath=yes
> @@ -5161,16 +5234,16 @@ index d5ae54925e9..3ff1148d9dd 100755
>     hardcode_into_libs=yes
>     ;;
>   
> -@@ -11334,7 +11989,7 @@ else
> +@@ -10656,7 +11307,7 @@ else
>     lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>     lt_status=$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 11337 "configure"
> +-#line 10659 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>   
>   #if HAVE_DLFCN_H
> -@@ -11378,10 +12033,10 @@ else
> +@@ -10700,10 +11351,10 @@ else
>   /* When -fvisbility=hidden is used, assume the code has been annotated
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -5183,16 +5256,16 @@ index d5ae54925e9..3ff1148d9dd 100755
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -11440,7 +12095,7 @@ else
> +@@ -10762,7 +11413,7 @@ else
>     lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>     lt_status=$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 11443 "configure"
> +-#line 10765 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>   
>   #if HAVE_DLFCN_H
> -@@ -11484,10 +12139,10 @@ else
> +@@ -10806,10 +11457,10 @@ else
>   /* When -fvisbility=hidden is used, assume the code has been annotated
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -5205,7 +5278,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -16020,13 +16675,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
> +@@ -14785,13 +15436,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
>   lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>   lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>   lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -5226,7 +5299,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>   STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>   RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>   old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
> -@@ -16041,14 +16703,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
> +@@ -14806,14 +15464,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
>   lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
> @@ -5245,7 +5318,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>   DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>   NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>   LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -16081,12 +16746,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
> +@@ -14846,12 +15507,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
>   hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
>   inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
>   link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
> @@ -5259,7 +5332,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>   file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
>   variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
>   need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
> -@@ -16141,8 +16806,13 @@ reload_flag \
> +@@ -14906,8 +15567,13 @@ reload_flag \
>   OBJDUMP \
>   deplibs_check_method \
>   file_magic_cmd \
> @@ -5273,7 +5346,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>   STRIP \
>   RANLIB \
>   CC \
> -@@ -16152,12 +16822,14 @@ lt_cv_sys_global_symbol_pipe \
> +@@ -14917,12 +15583,14 @@ lt_cv_sys_global_symbol_pipe \
>   lt_cv_sys_global_symbol_to_cdecl \
>   lt_cv_sys_global_symbol_to_c_name_address \
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -5289,7 +5362,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>   DSYMUTIL \
>   NMEDIT \
>   LIPO \
> -@@ -16173,7 +16845,6 @@ no_undefined_flag \
> +@@ -14938,7 +15606,6 @@ no_undefined_flag \
>   hardcode_libdir_flag_spec \
>   hardcode_libdir_flag_spec_ld \
>   hardcode_libdir_separator \
> @@ -5297,7 +5370,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>   exclude_expsyms \
>   include_expsyms \
>   file_list_spec \
> -@@ -16209,6 +16880,7 @@ module_cmds \
> +@@ -14974,6 +15641,7 @@ module_cmds \
>   module_expsym_cmds \
>   export_symbols_cmds \
>   prelink_cmds \
> @@ -5305,7 +5378,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>   postinstall_cmds \
>   postuninstall_cmds \
>   finish_cmds \
> -@@ -16982,7 +17654,8 @@ $as_echo X"$file" |
> +@@ -15747,7 +16415,8 @@ $as_echo X"$file" |
>   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>   #
>   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -5315,7 +5388,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>   #   Written by Gordon Matzigkeit, 1996
>   #
>   #   This file is part of GNU Libtool.
> -@@ -17085,19 +17758,42 @@ SP2NL=$lt_lt_SP2NL
> +@@ -15850,19 +16519,42 @@ SP2NL=$lt_lt_SP2NL
>   # turn newlines into spaces.
>   NL2SP=$lt_lt_NL2SP
>   
> @@ -5359,7 +5432,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>   # A symbol stripping program.
>   STRIP=$lt_STRIP
>   
> -@@ -17127,6 +17823,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
> +@@ -15892,6 +16584,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
>   # Transform the output of nm in a C name address pair when lib prefix is needed.
>   global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
>   
> @@ -5372,7 +5445,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>   # The name of the directory that contains temporary libtool files.
>   objdir=$objdir
>   
> -@@ -17136,6 +17838,9 @@ MAGIC_CMD=$MAGIC_CMD
> +@@ -15901,6 +16599,9 @@ MAGIC_CMD=$MAGIC_CMD
>   # Must we lock files when doing compilation?
>   need_locks=$lt_need_locks
>   
> @@ -5382,7 +5455,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>   DSYMUTIL=$lt_DSYMUTIL
>   
> -@@ -17250,12 +17955,12 @@ with_gcc=$GCC
> +@@ -16015,12 +16716,12 @@ with_gcc=$GCC
>   # Compiler flag to turn off builtin functions.
>   no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
>   
> @@ -5398,7 +5471,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>   # Compiler flag to prevent dynamic linking.
>   link_static_flag=$lt_lt_prog_compiler_static
>   
> -@@ -17342,9 +18047,6 @@ inherit_rpath=$inherit_rpath
> +@@ -16107,9 +16808,6 @@ inherit_rpath=$inherit_rpath
>   # Whether libtool must link a program against all its dependency libraries.
>   link_all_deplibs=$link_all_deplibs
>   
> @@ -5408,7 +5481,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>   # Set to "yes" if exported symbols are required.
>   always_export_symbols=$always_export_symbols
>   
> -@@ -17360,6 +18062,9 @@ include_expsyms=$lt_include_expsyms
> +@@ -16125,6 +16823,9 @@ include_expsyms=$lt_include_expsyms
>   # Commands necessary for linking programs (against libraries) with templates.
>   prelink_cmds=$lt_prelink_cmds
>   
> @@ -5418,7 +5491,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>   # Specify filename containing input files.
>   file_list_spec=$lt_file_list_spec
>   
> -@@ -17392,210 +18097,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
> +@@ -16157,210 +16858,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
>     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>     # text mode, it properly converts lines to CR/LF.  This bash problem
>     # is reportedly fixed, but why not run on old versions too?
> @@ -5793,7 +5866,7 @@ index d5ae54925e9..3ff1148d9dd 100755
>     chmod +x "$ofile"
>   
>  diff --git a/gprof/configure b/gprof/configure
> -index b12ec2e472f..57986ca995a 100755
> +index 5703bba4462..e1ac86ec797 100755
>  --- a/gprof/configure
>  +++ b/gprof/configure
>  @@ -663,8 +663,11 @@ OTOOL
> @@ -5825,7 +5898,7 @@ index b12ec2e472f..57986ca995a 100755
>   
>   Some influential environment variables:
>     CC          C compiler command
> -@@ -5125,8 +5131,8 @@ esac
> +@@ -4471,8 +4477,8 @@ esac
>   
>   
>   
> @@ -5836,7 +5909,7 @@ index b12ec2e472f..57986ca995a 100755
>   
>   
>   
> -@@ -5166,7 +5172,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> +@@ -4512,7 +4518,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
>   $as_echo_n "checking how to print strings... " >&6; }
>   # Test print first, because it will be a builtin if present.
> @@ -5845,7 +5918,7 @@ index b12ec2e472f..57986ca995a 100755
>      test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
>     ECHO='print -r --'
>   elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
> -@@ -5852,8 +5858,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
> +@@ -5198,8 +5204,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
>   # Try some XSI features
>   xsi_shell=no
>   ( _lt_dummy="a/b/c"
> @@ -5856,7 +5929,7 @@ index b12ec2e472f..57986ca995a 100755
>       && eval 'test $(( 1 + 1 )) -eq 2 \
>       && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
>     && xsi_shell=yes
> -@@ -5902,6 +5908,80 @@ esac
> +@@ -5248,6 +5254,80 @@ esac
>   
>   
>   
> @@ -5937,7 +6010,7 @@ index b12ec2e472f..57986ca995a 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
>   $as_echo_n "checking for $LD option to reload object files... " >&6; }
>   if ${lt_cv_ld_reload_flag+:} false; then :
> -@@ -5918,6 +5998,11 @@ case $reload_flag in
> +@@ -5264,6 +5344,11 @@ case $reload_flag in
>   esac
>   reload_cmds='$LD$reload_flag -o $output$reload_objs'
>   case $host_os in
> @@ -5949,7 +6022,7 @@ index b12ec2e472f..57986ca995a 100755
>     darwin*)
>       if test "$GCC" = yes; then
>         reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
> -@@ -6086,7 +6171,8 @@ mingw* | pw32*)
> +@@ -5432,7 +5517,8 @@ mingw* | pw32*)
>       lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
>       lt_cv_file_magic_cmd='func_win32_libid'
>     else
> @@ -5959,7 +6032,7 @@ index b12ec2e472f..57986ca995a 100755
>       lt_cv_file_magic_cmd='$OBJDUMP -f'
>     fi
>     ;;
> -@@ -6240,6 +6326,21 @@ esac
> +@@ -5586,6 +5672,21 @@ esac
>   fi
>   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
>   $as_echo "$lt_cv_deplibs_check_method" >&6; }
> @@ -5981,7 +6054,7 @@ index b12ec2e472f..57986ca995a 100755
>   file_magic_cmd=$lt_cv_file_magic_cmd
>   deplibs_check_method=$lt_cv_deplibs_check_method
>   test -z "$deplibs_check_method" && deplibs_check_method=unknown
> -@@ -6253,11 +6354,164 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
> +@@ -5601,6 +5702,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
>   
>   
>   
> @@ -5995,11 +6068,7 @@ index b12ec2e472f..57986ca995a 100755
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
> @@ -6140,7 +6209,15 @@ index b12ec2e472f..57986ca995a 100755
>  +
>  +
>  +
> -+if test -n "$ac_tool_prefix"; then
> + plugin_option=
> + plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
> + for plugin in $plugin_names; do
> +@@ -5615,8 +5867,10 @@ for plugin in $plugin_names; do
> + done
> + 
> + if test -n "$ac_tool_prefix"; then
> +-  # Extract the first word of "${ac_tool_prefix}ar", so it can be a program name with args.
> +-set dummy ${ac_tool_prefix}ar; ac_word=$2
>  +  for ac_prog in ar
>  +  do
>  +    # Extract the first word of "$ac_tool_prefix$ac_prog", so it can be a program name with args.
> @@ -6148,7 +6225,7 @@ index b12ec2e472f..57986ca995a 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_AR+:} false; then :
> -@@ -6273,7 +6527,7 @@ do
> +@@ -5632,7 +5886,7 @@ do
>     test -z "$as_dir" && as_dir=.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -6157,7 +6234,7 @@ index b12ec2e472f..57986ca995a 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -6293,11 +6547,15 @@ $as_echo "no" >&6; }
> +@@ -5652,11 +5906,15 @@ $as_echo "no" >&6; }
>   fi
>   
>   
> @@ -6176,7 +6253,7 @@ index b12ec2e472f..57986ca995a 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_ac_ct_AR+:} false; then :
> -@@ -6313,7 +6571,7 @@ do
> +@@ -5672,7 +5930,7 @@ do
>     test -z "$as_dir" && as_dir=.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -6185,7 +6262,7 @@ index b12ec2e472f..57986ca995a 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -6332,6 +6590,10 @@ else
> +@@ -5691,6 +5949,10 @@ else
>   $as_echo "no" >&6; }
>   fi
>   
> @@ -6196,7 +6273,7 @@ index b12ec2e472f..57986ca995a 100755
>     if test "x$ac_ct_AR" = x; then
>       AR="false"
>     else
> -@@ -6343,16 +6605,72 @@ ac_tool_warned=yes ;;
> +@@ -5702,25 +5964,19 @@ ac_tool_warned=yes ;;
>   esac
>       AR=$ac_ct_AR
>     fi
> @@ -6205,20 +6282,36 @@ index b12ec2e472f..57986ca995a 100755
>   fi
>   
>  -test -z "$AR" && AR=ar
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
>  -test -z "$AR_FLAGS" && AR_FLAGS=cru
> ++  rm -f conftest.*
>  +: ${AR=ar}
>  +: ${AR_FLAGS=cru}
> -+
> -+
> -+
> -+
> -+
> -+
> -+
> -+
> -+
> -+
> -+
> + 
> + 
> + 
> +@@ -5732,6 +5988,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
> + 
> + 
> + 
>  +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE support" >&5
>  +$as_echo_n "checking for archiver @FILE support... " >&6; }
>  +if ${lt_cv_ar_at_file+:} false; then :
> @@ -6231,7 +6324,7 @@ index b12ec2e472f..57986ca995a 100755
>  +int
>  +main ()
>  +{
> - 
> ++
>  +  ;
>  +  return 0;
>  +}
> @@ -6257,23 +6350,30 @@ index b12ec2e472f..57986ca995a 100755
>  +        fi
>  +      fi
>  +      rm -f conftest.* libconftest.a
> - 
> ++
>  +fi
>  +rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
> - 
> ++
>  +fi
>  +{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_ar_at_file" >&5
>  +$as_echo "$lt_cv_ar_at_file" >&6; }
> - 
> ++
>  +if test "x$lt_cv_ar_at_file" = xno; then
>  +  archiver_list_spec=
>  +else
>  +  archiver_list_spec=$lt_cv_ar_at_file
>  +fi
> - 
> - 
> - 
> -@@ -6694,8 +7012,8 @@ esac
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
> +@@ -6071,8 +6385,8 @@ esac
>   lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
>   
>   # Transform an extracted symbol line into symbol name and symbol address
> @@ -6284,7 +6384,7 @@ index b12ec2e472f..57986ca995a 100755
>   
>   # Handle CRLF in mingw tool chain
>   opt_cr=
> -@@ -6731,6 +7049,7 @@ for ac_symprfx in "" "_"; do
> +@@ -6108,6 +6422,7 @@ for ac_symprfx in "" "_"; do
>     else
>       lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
>     fi
> @@ -6292,7 +6392,7 @@ index b12ec2e472f..57986ca995a 100755
>   
>     # Check to see that the pipe works correctly.
>     pipe_works=no
> -@@ -6772,6 +7091,18 @@ _LT_EOF
> +@@ -6149,6 +6464,18 @@ _LT_EOF
>         if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
>   	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
>   	  cat <<_LT_EOF > conftest.$ac_ext
> @@ -6311,7 +6411,7 @@ index b12ec2e472f..57986ca995a 100755
>   #ifdef __cplusplus
>   extern "C" {
>   #endif
> -@@ -6783,7 +7114,7 @@ _LT_EOF
> +@@ -6160,7 +6487,7 @@ _LT_EOF
>   	  cat <<_LT_EOF >> conftest.$ac_ext
>   
>   /* The mapping between symbol names and symbols.  */
> @@ -6320,7 +6420,7 @@ index b12ec2e472f..57986ca995a 100755
>     const char *name;
>     void       *address;
>   }
> -@@ -6809,8 +7140,8 @@ static const void *lt_preloaded_setup() {
> +@@ -6186,8 +6513,8 @@ static const void *lt_preloaded_setup() {
>   _LT_EOF
>   	  # Now try linking the two files.
>   	  mv conftest.$ac_objext conftstm.$ac_objext
> @@ -6331,7 +6431,7 @@ index b12ec2e472f..57986ca995a 100755
>   	  LIBS="conftstm.$ac_objext"
>   	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
>   	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
> -@@ -6820,8 +7151,8 @@ _LT_EOF
> +@@ -6197,8 +6524,8 @@ _LT_EOF
>     test $ac_status = 0; } && test -s conftest${ac_exeext}; then
>   	    pipe_works=yes
>   	  fi
> @@ -6342,7 +6442,7 @@ index b12ec2e472f..57986ca995a 100755
>   	else
>   	  echo "cannot find nm_test_func in $nlist" >&5
>   	fi
> -@@ -6858,6 +7189,20 @@ else
> +@@ -6235,6 +6562,18 @@ else
>   $as_echo "ok" >&6; }
>   fi
>   
> @@ -6358,15 +6458,15 @@ index b12ec2e472f..57986ca995a 100755
>  +
>  +
>  +
> -+
> -+
>   
>   
>   
> -@@ -6874,6 +7219,41 @@ fi
> +@@ -6251,6 +6590,43 @@ fi
>   
>   
>   
> ++
> ++
>  +
>  +
>  +
> @@ -6405,7 +6505,7 @@ index b12ec2e472f..57986ca995a 100755
>   
>   
>   
> -@@ -7085,6 +7465,123 @@ esac
> +@@ -6462,6 +6838,123 @@ esac
>   
>   need_locks="$enable_libtool_lock"
>   
> @@ -6529,7 +6629,7 @@ index b12ec2e472f..57986ca995a 100755
>   
>     case $host_os in
>       rhapsody* | darwin*)
> -@@ -7648,6 +8145,8 @@ _LT_EOF
> +@@ -7025,6 +7518,8 @@ _LT_EOF
>         $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
>         echo "$AR cru libconftest.a conftest.o" >&5
>         $AR cru libconftest.a conftest.o 2>&5
> @@ -6538,7 +6638,7 @@ index b12ec2e472f..57986ca995a 100755
>         cat > conftest.c << _LT_EOF
>   int main() { return 0;}
>   _LT_EOF
> -@@ -7843,7 +8342,8 @@ fi
> +@@ -7220,7 +7715,8 @@ fi
>   LIBTOOL_DEPS="$ltmain"
>   
>   # Always use our own libtool.
> @@ -6548,7 +6648,7 @@ index b12ec2e472f..57986ca995a 100755
>   
>   
>   
> -@@ -7932,7 +8432,7 @@ aix3*)
> +@@ -7309,7 +7805,7 @@ aix3*)
>   esac
>   
>   # Global variables:
> @@ -6557,7 +6657,7 @@ index b12ec2e472f..57986ca995a 100755
>   can_build_shared=yes
>   
>   # All known linkers require a `.a' archive for static linking (except MSVC,
> -@@ -8230,8 +8730,6 @@ fi
> +@@ -7607,8 +8103,6 @@ fi
>   lt_prog_compiler_pic=
>   lt_prog_compiler_static=
>   
> @@ -6566,7 +6666,7 @@ index b12ec2e472f..57986ca995a 100755
>   
>     if test "$GCC" = yes; then
>       lt_prog_compiler_wl='-Wl,'
> -@@ -8397,6 +8895,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -7774,6 +8268,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>   	lt_prog_compiler_pic='--shared'
>   	lt_prog_compiler_static='--static'
>   	;;
> @@ -6579,7 +6679,7 @@ index b12ec2e472f..57986ca995a 100755
>         pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
>           # Portland Group compilers (*not* the Pentium gcc compiler,
>   	# which looks to be a dead project)
> -@@ -8459,7 +8963,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -7836,7 +8336,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>         lt_prog_compiler_pic='-KPIC'
>         lt_prog_compiler_static='-Bstatic'
>         case $cc_basename in
> @@ -6588,7 +6688,7 @@ index b12ec2e472f..57986ca995a 100755
>   	lt_prog_compiler_wl='-Qoption ld ';;
>         *)
>   	lt_prog_compiler_wl='-Wl,';;
> -@@ -8516,13 +9020,17 @@ case $host_os in
> +@@ -7893,13 +8393,17 @@ case $host_os in
>       lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
>       ;;
>   esac
> @@ -6612,7 +6712,7 @@ index b12ec2e472f..57986ca995a 100755
>   
>   #
>   # Check to make sure the PIC flag actually works.
> -@@ -8583,6 +9091,11 @@ fi
> +@@ -7960,6 +8464,11 @@ fi
>   
>   
>   
> @@ -6624,7 +6724,7 @@ index b12ec2e472f..57986ca995a 100755
>   #
>   # Check to make sure the static flag actually works.
>   #
> -@@ -8933,7 +9446,8 @@ _LT_EOF
> +@@ -8310,7 +8819,8 @@ _LT_EOF
>         allow_undefined_flag=unsupported
>         always_export_symbols=no
>         enable_shared_with_static_runtimes=yes
> @@ -6634,7 +6734,7 @@ index b12ec2e472f..57986ca995a 100755
>   
>         if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
>           archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
> -@@ -9032,12 +9546,12 @@ _LT_EOF
> +@@ -8409,12 +8919,12 @@ _LT_EOF
>   	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
>   	  hardcode_libdir_flag_spec=
>   	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
> @@ -6649,7 +6749,7 @@ index b12ec2e472f..57986ca995a 100755
>   	  fi
>   	  ;;
>   	esac
> -@@ -9051,8 +9565,8 @@ _LT_EOF
> +@@ -8428,8 +8938,8 @@ _LT_EOF
>   	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
>   	wlarc=
>         else
> @@ -6660,7 +6760,7 @@ index b12ec2e472f..57986ca995a 100755
>         fi
>         ;;
>   
> -@@ -9070,8 +9584,8 @@ _LT_EOF
> +@@ -8447,8 +8957,8 @@ _LT_EOF
>   
>   _LT_EOF
>         elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -6671,7 +6771,7 @@ index b12ec2e472f..57986ca995a 100755
>         else
>   	ld_shlibs=no
>         fi
> -@@ -9117,8 +9631,8 @@ _LT_EOF
> +@@ -8494,8 +9004,8 @@ _LT_EOF
>   
>       *)
>         if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -6682,7 +6782,7 @@ index b12ec2e472f..57986ca995a 100755
>         else
>   	ld_shlibs=no
>         fi
> -@@ -9248,7 +9762,13 @@ _LT_EOF
> +@@ -8625,7 +9135,13 @@ _LT_EOF
>   	allow_undefined_flag='-berok'
>           # Determine the default libpath from the value encoded in an
>           # empty executable.
> @@ -6697,7 +6797,7 @@ index b12ec2e472f..57986ca995a 100755
>   /* end confdefs.h.  */
>   
>   int
> -@@ -9261,22 +9781,29 @@ main ()
> +@@ -8638,22 +9154,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>   
> @@ -6740,7 +6840,7 @@ index b12ec2e472f..57986ca995a 100755
>   
>           hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>           archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> -@@ -9288,7 +9815,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8665,7 +9188,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	else
>   	 # Determine the default libpath from the value encoded in an
>   	 # empty executable.
> @@ -6755,7 +6855,7 @@ index b12ec2e472f..57986ca995a 100755
>   /* end confdefs.h.  */
>   
>   int
> -@@ -9301,22 +9834,29 @@ main ()
> +@@ -8678,22 +9207,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>   
> @@ -6798,7 +6898,7 @@ index b12ec2e472f..57986ca995a 100755
>   
>   	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>   	  # Warning - without using the other run time loading flags,
> -@@ -9361,20 +9901,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8738,20 +9274,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>         # Microsoft Visual C++.
>         # hardcode_libdir_flag_spec is actually meaningless, as there is
>         # no search path for DLLs.
> @@ -6876,7 +6976,7 @@ index b12ec2e472f..57986ca995a 100755
>         ;;
>   
>       darwin* | rhapsody*)
> -@@ -9435,7 +10018,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8812,7 +9391,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
>       freebsd* | dragonfly*)
> @@ -6885,7 +6985,7 @@ index b12ec2e472f..57986ca995a 100755
>         hardcode_libdir_flag_spec='-R$libdir'
>         hardcode_direct=yes
>         hardcode_shlibpath_var=no
> -@@ -9443,7 +10026,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8820,7 +9399,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       hpux9*)
>         if test "$GCC" = yes; then
> @@ -6894,7 +6994,7 @@ index b12ec2e472f..57986ca995a 100755
>         else
>   	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
>         fi
> -@@ -9459,7 +10042,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8836,7 +9415,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       hpux10*)
>         if test "$GCC" = yes && test "$with_gnu_ld" = no; then
> @@ -6903,7 +7003,7 @@ index b12ec2e472f..57986ca995a 100755
>         else
>   	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
>         fi
> -@@ -9483,10 +10066,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8860,10 +9439,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
>   	  ;;
>   	ia64*)
> @@ -6916,7 +7016,7 @@ index b12ec2e472f..57986ca995a 100755
>   	  ;;
>   	esac
>         else
> -@@ -9565,23 +10148,36 @@ fi
> +@@ -8942,23 +9521,36 @@ fi
>   
>       irix5* | irix6* | nonstopux*)
>         if test "$GCC" = yes; then
> @@ -6961,7 +7061,7 @@ index b12ec2e472f..57986ca995a 100755
>         else
>   	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
>   	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
> -@@ -9666,7 +10262,7 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9043,7 +9635,7 @@ rm -f core conftest.err conftest.$ac_objext \
>       osf4* | osf5*)	# as osf3* with the addition of -msym flag
>         if test "$GCC" = yes; then
>   	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
> @@ -6970,7 +7070,7 @@ index b12ec2e472f..57986ca995a 100755
>   	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
>         else
>   	allow_undefined_flag=' -expect_unresolved \*'
> -@@ -9685,9 +10281,9 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9062,9 +9654,9 @@ rm -f core conftest.err conftest.$ac_objext \
>         no_undefined_flag=' -z defs'
>         if test "$GCC" = yes; then
>   	wlarc='${wl}'
> @@ -6982,7 +7082,7 @@ index b12ec2e472f..57986ca995a 100755
>         else
>   	case `$CC -V 2>&1` in
>   	*"Compilers 5.0"*)
> -@@ -10263,8 +10859,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -9640,8 +10232,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>     need_version=no
>     need_lib_prefix=no
>   
> @@ -6994,7 +7094,7 @@ index b12ec2e472f..57986ca995a 100755
>       library_names_spec='$libname.dll.a'
>       # DLL is installed to $(libdir)/../bin by postinstall_cmds
>       postinstall_cmds='base_file=`basename \${file}`~
> -@@ -10297,13 +10894,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -9674,13 +10267,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>         library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>         ;;
>       esac
> @@ -7067,7 +7167,7 @@ index b12ec2e472f..57986ca995a 100755
>     # FIXME: first we should search . and the directory the executable is in
>     shlibpath_var=PATH
>     ;;
> -@@ -10385,7 +11040,7 @@ haiku*)
> +@@ -9762,7 +10413,7 @@ haiku*)
>     soname_spec='${libname}${release}${shared_ext}$major'
>     shlibpath_var=LIBRARY_PATH
>     shlibpath_overrides_runpath=yes
> @@ -7076,16 +7176,16 @@ index b12ec2e472f..57986ca995a 100755
>     hardcode_into_libs=yes
>     ;;
>   
> -@@ -11181,7 +11836,7 @@ else
> +@@ -10558,7 +11209,7 @@ else
>     lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>     lt_status=$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 11184 "configure"
> +-#line 10561 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>   
>   #if HAVE_DLFCN_H
> -@@ -11225,10 +11880,10 @@ else
> +@@ -10602,10 +11253,10 @@ else
>   /* When -fvisbility=hidden is used, assume the code has been annotated
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -7098,16 +7198,16 @@ index b12ec2e472f..57986ca995a 100755
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -11287,7 +11942,7 @@ else
> +@@ -10664,7 +11315,7 @@ else
>     lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>     lt_status=$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 11290 "configure"
> +-#line 10667 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>   
>   #if HAVE_DLFCN_H
> -@@ -11331,10 +11986,10 @@ else
> +@@ -10708,10 +11359,10 @@ else
>   /* When -fvisbility=hidden is used, assume the code has been annotated
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -7120,7 +7220,7 @@ index b12ec2e472f..57986ca995a 100755
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -13341,13 +13996,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
> +@@ -12731,13 +13382,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
>   lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>   lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>   lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -7141,7 +7241,7 @@ index b12ec2e472f..57986ca995a 100755
>   STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>   RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>   old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
> -@@ -13362,14 +14024,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
> +@@ -12752,14 +13410,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
>   lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
> @@ -7160,7 +7260,7 @@ index b12ec2e472f..57986ca995a 100755
>   DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>   NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>   LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -13402,12 +14067,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
> +@@ -12792,12 +13453,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
>   hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
>   inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
>   link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
> @@ -7174,7 +7274,7 @@ index b12ec2e472f..57986ca995a 100755
>   file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
>   variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
>   need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
> -@@ -13462,8 +14127,13 @@ reload_flag \
> +@@ -12852,8 +13513,13 @@ reload_flag \
>   OBJDUMP \
>   deplibs_check_method \
>   file_magic_cmd \
> @@ -7188,7 +7288,7 @@ index b12ec2e472f..57986ca995a 100755
>   STRIP \
>   RANLIB \
>   CC \
> -@@ -13473,12 +14143,14 @@ lt_cv_sys_global_symbol_pipe \
> +@@ -12863,12 +13529,14 @@ lt_cv_sys_global_symbol_pipe \
>   lt_cv_sys_global_symbol_to_cdecl \
>   lt_cv_sys_global_symbol_to_c_name_address \
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -7204,7 +7304,7 @@ index b12ec2e472f..57986ca995a 100755
>   DSYMUTIL \
>   NMEDIT \
>   LIPO \
> -@@ -13494,7 +14166,6 @@ no_undefined_flag \
> +@@ -12884,7 +13552,6 @@ no_undefined_flag \
>   hardcode_libdir_flag_spec \
>   hardcode_libdir_flag_spec_ld \
>   hardcode_libdir_separator \
> @@ -7212,7 +7312,7 @@ index b12ec2e472f..57986ca995a 100755
>   exclude_expsyms \
>   include_expsyms \
>   file_list_spec \
> -@@ -13530,6 +14201,7 @@ module_cmds \
> +@@ -12920,6 +13587,7 @@ module_cmds \
>   module_expsym_cmds \
>   export_symbols_cmds \
>   prelink_cmds \
> @@ -7220,7 +7320,7 @@ index b12ec2e472f..57986ca995a 100755
>   postinstall_cmds \
>   postuninstall_cmds \
>   finish_cmds \
> -@@ -14295,7 +14967,8 @@ $as_echo X"$file" |
> +@@ -13685,7 +14353,8 @@ $as_echo X"$file" |
>   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>   #
>   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -7230,7 +7330,7 @@ index b12ec2e472f..57986ca995a 100755
>   #   Written by Gordon Matzigkeit, 1996
>   #
>   #   This file is part of GNU Libtool.
> -@@ -14398,19 +15071,42 @@ SP2NL=$lt_lt_SP2NL
> +@@ -13788,19 +14457,42 @@ SP2NL=$lt_lt_SP2NL
>   # turn newlines into spaces.
>   NL2SP=$lt_lt_NL2SP
>   
> @@ -7274,7 +7374,7 @@ index b12ec2e472f..57986ca995a 100755
>   # A symbol stripping program.
>   STRIP=$lt_STRIP
>   
> -@@ -14440,6 +15136,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
> +@@ -13830,6 +14522,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
>   # Transform the output of nm in a C name address pair when lib prefix is needed.
>   global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
>   
> @@ -7287,7 +7387,7 @@ index b12ec2e472f..57986ca995a 100755
>   # The name of the directory that contains temporary libtool files.
>   objdir=$objdir
>   
> -@@ -14449,6 +15151,9 @@ MAGIC_CMD=$MAGIC_CMD
> +@@ -13839,6 +14537,9 @@ MAGIC_CMD=$MAGIC_CMD
>   # Must we lock files when doing compilation?
>   need_locks=$lt_need_locks
>   
> @@ -7297,7 +7397,7 @@ index b12ec2e472f..57986ca995a 100755
>   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>   DSYMUTIL=$lt_DSYMUTIL
>   
> -@@ -14563,12 +15268,12 @@ with_gcc=$GCC
> +@@ -13953,12 +14654,12 @@ with_gcc=$GCC
>   # Compiler flag to turn off builtin functions.
>   no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
>   
> @@ -7313,7 +7413,7 @@ index b12ec2e472f..57986ca995a 100755
>   # Compiler flag to prevent dynamic linking.
>   link_static_flag=$lt_lt_prog_compiler_static
>   
> -@@ -14655,9 +15360,6 @@ inherit_rpath=$inherit_rpath
> +@@ -14045,9 +14746,6 @@ inherit_rpath=$inherit_rpath
>   # Whether libtool must link a program against all its dependency libraries.
>   link_all_deplibs=$link_all_deplibs
>   
> @@ -7323,7 +7423,7 @@ index b12ec2e472f..57986ca995a 100755
>   # Set to "yes" if exported symbols are required.
>   always_export_symbols=$always_export_symbols
>   
> -@@ -14673,6 +15375,9 @@ include_expsyms=$lt_include_expsyms
> +@@ -14063,6 +14761,9 @@ include_expsyms=$lt_include_expsyms
>   # Commands necessary for linking programs (against libraries) with templates.
>   prelink_cmds=$lt_prelink_cmds
>   
> @@ -7333,7 +7433,7 @@ index b12ec2e472f..57986ca995a 100755
>   # Specify filename containing input files.
>   file_list_spec=$lt_file_list_spec
>   
> -@@ -14705,210 +15410,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
> +@@ -14095,210 +14796,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
>     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>     # text mode, it properly converts lines to CR/LF.  This bash problem
>     # is reportedly fixed, but why not run on old versions too?
> @@ -7708,7 +7808,7 @@ index b12ec2e472f..57986ca995a 100755
>     chmod +x "$ofile"
>   
>  diff --git a/ld/configure b/ld/configure
> -index 8355c433c76..a49ab3d1f09 100755
> +index 2aeb3317b65..5ef46d31558 100755
>  --- a/ld/configure
>  +++ b/ld/configure
>  @@ -693,8 +693,11 @@ OTOOL
> @@ -7731,7 +7831,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   enable_libtool_lock
>   enable_plugins
>   enable_largefile
> -@@ -1526,6 +1530,8 @@ Optional Packages:
> +@@ -1528,6 +1532,8 @@ Optional Packages:
>     --with-pic              try to use only PIC/non-PIC objects [default=use
>                             both]
>     --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
> @@ -7740,7 +7840,7 @@ index 8355c433c76..a49ab3d1f09 100755
>     --with-lib-path=dir1:dir2...  set default LIB_PATH
>     --with-sysroot=DIR Search for usr/lib et al within DIR.
>     --with-system-zlib      use installed libz
> -@@ -5979,8 +5985,8 @@ esac
> +@@ -5327,8 +5333,8 @@ esac
>   
>   
>   
> @@ -7751,7 +7851,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   
>   
>   
> -@@ -6020,7 +6026,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> +@@ -5368,7 +5374,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
>   $as_echo_n "checking how to print strings... " >&6; }
>   # Test print first, because it will be a builtin if present.
> @@ -7760,7 +7860,7 @@ index 8355c433c76..a49ab3d1f09 100755
>      test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
>     ECHO='print -r --'
>   elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
> -@@ -6706,8 +6712,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
> +@@ -6054,8 +6060,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
>   # Try some XSI features
>   xsi_shell=no
>   ( _lt_dummy="a/b/c"
> @@ -7771,7 +7871,7 @@ index 8355c433c76..a49ab3d1f09 100755
>       && eval 'test $(( 1 + 1 )) -eq 2 \
>       && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
>     && xsi_shell=yes
> -@@ -6756,6 +6762,80 @@ esac
> +@@ -6104,6 +6110,80 @@ esac
>   
>   
>   
> @@ -7852,7 +7952,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
>   $as_echo_n "checking for $LD option to reload object files... " >&6; }
>   if ${lt_cv_ld_reload_flag+:} false; then :
> -@@ -6772,6 +6852,11 @@ case $reload_flag in
> +@@ -6120,6 +6200,11 @@ case $reload_flag in
>   esac
>   reload_cmds='$LD$reload_flag -o $output$reload_objs'
>   case $host_os in
> @@ -7864,7 +7964,7 @@ index 8355c433c76..a49ab3d1f09 100755
>     darwin*)
>       if test "$GCC" = yes; then
>         reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
> -@@ -6940,7 +7025,8 @@ mingw* | pw32*)
> +@@ -6288,7 +6373,8 @@ mingw* | pw32*)
>       lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
>       lt_cv_file_magic_cmd='func_win32_libid'
>     else
> @@ -7874,7 +7974,7 @@ index 8355c433c76..a49ab3d1f09 100755
>       lt_cv_file_magic_cmd='$OBJDUMP -f'
>     fi
>     ;;
> -@@ -7094,6 +7180,21 @@ esac
> +@@ -6442,6 +6528,21 @@ esac
>   fi
>   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
>   $as_echo "$lt_cv_deplibs_check_method" >&6; }
> @@ -7896,7 +7996,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   file_magic_cmd=$lt_cv_file_magic_cmd
>   deplibs_check_method=$lt_cv_deplibs_check_method
>   test -z "$deplibs_check_method" && deplibs_check_method=unknown
> -@@ -7109,9 +7210,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
> +@@ -6457,6 +6558,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
>   
>   
>   
> @@ -8051,6 +8151,12 @@ index 8355c433c76..a49ab3d1f09 100755
>  +
>  +
>  +
> + plugin_option=
> + plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
> + for plugin in $plugin_names; do
> +@@ -6471,8 +6723,10 @@ for plugin in $plugin_names; do
> + done
> + 
>   if test -n "$ac_tool_prefix"; then
>  -  # Extract the first word of "${ac_tool_prefix}ar", so it can be a program name with args.
>  -set dummy ${ac_tool_prefix}ar; ac_word=$2
> @@ -8061,7 +8167,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_AR+:} false; then :
> -@@ -7127,7 +7381,7 @@ do
> +@@ -6488,7 +6742,7 @@ do
>     test -z "$as_dir" && as_dir=.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -8070,7 +8176,7 @@ index 8355c433c76..a49ab3d1f09 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -7147,11 +7401,15 @@ $as_echo "no" >&6; }
> +@@ -6508,11 +6762,15 @@ $as_echo "no" >&6; }
>   fi
>   
>   
> @@ -8089,7 +8195,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_ac_ct_AR+:} false; then :
> -@@ -7167,7 +7425,7 @@ do
> +@@ -6528,7 +6786,7 @@ do
>     test -z "$as_dir" && as_dir=.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -8098,7 +8204,7 @@ index 8355c433c76..a49ab3d1f09 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -7186,6 +7444,10 @@ else
> +@@ -6547,6 +6805,10 @@ else
>   $as_echo "no" >&6; }
>   fi
>   
> @@ -8109,7 +8215,7 @@ index 8355c433c76..a49ab3d1f09 100755
>     if test "x$ac_ct_AR" = x; then
>       AR="false"
>     else
> -@@ -7197,12 +7459,12 @@ ac_tool_warned=yes ;;
> +@@ -6558,25 +6820,19 @@ ac_tool_warned=yes ;;
>   esac
>       AR=$ac_ct_AR
>     fi
> @@ -8118,15 +8224,33 @@ index 8355c433c76..a49ab3d1f09 100755
>   fi
>   
>  -test -z "$AR" && AR=ar
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
>  -test -z "$AR_FLAGS" && AR_FLAGS=cru
> ++  rm -f conftest.*
>  +: ${AR=ar}
>  +: ${AR_FLAGS=cru}
> -+
> -+
>   
>   
>   
> -@@ -7212,6 +7474,62 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
> +@@ -6588,6 +6844,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
>   
>   
>   
> @@ -8186,10 +8310,12 @@ index 8355c433c76..a49ab3d1f09 100755
>  +
>  +
>  +
> - 
> - 
> ++
> ++
>   if test -n "$ac_tool_prefix"; then
> -@@ -7548,8 +7866,8 @@ esac
> +   # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
> + set dummy ${ac_tool_prefix}strip; ac_word=$2
> +@@ -6927,8 +7241,8 @@ esac
>   lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
>   
>   # Transform an extracted symbol line into symbol name and symbol address
> @@ -8200,7 +8326,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   
>   # Handle CRLF in mingw tool chain
>   opt_cr=
> -@@ -7585,6 +7903,7 @@ for ac_symprfx in "" "_"; do
> +@@ -6964,6 +7278,7 @@ for ac_symprfx in "" "_"; do
>     else
>       lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
>     fi
> @@ -8208,7 +8334,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   
>     # Check to see that the pipe works correctly.
>     pipe_works=no
> -@@ -7626,6 +7945,18 @@ _LT_EOF
> +@@ -7005,6 +7320,18 @@ _LT_EOF
>         if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
>   	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
>   	  cat <<_LT_EOF > conftest.$ac_ext
> @@ -8227,7 +8353,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   #ifdef __cplusplus
>   extern "C" {
>   #endif
> -@@ -7637,7 +7968,7 @@ _LT_EOF
> +@@ -7016,7 +7343,7 @@ _LT_EOF
>   	  cat <<_LT_EOF >> conftest.$ac_ext
>   
>   /* The mapping between symbol names and symbols.  */
> @@ -8236,7 +8362,7 @@ index 8355c433c76..a49ab3d1f09 100755
>     const char *name;
>     void       *address;
>   }
> -@@ -7663,8 +7994,8 @@ static const void *lt_preloaded_setup() {
> +@@ -7042,8 +7369,8 @@ static const void *lt_preloaded_setup() {
>   _LT_EOF
>   	  # Now try linking the two files.
>   	  mv conftest.$ac_objext conftstm.$ac_objext
> @@ -8247,7 +8373,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   	  LIBS="conftstm.$ac_objext"
>   	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
>   	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
> -@@ -7674,8 +8005,8 @@ _LT_EOF
> +@@ -7053,8 +7380,8 @@ _LT_EOF
>     test $ac_status = 0; } && test -s conftest${ac_exeext}; then
>   	    pipe_works=yes
>   	  fi
> @@ -8258,7 +8384,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   	else
>   	  echo "cannot find nm_test_func in $nlist" >&5
>   	fi
> -@@ -7712,6 +8043,19 @@ else
> +@@ -7091,6 +7418,17 @@ else
>   $as_echo "ok" >&6; }
>   fi
>   
> @@ -8273,12 +8399,10 @@ index 8355c433c76..a49ab3d1f09 100755
>  +
>  +
>  +
> -+
> -+
>   
>   
>   
> -@@ -7728,6 +8072,42 @@ fi
> +@@ -7107,6 +7445,44 @@ fi
>   
>   
>   
> @@ -8286,6 +8410,8 @@ index 8355c433c76..a49ab3d1f09 100755
>  +
>  +
>  +
> ++
> ++
>  +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
>  +$as_echo_n "checking for sysroot... " >&6; }
>  +
> @@ -8321,7 +8447,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   
>   
>   
> -@@ -7939,6 +8319,123 @@ esac
> +@@ -7318,6 +7694,123 @@ esac
>   
>   need_locks="$enable_libtool_lock"
>   
> @@ -8445,7 +8571,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   
>     case $host_os in
>       rhapsody* | darwin*)
> -@@ -8502,6 +8999,8 @@ _LT_EOF
> +@@ -7881,6 +8374,8 @@ _LT_EOF
>         $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
>         echo "$AR cru libconftest.a conftest.o" >&5
>         $AR cru libconftest.a conftest.o 2>&5
> @@ -8454,7 +8580,7 @@ index 8355c433c76..a49ab3d1f09 100755
>         cat > conftest.c << _LT_EOF
>   int main() { return 0;}
>   _LT_EOF
> -@@ -8570,6 +9069,16 @@ done
> +@@ -7949,6 +8444,16 @@ done
>   
>   
>   
> @@ -8471,7 +8597,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   
>   
>   # Set options
> -@@ -8698,7 +9207,8 @@ fi
> +@@ -8077,7 +8582,8 @@ fi
>   LIBTOOL_DEPS="$ltmain"
>   
>   # Always use our own libtool.
> @@ -8481,7 +8607,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   
>   
>   
> -@@ -8787,7 +9297,7 @@ aix3*)
> +@@ -8166,7 +8672,7 @@ aix3*)
>   esac
>   
>   # Global variables:
> @@ -8490,7 +8616,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   can_build_shared=yes
>   
>   # All known linkers require a `.a' archive for static linking (except MSVC,
> -@@ -9085,8 +9595,6 @@ fi
> +@@ -8464,8 +8970,6 @@ fi
>   lt_prog_compiler_pic=
>   lt_prog_compiler_static=
>   
> @@ -8499,7 +8625,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   
>     if test "$GCC" = yes; then
>       lt_prog_compiler_wl='-Wl,'
> -@@ -9252,6 +9760,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -8631,6 +9135,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>   	lt_prog_compiler_pic='--shared'
>   	lt_prog_compiler_static='--static'
>   	;;
> @@ -8512,7 +8638,7 @@ index 8355c433c76..a49ab3d1f09 100755
>         pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
>           # Portland Group compilers (*not* the Pentium gcc compiler,
>   	# which looks to be a dead project)
> -@@ -9314,7 +9828,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -8693,7 +9203,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>         lt_prog_compiler_pic='-KPIC'
>         lt_prog_compiler_static='-Bstatic'
>         case $cc_basename in
> @@ -8521,7 +8647,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   	lt_prog_compiler_wl='-Qoption ld ';;
>         *)
>   	lt_prog_compiler_wl='-Wl,';;
> -@@ -9371,13 +9885,17 @@ case $host_os in
> +@@ -8750,13 +9260,17 @@ case $host_os in
>       lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
>       ;;
>   esac
> @@ -8545,7 +8671,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   
>   #
>   # Check to make sure the PIC flag actually works.
> -@@ -9438,6 +9956,11 @@ fi
> +@@ -8817,6 +9331,11 @@ fi
>   
>   
>   
> @@ -8557,7 +8683,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   #
>   # Check to make sure the static flag actually works.
>   #
> -@@ -9788,7 +10311,8 @@ _LT_EOF
> +@@ -9167,7 +9686,8 @@ _LT_EOF
>         allow_undefined_flag=unsupported
>         always_export_symbols=no
>         enable_shared_with_static_runtimes=yes
> @@ -8567,7 +8693,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   
>         if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
>           archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
> -@@ -9887,12 +10411,12 @@ _LT_EOF
> +@@ -9266,12 +9786,12 @@ _LT_EOF
>   	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
>   	  hardcode_libdir_flag_spec=
>   	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
> @@ -8582,7 +8708,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   	  fi
>   	  ;;
>   	esac
> -@@ -9906,8 +10430,8 @@ _LT_EOF
> +@@ -9285,8 +9805,8 @@ _LT_EOF
>   	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
>   	wlarc=
>         else
> @@ -8593,7 +8719,7 @@ index 8355c433c76..a49ab3d1f09 100755
>         fi
>         ;;
>   
> -@@ -9925,8 +10449,8 @@ _LT_EOF
> +@@ -9304,8 +9824,8 @@ _LT_EOF
>   
>   _LT_EOF
>         elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -8604,7 +8730,7 @@ index 8355c433c76..a49ab3d1f09 100755
>         else
>   	ld_shlibs=no
>         fi
> -@@ -9972,8 +10496,8 @@ _LT_EOF
> +@@ -9351,8 +9871,8 @@ _LT_EOF
>   
>       *)
>         if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -8615,7 +8741,7 @@ index 8355c433c76..a49ab3d1f09 100755
>         else
>   	ld_shlibs=no
>         fi
> -@@ -10103,7 +10627,13 @@ _LT_EOF
> +@@ -9482,7 +10002,13 @@ _LT_EOF
>   	allow_undefined_flag='-berok'
>           # Determine the default libpath from the value encoded in an
>           # empty executable.
> @@ -8630,7 +8756,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   /* end confdefs.h.  */
>   
>   int
> -@@ -10116,22 +10646,29 @@ main ()
> +@@ -9495,22 +10021,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>   
> @@ -8673,7 +8799,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   
>           hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>           archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> -@@ -10143,7 +10680,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9522,7 +10055,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	else
>   	 # Determine the default libpath from the value encoded in an
>   	 # empty executable.
> @@ -8688,7 +8814,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   /* end confdefs.h.  */
>   
>   int
> -@@ -10156,22 +10699,29 @@ main ()
> +@@ -9535,22 +10074,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>   
> @@ -8731,7 +8857,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   
>   	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>   	  # Warning - without using the other run time loading flags,
> -@@ -10215,21 +10765,64 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9594,21 +10140,64 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>         # When not using gcc, we currently assume that we are using
>         # Microsoft Visual C++.
>         # hardcode_libdir_flag_spec is actually meaningless, as there is
> @@ -8811,7 +8937,7 @@ index 8355c433c76..a49ab3d1f09 100755
>         ;;
>   
>       darwin* | rhapsody*)
> -@@ -10290,7 +10883,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9669,7 +10258,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
>       freebsd* | dragonfly*)
> @@ -8820,7 +8946,7 @@ index 8355c433c76..a49ab3d1f09 100755
>         hardcode_libdir_flag_spec='-R$libdir'
>         hardcode_direct=yes
>         hardcode_shlibpath_var=no
> -@@ -10298,7 +10891,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9677,7 +10266,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       hpux9*)
>         if test "$GCC" = yes; then
> @@ -8829,7 +8955,7 @@ index 8355c433c76..a49ab3d1f09 100755
>         else
>   	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
>         fi
> -@@ -10314,7 +10907,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9693,7 +10282,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       hpux10*)
>         if test "$GCC" = yes && test "$with_gnu_ld" = no; then
> @@ -8838,7 +8964,7 @@ index 8355c433c76..a49ab3d1f09 100755
>         else
>   	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
>         fi
> -@@ -10338,10 +10931,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9717,10 +10306,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
>   	  ;;
>   	ia64*)
> @@ -8851,7 +8977,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   	  ;;
>   	esac
>         else
> -@@ -10420,23 +11013,36 @@ fi
> +@@ -9799,23 +10388,36 @@ fi
>   
>       irix5* | irix6* | nonstopux*)
>         if test "$GCC" = yes; then
> @@ -8896,7 +9022,7 @@ index 8355c433c76..a49ab3d1f09 100755
>         else
>   	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
>   	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
> -@@ -10521,7 +11127,7 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9900,7 +10502,7 @@ rm -f core conftest.err conftest.$ac_objext \
>       osf4* | osf5*)	# as osf3* with the addition of -msym flag
>         if test "$GCC" = yes; then
>   	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
> @@ -8905,7 +9031,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
>         else
>   	allow_undefined_flag=' -expect_unresolved \*'
> -@@ -10540,9 +11146,9 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9919,9 +10521,9 @@ rm -f core conftest.err conftest.$ac_objext \
>         no_undefined_flag=' -z defs'
>         if test "$GCC" = yes; then
>   	wlarc='${wl}'
> @@ -8917,7 +9043,7 @@ index 8355c433c76..a49ab3d1f09 100755
>         else
>   	case `$CC -V 2>&1` in
>   	*"Compilers 5.0"*)
> -@@ -11118,8 +11724,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -10497,8 +11099,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>     need_version=no
>     need_lib_prefix=no
>   
> @@ -8929,7 +9055,7 @@ index 8355c433c76..a49ab3d1f09 100755
>       library_names_spec='$libname.dll.a'
>       # DLL is installed to $(libdir)/../bin by postinstall_cmds
>       postinstall_cmds='base_file=`basename \${file}`~
> -@@ -11152,13 +11759,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -10531,13 +11134,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>         library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>         ;;
>       esac
> @@ -9002,7 +9128,7 @@ index 8355c433c76..a49ab3d1f09 100755
>     # FIXME: first we should search . and the directory the executable is in
>     shlibpath_var=PATH
>     ;;
> -@@ -11240,7 +11905,7 @@ haiku*)
> +@@ -10619,7 +11280,7 @@ haiku*)
>     soname_spec='${libname}${release}${shared_ext}$major'
>     shlibpath_var=LIBRARY_PATH
>     shlibpath_overrides_runpath=yes
> @@ -9011,16 +9137,16 @@ index 8355c433c76..a49ab3d1f09 100755
>     hardcode_into_libs=yes
>     ;;
>   
> -@@ -12036,7 +12701,7 @@ else
> +@@ -11415,7 +12076,7 @@ else
>     lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>     lt_status=$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 12036 "configure"
> +-#line 11415 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>   
>   #if HAVE_DLFCN_H
> -@@ -12080,10 +12745,10 @@ else
> +@@ -11459,10 +12120,10 @@ else
>   /* When -fvisbility=hidden is used, assume the code has been annotated
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -9033,16 +9159,16 @@ index 8355c433c76..a49ab3d1f09 100755
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -12142,7 +12807,7 @@ else
> +@@ -11521,7 +12182,7 @@ else
>     lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>     lt_status=$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 12142 "configure"
> +-#line 11521 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>   
>   #if HAVE_DLFCN_H
> -@@ -12186,10 +12851,10 @@ else
> +@@ -11565,10 +12226,10 @@ else
>   /* When -fvisbility=hidden is used, assume the code has been annotated
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -9055,7 +9181,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -12581,6 +13246,7 @@ $RM -r conftest*
> +@@ -11960,6 +12621,7 @@ $RM -r conftest*
>   
>     # Allow CC to be a program name with arguments.
>     lt_save_CC=$CC
> @@ -9063,7 +9189,7 @@ index 8355c433c76..a49ab3d1f09 100755
>     lt_save_LD=$LD
>     lt_save_GCC=$GCC
>     GCC=$GXX
> -@@ -12598,6 +13264,7 @@ $RM -r conftest*
> +@@ -11977,6 +12639,7 @@ $RM -r conftest*
>     fi
>     test -z "${LDCXX+set}" || LD=$LDCXX
>     CC=${CXX-"c++"}
> @@ -9071,7 +9197,7 @@ index 8355c433c76..a49ab3d1f09 100755
>     compiler=$CC
>     compiler_CXX=$CC
>     for cc_temp in $compiler""; do
> -@@ -12880,7 +13547,13 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
> +@@ -12259,7 +12922,13 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
>             allow_undefined_flag_CXX='-berok'
>             # Determine the default libpath from the value encoded in an empty
>             # executable.
> @@ -9086,7 +9212,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   /* end confdefs.h.  */
>   
>   int
> -@@ -12893,22 +13566,29 @@ main ()
> +@@ -12272,22 +12941,29 @@ main ()
>   _ACEOF
>   if ac_fn_cxx_try_link "$LINENO"; then :
>   
> @@ -9129,7 +9255,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   
>             hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
>   
> -@@ -12921,7 +13601,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -12300,7 +12976,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>             else
>   	    # Determine the default libpath from the value encoded in an
>   	    # empty executable.
> @@ -9144,7 +9270,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   /* end confdefs.h.  */
>   
>   int
> -@@ -12934,22 +13620,29 @@ main ()
> +@@ -12313,22 +12995,29 @@ main ()
>   _ACEOF
>   if ac_fn_cxx_try_link "$LINENO"; then :
>   
> @@ -9187,7 +9313,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   
>   	    hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
>   	    # Warning - without using the other run time loading flags,
> -@@ -12992,29 +13685,75 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -12371,29 +13060,75 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>           ;;
>   
>         cygwin* | mingw* | pw32* | cegcc*)
> @@ -9286,7 +9412,7 @@ index 8355c433c76..a49ab3d1f09 100755
>         darwin* | rhapsody*)
>   
>   
> -@@ -13120,7 +13859,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -12499,7 +13234,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>               ;;
>             *)
>               if test "$GXX" = yes; then
> @@ -9295,7 +9421,7 @@ index 8355c433c76..a49ab3d1f09 100755
>               else
>                 # FIXME: insert proper C++ library support
>                 ld_shlibs_CXX=no
> -@@ -13191,10 +13930,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -12570,10 +13305,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	            archive_cmds_CXX='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
>   	            ;;
>   	          ia64*)
> @@ -9308,7 +9434,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   	            ;;
>   	        esac
>   	      fi
> -@@ -13235,9 +13974,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -12614,9 +13349,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>             *)
>   	    if test "$GXX" = yes; then
>   	      if test "$with_gnu_ld" = no; then
> @@ -9320,7 +9446,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   	      fi
>   	    fi
>   	    link_all_deplibs_CXX=yes
> -@@ -13307,20 +14046,20 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -12686,20 +13421,20 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	      prelink_cmds_CXX='tpldir=Template.dir~
>   		rm -rf $tpldir~
>   		$CC --prelink_objects --instantiation_dir $tpldir $objs $libobjs $compile_deplibs~
> @@ -9345,7 +9471,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   	      ;;
>   	    *) # Version 6 and above use weak symbols
>   	      archive_cmds_CXX='$CC -shared $pic_flag $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
> -@@ -13515,7 +14254,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -12894,7 +13629,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	          archive_cmds_CXX='$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
>   		  ;;
>   	        *)
> @@ -9354,7 +9480,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   		  ;;
>   	      esac
>   
> -@@ -13561,7 +14300,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -12940,7 +13675,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>         solaris*)
>           case $cc_basename in
> @@ -9363,7 +9489,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   	    # Sun C++ 4.2, 5.x and Centerline C++
>               archive_cmds_need_lc_CXX=yes
>   	    no_undefined_flag_CXX=' -zdefs'
> -@@ -13602,9 +14341,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -12981,9 +13716,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	    if test "$GXX" = yes && test "$with_gnu_ld" = no; then
>   	      no_undefined_flag_CXX=' ${wl}-z ${wl}defs'
>   	      if $CC --version | $GREP -v '^2\.7' > /dev/null; then
> @@ -9375,7 +9501,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   
>   	        # Commands to make compiler produce verbose output that lists
>   	        # what "hidden" libraries, object files and flags are used when
> -@@ -13739,6 +14478,13 @@ private:
> +@@ -13118,6 +13853,13 @@ private:
>   };
>   _LT_EOF
>   
> @@ -9389,7 +9515,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
>     (eval $ac_compile) 2>&5
>     ac_status=$?
> -@@ -13752,7 +14498,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
> +@@ -13131,7 +13873,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
>     pre_test_object_deps_done=no
>   
>     for p in `eval "$output_verbose_link_cmd"`; do
> @@ -9398,7 +9524,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   
>       -L* | -R* | -l*)
>          # Some compilers place space between "-{L,R}" and the path.
> -@@ -13761,13 +14507,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
> +@@ -13140,13 +13882,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
>             test $p = "-R"; then
>   	 prev=$p
>   	 continue
> @@ -9425,7 +9551,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   	   # Internal compiler library paths should come after those
>   	   # provided the user.  The postdeps already come after the
>   	   # user supplied libs so there is no need to process them.
> -@@ -13787,8 +14542,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
> +@@ -13166,8 +13917,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
>   	   postdeps_CXX="${postdeps_CXX} ${prev}${p}"
>   	 fi
>          fi
> @@ -9436,7 +9562,7 @@ index 8355c433c76..a49ab3d1f09 100755
>       *.$objext)
>          # This assumes that the test object file only shows up
>          # once in the compiler output.
> -@@ -13824,6 +14581,7 @@ else
> +@@ -13203,6 +13956,7 @@ else
>   fi
>   
>   $RM -f confest.$objext
> @@ -9444,7 +9570,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   
>   # PORTME: override above test on systems where it is broken
>   case $host_os in
> -@@ -13859,7 +14617,7 @@ linux*)
> +@@ -13238,7 +13992,7 @@ linux*)
>   
>   solaris*)
>     case $cc_basename in
> @@ -9453,7 +9579,7 @@ index 8355c433c76..a49ab3d1f09 100755
>       # The more standards-conforming stlport4 library is
>       # incompatible with the Cstd library. Avoid specifying
>       # it if it's in CXXFLAGS. Ignore libCrun as
> -@@ -13924,8 +14682,6 @@ fi
> +@@ -13303,8 +14057,6 @@ fi
>   lt_prog_compiler_pic_CXX=
>   lt_prog_compiler_static_CXX=
>   
> @@ -9462,7 +9588,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   
>     # C++ specific cases for pic, static, wl, etc.
>     if test "$GXX" = yes; then
> -@@ -14030,6 +14786,11 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -13409,6 +14161,11 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>   	  ;;
>   	esac
>   	;;
> @@ -9474,7 +9600,7 @@ index 8355c433c76..a49ab3d1f09 100755
>         dgux*)
>   	case $cc_basename in
>   	  ec++*)
> -@@ -14182,7 +14943,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -13561,7 +14318,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>   	;;
>         solaris*)
>   	case $cc_basename in
> @@ -9483,7 +9609,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   	    # Sun C++ 4.2, 5.x and Centerline C++
>   	    lt_prog_compiler_pic_CXX='-KPIC'
>   	    lt_prog_compiler_static_CXX='-Bstatic'
> -@@ -14247,10 +15008,17 @@ case $host_os in
> +@@ -13626,10 +14383,17 @@ case $host_os in
>       lt_prog_compiler_pic_CXX="$lt_prog_compiler_pic_CXX -DPIC"
>       ;;
>   esac
> @@ -9504,7 +9630,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   
>   #
>   # Check to make sure the PIC flag actually works.
> -@@ -14308,6 +15076,8 @@ fi
> +@@ -13687,6 +14451,8 @@ fi
>   
>   
>   
> @@ -9513,7 +9639,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   #
>   # Check to make sure the static flag actually works.
>   #
> -@@ -14485,6 +15255,7 @@ fi
> +@@ -13864,6 +14630,7 @@ fi
>   $as_echo_n "checking whether the $compiler linker ($LD) supports shared libraries... " >&6; }
>   
>     export_symbols_cmds_CXX='$NM $libobjs $convenience | $global_symbol_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
> @@ -9521,7 +9647,7 @@ index 8355c433c76..a49ab3d1f09 100755
>     case $host_os in
>     aix[4-9]*)
>       # If we're using GNU nm, then we don't want the "-C" option.
> -@@ -14499,15 +15270,20 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
> +@@ -13878,15 +14645,20 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
>       ;;
>     pw32*)
>       export_symbols_cmds_CXX="$ltdll_cmds"
> @@ -9547,7 +9673,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   
>   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ld_shlibs_CXX" >&5
>   $as_echo "$ld_shlibs_CXX" >&6; }
> -@@ -14770,8 +15546,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -14149,8 +14921,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>     need_version=no
>     need_lib_prefix=no
>   
> @@ -9559,7 +9685,7 @@ index 8355c433c76..a49ab3d1f09 100755
>       library_names_spec='$libname.dll.a'
>       # DLL is installed to $(libdir)/../bin by postinstall_cmds
>       postinstall_cmds='base_file=`basename \${file}`~
> -@@ -14803,13 +15580,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -14182,13 +14955,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>         library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>         ;;
>       esac
> @@ -9632,7 +9758,7 @@ index 8355c433c76..a49ab3d1f09 100755
>     # FIXME: first we should search . and the directory the executable is in
>     shlibpath_var=PATH
>     ;;
> -@@ -14890,7 +15725,7 @@ haiku*)
> +@@ -14269,7 +15100,7 @@ haiku*)
>     soname_spec='${libname}${release}${shared_ext}$major'
>     shlibpath_var=LIBRARY_PATH
>     shlibpath_overrides_runpath=yes
> @@ -9641,7 +9767,7 @@ index 8355c433c76..a49ab3d1f09 100755
>     hardcode_into_libs=yes
>     ;;
>   
> -@@ -15349,6 +16184,7 @@ fi
> +@@ -14728,6 +15559,7 @@ fi
>     fi # test -n "$compiler"
>   
>     CC=$lt_save_CC
> @@ -9649,7 +9775,7 @@ index 8355c433c76..a49ab3d1f09 100755
>     LDCXX=$LD
>     LD=$lt_save_LD
>     GCC=$lt_save_GCC
> -@@ -18612,13 +19448,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
> +@@ -17770,13 +18602,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
>   lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>   lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>   lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -9670,7 +9796,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>   RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>   old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
> -@@ -18633,14 +19476,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
> +@@ -17791,14 +18630,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
>   lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
> @@ -9689,7 +9815,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>   NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>   LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -18673,12 +19519,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
> +@@ -17831,12 +18673,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
>   hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
>   inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
>   link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
> @@ -9703,7 +9829,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
>   variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
>   need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
> -@@ -18717,8 +19563,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archive_cmds_CXX" | $SED "$delay_single_quote
> +@@ -17875,8 +18717,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archive_cmds_CXX" | $SED "$delay_single_quote
>   compiler_CXX='`$ECHO "$compiler_CXX" | $SED "$delay_single_quote_subst"`'
>   GCC_CXX='`$ECHO "$GCC_CXX" | $SED "$delay_single_quote_subst"`'
>   lt_prog_compiler_no_builtin_flag_CXX='`$ECHO "$lt_prog_compiler_no_builtin_flag_CXX" | $SED "$delay_single_quote_subst"`'
> @@ -9713,7 +9839,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   lt_prog_compiler_static_CXX='`$ECHO "$lt_prog_compiler_static_CXX" | $SED "$delay_single_quote_subst"`'
>   lt_cv_prog_compiler_c_o_CXX='`$ECHO "$lt_cv_prog_compiler_c_o_CXX" | $SED "$delay_single_quote_subst"`'
>   archive_cmds_need_lc_CXX='`$ECHO "$archive_cmds_need_lc_CXX" | $SED "$delay_single_quote_subst"`'
> -@@ -18745,12 +19591,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$hardcode_shlibpath_var_CXX" | $SED "$delay_
> +@@ -17903,12 +18745,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$hardcode_shlibpath_var_CXX" | $SED "$delay_
>   hardcode_automatic_CXX='`$ECHO "$hardcode_automatic_CXX" | $SED "$delay_single_quote_subst"`'
>   inherit_rpath_CXX='`$ECHO "$inherit_rpath_CXX" | $SED "$delay_single_quote_subst"`'
>   link_all_deplibs_CXX='`$ECHO "$link_all_deplibs_CXX" | $SED "$delay_single_quote_subst"`'
> @@ -9727,7 +9853,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   file_list_spec_CXX='`$ECHO "$file_list_spec_CXX" | $SED "$delay_single_quote_subst"`'
>   hardcode_action_CXX='`$ECHO "$hardcode_action_CXX" | $SED "$delay_single_quote_subst"`'
>   compiler_lib_search_dirs_CXX='`$ECHO "$compiler_lib_search_dirs_CXX" | $SED "$delay_single_quote_subst"`'
> -@@ -18788,8 +19634,13 @@ reload_flag \
> +@@ -17946,8 +18788,13 @@ reload_flag \
>   OBJDUMP \
>   deplibs_check_method \
>   file_magic_cmd \
> @@ -9741,7 +9867,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   STRIP \
>   RANLIB \
>   CC \
> -@@ -18799,12 +19650,14 @@ lt_cv_sys_global_symbol_pipe \
> +@@ -17957,12 +18804,14 @@ lt_cv_sys_global_symbol_pipe \
>   lt_cv_sys_global_symbol_to_cdecl \
>   lt_cv_sys_global_symbol_to_c_name_address \
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -9757,7 +9883,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   DSYMUTIL \
>   NMEDIT \
>   LIPO \
> -@@ -18820,7 +19673,6 @@ no_undefined_flag \
> +@@ -17978,7 +18827,6 @@ no_undefined_flag \
>   hardcode_libdir_flag_spec \
>   hardcode_libdir_flag_spec_ld \
>   hardcode_libdir_separator \
> @@ -9765,7 +9891,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   exclude_expsyms \
>   include_expsyms \
>   file_list_spec \
> -@@ -18842,8 +19694,8 @@ LD_CXX \
> +@@ -18000,8 +18848,8 @@ LD_CXX \
>   reload_flag_CXX \
>   compiler_CXX \
>   lt_prog_compiler_no_builtin_flag_CXX \
> @@ -9775,7 +9901,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   lt_prog_compiler_static_CXX \
>   lt_cv_prog_compiler_c_o_CXX \
>   export_dynamic_flag_spec_CXX \
> -@@ -18855,7 +19707,6 @@ no_undefined_flag_CXX \
> +@@ -18013,7 +18861,6 @@ no_undefined_flag_CXX \
>   hardcode_libdir_flag_spec_CXX \
>   hardcode_libdir_flag_spec_ld_CXX \
>   hardcode_libdir_separator_CXX \
> @@ -9783,7 +9909,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   exclude_expsyms_CXX \
>   include_expsyms_CXX \
>   file_list_spec_CXX \
> -@@ -18889,6 +19740,7 @@ module_cmds \
> +@@ -18047,6 +18894,7 @@ module_cmds \
>   module_expsym_cmds \
>   export_symbols_cmds \
>   prelink_cmds \
> @@ -9791,7 +9917,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   postinstall_cmds \
>   postuninstall_cmds \
>   finish_cmds \
> -@@ -18903,7 +19755,8 @@ archive_expsym_cmds_CXX \
> +@@ -18061,7 +18909,8 @@ archive_expsym_cmds_CXX \
>   module_cmds_CXX \
>   module_expsym_cmds_CXX \
>   export_symbols_cmds_CXX \
> @@ -9801,7 +9927,7 @@ index 8355c433c76..a49ab3d1f09 100755
>       case \`eval \\\\\$ECHO \\\\""\\\\\$\$var"\\\\"\` in
>       *[\\\\\\\`\\"\\\$]*)
>         eval "lt_\$var=\\\\\\"\\\`\\\$ECHO \\"\\\$\$var\\" | \\\$SED -e \\"\\\$double_quote_subst\\" -e \\"\\\$sed_quote_subst\\" -e \\"\\\$delay_variable_subst\\"\\\`\\\\\\""
> -@@ -19668,7 +20521,8 @@ $as_echo X"$file" |
> +@@ -18826,7 +19675,8 @@ $as_echo X"$file" |
>   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>   #
>   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -9811,7 +9937,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   #   Written by Gordon Matzigkeit, 1996
>   #
>   #   This file is part of GNU Libtool.
> -@@ -19771,19 +20625,42 @@ SP2NL=$lt_lt_SP2NL
> +@@ -18929,19 +19779,42 @@ SP2NL=$lt_lt_SP2NL
>   # turn newlines into spaces.
>   NL2SP=$lt_lt_NL2SP
>   
> @@ -9855,7 +9981,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   # A symbol stripping program.
>   STRIP=$lt_STRIP
>   
> -@@ -19813,6 +20690,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
> +@@ -18971,6 +19844,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
>   # Transform the output of nm in a C name address pair when lib prefix is needed.
>   global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
>   
> @@ -9868,7 +9994,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   # The name of the directory that contains temporary libtool files.
>   objdir=$objdir
>   
> -@@ -19822,6 +20705,9 @@ MAGIC_CMD=$MAGIC_CMD
> +@@ -18980,6 +19859,9 @@ MAGIC_CMD=$MAGIC_CMD
>   # Must we lock files when doing compilation?
>   need_locks=$lt_need_locks
>   
> @@ -9878,7 +10004,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>   DSYMUTIL=$lt_DSYMUTIL
>   
> -@@ -19936,12 +20822,12 @@ with_gcc=$GCC
> +@@ -19094,12 +19976,12 @@ with_gcc=$GCC
>   # Compiler flag to turn off builtin functions.
>   no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
>   
> @@ -9894,7 +10020,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   # Compiler flag to prevent dynamic linking.
>   link_static_flag=$lt_lt_prog_compiler_static
>   
> -@@ -20028,9 +20914,6 @@ inherit_rpath=$inherit_rpath
> +@@ -19186,9 +20068,6 @@ inherit_rpath=$inherit_rpath
>   # Whether libtool must link a program against all its dependency libraries.
>   link_all_deplibs=$link_all_deplibs
>   
> @@ -9904,7 +10030,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   # Set to "yes" if exported symbols are required.
>   always_export_symbols=$always_export_symbols
>   
> -@@ -20046,6 +20929,9 @@ include_expsyms=$lt_include_expsyms
> +@@ -19204,6 +20083,9 @@ include_expsyms=$lt_include_expsyms
>   # Commands necessary for linking programs (against libraries) with templates.
>   prelink_cmds=$lt_prelink_cmds
>   
> @@ -9914,7 +10040,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   # Specify filename containing input files.
>   file_list_spec=$lt_file_list_spec
>   
> -@@ -20092,210 +20978,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
> +@@ -19250,210 +20132,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
>     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>     # text mode, it properly converts lines to CR/LF.  This bash problem
>     # is reportedly fixed, but why not run on old versions too?
> @@ -10288,7 +10414,7 @@ index 8355c433c76..a49ab3d1f09 100755
>       (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
>     chmod +x "$ofile"
>   
> -@@ -20323,12 +21168,12 @@ with_gcc=$GCC_CXX
> +@@ -19481,12 +20322,12 @@ with_gcc=$GCC_CXX
>   # Compiler flag to turn off builtin functions.
>   no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag_CXX
>   
> @@ -10304,7 +10430,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   # Compiler flag to prevent dynamic linking.
>   link_static_flag=$lt_lt_prog_compiler_static_CXX
>   
> -@@ -20415,9 +21260,6 @@ inherit_rpath=$inherit_rpath_CXX
> +@@ -19573,9 +20414,6 @@ inherit_rpath=$inherit_rpath_CXX
>   # Whether libtool must link a program against all its dependency libraries.
>   link_all_deplibs=$link_all_deplibs_CXX
>   
> @@ -10314,7 +10440,7 @@ index 8355c433c76..a49ab3d1f09 100755
>   # Set to "yes" if exported symbols are required.
>   always_export_symbols=$always_export_symbols_CXX
>   
> -@@ -20433,6 +21275,9 @@ include_expsyms=$lt_include_expsyms_CXX
> +@@ -19591,6 +20429,9 @@ include_expsyms=$lt_include_expsyms_CXX
>   # Commands necessary for linking programs (against libraries) with templates.
>   prelink_cmds=$lt_prelink_cmds_CXX
>   
> @@ -10325,10 +10451,10 @@ index 8355c433c76..a49ab3d1f09 100755
>   file_list_spec=$lt_file_list_spec_CXX
>   
>  diff --git a/libctf/configure b/libctf/configure
> -index 6b294bfebfb..52a025bb848 100755
> +index 82bcf13a606..a7fb723a145 100755
>  --- a/libctf/configure
>  +++ b/libctf/configure
> -@@ -663,6 +663,8 @@ OTOOL
> +@@ -666,6 +666,8 @@ OTOOL
>   LIPO
>   NMEDIT
>   DSYMUTIL
> @@ -10337,7 +10463,7 @@ index 6b294bfebfb..52a025bb848 100755
>   OBJDUMP
>   LN_S
>   NM
> -@@ -790,6 +792,7 @@ enable_static
> +@@ -797,6 +799,7 @@ enable_static
>   with_pic
>   enable_fast_install
>   with_gnu_ld
> @@ -10345,7 +10471,7 @@ index 6b294bfebfb..52a025bb848 100755
>   enable_libtool_lock
>   enable_largefile
>   enable_werror_always
> -@@ -1452,6 +1455,8 @@ Optional Packages:
> +@@ -1460,6 +1463,8 @@ Optional Packages:
>     --with-pic              try to use only PIC/non-PIC objects [default=use
>                             both]
>     --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
> @@ -10354,7 +10480,7 @@ index 6b294bfebfb..52a025bb848 100755
>     --with-system-zlib      use installed libz
>   
>   Some influential environment variables:
> -@@ -5411,8 +5416,8 @@ esac
> +@@ -5529,8 +5534,8 @@ esac
>   
>   
>   
> @@ -10365,7 +10491,7 @@ index 6b294bfebfb..52a025bb848 100755
>   
>   
>   
> -@@ -5523,7 +5528,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> +@@ -5570,7 +5575,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
>   $as_echo_n "checking how to print strings... " >&6; }
>   # Test print first, because it will be a builtin if present.
> @@ -10374,7 +10500,7 @@ index 6b294bfebfb..52a025bb848 100755
>      test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
>     ECHO='print -r --'
>   elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
> -@@ -6209,8 +6214,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
> +@@ -6256,8 +6261,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
>   # Try some XSI features
>   xsi_shell=no
>   ( _lt_dummy="a/b/c"
> @@ -10385,7 +10511,7 @@ index 6b294bfebfb..52a025bb848 100755
>       && eval 'test $(( 1 + 1 )) -eq 2 \
>       && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
>     && xsi_shell=yes
> -@@ -6259,6 +6264,80 @@ esac
> +@@ -6306,6 +6311,80 @@ esac
>   
>   
>   
> @@ -10466,7 +10592,7 @@ index 6b294bfebfb..52a025bb848 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
>   $as_echo_n "checking for $LD option to reload object files... " >&6; }
>   if ${lt_cv_ld_reload_flag+:} false; then :
> -@@ -6275,6 +6354,11 @@ case $reload_flag in
> +@@ -6322,6 +6401,11 @@ case $reload_flag in
>   esac
>   reload_cmds='$LD$reload_flag -o $output$reload_objs'
>   case $host_os in
> @@ -10478,7 +10604,7 @@ index 6b294bfebfb..52a025bb848 100755
>     darwin*)
>       if test "$GCC" = yes; then
>         reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
> -@@ -6443,7 +6527,8 @@ mingw* | pw32*)
> +@@ -6490,7 +6574,8 @@ mingw* | pw32*)
>       lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
>       lt_cv_file_magic_cmd='func_win32_libid'
>     else
> @@ -10488,7 +10614,7 @@ index 6b294bfebfb..52a025bb848 100755
>       lt_cv_file_magic_cmd='$OBJDUMP -f'
>     fi
>     ;;
> -@@ -6597,6 +6682,21 @@ esac
> +@@ -6644,6 +6729,21 @@ esac
>   fi
>   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
>   $as_echo "$lt_cv_deplibs_check_method" >&6; }
> @@ -10510,7 +10636,7 @@ index 6b294bfebfb..52a025bb848 100755
>   file_magic_cmd=$lt_cv_file_magic_cmd
>   deplibs_check_method=$lt_cv_deplibs_check_method
>   test -z "$deplibs_check_method" && deplibs_check_method=unknown
> -@@ -6612,9 +6712,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
> +@@ -6659,6 +6759,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
>   
>   
>   
> @@ -10665,6 +10791,12 @@ index 6b294bfebfb..52a025bb848 100755
>  +
>  +
>  +
> + plugin_option=
> + plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
> + for plugin in $plugin_names; do
> +@@ -6673,8 +6924,10 @@ for plugin in $plugin_names; do
> + done
> + 
>   if test -n "$ac_tool_prefix"; then
>  -  # Extract the first word of "${ac_tool_prefix}ar", so it can be a program name with args.
>  -set dummy ${ac_tool_prefix}ar; ac_word=$2
> @@ -10675,7 +10807,7 @@ index 6b294bfebfb..52a025bb848 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_AR+:} false; then :
> -@@ -6630,7 +6883,7 @@ do
> +@@ -6690,7 +6943,7 @@ do
>     test -z "$as_dir" && as_dir=.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -10684,7 +10816,7 @@ index 6b294bfebfb..52a025bb848 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -6650,11 +6903,15 @@ $as_echo "no" >&6; }
> +@@ -6710,11 +6963,15 @@ $as_echo "no" >&6; }
>   fi
>   
>   
> @@ -10703,7 +10835,7 @@ index 6b294bfebfb..52a025bb848 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_ac_ct_AR+:} false; then :
> -@@ -6670,7 +6927,7 @@ do
> +@@ -6730,7 +6987,7 @@ do
>     test -z "$as_dir" && as_dir=.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -10712,7 +10844,7 @@ index 6b294bfebfb..52a025bb848 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -6689,6 +6946,10 @@ else
> +@@ -6749,6 +7006,10 @@ else
>   $as_echo "no" >&6; }
>   fi
>   
> @@ -10723,7 +10855,7 @@ index 6b294bfebfb..52a025bb848 100755
>     if test "x$ac_ct_AR" = x; then
>       AR="false"
>     else
> -@@ -6700,16 +6961,72 @@ ac_tool_warned=yes ;;
> +@@ -6760,25 +7021,19 @@ ac_tool_warned=yes ;;
>   esac
>       AR=$ac_ct_AR
>     fi
> @@ -10732,20 +10864,36 @@ index 6b294bfebfb..52a025bb848 100755
>   fi
>   
>  -test -z "$AR" && AR=ar
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
>  -test -z "$AR_FLAGS" && AR_FLAGS=cru
> ++  rm -f conftest.*
>  +: ${AR=ar}
>  +: ${AR_FLAGS=cru}
> -+
> -+
> -+
> -+
> -+
> -+
> -+
> -+
> -+
> -+
> -+
> + 
> + 
> + 
> +@@ -6790,6 +7045,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
> + 
> + 
> + 
>  +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE support" >&5
>  +$as_echo_n "checking for archiver @FILE support... " >&6; }
>  +if ${lt_cv_ar_at_file+:} false; then :
> @@ -10758,7 +10906,7 @@ index 6b294bfebfb..52a025bb848 100755
>  +int
>  +main ()
>  +{
> - 
> ++
>  +  ;
>  +  return 0;
>  +}
> @@ -10784,23 +10932,30 @@ index 6b294bfebfb..52a025bb848 100755
>  +        fi
>  +      fi
>  +      rm -f conftest.* libconftest.a
> - 
> ++
>  +fi
>  +rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
> - 
> ++
>  +fi
>  +{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_ar_at_file" >&5
>  +$as_echo "$lt_cv_ar_at_file" >&6; }
> - 
> ++
>  +if test "x$lt_cv_ar_at_file" = xno; then
>  +  archiver_list_spec=
>  +else
>  +  archiver_list_spec=$lt_cv_ar_at_file
>  +fi
> - 
> - 
> - 
> -@@ -7051,8 +7368,8 @@ esac
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
> +@@ -7129,8 +7442,8 @@ esac
>   lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
>   
>   # Transform an extracted symbol line into symbol name and symbol address
> @@ -10811,7 +10966,7 @@ index 6b294bfebfb..52a025bb848 100755
>   
>   # Handle CRLF in mingw tool chain
>   opt_cr=
> -@@ -7088,6 +7405,7 @@ for ac_symprfx in "" "_"; do
> +@@ -7166,6 +7479,7 @@ for ac_symprfx in "" "_"; do
>     else
>       lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
>     fi
> @@ -10819,7 +10974,7 @@ index 6b294bfebfb..52a025bb848 100755
>   
>     # Check to see that the pipe works correctly.
>     pipe_works=no
> -@@ -7129,6 +7447,18 @@ _LT_EOF
> +@@ -7207,6 +7521,18 @@ _LT_EOF
>         if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
>   	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
>   	  cat <<_LT_EOF > conftest.$ac_ext
> @@ -10838,7 +10993,7 @@ index 6b294bfebfb..52a025bb848 100755
>   #ifdef __cplusplus
>   extern "C" {
>   #endif
> -@@ -7140,7 +7470,7 @@ _LT_EOF
> +@@ -7218,7 +7544,7 @@ _LT_EOF
>   	  cat <<_LT_EOF >> conftest.$ac_ext
>   
>   /* The mapping between symbol names and symbols.  */
> @@ -10847,7 +11002,7 @@ index 6b294bfebfb..52a025bb848 100755
>     const char *name;
>     void       *address;
>   }
> -@@ -7166,8 +7496,8 @@ static const void *lt_preloaded_setup() {
> +@@ -7244,8 +7570,8 @@ static const void *lt_preloaded_setup() {
>   _LT_EOF
>   	  # Now try linking the two files.
>   	  mv conftest.$ac_objext conftstm.$ac_objext
> @@ -10858,7 +11013,7 @@ index 6b294bfebfb..52a025bb848 100755
>   	  LIBS="conftstm.$ac_objext"
>   	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
>   	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
> -@@ -7177,8 +7507,8 @@ _LT_EOF
> +@@ -7255,8 +7581,8 @@ _LT_EOF
>     test $ac_status = 0; } && test -s conftest${ac_exeext}; then
>   	    pipe_works=yes
>   	  fi
> @@ -10869,7 +11024,7 @@ index 6b294bfebfb..52a025bb848 100755
>   	else
>   	  echo "cannot find nm_test_func in $nlist" >&5
>   	fi
> -@@ -7215,6 +7545,16 @@ else
> +@@ -7293,6 +7619,14 @@ else
>   $as_echo "ok" >&6; }
>   fi
>   
> @@ -10881,12 +11036,10 @@ index 6b294bfebfb..52a025bb848 100755
>  +fi
>  +
>  +
> -+
> -+
>   
>   
>   
> -@@ -7231,6 +7571,45 @@ fi
> +@@ -7311,6 +7645,47 @@ fi
>   
>   
>   
> @@ -10929,10 +11082,12 @@ index 6b294bfebfb..52a025bb848 100755
>  +
>  + { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
>  +$as_echo "${lt_sysroot:-no}" >&6; }
> ++
> ++
>   
>   
>   
> -@@ -7442,6 +7821,123 @@ esac
> +@@ -7520,6 +7895,123 @@ esac
>   
>   need_locks="$enable_libtool_lock"
>   
> @@ -11056,7 +11211,7 @@ index 6b294bfebfb..52a025bb848 100755
>   
>     case $host_os in
>       rhapsody* | darwin*)
> -@@ -8005,6 +8501,8 @@ _LT_EOF
> +@@ -8083,6 +8575,8 @@ _LT_EOF
>         $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
>         echo "$AR cru libconftest.a conftest.o" >&5
>         $AR cru libconftest.a conftest.o 2>&5
> @@ -11065,7 +11220,7 @@ index 6b294bfebfb..52a025bb848 100755
>         cat > conftest.c << _LT_EOF
>   int main() { return 0;}
>   _LT_EOF
> -@@ -8170,7 +8668,8 @@ fi
> +@@ -8248,7 +8742,8 @@ fi
>   LIBTOOL_DEPS="$ltmain"
>   
>   # Always use our own libtool.
> @@ -11075,7 +11230,7 @@ index 6b294bfebfb..52a025bb848 100755
>   
>   
>   
> -@@ -8259,7 +8758,7 @@ aix3*)
> +@@ -8337,7 +8832,7 @@ aix3*)
>   esac
>   
>   # Global variables:
> @@ -11084,7 +11239,7 @@ index 6b294bfebfb..52a025bb848 100755
>   can_build_shared=yes
>   
>   # All known linkers require a `.a' archive for static linking (except MSVC,
> -@@ -8557,8 +9056,6 @@ fi
> +@@ -8635,8 +9130,6 @@ fi
>   lt_prog_compiler_pic=
>   lt_prog_compiler_static=
>   
> @@ -11093,7 +11248,7 @@ index 6b294bfebfb..52a025bb848 100755
>   
>     if test "$GCC" = yes; then
>       lt_prog_compiler_wl='-Wl,'
> -@@ -8724,6 +9221,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -8802,6 +9295,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>   	lt_prog_compiler_pic='--shared'
>   	lt_prog_compiler_static='--static'
>   	;;
> @@ -11106,7 +11261,7 @@ index 6b294bfebfb..52a025bb848 100755
>         pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
>           # Portland Group compilers (*not* the Pentium gcc compiler,
>   	# which looks to be a dead project)
> -@@ -8786,7 +9289,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -8864,7 +9363,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>         lt_prog_compiler_pic='-KPIC'
>         lt_prog_compiler_static='-Bstatic'
>         case $cc_basename in
> @@ -11115,7 +11270,7 @@ index 6b294bfebfb..52a025bb848 100755
>   	lt_prog_compiler_wl='-Qoption ld ';;
>         *)
>   	lt_prog_compiler_wl='-Wl,';;
> -@@ -8843,13 +9346,17 @@ case $host_os in
> +@@ -8921,13 +9420,17 @@ case $host_os in
>       lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
>       ;;
>   esac
> @@ -11139,7 +11294,7 @@ index 6b294bfebfb..52a025bb848 100755
>   
>   #
>   # Check to make sure the PIC flag actually works.
> -@@ -8910,6 +9417,11 @@ fi
> +@@ -8988,6 +9491,11 @@ fi
>   
>   
>   
> @@ -11151,7 +11306,7 @@ index 6b294bfebfb..52a025bb848 100755
>   #
>   # Check to make sure the static flag actually works.
>   #
> -@@ -9260,7 +9772,8 @@ _LT_EOF
> +@@ -9338,7 +9846,8 @@ _LT_EOF
>         allow_undefined_flag=unsupported
>         always_export_symbols=no
>         enable_shared_with_static_runtimes=yes
> @@ -11161,7 +11316,7 @@ index 6b294bfebfb..52a025bb848 100755
>   
>         if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
>           archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
> -@@ -9359,12 +9872,12 @@ _LT_EOF
> +@@ -9437,12 +9946,12 @@ _LT_EOF
>   	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
>   	  hardcode_libdir_flag_spec=
>   	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
> @@ -11176,7 +11331,7 @@ index 6b294bfebfb..52a025bb848 100755
>   	  fi
>   	  ;;
>   	esac
> -@@ -9378,8 +9891,8 @@ _LT_EOF
> +@@ -9456,8 +9965,8 @@ _LT_EOF
>   	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
>   	wlarc=
>         else
> @@ -11187,7 +11342,7 @@ index 6b294bfebfb..52a025bb848 100755
>         fi
>         ;;
>   
> -@@ -9397,8 +9910,8 @@ _LT_EOF
> +@@ -9475,8 +9984,8 @@ _LT_EOF
>   
>   _LT_EOF
>         elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -11198,7 +11353,7 @@ index 6b294bfebfb..52a025bb848 100755
>         else
>   	ld_shlibs=no
>         fi
> -@@ -9444,8 +9957,8 @@ _LT_EOF
> +@@ -9522,8 +10031,8 @@ _LT_EOF
>   
>       *)
>         if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -11209,7 +11364,7 @@ index 6b294bfebfb..52a025bb848 100755
>         else
>   	ld_shlibs=no
>         fi
> -@@ -9575,7 +10088,13 @@ _LT_EOF
> +@@ -9653,7 +10162,13 @@ _LT_EOF
>   	allow_undefined_flag='-berok'
>           # Determine the default libpath from the value encoded in an
>           # empty executable.
> @@ -11224,7 +11379,7 @@ index 6b294bfebfb..52a025bb848 100755
>   /* end confdefs.h.  */
>   
>   int
> -@@ -9588,22 +10107,29 @@ main ()
> +@@ -9666,22 +10181,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>   
> @@ -11267,7 +11422,7 @@ index 6b294bfebfb..52a025bb848 100755
>   
>           hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>           archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> -@@ -9615,7 +10141,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9693,7 +10215,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	else
>   	 # Determine the default libpath from the value encoded in an
>   	 # empty executable.
> @@ -11282,7 +11437,7 @@ index 6b294bfebfb..52a025bb848 100755
>   /* end confdefs.h.  */
>   
>   int
> -@@ -9628,22 +10160,29 @@ main ()
> +@@ -9706,22 +10234,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>   
> @@ -11325,7 +11480,7 @@ index 6b294bfebfb..52a025bb848 100755
>   
>   	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>   	  # Warning - without using the other run time loading flags,
> -@@ -9688,20 +10227,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9766,20 +10301,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>         # Microsoft Visual C++.
>         # hardcode_libdir_flag_spec is actually meaningless, as there is
>         # no search path for DLLs.
> @@ -11403,7 +11558,7 @@ index 6b294bfebfb..52a025bb848 100755
>         ;;
>   
>       darwin* | rhapsody*)
> -@@ -9762,7 +10344,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9840,7 +10418,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
>       freebsd* | dragonfly*)
> @@ -11412,7 +11567,7 @@ index 6b294bfebfb..52a025bb848 100755
>         hardcode_libdir_flag_spec='-R$libdir'
>         hardcode_direct=yes
>         hardcode_shlibpath_var=no
> -@@ -9770,7 +10352,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9848,7 +10426,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       hpux9*)
>         if test "$GCC" = yes; then
> @@ -11421,7 +11576,7 @@ index 6b294bfebfb..52a025bb848 100755
>         else
>   	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
>         fi
> -@@ -9786,7 +10368,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9864,7 +10442,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       hpux10*)
>         if test "$GCC" = yes && test "$with_gnu_ld" = no; then
> @@ -11430,7 +11585,7 @@ index 6b294bfebfb..52a025bb848 100755
>         else
>   	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
>         fi
> -@@ -9810,10 +10392,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9888,10 +10466,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
>   	  ;;
>   	ia64*)
> @@ -11443,7 +11598,7 @@ index 6b294bfebfb..52a025bb848 100755
>   	  ;;
>   	esac
>         else
> -@@ -9892,23 +10474,36 @@ fi
> +@@ -9970,23 +10548,36 @@ fi
>   
>       irix5* | irix6* | nonstopux*)
>         if test "$GCC" = yes; then
> @@ -11488,7 +11643,7 @@ index 6b294bfebfb..52a025bb848 100755
>         else
>   	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
>   	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
> -@@ -9993,7 +10588,7 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -10071,7 +10662,7 @@ rm -f core conftest.err conftest.$ac_objext \
>       osf4* | osf5*)	# as osf3* with the addition of -msym flag
>         if test "$GCC" = yes; then
>   	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
> @@ -11497,7 +11652,7 @@ index 6b294bfebfb..52a025bb848 100755
>   	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
>         else
>   	allow_undefined_flag=' -expect_unresolved \*'
> -@@ -10012,9 +10607,9 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -10090,9 +10681,9 @@ rm -f core conftest.err conftest.$ac_objext \
>         no_undefined_flag=' -z defs'
>         if test "$GCC" = yes; then
>   	wlarc='${wl}'
> @@ -11509,7 +11664,7 @@ index 6b294bfebfb..52a025bb848 100755
>         else
>   	case `$CC -V 2>&1` in
>   	*"Compilers 5.0"*)
> -@@ -10590,8 +11185,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -10668,8 +11259,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>     need_version=no
>     need_lib_prefix=no
>   
> @@ -11521,7 +11676,7 @@ index 6b294bfebfb..52a025bb848 100755
>       library_names_spec='$libname.dll.a'
>       # DLL is installed to $(libdir)/../bin by postinstall_cmds
>       postinstall_cmds='base_file=`basename \${file}`~
> -@@ -10624,13 +11220,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -10702,13 +11294,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>         library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>         ;;
>       esac
> @@ -11594,7 +11749,7 @@ index 6b294bfebfb..52a025bb848 100755
>     # FIXME: first we should search . and the directory the executable is in
>     shlibpath_var=PATH
>     ;;
> -@@ -10712,7 +11366,7 @@ haiku*)
> +@@ -10790,7 +11440,7 @@ haiku*)
>     soname_spec='${libname}${release}${shared_ext}$major'
>     shlibpath_var=LIBRARY_PATH
>     shlibpath_overrides_runpath=yes
> @@ -11603,16 +11758,16 @@ index 6b294bfebfb..52a025bb848 100755
>     hardcode_into_libs=yes
>     ;;
>   
> -@@ -11508,7 +12162,7 @@ else
> +@@ -11586,7 +12236,7 @@ else
>     lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>     lt_status=$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 11511 "configure"
> +-#line 11589 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>   
>   #if HAVE_DLFCN_H
> -@@ -11552,10 +12206,10 @@ else
> +@@ -11630,10 +12280,10 @@ else
>   /* When -fvisbility=hidden is used, assume the code has been annotated
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -11625,16 +11780,16 @@ index 6b294bfebfb..52a025bb848 100755
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -11614,7 +12268,7 @@ else
> +@@ -11692,7 +12342,7 @@ else
>     lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>     lt_status=$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 11617 "configure"
> +-#line 11695 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>   
>   #if HAVE_DLFCN_H
> -@@ -11658,10 +12312,10 @@ else
> +@@ -11736,10 +12386,10 @@ else
>   /* When -fvisbility=hidden is used, assume the code has been annotated
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -11647,7 +11802,7 @@ index 6b294bfebfb..52a025bb848 100755
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -14136,13 +14790,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
> +@@ -14286,13 +14936,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
>   lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>   lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>   lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -11668,7 +11823,7 @@ index 6b294bfebfb..52a025bb848 100755
>   STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>   RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>   old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
> -@@ -14157,14 +14818,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
> +@@ -14307,14 +14964,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
>   lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
> @@ -11687,7 +11842,7 @@ index 6b294bfebfb..52a025bb848 100755
>   DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>   NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>   LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -14197,12 +14861,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
> +@@ -14347,12 +15007,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
>   hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
>   inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
>   link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
> @@ -11701,7 +11856,7 @@ index 6b294bfebfb..52a025bb848 100755
>   file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
>   variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
>   need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
> -@@ -14257,8 +14921,13 @@ reload_flag \
> +@@ -14407,8 +15067,13 @@ reload_flag \
>   OBJDUMP \
>   deplibs_check_method \
>   file_magic_cmd \
> @@ -11715,7 +11870,7 @@ index 6b294bfebfb..52a025bb848 100755
>   STRIP \
>   RANLIB \
>   CC \
> -@@ -14268,12 +14937,14 @@ lt_cv_sys_global_symbol_pipe \
> +@@ -14418,12 +15083,14 @@ lt_cv_sys_global_symbol_pipe \
>   lt_cv_sys_global_symbol_to_cdecl \
>   lt_cv_sys_global_symbol_to_c_name_address \
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -11731,7 +11886,7 @@ index 6b294bfebfb..52a025bb848 100755
>   DSYMUTIL \
>   NMEDIT \
>   LIPO \
> -@@ -14289,7 +14960,6 @@ no_undefined_flag \
> +@@ -14439,7 +15106,6 @@ no_undefined_flag \
>   hardcode_libdir_flag_spec \
>   hardcode_libdir_flag_spec_ld \
>   hardcode_libdir_separator \
> @@ -11739,7 +11894,7 @@ index 6b294bfebfb..52a025bb848 100755
>   exclude_expsyms \
>   include_expsyms \
>   file_list_spec \
> -@@ -14325,6 +14995,7 @@ module_cmds \
> +@@ -14475,6 +15141,7 @@ module_cmds \
>   module_expsym_cmds \
>   export_symbols_cmds \
>   prelink_cmds \
> @@ -11747,7 +11902,7 @@ index 6b294bfebfb..52a025bb848 100755
>   postinstall_cmds \
>   postuninstall_cmds \
>   finish_cmds \
> -@@ -15081,7 +15752,8 @@ $as_echo X"$file" |
> +@@ -15231,7 +15898,8 @@ $as_echo X"$file" |
>   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>   #
>   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -11757,7 +11912,7 @@ index 6b294bfebfb..52a025bb848 100755
>   #   Written by Gordon Matzigkeit, 1996
>   #
>   #   This file is part of GNU Libtool.
> -@@ -15184,19 +15856,42 @@ SP2NL=$lt_lt_SP2NL
> +@@ -15334,19 +16002,42 @@ SP2NL=$lt_lt_SP2NL
>   # turn newlines into spaces.
>   NL2SP=$lt_lt_NL2SP
>   
> @@ -11801,7 +11956,7 @@ index 6b294bfebfb..52a025bb848 100755
>   # A symbol stripping program.
>   STRIP=$lt_STRIP
>   
> -@@ -15226,6 +15921,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
> +@@ -15376,6 +16067,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
>   # Transform the output of nm in a C name address pair when lib prefix is needed.
>   global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
>   
> @@ -11814,7 +11969,7 @@ index 6b294bfebfb..52a025bb848 100755
>   # The name of the directory that contains temporary libtool files.
>   objdir=$objdir
>   
> -@@ -15235,6 +15936,9 @@ MAGIC_CMD=$MAGIC_CMD
> +@@ -15385,6 +16082,9 @@ MAGIC_CMD=$MAGIC_CMD
>   # Must we lock files when doing compilation?
>   need_locks=$lt_need_locks
>   
> @@ -11824,7 +11979,7 @@ index 6b294bfebfb..52a025bb848 100755
>   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>   DSYMUTIL=$lt_DSYMUTIL
>   
> -@@ -15349,12 +16053,12 @@ with_gcc=$GCC
> +@@ -15499,12 +16199,12 @@ with_gcc=$GCC
>   # Compiler flag to turn off builtin functions.
>   no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
>   
> @@ -11840,7 +11995,7 @@ index 6b294bfebfb..52a025bb848 100755
>   # Compiler flag to prevent dynamic linking.
>   link_static_flag=$lt_lt_prog_compiler_static
>   
> -@@ -15441,9 +16145,6 @@ inherit_rpath=$inherit_rpath
> +@@ -15591,9 +16291,6 @@ inherit_rpath=$inherit_rpath
>   # Whether libtool must link a program against all its dependency libraries.
>   link_all_deplibs=$link_all_deplibs
>   
> @@ -11850,7 +12005,7 @@ index 6b294bfebfb..52a025bb848 100755
>   # Set to "yes" if exported symbols are required.
>   always_export_symbols=$always_export_symbols
>   
> -@@ -15459,6 +16160,9 @@ include_expsyms=$lt_include_expsyms
> +@@ -15609,6 +16306,9 @@ include_expsyms=$lt_include_expsyms
>   # Commands necessary for linking programs (against libraries) with templates.
>   prelink_cmds=$lt_prelink_cmds
>   
> @@ -11860,7 +12015,7 @@ index 6b294bfebfb..52a025bb848 100755
>   # Specify filename containing input files.
>   file_list_spec=$lt_file_list_spec
>   
> -@@ -15491,210 +16195,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
> +@@ -15641,210 +16341,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
>     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>     # text mode, it properly converts lines to CR/LF.  This bash problem
>     # is reportedly fixed, but why not run on old versions too?
> @@ -12235,7 +12390,7 @@ index 6b294bfebfb..52a025bb848 100755
>     chmod +x "$ofile"
>   
>  diff --git a/libtool.m4 b/libtool.m4
> -index e993b621ac2..7715af647f4 100644
> +index 9a13f3b117a..5be47564443 100644
>  --- a/libtool.m4
>  +++ b/libtool.m4
>  @@ -1,7 +1,8 @@
> @@ -12445,7 +12600,7 @@ index e993b621ac2..7715af647f4 100644
>   # _LT_ENABLE_LOCK
>   # ---------------
>   m4_defun([_LT_ENABLE_LOCK],
> -@@ -1320,14 +1369,47 @@ need_locks="$enable_libtool_lock"
> +@@ -1320,6 +1369,51 @@ need_locks="$enable_libtool_lock"
>   ])# _LT_ENABLE_LOCK
>   
>   
> @@ -12453,6 +12608,14 @@ index e993b621ac2..7715af647f4 100644
>  +# -----------
>  +m4_defun([_LT_PROG_AR],
>  +[AC_CHECK_TOOLS(AR, [ar], false)
> ++  touch conftest.c
> ++  $AR $plugin_option rc conftest.a conftest.c
> ++  if test "$?" != 0; then
> ++    AC_MSG_WARN([Failed: $AR $plugin_option rc])
> ++  else
> ++    AR="$AR $plugin_option"
> ++  fi
> ++  rm -f conftest.*
>  +: ${AR=ar}
>  +: ${AR_FLAGS=cru}
>  +_LT_DECL([], [AR], [1], [The archiver])
> @@ -12489,16 +12652,32 @@ index e993b621ac2..7715af647f4 100644
>   # _LT_CMD_OLD_ARCHIVE
>   # -------------------
>   m4_defun([_LT_CMD_OLD_ARCHIVE],
> --[AC_CHECK_TOOL(AR, ar, false)
> +@@ -1336,23 +1430,7 @@ for plugin in $plugin_names; do
> +   fi
> + done
> + 
> +-AC_CHECK_TOOL(AR, ar, false)
>  -test -z "$AR" && AR=ar
> +-if test -n "$plugin_option"; then
> +-  if $AR --help 2>&1 | grep -q "\--plugin"; then
> +-    touch conftest.c
> +-    $AR $plugin_option rc conftest.a conftest.c
> +-    if test "$?" != 0; then
> +-      AC_MSG_WARN([Failed: $AR $plugin_option rc])
> +-    else
> +-      AR="$AR $plugin_option"
> +-    fi
> +-    rm -f conftest.*
> +-  fi
> +-fi
>  -test -z "$AR_FLAGS" && AR_FLAGS=cru
>  -_LT_DECL([], [AR], [1], [The archiver])
>  -_LT_DECL([], [AR_FLAGS], [1])
> -+[_LT_PROG_AR
> ++_LT_PROG_AR
>   
>   AC_CHECK_TOOL(STRIP, strip, :)
>   test -z "$STRIP" && STRIP=:
> -@@ -1623,7 +1705,7 @@ else
> +@@ -1653,7 +1731,7 @@ else
>     lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>     lt_status=$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> @@ -12507,7 +12686,7 @@ index e993b621ac2..7715af647f4 100644
>   #include "confdefs.h"
>   
>   #if HAVE_DLFCN_H
> -@@ -1667,10 +1749,10 @@ else
> +@@ -1697,10 +1775,10 @@ else
>   /* When -fvisbility=hidden is used, assume the code has been annotated
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -12520,7 +12699,7 @@ index e993b621ac2..7715af647f4 100644
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -2210,8 +2292,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -2240,8 +2318,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>     need_version=no
>     need_lib_prefix=no
>   
> @@ -12532,7 +12711,7 @@ index e993b621ac2..7715af647f4 100644
>       library_names_spec='$libname.dll.a'
>       # DLL is installed to $(libdir)/../bin by postinstall_cmds
>       postinstall_cmds='base_file=`basename \${file}`~
> -@@ -2244,13 +2327,71 @@ m4_if([$1], [],[
> +@@ -2274,13 +2353,71 @@ m4_if([$1], [],[
>         library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[[.]]/-/g'`${versuffix}${shared_ext}'
>         ;;
>       esac
> @@ -12605,7 +12784,7 @@ index e993b621ac2..7715af647f4 100644
>     # FIXME: first we should search . and the directory the executable is in
>     shlibpath_var=PATH
>     ;;
> -@@ -2332,7 +2473,7 @@ haiku*)
> +@@ -2362,7 +2499,7 @@ haiku*)
>     soname_spec='${libname}${release}${shared_ext}$major'
>     shlibpath_var=LIBRARY_PATH
>     shlibpath_overrides_runpath=yes
> @@ -12614,7 +12793,7 @@ index e993b621ac2..7715af647f4 100644
>     hardcode_into_libs=yes
>     ;;
>   
> -@@ -2940,6 +3081,11 @@ case $reload_flag in
> +@@ -2970,6 +3107,11 @@ case $reload_flag in
>   esac
>   reload_cmds='$LD$reload_flag -o $output$reload_objs'
>   case $host_os in
> @@ -12626,7 +12805,7 @@ index e993b621ac2..7715af647f4 100644
>     darwin*)
>       if test "$GCC" = yes; then
>         reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
> -@@ -3006,7 +3152,8 @@ mingw* | pw32*)
> +@@ -3036,7 +3178,8 @@ mingw* | pw32*)
>       lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
>       lt_cv_file_magic_cmd='func_win32_libid'
>     else
> @@ -12636,7 +12815,7 @@ index e993b621ac2..7715af647f4 100644
>       lt_cv_file_magic_cmd='$OBJDUMP -f'
>     fi
>     ;;
> -@@ -3157,6 +3304,21 @@ tpf*)
> +@@ -3187,6 +3330,21 @@ tpf*)
>     ;;
>   esac
>   ])
> @@ -12658,7 +12837,7 @@ index e993b621ac2..7715af647f4 100644
>   file_magic_cmd=$lt_cv_file_magic_cmd
>   deplibs_check_method=$lt_cv_deplibs_check_method
>   test -z "$deplibs_check_method" && deplibs_check_method=unknown
> -@@ -3164,7 +3326,11 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
> +@@ -3194,7 +3352,11 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
>   _LT_DECL([], [deplibs_check_method], [1],
>       [Method to check whether dependent libraries are shared objects])
>   _LT_DECL([], [file_magic_cmd], [1],
> @@ -12671,7 +12850,7 @@ index e993b621ac2..7715af647f4 100644
>   ])# _LT_CHECK_MAGIC_METHOD
>   
>   
> -@@ -3267,6 +3433,67 @@ dnl aclocal-1.4 backwards compatibility:
> +@@ -3297,6 +3459,67 @@ dnl aclocal-1.4 backwards compatibility:
>   dnl AC_DEFUN([AM_PROG_NM], [])
>   dnl AC_DEFUN([AC_PROG_NM], [])
>   
> @@ -12739,7 +12918,7 @@ index e993b621ac2..7715af647f4 100644
>   
>   # LT_LIB_M
>   # --------
> -@@ -3393,8 +3620,8 @@ esac
> +@@ -3423,8 +3646,8 @@ esac
>   lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
>   
>   # Transform an extracted symbol line into symbol name and symbol address
> @@ -12750,7 +12929,7 @@ index e993b621ac2..7715af647f4 100644
>   
>   # Handle CRLF in mingw tool chain
>   opt_cr=
> -@@ -3430,6 +3657,7 @@ for ac_symprfx in "" "_"; do
> +@@ -3460,6 +3683,7 @@ for ac_symprfx in "" "_"; do
>     else
>       lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[[	 ]]\($symcode$symcode*\)[[	 ]][[	 ]]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
>     fi
> @@ -12758,7 +12937,7 @@ index e993b621ac2..7715af647f4 100644
>   
>     # Check to see that the pipe works correctly.
>     pipe_works=no
> -@@ -3463,6 +3691,18 @@ _LT_EOF
> +@@ -3493,6 +3717,18 @@ _LT_EOF
>         if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
>   	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
>   	  cat <<_LT_EOF > conftest.$ac_ext
> @@ -12777,7 +12956,7 @@ index e993b621ac2..7715af647f4 100644
>   #ifdef __cplusplus
>   extern "C" {
>   #endif
> -@@ -3474,7 +3714,7 @@ _LT_EOF
> +@@ -3504,7 +3740,7 @@ _LT_EOF
>   	  cat <<_LT_EOF >> conftest.$ac_ext
>   
>   /* The mapping between symbol names and symbols.  */
> @@ -12786,7 +12965,7 @@ index e993b621ac2..7715af647f4 100644
>     const char *name;
>     void       *address;
>   }
> -@@ -3500,15 +3740,15 @@ static const void *lt_preloaded_setup() {
> +@@ -3530,15 +3766,15 @@ static const void *lt_preloaded_setup() {
>   _LT_EOF
>   	  # Now try linking the two files.
>   	  mv conftest.$ac_objext conftstm.$ac_objext
> @@ -12806,7 +12985,7 @@ index e993b621ac2..7715af647f4 100644
>   	else
>   	  echo "cannot find nm_test_func in $nlist" >&AS_MESSAGE_LOG_FD
>   	fi
> -@@ -3541,6 +3781,13 @@ else
> +@@ -3571,6 +3807,13 @@ else
>     AC_MSG_RESULT(ok)
>   fi
>   
> @@ -12820,7 +12999,7 @@ index e993b621ac2..7715af647f4 100644
>   _LT_DECL([global_symbol_pipe], [lt_cv_sys_global_symbol_pipe], [1],
>       [Take the output of nm and produce a listing of raw symbols and C names])
>   _LT_DECL([global_symbol_to_cdecl], [lt_cv_sys_global_symbol_to_cdecl], [1],
> -@@ -3551,6 +3798,8 @@ _LT_DECL([global_symbol_to_c_name_address],
> +@@ -3581,6 +3824,8 @@ _LT_DECL([global_symbol_to_c_name_address],
>   _LT_DECL([global_symbol_to_c_name_address_lib_prefix],
>       [lt_cv_sys_global_symbol_to_c_name_address_lib_prefix], [1],
>       [Transform the output of nm in a C name address pair when lib prefix is needed])
> @@ -12829,7 +13008,7 @@ index e993b621ac2..7715af647f4 100644
>   ]) # _LT_CMD_GLOBAL_SYMBOLS
>   
>   
> -@@ -3562,7 +3811,6 @@ _LT_TAGVAR(lt_prog_compiler_wl, $1)=
> +@@ -3592,7 +3837,6 @@ _LT_TAGVAR(lt_prog_compiler_wl, $1)=
>   _LT_TAGVAR(lt_prog_compiler_pic, $1)=
>   _LT_TAGVAR(lt_prog_compiler_static, $1)=
>   
> @@ -12837,7 +13016,7 @@ index e993b621ac2..7715af647f4 100644
>   m4_if([$1], [CXX], [
>     # C++ specific cases for pic, static, wl, etc.
>     if test "$GXX" = yes; then
> -@@ -3668,6 +3916,12 @@ m4_if([$1], [CXX], [
> +@@ -3698,6 +3942,12 @@ m4_if([$1], [CXX], [
>   	  ;;
>   	esac
>   	;;
> @@ -12850,7 +13029,7 @@ index e993b621ac2..7715af647f4 100644
>         dgux*)
>   	case $cc_basename in
>   	  ec++*)
> -@@ -3820,7 +4074,7 @@ m4_if([$1], [CXX], [
> +@@ -3850,7 +4100,7 @@ m4_if([$1], [CXX], [
>   	;;
>         solaris*)
>   	case $cc_basename in
> @@ -12859,7 +13038,7 @@ index e993b621ac2..7715af647f4 100644
>   	    # Sun C++ 4.2, 5.x and Centerline C++
>   	    _LT_TAGVAR(lt_prog_compiler_pic, $1)='-KPIC'
>   	    _LT_TAGVAR(lt_prog_compiler_static, $1)='-Bstatic'
> -@@ -4043,6 +4297,12 @@ m4_if([$1], [CXX], [
> +@@ -4073,6 +4323,12 @@ m4_if([$1], [CXX], [
>   	_LT_TAGVAR(lt_prog_compiler_pic, $1)='--shared'
>   	_LT_TAGVAR(lt_prog_compiler_static, $1)='--static'
>   	;;
> @@ -12872,7 +13051,7 @@ index e993b621ac2..7715af647f4 100644
>         pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
>           # Portland Group compilers (*not* the Pentium gcc compiler,
>   	# which looks to be a dead project)
> -@@ -4105,7 +4365,7 @@ m4_if([$1], [CXX], [
> +@@ -4135,7 +4391,7 @@ m4_if([$1], [CXX], [
>         _LT_TAGVAR(lt_prog_compiler_pic, $1)='-KPIC'
>         _LT_TAGVAR(lt_prog_compiler_static, $1)='-Bstatic'
>         case $cc_basename in
> @@ -12881,7 +13060,7 @@ index e993b621ac2..7715af647f4 100644
>   	_LT_TAGVAR(lt_prog_compiler_wl, $1)='-Qoption ld ';;
>         *)
>   	_LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,';;
> -@@ -4162,9 +4422,11 @@ case $host_os in
> +@@ -4192,9 +4448,11 @@ case $host_os in
>       _LT_TAGVAR(lt_prog_compiler_pic, $1)="$_LT_TAGVAR(lt_prog_compiler_pic, $1)@&t@m4_if([$1],[],[ -DPIC],[m4_if([$1],[CXX],[ -DPIC],[])])"
>       ;;
>   esac
> @@ -12896,7 +13075,7 @@ index e993b621ac2..7715af647f4 100644
>   
>   #
>   # Check to make sure the PIC flag actually works.
> -@@ -4183,6 +4445,8 @@ fi
> +@@ -4213,6 +4471,8 @@ fi
>   _LT_TAGDECL([pic_flag], [lt_prog_compiler_pic], [1],
>   	[Additional compiler flags for building library objects])
>   
> @@ -12905,7 +13084,7 @@ index e993b621ac2..7715af647f4 100644
>   #
>   # Check to make sure the static flag actually works.
>   #
> -@@ -4203,6 +4467,7 @@ _LT_TAGDECL([link_static_flag], [lt_prog_compiler_static], [1],
> +@@ -4233,6 +4493,7 @@ _LT_TAGDECL([link_static_flag], [lt_prog_compiler_static], [1],
>   m4_defun([_LT_LINKER_SHLIBS],
>   [AC_REQUIRE([LT_PATH_LD])dnl
>   AC_REQUIRE([LT_PATH_NM])dnl
> @@ -12913,7 +13092,7 @@ index e993b621ac2..7715af647f4 100644
>   m4_require([_LT_FILEUTILS_DEFAULTS])dnl
>   m4_require([_LT_DECL_EGREP])dnl
>   m4_require([_LT_DECL_SED])dnl
> -@@ -4211,6 +4476,7 @@ m4_require([_LT_TAG_COMPILER])dnl
> +@@ -4241,6 +4502,7 @@ m4_require([_LT_TAG_COMPILER])dnl
>   AC_MSG_CHECKING([whether the $compiler linker ($LD) supports shared libraries])
>   m4_if([$1], [CXX], [
>     _LT_TAGVAR(export_symbols_cmds, $1)='$NM $libobjs $convenience | $global_symbol_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
> @@ -12921,7 +13100,7 @@ index e993b621ac2..7715af647f4 100644
>     case $host_os in
>     aix[[4-9]]*)
>       # If we're using GNU nm, then we don't want the "-C" option.
> -@@ -4225,15 +4491,20 @@ m4_if([$1], [CXX], [
> +@@ -4255,15 +4517,20 @@ m4_if([$1], [CXX], [
>       ;;
>     pw32*)
>       _LT_TAGVAR(export_symbols_cmds, $1)="$ltdll_cmds"
> @@ -12947,7 +13126,7 @@ index e993b621ac2..7715af647f4 100644
>   ], [
>     runpath_var=
>     _LT_TAGVAR(allow_undefined_flag, $1)=
> -@@ -4401,7 +4672,8 @@ _LT_EOF
> +@@ -4431,7 +4698,8 @@ _LT_EOF
>         _LT_TAGVAR(allow_undefined_flag, $1)=unsupported
>         _LT_TAGVAR(always_export_symbols, $1)=no
>         _LT_TAGVAR(enable_shared_with_static_runtimes, $1)=yes
> @@ -12957,7 +13136,7 @@ index e993b621ac2..7715af647f4 100644
>   
>         if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
>           _LT_TAGVAR(archive_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
> -@@ -4500,12 +4772,12 @@ _LT_EOF
> +@@ -4530,12 +4798,12 @@ _LT_EOF
>   	  _LT_TAGVAR(whole_archive_flag_spec, $1)='--whole-archive$convenience --no-whole-archive'
>   	  _LT_TAGVAR(hardcode_libdir_flag_spec, $1)=
>   	  _LT_TAGVAR(hardcode_libdir_flag_spec_ld, $1)='-rpath $libdir'
> @@ -12972,7 +13151,7 @@ index e993b621ac2..7715af647f4 100644
>   	  fi
>   	  ;;
>   	esac
> -@@ -4519,8 +4791,8 @@ _LT_EOF
> +@@ -4549,8 +4817,8 @@ _LT_EOF
>   	_LT_TAGVAR(archive_cmds, $1)='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
>   	wlarc=
>         else
> @@ -12983,7 +13162,7 @@ index e993b621ac2..7715af647f4 100644
>         fi
>         ;;
>   
> -@@ -4538,8 +4810,8 @@ _LT_EOF
> +@@ -4568,8 +4836,8 @@ _LT_EOF
>   
>   _LT_EOF
>         elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -12994,7 +13173,7 @@ index e993b621ac2..7715af647f4 100644
>         else
>   	_LT_TAGVAR(ld_shlibs, $1)=no
>         fi
> -@@ -4585,8 +4857,8 @@ _LT_EOF
> +@@ -4615,8 +4883,8 @@ _LT_EOF
>   
>       *)
>         if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -13005,7 +13184,7 @@ index e993b621ac2..7715af647f4 100644
>         else
>   	_LT_TAGVAR(ld_shlibs, $1)=no
>         fi
> -@@ -4716,7 +4988,7 @@ _LT_EOF
> +@@ -4746,7 +5014,7 @@ _LT_EOF
>   	_LT_TAGVAR(allow_undefined_flag, $1)='-berok'
>           # Determine the default libpath from the value encoded in an
>           # empty executable.
> @@ -13014,7 +13193,7 @@ index e993b621ac2..7715af647f4 100644
>           _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
>           _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
>         else
> -@@ -4727,7 +4999,7 @@ _LT_EOF
> +@@ -4757,7 +5025,7 @@ _LT_EOF
>   	else
>   	 # Determine the default libpath from the value encoded in an
>   	 # empty executable.
> @@ -13023,7 +13202,7 @@ index e993b621ac2..7715af647f4 100644
>   	 _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
>   	  # Warning - without using the other run time loading flags,
>   	  # -berok will link without error, but may produce a broken library.
> -@@ -4771,20 +5043,63 @@ _LT_EOF
> +@@ -4801,20 +5069,63 @@ _LT_EOF
>         # Microsoft Visual C++.
>         # hardcode_libdir_flag_spec is actually meaningless, as there is
>         # no search path for DLLs.
> @@ -13101,7 +13280,7 @@ index e993b621ac2..7715af647f4 100644
>         ;;
>   
>       darwin* | rhapsody*)
> -@@ -4818,7 +5133,7 @@ _LT_EOF
> +@@ -4848,7 +5159,7 @@ _LT_EOF
>   
>       # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
>       freebsd* | dragonfly*)
> @@ -13110,7 +13289,7 @@ index e993b621ac2..7715af647f4 100644
>         _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-R$libdir'
>         _LT_TAGVAR(hardcode_direct, $1)=yes
>         _LT_TAGVAR(hardcode_shlibpath_var, $1)=no
> -@@ -4826,7 +5141,7 @@ _LT_EOF
> +@@ -4856,7 +5167,7 @@ _LT_EOF
>   
>       hpux9*)
>         if test "$GCC" = yes; then
> @@ -13119,7 +13298,7 @@ index e993b621ac2..7715af647f4 100644
>         else
>   	_LT_TAGVAR(archive_cmds, $1)='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
>         fi
> -@@ -4842,7 +5157,7 @@ _LT_EOF
> +@@ -4872,7 +5183,7 @@ _LT_EOF
>   
>       hpux10*)
>         if test "$GCC" = yes && test "$with_gnu_ld" = no; then
> @@ -13128,7 +13307,7 @@ index e993b621ac2..7715af647f4 100644
>         else
>   	_LT_TAGVAR(archive_cmds, $1)='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
>         fi
> -@@ -4866,10 +5181,10 @@ _LT_EOF
> +@@ -4896,10 +5207,10 @@ _LT_EOF
>   	  _LT_TAGVAR(archive_cmds, $1)='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
>   	  ;;
>   	ia64*)
> @@ -13141,7 +13320,7 @@ index e993b621ac2..7715af647f4 100644
>   	  ;;
>   	esac
>         else
> -@@ -4916,16 +5231,31 @@ _LT_EOF
> +@@ -4946,16 +5257,31 @@ _LT_EOF
>   
>       irix5* | irix6* | nonstopux*)
>         if test "$GCC" = yes; then
> @@ -13180,7 +13359,7 @@ index e993b621ac2..7715af647f4 100644
>         else
>   	_LT_TAGVAR(archive_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
>   	_LT_TAGVAR(archive_expsym_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
> -@@ -5010,7 +5340,7 @@ _LT_EOF
> +@@ -5040,7 +5366,7 @@ _LT_EOF
>       osf4* | osf5*)	# as osf3* with the addition of -msym flag
>         if test "$GCC" = yes; then
>   	_LT_TAGVAR(allow_undefined_flag, $1)=' ${wl}-expect_unresolved ${wl}\*'
> @@ -13189,7 +13368,7 @@ index e993b621ac2..7715af647f4 100644
>   	_LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-rpath ${wl}$libdir'
>         else
>   	_LT_TAGVAR(allow_undefined_flag, $1)=' -expect_unresolved \*'
> -@@ -5029,9 +5359,9 @@ _LT_EOF
> +@@ -5059,9 +5385,9 @@ _LT_EOF
>         _LT_TAGVAR(no_undefined_flag, $1)=' -z defs'
>         if test "$GCC" = yes; then
>   	wlarc='${wl}'
> @@ -13201,7 +13380,7 @@ index e993b621ac2..7715af647f4 100644
>         else
>   	case `$CC -V 2>&1` in
>   	*"Compilers 5.0"*)
> -@@ -5303,8 +5633,6 @@ _LT_TAGDECL([], [inherit_rpath], [0],
> +@@ -5333,8 +5659,6 @@ _LT_TAGDECL([], [inherit_rpath], [0],
>       to runtime path list])
>   _LT_TAGDECL([], [link_all_deplibs], [0],
>       [Whether libtool must link a program against all its dependency libraries])
> @@ -13210,7 +13389,7 @@ index e993b621ac2..7715af647f4 100644
>   _LT_TAGDECL([], [always_export_symbols], [0],
>       [Set to "yes" if exported symbols are required])
>   _LT_TAGDECL([], [export_symbols_cmds], [2],
> -@@ -5315,6 +5643,8 @@ _LT_TAGDECL([], [include_expsyms], [1],
> +@@ -5345,6 +5669,8 @@ _LT_TAGDECL([], [include_expsyms], [1],
>       [Symbols that must always be exported])
>   _LT_TAGDECL([], [prelink_cmds], [2],
>       [Commands necessary for linking programs (against libraries) with templates])
> @@ -13219,7 +13398,7 @@ index e993b621ac2..7715af647f4 100644
>   _LT_TAGDECL([], [file_list_spec], [1],
>       [Specify filename containing input files])
>   dnl FIXME: Not yet implemented
> -@@ -5416,6 +5746,7 @@ CC="$lt_save_CC"
> +@@ -5446,6 +5772,7 @@ CC="$lt_save_CC"
>   m4_defun([_LT_LANG_CXX_CONFIG],
>   [m4_require([_LT_FILEUTILS_DEFAULTS])dnl
>   m4_require([_LT_DECL_EGREP])dnl
> @@ -13227,7 +13406,7 @@ index e993b621ac2..7715af647f4 100644
>   if test -n "$CXX" && ( test "X$CXX" != "Xno" &&
>       ( (test "X$CXX" = "Xg++" && `g++ -v >/dev/null 2>&1` ) ||
>       (test "X$CXX" != "Xg++"))) ; then
> -@@ -5477,6 +5808,7 @@ if test "$_lt_caught_CXX_error" != yes; then
> +@@ -5507,6 +5834,7 @@ if test "$_lt_caught_CXX_error" != yes; then
>   
>     # Allow CC to be a program name with arguments.
>     lt_save_CC=$CC
> @@ -13235,7 +13414,7 @@ index e993b621ac2..7715af647f4 100644
>     lt_save_LD=$LD
>     lt_save_GCC=$GCC
>     GCC=$GXX
> -@@ -5494,6 +5826,7 @@ if test "$_lt_caught_CXX_error" != yes; then
> +@@ -5524,6 +5852,7 @@ if test "$_lt_caught_CXX_error" != yes; then
>     fi
>     test -z "${LDCXX+set}" || LD=$LDCXX
>     CC=${CXX-"c++"}
> @@ -13243,7 +13422,7 @@ index e993b621ac2..7715af647f4 100644
>     compiler=$CC
>     _LT_TAGVAR(compiler, $1)=$CC
>     _LT_CC_BASENAME([$compiler])
> -@@ -5657,7 +5990,7 @@ if test "$_lt_caught_CXX_error" != yes; then
> +@@ -5687,7 +6016,7 @@ if test "$_lt_caught_CXX_error" != yes; then
>             _LT_TAGVAR(allow_undefined_flag, $1)='-berok'
>             # Determine the default libpath from the value encoded in an empty
>             # executable.
> @@ -13252,7 +13431,7 @@ index e993b621ac2..7715af647f4 100644
>             _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
>   
>             _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> -@@ -5669,7 +6002,7 @@ if test "$_lt_caught_CXX_error" != yes; then
> +@@ -5699,7 +6028,7 @@ if test "$_lt_caught_CXX_error" != yes; then
>             else
>   	    # Determine the default libpath from the value encoded in an
>   	    # empty executable.
> @@ -13261,7 +13440,7 @@ index e993b621ac2..7715af647f4 100644
>   	    _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
>   	    # Warning - without using the other run time loading flags,
>   	    # -berok will link without error, but may produce a broken library.
> -@@ -5711,29 +6044,75 @@ if test "$_lt_caught_CXX_error" != yes; then
> +@@ -5741,29 +6070,75 @@ if test "$_lt_caught_CXX_error" != yes; then
>           ;;
>   
>         cygwin* | mingw* | pw32* | cegcc*)
> @@ -13360,7 +13539,7 @@ index e993b621ac2..7715af647f4 100644
>         darwin* | rhapsody*)
>           _LT_DARWIN_LINKER_FEATURES($1)
>   	;;
> -@@ -5808,7 +6187,7 @@ if test "$_lt_caught_CXX_error" != yes; then
> +@@ -5838,7 +6213,7 @@ if test "$_lt_caught_CXX_error" != yes; then
>               ;;
>             *)
>               if test "$GXX" = yes; then
> @@ -13369,7 +13548,7 @@ index e993b621ac2..7715af647f4 100644
>               else
>                 # FIXME: insert proper C++ library support
>                 _LT_TAGVAR(ld_shlibs, $1)=no
> -@@ -5879,10 +6258,10 @@ if test "$_lt_caught_CXX_error" != yes; then
> +@@ -5909,10 +6284,10 @@ if test "$_lt_caught_CXX_error" != yes; then
>   	            _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
>   	            ;;
>   	          ia64*)
> @@ -13382,7 +13561,7 @@ index e993b621ac2..7715af647f4 100644
>   	            ;;
>   	        esac
>   	      fi
> -@@ -5923,9 +6302,9 @@ if test "$_lt_caught_CXX_error" != yes; then
> +@@ -5953,9 +6328,9 @@ if test "$_lt_caught_CXX_error" != yes; then
>             *)
>   	    if test "$GXX" = yes; then
>   	      if test "$with_gnu_ld" = no; then
> @@ -13394,7 +13573,7 @@ index e993b621ac2..7715af647f4 100644
>   	      fi
>   	    fi
>   	    _LT_TAGVAR(link_all_deplibs, $1)=yes
> -@@ -5995,20 +6374,20 @@ if test "$_lt_caught_CXX_error" != yes; then
> +@@ -6025,20 +6400,20 @@ if test "$_lt_caught_CXX_error" != yes; then
>   	      _LT_TAGVAR(prelink_cmds, $1)='tpldir=Template.dir~
>   		rm -rf $tpldir~
>   		$CC --prelink_objects --instantiation_dir $tpldir $objs $libobjs $compile_deplibs~
> @@ -13419,7 +13598,7 @@ index e993b621ac2..7715af647f4 100644
>   	      ;;
>   	    *) # Version 6 and above use weak symbols
>   	      _LT_TAGVAR(archive_cmds, $1)='$CC -shared $pic_flag $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
> -@@ -6203,7 +6582,7 @@ if test "$_lt_caught_CXX_error" != yes; then
> +@@ -6233,7 +6608,7 @@ if test "$_lt_caught_CXX_error" != yes; then
>   	          _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
>   		  ;;
>   	        *)
> @@ -13428,7 +13607,7 @@ index e993b621ac2..7715af647f4 100644
>   		  ;;
>   	      esac
>   
> -@@ -6249,7 +6628,7 @@ if test "$_lt_caught_CXX_error" != yes; then
> +@@ -6279,7 +6654,7 @@ if test "$_lt_caught_CXX_error" != yes; then
>   
>         solaris*)
>           case $cc_basename in
> @@ -13437,7 +13616,7 @@ index e993b621ac2..7715af647f4 100644
>   	    # Sun C++ 4.2, 5.x and Centerline C++
>               _LT_TAGVAR(archive_cmds_need_lc,$1)=yes
>   	    _LT_TAGVAR(no_undefined_flag, $1)=' -zdefs'
> -@@ -6290,9 +6669,9 @@ if test "$_lt_caught_CXX_error" != yes; then
> +@@ -6320,9 +6695,9 @@ if test "$_lt_caught_CXX_error" != yes; then
>   	    if test "$GXX" = yes && test "$with_gnu_ld" = no; then
>   	      _LT_TAGVAR(no_undefined_flag, $1)=' ${wl}-z ${wl}defs'
>   	      if $CC --version | $GREP -v '^2\.7' > /dev/null; then
> @@ -13449,7 +13628,7 @@ index e993b621ac2..7715af647f4 100644
>   
>   	        # Commands to make compiler produce verbose output that lists
>   	        # what "hidden" libraries, object files and flags are used when
> -@@ -6421,6 +6800,7 @@ if test "$_lt_caught_CXX_error" != yes; then
> +@@ -6451,6 +6826,7 @@ if test "$_lt_caught_CXX_error" != yes; then
>     fi # test -n "$compiler"
>   
>     CC=$lt_save_CC
> @@ -13457,7 +13636,7 @@ index e993b621ac2..7715af647f4 100644
>     LDCXX=$LD
>     LD=$lt_save_LD
>     GCC=$lt_save_GCC
> -@@ -6435,6 +6815,29 @@ AC_LANG_POP
> +@@ -6465,6 +6841,29 @@ AC_LANG_POP
>   ])# _LT_LANG_CXX_CONFIG
>   
>   
> @@ -13487,7 +13666,7 @@ index e993b621ac2..7715af647f4 100644
>   # _LT_SYS_HIDDEN_LIBDEPS([TAGNAME])
>   # ---------------------------------
>   # Figure out "hidden" library dependencies from verbose
> -@@ -6443,6 +6846,7 @@ AC_LANG_POP
> +@@ -6473,6 +6872,7 @@ AC_LANG_POP
>   # objects, libraries and library flags.
>   m4_defun([_LT_SYS_HIDDEN_LIBDEPS],
>   [m4_require([_LT_FILEUTILS_DEFAULTS])dnl
> @@ -13495,7 +13674,7 @@ index e993b621ac2..7715af647f4 100644
>   # Dependencies to place before and after the object being linked:
>   _LT_TAGVAR(predep_objects, $1)=
>   _LT_TAGVAR(postdep_objects, $1)=
> -@@ -6493,6 +6897,13 @@ public class foo {
> +@@ -6523,6 +6923,13 @@ public class foo {
>   };
>   _LT_EOF
>   ])
> @@ -13509,7 +13688,7 @@ index e993b621ac2..7715af647f4 100644
>   dnl Parse the compiler output and extract the necessary
>   dnl objects, libraries and library flags.
>   if AC_TRY_EVAL(ac_compile); then
> -@@ -6504,7 +6915,7 @@ if AC_TRY_EVAL(ac_compile); then
> +@@ -6534,7 +6941,7 @@ if AC_TRY_EVAL(ac_compile); then
>     pre_test_object_deps_done=no
>   
>     for p in `eval "$output_verbose_link_cmd"`; do
> @@ -13518,7 +13697,7 @@ index e993b621ac2..7715af647f4 100644
>   
>       -L* | -R* | -l*)
>          # Some compilers place space between "-{L,R}" and the path.
> -@@ -6513,13 +6924,22 @@ if AC_TRY_EVAL(ac_compile); then
> +@@ -6543,13 +6950,22 @@ if AC_TRY_EVAL(ac_compile); then
>             test $p = "-R"; then
>   	 prev=$p
>   	 continue
> @@ -13545,7 +13724,7 @@ index e993b621ac2..7715af647f4 100644
>   	   # Internal compiler library paths should come after those
>   	   # provided the user.  The postdeps already come after the
>   	   # user supplied libs so there is no need to process them.
> -@@ -6539,8 +6959,10 @@ if AC_TRY_EVAL(ac_compile); then
> +@@ -6569,8 +6985,10 @@ if AC_TRY_EVAL(ac_compile); then
>   	   _LT_TAGVAR(postdeps, $1)="${_LT_TAGVAR(postdeps, $1)} ${prev}${p}"
>   	 fi
>          fi
> @@ -13556,7 +13735,7 @@ index e993b621ac2..7715af647f4 100644
>       *.$objext)
>          # This assumes that the test object file only shows up
>          # once in the compiler output.
> -@@ -6576,6 +6998,7 @@ else
> +@@ -6606,6 +7024,7 @@ else
>   fi
>   
>   $RM -f confest.$objext
> @@ -13564,7 +13743,7 @@ index e993b621ac2..7715af647f4 100644
>   
>   # PORTME: override above test on systems where it is broken
>   m4_if([$1], [CXX],
> -@@ -6612,7 +7035,7 @@ linux*)
> +@@ -6642,7 +7061,7 @@ linux*)
>   
>   solaris*)
>     case $cc_basename in
> @@ -13573,7 +13752,7 @@ index e993b621ac2..7715af647f4 100644
>       # The more standards-conforming stlport4 library is
>       # incompatible with the Cstd library. Avoid specifying
>       # it if it's in CXXFLAGS. Ignore libCrun as
> -@@ -6725,7 +7148,9 @@ if test "$_lt_disable_F77" != yes; then
> +@@ -6755,7 +7174,9 @@ if test "$_lt_disable_F77" != yes; then
>     # Allow CC to be a program name with arguments.
>     lt_save_CC="$CC"
>     lt_save_GCC=$GCC
> @@ -13583,7 +13762,7 @@ index e993b621ac2..7715af647f4 100644
>     compiler=$CC
>     _LT_TAGVAR(compiler, $1)=$CC
>     _LT_CC_BASENAME([$compiler])
> -@@ -6779,6 +7204,7 @@ if test "$_lt_disable_F77" != yes; then
> +@@ -6809,6 +7230,7 @@ if test "$_lt_disable_F77" != yes; then
>   
>     GCC=$lt_save_GCC
>     CC="$lt_save_CC"
> @@ -13591,7 +13770,7 @@ index e993b621ac2..7715af647f4 100644
>   fi # test "$_lt_disable_F77" != yes
>   
>   AC_LANG_POP
> -@@ -6855,7 +7281,9 @@ if test "$_lt_disable_FC" != yes; then
> +@@ -6885,7 +7307,9 @@ if test "$_lt_disable_FC" != yes; then
>     # Allow CC to be a program name with arguments.
>     lt_save_CC="$CC"
>     lt_save_GCC=$GCC
> @@ -13601,7 +13780,7 @@ index e993b621ac2..7715af647f4 100644
>     compiler=$CC
>     GCC=$ac_cv_fc_compiler_gnu
>   
> -@@ -6911,7 +7339,8 @@ if test "$_lt_disable_FC" != yes; then
> +@@ -6941,7 +7365,8 @@ if test "$_lt_disable_FC" != yes; then
>     fi # test -n "$compiler"
>   
>     GCC=$lt_save_GCC
> @@ -13611,7 +13790,7 @@ index e993b621ac2..7715af647f4 100644
>   fi # test "$_lt_disable_FC" != yes
>   
>   AC_LANG_POP
> -@@ -6948,10 +7377,12 @@ _LT_COMPILER_BOILERPLATE
> +@@ -6978,10 +7403,12 @@ _LT_COMPILER_BOILERPLATE
>   _LT_LINKER_BOILERPLATE
>   
>   # Allow CC to be a program name with arguments.
> @@ -13625,7 +13804,7 @@ index e993b621ac2..7715af647f4 100644
>   compiler=$CC
>   _LT_TAGVAR(compiler, $1)=$CC
>   _LT_TAGVAR(LD, $1)="$LD"
> -@@ -6982,7 +7413,8 @@ fi
> +@@ -7012,7 +7439,8 @@ fi
>   AC_LANG_RESTORE
>   
>   GCC=$lt_save_GCC
> @@ -13635,7 +13814,7 @@ index e993b621ac2..7715af647f4 100644
>   ])# _LT_LANG_GCJ_CONFIG
>   
>   
> -@@ -7017,9 +7449,11 @@ _LT_LINKER_BOILERPLATE
> +@@ -7047,9 +7475,11 @@ _LT_LINKER_BOILERPLATE
>   
>   # Allow CC to be a program name with arguments.
>   lt_save_CC="$CC"
> @@ -13647,7 +13826,7 @@ index e993b621ac2..7715af647f4 100644
>   compiler=$CC
>   _LT_TAGVAR(compiler, $1)=$CC
>   _LT_CC_BASENAME([$compiler])
> -@@ -7032,7 +7466,8 @@ fi
> +@@ -7062,7 +7492,8 @@ fi
>   
>   GCC=$lt_save_GCC
>   AC_LANG_RESTORE
> @@ -13657,7 +13836,7 @@ index e993b621ac2..7715af647f4 100644
>   ])# _LT_LANG_RC_CONFIG
>   
>   
> -@@ -7091,6 +7526,15 @@ _LT_DECL([], [OBJDUMP], [1], [An object symbol dumper])
> +@@ -7121,6 +7552,15 @@ _LT_DECL([], [OBJDUMP], [1], [An object symbol dumper])
>   AC_SUBST([OBJDUMP])
>   ])
>   
> @@ -13673,7 +13852,7 @@ index e993b621ac2..7715af647f4 100644
>   
>   # _LT_DECL_SED
>   # ------------
> -@@ -7184,8 +7628,8 @@ m4_defun([_LT_CHECK_SHELL_FEATURES],
> +@@ -7214,8 +7654,8 @@ m4_defun([_LT_CHECK_SHELL_FEATURES],
>   # Try some XSI features
>   xsi_shell=no
>   ( _lt_dummy="a/b/c"
> @@ -13684,7 +13863,7 @@ index e993b621ac2..7715af647f4 100644
>       && eval 'test $(( 1 + 1 )) -eq 2 \
>       && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
>     && xsi_shell=yes
> -@@ -7224,206 +7668,162 @@ _LT_DECL([NL2SP], [lt_NL2SP], [1], [turn newlines into spaces])dnl
> +@@ -7254,206 +7694,162 @@ _LT_DECL([NL2SP], [lt_NL2SP], [1], [turn newlines into spaces])dnl
>   ])# _LT_CHECK_SHELL_FEATURES
>   
>   
> @@ -19318,7 +19497,7 @@ index bf92b5e0790..c573da90c5c 100644
>   # These exist entirely to fool aclocal when bootstrapping libtool.
>   #
>  diff --git a/opcodes/configure b/opcodes/configure
> -index dca94db9c3f..26dcc4b82dd 100755
> +index 3513e408ce1..133948631e9 100755
>  --- a/opcodes/configure
>  +++ b/opcodes/configure
>  @@ -680,6 +680,9 @@ OTOOL
> @@ -19337,9 +19516,9 @@ index dca94db9c3f..26dcc4b82dd 100755
>   with_gnu_ld
>  +with_libtool_sysroot
>   enable_libtool_lock
> + enable_checking
>   enable_targets
> - enable_werror
> -@@ -1462,6 +1466,8 @@ Optional Packages:
> +@@ -1464,6 +1468,8 @@ Optional Packages:
>     --with-pic              try to use only PIC/non-PIC objects [default=use
>                             both]
>     --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
> @@ -19348,7 +19527,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>   
>   Some influential environment variables:
>     CC          C compiler command
> -@@ -5403,8 +5409,8 @@ esac
> +@@ -4751,8 +4757,8 @@ esac
>   
>   
>   
> @@ -19359,7 +19538,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>   
>   
>   
> -@@ -5444,7 +5450,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> +@@ -4792,7 +4798,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
>   $as_echo_n "checking how to print strings... " >&6; }
>   # Test print first, because it will be a builtin if present.
> @@ -19368,7 +19547,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>      test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
>     ECHO='print -r --'
>   elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
> -@@ -6130,8 +6136,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
> +@@ -5478,8 +5484,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
>   # Try some XSI features
>   xsi_shell=no
>   ( _lt_dummy="a/b/c"
> @@ -19379,7 +19558,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>       && eval 'test $(( 1 + 1 )) -eq 2 \
>       && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
>     && xsi_shell=yes
> -@@ -6180,6 +6186,80 @@ esac
> +@@ -5528,6 +5534,80 @@ esac
>   
>   
>   
> @@ -19460,7 +19639,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
>   $as_echo_n "checking for $LD option to reload object files... " >&6; }
>   if ${lt_cv_ld_reload_flag+:} false; then :
> -@@ -6196,6 +6276,11 @@ case $reload_flag in
> +@@ -5544,6 +5624,11 @@ case $reload_flag in
>   esac
>   reload_cmds='$LD$reload_flag -o $output$reload_objs'
>   case $host_os in
> @@ -19472,7 +19651,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>     darwin*)
>       if test "$GCC" = yes; then
>         reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
> -@@ -6364,7 +6449,8 @@ mingw* | pw32*)
> +@@ -5712,7 +5797,8 @@ mingw* | pw32*)
>       lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
>       lt_cv_file_magic_cmd='func_win32_libid'
>     else
> @@ -19482,7 +19661,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>       lt_cv_file_magic_cmd='$OBJDUMP -f'
>     fi
>     ;;
> -@@ -6518,6 +6604,21 @@ esac
> +@@ -5866,6 +5952,21 @@ esac
>   fi
>   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
>   $as_echo "$lt_cv_deplibs_check_method" >&6; }
> @@ -19504,7 +19683,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>   file_magic_cmd=$lt_cv_file_magic_cmd
>   deplibs_check_method=$lt_cv_deplibs_check_method
>   test -z "$deplibs_check_method" && deplibs_check_method=unknown
> -@@ -6531,11 +6632,164 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
> +@@ -5881,6 +5982,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
>   
>   
>   
> @@ -19518,11 +19697,7 @@ index dca94db9c3f..26dcc4b82dd 100755
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
> @@ -19663,7 +19838,15 @@ index dca94db9c3f..26dcc4b82dd 100755
>  +
>  +
>  +
> -+if test -n "$ac_tool_prefix"; then
> + plugin_option=
> + plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
> + for plugin in $plugin_names; do
> +@@ -5895,8 +6147,10 @@ for plugin in $plugin_names; do
> + done
> + 
> + if test -n "$ac_tool_prefix"; then
> +-  # Extract the first word of "${ac_tool_prefix}ar", so it can be a program name with args.
> +-set dummy ${ac_tool_prefix}ar; ac_word=$2
>  +  for ac_prog in ar
>  +  do
>  +    # Extract the first word of "$ac_tool_prefix$ac_prog", so it can be a program name with args.
> @@ -19671,7 +19854,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_AR+:} false; then :
> -@@ -6551,7 +6805,7 @@ do
> +@@ -5912,7 +6166,7 @@ do
>     test -z "$as_dir" && as_dir=.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -19680,7 +19863,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -6571,11 +6825,15 @@ $as_echo "no" >&6; }
> +@@ -5932,11 +6186,15 @@ $as_echo "no" >&6; }
>   fi
>   
>   
> @@ -19699,7 +19882,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_ac_ct_AR+:} false; then :
> -@@ -6591,7 +6849,7 @@ do
> +@@ -5952,7 +6210,7 @@ do
>     test -z "$as_dir" && as_dir=.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -19708,7 +19891,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -6610,6 +6868,10 @@ else
> +@@ -5971,6 +6229,10 @@ else
>   $as_echo "no" >&6; }
>   fi
>   
> @@ -19719,7 +19902,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>     if test "x$ac_ct_AR" = x; then
>       AR="false"
>     else
> -@@ -6621,16 +6883,72 @@ ac_tool_warned=yes ;;
> +@@ -5982,25 +6244,20 @@ ac_tool_warned=yes ;;
>   esac
>       AR=$ac_ct_AR
>     fi
> @@ -19728,20 +19911,37 @@ index dca94db9c3f..26dcc4b82dd 100755
>   fi
>   
>  -test -z "$AR" && AR=ar
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
>  -test -z "$AR_FLAGS" && AR_FLAGS=cru
> ++  rm -f conftest.*
>  +: ${AR=ar}
>  +: ${AR_FLAGS=cru}
>  +
> -+
> -+
> -+
> -+
> -+
> -+
> -+
> -+
> -+
> -+
> + 
> + 
> + 
> +@@ -6011,6 +6268,63 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
> + 
> + 
> + 
>  +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE support" >&5
>  +$as_echo_n "checking for archiver @FILE support... " >&6; }
>  +if ${lt_cv_ar_at_file+:} false; then :
> @@ -19754,7 +19954,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>  +int
>  +main ()
>  +{
> - 
> ++
>  +  ;
>  +  return 0;
>  +}
> @@ -19780,23 +19980,29 @@ index dca94db9c3f..26dcc4b82dd 100755
>  +        fi
>  +      fi
>  +      rm -f conftest.* libconftest.a
> - 
> ++
>  +fi
>  +rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
> - 
> ++
>  +fi
>  +{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_ar_at_file" >&5
>  +$as_echo "$lt_cv_ar_at_file" >&6; }
> - 
> ++
>  +if test "x$lt_cv_ar_at_file" = xno; then
>  +  archiver_list_spec=
>  +else
>  +  archiver_list_spec=$lt_cv_ar_at_file
>  +fi
> ++
> ++
> ++
> ++
> ++
> ++
>   
> - 
> - 
> -@@ -6972,8 +7290,8 @@ esac
> + if test -n "$ac_tool_prefix"; then
> +   # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
> +@@ -6351,8 +6665,8 @@ esac
>   lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
>   
>   # Transform an extracted symbol line into symbol name and symbol address
> @@ -19807,7 +20013,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>   
>   # Handle CRLF in mingw tool chain
>   opt_cr=
> -@@ -7009,6 +7327,7 @@ for ac_symprfx in "" "_"; do
> +@@ -6388,6 +6702,7 @@ for ac_symprfx in "" "_"; do
>     else
>       lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
>     fi
> @@ -19815,7 +20021,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>   
>     # Check to see that the pipe works correctly.
>     pipe_works=no
> -@@ -7050,6 +7369,18 @@ _LT_EOF
> +@@ -6429,6 +6744,18 @@ _LT_EOF
>         if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
>   	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
>   	  cat <<_LT_EOF > conftest.$ac_ext
> @@ -19834,7 +20040,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>   #ifdef __cplusplus
>   extern "C" {
>   #endif
> -@@ -7061,7 +7392,7 @@ _LT_EOF
> +@@ -6440,7 +6767,7 @@ _LT_EOF
>   	  cat <<_LT_EOF >> conftest.$ac_ext
>   
>   /* The mapping between symbol names and symbols.  */
> @@ -19843,7 +20049,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>     const char *name;
>     void       *address;
>   }
> -@@ -7087,8 +7418,8 @@ static const void *lt_preloaded_setup() {
> +@@ -6466,8 +6793,8 @@ static const void *lt_preloaded_setup() {
>   _LT_EOF
>   	  # Now try linking the two files.
>   	  mv conftest.$ac_objext conftstm.$ac_objext
> @@ -19854,7 +20060,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>   	  LIBS="conftstm.$ac_objext"
>   	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
>   	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
> -@@ -7098,8 +7429,8 @@ _LT_EOF
> +@@ -6477,8 +6804,8 @@ _LT_EOF
>     test $ac_status = 0; } && test -s conftest${ac_exeext}; then
>   	    pipe_works=yes
>   	  fi
> @@ -19865,7 +20071,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>   	else
>   	  echo "cannot find nm_test_func in $nlist" >&5
>   	fi
> -@@ -7136,6 +7467,16 @@ else
> +@@ -6515,6 +6842,14 @@ else
>   $as_echo "ok" >&6; }
>   fi
>   
> @@ -19877,12 +20083,10 @@ index dca94db9c3f..26dcc4b82dd 100755
>  +fi
>  +
>  +
> -+
> -+
>   
>   
>   
> -@@ -7152,6 +7493,45 @@ fi
> +@@ -6533,6 +6868,47 @@ fi
>   
>   
>   
> @@ -19925,10 +20129,12 @@ index dca94db9c3f..26dcc4b82dd 100755
>  +
>  + { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
>  +$as_echo "${lt_sysroot:-no}" >&6; }
> ++
> ++
>   
>   
>   
> -@@ -7363,6 +7743,123 @@ esac
> +@@ -6742,6 +7118,123 @@ esac
>   
>   need_locks="$enable_libtool_lock"
>   
> @@ -20052,7 +20258,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>   
>     case $host_os in
>       rhapsody* | darwin*)
> -@@ -7926,6 +8423,8 @@ _LT_EOF
> +@@ -7305,6 +7798,8 @@ _LT_EOF
>         $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
>         echo "$AR cru libconftest.a conftest.o" >&5
>         $AR cru libconftest.a conftest.o 2>&5
> @@ -20061,7 +20267,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>         cat > conftest.c << _LT_EOF
>   int main() { return 0;}
>   _LT_EOF
> -@@ -8091,7 +8590,8 @@ fi
> +@@ -7470,7 +7965,8 @@ fi
>   LIBTOOL_DEPS="$ltmain"
>   
>   # Always use our own libtool.
> @@ -20071,7 +20277,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>   
>   
>   
> -@@ -8180,7 +8680,7 @@ aix3*)
> +@@ -7559,7 +8055,7 @@ aix3*)
>   esac
>   
>   # Global variables:
> @@ -20080,7 +20286,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>   can_build_shared=yes
>   
>   # All known linkers require a `.a' archive for static linking (except MSVC,
> -@@ -8478,8 +8978,6 @@ fi
> +@@ -7857,8 +8353,6 @@ fi
>   lt_prog_compiler_pic=
>   lt_prog_compiler_static=
>   
> @@ -20089,7 +20295,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>   
>     if test "$GCC" = yes; then
>       lt_prog_compiler_wl='-Wl,'
> -@@ -8645,6 +9143,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -8024,6 +8518,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>   	lt_prog_compiler_pic='--shared'
>   	lt_prog_compiler_static='--static'
>   	;;
> @@ -20102,7 +20308,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>         pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
>           # Portland Group compilers (*not* the Pentium gcc compiler,
>   	# which looks to be a dead project)
> -@@ -8707,7 +9211,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -8086,7 +8586,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>         lt_prog_compiler_pic='-KPIC'
>         lt_prog_compiler_static='-Bstatic'
>         case $cc_basename in
> @@ -20111,7 +20317,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>   	lt_prog_compiler_wl='-Qoption ld ';;
>         *)
>   	lt_prog_compiler_wl='-Wl,';;
> -@@ -8764,13 +9268,17 @@ case $host_os in
> +@@ -8143,13 +8643,17 @@ case $host_os in
>       lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
>       ;;
>   esac
> @@ -20135,7 +20341,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>   
>   #
>   # Check to make sure the PIC flag actually works.
> -@@ -8831,6 +9339,11 @@ fi
> +@@ -8210,6 +8714,11 @@ fi
>   
>   
>   
> @@ -20147,7 +20353,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>   #
>   # Check to make sure the static flag actually works.
>   #
> -@@ -9181,7 +9694,8 @@ _LT_EOF
> +@@ -8560,7 +9069,8 @@ _LT_EOF
>         allow_undefined_flag=unsupported
>         always_export_symbols=no
>         enable_shared_with_static_runtimes=yes
> @@ -20157,7 +20363,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>   
>         if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
>           archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
> -@@ -9280,12 +9794,12 @@ _LT_EOF
> +@@ -8659,12 +9169,12 @@ _LT_EOF
>   	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
>   	  hardcode_libdir_flag_spec=
>   	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
> @@ -20172,7 +20378,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>   	  fi
>   	  ;;
>   	esac
> -@@ -9299,8 +9813,8 @@ _LT_EOF
> +@@ -8678,8 +9188,8 @@ _LT_EOF
>   	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
>   	wlarc=
>         else
> @@ -20183,7 +20389,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>         fi
>         ;;
>   
> -@@ -9318,8 +9832,8 @@ _LT_EOF
> +@@ -8697,8 +9207,8 @@ _LT_EOF
>   
>   _LT_EOF
>         elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -20194,7 +20400,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>         else
>   	ld_shlibs=no
>         fi
> -@@ -9365,8 +9879,8 @@ _LT_EOF
> +@@ -8744,8 +9254,8 @@ _LT_EOF
>   
>       *)
>         if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -20205,7 +20411,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>         else
>   	ld_shlibs=no
>         fi
> -@@ -9496,7 +10010,13 @@ _LT_EOF
> +@@ -8875,7 +9385,13 @@ _LT_EOF
>   	allow_undefined_flag='-berok'
>           # Determine the default libpath from the value encoded in an
>           # empty executable.
> @@ -20220,7 +20426,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>   /* end confdefs.h.  */
>   
>   int
> -@@ -9509,22 +10029,29 @@ main ()
> +@@ -8888,22 +9404,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>   
> @@ -20263,7 +20469,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>   
>           hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>           archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> -@@ -9536,7 +10063,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8915,7 +9438,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	else
>   	 # Determine the default libpath from the value encoded in an
>   	 # empty executable.
> @@ -20278,7 +20484,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>   /* end confdefs.h.  */
>   
>   int
> -@@ -9549,22 +10082,29 @@ main ()
> +@@ -8928,22 +9457,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>   
> @@ -20321,7 +20527,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>   
>   	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>   	  # Warning - without using the other run time loading flags,
> -@@ -9609,20 +10149,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8988,20 +9524,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>         # Microsoft Visual C++.
>         # hardcode_libdir_flag_spec is actually meaningless, as there is
>         # no search path for DLLs.
> @@ -20399,7 +20605,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>         ;;
>   
>       darwin* | rhapsody*)
> -@@ -9683,7 +10266,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9062,7 +9641,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
>       freebsd* | dragonfly*)
> @@ -20408,7 +20614,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>         hardcode_libdir_flag_spec='-R$libdir'
>         hardcode_direct=yes
>         hardcode_shlibpath_var=no
> -@@ -9691,7 +10274,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9070,7 +9649,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       hpux9*)
>         if test "$GCC" = yes; then
> @@ -20417,7 +20623,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>         else
>   	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
>         fi
> -@@ -9707,7 +10290,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9086,7 +9665,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       hpux10*)
>         if test "$GCC" = yes && test "$with_gnu_ld" = no; then
> @@ -20426,7 +20632,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>         else
>   	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
>         fi
> -@@ -9731,10 +10314,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9110,10 +9689,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
>   	  ;;
>   	ia64*)
> @@ -20439,7 +20645,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>   	  ;;
>   	esac
>         else
> -@@ -9813,23 +10396,36 @@ fi
> +@@ -9192,23 +9771,36 @@ fi
>   
>       irix5* | irix6* | nonstopux*)
>         if test "$GCC" = yes; then
> @@ -20484,7 +20690,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>         else
>   	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
>   	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
> -@@ -9914,7 +10510,7 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9293,7 +9885,7 @@ rm -f core conftest.err conftest.$ac_objext \
>       osf4* | osf5*)	# as osf3* with the addition of -msym flag
>         if test "$GCC" = yes; then
>   	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
> @@ -20493,7 +20699,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>   	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
>         else
>   	allow_undefined_flag=' -expect_unresolved \*'
> -@@ -9933,9 +10529,9 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9312,9 +9904,9 @@ rm -f core conftest.err conftest.$ac_objext \
>         no_undefined_flag=' -z defs'
>         if test "$GCC" = yes; then
>   	wlarc='${wl}'
> @@ -20505,7 +20711,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>         else
>   	case `$CC -V 2>&1` in
>   	*"Compilers 5.0"*)
> -@@ -10511,8 +11107,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -9890,8 +10482,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>     need_version=no
>     need_lib_prefix=no
>   
> @@ -20517,7 +20723,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>       library_names_spec='$libname.dll.a'
>       # DLL is installed to $(libdir)/../bin by postinstall_cmds
>       postinstall_cmds='base_file=`basename \${file}`~
> -@@ -10545,13 +11142,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -9924,13 +10517,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>         library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>         ;;
>       esac
> @@ -20590,7 +20796,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>     # FIXME: first we should search . and the directory the executable is in
>     shlibpath_var=PATH
>     ;;
> -@@ -10633,7 +11288,7 @@ haiku*)
> +@@ -10012,7 +10663,7 @@ haiku*)
>     soname_spec='${libname}${release}${shared_ext}$major'
>     shlibpath_var=LIBRARY_PATH
>     shlibpath_overrides_runpath=yes
> @@ -20599,16 +20805,16 @@ index dca94db9c3f..26dcc4b82dd 100755
>     hardcode_into_libs=yes
>     ;;
>   
> -@@ -11429,7 +12084,7 @@ else
> +@@ -10808,7 +11459,7 @@ else
>     lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>     lt_status=$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 11432 "configure"
> +-#line 10811 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>   
>   #if HAVE_DLFCN_H
> -@@ -11473,10 +12128,10 @@ else
> +@@ -10852,10 +11503,10 @@ else
>   /* When -fvisbility=hidden is used, assume the code has been annotated
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -20621,16 +20827,16 @@ index dca94db9c3f..26dcc4b82dd 100755
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -11535,7 +12190,7 @@ else
> +@@ -10914,7 +11565,7 @@ else
>     lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>     lt_status=$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 11538 "configure"
> +-#line 10917 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>   
>   #if HAVE_DLFCN_H
> -@@ -11579,10 +12234,10 @@ else
> +@@ -10958,10 +11609,10 @@ else
>   /* When -fvisbility=hidden is used, assume the code has been annotated
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -20643,7 +20849,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -13746,13 +14401,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
> +@@ -13101,13 +13752,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
>   lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>   lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>   lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -20664,7 +20870,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>   STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>   RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>   old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
> -@@ -13767,14 +14429,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
> +@@ -13122,14 +13780,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
>   lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
> @@ -20683,7 +20889,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>   DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>   NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>   LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -13807,12 +14472,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
> +@@ -13162,12 +13823,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
>   hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
>   inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
>   link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
> @@ -20697,7 +20903,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>   file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
>   variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
>   need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
> -@@ -13867,8 +14532,13 @@ reload_flag \
> +@@ -13222,8 +13883,13 @@ reload_flag \
>   OBJDUMP \
>   deplibs_check_method \
>   file_magic_cmd \
> @@ -20711,7 +20917,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>   STRIP \
>   RANLIB \
>   CC \
> -@@ -13878,12 +14548,14 @@ lt_cv_sys_global_symbol_pipe \
> +@@ -13233,12 +13899,14 @@ lt_cv_sys_global_symbol_pipe \
>   lt_cv_sys_global_symbol_to_cdecl \
>   lt_cv_sys_global_symbol_to_c_name_address \
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -20727,7 +20933,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>   DSYMUTIL \
>   NMEDIT \
>   LIPO \
> -@@ -13899,7 +14571,6 @@ no_undefined_flag \
> +@@ -13254,7 +13922,6 @@ no_undefined_flag \
>   hardcode_libdir_flag_spec \
>   hardcode_libdir_flag_spec_ld \
>   hardcode_libdir_separator \
> @@ -20735,7 +20941,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>   exclude_expsyms \
>   include_expsyms \
>   file_list_spec \
> -@@ -13935,6 +14606,7 @@ module_cmds \
> +@@ -13290,6 +13957,7 @@ module_cmds \
>   module_expsym_cmds \
>   export_symbols_cmds \
>   prelink_cmds \
> @@ -20743,7 +20949,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>   postinstall_cmds \
>   postuninstall_cmds \
>   finish_cmds \
> -@@ -14700,7 +15372,8 @@ $as_echo X"$file" |
> +@@ -14055,7 +14723,8 @@ $as_echo X"$file" |
>   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>   #
>   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -20753,7 +20959,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>   #   Written by Gordon Matzigkeit, 1996
>   #
>   #   This file is part of GNU Libtool.
> -@@ -14803,19 +15476,42 @@ SP2NL=$lt_lt_SP2NL
> +@@ -14158,19 +14827,42 @@ SP2NL=$lt_lt_SP2NL
>   # turn newlines into spaces.
>   NL2SP=$lt_lt_NL2SP
>   
> @@ -20797,7 +21003,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>   # A symbol stripping program.
>   STRIP=$lt_STRIP
>   
> -@@ -14845,6 +15541,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
> +@@ -14200,6 +14892,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
>   # Transform the output of nm in a C name address pair when lib prefix is needed.
>   global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
>   
> @@ -20810,7 +21016,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>   # The name of the directory that contains temporary libtool files.
>   objdir=$objdir
>   
> -@@ -14854,6 +15556,9 @@ MAGIC_CMD=$MAGIC_CMD
> +@@ -14209,6 +14907,9 @@ MAGIC_CMD=$MAGIC_CMD
>   # Must we lock files when doing compilation?
>   need_locks=$lt_need_locks
>   
> @@ -20820,7 +21026,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>   DSYMUTIL=$lt_DSYMUTIL
>   
> -@@ -14968,12 +15673,12 @@ with_gcc=$GCC
> +@@ -14323,12 +15024,12 @@ with_gcc=$GCC
>   # Compiler flag to turn off builtin functions.
>   no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
>   
> @@ -20836,7 +21042,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>   # Compiler flag to prevent dynamic linking.
>   link_static_flag=$lt_lt_prog_compiler_static
>   
> -@@ -15060,9 +15765,6 @@ inherit_rpath=$inherit_rpath
> +@@ -14415,9 +15116,6 @@ inherit_rpath=$inherit_rpath
>   # Whether libtool must link a program against all its dependency libraries.
>   link_all_deplibs=$link_all_deplibs
>   
> @@ -20846,7 +21052,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>   # Set to "yes" if exported symbols are required.
>   always_export_symbols=$always_export_symbols
>   
> -@@ -15078,6 +15780,9 @@ include_expsyms=$lt_include_expsyms
> +@@ -14433,6 +15131,9 @@ include_expsyms=$lt_include_expsyms
>   # Commands necessary for linking programs (against libraries) with templates.
>   prelink_cmds=$lt_prelink_cmds
>   
> @@ -20856,7 +21062,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>   # Specify filename containing input files.
>   file_list_spec=$lt_file_list_spec
>   
> -@@ -15110,210 +15815,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
> +@@ -14465,210 +15166,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
>     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>     # text mode, it properly converts lines to CR/LF.  This bash problem
>     # is reportedly fixed, but why not run on old versions too?
> @@ -21231,7 +21437,7 @@ index dca94db9c3f..26dcc4b82dd 100755
>     chmod +x "$ofile"
>   
>  diff --git a/zlib/configure b/zlib/configure
> -index b124acf9259..e4075ef3a2c 100755
> +index 695819cd54b..14b5f28013a 100755
>  --- a/zlib/configure
>  +++ b/zlib/configure
>  @@ -646,8 +646,11 @@ OTOOL
> @@ -21419,7 +21625,7 @@ index b124acf9259..e4075ef3a2c 100755
>   file_magic_cmd=$lt_cv_file_magic_cmd
>   deplibs_check_method=$lt_cv_deplibs_check_method
>   test -z "$deplibs_check_method" && deplibs_check_method=unknown
> -@@ -5405,11 +5506,165 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
> +@@ -5407,6 +5508,158 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
>   
>   
>   
> @@ -21433,11 +21639,7 @@ index b124acf9259..e4075ef3a2c 100755
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
> @@ -21579,7 +21781,15 @@ index b124acf9259..e4075ef3a2c 100755
>  +
>  +
>  +
> -+if test -n "$ac_tool_prefix"; then
> + plugin_option=
> + plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
> + for plugin in $plugin_names; do
> +@@ -5421,8 +5674,10 @@ for plugin in $plugin_names; do
> + done
> + 
> + if test -n "$ac_tool_prefix"; then
> +-  # Extract the first word of "${ac_tool_prefix}ar", so it can be a program name with args.
> +-set dummy ${ac_tool_prefix}ar; ac_word=$2
>  +  for ac_prog in ar
>  +  do
>  +    # Extract the first word of "$ac_tool_prefix$ac_prog", so it can be a program name with args.
> @@ -21587,7 +21797,7 @@ index b124acf9259..e4075ef3a2c 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_AR+:} false; then :
> -@@ -5425,7 +5680,7 @@ do
> +@@ -5438,7 +5693,7 @@ do
>     test -z "$as_dir" && as_dir=.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -21596,7 +21806,7 @@ index b124acf9259..e4075ef3a2c 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -5445,11 +5700,15 @@ $as_echo "no" >&6; }
> +@@ -5458,11 +5713,15 @@ $as_echo "no" >&6; }
>   fi
>   
>   
> @@ -21615,7 +21825,7 @@ index b124acf9259..e4075ef3a2c 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_ac_ct_AR+:} false; then :
> -@@ -5465,7 +5724,7 @@ do
> +@@ -5478,7 +5737,7 @@ do
>     test -z "$as_dir" && as_dir=.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -21624,7 +21834,7 @@ index b124acf9259..e4075ef3a2c 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -5484,6 +5743,10 @@ else
> +@@ -5497,6 +5756,10 @@ else
>   $as_echo "no" >&6; }
>   fi
>   
> @@ -21635,7 +21845,7 @@ index b124acf9259..e4075ef3a2c 100755
>     if test "x$ac_ct_AR" = x; then
>       AR="false"
>     else
> -@@ -5495,16 +5758,72 @@ ac_tool_warned=yes ;;
> +@@ -5508,25 +5771,19 @@ ac_tool_warned=yes ;;
>   esac
>       AR=$ac_ct_AR
>     fi
> @@ -21644,20 +21854,36 @@ index b124acf9259..e4075ef3a2c 100755
>   fi
>   
>  -test -z "$AR" && AR=ar
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
>  -test -z "$AR_FLAGS" && AR_FLAGS=cru
> ++  rm -f conftest.*
>  +: ${AR=ar}
>  +: ${AR_FLAGS=cru}
> -+
> -+
> -+
> -+
> -+
> -+
> -+
> -+
> -+
> -+
> -+
> + 
> + 
> + 
> +@@ -5538,6 +5795,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
> + 
> + 
> + 
>  +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE support" >&5
>  +$as_echo_n "checking for archiver @FILE support... " >&6; }
>  +if ${lt_cv_ar_at_file+:} false; then :
> @@ -21670,7 +21896,7 @@ index b124acf9259..e4075ef3a2c 100755
>  +int
>  +main ()
>  +{
> - 
> ++
>  +  ;
>  +  return 0;
>  +}
> @@ -21696,23 +21922,30 @@ index b124acf9259..e4075ef3a2c 100755
>  +        fi
>  +      fi
>  +      rm -f conftest.* libconftest.a
> - 
> ++
>  +fi
>  +rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
> - 
> ++
>  +fi
>  +{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_ar_at_file" >&5
>  +$as_echo "$lt_cv_ar_at_file" >&6; }
> - 
> ++
>  +if test "x$lt_cv_ar_at_file" = xno; then
>  +  archiver_list_spec=
>  +else
>  +  archiver_list_spec=$lt_cv_ar_at_file
>  +fi
> - 
> - 
> - 
> -@@ -5846,8 +6165,8 @@ esac
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
> +@@ -5877,8 +6192,8 @@ esac
>   lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
>   
>   # Transform an extracted symbol line into symbol name and symbol address
> @@ -21723,7 +21956,7 @@ index b124acf9259..e4075ef3a2c 100755
>   
>   # Handle CRLF in mingw tool chain
>   opt_cr=
> -@@ -5883,6 +6202,7 @@ for ac_symprfx in "" "_"; do
> +@@ -5914,6 +6229,7 @@ for ac_symprfx in "" "_"; do
>     else
>       lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
>     fi
> @@ -21731,7 +21964,7 @@ index b124acf9259..e4075ef3a2c 100755
>   
>     # Check to see that the pipe works correctly.
>     pipe_works=no
> -@@ -5924,6 +6244,18 @@ _LT_EOF
> +@@ -5955,6 +6271,18 @@ _LT_EOF
>         if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
>   	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
>   	  cat <<_LT_EOF > conftest.$ac_ext
> @@ -21750,7 +21983,7 @@ index b124acf9259..e4075ef3a2c 100755
>   #ifdef __cplusplus
>   extern "C" {
>   #endif
> -@@ -5935,7 +6267,7 @@ _LT_EOF
> +@@ -5966,7 +6294,7 @@ _LT_EOF
>   	  cat <<_LT_EOF >> conftest.$ac_ext
>   
>   /* The mapping between symbol names and symbols.  */
> @@ -21759,7 +21992,7 @@ index b124acf9259..e4075ef3a2c 100755
>     const char *name;
>     void       *address;
>   }
> -@@ -5961,8 +6293,8 @@ static const void *lt_preloaded_setup() {
> +@@ -5992,8 +6320,8 @@ static const void *lt_preloaded_setup() {
>   _LT_EOF
>   	  # Now try linking the two files.
>   	  mv conftest.$ac_objext conftstm.$ac_objext
> @@ -21770,7 +22003,7 @@ index b124acf9259..e4075ef3a2c 100755
>   	  LIBS="conftstm.$ac_objext"
>   	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
>   	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
> -@@ -5972,8 +6304,8 @@ _LT_EOF
> +@@ -6003,8 +6331,8 @@ _LT_EOF
>     test $ac_status = 0; } && test -s conftest${ac_exeext}; then
>   	    pipe_works=yes
>   	  fi
> @@ -21781,7 +22014,7 @@ index b124acf9259..e4075ef3a2c 100755
>   	else
>   	  echo "cannot find nm_test_func in $nlist" >&5
>   	fi
> -@@ -6010,6 +6342,19 @@ else
> +@@ -6041,6 +6369,17 @@ else
>   $as_echo "ok" >&6; }
>   fi
>   
> @@ -21796,15 +22029,15 @@ index b124acf9259..e4075ef3a2c 100755
>  +
>  +
>  +
> -+
> -+
>   
>   
>   
> -@@ -6027,6 +6372,41 @@ fi
> +@@ -6058,6 +6397,43 @@ fi
>   
>   
>   
> ++
> ++
>  +
>  +
>  +
> @@ -21843,7 +22076,7 @@ index b124acf9259..e4075ef3a2c 100755
>   
>   
>   
> -@@ -6241,6 +6621,123 @@ esac
> +@@ -6272,6 +6648,123 @@ esac
>   
>   need_locks="$enable_libtool_lock"
>   
> @@ -21967,7 +22200,7 @@ index b124acf9259..e4075ef3a2c 100755
>   
>     case $host_os in
>       rhapsody* | darwin*)
> -@@ -6807,6 +7304,8 @@ _LT_EOF
> +@@ -6838,6 +7331,8 @@ _LT_EOF
>         $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
>         echo "$AR cru libconftest.a conftest.o" >&5
>         $AR cru libconftest.a conftest.o 2>&5
> @@ -21976,7 +22209,7 @@ index b124acf9259..e4075ef3a2c 100755
>         cat > conftest.c << _LT_EOF
>   int main() { return 0;}
>   _LT_EOF
> -@@ -7269,7 +7768,8 @@ fi
> +@@ -7300,7 +7795,8 @@ fi
>   LIBTOOL_DEPS="$ltmain"
>   
>   # Always use our own libtool.
> @@ -21986,7 +22219,7 @@ index b124acf9259..e4075ef3a2c 100755
>   
>   
>   
> -@@ -7358,7 +7858,7 @@ aix3*)
> +@@ -7389,7 +7885,7 @@ aix3*)
>   esac
>   
>   # Global variables:
> @@ -21995,7 +22228,7 @@ index b124acf9259..e4075ef3a2c 100755
>   can_build_shared=yes
>   
>   # All known linkers require a `.a' archive for static linking (except MSVC,
> -@@ -7656,8 +8156,6 @@ fi
> +@@ -7687,8 +8183,6 @@ fi
>   lt_prog_compiler_pic=
>   lt_prog_compiler_static=
>   
> @@ -22004,7 +22237,7 @@ index b124acf9259..e4075ef3a2c 100755
>   
>     if test "$GCC" = yes; then
>       lt_prog_compiler_wl='-Wl,'
> -@@ -7823,6 +8321,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -7854,6 +8348,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>   	lt_prog_compiler_pic='--shared'
>   	lt_prog_compiler_static='--static'
>   	;;
> @@ -22017,7 +22250,7 @@ index b124acf9259..e4075ef3a2c 100755
>         pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
>           # Portland Group compilers (*not* the Pentium gcc compiler,
>   	# which looks to be a dead project)
> -@@ -7885,7 +8389,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -7916,7 +8416,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>         lt_prog_compiler_pic='-KPIC'
>         lt_prog_compiler_static='-Bstatic'
>         case $cc_basename in
> @@ -22026,7 +22259,7 @@ index b124acf9259..e4075ef3a2c 100755
>   	lt_prog_compiler_wl='-Qoption ld ';;
>         *)
>   	lt_prog_compiler_wl='-Wl,';;
> -@@ -7942,13 +8446,17 @@ case $host_os in
> +@@ -7973,13 +8473,17 @@ case $host_os in
>       lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
>       ;;
>   esac
> @@ -22050,7 +22283,7 @@ index b124acf9259..e4075ef3a2c 100755
>   
>   #
>   # Check to make sure the PIC flag actually works.
> -@@ -8009,6 +8517,11 @@ fi
> +@@ -8040,6 +8544,11 @@ fi
>   
>   
>   
> @@ -22062,7 +22295,7 @@ index b124acf9259..e4075ef3a2c 100755
>   #
>   # Check to make sure the static flag actually works.
>   #
> -@@ -8359,7 +8872,8 @@ _LT_EOF
> +@@ -8390,7 +8899,8 @@ _LT_EOF
>         allow_undefined_flag=unsupported
>         always_export_symbols=no
>         enable_shared_with_static_runtimes=yes
> @@ -22072,7 +22305,7 @@ index b124acf9259..e4075ef3a2c 100755
>   
>         if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
>           archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
> -@@ -8458,12 +8972,12 @@ _LT_EOF
> +@@ -8489,12 +8999,12 @@ _LT_EOF
>   	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
>   	  hardcode_libdir_flag_spec=
>   	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
> @@ -22087,7 +22320,7 @@ index b124acf9259..e4075ef3a2c 100755
>   	  fi
>   	  ;;
>   	esac
> -@@ -8477,8 +8991,8 @@ _LT_EOF
> +@@ -8508,8 +9018,8 @@ _LT_EOF
>   	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
>   	wlarc=
>         else
> @@ -22098,7 +22331,7 @@ index b124acf9259..e4075ef3a2c 100755
>         fi
>         ;;
>   
> -@@ -8496,8 +9010,8 @@ _LT_EOF
> +@@ -8527,8 +9037,8 @@ _LT_EOF
>   
>   _LT_EOF
>         elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -22109,7 +22342,7 @@ index b124acf9259..e4075ef3a2c 100755
>         else
>   	ld_shlibs=no
>         fi
> -@@ -8543,8 +9057,8 @@ _LT_EOF
> +@@ -8574,8 +9084,8 @@ _LT_EOF
>   
>       *)
>         if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -22120,7 +22353,7 @@ index b124acf9259..e4075ef3a2c 100755
>         else
>   	ld_shlibs=no
>         fi
> -@@ -8674,7 +9188,13 @@ _LT_EOF
> +@@ -8705,7 +9215,13 @@ _LT_EOF
>   	allow_undefined_flag='-berok'
>           # Determine the default libpath from the value encoded in an
>           # empty executable.
> @@ -22135,7 +22368,7 @@ index b124acf9259..e4075ef3a2c 100755
>     as_fn_error $? "Link tests are not allowed after GCC_NO_EXECUTABLES." "$LINENO" 5
>   fi
>   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> -@@ -8690,22 +9210,29 @@ main ()
> +@@ -8721,22 +9237,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>   
> @@ -22178,7 +22411,7 @@ index b124acf9259..e4075ef3a2c 100755
>   
>           hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>           archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> -@@ -8717,7 +9244,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8748,7 +9271,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	else
>   	 # Determine the default libpath from the value encoded in an
>   	 # empty executable.
> @@ -22193,7 +22426,7 @@ index b124acf9259..e4075ef3a2c 100755
>     as_fn_error $? "Link tests are not allowed after GCC_NO_EXECUTABLES." "$LINENO" 5
>   fi
>   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> -@@ -8733,22 +9266,29 @@ main ()
> +@@ -8764,22 +9293,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>   
> @@ -22236,7 +22469,7 @@ index b124acf9259..e4075ef3a2c 100755
>   
>   	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>   	  # Warning - without using the other run time loading flags,
> -@@ -8793,20 +9333,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8824,20 +9360,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>         # Microsoft Visual C++.
>         # hardcode_libdir_flag_spec is actually meaningless, as there is
>         # no search path for DLLs.
> @@ -22314,7 +22547,7 @@ index b124acf9259..e4075ef3a2c 100755
>         ;;
>   
>       darwin* | rhapsody*)
> -@@ -8867,7 +9450,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8898,7 +9477,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
>       freebsd* | dragonfly*)
> @@ -22323,7 +22556,7 @@ index b124acf9259..e4075ef3a2c 100755
>         hardcode_libdir_flag_spec='-R$libdir'
>         hardcode_direct=yes
>         hardcode_shlibpath_var=no
> -@@ -8875,7 +9458,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8906,7 +9485,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       hpux9*)
>         if test "$GCC" = yes; then
> @@ -22332,7 +22565,7 @@ index b124acf9259..e4075ef3a2c 100755
>         else
>   	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
>         fi
> -@@ -8891,7 +9474,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8922,7 +9501,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       hpux10*)
>         if test "$GCC" = yes && test "$with_gnu_ld" = no; then
> @@ -22341,7 +22574,7 @@ index b124acf9259..e4075ef3a2c 100755
>         else
>   	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
>         fi
> -@@ -8915,10 +9498,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -8946,10 +9525,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
>   	  ;;
>   	ia64*)
> @@ -22354,7 +22587,7 @@ index b124acf9259..e4075ef3a2c 100755
>   	  ;;
>   	esac
>         else
> -@@ -8997,26 +9580,39 @@ fi
> +@@ -9028,26 +9607,39 @@ fi
>   
>       irix5* | irix6* | nonstopux*)
>         if test "$GCC" = yes; then
> @@ -22402,7 +22635,7 @@ index b124acf9259..e4075ef3a2c 100755
>         else
>   	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
>   	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
> -@@ -9101,7 +9697,7 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9132,7 +9724,7 @@ rm -f core conftest.err conftest.$ac_objext \
>       osf4* | osf5*)	# as osf3* with the addition of -msym flag
>         if test "$GCC" = yes; then
>   	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
> @@ -22411,7 +22644,7 @@ index b124acf9259..e4075ef3a2c 100755
>   	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
>         else
>   	allow_undefined_flag=' -expect_unresolved \*'
> -@@ -9120,9 +9716,9 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9151,9 +9743,9 @@ rm -f core conftest.err conftest.$ac_objext \
>         no_undefined_flag=' -z defs'
>         if test "$GCC" = yes; then
>   	wlarc='${wl}'
> @@ -22423,7 +22656,7 @@ index b124acf9259..e4075ef3a2c 100755
>         else
>   	case `$CC -V 2>&1` in
>   	*"Compilers 5.0"*)
> -@@ -9698,8 +10294,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -9729,8 +10321,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>     need_version=no
>     need_lib_prefix=no
>   
> @@ -22435,7 +22668,7 @@ index b124acf9259..e4075ef3a2c 100755
>       library_names_spec='$libname.dll.a'
>       # DLL is installed to $(libdir)/../bin by postinstall_cmds
>       postinstall_cmds='base_file=`basename \${file}`~
> -@@ -9732,13 +10329,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -9763,13 +10356,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>         library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>         ;;
>       esac
> @@ -22508,7 +22741,7 @@ index b124acf9259..e4075ef3a2c 100755
>     # FIXME: first we should search . and the directory the executable is in
>     shlibpath_var=PATH
>     ;;
> -@@ -9820,7 +10475,7 @@ haiku*)
> +@@ -9851,7 +10502,7 @@ haiku*)
>     soname_spec='${libname}${release}${shared_ext}$major'
>     shlibpath_var=LIBRARY_PATH
>     shlibpath_overrides_runpath=yes
> @@ -22517,16 +22750,16 @@ index b124acf9259..e4075ef3a2c 100755
>     hardcode_into_libs=yes
>     ;;
>   
> -@@ -10634,7 +11289,7 @@ else
> +@@ -10665,7 +11316,7 @@ else
>     lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>     lt_status=$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 10637 "configure"
> +-#line 10668 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>   
>   #if HAVE_DLFCN_H
> -@@ -10678,10 +11333,10 @@ else
> +@@ -10709,10 +11360,10 @@ else
>   /* When -fvisbility=hidden is used, assume the code has been annotated
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -22539,16 +22772,16 @@ index b124acf9259..e4075ef3a2c 100755
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -10740,7 +11395,7 @@ else
> +@@ -10771,7 +11422,7 @@ else
>     lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>     lt_status=$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 10743 "configure"
> +-#line 10774 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>   
>   #if HAVE_DLFCN_H
> -@@ -10784,10 +11439,10 @@ else
> +@@ -10815,10 +11466,10 @@ else
>   /* When -fvisbility=hidden is used, assume the code has been annotated
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -22561,7 +22794,7 @@ index b124acf9259..e4075ef3a2c 100755
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -12257,13 +12912,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
> +@@ -12288,13 +12939,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
>   lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>   lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>   lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -22582,7 +22815,7 @@ index b124acf9259..e4075ef3a2c 100755
>   STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>   RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>   old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
> -@@ -12278,14 +12940,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
> +@@ -12309,14 +12967,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
>   lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
> @@ -22601,7 +22834,7 @@ index b124acf9259..e4075ef3a2c 100755
>   DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>   NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>   LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -12318,12 +12983,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
> +@@ -12349,12 +13010,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
>   hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
>   inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
>   link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
> @@ -22615,7 +22848,7 @@ index b124acf9259..e4075ef3a2c 100755
>   file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
>   variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
>   need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
> -@@ -12378,8 +13043,13 @@ reload_flag \
> +@@ -12409,8 +13070,13 @@ reload_flag \
>   OBJDUMP \
>   deplibs_check_method \
>   file_magic_cmd \
> @@ -22629,7 +22862,7 @@ index b124acf9259..e4075ef3a2c 100755
>   STRIP \
>   RANLIB \
>   CC \
> -@@ -12389,12 +13059,14 @@ lt_cv_sys_global_symbol_pipe \
> +@@ -12420,12 +13086,14 @@ lt_cv_sys_global_symbol_pipe \
>   lt_cv_sys_global_symbol_to_cdecl \
>   lt_cv_sys_global_symbol_to_c_name_address \
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -22645,7 +22878,7 @@ index b124acf9259..e4075ef3a2c 100755
>   DSYMUTIL \
>   NMEDIT \
>   LIPO \
> -@@ -12410,7 +13082,6 @@ no_undefined_flag \
> +@@ -12441,7 +13109,6 @@ no_undefined_flag \
>   hardcode_libdir_flag_spec \
>   hardcode_libdir_flag_spec_ld \
>   hardcode_libdir_separator \
> @@ -22653,7 +22886,7 @@ index b124acf9259..e4075ef3a2c 100755
>   exclude_expsyms \
>   include_expsyms \
>   file_list_spec \
> -@@ -12446,6 +13117,7 @@ module_cmds \
> +@@ -12477,6 +13144,7 @@ module_cmds \
>   module_expsym_cmds \
>   export_symbols_cmds \
>   prelink_cmds \
> @@ -22661,7 +22894,7 @@ index b124acf9259..e4075ef3a2c 100755
>   postinstall_cmds \
>   postuninstall_cmds \
>   finish_cmds \
> -@@ -13044,7 +13716,8 @@ $as_echo X"$file" |
> +@@ -13075,7 +13743,8 @@ $as_echo X"$file" |
>   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>   #
>   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -22671,7 +22904,7 @@ index b124acf9259..e4075ef3a2c 100755
>   #   Written by Gordon Matzigkeit, 1996
>   #
>   #   This file is part of GNU Libtool.
> -@@ -13147,19 +13820,42 @@ SP2NL=$lt_lt_SP2NL
> +@@ -13178,19 +13847,42 @@ SP2NL=$lt_lt_SP2NL
>   # turn newlines into spaces.
>   NL2SP=$lt_lt_NL2SP
>   
> @@ -22715,7 +22948,7 @@ index b124acf9259..e4075ef3a2c 100755
>   # A symbol stripping program.
>   STRIP=$lt_STRIP
>   
> -@@ -13189,6 +13885,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
> +@@ -13220,6 +13912,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
>   # Transform the output of nm in a C name address pair when lib prefix is needed.
>   global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
>   
> @@ -22728,7 +22961,7 @@ index b124acf9259..e4075ef3a2c 100755
>   # The name of the directory that contains temporary libtool files.
>   objdir=$objdir
>   
> -@@ -13198,6 +13900,9 @@ MAGIC_CMD=$MAGIC_CMD
> +@@ -13229,6 +13927,9 @@ MAGIC_CMD=$MAGIC_CMD
>   # Must we lock files when doing compilation?
>   need_locks=$lt_need_locks
>   
> @@ -22738,7 +22971,7 @@ index b124acf9259..e4075ef3a2c 100755
>   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>   DSYMUTIL=$lt_DSYMUTIL
>   
> -@@ -13312,12 +14017,12 @@ with_gcc=$GCC
> +@@ -13343,12 +14044,12 @@ with_gcc=$GCC
>   # Compiler flag to turn off builtin functions.
>   no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
>   
> @@ -22754,7 +22987,7 @@ index b124acf9259..e4075ef3a2c 100755
>   # Compiler flag to prevent dynamic linking.
>   link_static_flag=$lt_lt_prog_compiler_static
>   
> -@@ -13404,9 +14109,6 @@ inherit_rpath=$inherit_rpath
> +@@ -13435,9 +14136,6 @@ inherit_rpath=$inherit_rpath
>   # Whether libtool must link a program against all its dependency libraries.
>   link_all_deplibs=$link_all_deplibs
>   
> @@ -22764,7 +22997,7 @@ index b124acf9259..e4075ef3a2c 100755
>   # Set to "yes" if exported symbols are required.
>   always_export_symbols=$always_export_symbols
>   
> -@@ -13422,6 +14124,9 @@ include_expsyms=$lt_include_expsyms
> +@@ -13453,6 +14151,9 @@ include_expsyms=$lt_include_expsyms
>   # Commands necessary for linking programs (against libraries) with templates.
>   prelink_cmds=$lt_prelink_cmds
>   
> @@ -22774,7 +23007,7 @@ index b124acf9259..e4075ef3a2c 100755
>   # Specify filename containing input files.
>   file_list_spec=$lt_file_list_spec
>   
> -@@ -13454,210 +14159,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
> +@@ -13485,210 +14186,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
>     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>     # text mode, it properly converts lines to CR/LF.  This bash problem
>     # is reportedly fixed, but why not run on old versions too?
> diff --git a/meta/recipes-devtools/binutils/binutils/0014-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch b/meta/recipes-devtools/binutils/binutils/0014-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
> index c3a95e653a..0e4790577a 100644
> --- a/meta/recipes-devtools/binutils/binutils/0014-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0014-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
> @@ -1,4 +1,4 @@
> -From 0e026a8758a5416b548de21d5245477cf8e33ed2 Mon Sep 17 00:00:00 2001
> +From ff256618bf85acca889920a1fb63ddea64cc98bc Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 2 Mar 2015 01:42:38 +0000
>  Subject: [PATCH] Fix rpath in libtool when sysroot is enabled
> diff --git a/meta/recipes-devtools/binutils/binutils/0015-sync-with-OE-libtool-changes.patch b/meta/recipes-devtools/binutils/binutils/0015-sync-with-OE-libtool-changes.patch
> index 824d9d4605..6afd37aafc 100644
> --- a/meta/recipes-devtools/binutils/binutils/0015-sync-with-OE-libtool-changes.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0015-sync-with-OE-libtool-changes.patch
> @@ -1,4 +1,4 @@
> -From 9d41698ca97b2c5c20ac83147de1f02d385fa66f Mon Sep 17 00:00:00 2001
> +From 4b612f902c596838ab260194f840a466f8291618 Mon Sep 17 00:00:00 2001
>  From: Ross Burton <ross.burton@intel.com>
>  Date: Mon, 6 Mar 2017 23:33:27 -0800
>  Subject: [PATCH] sync with OE libtool changes
> diff --git a/meta/recipes-devtools/binutils/binutils/0016-Check-for-clang-before-checking-gcc-version.patch b/meta/recipes-devtools/binutils/binutils/0016-Check-for-clang-before-checking-gcc-version.patch
> index 0602c803db..135cd0f9ad 100644
> --- a/meta/recipes-devtools/binutils/binutils/0016-Check-for-clang-before-checking-gcc-version.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0016-Check-for-clang-before-checking-gcc-version.patch
> @@ -1,4 +1,4 @@
> -From 805e3ce0c20bee5049ff167ab6f620a230c6db51 Mon Sep 17 00:00:00 2001
> +From 707a5d49ecaa4fd722176d764251360a44fc5655 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 15 Apr 2020 14:17:20 -0700
>  Subject: [PATCH] Check for clang before checking gcc version
> @@ -18,10 +18,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   2 files changed, 2 insertions(+), 2 deletions(-)
>  
>  diff --git a/configure b/configure
> -index 7b369071141..7da69e27ce9 100755
> +index e8ba1a1d3de..e00d4764583 100755
>  --- a/configure
>  +++ b/configure
> -@@ -5093,7 +5093,7 @@ ac_compiler_gnu=$ac_cv_cxx_compiler_gnu
> +@@ -5275,7 +5275,7 @@ ac_compiler_gnu=$ac_cv_cxx_compiler_gnu
>   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
>   /* end confdefs.h.  */
>   
> @@ -31,10 +31,10 @@ index 7b369071141..7da69e27ce9 100755
>   #endif
>   int main() {}
>  diff --git a/configure.ac b/configure.ac
> -index 92f01fb3ed7..e99d67ab86b 100644
> +index 3a8a3ae1f3b..c7f08b802d0 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -1311,7 +1311,7 @@ if test "$GCC" = yes; then
> +@@ -1309,7 +1309,7 @@ if test "$GCC" = yes; then
>     AC_MSG_CHECKING([whether g++ accepts -static-libstdc++ -static-libgcc])
>     AC_LANG_PUSH(C++)
>     AC_LINK_IFELSE([AC_LANG_SOURCE([
> diff --git a/meta/recipes-devtools/binutils/binutils/0017-Add-support-for-the-DW_FORM_strx-forms-to-the-BFD-li.patch b/meta/recipes-devtools/binutils/binutils/0017-Add-support-for-the-DW_FORM_strx-forms-to-the-BFD-li.patch
> deleted file mode 100644
> index b4880e0d14..0000000000
> --- a/meta/recipes-devtools/binutils/binutils/0017-Add-support-for-the-DW_FORM_strx-forms-to-the-BFD-li.patch
> +++ /dev/null
> @@ -1,183 +0,0 @@
> -From a50c11a7a47b26e6a3e095dfb72aa2e465919fb6 Mon Sep 17 00:00:00 2001
> -From: Nick Clifton <nickc@redhat.com>
> -Date: Fri, 5 Mar 2021 17:06:59 +0000
> -Subject: [PATCH] Add support for the DW_FORM_strx* forms to the BFD library.
> -
> -	PR 27521
> -	* dwarf2.c (is_str_attr): Add DW_FORM_strx* forms.
> -	(read_indexed_string): Placeholder function.
> -	(read_attribute_value): Handle DW_FORM_strx* and DW_FORM_addrx*
> -	forms.
> -
> -Upstream-Status: Backport [https://sourceware.org/bugzilla/show_bug.cgi?id=27521]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - bfd/dwarf2.c | 105 ++++++++++++++++++++++++++++++++-------------------
> - 1 file changed, 67 insertions(+), 38 deletions(-)
> -
> -diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c
> -index 5651696c0f7..5ffcd93f54c 100644
> ---- a/bfd/dwarf2.c
> -+++ b/bfd/dwarf2.c
> -@@ -1160,8 +1160,23 @@ read_abbrevs (bfd *abfd, bfd_uint64_t offset, struct dwarf2_debug *stash,
> - static inline bfd_boolean
> - is_str_attr (enum dwarf_form form)
> - {
> --  return (form == DW_FORM_string || form == DW_FORM_strp
> --	  || form == DW_FORM_line_strp || form == DW_FORM_GNU_strp_alt);
> -+  return (form == DW_FORM_string
> -+	  || form == DW_FORM_strp
> -+	  || form == DW_FORM_strx
> -+	  || form == DW_FORM_strx1
> -+	  || form == DW_FORM_strx2
> -+	  || form == DW_FORM_strx3
> -+	  || form == DW_FORM_strx4
> -+	  || form == DW_FORM_line_strp
> -+	  || form == DW_FORM_GNU_strp_alt);
> -+}
> -+
> -+static const char *
> -+read_indexed_string (bfd_uint64_t index ATTRIBUTE_UNUSED,
> -+		     struct comp_unit * unit ATTRIBUTE_UNUSED)
> -+{
> -+  /* FIXME: Add support for indexed strings.  */
> -+  return "<indexed strings not yet supported>";
> - }
> - 
> - /* Read and fill in the value of attribute ATTR as described by FORM.
> -@@ -1192,6 +1207,9 @@ read_attribute_value (struct attribute *  attr,
> - 
> -   switch (form)
> -     {
> -+    case DW_FORM_flag_present:
> -+      attr->u.val = 1;
> -+      break;
> -     case DW_FORM_ref_addr:
> -       /* DW_FORM_ref_addr is an address in DWARF2, and an offset in
> - 	 DWARF3.  */
> -@@ -1237,15 +1255,32 @@ read_attribute_value (struct attribute *  attr,
> -       info_ptr = read_n_bytes (info_ptr, info_ptr_end, blk);
> -       attr->u.blk = blk;
> -       break;
> -+    case DW_FORM_ref1:
> -+    case DW_FORM_flag:
> -+    case DW_FORM_data1:
> -+    case DW_FORM_addrx1:
> -+      attr->u.val = read_1_byte (abfd, info_ptr, info_ptr_end);
> -+      info_ptr += 1;
> -+      break;
> -     case DW_FORM_data2:
> -+    case DW_FORM_ref2:
> -       attr->u.val = read_2_bytes (abfd, info_ptr, info_ptr_end);
> -       info_ptr += 2;
> -       break;
> -+    case DW_FORM_addrx3:
> -+      attr->u.val = read_4_bytes (abfd, info_ptr, info_ptr_end);
> -+      attr->u.val &= 0xffffff;
> -+      info_ptr += 3;
> -+      break;
> -+    case DW_FORM_ref4:
> -     case DW_FORM_data4:
> -+    case DW_FORM_addrx4:
> -       attr->u.val = read_4_bytes (abfd, info_ptr, info_ptr_end);
> -       info_ptr += 4;
> -       break;
> -     case DW_FORM_data8:
> -+    case DW_FORM_ref8:
> -+    case DW_FORM_ref_sig8:
> -       attr->u.val = read_8_bytes (abfd, info_ptr, info_ptr_end);
> -       info_ptr += 8;
> -       break;
> -@@ -1265,6 +1300,33 @@ read_attribute_value (struct attribute *  attr,
> -       attr->u.str = read_alt_indirect_string (unit, info_ptr, info_ptr_end, &bytes_read);
> -       info_ptr += bytes_read;
> -       break;
> -+    case DW_FORM_strx1:
> -+      attr->u.val = read_1_byte (abfd, info_ptr, info_ptr_end);
> -+      info_ptr += 1;
> -+      attr->u.str = (char *) read_indexed_string (attr->u.val, unit);
> -+      break;
> -+    case DW_FORM_strx2:
> -+      attr->u.val = read_2_bytes (abfd, info_ptr, info_ptr_end);
> -+      info_ptr += 2;
> -+      attr->u.str = (char *) read_indexed_string (attr->u.val, unit);
> -+      break;
> -+    case DW_FORM_strx3:
> -+      attr->u.val = read_4_bytes (abfd, info_ptr, info_ptr_end);
> -+      info_ptr += 3;
> -+      attr->u.val &= 0xffffff;
> -+      attr->u.str = (char *) read_indexed_string (attr->u.val, unit);
> -+      break;
> -+    case DW_FORM_strx4:
> -+      attr->u.val = read_4_bytes (abfd, info_ptr, info_ptr_end);
> -+      info_ptr += 4;
> -+      attr->u.str = (char *) read_indexed_string (attr->u.val, unit);
> -+      break;
> -+    case DW_FORM_strx:
> -+      attr->u.val = _bfd_safe_read_leb128 (abfd, info_ptr, &bytes_read,
> -+					 FALSE, info_ptr_end);
> -+      info_ptr += bytes_read;
> -+      attr->u.str = (char *) read_indexed_string (attr->u.val, unit);
> -+      break;
> -     case DW_FORM_exprloc:
> -     case DW_FORM_block:
> -       amt = sizeof (struct dwarf_block);
> -@@ -1287,48 +1349,14 @@ read_attribute_value (struct attribute *  attr,
> -       info_ptr = read_n_bytes (info_ptr, info_ptr_end, blk);
> -       attr->u.blk = blk;
> -       break;
> --    case DW_FORM_data1:
> --      attr->u.val = read_1_byte (abfd, info_ptr, info_ptr_end);
> --      info_ptr += 1;
> --      break;
> --    case DW_FORM_flag:
> --      attr->u.val = read_1_byte (abfd, info_ptr, info_ptr_end);
> --      info_ptr += 1;
> --      break;
> --    case DW_FORM_flag_present:
> --      attr->u.val = 1;
> --      break;
> -     case DW_FORM_sdata:
> -       attr->u.sval = _bfd_safe_read_leb128 (abfd, info_ptr, &bytes_read,
> - 					    TRUE, info_ptr_end);
> -       info_ptr += bytes_read;
> -       break;
> --    case DW_FORM_udata:
> --      attr->u.val = _bfd_safe_read_leb128 (abfd, info_ptr, &bytes_read,
> --					   FALSE, info_ptr_end);
> --      info_ptr += bytes_read;
> --      break;
> --    case DW_FORM_ref1:
> --      attr->u.val = read_1_byte (abfd, info_ptr, info_ptr_end);
> --      info_ptr += 1;
> --      break;
> --    case DW_FORM_ref2:
> --      attr->u.val = read_2_bytes (abfd, info_ptr, info_ptr_end);
> --      info_ptr += 2;
> --      break;
> --    case DW_FORM_ref4:
> --      attr->u.val = read_4_bytes (abfd, info_ptr, info_ptr_end);
> --      info_ptr += 4;
> --      break;
> --    case DW_FORM_ref8:
> --      attr->u.val = read_8_bytes (abfd, info_ptr, info_ptr_end);
> --      info_ptr += 8;
> --      break;
> --    case DW_FORM_ref_sig8:
> --      attr->u.val = read_8_bytes (abfd, info_ptr, info_ptr_end);
> --      info_ptr += 8;
> --      break;
> -     case DW_FORM_ref_udata:
> -+    case DW_FORM_udata:
> -+    case DW_FORM_addrx:
> -       attr->u.val = _bfd_safe_read_leb128 (abfd, info_ptr, &bytes_read,
> - 					   FALSE, info_ptr_end);
> -       info_ptr += bytes_read;
> -@@ -1361,6 +1389,7 @@ read_attribute_value (struct attribute *  attr,
> -       info_ptr = read_n_bytes (info_ptr, info_ptr_end, blk);
> -       attr->u.blk = blk;
> -       break;
> -+
> -     default:
> -       _bfd_error_handler (_("DWARF error: invalid or unhandled FORM value: %#x"),
> - 			  form);
> diff --git a/meta/recipes-devtools/binutils/binutils/0018-Add-DWARF-5-support-in-gold.patch b/meta/recipes-devtools/binutils/binutils/0018-Add-DWARF-5-support-in-gold.patch
> deleted file mode 100644
> index 353b680857..0000000000
> --- a/meta/recipes-devtools/binutils/binutils/0018-Add-DWARF-5-support-in-gold.patch
> +++ /dev/null
> @@ -1,1374 +0,0 @@
> -From 29dab7648672342418a9d32767e3b3182d9e6a30 Mon Sep 17 00:00:00 2001
> -From: Cary Coutant <ccoutant@gmail.com>
> -Date: Wed, 17 Mar 2021 21:31:15 -0700
> -Subject: [PATCH] Add DWARF 5 support in gold.
> -
> -elfcpp/
> -	PR gold/27246
> -	* dwarf.h (enum DW_LNCT): Add line number table content type codes.
> -	(enum DW_LINE_OPS): Reformat.
> -	(enum DW_LINE_EXTENDED_OPS): Reformat.
> -	(enum DW_CHILDREN): Reformat.
> -	(enum DW_RLE): Add range list entry types.
> -	(enum DW_SECT): Update values for DWARF 5.
> -
> -gold/
> -	PR gold/27246
> -	* dwarf_reader.cc (Dwarf_abbrev_table::do_get_abbrev): Handle
> -	DW_FORM_implicit_const.
> -	(Dwarf_ranges_table::read_ranges_table): Add version parameter;
> -	Adjust all callers.  Look for .debug_rnglists section if DWARF 5.
> -	(Dwarf_ranges_table::read_range_list_v5): New method.
> -	(Dwarf_die::read_attributes): Handle new DWARF 5 DW_FORM codes.
> -	(Dwarf_die::skip_attributes): Likewise.
> -	(Dwarf_info_reader::do_parse): Support DWARF 5 unit header format.
> -	(Dwarf_info_reader::read_3bytes_from_pointer): New method.
> -	(Sized_dwarf_line_info::Sized_dwarf_line_info): Initialize
> -	str_buffer_, str_buffer_start, reloc_map_, line_number_map_.
> -	Look for .debug_line_str section.
> -	(Sized_dwarf_line_info::read_header_prolog): Support DWARF 5 prolog.
> -	(Sized_dwarf_line_info::read_header_tables): Rename to...
> -	(Sized_dwarf_line_info::read_header_tables_v2): ... this.
> -	(Sized_dwarf_line_info::read_header_tables_v5): New method.
> -	(Sized_dwarf_line_info::process_one_opcode): Insert missing "this->".
> -	Change advance_line to signed int64_t.
> -	(Sized_dwarf_line_info::read_lines): Add endptr parameter; adjust
> -	callers.  Insert missing "this->".
> -	(Sized_dwarf_line_info::read_line_mappings): Support DWARF 5.
> -	(Sized_dwarf_line_info::do_addr2line): Add debug code.
> -	* dwarf_reader.h (Dwarf_abbrev_table::Attribute): Add implicit_const
> -	field. Adjust constructor.
> -	(Dwarf_abbrev_table::add_sttribute): Add implicit_const parameter.
> -	(Dwarf_ranges_table::read_ranges_table): Add version parameter.
> -	(Dwarf_ranges_table::read_range_list_v5): New method.
> -	(Dwarf_die): Remove unused attr_off field.
> -	(Dwarf_info_reader::Dwarf_info_reader): Initialize unit_type_ field.
> -	(Dwarf_info_reader::is_type_unit): New method.
> -	(Dwarf_info_reader::read_3bytes_from_pointer): New method.
> -	(Dwarf_info_reader::read_range_list): Call read_range_list_v5 for
> -	DWARF 5 range lists.
> -	(Dwarf_info_reader::is_type_unit_): Remove.
> -	(Dwarf_info_reader::unit_type_): New field.
> -	(Sized_dwarf_line_info::~Sized_dwarf_line_info): Delete
> -	str_buffer_start_.
> -	(Sized_dwarf_line_info::read_header_tables): Rename to...
> -	(Sized_dwarf_line_info::read_header_tables_v2): ... this.
> -	(Sized_dwarf_line_info::read_header_tables_v5): New method.
> -	(Sized_dwarf_line_info::read_lines): Add endptr parameter.
> -	(Sized_dwarf_line_info::Dwarf_line_infoHeader): Add address_size field.
> -	(Sized_dwarf_line_info::str_buffer_): New field.
> -	(Sized_dwarf_line_info::str_buffer_end_): New field.
> -	(Sized_dwarf_line_info::str_buffer_start_): New field.
> -	(Sized_dwarf_line_info::end_of_header_length_): New field.
> -	(Sized_dwarf_line_info::end_of_unit_): New field.
> -
> -Upstream-Status: Backport [5cde809b7b9 Add DWARF 5 support in gold.]
> -
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ----
> - elfcpp/dwarf.h       |  89 +++++--
> - gold/dwarf_reader.cc | 591 +++++++++++++++++++++++++++++++++++++------
> - gold/dwarf_reader.h  | 103 ++++++--
> - 3 files changed, 654 insertions(+), 129 deletions(-)
> -
> -diff --git a/elfcpp/dwarf.h b/elfcpp/dwarf.h
> -index e24347f8481..c9a9e02369c 100644
> ---- a/elfcpp/dwarf.h
> -+++ b/elfcpp/dwarf.h
> -@@ -152,35 +152,48 @@ enum DW_EH_PE
> -   DW_EH_PE_indirect = 0x80
> - };
> - 
> -+// Line number table content type codes.
> -+
> -+enum DW_LNCT
> -+{
> -+  DW_LNCT_path            = 0x1,
> -+  DW_LNCT_directory_index = 0x2,
> -+  DW_LNCT_timestamp       = 0x3,
> -+  DW_LNCT_size            = 0x4,
> -+  DW_LNCT_MD5             = 0x5,
> -+  DW_LNCT_lo_user         = 0x2000,
> -+  DW_LNCT_hi_user         = 0x3fff
> -+};
> -+
> - // Line number opcodes.
> - 
> - enum DW_LINE_OPS
> - {
> --  DW_LNS_extended_op = 0,
> --  DW_LNS_copy = 1,
> --  DW_LNS_advance_pc = 2,
> --  DW_LNS_advance_line = 3,
> --  DW_LNS_set_file = 4,
> --  DW_LNS_set_column = 5,
> --  DW_LNS_negate_stmt = 6,
> --  DW_LNS_set_basic_block = 7,
> --  DW_LNS_const_add_pc = 8,
> --  DW_LNS_fixed_advance_pc = 9,
> -+  DW_LNS_extended_op        = 0x00,
> -+  DW_LNS_copy               = 0x01,
> -+  DW_LNS_advance_pc         = 0x02,
> -+  DW_LNS_advance_line       = 0x03,
> -+  DW_LNS_set_file           = 0x04,
> -+  DW_LNS_set_column         = 0x05,
> -+  DW_LNS_negate_stmt        = 0x06,
> -+  DW_LNS_set_basic_block    = 0x07,
> -+  DW_LNS_const_add_pc       = 0x08,
> -+  DW_LNS_fixed_advance_pc   = 0x09,
> -   // DWARF 3.
> --  DW_LNS_set_prologue_end = 10,
> --  DW_LNS_set_epilogue_begin = 11,
> --  DW_LNS_set_isa = 12
> -+  DW_LNS_set_prologue_end   = 0x0a,
> -+  DW_LNS_set_epilogue_begin = 0x0b,
> -+  DW_LNS_set_isa            = 0x0c
> - };
> - 
> - // Line number extended opcodes.
> - 
> - enum DW_LINE_EXTENDED_OPS
> - {
> --  DW_LNE_end_sequence = 1,
> --  DW_LNE_set_address = 2,
> --  DW_LNE_define_file = 3,
> -+  DW_LNE_end_sequence                = 0x01,
> -+  DW_LNE_set_address                 = 0x02,
> -+  DW_LNE_define_file                 = 0x03,
> -   // DWARF4.
> --  DW_LNE_set_discriminator = 4,
> -+  DW_LNE_set_discriminator           = 0x04,
> -   // HP extensions.
> -   DW_LNE_HP_negate_is_UV_update      = 0x11,
> -   DW_LNE_HP_push_context             = 0x12,
> -@@ -191,13 +204,15 @@ enum DW_LINE_EXTENDED_OPS
> -   DW_LNE_HP_negate_post_semantics    = 0x17,
> -   DW_LNE_HP_negate_function_exit     = 0x18,
> -   DW_LNE_HP_negate_front_end_logical = 0x19,
> --  DW_LNE_HP_define_proc              = 0x20
> -+  DW_LNE_HP_define_proc              = 0x20,
> -+  DW_LNE_lo_user                     = 0x80,
> -+  DW_LNE_hi_user                     = 0xff
> - };
> - 
> - enum DW_CHILDREN
> - {
> --  DW_CHILDREN_no		     =0x00,
> --  DW_CHILDREN_yes		     =0x01
> -+  DW_CHILDREN_no  = 0,
> -+  DW_CHILDREN_yes = 1
> - };
> - 
> - // Source language names and codes.
> -@@ -247,20 +262,38 @@ enum DW_LANG
> -   DW_LANG_HP_Assembler = 0x8007
> - };
> - 
> -+// Range list entry kinds in .debug_rnglists* section.
> -+
> -+enum DW_RLE
> -+{
> -+  DW_RLE_end_of_list   = 0x00,
> -+  DW_RLE_base_addressx = 0x01,
> -+  DW_RLE_startx_endx   = 0x02,
> -+  DW_RLE_startx_length = 0x03,
> -+  DW_RLE_offset_pair   = 0x04,
> -+  DW_RLE_base_address  = 0x05,
> -+  DW_RLE_start_end     = 0x06,
> -+  DW_RLE_start_length  = 0x07
> -+};
> -+
> - // DWARF section identifiers used in the package format.
> - // Extensions for Fission.  See http://gcc.gnu.org/wiki/DebugFissionDWP.
> -+// Added (with changes) in DWARF 5.
> - 
> - enum DW_SECT
> - {
> --  DW_SECT_INFO = 1,
> --  DW_SECT_TYPES = 2,
> --  DW_SECT_ABBREV = 3,
> --  DW_SECT_LINE = 4,
> --  DW_SECT_LOC = 5,
> -+  DW_SECT_INFO        = 1,
> -+  DW_SECT_ABBREV      = 3,
> -+  DW_SECT_LINE        = 4,
> -+  DW_SECT_LOCLISTS    = 5,
> -   DW_SECT_STR_OFFSETS = 6,
> --  DW_SECT_MACINFO = 7,
> --  DW_SECT_MACRO = 8,
> --  DW_SECT_MAX = DW_SECT_MACRO,
> -+  DW_SECT_MACINFO     = 7,
> -+  DW_SECT_RNGLISTS    = 8,
> -+  DW_SECT_MAX = DW_SECT_RNGLISTS,
> -+  // These were used only for the experimental Fission support in DWARF 4.
> -+  DW_SECT_TYPES       = 2,
> -+  DW_SECT_LOC         = 5,
> -+  DW_SECT_MACRO       = 8
> - };
> - 
> - } // End namespace elfcpp.
> -diff --git a/gold/dwarf_reader.cc b/gold/dwarf_reader.cc
> -index f0e6b89bde2..83a0114ed39 100644
> ---- a/gold/dwarf_reader.cc
> -+++ b/gold/dwarf_reader.cc
> -@@ -26,6 +26,7 @@
> - #include <utility>
> - #include <vector>
> - 
> -+#include "debug.h"
> - #include "elfcpp_swap.h"
> - #include "dwarf.h"
> - #include "object.h"
> -@@ -275,6 +276,14 @@ Dwarf_abbrev_table::do_get_abbrev(unsigned int code)
> - 	  uint64_t form = read_unsigned_LEB_128(this->buffer_pos_, &len);
> - 	  this->buffer_pos_ += len;
> - 
> -+	  // For DW_FORM_implicit_const, read the constant.
> -+	  int64_t implicit_const = 0;
> -+	  if (form == elfcpp::DW_FORM_implicit_const)
> -+	    {
> -+	      implicit_const = read_signed_LEB_128(this->buffer_pos_, &len);
> -+	      this->buffer_pos_ += len;
> -+	    }
> -+
> - 	  // A (0,0) pair terminates the list.
> - 	  if (attr == 0 && form == 0)
> - 	    break;
> -@@ -282,7 +291,7 @@ Dwarf_abbrev_table::do_get_abbrev(unsigned int code)
> - 	  if (attr == elfcpp::DW_AT_sibling)
> - 	    entry->has_sibling_attribute = true;
> - 
> --	  entry->add_attribute(attr, form);
> -+	  entry->add_attribute(attr, form, implicit_const);
> - 	}
> - 
> -       this->store_abbrev(nextcode, entry);
> -@@ -302,8 +311,16 @@ Dwarf_ranges_table::read_ranges_table(
> -     Relobj* object,
> -     const unsigned char* symtab,
> -     off_t symtab_size,
> --    unsigned int ranges_shndx)
> -+    unsigned int ranges_shndx,
> -+    unsigned int version)
> - {
> -+  const std::string section_name(version < 5
> -+				 ? ".debug_ranges"
> -+				 : ".debug_rnglists");
> -+  const std::string compressed_section_name(version < 5
> -+					    ? ".zdebug_ranges"
> -+					    : ".zdebug_rnglists");
> -+
> -   // If we've already read this abbrev table, return immediately.
> -   if (this->ranges_shndx_ > 0
> -       && this->ranges_shndx_ == ranges_shndx)
> -@@ -318,7 +335,7 @@ Dwarf_ranges_table::read_ranges_table(
> -       for (unsigned int i = 1; i < object->shnum(); ++i)
> - 	{
> - 	  std::string name = object->section_name(i);
> --	  if (name == ".debug_ranges" || name == ".zdebug_ranges")
> -+	  if (name == section_name || name == compressed_section_name)
> - 	    {
> - 	      ranges_shndx = i;
> - 	      this->output_section_offset_ = object->output_section_offset(i);
> -@@ -393,7 +410,7 @@ Dwarf_ranges_table::read_range_list(
> - {
> -   Dwarf_range_list* ranges;
> - 
> --  if (!this->read_ranges_table(object, symtab, symtab_size, ranges_shndx))
> -+  if (!this->read_ranges_table(object, symtab, symtab_size, ranges_shndx, 4))
> -     return NULL;
> - 
> -   // Correct the offset.  For incremental update links, we have a
> -@@ -459,6 +476,125 @@ Dwarf_ranges_table::read_range_list(
> -   return ranges;
> - }
> - 
> -+// Read a DWARF 5 range list from section RANGES_SHNDX at offset RANGES_OFFSET.
> -+
> -+Dwarf_range_list*
> -+Dwarf_ranges_table::read_range_list_v5(
> -+    Relobj* object,
> -+    const unsigned char* symtab,
> -+    off_t symtab_size,
> -+    unsigned int addr_size,
> -+    unsigned int ranges_shndx,
> -+    off_t offset)
> -+{
> -+  Dwarf_range_list* ranges;
> -+
> -+  if (!this->read_ranges_table(object, symtab, symtab_size, ranges_shndx, 5))
> -+    return NULL;
> -+
> -+  ranges = new Dwarf_range_list();
> -+  off_t base = 0;
> -+  unsigned int shndx0 = 0;
> -+
> -+  // Correct the offset.  For incremental update links, we have a
> -+  // relocated offset that is relative to the output section, but
> -+  // here we need an offset relative to the input section.
> -+  offset -= this->output_section_offset_;
> -+
> -+  // Read the range list at OFFSET.
> -+  const unsigned char* prle = this->ranges_buffer_ + offset;
> -+  while (prle < this->ranges_buffer_end_)
> -+    {
> -+      off_t start;
> -+      off_t end;
> -+      unsigned int shndx1 = 0;
> -+      unsigned int shndx2 = 0;
> -+      size_t len;
> -+
> -+      // Read the entry type.
> -+      unsigned int rle_type = *prle++;
> -+      offset += 1;
> -+
> -+      if (rle_type == elfcpp::DW_RLE_end_of_list)
> -+	break;
> -+
> -+      switch (rle_type)
> -+	{
> -+	  case elfcpp::DW_RLE_base_address:
> -+	    if (addr_size == 4)
> -+	      base = this->dwinfo_->read_from_pointer<32>(prle);
> -+	    else
> -+	      base = this->dwinfo_->read_from_pointer<64>(prle);
> -+	    if (this->ranges_reloc_mapper_ != NULL)
> -+		shndx0 = this->lookup_reloc(offset, &base);
> -+	    prle += addr_size;
> -+	    offset += addr_size;
> -+	    break;
> -+
> -+	  case elfcpp::DW_RLE_offset_pair:
> -+	    start = read_unsigned_LEB_128(prle, &len);
> -+	    prle += len;
> -+	    offset += len;
> -+	    end = read_unsigned_LEB_128(prle, &len);
> -+	    prle += len;
> -+	    offset += len;
> -+	    if (shndx0 == 0 || object->is_section_included(shndx0))
> -+	      ranges->add(shndx0, base + start, base + end);
> -+	    break;
> -+
> -+	  case elfcpp::DW_RLE_start_end:
> -+	    if (addr_size == 4)
> -+	      {
> -+		start = this->dwinfo_->read_from_pointer<32>(prle);
> -+		end = this->dwinfo_->read_from_pointer<32>(prle + 4);
> -+	      }
> -+	    else
> -+	      {
> -+		start = this->dwinfo_->read_from_pointer<64>(prle);
> -+		end = this->dwinfo_->read_from_pointer<64>(prle + 8);
> -+	      }
> -+	    if (this->ranges_reloc_mapper_ != NULL)
> -+	      {
> -+		shndx1 = this->lookup_reloc(offset, &start);
> -+		shndx2 = this->lookup_reloc(offset + addr_size, &end);
> -+		if (shndx1 != shndx2)
> -+		  gold_warning(_("%s: DWARF info may be corrupt; offsets in a "
> -+				 "range list entry are in different sections"),
> -+			       object->name().c_str());
> -+	      }
> -+	    prle += addr_size * 2;
> -+	    offset += addr_size * 2;
> -+	    if (shndx1 == 0 || object->is_section_included(shndx1))
> -+	      ranges->add(shndx1, start, end);
> -+	    break;
> -+
> -+	  case elfcpp::DW_RLE_start_length:
> -+	    if (addr_size == 4)
> -+	      start = this->dwinfo_->read_from_pointer<32>(prle);
> -+	    else
> -+	      start = this->dwinfo_->read_from_pointer<64>(prle);
> -+	    if (this->ranges_reloc_mapper_ != NULL)
> -+	      shndx1 = this->lookup_reloc(offset, &start);
> -+	    prle += addr_size;
> -+	    offset += addr_size;
> -+	    end = start + read_unsigned_LEB_128(prle, &len);
> -+	    prle += len;
> -+	    offset += len;
> -+	    if (shndx1 == 0 || object->is_section_included(shndx1))
> -+	      ranges->add(shndx1, start, end);
> -+	    break;
> -+
> -+	  default:
> -+	    gold_warning(_("%s: DWARF range list contains "
> -+			   "unsupported entry type (%d)"),
> -+			 object->name().c_str(), rle_type);
> -+	    break;
> -+	}
> -+    }
> -+
> -+  return ranges;
> -+}
> -+
> - // Look for a relocation at offset OFF in the range table,
> - // and return the section index and offset of the target.
> - 
> -@@ -709,7 +845,13 @@ Dwarf_die::read_attributes()
> - 	  case elfcpp::DW_FORM_flag_present:
> - 	    attr_value.val.intval = 1;
> - 	    break;
> -+	  case elfcpp::DW_FORM_implicit_const:
> -+	    attr_value.val.intval =
> -+		this->abbrev_code_->attributes[i].implicit_const;
> -+	    break;
> - 	  case elfcpp::DW_FORM_strp:
> -+	  case elfcpp::DW_FORM_strp_sup:
> -+	  case elfcpp::DW_FORM_line_strp:
> - 	    {
> - 	      off_t str_off;
> - 	      if (this->dwinfo_->offset_size() == 4)
> -@@ -722,6 +864,26 @@ Dwarf_die::read_attributes()
> - 	      attr_value.val.refval = str_off;
> - 	      break;
> - 	    }
> -+	  case elfcpp::DW_FORM_strx:
> -+	  case elfcpp::DW_FORM_GNU_str_index:
> -+	    attr_value.val.uintval = read_unsigned_LEB_128(pattr, &len);
> -+	    pattr += len;
> -+	    break;
> -+	  case elfcpp::DW_FORM_strx1:
> -+	    attr_value.val.uintval = *pattr++;
> -+	    break;
> -+	  case elfcpp::DW_FORM_strx2:
> -+	    attr_value.val.uintval =
> -+		this->dwinfo_->read_from_pointer<16>(&pattr);
> -+	    break;
> -+	  case elfcpp::DW_FORM_strx3:
> -+	    attr_value.val.uintval =
> -+		this->dwinfo_->read_3bytes_from_pointer(&pattr);
> -+	    break;
> -+	  case elfcpp::DW_FORM_strx4:
> -+	    attr_value.val.uintval =
> -+		this->dwinfo_->read_from_pointer<32>(&pattr);
> -+	    break;
> - 	  case elfcpp::DW_FORM_sec_offset:
> - 	    {
> - 	      off_t sec_off;
> -@@ -747,7 +909,6 @@ Dwarf_die::read_attributes()
> - 		  this->dwinfo_->lookup_reloc(attr_off, &sec_off);
> - 	      attr_value.aux.shndx = shndx;
> - 	      attr_value.val.refval = sec_off;
> --	      ref_form = true;
> - 	      break;
> - 	    }
> - 	  case elfcpp::DW_FORM_ref_addr:
> -@@ -815,6 +976,7 @@ Dwarf_die::read_attributes()
> - 	      break;
> - 	    }
> - 	  case elfcpp::DW_FORM_ref4:
> -+	  case elfcpp::DW_FORM_ref_sup4:
> - 	    {
> - 	      off_t sec_off;
> - 	      sec_off = this->dwinfo_->read_from_pointer<32>(&pattr);
> -@@ -835,11 +997,20 @@ Dwarf_die::read_attributes()
> - 	      attr_value.val.intval = sec_off;
> - 	      break;
> - 	    }
> -+	  case elfcpp::DW_FORM_data16:
> -+	    {
> -+	      // For now, treat this as a 16-byte block.
> -+	      attr_value.val.blockval = pattr;
> -+	      attr_value.aux.blocklen = 16;
> -+	      pattr += 16;
> -+	      break;
> -+	    }
> - 	  case elfcpp::DW_FORM_ref_sig8:
> - 	    attr_value.val.uintval =
> - 		this->dwinfo_->read_from_pointer<64>(&pattr);
> - 	    break;
> - 	  case elfcpp::DW_FORM_ref8:
> -+	  case elfcpp::DW_FORM_ref_sup8:
> - 	    {
> - 	      off_t sec_off;
> - 	      sec_off = this->dwinfo_->read_from_pointer<64>(&pattr);
> -@@ -856,11 +1027,29 @@ Dwarf_die::read_attributes()
> - 	    pattr += len;
> - 	    break;
> - 	  case elfcpp::DW_FORM_udata:
> -+	    attr_value.val.uintval = read_unsigned_LEB_128(pattr, &len);
> -+	    pattr += len;
> -+	    break;
> -+	  case elfcpp::DW_FORM_addrx:
> - 	  case elfcpp::DW_FORM_GNU_addr_index:
> --	  case elfcpp::DW_FORM_GNU_str_index:
> - 	    attr_value.val.uintval = read_unsigned_LEB_128(pattr, &len);
> - 	    pattr += len;
> - 	    break;
> -+	  case elfcpp::DW_FORM_addrx1:
> -+	    attr_value.val.uintval = *pattr++;
> -+	    break;
> -+	  case elfcpp::DW_FORM_addrx2:
> -+	    attr_value.val.uintval =
> -+		this->dwinfo_->read_from_pointer<16>(&pattr);
> -+	    break;
> -+	  case elfcpp::DW_FORM_addrx3:
> -+	    attr_value.val.uintval =
> -+		this->dwinfo_->read_3bytes_from_pointer(&pattr);
> -+	    break;
> -+	  case elfcpp::DW_FORM_addrx4:
> -+	    attr_value.val.uintval =
> -+		this->dwinfo_->read_from_pointer<32>(&pattr);
> -+	    break;
> - 	  case elfcpp::DW_FORM_sdata:
> - 	    attr_value.val.intval = read_signed_LEB_128(pattr, &len);
> - 	    pattr += len;
> -@@ -870,6 +1059,11 @@ Dwarf_die::read_attributes()
> - 	    len = strlen(attr_value.val.stringval);
> - 	    pattr += len + 1;
> - 	    break;
> -+	  case elfcpp::DW_FORM_loclistx:
> -+	  case elfcpp::DW_FORM_rnglistx:
> -+	    attr_value.val.uintval = read_unsigned_LEB_128(pattr, &len);
> -+	    pattr += len;
> -+	    break;
> - 	  default:
> - 	    return false;
> - 	}
> -@@ -954,9 +1148,12 @@ Dwarf_die::skip_attributes()
> -       switch(form)
> - 	{
> - 	  case elfcpp::DW_FORM_flag_present:
> -+	  case elfcpp::DW_FORM_implicit_const:
> - 	    break;
> - 	  case elfcpp::DW_FORM_strp:
> - 	  case elfcpp::DW_FORM_sec_offset:
> -+	  case elfcpp::DW_FORM_strp_sup:
> -+	  case elfcpp::DW_FORM_line_strp:
> - 	    pattr += this->dwinfo_->offset_size();
> - 	    break;
> - 	  case elfcpp::DW_FORM_addr:
> -@@ -993,23 +1190,42 @@ Dwarf_die::skip_attributes()
> - 	  case elfcpp::DW_FORM_data1:
> - 	  case elfcpp::DW_FORM_ref1:
> - 	  case elfcpp::DW_FORM_flag:
> -+	  case elfcpp::DW_FORM_strx1:
> -+	  case elfcpp::DW_FORM_addrx1:
> - 	    pattr += 1;
> - 	    break;
> - 	  case elfcpp::DW_FORM_data2:
> - 	  case elfcpp::DW_FORM_ref2:
> -+	  case elfcpp::DW_FORM_strx2:
> -+	  case elfcpp::DW_FORM_addrx2:
> - 	    pattr += 2;
> - 	    break;
> -+	  case elfcpp::DW_FORM_strx3:
> -+	  case elfcpp::DW_FORM_addrx3:
> -+	    pattr += 3;
> -+	    break;
> - 	  case elfcpp::DW_FORM_data4:
> - 	  case elfcpp::DW_FORM_ref4:
> -+	  case elfcpp::DW_FORM_ref_sup4:
> -+	  case elfcpp::DW_FORM_strx4:
> -+	  case elfcpp::DW_FORM_addrx4:
> - 	    pattr += 4;
> - 	    break;
> - 	  case elfcpp::DW_FORM_data8:
> - 	  case elfcpp::DW_FORM_ref8:
> - 	  case elfcpp::DW_FORM_ref_sig8:
> -+	  case elfcpp::DW_FORM_ref_sup8:
> - 	    pattr += 8;
> - 	    break;
> -+	  case elfcpp::DW_FORM_data16:
> -+	    pattr += 16;
> -+	    break;
> - 	  case elfcpp::DW_FORM_ref_udata:
> - 	  case elfcpp::DW_FORM_udata:
> -+	  case elfcpp::DW_FORM_addrx:
> -+	  case elfcpp::DW_FORM_strx:
> -+	  case elfcpp::DW_FORM_loclistx:
> -+	  case elfcpp::DW_FORM_rnglistx:
> - 	  case elfcpp::DW_FORM_GNU_addr_index:
> - 	  case elfcpp::DW_FORM_GNU_str_index:
> - 	    read_unsigned_LEB_128(pattr, &len);
> -@@ -1313,6 +1529,13 @@ Dwarf_info_reader::do_parse()
> - 	  elfcpp::Swap_unaligned<16, big_endian>::readval(pinfo);
> -       pinfo += 2;
> - 
> -+      // DWARF 5: Read the unit type (1 byte) and address size (1 byte).
> -+      if (this->cu_version_ >= 5)
> -+	{
> -+	  this->unit_type_ = *pinfo++;
> -+	  this->address_size_ = *pinfo++;
> -+	}
> -+
> -       // Read debug_abbrev_offset (4 or 8 bytes).
> -       if (this->offset_size_ == 4)
> - 	abbrev_offset = elfcpp::Swap_unaligned<32, big_endian>::readval(pinfo);
> -@@ -1333,13 +1556,14 @@ Dwarf_info_reader::do_parse()
> - 	}
> -       pinfo += this->offset_size_;
> - 
> --      // Read address_size (1 byte).
> --      this->address_size_ = *pinfo++;
> -+      // DWARF 2-4: Read address_size (1 byte).
> -+      if (this->cu_version_ < 5)
> -+	this->address_size_ = *pinfo++;
> - 
> -       // For type units, read the two extra fields.
> -       uint64_t signature = 0;
> -       off_t type_offset = 0;
> --      if (this->is_type_unit_)
> -+      if (this->is_type_unit())
> -         {
> - 	  if (!this->check_buffer(pinfo + 8 + this->offset_size_))
> - 	    break;
> -@@ -1369,7 +1593,7 @@ Dwarf_info_reader::do_parse()
> -       if (root_die.tag() != 0)
> - 	{
> - 	  // Visit the CU or TU.
> --	  if (this->is_type_unit_)
> -+	  if (this->is_type_unit())
> - 	    this->visit_type_unit(section_offset + this->cu_offset_,
> - 				  cu_end - cu_start, type_offset, signature,
> - 				  &root_die);
> -@@ -1460,6 +1684,19 @@ Dwarf_info_reader::read_from_pointer(const unsigned char** source)
> -   return return_value;
> - }
> - 
> -+// Read a 3-byte integer.  Update SOURCE after read.
> -+inline typename elfcpp::Valtype_base<32>::Valtype
> -+Dwarf_info_reader::read_3bytes_from_pointer(const unsigned char** source)
> -+{
> -+  typename elfcpp::Valtype_base<32>::Valtype return_value;
> -+  if (this->object_->is_big_endian())
> -+    return_value = ((*source)[0] << 16) | ((*source)[1] << 8) | (*source)[2];
> -+  else
> -+    return_value = ((*source)[2] << 16) | ((*source)[1] << 8) | (*source)[0];
> -+  *source += 3;
> -+  return return_value;
> -+}
> -+
> - // Look for a relocation at offset ATTR_OFF in the dwarf info,
> - // and return the section index and offset of the target.
> - 
> -@@ -1561,27 +1798,40 @@ Sized_dwarf_line_info<size, big_endian>::Sized_dwarf_line_info(
> -     Object* object,
> -     unsigned int read_shndx)
> -   : data_valid_(false), buffer_(NULL), buffer_start_(NULL),
> -+    str_buffer_(NULL), str_buffer_start_(NULL),
> -     reloc_mapper_(NULL), symtab_buffer_(NULL), directories_(), files_(),
> --    current_header_index_(-1)
> -+    current_header_index_(-1), reloc_map_(), line_number_map_()
> - {
> --  unsigned int debug_shndx;
> -+  unsigned int debug_line_shndx = 0;
> -+  unsigned int debug_line_str_shndx = 0;
> - 
> --  for (debug_shndx = 1; debug_shndx < object->shnum(); ++debug_shndx)
> -+  for (unsigned int i = 1; i < object->shnum(); ++i)
> -     {
> -+      section_size_type buffer_size;
> -+      bool is_new = false;
> -+
> -       // FIXME: do this more efficiently: section_name() isn't super-fast
> --      std::string name = object->section_name(debug_shndx);
> -+      std::string name = object->section_name(i);
> -       if (name == ".debug_line" || name == ".zdebug_line")
> - 	{
> --	  section_size_type buffer_size;
> --	  bool is_new = false;
> --	  this->buffer_ = object->decompressed_section_contents(debug_shndx,
> --								&buffer_size,
> --								&is_new);
> -+	  this->buffer_ =
> -+	      object->decompressed_section_contents(i, &buffer_size, &is_new);
> - 	  if (is_new)
> - 	    this->buffer_start_ = this->buffer_;
> - 	  this->buffer_end_ = this->buffer_ + buffer_size;
> --	  break;
> -+	  debug_line_shndx = i;
> -+	}
> -+      else if (name == ".debug_line_str" || name == ".zdebug_line_str")
> -+	{
> -+	  this->str_buffer_ =
> -+	      object->decompressed_section_contents(i, &buffer_size, &is_new);
> -+	  if (is_new)
> -+	    this->str_buffer_start_ = this->str_buffer_;
> -+	  this->str_buffer_end_ = this->str_buffer_ + buffer_size;
> -+	  debug_line_str_shndx = i;
> - 	}
> -+      if (debug_line_shndx > 0 && debug_line_str_shndx > 0)
> -+        break;
> -     }
> -   if (this->buffer_ == NULL)
> -     return;
> -@@ -1594,7 +1844,7 @@ Sized_dwarf_line_info<size, big_endian>::Sized_dwarf_line_info(
> -       unsigned int reloc_sh_type = object->section_type(i);
> -       if ((reloc_sh_type == elfcpp::SHT_REL
> - 	   || reloc_sh_type == elfcpp::SHT_RELA)
> --	  && object->section_info(i) == debug_shndx)
> -+	  && object->section_info(i) == debug_line_shndx)
> - 	{
> - 	  reloc_shndx = i;
> - 	  this->track_relocs_type_ = reloc_sh_type;
> -@@ -1640,65 +1890,80 @@ Sized_dwarf_line_info<size, big_endian>::read_header_prolog(
> -   uint32_t initial_length = elfcpp::Swap_unaligned<32, big_endian>::readval(lineptr);
> -   lineptr += 4;
> - 
> --  // In DWARF2/3, if the initial length is all 1 bits, then the offset
> -+  // In DWARF, if the initial length is all 1 bits, then the offset
> -   // size is 8 and we need to read the next 8 bytes for the real length.
> -   if (initial_length == 0xffffffff)
> -     {
> --      header_.offset_size = 8;
> -+      this->header_.offset_size = 8;
> -       initial_length = elfcpp::Swap_unaligned<64, big_endian>::readval(lineptr);
> -       lineptr += 8;
> -     }
> -   else
> --    header_.offset_size = 4;
> -+    this->header_.offset_size = 4;
> - 
> --  header_.total_length = initial_length;
> -+  this->header_.total_length = initial_length;
> - 
> --  gold_assert(lineptr + header_.total_length <= buffer_end_);
> -+  this->end_of_unit_ = lineptr + initial_length;
> -+  gold_assert(this->end_of_unit_ <= buffer_end_);
> - 
> --  header_.version = elfcpp::Swap_unaligned<16, big_endian>::readval(lineptr);
> -+  this->header_.version =
> -+      elfcpp::Swap_unaligned<16, big_endian>::readval(lineptr);
> -   lineptr += 2;
> - 
> --  // Skip address size and segment selector for DWARF5.
> --  if (header_.version >= 5)
> --    lineptr += 2;
> -+  // We can only read versions 2-5 of the DWARF line number table.
> -+  // For other versions, just skip the entire line number table.
> -+  if (this->header_.version < 2 || this->header_.version > 5)
> -+    return this->end_of_unit_;
> - 
> --  if (header_.offset_size == 4)
> --    header_.prologue_length = elfcpp::Swap_unaligned<32, big_endian>::readval(lineptr);
> -+  // DWARF 5 only: address size and segment selector.
> -+  if (this->header_.version >= 5)
> -+    {
> -+      this->header_.address_size = *lineptr;
> -+      // We ignore the segment selector.
> -+      lineptr += 2;
> -+    }
> -+
> -+  if (this->header_.offset_size == 4)
> -+    this->header_.prologue_length =
> -+	elfcpp::Swap_unaligned<32, big_endian>::readval(lineptr);
> -   else
> --    header_.prologue_length = elfcpp::Swap_unaligned<64, big_endian>::readval(lineptr);
> --  lineptr += header_.offset_size;
> -+    this->header_.prologue_length =
> -+	elfcpp::Swap_unaligned<64, big_endian>::readval(lineptr);
> -+  lineptr += this->header_.offset_size;
> - 
> --  header_.min_insn_length = *lineptr;
> -+  this->end_of_header_length_ = lineptr;
> -+
> -+  this->header_.min_insn_length = *lineptr;
> -   lineptr += 1;
> - 
> --  if (header_.version < 4)
> --    header_.max_ops_per_insn = 1;
> -+  if (this->header_.version < 4)
> -+    this->header_.max_ops_per_insn = 1;
> -   else
> -     {
> -       // DWARF 4 added the maximum_operations_per_instruction field.
> --      header_.max_ops_per_insn = *lineptr;
> -+      this->header_.max_ops_per_insn = *lineptr;
> -       lineptr += 1;
> -       // TODO: Add support for values other than 1.
> --      gold_assert(header_.max_ops_per_insn == 1);
> -+      gold_assert(this->header_.max_ops_per_insn == 1);
> -     }
> - 
> --  header_.default_is_stmt = *lineptr;
> -+  this->header_.default_is_stmt = *lineptr;
> -   lineptr += 1;
> - 
> --  header_.line_base = *reinterpret_cast<const signed char*>(lineptr);
> -+  this->header_.line_base = *reinterpret_cast<const signed char*>(lineptr);
> -   lineptr += 1;
> - 
> --  header_.line_range = *lineptr;
> -+  this->header_.line_range = *lineptr;
> -   lineptr += 1;
> - 
> --  header_.opcode_base = *lineptr;
> -+  this->header_.opcode_base = *lineptr;
> -   lineptr += 1;
> - 
> --  header_.std_opcode_lengths.resize(header_.opcode_base + 1);
> --  header_.std_opcode_lengths[0] = 0;
> --  for (int i = 1; i < header_.opcode_base; i++)
> -+  this->header_.std_opcode_lengths.resize(this->header_.opcode_base + 1);
> -+  this->header_.std_opcode_lengths[0] = 0;
> -+  for (int i = 1; i < this->header_.opcode_base; i++)
> -     {
> --      header_.std_opcode_lengths[i] = *lineptr;
> -+      this->header_.std_opcode_lengths[i] = *lineptr;
> -       lineptr += 1;
> -     }
> - 
> -@@ -1707,10 +1972,11 @@ Sized_dwarf_line_info<size, big_endian>::read_header_prolog(
> - 
> - // The header for a debug_line section is mildly complicated, because
> - // the line info is very tightly encoded.
> -+// This routine is for DWARF versions 2, 3, and 4.
> - 
> - template<int size, bool big_endian>
> - const unsigned char*
> --Sized_dwarf_line_info<size, big_endian>::read_header_tables(
> -+Sized_dwarf_line_info<size, big_endian>::read_header_tables_v2(
> -     const unsigned char* lineptr)
> - {
> -   ++this->current_header_index_;
> -@@ -1775,6 +2041,169 @@ Sized_dwarf_line_info<size, big_endian>::read_header_tables(
> -   return lineptr;
> - }
> - 
> -+// This routine is for DWARF version 5.
> -+
> -+template<int size, bool big_endian>
> -+const unsigned char*
> -+Sized_dwarf_line_info<size, big_endian>::read_header_tables_v5(
> -+    const unsigned char* lineptr)
> -+{
> -+  size_t len;
> -+
> -+  ++this->current_header_index_;
> -+
> -+  gold_assert(static_cast<int>(this->directories_.size())
> -+	      == this->current_header_index_);
> -+  gold_assert(static_cast<int>(this->files_.size())
> -+	      == this->current_header_index_);
> -+
> -+  // Read the directory list.
> -+  unsigned int format_count = *lineptr;
> -+  lineptr += 1;
> -+
> -+  unsigned int *types = new unsigned int[format_count];
> -+  unsigned int *forms = new unsigned int[format_count];
> -+
> -+  for (unsigned int i = 0; i < format_count; i++)
> -+    {
> -+      types[i] = read_unsigned_LEB_128(lineptr, &len);
> -+      lineptr += len;
> -+      forms[i] = read_unsigned_LEB_128(lineptr, &len);
> -+      lineptr += len;
> -+    }
> -+
> -+  uint64_t entry_count = read_unsigned_LEB_128(lineptr, &len);
> -+  lineptr += len;
> -+  this->directories_.push_back(std::vector<std::string>(0));
> -+  std::vector<std::string>& dir_list = this->directories_.back();
> -+
> -+  for (unsigned int j = 0; j < entry_count; j++)
> -+    {
> -+      std::string dirname;
> -+
> -+      for (unsigned int i = 0; i < format_count; i++)
> -+       {
> -+	 if (types[i] == elfcpp::DW_LNCT_path)
> -+	   {
> -+	     if (forms[i] == elfcpp::DW_FORM_string)
> -+	       {
> -+		 dirname = reinterpret_cast<const char*>(lineptr);
> -+		 lineptr += dirname.size() + 1;
> -+	       }
> -+	     else if (forms[i] == elfcpp::DW_FORM_line_strp)
> -+	       {
> -+		 uint64_t offset;
> -+		 if (this->header_.offset_size == 4)
> -+		   offset =
> -+		       elfcpp::Swap_unaligned<32, big_endian>::readval(lineptr);
> -+		 else
> -+		   offset =
> -+		       elfcpp::Swap_unaligned<64, big_endian>::readval(lineptr);
> -+		 typename Reloc_map::const_iterator it
> -+		     = this->reloc_map_.find(lineptr - this->buffer_);
> -+		 if (it != reloc_map_.end())
> -+		   {
> -+		     if (this->track_relocs_type_ == elfcpp::SHT_RELA)
> -+		       offset = 0;
> -+		     offset += it->second.second;
> -+		   }
> -+		 lineptr += this->header_.offset_size;
> -+		 dirname = reinterpret_cast<const char*>(this->str_buffer_
> -+							 + offset);
> -+	       }
> -+	     else
> -+	       return lineptr;
> -+	   }
> -+	 else
> -+	   return lineptr;
> -+       }
> -+      dir_list.push_back(dirname);
> -+    }
> -+
> -+  delete[] types;
> -+  delete[] forms;
> -+
> -+  // Read the filenames list.
> -+  format_count = *lineptr;
> -+  lineptr += 1;
> -+
> -+  types = new unsigned int[format_count];
> -+  forms = new unsigned int[format_count];
> -+
> -+  for (unsigned int i = 0; i < format_count; i++)
> -+    {
> -+      types[i] = read_unsigned_LEB_128(lineptr, &len);
> -+      lineptr += len;
> -+      forms[i] = read_unsigned_LEB_128(lineptr, &len);
> -+      lineptr += len;
> -+    }
> -+
> -+  entry_count = read_unsigned_LEB_128(lineptr, &len);
> -+  lineptr += len;
> -+  this->files_.push_back(
> -+      std::vector<std::pair<int, std::string> >(0));
> -+  std::vector<std::pair<int, std::string> >& file_list = this->files_.back();
> -+
> -+  for (unsigned int j = 0; j < entry_count; j++)
> -+    {
> -+      const char* path = NULL;
> -+      int dirindex = 0;
> -+
> -+      for (unsigned int i = 0; i < format_count; i++)
> -+       {
> -+	 if (types[i] == elfcpp::DW_LNCT_path)
> -+	   {
> -+	     if (forms[i] == elfcpp::DW_FORM_string)
> -+	       {
> -+		 path = reinterpret_cast<const char*>(lineptr);
> -+		 lineptr += strlen(path) + 1;
> -+	       }
> -+	     else if (forms[i] == elfcpp::DW_FORM_line_strp)
> -+	       {
> -+		 uint64_t offset;
> -+		 if (this->header_.offset_size == 4)
> -+		   offset = elfcpp::Swap_unaligned<32, big_endian>::readval(lineptr);
> -+		 else
> -+		   offset = elfcpp::Swap_unaligned<64, big_endian>::readval(lineptr);
> -+		 typename Reloc_map::const_iterator it
> -+		     = this->reloc_map_.find(lineptr - this->buffer_);
> -+		 if (it != reloc_map_.end())
> -+		   {
> -+		     if (this->track_relocs_type_ == elfcpp::SHT_RELA)
> -+		       offset = 0;
> -+		     offset += it->second.second;
> -+		   }
> -+		 lineptr += this->header_.offset_size;
> -+		 path = reinterpret_cast<const char*>(this->str_buffer_
> -+						      + offset);
> -+	       }
> -+	     else
> -+	       return lineptr;
> -+	   }
> -+	 else if (types[i] == elfcpp::DW_LNCT_directory_index)
> -+	   {
> -+	     if (forms[i] == elfcpp::DW_FORM_udata)
> -+	       {
> -+		 dirindex = read_unsigned_LEB_128(lineptr, &len);
> -+		 lineptr += len;
> -+	       }
> -+	     else
> -+	       return lineptr;
> -+	   }
> -+	 else
> -+	   return lineptr;
> -+       }
> -+      gold_debug(DEBUG_LOCATION, "File %3d: %s",
> -+		 static_cast<int>(file_list.size()), path);
> -+      file_list.push_back(std::make_pair(dirindex, path));
> -+    }
> -+
> -+  delete[] types;
> -+  delete[] forms;
> -+
> -+  return lineptr;
> -+}
> -+
> - // Process a single opcode in the .debug.line structure.
> - 
> - template<int size, bool big_endian>
> -@@ -1790,15 +2219,15 @@ Sized_dwarf_line_info<size, big_endian>::process_one_opcode(
> - 
> -   // If the opcode is great than the opcode_base, it is a special
> -   // opcode. Most line programs consist mainly of special opcodes.
> --  if (opcode >= header_.opcode_base)
> -+  if (opcode >= this->header_.opcode_base)
> -     {
> --      opcode -= header_.opcode_base;
> --      const int advance_address = ((opcode / header_.line_range)
> --                                   * header_.min_insn_length);
> -+      opcode -= this->header_.opcode_base;
> -+      const int advance_address = ((opcode / this->header_.line_range)
> -+                                   * this->header_.min_insn_length);
> -       lsm->address += advance_address;
> - 
> --      const int advance_line = ((opcode % header_.line_range)
> --                                + header_.line_base);
> -+      const int advance_line = ((opcode % this->header_.line_range)
> -+                                + this->header_.line_base);
> -       lsm->line_num += advance_line;
> -       lsm->basic_block = true;
> -       *len = oplen;
> -@@ -1818,13 +2247,13 @@ Sized_dwarf_line_info<size, big_endian>::process_one_opcode(
> -         const uint64_t advance_address
> -             = read_unsigned_LEB_128(start, &templen);
> -         oplen += templen;
> --        lsm->address += header_.min_insn_length * advance_address;
> -+        lsm->address += this->header_.min_insn_length * advance_address;
> -       }
> -       break;
> - 
> -     case elfcpp::DW_LNS_advance_line:
> -       {
> --        const uint64_t advance_line = read_signed_LEB_128(start, &templen);
> -+        const int64_t advance_line = read_signed_LEB_128(start, &templen);
> -         oplen += templen;
> -         lsm->line_num += advance_line;
> -       }
> -@@ -1865,9 +2294,9 @@ Sized_dwarf_line_info<size, big_endian>::process_one_opcode(
> - 
> -     case elfcpp::DW_LNS_const_add_pc:
> -       {
> --        const int advance_address = (header_.min_insn_length
> --                                     * ((255 - header_.opcode_base)
> --                                        / header_.line_range));
> -+        const int advance_address = (this->header_.min_insn_length
> -+                                     * ((255 - this->header_.opcode_base)
> -+                                        / this->header_.line_range));
> -         lsm->address += advance_address;
> -       }
> -       break;
> -@@ -1950,7 +2379,7 @@ Sized_dwarf_line_info<size, big_endian>::process_one_opcode(
> -     default:
> -       {
> -         // Ignore unknown opcode  silently
> --        for (int i = 0; i < header_.std_opcode_lengths[opcode]; i++)
> -+        for (int i = 0; i < this->header_.std_opcode_lengths[opcode]; i++)
> -           {
> -             size_t templen;
> -             read_unsigned_LEB_128(start, &templen);
> -@@ -1970,28 +2399,24 @@ Sized_dwarf_line_info<size, big_endian>::process_one_opcode(
> - template<int size, bool big_endian>
> - unsigned const char*
> - Sized_dwarf_line_info<size, big_endian>::read_lines(unsigned const char* lineptr,
> -+                                                    unsigned const char* endptr,
> -                                                     unsigned int shndx)
> - {
> -   struct LineStateMachine lsm;
> - 
> --  // LENGTHSTART is the place the length field is based on.  It is the
> --  // point in the header after the initial length field.
> --  const unsigned char* lengthstart = buffer_;
> --
> --  // In 64 bit dwarf, the initial length is 12 bytes, because of the
> --  // 0xffffffff at the start.
> --  if (header_.offset_size == 8)
> --    lengthstart += 12;
> --  else
> --    lengthstart += 4;
> --
> --  while (lineptr < lengthstart + header_.total_length)
> -+  while (lineptr < endptr)
> -     {
> --      ResetLineStateMachine(&lsm, header_.default_is_stmt);
> -+      ResetLineStateMachine(&lsm, this->header_.default_is_stmt);
> -       while (!lsm.end_sequence)
> -         {
> -           size_t oplength;
> -+
> -+	  if (lineptr >= endptr)
> -+	    break;
> -+
> -           bool add_line = this->process_one_opcode(lineptr, &lsm, &oplength);
> -+          lineptr += oplength;
> -+
> -           if (add_line
> -               && (shndx == -1U || lsm.shndx == -1U || shndx == lsm.shndx))
> -             {
> -@@ -2012,11 +2437,10 @@ Sized_dwarf_line_info<size, big_endian>::read_lines(unsigned const char* lineptr
> - 		map.back().last_line_for_offset = false;
> - 	      map.push_back(entry);
> -             }
> --          lineptr += oplength;
> -         }
> -     }
> - 
> --  return lengthstart + header_.total_length;
> -+  return endptr;
> - }
> - 
> - // Read the relocations into a Reloc_map.
> -@@ -2057,9 +2481,17 @@ Sized_dwarf_line_info<size, big_endian>::read_line_mappings(unsigned int shndx)
> -     {
> -       const unsigned char* lineptr = this->buffer_;
> -       lineptr = this->read_header_prolog(lineptr);
> --      lineptr = this->read_header_tables(lineptr);
> --      lineptr = this->read_lines(lineptr, shndx);
> --      this->buffer_ = lineptr;
> -+      if (this->header_.version >= 2 && this->header_.version <= 4)
> -+	{
> -+	  lineptr = this->read_header_tables_v2(lineptr);
> -+	  lineptr = this->read_lines(lineptr, this->end_of_unit_, shndx);
> -+	}
> -+      else if (this->header_.version == 5)
> -+	{
> -+	  lineptr = this->read_header_tables_v5(lineptr);
> -+	  lineptr = this->read_lines(lineptr, this->end_of_unit_, shndx);
> -+	}
> -+      this->buffer_ = this->end_of_unit_;
> -     }
> - 
> -   // Sort the lines numbers, so addr2line can use binary search.
> -@@ -2215,6 +2647,9 @@ Sized_dwarf_line_info<size, big_endian>::do_addr2line(
> -     off_t offset,
> -     std::vector<std::string>* other_lines)
> - {
> -+  gold_debug(DEBUG_LOCATION, "do_addr2line: shndx %u offset %08x",
> -+	     shndx, static_cast<int>(offset));
> -+
> -   if (this->data_valid_ == false)
> -     return "";
> - 
> -diff --git a/gold/dwarf_reader.h b/gold/dwarf_reader.h
> -index 80b2231327c..921a1f7c876 100644
> ---- a/gold/dwarf_reader.h
> -+++ b/gold/dwarf_reader.h
> -@@ -173,11 +173,12 @@ class Dwarf_abbrev_table
> -   // An attribute list entry.
> -   struct Attribute
> -   {
> --    Attribute(unsigned int a, unsigned int f)
> --      : attr(a), form(f)
> -+    Attribute(unsigned int a, unsigned int f, int c)
> -+      : attr(a), form(f), implicit_const(c)
> -     { }
> -     unsigned int attr;
> -     unsigned int form;
> -+    int implicit_const;
> -   };
> - 
> -   // An abbrev code entry.
> -@@ -190,9 +191,9 @@ class Dwarf_abbrev_table
> -     }
> - 
> -     void
> --    add_attribute(unsigned int attr, unsigned int form)
> -+    add_attribute(unsigned int attr, unsigned int form, int implicit_const)
> -     {
> --      this->attributes.push_back(Attribute(attr, form));
> -+      this->attributes.push_back(Attribute(attr, form, implicit_const));
> -     }
> - 
> -     // The DWARF tag.
> -@@ -349,14 +350,15 @@ class Dwarf_ranges_table
> -       delete this->ranges_reloc_mapper_;
> -   }
> - 
> --  // Read the ranges table from an object file.
> -+  // Fetch the contents of the ranges table from an object file.
> -   bool
> -   read_ranges_table(Relobj* object,
> - 		    const unsigned char* symtab,
> - 		    off_t symtab_size,
> --		    unsigned int ranges_shndx);
> -+		    unsigned int ranges_shndx,
> -+		    unsigned int version);
> - 
> --  // Read the range table from an object file.
> -+  // Read the DWARF 2/3/4 range table.
> -   Dwarf_range_list*
> -   read_range_list(Relobj* object,
> - 		  const unsigned char* symtab,
> -@@ -365,6 +367,15 @@ class Dwarf_ranges_table
> - 		  unsigned int ranges_shndx,
> - 		  off_t ranges_offset);
> - 
> -+  // Read the DWARF 5 rnglists table.
> -+  Dwarf_range_list*
> -+  read_range_list_v5(Relobj* object,
> -+		     const unsigned char* symtab,
> -+		     off_t symtab_size,
> -+		     unsigned int address_size,
> -+		     unsigned int ranges_shndx,
> -+		     off_t ranges_offset);
> -+
> -   // Look for a relocation at offset OFF in the range table,
> -   // and return the section index and offset of the target.
> -   unsigned int
> -@@ -490,8 +501,6 @@ class Dwarf_die
> -       unsigned int shndx;
> -       // Block length for block forms.
> -       unsigned int blocklen;
> --      // Attribute offset for DW_FORM_strp.
> --      unsigned int attr_off;
> -     } aux;
> -   };
> - 
> -@@ -684,6 +693,10 @@ class Dwarf_die
> - // calls the various visit_xxx() methods for each header.  Clients
> - // should derive a new class from this one and implement the
> - // visit_compilation_unit() and visit_type_unit() functions.
> -+// IS_TYPE_UNIT is true if we are reading from a .debug_types section,
> -+// which is used only in DWARF 4. For DWARF 5, it will be false,
> -+// and we will determine whether it's a type init when we parse the
> -+// header.
> - 
> - class Dwarf_info_reader
> - {
> -@@ -695,7 +708,7 @@ class Dwarf_info_reader
> - 		    unsigned int shndx,
> - 		    unsigned int reloc_shndx,
> - 		    unsigned int reloc_type)
> --    : is_type_unit_(is_type_unit), object_(object), symtab_(symtab),
> -+    : object_(object), symtab_(symtab),
> -       symtab_size_(symtab_size), shndx_(shndx), reloc_shndx_(reloc_shndx),
> -       reloc_type_(reloc_type), abbrev_shndx_(0), string_shndx_(0),
> -       buffer_(NULL), buffer_end_(NULL), cu_offset_(0), cu_length_(0),
> -@@ -703,7 +716,12 @@ class Dwarf_info_reader
> -       abbrev_table_(), ranges_table_(this),
> -       reloc_mapper_(NULL), string_buffer_(NULL), string_buffer_end_(NULL),
> -       owns_string_buffer_(false), string_output_section_offset_(0)
> --  { }
> -+  {
> -+    // For DWARF 4, we infer the unit type from the section name.
> -+    // For DWARF 5, we will read this from the unit header.
> -+    this->unit_type_ =
> -+	(is_type_unit ? elfcpp::DW_UT_type : elfcpp::DW_UT_compile);
> -+  }
> - 
> -   virtual
> -   ~Dwarf_info_reader()
> -@@ -714,6 +732,13 @@ class Dwarf_info_reader
> -       delete[] this->string_buffer_;
> -   }
> - 
> -+  bool
> -+  is_type_unit() const
> -+  {
> -+    return (this->unit_type_ == elfcpp::DW_UT_type
> -+	    || this->unit_type_ == elfcpp::DW_UT_split_type);
> -+  }
> -+
> -   // Begin parsing the debug info.  This calls visit_compilation_unit()
> -   // or visit_type_unit() for each compilation or type unit found in the
> -   // section, and visit_die() for each top-level DIE.
> -@@ -745,6 +770,9 @@ class Dwarf_info_reader
> -   inline typename elfcpp::Valtype_base<valsize>::Valtype
> -   read_from_pointer(const unsigned char** source);
> - 
> -+  inline typename elfcpp::Valtype_base<32>::Valtype
> -+  read_3bytes_from_pointer(const unsigned char** source);
> -+
> -   // Look for a relocation at offset ATTR_OFF in the dwarf info,
> -   // and return the section index and offset of the target.
> -   unsigned int
> -@@ -818,12 +846,20 @@ class Dwarf_info_reader
> -   Dwarf_range_list*
> -   read_range_list(unsigned int ranges_shndx, off_t ranges_offset)
> -   {
> --    return this->ranges_table_.read_range_list(this->object_,
> --					       this->symtab_,
> --					       this->symtab_size_,
> --					       this->address_size_,
> --					       ranges_shndx,
> --					       ranges_offset);
> -+    if (this->cu_version_ < 5)
> -+      return this->ranges_table_.read_range_list(this->object_,
> -+						 this->symtab_,
> -+						 this->symtab_size_,
> -+						 this->address_size_,
> -+						 ranges_shndx,
> -+						 ranges_offset);
> -+    else
> -+      return this->ranges_table_.read_range_list_v5(this->object_,
> -+						    this->symtab_,
> -+						    this->symtab_size_,
> -+						    this->address_size_,
> -+						    ranges_shndx,
> -+						    ranges_offset);
> -   }
> - 
> -   // Return the object.
> -@@ -873,8 +909,8 @@ class Dwarf_info_reader
> -   bool
> -   do_read_string_table(unsigned int string_shndx);
> - 
> --  // True if this is a type unit; false for a compilation unit.
> --  bool is_type_unit_;
> -+  // The unit type (DW_UT_xxx).
> -+  unsigned int unit_type_;
> -   // The object containing the .debug_info or .debug_types input section.
> -   Relobj* object_;
> -   // The ELF symbol table.
> -@@ -1008,6 +1044,8 @@ class Sized_dwarf_line_info : public Dwarf_line_info
> -   {
> -     if (this->buffer_start_ != NULL)
> -       delete[] this->buffer_start_;
> -+    if (this->str_buffer_start_ != NULL)
> -+      delete[] this->str_buffer_start_;
> -   }
> - 
> -  private:
> -@@ -1030,19 +1068,23 @@ class Sized_dwarf_line_info : public Dwarf_line_info
> -   void
> -   read_relocs();
> - 
> --  // Reads the DWARF2/3 header for this line info.  Each takes as input
> -+  // Reads the DWARF header for this line info.  Each takes as input
> -   // a starting buffer position, and returns the ending position.
> -   const unsigned char*
> -   read_header_prolog(const unsigned char* lineptr);
> - 
> -   const unsigned char*
> --  read_header_tables(const unsigned char* lineptr);
> -+  read_header_tables_v2(const unsigned char* lineptr);
> -+
> -+  const unsigned char*
> -+  read_header_tables_v5(const unsigned char* lineptr);
> - 
> --  // Reads the DWARF2/3 line information.  If shndx is non-negative,
> -+  // Reads the DWARF line information.  If shndx is non-negative,
> -   // discard all line information that doesn't pertain to the given
> -   // section.
> -   const unsigned char*
> --  read_lines(const unsigned char* lineptr, unsigned int shndx);
> -+  read_lines(const unsigned char* lineptr, const unsigned char* endptr,
> -+	     unsigned int shndx);
> - 
> -   // Process a single line info opcode at START using the state
> -   // machine at LSM.  Return true if we should define a line using the
> -@@ -1069,6 +1111,7 @@ class Sized_dwarf_line_info : public Dwarf_line_info
> -   {
> -     off_t total_length;
> -     int version;
> -+    int address_size;
> -     off_t prologue_length;
> -     int min_insn_length; // insn stands for instruction
> -     int max_ops_per_insn; // Added in DWARF-4.
> -@@ -1089,6 +1132,20 @@ class Sized_dwarf_line_info : public Dwarf_line_info
> -   // of the buffer.
> -   const unsigned char* buffer_start_;
> - 
> -+  // str_buffer is the buffer for the line table strings.
> -+  const unsigned char* str_buffer_;
> -+  const unsigned char* str_buffer_end_;
> -+  // If the buffer was allocated temporarily, and therefore must be
> -+  // deallocated in the dtor, this contains a pointer to the start
> -+  // of the buffer.
> -+  const unsigned char* str_buffer_start_;
> -+
> -+  // Pointer to the end of the header_length field (aka prologue_length).
> -+  const unsigned char* end_of_header_length_;
> -+
> -+  // Pointer to the end of the current compilation unit.
> -+  const unsigned char* end_of_unit_;
> -+
> -   // This has relocations that point into buffer.
> -   Sized_elf_reloc_mapper<size, big_endian>* reloc_mapper_;
> -   // The type of the reloc section in track_relocs_--SHT_REL or SHT_RELA.
> diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2021-20197.patch b/meta/recipes-devtools/binutils/binutils/CVE-2021-20197.patch
> deleted file mode 100644
> index d6117b65a4..0000000000
> --- a/meta/recipes-devtools/binutils/binutils/CVE-2021-20197.patch
> +++ /dev/null
> @@ -1,388 +0,0 @@
> -From d3edaa91d4cf7202ec14342410194841e2f67f12 Mon Sep 17 00:00:00 2001
> -From: Alan Modra <amodra@gmail.com>
> -Date: Fri, 26 Feb 2021 11:30:32 +1030
> -Subject: [PATCH] Reinstate various pieces backed out from smart_rename changes
> -
> -In the interests of a stable release various last minute smart_rename
> -patches were backed out of the 2.36 branch.  The main reason to
> -reinstate some of those backed out changes here is to make necessary
> -followup fixes to commit 8e03235147a9 simple cherry-picks from
> -mainline.  A secondary reason is that ar -M support isn't fixed for
> -pr26945 without this patch.
> -
> -        PR 26945
> -        * ar.c: Don't include libbfd.h.
> -        (write_archive): Replace xmalloc+strcpy with xstrdup.
> -        * arsup.c (temp_name, real_ofd): New static variables.
> -        (ar_open): Use make_tempname and bfd_fdopenw.
> -        (ar_save): Adjust to suit ar_open changes.
> -        * objcopy.c: Don't include libbfd.h.
> -        * rename.c: Rename and reorder variables.
> -
> -(cherry picked from commit 95b91a043aeaeb546d2fea556d84a2de1e917770)
> -
> -Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=d3edaa91d4cf7202ec14342410194841e2f67f12]
> -CVE: CVE-2021-20197
> -Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> ----
> - binutils/ar.c      |   6 +-
> - binutils/arsup.c   |  37 ++++++++----
> - binutils/bucomm.h  |   3 +-
> - binutils/objcopy.c |   9 +--
> - binutils/rename.c  | 148 +++++++++++----------------------------------
> - 5 files changed, 67 insertions(+), 136 deletions(-)
> -
> -diff --git a/binutils/ar.c b/binutils/ar.c
> -index 45a34e3a6cf..44df48c5c67 100644
> ---- a/binutils/ar.c
> -+++ b/binutils/ar.c
> -@@ -25,7 +25,6 @@
> - 
> - #include "sysdep.h"
> - #include "bfd.h"
> --#include "libbfd.h"
> - #include "libiberty.h"
> - #include "progress.h"
> - #include "getopt.h"
> -@@ -1255,8 +1254,7 @@ write_archive (bfd *iarch)
> -   bfd *contents_head = iarch->archive_next;
> -   int ofd = -1;
> - 
> --  old_name = (char *) xmalloc (strlen (bfd_get_filename (iarch)) + 1);
> --  strcpy (old_name, bfd_get_filename (iarch));
> -+  old_name = xstrdup (bfd_get_filename (iarch));
> -   new_name = make_tempname (old_name, &ofd);
> - 
> -   if (new_name == NULL)
> -@@ -1308,7 +1306,7 @@ write_archive (bfd *iarch)
> -   /* We don't care if this fails; we might be creating the archive.  */
> -   bfd_close (iarch);
> - 
> --  if (smart_rename (new_name, old_name, 0) != 0)
> -+  if (smart_rename (new_name, old_name, NULL) != 0)
> -     xexit (1);
> -   free (old_name);
> -   free (new_name);
> -diff --git a/binutils/arsup.c b/binutils/arsup.c
> -index 5403a0c5d74..f7ce8f0bc82 100644
> ---- a/binutils/arsup.c
> -+++ b/binutils/arsup.c
> -@@ -42,6 +42,8 @@ extern int deterministic;
> - 
> - static bfd *obfd;
> - static char *real_name;
> -+static char *temp_name;
> -+static int real_ofd;
> - static FILE *outfile;
> - 
> - static void
> -@@ -149,27 +151,24 @@ maybequit (void)
> - void
> - ar_open (char *name, int t)
> - {
> --  char *tname;
> --  const char *bname = lbasename (name);
> --  real_name = name;
> -+  real_name = xstrdup (name);
> -+  temp_name = make_tempname (real_name, &real_ofd);
> - 
> --  /* Prepend tmp- to the beginning, to avoid file-name clashes after
> --     truncation on filesystems with limited namespaces (DOS).  */
> --  if (asprintf (&tname, "%.*stmp-%s", (int) (bname - name), name, bname) == -1)
> -+  if (temp_name == NULL)
> -     {
> --      fprintf (stderr, _("%s: Can't allocate memory for temp name (%s)\n"),
> -+      fprintf (stderr, _("%s: Can't open temporary file (%s)\n"),
> - 	       program_name, strerror(errno));
> -       maybequit ();
> -       return;
> -     }
> - 
> --  obfd = bfd_openw (tname, NULL);
> -+  obfd = bfd_fdopenw (temp_name, NULL, real_ofd);
> - 
> -   if (!obfd)
> -     {
> -       fprintf (stderr,
> - 	       _("%s: Can't open output archive %s\n"),
> --	       program_name,  tname);
> -+	       program_name, temp_name);
> - 
> -       maybequit ();
> -     }
> -@@ -344,16 +343,30 @@ ar_save (void)
> -     }
> -   else
> -     {
> --      char *ofilename = xstrdup (bfd_get_filename (obfd));
> -+      struct stat target_stat;
> - 
> -       if (deterministic > 0)
> -         obfd->flags |= BFD_DETERMINISTIC_OUTPUT;
> - 
> -       bfd_close (obfd);
> - 
> --      smart_rename (ofilename, real_name, 0);
> -+      if (stat (real_name, &target_stat) != 0)
> -+	{
> -+	  /* The temp file created in ar_open has mode 0600 as per mkstemp.
> -+	     Create the real empty output file here so smart_rename will
> -+	     update the mode according to the process umask.  */
> -+	  obfd = bfd_openw (real_name, NULL);
> -+	  if (obfd != NULL)
> -+	    {
> -+	      bfd_set_format (obfd, bfd_archive);
> -+	      bfd_close (obfd);
> -+	    }
> -+	}
> -+
> -+      smart_rename (temp_name, real_name, NULL);
> -       obfd = 0;
> --      free (ofilename);
> -+      free (temp_name);
> -+      free (real_name);
> -     }
> - }
> - 
> -diff --git a/binutils/bucomm.h b/binutils/bucomm.h
> -index 91f6a5b228f..aa7e33d8cd1 100644
> ---- a/binutils/bucomm.h
> -+++ b/binutils/bucomm.h
> -@@ -71,7 +71,8 @@ extern void print_version (const char *);
> - /* In rename.c.  */
> - extern void set_times (const char *, const struct stat *);
> - 
> --extern int smart_rename (const char *, const char *, int);
> -+extern int smart_rename (const char *, const char *, struct stat *);
> -+
> - 
> - /* In libiberty.  */
> - void *xmalloc (size_t);
> -diff --git a/binutils/objcopy.c b/binutils/objcopy.c
> -index eab3b6db585..73aa8bc2514 100644
> ---- a/binutils/objcopy.c
> -+++ b/binutils/objcopy.c
> -@@ -20,7 +20,6 @@
> - 
> - #include "sysdep.h"
> - #include "bfd.h"
> --#include "libbfd.h"
> - #include "progress.h"
> - #include "getopt.h"
> - #include "libiberty.h"
> -@@ -4861,12 +4860,10 @@ strip_main (int argc, char *argv[])
> - 		 output_target, NULL);
> -       if (status == 0)
> - 	{
> --	  if (preserve_dates)
> --	    set_times (tmpname, &statbuf);
> - 	  if (output_file != tmpname)
> - 	    status = (smart_rename (tmpname,
> - 				    output_file ? output_file : argv[i],
> --				    preserve_dates) != 0);
> -+				    preserve_dates ? &statbuf : NULL) != 0);
> - 	  if (status == 0)
> - 	    status = hold_status;
> - 	}
> -@@ -5931,11 +5928,9 @@ copy_main (int argc, char *argv[])
> - 	     output_target, input_arch);
> -   if (status == 0)
> -     {
> --      if (preserve_dates)
> --	set_times (tmpname, &statbuf);
> -       if (tmpname != output_filename)
> - 	status = (smart_rename (tmpname, input_filename,
> --				preserve_dates) != 0);
> -+				preserve_dates ? &statbuf : NULL) != 0);
> -     }
> -   else
> -     unlink_if_ordinary (tmpname);
> -diff --git a/binutils/rename.c b/binutils/rename.c
> -index 65ad5bf52c4..72a9323d72c 100644
> ---- a/binutils/rename.c
> -+++ b/binutils/rename.c
> -@@ -24,14 +24,9 @@
> - 
> - #ifdef HAVE_GOOD_UTIME_H
> - #include <utime.h>
> --#else /* ! HAVE_GOOD_UTIME_H */
> --#ifdef HAVE_UTIMES
> -+#elif defined HAVE_UTIMES
> - #include <sys/time.h>
> --#endif /* HAVE_UTIMES */
> --#endif /* ! HAVE_GOOD_UTIME_H */
> --
> --#if ! defined (_WIN32) || defined (__CYGWIN32__)
> --static int simple_copy (const char *, const char *);
> -+#endif
> - 
> - /* The number of bytes to copy at once.  */
> - #define COPY_BUF 8192
> -@@ -82,7 +77,6 @@ simple_copy (const char *from, const char *to)
> -     }
> -   return 0;
> - }
> --#endif /* __CYGWIN32__ or not _WIN32 */
> - 
> - /* Set the times of the file DESTINATION to be the same as those in
> -    STATBUF.  */
> -@@ -91,122 +85,52 @@ void
> - set_times (const char *destination, const struct stat *statbuf)
> - {
> -   int result;
> --
> --  {
> - #ifdef HAVE_GOOD_UTIME_H
> --    struct utimbuf tb;
> --
> --    tb.actime = statbuf->st_atime;
> --    tb.modtime = statbuf->st_mtime;
> --    result = utime (destination, &tb);
> --#else /* ! HAVE_GOOD_UTIME_H */
> --#ifndef HAVE_UTIMES
> --    long tb[2];
> --
> --    tb[0] = statbuf->st_atime;
> --    tb[1] = statbuf->st_mtime;
> --    result = utime (destination, tb);
> --#else /* HAVE_UTIMES */
> --    struct timeval tv[2];
> --
> --    tv[0].tv_sec = statbuf->st_atime;
> --    tv[0].tv_usec = 0;
> --    tv[1].tv_sec = statbuf->st_mtime;
> --    tv[1].tv_usec = 0;
> --    result = utimes (destination, tv);
> --#endif /* HAVE_UTIMES */
> --#endif /* ! HAVE_GOOD_UTIME_H */
> --  }
> -+  struct utimbuf tb;
> -+
> -+  tb.actime = statbuf->st_atime;
> -+  tb.modtime = statbuf->st_mtime;
> -+  result = utime (destination, &tb);
> -+#elif defined HAVE_UTIMES
> -+  struct timeval tv[2];
> -+
> -+  tv[0].tv_sec = statbuf->st_atime;
> -+  tv[0].tv_usec = 0;
> -+  tv[1].tv_sec = statbuf->st_mtime;
> -+  tv[1].tv_usec = 0;
> -+  result = utimes (destination, tv);
> -+#else
> -+  long tb[2];
> -+
> -+  tb[0] = statbuf->st_atime;
> -+  tb[1] = statbuf->st_mtime;
> -+  result = utime (destination, tb);
> -+#endif
> - 
> -   if (result != 0)
> -     non_fatal (_("%s: cannot set time: %s"), destination, strerror (errno));
> - }
> - 
> --#ifndef S_ISLNK
> --#ifdef S_IFLNK
> --#define S_ISLNK(m) (((m) & S_IFMT) == S_IFLNK)
> --#else
> --#define S_ISLNK(m) 0
> --#define lstat stat
> --#endif
> --#endif
> --
> --/* Rename FROM to TO, copying if TO is a link.
> --   Return 0 if ok, -1 if error.  */
> -+/* Copy FROM to TO.  TARGET_STAT has the file status that, if non-NULL,
> -+   is used to fix up timestamps.  Return 0 if ok, -1 if error.
> -+   At one time this function renamed files, but file permissions are
> -+   tricky to update given the number of different schemes used by
> -+   various systems.  So now we just copy.  */
> - 
> - int
> --smart_rename (const char *from, const char *to, int preserve_dates ATTRIBUTE_UNUSED)
> -+smart_rename (const char *from, const char *to,
> -+	      struct stat *target_stat)
> - {
> --  bfd_boolean exists;
> --  struct stat s;
> --  int ret = 0;
> --
> --  exists = lstat (to, &s) == 0;
> --
> --#if defined (_WIN32) && !defined (__CYGWIN32__)
> --  /* Win32, unlike unix, will not erase `to' in `rename(from, to)' but
> --     fail instead.  Also, chown is not present.  */
> -+  int ret;
> - 
> --  if (exists)
> --    remove (to);
> --
> --  ret = rename (from, to);
> -+  ret = simple_copy (from, to);
> -   if (ret != 0)
> --    {
> --      /* We have to clean up here.  */
> --      non_fatal (_("unable to rename '%s'; reason: %s"), to, strerror (errno));
> --      unlink (from);
> --    }
> --#else
> --  /* Use rename only if TO is not a symbolic link and has
> --     only one hard link, and we have permission to write to it.  */
> --  if (! exists
> --      || (!S_ISLNK (s.st_mode)
> --	  && S_ISREG (s.st_mode)
> --	  && (s.st_mode & S_IWUSR)
> --	  && s.st_nlink == 1)
> --      )
> --    {
> --      ret = rename (from, to);
> --      if (ret == 0)
> --	{
> --	  if (exists)
> --	    {
> --	      /* Try to preserve the permission bits and ownership of
> --		 TO.  First get the mode right except for the setuid
> --		 bit.  Then change the ownership.  Then fix the setuid
> --		 bit.  We do the chmod before the chown because if the
> --		 chown succeeds, and we are a normal user, we won't be
> --		 able to do the chmod afterward.  We don't bother to
> --		 fix the setuid bit first because that might introduce
> --		 a fleeting security problem, and because the chown
> --		 will clear the setuid bit anyhow.  We only fix the
> --		 setuid bit if the chown succeeds, because we don't
> --		 want to introduce an unexpected setuid file owned by
> --		 the user running objcopy.  */
> --	      chmod (to, s.st_mode & 0777);
> --	      if (chown (to, s.st_uid, s.st_gid) >= 0)
> --		chmod (to, s.st_mode & 07777);
> --	    }
> --	}
> --      else
> --	{
> --	  /* We have to clean up here.  */
> --	  non_fatal (_("unable to rename '%s'; reason: %s"), to, strerror (errno));
> --	  unlink (from);
> --	}
> --    }
> --  else
> --    {
> --      ret = simple_copy (from, to);
> --      if (ret != 0)
> --	non_fatal (_("unable to copy file '%s'; reason: %s"), to, strerror (errno));
> -+    non_fatal (_("unable to copy file '%s'; reason: %s"),
> -+	       to, strerror (errno));
> - 
> --      if (preserve_dates)
> --	set_times (to, &s);
> --      unlink (from);
> --    }
> --#endif /* _WIN32 && !__CYGWIN32__ */
> -+  if (target_stat != NULL)
> -+    set_times (to, target_stat);
> -+  unlink (from);
> - 
> -   return ret;
> - }
> --- 
> -2.17.1
> -
> diff --git a/meta/recipes-devtools/binutils/binutils_2.36.bb b/meta/recipes-devtools/binutils/binutils_2.37.bb
> similarity index 100%
> rename from meta/recipes-devtools/binutils/binutils_2.36.bb
> rename to meta/recipes-devtools/binutils/binutils_2.37.bb
> -- 
> 2.32.0
> 

> 
> 
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

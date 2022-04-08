X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Date: Fri, 8 Apr 2022 16:54:17 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] gcc: upgrade 11.2 -> current 12 snapshot
Message-ID: <YlBMmV0VIbFhOcVI@mail.local>
References: <20220407132634.2115343-1-bernhard.rosenkraenzer.ext@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220407132634.2115343-1-bernhard.rosenkraenzer.ext@huawei.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
List-id: <openembedded-core.lists.openembedded.org>
To: bernhard.rosenkraenzer.ext@huawei.com
Cc: openembedded-core@lists.openembedded.org, raj.khem@gmail.com

Hello,

I gave that a pass on the autobuilders:
https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3489

There are a few packages that needs fixing but this is not too bad.

On 07/04/2022 15:26:34+0200, Bernhard Rosenkr=E4nzer via lists.openembedded=
.org wrote:
> gcc 12 is expected to be released this month or early next month.
> Update so we're prepared.
> This keeps/ports all patches currently applied to 11.2 that haven't
> landed upstream yet.
>=20
> [v2: Back out the zephyr DWARF-4 workaround]
>=20
> Signed-off-by: Bernhard Rosenkr=E4nzer <bernhard.rosenkraenzer.ext@huawei=
.com>
> ---
>  .../gcc/{gcc-11.2.inc =3D> gcc-12.0.inc}        |   29 +-
>  ...ian_11.2.bb =3D> gcc-cross-canadian_12.0.bb} |    0
>  .../{gcc-cross_11.2.bb =3D> gcc-cross_12.0.bb}  |    0
>  ...-crosssdk_11.2.bb =3D> gcc-crosssdk_12.0.bb} |    0
>  meta/recipes-devtools/gcc/gcc-runtime.inc     |    2 +-
>  ...cc-runtime_11.2.bb =3D> gcc-runtime_12.0.bb} |    0
>  ...itizers_11.2.bb =3D> gcc-sanitizers_12.0.bb} |    0
>  ...{gcc-source_11.2.bb =3D> gcc-source_12.0.bb} |    0
>  .../gcc/gcc/0001-CVE-2021-35465.patch         |  138 -
>  .../gcc/gcc/0001-CVE-2021-42574.patch         | 2282 -----------------
>  .../gcc/gcc/0001-CVE-2021-46195.patch         |  128 -
>  ...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch |    9 +-
>  .../gcc/gcc/0002-CVE-2021-35465.patch         |   39 -
>  .../gcc/gcc/0002-CVE-2021-42574.patch         | 1765 -------------
>  .../0002-gcc-poison-system-directories.patch  |   17 +-
>  .../gcc/gcc/0003-CVE-2021-35465.patch         |  103 -
>  .../gcc/gcc/0003-CVE-2021-42574.patch         |  142 -
>  .../gcc/gcc/0004-CVE-2021-35465.patch         |  304 ---
>  .../gcc/gcc/0004-CVE-2021-42574.patch         |  573 -----
>  .../gcc/gcc/0009-cpp-honor-sysroot.patch      |    9 +-
>  ...gcc-Fix-argument-list-too-long-error.patch |   38 -
>  .../gcc/gcc/0018-export-CPP.patch             |  199 --
>  ...e-target-gcc-headers-can-be-included.patch |    8 +-
>  ...le-sysroot-support-for-nativesdk-gcc.patch |   41 +-
>  ...sroot-gcc-version-specific-dirs-with.patch |    9 +-
>  ...027-nios2-Define-MUSL_DYNAMIC_LINKER.patch |   31 -
>  ...using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |   26 -
>  .../0030-sync-gcc-stddef.h-with-musl.patch    |   88 -
>  ...as-for-__cpu_indicator_init-instead-.patch |   13 +-
>  ...s-Do-not-use-__LINE__-for-maintainin.patch |   71 +-
>  ...prefix-maps-before-checksumming-DIEs.patch |   95 -
>  .../gcc/0042-Fix-thread-stack-size-init.patch |   23 -
>  .../gcc/{gcc_11.2.bb =3D> gcc_12.0.bb}          |    0
>  ...initial_11.2.bb =3D> libgcc-initial_12.0.bb} |    0
>  .../gcc/{libgcc_11.2.bb =3D> libgcc_12.0.bb}    |    0
>  ...ibgfortran_11.2.bb =3D> libgfortran_12.0.bb} |    0
>  36 files changed, 101 insertions(+), 6081 deletions(-)
>  rename meta/recipes-devtools/gcc/{gcc-11.2.inc =3D> gcc-12.0.inc} (77%)
>  rename meta/recipes-devtools/gcc/{gcc-cross-canadian_11.2.bb =3D> gcc-cr=
oss-canadian_12.0.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-cross_11.2.bb =3D> gcc-cross_12.0.=
bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-crosssdk_11.2.bb =3D> gcc-crosssdk=
_12.0.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-runtime_11.2.bb =3D> gcc-runtime_1=
2.0.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-sanitizers_11.2.bb =3D> gcc-saniti=
zers_12.0.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-source_11.2.bb =3D> gcc-source_12.=
0.bb} (100%)
>  delete mode 100644 meta/recipes-devtools/gcc/gcc/0001-CVE-2021-35465.pat=
ch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc/0001-CVE-2021-42574.pat=
ch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc/0001-CVE-2021-46195.pat=
ch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc/0002-CVE-2021-35465.pat=
ch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc/0002-CVE-2021-42574.pat=
ch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc/0003-CVE-2021-35465.pat=
ch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc/0003-CVE-2021-42574.pat=
ch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc/0004-CVE-2021-35465.pat=
ch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc/0004-CVE-2021-42574.pat=
ch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc/0012-gcc-Fix-argument-l=
ist-too-long-error.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc/0018-export-CPP.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc/0027-nios2-Define-MUSL_=
DYNAMIC_LINKER.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc/0029-Link-libgcc-using-=
LDFLAGS-not-just-SHLIB_LDFLAGS.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc/0030-sync-gcc-stddef.h-=
with-musl.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc/0041-apply-debug-prefix=
-maps-before-checksumming-DIEs.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc/0042-Fix-thread-stack-s=
ize-init.patch
>  rename meta/recipes-devtools/gcc/{gcc_11.2.bb =3D> gcc_12.0.bb} (100%)
>  rename meta/recipes-devtools/gcc/{libgcc-initial_11.2.bb =3D> libgcc-ini=
tial_12.0.bb} (100%)
>  rename meta/recipes-devtools/gcc/{libgcc_11.2.bb =3D> libgcc_12.0.bb} (1=
00%)
>  rename meta/recipes-devtools/gcc/{libgfortran_11.2.bb =3D> libgfortran_1=
2.0.bb} (100%)
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devtoo=
ls/gcc/gcc-12.0.inc
> similarity index 77%
> rename from meta/recipes-devtools/gcc/gcc-11.2.inc
> rename to meta/recipes-devtools/gcc/gcc-12.0.inc
> index 68e0d203fc..3b7adf5cb7 100644
> --- a/meta/recipes-devtools/gcc/gcc-11.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-12.0.inc
> @@ -2,11 +2,14 @@ require gcc-common.inc
> =20
>  # Third digit in PV should be incremented after a minor release
> =20
> -PV =3D "11.2.0"
> +PV =3D "12.0.1"
> =20
>  # BINV should be incremented to a revision after a minor gcc release
> =20
> -BINV =3D "11.2.0"
> +BINV =3D "12.0.1"
> +
> +MAJOR =3D "12"
> +SNAPSHOT =3D "20220313"
> =20
>  FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
> =20
> @@ -26,7 +29,7 @@ LIC_FILES_CHKSUM =3D "\
>  #RELEASE ?=3D "5b2ac9b40c325e9209c0bd55955db84aad4a0cc5"
>  #BASEURI ?=3D "https://github.com/gcc-mirror/gcc/archive/${RELEASE}.zip;=
downloadfilename=3Dgcc-${PV}-${RELEASE}.zip"
> =20
> -BASEURI ?=3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz \
> +BASEURI ?=3D "https://mirror.koddos.net/gcc/snapshots/${MAJOR}-${SNAPSHO=
T}/gcc-${MAJOR}-${SNAPSHOT}.tar.xz \
>             "
>  SRC_URI =3D "\
>             ${BASEURI} \
> @@ -36,43 +39,27 @@ SRC_URI =3D "\
>             file://0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-=
B.patch \
>             file://0009-cpp-honor-sysroot.patch \
>             file://0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LI=
NKE.patch \
> -           file://0012-gcc-Fix-argument-list-too-long-error.patch \
>             file://0014-libtool.patch \
>             file://0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI=
.patch \
>             file://0016-Use-the-multilib-config-files-from-B-instead-of-u=
sin.patch \
>             file://0017-Avoid-using-libdir-from-.la-which-usually-points-=
to-.patch \
> -           file://0018-export-CPP.patch \
>             file://0019-Ensure-target-gcc-headers-can-be-included.patch \
>             file://0020-Don-t-search-host-directory-during-relink-if-inst=
_pr.patch \
>             file://0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch \
>             file://0024-handle-sysroot-support-for-nativesdk-gcc.patch \
>             file://0025-Search-target-sysroot-gcc-version-specific-dirs-w=
ith.patch \
> -           file://0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch \
>             file://0028-Add-ssp_nonshared-to-link-commandline-for-musl-ta=
rge.patch \
> -           file://0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.=
patch \
> -           file://0030-sync-gcc-stddef.h-with-musl.patch \
>             file://0033-Re-introduce-spe-commandline-options.patch \
>             file://0034-libgcc_s-Use-alias-for-__cpu_indicator_init-inste=
ad-.patch \
>             file://0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintai=
nin.patch \
>             file://0036-mingw32-Enable-operation_not_supported.patch \
>             file://0037-libatomic-Do-not-enforce-march-on-aarch64.patch \
> -           file://0041-apply-debug-prefix-maps-before-checksumming-DIEs.=
patch \
>             file://0006-If-CXXFLAGS-contains-something-unsupported-by-the=
-bu.patch \
>             file://0001-Fix-install-path-of-linux64.h.patch \
> -           file://0001-CVE-2021-35465.patch \
> -           file://0002-CVE-2021-35465.patch \
> -           file://0003-CVE-2021-35465.patch \
> -           file://0004-CVE-2021-35465.patch \
> -           file://0001-CVE-2021-42574.patch \
> -           file://0002-CVE-2021-42574.patch \
> -           file://0003-CVE-2021-42574.patch \
> -           file://0004-CVE-2021-42574.patch \
> -           file://0001-CVE-2021-46195.patch \
> -           file://0042-Fix-thread-stack-size-init.patch \
>  "
> -SRC_URI[sha256sum] =3D "d08edc536b54c372a1010ff6619dd274c0f1603aa49212ba=
20f7aa2cda36fa8b"
> +SRC_URI[sha256sum] =3D "979d8cbe9b2ed2ab4434f52097754e004a207cf6541aea3e=
167c5d0f74957633"
> =20
> -S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
> +S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${MAJOR}-${SNAPSHOT}"
> =20
>  # For dev release snapshotting
>  #S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${RELEASE}"
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_11.2.bb b/meta/=
recipes-devtools/gcc/gcc-cross-canadian_12.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-cross-canadian_11.2.bb
> rename to meta/recipes-devtools/gcc/gcc-cross-canadian_12.0.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-cross_11.2.bb b/meta/recipes-d=
evtools/gcc/gcc-cross_12.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-cross_11.2.bb
> rename to meta/recipes-devtools/gcc/gcc-cross_12.0.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_11.2.bb b/meta/recipe=
s-devtools/gcc/gcc-crosssdk_12.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-crosssdk_11.2.bb
> rename to meta/recipes-devtools/gcc/gcc-crosssdk_12.0.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-dev=
tools/gcc/gcc-runtime.inc
> index e9f2cf16e8..c39a0caf8a 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -2,7 +2,7 @@ require gcc-configure-common.inc
> =20
>  SUMMARY =3D "Runtime libraries from GCC"
> =20
> -# Over-ride the LICENSE set by gcc-${PV}.inc to remove "& GPL-3.0-only"
> +# Over-ride the LICENSE set by gcc-${PV}.inc to remove "& GPLv3"
>  # All gcc-runtime packages are now covered by the runtime exception.
>  LICENSE =3D "GPL-3.0-with-GCC-exception"
> =20
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb b/meta/recipes=
-devtools/gcc/gcc-runtime_12.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-runtime_11.2.bb
> rename to meta/recipes-devtools/gcc/gcc-runtime_12.0.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_11.2.bb b/meta/reci=
pes-devtools/gcc/gcc-sanitizers_12.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-sanitizers_11.2.bb
> rename to meta/recipes-devtools/gcc/gcc-sanitizers_12.0.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-source_11.2.bb b/meta/recipes-=
devtools/gcc/gcc-source_12.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-source_11.2.bb
> rename to meta/recipes-devtools/gcc/gcc-source_12.0.bb
> diff --git a/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-35465.patch b/me=
ta/recipes-devtools/gcc/gcc/0001-CVE-2021-35465.patch
> deleted file mode 100644
> index e4aee10e37..0000000000
> --- a/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-35465.patch
> +++ /dev/null
> @@ -1,138 +0,0 @@
> -From 3929bca9ca95de9d35e82ae8828b188029e3eb70 Mon Sep 17 00:00:00 2001
> -From: Richard Earnshaw <rearnsha@arm.com>
> -Date: Fri, 11 Jun 2021 16:02:05 +0100
> -Subject: [PATCH] arm: Add command-line option for enabling CVE-2021-35465
> - mitigation [PR102035]
> -
> -Add a new option, -mfix-cmse-cve-2021-35465 and document it.  Enable it
> -automatically for cortex-m33, cortex-m35p and cortex-m55.
> -
> -gcc:
> -	PR target/102035
> -	* config/arm/arm.opt (mfix-cmse-cve-2021-35465): New option.
> -	* doc/invoke.texi (Arm Options): Document it.
> -	* config/arm/arm-cpus.in (quirk_vlldm): New feature bit.
> -	(ALL_QUIRKS): Add quirk_vlldm.
> -	(cortex-m33): Add quirk_vlldm.
> -	(cortex-m35p, cortex-m55): Likewise.
> -	* config/arm/arm.c (arm_option_override): Enable fix_vlldm if
> -	targetting an affected CPU and not explicitly controlled on
> -	the command line.
> -
> -CVE: CVE-2021-35465
> -Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=3Dgcc.gi=
t;h=3D3929bca9ca95de9d35e82ae8828b188029e3eb70]
> -Signed-off-by: Pgowda <pgowda.cve@gmail.com>
> -
> ----
> - gcc/config/arm/arm-cpus.in | 9 +++++++--
> - gcc/config/arm/arm.c       | 9 +++++++++
> - gcc/config/arm/arm.opt     | 4 ++++
> - gcc/doc/invoke.texi        | 9 +++++++++
> - 4 files changed, 29 insertions(+), 2 deletions(-)
> -
> -diff --git a/gcc/config/arm/arm.c b/gcc/config/arm/arm.c
> ---- a/gcc/config/arm/arm.c	2021-11-15 02:13:11.100579812 -0800
> -+++ b/gcc/config/arm/arm.c	2021-11-15 02:17:36.988237692 -0800
> -@@ -3610,6 +3610,15 @@ arm_option_override (void)
> - 	fix_cm3_ldrd =3D 0;
> -     }
> -=20
> -+  /* Enable fix_vlldm by default if required.  */
> -+  if (fix_vlldm =3D=3D 2)
> -+    {
> -+      if (bitmap_bit_p (arm_active_target.isa, isa_bit_quirk_vlldm))
> -+	fix_vlldm =3D 1;
> -+      else
> -+	fix_vlldm =3D 0;
> -+    }
> -+
> -   /* Hot/Cold partitioning is not currently supported, since we can't
> -      handle literal pool placement in that case.  */
> -   if (flag_reorder_blocks_and_partition)
> -diff --git a/gcc/config/arm/arm-cpus.in b/gcc/config/arm/arm-cpus.in
> ---- a/gcc/config/arm/arm-cpus.in	2021-11-15 02:13:11.104579747 -0800
> -+++ b/gcc/config/arm/arm-cpus.in	2021-11-15 02:17:36.984237757 -0800
> -@@ -186,6 +186,9 @@ define feature quirk_armv6kz
> - # Cortex-M3 LDRD quirk.
> - define feature quirk_cm3_ldrd
> -=20
> -+# v8-m/v8.1-m VLLDM errata.
> -+define feature quirk_vlldm
> -+
> - # Don't use .cpu assembly directive
> - define feature quirk_no_asmcpu
> -=20
> -@@ -322,7 +325,7 @@ define implied vfp_base MVE MVE_FP ALL_F
> - # architectures.
> - # xscale isn't really a 'quirk', but it isn't an architecture either an=
d we
> - # need to ignore it for matching purposes.
> --define fgroup ALL_QUIRKS   quirk_no_volatile_ce quirk_armv6kz quirk_cm3=
_ldrd xscale quirk_no_asmcpu
> -+define fgroup ALL_QUIRKS   quirk_no_volatile_ce quirk_armv6kz quirk_cm3=
_ldrd quirk_vlldm xscale quirk_no_asmcpu
> -=20
> - define fgroup IGNORE_FOR_MULTILIB cdecp0 cdecp1 cdecp2 cdecp3 cdecp4 cd=
ecp5 cdecp6 cdecp7
> -=20
> -@@ -1570,6 +1573,7 @@ begin cpu cortex-m33
> -  architecture armv8-m.main+dsp+fp
> -  option nofp remove ALL_FP
> -  option nodsp remove armv7em
> -+ isa quirk_vlldm
> -  costs v7m
> - end cpu cortex-m33
> -=20
> -@@ -1579,6 +1583,7 @@ begin cpu cortex-m35p
> -  architecture armv8-m.main+dsp+fp
> -  option nofp remove ALL_FP
> -  option nodsp remove armv7em
> -+ isa quirk_vlldm
> -  costs v7m
> - end cpu cortex-m35p
> -=20
> -@@ -1590,7 +1595,7 @@ begin cpu cortex-m55
> -  option nomve remove mve mve_float
> -  option nofp remove ALL_FP mve_float
> -  option nodsp remove MVE mve_float
> -- isa quirk_no_asmcpu
> -+ isa quirk_no_asmcpu quirk_vlldm
> -  costs v7m
> -  vendor 41
> - end cpu cortex-m55
> -diff --git a/gcc/config/arm/arm.opt b/gcc/config/arm/arm.opt
> ---- a/gcc/config/arm/arm.opt	2021-11-15 02:13:11.104579747 -0800
> -+++ b/gcc/config/arm/arm.opt	2021-11-15 02:17:36.988237692 -0800
> -@@ -268,6 +268,10 @@ Target Var(fix_cm3_ldrd) Init(2)
> - Avoid overlapping destination and address registers on LDRD instructions
> - that may trigger Cortex-M3 errata.
> -=20
> -+mfix-cmse-cve-2021-35465
> -+Target Var(fix_vlldm) Init(2)
> -+Mitigate issues with VLLDM on some M-profile devices (CVE-2021-35465).
> -+
> - munaligned-access
> - Target Var(unaligned_access) Init(2) Save
> - Enable unaligned word and halfword accesses to packed data.
> -diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
> ---- a/gcc/doc/invoke.texi	2021-11-15 02:13:11.112579616 -0800
> -+++ b/gcc/doc/invoke.texi	2021-11-15 02:17:36.996237562 -0800
> -@@ -804,6 +804,7 @@ Objective-C and Objective-C++ Dialects}.
> - -mverbose-cost-dump @gol
> - -mpure-code @gol
> - -mcmse @gol
> -+-mfix-cmse-cve-2021-35465 @gol
> - -mfdpic}
> -=20
> - @emph{AVR Options}
> -@@ -20487,6 +20488,14 @@ Generate secure code as per the "ARMv8-M
> - Development Tools Engineering Specification", which can be found on
> - @url{https://developer.arm.com/documentation/ecm0359818/latest/}.
> -=20
> -+@item -mfix-cmse-cve-2021-35465
> -+@opindex mfix-cmse-cve-2021-35465
> -+Mitigate against a potential security issue with the @code{VLLDM} instr=
uction
> -+in some M-profile devices when using CMSE (CVE-2021-365465).  This opti=
on is
> -+enabled by default when the option @option{-mcpu=3D} is used with
> -+@code{cortex-m33}, @code{cortex-m35p} or @code{cortex-m55}.  The option
> -+@option{-mno-fix-cmse-cve-2021-35465} can be used to disable the mitiga=
tion.
> -+
> - @item -mfdpic
> - @itemx -mno-fdpic
> - @opindex mfdpic
> diff --git a/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-42574.patch b/me=
ta/recipes-devtools/gcc/gcc/0001-CVE-2021-42574.patch
> deleted file mode 100644
> index 4d680ccc8f..0000000000
> --- a/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-42574.patch
> +++ /dev/null
> @@ -1,2282 +0,0 @@
> -From bd5e882cf6e0def3dd1bc106075d59a303fe0d1e Mon Sep 17 00:00:00 2001
> -From: David Malcolm <dmalcolm@redhat.com>
> -Date: Mon, 18 Oct 2021 18:55:31 -0400
> -Subject: [PATCH] diagnostics: escape non-ASCII source bytes for certain
> - diagnostics
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3Dutf8
> -Content-Transfer-Encoding: 8bit
> -
> -This patch adds support to GCC's diagnostic subsystem for escaping certa=
in
> -bytes and Unicode characters when quoting source code.
> -
> -Specifically, this patch adds a new flag rich_location::m_escape_on_outp=
ut
> -which is a hint from a diagnostic that non-ASCII bytes in the pertinent
> -lines of the user's source code should be escaped when printed.
> -
> -The patch sets this for the following diagnostics:
> -- when complaining about stray bytes in the program (when these
> -are non-printable)
> -- when complaining about "null character(s) ignored");
> -- for -Wnormalized=3D (and generate source ranges for such warnings)
> -
> -The escaping is controlled by a new option:
> -  -fdiagnostics-escape-format=3D[unicode|bytes]
> -
> -For example, consider a diagnostic involing a source line containing the
> -string "before" followed by the Unicode character U+03C0 ("GREEK SMALL
> -LETTER PI", with UTF-8 encoding 0xCF 0x80) followed by the byte 0xBF
> -(a stray UTF-8 trailing byte), followed by the string "after", where the
> -diagnostic highlights the U+03C0 character.
> -
> -By default, this line will be printed verbatim to the user when
> -reporting a diagnostic at it, as:
> -
> - before=CFXafter
> -       ^
> -
> -(using X for the stray byte to avoid putting invalid UTF-8 in this
> -commit message)
> -
> -If the diagnostic sets the "escape" flag, it will be printed as:
> -
> - before<U+03C0><BF>after
> -       ^~~~~~~~
> -
> -with -fdiagnostics-escape-format=3Dunicode (the default), or as:
> -
> -  before<CF><80><BF>after
> -        ^~~~~~~~
> -
> -if the user supplies -fdiagnostics-escape-format=3Dbytes.
> -
> -This only affects how the source is printed; it does not affect
> -how column numbers that are printed (as per -fdiagnostics-column-unit=3D
> -and -fdiagnostics-column-origin=3D).
> -
> -gcc/c-family/ChangeLog:
> -	* c-lex.c (c_lex_with_flags): When complaining about non-printable
> -	CPP_OTHER tokens, set the "escape on output" flag.
> -
> -gcc/ChangeLog:
> -	* common.opt (fdiagnostics-escape-format=3D): New.
> -	(diagnostics_escape_format): New enum.
> -	(DIAGNOSTICS_ESCAPE_FORMAT_UNICODE): New enum value.
> -	(DIAGNOSTICS_ESCAPE_FORMAT_BYTES): Likewise.
> -	* diagnostic-format-json.cc (json_end_diagnostic): Add
> -	"escape-source" attribute.
> -	* diagnostic-show-locus.c
> -	(exploc_with_display_col::exploc_with_display_col): Replace
> -	"tabstop" param with a cpp_char_column_policy and add an "aspect"
> -	param.  Use these to compute m_display_col accordingly.
> -	(struct char_display_policy): New struct.
> -	(layout::m_policy): New field.
> -	(layout::m_escape_on_output): New field.
> -	(def_policy): New function.
> -	(make_range): Update for changes to exploc_with_display_col ctor.
> -	(default_print_decoded_ch): New.
> -	(width_per_escaped_byte): New.
> -	(escape_as_bytes_width): New.
> -	(escape_as_bytes_print): New.
> -	(escape_as_unicode_width): New.
> -	(escape_as_unicode_print): New.
> -	(make_policy): New.
> -	(layout::layout): Initialize new fields.  Update m_exploc ctor
> -	call for above change to ctor.
> -	(layout::maybe_add_location_range): Update for changes to
> -	exploc_with_display_col ctor.
> -	(layout::calculate_x_offset_display): Update for change to
> -	cpp_display_width.
> -	(layout::print_source_line): Pass policy
> -	to cpp_display_width_computation. Capture cpp_decoded_char when
> -	calling process_next_codepoint.  Move printing of source code to
> -	m_policy.m_print_cb.
> -	(line_label::line_label): Pass in policy rather than context.
> -	(layout::print_any_labels): Update for change to line_label ctor.
> -	(get_affected_range): Pass in policy rather than context, updating
> -	calls to location_compute_display_column accordingly.
> -	(get_printed_columns): Likewise, also for cpp_display_width.
> -	(correction::correction): Pass in policy rather than tabstop.
> -	(correction::compute_display_cols): Pass m_policy rather than
> -	m_tabstop to cpp_display_width.
> -	(correction::m_tabstop): Replace with...
> -	(correction::m_policy): ...this.
> -	(line_corrections::line_corrections): Pass in policy rather than
> -	context.
> -	(line_corrections::m_context): Replace with...
> -	(line_corrections::m_policy): ...this.
> -	(line_corrections::add_hint): Update to use m_policy rather than
> -	m_context.
> -	(line_corrections::add_hint): Likewise.
> -	(layout::print_trailing_fixits): Likewise.
> -	(selftest::test_display_widths): New.
> -	(selftest::test_layout_x_offset_display_utf8): Update to use
> -	policy rather than tabstop.
> -	(selftest::test_one_liner_labels_utf8): Add test of escaping
> -	source lines.
> -	(selftest::test_diagnostic_show_locus_one_liner_utf8): Update to
> -	use policy rather than tabstop.
> -	(selftest::test_overlapped_fixit_printing): Likewise.
> -	(selftest::test_overlapped_fixit_printing_utf8): Likewise.
> -	(selftest::test_overlapped_fixit_printing_2): Likewise.
> -	(selftest::test_tab_expansion): Likewise.
> -	(selftest::test_escaping_bytes_1): New.
> -	(selftest::test_escaping_bytes_2): New.
> -	(selftest::diagnostic_show_locus_c_tests): Call the new tests.
> -	* diagnostic.c (diagnostic_initialize): Initialize
> -	context->escape_format.
> -	(convert_column_unit): Update to use default character width policy.
> -	(selftest::test_diagnostic_get_location_text): Likewise.
> -	* diagnostic.h (enum diagnostics_escape_format): New enum.
> -	(diagnostic_context::escape_format): New field.
> -	* doc/invoke.texi (-fdiagnostics-escape-format=3D): New option.
> -	(-fdiagnostics-format=3D): Add "escape-source" attribute to examples
> -	of JSON output, and document it.
> -	* input.c (location_compute_display_column): Pass in "policy"
> -	rather than "tabstop", passing to
> -	cpp_byte_column_to_display_column.
> -	(selftest::test_cpp_utf8): Update to use cpp_char_column_policy.
> -	* input.h (class cpp_char_column_policy): New forward decl.
> -	(location_compute_display_column): Pass in "policy" rather than
> -	"tabstop".
> -	* opts.c (common_handle_option): Handle
> -	OPT_fdiagnostics_escape_format_.
> -	* selftest.c (temp_source_file::temp_source_file): New ctor
> -	overload taking a size_t.
> -	* selftest.h (temp_source_file::temp_source_file): Likewise.
> -
> -gcc/testsuite/ChangeLog:
> -	* c-c++-common/diagnostic-format-json-1.c: Add regexp to consume
> -	"escape-source" attribute.
> -	* c-c++-common/diagnostic-format-json-2.c: Likewise.
> -	* c-c++-common/diagnostic-format-json-3.c: Likewise.
> -	* c-c++-common/diagnostic-format-json-4.c: Likewise, twice.
> -	* c-c++-common/diagnostic-format-json-5.c: Likewise.
> -	* gcc.dg/cpp/warn-normalized-4-bytes.c: New test.
> -	* gcc.dg/cpp/warn-normalized-4-unicode.c: New test.
> -	* gcc.dg/encoding-issues-bytes.c: New test.
> -	* gcc.dg/encoding-issues-unicode.c: New test.
> -	* gfortran.dg/diagnostic-format-json-1.F90: Add regexp to consume
> -	"escape-source" attribute.
> -	* gfortran.dg/diagnostic-format-json-2.F90: Likewise.
> -	* gfortran.dg/diagnostic-format-json-3.F90: Likewise.
> -
> -libcpp/ChangeLog:
> -	* charset.c (convert_escape): Use encoding_rich_location when
> -	complaining about nonprintable unknown escape sequences.
> -	(cpp_display_width_computation::::cpp_display_width_computation):
> -	Pass in policy rather than tabstop.
> -	(cpp_display_width_computation::process_next_codepoint): Add "out"
> -	param and populate *out if non-NULL.
> -	(cpp_display_width_computation::advance_display_cols): Pass NULL
> -	to process_next_codepoint.
> -	(cpp_byte_column_to_display_column): Pass in policy rather than
> -	tabstop.  Pass NULL to process_next_codepoint.
> -	(cpp_display_column_to_byte_column): Pass in policy rather than
> -	tabstop.
> -	* errors.c (cpp_diagnostic_get_current_location): New function,
> -	splitting out the logic from...
> -	(cpp_diagnostic): ...here.
> -	(cpp_warning_at): New function.
> -	(cpp_pedwarning_at): New function.
> -	* include/cpplib.h (cpp_warning_at): New decl for rich_location.
> -	(cpp_pedwarning_at): Likewise.
> -	(struct cpp_decoded_char): New.
> -	(struct cpp_char_column_policy): New.
> -	(cpp_display_width_computation::cpp_display_width_computation):
> -	Replace "tabstop" param with "policy".
> -	(cpp_display_width_computation::process_next_codepoint): Add "out"
> -	param.
> -	(cpp_display_width_computation::m_tabstop): Replace with...
> -	(cpp_display_width_computation::m_policy): ...this.
> -	(cpp_byte_column_to_display_column): Replace "tabstop" param with
> -	"policy".
> -	(cpp_display_width): Likewise.
> -	(cpp_display_column_to_byte_column): Likewise.
> -	* include/line-map.h (rich_location::escape_on_output_p): New.
> -	(rich_location::set_escape_on_output): New.
> -	(rich_location::m_escape_on_output): New.
> -	* internal.h (cpp_diagnostic_get_current_location): New decl.
> -	(class encoding_rich_location): New.
> -	* lex.c (skip_whitespace): Use encoding_rich_location when
> -	complaining about null characters.
> -	(warn_about_normalization): Generate a source range when
> -	complaining about improperly normalized tokens, rather than just a
> -	point, and use encoding_rich_location so that the source code
> -	is escaped on printing.
> -	* line-map.c (rich_location::rich_location): Initialize
> -	m_escape_on_output.
> -
> -Signed-off-by: David Malcolm <dmalcolm@redhat.com>
> -
> -CVE: CVE-2021-42574
> -Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=3Dgcc.gi=
t;h=3Dbd5e882cf6e0def3dd1bc106075d59a303fe0d1e]
> -Signed-off-by: Pgowda <pgowda.cve@gmail.com>
> -
> ----
> - gcc/c-family/c-lex.c                          |   6 +-
> - gcc/common.opt                                |  13 +
> - gcc/diagnostic-format-json.cc                 |   3 +
> - gcc/diagnostic-show-locus.c                   | 580 +++++++++++++++---
> - gcc/diagnostic.c                              |  10 +-
> - gcc/diagnostic.h                              |  18 +
> - gcc/doc/invoke.texi                           |  43 +-
> - gcc/input.c                                   |  62 +-
> - gcc/input.h                                   |   7 +-
> - gcc/opts.c                                    |   4 +
> - gcc/selftest.c                                |  15 +
> - gcc/selftest.h                                |   2 +
> - .../c-c++-common/diagnostic-format-json-1.c   |   1 +
> - .../c-c++-common/diagnostic-format-json-2.c   |   1 +
> - .../c-c++-common/diagnostic-format-json-3.c   |   1 +
> - .../c-c++-common/diagnostic-format-json-4.c   |   2 +
> - .../c-c++-common/diagnostic-format-json-5.c   |   1 +
> - .../gcc.dg/cpp/warn-normalized-4-bytes.c      |  21 +
> - .../gcc.dg/cpp/warn-normalized-4-unicode.c    |  19 +
> - gcc/testsuite/gcc.dg/encoding-issues-bytes.c  | Bin 0 -> 595 bytes
> - .../gcc.dg/encoding-issues-unicode.c          | Bin 0 -> 613 bytes
> - .../gfortran.dg/diagnostic-format-json-1.F90  |   1 +
> - .../gfortran.dg/diagnostic-format-json-2.F90  |   1 +
> - .../gfortran.dg/diagnostic-format-json-3.F90  |   1 +
> - libcpp/charset.c                              |  63 +-
> - libcpp/errors.c                               |  82 ++-
> - libcpp/include/cpplib.h                       |  76 ++-
> - libcpp/include/line-map.h                     |  13 +
> - libcpp/internal.h                             |  23 +
> - libcpp/lex.c                                  |  38 +-
> - libcpp/line-map.c                             |   3 +-
> - 31 files changed, 942 insertions(+), 168 deletions(-)
> - create mode 100644 gcc/testsuite/gcc.dg/cpp/warn-normalized-4-bytes.c
> - create mode 100644 gcc/testsuite/gcc.dg/cpp/warn-normalized-4-unicode.c
> - create mode 100644 gcc/testsuite/gcc.dg/encoding-issues-bytes.c
> - create mode 100644 gcc/testsuite/gcc.dg/encoding-issues-unicode.c
> -
> -diff --git a/gcc/c-family/c-lex.c b/gcc/c-family/c-lex.c
> ---- a/gcc/c-family/c-lex.c	2021-07-27 23:55:06.980283060 -0700
> -+++ b/gcc/c-family/c-lex.c	2021-12-14 01:16:01.541943272 -0800
> -@@ -603,7 +603,11 @@ c_lex_with_flags (tree *value, location_
> - 	else if (ISGRAPH (c))
> - 	  error_at (*loc, "stray %qc in program", (int) c);
> - 	else
> --	  error_at (*loc, "stray %<\\%o%> in program", (int) c);
> -+	  {
> -+	    rich_location rich_loc (line_table, *loc);
> -+	    rich_loc.set_escape_on_output (true);
> -+	    error_at (&rich_loc, "stray %<\\%o%> in program", (int) c);
> -+	  }
> -       }
> -       goto retry;
> -=20
> -diff --git a/gcc/common.opt b/gcc/common.opt
> ---- a/gcc/common.opt	2021-12-13 22:08:44.939137107 -0800
> -+++ b/gcc/common.opt	2021-12-14 01:16:01.541943272 -0800
> -@@ -1348,6 +1348,10 @@ fdiagnostics-format=3D
> - Common Joined RejectNegative Enum(diagnostics_output_format)
> - -fdiagnostics-format=3D[text|json]	Select output format.
> -=20
> -+fdiagnostics-escape-format=3D
> -+Common Joined RejectNegative Enum(diagnostics_escape_format)
> -+-fdiagnostics-escape-format=3D[unicode|bytes]	Select how to escape non-=
printable-ASCII bytes in the source for diagnostics that suggest it.
> -+
> - ; Required for these enum values.
> - SourceInclude
> - diagnostic.h
> -@@ -1362,6 +1366,15 @@ EnumValue
> - Enum(diagnostics_column_unit) String(byte) Value(DIAGNOSTICS_COLUMN_UNI=
T_BYTE)
> -=20
> - Enum
> -+Name(diagnostics_escape_format) Type(int)
> -+
> -+EnumValue
> -+Enum(diagnostics_escape_format) String(unicode) Value(DIAGNOSTICS_ESCAP=
E_FORMAT_UNICODE)
> -+
> -+EnumValue
> -+Enum(diagnostics_escape_format) String(bytes) Value(DIAGNOSTICS_ESCAPE_=
FORMAT_BYTES)
> -+
> -+Enum
> - Name(diagnostics_output_format) Type(int)
> -=20
> - EnumValue
> -diff --git a/gcc/diagnostic.c b/gcc/diagnostic.c
> ---- a/gcc/diagnostic.c	2021-07-27 23:55:07.232286576 -0700
> -+++ b/gcc/diagnostic.c	2021-12-14 01:16:01.545943202 -0800
> -@@ -230,6 +230,7 @@ diagnostic_initialize (diagnostic_contex
> -   context->column_unit =3D DIAGNOSTICS_COLUMN_UNIT_DISPLAY;
> -   context->column_origin =3D 1;
> -   context->tabstop =3D 8;
> -+  context->escape_format =3D DIAGNOSTICS_ESCAPE_FORMAT_UNICODE;
> -   context->edit_context_ptr =3D NULL;
> -   context->diagnostic_group_nesting_depth =3D 0;
> -   context->diagnostic_group_emission_count =3D 0;
> -@@ -382,7 +383,10 @@ convert_column_unit (enum diagnostics_co
> -       gcc_unreachable ();
> -=20
> -     case DIAGNOSTICS_COLUMN_UNIT_DISPLAY:
> --      return location_compute_display_column (s, tabstop);
> -+      {
> -+	cpp_char_column_policy policy (tabstop, cpp_wcwidth);
> -+	return location_compute_display_column (s, policy);
> -+      }
> -=20
> -     case DIAGNOSTICS_COLUMN_UNIT_BYTE:
> -       return s.column;
> -@@ -2275,8 +2279,8 @@ test_diagnostic_get_location_text ()
> -     const char *const content =3D "smile \xf0\x9f\x98\x82\n";
> -     const int line_bytes =3D strlen (content) - 1;
> -     const int def_tabstop =3D 8;
> --    const int display_width =3D cpp_display_width (content, line_bytes,
> --						 def_tabstop);
> -+    const cpp_char_column_policy policy (def_tabstop, cpp_wcwidth);
> -+    const int display_width =3D cpp_display_width (content, line_bytes,=
 policy);
> -     ASSERT_EQ (line_bytes - 2, display_width);
> -     temp_source_file tmp (SELFTEST_LOCATION, ".c", content);
> -     const char *const fname =3D tmp.get_filename ();
> -diff --git a/gcc/diagnostic-format-json.cc b/gcc/diagnostic-format-json.=
cc
> ---- a/gcc/diagnostic-format-json.cc	2021-07-27 23:55:07.232286576 -0700
> -+++ b/gcc/diagnostic-format-json.cc	2021-12-14 01:16:01.541943272 -0800
> -@@ -264,6 +264,9 @@ json_end_diagnostic (diagnostic_context
> -       json::value *path_value =3D context->make_json_for_path (context,=
 path);
> -       diag_obj->set ("path", path_value);
> -     }
> -+
> -+  diag_obj->set ("escape-source",
> -+		 new json::literal (richloc->escape_on_output_p ()));
> - }
> -=20
> - /* No-op implementation of "begin_group_cb" for JSON output.  */
> -diff --git a/gcc/diagnostic.h b/gcc/diagnostic.h
> ---- a/gcc/diagnostic.h	2021-07-27 23:55:07.236286632 -0700
> -+++ b/gcc/diagnostic.h	2021-12-14 01:16:01.545943202 -0800
> -@@ -38,6 +38,20 @@ enum diagnostics_column_unit
> -   DIAGNOSTICS_COLUMN_UNIT_BYTE
> - };
> -=20
> -+/* An enum for controlling how to print non-ASCII characters/bytes when
> -+   a diagnostic suggests escaping the source code on output.  */
> -+
> -+enum diagnostics_escape_format
> -+{
> -+  /* Escape non-ASCII Unicode characters in the form <U+XXXX> and
> -+     non-UTF-8 bytes in the form <XX>.  */
> -+  DIAGNOSTICS_ESCAPE_FORMAT_UNICODE,
> -+
> -+  /* Escape non-ASCII bytes in the form <XX> (thus showing the underlyi=
ng
> -+     encoding of non-ASCII Unicode characters).  */
> -+  DIAGNOSTICS_ESCAPE_FORMAT_BYTES
> -+};
> -+
> - /* Enum for overriding the standard output format.  */
> -=20
> - enum diagnostics_output_format
> -@@ -320,6 +334,10 @@ struct diagnostic_context
> -   /* The size of the tabstop for tab expansion.  */
> -   int tabstop;
> -=20
> -+  /* How should non-ASCII/non-printable bytes be escaped when
> -+     a diagnostic suggests escaping the source code on output.  */
> -+  enum diagnostics_escape_format escape_format;
> -+
> -   /* If non-NULL, an edit_context to which fix-it hints should be
> -      applied, for generating patches.  */
> -   edit_context *edit_context_ptr;
> -diff --git a/gcc/diagnostic-show-locus.c b/gcc/diagnostic-show-locus.c
> ---- a/gcc/diagnostic-show-locus.c	2021-07-27 23:55:07.232286576 -0700
> -+++ b/gcc/diagnostic-show-locus.c	2021-12-14 01:16:01.545943202 -0800
> -@@ -175,10 +175,26 @@ enum column_unit {
> - class exploc_with_display_col : public expanded_location
> - {
> -  public:
> --  exploc_with_display_col (const expanded_location &exploc, int tabstop)
> --    : expanded_location (exploc),
> --      m_display_col (location_compute_display_column (exploc, tabstop))
> --  {}
> -+  exploc_with_display_col (const expanded_location &exploc,
> -+			   const cpp_char_column_policy &policy,
> -+			   enum location_aspect aspect)
> -+  : expanded_location (exploc),
> -+    m_display_col (location_compute_display_column (exploc, policy))
> -+  {
> -+    if (exploc.column > 0)
> -+      {
> -+	/* m_display_col is now the final column of the byte.
> -+	   If escaping has happened, we may want the first column instead.  */
> -+	if (aspect !=3D LOCATION_ASPECT_FINISH)
> -+	  {
> -+	    expanded_location prev_exploc (exploc);
> -+	    prev_exploc.column--;
> -+	    int prev_display_col
> -+	      =3D (location_compute_display_column (prev_exploc, policy));
> -+	    m_display_col =3D prev_display_col + 1;
> -+	  }
> -+      }
> -+  }
> -=20
> -   int m_display_col;
> - };
> -@@ -313,6 +329,31 @@ test_line_span ()
> -=20
> - #endif /* #if CHECKING_P */
> -=20
> -+/* A bundle of information containing how to print unicode
> -+   characters and bytes when quoting source code.
> -+
> -+   Provides a unified place to support escaping some subset
> -+   of characters to some format.
> -+
> -+   Extends char_column_policy; printing is split out to avoid
> -+   libcpp having to know about pretty_printer.  */
> -+
> -+struct char_display_policy : public cpp_char_column_policy
> -+{
> -+ public:
> -+  char_display_policy (int tabstop,
> -+		       int (*width_cb) (cppchar_t c),
> -+		       void (*print_cb) (pretty_printer *pp,
> -+					 const cpp_decoded_char &cp))
> -+  : cpp_char_column_policy (tabstop, width_cb),
> -+    m_print_cb (print_cb)
> -+  {
> -+  }
> -+
> -+  void (*m_print_cb) (pretty_printer *pp,
> -+		      const cpp_decoded_char &cp);
> -+};
> -+
> - /* A class to control the overall layout when printing a diagnostic.
> -=20
> -    The layout is determined within the constructor.
> -@@ -345,6 +386,8 @@ class layout
> -=20
> -   void print_line (linenum_type row);
> -=20
> -+  void on_bad_codepoint (const char *ptr, cppchar_t ch, size_t ch_sz);
> -+
> -  private:
> -   bool will_show_line_p (linenum_type row) const;
> -   void print_leading_fixits (linenum_type row);
> -@@ -386,6 +429,7 @@ class layout
> -  private:
> -   diagnostic_context *m_context;
> -   pretty_printer *m_pp;
> -+  char_display_policy m_policy;
> -   location_t m_primary_loc;
> -   exploc_with_display_col m_exploc;
> -   colorizer m_colorizer;
> -@@ -398,6 +442,7 @@ class layout
> -   auto_vec <line_span> m_line_spans;
> -   int m_linenum_width;
> -   int m_x_offset_display;
> -+  bool m_escape_on_output;
> - };
> -=20
> - /* Implementation of "class colorizer".  */
> -@@ -646,6 +691,11 @@ layout_range::intersects_line_p (linenum
> - /* Default for when we don't care what the tab expansion is set to.  */
> - static const int def_tabstop =3D 8;
> -=20
> -+static cpp_char_column_policy def_policy ()
> -+{
> -+  return cpp_char_column_policy (8, cpp_wcwidth);
> -+}
> -+
> - /* Create some expanded locations for testing layout_range.  The filena=
me
> -    member of the explocs is set to the empty string.  This member will =
only be
> -    inspected by the calls to location_compute_display_column() made fro=
m the
> -@@ -662,10 +712,13 @@ make_range (int start_line, int start_co
> -     =3D {"", start_line, start_col, NULL, false};
> -   const expanded_location finish_exploc
> -     =3D {"", end_line, end_col, NULL, false};
> --  return layout_range (exploc_with_display_col (start_exploc, def_tabst=
op),
> --		       exploc_with_display_col (finish_exploc, def_tabstop),
> -+  return layout_range (exploc_with_display_col (start_exploc, def_polic=
y (),
> -+						LOCATION_ASPECT_START),
> -+		       exploc_with_display_col (finish_exploc, def_policy (),
> -+						LOCATION_ASPECT_FINISH),
> - 		       SHOW_RANGE_WITHOUT_CARET,
> --		       exploc_with_display_col (start_exploc, def_tabstop),
> -+		       exploc_with_display_col (start_exploc, def_policy (),
> -+						LOCATION_ASPECT_CARET),
> - 		       0, NULL);
> - }
> -=20
> -@@ -959,6 +1012,164 @@ fixit_cmp (const void *p_a, const void *
> -   return hint_a->get_start_loc () - hint_b->get_start_loc ();
> - }
> -=20
> -+/* Callbacks for use when not escaping the source.  */
> -+
> -+/* The default callback for char_column_policy::m_width_cb is cpp_wcwid=
th.  */
> -+
> -+/* Callback for char_display_policy::m_print_cb for printing source cha=
rs
> -+   when not escaping the source.  */
> -+
> -+static void
> -+default_print_decoded_ch (pretty_printer *pp,
> -+			  const cpp_decoded_char &decoded_ch)
> -+{
> -+  for (const char *ptr =3D decoded_ch.m_start_byte;
> -+       ptr !=3D decoded_ch.m_next_byte; ptr++)
> -+    {
> -+      if (*ptr =3D=3D '\0' || *ptr =3D=3D '\r')
> -+	{
> -+	  pp_space (pp);
> -+	  continue;
> -+	}
> -+
> -+      pp_character (pp, *ptr);
> -+    }
> -+}
> -+
> -+/* Callbacks for use with DIAGNOSTICS_ESCAPE_FORMAT_BYTES.  */
> -+
> -+static const int width_per_escaped_byte =3D 4;
> -+
> -+/* Callback for char_column_policy::m_width_cb for determining the
> -+   display width when escaping with DIAGNOSTICS_ESCAPE_FORMAT_BYTES.  */
> -+
> -+static int
> -+escape_as_bytes_width (cppchar_t ch)
> -+{
> -+  if (ch < 0x80 && ISPRINT (ch))
> -+    return cpp_wcwidth (ch);
> -+  else
> -+    {
> -+      if (ch <=3D   0x7F) return 1 * width_per_escaped_byte;
> -+      if (ch <=3D  0x7FF) return 2 * width_per_escaped_byte;
> -+      if (ch <=3D 0xFFFF) return 3 * width_per_escaped_byte;
> -+      return 4 * width_per_escaped_byte;
> -+    }
> -+}
> -+
> -+/* Callback for char_display_policy::m_print_cb for printing source cha=
rs
> -+   when escaping with DIAGNOSTICS_ESCAPE_FORMAT_BYTES.  */
> -+
> -+static void
> -+escape_as_bytes_print (pretty_printer *pp,
> -+		       const cpp_decoded_char &decoded_ch)
> -+{
> -+  if (!decoded_ch.m_valid_ch)
> -+    {
> -+      for (const char *iter =3D decoded_ch.m_start_byte;
> -+	   iter !=3D decoded_ch.m_next_byte; ++iter)
> -+	{
> -+	  char buf[16];
> -+	  sprintf (buf, "<%02x>", (unsigned char)*iter);
> -+	  pp_string (pp, buf);
> -+	}
> -+      return;
> -+    }
> -+
> -+  cppchar_t ch =3D decoded_ch.m_ch;
> -+  if (ch < 0x80 && ISPRINT (ch))
> -+    pp_character (pp, ch);
> -+  else
> -+    {
> -+      for (const char *iter =3D decoded_ch.m_start_byte;
> -+	   iter < decoded_ch.m_next_byte; ++iter)
> -+	{
> -+	  char buf[16];
> -+	  sprintf (buf, "<%02x>", (unsigned char)*iter);
> -+	  pp_string (pp, buf);
> -+	}
> -+    }
> -+}
> -+
> -+/* Callbacks for use with DIAGNOSTICS_ESCAPE_FORMAT_UNICODE.  */
> -+
> -+/* Callback for char_column_policy::m_width_cb for determining the
> -+   display width when escaping with DIAGNOSTICS_ESCAPE_FORMAT_UNICODE. =
 */
> -+
> -+static int
> -+escape_as_unicode_width (cppchar_t ch)
> -+{
> -+  if (ch < 0x80 && ISPRINT (ch))
> -+    return cpp_wcwidth (ch);
> -+  else
> -+    {
> -+      // Width of "<U+%04x>"
> -+      if (ch > 0xfffff)
> -+	return 10;
> -+      else if (ch > 0xffff)
> -+	return 9;
> -+      else
> -+	return 8;
> -+    }
> -+}
> -+
> -+/* Callback for char_display_policy::m_print_cb for printing source cha=
rs
> -+   when escaping with DIAGNOSTICS_ESCAPE_FORMAT_UNICODE.  */
> -+
> -+static void
> -+escape_as_unicode_print (pretty_printer *pp,
> -+			 const cpp_decoded_char &decoded_ch)
> -+{
> -+  if (!decoded_ch.m_valid_ch)
> -+    {
> -+      escape_as_bytes_print (pp, decoded_ch);
> -+      return;
> -+    }
> -+
> -+  cppchar_t ch =3D decoded_ch.m_ch;
> -+  if (ch < 0x80 && ISPRINT (ch))
> -+    pp_character (pp, ch);
> -+  else
> -+    {
> -+      char buf[16];
> -+      sprintf (buf, "<U+%04X>", ch);
> -+      pp_string (pp, buf);
> -+    }
> -+}
> -+
> -+/* Populate a char_display_policy based on DC and RICHLOC.  */
> -+
> -+static char_display_policy
> -+make_policy (const diagnostic_context &dc,
> -+	     const rich_location &richloc)
> -+{
> -+  /* The default is to not escape non-ASCII bytes.  */
> -+  char_display_policy result
> -+    (dc.tabstop, cpp_wcwidth, default_print_decoded_ch);
> -+
> -+  /* If the diagnostic suggests escaping non-ASCII bytes, then
> -+     use policy from user-supplied options.  */
> -+  if (richloc.escape_on_output_p ())
> -+    {
> -+      result.m_undecoded_byte_width =3D width_per_escaped_byte;
> -+      switch (dc.escape_format)
> -+	{
> -+	default:
> -+	  gcc_unreachable ();
> -+	case DIAGNOSTICS_ESCAPE_FORMAT_UNICODE:
> -+	  result.m_width_cb =3D escape_as_unicode_width;
> -+	  result.m_print_cb =3D escape_as_unicode_print;
> -+	  break;
> -+	case DIAGNOSTICS_ESCAPE_FORMAT_BYTES:
> -+	  result.m_width_cb =3D escape_as_bytes_width;
> -+	  result.m_print_cb =3D escape_as_bytes_print;
> -+	  break;
> -+	}
> -+    }
> -+
> -+  return result;
> -+}
> -+
> - /* Implementation of class layout.  */
> -=20
> - /* Constructor for class layout.
> -@@ -975,8 +1186,10 @@ layout::layout (diagnostic_context * con
> - 		diagnostic_t diagnostic_kind)
> - : m_context (context),
> -   m_pp (context->printer),
> -+  m_policy (make_policy (*context, *richloc)),
> -   m_primary_loc (richloc->get_range (0)->m_loc),
> --  m_exploc (richloc->get_expanded_location (0), context->tabstop),
> -+  m_exploc (richloc->get_expanded_location (0), m_policy,
> -+	    LOCATION_ASPECT_CARET),
> -   m_colorizer (context, diagnostic_kind),
> -   m_colorize_source_p (context->colorize_source_p),
> -   m_show_labels_p (context->show_labels_p),
> -@@ -986,7 +1199,8 @@ layout::layout (diagnostic_context * con
> -   m_fixit_hints (richloc->get_num_fixit_hints ()),
> -   m_line_spans (1 + richloc->get_num_locations ()),
> -   m_linenum_width (0),
> --  m_x_offset_display (0)
> -+  m_x_offset_display (0),
> -+  m_escape_on_output (richloc->escape_on_output_p ())
> - {
> -   for (unsigned int idx =3D 0; idx < richloc->get_num_locations (); idx=
++)
> -     {
> -@@ -1072,10 +1286,13 @@ layout::maybe_add_location_range (const
> -=20
> -   /* Everything is now known to be in the correct source file,
> -      but it may require further sanitization.  */
> --  layout_range ri (exploc_with_display_col (start, m_context->tabstop),
> --		   exploc_with_display_col (finish, m_context->tabstop),
> -+  layout_range ri (exploc_with_display_col (start, m_policy,
> -+					    LOCATION_ASPECT_START),
> -+		   exploc_with_display_col (finish, m_policy,
> -+					    LOCATION_ASPECT_FINISH),
> - 		   loc_range->m_range_display_kind,
> --		   exploc_with_display_col (caret, m_context->tabstop),
> -+		   exploc_with_display_col (caret, m_policy,
> -+					    LOCATION_ASPECT_CARET),
> - 		   original_idx, loc_range->m_label);
> -=20
> -   /* If we have a range that finishes before it starts (perhaps
> -@@ -1409,7 +1626,7 @@ layout::calculate_x_offset_display ()
> -     =3D get_line_bytes_without_trailing_whitespace (line.get_buffer (),
> - 						  line.length ());
> -   int eol_display_column
> --    =3D cpp_display_width (line.get_buffer (), line_bytes, m_context->t=
abstop);
> -+    =3D cpp_display_width (line.get_buffer (), line_bytes, m_policy);
> -   if (caret_display_column > eol_display_column
> -       || !caret_display_column)
> -     {
> -@@ -1488,7 +1705,7 @@ layout::print_source_line (linenum_type
> -   /* This object helps to keep track of which display column we are at,=
 which is
> -      necessary for computing the line bounds in display units, for doing
> -      tab expansion, and for implementing m_x_offset_display.  */
> --  cpp_display_width_computation dw (line, line_bytes, m_context->tabsto=
p);
> -+  cpp_display_width_computation dw (line, line_bytes, m_policy);
> -=20
> -   /* Skip the first m_x_offset_display display columns.  In case the le=
ading
> -      portion that will be skipped ends with a character with wcwidth > =
1, then
> -@@ -1536,7 +1753,8 @@ layout::print_source_line (linenum_type
> - 	 tabs and replacing some control bytes with spaces as necessary.  */
> -       const char *c =3D dw.next_byte ();
> -       const int start_disp_col =3D dw.display_cols_processed () + 1;
> --      const int this_display_width =3D dw.process_next_codepoint ();
> -+      cpp_decoded_char cp;
> -+      const int this_display_width =3D dw.process_next_codepoint (&cp);
> -       if (*c =3D=3D '\t')
> - 	{
> - 	  /* The returned display width is the number of spaces into which the
> -@@ -1545,15 +1763,6 @@ layout::print_source_line (linenum_type
> - 	    pp_space (m_pp);
> - 	  continue;
> - 	}
> --      if (*c =3D=3D '\0' || *c =3D=3D '\r')
> --	{
> --	  /* cpp_wcwidth() promises to return 1 for all control bytes, and we
> --	     want to output these as a single space too, so this case is
> --	     actually the same as the '\t' case.  */
> --	  gcc_assert (this_display_width =3D=3D 1);
> --	  pp_space (m_pp);
> --	  continue;
> --	}
> -=20
> -       /* We have a (possibly multibyte) character to output; update the=
 line
> - 	 bounds if it is not whitespace.  */
> -@@ -1565,7 +1774,8 @@ layout::print_source_line (linenum_type
> - 	}
> -=20
> -       /* Output the character.  */
> --      while (c !=3D dw.next_byte ()) pp_character (m_pp, *c++);
> -+      m_policy.m_print_cb (m_pp, cp);
> -+      c =3D dw.next_byte ();
> -     }
> -   print_newline ();
> -   return lbounds;
> -@@ -1664,14 +1874,14 @@ layout::print_annotation_line (linenum_t
> - class line_label
> - {
> - public:
> --  line_label (diagnostic_context *context, int state_idx, int column,
> -+  line_label (const cpp_char_column_policy &policy,
> -+	      int state_idx, int column,
> - 	      label_text text)
> -   : m_state_idx (state_idx), m_column (column),
> -     m_text (text), m_label_line (0), m_has_vbar (true)
> -   {
> -     const int bytes =3D strlen (text.m_buffer);
> --    m_display_width
> --      =3D cpp_display_width (text.m_buffer, bytes, context->tabstop);
> -+    m_display_width =3D cpp_display_width (text.m_buffer, bytes, policy=
);
> -   }
> -=20
> -   /* Sorting is primarily by column, then by state index.  */
> -@@ -1731,7 +1941,7 @@ layout::print_any_labels (linenum_type r
> - 	if (text.m_buffer =3D=3D NULL)
> - 	  continue;
> -=20
> --	labels.safe_push (line_label (m_context, i, disp_col, text));
> -+	labels.safe_push (line_label (m_policy, i, disp_col, text));
> -       }
> -   }
> -=20
> -@@ -2011,7 +2221,7 @@ public:
> -=20
> - /* Get the range of bytes or display columns that HINT would affect.  */
> - static column_range
> --get_affected_range (diagnostic_context *context,
> -+get_affected_range (const cpp_char_column_policy &policy,
> - 		    const fixit_hint *hint, enum column_unit col_unit)
> - {
> -   expanded_location exploc_start =3D expand_location (hint->get_start_l=
oc ());
> -@@ -2022,13 +2232,11 @@ get_affected_range (diagnostic_context *
> -   int finish_column;
> -   if (col_unit =3D=3D CU_DISPLAY_COLS)
> -     {
> --      start_column
> --	=3D location_compute_display_column (exploc_start, context->tabstop);
> -+      start_column =3D location_compute_display_column (exploc_start, p=
olicy);
> -       if (hint->insertion_p ())
> - 	finish_column =3D start_column - 1;
> -       else
> --	finish_column
> --	  =3D location_compute_display_column (exploc_finish, context->tabstop=
);
> -+	finish_column =3D location_compute_display_column (exploc_finish, poli=
cy);
> -     }
> -   else
> -     {
> -@@ -2041,12 +2249,13 @@ get_affected_range (diagnostic_context *
> - /* Get the range of display columns that would be printed for HINT.  */
> -=20
> - static column_range
> --get_printed_columns (diagnostic_context *context, const fixit_hint *hin=
t)
> -+get_printed_columns (const cpp_char_column_policy &policy,
> -+		     const fixit_hint *hint)
> - {
> -   expanded_location exploc =3D expand_location (hint->get_start_loc ());
> --  int start_column =3D location_compute_display_column (exploc, context=
->tabstop);
> -+  int start_column =3D location_compute_display_column (exploc, policy);
> -   int hint_width =3D cpp_display_width (hint->get_string (), hint->get_=
length (),
> --				      context->tabstop);
> -+				      policy);
> -   int final_hint_column =3D start_column + hint_width - 1;
> -   if (hint->insertion_p ())
> -     {
> -@@ -2056,8 +2265,7 @@ get_printed_columns (diagnostic_context
> -     {
> -       exploc =3D expand_location (hint->get_next_loc ());
> -       --exploc.column;
> --      int finish_column
> --	=3D location_compute_display_column (exploc, context->tabstop);
> -+      int finish_column =3D location_compute_display_column (exploc, po=
licy);
> -       return column_range (start_column,
> - 			   MAX (finish_column, final_hint_column));
> -     }
> -@@ -2075,13 +2283,13 @@ public:
> - 	      column_range affected_columns,
> - 	      column_range printed_columns,
> - 	      const char *new_text, size_t new_text_len,
> --	      int tabstop)
> -+	      const cpp_char_column_policy &policy)
> -   : m_affected_bytes (affected_bytes),
> -     m_affected_columns (affected_columns),
> -     m_printed_columns (printed_columns),
> -     m_text (xstrdup (new_text)),
> -     m_byte_length (new_text_len),
> --    m_tabstop (tabstop),
> -+    m_policy (policy),
> -     m_alloc_sz (new_text_len + 1)
> -   {
> -     compute_display_cols ();
> -@@ -2099,7 +2307,7 @@ public:
> -=20
> -   void compute_display_cols ()
> -   {
> --    m_display_cols =3D cpp_display_width (m_text, m_byte_length, m_tabs=
top);
> -+    m_display_cols =3D cpp_display_width (m_text, m_byte_length, m_poli=
cy);
> -   }
> -=20
> -   void overwrite (int dst_offset, const char_span &src_span)
> -@@ -2127,7 +2335,7 @@ public:
> -   char *m_text;
> -   size_t m_byte_length; /* Not including null-terminator.  */
> -   int m_display_cols;
> --  int m_tabstop;
> -+  const cpp_char_column_policy &m_policy;
> -   size_t m_alloc_sz;
> - };
> -=20
> -@@ -2163,15 +2371,16 @@ correction::ensure_terminated ()
> - class line_corrections
> - {
> - public:
> --  line_corrections (diagnostic_context *context, const char *filename,
> -+  line_corrections (const char_display_policy &policy,
> -+		    const char *filename,
> - 		    linenum_type row)
> --    : m_context (context), m_filename (filename), m_row (row)
> -+  : m_policy (policy), m_filename (filename), m_row (row)
> -   {}
> -   ~line_corrections ();
> -=20
> -   void add_hint (const fixit_hint *hint);
> -=20
> --  diagnostic_context *m_context;
> -+  const char_display_policy &m_policy;
> -   const char *m_filename;
> -   linenum_type m_row;
> -   auto_vec <correction *> m_corrections;
> -@@ -2217,10 +2426,10 @@ source_line::source_line (const char *fi
> - void
> - line_corrections::add_hint (const fixit_hint *hint)
> - {
> --  column_range affected_bytes =3D get_affected_range (m_context, hint, =
CU_BYTES);
> --  column_range affected_columns =3D get_affected_range (m_context, hint,
> -+  column_range affected_bytes =3D get_affected_range (m_policy, hint, C=
U_BYTES);
> -+  column_range affected_columns =3D get_affected_range (m_policy, hint,
> - 						      CU_DISPLAY_COLS);
> --  column_range printed_columns =3D get_printed_columns (m_context, hint=
);
> -+  column_range printed_columns =3D get_printed_columns (m_policy, hint);
> -=20
> -   /* Potentially consolidate.  */
> -   if (!m_corrections.is_empty ())
> -@@ -2289,7 +2498,7 @@ line_corrections::add_hint (const fixit_
> - 					   printed_columns,
> - 					   hint->get_string (),
> - 					   hint->get_length (),
> --					   m_context->tabstop));
> -+					   m_policy));
> - }
> -=20
> - /* If there are any fixit hints on source line ROW, print them.
> -@@ -2303,7 +2512,7 @@ layout::print_trailing_fixits (linenum_t
> - {
> -   /* Build a list of correction instances for the line,
> -      potentially consolidating hints (for the sake of readability).  */
> --  line_corrections corrections (m_context, m_exploc.file, row);
> -+  line_corrections corrections (m_policy, m_exploc.file, row);
> -   for (unsigned int i =3D 0; i < m_fixit_hints.length (); i++)
> -     {
> -       const fixit_hint *hint =3D m_fixit_hints[i];
> -@@ -2646,6 +2855,59 @@ namespace selftest {
> -=20
> - /* Selftests for diagnostic_show_locus.  */
> -=20
> -+/* Verify that cpp_display_width correctly handles escaping.  */
> -+
> -+static void
> -+test_display_widths ()
> -+{
> -+  gcc_rich_location richloc (UNKNOWN_LOCATION);
> -+
> -+  /* U+03C0 "GREEK SMALL LETTER PI".  */
> -+  const char *pi =3D "\xCF\x80";
> -+  /* U+1F642 "SLIGHTLY SMILING FACE".  */
> -+  const char *emoji =3D "\xF0\x9F\x99\x82";
> -+  /* Stray trailing byte of a UTF-8 character.  */
> -+  const char *stray =3D "\xBF";
> -+  /* U+10FFFF.  */
> -+  const char *max_codepoint =3D "\xF4\x8F\xBF\xBF";
> -+
> -+  /* No escaping.  */
> -+  {
> -+    test_diagnostic_context dc;
> -+    char_display_policy policy (make_policy (dc, richloc));
> -+    ASSERT_EQ (cpp_display_width (pi, strlen (pi), policy), 1);
> -+    ASSERT_EQ (cpp_display_width (emoji, strlen (emoji), policy), 2);
> -+    ASSERT_EQ (cpp_display_width (stray, strlen (stray), policy), 1);
> -+    /* Don't check width of U+10FFFF; it's in a private use plane.  */
> -+  }
> -+
> -+  richloc.set_escape_on_output (true);
> -+
> -+  {
> -+    test_diagnostic_context dc;
> -+    dc.escape_format =3D DIAGNOSTICS_ESCAPE_FORMAT_UNICODE;
> -+    char_display_policy policy (make_policy (dc, richloc));
> -+    ASSERT_EQ (cpp_display_width (pi, strlen (pi), policy), 8);
> -+    ASSERT_EQ (cpp_display_width (emoji, strlen (emoji), policy), 9);
> -+    ASSERT_EQ (cpp_display_width (stray, strlen (stray), policy), 4);
> -+    ASSERT_EQ (cpp_display_width (max_codepoint, strlen (max_codepoint),
> -+				  policy),
> -+	       strlen ("<U+10FFFF>"));
> -+  }
> -+
> -+  {
> -+    test_diagnostic_context dc;
> -+    dc.escape_format =3D DIAGNOSTICS_ESCAPE_FORMAT_BYTES;
> -+    char_display_policy policy (make_policy (dc, richloc));
> -+    ASSERT_EQ (cpp_display_width (pi, strlen (pi), policy), 8);
> -+    ASSERT_EQ (cpp_display_width (emoji, strlen (emoji), policy), 16);
> -+    ASSERT_EQ (cpp_display_width (stray, strlen (stray), policy), 4);
> -+    ASSERT_EQ (cpp_display_width (max_codepoint, strlen (max_codepoint),
> -+				  policy),
> -+	       16);
> -+  }
> -+}
> -+
> - /* For precise tests of the layout, make clear where the source line wi=
ll
> -    start.  test_left_margin sets the total byte count from the left sid=
e of the
> -    screen to the start of source lines, after the line number and the s=
eparator,
> -@@ -2715,10 +2977,10 @@ test_layout_x_offset_display_utf8 (const
> -   char_span lspan =3D location_get_source_line (tmp.get_filename (), 1);
> -   ASSERT_EQ (line_display_cols,
> - 	     cpp_display_width (lspan.get_buffer (), lspan.length (),
> --				def_tabstop));
> -+				def_policy ()));
> -   ASSERT_EQ (line_display_cols,
> - 	     location_compute_display_column (expand_location (line_end),
> --					      def_tabstop));
> -+					      def_policy ()));
> -   ASSERT_EQ (0, memcmp (lspan.get_buffer () + (emoji_col - 1),
> - 			"\xf0\x9f\x98\x82\xf0\x9f\x98\x82", 8));
> -=20
> -@@ -2866,12 +3128,13 @@ test_layout_x_offset_display_tab (const
> -   ASSERT_EQ ('\t', *(lspan.get_buffer () + (tab_col - 1)));
> -   for (int tabstop =3D 1; tabstop !=3D num_tabstops; ++tabstop)
> -     {
> -+      cpp_char_column_policy policy (tabstop, cpp_wcwidth);
> -       ASSERT_EQ (line_bytes + extra_width[tabstop],
> - 		 cpp_display_width (lspan.get_buffer (), lspan.length (),
> --				    tabstop));
> -+				    policy));
> -       ASSERT_EQ (line_bytes + extra_width[tabstop],
> - 		 location_compute_display_column (expand_location (line_end),
> --						  tabstop));
> -+						  policy));
> -     }
> -=20
> -   /* Check that the tab is expanded to the expected number of spaces.  =
*/
> -@@ -4003,6 +4266,43 @@ test_one_liner_labels_utf8 ()
> - 			   " bb\xf0\x9f\x98\x82\xf0\x9f\x98\x82\n",
> - 		  pp_formatted_text (dc.printer));
> -   }
> -+
> -+  /* Example of escaping the source lines.  */
> -+  {
> -+    text_range_label label0 ("label 0\xf0\x9f\x98\x82");
> -+    text_range_label label1 ("label 1\xcf\x80");
> -+    text_range_label label2 ("label 2\xcf\x80");
> -+    gcc_rich_location richloc (foo, &label0);
> -+    richloc.add_range (bar, SHOW_RANGE_WITHOUT_CARET, &label1);
> -+    richloc.add_range (field, SHOW_RANGE_WITHOUT_CARET, &label2);
> -+    richloc.set_escape_on_output (true);
> -+
> -+    {
> -+      test_diagnostic_context dc;
> -+      dc.escape_format =3D DIAGNOSTICS_ESCAPE_FORMAT_UNICODE;
> -+      diagnostic_show_locus (&dc, &richloc, DK_ERROR);
> -+      ASSERT_STREQ (" <U+1F602>_foo =3D <U+03C0>_bar.<U+1F602>_field<U+=
03C0>;\n"
> -+		    " ^~~~~~~~~~~~~   ~~~~~~~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~\n"
> -+		    " |               |            |\n"
> -+		    " |               |            label 2\xcf\x80\n"
> -+		    " |               label 1\xcf\x80\n"
> -+		    " label 0\xf0\x9f\x98\x82\n",
> -+		    pp_formatted_text (dc.printer));
> -+    }
> -+    {
> -+      test_diagnostic_context dc;
> -+      dc.escape_format =3D DIAGNOSTICS_ESCAPE_FORMAT_BYTES;
> -+      diagnostic_show_locus (&dc, &richloc, DK_ERROR);
> -+      ASSERT_STREQ
> -+	(" <f0><9f><98><82>_foo =3D <cf><80>_bar.<f0><9f><98><82>_field<cf><80=
>;\n"
> -+	 " ^~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\=
n"
> -+	 " |                      |            |\n"
> -+	 " |                      |            label 2\xcf\x80\n"
> -+	 " |                      label 1\xcf\x80\n"
> -+	 " label 0\xf0\x9f\x98\x82\n",
> -+	 pp_formatted_text (dc.printer));
> -+    }
> -+  }
> - }
> -=20
> - /* Make sure that colorization codes don't interrupt a multibyte
> -@@ -4057,9 +4357,9 @@ test_diagnostic_show_locus_one_liner_utf
> -=20
> -   char_span lspan =3D location_get_source_line (tmp.get_filename (), 1);
> -   ASSERT_EQ (25, cpp_display_width (lspan.get_buffer (), lspan.length (=
),
> --				    def_tabstop));
> -+				    def_policy ()));
> -   ASSERT_EQ (25, location_compute_display_column (expand_location (line=
_end),
> --						  def_tabstop));
> -+						  def_policy ()));
> -=20
> -   test_one_liner_simple_caret_utf8 ();
> -   test_one_liner_caret_and_range_utf8 ();
> -@@ -4445,30 +4745,31 @@ test_overlapped_fixit_printing (const li
> - 		  pp_formatted_text (dc.printer));
> -=20
> -     /* Unit-test the line_corrections machinery.  */
> -+    char_display_policy policy (make_policy (dc, richloc));
> -     ASSERT_EQ (3, richloc.get_num_fixit_hints ());
> -     const fixit_hint *hint_0 =3D richloc.get_fixit_hint (0);
> -     ASSERT_EQ (column_range (12, 12),
> --	       get_affected_range (&dc, hint_0, CU_BYTES));
> -+	       get_affected_range (policy, hint_0, CU_BYTES));
> -     ASSERT_EQ (column_range (12, 12),
> --	       get_affected_range (&dc, hint_0, CU_DISPLAY_COLS));
> --    ASSERT_EQ (column_range (12, 22), get_printed_columns (&dc, hint_0)=
);
> -+	       get_affected_range (policy, hint_0, CU_DISPLAY_COLS));
> -+    ASSERT_EQ (column_range (12, 22), get_printed_columns (policy, hint=
_0));
> -     const fixit_hint *hint_1 =3D richloc.get_fixit_hint (1);
> -     ASSERT_EQ (column_range (18, 18),
> --	       get_affected_range (&dc, hint_1, CU_BYTES));
> -+	       get_affected_range (policy, hint_1, CU_BYTES));
> -     ASSERT_EQ (column_range (18, 18),
> --	       get_affected_range (&dc, hint_1, CU_DISPLAY_COLS));
> --    ASSERT_EQ (column_range (18, 20), get_printed_columns (&dc, hint_1)=
);
> -+	       get_affected_range (policy, hint_1, CU_DISPLAY_COLS));
> -+    ASSERT_EQ (column_range (18, 20), get_printed_columns (policy, hint=
_1));
> -     const fixit_hint *hint_2 =3D richloc.get_fixit_hint (2);
> -     ASSERT_EQ (column_range (29, 28),
> --	       get_affected_range (&dc, hint_2, CU_BYTES));
> -+	       get_affected_range (policy, hint_2, CU_BYTES));
> -     ASSERT_EQ (column_range (29, 28),
> --	       get_affected_range (&dc, hint_2, CU_DISPLAY_COLS));
> --    ASSERT_EQ (column_range (29, 29), get_printed_columns (&dc, hint_2)=
);
> -+	       get_affected_range (policy, hint_2, CU_DISPLAY_COLS));
> -+    ASSERT_EQ (column_range (29, 29), get_printed_columns (policy, hint=
_2));
> -=20
> -     /* Add each hint in turn to a line_corrections instance,
> -        and verify that they are consolidated into one correction instan=
ce
> -        as expected.  */
> --    line_corrections lc (&dc, tmp.get_filename (), 1);
> -+    line_corrections lc (policy, tmp.get_filename (), 1);
> -=20
> -     /* The first replace hint by itself.  */
> -     lc.add_hint (hint_0);
> -@@ -4660,30 +4961,31 @@ test_overlapped_fixit_printing_utf8 (con
> - 		  pp_formatted_text (dc.printer));
> -=20
> -     /* Unit-test the line_corrections machinery.  */
> -+    char_display_policy policy (make_policy (dc, richloc));
> -     ASSERT_EQ (3, richloc.get_num_fixit_hints ());
> -     const fixit_hint *hint_0 =3D richloc.get_fixit_hint (0);
> -     ASSERT_EQ (column_range (14, 14),
> --	       get_affected_range (&dc, hint_0, CU_BYTES));
> -+	       get_affected_range (policy, hint_0, CU_BYTES));
> -     ASSERT_EQ (column_range (12, 12),
> --	       get_affected_range (&dc, hint_0, CU_DISPLAY_COLS));
> --    ASSERT_EQ (column_range (12, 22), get_printed_columns (&dc, hint_0)=
);
> -+	       get_affected_range (policy, hint_0, CU_DISPLAY_COLS));
> -+    ASSERT_EQ (column_range (12, 22), get_printed_columns (policy, hint=
_0));
> -     const fixit_hint *hint_1 =3D richloc.get_fixit_hint (1);
> -     ASSERT_EQ (column_range (22, 22),
> --	       get_affected_range (&dc, hint_1, CU_BYTES));
> -+	       get_affected_range (policy, hint_1, CU_BYTES));
> -     ASSERT_EQ (column_range (18, 18),
> --	       get_affected_range (&dc, hint_1, CU_DISPLAY_COLS));
> --    ASSERT_EQ (column_range (18, 20), get_printed_columns (&dc, hint_1)=
);
> -+	       get_affected_range (policy, hint_1, CU_DISPLAY_COLS));
> -+    ASSERT_EQ (column_range (18, 20), get_printed_columns (policy, hint=
_1));
> -     const fixit_hint *hint_2 =3D richloc.get_fixit_hint (2);
> -     ASSERT_EQ (column_range (35, 34),
> --	       get_affected_range (&dc, hint_2, CU_BYTES));
> -+	       get_affected_range (policy, hint_2, CU_BYTES));
> -     ASSERT_EQ (column_range (30, 29),
> --	       get_affected_range (&dc, hint_2, CU_DISPLAY_COLS));
> --    ASSERT_EQ (column_range (30, 30), get_printed_columns (&dc, hint_2)=
);
> -+	       get_affected_range (policy, hint_2, CU_DISPLAY_COLS));
> -+    ASSERT_EQ (column_range (30, 30), get_printed_columns (policy, hint=
_2));
> -=20
> -     /* Add each hint in turn to a line_corrections instance,
> -        and verify that they are consolidated into one correction instan=
ce
> -        as expected.  */
> --    line_corrections lc (&dc, tmp.get_filename (), 1);
> -+    line_corrections lc (policy, tmp.get_filename (), 1);
> -=20
> -     /* The first replace hint by itself.  */
> -     lc.add_hint (hint_0);
> -@@ -4877,15 +5179,16 @@ test_overlapped_fixit_printing_2 (const
> -     richloc.add_fixit_insert_before (col_21, "}");
> -=20
> -     /* These fixits should be accepted; they can't be consolidated.  */
> -+    char_display_policy policy (make_policy (dc, richloc));
> -     ASSERT_EQ (2, richloc.get_num_fixit_hints ());
> -     const fixit_hint *hint_0 =3D richloc.get_fixit_hint (0);
> -     ASSERT_EQ (column_range (23, 22),
> --	       get_affected_range (&dc, hint_0, CU_BYTES));
> --    ASSERT_EQ (column_range (23, 23), get_printed_columns (&dc, hint_0)=
);
> -+	       get_affected_range (policy, hint_0, CU_BYTES));
> -+    ASSERT_EQ (column_range (23, 23), get_printed_columns (policy, hint=
_0));
> -     const fixit_hint *hint_1 =3D richloc.get_fixit_hint (1);
> -     ASSERT_EQ (column_range (21, 20),
> --	       get_affected_range (&dc, hint_1, CU_BYTES));
> --    ASSERT_EQ (column_range (21, 21), get_printed_columns (&dc, hint_1)=
);
> -+	       get_affected_range (policy, hint_1, CU_BYTES));
> -+    ASSERT_EQ (column_range (21, 21), get_printed_columns (policy, hint=
_1));
> -=20
> -     /* Verify that they're printed correctly.  */
> -     diagnostic_show_locus (&dc, &richloc, DK_ERROR);
> -@@ -5152,10 +5455,11 @@ test_tab_expansion (const line_table_cas
> -      ....................123 45678901234 56789012345  columns  */
> -=20
> -   const int tabstop =3D 8;
> -+  cpp_char_column_policy policy (tabstop, cpp_wcwidth);
> -   const int first_non_ws_byte_col =3D 7;
> -   const int right_quote_byte_col =3D 15;
> -   const int last_byte_col =3D 25;
> --  ASSERT_EQ (35, cpp_display_width (content, last_byte_col, tabstop));
> -+  ASSERT_EQ (35, cpp_display_width (content, last_byte_col, policy));
> -=20
> -   temp_source_file tmp (SELFTEST_LOCATION, ".c", content);
> -   line_table_test ltt (case_);
> -@@ -5198,6 +5502,114 @@ test_tab_expansion (const line_table_cas
> -   }
> - }
> -=20
> -+/* Verify that the escaping machinery can cope with a variety of differ=
ent
> -+   invalid bytes.  */
> -+
> -+static void
> -+test_escaping_bytes_1 (const line_table_case &case_)
> -+{
> -+  const char content[] =3D "before\0\1\2\3\r\x80\xff""after\n";
> -+  const size_t sz =3D sizeof (content);
> -+  temp_source_file tmp (SELFTEST_LOCATION, ".c", content, sz);
> -+  line_table_test ltt (case_);
> -+  const line_map_ordinary *ord_map =3D linemap_check_ordinary
> -+    (linemap_add (line_table, LC_ENTER, false, tmp.get_filename (), 0));
> -+  linemap_line_start (line_table, 1, 100);
> -+
> -+  location_t finish
> -+    =3D linemap_position_for_line_and_column (line_table, ord_map, 1,
> -+					    strlen (content));
> -+
> -+  if (finish > LINE_MAP_MAX_LOCATION_WITH_COLS)
> -+    return;
> -+
> -+  /* Locations of the NUL and \r bytes.  */
> -+  location_t nul_loc
> -+    =3D linemap_position_for_line_and_column (line_table, ord_map, 1, 7=
);
> -+  location_t r_loc
> -+    =3D linemap_position_for_line_and_column (line_table, ord_map, 1, 1=
1);
> -+  gcc_rich_location richloc (nul_loc);
> -+  richloc.add_range (r_loc);
> -+
> -+  {
> -+    test_diagnostic_context dc;
> -+    diagnostic_show_locus (&dc, &richloc, DK_ERROR);
> -+    ASSERT_STREQ (" before \1\2\3 \x80\xff""after\n"
> -+		  "       ^   ~\n",
> -+		  pp_formatted_text (dc.printer));
> -+  }
> -+  richloc.set_escape_on_output (true);
> -+  {
> -+    test_diagnostic_context dc;
> -+    dc.escape_format =3D DIAGNOSTICS_ESCAPE_FORMAT_UNICODE;
> -+    diagnostic_show_locus (&dc, &richloc, DK_ERROR);
> -+    ASSERT_STREQ
> -+      (" before<U+0000><U+0001><U+0002><U+0003><U+000D><80><ff>after\n"
> -+       "       ^~~~~~~~                        ~~~~~~~~\n",
> -+       pp_formatted_text (dc.printer));
> -+  }
> -+  {
> -+    test_diagnostic_context dc;
> -+    dc.escape_format =3D DIAGNOSTICS_ESCAPE_FORMAT_BYTES;
> -+    diagnostic_show_locus (&dc, &richloc, DK_ERROR);
> -+    ASSERT_STREQ (" before<00><01><02><03><0d><80><ff>after\n"
> -+		  "       ^~~~            ~~~~\n",
> -+		  pp_formatted_text (dc.printer));
> -+  }
> -+}
> -+
> -+/* As above, but verify that we handle the initial byte of a line
> -+   correctly.  */
> -+
> -+static void
> -+test_escaping_bytes_2 (const line_table_case &case_)
> -+{
> -+  const char content[]  =3D "\0after\n";
> -+  const size_t sz =3D sizeof (content);
> -+  temp_source_file tmp (SELFTEST_LOCATION, ".c", content, sz);
> -+  line_table_test ltt (case_);
> -+  const line_map_ordinary *ord_map =3D linemap_check_ordinary
> -+    (linemap_add (line_table, LC_ENTER, false, tmp.get_filename (), 0));
> -+  linemap_line_start (line_table, 1, 100);
> -+
> -+  location_t finish
> -+    =3D linemap_position_for_line_and_column (line_table, ord_map, 1,
> -+					    strlen (content));
> -+
> -+  if (finish > LINE_MAP_MAX_LOCATION_WITH_COLS)
> -+    return;
> -+
> -+  /* Location of the NUL byte.  */
> -+  location_t nul_loc
> -+    =3D linemap_position_for_line_and_column (line_table, ord_map, 1, 1=
);
> -+  gcc_rich_location richloc (nul_loc);
> -+
> -+  {
> -+    test_diagnostic_context dc;
> -+    diagnostic_show_locus (&dc, &richloc, DK_ERROR);
> -+    ASSERT_STREQ ("  after\n"
> -+		  " ^\n",
> -+		  pp_formatted_text (dc.printer));
> -+  }
> -+  richloc.set_escape_on_output (true);
> -+  {
> -+    test_diagnostic_context dc;
> -+    dc.escape_format =3D DIAGNOSTICS_ESCAPE_FORMAT_UNICODE;
> -+    diagnostic_show_locus (&dc, &richloc, DK_ERROR);
> -+    ASSERT_STREQ (" <U+0000>after\n"
> -+		  " ^~~~~~~~\n",
> -+		  pp_formatted_text (dc.printer));
> -+  }
> -+  {
> -+    test_diagnostic_context dc;
> -+    dc.escape_format =3D DIAGNOSTICS_ESCAPE_FORMAT_BYTES;
> -+    diagnostic_show_locus (&dc, &richloc, DK_ERROR);
> -+    ASSERT_STREQ (" <00>after\n"
> -+		  " ^~~~\n",
> -+		  pp_formatted_text (dc.printer));
> -+  }
> -+}
> -+
> - /* Verify that line numbers are correctly printed for the case of
> -    a multiline range in which the width of the line numbers changes
> -    (e.g. from "9" to "10").  */
> -@@ -5254,6 +5666,8 @@ diagnostic_show_locus_c_tests ()
> -   test_layout_range_for_single_line ();
> -   test_layout_range_for_multiple_lines ();
> -=20
> -+  test_display_widths ();
> -+
> -   for_each_line_table_case (test_layout_x_offset_display_utf8);
> -   for_each_line_table_case (test_layout_x_offset_display_tab);
> -=20
> -@@ -5274,6 +5688,8 @@ diagnostic_show_locus_c_tests ()
> -   for_each_line_table_case (test_fixit_replace_containing_newline);
> -   for_each_line_table_case (test_fixit_deletion_affecting_newline);
> -   for_each_line_table_case (test_tab_expansion);
> -+  for_each_line_table_case (test_escaping_bytes_1);
> -+  for_each_line_table_case (test_escaping_bytes_2);
> -=20
> -   test_line_numbers_multiline_range ();
> - }
> -diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
> ---- a/gcc/doc/invoke.texi	2021-12-13 23:23:05.764437151 -0800
> -+++ b/gcc/doc/invoke.texi	2021-12-14 01:16:01.553943061 -0800
> -@@ -312,7 +312,8 @@ Objective-C and Objective-C++ Dialects}.
> - -fdiagnostics-show-path-depths @gol
> - -fno-show-column @gol
> - -fdiagnostics-column-unit=3D@r{[}display@r{|}byte@r{]} @gol
> ---fdiagnostics-column-origin=3D@var{origin}}
> -+-fdiagnostics-column-origin=3D@var{origin} @gol
> -+-fdiagnostics-escape-format=3D@r{[}unicode@r{|}bytes@r{]}}
> -=20
> - @item Warning Options
> - @xref{Warning Options,,Options to Request or Suppress Warnings}.
> -@@ -5083,6 +5084,38 @@ first column.  The default value of 1 co
> - behavior and to the GNU style guide.  Some utilities may perform better=
 with an
> - origin of 0; any non-negative value may be specified.
> -=20
> -+@item -fdiagnostics-escape-format=3D@var{FORMAT}
> -+@opindex fdiagnostics-escape-format
> -+When GCC prints pertinent source lines for a diagnostic it normally att=
empts
> -+to print the source bytes directly.  However, some diagnostics relate t=
o encoding
> -+issues in the source file, such as malformed UTF-8, or issues with Unic=
ode
> -+normalization.  These diagnostics are flagged so that GCC will escape b=
ytes
> -+that are not printable ASCII when printing their pertinent source lines.
> -+
> -+This option controls how such bytes should be escaped.
> -+
> -+The default @var{FORMAT}, @samp{unicode} displays Unicode characters th=
at
> -+are not printable ASCII in the form @samp{<U+XXXX>}, and bytes that do =
not
> -+correspond to a Unicode character validly-encoded in UTF-8-encoded will=
 be
> -+displayed as hexadecimal in the form @samp{<XX>}.
> -+
> -+For example, a source line containing the string @samp{before} followed=
 by the
> -+Unicode character U+03C0 (``GREEK SMALL LETTER PI'', with UTF-8 encoding
> -+0xCF 0x80) followed by the byte 0xBF (a stray UTF-8 trailing byte), fol=
lowed by
> -+the string @samp{after} will be printed for such a diagnostic as:
> -+
> -+@smallexample
> -+ before<U+03C0><BF>after
> -+@end smallexample
> -+
> -+Setting @var{FORMAT} to @samp{bytes} will display all non-printable-ASC=
II bytes
> -+in the form @samp{<XX>}, thus showing the underlying encoding of non-AS=
CII
> -+Unicode characters.  For the example above, the following will be print=
ed:
> -+
> -+@smallexample
> -+ before<CF><80><BF>after
> -+@end smallexample
> -+
> - @item -fdiagnostics-format=3D@var{FORMAT}
> - @opindex fdiagnostics-format
> - Select a different format for printing diagnostics.
> -@@ -5150,9 +5183,11 @@ might be printed in JSON form (after for
> -                         @}
> -                     @}
> -                 ],
> -+                "escape-source": false,
> -                 "message": "...this statement, but the latter is @dots{=
}"
> -             @}
> -         ]
> -+	"escape-source": false,
> - 	"column-origin": 1,
> -     @},
> -     @dots{}
> -@@ -5239,6 +5274,7 @@ of the expression, which have labels.  I
> -                 "label": "T @{aka struct t@}"
> -             @}
> -         ],
> -+        "escape-source": false,
> -         "message": "invalid operands to binary + @dots{}"
> -     @}
> - @end smallexample
> -@@ -5292,6 +5328,7 @@ might be printed in JSON form as:
> -                 @}
> -             @}
> -         ],
> -+        "escape-source": false,
> -         "message": "\u2018struct s\u2019 has no member named @dots{}"
> -     @}
> - @end smallexample
> -@@ -5349,6 +5386,10 @@ For example, the intraprocedural example
> -     ]
> - @end smallexample
> -=20
> -+Diagnostics have a boolean attribute @code{escape-source}, hinting whet=
her
> -+non-ASCII bytes should be escaped when printing the pertinent lines of
> -+source code (@code{true} for diagnostics involving source encoding issu=
es).
> -+
> - @end table
> -=20
> - @node Warning Options
> -diff --git a/gcc/input.c b/gcc/input.c
> ---- a/gcc/input.c	2021-07-27 23:55:07.328287915 -0700
> -+++ b/gcc/input.c	2021-12-14 01:16:01.553943061 -0800
> -@@ -913,7 +913,8 @@ make_location (location_t caret, source_
> -    source line in order to calculate the display width.  If that cannot=
 be done
> -    for any reason, then returns the byte column as a fallback.  */
> - int
> --location_compute_display_column (expanded_location exploc, int tabstop)
> -+location_compute_display_column (expanded_location exploc,
> -+				 const cpp_char_column_policy &policy)
> - {
> -   if (!(exploc.file && *exploc.file && exploc.line && exploc.column))
> -     return exploc.column;
> -@@ -921,7 +922,7 @@ location_compute_display_column (expande
> -   /* If line is NULL, this function returns exploc.column which is the
> -      desired fallback.  */
> -   return cpp_byte_column_to_display_column (line.get_buffer (), line.le=
ngth (),
> --					    exploc.column, tabstop);
> -+					    exploc.column, policy);
> - }
> -=20
> - /* Dump statistics to stderr about the memory usage of the line_table
> -@@ -3611,43 +3612,50 @@ test_line_offset_overflow ()
> - void test_cpp_utf8 ()
> - {
> -   const int def_tabstop =3D 8;
> -+  cpp_char_column_policy policy (def_tabstop, cpp_wcwidth);
> -+
> -   /* Verify that wcwidth of invalid UTF-8 or control bytes is 1.  */
> -   {
> --    int w_bad =3D cpp_display_width ("\xf0!\x9f!\x98!\x82!", 8, def_tab=
stop);
> -+    int w_bad =3D cpp_display_width ("\xf0!\x9f!\x98!\x82!", 8, policy);
> -     ASSERT_EQ (8, w_bad);
> --    int w_ctrl =3D cpp_display_width ("\r\n\v\0\1", 5, def_tabstop);
> -+    int w_ctrl =3D cpp_display_width ("\r\n\v\0\1", 5, policy);
> -     ASSERT_EQ (5, w_ctrl);
> -   }
> -=20
> -   /* Verify that wcwidth of valid UTF-8 is as expected.  */
> -   {
> --    const int w_pi =3D cpp_display_width ("\xcf\x80", 2, def_tabstop);
> -+    const int w_pi =3D cpp_display_width ("\xcf\x80", 2, policy);
> -     ASSERT_EQ (1, w_pi);
> --    const int w_emoji =3D cpp_display_width ("\xf0\x9f\x98\x82", 4, def=
_tabstop);
> -+    const int w_emoji =3D cpp_display_width ("\xf0\x9f\x98\x82", 4, pol=
icy);
> -     ASSERT_EQ (2, w_emoji);
> -     const int w_umlaut_precomposed =3D cpp_display_width ("\xc3\xbf", 2,
> --							def_tabstop);
> -+							policy);
> -     ASSERT_EQ (1, w_umlaut_precomposed);
> -     const int w_umlaut_combining =3D cpp_display_width ("y\xcc\x88", 3,
> --						      def_tabstop);
> -+						      policy);
> -     ASSERT_EQ (1, w_umlaut_combining);
> --    const int w_han =3D cpp_display_width ("\xe4\xb8\xba", 3, def_tabst=
op);
> -+    const int w_han =3D cpp_display_width ("\xe4\xb8\xba", 3, policy);
> -     ASSERT_EQ (2, w_han);
> --    const int w_ascii =3D cpp_display_width ("GCC", 3, def_tabstop);
> -+    const int w_ascii =3D cpp_display_width ("GCC", 3, policy);
> -     ASSERT_EQ (3, w_ascii);
> -     const int w_mixed =3D cpp_display_width ("\xcf\x80 =3D 3.14 \xf0\x9=
f\x98\x82"
> - 					   "\x9f! \xe4\xb8\xba y\xcc\x88",
> --					   24, def_tabstop);
> -+					   24, policy);
> -     ASSERT_EQ (18, w_mixed);
> -   }
> -=20
> -   /* Verify that display width properly expands tabs.  */
> -   {
> -     const char *tstr =3D "\tabc\td";
> --    ASSERT_EQ (6, cpp_display_width (tstr, 6, 1));
> --    ASSERT_EQ (10, cpp_display_width (tstr, 6, 3));
> --    ASSERT_EQ (17, cpp_display_width (tstr, 6, 8));
> --    ASSERT_EQ (1, cpp_display_column_to_byte_column (tstr, 6, 7, 8));
> -+    ASSERT_EQ (6, cpp_display_width (tstr, 6,
> -+				     cpp_char_column_policy (1, cpp_wcwidth)));
> -+    ASSERT_EQ (10, cpp_display_width (tstr, 6,
> -+				      cpp_char_column_policy (3, cpp_wcwidth)));
> -+    ASSERT_EQ (17, cpp_display_width (tstr, 6,
> -+				      cpp_char_column_policy (8, cpp_wcwidth)));
> -+    ASSERT_EQ (1,
> -+	       cpp_display_column_to_byte_column
> -+		 (tstr, 6, 7, cpp_char_column_policy (8, cpp_wcwidth)));
> -   }
> -=20
> -   /* Verify that cpp_byte_column_to_display_column can go past the end,
> -@@ -3660,13 +3668,13 @@ void test_cpp_utf8 ()
> -       /* 111122223456
> - 	 Byte columns.  */
> -=20
> --    ASSERT_EQ (5, cpp_display_width (str, 6, def_tabstop));
> -+    ASSERT_EQ (5, cpp_display_width (str, 6, policy));
> -     ASSERT_EQ (105,
> --	       cpp_byte_column_to_display_column (str, 6, 106, def_tabstop));
> -+	       cpp_byte_column_to_display_column (str, 6, 106, policy));
> -     ASSERT_EQ (10000,
> --	       cpp_byte_column_to_display_column (NULL, 0, 10000, def_tabstop)=
);
> -+	       cpp_byte_column_to_display_column (NULL, 0, 10000, policy));
> -     ASSERT_EQ (0,
> --	       cpp_byte_column_to_display_column (NULL, 10000, 0, def_tabstop)=
);
> -+	       cpp_byte_column_to_display_column (NULL, 10000, 0, policy));
> -   }
> -=20
> -   /* Verify that cpp_display_column_to_byte_column can go past the end,
> -@@ -3680,25 +3688,25 @@ void test_cpp_utf8 ()
> -       /* 000000000000000000000000000000000111111
> - 	 111122223333444456666777788889999012345
> - 	 Byte columns.  */
> --    ASSERT_EQ (4, cpp_display_column_to_byte_column (str, 15, 2, def_ta=
bstop));
> -+    ASSERT_EQ (4, cpp_display_column_to_byte_column (str, 15, 2, policy=
));
> -     ASSERT_EQ (15,
> --	       cpp_display_column_to_byte_column (str, 15, 11, def_tabstop));
> -+	       cpp_display_column_to_byte_column (str, 15, 11, policy));
> -     ASSERT_EQ (115,
> --	       cpp_display_column_to_byte_column (str, 15, 111, def_tabstop));
> -+	       cpp_display_column_to_byte_column (str, 15, 111, policy));
> -     ASSERT_EQ (10000,
> --	       cpp_display_column_to_byte_column (NULL, 0, 10000, def_tabstop)=
);
> -+	       cpp_display_column_to_byte_column (NULL, 0, 10000, policy));
> -     ASSERT_EQ (0,
> --	       cpp_display_column_to_byte_column (NULL, 10000, 0, def_tabstop)=
);
> -+	       cpp_display_column_to_byte_column (NULL, 10000, 0, policy));
> -=20
> -     /* Verify that we do not interrupt a UTF-8 sequence.  */
> --    ASSERT_EQ (4, cpp_display_column_to_byte_column (str, 15, 1, def_ta=
bstop));
> -+    ASSERT_EQ (4, cpp_display_column_to_byte_column (str, 15, 1, policy=
));
> -=20
> -     for (int byte_col =3D 1; byte_col <=3D 15; ++byte_col)
> -       {
> - 	const int disp_col
> --	  =3D cpp_byte_column_to_display_column (str, 15, byte_col, def_tabsto=
p);
> -+	  =3D cpp_byte_column_to_display_column (str, 15, byte_col, policy);
> - 	const int byte_col2
> --	  =3D cpp_display_column_to_byte_column (str, 15, disp_col, def_tabsto=
p);
> -+	  =3D cpp_display_column_to_byte_column (str, 15, disp_col, policy);
> -=20
> - 	/* If we ask for the display column in the middle of a UTF-8
> - 	   sequence, it will return the length of the partial sequence,
> -diff --git a/gcc/input.h b/gcc/input.h
> ---- a/gcc/input.h	2021-07-27 23:55:07.328287915 -0700
> -+++ b/gcc/input.h	2021-12-14 01:16:01.553943061 -0800
> -@@ -39,8 +39,11 @@ STATIC_ASSERT (BUILTINS_LOCATION < RESER
> - extern bool is_location_from_builtin_token (location_t);
> - extern expanded_location expand_location (location_t);
> -=20
> --extern int location_compute_display_column (expanded_location exploc,
> --					    int tabstop);
> -+class cpp_char_column_policy;
> -+
> -+extern int
> -+location_compute_display_column (expanded_location exploc,
> -+				 const cpp_char_column_policy &policy);
> -=20
> - /* A class capturing the bounds of a buffer, to allow for run-time
> -    bounds-checking in a checked build.  */
> -diff --git a/gcc/opts.c b/gcc/opts.c
> ---- a/gcc/opts.c	2021-07-27 23:55:07.364288417 -0700
> -+++ b/gcc/opts.c	2021-12-14 01:16:01.553943061 -0800
> -@@ -2573,6 +2573,10 @@ common_handle_option (struct gcc_options
> -       dc->column_origin =3D value;
> -       break;
> -=20
> -+    case OPT_fdiagnostics_escape_format_:
> -+      dc->escape_format =3D (enum diagnostics_escape_format)value;
> -+      break;
> -+
> -     case OPT_fdiagnostics_show_cwe:
> -       dc->show_cwe =3D value;
> -       break;
> -diff --git a/gcc/selftest.c b/gcc/selftest.c
> ---- a/gcc/selftest.c	2021-07-27 23:55:07.500290315 -0700
> -+++ b/gcc/selftest.c	2021-12-14 01:16:01.557942991 -0800
> -@@ -193,6 +193,21 @@ temp_source_file::temp_source_file (cons
> -   fclose (out);
> - }
> -=20
> -+/* As above, but with a size, to allow for NUL bytes in CONTENT.  */
> -+
> -+temp_source_file::temp_source_file (const location &loc,
> -+				    const char *suffix,
> -+				    const char *content,
> -+				    size_t sz)
> -+: named_temp_file (suffix)
> -+{
> -+  FILE *out =3D fopen (get_filename (), "w");
> -+  if (!out)
> -+    fail_formatted (loc, "unable to open tempfile: %s", get_filename ()=
);
> -+  fwrite (content, sz, 1, out);
> -+  fclose (out);
> -+}
> -+
> - /* Avoid introducing locale-specific differences in the results
> -    by hardcoding open_quote and close_quote.  */
> -=20
> -diff --git a/gcc/selftest.h b/gcc/selftest.h
> ---- a/gcc/selftest.h	2021-07-27 23:55:07.500290315 -0700
> -+++ b/gcc/selftest.h	2021-12-14 01:16:01.557942991 -0800
> -@@ -112,6 +112,8 @@ class temp_source_file : public named_te
> -  public:
> -   temp_source_file (const location &loc, const char *suffix,
> - 		    const char *content);
> -+  temp_source_file (const location &loc, const char *suffix,
> -+		    const char *content, size_t sz);
> - };
> -=20
> - /* RAII-style class for avoiding introducing locale-specific differences
> -diff --git a/gcc/testsuite/c-c++-common/diagnostic-format-json-1.c b/gcc=
/testsuite/c-c++-common/diagnostic-format-json-1.c
> ---- a/gcc/testsuite/c-c++-common/diagnostic-format-json-1.c	2021-07-27 2=
3:55:07.596291654 -0700
> -+++ b/gcc/testsuite/c-c++-common/diagnostic-format-json-1.c	2021-12-14 0=
1:16:01.557942991 -0800
> -@@ -9,6 +9,7 @@
> -=20
> - /* { dg-regexp "\"kind\": \"error\"" } */
> - /* { dg-regexp "\"column-origin\": 1" } */
> -+/* { dg-regexp "\"escape-source\": false" } */
> - /* { dg-regexp "\"message\": \"#error message\"" } */
> -=20
> - /* { dg-regexp "\"caret\": \{" } */
> -diff --git a/gcc/testsuite/c-c++-common/diagnostic-format-json-2.c b/gcc=
/testsuite/c-c++-common/diagnostic-format-json-2.c
> ---- a/gcc/testsuite/c-c++-common/diagnostic-format-json-2.c	2021-07-27 2=
3:55:07.596291654 -0700
> -+++ b/gcc/testsuite/c-c++-common/diagnostic-format-json-2.c	2021-12-14 0=
1:16:01.557942991 -0800
> -@@ -9,6 +9,7 @@
> -=20
> - /* { dg-regexp "\"kind\": \"warning\"" } */
> - /* { dg-regexp "\"column-origin\": 1" } */
> -+/* { dg-regexp "\"escape-source\": false" } */
> - /* { dg-regexp "\"message\": \"#warning message\"" } */
> - /* { dg-regexp "\"option\": \"-Wcpp\"" } */
> - /* { dg-regexp "\"option_url\": \"https:\[^\n\r\"\]*#index-Wcpp\"" } */
> -diff --git a/gcc/testsuite/c-c++-common/diagnostic-format-json-3.c b/gcc=
/testsuite/c-c++-common/diagnostic-format-json-3.c
> ---- a/gcc/testsuite/c-c++-common/diagnostic-format-json-3.c	2021-07-27 2=
3:55:07.596291654 -0700
> -+++ b/gcc/testsuite/c-c++-common/diagnostic-format-json-3.c	2021-12-14 0=
1:16:01.557942991 -0800
> -@@ -9,6 +9,7 @@
> -=20
> - /* { dg-regexp "\"kind\": \"error\"" } */
> - /* { dg-regexp "\"column-origin\": 1" } */
> -+/* { dg-regexp "\"escape-source\": false" } */
> - /* { dg-regexp "\"message\": \"#warning message\"" } */
> - /* { dg-regexp "\"option\": \"-Werror=3Dcpp\"" } */
> - /* { dg-regexp "\"option_url\": \"https:\[^\n\r\"\]*#index-Wcpp\"" } */
> -diff --git a/gcc/testsuite/c-c++-common/diagnostic-format-json-4.c b/gcc=
/testsuite/c-c++-common/diagnostic-format-json-4.c
> ---- a/gcc/testsuite/c-c++-common/diagnostic-format-json-4.c	2021-07-27 2=
3:55:07.596291654 -0700
> -+++ b/gcc/testsuite/c-c++-common/diagnostic-format-json-4.c	2021-12-14 0=
1:16:01.557942991 -0800
> -@@ -19,6 +19,7 @@ int test (void)
> -=20
> - /* { dg-regexp "\"kind\": \"note\"" } */
> - /* { dg-regexp "\"message\": \"...this statement, but the latter is mis=
leadingly indented as if it were guarded by the 'if'\"" } */
> -+/* { dg-regexp "\"escape-source\": false" } */
> -=20
> - /* { dg-regexp "\"caret\": \{" } */
> - /* { dg-regexp "\"file\": \"\[^\n\r\"\]*diagnostic-format-json-4.c\"" }=
 */
> -@@ -39,6 +40,7 @@ int test (void)
> - /* { dg-regexp "\"kind\": \"warning\"" } */
> - /* { dg-regexp "\"column-origin\": 1" } */
> - /* { dg-regexp "\"message\": \"this 'if' clause does not guard...\"" } =
*/
> -+/* { dg-regexp "\"escape-source\": false" } */
> - /* { dg-regexp "\"option\": \"-Wmisleading-indentation\"" } */
> - /* { dg-regexp "\"option_url\": \"https:\[^\n\r\"\]*#index-Wmisleading-=
indentation\"" } */
> -=20
> -diff --git a/gcc/testsuite/c-c++-common/diagnostic-format-json-5.c b/gcc=
/testsuite/c-c++-common/diagnostic-format-json-5.c
> ---- a/gcc/testsuite/c-c++-common/diagnostic-format-json-5.c	2021-07-27 2=
3:55:07.596291654 -0700
> -+++ b/gcc/testsuite/c-c++-common/diagnostic-format-json-5.c	2021-12-14 0=
1:16:01.557942991 -0800
> -@@ -14,6 +14,7 @@ int test (struct s *ptr)
> -=20
> - /* { dg-regexp "\"kind\": \"error\"" } */
> - /* { dg-regexp "\"column-origin\": 1" } */
> -+/* { dg-regexp "\"escape-source\": false" } */
> - /* { dg-regexp "\"message\": \".*\"" } */
> -=20
> - /* Verify fix-it hints.  */
> -diff --git a/gcc/testsuite/gcc.dg/cpp/warn-normalized-4-bytes.c b/gcc/te=
stsuite/gcc.dg/cpp/warn-normalized-4-bytes.c
> ---- a/gcc/testsuite/gcc.dg/cpp/warn-normalized-4-bytes.c	1969-12-31 16:0=
0:00.000000000 -0800
> -+++ b/gcc/testsuite/gcc.dg/cpp/warn-normalized-4-bytes.c	2021-12-14 01:1=
6:01.557942991 -0800
> -@@ -0,0 +1,21 @@
> -+// { dg-do preprocess }
> -+// { dg-options "-std=3Dgnu99 -Werror=3Dnormalized=3Dnfc -fdiagnostics-=
show-caret -fdiagnostics-escape-format=3Dbytes" }
> -+/* { dg-message "some warnings being treated as errors" "" {target "*-*=
-*"} 0 } */
> -+
> -+/* =E0=BD =3D U+0F43 TIBETAN LETTER GHA, which has decomposition "0F42 =
0FB7" i.e.
> -+   U+0F42 TIBETAN LETTER GA: =E0=BD
> -+   U+0FB7 TIBETAN SUBJOINED LETTER HA: =E0=BE=B7
> -+
> -+   The UTF-8 encoding of U+0F43 TIBETAN LETTER GHA is: E0 BD 83.  */
> -+
> -+foo before_\u0F43_after bar // { dg-error "`before_.U00000f43_after' is=
 not in NFC .-Werror=3Dnormalized=3D." }
> -+/* { dg-begin-multiline-output "" }
> -+ foo before_\u0F43_after bar
> -+     ^~~~~~~~~~~~~~~~~~~
> -+   { dg-end-multiline-output "" } */
> -+
> -+foo before_=E0=BD_after bar // { dg-error "`before_.U00000f43_after' is=
 not in NFC .-Werror=3Dnormalized=3D." }
> -+/* { dg-begin-multiline-output "" }
> -+ foo before_<e0><bd><83>_after bar
> -+     ^~~~~~~~~~~~~~~~~~~~~~~~~
> -+   { dg-end-multiline-output "" } */
> -diff --git a/gcc/testsuite/gcc.dg/cpp/warn-normalized-4-unicode.c b/gcc/=
testsuite/gcc.dg/cpp/warn-normalized-4-unicode.c
> ---- a/gcc/testsuite/gcc.dg/cpp/warn-normalized-4-unicode.c	1969-12-31 16=
:00:00.000000000 -0800
> -+++ b/gcc/testsuite/gcc.dg/cpp/warn-normalized-4-unicode.c	2021-12-14 01=
:16:01.557942991 -0800
> -@@ -0,0 +1,19 @@
> -+// { dg-do preprocess }
> -+// { dg-options "-std=3Dgnu99 -Werror=3Dnormalized=3Dnfc -fdiagnostics-=
show-caret -fdiagnostics-escape-format=3Dunicode" }
> -+/* { dg-message "some warnings being treated as errors" "" {target "*-*=
-*"} 0 } */
> -+
> -+/* =E0=BD =3D U+0F43 TIBETAN LETTER GHA, which has decomposition "0F42 =
0FB7" i.e.
> -+   U+0F42 TIBETAN LETTER GA: =E0=BD
> -+   U+0FB7 TIBETAN SUBJOINED LETTER HA: =E0=BE=B7  */
> -+
> -+foo before_\u0F43_after bar  // { dg-error "`before_.U00000f43_after' i=
s not in NFC .-Werror=3Dnormalized=3D." }
> -+/* { dg-begin-multiline-output "" }
> -+ foo before_\u0F43_after bar
> -+     ^~~~~~~~~~~~~~~~~~~
> -+   { dg-end-multiline-output "" } */
> -+
> -+foo before_=E0=BD_after bar // { dg-error "`before_.U00000f43_after' is=
 not in NFC .-Werror=3Dnormalized=3D." }
> -+/* { dg-begin-multiline-output "" }
> -+ foo before_<U+0F43>_after bar
> -+     ^~~~~~~~~~~~~~~~~~~~~
> -+   { dg-end-multiline-output "" } */
> -diff --git a/gcc/testsuite/gfortran.dg/diagnostic-format-json-1.F90 b/gc=
c/testsuite/gfortran.dg/diagnostic-format-json-1.F90
> ---- a/gcc/testsuite/gfortran.dg/diagnostic-format-json-1.F90	2021-07-27 =
23:55:08.472303878 -0700
> -+++ b/gcc/testsuite/gfortran.dg/diagnostic-format-json-1.F90	2021-12-14 =
01:16:01.557942991 -0800
> -@@ -9,6 +9,7 @@
> -=20
> - ! { dg-regexp "\"kind\": \"error\"" }
> - ! { dg-regexp "\"column-origin\": 1" }
> -+! { dg-regexp "\"escape-source\": false" }
> - ! { dg-regexp "\"message\": \"#error message\"" }
> -=20
> - ! { dg-regexp "\"caret\": \{" }
> -diff --git a/gcc/testsuite/gfortran.dg/diagnostic-format-json-2.F90 b/gc=
c/testsuite/gfortran.dg/diagnostic-format-json-2.F90
> ---- a/gcc/testsuite/gfortran.dg/diagnostic-format-json-2.F90	2021-07-27 =
23:55:08.472303878 -0700
> -+++ b/gcc/testsuite/gfortran.dg/diagnostic-format-json-2.F90	2021-12-14 =
01:16:01.557942991 -0800
> -@@ -9,6 +9,7 @@
> -=20
> - ! { dg-regexp "\"kind\": \"warning\"" }
> - ! { dg-regexp "\"column-origin\": 1" }
> -+! { dg-regexp "\"escape-source\": false" }
> - ! { dg-regexp "\"message\": \"#warning message\"" }
> - ! { dg-regexp "\"option\": \"-Wcpp\"" }
> - ! { dg-regexp "\"option_url\": \"\[^\n\r\"\]*#index-Wcpp\"" }
> -diff --git a/gcc/testsuite/gfortran.dg/diagnostic-format-json-3.F90 b/gc=
c/testsuite/gfortran.dg/diagnostic-format-json-3.F90
> ---- a/gcc/testsuite/gfortran.dg/diagnostic-format-json-3.F90	2021-07-27 =
23:55:08.472303878 -0700
> -+++ b/gcc/testsuite/gfortran.dg/diagnostic-format-json-3.F90	2021-12-14 =
01:16:01.557942991 -0800
> -@@ -9,6 +9,7 @@
> -=20
> - ! { dg-regexp "\"kind\": \"error\"" }
> - ! { dg-regexp "\"column-origin\": 1" }
> -+! { dg-regexp "\"escape-source\": false" }
> - ! { dg-regexp "\"message\": \"#warning message\"" }
> - ! { dg-regexp "\"option\": \"-Werror=3Dcpp\"" }
> - ! { dg-regexp "\"option_url\": \"\[^\n\r\"\]*#index-Wcpp\"" }
> -diff --git a/libcpp/charset.c b/libcpp/charset.c
> ---- a/libcpp/charset.c	2021-07-27 23:55:08.712307227 -0700
> -+++ b/libcpp/charset.c	2021-12-14 01:16:01.557942991 -0800
> -@@ -1552,12 +1552,14 @@ convert_escape (cpp_reader *pfile, const
> - 		   "unknown escape sequence: '\\%c'", (int) c);
> -       else
> - 	{
> -+	  encoding_rich_location rich_loc (pfile);
> -+
> - 	  /* diagnostic.c does not support "%03o".  When it does, this
> - 	     code can use %03o directly in the diagnostic again.  */
> - 	  char buf[32];
> - 	  sprintf(buf, "%03o", (int) c);
> --	  cpp_error (pfile, CPP_DL_PEDWARN,
> --		     "unknown escape sequence: '\\%s'", buf);
> -+	  cpp_error_at (pfile, CPP_DL_PEDWARN, &rich_loc,
> -+			"unknown escape sequence: '\\%s'", buf);
> - 	}
> -     }
> -=20
> -@@ -2280,14 +2282,16 @@ cpp_string_location_reader::get_next ()
> - }
> -=20
> - cpp_display_width_computation::
> --cpp_display_width_computation (const char *data, int data_length, int t=
abstop) :
> -+cpp_display_width_computation (const char *data, int data_length,
> -+			       const cpp_char_column_policy &policy) :
> -   m_begin (data),
> -   m_next (m_begin),
> -   m_bytes_left (data_length),
> --  m_tabstop (tabstop),
> -+  m_policy (policy),
> -   m_display_cols (0)
> - {
> --  gcc_assert (m_tabstop > 0);
> -+  gcc_assert (policy.m_tabstop > 0);
> -+  gcc_assert (policy.m_width_cb);
> - }
> -=20
> -=20
> -@@ -2299,19 +2303,28 @@ cpp_display_width_computation (const cha
> -    point to a valid UTF-8-encoded sequence, then it will be treated as =
a single
> -    byte with display width 1.  m_cur_display_col is the current display=
 column,
> -    relative to which tab stops should be expanded.  Returns the display=
 width of
> --   the codepoint just processed.  */
> -+   the codepoint just processed.
> -+   If OUT is non-NULL, it is populated.  */
> -=20
> - int
> --cpp_display_width_computation::process_next_codepoint ()
> -+cpp_display_width_computation::process_next_codepoint (cpp_decoded_char=
 *out)
> - {
> -   cppchar_t c;
> -   int next_width;
> -=20
> -+  if (out)
> -+    out->m_start_byte =3D m_next;
> -+
> -   if (*m_next =3D=3D '\t')
> -     {
> -       ++m_next;
> -       --m_bytes_left;
> --      next_width =3D m_tabstop - (m_display_cols % m_tabstop);
> -+      next_width =3D m_policy.m_tabstop - (m_display_cols % m_policy.m_=
tabstop);
> -+      if (out)
> -+	{
> -+	  out->m_ch =3D '\t';
> -+	  out->m_valid_ch =3D true;
> -+	}
> -     }
> -   else if (one_utf8_to_cppchar ((const uchar **) &m_next, &m_bytes_left=
, &c)
> - 	   !=3D 0)
> -@@ -2321,14 +2334,24 @@ cpp_display_width_computation::process_n
> - 	 of one.  */
> -       ++m_next;
> -       --m_bytes_left;
> --      next_width =3D 1;
> -+      next_width =3D m_policy.m_undecoded_byte_width;
> -+      if (out)
> -+	out->m_valid_ch =3D false;
> -     }
> -   else
> -     {
> -       /*  one_utf8_to_cppchar() has updated m_next and m_bytes_left for=
 us.  */
> --      next_width =3D cpp_wcwidth (c);
> -+      next_width =3D m_policy.m_width_cb (c);
> -+      if (out)
> -+	{
> -+	  out->m_ch =3D c;
> -+	  out->m_valid_ch =3D true;
> -+	}
> -     }
> -=20
> -+  if (out)
> -+    out->m_next_byte =3D m_next;
> -+
> -   m_display_cols +=3D next_width;
> -   return next_width;
> - }
> -@@ -2344,7 +2367,7 @@ cpp_display_width_computation::advance_d
> -   const int start =3D m_display_cols;
> -   const int target =3D start + n;
> -   while (m_display_cols < target && !done ())
> --    process_next_codepoint ();
> -+    process_next_codepoint (NULL);
> -   return m_display_cols - start;
> - }
> -=20
> -@@ -2352,29 +2375,33 @@ cpp_display_width_computation::advance_d
> -     how many display columns are occupied by the first COLUMN bytes.  C=
OLUMN
> -     may exceed DATA_LENGTH, in which case the phantom bytes at the end =
are
> -     treated as if they have display width 1.  Tabs are expanded to the =
next tab
> --    stop, relative to the start of DATA.  */
> -+    stop, relative to the start of DATA, and non-printable-ASCII charac=
ters
> -+    will be escaped as per POLICY.  */
> -=20
> - int
> - cpp_byte_column_to_display_column (const char *data, int data_length,
> --				   int column, int tabstop)
> -+				   int column,
> -+				   const cpp_char_column_policy &policy)
> - {
> -   const int offset =3D MAX (0, column - data_length);
> --  cpp_display_width_computation dw (data, column - offset, tabstop);
> -+  cpp_display_width_computation dw (data, column - offset, policy);
> -   while (!dw.done ())
> --    dw.process_next_codepoint ();
> -+    dw.process_next_codepoint (NULL);
> -   return dw.display_cols_processed () + offset;
> - }
> -=20
> - /*  For the string of length DATA_LENGTH bytes that begins at DATA, com=
pute
> -     the least number of bytes that will result in at least DISPLAY_COL =
display
> -     columns.  The return value may exceed DATA_LENGTH if the entire str=
ing does
> --    not occupy enough display columns.  */
> -+    not occupy enough display columns.  Non-printable-ASCII characters
> -+    will be escaped as per POLICY.  */
> -=20
> - int
> - cpp_display_column_to_byte_column (const char *data, int data_length,
> --				   int display_col, int tabstop)
> -+				   int display_col,
> -+				   const cpp_char_column_policy &policy)
> - {
> --  cpp_display_width_computation dw (data, data_length, tabstop);
> -+  cpp_display_width_computation dw (data, data_length, policy);
> -   const int avail_display =3D dw.advance_display_cols (display_col);
> -   return dw.bytes_processed () + MAX (0, display_col - avail_display);
> - }
> -diff --git a/libcpp/errors.c b/libcpp/errors.c
> ---- a/libcpp/errors.c	2021-07-27 23:55:08.712307227 -0700
> -+++ b/libcpp/errors.c	2021-12-14 01:16:01.557942991 -0800
> -@@ -27,6 +27,31 @@ along with this program; see the file CO
> - #include "cpplib.h"
> - #include "internal.h"
> -=20
> -+/* Get a location_t for the current location in PFILE,
> -+   generally that of the previously lexed token.  */
> -+
> -+location_t
> -+cpp_diagnostic_get_current_location (cpp_reader *pfile)
> -+{
> -+  if (CPP_OPTION (pfile, traditional))
> -+    {
> -+      if (pfile->state.in_directive)
> -+	return pfile->directive_line;
> -+      else
> -+	return pfile->line_table->highest_line;
> -+    }
> -+  /* We don't want to refer to a token before the beginning of the
> -+     current run -- that is invalid.  */
> -+  else if (pfile->cur_token =3D=3D pfile->cur_run->base)
> -+    {
> -+      return 0;
> -+    }
> -+  else
> -+    {
> -+      return pfile->cur_token[-1].src_loc;
> -+    }
> -+}
> -+
> - /* Print a diagnostic at the given location.  */
> -=20
> - ATTRIBUTE_FPTR_PRINTF(5,0)
> -@@ -52,25 +77,7 @@ cpp_diagnostic (cpp_reader * pfile, enum
> - 		enum cpp_warning_reason reason,
> - 		const char *msgid, va_list *ap)
> - {
> --  location_t src_loc;
> --
> --  if (CPP_OPTION (pfile, traditional))
> --    {
> --      if (pfile->state.in_directive)
> --	src_loc =3D pfile->directive_line;
> --      else
> --	src_loc =3D pfile->line_table->highest_line;
> --    }
> --  /* We don't want to refer to a token before the beginning of the
> --     current run -- that is invalid.  */
> --  else if (pfile->cur_token =3D=3D pfile->cur_run->base)
> --    {
> --      src_loc =3D 0;
> --    }
> --  else
> --    {
> --      src_loc =3D pfile->cur_token[-1].src_loc;
> --    }
> -+  location_t src_loc =3D cpp_diagnostic_get_current_location (pfile);
> -   rich_location richloc (pfile->line_table, src_loc);
> -   return cpp_diagnostic_at (pfile, level, reason, &richloc, msgid, ap);
> - }
> -@@ -142,6 +149,43 @@ cpp_warning_syshdr (cpp_reader * pfile,
> -=20
> -   va_end (ap);
> -   return ret;
> -+}
> -+
> -+/* As cpp_warning above, but use RICHLOC as the location of the diagnos=
tic.  */
> -+
> -+bool cpp_warning_at (cpp_reader *pfile, enum cpp_warning_reason reason,
> -+		     rich_location *richloc, const char *msgid, ...)
> -+{
> -+  va_list ap;
> -+  bool ret;
> -+
> -+  va_start (ap, msgid);
> -+
> -+  ret =3D cpp_diagnostic_at (pfile, CPP_DL_WARNING, reason, richloc,
> -+			   msgid, &ap);
> -+
> -+  va_end (ap);
> -+  return ret;
> -+
> -+}
> -+
> -+/* As cpp_pedwarning above, but use RICHLOC as the location of the
> -+   diagnostic.  */
> -+
> -+bool
> -+cpp_pedwarning_at (cpp_reader * pfile, enum cpp_warning_reason reason,
> -+		   rich_location *richloc, const char *msgid, ...)
> -+{
> -+  va_list ap;
> -+  bool ret;
> -+
> -+  va_start (ap, msgid);
> -+
> -+  ret =3D cpp_diagnostic_at (pfile, CPP_DL_PEDWARN, reason, richloc,
> -+			   msgid, &ap);
> -+
> -+  va_end (ap);
> -+  return ret;
> - }
> -=20
> - /* Print a diagnostic at a specific location.  */
> -diff --git a/libcpp/include/cpplib.h b/libcpp/include/cpplib.h
> ---- a/libcpp/include/cpplib.h	2021-12-13 23:23:05.768437079 -0800
> -+++ b/libcpp/include/cpplib.h	2021-12-14 01:20:16.189507386 -0800
> -@@ -1275,6 +1275,14 @@ extern bool cpp_warning_syshdr (cpp_read
> - 				const char *msgid, ...)
> -   ATTRIBUTE_PRINTF_3;
> -=20
> -+/* As their counterparts above, but use RICHLOC.  */
> -+extern bool cpp_warning_at (cpp_reader *, enum cpp_warning_reason,
> -+			    rich_location *richloc, const char *msgid, ...)
> -+  ATTRIBUTE_PRINTF_4;
> -+extern bool cpp_pedwarning_at (cpp_reader *, enum cpp_warning_reason,
> -+			       rich_location *richloc, const char *msgid, ...)
> -+  ATTRIBUTE_PRINTF_4;
> -+
> - /* Output a diagnostic with "MSGID: " preceding the
> -    error string of errno.  No location is printed.  */
> - extern bool cpp_errno (cpp_reader *, enum cpp_diagnostic_level,
> -@@ -1435,42 +1443,95 @@ extern const char * cpp_get_userdef_suff
> -=20
> - /* In charset.c */
> -=20
> -+/* The result of attempting to decode a run of UTF-8 bytes.  */
> -+
> -+struct cpp_decoded_char
> -+{
> -+  const char *m_start_byte;
> -+  const char *m_next_byte;
> -+
> -+  bool m_valid_ch;
> -+  cppchar_t m_ch;
> -+};
> -+
> -+/* Information for mapping between code points and display columns.
> -+
> -+   This is a tabstop value, along with a callback for getting the
> -+   widths of characters.  Normally this callback is cpp_wcwidth, but we
> -+   support other schemes for escaping non-ASCII unicode as a series of
> -+   ASCII chars when printing the user's source code in diagnostic-show-=
locus.c
> -+
> -+   For example, consider:
> -+   - the Unicode character U+03C0 "GREEK SMALL LETTER PI" (UTF-8: 0xCF =
0x80)
> -+   - the Unicode character U+1F642 "SLIGHTLY SMILING FACE"
> -+     (UTF-8: 0xF0 0x9F 0x99 0x82)
> -+   - the byte 0xBF (a stray trailing byte of a UTF-8 character)
> -+   Normally U+03C0 would occupy one display column, U+1F642
> -+   would occupy two display columns, and the stray byte would be
> -+   printed verbatim as one display column.
> -+
> -+   However when escaping them as unicode code points as "<U+03C0>"
> -+   and "<U+1F642>" they occupy 8 and 9 display columns respectively,
> -+   and when escaping them as bytes as "<CF><80>" and "<F0><9F><99><82>"
> -+   they occupy 8 and 16 display columns respectively.  In both cases
> -+   the stray byte is escaped to <BF> as 4 display columns.  */
> -+
> -+struct cpp_char_column_policy
> -+{
> -+  cpp_char_column_policy (int tabstop,
> -+			  int (*width_cb) (cppchar_t c))
> -+  : m_tabstop (tabstop),
> -+    m_undecoded_byte_width (1),
> -+    m_width_cb (width_cb)
> -+  {}
> -+
> -+  int m_tabstop;
> -+  /* Width in display columns of a stray byte that isn't decodable
> -+     as UTF-8.  */
> -+  int m_undecoded_byte_width;
> -+  int (*m_width_cb) (cppchar_t c);
> -+};
> -+
> - /* A class to manage the state while converting a UTF-8 sequence to cpp=
char_t
> -    and computing the display width one character at a time.  */
> - class cpp_display_width_computation {
> -  public:
> -   cpp_display_width_computation (const char *data, int data_length,
> --				 int tabstop);
> -+				 const cpp_char_column_policy &policy);
> -   const char *next_byte () const { return m_next; }
> -   int bytes_processed () const { return m_next - m_begin; }
> -   int bytes_left () const { return m_bytes_left; }
> -   bool done () const { return !bytes_left (); }
> -   int display_cols_processed () const { return m_display_cols; }
> -=20
> --  int process_next_codepoint ();
> -+  int process_next_codepoint (cpp_decoded_char *out);
> -   int advance_display_cols (int n);
> -=20
> -  private:
> -   const char *const m_begin;
> -   const char *m_next;
> -   size_t m_bytes_left;
> --  const int m_tabstop;
> -+  const cpp_char_column_policy &m_policy;
> -   int m_display_cols;
> - };
> -=20
> - /* Convenience functions that are simple use cases for class
> -    cpp_display_width_computation.  Tab characters will be expanded to s=
paces
> --   as determined by TABSTOP.  */
> -+   as determined by POLICY.m_tabstop, and non-printable-ASCII characters
> -+   will be escaped as per POLICY.  */
> -+
> - int cpp_byte_column_to_display_column (const char *data, int data_lengt=
h,
> --				       int column, int tabstop);
> -+				       int column,
> -+				       const cpp_char_column_policy &policy);
> - inline int cpp_display_width (const char *data, int data_length,
> --			      int tabstop)
> -+			      const cpp_char_column_policy &policy)
> - {
> -   return cpp_byte_column_to_display_column (data, data_length, data_len=
gth,
> --					    tabstop);
> -+					    policy);
> - }
> - int cpp_display_column_to_byte_column (const char *data, int data_lengt=
h,
> --				       int display_col, int tabstop);
> -+				       int display_col,
> -+				       const cpp_char_column_policy &policy);
> - int cpp_wcwidth (cppchar_t c);
> -=20
> - #endif /* ! LIBCPP_CPPLIB_H */
> -diff --git a/libcpp/include/line-map.h b/libcpp/include/line-map.h
> ---- a/libcpp/include/line-map.h	2021-07-27 23:55:08.716307283 -0700
> -+++ b/libcpp/include/line-map.h	2021-12-14 01:16:01.557942991 -0800
> -@@ -1781,6 +1781,18 @@ class rich_location
> -   const diagnostic_path *get_path () const { return m_path; }
> -   void set_path (const diagnostic_path *path) { m_path =3D path; }
> -=20
> -+  /* A flag for hinting that the diagnostic involves character encoding
> -+     issues, and thus that it will be helpful to the user if we show so=
me
> -+     representation of how the characters in the pertinent source lines
> -+     are encoded.
> -+     The default is false (i.e. do not escape).
> -+     When set to true, non-ASCII bytes in the pertinent source lines wi=
ll
> -+     be escaped in a manner controlled by the user-supplied option
> -+     -fdiagnostics-escape-format=3D, so that the user can better unders=
tand
> -+     what's going on with the encoding in their source file.  */
> -+  bool escape_on_output_p () const { return m_escape_on_output; }
> -+  void set_escape_on_output (bool flag) { m_escape_on_output =3D flag; }
> -+
> - private:
> -   bool reject_impossible_fixit (location_t where);
> -   void stop_supporting_fixits ();
> -@@ -1807,6 +1819,7 @@ protected:
> -   bool m_fixits_cannot_be_auto_applied;
> -=20
> -   const diagnostic_path *m_path;
> -+  bool m_escape_on_output;
> - };
> -=20
> - /* A struct for the result of range_label::get_text: a NUL-terminated b=
uffer
> -diff --git a/libcpp/internal.h b/libcpp/internal.h
> ---- a/libcpp/internal.h	2021-12-13 23:23:05.768437079 -0800
> -+++ b/libcpp/internal.h	2021-12-14 01:16:01.557942991 -0800
> -@@ -776,6 +776,9 @@ extern void _cpp_do_file_change (cpp_rea
> - extern void _cpp_pop_buffer (cpp_reader *);
> - extern char *_cpp_bracket_include (cpp_reader *);
> -=20
> -+/* In errors.c  */
> -+extern location_t cpp_diagnostic_get_current_location (cpp_reader *);
> -+
> - /* In traditional.c.  */
> - extern bool _cpp_scan_out_logical_line (cpp_reader *, cpp_macro *, bool=
);
> - extern bool _cpp_read_logical_line_trad (cpp_reader *);
> -@@ -942,6 +945,26 @@ int linemap_get_expansion_line (class li
> - const char* linemap_get_expansion_filename (class line_maps *,
> - 					    location_t);
> -=20
> -+/* A subclass of rich_location for emitting a diagnostic
> -+   at the current location of the reader, but flagging
> -+   it with set_escape_on_output (true).  */
> -+class encoding_rich_location : public rich_location
> -+{
> -+ public:
> -+  encoding_rich_location (cpp_reader *pfile)
> -+  : rich_location (pfile->line_table,
> -+		   cpp_diagnostic_get_current_location (pfile))
> -+  {
> -+    set_escape_on_output (true);
> -+  }
> -+
> -+  encoding_rich_location (cpp_reader *pfile, location_t loc)
> -+  : rich_location (pfile->line_table, loc)
> -+  {
> -+    set_escape_on_output (true);
> -+  }
> -+};
> -+
> - #ifdef __cplusplus
> - }
> - #endif
> -diff --git a/libcpp/lex.c b/libcpp/lex.c
> ---- a/libcpp/lex.c	2021-12-14 01:14:48.435225968 -0800
> -+++ b/libcpp/lex.c	2021-12-14 01:24:37.220995816 -0800
> -@@ -1774,7 +1774,11 @@ skip_whitespace (cpp_reader *pfile, cppc
> -   while (is_nvspace (c));
> -=20
> -   if (saw_NUL)
> --    cpp_error (pfile, CPP_DL_WARNING, "null character(s) ignored");
> -+    {
> -+      encoding_rich_location rich_loc (pfile);
> -+      cpp_error_at (pfile, CPP_DL_WARNING, &rich_loc,
> -+		    "null character(s) ignored");
> -+    }
> -=20
> -   buffer->cur--;
> - }
> -@@ -1803,6 +1807,28 @@ warn_about_normalization (cpp_reader *pf
> -   if (CPP_OPTION (pfile, warn_normalize) < NORMALIZE_STATE_RESULT (s)
> -       && !pfile->state.skipping)
> -     {
> -+      location_t loc =3D token->src_loc;
> -+
> -+      /* If possible, create a location range for the token.  */
> -+      if (loc >=3D RESERVED_LOCATION_COUNT
> -+	  && token->type !=3D CPP_EOF
> -+	  /* There must be no line notes to process.  */
> -+	  && (!(pfile->buffer->cur
> -+		>=3D pfile->buffer->notes[pfile->buffer->cur_note].pos
> -+		&& !pfile->overlaid_buffer)))
> -+	{
> -+	  source_range tok_range;
> -+	  tok_range.m_start =3D loc;
> -+	  tok_range.m_finish
> -+	    =3D linemap_position_for_column (pfile->line_table,
> -+					   CPP_BUF_COLUMN (pfile->buffer,
> -+							   pfile->buffer->cur));
> -+	  loc =3D COMBINE_LOCATION_DATA (pfile->line_table,
> -+				       loc, tok_range, NULL);
> -+	}
> -+
> -+      encoding_rich_location rich_loc (pfile, loc);
> -+
> -       /* Make sure that the token is printed using UCNs, even
> - 	 if we'd otherwise happily print UTF-8.  */
> -       unsigned char *buf =3D XNEWVEC (unsigned char, cpp_token_len (tok=
en));
> -@@ -1810,11 +1836,11 @@ warn_about_normalization (cpp_reader *pf
> -=20
> -       sz =3D cpp_spell_token (pfile, token, buf, false) - buf;
> -       if (NORMALIZE_STATE_RESULT (s) =3D=3D normalized_C)
> --	cpp_warning_with_line (pfile, CPP_W_NORMALIZE, token->src_loc, 0,
> --			       "`%.*s' is not in NFKC", (int) sz, buf);
> -+	cpp_warning_at (pfile, CPP_W_NORMALIZE, &rich_loc,
> -+			"`%.*s' is not in NFKC", (int) sz, buf);
> -       else
> --	cpp_warning_with_line (pfile, CPP_W_NORMALIZE, token->src_loc, 0,
> --			       "`%.*s' is not in NFC", (int) sz, buf);
> -+	cpp_warning_at (pfile, CPP_W_NORMALIZE, &rich_loc,
> -+			"`%.*s' is not in NFC", (int) sz, buf);
> -       free (buf);
> -     }
> - }
> -diff --git a/libcpp/line-map.c b/libcpp/line-map.c
> ---- a/libcpp/line-map.c	2021-07-27 23:55:08.716307283 -0700
> -+++ b/libcpp/line-map.c	2021-12-14 01:16:01.561942921 -0800
> -@@ -2086,7 +2086,8 @@ rich_location::rich_location (line_maps
> -   m_fixit_hints (),
> -   m_seen_impossible_fixit (false),
> -   m_fixits_cannot_be_auto_applied (false),
> --  m_path (NULL)
> -+  m_path (NULL),
> -+  m_escape_on_output (false)
> - {
> -   add_range (loc, SHOW_RANGE_WITH_CARET, label);
> - }
> diff --git a/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-46195.patch b/me=
ta/recipes-devtools/gcc/gcc/0001-CVE-2021-46195.patch
> deleted file mode 100644
> index 7b3651c73e..0000000000
> --- a/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-46195.patch
> +++ /dev/null
> @@ -1,128 +0,0 @@
> -From f10bec5ffa487ad3033ed5f38cfd0fc7d696deab Mon Sep 17 00:00:00 2001
> -From: Nick Clifton <nickc@redhat.com>
> -Date: Mon, 31 Jan 2022 14:28:42 +0000
> -Subject: [PATCH] libiberty: Fix infinite recursion in rust demangler.
> -
> -libiberty/
> -	PR demangler/98886
> -	PR demangler/99935
> -	* rust-demangle.c (struct rust_demangler): Add a recursion
> -	counter.
> -	(demangle_path): Increment/decrement the recursion counter upon
> -	entry and exit.  Fail if the counter exceeds a fixed limit.
> -	(demangle_type): Likewise.
> -	(rust_demangle_callback): Initialise the recursion counter,
> -	disabling if requested by the option flags.
> -
> -CVE: CVE-2021-46195
> -Upstream-Status: Backport
> -[https://gcc.gnu.org/git/gitweb.cgi?p=3Dgcc.git;h=3Df10bec5ffa487ad3033e=
d5f38cfd0fc7d696deab]
> -Signed-off-by: Pgowda <pgowda.cve@gmail.com>
> ----
> - libiberty/rust-demangle.c | 47 ++++++++++++++++++++++++++++++++++-----
> - 1 file changed, 41 insertions(+), 6 deletions(-)
> -
> -diff --git a/libiberty/rust-demangle.c b/libiberty/rust-demangle.c
> -index 18c760491bd..3b24d63892a 100644
> ---- a/libiberty/rust-demangle.c
> -+++ b/libiberty/rust-demangle.c
> -@@ -74,6 +74,12 @@ struct rust_demangler
> -   /* Rust mangling version, with legacy mangling being -1. */
> -   int version;
> -=20
> -+  /* Recursion depth.  */
> -+  unsigned int recursion;
> -+  /* Maximum number of times demangle_path may be called recursively.  =
*/
> -+#define RUST_MAX_RECURSION_COUNT  1024
> -+#define RUST_NO_RECURSION_LIMIT   ((unsigned int) -1)
> -+
> -   uint64_t bound_lifetime_depth;
> - };
> -=20
> -@@ -671,6 +677,15 @@ demangle_path (struct rust_demangler *rdm, int in_v=
alue)
> -   if (rdm->errored)
> -     return;
> -=20
> -+  if (rdm->recursion !=3D RUST_NO_RECURSION_LIMIT)
> -+    {
> -+      ++ rdm->recursion;
> -+      if (rdm->recursion > RUST_MAX_RECURSION_COUNT)
> -+	/* FIXME: There ought to be a way to report
> -+	   that the recursion limit has been reached.  */
> -+	goto fail_return;
> -+    }
> -+
> -   switch (tag =3D next (rdm))
> -     {
> -     case 'C':
> -@@ -688,10 +703,7 @@ demangle_path (struct rust_demangler *rdm, int in_v=
alue)
> -     case 'N':
> -       ns =3D next (rdm);
> -       if (!ISLOWER (ns) && !ISUPPER (ns))
> --        {
> --          rdm->errored =3D 1;
> --          return;
> --        }
> -+	goto fail_return;
> -=20
> -       demangle_path (rdm, in_value);
> -=20
> -@@ -776,9 +788,15 @@ demangle_path (struct rust_demangler *rdm, int in_v=
alue)
> -         }
> -       break;
> -     default:
> --      rdm->errored =3D 1;
> --      return;
> -+      goto fail_return;
> -     }
> -+  goto pass_return;
> -+
> -+ fail_return:
> -+  rdm->errored =3D 1;
> -+ pass_return:
> -+  if (rdm->recursion !=3D RUST_NO_RECURSION_LIMIT)
> -+    -- rdm->recursion;
> - }
> -=20
> - static void
> -@@ -870,6 +888,19 @@ demangle_type (struct rust_demangler *rdm)
> -       return;
> -     }
> -=20
> -+   if (rdm->recursion !=3D RUST_NO_RECURSION_LIMIT)
> -+    {
> -+      ++ rdm->recursion;
> -+      if (rdm->recursion > RUST_MAX_RECURSION_COUNT)
> -+	/* FIXME: There ought to be a way to report
> -+	   that the recursion limit has been reached.  */
> -+	{
> -+	  rdm->errored =3D 1;
> -+	  -- rdm->recursion;
> -+	  return;
> -+	}
> -+    }
> -+
> -   switch (tag)
> -     {
> -     case 'R':
> -@@ -1030,6 +1061,9 @@ demangle_type (struct rust_demangler *rdm)
> -       rdm->next--;
> -       demangle_path (rdm, 0);
> -     }
> -+
> -+  if (rdm->recursion !=3D RUST_NO_RECURSION_LIMIT)
> -+    -- rdm->recursion;
> - }
> -=20
> - /* A trait in a trait object may have some "existential projections"
> -@@ -1320,6 +1354,7 @@ rust_demangle_callback (const char *mangled, int o=
ptions,
> -   rdm.skipping_printing =3D 0;
> -   rdm.verbose =3D (options & DMGL_VERBOSE) !=3D 0;
> -   rdm.version =3D 0;
> -+  rdm.recursion =3D (options & DMGL_NO_RECURSE_LIMIT) ? RUST_NO_RECURSI=
ON_LIMIT : 0;
> -   rdm.bound_lifetime_depth =3D 0;
> -=20
> -   /* Rust symbols always start with _R (v0) or _ZN (legacy). */
> ---=20
> -2.27.0
> -
> diff --git a/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_=
TARGET.patch b/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_=
TARGET.patch
> index 0a108ee51b..3069161bef 100644
> --- a/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.=
patch
> +++ b/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.=
patch
> @@ -4,6 +4,7 @@ Date: Fri, 29 Mar 2013 08:37:11 +0400
>  Subject: [PATCH] gcc-4.3.1: ARCH_FLAGS_FOR_TARGET
> =20
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Signed-off-by: Bernhard Rosenkraenzer <bernhard.rosenkraenzer.ext@huawei=
.com> [ported to gcc 12]
> =20
>  Upstream-Status: Inappropriate [embedded specific]
>  ---
> @@ -12,10 +13,10 @@ Upstream-Status: Inappropriate [embedded specific]
>   2 files changed, 2 insertions(+), 2 deletions(-)
> =20
>  diff --git a/configure b/configure
> -index 504f6410274..bcebad264ec 100755
> +index f7e0fa46c9c..ce1f596e4ca 100755
>  --- a/configure
>  +++ b/configure
> -@@ -9728,7 +9728,7 @@ fi
> +@@ -10177,7 +10177,7 @@ fi
>   # for target_alias and gcc doesn't manage it consistently.
>   target_configargs=3D"--cache-file=3D./config.cache ${target_configargs}"
>  =20
> @@ -25,10 +26,10 @@ index 504f6410274..bcebad264ec 100755
>    *" newlib "*)
>     case " $target_configargs " in
>  diff --git a/configure.ac b/configure.ac
> -index 088e735c5db..1289fe08760 100644
> +index 434b1a267a4..a139a3c80ad 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -3240,7 +3240,7 @@ fi
> +@@ -3348,7 +3348,7 @@ fi
>   # for target_alias and gcc doesn't manage it consistently.
>   target_configargs=3D"--cache-file=3D./config.cache ${target_configargs}"
>  =20
> diff --git a/meta/recipes-devtools/gcc/gcc/0002-CVE-2021-35465.patch b/me=
ta/recipes-devtools/gcc/gcc/0002-CVE-2021-35465.patch
> deleted file mode 100644
> index e09818fecf..0000000000
> --- a/meta/recipes-devtools/gcc/gcc/0002-CVE-2021-35465.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From 574e7950bd6b34e9e2cacce18c802b45505d1d0a Mon Sep 17 00:00:00 2001
> -From: Richard Earnshaw <rearnsha@arm.com>
> -Date: Fri, 18 Jun 2021 17:16:25 +0100
> -Subject: [PATCH] arm: add erratum mitigation to __gnu_cmse_nonsecure_call
> - [PR102035]
> -
> -Add the recommended erratum mitigation sequence to
> -__gnu_cmse_nonsecure_call for use on Armv8-m.main devices. Since this
> -is in the library code we cannot know in advance whether the core we
> -are running on will be affected by this, so always enable it.
> -
> -libgcc:
> -	PR target/102035
> -	* config/arm/cmse_nonsecure_call.S (__gnu_cmse_nonsecure_call):
> -	Add vlldm erratum work-around.
> -
> -CVE: CVE-2021-35465
> -Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=3Dgcc.gi=
t;h=3D574e7950bd6b34e9e2cacce18c802b45505d1d0a]
> -Signed-off-by: Pgowda <pgowda.cve@gmail.com>
> -
> ----
> - libgcc/config/arm/cmse_nonsecure_call.S | 5 +++++
> - 1 file changed, 5 insertions(+)
> -
> -diff --git a/libgcc/config/arm/cmse_nonsecure_call.S b/libgcc/config/arm=
/cmse_nonsecure_call.S
> ---- a/libgcc/config/arm/cmse_nonsecure_call.S
> -+++ b/libgcc/config/arm/cmse_nonsecure_call.S
> -@@ -102,6 +102,11 @@ blxns	    r4
> - #ifdef __ARM_PCS_VFP
> - vpop.f64    {d8-d15}
> - #else
> -+/* VLLDM erratum mitigation sequence. */
> -+mrs	    r5, control
> -+tst	    r5, #8	  /* CONTROL_S.SFPA */
> -+it	    ne
> -+.inst.w	    0xeeb00a40	  /* vmovne s0, s0 */
> - vlldm	    sp		  /* Lazy restore of d0-d16 and FPSCR.  */
> - add	    sp, sp, #0x88 /* Free space used to save floating point registe=
rs.  */
> - #endif /* __ARM_PCS_VFP */
> diff --git a/meta/recipes-devtools/gcc/gcc/0002-CVE-2021-42574.patch b/me=
ta/recipes-devtools/gcc/gcc/0002-CVE-2021-42574.patch
> deleted file mode 100644
> index 9bad81d4d0..0000000000
> --- a/meta/recipes-devtools/gcc/gcc/0002-CVE-2021-42574.patch
> +++ /dev/null
> @@ -1,1765 +0,0 @@
> -From 51c500269bf53749b107807d84271385fad35628 Mon Sep 17 00:00:00 2001
> -From: Marek Polacek <polacek@redhat.com>
> -Date: Wed, 6 Oct 2021 14:33:59 -0400
> -Subject: [PATCH] libcpp: Implement -Wbidi-chars for CVE-2021-42574 [PR10=
3026]
> -
> -From a link below:
> -"An issue was discovered in the Bidirectional Algorithm in the Unicode
> -Specification through 14.0. It permits the visual reordering of
> -characters via control sequences, which can be used to craft source code
> -that renders different logic than the logical ordering of tokens
> -ingested by compilers and interpreters. Adversaries can leverage this to
> -encode source code for compilers accepting Unicode such that targeted
> -vulnerabilities are introduced invisibly to human reviewers."
> -
> -More info:
> -https://nvd.nist.gov/vuln/detail/CVE-2021-42574
> -https://trojansource.codes/
> -
> -This is not a compiler bug.  However, to mitigate the problem, this patch
> -implements -Wbidi-chars=3D[none|unpaired|any] to warn about possibly
> -misleading Unicode bidirectional control characters the preprocessor may
> -encounter.
> -
> -The default is =3Dunpaired, which warns about improperly terminated
> -bidirectional control characters; e.g. a LRE without its corresponding P=
DF.
> -The level =3Dany warns about any use of bidirectional control characters.
> -
> -This patch handles both UCNs and UTF-8 characters.  UCNs designating
> -bidi characters in identifiers are accepted since r204886.  Then r217144
> -enabled -fextended-identifiers by default.  Extended characters in C/C++
> -identifiers have been accepted since r275979.  However, this patch still
> -warns about mixing UTF-8 and UCN bidi characters; there seems to be no
> -good reason to allow mixing them.
> -
> -We warn in different contexts: comments (both C and C++-style), string
> -literals, character constants, and identifiers.  Expectedly, UCNs are ig=
nored
> -in comments and raw string literals.  The bidirectional control characte=
rs
> -can nest so this patch handles that as well.
> -
> -I have not included nor tested this at all with Fortran (which also has
> -string literals and line comments).
> -
> -Dave M. posted patches improving diagnostic involving Unicode characters.
> -This patch does not make use of this new infrastructure yet.
> -
> -	PR preprocessor/103026
> -
> -gcc/c-family/ChangeLog:
> -
> -	* c.opt (Wbidi-chars, Wbidi-chars=3D): New option.
> -
> -gcc/ChangeLog:
> -
> -	* doc/invoke.texi: Document -Wbidi-chars.
> -
> -libcpp/ChangeLog:
> -
> -	* include/cpplib.h (enum cpp_bidirectional_level): New.
> -	(struct cpp_options): Add cpp_warn_bidirectional.
> -	(enum cpp_warning_reason): Add CPP_W_BIDIRECTIONAL.
> -	* internal.h (struct cpp_reader): Add warn_bidi_p member
> -	function.
> -	* init.c (cpp_create_reader): Set cpp_warn_bidirectional.
> -	* lex.c (bidi): New namespace.
> -	(get_bidi_utf8): New function.
> -	(get_bidi_ucn): Likewise.
> -	(maybe_warn_bidi_on_close): Likewise.
> -	(maybe_warn_bidi_on_char): Likewise.
> -	(_cpp_skip_block_comment): Implement warning about bidirectional
> -	control characters.
> -	(skip_line_comment): Likewise.
> -	(forms_identifier_p): Likewise.
> -	(lex_identifier): Likewise.
> -	(lex_string): Likewise.
> -	(lex_raw_string): Likewise.
> -
> -gcc/testsuite/ChangeLog:
> -
> -	* c-c++-common/Wbidi-chars-1.c: New test.
> -	* c-c++-common/Wbidi-chars-2.c: New test.
> -	* c-c++-common/Wbidi-chars-3.c: New test.
> -	* c-c++-common/Wbidi-chars-4.c: New test.
> -	* c-c++-common/Wbidi-chars-5.c: New test.
> -	* c-c++-common/Wbidi-chars-6.c: New test.
> -	* c-c++-common/Wbidi-chars-7.c: New test.
> -	* c-c++-common/Wbidi-chars-8.c: New test.
> -	* c-c++-common/Wbidi-chars-9.c: New test.
> -	* c-c++-common/Wbidi-chars-10.c: New test.
> -	* c-c++-common/Wbidi-chars-11.c: New test.
> -	* c-c++-common/Wbidi-chars-12.c: New test.
> -	* c-c++-common/Wbidi-chars-13.c: New test.
> -	* c-c++-common/Wbidi-chars-14.c: New test.
> -	* c-c++-common/Wbidi-chars-15.c: New test.
> -	* c-c++-common/Wbidi-chars-16.c: New test.
> -	* c-c++-common/Wbidi-chars-17.c: New test.
> -
> -CVE: CVE-2021-42574
> -Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=3Dgcc.gi=
t;h=3D51c500269bf53749b107807d84271385fad35628]
> -Signed-off-by: Pgowda <pgowda.cve@gmail.com>
> -
> ----
> - gcc/c-family/c.opt                          |  24 ++
> - gcc/doc/invoke.texi                         |  21 +-
> - gcc/testsuite/c-c++-common/Wbidi-chars-1.c  |  12 +
> - gcc/testsuite/c-c++-common/Wbidi-chars-10.c |  27 ++
> - gcc/testsuite/c-c++-common/Wbidi-chars-11.c |  13 +
> - gcc/testsuite/c-c++-common/Wbidi-chars-12.c |  19 +
> - gcc/testsuite/c-c++-common/Wbidi-chars-13.c |  17 +
> - gcc/testsuite/c-c++-common/Wbidi-chars-14.c |  38 ++
> - gcc/testsuite/c-c++-common/Wbidi-chars-15.c |  59 +++
> - gcc/testsuite/c-c++-common/Wbidi-chars-16.c |  26 ++
> - gcc/testsuite/c-c++-common/Wbidi-chars-17.c |  30 ++
> - gcc/testsuite/c-c++-common/Wbidi-chars-2.c  |   9 +
> - gcc/testsuite/c-c++-common/Wbidi-chars-3.c  |  11 +
> - gcc/testsuite/c-c++-common/Wbidi-chars-4.c  | 188 +++++++++
> - gcc/testsuite/c-c++-common/Wbidi-chars-5.c  | 188 +++++++++
> - gcc/testsuite/c-c++-common/Wbidi-chars-6.c  | 155 ++++++++
> - gcc/testsuite/c-c++-common/Wbidi-chars-7.c  |   9 +
> - gcc/testsuite/c-c++-common/Wbidi-chars-8.c  |  13 +
> - gcc/testsuite/c-c++-common/Wbidi-chars-9.c  |  29 ++
> - libcpp/include/cpplib.h                     |  18 +-
> - libcpp/init.c                               |   1 +
> - libcpp/internal.h                           |   7 +
> - libcpp/lex.c                                | 408 +++++++++++++++++++-
> - 23 files changed, 1315 insertions(+), 7 deletions(-)
> - create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-1.c
> - create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-10.c
> - create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-11.c
> - create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-12.c
> - create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-13.c
> - create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-14.c
> - create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-15.c
> - create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-16.c
> - create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-17.c
> - create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-2.c
> - create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-3.c
> - create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-4.c
> - create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-5.c
> - create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-6.c
> - create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-7.c
> - create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-8.c
> - create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-9.c
> -
> -diff --git a/gcc/c-family/c.opt b/gcc/c-family/c.opt
> -index 8a4cd634f77..3976fc368db 100644
> ---- a/gcc/c-family/c.opt
> -+++ b/gcc/c-family/c.opt
> -@@ -370,6 +370,30 @@ Wbad-function-cast
> - C ObjC Var(warn_bad_function_cast) Warning
> - Warn about casting functions to incompatible types.
> -=20
> -+Wbidi-chars
> -+C ObjC C++ ObjC++ Warning Alias(Wbidi-chars=3D,any,none)
> -+;
> -+
> -+Wbidi-chars=3D
> -+C ObjC C++ ObjC++ RejectNegative Joined Warning CPP(cpp_warn_bidirectio=
nal) CppReason(CPP_W_BIDIRECTIONAL) Var(warn_bidirectional) Init(bidirectio=
nal_unpaired) Enum(cpp_bidirectional_level)
> -+-Wbidi-chars=3D[none|unpaired|any] Warn about UTF-8 bidirectional contr=
ol characters.
> -+
> -+; Required for these enum values.
> -+SourceInclude
> -+cpplib.h
> -+
> -+Enum
> -+Name(cpp_bidirectional_level) Type(int) UnknownError(argument %qs to %<=
-Wbidi-chars%> not recognized)
> -+
> -+EnumValue
> -+Enum(cpp_bidirectional_level) String(none) Value(bidirectional_none)
> -+
> -+EnumValue
> -+Enum(cpp_bidirectional_level) String(unpaired) Value(bidirectional_unpa=
ired)
> -+
> -+EnumValue
> -+Enum(cpp_bidirectional_level) String(any) Value(bidirectional_any)
> -+
> - Wbool-compare
> - C ObjC C++ ObjC++ Var(warn_bool_compare) Warning LangEnabledBy(C ObjC C=
++ ObjC++,Wall)
> - Warn about boolean expression compared with an integer value different =
from true/false.
> -diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
> -index 6070288856c..a22758d18ee 100644
> ---- a/gcc/doc/invoke.texi
> -+++ b/gcc/doc/invoke.texi
> -@@ -326,7 +326,9 @@ Objective-C and Objective-C++ Dialects}.
> - -Warith-conversion @gol
> - -Warray-bounds  -Warray-bounds=3D@var{n} @gol
> - -Wno-attributes  -Wattribute-alias=3D@var{n} -Wno-attribute-alias @gol
> ---Wno-attribute-warning  -Wbool-compare  -Wbool-operation @gol
> -+-Wno-attribute-warning  @gol
> -+-Wbidi-chars=3D@r{[}none@r{|}unpaired@r{|}any@r{]} @gol
> -+-Wbool-compare  -Wbool-operation @gol
> - -Wno-builtin-declaration-mismatch @gol
> - -Wno-builtin-macro-redefined  -Wc90-c99-compat  -Wc99-c11-compat @gol
> - -Wc11-c2x-compat @gol
> -@@ -7559,6 +7561,23 @@ Attributes considered include @code{allo
> - This is the default.  You can disable these warnings with either
> - @option{-Wno-attribute-alias} or @option{-Wattribute-alias=3D0}.
> -=20
> -+@item -Wbidi-chars=3D@r{[}none@r{|}unpaired@r{|}any@r{]}
> -+@opindex Wbidi-chars=3D
> -+@opindex Wbidi-chars
> -+@opindex Wno-bidi-chars
> -+Warn about possibly misleading UTF-8 bidirectional control characters in
> -+comments, string literals, character constants, and identifiers.  Such
> -+characters can change left-to-right writing direction into right-to-left
> -+(and vice versa), which can cause confusion between the logical order a=
nd
> -+visual order.  This may be dangerous; for instance, it may seem that a =
piece
> -+of code is not commented out, whereas it in fact is.
> -+
> -+There are three levels of warning supported by GCC@.  The default is
> -+@option{-Wbidi-chars=3Dunpaired}, which warns about improperly terminat=
ed
> -+bidi contexts.  @option{-Wbidi-chars=3Dnone} turns the warning off.
> -+@option{-Wbidi-chars=3Dany} warns about any use of bidirectional control
> -+characters.
> -+
> - @item -Wbool-compare
> - @opindex Wno-bool-compare
> - @opindex Wbool-compare
> -diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-10.c b/gcc/testsuite=
/c-c++-common/Wbidi-chars-10.c
> -new file mode 100644
> -index 00000000000..34f5ac19271
> ---- /dev/null
> -+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-10.c
> -@@ -0,0 +1,27 @@
> -+/* PR preprocessor/103026 */
> -+/* { dg-do compile } */
> -+/* { dg-options "-Wbidi-chars=3Dunpaired" } */
> -+/* More nesting testing.  */
> -+
> -+/* RLE=E2=AB LRI=E2=A6 PDF=E2=AC PDI=E2=A9*/
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+int LRE_\u202a_PDF_\u202c;
> -+int LRE_\u202a_PDF_\u202c_LRE_\u202a_PDF_\u202c;
> -+int LRE_\u202a_LRI_\u2066_PDF_\u202c_PDI_\u2069;
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+int RLE_\u202b_RLI_\u2067_PDF_\u202c_PDI_\u2069;
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+int RLE_\u202b_RLI_\u2067_PDI_\u2069_PDF_\u202c;
> -+int FSI_\u2068_LRO_\u202d_PDI_\u2069_PDF_\u202c;
> -+int FSI_\u2068;
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+int FSI_\u2068_PDI_\u2069;
> -+int FSI_\u2068_FSI_\u2068_PDI_\u2069;
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+int RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_R=
LI_\u2067_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069=
_PDI_\u2069;
> -+int RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_R=
LI_\u2067_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069;
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+int RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_R=
LI_\u2067_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069=
_PDF_\u202c;
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+int RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_FSI_\u2068_PDI_\u2069_P=
DI_\u2069_PDI_\u2069_PDI_\u2069;
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-11.c b/gcc/testsuite=
/c-c++-common/Wbidi-chars-11.c
> -new file mode 100644
> -index 00000000000..270ce2368a9
> ---- /dev/null
> -+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-11.c
> -@@ -0,0 +1,13 @@
> -+/* PR preprocessor/103026 */
> -+/* { dg-do compile } */
> -+/* { dg-options "-Wbidi-chars=3Dunpaired" } */
> -+/* Test that we warn when mixing UCN and UTF-8.  */
> -+
> -+int LRE_=E2=AA_PDF_\u202c;
> -+/* { dg-warning "mismatch" "" { target *-*-* } .-1 } */
> -+int LRE_\u202a_PDF_=E2=AC_;
> -+/* { dg-warning "mismatch" "" { target *-*-* } .-1 } */
> -+const char *s1 =3D "LRE_=E2=AA_PDF_\u202c";
> -+/* { dg-warning "mismatch" "" { target *-*-* } .-1 } */
> -+const char *s2 =3D "LRE_\u202a_PDF_=E2=AC";
> -+/* { dg-warning "mismatch" "" { target *-*-* } .-1 } */
> -diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-12.c b/gcc/testsuite=
/c-c++-common/Wbidi-chars-12.c
> -new file mode 100644
> -index 00000000000..b07eec1da91
> ---- /dev/null
> -+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-12.c
> -@@ -0,0 +1,19 @@
> -+/* PR preprocessor/103026 */
> -+/* { dg-do compile { target { c || c++11 } } } */
> -+/* { dg-options "-Wbidi-chars=3Dany" } */
> -+/* Test raw strings.  */
> -+
> -+const char *s1 =3D R"(a b c LRE=E2=AA 1 2 3 PDF=E2=AC x y z)";
> -+/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
> -+const char *s2 =3D R"(a b c RLE=E2=AB 1 2 3 PDF=E2=AC x y z)";
> -+/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
> -+const char *s3 =3D R"(a b c LRO=E2=AD 1 2 3 PDF=E2=AC x y z)";
> -+/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
> -+const char *s4 =3D R"(a b c RLO=E2=AE 1 2 3 PDF=E2=AC x y z)";
> -+/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
> -+const char *s7 =3D R"(a b c FSI=E2=A8 1 2 3 PDI=E2=A9 x y) z";
> -+/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
> -+const char *s8 =3D R"(a b c PDI=E2=A9 x y )z";
> -+/* { dg-warning "U\\+2069" "" { target *-*-* } .-1 } */
> -+const char *s9 =3D R"(a b c PDF=E2=AC x y z)";
> -+/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
> -diff -uprN '-x*.orig' '-x*.rej' del/gcc-11.2.0/gcc/testsuite/c-c++-commo=
n/Wbidi-chars-13.c gcc-11.2.0/gcc/testsuite/c-c++-common/Wbidi-chars-13.c
> ---- del/gcc-11.2.0/gcc/testsuite/c-c++-common/Wbidi-chars-13.c	1969-12-3=
1 16:00:00.000000000 -0800
> -+++ gcc-11.2.0/gcc/testsuite/c-c++-common/Wbidi-chars-13.c	2021-12-13 23=
:11:22.328439287 -0800
> -@@ -0,0 +1,17 @@
> -+/* PR preprocessor/103026 */
> -+/* { dg-do compile { target { c || c++11 } } } */
> -+/* { dg-options "-Wbidi-chars=3Dunpaired" } */
> -+/* Test raw strings.  */
> -+
> -+const char *s1 =3D R"(a b c LRE=E2=AA 1 2 3)";
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+const char *s2 =3D R"(a b c RLE=E2=AB 1 2 3)";
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+const char *s3 =3D R"(a b c LRO=E2=AD 1 2 3)";
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+const char *s4 =3D R"(a b c FSI=E2=A8 1 2 3)";
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+const char *s5 =3D R"(a b c LRI=E2=A6 1 2 3)";
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+const char *s6 =3D R"(a b c RLI=E2=A7 1 2 3)";
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-14.c b/gcc/testsuite=
/c-c++-common/Wbidi-chars-14.c
> -new file mode 100644
> -index 00000000000..ba5f75d9553
> ---- /dev/null
> -+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-14.c
> -@@ -0,0 +1,38 @@
> -+/* PR preprocessor/103026 */
> -+/* { dg-do compile } */
> -+/* { dg-options "-Wbidi-chars=3Dunpaired" } */
> -+/* Test PDI handling, which also pops any subsequent LREs, RLEs, LROs,
> -+   or RLOs.  */
> -+
> -+/* LRI_=E2=A6_LRI_=E2=A6_RLE_=E2=AB_RLE_=E2=AB_RLE_=E2=AB_PDI_=E2=A9*/
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+// LRI_=E2=A6_RLE_=E2=AB_RLE_=E2=AB_RLE_=E2=AB_PDI_=E2=A9
> -+// LRI_=E2=A6_RLO_=E2=AE_RLE_=E2=AB_RLE_=E2=AB_PDI_=E2=A9
> -+// LRI_=E2=A6_RLO_=E2=AE_RLE_=E2=AB_PDI_=E2=A9
> -+// FSI_=E2=A8_RLO_=E2=AE_PDI_=E2=A9
> -+// FSI_=E2=A8_FSI_=E2=A8_RLO_=E2=AE_PDI_=E2=A9
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+
> -+int LRI_\u2066_LRI_\u2066_LRE_\u202a_LRE_\u202a_LRE_\u202a_PDI_\u2069;
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+int LRI_\u2066_LRI_\u2066_LRE_\u202a_LRE_\u202a_LRE_\u202a_PDI_\u2069_P=
DI_\u2069;
> -+int LRI_\u2066_LRI_\u2066_LRI_\u2066_LRE_\u202a_LRE_\u202a_LRE_\u202a_P=
DI_\u2069_PDI_\u2069;
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+int PDI_\u2069;
> -+int LRI_\u2066_PDI_\u2069;
> -+int RLI_\u2067_PDI_\u2069;
> -+int LRE_\u202a_LRI_\u2066_PDI_\u2069;
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+int LRI_\u2066_LRE_\u202a_PDF_\u202c_PDI_\u2069;
> -+int LRI_\u2066_LRE_\u202a_LRE_\u202a_PDF_\u202c_PDI_\u2069;
> -+int RLI_\u2067_LRI_\u2066_LRE_\u202a_LRE_\u202a_PDF_\u202c_PDI_\u2069;
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+int FSI_\u2068_LRI_\u2066_LRE_\u202a_LRE_\u202a_PDF_\u202c_PDI_\u2069;
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+int RLO_\u202e_PDI_\u2069;
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+int RLI_\u2067_PDI_\u2069_RLI_\u2067;
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+int FSI_\u2068_PDF_\u202c_PDI_\u2069;
> -+int FSI_\u2068_FSI_\u2068_PDF_\u202c_PDI_\u2069;
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-15.c b/gcc/testsuite=
/c-c++-common/Wbidi-chars-15.c
> -new file mode 100644
> -index 00000000000..a0ce8ff5e2c
> ---- /dev/null
> -+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-15.c
> -@@ -0,0 +1,59 @@
> -+/* PR preprocessor/103026 */
> -+/* { dg-do compile } */
> -+/* { dg-options "-Wbidi-chars=3Dunpaired" } */
> -+/* Test unpaired bidi control chars in multiline comments.  */
> -+
> -+/*
> -+ * LRE=E2=AA end
> -+ */
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
> -+/*
> -+ * RLE=E2=AB end
> -+ */
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
> -+/*
> -+ * LRO=E2=AD end
> -+ */
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
> -+/*
> -+ * RLO=E2=AE end
> -+ */
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
> -+/*
> -+ * LRI=E2=A6 end
> -+ */
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
> -+/*
> -+ * RLI=E2=A7 end
> -+ */
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
> -+/*
> -+ * FSI=E2=A8 end
> -+ */
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
> -+/* LRE=E2=AA
> -+   PDF=E2=AC */
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
> -+/* FSI=E2=A8
> -+   PDI=E2=A9 */
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
> -+
> -+/* LRE<=E2=AA>
> -+ *
> -+ */
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-3 } */
> -+
> -+/*
> -+ * LRE<=E2=AA>
> -+ */
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
> -+
> -+/*
> -+ *
> -+ * LRE<=E2=AA> */
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+
> -+/* RLI<=E2=A7> */ /* PDI<=E2=A9> */
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+/* LRE<=E2=AA> */ /* PDF<=E2=AC> */
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-16.c b/gcc/testsuite=
/c-c++-common/Wbidi-chars-16.c
> -new file mode 100644
> -index 00000000000..baa0159861c
> ---- /dev/null
> -+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-16.c
> -@@ -0,0 +1,26 @@
> -+/* PR preprocessor/103026 */
> -+/* { dg-do compile } */
> -+/* { dg-options "-Wbidi-chars=3Dany" } */
> -+/* Test LTR/RTL chars.  */
> -+
> -+/* LTR<=E2> */
> -+/* { dg-warning "U\\+200E" "" { target *-*-* } .-1 } */
> -+// LTR<=E2>
> -+/* { dg-warning "U\\+200E" "" { target *-*-* } .-1 } */
> -+/* RTL<=E2> */
> -+/* { dg-warning "U\\+200F" "" { target *-*-* } .-1 } */
> -+// RTL<=E2>
> -+/* { dg-warning "U\\+200F" "" { target *-*-* } .-1 } */
> -+
> -+const char *s1 =3D "LTR<=E2>";
> -+/* { dg-warning "U\\+200E" "" { target *-*-* } .-1 } */
> -+const char *s2 =3D "LTR\u200e";
> -+/* { dg-warning "U\\+200E" "" { target *-*-* } .-1 } */
> -+const char *s3 =3D "LTR\u200E";
> -+/* { dg-warning "U\\+200E" "" { target *-*-* } .-1 } */
> -+const char *s4 =3D "RTL<=E2>";
> -+/* { dg-warning "U\\+200F" "" { target *-*-* } .-1 } */
> -+const char *s5 =3D "RTL\u200f";
> -+/* { dg-warning "U\\+200F" "" { target *-*-* } .-1 } */
> -+const char *s6 =3D "RTL\u200F";
> -+/* { dg-warning "U\\+200F" "" { target *-*-* } .-1 } */
> -diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-17.c b/gcc/testsuite=
/c-c++-common/Wbidi-chars-17.c
> -new file mode 100644
> -index 00000000000..07cb4321f96
> ---- /dev/null
> -+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-17.c
> -@@ -0,0 +1,30 @@
> -+/* PR preprocessor/103026 */
> -+/* { dg-do compile } */
> -+/* { dg-options "-Wbidi-chars=3Dunpaired" } */
> -+/* Test LTR/RTL chars.  */
> -+
> -+/* LTR<=E2> */
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+// LTR<=E2>
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+/* RTL<=E2> */
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+// RTL<=E2>
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+int ltr_\u200e;
> -+/* { dg-error "universal character " "" { target *-*-* } .-1 } */
> -+int rtl_\u200f;
> -+/* { dg-error "universal character " "" { target *-*-* } .-1 } */
> -+
> -+const char *s1 =3D "LTR<=E2>";
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+const char *s2 =3D "LTR\u200e";
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+const char *s3 =3D "LTR\u200E";
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+const char *s4 =3D "RTL<=E2>";
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+const char *s5 =3D "RTL\u200f";
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+const char *s6 =3D "RTL\u200F";
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-1.c b/gcc/testsuite/=
c-c++-common/Wbidi-chars-1.c
> -new file mode 100644
> -index 00000000000..2340374f276
> ---- /dev/null
> -+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-1.c
> -@@ -0,0 +1,12 @@
> -+/* PR preprocessor/103026 */
> -+/* { dg-do compile } */
> -+
> -+int main() {
> -+    int isAdmin =3D 0;
> -+    /*=E2=AE } =E2=A6if (isAdmin)=E2=A9 =E2=A6 begin admins only */
> -+/* { dg-warning "bidirectional" "" { target *-*-* } .-1 } */
> -+        __builtin_printf("You are an admin.\n");
> -+    /* end admins only =E2=AE { =E2=A6*/
> -+/* { dg-warning "bidirectional" "" { target *-*-* } .-1 } */
> -+    return 0;
> -+}
> -diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-2.c b/gcc/testsuite/=
c-c++-common/Wbidi-chars-2.c
> -new file mode 100644
> -index 00000000000..2340374f276
> ---- /dev/null
> -+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-2.c
> -@@ -0,0 +1,9 @@
> -+/* PR preprocessor/103026 */
> -+/* { dg-do compile } */
> -+
> -+int main() {
> -+    /* Say hello; newline=E2=A7/*/ return 0 ;
> -+/* { dg-warning "bidirectional" "" { target *-*-* } .-1 } */
> -+    __builtin_printf("Hello world.\n");
> -+    return 0;
> -+}
> -diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-3.c b/gcc/testsuite/=
c-c++-common/Wbidi-chars-3.c
> -new file mode 100644
> -index 00000000000..9dc7edb6e64
> ---- /dev/null
> -+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-3.c
> -@@ -0,0 +1,11 @@
> -+/* PR preprocessor/103026 */
> -+/* { dg-do compile } */
> -+
> -+int main() {
> -+    const char* access_level =3D "user";
> -+    if (__builtin_strcmp(access_level, "user=E2=AE =E2=A6// Check if ad=
min=E2=A9 =E2=A6")) {
> -+/* { dg-warning "bidirectional" "" { target *-*-* } .-1 } */
> -+        __builtin_printf("You are an admin.\n");
> -+    }
> -+    return 0;
> -+}
> -diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-4.c b/gcc/testsuite/=
c-c++-common/Wbidi-chars-4.c
> -new file mode 100644
> -index 00000000000..639e5c62e88
> ---- /dev/null
> -+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-4.c
> -@@ -0,0 +1,188 @@
> -+/* PR preprocessor/103026 */
> -+/* { dg-do compile } */
> -+/* { dg-options "-Wbidi-chars=3Dany -Wno-multichar -Wno-overflow" } */
> -+/* Test all bidi chars in various contexts (identifiers, comments,
> -+   string literals, character constants), both UCN and UTF-8.  The bidi
> -+   chars here are properly terminated, except for the character constan=
ts.  */
> -+
> -+/* a b c LRE=E2=AA 1 2 3 PDF=E2=AC x y z */
> -+/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
> -+/* a b c RLE=E2=AB 1 2 3 PDF=E2=AC x y z */
> -+/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
> -+/* a b c LRO=E2=AD 1 2 3 PDF=E2=AC x y z */
> -+/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
> -+/* a b c RLO=E2=AE 1 2 3 PDF=E2=AC x y z */
> -+/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
> -+/* a b c LRI=E2=A6 1 2 3 PDI=E2=A9 x y z */
> -+/* { dg-warning "U\\+2066" "" { target *-*-* } .-1 } */
> -+/* a b c RLI=E2=A7 1 2 3 PDI=E2=A9 x y */
> -+/* { dg-warning "U\\+2067" "" { target *-*-* } .-1 } */
> -+/* a b c FSI=E2=A8 1 2 3 PDI=E2=A9 x y z */
> -+/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
> -+
> -+/* Same but C++ comments instead.  */
> -+// a b c LRE=E2=AA 1 2 3 PDF=E2=AC x y z
> -+/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
> -+// a b c RLE=E2=AB 1 2 3 PDF=E2=AC x y z
> -+/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
> -+// a b c LRO=E2=AD 1 2 3 PDF=E2=AC x y z
> -+/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
> -+// a b c RLO=E2=AE 1 2 3 PDF=E2=AC x y z
> -+/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
> -+// a b c LRI=E2=A6 1 2 3 PDI=E2=A9 x y z
> -+/* { dg-warning "U\\+2066" "" { target *-*-* } .-1 } */
> -+// a b c RLI=E2=A7 1 2 3 PDI=E2=A9 x y
> -+/* { dg-warning "U\\+2067" "" { target *-*-* } .-1 } */
> -+// a b c FSI=E2=A8 1 2 3 PDI=E2=A9 x y z
> -+/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
> -+
> -+/* Here we're closing an unopened context, warn when =3Dany.  */
> -+/* a b c PDI=E2=A9 x y z */
> -+/* { dg-warning "U\\+2069" "" { target *-*-* } .-1 } */
> -+/* a b c PDF=E2=AC x y z */
> -+/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
> -+// a b c PDI=E2=A9 x y z
> -+/* { dg-warning "U\\+2069" "" { target *-*-* } .-1 } */
> -+// a b c PDF=E2=AC x y z
> -+/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
> -+
> -+/* Multiline comments.  */
> -+/* a b c PDI=E2=A9 x y z
> -+   */
> -+/* { dg-warning "U\\+2069" "" { target *-*-* } .-2 } */
> -+/* a b c PDF=E2=AC x y z
> -+   */
> -+/* { dg-warning "U\\+202C" "" { target *-*-* } .-2 } */
> -+/* first
> -+   a b c PDI=E2=A9 x y z
> -+   */
> -+/* { dg-warning "U\\+2069" "" { target *-*-* } .-2 } */
> -+/* first
> -+   a b c PDF=E2=AC x y z
> -+   */
> -+/* { dg-warning "U\\+202C" "" { target *-*-* } .-2 } */
> -+/* first
> -+   a b c PDI=E2=A9 x y z */
> -+/* { dg-warning "U\\+2069" "" { target *-*-* } .-1 } */
> -+/* first
> -+   a b c PDF=E2=AC x y z */
> -+/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
> -+
> -+void
> -+g1 ()
> -+{
> -+  const char *s1 =3D "a b c LRE=E2=AA 1 2 3 PDF=E2=AC x y z";
> -+/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
> -+  const char *s2 =3D "a b c RLE=E2=AB 1 2 3 PDF=E2=AC x y z";
> -+/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
> -+  const char *s3 =3D "a b c LRO=E2=AD 1 2 3 PDF=E2=AC x y z";
> -+/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
> -+  const char *s4 =3D "a b c RLO=E2=AE 1 2 3 PDF=E2=AC x y z";
> -+/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
> -+  const char *s5 =3D "a b c LRI=E2=A6 1 2 3 PDI=E2=A9 x y z";
> -+/* { dg-warning "U\\+2066" "" { target *-*-* } .-1 } */
> -+  const char *s6 =3D "a b c RLI=E2=A7 1 2 3 PDI=E2=A9 x y z";
> -+/* { dg-warning "U\\+2067" "" { target *-*-* } .-1 } */
> -+  const char *s7 =3D "a b c FSI=E2=A8 1 2 3 PDI=E2=A9 x y z";
> -+/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
> -+  const char *s8 =3D "a b c PDI=E2=A9 x y z";
> -+/* { dg-warning "U\\+2069" "" { target *-*-* } .-1 } */
> -+  const char *s9 =3D "a b c PDF=E2=AC x y z";
> -+/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
> -+
> -+  const char *s10 =3D "a b c LRE\u202a 1 2 3 PDF\u202c x y z";
> -+/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
> -+  const char *s11 =3D "a b c LRE\u202A 1 2 3 PDF\u202c x y z";
> -+/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
> -+  const char *s12 =3D "a b c RLE\u202b 1 2 3 PDF\u202c x y z";
> -+/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
> -+  const char *s13 =3D "a b c RLE\u202B 1 2 3 PDF\u202c x y z";
> -+/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
> -+  const char *s14 =3D "a b c LRO\u202d 1 2 3 PDF\u202c x y z";
> -+/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
> -+  const char *s15 =3D "a b c LRO\u202D 1 2 3 PDF\u202c x y z";
> -+/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
> -+  const char *s16 =3D "a b c RLO\u202e 1 2 3 PDF\u202c x y z";
> -+/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
> -+  const char *s17 =3D "a b c RLO\u202E 1 2 3 PDF\u202c x y z";
> -+/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
> -+  const char *s18 =3D "a b c LRI\u2066 1 2 3 PDI\u2069 x y z";
> -+/* { dg-warning "U\\+2066" "" { target *-*-* } .-1 } */
> -+  const char *s19 =3D "a b c RLI\u2067 1 2 3 PDI\u2069 x y z";
> -+/* { dg-warning "U\\+2067" "" { target *-*-* } .-1 } */
> -+  const char *s20 =3D "a b c FSI\u2068 1 2 3 PDI\u2069 x y z";
> -+/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
> -+}
> -+
> -+void
> -+g2 ()
> -+{
> -+  const char c1 =3D '\u202a';
> -+/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
> -+  const char c2 =3D '\u202A';
> -+/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
> -+  const char c3 =3D '\u202b';
> -+/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
> -+  const char c4 =3D '\u202B';
> -+/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
> -+  const char c5 =3D '\u202d';
> -+/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
> -+  const char c6 =3D '\u202D';
> -+/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
> -+  const char c7 =3D '\u202e';
> -+/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
> -+  const char c8 =3D '\u202E';
> -+/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
> -+  const char c9 =3D '\u2066';
> -+/* { dg-warning "U\\+2066" "" { target *-*-* } .-1 } */
> -+  const char c10 =3D '\u2067';
> -+/* { dg-warning "U\\+2067" "" { target *-*-* } .-1 } */
> -+  const char c11 =3D '\u2068';
> -+/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
> -+}
> -+
> -+int a=E2=AAb=E2=ACc;
> -+/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
> -+int a=E2=ABb=E2=ACc;
> -+/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
> -+int a=E2=ADb=E2=ACc;
> -+/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
> -+int a=E2=AEb=E2=ACc;
> -+/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
> -+int a=E2=A6b=E2=A9c;
> -+/* { dg-warning "U\\+2066" "" { target *-*-* } .-1 } */
> -+int a=E2=A7b=E2=A9c;
> -+/* { dg-warning "U\\+2067" "" { target *-*-* } .-1 } */
> -+int a=E2=A8b=E2=A9c;
> -+/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
> -+int A=E2=ACX;
> -+/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
> -+int A\u202cY;
> -+/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
> -+int A\u202CY2;
> -+/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
> -+
> -+int d\u202ae\u202cf;
> -+/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
> -+int d\u202Ae\u202cf2;
> -+/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
> -+int d\u202be\u202cf;
> -+/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
> -+int d\u202Be\u202cf2;
> -+/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
> -+int d\u202de\u202cf;
> -+/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
> -+int d\u202De\u202cf2;
> -+/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
> -+int d\u202ee\u202cf;
> -+/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
> -+int d\u202Ee\u202cf2;
> -+/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
> -+int d\u2066e\u2069f;
> -+/* { dg-warning "U\\+2066" "" { target *-*-* } .-1 } */
> -+int d\u2067e\u2069f;
> -+/* { dg-warning "U\\+2067" "" { target *-*-* } .-1 } */
> -+int d\u2068e\u2069f;
> -+/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
> -+int X\u2069;
> -+/* { dg-warning "U\\+2069" "" { target *-*-* } .-1 } */
> -diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-5.c b/gcc/testsuite/=
c-c++-common/Wbidi-chars-5.c
> -new file mode 100644
> -index 00000000000..68cb053144b
> ---- /dev/null
> -+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-5.c
> -@@ -0,0 +1,188 @@
> -+/* PR preprocessor/103026 */
> -+/* { dg-do compile } */
> -+/* { dg-options "-Wbidi-chars=3Dunpaired -Wno-multichar -Wno-overflow" =
} */
> -+/* Test all bidi chars in various contexts (identifiers, comments,
> -+   string literals, character constants), both UCN and UTF-8.  The bidi
> -+   chars here are properly terminated, except for the character constan=
ts.  */
> -+
> -+/* a b c LRE=E2=AA 1 2 3 PDF=E2=AC x y z */
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+/* a b c RLE=E2=AB 1 2 3 PDF=E2=AC x y z */
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+/* a b c LRO=E2=AD 1 2 3 PDF=E2=AC x y z */
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+/* a b c RLO=E2=AE 1 2 3 PDF=E2=AC x y z */
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+/* a b c LRI=E2=A6 1 2 3 PDI=E2=A9 x y z */
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+/* a b c RLI=E2=A7 1 2 3 PDI=E2=A9 x y */
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+/* a b c FSI=E2=A8 1 2 3 PDI=E2=A9 x y z */
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+
> -+/* Same but C++ comments instead.  */
> -+// a b c LRE=E2=AA 1 2 3 PDF=E2=AC x y z
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+// a b c RLE=E2=AB 1 2 3 PDF=E2=AC x y z
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+// a b c LRO=E2=AD 1 2 3 PDF=E2=AC x y z
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+// a b c RLO=E2=AE 1 2 3 PDF=E2=AC x y z
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+// a b c LRI=E2=A6 1 2 3 PDI=E2=A9 x y z
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+// a b c RLI=E2=A7 1 2 3 PDI=E2=A9 x y
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+// a b c FSI=E2=A8 1 2 3 PDI=E2=A9 x y z
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+
> -+/* Here we're closing an unopened context, warn when =3Dany.  */
> -+/* a b c PDI=E2=A9 x y z */
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+/* a b c PDF=E2=AC x y z */
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+// a b c PDI=E2=A9 x y z
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+// a b c PDF=E2=AC x y z
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+
> -+/* Multiline comments.  */
> -+/* a b c PDI=E2=A9 x y z
> -+   */
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-2 } */
> -+/* a b c PDF=E2=AC x y z
> -+   */
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-2 } */
> -+/* first
> -+   a b c PDI=E2=A9 x y z
> -+   */
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-2 } */
> -+/* first
> -+   a b c PDF=E2=AC x y z
> -+   */
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-2 } */
> -+/* first
> -+   a b c PDI=E2=A9 x y z */
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+/* first
> -+   a b c PDF=E2=AC x y z */
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+
> -+void
> -+g1 ()
> -+{
> -+  const char *s1 =3D "a b c LRE=E2=AA 1 2 3 PDF=E2=AC x y z";
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s2 =3D "a b c RLE=E2=AB 1 2 3 PDF=E2=AC x y z";
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s3 =3D "a b c LRO=E2=AD 1 2 3 PDF=E2=AC x y z";
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s4 =3D "a b c RLO=E2=AE 1 2 3 PDF=E2=AC x y z";
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s5 =3D "a b c LRI=E2=A6 1 2 3 PDI=E2=A9 x y z";
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s6 =3D "a b c RLI=E2=A7 1 2 3 PDI=E2=A9 x y z";
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s7 =3D "a b c FSI=E2=A8 1 2 3 PDI=E2=A9 x y z";
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s8 =3D "a b c PDI=E2=A9 x y z";
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s9 =3D "a b c PDF=E2=AC x y z";
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+
> -+  const char *s10 =3D "a b c LRE\u202a 1 2 3 PDF\u202c x y z";
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s11 =3D "a b c LRE\u202A 1 2 3 PDF\u202c x y z";
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s12 =3D "a b c RLE\u202b 1 2 3 PDF\u202c x y z";
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s13 =3D "a b c RLE\u202B 1 2 3 PDF\u202c x y z";
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s14 =3D "a b c LRO\u202d 1 2 3 PDF\u202c x y z";
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s15 =3D "a b c LRO\u202D 1 2 3 PDF\u202c x y z";
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s16 =3D "a b c RLO\u202e 1 2 3 PDF\u202c x y z";
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s17 =3D "a b c RLO\u202E 1 2 3 PDF\u202c x y z";
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s18 =3D "a b c LRI\u2066 1 2 3 PDI\u2069 x y z";
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s19 =3D "a b c RLI\u2067 1 2 3 PDI\u2069 x y z";
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s20 =3D "a b c FSI\u2068 1 2 3 PDI\u2069 x y z";
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+}
> -+
> -+void
> -+g2 ()
> -+{
> -+  const char c1 =3D '\u202a';
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+  const char c2 =3D '\u202A';
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+  const char c3 =3D '\u202b';
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+  const char c4 =3D '\u202B';
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+  const char c5 =3D '\u202d';
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+  const char c6 =3D '\u202D';
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+  const char c7 =3D '\u202e';
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+  const char c8 =3D '\u202E';
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+  const char c9 =3D '\u2066';
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+  const char c10 =3D '\u2067';
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+  const char c11 =3D '\u2068';
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+}
> -+
> -+int a=E2=AAb=E2=ACc;
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+int a=E2=ABb=E2=ACc;
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+int a=E2=ADb=E2=ACc;
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+int a=E2=AEb=E2=ACc;
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+int a=E2=A6b=E2=A9c;
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+int a=E2=A7b=E2=A9c;
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+int a=E2=A8b=E2=A9c;
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+int A=E2=ACX;
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+int A\u202cY;
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+int A\u202CY2;
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+
> -+int d\u202ae\u202cf;
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+int d\u202Ae\u202cf2;
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+int d\u202be\u202cf;
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+int d\u202Be\u202cf2;
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+int d\u202de\u202cf;
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+int d\u202De\u202cf2;
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+int d\u202ee\u202cf;
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+int d\u202Ee\u202cf2;
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+int d\u2066e\u2069f;
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+int d\u2067e\u2069f;
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+int d\u2068e\u2069f;
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+int X\u2069;
> -+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-6.c b/gcc/testsuite/=
c-c++-common/Wbidi-chars-6.c
> -new file mode 100644
> -index 00000000000..0ce6fff2dee
> ---- /dev/null
> -+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-6.c
> -@@ -0,0 +1,155 @@
> -+/* PR preprocessor/103026 */
> -+/* { dg-do compile } */
> -+/* { dg-options "-Wbidi-chars=3Dunpaired" } */
> -+/* Test nesting of bidi chars in various contexts.  */
> -+
> -+/* Terminated by the wrong char:  */
> -+/* a b c LRE=E2=AA 1 2 3 PDI=E2=A9 x y z */
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+/* a b c RLE=E2=AB 1 2 3 PDI=E2=A9 x y  z*/
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+/* a b c LRO=E2=AD 1 2 3 PDI=E2=A9 x y z */
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+/* a b c RLO=E2=AE 1 2 3 PDI=E2=A9 x y z */
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+/* a b c LRI=E2=A6 1 2 3 PDF=E2=AC x y z */
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+/* a b c RLI=E2=A7 1 2 3 PDF=E2=AC x y z */
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+/* a b c FSI=E2=A8 1 2 3 PDF=E2=AC x y  z*/
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+
> -+/* LRE=E2=AA PDF=E2=AC */
> -+/* LRE=E2=AA LRE=E2=AA PDF=E2=AC PDF=E2=AC */
> -+/* PDF=E2=AC LRE=E2=AA PDF=E2=AC */
> -+/* LRE=E2=AA PDF=E2=AC LRE=E2=AA PDF=E2=AC */
> -+/* LRE=E2=AA LRE=E2=AA PDF=E2=AC */
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+/* PDF=E2=AC LRE=E2=AA */
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+
> -+// a b c LRE=E2=AA 1 2 3 PDI=E2=A9 x y z
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+// a b c RLE=E2=AB 1 2 3 PDI=E2=A9 x y  z*/
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+// a b c LRO=E2=AD 1 2 3 PDI=E2=A9 x y z=20
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+// a b c RLO=E2=AE 1 2 3 PDI=E2=A9 x y z=20
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+// a b c LRI=E2=A6 1 2 3 PDF=E2=AC x y z=20
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+// a b c RLI=E2=A7 1 2 3 PDF=E2=AC x y z=20
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+// a b c FSI=E2=A8 1 2 3 PDF=E2=AC x y  z
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+
> -+// LRE=E2=AA PDF=E2=AC=20
> -+// LRE=E2=AA LRE=E2=AA PDF=E2=AC PDF=E2=AC
> -+// PDF=E2=AC LRE=E2=AA PDF=E2=AC
> -+// LRE=E2=AA PDF=E2=AC LRE=E2=AA PDF=E2=AC
> -+// LRE=E2=AA LRE=E2=AA PDF=E2=AC
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+// PDF=E2=AC LRE=E2=AA
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+
> -+void
> -+g1 ()
> -+{
> -+  const char *s1 =3D "a b c LRE=E2=AA 1 2 3 PDI=E2=A9 x y z";
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s2 =3D "a b c LRE\u202a 1 2 3 PDI\u2069 x y z";
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s3 =3D "a b c RLE=E2=AB 1 2 3 PDI=E2=A9 x y ";
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s4 =3D "a b c RLE\u202b 1 2 3 PDI\u2069 x y z";
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s5 =3D "a b c LRO=E2=AD 1 2 3 PDI=E2=A9 x y z";
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s6 =3D "a b c LRO\u202d 1 2 3 PDI\u2069 x y z";
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s7 =3D "a b c RLO=E2=AE 1 2 3 PDI=E2=A9 x y z";
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s8 =3D "a b c RLO\u202e 1 2 3 PDI\u2069 x y z";
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s9 =3D "a b c LRI=E2=A6 1 2 3 PDF=E2=AC x y z";
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s10 =3D "a b c LRI\u2066 1 2 3 PDF\u202c x y z";
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s11 =3D "a b c RLI=E2=A7 1 2 3 PDF=E2=AC x y z\
> -+    ";
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
> -+  const char *s12 =3D "a b c RLI\u2067 1 2 3 PDF\u202c x y z";
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s13 =3D "a b c FSI=E2=A8 1 2 3 PDF=E2=AC x y z";
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s14 =3D "a b c FSI\u2068 1 2 3 PDF\u202c x y z";
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s15 =3D "PDF=E2=AC LRE=E2=AA";
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s16 =3D "PDF\u202c LRE\u202a";
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s17 =3D "LRE=E2=AA PDF=E2=AC";
> -+  const char *s18 =3D "LRE\u202a PDF\u202c";
> -+  const char *s19 =3D "LRE=E2=AA LRE=E2=AA PDF=E2=AC PDF=E2=AC";
> -+  const char *s20 =3D "LRE\u202a LRE\u202a PDF\u202c PDF\u202c";
> -+  const char *s21 =3D "PDF=E2=AC LRE=E2=AA PDF=E2=AC";
> -+  const char *s22 =3D "PDF\u202c LRE\u202a PDF\u202c";
> -+  const char *s23 =3D "LRE=E2=AA LRE=E2=AA PDF=E2=AC";
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s24 =3D "LRE\u202a LRE\u202a PDF\u202c";
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s25 =3D "PDF=E2=AC LRE=E2=AA";
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s26 =3D "PDF\u202c LRE\u202a";
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s27 =3D "PDF=E2=AC LRE\u202a";
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s28 =3D "PDF\u202c LRE=E2=AA";
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+}
> -+
> -+int aLRE=E2=AAbPDI=E2=A9;
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+int A\u202aB\u2069C;
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+int aRLE=E2=ABbPDI=E2=A9;
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+int a\u202bB\u2069c;
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+int aLRO=E2=ADbPDI=E2=A9;
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+int a\u202db\u2069c2;
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+int aRLO=E2=AEbPDI=E2=A9;
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+int a\u202eb\u2069;
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+int aLRI=E2=A6bPDF=E2=AC;
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+int a\u2066b\u202c;
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+int aRLI=E2=A7bPDF=E2=ACc
> -+;
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
> -+int a\u2067b\u202c;
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+int aFSI=E2=A8bPDF=E2=AC;
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+int a\u2068b\u202c;
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+int aFSI=E2=A8bPD\u202C;
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+int aFSI\u2068bPDF=E2=AC_;
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+int aLRE=E2=AAbPDF=E2=ACb;=20
> -+int A\u202aB\u202c;
> -+int a_LRE=E2=AA_LRE=E2=AA_b_PDF=E2=AC_PDF=E2=AC;
> -+int A\u202aA\u202aB\u202cB\u202c;
> -+int aPDF=E2=ACbLREadPDF=E2=AC;
> -+int a_\u202C_\u202a_\u202c;
> -+int a_LRE=E2=AA_b_PDF=E2=AC_c_LRE=E2=AA_PDF=E2=AC;
> -+int a_\u202a_\u202c_\u202a_\u202c_;
> -+int a_LRE=E2=AA_b_PDF=E2=AC_c_LRE=E2=AA;
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+int a_\u202a_\u202c_\u202a_;
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-7.c b/gcc/testsuite/=
c-c++-common/Wbidi-chars-7.c
> -new file mode 100644
> -index 00000000000..d012d420ec0
> ---- /dev/null
> -+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-7.c
> -@@ -0,0 +1,9 @@
> -+/* PR preprocessor/103026 */
> -+/* { dg-do compile } */
> -+/* { dg-options "-Wbidi-chars=3Dany" } */
> -+/* Test we ignore UCNs in comments.  */
> -+
> -+// a b c \u202a 1 2 3
> -+// a b c \u202A 1 2 3
> -+/* a b c \u202a 1 2 3 */
> -+/* a b c \u202A 1 2 3 */
> -diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-8.c b/gcc/testsuite/=
c-c++-common/Wbidi-chars-8.c
> -new file mode 100644
> -index 00000000000..4f54c5092ec
> ---- /dev/null
> -+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-8.c
> -@@ -0,0 +1,13 @@
> -+/* PR preprocessor/103026 */
> -+/* { dg-do compile } */
> -+/* { dg-options "-Wbidi-chars=3Dany" } */
> -+/* Test \u vs \U.  */
> -+
> -+int a_\u202A;
> -+/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
> -+int a_\u202a_2;
> -+/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
> -+int a_\U0000202A_3;
> -+/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
> -+int a_\U0000202a_4;
> -+/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
> -diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-9.c b/gcc/testsuite/=
c-c++-common/Wbidi-chars-9.c
> -new file mode 100644
> -index 00000000000..e2af1b1ca97
> ---- /dev/null
> -+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-9.c
> -@@ -0,0 +1,29 @@
> -+/* PR preprocessor/103026 */
> -+/* { dg-do compile } */
> -+/* { dg-options "-Wbidi-chars=3Dunpaired" } */
> -+/* Test that we properly separate bidi contexts (comment/identifier/cha=
racter
> -+   constant/string literal).  */
> -+
> -+/* LRE ->=E2=AA<- */ int pdf_\u202c_1;
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+/* RLE ->=E2=AB<- */ int pdf_\u202c_2;
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+/* LRO ->=E2=AD<- */ int pdf_\u202c_3;
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+/* RLO ->=E2=AE<- */ int pdf_\u202c_4;
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+/* LRI ->=E2=A6<-*/ int pdi_\u2069_1;
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+/* RLI ->=E2=A7<- */ int pdi_\u2069_12;
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+/* FSI ->=E2=A8<- */ int pdi_\u2069_3;
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+
> -+const char *s1 =3D "LRE\u202a"; /* PDF ->=E2=AC<- */
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+/* LRE ->=E2=AA<- */ const char *s2 =3D "PDF\u202c";
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+const char *s3 =3D "LRE\u202a"; int pdf_\u202c_5;
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+int lre_\u202a; const char *s4 =3D "PDF\u202c";
> -+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -diff --git a/libcpp/include/cpplib.h b/libcpp/include/cpplib.h
> -index 176f8c5bbce..112b9c24751 100644
> ---- a/libcpp/include/cpplib.h
> -+++ b/libcpp/include/cpplib.h
> -@@ -318,6 +318,17 @@ enum cpp_main_search
> -   CMS_system,  /* Search the system INCLUDE path.  */
> - };
> -=20
> -+/* The possible bidirectional control characters checking levels, from =
least
> -+   restrictive to most.  */
> -+enum cpp_bidirectional_level {
> -+  /* No checking.  */
> -+  bidirectional_none,
> -+  /* Only detect unpaired uses of bidirectional control characters.  */
> -+  bidirectional_unpaired,
> -+  /* Detect any use of bidirectional control characters.  */
> -+  bidirectional_any
> -+};
> -+
> - /* This structure is nested inside struct cpp_reader, and
> -    carries all the options visible to the command line.  */
> - struct cpp_options
> -@@ -531,6 +542,10 @@ struct cpp_options
> -   /* True if warn about differences between C++98 and C++11.  */
> -   bool cpp_warn_cxx11_compat;
> -=20
> -+  /* Nonzero if bidirectional control characters checking is on.  See e=
num
> -+     cpp_bidirectional_level.  */
> -+  unsigned char cpp_warn_bidirectional;
> -+
> -   /* Dependency generation.  */
> -   struct
> -   {
> -@@ -635,7 +650,8 @@ enum cpp_warning_reason {
> -   CPP_W_C90_C99_COMPAT,
> -   CPP_W_C11_C2X_COMPAT,
> -   CPP_W_CXX11_COMPAT,
> --  CPP_W_EXPANSION_TO_DEFINED
> -+  CPP_W_EXPANSION_TO_DEFINED,
> -+  CPP_W_BIDIRECTIONAL
> - };
> -=20
> - /* Callback for header lookup for HEADER, which is the name of a
> -diff --git a/libcpp/init.c b/libcpp/init.c
> -index 5a424e23553..f9a8f5f088f 100644
> ---- a/libcpp/init.c
> -+++ b/libcpp/init.c
> -@@ -219,6 +219,7 @@ cpp_create_reader (enum c_lang lang, cpp
> -       =3D ENABLE_CANONICAL_SYSTEM_HEADERS;
> -   CPP_OPTION (pfile, ext_numeric_literals) =3D 1;
> -   CPP_OPTION (pfile, warn_date_time) =3D 0;
> -+  CPP_OPTION (pfile, cpp_warn_bidirectional) =3D bidirectional_unpaired;
> -=20
> -   /* Default CPP arithmetic to something sensible for the host for the
> -      benefit of dumb users like fix-header.  */
> -diff --git a/libcpp/internal.h b/libcpp/internal.h
> -index 8577cab6c83..0ce0246c5a2 100644
> ---- a/libcpp/internal.h
> -+++ b/libcpp/internal.h
> -@@ -597,6 +597,13 @@ struct cpp_reader
> -   /* Location identifying the main source file -- intended to be line
> -      zero of said file.  */
> -   location_t main_loc;
> -+
> -+  /* Returns true iff we should warn about UTF-8 bidirectional control
> -+     characters.  */
> -+  bool warn_bidi_p () const
> -+  {
> -+    return CPP_OPTION (this, cpp_warn_bidirectional) !=3D bidirectional=
_none;
> -+  }
> - };
> -=20
> - /* Character classes.  Based on the more primitive macros in safe-ctype=
.h.
> -diff --git a/libcpp/lex.c b/libcpp/lex.c
> -index fa2253d41c3..6a4fbce6030 100644
> ---- a/libcpp/lex.c
> -+++ b/libcpp/lex.c
> -@@ -1164,6 +1164,324 @@ _cpp_process_line_notes (cpp_reader *pfi
> -     }
> - }
> -=20
> -+namespace bidi {
> -+  enum class kind {
> -+    NONE, LRE, RLE, LRO, RLO, LRI, RLI, FSI, PDF, PDI, LTR, RTL
> -+  };
> -+
> -+  /* All the UTF-8 encodings of bidi characters start with E2.  */
> -+  constexpr uchar utf8_start =3D 0xe2;
> -+
> -+  /* A vector holding currently open bidi contexts.  We use a char for
> -+     each context, its LSB is 1 if it represents a PDF context, 0 if it
> -+     represents a PDI context.  The next bit is 1 if this context was o=
pen
> -+     by a bidi character written as a UCN, and 0 when it was UTF-8.  */
> -+  semi_embedded_vec <unsigned char, 16> vec;
> -+
> -+  /* Close the whole comment/identifier/string literal/character consta=
nt
> -+     context.  */
> -+  void on_close ()
> -+  {
> -+    vec.truncate (0);
> -+  }
> -+
> -+  /* Pop the last element in the vector.  */
> -+  void pop ()
> -+  {
> -+    unsigned int len =3D vec.count ();
> -+    gcc_checking_assert (len > 0);
> -+    vec.truncate (len - 1);
> -+  }
> -+
> -+  /* Return the context of the Ith element.  */
> -+  kind ctx_at (unsigned int i)
> -+  {
> -+    return (vec[i] & 1) ? kind::PDF : kind::PDI;
> -+  }
> -+
> -+  /* Return which context is currently opened.  */
> -+  kind current_ctx ()
> -+  {
> -+    unsigned int len =3D vec.count ();
> -+    if (len =3D=3D 0)
> -+      return kind::NONE;
> -+    return ctx_at (len - 1);
> -+  }
> -+
> -+  /* Return true if the current context comes from a UCN origin, that i=
s,
> -+     the bidi char which started this bidi context was written as a UCN=
.  */
> -+  bool current_ctx_ucn_p ()
> -+  {
> -+    unsigned int len =3D vec.count ();
> -+    gcc_checking_assert (len > 0);
> -+    return (vec[len - 1] >> 1) & 1;
> -+  }
> -+
> -+  /* We've read a bidi char, update the current vector as necessary.  */
> -+  void on_char (kind k, bool ucn_p)
> -+  {
> -+    switch (k)
> -+      {
> -+      case kind::LRE:
> -+      case kind::RLE:
> -+      case kind::LRO:
> -+      case kind::RLO:
> -+	vec.push (ucn_p ? 3u : 1u);
> -+	break;
> -+      case kind::LRI:
> -+      case kind::RLI:
> -+      case kind::FSI:
> -+	vec.push (ucn_p ? 2u : 0u);
> -+	break;
> -+      /* PDF terminates the scope of the last LRE, RLE, LRO, or RLO
> -+	 whose scope has not yet been terminated.  */
> -+      case kind::PDF:
> -+	if (current_ctx () =3D=3D kind::PDF)
> -+	  pop ();
> -+	break;
> -+      /* PDI terminates the scope of the last LRI, RLI, or FSI whose
> -+	 scope has not yet been terminated, as well as the scopes of
> -+	 any subsequent LREs, RLEs, LROs, or RLOs whose scopes have not
> -+	 yet been terminated.  */
> -+      case kind::PDI:
> -+	for (int i =3D vec.count () - 1; i >=3D 0; --i)
> -+	  if (ctx_at (i) =3D=3D kind::PDI)
> -+	    {
> -+	      vec.truncate (i);
> -+	      break;
> -+	    }
> -+	break;
> -+      case kind::LTR:
> -+      case kind::RTL:
> -+	/* These aren't popped by a PDF/PDI.  */
> -+	break;
> -+      [[likely]] case kind::NONE:
> -+	break;
> -+      default:
> -+	abort ();
> -+      }
> -+  }
> -+
> -+  /* Return a descriptive string for K.  */
> -+  const char *to_str (kind k)
> -+  {
> -+    switch (k)
> -+      {
> -+      case kind::LRE:
> -+	return "U+202A (LEFT-TO-RIGHT EMBEDDING)";
> -+      case kind::RLE:
> -+	return "U+202B (RIGHT-TO-LEFT EMBEDDING)";
> -+      case kind::LRO:
> -+	return "U+202D (LEFT-TO-RIGHT OVERRIDE)";
> -+      case kind::RLO:
> -+	return "U+202E (RIGHT-TO-LEFT OVERRIDE)";
> -+      case kind::LRI:
> -+	return "U+2066 (LEFT-TO-RIGHT ISOLATE)";
> -+      case kind::RLI:
> -+	return "U+2067 (RIGHT-TO-LEFT ISOLATE)";
> -+      case kind::FSI:
> -+	return "U+2068 (FIRST STRONG ISOLATE)";
> -+      case kind::PDF:
> -+	return "U+202C (POP DIRECTIONAL FORMATTING)";
> -+      case kind::PDI:
> -+	return "U+2069 (POP DIRECTIONAL ISOLATE)";
> -+      case kind::LTR:
> -+	return "U+200E (LEFT-TO-RIGHT MARK)";
> -+      case kind::RTL:
> -+	return "U+200F (RIGHT-TO-LEFT MARK)";
> -+      default:
> -+	abort ();
> -+      }
> -+  }
> -+}
> -+
> -+/* Parse a sequence of 3 bytes starting with P and return its bidi code=
.  */
> -+
> -+static bidi::kind
> -+get_bidi_utf8 (const unsigned char *const p)
> -+{
> -+  gcc_checking_assert (p[0] =3D=3D bidi::utf8_start);
> -+
> -+  if (p[1] =3D=3D 0x80)
> -+    switch (p[2])
> -+      {
> -+      case 0xaa:
> -+	return bidi::kind::LRE;
> -+      case 0xab:
> -+	return bidi::kind::RLE;
> -+      case 0xac:
> -+	return bidi::kind::PDF;
> -+      case 0xad:
> -+	return bidi::kind::LRO;
> -+      case 0xae:
> -+	return bidi::kind::RLO;
> -+      case 0x8e:
> -+	return bidi::kind::LTR;
> -+      case 0x8f:
> -+	return bidi::kind::RTL;
> -+      default:
> -+	break;
> -+      }
> -+  else if (p[1] =3D=3D 0x81)
> -+    switch (p[2])
> -+      {
> -+      case 0xa6:
> -+	return bidi::kind::LRI;
> -+      case 0xa7:
> -+	return bidi::kind::RLI;
> -+      case 0xa8:
> -+	return bidi::kind::FSI;
> -+      case 0xa9:
> -+	return bidi::kind::PDI;
> -+      default:
> -+	break;
> -+      }
> -+
> -+  return bidi::kind::NONE;
> -+}
> -+
> -+/* Parse a UCN where P points just past \u or \U and return its bidi co=
de.  */
> -+
> -+static bidi::kind
> -+get_bidi_ucn (const unsigned char *p, bool is_U)
> -+{
> -+  /* 6.4.3 Universal Character Names
> -+      \u hex-quad
> -+      \U hex-quad hex-quad
> -+     where \unnnn means \U0000nnnn.  */
> -+
> -+  if (is_U)
> -+    {
> -+      if (p[0] !=3D '0' || p[1] !=3D '0' || p[2] !=3D '0' || p[3] !=3D =
'0')
> -+	return bidi::kind::NONE;
> -+      /* Skip 4B so we can treat \u and \U the same below.  */
> -+      p +=3D 4;
> -+    }
> -+
> -+  /* All code points we are looking for start with 20xx.  */
> -+  if (p[0] !=3D '2' || p[1] !=3D '0')
> -+    return bidi::kind::NONE;
> -+  else if (p[2] =3D=3D '2')
> -+    switch (p[3])
> -+      {
> -+      case 'a':
> -+      case 'A':
> -+	return bidi::kind::LRE;
> -+      case 'b':
> -+      case 'B':
> -+	return bidi::kind::RLE;
> -+      case 'c':
> -+      case 'C':
> -+	return bidi::kind::PDF;
> -+      case 'd':
> -+      case 'D':
> -+	return bidi::kind::LRO;
> -+      case 'e':
> -+      case 'E':
> -+	return bidi::kind::RLO;
> -+      default:
> -+	break;
> -+      }
> -+  else if (p[2] =3D=3D '6')
> -+    switch (p[3])
> -+      {
> -+      case '6':
> -+	return bidi::kind::LRI;
> -+      case '7':
> -+	return bidi::kind::RLI;
> -+      case '8':
> -+	return bidi::kind::FSI;
> -+      case '9':
> -+	return bidi::kind::PDI;
> -+      default:
> -+	break;
> -+      }
> -+  else if (p[2] =3D=3D '0')
> -+    switch (p[3])
> -+      {
> -+      case 'e':
> -+      case 'E':
> -+	return bidi::kind::LTR;
> -+      case 'f':
> -+      case 'F':
> -+	return bidi::kind::RTL;
> -+      default:
> -+	break;
> -+      }
> -+
> -+  return bidi::kind::NONE;
> -+}
> -+
> -+/* We're closing a bidi context, that is, we've encountered a newline,
> -+   are closing a C-style comment, or are at the end of a string literal,
> -+   character constant, or identifier.  Warn if this context was not
> -+   properly terminated by a PDI or PDF.  P points to the last character
> -+   in this context.  */
> -+
> -+static void
> -+maybe_warn_bidi_on_close (cpp_reader *pfile, const uchar *p)
> -+{
> -+  if (CPP_OPTION (pfile, cpp_warn_bidirectional) =3D=3D bidirectional_u=
npaired
> -+      && bidi::vec.count () > 0)
> -+    {
> -+      const location_t loc
> -+	=3D linemap_position_for_column (pfile->line_table,
> -+				       CPP_BUF_COLUMN (pfile->buffer, p));
> -+      cpp_warning_with_line (pfile, CPP_W_BIDIRECTIONAL, loc, 0,
> -+			     "unpaired UTF-8 bidirectional control character "
> -+			     "detected");
> -+    }
> -+  /* We're done with this context.  */
> -+  bidi::on_close ();
> -+}
> -+
> -+/* We're at the beginning or in the middle of an identifier/comment/str=
ing
> -+   literal/character constant.  Warn if we've encountered a bidi charac=
ter.
> -+   KIND says which bidi character it was; P points to it in the charact=
er
> -+   stream.  UCN_P is true iff this bidi character was written as a UCN.=
  */
> -+
> -+static void
> -+maybe_warn_bidi_on_char (cpp_reader *pfile, const uchar *p, bidi::kind =
kind,
> -+			 bool ucn_p)
> -+{
> -+  if (__builtin_expect (kind =3D=3D bidi::kind::NONE, 1))
> -+    return;
> -+
> -+  const auto warn_bidi =3D CPP_OPTION (pfile, cpp_warn_bidirectional);
> -+
> -+  if (warn_bidi !=3D bidirectional_none)
> -+    {
> -+      const location_t loc
> -+	=3D linemap_position_for_column (pfile->line_table,
> -+				       CPP_BUF_COLUMN (pfile->buffer, p));
> -+      /* It seems excessive to warn about a PDI/PDF that is closing
> -+	 an opened context because we've already warned about the
> -+	 opening character.  Except warn when we have a UCN x UTF-8
> -+	 mismatch.  */
> -+      if (kind =3D=3D bidi::current_ctx ())
> -+	{
> -+	  if (warn_bidi =3D=3D bidirectional_unpaired
> -+	      && bidi::current_ctx_ucn_p () !=3D ucn_p)
> -+	    cpp_warning_with_line (pfile, CPP_W_BIDIRECTIONAL, loc, 0,
> -+				   "UTF-8 vs UCN mismatch when closing "
> -+				   "a context by \"%s\"", bidi::to_str (kind));
> -+	}
> -+      else if (warn_bidi =3D=3D bidirectional_any)
> -+	{
> -+	  if (kind =3D=3D bidi::kind::PDF || kind =3D=3D bidi::kind::PDI)
> -+	    cpp_warning_with_line (pfile, CPP_W_BIDIRECTIONAL, loc, 0,
> -+				   "\"%s\" is closing an unopened context",
> -+				   bidi::to_str (kind));
> -+	  else
> -+	    cpp_warning_with_line (pfile, CPP_W_BIDIRECTIONAL, loc, 0,
> -+				   "found problematic Unicode character \"%s\"",
> -+				   bidi::to_str (kind));
> -+	}
> -+    }
> -+  /* We're done with this context.  */
> -+  bidi::on_char (kind, ucn_p);
> -+}
> -+
> - /* Skip a C-style block comment.  We find the end of the comment by
> -    seeing if an asterisk is before every '/' we encounter.  Returns
> -    nonzero if comment terminated by EOF, zero otherwise.
> -@@ -1175,6 +1493,7 @@ _cpp_skip_block_comment (cpp_reader *pfi
> -   cpp_buffer *buffer =3D pfile->buffer;
> -   const uchar *cur =3D buffer->cur;
> -   uchar c;
> -+  const bool warn_bidi_p =3D pfile->warn_bidi_p ();
> -=20
> -   cur++;
> -   if (*cur =3D=3D '/')
> -@@ -1189,7 +1508,11 @@ _cpp_skip_block_comment (cpp_reader *pfi
> -       if (c =3D=3D '/')
> - 	{
> - 	  if (cur[-2] =3D=3D '*')
> --	    break;
> -+	    {
> -+	      if (warn_bidi_p)
> -+		maybe_warn_bidi_on_close (pfile, cur);
> -+	      break;
> -+	    }
> -=20
> - 	  /* Warn about potential nested comments, but not if the '/'
> - 	     comes immediately before the true comment delimiter.
> -@@ -1208,6 +1531,8 @@ _cpp_skip_block_comment (cpp_reader *pfi
> - 	{
> - 	  unsigned int cols;
> - 	  buffer->cur =3D cur - 1;
> -+	  if (warn_bidi_p)
> -+	    maybe_warn_bidi_on_close (pfile, cur);
> - 	  _cpp_process_line_notes (pfile, true);
> - 	  if (buffer->next_line >=3D buffer->rlimit)
> - 	    return true;
> -@@ -1218,6 +1543,13 @@ _cpp_skip_block_comment (cpp_reader *pfi
> -=20
> - 	  cur =3D buffer->cur;
> - 	}
> -+      /* If this is a beginning of a UTF-8 encoding, it might be
> -+	 a bidirectional control character.  */
> -+      else if (__builtin_expect (c =3D=3D bidi::utf8_start, 0) && warn_=
bidi_p)
> -+	{
> -+	  bidi::kind kind =3D get_bidi_utf8 (cur - 1);
> -+	  maybe_warn_bidi_on_char (pfile, cur, kind, /*ucn_p=3D*/false);
> -+	}
> -     }
> -=20
> -   buffer->cur =3D cur;
> -@@ -1233,9 +1565,31 @@ skip_line_comment (cpp_reader *pfile)
> - {
> -   cpp_buffer *buffer =3D pfile->buffer;
> -   location_t orig_line =3D pfile->line_table->highest_line;
> -+  const bool warn_bidi_p =3D pfile->warn_bidi_p ();
> -=20
> --  while (*buffer->cur !=3D '\n')
> --    buffer->cur++;
> -+  if (!warn_bidi_p)
> -+    while (*buffer->cur !=3D '\n')
> -+      buffer->cur++;
> -+  else
> -+    {
> -+      while (*buffer->cur !=3D '\n'
> -+	     && *buffer->cur !=3D bidi::utf8_start)
> -+	buffer->cur++;
> -+      if (__builtin_expect (*buffer->cur =3D=3D bidi::utf8_start, 0))
> -+	{
> -+	  while (*buffer->cur !=3D '\n')
> -+	    {
> -+	      if (__builtin_expect (*buffer->cur =3D=3D bidi::utf8_start, 0))
> -+		{
> -+		  bidi::kind kind =3D get_bidi_utf8 (buffer->cur);
> -+		  maybe_warn_bidi_on_char (pfile, buffer->cur, kind,
> -+					   /*ucn_p=3D*/false);
> -+		}
> -+	      buffer->cur++;
> -+	    }
> -+	  maybe_warn_bidi_on_close (pfile, buffer->cur);
> -+	}
> -+    }
> -=20
> -   _cpp_process_line_notes (pfile, true);
> -   return orig_line !=3D pfile->line_table->highest_line;
> -@@ -1317,11 +1671,13 @@ static const cppchar_t utf8_signifier =3D
> -=20
> - /* Returns TRUE if the sequence starting at buffer->cur is valid in
> -    an identifier.  FIRST is TRUE if this starts an identifier.  */
> -+
> - static bool
> - forms_identifier_p (cpp_reader *pfile, int first,
> - 		    struct normalize_state *state)
> - {
> -   cpp_buffer *buffer =3D pfile->buffer;
> -+  const bool warn_bidi_p =3D pfile->warn_bidi_p ();
> -=20
> -   if (*buffer->cur =3D=3D '$')
> -     {
> -@@ -1344,6 +1700,13 @@ forms_identifier_p (cpp_reader *pfile, i
> -       cppchar_t s;
> -       if (*buffer->cur >=3D utf8_signifier)
> - 	{
> -+	  if (__builtin_expect (*buffer->cur =3D=3D bidi::utf8_start, 0)
> -+	      && warn_bidi_p)
> -+	    {
> -+	      bidi::kind kind =3D get_bidi_utf8 (buffer->cur);
> -+	      maybe_warn_bidi_on_char (pfile, buffer->cur, kind,
> -+				       /*ucn_p=3D*/false);
> -+	    }
> - 	  if (_cpp_valid_utf8 (pfile, &buffer->cur, buffer->rlimit, 1 + !first,
> - 			       state, &s))
> - 	    return true;
> -@@ -1352,6 +1715,13 @@ forms_identifier_p (cpp_reader *pfile, i
> - 	       && (buffer->cur[1] =3D=3D 'u' || buffer->cur[1] =3D=3D 'U'))
> - 	{
> - 	  buffer->cur +=3D 2;
> -+	  if (warn_bidi_p)
> -+	    {
> -+	      bidi::kind kind =3D get_bidi_ucn (buffer->cur,
> -+					      buffer->cur[-1] =3D=3D 'U');
> -+	      maybe_warn_bidi_on_char (pfile, buffer->cur, kind,
> -+				       /*ucn_p=3D*/true);
> -+	    }
> - 	  if (_cpp_valid_ucn (pfile, &buffer->cur, buffer->rlimit, 1 + !first,
> - 			      state, &s, NULL, NULL))
> - 	    return true;
> -@@ -1460,6 +1830,7 @@ lex_identifier (cpp_reader *pfile, const
> -   const uchar *cur;
> -   unsigned int len;
> -   unsigned int hash =3D HT_HASHSTEP (0, *base);
> -+  const bool warn_bidi_p =3D pfile->warn_bidi_p ();
> -=20
> -   cur =3D pfile->buffer->cur;
> -   if (! starts_ucn)
> -@@ -1483,6 +1854,8 @@ lex_identifier (cpp_reader *pfile, const
> - 	    pfile->buffer->cur++;
> - 	  }
> -       } while (forms_identifier_p (pfile, false, nst));
> -+      if (warn_bidi_p)
> -+	maybe_warn_bidi_on_close (pfile, pfile->buffer->cur);
> -       result =3D _cpp_interpret_identifier (pfile, base,
> - 					  pfile->buffer->cur - base);
> -       *spelling =3D cpp_lookup (pfile, base, pfile->buffer->cur - base);
> -@@ -1719,6 +2092,7 @@ static void
> - lex_raw_string (cpp_reader *pfile, cpp_token *token, const uchar *base)
> - {
> -   const uchar *pos =3D base;
> -+  const bool warn_bidi_p =3D pfile->warn_bidi_p ();
> -=20
> -   /* 'tis a pity this information isn't passed down from the lexer's
> -      initial categorization of the token.  */
> -@@ -1955,8 +2329,15 @@ lex_raw_string (cpp_reader *pfile, cpp_t
> - 	  pos =3D base =3D pfile->buffer->cur;
> - 	  note =3D &pfile->buffer->notes[pfile->buffer->cur_note];
> - 	}
> -+      else if (__builtin_expect ((unsigned char) c =3D=3D bidi::utf8_st=
art, 0)
> -+	       && warn_bidi_p)
> -+	maybe_warn_bidi_on_char (pfile, pos - 1, get_bidi_utf8 (pos - 1),
> -+				 /*ucn_p=3D*/false);
> -     }
> -=20
> -+  if (warn_bidi_p)
> -+    maybe_warn_bidi_on_close (pfile, pos);
> -+
> -   if (CPP_OPTION (pfile, user_literals))
> -     {
> -       /* If a string format macro, say from inttypes.h, is placed touch=
ing
> -@@ -2051,15 +2432,27 @@ lex_string (cpp_reader *pfile, cpp_token
> -   else
> -     terminator =3D '>', type =3D CPP_HEADER_NAME;
> -=20
> -+  const bool warn_bidi_p =3D pfile->warn_bidi_p ();
> -   for (;;)
> -     {
> -       cppchar_t c =3D *cur++;
> -=20
> -       /* In #include-style directives, terminators are not escapable.  =
*/
> -       if (c =3D=3D '\\' && !pfile->state.angled_headers && *cur !=3D '\=
n')
> --	cur++;
> -+	{
> -+	  if ((cur[0] =3D=3D 'u' || cur[0] =3D=3D 'U') && warn_bidi_p)
> -+	    {
> -+	      bidi::kind kind =3D get_bidi_ucn (cur + 1, cur[0] =3D=3D 'U');
> -+	      maybe_warn_bidi_on_char (pfile, cur, kind, /*ucn_p=3D*/true);
> -+	    }
> -+	  cur++;
> -+	}
> -       else if (c =3D=3D terminator)
> --	break;
> -+	{
> -+	  if (warn_bidi_p)
> -+	    maybe_warn_bidi_on_close (pfile, cur - 1);
> -+	  break;
> -+	}
> -       else if (c =3D=3D '\n')
> - 	{
> - 	  cur--;
> -@@ -2076,6 +2469,11 @@ lex_string (cpp_reader *pfile, cpp_token
> - 	}
> -       else if (c =3D=3D '\0')
> - 	saw_NUL =3D true;
> -+      else if (__builtin_expect (c =3D=3D bidi::utf8_start, 0) && warn_=
bidi_p)
> -+	{
> -+	  bidi::kind kind =3D get_bidi_utf8 (cur - 1);
> -+	  maybe_warn_bidi_on_char (pfile, cur - 1, kind, /*ucn_p=3D*/false);
> -+	}
> -     }
> -=20
> -   if (saw_NUL && !pfile->state.skipping)
> diff --git a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directo=
ries.patch b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directori=
es.patch
> index 18a9fb8701..b85f7ed2c7 100644
> --- a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.pa=
tch
> +++ b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.pa=
tch
> @@ -14,14 +14,15 @@ wants this to be a failure, they can add "-Werror=3Dp=
oison-system-directories".
>  Upstream-Status: Pending
>  Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Signed-off-by: Bernhard Rosenkr=E4nzer <bernhard.rosenkraenzer.ext@huawe=
i.com> [ported to gcc 12]
>  ---
>   gcc/common.opt      |  4 ++++
>   gcc/config.in       | 10 ++++++++++
>   gcc/configure       | 19 +++++++++++++++++++
>   gcc/configure.ac    | 16 ++++++++++++++++
>   gcc/doc/invoke.texi |  9 +++++++++
> - gcc/gcc.c           |  9 +++++++--
> - gcc/incpath.c       | 21 +++++++++++++++++++++
> + gcc/gcc.cc          |  9 +++++++--
> + gcc/incpath.cc      | 21 +++++++++++++++++++++
>   7 files changed, 86 insertions(+), 2 deletions(-)
> =20
>  diff --git a/gcc/common.opt b/gcc/common.opt
> @@ -158,10 +159,10 @@ index 7a368959e5e..6659a903bf0 100644
>   @item -Wfloat-equal
>   @opindex Wfloat-equal
>   @opindex Wno-float-equal
> -diff --git a/gcc/gcc.c b/gcc/gcc.c
> +diff --git a/gcc/gcc.cc b/gcc/gcc.cc
>  index 7837553958b..19c75b6e20d 100644
> ---- a/gcc/gcc.c
> -+++ b/gcc/gcc.c
> +--- a/gcc/gcc.cc
> ++++ b/gcc/gcc.cc
>  @@ -1152,6 +1152,8 @@ proper position among the other output files.  */
>      "%{fuse-ld=3D*:-fuse-ld=3D%*} " LINK_COMPRESS_DEBUG_SPEC \
>      "%X %{o*} %{e*} %{N} %{n} %{r}\
> @@ -185,10 +186,10 @@ index 7837553958b..19c75b6e20d 100644
>  =20
>   /* Pass -d* flags, possibly modifying -dumpdir, -dumpbase et al.
>  =20
> -diff --git a/gcc/incpath.c b/gcc/incpath.c
> +diff --git a/gcc/incpath.cc b/gcc/incpath.cc
>  index 446d280321d..fbfc0ce03b8 100644
> ---- a/gcc/incpath.c
> -+++ b/gcc/incpath.c
> +--- a/gcc/incpath.cc
> ++++ b/gcc/incpath.cc
>  @@ -26,6 +26,7 @@
>   #include "intl.h"
>   #include "incpath.h"
> diff --git a/meta/recipes-devtools/gcc/gcc/0003-CVE-2021-35465.patch b/me=
ta/recipes-devtools/gcc/gcc/0003-CVE-2021-35465.patch
> deleted file mode 100644
> index c7a7c76bf8..0000000000
> --- a/meta/recipes-devtools/gcc/gcc/0003-CVE-2021-35465.patch
> +++ /dev/null
> @@ -1,103 +0,0 @@
> -From 30461cf8dba3d3adb15a125e4da48800eb2b9b8f Mon Sep 17 00:00:00 2001
> -From: Richard Earnshaw <rearnsha@arm.com>
> -Date: Fri, 18 Jun 2021 17:18:37 +0100
> -Subject: [PATCH] arm: fix vlldm erratum for Armv8.1-m [PR102035]
> -
> -For Armv8.1-m we generate code that emits VLLDM directly and do not
> -rely on support code in the library, so emit the mitigation directly
> -as well, when required.  In this case, we can use the compiler options
> -to determine when to apply the fix and when it is safe to omit it.
> -
> -gcc:
> -	PR target/102035
> -	* config/arm/arm.md (attribute arch): Add fix_vlldm.
> -	(arch_enabled): Use it.
> -	* config/arm/vfp.md (lazy_store_multiple_insn): Add alternative to
> -	use when erratum mitigation is needed.
> -
> -CVE: CVE-2021-35465
> -Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=3Dgcc.gi=
t;h=3D30461cf8dba3d3adb15a125e4da48800eb2b9b8f]
> -Signed-off-by: Pgowda <pgowda.cve@gmail.com>
> -
> ----
> - gcc/config/arm/arm.md | 11 +++++++++--
> - gcc/config/arm/vfp.md | 10 +++++++---
> - 2 files changed, 16 insertions(+), 5 deletions(-)
> -
> -diff -upr a/gcc/config/arm/arm.md b/gcc/config/arm/arm.md
> ---- a/gcc/config/arm/arm.md	2020-07-22 23:35:17.344384552 -0700
> -+++ b/gcc/config/arm/arm.md	2021-11-11 20:33:58.431543947 -0800
> -@@ -132,9 +132,12 @@
> - ; TARGET_32BIT, "t1" or "t2" to specify a specific Thumb mode.  "v6"
> - ; for ARM or Thumb-2 with arm_arch6, and nov6 for ARM without
> - ; arm_arch6.  "v6t2" for Thumb-2 with arm_arch6 and "v8mb" for ARMv8-M
> --; Baseline.  This attribute is used to compute attribute "enabled",
> -+; Baseline.  "fix_vlldm" is for fixing the v8-m/v8.1-m VLLDM erratum.
> -+; This attribute is used to compute attribute "enabled",
> - ; use type "any" to enable an alternative in all cases.
> --(define_attr "arch" "any,a,t,32,t1,t2,v6,nov6,v6t2,v8mb,iwmmxt,iwmmxt2,=
armv6_or_vfpv3,neon,mve"
> -+(define_attr "arch" "any, a, t, 32, t1, t2, v6,nov6, v6t2, \
> -+		     v8mb, fix_vlldm, iwmmxt, iwmmxt2, armv6_or_vfpv3, \
> -+		     neon, mve"
> -   (const_string "any"))
> -=20
> - (define_attr "arch_enabled" "no,yes"
> -@@ -177,6 +180,10 @@
> - 	      (match_test "TARGET_THUMB1 && arm_arch8"))
> - 	 (const_string "yes")
> -=20
> -+	 (and (eq_attr "arch" "fix_vlldm")
> -+	      (match_test "fix_vlldm"))
> -+	 (const_string "yes")
> -+
> - 	 (and (eq_attr "arch" "iwmmxt2")
> - 	      (match_test "TARGET_REALLY_IWMMXT2"))
> - 	 (const_string "yes")
> -diff -upr a/gcc/config/arm/vfp.md b/gcc/config/arm/vfp.md
> ---- a/gcc/config/arm/vfp.md	2020-07-22 23:35:17.356384684 -0700
> -+++ b/gcc/config/arm/vfp.md	2021-11-11 20:33:58.431543947 -0800
> -@@ -1703,12 +1703,15 @@
> -    (set_attr "type" "mov_reg")]
> - )
> -=20
> -+;; Both this and the next instruction are treated by GCC in the same
> -+;; way as a blockage pattern.  That's perhaps stronger than it needs
> -+;; to be, but we do not want accesses to the VFP register bank to be
> -+;; moved across either instruction.
> -+
> - (define_insn "lazy_store_multiple_insn"
> --  [(set (match_operand:SI 0 "s_register_operand" "+&rk")
> --	(post_dec:SI (match_dup 0)))
> --   (unspec_volatile [(const_int 0)
> --		     (mem:SI (post_dec:SI (match_dup 0)))]
> --		    VUNSPEC_VLSTM)]
> -+  [(unspec_volatile
> -+    [(mem:BLK (match_operand:SI 0 "s_register_operand" "rk"))]
> -+    VUNSPEC_VLSTM)]
> -   "use_cmse && reload_completed"
> -   "vlstm%?\\t%0"
> -   [(set_attr "predicable" "yes")
> -@@ -1716,14 +1719,16 @@
> - )
> -=20
> - (define_insn "lazy_load_multiple_insn"
> --  [(set (match_operand:SI 0 "s_register_operand" "+&rk")
> --	(post_inc:SI (match_dup 0)))
> --   (unspec_volatile:SI [(const_int 0)
> --			(mem:SI (match_dup 0))]
> --		       VUNSPEC_VLLDM)]
> -+  [(unspec_volatile
> -+    [(mem:BLK (match_operand:SI 0 "s_register_operand" "rk,rk"))]
> -+    VUNSPEC_VLLDM)]
> -   "use_cmse && reload_completed"
> --  "vlldm%?\\t%0"
> --  [(set_attr "predicable" "yes")
> -+  "@
> -+   vscclrm\\t{vpr}\;vlldm\\t%0
> -+   vlldm\\t%0"
> -+  [(set_attr "arch" "fix_vlldm,*")
> -+   (set_attr "predicable" "no")
> -+   (set_attr "length" "8,4")
> -    (set_attr "type" "load_4")]
> - )
> -=20
> diff --git a/meta/recipes-devtools/gcc/gcc/0003-CVE-2021-42574.patch b/me=
ta/recipes-devtools/gcc/gcc/0003-CVE-2021-42574.patch
> deleted file mode 100644
> index 2995a6fc61..0000000000
> --- a/meta/recipes-devtools/gcc/gcc/0003-CVE-2021-42574.patch
> +++ /dev/null
> @@ -1,142 +0,0 @@
> -From 1a7f2c0774129750fdf73e9f1b78f0ce983c9ab3 Mon Sep 17 00:00:00 2001
> -From: David Malcolm <dmalcolm@redhat.com>
> -Date: Tue, 2 Nov 2021 09:54:32 -0400
> -Subject: [PATCH] libcpp: escape non-ASCII source bytes in -Wbidi-chars=3D
> - [PR103026]
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3Dutf8
> -Content-Transfer-Encoding: 8bit
> -
> -This flags rich_locations associated with -Wbidi-chars=3D so that
> -non-ASCII bytes will be escaped when printing the source lines
> -(using the diagnostics support I added in
> -r12-4825-gbd5e882cf6e0def3dd1bc106075d59a303fe0d1e).
> -
> -In particular, this ensures that the printed source lines will
> -be pure ASCII, and thus the visual ordering of the characters
> -will be the same as the logical ordering.
> -
> -Before:
> -
> -  Wbidi-chars-1.c: In function =E2main=E2:
> -  Wbidi-chars-1.c:6:43: warning: unpaired UTF-8 bidirectional control ch=
aracter detected [-Wbidi-chars=3D]
> -      6 |     /*=E2=AE } =E2=A6if (isAdmin)=E2=A9 =E2=A6 begin admins on=
ly */
> -        |                                           ^
> -  Wbidi-chars-1.c:9:28: warning: unpaired UTF-8 bidirectional control ch=
aracter detected [-Wbidi-chars=3D]
> -      9 |     /* end admins only =E2=AE { =E2=A6*/
> -        |                            ^
> -
> -  Wbidi-chars-11.c:6:15: warning: UTF-8 vs UCN mismatch when closing a c=
ontext by "U+202C (POP DIRECTIONAL FORMATTING)" [-Wbidi-chars=3D]
> -      6 | int LRE_=E2=AA_PDF_\u202c;
> -        |               ^
> -  Wbidi-chars-11.c:8:19: warning: UTF-8 vs UCN mismatch when closing a c=
ontext by "U+202C (POP DIRECTIONAL FORMATTING)" [-Wbidi-chars=3D]
> -      8 | int LRE_\u202a_PDF_=E2=AC_;
> -        |                   ^
> -  Wbidi-chars-11.c:10:28: warning: UTF-8 vs UCN mismatch when closing a =
context by "U+202C (POP DIRECTIONAL FORMATTING)" [-Wbidi-chars=3D]
> -     10 | const char *s1 =3D "LRE_=E2=AA_PDF_\u202c";
> -        |                            ^
> -  Wbidi-chars-11.c:12:33: warning: UTF-8 vs UCN mismatch when closing a =
context by "U+202C (POP DIRECTIONAL FORMATTING)" [-Wbidi-chars=3D]
> -     12 | const char *s2 =3D "LRE_\u202a_PDF_=E2=AC";
> -        |                                 ^
> -
> -After:
> -
> -  Wbidi-chars-1.c: In function =E2main=E2:
> -  Wbidi-chars-1.c:6:43: warning: unpaired UTF-8 bidirectional control ch=
aracter detected [-Wbidi-chars=3D]
> -      6 |     /*<U+202E> } <U+2066>if (isAdmin)<U+2069> <U+2066> begin a=
dmins only */
> -        |                                                               =
            ^
> -  Wbidi-chars-1.c:9:28: warning: unpaired UTF-8 bidirectional control ch=
aracter detected [-Wbidi-chars=3D]
> -      9 |     /* end admins only <U+202E> { <U+2066>*/
> -        |                                            ^
> -
> -  Wbidi-chars-11.c:6:15: warning: UTF-8 vs UCN mismatch when closing a c=
ontext by "U+202C (POP DIRECTIONAL FORMATTING)" [-Wbidi-chars=3D]
> -      6 | int LRE_<U+202A>_PDF_\u202c;
> -        |                       ^
> -  Wbidi-chars-11.c:8:19: warning: UTF-8 vs UCN mismatch when closing a c=
ontext by "U+202C (POP DIRECTIONAL FORMATTING)" [-Wbidi-chars=3D]
> -      8 | int LRE_\u202a_PDF_<U+202C>_;
> -        |                   ^
> -  Wbidi-chars-11.c:10:28: warning: UTF-8 vs UCN mismatch when closing a =
context by "U+202C (POP DIRECTIONAL FORMATTING)" [-Wbidi-chars=3D]
> -     10 | const char *s1 =3D "LRE_<U+202A>_PDF_\u202c";
> -        |                                    ^
> -  Wbidi-chars-11.c:12:33: warning: UTF-8 vs UCN mismatch when closing a =
context by "U+202C (POP DIRECTIONAL FORMATTING)" [-Wbidi-chars=3D]
> -     12 | const char *s2 =3D "LRE_\u202a_PDF_<U+202C>";
> -        |                                 ^
> -
> -libcpp/ChangeLog:
> -	PR preprocessor/103026
> -	* lex.c (maybe_warn_bidi_on_close): Use a rich_location
> -	and call set_escape_on_output (true) on it.
> -	(maybe_warn_bidi_on_char): Likewise.
> -
> -Signed-off-by: David Malcolm <dmalcolm@redhat.com>
> -
> -CVE: CVE-2021-42574
> -Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=3Dgcc.gi=
t;h=3D1a7f2c0774129750fdf73e9f1b78f0ce983c9ab3]
> -Signed-off-by: Pgowda <pgowda.cve@gmail.com>
> -
> ----
> - libcpp/lex.c | 29 +++++++++++++++++------------
> - 1 file changed, 17 insertions(+), 12 deletions(-)
> -
> -diff --git a/libcpp/lex.c b/libcpp/lex.c
> -index 8188e33b07d..2421d6c0f40 100644
> ---- a/libcpp/lex.c
> -+++ b/libcpp/lex.c
> -@@ -1427,9 +1427,11 @@ maybe_warn_bidi_on_close (cpp_reader *pfile, cons=
t uchar *p)
> -       const location_t loc
> - 	=3D linemap_position_for_column (pfile->line_table,
> - 				       CPP_BUF_COLUMN (pfile->buffer, p));
> --      cpp_warning_with_line (pfile, CPP_W_BIDIRECTIONAL, loc, 0,
> --			     "unpaired UTF-8 bidirectional control character "
> --			     "detected");
> -+      rich_location rich_loc (pfile->line_table, loc);
> -+      rich_loc.set_escape_on_output (true);
> -+      cpp_warning_at (pfile, CPP_W_BIDIRECTIONAL, &rich_loc,
> -+		      "unpaired UTF-8 bidirectional control character "
> -+		      "detected");
> -     }
> -   /* We're done with this context.  */
> -   bidi::on_close ();
> -@@ -1454,6 +1456,9 @@ maybe_warn_bidi_on_char (cpp_reader *pfile, const =
uchar *p, bidi::kind kind,
> -       const location_t loc
> - 	=3D linemap_position_for_column (pfile->line_table,
> - 				       CPP_BUF_COLUMN (pfile->buffer, p));
> -+      rich_location rich_loc (pfile->line_table, loc);
> -+      rich_loc.set_escape_on_output (true);
> -+
> -       /* It seems excessive to warn about a PDI/PDF that is closing
> - 	 an opened context because we've already warned about the
> - 	 opening character.  Except warn when we have a UCN x UTF-8
> -@@ -1462,20 +1467,20 @@ maybe_warn_bidi_on_char (cpp_reader *pfile, cons=
t uchar *p, bidi::kind kind,
> - 	{
> - 	  if (warn_bidi =3D=3D bidirectional_unpaired
> - 	      && bidi::current_ctx_ucn_p () !=3D ucn_p)
> --	    cpp_warning_with_line (pfile, CPP_W_BIDIRECTIONAL, loc, 0,
> --				   "UTF-8 vs UCN mismatch when closing "
> --				   "a context by \"%s\"", bidi::to_str (kind));
> -+	    cpp_warning_at (pfile, CPP_W_BIDIRECTIONAL, &rich_loc,
> -+			    "UTF-8 vs UCN mismatch when closing "
> -+			    "a context by \"%s\"", bidi::to_str (kind));
> - 	}
> -       else if (warn_bidi =3D=3D bidirectional_any)
> - 	{
> - 	  if (kind =3D=3D bidi::kind::PDF || kind =3D=3D bidi::kind::PDI)
> --	    cpp_warning_with_line (pfile, CPP_W_BIDIRECTIONAL, loc, 0,
> --				   "\"%s\" is closing an unopened context",
> --				   bidi::to_str (kind));
> -+	    cpp_warning_at (pfile, CPP_W_BIDIRECTIONAL, &rich_loc,
> -+			    "\"%s\" is closing an unopened context",
> -+			    bidi::to_str (kind));
> - 	  else
> --	    cpp_warning_with_line (pfile, CPP_W_BIDIRECTIONAL, loc, 0,
> --				   "found problematic Unicode character \"%s\"",
> --				   bidi::to_str (kind));
> -+	    cpp_warning_at (pfile, CPP_W_BIDIRECTIONAL, &rich_loc,
> -+			    "found problematic Unicode character \"%s\"",
> -+			    bidi::to_str (kind));
> - 	}
> -     }
> -   /* We're done with this context.  */
> ---=20
> -2.27.0
> -
> diff --git a/meta/recipes-devtools/gcc/gcc/0004-CVE-2021-35465.patch b/me=
ta/recipes-devtools/gcc/gcc/0004-CVE-2021-35465.patch
> deleted file mode 100644
> index 9dd6a313c2..0000000000
> --- a/meta/recipes-devtools/gcc/gcc/0004-CVE-2021-35465.patch
> +++ /dev/null
> @@ -1,304 +0,0 @@
> -From 809330ab8450261e05919b472783bf15e4b000f7 Mon Sep 17 00:00:00 2001
> -From: Richard Earnshaw <rearnsha@arm.com>
> -Date: Tue, 6 Jul 2021 15:10:18 +0100
> -Subject: [PATCH] arm: Add tests for VLLDM mitigation [PR102035]
> -
> -New tests for the erratum mitigation.
> -
> -gcc/testsuite:
> -	PR target/102035
> -	* gcc.target/arm/cmse/mainline/8_1m/soft/cmse-13a.c: New test.
> -	* gcc.target/arm/cmse/mainline/8_1m/soft/cmse-7a.c: Likewise.
> -	* gcc.target/arm/cmse/mainline/8_1m/soft/cmse-8a.c: Likewise.
> -	* gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-7a.c: Likewise.
> -	* gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-8a.c: Likewise.
> -	* gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-13a.c: Likewise.
> -	* gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-7a.c: Likewise.
> -	* gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-8a.c: Likewise.
> -
> -CVE: CVE-2021-35465
> -Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=3Dgcc.gi=
t;h=3D809330ab8450261e05919b472783bf15e4b000f7]
> -Signed-off-by: Pgowda <pgowda.cve@gmail.com>
> -
> ----
> - .../arm/cmse/mainline/8_1m/soft/cmse-13a.c    | 31 +++++++++++++++++++
> - .../arm/cmse/mainline/8_1m/soft/cmse-7a.c     | 28 +++++++++++++++++
> - .../arm/cmse/mainline/8_1m/soft/cmse-8a.c     | 30 ++++++++++++++++++
> - .../cmse/mainline/8_1m/softfp-sp/cmse-7a.c    | 27 ++++++++++++++++
> - .../cmse/mainline/8_1m/softfp-sp/cmse-8a.c    | 29 +++++++++++++++++
> - .../arm/cmse/mainline/8_1m/softfp/cmse-13a.c  | 30 ++++++++++++++++++
> - .../arm/cmse/mainline/8_1m/softfp/cmse-7a.c   | 27 ++++++++++++++++
> - .../arm/cmse/mainline/8_1m/softfp/cmse-8a.c   | 29 +++++++++++++++++
> - 8 files changed, 231 insertions(+)
> - create mode 100644 gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft=
/cmse-13a.c
> - create mode 100644 gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft=
/cmse-7a.c
> - create mode 100644 gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft=
/cmse-8a.c
> - create mode 100644 gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft=
fp-sp/cmse-7a.c
> - create mode 100644 gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft=
fp-sp/cmse-8a.c
> - create mode 100644 gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft=
fp/cmse-13a.c
> - create mode 100644 gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft=
fp/cmse-7a.c
> - create mode 100644 gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft=
fp/cmse-8a.c
> -
> -diff --git a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-1=
3a.c b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-13a.c
> ---- a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-13a.c	19=
69-12-31 16:00:00.000000000 -0800
> -+++ b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-13a.c	20=
21-11-15 02:30:37.210637445 -0800
> -@@ -0,0 +1,31 @@
> -+/* { dg-do compile } */
> -+/* { dg-options "-mcmse -mfloat-abi=3Dsoft -mfix-cmse-cve-2021-35465" }=
  */
> -+/* { dg-skip-if "Incompatible float ABI" { *-*-* } { "-mfloat-abi=3D*" =
} { "-mfloat-abi=3Dsoft" } } */
> -+
> -+#include "../../../cmse-13.x"
> -+
> -+/* Checks for saving and clearing prior to function call.  */
> -+/* Shift on the same register as blxns.  */
> -+/* { dg-final { scan-assembler "lsrs\t(r\[1,4-9\]|r10|fp|ip), \\1, #1.*=
blxns\t\\1" } } */
> -+/* { dg-final { scan-assembler "lsls\t(r\[1,4-9\]|r10|fp|ip), \\1, #1.*=
blxns\t\\1" } } */
> -+/* { dg-final { scan-assembler-not "mov\tr0, r4" } } */
> -+/* { dg-final { scan-assembler-not "mov\tr2, r4" } } */
> -+/* { dg-final { scan-assembler-not "mov\tr3, r4" } } */
> -+/* { dg-final { scan-assembler "push\t\{r4, r5, r6, r7, r8, r9, r10, fp=
\}" } } */
> -+/* { dg-final { scan-assembler "vlstm\tsp" } } */
> -+/* Check the right registers are cleared and none appears twice.  */
> -+/* { dg-final { scan-assembler "clrm\t\{(r1, )?(r4, )?(r5, )?(r6, )?(r7=
, )?(r8, )?(r9, )?(r10, )?(fp, )?(ip, )?APSR\}" } } */
> -+/* Check that the right number of registers is cleared and thus only one
> -+   register is missing.  */
> -+/* { dg-final { scan-assembler "clrm\t\{((r\[1,4-9\]|r10|fp|ip), ){9}AP=
SR\}" } } */
> -+/* Check that no cleared register is used for blxns.  */
> -+/* { dg-final { scan-assembler-not "clrm\t\{\[^\}\]\+(r\[1,4-9\]|r10|fp=
|ip),\[^\}\]\+\}.*blxns\t\\1" } } */
> -+/* Check for v8.1-m variant of erratum work-around.  */
> -+/* { dg-final { scan-assembler "vscclrm\t\{vpr\}" } } */
> -+/* { dg-final { scan-assembler "vlldm\tsp" } } */
> -+/* { dg-final { scan-assembler "pop\t\{r4, r5, r6, r7, r8, r9, r10, fp\=
}" } } */
> -+/* { dg-final { scan-assembler-not "vmov" } } */
> -+/* { dg-final { scan-assembler-not "vmsr" } } */
> -+
> -+/* Now we check that we use the correct intrinsic to call.  */
> -+/* { dg-final { scan-assembler "blxns" } } */
> -diff --git a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-7=
a.c b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-7a.c
> ---- a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-7a.c	196=
9-12-31 16:00:00.000000000 -0800
> -+++ b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-7a.c	202=
1-11-15 02:30:37.210637445 -0800
> -@@ -0,0 +1,28 @@
> -+/* { dg-do compile } */
> -+/* { dg-options "-mcmse -mfloat-abi=3Dsoft -mfix-cmse-cve-2021-35465" }=
  */
> -+/* { dg-skip-if "Incompatible float ABI" { *-*-* } { "-mfloat-abi=3D*" =
} { "-mfloat-abi=3Dsoft" } } */
> -+
> -+#include "../../../cmse-7.x"
> -+
> -+/* Checks for saving and clearing prior to function call.  */
> -+/* Shift on the same register as blxns.  */
> -+/* { dg-final { scan-assembler "lsrs\t(r\[0-9\]|r10|fp|ip), \\1, #1.*bl=
xns\t\\1" } } */
> -+/* { dg-final { scan-assembler "lsls\t(r\[0-9\]|r10|fp|ip), \\1, #1.*bl=
xns\t\\1" } } */
> -+/* { dg-final { scan-assembler "push\t\{r4, r5, r6, r7, r8, r9, r10, fp=
\}" } } */
> -+/* { dg-final { scan-assembler "vlstm\tsp" } } */
> -+/* Check the right registers are cleared and none appears twice.  */
> -+/* { dg-final { scan-assembler "clrm\t\{(r0, )?(r1, )?(r2, )?(r3, )?(r4=
, )?(r5, )?(r6, )?(r7, )?(r8, )?(r9, )?(r10, )?(fp, )?(ip, )?APSR\}" } } */
> -+/* Check that the right number of registers is cleared and thus only one
> -+   register is missing.  */
> -+/* { dg-final { scan-assembler "clrm\t\{((r\[0-9\]|r10|fp|ip), ){12}APS=
R\}" } } */
> -+/* Check that no cleared register is used for blxns.  */
> -+/* { dg-final { scan-assembler-not "clrm\t\{\[^\}\]\+(r\[0-9\]|r10|fp|i=
p),\[^\}\]\+\}.*blxns\t\\1" } } */
> -+/* Check for v8.1-m variant of erratum work-around.  */
> -+/* { dg-final { scan-assembler "vscclrm\t\{vpr\}" } } */
> -+/* { dg-final { scan-assembler "vlldm\tsp" } } */
> -+/* { dg-final { scan-assembler "pop\t\{r4, r5, r6, r7, r8, r9, r10, fp\=
}" } } */
> -+/* { dg-final { scan-assembler-not "vmov" } } */
> -+/* { dg-final { scan-assembler-not "vmsr" } } */
> -+
> -+/* Now we check that we use the correct intrinsic to call.  */
> -+/* { dg-final { scan-assembler "blxns" } } */
> -diff --git a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-8=
a.c b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-8a.c
> ---- a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-8a.c	196=
9-12-31 16:00:00.000000000 -0800
> -+++ b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-8a.c	202=
1-11-15 02:30:37.210637445 -0800
> -@@ -0,0 +1,30 @@
> -+/* { dg-do compile } */
> -+/* { dg-options "-mcmse -mfloat-abi=3Dsoft -mfix-cmse-cve-2021-35465" }=
  */
> -+/* { dg-skip-if "Incompatible float ABI" { *-*-* } { "-mfloat-abi=3D*" =
} { "-mfloat-abi=3Dsoft" } } */
> -+
> -+#include "../../../cmse-8.x"
> -+
> -+/* Checks for saving and clearing prior to function call.  */
> -+/* Shift on the same register as blxns.  */
> -+/* { dg-final { scan-assembler "lsrs\t(r\[2-9\]|r10|fp|ip), \\1, #1.*bl=
xns\t\\1" } } */
> -+/* { dg-final { scan-assembler "lsls\t(r\[2-9\]|r10|fp|ip), \\1, #1.*bl=
xns\t\\1" } } */
> -+/* { dg-final { scan-assembler-not "mov\tr0, r4" } } */
> -+/* { dg-final { scan-assembler-not "mov\tr1, r4" } } */
> -+/* { dg-final { scan-assembler "push\t\{r4, r5, r6, r7, r8, r9, r10, fp=
\}" } } */
> -+/* { dg-final { scan-assembler "vlstm\tsp" } } */
> -+/* Check the right registers are cleared and none appears twice.  */
> -+/* { dg-final { scan-assembler "clrm\t\{(r2, )?(r3, )?(r4, )?(r5, )?(r6=
, )?(r7, )?(r8, )?(r9, )?(r10, )?(fp, )?(ip, )?APSR\}" } } */
> -+/* Check that the right number of registers is cleared and thus only one
> -+   register is missing.  */
> -+/* { dg-final { scan-assembler "clrm\t\{((r\[2-9\]|r10|fp|ip), ){10}APS=
R\}" } } */
> -+/* Check that no cleared register is used for blxns.  */
> -+/* { dg-final { scan-assembler-not "clrm\t\{\[^\}\]\+(r\[2-9\]|r10|fp|i=
p),\[^\}\]\+\}.*blxns\t\\1" } } */
> -+/* Check for v8.1-m variant of erratum work-around.  */
> -+/* { dg-final { scan-assembler "vscclrm\t\{vpr\}" } } */
> -+/* { dg-final { scan-assembler "vlldm\tsp" } } */
> -+/* { dg-final { scan-assembler "pop\t\{r4, r5, r6, r7, r8, r9, r10, fp\=
}" } } */
> -+/* { dg-final { scan-assembler-not "vmov" } } */
> -+/* { dg-final { scan-assembler-not "vmsr" } } */
> -+
> -+/* Now we check that we use the correct intrinsic to call.  */
> -+/* { dg-final { scan-assembler "blxns" } } */
> -diff --git a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse=
-13a.c b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-13a.c
> ---- a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-13a.c	=
1969-12-31 16:00:00.000000000 -0800
> -+++ b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-13a.c	=
2021-11-15 02:30:37.210637445 -0800
> -@@ -0,0 +1,30 @@
> -+/* { dg-do compile } */
> -+/* { dg-options "-mcmse -mfloat-abi=3Dsoftfp -mfpu=3Dfpv5-d16 -mfix-cms=
e-cve-2021-35465" }  */
> -+/* { dg-skip-if "Incompatible float ABI" { *-*-* } { "-mfloat-abi=3D*" =
} { "-mfloat-abi=3Dsoftfp" } } */
> -+/* { dg-skip-if "Skip these if testing single precision" {*-*-*} {"-mfp=
u=3D*-sp-*"} {""} } */
> -+
> -+#include "../../../cmse-13.x"
> -+
> -+/* Checks for saving and clearing prior to function call.  */
> -+/* Shift on the same register as blxns.  */
> -+/* { dg-final { scan-assembler "lsrs\t(r\[1,4-9\]|r10|fp|ip), \\1, #1.*=
blxns\t\\1" } } */
> -+/* { dg-final { scan-assembler "lsls\t(r\[1,4-9\]|r10|fp|ip), \\1, #1.*=
blxns\t\\1" } } */
> -+/* { dg-final { scan-assembler-not "mov\tr0, r4" } } */
> -+/* { dg-final { scan-assembler-not "mov\tr2, r4" } } */
> -+/* { dg-final { scan-assembler-not "mov\tr3, r4" } } */
> -+/* { dg-final { scan-assembler "push\t\{r4, r5, r6, r7, r8, r9, r10, fp=
\}" } } */
> -+/* { dg-final { scan-assembler "vlstm\tsp" } } */
> -+/* Check the right registers are cleared and none appears twice.  */
> -+/* { dg-final { scan-assembler "clrm\t\{(r1, )?(r4, )?(r5, )?(r6, )?(r7=
, )?(r8, )?(r9, )?(r10, )?(fp, )?(ip, )?APSR\}" } } */
> -+/* Check that the right number of registers is cleared and thus only one
> -+   register is missing.  */
> -+/* { dg-final { scan-assembler "clrm\t\{((r\[1,4-9\]|r10|fp|ip), ){9}AP=
SR\}" } } */
> -+/* Check that no cleared register is used for blxns.  */
> -+/* { dg-final { scan-assembler-not "clrm\t\{\[^\}\]\+(r\[1,4-9\]|r10|fp=
|ip),\[^\}\]\+\}.*blxns\t\\1" } } */
> -+/* Check for v8.1-m variant of erratum work-around.  */
> -+/* { dg-final { scan-assembler "vscclrm\t\{vpr\}" } } */
> -+/* { dg-final { scan-assembler "vlldm\tsp" } } */
> -+/* { dg-final { scan-assembler "pop\t\{r4, r5, r6, r7, r8, r9, r10, fp\=
}" } } */
> -+
> -+/* Now we check that we use the correct intrinsic to call.  */
> -+/* { dg-final { scan-assembler "blxns" } } */
> -diff --git a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse=
-7a.c b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-7a.c
> ---- a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-7a.c	1=
969-12-31 16:00:00.000000000 -0800
> -+++ b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-7a.c	2=
021-11-15 02:30:37.210637445 -0800
> -@@ -0,0 +1,27 @@
> -+/* { dg-do compile } */
> -+/* { dg-options "-mcmse -mfloat-abi=3Dsoftfp -mfpu=3Dfpv5-d16 -mfix-cms=
e-cve-2021-35465" }  */
> -+/* { dg-skip-if "Incompatible float ABI" { *-*-* } { "-mfloat-abi=3D*" =
} { "-mfloat-abi=3Dsoftfp" } } */
> -+/* { dg-skip-if "Skip these if testing single precision" {*-*-*} {"-mfp=
u=3D*-sp-*"} {""} } */
> -+
> -+#include "../../../cmse-7.x"
> -+
> -+/* Checks for saving and clearing prior to function call.  */
> -+/* Shift on the same register as blxns.  */
> -+/* { dg-final { scan-assembler "lsrs\t(r\[0-9\]|r10|fp|ip), \\1, #1.*bl=
xns\t\\1" } } */
> -+/* { dg-final { scan-assembler "lsls\t(r\[0-9\]|r10|fp|ip), \\1, #1.*bl=
xns\t\\1" } } */
> -+/* { dg-final { scan-assembler "push\t\{r4, r5, r6, r7, r8, r9, r10, fp=
\}" } } */
> -+/* { dg-final { scan-assembler "vlstm\tsp" } } */
> -+/* Check the right registers are cleared and none appears twice.  */
> -+/* { dg-final { scan-assembler "clrm\t\{(r0, )?(r1, )?(r2, )?(r3, )?(r4=
, )?(r5, )?(r6, )?(r7, )?(r8, )?(r9, )?(r10, )?(fp, )?(ip, )?APSR\}" } } */
> -+/* Check that the right number of registers is cleared and thus only one
> -+   register is missing.  */
> -+/* { dg-final { scan-assembler "clrm\t\{((r\[0-9\]|r10|fp|ip), ){12}APS=
R\}" } } */
> -+/* Check that no cleared register is used for blxns.  */
> -+/* { dg-final { scan-assembler-not "clrm\t\{\[^\}\]\+(r\[0-9\]|r10|fp|i=
p),\[^\}\]\+\}.*blxns\t\\1" } } */
> -+/* Check for v8.1-m variant of erratum work-around.  */
> -+/* { dg-final { scan-assembler "vscclrm\t\{vpr\}" } } */
> -+/* { dg-final { scan-assembler "vlldm\tsp" } } */
> -+/* { dg-final { scan-assembler "pop\t\{r4, r5, r6, r7, r8, r9, r10, fp\=
}" } } */
> -+
> -+/* Now we check that we use the correct intrinsic to call.  */
> -+/* { dg-final { scan-assembler "blxns" } } */
> -diff --git a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse=
-8a.c b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-8a.c
> ---- a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-8a.c	1=
969-12-31 16:00:00.000000000 -0800
> -+++ b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-8a.c	2=
021-11-15 02:30:37.210637445 -0800
> -@@ -0,0 +1,29 @@
> -+/* { dg-do compile } */
> -+/* { dg-options "-mcmse -mfloat-abi=3Dsoftfp -mfpu=3Dfpv5-d16 -mfix-cms=
e-cve-2021-35465" }  */
> -+/* { dg-skip-if "Incompatible float ABI" { *-*-* } { "-mfloat-abi=3D*" =
} { "-mfloat-abi=3Dsoftfp" } } */
> -+/* { dg-skip-if "Skip these if testing single precision" {*-*-*} {"-mfp=
u=3D*-sp-*"} {""} } */
> -+
> -+#include "../../../cmse-8.x"
> -+
> -+/* Checks for saving and clearing prior to function call.  */
> -+/* Shift on the same register as blxns.  */
> -+/* { dg-final { scan-assembler "lsrs\t(r\[2-9\]|r10|fp|ip), \\1, #1.*bl=
xns\t\\1" } } */
> -+/* { dg-final { scan-assembler "lsls\t(r\[2-9\]|r10|fp|ip), \\1, #1.*bl=
xns\t\\1" } } */
> -+/* { dg-final { scan-assembler-not "mov\tr0, r4" } } */
> -+/* { dg-final { scan-assembler-not "mov\tr1, r4" } } */
> -+/* { dg-final { scan-assembler "push\t\{r4, r5, r6, r7, r8, r9, r10, fp=
\}" } } */
> -+/* { dg-final { scan-assembler "vlstm\tsp" } } */
> -+/* Check the right registers are cleared and none appears twice.  */
> -+/* { dg-final { scan-assembler "clrm\t\{(r2, )?(r3, )?(r4, )?(r5, )?(r6=
, )?(r7, )?(r8, )?(r9, )?(r10, )?(fp, )?(ip, )?APSR\}" } } */
> -+/* Check that the right number of registers is cleared and thus only one
> -+   register is missing.  */
> -+/* { dg-final { scan-assembler "clrm\t\{((r\[2-9\]|r10|fp|ip), ){10}APS=
R\}" } } */
> -+/* Check that no cleared register is used for blxns.  */
> -+/* { dg-final { scan-assembler-not "clrm\t\{\[^\}\]\+(r\[2-9\]|r10|fp|i=
p),\[^\}\]\+\}.*blxns\t\\1" } } */
> -+/* Check for v8.1-m variant of erratum work-around.  */
> -+/* { dg-final { scan-assembler "vscclrm\t\{vpr\}" } } */
> -+/* { dg-final { scan-assembler "vlldm\tsp" } } */
> -+/* { dg-final { scan-assembler "pop\t\{r4, r5, r6, r7, r8, r9, r10, fp\=
}" } } */
> -+
> -+/* Now we check that we use the correct intrinsic to call.  */
> -+/* { dg-final { scan-assembler "blxns" } } */
> -diff --git a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/c=
mse-7a.c b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-7=
a.c
> ---- a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-7a.=
c	1969-12-31 16:00:00.000000000 -0800
> -+++ b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-7a.=
c	2021-11-15 02:30:37.210637445 -0800
> -@@ -0,0 +1,27 @@
> -+/* { dg-do compile } */
> -+/* { dg-options "-mcmse -mfloat-abi=3Dsoftfp -mfpu=3Dfpv5-sp-d16 -mfix-=
cmse-cve-2021-35465" }  */
> -+/* { dg-skip-if "Incompatible float ABI" { *-*-* } { "-mfloat-abi=3D*" =
} { "-mfloat-abi=3Dsoftfp" } } */
> -+/* { dg-skip-if "Skip these if testing double precision" {*-*-*} {"-mfp=
u=3Dfpv[4-5]-d16"} {""} } */
> -+
> -+#include "../../../cmse-7.x"
> -+
> -+/* Checks for saving and clearing prior to function call.  */
> -+/* Shift on the same register as blxns.  */
> -+/* { dg-final { scan-assembler "lsrs\t(r\[0-9\]|r10|fp|ip), \\1, #1.*bl=
xns\t\\1" } } */
> -+/* { dg-final { scan-assembler "lsls\t(r\[0-9\]|r10|fp|ip), \\1, #1.*bl=
xns\t\\1" } } */
> -+/* { dg-final { scan-assembler "push\t\{r4, r5, r6, r7, r8, r9, r10, fp=
\}" } } */
> -+/* { dg-final { scan-assembler "vlstm\tsp" } } */
> -+/* Check the right registers are cleared and none appears twice.  */
> -+/* { dg-final { scan-assembler "clrm\t\{(r0, )?(r1, )?(r2, )?(r3, )?(r4=
, )?(r5, )?(r6, )?(r7, )?(r8, )?(r9, )?(r10, )?(fp, )?(ip, )?APSR\}" } } */
> -+/* Check that the right number of registers is cleared and thus only one
> -+   register is missing.  */
> -+/* { dg-final { scan-assembler "clrm\t\{((r\[0-9\]|r10|fp|ip), ){12}APS=
R\}" } } */
> -+/* Check that no cleared register is used for blxns.  */
> -+/* { dg-final { scan-assembler-not "clrm\t\{\[^\}\]\+(r\[0-9\]|r10|fp|i=
p),\[^\}\]\+\}.*blxns\t\\1" } } */
> -+/* Check for v8.1-m variant of erratum work-around.  */
> -+/* { dg-final { scan-assembler "vscclrm\t\{vpr\}" } } */
> -+/* { dg-final { scan-assembler "vlldm\tsp" } } */
> -+/* { dg-final { scan-assembler "pop\t\{r4, r5, r6, r7, r8, r9, r10, fp\=
}" } } */
> -+
> -+/* Now we check that we use the correct intrinsic to call.  */
> -+/* { dg-final { scan-assembler "blxns" } } */
> -diff --git a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/c=
mse-8a.c b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-8=
a.c
> ---- a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-8a.=
c	1969-12-31 16:00:00.000000000 -0800
> -+++ b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-8a.=
c	2021-11-15 02:30:37.210637445 -0800
> -@@ -0,0 +1,29 @@
> -+/* { dg-do compile } */
> -+/* { dg-options "-mcmse -mfloat-abi=3Dsoftfp -mfpu=3Dfpv5-sp-d16 -mfix-=
cmse-cve-2021-35465" }  */
> -+/* { dg-skip-if "Incompatible float ABI" { *-*-* } { "-mfloat-abi=3D*" =
} { "-mfloat-abi=3Dsoftfp" } } */
> -+/* { dg-skip-if "Skip these if testing double precision" {*-*-*} {"-mfp=
u=3Dfpv[4-5]-d16"} {""} } */
> -+
> -+#include "../../../cmse-8.x"
> -+
> -+/* Checks for saving and clearing prior to function call.  */
> -+/* Shift on the same register as blxns.  */
> -+/* { dg-final { scan-assembler "lsrs\t(r\[2-9\]|r10|fp|ip), \\1, #1.*bl=
xns\t\\1" } } */
> -+/* { dg-final { scan-assembler "lsls\t(r\[2-9\]|r10|fp|ip), \\1, #1.*bl=
xns\t\\1" } } */
> -+/* { dg-final { scan-assembler-not "mov\tr0, r4" } } */
> -+/* { dg-final { scan-assembler-not "mov\tr1, r4" } } */
> -+/* { dg-final { scan-assembler "push\t\{r4, r5, r6, r7, r8, r9, r10, fp=
\}" } } */
> -+/* { dg-final { scan-assembler "vlstm\tsp" } } */
> -+/* Check the right registers are cleared and none appears twice.  */
> -+/* { dg-final { scan-assembler "clrm\t\{(r2, )?(r3, )?(r4, )?(r5, )?(r6=
, )?(r7, )?(r8, )?(r9, )?(r10, )?(fp, )?(ip, )?APSR\}" } } */
> -+/* Check that the right number of registers is cleared and thus only one
> -+   register is missing.  */
> -+/* { dg-final { scan-assembler "clrm\t\{((r\[2-9\]|r10|fp|ip), ){10}APS=
R\}" } } */
> -+/* Check that no cleared register is used for blxns.  */
> -+/* { dg-final { scan-assembler-not "clrm\t\{\[^\}\]\+(r\[2-9\]|r10|fp|i=
p),\[^\}\]\+\}.*blxns\t\\1" } } */
> -+/* Check for v8.1-m variant of erratum work-around.  */
> -+/* { dg-final { scan-assembler "vscclrm\t\{vpr\}" } } */
> -+/* { dg-final { scan-assembler "vlldm\tsp" } } */
> -+/* { dg-final { scan-assembler "pop\t\{r4, r5, r6, r7, r8, r9, r10, fp\=
}" } } */
> -+
> -+/* Now we check that we use the correct intrinsic to call.  */
> -+/* { dg-final { scan-assembler "blxns" } } */
> diff --git a/meta/recipes-devtools/gcc/gcc/0004-CVE-2021-42574.patch b/me=
ta/recipes-devtools/gcc/gcc/0004-CVE-2021-42574.patch
> deleted file mode 100644
> index 4999c71b64..0000000000
> --- a/meta/recipes-devtools/gcc/gcc/0004-CVE-2021-42574.patch
> +++ /dev/null
> @@ -1,573 +0,0 @@
> -From bef32d4a28595e933f24fef378cf052a30b674a7 Mon Sep 17 00:00:00 2001
> -From: David Malcolm <dmalcolm@redhat.com>
> -Date: Tue, 2 Nov 2021 15:45:22 -0400
> -Subject: [PATCH] libcpp: capture and underline ranges in -Wbidi-chars=3D
> - [PR103026]
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3Dutf8
> -Content-Transfer-Encoding: 8bit
> -
> -This patch converts the bidi::vec to use a struct so that we can
> -capture location_t values for the bidirectional control characters.
> -
> -Before:
> -
> -  Wbidi-chars-1.c: In function =E2main=E2:
> -  Wbidi-chars-1.c:6:43: warning: unpaired UTF-8 bidirectional control ch=
aracter detected [-Wbidi-chars=3D]
> -      6 |     /*<U+202E> } <U+2066>if (isAdmin)<U+2069> <U+2066> begin a=
dmins only */
> -        |                                                               =
            ^
> -  Wbidi-chars-1.c:9:28: warning: unpaired UTF-8 bidirectional control ch=
aracter detected [-Wbidi-chars=3D]
> -      9 |     /* end admins only <U+202E> { <U+2066>*/
> -        |                                            ^
> -
> -After:
> -
> -  Wbidi-chars-1.c: In function =E2main=E2:
> -  Wbidi-chars-1.c:6:43: warning: unpaired UTF-8 bidirectional control ch=
aracters detected [-Wbidi-chars=3D]
> -      6 |     /*<U+202E> } <U+2066>if (isAdmin)<U+2069> <U+2066> begin a=
dmins only */
> -        |       ~~~~~~~~                                ~~~~~~~~        =
            ^
> -        |       |                                       |               =
            |
> -        |       |                                       |               =
            end of bidirectional context
> -        |       U+202E (RIGHT-TO-LEFT OVERRIDE)         U+2066 (LEFT-TO-=
RIGHT ISOLATE)
> -  Wbidi-chars-1.c:9:28: warning: unpaired UTF-8 bidirectional control ch=
aracters detected [-Wbidi-chars=3D]
> -      9 |     /* end admins only <U+202E> { <U+2066>*/
> -        |                        ~~~~~~~~   ~~~~~~~~ ^
> -        |                        |          |        |
> -        |                        |          |        end of bidirectiona=
l context
> -        |                        |          U+2066 (LEFT-TO-RIGHT ISOLAT=
E)
> -        |                        U+202E (RIGHT-TO-LEFT OVERRIDE)
> -
> -Signed-off-by: David Malcolm <dmalcolm@redhat.com>
> -
> -gcc/testsuite/ChangeLog:
> -	PR preprocessor/103026
> -	* c-c++-common/Wbidi-chars-ranges.c: New test.
> -
> -libcpp/ChangeLog:
> -	PR preprocessor/103026
> -	* lex.c (struct bidi::context): New.
> -	(bidi::vec): Convert to a vec of context rather than unsigned
> -	char.
> -	(bidi::ctx_at): Rename to...
> -	(bidi::pop_kind_at): ...this and reimplement for above change.
> -	(bidi::current_ctx): Update for change to vec.
> -	(bidi::current_ctx_ucn_p): Likewise.
> -	(bidi::current_ctx_loc): New.
> -	(bidi::on_char): Update for usage of context struct.  Add "loc"
> -	param and pass it when pushing contexts.
> -	(get_location_for_byte_range_in_cur_line): New.
> -	(get_bidi_utf8): Rename to...
> -	(get_bidi_utf8_1): ...this, reintroducing...
> -	(get_bidi_utf8): ...as a wrapper, setting *OUT when the result is
> -	not NONE.
> -	(get_bidi_ucn): Rename to...
> -	(get_bidi_ucn_1): ...this, reintroducing...
> -	(get_bidi_ucn): ...as a wrapper, setting *OUT when the result is
> -	not NONE.
> -	(class unpaired_bidi_rich_location): New.
> -	(maybe_warn_bidi_on_close): Use unpaired_bidi_rich_location when
> -	reporting on unpaired bidi chars.  Split into singular vs plural
> -	spellings.
> -	(maybe_warn_bidi_on_char): Pass in a location_t rather than a
> -	const uchar * and use it when emitting warnings, and when calling
> -	bidi::on_char.
> -	(_cpp_skip_block_comment): Capture location when kind is not NONE
> -	and pass it to maybe_warn_bidi_on_char.
> -	(skip_line_comment): Likewise.
> -	(forms_identifier_p): Likewise.
> -	(lex_raw_string): Likewise.
> -	(lex_string): Likewise.
> -
> -Signed-off-by: David Malcolm <dmalcolm@redhat.com>
> -
> -CVE: CVE-2021-42574
> -Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=3Dgcc.gi=
t;h=3Dbef32d4a28595e933f24fef378cf052a30b674a7]
> -Signed-off-by: Pgowda <pgowda.cve@gmail.com>
> -
> ----
> - .../c-c++-common/Wbidi-chars-ranges.c         |  54 ++++
> - libcpp/lex.c                                  | 251 ++++++++++++++----
> - 2 files changed, 257 insertions(+), 48 deletions(-)
> - create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-ranges.c
> -
> -diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-ranges.c b/gcc/tests=
uite/c-c++-common/Wbidi-chars-ranges.c
> -new file mode 100644
> -index 00000000000..298750a2a64
> ---- /dev/null
> -+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-ranges.c
> -@@ -0,0 +1,54 @@
> -+/* PR preprocessor/103026 */
> -+/* { dg-do compile } */
> -+/* { dg-options "-Wbidi-chars=3Dunpaired -fdiagnostics-show-caret" } */
> -+/* Verify that we escape and underline pertinent bidirectional
> -+   control characters when quoting the source.  */
> -+
> -+int test_unpaired_bidi () {
> -+    int isAdmin =3D 0;
> -+    /*=E2=AE } =E2=A6if (isAdmin)=E2=A9 =E2=A6 begin admins only */
> -+/* { dg-warning "bidirectional" "" { target *-*-* } .-1 } */
> -+#if 0
> -+   { dg-begin-multiline-output "" }
> -+     /*<U+202E> } <U+2066>if (isAdmin)<U+2069> <U+2066> begin admins on=
ly */
> -+       ~~~~~~~~                                ~~~~~~~~                =
    ^
> -+       |                                       |                       =
    |
> -+       |                                       |                       =
    end of bidirectional context
> -+       U+202E (RIGHT-TO-LEFT OVERRIDE)         U+2066 (LEFT-TO-RIGHT IS=
OLATE)
> -+   { dg-end-multiline-output "" }
> -+#endif
> -+
> -+        __builtin_printf("You are an admin.\n");
> -+    /* end admins only =E2=AE { =E2=A6*/
> -+/* { dg-warning "bidirectional" "" { target *-*-* } .-1 } */
> -+#if 0
> -+   { dg-begin-multiline-output "" }
> -+     /* end admins only <U+202E> { <U+2066>*/
> -+                        ~~~~~~~~   ~~~~~~~~ ^
> -+                        |          |        |
> -+                        |          |        end of bidirectional context
> -+                        |          U+2066 (LEFT-TO-RIGHT ISOLATE)
> -+                        U+202E (RIGHT-TO-LEFT OVERRIDE)
> -+   { dg-end-multiline-output "" }
> -+#endif
> -+
> -+    return 0;
> -+}
> -+
> -+int LRE_=E2=AA_PDF_\u202c;
> -+/* { dg-warning "mismatch" "" { target *-*-* } .-1 } */
> -+#if 0
> -+   { dg-begin-multiline-output "" }
> -+ int LRE_<U+202A>_PDF_\u202c;
> -+         ~~~~~~~~     ^~~~~~
> -+   { dg-end-multiline-output "" }
> -+#endif
> -+
> -+const char *s1 =3D "LRE_=E2=AA_PDF_\u202c";
> -+/* { dg-warning "mismatch" "" { target *-*-* } .-1 } */
> -+#if 0
> -+   { dg-begin-multiline-output "" }
> -+ const char *s1 =3D "LRE_<U+202A>_PDF_\u202c";
> -+                       ~~~~~~~~     ^~~~~~
> -+   { dg-end-multiline-output "" }
> -+#endif
> -diff --git a/libcpp/lex.c b/libcpp/lex.c
> -index 2421d6c0f40..94c36f0d014 100644
> ---- a/libcpp/lex.c
> -+++ b/libcpp/lex.c
> -@@ -1172,11 +1172,34 @@ namespace bidi {
> -   /* All the UTF-8 encodings of bidi characters start with E2.  */
> -   constexpr uchar utf8_start =3D 0xe2;
> -=20
> -+  struct context
> -+  {
> -+    context () {}
> -+    context (location_t loc, kind k, bool pdf, bool ucn)
> -+    : m_loc (loc), m_kind (k), m_pdf (pdf), m_ucn (ucn)
> -+    {
> -+    }
> -+
> -+    kind get_pop_kind () const
> -+    {
> -+      return m_pdf ? kind::PDF : kind::PDI;
> -+    }
> -+    bool ucn_p () const
> -+    {
> -+      return m_ucn;
> -+    }
> -+
> -+    location_t m_loc;
> -+    kind m_kind;
> -+    unsigned m_pdf : 1;
> -+    unsigned m_ucn : 1;
> -+  };
> -+
> -   /* A vector holding currently open bidi contexts.  We use a char for
> -      each context, its LSB is 1 if it represents a PDF context, 0 if it
> -      represents a PDI context.  The next bit is 1 if this context was o=
pen
> -      by a bidi character written as a UCN, and 0 when it was UTF-8.  */
> --  semi_embedded_vec <unsigned char, 16> vec;
> -+  semi_embedded_vec <context, 16> vec;
> -=20
> -   /* Close the whole comment/identifier/string literal/character consta=
nt
> -      context.  */
> -@@ -1193,19 +1216,19 @@ namespace bidi {
> -     vec.truncate (len - 1);
> -   }
> -=20
> --  /* Return the context of the Ith element.  */
> --  kind ctx_at (unsigned int i)
> -+  /* Return the pop kind of the context of the Ith element.  */
> -+  kind pop_kind_at (unsigned int i)
> -   {
> --    return (vec[i] & 1) ? kind::PDF : kind::PDI;
> -+    return vec[i].get_pop_kind ();
> -   }
> -=20
> --  /* Return which context is currently opened.  */
> -+  /* Return the pop kind of the context that is currently opened.  */
> -   kind current_ctx ()
> -   {
> -     unsigned int len =3D vec.count ();
> -     if (len =3D=3D 0)
> -       return kind::NONE;
> --    return ctx_at (len - 1);
> -+    return vec[len - 1].get_pop_kind ();
> -   }
> -=20
> -   /* Return true if the current context comes from a UCN origin, that i=
s,
> -@@ -1214,11 +1237,19 @@ namespace bidi {
> -   {
> -     unsigned int len =3D vec.count ();
> -     gcc_checking_assert (len > 0);
> --    return (vec[len - 1] >> 1) & 1;
> -+    return vec[len - 1].m_ucn;
> -   }
> -=20
> --  /* We've read a bidi char, update the current vector as necessary.  */
> --  void on_char (kind k, bool ucn_p)
> -+  location_t current_ctx_loc ()
> -+  {
> -+    unsigned int len =3D vec.count ();
> -+    gcc_checking_assert (len > 0);
> -+    return vec[len - 1].m_loc;
> -+  }
> -+
> -+  /* We've read a bidi char, update the current vector as necessary.
> -+     LOC is only valid when K is not kind::NONE.  */
> -+  void on_char (kind k, bool ucn_p, location_t loc)
> -   {
> -     switch (k)
> -       {
> -@@ -1226,12 +1257,12 @@ namespace bidi {
> -       case kind::RLE:
> -       case kind::LRO:
> -       case kind::RLO:
> --	vec.push (ucn_p ? 3u : 1u);
> -+	vec.push (context (loc, k, true, ucn_p));
> - 	break;
> -       case kind::LRI:
> -       case kind::RLI:
> -       case kind::FSI:
> --	vec.push (ucn_p ? 2u : 0u);
> -+	vec.push (context (loc, k, false, ucn_p));
> - 	break;
> -       /* PDF terminates the scope of the last LRE, RLE, LRO, or RLO
> - 	 whose scope has not yet been terminated.  */
> -@@ -1245,7 +1276,7 @@ namespace bidi {
> - 	 yet been terminated.  */
> -       case kind::PDI:
> - 	for (int i =3D vec.count () - 1; i >=3D 0; --i)
> --	  if (ctx_at (i) =3D=3D kind::PDI)
> -+	  if (pop_kind_at (i) =3D=3D kind::PDI)
> - 	    {
> - 	      vec.truncate (i);
> - 	      break;
> -@@ -1295,10 +1326,47 @@ namespace bidi {
> -   }
> - }
> -=20
> -+/* Get location_t for the range of bytes [START, START + NUM_BYTES)
> -+   within the current line in FILE, with the caret at START.  */
> -+
> -+static location_t
> -+get_location_for_byte_range_in_cur_line (cpp_reader *pfile,
> -+					 const unsigned char *const start,
> -+					 size_t num_bytes)
> -+{
> -+  gcc_checking_assert (num_bytes > 0);
> -+
> -+  /* CPP_BUF_COLUMN and linemap_position_for_column both refer
> -+     to offsets in bytes, but CPP_BUF_COLUMN is 0-based,
> -+     whereas linemap_position_for_column is 1-based.  */
> -+
> -+  /* Get 0-based offsets within the line.  */
> -+  size_t start_offset =3D CPP_BUF_COLUMN (pfile->buffer, start);
> -+  size_t end_offset =3D start_offset + num_bytes - 1;
> -+
> -+  /* Now convert to location_t, where "columns" are 1-based byte offset=
s.  */
> -+  location_t start_loc =3D linemap_position_for_column (pfile->line_tab=
le,
> -+						      start_offset + 1);
> -+  location_t end_loc =3D linemap_position_for_column (pfile->line_table,
> -+						     end_offset + 1);
> -+
> -+  if (start_loc =3D=3D end_loc)
> -+    return start_loc;
> -+
> -+  source_range src_range;
> -+  src_range.m_start =3D start_loc;
> -+  src_range.m_finish =3D end_loc;
> -+  location_t combined_loc =3D COMBINE_LOCATION_DATA (pfile->line_table,
> -+						   start_loc,
> -+						   src_range,
> -+						   NULL);
> -+  return combined_loc;
> -+}
> -+
> - /* Parse a sequence of 3 bytes starting with P and return its bidi code=
.  */
> -=20
> - static bidi::kind
> --get_bidi_utf8 (const unsigned char *const p)
> -+get_bidi_utf8_1 (const unsigned char *const p)
> - {
> -   gcc_checking_assert (p[0] =3D=3D bidi::utf8_start);
> -=20
> -@@ -1340,10 +1408,25 @@ get_bidi_utf8 (const unsigned char *cons
> -   return bidi::kind::NONE;
> - }
> -=20
> -+/* Parse a sequence of 3 bytes starting with P and return its bidi code.
> -+   If the kind is not NONE, write the location to *OUT.*/
> -+
> -+static bidi::kind
> -+get_bidi_utf8 (cpp_reader *pfile, const unsigned char *const p, locatio=
n_t *out)
> -+{
> -+  bidi::kind result =3D get_bidi_utf8_1 (p);
> -+  if (result !=3D bidi::kind::NONE)
> -+    {
> -+      /* We have a sequence of 3 bytes starting at P.  */
> -+      *out =3D get_location_for_byte_range_in_cur_line (pfile, p, 3);
> -+    }
> -+  return result;
> -+}
> -+
> - /* Parse a UCN where P points just past \u or \U and return its bidi co=
de.  */
> -=20
> - static bidi::kind
> --get_bidi_ucn (const unsigned char *p, bool is_U)
> -+get_bidi_ucn_1 (const unsigned char *p, bool is_U)
> - {
> -   /* 6.4.3 Universal Character Names
> -       \u hex-quad
> -@@ -1412,6 +1495,62 @@ get_bidi_ucn (const unsigned char *p, bo
> -   return bidi::kind::NONE;
> - }
> -=20
> -+/* Parse a UCN where P points just past \u or \U and return its bidi co=
de.
> -+   If the kind is not NONE, write the location to *OUT.*/
> -+
> -+static bidi::kind
> -+get_bidi_ucn (cpp_reader *pfile,  const unsigned char *p, bool is_U,
> -+	      location_t *out)
> -+{
> -+  bidi::kind result =3D get_bidi_ucn_1 (p, is_U);
> -+  if (result !=3D bidi::kind::NONE)
> -+    {
> -+      const unsigned char *start =3D p - 2;
> -+      size_t num_bytes =3D 2 + (is_U ? 8 : 4);
> -+      *out =3D get_location_for_byte_range_in_cur_line (pfile, start, n=
um_bytes);
> -+    }
> -+  return result;
> -+}
> -+
> -+/* Subclass of rich_location for reporting on unpaired UTF-8
> -+   bidirectional control character(s).
> -+   Escape the source lines on output, and show all unclosed
> -+   bidi context, labelling everything.  */
> -+
> -+class unpaired_bidi_rich_location : public rich_location
> -+{
> -+ public:
> -+  class custom_range_label : public range_label
> -+  {
> -+   public:
> -+     label_text get_text (unsigned range_idx) const FINAL OVERRIDE
> -+     {
> -+       /* range 0 is the primary location; each subsequent range i + 1
> -+	  is for bidi::vec[i].  */
> -+       if (range_idx > 0)
> -+	 {
> -+	   const bidi::context &ctxt (bidi::vec[range_idx - 1]);
> -+	   return label_text::borrow (bidi::to_str (ctxt.m_kind));
> -+	 }
> -+       else
> -+	 return label_text::borrow (_("end of bidirectional context"));
> -+     }
> -+  };
> -+
> -+  unpaired_bidi_rich_location (cpp_reader *pfile, location_t loc)
> -+  : rich_location (pfile->line_table, loc, &m_custom_label)
> -+  {
> -+    set_escape_on_output (true);
> -+    for (unsigned i =3D 0; i < bidi::vec.count (); i++)
> -+      add_range (bidi::vec[i].m_loc,
> -+		 SHOW_RANGE_WITHOUT_CARET,
> -+		 &m_custom_label);
> -+  }
> -+
> -+ private:
> -+   custom_range_label m_custom_label;
> -+};
> -+
> - /* We're closing a bidi context, that is, we've encountered a newline,
> -    are closing a C-style comment, or are at the end of a string literal,
> -    character constant, or identifier.  Warn if this context was not
> -@@ -1427,11 +1566,17 @@ maybe_warn_bidi_on_close (cpp_reader *pf
> -       const location_t loc
> - 	=3D linemap_position_for_column (pfile->line_table,
> - 				       CPP_BUF_COLUMN (pfile->buffer, p));
> --      rich_location rich_loc (pfile->line_table, loc);
> --      rich_loc.set_escape_on_output (true);
> --      cpp_warning_at (pfile, CPP_W_BIDIRECTIONAL, &rich_loc,
> --		      "unpaired UTF-8 bidirectional control character "
> --		      "detected");
> -+      unpaired_bidi_rich_location rich_loc (pfile, loc);
> -+      /* cpp_callbacks doesn't yet have a way to handle singular vs plu=
ral
> -+	 forms of a diagnostic, so fake it for now.  */
> -+      if (bidi::vec.count () > 1)
> -+	cpp_warning_at (pfile, CPP_W_BIDIRECTIONAL, &rich_loc,
> -+			"unpaired UTF-8 bidirectional control characters "
> -+			"detected");
> -+      else
> -+	cpp_warning_at (pfile, CPP_W_BIDIRECTIONAL, &rich_loc,
> -+			"unpaired UTF-8 bidirectional control character "
> -+			"detected");
> -     }
> -   /* We're done with this context.  */
> -   bidi::on_close ();
> -@@ -1439,12 +1584,13 @@ maybe_warn_bidi_on_close (cpp_reader *pf
> -=20
> - /* We're at the beginning or in the middle of an identifier/comment/str=
ing
> -    literal/character constant.  Warn if we've encountered a bidi charac=
ter.
> --   KIND says which bidi character it was; P points to it in the charact=
er
> --   stream.  UCN_P is true iff this bidi character was written as a UCN.=
  */
> -+   KIND says which bidi control character it was; UCN_P is true iff thi=
s bidi
> -+   control character was written as a UCN.  LOC is the location of the
> -+   character, but is only valid if KIND !=3D bidi::kind::NONE.  */
> -=20
> - static void
> --maybe_warn_bidi_on_char (cpp_reader *pfile, const uchar *p, bidi::kind =
kind,
> --			 bool ucn_p)
> -+maybe_warn_bidi_on_char (cpp_reader *pfile, bidi::kind kind,
> -+			 bool ucn_p, location_t loc)
> - {
> -   if (__builtin_expect (kind =3D=3D bidi::kind::NONE, 1))
> -     return;
> -@@ -1453,9 +1599,6 @@ maybe_warn_bidi_on_char (cpp_reader *pfi
> -=20
> -   if (warn_bidi !=3D bidirectional_none)
> -     {
> --      const location_t loc
> --	=3D linemap_position_for_column (pfile->line_table,
> --				       CPP_BUF_COLUMN (pfile->buffer, p));
> -       rich_location rich_loc (pfile->line_table, loc);
> -       rich_loc.set_escape_on_output (true);
> -=20
> -@@ -1467,9 +1610,12 @@ maybe_warn_bidi_on_char (cpp_reader *pfi
> - 	{
> - 	  if (warn_bidi =3D=3D bidirectional_unpaired
> - 	      && bidi::current_ctx_ucn_p () !=3D ucn_p)
> --	    cpp_warning_at (pfile, CPP_W_BIDIRECTIONAL, &rich_loc,
> --			    "UTF-8 vs UCN mismatch when closing "
> --			    "a context by \"%s\"", bidi::to_str (kind));
> -+	    {
> -+	      rich_loc.add_range (bidi::current_ctx_loc ());
> -+	      cpp_warning_at (pfile, CPP_W_BIDIRECTIONAL, &rich_loc,
> -+			      "UTF-8 vs UCN mismatch when closing "
> -+			      "a context by \"%s\"", bidi::to_str (kind));
> -+	    }
> - 	}
> -       else if (warn_bidi =3D=3D bidirectional_any)
> - 	{
> -@@ -1484,7 +1630,7 @@ maybe_warn_bidi_on_char (cpp_reader *pfi
> - 	}
> -     }
> -   /* We're done with this context.  */
> --  bidi::on_char (kind, ucn_p);
> -+  bidi::on_char (kind, ucn_p, loc);
> - }
> -=20
> - /* Skip a C-style block comment.  We find the end of the comment by
> -@@ -1552,8 +1698,9 @@ _cpp_skip_block_comment (cpp_reader *pfi
> - 	 a bidirectional control character.  */
> -       else if (__builtin_expect (c =3D=3D bidi::utf8_start, 0) && warn_=
bidi_p)
> - 	{
> --	  bidi::kind kind =3D get_bidi_utf8 (cur - 1);
> --	  maybe_warn_bidi_on_char (pfile, cur, kind, /*ucn_p=3D*/false);
> -+	  location_t loc;
> -+	  bidi::kind kind =3D get_bidi_utf8 (pfile, cur - 1, &loc);
> -+	  maybe_warn_bidi_on_char (pfile, kind, /*ucn_p=3D*/false, loc);
> - 	}
> -     }
> -=20
> -@@ -1586,9 +1733,9 @@ skip_line_comment (cpp_reader *pfile)
> - 	    {
> - 	      if (__builtin_expect (*buffer->cur =3D=3D bidi::utf8_start, 0))
> - 		{
> --		  bidi::kind kind =3D get_bidi_utf8 (buffer->cur);
> --		  maybe_warn_bidi_on_char (pfile, buffer->cur, kind,
> --					   /*ucn_p=3D*/false);
> -+		  location_t loc;
> -+		  bidi::kind kind =3D get_bidi_utf8 (pfile, buffer->cur, &loc);
> -+		  maybe_warn_bidi_on_char (pfile, kind, /*ucn_p=3D*/false, loc);
> - 		}
> - 	      buffer->cur++;
> - 	    }
> -@@ -1708,9 +1855,9 @@ forms_identifier_p (cpp_reader *pfile, i
> - 	  if (__builtin_expect (*buffer->cur =3D=3D bidi::utf8_start, 0)
> - 	      && warn_bidi_p)
> - 	    {
> --	      bidi::kind kind =3D get_bidi_utf8 (buffer->cur);
> --	      maybe_warn_bidi_on_char (pfile, buffer->cur, kind,
> --				       /*ucn_p=3D*/false);
> -+	      location_t loc;
> -+	      bidi::kind kind =3D get_bidi_utf8 (pfile, buffer->cur, &loc);
> -+	      maybe_warn_bidi_on_char (pfile, kind, /*ucn_p=3D*/false, loc);
> - 	    }
> - 	  if (_cpp_valid_utf8 (pfile, &buffer->cur, buffer->rlimit, 1 + !first,
> - 			       state, &s))
> -@@ -1722,10 +1869,12 @@ forms_identifier_p (cpp_reader *pfile, i
> - 	  buffer->cur +=3D 2;
> - 	  if (warn_bidi_p)
> - 	    {
> --	      bidi::kind kind =3D get_bidi_ucn (buffer->cur,
> --					      buffer->cur[-1] =3D=3D 'U');
> --	      maybe_warn_bidi_on_char (pfile, buffer->cur, kind,
> --				       /*ucn_p=3D*/true);
> -+	      location_t loc;
> -+	      bidi::kind kind =3D get_bidi_ucn (pfile,
> -+					      buffer->cur,
> -+					      buffer->cur[-1] =3D=3D 'U',
> -+					      &loc);
> -+	      maybe_warn_bidi_on_char (pfile, kind, /*ucn_p=3D*/true, loc);
> - 	    }
> - 	  if (_cpp_valid_ucn (pfile, &buffer->cur, buffer->rlimit, 1 + !first,
> - 			      state, &s, NULL, NULL))
> -@@ -2336,8 +2485,11 @@ lex_raw_string (cpp_reader *pfile, cpp_t
> - 	}
> -       else if (__builtin_expect ((unsigned char) c =3D=3D bidi::utf8_st=
art, 0)
> - 	       && warn_bidi_p)
> --	maybe_warn_bidi_on_char (pfile, pos - 1, get_bidi_utf8 (pos - 1),
> --				 /*ucn_p=3D*/false);
> -+	{
> -+	  location_t loc;
> -+	  bidi::kind kind =3D get_bidi_utf8 (pfile, pos - 1, &loc);
> -+	  maybe_warn_bidi_on_char (pfile, kind, /*ucn_p=3D*/false, loc);
> -+	}
> -     }
> -=20
> -   if (warn_bidi_p)
> -@@ -2447,8 +2599,10 @@ lex_string (cpp_reader *pfile, cpp_token
> - 	{
> - 	  if ((cur[0] =3D=3D 'u' || cur[0] =3D=3D 'U') && warn_bidi_p)
> - 	    {
> --	      bidi::kind kind =3D get_bidi_ucn (cur + 1, cur[0] =3D=3D 'U');
> --	      maybe_warn_bidi_on_char (pfile, cur, kind, /*ucn_p=3D*/true);
> -+	      location_t loc;
> -+	      bidi::kind kind =3D get_bidi_ucn (pfile, cur + 1, cur[0] =3D=3D =
'U',
> -+					      &loc);
> -+	      maybe_warn_bidi_on_char (pfile, kind, /*ucn_p=3D*/true, loc);
> - 	    }
> - 	  cur++;
> - 	}
> -@@ -2476,8 +2630,9 @@ lex_string (cpp_reader *pfile, cpp_token
> - 	saw_NUL =3D true;
> -       else if (__builtin_expect (c =3D=3D bidi::utf8_start, 0) && warn_=
bidi_p)
> - 	{
> --	  bidi::kind kind =3D get_bidi_utf8 (cur - 1);
> --	  maybe_warn_bidi_on_char (pfile, cur - 1, kind, /*ucn_p=3D*/false);
> -+	  location_t loc;
> -+	  bidi::kind kind =3D get_bidi_utf8 (pfile, cur - 1, &loc);
> -+	  maybe_warn_bidi_on_char (pfile, kind, /*ucn_p=3D*/false, loc);
> - 	}
> -     }
> -=20
> diff --git a/meta/recipes-devtools/gcc/gcc/0009-cpp-honor-sysroot.patch b=
/meta/recipes-devtools/gcc/gcc/0009-cpp-honor-sysroot.patch
> index 37f26f0728..1c0f381859 100644
> --- a/meta/recipes-devtools/gcc/gcc/0009-cpp-honor-sysroot.patch
> +++ b/meta/recipes-devtools/gcc/gcc/0009-cpp-honor-sysroot.patch
> @@ -22,13 +22,14 @@ gcc/ChangeLog:
>      * gcc.c: Pass sysroot options to cpp for preprocessed source
> =20
>  Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> +Signed-off-by: Bernhard Rosenkr=E4nzer <bernhard.rosenkraenzer.ext@huawe=
i.com> [ported to gcc 12]
> =20
>  [YOCTO #2074]
> =20
>  Upstream-Status: Submitted [https://gcc.gnu.org/pipermail/gcc-patches/20=
21-October/582725.html]
>  ---
>   gcc/cp/lang-specs.h | 2 +-
> - gcc/gcc.c           | 2 +-
> + gcc/gcc.cc          | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> =20
>  Index: gcc-11.2.0/gcc/cp/lang-specs.h
> @@ -44,10 +45,10 @@ Index: gcc-11.2.0/gcc/cp/lang-specs.h
>         "  %{!fsyntax-only:"
>         "    %{fmodule-only:%{!S:-o %g.s%V}}"
>         "    %{!fmodule-only:%{!fmodule-header*:%(invoke_as)}}}"
> -Index: gcc-11.2.0/gcc/gcc.c
> +Index: gcc-11.2.0/gcc/gcc.cc
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-11.2.0.orig/gcc/gcc.c
> -+++ gcc-11.2.0/gcc/gcc.c
> +--- gcc-11.2.0.orig/gcc/gcc.cc
> ++++ gcc-11.2.0/gcc/gcc.cc
>  @@ -1470,7 +1470,7 @@ static const struct compiler default_com
>   					   %W{o*:--output-pch=3D%*}}%V}}}}}}}", 0, 0, 0},
>     {".i", "@cpp-output", 0, 0, 0},
> diff --git a/meta/recipes-devtools/gcc/gcc/0012-gcc-Fix-argument-list-too=
-long-error.patch b/meta/recipes-devtools/gcc/gcc/0012-gcc-Fix-argument-lis=
t-too-long-error.patch
> deleted file mode 100644
> index ebee30bbd6..0000000000
> --- a/meta/recipes-devtools/gcc/gcc/0012-gcc-Fix-argument-list-too-long-e=
rror.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From: Richard Purdie <richard.purdie@linuxfoundation.org>
> -Subject: [PATCH 2/5] gcc: Fix "argument list too long" from install-plug=
ins
> -
> -When building in longer build paths (200+ characters), the
> -"echo $(PLUGIN_HEADERS)" from the install-plugins target would cause an
> -"argument list too long error" on some systems.
> -
> -Avoid this by calling make's sort function on the list which removes
> -duplicates and stops the overflow from reaching the echo command.
> -The original sort is left to handle the the .h and .def files.
> -
> -2021-10-26 Richard Purdie <richard.purdie@linuxfoundation.org>
> -
> -gcc/ChangeLog:
> -
> -    * Makefile.in: Fix "argument list too long" from install-plugins
> -
> -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> -
> -Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2021-October/582722=
.html]
> -Upstream-Status: Backport [https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcomm=
it;h=3D66e157188bd2f789809e17e85f917534c9381599]
> ----
> - gcc/Makefile.in | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -Index: gcc-11.2.0/gcc/Makefile.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-11.2.0.orig/gcc/Makefile.in
> -+++ gcc-11.2.0/gcc/Makefile.in
> -@@ -3678,7 +3678,7 @@ install-plugin: installdirs lang.install
> - # We keep the directory structure for files in config, common/config or
> - # c-family and .def files. All other files are flattened to a single di=
rectory.
> - 	$(mkinstalldirs) $(DESTDIR)$(plugin_includedir)
> --	headers=3D`echo $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.def) | t=
r ' ' '\012' | sort -u`; \
> -+	headers=3D`echo $(sort $(PLUGIN_HEADERS)) $$(cd $(srcdir); echo *.h *.=
def) | tr ' ' '\012' | sort -u`; \
> - 	srcdirstrip=3D`echo "$(srcdir)" | sed 's/[].[^$$\\*|]/\\\\&/g'`; \
> - 	for file in $$headers; do \
> - 	  if [ -f $$file ] ; then \
> diff --git a/meta/recipes-devtools/gcc/gcc/0018-export-CPP.patch b/meta/r=
ecipes-devtools/gcc/gcc/0018-export-CPP.patch
> deleted file mode 100644
> index 86ab6574c7..0000000000
> --- a/meta/recipes-devtools/gcc/gcc/0018-export-CPP.patch
> +++ /dev/null
> @@ -1,199 +0,0 @@
> -From: Richard Purdie <richard.purdie@linuxfoundation.org>
> -Subject: [PATCH 1/5] Makefile.in: Ensure build CPP/CPPFLAGS is used for =
build targets
> -
> -During cross compiling, CPP is being set to the target compiler even for
> -build targets. As an example, when building a cross compiler targetting
> -mingw, the config.log for libiberty in
> -build.x86_64-pokysdk-mingw32.i586-poky-linux/build-x86_64-linux/libibert=
y/config.log
> -shows:
> -
> -configure:3786: checking how to run the C preprocessor
> -configure:3856: result: x86_64-pokysdk-mingw32-gcc -E --sysroot=3D[sysro=
ot]/x86_64-nativesdk-mingw32-pokysdk-mingw32
> -configure:3876: x86_64-pokysdk-mingw32-gcc -E --sysroot=3D[sysroot]/x86_=
64-nativesdk-mingw32-pokysdk-mingw32 conftest.c
> -configure:3876: $? =3D 0
> -
> -This is libiberty being built for the build environment, not the target =
one
> -(i.e. in build-x86_64-linux). As such it should be using the build envir=
onment's
> -gcc and not the target one. In the mingw case the system headers are qui=
te
> -different leading to build failures related to not being able to include=
 a
> -process.h file for pem-unix.c.
> -
> -Further analysis shows the same issue occuring for CPPFLAGS too.
> -
> -Fix this by adding support for CPP_FOR_BUILD and CPPFLAGS_FOR_BUILD which
> -for example, avoids mixing the mingw headers for host binaries on linux
> -systems.
> -
> -2021-10-27 Richard Purdie <richard.purdie@linuxfoundation.org>
> -
> -ChangeLog:
> -
> -    * Makefile.tpl: Add CPP_FOR_BUILD and CPPFLAGS_FOR_BUILD support
> -    * Makefile.in: Regenerate.
> -    * configure: Regenerate.
> -    * configure.ac: Add CPP_FOR_BUILD and CPPFLAGS_FOR_BUILD support
> -
> -gcc/ChangeLog:
> -
> -    * configure: Regenerate.
> -    * configure.ac: Use CPPFLAGS_FOR_BUILD for GMPINC
> -
> -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> -
> -Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2021-October/582727=
.html]
> -Upstream-Status: Backport [https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcomm=
itdiff;h=3D84401ce5fb4ecab55decb472b168100e7593e01f]
> ----
> - Makefile.in      | 6 ++++++
> - Makefile.tpl     | 6 ++++++
> - configure        | 4 ++++
> - configure.ac     | 4 ++++
> - gcc/configure    | 2 +-
> - gcc/configure.ac | 2 +-
> - 6 files changed, 22 insertions(+), 2 deletions(-)
> -
> -Index: gcc-11.2.0/Makefile.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-11.2.0.orig/Makefile.in
> -+++ gcc-11.2.0/Makefile.in
> -@@ -151,6 +151,8 @@ BUILD_EXPORTS =3D \
> - 	CC=3D"$(CC_FOR_BUILD)"; export CC; \
> - 	CFLAGS=3D"$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
> - 	CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> -+	CPP=3D"$(CPP_FOR_BUILD)"; export CPP; \
> -+	CPPFLAGS=3D"$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS; \
> - 	CXX=3D"$(CXX_FOR_BUILD)"; export CXX; \
> - 	CXXFLAGS=3D"$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
> - 	GFORTRAN=3D"$(GFORTRAN_FOR_BUILD)"; export GFORTRAN; \
> -@@ -198,6 +200,8 @@ HOST_EXPORTS =3D \
> - 	AR=3D"$(AR)"; export AR; \
> - 	AS=3D"$(AS)"; export AS; \
> - 	CC_FOR_BUILD=3D"$(CC_FOR_BUILD)"; export CC_FOR_BUILD; \
> -+	CPP_FOR_BUILD=3D"$(CPP_FOR_BUILD)"; export CPP_FOR_BUILD; \
> -+	CPPFLAGS_FOR_BUILD=3D"$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS_FOR_BUIL=
D; \
> - 	CXX_FOR_BUILD=3D"$(CXX_FOR_BUILD)"; export CXX_FOR_BUILD; \
> - 	DLLTOOL=3D"$(DLLTOOL)"; export DLLTOOL; \
> - 	LD=3D"$(LD)"; export LD; \
> -@@ -353,6 +357,8 @@ AR_FOR_BUILD =3D @AR_FOR_BUILD@
> - AS_FOR_BUILD =3D @AS_FOR_BUILD@
> - CC_FOR_BUILD =3D @CC_FOR_BUILD@
> - CFLAGS_FOR_BUILD =3D @CFLAGS_FOR_BUILD@
> -+CPP_FOR_BUILD =3D @CPP_FOR_BUILD@
> -+CPPFLAGS_FOR_BUILD =3D @CPPFLAGS_FOR_BUILD@
> - CXXFLAGS_FOR_BUILD =3D @CXXFLAGS_FOR_BUILD@
> - CXX_FOR_BUILD =3D @CXX_FOR_BUILD@
> - DLLTOOL_FOR_BUILD =3D @DLLTOOL_FOR_BUILD@
> -Index: gcc-11.2.0/Makefile.tpl
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-11.2.0.orig/Makefile.tpl
> -+++ gcc-11.2.0/Makefile.tpl
> -@@ -154,6 +154,8 @@ BUILD_EXPORTS =3D \
> - 	CC=3D"$(CC_FOR_BUILD)"; export CC; \
> - 	CFLAGS=3D"$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
> - 	CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> -+	CPP=3D"$(CPP_FOR_BUILD)"; export CPP; \
> -+	CPPFLAGS=3D"$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS; \
> - 	CXX=3D"$(CXX_FOR_BUILD)"; export CXX; \
> - 	CXXFLAGS=3D"$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
> - 	GFORTRAN=3D"$(GFORTRAN_FOR_BUILD)"; export GFORTRAN; \
> -@@ -201,6 +203,8 @@ HOST_EXPORTS =3D \
> - 	AR=3D"$(AR)"; export AR; \
> - 	AS=3D"$(AS)"; export AS; \
> - 	CC_FOR_BUILD=3D"$(CC_FOR_BUILD)"; export CC_FOR_BUILD; \
> -+	CPP_FOR_BUILD=3D"$(CPP_FOR_BUILD)"; export CPP_FOR_BUILD; \
> -+	CPPFLAGS_FOR_BUILD=3D"$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS_FOR_BUIL=
D; \
> - 	CXX_FOR_BUILD=3D"$(CXX_FOR_BUILD)"; export CXX_FOR_BUILD; \
> - 	DLLTOOL=3D"$(DLLTOOL)"; export DLLTOOL; \
> - 	LD=3D"$(LD)"; export LD; \
> -@@ -356,6 +360,8 @@ AR_FOR_BUILD =3D @AR_FOR_BUILD@
> - AS_FOR_BUILD =3D @AS_FOR_BUILD@
> - CC_FOR_BUILD =3D @CC_FOR_BUILD@
> - CFLAGS_FOR_BUILD =3D @CFLAGS_FOR_BUILD@
> -+CPP_FOR_BUILD =3D @CPP_FOR_BUILD@
> -+CPPFLAGS_FOR_BUILD =3D @CPPFLAGS_FOR_BUILD@
> - CXXFLAGS_FOR_BUILD =3D @CXXFLAGS_FOR_BUILD@
> - CXX_FOR_BUILD =3D @CXX_FOR_BUILD@
> - DLLTOOL_FOR_BUILD =3D @DLLTOOL_FOR_BUILD@
> -Index: gcc-11.2.0/configure
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-11.2.0.orig/configure
> -+++ gcc-11.2.0/configure
> -@@ -652,6 +652,8 @@ GFORTRAN_FOR_BUILD
> - DLLTOOL_FOR_BUILD
> - CXX_FOR_BUILD
> - CXXFLAGS_FOR_BUILD
> -+CPPFLAGS_FOR_BUILD
> -+CPP_FOR_BUILD
> - CFLAGS_FOR_BUILD
> - CC_FOR_BUILD
> - AS_FOR_BUILD
> -@@ -4092,6 +4094,7 @@ if test "${build}" !=3D "${host}" ; then
> -   AR_FOR_BUILD=3D${AR_FOR_BUILD-ar}
> -   AS_FOR_BUILD=3D${AS_FOR_BUILD-as}
> -   CC_FOR_BUILD=3D${CC_FOR_BUILD-gcc}
> -+  CPP_FOR_BUILD=3D"${CPP_FOR_BUILD-\$(CPP)}"
> -   CXX_FOR_BUILD=3D${CXX_FOR_BUILD-g++}
> -   GFORTRAN_FOR_BUILD=3D${GFORTRAN_FOR_BUILD-gfortran}
> -   GOC_FOR_BUILD=3D${GOC_FOR_BUILD-gccgo}
> -@@ -9809,6 +9812,7 @@ esac
> - # our build compiler if desired.
> - if test x"${build}" =3D x"${host}" ; then
> -   CFLAGS_FOR_BUILD=3D${CFLAGS_FOR_BUILD-${CFLAGS}}
> -+  CPPFLAGS_FOR_BUILD=3D${CPPFLAGS_FOR_BUILD-${CPPFLAGS}}
> -   CXXFLAGS_FOR_BUILD=3D${CXXFLAGS_FOR_BUILD-${CXXFLAGS}}
> -   LDFLAGS_FOR_BUILD=3D${LDFLAGS_FOR_BUILD-${LDFLAGS}}
> - fi
> -Index: gcc-11.2.0/configure.ac
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-11.2.0.orig/configure.ac
> -+++ gcc-11.2.0/configure.ac
> -@@ -1347,6 +1347,7 @@ if test "${build}" !=3D "${host}" ; then
> -   AR_FOR_BUILD=3D${AR_FOR_BUILD-ar}
> -   AS_FOR_BUILD=3D${AS_FOR_BUILD-as}
> -   CC_FOR_BUILD=3D${CC_FOR_BUILD-gcc}
> -+  CPP_FOR_BUILD=3D"${CPP_FOR_BUILD-\$(CPP)}"
> -   CXX_FOR_BUILD=3D${CXX_FOR_BUILD-g++}
> -   GFORTRAN_FOR_BUILD=3D${GFORTRAN_FOR_BUILD-gfortran}
> -   GOC_FOR_BUILD=3D${GOC_FOR_BUILD-gccgo}
> -@@ -3321,6 +3322,7 @@ esac
> - # our build compiler if desired.
> - if test x"${build}" =3D x"${host}" ; then
> -   CFLAGS_FOR_BUILD=3D${CFLAGS_FOR_BUILD-${CFLAGS}}
> -+  CPPFLAGS_FOR_BUILD=3D${CPPFLAGS_FOR_BUILD-${CPPFLAGS}}
> -   CXXFLAGS_FOR_BUILD=3D${CXXFLAGS_FOR_BUILD-${CXXFLAGS}}
> -   LDFLAGS_FOR_BUILD=3D${LDFLAGS_FOR_BUILD-${LDFLAGS}}
> - fi
> -@@ -3387,6 +3389,8 @@ AC_SUBST(AR_FOR_BUILD)
> - AC_SUBST(AS_FOR_BUILD)
> - AC_SUBST(CC_FOR_BUILD)
> - AC_SUBST(CFLAGS_FOR_BUILD)
> -+AC_SUBST(CPP_FOR_BUILD)
> -+AC_SUBST(CPPFLAGS_FOR_BUILD)
> - AC_SUBST(CXXFLAGS_FOR_BUILD)
> - AC_SUBST(CXX_FOR_BUILD)
> - AC_SUBST(DLLTOOL_FOR_BUILD)
> -Index: gcc-11.2.0/gcc/configure
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-11.2.0.orig/gcc/configure
> -+++ gcc-11.2.0/gcc/configure
> -@@ -12699,7 +12699,7 @@ else
> - 	CC=3D"${CC_FOR_BUILD}" CFLAGS=3D"${CFLAGS_FOR_BUILD}" \
> - 	CXX=3D"${CXX_FOR_BUILD}" CXXFLAGS=3D"${CXXFLAGS_FOR_BUILD}" \
> - 	LD=3D"${LD_FOR_BUILD}" LDFLAGS=3D"${LDFLAGS_FOR_BUILD}" \
> --	GMPINC=3D"" CPPFLAGS=3D"${CPPFLAGS} -DGENERATOR_FILE" \
> -+	GMPINC=3D"" CPPFLAGS=3D"${CPPFLAGS_FOR_BUILD} -DGENERATOR_FILE" \
> - 	${realsrcdir}/configure \
> - 		--enable-languages=3D${enable_languages-all} \
> - 		${enable_obsolete+--enable-obsolete=3D"$enable_obsolete"} \
> -Index: gcc-11.2.0/gcc/configure.ac
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-11.2.0.orig/gcc/configure.ac
> -+++ gcc-11.2.0/gcc/configure.ac
> -@@ -2023,7 +2023,7 @@ else
> - 	CC=3D"${CC_FOR_BUILD}" CFLAGS=3D"${CFLAGS_FOR_BUILD}" \
> - 	CXX=3D"${CXX_FOR_BUILD}" CXXFLAGS=3D"${CXXFLAGS_FOR_BUILD}" \
> - 	LD=3D"${LD_FOR_BUILD}" LDFLAGS=3D"${LDFLAGS_FOR_BUILD}" \
> --	GMPINC=3D"" CPPFLAGS=3D"${CPPFLAGS} -DGENERATOR_FILE" \
> -+	GMPINC=3D"" CPPFLAGS=3D"${CPPFLAGS_FOR_BUILD} -DGENERATOR_FILE" \
> - 	${realsrcdir}/configure \
> - 		--enable-languages=3D${enable_languages-all} \
> - 		${enable_obsolete+--enable-obsolete=3D"$enable_obsolete"} \
> diff --git a/meta/recipes-devtools/gcc/gcc/0019-Ensure-target-gcc-headers=
-can-be-included.patch b/meta/recipes-devtools/gcc/gcc/0019-Ensure-target-g=
cc-headers-can-be-included.patch
> index 120d5a29b2..f8d1861bc0 100644
> --- a/meta/recipes-devtools/gcc/gcc/0019-Ensure-target-gcc-headers-can-be=
-included.patch
> +++ b/meta/recipes-devtools/gcc/gcc/0019-Ensure-target-gcc-headers-can-be=
-included.patch
> @@ -21,7 +21,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   gcc/Makefile.in           | 2 ++
>   gcc/config/linux.h        | 8 ++++++++
>   gcc/config/rs6000/sysv4.h | 8 ++++++++
> - gcc/cppdefault.c          | 4 ++++
> + gcc/cppdefault.cc         | 4 ++++
>   4 files changed, 22 insertions(+)
> =20
>  diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> @@ -96,10 +96,10 @@ index 510abe169c5..0c2bba5ea32 100644
>       INCLUDE_DEFAULTS_MUSL_NATIVE			\
>       { GCC_INCLUDE_DIR, "GCC", 0, 1, 0, 0 },		\
>       { 0, 0, 0, 0, 0, 0 }				\
> -diff --git a/gcc/cppdefault.c b/gcc/cppdefault.c
> +diff --git a/gcc/cppdefault.cc b/gcc/cppdefault.cc
>  index c503d14fc3f..d54d6ce0076 100644
> ---- a/gcc/cppdefault.c
> -+++ b/gcc/cppdefault.c
> +--- a/gcc/cppdefault.cc
> ++++ b/gcc/cppdefault.cc
>  @@ -64,6 +64,10 @@ const struct default_include cpp_include_defaults[]
>       /* This is the dir for gcc's private headers.  */
>       { GCC_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
> diff --git a/meta/recipes-devtools/gcc/gcc/0024-handle-sysroot-support-fo=
r-nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc/0024-handle-sysroot-s=
upport-for-nativesdk-gcc.patch
> index b1054fa749..aa005532ad 100644
> --- a/meta/recipes-devtools/gcc/gcc/0024-handle-sysroot-support-for-nativ=
esdk-gcc.patch
> +++ b/meta/recipes-devtools/gcc/gcc/0024-handle-sysroot-support-for-nativ=
esdk-gcc.patch
> @@ -34,21 +34,22 @@ if the executable is moved.  (These paths were missed=
 in the original
>  implementation.)
> =20
>  Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> +Signed-off-by: Bernhard Rosenkr=E4nzer <bernhard.rosenkraenzer.ext@huawe=
i.com> [ported to gcc 12]
>  ---
> - gcc/c-family/c-opts.c     |  4 +--
> + gcc/c-family/c-opts.cc    |  4 +--
>   gcc/config/linux.h        | 24 +++++++--------
>   gcc/config/rs6000/sysv4.h | 24 +++++++--------
> - gcc/cppdefault.c          | 63 ++++++++++++++++++++++++---------------
> + gcc/cppdefault.cc         | 63 ++++++++++++++++++++++++---------------
>   gcc/cppdefault.h          | 13 ++++----
> - gcc/gcc.c                 | 20 +++++++++----
> - gcc/incpath.c             | 12 ++++----
> - gcc/prefix.c              |  6 ++--
> + gcc/gcc.cc                | 20 +++++++++----
> + gcc/incpath.cc            | 12 ++++----
> + gcc/prefix.cc             |  6 ++--
>   8 files changed, 94 insertions(+), 72 deletions(-)
> =20
> -diff --git a/gcc/c-family/c-opts.c b/gcc/c-family/c-opts.c
> +diff --git a/gcc/c-family/c-opts.cc b/gcc/c-family/c-opts.cc
>  index 89e05a4c551..5577383665d 100644
> ---- a/gcc/c-family/c-opts.c
> -+++ b/gcc/c-family/c-opts.c
> +--- a/gcc/c-family/c-opts.cc
> ++++ b/gcc/c-family/c-opts.cc
>  @@ -1436,8 +1436,8 @@ add_prefixed_path (const char *suffix, incpath_kin=
d chain)
>     size_t prefix_len, suffix_len;
>  =20
> @@ -216,10 +217,10 @@ index 0c2bba5ea32..313a8de4417 100644
>       { 0, 0, 0, 0, 0, 0 }				\
>     }
>   #endif
> -diff --git a/gcc/cppdefault.c b/gcc/cppdefault.c
> +diff --git a/gcc/cppdefault.cc b/gcc/cppdefault.cc
>  index d54d6ce0076..784a92a0c24 100644
> ---- a/gcc/cppdefault.c
> -+++ b/gcc/cppdefault.c
> +--- a/gcc/cppdefault.cc
> ++++ b/gcc/cppdefault.cc
>  @@ -35,6 +35,30 @@
>   # undef CROSS_INCLUDE_DIR
>   #endif
> @@ -377,10 +378,10 @@ index fd3c655db1c..20669ac427d 100644
>   /* The run-time execution prefix.  This is typically the lib/gcc
>      subdirectory of the actual installation.  */
>   extern const char *gcc_exec_prefix;
> -diff --git a/gcc/gcc.c b/gcc/gcc.c
> +diff --git a/gcc/gcc.cc b/gcc/gcc.cc
>  index 8737bae5353..aa6fbe43965 100644
> ---- a/gcc/gcc.c
> -+++ b/gcc/gcc.c
> +--- a/gcc/gcc.cc
> ++++ b/gcc/gcc.cc
>  @@ -252,6 +252,8 @@ FILE *report_times_to_file =3D NULL;
>   #endif
>   static const char *target_system_root =3D DEFAULT_TARGET_SYSTEM_ROOT;
> @@ -437,10 +438,10 @@ index 8737bae5353..aa6fbe43965 100644
>   	  case 'S':
>   	    value =3D do_spec_1 (startfile_spec, 0, NULL);
>   	    if (value !=3D 0)
> -diff --git a/gcc/incpath.c b/gcc/incpath.c
> +diff --git a/gcc/incpath.cc b/gcc/incpath.cc
>  index fbfc0ce03b8..a82e543428b 100644
> ---- a/gcc/incpath.c
> -+++ b/gcc/incpath.c
> +--- a/gcc/incpath.cc
> ++++ b/gcc/incpath.cc
>  @@ -131,7 +131,7 @@ add_standard_paths (const char *sysroot, const char =
*iprefix,
>     int relocated =3D cpp_relocated ();
>     size_t len;
> @@ -484,10 +485,10 @@ index fbfc0ce03b8..a82e543428b 100644
>   			     NULL);
>   	      str =3D update_path (ostr, p->component);
>   	      free (ostr);
> -diff --git a/gcc/prefix.c b/gcc/prefix.c
> +diff --git a/gcc/prefix.cc b/gcc/prefix.cc
>  index 747c09de638..f728638dc65 100644
> ---- a/gcc/prefix.c
> -+++ b/gcc/prefix.c
> +--- a/gcc/prefix.cc
> ++++ b/gcc/prefix.cc
>  @@ -72,7 +72,9 @@ License along with GCC; see the file COPYING3.  If not=
 see
>   #include "prefix.h"
>   #include "common/common-target.h"
> diff --git a/meta/recipes-devtools/gcc/gcc/0025-Search-target-sysroot-gcc=
-version-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gcc/0025-Sear=
ch-target-sysroot-gcc-version-specific-dirs-with.patch
> index ff622b1056..d27e3011ed 100644
> --- a/meta/recipes-devtools/gcc/gcc/0025-Search-target-sysroot-gcc-versio=
n-specific-dirs-with.patch
> +++ b/meta/recipes-devtools/gcc/gcc/0025-Search-target-sysroot-gcc-versio=
n-specific-dirs-with.patch
> @@ -46,14 +46,15 @@ Upstream-Status: Pending
>  RP 2015/7/31
> =20
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Signed-off-by: Bernhard Rosenkr=E4nzer <bernhard.rosenkraenzer.ext@huawe=
i.com> [ported to gcc 12]
>  ---
> - gcc/gcc.c | 29 ++++++++++++++++++++++++++++-
> + gcc/gcc.cc | 29 ++++++++++++++++++++++++++++-
>   1 file changed, 28 insertions(+), 1 deletion(-)
> =20
> -diff --git a/gcc/gcc.c b/gcc/gcc.c
> +diff --git a/gcc/gcc.cc b/gcc/gcc.cc
>  index aa6fbe43965..f8a71a13826 100644
> ---- a/gcc/gcc.c
> -+++ b/gcc/gcc.c
> +--- a/gcc/gcc.cc
> ++++ b/gcc/gcc.cc
>  @@ -2811,7 +2811,7 @@ for_each_path (const struct path_prefix *paths,
>         if (path =3D=3D NULL)
>   	{
> diff --git a/meta/recipes-devtools/gcc/gcc/0027-nios2-Define-MUSL_DYNAMIC=
_LINKER.patch b/meta/recipes-devtools/gcc/gcc/0027-nios2-Define-MUSL_DYNAMI=
C_LINKER.patch
> deleted file mode 100644
> index 97c271373b..0000000000
> --- a/meta/recipes-devtools/gcc/gcc/0027-nios2-Define-MUSL_DYNAMIC_LINKER=
.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From: Richard Purdie <richard.purdie@linuxfoundation.org>
> -Subject: [PATCH 4/5] gcc/nios2: Define the musl linker
> -
> -Add a definition of the musl linker used on the nios2 platform.
> -
> -2021-10-26 Richard Purdie <richard.purdie@linuxfoundation.org>
> -
> -gcc/ChangeLog:
> -
> -    * config/nios2/linux.h (MUSL_DYNAMIC_LINKER): Add musl linker
> -
> -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> -
> -Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2021-October/582723=
.html]
> -Upstream-Status: Backport [https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcomm=
itdiff;h=3De5ddbbf992b909d8e38851bd3179d29389e6ac97]
> ----
> - gcc/config/nios2/linux.h | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -Index: gcc-11.2.0/gcc/config/nios2/linux.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-11.2.0.orig/gcc/config/nios2/linux.h
> -+++ gcc-11.2.0/gcc/config/nios2/linux.h
> -@@ -30,6 +30,7 @@
> - #define CPP_SPEC "%{posix:-D_POSIX_SOURCE} %{pthread:-D_REENTRANT}"
> -=20
> - #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-nios2.so.1"
> -+#define MUSL_DYNAMIC_LINKER  "/lib/ld-musl-nios2.so.1"
> -=20
> - #undef LINK_SPEC
> - #define LINK_SPEC LINK_SPEC_ENDIAN \
> diff --git a/meta/recipes-devtools/gcc/gcc/0029-Link-libgcc-using-LDFLAGS=
-not-just-SHLIB_LDFLAGS.patch b/meta/recipes-devtools/gcc/gcc/0029-Link-lib=
gcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
> deleted file mode 100644
> index b74aeb8bb6..0000000000
> --- a/meta/recipes-devtools/gcc/gcc/0029-Link-libgcc-using-LDFLAGS-not-ju=
st-SHLIB_LDFLAGS.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From 695adb4dffb23c6f5cbc757e05cf4187a2bd6528 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 4 May 2016 21:11:34 -0700
> -Subject: [PATCH] Link libgcc using LDFLAGS, not just SHLIB_LDFLAGS
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - libgcc/config/t-slibgcc | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/libgcc/config/t-slibgcc b/libgcc/config/t-slibgcc
> -index c59b43b7b69..ca4c141f526 100644
> ---- a/libgcc/config/t-slibgcc
> -+++ b/libgcc/config/t-slibgcc
> -@@ -32,7 +32,7 @@ SHLIB_INSTALL_SOLINK =3D $(LN_S) $(SHLIB_SONAME) \
> - 	$(DESTDIR)$(slibdir)$(SHLIB_SLIBDIR_QUAL)/$(SHLIB_SOLINK)
> -=20
> - SHLIB_LINK =3D $(CC) $(LIBGCC2_CFLAGS) -shared -nodefaultlibs \
> --	$(SHLIB_LDFLAGS) \
> -+	$(LDFLAGS) $(SHLIB_LDFLAGS) \
> - 	-o $(SHLIB_DIR)/$(SHLIB_SONAME).tmp @multilib_flags@ \
> - 	$(SHLIB_OBJS) $(SHLIB_LC) && \
> - 	rm -f $(SHLIB_DIR)/$(SHLIB_SOLINK) && \
> diff --git a/meta/recipes-devtools/gcc/gcc/0030-sync-gcc-stddef.h-with-mu=
sl.patch b/meta/recipes-devtools/gcc/gcc/0030-sync-gcc-stddef.h-with-musl.p=
atch
> deleted file mode 100644
> index fd7d604e98..0000000000
> --- a/meta/recipes-devtools/gcc/gcc/0030-sync-gcc-stddef.h-with-musl.patch
> +++ /dev/null
> @@ -1,88 +0,0 @@
> -From a9173429ae256c4b4a3ab4d758a6adf42f8c4239 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 3 Feb 2017 12:56:00 -0800
> -Subject: [PATCH] sync gcc stddef.h with musl
> -
> -musl defines ptrdiff_t size_t and wchar_t
> -so dont define them here if musl is definining them
> -
> -Upstream-Status: Backport [https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcomm=
it;h=3D85a438fc78dd12249ca854a3e5c577fefeb1a5cd]
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - gcc/ginclude/stddef.h | 9 +++++++++
> - 1 file changed, 9 insertions(+)
> -
> -diff --git a/gcc/ginclude/stddef.h b/gcc/ginclude/stddef.h
> -index 66619fe43b1..3f843d6f365 100644
> ---- a/gcc/ginclude/stddef.h
> -+++ b/gcc/ginclude/stddef.h
> -@@ -128,6 +128,7 @@ _TYPE_wchar_t;
> - #ifndef ___int_ptrdiff_t_h
> - #ifndef _GCC_PTRDIFF_T
> - #ifndef _PTRDIFF_T_DECLARED /* DragonFly */
> -+#ifndef __DEFINED_ptrdiff_t /* musl */
> - #define _PTRDIFF_T
> - #define _T_PTRDIFF_
> - #define _T_PTRDIFF
> -@@ -137,10 +138,12 @@ _TYPE_wchar_t;
> - #define ___int_ptrdiff_t_h
> - #define _GCC_PTRDIFF_T
> - #define _PTRDIFF_T_DECLARED
> -+#define __DEFINED_ptrdiff_t /* musl */
> - #ifndef __PTRDIFF_TYPE__
> - #define __PTRDIFF_TYPE__ long int
> - #endif
> - typedef __PTRDIFF_TYPE__ ptrdiff_t;
> -+#endif /* __DEFINED_ptrdiff_t */
> - #endif /* _PTRDIFF_T_DECLARED */
> - #endif /* _GCC_PTRDIFF_T */
> - #endif /* ___int_ptrdiff_t_h */
> -@@ -178,6 +181,7 @@ typedef __PTRDIFF_TYPE__ ptrdiff_t;
> - #ifndef _GCC_SIZE_T
> - #ifndef _SIZET_
> - #ifndef __size_t
> -+#ifndef __DEFINED_size_t /* musl */
> - #define __size_t__	/* BeOS */
> - #define __SIZE_T__	/* Cray Unicos/Mk */
> - #define _SIZE_T
> -@@ -194,6 +198,7 @@ typedef __PTRDIFF_TYPE__ ptrdiff_t;
> - #define ___int_size_t_h
> - #define _GCC_SIZE_T
> - #define _SIZET_
> -+#define __DEFINED_size_t /* musl */
> - #if defined (__FreeBSD__) \
> -   || defined(__DragonFly__) \
> -   || defined(__FreeBSD_kernel__) \
> -@@ -228,6 +233,7 @@ typedef long ssize_t;
> - #endif /* _SIZE_T */
> - #endif /* __SIZE_T__ */
> - #endif /* __size_t__ */
> -+#endif /* __DEFINED_size_t */
> - #undef	__need_size_t
> - #endif /* _STDDEF_H or __need_size_t.  */
> -=20
> -@@ -257,6 +263,7 @@ typedef long ssize_t;
> - #ifndef ___int_wchar_t_h
> - #ifndef __INT_WCHAR_T_H
> - #ifndef _GCC_WCHAR_T
> -+#ifndef __DEFINED_wchar_t /* musl */
> - #define __wchar_t__	/* BeOS */
> - #define __WCHAR_T__	/* Cray Unicos/Mk */
> - #define _WCHAR_T
> -@@ -272,6 +279,7 @@ typedef long ssize_t;
> - #define __INT_WCHAR_T_H
> - #define _GCC_WCHAR_T
> - #define _WCHAR_T_DECLARED
> -+#define __DEFINED_wchar_t /* musl */
> -=20
> - /* On BSD/386 1.1, at least, machine/ansi.h defines _BSD_WCHAR_T_
> -    instead of _WCHAR_T_, and _BSD_RUNE_T_ (which, unlike the other
> -@@ -337,6 +345,7 @@ typedef __WCHAR_TYPE__ wchar_t;
> - #endif
> - #endif /* __WCHAR_T__ */
> - #endif /* __wchar_t__ */
> -+#endif /* __DEFINED_wchar_t musl */
> - #undef	__need_wchar_t
> - #endif /* _STDDEF_H or __need_wchar_t.  */
> -=20
> diff --git a/meta/recipes-devtools/gcc/gcc/0034-libgcc_s-Use-alias-for-__=
cpu_indicator_init-instead-.patch b/meta/recipes-devtools/gcc/gcc/0034-libg=
cc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
> index 3f666dc7bd..5970c2fcbd 100644
> --- a/meta/recipes-devtools/gcc/gcc/0034-libgcc_s-Use-alias-for-__cpu_ind=
icator_init-instead-.patch
> +++ b/meta/recipes-devtools/gcc/gcc/0034-libgcc_s-Use-alias-for-__cpu_ind=
icator_init-instead-.patch
> @@ -32,16 +32,17 @@ gcc/Changelog:
>  Upstream-Status: Pending
> =20
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Signed-off-by: Bernhard Rosenkr=E4nzer <bernhard.rosenkraenzer.ext@huawe=
i.com> [ported to gcc 12]
>  ---
> - gcc/config/i386/i386-expand.c | 4 ++--
> - libgcc/config/i386/cpuinfo.c  | 6 +++---
> - libgcc/config/i386/t-linux    | 2 +-
> + gcc/config/i386/i386-expand.cc | 4 ++--
> + libgcc/config/i386/cpuinfo.c   | 6 +++---
> + libgcc/config/i386/t-linux     | 2 +-
>   3 files changed, 6 insertions(+), 6 deletions(-)
> =20
> -diff --git a/gcc/config/i386/i386-expand.c b/gcc/config/i386/i386-expand=
.c
> +diff --git a/gcc/config/i386/i386-expand.cc b/gcc/config/i386/i386-expan=
d.cc
>  index ac69eed4d32..ffaa44a16fc 100644
> ---- a/gcc/config/i386/i386-expand.c
> -+++ b/gcc/config/i386/i386-expand.c
> +--- a/gcc/config/i386/i386-expand.cc
> ++++ b/gcc/config/i386/i386-expand.cc
>  @@ -11038,10 +11038,10 @@ ix86_expand_builtin (tree exp, rtx target, rtx=
 subtarget,
>       {
>       case IX86_BUILTIN_CPU_INIT:
> diff --git a/meta/recipes-devtools/gcc/gcc/0035-gentypes-genmodes-Do-not-=
use-__LINE__-for-maintainin.patch b/meta/recipes-devtools/gcc/gcc/0035-gent=
ypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
> index 874cd7798d..579bd91251 100644
> --- a/meta/recipes-devtools/gcc/gcc/0035-gentypes-genmodes-Do-not-use-__L=
INE__-for-maintainin.patch
> +++ b/meta/recipes-devtools/gcc/gcc/0035-gentypes-genmodes-Do-not-use-__L=
INE__-for-maintainin.patch
> @@ -11,16 +11,17 @@ Upstream-Status: Inappropriate [OE Reproducibility sp=
ecific]
> =20
>  Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Signed-off-by: Bernhard Rosenkr=E4nzer <bernhard.rosenkraenzer.ext@huawe=
i.com> [ported to gcc 12]
>  ---
> - gcc/gengtype.c |  6 +++---
> - gcc/genmodes.c | 32 ++++++++++++++++----------------
> + gcc/gengtype.cc |  6 +++---
> + gcc/genmodes.cc | 32 ++++++++++++++++----------------
>   2 files changed, 19 insertions(+), 19 deletions(-)
> =20
> -diff --git a/gcc/gengtype.c b/gcc/gengtype.c
> -index 5f50242e857..cbaca9b8cd0 100644
> ---- a/gcc/gengtype.c
> -+++ b/gcc/gengtype.c
> -@@ -991,7 +991,7 @@ create_field_at (pair_p next, type_p type, const cha=
r *name, options_p opt,
> +diff --git a/gcc/gengtype.cc b/gcc/gengtype.cc
> +index 386ae1b0506..9762e914296 100644
> +--- a/gcc/gengtype.cc
> ++++ b/gcc/gengtype.cc
> +@@ -1006,7 +1006,7 @@ create_field_at (pair_p next, type_p type, const c=
har *name, options_p opt,
>   /* Create a fake field with the given type and name.  NEXT is the next
>      field in the chain.  */
>   #define create_field(next,type,name) \
> @@ -29,7 +30,7 @@ index 5f50242e857..cbaca9b8cd0 100644
>  =20
>   /* Like create_field, but the field is only valid when condition COND
>      is true.  */
> -@@ -1024,7 +1024,7 @@ create_optional_field_ (pair_p next, type_p type, =
const char *name,
> +@@ -1039,7 +1039,7 @@ create_optional_field_ (pair_p next, type_p type, =
const char *name,
>   }
>  =20
>   #define create_optional_field(next,type,name,cond)	\
> @@ -38,7 +39,7 @@ index 5f50242e857..cbaca9b8cd0 100644
>  =20
>   /* Reverse a linked list of 'struct pair's in place.  */
>   pair_p
> -@@ -5189,7 +5189,7 @@ main (int argc, char **argv)
> +@@ -5238,7 +5238,7 @@ main (int argc, char **argv)
>         /* These types are set up with #define or else outside of where
>            we can see them.  We should initialize them before calling
>            read_input_list.  */
> @@ -47,11 +48,11 @@ index 5f50242e857..cbaca9b8cd0 100644
>   	Call;} while (0)
>         POS_HERE (do_scalar_typedef ("CUMULATIVE_ARGS", &pos));
>         POS_HERE (do_scalar_typedef ("REAL_VALUE_TYPE", &pos));
> -diff --git a/gcc/genmodes.c b/gcc/genmodes.c
> -index c268ebc4c6e..4361f3f1563 100644
> ---- a/gcc/genmodes.c
> -+++ b/gcc/genmodes.c
> -@@ -438,7 +438,7 @@ complete_all_modes (void)
> +diff --git a/gcc/genmodes.cc b/gcc/genmodes.cc
> +index 59850bb070a..e187f8542a1 100644
> +--- a/gcc/genmodes.cc
> ++++ b/gcc/genmodes.cc
> +@@ -440,7 +440,7 @@ complete_all_modes (void)
>   }
>  =20
>   /* For each mode in class CLASS, construct a corresponding complex mode=
.  */
> @@ -60,7 +61,7 @@ index c268ebc4c6e..4361f3f1563 100644
>   static void
>   make_complex_modes (enum mode_class cl,
>   		    const char *file, unsigned int line)
> -@@ -497,7 +497,7 @@ make_complex_modes (enum mode_class cl,
> +@@ -499,7 +499,7 @@ make_complex_modes (enum mode_class cl,
>      having as many components as necessary.  ORDER is the sorting order
>      of the mode, with smaller numbers indicating a higher priority.  */
>   #define VECTOR_MODES_WITH_PREFIX(PREFIX, C, W, ORDER) \
> @@ -69,16 +70,16 @@ index c268ebc4c6e..4361f3f1563 100644
>   #define VECTOR_MODES(C, W) VECTOR_MODES_WITH_PREFIX (V, C, W, 0)
>   static void ATTRIBUTE_UNUSED
>   make_vector_modes (enum mode_class cl, const char *prefix, unsigned int=
 width,
> -@@ -549,7 +549,7 @@ make_vector_modes (enum mode_class cl, const char *p=
refix, unsigned int width,
> - /* Create a vector of booleans called NAME with COUNT elements and
> +@@ -552,7 +552,7 @@ make_vector_modes (enum mode_class cl, const char *p=
refix, unsigned int width,
>      BYTESIZE bytes in total.  */
> - #define VECTOR_BOOL_MODE(NAME, COUNT, BYTESIZE) \
> --  make_vector_bool_mode (#NAME, COUNT, BYTESIZE, __FILE__, __LINE__)
> -+  make_vector_bool_mode (#NAME, COUNT, BYTESIZE, __FILE__, 0)
> + #define VECTOR_BOOL_MODE(NAME, COUNT, COMPONENT, BYTESIZE)		\
> +   make_vector_bool_mode (#NAME, COUNT, #COMPONENT, BYTESIZE,		\
> +-			 __FILE__, __LINE__)
> ++			 __FILE__, 0)
>   static void ATTRIBUTE_UNUSED
>   make_vector_bool_mode (const char *name, unsigned int count,
> - 		       unsigned int bytesize, const char *file,
> -@@ -571,7 +571,7 @@ make_vector_bool_mode (const char *name, unsigned in=
t count,
> + 		       const char *component, unsigned int bytesize,
> +@@ -574,7 +574,7 @@ make_vector_bool_mode (const char *name, unsigned in=
t count,
>   /* Input.  */
>  =20
>   #define _SPECIAL_MODE(C, N) \
> @@ -87,7 +88,7 @@ index c268ebc4c6e..4361f3f1563 100644
>   #define RANDOM_MODE(N) _SPECIAL_MODE (RANDOM, N)
>   #define CC_MODE(N) _SPECIAL_MODE (CC, N)
>  =20
> -@@ -584,7 +584,7 @@ make_special_mode (enum mode_class cl, const char *n=
ame,
> +@@ -587,7 +587,7 @@ make_special_mode (enum mode_class cl, const char *n=
ame,
>  =20
>   #define INT_MODE(N, Y) FRACTIONAL_INT_MODE (N, -1U, Y)
>   #define FRACTIONAL_INT_MODE(N, B, Y) \
> @@ -96,7 +97,7 @@ index c268ebc4c6e..4361f3f1563 100644
>  =20
>   static void
>   make_int_mode (const char *name,
> -@@ -611,16 +611,16 @@ make_opaque_mode (const char *name,
> +@@ -628,16 +628,16 @@ make_opaque_mode (const char *name,
>   }
>  =20
>   #define FRACT_MODE(N, Y, F) \
> @@ -117,7 +118,7 @@ index c268ebc4c6e..4361f3f1563 100644
>  =20
>   /* Create a fixed-point mode by setting CL, NAME, BYTESIZE, IBIT, FBIT,
>      FILE, and LINE.  */
> -@@ -641,7 +641,7 @@ make_fixed_point_mode (enum mode_class cl,
> +@@ -658,7 +658,7 @@ make_fixed_point_mode (enum mode_class cl,
>  =20
>   #define FLOAT_MODE(N, Y, F)             FRACTIONAL_FLOAT_MODE (N, -1U, =
Y, F)
>   #define FRACTIONAL_FLOAT_MODE(N, B, Y, F) \
> @@ -126,7 +127,7 @@ index c268ebc4c6e..4361f3f1563 100644
>  =20
>   static void
>   make_float_mode (const char *name,
> -@@ -658,7 +658,7 @@ make_float_mode (const char *name,
> +@@ -675,7 +675,7 @@ make_float_mode (const char *name,
>   #define DECIMAL_FLOAT_MODE(N, Y, F)	\
>   	FRACTIONAL_DECIMAL_FLOAT_MODE (N, -1U, Y, F)
>   #define FRACTIONAL_DECIMAL_FLOAT_MODE(N, B, Y, F)	\
> @@ -135,7 +136,7 @@ index c268ebc4c6e..4361f3f1563 100644
>  =20
>   static void
>   make_decimal_float_mode (const char *name,
> -@@ -673,7 +673,7 @@ make_decimal_float_mode (const char *name,
> +@@ -690,7 +690,7 @@ make_decimal_float_mode (const char *name,
>   }
>  =20
>   #define RESET_FLOAT_FORMAT(N, F) \
> @@ -144,7 +145,7 @@ index c268ebc4c6e..4361f3f1563 100644
>   static void ATTRIBUTE_UNUSED
>   reset_float_format (const char *name, const char *format,
>   		    const char *file, unsigned int line)
> -@@ -694,7 +694,7 @@ reset_float_format (const char *name, const char *fo=
rmat,
> +@@ -711,7 +711,7 @@ reset_float_format (const char *name, const char *fo=
rmat,
>  =20
>   /* __intN support.  */
>   #define INT_N(M,PREC)				\
> @@ -153,7 +154,7 @@ index c268ebc4c6e..4361f3f1563 100644
>   static void ATTRIBUTE_UNUSED
>   make_int_n (const char *m, int bitsize,
>               const char *file, unsigned int line)
> -@@ -723,7 +723,7 @@ make_int_n (const char *m, int bitsize,
> +@@ -740,7 +740,7 @@ make_int_n (const char *m, int bitsize,
>   /* Partial integer modes are specified by relation to a full integer
>      mode.  */
>   #define PARTIAL_INT_MODE(M,PREC,NAME)				\
> @@ -162,16 +163,16 @@ index c268ebc4c6e..4361f3f1563 100644
>   static void ATTRIBUTE_UNUSED
>   make_partial_integer_mode (const char *base, const char *name,
>   			   unsigned int precision,
> -@@ -750,7 +750,7 @@ make_partial_integer_mode (const char *base, const c=
har *name,
> +@@ -767,7 +767,7 @@ make_partial_integer_mode (const char *base, const c=
har *name,
>   /* A single vector mode can be specified by naming its component
>      mode and the number of components.  */
> - #define VECTOR_MODE(C, M, N) \
> --  make_vector_mode (MODE_##C, #M, N, __FILE__, __LINE__);
> -+  make_vector_mode (MODE_##C, #M, N, __FILE__, 0);
> + #define VECTOR_MODE_WITH_PREFIX(PREFIX, C, M, N, ORDER) \
> +-  make_vector_mode (MODE_##C, #PREFIX, #M, N, ORDER, __FILE__, __LINE__=
);
> ++  make_vector_mode (MODE_##C, #PREFIX, #M, N, ORDER, __FILE__, 0);
> + #define VECTOR_MODE(C, M, N) VECTOR_MODE_WITH_PREFIX(V, C, M, N, 0);
>   static void ATTRIBUTE_UNUSED
>   make_vector_mode (enum mode_class bclass,
> - 		  const char *base,
> -@@ -793,7 +793,7 @@ make_vector_mode (enum mode_class bclass,
> +@@ -814,7 +814,7 @@ make_vector_mode (enum mode_class bclass,
>  =20
>   /* Adjustability.  */
>   #define _ADD_ADJUST(A, M, X, C1, C2) \
> diff --git a/meta/recipes-devtools/gcc/gcc/0041-apply-debug-prefix-maps-b=
efore-checksumming-DIEs.patch b/meta/recipes-devtools/gcc/gcc/0041-apply-de=
bug-prefix-maps-before-checksumming-DIEs.patch
> deleted file mode 100644
> index c8dcd74b9d..0000000000
> --- a/meta/recipes-devtools/gcc/gcc/0041-apply-debug-prefix-maps-before-c=
hecksumming-DIEs.patch
> +++ /dev/null
> @@ -1,95 +0,0 @@
> -From 7cc2df084b7977653a9b59cbc34a9ad500ae619c Mon Sep 17 00:00:00 2001
> -From: Richard Biener <rguenther@suse.de>
> -Date: Tue, 20 Jul 2021 11:00:33 +0200
> -Subject: [PATCH] debug/101473 - apply debug prefix maps before checksumm=
ing DIEs
> -
> -The following makes sure to apply the debug prefix maps to filenames
> -before checksumming DIEs to create the global symbol for the CU DIE
> -used by LTO to link the late debug to the early debug.  This avoids
> -binary differences (in said symbol) when compiling with toolchains
> -installed under a different path and that compensated with appropriate
> --fdebug-prefix-map options.
> -
> -The easiest and most scalable way is to record both the unmapped
> -and the remapped filename in the dwarf_file_data so the remapping
> -process takes place at a single point and only once (otherwise it
> -creates GC garbage at each point doing that).
> -
> -2021-07-20  Richard Biener  <rguenther@suse.de>
> -
> -	PR debug/101473
> -	* dwarf2out.h (dwarf_file_data): Add key member.
> -	* dwarf2out.c (dwarf_file_hasher::equal): Compare key.
> -	(dwarf_file_hasher::hash): Hash key.
> -	(lookup_filename): Remap the filename and store it in the
> -	filename member of dwarf_file_data when creating a new
> -	dwarf_file_data.
> -	(file_name_acquire): Do not remap the filename again.
> -	(maybe_emit_file): Likewise.
> -
> -[YOCTO #14481]
> -
> -Upstream-Status: Backport [https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcomm=
it;h=3D7cc2df084b7977653a9b59cbc34a9ad500ae619c]
> -
> -The upstream patch was modified to compensate for the definition of
> -"struct dwarf_file_data" being in dwarf2out.c rather than dwarf2out.h in
> -this version of gcc.
> -
> -Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
> ----
> -diff -urpN a/gcc/dwarf2out.c b/gcc/dwarf2out.c
> ---- a/gcc/dwarf2out.c	2021-04-27 06:00:13.000000000 -0400
> -+++ b/gcc/dwarf2out.c	2021-07-23 16:40:06.141886167 -0400
> -@@ -1283,6 +1283,7 @@ dwarf2out_switch_text_section (void)
> -=20
> - /* Data about a single source file.  */
> - struct GTY((for_user)) dwarf_file_data {
> -+  const char * key;
> -   const char * filename;
> -   int emitted_number;
> - };
> -@@ -12334,7 +12335,7 @@ file_name_acquire (dwarf_file_data **slo
> -=20
> -   fi =3D fnad->files + fnad->used_files++;
> -=20
> --  f =3D remap_debug_filename (d->filename);
> -+  f =3D d->filename;
> -=20
> -   /* Skip all leading "./".  */
> -   while (f[0] =3D=3D '.' && IS_DIR_SEPARATOR (f[1]))
> -@@ -27231,13 +27232,13 @@ dwarf2out_ignore_block (const_tree block
> - bool
> - dwarf_file_hasher::equal (dwarf_file_data *p1, const char *p2)
> - {
> --  return filename_cmp (p1->filename, p2) =3D=3D 0;
> -+  return filename_cmp (p1->key, p2) =3D=3D 0;
> - }
> -=20
> - hashval_t
> - dwarf_file_hasher::hash (dwarf_file_data *p)
> - {
> --  return htab_hash_string (p->filename);
> -+  return htab_hash_string (p->key);
> - }
> -=20
> - /* Lookup FILE_NAME (in the list of filenames that we know about here in
> -@@ -27267,7 +27268,8 @@ lookup_filename (const char *file_name)
> -     return *slot;
> -=20
> -   created =3D ggc_alloc<dwarf_file_data> ();
> --  created->filename =3D file_name;
> -+  created->key =3D file_name;
> -+  created->filename =3D remap_debug_filename (file_name);
> -   created->emitted_number =3D 0;
> -   *slot =3D created;
> -   return created;
> -@@ -27293,8 +27295,7 @@ maybe_emit_file (struct dwarf_file_data
> -       if (output_asm_line_debug_info ())
> - 	{
> - 	  fprintf (asm_out_file, "\t.file %u ", fd->emitted_number);
> --	  output_quoted_string (asm_out_file,
> --				remap_debug_filename (fd->filename));
> -+	  output_quoted_string (asm_out_file, fd->filename);
> - 	  fputc ('\n', asm_out_file);
> - 	}
> -     }
> diff --git a/meta/recipes-devtools/gcc/gcc/0042-Fix-thread-stack-size-ini=
t.patch b/meta/recipes-devtools/gcc/gcc/0042-Fix-thread-stack-size-init.pat=
ch
> deleted file mode 100644
> index 3fb9ee98de..0000000000
> --- a/meta/recipes-devtools/gcc/gcc/0042-Fix-thread-stack-size-init.patch
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -The patch is needed in order to support recent glibc (2.34).
> -
> -Upstream-Status: Backport [https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcomm=
it;h=3D91f8a7a34cf29ae7c465603a801326767f1cc7e9]
> -
> -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> -
> ----
> ---- a/libsanitizer/sanitizer_common/sanitizer_posix_libcdep.cpp	2022-03-=
15 07:59:54.515325204 -0700
> -+++ b/libsanitizer/sanitizer_common/sanitizer_posix_libcdep.cpp	2022-03-=
15 08:01:45.919405931 -0700
> -@@ -166,9 +166,10 @@
> - #if !SANITIZER_GO
> - // TODO(glider): different tools may require different altstack size.
> - static uptr GetAltStackSize() {
> --  // SIGSTKSZ is not enough.
> --  static const uptr kAltStackSize =3D SIGSTKSZ * 4;
> --  return kAltStackSize;
> -+  // Note: since GLIBC_2.31, SIGSTKSZ may be a function call, so this m=
ay be
> -+  // more costly that you think. However GetAltStackSize is only call 2=
-3 times
> -+  // per thread so don't cache the evaluation.
> -+  return SIGSTKSZ * 4;
> - }
> -=20
> - void SetAlternateSignalStack() {
> diff --git a/meta/recipes-devtools/gcc/gcc_11.2.bb b/meta/recipes-devtool=
s/gcc/gcc_12.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc_11.2.bb
> rename to meta/recipes-devtools/gcc/gcc_12.0.bb
> diff --git a/meta/recipes-devtools/gcc/libgcc-initial_11.2.bb b/meta/reci=
pes-devtools/gcc/libgcc-initial_12.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/libgcc-initial_11.2.bb
> rename to meta/recipes-devtools/gcc/libgcc-initial_12.0.bb
> diff --git a/meta/recipes-devtools/gcc/libgcc_11.2.bb b/meta/recipes-devt=
ools/gcc/libgcc_12.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/libgcc_11.2.bb
> rename to meta/recipes-devtools/gcc/libgcc_12.0.bb
> diff --git a/meta/recipes-devtools/gcc/libgfortran_11.2.bb b/meta/recipes=
-devtools/gcc/libgfortran_12.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/libgfortran_11.2.bb
> rename to meta/recipes-devtools/gcc/libgfortran_12.0.bb
> --=20
> 2.35.1
>=20

>=20
>=20
>=20


--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

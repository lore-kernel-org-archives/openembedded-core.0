Return-Path: <juro.bystricky@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D41B0788C0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 23:49:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2018 15:49:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,448,1515484800"; d="scan'208";a="33821721"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.59])
	by orsmga003.jf.intel.com with ESMTP; 09 Mar 2018 15:49:39 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 15:49:32 -0800
Message-Id: <1520639372-12916-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520639372-12916-1-git-send-email-juro.bystricky@intel.com>
References: <1520639372-12916-1-git-send-email-juro.bystricky@intel.com>
MIME-Version: 1.0
Cc: jurobystricky@hotmail.com
Subject: [morty][PATCH v2] gcc6: Upgrade to 6.4.0 (latest stable series release)
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
X-List-Received-Date: Fri, 09 Mar 2018 23:49:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changed BINV and PV from 6.2.0 to 6.4.0
Modified BASEURI to load xz tarball instead of bz2

The upgrade to 6.4 includes all of the gcc 6.x changes from OE-Core master from
various authors to bring the various releases into sync and ensure all relavent
fixes are present.

Backported series of patches from https://github.com/hjl-tools/gcc.git
branch /hjl/indirect/gcc-6-branch/master which contains
an IA patch series for security related issues

Backported/added several patches to address various ARM and musl build issues:
0001-enable-FL_LPAE-flag-for-armv7ve-cores.patch
0048-sync-gcc-stddef.h-with-musl.patch
0054_all_nopie-all-flags.patch
0055-unwind_h-glibc26.patch
0057-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch

ubsan-fix-check-empty-string.patch : removed, already applied
0048-ARM-PR-target-71056-Don-t-use-vectorized-builtins-wh.patch: removed, already upstreamed
CVE-2016-4490.patch: removed, already upstreamed

Added CVE-2016-6131.patch

Moved all backported patches into a separate folder "backport", as it
is common for other gcc recipes.

(From OE-Core rev: a926f3986174b67375c4486e5b3f27ad3b939e28)

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 ...et-71056-Don-t-use-vectorized-builtins-wh.patch |   92 -
 .../gcc/gcc-6.2/CVE-2016-4490.patch                |  290 ---
 .../gcc/gcc-6.2/ubsan-fix-check-empty-string.patch |   28 -
 .../gcc/{gcc-6.2.inc => gcc-6.4.inc}               |   31 +-
 .../0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch     |    0
 .../{gcc-6.2 => gcc-6.4}/0002-uclibc-conf.patch    |    0
 .../0003-gcc-uclibc-locale-ctype_touplow_t.patch   |    0
 .../{gcc-6.2 => gcc-6.4}/0004-uclibc-locale.patch  |    0
 .../0005-uclibc-locale-no__x.patch                 |    0
 .../0006-uclibc-locale-wchar_fix.patch             |    0
 .../0007-uclibc-locale-update.patch                |    0
 .../0008-missing-execinfo_h.patch                  |    0
 .../{gcc-6.2 => gcc-6.4}/0009-c99-snprintf.patch   |    0
 .../0010-gcc-poison-system-directories.patch       |    0
 .../0011-gcc-poison-dir-extend.patch               |    0
 .../0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |    0
 .../0013-64-bit-multilib-hack.patch                |    0
 .../0014-optional-libstdc.patch                    |    0
 ...0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |    0
 .../0016-COLLECT_GCC_OPTIONS.patch                 |    0
 ...efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch |    0
 .../0018-fortran-cross-compile-hack.patch          |    0
 .../0019-cpp-honor-sysroot.patch                   |    0
 .../0020-MIPS64-Default-to-N64-ABI.patch           |    0
 ...C_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |    0
 ...0022-gcc-Fix-argument-list-too-long-error.patch |    0
 .../{gcc-6.2 => gcc-6.4}/0023-Disable-sdt.patch    |    0
 .../gcc/{gcc-6.2 => gcc-6.4}/0024-libtool.patch    |    0
 ...4-pass-fix-v4bx-to-linker-to-support-EABI.patch |    0
 ...tilib-config-files-from-B-instead-of-usin.patch |    0
 ...-libdir-from-.la-which-usually-points-to-.patch |    0
 .../gcc/{gcc-6.2 => gcc-6.4}/0028-export-CPP.patch |    0
 ...AltiVec-generation-on-powepc-linux-target.patch |    0
 ...-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch |    0
 ...Ensure-target-gcc-headers-can-be-included.patch |    0
 ...-t-build-with-disable-dependency-tracking.patch |    0
 ...h-host-directory-during-relink-if-inst_pr.patch |    0
 ...IBS_DIR-replacement-instead-of-hardcoding.patch |    0
 .../0035-aarch64-Add-support-for-musl-ldso.patch   |    0
 ...ibcc1-fix-libcc1-s-install-path-and-rpath.patch |    0
 ...-handle-sysroot-support-for-nativesdk-gcc.patch |    0
 ...et-sysroot-gcc-version-specific-dirs-with.patch |    0
 ...-various-_FOR_BUILD-and-related-variables.patch |    0
 .../0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch    |    0
 .../{gcc-6.2 => gcc-6.4}/0041-ssp_nonshared.patch  |    0
 ...c-libcpp-support-ffile-prefix-map-old-new.patch |    0
 ...ug-prefix-map-to-replace-ffile-prefix-map.patch |    0
 ...-fdebug-prefix-map-support-to-remap-sourc.patch |    0
 ...45-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch |    0
 ...bgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |    0
 ...e-alias-for-__cpu_indicator_init-instead-.patch |    0
 .../gcc-6.4/0048-sync-gcc-stddef.h-with-musl.patch |   91 +
 .../gcc/gcc-6.4/0054_all_nopie-all-flags.patch     |   22 +
 .../gcc/gcc-6.4/0055-unwind_h-glibc26.patch        |  139 ++
 ...5-suppress-32-bit-aligned-ldrd-strd-peeph.patch |  194 ++
 ...001-enable-FL_LPAE-flag-for-armv7ve-cores.patch |   67 +
 ...ove-struct-ix86_frame-to-machine_function.patch |  247 +++
 ...ference-of-struct-ix86_frame-to-avoid-cop.patch |   74 +
 ...nst-reference-of-struct-ix86_frame-to-avo.patch |  131 ++
 .../backport/0004-x86-Add-mindirect-branch.patch   | 2154 ++++++++++++++++++++
 .../backport/0005-x86-Add-mfunction-return.patch   | 1570 ++++++++++++++
 .../0006-x86-Add-mindirect-branch-register.patch   |  946 +++++++++
 .../0007-x86-Add-V-register-operand-modifier.patch |  139 ++
 ...w-mindirect-branch-mfunction-return-with-.patch |  304 +++
 ...VALID_REGNUM-in-indirect-thunk-processing.patch |  126 ++
 ...INVALID_REGNUM-as-invalid-register-number.patch |   46 +
 ...date-mfunction-return-for-return-with-pop.patch |  453 ++++
 ...-i386-Add-TARGET_INDIRECT_BRANCH_REGISTER.patch | 1004 +++++++++
 ...5-suppress-32-bit-aligned-ldrd-strd-peeph.patch |  194 ++
 .../gcc/gcc-6.4/backport/CVE-2016-6131.patch       |  223 ++
 ...s-canadian_6.2.bb => gcc-cross-canadian_6.4.bb} |    0
 ...oss-initial_6.2.bb => gcc-cross-initial_6.4.bb} |    0
 .../gcc/{gcc-cross_6.2.bb => gcc-cross_6.4.bb}     |    0
 ...-initial_6.2.bb => gcc-crosssdk-initial_6.4.bb} |    0
 .../{gcc-crosssdk_6.2.bb => gcc-crosssdk_6.4.bb}   |    0
 .../gcc/{gcc-runtime_6.2.bb => gcc-runtime_6.4.bb} |    0
 ...gcc-sanitizers_6.2.bb => gcc-sanitizers_6.4.bb} |    0
 .../gcc/{gcc-source_6.2.bb => gcc-source_6.4.bb}   |    0
 .../gcc/{gcc_6.2.bb => gcc_6.4.bb}                 |    0
 ...libgcc-initial_6.2.bb => libgcc-initial_6.4.bb} |    0
 .../gcc/{libgcc_6.2.bb => libgcc_6.4.bb}           |    0
 .../gcc/{libgfortran_6.2.bb => libgfortran_6.4.bb} |    0
 83 files changed, 8149 insertions(+), 418 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.2/0048-ARM-PR-target-71056-Don-t-use-vectorized-builtins-wh.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.2/CVE-2016-4490.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.2/ubsan-fix-check-empty-string.patch
 rename meta/recipes-devtools/gcc/{gcc-6.2.inc => gcc-6.4.inc} (77%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0002-uclibc-conf.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0003-gcc-uclibc-locale-ctype_touplow_t.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0004-uclibc-locale.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0005-uclibc-locale-no__x.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0006-uclibc-locale-wchar_fix.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0007-uclibc-locale-update.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0008-missing-execinfo_h.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0009-c99-snprintf.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0010-gcc-poison-system-directories.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0011-gcc-poison-dir-extend.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0013-64-bit-multilib-hack.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0014-optional-libstdc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0016-COLLECT_GCC_OPTIONS.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0018-fortran-cross-compile-hack.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0019-cpp-honor-sysroot.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0020-MIPS64-Default-to-N64-ABI.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0021-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0022-gcc-Fix-argument-list-too-long-error.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0023-Disable-sdt.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0024-libtool.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0025-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0026-Use-the-multilib-config-files-from-B-instead-of-usin.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0027-Avoid-using-libdir-from-.la-which-usually-points-to-.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0028-export-CPP.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0029-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0030-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0031-Ensure-target-gcc-headers-can-be-included.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0032-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0033-Don-t-search-host-directory-during-relink-if-inst_pr.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0034-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0035-aarch64-Add-support-for-musl-ldso.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0036-libcc1-fix-libcc1-s-install-path-and-rpath.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0037-handle-sysroot-support-for-nativesdk-gcc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0038-Search-target-sysroot-gcc-version-specific-dirs-with.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0039-Fix-various-_FOR_BUILD-and-related-variables.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0041-ssp_nonshared.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0042-gcc-libcpp-support-ffile-prefix-map-old-new.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0043-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0044-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch (100%)
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0048-sync-gcc-stddef.h-with-musl.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0054_all_nopie-all-flags.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0055-unwind_h-glibc26.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0057-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0001-enable-FL_LPAE-flag-for-armv7ve-cores.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0001-i386-Move-struct-ix86_frame-to-machine_function.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0002-i386-Use-reference-of-struct-ix86_frame-to-avoid-cop.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0003-i386-Use-const-reference-of-struct-ix86_frame-to-avo.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0004-x86-Add-mindirect-branch.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0005-x86-Add-mfunction-return.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0006-x86-Add-mindirect-branch-register.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0007-x86-Add-V-register-operand-modifier.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0008-x86-Disallow-mindirect-branch-mfunction-return-with-.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0009-Use-INVALID_REGNUM-in-indirect-thunk-processing.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0010-i386-Pass-INVALID_REGNUM-as-invalid-register-number.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0011-i386-Update-mfunction-return-for-return-with-pop.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0012-i386-Add-TARGET_INDIRECT_BRANCH_REGISTER.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0057-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/CVE-2016-6131.patch
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_6.2.bb => gcc-cross-canadian_6.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross-initial_6.2.bb => gcc-cross-initial_6.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_6.2.bb => gcc-cross_6.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk-initial_6.2.bb => gcc-crosssdk-initial_6.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_6.2.bb => gcc-crosssdk_6.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_6.2.bb => gcc-runtime_6.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_6.2.bb => gcc-sanitizers_6.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_6.2.bb => gcc-source_6.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc_6.2.bb => gcc_6.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_6.2.bb => libgcc-initial_6.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_6.2.bb => libgcc_6.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_6.2.bb => libgfortran_6.4.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index ca3c5ec..c06e352 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -22,7 +22,7 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial = "${TCLIBC}-initial"
 PREFERRED_PROVIDER_virtual/nativesdk-${SDK_PREFIX}libc-initial ?= "nativesdk-glibc-initial"
 PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
-GCCVERSION ?= "6.2%"
+GCCVERSION ?= "6.4%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.27%"
 GDBVERSION ?= "7.11%"
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0048-ARM-PR-target-71056-Don-t-use-vectorized-builtins-wh.patch b/meta/recipes-devtools/gcc/gcc-6.2/0048-ARM-PR-target-71056-Don-t-use-vectorized-builtins-wh.patch
deleted file mode 100644
index 9c39c7f..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.2/0048-ARM-PR-target-71056-Don-t-use-vectorized-builtins-wh.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From 84d2a5509892b65ed60d39e6e2f9719e3762e40e Mon Sep 17 00:00:00 2001
-From: ktkachov <ktkachov@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Tue, 31 May 2016 08:29:39 +0000
-Subject: [PATCH] [ARM] PR target/71056: Don't use vectorized builtins when
- NEON is not available
-
-	PR target/71056
-	* config/arm/arm-builtins.c (arm_builtin_vectorized_function): Return
-	NULL_TREE early if NEON is not available.  Remove now redundant check
-	in ARM_CHECK_BUILTIN_MODE.
-
-	* gcc.target/arm/pr71056.c: New test.
-
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-6-branch@236910 138bc75d-0d04-0410-961f-82ee72b054a4
----
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
- gcc/ChangeLog                          |  7 +++++++
- gcc/config/arm/arm-builtins.c          |  6 +++++-
- gcc/testsuite/ChangeLog                |  5 +++++
- gcc/testsuite/gcc.target/arm/pr71056.c | 32 ++++++++++++++++++++++++++++++++
- 4 files changed, 49 insertions(+), 1 deletion(-)
- create mode 100644 gcc/testsuite/gcc.target/arm/pr71056.c
-
-diff --git a/gcc/config/arm/arm-builtins.c b/gcc/config/arm/arm-builtins.c
-index 90fb40f..68b2839 100644
---- a/gcc/config/arm/arm-builtins.c
-+++ b/gcc/config/arm/arm-builtins.c
-@@ -2861,6 +2861,10 @@ arm_builtin_vectorized_function (unsigned int fn, tree type_out, tree type_in)
-   int in_n, out_n;
-   bool out_unsigned_p = TYPE_UNSIGNED (type_out);
- 
-+  /* Can't provide any vectorized builtins when we can't use NEON.  */
-+  if (!TARGET_NEON)
-+    return NULL_TREE;
-+
-   if (TREE_CODE (type_out) != VECTOR_TYPE
-       || TREE_CODE (type_in) != VECTOR_TYPE)
-     return NULL_TREE;
-@@ -2875,7 +2879,7 @@ arm_builtin_vectorized_function (unsigned int fn, tree type_out, tree type_in)
-    NULL_TREE is returned if no such builtin is available.  */
- #undef ARM_CHECK_BUILTIN_MODE
- #define ARM_CHECK_BUILTIN_MODE(C)    \
--  (TARGET_NEON && TARGET_FPU_ARMV8   \
-+  (TARGET_FPU_ARMV8   \
-    && flag_unsafe_math_optimizations \
-    && ARM_CHECK_BUILTIN_MODE_1 (C))
- 
-diff --git a/gcc/testsuite/gcc.target/arm/pr71056.c b/gcc/testsuite/gcc.target/arm/pr71056.c
-new file mode 100644
-index 0000000..136754e
---- /dev/null
-+++ b/gcc/testsuite/gcc.target/arm/pr71056.c
-@@ -0,0 +1,32 @@
-+/* PR target/71056.  */
-+/* { dg-do compile } */
-+/* { dg-require-effective-target arm_vfp3_ok } */
-+/* { dg-options "-O3 -mfpu=vfpv3" } */
-+
-+/* Check that compiling for a non-NEON target doesn't try to introduce
-+   a NEON vectorized builtin.  */
-+
-+extern char *buff;
-+int f2 ();
-+struct T1
-+{
-+  int reserved[2];
-+  unsigned int ip;
-+  unsigned short cs;
-+  unsigned short rsrv2;
-+};
-+void
-+f3 (const char *p)
-+{
-+  struct T1 x;
-+  __builtin_memcpy (&x, p, sizeof (struct T1));
-+  x.reserved[0] = __builtin_bswap32 (x.reserved[0]);
-+  x.reserved[1] = __builtin_bswap32 (x.reserved[1]);
-+  x.ip = __builtin_bswap32 (x.ip);
-+  x.cs = x.cs << 8 | x.cs >> 8;
-+  x.rsrv2 = x.rsrv2 << 8 | x.rsrv2 >> 8;
-+  if (f2 ())
-+    {
-+      __builtin_memcpy (buff, "\n", 1);
-+    }
-+}
--- 
-2.9.0
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/CVE-2016-4490.patch b/meta/recipes-devtools/gcc/gcc-6.2/CVE-2016-4490.patch
deleted file mode 100644
index f32e91d..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.2/CVE-2016-4490.patch
+++ /dev/null
@@ -1,290 +0,0 @@
-From 7d235b1b5ea35352c54957ef5530d9a02c46962f Mon Sep 17 00:00:00 2001
-From: bernds <bernds@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Mon, 2 May 2016 17:06:40 +0000
-Subject: [PATCH] =?UTF-8?q?Demangler=20integer=20overflow=20fixes=20from?=
- =?UTF-8?q?=20Marcel=20B=C3=B6hme.?=
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-	PR c++/70498
-	* cp-demangle.c: Parse numbers as integer instead of long to avoid
-	overflow after sanity checks. Include <limits.h> if available.
-	(INT_MAX): Define if necessary.
-	(d_make_template_param): Takes integer argument instead of long.
-	(d_make_function_param): Likewise.
-	(d_append_num): Likewise.
-	(d_identifier): Likewise.
-	(d_number): Parse as and return integer.
-	(d_compact_number): Handle overflow.
-	(d_source_name): Change variable type to integer for parsed number.
-	(d_java_resource): Likewise.
-	(d_special_name): Likewise.
-	(d_discriminator): Likewise.
-	(d_unnamed_type): Likewise.
-	* testsuite/demangle-expected: Add regression test cases.
-
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@235767 138bc75d-0d04-0410-961f-82ee72b054a4
-
-Upstream-Status: Backport
-CVE:  CVE-2016-4490
-[Yocto #9632]
-
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- libiberty/ChangeLog                   | 19 +++++++++++++
- libiberty/cp-demangle.c               | 52 ++++++++++++++++++++---------------
- libiberty/testsuite/demangle-expected | 14 ++++++++--
- 3 files changed, 61 insertions(+), 24 deletions(-)
-
-Index: git/libiberty/ChangeLog
-===================================================================
---- git.orig/libiberty/ChangeLog
-+++ git/libiberty/ChangeLog
-@@ -1,3 +1,22 @@
-+2016-05-02  Marcel Böhme  <boehme.marcel@gmail.com>
-+
-+   PR c++/70498
-+   * cp-demangle.c: Parse numbers as integer instead of long to avoid
-+   overflow after sanity checks. Include <limits.h> if available.
-+   (INT_MAX): Define if necessary.
-+   (d_make_template_param): Takes integer argument instead of long.
-+   (d_make_function_param): Likewise.
-+   (d_append_num): Likewise.
-+   (d_identifier): Likewise.
-+   (d_number): Parse as and return integer.
-+   (d_compact_number): Handle overflow.
-+   (d_source_name): Change variable type to integer for parsed number.
-+   (d_java_resource): Likewise.
-+   (d_special_name): Likewise.
-+   (d_discriminator): Likewise.
-+   (d_unnamed_type): Likewise.
-+   * testsuite/demangle-expected: Add regression test cases.
-+
- 2016-04-27  Release Manager
- 
- 	* GCC 6.1.0 released.
-Index: git/libiberty/cp-demangle.c
-===================================================================
---- git.orig/libiberty/cp-demangle.c
-+++ git/libiberty/cp-demangle.c
-@@ -128,6 +128,13 @@ extern char *alloca ();
- # endif /* alloca */
- #endif /* HAVE_ALLOCA_H */
- 
-+#ifdef HAVE_LIMITS_H
-+#include <limits.h>
-+#endif
-+#ifndef INT_MAX
-+# define INT_MAX       (int)(((unsigned int) ~0) >> 1)          /* 0x7FFFFFFF */
-+#endif
-+
- #include "ansidecl.h"
- #include "libiberty.h"
- #include "demangle.h"
-@@ -398,7 +405,7 @@ d_make_dtor (struct d_info *, enum gnu_v
-              struct demangle_component *);
- 
- static struct demangle_component *
--d_make_template_param (struct d_info *, long);
-+d_make_template_param (struct d_info *, int);
- 
- static struct demangle_component *
- d_make_sub (struct d_info *, const char *, int);
-@@ -421,9 +428,9 @@ static struct demangle_component *d_unqu
- 
- static struct demangle_component *d_source_name (struct d_info *);
- 
--static long d_number (struct d_info *);
-+static int d_number (struct d_info *);
- 
--static struct demangle_component *d_identifier (struct d_info *, long);
-+static struct demangle_component *d_identifier (struct d_info *, int);
- 
- static struct demangle_component *d_operator_name (struct d_info *);
- 
-@@ -1119,7 +1126,7 @@ d_make_dtor (struct d_info *di, enum gnu
- /* Add a new template parameter.  */
- 
- static struct demangle_component *
--d_make_template_param (struct d_info *di, long i)
-+d_make_template_param (struct d_info *di, int i)
- {
-   struct demangle_component *p;
- 
-@@ -1135,7 +1142,7 @@ d_make_template_param (struct d_info *di
- /* Add a new function parameter.  */
- 
- static struct demangle_component *
--d_make_function_param (struct d_info *di, long i)
-+d_make_function_param (struct d_info *di, int i)
- {
-   struct demangle_component *p;
- 
-@@ -1620,7 +1627,7 @@ d_unqualified_name (struct d_info *di)
- static struct demangle_component *
- d_source_name (struct d_info *di)
- {
--  long len;
-+  int len;
-   struct demangle_component *ret;
- 
-   len = d_number (di);
-@@ -1633,12 +1640,12 @@ d_source_name (struct d_info *di)
- 
- /* number ::= [n] <(non-negative decimal integer)>  */
- 
--static long
-+static int
- d_number (struct d_info *di)
- {
-   int negative;
-   char peek;
--  long ret;
-+  int ret;
- 
-   negative = 0;
-   peek = d_peek_char (di);
-@@ -1681,7 +1688,7 @@ d_number_component (struct d_info *di)
- /* identifier ::= <(unqualified source code identifier)>  */
- 
- static struct demangle_component *
--d_identifier (struct d_info *di, long len)
-+d_identifier (struct d_info *di, int len)
- {
-   const char *name;
- 
-@@ -1702,7 +1709,7 @@ d_identifier (struct d_info *di, long le
-   /* Look for something which looks like a gcc encoding of an
-      anonymous namespace, and replace it with a more user friendly
-      name.  */
--  if (len >= (long) ANONYMOUS_NAMESPACE_PREFIX_LEN + 2
-+  if (len >= (int) ANONYMOUS_NAMESPACE_PREFIX_LEN + 2
-       && memcmp (name, ANONYMOUS_NAMESPACE_PREFIX,
- 		 ANONYMOUS_NAMESPACE_PREFIX_LEN) == 0)
-     {
-@@ -1870,7 +1877,7 @@ d_java_resource (struct d_info *di)
- {
-   struct demangle_component *p = NULL;
-   struct demangle_component *next = NULL;
--  long len, i;
-+  int len, i;
-   char c;
-   const char *str;
- 
-@@ -2012,7 +2019,7 @@ d_special_name (struct d_info *di)
- 	case 'C':
- 	  {
- 	    struct demangle_component *derived_type;
--	    long offset;
-+	    int offset;
- 	    struct demangle_component *base_type;
- 
- 	    derived_type = cplus_demangle_type (di);
-@@ -2946,10 +2953,10 @@ d_pointer_to_member_type (struct d_info
- 
- /* <non-negative number> _ */
- 
--static long
-+static int
- d_compact_number (struct d_info *di)
- {
--  long num;
-+  int num;
-   if (d_peek_char (di) == '_')
-     num = 0;
-   else if (d_peek_char (di) == 'n')
-@@ -2957,7 +2964,7 @@ d_compact_number (struct d_info *di)
-   else
-     num = d_number (di) + 1;
- 
--  if (! d_check_char (di, '_'))
-+  if (num < 0 || ! d_check_char (di, '_'))
-     return -1;
-   return num;
- }
-@@ -2969,7 +2976,7 @@ d_compact_number (struct d_info *di)
- static struct demangle_component *
- d_template_param (struct d_info *di)
- {
--  long param;
-+  int param;
- 
-   if (! d_check_char (di, 'T'))
-     return NULL;
-@@ -3171,9 +3178,10 @@ d_expression_1 (struct d_info *di)
- 	}
-       else
- 	{
--	  index = d_compact_number (di) + 1;
--	  if (index == 0)
-+	  index = d_compact_number (di);
-+	  if (index == INT_MAX || index == -1)
- 	    return NULL;
-+	  index ++;
- 	}
-       return d_make_function_param (di, index);
-     }
-@@ -3502,7 +3510,7 @@ d_local_name (struct d_info *di)
- static int
- d_discriminator (struct d_info *di)
- {
--  long discrim;
-+  int discrim;
- 
-   if (d_peek_char (di) != '_')
-     return 1;
-@@ -3558,7 +3566,7 @@ static struct demangle_component *
- d_unnamed_type (struct d_info *di)
- {
-   struct demangle_component *ret;
--  long num;
-+  int num;
- 
-   if (! d_check_char (di, 'U'))
-     return NULL;
-@@ -4086,10 +4094,10 @@ d_append_string (struct d_print_info *dp
- }
- 
- static inline void
--d_append_num (struct d_print_info *dpi, long l)
-+d_append_num (struct d_print_info *dpi, int l)
- {
-   char buf[25];
--  sprintf (buf,"%ld", l);
-+  sprintf (buf,"%d", l);
-   d_append_string (dpi, buf);
- }
- 
-Index: git/libiberty/testsuite/demangle-expected
-===================================================================
---- git.orig/libiberty/testsuite/demangle-expected
-+++ git/libiberty/testsuite/demangle-expected
-@@ -4422,12 +4422,22 @@ void baz<int>(A<sizeof (foo((int)(), (fl
- _Z3fooI1FEN1XIXszdtcl1PclcvT__EEE5arrayEE4TypeEv
- X<sizeof ((P(((F)())())).array)>::Type foo<F>()
- #
--# Tests a use-after-free problem
-+# Tests a use-after-free problem PR70481
- 
- _Q.__0
- ::Q.(void)
- #
--# Tests a use-after-free problem
-+# Tests a use-after-free problem PR70481
- 
- _Q10-__9cafebabe.
- cafebabe.::-(void)
-+#
-+# Tests integer overflow problem PR70492
-+
-+__vt_90000000000cafebabe
-+__vt_90000000000cafebabe
-+#
-+# Tests write access violation PR70498
-+
-+_Z80800000000000000000000
-+_Z80800000000000000000000
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/ubsan-fix-check-empty-string.patch b/meta/recipes-devtools/gcc/gcc-6.2/ubsan-fix-check-empty-string.patch
deleted file mode 100644
index c012719..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.2/ubsan-fix-check-empty-string.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 8db2cf6353c13f2a84cbe49b689654897906c499 Mon Sep 17 00:00:00 2001
-From: kyukhin <kyukhin@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Sat, 3 Sep 2016 10:57:05 +0000
-Subject: [PATCH] gcc/ 	* ubsan.c (ubsan_use_new_style_p): Fix check for empty
- string.
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@239971 138bc75d-0d04-0410-961f-82ee72b054a4
-
-Upstream-Status: Backport
-Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
-
----
- gcc/ubsan.c   | 2 +-
- 2 files changed, 5 insertions(+), 1 deletion(-)
-
-Index: gcc-6.3.0/gcc/ubsan.c
-===================================================================
---- gcc-6.3.0.orig/gcc/ubsan.c
-+++ gcc-6.3.0/gcc/ubsan.c
-@@ -1471,7 +1471,7 @@ ubsan_use_new_style_p (location_t loc)
- 
-   expanded_location xloc = expand_location (loc);
-   if (xloc.file == NULL || strncmp (xloc.file, "\1", 2) == 0
--      || xloc.file == '\0' || xloc.file[0] == '\xff'
-+      || xloc.file[0] == '\0' || xloc.file[0] == '\xff'
-       || xloc.file[1] == '\xff')
-     return false;
- 
diff --git a/meta/recipes-devtools/gcc/gcc-6.2.inc b/meta/recipes-devtools/gcc/gcc-6.4.inc
similarity index 77%
rename from meta/recipes-devtools/gcc/gcc-6.2.inc
rename to meta/recipes-devtools/gcc/gcc-6.4.inc
index 39ae653..3f3ed3b 100644
--- a/meta/recipes-devtools/gcc/gcc-6.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-6.4.inc
@@ -2,13 +2,13 @@ require gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
 
-PV = "6.2.0"
+PV = "6.4.0"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "6.2.0"
+BINV = "6.4.0"
 
-FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-6.2:${FILE_DIRNAME}/gcc-6.2/backport:"
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-6.4:${FILE_DIRNAME}/gcc-6.4/backport:"
 
 DEPENDS =+ "mpfr gmp libmpc zlib"
 NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native"
@@ -24,7 +24,7 @@ LIC_FILES_CHKSUM = "\
 "
 
 
-BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2"
+BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
 #SRCREV = "bd9a826d5448db11d29d2ec5884e7e679066f140"
 #BASEURI ?= "git://github.com/gcc-mirror/gcc;branch=gcc-6-branch;protocol=git"
 #BASEURI ?= "ftp://sourceware.org/pub/gcc/snapshots/6.2.0-RC-20160815/gcc-6.2.0-RC-20160815.tar.bz2"
@@ -78,13 +78,30 @@ SRC_URI = "\
            file://0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch \
            file://0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch \
            file://0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
+           file://0048-sync-gcc-stddef.h-with-musl.patch \
+           file://0054_all_nopie-all-flags.patch \
+           file://0055-unwind_h-glibc26.patch \
            ${BACKPORTS} \
 "
 BACKPORTS = "\
-           file://ubsan-fix-check-empty-string.patch \
+           file://CVE-2016-6131.patch \
+           file://0057-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch \
+           file://0001-enable-FL_LPAE-flag-for-armv7ve-cores.patch \
+           file://0001-i386-Move-struct-ix86_frame-to-machine_function.patch \
+           file://0002-i386-Use-reference-of-struct-ix86_frame-to-avoid-cop.patch \
+           file://0003-i386-Use-const-reference-of-struct-ix86_frame-to-avo.patch \
+           file://0004-x86-Add-mindirect-branch.patch \
+           file://0005-x86-Add-mfunction-return.patch \
+           file://0006-x86-Add-mindirect-branch-register.patch \
+           file://0007-x86-Add-V-register-operand-modifier.patch \
+           file://0008-x86-Disallow-mindirect-branch-mfunction-return-with-.patch \
+           file://0009-Use-INVALID_REGNUM-in-indirect-thunk-processing.patch \
+           file://0010-i386-Pass-INVALID_REGNUM-as-invalid-register-number.patch \
+           file://0011-i386-Update-mfunction-return-for-return-with-pop.patch \
+           file://0012-i386-Add-TARGET_INDIRECT_BRANCH_REGISTER.patch \
 "
-SRC_URI[md5sum] = "9768625159663b300ae4de2f4745fcc4"
-SRC_URI[sha256sum] = "9944589fc722d3e66308c0ce5257788ebd7872982a718aa2516123940671b7c5"
+SRC_URI[md5sum] = "11ba51a0cfb8471927f387c8895fe232"
+SRC_URI[sha256sum] = "850bf21eafdfe5cd5f6827148184c08c4a0852a37ccf36ce69855334d2c914d4"
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 #S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/git"
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-6.4/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0002-uclibc-conf.patch b/meta/recipes-devtools/gcc/gcc-6.4/0002-uclibc-conf.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0002-uclibc-conf.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0002-uclibc-conf.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0003-gcc-uclibc-locale-ctype_touplow_t.patch b/meta/recipes-devtools/gcc/gcc-6.4/0003-gcc-uclibc-locale-ctype_touplow_t.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0003-gcc-uclibc-locale-ctype_touplow_t.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0003-gcc-uclibc-locale-ctype_touplow_t.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0004-uclibc-locale.patch b/meta/recipes-devtools/gcc/gcc-6.4/0004-uclibc-locale.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0004-uclibc-locale.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0004-uclibc-locale.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0005-uclibc-locale-no__x.patch b/meta/recipes-devtools/gcc/gcc-6.4/0005-uclibc-locale-no__x.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0005-uclibc-locale-no__x.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0005-uclibc-locale-no__x.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0006-uclibc-locale-wchar_fix.patch b/meta/recipes-devtools/gcc/gcc-6.4/0006-uclibc-locale-wchar_fix.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0006-uclibc-locale-wchar_fix.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0006-uclibc-locale-wchar_fix.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0007-uclibc-locale-update.patch b/meta/recipes-devtools/gcc/gcc-6.4/0007-uclibc-locale-update.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0007-uclibc-locale-update.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0007-uclibc-locale-update.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0008-missing-execinfo_h.patch b/meta/recipes-devtools/gcc/gcc-6.4/0008-missing-execinfo_h.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0008-missing-execinfo_h.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0008-missing-execinfo_h.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0009-c99-snprintf.patch b/meta/recipes-devtools/gcc/gcc-6.4/0009-c99-snprintf.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0009-c99-snprintf.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0009-c99-snprintf.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0010-gcc-poison-system-directories.patch b/meta/recipes-devtools/gcc/gcc-6.4/0010-gcc-poison-system-directories.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0010-gcc-poison-system-directories.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0010-gcc-poison-system-directories.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0011-gcc-poison-dir-extend.patch b/meta/recipes-devtools/gcc/gcc-6.4/0011-gcc-poison-dir-extend.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0011-gcc-poison-dir-extend.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0011-gcc-poison-dir-extend.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-6.4/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0013-64-bit-multilib-hack.patch b/meta/recipes-devtools/gcc/gcc-6.4/0013-64-bit-multilib-hack.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0013-64-bit-multilib-hack.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0013-64-bit-multilib-hack.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0014-optional-libstdc.patch b/meta/recipes-devtools/gcc/gcc-6.4/0014-optional-libstdc.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0014-optional-libstdc.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0014-optional-libstdc.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch b/meta/recipes-devtools/gcc/gcc-6.4/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0016-COLLECT_GCC_OPTIONS.patch b/meta/recipes-devtools/gcc/gcc-6.4/0016-COLLECT_GCC_OPTIONS.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0016-COLLECT_GCC_OPTIONS.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0016-COLLECT_GCC_OPTIONS.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch b/meta/recipes-devtools/gcc/gcc-6.4/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0018-fortran-cross-compile-hack.patch b/meta/recipes-devtools/gcc/gcc-6.4/0018-fortran-cross-compile-hack.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0018-fortran-cross-compile-hack.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0018-fortran-cross-compile-hack.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0019-cpp-honor-sysroot.patch b/meta/recipes-devtools/gcc/gcc-6.4/0019-cpp-honor-sysroot.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0019-cpp-honor-sysroot.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0019-cpp-honor-sysroot.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0020-MIPS64-Default-to-N64-ABI.patch b/meta/recipes-devtools/gcc/gcc-6.4/0020-MIPS64-Default-to-N64-ABI.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0020-MIPS64-Default-to-N64-ABI.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0020-MIPS64-Default-to-N64-ABI.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0021-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc-6.4/0021-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0021-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0021-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0022-gcc-Fix-argument-list-too-long-error.patch b/meta/recipes-devtools/gcc/gcc-6.4/0022-gcc-Fix-argument-list-too-long-error.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0022-gcc-Fix-argument-list-too-long-error.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0022-gcc-Fix-argument-list-too-long-error.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0023-Disable-sdt.patch b/meta/recipes-devtools/gcc/gcc-6.4/0023-Disable-sdt.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0023-Disable-sdt.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0023-Disable-sdt.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0024-libtool.patch b/meta/recipes-devtools/gcc/gcc-6.4/0024-libtool.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0024-libtool.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0024-libtool.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0025-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc-6.4/0025-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0025-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0025-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0026-Use-the-multilib-config-files-from-B-instead-of-usin.patch b/meta/recipes-devtools/gcc/gcc-6.4/0026-Use-the-multilib-config-files-from-B-instead-of-usin.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0026-Use-the-multilib-config-files-from-B-instead-of-usin.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0026-Use-the-multilib-config-files-from-B-instead-of-usin.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0027-Avoid-using-libdir-from-.la-which-usually-points-to-.patch b/meta/recipes-devtools/gcc/gcc-6.4/0027-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0027-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0027-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0028-export-CPP.patch b/meta/recipes-devtools/gcc/gcc-6.4/0028-export-CPP.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0028-export-CPP.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0028-export-CPP.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0029-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch b/meta/recipes-devtools/gcc/gcc-6.4/0029-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0029-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0029-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0030-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch b/meta/recipes-devtools/gcc/gcc-6.4/0030-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0030-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0030-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0031-Ensure-target-gcc-headers-can-be-included.patch b/meta/recipes-devtools/gcc/gcc-6.4/0031-Ensure-target-gcc-headers-can-be-included.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0031-Ensure-target-gcc-headers-can-be-included.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0031-Ensure-target-gcc-headers-can-be-included.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0032-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch b/meta/recipes-devtools/gcc/gcc-6.4/0032-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0032-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0032-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0033-Don-t-search-host-directory-during-relink-if-inst_pr.patch b/meta/recipes-devtools/gcc/gcc-6.4/0033-Don-t-search-host-directory-during-relink-if-inst_pr.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0033-Don-t-search-host-directory-during-relink-if-inst_pr.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0033-Don-t-search-host-directory-during-relink-if-inst_pr.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0034-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch b/meta/recipes-devtools/gcc/gcc-6.4/0034-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0034-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0034-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0035-aarch64-Add-support-for-musl-ldso.patch b/meta/recipes-devtools/gcc/gcc-6.4/0035-aarch64-Add-support-for-musl-ldso.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0035-aarch64-Add-support-for-musl-ldso.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0035-aarch64-Add-support-for-musl-ldso.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0036-libcc1-fix-libcc1-s-install-path-and-rpath.patch b/meta/recipes-devtools/gcc/gcc-6.4/0036-libcc1-fix-libcc1-s-install-path-and-rpath.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0036-libcc1-fix-libcc1-s-install-path-and-rpath.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0036-libcc1-fix-libcc1-s-install-path-and-rpath.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0037-handle-sysroot-support-for-nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc-6.4/0037-handle-sysroot-support-for-nativesdk-gcc.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0037-handle-sysroot-support-for-nativesdk-gcc.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0037-handle-sysroot-support-for-nativesdk-gcc.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0038-Search-target-sysroot-gcc-version-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gcc-6.4/0038-Search-target-sysroot-gcc-version-specific-dirs-with.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0038-Search-target-sysroot-gcc-version-specific-dirs-with.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0038-Search-target-sysroot-gcc-version-specific-dirs-with.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0039-Fix-various-_FOR_BUILD-and-related-variables.patch b/meta/recipes-devtools/gcc/gcc-6.4/0039-Fix-various-_FOR_BUILD-and-related-variables.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0039-Fix-various-_FOR_BUILD-and-related-variables.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0039-Fix-various-_FOR_BUILD-and-related-variables.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch b/meta/recipes-devtools/gcc/gcc-6.4/0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0041-ssp_nonshared.patch b/meta/recipes-devtools/gcc/gcc-6.4/0041-ssp_nonshared.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0041-ssp_nonshared.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0041-ssp_nonshared.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0042-gcc-libcpp-support-ffile-prefix-map-old-new.patch b/meta/recipes-devtools/gcc/gcc-6.4/0042-gcc-libcpp-support-ffile-prefix-map-old-new.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0042-gcc-libcpp-support-ffile-prefix-map-old-new.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0042-gcc-libcpp-support-ffile-prefix-map-old-new.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0043-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch b/meta/recipes-devtools/gcc/gcc-6.4/0043-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0043-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0043-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0044-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch b/meta/recipes-devtools/gcc/gcc-6.4/0044-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0044-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0044-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch b/meta/recipes-devtools/gcc/gcc-6.4/0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch b/meta/recipes-devtools/gcc/gcc-6.4/0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch b/meta/recipes-devtools/gcc/gcc-6.4/0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0048-sync-gcc-stddef.h-with-musl.patch b/meta/recipes-devtools/gcc/gcc-6.4/0048-sync-gcc-stddef.h-with-musl.patch
new file mode 100644
index 0000000..30c158d
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.4/0048-sync-gcc-stddef.h-with-musl.patch
@@ -0,0 +1,91 @@
+From 10595c03c39b4e980d2a00e16fc84e9caf82292e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 3 Feb 2017 12:56:00 -0800
+Subject: [PATCH 48/48] sync gcc stddef.h with musl
+
+musl defines ptrdiff_t size_t and wchar_t
+so dont define them here if musl is definining them
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ gcc/ginclude/stddef.h | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/gcc/ginclude/stddef.h b/gcc/ginclude/stddef.h
+index d711530d053..c315b7a97c1 100644
+--- a/gcc/ginclude/stddef.h
++++ b/gcc/ginclude/stddef.h
+@@ -134,6 +134,7 @@ _TYPE_wchar_t;
+ #ifndef ___int_ptrdiff_t_h
+ #ifndef _GCC_PTRDIFF_T
+ #ifndef _PTRDIFF_T_DECLARED /* DragonFly */
++#ifndef __DEFINED_ptrdiff_t /* musl */
+ #define _PTRDIFF_T
+ #define _T_PTRDIFF_
+ #define _T_PTRDIFF
+@@ -143,10 +144,12 @@ _TYPE_wchar_t;
+ #define ___int_ptrdiff_t_h
+ #define _GCC_PTRDIFF_T
+ #define _PTRDIFF_T_DECLARED
++#define __DEFINED_ptrdiff_t /* musl */
+ #ifndef __PTRDIFF_TYPE__
+ #define __PTRDIFF_TYPE__ long int
+ #endif
+ typedef __PTRDIFF_TYPE__ ptrdiff_t;
++#endif /* __DEFINED_ptrdiff_t */
+ #endif /* _PTRDIFF_T_DECLARED */
+ #endif /* _GCC_PTRDIFF_T */
+ #endif /* ___int_ptrdiff_t_h */
+@@ -184,6 +187,7 @@ typedef __PTRDIFF_TYPE__ ptrdiff_t;
+ #ifndef _GCC_SIZE_T
+ #ifndef _SIZET_
+ #ifndef __size_t
++#ifndef __DEFINED_size_t /* musl */
+ #define __size_t__	/* BeOS */
+ #define __SIZE_T__	/* Cray Unicos/Mk */
+ #define _SIZE_T
+@@ -200,6 +204,7 @@ typedef __PTRDIFF_TYPE__ ptrdiff_t;
+ #define ___int_size_t_h
+ #define _GCC_SIZE_T
+ #define _SIZET_
++#define __DEFINED_size_t /* musl */
+ #if (defined (__FreeBSD__) && (__FreeBSD__ >= 5)) \
+   || defined(__DragonFly__) \
+   || defined(__FreeBSD_kernel__)
+@@ -235,6 +240,7 @@ typedef long ssize_t;
+ #endif /* _SIZE_T */
+ #endif /* __SIZE_T__ */
+ #endif /* __size_t__ */
++#endif /* __DEFINED_size_t */
+ #undef	__need_size_t
+ #endif /* _STDDEF_H or __need_size_t.  */
+ 
+@@ -264,6 +270,7 @@ typedef long ssize_t;
+ #ifndef ___int_wchar_t_h
+ #ifndef __INT_WCHAR_T_H
+ #ifndef _GCC_WCHAR_T
++#ifndef __DEFINED_wchar_t /* musl */
+ #define __wchar_t__	/* BeOS */
+ #define __WCHAR_T__	/* Cray Unicos/Mk */
+ #define _WCHAR_T
+@@ -279,6 +286,7 @@ typedef long ssize_t;
+ #define __INT_WCHAR_T_H
+ #define _GCC_WCHAR_T
+ #define _WCHAR_T_DECLARED
++#define __DEFINED_wchar_t /* musl */
+ 
+ /* On BSD/386 1.1, at least, machine/ansi.h defines _BSD_WCHAR_T_
+    instead of _WCHAR_T_, and _BSD_RUNE_T_ (which, unlike the other
+@@ -344,6 +352,7 @@ typedef __WCHAR_TYPE__ wchar_t;
+ #endif
+ #endif /* __WCHAR_T__ */
+ #endif /* __wchar_t__ */
++#endif /* __DEFINED_wchar_t musl */
+ #undef	__need_wchar_t
+ #endif /* _STDDEF_H or __need_wchar_t.  */
+ 
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0054_all_nopie-all-flags.patch b/meta/recipes-devtools/gcc/gcc-6.4/0054_all_nopie-all-flags.patch
new file mode 100644
index 0000000..73ab950
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.4/0054_all_nopie-all-flags.patch
@@ -0,0 +1,22 @@
+Need to pass NO_PIE_CFLAGS to ALL_* so gcc doesn't fail when
+we compile it with older gcc and pie.
+
+Upstream-Status: Inappropriate [configuration]
+
+Maintained by: Gentoo Toolchain Project <toolchain@gentoo.org>
+Signed-off-by: Stephen Arnold <stephen.arnold42@gmail.com>
+
+--- a/gcc/Makefile.in	2015-06-25 19:18:12.000000000 +0200
++++ b/gcc/Makefile.in	2016-04-22 00:12:54.029178860 +0200
+@@ -991,10 +991,10 @@ ALL_CXXFLAGS = $(T_CFLAGS) $(CFLAGS-$@)
+ ALL_CPPFLAGS = $(INCLUDES) $(CPPFLAGS)
+
+ # This is the variable to use when using $(COMPILER).
+-ALL_COMPILERFLAGS = $(ALL_CXXFLAGS)
++ALL_COMPILERFLAGS = $(NO_PIE_CFLAGS) $(ALL_CXXFLAGS)
+
+ # This is the variable to use when using $(LINKER).
+-ALL_LINKERFLAGS = $(ALL_CXXFLAGS)
++ALL_LINKERFLAGS = $(NO_PIE_CFLAGS) $(ALL_CXXFLAGS)
+
+ # Build and host support libraries.
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0055-unwind_h-glibc26.patch b/meta/recipes-devtools/gcc/gcc-6.4/0055-unwind_h-glibc26.patch
new file mode 100644
index 0000000..c266cfe
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.4/0055-unwind_h-glibc26.patch
@@ -0,0 +1,139 @@
+Backport and edit of patches from:
+https://gcc.gnu.org/viewcvs/gcc?limit_changes=0&view=revision&revision=249957
+by jsm28 (Joseph Myers)
+
+Current glibc no longer gives the ucontext_t type the tag struct
+ucontext, to conform with POSIX namespace rules.  This requires
+various linux-unwind.h files in libgcc, that were previously using
+struct ucontext, to be fixed to use ucontext_t instead.  This is
+similar to the removal of the struct siginfo tag from siginfo_t some
+years ago.
+
+This patch changes those files to use ucontext_t instead.  As the
+standard name that should be unconditionally safe, so this is not
+restricted to architectures supported by glibc, or conditioned on the
+glibc version.
+
+Upstream-Status: Backport
+
+Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
+
+--- branches/gcc-6-branch/libgcc/config/aarch64/linux-unwind.h	2017/07/04 10:22:56	249956
+--- b/libgcc/config/aarch64/linux-unwind.h	2017/07/04 10:23:57	249957
+@@ -52,7 +52,7 @@
+   struct rt_sigframe
+   {
+     siginfo_t info;
+-    struct ucontext uc;
++    ucontext_t uc;
+   };
+ 
+   struct rt_sigframe *rt_;
+--- branches/gcc-6-branch/libgcc/config/alpha/linux-unwind.h	2017/07/04 10:22:56	249956
+--- b/libgcc/config/alpha/linux-unwind.h	2017/07/04 10:23:57	249957
+@@ -51,7 +51,7 @@
+     {
+       struct rt_sigframe {
+ 	siginfo_t info;
+-	struct ucontext uc;
++	ucontext_t uc;
+       } *rt_ = context->cfa;
+       sc = &rt_->uc.uc_mcontext;
+     }
+--- branches/gcc-6-branch/libgcc/config/bfin/linux-unwind.h	2017/07/04 10:22:56	249956
+--- b/libgcc/config/bfin/linux-unwind.h	2017/07/04 10:23:57	249957
+@@ -52,7 +52,7 @@
+ 	void *puc;
+ 	char retcode[8];
+ 	siginfo_t info;
+-	struct ucontext uc;
++	ucontext_t uc;
+       } *rt_ = context->cfa;
+ 
+       /* The void * cast is necessary to avoid an aliasing warning.
+--- branches/gcc-6-branch/libgcc/config/i386/linux-unwind.h	2017/07/04 10:22:56	249956
+--- b/libgcc/config/i386/linux-unwind.h	2017/07/04 10:23:57	249957
+@@ -58,7 +58,7 @@
+   if (*(unsigned char *)(pc+0) == 0x48
+       && *(unsigned long long *)(pc+1) == RT_SIGRETURN_SYSCALL)
+     {
+-      struct ucontext *uc_ = context->cfa;
++      ucontext_t *uc_ = context->cfa;
+       /* The void * cast is necessary to avoid an aliasing warning.
+          The aliasing warning is correct, but should not be a problem
+          because it does not alias anything.  */
+@@ -138,7 +138,7 @@
+ 	siginfo_t *pinfo;
+ 	void *puc;
+ 	siginfo_t info;
+-	struct ucontext uc;
++	ucontext_t uc;
+       } *rt_ = context->cfa;
+       /* The void * cast is necessary to avoid an aliasing warning.
+          The aliasing warning is correct, but should not be a problem
+--- branches/gcc-6-branch/libgcc/config/m68k/linux-unwind.h	2017/07/04 10:22:56	249956
+--- b/libgcc/config/m68k/linux-unwind.h	2017/07/04 10:23:57	249957
+@@ -33,7 +33,7 @@
+ /* <sys/ucontext.h> is unfortunately broken right now.  */
+ struct uw_ucontext {
+ 	unsigned long	  uc_flags;
+-	struct ucontext  *uc_link;
++	ucontext_t	 *uc_link;
+ 	stack_t		  uc_stack;
+ 	mcontext_t	  uc_mcontext;
+ 	unsigned long	  uc_filler[80];
+--- branches/gcc-6-branch/libgcc/config/nios2/linux-unwind.h	2017/07/04 10:22:56	249956
+--- b/libgcc/config/nios2/linux-unwind.h	2017/07/04 10:23:57	249957
+@@ -38,7 +38,7 @@
+ 
+ struct nios2_ucontext {
+   unsigned long uc_flags;
+-  struct ucontext *uc_link;
++  ucontext_t *uc_link;
+   stack_t uc_stack;
+   struct nios2_mcontext uc_mcontext;
+   sigset_t uc_sigmask;	/* mask last for extensibility */
+--- branches/gcc-6-branch/libgcc/config/pa/linux-unwind.h	2017/07/04 10:22:56	249956
+--- b/libgcc/config/pa/linux-unwind.h	2017/07/04 10:23:57	249957
+@@ -80,7 +80,7 @@
+   struct sigcontext *sc;
+   struct rt_sigframe {
+     siginfo_t info;
+-    struct ucontext uc;
++    ucontext_t uc;
+   } *frame;
+ 
+   /* rt_sigreturn trampoline:
+--- branches/gcc-6-branch/libgcc/config/sh/linux-unwind.h	2017/07/04 10:22:56	249956
+--- b/libgcc/config/sh/linux-unwind.h	2017/07/04 10:23:57	249957
+@@ -180,7 +180,7 @@
+     {
+       struct rt_sigframe {
+ 	siginfo_t info;
+-	struct ucontext uc;
++	ucontext_t uc;
+       } *rt_ = context->cfa;
+       /* The void * cast is necessary to avoid an aliasing warning.
+          The aliasing warning is correct, but should not be a problem
+--- branches/gcc-6-branch/libgcc/config/tilepro/linux-unwind.h	2017/07/04 10:22:56	249956
+--- b/libgcc/config/tilepro/linux-unwind.h	2017/07/04 10:23:57	249957
+@@ -61,7 +61,7 @@
+   struct rt_sigframe {
+     unsigned char save_area[C_ABI_SAVE_AREA_SIZE];
+     siginfo_t info;
+-    struct ucontext uc;
++    ucontext_t uc;
+   } *rt_;
+ 
+   /* Return if this is not a signal handler.  */
+--- branches/gcc-6-branch/libgcc/config/xtensa/linux-unwind.h	2017/07/04 10:22:56	249956
+--- b/libgcc/config/xtensa/linux-unwind.h	2017/07/04 10:23:57	249957
+@@ -67,7 +67,7 @@
+ 
+   struct rt_sigframe {
+     siginfo_t info;
+-    struct ucontext uc;
++    ucontext_t uc;
+   } *rt_;
+ 
+   /* movi a2, __NR_rt_sigreturn; syscall */
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0057-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch b/meta/recipes-devtools/gcc/gcc-6.4/0057-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch
new file mode 100644
index 0000000..0214ab8
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.4/0057-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch
@@ -0,0 +1,194 @@
+From ad5bf450aef2ffee6d57ed193fabc5f72f8eaa65 Mon Sep 17 00:00:00 2001
+From: rearnsha <rearnsha@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Thu, 19 Oct 2017 13:16:42 +0000
+Subject: [PATCH] [ARM] PR 82445 - suppress 32-bit aligned ldrd/strd peepholing
+ with -mno-unaligned-access
+
+Peephole patterns exist in the arm backend to spot load/store
+operations to adjacent memory operations in order to convert them into
+ldrd/strd instructions.  However, when we have strict alignment
+enforced, then we can only do this if the accesses are known to be
+64-bit aligned; this is unlikely to be the case for most loads.  The
+patch adds some alignment checking to the code that validates the
+addresses for use in the peephole patterns.  This should also fix
+incorrect generation of ldrd/strd with unaligned accesses that could
+previously have occurred on ARMv5e where all such operations must be
+64-bit aligned.
+
+I've added some new tests as well.  In doing so I discovered that the
+ldrd/strd peephole tests could never fail since they would match the
+source file name in the scanned assembly as well as any instructions
+of the intended type.  I've fixed those by tightening the scan results
+slightly.
+
+gcc:
+
+* config/arm/arm.c (align_ok_ldrd_strd): New function.
+(mem_ok_for_ldrd_strd): New parameter align.  Extract the alignment of the
+mem into it.
+(gen_operands_ldrd_strd): Validate the alignment of the accesses.
+
+testsuite:
+
+* gcc.target/arm/peep-ldrd-1.c: Tighten test scan pattern.
+* gcc.target/arm/peep-strd-1.c: Likewise.
+* gcc.target/arm/peep-ldrd-2.c: New test.
+* gcc.target/arm/peep-strd-2.c: New test.
+
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-6-branch@253892 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ gcc/ChangeLog                                      |  8 +++++++
+ gcc/config/arm/arm.c                               | 27 ++++++++++++++++++----
+ gcc/testsuite/ChangeLog                            |  8 +++++++
+ gcc/testsuite/gcc.target/arm/peep-ldrd-1.c         |  2 +-
+ .../arm/{peep-ldrd-1.c => peep-ldrd-2.c}           |  4 ++--
+ gcc/testsuite/gcc.target/arm/peep-strd-1.c         |  2 +-
+ .../arm/{peep-strd-1.c => peep-strd-2.c}           |  4 ++--
+ 7 files changed, 44 insertions(+), 11 deletions(-)
+ copy gcc/testsuite/gcc.target/arm/{peep-ldrd-1.c => peep-ldrd-2.c} (63%)
+ copy gcc/testsuite/gcc.target/arm/{peep-strd-1.c => peep-strd-2.c} (58%)
+
+diff --git a/gcc/config/arm/arm.c b/gcc/config/arm/arm.c
+index 9c0813d598d..e3da9f77fb6 100644
+--- a/gcc/config/arm/arm.c
++++ b/gcc/config/arm/arm.c
+@@ -15926,12 +15926,23 @@ operands_ok_ldrd_strd (rtx rt, rtx rt2, rtx rn, HOST_WIDE_INT offset,
+   return true;
+ }
+ 
++/* Return true if a 64-bit access with alignment ALIGN and with a
++   constant offset OFFSET from the base pointer is permitted on this
++   architecture.  */
++static bool
++align_ok_ldrd_strd (HOST_WIDE_INT align, HOST_WIDE_INT offset)
++{
++  return (unaligned_access
++	  ? (align >= BITS_PER_WORD && (offset & 3) == 0)
++	  : (align >= 2 * BITS_PER_WORD && (offset & 7) == 0));
++}
++
+ /* Helper for gen_operands_ldrd_strd.  Returns true iff the memory
+    operand MEM's address contains an immediate offset from the base
+-   register and has no side effects, in which case it sets BASE and
+-   OFFSET accordingly.  */
++   register and has no side effects, in which case it sets BASE,
++   OFFSET and ALIGN accordingly.  */
+ static bool
+-mem_ok_for_ldrd_strd (rtx mem, rtx *base, rtx *offset)
++mem_ok_for_ldrd_strd (rtx mem, rtx *base, rtx *offset, HOST_WIDE_INT *align)
+ {
+   rtx addr;
+ 
+@@ -15950,6 +15961,7 @@ mem_ok_for_ldrd_strd (rtx mem, rtx *base, rtx *offset)
+   gcc_assert (MEM_P (mem));
+ 
+   *offset = const0_rtx;
++  *align = MEM_ALIGN (mem);
+ 
+   addr = XEXP (mem, 0);
+ 
+@@ -15990,7 +16002,7 @@ gen_operands_ldrd_strd (rtx *operands, bool load,
+                         bool const_store, bool commute)
+ {
+   int nops = 2;
+-  HOST_WIDE_INT offsets[2], offset;
++  HOST_WIDE_INT offsets[2], offset, align[2];
+   rtx base = NULL_RTX;
+   rtx cur_base, cur_offset, tmp;
+   int i, gap;
+@@ -16002,7 +16014,8 @@ gen_operands_ldrd_strd (rtx *operands, bool load,
+      registers, and the corresponding memory offsets.  */
+   for (i = 0; i < nops; i++)
+     {
+-      if (!mem_ok_for_ldrd_strd (operands[nops+i], &cur_base, &cur_offset))
++      if (!mem_ok_for_ldrd_strd (operands[nops+i], &cur_base, &cur_offset,
++				 &align[i]))
+         return false;
+ 
+       if (i == 0)
+@@ -16114,6 +16127,7 @@ gen_operands_ldrd_strd (rtx *operands, bool load,
+       /* Swap the instructions such that lower memory is accessed first.  */
+       std::swap (operands[0], operands[1]);
+       std::swap (operands[2], operands[3]);
++      std::swap (align[0], align[1]);
+       if (const_store)
+         std::swap (operands[4], operands[5]);
+     }
+@@ -16127,6 +16141,9 @@ gen_operands_ldrd_strd (rtx *operands, bool load,
+   if (gap != 4)
+     return false;
+ 
++  if (!align_ok_ldrd_strd (align[0], offset))
++    return false;
++
+   /* Make sure we generate legal instructions.  */
+   if (operands_ok_ldrd_strd (operands[0], operands[1], base, offset,
+                              false, load))
+diff --git a/gcc/testsuite/gcc.target/arm/peep-ldrd-1.c b/gcc/testsuite/gcc.target/arm/peep-ldrd-1.c
+index eb2b86ee7b6..d49eff6b87e 100644
+--- a/gcc/testsuite/gcc.target/arm/peep-ldrd-1.c
++++ b/gcc/testsuite/gcc.target/arm/peep-ldrd-1.c
+@@ -8,4 +8,4 @@ int foo(int a, int b, int* p, int *q)
+   *p = a;
+   return a;
+ }
+-/* { dg-final { scan-assembler "ldrd" } } */
++/* { dg-final { scan-assembler "ldrd\\t" } } */
+diff --git a/gcc/testsuite/gcc.target/arm/peep-ldrd-1.c b/gcc/testsuite/gcc.target/arm/peep-ldrd-2.c
+similarity index 63%
+copy from gcc/testsuite/gcc.target/arm/peep-ldrd-1.c
+copy to gcc/testsuite/gcc.target/arm/peep-ldrd-2.c
+index eb2b86ee7b6..6822c2b1454 100644
+--- a/gcc/testsuite/gcc.target/arm/peep-ldrd-1.c
++++ b/gcc/testsuite/gcc.target/arm/peep-ldrd-2.c
+@@ -1,6 +1,6 @@
+ /* { dg-do compile } */
+ /* { dg-require-effective-target arm_prefer_ldrd_strd } */
+-/* { dg-options "-O2" }  */
++/* { dg-options "-O2 -mno-unaligned-access" }  */
+ int foo(int a, int b, int* p, int *q)
+ {
+   a = p[2] + p[3];
+@@ -8,4 +8,4 @@ int foo(int a, int b, int* p, int *q)
+   *p = a;
+   return a;
+ }
+-/* { dg-final { scan-assembler "ldrd" } } */
++/* { dg-final { scan-assembler-not "ldrd\\t" } } */
+diff --git a/gcc/testsuite/gcc.target/arm/peep-strd-1.c b/gcc/testsuite/gcc.target/arm/peep-strd-1.c
+index bd330769599..fe1beac7229 100644
+--- a/gcc/testsuite/gcc.target/arm/peep-strd-1.c
++++ b/gcc/testsuite/gcc.target/arm/peep-strd-1.c
+@@ -6,4 +6,4 @@ void foo(int a, int b, int* p)
+   p[2] = a;
+   p[3] = b;
+ }
+-/* { dg-final { scan-assembler "strd" } } */
++/* { dg-final { scan-assembler "strd\\t" } } */
+diff --git a/gcc/testsuite/gcc.target/arm/peep-strd-1.c b/gcc/testsuite/gcc.target/arm/peep-strd-2.c
+similarity index 58%
+copy from gcc/testsuite/gcc.target/arm/peep-strd-1.c
+copy to gcc/testsuite/gcc.target/arm/peep-strd-2.c
+index bd330769599..bfc5ebe9eec 100644
+--- a/gcc/testsuite/gcc.target/arm/peep-strd-1.c
++++ b/gcc/testsuite/gcc.target/arm/peep-strd-2.c
+@@ -1,9 +1,9 @@
+ /* { dg-do compile } */
+ /* { dg-require-effective-target arm_prefer_ldrd_strd } */
+-/* { dg-options "-O2" }  */
++/* { dg-options "-O2 -mno-unaligned-access" }  */
+ void foo(int a, int b, int* p)
+ {
+   p[2] = a;
+   p[3] = b;
+ }
+-/* { dg-final { scan-assembler "strd" } } */
++/* { dg-final { scan-assembler-not "strd\\t" } } */
+-- 
+2.15.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/backport/0001-enable-FL_LPAE-flag-for-armv7ve-cores.patch b/meta/recipes-devtools/gcc/gcc-6.4/backport/0001-enable-FL_LPAE-flag-for-armv7ve-cores.patch
new file mode 100644
index 0000000..9ee029c
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.4/backport/0001-enable-FL_LPAE-flag-for-armv7ve-cores.patch
@@ -0,0 +1,67 @@
+From 22fcc126fad61a8e9ddaaabbc8036644273642dc Mon Sep 17 00:00:00 2001
+From: ktkachov <ktkachov@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Thu, 9 Nov 2017 14:34:28 +0000
+Subject: [PATCH] enable FL_LPAE flag for armv7ve cores
+
+The following commit added the FL_LPAE flag to FL_FOR_ARCH7VE, but
+neglected to also add it to the armv7ve compatible cores defined in
+arm-cores.def.
+
+  https://github.com/gcc-mirror/gcc/commit/af2d9b9e58e8be576c53d94f30c48c68146b0c98
+
+The result is that gcc 6.4 now refuses to allow -march=armv7ve and
+-mcpu=XXX to be used together, even when -mcpu is set to an armv7ve
+compatible core:
+
+  arm-linux-gnueabi-gcc -march=armv7ve -mcpu=cortex-a7 -Werror ...
+  error: switch -mcpu=cortex-a7 conflicts with -march=armv7ve switch [-Werror]
+
+Fix by defining flags for armv7ve compatible cores directly from
+FL_FOR_ARCH7VE, rather than re-creating the armv7ve flags
+independently by combining FL_FOR_ARCH7A with the armv7ve specific
+FL_THUMB_DIV and FL_ARM_DIV flags.
+
+UpStream-Status: Backport
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-6-branch@254584 138bc75d-0d04-0410-961f-82ee72b054a4
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ gcc/config/arm/arm-cores.def | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/gcc/config/arm/arm-cores.def b/gcc/config/arm/arm-cores.def
+index 829b839..ca37e6f 100644
+--- a/gcc/config/arm/arm-cores.def
++++ b/gcc/config/arm/arm-cores.def
+@@ -145,12 +145,12 @@ ARM_CORE("cortex-m0plus.small-multiply",cortexm0plussmallmultiply, cortexm0plus,
+ /* V7 Architecture Processors */
+ ARM_CORE("generic-armv7-a",	genericv7a, genericv7a,		7A,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_FOR_ARCH7A), cortex)
+ ARM_CORE("cortex-a5",		cortexa5, cortexa5,		7A,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_FOR_ARCH7A), cortex_a5)
+-ARM_CORE("cortex-a7",		cortexa7, cortexa7,		7A,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_THUMB_DIV | FL_ARM_DIV | FL_FOR_ARCH7A), cortex_a7)
++ARM_CORE("cortex-a7",		cortexa7, cortexa7,		7A,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_FOR_ARCH7VE), cortex_a7)
+ ARM_CORE("cortex-a8",		cortexa8, cortexa8,		7A,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_FOR_ARCH7A), cortex_a8)
+ ARM_CORE("cortex-a9",		cortexa9, cortexa9,		7A,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_FOR_ARCH7A), cortex_a9)
+-ARM_CORE("cortex-a12",		cortexa12, cortexa17,		7A,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_THUMB_DIV | FL_ARM_DIV | FL_FOR_ARCH7A), cortex_a12)
+-ARM_CORE("cortex-a15",		cortexa15, cortexa15,		7A,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_THUMB_DIV | FL_ARM_DIV | FL_FOR_ARCH7A), cortex_a15)
+-ARM_CORE("cortex-a17",		cortexa17, cortexa17,		7A,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_THUMB_DIV | FL_ARM_DIV | FL_FOR_ARCH7A), cortex_a12)
++ARM_CORE("cortex-a12",		cortexa12, cortexa17,		7A,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_FOR_ARCH7VE), cortex_a12)
++ARM_CORE("cortex-a15",		cortexa15, cortexa15,		7A,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_FOR_ARCH7VE), cortex_a15)
++ARM_CORE("cortex-a17",		cortexa17, cortexa17,		7A,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_FOR_ARCH7VE), cortex_a12)
+ ARM_CORE("cortex-r4",		cortexr4, cortexr4,		7R,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_FOR_ARCH7R), cortex)
+ ARM_CORE("cortex-r4f",		cortexr4f, cortexr4f,		7R,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_FOR_ARCH7R), cortex)
+ ARM_CORE("cortex-r5",		cortexr5, cortexr5,		7R,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_ARM_DIV | FL_FOR_ARCH7R), cortex)
+@@ -162,8 +162,8 @@ ARM_CORE("cortex-m3",		cortexm3, cortexm3,		7M,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED |
+ ARM_CORE("marvell-pj4",		marvell_pj4, marvell_pj4,	7A,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_FOR_ARCH7A), marvell_pj4)
+ 
+ /* V7 big.LITTLE implementations */
+-ARM_CORE("cortex-a15.cortex-a7", cortexa15cortexa7, cortexa7,	7A,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_THUMB_DIV | FL_ARM_DIV | FL_FOR_ARCH7A), cortex_a15)
+-ARM_CORE("cortex-a17.cortex-a7", cortexa17cortexa7, cortexa7,	7A,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_THUMB_DIV | FL_ARM_DIV | FL_FOR_ARCH7A), cortex_a12)
++ARM_CORE("cortex-a15.cortex-a7", cortexa15cortexa7, cortexa7,	7A,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_FOR_ARCH7VE), cortex_a15)
++ARM_CORE("cortex-a17.cortex-a7", cortexa17cortexa7, cortexa7,	7A,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_FOR_ARCH7VE), cortex_a12)
+ 
+ /* V8 Architecture Processors */
+ ARM_CORE("cortex-a32",	cortexa32, cortexa53,	8A,	ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_CRC32 | FL_FOR_ARCH8A), cortex_a35)
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/backport/0001-i386-Move-struct-ix86_frame-to-machine_function.patch b/meta/recipes-devtools/gcc/gcc-6.4/backport/0001-i386-Move-struct-ix86_frame-to-machine_function.patch
new file mode 100644
index 0000000..00b0ffd
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.4/backport/0001-i386-Move-struct-ix86_frame-to-machine_function.patch
@@ -0,0 +1,247 @@
+From c2c7775c5587dc59b6756162d390d89d60971a16 Mon Sep 17 00:00:00 2001
+From: hjl <hjl@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Mon, 15 Jan 2018 11:27:24 +0000
+Subject: [PATCH 01/12] i386: Move struct ix86_frame to machine_function
+
+Make ix86_frame available to i386 code generation.  This is needed to
+backport the patch set of -mindirect-branch= to mitigate variant #2 of
+the speculative execution vulnerabilities on x86 processors identified
+by CVE-2017-5715, aka Spectre.
+
+	Backport from mainline
+	2017-06-01  Bernd Edlinger  <bernd.edlinger@hotmail.de>
+
+	* config/i386/i386.c (ix86_frame): Moved to ...
+	* config/i386/i386.h (ix86_frame): Here.
+	(machine_function): Add frame.
+	* config/i386/i386.c (ix86_compute_frame_layout): Repace the
+	frame argument with &cfun->machine->frame.
+	(ix86_can_use_return_insn_p): Don't pass &frame to
+	ix86_compute_frame_layout.  Copy frame from cfun->machine->frame.
+	(ix86_can_eliminate): Likewise.
+	(ix86_expand_prologue): Likewise.
+	(ix86_expand_epilogue): Likewise.
+	(ix86_expand_split_stack_prologue): Likewise.
+
+
+Upstream-Status: Pending
+
+Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
+
+---
+ gcc/config/i386/i386.c | 68 ++++++++++----------------------------------------
+ gcc/config/i386/i386.h | 53 ++++++++++++++++++++++++++++++++++++++-
+ 2 files changed, 65 insertions(+), 56 deletions(-)
+
+diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c
+index 8b5faac..a1ff32b 100644
+--- a/gcc/config/i386/i386.c
++++ b/gcc/config/i386/i386.c
+@@ -2434,53 +2434,6 @@ struct GTY(()) stack_local_entry {
+   struct stack_local_entry *next;
+ };
+ 
+-/* Structure describing stack frame layout.
+-   Stack grows downward:
+-
+-   [arguments]
+-					<- ARG_POINTER
+-   saved pc
+-
+-   saved static chain			if ix86_static_chain_on_stack
+-
+-   saved frame pointer			if frame_pointer_needed
+-					<- HARD_FRAME_POINTER
+-   [saved regs]
+-					<- regs_save_offset
+-   [padding0]
+-
+-   [saved SSE regs]
+-					<- sse_regs_save_offset
+-   [padding1]          |
+-		       |		<- FRAME_POINTER
+-   [va_arg registers]  |
+-		       |
+-   [frame]	       |
+-		       |
+-   [padding2]	       | = to_allocate
+-					<- STACK_POINTER
+-  */
+-struct ix86_frame
+-{
+-  int nsseregs;
+-  int nregs;
+-  int va_arg_size;
+-  int red_zone_size;
+-  int outgoing_arguments_size;
+-
+-  /* The offsets relative to ARG_POINTER.  */
+-  HOST_WIDE_INT frame_pointer_offset;
+-  HOST_WIDE_INT hard_frame_pointer_offset;
+-  HOST_WIDE_INT stack_pointer_offset;
+-  HOST_WIDE_INT hfp_save_offset;
+-  HOST_WIDE_INT reg_save_offset;
+-  HOST_WIDE_INT sse_reg_save_offset;
+-
+-  /* When save_regs_using_mov is set, emit prologue using
+-     move instead of push instructions.  */
+-  bool save_regs_using_mov;
+-};
+-
+ /* Which cpu are we scheduling for.  */
+ enum attr_cpu ix86_schedule;
+ 
+@@ -2572,7 +2525,7 @@ static unsigned int ix86_function_arg_boundary (machine_mode,
+ 						const_tree);
+ static rtx ix86_static_chain (const_tree, bool);
+ static int ix86_function_regparm (const_tree, const_tree);
+-static void ix86_compute_frame_layout (struct ix86_frame *);
++static void ix86_compute_frame_layout (void);
+ static bool ix86_expand_vector_init_one_nonzero (bool, machine_mode,
+ 						 rtx, rtx, int);
+ static void ix86_add_new_builtins (HOST_WIDE_INT);
+@@ -10944,7 +10897,8 @@ ix86_can_use_return_insn_p (void)
+   if (crtl->args.pops_args && crtl->args.size >= 32768)
+     return 0;
+ 
+-  ix86_compute_frame_layout (&frame);
++  ix86_compute_frame_layout ();
++  frame = cfun->machine->frame;
+   return (frame.stack_pointer_offset == UNITS_PER_WORD
+ 	  && (frame.nregs + frame.nsseregs) == 0);
+ }
+@@ -11355,8 +11309,8 @@ ix86_can_eliminate (const int from, const int to)
+ HOST_WIDE_INT
+ ix86_initial_elimination_offset (int from, int to)
+ {
+-  struct ix86_frame frame;
+-  ix86_compute_frame_layout (&frame);
++  ix86_compute_frame_layout ();
++  struct ix86_frame frame = cfun->machine->frame;
+ 
+   if (from == ARG_POINTER_REGNUM && to == HARD_FRAME_POINTER_REGNUM)
+     return frame.hard_frame_pointer_offset;
+@@ -11395,8 +11349,9 @@ ix86_builtin_setjmp_frame_value (void)
+ /* Fill structure ix86_frame about frame of currently computed function.  */
+ 
+ static void
+-ix86_compute_frame_layout (struct ix86_frame *frame)
++ix86_compute_frame_layout (void)
+ {
++  struct ix86_frame *frame = &cfun->machine->frame;
+   unsigned HOST_WIDE_INT stack_alignment_needed;
+   HOST_WIDE_INT offset;
+   unsigned HOST_WIDE_INT preferred_alignment;
+@@ -12702,7 +12657,8 @@ ix86_expand_prologue (void)
+   m->fs.sp_offset = INCOMING_FRAME_SP_OFFSET;
+   m->fs.sp_valid = true;
+ 
+-  ix86_compute_frame_layout (&frame);
++  ix86_compute_frame_layout ();
++  frame = m->frame;
+ 
+   if (!TARGET_64BIT && ix86_function_ms_hook_prologue (current_function_decl))
+     {
+@@ -13379,7 +13335,8 @@ ix86_expand_epilogue (int style)
+   bool using_drap;
+ 
+   ix86_finalize_stack_realign_flags ();
+-  ix86_compute_frame_layout (&frame);
++  ix86_compute_frame_layout ();
++  frame = m->frame;
+ 
+   m->fs.sp_valid = (!frame_pointer_needed
+ 		    || (crtl->sp_is_unchanging
+@@ -13876,7 +13833,8 @@ ix86_expand_split_stack_prologue (void)
+   gcc_assert (flag_split_stack && reload_completed);
+ 
+   ix86_finalize_stack_realign_flags ();
+-  ix86_compute_frame_layout (&frame);
++  ix86_compute_frame_layout ();
++  frame = cfun->machine->frame;
+   allocate = frame.stack_pointer_offset - INCOMING_FRAME_SP_OFFSET;
+ 
+   /* This is the label we will branch to if we have enough stack
+diff --git a/gcc/config/i386/i386.h b/gcc/config/i386/i386.h
+index 8113f83..5414416 100644
+--- a/gcc/config/i386/i386.h
++++ b/gcc/config/i386/i386.h
+@@ -2427,9 +2427,56 @@ enum avx_u128_state
+ 
+ #define FASTCALL_PREFIX '@'
+ 
++#ifndef USED_FOR_TARGET
++/* Structure describing stack frame layout.
++   Stack grows downward:
++
++   [arguments]
++					<- ARG_POINTER
++   saved pc
++
++   saved static chain			if ix86_static_chain_on_stack
++
++   saved frame pointer			if frame_pointer_needed
++					<- HARD_FRAME_POINTER
++   [saved regs]
++					<- regs_save_offset
++   [padding0]
++
++   [saved SSE regs]
++					<- sse_regs_save_offset
++   [padding1]          |
++		       |		<- FRAME_POINTER
++   [va_arg registers]  |
++		       |
++   [frame]	       |
++		       |
++   [padding2]	       | = to_allocate
++					<- STACK_POINTER
++  */
++struct GTY(()) ix86_frame
++{
++  int nsseregs;
++  int nregs;
++  int va_arg_size;
++  int red_zone_size;
++  int outgoing_arguments_size;
++
++  /* The offsets relative to ARG_POINTER.  */
++  HOST_WIDE_INT frame_pointer_offset;
++  HOST_WIDE_INT hard_frame_pointer_offset;
++  HOST_WIDE_INT stack_pointer_offset;
++  HOST_WIDE_INT hfp_save_offset;
++  HOST_WIDE_INT reg_save_offset;
++  HOST_WIDE_INT sse_reg_save_offset;
++
++  /* When save_regs_using_mov is set, emit prologue using
++     move instead of push instructions.  */
++  bool save_regs_using_mov;
++};
++
+ /* Machine specific frame tracking during prologue/epilogue generation.  */
+ 
+-#ifndef USED_FOR_TARGET
+ struct GTY(()) machine_frame_state
+ {
+   /* This pair tracks the currently active CFA as reg+offset.  When reg
+@@ -2475,6 +2522,9 @@ struct GTY(()) machine_function {
+   int varargs_fpr_size;
+   int optimize_mode_switching[MAX_386_ENTITIES];
+ 
++  /* Cached initial frame layout for the current function.  */
++  struct ix86_frame frame;
++
+   /* Number of saved registers USE_FAST_PROLOGUE_EPILOGUE
+      has been computed for.  */
+   int use_fast_prologue_epilogue_nregs;
+@@ -2554,6 +2604,7 @@ struct GTY(()) machine_function {
+ #define ix86_current_function_calls_tls_descriptor \
+   (ix86_tls_descriptor_calls_expanded_in_cfun && df_regs_ever_live_p (SP_REG))
+ #define ix86_static_chain_on_stack (cfun->machine->static_chain_on_stack)
++#define ix86_red_zone_size (cfun->machine->frame.red_zone_size)
+ 
+ /* Control behavior of x86_file_start.  */
+ #define X86_FILE_START_VERSION_DIRECTIVE false
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/backport/0002-i386-Use-reference-of-struct-ix86_frame-to-avoid-cop.patch b/meta/recipes-devtools/gcc/gcc-6.4/backport/0002-i386-Use-reference-of-struct-ix86_frame-to-avoid-cop.patch
new file mode 100644
index 0000000..df65b08
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.4/backport/0002-i386-Use-reference-of-struct-ix86_frame-to-avoid-cop.patch
@@ -0,0 +1,74 @@
+From fe2b3be3f4b6ec6b3a6f89c26016a3983b7cb351 Mon Sep 17 00:00:00 2001
+From: hjl <hjl@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Mon, 15 Jan 2018 11:28:44 +0000
+Subject: [PATCH 02/12] i386: Use reference of struct ix86_frame to avoid copy
+
+When there is no need to make a copy of ix86_frame, we can use reference
+of struct ix86_frame to avoid copy.
+
+	Backport from mainline
+	2017-11-06  H.J. Lu  <hongjiu.lu@intel.com>
+
+	* config/i386/i386.c (ix86_can_use_return_insn_p): Use reference
+	of struct ix86_frame.
+	(ix86_initial_elimination_offset): Likewise.
+	(ix86_expand_split_stack_prologue): Likewise.
+
+Upstream-Status: Pending
+
+Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
+
+---
+ gcc/config/i386/i386.c | 8 +++-----
+ 1 file changed, 3 insertions(+), 5 deletions(-)
+
+diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c
+index a1ff32b..13ebf10 100644
+--- a/gcc/config/i386/i386.c
++++ b/gcc/config/i386/i386.c
+@@ -10887,7 +10887,6 @@ symbolic_reference_mentioned_p (rtx op)
+ bool
+ ix86_can_use_return_insn_p (void)
+ {
+-  struct ix86_frame frame;
+ 
+   if (! reload_completed || frame_pointer_needed)
+     return 0;
+@@ -10898,7 +10897,7 @@ ix86_can_use_return_insn_p (void)
+     return 0;
+ 
+   ix86_compute_frame_layout ();
+-  frame = cfun->machine->frame;
++  struct ix86_frame &frame = cfun->machine->frame;
+   return (frame.stack_pointer_offset == UNITS_PER_WORD
+ 	  && (frame.nregs + frame.nsseregs) == 0);
+ }
+@@ -11310,7 +11309,7 @@ HOST_WIDE_INT
+ ix86_initial_elimination_offset (int from, int to)
+ {
+   ix86_compute_frame_layout ();
+-  struct ix86_frame frame = cfun->machine->frame;
++  struct ix86_frame &frame = cfun->machine->frame;
+ 
+   if (from == ARG_POINTER_REGNUM && to == HARD_FRAME_POINTER_REGNUM)
+     return frame.hard_frame_pointer_offset;
+@@ -13821,7 +13820,6 @@ static GTY(()) rtx split_stack_fn_large;
+ void
+ ix86_expand_split_stack_prologue (void)
+ {
+-  struct ix86_frame frame;
+   HOST_WIDE_INT allocate;
+   unsigned HOST_WIDE_INT args_size;
+   rtx_code_label *label;
+@@ -13834,7 +13832,7 @@ ix86_expand_split_stack_prologue (void)
+ 
+   ix86_finalize_stack_realign_flags ();
+   ix86_compute_frame_layout ();
+-  frame = cfun->machine->frame;
++  struct ix86_frame &frame = cfun->machine->frame;
+   allocate = frame.stack_pointer_offset - INCOMING_FRAME_SP_OFFSET;
+ 
+   /* This is the label we will branch to if we have enough stack
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/backport/0003-i386-Use-const-reference-of-struct-ix86_frame-to-avo.patch b/meta/recipes-devtools/gcc/gcc-6.4/backport/0003-i386-Use-const-reference-of-struct-ix86_frame-to-avo.patch
new file mode 100644
index 0000000..a5ffd85
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.4/backport/0003-i386-Use-const-reference-of-struct-ix86_frame-to-avo.patch
@@ -0,0 +1,131 @@
+From 82243732dc63e9b90396a5ae4ad99ca36af81355 Mon Sep 17 00:00:00 2001
+From: hjl <hjl@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Sat, 27 Jan 2018 13:10:24 +0000
+Subject: [PATCH 03/12] i386: Use const reference of struct ix86_frame to avoid
+ copy
+
+We can use const reference of struct ix86_frame to avoid making a local
+copy of ix86_frame.  ix86_expand_epilogue makes a local copy of struct
+ix86_frame and uses the reg_save_offset field as a local variable.  This
+patch uses a separate local variable for reg_save_offset.
+
+Tested on x86-64 with ada.
+
+	Backport from mainline
+	PR target/83905
+	* config/i386/i386.c (ix86_expand_prologue): Use cost reference
+	of struct ix86_frame.
+	(ix86_expand_epilogue): Likewise.  Add a local variable for
+	the reg_save_offset field in struct ix86_frame.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-7-branch@257123 138bc75d-0d04-0410-961f-82ee72b054a4
+
+Upstream-Status: Pending
+
+Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
+
+---
+ gcc/config/i386/i386.c | 24 ++++++++++++------------
+ 1 file changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c
+index 13ebf10..6c98f75 100644
+--- a/gcc/config/i386/i386.c
++++ b/gcc/config/i386/i386.c
+@@ -12633,7 +12633,6 @@ ix86_expand_prologue (void)
+ {
+   struct machine_function *m = cfun->machine;
+   rtx insn, t;
+-  struct ix86_frame frame;
+   HOST_WIDE_INT allocate;
+   bool int_registers_saved;
+   bool sse_registers_saved;
+@@ -12657,7 +12656,7 @@ ix86_expand_prologue (void)
+   m->fs.sp_valid = true;
+ 
+   ix86_compute_frame_layout ();
+-  frame = m->frame;
++  const struct ix86_frame &frame = cfun->machine->frame;
+ 
+   if (!TARGET_64BIT && ix86_function_ms_hook_prologue (current_function_decl))
+     {
+@@ -13329,13 +13328,12 @@ ix86_expand_epilogue (int style)
+ {
+   struct machine_function *m = cfun->machine;
+   struct machine_frame_state frame_state_save = m->fs;
+-  struct ix86_frame frame;
+   bool restore_regs_via_mov;
+   bool using_drap;
+ 
+   ix86_finalize_stack_realign_flags ();
+   ix86_compute_frame_layout ();
+-  frame = m->frame;
++  const struct ix86_frame &frame = cfun->machine->frame;
+ 
+   m->fs.sp_valid = (!frame_pointer_needed
+ 		    || (crtl->sp_is_unchanging
+@@ -13377,11 +13375,13 @@ ix86_expand_epilogue (int style)
+ 				  + UNITS_PER_WORD);
+     }
+ 
++  HOST_WIDE_INT reg_save_offset = frame.reg_save_offset;
++
+   /* Special care must be taken for the normal return case of a function
+      using eh_return: the eax and edx registers are marked as saved, but
+      not restored along this path.  Adjust the save location to match.  */
+   if (crtl->calls_eh_return && style != 2)
+-    frame.reg_save_offset -= 2 * UNITS_PER_WORD;
++    reg_save_offset -= 2 * UNITS_PER_WORD;
+ 
+   /* EH_RETURN requires the use of moves to function properly.  */
+   if (crtl->calls_eh_return)
+@@ -13397,11 +13397,11 @@ ix86_expand_epilogue (int style)
+   else if (TARGET_EPILOGUE_USING_MOVE
+ 	   && cfun->machine->use_fast_prologue_epilogue
+ 	   && (frame.nregs > 1
+-	       || m->fs.sp_offset != frame.reg_save_offset))
++	       || m->fs.sp_offset != reg_save_offset))
+     restore_regs_via_mov = true;
+   else if (frame_pointer_needed
+ 	   && !frame.nregs
+-	   && m->fs.sp_offset != frame.reg_save_offset)
++	   && m->fs.sp_offset != reg_save_offset)
+     restore_regs_via_mov = true;
+   else if (frame_pointer_needed
+ 	   && TARGET_USE_LEAVE
+@@ -13439,7 +13439,7 @@ ix86_expand_epilogue (int style)
+       rtx t;
+ 
+       if (frame.nregs)
+-	ix86_emit_restore_regs_using_mov (frame.reg_save_offset, style == 2);
++	ix86_emit_restore_regs_using_mov (reg_save_offset, style == 2);
+ 
+       /* eh_return epilogues need %ecx added to the stack pointer.  */
+       if (style == 2)
+@@ -13529,19 +13529,19 @@ ix86_expand_epilogue (int style)
+ 	 epilogues.  */
+       if (!m->fs.sp_valid
+  	  || (TARGET_SEH
+-	      && (m->fs.sp_offset - frame.reg_save_offset
++	      && (m->fs.sp_offset - reg_save_offset
+ 		  >= SEH_MAX_FRAME_SIZE)))
+ 	{
+ 	  pro_epilogue_adjust_stack (stack_pointer_rtx, hard_frame_pointer_rtx,
+ 				     GEN_INT (m->fs.fp_offset
+-					      - frame.reg_save_offset),
++					      - reg_save_offset),
+ 				     style, false);
+ 	}
+-      else if (m->fs.sp_offset != frame.reg_save_offset)
++      else if (m->fs.sp_offset != reg_save_offset)
+ 	{
+ 	  pro_epilogue_adjust_stack (stack_pointer_rtx, stack_pointer_rtx,
+ 				     GEN_INT (m->fs.sp_offset
+-					      - frame.reg_save_offset),
++					      - reg_save_offset),
+ 				     style,
+ 				     m->fs.cfa_reg == stack_pointer_rtx);
+ 	}
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/backport/0004-x86-Add-mindirect-branch.patch b/meta/recipes-devtools/gcc/gcc-6.4/backport/0004-x86-Add-mindirect-branch.patch
new file mode 100644
index 0000000..a9d6e5f
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.4/backport/0004-x86-Add-mindirect-branch.patch
@@ -0,0 +1,2154 @@
+From 6140c2c0bb2b61e69d0da84315e0433ff3520aaa Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Sat, 6 Jan 2018 22:29:55 -0800
+Subject: [PATCH 04/12] x86: Add -mindirect-branch=
+
+Add -mindirect-branch= option to convert indirect call and jump to call
+and return thunks.  The default is 'keep', which keeps indirect call and
+jump unmodified.  'thunk' converts indirect call and jump to call and
+return thunk.  'thunk-inline' converts indirect call and jump to inlined
+call and return thunk.  'thunk-extern' converts indirect call and jump to
+external call and return thunk provided in a separate object file.  You
+can control this behavior for a specific function by using the function
+attribute indirect_branch.
+
+2 kinds of thunks are geneated.  Memory thunk where the function address
+is at the top of the stack:
+
+__x86_indirect_thunk:
+	call L2
+L1:
+	pause
+	lfence
+	jmp L1
+L2:
+	lea 8(%rsp), %rsp|lea 4(%esp), %esp
+	ret
+
+Indirect jmp via memory, "jmp mem", is converted to
+
+	push memory
+	jmp __x86_indirect_thunk
+
+Indirect call via memory, "call mem", is converted to
+
+	jmp L2
+L1:
+	push [mem]
+	jmp __x86_indirect_thunk
+L2:
+	call L1
+
+Register thunk where the function address is in a register, reg:
+
+__x86_indirect_thunk_reg:
+	call	L2
+L1:
+	pause
+	lfence
+	jmp	L1
+L2:
+	movq	%reg, (%rsp)|movl    %reg, (%esp)
+	ret
+
+where reg is one of (r|e)ax, (r|e)dx, (r|e)cx, (r|e)bx, (r|e)si, (r|e)di,
+(r|e)bp, r8, r9, r10, r11, r12, r13, r14 and r15.
+
+Indirect jmp via register, "jmp reg", is converted to
+
+	jmp __x86_indirect_thunk_reg
+
+Indirect call via register, "call reg", is converted to
+
+	call __x86_indirect_thunk_reg
+
+gcc/
+
+	Backport from mainline
+	2018-01-14  H.J. Lu  <hongjiu.lu@intel.com>
+
+	* config/i386/i386-opts.h (indirect_branch): New.
+	* config/i386/i386-protos.h (ix86_output_indirect_jmp): Likewise.
+	* config/i386/i386.c (ix86_using_red_zone): Disallow red-zone
+	with local indirect jump when converting indirect call and jump.
+	(ix86_set_indirect_branch_type): New.
+	(ix86_set_current_function): Call ix86_set_indirect_branch_type.
+	(indirectlabelno): New.
+	(indirect_thunk_needed): Likewise.
+	(indirect_thunk_bnd_needed): Likewise.
+	(indirect_thunks_used): Likewise.
+	(indirect_thunks_bnd_used): Likewise.
+	(INDIRECT_LABEL): Likewise.
+	(indirect_thunk_name): Likewise.
+	(output_indirect_thunk): Likewise.
+	(output_indirect_thunk_function): Likewise.
+	(ix86_output_indirect_branch_via_reg): Likewise.
+	(ix86_output_indirect_branch_via_push): Likewise.
+	(ix86_output_indirect_branch): Likewise.
+	(ix86_output_indirect_jmp): Likewise.
+	(ix86_code_end): Call output_indirect_thunk_function if needed.
+	(ix86_output_call_insn): Call ix86_output_indirect_branch if
+	needed.
+	(ix86_handle_fndecl_attribute): Handle indirect_branch.
+	(ix86_attribute_table): Add indirect_branch.
+	* config/i386/i386.h (machine_function): Add indirect_branch_type
+	and has_local_indirect_jump.
+	* config/i386/i386.md (indirect_jump): Set has_local_indirect_jump
+	to true.
+	(tablejump): Likewise.
+	(*indirect_jump): Use ix86_output_indirect_jmp.
+	(*tablejump_1): Likewise.
+	(simple_return_indirect_internal): Likewise.
+	* config/i386/i386.opt (mindirect-branch=): New option.
+	(indirect_branch): New.
+	(keep): Likewise.
+	(thunk): Likewise.
+	(thunk-inline): Likewise.
+	(thunk-extern): Likewise.
+	* doc/extend.texi: Document indirect_branch function attribute.
+	* doc/invoke.texi: Document -mindirect-branch= option.
+
+gcc/testsuite/
+
+	Backport from mainline
+	2018-01-14  H.J. Lu  <hongjiu.lu@intel.com>
+
+	* gcc.target/i386/indirect-thunk-1.c: New test.
+	* gcc.target/i386/indirect-thunk-2.c: Likewise.
+	* gcc.target/i386/indirect-thunk-3.c: Likewise.
+	* gcc.target/i386/indirect-thunk-4.c: Likewise.
+	* gcc.target/i386/indirect-thunk-5.c: Likewise.
+	* gcc.target/i386/indirect-thunk-6.c: Likewise.
+	* gcc.target/i386/indirect-thunk-7.c: Likewise.
+	* gcc.target/i386/indirect-thunk-attr-1.c: Likewise.
+	* gcc.target/i386/indirect-thunk-attr-2.c: Likewise.
+	* gcc.target/i386/indirect-thunk-attr-3.c: Likewise.
+	* gcc.target/i386/indirect-thunk-attr-4.c: Likewise.
+	* gcc.target/i386/indirect-thunk-attr-5.c: Likewise.
+	* gcc.target/i386/indirect-thunk-attr-6.c: Likewise.
+	* gcc.target/i386/indirect-thunk-attr-7.c: Likewise.
+	* gcc.target/i386/indirect-thunk-attr-8.c: Likewise.
+	* gcc.target/i386/indirect-thunk-bnd-1.c: Likewise.
+	* gcc.target/i386/indirect-thunk-bnd-2.c: Likewise.
+	* gcc.target/i386/indirect-thunk-bnd-3.c: Likewise.
+	* gcc.target/i386/indirect-thunk-bnd-4.c: Likewise.
+	* gcc.target/i386/indirect-thunk-extern-1.c: Likewise.
+	* gcc.target/i386/indirect-thunk-extern-2.c: Likewise.
+	* gcc.target/i386/indirect-thunk-extern-3.c: Likewise.
+	* gcc.target/i386/indirect-thunk-extern-4.c: Likewise.
+	* gcc.target/i386/indirect-thunk-extern-5.c: Likewise.
+	* gcc.target/i386/indirect-thunk-extern-6.c: Likewise.
+	* gcc.target/i386/indirect-thunk-extern-7.c: Likewise.
+	* gcc.target/i386/indirect-thunk-inline-1.c: Likewise.
+	* gcc.target/i386/indirect-thunk-inline-2.c: Likewise.
+	* gcc.target/i386/indirect-thunk-inline-3.c: Likewise.
+	* gcc.target/i386/indirect-thunk-inline-4.c: Likewise.
+	* gcc.target/i386/indirect-thunk-inline-5.c: Likewise.
+	* gcc.target/i386/indirect-thunk-inline-6.c: Likewise.
+	* gcc.target/i386/indirect-thunk-inline-7.c: Likewise.
+
+Upstream-Status: Pending
+
+Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
+
+---
+ gcc/config/i386/i386-opts.h                        |  13 +
+ gcc/config/i386/i386-protos.h                      |   1 +
+ gcc/config/i386/i386.c                             | 639 ++++++++++++++++++++-
+ gcc/config/i386/i386.h                             |   7 +
+ gcc/config/i386/i386.md                            |  26 +-
+ gcc/config/i386/i386.opt                           |  20 +
+ gcc/doc/extend.texi                                |  10 +
+ gcc/doc/invoke.texi                                |  13 +-
+ gcc/testsuite/gcc.target/i386/indirect-thunk-1.c   |  20 +
+ gcc/testsuite/gcc.target/i386/indirect-thunk-2.c   |  20 +
+ gcc/testsuite/gcc.target/i386/indirect-thunk-3.c   |  21 +
+ gcc/testsuite/gcc.target/i386/indirect-thunk-4.c   |  21 +
+ gcc/testsuite/gcc.target/i386/indirect-thunk-5.c   |  17 +
+ gcc/testsuite/gcc.target/i386/indirect-thunk-6.c   |  18 +
+ gcc/testsuite/gcc.target/i386/indirect-thunk-7.c   |  44 ++
+ .../gcc.target/i386/indirect-thunk-attr-1.c        |  23 +
+ .../gcc.target/i386/indirect-thunk-attr-2.c        |  21 +
+ .../gcc.target/i386/indirect-thunk-attr-3.c        |  23 +
+ .../gcc.target/i386/indirect-thunk-attr-4.c        |  22 +
+ .../gcc.target/i386/indirect-thunk-attr-5.c        |  22 +
+ .../gcc.target/i386/indirect-thunk-attr-6.c        |  21 +
+ .../gcc.target/i386/indirect-thunk-attr-7.c        |  44 ++
+ .../gcc.target/i386/indirect-thunk-attr-8.c        |  42 ++
+ .../gcc.target/i386/indirect-thunk-bnd-1.c         |  20 +
+ .../gcc.target/i386/indirect-thunk-bnd-2.c         |  21 +
+ .../gcc.target/i386/indirect-thunk-bnd-3.c         |  19 +
+ .../gcc.target/i386/indirect-thunk-bnd-4.c         |  20 +
+ .../gcc.target/i386/indirect-thunk-extern-1.c      |  19 +
+ .../gcc.target/i386/indirect-thunk-extern-2.c      |  19 +
+ .../gcc.target/i386/indirect-thunk-extern-3.c      |  20 +
+ .../gcc.target/i386/indirect-thunk-extern-4.c      |  20 +
+ .../gcc.target/i386/indirect-thunk-extern-5.c      |  16 +
+ .../gcc.target/i386/indirect-thunk-extern-6.c      |  17 +
+ .../gcc.target/i386/indirect-thunk-extern-7.c      |  43 ++
+ .../gcc.target/i386/indirect-thunk-inline-1.c      |  20 +
+ .../gcc.target/i386/indirect-thunk-inline-2.c      |  20 +
+ .../gcc.target/i386/indirect-thunk-inline-3.c      |  21 +
+ .../gcc.target/i386/indirect-thunk-inline-4.c      |  21 +
+ .../gcc.target/i386/indirect-thunk-inline-5.c      |  17 +
+ .../gcc.target/i386/indirect-thunk-inline-6.c      |  18 +
+ .../gcc.target/i386/indirect-thunk-inline-7.c      |  44 ++
+ 41 files changed, 1486 insertions(+), 17 deletions(-)
+ create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-1.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-2.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-3.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-4.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-5.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-6.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-7.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-attr-1.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-attr-2.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-attr-3.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-attr-4.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-attr-5.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-attr-6.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-attr-7.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-attr-8.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-1.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-2.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-3.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-4.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-extern-1.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-extern-2.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-extern-3.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-extern-4.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-extern-5.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-extern-6.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-extern-7.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-inline-1.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-inline-2.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-inline-3.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-inline-4.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-inline-5.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-inline-6.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-inline-7.c
+
+diff --git a/gcc/config/i386/i386-opts.h b/gcc/config/i386/i386-opts.h
+index b7f92e3..cc21152 100644
+--- a/gcc/config/i386/i386-opts.h
++++ b/gcc/config/i386/i386-opts.h
+@@ -99,4 +99,17 @@ enum stack_protector_guard {
+   SSP_GLOBAL    /* global canary */
+ };
+ 
++/* This is used to mitigate variant #2 of the speculative execution
++   vulnerabilities on x86 processors identified by CVE-2017-5715, aka
++   Spectre.  They convert indirect branches and function returns to
++   call and return thunks to avoid speculative execution via indirect
++   call, jmp and ret.  */
++enum indirect_branch {
++  indirect_branch_unset = 0,
++  indirect_branch_keep,
++  indirect_branch_thunk,
++  indirect_branch_thunk_inline,
++  indirect_branch_thunk_extern
++};
++
+ #endif
+diff --git a/gcc/config/i386/i386-protos.h b/gcc/config/i386/i386-protos.h
+index ff47bc1..eca4cbf 100644
+--- a/gcc/config/i386/i386-protos.h
++++ b/gcc/config/i386/i386-protos.h
+@@ -311,6 +311,7 @@ extern enum attr_cpu ix86_schedule;
+ #endif
+ 
+ extern const char * ix86_output_call_insn (rtx_insn *insn, rtx call_op);
++extern const char * ix86_output_indirect_jmp (rtx call_op, bool ret_p);
+ extern bool ix86_operands_ok_for_move_multiple (rtx *operands, bool load,
+ 						enum machine_mode mode);
+ 
+diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c
+index 6c98f75..0b9fc4d 100644
+--- a/gcc/config/i386/i386.c
++++ b/gcc/config/i386/i386.c
+@@ -3662,12 +3662,23 @@ make_pass_stv (gcc::context *ctxt)
+   return new pass_stv (ctxt);
+ }
+ 
+-/* Return true if a red-zone is in use.  */
++/* Return true if a red-zone is in use.  We can't use red-zone when
++   there are local indirect jumps, like "indirect_jump" or "tablejump",
++   which jumps to another place in the function, since "call" in the
++   indirect thunk pushes the return address onto stack, destroying
++   red-zone.
++
++   TODO: If we can reserve the first 2 WORDs, for PUSH and, another
++   for CALL, in red-zone, we can allow local indirect jumps with
++   indirect thunk.  */
+ 
+ bool
+ ix86_using_red_zone (void)
+ {
+-  return TARGET_RED_ZONE && !TARGET_64BIT_MS_ABI;
++  return (TARGET_RED_ZONE
++	  && !TARGET_64BIT_MS_ABI
++	  && (!cfun->machine->has_local_indirect_jump
++	      || cfun->machine->indirect_branch_type == indirect_branch_keep));
+ }
+ 
+ /* Return a string that documents the current -m options.  The caller is
+@@ -6350,6 +6361,37 @@ ix86_reset_previous_fndecl (void)
+   ix86_previous_fndecl = NULL_TREE;
+ }
+ 
++/* Set the indirect_branch_type field from the function FNDECL.  */
++
++static void
++ix86_set_indirect_branch_type (tree fndecl)
++{
++  if (cfun->machine->indirect_branch_type == indirect_branch_unset)
++    {
++      tree attr = lookup_attribute ("indirect_branch",
++				    DECL_ATTRIBUTES (fndecl));
++      if (attr != NULL)
++	{
++	  tree args = TREE_VALUE (attr);
++	  if (args == NULL)
++	    gcc_unreachable ();
++	  tree cst = TREE_VALUE (args);
++	  if (strcmp (TREE_STRING_POINTER (cst), "keep") == 0)
++	    cfun->machine->indirect_branch_type = indirect_branch_keep;
++	  else if (strcmp (TREE_STRING_POINTER (cst), "thunk") == 0)
++	    cfun->machine->indirect_branch_type = indirect_branch_thunk;
++	  else if (strcmp (TREE_STRING_POINTER (cst), "thunk-inline") == 0)
++	    cfun->machine->indirect_branch_type = indirect_branch_thunk_inline;
++	  else if (strcmp (TREE_STRING_POINTER (cst), "thunk-extern") == 0)
++	    cfun->machine->indirect_branch_type = indirect_branch_thunk_extern;
++	  else
++	    gcc_unreachable ();
++	}
++      else
++	cfun->machine->indirect_branch_type = ix86_indirect_branch;
++    }
++}
++
+ /* Establish appropriate back-end context for processing the function
+    FNDECL.  The argument might be NULL to indicate processing at top
+    level, outside of any function scope.  */
+@@ -6360,7 +6402,13 @@ ix86_set_current_function (tree fndecl)
+      several times in the course of compiling a function, and we don't want to
+      slow things down too much or call target_reinit when it isn't safe.  */
+   if (fndecl == ix86_previous_fndecl)
+-    return;
++    {
++      /* There may be 2 function bodies for the same function FNDECL,
++	 one is extern inline and one isn't.  */
++      if (fndecl != NULL_TREE)
++	ix86_set_indirect_branch_type (fndecl);
++      return;
++    }
+ 
+   tree old_tree;
+   if (ix86_previous_fndecl == NULL_TREE)
+@@ -6377,6 +6425,8 @@ ix86_set_current_function (tree fndecl)
+       return;
+     }
+ 
++  ix86_set_indirect_branch_type (fndecl);
++
+   tree new_tree = DECL_FUNCTION_SPECIFIC_TARGET (fndecl);
+   if (new_tree == NULL_TREE)
+     new_tree = target_option_default_node;
+@@ -10962,6 +11012,220 @@ ix86_setup_frame_addresses (void)
+ # endif
+ #endif
+ 
++/* Label count for call and return thunks.  It is used to make unique
++   labels in call and return thunks.  */
++static int indirectlabelno;
++
++/* True if call and return thunk functions are needed.  */
++static bool indirect_thunk_needed = false;
++/* True if call and return thunk functions with the BND prefix are
++   needed.  */
++static bool indirect_thunk_bnd_needed = false;
++
++/* Bit masks of integer registers, which contain branch target, used
++   by call and return thunks functions.  */
++static int indirect_thunks_used;
++/* Bit masks of integer registers, which contain branch target, used
++   by call and return thunks functions with the BND prefix.  */
++static int indirect_thunks_bnd_used;
++
++#ifndef INDIRECT_LABEL
++# define INDIRECT_LABEL "LIND"
++#endif
++
++/* Fills in the label name that should be used for the indirect thunk.  */
++
++static void
++indirect_thunk_name (char name[32], int regno, bool need_bnd_p)
++{
++  if (USE_HIDDEN_LINKONCE)
++    {
++      const char *bnd = need_bnd_p ? "_bnd" : "";
++      if (regno >= 0)
++	{
++	  const char *reg_prefix;
++	  if (LEGACY_INT_REGNO_P (regno))
++	    reg_prefix = TARGET_64BIT ? "r" : "e";
++	  else
++	    reg_prefix = "";
++	  sprintf (name, "__x86_indirect_thunk%s_%s%s",
++		   bnd, reg_prefix, reg_names[regno]);
++	}
++      else
++	sprintf (name, "__x86_indirect_thunk%s", bnd);
++    }
++  else
++    {
++      if (regno >= 0)
++	{
++	  if (need_bnd_p)
++	    ASM_GENERATE_INTERNAL_LABEL (name, "LITBR", regno);
++	  else
++	    ASM_GENERATE_INTERNAL_LABEL (name, "LITR", regno);
++	}
++      else
++	{
++	  if (need_bnd_p)
++	    ASM_GENERATE_INTERNAL_LABEL (name, "LITB", 0);
++	  else
++	    ASM_GENERATE_INTERNAL_LABEL (name, "LIT", 0);
++	}
++    }
++}
++
++/* Output a call and return thunk for indirect branch.  If BND_P is
++   true, the BND prefix is needed.   If REGNO != -1,  the function
++   address is in REGNO and the call and return thunk looks like:
++
++	call	L2
++   L1:
++	pause
++	jmp	L1
++   L2:
++	mov	%REG, (%sp)
++	ret
++
++   Otherwise, the function address is on the top of stack and the
++   call and return thunk looks like:
++
++	call L2
++  L1:
++	pause
++	jmp L1
++  L2:
++	lea WORD_SIZE(%sp), %sp
++	ret
++ */
++
++static void
++output_indirect_thunk (bool need_bnd_p, int regno)
++{
++  char indirectlabel1[32];
++  char indirectlabel2[32];
++
++  ASM_GENERATE_INTERNAL_LABEL (indirectlabel1, INDIRECT_LABEL,
++			       indirectlabelno++);
++  ASM_GENERATE_INTERNAL_LABEL (indirectlabel2, INDIRECT_LABEL,
++			       indirectlabelno++);
++
++  /* Call */
++  if (need_bnd_p)
++    fputs ("\tbnd call\t", asm_out_file);
++  else
++    fputs ("\tcall\t", asm_out_file);
++  assemble_name_raw (asm_out_file, indirectlabel2);
++  fputc ('\n', asm_out_file);
++
++  ASM_OUTPUT_INTERNAL_LABEL (asm_out_file, indirectlabel1);
++
++  /* Pause + lfence.  */
++  fprintf (asm_out_file, "\tpause\n\tlfence\n");
++
++  /* Jump.  */
++  fputs ("\tjmp\t", asm_out_file);
++  assemble_name_raw (asm_out_file, indirectlabel1);
++  fputc ('\n', asm_out_file);
++
++  ASM_OUTPUT_INTERNAL_LABEL (asm_out_file, indirectlabel2);
++
++  if (regno >= 0)
++    {
++      /* MOV.  */
++      rtx xops[2];
++      xops[0] = gen_rtx_MEM (word_mode, stack_pointer_rtx);
++      xops[1] = gen_rtx_REG (word_mode, regno);
++      output_asm_insn ("mov\t{%1, %0|%0, %1}", xops);
++    }
++  else
++    {
++      /* LEA.  */
++      rtx xops[2];
++      xops[0] = stack_pointer_rtx;
++      xops[1] = plus_constant (Pmode, stack_pointer_rtx, UNITS_PER_WORD);
++      output_asm_insn ("lea\t{%E1, %0|%0, %E1}", xops);
++    }
++
++  if (need_bnd_p)
++    fputs ("\tbnd ret\n", asm_out_file);
++  else
++    fputs ("\tret\n", asm_out_file);
++}
++
++/* Output a funtion with a call and return thunk for indirect branch.
++   If BND_P is true, the BND prefix is needed.   If REGNO != -1,  the
++   function address is in REGNO.  Otherwise, the function address is
++   on the top of stack.  */
++
++static void
++output_indirect_thunk_function (bool need_bnd_p, int regno)
++{
++  char name[32];
++  tree decl;
++
++  /* Create __x86_indirect_thunk/__x86_indirect_thunk_bnd.  */
++  indirect_thunk_name (name, regno, need_bnd_p);
++  decl = build_decl (BUILTINS_LOCATION, FUNCTION_DECL,
++		     get_identifier (name),
++		     build_function_type_list (void_type_node, NULL_TREE));
++  DECL_RESULT (decl) = build_decl (BUILTINS_LOCATION, RESULT_DECL,
++				   NULL_TREE, void_type_node);
++  TREE_PUBLIC (decl) = 1;
++  TREE_STATIC (decl) = 1;
++  DECL_IGNORED_P (decl) = 1;
++
++#if TARGET_MACHO
++  if (TARGET_MACHO)
++    {
++      switch_to_section (darwin_sections[picbase_thunk_section]);
++      fputs ("\t.weak_definition\t", asm_out_file);
++      assemble_name (asm_out_file, name);
++      fputs ("\n\t.private_extern\t", asm_out_file);
++      assemble_name (asm_out_file, name);
++      putc ('\n', asm_out_file);
++      ASM_OUTPUT_LABEL (asm_out_file, name);
++      DECL_WEAK (decl) = 1;
++    }
++  else
++#endif
++    if (USE_HIDDEN_LINKONCE)
++      {
++	cgraph_node::create (decl)->set_comdat_group (DECL_ASSEMBLER_NAME (decl));
++
++	targetm.asm_out.unique_section (decl, 0);
++	switch_to_section (get_named_section (decl, NULL, 0));
++
++	targetm.asm_out.globalize_label (asm_out_file, name);
++	fputs ("\t.hidden\t", asm_out_file);
++	assemble_name (asm_out_file, name);
++	putc ('\n', asm_out_file);
++	ASM_DECLARE_FUNCTION_NAME (asm_out_file, name, decl);
++      }
++    else
++      {
++	switch_to_section (text_section);
++	ASM_OUTPUT_LABEL (asm_out_file, name);
++      }
++
++  DECL_INITIAL (decl) = make_node (BLOCK);
++  current_function_decl = decl;
++  allocate_struct_function (decl, false);
++  init_function_start (decl);
++  /* We're about to hide the function body from callees of final_* by
++     emitting it directly; tell them we're a thunk, if they care.  */
++  cfun->is_thunk = true;
++  first_function_block_is_cold = false;
++  /* Make sure unwind info is emitted for the thunk if needed.  */
++  final_start_function (emit_barrier (), asm_out_file, 1);
++
++  output_indirect_thunk (need_bnd_p, regno);
++
++  final_end_function ();
++  init_insn_lengths ();
++  free_after_compilation (cfun);
++  set_cfun (NULL);
++  current_function_decl = NULL;
++}
++
+ static int pic_labels_used;
+ 
+ /* Fills in the label name that should be used for a pc thunk for
+@@ -10988,11 +11252,32 @@ ix86_code_end (void)
+   rtx xops[2];
+   int regno;
+ 
++  if (indirect_thunk_needed)
++    output_indirect_thunk_function (false, -1);
++  if (indirect_thunk_bnd_needed)
++    output_indirect_thunk_function (true, -1);
++
++  for (regno = FIRST_REX_INT_REG; regno <= LAST_REX_INT_REG; regno++)
++    {
++      int i = regno - FIRST_REX_INT_REG + LAST_INT_REG + 1;
++      if ((indirect_thunks_used & (1 << i)))
++	output_indirect_thunk_function (false, regno);
++
++      if ((indirect_thunks_bnd_used & (1 << i)))
++	output_indirect_thunk_function (true, regno);
++    }
++
+   for (regno = AX_REG; regno <= SP_REG; regno++)
+     {
+       char name[32];
+       tree decl;
+ 
++      if ((indirect_thunks_used & (1 << regno)))
++	output_indirect_thunk_function (false, regno);
++
++      if ((indirect_thunks_bnd_used & (1 << regno)))
++	output_indirect_thunk_function (true, regno);
++
+       if (!(pic_labels_used & (1 << regno)))
+ 	continue;
+ 
+@@ -27369,12 +27654,292 @@ ix86_nopic_noplt_attribute_p (rtx call_op)
+   return false;
+ }
+ 
++/* Output indirect branch via a call and return thunk.  CALL_OP is a
++   register which contains the branch target.  XASM is the assembly
++   template for CALL_OP.  Branch is a tail call if SIBCALL_P is true.
++   A normal call is converted to:
++
++	call __x86_indirect_thunk_reg
++
++   and a tail call is converted to:
++
++	jmp __x86_indirect_thunk_reg
++ */
++
++static void
++ix86_output_indirect_branch_via_reg (rtx call_op, bool sibcall_p)
++{
++  char thunk_name_buf[32];
++  char *thunk_name;
++  bool need_bnd_p = ix86_bnd_prefixed_insn_p (current_output_insn);
++  int regno = REGNO (call_op);
++
++  if (cfun->machine->indirect_branch_type
++      != indirect_branch_thunk_inline)
++    {
++      if (cfun->machine->indirect_branch_type == indirect_branch_thunk)
++	{
++	  int i = regno;
++	  if (i >= FIRST_REX_INT_REG)
++	    i -= (FIRST_REX_INT_REG - LAST_INT_REG - 1);
++	  if (need_bnd_p)
++	    indirect_thunks_bnd_used |= 1 << i;
++	  else
++	    indirect_thunks_used |= 1 << i;
++	}
++      indirect_thunk_name (thunk_name_buf, regno, need_bnd_p);
++      thunk_name = thunk_name_buf;
++    }
++  else
++    thunk_name = NULL;
++
++  if (sibcall_p)
++    {
++      if (thunk_name != NULL)
++	{
++	  if (need_bnd_p)
++	    fprintf (asm_out_file, "\tbnd jmp\t%s\n", thunk_name);
++	  else
++	    fprintf (asm_out_file, "\tjmp\t%s\n", thunk_name);
++	}
++      else
++	output_indirect_thunk (need_bnd_p, regno);
++    }
++  else
++    {
++      if (thunk_name != NULL)
++	{
++	  if (need_bnd_p)
++	    fprintf (asm_out_file, "\tbnd call\t%s\n", thunk_name);
++	  else
++	    fprintf (asm_out_file, "\tcall\t%s\n", thunk_name);
++	  return;
++	}
++
++      char indirectlabel1[32];
++      char indirectlabel2[32];
++
++      ASM_GENERATE_INTERNAL_LABEL (indirectlabel1,
++				   INDIRECT_LABEL,
++				   indirectlabelno++);
++      ASM_GENERATE_INTERNAL_LABEL (indirectlabel2,
++				   INDIRECT_LABEL,
++				   indirectlabelno++);
++
++      /* Jump.  */
++      if (need_bnd_p)
++	fputs ("\tbnd jmp\t", asm_out_file);
++      else
++	fputs ("\tjmp\t", asm_out_file);
++      assemble_name_raw (asm_out_file, indirectlabel2);
++      fputc ('\n', asm_out_file);
++
++      ASM_OUTPUT_INTERNAL_LABEL (asm_out_file, indirectlabel1);
++
++      if (thunk_name != NULL)
++	{
++	  if (need_bnd_p)
++	    fprintf (asm_out_file, "\tbnd jmp\t%s\n", thunk_name);
++	  else
++	    fprintf (asm_out_file, "\tjmp\t%s\n", thunk_name);
++	}
++      else
++	output_indirect_thunk (need_bnd_p, regno);
++
++      ASM_OUTPUT_INTERNAL_LABEL (asm_out_file, indirectlabel2);
++
++      /* Call.  */
++      if (need_bnd_p)
++	fputs ("\tbnd call\t", asm_out_file);
++      else
++	fputs ("\tcall\t", asm_out_file);
++      assemble_name_raw (asm_out_file, indirectlabel1);
++      fputc ('\n', asm_out_file);
++    }
++}
++
++/* Output indirect branch via a call and return thunk.  CALL_OP is
++   the branch target.  XASM is the assembly template for CALL_OP.
++   Branch is a tail call if SIBCALL_P is true.  A normal call is
++   converted to:
++
++	jmp L2
++   L1:
++	push CALL_OP
++	jmp __x86_indirect_thunk
++   L2:
++	call L1
++
++   and a tail call is converted to:
++
++	push CALL_OP
++	jmp __x86_indirect_thunk
++ */
++
++static void
++ix86_output_indirect_branch_via_push (rtx call_op, const char *xasm,
++				      bool sibcall_p)
++{
++  char thunk_name_buf[32];
++  char *thunk_name;
++  char push_buf[64];
++  bool need_bnd_p = ix86_bnd_prefixed_insn_p (current_output_insn);
++  int regno = -1;
++
++  if (cfun->machine->indirect_branch_type
++      != indirect_branch_thunk_inline)
++    {
++      if (cfun->machine->indirect_branch_type == indirect_branch_thunk)
++	{
++	  if (need_bnd_p)
++	    indirect_thunk_bnd_needed = true;
++	  else
++	    indirect_thunk_needed = true;
++	}
++      indirect_thunk_name (thunk_name_buf, regno, need_bnd_p);
++      thunk_name = thunk_name_buf;
++    }
++  else
++    thunk_name = NULL;
++
++  snprintf (push_buf, sizeof (push_buf), "push{%c}\t%s",
++	    TARGET_64BIT ? 'q' : 'l', xasm);
++
++  if (sibcall_p)
++    {
++      output_asm_insn (push_buf, &call_op);
++      if (thunk_name != NULL)
++	{
++	  if (need_bnd_p)
++	    fprintf (asm_out_file, "\tbnd jmp\t%s\n", thunk_name);
++	  else
++	    fprintf (asm_out_file, "\tjmp\t%s\n", thunk_name);
++	}
++      else
++	output_indirect_thunk (need_bnd_p, regno);
++    }
++  else
++    {
++      char indirectlabel1[32];
++      char indirectlabel2[32];
++
++      ASM_GENERATE_INTERNAL_LABEL (indirectlabel1,
++				   INDIRECT_LABEL,
++				   indirectlabelno++);
++      ASM_GENERATE_INTERNAL_LABEL (indirectlabel2,
++				   INDIRECT_LABEL,
++				   indirectlabelno++);
++
++      /* Jump.  */
++      if (need_bnd_p)
++	fputs ("\tbnd jmp\t", asm_out_file);
++      else
++	fputs ("\tjmp\t", asm_out_file);
++      assemble_name_raw (asm_out_file, indirectlabel2);
++      fputc ('\n', asm_out_file);
++
++      ASM_OUTPUT_INTERNAL_LABEL (asm_out_file, indirectlabel1);
++
++      /* An external function may be called via GOT, instead of PLT.  */
++      if (MEM_P (call_op))
++	{
++	  struct ix86_address parts;
++	  rtx addr = XEXP (call_op, 0);
++	  if (ix86_decompose_address (addr, &parts)
++	      && parts.base == stack_pointer_rtx)
++	    {
++	      /* Since call will adjust stack by -UNITS_PER_WORD,
++		 we must convert "disp(stack, index, scale)" to
++		 "disp+UNITS_PER_WORD(stack, index, scale)".  */
++	      if (parts.index)
++		{
++		  addr = gen_rtx_MULT (Pmode, parts.index,
++				       GEN_INT (parts.scale));
++		  addr = gen_rtx_PLUS (Pmode, stack_pointer_rtx,
++				       addr);
++		}
++	      else
++		addr = stack_pointer_rtx;
++
++	      rtx disp;
++	      if (parts.disp != NULL_RTX)
++		disp = plus_constant (Pmode, parts.disp,
++				      UNITS_PER_WORD);
++	      else
++		disp = GEN_INT (UNITS_PER_WORD);
++
++	      addr = gen_rtx_PLUS (Pmode, addr, disp);
++	      call_op = gen_rtx_MEM (GET_MODE (call_op), addr);
++	    }
++	}
++
++      output_asm_insn (push_buf, &call_op);
++
++      if (thunk_name != NULL)
++	{
++	  if (need_bnd_p)
++	    fprintf (asm_out_file, "\tbnd jmp\t%s\n", thunk_name);
++	  else
++	    fprintf (asm_out_file, "\tjmp\t%s\n", thunk_name);
++	}
++      else
++	output_indirect_thunk (need_bnd_p, regno);
++
++      ASM_OUTPUT_INTERNAL_LABEL (asm_out_file, indirectlabel2);
++
++      /* Call.  */
++      if (need_bnd_p)
++	fputs ("\tbnd call\t", asm_out_file);
++      else
++	fputs ("\tcall\t", asm_out_file);
++      assemble_name_raw (asm_out_file, indirectlabel1);
++      fputc ('\n', asm_out_file);
++    }
++}
++
++/* Output indirect branch via a call and return thunk.  CALL_OP is
++   the branch target.  XASM is the assembly template for CALL_OP.
++   Branch is a tail call if SIBCALL_P is true.   */
++
++static void
++ix86_output_indirect_branch (rtx call_op, const char *xasm,
++			     bool sibcall_p)
++{
++  if (REG_P (call_op))
++    ix86_output_indirect_branch_via_reg (call_op, sibcall_p);
++  else
++    ix86_output_indirect_branch_via_push (call_op, xasm, sibcall_p);
++}
++/* Output indirect jump.  CALL_OP is the jump target.  Jump is a
++   function return if RET_P is true.  */
++
++const char *
++ix86_output_indirect_jmp (rtx call_op, bool ret_p)
++{
++  if (cfun->machine->indirect_branch_type != indirect_branch_keep)
++    {
++      /* We can't have red-zone if this isn't a function return since
++	 "call" in the indirect thunk pushes the return address onto
++	 stack, destroying red-zone.  */
++      if (!ret_p && ix86_red_zone_size != 0)
++	gcc_unreachable ();
++
++      ix86_output_indirect_branch (call_op, "%0", true);
++      return "";
++    }
++  else
++    return "%!jmp\t%A0";
++}
++
+ /* Output the assembly for a call instruction.  */
+ 
+ const char *
+ ix86_output_call_insn (rtx_insn *insn, rtx call_op)
+ {
+   bool direct_p = constant_call_address_operand (call_op, VOIDmode);
++  bool output_indirect_p
++    = (!TARGET_SEH
++       && cfun->machine->indirect_branch_type != indirect_branch_keep);
+   bool seh_nop_p = false;
+   const char *xasm;
+ 
+@@ -27383,7 +27948,13 @@ ix86_output_call_insn (rtx_insn *insn, rtx call_op)
+       if (direct_p)
+ 	{
+ 	  if (ix86_nopic_noplt_attribute_p (call_op))
+-	    xasm = "%!jmp\t{*%p0@GOTPCREL(%%rip)|[QWORD PTR %p0@GOTPCREL[rip]]}";
++	    {
++	      direct_p = false;
++	      if (output_indirect_p)
++		xasm = "{%p0@GOTPCREL(%%rip)|[QWORD PTR %p0@GOTPCREL[rip]]}";
++	      else
++		xasm = "%!jmp\t{*%p0@GOTPCREL(%%rip)|[QWORD PTR %p0@GOTPCREL[rip]]}";
++	    }
+ 	  else
+ 	    xasm = "%!jmp\t%P0";
+ 	}
+@@ -27392,9 +27963,17 @@ ix86_output_call_insn (rtx_insn *insn, rtx call_op)
+       else if (TARGET_SEH)
+ 	xasm = "%!rex.W jmp\t%A0";
+       else
+-	xasm = "%!jmp\t%A0";
++	{
++	  if (output_indirect_p)
++	    xasm = "%0";
++	  else
++	    xasm = "%!jmp\t%A0";
++	}
+ 
+-      output_asm_insn (xasm, &call_op);
++      if (output_indirect_p && !direct_p)
++	ix86_output_indirect_branch (call_op, xasm, true);
++      else
++	output_asm_insn (xasm, &call_op);
+       return "";
+     }
+ 
+@@ -27431,14 +28010,28 @@ ix86_output_call_insn (rtx_insn *insn, rtx call_op)
+   if (direct_p)
+     {
+       if (ix86_nopic_noplt_attribute_p (call_op))
+-	xasm = "%!call\t{*%p0@GOTPCREL(%%rip)|[QWORD PTR %p0@GOTPCREL[rip]]}";
++	{
++	  direct_p = false;
++	  if (output_indirect_p)
++	    xasm = "{%p0@GOTPCREL(%%rip)|[QWORD PTR %p0@GOTPCREL[rip]]}";
++	  else
++	    xasm = "%!call\t{*%p0@GOTPCREL(%%rip)|[QWORD PTR %p0@GOTPCREL[rip]]}";
++	}
+       else
+ 	xasm = "%!call\t%P0";
+     }
+   else
+-    xasm = "%!call\t%A0";
++    {
++      if (output_indirect_p)
++	xasm = "%0";
++      else
++	xasm = "%!call\t%A0";
++    }
+ 
+-  output_asm_insn (xasm, &call_op);
++  if (output_indirect_p && !direct_p)
++    ix86_output_indirect_branch (call_op, xasm, false);
++  else
++    output_asm_insn (xasm, &call_op);
+ 
+   if (seh_nop_p)
+     return "nop";
+@@ -44836,7 +45429,7 @@ ix86_handle_struct_attribute (tree *node, tree name, tree, int,
+ }
+ 
+ static tree
+-ix86_handle_fndecl_attribute (tree *node, tree name, tree, int,
++ix86_handle_fndecl_attribute (tree *node, tree name, tree args, int,
+ 			      bool *no_add_attrs)
+ {
+   if (TREE_CODE (*node) != FUNCTION_DECL)
+@@ -44845,6 +45438,29 @@ ix86_handle_fndecl_attribute (tree *node, tree name, tree, int,
+                name);
+       *no_add_attrs = true;
+     }
++
++  if (is_attribute_p ("indirect_branch", name))
++    {
++      tree cst = TREE_VALUE (args);
++      if (TREE_CODE (cst) != STRING_CST)
++	{
++	  warning (OPT_Wattributes,
++		   "%qE attribute requires a string constant argument",
++		   name);
++	  *no_add_attrs = true;
++	}
++      else if (strcmp (TREE_STRING_POINTER (cst), "keep") != 0
++	       && strcmp (TREE_STRING_POINTER (cst), "thunk") != 0
++	       && strcmp (TREE_STRING_POINTER (cst), "thunk-inline") != 0
++	       && strcmp (TREE_STRING_POINTER (cst), "thunk-extern") != 0)
++	{
++	  warning (OPT_Wattributes,
++		   "argument to %qE attribute is not "
++		   "(keep|thunk|thunk-inline|thunk-extern)", name);
++	  *no_add_attrs = true;
++	}
++    }
++
+   return NULL_TREE;
+ }
+ 
+@@ -49072,6 +49688,9 @@ static const struct attribute_spec ix86_attribute_table[] =
+     false },
+   { "callee_pop_aggregate_return", 1, 1, false, true, true,
+     ix86_handle_callee_pop_aggregate_return, true },
++  { "indirect_branch", 1, 1, true, false, false,
++    ix86_handle_fndecl_attribute, false },
++
+   /* End element.  */
+   { NULL,        0, 0, false, false, false, NULL, false }
+ };
+diff --git a/gcc/config/i386/i386.h b/gcc/config/i386/i386.h
+index 5414416..9dccdb0 100644
+--- a/gcc/config/i386/i386.h
++++ b/gcc/config/i386/i386.h
+@@ -2572,6 +2572,13 @@ struct GTY(()) machine_function {
+   /* If true, it is safe to not save/restore DRAP register.  */
+   BOOL_BITFIELD no_drap_save_restore : 1;
+ 
++  /* How to generate indirec branch.  */
++  ENUM_BITFIELD(indirect_branch) indirect_branch_type : 3;
++
++  /* If true, the current function has local indirect jumps, like
++     "indirect_jump" or "tablejump".  */
++  BOOL_BITFIELD has_local_indirect_jump : 1;
++
+   /* If true, there is register available for argument passing.  This
+      is used only in ix86_function_ok_for_sibcall by 32-bit to determine
+      if there is scratch register available for indirect sibcall.  In
+diff --git a/gcc/config/i386/i386.md b/gcc/config/i386/i386.md
+index d2bfe31..153e162 100644
+--- a/gcc/config/i386/i386.md
++++ b/gcc/config/i386/i386.md
+@@ -11807,13 +11807,18 @@
+ {
+   if (TARGET_X32)
+     operands[0] = convert_memory_address (word_mode, operands[0]);
++  cfun->machine->has_local_indirect_jump = true;
+ })
+ 
+ (define_insn "*indirect_jump"
+   [(set (pc) (match_operand:W 0 "indirect_branch_operand" "rBw"))]
+   ""
+-  "%!jmp\t%A0"
+-  [(set_attr "type" "ibr")
++  "* return ix86_output_indirect_jmp (operands[0], false);"
++  [(set (attr "type")
++     (if_then_else (match_test "(cfun->machine->indirect_branch_type
++				 != indirect_branch_keep)")
++	(const_string "multi")
++	(const_string "ibr")))
+    (set_attr "length_immediate" "0")
+    (set_attr "maybe_prefix_bnd" "1")])
+ 
+@@ -11856,14 +11861,19 @@
+ 
+   if (TARGET_X32)
+     operands[0] = convert_memory_address (word_mode, operands[0]);
++  cfun->machine->has_local_indirect_jump = true;
+ })
+ 
+ (define_insn "*tablejump_1"
+   [(set (pc) (match_operand:W 0 "indirect_branch_operand" "rBw"))
+    (use (label_ref (match_operand 1)))]
+   ""
+-  "%!jmp\t%A0"
+-  [(set_attr "type" "ibr")
++  "* return ix86_output_indirect_jmp (operands[0], false);"
++  [(set (attr "type")
++     (if_then_else (match_test "(cfun->machine->indirect_branch_type
++				 != indirect_branch_keep)")
++	(const_string "multi")
++	(const_string "ibr")))
+    (set_attr "length_immediate" "0")
+    (set_attr "maybe_prefix_bnd" "1")])
+ 
+@@ -12520,8 +12530,12 @@
+   [(simple_return)
+    (use (match_operand:SI 0 "register_operand" "r"))]
+   "reload_completed"
+-  "%!jmp\t%A0"
+-  [(set_attr "type" "ibr")
++  "* return ix86_output_indirect_jmp (operands[0], true);"
++  [(set (attr "type")
++     (if_then_else (match_test "(cfun->machine->indirect_branch_type
++				 != indirect_branch_keep)")
++	(const_string "multi")
++	(const_string "ibr")))
+    (set_attr "length_immediate" "0")
+    (set_attr "maybe_prefix_bnd" "1")])
+ 
+diff --git a/gcc/config/i386/i386.opt b/gcc/config/i386/i386.opt
+index f304b62..5ffa334 100644
+--- a/gcc/config/i386/i386.opt
++++ b/gcc/config/i386/i386.opt
+@@ -897,3 +897,23 @@ Enum(stack_protector_guard) String(global) Value(SSP_GLOBAL)
+ mmitigate-rop
+ Target Var(flag_mitigate_rop) Init(0)
+ Attempt to avoid generating instruction sequences containing ret bytes.
++
++mindirect-branch=
++Target Report RejectNegative Joined Enum(indirect_branch) Var(ix86_indirect_branch) Init(indirect_branch_keep)
++Convert indirect call and jump to call and return thunks.
++
++Enum
++Name(indirect_branch) Type(enum indirect_branch)
++Known indirect branch choices (for use with the -mindirect-branch= option):
++
++EnumValue
++Enum(indirect_branch) String(keep) Value(indirect_branch_keep)
++
++EnumValue
++Enum(indirect_branch) String(thunk) Value(indirect_branch_thunk)
++
++EnumValue
++Enum(indirect_branch) String(thunk-inline) Value(indirect_branch_thunk_inline)
++
++EnumValue
++Enum(indirect_branch) String(thunk-extern) Value(indirect_branch_thunk_extern)
+diff --git a/gcc/doc/extend.texi b/gcc/doc/extend.texi
+index 8cc4f7e..8668dae 100644
+--- a/gcc/doc/extend.texi
++++ b/gcc/doc/extend.texi
+@@ -5419,6 +5419,16 @@ Specify which floating-point unit to use.  You must specify the
+ @code{target("fpmath=sse,387")} option as
+ @code{target("fpmath=sse+387")} because the comma would separate
+ different options.
++
++@item indirect_branch("@var{choice}")
++@cindex @code{indirect_branch} function attribute, x86
++On x86 targets, the @code{indirect_branch} attribute causes the compiler
++to convert indirect call and jump with @var{choice}.  @samp{keep}
++keeps indirect call and jump unmodified.  @samp{thunk} converts indirect
++call and jump to call and return thunk.  @samp{thunk-inline} converts
++indirect call and jump to inlined call and return thunk.
++@samp{thunk-extern} converts indirect call and jump to external call
++and return thunk provided in a separate object file.
+ @end table
+ 
+ On the x86, the inliner does not inline a
+diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
+index b066f7b..ff9a194 100644
+--- a/gcc/doc/invoke.texi
++++ b/gcc/doc/invoke.texi
+@@ -1169,7 +1169,7 @@ See RS/6000 and PowerPC Options.
+ -msse2avx -mfentry -mrecord-mcount -mnop-mcount -m8bit-idiv @gol
+ -mavx256-split-unaligned-load -mavx256-split-unaligned-store @gol
+ -malign-data=@var{type} -mstack-protector-guard=@var{guard} @gol
+--mmitigate-rop}
++-mmitigate-rop -mindirect-branch=@var{choice}}
+ 
+ @emph{x86 Windows Options}
+ @gccoptlist{-mconsole -mcygwin -mno-cygwin -mdll @gol
+@@ -24218,6 +24218,17 @@ opcodes, to mitigate against certain forms of attack. At the moment,
+ this option is limited in what it can do and should not be relied
+ on to provide serious protection.
+ 
++@item -mindirect-branch=@var{choice}
++@opindex -mindirect-branch
++Convert indirect call and jump with @var{choice}.  The default is
++@samp{keep}, which keeps indirect call and jump unmodified.
++@samp{thunk} converts indirect call and jump to call and return thunk.
++@samp{thunk-inline} converts indirect call and jump to inlined call
++and return thunk.  @samp{thunk-extern} converts indirect call and jump
++to external call and return thunk provided in a separate object file.
++You can control this behavior for a specific function by using the
++function attribute @code{indirect_branch}.  @xref{Function Attributes}.
++
+ @end table
+ 
+ These @samp{-m} switches are supported in addition to the above
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-1.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-1.c
+new file mode 100644
+index 0000000..d983e1c
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-1.c
+@@ -0,0 +1,20 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -mindirect-branch=thunk -fno-pic" } */
++
++typedef void (*dispatch_t)(long offset);
++
++dispatch_t dispatch;
++
++void
++male_indirect_jump (long offset)
++{
++  dispatch(offset);
++}
++
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target x32 } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler {\tpause} } } */
++/* { dg-final { scan-assembler {\tlfence} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-2.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-2.c
+new file mode 100644
+index 0000000..58f09b4
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-2.c
+@@ -0,0 +1,20 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -mindirect-branch=thunk -fno-pic" } */
++
++typedef void (*dispatch_t)(long offset);
++
++dispatch_t dispatch[256];
++
++void
++male_indirect_jump (long offset)
++{
++  dispatch[offset](offset);
++}
++
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target x32 } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler {\tpause} } } */
++/* { dg-final { scan-assembler {\tlfence} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-3.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-3.c
+new file mode 100644
+index 0000000..f20d35c
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-3.c
+@@ -0,0 +1,21 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -mindirect-branch=thunk -fno-pic" } */
++
++typedef void (*dispatch_t)(long offset);
++
++dispatch_t dispatch;
++
++int
++male_indirect_jump (long offset)
++{
++  dispatch(offset);
++  return 0;
++}
++
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target x32 } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler {\tpause} } } */
++/* { dg-final { scan-assembler {\tlfence} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-4.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-4.c
+new file mode 100644
+index 0000000..0eff8fb
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-4.c
+@@ -0,0 +1,21 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -mindirect-branch=thunk -fno-pic" } */
++
++typedef void (*dispatch_t)(long offset);
++
++dispatch_t dispatch[256];
++
++int
++male_indirect_jump (long offset)
++{
++  dispatch[offset](offset);
++  return 0;
++}
++
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target x32 } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler {\tpause} } } */
++/* { dg-final { scan-assembler {\tlfence} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-5.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-5.c
+new file mode 100644
+index 0000000..a25b20d
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-5.c
+@@ -0,0 +1,17 @@
++/* { dg-do compile { target *-*-linux* } } */
++/* { dg-options "-O2 -fpic -fno-plt -mindirect-branch=thunk" } */
++
++extern void bar (void);
++
++void
++foo (void)
++{
++  bar ();
++}
++
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler {\tpause} } } */
++/* { dg-final { scan-assembler {\tlfence} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-6.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-6.c
+new file mode 100644
+index 0000000..cff114a
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-6.c
+@@ -0,0 +1,18 @@
++/* { dg-do compile { target *-*-linux* } } */
++/* { dg-options "-O2 -fpic -fno-plt -mindirect-branch=thunk" } */
++
++extern void bar (void);
++
++int
++foo (void)
++{
++  bar ();
++  return 0;
++}
++
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" } } */
++/* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 2 } } */
++/* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 2 } } */
++/* { dg-final { scan-assembler {\tpause} } } */
++/* { dg-final { scan-assembler {\tlfence} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-7.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-7.c
+new file mode 100644
+index 0000000..afdb600
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-7.c
+@@ -0,0 +1,44 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -mindirect-branch=thunk -fno-pic" } */
++
++void func0 (void);
++void func1 (void);
++void func2 (void);
++void func3 (void);
++void func4 (void);
++void func4 (void);
++void func5 (void);
++
++void
++bar (int i)
++{
++  switch (i)
++    {
++    default:
++      func0 ();
++      break;
++    case 1:
++      func1 ();
++      break;
++    case 2:
++      func2 ();
++      break;
++    case 3:
++      func3 ();
++      break;
++    case 4:
++      func4 ();
++      break;
++    case 5:
++      func5 ();
++      break;
++    }
++}
++
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target x32 } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler {\tpause} } } */
++/* { dg-final { scan-assembler {\tlfence} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-1.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-1.c
+new file mode 100644
+index 0000000..d64d978
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-1.c
+@@ -0,0 +1,23 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -fno-pic" } */
++
++typedef void (*dispatch_t)(long offset);
++
++dispatch_t dispatch;
++
++extern void male_indirect_jump (long)
++  __attribute__ ((indirect_branch("thunk")));
++
++void
++male_indirect_jump (long offset)
++{
++  dispatch(offset);
++}
++
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target x32 } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler {\tpause} } } */
++/* { dg-final { scan-assembler {\tlfence} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-2.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-2.c
+new file mode 100644
+index 0000000..9306745
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-2.c
+@@ -0,0 +1,21 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -fno-pic" } */
++
++typedef void (*dispatch_t)(long offset);
++
++dispatch_t dispatch[256];
++
++__attribute__ ((indirect_branch("thunk")))
++void
++male_indirect_jump (long offset)
++{
++  dispatch[offset](offset);
++}
++
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target x32 } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler {\tpause} } } */
++/* { dg-final { scan-assembler {\tlfence} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-3.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-3.c
+new file mode 100644
+index 0000000..97744d6
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-3.c
+@@ -0,0 +1,23 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -fno-pic" } */
++
++typedef void (*dispatch_t)(long offset);
++
++dispatch_t dispatch;
++extern int male_indirect_jump (long)
++  __attribute__ ((indirect_branch("thunk-inline")));
++
++int
++male_indirect_jump (long offset)
++{
++  dispatch(offset);
++  return 0;
++}
++
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 2 } } */
++/* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 2 } } */
++/* { dg-final { scan-assembler {\tpause} } } */
++/* { dg-final { scan-assembler {\tlfence} } } */
++/* { dg-final { scan-assembler-not "__x86_indirect_thunk" } } */
++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-4.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-4.c
+new file mode 100644
+index 0000000..bfce3ea
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-4.c
+@@ -0,0 +1,22 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -fno-pic" } */
++
++typedef void (*dispatch_t)(long offset);
++
++dispatch_t dispatch[256];
++
++__attribute__ ((indirect_branch("thunk-inline")))
++int
++male_indirect_jump (long offset)
++{
++  dispatch[offset](offset);
++  return 0;
++}
++
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 2 } } */
++/* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 2 } } */
++/* { dg-final { scan-assembler {\tpause} } } */
++/* { dg-final { scan-assembler {\tlfence} } } */
++/* { dg-final { scan-assembler-not "__x86_indirect_thunk" } } */
++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-5.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-5.c
+new file mode 100644
+index 0000000..0833606
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-5.c
+@@ -0,0 +1,22 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -fno-pic" } */
++
++typedef void (*dispatch_t)(long offset);
++
++dispatch_t dispatch;
++extern int male_indirect_jump (long)
++  __attribute__ ((indirect_branch("thunk-extern")));
++
++int
++male_indirect_jump (long offset)
++{
++  dispatch(offset);
++  return 0;
++}
++
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 1 { target { ! x32 } } } } */
++/* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 1 { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target x32 } } } */
++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-6.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-6.c
+new file mode 100644
+index 0000000..2eba0fb
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-6.c
+@@ -0,0 +1,21 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -fno-pic" } */
++
++typedef void (*dispatch_t)(long offset);
++
++dispatch_t dispatch[256];
++
++__attribute__ ((indirect_branch("thunk-extern")))
++int
++male_indirect_jump (long offset)
++{
++  dispatch[offset](offset);
++  return 0;
++}
++
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 1 { target { ! x32 } } } } */
++/* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 1 { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target x32 } } } */
++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-7.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-7.c
+new file mode 100644
+index 0000000..f58427e
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-7.c
+@@ -0,0 +1,44 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -fno-pic" } */
++
++void func0 (void);
++void func1 (void);
++void func2 (void);
++void func3 (void);
++void func4 (void);
++void func4 (void);
++void func5 (void);
++
++__attribute__ ((indirect_branch("thunk-extern")))
++void
++bar (int i)
++{
++  switch (i)
++    {
++    default:
++      func0 ();
++      break;
++    case 1:
++      func1 ();
++      break;
++    case 2:
++      func2 ();
++      break;
++    case 3:
++      func3 ();
++      break;
++    case 4:
++      func4 ();
++      break;
++    case 5:
++      func5 ();
++      break;
++    }
++}
++
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target x32 } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" } } */
++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
++/* { dg-final { scan-assembler-not "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler-not "call\[ \t\]*\.LIND" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-8.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-8.c
+new file mode 100644
+index 0000000..564ed39
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-8.c
+@@ -0,0 +1,42 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -mindirect-branch=thunk -fno-pic" } */
++
++void func0 (void);
++void func1 (void);
++void func2 (void);
++void func3 (void);
++void func4 (void);
++void func4 (void);
++void func5 (void);
++
++__attribute__ ((indirect_branch("keep")))
++void
++bar (int i)
++{
++  switch (i)
++    {
++    default:
++      func0 ();
++      break;
++    case 1:
++      func1 ();
++      break;
++    case 2:
++      func2 ();
++      break;
++    case 3:
++      func3 ();
++      break;
++    case 4:
++      func4 ();
++      break;
++    case 5:
++      func5 ();
++      break;
++    }
++}
++
++/* { dg-final { scan-assembler-not "__x86_indirect_thunk" } } */
++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
++/* { dg-final { scan-assembler-not "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler-not "call\[ \t\]*\.LIND" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-1.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-1.c
+new file mode 100644
+index 0000000..50fbee2
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-1.c
+@@ -0,0 +1,20 @@
++/* { dg-do compile { target { ! x32 } } } */
++/* { dg-options "-O2 -mindirect-branch=thunk -fcheck-pointer-bounds -mmpx -fno-pic" } */
++
++void (*dispatch) (char *);
++char buf[10];
++
++void
++foo (void)
++{
++  dispatch (buf);
++}
++
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "pushq\[ \t\]%rax" { target x32 } } } */
++/* { dg-final { scan-assembler "bnd jmp\[ \t\]*__x86_indirect_thunk_bnd" } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler "bnd call\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler "bnd ret" } } */
++/* { dg-final { scan-assembler {\tpause} } } */
++/* { dg-final { scan-assembler {\tlfence} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-2.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-2.c
+new file mode 100644
+index 0000000..2976e67
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-2.c
+@@ -0,0 +1,21 @@
++/* { dg-do compile { target { ! x32 } } } */
++/* { dg-options "-O2 -mindirect-branch=thunk -fcheck-pointer-bounds -mmpx -fno-pic" } */
++
++void (*dispatch) (char *);
++char buf[10];
++
++int
++foo (void)
++{
++  dispatch (buf);
++  return 0;
++}
++
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "pushq\[ \t\]%rax" { target x32 } } } */
++/* { dg-final { scan-assembler "bnd jmp\[ \t\]*__x86_indirect_thunk_bnd" } } */
++/* { dg-final { scan-assembler "bnd jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler "bnd call\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler "bnd ret" } } */
++/* { dg-final { scan-assembler {\tpause} } } */
++/* { dg-final { scan-assembler {\tlfence} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-3.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-3.c
+new file mode 100644
+index 0000000..da4bc98
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-3.c
+@@ -0,0 +1,19 @@
++/* { dg-do compile { target { *-*-linux* && { ! x32 } } } } */
++/* { dg-options "-O2 -mindirect-branch=thunk -fcheck-pointer-bounds -mmpx -fpic -fno-plt" } */
++
++void bar (char *);
++char buf[10];
++
++void
++foo (void)
++{
++  bar (buf);
++}
++
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" } } */
++/* { dg-final { scan-assembler "bnd jmp\[ \t\]*__x86_indirect_thunk_bnd" } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler "bnd call\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler "bnd ret" } } */
++/* { dg-final { scan-assembler {\tpause} } } */
++/* { dg-final { scan-assembler {\tlfence} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-4.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-4.c
+new file mode 100644
+index 0000000..c64d12e
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-4.c
+@@ -0,0 +1,20 @@
++/* { dg-do compile { target { *-*-linux* && { ! x32 } } } } */
++/* { dg-options "-O2 -mindirect-branch=thunk -fcheck-pointer-bounds -mmpx -fpic -fno-plt" } */
++
++void bar (char *);
++char buf[10];
++
++int
++foo (void)
++{
++  bar (buf);
++  return 0;
++}
++
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" } } */
++/* { dg-final { scan-assembler "bnd jmp\[ \t\]*__x86_indirect_thunk" } } */
++/* { dg-final { scan-assembler "bnd jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler-times "bnd call\[ \t\]*\.LIND" 2 } } */
++/* { dg-final { scan-assembler "bnd ret" } } */
++/* { dg-final { scan-assembler {\tpause} } } */
++/* { dg-final { scan-assembler {\tlfence} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-1.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-1.c
+new file mode 100644
+index 0000000..49f27b4
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-1.c
+@@ -0,0 +1,19 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -mindirect-branch=thunk-extern -fno-pic" } */
++
++typedef void (*dispatch_t)(long offset);
++
++dispatch_t dispatch;
++
++void
++male_indirect_jump (long offset)
++{
++  dispatch(offset);
++}
++
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target x32 } } } */
++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
++/* { dg-final { scan-assembler-not "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler-not "call\[ \t\]*\.LIND" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-2.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-2.c
+new file mode 100644
+index 0000000..a1e3eb6
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-2.c
+@@ -0,0 +1,19 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -mindirect-branch=thunk-extern -fno-pic" } */
++
++typedef void (*dispatch_t)(long offset);
++
++dispatch_t dispatch[256];
++
++void
++male_indirect_jump (long offset)
++{
++  dispatch[offset](offset);
++}
++
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target x32 } } } */
++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
++/* { dg-final { scan-assembler-not "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler-not "call\[ \t\]*\.LIND" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-3.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-3.c
+new file mode 100644
+index 0000000..395634e
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-3.c
+@@ -0,0 +1,20 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -mindirect-branch=thunk-extern -fno-pic" } */
++
++typedef void (*dispatch_t)(long offset);
++
++dispatch_t dispatch;
++
++int
++male_indirect_jump (long offset)
++{
++  dispatch(offset);
++  return 0;
++}
++
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 1 { target { ! x32 } } } } */
++/* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 1 { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target x32 } } } */
++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-4.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-4.c
+new file mode 100644
+index 0000000..fd3f633
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-4.c
+@@ -0,0 +1,20 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -mindirect-branch=thunk-extern -fno-pic" } */
++
++typedef void (*dispatch_t)(long offset);
++
++dispatch_t dispatch[256];
++
++int
++male_indirect_jump (long offset)
++{
++  dispatch[offset](offset);
++  return 0;
++}
++
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 1 { target { ! x32 } } } } */
++/* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 1 { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target x32 } } } */
++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-5.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-5.c
+new file mode 100644
+index 0000000..ba2f92b
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-5.c
+@@ -0,0 +1,16 @@
++/* { dg-do compile { target *-*-linux* } } */
++/* { dg-options "-O2 -fpic -fno-plt -mindirect-branch=thunk-extern" } */
++
++extern void bar (void);
++
++void
++foo (void)
++{
++  bar ();
++}
++
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" } } */
++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
++/* { dg-final { scan-assembler-not "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler-not "call\[ \t\]*\.LIND" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-6.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-6.c
+new file mode 100644
+index 0000000..0c5a2d4
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-6.c
+@@ -0,0 +1,17 @@
++/* { dg-do compile { target *-*-linux* } } */
++/* { dg-options "-O2 -fpic -fno-plt -mindirect-branch=thunk-extern" } */
++
++extern void bar (void);
++
++int
++foo (void)
++{
++  bar ();
++  return 0;
++}
++
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" } } */
++/* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 1 } } */
++/* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 1 } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" } } */
++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-7.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-7.c
+new file mode 100644
+index 0000000..6652523
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-7.c
+@@ -0,0 +1,43 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -mindirect-branch=thunk-extern -fno-pic" } */
++
++void func0 (void);
++void func1 (void);
++void func2 (void);
++void func3 (void);
++void func4 (void);
++void func4 (void);
++void func5 (void);
++
++void
++bar (int i)
++{
++  switch (i)
++    {
++    default:
++      func0 ();
++      break;
++    case 1:
++      func1 ();
++      break;
++    case 2:
++      func2 ();
++      break;
++    case 3:
++      func3 ();
++      break;
++    case 4:
++      func4 ();
++      break;
++    case 5:
++      func5 ();
++      break;
++    }
++}
++
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target x32 } } } */
++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
++/* { dg-final { scan-assembler-not "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler-not "call\[ \t\]*\.LIND" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-1.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-1.c
+new file mode 100644
+index 0000000..68c0ff7
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-1.c
+@@ -0,0 +1,20 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -mindirect-branch=thunk-inline -fno-pic" } */
++
++typedef void (*dispatch_t)(long offset);
++
++dispatch_t dispatch;
++
++void
++male_indirect_jump (long offset)
++{
++  dispatch(offset);
++}
++
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler {\tpause} } } */
++/* { dg-final { scan-assembler {\tlfence} } } */
++/* { dg-final { scan-assembler-not "__x86_indirect_thunk" } } */
++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-2.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-2.c
+new file mode 100644
+index 0000000..e2da1fc
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-2.c
+@@ -0,0 +1,20 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -mindirect-branch=thunk-inline -fno-pic" } */
++
++typedef void (*dispatch_t)(long offset);
++
++dispatch_t dispatch[256];
++
++void
++male_indirect_jump (long offset)
++{
++  dispatch[offset](offset);
++}
++
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler {\tpause} } } */
++/* { dg-final { scan-assembler {\tlfence} } } */
++/* { dg-final { scan-assembler-not "__x86_indirect_thunk" } } */
++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-3.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-3.c
+new file mode 100644
+index 0000000..244fec7
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-3.c
+@@ -0,0 +1,21 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -mindirect-branch=thunk-inline -fno-pic" } */
++
++typedef void (*dispatch_t)(long offset);
++
++dispatch_t dispatch;
++
++int
++male_indirect_jump (long offset)
++{
++  dispatch(offset);
++  return 0;
++}
++
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 2 } } */
++/* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 2 } } */
++/* { dg-final { scan-assembler-times {\tpause} 1 } } */
++/* { dg-final { scan-assembler-times {\tlfence} 1 } } */
++/* { dg-final { scan-assembler-not "__x86_indirect_thunk" } } */
++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-4.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-4.c
+new file mode 100644
+index 0000000..107ebe3
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-4.c
+@@ -0,0 +1,21 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -mindirect-branch=thunk-inline -fno-pic" } */
++
++typedef void (*dispatch_t)(long offset);
++
++dispatch_t dispatch[256];
++
++int
++male_indirect_jump (long offset)
++{
++  dispatch[offset](offset);
++  return 0;
++}
++
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 2 } } */
++/* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 2 } } */
++/* { dg-final { scan-assembler-times {\tpause} 1 } } */
++/* { dg-final { scan-assembler-times {\tlfence} 1 } } */
++/* { dg-final { scan-assembler-not "__x86_indirect_thunk" } } */
++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-5.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-5.c
+new file mode 100644
+index 0000000..17b04ef
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-5.c
+@@ -0,0 +1,17 @@
++/* { dg-do compile { target *-*-linux* } } */
++/* { dg-options "-O2 -fpic -fno-plt -mindirect-branch=thunk-inline" } */
++
++extern void bar (void);
++
++void
++foo (void)
++{
++  bar ();
++}
++
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler {\tpause} } } */
++/* { dg-final { scan-assembler {\tlfence} } } */
++/* { dg-final { scan-assembler-not "__x86_indirect_thunk" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-6.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-6.c
+new file mode 100644
+index 0000000..d9eb112
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-6.c
+@@ -0,0 +1,18 @@
++/* { dg-do compile { target *-*-linux* } } */
++/* { dg-options "-O2 -fpic -fno-plt -mindirect-branch=thunk-inline" } */
++
++extern void bar (void);
++
++int
++foo (void)
++{
++  bar ();
++  return 0;
++}
++
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" } } */
++/* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 2 } } */
++/* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 2 } } */
++/* { dg-final { scan-assembler-times {\tpause} 1 } } */
++/* { dg-final { scan-assembler-times {\tlfence} 1 } } */
++/* { dg-final { scan-assembler-not "__x86_indirect_thunk" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-7.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-7.c
+new file mode 100644
+index 0000000..d02b1dc
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-7.c
+@@ -0,0 +1,44 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -mindirect-branch=thunk-inline -fno-pic" } */
++
++void func0 (void);
++void func1 (void);
++void func2 (void);
++void func3 (void);
++void func4 (void);
++void func4 (void);
++void func5 (void);
++
++void
++bar (int i)
++{
++  switch (i)
++    {
++    default:
++      func0 ();
++      break;
++    case 1:
++      func1 ();
++      break;
++    case 2:
++      func2 ();
++      break;
++    case 3:
++      func3 ();
++      break;
++    case 4:
++      func4 ();
++      break;
++    case 5:
++      func5 ();
++      break;
++    }
++}
++
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler {\tpause} } } */
++/* { dg-final { scan-assembler {\tlfence} } } */
++/* { dg-final { scan-assembler-not "__x86_indirect_thunk" } } */
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/backport/0005-x86-Add-mfunction-return.patch b/meta/recipes-devtools/gcc/gcc-6.4/backport/0005-x86-Add-mfunction-return.patch
new file mode 100644
index 0000000..5354c77
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.4/backport/0005-x86-Add-mfunction-return.patch
@@ -0,0 +1,1570 @@
+From e3270814b9e0caad63fbcdfd7ae9da2d52c97497 Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Sat, 6 Jan 2018 22:29:56 -0800
+Subject: [PATCH 05/12] x86: Add -mfunction-return=
+
+Add -mfunction-return= option to convert function return to call and
+return thunks.  The default is 'keep', which keeps function return
+unmodified.  'thunk' converts function return to call and return thunk.
+'thunk-inline' converts function return to inlined call and return thunk.
+'thunk-extern' converts function return to external call and return
+thunk provided in a separate object file.  You can control this behavior
+for a specific function by using the function attribute function_return.
+
+Function return thunk is the same as memory thunk for -mindirect-branch=
+where the return address is at the top of the stack:
+
+__x86_return_thunk:
+	call L2
+L1:
+	pause
+	lfence
+	jmp L1
+L2:
+	lea 8(%rsp), %rsp|lea 4(%esp), %esp
+	ret
+
+and function return becomes
+
+	jmp __x86_return_thunk
+
+-mindirect-branch= tests are updated with -mfunction-return=keep to
+avoid false test failures when -mfunction-return=thunk is added to
+RUNTESTFLAGS for "make check".
+
+gcc/
+
+	Backport from mainline
+	2018-01-14  H.J. Lu  <hongjiu.lu@intel.com>
+
+	* config/i386/i386-protos.h (ix86_output_function_return): New.
+	* config/i386/i386.c (ix86_set_indirect_branch_type): Also
+	set function_return_type.
+	(indirect_thunk_name): Add ret_p to indicate thunk for function
+	return.
+	(output_indirect_thunk_function): Pass false to
+	indirect_thunk_name.
+	(ix86_output_indirect_branch_via_reg): Likewise.
+	(ix86_output_indirect_branch_via_push): Likewise.
+	(output_indirect_thunk_function): Create alias for function
+	return thunk if regno < 0.
+	(ix86_output_function_return): New function.
+	(ix86_handle_fndecl_attribute): Handle function_return.
+	(ix86_attribute_table): Add function_return.
+	* config/i386/i386.h (machine_function): Add
+	function_return_type.
+	* config/i386/i386.md (simple_return_internal): Use
+	ix86_output_function_return.
+	(simple_return_internal_long): Likewise.
+	* config/i386/i386.opt (mfunction-return=): New option.
+	(indirect_branch): Mention -mfunction-return=.
+	* doc/extend.texi: Document function_return function attribute.
+	* doc/invoke.texi: Document -mfunction-return= option.
+
+gcc/testsuite/
+
+	Backport from mainline
+	2018-01-14  H.J. Lu  <hongjiu.lu@intel.com>
+
+	* gcc.target/i386/indirect-thunk-1.c (dg-options): Add
+	-mfunction-return=keep.
+	* gcc.target/i386/indirect-thunk-2.c: Likewise.
+	* gcc.target/i386/indirect-thunk-3.c: Likewise.
+	* gcc.target/i386/indirect-thunk-4.c: Likewise.
+	* gcc.target/i386/indirect-thunk-5.c: Likewise.
+	* gcc.target/i386/indirect-thunk-6.c: Likewise.
+	* gcc.target/i386/indirect-thunk-7.c: Likewise.
+	* gcc.target/i386/indirect-thunk-attr-1.c: Likewise.
+	* gcc.target/i386/indirect-thunk-attr-2.c: Likewise.
+	* gcc.target/i386/indirect-thunk-attr-3.c: Likewise.
+	* gcc.target/i386/indirect-thunk-attr-4.c: Likewise.
+	* gcc.target/i386/indirect-thunk-attr-5.c: Likewise.
+	* gcc.target/i386/indirect-thunk-attr-6.c: Likewise.
+	* gcc.target/i386/indirect-thunk-attr-7.c: Likewise.
+	* gcc.target/i386/indirect-thunk-attr-8.c: Likewise.
+	* gcc.target/i386/indirect-thunk-bnd-1.c: Likewise.
+	* gcc.target/i386/indirect-thunk-bnd-2.c: Likewise.
+	* gcc.target/i386/indirect-thunk-bnd-3.c: Likewise.
+	* gcc.target/i386/indirect-thunk-bnd-4.c: Likewise.
+	* gcc.target/i386/indirect-thunk-extern-1.c: Likewise.
+	* gcc.target/i386/indirect-thunk-extern-2.c: Likewise.
+	* gcc.target/i386/indirect-thunk-extern-3.c: Likewise.
+	* gcc.target/i386/indirect-thunk-extern-4.c: Likewise.
+	* gcc.target/i386/indirect-thunk-extern-5.c: Likewise.
+	* gcc.target/i386/indirect-thunk-extern-6.c: Likewise.
+	* gcc.target/i386/indirect-thunk-extern-7.c: Likewise.
+	* gcc.target/i386/indirect-thunk-inline-1.c: Likewise.
+	* gcc.target/i386/indirect-thunk-inline-2.c: Likewise.
+	* gcc.target/i386/indirect-thunk-inline-3.c: Likewise.
+	* gcc.target/i386/indirect-thunk-inline-4.c: Likewise.
+	* gcc.target/i386/indirect-thunk-inline-5.c: Likewise.
+	* gcc.target/i386/indirect-thunk-inline-6.c: Likewise.
+	* gcc.target/i386/indirect-thunk-inline-7.c: Likewise.
+	* gcc.target/i386/ret-thunk-1.c: New test.
+	* gcc.target/i386/ret-thunk-10.c: Likewise.
+	* gcc.target/i386/ret-thunk-11.c: Likewise.
+	* gcc.target/i386/ret-thunk-12.c: Likewise.
+	* gcc.target/i386/ret-thunk-13.c: Likewise.
+	* gcc.target/i386/ret-thunk-14.c: Likewise.
+	* gcc.target/i386/ret-thunk-15.c: Likewise.
+	* gcc.target/i386/ret-thunk-16.c: Likewise.
+	* gcc.target/i386/ret-thunk-2.c: Likewise.
+	* gcc.target/i386/ret-thunk-3.c: Likewise.
+	* gcc.target/i386/ret-thunk-4.c: Likewise.
+	* gcc.target/i386/ret-thunk-5.c: Likewise.
+	* gcc.target/i386/ret-thunk-6.c: Likewise.
+	* gcc.target/i386/ret-thunk-7.c: Likewise.
+	* gcc.target/i386/ret-thunk-8.c: Likewise.
+	* gcc.target/i386/ret-thunk-9.c: Likewise.
+
+i386: Don't use ASM_OUTPUT_DEF for TARGET_MACHO
+
+ASM_OUTPUT_DEF isn't defined for TARGET_MACHO.  Use ASM_OUTPUT_LABEL to
+generate the __x86_return_thunk label, instead of the set directive.
+Update testcase to remove the __x86_return_thunk label check.  Since
+-fno-pic is ignored on Darwin, update testcases to sscan or "push"
+only on Linux.
+
+gcc/
+
+	Backport from mainline
+	2018-01-15  H.J. Lu  <hongjiu.lu@intel.com>
+
+	PR target/83839
+	* config/i386/i386.c (output_indirect_thunk_function): Use
+	ASM_OUTPUT_LABEL, instead of ASM_OUTPUT_DEF, for TARGET_MACHO
+	for  __x86.return_thunk.
+
+gcc/testsuite/
+
+	Backport from mainline
+	2018-01-15  H.J. Lu  <hongjiu.lu@intel.com>
+
+	PR target/83839
+	* gcc.target/i386/indirect-thunk-1.c: Scan for "push" only on
+	Linux.
+	* gcc.target/i386/indirect-thunk-2.c: Likewise.
+	* gcc.target/i386/indirect-thunk-3.c: Likewise.
+	* gcc.target/i386/indirect-thunk-4.c: Likewise.
+	* gcc.target/i386/indirect-thunk-7.c: Likewise.
+	* gcc.target/i386/indirect-thunk-attr-1.c: Likewise.
+	* gcc.target/i386/indirect-thunk-attr-2.c: Likewise.
+	* gcc.target/i386/indirect-thunk-attr-5.c: Likewise.
+	* gcc.target/i386/indirect-thunk-attr-6.c: Likewise.
+	* gcc.target/i386/indirect-thunk-attr-7.c: Likewise.
+	* gcc.target/i386/indirect-thunk-extern-1.c: Likewise.
+	* gcc.target/i386/indirect-thunk-extern-2.c: Likewise.
+	* gcc.target/i386/indirect-thunk-extern-3.c: Likewise.
+	* gcc.target/i386/indirect-thunk-extern-4.c: Likewise.
+	* gcc.target/i386/indirect-thunk-extern-7.c: Likewise.
+	* gcc.target/i386/indirect-thunk-register-1.c: Likewise.
+	* gcc.target/i386/indirect-thunk-register-3.c: Likewise.
+	* gcc.target/i386/indirect-thunk-register-4.c: Likewise.
+	* gcc.target/i386/ret-thunk-10.c: Likewise.
+	* gcc.target/i386/ret-thunk-11.c: Likewise.
+	* gcc.target/i386/ret-thunk-12.c: Likewise.
+	* gcc.target/i386/ret-thunk-13.c: Likewise.
+	* gcc.target/i386/ret-thunk-14.c: Likewise.
+	* gcc.target/i386/ret-thunk-15.c: Likewise.
+	* gcc.target/i386/ret-thunk-9.c: Don't check the
+	__x86_return_thunk label.
+	Scan for "push" only for Linux.
+
+Upstream-Status: Pending
+
+Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
+
+---
+ gcc/config/i386/i386-protos.h                      |   1 +
+ gcc/config/i386/i386.c                             | 152 +++++++++++++++++++--
+ gcc/config/i386/i386.h                             |   3 +
+ gcc/config/i386/i386.md                            |   9 +-
+ gcc/config/i386/i386.opt                           |   6 +-
+ gcc/doc/extend.texi                                |   9 ++
+ gcc/doc/invoke.texi                                |  14 +-
+ gcc/testsuite/gcc.target/i386/indirect-thunk-1.c   |   4 +-
+ gcc/testsuite/gcc.target/i386/indirect-thunk-2.c   |   4 +-
+ gcc/testsuite/gcc.target/i386/indirect-thunk-3.c   |   4 +-
+ gcc/testsuite/gcc.target/i386/indirect-thunk-4.c   |   4 +-
+ gcc/testsuite/gcc.target/i386/indirect-thunk-5.c   |   2 +-
+ gcc/testsuite/gcc.target/i386/indirect-thunk-6.c   |   2 +-
+ gcc/testsuite/gcc.target/i386/indirect-thunk-7.c   |   4 +-
+ .../gcc.target/i386/indirect-thunk-attr-1.c        |   4 +-
+ .../gcc.target/i386/indirect-thunk-attr-2.c        |   4 +-
+ .../gcc.target/i386/indirect-thunk-attr-3.c        |   4 +-
+ .../gcc.target/i386/indirect-thunk-attr-4.c        |   4 +-
+ .../gcc.target/i386/indirect-thunk-attr-5.c        |   4 +-
+ .../gcc.target/i386/indirect-thunk-attr-6.c        |   4 +-
+ .../gcc.target/i386/indirect-thunk-attr-7.c        |   4 +-
+ .../gcc.target/i386/indirect-thunk-attr-8.c        |   2 +-
+ .../gcc.target/i386/indirect-thunk-bnd-1.c         |   4 +-
+ .../gcc.target/i386/indirect-thunk-bnd-2.c         |   4 +-
+ .../gcc.target/i386/indirect-thunk-bnd-3.c         |   2 +-
+ .../gcc.target/i386/indirect-thunk-bnd-4.c         |   2 +-
+ .../gcc.target/i386/indirect-thunk-extern-1.c      |   4 +-
+ .../gcc.target/i386/indirect-thunk-extern-2.c      |   4 +-
+ .../gcc.target/i386/indirect-thunk-extern-3.c      |   4 +-
+ .../gcc.target/i386/indirect-thunk-extern-4.c      |   4 +-
+ .../gcc.target/i386/indirect-thunk-extern-5.c      |   2 +-
+ .../gcc.target/i386/indirect-thunk-extern-6.c      |   2 +-
+ .../gcc.target/i386/indirect-thunk-extern-7.c      |   4 +-
+ .../gcc.target/i386/indirect-thunk-inline-1.c      |   4 +-
+ .../gcc.target/i386/indirect-thunk-inline-2.c      |   4 +-
+ .../gcc.target/i386/indirect-thunk-inline-3.c      |   4 +-
+ .../gcc.target/i386/indirect-thunk-inline-4.c      |   4 +-
+ .../gcc.target/i386/indirect-thunk-inline-5.c      |   2 +-
+ .../gcc.target/i386/indirect-thunk-inline-6.c      |   2 +-
+ .../gcc.target/i386/indirect-thunk-inline-7.c      |   4 +-
+ gcc/testsuite/gcc.target/i386/ret-thunk-1.c        |  13 ++
+ gcc/testsuite/gcc.target/i386/ret-thunk-10.c       |  23 ++++
+ gcc/testsuite/gcc.target/i386/ret-thunk-11.c       |  23 ++++
+ gcc/testsuite/gcc.target/i386/ret-thunk-12.c       |  22 +++
+ gcc/testsuite/gcc.target/i386/ret-thunk-13.c       |  22 +++
+ gcc/testsuite/gcc.target/i386/ret-thunk-14.c       |  22 +++
+ gcc/testsuite/gcc.target/i386/ret-thunk-15.c       |  22 +++
+ gcc/testsuite/gcc.target/i386/ret-thunk-16.c       |  18 +++
+ gcc/testsuite/gcc.target/i386/ret-thunk-2.c        |  13 ++
+ gcc/testsuite/gcc.target/i386/ret-thunk-3.c        |  12 ++
+ gcc/testsuite/gcc.target/i386/ret-thunk-4.c        |  12 ++
+ gcc/testsuite/gcc.target/i386/ret-thunk-5.c        |  15 ++
+ gcc/testsuite/gcc.target/i386/ret-thunk-6.c        |  14 ++
+ gcc/testsuite/gcc.target/i386/ret-thunk-7.c        |  13 ++
+ gcc/testsuite/gcc.target/i386/ret-thunk-8.c        |  14 ++
+ gcc/testsuite/gcc.target/i386/ret-thunk-9.c        |  24 ++++
+ 56 files changed, 516 insertions(+), 74 deletions(-)
+ create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-1.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-10.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-11.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-12.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-13.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-14.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-15.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-16.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-2.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-3.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-4.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-5.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-6.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-7.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-8.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-9.c
+
+diff --git a/gcc/config/i386/i386-protos.h b/gcc/config/i386/i386-protos.h
+index eca4cbf..620d70e 100644
+--- a/gcc/config/i386/i386-protos.h
++++ b/gcc/config/i386/i386-protos.h
+@@ -312,6 +312,7 @@ extern enum attr_cpu ix86_schedule;
+ 
+ extern const char * ix86_output_call_insn (rtx_insn *insn, rtx call_op);
+ extern const char * ix86_output_indirect_jmp (rtx call_op, bool ret_p);
++extern const char * ix86_output_function_return (bool long_p);
+ extern bool ix86_operands_ok_for_move_multiple (rtx *operands, bool load,
+ 						enum machine_mode mode);
+ 
+diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c
+index 0b9fc4d..34e26a3 100644
+--- a/gcc/config/i386/i386.c
++++ b/gcc/config/i386/i386.c
+@@ -6390,6 +6390,31 @@ ix86_set_indirect_branch_type (tree fndecl)
+       else
+ 	cfun->machine->indirect_branch_type = ix86_indirect_branch;
+     }
++
++  if (cfun->machine->function_return_type == indirect_branch_unset)
++    {
++      tree attr = lookup_attribute ("function_return",
++				    DECL_ATTRIBUTES (fndecl));
++      if (attr != NULL)
++	{
++	  tree args = TREE_VALUE (attr);
++	  if (args == NULL)
++	    gcc_unreachable ();
++	  tree cst = TREE_VALUE (args);
++	  if (strcmp (TREE_STRING_POINTER (cst), "keep") == 0)
++	    cfun->machine->function_return_type = indirect_branch_keep;
++	  else if (strcmp (TREE_STRING_POINTER (cst), "thunk") == 0)
++	    cfun->machine->function_return_type = indirect_branch_thunk;
++	  else if (strcmp (TREE_STRING_POINTER (cst), "thunk-inline") == 0)
++	    cfun->machine->function_return_type = indirect_branch_thunk_inline;
++	  else if (strcmp (TREE_STRING_POINTER (cst), "thunk-extern") == 0)
++	    cfun->machine->function_return_type = indirect_branch_thunk_extern;
++	  else
++	    gcc_unreachable ();
++	}
++      else
++	cfun->machine->function_return_type = ix86_function_return;
++    }
+ }
+ 
+ /* Establish appropriate back-end context for processing the function
+@@ -11036,8 +11061,12 @@ static int indirect_thunks_bnd_used;
+ /* Fills in the label name that should be used for the indirect thunk.  */
+ 
+ static void
+-indirect_thunk_name (char name[32], int regno, bool need_bnd_p)
++indirect_thunk_name (char name[32], int regno, bool need_bnd_p,
++		     bool ret_p)
+ {
++  if (regno >= 0 && ret_p)
++    gcc_unreachable ();
++
+   if (USE_HIDDEN_LINKONCE)
+     {
+       const char *bnd = need_bnd_p ? "_bnd" : "";
+@@ -11052,7 +11081,10 @@ indirect_thunk_name (char name[32], int regno, bool need_bnd_p)
+ 		   bnd, reg_prefix, reg_names[regno]);
+ 	}
+       else
+-	sprintf (name, "__x86_indirect_thunk%s", bnd);
++	{
++	  const char *ret = ret_p ? "return" : "indirect";
++	  sprintf (name, "__x86_%s_thunk%s", ret, bnd);
++	}
+     }
+   else
+     {
+@@ -11065,10 +11097,20 @@ indirect_thunk_name (char name[32], int regno, bool need_bnd_p)
+ 	}
+       else
+ 	{
+-	  if (need_bnd_p)
+-	    ASM_GENERATE_INTERNAL_LABEL (name, "LITB", 0);
++	  if (ret_p)
++	    {
++	      if (need_bnd_p)
++		ASM_GENERATE_INTERNAL_LABEL (name, "LRTB", 0);
++	      else
++		ASM_GENERATE_INTERNAL_LABEL (name, "LRT", 0);
++	    }
+ 	  else
+-	    ASM_GENERATE_INTERNAL_LABEL (name, "LIT", 0);
++	    {
++	      if (need_bnd_p)
++		ASM_GENERATE_INTERNAL_LABEL (name, "LITB", 0);
++	      else
++		ASM_GENERATE_INTERNAL_LABEL (name, "LIT", 0);
++	    }
+ 	}
+     }
+ }
+@@ -11163,7 +11205,7 @@ output_indirect_thunk_function (bool need_bnd_p, int regno)
+   tree decl;
+ 
+   /* Create __x86_indirect_thunk/__x86_indirect_thunk_bnd.  */
+-  indirect_thunk_name (name, regno, need_bnd_p);
++  indirect_thunk_name (name, regno, need_bnd_p, false);
+   decl = build_decl (BUILTINS_LOCATION, FUNCTION_DECL,
+ 		     get_identifier (name),
+ 		     build_function_type_list (void_type_node, NULL_TREE));
+@@ -11206,6 +11248,36 @@ output_indirect_thunk_function (bool need_bnd_p, int regno)
+ 	ASM_OUTPUT_LABEL (asm_out_file, name);
+       }
+ 
++  if (regno < 0)
++    {
++      /* Create alias for __x86.return_thunk/__x86.return_thunk_bnd.  */
++      char alias[32];
++
++      indirect_thunk_name (alias, regno, need_bnd_p, true);
++#if TARGET_MACHO
++      if (TARGET_MACHO)
++	{
++	  fputs ("\t.weak_definition\t", asm_out_file);
++	  assemble_name (asm_out_file, alias);
++	  fputs ("\n\t.private_extern\t", asm_out_file);
++	  assemble_name (asm_out_file, alias);
++	  putc ('\n', asm_out_file);
++	  ASM_OUTPUT_LABEL (asm_out_file, alias);
++	}
++#else
++      ASM_OUTPUT_DEF (asm_out_file, alias, name);
++      if (USE_HIDDEN_LINKONCE)
++	{
++	  fputs ("\t.globl\t", asm_out_file);
++	  assemble_name (asm_out_file, alias);
++	  putc ('\n', asm_out_file);
++	  fputs ("\t.hidden\t", asm_out_file);
++	  assemble_name (asm_out_file, alias);
++	  putc ('\n', asm_out_file);
++	}
++#endif
++    }
++
+   DECL_INITIAL (decl) = make_node (BLOCK);
+   current_function_decl = decl;
+   allocate_struct_function (decl, false);
+@@ -27687,7 +27759,7 @@ ix86_output_indirect_branch_via_reg (rtx call_op, bool sibcall_p)
+ 	  else
+ 	    indirect_thunks_used |= 1 << i;
+ 	}
+-      indirect_thunk_name (thunk_name_buf, regno, need_bnd_p);
++      indirect_thunk_name (thunk_name_buf, regno, need_bnd_p, false);
+       thunk_name = thunk_name_buf;
+     }
+   else
+@@ -27796,7 +27868,7 @@ ix86_output_indirect_branch_via_push (rtx call_op, const char *xasm,
+ 	  else
+ 	    indirect_thunk_needed = true;
+ 	}
+-      indirect_thunk_name (thunk_name_buf, regno, need_bnd_p);
++      indirect_thunk_name (thunk_name_buf, regno, need_bnd_p, false);
+       thunk_name = thunk_name_buf;
+     }
+   else
+@@ -27931,6 +28003,46 @@ ix86_output_indirect_jmp (rtx call_op, bool ret_p)
+     return "%!jmp\t%A0";
+ }
+ 
++/* Output function return.  CALL_OP is the jump target.  Add a REP
++   prefix to RET if LONG_P is true and function return is kept.  */
++
++const char *
++ix86_output_function_return (bool long_p)
++{
++  if (cfun->machine->function_return_type != indirect_branch_keep)
++    {
++      char thunk_name[32];
++      bool need_bnd_p = ix86_bnd_prefixed_insn_p (current_output_insn);
++
++      if (cfun->machine->function_return_type
++	  != indirect_branch_thunk_inline)
++	{
++	  bool need_thunk = (cfun->machine->function_return_type
++			     == indirect_branch_thunk);
++	  indirect_thunk_name (thunk_name, -1, need_bnd_p, true);
++	  if (need_bnd_p)
++	    {
++	      indirect_thunk_bnd_needed |= need_thunk;
++	      fprintf (asm_out_file, "\tbnd jmp\t%s\n", thunk_name);
++	    }
++	  else
++	    {
++	      indirect_thunk_needed |= need_thunk;
++	      fprintf (asm_out_file, "\tjmp\t%s\n", thunk_name);
++	    }
++	}
++      else
++	output_indirect_thunk (need_bnd_p, -1);
++
++      return "";
++    }
++
++  if (!long_p || ix86_bnd_prefixed_insn_p (current_output_insn))
++    return "%!ret";
++
++  return "rep%; ret";
++}
++
+ /* Output the assembly for a call instruction.  */
+ 
+ const char *
+@@ -45461,6 +45573,28 @@ ix86_handle_fndecl_attribute (tree *node, tree name, tree args, int,
+ 	}
+     }
+ 
++  if (is_attribute_p ("function_return", name))
++    {
++      tree cst = TREE_VALUE (args);
++      if (TREE_CODE (cst) != STRING_CST)
++	{
++	  warning (OPT_Wattributes,
++		   "%qE attribute requires a string constant argument",
++		   name);
++	  *no_add_attrs = true;
++	}
++      else if (strcmp (TREE_STRING_POINTER (cst), "keep") != 0
++	       && strcmp (TREE_STRING_POINTER (cst), "thunk") != 0
++	       && strcmp (TREE_STRING_POINTER (cst), "thunk-inline") != 0
++	       && strcmp (TREE_STRING_POINTER (cst), "thunk-extern") != 0)
++	{
++	  warning (OPT_Wattributes,
++		   "argument to %qE attribute is not "
++		   "(keep|thunk|thunk-inline|thunk-extern)", name);
++	  *no_add_attrs = true;
++	}
++    }
++
+   return NULL_TREE;
+ }
+ 
+@@ -49690,6 +49824,8 @@ static const struct attribute_spec ix86_attribute_table[] =
+     ix86_handle_callee_pop_aggregate_return, true },
+   { "indirect_branch", 1, 1, true, false, false,
+     ix86_handle_fndecl_attribute, false },
++  { "function_return", 1, 1, true, false, false,
++    ix86_handle_fndecl_attribute, false },
+ 
+   /* End element.  */
+   { NULL,        0, 0, false, false, false, NULL, false }
+diff --git a/gcc/config/i386/i386.h b/gcc/config/i386/i386.h
+index 9dccdb0..b34bc11 100644
+--- a/gcc/config/i386/i386.h
++++ b/gcc/config/i386/i386.h
+@@ -2579,6 +2579,9 @@ struct GTY(()) machine_function {
+      "indirect_jump" or "tablejump".  */
+   BOOL_BITFIELD has_local_indirect_jump : 1;
+ 
++  /* How to generate function return.  */
++  ENUM_BITFIELD(indirect_branch) function_return_type : 3;
++
+   /* If true, there is register available for argument passing.  This
+      is used only in ix86_function_ok_for_sibcall by 32-bit to determine
+      if there is scratch register available for indirect sibcall.  In
+diff --git a/gcc/config/i386/i386.md b/gcc/config/i386/i386.md
+index 153e162..2da671e 100644
+--- a/gcc/config/i386/i386.md
++++ b/gcc/config/i386/i386.md
+@@ -12489,7 +12489,7 @@
+ (define_insn "simple_return_internal"
+   [(simple_return)]
+   "reload_completed"
+-  "%!ret"
++  "* return ix86_output_function_return (false);"
+   [(set_attr "length" "1")
+    (set_attr "atom_unit" "jeu")
+    (set_attr "length_immediate" "0")
+@@ -12503,12 +12503,7 @@
+   [(simple_return)
+    (unspec [(const_int 0)] UNSPEC_REP)]
+   "reload_completed"
+-{
+-  if (ix86_bnd_prefixed_insn_p (insn))
+-    return "%!ret";
+-
+-  return "rep%; ret";
+-}
++  "* return ix86_output_function_return (true);"
+   [(set_attr "length" "2")
+    (set_attr "atom_unit" "jeu")
+    (set_attr "length_immediate" "0")
+diff --git a/gcc/config/i386/i386.opt b/gcc/config/i386/i386.opt
+index 5ffa334..ad5916f 100644
+--- a/gcc/config/i386/i386.opt
++++ b/gcc/config/i386/i386.opt
+@@ -902,9 +902,13 @@ mindirect-branch=
+ Target Report RejectNegative Joined Enum(indirect_branch) Var(ix86_indirect_branch) Init(indirect_branch_keep)
+ Convert indirect call and jump to call and return thunks.
+ 
++mfunction-return=
++Target Report RejectNegative Joined Enum(indirect_branch) Var(ix86_function_return) Init(indirect_branch_keep)
++Convert function return to call and return thunk.
++
+ Enum
+ Name(indirect_branch) Type(enum indirect_branch)
+-Known indirect branch choices (for use with the -mindirect-branch= option):
++Known indirect branch choices (for use with the -mindirect-branch=/-mfunction-return= options):
+ 
+ EnumValue
+ Enum(indirect_branch) String(keep) Value(indirect_branch_keep)
+diff --git a/gcc/doc/extend.texi b/gcc/doc/extend.texi
+index 8668dae..2cb6bd1 100644
+--- a/gcc/doc/extend.texi
++++ b/gcc/doc/extend.texi
+@@ -5429,6 +5429,15 @@ call and jump to call and return thunk.  @samp{thunk-inline} converts
+ indirect call and jump to inlined call and return thunk.
+ @samp{thunk-extern} converts indirect call and jump to external call
+ and return thunk provided in a separate object file.
++
++@item function_return("@var{choice}")
++@cindex @code{function_return} function attribute, x86
++On x86 targets, the @code{function_return} attribute causes the compiler
++to convert function return with @var{choice}.  @samp{keep} keeps function
++return unmodified.  @samp{thunk} converts function return to call and
++return thunk.  @samp{thunk-inline} converts function return to inlined
++call and return thunk.  @samp{thunk-extern} converts function return to
++external call and return thunk provided in a separate object file.
+ @end table
+ 
+ On the x86, the inliner does not inline a
+diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
+index ff9a194..fa63dc5 100644
+--- a/gcc/doc/invoke.texi
++++ b/gcc/doc/invoke.texi
+@@ -1169,7 +1169,8 @@ See RS/6000 and PowerPC Options.
+ -msse2avx -mfentry -mrecord-mcount -mnop-mcount -m8bit-idiv @gol
+ -mavx256-split-unaligned-load -mavx256-split-unaligned-store @gol
+ -malign-data=@var{type} -mstack-protector-guard=@var{guard} @gol
+--mmitigate-rop -mindirect-branch=@var{choice}}
++-mmitigate-rop -mindirect-branch=@var{choice} @gol
++-mfunction-return=@var{choice}}
+ 
+ @emph{x86 Windows Options}
+ @gccoptlist{-mconsole -mcygwin -mno-cygwin -mdll @gol
+@@ -24229,6 +24230,17 @@ to external call and return thunk provided in a separate object file.
+ You can control this behavior for a specific function by using the
+ function attribute @code{indirect_branch}.  @xref{Function Attributes}.
+ 
++@item -mfunction-return=@var{choice}
++@opindex -mfunction-return
++Convert function return with @var{choice}.  The default is @samp{keep},
++which keeps function return unmodified.  @samp{thunk} converts function
++return to call and return thunk.  @samp{thunk-inline} converts function
++return to inlined call and return thunk.  @samp{thunk-extern} converts
++function return to external call and return thunk provided in a separate
++object file.  You can control this behavior for a specific function by
++using the function attribute @code{function_return}.
++@xref{Function Attributes}.
++
+ @end table
+ 
+ These @samp{-m} switches are supported in addition to the above
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-1.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-1.c
+index d983e1c..e365ef5 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-1.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-1.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mindirect-branch=thunk -fno-pic" } */
++/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk -fno-pic" } */
+ 
+ typedef void (*dispatch_t)(long offset);
+ 
+@@ -11,7 +11,7 @@ male_indirect_jump (long offset)
+   dispatch(offset);
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { { ! x32 } && *-*-linux* } } } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target x32 } } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-2.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-2.c
+index 58f09b4..05a51ad 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-2.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-2.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mindirect-branch=thunk -fno-pic" } */
++/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk -fno-pic" } */
+ 
+ typedef void (*dispatch_t)(long offset);
+ 
+@@ -11,7 +11,7 @@ male_indirect_jump (long offset)
+   dispatch[offset](offset);
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { { ! x32 } && *-*-linux* } } } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target x32 } } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-3.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-3.c
+index f20d35c..3c0d4c3 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-3.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-3.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mindirect-branch=thunk -fno-pic" } */
++/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk -fno-pic" } */
+ 
+ typedef void (*dispatch_t)(long offset);
+ 
+@@ -12,7 +12,7 @@ male_indirect_jump (long offset)
+   return 0;
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { { ! x32 } && *-*-linux* } } } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
+ /* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target x32 } } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-4.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-4.c
+index 0eff8fb..14d4ef6 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-4.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-4.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mindirect-branch=thunk -fno-pic" } */
++/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk -fno-pic" } */
+ 
+ typedef void (*dispatch_t)(long offset);
+ 
+@@ -12,7 +12,7 @@ male_indirect_jump (long offset)
+   return 0;
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { { ! x32 } && *-*-linux* } } } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
+ /* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target x32 } } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-5.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-5.c
+index a25b20d..b4836c3 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-5.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-5.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile { target *-*-linux* } } */
+-/* { dg-options "-O2 -fpic -fno-plt -mindirect-branch=thunk" } */
++/* { dg-options "-O2 -mfunction-return=keep -fpic -fno-plt -mindirect-branch=thunk" } */
+ 
+ extern void bar (void);
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-6.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-6.c
+index cff114a..1f06bd1 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-6.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-6.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile { target *-*-linux* } } */
+-/* { dg-options "-O2 -fpic -fno-plt -mindirect-branch=thunk" } */
++/* { dg-options "-O2 -mfunction-return=keep -fpic -fno-plt -mindirect-branch=thunk" } */
+ 
+ extern void bar (void);
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-7.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-7.c
+index afdb600..bc6b47a 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-7.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-7.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mindirect-branch=thunk -fno-pic" } */
++/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk -fno-pic" } */
+ 
+ void func0 (void);
+ void func1 (void);
+@@ -35,7 +35,7 @@ bar (int i)
+     }
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%" { target { { ! x32 } && *-*-linux* } } } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target x32 } } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-1.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-1.c
+index d64d978..2257be3 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-1.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-1.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -fno-pic" } */
++/* { dg-options "-O2 -mfunction-return=keep -fno-pic" } */
+ 
+ typedef void (*dispatch_t)(long offset);
+ 
+@@ -14,7 +14,7 @@ male_indirect_jump (long offset)
+   dispatch(offset);
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { { ! x32 } && *-*-linux* } } } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target x32 } } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-2.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-2.c
+index 9306745..e9cfdc5 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-2.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-2.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -fno-pic" } */
++/* { dg-options "-O2 -mfunction-return=keep -fno-pic" } */
+ 
+ typedef void (*dispatch_t)(long offset);
+ 
+@@ -12,7 +12,7 @@ male_indirect_jump (long offset)
+   dispatch[offset](offset);
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { { ! x32 } && *-*-linux* } } } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target x32 } } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-3.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-3.c
+index 97744d6..f938db0 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-3.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-3.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -fno-pic" } */
++/* { dg-options "-O2 -mfunction-return=keep -fno-pic" } */
+ 
+ typedef void (*dispatch_t)(long offset);
+ 
+@@ -14,7 +14,7 @@ male_indirect_jump (long offset)
+   return 0;
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { { ! x32 } && *-*-linux* } } } } */
+ /* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 2 } } */
+ /* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 2 } } */
+ /* { dg-final { scan-assembler {\tpause} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-4.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-4.c
+index bfce3ea..4e58599 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-4.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-4.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -fno-pic" } */
++/* { dg-options "-O2 -mfunction-return=keep -fno-pic" } */
+ 
+ typedef void (*dispatch_t)(long offset);
+ 
+@@ -13,7 +13,7 @@ male_indirect_jump (long offset)
+   return 0;
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { { ! x32 } && *-*-linux* } } } } */
+ /* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 2 } } */
+ /* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 2 } } */
+ /* { dg-final { scan-assembler {\tpause} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-5.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-5.c
+index 0833606..b8d5024 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-5.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-5.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -fno-pic" } */
++/* { dg-options "-O2 -mfunction-return=keep -fno-pic" } */
+ 
+ typedef void (*dispatch_t)(long offset);
+ 
+@@ -14,7 +14,7 @@ male_indirect_jump (long offset)
+   return 0;
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { { ! x32 } && *-*-linux* } } } } */
+ /* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 1 { target { ! x32 } } } } */
+ /* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 1 { target { ! x32 } } } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-6.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-6.c
+index 2eba0fb..455adab 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-6.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-6.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -fno-pic" } */
++/* { dg-options "-O2 -mfunction-return=keep -fno-pic" } */
+ 
+ typedef void (*dispatch_t)(long offset);
+ 
+@@ -13,7 +13,7 @@ male_indirect_jump (long offset)
+   return 0;
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { { ! x32 } && *-*-linux* } } } } */
+ /* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 1 { target { ! x32 } } } } */
+ /* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 1 { target { ! x32 } } } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-7.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-7.c
+index f58427e..4595b84 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-7.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-7.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -fno-pic" } */
++/* { dg-options "-O2 -mfunction-return=keep -fno-pic" } */
+ 
+ void func0 (void);
+ void func1 (void);
+@@ -36,7 +36,7 @@ bar (int i)
+     }
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%" { target { { ! x32 } && *-*-linux* } } } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target x32 } } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" } } */
+ /* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-8.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-8.c
+index 564ed39..d730d31 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-8.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-8.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mindirect-branch=thunk -fno-pic" } */
++/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk -fno-pic" } */
+ 
+ void func0 (void);
+ void func1 (void);
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-1.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-1.c
+index 50fbee2..5e3e118 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-1.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-1.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile { target { ! x32 } } } */
+-/* { dg-options "-O2 -mindirect-branch=thunk -fcheck-pointer-bounds -mmpx -fno-pic" } */
++/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk -fcheck-pointer-bounds -mmpx -fno-pic" } */
+ 
+ void (*dispatch) (char *);
+ char buf[10];
+@@ -10,7 +10,7 @@ foo (void)
+   dispatch (buf);
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { { ! x32 } && *-*-linux* } } } } */
+ /* { dg-final { scan-assembler "pushq\[ \t\]%rax" { target x32 } } } */
+ /* { dg-final { scan-assembler "bnd jmp\[ \t\]*__x86_indirect_thunk_bnd" } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-2.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-2.c
+index 2976e67..2801aa4 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-2.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-2.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile { target { ! x32 } } } */
+-/* { dg-options "-O2 -mindirect-branch=thunk -fcheck-pointer-bounds -mmpx -fno-pic" } */
++/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk -fcheck-pointer-bounds -mmpx -fno-pic" } */
+ 
+ void (*dispatch) (char *);
+ char buf[10];
+@@ -11,7 +11,7 @@ foo (void)
+   return 0;
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { { ! x32 } && *-*-linux* } } } } */
+ /* { dg-final { scan-assembler "pushq\[ \t\]%rax" { target x32 } } } */
+ /* { dg-final { scan-assembler "bnd jmp\[ \t\]*__x86_indirect_thunk_bnd" } } */
+ /* { dg-final { scan-assembler "bnd jmp\[ \t\]*\.LIND" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-3.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-3.c
+index da4bc98..70b4fb3 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-3.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-3.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile { target { *-*-linux* && { ! x32 } } } } */
+-/* { dg-options "-O2 -mindirect-branch=thunk -fcheck-pointer-bounds -mmpx -fpic -fno-plt" } */
++/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk -fcheck-pointer-bounds -mmpx -fpic -fno-plt" } */
+ 
+ void bar (char *);
+ char buf[10];
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-4.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-4.c
+index c64d12e..3baf03e 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-4.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-4.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile { target { *-*-linux* && { ! x32 } } } } */
+-/* { dg-options "-O2 -mindirect-branch=thunk -fcheck-pointer-bounds -mmpx -fpic -fno-plt" } */
++/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk -fcheck-pointer-bounds -mmpx -fpic -fno-plt" } */
+ 
+ void bar (char *);
+ char buf[10];
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-1.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-1.c
+index 49f27b4..edeb264 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-1.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-1.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mindirect-branch=thunk-extern -fno-pic" } */
++/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk-extern -fno-pic" } */
+ 
+ typedef void (*dispatch_t)(long offset);
+ 
+@@ -11,7 +11,7 @@ male_indirect_jump (long offset)
+   dispatch(offset);
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { { ! x32 } && *-*-linux* } } } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target x32 } } } */
+ /* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-2.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-2.c
+index a1e3eb6..1d00413 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-2.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-2.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mindirect-branch=thunk-extern -fno-pic" } */
++/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk-extern -fno-pic" } */
+ 
+ typedef void (*dispatch_t)(long offset);
+ 
+@@ -11,7 +11,7 @@ male_indirect_jump (long offset)
+   dispatch[offset](offset);
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { { ! x32 } && *-*-linux* } } } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target x32 } } } */
+ /* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-3.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-3.c
+index 395634e..06ebf1c 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-3.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-3.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mindirect-branch=thunk-extern -fno-pic" } */
++/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk-extern -fno-pic" } */
+ 
+ typedef void (*dispatch_t)(long offset);
+ 
+@@ -12,7 +12,7 @@ male_indirect_jump (long offset)
+   return 0;
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { { ! x32 } && *-*-linux* } } } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
+ /* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 1 { target { ! x32 } } } } */
+ /* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 1 { target { ! x32 } } } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-4.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-4.c
+index fd3f633..1c8f944 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-4.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-4.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mindirect-branch=thunk-extern -fno-pic" } */
++/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk-extern -fno-pic" } */
+ 
+ typedef void (*dispatch_t)(long offset);
+ 
+@@ -12,7 +12,7 @@ male_indirect_jump (long offset)
+   return 0;
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { { ! x32 } && *-*-linux* } } } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
+ /* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 1 { target { ! x32 } } } } */
+ /* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 1 { target { ! x32 } } } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-5.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-5.c
+index ba2f92b..21740ac 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-5.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-5.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile { target *-*-linux* } } */
+-/* { dg-options "-O2 -fpic -fno-plt -mindirect-branch=thunk-extern" } */
++/* { dg-options "-O2 -mfunction-return=keep -fpic -fno-plt -mindirect-branch=thunk-extern" } */
+ 
+ extern void bar (void);
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-6.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-6.c
+index 0c5a2d4..a77c1f4 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-6.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-6.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile { target *-*-linux* } } */
+-/* { dg-options "-O2 -fpic -fno-plt -mindirect-branch=thunk-extern" } */
++/* { dg-options "-O2 -mfunction-return=keep -fpic -fno-plt -mindirect-branch=thunk-extern" } */
+ 
+ extern void bar (void);
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-7.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-7.c
+index 6652523..86e9fd1 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-7.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-7.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mindirect-branch=thunk-extern -fno-pic" } */
++/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk-extern -fno-pic" } */
+ 
+ void func0 (void);
+ void func1 (void);
+@@ -35,7 +35,7 @@ bar (int i)
+     }
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%" { target { { ! x32 } && *-*-linux* } } } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target x32 } } } */
+ /* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-1.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-1.c
+index 68c0ff7..3ecde87 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-1.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-1.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mindirect-branch=thunk-inline -fno-pic" } */
++/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk-inline -fno-pic" } */
+ 
+ typedef void (*dispatch_t)(long offset);
+ 
+@@ -11,7 +11,7 @@ male_indirect_jump (long offset)
+   dispatch(offset);
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { { ! x32 } && *-*-linux* } } } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler {\tpause} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-2.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-2.c
+index e2da1fc..df32a19 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-2.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-2.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mindirect-branch=thunk-inline -fno-pic" } */
++/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk-inline -fno-pic" } */
+ 
+ typedef void (*dispatch_t)(long offset);
+ 
+@@ -11,7 +11,7 @@ male_indirect_jump (long offset)
+   dispatch[offset](offset);
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { { ! x32 } && *-*-linux* } } } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler {\tpause} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-3.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-3.c
+index 244fec7..9540996 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-3.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-3.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mindirect-branch=thunk-inline -fno-pic" } */
++/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk-inline -fno-pic" } */
+ 
+ typedef void (*dispatch_t)(long offset);
+ 
+@@ -12,7 +12,7 @@ male_indirect_jump (long offset)
+   return 0;
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { { ! x32 } && *-*-linux* } } } } */
+ /* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 2 } } */
+ /* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 2 } } */
+ /* { dg-final { scan-assembler-times {\tpause} 1 } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-4.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-4.c
+index 107ebe3..f3db6e2 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-4.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-4.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mindirect-branch=thunk-inline -fno-pic" } */
++/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk-inline -fno-pic" } */
+ 
+ typedef void (*dispatch_t)(long offset);
+ 
+@@ -12,7 +12,7 @@ male_indirect_jump (long offset)
+   return 0;
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { { ! x32 } && *-*-linux* } } } } */
+ /* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 2 } } */
+ /* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 2 } } */
+ /* { dg-final { scan-assembler-times {\tpause} 1 } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-5.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-5.c
+index 17b04ef..0f687c3 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-5.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-5.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile { target *-*-linux* } } */
+-/* { dg-options "-O2 -fpic -fno-plt -mindirect-branch=thunk-inline" } */
++/* { dg-options "-O2 -mfunction-return=keep -fpic -fno-plt -mindirect-branch=thunk-inline" } */
+ 
+ extern void bar (void);
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-6.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-6.c
+index d9eb112..b27c6fc 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-6.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-6.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile { target *-*-linux* } } */
+-/* { dg-options "-O2 -fpic -fno-plt -mindirect-branch=thunk-inline" } */
++/* { dg-options "-O2 -mfunction-return=keep -fpic -fno-plt -mindirect-branch=thunk-inline" } */
+ 
+ extern void bar (void);
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-7.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-7.c
+index d02b1dc..764a375 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-7.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-7.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mindirect-branch=thunk-inline -fno-pic" } */
++/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk-inline -fno-pic" } */
+ 
+ void func0 (void);
+ void func1 (void);
+@@ -35,7 +35,7 @@ bar (int i)
+     }
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%" { target { { ! x32 } && *-*-linux* } } } } */
+ /* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-1.c b/gcc/testsuite/gcc.target/i386/ret-thunk-1.c
+new file mode 100644
+index 0000000..7223f67
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-1.c
+@@ -0,0 +1,13 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -mfunction-return=thunk" } */
++
++void
++foo (void)
++{
++}
++
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_return_thunk" } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler {\tpause} } } */
++/* { dg-final { scan-assembler {\tlfence} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-10.c b/gcc/testsuite/gcc.target/i386/ret-thunk-10.c
+new file mode 100644
+index 0000000..3a6727b
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-10.c
+@@ -0,0 +1,23 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -mfunction-return=thunk-inline -mindirect-branch=thunk -fno-pic" } */
++
++extern void (*bar) (void);
++
++int
++foo (void)
++{
++  bar ();
++  return 0;
++}
++
++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler-not "jmp\[ \t\]*__x86_return_thunk" } } */
++/* { dg-final { scan-assembler-times {\tpause} 2 } } */
++/* { dg-final { scan-assembler-times {\tlfence} 2 } } */
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?bar" { target { { ! x32 } && *-*-linux* } } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } }  } } */
++/* { dg-final { scan-assembler "__x86_indirect_thunk:" { target { ! x32 } }  } } */
++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target { x32 } }  } } */
++/* { dg-final { scan-assembler "__x86_indirect_thunk_(r|e)ax:" { target { x32 } }  } } */
++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } } } */
+diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-11.c b/gcc/testsuite/gcc.target/i386/ret-thunk-11.c
+new file mode 100644
+index 0000000..b8f6818
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-11.c
+@@ -0,0 +1,23 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -mfunction-return=thunk-extern -mindirect-branch=thunk -fno-pic" } */
++
++extern void (*bar) (void);
++
++int
++foo (void)
++{
++  bar ();
++  return 0;
++}
++
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_return_thunk" } } */
++/* { dg-final { scan-assembler-times {\tpause} 1 } } */
++/* { dg-final { scan-assembler-times {\tlfence} 1 } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?bar" { target { { ! x32 } && *-*-linux* } } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "__x86_indirect_thunk:" { target { ! x32 } }  } } */
++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target { x32 } }  } } */
++/* { dg-final { scan-assembler "__x86_indirect_thunk_(r|e)ax:" { target { x32 } }  } } */
++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } } } */
+diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-12.c b/gcc/testsuite/gcc.target/i386/ret-thunk-12.c
+new file mode 100644
+index 0000000..01b0a02
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-12.c
+@@ -0,0 +1,22 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk -fno-pic" } */
++
++extern void (*bar) (void);
++
++int
++foo (void)
++{
++  bar ();
++  return 0;
++}
++
++/* { dg-final { scan-assembler-not "jmp\[ \t\]*__x86_return_thunk" } } */
++/* { dg-final { scan-assembler-times {\tpause} 1 } } */
++/* { dg-final { scan-assembler-times {\tlfence} 1 } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "__x86_indirect_thunk:" { target { ! x32 } }  } } */
++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target { x32 } }  } } */
++/* { dg-final { scan-assembler "__x86_indirect_thunk_(r|e)ax:" { target { x32 } }  } } */
++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } } } */
+diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-13.c b/gcc/testsuite/gcc.target/i386/ret-thunk-13.c
+new file mode 100644
+index 0000000..4b497b5
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-13.c
+@@ -0,0 +1,22 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk-inline -fno-pic" } */
++
++extern void (*bar) (void);
++extern int foo (void) __attribute__ ((function_return("thunk")));
++
++int
++foo (void)
++{
++  bar ();
++  return 0;
++}
++
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_return_thunk" } } */
++/* { dg-final { scan-assembler-times {\tpause} 2 } } */
++/* { dg-final { scan-assembler-times {\tlfence} 2 } } */
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?bar" { target { { ! x32 } && *-*-linux* } } } } */
++/* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 3 } } */
++/* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 3 } } */
++/* { dg-final { scan-assembler-not "jmp\[ \t\]*__x86_indirect_thunk" } } */
++/* { dg-final { scan-assembler-not "call\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target { x32 } }  } } */
++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } } } */
+diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-14.c b/gcc/testsuite/gcc.target/i386/ret-thunk-14.c
+new file mode 100644
+index 0000000..4ae4c44
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-14.c
+@@ -0,0 +1,22 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk-extern -fno-pic" } */
++
++extern void (*bar) (void);
++
++__attribute__ ((function_return("thunk-inline")))
++int
++foo (void)
++{
++  bar ();
++  return 0;
++}
++
++/* { dg-final { scan-assembler-times {\tpause} 1 } } */
++/* { dg-final { scan-assembler-times {\tlfence} 1 } } */
++/* { dg-final { scan-assembler-not "jmp\[ \t\]*__x86_return_thunk" } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?bar" { target { { ! x32 } && *-*-linux* } } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target { x32 } }  } } */
++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } } } */
+diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-15.c b/gcc/testsuite/gcc.target/i386/ret-thunk-15.c
+new file mode 100644
+index 0000000..5b5bc76
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-15.c
+@@ -0,0 +1,22 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=keep -fno-pic" } */
++
++extern void (*bar) (void);
++
++__attribute__ ((function_return("thunk-extern"), indirect_branch("thunk")))
++int
++foo (void)
++{
++  bar ();
++  return 0;
++}
++
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_return_thunk" } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler-times {\tpause} 1 } } */
++/* { dg-final { scan-assembler-times {\tlfence} 1 } } */
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?bar" { target { { ! x32 } && *-*-linux* } } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target x32 } } } */
++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } } } */
+diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-16.c b/gcc/testsuite/gcc.target/i386/ret-thunk-16.c
+new file mode 100644
+index 0000000..a16cad1
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-16.c
+@@ -0,0 +1,18 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -mfunction-return=thunk-inline -mindirect-branch=thunk-extern -fno-pic" } */
++
++extern void (*bar) (void);
++
++__attribute__ ((function_return("keep"), indirect_branch("keep")))
++int
++foo (void)
++{
++  bar ();
++  return 0;
++}
++
++/* { dg-final { scan-assembler-not "__x86_indirect_thunk" } } */
++/* { dg-final { scan-assembler-not "__x86_return_thunk" } } */
++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
++/* { dg-final { scan-assembler-not "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler-not "call\[ \t\]*\.LIND" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-2.c b/gcc/testsuite/gcc.target/i386/ret-thunk-2.c
+new file mode 100644
+index 0000000..c6659e3
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-2.c
+@@ -0,0 +1,13 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -mfunction-return=thunk-inline" } */
++
++void
++foo (void)
++{
++}
++
++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler {\tpause} } } */
++/* { dg-final { scan-assembler {\tlfence} } } */
++/* { dg-final { scan-assembler-not "jmp\[ \t\]*__x86_return_thunk" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-3.c b/gcc/testsuite/gcc.target/i386/ret-thunk-3.c
+new file mode 100644
+index 0000000..0f7f388
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-3.c
+@@ -0,0 +1,12 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -mfunction-return=thunk-extern" } */
++
++void
++foo (void)
++{
++}
++
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_return_thunk" } } */
++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
++/* { dg-final { scan-assembler-not "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler-not "call\[ \t\]*\.LIND" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-4.c b/gcc/testsuite/gcc.target/i386/ret-thunk-4.c
+new file mode 100644
+index 0000000..9ae37e8
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-4.c
+@@ -0,0 +1,12 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -mfunction-return=keep" } */
++
++void
++foo (void)
++{
++}
++
++/* { dg-final { scan-assembler-not "jmp\[ \t\]*__x86_return_thunk" } } */
++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
++/* { dg-final { scan-assembler-not "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler-not "call\[ \t\]*\.LIND" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-5.c b/gcc/testsuite/gcc.target/i386/ret-thunk-5.c
+new file mode 100644
+index 0000000..4bd0d2a
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-5.c
+@@ -0,0 +1,15 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -mfunction-return=keep" } */
++
++extern void foo (void) __attribute__ ((function_return("thunk")));
++
++void
++foo (void)
++{
++}
++
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_return_thunk" } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler {\tpause} } } */
++/* { dg-final { scan-assembler {\tlfence} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-6.c b/gcc/testsuite/gcc.target/i386/ret-thunk-6.c
+new file mode 100644
+index 0000000..053841f
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-6.c
+@@ -0,0 +1,14 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -mfunction-return=keep" } */
++
++__attribute__ ((function_return("thunk-inline")))
++void
++foo (void)
++{
++}
++
++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler {\tpause} } } */
++/* { dg-final { scan-assembler {\tlfence} } } */
++/* { dg-final { scan-assembler-not "jmp\[ \t\]*__x86_return_thunk" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-7.c b/gcc/testsuite/gcc.target/i386/ret-thunk-7.c
+new file mode 100644
+index 0000000..262e678
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-7.c
+@@ -0,0 +1,13 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -mfunction-return=keep" } */
++
++__attribute__ ((function_return("thunk-extern")))
++void
++foo (void)
++{
++}
++
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_return_thunk" } } */
++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
++/* { dg-final { scan-assembler-not "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler-not "call\[ \t\]*\.LIND" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-8.c b/gcc/testsuite/gcc.target/i386/ret-thunk-8.c
+new file mode 100644
+index 0000000..c1658e9
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-8.c
+@@ -0,0 +1,14 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -mfunction-return=thunk-inline" } */
++
++extern void foo (void) __attribute__ ((function_return("keep")));
++
++void
++foo (void)
++{
++}
++
++/* { dg-final { scan-assembler-not "jmp\[ \t\]*__x86_return_thunk" } } */
++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
++/* { dg-final { scan-assembler-not "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler-not "call\[ \t\]*\.LIND" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-9.c b/gcc/testsuite/gcc.target/i386/ret-thunk-9.c
+new file mode 100644
+index 0000000..fa24a1f
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-9.c
+@@ -0,0 +1,24 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -mfunction-return=thunk -mindirect-branch=thunk -fno-pic" } */
++
++extern void (*bar) (void);
++
++int
++foo (void)
++{
++  bar ();
++  return 0;
++}
++
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_return_thunk" } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler "__x86_indirect_thunk:" } } */
++/* { dg-final { scan-assembler-times {\tpause} 1 { target { ! x32 } } } } */
++/* { dg-final { scan-assembler-times {\tlfence} 1 { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?bar" { target { { ! x32 } && *-*-linux* } } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler-times {\tpause} 2 { target { x32 } } } } */
++/* { dg-final { scan-assembler-times {\tlfence} 2 { target { x32 } } } } */
++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target { x32 } } } } */
++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } } } */
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/backport/0006-x86-Add-mindirect-branch-register.patch b/meta/recipes-devtools/gcc/gcc-6.4/backport/0006-x86-Add-mindirect-branch-register.patch
new file mode 100644
index 0000000..ad73691
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.4/backport/0006-x86-Add-mindirect-branch-register.patch
@@ -0,0 +1,946 @@
+From 3f1c39fb543884d36e759a6dc196a8e914eb4f73 Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Sat, 6 Jan 2018 22:29:56 -0800
+Subject: [PATCH 06/12] x86: Add -mindirect-branch-register
+
+Add -mindirect-branch-register to force indirect branch via register.
+This is implemented by disabling patterns of indirect branch via memory,
+similar to TARGET_X32.
+
+-mindirect-branch= and -mfunction-return= tests are updated with
+-mno-indirect-branch-register to avoid false test failures when
+-mindirect-branch-register is added to RUNTESTFLAGS for "make check".
+
+gcc/
+
+	Backport from mainline
+	2018-01-14  H.J. Lu  <hongjiu.lu@intel.com>
+
+	* config/i386/constraints.md (Bs): Disallow memory operand for
+	-mindirect-branch-register.
+	(Bw): Likewise.
+	* config/i386/predicates.md (indirect_branch_operand): Likewise.
+	(GOT_memory_operand): Likewise.
+	(call_insn_operand): Likewise.
+	(sibcall_insn_operand): Likewise.
+	(GOT32_symbol_operand): Likewise.
+	* config/i386/i386.md (indirect_jump): Call convert_memory_address
+	for -mindirect-branch-register.
+	(tablejump): Likewise.
+	(*sibcall_memory): Likewise.
+	(*sibcall_value_memory): Likewise.
+	Disallow peepholes of indirect call and jump via memory for
+	-mindirect-branch-register.
+	(*call_pop): Replace m with Bw.
+	(*call_value_pop): Likewise.
+	(*sibcall_pop_memory): Replace m with Bs.
+	* config/i386/i386.opt (mindirect-branch-register): New option.
+	* doc/invoke.texi: Document -mindirect-branch-register option.
+
+gcc/testsuite/
+
+	Backport from mainline
+	2018-01-14  H.J. Lu  <hongjiu.lu@intel.com>
+
+	* gcc.target/i386/indirect-thunk-1.c (dg-options): Add
+	-mno-indirect-branch-register.
+	* gcc.target/i386/indirect-thunk-2.c: Likewise.
+	* gcc.target/i386/indirect-thunk-3.c: Likewise.
+	* gcc.target/i386/indirect-thunk-4.c: Likewise.
+	* gcc.target/i386/indirect-thunk-5.c: Likewise.
+	* gcc.target/i386/indirect-thunk-6.c: Likewise.
+	* gcc.target/i386/indirect-thunk-7.c: Likewise.
+	* gcc.target/i386/indirect-thunk-attr-1.c: Likewise.
+	* gcc.target/i386/indirect-thunk-attr-2.c: Likewise.
+	* gcc.target/i386/indirect-thunk-attr-3.c: Likewise.
+	* gcc.target/i386/indirect-thunk-attr-4.c: Likewise.
+	* gcc.target/i386/indirect-thunk-attr-5.c: Likewise.
+	* gcc.target/i386/indirect-thunk-attr-6.c: Likewise.
+	* gcc.target/i386/indirect-thunk-attr-7.c: Likewise.
+	* gcc.target/i386/indirect-thunk-bnd-1.c: Likewise.
+	* gcc.target/i386/indirect-thunk-bnd-2.c: Likewise.
+	* gcc.target/i386/indirect-thunk-bnd-3.c: Likewise.
+	* gcc.target/i386/indirect-thunk-bnd-4.c: Likewise.
+	* gcc.target/i386/indirect-thunk-extern-1.c: Likewise.
+	* gcc.target/i386/indirect-thunk-extern-2.c: Likewise.
+	* gcc.target/i386/indirect-thunk-extern-3.c: Likewise.
+	* gcc.target/i386/indirect-thunk-extern-4.c: Likewise.
+	* gcc.target/i386/indirect-thunk-extern-5.c: Likewise.
+	* gcc.target/i386/indirect-thunk-extern-6.c: Likewise.
+	* gcc.target/i386/indirect-thunk-extern-7.c: Likewise.
+	* gcc.target/i386/indirect-thunk-inline-1.c: Likewise.
+	* gcc.target/i386/indirect-thunk-inline-2.c: Likewise.
+	* gcc.target/i386/indirect-thunk-inline-3.c: Likewise.
+	* gcc.target/i386/indirect-thunk-inline-4.c: Likewise.
+	* gcc.target/i386/indirect-thunk-inline-5.c: Likewise.
+	* gcc.target/i386/indirect-thunk-inline-6.c: Likewise.
+	* gcc.target/i386/indirect-thunk-inline-7.c: Likewise.
+	* gcc.target/i386/ret-thunk-10.c: Likewise.
+	* gcc.target/i386/ret-thunk-11.c: Likewise.
+	* gcc.target/i386/ret-thunk-12.c: Likewise.
+	* gcc.target/i386/ret-thunk-13.c: Likewise.
+	* gcc.target/i386/ret-thunk-14.c: Likewise.
+	* gcc.target/i386/ret-thunk-15.c: Likewise.
+	* gcc.target/i386/ret-thunk-9.c: Likewise.
+	* gcc.target/i386/indirect-thunk-register-1.c: New test.
+	* gcc.target/i386/indirect-thunk-register-2.c: Likewise.
+	* gcc.target/i386/indirect-thunk-register-3.c: Likewise.
+
+i386: Rename to ix86_indirect_branch_register
+
+Rename the variable for -mindirect-branch-register to
+ix86_indirect_branch_register to match the command-line option name.
+
+	Backport from mainline
+	2018-01-15  H.J. Lu  <hongjiu.lu@intel.com>
+
+	* config/i386/constraints.md (Bs): Replace
+	ix86_indirect_branch_thunk_register with
+	ix86_indirect_branch_register.
+	(Bw): Likewise.
+	* config/i386/i386.md (indirect_jump): Likewise.
+	(tablejump): Likewise.
+	(*sibcall_memory): Likewise.
+	(*sibcall_value_memory): Likewise.
+	Peepholes of indirect call and jump via memory: Likewise.
+	* config/i386/i386.opt: Likewise.
+	* config/i386/predicates.md (indirect_branch_operand): Likewise.
+	(GOT_memory_operand): Likewise.
+	(call_insn_operand): Likewise.
+	(sibcall_insn_operand): Likewise.
+	(GOT32_symbol_operand): Likewise.
+
+x86: Rewrite ix86_indirect_branch_register logic
+
+Rewrite ix86_indirect_branch_register logic with
+
+(and (not (match_test "ix86_indirect_branch_register"))
+     (original condition before r256662))
+
+	Backport from mainline
+	2018-01-15  H.J. Lu  <hongjiu.lu@intel.com>
+
+	* config/i386/predicates.md (constant_call_address_operand):
+	Rewrite ix86_indirect_branch_register logic.
+	(sibcall_insn_operand): Likewise.
+
+Don't check ix86_indirect_branch_register for GOT operand
+
+Since GOT_memory_operand and GOT32_symbol_operand are simple pattern
+matches, don't check ix86_indirect_branch_register here.  If needed,
+-mindirect-branch= will convert indirect branch via GOT slot to a call
+and return thunk.
+
+	Backport from mainline
+	2018-01-15  H.J. Lu  <hongjiu.lu@intel.com>
+
+	* config/i386/constraints.md (Bs): Update
+	ix86_indirect_branch_register check.  Don't check
+	ix86_indirect_branch_register with GOT_memory_operand.
+	(Bw): Likewise.
+	* config/i386/predicates.md (GOT_memory_operand): Don't check
+	ix86_indirect_branch_register here.
+	(GOT32_symbol_operand): Likewise.
+
+i386: Rewrite indirect_branch_operand logic
+
+	Backport from mainline
+	2018-01-15  H.J. Lu  <hongjiu.lu@intel.com>
+
+	* config/i386/predicates.md (indirect_branch_operand): Rewrite
+	ix86_indirect_branch_register logic.
+
+Upstream-Status: Pending
+
+Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
+
+---
+ gcc/config/i386/constraints.md                     |  6 ++--
+ gcc/config/i386/i386.md                            | 34 ++++++++++++++--------
+ gcc/config/i386/i386.opt                           |  4 +++
+ gcc/config/i386/predicates.md                      | 21 +++++++------
+ gcc/doc/invoke.texi                                |  6 +++-
+ gcc/testsuite/gcc.target/i386/indirect-thunk-1.c   |  2 +-
+ gcc/testsuite/gcc.target/i386/indirect-thunk-2.c   |  2 +-
+ gcc/testsuite/gcc.target/i386/indirect-thunk-3.c   |  2 +-
+ gcc/testsuite/gcc.target/i386/indirect-thunk-4.c   |  2 +-
+ gcc/testsuite/gcc.target/i386/indirect-thunk-5.c   |  2 +-
+ gcc/testsuite/gcc.target/i386/indirect-thunk-6.c   |  2 +-
+ gcc/testsuite/gcc.target/i386/indirect-thunk-7.c   |  2 +-
+ .../gcc.target/i386/indirect-thunk-attr-1.c        |  2 +-
+ .../gcc.target/i386/indirect-thunk-attr-2.c        |  2 +-
+ .../gcc.target/i386/indirect-thunk-attr-3.c        |  2 +-
+ .../gcc.target/i386/indirect-thunk-attr-4.c        |  2 +-
+ .../gcc.target/i386/indirect-thunk-attr-5.c        |  2 +-
+ .../gcc.target/i386/indirect-thunk-attr-6.c        |  2 +-
+ .../gcc.target/i386/indirect-thunk-attr-7.c        |  2 +-
+ .../gcc.target/i386/indirect-thunk-bnd-1.c         |  2 +-
+ .../gcc.target/i386/indirect-thunk-bnd-2.c         |  2 +-
+ .../gcc.target/i386/indirect-thunk-bnd-3.c         |  2 +-
+ .../gcc.target/i386/indirect-thunk-bnd-4.c         |  2 +-
+ .../gcc.target/i386/indirect-thunk-extern-1.c      |  2 +-
+ .../gcc.target/i386/indirect-thunk-extern-2.c      |  2 +-
+ .../gcc.target/i386/indirect-thunk-extern-3.c      |  2 +-
+ .../gcc.target/i386/indirect-thunk-extern-4.c      |  2 +-
+ .../gcc.target/i386/indirect-thunk-extern-5.c      |  2 +-
+ .../gcc.target/i386/indirect-thunk-extern-6.c      |  2 +-
+ .../gcc.target/i386/indirect-thunk-extern-7.c      |  2 +-
+ .../gcc.target/i386/indirect-thunk-inline-1.c      |  2 +-
+ .../gcc.target/i386/indirect-thunk-inline-2.c      |  2 +-
+ .../gcc.target/i386/indirect-thunk-inline-3.c      |  2 +-
+ .../gcc.target/i386/indirect-thunk-inline-4.c      |  2 +-
+ .../gcc.target/i386/indirect-thunk-inline-5.c      |  2 +-
+ .../gcc.target/i386/indirect-thunk-inline-6.c      |  2 +-
+ .../gcc.target/i386/indirect-thunk-inline-7.c      |  2 +-
+ .../gcc.target/i386/indirect-thunk-register-1.c    | 22 ++++++++++++++
+ .../gcc.target/i386/indirect-thunk-register-2.c    | 20 +++++++++++++
+ .../gcc.target/i386/indirect-thunk-register-3.c    | 19 ++++++++++++
+ gcc/testsuite/gcc.target/i386/ret-thunk-10.c       |  2 +-
+ gcc/testsuite/gcc.target/i386/ret-thunk-11.c       |  2 +-
+ gcc/testsuite/gcc.target/i386/ret-thunk-12.c       |  2 +-
+ gcc/testsuite/gcc.target/i386/ret-thunk-13.c       |  2 +-
+ gcc/testsuite/gcc.target/i386/ret-thunk-14.c       |  2 +-
+ gcc/testsuite/gcc.target/i386/ret-thunk-15.c       |  2 +-
+ gcc/testsuite/gcc.target/i386/ret-thunk-9.c        |  2 +-
+ 47 files changed, 147 insertions(+), 63 deletions(-)
+ create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-register-1.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-register-2.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-register-3.c
+
+diff --git a/gcc/config/i386/constraints.md b/gcc/config/i386/constraints.md
+index 1a4c701..9204c8e 100644
+--- a/gcc/config/i386/constraints.md
++++ b/gcc/config/i386/constraints.md
+@@ -172,14 +172,16 @@
+ 
+ (define_constraint "Bs"
+   "@internal Sibcall memory operand."
+-  (ior (and (not (match_test "TARGET_X32"))
++  (ior (and (not (match_test "ix86_indirect_branch_register"))
++	    (not (match_test "TARGET_X32"))
+ 	    (match_operand 0 "sibcall_memory_operand"))
+        (and (match_test "TARGET_X32 && Pmode == DImode")
+ 	    (match_operand 0 "GOT_memory_operand"))))
+ 
+ (define_constraint "Bw"
+   "@internal Call memory operand."
+-  (ior (and (not (match_test "TARGET_X32"))
++  (ior (and (not (match_test "ix86_indirect_branch_register"))
++	    (not (match_test "TARGET_X32"))
+ 	    (match_operand 0 "memory_operand"))
+        (and (match_test "TARGET_X32 && Pmode == DImode")
+ 	    (match_operand 0 "GOT_memory_operand"))))
+diff --git a/gcc/config/i386/i386.md b/gcc/config/i386/i386.md
+index 2da671e..05a88ff 100644
+--- a/gcc/config/i386/i386.md
++++ b/gcc/config/i386/i386.md
+@@ -11805,7 +11805,7 @@
+   [(set (pc) (match_operand 0 "indirect_branch_operand"))]
+   ""
+ {
+-  if (TARGET_X32)
++  if (TARGET_X32 || ix86_indirect_branch_register)
+     operands[0] = convert_memory_address (word_mode, operands[0]);
+   cfun->machine->has_local_indirect_jump = true;
+ })
+@@ -11859,7 +11859,7 @@
+ 					 OPTAB_DIRECT);
+     }
+ 
+-  if (TARGET_X32)
++  if (TARGET_X32 || ix86_indirect_branch_register)
+     operands[0] = convert_memory_address (word_mode, operands[0]);
+   cfun->machine->has_local_indirect_jump = true;
+ })
+@@ -12048,7 +12048,7 @@
+   [(call (mem:QI (match_operand:W 0 "memory_operand" "m"))
+ 	 (match_operand 1))
+    (unspec [(const_int 0)] UNSPEC_PEEPSIB)]
+-  "!TARGET_X32"
++  "!TARGET_X32 && !ix86_indirect_branch_register"
+   "* return ix86_output_call_insn (insn, operands[0]);"
+   [(set_attr "type" "call")])
+ 
+@@ -12057,7 +12057,9 @@
+ 	(match_operand:W 1 "memory_operand"))
+    (call (mem:QI (match_dup 0))
+ 	 (match_operand 3))]
+-  "!TARGET_X32 && SIBLING_CALL_P (peep2_next_insn (1))
++  "!TARGET_X32
++   && !ix86_indirect_branch_register
++   && SIBLING_CALL_P (peep2_next_insn (1))
+    && !reg_mentioned_p (operands[0],
+ 			CALL_INSN_FUNCTION_USAGE (peep2_next_insn (1)))"
+   [(parallel [(call (mem:QI (match_dup 1))
+@@ -12070,7 +12072,9 @@
+    (unspec_volatile [(const_int 0)] UNSPECV_BLOCKAGE)
+    (call (mem:QI (match_dup 0))
+ 	 (match_operand 3))]
+-  "!TARGET_X32 && SIBLING_CALL_P (peep2_next_insn (2))
++  "!TARGET_X32
++   && !ix86_indirect_branch_register
++   && SIBLING_CALL_P (peep2_next_insn (2))
+    && !reg_mentioned_p (operands[0],
+ 			CALL_INSN_FUNCTION_USAGE (peep2_next_insn (2)))"
+   [(unspec_volatile [(const_int 0)] UNSPECV_BLOCKAGE)
+@@ -12092,7 +12096,7 @@
+ })
+ 
+ (define_insn "*call_pop"
+-  [(call (mem:QI (match_operand:SI 0 "call_insn_operand" "lmBz"))
++  [(call (mem:QI (match_operand:SI 0 "call_insn_operand" "lBwBz"))
+ 	 (match_operand 1))
+    (set (reg:SI SP_REG)
+ 	(plus:SI (reg:SI SP_REG)
+@@ -12112,7 +12116,7 @@
+   [(set_attr "type" "call")])
+ 
+ (define_insn "*sibcall_pop_memory"
+-  [(call (mem:QI (match_operand:SI 0 "memory_operand" "m"))
++  [(call (mem:QI (match_operand:SI 0 "memory_operand" "Bs"))
+ 	 (match_operand 1))
+    (set (reg:SI SP_REG)
+ 	(plus:SI (reg:SI SP_REG)
+@@ -12166,7 +12170,9 @@
+   [(set (match_operand:W 0 "register_operand")
+         (match_operand:W 1 "memory_operand"))
+    (set (pc) (match_dup 0))]
+-  "!TARGET_X32 && peep2_reg_dead_p (2, operands[0])"
++  "!TARGET_X32
++   && !ix86_indirect_branch_register
++   && peep2_reg_dead_p (2, operands[0])"
+   [(set (pc) (match_dup 1))])
+ 
+ ;; Call subroutine, returning value in operand 0
+@@ -12244,7 +12250,7 @@
+  	(call (mem:QI (match_operand:W 1 "memory_operand" "m"))
+ 	      (match_operand 2)))
+    (unspec [(const_int 0)] UNSPEC_PEEPSIB)]
+-  "!TARGET_X32"
++  "!TARGET_X32 && !ix86_indirect_branch_register"
+   "* return ix86_output_call_insn (insn, operands[1]);"
+   [(set_attr "type" "callv")])
+ 
+@@ -12254,7 +12260,9 @@
+    (set (match_operand 2)
+    (call (mem:QI (match_dup 0))
+ 		 (match_operand 3)))]
+-  "!TARGET_X32 && SIBLING_CALL_P (peep2_next_insn (1))
++  "!TARGET_X32
++   && !ix86_indirect_branch_register
++   && SIBLING_CALL_P (peep2_next_insn (1))
+    && !reg_mentioned_p (operands[0],
+ 			CALL_INSN_FUNCTION_USAGE (peep2_next_insn (1)))"
+   [(parallel [(set (match_dup 2)
+@@ -12269,7 +12277,9 @@
+    (set (match_operand 2)
+ 	(call (mem:QI (match_dup 0))
+ 	      (match_operand 3)))]
+-  "!TARGET_X32 && SIBLING_CALL_P (peep2_next_insn (2))
++  "!TARGET_X32
++   && !ix86_indirect_branch_register
++   && SIBLING_CALL_P (peep2_next_insn (2))
+    && !reg_mentioned_p (operands[0],
+ 			CALL_INSN_FUNCTION_USAGE (peep2_next_insn (2)))"
+   [(unspec_volatile [(const_int 0)] UNSPECV_BLOCKAGE)
+@@ -12294,7 +12304,7 @@
+ 
+ (define_insn "*call_value_pop"
+   [(set (match_operand 0)
+-	(call (mem:QI (match_operand:SI 1 "call_insn_operand" "lmBz"))
++	(call (mem:QI (match_operand:SI 1 "call_insn_operand" "lBwBz"))
+ 	      (match_operand 2)))
+    (set (reg:SI SP_REG)
+ 	(plus:SI (reg:SI SP_REG)
+diff --git a/gcc/config/i386/i386.opt b/gcc/config/i386/i386.opt
+index ad5916f..a97f84f 100644
+--- a/gcc/config/i386/i386.opt
++++ b/gcc/config/i386/i386.opt
+@@ -921,3 +921,7 @@ Enum(indirect_branch) String(thunk-inline) Value(indirect_branch_thunk_inline)
+ 
+ EnumValue
+ Enum(indirect_branch) String(thunk-extern) Value(indirect_branch_thunk_extern)
++
++mindirect-branch-register
++Target Report Var(ix86_indirect_branch_register) Init(0)
++Force indirect call and jump via register.
+diff --git a/gcc/config/i386/predicates.md b/gcc/config/i386/predicates.md
+index 93dda7b..d1f0a7d 100644
+--- a/gcc/config/i386/predicates.md
++++ b/gcc/config/i386/predicates.md
+@@ -593,7 +593,8 @@
+ ;; Test for a valid operand for indirect branch.
+ (define_predicate "indirect_branch_operand"
+   (ior (match_operand 0 "register_operand")
+-       (and (not (match_test "TARGET_X32"))
++       (and (not (match_test "ix86_indirect_branch_register"))
++	    (not (match_test "TARGET_X32"))
+ 	    (match_operand 0 "memory_operand"))))
+ 
+ ;; Return true if OP is a memory operands that can be used in sibcalls.
+@@ -636,20 +637,22 @@
+   (ior (match_test "constant_call_address_operand
+ 		     (op, mode == VOIDmode ? mode : Pmode)")
+        (match_operand 0 "call_register_no_elim_operand")
+-       (ior (and (not (match_test "TARGET_X32"))
+-		 (match_operand 0 "memory_operand"))
+-	    (and (match_test "TARGET_X32 && Pmode == DImode")
+-		 (match_operand 0 "GOT_memory_operand")))))
++       (and (not (match_test "ix86_indirect_branch_register"))
++	    (ior (and (not (match_test "TARGET_X32"))
++		      (match_operand 0 "memory_operand"))
++		 (and (match_test "TARGET_X32 && Pmode == DImode")
++		      (match_operand 0 "GOT_memory_operand"))))))
+ 
+ ;; Similarly, but for tail calls, in which we cannot allow memory references.
+ (define_special_predicate "sibcall_insn_operand"
+   (ior (match_test "constant_call_address_operand
+ 		     (op, mode == VOIDmode ? mode : Pmode)")
+        (match_operand 0 "register_no_elim_operand")
+-       (ior (and (not (match_test "TARGET_X32"))
+-		 (match_operand 0 "sibcall_memory_operand"))
+-	    (and (match_test "TARGET_X32 && Pmode == DImode")
+-		 (match_operand 0 "GOT_memory_operand")))))
++       (and (not (match_test "ix86_indirect_branch_register"))
++	    (ior (and (not (match_test "TARGET_X32"))
++		      (match_operand 0 "sibcall_memory_operand"))
++		 (and (match_test "TARGET_X32 && Pmode == DImode")
++		      (match_operand 0 "GOT_memory_operand"))))))
+ 
+ ;; Return true if OP is a 32-bit GOT symbol operand.
+ (define_predicate "GOT32_symbol_operand"
+diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
+index fa63dc5..ad9f295 100644
+--- a/gcc/doc/invoke.texi
++++ b/gcc/doc/invoke.texi
+@@ -1170,7 +1170,7 @@ See RS/6000 and PowerPC Options.
+ -mavx256-split-unaligned-load -mavx256-split-unaligned-store @gol
+ -malign-data=@var{type} -mstack-protector-guard=@var{guard} @gol
+ -mmitigate-rop -mindirect-branch=@var{choice} @gol
+--mfunction-return=@var{choice}}
++-mfunction-return=@var{choice} -mindirect-branch-register}
+ 
+ @emph{x86 Windows Options}
+ @gccoptlist{-mconsole -mcygwin -mno-cygwin -mdll @gol
+@@ -24241,6 +24241,10 @@ object file.  You can control this behavior for a specific function by
+ using the function attribute @code{function_return}.
+ @xref{Function Attributes}.
+ 
++@item -mindirect-branch-register
++@opindex -mindirect-branch-register
++Force indirect call and jump via register.
++
+ @end table
+ 
+ These @samp{-m} switches are supported in addition to the above
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-1.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-1.c
+index e365ef5..60d0988 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-1.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-1.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk -fno-pic" } */
++/* { dg-options "-O2 -mno-indirect-branch-register -mfunction-return=keep -mindirect-branch=thunk -fno-pic" } */
+ 
+ typedef void (*dispatch_t)(long offset);
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-2.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-2.c
+index 05a51ad..aac7516 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-2.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-2.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk -fno-pic" } */
++/* { dg-options "-O2 -mno-indirect-branch-register -mfunction-return=keep -mindirect-branch=thunk -fno-pic" } */
+ 
+ typedef void (*dispatch_t)(long offset);
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-3.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-3.c
+index 3c0d4c3..9e24a38 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-3.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-3.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk -fno-pic" } */
++/* { dg-options "-O2 -mno-indirect-branch-register -mno-indirect-branch-register -mno-indirect-branch-register -mfunction-return=keep -mindirect-branch=thunk -fno-pic" } */
+ 
+ typedef void (*dispatch_t)(long offset);
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-4.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-4.c
+index 14d4ef6..127b5d9 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-4.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-4.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk -fno-pic" } */
++/* { dg-options "-O2 -mno-indirect-branch-register -mno-indirect-branch-register -mno-indirect-branch-register -mfunction-return=keep -mindirect-branch=thunk -fno-pic" } */
+ 
+ typedef void (*dispatch_t)(long offset);
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-5.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-5.c
+index b4836c3..fcaa18d 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-5.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-5.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile { target *-*-linux* } } */
+-/* { dg-options "-O2 -mfunction-return=keep -fpic -fno-plt -mindirect-branch=thunk" } */
++/* { dg-options "-O2 -mno-indirect-branch-register -mfunction-return=keep -fpic -fno-plt -mindirect-branch=thunk" } */
+ 
+ extern void bar (void);
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-6.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-6.c
+index 1f06bd1..e464928 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-6.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-6.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile { target *-*-linux* } } */
+-/* { dg-options "-O2 -mfunction-return=keep -fpic -fno-plt -mindirect-branch=thunk" } */
++/* { dg-options "-O2 -mno-indirect-branch-register -mno-indirect-branch-register -mno-indirect-branch-register -mfunction-return=keep -fpic -fno-plt -mindirect-branch=thunk" } */
+ 
+ extern void bar (void);
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-7.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-7.c
+index bc6b47a..17c2d0f 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-7.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-7.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk -fno-pic" } */
++/* { dg-options "-O2 -mno-indirect-branch-register -mfunction-return=keep -mindirect-branch=thunk -fno-pic" } */
+ 
+ void func0 (void);
+ void func1 (void);
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-1.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-1.c
+index 2257be3..9194ccf 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-1.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-1.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mfunction-return=keep -fno-pic" } */
++/* { dg-options "-O2 -mno-indirect-branch-register -mfunction-return=keep -fno-pic" } */
+ 
+ typedef void (*dispatch_t)(long offset);
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-2.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-2.c
+index e9cfdc5..e51f261 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-2.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-2.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mfunction-return=keep -fno-pic" } */
++/* { dg-options "-O2 -mno-indirect-branch-register -mfunction-return=keep -fno-pic" } */
+ 
+ typedef void (*dispatch_t)(long offset);
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-3.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-3.c
+index f938db0..4aeec18 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-3.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-3.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mfunction-return=keep -fno-pic" } */
++/* { dg-options "-O2 -mno-indirect-branch-register -mfunction-return=keep -fno-pic" } */
+ 
+ typedef void (*dispatch_t)(long offset);
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-4.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-4.c
+index 4e58599..ac0e599 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-4.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-4.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mfunction-return=keep -fno-pic" } */
++/* { dg-options "-O2 -mno-indirect-branch-register -mfunction-return=keep -fno-pic" } */
+ 
+ typedef void (*dispatch_t)(long offset);
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-5.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-5.c
+index b8d5024..573cf1e 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-5.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-5.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mfunction-return=keep -fno-pic" } */
++/* { dg-options "-O2 -mno-indirect-branch-register -mfunction-return=keep -fno-pic" } */
+ 
+ typedef void (*dispatch_t)(long offset);
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-6.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-6.c
+index 455adab..b2b37fc 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-6.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-6.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mfunction-return=keep -fno-pic" } */
++/* { dg-options "-O2 -mno-indirect-branch-register -mfunction-return=keep -fno-pic" } */
+ 
+ typedef void (*dispatch_t)(long offset);
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-7.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-7.c
+index 4595b84..4a43e19 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-7.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-7.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mfunction-return=keep -fno-pic" } */
++/* { dg-options "-O2 -mno-indirect-branch-register -mfunction-return=keep -fno-pic" } */
+ 
+ void func0 (void);
+ void func1 (void);
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-1.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-1.c
+index 5e3e118..ac84ab6 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-1.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-1.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile { target { ! x32 } } } */
+-/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk -fcheck-pointer-bounds -mmpx -fno-pic" } */
++/* { dg-options "-O2 -mno-indirect-branch-register -mfunction-return=keep -mindirect-branch=thunk -fcheck-pointer-bounds -mmpx -fno-pic" } */
+ 
+ void (*dispatch) (char *);
+ char buf[10];
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-2.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-2.c
+index 2801aa4..ce655e8 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-2.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-2.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile { target { ! x32 } } } */
+-/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk -fcheck-pointer-bounds -mmpx -fno-pic" } */
++/* { dg-options "-O2 -mno-indirect-branch-register -mfunction-return=keep -mindirect-branch=thunk -fcheck-pointer-bounds -mmpx -fno-pic" } */
+ 
+ void (*dispatch) (char *);
+ char buf[10];
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-3.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-3.c
+index 70b4fb3..d34485a 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-3.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-3.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile { target { *-*-linux* && { ! x32 } } } } */
+-/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk -fcheck-pointer-bounds -mmpx -fpic -fno-plt" } */
++/* { dg-options "-O2 -mno-indirect-branch-register -mfunction-return=keep -mindirect-branch=thunk -fcheck-pointer-bounds -mmpx -fpic -fno-plt" } */
+ 
+ void bar (char *);
+ char buf[10];
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-4.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-4.c
+index 3baf03e..0e19830 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-4.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-4.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile { target { *-*-linux* && { ! x32 } } } } */
+-/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk -fcheck-pointer-bounds -mmpx -fpic -fno-plt" } */
++/* { dg-options "-O2 -mno-indirect-branch-register -mno-indirect-branch-register -mfunction-return=keep -mindirect-branch=thunk -fcheck-pointer-bounds -mmpx -fpic -fno-plt" } */
+ 
+ void bar (char *);
+ char buf[10];
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-1.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-1.c
+index edeb264..579441f 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-1.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-1.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk-extern -fno-pic" } */
++/* { dg-options "-O2 -mno-indirect-branch-register -mfunction-return=keep -mindirect-branch=thunk-extern -fno-pic" } */
+ 
+ typedef void (*dispatch_t)(long offset);
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-2.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-2.c
+index 1d00413..c92e6f2 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-2.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-2.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk-extern -fno-pic" } */
++/* { dg-options "-O2 -mno-indirect-branch-register -mfunction-return=keep -mindirect-branch=thunk-extern -fno-pic" } */
+ 
+ typedef void (*dispatch_t)(long offset);
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-3.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-3.c
+index 06ebf1c..d9964c2 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-3.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-3.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk-extern -fno-pic" } */
++/* { dg-options "-O2 -mno-indirect-branch-register -mfunction-return=keep -mindirect-branch=thunk-extern -fno-pic" } */
+ 
+ typedef void (*dispatch_t)(long offset);
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-4.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-4.c
+index 1c8f944..d4dca4d 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-4.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-4.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk-extern -fno-pic" } */
++/* { dg-options "-O2 -mno-indirect-branch-register -mfunction-return=keep -mindirect-branch=thunk-extern -fno-pic" } */
+ 
+ typedef void (*dispatch_t)(long offset);
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-5.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-5.c
+index 21740ac..5c07e02 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-5.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-5.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile { target *-*-linux* } } */
+-/* { dg-options "-O2 -mfunction-return=keep -fpic -fno-plt -mindirect-branch=thunk-extern" } */
++/* { dg-options "-O2 -mno-indirect-branch-register -mfunction-return=keep -fpic -fno-plt -mindirect-branch=thunk-extern" } */
+ 
+ extern void bar (void);
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-6.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-6.c
+index a77c1f4..3eb4406 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-6.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-6.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile { target *-*-linux* } } */
+-/* { dg-options "-O2 -mfunction-return=keep -fpic -fno-plt -mindirect-branch=thunk-extern" } */
++/* { dg-options "-O2 -mno-indirect-branch-register -mfunction-return=keep -fpic -fno-plt -mindirect-branch=thunk-extern" } */
+ 
+ extern void bar (void);
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-7.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-7.c
+index 86e9fd1..aece938 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-7.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-7.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk-extern -fno-pic" } */
++/* { dg-options "-O2 -mno-indirect-branch-register -mfunction-return=keep -mindirect-branch=thunk-extern -fno-pic" } */
+ 
+ void func0 (void);
+ void func1 (void);
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-1.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-1.c
+index 3ecde87..3aba5e8 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-1.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-1.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk-inline -fno-pic" } */
++/* { dg-options "-O2 -mno-indirect-branch-register -mfunction-return=keep -mindirect-branch=thunk-inline -fno-pic" } */
+ 
+ typedef void (*dispatch_t)(long offset);
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-2.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-2.c
+index df32a19..0f0181d 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-2.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-2.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk-inline -fno-pic" } */
++/* { dg-options "-O2 -mno-indirect-branch-register -mfunction-return=keep -mindirect-branch=thunk-inline -fno-pic" } */
+ 
+ typedef void (*dispatch_t)(long offset);
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-3.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-3.c
+index 9540996..2eef6f3 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-3.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-3.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk-inline -fno-pic" } */
++/* { dg-options "-O2 -mno-indirect-branch-register -mfunction-return=keep -mindirect-branch=thunk-inline -fno-pic" } */
+ 
+ typedef void (*dispatch_t)(long offset);
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-4.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-4.c
+index f3db6e2..e825a10 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-4.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-4.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk-inline -fno-pic" } */
++/* { dg-options "-O2 -mno-indirect-branch-register -mfunction-return=keep -mindirect-branch=thunk-inline -fno-pic" } */
+ 
+ typedef void (*dispatch_t)(long offset);
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-5.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-5.c
+index 0f687c3..c6d77e1 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-5.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-5.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile { target *-*-linux* } } */
+-/* { dg-options "-O2 -mfunction-return=keep -fpic -fno-plt -mindirect-branch=thunk-inline" } */
++/* { dg-options "-O2 -mno-indirect-branch-register -mfunction-return=keep -fpic -fno-plt -mindirect-branch=thunk-inline" } */
+ 
+ extern void bar (void);
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-6.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-6.c
+index b27c6fc..6454827 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-6.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-6.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile { target *-*-linux* } } */
+-/* { dg-options "-O2 -mfunction-return=keep -fpic -fno-plt -mindirect-branch=thunk-inline" } */
++/* { dg-options "-O2 -mno-indirect-branch-register -mfunction-return=keep -fpic -fno-plt -mindirect-branch=thunk-inline" } */
+ 
+ extern void bar (void);
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-7.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-7.c
+index 764a375..c67066c 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-7.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-7.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk-inline -fno-pic" } */
++/* { dg-options "-O2 -mno-indirect-branch-register -mfunction-return=keep -mindirect-branch=thunk-inline -fno-pic" } */
+ 
+ void func0 (void);
+ void func1 (void);
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-register-1.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-register-1.c
+new file mode 100644
+index 0000000..7d396a3
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-register-1.c
+@@ -0,0 +1,22 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -mindirect-branch=thunk -mindirect-branch-register -fno-pic" } */
++
++typedef void (*dispatch_t)(long offset);
++
++dispatch_t dispatch;
++
++void
++male_indirect_jump (long offset)
++{
++  dispatch(offset);
++}
++
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)ax" } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler "mov\[ \t\](%eax|%rax), \\((%esp|%rsp)\\)" } } */
++/* { dg-final { scan-assembler {\tpause} } } */
++/* { dg-final { scan-assembler-not "push(?:l|q)\[ \t\]*_?dispatch"  } } */
++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" } } */
++/* { dg-final { scan-assembler-not "__x86_indirect_thunk\n" } } */
++/* { dg-final { scan-assembler-not "__x86_indirect_thunk_bnd\n" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-register-2.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-register-2.c
+new file mode 100644
+index 0000000..e7e616b
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-register-2.c
+@@ -0,0 +1,20 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -mindirect-branch=thunk-inline -mindirect-branch-register -fno-pic" } */
++
++typedef void (*dispatch_t)(long offset);
++
++dispatch_t dispatch;
++
++void
++male_indirect_jump (long offset)
++{
++  dispatch(offset);
++}
++
++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler "mov\[ \t\](%eax|%rax), \\((%esp|%rsp)\\)" } } */
++/* { dg-final { scan-assembler {\tpause} } } */
++/* { dg-final { scan-assembler-not "push(?:l|q)\[ \t\]*_?dispatch"  } } */
++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" } } */
++/* { dg-final { scan-assembler-not "__x86_indirect_thunk" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-register-3.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-register-3.c
+new file mode 100644
+index 0000000..5320e92
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-register-3.c
+@@ -0,0 +1,19 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -mindirect-branch=thunk-extern -mindirect-branch-register -fno-pic" } */
++
++typedef void (*dispatch_t)(long offset);
++
++dispatch_t dispatch;
++
++void
++male_indirect_jump (long offset)
++{
++  dispatch(offset);
++}
++
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)ax" } } */
++/* { dg-final { scan-assembler-not "push(?:l|q)\[ \t\]*_?dispatch"  } } */
++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" } } */
++/* { dg-final { scan-assembler-not {\t(pause|pause|nop)} } } */
++/* { dg-final { scan-assembler-not "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler-not "call\[ \t\]*\.LIND" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-10.c b/gcc/testsuite/gcc.target/i386/ret-thunk-10.c
+index 3a6727b..e6fea84 100644
+--- a/gcc/testsuite/gcc.target/i386/ret-thunk-10.c
++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-10.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mfunction-return=thunk-inline -mindirect-branch=thunk -fno-pic" } */
++/* { dg-options "-O2 -mno-indirect-branch-register -mno-indirect-branch-register -mfunction-return=thunk-inline -mindirect-branch=thunk -fno-pic" } */
+ 
+ extern void (*bar) (void);
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-11.c b/gcc/testsuite/gcc.target/i386/ret-thunk-11.c
+index b8f6818..e239ec4 100644
+--- a/gcc/testsuite/gcc.target/i386/ret-thunk-11.c
++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-11.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mfunction-return=thunk-extern -mindirect-branch=thunk -fno-pic" } */
++/* { dg-options "-O2 -mno-indirect-branch-register -mno-indirect-branch-register -mno-indirect-branch-register -mno-indirect-branch-register -mfunction-return=thunk-extern -mindirect-branch=thunk -fno-pic" } */
+ 
+ extern void (*bar) (void);
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-12.c b/gcc/testsuite/gcc.target/i386/ret-thunk-12.c
+index 01b0a02..fa31813 100644
+--- a/gcc/testsuite/gcc.target/i386/ret-thunk-12.c
++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-12.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk -fno-pic" } */
++/* { dg-options "-O2 -mno-indirect-branch-register -mno-indirect-branch-register -mno-indirect-branch-register -mno-indirect-branch-register -mfunction-return=keep -mindirect-branch=thunk -fno-pic" } */
+ 
+ extern void (*bar) (void);
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-13.c b/gcc/testsuite/gcc.target/i386/ret-thunk-13.c
+index 4b497b5..fd5b41f 100644
+--- a/gcc/testsuite/gcc.target/i386/ret-thunk-13.c
++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-13.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk-inline -fno-pic" } */
++/* { dg-options "-O2 -mno-indirect-branch-register -mfunction-return=keep -mindirect-branch=thunk-inline -fno-pic" } */
+ 
+ extern void (*bar) (void);
+ extern int foo (void) __attribute__ ((function_return("thunk")));
+diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-14.c b/gcc/testsuite/gcc.target/i386/ret-thunk-14.c
+index 4ae4c44..d606373 100644
+--- a/gcc/testsuite/gcc.target/i386/ret-thunk-14.c
++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-14.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=thunk-extern -fno-pic" } */
++/* { dg-options "-O2 -mno-indirect-branch-register -mfunction-return=keep -mindirect-branch=thunk-extern -fno-pic" } */
+ 
+ extern void (*bar) (void);
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-15.c b/gcc/testsuite/gcc.target/i386/ret-thunk-15.c
+index 5b5bc76..75e45e2 100644
+--- a/gcc/testsuite/gcc.target/i386/ret-thunk-15.c
++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-15.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=keep -fno-pic" } */
++/* { dg-options "-O2 -mno-indirect-branch-register -mno-indirect-branch-register -mno-indirect-branch-register -mno-indirect-branch-register -mfunction-return=keep -mindirect-branch=keep -fno-pic" } */
+ 
+ extern void (*bar) (void);
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-9.c b/gcc/testsuite/gcc.target/i386/ret-thunk-9.c
+index fa24a1f..d1db41c 100644
+--- a/gcc/testsuite/gcc.target/i386/ret-thunk-9.c
++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-9.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mfunction-return=thunk -mindirect-branch=thunk -fno-pic" } */
++/* { dg-options "-O2 -mno-indirect-branch-register -mno-indirect-branch-register -mfunction-return=thunk -mindirect-branch=thunk -fno-pic" } */
+ 
+ extern void (*bar) (void);
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/backport/0007-x86-Add-V-register-operand-modifier.patch b/meta/recipes-devtools/gcc/gcc-6.4/backport/0007-x86-Add-V-register-operand-modifier.patch
new file mode 100644
index 0000000..cec84fe
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.4/backport/0007-x86-Add-V-register-operand-modifier.patch
@@ -0,0 +1,139 @@
+From 8f0efd692eb8db06d6c00b759c872bd2170b7f7b Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Sat, 6 Jan 2018 22:29:56 -0800
+Subject: [PATCH 07/12] x86: Add 'V' register operand modifier
+
+Add 'V', a special modifier which prints the name of the full integer
+register without '%'.  For
+
+extern void (*func_p) (void);
+
+void
+foo (void)
+{
+  asm ("call __x86_indirect_thunk_%V0" : : "a" (func_p));
+}
+
+it generates:
+
+foo:
+	movq	func_p(%rip), %rax
+	call	__x86_indirect_thunk_rax
+	ret
+
+gcc/
+
+	Backport from mainline
+	2018-01-14  H.J. Lu  <hongjiu.lu@intel.com>
+
+	* config/i386/i386.c (print_reg): Print the name of the full
+	integer register without '%'.
+	(ix86_print_operand): Handle 'V'.
+	 * doc/extend.texi: Document 'V' modifier.
+
+gcc/testsuite/
+
+	Backport from mainline
+	2018-01-14  H.J. Lu  <hongjiu.lu@intel.com>
+
+	* gcc.target/i386/indirect-thunk-register-4.c: New test.
+
+Upstream-Status: Pending
+
+Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
+
+---
+ gcc/config/i386/i386.c                                    | 13 ++++++++++++-
+ gcc/doc/extend.texi                                       |  3 +++
+ gcc/testsuite/gcc.target/i386/indirect-thunk-register-4.c | 13 +++++++++++++
+ 3 files changed, 28 insertions(+), 1 deletion(-)
+ create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-register-4.c
+
+diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c
+index 34e26a3..eeca7e5 100644
+--- a/gcc/config/i386/i386.c
++++ b/gcc/config/i386/i386.c
+@@ -16869,6 +16869,7 @@ put_condition_code (enum rtx_code code, machine_mode mode, bool reverse,
+    If CODE is 'h', pretend the reg is the 'high' byte register.
+    If CODE is 'y', print "st(0)" instead of "st", if the reg is stack op.
+    If CODE is 'd', duplicate the operand for AVX instruction.
++   If CODE is 'V', print naked full integer register name without %.
+  */
+ 
+ void
+@@ -16879,7 +16880,7 @@ print_reg (rtx x, int code, FILE *file)
+   unsigned int regno;
+   bool duplicated;
+ 
+-  if (ASSEMBLER_DIALECT == ASM_ATT)
++  if (ASSEMBLER_DIALECT == ASM_ATT && code != 'V')
+     putc ('%', file);
+ 
+   if (x == pc_rtx)
+@@ -16922,6 +16923,14 @@ print_reg (rtx x, int code, FILE *file)
+ 	      && regno != FPSR_REG
+ 	      && regno != FPCR_REG);
+ 
++  if (code == 'V')
++    {
++      if (GENERAL_REGNO_P (regno))
++	msize = GET_MODE_SIZE (word_mode);
++      else
++	error ("'V' modifier on non-integer register");
++    }
++
+   duplicated = code == 'd' && TARGET_AVX;
+ 
+   switch (msize)
+@@ -17035,6 +17044,7 @@ print_reg (rtx x, int code, FILE *file)
+    & -- print some in-use local-dynamic symbol name.
+    H -- print a memory address offset by 8; used for sse high-parts
+    Y -- print condition for XOP pcom* instruction.
++   V -- print naked full integer register name without %.
+    + -- print a branch hint as 'cs' or 'ds' prefix
+    ; -- print a semicolon (after prefixes due to bug in older gas).
+    ~ -- print "i" if TARGET_AVX2, "f" otherwise.
+@@ -17259,6 +17269,7 @@ ix86_print_operand (FILE *file, rtx x, int code)
+ 	case 'X':
+ 	case 'P':
+ 	case 'p':
++	case 'V':
+ 	  break;
+ 
+ 	case 's':
+diff --git a/gcc/doc/extend.texi b/gcc/doc/extend.texi
+index 2cb6bd1..76ba1d4 100644
+--- a/gcc/doc/extend.texi
++++ b/gcc/doc/extend.texi
+@@ -8511,6 +8511,9 @@ The table below shows the list of supported modifiers and their effects.
+ @tab @code{2}
+ @end multitable
+ 
++@code{V} is a special modifier which prints the name of the full integer
++register without @code{%}.
++
+ @anchor{x86floatingpointasmoperands}
+ @subsubsection x86 Floating-Point @code{asm} Operands
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-register-4.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-register-4.c
+new file mode 100644
+index 0000000..f0cd9b7
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-register-4.c
+@@ -0,0 +1,13 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -mindirect-branch=keep -fno-pic" } */
++
++extern void (*func_p) (void);
++
++void
++foo (void)
++{
++  asm("call __x86_indirect_thunk_%V0" : : "a" (func_p));
++}
++
++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_eax" { target ia32 } } } */
++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_rax" { target { ! ia32 } } } } */
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/backport/0008-x86-Disallow-mindirect-branch-mfunction-return-with-.patch b/meta/recipes-devtools/gcc/gcc-6.4/backport/0008-x86-Disallow-mindirect-branch-mfunction-return-with-.patch
new file mode 100644
index 0000000..d8a5810
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.4/backport/0008-x86-Disallow-mindirect-branch-mfunction-return-with-.patch
@@ -0,0 +1,304 @@
+From 8e0d9bf93e2e2ec03c544572aef4b03a8e7090f3 Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Sat, 13 Jan 2018 18:01:54 -0800
+Subject: [PATCH 08/12] x86: Disallow -mindirect-branch=/-mfunction-return=
+ with -mcmodel=large
+
+Since the thunk function may not be reachable in large code model,
+-mcmodel=large is incompatible with -mindirect-branch=thunk,
+-mindirect-branch=thunk-extern, -mfunction-return=thunk and
+-mfunction-return=thunk-extern.  Issue an error when they are used with
+-mcmodel=large.
+
+gcc/
+
+	Backport from mainline
+	2018-01-14  H.J. Lu  <hongjiu.lu@intel.com>
+
+	* config/i386/i386.c (ix86_set_indirect_branch_type): Disallow
+	-mcmodel=large with -mindirect-branch=thunk,
+	-mindirect-branch=thunk-extern, -mfunction-return=thunk and
+	-mfunction-return=thunk-extern.
+	* doc/invoke.texi: Document -mcmodel=large is incompatible with
+	-mindirect-branch=thunk, -mindirect-branch=thunk-extern,
+	-mfunction-return=thunk and -mfunction-return=thunk-extern.
+
+gcc/testsuite/
+
+	Backport from mainline
+	2018-01-14  H.J. Lu  <hongjiu.lu@intel.com>
+
+	* gcc.target/i386/indirect-thunk-10.c: New test.
+	* gcc.target/i386/indirect-thunk-8.c: Likewise.
+	* gcc.target/i386/indirect-thunk-9.c: Likewise.
+	* gcc.target/i386/indirect-thunk-attr-10.c: Likewise.
+	* gcc.target/i386/indirect-thunk-attr-11.c: Likewise.
+	* gcc.target/i386/indirect-thunk-attr-9.c: Likewise.
+	* gcc.target/i386/ret-thunk-17.c: Likewise.
+	* gcc.target/i386/ret-thunk-18.c: Likewise.
+	* gcc.target/i386/ret-thunk-19.c: Likewise.
+	* gcc.target/i386/ret-thunk-20.c: Likewise.
+	* gcc.target/i386/ret-thunk-21.c: Likewise.
+
+Upstream-Status: Pending
+
+Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
+
+---
+ gcc/config/i386/i386.c                             | 26 ++++++++++++++++++++++
+ gcc/doc/invoke.texi                                | 11 +++++++++
+ gcc/testsuite/gcc.target/i386/indirect-thunk-10.c  |  7 ++++++
+ gcc/testsuite/gcc.target/i386/indirect-thunk-8.c   |  7 ++++++
+ gcc/testsuite/gcc.target/i386/indirect-thunk-9.c   |  7 ++++++
+ .../gcc.target/i386/indirect-thunk-attr-10.c       |  9 ++++++++
+ .../gcc.target/i386/indirect-thunk-attr-11.c       |  9 ++++++++
+ .../gcc.target/i386/indirect-thunk-attr-9.c        |  9 ++++++++
+ gcc/testsuite/gcc.target/i386/ret-thunk-17.c       |  7 ++++++
+ gcc/testsuite/gcc.target/i386/ret-thunk-18.c       |  8 +++++++
+ gcc/testsuite/gcc.target/i386/ret-thunk-19.c       |  8 +++++++
+ gcc/testsuite/gcc.target/i386/ret-thunk-20.c       |  9 ++++++++
+ gcc/testsuite/gcc.target/i386/ret-thunk-21.c       |  9 ++++++++
+ 13 files changed, 126 insertions(+)
+ create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-10.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-8.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-9.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-attr-10.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-attr-11.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-attr-9.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-17.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-18.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-19.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-20.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-21.c
+
+diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c
+index eeca7e5..9c038be 100644
+--- a/gcc/config/i386/i386.c
++++ b/gcc/config/i386/i386.c
+@@ -6389,6 +6389,19 @@ ix86_set_indirect_branch_type (tree fndecl)
+ 	}
+       else
+ 	cfun->machine->indirect_branch_type = ix86_indirect_branch;
++
++      /* -mcmodel=large is not compatible with -mindirect-branch=thunk
++	 nor -mindirect-branch=thunk-extern.  */
++      if ((ix86_cmodel == CM_LARGE || ix86_cmodel == CM_LARGE_PIC)
++	  && ((cfun->machine->indirect_branch_type
++	       == indirect_branch_thunk_extern)
++	      || (cfun->machine->indirect_branch_type
++		  == indirect_branch_thunk)))
++	error ("%<-mindirect-branch=%s%> and %<-mcmodel=large%> are not "
++	       "compatible",
++	       ((cfun->machine->indirect_branch_type
++		 == indirect_branch_thunk_extern)
++		? "thunk-extern" : "thunk"));
+     }
+ 
+   if (cfun->machine->function_return_type == indirect_branch_unset)
+@@ -6414,6 +6427,19 @@ ix86_set_indirect_branch_type (tree fndecl)
+ 	}
+       else
+ 	cfun->machine->function_return_type = ix86_function_return;
++
++      /* -mcmodel=large is not compatible with -mfunction-return=thunk
++	 nor -mfunction-return=thunk-extern.  */
++      if ((ix86_cmodel == CM_LARGE || ix86_cmodel == CM_LARGE_PIC)
++	  && ((cfun->machine->function_return_type
++	       == indirect_branch_thunk_extern)
++	      || (cfun->machine->function_return_type
++		  == indirect_branch_thunk)))
++	error ("%<-mfunction-return=%s%> and %<-mcmodel=large%> are not "
++	       "compatible",
++	       ((cfun->machine->function_return_type
++		 == indirect_branch_thunk_extern)
++		? "thunk-extern" : "thunk"));
+     }
+ }
+ 
+diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
+index ad9f295..48e827f 100644
+--- a/gcc/doc/invoke.texi
++++ b/gcc/doc/invoke.texi
+@@ -24230,6 +24230,11 @@ to external call and return thunk provided in a separate object file.
+ You can control this behavior for a specific function by using the
+ function attribute @code{indirect_branch}.  @xref{Function Attributes}.
+ 
++Note that @option{-mcmodel=large} is incompatible with
++@option{-mindirect-branch=thunk} nor
++@option{-mindirect-branch=thunk-extern} since the thunk function may
++not be reachable in large code model.
++
+ @item -mfunction-return=@var{choice}
+ @opindex -mfunction-return
+ Convert function return with @var{choice}.  The default is @samp{keep},
+@@ -24241,6 +24246,12 @@ object file.  You can control this behavior for a specific function by
+ using the function attribute @code{function_return}.
+ @xref{Function Attributes}.
+ 
++Note that @option{-mcmodel=large} is incompatible with
++@option{-mfunction-return=thunk} nor
++@option{-mfunction-return=thunk-extern} since the thunk function may
++not be reachable in large code model.
++
++
+ @item -mindirect-branch-register
+ @opindex -mindirect-branch-register
+ Force indirect call and jump via register.
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-10.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-10.c
+new file mode 100644
+index 0000000..a0674bd
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-10.c
+@@ -0,0 +1,7 @@
++/* { dg-do compile { target { lp64 } } } */
++/* { dg-options "-O2 -mindirect-branch=thunk-inline -mfunction-return=keep -mcmodel=large" } */
++
++void
++bar (void)
++{
++}
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-8.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-8.c
+new file mode 100644
+index 0000000..7a80a89
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-8.c
+@@ -0,0 +1,7 @@
++/* { dg-do compile { target { lp64 } } } */
++/* { dg-options "-O2 -mindirect-branch=thunk -mfunction-return=keep -mcmodel=large" } */
++
++void
++bar (void)
++{ /* { dg-error "'-mindirect-branch=thunk' and '-mcmodel=large' are not compatible" } */
++}
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-9.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-9.c
+new file mode 100644
+index 0000000..d4d45c5
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-9.c
+@@ -0,0 +1,7 @@
++/* { dg-do compile { target { lp64 } } } */
++/* { dg-options "-O2 -mindirect-branch=thunk-extern -mfunction-return=keep -mcmodel=large" } */
++
++void
++bar (void)
++{ /* { dg-error "'-mindirect-branch=thunk-extern' and '-mcmodel=large' are not compatible" } */
++}
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-10.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-10.c
+new file mode 100644
+index 0000000..3a2aead
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-10.c
+@@ -0,0 +1,9 @@
++/* { dg-do compile { target { lp64 } } } */
++/* { dg-options "-O2 -mindirect-branch=keep -mfunction-return=keep -mcmodel=large" } */
++/* { dg-additional-options "-fPIC" { target fpic } } */
++
++__attribute__ ((indirect_branch("thunk-extern")))
++void
++bar (void)
++{ /* { dg-error "'-mindirect-branch=thunk-extern' and '-mcmodel=large' are not compatible" } */
++}
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-11.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-11.c
+new file mode 100644
+index 0000000..8e52f03
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-11.c
+@@ -0,0 +1,9 @@
++/* { dg-do compile { target { lp64 } } } */
++/* { dg-options "-O2 -mindirect-branch=keep -mfunction-return=keep -mcmodel=large" } */
++/* { dg-additional-options "-fPIC" { target fpic } } */
++
++__attribute__ ((indirect_branch("thunk-inline")))
++void
++bar (void)
++{
++}
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-9.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-9.c
+new file mode 100644
+index 0000000..bdaa4f6
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-9.c
+@@ -0,0 +1,9 @@
++/* { dg-do compile { target { lp64 } } } */
++/* { dg-options "-O2 -mindirect-branch=keep -mfunction-return=keep -mcmodel=large" } */
++/* { dg-additional-options "-fPIC" { target fpic } } */
++
++__attribute__ ((indirect_branch("thunk")))
++void
++bar (void)
++{ /* { dg-error "'-mindirect-branch=thunk' and '-mcmodel=large' are not compatible" } */
++}
+diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-17.c b/gcc/testsuite/gcc.target/i386/ret-thunk-17.c
+new file mode 100644
+index 0000000..0605e2c
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-17.c
+@@ -0,0 +1,7 @@
++/* { dg-do compile { target { lp64 } } } */
++/* { dg-options "-O2 -mfunction-return=thunk -mindirect-branch=keep -mcmodel=large" } */
++
++void
++bar (void)
++{ /* { dg-error "'-mfunction-return=thunk' and '-mcmodel=large' are not compatible" } */
++}
+diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-18.c b/gcc/testsuite/gcc.target/i386/ret-thunk-18.c
+new file mode 100644
+index 0000000..307019d
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-18.c
+@@ -0,0 +1,8 @@
++/* { dg-do compile { target { lp64 } } } */
++/* { dg-options "-O2 -mfunction-return=thunk-extern -mindirect-branch=keep -mcmodel=large" } */
++/* { dg-additional-options "-fPIC" { target fpic } } */
++
++void
++bar (void)
++{ /* { dg-error "'-mfunction-return=thunk-extern' and '-mcmodel=large' are not compatible" } */
++}
+diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-19.c b/gcc/testsuite/gcc.target/i386/ret-thunk-19.c
+new file mode 100644
+index 0000000..772617f
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-19.c
+@@ -0,0 +1,8 @@
++/* { dg-do compile { target { lp64 } } } */
++/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=keep -mcmodel=large" } */
++
++__attribute__ ((function_return("thunk")))
++void
++bar (void)
++{ /* { dg-error "'-mfunction-return=thunk' and '-mcmodel=large' are not compatible" } */
++}
+diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-20.c b/gcc/testsuite/gcc.target/i386/ret-thunk-20.c
+new file mode 100644
+index 0000000..1e9f9bd
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-20.c
+@@ -0,0 +1,9 @@
++/* { dg-do compile { target { lp64 } } } */
++/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=keep -mcmodel=large" } */
++/* { dg-additional-options "-fPIC" { target fpic } } */
++
++__attribute__ ((function_return("thunk-extern")))
++void
++bar (void)
++{ /* { dg-error "'-mfunction-return=thunk-extern' and '-mcmodel=large' are not compatible" } */
++}
+diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-21.c b/gcc/testsuite/gcc.target/i386/ret-thunk-21.c
+new file mode 100644
+index 0000000..eea07f7
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-21.c
+@@ -0,0 +1,9 @@
++/* { dg-do compile { target { lp64 } } } */
++/* { dg-options "-O2 -mfunction-return=keep -mindirect-branch=keep -mcmodel=large" } */
++/* { dg-additional-options "-fPIC" { target fpic } } */
++
++__attribute__ ((function_return("thunk-inline")))
++void
++bar (void)
++{
++}
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/backport/0009-Use-INVALID_REGNUM-in-indirect-thunk-processing.patch b/meta/recipes-devtools/gcc/gcc-6.4/backport/0009-Use-INVALID_REGNUM-in-indirect-thunk-processing.patch
new file mode 100644
index 0000000..7364a2c
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.4/backport/0009-Use-INVALID_REGNUM-in-indirect-thunk-processing.patch
@@ -0,0 +1,126 @@
+From 3eff2adada2b1667b0e76496fa559e0c248ecd84 Mon Sep 17 00:00:00 2001
+From: uros <uros@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Thu, 25 Jan 2018 19:39:01 +0000
+Subject: [PATCH 09/12] Use INVALID_REGNUM in indirect thunk processing
+
+	Backport from mainline
+	2018-01-17  Uros Bizjak  <ubizjak@gmail.com>
+
+	* config/i386/i386.c (indirect_thunk_name): Declare regno
+	as unsigned int.  Compare regno with INVALID_REGNUM.
+	(output_indirect_thunk): Ditto.
+	(output_indirect_thunk_function): Ditto.
+	(ix86_code_end): Declare regno as unsigned int.  Use INVALID_REGNUM
+	in the call to output_indirect_thunk_function.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-7-branch@257067 138bc75d-0d04-0410-961f-82ee72b054a4
+
+Upstream-Status: Pending
+
+Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
+
+---
+ gcc/config/i386/i386.c | 30 +++++++++++++++---------------
+ 1 file changed, 15 insertions(+), 15 deletions(-)
+
+diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c
+index 9c038be..4012657 100644
+--- a/gcc/config/i386/i386.c
++++ b/gcc/config/i386/i386.c
+@@ -11087,16 +11087,16 @@ static int indirect_thunks_bnd_used;
+ /* Fills in the label name that should be used for the indirect thunk.  */
+ 
+ static void
+-indirect_thunk_name (char name[32], int regno, bool need_bnd_p,
+-		     bool ret_p)
++indirect_thunk_name (char name[32], unsigned int regno,
++		     bool need_bnd_p, bool ret_p)
+ {
+-  if (regno >= 0 && ret_p)
++  if (regno != INVALID_REGNUM && ret_p)
+     gcc_unreachable ();
+ 
+   if (USE_HIDDEN_LINKONCE)
+     {
+       const char *bnd = need_bnd_p ? "_bnd" : "";
+-      if (regno >= 0)
++      if (regno != INVALID_REGNUM)
+ 	{
+ 	  const char *reg_prefix;
+ 	  if (LEGACY_INT_REGNO_P (regno))
+@@ -11114,7 +11114,7 @@ indirect_thunk_name (char name[32], int regno, bool need_bnd_p,
+     }
+   else
+     {
+-      if (regno >= 0)
++      if (regno != INVALID_REGNUM)
+ 	{
+ 	  if (need_bnd_p)
+ 	    ASM_GENERATE_INTERNAL_LABEL (name, "LITBR", regno);
+@@ -11166,7 +11166,7 @@ indirect_thunk_name (char name[32], int regno, bool need_bnd_p,
+  */
+ 
+ static void
+-output_indirect_thunk (bool need_bnd_p, int regno)
++output_indirect_thunk (bool need_bnd_p, unsigned int regno)
+ {
+   char indirectlabel1[32];
+   char indirectlabel2[32];
+@@ -11196,7 +11196,7 @@ output_indirect_thunk (bool need_bnd_p, int regno)
+ 
+   ASM_OUTPUT_INTERNAL_LABEL (asm_out_file, indirectlabel2);
+ 
+-  if (regno >= 0)
++  if (regno != INVALID_REGNUM)
+     {
+       /* MOV.  */
+       rtx xops[2];
+@@ -11220,12 +11220,12 @@ output_indirect_thunk (bool need_bnd_p, int regno)
+ }
+ 
+ /* Output a funtion with a call and return thunk for indirect branch.
+-   If BND_P is true, the BND prefix is needed.   If REGNO != -1,  the
+-   function address is in REGNO.  Otherwise, the function address is
++   If BND_P is true, the BND prefix is needed.  If REGNO != INVALID_REGNUM,
++   the function address is in REGNO.  Otherwise, the function address is
+    on the top of stack.  */
+ 
+ static void
+-output_indirect_thunk_function (bool need_bnd_p, int regno)
++output_indirect_thunk_function (bool need_bnd_p, unsigned int regno)
+ {
+   char name[32];
+   tree decl;
+@@ -11274,7 +11274,7 @@ output_indirect_thunk_function (bool need_bnd_p, int regno)
+ 	ASM_OUTPUT_LABEL (asm_out_file, name);
+       }
+ 
+-  if (regno < 0)
++  if (regno == INVALID_REGNUM)
+     {
+       /* Create alias for __x86.return_thunk/__x86.return_thunk_bnd.  */
+       char alias[32];
+@@ -11348,16 +11348,16 @@ static void
+ ix86_code_end (void)
+ {
+   rtx xops[2];
+-  int regno;
++  unsigned int regno;
+ 
+   if (indirect_thunk_needed)
+-    output_indirect_thunk_function (false, -1);
++    output_indirect_thunk_function (false, INVALID_REGNUM);
+   if (indirect_thunk_bnd_needed)
+-    output_indirect_thunk_function (true, -1);
++    output_indirect_thunk_function (true, INVALID_REGNUM);
+ 
+   for (regno = FIRST_REX_INT_REG; regno <= LAST_REX_INT_REG; regno++)
+     {
+-      int i = regno - FIRST_REX_INT_REG + LAST_INT_REG + 1;
++      unsigned int i = regno - FIRST_REX_INT_REG + LAST_INT_REG + 1;
+       if ((indirect_thunks_used & (1 << i)))
+ 	output_indirect_thunk_function (false, regno);
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/backport/0010-i386-Pass-INVALID_REGNUM-as-invalid-register-number.patch b/meta/recipes-devtools/gcc/gcc-6.4/backport/0010-i386-Pass-INVALID_REGNUM-as-invalid-register-number.patch
new file mode 100644
index 0000000..080d741
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.4/backport/0010-i386-Pass-INVALID_REGNUM-as-invalid-register-number.patch
@@ -0,0 +1,46 @@
+From c4300d9ad683e693c90d02d4f1b13183bf2d4acc Mon Sep 17 00:00:00 2001
+From: hjl <hjl@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Fri, 2 Feb 2018 16:47:02 +0000
+Subject: [PATCH 10/12] i386: Pass INVALID_REGNUM as invalid register number
+
+	Backport from mainline
+	* config/i386/i386.c (ix86_output_function_return): Pass
+	INVALID_REGNUM, instead of -1, as invalid register number to
+	indirect_thunk_name and output_indirect_thunk.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-7-branch@257341 138bc75d-0d04-0410-961f-82ee72b054a4
+
+Upstream-Status: Pending
+
+Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
+
+---
+ gcc/config/i386/i386.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c
+index 4012657..66502ee 100644
+--- a/gcc/config/i386/i386.c
++++ b/gcc/config/i386/i386.c
+@@ -28056,7 +28056,8 @@ ix86_output_function_return (bool long_p)
+ 	{
+ 	  bool need_thunk = (cfun->machine->function_return_type
+ 			     == indirect_branch_thunk);
+-	  indirect_thunk_name (thunk_name, -1, need_bnd_p, true);
++	  indirect_thunk_name (thunk_name, INVALID_REGNUM, need_bnd_p,
++			       true);
+ 	  if (need_bnd_p)
+ 	    {
+ 	      indirect_thunk_bnd_needed |= need_thunk;
+@@ -28069,7 +28070,7 @@ ix86_output_function_return (bool long_p)
+ 	    }
+ 	}
+       else
+-	output_indirect_thunk (need_bnd_p, -1);
++	output_indirect_thunk (need_bnd_p, INVALID_REGNUM);
+ 
+       return "";
+     }
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/backport/0011-i386-Update-mfunction-return-for-return-with-pop.patch b/meta/recipes-devtools/gcc/gcc-6.4/backport/0011-i386-Update-mfunction-return-for-return-with-pop.patch
new file mode 100644
index 0000000..3b036fb
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.4/backport/0011-i386-Update-mfunction-return-for-return-with-pop.patch
@@ -0,0 +1,453 @@
+From b3a2269c7884378a9afd394ac7e669aab0443b57 Mon Sep 17 00:00:00 2001
+From: hjl <hjl@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Mon, 26 Feb 2018 15:29:30 +0000
+Subject: [PATCH 11/12] i386: Update -mfunction-return= for return with pop
+
+When -mfunction-return= is used, simple_return_pop_internal should pop
+return address into ECX register, adjust stack by bytes to pop from stack
+and jump to the return thunk via ECX register.
+
+Revision 257992 removed the bool argument from ix86_output_indirect_jmp.
+Update comments to reflect it.
+
+Tested on i686 and x86-64.
+
+	Backport from mainline
+	* config/i386/i386.c (ix86_output_indirect_jmp): Update comments.
+
+	PR target/84530
+	* config/i386/i386-protos.h (ix86_output_indirect_jmp): Remove
+	the bool argument.
+	(ix86_output_indirect_function_return): New prototype.
+	(ix86_split_simple_return_pop_internal): Likewise.
+	* config/i386/i386.c (indirect_return_via_cx): New.
+	(indirect_return_via_cx_bnd): Likewise.
+	(indirect_thunk_name): Handle return va CX_REG.
+	(output_indirect_thunk_function): Create alias for
+	__x86_return_thunk_[re]cx and __x86_return_thunk_[re]cx_bnd.
+	(ix86_output_indirect_jmp): Remove the bool argument.
+	(ix86_output_indirect_function_return): New function.
+	(ix86_split_simple_return_pop_internal): Likewise.
+	* config/i386/i386.md (*indirect_jump): Don't pass false
+	to ix86_output_indirect_jmp.
+	(*tablejump_1): Likewise.
+	(simple_return_pop_internal): Change it to define_insn_and_split.
+	Call ix86_split_simple_return_pop_internal to split it for
+	-mfunction-return=.
+	(simple_return_indirect_internal): Call
+	ix86_output_indirect_function_return instead of
+	ix86_output_indirect_jmp.
+
+gcc/testsuite/
+
+	Backport from mainline
+	PR target/84530
+	* gcc.target/i386/ret-thunk-22.c: New test.
+	* gcc.target/i386/ret-thunk-23.c: Likewise.
+	* gcc.target/i386/ret-thunk-24.c: Likewise.
+	* gcc.target/i386/ret-thunk-25.c: Likewise.
+	* gcc.target/i386/ret-thunk-26.c: Likewise.
+
+Upstream-Status: Pending
+
+Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
+
+---
+ gcc/config/i386/i386-protos.h                |   4 +-
+ gcc/config/i386/i386.c                       | 127 +++++++++++++++++++++++----
+ gcc/config/i386/i386.md                      |  11 ++-
+ gcc/testsuite/gcc.target/i386/ret-thunk-22.c |  15 ++++
+ gcc/testsuite/gcc.target/i386/ret-thunk-23.c |  15 ++++
+ gcc/testsuite/gcc.target/i386/ret-thunk-24.c |  15 ++++
+ gcc/testsuite/gcc.target/i386/ret-thunk-25.c |  15 ++++
+ gcc/testsuite/gcc.target/i386/ret-thunk-26.c |  40 +++++++++
+ 8 files changed, 222 insertions(+), 20 deletions(-)
+ create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-22.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-23.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-24.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-25.c
+ create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-26.c
+
+diff --git a/gcc/config/i386/i386-protos.h b/gcc/config/i386/i386-protos.h
+index 620d70e..c7a0ccb5 100644
+--- a/gcc/config/i386/i386-protos.h
++++ b/gcc/config/i386/i386-protos.h
+@@ -311,8 +311,10 @@ extern enum attr_cpu ix86_schedule;
+ #endif
+ 
+ extern const char * ix86_output_call_insn (rtx_insn *insn, rtx call_op);
+-extern const char * ix86_output_indirect_jmp (rtx call_op, bool ret_p);
++extern const char * ix86_output_indirect_jmp (rtx call_op);
+ extern const char * ix86_output_function_return (bool long_p);
++extern const char * ix86_output_indirect_function_return (rtx ret_op);
++extern void ix86_split_simple_return_pop_internal (rtx);
+ extern bool ix86_operands_ok_for_move_multiple (rtx *operands, bool load,
+ 						enum machine_mode mode);
+ 
+diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c
+index 66502ee..21c3c18 100644
+--- a/gcc/config/i386/i386.c
++++ b/gcc/config/i386/i386.c
+@@ -11080,6 +11080,12 @@ static int indirect_thunks_used;
+    by call and return thunks functions with the BND prefix.  */
+ static int indirect_thunks_bnd_used;
+ 
++/* True if return thunk function via CX is needed.  */
++static bool indirect_return_via_cx;
++/* True if return thunk function via CX with the BND prefix is
++   needed.  */
++static bool indirect_return_via_cx_bnd;
++
+ #ifndef INDIRECT_LABEL
+ # define INDIRECT_LABEL "LIND"
+ #endif
+@@ -11090,12 +11096,13 @@ static void
+ indirect_thunk_name (char name[32], unsigned int regno,
+ 		     bool need_bnd_p, bool ret_p)
+ {
+-  if (regno != INVALID_REGNUM && ret_p)
++  if (regno != INVALID_REGNUM && regno != CX_REG && ret_p)
+     gcc_unreachable ();
+ 
+   if (USE_HIDDEN_LINKONCE)
+     {
+       const char *bnd = need_bnd_p ? "_bnd" : "";
++      const char *ret = ret_p ? "return" : "indirect";
+       if (regno != INVALID_REGNUM)
+ 	{
+ 	  const char *reg_prefix;
+@@ -11103,14 +11110,11 @@ indirect_thunk_name (char name[32], unsigned int regno,
+ 	    reg_prefix = TARGET_64BIT ? "r" : "e";
+ 	  else
+ 	    reg_prefix = "";
+-	  sprintf (name, "__x86_indirect_thunk%s_%s%s",
+-		   bnd, reg_prefix, reg_names[regno]);
++	  sprintf (name, "__x86_%s_thunk%s_%s%s",
++		   ret, bnd, reg_prefix, reg_names[regno]);
+ 	}
+       else
+-	{
+-	  const char *ret = ret_p ? "return" : "indirect";
+-	  sprintf (name, "__x86_%s_thunk%s", ret, bnd);
+-	}
++	sprintf (name, "__x86_%s_thunk%s", ret, bnd);
+     }
+   else
+     {
+@@ -11274,9 +11278,23 @@ output_indirect_thunk_function (bool need_bnd_p, unsigned int regno)
+ 	ASM_OUTPUT_LABEL (asm_out_file, name);
+       }
+ 
++  /* Create alias for __x86_return_thunk/__x86_return_thunk_bnd or
++     __x86_return_thunk_ecx/__x86_return_thunk_ecx_bnd.  */
++  bool need_alias;
+   if (regno == INVALID_REGNUM)
++    need_alias = true;
++  else if (regno == CX_REG)
++    {
++      if (need_bnd_p)
++	need_alias = indirect_return_via_cx_bnd;
++      else
++	need_alias = indirect_return_via_cx;
++    }
++  else
++    need_alias = false;
++
++  if (need_alias)
+     {
+-      /* Create alias for __x86.return_thunk/__x86.return_thunk_bnd.  */
+       char alias[32];
+ 
+       indirect_thunk_name (alias, regno, need_bnd_p, true);
+@@ -28019,18 +28037,17 @@ ix86_output_indirect_branch (rtx call_op, const char *xasm,
+   else
+     ix86_output_indirect_branch_via_push (call_op, xasm, sibcall_p);
+ }
+-/* Output indirect jump.  CALL_OP is the jump target.  Jump is a
+-   function return if RET_P is true.  */
++
++/* Output indirect jump.  CALL_OP is the jump target.  */
+ 
+ const char *
+-ix86_output_indirect_jmp (rtx call_op, bool ret_p)
++ix86_output_indirect_jmp (rtx call_op)
+ {
+   if (cfun->machine->indirect_branch_type != indirect_branch_keep)
+     {
+-      /* We can't have red-zone if this isn't a function return since
+-	 "call" in the indirect thunk pushes the return address onto
+-	 stack, destroying red-zone.  */
+-      if (!ret_p && ix86_red_zone_size != 0)
++      /* We can't have red-zone since "call" in the indirect thunk
++         pushes the return address onto stack, destroying red-zone.  */
++      if (ix86_red_zone_size != 0)
+ 	gcc_unreachable ();
+ 
+       ix86_output_indirect_branch (call_op, "%0", true);
+@@ -28081,6 +28098,86 @@ ix86_output_function_return (bool long_p)
+   return "rep%; ret";
+ }
+ 
++/* Output indirect function return.  RET_OP is the function return
++   target.  */
++
++const char *
++ix86_output_indirect_function_return (rtx ret_op)
++{
++  if (cfun->machine->function_return_type != indirect_branch_keep)
++    {
++      char thunk_name[32];
++      bool need_bnd_p = ix86_bnd_prefixed_insn_p (current_output_insn);
++      unsigned int regno = REGNO (ret_op);
++      gcc_assert (regno == CX_REG);
++
++      if (cfun->machine->function_return_type
++	  != indirect_branch_thunk_inline)
++	{
++	  bool need_thunk = (cfun->machine->function_return_type
++			     == indirect_branch_thunk);
++	  indirect_thunk_name (thunk_name, regno, need_bnd_p, true);
++	  if (need_bnd_p)
++	    {
++	      if (need_thunk)
++		{
++		  indirect_return_via_cx_bnd = true;
++		  indirect_thunks_bnd_used |= 1 << CX_REG;
++		}
++	      fprintf (asm_out_file, "\tbnd jmp\t%s\n", thunk_name);
++	    }
++	  else
++	    {
++	      if (need_thunk)
++		{
++		  indirect_return_via_cx = true;
++		  indirect_thunks_used |= 1 << CX_REG;
++		}
++	      fprintf (asm_out_file, "\tjmp\t%s\n", thunk_name);
++	    }
++	}
++      else
++	output_indirect_thunk (need_bnd_p, regno);
++
++      return "";
++    }
++  else
++    return "%!jmp\t%A0";
++}
++
++/* Split simple return with popping POPC bytes from stack to indirect
++   branch with stack adjustment .  */
++
++void
++ix86_split_simple_return_pop_internal (rtx popc)
++{
++  struct machine_function *m = cfun->machine;
++  rtx ecx = gen_rtx_REG (SImode, CX_REG);
++  rtx_insn *insn;
++
++  /* There is no "pascal" calling convention in any 64bit ABI.  */
++  gcc_assert (!TARGET_64BIT);
++
++  insn = emit_insn (gen_pop (ecx));
++  m->fs.cfa_offset -= UNITS_PER_WORD;
++  m->fs.sp_offset -= UNITS_PER_WORD;
++
++  rtx x = plus_constant (Pmode, stack_pointer_rtx, UNITS_PER_WORD);
++  x = gen_rtx_SET (stack_pointer_rtx, x);
++  add_reg_note (insn, REG_CFA_ADJUST_CFA, x);
++  add_reg_note (insn, REG_CFA_REGISTER, gen_rtx_SET (ecx, pc_rtx));
++  RTX_FRAME_RELATED_P (insn) = 1;
++
++  x = gen_rtx_PLUS (Pmode, stack_pointer_rtx, popc);
++  x = gen_rtx_SET (stack_pointer_rtx, x);
++  insn = emit_insn (x);
++  add_reg_note (insn, REG_CFA_ADJUST_CFA, x);
++  RTX_FRAME_RELATED_P (insn) = 1;
++
++  /* Now return address is in ECX.  */
++  emit_jump_insn (gen_simple_return_indirect_internal (ecx));
++}
++
+ /* Output the assembly for a call instruction.  */
+ 
+ const char *
+diff --git a/gcc/config/i386/i386.md b/gcc/config/i386/i386.md
+index 05a88ff..857466a 100644
+--- a/gcc/config/i386/i386.md
++++ b/gcc/config/i386/i386.md
+@@ -11813,7 +11813,7 @@
+ (define_insn "*indirect_jump"
+   [(set (pc) (match_operand:W 0 "indirect_branch_operand" "rBw"))]
+   ""
+-  "* return ix86_output_indirect_jmp (operands[0], false);"
++  "* return ix86_output_indirect_jmp (operands[0]);"
+   [(set (attr "type")
+      (if_then_else (match_test "(cfun->machine->indirect_branch_type
+ 				 != indirect_branch_keep)")
+@@ -11868,7 +11868,7 @@
+   [(set (pc) (match_operand:W 0 "indirect_branch_operand" "rBw"))
+    (use (label_ref (match_operand 1)))]
+   ""
+-  "* return ix86_output_indirect_jmp (operands[0], false);"
++  "* return ix86_output_indirect_jmp (operands[0]);"
+   [(set (attr "type")
+      (if_then_else (match_test "(cfun->machine->indirect_branch_type
+ 				 != indirect_branch_keep)")
+@@ -12520,11 +12520,14 @@
+    (set_attr "prefix_rep" "1")
+    (set_attr "modrm" "0")])
+ 
+-(define_insn "simple_return_pop_internal"
++(define_insn_and_split "simple_return_pop_internal"
+   [(simple_return)
+    (use (match_operand:SI 0 "const_int_operand"))]
+   "reload_completed"
+   "%!ret\t%0"
++  "&& cfun->machine->function_return_type != indirect_branch_keep"
++  [(const_int 0)]
++  "ix86_split_simple_return_pop_internal (operands[0]); DONE;"
+   [(set_attr "length" "3")
+    (set_attr "atom_unit" "jeu")
+    (set_attr "length_immediate" "2")
+@@ -12535,7 +12538,7 @@
+   [(simple_return)
+    (use (match_operand:SI 0 "register_operand" "r"))]
+   "reload_completed"
+-  "* return ix86_output_indirect_jmp (operands[0], true);"
++  "* return ix86_output_indirect_function_return (operands[0]);"
+   [(set (attr "type")
+      (if_then_else (match_test "(cfun->machine->indirect_branch_type
+ 				 != indirect_branch_keep)")
+diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-22.c b/gcc/testsuite/gcc.target/i386/ret-thunk-22.c
+new file mode 100644
+index 0000000..89e086d
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-22.c
+@@ -0,0 +1,15 @@
++/* PR target/r84530 */
++/* { dg-do compile { target ia32 } } */
++/* { dg-options "-O2 -mfunction-return=thunk" } */
++
++struct s { _Complex unsigned short x; };
++struct s gs = { 100 + 200i };
++struct s __attribute__((noinline)) foo (void) { return gs; }
++
++/* { dg-final { scan-assembler-times "popl\[\\t \]*%ecx" 1 } } */
++/* { dg-final { scan-assembler "lea\[l\]?\[\\t \]*4\\(%esp\\), %esp" } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_return_thunk_ecx" } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler {\tpause} } } */
++/* { dg-final { scan-assembler {\tlfence} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-23.c b/gcc/testsuite/gcc.target/i386/ret-thunk-23.c
+new file mode 100644
+index 0000000..43f0cca
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-23.c
+@@ -0,0 +1,15 @@
++/* PR target/r84530 */
++/* { dg-do compile { target ia32 } } */
++/* { dg-options "-O2 -mfunction-return=thunk-extern" } */
++
++struct s { _Complex unsigned short x; };
++struct s gs = { 100 + 200i };
++struct s __attribute__((noinline)) foo (void) { return gs; }
++
++/* { dg-final { scan-assembler-times "popl\[\\t \]*%ecx" 1 } } */
++/* { dg-final { scan-assembler "lea\[l\]?\[\\t \]*4\\(%esp\\), %esp" } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_return_thunk_ecx" } } */
++/* { dg-final { scan-assembler-not "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler-not "call\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler-not {\tpause} } } */
++/* { dg-final { scan-assembler-not {\tlfence} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-24.c b/gcc/testsuite/gcc.target/i386/ret-thunk-24.c
+new file mode 100644
+index 0000000..8729e35
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-24.c
+@@ -0,0 +1,15 @@
++/* PR target/r84530 */
++/* { dg-do compile { target ia32 } } */
++/* { dg-options "-O2 -mfunction-return=thunk-inline" } */
++
++struct s { _Complex unsigned short x; };
++struct s gs = { 100 + 200i };
++struct s __attribute__((noinline)) foo (void) { return gs; }
++
++/* { dg-final { scan-assembler-times "popl\[\\t \]*%ecx" 1 } } */
++/* { dg-final { scan-assembler "lea\[l\]?\[\\t \]*4\\(%esp\\), %esp" } } */
++/* { dg-final { scan-assembler-not "jmp\[ \t\]*__x86_return_thunk_ecx" } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler {\tpause} } } */
++/* { dg-final { scan-assembler {\tlfence} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-25.c b/gcc/testsuite/gcc.target/i386/ret-thunk-25.c
+new file mode 100644
+index 0000000..f73553c
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-25.c
+@@ -0,0 +1,15 @@
++/* PR target/r84530 */
++/* { dg-do compile { target ia32 } } */
++/* { dg-options "-O2 -mfunction-return=thunk -fcheck-pointer-bounds -mmpx -fno-pic" } */
++
++struct s { _Complex unsigned short x; };
++struct s gs = { 100 + 200i };
++struct s __attribute__((noinline)) foo (void) { return gs; }
++
++/* { dg-final { scan-assembler-times "popl\[\\t \]*%ecx" 1 } } */
++/* { dg-final { scan-assembler "lea\[l\]?\[\\t \]*4\\(%esp\\), %esp" } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_return_thunk_bnd_ecx" } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler {\tpause} } } */
++/* { dg-final { scan-assembler {\tlfence} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-26.c b/gcc/testsuite/gcc.target/i386/ret-thunk-26.c
+new file mode 100644
+index 0000000..9144e98
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-26.c
+@@ -0,0 +1,40 @@
++/* PR target/r84530 */
++/* { dg-do run } */
++/* { dg-options "-Os -mfunction-return=thunk" } */
++
++struct S { int i; };
++__attribute__((const, noinline, noclone))
++struct S foo (int x)
++{
++  struct S s;
++  s.i = x;
++  return s;
++}
++
++int a[2048], b[2048], c[2048], d[2048];
++struct S e[2048];
++
++__attribute__((noinline, noclone)) void
++bar (void)
++{
++  int i;
++  for (i = 0; i < 1024; i++)
++    {
++      e[i] = foo (i);
++      a[i+2] = a[i] + a[i+1];
++      b[10] = b[10] + i;
++      c[i] = c[2047 - i];
++      d[i] = d[i + 1];
++    }
++}
++
++int
++main ()
++{
++  int i;
++  bar ();
++  for (i = 0; i < 1024; i++)
++    if (e[i].i != i)
++      __builtin_abort ();
++  return 0;
++}
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/backport/0012-i386-Add-TARGET_INDIRECT_BRANCH_REGISTER.patch b/meta/recipes-devtools/gcc/gcc-6.4/backport/0012-i386-Add-TARGET_INDIRECT_BRANCH_REGISTER.patch
new file mode 100644
index 0000000..b50ac5c
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.4/backport/0012-i386-Add-TARGET_INDIRECT_BRANCH_REGISTER.patch
@@ -0,0 +1,1004 @@
+From 7ba192d11a43d24ce427a3dfce0ad0592bd52830 Mon Sep 17 00:00:00 2001
+From: hjl <hjl@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Mon, 26 Feb 2018 17:00:46 +0000
+Subject: [PATCH 12/12] i386: Add TARGET_INDIRECT_BRANCH_REGISTER
+
+For
+
+---
+struct C {
+  virtual ~C();
+  virtual void f();
+};
+
+void
+f (C *p)
+{
+  p->f();
+  p->f();
+}
+---
+
+-mindirect-branch=thunk-extern -O2 on x86-64 GNU/Linux generates:
+
+_Z1fP1C:
+.LFB0:
+        .cfi_startproc
+        pushq   %rbx
+        .cfi_def_cfa_offset 16
+        .cfi_offset 3, -16
+        movq    (%rdi), %rax
+        movq    %rdi, %rbx
+        jmp     .LIND1
+.LIND0:
+        pushq   16(%rax)
+        jmp     __x86_indirect_thunk
+.LIND1:
+        call    .LIND0
+        movq    (%rbx), %rax
+        movq    %rbx, %rdi
+        popq    %rbx
+        .cfi_def_cfa_offset 8
+        movq    16(%rax), %rax
+        jmp     __x86_indirect_thunk_rax
+        .cfi_endproc
+
+x86-64 is supposed to have asynchronous unwind tables by default, but
+there is nothing that reflects the change in the (relative) frame
+address after .LIND0.  That region really has to be moved outside of
+the .cfi_startproc/.cfi_endproc bracket.
+
+This patch adds TARGET_INDIRECT_BRANCH_REGISTER to force indirect
+branch via register whenever -mindirect-branch= is used.  Now,
+-mindirect-branch=thunk-extern -O2 on x86-64 GNU/Linux generates:
+
+_Z1fP1C:
+.LFB0:
+	.cfi_startproc
+	pushq	%rbx
+	.cfi_def_cfa_offset 16
+	.cfi_offset 3, -16
+	movq	(%rdi), %rax
+	movq	%rdi, %rbx
+	movq	16(%rax), %rax
+	call	__x86_indirect_thunk_rax
+	movq	(%rbx), %rax
+	movq	%rbx, %rdi
+	popq	%rbx
+	.cfi_def_cfa_offset 8
+	movq	16(%rax), %rax
+	jmp	__x86_indirect_thunk_rax
+	.cfi_endproc
+
+so that "-mindirect-branch=thunk-extern" is equivalent to
+"-mindirect-branch=thunk-extern -mindirect-branch-register", which is
+used by Linux kernel.
+
+gcc/
+
+	Backport from mainline
+	PR target/84039
+	* config/i386/constraints.md (Bs): Replace
+	ix86_indirect_branch_register with
+	TARGET_INDIRECT_BRANCH_REGISTER.
+	(Bw): Likewise.
+	* config/i386/i386.md (indirect_jump): Likewise.
+	(tablejump): Likewise.
+	(*sibcall_memory): Likewise.
+	(*sibcall_value_memory): Likewise.
+	Peepholes of indirect call and jump via memory: Likewise.
+	(*sibcall_GOT_32): Disallowed for TARGET_INDIRECT_BRANCH_REGISTER.
+	(*sibcall_value_GOT_32): Likewise.
+	* config/i386/predicates.md (indirect_branch_operand): Likewise.
+	(GOT_memory_operand): Likewise.
+	(call_insn_operand): Likewise.
+	(sibcall_insn_operand): Likewise.
+	(GOT32_symbol_operand): Likewise.
+	* config/i386/i386.h (TARGET_INDIRECT_BRANCH_REGISTER): New.
+
+gcc/testsuite/
+
+	Backport from mainline
+	PR target/84039
+	* gcc.target/i386/indirect-thunk-1.c: Updated.
+	* gcc.target/i386/indirect-thunk-2.c: Likewise.
+	* gcc.target/i386/indirect-thunk-3.c: Likewise.
+	* gcc.target/i386/indirect-thunk-4.c: Likewise.
+	* gcc.target/i386/indirect-thunk-5.c: Likewise.
+	* gcc.target/i386/indirect-thunk-6.c: Likewise.
+	* gcc.target/i386/indirect-thunk-7.c: Likewise.
+	* gcc.target/i386/indirect-thunk-attr-1.c: Likewise.
+	* gcc.target/i386/indirect-thunk-attr-2.c: Likewise.
+	* gcc.target/i386/indirect-thunk-attr-3.c: Likewise.
+	* gcc.target/i386/indirect-thunk-attr-4.c: Likewise.
+	* gcc.target/i386/indirect-thunk-attr-5.c: Likewise.
+	* gcc.target/i386/indirect-thunk-attr-6.c: Likewise.
+	* gcc.target/i386/indirect-thunk-attr-7.c: Likewise.
+	* gcc.target/i386/indirect-thunk-bnd-1.c: Likewise.
+	* gcc.target/i386/indirect-thunk-bnd-2.c: Likewise.
+	* gcc.target/i386/indirect-thunk-bnd-3.c: Likewise.
+	* gcc.target/i386/indirect-thunk-bnd-4.c: Likewise.
+	* gcc.target/i386/indirect-thunk-extern-1.c: Likewise.
+	* gcc.target/i386/indirect-thunk-extern-2.c: Likewise.
+	* gcc.target/i386/indirect-thunk-extern-3.c: Likewise.
+	* gcc.target/i386/indirect-thunk-extern-4.c: Likewise.
+	* gcc.target/i386/indirect-thunk-extern-5.c: Likewise.
+	* gcc.target/i386/indirect-thunk-extern-6.c: Likewise.
+	* gcc.target/i386/indirect-thunk-extern-7.c: Likewise.
+	* gcc.target/i386/indirect-thunk-inline-1.c: Likewise.
+	* gcc.target/i386/indirect-thunk-inline-2.c: Likewise.
+	* gcc.target/i386/indirect-thunk-inline-3.c: Likewise.
+	* gcc.target/i386/indirect-thunk-inline-4.c: Likewise.
+	* gcc.target/i386/indirect-thunk-inline-5.c: Likewise.
+	* gcc.target/i386/indirect-thunk-inline-6.c: Likewise.
+	* gcc.target/i386/indirect-thunk-inline-7.c: Likewise.
+	* gcc.target/i386/ret-thunk-9.c: Likewise.
+	* gcc.target/i386/ret-thunk-10.c: Likewise.
+	* gcc.target/i386/ret-thunk-11.c: Likewise.
+	* gcc.target/i386/ret-thunk-12.c: Likewise.
+	* gcc.target/i386/ret-thunk-13.c: Likewise.
+	* gcc.target/i386/ret-thunk-14.c: Likewise.
+	* gcc.target/i386/ret-thunk-15.c: Likewise.
+
+Upstream-Status: Pending
+
+Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
+
+---
+ gcc/config/i386/constraints.md                     |  4 ++--
+ gcc/config/i386/i386.h                             |  5 ++++
+ gcc/config/i386/i386.md                            | 28 +++++++++++++---------
+ gcc/config/i386/predicates.md                      |  6 ++---
+ gcc/testsuite/gcc.target/i386/indirect-thunk-1.c   |  5 ++--
+ gcc/testsuite/gcc.target/i386/indirect-thunk-2.c   |  5 ++--
+ gcc/testsuite/gcc.target/i386/indirect-thunk-3.c   |  5 ++--
+ gcc/testsuite/gcc.target/i386/indirect-thunk-4.c   |  5 ++--
+ gcc/testsuite/gcc.target/i386/indirect-thunk-5.c   |  6 +++--
+ gcc/testsuite/gcc.target/i386/indirect-thunk-6.c   | 12 ++++++----
+ gcc/testsuite/gcc.target/i386/indirect-thunk-7.c   |  5 ++--
+ .../gcc.target/i386/indirect-thunk-attr-1.c        |  5 ++--
+ .../gcc.target/i386/indirect-thunk-attr-2.c        |  5 ++--
+ .../gcc.target/i386/indirect-thunk-attr-3.c        |  3 +--
+ .../gcc.target/i386/indirect-thunk-attr-4.c        |  3 +--
+ .../gcc.target/i386/indirect-thunk-attr-5.c        |  9 ++++---
+ .../gcc.target/i386/indirect-thunk-attr-6.c        |  9 ++++---
+ .../gcc.target/i386/indirect-thunk-attr-7.c        |  5 ++--
+ .../gcc.target/i386/indirect-thunk-bnd-1.c         |  6 ++---
+ .../gcc.target/i386/indirect-thunk-bnd-2.c         |  6 ++---
+ .../gcc.target/i386/indirect-thunk-bnd-3.c         |  5 ++--
+ .../gcc.target/i386/indirect-thunk-bnd-4.c         |  7 +++---
+ .../gcc.target/i386/indirect-thunk-extern-1.c      |  5 ++--
+ .../gcc.target/i386/indirect-thunk-extern-2.c      |  5 ++--
+ .../gcc.target/i386/indirect-thunk-extern-3.c      |  9 ++++---
+ .../gcc.target/i386/indirect-thunk-extern-4.c      |  6 ++---
+ .../gcc.target/i386/indirect-thunk-extern-5.c      |  6 +++--
+ .../gcc.target/i386/indirect-thunk-extern-6.c      |  8 +++----
+ .../gcc.target/i386/indirect-thunk-extern-7.c      |  5 ++--
+ .../gcc.target/i386/indirect-thunk-inline-1.c      |  2 +-
+ .../gcc.target/i386/indirect-thunk-inline-2.c      |  2 +-
+ .../gcc.target/i386/indirect-thunk-inline-3.c      |  2 +-
+ .../gcc.target/i386/indirect-thunk-inline-4.c      |  2 +-
+ .../gcc.target/i386/indirect-thunk-inline-5.c      |  3 ++-
+ .../gcc.target/i386/indirect-thunk-inline-6.c      |  3 ++-
+ .../gcc.target/i386/indirect-thunk-inline-7.c      |  4 ++--
+ gcc/testsuite/gcc.target/i386/ret-thunk-10.c       |  9 +++----
+ gcc/testsuite/gcc.target/i386/ret-thunk-11.c       |  9 +++----
+ gcc/testsuite/gcc.target/i386/ret-thunk-12.c       |  8 +++----
+ gcc/testsuite/gcc.target/i386/ret-thunk-13.c       |  5 ++--
+ gcc/testsuite/gcc.target/i386/ret-thunk-14.c       |  7 +++---
+ gcc/testsuite/gcc.target/i386/ret-thunk-15.c       |  7 +++---
+ gcc/testsuite/gcc.target/i386/ret-thunk-9.c        | 13 ++++------
+ 43 files changed, 128 insertions(+), 141 deletions(-)
+
+diff --git a/gcc/config/i386/constraints.md b/gcc/config/i386/constraints.md
+index 9204c8e..ef684a9 100644
+--- a/gcc/config/i386/constraints.md
++++ b/gcc/config/i386/constraints.md
+@@ -172,7 +172,7 @@
+ 
+ (define_constraint "Bs"
+   "@internal Sibcall memory operand."
+-  (ior (and (not (match_test "ix86_indirect_branch_register"))
++  (ior (and (not (match_test "TARGET_INDIRECT_BRANCH_REGISTER"))
+ 	    (not (match_test "TARGET_X32"))
+ 	    (match_operand 0 "sibcall_memory_operand"))
+        (and (match_test "TARGET_X32 && Pmode == DImode")
+@@ -180,7 +180,7 @@
+ 
+ (define_constraint "Bw"
+   "@internal Call memory operand."
+-  (ior (and (not (match_test "ix86_indirect_branch_register"))
++  (ior (and (not (match_test "TARGET_INDIRECT_BRANCH_REGISTER"))
+ 	    (not (match_test "TARGET_X32"))
+ 	    (match_operand 0 "memory_operand"))
+        (and (match_test "TARGET_X32 && Pmode == DImode")
+diff --git a/gcc/config/i386/i386.h b/gcc/config/i386/i386.h
+index b34bc11..1816d71 100644
+--- a/gcc/config/i386/i386.h
++++ b/gcc/config/i386/i386.h
+@@ -2676,6 +2676,11 @@ extern void debug_dispatch_window (int);
+ #define TARGET_RECIP_VEC_DIV	((recip_mask & RECIP_MASK_VEC_DIV) != 0)
+ #define TARGET_RECIP_VEC_SQRT	((recip_mask & RECIP_MASK_VEC_SQRT) != 0)
+ 
++
++#define TARGET_INDIRECT_BRANCH_REGISTER \
++  (ix86_indirect_branch_register \
++   || cfun->machine->indirect_branch_type != indirect_branch_keep)
++
+ #define IX86_HLE_ACQUIRE (1 << 16)
+ #define IX86_HLE_RELEASE (1 << 17)
+ 
+diff --git a/gcc/config/i386/i386.md b/gcc/config/i386/i386.md
+index 857466a..6a6dc26 100644
+--- a/gcc/config/i386/i386.md
++++ b/gcc/config/i386/i386.md
+@@ -11805,7 +11805,7 @@
+   [(set (pc) (match_operand 0 "indirect_branch_operand"))]
+   ""
+ {
+-  if (TARGET_X32 || ix86_indirect_branch_register)
++  if (TARGET_X32 || TARGET_INDIRECT_BRANCH_REGISTER)
+     operands[0] = convert_memory_address (word_mode, operands[0]);
+   cfun->machine->has_local_indirect_jump = true;
+ })
+@@ -11859,7 +11859,7 @@
+ 					 OPTAB_DIRECT);
+     }
+ 
+-  if (TARGET_X32 || ix86_indirect_branch_register)
++  if (TARGET_X32 || TARGET_INDIRECT_BRANCH_REGISTER)
+     operands[0] = convert_memory_address (word_mode, operands[0]);
+   cfun->machine->has_local_indirect_jump = true;
+ })
+@@ -12029,7 +12029,10 @@
+ 		     (match_operand:SI 0 "register_no_elim_operand" "U")
+ 		     (match_operand:SI 1 "GOT32_symbol_operand"))))
+ 	 (match_operand 2))]
+-  "!TARGET_MACHO && !TARGET_64BIT && SIBLING_CALL_P (insn)"
++  "!TARGET_MACHO
++  && !TARGET_64BIT
++  && !TARGET_INDIRECT_BRANCH_REGISTER
++  && SIBLING_CALL_P (insn)"
+ {
+   rtx fnaddr = gen_rtx_PLUS (Pmode, operands[0], operands[1]);
+   fnaddr = gen_const_mem (Pmode, fnaddr);
+@@ -12048,7 +12051,7 @@
+   [(call (mem:QI (match_operand:W 0 "memory_operand" "m"))
+ 	 (match_operand 1))
+    (unspec [(const_int 0)] UNSPEC_PEEPSIB)]
+-  "!TARGET_X32 && !ix86_indirect_branch_register"
++  "!TARGET_X32 && !TARGET_INDIRECT_BRANCH_REGISTER"
+   "* return ix86_output_call_insn (insn, operands[0]);"
+   [(set_attr "type" "call")])
+ 
+@@ -12058,7 +12061,7 @@
+    (call (mem:QI (match_dup 0))
+ 	 (match_operand 3))]
+   "!TARGET_X32
+-   && !ix86_indirect_branch_register
++   && !TARGET_INDIRECT_BRANCH_REGISTER
+    && SIBLING_CALL_P (peep2_next_insn (1))
+    && !reg_mentioned_p (operands[0],
+ 			CALL_INSN_FUNCTION_USAGE (peep2_next_insn (1)))"
+@@ -12073,7 +12076,7 @@
+    (call (mem:QI (match_dup 0))
+ 	 (match_operand 3))]
+   "!TARGET_X32
+-   && !ix86_indirect_branch_register
++   && !TARGET_INDIRECT_BRANCH_REGISTER
+    && SIBLING_CALL_P (peep2_next_insn (2))
+    && !reg_mentioned_p (operands[0],
+ 			CALL_INSN_FUNCTION_USAGE (peep2_next_insn (2)))"
+@@ -12171,7 +12174,7 @@
+         (match_operand:W 1 "memory_operand"))
+    (set (pc) (match_dup 0))]
+   "!TARGET_X32
+-   && !ix86_indirect_branch_register
++   && !TARGET_INDIRECT_BRANCH_REGISTER
+    && peep2_reg_dead_p (2, operands[0])"
+   [(set (pc) (match_dup 1))])
+ 
+@@ -12229,7 +12232,10 @@
+ 			  (match_operand:SI 1 "register_no_elim_operand" "U")
+ 			  (match_operand:SI 2 "GOT32_symbol_operand"))))
+ 	 (match_operand 3)))]
+-  "!TARGET_MACHO && !TARGET_64BIT && SIBLING_CALL_P (insn)"
++  "!TARGET_MACHO
++   && !TARGET_64BIT
++   && !TARGET_INDIRECT_BRANCH_REGISTER
++   && SIBLING_CALL_P (insn)"
+ {
+   rtx fnaddr = gen_rtx_PLUS (Pmode, operands[1], operands[2]);
+   fnaddr = gen_const_mem (Pmode, fnaddr);
+@@ -12250,7 +12256,7 @@
+  	(call (mem:QI (match_operand:W 1 "memory_operand" "m"))
+ 	      (match_operand 2)))
+    (unspec [(const_int 0)] UNSPEC_PEEPSIB)]
+-  "!TARGET_X32 && !ix86_indirect_branch_register"
++  "!TARGET_X32 && !TARGET_INDIRECT_BRANCH_REGISTER"
+   "* return ix86_output_call_insn (insn, operands[1]);"
+   [(set_attr "type" "callv")])
+ 
+@@ -12261,7 +12267,7 @@
+    (call (mem:QI (match_dup 0))
+ 		 (match_operand 3)))]
+   "!TARGET_X32
+-   && !ix86_indirect_branch_register
++   && !TARGET_INDIRECT_BRANCH_REGISTER
+    && SIBLING_CALL_P (peep2_next_insn (1))
+    && !reg_mentioned_p (operands[0],
+ 			CALL_INSN_FUNCTION_USAGE (peep2_next_insn (1)))"
+@@ -12278,7 +12284,7 @@
+ 	(call (mem:QI (match_dup 0))
+ 	      (match_operand 3)))]
+   "!TARGET_X32
+-   && !ix86_indirect_branch_register
++   && !TARGET_INDIRECT_BRANCH_REGISTER
+    && SIBLING_CALL_P (peep2_next_insn (2))
+    && !reg_mentioned_p (operands[0],
+ 			CALL_INSN_FUNCTION_USAGE (peep2_next_insn (2)))"
+diff --git a/gcc/config/i386/predicates.md b/gcc/config/i386/predicates.md
+index d1f0a7d..5f8a98f 100644
+--- a/gcc/config/i386/predicates.md
++++ b/gcc/config/i386/predicates.md
+@@ -593,7 +593,7 @@
+ ;; Test for a valid operand for indirect branch.
+ (define_predicate "indirect_branch_operand"
+   (ior (match_operand 0 "register_operand")
+-       (and (not (match_test "ix86_indirect_branch_register"))
++       (and (not (match_test "TARGET_INDIRECT_BRANCH_REGISTER"))
+ 	    (not (match_test "TARGET_X32"))
+ 	    (match_operand 0 "memory_operand"))))
+ 
+@@ -637,7 +637,7 @@
+   (ior (match_test "constant_call_address_operand
+ 		     (op, mode == VOIDmode ? mode : Pmode)")
+        (match_operand 0 "call_register_no_elim_operand")
+-       (and (not (match_test "ix86_indirect_branch_register"))
++       (and (not (match_test "TARGET_INDIRECT_BRANCH_REGISTER"))
+ 	    (ior (and (not (match_test "TARGET_X32"))
+ 		      (match_operand 0 "memory_operand"))
+ 		 (and (match_test "TARGET_X32 && Pmode == DImode")
+@@ -648,7 +648,7 @@
+   (ior (match_test "constant_call_address_operand
+ 		     (op, mode == VOIDmode ? mode : Pmode)")
+        (match_operand 0 "register_no_elim_operand")
+-       (and (not (match_test "ix86_indirect_branch_register"))
++       (and (not (match_test "TARGET_INDIRECT_BRANCH_REGISTER"))
+ 	    (ior (and (not (match_test "TARGET_X32"))
+ 		      (match_operand 0 "sibcall_memory_operand"))
+ 		 (and (match_test "TARGET_X32 && Pmode == DImode")
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-1.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-1.c
+index 60d0988..6e94d2c 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-1.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-1.c
+@@ -11,9 +11,8 @@ male_indirect_jump (long offset)
+   dispatch(offset);
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { { ! x32 } && *-*-linux* } } } } */
+-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
+-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target x32 } } } */
++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?dispatch" { target *-*-linux* } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)ax" } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler {\tpause} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-2.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-2.c
+index aac7516..3c46707 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-2.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-2.c
+@@ -11,9 +11,8 @@ male_indirect_jump (long offset)
+   dispatch[offset](offset);
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { { ! x32 } && *-*-linux* } } } } */
+-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
+-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target x32 } } } */
++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?dispatch" { target *-*-linux* } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)ax" } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler {\tpause} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-3.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-3.c
+index 9e24a38..2c7fb52 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-3.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-3.c
+@@ -12,9 +12,8 @@ male_indirect_jump (long offset)
+   return 0;
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { { ! x32 } && *-*-linux* } } } } */
+-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
+-/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target x32 } } } */
++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?dispatch" { target *-*-linux* } } } */
++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e)ax" } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler {\tpause} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-4.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-4.c
+index 127b5d9..0d3f895 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-4.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-4.c
+@@ -12,9 +12,8 @@ male_indirect_jump (long offset)
+   return 0;
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { { ! x32 } && *-*-linux* } } } } */
+-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
+-/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target x32 } } } */
++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?dispatch" { target *-*-linux* } } } */
++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e)ax" } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler {\tpause} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-5.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-5.c
+index fcaa18d..fb26c00 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-5.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-5.c
+@@ -9,8 +9,10 @@ foo (void)
+   bar ();
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" } } */
+-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" } } */
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" { target x32 } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target x32 } } } */
++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*bar@GOT" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target { ! x32 } } } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler {\tpause} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-6.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-6.c
+index e464928..aa03fbd 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-6.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-6.c
+@@ -10,9 +10,13 @@ foo (void)
+   return 0;
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" } } */
+-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" } } */
+-/* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 2 } } */
+-/* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 2 } } */
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" { target x32 } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target x32 } } } */
++/* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 2 { target x32 } } } */
++/* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 2 { target x32 } } } */
++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*bar@GOT" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 1 { target { ! x32 } } } } */
++/* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 1 { target { ! x32 } } } } */
+ /* { dg-final { scan-assembler {\tpause} } } */
+ /* { dg-final { scan-assembler {\tlfence} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-7.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-7.c
+index 17c2d0f..3c72036 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-7.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-7.c
+@@ -35,9 +35,8 @@ bar (int i)
+     }
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%" { target { { ! x32 } && *-*-linux* } } } } */
+-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
+-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target x32 } } } */
++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%" { target *-*-linux* } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)ax" } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler {\tpause} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-1.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-1.c
+index 9194ccf..7106407 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-1.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-1.c
+@@ -14,9 +14,8 @@ male_indirect_jump (long offset)
+   dispatch(offset);
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { { ! x32 } && *-*-linux* } } } } */
+-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
+-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target x32 } } } */
++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?dispatch" { target *-*-linux* } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)ax" } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler {\tpause} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-2.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-2.c
+index e51f261..27c7e5b 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-2.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-2.c
+@@ -12,9 +12,8 @@ male_indirect_jump (long offset)
+   dispatch[offset](offset);
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { { ! x32 } && *-*-linux* } } } } */
+-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
+-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target x32 } } } */
++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?dispatch" { target *-*-linux* } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)ax" } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler {\tpause} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-3.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-3.c
+index 4aeec18..89a2bac 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-3.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-3.c
+@@ -14,10 +14,9 @@ male_indirect_jump (long offset)
+   return 0;
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { { ! x32 } && *-*-linux* } } } } */
++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?dispatch" { target *-*-linux* } } } */
+ /* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 2 } } */
+ /* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 2 } } */
+ /* { dg-final { scan-assembler {\tpause} } } */
+ /* { dg-final { scan-assembler {\tlfence} } } */
+ /* { dg-final { scan-assembler-not "__x86_indirect_thunk" } } */
+-/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-4.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-4.c
+index ac0e599..3eb83c3 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-4.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-4.c
+@@ -13,10 +13,9 @@ male_indirect_jump (long offset)
+   return 0;
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { { ! x32 } && *-*-linux* } } } } */
++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?dispatch" { target *-*-linux* } } } */
+ /* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 2 } } */
+ /* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 2 } } */
+ /* { dg-final { scan-assembler {\tpause} } } */
+ /* { dg-final { scan-assembler {\tlfence} } } */
+ /* { dg-final { scan-assembler-not "__x86_indirect_thunk" } } */
+-/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-5.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-5.c
+index 573cf1e..0098dd1 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-5.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-5.c
+@@ -14,9 +14,8 @@ male_indirect_jump (long offset)
+   return 0;
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { { ! x32 } && *-*-linux* } } } } */
+-/* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 1 { target { ! x32 } } } } */
+-/* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 1 { target { ! x32 } } } } */
+-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
+-/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target x32 } } } */
++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?dispatch" { target *-*-linux* } } } */
++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e)ax" } } */
+ /* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
++/* { dg-final { scan-assembler-not "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler-not "call\[ \t\]*\.LIND" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-6.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-6.c
+index b2b37fc..ece8de1 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-6.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-6.c
+@@ -13,9 +13,8 @@ male_indirect_jump (long offset)
+   return 0;
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { { ! x32 } && *-*-linux* } } } } */
+-/* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 1 { target { ! x32 } } } } */
+-/* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 1 { target { ! x32 } } } } */
+-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
+-/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target x32 } } } */
++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?dispatch" { target *-*-linux* } } } */
++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e)ax" } } */
+ /* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
++/* { dg-final { scan-assembler-not "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler-not "call\[ \t\]*\.LIND" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-7.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-7.c
+index 4a43e19..d53fc88 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-7.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-7.c
+@@ -36,9 +36,8 @@ bar (int i)
+     }
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%" { target { { ! x32 } && *-*-linux* } } } } */
+-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target x32 } } } */
+-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" } } */
++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%" { target *-*-linux* } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)ax" } } */
+ /* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
+ /* { dg-final { scan-assembler-not "jmp\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler-not "call\[ \t\]*\.LIND" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-1.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-1.c
+index ac84ab6..73d16ba 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-1.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-1.c
+@@ -10,9 +10,9 @@ foo (void)
+   dispatch (buf);
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { { ! x32 } && *-*-linux* } } } } */
+-/* { dg-final { scan-assembler "pushq\[ \t\]%rax" { target x32 } } } */
+-/* { dg-final { scan-assembler "bnd jmp\[ \t\]*__x86_indirect_thunk_bnd" } } */
++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?dispatch" { target *-*-linux* } } } */
++/* { dg-final { scan-assembler "bnd jmp\[ \t\]*__x86_indirect_thunk_bnd_rax" { target lp64 } } } */
++/* { dg-final { scan-assembler "bnd call\[ \t\]*__x86_indirect_thunk_bnd_eax" { target ia32 } } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler "bnd call\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler "bnd ret" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-2.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-2.c
+index ce655e8..856751a 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-2.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-2.c
+@@ -11,10 +11,8 @@ foo (void)
+   return 0;
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { { ! x32 } && *-*-linux* } } } } */
+-/* { dg-final { scan-assembler "pushq\[ \t\]%rax" { target x32 } } } */
+-/* { dg-final { scan-assembler "bnd jmp\[ \t\]*__x86_indirect_thunk_bnd" } } */
+-/* { dg-final { scan-assembler "bnd jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?dispatch" { target *-*-linux* } } } */
++/* { dg-final { scan-assembler "bnd call\[ \t\]*__x86_indirect_thunk_bnd_(r|e)ax" } } */
+ /* { dg-final { scan-assembler "bnd call\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler "bnd ret" } } */
+ /* { dg-final { scan-assembler {\tpause} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-3.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-3.c
+index d34485a..42312f6 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-3.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-3.c
+@@ -10,8 +10,9 @@ foo (void)
+   bar (buf);
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" } } */
+-/* { dg-final { scan-assembler "bnd jmp\[ \t\]*__x86_indirect_thunk_bnd" } } */
++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*bar@GOT" } } */
++/* { dg-final { scan-assembler "bnd jmp\[ \t\]*__x86_indirect_thunk_bnd_rax" { target lp64 } } } */
++/* { dg-final { scan-assembler "bnd call\[ \t\]*__x86_indirect_thunk_bnd_eax" { target ia32 } } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler "bnd call\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler "bnd ret" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-4.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-4.c
+index 0e19830..c8ca102 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-4.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-4.c
+@@ -11,10 +11,9 @@ foo (void)
+   return 0;
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" } } */
+-/* { dg-final { scan-assembler "bnd jmp\[ \t\]*__x86_indirect_thunk" } } */
+-/* { dg-final { scan-assembler "bnd jmp\[ \t\]*\.LIND" } } */
+-/* { dg-final { scan-assembler-times "bnd call\[ \t\]*\.LIND" 2 } } */
++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*bar@GOT" } } */
++/* { dg-final { scan-assembler "bnd call\[ \t\]*__x86_indirect_thunk_bnd_(r|e)ax" } } */
++/* { dg-final { scan-assembler-times "bnd call\[ \t\]*\.LIND" 1 } } */
+ /* { dg-final { scan-assembler "bnd ret" } } */
+ /* { dg-final { scan-assembler {\tpause} } } */
+ /* { dg-final { scan-assembler {\tlfence} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-1.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-1.c
+index 579441f..c09dd0a 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-1.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-1.c
+@@ -11,9 +11,8 @@ male_indirect_jump (long offset)
+   dispatch(offset);
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { { ! x32 } && *-*-linux* } } } } */
+-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
+-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target x32 } } } */
++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?dispatch" { target *-*-linux* } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)ax" } } */
+ /* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
+ /* { dg-final { scan-assembler-not "jmp\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler-not "call\[ \t\]*\.LIND" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-2.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-2.c
+index c92e6f2..826425a 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-2.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-2.c
+@@ -11,9 +11,8 @@ male_indirect_jump (long offset)
+   dispatch[offset](offset);
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { { ! x32 } && *-*-linux* } } } } */
+-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
+-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target x32 } } } */
++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?dispatch" { target *-*-linux* } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)ax" } } */
+ /* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
+ /* { dg-final { scan-assembler-not "jmp\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler-not "call\[ \t\]*\.LIND" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-3.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-3.c
+index d9964c2..3856268 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-3.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-3.c
+@@ -12,9 +12,8 @@ male_indirect_jump (long offset)
+   return 0;
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { { ! x32 } && *-*-linux* } } } } */
+-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
+-/* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 1 { target { ! x32 } } } } */
+-/* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 1 { target { ! x32 } } } } */
+-/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target x32 } } } */
++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?dispatch" { target *-*-linux* } } } */
++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e)ax" } } */
+ /* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
++/* { dg-final { scan-assembler-not "jmp\[ \t\]*\.LIND" } } */
++/* { dg-final { scan-assembler-not "call\[ \t\]*\.LIND" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-4.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-4.c
+index d4dca4d..1ae49b1 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-4.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-4.c
+@@ -12,9 +12,7 @@ male_indirect_jump (long offset)
+   return 0;
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { { ! x32 } && *-*-linux* } } } } */
+-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
+-/* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 1 { target { ! x32 } } } } */
+-/* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 1 { target { ! x32 } } } } */
+ /* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target x32 } } } */
++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?dispatch" { target *-*-linux* } } } */
++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e)ax" } } */
+ /* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-5.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-5.c
+index 5c07e02..5328239 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-5.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-5.c
+@@ -9,8 +9,10 @@ foo (void)
+   bar ();
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" } } */
+-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" } } */
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" { target x32 } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target x32 } } } */
++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*bar@GOT" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target { ! x32 } } } } */
+ /* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
+ /* { dg-final { scan-assembler-not "jmp\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler-not "call\[ \t\]*\.LIND" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-6.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-6.c
+index 3eb4406..8ae4348 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-6.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-6.c
+@@ -10,8 +10,8 @@ foo (void)
+   return 0;
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" } } */
+-/* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 1 } } */
+-/* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 1 } } */
+-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" } } */
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" { target x32 } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target x32 } } } */
++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*bar@GOT" { target { ! x32 } } } } */
++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target { ! x32 } } } } */
+ /* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-7.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-7.c
+index aece938..2b9a33e 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-7.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-7.c
+@@ -35,9 +35,8 @@ bar (int i)
+     }
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%" { target { { ! x32 } && *-*-linux* } } } } */
+-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
+-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target x32 } } } */
++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%" { target *-*-linux* } } } */
++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)ax" } } */
+ /* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
+ /* { dg-final { scan-assembler-not "jmp\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler-not "call\[ \t\]*\.LIND" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-1.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-1.c
+index 3aba5e8..869d904 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-1.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-1.c
+@@ -11,7 +11,7 @@ male_indirect_jump (long offset)
+   dispatch(offset);
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { { ! x32 } && *-*-linux* } } } } */
++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?dispatch" { target *-*-linux* } } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler {\tpause} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-2.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-2.c
+index 0f0181d..c5c16ed 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-2.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-2.c
+@@ -11,7 +11,7 @@ male_indirect_jump (long offset)
+   dispatch[offset](offset);
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { { ! x32 } && *-*-linux* } } } } */
++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?dispatch" { target *-*-linux* } } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler {\tpause} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-3.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-3.c
+index 2eef6f3..4a63ebe 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-3.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-3.c
+@@ -12,7 +12,7 @@ male_indirect_jump (long offset)
+   return 0;
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { { ! x32 } && *-*-linux* } } } } */
++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?dispatch" { target *-*-linux* } } } */
+ /* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 2 } } */
+ /* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 2 } } */
+ /* { dg-final { scan-assembler-times {\tpause} 1 } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-4.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-4.c
+index e825a10..a395ffc 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-4.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-4.c
+@@ -12,7 +12,7 @@ male_indirect_jump (long offset)
+   return 0;
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" { target { { ! x32 } && *-*-linux* } } } } */
++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?dispatch" { target *-*-linux* } } } */
+ /* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 2 } } */
+ /* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 2 } } */
+ /* { dg-final { scan-assembler-times {\tpause} 1 } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-5.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-5.c
+index c6d77e1..21cbfd3 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-5.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-5.c
+@@ -9,7 +9,8 @@ foo (void)
+   bar ();
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" } } */
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" { target x32 } } } */
++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*bar@GOT" { target { ! x32 } } } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler {\tpause} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-6.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-6.c
+index 6454827..d1300f1 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-6.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-6.c
+@@ -10,7 +10,8 @@ foo (void)
+   return 0;
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" } } */
++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" { target x32 } } } */
++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*bar@GOT" { target { ! x32 } } } } */
+ /* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 2 } } */
+ /* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 2 } } */
+ /* { dg-final { scan-assembler-times {\tpause} 1 } } */
+diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-7.c b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-7.c
+index c67066c..ea00924 100644
+--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-7.c
++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-7.c
+@@ -35,8 +35,8 @@ bar (int i)
+     }
+ }
+ 
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%" { target { { ! x32 } && *-*-linux* } } } } */
+-/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } } } */
++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%" { target *-*-linux* } } } */
++/* { dg-final { scan-assembler-not "pushq\[ \t\]%(r|e)ax" } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler {\tpause} } } */
+diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-10.c b/gcc/testsuite/gcc.target/i386/ret-thunk-10.c
+index e6fea84..af9023a 100644
+--- a/gcc/testsuite/gcc.target/i386/ret-thunk-10.c
++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-10.c
+@@ -15,9 +15,6 @@ foo (void)
+ /* { dg-final { scan-assembler-not "jmp\[ \t\]*__x86_return_thunk" } } */
+ /* { dg-final { scan-assembler-times {\tpause} 2 } } */
+ /* { dg-final { scan-assembler-times {\tlfence} 2 } } */
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?bar" { target { { ! x32 } && *-*-linux* } } } } */
+-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } }  } } */
+-/* { dg-final { scan-assembler "__x86_indirect_thunk:" { target { ! x32 } }  } } */
+-/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target { x32 } }  } } */
+-/* { dg-final { scan-assembler "__x86_indirect_thunk_(r|e)ax:" { target { x32 } }  } } */
+-/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } } } */
++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e)ax" } } */
++/* { dg-final { scan-assembler "__x86_indirect_thunk_(r|e)ax:" } } */
++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-11.c b/gcc/testsuite/gcc.target/i386/ret-thunk-11.c
+index e239ec4..ba467c5 100644
+--- a/gcc/testsuite/gcc.target/i386/ret-thunk-11.c
++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-11.c
+@@ -15,9 +15,6 @@ foo (void)
+ /* { dg-final { scan-assembler-times {\tlfence} 1 } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?bar" { target { { ! x32 } && *-*-linux* } } } } */
+-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
+-/* { dg-final { scan-assembler "__x86_indirect_thunk:" { target { ! x32 } }  } } */
+-/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target { x32 } }  } } */
+-/* { dg-final { scan-assembler "__x86_indirect_thunk_(r|e)ax:" { target { x32 } }  } } */
+-/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } } } */
++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e)ax" } } */
++/* { dg-final { scan-assembler "__x86_indirect_thunk_(r|e)ax:" } } */
++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-12.c b/gcc/testsuite/gcc.target/i386/ret-thunk-12.c
+index fa31813..43e57ca 100644
+--- a/gcc/testsuite/gcc.target/i386/ret-thunk-12.c
++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-12.c
+@@ -15,8 +15,6 @@ foo (void)
+ /* { dg-final { scan-assembler-times {\tlfence} 1 } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
+-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
+-/* { dg-final { scan-assembler "__x86_indirect_thunk:" { target { ! x32 } }  } } */
+-/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target { x32 } }  } } */
+-/* { dg-final { scan-assembler "__x86_indirect_thunk_(r|e)ax:" { target { x32 } }  } } */
+-/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } } } */
++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e)ax" } } */
++/* { dg-final { scan-assembler "__x86_indirect_thunk_(r|e)ax:" } } */
++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-13.c b/gcc/testsuite/gcc.target/i386/ret-thunk-13.c
+index fd5b41f..55f156c 100644
+--- a/gcc/testsuite/gcc.target/i386/ret-thunk-13.c
++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-13.c
+@@ -14,9 +14,8 @@ foo (void)
+ /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_return_thunk" } } */
+ /* { dg-final { scan-assembler-times {\tpause} 2 } } */
+ /* { dg-final { scan-assembler-times {\tlfence} 2 } } */
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?bar" { target { { ! x32 } && *-*-linux* } } } } */
+ /* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 3 } } */
+ /* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 3 } } */
+ /* { dg-final { scan-assembler-not "jmp\[ \t\]*__x86_indirect_thunk" } } */
+-/* { dg-final { scan-assembler-not "call\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target { x32 } }  } } */
+-/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } } } */
++/* { dg-final { scan-assembler-not "call\[ \t\]*__x86_indirect_thunk_(r|e)ax" } } */
++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-14.c b/gcc/testsuite/gcc.target/i386/ret-thunk-14.c
+index d606373..1c79043 100644
+--- a/gcc/testsuite/gcc.target/i386/ret-thunk-14.c
++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-14.c
+@@ -16,7 +16,6 @@ foo (void)
+ /* { dg-final { scan-assembler-not "jmp\[ \t\]*__x86_return_thunk" } } */
+ /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?bar" { target { { ! x32 } && *-*-linux* } } } } */
+-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
+-/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target { x32 } }  } } */
+-/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } } } */
++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?bar" { target *-*-linux* } } } */
++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e)ax" } } */
++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-15.c b/gcc/testsuite/gcc.target/i386/ret-thunk-15.c
+index 75e45e2..58aba31 100644
+--- a/gcc/testsuite/gcc.target/i386/ret-thunk-15.c
++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-15.c
+@@ -16,7 +16,6 @@ foo (void)
+ /* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler-times {\tpause} 1 } } */
+ /* { dg-final { scan-assembler-times {\tlfence} 1 } } */
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?bar" { target { { ! x32 } && *-*-linux* } } } } */
+-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
+-/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target x32 } } } */
+-/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } } } */
++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?bar" { target *-*-linux* } } } */
++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e)ax" } } */
++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" } } */
+diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-9.c b/gcc/testsuite/gcc.target/i386/ret-thunk-9.c
+index d1db41c..d2df8b8 100644
+--- a/gcc/testsuite/gcc.target/i386/ret-thunk-9.c
++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-9.c
+@@ -14,11 +14,8 @@ foo (void)
+ /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
+ /* { dg-final { scan-assembler "__x86_indirect_thunk:" } } */
+-/* { dg-final { scan-assembler-times {\tpause} 1 { target { ! x32 } } } } */
+-/* { dg-final { scan-assembler-times {\tlfence} 1 { target { ! x32 } } } } */
+-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?bar" { target { { ! x32 } && *-*-linux* } } } } */
+-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" { target { ! x32 } } } } */
+-/* { dg-final { scan-assembler-times {\tpause} 2 { target { x32 } } } } */
+-/* { dg-final { scan-assembler-times {\tlfence} 2 { target { x32 } } } } */
+-/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e)ax" { target { x32 } } } } */
+-/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } } } */
++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?bar" { target *-*-linux* } } } */
++/* { dg-final { scan-assembler-times {\tpause} 2 } } */
++/* { dg-final { scan-assembler-times {\tlfence} 2 } } */
++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e)ax" } } */
++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" } } */
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/backport/0057-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch b/meta/recipes-devtools/gcc/gcc-6.4/backport/0057-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch
new file mode 100644
index 0000000..0214ab8
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.4/backport/0057-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch
@@ -0,0 +1,194 @@
+From ad5bf450aef2ffee6d57ed193fabc5f72f8eaa65 Mon Sep 17 00:00:00 2001
+From: rearnsha <rearnsha@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Thu, 19 Oct 2017 13:16:42 +0000
+Subject: [PATCH] [ARM] PR 82445 - suppress 32-bit aligned ldrd/strd peepholing
+ with -mno-unaligned-access
+
+Peephole patterns exist in the arm backend to spot load/store
+operations to adjacent memory operations in order to convert them into
+ldrd/strd instructions.  However, when we have strict alignment
+enforced, then we can only do this if the accesses are known to be
+64-bit aligned; this is unlikely to be the case for most loads.  The
+patch adds some alignment checking to the code that validates the
+addresses for use in the peephole patterns.  This should also fix
+incorrect generation of ldrd/strd with unaligned accesses that could
+previously have occurred on ARMv5e where all such operations must be
+64-bit aligned.
+
+I've added some new tests as well.  In doing so I discovered that the
+ldrd/strd peephole tests could never fail since they would match the
+source file name in the scanned assembly as well as any instructions
+of the intended type.  I've fixed those by tightening the scan results
+slightly.
+
+gcc:
+
+* config/arm/arm.c (align_ok_ldrd_strd): New function.
+(mem_ok_for_ldrd_strd): New parameter align.  Extract the alignment of the
+mem into it.
+(gen_operands_ldrd_strd): Validate the alignment of the accesses.
+
+testsuite:
+
+* gcc.target/arm/peep-ldrd-1.c: Tighten test scan pattern.
+* gcc.target/arm/peep-strd-1.c: Likewise.
+* gcc.target/arm/peep-ldrd-2.c: New test.
+* gcc.target/arm/peep-strd-2.c: New test.
+
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-6-branch@253892 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ gcc/ChangeLog                                      |  8 +++++++
+ gcc/config/arm/arm.c                               | 27 ++++++++++++++++++----
+ gcc/testsuite/ChangeLog                            |  8 +++++++
+ gcc/testsuite/gcc.target/arm/peep-ldrd-1.c         |  2 +-
+ .../arm/{peep-ldrd-1.c => peep-ldrd-2.c}           |  4 ++--
+ gcc/testsuite/gcc.target/arm/peep-strd-1.c         |  2 +-
+ .../arm/{peep-strd-1.c => peep-strd-2.c}           |  4 ++--
+ 7 files changed, 44 insertions(+), 11 deletions(-)
+ copy gcc/testsuite/gcc.target/arm/{peep-ldrd-1.c => peep-ldrd-2.c} (63%)
+ copy gcc/testsuite/gcc.target/arm/{peep-strd-1.c => peep-strd-2.c} (58%)
+
+diff --git a/gcc/config/arm/arm.c b/gcc/config/arm/arm.c
+index 9c0813d598d..e3da9f77fb6 100644
+--- a/gcc/config/arm/arm.c
++++ b/gcc/config/arm/arm.c
+@@ -15926,12 +15926,23 @@ operands_ok_ldrd_strd (rtx rt, rtx rt2, rtx rn, HOST_WIDE_INT offset,
+   return true;
+ }
+ 
++/* Return true if a 64-bit access with alignment ALIGN and with a
++   constant offset OFFSET from the base pointer is permitted on this
++   architecture.  */
++static bool
++align_ok_ldrd_strd (HOST_WIDE_INT align, HOST_WIDE_INT offset)
++{
++  return (unaligned_access
++	  ? (align >= BITS_PER_WORD && (offset & 3) == 0)
++	  : (align >= 2 * BITS_PER_WORD && (offset & 7) == 0));
++}
++
+ /* Helper for gen_operands_ldrd_strd.  Returns true iff the memory
+    operand MEM's address contains an immediate offset from the base
+-   register and has no side effects, in which case it sets BASE and
+-   OFFSET accordingly.  */
++   register and has no side effects, in which case it sets BASE,
++   OFFSET and ALIGN accordingly.  */
+ static bool
+-mem_ok_for_ldrd_strd (rtx mem, rtx *base, rtx *offset)
++mem_ok_for_ldrd_strd (rtx mem, rtx *base, rtx *offset, HOST_WIDE_INT *align)
+ {
+   rtx addr;
+ 
+@@ -15950,6 +15961,7 @@ mem_ok_for_ldrd_strd (rtx mem, rtx *base, rtx *offset)
+   gcc_assert (MEM_P (mem));
+ 
+   *offset = const0_rtx;
++  *align = MEM_ALIGN (mem);
+ 
+   addr = XEXP (mem, 0);
+ 
+@@ -15990,7 +16002,7 @@ gen_operands_ldrd_strd (rtx *operands, bool load,
+                         bool const_store, bool commute)
+ {
+   int nops = 2;
+-  HOST_WIDE_INT offsets[2], offset;
++  HOST_WIDE_INT offsets[2], offset, align[2];
+   rtx base = NULL_RTX;
+   rtx cur_base, cur_offset, tmp;
+   int i, gap;
+@@ -16002,7 +16014,8 @@ gen_operands_ldrd_strd (rtx *operands, bool load,
+      registers, and the corresponding memory offsets.  */
+   for (i = 0; i < nops; i++)
+     {
+-      if (!mem_ok_for_ldrd_strd (operands[nops+i], &cur_base, &cur_offset))
++      if (!mem_ok_for_ldrd_strd (operands[nops+i], &cur_base, &cur_offset,
++				 &align[i]))
+         return false;
+ 
+       if (i == 0)
+@@ -16114,6 +16127,7 @@ gen_operands_ldrd_strd (rtx *operands, bool load,
+       /* Swap the instructions such that lower memory is accessed first.  */
+       std::swap (operands[0], operands[1]);
+       std::swap (operands[2], operands[3]);
++      std::swap (align[0], align[1]);
+       if (const_store)
+         std::swap (operands[4], operands[5]);
+     }
+@@ -16127,6 +16141,9 @@ gen_operands_ldrd_strd (rtx *operands, bool load,
+   if (gap != 4)
+     return false;
+ 
++  if (!align_ok_ldrd_strd (align[0], offset))
++    return false;
++
+   /* Make sure we generate legal instructions.  */
+   if (operands_ok_ldrd_strd (operands[0], operands[1], base, offset,
+                              false, load))
+diff --git a/gcc/testsuite/gcc.target/arm/peep-ldrd-1.c b/gcc/testsuite/gcc.target/arm/peep-ldrd-1.c
+index eb2b86ee7b6..d49eff6b87e 100644
+--- a/gcc/testsuite/gcc.target/arm/peep-ldrd-1.c
++++ b/gcc/testsuite/gcc.target/arm/peep-ldrd-1.c
+@@ -8,4 +8,4 @@ int foo(int a, int b, int* p, int *q)
+   *p = a;
+   return a;
+ }
+-/* { dg-final { scan-assembler "ldrd" } } */
++/* { dg-final { scan-assembler "ldrd\\t" } } */
+diff --git a/gcc/testsuite/gcc.target/arm/peep-ldrd-1.c b/gcc/testsuite/gcc.target/arm/peep-ldrd-2.c
+similarity index 63%
+copy from gcc/testsuite/gcc.target/arm/peep-ldrd-1.c
+copy to gcc/testsuite/gcc.target/arm/peep-ldrd-2.c
+index eb2b86ee7b6..6822c2b1454 100644
+--- a/gcc/testsuite/gcc.target/arm/peep-ldrd-1.c
++++ b/gcc/testsuite/gcc.target/arm/peep-ldrd-2.c
+@@ -1,6 +1,6 @@
+ /* { dg-do compile } */
+ /* { dg-require-effective-target arm_prefer_ldrd_strd } */
+-/* { dg-options "-O2" }  */
++/* { dg-options "-O2 -mno-unaligned-access" }  */
+ int foo(int a, int b, int* p, int *q)
+ {
+   a = p[2] + p[3];
+@@ -8,4 +8,4 @@ int foo(int a, int b, int* p, int *q)
+   *p = a;
+   return a;
+ }
+-/* { dg-final { scan-assembler "ldrd" } } */
++/* { dg-final { scan-assembler-not "ldrd\\t" } } */
+diff --git a/gcc/testsuite/gcc.target/arm/peep-strd-1.c b/gcc/testsuite/gcc.target/arm/peep-strd-1.c
+index bd330769599..fe1beac7229 100644
+--- a/gcc/testsuite/gcc.target/arm/peep-strd-1.c
++++ b/gcc/testsuite/gcc.target/arm/peep-strd-1.c
+@@ -6,4 +6,4 @@ void foo(int a, int b, int* p)
+   p[2] = a;
+   p[3] = b;
+ }
+-/* { dg-final { scan-assembler "strd" } } */
++/* { dg-final { scan-assembler "strd\\t" } } */
+diff --git a/gcc/testsuite/gcc.target/arm/peep-strd-1.c b/gcc/testsuite/gcc.target/arm/peep-strd-2.c
+similarity index 58%
+copy from gcc/testsuite/gcc.target/arm/peep-strd-1.c
+copy to gcc/testsuite/gcc.target/arm/peep-strd-2.c
+index bd330769599..bfc5ebe9eec 100644
+--- a/gcc/testsuite/gcc.target/arm/peep-strd-1.c
++++ b/gcc/testsuite/gcc.target/arm/peep-strd-2.c
+@@ -1,9 +1,9 @@
+ /* { dg-do compile } */
+ /* { dg-require-effective-target arm_prefer_ldrd_strd } */
+-/* { dg-options "-O2" }  */
++/* { dg-options "-O2 -mno-unaligned-access" }  */
+ void foo(int a, int b, int* p)
+ {
+   p[2] = a;
+   p[3] = b;
+ }
+-/* { dg-final { scan-assembler "strd" } } */
++/* { dg-final { scan-assembler-not "strd\\t" } } */
+-- 
+2.15.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/backport/CVE-2016-6131.patch b/meta/recipes-devtools/gcc/gcc-6.4/backport/CVE-2016-6131.patch
new file mode 100644
index 0000000..3cdbb2d
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.4/backport/CVE-2016-6131.patch
@@ -0,0 +1,223 @@
+From 59a0e4bd8391962f62600ae3ac95ab0fba74d464 Mon Sep 17 00:00:00 2001
+From: law <law@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Thu, 4 Aug 2016 16:53:18 +0000
+Subject: [PATCH] Fix for PR71696 in Libiberty Demangler
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+[BZ #71696] -- https://gcc.gnu.org/bugzilla/show_bug.cgi?id=71696
+
+2016-08-04  Marcel Böhme  <boehme.marcel@gmail.com>
+
+	PR c++/71696
+	* cplus-dem.c: Prevent infinite recursion when there is a cycle
+	in the referencing of remembered mangled types.
+	(work_stuff): New stack to keep track of the remembered mangled
+	types that are currently being processed.
+	(push_processed_type): New method to push currently processed
+	remembered type onto the stack.
+	(pop_processed_type): New method to pop currently processed
+	remembered type from the stack.
+	(work_stuff_copy_to_from): Copy values of new variables.
+	(delete_non_B_K_work_stuff): Free stack memory.
+	(demangle_args): Push/Pop currently processed remembered type.
+	(do_type): Do not demangle a cyclic reference and push/pop
+	referenced remembered type.
+
+cherry-picked from commit of
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@239143 138bc75d-0d04-0410-961f-82ee72b054a4
+
+Upstream-Status: Backport [master]
+CVE: CVE-2016-6131
+Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
+---
+ libiberty/ChangeLog                   | 17 ++++++++
+ libiberty/cplus-dem.c                 | 78 ++++++++++++++++++++++++++++++++---
+ libiberty/testsuite/demangle-expected | 18 ++++++++
+ 3 files changed, 108 insertions(+), 5 deletions(-)
+
+Index: gcc-6.4.0/libiberty/cplus-dem.c
+===================================================================
+--- gcc-6.4.0.orig/libiberty/cplus-dem.c
++++ gcc-6.4.0/libiberty/cplus-dem.c
+@@ -144,6 +144,9 @@ struct work_stuff
+   string* previous_argument; /* The last function argument demangled.  */
+   int nrepeats;         /* The number of times to repeat the previous
+ 			   argument.  */
++  int *proctypevec;     /* Indices of currently processed remembered typevecs.  */
++  int proctypevec_size;
++  int nproctypes;
+ };
+ 
+ #define PRINT_ANSI_QUALIFIERS (work -> options & DMGL_ANSI)
+@@ -435,6 +438,10 @@ iterate_demangle_function (struct work_s
+ 
+ static void remember_type (struct work_stuff *, const char *, int);
+ 
++static void push_processed_type (struct work_stuff *, int);
++
++static void pop_processed_type (struct work_stuff *);
++
+ static void remember_Btype (struct work_stuff *, const char *, int, int);
+ 
+ static int register_Btype (struct work_stuff *);
+@@ -1301,6 +1308,10 @@ work_stuff_copy_to_from (struct work_stu
+       memcpy (to->btypevec[i], from->btypevec[i], len);
+     }
+ 
++  if (from->proctypevec)
++    to->proctypevec =
++      XDUPVEC (int, from->proctypevec, from->proctypevec_size);
++
+   if (from->ntmpl_args)
+     to->tmpl_argvec = XNEWVEC (char *, from->ntmpl_args);
+ 
+@@ -1329,11 +1340,17 @@ delete_non_B_K_work_stuff (struct work_s
+   /* Discard the remembered types, if any.  */
+ 
+   forget_types (work);
+-  if (work -> typevec != NULL)
++  if (work->typevec != NULL)
+     {
+-      free ((char *) work -> typevec);
+-      work -> typevec = NULL;
+-      work -> typevec_size = 0;
++      free ((char *) work->typevec);
++      work->typevec = NULL;
++      work->typevec_size = 0;
++    }
++  if (work->proctypevec != NULL)
++    {
++      free (work->proctypevec);
++      work->proctypevec = NULL;
++      work->proctypevec_size = 0;
+     }
+   if (work->tmpl_argvec)
+     {
+@@ -3552,6 +3569,8 @@ static int
+ do_type (struct work_stuff *work, const char **mangled, string *result)
+ {
+   int n;
++  int i;
++  int is_proctypevec;
+   int done;
+   int success;
+   string decl;
+@@ -3564,6 +3583,7 @@ do_type (struct work_stuff *work, const
+ 
+   done = 0;
+   success = 1;
++  is_proctypevec = 0;
+   while (success && !done)
+     {
+       int member;
+@@ -3616,8 +3636,15 @@ do_type (struct work_stuff *work, const
+ 	      success = 0;
+ 	    }
+ 	  else
++	    for (i = 0; i < work->nproctypes; i++)
++	      if (work -> proctypevec [i] == n)
++	        success = 0;
++
++	  if (success)
+ 	    {
+-	      remembered_type = work -> typevec[n];
++	      is_proctypevec = 1;
++	      push_processed_type (work, n);
++	      remembered_type = work->typevec[n];
+ 	      mangled = &remembered_type;
+ 	    }
+ 	  break;
+@@ -3840,6 +3867,9 @@ do_type (struct work_stuff *work, const
+     string_delete (result);
+   string_delete (&decl);
+ 
++  if (is_proctypevec)
++    pop_processed_type (work);
++
+   if (success)
+     /* Assume an integral type, if we're not sure.  */
+     return (int) ((tk == tk_none) ? tk_integral : tk);
+@@ -4252,6 +4282,41 @@ do_arg (struct work_stuff *work, const c
+ }
+ 
+ static void
++push_processed_type (struct work_stuff *work, int typevec_index)
++{
++  if (work->nproctypes >= work->proctypevec_size)
++    {
++      if (!work->proctypevec_size)
++	{
++	  work->proctypevec_size = 4;
++	  work->proctypevec = XNEWVEC (int, work->proctypevec_size);
++	}
++      else
++	{
++	  if (work->proctypevec_size < 16)
++	    /* Double when small.  */
++	    work->proctypevec_size *= 2;
++	  else
++	    {
++	      /* Grow slower when large.  */
++	      if (work->proctypevec_size > (INT_MAX / 3) * 2)
++                xmalloc_failed (INT_MAX);
++              work->proctypevec_size = (work->proctypevec_size * 3 / 2);
++	    }
++          work->proctypevec
++            = XRESIZEVEC (int, work->proctypevec, work->proctypevec_size);
++	}
++    }
++    work->proctypevec [work->nproctypes++] = typevec_index;
++}
++
++static void
++pop_processed_type (struct work_stuff *work)
++{
++  work->nproctypes--;
++}
++
++static void
+ remember_type (struct work_stuff *work, const char *start, int len)
+ {
+   char *tem;
+@@ -4515,10 +4580,13 @@ demangle_args (struct work_stuff *work,
+ 		{
+ 		  string_append (declp, ", ");
+ 		}
++	      push_processed_type (work, t);
+ 	      if (!do_arg (work, &tem, &arg))
+ 		{
++		  pop_processed_type (work);
+ 		  return (0);
+ 		}
++	      pop_processed_type (work);
+ 	      if (PRINT_ARG_TYPES)
+ 		{
+ 		  string_appends (declp, &arg);
+Index: gcc-6.4.0/libiberty/testsuite/demangle-expected
+===================================================================
+--- gcc-6.4.0.orig/libiberty/testsuite/demangle-expected
++++ gcc-6.4.0/libiberty/testsuite/demangle-expected
+@@ -4491,3 +4491,21 @@ void eat<int*, Foo()::{lambda(auto:1*, a
+ 
+ _Z3eatIPiZ3BarIsEvvEUlPsPT_PT0_E0_EvRS3_RS5_
+ void eat<int*, void Bar<short>()::{lambda(short*, auto:1*, auto:2*)#2}>(int*&, void Bar<short>()::{lambda(short*, auto:1*, auto:2*)#2}&)
++#
++# Tests write access violation PR70926
++
++0__Ot2m02R5T0000500000
++0__Ot2m02R5T0000500000
++#
++
++0__GT50000000000_
++0__GT50000000000_
++#
++
++__t2m05B500000000000000000_
++__t2m05B500000000000000000_
++#
++# Tests stack overflow PR71696
++
++__10%0__S4_0T0T0
++%0<>::%0(%0<>)
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_6.2.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_6.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_6.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_6.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial_6.2.bb b/meta/recipes-devtools/gcc/gcc-cross-initial_6.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-initial_6.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross-initial_6.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_6.2.bb b/meta/recipes-devtools/gcc/gcc-cross_6.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_6.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross_6.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_6.2.bb b/meta/recipes-devtools/gcc/gcc-crosssdk-initial_6.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk-initial_6.2.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk-initial_6.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_6.2.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_6.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_6.2.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_6.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_6.2.bb b/meta/recipes-devtools/gcc/gcc-runtime_6.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_6.2.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_6.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_6.2.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_6.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_6.2.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_6.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_6.2.bb b/meta/recipes-devtools/gcc/gcc-source_6.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_6.2.bb
rename to meta/recipes-devtools/gcc/gcc-source_6.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc_6.2.bb b/meta/recipes-devtools/gcc/gcc_6.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_6.2.bb
rename to meta/recipes-devtools/gcc/gcc_6.4.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_6.2.bb b/meta/recipes-devtools/gcc/libgcc-initial_6.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_6.2.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_6.4.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_6.2.bb b/meta/recipes-devtools/gcc/libgcc_6.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_6.2.bb
rename to meta/recipes-devtools/gcc/libgcc_6.4.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_6.2.bb b/meta/recipes-devtools/gcc/libgfortran_6.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_6.2.bb
rename to meta/recipes-devtools/gcc/libgfortran_6.4.bb
-- 
2.7.4



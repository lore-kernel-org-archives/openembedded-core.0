Return-Path: <california.l.sullivan@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3FACC78947
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2018 00:24:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Mar 2018 17:25:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,463,1515484800"; d="scan'208";a="38202155"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga001.jf.intel.com with ESMTP; 12 Mar 2018 17:25:00 -0700
To: Martin Jansa <martin.jansa@gmail.com>, Armin Kuster
	<akuster808@gmail.com>, openembedded-core@lists.openembedded.org,
	"Bystricky, Juro" <juro.bystricky@intel.com>, Khem Raj <raj.khem@gmail.com>
References: <cover.1520728804.git.Martin.Jansa@gmail.com>
From: Cal Sullivan <california.l.sullivan@intel.com>
Message-ID: <b93c75f5-2618-5428-416b-cd518440da28@intel.com>
Date: Mon, 12 Mar 2018 17:25:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <cover.1520728804.git.Martin.Jansa@gmail.com>
Subject: Re: [rocko][PATCH 0/8] Backports for rocko
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
X-List-Received-Date: Tue, 13 Mar 2018 00:25:00 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Juro, Khem,

A rocko-next build including this patchset had a couple gcc-sanitizers 
do_compile failures:
https://autobuilder.yocto.io/builders/nightly-x86-64-lsb/builds/865/steps/BuildImages/logs/stdio
https://autobuilder.yocto.io/builders/nightly-no-x11/builds/853/steps/BuildImages/logs/stdio

At the time the only changes in rocko-next were this patchset and a 
patch to default gcc 6.x for testing.

If you could take a look it would be much appreciated.

Thanks,
Cal

On 03/10/2018 04:43 PM, Martin Jansa wrote:
> The following changes since commit cb7cf1d12377d3b9a1cc159b68fc1d841004e6dd:
>
>    glibc: Update to tip of 2.26 (2018-02-27 14:46:17 +0000)
>
> are available in the Git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib jansa/rocko-backports
>    http://cgit.openembedded.org/openembedded-core-contrib/log/?h=jansa/rocko-backports
>
> Andre McCurdy (1):
>    gcc6: enable FL_LPAE flag for armv7ve cores
>
> Juro Bystricky (1):
>    gcc6: Backport few more patches
>
> Khem Raj (5):
>    gcc-runtime: Disable libitm on riscv
>    gcc: Link libssp_nonshared.a only on musl targets
>    gcc: Fix libssh_nonshared linker specs for ppc/musl
>    gcc6: Upgrade to 6.4
>    gcc7/gcc6: Fix unaligned STRD issue on ARM
>
> Martin Jansa (1):
>    Revert "waf.bbclass: explicitly pass bindir and libdir if supported"
>
>   meta/classes/waf.bbclass                           |   17 +-
>   .../gcc/gcc-6.3/0041-ssp_nonshared.patch           |   28 -
>   .../gcc/gcc-6.3/ubsan-fix-check-empty-string.patch |   28 -
>   .../gcc/{gcc-6.3.inc => gcc-6.4.inc}               |   30 +-
>   .../0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch     |    0
>   .../0008-missing-execinfo_h.patch                  |    0
>   .../{gcc-6.3 => gcc-6.4}/0009-c99-snprintf.patch   |    0
>   .../0010-gcc-poison-system-directories.patch       |    0
>   .../0011-gcc-poison-dir-extend.patch               |    0
>   .../0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |    0
>   .../0013-64-bit-multilib-hack.patch                |    0
>   .../0014-optional-libstdc.patch                    |    0
>   ...0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |    0
>   .../0016-COLLECT_GCC_OPTIONS.patch                 |    0
>   ...efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch |    0
>   .../0018-fortran-cross-compile-hack.patch          |    0
>   .../0019-cpp-honor-sysroot.patch                   |    0
>   .../0020-MIPS64-Default-to-N64-ABI.patch           |    0
>   ...C_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |    0
>   ...0022-gcc-Fix-argument-list-too-long-error.patch |    0
>   .../{gcc-6.3 => gcc-6.4}/0023-Disable-sdt.patch    |    0
>   .../gcc/{gcc-6.3 => gcc-6.4}/0024-libtool.patch    |    0
>   ...4-pass-fix-v4bx-to-linker-to-support-EABI.patch |    0
>   ...tilib-config-files-from-B-instead-of-usin.patch |    0
>   ...-libdir-from-.la-which-usually-points-to-.patch |    0
>   .../gcc/{gcc-6.3 => gcc-6.4}/0028-export-CPP.patch |    0
>   ...AltiVec-generation-on-powepc-linux-target.patch |    0
>   ...-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch |    0
>   ...Ensure-target-gcc-headers-can-be-included.patch |    0
>   ...-t-build-with-disable-dependency-tracking.patch |    0
>   ...h-host-directory-during-relink-if-inst_pr.patch |    0
>   ...IBS_DIR-replacement-instead-of-hardcoding.patch |    0
>   .../0035-aarch64-Add-support-for-musl-ldso.patch   |    0
>   ...ibcc1-fix-libcc1-s-install-path-and-rpath.patch |    0
>   ...-handle-sysroot-support-for-nativesdk-gcc.patch |    0
>   ...et-sysroot-gcc-version-specific-dirs-with.patch |    0
>   ...-various-_FOR_BUILD-and-related-variables.patch |    0
>   .../0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch    |    0
>   ...shared-to-link-commandline-for-musl-targe.patch |   87 +
>   ...c-libcpp-support-ffile-prefix-map-old-new.patch |    0
>   ...ug-prefix-map-to-replace-ffile-prefix-map.patch |    0
>   ...-fdebug-prefix-map-support-to-remap-sourc.patch |    0
>   ...45-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch |    0
>   ...bgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |    0
>   ...e-alias-for-__cpu_indicator_init-instead-.patch |    0
>   .../0048-sync-gcc-stddef.h-with-musl.patch         |    0
>   .../0054_all_nopie-all-flags.patch                 |    0
>   .../0055-unwind_h-glibc26.patch                    |    0
>   ...-relax-the-restriction-on-subreg-reload-f.patch |    0
>   ...5-suppress-32-bit-aligned-ldrd-strd-peeph.patch |  194 ++
>   ...001-enable-FL_LPAE-flag-for-armv7ve-cores.patch |   67 +
>   ...ove-struct-ix86_frame-to-machine_function.patch |  247 +++
>   ...ference-of-struct-ix86_frame-to-avoid-cop.patch |   74 +
>   ...nst-reference-of-struct-ix86_frame-to-avo.patch |  131 ++
>   .../backport/0004-x86-Add-mindirect-branch.patch   | 2154 ++++++++++++++++++++
>   .../backport/0005-x86-Add-mfunction-return.patch   | 1570 ++++++++++++++
>   .../0006-x86-Add-mindirect-branch-register.patch   |  946 +++++++++
>   .../0007-x86-Add-V-register-operand-modifier.patch |  139 ++
>   ...w-mindirect-branch-mfunction-return-with-.patch |  304 +++
>   ...VALID_REGNUM-in-indirect-thunk-processing.patch |  126 ++
>   ...INVALID_REGNUM-as-invalid-register-number.patch |   46 +
>   ...date-mfunction-return-for-return-with-pop.patch |  453 ++++
>   ...-i386-Add-TARGET_INDIRECT_BRANCH_REGISTER.patch | 1004 +++++++++
>   .../backport}/CVE-2016-6131.patch                  |   62 +-
>   ...s-canadian_6.3.bb => gcc-cross-canadian_6.4.bb} |    0
>   ...oss-initial_6.3.bb => gcc-cross-initial_6.4.bb} |    0
>   .../gcc/{gcc-cross_6.3.bb => gcc-cross_6.4.bb}     |    0
>   ...-initial_6.3.bb => gcc-crosssdk-initial_6.4.bb} |    0
>   .../{gcc-crosssdk_6.3.bb => gcc-crosssdk_6.4.bb}   |    0
>   meta/recipes-devtools/gcc/gcc-runtime.inc          |    2 +
>   .../gcc/{gcc-runtime_6.3.bb => gcc-runtime_6.4.bb} |    0
>   ...gcc-sanitizers_6.3.bb => gcc-sanitizers_6.4.bb} |    0
>   .../gcc/{gcc-source_6.3.bb => gcc-source_6.4.bb}   |    0
>   .../gcc/{gcc_6.3.bb => gcc_6.4.bb}                 |    0
>   ...libgcc-initial_6.3.bb => libgcc-initial_6.4.bb} |    0
>   .../gcc/{libgcc_6.3.bb => libgcc_6.4.bb}           |    0
>   .../gcc/{libgfortran_6.3.bb => libgfortran_6.4.bb} |    0
>   77 files changed, 7584 insertions(+), 125 deletions(-)
>   delete mode 100644 meta/recipes-devtools/gcc/gcc-6.3/0041-ssp_nonshared.patch
>   delete mode 100644 meta/recipes-devtools/gcc/gcc-6.3/ubsan-fix-check-empty-string.patch
>   rename meta/recipes-devtools/gcc/{gcc-6.3.inc => gcc-6.4.inc} (77%)
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch (100%)
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0008-missing-execinfo_h.patch (100%)
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0009-c99-snprintf.patch (100%)
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0010-gcc-poison-system-directories.patch (100%)
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0011-gcc-poison-dir-extend.patch (100%)
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch (100%)
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0013-64-bit-multilib-hack.patch (100%)
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0014-optional-libstdc.patch (100%)
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch (100%)
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0016-COLLECT_GCC_OPTIONS.patch (100%)
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch (100%)
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0018-fortran-cross-compile-hack.patch (100%)
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0019-cpp-honor-sysroot.patch (100%)
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0020-MIPS64-Default-to-N64-ABI.patch (100%)
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0021-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch (100%)
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0022-gcc-Fix-argument-list-too-long-error.patch (100%)
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0023-Disable-sdt.patch (100%)
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0024-libtool.patch (100%)
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0025-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch (100%)
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0026-Use-the-multilib-config-files-from-B-instead-of-usin.patch (100%)
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0027-Avoid-using-libdir-from-.la-which-usually-points-to-.patch (100%)
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0028-export-CPP.patch (100%)
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0029-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch (100%)
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0030-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch (100%)
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0031-Ensure-target-gcc-headers-can-be-included.patch (100%)
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0032-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch (100%)
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0033-Don-t-search-host-directory-during-relink-if-inst_pr.patch (100%)
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0034-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch (100%)
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0035-aarch64-Add-support-for-musl-ldso.patch (100%)
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0036-libcc1-fix-libcc1-s-install-path-and-rpath.patch (100%)
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0037-handle-sysroot-support-for-nativesdk-gcc.patch (100%)
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0038-Search-target-sysroot-gcc-version-specific-dirs-with.patch (100%)
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0039-Fix-various-_FOR_BUILD-and-related-variables.patch (100%)
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch (100%)
>   create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0041-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0042-gcc-libcpp-support-ffile-prefix-map-old-new.patch (100%)
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0043-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch (100%)
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0044-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch (100%)
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch (100%)
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch (100%)
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch (100%)
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0048-sync-gcc-stddef.h-with-musl.patch (100%)
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0054_all_nopie-all-flags.patch (100%)
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0055-unwind_h-glibc26.patch (100%)
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0056-LRA-PR70904-relax-the-restriction-on-subreg-reload-f.patch (100%)
>   create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0057-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0001-enable-FL_LPAE-flag-for-armv7ve-cores.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0001-i386-Move-struct-ix86_frame-to-machine_function.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0002-i386-Use-reference-of-struct-ix86_frame-to-avoid-cop.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0003-i386-Use-const-reference-of-struct-ix86_frame-to-avo.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0004-x86-Add-mindirect-branch.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0005-x86-Add-mfunction-return.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0006-x86-Add-mindirect-branch-register.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0007-x86-Add-V-register-operand-modifier.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0008-x86-Disallow-mindirect-branch-mfunction-return-with-.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0009-Use-INVALID_REGNUM-in-indirect-thunk-processing.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0010-i386-Pass-INVALID_REGNUM-as-invalid-register-number.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0011-i386-Update-mfunction-return-for-return-with-pop.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0012-i386-Add-TARGET_INDIRECT_BRANCH_REGISTER.patch
>   rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4/backport}/CVE-2016-6131.patch (73%)
>   rename meta/recipes-devtools/gcc/{gcc-cross-canadian_6.3.bb => gcc-cross-canadian_6.4.bb} (100%)
>   rename meta/recipes-devtools/gcc/{gcc-cross-initial_6.3.bb => gcc-cross-initial_6.4.bb} (100%)
>   rename meta/recipes-devtools/gcc/{gcc-cross_6.3.bb => gcc-cross_6.4.bb} (100%)
>   rename meta/recipes-devtools/gcc/{gcc-crosssdk-initial_6.3.bb => gcc-crosssdk-initial_6.4.bb} (100%)
>   rename meta/recipes-devtools/gcc/{gcc-crosssdk_6.3.bb => gcc-crosssdk_6.4.bb} (100%)
>   rename meta/recipes-devtools/gcc/{gcc-runtime_6.3.bb => gcc-runtime_6.4.bb} (100%)
>   rename meta/recipes-devtools/gcc/{gcc-sanitizers_6.3.bb => gcc-sanitizers_6.4.bb} (100%)
>   rename meta/recipes-devtools/gcc/{gcc-source_6.3.bb => gcc-source_6.4.bb} (100%)
>   rename meta/recipes-devtools/gcc/{gcc_6.3.bb => gcc_6.4.bb} (100%)
>   rename meta/recipes-devtools/gcc/{libgcc-initial_6.3.bb => libgcc-initial_6.4.bb} (100%)
>   rename meta/recipes-devtools/gcc/{libgcc_6.3.bb => libgcc_6.4.bb} (100%)
>   rename meta/recipes-devtools/gcc/{libgfortran_6.3.bb => libgfortran_6.4.bb} (100%)
>



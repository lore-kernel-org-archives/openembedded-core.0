Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Snyyg-0006Qh-Eq
	for openembedded-core@lists.openembedded.org;
	Sun, 08 Jul 2012 23:25:19 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 08 Jul 2012 14:14:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="174790069"
Received: from unknown (HELO [10.255.12.157]) ([10.255.12.157])
	by fmsmga001.fm.intel.com with ESMTP; 08 Jul 2012 14:14:04 -0700
Message-ID: <4FF9F81B.2010204@linux.intel.com>
Date: Sun, 08 Jul 2012 14:14:03 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1341763345.git.raj.khem@gmail.com>
In-Reply-To: <cover.1341763345.git.raj.khem@gmail.com>
Subject: Re: [PATCH V2 00/14] eglibc 2.16
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 08 Jul 2012 21:25:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Khem,

Not sure if this one is on your radar:

> | builtin-sched.c: In function 'get_cpu_usage_nsec_parent':
> | builtin-sched.c:396:16: error: storage size of 'ru' isn't known
> | builtin-sched.c:400:2: error: implicit declaration of function 'getrusage' [-Werror=implicit-function-declaration]
> | builtin-sched.c:400:2: error: nested extern declaration of 'getrusage' [-Werror=nested-externs]
> | builtin-sched.c:400:18: error: 'RUSAGE_SELF' undeclared (first use in this function)
> | builtin-sched.c:400:18: note: each undeclared identifier is reported only once for each function it appears in
> | builtin-sched.c:396:16: error: unused variable 'ru' [-Werror=unused-variable]
> | cc1: all warnings being treated as errors
> | make: *** [/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/routerstationpro-poky-linux/perf-3.4-r1/perf-3.4/builtin-sched.o] Error 1
> | make: *** Waiting for unfinished jobs....
> | make: Leaving directory `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/routerstationpro/usr/src/kernel/tools/perf'
> | ERROR: oe_runmake failed
> | ERROR: Function failed: do_compile (see /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/routerstationpro-poky-linux/perf-3.4-r1/temp/log.do_compile.25734 for further information)
> NOTE: package perf-3.4-r1: task do_compile: Failed

I found it when building with the autobuilder, not sure is this is due 
to the newer perf changes or the compiler itself.

Sau!


On 07/08/2012 09:10 AM, Khem Raj wrote:
> V2:
>
> Additionally, changed gcc to use git fetcher
> update E5500/E6500 patches for gcc and binutils (backported from mainline)
> images form p5020ds 32/64 bit built fine. (btw. it does not build with eglibc-2.15)
> Updated eglibc rpc patch needed for cross build from scratch
> Updates the gets patch for busybox now its a backport instead of
> home grown.
>
> bitbake world works clean for ppc/x86/x86_64 , for mips and arm
> the failures are prexisting.
> mips - webkit and pseudo fail to build
> arm - guile-2.0 and pseudo fail to build
>
> V1:
> This patch adds eglibc 2.16 recipes. I was able to build world
> on x86 except perf which was failing with 2.15 as well.
>
> I have also build and run core-image-sato on all qemus
>
> I did not remove 2.15 to allow some soak in time.
>
> The following changes since commit 8f16811a8d51982a8b3d70e6087aef4a41926840:
>
>    bootimg: Use STAGING_KERNEL_DIR (2012-07-06 09:38:17 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib kraj/eglibc-2.16
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/eglibc-2.16
>
> Khem Raj (19):
>    mirrors: Add debian archive snapshot mirrors to search list
>    gdb: Replace struct siginfo with proper siginfo_t
>    busybox: Include sys/resource.h for rusage definition
>    coreutils: Fix build with eglibc 2.16
>    diffutils: Fix build with eglibc 2.16
>    udev: Fix build with eglibc 2.16
>    gettext,m4,augeas,gnutls: Account for removal of gets in eglibc 2.16
>    bison: Fix for gets being removed from eglibc 2.16
>    grub,guile,cpio,tar,wget: Fix gnulib for absense of gets in eglibc
>    boost: Upgrade recipe to 1.50.0
>    puzzles: Fix checksums
>    valgrind: Fix build with eglibc 2.16
>    libpam: Fix build with eglibc 2.16
>    gcc-cross-initial.inc: Use BFD ld as default always
>    gcc: Switch to git SRC_URI
>    binutils: Backport the e5500/e6500 patches from mainline
>    gcc: Refresh support for fsl E5500/E6500
>    qemu: Explicitly add --disable-gl-accel when gl is not enabled
>    eglibc: Add recipes for 2.16 release
>
>   meta/classes/mirrors.bbclass                       |    4 +-
>   meta/recipes-bsp/grub/grub-1.99/remove-gets.patch  |   20 +
>   meta/recipes-bsp/grub/grub_1.99.bb                 |    3 +-
>   .../busybox/busybox-1.19.4/sys_resource.patch      |   99 +++
>   meta/recipes-core/busybox/busybox_1.19.4.bb        |    3 +-
>   .../coreutils/coreutils-8.14/remove-gets.patch     |   23 +
>   meta/recipes-core/coreutils/coreutils_8.14.bb      |    3 +-
>   .../eglibc/cross-localedef-native_2.16.bb          |   44 +
>   .../eglibc/eglibc-2.16/GLRO_dl_debug_mask.patch    |  108 +++
>   .../eglibc/eglibc-2.16/IO-acquire-lock-fix.patch   |   17 +
>   .../eglibc-svn-arm-lowlevellock-include-tls.patch  |   21 +
>   .../eglibc_fix_findidx_parameters.patch            |   38 +
>   .../eglibc/eglibc-2.16/generate-supported.mk       |   11 +
>   .../eglibc/eglibc-2.16/initgroups_keys.patch       |   20 +
>   .../eglibc/eglibc-2.16/ld-search-order.patch       |   56 ++
>   .../eglibc/eglibc-2.16/mips-rld-map-check.patch    |   26 +
>   .../eglibc/eglibc-2.16/multilib_readlib.patch      |   17 +
>   .../recipes-core/eglibc/eglibc-2.16/ppc-sqrt.patch |  538 ++++++++++++
>   .../eglibc/eglibc-2.16/ppc-sqrt_finite.patch       |  112 +++
>   .../eglibc/eglibc-2.16/ppc_slow_ieee754_sqrt.patch |  123 +++
>   .../eglibc/eglibc-2.16/rpc-bootstrap.patch         |   63 ++
>   .../eglibc-2.16/use-sysroot-cxx-headers.patch      |   42 +
>   meta/recipes-core/eglibc/eglibc-initial_2.16.bb    |    6 +
>   meta/recipes-core/eglibc/eglibc-locale_2.16.bb     |    1 +
>   meta/recipes-core/eglibc/eglibc_2.16.bb            |  146 ++++
>   .../gettext/gettext-0.18.1.1/remove_gets.patch     |   58 ++
>   meta/recipes-core/gettext/gettext_0.18.1.1.bb      |    3 +-
>   meta/recipes-core/udev/udev/include_resource.patch |   31 +
>   meta/recipes-core/udev/udev_164.bb                 |    7 +-
>   meta/recipes-devtools/binutils/binutils-2.22.inc   |    2 +-
>   .../binutils/binutils/binutils-powerpc-e5500.patch |  918 +++++++++++++++++++-
>   .../recipes-devtools/bison/bison/remove-gets.patch |   20 +
>   meta/recipes-devtools/bison/bison_2.5.bb           |    6 +-
>   meta/recipes-devtools/gcc/gcc-4.7.inc              |   17 +-
>   .../gcc/gcc-4.7/define_insn_reservation.patch      |  118 +++
>   .../gcc/gcc-4.7/ppc_with_cpu.patch                 |  752 ++++++++++++++++
>   ...pc-e5500.patch => ppce5500-e6500-support.patch} |  560 ++++++++----
>   .../gcc/gcc-4.7/rs6000-tables.patch                |  135 +++
>   meta/recipes-devtools/gcc/gcc-cross-initial.inc    |    1 +
>   meta/recipes-devtools/gdb/gdb-common.inc           |    2 +-
>   meta/recipes-devtools/gdb/gdb.inc                  |    1 +
>   meta/recipes-devtools/gdb/gdb/siginfo_t.patch      |  403 +++++++++
>   .../recipes-devtools/guile/files/remove-gets.patch |   23 +
>   meta/recipes-devtools/guile/guile_2.0.5.bb         |    3 +-
>   meta/recipes-devtools/m4/m4-1.4.16.inc             |    6 +-
>   meta/recipes-devtools/m4/m4/remove-gets.patch      |   21 +
>   meta/recipes-devtools/qemu/qemu.inc                |    2 +-
>   .../valgrind-3.7.0/configure-with-glibc-2.16.patch |   32 +
>   meta/recipes-devtools/valgrind/valgrind_3.7.0.bb   |    6 +-
>   .../augeas/augeas/remove-gets.patch                |   20 +
>   meta/recipes-extended/augeas/augeas_0.10.0.bb      |    4 +-
>   .../cpio/cpio-2.11/remove-gets.patch               |   20 +
>   meta/recipes-extended/cpio/cpio_2.11.bb            |    5 +-
>   .../diffutils/diffutils-3.2/remove-gets.patch      |   22 +
>   meta/recipes-extended/diffutils/diffutils_3.2.bb   |    6 +-
>   .../pam/libpam/include-sys-resource.patch          |   12 +
>   meta/recipes-extended/pam/libpam_1.1.5.bb          |    6 +-
>   .../tar/tar-1.26/remove-gets.patch                 |   20 +
>   meta/recipes-extended/tar/tar_1.26.bb              |    5 +-
>   .../wget/wget-1.13.4/remove-gets.patch             |   23 +
>   meta/recipes-extended/wget/wget_1.13.4.bb          |    3 +-
>   meta/recipes-sato/puzzles/puzzles_r9561.bb         |   11 +-
>   .../boost/{boost_1.49.0.bb => boost_1.50.0.bb}     |    5 +-
>   .../gnutls/gnutls/remove-gets.patch                |   41 +
>   meta/recipes-support/gnutls/gnutls_2.12.20.bb      |    3 +-
>   65 files changed, 4629 insertions(+), 248 deletions(-)
>   create mode 100644 meta/recipes-bsp/grub/grub-1.99/remove-gets.patch
>   create mode 100644 meta/recipes-core/busybox/busybox-1.19.4/sys_resource.patch
>   create mode 100644 meta/recipes-core/coreutils/coreutils-8.14/remove-gets.patch
>   create mode 100644 meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/GLRO_dl_debug_mask.patch
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/IO-acquire-lock-fix.patch
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/eglibc-svn-arm-lowlevellock-include-tls.patch
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/eglibc_fix_findidx_parameters.patch
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/etc/ld.so.conf
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/generate-supported.mk
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/initgroups_keys.patch
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/ld-search-order.patch
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/mips-rld-map-check.patch
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/multilib_readlib.patch
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/ppc-sqrt.patch
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/ppc-sqrt_finite.patch
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/ppc_slow_ieee754_sqrt.patch
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/rpc-bootstrap.patch
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/use-sysroot-cxx-headers.patch
>   create mode 100644 meta/recipes-core/eglibc/eglibc-initial_2.16.bb
>   create mode 100644 meta/recipes-core/eglibc/eglibc-locale_2.16.bb
>   create mode 100644 meta/recipes-core/eglibc/eglibc_2.16.bb
>   create mode 100644 meta/recipes-core/gettext/gettext-0.18.1.1/remove_gets.patch
>   create mode 100644 meta/recipes-core/udev/udev/include_resource.patch
>   create mode 100644 meta/recipes-devtools/bison/bison/remove-gets.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/define_insn_reservation.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/ppc_with_cpu.patch
>   rename meta/recipes-devtools/gcc/gcc-4.7/{powerpc-e5500.patch => ppce5500-e6500-support.patch} (41%)
>   create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/rs6000-tables.patch
>   create mode 100644 meta/recipes-devtools/gdb/gdb/siginfo_t.patch
>   create mode 100644 meta/recipes-devtools/guile/files/remove-gets.patch
>   create mode 100644 meta/recipes-devtools/m4/m4/remove-gets.patch
>   create mode 100644 meta/recipes-devtools/valgrind/valgrind-3.7.0/configure-with-glibc-2.16.patch
>   create mode 100644 meta/recipes-extended/augeas/augeas/remove-gets.patch
>   create mode 100644 meta/recipes-extended/cpio/cpio-2.11/remove-gets.patch
>   create mode 100644 meta/recipes-extended/diffutils/diffutils-3.2/remove-gets.patch
>   create mode 100644 meta/recipes-extended/pam/libpam/include-sys-resource.patch
>   create mode 100644 meta/recipes-extended/tar/tar-1.26/remove-gets.patch
>   create mode 100644 meta/recipes-extended/wget/wget-1.13.4/remove-gets.patch
>   rename meta/recipes-support/boost/{boost_1.49.0.bb => boost_1.50.0.bb} (53%)
>   create mode 100644 meta/recipes-support/gnutls/gnutls/remove-gets.patch
>




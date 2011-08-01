Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qnn7H-0006ZU-IR
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 09:40:48 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 01 Aug 2011 00:36:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,299,1309762800"; d="scan'208";a="34147056"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by orsmga001.jf.intel.com with ESMTP; 01 Aug 2011 00:36:17 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Aug 2011 00:35:52 -0700
Message-Id: <cover.1312182844.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [CONSOLIDATED PATCH 00/22] Fixes Multi-Lib & M3
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
X-List-Received-Date: Mon, 01 Aug 2011 07:40:48 -0000

Richard,

This set of patches are what have been pulled together for the
M3 RC1 build.  They include patches to multi-lib and tuning changes
put last week.

There are also 2 changes from Josh for bitbake, not included here,
which are included in stage/master_under_test.

There are competing changes from Martin and Khem for the ARM fix, the 
first change from Martin did not seem to solve (or there is a different
issue that I have not evaluated).  I am building Khem's change, but it 
also seems to fail in eglibc, so ARM is still an issue

Thanks
	Sau!


One note, I  
The following changes since commit e23f9ce928353c9da2b9c4bfa9a1a125a7d160f2:

  feature-arm-thumb: respect ARM_INSTRUCTION_SET (2011-07-29 10:18:15 -0700)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/mut
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/mut

Khem Raj (1):
  feature-arm-thumb: Take ARM_INSTRUCTION_SET into account to decide
    thumb mode

Koen Kooi (2):
  package_{deb, rpm, ipk}.bbclass: fix 'lingusa' typo
  arch-armv7a.inc: fix armv7a-vfp-neon -> armv7a compat case

Kumar Gala (5):
  libzypp: Fix variable substitution problem in do_archgen step
  tune/arch-powerpc64: Fix typo with 64-bit TUNE_CCARGS handling
  tune/arch-powerpc64: Remove support for soft-float from ppc64
  tune/arch-powerpc: Use fpu-soft to set PPCPKGSFX_FPU
  sanity.bbclass: Add sanity check that TUNE_PKGARCH appears in
    PACKAGE_ARCHS

Lianhao Lu (1):
  meta-environment: set correct *MULTIMACH_TARGET_SYS.

Malcolm Crossley (1):
  tune-ppce500mc: Adjust PowerPC e500mc tune file to correctly set hard
    fpu.

Mark Hatle (4):
  tune/powerpc: Cleanup setting of TUNE_PKGARCH
  populate_sdk:  Fix the introduction of sdknative packages
  bitbake.conf: Add default tune-${DEFAULTTUNE} override
  rootfs_rpm.bbclass:  Fix multilib configurations to use DEFAULTTUNE

Phil Blundell (1):
  glibc: deleted

Saul Wold (7):
  docbook-sgml-dtd-native: Write a bak file for shared state
  docbook-dsssl-stylesheets-native: Write a bak file for shared state
  openjade-native: Write a bak file for shared state
  sgml-common-native: Read a catalog backup to repopulate
    sgml-docbook.cat
  sanity: Dont throw a warning if TUNE_PKGARCH is in PACKAGE_ARCHS
    twice
  libzypp: Bump PR
  external-*toolchain: remove glibc-utils provide

 meta/classes/package_deb.bbclass                   |    6 +-
 meta/classes/package_ipk.bbclass                   |    6 +-
 meta/classes/package_rpm.bbclass                   |   25 +-
 meta/classes/populate_sdk_deb.bbclass              |   11 +-
 meta/classes/populate_sdk_rpm.bbclass              |   11 +-
 meta/classes/rootfs_rpm.bbclass                    |    2 +-
 meta/classes/sanity.bbclass                        |   14 +-
 meta/classes/toolchain-scripts.bbclass             |    7 +-
 meta/conf/bitbake.conf                             |    3 +-
 meta/conf/distro/include/tclibc-glibc.inc          |   32 -
 meta/conf/distro/include/tcmode-default.inc        |    5 -
 meta/conf/machine/include/arm/arch-armv7a.inc      |    4 +-
 .../conf/machine/include/arm/feature-arm-thumb.inc |    6 +-
 meta/conf/machine/include/powerpc/arch-powerpc.inc |    5 +-
 .../machine/include/powerpc/arch-powerpc64.inc     |    9 +-
 meta/conf/machine/include/tune-ppc603e.inc         |    4 +-
 meta/conf/machine/include/tune-ppce300c2.inc       |    5 +-
 meta/conf/machine/include/tune-ppce500.inc         |    5 +-
 meta/conf/machine/include/tune-ppce500mc.inc       |    7 +-
 meta/conf/machine/include/tune-ppce500v2.inc       |    5 +-
 .../glibc/glibc-2.10.1/arm-longlong.patch          |   60 --
 .../glibc/glibc-2.10.1/arm-memcpy.patch            |  760 --------------------
 .../glibc/glibc-2.10.1/dl-cache-libcmp.patch       |   12 -
 .../recipes-core/glibc/glibc-2.10.1/etc/ld.so.conf |    2 -
 .../glibc/glibc-2.10.1/fhs-linux-paths.patch       |   13 -
 .../glibc/glibc-2.10.1/generate-supported.mk       |   11 -
 .../glibc/glibc-2.10.1/generic-bits_select.h       |   35 -
 .../glibc/glibc-2.10.1/generic-bits_time.h         |   75 --
 .../glibc/glibc-2.10.1/generic-bits_types.h        |  200 -----
 .../glibc/glibc-2.10.1/generic-bits_typesizes.h    |   66 --
 .../glibc-2.9-enable-binutils-2.2.patch            |   37 -
 .../glibc-arm-IO-acquire-lock-fix.diff             |   15 -
 .../glibc/glibc-2.10.1/glibc-arm-no-asm-page.patch |   17 -
 .../glibc/glibc-2.10.1/glibc-check_pf.patch        |  345 ---------
 .../glibc/glibc-2.10.1/ldd-unbash.patch            |   13 -
 .../glibc/glibc-2.10.1/ldsocache-varrun.patch      |   20 -
 .../glibc/glibc-2.10.1/march-i686.patch            |   39 -
 .../glibc/glibc-2.10.1/mips-rld-map-check.patch    |   23 -
 .../glibc/glibc-2.10.1/nptl-crosscompile.patch     |   28 -
 .../glibc/glibc-2.10.1/nscd-init.patch             |   41 --
 .../glibc/glibc-2.10.1/powerpc-sqrt-hack.diff      |   27 -
 .../recipes-core/glibc/glibc-2.10.1/rulesfix.patch |   15 -
 meta/recipes-core/glibc/glibc-initial.inc          |   67 --
 meta/recipes-core/glibc/glibc-initial_2.10.1.bb    |   10 -
 meta/recipes-core/glibc/glibc-locale_2.10.1.bb     |   63 --
 meta/recipes-core/glibc/glibc-package.inc          |   96 ---
 meta/recipes-core/glibc/glibc.inc                  |   60 --
 meta/recipes-core/glibc/glibc_2.10.1.bb            |  161 -----
 meta/recipes-core/glibc/site_config/funcs          |  474 ------------
 meta/recipes-core/glibc/site_config/headers        |  156 ----
 meta/recipes-core/glibc/site_config/types          |   21 -
 .../meta/external-csl-toolchain_2008q3-72.bb       |    4 +-
 meta/recipes-core/meta/external-poky-toolchain.bb  |    4 +-
 meta/recipes-core/meta/meta-environment.bb         |    9 +-
 .../docbook-dsssl-stylesheets-native_1.79.bb       |    5 +-
 .../docbook-sgml-dtd/docbook-sgml-dtd-native.inc   |    5 +-
 .../openjade/openjade-native_1.3.2.bb              |    5 +-
 .../sgml-common/sgml-common-native_0.6.3.bb        |   18 +-
 meta/recipes-extended/libzypp/libzypp_git.bb       |    8 +-
 59 files changed, 111 insertions(+), 3081 deletions(-)
 delete mode 100644 meta/conf/distro/include/tclibc-glibc.inc
 delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/arm-longlong.patch
 delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/arm-memcpy.patch
 delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/dl-cache-libcmp.patch
 delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/etc/ld.so.conf
 delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/fhs-linux-paths.patch
 delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/generate-supported.mk
 delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/generic-bits_select.h
 delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/generic-bits_time.h
 delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/generic-bits_types.h
 delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/generic-bits_typesizes.h
 delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/glibc-2.9-enable-binutils-2.2.patch
 delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/glibc-arm-IO-acquire-lock-fix.diff
 delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/glibc-arm-no-asm-page.patch
 delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/glibc-check_pf.patch
 delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/ldd-unbash.patch
 delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/ldsocache-varrun.patch
 delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/march-i686.patch
 delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/mips-rld-map-check.patch
 delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/nptl-crosscompile.patch
 delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/nscd-init.patch
 delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/powerpc-sqrt-hack.diff
 delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/rulesfix.patch
 delete mode 100644 meta/recipes-core/glibc/glibc-initial.inc
 delete mode 100644 meta/recipes-core/glibc/glibc-initial_2.10.1.bb
 delete mode 100644 meta/recipes-core/glibc/glibc-locale_2.10.1.bb
 delete mode 100644 meta/recipes-core/glibc/glibc-package.inc
 delete mode 100644 meta/recipes-core/glibc/glibc-stage.inc
 delete mode 100644 meta/recipes-core/glibc/glibc.inc
 delete mode 100644 meta/recipes-core/glibc/glibc_2.10.1.bb
 delete mode 100644 meta/recipes-core/glibc/site_config/funcs
 delete mode 100644 meta/recipes-core/glibc/site_config/headers
 delete mode 100644 meta/recipes-core/glibc/site_config/types

-- 
1.7.3.4




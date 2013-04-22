Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UU8Xt-00027k-06
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Apr 2013 06:40:15 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 21 Apr 2013 21:22:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,523,1363158000"; d="scan'208";a="230120610"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.224])
	by AZSMGA002.ch.intel.com with ESMTP; 21 Apr 2013 21:22:24 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Apr 2013 21:22:23 -0700
Message-Id: <cover.1366604239.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [CONSOLIDATED PULL 00/21] Post 1.4 Updates and Fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Apr 2013 04:40:20 -0000

Richard,

Here is a batch of changes I have been queuing and ran on the AB over the
weekend.

This includes Khem's 4.8 GCC update, but does not enable it, there are still some 
packages that need work like matchbox-panel.

Some of these might be canidates for 1.4.1.

For RP's Attention:
I also included Chase's u-boot change, I know there are some comments about it
on the list, I wanted to give you a chance to see it again and think about including
it or not.

Let the flood gates open, I will be staging things out slowly as we get to the end of
the 1.4 testing, but wanted to collect some of these sitting around.  

Thanks
	Sau!


The following changes since commit 94e3f18214e2e35076c52ed27252073f788ec01f:

  build-appliance: Update to latest dylan revision for release (2013-04-18 22:02:26 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Chase Maupin (1):
  u-boot: Add UBOOT_LOCALVERSION to control version string

Christopher Larson (2):
  package.bbclass: add LICENSE_EXCLUSION to vardeps
  package.bbclass: ensure license excluded files aren't packaged

Elvis Dowson (1):
  gcc-4.8: Refactor gcc-4.8.0 patch files.

Emilia Ciobanu (1):
  connman-gnome: Replace broken png files

Khem Raj (2):
  gcc-4.8: Add recipes
  gcc-4.8: Fix GCC ICE on arm

Koen Kooi (3):
  libpng: update to 1.6.1
  grub-efi-native: fix build on modern distributions without gets()
  gnome-icon-theme: add missing icon-cache inherit

Laurentiu Palcu (4):
  fontcache.bbclass: do not exit with 1 after installing intercept hook
  gtk-icon-cache.bbclass: do not exit 1 after installing intercept hook
  pixbufcache.bbclass: do not exit 1 after installing intercept hook
  image.bbclass: change the logic when intercepts fail

Lukas Bulwahn (1):
  python-setuptools: Improving the runtime dependencies

Marcin Juszkiewicz (2):
  powertop: add 2.3
  elfutils: split libraries into separate packages

Maxin B. John (1):
  lttng: updated lttng-ust to 2.1.2

Ross Burton (3):
  cairo: drop transform patch, it's been rejected upstream
  png: fix over-zealous warnings about transforms
  gconf: silence some spurious errors

 meta/classes/fontcache.bbclass                     |   10 +-
 meta/classes/gtk-icon-cache.bbclass                |   47 +-
 meta/classes/image.bbclass                         |   26 +-
 meta/classes/package.bbclass                       |    9 +-
 meta/classes/pixbufcache.bbclass                   |   29 +-
 .../grub-2.00-ignore-gnulib-gets-stupidity.patch   |   28 +
 meta/recipes-bsp/grub/grub-efi-native_2.00.bb      |    3 +-
 meta/recipes-bsp/u-boot/u-boot.inc                 |   12 +
 .../connman-gnome/images/connman-signal-01.png     |  Bin 0 -> 490 bytes
 .../connman-gnome/images/connman-signal-02.png     |  Bin 0 -> 496 bytes
 .../connman-gnome/images/connman-signal-03.png     |  Bin 0 -> 492 bytes
 .../connman-gnome/images/connman-signal-04.png     |  Bin 0 -> 470 bytes
 .../connman-gnome/images/connman-signal-05.png     |  Bin 0 -> 419 bytes
 .../connman/connman-gnome_0.7.bb                   |    8 +-
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |   15 +-
 meta/recipes-devtools/gcc/gcc-4.8.inc              |  133 +
 .../0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch     |   42 +
 .../gcc/gcc-4.8/0002-uclibc-conf.patch             |   53 +
 .../0003-gcc-uclibc-locale-ctype_touplow_t.patch   |   87 +
 .../gcc/gcc-4.8/0004-uclibc-locale.patch           | 2862 ++++++++++++++++++++
 .../gcc/gcc-4.8/0005-uclibc-locale-no__x.patch     |  257 ++
 .../gcc/gcc-4.8/0006-uclibc-locale-wchar_fix.patch |   68 +
 .../gcc/gcc-4.8/0007-uclibc-locale-update.patch    |  542 ++++
 .../gcc/gcc-4.8/0008-missing-execinfo_h.patch      |   28 +
 .../gcc/gcc-4.8/0009-c99-snprintf.patch            |   28 +
 .../gcc/gcc-4.8/0010-c99-complex-ugly-hack.patch   |   29 +
 .../gcc/gcc-4.8/0011-index_macro.patch             |   44 +
 .../gcc/gcc-4.8/0012-libmudflap-susv3-legacy.patch |   64 +
 .../gcc/gcc-4.8/0013-libstdc-namespace.patch       |   54 +
 .../gcc/gcc-4.8/0014-sh-pr24836.patch              |   45 +
 ...GET_ENDIAN_OPTION-for-determining-MULTILI.patch |   29 +
 .../0016-gcc-poison-system-directories.patch       |  224 ++
 .../gcc/gcc-4.8/0017-gcc-poison-dir-extend.patch   |   39 +
 .../0018-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |   73 +
 .../gcc/gcc-4.8/0019-64-bit-multilib-hack.patch    |   82 +
 .../gcc/gcc-4.8/0020-optional-libstdc.patch        |  102 +
 ...0021-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |   59 +
 .../gcc/gcc-4.8/0022-COLLECT_GCC_OPTIONS.patch     |   38 +
 ...efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch |   88 +
 .../gcc/gcc-4.8/0024-PR-target-32219.patch         |   67 +
 .../gcc-4.8/0025-fortran-cross-compile-hack.patch  |   46 +
 .../gcc/gcc-4.8/0026-libgcc-sjlj-check.patch       |   74 +
 .../gcc/gcc-4.8/0027-cpp-honor-sysroot.patch       |   54 +
 .../gcc-4.8/0028-MIPS64-Default-to-N64-ABI.patch   |   31 +
 ...C_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |  190 ++
 ...0030-gcc-Fix-argument-list-too-long-error.patch |   40 +
 .../gcc/gcc-4.8/0031-Disable-sdt.patch             |   45 +
 .../gcc/gcc-4.8/0032-libtool.patch                 |   42 +
 ...4-pass-fix-v4bx-to-linker-to-support-EABI.patch |   43 +
 ...tilib-config-files-from-B-instead-of-usin.patch |  102 +
 .../gcc/gcc-4.8/0035-wcast-qual-PR-55383.patch     |   55 +
 .../gcc/gcc-4.8/gcc-4.8-PR56797.patch              |   66 +
 .../recipes-devtools/gcc/gcc-cross-canadian_4.8.bb |   26 +
 meta/recipes-devtools/gcc/gcc-cross-initial_4.8.bb |    2 +
 meta/recipes-devtools/gcc/gcc-cross_4.8.bb         |   14 +
 .../gcc/gcc-crosssdk-initial_4.8.bb                |    4 +
 meta/recipes-devtools/gcc/gcc-crosssdk_4.8.bb      |    2 +
 meta/recipes-devtools/gcc/gcc-runtime_4.8.bb       |    8 +
 meta/recipes-devtools/gcc/gcc_4.8.bb               |    5 +
 meta/recipes-devtools/gcc/libgcc_4.8.bb            |  145 +
 .../python/python-setuptools_0.6c11.bb             |    8 +
 .../gnome/gconf/unable-connect-dbus.patch          |   95 +
 meta/recipes-gnome/gnome/gconf_3.2.6.bb            |    1 +
 .../recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb |   12 +-
 meta/recipes-graphics/cairo/cairo/png.patch        |   77 +-
 .../{lttng-ust_2.1.1.bb => lttng-ust_2.1.2.bb}     |    8 +-
 .../stub_out_the_ncurses_calls_in_dump_mode.patch  |   33 -
 meta/recipes-kernel/powertop/powertop_1.13.bb      |   41 -
 meta/recipes-kernel/powertop/powertop_2.3.bb       |   30 +
 ...0001-configure-lower-automake-requirement.patch |   30 +
 .../libpng/libpng/transform.patch                  |   46 +
 meta/recipes-multimedia/libpng/libpng_1.6.0.bb     |   20 -
 meta/recipes-multimedia/libpng/libpng_1.6.1.bb     |   23 +
 73 files changed, 6494 insertions(+), 248 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/grub-2.00-ignore-gnulib-gets-stupidity.patch
 create mode 100644 meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-01.png
 create mode 100644 meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-02.png
 create mode 100644 meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-03.png
 create mode 100644 meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-04.png
 create mode 100644 meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-05.png
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8.inc
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0002-uclibc-conf.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0003-gcc-uclibc-locale-ctype_touplow_t.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0004-uclibc-locale.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0005-uclibc-locale-no__x.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0006-uclibc-locale-wchar_fix.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0007-uclibc-locale-update.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0008-missing-execinfo_h.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0009-c99-snprintf.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0010-c99-complex-ugly-hack.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0011-index_macro.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0012-libmudflap-susv3-legacy.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0013-libstdc-namespace.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0014-sh-pr24836.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0015-arm-Use-TARGET_ENDIAN_OPTION-for-determining-MULTILI.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0016-gcc-poison-system-directories.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0017-gcc-poison-dir-extend.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0018-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0019-64-bit-multilib-hack.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0020-optional-libstdc.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0021-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0022-COLLECT_GCC_OPTIONS.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0023-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0024-PR-target-32219.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0025-fortran-cross-compile-hack.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0026-libgcc-sjlj-check.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0027-cpp-honor-sysroot.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0028-MIPS64-Default-to-N64-ABI.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0029-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0030-gcc-Fix-argument-list-too-long-error.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0031-Disable-sdt.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0032-libtool.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0033-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0034-Use-the-multilib-config-files-from-B-instead-of-usin.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0035-wcast-qual-PR-55383.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/gcc-4.8-PR56797.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-cross-canadian_4.8.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-cross-initial_4.8.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-cross_4.8.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.8.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk_4.8.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-runtime_4.8.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc_4.8.bb
 create mode 100644 meta/recipes-devtools/gcc/libgcc_4.8.bb
 create mode 100644 meta/recipes-gnome/gnome/gconf/unable-connect-dbus.patch
 rename meta/recipes-kernel/lttng/{lttng-ust_2.1.1.bb => lttng-ust_2.1.2.bb} (84%)
 delete mode 100644 meta/recipes-kernel/powertop/powertop-1.13/stub_out_the_ncurses_calls_in_dump_mode.patch
 delete mode 100644 meta/recipes-kernel/powertop/powertop_1.13.bb
 create mode 100644 meta/recipes-kernel/powertop/powertop_2.3.bb
 create mode 100644 meta/recipes-multimedia/libpng/libpng/0001-configure-lower-automake-requirement.patch
 create mode 100644 meta/recipes-multimedia/libpng/libpng/transform.patch
 delete mode 100644 meta/recipes-multimedia/libpng/libpng_1.6.0.bb
 create mode 100644 meta/recipes-multimedia/libpng/libpng_1.6.1.bb

-- 
1.8.0.2




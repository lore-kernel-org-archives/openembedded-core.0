Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SnuFG-0001HK-Iy
	for openembedded-core@lists.openembedded.org;
	Sun, 08 Jul 2012 18:22:02 +0200
Received: by pbbrq2 with SMTP id rq2so16966652pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Jul 2012 09:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=EWLC+RPHEUEU+TCE1OHHc66xifMyQvgmPjl6Rs1BNCU=;
	b=qGVC2DejZtzaWOakDPdzhLM/4jDQ/7NCrj2SAMgezKhJ3H19Fo93Uzjh2e+8xu8wQF
	cpudFA8hOwRcoWojdGo32zfgopFEZ1VzejXTrg4LhihX+I4xG3KL5M43//72+14rToSB
	EGWE4eWW7+B/0Ha0lgFeUcGjLkgLZnGEqNwGxWtzzfALQvB4om+IV8tYAMJfWNzhmyG7
	kTh0ObKLj6PnPhZIaBHoG3Iz7tUQVfV1GQyd8M1MGYkWFaD3wZJeZWH8gd1ZaueFobZD
	LSIuv+bV8WQZw70Ud5tyRkrvv4tEN399vX8hw9dOIxZ1291WJw7dNTZgfOHT6wtyLPlW
	2qhA==
Received: by 10.68.219.166 with SMTP id pp6mr52607479pbc.35.1341763853105;
	Sun, 08 Jul 2012 09:10:53 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id gk2sm14509324pbc.8.2012.07.08.09.10.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 08 Jul 2012 09:10:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Jul 2012 09:10:20 -0700
Message-Id: <cover.1341763345.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH V2 00/14] eglibc 2.16
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
X-List-Received-Date: Sun, 08 Jul 2012 16:22:03 -0000

V2:

Additionally, changed gcc to use git fetcher
update E5500/E6500 patches for gcc and binutils (backported from mainline)
images form p5020ds 32/64 bit built fine. (btw. it does not build with eglibc-2.15)
Updated eglibc rpc patch needed for cross build from scratch
Updates the gets patch for busybox now its a backport instead of
home grown.

bitbake world works clean for ppc/x86/x86_64 , for mips and arm
the failures are prexisting.
mips - webkit and pseudo fail to build
arm - guile-2.0 and pseudo fail to build

V1:
This patch adds eglibc 2.16 recipes. I was able to build world
on x86 except perf which was failing with 2.15 as well.

I have also build and run core-image-sato on all qemus

I did not remove 2.15 to allow some soak in time.

The following changes since commit 8f16811a8d51982a8b3d70e6087aef4a41926840:

  bootimg: Use STAGING_KERNEL_DIR (2012-07-06 09:38:17 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/eglibc-2.16
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/eglibc-2.16

Khem Raj (19):
  mirrors: Add debian archive snapshot mirrors to search list
  gdb: Replace struct siginfo with proper siginfo_t
  busybox: Include sys/resource.h for rusage definition
  coreutils: Fix build with eglibc 2.16
  diffutils: Fix build with eglibc 2.16
  udev: Fix build with eglibc 2.16
  gettext,m4,augeas,gnutls: Account for removal of gets in eglibc 2.16
  bison: Fix for gets being removed from eglibc 2.16
  grub,guile,cpio,tar,wget: Fix gnulib for absense of gets in eglibc
  boost: Upgrade recipe to 1.50.0
  puzzles: Fix checksums
  valgrind: Fix build with eglibc 2.16
  libpam: Fix build with eglibc 2.16
  gcc-cross-initial.inc: Use BFD ld as default always
  gcc: Switch to git SRC_URI
  binutils: Backport the e5500/e6500 patches from mainline
  gcc: Refresh support for fsl E5500/E6500
  qemu: Explicitly add --disable-gl-accel when gl is not enabled
  eglibc: Add recipes for 2.16 release

 meta/classes/mirrors.bbclass                       |    4 +-
 meta/recipes-bsp/grub/grub-1.99/remove-gets.patch  |   20 +
 meta/recipes-bsp/grub/grub_1.99.bb                 |    3 +-
 .../busybox/busybox-1.19.4/sys_resource.patch      |   99 +++
 meta/recipes-core/busybox/busybox_1.19.4.bb        |    3 +-
 .../coreutils/coreutils-8.14/remove-gets.patch     |   23 +
 meta/recipes-core/coreutils/coreutils_8.14.bb      |    3 +-
 .../eglibc/cross-localedef-native_2.16.bb          |   44 +
 .../eglibc/eglibc-2.16/GLRO_dl_debug_mask.patch    |  108 +++
 .../eglibc/eglibc-2.16/IO-acquire-lock-fix.patch   |   17 +
 .../eglibc-svn-arm-lowlevellock-include-tls.patch  |   21 +
 .../eglibc_fix_findidx_parameters.patch            |   38 +
 .../eglibc/eglibc-2.16/generate-supported.mk       |   11 +
 .../eglibc/eglibc-2.16/initgroups_keys.patch       |   20 +
 .../eglibc/eglibc-2.16/ld-search-order.patch       |   56 ++
 .../eglibc/eglibc-2.16/mips-rld-map-check.patch    |   26 +
 .../eglibc/eglibc-2.16/multilib_readlib.patch      |   17 +
 .../recipes-core/eglibc/eglibc-2.16/ppc-sqrt.patch |  538 ++++++++++++
 .../eglibc/eglibc-2.16/ppc-sqrt_finite.patch       |  112 +++
 .../eglibc/eglibc-2.16/ppc_slow_ieee754_sqrt.patch |  123 +++
 .../eglibc/eglibc-2.16/rpc-bootstrap.patch         |   63 ++
 .../eglibc-2.16/use-sysroot-cxx-headers.patch      |   42 +
 meta/recipes-core/eglibc/eglibc-initial_2.16.bb    |    6 +
 meta/recipes-core/eglibc/eglibc-locale_2.16.bb     |    1 +
 meta/recipes-core/eglibc/eglibc_2.16.bb            |  146 ++++
 .../gettext/gettext-0.18.1.1/remove_gets.patch     |   58 ++
 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |    3 +-
 meta/recipes-core/udev/udev/include_resource.patch |   31 +
 meta/recipes-core/udev/udev_164.bb                 |    7 +-
 meta/recipes-devtools/binutils/binutils-2.22.inc   |    2 +-
 .../binutils/binutils/binutils-powerpc-e5500.patch |  918 +++++++++++++++++++-
 .../recipes-devtools/bison/bison/remove-gets.patch |   20 +
 meta/recipes-devtools/bison/bison_2.5.bb           |    6 +-
 meta/recipes-devtools/gcc/gcc-4.7.inc              |   17 +-
 .../gcc/gcc-4.7/define_insn_reservation.patch      |  118 +++
 .../gcc/gcc-4.7/ppc_with_cpu.patch                 |  752 ++++++++++++++++
 ...pc-e5500.patch => ppce5500-e6500-support.patch} |  560 ++++++++----
 .../gcc/gcc-4.7/rs6000-tables.patch                |  135 +++
 meta/recipes-devtools/gcc/gcc-cross-initial.inc    |    1 +
 meta/recipes-devtools/gdb/gdb-common.inc           |    2 +-
 meta/recipes-devtools/gdb/gdb.inc                  |    1 +
 meta/recipes-devtools/gdb/gdb/siginfo_t.patch      |  403 +++++++++
 .../recipes-devtools/guile/files/remove-gets.patch |   23 +
 meta/recipes-devtools/guile/guile_2.0.5.bb         |    3 +-
 meta/recipes-devtools/m4/m4-1.4.16.inc             |    6 +-
 meta/recipes-devtools/m4/m4/remove-gets.patch      |   21 +
 meta/recipes-devtools/qemu/qemu.inc                |    2 +-
 .../valgrind-3.7.0/configure-with-glibc-2.16.patch |   32 +
 meta/recipes-devtools/valgrind/valgrind_3.7.0.bb   |    6 +-
 .../augeas/augeas/remove-gets.patch                |   20 +
 meta/recipes-extended/augeas/augeas_0.10.0.bb      |    4 +-
 .../cpio/cpio-2.11/remove-gets.patch               |   20 +
 meta/recipes-extended/cpio/cpio_2.11.bb            |    5 +-
 .../diffutils/diffutils-3.2/remove-gets.patch      |   22 +
 meta/recipes-extended/diffutils/diffutils_3.2.bb   |    6 +-
 .../pam/libpam/include-sys-resource.patch          |   12 +
 meta/recipes-extended/pam/libpam_1.1.5.bb          |    6 +-
 .../tar/tar-1.26/remove-gets.patch                 |   20 +
 meta/recipes-extended/tar/tar_1.26.bb              |    5 +-
 .../wget/wget-1.13.4/remove-gets.patch             |   23 +
 meta/recipes-extended/wget/wget_1.13.4.bb          |    3 +-
 meta/recipes-sato/puzzles/puzzles_r9561.bb         |   11 +-
 .../boost/{boost_1.49.0.bb => boost_1.50.0.bb}     |    5 +-
 .../gnutls/gnutls/remove-gets.patch                |   41 +
 meta/recipes-support/gnutls/gnutls_2.12.20.bb      |    3 +-
 65 files changed, 4629 insertions(+), 248 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/grub-1.99/remove-gets.patch
 create mode 100644 meta/recipes-core/busybox/busybox-1.19.4/sys_resource.patch
 create mode 100644 meta/recipes-core/coreutils/coreutils-8.14/remove-gets.patch
 create mode 100644 meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/GLRO_dl_debug_mask.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/IO-acquire-lock-fix.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/eglibc-svn-arm-lowlevellock-include-tls.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/eglibc_fix_findidx_parameters.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/etc/ld.so.conf
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/generate-supported.mk
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/initgroups_keys.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/ld-search-order.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/mips-rld-map-check.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/multilib_readlib.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/ppc-sqrt.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/ppc-sqrt_finite.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/ppc_slow_ieee754_sqrt.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/rpc-bootstrap.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/use-sysroot-cxx-headers.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-initial_2.16.bb
 create mode 100644 meta/recipes-core/eglibc/eglibc-locale_2.16.bb
 create mode 100644 meta/recipes-core/eglibc/eglibc_2.16.bb
 create mode 100644 meta/recipes-core/gettext/gettext-0.18.1.1/remove_gets.patch
 create mode 100644 meta/recipes-core/udev/udev/include_resource.patch
 create mode 100644 meta/recipes-devtools/bison/bison/remove-gets.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/define_insn_reservation.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/ppc_with_cpu.patch
 rename meta/recipes-devtools/gcc/gcc-4.7/{powerpc-e5500.patch => ppce5500-e6500-support.patch} (41%)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/rs6000-tables.patch
 create mode 100644 meta/recipes-devtools/gdb/gdb/siginfo_t.patch
 create mode 100644 meta/recipes-devtools/guile/files/remove-gets.patch
 create mode 100644 meta/recipes-devtools/m4/m4/remove-gets.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind-3.7.0/configure-with-glibc-2.16.patch
 create mode 100644 meta/recipes-extended/augeas/augeas/remove-gets.patch
 create mode 100644 meta/recipes-extended/cpio/cpio-2.11/remove-gets.patch
 create mode 100644 meta/recipes-extended/diffutils/diffutils-3.2/remove-gets.patch
 create mode 100644 meta/recipes-extended/pam/libpam/include-sys-resource.patch
 create mode 100644 meta/recipes-extended/tar/tar-1.26/remove-gets.patch
 create mode 100644 meta/recipes-extended/wget/wget-1.13.4/remove-gets.patch
 rename meta/recipes-support/boost/{boost_1.49.0.bb => boost_1.50.0.bb} (53%)
 create mode 100644 meta/recipes-support/gnutls/gnutls/remove-gets.patch

-- 
1.7.9.5




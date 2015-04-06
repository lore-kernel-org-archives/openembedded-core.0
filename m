Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id CEC1872A2D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Apr 2015 17:35:27 +0000 (UTC)
Received: by iebrs15 with SMTP id rs15so26607861ieb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Apr 2015 10:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=kX71Y0sHjOPbkhvBE7pPmfxXCIqvck5ZzrxWSeYk5kY=;
	b=IB7L5HMTqRhhTtJ18nNHLN4eQt8FJrTICy/PA02cLh8l7hrETEUuJZIQlAbfM5GHxV
	EJHyDQP4QNk93XC0ANnLhpg5ipTEXWY17Kxt7NoGAQBP6kIoUiZJL9wPCfOSxiTjchXK
	D8xF1X0jVLAawSk0o2jtSkCpIW6wYUfDLBKpTs9e28NJjLxdWrDzMyGj3GjRbGGdHPQE
	8Cb+M13pmqpQuZyhmepbJrUpS024/IfEVXCl67V4w9eklT51WbPuc5Yz6qEVzmf24q7k
	nW+vZerCNRoB6Qstm84riTH6ReZUOzN4zj4c0IMy+9LcL9nTynrCvv+dY1iBT2GNTDOi
	eTFw==
X-Received: by 10.107.12.93 with SMTP id w90mr17481605ioi.10.1428341729245;
	Mon, 06 Apr 2015 10:35:29 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id l6sm3122607igv.8.2015.04.06.10.35.27
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Apr 2015 10:35:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Apr 2015 17:35:18 +0000
Message-Id: <cover.1428341477.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 00/24] Upgrade binutils,gdb,gcc-4.8
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
X-List-Received-Date: Mon, 06 Apr 2015 17:35:29 -0000

Mainly it does following

Upgrade gcc-4.8, binutils, gdb to latest releases
Upgrade recipes e.g. ncurses to help gcc5 migration
Fix recipes to build with gcc5 and on musl libc
Add missing license for BSD claus 0
change mounting /var/volatile based on ro-rfs

Khem Raj (23):
  ncurses: Upgrade 4.9 stable to latest patchlevel 20150329
  mtd-utils: update to latest and fix static inlining
  binutils: Fix ICE in gold
  binuitls: Switch to using binutils stable/2.25 branch
  gdb: Upgrade 7.8.1 -> 7.9
  binutils: Fix linking issue for R_ARM_REL32 relocs
  var/volatile: Mount it if doing ro-rfs
  gcc-4.8: Upgrade 4.8.2 -> 4.8.4
  quota: Upgrade quota_4.01.bb -> quota_4.02.bb
  util-linux: Upgrade to 2.26
  libusb-compat: Include sys/types.h in usb.h
  libdaemon: Explicitly include unisttd.h instead of sys/unistd.h
  common-licenses: Add BSD-0-Clause
  libffi: Use proper compiler define for linux platform
  quota: Fix build with musl
  bluez4: Fix encrypt symbol namespace collision
  mesa: Fix building with musl
  at-spi2-core: Add nls.m4 from gettext
  ofono: Disable backtrace for non-glibc libraries
  pixman,libpciaccess: Fix build on musl
  wpa-supplicant: Replace non-standard base defines with c99 compliant
    ones
  libxml2: Contain glibc-extentions under __GLIBC__
  rpcbind: Fix build with musl

Robert Yang (1):
  binutils: upgrade to 2.25

 meta/classes/image.bbclass                         |     1 +
 meta/conf/distro/include/tcmode-default.inc        |     4 +-
 meta/files/common-licenses/BSD-0-Clause            |    12 +
 .../bluez/bluez4-4.101/fix_encrypt_collision.patch |   110 +
 meta/recipes-connectivity/bluez/bluez4_4.101.bb    |     1 +
 ...cktrace-Disable-for-non-glibc-C-libraries.patch |    40 +
 meta/recipes-connectivity/ofono/ofono_1.16.bb      |     1 +
 .../wpa-supplicant/wpa-supplicant.inc              |     1 +
 .../0001-linux_wext-Fix-types-for-musl.patch       |    38 +
 meta/recipes-core/base-files/base-files/fstab      |     1 -
 .../initscripts-1.0/read-only-rootfs-hook.sh       |     2 +-
 ...ine-pthread-definitions-for-glibc-complia.patch |    32 +
 meta/recipes-core/libxml/libxml2_2.9.2.bb          |     4 +-
 meta/recipes-core/ncurses/ncurses.inc              |    14 +-
 meta/recipes-core/ncurses/ncurses_5.9.bb           |     8 +-
 .../systemd/systemd/journald-volatile.conf         |     6 +
 .../util-linux/util-linux/CVE-2014-9114.patch      |   174 -
 .../{util-linux_2.25.2.bb => util-linux_2.26.1.bb} |    15 +-
 meta/recipes-devtools/binutils/binutils-2.24.inc   |    46 -
 meta/recipes-devtools/binutils/binutils-2.25.inc   |    40 +
 ...ian_2.24.bb => binutils-cross-canadian_2.25.bb} |     0
 ...nutils-cross_2.24.bb => binutils-cross_2.25.bb} |     0
 ...-crosssdk_2.24.bb => binutils-crosssdk_2.25.bb} |     2 +-
 ...ild-breakage-from-bfd_set_section_vma-cha.patch |    31 -
 ....patch => 0001-Generate-relocatable-SDKs.patch} |    45 +-
 ...1-gold-arm-Skip-pic-check-for-R_ARM_REL32.patch |    25 +
 ...re-widen-the-regexp-for-SH-architectures.patch} |    42 +-
 .../0003-Point-scripts-location-to-libdir.patch    |    42 +
 ...te-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch |    41 +
 ...0005-Explicitly-link-with-libm-on-uclibc.patch} |    38 +-
 ...2.4-update.patch => 0006-Use-libtool-2.4.patch} | 33152 ++++++++++---------
 ...-Add-the-armv5e-architecture-to-binutils.patch} |    34 +-
 ...e-distro-compiler-point-to-the-wrong-ins.patch} |    33 +-
 ...tus-Inappropriate-distribution-codesourc.patch} |   219 +-
 ...rpath-in-libtool-when-sysroot-is-enabled.patch} |    25 +-
 ...Change-default-emulation-for-mips64-linux.patch |    59 +
 ...tch => 0012-Add-XLP-instructions-support.patch} |   328 +-
 ...rnal-error-in-do_print_to_mapfile-seen-wi.patch |    35 +
 ...binutils-uclibc-300-001_ld_makefile_patch.patch |    55 -
 ...binutils-uclibc-300-006_better_file_error.patch |    45 -
 ...ils-uclibc-300-012_check_ldrunpath_length.patch |    49 -
 .../binutils/binutils-uninitialised-warning.patch  |    50 -
 .../binutils/binutils/binutils_CVE-2014-8484.patch |    67 -
 .../binutils/binutils/binutils_CVE-2014-8485.patch |   102 -
 .../binutils/binutils/binutils_CVE-2014-8501.patch |    60 -
 .../binutils/binutils/binutils_CVE-2014-8502.patch |    89 -
 .../binutils/binutils_CVE-2014-8502_1.patch        |   523 -
 .../binutils/binutils/binutils_CVE-2014-8503.patch |    47 -
 .../binutils/binutils/binutils_CVE-2014-8504.patch |    75 -
 .../binutils/binutils/binutils_CVE-2014-8737.patch |   177 -
 .../binutils/binutils/fix-pr15815.patch            |    36 -
 .../binutils/binutils/fix-pr16428.patch            |   123 -
 .../binutils/binutils/fix-pr16476.patch            |   220 -
 .../binutils/binutils/fix-pr2404.patch             |    76 -
 .../binutils/mips64-default-ld-emulation.patch     |    54 -
 .../replace_macros_with_static_inline.patch        |   188 -
 .../{binutils_2.24.bb => binutils_2.25.bb}         |     0
 meta/recipes-devtools/gcc/gcc-4.8.inc              |    13 +-
 .../0016-gcc-poison-system-directories.patch       |    95 +-
 .../gcc/gcc-4.8/0019-64-bit-multilib-hack.patch    |    41 +-
 ...C_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |   101 +-
 .../gcc/gcc-4.8/0038-gcc-4.8-build-args.patch      |    63 +-
 .../gcc/gcc-4.8/0039-gcc-4.8-PR57717.patch         |    23 -
 .../0045-gcc-4.8-PR57717-PowerPC-E500v2.patch      |    21 -
 .../0048-PR58854_fix_arm_apcs_epilogue.patch       |    23 -
 .../gcc/gcc-4.8/0050-PR-target-58595.patch         |   132 -
 .../gcc-4.8/0052-PR-rtl-optimization-61801.patch   |    36 -
 .../gdb/{gdb-7.8.1.inc => gdb-7.9.inc}             |     4 +-
 ...canadian_7.8.1.bb => gdb-cross-canadian_7.9.bb} |     0
 meta/recipes-devtools/gdb/gdb-cross_7.8.1.bb       |     4 -
 meta/recipes-devtools/gdb/gdb-cross_7.9.bb         |     4 +
 meta/recipes-devtools/gdb/gdb.inc                  |     5 +-
 ...0001-make-man-install-relative-to-DESTDIR.patch |    28 +
 ...last.diff => 0002-Change-order-of-CFLAGS.patch} |    33 +-
 ...-support-for-Renesas-SH-sh4-architecture.patch} |   854 +-
 .../gdb/0004-Change-comment-in-gdb-compile.patch   |    48 +
 .../recipes-devtools/gdb/gdb/sim-install-6.6.patch |    14 -
 meta/recipes-devtools/gdb/gdb/sim-install.patch    |    36 -
 meta/recipes-devtools/gdb/gdb/uclibc.patch         |   196 -
 .../gdb/{gdb_7.8.1.bb => gdb_7.9.bb}               |     0
 ...emove-duplicate-hashtable_iterator_value-.patch |    56 +
 meta/recipes-devtools/mtd/mtd-utils_git.bb         |     1 +
 meta/recipes-extended/quota/quota/fcntl.patch      |   113 +
 .../quota/quota/remove_non_posix_types.patch       |   185 +
 .../quota/quota/replace_getrpcbynumber_r.patch     |    20 +
 .../quota/{quota_4.01.bb => quota_4.02.bb}         |    20 +-
 ...001-Avoid-use-of-glibc-sys-cdefs.h-header.patch |   224 +
 .../rpcbind/0002-uclibc-rpcsvc-defines.patch       |     6 +-
 .../rpcbind/rpcbind/musl-sunrpc.patch              |    29 +
 .../rpcbind/rpcbind/remove-sys-queue.patch         |    22 +
 meta/recipes-extended/rpcbind/rpcbind_0.2.2.bb     |     6 +
 ...ps-Use-compiler-internal-define-for-linux.patch |    32 +
 meta/recipes-gnome/libffi/libffi_3.2.1.bb          |     4 +-
 ...D_MUTEX_RECURSIVE_NP-is-specific-to-glibc.patch |    29 +
 ...002-mesa-simplify-detection-of-fpclassify.patch |    53 +
 meta/recipes-graphics/mesa/mesa_10.4.4.bb          |     5 +-
 .../xorg-lib/libpciaccess/limits.patch             |    17 +
 .../xorg-lib/libpciaccess_0.13.3.bb                |     2 +
 .../xorg-lib/pixman/asm_include.patch              |    29 +
 meta/recipes-graphics/xorg-lib/pixman_0.32.6.bb    |     1 +
 .../0001-nls.m4-Take-it-from-gettext-0.15.patch    |    54 +
 meta/recipes-support/atk/at-spi2-core_2.14.1.bb    |     4 +-
 .../libdaemon/libdaemon/fix-includes.patch         |    20 +
 meta/recipes-support/libdaemon/libdaemon_0.14.bb   |     4 +-
 .../0001-usb.h-Include-sys-types.h.patch           |    30 +
 meta/recipes-support/libusb/libusb-compat_0.1.5.bb |     4 +-
 106 files changed, 18982 insertions(+), 20499 deletions(-)
 create mode 100644 meta/files/common-licenses/BSD-0-Clause
 create mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/fix_encrypt_collision.patch
 create mode 100644 meta/recipes-connectivity/ofono/ofono/0001-backtrace-Disable-for-non-glibc-C-libraries.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-linux_wext-Fix-types-for-musl.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/0001-threads-Define-pthread-definitions-for-glibc-complia.patch
 create mode 100644 meta/recipes-core/systemd/systemd/journald-volatile.conf
 delete mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2014-9114.patch
 rename meta/recipes-core/util-linux/{util-linux_2.25.2.bb => util-linux_2.26.1.bb} (66%)
 delete mode 100644 meta/recipes-devtools/binutils/binutils-2.24.inc
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.25.inc
 rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.24.bb => binutils-cross-canadian_2.25.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-cross_2.24.bb => binutils-cross_2.25.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.24.bb => binutils-crosssdk_2.25.bb} (84%)
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0001-Fix-MMIX-build-breakage-from-bfd_set_section_vma-cha.patch
 rename meta/recipes-devtools/binutils/binutils/{relocatable_sdk.patch => 0001-Generate-relocatable-SDKs.patch} (56%)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0001-gold-arm-Skip-pic-check-for-R_ARM_REL32.patch
 rename meta/recipes-devtools/binutils/binutils/{binutils-uclibc-100-uclibc-conf.patch => 0002-configure-widen-the-regexp-for-SH-architectures.patch} (41%)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0003-Point-scripts-location-to-libdir.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0004-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
 rename meta/recipes-devtools/binutils/binutils/{binutils-uclibc-gas-needs-libm.patch => 0005-Explicitly-link-with-libm-on-uclibc.patch} (49%)
 rename meta/recipes-devtools/binutils/binutils/{libtool-2.4-update.patch => 0006-Use-libtool-2.4.patch} (94%)
 rename meta/recipes-devtools/binutils/binutils/{binutils-armv5e.patch => 0007-Add-the-armv5e-architecture-to-binutils.patch} (43%)
 rename meta/recipes-devtools/binutils/binutils/{libiberty_path_fix.patch => 0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch} (43%)
 rename meta/recipes-devtools/binutils/binutils/{binutils-poison.patch => 0009-Upstream-Status-Inappropriate-distribution-codesourc.patch} (69%)
 rename meta/recipes-devtools/binutils/binutils/{libtool-rpath-fix.patch => 0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch} (74%)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0011-Change-default-emulation-for-mips64-linux.patch
 rename meta/recipes-devtools/binutils/binutils/{binutils-xlp-support.patch => 0012-Add-XLP-instructions-support.patch} (59%)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0013-Fix-an-internal-error-in-do_print_to_mapfile-seen-wi.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/binutils-uclibc-300-001_ld_makefile_patch.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/binutils-uclibc-300-006_better_file_error.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/binutils-uclibc-300-012_check_ldrunpath_length.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/binutils-uninitialised-warning.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8484.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8485.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8501.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8502.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8502_1.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8503.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8504.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8737.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/fix-pr15815.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/fix-pr16428.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/fix-pr16476.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/fix-pr2404.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/mips64-default-ld-emulation.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/replace_macros_with_static_inline.patch
 rename meta/recipes-devtools/binutils/{binutils_2.24.bb => binutils_2.25.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0039-gcc-4.8-PR57717.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0045-gcc-4.8-PR57717-PowerPC-E500v2.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0048-PR58854_fix_arm_apcs_epilogue.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0050-PR-target-58595.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0052-PR-rtl-optimization-61801.patch
 rename meta/recipes-devtools/gdb/{gdb-7.8.1.inc => gdb-7.9.inc} (68%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.8.1.bb => gdb-cross-canadian_7.9.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gdb/gdb-cross_7.8.1.bb
 create mode 100644 meta/recipes-devtools/gdb/gdb-cross_7.9.bb
 create mode 100644 meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.patch
 rename meta/recipes-devtools/gdb/gdb/{gdbserver-cflags-last.diff => 0002-Change-order-of-CFLAGS.patch} (42%)
 rename meta/recipes-devtools/gdb/gdb/{renesas-sh-native-support.patch => 0003-Add-support-for-Renesas-SH-sh4-architecture.patch} (57%)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0004-Change-comment-in-gdb-compile.patch
 delete mode 100644 meta/recipes-devtools/gdb/gdb/sim-install-6.6.patch
 delete mode 100644 meta/recipes-devtools/gdb/gdb/sim-install.patch
 delete mode 100644 meta/recipes-devtools/gdb/gdb/uclibc.patch
 rename meta/recipes-devtools/gdb/{gdb_7.8.1.bb => gdb_7.9.bb} (100%)
 create mode 100644 meta/recipes-devtools/mtd/mtd-utils/0001-hashtable-Remove-duplicate-hashtable_iterator_value-.patch
 create mode 100644 meta/recipes-extended/quota/quota/fcntl.patch
 create mode 100644 meta/recipes-extended/quota/quota/remove_non_posix_types.patch
 create mode 100644 meta/recipes-extended/quota/quota/replace_getrpcbynumber_r.patch
 rename meta/recipes-extended/quota/{quota_4.01.bb => quota_4.02.bb} (59%)
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/0001-Avoid-use-of-glibc-sys-cdefs.h-header.patch
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/musl-sunrpc.patch
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/remove-sys-queue.patch
 create mode 100644 meta/recipes-gnome/libffi/libffi/0001-mips-Use-compiler-internal-define-for-linux.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa/0001-PTHREAD_MUTEX_RECURSIVE_NP-is-specific-to-glibc.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa/0002-mesa-simplify-detection-of-fpclassify.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libpciaccess/limits.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/pixman/asm_include.patch
 create mode 100644 meta/recipes-support/atk/at-spi2-core/0001-nls.m4-Take-it-from-gettext-0.15.patch
 create mode 100644 meta/recipes-support/libdaemon/libdaemon/fix-includes.patch
 create mode 100644 meta/recipes-support/libusb/libusb-compat/0001-usb.h-Include-sys-types.h.patch

-- 
2.1.4



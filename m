Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web10.10233.1608736733177759099
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 07:18:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: yM2jCSi/A/UOnaChiInuZaKH3YPrdb+Aw/bGuctfJeMRU0SqKikZ/8GVSjLcdUc5Jyt1sh3hmO
 9tkRty/v0L6w==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="155235933"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="155235933"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:18:52 -0800
IronPort-SDR: jHypQCOiJ5AF4GVveL+IlYI10Ay9zWq+VYVhqgHc2JhCkjjSizEScvIx4VIx8Mt6+hCI9RlekB
 YW3jis+lN6SA==
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="374027466"
Received: from btang1-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.75.173])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:18:51 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 00/35] patch review request
Date: Wed, 23 Dec 2020 23:18:10 +0800
Message-Id: <cover.1608735614.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review these next set of changes for gatesgarth. Builds cleanly
on autobuilder except for two intermittent failures while executing tests
for qemumips for which we already have a bug.

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1696

Thanks,

Anuj

The following changes since commit 18642d02ec492366199cf10c0af7fd70224b3c79:

  wireless-regdb: upgrade 2020.04.29 -> 2020.11.20 (2020-12-10 09:20:06 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/gatesgarth

Alexander Kanavin (6):
  linux-firmware: upgrade 20200817 -> 20201022
  ruby: fix reproducibility
  ffmpeg: fix reproducibility
  kea: fix reproducibility
  go: upgrade 1.15.2 -> 1.15.3
  valgrind: exclude bar_bad/bar_bad_xml from ptests

Bruce Ashfield (3):
  linux-yocto-rt/5.4: update to -rt44
  linux-yocto/5.4: update to v5.4.80
  lttng-modules: fix build against v5.10+

Changqing Li (1):
  timezone: upgrade to 2020d

Dmitry Baryshkov (5):
  linux-firmware: upgrade 20201022 -> 20201118
  linux-firmware: package ath11k firmware
  linux-firmware: upgrade 20201118 -> 20201218
  linux-firmware: package firmware for Lontium lt9611uxc bridge
  perl: fix installation failure because of shell issue

Jose Quaresma (1):
  ffmpeg: add srt package config knob

Khairul Rohaizzat Jamaluddin (1):
  go: Update 1.15.5 -> 1.15.6

Khem Raj (2):
  go: Update to 1.15.5
  go.bbclass: Use external linker for native packages

Mark Jonas (1):
  parted: Make readline dependency optional

Nathan Rossi (1):
  gcc: Add patch to resolve i*86 tune configuration overrides

Peter Kjellerstedt (2):
  glibc: Make adjtime() for 32 bit support being called with delta ==
    NULL
  apr-util: Only specify --with-dbm=gdbm if gdbm support is enabled

Richard Purdie (7):
  cups: Mark CVE-2009-0032 as a non-issue
  cups: Mark CVE-2008-1033 as a non-issue
  grub: Fix build reproducibility issue
  grub: Add second fix for determinism issue
  u-boot-tools: Fix reproducibility issue
  groff: Fix reproducibility issue
  man-db: Avoid reproducibility failures after fixing groff-native

Robert Yang (3):
  ncurses: Make ncurses-tools depend on ncurses-terminfo-base
  minicom: RDEPENDS on ncurses-terminfo-base
  archiver.bbclass: Fix --runall=deploy_archives for images

Steve Sakoman (1):
  cups: whitelist CVE-2018-6553

Zhixiong Chi (1):
  glibc: CVE-2020-29562 and CVE-2020-29573

 meta/classes/archiver.bbclass                 |   1 +
 meta/classes/go.bbclass                       |   1 +
 meta/recipes-bsp/grub/files/determinism.patch |  40 ++++
 meta/recipes-bsp/grub/grub2.inc               |   1 +
 meta/recipes-bsp/u-boot/u-boot-tools.inc      |  15 ++
 ...er_unittest_support.cc-do-not-write-.patch |  27 +++
 meta/recipes-connectivity/kea/kea_1.7.10.bb   |  29 +--
 ...-adjtime-with-NULL-argument-BZ-26833.patch | 110 ++++++++++
 .../glibc/glibc/CVE-2020-29562.patch          | 155 ++++++++++++++
 .../glibc/glibc/CVE-2020-29573.patch          |  56 +++++
 meta/recipes-core/glibc/glibc_2.32.bb         |   3 +
 meta/recipes-core/ncurses/ncurses.inc         |   2 +-
 meta/recipes-devtools/gcc/gcc-10.2.inc        |   1 +
 ...0001-lib-Remove-i-86-march-overrides.patch | 113 ++++++++++
 meta/recipes-devtools/go/go-1.15.inc          |   5 +-
 ...e_1.15.2.bb => go-binary-native_1.15.6.bb} |   4 +-
 meta/recipes-devtools/go/go-runtime_1.15.bb   |   1 +
 meta/recipes-devtools/go/go_1.15.bb           |   3 +
 meta/recipes-devtools/perl/perl_5.32.0.bb     |   5 +-
 ...e.in-do-not-write-host-cross-cc-item.patch |  32 +++
 meta/recipes-devtools/ruby/ruby_2.7.1.bb      |   1 +
 .../valgrind/valgrind/remove-for-aarch64      |   2 -
 .../valgrind/valgrind/remove-for-all          |   2 +
 .../valgrind/valgrind/run-ptest               |  10 +
 .../valgrind/valgrind_3.16.1.bb               |   2 +
 meta/recipes-extended/cups/cups.inc           |   7 +
 meta/recipes-extended/groff/groff_1.22.4.bb   |   2 +-
 meta/recipes-extended/man-db/man-db_2.9.3.bb  |   5 +
 .../recipes-extended/minicom/minicom_2.7.1.bb |   2 +
 meta/recipes-extended/parted/parted_3.3.bb    |   5 +-
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 ...20200817.bb => linux-firmware_20201218.bb} |  21 +-
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 ...jtool-Rename-frame.h-objtool.h-v5.10.patch |  88 ++++++++
 ...rdered-extent-tracepoint-take-btrfs_.patch | 179 ++++++++++++++++
 ...ext4-fast-commit-recovery-path-v5.10.patch |  99 +++++++++
 ...x86-mmu-Add-TDP-MMU-PF-handler-v5.10.patch |  82 ++++++++
 ...int-Optimize-using-static_call-v5.10.patch | 196 ++++++++++++++++++
 ...defined-symbols-caused-by-incorrect-.patch |  55 +++++
 .../lttng/lttng-modules_2.12.3.bb             |  10 +-
 ...uild-fail-when-used-the-libsrt-1.4.1.patch |  52 +++++
 ...e-assembly-with-full-path-from-sourc.patch |  97 +++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb |   8 +
 meta/recipes-support/apr/apr-util_1.6.1.bb    |   5 +-
 46 files changed, 1523 insertions(+), 53 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/determinism.patch
 create mode 100644 meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0031-linux-Allow-adjtime-with-NULL-argument-BZ-26833.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-29562.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-29573.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0001-lib-Remove-i-86-march-overrides.patch
 rename meta/recipes-devtools/go/{go-binary-native_1.15.2.bb => go-binary-native_1.15.6.bb} (83%)
 create mode 100644 meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/remove-for-all
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20200817.bb => linux-firmware_20201218.bb} (98%)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0007-fix-objtool-Rename-frame.h-objtool.h-v5.10.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0009-fix-btrfs-make-ordered-extent-tracepoint-take-btrfs_.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0010-fix-ext4-fast-commit-recovery-path-v5.10.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0012-fix-kvm-x86-mmu-Add-TDP-MMU-PF-handler-v5.10.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0014-fix-tracepoint-Optimize-using-static_call-v5.10.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0016-fix-statedump-undefined-symbols-caused-by-incorrect-.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-lavf-srt-fix-build-fail-when-used-the-libsrt-1.4.1.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libavutil-include-assembly-with-full-path-from-sourc.patch

-- 
2.29.2


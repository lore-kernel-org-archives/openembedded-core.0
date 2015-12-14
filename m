Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8A2A5608B7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 06:23:03 +0000 (UTC)
Received: by qget30 with SMTP id t30so4502087qge.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Dec 2015 22:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=G7pjJvwGoyXfezmQ8uE9MonT7kb5tfBah0eBjFdBimE=;
	b=k6Clzb51O2JUuQr7haknFrIFEC9GSx6g8RhIh9FfO/ysvQO0QiB7FeAgQ9idvjTpJs
	n2NBr4MZH7lfrxFBhFgdS1kD2cF+cLm3Qqx3qytLhUjEQCyZaa8tx0FhfX9A0RXWwgou
	31nDBWKPohMQXzKjI3YlwchIbxlS+T4xGcn5YMSaJ/g05NoVNYWxwgaM0azGFJk/RMCj
	Se0shy59Ye2mPzU+jFeZsEvpf1FcX3d+nWhOI5cTghYE7zwQiudktYBybv3dl5gebeFE
	l1d9LuFSyvqGHBhBpxOR+UEU8PLVHKTXeer1evzitmzPXR4+i7u6zgl0MFja8AAOT/Vc
	uwYQ==
X-Received: by 10.140.101.130 with SMTP id u2mr39865480qge.2.1450074184509;
	Sun, 13 Dec 2015 22:23:04 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	r206sm2412915qhr.30.2015.12.13.22.23.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Dec 2015 22:23:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 06:22:57 +0000
Message-Id: <cover.1450073907.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH 0/6] gcc/uclibc/musl updates
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
X-List-Received-Date: Mon, 14 Dec 2015 06:23:05 -0000

This patchset contains gcc5 minor upgrade to 5.3
uclibc switches to use uclibc-ng,which is a maintained fork of uclibc
musl is updated past 1.1.12 release
systemd upgrades to 228
It has been tested on uclibc/systemd and musl/sysvinit combination with core-image-minimal
for glibc based system a world build on qemuarm64 and qemux86-64 has been done

The following changes since commit 8807f4fd8a9ccdcdec016d87fd18fd0717f35dca:

  lttng-tools: Revert wrong enforcement of Python 3.0 use (2015-12-12 23:31:45 +0000)

are available in the git repository at:

  git://github.com/kraj/openembedded-core kraj/gcc-musl-uclibc-updates
  https://github.com/kraj/openembedded-core/tree/kraj/gcc-musl-uclibc-updates

Khem Raj (6):
  gcc5: Upgrade gcc-5.2 -> gcc-5.3
  uclibc: Switch to using uclibc-ng
  packagegroup-core-sdk: Disable sanitizers for uclibc
  util-linux: Upgrade to 2.27.1
  systemd: Upgrade to 228
  musl: Update to latest 1.1.12 release

 meta/conf/distro/include/tcmode-default.inc        |   2 +-
 meta/recipes-core/musl/musl_git.bb                 |   6 +-
 .../packagegroups/packagegroup-core-sdk.bb         |   1 +
 .../systemd/0001-define-exp10-if-missing.patch     |  33 +++
 .../systemd/0001-fix-build-on-uClibc-exp10.patch   |  22 --
 ...-getty-to-agetty-in-console-setup-system.patch} |   6 +-
 ...v-when-secure-versions-are-not-available.patch} |  11 +-
 ...c-Change-the-default-device-timeout-to-2.patch} |  22 +-
 ...-install-dependency-links-at-install-tim.patch} |  35 ++--
 ...eck-for-additional-features-that-uclibc-.patch} |  17 +-
 ...nal-Use-posix-fallocate-only-if-available.patch |  96 ---------
 ...n-Use-execvpe-only-when-libc-supports-it.patch} |  31 +--
 ...til-Use-mkostemp-only-if-libc-supports-it.patch |  42 ----
 ...-unimplemented-_SC_PHYS_PAGES-system-conf.patch |  16 +-
 ...009-implment-systemd-sysv-install-for-OE.patch} |  15 +-
 ...nes-Build-conditionally-when-HAVE_MYHOSTN.patch |  38 ++++
 ...patch => 0011-rules-whitelist-hd-devices.patch} |   6 +-
 ...or-add-support-for-executing-scripts-und.patch} |  68 +++---
 ...-Make-root-s-home-directory-configurable.patch} | 147 ++++++-------
 ...014-systemd-user-avoid-using-system-auth.patch} |  25 ++-
 ...vert-rules-remove-firmware-loading-rules.patch} |   6 +-
 ...remove-userspace-firmware-loading-suppor.patch} | 132 ++++++------
 .../systemd/{systemd_225.bb => systemd_228.bb}     |  44 ++--
 meta/recipes-core/uclibc/uclibc-config.inc         |   1 +
 meta/recipes-core/uclibc/uclibc-git.inc            |  21 +-
 ...ert-glibc-compat-bump-glibc-minor-version.patch |  26 +++
 ...-AT_EMPTY_PATH-for-all-and-O_PATH-for-arm.patch |  42 ----
 ...zes-away-the-write-only-static-functions-.patch |  51 -----
 .../uclibc/uclibc-git/0001-wire-in-syncfs.patch    |  49 -----
 ...t-localised-optimizations-this-helps-to-h.patch |  30 ---
 .../0005-Always-use-O2-for-compiling-fork.c.patch  |  33 ---
 ...-ldso-limited-support-for-ORIGIN-in-rpath.patch | 233 ---------------------
 ...rk-Hide-pthread_atfork-in-shared-versions.patch |  35 ----
 ...stdlib-canonicalize_file_name-memory-leak.patch |  36 ++++
 meta/recipes-core/uclibc/uclibc-git/uClibc.distro  |   4 +-
 meta/recipes-core/uclibc/uclibc.inc                |   8 +-
 meta/recipes-core/uclibc/uclibc_git.bb             |   5 +
 .../util-linux/util-linux/fix-parallel-build.patch |  35 ----
 .../util-linux/uclibc-__progname-conflict.patch    |  32 ---
 .../util-linux-ng-replace-siginterrupt.patch       |  33 ---
 .../{util-linux_2.26.2.bb => util-linux_2.27.1.bb} |  11 +-
 .../gcc/gcc-5.2/0037-pr65779.patch                 | 173 ---------------
 .../gcc/gcc-5.2/0043-fix-arm-thumb.patch           |  39 ----
 .../gcc/{gcc-5.2.inc => gcc-5.3.inc}               |  31 +--
 .../0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch     |  10 +-
 .../{gcc-5.2 => gcc-5.3}/0002-uclibc-conf.patch    |   6 +-
 .../0003-gcc-uclibc-locale-ctype_touplow_t.patch   |   6 +-
 .../{gcc-5.2 => gcc-5.3}/0004-uclibc-locale.patch  |  18 +-
 .../0005-uclibc-locale-no__x.patch                 |   6 +-
 .../0006-uclibc-locale-wchar_fix.patch             |   6 +-
 .../0007-uclibc-locale-update.patch                |   6 +-
 .../0008-missing-execinfo_h.patch                  |   6 +-
 .../{gcc-5.2 => gcc-5.3}/0009-c99-snprintf.patch   |   6 +-
 .../0010-gcc-poison-system-directories.patch       |  26 +--
 .../0011-gcc-poison-dir-extend.patch               |   6 +-
 .../0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |   8 +-
 .../0013-64-bit-multilib-hack.patch                |   6 +-
 .../0014-optional-libstdc.patch                    |  12 +-
 ...0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |  14 +-
 .../0016-COLLECT_GCC_OPTIONS.patch                 |   6 +-
 ...efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch |  14 +-
 .../0018-fortran-cross-compile-hack.patch          |  10 +-
 .../0019-libgcc-sjlj-check.patch                   |  10 +-
 .../0020-cpp-honor-sysroot.patch                   |   6 +-
 .../0021-MIPS64-Default-to-N64-ABI.patch           |  10 +-
 ...C_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |   8 +-
 ...0023-gcc-Fix-argument-list-too-long-error.patch |  10 +-
 .../{gcc-5.2 => gcc-5.3}/0024-Disable-sdt.patch    |  22 +-
 .../gcc/{gcc-5.2 => gcc-5.3}/0025-libtool.patch    |   6 +-
 ...4-pass-fix-v4bx-to-linker-to-support-EABI.patch |   6 +-
 ...tilib-config-files-from-B-instead-of-usin.patch |  14 +-
 ...-libdir-from-.la-which-usually-points-to-.patch |   6 +-
 .../gcc/{gcc-5.2 => gcc-5.3}/0029-export-CPP.patch |   6 +-
 ...AltiVec-generation-on-powepc-linux-target.patch |  10 +-
 ...-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch |   6 +-
 ...Ensure-target-gcc-headers-can-be-included.patch |  10 +-
 ...-t-build-with-disable-dependency-tracking.patch |   6 +-
 ...h-host-directory-during-relink-if-inst_pr.patch |   6 +-
 ...-link-the-plugins-with-libgomp-explicitly.patch |   6 +-
 ...IBS_DIR-replacement-instead-of-hardcoding.patch |   8 +-
 .../0037-aarch64-Add-support-for-musl-ldso.patch   |  26 +++
 .../0038-fix-g-sysroot.patch}                      |  32 ++-
 ...ibcc1-fix-libcc1-s-install-path-and-rpath.patch |  11 +-
 ...handle-sysroot-support-for-nativesdk-gcc.patch} |  21 +-
 ...t-sysroot-gcc-version-specific-dirs-with.patch} |  38 ++--
 ...various-_FOR_BUILD-and-related-variables.patch} |  24 ++-
 .../0043-libstdc-Support-musl.patch}               |  22 +-
 ...-as-a-musl-libc-specifier-and-the-necess.patch} | 149 ++++++-------
 .../0045-Support-for-arm-linux-musl.patch}         | 146 +++++++------
 ...t-rid-of-ever-broken-fixincludes-on-musl.patch} |  22 +-
 ...s-canadian_5.2.bb => gcc-cross-canadian_5.3.bb} |   0
 ...oss-initial_5.2.bb => gcc-cross-initial_5.3.bb} |   0
 .../gcc/{gcc-cross_5.2.bb => gcc-cross_5.3.bb}     |   0
 ...-initial_5.2.bb => gcc-crosssdk-initial_5.3.bb} |   0
 .../{gcc-crosssdk_5.2.bb => gcc-crosssdk_5.3.bb}   |   0
 meta/recipes-devtools/gcc/gcc-runtime.inc          |   4 +-
 .../gcc/{gcc-runtime_5.2.bb => gcc-runtime_5.3.bb} |   0
 ...gcc-sanitizers_5.2.bb => gcc-sanitizers_5.3.bb} |   0
 .../gcc/{gcc-source_5.2.bb => gcc-source_5.3.bb}   |   0
 .../gcc/{gcc_5.2.bb => gcc_5.3.bb}                 |   0
 ...libgcc-initial_5.2.bb => libgcc-initial_5.3.bb} |   0
 .../gcc/{libgcc_5.2.bb => libgcc_5.3.bb}           |   0
 .../gcc/{libgfortran_5.2.bb => libgfortran_5.3.bb} |   0
 103 files changed, 947 insertions(+), 1625 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-define-exp10-if-missing.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-fix-build-on-uClibc-exp10.patch
 rename meta/recipes-core/systemd/systemd/{0001-units-Prefer-getty-to-agetty-in-console-setup-system.patch => 0002-units-Prefer-getty-to-agetty-in-console-setup-system.patch} (89%)
 rename meta/recipes-core/systemd/systemd/{0022-Use-getenv-when-secure-versions-are-not-available.patch => 0003-Use-getenv-when-secure-versions-are-not-available.patch} (79%)
 rename meta/recipes-core/systemd/systemd/{qemuall_io_latency-core-device.c-Change-the-default-device-timeout-to-2.patch => 0004-core-device.c-Change-the-default-device-timeout-to-2.patch} (65%)
 rename meta/recipes-core/systemd/systemd/{0003-binfmt-Don-t-install-dependency-links-at-install-tim.patch => 0005-binfmt-Don-t-install-dependency-links-at-install-tim.patch} (65%)
 rename meta/recipes-core/systemd/systemd/{0004-configure-Check-for-additional-features-that-uclibc-.patch => 0006-configure-Check-for-additional-features-that-uclibc-.patch} (76%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0006-journal-Use-posix-fallocate-only-if-available.patch
 rename meta/recipes-core/systemd/systemd/{0005-nspawn-Use-execvpe-only-when-libc-supports-it.patch => 0007-nspawn-Use-execvpe-only-when-libc-supports-it.patch} (50%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0007-util-Use-mkostemp-only-if-libc-supports-it.patch
 rename meta/recipes-core/systemd/systemd/{0012-implment-systemd-sysv-install-for-OE.patch => 0009-implment-systemd-sysv-install-for-OE.patch} (75%)
 create mode 100644 meta/recipes-core/systemd/systemd/0010-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch
 rename meta/recipes-core/systemd/systemd/{rules-whitelist-hd-devices.patch => 0011-rules-whitelist-hd-devices.patch} (90%)
 rename meta/recipes-core/systemd/systemd/{0009-sysv-generator-add-support-for-executing-scripts-und.patch => 0012-sysv-generator-add-support-for-executing-scripts-und.patch} (77%)
 rename meta/recipes-core/systemd/systemd/{0010-Make-root-s-home-directory-configurable.patch => 0013-Make-root-s-home-directory-configurable.patch} (64%)
 rename meta/recipes-core/systemd/systemd/{0011-systemd-user-avoid-using-system-auth.patch => 0014-systemd-user-avoid-using-system-auth.patch} (54%)
 rename meta/recipes-core/systemd/systemd/{0014-Revert-rules-remove-firmware-loading-rules.patch => 0015-Revert-rules-remove-firmware-loading-rules.patch} (83%)
 rename meta/recipes-core/systemd/systemd/{0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch => 0016-Revert-udev-remove-userspace-firmware-loading-suppor.patch} (79%)
 rename meta/recipes-core/systemd/{systemd_225.bb => systemd_228.bb} (93%)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-Revert-glibc-compat-bump-glibc-minor-version.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-fcntl-Add-AT_EMPTY_PATH-for-all-and-O_PATH-for-arm.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-gcc5-optimizes-away-the-write-only-static-functions-.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-wire-in-syncfs.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0004-Dont-support-localised-optimizations-this-helps-to-h.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0005-Always-use-O2-for-compiling-fork.c.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0006-ldso-limited-support-for-ORIGIN-in-rpath.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0007-nptl-atfork-Hide-pthread_atfork-in-shared-versions.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/libc-stdlib-canonicalize_file_name-memory-leak.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/fix-parallel-build.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/uclibc-__progname-conflict.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/util-linux-ng-replace-siginterrupt.patch
 rename meta/recipes-core/util-linux/{util-linux_2.26.2.bb => util-linux_2.27.1.bb} (72%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-5.2/0037-pr65779.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-5.2/0043-fix-arm-thumb.patch
 rename meta/recipes-devtools/gcc/{gcc-5.2.inc => gcc-5.3.inc} (83%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch (84%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0002-uclibc-conf.patch (93%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0003-gcc-uclibc-locale-ctype_touplow_t.patch (95%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0004-uclibc-locale.patch (99%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0005-uclibc-locale-no__x.patch (98%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0006-uclibc-locale-wchar_fix.patch (95%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0007-uclibc-locale-update.patch (99%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0008-missing-execinfo_h.patch (87%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0009-c99-snprintf.patch (85%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0010-gcc-poison-system-directories.patch (92%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0011-gcc-poison-dir-extend.patch (92%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch (94%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0013-64-bit-multilib-hack.patch (97%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0014-optional-libstdc.patch (93%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch (85%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0016-COLLECT_GCC_OPTIONS.patch (89%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch (91%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0018-fortran-cross-compile-hack.patch (87%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0019-libgcc-sjlj-check.patch (92%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0020-cpp-honor-sysroot.patch (94%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0021-MIPS64-Default-to-N64-ABI.patch (86%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0022-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch (98%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0023-gcc-Fix-argument-list-too-long-error.patch (86%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0024-Disable-sdt.patch (88%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0025-libtool.patch (91%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0026-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch (91%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0027-Use-the-multilib-config-files-from-B-instead-of-usin.patch (89%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0028-Avoid-using-libdir-from-.la-which-usually-points-to-.patch (84%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0029-export-CPP.patch (95%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0030-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch (88%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0031-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch (91%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0032-Ensure-target-gcc-headers-can-be-included.patch (93%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0033-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch (92%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0034-Don-t-search-host-directory-during-relink-if-inst_pr.patch (87%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0035-Dont-link-the-plugins-with-libgomp-explicitly.patch (96%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0036-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch (82%)
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0037-aarch64-Add-support-for-musl-ldso.patch
 rename meta/recipes-devtools/gcc/{gcc-5.2/0038-fix-g++-sysroot.patch => gcc-5.3/0038-fix-g-sysroot.patch} (64%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0039-libcc1-fix-libcc1-s-install-path-and-rpath.patch (90%)
 rename meta/recipes-devtools/gcc/{gcc-5.2/0040-nativesdk-gcc-support.patch => gcc-5.3/0040-handle-sysroot-support-for-nativesdk-gcc.patch} (93%)
 rename meta/recipes-devtools/gcc/{gcc-5.2/0041-handle-target-sysroot-multilib.patch => gcc-5.3/0041-Search-target-sysroot-gcc-version-specific-dirs-with.patch} (73%)
 rename meta/recipes-devtools/gcc/{gcc-5.2/0042-cxxflags-for-build.patch => gcc-5.3/0042-Fix-various-_FOR_BUILD-and-related-variables.patch} (88%)
 rename meta/recipes-devtools/gcc/{gcc-5.2/0043-libstdc-musl.patch => gcc-5.3/0043-libstdc-Support-musl.patch} (56%)
 rename meta/recipes-devtools/gcc/{gcc-5.2/0044-gcc-musl-support.patch => gcc-5.3/0044-Adding-mmusl-as-a-musl-libc-specifier-and-the-necess.patch} (75%)
 rename meta/recipes-devtools/gcc/{gcc-5.2/0045-musl-dynamic-linker.patch => gcc-5.3/0045-Support-for-arm-linux-musl.patch} (68%)
 rename meta/recipes-devtools/gcc/{gcc-5.2/0046-musl-no-fixincludes.patch => gcc-5.3/0046-Get-rid-of-ever-broken-fixincludes-on-musl.patch} (45%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_5.2.bb => gcc-cross-canadian_5.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross-initial_5.2.bb => gcc-cross-initial_5.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_5.2.bb => gcc-cross_5.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk-initial_5.2.bb => gcc-crosssdk-initial_5.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_5.2.bb => gcc-crosssdk_5.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_5.2.bb => gcc-runtime_5.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_5.2.bb => gcc-sanitizers_5.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_5.2.bb => gcc-source_5.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc_5.2.bb => gcc_5.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_5.2.bb => libgcc-initial_5.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_5.2.bb => libgcc_5.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_5.2.bb => libgfortran_5.3.bb} (100%)

-- 
2.6.4



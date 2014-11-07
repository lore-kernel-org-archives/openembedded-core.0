Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AC32865E94
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 08:55:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sA78teFj000569
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 7 Nov 2014 00:55:41 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Fri, 7 Nov 2014 00:55:40 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Fri, 7 Nov 2014 16:51:05 +0800
Message-ID: <cover.1415350038.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: koen.kooi@linaro.org, openembedded-core@lists.openembedded.org
Subject: [PATCH 00/24] V2: Add machine qemuarm64
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
X-List-Received-Date: Fri, 07 Nov 2014 08:55:51 -0000
Content-Type: text/plain

V2:
* rebase on master and drop qemu upgrade commit
* built for lib32-core-image-sato core-image-sato-sdk meta-toolchain and world

V1:
The original configuration files and tune fils for arm arch64 are from linaro.
And we rename it to qemuarm64 for consistency.

It has been tested for core-image-minimal core-image-sato core-image-sato-sdk 
meta-toolchain and world.


Know issue:
It was also built for multilib. With setting:

require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "armv7a"

build lib32 image such as lib32-core-image-sato successfully. But it fails to boot
that run init fails. It seems to be a kernel issue.

The following changes since commit 7bd03ac24114b2c6015144a37e0c3fb4037baea6:

  bitbake: toastergui: fix invalid build url usage (2014-11-06 16:45:23 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/qemuarm64
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/qemuarm64

Fathi Boudra (1):
  libunwind: add aarch64 support

Joe Slater (4):
  siteinfo: account for 32 and 64 bit arm
  sysprof: disable build for aarch64
  lttng: recognize aarch64
  guile: allow compilation for aarch64

Kai Kang (13):
  linux-yocto: depend on libgcc for aarch64
  Add machine qemuarm64
  gcc-4.9: redefine default library install directory
  libc-package.bbclass: add aarch64 target to locale_arch_options
  glibc-locale.inc: add aarch64 to BINARY_LOCALE_ARCHES
  libatomics-ops: add aarch64 target iniitial support
  qt4: add aarch64 support
  libpng: add neon option for aarch64
  runqemu: add qemuarm64 support.
  kexec-tools: add aarch64 support
  packagegroup-core-tools-profile: remove sysprof for aarch64
  qemu: add single step support for aarch64
  Revert "gcc-4.9: redefine default library install directory"

Mark Hatle (6):
  gcc: Disable aarch64 multilib options
  glibc-package: aarch64 enable symlink for ABI compliance
  aarch-arm64: Update tune files
  linux-yocto: Fixup linux-yocto for aarch64
  local.conf.sample: Add qemuarm64
  poky.conf: Add support for aarch64 to QEMU

 meta-yocto/conf/distro/poky.conf                   |    2 +-
 meta-yocto/conf/local.conf.sample                  |    1 +
 meta/classes/libc-package.bbclass                  |    1 +
 meta/classes/siteinfo.bbclass                      |    8 +-
 meta/conf/machine/include/arm/arch-arm64.inc       |   36 +
 meta/conf/machine/include/arm/arch-armv8.inc       |    1 +
 .../conf/machine/include/arm/feature-arm-thumb.inc |   10 +-
 meta/conf/machine/qemuarm64.conf                   |   12 +
 meta/recipes-core/glibc/glibc-locale.inc           |    2 +-
 meta/recipes-core/glibc/glibc-package.inc          |   16 +
 .../packagegroup-core-tools-profile.bb             |    2 +
 meta/recipes-devtools/gcc/gcc-4.9.inc              |    1 +
 .../gcc/gcc-4.9/0057-aarch64-config.patch          |   32 +
 .../recipes-devtools/guile/files/arm_aarch64.patch |   19 +
 meta/recipes-devtools/guile/guile_2.0.11.bb        |    1 +
 ...Collect-up-the-debug-cp-register-definiti.patch |  177 ++
 ...Allow-STATE_BOTH-reginfo-descriptions-for.patch |   57 +
 ...Provide-both-32-and-64-bit-versions-of-de.patch |   89 +
 ...get-arm-Adjust-debug-ID-registers-per-CPU.patch |  142 ++
 ...Don-t-allow-AArch32-to-access-RES0-CPSR-b.patch |  118 +
 ...Correctly-handle-PSTATE.SS-when-taking-ex.patch |   38 +
 ...Set-PSTATE.SS-correctly-on-exception-retu.patch |  152 ++
 ...A64-Avoid-duplicate-exit_tb-0-in-non-link.patch |   47 +
 ...Implement-ARMv8-single-step-handling-for-.patch |  302 +++
 ...Implement-ARMv8-single-stepping-for-AArch.patch |  212 ++
 ...t-arm-Implement-MDSCR_EL1-as-having-state.patch |   36 +
 meta/recipes-devtools/qemu/qemu_2.1.2.bb           |   13 +-
 meta/recipes-kernel/kexec/kexec-tools.inc          |    2 +-
 .../kexec/kexec-tools/kexec-aarch64.patch          |  801 +++++++
 meta/recipes-kernel/kexec/kexec-tools_2.0.8.bb     |    4 +-
 meta/recipes-kernel/linux/linux-yocto.inc          |    3 +
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      |    4 +-
 meta/recipes-kernel/linux/linux-yocto_3.17.bb      |    4 +-
 .../lttng/lttng-ust/add-aarch64.patch              |   19 +
 meta/recipes-kernel/lttng/lttng-ust_2.5.0.bb       |    1 +
 meta/recipes-kernel/sysprof/sysprof_git.bb         |    5 +
 meta/recipes-multimedia/libpng/libpng_1.6.13.bb    |    1 +
 .../0001-libatomic_ops-Aarch64-basic-port.patch    |  239 ++
 .../pulseaudio/libatomics-ops_7.2.bb               |    1 +
 meta/recipes-qt/qt4/qt4-4.8.6.inc                  |    7 +
 .../0029-aarch64_arm64_fix_arch_detection.patch    |   53 +
 .../0030-aarch64_arm64_qatomic_support.patch       |  491 ++++
 .../qt4/qt4-4.8.6/0031-aarch64_arm64_mkspecs.patch |  124 +
 .../qt4/qt4-4.8.6/0032-aarch64_add_header.patch    |   18 +
 meta/recipes-qt/qt4/qt4-native.inc                 |    4 +
 meta/recipes-qt/qt4/qt4_arch.inc                   |    1 +
 .../libunwind/libunwind-1.1/AArch64-port.patch     | 2529 ++++++++++++++++++++
 .../Support-building-with-older-compilers.patch    |   72 +
 meta/recipes-support/libunwind/libunwind.inc       |    1 +
 meta/recipes-support/libunwind/libunwind_1.1.bb    |    5 +
 meta/recipes-support/liburcu/files/aarch64.patch   |   19 +
 meta/recipes-support/liburcu/liburcu_0.8.4.bb      |    1 +
 meta/site/arm-32                                   |   47 +
 meta/site/arm-64                                   |   46 +
 meta/site/arm-common                               |   38 -
 scripts/runqemu                                    |    5 +-
 scripts/runqemu-internal                           |   26 +
 57 files changed, 6045 insertions(+), 53 deletions(-)
 create mode 100644 meta/conf/machine/include/arm/arch-arm64.inc
 create mode 100644 meta/conf/machine/include/arm/arch-armv8.inc
 create mode 100644 meta/conf/machine/qemuarm64.conf
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0057-aarch64-config.patch
 create mode 100644 meta/recipes-devtools/guile/files/arm_aarch64.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-target-arm-Collect-up-the-debug-cp-register-definiti.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0002-target-arm-Allow-STATE_BOTH-reginfo-descriptions-for.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0003-target-arm-Provide-both-32-and-64-bit-versions-of-de.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0004-target-arm-Adjust-debug-ID-registers-per-CPU.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0005-target-arm-Don-t-allow-AArch32-to-access-RES0-CPSR-b.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0006-target-arm-Correctly-handle-PSTATE.SS-when-taking-ex.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0007-target-arm-Set-PSTATE.SS-correctly-on-exception-retu.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0008-target-arm-A64-Avoid-duplicate-exit_tb-0-in-non-link.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0009-target-arm-Implement-ARMv8-single-step-handling-for-.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0010-target-arm-Implement-ARMv8-single-stepping-for-AArch.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0011-target-arm-Implement-MDSCR_EL1-as-having-state.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/kexec-aarch64.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-ust/add-aarch64.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/files/0001-libatomic_ops-Aarch64-basic-port.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.6/0029-aarch64_arm64_fix_arch_detection.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.6/0030-aarch64_arm64_qatomic_support.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.6/0031-aarch64_arm64_mkspecs.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.6/0032-aarch64_add_header.patch
 create mode 100644 meta/recipes-support/libunwind/libunwind-1.1/AArch64-port.patch
 create mode 100644 meta/recipes-support/libunwind/libunwind-1.1/Support-building-with-older-compilers.patch
 create mode 100644 meta/recipes-support/liburcu/files/aarch64.patch
 create mode 100644 meta/site/arm-32
 create mode 100644 meta/site/arm-64

-- 
1.9.1



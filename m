Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2CE417278C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 08:53:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBI8rck9021946
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 18 Dec 2014 00:53:39 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Thu, 18 Dec 2014 00:53:38 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Thu, 18 Dec 2014 16:50:56 +0800
Message-ID: <cover.1418885577.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/19] V3: Add machine qemuarm64
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
X-List-Received-Date: Thu, 18 Dec 2014 08:53:51 -0000
Content-Type: text/plain

V3 updates:
* Remove 2 commits:
  |- gcc-4.9: redefine default library install directory
  |- Revert "gcc-4.9: redefine default library install directory"
* Remove qemu related patches which is done by upgrade qemu to 2.2.0 in oe-core
* libpng: Use patch from Koen instead
* libunwind: Support-building-with-older-compilers.patch is still needed by gcc 4.9, so NO update
* packagegroup-core-tools-profile: don't find SYSPROF in lttng recipes, so NO update.
* patches of local.conf.sample and poky.conf will send to yocto maillist.

The following changes since commit 8657c2fd57600e0b0eaf2a14692de7453c78e1bb:

  serf: readded md5sum (2014-12-11 11:34:57 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/qemuarm64-rebased
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/qemuarm64-rebased

Fathi Boudra (1):
  libunwind: add aarch64 support

Joe Slater (4):
  siteinfo: account for 32 and 64 bit arm
  sysprof: disable build for aarch64
  lttng: recognize aarch64
  guile: allow compilation for aarch64

Kai Kang (9):
  linux-yocto: depend on libgcc for aarch64
  Add machine qemuarm64
  libc-package.bbclass: add aarch64 target to locale_arch_options
  glibc-locale.inc: add aarch64 to BINARY_LOCALE_ARCHES
  libatomics-ops: add aarch64 target iniitial support
  qt4: add aarch64 support
  runqemu: add qemuarm64 support.
  kexec-tools: add aarch64 support
  packagegroup-core-tools-profile: remove sysprof for aarch64

Koen Kooi (1):
  libpng 1.6.13: fix build for aarch64

Mark Hatle (4):
  gcc: Disable aarch64 multilib options
  glibc-package: aarch64 enable symlink for ABI compliance
  aarch-arm64: Update tune files
  linux-yocto: Fixup linux-yocto for aarch64

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
 meta/recipes-kernel/kexec/kexec-tools.inc          |    2 +-
 .../kexec/kexec-tools/kexec-aarch64.patch          |  801 +++++++
 meta/recipes-kernel/kexec/kexec-tools_2.0.8.bb     |    4 +-
 meta/recipes-kernel/linux/linux-yocto.inc          |    3 +
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      |    4 +-
 meta/recipes-kernel/linux/linux-yocto_3.17.bb      |    4 +-
 .../lttng/lttng-ust/add-aarch64.patch              |   19 +
 meta/recipes-kernel/lttng/lttng-ust_2.5.0.bb       |    1 +
 meta/recipes-kernel/sysprof/sysprof_git.bb         |    5 +
 meta/recipes-multimedia/libpng/libpng_1.6.13.bb    |    2 +-
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
 meta/recipes-support/liburcu/liburcu_0.8.5.bb      |    1 +
 meta/site/arm-32                                   |   47 +
 meta/site/arm-64                                   |   46 +
 meta/site/arm-common                               |   38 -
 scripts/runqemu                                    |    5 +-
 scripts/runqemu-internal                           |   26 +
 43 files changed, 4661 insertions(+), 52 deletions(-)
 create mode 100644 meta/conf/machine/include/arm/arch-arm64.inc
 create mode 100644 meta/conf/machine/include/arm/arch-armv8.inc
 create mode 100644 meta/conf/machine/qemuarm64.conf
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0057-aarch64-config.patch
 create mode 100644 meta/recipes-devtools/guile/files/arm_aarch64.patch
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



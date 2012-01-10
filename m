Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RkUmN-00042N-Iy
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 07:01:52 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jan 2012 21:54:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="110535243"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.28])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jan 2012 21:54:18 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jan 2012 21:53:54 -0800
Message-Id: <cover.1326174744.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [CONSOLIDATED PULL 00/22] Patches and Updates for M2
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
X-List-Received-Date: Tue, 10 Jan 2012 06:01:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Richard, 

This change set has been run through the AB, I pull out the DTB patch
which is what I think caused the failure for MPC.

Please due further review and commit as appropriate.

Thanks
	Sau!


The following changes since commit fff18970706913e7fd7f4a119d798dddb44b388a:

  base-files: filesystems: fix mount order (2012-01-06 14:41:19 +0000)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib sgw/stage
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgw/stage

Andrea Adami (2):
  kexec-tools: split packaging of kexec and kdump
  task-core-tools: adapt to kexec-tools package split

Andreas Müller (2):
  libusb1: keep *.la in base_libdir
  libusb-compat: keep *.la in base_libdir

Colin Walters (1):
  util-linux: .pc files should go in the -dev packages for subpackages

Dexuan Cui (1):
  distro_tracking_fields.inc: upgrade tcf-agent

Jessica Zhang (1):
  add sysroot support for meta-ide-support which is the toolchain
    within build env case

Khem Raj (8):
  site/common-uclibc: Cache gl_cv_func_wcwidth_works
  libiconv_1.14.bb: Fix build failure
  eglibc: Upgrade recipes 2.14 -> 2.15
  autotools.bbclass: Introduce CACHED_CONFIGUREVARS
  default-distrovars: Define DISTRO_FEATURES_LIBC for uclibc
  uclibc: Configure UCLIBC_HAS_WCHAR based on libc-posix-clang-wchar
    distro feature
  findutils: Use CACHED_CONFIGUREVARS to specify cached configure vars
  util-linux: Enable fallocate and use CACHED_CONFIGUREVARS

Matthew McClintock (1):
  libxml2: add shared library version info to libxml shared libraries

Nitin A Kamble (1):
  libxxf86dga: fix compilation with x32 toolchain

Saul Wold (1):
  distro_tracking: Update Manual Checks

Steve Sakoman (4):
  Remove last remnants of kernel26 MACHINE_FEATURES
  dbus: change permissions of dbus-daemon-launch-helper to 4755
  gtk-icon-cache.bbclass: add -f option to gtk-update-icon-cache in
    postinst
  update-modules: don't run modutils.sh if systemd is installed

 meta/classes/autotools.bbclass                     |    2 +-
 meta/classes/gtk-icon-cache.bbclass                |    2 +-
 meta/classes/toolchain-scripts.bbclass             |    9 +-
 meta/conf/bitbake.conf                             |    1 -
 meta/conf/distro/include/default-distrovars.inc    |    2 +
 .../conf/distro/include/distro_tracking_fields.inc |   54 +-
 meta/conf/machine/include/qemu.inc                 |    2 +-
 meta/recipes-core/dbus/dbus.inc                    |    4 +-
 ...tive_2.14.bb => cross-localedef-native_2.15.bb} |    0
 .../IO-acquire-lock-fix.patch                      |    0
 .../armv4-eabi-compile-fix.patch                   |    0
 .../eglibc-rpc-export-again.patch                  |    0
 .../eglibc-svn-arm-lowlevellock-include-tls.patch  |    0
 .../{eglibc-2.14 => eglibc-2.15}/etc/ld.so.conf    |    0
 .../generate-supported.mk                          |    0
 .../glibc-2.14-libdl-crash.patch                   |    0
 .../ld-search-order.patch                          |    0
 .../mips-rld-map-check.patch                       |    0
 .../multilib_readlib.patch                         |    0
 .../{eglibc-2.14 => eglibc-2.15}/ppc-sqrt.patch    |    0
 .../eglibc/eglibc-2.15/ppc-sqrt_finite.patch       |  112 +
 .../stack-protector-test.patch                     |    0
 .../use-sysroot-cxx-headers.patch                  |   30 +-
 .../recipes-core/eglibc/eglibc-2.15/x86_fenv.patch |   29 +
 ...libc-initial_2.14.bb => eglibc-initial_2.15.bb} |    0
 ...eglibc-locale_2.14.bb => eglibc-locale_2.15.bb} |    0
 .../eglibc/{eglibc_2.14.bb => eglibc_2.15.bb}      |   16 +-
 .../libxml/libxml2/fix_version_info.patch          |   23 +
 meta/recipes-core/libxml/libxml2_2.7.8.bb          |    4 +-
 meta/recipes-core/tasks/task-core-tools.bb         |    4 +-
 meta/recipes-core/uclibc/uclibc-config.inc         |    1 +
 meta/recipes-core/util-linux/util-linux.inc        |    4 +-
 meta/recipes-core/util-linux/util-linux_2.20.1.bb  |    6 +-
 meta/recipes-extended/findutils/findutils_4.4.2.bb |    4 +-
 .../libxxf86dga-1.1.2_fix_for_x32.patch            |   30 +
 .../recipes-graphics/xorg-lib/libxxf86dga_1.1.2.bb |    5 +-
 meta/recipes-kernel/kexec/kexec-tools_2.0.2.bb     |    7 +-
 .../update-modules-1.0/update-modules              |    3 +-
 .../update-modules/update-modules_1.0.bb           |    5 +-
 .../libiconv-1.14/add-relocatable-module.patch     | 5008 ++++++++++++++++++++
 meta/recipes-support/libiconv/libiconv_1.14.bb     |    8 +-
 meta/recipes-support/libusb/libusb-compat_0.1.3.bb |    3 +-
 meta/recipes-support/libusb/libusb1_1.0.8.bb       |    3 +-
 meta/site/common-uclibc                            |    1 +
 44 files changed, 5310 insertions(+), 72 deletions(-)
 rename meta/recipes-core/eglibc/{cross-localedef-native_2.14.bb => cross-localedef-native_2.15.bb} (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.14 => eglibc-2.15}/IO-acquire-lock-fix.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.14 => eglibc-2.15}/armv4-eabi-compile-fix.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.14 => eglibc-2.15}/eglibc-rpc-export-again.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.14 => eglibc-2.15}/eglibc-svn-arm-lowlevellock-include-tls.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.14 => eglibc-2.15}/etc/ld.so.conf (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.14 => eglibc-2.15}/generate-supported.mk (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.14 => eglibc-2.15}/glibc-2.14-libdl-crash.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.14 => eglibc-2.15}/ld-search-order.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.14 => eglibc-2.15}/mips-rld-map-check.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.14 => eglibc-2.15}/multilib_readlib.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.14 => eglibc-2.15}/ppc-sqrt.patch (100%)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.15/ppc-sqrt_finite.patch
 rename meta/recipes-core/eglibc/{eglibc-2.14 => eglibc-2.15}/stack-protector-test.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.14 => eglibc-2.15}/use-sysroot-cxx-headers.patch (51%)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.15/x86_fenv.patch
 rename meta/recipes-core/eglibc/{eglibc-initial_2.14.bb => eglibc-initial_2.15.bb} (100%)
 rename meta/recipes-core/eglibc/{eglibc-locale_2.14.bb => eglibc-locale_2.15.bb} (100%)
 rename meta/recipes-core/eglibc/{eglibc_2.14.bb => eglibc_2.15.bb} (95%)
 create mode 100644 meta/recipes-core/libxml/libxml2/fix_version_info.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxxf86dga/libxxf86dga-1.1.2_fix_for_x32.patch
 create mode 100644 meta/recipes-support/libiconv/libiconv-1.14/add-relocatable-module.patch

-- 
1.7.6.5




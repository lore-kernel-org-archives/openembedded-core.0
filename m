Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R8oIo-00041r-QO
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 09:11:35 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Sep 2011 00:06:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,453,1312182000"; d="scan'208";a="21360931"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.219])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Sep 2011 00:06:07 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2011 00:05:36 -0700
Message-Id: <cover.1317193250.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [CONSOLIDATED PULL 00/29] Picking up patches from OE-Core list
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
X-List-Received-Date: Wed, 28 Sep 2011 07:11:35 -0000

Richard,

I have reviewed most of these changes, and the current autobuilder built
all the changes except the last batch multilib changes since we don't have
that setup.

Please review the multi-lib change.

There was an issue with the Autobuilder, Mips and Eglibc that I need to
investgate further with Khem, but based on the inital build I think we can
pull it now and fix it shortly.

I think that Josh's ghostscript, Bruce's kernel update and my rpm patches
are suited to be pulled into RC4, other isolated changes are the oprofileui 
removal of gnome-vfs and Koen's avahi fix.

Please review and pull as approriate.

Sau!


The following changes since commit 684a4b517d13884c315688967fadd5e6a4845b71:

  libffi: really populate -dev package (2011-09-26 20:50:27 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib sgw/stage
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgw/stage

Bruce Ashfield (1):
  linux-yocto/meta: eg20t and live boot config changes

Dongxiao Xu (6):
  multilib.bbclass: map RDEPENDS and LINGUAS_INSTALL for image recipes
  multilib: remove the multilib handling to allarch
  multilib: add MLPREFIX to deploy folder
  tune-i586: fix hardcoded TUNE_PKGARCH
  package_rpm: combine normal and multilib solution manifest together
  libc-package.bbclass: add MLPREFIX when set values to PACKAGES

Joshua Lock (1):
  ghostscript: disable check for time.h

Khem Raj (4):
  conf,recipes: Add new variable LINKER_HASH_STYLE
  gcc-4.6: Use --with-linker-hash-style configure option
  eglibc: Add recipes for 2.14
  gcc-4.6: Update to tip of FSF gcc-4_6-branch

Koen Kooi (1):
  avahi: fix avahi-systemd dependencies

Richard Purdie (4):
  gcc: Fix two QA issues
  grub: Fix insane/QA architecture warning
  sqlite3: Fix nativesdk packaging/QA warnings
  pseudo: Fix QA warnings

Saul Wold (4):
  rpm: ensure that magic file is relocatable
  zypper & sat-solver: needs RDEPENDS on rpm-lib
  rpm: fix QA Warning on installed but not shipped staticdev filesw
  distro_tracking: Update Manual Upgrade Checks

Simon Busch (2):
  meta: qt4: fix postprocessing of pkg-config files
  qt4-embedded: move qte.sh profile script into own package

Tom Zanussi (2):
  sysprof: update to version 1.1.8
  blktrace: update to version 1.0.3

Zhai Edwin (4):
  oprofileui: remove dependence on gnome-vfs
  libgsf: remove dependence on gnome-vfs
  tables: remove it as obsolete recipe
  gnome-vfs: remove it as obsolete recipe in favor of GIO/GVFS

 .../recipes-gnome/libgsf/libgsf_1.14.5.bb          |    8 +-
 meta-demoapps/recipes-graphics/clutter/table.inc   |   13 -
 .../recipes-graphics/clutter/table/fixes.patch     |   16 -
 .../recipes-graphics/clutter/table_git.bb          |   15 -
 meta/classes/libc-package.bbclass                  |    2 +-
 meta/classes/multilib.bbclass                      |   12 +-
 meta/classes/multilib_global.bbclass               |    2 +-
 meta/classes/package_rpm.bbclass                   |   15 +-
 meta/classes/rootfs_rpm.bbclass                    |    2 +-
 meta/conf/bitbake.conf                             |    3 +-
 .../conf/distro/include/distro_tracking_fields.inc |   88 ++--
 meta/conf/distro/include/tcmode-default.inc        |    6 +-
 meta/conf/machine/include/tune-i586.inc            |    3 +-
 meta/conf/multilib.conf                            |    8 +-
 meta/recipes-bsp/grub/grub_1.99.bb                 |    2 +-
 meta/recipes-connectivity/avahi/avahi.inc          |    4 +-
 .../eglibc/cross-localedef-native_2.14.bb          |   44 ++
 .../eglibc/eglibc-2.14/IO-acquire-lock-fix.patch   |   17 +
 .../eglibc-2.14/armv4-eabi-compile-fix.patch       |   25 +
 .../eglibc-2.14/eglibc-rpc-export-again.patch      |   69 +++
 .../eglibc-svn-arm-lowlevellock-include-tls.patch  |   21 +
 .../eglibc/eglibc-2.14/generate-supported.mk       |   11 +
 .../eglibc/eglibc-2.14/ld-search-order.patch       |   56 ++
 .../eglibc/eglibc-2.14/mips-rld-map-check.patch    |   26 +
 .../eglibc/eglibc-2.14/multilib_readlib.patch      |   17 +
 .../recipes-core/eglibc/eglibc-2.14/ppc-sqrt.patch |  538 ++++++++++++++++++++
 .../eglibc-2.14/shorten-build-commands.patch       |   82 +++
 .../eglibc/eglibc-2.14/stack-protector-test.patch  |   35 ++
 meta/recipes-core/eglibc/eglibc-initial_2.14.bb    |    6 +
 meta/recipes-core/eglibc/eglibc-locale_2.14.bb     |    1 +
 meta/recipes-core/eglibc/eglibc_2.14.bb            |  219 ++++++++
 meta/recipes-core/uclibc/uclibc.inc                |    2 +-
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    8 +-
 .../gcc/gcc-4.6/gcc-with-linker-hash-style.patch   |  196 +++++++
 meta/recipes-devtools/gcc/gcc-package-sdk.inc      |    4 +
 meta/recipes-devtools/gcc/gcc-package-target.inc   |    2 +
 meta/recipes-devtools/pseudo/pseudo.inc            |   18 +-
 .../python/python-pygobject_2.27.91.bb             |    2 +-
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |   31 +-
 .../ghostscript/ghostscript_9.02.bb                |    5 +
 meta/recipes-extended/libzypp/libzypp_git.bb       |    8 +-
 meta/recipes-extended/sat-solver/sat-solver_git.bb |    4 +-
 meta/recipes-extended/zypper/zypper_git.bb         |    6 +-
 .../gnome/gnome-vfs-2.24.4/gconftool-lossage.patch |   13 -
 .../gnome-vfs-2.24.4/gnome-vfs-no-kerberos.patch   |   53 --
 meta/recipes-gnome/gnome/gnome-vfs_2.24.4.bb       |   50 --
 .../blktrace/dso_linking_change_build_fix.patch    |   26 -
 meta/recipes-kernel/blktrace/blktrace_git.bb       |   12 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb    |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |    2 +-
 meta/recipes-kernel/oprofile/oprofileui.inc        |    2 +-
 meta/recipes-kernel/sysprof/sysprof_git.bb         |    9 +-
 meta/recipes-qt/qt4/qt4-embedded.inc               |    8 +-
 meta/recipes-qt/qt4/qt4-x11-free.inc               |    2 +-
 meta/recipes-qt/qt4/qt4.inc                        |    4 +-
 meta/recipes-support/sqlite/sqlite3.inc            |    2 +-
 meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb     |    2 +-
 57 files changed, 1536 insertions(+), 303 deletions(-)
 delete mode 100644 meta-demoapps/recipes-graphics/clutter/table.inc
 delete mode 100644 meta-demoapps/recipes-graphics/clutter/table/fixes.patch
 delete mode 100644 meta-demoapps/recipes-graphics/clutter/table_git.bb
 create mode 100644 meta/recipes-core/eglibc/cross-localedef-native_2.14.bb
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/IO-acquire-lock-fix.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/armv4-eabi-compile-fix.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/eglibc-rpc-export-again.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/eglibc-svn-arm-lowlevellock-include-tls.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/etc/ld.so.conf
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/generate-supported.mk
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/ld-search-order.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/mips-rld-map-check.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/multilib_readlib.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/ppc-sqrt.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/shorten-build-commands.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/stack-protector-test.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-initial_2.14.bb
 create mode 100644 meta/recipes-core/eglibc/eglibc-locale_2.14.bb
 create mode 100644 meta/recipes-core/eglibc/eglibc_2.14.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6/gcc-with-linker-hash-style.patch
 delete mode 100644 meta/recipes-gnome/gnome/gnome-vfs-2.24.4/gconftool-lossage.patch
 delete mode 100644 meta/recipes-gnome/gnome/gnome-vfs-2.24.4/gnome-vfs-no-kerberos.patch
 delete mode 100644 meta/recipes-gnome/gnome/gnome-vfs_2.24.4.bb
 delete mode 100644 meta/recipes-kernel/blktrace/blktrace/dso_linking_change_build_fix.patch

-- 
1.7.6




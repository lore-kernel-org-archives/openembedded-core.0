Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T6x4I-000204-D7
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 07:13:26 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Aug 2012 22:01:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,337,1344236400"; d="scan'208";a="215610008"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.94])
	by fmsmga002.fm.intel.com with ESMTP; 29 Aug 2012 22:01:10 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Aug 2012 22:01:09 -0700
Message-Id: <cover.1346302766.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [CONSOLIDATED REQUEST 0/9] Fixes (Cover Letter Only)
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
X-List-Received-Date: Thu, 30 Aug 2012 05:13:27 -0000

Richard,

Other than the perl issue and a parallel build issue, these
change work, I think the perl issue is related to the nativesdk,
but futher testing may be needed by QA to wring those out.

Thanks
	Sau!

The following changes since commit 5bc4c0593997b046300a8f5b3f63c278aeb31d68:

  gail: remove (2012-08-29 14:14:13 -0700)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Constantin Musca (1):
  dpkg: upgrade to 1.16.8

Kang Kai (1):
  ltp: add dependency libaio

Richard Purdie (2):
  nativesdk: Convert to use classextend.py
  nativesdk: Switch to using nativesdk as a prefix, not a suffix

Robert Yang (1):
  sstate-cache-management.sh: fix it for downloaded file

Ross Burton (3):
  tzdata: this package isn't architecture specific
  xserver-xorg: ship the exa module in a separate package
  task-core-x11: default to xserver-xorg instead of kdrive

Saul Wold (1):
  task-self-hosted: remove e2fsprogs-fsck from task list

 meta/classes/base.bbclass                          |   17 +-
 meta/classes/cross-canadian.bbclass                |    2 +-
 meta/classes/distrodata.bbclass                    |    6 +-
 meta/classes/insane.bbclass                        |    4 +-
 meta/classes/nativesdk.bbclass                     |   51 ++----
 meta/classes/package_rpm.bbclass                   |    2 +-
 meta/classes/pkgconfig.bbclass                     |    2 +-
 meta/classes/populate_sdk.bbclass                  |    1 +
 meta/classes/populate_sdk_base.bbclass             |    2 +-
 meta/conf/bitbake.conf                             |    4 +-
 meta/conf/distro/include/default-providers.inc     |    6 +-
 meta/conf/distro/include/tclibc-eglibc.inc         |    4 +-
 meta/conf/distro/include/tcmode-default.inc        |   14 +-
 meta/lib/oe/classextend.py                         |    4 +
 meta/lib/oe/sstatesig.py                           |    2 +-
 meta/recipes-core/dbus/dbus.inc                    |    2 +-
 meta/recipes-core/eglibc/eglibc-locale.inc         |   15 +-
 meta/recipes-core/eglibc/eglibc-package.inc        |   53 +++---
 meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb      |    2 +-
 meta/recipes-core/glib-2.0/glib.inc                |    2 +-
 meta/recipes-core/meta/external-python-tarball.bb  |   38 ++--
 ...ost-nativesdk.bb => nativesdk-task-sdk-host.bb} |   24 ++--
 meta/recipes-core/tasks/task-self-hosted.bb        |    3 +-
 meta/recipes-devtools/autoconf/autoconf.inc        |    4 +-
 meta/recipes-devtools/automake/automake_1.12.1.bb  |    2 +-
 .../binutils/binutils-cross-canadian.inc           |    2 +-
 meta/recipes-devtools/dpkg/dpkg.inc                |    4 +-
 meta/recipes-devtools/dpkg/dpkg/autofoo.patch      |   50 -----
 .../recipes-devtools/dpkg/dpkg/check_version.patch |   23 ++-
 .../dpkg/dpkg/dpkg-deb-avoid-fflush.patch          |  198 --------------------
 .../dpkg/dpkg/fix-timestamps.patch                 |   21 ++
 .../dpkg/dpkg/ignore_extra_fields.patch            |   35 ++--
 meta/recipes-devtools/dpkg/dpkg/nochroot.patch     |   20 --
 meta/recipes-devtools/dpkg/dpkg/noman.patch        |    1 -
 meta/recipes-devtools/dpkg/dpkg/noupdalt.patch     |   18 --
 meta/recipes-devtools/dpkg/dpkg/perllibdir.patch   |   22 ---
 meta/recipes-devtools/dpkg/dpkg/preinst.patch      |   75 ++++----
 .../dpkg/dpkg/remove-tar-no-timestamp.patch        |   16 ++
 .../dpkg/{dpkg_1.15.8.7.bb => dpkg_1.16.8.bb}      |   10 +-
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc   |    2 +-
 .../recipes-devtools/gcc/gcc-cross-canadian_4.7.bb |    4 +-
 meta/recipes-devtools/gcc/gcc-crosssdk.inc         |    2 +-
 meta/recipes-devtools/gcc/libgcc_4.7.bb            |    9 +-
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc   |    7 +-
 .../gnu-config/gnu-config_20111111.bb              |    2 +-
 meta/recipes-devtools/gnu-config/gnu-config_git.bb |    2 +-
 .../adt-installer/scripts/adt_installer_internal   |    8 +-
 meta/recipes-devtools/opkg/opkg.inc                |   15 +-
 meta/recipes-devtools/perl/perl_5.14.2.bb          |    2 +
 meta/recipes-devtools/python/python_2.7.3.bb       |    9 +-
 ...tivesdk_1.0.bb => nativesdk-qemu-helper_1.0.bb} |    2 +-
 meta/recipes-devtools/qemu/qemu.inc                |    6 +-
 .../unfs-server/unfs-server_2.1+2.2beta47.bb       |    4 +-
 meta/recipes-extended/bash/bash_4.2.bb             |    1 +
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb         |    3 +-
 meta/recipes-extended/ltp/ltp_20120614.bb          |    4 +-
 meta/recipes-extended/tzdata/tzdata_2012d.bb       |    4 +-
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb      |    2 +-
 meta/recipes-graphics/mesa/qemugl_git.bb           |    2 +-
 .../xorg-xserver/xserver-xorg-1.11.2.inc           |    2 +-
 .../xorg-xserver/xserver-xorg-common.inc           |    3 +
 meta/recipes-kernel/systemtap/systemtap_git.bb     |    2 +-
 meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb    |   17 +-
 meta/recipes-qt/meta/meta-toolchain-qte.bb         |    2 +-
 meta/recipes-qt/qt4/files/qt-dbus-const.patch      |    2 +-
 ...vesdk_4.8.1.bb => nativesdk-qt4-tools_4.8.1.bb} |    0
 ...sdk.bb => nativesdk-task-qte-toolchain-host.bb} |    4 +-
 meta/recipes-sato/tasks/task-core-x11-mini.bb      |    2 +-
 meta/recipes-sato/tasks/task-core-x11.bb           |    2 +-
 meta/recipes-support/curl/curl_7.26.0.bb           |    2 +-
 meta/recipes-support/sqlite/sqlite3.inc            |   15 +-
 scripts/sstate-cache-management.sh                 |   20 ++-
 72 files changed, 326 insertions(+), 598 deletions(-)
 rename meta/recipes-core/tasks/{task-sdk-host-nativesdk.bb => nativesdk-task-sdk-host.bb} (63%)
 delete mode 100644 meta/recipes-devtools/dpkg/dpkg/autofoo.patch
 delete mode 100644 meta/recipes-devtools/dpkg/dpkg/dpkg-deb-avoid-fflush.patch
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/fix-timestamps.patch
 delete mode 100644 meta/recipes-devtools/dpkg/dpkg/nochroot.patch
 delete mode 100644 meta/recipes-devtools/dpkg/dpkg/noupdalt.patch
 delete mode 100644 meta/recipes-devtools/dpkg/dpkg/perllibdir.patch
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch
 rename meta/recipes-devtools/dpkg/{dpkg_1.15.8.7.bb => dpkg_1.16.8.bb} (49%)
 rename meta/recipes-devtools/qemu/{qemu-helper-nativesdk_1.0.bb => nativesdk-qemu-helper_1.0.bb} (98%)
 rename meta/recipes-qt/qt4/{qt4-tools-nativesdk_4.8.1.bb => nativesdk-qt4-tools_4.8.1.bb} (100%)
 rename meta/recipes-qt/tasks/{task-qte-toolchain-host-nativesdk.bb => nativesdk-task-qte-toolchain-host.bb} (47%)

-- 
1.7.7.6




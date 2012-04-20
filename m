Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SLH7D-0005je-5R
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Apr 2012 18:55:23 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Apr 2012 09:45:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="156167815"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.163])
	by fmsmga002.fm.intel.com with ESMTP; 20 Apr 2012 09:45:36 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Apr 2012 09:44:51 -0700
Message-Id: <cover.1334940120.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [CONSOLIDATED PULL 00/43] Post 1.2 Catch Up
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
X-List-Received-Date: Fri, 20 Apr 2012 16:55:23 -0000

Richard,

This is a series of patches that I have collected during the
1.2 stabilization time, the large set of changes from Mark H 
for update-alternatives.

This also includes some packaging updates from me to remove
more warnings, with this set, we build package warning free with
the exectption of the nativesdk (eglibc 2.15 introduced a new 
install target). So we are close to enabling this as an ERROR,
at least in the poky distro.

Sau!


The following changes since commit 00256125873ff6f1630743a712e882e5f473a9d2:

  self-hosted-image: Update poky revision to point at the 1.2 release branch (2012-04-18 15:59:20 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andreas Oberritter (3):
  python: use PKGSUFFIX for libpython2
  wpa-supplicant: remove unused files
  wpa-supplicant: move wpa_passphrase to bindir

Darren Hart (1):
  gthumb: Disable parallel make for gthumb install

Denys Dmytriyenko (1):
  rt-tests: fix dependency on eglibc, clean LDFLAGS passing

Jonas Danielsson (1):
  bluez4: make alsa support conditional upon DISTRO_FEATURES

Ken Werner (1):
  bdwgc: Set ARM_INSTRUCTION_SET to "arm"

Khem Raj (1):
  connman: Fix linking with gold linker

Mark Hatle (19):
  update-alternatives.bbclass: Ensure alternatives end up in per file
    deps
  coreutils_*.bb: Use update alternatives and add missing manual alt
    links
  coreutils_*.bb: Sync up file path with busybox and minor cleanup
  grep: Use update-alternatives
  openssh: Use update-alternatives
  hdparm: Use update-alternatives
  iputils: Use update-alternatives
  net-tools: Use update-alternatives
  shadow: Use update-alternatives
  findutils: Use update-alternatives
  gzip: Use update-alternatives class
  module-init-tools: Update to use update-alternatives class
  kbd: Use update-alternatives
  console-tools: Use update-alternatives
  sysvinit: Use update-alternatives in a different way
  lrzsz: Use update-alternatives to set provides
  cpio: use update-alternatives class
  dropbear: Use update-alternatives class
  ncurses: Use update-alternatives

Martin Donnelly (1):
  augeas: Add libxml2 dependency

Otavio Salvador (1):
  connman: backport test script fixes

Richard Purdie (3):
  package.bbclass: Ensure kernel modules get stripped
  qemu: Backport a patch to solve SSE2 instruction emulation issues
  gettext.bbclass: Ensure we don't overwrite other DEPENDS_GETTEXT
    values

Robert Yang (1):
  qt4-x11-free: enable -accessibility and -sm

Saul Wold (10):
  binutils: add embedspu for ppc builds
  libgcc: Package additional *crt*.o files for PPC
  xserver-kdrive: Add xkb to existing docs list
  gcc: Add plugins package for ARM, fix /usr/incude packaging
  quilt: move empty quiltrc to native sysconfdir
  sysstat: Upgrade to 10.0.3
  lame: Upgrade to 3.99.5
  sqlite3: Upgrade to 3.7.11
  distro_tracking: Update Manual Check
  kernel: Fix packaging issue

 meta/classes/gettext.bbclass                       |    2 +-
 meta/classes/kernel.bbclass                        |    2 +-
 meta/classes/package.bbclass                       |   24 ++-
 meta/classes/package_rpm.bbclass                   |    4 -
 meta/classes/patch.bbclass                         |    2 +-
 meta/classes/update-alternatives.bbclass           |   59 ++++++-
 .../conf/distro/include/distro_tracking_fields.inc |   58 +++---
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb            |   11 +-
 meta/recipes-connectivity/bluez/bluez4.inc         |    6 +-
 meta/recipes-connectivity/bluez/bluez4_4.99.bb     |    3 +-
 ...ange-visibility-to-default-for-debug-symb.patch |   35 ++++
 .../connman/test-set-ipv4-method-api-fix.patch     |   50 +++++
 .../connman/test-set-ipv6-method-api-fix.patch     |   55 ++++++
 meta/recipes-connectivity/connman/connman_0.79.bb  |    5 +-
 meta/recipes-connectivity/openssh/openssh_5.9p1.bb |    9 +-
 .../wpa-supplicant-0.7.3/defaults-sane             |    8 -
 .../wpa-supplicant/wpa-supplicant-0.7.3/defconfig  |  157 ----------------
 .../wpa-supplicant/wpa-supplicant-0.7.3/init.sh    |   50 -----
 .../wpa_supplicant-0.5.7-always-scan.patch         |   14 --
 ...a_supplicant-fix-deprecated-dbus-function.patch |  189 --------------------
 .../wpa_supplicant_default.conf                    |   13 --
 .../wpa-supplicant/wpa-supplicant-0.7.inc          |    8 +-
 .../wpa-supplicant/wpa-supplicant_0.7.3.bb         |    2 +-
 .../console-tools/console-tools_0.3.2.bb           |   27 +---
 meta/recipes-core/coreutils/coreutils_6.9.bb       |   44 +++---
 meta/recipes-core/coreutils/coreutils_8.14.bb      |   49 ++----
 meta/recipes-core/dropbear/dropbear.inc            |    4 +
 meta/recipes-core/dropbear/dropbear_2012.55.bb     |    2 +-
 meta/recipes-core/kbd/kbd_1.15.2.bb                |   34 +---
 meta/recipes-core/ncurses/ncurses.inc              |    5 +-
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |   44 ++----
 meta/recipes-devtools/binutils/binutils.inc        |    1 +
 meta/recipes-devtools/gcc/gcc-package-target.inc   |    8 +-
 meta/recipes-devtools/gcc/libgcc_4.6.bb            |    2 +-
 meta/recipes-devtools/python/python_2.7.2.bb       |    9 +-
 .../a4d1f142542935b90d2eb30f3aead4edcf455fe6.patch |   66 +++++++
 meta/recipes-devtools/qemu/qemu_0.15.1.bb          |    3 +-
 meta/recipes-devtools/quilt/quilt-0.51.inc         |    5 -
 meta/recipes-devtools/quilt/quilt-native.inc       |    6 +
 meta/recipes-devtools/quilt/quilt-native_0.51.bb   |    2 +-
 meta/recipes-devtools/quilt/quilt_0.51.bb          |    2 +-
 meta/recipes-extended/augeas/augeas.inc            |    2 +-
 meta/recipes-extended/cpio/cpio_2.11.bb            |    2 +-
 meta/recipes-extended/cpio/cpio_2.8.bb             |    2 +-
 meta/recipes-extended/cpio/cpio_v2.inc             |    3 +
 meta/recipes-extended/findutils/findutils.inc      |    5 +-
 .../recipes-extended/findutils/findutils_4.2.31.bb |   22 +--
 meta/recipes-extended/findutils/findutils_4.4.2.bb |   17 +--
 meta/recipes-extended/grep/grep_2.5.1a.bb          |   25 +--
 meta/recipes-extended/grep/grep_2.9.bb             |   22 +--
 meta/recipes-extended/gzip/gzip.inc                |   32 +---
 meta/recipes-extended/gzip/gzip_1.3.12.bb          |   24 +--
 meta/recipes-extended/gzip/gzip_1.4.bb             |    2 +-
 meta/recipes-extended/hdparm/hdparm_9.39.bb        |   16 +-
 meta/recipes-extended/iputils/iputils_s20101006.bb |    5 +-
 .../net-tools/net-tools_1.60-23.bb                 |   28 +--
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |   42 ++---
 meta/recipes-extended/sysstat/sysstat_10.0.3.bb    |    8 -
 meta/recipes-extended/sysstat/sysstat_10.0.4.bb    |    8 +
 meta/recipes-gnome/gthumb/gthumb_2.12.4.bb         |    2 +
 .../xorg-xserver/xserver-kdrive.inc                |    2 +-
 .../module-init-tools/module-init-tools_3.16.bb    |   35 +++--
 .../lame/{lame_3.99.3.bb => lame_3.99.5.bb}        |    4 +-
 meta/recipes-qt/qt4/qt4-x11-free.inc               |    3 +
 meta/recipes-rt/rt-tests/rt-tests_0.83.bb          |    3 +-
 meta/recipes-support/bdwgc/bdwgc_20110107.bb       |    2 +
 meta/recipes-support/sqlite/sqlite3_3.7.10.bb      |   11 --
 meta/recipes-support/sqlite/sqlite3_3.7.11.bb      |   11 ++
 68 files changed, 581 insertions(+), 836 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman/0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/test-set-ipv4-method-api-fix.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/test-set-ipv6-method-api-fix.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/defaults-sane
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/defconfig
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/init.sh
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/wpa_supplicant-0.5.7-always-scan.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/wpa_supplicant-fix-deprecated-dbus-function.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/wpa_supplicant_default.conf
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/a4d1f142542935b90d2eb30f3aead4edcf455fe6.patch
 delete mode 100644 meta/recipes-extended/sysstat/sysstat_10.0.3.bb
 create mode 100644 meta/recipes-extended/sysstat/sysstat_10.0.4.bb
 rename meta/recipes-multimedia/lame/{lame_3.99.3.bb => lame_3.99.5.bb} (86%)
 delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.10.bb
 create mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.11.bb

-- 
1.7.7.6




Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id B92A060667
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 05:28:08 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 21 Jul 2013 22:28:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,717,1367996400"; d="scan'208";a="271414423"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.5])
	by AZSMGA002.ch.intel.com with ESMTP; 21 Jul 2013 22:28:08 -0700
From: Saul Wold <sgw@linux.intel.com>
To: paul.eggleton@linux.intel.com, ross.burton@intel.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 21 Jul 2013 22:28:08 -0700
Message-Id: <cover.1374470774.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
MIME-Version: 1.0
Subject: [CONSOLIDATED PULL 00/36] Please review and ACK
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
X-List-Received-Date: Mon, 22 Jul 2013 05:28:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Paul, Ross:

Please review this set, I know Ross might be travelling today,
so this may be delayed until the end of the day or tomorrow.

**** NOTE TO BSP Maintainers: This will require a mesa bbappend sync when pulled *****
**** I will send email when that happens, so please prepare your branches        *****

I verified that Ema's changes do not cause any backward revs.

I tested this set twice on the AB, the first set failed with the util-linux
patch, then I built master again, and rebuilt this set without the util-linux
change and it built great (execpt for the missing Mesa updates to BSP).

There appears to be one testimage failure with Mips and SMART, I will forward
that to Stephan as it might be a test case issue.


Thanks
        Sau!
 
The following changes since commit 8fc6904fe97438478119db6cd23b7b4eb33b50aa:

  curl: add upstream status to patch (2013-07-18 12:21:13 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

André Draszik (1):
  directfb: don't patch pkg-config files

Beth Flanagan (1):
  adt_installer_internal: fix spelling error

Chen Qi (2):
  useradd.bbclass: add a new base class and code refactor
  extrausers.bbclass: add a new bbclass

Daniel Nilsson (1):
  glew: Update GLEW version number in autotools patch

Emilia Ciobanu (11):
  rt-tests: add GIT revision to PV variable
  kmod:add GIT revision to PV variable
  hwlatdetect: add GIT revision to PV variable
  lttng-ust:add GIT revision to PV variable
  connman-gnome: add GIT revision to PV variable
  mtd-utils: add GIT revision to PV variable
  update-rc.d: add GIT revision to PV variable
  build-appliance-image: add GIT revision to PV variable
  lttng-modules: Append _git to recipe name and add GIT revision to PV  
      variable
  chkconfig-alternatives-native: add GIT revision to PV variable
  docbook-sgml-dtd-4.5-native.bb: Add real PV inside the recipe

Jesse Zhang (1):
  tremor: add a patch to build with arm thumb

Jonathan Liu (5):
  systemd: remove unneeded modprobe.rules
  mesa: upgrade to 9.1.5
  wget: backport fixes for documentation build errors
  mesa: use LLVM 3.3 by default
  boot-directdisk: use awk instead of echo -ne for dash compatibility

Martin Jansa (7):
  gst-plugins-good: add PACKAGECONFIG for jack
  gst-plugins-ugly: add PACKAGECONFIG for x264, cdio, dvdread
  pulseaudio: add PACKAGECONFIG for jack
  subversion: add PACKAGECONFIG for sasl
  gst-plugins-bad: add few more PACKAGECONFIGs
  cups: add PACKAGECONFIG for avahi
  mesa: add Upstream-Status

Ming Liu (1):
  libpam: add a new 'nullok_secure' option support to pam_unix

Muhammad Shakeel (1):
  systemd: Remove systemd_unitdir if systemd is not in distro features

Petter Mabäcker (1):
  remake: fix insufficient gettext dependency

Ross Burton (1):
  initrdscripts: mount / as read-only when live-booting

Saul Wold (1):
  pigz: Fix typo in ALTERNATIVES line

Tudor Florea (2):
  python: Add ptest
  kmod: Add ptest

 meta/classes/boot-directdisk.bbclass               |   2 +-
 meta/classes/extrausers.bbclass                    |  61 ++++++
 meta/classes/systemd.bbclass                       |   9 +
 meta/classes/useradd.bbclass                       |  99 +--------
 meta/classes/useradd_base.bbclass                  | 230 +++++++++++++++++++++
 .../connman/connman-gnome_0.7.bb                   |   2 +
 .../images/build-appliance-image_8.0.bb            |   2 +
 meta/recipes-core/initrdscripts/files/init-live.sh |   6 +-
 meta/recipes-core/systemd/systemd/modprobe.rules   |  17 --
 meta/recipes-core/systemd/systemd_204.bb           |   1 -
 meta/recipes-core/update-rc.d/update-rc.d_0.7.bb   |   1 +
 .../docbook-sgml-dtd-4.5-native.bb                 |   1 +
 .../adt-installer/scripts/adt_installer_internal   |   2 +-
 .../add-exclusion-to-mkfs-jffs2-git-2.patch        |   0
 ...t-cleanmarker-with-flash_erase--j-command.patch |   0
 meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb       |   2 +-
 .../python/python/fix-makefile-for-ptest.patch     |  33 +++
 meta/recipes-devtools/python/python/run-ptest      |   5 +
 meta/recipes-devtools/python/python_2.7.3.bb       |  10 +
 meta/recipes-devtools/remake/remake_git.bb         |   6 +-
 .../subversion/subversion_1.6.15.bb                |   2 +
 .../subversion/subversion_1.7.10.bb                |   2 +
 .../chkconfig-alternatives-native_1.3.59.bb        |   2 +-
 meta/recipes-extended/cups/cups16.inc              |   3 +
 .../pam-security-abstract-securetty-handling.patch | 200 ++++++++++++++++++
 .../pam/libpam/pam-unix-nullok-secure.patch        | 222 ++++++++++++++++++++
 meta/recipes-extended/pam/libpam_1.1.6.bb          |   4 +-
 meta/recipes-extended/pigz/pigz.inc                |   2 +-
 meta/recipes-extended/wget/wget-1.14/fix_doc.patch |  71 +++++++
 meta/recipes-extended/wget/wget_1.14.bb            |   1 +
 meta/recipes-graphics/directfb/directfb.inc        |   1 -
 .../directfb-1.2.x-fix-pkgconfig-cflags.patch      |  48 -----
 meta/recipes-graphics/glew/files/autotools.patch   |   4 +-
 ...ate-NativeDisplayType-depending-on-config.patch |   3 +
 ...move-the-power-of-two-sizeof-struct-cmd_b.patch |   0
 meta/recipes-graphics/mesa/mesa.inc                |   2 +-
 ...ate-NativeDisplayType-depending-on-config.patch |   3 +
 .../mesa/{mesa_9.1.3.bb => mesa_9.1.5.bb}          |   4 +-
 meta/recipes-kernel/kmod/kmod.inc                  |   4 +-
 meta/recipes-kernel/kmod/kmod/ptest.patch          |  25 +++
 meta/recipes-kernel/kmod/kmod/run-ptest            |   5 +
 meta/recipes-kernel/kmod/kmod_git.bb               |  10 +
 ...lttng-modules_2.2.0.bb => lttng-modules_git.bb} |   2 +-
 meta/recipes-kernel/lttng/lttng-ust_2.2.0.bb       |   2 +-
 .../gstreamer/gst-plugins-bad_0.10.23.bb           |   8 +
 .../gstreamer/gst-plugins-good_0.10.31.bb          |   1 +
 .../gstreamer/gst-plugins-ugly_0.10.19.bb          |   5 +
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |   1 +
 .../tremor/tremor-20120314/tremor-arm-thumb2.patch | 104 ++++++++++
 meta/recipes-multimedia/tremor/tremor_20120314.bb  |   1 +
 meta/recipes-rt/rt-tests/hwlatdetect_0.85.bb       |   1 +
 meta/recipes-rt/rt-tests/rt-tests_0.85.bb          |   1 +
 52 files changed, 1057 insertions(+), 176 deletions(-)
 create mode 100644 meta/classes/extrausers.bbclass
 create mode 100644 meta/classes/useradd_base.bbclass
 delete mode 100644 meta/recipes-core/systemd/systemd/modprobe.rules
 rename meta/recipes-devtools/mtd/{mtd-utils-1.5.0 => mtd-utils}/add-exclusion-to-mkfs-jffs2-git-2.patch (100%)
 rename meta/recipes-devtools/mtd/{mtd-utils-1.5.0 => mtd-utils}/mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch (100%)
 create mode 100644 meta/recipes-devtools/python/python/fix-makefile-for-ptest.patch
 create mode 100644 meta/recipes-devtools/python/python/run-ptest
 create mode 100644 meta/recipes-extended/pam/libpam/pam-security-abstract-securetty-handling.patch
 create mode 100644 meta/recipes-extended/pam/libpam/pam-unix-nullok-secure.patch
 create mode 100644 meta/recipes-extended/wget/wget-1.14/fix_doc.patch
 delete mode 100644 meta/recipes-graphics/directfb/directfb/directfb-1.2.x-fix-pkgconfig-cflags.patch
 rename meta/recipes-graphics/mesa/{mesa-9.1.3 => mesa-9.1.5}/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch (98%)
 rename meta/recipes-graphics/mesa/{mesa-9.1.3 => mesa-9.1.5}/0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch (100%)
 rename meta/recipes-graphics/mesa/{mesa_9.1.3.bb => mesa_9.1.5.bb} (79%)
 create mode 100644 meta/recipes-kernel/kmod/kmod/ptest.patch
 create mode 100755 meta/recipes-kernel/kmod/kmod/run-ptest
 rename meta/recipes-kernel/lttng/{lttng-modules_2.2.0.bb => lttng-modules_git.bb} (97%)
 create mode 100644 meta/recipes-multimedia/tremor/tremor-20120314/tremor-arm-thumb2.patch

-- 
1.8.1.4



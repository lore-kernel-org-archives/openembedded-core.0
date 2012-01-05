Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rigxt-0001EI-Mj
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 07:38:18 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Jan 2012 22:30:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="94663890"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.127])
	by orsmga002.jf.intel.com with ESMTP; 04 Jan 2012 22:30:54 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jan 2012 22:30:25 -0800
Message-Id: <cover.1325744640.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [CONSOLIDATED PULL 00/28] Build Fixes and Updates
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
X-List-Received-Date: Thu, 05 Jan 2012 06:38:18 -0000

Richard,

This is a set of changes that have been built and booted for 
sato. This address the failure we have seen on the Autobuilder,
please check the master_under_test build currenly building.

We have another kernel update from Bruce, with the sanity checks
from Scott G. along with other change from the community.
The matchbox changes make sense based on a better explaination 
from Edwin.

Please review overall, but I am positive about this change set.

Sau!

The following changes since commit f309769d10cb3d8b72b8c7c4f7f418dcb8422c61:

  valgrind: Fix for automake update (2012-01-04 16:03:59 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Bruce Ashfield (3):
  kern-tools: import flexible branching support
  linux-yocto: bump kernel version to v3.0.14
  linux-yocto: use src_patches for out of tree kernel feature support

Christopher Larson (1):
  opkg-utils: use /usr/bin/env python

Derek Buitenhuis (2):
  binutils-cross-canadian: Allow ld-is-gold
  binutils: Allow plugins

Gary Thomas (1):
  xserver-kdrive: work around issues with -Werror=address

Joshua Lock (2):
  alsa-state: add alsa-state from oe classic
  task-base: add alsa-state to task-base-alsa

Otavio Salvador (3):
  udev: use 'echo' instead of 'echo -n' in init script
  udev: split utilities onto udev-utils
  udev: remove commented code from init script (no code changes)

Phil Blundell (1):
  python-native: correct prefix handling for oe-core sysroot layout

Saul Wold (6):
  image_types: Fix rootfs size calcuation
  glib-2.0: ensure dtrace is diabled for all distro options and fix
    packaging
  libxp: fix cast error
  Patch Upstream-Status Update
  util-linux: Update patch for non-GPLv3
  gnutls: remove gettext patch for non-GPLv3

Scott Garman (7):
  ncurses: move libraries to base_libdir
  libcap: move library to base_libdir
  util-linux: move libraries to base_libdir
  e2fsprogs: move libraries to base_libdir
  libusb1: move libraries to base_libdir
  libusb-compat: move libraries to base_libdir
  insane.bbclass: add QA tests for unsafe references to exec_prefix

Zhai Edwin (1):
  matchbox-wm: Remove x-session-manager handling

Zhenhua Luo (1):
  linux-dtb: add multi-dtb build support and keep dtb in deploy cache
    package

 meta/classes/image_types.bbclass                   |    2 +-
 meta/classes/insane.bbclass                        |  111 ++++++-
 meta/classes/kernel-yocto.bbclass                  |   67 ++++-
 meta/recipes-bsp/alsa-state/alsa-state.bb          |   57 +++
 meta/recipes-bsp/alsa-state/alsa-state/alsa-state  |   29 ++
 meta/recipes-bsp/alsa-state/alsa-state/asound.conf |   12 +
 .../recipes-bsp/alsa-state/alsa-state/asound.state |    1 +
 meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb      |    2 +-
 meta/recipes-core/glib-2.0/glib.inc                |    9 +-
 meta/recipes-core/ncurses/ncurses.inc              |   27 +-
 meta/recipes-core/tasks/task-base.bb               |    5 +-
 meta/recipes-core/udev/udev.inc                    |   18 +-
 meta/recipes-core/udev/udev/init                   |    3 +-
 meta/recipes-core/udev/udev_164.bb                 |    2 +-
 .../util-linux-2.20.1/remove-lscpu.patch           |   94 +-----
 meta/recipes-core/util-linux/util-linux.inc        |   20 +-
 meta/recipes-core/util-linux/util-linux_2.20.1.bb  |    2 +-
 .../binutils/binutils-cross-canadian.inc           |    4 +-
 meta/recipes-devtools/binutils/binutils-cross.inc  |    3 +-
 .../e2fsprogs/e2fsprogs_1.41.14.bb                 |   29 +-
 meta/recipes-devtools/guilt/files/guilt-bash.patch |    2 +
 .../guilt/files/guilt-import-commit.patch          |    2 +
 meta/recipes-devtools/guilt/files/guilt-init.patch |    2 +
 meta/recipes-devtools/guilt/files/guilt-pop.patch  |    2 +
 .../guilt/files/guilt-push-no-series.patch         |    2 +
 meta/recipes-devtools/guilt/files/guilt-push.patch |    2 +
 .../guilt/files/guilt-set-git_exec_path.patch      |    2 +
 meta/recipes-devtools/guilt/files/guilt.patch      |    2 +
 .../guilt/files/improve_auto_header_gen.patch      |    2 +
 .../files/make_git_commands_conditional.patch      |    2 +
 .../guilt/files/optional_head_check.patch          |    2 +
 .../guilt/files/uninstall_force.patch              |    2 +
 .../opkg-utils/opkg-utils/shebang.patch            |   46 +++
 meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb |    3 +-
 ...2-distutils-prefix-is-inside-staging-area.patch |   22 +-
 .../recipes-devtools/python/python-native_2.7.2.bb |    2 +-
 .../matchbox-wm/matchbox-wm_1.2.bb                 |    9 +-
 .../matchbox-wm/matchbox-wm_git.bb                 |    9 +-
 .../mini-x-session/mini-x-session_0.1.bb           |    2 +-
 .../xorg-lib/libxp/fix-cast-error.patch            |   42 +++
 meta/recipes-graphics/xorg-lib/libxp_1.0.1.bb      |    4 +-
 .../error-address-work-around.patch                |  362 ++++++++++++++++++++
 .../xorg-xserver/xserver-kdrive_1.7.99.2.bb        |    3 +-
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 meta/recipes-kernel/linux/linux-dtb.inc            |   33 ++-
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb    |    8 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |   19 +-
 meta/recipes-support/gnutls/gnutls_2.12.14.bb      |   13 +-
 meta/recipes-support/libcap/libcap.inc             |   15 +-
 meta/recipes-support/libcap/libcap_2.22.bb         |    2 +-
 meta/recipes-support/libusb/libusb-compat_0.1.3.bb |   12 +-
 meta/recipes-support/libusb/libusb1_1.0.8.bb       |   16 +-
 52 files changed, 935 insertions(+), 210 deletions(-)
 create mode 100644 meta/recipes-bsp/alsa-state/alsa-state.bb
 create mode 100755 meta/recipes-bsp/alsa-state/alsa-state/alsa-state
 create mode 100644 meta/recipes-bsp/alsa-state/alsa-state/asound.conf
 create mode 100644 meta/recipes-bsp/alsa-state/alsa-state/asound.state
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/shebang.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxp/fix-cast-error.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/error-address-work-around.patch

-- 
1.7.6.4




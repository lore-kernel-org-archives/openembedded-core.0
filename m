Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4440A6009A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 06:10:55 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 14 Aug 2013 23:10:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,882,1367996400"; d="scan'208";a="381240014"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.106])
	by fmsmga001.fm.intel.com with ESMTP; 14 Aug 2013 23:10:54 -0700
From: Saul Wold <sgw@linux.intel.com>
To: ross.burton@intel.com, paul.eggleton@linux.intel.com,
	openembedded-core@lists.openembedded.org, clarson@kergoth.com
Date: Wed, 14 Aug 2013 23:10:54 -0700
Message-Id: <cover.1376546582.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [CONSOLIDATED PULL 00/33] Review & ACK
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
X-List-Received-Date: Thu, 15 Aug 2013 06:10:55 -0000

Paul, Ross:

Please review this set, it include the Read-Only rootfs, which I have
tested locally. I also included the makedev change, and I verified it's
correctly using the rootfs to find the passwd and group files.

Thanks
	Sau!


The following changes since commit 57662d4f813d5795cac1529633db80a09efdb089:

  meta-skeleton: Add busybox config fragment example (2013-08-13 23:03:44 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Chen Qi (14):
  opkg.inc: remove the obsolete POSTLOG variable
  makedevs: support using user/group names in device table files
  image.bbclass: create device table after package installation
  device_table-minimal.txt: use user/group names instead of uid/gid
  init-live.sh: make $ROOT_MOUNT/media writable when necessary
  use a uniform way to determine whether rootfs is read-only
  udev: remove implicit dependency on initscripts
  populate-volatile.sh: use $ROOT_DIR/var/volatile/tmp as TMPDIR
  populate-volatile.sh: don't spawn background process at rootfs time
  runqemu-internal: fix to start X correctly in live images
  initscripts: use a uniform way to handle directories in read-only
    rootfs
  populate-volatile.sh: use 'cp -a' to avoid potential problem
  irda-utils: fix for read-only rootfs
  openssh: fix for read-only rootfs

Cristiana Voicu (1):
  systemtap: upgrade to 2.3

Martin Jansa (5):
  at-spi2-core: add intltool-native dependency
  gst-plugins-gl: add dependency on glew
  xeyes: add dependency on libxrender
  xrestop: add dependency on ncurses
  qemu, default-providers: Add mesa as default virtual/egl

Muhammad Shakeel (3):
  lighttpd: Replace spaces with tabs in shell function
  rpcbind: Replace spaces with tabs in shell function
  nfs-utils: Replace spaces with tabs in shell function

Otavio Salvador (1):
  linux-dtb: Use kernel build system to generate the dtb files

Ross Burton (4):
  cogl: GL/GLX feature cleanup
  libmatchbox: upgrade to 1.11
  matchbox-wm: fix icon handling on 64-bit hosts
  wipe-sysroots: don't assume TMPDIR is under BUILDDIR

Saul Wold (2):
  meta-skeleton: layer.conf Should also have .bbappend in example
  texinfo: add perl RDEPENDS and fix up packaging

Stefan Herbrechtsmeier (1):
  cmake.bbclass: Don't use packages from the native build machine

Wenzong Fan (1):
  oe/path.py: call /bin/cp directly

Yevhen Kyriukha (1):
  connman: fix systemd support for connman-* packages.

 meta-skeleton/conf/layer.conf                      |   2 +-
 meta/classes/cmake.bbclass                         |   1 +
 meta/classes/image.bbclass                         |  24 ++-
 meta/conf/distro/include/default-providers.inc     |   1 +
 meta/conf/machine/include/qemu.inc                 |   1 +
 meta/files/device_table-minimal.txt                |  42 ++---
 meta/lib/oe/path.py                                |   2 +-
 meta/recipes-connectivity/connman/connman.inc      |   8 +
 .../irda-utils/irda-utils-0.9.18/init              |  13 +-
 .../nfs-utils/nfs-utils_1.2.8.bb                   |   2 +-
 .../openssh/openssh-6.2p2/init                     |  22 ++-
 meta/recipes-connectivity/openssh/openssh_6.2p2.bb |   9 +-
 meta/recipes-core/initrdscripts/files/init-live.sh |   2 +
 .../initscripts/initscripts-1.0/functions          |  14 ++
 .../initscripts-1.0/populate-volatile.sh           |  15 +-
 .../initscripts-1.0/read-only-rootfs-hook.sh       |  48 ++++-
 meta/recipes-core/initscripts/initscripts_1.0.bb   |   5 +
 meta/recipes-core/sysvinit/sysvinit/rcS-default    |   4 -
 meta/recipes-core/udev/udev/init                   |  21 ++-
 meta/recipes-core/udev/udev/udev-cache             |   5 +
 .../makedevs/makedevs-1.0.0/makedevs.c             | 207 ++++++++++++++++++---
 meta/recipes-devtools/opkg/opkg.inc                |   2 -
 meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb  |   8 +-
 .../0001-add-is_rootfs_readonly-to-functions.patch |  37 ++++
 meta/recipes-extended/lsb/lsbinitscripts_9.48.bb   |   1 +
 meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb     |  12 +-
 meta/recipes-extended/texinfo/texinfo_5.1.bb       |   5 +-
 meta/recipes-graphics/cogl/cogl-1.0.inc            |  17 +-
 meta/recipes-graphics/libmatchbox/files/check.m4   | 133 -------------
 .../{libmatchbox_1.10.bb => libmatchbox_1.11.bb}   |  15 +-
 .../matchbox-wm/matchbox-wm_git.bb                 |   3 +-
 meta/recipes-graphics/xorg-app/xeyes_1.1.1.bb      |   2 +-
 meta/recipes-graphics/xrestop/xrestop_0.4.bb       |   2 +-
 meta/recipes-kernel/linux/linux-dtb.inc            |  58 +++---
 meta/recipes-kernel/systemtap/systemtap_git.bb     |   6 +-
 meta/recipes-kernel/systemtap/systemtap_git.inc    |   4 +-
 .../gstreamer/gst-plugins-gl_0.10.3.bb             |   2 +-
 meta/recipes-support/atk/at-spi2-core_2.8.0.bb     |   2 +-
 scripts/runqemu-internal                           |   2 +-
 scripts/wipe-sysroot                               |  24 ++-
 40 files changed, 466 insertions(+), 317 deletions(-)
 create mode 100644 meta/recipes-extended/lsb/lsbinitscripts/0001-add-is_rootfs_readonly-to-functions.patch
 delete mode 100644 meta/recipes-graphics/libmatchbox/files/check.m4
 rename meta/recipes-graphics/libmatchbox/{libmatchbox_1.10.bb => libmatchbox_1.11.bb} (70%)

-- 
1.8.1.4



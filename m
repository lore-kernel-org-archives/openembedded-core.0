Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RYZhA-0007dK-EH
	for openembedded-core@openembedded.org; Thu, 08 Dec 2011 09:51:12 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 08 Dec 2011 00:44:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="99987695"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.35])
	by fmsmga002.fm.intel.com with ESMTP; 08 Dec 2011 00:44:19 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Thu,  8 Dec 2011 00:44:00 -0800
Message-Id: <cover.1323333676.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
MIME-Version: 1.0
Subject: [CONSOLIDATED PULL 00/17] Master Fixes & Self-Hosted Fixes
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
X-List-Received-Date: Thu, 08 Dec 2011 08:51:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Richard,

This patch set has fixes for various issues along with a set of
fixes to address various problem found with the self-hosted image.

There is another patch sent to poky@yoctoproecjt.org to address having
grub installed by default.

Sau!

The following changes since commit 493746f1d7f1410284880203c1ac462d61ab5299:

  matchbox-session-sato: respect VIRTUAL-RUNTIME_initscripts settings (2011-12-07 12:42:22 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andrea Adami (2):
  image_types.bbclass: implement jffs2 summary images (sum.jffs2)
  image_types.bbclass: disable cleanmarkers for jffs2 images

Eric Bénard (1):
  rootfs_ipk: implement FEED_DEPLOYDIR_BASE_URI support

Martin Jansa (1):
  sysstat: don't run populate-volatile.sh update in do_rootfs or
    without populate-volatile.sh

Mei Lei (2):
  dropbear: Upgrade from 0.53.1 to 2011.54
  distro_tracking_fields.inc: Update dropbear,iproute2,net-tools
    tracking information.

Otavio Salvador (1):
  initramfs-framework: provides a modular initramfs

Paul Eggleton (2):
  qt4: fix debug symbol stripping
  qt4: various tidy-ups

Richard Purdie (2):
  dpkg: Fix preinst execution
  bitbake.conf/image.bbclass: Ensure images use the correct
    passwd/group files

Saul Wold (6):
  grub: Create /etc/grub.d
  initrdscripts: add sleep to avoid kernel messages before install
    message
  self-hosted-image: remove extra space since we use additional disk
    instead
  wget: enable https and openssl
  self-hosted: Add ext2 utilites and perl-pod for building
  ncurses: libcurses.so should link to libncurses.so

 meta/classes/image.bbclass                         |    2 +
 meta/classes/image_types.bbclass                   |    7 +-
 meta/classes/rootfs_ipk.bbclass                    |   13 ++-
 meta/conf/bitbake.conf                             |    3 +-
 .../conf/distro/include/distro_tracking_fields.inc |   19 ++--
 meta/recipes-bsp/grub/grub_1.99.bb                 |    3 +-
 .../configure.patch                                |    0
 .../dropbear/dropbear/allow-nopw.patch             |   55 +++------
 meta/recipes-core/dropbear/dropbear_0.53.1.bb      |    6 -
 meta/recipes-core/dropbear/dropbear_2011.54.bb     |    6 +
 meta/recipes-core/images/self-hosted-image.bb      |    4 +-
 .../initrdscripts/files/init-install.sh            |    3 +
 .../initrdscripts/initramfs-framework/debug        |   82 ++++++++++++
 .../initrdscripts/initramfs-framework/e2fs         |   28 ++++
 .../initrdscripts/initramfs-framework/finish       |   46 +++++++
 .../initrdscripts/initramfs-framework/init         |  136 ++++++++++++++++++++
 .../initrdscripts/initramfs-framework/mdev         |   30 +++++
 .../initrdscripts/initramfs-framework/udev         |   22 +++
 .../initrdscripts/initramfs-framework_1.0.bb       |   57 ++++++++
 meta/recipes-core/ncurses/ncurses.inc              |    6 +-
 meta/recipes-core/tasks/task-self-hosted.bb        |    5 +-
 meta/recipes-devtools/dpkg/dpkg/preinst.patch      |   46 +++++++
 meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb        |    5 +-
 meta/recipes-extended/sysstat/sysstat.inc          |    7 +-
 meta/recipes-extended/sysstat/sysstat_10.0.3.bb    |    2 +-
 meta/recipes-extended/wget/wget.inc                |    6 +-
 .../qt4/files/add_nostrip_for_debug_packages.diff  |   23 ++++
 meta/recipes-qt/qt4/qt-4.7.4.inc                   |    4 +-
 meta/recipes-qt/qt4/qt4-embedded.inc               |    3 +-
 meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb          |    2 +-
 meta/recipes-qt/qt4/qt4-native.inc                 |    3 +-
 meta/recipes-qt/qt4/qt4-native_4.7.4.bb            |    2 -
 meta/recipes-qt/qt4/qt4-x11-free.inc               |    4 +-
 meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb          |    2 +-
 meta/recipes-qt/qt4/qt4.inc                        |    6 +-
 35 files changed, 565 insertions(+), 83 deletions(-)
 rename meta/recipes-core/dropbear/{dropbear-0.53.1 => dropbear-2011.54}/configure.patch (100%)
 delete mode 100644 meta/recipes-core/dropbear/dropbear_0.53.1.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2011.54.bb
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-framework/debug
 create mode 100755 meta/recipes-core/initrdscripts/initramfs-framework/e2fs
 create mode 100755 meta/recipes-core/initrdscripts/initramfs-framework/finish
 create mode 100755 meta/recipes-core/initrdscripts/initramfs-framework/init
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-framework/mdev
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-framework/udev
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/preinst.patch
 create mode 100644 meta/recipes-qt/qt4/files/add_nostrip_for_debug_packages.diff

-- 
1.7.6.4




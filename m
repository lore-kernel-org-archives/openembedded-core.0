Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1Qbkpd-0006b8-Kq
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 04:48:50 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Jun 2011 19:45:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,441,1304319600"; d="scan'208";a="19508877"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.20])
	by orsmga002.jf.intel.com with ESMTP; 28 Jun 2011 19:45:05 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jun 2011 10:59:30 +0800
Message-Id: <cover.1309315723.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/6 v4][PULL] 3G network support
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
X-List-Received-Date: Wed, 29 Jun 2011 02:48:50 -0000

Hi,

This is the 4th version of 3G patches, please help to review and pull.

Changes from v3:
1) Use DISTRO_FEATURE to handle the dependency of ofono.
2) Adopt ofono 0.50 version which could work with Ericsson modem.
   (ofono's commit d99ca17 fixed the crash issue)

Thanks,
Dongxiao

The following changes since commit a4f3e006e1f2fd93f156012af2a05adccf41d065:

  u-boot-mkimage: bump version to 2011.03 (2011-06-28 17:13:19 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/ggg-v4
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/ggg-v4

Dongxiao Xu (6):
  connman: Upgrade to version 0.75
  wpa-supplicant: remove the 0.6.10 version.
  ofono: upgrade to version 0.50
  connman-gnome: Add 3G configuration support
  initscript: Change some order of init scripts
  task-base: add 3G into DISTRO_FEATURE

 meta/conf/distro/include/default-distrovars.inc    |    2 +-
 meta/conf/distro/include/default-versions.inc      |    4 -
 .../connman-0.65/fix-shutdown-ap-disconnect.patch  |   42 --
 .../add_xuser_dbus_permission.patch                |    2 +
 .../connman/{connman-0.65 => connman-0.75}/connman |    0
 .../{connman-0.65 => connman-0.75}/dbusperms.patch |    2 +
 .../connman/connman-gnome/3g.patch                 |  505 ++++++++++++++
 .../connman/connman-gnome_0.5.bb                   |    8 +-
 meta/recipes-connectivity/connman/connman.inc      |   14 +-
 .../connman/{connman_0.65.bb => connman_0.75.bb}   |    8 +-
 meta/recipes-connectivity/ofono/ofono.inc          |    2 +
 meta/recipes-connectivity/ofono/ofono_0.45.bb      |    9 -
 meta/recipes-connectivity/ofono/ofono_0.50.bb      |   13 +
 .../wpa-supplicant-0.6.10/99_wpa_supplicant        |    1 -
 .../wpa-supplicant-0.6.10/defaults-sane            |    8 -
 .../wpa-supplicant-0.6.10/defconfig-0.6.0-gnutls   |  180 -----
 .../wpa-supplicant-0.6.10/wpa-supplicant.sh        |   85 ---
 .../wpa-supplicant-0.6.10/wpa_supplicant.conf      |  690 --------------------
 .../wpa-supplicant-0.6.10/wpa_supplicant.conf-sane |    7 -
 .../wpa-supplicant/wpa-supplicant-0.6.inc          |   83 ---
 .../wpa-supplicant/wpa-supplicant_0.6.10.bb        |    4 -
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    6 +-
 meta/recipes-core/tasks/task-base.bb               |   16 +-
 meta/recipes-core/udev/udev-new.inc                |    2 +-
 meta/recipes-core/udev/udev_164.bb                 |    2 +-
 .../modutils/modutils-initscripts.bb               |    4 +-
 26 files changed, 568 insertions(+), 1131 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman-0.65/fix-shutdown-ap-disconnect.patch
 rename meta/recipes-connectivity/connman/{connman-0.65 => connman-0.75}/add_xuser_dbus_permission.patch (94%)
 rename meta/recipes-connectivity/connman/{connman-0.65 => connman-0.75}/connman (100%)
 rename meta/recipes-connectivity/connman/{connman-0.65 => connman-0.75}/dbusperms.patch (91%)
 create mode 100644 meta/recipes-connectivity/connman/connman-gnome/3g.patch
 rename meta/recipes-connectivity/connman/{connman_0.65.bb => connman_0.75.bb} (74%)
 delete mode 100644 meta/recipes-connectivity/ofono/ofono_0.45.bb
 create mode 100644 meta/recipes-connectivity/ofono/ofono_0.50.bb
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.6.10/99_wpa_supplicant
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.6.10/defaults-sane
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.6.10/defconfig-0.6.0-gnutls
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.6.10/wpa-supplicant.sh
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.6.10/wpa_supplicant.conf
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.6.10/wpa_supplicant.conf-sane
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.6.inc
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.6.10.bb




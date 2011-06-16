Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QX8cP-0006GL-4r
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Jun 2011 11:12:05 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Jun 2011 02:08:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,374,1304319600"; d="scan'208";a="15551399"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.20])
	by orsmga001.jf.intel.com with ESMTP; 16 Jun 2011 02:08:23 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Jun 2011 17:20:29 +0800
Message-Id: <cover.1308215406.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/6 v2][PULL] 3G network support in Yocto
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
X-List-Received-Date: Thu, 16 Jun 2011 09:12:05 -0000

Hi Saul,

This is the second version of 3G support patches. Please help to review and pull.

Changes since v1:
1) Remove kernel.bbclass changes and put it to fishriver specific layer.
2) upgrade connman to the latest 0.75 version.
3) Add a fix for init scripts order.
4) Add fishriver in COMPATIBLE_MACHINE in systemtap recipe.
5) Rebase to latest master commit.

Thanks,
Dongxiao

The following changes since commit e1f6ebba3ab2fc8a469c1d96fc6d4c4b8f16845c:

  meta-yocto: use FILESEXTRAPATHS_prepend := in all bbappends (2011-06-15 11:49:42 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/ggg
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/ggg

Dongxiao Xu (6):
  connman: Upgrade to version 0.75
  wpa-supplicant: remove the 0.6.10 version.
  ofono: add 0.42 version which works OK for Ericsson 3G module.
  connman-gnome: Add 3G configuration support
  systemtap: add fishriver in COMPATIBLE_MACHINE
  initscript: Change some order of init scripts

 meta/conf/distro/include/default-versions.inc      |    1 +
 .../connman-0.65/fix-shutdown-ap-disconnect.patch  |   42 --
 .../add_xuser_dbus_permission.patch                |    2 +
 .../connman/{connman-0.65 => connman-0.75}/connman |    0
 .../{connman-0.65 => connman-0.75}/dbusperms.patch |    2 +
 .../connman/connman-gnome/3g.patch                 |  505 ++++++++++++++
 .../{connman-gnome_0.5.bb => connman-gnome_git.bb} |   12 +-
 meta/recipes-connectivity/connman/connman.inc      |    2 +-
 .../connman/{connman_0.65.bb => connman_0.75.bb}   |    8 +-
 meta/recipes-connectivity/ofono/ofono.inc          |    2 +
 meta/recipes-connectivity/ofono/ofono_0.42.bb      |   13 +
 .../wpa-supplicant-0.6.10/99_wpa_supplicant        |    1 -
 .../wpa-supplicant-0.6.10/defaults-sane            |    8 -
 .../wpa-supplicant-0.6.10/defconfig-0.6.0-gnutls   |  180 -----
 .../wpa-supplicant-0.6.10/wpa-supplicant.sh        |   85 ---
 .../wpa-supplicant-0.6.10/wpa_supplicant.conf      |  690 --------------------
 .../wpa-supplicant-0.6.10/wpa_supplicant.conf-sane |    7 -
 .../wpa-supplicant/wpa-supplicant-0.6.inc          |   83 ---
 .../wpa-supplicant/wpa-supplicant_0.6.10.bb        |    4 -
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    6 +-
 meta/recipes-core/udev/udev-new.inc                |    2 +-
 meta/recipes-core/udev/udev_164.bb                 |    2 +-
 .../modutils/modutils-initscripts.bb               |    4 +-
 meta/recipes-kernel/systemtap/systemtap_git.bb     |    2 +-
 24 files changed, 547 insertions(+), 1116 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman-0.65/fix-shutdown-ap-disconnect.patch
 rename meta/recipes-connectivity/connman/{connman-0.65 => connman-0.75}/add_xuser_dbus_permission.patch (94%)
 rename meta/recipes-connectivity/connman/{connman-0.65 => connman-0.75}/connman (100%)
 rename meta/recipes-connectivity/connman/{connman-0.65 => connman-0.75}/dbusperms.patch (91%)
 create mode 100644 meta/recipes-connectivity/connman/connman-gnome/3g.patch
 rename meta/recipes-connectivity/connman/{connman-gnome_0.5.bb => connman-gnome_git.bb} (76%)
 rename meta/recipes-connectivity/connman/{connman_0.65.bb => connman_0.75.bb} (74%)
 create mode 100644 meta/recipes-connectivity/ofono/ofono_0.42.bb
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.6.10/99_wpa_supplicant
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.6.10/defaults-sane
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.6.10/defconfig-0.6.0-gnutls
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.6.10/wpa-supplicant.sh
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.6.10/wpa_supplicant.conf
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.6.10/wpa_supplicant.conf-sane
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.6.inc
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.6.10.bb




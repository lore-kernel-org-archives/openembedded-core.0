Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QYvro-0000Lg-TB
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 09:59:25 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 21 Jun 2011 00:55:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,399,1304319600"; d="scan'208";a="18730750"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.20])
	by fmsmga002.fm.intel.com with ESMTP; 21 Jun 2011 00:55:50 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jun 2011 16:08:47 +0800
Message-Id: <cover.1308642976.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/5 v3][PULL] 3G support in Yocto
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
X-List-Received-Date: Tue, 21 Jun 2011 07:59:25 -0000

Hi,

This is the 3rd version of 3G patches, please help to review and pull.

Changes from v2:
1) Drop the changes to systemtap since Tom already has fixes.
2) Adopt some logic in meta-oe to handle RDEPENDS for connman recipe.
3) Drop some changes for connman-gnome.
3) Revise some commit message.

The following changes since commit 2163461ec94528ecf046a04edc5db3d2dd3a6b8b:

  systemtap: remove non-core COMPATIBLE_MACHINES (2011-06-16 22:14:06 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/ggg
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/ggg-v3

Dongxiao Xu (5):
  connman: Upgrade to version 0.75
  wpa-supplicant: remove the 0.6.10 version.
  ofono: add 0.42 version which works OK for Ericsson 3G module.
  connman-gnome: Add 3G configuration support
  initscript: Change some order of init scripts

 meta/conf/distro/include/default-versions.inc      |    1 +
 .../connman-0.65/fix-shutdown-ap-disconnect.patch  |   42 --
 .../add_xuser_dbus_permission.patch                |    2 +
 .../connman/{connman-0.65 => connman-0.75}/connman |    0
 .../{connman-0.65 => connman-0.75}/dbusperms.patch |    2 +
 .../connman/connman-gnome/3g.patch                 |  505 ++++++++++++++
 .../connman/connman-gnome_0.5.bb                   |    8 +-
 meta/recipes-connectivity/connman/connman.inc      |   16 +-
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
 23 files changed, 554 insertions(+), 1117 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman-0.65/fix-shutdown-ap-disconnect.patch
 rename meta/recipes-connectivity/connman/{connman-0.65 => connman-0.75}/add_xuser_dbus_permission.patch (94%)
 rename meta/recipes-connectivity/connman/{connman-0.65 => connman-0.75}/connman (100%)
 rename meta/recipes-connectivity/connman/{connman-0.65 => connman-0.75}/dbusperms.patch (91%)
 create mode 100644 meta/recipes-connectivity/connman/connman-gnome/3g.patch
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




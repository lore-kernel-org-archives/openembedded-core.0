Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1Tljn1-0002Kz-0e
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 18:20:12 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Dec 2012 09:05:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,324,1355126400"; d="scan'208";a="237071487"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.105.59])
	by orsmga001.jf.intel.com with ESMTP; 20 Dec 2012 09:05:23 -0800
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Dec 2012 19:11:03 +0200
Message-Id: <cover.1356022882.git.radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 00/28][RFC] systemd Integration
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
X-List-Received-Date: Thu, 20 Dec 2012 17:20:12 -0000

I've rebased my branch, again :), with some cleanups here and there
I also pushed a few patches suggested by Martin.
Feel free to comment on everything.

The following changes since commit 958162e96b4a4f23bca94500b5f20975633dd5c6:

  bitbake: hob: use base image only if it was set (2012-12-14 17:31:31 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib rmoisan/systemd
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rmoisan/systemd

Enrico Scholz (1):
  systemd: move disable operation into prerm() script

Holger Hans Peter Freyther (2):
  systemd: Make the main systemd files proper CONFFILES
  systemd: Introduce a create-volatile to create tmp directories

Khem Raj (1):
  systemd: Fix build when base_libdir is not /lib

Martin Donnelly (2):
  cgroups: Add INSANE_SKIP to avoid warning about .so file
  Remove sysvinit mount related services if systemd is enabled

Martin Jansa (2):
  systemd-systemctl-native: fix FILESPATH to find systemctl
  systemd: add PACKAGES_DYNAMIC

Radu Moisan (20):
  Systemd initial integration
  Add DISTRO_FEATURES_INITMAN to DISTRO_FEATURES
  Automatically set PREFERRED_PROVIDER_udev
  Add systemd_base.bbclass
  Include systemd-compat-units and avahi-systemd
  Inherit the systemd_base class
  set default.target to multi-user.target
  wpa-supplicant: Fix indentation
  dropbear: Fix indentation and cleanup
  systemd: Some more cleanup
  systemd: disable  source rcS-default
  polkit: merge together the two instances of PACKAGECONFIG
  systemd-native: update FILESPATH with *-native directory
  systemd: Remove gitpkgv.bbclass
  systemd: (temporary) remove dependency on cairo
  initscripts: Cleanup recipe
  systemd: disable sysfs.service
  xserver-nodm-init: add systemd support
  util-linux: Enable systemd support
  lighttpd: Remove automake patch

 meta/classes/base.bbclass                          |    7 +
 meta/classes/systemd.bbclass                       |    1 +
 meta/classes/systemd_base.bbclass                  |  218 +++++++++++++
 meta/conf/distro/include/default-distrovars.inc    |    3 +-
 meta/recipes-bsp/keymaps/files/keymaps.service     |    9 +
 meta/recipes-bsp/keymaps/keymaps_1.0.bb            |    9 +-
 meta/recipes-connectivity/avahi/avahi.inc          |   10 +-
 meta/recipes-connectivity/connman/connman.inc      |    6 +
 meta/recipes-connectivity/connman/connman_1.4.bb   |    3 +-
 meta/recipes-connectivity/dhcp/dhcp.inc            |   15 +-
 meta/recipes-connectivity/dhcp/files/dhcpd.service |   12 +
 .../dhcp/files/dhcrelay.service                    |   10 +
 .../openssh/openssh-6.0p1/sshd.socket              |   11 +
 .../openssh/openssh-6.0p1/sshd@.service            |    9 +
 .../openssh/openssh-6.0p1/sshdgenkeys.service      |   10 +
 meta/recipes-connectivity/openssh/openssh_6.0p1.bb |   14 +-
 .../wpa-supplicant/wpa-supplicant-1.0.inc          |   74 +++--
 .../wpa-supplicant/wpa-supplicant_1.0.bb           |    2 +-
 meta/recipes-core/busybox/busybox.inc              |   18 ++
 meta/recipes-core/busybox/busybox_1.20.2.bb        |    4 +-
 .../busybox/files/busybox-klogd.service.in         |    8 +
 .../busybox/files/busybox-syslog.service.in        |   13 +
 meta/recipes-core/dropbear/dropbear.inc            |   81 ++---
 .../recipes-core/dropbear/dropbear/dropbear.socket |   10 +
 .../dropbear/dropbear/dropbear@.service            |    9 +
 .../dropbear/dropbear/dropbearkey.service          |   10 +
 .../initscripts-1.0/{urandom => urandom.sh}        |    0
 meta/recipes-core/initscripts/initscripts_1.0.bb   |  166 +++++-----
 meta/recipes-core/libcgroup/libcgroup_0.37.1.bb    |    1 +
 .../packagegroups/packagegroup-base.bb             |    4 +-
 .../packagegroups/packagegroup-core-boot.bb        |    8 +-
 meta/recipes-core/systemd/systemd-compat-units.bb  |   59 ++++
 .../systemd/systemd-compat-units/machineid.service |   16 +
 .../systemd-compat-units/run-postinsts.service     |   17 +
 .../systemd/systemd-machine-units_1.0.bb           |   14 +
 meta/recipes-core/systemd/systemd-serialgetty.bb   |   46 +++
 .../systemd/systemd-serialgetty/LICENSE            |  339 ++++++++++++++++++++
 .../systemd-serialgetty/serial-getty@.service      |   32 ++
 meta/recipes-core/systemd/systemd-speed-hacks.bb   |   18 ++
 .../systemd/systemd-systemctl-native.bb            |   20 ++
 .../systemd/systemd-systemctl-native/systemctl     |  126 ++++++++
 .../systemd/systemd/create-volatile.conf           |   10 +
 meta/recipes-core/systemd/systemd/gtk-doc.make     |  230 +++++++++++++
 meta/recipes-core/systemd/systemd/modprobe.rules   |   17 +
 .../systemd/systemd/optional_secure_getenv.patch   |   19 ++
 .../systemd/set_default_target_to_multi-user.patch |   13 +
 .../systemd-pam-configure-check-uclibc.patch       |   26 ++
 .../systemd/systemd/systemd-pam-fix-execvpe.patch  |   26 ++
 .../systemd/systemd-pam-fix-fallocate.patch        |   82 +++++
 .../systemd/systemd-pam-fix-getty-unit.patch       |   35 ++
 .../systemd/systemd/systemd-pam-fix-mkostemp.patch |  166 ++++++++++
 .../systemd/systemd/systemd-pam-fix-msformat.patch |  335 +++++++++++++++++++
 .../recipes-core/systemd/systemd/touchscreen.rules |   18 ++
 meta/recipes-core/systemd/systemd/var-run.conf     |    4 +
 meta/recipes-core/systemd/systemd_git.bb           |  251 +++++++++++++++
 meta/recipes-core/util-linux/util-linux.inc        |    9 +-
 meta/recipes-extended/cronie/cronie/crond.service  |   10 +
 meta/recipes-extended/cronie/cronie_1.4.8.bb       |   10 +-
 .../lighttpd/files/lighttpd.service                |   13 +
 meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb  |   11 +-
 meta/recipes-extended/pam/libpam_1.1.6.bb          |    5 +-
 meta/recipes-extended/polkit/polkit_0.104.bb       |   11 +-
 meta/recipes-graphics/x11-common/x11-common_0.1.bb |    4 +-
 .../x11-common/xserver-nodm-init.bb                |   19 +-
 .../x11-common/xserver-nodm-init/xserver-nodm.conf |    1 +
 .../xserver-nodm-init/xserver-nodm.service         |    9 +
 66 files changed, 2604 insertions(+), 172 deletions(-)
 create mode 100644 meta/classes/systemd.bbclass
 create mode 100644 meta/classes/systemd_base.bbclass
 create mode 100644 meta/recipes-bsp/keymaps/files/keymaps.service
 create mode 100644 meta/recipes-connectivity/dhcp/files/dhcpd.service
 create mode 100644 meta/recipes-connectivity/dhcp/files/dhcrelay.service
 create mode 100644 meta/recipes-connectivity/openssh/openssh-6.0p1/sshd.socket
 create mode 100644 meta/recipes-connectivity/openssh/openssh-6.0p1/sshd@.service
 create mode 100644 meta/recipes-connectivity/openssh/openssh-6.0p1/sshdgenkeys.service
 create mode 100644 meta/recipes-core/busybox/files/busybox-klogd.service.in
 create mode 100644 meta/recipes-core/busybox/files/busybox-syslog.service.in
 create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear.socket
 create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear@.service
 create mode 100644 meta/recipes-core/dropbear/dropbear/dropbearkey.service
 rename meta/recipes-core/initscripts/initscripts-1.0/{urandom => urandom.sh} (100%)
 create mode 100644 meta/recipes-core/systemd/systemd-compat-units.bb
 create mode 100644 meta/recipes-core/systemd/systemd-compat-units/machineid.service
 create mode 100644 meta/recipes-core/systemd/systemd-compat-units/run-postinsts.service
 create mode 100644 meta/recipes-core/systemd/systemd-machine-units_1.0.bb
 create mode 100644 meta/recipes-core/systemd/systemd-serialgetty.bb
 create mode 100644 meta/recipes-core/systemd/systemd-serialgetty/LICENSE
 create mode 100644 meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
 create mode 100644 meta/recipes-core/systemd/systemd-speed-hacks.bb
 create mode 100644 meta/recipes-core/systemd/systemd-systemctl-native.bb
 create mode 100755 meta/recipes-core/systemd/systemd-systemctl-native/systemctl
 create mode 100644 meta/recipes-core/systemd/systemd/create-volatile.conf
 create mode 100644 meta/recipes-core/systemd/systemd/gtk-doc.make
 create mode 100644 meta/recipes-core/systemd/systemd/modprobe.rules
 create mode 100644 meta/recipes-core/systemd/systemd/optional_secure_getenv.patch
 create mode 100644 meta/recipes-core/systemd/systemd/set_default_target_to_multi-user.patch
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-configure-check-uclibc.patch
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
 create mode 100644 meta/recipes-core/systemd/systemd/touchscreen.rules
 create mode 100644 meta/recipes-core/systemd/systemd/var-run.conf
 create mode 100644 meta/recipes-core/systemd/systemd_git.bb
 create mode 100644 meta/recipes-extended/cronie/cronie/crond.service
 create mode 100644 meta/recipes-extended/lighttpd/files/lighttpd.service
 create mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.conf
 create mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service

-- 
1.7.9.5




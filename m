Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1TvUfI-0004lO-6O
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 16:12:38 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Jan 2013 06:56:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,479,1355126400"; d="scan'208";a="272793101"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.105.59])
	by orsmga002.jf.intel.com with ESMTP; 16 Jan 2013 06:57:08 -0800
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2013 17:03:42 +0200
Message-Id: <cover.1358348134.git.radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 00/23][RFC v4]systemd integration
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
X-List-Received-Date: Wed, 16 Jan 2013 15:12:43 -0000

*Since last RFC I've udpated systemd to 196 and got in sync with
meta-openembedded (pulled in a few more patches)
*Also removed some initscripts that are not required while systemd
is enabled, for tasks that systemd can handle by itself.
*Removed update-rc.d while systemd is enabled. systemd provides
systemctl to replace update-rc.d

Please review and send me your feedback.

The following changes since commit 9eb88ceb39b7d0b8ddc6487e61ce8edadef10ec4:

  connman: fixed init script so connman can runs over nfs (2013-01-15 08:12:05 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib rmoisan/systemd
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rmoisan/systemd

Enrico Scholz (1):
  systemd: move disable operation into prerm() script

Holger Hans Peter Freyther (2):
  systemd: Make the main systemd files proper CONFFILES
  systemd: Introduce a create-volatile to create tmp directories

Khem Raj (2):
  systemd: Fix build when base_libdir is not /lib
  systemd.bbclass: Fixes for living along with multilib

Koen Kooi (1):
  systemd: update to v196

Martin Donnelly (3):
  cgroups: Add INSANE_SKIP to avoid warning about .so file
  base-files: add fstab for systemd based systems
  pam: fix common-session to permit logins with systemd

Martin Jansa (2):
  systemd: fix FILESPATH to find systemctl
  systemd: add PACKAGES_DYNAMIC

Radu Moisan (12):
  default-distrovars: Add DISTRO_FEATURES_INITMAN to DISTRO_FEATURES
  default-providers: Automatically set PREFERRED_PROVIDER_udev
  systemd: initial integration
  systemd: Add systemd_base.bbclass
  systemd: Add systemd option to PREFERRED_PROVIDER_udev
  systemd: set default.target to multi-user.target
  systemd: update FILESPATH with *-native directory
  systemd: disable unnecessary initscripts
  systemd: Add systemd-compat-units
  systemd: Add avahi to packagegroup-core-boot
  xserver-nodm-init: Enable systemd support
  update-rc.d: remove update-rc.d.bbclass when systemd enabled

 meta/classes/systemd.bbclass                       |    1 +
 meta/classes/systemd_base.bbclass                  |  222 +++++++++++++
 meta/classes/update-rc.d.bbclass                   |   86 +----
 meta/classes/update-rc.d_base.bbclass              |   85 +++++
 meta/conf/distro/include/default-distrovars.inc    |    3 +-
 meta/conf/distro/include/default-providers.inc     |    1 +
 meta/recipes-bsp/keymaps/files/keymaps.service     |    9 +
 meta/recipes-bsp/keymaps/keymaps_1.0.bb            |    9 +-
 meta/recipes-connectivity/avahi/avahi.inc          |   23 +-
 meta/recipes-connectivity/connman/connman.inc      |    6 +
 meta/recipes-connectivity/connman/connman_1.4.bb   |    3 +-
 meta/recipes-connectivity/dhcp/dhcp.inc            |   15 +-
 meta/recipes-connectivity/dhcp/files/dhcpd.service |   12 +
 .../dhcp/files/dhcrelay.service                    |   10 +
 .../openssh/openssh-6.0p1/sshd.socket              |   11 +
 .../openssh/openssh-6.0p1/sshd@.service            |    9 +
 .../openssh/openssh-6.0p1/sshdgenkeys.service      |   10 +
 meta/recipes-connectivity/openssh/openssh_6.0p1.bb |   14 +-
 .../wpa-supplicant/wpa-supplicant_1.0.bb           |    2 +-
 .../base-files/base-files/fstab.systemd            |    9 +
 meta/recipes-core/base-files/base-files_3.0.14.bb  |   17 +-
 meta/recipes-core/busybox/busybox.inc              |   18 ++
 meta/recipes-core/busybox/busybox_1.20.2.bb        |    4 +-
 .../busybox/files/busybox-klogd.service.in         |    8 +
 .../busybox/files/busybox-syslog.service.in        |   13 +
 meta/recipes-core/dropbear/dropbear.inc            |   81 ++---
 .../recipes-core/dropbear/dropbear/dropbear.socket |   10 +
 .../dropbear/dropbear/dropbear@.service            |    9 +
 .../dropbear/dropbear/dropbearkey.service          |   10 +
 .../initscripts-1.0/{urandom => urandom.sh}        |    0
 meta/recipes-core/initscripts/initscripts_1.0.bb   |  146 +++++----
 meta/recipes-core/libcgroup/libcgroup_0.37.1.bb    |    1 +
 .../packagegroups/packagegroup-base.bb             |    3 +-
 .../packagegroups/packagegroup-core-boot.bb        |    9 +-
 meta/recipes-core/systemd/systemd-compat-units.bb  |   58 ++++
 .../systemd/systemd-compat-units/machineid.service |   16 +
 .../systemd-compat-units/run-postinsts.service     |   17 +
 .../systemd/systemd-machine-units_1.0.bb           |   14 +
 meta/recipes-core/systemd/systemd-serialgetty.bb   |   46 +++
 .../systemd/systemd-serialgetty/LICENSE            |  339 ++++++++++++++++++++
 .../systemd-serialgetty/serial-getty@.service      |   32 ++
 meta/recipes-core/systemd/systemd-speed-hacks.bb   |   18 ++
 .../systemd/systemd-systemctl-native.bb            |   20 ++
 .../systemd/systemd-systemctl-native/systemctl     |  126 ++++++++
 .../systemd/systemd/00-create-volatile.conf        |   10 +
 ...emd-analyze-use-argparse-instead-of-getop.patch |  103 ++++++
 ...-analyze-use-GDBus-instead-of-dbus-python.patch |   91 ++++++
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
 meta/recipes-core/systemd/systemd_git.bb           |  254 +++++++++++++++
 meta/recipes-core/util-linux/util-linux.inc        |   46 +--
 meta/recipes-extended/cronie/cronie/crond.service  |   10 +
 meta/recipes-extended/cronie/cronie_1.4.8.bb       |   10 +-
 .../lighttpd/files/lighttpd.service                |   13 +
 meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb  |   11 +-
 meta/recipes-extended/pam/libpam_1.1.6.bb          |    3 +
 meta/recipes-extended/polkit/polkit_0.104.bb       |    9 +-
 meta/recipes-graphics/x11-common/x11-common_0.1.bb |    4 +-
 .../x11-common/xserver-nodm-init.bb                |   19 +-
 .../x11-common/xserver-nodm-init/xserver-nodm.conf |    1 +
 .../xserver-nodm-init/xserver-nodm.service         |    9 +
 71 files changed, 2871 insertions(+), 248 deletions(-)
 create mode 100644 meta/classes/systemd.bbclass
 create mode 100644 meta/classes/systemd_base.bbclass
 create mode 100644 meta/classes/update-rc.d_base.bbclass
 create mode 100644 meta/recipes-bsp/keymaps/files/keymaps.service
 create mode 100644 meta/recipes-connectivity/dhcp/files/dhcpd.service
 create mode 100644 meta/recipes-connectivity/dhcp/files/dhcrelay.service
 create mode 100644 meta/recipes-connectivity/openssh/openssh-6.0p1/sshd.socket
 create mode 100644 meta/recipes-connectivity/openssh/openssh-6.0p1/sshd@.service
 create mode 100644 meta/recipes-connectivity/openssh/openssh-6.0p1/sshdgenkeys.service
 create mode 100644 meta/recipes-core/base-files/base-files/fstab.systemd
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
 create mode 100644 meta/recipes-core/systemd/systemd/00-create-volatile.conf
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Revert-systemd-analyze-use-argparse-instead-of-getop.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0002-Revert-analyze-use-GDBus-instead-of-dbus-python.patch
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




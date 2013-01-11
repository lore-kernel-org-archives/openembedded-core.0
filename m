Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TtoB5-0008Ii-Op
	for openembedded-core@lists.openembedded.org;
	Sat, 12 Jan 2013 00:38:34 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Jan 2013 15:22:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,455,1355126400"; d="scan'208";a="245453796"
Received: from unknown (HELO [10.255.14.194]) ([10.255.14.194])
	by orsmga001.jf.intel.com with ESMTP; 11 Jan 2013 15:23:06 -0800
Message-ID: <50F09EDA.1000807@linux.intel.com>
Date: Fri, 11 Jan 2013 15:23:06 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Radu Moisan <radu.moisan@intel.com>
References: <cover.1357647338.git.radu.moisan@intel.com>
In-Reply-To: <cover.1357647338.git.radu.moisan@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/21][RFC v3] systemd Integration
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
X-List-Received-Date: Fri, 11 Jan 2013 23:38:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/08/2013 04:24 AM, Radu Moisan wrote:
> As Ross suggested I've done the following changes to the previous set:
> * added two patches (the first two) that address multiple init systems support,\
> as in shifting from default hardcoded sysvinit to something more generic while
> the default values still remains on sysvinit
> * moved automatic setting of PREFERRED_PROVIDER_udev into default_providers.inc
> * removed ahavi-systemd since all it provided was service files; now service files
> are pulled in by avahi-daemon
> * also rebased on master
>
> The following changes since commit 7e1f8faad0c4b6f490c26f87acc698dd6e002b15:
>
>    perl: Remove bashism from perl-tests.inc (2013-01-07 22:37:37 +0000)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib rmoisan/systemd
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rmoisan/systemd
>
> Enrico Scholz (1):
>    systemd: move disable operation into prerm() script
>
> Holger Hans Peter Freyther (2):
>    systemd: Make the main systemd files proper CONFFILES
>    systemd: Introduce a create-volatile to create tmp directories
White space 4 spaces vs tab

>
> Khem Raj (1):
>    systemd: Fix build when base_libdir is not /lib
>
> Martin Donnelly (2):
>    cgroups: Add INSANE_SKIP to avoid warning about .so file
>    systemd: Remove sysvinit mount related services if systemd is enabled
>
> Martin Jansa (2):
>    systemd: fix FILESPATH to find systemctl
>    systemd: add PACKAGES_DYNAMIC
>
> Radu Moisan (13):
>    default-distrovars: Add DISTRO_FEATURES_INITMAN to DISTRO_FEATURES
>    default-providers: Automatically set PREFERRED_PROVIDER_udev
>    systemd: initial integration
I believe this was mentioned before, but can you avoid making white 
space changes, you seem to have changed tabs (which we use tabs for 
shell based functions and 4 spaces for python based functions)

Specifically, I saw some changes in wpa-supplicant-1.0.inc, busybox, 
dropbear, initscripts

For the systemd-serialgetty, can we not carry around a LICENSE file, and 
instead point to the meta/files/common-licenses for a checksum?

Also a load of the patches do not contains Signed-off-by or 
Upstream-Status tags.



>    systemd: Add systemd_base.bbclass
>    systemd: Add systemd option to PREFERRED_PROVIDER_udev
>    systemd: set default.target to multi-user.target
>    systemd: update FILESPATH with *-native directory
>    systemd: disable sysfs.service
White space changes, makes it much harder to review, please fix

>    systemd: Add systemd-compat-units
>    systemd: Add avahi to packagegroup-core-boot
>    xserver-nodm-init: Enable systemd support
>    util-linux: Enable systemd support
What's the actual change here?  Whitespace?

>    systemd: Disable xz when building with GPLv3 incompatibility flag
This should go away, I have verified that the license field in xz is 
wrong and should not contain GPLv3 since it's a build macro, not a 
runtime, and the LICENSE field pertains to packaged and installed items 
and their licenses.

Sau!


>
>   meta/classes/systemd.bbclass                       |    1 +
>   meta/classes/systemd_base.bbclass                  |  218 +++++++++++++
>   meta/conf/distro/include/default-distrovars.inc    |    3 +-
>   meta/conf/distro/include/default-providers.inc     |    1 +
>   meta/recipes-bsp/keymaps/files/keymaps.service     |    9 +
>   meta/recipes-bsp/keymaps/keymaps_1.0.bb            |    9 +-
>   meta/recipes-connectivity/avahi/avahi.inc          |   23 +-
>   meta/recipes-connectivity/connman/connman.inc      |    6 +
>   meta/recipes-connectivity/connman/connman_1.4.bb   |    3 +-
>   meta/recipes-connectivity/dhcp/dhcp.inc            |   15 +-
>   meta/recipes-connectivity/dhcp/files/dhcpd.service |   12 +
>   .../dhcp/files/dhcrelay.service                    |   10 +
>   .../openssh/openssh-6.0p1/sshd.socket              |   11 +
>   .../openssh/openssh-6.0p1/sshd@.service            |    9 +
>   .../openssh/openssh-6.0p1/sshdgenkeys.service      |   10 +
>   meta/recipes-connectivity/openssh/openssh_6.0p1.bb |   14 +-
>   .../wpa-supplicant/wpa-supplicant-1.0.inc          |   74 +++--
>   .../wpa-supplicant/wpa-supplicant_1.0.bb           |    2 +-
>   meta/recipes-core/busybox/busybox.inc              |   18 ++
>   meta/recipes-core/busybox/busybox_1.20.2.bb        |    4 +-
>   .../busybox/files/busybox-klogd.service.in         |    8 +
>   .../busybox/files/busybox-syslog.service.in        |   13 +
>   meta/recipes-core/dropbear/dropbear.inc            |   81 ++---
>   .../recipes-core/dropbear/dropbear/dropbear.socket |   10 +
>   .../dropbear/dropbear/dropbear@.service            |    9 +
>   .../dropbear/dropbear/dropbearkey.service          |   10 +
>   .../initscripts-1.0/{urandom => urandom.sh}        |    0
>   meta/recipes-core/initscripts/initscripts_1.0.bb   |  164 +++++-----
>   meta/recipes-core/libcgroup/libcgroup_0.37.1.bb    |    1 +
>   .../packagegroups/packagegroup-base.bb             |    3 +-
>   .../packagegroups/packagegroup-core-boot.bb        |    9 +-
>   meta/recipes-core/systemd/systemd-compat-units.bb  |   59 ++++
>   .../systemd/systemd-compat-units/machineid.service |   16 +
>   .../systemd-compat-units/run-postinsts.service     |   17 +
>   .../systemd/systemd-machine-units_1.0.bb           |   14 +
>   meta/recipes-core/systemd/systemd-serialgetty.bb   |   46 +++
>   .../systemd/systemd-serialgetty/LICENSE            |  339 ++++++++++++++++++++
>   .../systemd-serialgetty/serial-getty@.service      |   32 ++
>   meta/recipes-core/systemd/systemd-speed-hacks.bb   |   18 ++
>   .../systemd/systemd-systemctl-native.bb            |   20 ++
>   .../systemd/systemd-systemctl-native/systemctl     |  126 ++++++++
>   .../systemd/systemd/create-volatile.conf           |   10 +
>   meta/recipes-core/systemd/systemd/gtk-doc.make     |  230 +++++++++++++
>   meta/recipes-core/systemd/systemd/modprobe.rules   |   17 +
>   .../systemd/systemd/optional_secure_getenv.patch   |   19 ++
>   .../systemd/set_default_target_to_multi-user.patch |   13 +
>   .../systemd-pam-configure-check-uclibc.patch       |   26 ++
>   .../systemd/systemd/systemd-pam-fix-execvpe.patch  |   26 ++
>   .../systemd/systemd-pam-fix-fallocate.patch        |   82 +++++
>   .../systemd/systemd-pam-fix-getty-unit.patch       |   35 ++
>   .../systemd/systemd/systemd-pam-fix-mkostemp.patch |  166 ++++++++++
>   .../systemd/systemd/systemd-pam-fix-msformat.patch |  335 +++++++++++++++++++
>   .../recipes-core/systemd/systemd/touchscreen.rules |   18 ++
>   meta/recipes-core/systemd/systemd/var-run.conf     |    4 +
>   meta/recipes-core/systemd/systemd_git.bb           |  252 +++++++++++++++
>   meta/recipes-core/util-linux/util-linux.inc        |   11 +-
>   meta/recipes-extended/cronie/cronie/crond.service  |   10 +
>   meta/recipes-extended/cronie/cronie_1.4.8.bb       |   10 +-
>   .../lighttpd/files/lighttpd.service                |   13 +
>   meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb  |   11 +-
>   meta/recipes-extended/pam/libpam_1.1.6.bb          |    3 +
>   meta/recipes-extended/polkit/polkit_0.104.bb       |    9 +-
>   meta/recipes-graphics/x11-common/x11-common_0.1.bb |    4 +-
>   .../x11-common/xserver-nodm-init.bb                |   19 +-
>   .../x11-common/xserver-nodm-init/xserver-nodm.conf |    1 +
>   .../xserver-nodm-init/xserver-nodm.service         |    9 +
>   66 files changed, 2606 insertions(+), 174 deletions(-)
>   create mode 100644 meta/classes/systemd.bbclass
>   create mode 100644 meta/classes/systemd_base.bbclass
>   create mode 100644 meta/recipes-bsp/keymaps/files/keymaps.service
>   create mode 100644 meta/recipes-connectivity/dhcp/files/dhcpd.service
>   create mode 100644 meta/recipes-connectivity/dhcp/files/dhcrelay.service
>   create mode 100644 meta/recipes-connectivity/openssh/openssh-6.0p1/sshd.socket
>   create mode 100644 meta/recipes-connectivity/openssh/openssh-6.0p1/sshd@.service
>   create mode 100644 meta/recipes-connectivity/openssh/openssh-6.0p1/sshdgenkeys.service
>   create mode 100644 meta/recipes-core/busybox/files/busybox-klogd.service.in
>   create mode 100644 meta/recipes-core/busybox/files/busybox-syslog.service.in
>   create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear.socket
>   create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear@.service
>   create mode 100644 meta/recipes-core/dropbear/dropbear/dropbearkey.service
>   rename meta/recipes-core/initscripts/initscripts-1.0/{urandom => urandom.sh} (100%)
>   create mode 100644 meta/recipes-core/systemd/systemd-compat-units.bb
>   create mode 100644 meta/recipes-core/systemd/systemd-compat-units/machineid.service
>   create mode 100644 meta/recipes-core/systemd/systemd-compat-units/run-postinsts.service
>   create mode 100644 meta/recipes-core/systemd/systemd-machine-units_1.0.bb
>   create mode 100644 meta/recipes-core/systemd/systemd-serialgetty.bb
>   create mode 100644 meta/recipes-core/systemd/systemd-serialgetty/LICENSE
>   create mode 100644 meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
>   create mode 100644 meta/recipes-core/systemd/systemd-speed-hacks.bb
>   create mode 100644 meta/recipes-core/systemd/systemd-systemctl-native.bb
>   create mode 100755 meta/recipes-core/systemd/systemd-systemctl-native/systemctl
>   create mode 100644 meta/recipes-core/systemd/systemd/create-volatile.conf
>   create mode 100644 meta/recipes-core/systemd/systemd/gtk-doc.make
>   create mode 100644 meta/recipes-core/systemd/systemd/modprobe.rules
>   create mode 100644 meta/recipes-core/systemd/systemd/optional_secure_getenv.patch
>   create mode 100644 meta/recipes-core/systemd/systemd/set_default_target_to_multi-user.patch
>   create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-configure-check-uclibc.patch
>   create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch
>   create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
>   create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch
>   create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
>   create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
>   create mode 100644 meta/recipes-core/systemd/systemd/touchscreen.rules
>   create mode 100644 meta/recipes-core/systemd/systemd/var-run.conf
>   create mode 100644 meta/recipes-core/systemd/systemd_git.bb
>   create mode 100644 meta/recipes-extended/cronie/cronie/crond.service
>   create mode 100644 meta/recipes-extended/lighttpd/files/lighttpd.service
>   create mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.conf
>   create mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service
>



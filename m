Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DC1A27137A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Sep 2014 07:09:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8379AOr023225
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Sep 2014 00:09:11 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 3 Sep 2014 00:09:10 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Sep 2014 15:08:57 +0800
Message-ID: <cover.1409728004.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 00/25] systemd upgrade to 216 and other misc fixes
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
X-List-Received-Date: Wed, 03 Sep 2014 07:09:12 -0000
Content-Type: text/plain

systemd upgrade has been tested on
*) qemuarm
*) qemumips
*) qemuppc
*) qemux86
*) qemux86-64

The whole patchset has passed the following test case on qemux86-64.
bitbake core-image-sato -ctestimage

Changes in V2:
1. merge two dhcp patches into one
2. fix commit messages to be clearer
3. use ${sysconfdir} instead of hardcoding /etc

//Chen Qi

The following changes since commit 4c0a9ccbad2889b27b4b1d2ab91215a4bdcca3ce:

  python-numpy: Fix build for mips64 (2014-09-01 18:00:32 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/systemd-misc-fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/systemd-misc-fixes

Chen Qi (24):
  systemd: upgrade to 216
  systemd: add PACKAGECONFIG for 'journal-upload'
  systemd: make runlevel work in non-runlevel targets
  update-rc.d: fix logic in populate_packages_updatercd
  alsa-state: fix pkg_postinst and set INHIBIT_UPDATERCD_BBCLASS
  keymaps: fix for systemd
  systemd: add kbd-keymaps to RRECOMMENDS of systemd-vconsole-setup
  v86d: set INHIBIT_UPDATERCD_BBCLASS if 'sysvinit' not in
    DISTRO_FEATURES
  systemd: add support for executing scripts under /etc/rcS.d
  dhcp: add systemd service files
  acpid: upgrade to 2.0.22 and add systemd support
  cups: add systemd support
  rpcbind: avoid entering failed status after stopping daemon
  at: remove dependency on initscripts
  at: inherit update-rc.d to handle sysv init script
  keymaps: remove dependency on initscripts
  packagegroup-core-boot: conditionally rdepend on
    VIRTUAL-RUNTIME_initscripts
  initscripts: mask several init scripts
  keymaps: mask keymap when necessary
  v86d: mask fbsetup when necessary
  psplash: mask psplash in case of systemd
  modutils-initscripts: mask modutils in case of systemd
  run-postinsts.service: remove redundant line
  systemd: enable forwarding messages to syslog daemon

In Long (1):
  cups: make cups daemon start correctly

 meta/classes/update-rc.d.bbclass                   |   2 +-
 meta/recipes-bsp/acpid/acpid.inc                   |  24 ++--
 meta/recipes-bsp/acpid/acpid/acpid.service         |  10 ++
 .../acpid/acpid/set_socket_noblock.patch           |  10 --
 .../acpid/{acpid_1.0.10.bb => acpid_2.0.22.bb}     |   5 +-
 meta/recipes-bsp/alsa-state/alsa-state.bb          |  11 +-
 meta/recipes-bsp/keymaps/keymaps_1.0.bb            |  32 ++++-
 meta/recipes-bsp/v86d/v86d_0.1.10.bb               |  17 +++
 meta/recipes-connectivity/dhcp/dhcp.inc            |  23 +++-
 meta/recipes-connectivity/dhcp/files/dhcpd.service |  11 ++
 .../dhcp/files/dhcrelay.service                    |   9 ++
 meta/recipes-core/initscripts/initscripts_1.0.bb   |   4 +
 .../packagegroups/packagegroup-core-boot.bb        |   2 +-
 meta/recipes-core/psplash/psplash_git.bb           |  10 ++
 ...ort-for-executing-scripts-under-etc-rcS.d.patch | 138 +++++++++++++++++++++
 ...ing.h-add-fake-__NR_memfd_create-for-MIPS.patch |  29 +++++
 ...1-uClibc-doesn-t-implement-pwritev-preadv.patch |  34 -----
 ...-Including-missing.h-to-get-MAX_HANDLE_SZ.patch |  29 -----
 .../systemd/systemd/systemd-older-kernel.patch     |  56 ---------
 .../systemd/{systemd_213.bb => systemd_216.bb}     |  34 +++--
 .../run-postinsts/run-postinsts.service            |   1 -
 meta/recipes-extended/at/at/{S99at => atd.init}    |   0
 meta/recipes-extended/at/at_3.1.15.bb              |  13 +-
 meta/recipes-extended/cups/cups.inc                |  24 +++-
 meta/recipes-extended/cups/cups/cups.path          |   8 ++
 meta/recipes-extended/cups/cups/cups.service       |  10 ++
 meta/recipes-extended/cups/cups/cups.socket        |   8 ++
 .../rpcbind/rpcbind/rpcbind.service                |   1 +
 .../modutils-initscripts/modutils-initscripts.bb   |  10 ++
 29 files changed, 388 insertions(+), 177 deletions(-)
 create mode 100644 meta/recipes-bsp/acpid/acpid/acpid.service
 delete mode 100644 meta/recipes-bsp/acpid/acpid/set_socket_noblock.patch
 rename meta/recipes-bsp/acpid/{acpid_1.0.10.bb => acpid_2.0.22.bb} (55%)
 create mode 100644 meta/recipes-connectivity/dhcp/files/dhcpd.service
 create mode 100644 meta/recipes-connectivity/dhcp/files/dhcrelay.service
 create mode 100644 meta/recipes-core/systemd/systemd/0001-add-support-for-executing-scripts-under-etc-rcS.d.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-missing.h-add-fake-__NR_memfd_create-for-MIPS.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-uClibc-doesn-t-implement-pwritev-preadv.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-util-Including-missing.h-to-get-MAX_HANDLE_SZ.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/systemd-older-kernel.patch
 rename meta/recipes-core/systemd/{systemd_213.bb => systemd_216.bb} (87%)
 rename meta/recipes-extended/at/at/{S99at => atd.init} (100%)
 create mode 100644 meta/recipes-extended/cups/cups/cups.path
 create mode 100644 meta/recipes-extended/cups/cups/cups.service
 create mode 100644 meta/recipes-extended/cups/cups/cups.socket

-- 
1.9.1



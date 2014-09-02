Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BB619712AC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 10:54:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s82As2tP003953
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Sep 2014 03:54:03 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 2 Sep 2014 03:54:02 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Sep 2014 18:53:46 +0800
Message-ID: <cover.1409655125.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 00/26] systemd upgrade to 216 and other misc fixes
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
X-List-Received-Date: Tue, 02 Sep 2014 10:54:09 -0000
Content-Type: text/plain


systemd upgrade has been tested on
*) qemuarm
*) qemumips
*) qemuppc
*) qemux86
*) qemux86-64

The whole patchset has passed the following test case on qemux86-64.
bitbake core-image-sato -ctestimage

//Chen Qi

The following changes since commit a57b24f848a7cb89cf57830e07682224f8bbc96f:

  tzcode: update to 2014g (2014-08-31 23:39:13 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/systemd-misc-fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/systemd-misc-fixes

Chen Qi (25):
  systemd: upgrade to 216
  systemd: add PACKAGECONFIG for curl
  systemd: make runlevel work in non-runlevel targets
  update-rc.d: fix logic in populate_packages_updatercd
  alsa-state: fix pkg_postinst and set INHIBIT_UPDATERCD_BBCLASS
  keymaps: fix for systemd
  systemd: add kbd-keymaps to RRECOMMENDS of systemd-vconsole-setup
  v86d: set INHIBIT_UPDATERCD_BBCLASS if 'sysvinit' not in
    DISTRO_FEATURES
  systemd: add support for executing scripts under /etc/rcS.d
  dhcp: add dhcpd.service
  dhcp: add dhcrelay.service
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
 meta/recipes-extended/cups/cups.inc                |  22 +++-
 meta/recipes-extended/cups/cups/cups.path          |   8 ++
 meta/recipes-extended/cups/cups/cups.service       |  10 ++
 meta/recipes-extended/cups/cups/cups.socket        |   8 ++
 .../rpcbind/rpcbind/rpcbind.service                |   1 +
 .../modutils-initscripts/modutils-initscripts.bb   |  10 ++
 29 files changed, 386 insertions(+), 177 deletions(-)
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



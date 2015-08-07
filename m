Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 181EF767B1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 16:26:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 99568608FC3
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Aug 2015 17:26:02 +0100
Message-Id: <cover.1438964647.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [FIDO PATCH 00/24] Proposed changes for fido
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
X-List-Received-Date: Fri, 07 Aug 2015 16:26:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please consider the following changes for the fido branch.

The following changes since commit 08d32590411568e7bf11612ac695a6e9c6df6286:

  dpkg: Fix for Fedora22 and new versions of tar (2015-07-27 12:25:42 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib joshuagl/fido-next
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=joshuagl/fido-next

Alejandro Hernandez (1):
  opkg: solve inconsistency of using different lists directories

Alexandre Belloni (1):
  wic: remove intermediate partitions

André Draszik (5):
  rsync: use ${sysconfdir} instead of hardcoding /etc
  opkg: read config file from ${sysconfdir} instead of /etc
  initscripts: urandom: respect ${localstatedir} instead of hardcoding
    /var
  run-postinsts: use ${localstatedir} instead of hardcoding /var/lib
  opkg-utils: use ${bindir} instead of hardcoding /usr/bin

Bruce Ashfield (1):
  perf: fix build (and feature tests) for 4.1-rcX

Chen Qi (1):
  nfs-utils: fix to start nfs-server correctly in systemd

Ed Bartosh (1):
  wic: Make sure file exists before removing it

Joshua Lock (2):
  wpa-supplicant: Apply fix CVE-2015-4142
  systemd: fix immediate unmount of mountpoints not in fstab

Kai Kang (1):
  volatile-binds: correct path of command umount

Kevin Hao (1):
  u-boot: fix extern inline build errors for gcc 5

Li Zhou (1):
  tzdata: Add marking for config files in recipe

Martin Jansa (2):
  connman-conf: fix SRC_URI_append
  mesa: respect MESA_EGL_NO_X11_HEADERS even with x11 in PACKAGECONFIG

Richard Purdie (1):
  perf: Fix config file conflict with 4.1 kernels

Roy Li (2):
  bootchart2: add runtime dependency
  alsa-utils: assume the alsa storing is success if machine has no sound
    card

Thomas Perrot (2):
  systemd-serialgetty: Set S to prevent QA warning
  volatile-binds: Set S to prevent QA warning

Tobias Olausson (1):
  Revert "mesa: fix do_install_append"

Zhixiong Chi (1):
  dhcp: fix installed not shipped warning for lib32

 meta/recipes-bsp/u-boot/u-boot_2015.01.bb          |  2 ++
 meta/recipes-connectivity/connman/connman-conf.bb  |  6 ++--
 meta/recipes-connectivity/dhcp/dhcp.inc            | 14 ++++-----
 .../nfs-utils/nfs-utils/proc-fs-nfsd.mount         |  8 +++++
 .../nfs-utils/nfs-utils_1.3.1.bb                   | 10 ++++++
 .../wpa-supplicant/wpa-supplicant.inc              |  1 +
 meta/recipes-core/initscripts/initscripts_1.0.bb   |  3 +-
 meta/recipes-core/systemd/systemd-serialgetty.bb   |  2 ++
 ...-mount-add-dependencies-to-dynamically-mo.patch | 36 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_219.bb           |  1 +
 .../volatile-binds/files/volatile-binds.service.in |  2 +-
 meta/recipes-core/volatile-binds/volatile-binds.bb |  4 ++-
 meta/recipes-devtools/bootchart2/bootchart2_git.bb |  2 ++
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |  4 +++
 meta/recipes-devtools/opkg/opkg_0.2.4.bb           |  3 +-
 meta/recipes-devtools/rsync/rsync.inc              |  4 +--
 .../run-postinsts/run-postinsts/run-postinsts      |  2 +-
 .../run-postinsts/run-postinsts_1.0.bb             |  1 +
 meta/recipes-extended/tzdata/tzdata.inc            |  2 ++
 meta/recipes-graphics/mesa/mesa_10.4.4.bb          |  2 +-
 meta/recipes-graphics/mesa/mesa_git.bb             |  2 +-
 meta/recipes-kernel/perf/perf.bb                   | 18 +++++++++++
 ...oring-is-success-if-not-sound-card-device.patch | 34 ++++++++++++++++++++
 meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb  |  1 +
 .../lib/wic/kickstart/custom_commands/partition.py |  8 +++++
 25 files changed, 153 insertions(+), 19 deletions(-)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/proc-fs-nfsd.mount
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Revert-core-mount-add-dependencies-to-dynamically-mo.patch
 create mode 100644 meta/recipes-multimedia/alsa/alsa-utils/assume-storing-is-success-if-not-sound-card-device.patch

-- 
2.1.4



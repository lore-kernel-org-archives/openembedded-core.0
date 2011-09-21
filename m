Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R6JMN-0008DE-OV
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 11:44:55 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 21 Sep 2011 02:39:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="51195241"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.170])
	by orsmga002.jf.intel.com with ESMTP; 21 Sep 2011 02:39:36 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2011 02:39:16 -0700
Message-Id: <cover.1316597628.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [RC Fixes 00/19] Fixes for Multi-Lib & other patches
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
X-List-Received-Date: Wed, 21 Sep 2011 09:44:56 -0000

Richard,

I have build (not booted) these fixes and for the most part
they seem to address alot of the issues we have seen.  There
is still some problems with python and gtk+ needing to be 
cleaned before do_rootfs is sucessful.

This is a major step forward based on some of the issues we 
have seen and may require some additional fixes for an RC4.

Sau!

(It's really too late here, and I apologize upfront for any 
real bad misse).



The following changes since commit 81274f4488fbc4d68d150870735ec0181b60b451:

  freetype: disable bzip2 compressed font support (2011-09-19 13:14:03 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib sgw/stage
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgw/stage

Anders Darander (3):
  libzypp: git repo moved to github
  sat-solver: git repo moved to github
  zypper: git repo moved to github

Daniel Lazzari (1):
  Fix alsa-utils package dependencies

Dexuan Cui (1):
  deb packages support: switch from /var/dpkg to /var/lib/dpkg

Dongxiao Xu (4):
  rpm: add multilib prefix for archs under deploy/rpm
  multilib: install MULTILIB_IMAGE_INSTALL
  libpng: avoid dangling link in libpng package
  libpng: add libpng12-dev packages

Mark Hatle (5):
  Fix RPM dependencies
  Add a run-time dependency that eglibc support GNU_HASH
  Update python dependencies to be simply to "python"
  busybox: Enhance to add dynamic per-file provides
  multilib_global.bbclass: Fix non-multilib package provides

Paul Eggleton (1):
  scripts/combo-layer: fix still overzealous regex in default hook
    script

Saul Wold (4):
  distrodata: fix distro_check code
  distro tracking: Update Distro Aliases
  avahi: Refactor recipe to move UI to avahi-ui
  oprofileui: Change avahi to avahi-ui depends

 meta/classes/distrodata.bbclass                    |   19 ++++-
 meta/classes/multilib.bbclass                      |    5 +
 meta/classes/multilib_global.bbclass               |   27 +++++-
 meta/classes/package.bbclass                       |    6 ++
 meta/classes/package_deb.bbclass                   |   10 +-
 meta/classes/package_rpm.bbclass                   |   44 +++++++----
 meta/classes/populate_sdk_deb.bbclass              |    4 +-
 meta/classes/rootfs_deb.bbclass                    |   20 +++---
 meta/classes/rootfs_rpm.bbclass                    |    8 ++-
 .../conf/distro/include/distro_tracking_fields.inc |   83 ++++++++++++++++++-
 meta/lib/oe/distro_check.py                        |    8 +-
 meta/recipes-connectivity/avahi/avahi-ui_0.6.30.bb |   37 +++++++++
 meta/recipes-connectivity/avahi/avahi.inc          |   86 ++++++++++---------
 meta/recipes-connectivity/avahi/avahi_0.6.30.bb    |    6 +-
 meta/recipes-core/busybox/busybox.inc              |   32 +++++++
 meta/recipes-core/busybox/busybox_1.18.5.bb        |    2 +-
 meta/recipes-core/eglibc/eglibc-package.inc        |    3 +-
 meta/recipes-core/eglibc/eglibc_2.12.bb            |    2 +-
 meta/recipes-core/eglibc/eglibc_2.13.bb            |    2 +-
 meta/recipes-devtools/apt/apt-native_0.7.14.bb     |    2 +-
 meta/recipes-devtools/apt/apt_0.7.14.bb            |    2 +-
 meta/recipes-devtools/apt/files/apt.conf           |    4 +-
 .../dpkg/run-postinsts/run-postinsts               |    2 +-
 .../dpkg/run-postinsts/run-postinsts.awk           |    2 +-
 meta/recipes-devtools/dpkg/run-postinsts_1.0.bb    |    2 +-
 meta/recipes-devtools/rpm/rpm/pythondeps.sh        |   16 ++++
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    4 +-
 .../update-alternatives-dpkg.inc                   |    6 +-
 meta/recipes-extended/libzypp/libzypp_git.bb       |    2 +-
 meta/recipes-extended/sat-solver/sat-solver_git.bb |    2 +-
 meta/recipes-extended/zypper/zypper_git.bb         |    2 +-
 meta/recipes-kernel/oprofile/oprofileui.inc        |    2 +-
 .../recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb |    7 +-
 meta/recipes-multimedia/libpng/libpng_1.2.46.bb    |    8 +-
 scripts/combo-layer-hook-default.sh                |    2 +-
 35 files changed, 354 insertions(+), 115 deletions(-)
 create mode 100644 meta/recipes-connectivity/avahi/avahi-ui_0.6.30.bb
 create mode 100755 meta/recipes-devtools/rpm/rpm/pythondeps.sh

-- 
1.7.6




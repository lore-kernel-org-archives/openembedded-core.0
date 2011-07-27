Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qlyu5-0001t0-L5
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 09:51:42 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Jul 2011 00:47:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,275,1309762800"; d="scan'208";a="31949277"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.61])
	by azsmga001.ch.intel.com with ESMTP; 27 Jul 2011 00:47:26 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2011 00:46:50 -0700
Message-Id: <cover.1311752531.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [Consolidated & Tested 00/35] July 27
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
X-List-Received-Date: Wed, 27 Jul 2011 07:51:42 -0000

Richard,

There are a number of M3 features (pam and live images)along with
 some bug fixes in this pull request.

Notably is Paul's changes to local.conf.sample, which once propagted
will have some changes to the Poky version.


This includes the siteinfo re-work from Tom and Khem, along with the live Image 
changes from me.

NOTE to all: to create live images, you will need to include the following in your
local.conf or IMAGE_FSTYPES list:

IMAGE_FSTYPES += "live" # append live to the end of the list

Thanks
	Sau!

The following changes since commit 02031d766f983cd7e01e468cb2c926604313cd2a:

  arch-ia32.inc: Fix up TUNE_ARCH variable conflicts (2011-07-26 22:39:49 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/live

Bruce Ashfield (1):
  machine/qemu: set preferred linux-yocto kernel version

Enrico Scholz (2):
  console-tools: removed wildcard from SRC_URI
  module-init-tools: do not build static utilities for -cross

Kang Kai (5):
  libpam: update to 1.1.4 and add subpackage xtests
  cups: add pam support
  screen: add pam support
  sudo: add pam support
  shadow: update pam related configure files

Khem Raj (2):
  libxcb: Add missing DEPENDS on libxdmcp
  siteinfo: Rework the siteinfo for powerpc to fix uclibc fallout

Koen Kooi (1):
  dropbear: don't override DISTRO_TYPE if it is already set

Paul Eggleton (6):
  meta/conf/local.conf.sample: remove oprofileui-native related
    settings
  meta/conf/local.conf.sample: improve comments/layout
  meta/conf/local.conf.sample: improve terminal examples/comments
  meta/conf/local.conf.sample: remove nonfunctional BBINCLUDELOGS
    setting
  eglibc: remove unnecessary FILESPATHPKG usage
  scripts/combo-layer: keep carriage returns at the end of lines

Saul Wold (5):
  libcap: Update to 2.22 with License Clarification
  Remove -live.bb recipes
  Remove -directdisk.bb recipes
  classes/image*: Revamp creation of live images
  utils.bbclass: Don't forget to pass the cmdline options

Tom Rini (8):
  siteinfo: Move certain samba entries to common-linux
  siteinfo: Move certain bash entries to common-linux
  x86_64-linux siteinfo: Add bash info
  siteinfo: Move certain mysql entries to common-linux
  siteinfo: Move the rp-pppoe entry to common-linux
  siteinfo: Move certain db entries to common-linux
  siteinfo: Move general realloc/malloc values to common-$libc
  siteinfo: Move (getpgrp|setpgrp|setgrent|*get{pwuid,grgid}) to
    common-libc

Wenzong Fan (2):
  cronie: enable PAM support for cronie
  at: enable pam support

Xiaofeng Yan (3):
  openssh: Support PAM
  dropbear: Support pam
  polkit: Support pam

 meta-rt/images/core-image-minimal-rt-directdisk.bb |   15 ---
 meta-rt/images/core-image-minimal-rt-live.bb       |   15 ---
 .../image-empty.bbclass}                           |    0
 meta/classes/image-live.bbclass                    |   13 +++
 meta/classes/image.bbclass                         |    3 +
 meta/classes/image_types.bbclass                   |   15 +++-
 meta/classes/siteinfo.bbclass                      |   16 ++--
 meta/classes/utils.bbclass                         |    2 +-
 meta/conf/local.conf.sample                        |   45 ++++++----
 meta/conf/machine/include/qemu.inc                 |    1 +
 .../openssh/openssh-5.8p2/sshd                     |   10 ++
 meta/recipes-connectivity/openssh/openssh_5.8p2.bb |   13 +++-
 .../console-tools/console-tools_0.3.2.bb           |    2 +-
 meta/recipes-core/dropbear/dropbear.inc            |   10 ++-
 .../dropbear/dropbear/dropbear-enable-pam.patch    |   22 +++++
 meta/recipes-core/dropbear/dropbear_0.52.bb        |    2 +-
 meta/recipes-core/eglibc/eglibc_2.13.bb            |    3 +-
 meta/recipes-core/images/core-image-directdisk.inc |   11 ---
 meta/recipes-core/images/core-image-live.inc       |   21 -----
 .../images/core-image-minimal-directdisk.bb        |   11 ---
 .../recipes-core/images/core-image-minimal-live.bb |   11 ---
 .../at/at-3.1.12/configure-add-enable-pam.patch    |   23 +++++
 meta/recipes-extended/at/at-3.1.12/pam.conf.patch  |   21 +++++
 meta/recipes-extended/at/at_3.1.12.bb              |   21 ++++-
 .../cronie/cronie/crond_pam_config.patch           |   19 ++++
 meta/recipes-extended/cronie/cronie_1.4.7.bb       |   12 ++-
 meta/recipes-extended/cups/cups_1.4.6.bb           |    8 +-
 .../recipes-extended/images/core-image-lsb-live.bb |   11 ---
 .../images/core-image-lsb-sdk-live.bb              |   11 ---
 .../pam/libpam/libpam-xtests.patch                 |   35 ++++++++
 .../pam/{libpam_1.1.3.bb => libpam_1.1.4.bb}       |   14 ++-
 .../polkit/polkit-0.101/polkit-1_pam.patch         |   23 +++++
 meta/recipes-extended/polkit/polkit_0.101.bb       |    7 +-
 .../screen/screen-4.0.3/screen.pam                 |    2 +
 meta/recipes-extended/screen/screen_4.0.3.bb       |   23 ++++-
 .../shadow/files/shadow-update-pam-conf.patch      |   91 ++++++++++++++++++++
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |    5 +-
 meta/recipes-extended/sudo/files/sudo.pam          |    6 ++
 meta/recipes-extended/sudo/sudo_1.8.1p2.bb         |   18 +++-
 meta/recipes-graphics/xcb/libxcb_1.7.bb            |    4 +-
 .../module-init-tools-cross_3.16.bb                |    2 +-
 .../images/core-image-sato-directdisk.bb           |    9 --
 meta/recipes-sato/images/core-image-sato-live.bb   |   11 ---
 .../images/core-image-sato-sdk-directdisk.bb       |    9 --
 .../images/core-image-sato-sdk-live.bb             |   11 ---
 meta/recipes-support/libcap/libcap.inc             |    4 +-
 meta/recipes-support/libcap/libcap_2.20.bb         |    6 --
 meta/recipes-support/libcap/libcap_2.22.bb         |    6 ++
 meta/site/arm-common                               |   35 --------
 meta/site/arm-linux                                |   15 ---
 meta/site/arm-linux-uclibc                         |   12 ---
 meta/site/armeb-linux                              |   10 --
 meta/site/armeb-linux-uclibc                       |   10 --
 meta/site/common-glibc                             |   10 ++
 meta/site/common-linux                             |   39 +++++++++
 meta/site/common-uclibc                            |   11 +++
 meta/site/ix86-common                              |   43 ---------
 meta/site/mips-common                              |    3 -
 meta/site/mips-linux                               |   29 +------
 meta/site/mips-linux-uclibc                        |   29 +------
 meta/site/mipsel-linux                             |   40 +---------
 meta/site/mipsel-linux-uclibc                      |   26 ------
 meta/site/powerpc-linux                            |   13 ---
 meta/site/powerpc32-linux                          |   36 +--------
 meta/site/sh-common                                |   45 +----------
 meta/site/sparc-linux                              |   10 --
 meta/site/x86_64-linux                             |   28 ++-----
 meta/site/x86_64-linux-uclibc                      |   23 -----
 scripts/combo-layer                                |    2 +-
 69 files changed, 509 insertions(+), 613 deletions(-)
 delete mode 100644 meta-rt/images/core-image-minimal-rt-directdisk.bb
 delete mode 100644 meta-rt/images/core-image-minimal-rt-live.bb
 rename meta/{site/powerpc-linux-uclibc => classes/image-empty.bbclass} (100%)
 create mode 100644 meta/classes/image-live.bbclass
 create mode 100644 meta/recipes-connectivity/openssh/openssh-5.8p2/sshd
 create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear-enable-pam.patch
 delete mode 100644 meta/recipes-core/images/core-image-directdisk.inc
 delete mode 100644 meta/recipes-core/images/core-image-live.inc
 delete mode 100644 meta/recipes-core/images/core-image-minimal-directdisk.bb
 delete mode 100644 meta/recipes-core/images/core-image-minimal-live.bb
 create mode 100644 meta/recipes-extended/at/at-3.1.12/configure-add-enable-pam.patch
 create mode 100644 meta/recipes-extended/at/at-3.1.12/pam.conf.patch
 create mode 100644 meta/recipes-extended/cronie/cronie/crond_pam_config.patch
 delete mode 100644 meta/recipes-extended/images/core-image-lsb-live.bb
 delete mode 100644 meta/recipes-extended/images/core-image-lsb-sdk-live.bb
 create mode 100644 meta/recipes-extended/pam/libpam/libpam-xtests.patch
 rename meta/recipes-extended/pam/{libpam_1.1.3.bb => libpam_1.1.4.bb} (85%)
 create mode 100644 meta/recipes-extended/polkit/polkit-0.101/polkit-1_pam.patch
 create mode 100644 meta/recipes-extended/screen/screen-4.0.3/screen.pam
 create mode 100644 meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
 create mode 100644 meta/recipes-extended/sudo/files/sudo.pam
 delete mode 100644 meta/recipes-sato/images/core-image-sato-directdisk.bb
 delete mode 100644 meta/recipes-sato/images/core-image-sato-live.bb
 delete mode 100644 meta/recipes-sato/images/core-image-sato-sdk-directdisk.bb
 delete mode 100644 meta/recipes-sato/images/core-image-sato-sdk-live.bb
 delete mode 100644 meta/recipes-support/libcap/libcap_2.20.bb
 create mode 100644 meta/recipes-support/libcap/libcap_2.22.bb

-- 
1.7.3.4




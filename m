Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id E719F719EA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 11:49:53 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id EBB71B87EF8; Tue,  6 Dec 2016 12:49:51 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2016 12:49:18 +0100
Message-Id: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 00/33] Accumulated patches for deb packaging
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
X-List-Received-Date: Tue, 06 Dec 2016 11:49:54 -0000

These are most of my patches which accumulated since our distro
switched from opkg to dpkg and apt two years ago. They were tested
thoroughly on dora and krogoth and just a little bit on master.

Most importantly, this adds support for Debian's update-alternatives
on rootfs creation time. For this to work, the recently added option
'--force-script-chrootless' must be passed to dpkg.

There's also a patch adding BAD_RECOMMENDATIONS for deb packages.

One patch renames dpkg-start-stop to start-stop-daemon. There's also
a recipe in meta-oe with the same name, which should be removed later.

Andreas Oberritter (33):
  dpkg: implement offline mode for update-alternatives
  dpkg: update-alternatives-dpkg should conflict with other providers
  dpkg-native: hardcode SYSCONFDIR to /etc in update-alternatives
  apt-native: Use option --force-script-chrootless for rootfs
  package_manager/deb: pass option --force-script-chrootless to dpkg
  debianutils: Allow native builds
  apt-native: merge apt-native.inc into .bb
  apt: merge apt-package.inc into .bb
  apt-native: use sed to prepare apt.conf.sample
  apt: use default packaging rules for manpages
  apt: use default packaging rules for base package, prepend apt-utils
  apt: use default packaging rules for -dev package
  apt: rewrite do_install
  apt-native: drop obsolete patches
  apt: merge with apt-native
  apt: merge apt.inc into .bb
  apt: group variables (license, configuration, packaging)
  apt: more fine-grained packaging
  apt: recommend gnupg
  package_manager/deb: let apt-get handle postinst scripts
  package_manager/deb: create Packages.xz
  package_manager/deb: implement BAD_RECOMMENDATIONS
  dpkg: use PACKAGECONFIG
  dpkg: set license field to more common "GPLv2+"
  dpkg: clean-up packaging of start-stop-daemon
  dpkg: remove unneeded do_configure override
  dpkg: simplify replacing perl interpreter in scripts
  dpkg: update packages and files to match Debian more closely
  dpkg: always install dpkg-configure.service
  dpkg: use correct path for perl libraries
  package_deb.bbclass: compress control.tar with the same algorithm as
    data.tar
  apt: fix rpath error during configure
  apt: dselect depends on perl

 meta/classes/package_deb.bbclass                   |   2 +-
 meta/classes/rootfs_deb.bbclass                    |   6 -
 meta/lib/oe/package_manager.py                     | 117 ++----
 meta/lib/oe/rootfs.py                              |   8 +-
 meta/recipes-devtools/apt/apt-native.inc           |  70 ----
 meta/recipes-devtools/apt/apt-native_1.2.12.bb     |   4 -
 meta/recipes-devtools/apt/apt-package.inc          |  78 ----
 meta/recipes-devtools/apt/apt.inc                  |  35 --
 ...ys-run-dpkg-configure-a-at-the-end-of-our.patch | 126 -------
 .../apt/{files/apt.conf => apt/apt.conf.in}        |   8 +-
 meta/recipes-devtools/apt/apt/noconfigure.patch    |  37 --
 meta/recipes-devtools/apt/apt_1.2.12.bb            | 125 ++++++-
 .../apt/files/db_linking_hack.patch                |  29 --
 meta/recipes-devtools/apt/files/environment.patch  |  15 -
 meta/recipes-devtools/apt/files/no-curl.patch      |  54 ---
 meta/recipes-devtools/dpkg/dpkg.inc                | 153 ++++----
 ...tinsts-expect-D-to-be-set-when-running-in.patch |  70 ----
 ...pdate-alternatives-Implement-offline-mode.patch | 399 +++++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.18.7.bb          |   2 +-
 .../recipes-support/debianutils/debianutils_4.8.bb |   4 +-
 20 files changed, 654 insertions(+), 688 deletions(-)
 delete mode 100644 meta/recipes-devtools/apt/apt-native.inc
 delete mode 100644 meta/recipes-devtools/apt/apt-native_1.2.12.bb
 delete mode 100644 meta/recipes-devtools/apt/apt-package.inc
 delete mode 100644 meta/recipes-devtools/apt/apt.inc
 delete mode 100644 meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
 rename meta/recipes-devtools/apt/{files/apt.conf => apt/apt.conf.in} (80%)
 delete mode 100644 meta/recipes-devtools/apt/apt/noconfigure.patch
 delete mode 100644 meta/recipes-devtools/apt/files/db_linking_hack.patch
 delete mode 100644 meta/recipes-devtools/apt/files/environment.patch
 delete mode 100644 meta/recipes-devtools/apt/files/no-curl.patch
 delete mode 100644 meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/0003-update-alternatives-Implement-offline-mode.patch

-- 
2.7.4



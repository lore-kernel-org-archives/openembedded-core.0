Return-Path: <amarnath.valluri@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id E1F0A60851
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 13:42:26 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP; 10 Feb 2017 05:42:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,141,1484035200"; d="scan'208";a="42543505"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by orsmga002.jf.intel.com with ESMTP; 10 Feb 2017 05:42:25 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2017 15:42:08 +0200
Message-Id: <1486734151-28331-1-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 00/23] Fix for #7040 - Support for /usr merge
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
X-List-Received-Date: Fri, 10 Feb 2017 13:42:27 -0000

This set of patches implements the long-standing feature - merging of /bin,
/sbin, /libs to their /usr counterparts.

It introduces a 'usrmerge' DISTRO_FEATURE, when it's enabled:
  - other than native all base paths(base_{bin,sbin,lib}dir) points to ${exec_prefix}/{bin,sbin,lib}
  - base-files package adds the needed root links(/bin, /sbin, /lib{32,64}) points to /usr counterparts
  - As most of shell scripts refer "#!/bin/{sh,bash}" inside script, so makes sure that get added to RPROVIDES_ list by those packages to satisfy the build dependencies.

The assumption is that no recipe uses hard coded paths in recipes where pre-defined bitbake configuration variables are available. I have fixed quite many recipes that i found which violates this assumption.

I have tested this change on core-minimal, sato, windriver cube-desktop and intel-iot-refkit image builds. And i would prefer to run autobuilder tests prior to merging.

Amarnath Valluri (19):
  bitbake.conf: Modify nativesdk variables to support 'usrmerge' DISTRO_FEATURE
  cross.bbclass: merged /usr support
  systemd: chagnes to support merged /usr
  bash: changes to support merged /usr
  busybox: changes to support merged /usr
  sed: changes to support merged /usr
  package_deb.bbclass: Ignore file paths in RPROVIDES
  musl: Fix issues in relative symlink creation
  attr/acl: Do not create broken static library link when not needed
  systemd: Do not add libnss_* to systemd package
  util-linux: Make sure '${base_bindir}/reset' is part of util-linux-reset package.
  util-linux,shadow: Make 'nologin' alternative command
  libarchive: Backport upstream fixes.
  kernel: use ${nonarch_base_libdir} for kernel modules installation.
  firmware: use ${nonarch_base_libdir} for firmware installation.
  mdadm: Avoid using hardocded udev, sbin paths
  mktemp: Move installed files only when needed
  net-tools: Place package content as per bitbake environment.
  lsb: Make use of appropriate bitbake variables.

Joshua Lock (2):
  bitbake.conf: support for merged usr with DISTRO_FEATURE usrmerge
  base-files: support merged /usr

Jussi Kukkonen (2):
  glibc: Ensure ldconfig is packaged into glibc
  util-linux: Fix packaging with "usrmerge"

 meta/classes/cross.bbclass                         |   2 +-
 meta/classes/kernel-module-split.bbclass           |   2 +-
 meta/classes/kernel.bbclass                        |  14 +-
 meta/classes/module.bbclass                        |   2 +-
 meta/classes/package_deb.bbclass                   |   4 +
 meta/conf/bitbake.conf                             |  20 +-
 meta/recipes-core/base-files/base-files_3.0.14.bb  |  23 +-
 meta/recipes-core/busybox/busybox.inc              |   2 +
 meta/recipes-core/glibc/glibc-package.inc          |   2 +-
 ...dynamic-linker-a-relative-symlink-to-libc.patch |  58 ++++-
 meta/recipes-core/musl/musl_git.bb                 |   2 +-
 meta/recipes-core/systemd/systemd_232.bb           |   7 +-
 meta/recipes-core/util-linux/util-linux.inc        |  15 +-
 meta/recipes-extended/bash/bash.inc                |   2 +
 ...te_disk_posix.c-make-_fsobj-functions-mor.patch | 242 +++++++++++++++++++++
 ...02-Fix-extracting-hardlinks-over-symlinks.patch | 116 ++++++++++
 .../libarchive/libarchive_3.2.2.bb                 |   2 +
 meta/recipes-extended/lsb/lsb_4.1.bb               |  40 ++--
 meta/recipes-extended/mdadm/mdadm_4.0.bb           |   6 +-
 meta/recipes-extended/mktemp/mktemp_1.7.bb         |   8 +-
 .../net-tools/net-tools_1.60-26.bb                 |  11 +
 meta/recipes-extended/sed/sed_4.2.2.bb             |   1 +
 meta/recipes-extended/shadow/shadow.inc            |   3 +-
 .../linux-firmware/linux-firmware_git.bb           | 168 +++++++-------
 meta/recipes-support/attr/ea-acl.inc               |   2 +
 ...gure-option-to-enable-disable-static-libr.patch |  70 ++++++
 26 files changed, 668 insertions(+), 156 deletions(-)
 create mode 100644 meta/recipes-extended/libarchive/files/0001-archive_write_disk_posix.c-make-_fsobj-functions-mor.patch
 create mode 100644 meta/recipes-extended/libarchive/files/0002-Fix-extracting-hardlinks-over-symlinks.patch
 create mode 100644 meta/recipes-support/attr/files/0001-Added-configure-option-to-enable-disable-static-libr.patch

-- 
2.7.4



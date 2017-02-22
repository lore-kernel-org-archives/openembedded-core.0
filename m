Return-Path: <amarnath.valluri@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 68A5C7304C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 08:27:29 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2017 00:27:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,193,1484035200"; d="scan'208";a="1114017940"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by fmsmga001.fm.intel.com with ESMTP; 22 Feb 2017 00:27:30 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 10:26:57 +0200
Message-Id: <1487752042-19804-26-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487752042-19804-1-git-send-email-amarnath.valluri@intel.com>
References: <1487752042-19804-1-git-send-email-amarnath.valluri@intel.com>
Subject: [PATCH v2 00/25] Fix for #7040 - Support for /usr merge
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
X-List-Received-Date: Wed, 22 Feb 2017 08:27:29 -0000

This set of patches implements the long-standing feature - merging of /bin,
/sbin, /libs to their /usr counterparts.

It introduces a 'usrmerge' DISTRO_FEATURE, when it's enabled:
     - other than native all base paths(base_{bin,sbin,lib}dir) points to
       ${exec_prefix}/{bin,sbin,lib}
     - base-files package adds the needed root links(/bin, /sbin, /lib{32,64})
       points to /usr counterparts
     - As most of shell scripts refer "#!/bin/{sh,bash}" inside script, so makes
       sure that get added to RPROVIDES_ list by those packages to satisfy the
       build dependencies.

The assumption is that no recipe uses hard coded paths in recipes where
pre-defined bitbake configuration variables are available. I have fixed quite
many recipes that i found which violates this assumption.

I have tested this change on core-minimal, sato, windriver cube-desktop and
intel-iot-refkit image builds. And i would prefer to run autobuilder tests prior
to merging.

Changes in v2:
 - Moved root links creation out from 'base-files' to pre-rootfs.
 - Fixes to lsb, lttng-modules recipes., that are failed in autobuilder tests.
 - Added insane check to usrmerge feature.
 - Fixed typos in commit messages.


Amarnath Valluri (22):
  bitbake.conf: Modify nativesdk variables to support 'usrmerge'
    DISTRO_FEATURE
  cross.bbclass: merged /usr support
  base-files: Replace hardcoded root paths with appropriate bitbake
    variables
  systemd: chagnes to support merged /usr
  bash: changes to support merged /usr
  busybox: changes to support merged /usr
  sed: changes to support merged /usr
  musl: Fix issues in relative symlink creation
  attr/acl: Do not create broken static library link when not needed
  systemd: Do not add libnss_* to systemd package
  util-linux: Make sure '${base_bindir}/reset' is part of
    util-linux-reset package.
  util-linux,shadow: Make 'nologin' alternative command
  libarchive: Backport upstream fixes.
  kernel: use ${nonarch_base_libdir} for kernel modules installation.
  firmware: use ${nonarch_base_libdir} for firmware installation.
  mdadm: Avoid using hardocded udev, sbin paths
  mktemp: Move installed files only when needed
  net-tools: Place package content as per bitbake environment.
  lsb: Make use of appropriate bitbake variables.
  lttng-modules: Replace '/lib' with ${nonarch_base_libdir}
  image: create symlinks needed for merged /usr
  insane.bbclass: Add package QA check for merged /usr.

Joshua Lock (1):
  bitbake.conf: support for merged usr with DISTRO_FEATURE usrmerge

Jussi Kukkonen (2):
  glibc: Ensure ldconfig is packaged into glibc
  util-linux: Fix packaging with "usrmerge"

 meta/classes/cross.bbclass                         |   2 +-
 meta/classes/image.bbclass                         |  23 ++
 meta/classes/insane.bbclass                        |  16 ++
 meta/classes/kernel-module-split.bbclass           |   2 +-
 meta/classes/kernel.bbclass                        |  14 +-
 meta/classes/module.bbclass                        |   2 +-
 meta/conf/bitbake.conf                             |  20 +-
 meta/recipes-core/base-files/base-files_3.0.14.bb  |   5 +-
 meta/recipes-core/busybox/busybox.inc              |   2 +
 meta/recipes-core/glibc/glibc-package.inc          |   2 +-
 ...dynamic-linker-a-relative-symlink-to-libc.patch |  62 +++++-
 meta/recipes-core/musl/musl_git.bb                 |   2 +-
 meta/recipes-core/systemd/systemd_232.bb           |   7 +-
 meta/recipes-core/util-linux/util-linux.inc        |  13 +-
 meta/recipes-extended/bash/bash.inc                |   2 +
 ...te_disk_posix.c-make-_fsobj-functions-mor.patch | 245 +++++++++++++++++++++
 ...02-Fix-extracting-hardlinks-over-symlinks.patch | 120 ++++++++++
 .../libarchive/libarchive_3.2.2.bb                 |   2 +
 meta/recipes-extended/lsb/lsb_4.1.bb               |  40 ++--
 meta/recipes-extended/mdadm/mdadm_4.0.bb           |   6 +-
 meta/recipes-extended/mktemp/mktemp_1.7.bb         |   8 +-
 .../net-tools/net-tools_1.60-26.bb                 |  11 +
 meta/recipes-extended/sed/sed_4.2.2.bb             |   1 +
 meta/recipes-extended/shadow/shadow.inc            |   3 +-
 .../linux-firmware/linux-firmware_git.bb           | 168 +++++++-------
 meta/recipes-kernel/lttng/lttng-modules_2.9.0.bb   |   4 +-
 meta/recipes-support/attr/ea-acl.inc               |   2 +
 ...gure-option-to-enable-disable-static-libr.patch |  70 ++++++
 28 files changed, 699 insertions(+), 155 deletions(-)
 create mode 100644 meta/recipes-extended/libarchive/files/0001-archive_write_disk_posix.c-make-_fsobj-functions-mor.patch
 create mode 100644 meta/recipes-extended/libarchive/files/0002-Fix-extracting-hardlinks-over-symlinks.patch
 create mode 100644 meta/recipes-support/attr/files/0001-Added-configure-option-to-enable-disable-static-libr.patch

-- 
2.7.4



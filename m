Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2D24D7646C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 13:31:23 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 30 Jul 2015 06:30:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,577,1432623600"; d="scan'208";a="758407398"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jul 2015 06:30:57 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2015 16:31:29 +0300
Message-Id: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 00/26] Upstream version check fixes for various recipes
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
X-List-Received-Date: Thu, 30 Jul 2015 13:31:27 -0000

This patchset contains various recipe fixes that allow upstream version checks.
It also updates recipes that fetch sources from Google Code (about to shut down)
to use alternatives. Please see individual commits for what is fixed and why.

The following changes since commit 3aeeda88e236f3da577adc20597dab38a66157c5:

  wget.py: fix incorrect regexes (2015-07-30 14:47:12 +0300)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/recipe-reporting-fixes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/recipe-reporting-fixes

Alexander Kanavin (26):
  libproxy: update SRC_URI to not use Google Code
  fotowall: update SRC_URI to use github instead of qt-apps.org
  distcc: update SRC_URI to not use Google Code
  adt-installer: update SRC_URI to not use Google Code
  ossp-uuid: update SRC_URI to not use Google Code
  eglinfo: change version from 1.0 to 1.0.0 to match the upstream git
    tag
  gptfdisk: use tarballs instead of git for fetching source code
  libmad: use ftp instead of sourceforge for consistency with libid3tag
  lsb: set PV to 1.4 to match upstream tarball version
  linux-yocto-dev: only numeric characters are allowed in package
    versions taken from git
  nss: reorder SRC_URI lines to fix upstream version check
  pseudo: fix upstream SRC_URI to enable upstream version check
  oprofile: reorder SRC_URI lines to fix upstream version check
  puzzles: switch svn for git, as upstream has done the same
  syslinux: drop v6.xx/ from directory path in SRC_URI
  shared-mime-info: reorder SRC_URI lines to fix upstream version check
  tremor: switch SRC_URI from svn to tarballs on debian mirrors
  x264: only numeric characters are allowed in package versions taken
    from git
  xf86-video-omapfb: switch SRC_URI to debian git repo
  stress: use developer's website for SRC_URI
  systemd: remove PV from the recipe
  unzip,zip: fix PV to allow upstream version check
  guilt-native: set PV in the recipe to allow upstream version check
  distrodata.bbclass: do not skip -native recipes in checkpkg task
  distrodata.bbclass: do not use get_recipe_pv_without_srcpv() before
    comparing versions in checkpkg
  distrodata.bbclass: drop the manual upstream version check logic

 meta/classes/distrodata.bbclass                    | 27 ++-----------------
 meta/recipes-core/systemd/systemd_219.bb           |  2 --
 meta/recipes-devtools/distcc/distcc_3.1.bb         |  3 ++-
 .../fdisk/{gptfdisk_git.bb => gptfdisk_0.8.10.bb}  |  8 +++---
 meta/recipes-devtools/guilt/guilt-native_git.bb    |  2 +-
 .../installer/adt-installer_1.0.bb                 |  2 +-
 meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb |  2 +-
 meta/recipes-devtools/pseudo/pseudo_1.6.7.bb       |  2 +-
 meta/recipes-devtools/syslinux/syslinux_6.03.bb    |  2 +-
 meta/recipes-extended/lsb/lsb_4.1.bb               |  1 +
 meta/recipes-extended/stress/stress_1.0.4.bb       |  2 +-
 meta/recipes-extended/unzip/unzip_6.0.bb           |  3 ++-
 meta/recipes-extended/zip/zip.inc                  |  3 ++-
 .../{eglinfo-fb_1.0.bb => eglinfo-fb_1.0.0.bb}     |  0
 .../{eglinfo-x11_1.0.bb => eglinfo-x11_1.0.0.bb}   |  0
 .../xorg-driver/xf86-video-omapfb_git.bb           |  2 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb       |  2 +-
 meta/recipes-kernel/oprofile/oprofile.inc          |  2 +-
 meta/recipes-kernel/oprofile/oprofile_1.0.0.bb     |  6 ++---
 meta/recipes-multimedia/libmad/libmad_0.15.1b.bb   |  2 +-
 .../obsolete_automake_macros.patch                 |  0
 .../tremor-arm-thumb2.patch                        |  0
 .../tremor/{tremor_20120314.bb => tremor_18153.bb} |  6 +++--
 meta/recipes-multimedia/x264/x264_git.bb           |  2 +-
 meta/recipes-qt/qt-apps/fotowall_0.9.bb            |  3 ++-
 .../puzzles/files/puzzles_x32_abi_time.patch       | 30 ----------------------
 .../puzzles/{puzzles_r10286.bb => puzzles_git.bb}  |  7 ++---
 meta/recipes-support/libproxy/libproxy_0.4.11.bb   |  7 +++--
 meta/recipes-support/nss/nss.inc                   |  2 +-
 meta/recipes-support/nss/nss_3.17.3.bb             |  6 ++---
 .../shared-mime-info/shared-mime-info_1.4.bb       |  2 +-
 31 files changed, 44 insertions(+), 94 deletions(-)
 rename meta/recipes-devtools/fdisk/{gptfdisk_git.bb => gptfdisk_0.8.10.bb} (75%)
 rename meta/recipes-graphics/eglinfo/{eglinfo-fb_1.0.bb => eglinfo-fb_1.0.0.bb} (100%)
 rename meta/recipes-graphics/eglinfo/{eglinfo-x11_1.0.bb => eglinfo-x11_1.0.0.bb} (100%)
 rename meta/recipes-multimedia/tremor/{tremor-20120314 => tremor}/obsolete_automake_macros.patch (100%)
 rename meta/recipes-multimedia/tremor/{tremor-20120314 => tremor}/tremor-arm-thumb2.patch (100%)
 rename meta/recipes-multimedia/tremor/{tremor_20120314.bb => tremor_18153.bb} (66%)
 delete mode 100644 meta/recipes-sato/puzzles/files/puzzles_x32_abi_time.patch
 rename meta/recipes-sato/puzzles/{puzzles_r10286.bb => puzzles_git.bb} (89%)

-- 
2.1.4



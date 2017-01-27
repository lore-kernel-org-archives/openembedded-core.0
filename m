Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3E42F774A3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 20:42:17 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Jan 2017 12:42:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,297,1477983600"; d="scan'208";a="1088093895"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 27 Jan 2017 12:42:18 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 0A9B26A4006
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 12:41:19 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2017 22:19:37 +0200
Message-Id: <cover.1485547221.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v3 00/11] Fix for #10835 - WIC should not rely on hddimg creation for finding all needed artifacts
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
X-List-Received-Date: Fri, 27 Jan 2017 20:42:18 -0000

Hi,

This patchset usage of hddimg from wic codebase due to planned deprecation of hddimg.

While working on this wic-related code in meta/classes/ has been moved to
image-wic.bbclass to make it more maintainable.

Changes in v2: rebased on top of ross/mut
Changes in v3: removed patches that add tasks, fixed test cases,
               rebased on top of patches that make use of artifacts from DEPLOY_DIR_IMAGE,
               rebased on to pf ross/mut

The following changes since commit 2624674adefd86d15bc0bec2bb2a3876f785b947:

  selftest: check results in test_image_vars_dir* (2017-01-27 17:27:30 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wic/wip
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/wip

Ed Bartosh (10):
  image-wic: move wic code to image-wic.bbclass
  wic: use INITRD_LIVE in isoimage-isohybrid
  wic: isoimage-isohybrid: stop using HDDDIR
  image-wic: remove HDDDIR from WICVARS
  isoimage-isohybrid: use TRANSLATED_TARGET_ARCH instead of MACHINE_ARCH
  selftest: stop using hddimg in the wic test suite
  selftest: wic: fix test_iso_image test case
  grub-efi.bbclass: use 'grub-efi-' prefix
  wic-tools: add dependency to systemd-boot
  isoimage-isohybrid: renamed variable hdd_dir

Tom Zanussi (1):
  wic: Look for image artifacts in a common location

 meta/classes/grub-efi.bbclass                      |  10 +-
 meta/classes/image-wic.bbclass                     | 120 +++++++++++++++++++++
 meta/classes/image.bbclass                         |  25 +----
 meta/classes/image_types.bbclass                   |  95 ----------------
 meta/lib/oeqa/selftest/wic.py                      |   6 +-
 meta/recipes-core/meta/wic-tools.bb                |   4 +-
 scripts/lib/wic/plugins/source/bootimg-efi.py      |  39 +++++--
 .../lib/wic/plugins/source/isoimage-isohybrid.py   |  36 ++++---
 8 files changed, 182 insertions(+), 153 deletions(-)
 create mode 100644 meta/classes/image-wic.bbclass

-- 
2.1.4



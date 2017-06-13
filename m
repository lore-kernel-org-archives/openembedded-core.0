Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 79E9C78315
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 11:23:36 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP; 13 Jun 2017 04:23:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,338,1493708400"; d="scan'208";a="1159868412"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 13 Jun 2017 04:23:37 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 67CE358010F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 04:23:36 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jun 2017 14:21:48 +0300
Message-Id: <cover.1497348496.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v2 00/26] #11283 wic ls & cp & rm
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
X-List-Received-Date: Tue, 13 Jun 2017 11:23:37 -0000

Hi,

This is a consolidated patchet made of previously sent 'wic ls' 'wic cp' and
'wic rm' patchset. It doesn't depend on generic efi implementation, which
made these 3 patchsets pending.

Changes in v2:
- Added patch for mtools-native to fix wic tests breakage caused
  by non-deterministic mtools output
- Used assertIn and assertNotIn methods in test_wic_rm test case
  to have more useful output if test case fails.

The following changes since commit 1847d2aa40aa942b14e901634121c1bd3171c9be:

  Revert "package.bbclass: Restore functionality to detect RPM dependencies" (2017-06-13 06:18:49 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wip
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wip

Ed Bartosh (26):
  mtools-native: disable reading host configs
  filemap: fix skip logic
  filemap: add parameter 'length' to sparse_copy
  bootimg-pcbios: make boot image file unique
  wic: add wic_init_parser_ls
  wic: add help and usage content for 'wic ls'
  wic: add 'wic ls' command
  engine: implement listing wic images
  selftest: add new test case test_wic_ls
  wic: add wic_init_parser_cp
  wic: add help and usage content for 'wic cp'
  wic: add 'wic cp' command
  wic: add Disk._prop helper
  wic: add mcopy property
  filemap: change signature of sparse_copy function
  filemap: check if dest is written for every block
  filemap: calculate dst size correctly
  wic: add Disk._put_part_image method
  wic: fully implement 'wic cp'
  selftest: add test_wic_cp test case
  wic: add wic_init_parser_rm
  wic: add help and usage content for 'wic rm'
  wic: add 'wic rm' command
  wic: implement removing files
  wic: implement removing directories
  selftest: add test_wic_rm test case

 meta/lib/oeqa/selftest/cases/wic.py                |  96 ++++++++++-
 .../mtools/mtools/disable-hardcoded-configs.patch  |  17 ++
 meta/recipes-devtools/mtools/mtools_4.0.18.bb      |   1 +
 scripts/lib/wic/engine.py                          | 152 ++++++++++++++++-
 scripts/lib/wic/filemap.py                         |  50 +++++-
 scripts/lib/wic/help.py                            | 184 +++++++++++++++++++++
 scripts/lib/wic/plugins/imager/direct.py           |   2 +-
 scripts/lib/wic/plugins/source/bootimg-pcbios.py   |   2 +-
 scripts/wic                                        |  89 ++++++++++
 9 files changed, 580 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch

-- 
2.1.4



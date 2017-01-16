Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 28B5771BF2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 16:09:07 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 16 Jan 2017 08:09:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,239,1477983600"; d="scan'208";a="923124878"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 16 Jan 2017 08:09:07 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id E63816A4006;
	Mon, 16 Jan 2017 08:08:11 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jan 2017 17:46:29 +0200
Message-Id: <cover.1484581112.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH 00/14] Fix for #10835 - WIC should not rely on hddimg creation for finding all needed artifacts
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
X-List-Received-Date: Mon, 16 Jan 2017 16:09:08 -0000

Hi,

This patchset usage of hddimg from wic codebase due to planned deprecation of hddimg.

Wic used hddimg to get 2 types of artifacts - efi and iso artifacts.
This dependency is resolved by introducing new tasks to build efi and iso artifacts.
This removes dependency to hddimg and also speeds up wic image creation as producing
artifacts is faster than building hddimg.

While working on this wic-related code in meta/classes/ has been moved to
image-wic.bbclass to make it more maintainable.

The following changes since commit 2d1a68265cda3ad8f36f1d2138c308e9b08114f6:

  wic: _exec_cmd: produce error if exit code is not 0 (2017-01-16 17:26:21 +0200)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wic/dont-use-hddimg-10835
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/dont-use-hddimg-10835

Ed Bartosh (14):
  image-wic: move wic-related code to image-wic
  grub-efi: set default desination dir
  systemd-boot: set default desination dir
  image-wic.bbclas: add task do_efi_populate
  grub-efi: make do_efi_populate depend on do_deploy
  systemd-boot: make do_efi_populate depend on do_deploy
  wic: use EFI artifacts from $WORKDIR/efi
  image-wic: add task do_build_iso
  wic: use INITRD_LIVE in isoimage-isohybrid
  wic: isoimage-isohybrid: stop using HDDDIR
  image-wic: remove HDDDIR from WICVARS
  isoimage-isohybrid: use TRANSLATED_TARGET_ARCH instead of MACHINE_ARCH
  selftest: stop using hddimg in the wic test suite
  selftest: wic: fix test_iso_image test case

 meta/classes/grub-efi.bbclass                      |   3 +-
 meta/classes/image-wic.bbclass                     | 142 +++++++++++++++++++++
 meta/classes/image.bbclass                         |  25 +---
 meta/classes/image_types.bbclass                   |  89 -------------
 meta/classes/systemd-boot.bbclass                  |   3 +-
 meta/lib/oeqa/selftest/wic.py                      |   6 +-
 scripts/lib/wic/plugins/source/bootimg-efi.py      |   4 +-
 .../lib/wic/plugins/source/isoimage-isohybrid.py   |  20 +--
 8 files changed, 159 insertions(+), 133 deletions(-)
 create mode 100644 meta/classes/image-wic.bbclass

-- 
2.1.4



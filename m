Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id BDF3771DEF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 13:03:22 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP; 26 Jan 2017 05:03:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,289,1477983600"; d="scan'208";a="813573172"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Jan 2017 05:03:08 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id AF69A6A4006
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 05:02:10 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jan 2017 14:40:28 +0200
Message-Id: <cover.1485434085.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v2 00/14] Fix for #10835 - WIC should not rely on hddimg creation for finding all needed artifacts
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
X-List-Received-Date: Thu, 26 Jan 2017 13:03:22 -0000

Hi,

This patchset usage of hddimg from wic codebase due to planned deprecation of hddimg.

Wic used hddimg to get 2 types of artifacts - efi and iso artifacts.
To get rid of using hddimg 2 new tasks was added to build efi and iso artifacts.
This removes dependency to hddimg and also speeds up wic image creation as producing
efi and iso artifacts is faster than building hddimg.

While working on this wic-related code in meta/classes/ has been moved to
image-wic.bbclass to make it more maintainable.

Changes in v2: rebased on top of ross/mut

The following changes since commit 70c6fa0f9eefa2233cbdcbba5271d57a74393471:

  selftest: wic: split test_debug test case (2017-01-26 13:27:34 +0200)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wic/wip
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/wip

Ed Bartosh (14):
  image-wic: move wic code to image-wic.bbclass
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
 meta/classes/image-wic.bbclass                     | 149 +++++++++++++++++++++
 meta/classes/image.bbclass                         |  25 +---
 meta/classes/image_types.bbclass                   |  95 -------------
 meta/classes/systemd-boot.bbclass                  |   3 +-
 meta/lib/oeqa/selftest/wic.py                      |   6 +-
 scripts/lib/wic/plugins/source/bootimg-efi.py      |   4 +-
 .../lib/wic/plugins/source/isoimage-isohybrid.py   |  20 +--
 8 files changed, 166 insertions(+), 139 deletions(-)
 create mode 100644 meta/classes/image-wic.bbclass

--
Regards,
Ed


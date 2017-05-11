Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EE75A71C54
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 May 2017 12:43:50 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 May 2017 05:43:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,324,1491289200"; d="scan'208";a="100758852"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 11 May 2017 05:43:35 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 5F4546A4080
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 May 2017 05:43:20 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 May 2017 15:21:17 +0300
Message-Id: <cover.1494505033.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v2 0/5] #10073: generic EFI for wic
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
X-List-Received-Date: Thu, 11 May 2017 12:43:52 -0000

Hi,

This patchset is an implementation of generic EFI approach for wic images.

Instead of introducing yet another wic plugin it uses existing APIs from
EFI_PROVIDER classes to populate ${WORKDIR}/bootfs directory with EFI artifacts
and bootloader configuration. This directory can be used by wic rootfs plugin
to put into boot partition of the image.

Example kickstart file and 2 test cases were added to wic test suite to better
illustrate the approach.

I personally like this approach much better than duplicating oe image creation
functionality in wic plugins. This way we can have the code in one place and
bootloaders can be configured the same way for oe and wic images.

Changes in v2:
 - added patch: fixed default value of GRUB_ROOT
 - fixed typo in commit message: timage_types_wic > image_types_wic

The following changes since commit cdb9e7aa493d9ed0eb6ffcec37d581ea928b5f2b:

  selftest: fix test_unsupported_subcommand test case (2017-05-02 17:24:23 +0300)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wic/wip
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/wip

Ed Bartosh (5):
  efi: add efi_bootfs_populate API
  image_types_wic: add do_populate_bootfs task
  image_types_wic: merged 2 tasks
  oe-selftest: add wic tests for generic EFI
  grub-efi: fixed default value of GRUB_ROOT

 meta-selftest/wic/test_generic_efi.wks.in |  9 ++++
 meta/classes/grub-efi.bbclass             | 14 ++++--
 meta/classes/image_types_wic.bbclass      | 83 +++++++++++++++++++++++--------
 meta/classes/systemd-boot.bbclass         |  6 +++
 meta/lib/oeqa/selftest/wic.py             | 36 ++++++++++++++
 5 files changed, 122 insertions(+), 26 deletions(-)
 create mode 100644 meta-selftest/wic/test_generic_efi.wks.in

-- 
2.1.4



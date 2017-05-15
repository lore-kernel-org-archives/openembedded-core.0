Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5F47571D3A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 12:11:29 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga105.fm.intel.com with ESMTP; 15 May 2017 05:11:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,344,1491289200"; d="scan'208";a="102225329"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 15 May 2017 05:11:31 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 866B66A4080
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 05:11:15 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 May 2017 14:48:57 +0300
Message-Id: <cover.1494846385.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v3 0/5] #10073: generic EFI for wic
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
X-List-Received-Date: Mon, 15 May 2017 12:11:31 -0000

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

Changes in v3:
 - scheduled do_prepare_wic_build as earlier as possible

The following changes since commit cdb9e7aa493d9ed0eb6ffcec37d581ea928b5f2b:

  selftest: fix test_unsupported_subcommand test case (2017-05-02 17:24:23 +0300)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wic/generic-EFI-10073
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/generic-EFI-10073

Ed Bartosh (5):
  efi: add efi_bootfs_populate API
  image_types_wic: add do_populate_bootfs task
  image_types_wic: merged 2 tasks
  oe-selftest: add wic tests for generic EFI
  grub-efi: fixed default value of GRUB_ROOT

 meta-selftest/wic/test_generic_efi.wks.in |  9 ++++
 meta/classes/grub-efi.bbclass             | 14 ++++--
 meta/classes/image_types_wic.bbclass      | 84 +++++++++++++++++++++++--------
 meta/classes/systemd-boot.bbclass         |  6 +++
 meta/lib/oeqa/selftest/wic.py             | 36 +++++++++++++
 5 files changed, 123 insertions(+), 26 deletions(-)
 create mode 100644 meta-selftest/wic/test_generic_efi.wks.in

---
Regards,
Ed


Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0717977DE4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 13:47:53 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 May 2017 06:47:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,354,1491289200"; d="scan'208";a="1148913641"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 17 May 2017 06:47:54 -0700
Received: from vmed.fi.intel.com (crosswalk-testmaster.fi.intel.com
	[10.237.72.36])
	by linux.intel.com (Postfix) with ESMTP id A367E6A4080
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 06:47:38 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 May 2017 13:47:43 +0000
Message-Id: <cover.1495028624.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH v4 0/7] i#10073: generic EFI for wic
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
X-List-Received-Date: Wed, 17 May 2017 13:47:56 -0000

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

Changes in v4:
 - fixed build on platforms that don't support EFI
 - fixed non-gpl3 build
 - fixed build failure in systemd-boot code caused by rescheduled
   do_populate_bootfs to run earlier

The following changes since commit 920e1592fba8fd714b8fdf87f9792ebfa3377793:

  selftest: fix test_unsupported_subcommand test case (2017-05-17 13:35:28 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wic/wip
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/wip

Ed Bartosh (7):
  systemd-boot: create output dir if it doesn't exist
  efi: add efi_bootfs_populate API
  image_types_wic: add do_populate_bootfs task
  image_types_wic: merged 2 tasks
  oe-selftest: add wic tests for generic EFI
  grub-efi: fixed default value of GRUB_ROOT
  image_types_wic: schedule prepare_wic_build correctly

 meta-selftest/wic/test_generic_efi.wks.in |  9 ++++
 meta/classes/grub-efi.bbclass             | 14 +++--
 meta/classes/image_types_wic.bbclass      | 85 +++++++++++++++++++++++--------
 meta/classes/systemd-boot.bbclass         |  8 +++
 meta/lib/oeqa/selftest/wic.py             | 36 +++++++++++++
 5 files changed, 126 insertions(+), 26 deletions(-)
 create mode 100644 meta-selftest/wic/test_generic_efi.wks.in

-- 
Regards,
Ed



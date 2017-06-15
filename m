Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 349F878389
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 09:45:36 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga104.jf.intel.com with ESMTP; 15 Jun 2017 02:45:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,343,1493708400"; d="scan'208";a="115225955"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 15 Jun 2017 02:45:37 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id CA86C5803BE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 02:45:36 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Jun 2017 12:43:59 +0300
Message-Id: <cover.1497519337.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v5 0/6] #10073: generic EFI for wic
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
X-List-Received-Date: Thu, 15 Jun 2017 09:45:41 -0000

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

Changes in v5:
 - yet another fix for scheduling of do_prepare_wic_build: explicitly
   added dependencies do_prepare_wic_build -> EFI_PROVIDER:do_deploy
   in efi provider classes

   NOTE: to make this working on meta-intel we'll need to add dependency
         do_prepare_wic_build -> "${MLPREFIX}rmc-db:do_deploy"
         I'll send patch for this as soon as this patchset is accepted.

The following changes since commit 6964efddd31c479386d1643c1025bc102710392f:

  bitbake: cooker: ensure graceful exit after exception during BuildCompleted handler (2017-06-14 14:54:25 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wip
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wip

Ed Bartosh (6):
  efi: add efi_bootfs_populate API
  image_types_wic: add do_populate_bootfs task
  image_types_wic: merged 2 tasks
  grub-efi: fixed default value of GRUB_ROOT
  image_types_wic: schedule prepare_wic_build correctly
  oe-selftest: add wic tests for generic EFI

 meta-selftest/wic/test_generic_efi.wks.in |  9 ++++
 meta/classes/grub-efi.bbclass             | 15 ++++--
 meta/classes/image_types_wic.bbclass      | 84 +++++++++++++++++++++++--------
 meta/classes/systemd-boot.bbclass         |  7 +++
 meta/lib/oeqa/selftest/cases/wic.py       | 36 +++++++++++++
 5 files changed, 125 insertions(+), 26 deletions(-)
 create mode 100644 meta-selftest/wic/test_generic_efi.wks.in

-- 
2.1.4



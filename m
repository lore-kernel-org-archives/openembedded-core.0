Return-Path: <stefanx.stanacar@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 1C3426F5B9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 18:16:01 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 06 Mar 2014 10:16:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,602,1389772800"; d="scan'208";a="345991262"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by AZSMGA002.ch.intel.com with ESMTP; 06 Mar 2014 10:16:01 -0800
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.156])
	by linux.intel.com (Postfix) with ESMTP id 281BD6A4007;
	Thu,  6 Mar 2014 10:15:49 -0800 (PST)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Mar 2014 20:15:53 +0200
Message-Id: <cover.1394128875.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.5.3
Cc: dvhart@linux.intel.com
Subject: [PATCH 0/3] Add gummiboot boot manager alongside grub-efi
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
X-List-Received-Date: Thu, 06 Mar 2014 18:16:02 -0000

Hello,

This series adds recipes for gummiboot and a class allowing it to be used
as the boot loader for live/hddimg images.
Without changing EFI_PROVIDER, we have the same behaviour for EFI machines.
Using EFI_PROVIDER = "gummiboot" an installed image will use gummiboot instead
of grub-efi as it's boot manager.

I've tested this on FRI2, NUC and minnow (live USB boot and install from USB and boot) 
with  EFI_PROVIDER = "gummiboot" and  KERNEL_FEATURES_append = " cfg/efi-ext"
in local.conf

This is a partial fix for YB#4082.

Cheers,
Stefan

The following changes since commit a01af0202558e6ed9d16590b3a8d1dd1b95c0374:

  recipes: bump PRs (2014-03-05 17:36:37 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib stefans/gummiboot
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=stefans/gummiboot

Stefan Stanacar (3):
  recipes-bsp: Add gummiboot and gnu-efi recipes
  bootimg/grub-efi.bbclass: allow using a different class for EFI images
  classes: Add gummiboot class

 meta/classes/boot-directdisk.bbclass               |   7 +-
 meta/classes/bootimg.bbclass                       |   9 +-
 meta/classes/grub-efi.bbclass                      |   6 ++
 meta/classes/gummiboot.bbclass                     | 112 +++++++++++++++++++++
 .../gnu-efi/gnu-efi/parallel-make-archives.patch   |  48 +++++++++
 .../gnu-efi/gnu-efi/parallel-make.patch            |  22 ++++
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0u.bb           |  33 ++++++
 meta/recipes-bsp/gummiboot/gummiboot_git.bb        |  25 +++++
 .../initrdscripts/files/init-install-efi.sh        |  51 +++++++---
 9 files changed, 290 insertions(+), 23 deletions(-)
 create mode 100644 meta/classes/gummiboot.bbclass
 create mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make-archives.patch
 create mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make.patch
 create mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi_3.0u.bb
 create mode 100644 meta/recipes-bsp/gummiboot/gummiboot_git.bb

-- 
1.8.5.3



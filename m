Return-Path: <stefanx.stanacar@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 4A3186F619
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Mar 2014 16:04:32 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 Mar 2014 09:04:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,618,1389772800"; d="scan'208";a="416711247"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by azsmga001.ch.intel.com with ESMTP; 09 Mar 2014 09:04:33 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.156])
	by linux.intel.com (Postfix) with ESMTP id 1AC946A4007;
	Sun,  9 Mar 2014 09:04:20 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Mar 2014 18:04:26 +0200
Message-Id: <cover.1394379900.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.5.3
Cc: dvhart@linux.intel.com
Subject: [PATCH 0/4] Add gummiboot boot manager alongside grub-efi
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
X-List-Received-Date: Sun, 09 Mar 2014 16:05:01 -0000

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

Changes in V2:
 - split the first patch in two
 - used ${B} instead of ${S} in gummiboot do_deploy
 - change the function names in bootimg/grub-efi instead of using a
prefix

I've tested again the changes on top of master.

Cheers,
Stefan


The following changes since commit abe417e22b1b55c444460f722ca434f9d382ef87:

  classes/uboot-config: ignore doc varflag (2014-03-07 15:05:09 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib stefans/gummiboot
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=stefans/gummiboot

Stefan Stanacar (4):
  recipes-bsp: add gnu-efi recipe
  recipes-bsp: Add gummiboot recipe
  bootimg/grub-efi.bbclass: allow using a different class for EFI images
  classes: Add gummiboot class

 meta/classes/boot-directdisk.bbclass               |   7 +-
 meta/classes/bootimg.bbclass                       |   9 +-
 meta/classes/grub-efi.bbclass                      |  12 +--
 meta/classes/gummiboot.bbclass                     | 114 +++++++++++++++++++++
 .../gnu-efi/gnu-efi/parallel-make-archives.patch   |  48 +++++++++
 .../gnu-efi/gnu-efi/parallel-make.patch            |  22 ++++
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0u.bb           |  33 ++++++
 meta/recipes-bsp/gummiboot/gummiboot_git.bb        |  25 +++++
 .../initrdscripts/files/init-install-efi.sh        |  51 ++++++---
 9 files changed, 292 insertions(+), 29 deletions(-)
 create mode 100644 meta/classes/gummiboot.bbclass
 create mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make-archives.patch
 create mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make.patch
 create mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi_3.0u.bb
 create mode 100644 meta/recipes-bsp/gummiboot/gummiboot_git.bb

-- 
1.8.5.3



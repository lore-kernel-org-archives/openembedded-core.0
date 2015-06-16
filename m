Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A65027599C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 08:07:40 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 16 Jun 2015 01:07:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,624,1427785200"; d="scan'208";a="744225420"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jun 2015 01:07:41 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id CFA6B6A4005;
	Tue, 16 Jun 2015 01:07:04 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jun 2015 09:13:43 +0300
Message-Id: <1434435234-4892-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v2 00/11] UUID support in installer (poky-contrib: ed/oe-core/uuid-init-install)
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
X-List-Received-Date: Tue, 16 Jun 2015 08:07:40 -0000

Hi,

This patchet adds support of GPT partition table and
UUID support to initramfs installer scripts.

Using UUID in favor of device names is more reliable as
UUID names are persistent.

Device names can change as the order of adding device nodes
is arbitrary. This sometimes results in device names switching
on each boot, which can cause system fail to boot.
Persistent naming solves these issues.

Implementation details:
    Used partition UUID in kernel command line to specify root partition.
    Used partition UUID in /etc/fstab to specify swap partition.
    Used filesystem UUID in /etc/fstab to specify boot partition.

Code cleanup and usability fixes were done along the way. They're also
included into this patchset.

Patchest was tested on NUC device in both EFI and non-EFI modes.

See more details in [YOCTO #6101]

NOTE: Please drop the following pending patches as they're included into the patchset:
    [OE-core] [PATCH] image-live: Set syslinux timeout to 5s
    [OE-core] [PATCH] initramfs-live-install: Add gptdisk to initramfs
    [OE-core] [PATCH] init-install-efi: Implement UUID support

Ed Bartosh (11):
  image-live: Set syslinux timeout to 5s
  initramfs-live-install: Add blkid to initramfs
  busybox: Enable UUID-related options
  init-install-efi: Implement UUID support
  init-install: Use GPT table with GRUB 2
  init-install: Implement UUID support
  init-install: Specify filesystem type in parted command line
  init-install: Specify partition name in parted command line
  init-install: code cleanup: Replace tabs with spaces
  init-install: code cleanup: replace /dev/$device -> $device
  init-install: Properly delete partition table

 meta/classes/image-live.bbclass                    |   2 +-
 meta/recipes-core/busybox/busybox/defconfig        |   8 +-
 .../initrdscripts/files/init-install-efi.sh        |  90 ++++++------
 .../initrdscripts/files/init-install.sh            | 151 +++++++++++++--------
 .../initramfs-live-install-efi_1.0.bb              |   2 +-
 .../initrdscripts/initramfs-live-install_1.0.bb    |   2 +-
 6 files changed, 149 insertions(+), 106 deletions(-)

--
Ed



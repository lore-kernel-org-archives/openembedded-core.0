Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9D6C775977
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 18:05:05 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 15 Jun 2015 11:04:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,620,1427785200"; d="scan'208";a="747099883"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 15 Jun 2015 11:04:39 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id D89506A4083;
	Mon, 15 Jun 2015 11:04:02 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jun 2015 19:10:37 +0300
Message-Id: <1434384647-2901-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 00/10] UUID support in installer (poky-contrib: ed/oe-core/uuid-init-install)
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
X-List-Received-Date: Mon, 15 Jun 2015 18:05:08 -0000

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

Please review

Ed Bartosh (10):
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

 meta/classes/image-live.bbclass                    |   2 +-
 meta/recipes-core/busybox/busybox/defconfig        |   8 +-
 .../initrdscripts/files/init-install-efi.sh        |  90 ++++++-------
 .../initrdscripts/files/init-install.sh            | 146 +++++++++++++--------
 .../initramfs-live-install-efi_1.0.bb              |   2 +-
 .../initrdscripts/initramfs-live-install_1.0.bb    |   2 +-
 6 files changed, 143 insertions(+), 107 deletions(-)

--
Ed



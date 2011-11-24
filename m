Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RTUQH-0005hu-Ds
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 09:12:45 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 Nov 2011 00:05:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,563,1315206000"; d="scan'208";a="40788551"
Received: from unknown (HELO localhost) ([10.255.15.253])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Nov 2011 00:05:05 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Koen Kooi <koen@dominion.thruhere.net>, Chris Larson <clarson@kergoth.com>,
	Josef Ahmad <josef.ahmad@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 24 Nov 2011 00:04:58 -0800
Message-Id: <cover.1322120651.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [RFC PATCH 0/5] EFI live image support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Nov 2011 08:12:45 -0000

This series provides optional support for EFI boot for live images, both hddimg
and ISO, on ia32 platforms. It creates a new grub-efi-native recipe to create
the boot image. bootimg.bbclass has been refactored and syslinux support has
been made optional. The new live images can be built as PCBIOS-legacy (the
original type), EFI, or both. The MACHINE_FEATURES values "pcbios" and "efi"
dictate this behavior, if neither are specified, it defaults to PCBIOS-legacy
only to maintain current behavior.

It is careful not to add unecessary dependencies to the build by dynamically
including only the necessary bootloader classes (syslinux and/or grub-efi).

EFI hddimg's do not install into /EFI/BOOT as is proper due to a bug in the
dosfstools: http://bugzilla.yoctoproject.org/show_bug.cgi?id=1783. For now, the
files are installe in the root directory and users will need to update their
firmware or use a startup.nsh script for pure EFI booting.

Testing performed includes verification of the images built for the n450 BSP
with all combinations of the MACHINE_FEATURES. The syslinux and grub-efi boot
methods were validated on the n450 hardware as well. EFI-only ISO images are
untested, help here would be appreciated.

While the "install" target is preserved for the EFI boot, it will perform the
same install as it does currently - namely a GRUB legacy boot mechanism. Support
for EFI boot post install will follow in another patch series.

Thanks to Koen Kooi, Chris Larson, Richard Purdie, and Josef Ahmad for their
contributions of expertise, code, and testing.

NOTE: This is an RFC and not intended for inclusion. I would appreciate at least
      one round of reviews from the OE experts and some additional testing
      before this is pulled.


The following changes since commit c5bdef56175c0b6863e3d588a5a2c23cbea7b568:

  documentation/adt-manual/adt-prepare.xml: Fixed broken link (2011-11-08 21:49:45 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dvhart/efi
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dvhart/efi

Darren Hart (5):
  grub-efi-native: New recipe to build GRUB EFI images
  bootimg: Refactor build_hddimg and build_iso routines
  bootimg: Pull syslinux specific bits into syslinux.bbclass
  bootimg: Add grub-efi support
  bootimg: Allow for EFI-only boot images

 meta/classes/bootimg.bbclass                  |  148 +++++++++++++------------
 meta/classes/dummy.bbclass                    |    2 +
 meta/classes/grub-efi.bbclass                 |  140 +++++++++++++++++++++++
 meta/classes/syslinux.bbclass                 |   84 +++++++++++---
 meta/recipes-bsp/grub/grub-efi-native_1.99.bb |   74 ++++++++++++
 5 files changed, 362 insertions(+), 86 deletions(-)
 create mode 100644 meta/classes/dummy.bbclass
 create mode 100644 meta/classes/grub-efi.bbclass
 create mode 100644 meta/recipes-bsp/grub/grub-efi-native_1.99.bb

-- 
1.7.6.4




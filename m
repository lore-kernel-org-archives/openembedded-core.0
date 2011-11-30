Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RVoMb-0005rU-NH
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 18:54:33 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 30 Nov 2011 09:47:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="81677874"
Received: from unknown (HELO localhost) ([10.255.12.165])
	by orsmga002.jf.intel.com with ESMTP; 30 Nov 2011 09:47:51 -0800
From: Darren Hart <darren@dvhart.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Koen Kooi <koen@dominion.thruhere.net>, Chris Larson <clarson@kergoth.com>,
	Josef Ahmad <josef.ahmad@intel.com>, Joshua Lock <josh@linux.intel.com,
	Saul Wold <sgw@linux.intel.com>, openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2011 09:47:48 -0800
Message-Id: <cover.1322674459.git.darren@dvhart.com>
X-Mailer: git-send-email 1.7.6.4
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 0/5] EFI live image support
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
X-List-Received-Date: Wed, 30 Nov 2011 17:54:33 -0000

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
files are installed in the root directory and users will need to update their
firmware or use a startup.nsh script for pure EFI booting, or move them to
/EFI/BOOT manually.

Testing performed includes verification of the images built for the n450 BSP
with all combinations of the MACHINE_FEATURES. The syslinux and grub-efi boot
methods were validated on the n450 hardware as well. EFI-only ISO images are
untested, help here would be appreciated.

While the "install" target is preserved for the EFI boot, it will perform the
same install as it does currently - namely a GRUB legacy boot mechanism. Support
for EFI boot post install will follow in another patch series.

Thanks to Koen Kooi, Chris Larson, Richard Purdie, Josef Ahmad, Saul Wold, and
Joshua Lock for their contributions of expertise, code, and testing.


The following changes since commit 2864ff6a4b3c3f9b3bbb6d2597243cc5d3715939:

  getVar/setVar cleanups (2011-11-26 22:42:00 +0000)

are available in the git repository at:
  git://git.yoctoproject.org/user-contrib/dvhart/oe-core efi/v1
  http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=efi/v1

Darren Hart (5):
  grub-efi-native: New recipe to build GRUB EFI images
  bootimg: Refactor build_hddimg and build_iso routines
  bootimg: Pull syslinux specific bits into syslinux.bbclass
  bootimg: Add grub-efi support
  bootimg: Allow for EFI-only boot images

 meta/classes/bootimg.bbclass                  |  148 +++++++++++++------------
 meta/classes/dummy.bbclass                    |    2 +
 meta/classes/grub-efi.bbclass                 |  140 +++++++++++++++++++++++
 meta/classes/syslinux.bbclass                 |   68 ++++++++++--
 meta/recipes-bsp/grub/grub-efi-native_1.99.bb |   74 ++++++++++++
 5 files changed, 353 insertions(+), 79 deletions(-)
 create mode 100644 meta/classes/dummy.bbclass
 create mode 100644 meta/classes/grub-efi.bbclass
 create mode 100644 meta/recipes-bsp/grub/grub-efi-native_1.99.bb

-- 
1.7.6.4




Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T9kpc-0003Yb-T0
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Sep 2012 00:45:53 +0200
Received: by iaky10 with SMTP id y10so2705988iak.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2012 15:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=h+qNFKhMqGfN8Vdd+Bf3HnuYMZJPPyHQNK2QUiNRwPE=;
	b=nmIBFDyJcXkmYWIUOca3ZUFXUg+e/cU36wE8jzkSEosm7RKZKtcttrwAIv4tGY89yD
	L4SivU0GhrtqJygQEqN+nvNWkzaqUFJf0F+mUfkWqztR7FHZfcrqlelsBLMSEww09fgP
	+tYVVgQFmImyRoM0CqHuxyqESvbFUY90oFzIoKaFKa/U0vUlWt69wqpQyMFB+VJu4rCV
	Jv3ZXb4IweQ/p1HiS8P52K7bjMj5JttBO2Zod1QVzSwzXCAPQ3JA3FbyO+RTYrHTUQV1
	3w2sId4yaiP12UpZXPUgF5PagtMZQrcw+XHNPJY3P6CGFKDDz3GUDnNQKjr1RFEPNz59
	szug==
Received: by 10.50.57.202 with SMTP id k10mr5431300igq.45.1346970807425;
	Thu, 06 Sep 2012 15:33:27 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id nh1sm5232881igc.11.2012.09.06.15.33.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Sep 2012 15:33:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2012 15:32:32 -0700
Message-Id: <cover.1346970617.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/6] Upgrade qemu to 1.2 and eglibc with kconfig
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Sep 2012 22:45:53 -0000

This patchset updates qemu to 1.2 release
Adds kconfig to eglibc, kconfig is of interest for
eglibc upstream which is next step.
Removes nptl and enable-tls configure options from 
x86 machine configurations

The following changes since commit 610f8c0c0cab8e258919689fd641faec28b58caf:

  adt-installer: Allow changing YOCTOADT_REPO (2012-09-05 23:27:31 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/qemu-eglibc-updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/qemu-eglibc-updates

Khem Raj (6):
  eglibc-2.16: Add kconfig infrastructure
  eglibc: Enable kconfig for option management
  kconfig-frontends: Create symlinks for conf and mconf
  qemu-git: Move to tip of git past 1.2 release
  qemu: Update from 0.15 to 1.2
  machines/x86: Drop redundant glibc configure knobs

 meta/conf/machine/include/ia32-base.inc            |    5 -
 meta/conf/machine/qemux86-64.conf                  |    3 -
 meta/conf/machine/qemux86.conf                     |    4 -
 .../0001-eglibc-menuconfig-support.patch           | 1007 ++++++++++++++++++++
 ...0002-eglibc-menuconfig-hex-string-options.patch |  169 ++++
 ...0003-eglibc-menuconfig-build-instructions.patch |  176 ++++
 meta/recipes-core/eglibc/eglibc-initial.inc        |    1 +
 meta/recipes-core/eglibc/eglibc-options.inc        |    4 +-
 meta/recipes-core/eglibc/eglibc.inc                |    4 +
 meta/recipes-core/eglibc/eglibc_2.16.bb            |    8 +-
 .../kconfig-frontends/kconfig-frontends_3.5.bb     |    8 +-
 .../qemu-0.15.1/0001-ppc64-Fix-linker-script.patch |   46 -
 .../a4d1f142542935b90d2eb30f3aead4edcf455fe6.patch |   66 --
 ...-Actually-raise-interrupt-on-timer-expiry.patch |   41 -
 .../qemu-0.15.1/ppc-s500-set-invalid-mask.patch    |  610 ------------
 .../qemu/{qemu-0.15.1 => qemu-1.2.0}/arm-bgr.patch |   12 +-
 .../enable-i386-linux-user.patch                   |    0
 .../fallback-to-safe-mmap_min_addr.patch           |    0
 .../fix-configure-checks.patch                     |   18 +-
 .../{qemu-0.15.1 => qemu-1.2.0}/init-info.patch    |    0
 .../larger_default_ram_size.patch                  |    0
 .../{qemu-0.15.1 => qemu-1.2.0}/linker-flags.patch |   14 +-
 .../{qemu-0.15.1 => qemu-1.2.0}/no-strip.patch     |    0
 .../{qemu-0.15.1 => qemu-1.2.0}/powerpc_rom.bin    |  Bin 4096 -> 4096 bytes
 .../qemu-vmware-vga-depth.patch                    |   70 +-
 .../recipes-devtools/qemu/qemu-git/powerpc_rom.bin |  Bin 0 -> 4096 bytes
 .../qemu/{qemu_0.15.1.bb => qemu_1.2.0.bb}         |   18 +-
 meta/recipes-devtools/qemu/qemu_git.bb             |   15 +-
 28 files changed, 1431 insertions(+), 868 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0001-eglibc-menuconfig-support.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0002-eglibc-menuconfig-hex-string-options.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0003-eglibc-menuconfig-build-instructions.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/0001-ppc64-Fix-linker-script.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/a4d1f142542935b90d2eb30f3aead4edcf455fe6.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/hw-pl031-Actually-raise-interrupt-on-timer-expiry.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/ppc-s500-set-invalid-mask.patch
 rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/arm-bgr.patch (75%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/enable-i386-linux-user.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/fallback-to-safe-mmap_min_addr.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/fix-configure-checks.patch (59%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/init-info.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/larger_default_ram_size.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/linker-flags.patch (64%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/no-strip.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/powerpc_rom.bin (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/qemu-vmware-vga-depth.patch (61%)
 create mode 100644 meta/recipes-devtools/qemu/qemu-git/powerpc_rom.bin
 rename meta/recipes-devtools/qemu/{qemu_0.15.1.bb => qemu_1.2.0.bb} (57%)

-- 
1.7.9.5




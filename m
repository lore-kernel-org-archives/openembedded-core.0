Return-Path: <california.l.sullivan@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 2E6F06007A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 03:09:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Feb 2018 19:09:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,403,1515484800"; d="scan'208";a="21325719"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga008.jf.intel.com with ESMTP; 27 Feb 2018 19:09:25 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Feb 2018 19:09:00 -0800
Message-Id: <20180228030918.35934-1-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.14.3
Subject: [PATCH v2 00/18] EFI image enhancements
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
X-List-Received-Date: Wed, 28 Feb 2018 03:09:25 -0000

EFI images require a boot partition containing the bootloader, the
kernel, the bootloader configuration, and any other EFI binaries that
your platform needs. Currently, the boot partition is done at image
creation time rather than through packages, making it very difficult to
add to its contents. As an example, we currently have no way to make use
of the multiple kernel enhancement that was recently added.

We should instead be treating the boot partition like anything else and
be installing needed items via packages. This can be done by treating
the /boot/ directory as the boot partion, pointing wic at it via the
--rootfs-dir option for the EFI partition, and using the new
--exclude-path option to not include the contents of /boot/ in the main
rootfs. This is the kickstart file in patch 0008.

What's left is installing everything in the correct location, which is
what the majority of the remaining patches entails.

I reused the grub-efi and systemd-boot bbclasses to create the
configuration files, and one change that was required due to that is the
removal of the assumption that kernels are installed as "vmlinuz", which
was normal in the past. This change was needed in order to make use of
the new normal kernel install, where the default kernel is installed to
/boot/ as ${KERNEL_IMAGETYPE}.

This has some cascading effects and required changes in install scripts
as well, as they too assumed the kernel would be named vmlinuz. When
updating these I also added functionality allowing them to install
multiple kernels.

The image enhancements can be tested in qemu by adding the following to
your local.conf:
MACHINE="qemux86"
# or qemux86-64
WKS_FILE = "efi-bootdisk.wks.in"
MACHINE_FEATURES_append = " efi"
IMAGE_INSTALL_append = " grub-efi systemd-boot kernel-image-bzimage"
# kernel-image-bzimage is neccessary due to
# RDEPENDS_${KERNEL_PACKAGE_NAME}-base = "" in qemu.inc
IMAGE_FSTYPES_pn-core-image-minimal_append = " wic"

And then running the following:
bitbake core-image-minimal ovmf
runqemu wic ovmf

The image will contain two bootloaders in the boot partition, and will
boot successfully with either.

Please note that without setting the EFI_PROVIDER variable, neither
bootloader will be installed as the standard boot(x64|ia32), and will
have to be ran manually through the EFI shell.

There is still one unfortunate issue with this patchset - I wasn't able
to get random UUIDs working completely right before feature freeze, so
instead the bootconf recipes assume that the rootfs will be /dev/sda2.
This can be changed via the ROOT variable which originated from the
grub-efi.bbclass. For this reason, I'm not making the efi-bootdisk
kickstart file default for anything, only making it available for this
release.

The issue with random UUIDs is that both wic and the bootloader
configurations need the same random value, and wic needs it at parse
time in order to specify it in a kickstart file. This is doable, but a
little nasty, by writing a value to a file and adding helper functions
to assign that value to a variable. The issue here is package upgrades.
I know of no way to ensure that that file generated at parse time
persists between builds, and if someone tries to do a package upgrade on
thier configuration file that now has a different UUID, they would no
longer have the same UUID as their rootfs, causing boot failures.

One additional issue is that the kernel is installed to /boot/ in iso
and hddimgs, when the real kernel and bootloaders are in the separate
EFI partition. This can be fixed via the following patch and one
additional line of configuration for those image types:
http://lists.openembedded.org/pipermail/openembedded-core/2018-January/146828.html

Please review this patcheset and let me know of any issues you see or
encounter. Also, I have a contrib branch available to pull from here:
https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=clsulliv/image-creation-sda2

A previous iteration including the UUID stuff that's not included here
is available at clsulliv/image-creation-exclude-path

Thanks,
Cal

V2 changes:
* ROOT is now overridable. Woops.
* Fix fixup in 'systemd-boot: add package that installs to boot' that
    belonged in the systemd-bootconf recipe patch.
* Add -bootconf recipes to SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS to avoid
    rebuilding grub-efi/systemd-boot when not necessary.
* Add basic test case that leverages the generic EFI boot partition.

California Sullivan (18):
  grub-efi.bbclass: split out configuration portion
  grub: create recipe for configuration
  grub-efi: install to /boot/
  grub-efi: if installed and EFI_PROVIDER, install as bootx64 or
    bootia32
  packagegroup-core-boot: add bootloader to EFI systems
  live-vm-common.bbclass: Don't use vmlinuz or VM_DEFAULT_KERNEL
  grub-efi*.bbclass: don't reference vmlinuz
  wic: add wks file to make use of exclude-path functionality
  init-install-efi.sh: Update to support installing multiple kernels
  syslinux.bbclass: don't use vmlinuz
  systemd-boot.bbclass: break out configuration creation
  systemd: add systemd-bootconf recipe
  systemd-boot*.bbclass: Don't use vmlinuz
  systemd-boot: add package that installs to boot
  packagegroup-core-boot: add kernel for EFI systems
  init-install.sh: support multiple kernels and don't assume vmlinuz
  layer.conf: add -bootconf recipes to SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS
  selftests: Add test case for booting a generic EFI boot partition
    image

 .../{grub-efi.bbclass => grub-efi-cfg.bbclass}     |  44 +-------
 meta/classes/grub-efi.bbclass                      | 124 +--------------------
 meta/classes/live-vm-common.bbclass                |   9 +-
 meta/classes/syslinux.bbclass                      |   4 +-
 meta/classes/systemd-boot-cfg.bbclass              |  75 +++++++++++++
 meta/classes/systemd-boot.bbclass                  |  72 +-----------
 meta/conf/layer.conf                               |   2 +
 meta/lib/oeqa/selftest/cases/efibootpartition.py   |  45 ++++++++
 meta/recipes-bsp/grub/grub-bootconf_1.00.bb        |  29 +++++
 meta/recipes-bsp/grub/grub-efi_2.02.bb             |  43 +++++--
 .../initrdscripts/files/init-install-efi.sh        |  15 ++-
 .../initrdscripts/files/init-install.sh            |  37 +++++-
 .../packagegroups/packagegroup-core-boot.bb        |   3 +
 meta/recipes-core/systemd/systemd-boot_234.bb      |  28 ++++-
 meta/recipes-core/systemd/systemd-bootconf_1.00.bb |  31 ++++++
 scripts/lib/wic/canned-wks/efi-bootdisk.wks.in     |   3 +
 16 files changed, 304 insertions(+), 260 deletions(-)
 copy meta/classes/{grub-efi.bbclass => grub-efi-cfg.bbclass} (74%)
 create mode 100644 meta/classes/systemd-boot-cfg.bbclass
 create mode 100644 meta/lib/oeqa/selftest/cases/efibootpartition.py
 create mode 100644 meta/recipes-bsp/grub/grub-bootconf_1.00.bb
 create mode 100644 meta/recipes-core/systemd/systemd-bootconf_1.00.bb
 create mode 100644 scripts/lib/wic/canned-wks/efi-bootdisk.wks.in

-- 
2.14.3



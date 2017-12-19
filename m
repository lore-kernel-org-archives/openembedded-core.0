Return-Path: <california.l.sullivan@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 06C577857A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 23:16:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Dec 2017 15:16:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,428,1508828400"; d="scan'208";a="13714570"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga003.jf.intel.com with ESMTP; 19 Dec 2017 15:16:07 -0800
To: openembedded-core@lists.openembedded.org
References: <20171219225831.22587-1-california.l.sullivan@intel.com>
From: Cal Sullivan <california.l.sullivan@intel.com>
Message-ID: <170b4aa2-5822-4813-5902-007271136ff1@intel.com>
Date: Tue, 19 Dec 2017 15:16:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171219225831.22587-1-california.l.sullivan@intel.com>
Subject: Re: [PATCH RFC 00/18] EFI boot partition improvements
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
X-List-Received-Date: Tue, 19 Dec 2017 23:16:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

I forgot to mention, my contrib branch with these and a few additional 
WIPs can be found here:

https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=clsulliv/image-creation

Thanks,
Cal


On 12/19/2017 02:58 PM, California Sullivan wrote:
> First, note that this is based on top of Haris' multiple kernels patch:
> http://lists.openembedded.org/pipermail/openembedded-core/2017-November/144031.html
>
> Currently, the boot partition of an EFI system is entirely controlled by
> image creation. Either done entirely through wic, or one of the
> bootloader bbclasses. This is rather bad since it makes it very
> difficult to add additional items to the boot partition, such as
> alternative kernels, bootloaders, or other utilities, and since its not
> package controlled its hard to update.
>
> The goal of these changes is to have the boot partition built through
> packages instead. We accomplish this by installing everything to /boot,
> and using the contents of /boot to create the partition. This required
> changes to several bootloaders, the kernel recipe, one new
> rootfs-postcommand to avoid data duplication, and a new .wks file to
> make use of the new functionality.
>
> Legacy hddimg, iso images, and wic images should be mostly unchanged,
> and their functionality is preserved. The only change they received is
> the kernel is now installed as ${KERNEL_IMAGETYPE} instead of hardcoded
> as vmlinuz, and their bootloader configs have been updated to reflect
> that.
>
> This is still a WIP, but I wanted to get some eyes and feedback on it.
> Here are some known issues that I've ran into, and am still working on:
> * fs-uuid (DISK_SIGNATURE_UUID) seems to have issues when changing MACHINE
>    types, and the image can get an old uuid when building from sstate
> * init-install.sh hasn't been updated to support multiple kernels, and
>    still uses hardcoded vmlinuz (broken)
> * the boot partition is vfat, which doesn't support symlinks, so the
>    symlink from the long kernel name to bzImage turns into a copy.
>
> I fully expect this to take several iterations to get right, so please
> any feedback is welcome.
>
> Thanks,
> Cal
>
> California Sullivan (18):
>    fs-uuid.bbclass: rewrite get_fs_uuid function
>    image.bbclass: Add fs-uuid bbclass
>    grub-efi.bbclass: split out configuration portion
>    grub: create recipe for configuration
>    grub-efi: install to /boot/
>    grub-efi: if installed and EFI_PROVIDER, install as bootx64 or
>      bootia32
>    rootfs-postcommands: add rootfs postprocess command to avoid /boot/
>      duplication
>    packagegroup-core-boot: add bootloader to EFI systems
>    live-vm-common.bbclass: Don't use vmlinuz or VM_DEFAULT_KERNEL
>    grub-efi*.bbclass: don't reference vmlinuz
>    wic: add wks file to make use of new bootfs functionality
>    init-install-efi.sh: Update to support installing multiple kernels
>    syslinux.bbclass: don't use vmlinuz
>    systemd-boot.bbclass: break out configuration creation
>    systemd: add systemd-bootconf recipe
>    systemd-boot*.bbclass: Don't use vmlinuz
>    systemd-boot: add package that installs to boot
>    packagegroup-core-boot: add kernel for EFI systems
>
>   meta/classes/fs-uuid.bbclass                       |  32 ++++--
>   .../{grub-efi.bbclass => grub-efi-cfg.bbclass}     |  44 +-------
>   meta/classes/grub-efi.bbclass                      | 124 +--------------------
>   meta/classes/image.bbclass                         |   3 +
>   meta/classes/live-vm-common.bbclass                |   9 +-
>   meta/classes/rootfs-postcommands.bbclass           |  19 ++++
>   meta/classes/syslinux.bbclass                      |   4 +-
>   meta/classes/systemd-boot-cfg.bbclass              |  75 +++++++++++++
>   meta/classes/systemd-boot.bbclass                  |  72 +-----------
>   meta/recipes-bsp/grub/grub-bootconf_1.00.bb        |  30 +++++
>   meta/recipes-bsp/grub/grub-efi_2.02.bb             |  41 +++++--
>   .../initrdscripts/files/init-install-efi.sh        |  15 ++-
>   .../packagegroups/packagegroup-core-boot.bb        |   3 +
>   meta/recipes-core/systemd/systemd-boot_234.bb      |  28 ++++-
>   meta/recipes-core/systemd/systemd-bootconf_1.00.bb |  31 ++++++
>   scripts/lib/wic/canned-wks/efi-bootdisk.wks.in     |   6 +
>   16 files changed, 269 insertions(+), 267 deletions(-)
>   copy meta/classes/{grub-efi.bbclass => grub-efi-cfg.bbclass} (74%)
>   create mode 100644 meta/classes/systemd-boot-cfg.bbclass
>   create mode 100644 meta/recipes-bsp/grub/grub-bootconf_1.00.bb
>   create mode 100644 meta/recipes-core/systemd/systemd-bootconf_1.00.bb
>   create mode 100644 scripts/lib/wic/canned-wks/efi-bootdisk.wks.in
>



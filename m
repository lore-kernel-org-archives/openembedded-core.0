Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SnCLa-0002tS-Mz
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jul 2012 19:29:39 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 06 Jul 2012 10:18:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="174225361"
Received: from unknown (HELO [10.255.12.157]) ([10.255.12.157])
	by fmsmga001.fm.intel.com with ESMTP; 06 Jul 2012 10:18:31 -0700
Message-ID: <4FF71DE7.1080708@linux.intel.com>
Date: Fri, 06 Jul 2012 10:18:31 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <cover.1341376182.git.dvhart@linux.intel.com>
	<4e017c01096f3e665e436d9f05bb8916c18bded1.1341376182.git.dvhart@linux.intel.com>
In-Reply-To: <4e017c01096f3e665e436d9f05bb8916c18bded1.1341376182.git.dvhart@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/5] EFI: Make installer EFI aware
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
X-List-Received-Date: Fri, 06 Jul 2012 17:29:39 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/03/2012 09:34 PM, Darren Hart wrote:
> [YOCTO #1919]
>
> Create a basic EFI installer script modeled after the existing installer
> and add it to a new initramfs-live-install-efi recipe. Update the
> init-live.sh script to distinguish between LABEL=install and
> LABEL=install-efi and select the appropriate script. Add the efi
> installer to core-image-minimal-initramfs.
>
> Update grub-efi.bbclass to use "LABEL=install-efi" when it detects a
> label of "install". This is clearly not ideal, but a proper fix would
> involve decoupling the LABELS assignment from the image-live.bbclass
> usage of SYSLINUX_LABELS. We should be able to address that in a
> follow-on clean-up series.
>
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> ---
>   meta/classes/grub-efi.bbclass                      |    2 +
>   .../images/core-image-minimal-initramfs.bb         |    2 +-
>   .../initrdscripts/files/init-install-efi.sh        |  188 ++++++++++++++++++++
>   meta/recipes-core/initrdscripts/files/init-live.sh |    6 +-
>   4 files changed, 194 insertions(+), 4 deletions(-)
>   create mode 100644 meta/recipes-core/initrdscripts/files/init-install-efi.sh
>
> diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
> index 1efb43b..147accc 100644
> --- a/meta/classes/grub-efi.bbclass
> +++ b/meta/classes/grub-efi.bbclass
> @@ -99,6 +99,8 @@ python build_grub_cfg() {
>           bb.data.update_data(localdata)
>
>           cfgfile.write('\nmenuentry \'%s\'{\n' % (label))
> +        if label == "install":
> +            label = "install-efi"
>           cfgfile.write('linux /vmlinuz LABEL=%s' % (label))
>
>           append = localdata.getVar('APPEND', True)
> diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/meta/recipes-core/images/core-image-minimal-initramfs.bb
> index 4aeb618..7f6826c 100644
> --- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
> +++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
> @@ -3,7 +3,7 @@ DESCRIPTION = "Small image capable of booting a device. The kernel includes \
>   the Minimal RAM-based Initial Root Filesystem (initramfs), which finds the \
>   first “init” program more efficiently."
>
> -IMAGE_INSTALL = "initramfs-live-boot initramfs-live-install busybox udev base-passwd"
> +IMAGE_INSTALL = "initramfs-live-boot initramfs-live-install initramfs-live-install-efi busybox udev base-passwd"

What provides the initramfs-live-install-efi?

I don't see it anywhere and I am getting the following ERROR on build:

> ERROR: Nothing RPROVIDES 'initramfs-live-install-efi' (but /intel/poky/distro/meta/recipes-core/images/core-image-minimal-initramfs.bb RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'initramfs-live-install-efi' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['initramfs-live-install-efi']
> ERROR: Required build target 'core-image-minimal' has no buildable providers.
> Missing or unbuildable dependency chain was: ['core-image-minimal', 'core-image-minimal-initramfs', 'initramfs-live-install-efi']

Sau!

>
>   # Do not pollute the initrd image with rootfs features
>   IMAGE_FEATURES = ""
> diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
> new file mode 100644
> index 0000000..c762f4b
> --- /dev/null
> +++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
> @@ -0,0 +1,188 @@
> +#!/bin/sh -e
> +#
> +# Copyright (c) 2012, Intel Corporation.
> +# All rights reserved.
> +#
> +# install.sh [device_name] [rootfs_name] [video_mode] [vga_mode]
> +#
> +
> +PATH=/sbin:/bin:/usr/sbin:/usr/bin
> +
> +# We need 20 Mb for the boot partition
> +boot_size=20
> +
> +# 5% for the swap
> +swap_ratio=5
> +
> +found="no"
> +
> +echo "Searching for a hard drive..."
> +for device in 'hda' 'hdb' 'sda' 'sdb' 'mmcblk0' 'mmcblk1'
> +do
> +    if [ -e /sys/block/${device}/removable ]; then
> +        if [ "$(cat /sys/block/${device}/removable)" = "0" ]; then
> +            found="yes"
> +
> +            while true; do
> +                # Try sleeping here to avoid getting kernel messages
> +                # obscuring/confusing user
> +                sleep 5
> +                echo "Found drive at /dev/${device}. Do you want to install this image there ? [y/n]"
> +                read answer
> +                if [ "$answer" = "y" ] ; then
> +                    break
> +                fi
> +
> +                if [ "$answer" = "n" ] ; then
> +                    found=no
> +                    break
> +                fi
> +
> +                echo "Please answer y or n"
> +            done
> +        fi
> +    fi
> +
> +    if [ "$found" = "yes" ]; then
> +        break;
> +    fi
> +
> +done
> +
> +if [ "$found" = "no" ]; then
> +    exit 1
> +fi
> +
> +echo "Installing image on /dev/${device}"
> +
> +#
> +# The udev automounter can cause pain here, kill it
> +#
> +rm -f /etc/udev/scripts/mount*
> +
> +#
> +# Unmount anything the automounter had mounted
> +#
> +umount /dev/${device}* 2> /dev/null || /bin/true
> +
> +# We always build with devtmpfs, this is not necessary
> +#if [ ! -b /dev/sda ] ; then
> +#    mknod /dev/sda b 8 0
> +#fi
> +#
> +#if [ ! -b /dev/sdb ] ; then
> +#    mknod /dev/sdb b 8 16
> +#fi
> +#
> +#if [ ! -b /dev/loop0 ] ; then
> +#    mknod /dev/loop0 b 7 0
> +#fi
> +
> +mkdir -p /tmp
> +cat /proc/mounts > /etc/mtab
> +
> +disk_size=$(parted /dev/${device} unit mb print | grep Disk | cut -d" " -f 3 | sed -e "s/MB//")
> +
> +swap_size=$((disk_size*swap_ratio/100))
> +rootfs_size=$((disk_size-boot_size-swap_size))
> +
> +rootfs_start=$((boot_size))
> +rootfs_end=$((rootfs_start+rootfs_size))
> +swap_start=$((rootfs_end))
> +
> +# MMC devices are special in a couple of ways
> +# 1) they use a partition prefix character 'p'
> +# 2) they are detected asynchronously (need rootwait)
> +rootwait=""
> +part_prefix=""
> +if [ ! "${device#mmcblk}" = "${device}" ]; then
> +    part_prefix="p"
> +    rootwait="rootwait"
> +fi
> +bootfs=/dev/${device}${part_prefix}1
> +rootfs=/dev/${device}${part_prefix}2
> +swap=/dev/${device}${part_prefix}3
> +
> +echo "*****************"
> +echo "Boot partition size:   $boot_size MB ($bootfs)"
> +echo "Rootfs partition size: $rootfs_size MB ($rootfs)"
> +echo "Swap partition size:   $swap_size MB ($swap)"
> +echo "*****************"
> +echo "Deleting partition table on /dev/${device} ..."
> +dd if=/dev/zero of=/dev/${device} bs=512 count=2
> +
> +echo "Creating new partition table on /dev/${device} ..."
> +parted /dev/${device} mklabel gpt
> +
> +echo "Creating boot partition on $bootfs"
> +parted /dev/${device} mkpart primary 0% $boot_size
> +
> +echo "Creating rootfs partition on $rootfs"
> +parted /dev/${device} mkpart primary $rootfs_start $rootfs_end
> +
> +echo "Creating swap partition on $swap"
> +parted /dev/${device} mkpart primary $swap_start 100%
> +
> +parted /dev/${device} print
> +
> +echo "Formatting $bootfs to vfat..."
> +mkfs.vfat $bootfs
> +
> +echo "Formatting $rootfs to ext3..."
> +mkfs.ext3 $rootfs
> +
> +echo "Formatting swap partition...($swap)"
> +mkswap $swap
> +
> +mkdir /ssd
> +mkdir /rootmnt
> +mkdir /bootmnt
> +
> +mount $rootfs /ssd
> +mount -o rw,loop,noatime,nodiratime /media/$1/$2 /rootmnt
> +
> +echo "Copying rootfs files..."
> +cp -a /rootmnt/* /ssd
> +
> +if [ -d /ssd/etc/ ] ; then
> +    echo "$swap                swap             swap       defaults              0  0" >> /ssd/etc/fstab
> +
> +    # We dont want udev to mount our root device while we're booting...
> +    if [ -d /ssd/etc/udev/ ] ; then
> +        echo "/dev/${device}" >> /ssd/etc/udev/mount.blacklist
> +    fi
> +fi
> +
> +umount /ssd
> +umount /rootmnt
> +
> +echo "Preparing boot partition..."
> +mount $bootfs /ssd
> +
> +EFIDIR="/ssd/EFI/BOOT"
> +mkdir -p $EFIDIR
> +GRUBCFG="$EFIDIR/grub.cfg"
> +
> +cp /media/$1/vmlinuz /ssd
> +# Copy the efi loader and config (booti*.efi and grub.cfg)
> +cp /media/$1/EFI/BOOT/* $EFIDIR
> +
> +# Update grub config for the installed image
> +# Delete the install entry
> +sed -i "/menuentry 'install'/,/^}/d" $GRUBCFG
> +# Delete the initrd lines
> +sed -i "/initrd /d" $GRUBCFG
> +# Delete any LABEL= strings
> +sed -i "s/ LABEL=[^ ]*/ /" $GRUBCFG
> +# Replace the ramdisk root with the install device and include other options
> +sed -i "s@ root=[^ ]*@ root=$rootfs rw $rootwait quiet@" $GRUBCFG
> +
> +umount /ssd
> +sync
> +
> +echo "Remove your installation media, and press ENTER"
> +
> +read enter
> +
> +echo "Rebooting..."
> +reboot -f
> diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
> index 737dae4..d02ed19 100644
> --- a/meta/recipes-core/initrdscripts/files/init-live.sh
> +++ b/meta/recipes-core/initrdscripts/files/init-live.sh
> @@ -110,11 +110,11 @@ case $label in
>   	    fi
>   	fi
>   	;;
> -    install)
> +    install|install-efi)
>   	if [ -f /media/$i/$ISOLINUX/$ROOT_IMAGE ] ; then
> -	    ./install.sh $i/$ISOLINUX $ROOT_IMAGE $video_mode $vga_mode
> +	    ./$label.sh $i/$ISOLINUX $ROOT_IMAGE $video_mode $vga_mode
>   	else
> -	    fatal "Could not find install script"
> +	    fatal "Could not find $label script"
>   	fi
>
>   	# If we're getting here, we failed...
>




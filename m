Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SQN5w-0005Dg-Am
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 20:19:08 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 04 May 2012 11:09:19 -0700
Received: by pbbro8 with SMTP id ro8so12758828pbb.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2012 11:09:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=zLLH50UAXjIAYfh3FcYmL1eTZg5jobw2ffrvNyhU8v8=;
	b=MrkxsYnXnVM4dsSxYUboB4bbf8XN2z4sc9u/yWQyBbxJAi+ETKs1jW9yudKB8DCC4n
	F8r3W2fU0HmAVl6eT/uozAhdjAmWIvnTnwTOhIEiewNnb2skXSAgI2Ksw78B8FKwWKAD
	wLvAELZpH/L/+ZlVeENuEyDvZgaAg5pdv43yAWqsS0JBBYqVl79XkpvBTH+gnPph+eSJ
	t69WmmbQlOk6JPhkkphw55BXb56r+c+oHIsSH6d9SlCp05iqcQbqkUDSWJ4w+xqhgs1Z
	Zl2HfNC96ZTJZ2QnQprV4Ti0rlP/YK3rBQRDD2ANpzvXGAOl+vwKMQdpA/wLBF5cwLlX
	/tKw==
Received: by 10.68.204.103 with SMTP id kx7mr20383469pbc.147.1336154959258;
	Fri, 04 May 2012 11:09:19 -0700 (PDT)
Received: from [192.168.1.12] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id vn10sm9274292pbc.43.2012.05.04.11.09.17
	(version=SSLv3 cipher=OTHER); Fri, 04 May 2012 11:09:17 -0700 (PDT)
Message-ID: <4FA41B53.3060509@intel.com>
Date: Fri, 04 May 2012 11:09:23 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <cover.1335931960.git.dvhart@linux.intel.com>
	<2f13a4e16b00b7d02e822efb9ce6170ec0582821.1335931960.git.dvhart@linux.intel.com>
In-Reply-To: <2f13a4e16b00b7d02e822efb9ce6170ec0582821.1335931960.git.dvhart@linux.intel.com>
X-Gm-Message-State: ALoCoQmELriCk7l/P3PDLwzHr3rOiyEK+vhPh9P7S+gy1fYK8GJMLY+PktCyWsQOK16nJT1/L5iD
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] [1.2.1] initrdscripts: Update install.sh to work with mmc devices
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
X-List-Received-Date: Fri, 04 May 2012 18:19:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/01/2012 09:14 PM, Darren Hart wrote:
> Fixes [YOCTO #2385]
>
> The installer only searches for hd[ab] sd[ab]. Some newer BSPs have mmcblk
> devices that should be used as the install target. These devices also have a
> partition prefix (mmcblk0p1 instead of mmcblk01). As they are detected
> asynchronously, it is necessary to add the rootwait kernel parameter to avoid
> a race condition trying to mount the root device.
>
> As BSPs like the FRI2 and the sys940x have mmc devices and will have a 1.2
> release, we should push this to 1.2.1. The changes are perfectly contained and
> easily verified.
>
> Test for an mmcblk device and add the p partition prefix if necessary. Add the
> rootwait kernel parameter when an mmcblk device is detected.  Replace the series
> of explicit umount commands with a single umount using a wildcard. This will
> find all the partitions and will not try to unmount non-existant devices. Avoid
> copy and paste errors by replacing /dev/${device}${pX} references with the
> previously assigned rootfs, bootfs, and swap variables.
>
> These changes have been tested on the FRI2 Sato image which installed to
> /dev/mmcblk0 as well as the N450 Sato image which installed to /dev/sda. Both
> were successful.
>
> Please apply to master as well as the 1.2.1 branch.

I modified this commit log to remove [1.2.1] from the title as well as 
your sentence at the end referring to 1.2.1. In the future, all that's 
necessary is to mention 1.2.1 in the cover letter, not the actual commits.

Merged to denzil-next, thanks!

http://git.openembedded.org/openembedded-core-contrib/log/?h=sgarman/denzil-next

Scott

>
> Signed-off-by: Darren Hart<dvhart@linux.intel.com>
> CC: Scott Garman<scott.a.garman@intel.com>
> ---
>   .../initrdscripts/files/init-install.sh            |   45 ++++++++++---------
>   .../initrdscripts/initramfs-live-install_1.0.bb    |    2 +-
>   2 files changed, 25 insertions(+), 22 deletions(-)
>
> diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
> index 90978dd..01ff829 100644
> --- a/meta/recipes-core/initrdscripts/files/init-install.sh
> +++ b/meta/recipes-core/initrdscripts/files/init-install.sh
> @@ -16,7 +16,7 @@ swap_ratio=5
>   found="no"
>
>   echo "Searching for a hard drive..."
> -for device in 'hda' 'hdb' 'sda' 'sdb'
> +for device in 'hda' 'hdb' 'sda' 'sdb' 'mmcblk0' 'mmcblk1'
>     do
>     if [ -e /sys/block/${device}/removable ]; then
>         if [ "$(cat /sys/block/${device}/removable)" = "0" ]; then
> @@ -62,13 +62,7 @@ rm -f /etc/udev/scripts/mount*
>   #
>   # Unmount anything the automounter had mounted
>   #
> -umount /dev/${device} 2>  /dev/null || /bin/true
> -umount /dev/${device}1 2>  /dev/null || /bin/true
> -umount /dev/${device}2 2>  /dev/null || /bin/true
> -umount /dev/${device}3 2>  /dev/null || /bin/true
> -umount /dev/${device}4 2>  /dev/null || /bin/true
> -umount /dev/${device}5 2>  /dev/null || /bin/true
> -umount /dev/${device}6 2>  /dev/null || /bin/true
> +umount /dev/${device}* 2>  /dev/null || /bin/true
>
>   if [ ! -b /dev/sda ] ; then
>       mknod /dev/sda b 8 0
> @@ -94,14 +88,23 @@ rootfs_start=$((boot_size + 1))
>   rootfs_end=$((rootfs_start+rootfs_size))
>   swap_start=$((rootfs_end+1))
>
> -bootfs=/dev/${device}1
> -rootfs=/dev/${device}2
> -swap=/dev/${device}3
> +# MMC devices are special in a couple of ways
> +# 1) they use a partition prefix character 'p'
> +# 2) they are detected asynchronously (need rootwait)
> +rootwait=""
> +part_prefix=""
> +if [ ! "${device#mmcblk}" = "${device}" ]; then
> +	part_prefix="p"
> +	rootwait="rootwait"
> +fi
> +bootfs=/dev/${device}${part_prefix}1
> +rootfs=/dev/${device}${part_prefix}2
> +swap=/dev/${device}${part_prefix}3
>
>   echo "*****************"
> -echo "Boot partition size:   $boot_size MB (/dev/${device}1)"
> -echo "Rootfs partition size: $rootfs_size MB (/dev/${device}2)"
> -echo "Swap partition size:   $swap_size MB (/dev/${device}3)"
> +echo "Boot partition size:   $boot_size MB ($bootfs)"
> +echo "Rootfs partition size: $rootfs_size MB ($rootfs)"
> +echo "Swap partition size:   $swap_size MB ($swap)"
>   echo "*****************"
>   echo "Deleting partition table on /dev/${device} ..."
>   dd if=/dev/zero of=/dev/${device} bs=512 count=2
> @@ -109,24 +112,24 @@ dd if=/dev/zero of=/dev/${device} bs=512 count=2
>   echo "Creating new partition table on /dev/${device} ..."
>   parted /dev/${device} mklabel msdos
>
> -echo "Creating boot partition on /dev/${device}1"
> +echo "Creating boot partition on $bootfs"
>   parted /dev/${device} mkpart primary 1 $boot_size
>
> -echo "Creating rootfs partition on /dev/${device}2"
> +echo "Creating rootfs partition on $rootfs"
>   parted /dev/${device} mkpart primary $rootfs_start $rootfs_end
>
> -echo "Creating swap partition on /dev/${device}3"
> +echo "Creating swap partition on $swap"
>   parted /dev/${device} mkpart primary $swap_start $disk_size
>
>   parted /dev/${device} print
>
> -echo "Formatting /dev/${device}1 to ext2..."
> +echo "Formatting $bootfs to ext2..."
>   mkfs.ext3 $bootfs
>
> -echo "Formatting /dev/${device}2 to ext3..."
> +echo "Formatting $rootfs to ext3..."
>   mkfs.ext3 $rootfs
>
> -echo "Formatting swap partition...(/dev/${device}3)"
> +echo "Formatting swap partition...($swap)"
>   mkswap $swap
>
>   mkdir /ssd
> @@ -150,7 +153,7 @@ fi
>
>   if [ -f /ssd/etc/grub.d/40_custom ] ; then
>       echo "Preparing custom grub2 menu..."
> -    sed -i "s@__ROOTFS__@$rootfs@g" /ssd/etc/grub.d/40_custom
> +    sed -i "s@__ROOTFS__@$rootfs $rootwait@g" /ssd/etc/grub.d/40_custom
>       sed -i "s/__VIDEO_MODE__/$3/g" /ssd/etc/grub.d/40_custom
>       sed -i "s/__VGA_MODE__/$4/g" /ssd/etc/grub.d/40_custom
>       mount $bootfs /bootmnt
> diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
> index 793a4b7..ac73ef8 100644
> --- a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
> +++ b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
> @@ -3,7 +3,7 @@ LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>   SRC_URI = "file://init-install.sh"
>
> -PR = "r6"
> +PR = "r7"
>
>   RDEPENDS_${PN} = "grub parted e2fsprogs-mke2fs"
>


-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center



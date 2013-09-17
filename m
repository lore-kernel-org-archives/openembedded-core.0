Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0CE5D6105E
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 22:32:43 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 17 Sep 2013 15:29:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,926,1371106800"; d="scan'208";a="404863561"
Received: from dvhart-mobl4.jf.intel.com (HELO [10.7.201.59]) ([10.7.201.59])
	by orsmga002.jf.intel.com with ESMTP; 17 Sep 2013 15:32:44 -0700
Message-ID: <1379457162.4438.69.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Jason Wessel <jason.wessel@windriver.com>
Date: Tue, 17 Sep 2013 15:32:42 -0700
In-Reply-To: <1379424738-16798-9-git-send-email-jason.wessel@windriver.com>
References: <1379424738-16798-1-git-send-email-jason.wessel@windriver.com>
	<1379424738-16798-9-git-send-email-jason.wessel@windriver.com>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [v3 PATCH 8/9] boot-directdisk.bbclass: Fix media generation problems with vmdk
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
X-List-Received-Date: Tue, 17 Sep 2013 22:32:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-09-17 at 08:32 -0500, Jason Wessel wrote:
> The various populate methods need to accept a path as an argument vs
> using hard expanded variables.  In the case of the boot-directdisk
> class it uses a different path for HDDDIR but it gets eclipsed by the
> the class definition at the point in time ${HDDDIR} gets expanded.
> 
> The logical fix is to pass the arguments to the functions as opposed
> to using globally expanded variables from the class definitions.
> 
> This patch changes 3 things:
> 1) syslinux_hddimg_populate takes an argument for the destination
> 2) syslinux_iso_populate takes an argument for the destination
> 3) populate is changed to boot_direct_populate because there
>    was a conflict with it overriding the populate in bootimg.bbclass
> 
> [YOCTO #3994]
> 
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>

We definitely want Martin and Saul to review.

Reviewed-by: Darren Hart <dvhart@linux.intel.com>

> ---
>  meta/classes/boot-directdisk.bbclass |   16 ++++++++--------
>  meta/classes/bootimg.bbclass         |    8 ++++----
>  meta/classes/grub-efi.bbclass        |   13 +++++++------
>  meta/classes/syslinux.bbclass        |   12 +++++++-----
>  4 files changed, 26 insertions(+), 23 deletions(-)
> 
> diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
> index 4b9d7bd..c58c6f0 100644
> --- a/meta/classes/boot-directdisk.bbclass
> +++ b/meta/classes/boot-directdisk.bbclass
> @@ -61,15 +61,15 @@ DISK_SIGNATURE ?= "${DISK_SIGNATURE_GENERATED}"
>  SYSLINUX_ROOT ?= "root=/dev/sda2"
>  SYSLINUX_TIMEOUT ?= "10"
>  
> -populate() {
> -	DEST=$1
> -	install -d ${DEST}
> +boot_direct_populate() {
> +	dest=$1
> +	install -d $dest
>  
>  	# Install bzImage, initrd, and rootfs.img in DEST for all loaders to use.
> -	install -m 0644 ${STAGING_KERNEL_DIR}/bzImage ${DEST}/vmlinuz
> +	install -m 0644 ${STAGING_KERNEL_DIR}/bzImage $dest/vmlinuz
>  
>  	if [ -n "${INITRD}" ] && [ -s "${INITRD}" ]; then
> -		install -m 0644 ${INITRD} ${DEST}/initrd
> +		install -m 0644 ${INITRD} $dest/initrd
>  	fi
>  
>  }
> @@ -79,13 +79,13 @@ build_boot_dd() {
>  	HDDIMG="${S}/hdd.image"
>  	IMAGE=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hdddirect
>  
> -	populate ${HDDDIR}
> +	boot_direct_populate $HDDDIR
>  
>  	if [ "${PCBIOS}" = "1" ]; then
> -		syslinux_hddimg_populate
> +		syslinux_hddimg_populate $HDDDIR
>  	fi
>  	if [ "${EFI}" = "1" ]; then
> -		grubefi_hddimg_populate
> +		grubefi_hddimg_populate $HDDDIR
>  	fi
>  
>  	BLOCKS=`du -bks $HDDDIR | cut -f 1`
> diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
> index fdd4ea9..ede6e21 100644
> --- a/meta/classes/bootimg.bbclass
> +++ b/meta/classes/bootimg.bbclass
> @@ -82,10 +82,10 @@ build_iso() {
>  	populate ${ISODIR}
>  
>  	if [ "${PCBIOS}" = "1" ]; then
> -		syslinux_iso_populate
> +		syslinux_iso_populate ${ISODIR}
>  	fi
>  	if [ "${EFI}" = "1" ]; then
> -		grubefi_iso_populate
> +		grubefi_iso_populate ${ISODIR}
>  		build_fat_img ${EFIIMGDIR} ${ISODIR}/efi.img
>  	fi
>  
> @@ -185,10 +185,10 @@ build_hddimg() {
>  		populate ${HDDDIR}
>  
>  		if [ "${PCBIOS}" = "1" ]; then
> -			syslinux_hddimg_populate
> +			syslinux_hddimg_populate ${HDDDIR}
>  		fi
>  		if [ "${EFI}" = "1" ]; then
> -			grubefi_hddimg_populate
> +			grubefi_hddimg_populate ${HDDDIR}
>  		fi
>  
>  		build_fat_img ${HDDDIR} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg
> diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
> index ffbcf4c..cd6651e 100644
> --- a/meta/classes/grub-efi.bbclass
> +++ b/meta/classes/grub-efi.bbclass
> @@ -42,19 +42,20 @@ grubefi_populate() {
>  }
>  
>  grubefi_iso_populate() {
> -	grubefi_populate ${ISODIR}
> +	iso_dir=$1
> +	grubefi_populate $iso_dir
>  	# Build a EFI directory to create efi.img
>  	mkdir -p ${EFIIMGDIR}/${EFIDIR}
> -	cp ${ISODIR}/${EFIDIR}/* ${EFIIMGDIR}${EFIDIR}
> -	cp ${ISODIR}/vmlinuz ${EFIIMGDIR}
> +	cp $iso_dir/${EFIDIR}/* ${EFIIMGDIR}${EFIDIR}
> +	cp $iso_dir/vmlinuz ${EFIIMGDIR}
>  	echo "EFI\\BOOT\\${GRUB_IMAGE}" > ${EFIIMGDIR}/startup.nsh
> -	if [ -f "${ISODIR}/initrd" ] ; then
> -		cp ${ISODIR}/initrd ${EFIIMGDIR}
> +	if [ -f "$iso_dir/initrd" ] ; then
> +		cp $iso_dir/initrd ${EFIIMGDIR}
>  	fi
>  }
>  
>  grubefi_hddimg_populate() {
> -	grubefi_populate ${HDDDIR}
> +	grubefi_populate $1
>  }
>  
>  python build_grub_cfg() {
> diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
> index 91b9731..944bd92 100644
> --- a/meta/classes/syslinux.bbclass
> +++ b/meta/classes/syslinux.bbclass
> @@ -53,14 +53,16 @@ syslinux_populate() {
>  }
>  
>  syslinux_iso_populate() {
> -	syslinux_populate ${ISODIR} ${ISOLINUXDIR} isolinux.cfg
> -	install -m 0644 ${STAGING_DATADIR}/syslinux/isolinux.bin ${ISODIR}${ISOLINUXDIR}
> -	install -m 0644 ${STAGING_DATADIR}/syslinux/ldlinux.c32 ${ISODIR}${ISOLINUXDIR}
> +	iso_dir=$1
> +	syslinux_populate $iso_dir ${ISOLINUXDIR} isolinux.cfg
> +	install -m 0644 ${STAGING_DATADIR}/syslinux/isolinux.bin $iso_dir${ISOLINUXDIR}
> +	install -m 0644 ${STAGING_DATADIR}/syslinux/ldlinux.c32 $iso_dir${ISOLINUXDIR}
>  }
>  
>  syslinux_hddimg_populate() {
> -	syslinux_populate ${HDDDIR} ${SYSLINUXDIR} syslinux.cfg
> -	install -m 0444 ${STAGING_DATADIR}/syslinux/ldlinux.sys ${HDDDIR}${SYSLINUXDIR}/ldlinux.sys
> +	hdd_dir=$1
> +	syslinux_populate $hdd_dir ${SYSLINUXDIR} syslinux.cfg
> +	install -m 0444 ${STAGING_DATADIR}/syslinux/ldlinux.sys $hdd_dir${SYSLINUXDIR}/ldlinux.sys
>  }
>  
>  syslinux_hddimg_install() {

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel




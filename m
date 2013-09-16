Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DD7C860648
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 17:30:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 16 Sep 2013 10:30:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,917,1371106800"; d="scan'208";a="404155137"
Received: from dvhart-mobl4.jf.intel.com (HELO [10.7.201.128]) ([10.7.201.128])
	by orsmga002.jf.intel.com with ESMTP; 16 Sep 2013 10:30:39 -0700
Message-ID: <1379352638.1285.154.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Jason Wessel <jason.wessel@windriver.com>
Date: Mon, 16 Sep 2013 10:30:38 -0700
In-Reply-To: <1379117343-29877-6-git-send-email-jason.wessel@windriver.com>
References: <1379117343-29877-1-git-send-email-jason.wessel@windriver.com>
	<1379117343-29877-6-git-send-email-jason.wessel@windriver.com>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [v2 PATCH 5/7] bootimage.bbclass, grub-efi.bbclass: Improve EFI & PCBIOS+EFI ISO support
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
X-List-Received-Date: Mon, 16 Sep 2013 17:30:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-09-13 at 19:09 -0500, Jason Wessel wrote:
> Using the latest mkisofs it is possible to generate 3 different types
> of ISO images, which can be used in various scenarios.
> 
> 1) PCBIOS Only ISO
>    - This option remains unchanged by this commit
>    - Uses syslinux menus
>    - Can be directly copied with dd to a USB device
>    - Can be burned to optical media
> 
> 2) EFI Only ISO
>    - Uses grub 2 menus
>    - Can be burned to optical media
>    - If you want to use this image on a USB device
>      extra steps must be taken in order to format the USB
>      device with fat32, and copy an EFI loader which will
>      in turn load the iso image
> 
> 3) PCBIOS / EFI ISO
>    - This is a hybrid image ISO that will work for case 1 or 2
>      as above with the same restrictions and boot menu types
>      depending on what type of firmware is installed on
>      the hardware or depending on if EFI or "Legacy Boot" is
>      enabled on some UEFI firmwares.
> 
> The syslinux.bbclass is now always required because that is where the
> isohybrid dependencies come from as well as the configuration data for
> the isohybrid.  The isohybrid is the secret sauce which allows the ISO
> to work as optical media or as a disk image on USB or a HDD/SSD.
> 
> [YOCTO #4100]
> 
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  meta/classes/bootimg.bbclass  |   33 +++++++++++++++++++++------------
>  meta/classes/grub-efi.bbclass |    8 ++++++++
>  2 files changed, 29 insertions(+), 12 deletions(-)
> 
> diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
> index bd211fb..756a287 100644
> --- a/meta/classes/bootimg.bbclass
> +++ b/meta/classes/bootimg.bbclass
> @@ -32,6 +32,7 @@ EXCLUDE_FROM_WORLD = "1"
>  
>  HDDDIR = "${S}/hddimg"
>  ISODIR = "${S}/iso"
> +EFIIMGDIR = "${S}/efi_img"
>  
>  BOOTIMG_VOLUME_ID   ?= "boot"
>  BOOTIMG_EXTRA_SPACE ?= "512"
> @@ -48,15 +49,10 @@ def pcbios(d):
>          pcbios = base_contains("MACHINE_FEATURES", "efi", "0", "1", d)
>      return pcbios
>  
> -def pcbios_class(d):
> -    if d.getVar("PCBIOS", True) == "1":
> -        return "syslinux"
> -    return ""
> -
>  PCBIOS = "${@pcbios(d)}"
> -PCBIOS_CLASS = "${@pcbios_class(d)}"
>  
> -inherit ${PCBIOS_CLASS}
> +# The syslinux is required for the isohybrid command and boot catalog
> +inherit syslinux
>  inherit ${EFI_CLASS}
>  
>  populate() {
> @@ -90,21 +86,34 @@ build_iso() {
>  	fi
>  	if [ "${EFI}" = "1" ]; then
>  		grubefi_iso_populate
> +		build_fat_img ${EFIIMGDIR} ${ISODIR}/efi.img
>  	fi
>  
> -	if [ "${PCBIOS}" = "1" ]; then
> +	# EFI only
> +	if [ "${PCBIOS}" != "1" ] && [ "${EFI}" = "1" ] ; then
> +		mkdir -p ${ISODIR}/${ISOLINUXDIR}
> +		install -m 0644 ${STAGING_DATADIR}/syslinux/isolinux.bin ${ISODIR}${ISOLINUXDIR}

If it's EFI-only, we copy isolinux.bin over? I was under the impression
isolinux.bin was a PCBIOS thing (specifically an executable that
wouldn't even work in an EFI environment). How is this used with an
EFI-only image? What am I missing?

> +	fi
> +
> +	if [ "${PCBIOS}" = "1" ] && [ "${EFI}" != "1" ] ; then
> +		# PCBIOS only media
>  		mkisofs -V ${BOOTIMG_VOLUME_ID} \
>  		        -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \
>  			-b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} -r \
>  			${MKISOFS_OPTIONS} ${ISODIR}
>  	else
> -		bbnote "EFI-only ISO images are untested, please provide feedback."
> -		mkisofs -V ${BOOTIMG_VOLUME_ID} \
> +		# EFI only OR EFI+PCIBIOS

Nit: s/PCIBIOS/PCBIOS/

...

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel




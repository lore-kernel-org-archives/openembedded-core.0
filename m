Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SjCoI-0000Sl-DH
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jun 2012 19:10:46 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 25 Jun 2012 09:59:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="157980417"
Received: from unknown (HELO envy.home) ([10.7.199.60])
	by orsmga001.jf.intel.com with ESMTP; 25 Jun 2012 09:59:54 -0700
Message-ID: <4FE898B7.3050606@linux.intel.com>
Date: Mon, 25 Jun 2012 09:58:31 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1340396533-5386-1-git-send-email-ray.danks@se-eng.com>
In-Reply-To: <1340396533-5386-1-git-send-email-ray.danks@se-eng.com>
X-Enigmail-Version: 1.4.2
Subject: Re: [PATCH 1/2] image_types: Add elf image type
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
X-List-Received-Date: Mon, 25 Jun 2012 17:10:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Raymond,

On 06/22/2012 01:22 PM, Raymond Danks wrote:
> On x86, an ELF image file may be stored as a coreboot payload.
> The image file is constructed, using the mkelfimage utility,
> from a kernel and an initrd.
> 

Is this usable solely as a coreboot payload?

The reason I ask is there have been requests to be able to build the
kernel+initramfs that the Linux make system supports. The coreboot wiki
suggests that this may be sufficient in lieu of the mkelfimage format.

http://www.coreboot.org/Mkelfimage

If we can satisfy both goals with one image type, I would prefer we do
that, at least for the core.

> Signed-off-by: Raymond Danks <ray.danks@se-eng.com>
> ---
> This was originally submitted to the openembedded project:
> http://patches.openembedded.org/patch/7689/
> 
> Resubmitting to oe-core for review prior to commit in openembedded-core.
> 
>  meta/classes/image_types.bbclass |   18 +++++++++++++++++-
>  1 files changed, 17 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 55f122e..bbca20c 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -7,6 +7,12 @@ def get_imagecmds(d):
>      ctypes = d.getVar('COMPRESSIONTYPES', True).split()
>      cimages = {}
>  
> +    if "elf" in alltypes:
> +        alltypes.remove("elf")
> +        if "cpio.gz" not in alltypes:
> +                alltypes.append("cpio.gz")
> +        alltypes.append("elf")
> +

What is the goal of this? Do you just need cpio.gz to appear before elf
in the list? If so, can that just be checked for at the time of adding
elf the first time?

>      # Filter out all the compressed images from types
>      for type in alltypes:
>          basetype = None
> @@ -173,6 +179,14 @@ IMAGE_CMD_cpio () {
>  	cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
>  }
>  
> +ELF_KERNEL ?= ${STAGING_DIR_HOST}/kernel/bzImage

There are various kernel image types. Is the elf format only valid with
bzImage?

> +ELF_APPEND ?= "ramdisk_size=32768 root=/dev/ram0 rw console=" 

We would need to parameterize ramdisk_size.

--
Darren

> +
> +IMAGE_CMD_elf () {
> +	test -f ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.elf && rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.elf 
> +	mkelfImage --kernel=${ELF_KERNEL} --initrd=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.elf --append='${ELF_APPEND}' ${EXTRA_IMAGECMD}
> +}
> +
>  UBI_VOLNAME ?= "${MACHINE}-rootfs"
>  
>  IMAGE_CMD_ubi () {
> @@ -199,6 +213,7 @@ EXTRA_IMAGECMD_ext2 ?= "-i 8192"
>  EXTRA_IMAGECMD_ext3 ?= "-i 8192"
>  EXTRA_IMAGECMD_ext4 ?= "-i 8192"
>  EXTRA_IMAGECMD_btrfs ?= ""
> +EXTRA_IMAGECMD_elf ?= ""
>  
>  IMAGE_DEPENDS = ""
>  IMAGE_DEPENDS_jffs2 = "mtd-utils-native"
> @@ -210,11 +225,12 @@ IMAGE_DEPENDS_ext4 = "genext2fs-native e2fsprogs-native"
>  IMAGE_DEPENDS_btrfs = "btrfs-tools-native"
>  IMAGE_DEPENDS_squashfs = "squashfs-tools-native"
>  IMAGE_DEPENDS_squashfs-lzma = "squashfs-lzma-tools-native"
> +IMAGE_DEPENDS_elf = "virtual/kernel mkelfimage-native"
>  IMAGE_DEPENDS_ubi = "mtd-utils-native"
>  IMAGE_DEPENDS_ubifs = "mtd-utils-native"
>  
>  # This variable is available to request which values are suitable for IMAGE_FSTYPES
> -IMAGE_TYPES = "jffs2 sum.jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz ext2.lzma btrfs live squashfs squashfs-lzma ubi tar tar.gz tar.bz2 tar.xz cpio cpio.gz cpio.xz cpio.lzma vmdk"
> +IMAGE_TYPES = "jffs2 sum.jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz ext2.lzma btrfs live squashfs squashfs-lzma ubi tar tar.gz tar.bz2 tar.xz cpio cpio.gz cpio.xz cpio.lzma vmdk elf"
>  
>  COMPRESSIONTYPES = "gz bz2 lzma xz"
>  COMPRESS_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}.rootfs.${type}"
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel





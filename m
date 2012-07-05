Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Smq8W-0003WW-1J
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 19:46:40 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Jul 2012 10:35:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="173806163"
Received: from unknown (HELO [10.255.12.176]) ([10.255.12.176])
	by fmsmga001.fm.intel.com with ESMTP; 05 Jul 2012 10:35:34 -0700
Message-ID: <4FF5D065.90401@linux.intel.com>
Date: Thu, 05 Jul 2012 10:35:33 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1341001154-10071-1-git-send-email-ray.danks@se-eng.com>
	<1341262285-30288-1-git-send-email-ray.danks@se-eng.com>
In-Reply-To: <1341262285-30288-1-git-send-email-ray.danks@se-eng.com>
Subject: Re: [PATCH 1/2 v4] image_types: Add elf image type
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
X-List-Received-Date: Thu, 05 Jul 2012 17:46:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/02/2012 01:51 PM, Raymond Danks wrote:
> On x86, an ELF image file may be stored as a coreboot payload.
> The image file is constructed, using the mkelfimage utility,
> from a kernel and an initrd.
>
> Signed-off-by: Raymond Danks <ray.danks@se-eng.com>
> Acked-by: Darren Hart <dvhart@linux.intel.com>
> ---
> This was originally submitted to the openembedded project:
> http://patches.openembedded.org/patch/7689/
>
> v3:
>   Include DEPLOY_DIR_IMAGE and KERNEL_IMAGETYPE for location of ELF_KERNEL
>
> v4:
>   Quotes must surround ELF_KERNEL defintion with newer versions of bitbake.
>
>   meta/classes/image_types.bbclass |   18 +++++++++++++++++-
>   1 files changed, 17 insertions(+), 1 deletions(-)
>
Merged both parts of this patch set (v4 from here and v3 2/2)

Thanks
	Sau!

> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 55f122e..2873273 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -7,6 +7,12 @@ def get_imagecmds(d):
>       ctypes = d.getVar('COMPRESSIONTYPES', True).split()
>       cimages = {}
>
> +    if "elf" in alltypes:
> +        alltypes.remove("elf")
> +        if "cpio.gz" not in alltypes:
> +                alltypes.append("cpio.gz")
> +        alltypes.append("elf")
> +
>       # Filter out all the compressed images from types
>       for type in alltypes:
>           basetype = None
> @@ -173,6 +179,14 @@ IMAGE_CMD_cpio () {
>   	cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
>   }
>
> +ELF_KERNEL ?= "${STAGING_DIR_HOST}/kernel/${KERNEL_IMAGETYPE}"
> +ELF_APPEND ?= "ramdisk_size=32768 root=/dev/ram0 rw console="
> +
> +IMAGE_CMD_elf () {
> +	test -f ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.elf && rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.elf
> +	mkelfImage --kernel=${ELF_KERNEL} --initrd=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.elf --append='${ELF_APPEND}' ${EXTRA_IMAGECMD}
> +}
> +
>   UBI_VOLNAME ?= "${MACHINE}-rootfs"
>
>   IMAGE_CMD_ubi () {
> @@ -199,6 +213,7 @@ EXTRA_IMAGECMD_ext2 ?= "-i 8192"
>   EXTRA_IMAGECMD_ext3 ?= "-i 8192"
>   EXTRA_IMAGECMD_ext4 ?= "-i 8192"
>   EXTRA_IMAGECMD_btrfs ?= ""
> +EXTRA_IMAGECMD_elf ?= ""
>
>   IMAGE_DEPENDS = ""
>   IMAGE_DEPENDS_jffs2 = "mtd-utils-native"
> @@ -210,11 +225,12 @@ IMAGE_DEPENDS_ext4 = "genext2fs-native e2fsprogs-native"
>   IMAGE_DEPENDS_btrfs = "btrfs-tools-native"
>   IMAGE_DEPENDS_squashfs = "squashfs-tools-native"
>   IMAGE_DEPENDS_squashfs-lzma = "squashfs-lzma-tools-native"
> +IMAGE_DEPENDS_elf = "virtual/kernel mkelfimage-native"
>   IMAGE_DEPENDS_ubi = "mtd-utils-native"
>   IMAGE_DEPENDS_ubifs = "mtd-utils-native"
>
>   # This variable is available to request which values are suitable for IMAGE_FSTYPES
> -IMAGE_TYPES = "jffs2 sum.jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz ext2.lzma btrfs live squashfs squashfs-lzma ubi tar tar.gz tar.bz2 tar.xz cpio cpio.gz cpio.xz cpio.lzma vmdk"
> +IMAGE_TYPES = "jffs2 sum.jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz ext2.lzma btrfs live squashfs squashfs-lzma ubi tar tar.gz tar.bz2 tar.xz cpio cpio.gz cpio.xz cpio.lzma vmdk elf"
>
>   COMPRESSIONTYPES = "gz bz2 lzma xz"
>   COMPRESS_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}.rootfs.${type}"
>




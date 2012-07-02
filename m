Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SlYKM-0002Ee-R8
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 06:33:35 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 01 Jul 2012 21:22:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="172359732"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by fmsmga001.fm.intel.com with ESMTP; 01 Jul 2012 21:22:32 -0700
Message-ID: <4FF12208.3000702@linux.intel.com>
Date: Sun, 01 Jul 2012 21:22:32 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1340984497-32423-2-git-send-email-ray.danks@se-eng.com>
	<1341001154-10071-1-git-send-email-ray.danks@se-eng.com>
In-Reply-To: <1341001154-10071-1-git-send-email-ray.danks@se-eng.com>
Subject: Re: [PATCH 1/2 v3] image_types: Add elf image type
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
X-List-Received-Date: Mon, 02 Jul 2012 04:33:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/29/2012 01:19 PM, Raymond Danks wrote:
> On x86, an ELF image file may be stored as a coreboot payload.
> The image file is constructed, using the mkelfimage utility,
> from a kernel and an initrd.
>
> Signed-off-by: Raymond Danks<ray.danks@se-eng.com>
> ---
> This was originally submitted to the openembedded project:
> http://patches.openembedded.org/patch/7689/
>
> v3:
>   Include DEPLOY_DIR_IMAGE and KERNEL_IMAGETYPE for location of ELF_KERNEL
>
>   meta/classes/image_types.bbclass |   18 +++++++++++++++++-
>   1 files changed, 17 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 55f122e..64fa14a 100644
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
>   	cd ${IMAGE_ROOTFS}&&  (find . | cpio -o -H newc>${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
>   }
>
> +ELF_KERNEL ?= ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}

I guess this was not tested very well, as this failed right out of the gate.

Please let me know what kind of testing you have done.

Thanks
	Sau!
> +ELF_APPEND ?= "ramdisk_size=32768 root=/dev/ram0 rw console="
> +
> +IMAGE_CMD_elf () {
> +	test -f ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.elf&&  rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.elf
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



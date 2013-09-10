Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 00A866BFBE
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 21:38:13 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 10 Sep 2013 14:35:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,880,1371106800"; d="scan'208";a="376265362"
Received: from unknown (HELO [10.255.14.204]) ([10.255.14.204])
	by orsmga001.jf.intel.com with ESMTP; 10 Sep 2013 14:37:59 -0700
Message-ID: <522F9137.5090101@linux.intel.com>
Date: Tue, 10 Sep 2013 14:37:59 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Valentin Popa <valentin.popa@intel.com>
References: <1378398301-15303-1-git-send-email-valentin.popa@intel.com>
In-Reply-To: <1378398301-15303-1-git-send-email-valentin.popa@intel.com>
Cc: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH_V4] image types: split live into iso and hddimg
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
X-List-Received-Date: Tue, 10 Sep 2013 21:38:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/05/2013 09:25 AM, Valentin Popa wrote:
> Changes to split live into iso and hddimg without
> adding a new image type class.
>
> [YOCTO #3197]
> ---
>   meta/classes/image.bbclass              | 11 ++++++++++-
>   meta/classes/image_types.bbclass        | 11 +++++++----
>   meta/conf/machine/include/ia32-base.inc |  2 +-
>   3 files changed, 18 insertions(+), 6 deletions(-)
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index ea59c36..3f76d80 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -87,7 +87,16 @@ do_rootfs[depends] += "makedevs-native:do_populate_sysroot virtual/fakeroot-nati
>   do_rootfs[depends] += "virtual/update-alternatives-native:do_populate_sysroot update-rc.d-native:do_populate_sysroot"
>   do_rootfs[recrdeptask] += "do_packagedata"
>
> -IMAGE_TYPE_live = '${@base_contains("IMAGE_FSTYPES", "live", "live", "empty", d)}'
> +NOISO = '${@base_contains("IMAGE_FSTYPES", "iso", "0", "1", d)}'
> +NOHDD = '${@base_contains("IMAGE_FSTYPES", "hddimg", "0", "1", d)}'
> +
So these are really overriding any value that might have been set by a 
.conf file.

This can be seen if you set NOISO in a conf (like minnow.conf does), you 
can use bitbake -e to easily check this and verify the values.

So the above 2 lines should really be ?= for a conditional setting if 
unset and live image time is passed in.

I am not sure that this still correctly handles the live FSTYPE incase 
it's still in use by other BSPs

I think we might need something like the following to ensure compatibility:

-IMAGE_TYPE_live = '${@build_live(d)}'
+IMAGE_TYPE_temp = '${@build_live(d)}'
+IMAGE_TYPE_live = '${@base_contains("IMAGE_FSTYPES", "live", "live", 
"${IMAGE_TYPE_temp}"

Thanks for working on this patch.

Sau!


> +def build_live(d):
> +    if d.getVar('NOISO', True) == "0" or d.getVar('NOHDD', True) == "0":
> +        return "live"
> +    else:
> +        return "empty"
> +
> +IMAGE_TYPE_live = '${@build_live(d)}'
>   inherit image-${IMAGE_TYPE_live}
>   IMAGE_TYPE_vmdk = '${@base_contains("IMAGE_FSTYPES", "vmdk", "vmdk", "empty", d)}'
>   inherit image-${IMAGE_TYPE_vmdk}
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index c168ed5..6af6499 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -43,12 +43,15 @@ def get_imagecmds(d):
>           if "ext3" not in alltypes:
>               alltypes.append("ext3")
>           types.remove("vmdk")
> -    if "live" in types:
> +    if "iso" in types or "hddimg" in types:
>           if "ext3" not in types:
>               types.append("ext3")
>           if "ext3" not in alltypes:
>               alltypes.append("ext3")
> -        types.remove("live")
> +        if "iso" in types:
> +            types.remove("iso")
> +        if "hddimg" in types:
> +            types.remove("hddimg")
>
>       if d.getVar('IMAGE_LINK_NAME', True):
>           if d.getVar('RM_OLD_IMAGE', True) == "1":
> @@ -115,7 +118,7 @@ def imagetypes_getdepends(d):
>       deps = []
>       ctypes = d.getVar('COMPRESSIONTYPES', True).split()
>       for type in (d.getVar('IMAGE_FSTYPES', True) or "").split():
> -        if type == "vmdk" or type == "live":
> +        if type == "vmdk" or type == "iso" or type == "hddimg":
>               type = "ext3"
>           basetype = type
>           for ctype in ctypes:
> @@ -230,7 +233,7 @@ IMAGE_DEPENDS_ubi = "mtd-utils-native"
>   IMAGE_DEPENDS_ubifs = "mtd-utils-native"
>
>   # This variable is available to request which values are suitable for IMAGE_FSTYPES
> -IMAGE_TYPES = "jffs2 sum.jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz ext2.lzma btrfs live squashfs squashfs-xz ubi ubifs tar tar.gz tar.bz2 tar.xz cpio cpio.gz cpio.xz cpio.lzma vmdk elf"
> +IMAGE_TYPES = "jffs2 sum.jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz ext2.lzma btrfs squashfs squashfs-xz ubi ubifs tar tar.gz tar.bz2 tar.xz cpio cpio.gz cpio.xz cpio.lzma vmdk elf iso hddimg"
>
>   COMPRESSIONTYPES = "gz bz2 lzma xz"
>   COMPRESS_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}.rootfs.${type}"
> diff --git a/meta/conf/machine/include/ia32-base.inc b/meta/conf/machine/include/ia32-base.inc
> index cb542a5..35d9560 100644
> --- a/meta/conf/machine/include/ia32-base.inc
> +++ b/meta/conf/machine/include/ia32-base.inc
> @@ -10,7 +10,7 @@ MACHINE_FEATURES += "screen keyboard pci usbhost ext2 ext3 x86 \
>
>   MACHINE_EXTRA_RRECOMMENDS += "kernel-modules eee-acpi-scripts"
>
> -IMAGE_FSTYPES += "ext3 cpio.gz live"
> +IMAGE_FSTYPES += "ext3 cpio.gz iso hddimg"
>
>   KERNEL_IMAGETYPE ?= "bzImage"
>
>


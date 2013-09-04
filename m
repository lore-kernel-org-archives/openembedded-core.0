Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 5753F6BD85
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2013 13:10:21 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r84DNG3T000426; Wed, 4 Sep 2013 14:23:16 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id cMIT9FjvvHRg; Wed,  4 Sep 2013 14:23:16 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r84DNCap000410
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 4 Sep 2013 14:23:13 +0100
Message-ID: <1378300202.1059.242.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Valentin Popa <valentin.popa@intel.com>
Date: Wed, 04 Sep 2013 14:10:02 +0100
In-Reply-To: <1378284202-2781-1-git-send-email-valentin.popa@intel.com>
References: <1378284202-2781-1-git-send-email-valentin.popa@intel.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] HOB: split live into iso and hddimg
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
X-List-Received-Date: Wed, 04 Sep 2013 13:10:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-09-04 at 11:43 +0300, Valentin Popa wrote:
> changes to split live into iso and hddimg without
> adding a new image type class.
> 
> [YOCTO #3197]
> ---
>  meta/classes/image.bbclass       | 12 +++++++++++-
>  meta/classes/image_types.bbclass | 14 ++++++++++----
>  2 files changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index ea59c36..ef99ecc 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -87,11 +87,21 @@ do_rootfs[depends] += "makedevs-native:do_populate_sysroot virtual/fakeroot-nati
>  do_rootfs[depends] += "virtual/update-alternatives-native:do_populate_sysroot update-rc.d-native:do_populate_sysroot"
>  do_rootfs[recrdeptask] += "do_packagedata"
>  
> -IMAGE_TYPE_live = '${@base_contains("IMAGE_FSTYPES", "live", "live", "empty", d)}'
> +NOISO = '${@base_contains("IMAGE_FSTYPES", "iso", "0", "1", d)}'
> +NOHDD = '${@base_contains("IMAGE_FSTYPES", "hddimg", "0", "1", d)}'
> +
> +def build_live(d):
> +    if d.getVar('NOISO', True) == "0" or d.getVar('NOHDD', True) == "0":
> +        return "live"
> +    else:
> +        return "empty"

Can't we simplify this?

def build_live(d):
    if base_contains("IMAGE_FSTYPES", "iso", False, True, d):
        return "live"
    elif base_contains("IMAGE_FSTYPES", "hddimg", False, True, d):
        return "live"
    else:
        return "empty"




> +IMAGE_TYPE_live = '${@build_live(d)}'
>  inherit image-${IMAGE_TYPE_live}
>  IMAGE_TYPE_vmdk = '${@base_contains("IMAGE_FSTYPES", "vmdk", "vmdk", "empty", d)}'
>  inherit image-${IMAGE_TYPE_vmdk}
>  
> +
>  python () {

Random whitespace?

>      deps = " " + imagetypes_getdepends(d)
>      d.appendVarFlag('do_rootfs', 'depends', deps)
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index c168ed5..4eb4157 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -43,12 +43,18 @@ def get_imagecmds(d):
>          if "ext3" not in alltypes:
>              alltypes.append("ext3")
>          types.remove("vmdk")
> -    if "live" in types:
> +    if "iso" in types:
>          if "ext3" not in types:
>              types.append("ext3")
>          if "ext3" not in alltypes:
>              alltypes.append("ext3")
> -        types.remove("live")
> +        types.remove("iso")
> +    if "hddimg" in types:

    if "hddimg" in types or "iso" in types:
?


> +        if "ext3" not in types:
> +            types.append("ext3")
> +        if "ext3" not in alltypes:
> +            alltypes.append("ext3")
> +        types.remove("hddimg")
>  
>      if d.getVar('IMAGE_LINK_NAME', True):
>          if d.getVar('RM_OLD_IMAGE', True) == "1":
> @@ -115,7 +121,7 @@ def imagetypes_getdepends(d):
>      deps = []
>      ctypes = d.getVar('COMPRESSIONTYPES', True).split()
>      for type in (d.getVar('IMAGE_FSTYPES', True) or "").split():
> -        if type == "vmdk" or type == "live":
> +        if type == "vmdk" or type == "iso" or type == "hddimg":
>              type = "ext3"
>          basetype = type
>          for ctype in ctypes:
> @@ -230,7 +236,7 @@ IMAGE_DEPENDS_ubi = "mtd-utils-native"
>  IMAGE_DEPENDS_ubifs = "mtd-utils-native"
>  
>  # This variable is available to request which values are suitable for IMAGE_FSTYPES
> -IMAGE_TYPES = "jffs2 sum.jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz ext2.lzma btrfs live squashfs squashfs-xz ubi ubifs tar tar.gz tar.bz2 tar.xz cpio cpio.gz cpio.xz cpio.lzma vmdk elf"
> +IMAGE_TYPES = "jffs2 sum.jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz ext2.lzma btrfs squashfs squashfs-xz ubi ubifs tar tar.gz tar.bz2 tar.xz cpio cpio.gz cpio.xz cpio.lzma vmdk elf iso hddimg"
>  
>  COMPRESSIONTYPES = "gz bz2 lzma xz"
>  COMPRESS_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}.rootfs.${type}"




Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id ABE97784A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 14:45:18 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v5GEfEBd024877
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 16 Jun 2017 15:41:15 +0100
Message-ID: <1497624074.24449.14.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ed Bartosh <ed.bartosh@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 15:41:14 +0100
In-Reply-To: <1497622532-8768-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1497603165.24449.6.camel@linuxfoundation.org>
	<1497622532-8768-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 16 Jun 2017 15:41:15 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH v4] image_types.bbclass: get rid of IMAGE_DEPENDS
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
X-List-Received-Date: Fri, 16 Jun 2017 14:45:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-06-16 at 17:15 +0300, Ed Bartosh wrote:
> The IMAGE_DEPENDS_<type> variables can be set to add dependencies for
> individual image types.  Those dependencies are added to the
> do_rootfs
> task, while they really should be added to the specific image type
> tasks.
> 
> These variables are not documented anywhere.
> 
> Replaced usage of IMAGE_DEPENDS_<type> with explicitly added
> dependencies to do_image_<type> tasks.
> 
> [YOCTO #11302]
> 
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  meta/classes/image_types.bbclass | 40 +++++++++++++++++++++---------
> ----------
>  1 file changed, 21 insertions(+), 19 deletions(-)
> 
> diff --git a/meta/classes/image_types.bbclass
> b/meta/classes/image_types.bbclass
> index 7749b00..ae6ac7a 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -29,11 +29,8 @@ def imagetypes_getdepends(d):
>      deps = set()
>      for typestring in fstypes:
>          basetype, resttypes = split_types(typestring)
> -        adddep(d.getVar('IMAGE_DEPENDS_%s' % basetype) , deps)
> -
>          for typedepends in (d.getVar("IMAGE_TYPEDEP_%s" % basetype)
> or "").split():
>              base, rest = split_types(typedepends)
> -            adddep(d.getVar('IMAGE_DEPENDS_%s' % base) , deps)
>              resttypes += rest
>  
>          for ctype in resttypes:
> @@ -101,7 +98,7 @@ IMAGE_CMD_squashfs-lzo = "mksquashfs
> ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAM
>  # you need special parameters (like --xattrs) which are only
> supported
>  # by GNU tar upstream >= 1.27, then override that default:
>  # IMAGE_CMD_TAR = "tar --xattrs --xattrs-include=*"
> -# IMAGE_DEPENDS_tar_append = " tar-replacement-native"
> +# do_image_tar[depends] += "tar-replacement-
> native:do_populate_sysroot"
>  # EXTRANATIVEPATH += "tar-native"
>  #
>  # The GNU documentation does not specify whether --xattrs-include is
> necessary.
> @@ -209,21 +206,26 @@ EXTRA_IMAGECMD_ext4 ?= "-i 4096"
>  EXTRA_IMAGECMD_btrfs ?= "-n 4096"
>  EXTRA_IMAGECMD_elf ?= ""
>  
> -IMAGE_DEPENDS = ""
> -IMAGE_DEPENDS_jffs2 = "mtd-utils-native"
> -IMAGE_DEPENDS_cramfs = "util-linux-native"
> -IMAGE_DEPENDS_ext2 = "e2fsprogs-native"
> -IMAGE_DEPENDS_ext3 = "e2fsprogs-native"
> -IMAGE_DEPENDS_ext4 = "e2fsprogs-native"
> -IMAGE_DEPENDS_btrfs = "btrfs-tools-native"
> -IMAGE_DEPENDS_squashfs = "squashfs-tools-native"
> -IMAGE_DEPENDS_squashfs-xz = "squashfs-tools-native"
> -IMAGE_DEPENDS_squashfs-lzo = "squashfs-tools-native"
> -IMAGE_DEPENDS_elf = "virtual/kernel mkelfimage-native"
> -IMAGE_DEPENDS_ubi = "mtd-utils-native"
> -IMAGE_DEPENDS_ubifs = "mtd-utils-native"
> -IMAGE_DEPENDS_multiubi = "mtd-utils-native"
> -IMAGE_DEPENDS_wic = "parted-native"
> +python () {
> +    vars = [key for key in d if key.startswith('IMAGE_DEPENDS')]
> +    if vars:
> +        bb.fatal('Deprecated variable(s) found: "%s". '
> +                 'Use do_image_<type>[depends] += "<recipe>:<task>"
> instead' % ', '.join(vars))
> +}

I appreciate this looks like a good idea but iterating the data store
is about the worst thing we can do for parsing performance. Please just
put the error message into the other function. I suspect if you time
parsing before and after this change you could see this on a profile
graph although since it only affects image recipes, it might be harder
to spot within the noise, not sure.

Cheers,

Richard


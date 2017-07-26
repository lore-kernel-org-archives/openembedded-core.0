Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 9C0E678282
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jul 2017 07:39:16 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 26 Jul 2017 00:39:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,414,1496127600"; d="scan'208";a="131365980"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 26 Jul 2017 00:39:16 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id AAA305808F5;
	Wed, 26 Jul 2017 00:39:15 -0700 (PDT)
Date: Wed, 26 Jul 2017 10:16:39 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Tom Rini <trini@konsulko.com>
Message-ID: <20170726071639.GA13291@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1500674794-23258-1-git-send-email-trini@konsulko.com>
MIME-Version: 1.0
In-Reply-To: <1500674794-23258-1-git-send-email-trini@konsulko.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] image.bbclass: Correct chaining compression support
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
X-List-Received-Date: Wed, 26 Jul 2017 07:39:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 21, 2017 at 06:06:33PM -0400, Tom Rini wrote:
> When chaining of compression/conversion types was added, we had a new
> way to handle doing things like "ext4.bz2.sha256sum" or
> "ext2.gz.u-boot".  However, because the U-Boot image class isn't
> included normally, it wasn't properly converted at the time.  After the
> support was added the "clean" argument that the .u-boot code uses no
> longer functions.  The fix for this inadvertently broke chaining
> compression/conversion.  First, correct the u-boot conversion code.
> 
> Fixes: 46bc438374de ("image.bbclass: do exact match for rootfs type")
> Cc: Zhenhua Luo <zhenhua.luo@nxp.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Patrick Ohly <patrick.ohly@intel.com>
> Signed-off-by: Tom Rini <trini@konsulko.com>

Acked-by: Ed Bartosh <ed.bartosh@linux.intel.com>

Any chance to have this functionality covered by oe-selftest?
That would help to ensure it will not be broken again.

> ---
> This change is fairly important and, imho, innocuous and should be
> populated to pyro/etc, once merged to master.  The next part of the
> series is clean-up and while with my U-Boot hat on, I would say should
> be pushed more widely, I am biased.
> ---
>  meta/classes/image.bbclass             |  2 +-
>  meta/classes/image_types_uboot.bbclass | 13 +++++--------
>  2 files changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index de535ce6fcff..bd6a5b7b810a 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -453,7 +453,7 @@ python () {
>          rm_tmp_images = set()
>          def gen_conversion_cmds(bt):
>              for ctype in ctypes:
> -                if bt[bt.find('.') + 1:] == ctype:
> +                if bt.endswith("." + ctype):
>                      type = bt[0:-len(ctype) - 1]
>                      if type.startswith("debugfs_"):
>                          type = type[8:]
> diff --git a/meta/classes/image_types_uboot.bbclass b/meta/classes/image_types_uboot.bbclass
> index 5dfa39287dab..8db436efb14b 100644
> --- a/meta/classes/image_types_uboot.bbclass
> +++ b/meta/classes/image_types_uboot.bbclass
> @@ -3,9 +3,6 @@ inherit image_types kernel-arch
>  oe_mkimage () {
>      mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk -C $2 -n ${IMAGE_NAME} \
>          -d ${IMGDEPLOYDIR}/$1 ${IMGDEPLOYDIR}/$1.u-boot
> -    if [ x$3 = x"clean" ]; then
> -        rm $1
> -    fi
>  }
>  
>  CONVERSIONTYPES += "gz.u-boot bz2.u-boot lz4.u-boot lzma.u-boot lzo.u-boot u-boot"
> @@ -14,19 +11,19 @@ CONVERSION_DEPENDS_u-boot = "u-boot-mkimage-native"
>  CONVERSION_CMD_u-boot      = "oe_mkimage ${IMAGE_NAME}.rootfs.${type} none"
>  
>  CONVERSION_DEPENDS_gz.u-boot = "u-boot-mkimage-native"
> -CONVERSION_CMD_gz.u-boot      = "${CONVERSION_CMD_gz}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.gz gzip clean"
> +CONVERSION_CMD_gz.u-boot      = "${CONVERSION_CMD_gz}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.gz gzip"
>  
>  CONVERSION_DEPENDS_bz2.u-boot = "u-boot-mkimage-native"
> -CONVERSION_CMD_bz2.u-boot      = "${CONVERSION_CMD_bz2}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.bz2 bzip2 clean"
> +CONVERSION_CMD_bz2.u-boot      = "${CONVERSION_CMD_bz2}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.bz2 bzip2"
>  
>  CONVERSION_DEPENDS_lz4.u-boot = "u-boot-mkimage-native"
> -CONVERSION_CMD_lz4.u-boot      = "${CONVERSION_CMD_lz4_legacy}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.lz4 lz4 clean"
> +CONVERSION_CMD_lz4.u-boot      = "${CONVERSION_CMD_lz4_legacy}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.lz4 lz4"
>  
>  CONVERSION_DEPENDS_lzma.u-boot = "u-boot-mkimage-native"
> -CONVERSION_CMD_lzma.u-boot      = "${CONVERSION_CMD_lzma}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.lzma lzma clean"
> +CONVERSION_CMD_lzma.u-boot      = "${CONVERSION_CMD_lzma}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.lzma lzma"
>  
>  CONVERSION_DEPENDS_lzo.u-boot = "u-boot-mkimage-native"
> -CONVERSION_CMD_lzo.u-boot      = "${CONVERSION_CMD_lzo}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.lzo lzo clean"
> +CONVERSION_CMD_lzo.u-boot      = "${CONVERSION_CMD_lzo}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.lzo lzo"
>  
>  IMAGE_TYPES += "ext2.u-boot ext2.gz.u-boot ext2.bz2.u-boot ext2.lzma.u-boot ext3.gz.u-boot ext4.gz.u-boot cpio.gz.u-boot"
>  
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--
Regards,
Ed


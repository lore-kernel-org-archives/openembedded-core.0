Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4E78A76DC0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 15:54:58 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Aug 2015 08:54:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,416,1437462000"; d="scan'208";a="755859240"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 26 Aug 2015 08:54:59 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.65])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id D07CF6A4005;
	Wed, 26 Aug 2015 08:54:08 -0700 (PDT)
Date: Wed, 26 Aug 2015 18:54:53 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
Message-ID: <20150826155453.GA17207@linux.intel.com>
References: <cover.1440492980.git.ed.bartosh@linux.intel.com>
	<5615adf8a3d194f11430dc722ae518698cb9b31c.1440492980.git.ed.bartosh@linux.intel.com>
	<365E1805BC95084CBE82381A0B86999401095CC0C4@EU-MBX-01.mgc.mentorg.com>
MIME-Version: 1.0
In-Reply-To: <365E1805BC95084CBE82381A0B86999401095CC0C4@EU-MBX-01.mgc.mentorg.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/17] image_types.bbclass: add wic image type
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ed.bartosh@linux.intel.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Aug 2015 15:55:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 25, 2015 at 05:46:08PM +0000, Ahsan, Noor wrote:
> Would it not be better approach if we don't hardcore the name and path and handle it using some variable?
> 
Can you elaborate a bit? I don't see any hardcoded names and paths in
this patch.

Regards,
Ed
> Noor
> 
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of Ed Bartosh
> Sent: Tuesday, August 25, 2015 2:04 PM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 12/17] image_types.bbclass: add wic image type
> 
> wic image type is used to produce partitioned images.
> 
> Image configuration should be stored in either <recipe>.<machine>.wks or <recipe>.wks file.
> .wks file should be put to the same location as image recipe and have the same name.
> 
> [YOCTO #7672]
> 
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  meta/classes/image_types.bbclass | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 8547574..cdd66ff 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -154,6 +154,16 @@ IMAGE_CMD_ubi = "multiubi_mkfs "${MKUBIFS_ARGS}" "${UBINIZE_ARGS}" "${UBI_VOLNAM
>  
>  IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs ${MKUBIFS_ARGS}"
>  
> +IMAGE_CMD_wic () {
> +	out=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}
> +	wks=${FILE_DIRNAME}/${IMAGE_BASENAME}.${MACHINE}.wks
> +	[ -e $wks ] || wks=${FILE_DIRNAME}/${IMAGE_BASENAME}.wks
> +	[ -e $wks ] || bbfatal "Kiskstart file $wks doesn't exist"
> +	BUILDDIR=${TOPDIR} wic create $wks --vars ${STAGING_DIR_TARGET}/imgdata/ -e ${IMAGE_BASENAME} -o $out/
> +	mv $out/build/${IMAGE_BASENAME}*.direct $out.rootfs.wic
> +	rm -rf $out/
> +}
> +
>  EXTRA_IMAGECMD = ""
>  
>  inherit siteinfo
> @@ -182,6 +192,7 @@ IMAGE_DEPENDS_elf = "virtual/kernel mkelfimage-native"
>  IMAGE_DEPENDS_ubi = "mtd-utils-native"
>  IMAGE_DEPENDS_ubifs = "mtd-utils-native"
>  IMAGE_DEPENDS_multiubi = "mtd-utils-native"
> +IMAGE_DEPENDS_wic = "parted-native"
>  
>  # This variable is available to request which values are suitable for IMAGE_FSTYPES  IMAGE_TYPES = " \ @@ -201,6 +212,7 @@ IMAGE_TYPES = " \
>      vdi \
>      qcow2 \
>      elf \
> +    wic wic.gz wic.bz2 wic.lzma \
>  "
>  
>  COMPRESSIONTYPES = "gz bz2 lzma xz lz4 sum"
> --
> 2.1.4
> 
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
--
Regards,
Ed


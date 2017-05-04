Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4707577D11
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 May 2017 17:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 86A3B3200084;
	Thu,  4 May 2017 19:31:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id CkJqBiOllNt8; Thu,  4 May 2017 19:31:12 +0200 (CEST)
Received: from t510.zcs.saftware.de (p57A61F97.dip0.t-ipconnect.de
	[87.166.31.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 930633200083;
	Thu,  4 May 2017 19:31:11 +0200 (CEST)
Date: Thu, 4 May 2017 19:31:10 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: Chunrong Guo <B40290@freescale.com>
Message-ID: <20170504193110.541fedce@t510.zcs.saftware.de>
In-Reply-To: <1493888920-6154-1-git-send-email-B40290@freescale.com>
References: <1493888920-6154-1-git-send-email-B40290@freescale.com>
MIME-Version: 1.0
Cc: chunrong.guo@nxp.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel-fitimage: fix ${KERNEL_DEVICETREE} includes subdirectory issue.
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
X-List-Received-Date: Thu, 04 May 2017 17:31:18 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 4 May 2017 17:08:40 +0800
Chunrong Guo <B40290@freescale.com> wrote:

> From: Chunrong Guo <chunrong.guo@nxp.com>
> 
>     * For example:
>       KERNEL_DEVICETREE ?= "freescale/fsl-ls1046a-rdb.dtb"
> 
>       ${DTB}= "freescale/fsl-ls1046a-rdb.dtb"
> 
>       but only the dtb name should be used.
> 
>     * Support "ext2.gz " filesystems
> 
>     * Support mutiple KERNEL_IMAGETYPE
>       For example:
>        KERNEL_IMAGETYPE = "Image"  or  KERNEL_IMAGETYPE = "zImage"
> 
> Signed-off-by: Chunrong Guo <chunrong.guo@nxp.com>
> ---
>  meta/classes/kernel-fitimage.bbclass | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index 2630b47..33b477f 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -10,7 +10,7 @@ python __anonymous () {
>          if d.getVar("UBOOT_ARCH") == "x86":
>              replacementtype = "bzImage"
>          else:
> -            replacementtype = "zImage"
> +            replacementtype = d.getVar("KERNEL_IMAGETYPE")

I'm not sure whether the KERNEL_IMAGETYPES variable needs to get considered, too.

>  
>  	# Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
>  	# to kernel.bbclass . We have to override it, since we pack zImage
> @@ -233,6 +233,7 @@ EOF
>  # $4 ... ramdisk ID
>  # $5 ... config ID
>  # $6 ... default flag
> +# $7 ... DTB image path 
>  fitimage_emit_section_config() {
>  
>  	conf_csum="sha1"
> @@ -346,13 +347,14 @@ fitimage_assemble() {
>  				bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
>  				DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
>  			fi
> +                        DTBNAME=`basename ${DTB}`
>  			DTB_PATH="arch/${ARCH}/boot/dts/${DTB}"
>  			if [ ! -e "${DTB_PATH}" ]; then
>  				DTB_PATH="arch/${ARCH}/boot/${DTB}"
>  			fi

How about replacing the lines above with DTB_PATH=`find arch/${ARCH}/boot -name "${DTB}"`
or a similar construct?

This would work with KERNEL_DEVICETREE ?= "fsl-ls1046a-rdb.dtb", which would
also match the make target IIRC.

Regards,
Andreas


>  
>  			DTBS="${DTBS} ${DTB}"
> -			fitimage_emit_section_dtb ${1} ${DTB} ${DTB_PATH}
> +			fitimage_emit_section_dtb ${1} ${DTBNAME} ${DTB_PATH}
>  		done
>  	fi
>  
> @@ -369,7 +371,7 @@ fitimage_assemble() {
>  	#
>  	if [ "x${ramdiskcount}" = "x1" ] ; then
>  		# Find and use the first initramfs image archive type we find
> -		for img in cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.gz cpio; do
> +		for img in cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.gz cpio ext2.gz; do
>  			initramfs_path="${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.${img}"
>  			echo "Using $initramfs_path"
>  			if [ -e "${initramfs_path}" ]; then
> @@ -395,7 +397,8 @@ fitimage_assemble() {
>  	if [ -n "${DTBS}" ]; then
>  		i=1
>  		for DTB in ${DTBS}; do
> -			fitimage_emit_section_config ${1} "${kernelcount}" "${DTB}" "${ramdiskcount}" "${setupcount}" "`expr ${i} = ${dtbcount}`"
> +                        DTBNAME=`basename ${DTB}`
> +			fitimage_emit_section_config ${1} "${kernelcount}" "${DTBNAME}" "${ramdiskcount}" "${setupcount}" "`expr ${i} = ${dtbcount}` "${DTB}""
>  			i=`expr ${i} + 1`
>  		done
>  	fi



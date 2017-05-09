Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5E0D571AC2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 09:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id F051332005BC;
	Tue,  9 May 2017 11:09:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 0w2-oWFcugpR; Tue,  9 May 2017 11:09:08 +0200 (CEST)
Received: from t510.zcs.saftware.de (p57A61F97.dip0.t-ipconnect.de
	[87.166.31.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 1C1BF3200151;
	Tue,  9 May 2017 11:09:07 +0200 (CEST)
Date: Tue, 9 May 2017 11:08:38 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: Chunrong Guo <B40290@freescale.com>
Message-ID: <20170509110838.75d49254@t510.zcs.saftware.de>
In-Reply-To: <1494315539-29178-1-git-send-email-B40290@freescale.com>
References: <1494315539-29178-1-git-send-email-B40290@freescale.com>
MIME-Version: 1.0
Cc: chunrong.guo@nxp.com, openembedded-core@lists.openembedded.org
Subject: Re: [[PATCH v2] kernel-fitimage: fix ${KERNEL_DEVICETREE} includes subdirectory issue.
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
X-List-Received-Date: Tue, 09 May 2017 09:09:11 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Dear Chunrong Guo,

you don't need to repost the same patch over and over again. Please consider
my reply to your first submission of v2.

http://lists.openembedded.org/pipermail/openembedded-core/2017-May/136345.html

Regards,
Andreas

P.S.: The subject contains a superflous bracket.



On Tue, 9 May 2017 15:38:59 +0800
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
>  meta/classes/kernel-fitimage.bbclass | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index 2630b47..63f03a5 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -10,7 +10,7 @@ python __anonymous () {
>          if d.getVar("UBOOT_ARCH") == "x86":
>              replacementtype = "bzImage"
>          else:
> -            replacementtype = "zImage"
> +            replacementtype = d.getVar("KERNEL_IMAGETYPE")
>  
>  	# Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
>  	# to kernel.bbclass . We have to override it, since we pack zImage
> @@ -342,15 +342,8 @@ fitimage_assemble() {
>  	if [ -n "${KERNEL_DEVICETREE}" ]; then
>  		dtbcount=1
>  		for DTB in ${KERNEL_DEVICETREE}; do
> -			if echo ${DTB} | grep -q '/dts/'; then
> -				bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
> -				DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
> -			fi
> -			DTB_PATH="arch/${ARCH}/boot/dts/${DTB}"
> -			if [ ! -e "${DTB_PATH}" ]; then
> -				DTB_PATH="arch/${ARCH}/boot/${DTB}"
> -			fi
> -
> +                        DTB=`basename ${DTB}`
> +			DTB_PATH=`find arch/${ARCH}/boot -name "${DTB}"` 
>  			DTBS="${DTBS} ${DTB}"
>  			fitimage_emit_section_dtb ${1} ${DTB} ${DTB_PATH}
>  		done
> @@ -369,7 +362,7 @@ fitimage_assemble() {
>  	#
>  	if [ "x${ramdiskcount}" = "x1" ] ; then
>  		# Find and use the first initramfs image archive type we find
> -		for img in cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.gz cpio; do
> +		for img in cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.gz cpio ext2.gz; do
>  			initramfs_path="${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.${img}"
>  			echo "Using $initramfs_path"
>  			if [ -e "${initramfs_path}" ]; then



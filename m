Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 4A6CF71B2F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 20:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 30C9F20AF1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 20:18:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id xHJZ4t43atZq
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 20:18:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 176762017C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 20:18:31 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9D74516231A; Thu,  5 Jan 2017 15:18:30 -0500 (EST)
Date: Thu, 5 Jan 2017 15:18:30 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170105201830.GP30576@denix.org>
References: <1482351617-31989-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1482351617-31989-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] linux-dtb: strip DTB extension properly in postinst/postrm
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
X-List-Received-Date: Thu, 05 Jan 2017 20:18:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Ping.

On Wed, Dec 21, 2016 at 03:20:17PM -0500, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> The use of awk -F "." in do_install/do_deploy to strip filename extension
> was deprecated long time ago in 72980d5bb465f0640ed451d1ebb9c5d2a210ad0c.
> 
> Make a similar change in postinst/postrm to properly use basename command.
> 
> Otherwise DTB files that contain dots in the name result in broken symlinks
> that point to non-existent truncated files.
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta/recipes-kernel/linux/linux-dtb.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
> index 8528d64..2f378a1 100644
> --- a/meta/recipes-kernel/linux/linux-dtb.inc
> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
> @@ -68,7 +68,7 @@ pkg_postinst_kernel-devicetree () {
>  		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
>  			symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
>  			DTB_EXT=${DTB##*.}
> -			DTB_BASE_NAME=`basename ${DTB} | awk -F "." '{print $1}'`
> +			DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
>  			DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
>  			update-alternatives --install /${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.${DTB_EXT} ${DTB_BASE_NAME}.${DTB_EXT} /boot/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT} ${KERNEL_PRIORITY} || true
>  		done
> @@ -81,7 +81,7 @@ pkg_postrm_kernel-devicetree () {
>  		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
>  			symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
>  			DTB_EXT=${DTB##*.}
> -			DTB_BASE_NAME=`basename ${DTB} | awk -F "." '{print $1}'`
> +			DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
>  			DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
>  			update-alternatives --remove ${DTB_BASE_NAME}.${DTB_EXT} /boot/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT} ${KERNEL_PRIORITY} || true
>  		done
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


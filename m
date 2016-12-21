Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 09493774A2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 19:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 27FB520B20;
	Wed, 21 Dec 2016 19:10:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Z54Ln_ID1cuI; Wed, 21 Dec 2016 19:10:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F38B3208B1;
	Wed, 21 Dec 2016 19:10:31 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E2D5F1621E3; Wed, 21 Dec 2016 14:10:30 -0500 (EST)
Date: Wed, 21 Dec 2016 14:10:30 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Christopher Larson <kergoth@gmail.com>
Message-ID: <20161221191030.GF30576@denix.org>
References: <cover.1447371049.git.chris_larson@mentor.com>
	<130d9a6c1f4ecea86748a44b73f51d8ddb2e63da.1447371049.git.chris_larson@mentor.com>
MIME-Version: 1.0
In-Reply-To: <130d9a6c1f4ecea86748a44b73f51d8ddb2e63da.1447371049.git.chris_larson@mentor.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] linux-dtb.inc: use absolute upd-alt paths
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
X-List-Received-Date: Wed, 21 Dec 2016 19:10:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 12, 2015 at 04:41:28PM -0700, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
> 
> This works around a limitation of the chkconfig update-alternatives, so it
> works with all our update-alternatives providers.

I know this change is old and has been in for over a year...

But the side-effect of it is that it breaks NFS-boot due to absolute DTB 
symlinks. We had to implement a local workaround to switch them back to 
relative links.

Is there another way to fix the original issue w/o absolute links?

-- 
Denys


> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  meta/recipes-kernel/linux/linux-dtb.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
> index ee3a5e1..5810b10 100644
> --- a/meta/recipes-kernel/linux/linux-dtb.inc
> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
> @@ -64,7 +64,7 @@ pkg_postinst_kernel-devicetree () {
>  	do
>  		DTB_BASE_NAME=`basename ${DTB_FILE} | awk -F "." '{print $1}'`
>  		DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> -		update-alternatives --install /${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.dtb ${DTB_BASE_NAME}.dtb devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
> +		update-alternatives --install /${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.dtb ${DTB_BASE_NAME}.dtb /boot/devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
>  	done
>  }
>  
> @@ -74,6 +74,6 @@ pkg_postrm_kernel-devicetree () {
>  	do
>  		DTB_BASE_NAME=`basename ${DTB_FILE} | awk -F "." '{print $1}'`
>  		DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> -		update-alternatives --remove ${DTB_BASE_NAME}.dtb devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
> +		update-alternatives --remove ${DTB_BASE_NAME}.dtb /boot/devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
>  	done
>  }
> -- 
> 2.2.1
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


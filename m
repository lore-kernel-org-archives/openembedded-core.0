Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id DB8FA77D81
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Jul 2017 01:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E6F6720AB6;
	Sat, 22 Jul 2017 01:02:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id dNmPGHp-N6E0; Sat, 22 Jul 2017 01:02:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CBE47200BB;
	Sat, 22 Jul 2017 01:02:43 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 940D116253D; Fri, 21 Jul 2017 21:02:43 -0400 (EDT)
Date: Fri, 21 Jul 2017 21:02:43 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Message-ID: <20170722010243.GT26405@denix.org>
References: <20170718005457.1179-1-gael.portay@savoirfairelinux.com>
MIME-Version: 1.0
In-Reply-To: <20170718005457.1179-1-gael.portay@savoirfairelinux.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel: fitimage: deploy real fit-image
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
X-List-Received-Date: Sat, 22 Jul 2017 01:02:44 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Jul 17, 2017 at 08:54:57PM -0400, Gaël PORTAY wrote:
> Currently, do_deploy installs a standard kernel image as an ITB. This
> image is linux.bin and it is prepared by uboot_prep_kimage.
> 
> The real kernel fit-image is build under arch/${ARCH}/boot/fitImage.
> 
> This patch deploys the real fit-image instead of the one prepared by
> u-boot and which is included in the ITB.
> 
> Note: this patch only concerns fit-images which are not signed by u-boot
> or which do not contains initramfs. Only a kernel image with a
> device-tree.
> 
> Signed-off-by: Gaël PORTAY <gael.portay@savoirfairelinux.com>

Reviewed-by: Denys Dmytriyenko <denys@ti.com>


> ---
> Hi all,
> 
> This patch is a modified version of the one I wrote on a meta-arago/morty
> build. Thus it is not tested, but it should work.
> 
> In the deploy image directory, I had
> 
> 	$ file -L fitImage 
> 	fitImage: Linux kernel ARM boot executable zImage (little-endian)
> 
> With the patch, I have
> 
> 	$ file -L fitImage 
> 	fitImage: data
> 
> Regards,
> Gael
> 
>  meta/classes/kernel-fitimage.bbclass | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index 2630b47316..a745e873c1 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -453,9 +453,9 @@ kernel_do_deploy_append() {
>  		its_base_name="fitImage-its-${PV}-${PR}-${MACHINE}-${DATETIME}"
>  		its_symlink_name=fitImage-its-${MACHINE}
>  		install -m 0644 fit-image.its ${DEPLOYDIR}/${its_base_name}.its
> -		linux_bin_base_name="fitImage-linux.bin-${PV}-${PR}-${MACHINE}-${DATETIME}"
> -		linux_bin_symlink_name=fitImage-linux.bin-${MACHINE}
> -		install -m 0644 linux.bin ${DEPLOYDIR}/${linux_bin_base_name}.bin
> +		itb_base_name="fitImage-linux.bin-${PV}-${PR}-${MACHINE}-${DATETIME}"
> +		itb_symlink_name=fitImage-linux.bin-${MACHINE}
> +		install -m 0644 arch/${ARCH}/boot/fitImage ${DEPLOYDIR}/${itb_base_name}.bin
>  
>  		if [ -n "${INITRAMFS_IMAGE}" ]; then
>  			echo "Copying fit-image-${INITRAMFS_IMAGE}.its source file..."
> @@ -469,7 +469,7 @@ kernel_do_deploy_append() {
>  
>  		cd ${DEPLOYDIR}
>  		ln -sf ${its_base_name}.its ${its_symlink_name}.its
> -		ln -sf ${linux_bin_base_name}.bin ${linux_bin_symlink_name}.bin
> +		ln -sf ${itb_base_name}.bin ${itb_symlink_name}.bin
>  
>  		if [ -n "${INITRAMFS_IMAGE}" ]; then
>  			ln -sf ${its_initramfs_base_name}.its ${its_initramfs_symlink_name}.its
> -- 
> 2.13.2
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


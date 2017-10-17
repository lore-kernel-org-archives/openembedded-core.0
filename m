Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 0588A78307
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 19:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1EF7B20A3B;
	Tue, 17 Oct 2017 19:09:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id cO-vy_hAFJW9; Tue, 17 Oct 2017 19:09:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EFBA42010C;
	Tue, 17 Oct 2017 19:09:15 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 874E11626FF; Tue, 17 Oct 2017 15:09:15 -0400 (EDT)
Date: Tue, 17 Oct 2017 15:09:15 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Thomas Perrot <thomas.perrot@tupi.fr>
Message-ID: <20171017190915.GI9221@denix.org>
References: <20171017165424.22887-1-thomas.perrot@tupi.fr>
MIME-Version: 1.0
In-Reply-To: <20171017165424.22887-1-thomas.perrot@tupi.fr>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta][pyro][PATCH] Fix some issues in the fitImage generation
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
X-List-Received-Date: Tue, 17 Oct 2017 19:09:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 17, 2017 at 06:54:24PM +0200, Thomas Perrot wrote:
> - Bad image type replacement for aarch64
> - Fix DTB path in fitimage.its

I've seen the above 2 fixes before, but they never made it.


> - Ignore fitImage type during the packaging of the initramfs

Can you please explain this one a bit more?

And in general, commit message should rather explain "why" and not "what"


> Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
> ---
>  meta/classes/kernel-fitimage.bbclass | 6 +++++-
>  meta/classes/kernel.bbclass          | 4 +++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index 2630b47316..abbc309b09 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -7,8 +7,11 @@ python __anonymous () {
>          depends = "%s u-boot-mkimage-native dtc-native" % depends
>          d.setVar("DEPENDS", depends)
>  
> -        if d.getVar("UBOOT_ARCH") == "x86":
> +        uarch = d.getVar("UBOOT_ARCH")
> +        if uarch == "x86":
>              replacementtype = "bzImage"
> +        elif uarch == "arm64":
> +            replacementtype = "Image"
>          else:
>              replacementtype = "zImage"
>  
> @@ -351,6 +354,7 @@ fitimage_assemble() {
>  				DTB_PATH="arch/${ARCH}/boot/${DTB}"
>  			fi
>  
> +			DTB=$(echo "${DTB}" | tr '/' '_')
>  			DTBS="${DTBS} ${DTB}"
>  			fitimage_emit_section_dtb ${1} ${DTB} ${DTB_PATH}
>  		done
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index ce2cab65ae..a8b0d0a061 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -219,7 +219,9 @@ do_bundle_initramfs () {
>  		# Backing up kernel image relies on its type(regular file or symbolic link)
>  		tmp_path=""
>  		for type in ${KERNEL_IMAGETYPES} ; do
> -			if [ -h ${KERNEL_OUTPUT_DIR}/$type ] ; then
> +			if [ "$type" == "fitImage" ] ; then
> +				continue
> +			elif [ -h ${KERNEL_OUTPUT_DIR}/$type ] ; then
>  				linkpath=`readlink -n ${KERNEL_OUTPUT_DIR}/$type`
>  				realpath=`readlink -fn ${KERNEL_OUTPUT_DIR}/$type`
>  				mv -f $realpath $realpath.bak
> -- 
> 2.13.6
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


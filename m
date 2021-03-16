Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.753.1615919094069773171
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Mar 2021 11:24:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4889A40C1C;
	Tue, 16 Mar 2021 18:24:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZSVv8fIl1lBE; Tue, 16 Mar 2021 18:24:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 26ED140A47;
	Tue, 16 Mar 2021 18:24:52 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BBB07174544; Tue, 16 Mar 2021 14:24:51 -0400 (EDT)
Date: Tue, 16 Mar 2021 14:24:51 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: scott.branden@broadcom.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] unwanted linux kernel image added to /boot directory
Message-ID: <20210316182451.GG18041@denix.org>
References: <166CA878538D6557.30053@lists.openembedded.org>
 <510db8eb-fcb2-ca15-3813-b3d52e51fce6@broadcom.com>
MIME-Version: 1.0
In-Reply-To: <510db8eb-fcb2-ca15-3813-b3d52e51fce6@broadcom.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 15, 2021 at 08:13:33PM -0700, Scott Branden via lists.openembedded.org wrote:
> It appears that inherit of the kernel_do_install routine is called which causes the linux
> image to be installed in /boot.  I added a quick and dirty hack to inhibit this behaviour.
> Could someone please comment on a proper solution:

Your change is incorrect - the code below installs the kernel image to be 
packaged into corresponding binary package (rpm/ipk/deb) and has nothing to 
do with installing it into your rootfs/initramfs. So, you are basically 
"neutering" kernel image package, making it empty for any rootfs that tries 
to use it.


> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index ddff2ddcd2..527f6ca85d 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -428,7 +428,9 @@ kernel_do_install() {
>  
>         for imageType in ${KERNEL_IMAGETYPES} ; do
>                 if [ $imageType != "fitImage" ] || [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ] ; then
> -                       install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType ${D}/${KERNEL_IMAGEDEST}/$imageType-${KERNEL_VERSION}
> +                       if [ "${INHIBIT_IMAGE_IN_BOOT}" != "1" ] ; then
> +                               install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType ${D}/${KERNEL_IMAGEDEST}/$imageType-${KERNEL_VERSION}
> +                       fi
>                 fi
>         done
> 
> 
> On 2021-03-15 4:39 p.m., Scott Branden via lists.openembedded.org wrote:
> > Hello,
> > 
> > There seems to be a problem when a kernel module is added to an initramfs 
> > image.
> > 
> > As soon as I add a recipe which installs an external kernel module into an 
> > initramfs image it automatically installs the linux kernel image in a 
> > /boot directory.
> > 
> > This is really bad as it increases the size of the initramfs image.
> > 
> > /boot/Image should not be installed in the image when an external kernel 
> > module is added to an image.
> > 
> > Can someone suggest a fix to this issue?
> > 
> > Thanks,
> >  Scott

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1028.1615919885092191935
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Mar 2021 11:38:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 78CB640C1C
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Mar 2021 18:38:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4L3q5VT51LPA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Mar 2021 18:38:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6AB8D40A47
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Mar 2021 18:38:04 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 393E1174544; Tue, 16 Mar 2021 14:38:04 -0400 (EDT)
Date: Tue, 16 Mar 2021 14:38:04 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] unwanted linux kernel image added to /boot directory
Message-ID: <20210316183804.GI18041@denix.org>
References: <a8c3bbca-1b5c-5353-9a0a-c7ecebc2fc32@broadcom.com>
 <20210315235732.GS4892@denix.org>
 <45e3e633-c15b-9010-a085-e34f6d7d0d1e@broadcom.com>
 <20210316183628.GH18041@denix.org>
MIME-Version: 1.0
In-Reply-To: <20210316183628.GH18041@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 16, 2021 at 02:36:28PM -0400, Denys Dmytriyenko wrote:
> This went off the list - hope you don't mind to put it back...

And, I ended up sending it to the wrong list... Sorry.


> On Tue, Mar 16, 2021 at 10:58:22AM -0700, Scott Branden wrote:
> > Hi Denys,
> > 
> > Thanks for the excellent suggestions - they work.
> > But, these seem really obscure.  I think the kernel.bbclass shouldn't automatically
> > be installing /boot/linux to begin with.  It could be done based on an image feature
> > selection?
> 
> kernel.bbclass does not populate the rootfs, it populates the corresponding 
> package. Any rootfs/initramfs is then built by installing necessary packages 
> into it. Whether to install a package or not is determined by IMAGE_INSTALL 
> and dependencies between the packages.
> 
> 
> > In addition, there seems to be an additional logic error in the present image
> > creation.  If I do not install an external kernel module in the image then /boot/linux
> > is not installed either.  Simply adding an external kernel module to an image shouldn't
> > pull in /boot/linux into the image?
> 
> It is not an error, but a well-defined behavior. In the link below there's a 
> comment about the default dependencies and how to alter them.
> 
> Basically, every kernel-module-* RDEPENDS on kernel-base, which normally 
> RDEPENDS on kernel-image. So, when you insall a module into your rootfs, it 
> follows the dependency chain properly. Hence all the suggestions you received 
> to simply disconnect kernel-image from kernel-base.
> 
> That normally works for most cases, unless you need a mixed behavior that I 
> mentioned. Hence, ROOTFS_POSTPROCESS_COMMAND trick.
> 
> 
> > On 2021-03-15 4:57 p.m., Denys Dmytriyenko wrote:
> > > On Mon, Mar 15, 2021 at 04:39:56PM -0700, Scott Branden via lists.openembedded.org wrote:
> > >> Hello,
> > >>
> > >> There seems to be a problem when a kernel module is added to an initramfs 
> > >> image.
> > >>
> > >> As soon as I add a recipe which installs an external kernel module into an 
> > >> initramfs image it automatically installs the linux kernel image in a /boot 
> > >> directory.
> > >>
> > >> This is really bad as it increases the size of the initramfs image.
> > >>
> > >> /boot/Image should not be installed in the image when an external kernel 
> > >> module is added to an image.
> > >>
> > >> Can someone suggest a fix to this issue?
> > > 
> > > There is an ages-old control knob for that, read here:
> > > https://git.openembedded.org/openembedded-core/tree/meta/classes/kernel.bbclass#n623
> > > 
> > > In your machine or distro config, you can set this as:
> > > RDEPENDS_${KERNEL_PACKAGE_NAME}-base = ""
> > > 
> > > But that will affect all your images for a given machine. If you need to only 
> > > do it selectively for your initramfs image, but keep the standard behavior for 
> > > other images, you can do something like this in corresponding recipe:
> > > 
> > > ROOTFS_POSTPROCESS_COMMAND += "empty_boot_dir; "
> > > empty_boot_dir () {
> > >         rm -rf ${IMAGE_ROOTFS}/boot/*
> > > }

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

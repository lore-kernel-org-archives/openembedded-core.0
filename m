Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.1584.1615852655296580249
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 16:57:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9943940BFF;
	Mon, 15 Mar 2021 23:57:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wrz_i-zT4KIh; Mon, 15 Mar 2021 23:57:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7BBB840BE6;
	Mon, 15 Mar 2021 23:57:33 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D27E6174543; Mon, 15 Mar 2021 19:57:32 -0400 (EDT)
Date: Mon, 15 Mar 2021 19:57:32 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: scott.branden@broadcom.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] unwanted linux kernel image added to /boot directory
Message-ID: <20210315235732.GS4892@denix.org>
References: <a8c3bbca-1b5c-5353-9a0a-c7ecebc2fc32@broadcom.com>
MIME-Version: 1.0
In-Reply-To: <a8c3bbca-1b5c-5353-9a0a-c7ecebc2fc32@broadcom.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 15, 2021 at 04:39:56PM -0700, Scott Branden via lists.openembedded.org wrote:
> Hello,
> 
> There seems to be a problem when a kernel module is added to an initramfs 
> image.
> 
> As soon as I add a recipe which installs an external kernel module into an 
> initramfs image it automatically installs the linux kernel image in a /boot 
> directory.
> 
> This is really bad as it increases the size of the initramfs image.
> 
> /boot/Image should not be installed in the image when an external kernel 
> module is added to an image.
> 
> Can someone suggest a fix to this issue?

There is an ages-old control knob for that, read here:
https://git.openembedded.org/openembedded-core/tree/meta/classes/kernel.bbclass#n623

In your machine or distro config, you can set this as:
RDEPENDS_${KERNEL_PACKAGE_NAME}-base = ""

But that will affect all your images for a given machine. If you need to only 
do it selectively for your initramfs image, but keep the standard behavior for 
other images, you can do something like this in corresponding recipe:

ROOTFS_POSTPROCESS_COMMAND += "empty_boot_dir; "
empty_boot_dir () {
        rm -rf ${IMAGE_ROOTFS}/boot/*
}

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

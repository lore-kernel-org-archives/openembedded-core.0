Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.18942.1585333012517289090
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2020 11:16:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D96C940A35;
	Fri, 27 Mar 2020 18:16:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6I9_kXb1KEhz; Fri, 27 Mar 2020 18:16:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 29CC0409F0;
	Fri, 27 Mar 2020 18:16:48 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3B4BA1718F4; Fri, 27 Mar 2020 14:16:48 -0400 (EDT)
Date: Fri, 27 Mar 2020 14:16:48 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Nandor Han <nandor.han@vaisala.com>
Cc: Zach Booth <zbooth.dev@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3] classes: Add a new bbclass that abstracts the generation of FIT blobs
Message-ID: <20200327181648.GK1578@denix.org>
References: <20200326214308.1042374-1-nandor.han@vaisala.com>
 <20200327082918.1213345-1-nandor.han@vaisala.com>
 <CAFhEjg1kxfhcxngtCpsZ3bxvGr63p3Sf26mwSbMtZ3eVKc=SYQ@mail.gmail.com>
 <b2ac5289-ac78-35a7-ed3c-6fd17435e644@vaisala.com>
MIME-Version: 1.0
In-Reply-To: <b2ac5289-ac78-35a7-ed3c-6fd17435e644@vaisala.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 27, 2020 at 07:33:24PM +0200, Nandor Han wrote:
> On 2020-03-27 17:11, Zach Booth wrote:
> >On Fri, Mar 27, 2020 at 3:29 AM Nandor Han <nandor.han@vaisala.com> wrote:
> >>
> >>FIT format is very versatile allowing various combination of booting
> >>sequences. In the same time different U-Boot boot stages can use FIT
> >>blobs to pack various binaries (e.g. SPL supports reading U-Boot from a
> >>FIT blob). Because of the allowed level of customization, the generation
> >>of a FIT blob using a fixed image tree source, becomes challenging and
> >>increase the level of complexity where different configurations and
> >>combinations are needed.
> >>
> >>This bbclass will know how to generate a FIT blob, leaving the mechanics
> >>of the process (dependencies, task order...) to be handled by the users
> >>of the bbclass. In the same time will allow to separate the knowledge of
> >>the FIT format leaving the user code cleaner and more readable.
> >>
> >>Signed-off-by: Nandor Han <nandor.han@vaisala.com>
> >
> >This class looks very useful, but I did have a question. How would you
> >account for creating nodes dynamically? One use case of this would be
> >adding a DT node for each reference in KERNEL_DEVICETREE. Would that
> >functionality be expected to go in the recipe including this class or
> >the class itself?
> >
> 
> Thanks Zack for feedback. Like I mentioned in one of Rickard's
> answer, I'm planning to update the `kernel-fitimage.bbclass` to use
> this class.
> 
> In my local repo I have already a class that does what you're saying.
> 
> e.g
> ```
> ...
> 24 python do_generate_fit_image() {
>  25     import os.path
>  26
>  27     device_trees = (d.getVar("KERNEL_DEVICETREE").split())
>  28     kernel_key_path =
> '{path}'.format(path=d.getVar("SECURITY_DIR_KEYS_RD") or "")
>  29     conf_signature = (d.getVar("CONF_NODE_CONF1") or "")
>  30     image_name = ""
>  31     mkimage_opts = ""
>  32
>  33     for dtb in device_trees:
>  34         d.setVarFlag("IMAGE_NODE_FDT", "data",
> '/incbin/("./arch/{arch}/boot/dts/{dtb}")'.format(
>  35          arch=d.getVar("ARCH"), dtb=dtb))
>  36         d.setVarFlag("IMAGE_NODE_FDT", "description", dtb)
>  37
>  38         if os.path.exists(kernel_key_path):
>  39             image_name =
> "kernel-{dtb_name}{suffix}".format(dtb_name=os.path.splitext(dtb)[0],
> suffix=".rdkeys")
>  40             mkimage_opts = d.getVar("FIT_IMAGE_MKIMAGE_OPTS_SIGNED")
>  41             d.setVar("FIT_IMAGE_UBOOT_MKIMAGE_OPTS", ("-k {key}
> -r {extra}".format(
>  42              key=kernel_key_path, extra=mkimage_opts)))
>  43             generate_fit_image(image_name, d)
>  44
>  45         if not conf_signature:
>  46             d.delVarFlag("CONF_NODE_CONF1", "signature")
>  47
>  48         mkimage_opts = d.getVar("FIT_IMAGE_MKIMAGE_OPTS_UNSIGNED")
>  49         d.setVar("FIT_IMAGE_UBOOT_MKIMAGE_OPTS",
> "{extra}".format(extra=mkimage_opts))
>  50         image_name =
> "kernel-{dtb_name}{suffix}".format(dtb_name=os.path.splitext(dtb)[0],
> suffix=".unsigned")
>  51         generate_fit_image(image_name, d)
>  52
>  53         if not conf_signature:
>  54             d.setVarFlag("CONF_NODE_CONF1", "signature",
> conf_signature)
>  55 }
> ...
> ```
> 
> The code above will generate a separate FIT blob for every device
> tree declared in KERNEL_DEVICETREE. However this functionality

So, no multiple device trees in a single FIT image? No multiple 
configurations, ramdisks, etc?


> overlaps with `kernel-fitimage` and my target is to keep this class
> as simple as possible and refactor `kernel-fitimage` to use the
> `fit_image` class. The code above will go in `kernel-fitimage`.
> 
> Later on I'm planning to add a different class that can be use to
> generate U-Boot FIT blobs, which can be used by SPL.
> 
> So this is only the first step :)
> 
> >Thanks,
> >Zach
> >
> 
> <snip>
> 
> Nandor

> 


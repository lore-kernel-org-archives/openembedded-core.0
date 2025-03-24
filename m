Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B04C36002
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 07:40:51 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.33760.1742802043469365196
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 00:40:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=dxFsgLYw;
 spf=pass (domain: linaro.org, ip: 209.85.167.45, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54acc0cd458so4432976e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 00:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742802041; x=1743406841; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HUk8pewqCW9Ltan9YkVkmZGgl35aHytK+YoEC5/xrf4=;
        b=dxFsgLYwH9MfsVCEDSoXnHXWrKifdp152xiGl5BYqLY/76Lgl4RLfPlv283eD4Ws6X
         qxgrJ7/tZNK994JNa+MD47mspARl7ky8h+ehKHj/R6MtA5HzHO2f7MkK2qHXoxlz54+m
         7vFEyqorBG3ecgJ4UdM9GJVjgaqYOJDuDg074KOA8L6f2bmdXcxOwWrB13dNleV423Pv
         Pp5gJhq2dCLnxZDKDQFUswMaKjc9oRcaqbJ34K+Ugg0bpoAFrvoYFiDnWKieJfEgbpD0
         w9WiYYV4Bi5mliah1D4AcYzHKwz/LJfu87m9o1jkWhuBGpiCdq5rFmXEt+q6/q8hIPqf
         M0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742802041; x=1743406841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HUk8pewqCW9Ltan9YkVkmZGgl35aHytK+YoEC5/xrf4=;
        b=BNMLsHC0buD37yhsRJlMyZgN5FKRWsl+qhr3UaYlZj2Xa9hJCS8zvvwLPJ1kXMtvB3
         EbJ0YJvmHnlXzZtHb7VMPFav3iOo0PuBplQ0uWRifUC3wwLlESR4vcTTHMHgpTNVCvyB
         eQrLHpvOEAbqHCCUFbhNc8wr+/H5OFy7ZfSquCts+T8eoHHtPdlOMmcuc9Kfd0SEO0C/
         E/xXnUKBlx48yt9RsNBNtsRKIk94qHPOoAakOSVYScJVHkUG/yD2dbytVo1m95eeeCZV
         nIBQ9Bng9lsFZTh2+1VMRTtzgugJ9rvAF1a8qrJCY0vzf9egwh9V4mDwMS46XbVQOgfJ
         IhJw==
X-Gm-Message-State: AOJu0YwFCoNoVYCRkWyhjf09NRAiqQMrLPN9zlK85t6pkvvBjdCzoBEX
	a3mt7PZ73ijxWBfDjd8fgxw6sbDLmwBUPFoHUW/EtNKoV3F9kGX7RVFdGQhPBiY=
X-Gm-Gg: ASbGnctPnezN7lQgVhMjQHBxOIKh3EUx+KKk8bBQ+EUPo7Ytns4l+VvwuDHDIqN/zVl
	EYibuVpGTGBZFaRmmxUaMjIJrZ+GP3e5Zwk4qfGncik99OS5U8eAKkFXaEFERCVfMHZ3acDeufV
	Nel+qn+Lr6dVSRYL6XM04FW2+rNMjJ1HGmga+2c3kLSdHHxpFSTtuu+Bd0OJhWGZUAqcRUSjlya
	4YvetY6gj7QETcxqBDNBlh7eB+oXl/0QVI6W7paEVd75OgraVPZ86JxExwfcE/HpQb60fAikZSI
	JElCPgL4BTUU4qvKPBZ3JovSur+meVCTn9W3/INoaHYlD77JIic+q7GASdhvAv2yNNfowz9l9eJ
	/dwAEugB7/ev+
X-Google-Smtp-Source: AGHT+IFYwufV2XJcZNAK+LueRZnUPVoLoNzyGfS90eaeUPM7I+/sZKZfCEjjJSx/5LNE/nNWpJkB4A==
X-Received: by 2002:a05:6512:6cc:b0:545:2544:6ae2 with SMTP id 2adb3069b0e04-54ad647cfe2mr4803191e87.16.1742802041360;
        Mon, 24 Mar 2025 00:40:41 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad64fbaf4sm1070539e87.137.2025.03.24.00.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 00:40:39 -0700 (PDT)
Date: Mon, 24 Mar 2025 09:40:36 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 03/11] kernel.bbclass: add
 kernel-initrd-modules meta package
Message-ID: <Z-EMdEo0l_nVVWVv@nuoska>
References: <20250321132517.670372-1-mikko.rapeli@linaro.org>
 <20250321132517.670372-4-mikko.rapeli@linaro.org>
 <Z91+5mpCocPjYM+F@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z91+5mpCocPjYM+F@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 07:40:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213512

Hi,

On Fri, Mar 21, 2025 at 10:59:50AM -0400, Bruce Ashfield wrote:
> I was going to reply to v1, but v2 came out before I got to it!
>
> In message: [OE-core] [PATCH v2 03/11] kernel.bbclass: add kernel-initrd-modules meta package
> on 21/03/2025 Mikko Rapeli via lists.openembedded.org wrote:
> 
> > At the moment linux-yocto kernels for various architectures
> > are not very modular and a lot of drivers are built into the kernel
> > even when they are not needed at runtime. These make the main kernel
> > binary big and slow to boot. This also impacts udev in userspace
> > which takes a long time processing events from all these built in drivers,
> > for example when udev runs in initrd.
> > 
> > Then constructing the initrd is very device and kernel configuration specific.
> > initrd image needs explicitly define which binary packages to install
> > to avoid pulling in complex dependencies. A full set of kernel modules
> > via kernel-modules meta package is too big for initrd and most of the
> > drivers are not needed for use cases like "just load modules to mount
> > main rootfs". Then the initrd configuration breaks if kernel driver
> > is built into the kernel since the binary package doesn't exist.
> > 
> > Introduce kernel-initrd-modules meta package to solve these problems.
> > The meta package adds dependencies to real kernel modules based on
> > the kernel module file paths so that it will include several
> > kernel subsystems and their drivers which are often needed to find
> > main rootfs from some block device. This works when drivers are built
> > as modules but does not break if drivers are built into the kernel.
> 
> The list of paths gives me the nagging feeling that there's
> a better way. With the paths, it is just something else to
> maintain and has to work against an undefined set of kernel and
> kernel versions (not that major directories in the kernel change,
> so I don't think it is a big issue).
> 
> There won't be a way to do this generically, but I'd prefer that
> this was driven from the kernel recipes down to the packaging,
> instead of the packaging (the classes) coming along after and
> trying to serve the needs of those undefined sets of recipes and
> configurations.
> 
> The simplest would be to have the kernel recipes provide that
> regex. That way the coupling of directories to the kernel
> version and provider is explicit. Sure, that means the regex
> is in recipes (and possibly repeated), but individual layers
> and kernel providers can figure out how to minimize that
> themselvs (.inc or whatever), so it is a solvable problem.
> 
> The other way that I was thinking was an annotation in the
> module meta-data that could do the same thing. i.e. it could
> tag a configuration option's purpose and then use that to
> generate the list of modules (versus the directories), but
> again, that would just go in the recipe versus the base classes
> and would allow different providers to have different ways
> of specifying what is for the initrd.
> 
> I honestly wouldn't provide a default in the bbclass as we
> just have no way to test it for all the different kernels
> and kernel providers in the ecosystem. Make the opt-in
> explicit by requiring it in the kernel recipe to start
> building the meta-package.

I can move the regexp to kernel recipe. That makes sense.

Tagging for custom kernel modules could be done, maybe
through another variable which lists other kernel
modules to include. But then this should not be specific
to kernel as there may be other extra packages that
may need to be added. Since the regex with paths creates
generally usable initrd which are obviously not optimised
for specific usecases or HW or machine/distro config, I
omitted those for now.

For the best result, users can change everything in the
core-image-initramfs-boot recipe or replace with their own
recipe.

> > The resulting initrd is also smaller since only a subset of drivers
> > are needed for "mount the rootfs" usecase. Tested on genericarm64
> > kernel and qemu and AMD KV260 HW.
> > 
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >  .../kernel-module-split.bbclass               | 46 +++++++++++++++++++
> >  meta/classes-recipe/kernel.bbclass            |  5 +-
> >  meta/classes-recipe/module.bbclass            | 37 +++++++++++++++
> >  3 files changed, 87 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recipe/kernel-module-split.bbclass
> > index 9487365eb7..06e8fbed6e 100644
> > --- a/meta/classes-recipe/kernel-module-split.bbclass
> > +++ b/meta/classes-recipe/kernel-module-split.bbclass
> > @@ -42,6 +42,40 @@ KERNEL_MODULE_PACKAGE_PREFIX ?= ""
> >  KERNEL_MODULE_PACKAGE_SUFFIX ?= "-${KERNEL_VERSION}"
> >  KERNEL_MODULE_PROVIDE_VIRTUAL ?= "1"
> >  
> > +# subset of kernel modules needed in initrd, to e.g. mount rootfs from block device
> > +KERNEL_INITRD_MODULES_META_PACKAGE ?= "${@ d.getVar("KERNEL_PACKAGE_NAME") or "kernel" }-initrd-modules"
> > +
> > +# match regex to path or file name. E.g. include all drivers with files in path /drivers/ata/
> > +KERNEL_INITRD_MODULES_REGEX ?= "(.*)(\
> > +/drivers/acpi/|\
> > +/drivers/ata/|\
> > +/drivers/block/|\
> > +/drivers/cdrom/|\
> > +/drivers/char/hw_random/|\
> > +/drivers/char/tpm/|\
> > +/drivers/char/|\
> > +/drivers/crypto/|\
> > +/drivers/dax/|\
> > +/drivers/firmware/arm_scmi/|\
> > +/drivers/gpu/drm/|\
> > +/drivers/md/|\
> > +/drivers/mmc/|\
> > +/drivers/mtd/|\
> > +/drivers/nvdimm/|\
> > +/drivers/nvme/|\
> > +/drivers/pci/|\
> > +/drivers/scsi/|\
> > +/drivers/tee/|\
> > +/drivers/tty/serial/|\
> > +/drivers/virtio/|\
> > +/drivers/watchdog/|\
> > +/kernel/arch/|\
> > +/kernel/block/|\
> > +/kernel/crypto/|\
> > +/kernel/fs/|\
> > +/kernel/lib/\
> > +)(.*)"
> > +
> 
> Is that the same regex in both files ? We probably should unify them or
> maintainence will be harder, which is why I'm suggesting that this
> should come from the recipes, not the bbclass itself.

ACK, movint to kernel recipe and reducing to single variable.
 
> >  python split_kernel_module_packages () {
> >      import re
> >  
> > @@ -183,6 +217,18 @@ python split_kernel_module_packages () {
> >      modules = do_split_packages(d, root='${nonarch_base_libdir}/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='%s-%s' % (kernel_package_name, kernel_version))
> >      if modules:
> >          d.appendVar('RDEPENDS:' + metapkg, ' '+' '.join(modules))
> > +
> > +    initrd_metapkg = d.getVar('KERNEL_INITRD_MODULES_META_PACKAGE')
> > +    initrd_module_regex = re.compile(d.getVar('KERNEL_INITRD_MODULES_REGEX'))
> > +    initrd_modules = []
> > +    for module in modules:
> > +        files = d.getVar('FILES:' + module)
> > +        m = re.match(initrd_module_regex, files)
> > +        if m:
> > +            initrd_modules.append(module)
> > +
> > +    if initrd_modules:
> > +        d.appendVar('RDEPENDS:' + initrd_metapkg, ' '+' '.join(initrd_modules))
> 
> I'd suggest that we could also have a flag to completely skip the
> processing. It isn't a particularly expensive set of operations, but
> we tend to not do processing for boot modes that won't be used.
> 
> If it was driven top-down from a kernel recipe like I mentioned
> above, just testing if the KERNEL_INITRD_MODULES_REGEX was defined
> might be a good flag for the job.

Thanks, will do this in v3.

Cheers,

-Mikko


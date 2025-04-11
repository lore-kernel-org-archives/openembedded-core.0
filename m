Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A178C36010
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 07:48:59 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.20173.1744357731503709807
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 00:48:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ELdQjXtA;
 spf=pass (domain: linaro.org, ip: 209.85.167.47, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-548409cd2a8so2168424e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 00:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744357730; x=1744962530; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rRr0is0h7GiNhaDOHCyt6a0omNyMJrEGn0hXT2pNkIs=;
        b=ELdQjXtASVRxpQL992GMIzyor4nUvRd01Xyurcs9YP+LCptIndeoQ/xtaPOR/TwAwF
         JkrvikNRa6cB0M41/+tVSuNaA9SltUmv4x5sQeY4NO8cH2HXk2LdpTNkYiNjneuCqXn7
         LJDh+7SaECCfMADTDTaF3rH/xebYUYQ2dhw8c/+jfIdyzFwsa0NYtVKSKMum3W7oOSD4
         Y9j65GT3OBCtUkRny3yX5O+svzEUXr4Kr3jdomUdtmAdh9b8lUSfedFUVfFoD6WH/oxn
         clm2py5EKMh1MhugUSDe75X9AoEwH2NPwdg35EW5mtYhsHju0CyA0VrFggDliZ+NH9k+
         LWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744357730; x=1744962530;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rRr0is0h7GiNhaDOHCyt6a0omNyMJrEGn0hXT2pNkIs=;
        b=mBTeQZgaguXO+ZbmXfSdI4W4TM19fJFkyCTseDD66vryEVY+r2HVTVHRJONiXoWJe/
         luI1A13fu6ZgMHnknLksYocA3rY9wVBXDHk+PkcqZSbMUJDZUaKcywzZ4lGa5NQHzRDG
         H7PZhScAdYpyEkLGMHi9giAiMrkPqkQKwjtamBKWQVpzCgbnirNchNETlz4kYyNaZwWY
         nQS69fey9kvSF+/7J40YkDX8CWZ8svgb9dddZdLUo1mj5n3EKtHheX1w1Wgi+SidHs9H
         qLdOO7b2LrvR1tn+yL9KfO1h/5DCjEQ9R0TDhchs8AVS1OQKlSFgJfgxpS3+upf6Os4p
         6Ntg==
X-Forwarded-Encrypted: i=1; AJvYcCU18ild4+75KYWYaD71OldpMadhtGFP4wLb9tLHB5oB50v6c9J9kVVoL2NsfVUap4FC+cnMtqGbUiDi6hAQ17R2Dw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyiwFDYFqZzNzALSFzXeTOs4xnLD31tMwlBuM0g102UmP5AytLZ
	D+wG+FcaNVkOpQrT3LaoTTWVLt2exRP038DkaTkcMkg5ts8d6OhxIfn4fXcj8dQ=
X-Gm-Gg: ASbGncu2hhvTPH9KnbWhv9dbNNI73oAFvIxa+EWw7TTzaxdN66ydGVTWbkbY21oDVml
	UwOmiIMuxVpLuAg7v+gomkJ5x7yz733XXGHf3mo0wwPOSWGwkFc/OKkmTnrypuqEa600lG5vz2t
	G9M0eeDDHeRejrRlHLyOiB+Sn5FN86+0Cje4Z2g3dqxg72CtUUz1k2og265clwzAOwaYoQBlYUe
	nXFEk8NtNPLRRjFhn9/CHpJ7srNx0fvD0yeFF62Xj65DEvMR6v+4Q5K8VIDdMU5IK0o+nohfVqJ
	Gq+6bECPnbaqBVtVg8CmxPlN9CXtY64rleVE6mxjbLIegNhUSiqyQa8QJx7Ob7pnrJceuue2sg=
	=
X-Google-Smtp-Source: AGHT+IGiiacE6fRMxjwcTv6+cowKzTFJmz60P2Gnk3ziknGixr+iOSfPsKH5TcykK3inVb1EtQx7/Q==
X-Received: by 2002:a05:6512:118f:b0:545:c7d:1784 with SMTP id 2adb3069b0e04-54d452cf59cmr522624e87.43.1744357729493;
        Fri, 11 Apr 2025 00:48:49 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d5215c4sm359310e87.258.2025.04.11.00.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 00:48:49 -0700 (PDT)
Date: Fri, 11 Apr 2025 10:48:47 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3 03/11] kernel.bbclass: add
 kernel-initrd-modules meta package
Message-ID: <Z_jJX05RuRTcFf4P@nuoska>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-4-mikko.rapeli@linaro.org>
 <1c55e7536de5f36fa37076ad04ff35588b6b5f1e.camel@linuxfoundation.org>
 <Z_fBAsbV-hY-x_SC@nuoska>
 <CADkTA4MamOxjfPE8uHhFDmZ12OhxpJ9dfhxbsxKGZxwQ4_cCkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADkTA4MamOxjfPE8uHhFDmZ12OhxpJ9dfhxbsxKGZxwQ4_cCkQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 07:48:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214716

Hi,

On Thu, Apr 10, 2025 at 09:15:02AM -0400, Bruce Ashfield wrote:
> On Thu, Apr 10, 2025 at 9:00 AM Mikko Rapeli via lists.openembedded.org
> <mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
> 
> > On Thu, Apr 10, 2025 at 01:42:12PM +0100, Richard Purdie wrote:
> > > On Fri, 2025-04-04 at 19:29 +0300, Mikko Rapeli via
> > lists.openembedded.org wrote:
> > > > At the moment linux-yocto kernels for various architectures
> > > > are not very modular and a lot of drivers are built into the kernel
> > > > even when they are not needed at runtime. These make the main kernel
> > > > binary big and slow to boot. This also impacts udev in userspace
> > > > which takes a long time processing events from all these built in
> > drivers,
> > > > for example when udev runs in initrd.
> > > >
> > > > Then constructing the initrd is very device and kernel configuration
> > specific.
> > > > initrd image needs explicitly define which binary packages to install
> > > > to avoid pulling in complex dependencies. A full set of kernel modules
> > > > via kernel-modules meta package is too big for initrd and most of the
> > > > drivers are not needed for use cases like "just load modules to mount
> > > > main rootfs". Then the initrd configuration breaks if kernel driver
> > > > is built into the kernel since the binary package doesn't exist.
> > > >
> > > > Introduce kernel-initrd-modules meta package to solve these problems.
> > > > The meta package adds dependencies to real kernel modules based on
> > > > the kernel module file paths so that it will include several
> > > > kernel subsystems and their drivers which are often needed to find
> > > > main rootfs from some block device. This works when drivers are built
> > > > as modules but does not break if drivers are built into the kernel.
> > > >
> > > > The resulting initrd is also smaller since only a subset of drivers
> > > > are needed for "mount the rootfs" usecase. Tested on genericarm64
> > > > kernel and qemu and AMD KV260 HW.
> > > >
> > > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > > ---
> > > >  .../kernel-module-split.bbclass               | 48 +++++++++++++++++++
> > > >  meta/classes-recipe/kernel.bbclass            |  5 +-
> > > >  meta/classes-recipe/module.bbclass            | 37 ++++++++++++++
> > > >  3 files changed, 89 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta/classes-recipe/kernel-module-split.bbclass
> > b/meta/classes-recipe/kernel-module-split.bbclass
> > > > index 9487365eb7..101c5cd959 100644
> > > > --- a/meta/classes-recipe/kernel-module-split.bbclass
> > > > +++ b/meta/classes-recipe/kernel-module-split.bbclass
> > > > @@ -42,6 +42,40 @@ KERNEL_MODULE_PACKAGE_PREFIX ?= ""
> > > >  KERNEL_MODULE_PACKAGE_SUFFIX ?= "-${KERNEL_VERSION}"
> > > >  KERNEL_MODULE_PROVIDE_VIRTUAL ?= "1"
> > > >
> > > > +# subset of kernel modules needed in initrd, to e.g. mount rootfs
> > from block device
> > > > +KERNEL_INITRD_MODULES_META_PACKAGE ?= "${@
> > d.getVar("KERNEL_PACKAGE_NAME") or "kernel" }-initrd-modules"
> > > > +
> > > > +# match regex to path or file name. E.g. include all drivers with
> > files in path /drivers/ata/
> > > > +KERNEL_INITRD_MODULES_REGEX ?= "(.*)(\
> > > > +/drivers/acpi/|\
> > > > +/drivers/ata/|\
> > > > +/drivers/block/|\
> > > > +/drivers/cdrom/|\
> > > > +/drivers/char/hw_random/|\
> > > > +/drivers/char/tpm/|\
> > > > +/drivers/char/|\
> > > > +/drivers/crypto/|\
> > > > +/drivers/dax/|\
> > > > +/drivers/firmware/arm_scmi/|\
> > > > +/drivers/gpu/drm/|\
> > > > +/drivers/md/|\
> > > > +/drivers/mmc/|\
> > > > +/drivers/mtd/|\
> > > > +/drivers/nvdimm/|\
> > > > +/drivers/nvme/|\
> > > > +/drivers/pci/|\
> > > > +/drivers/scsi/|\
> > > > +/drivers/tee/|\
> > > > +/drivers/tty/serial/|\
> > > > +/drivers/virtio/|\
> > > > +/drivers/watchdog/|\
> > > > +/kernel/arch/|\
> > > > +/kernel/block/|\
> > > > +/kernel/crypto/|\
> > > > +/kernel/fs/|\
> > > > +/kernel/lib/\
> > > > +)(.*)"
> > > > +
> > > >  python split_kernel_module_packages () {
> > > >      import re
> > > >
> > > > @@ -183,6 +217,20 @@ python split_kernel_module_packages () {
> > > >      modules = do_split_packages(d,
> > root='${nonarch_base_libdir}/modules', file_regex=module_regex,
> > output_pattern=module_pattern, description='%s kernel module',
> > postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata,
> > extra_depends='%s-%s' % (kernel_package_name, kernel_version))
> > > >      if modules:
> > > >          d.appendVar('RDEPENDS:' + metapkg, ' '+' '.join(modules))
> > > > +
> > > > +    initrd_metapkg = d.getVar('KERNEL_INITRD_MODULES_META_PACKAGE')
> > or ""
> > > > +    initrd_module_regex = d.getVar('KERNEL_INITRD_MODULES_REGEX') or
> > ""
> > > > +    if (initrd_metapkg != "") and (initrd_module_regex != ""):
> > > > +        initrd_module_regex = re.compile(initrd_module_regex)
> > > > +        initrd_modules = []
> > > > +        for module in modules:
> > > > +            files = d.getVar('FILES:' + module)
> > > > +            m = re.match(initrd_module_regex, files)
> > > > +            if m:
> > > > +                initrd_modules.append(module)
> > > > +
> > > > +        if initrd_modules:
> > > > +            d.appendVar('RDEPENDS:' + initrd_metapkg, ' '+'
> > '.join(initrd_modules))
> > > >  }
> > > >
> > > >  do_package[vardeps] += '${@" ".join(map(lambda s: "module_conf_" + s,
> > (d.getVar("KERNEL_MODULE_PROBECONF") or "").split()))}'
> > > > diff --git a/meta/classes-recipe/kernel.bbclass
> > b/meta/classes-recipe/kernel.bbclass
> > > > index 36ce659762..3dcaebcaed 100644
> > > > --- a/meta/classes-recipe/kernel.bbclass
> > > > +++ b/meta/classes-recipe/kernel.bbclass
> > > > @@ -695,13 +695,14 @@ EXPORT_FUNCTIONS do_compile do_transform_kernel
> > do_transform_bundled_initramfs d
> > > >
> > > >  # kernel-base becomes kernel-${KERNEL_VERSION}
> > > >  # kernel-image becomes kernel-image-${KERNEL_VERSION}
> > > > -PACKAGES = "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base
> > ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image
> > ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules
> > ${KERNEL_PACKAGE_NAME}-dbg"
> > > > +PACKAGES = "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base
> > ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image
> > ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules
> > ${KERNEL_PACKAGE_NAME}-initrd-modules ${KERNEL_PACKAGE_NAME}-dbg"
> > > >  FILES:${PN} = ""
> > > >  FILES:${KERNEL_PACKAGE_NAME}-base =
> > "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.order
> > ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin
> > ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin.modinfo"
> > > >  FILES:${KERNEL_PACKAGE_NAME}-image = ""
> > > >  FILES:${KERNEL_PACKAGE_NAME}-dev = "/${KERNEL_IMAGEDEST}/System.map*
> > /${KERNEL_IMAGEDEST}/Module.symvers* /${KERNEL_IMAGEDEST}/config*
> > ${KERNEL_SRC_PATH} ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
> > > >  FILES:${KERNEL_PACKAGE_NAME}-vmlinux =
> > "/${KERNEL_IMAGEDEST}/vmlinux-${KERNEL_VERSION_NAME}"
> > > >  FILES:${KERNEL_PACKAGE_NAME}-modules = ""
> > > > +FILES:${KERNEL_PACKAGE_NAME}-initrd-modules = ""
> > > >  FILES:${KERNEL_PACKAGE_NAME}-dbg = "/usr/lib/debug /usr/src/debug"
> > > >  RDEPENDS:${KERNEL_PACKAGE_NAME} = "${KERNEL_PACKAGE_NAME}-base (=
> > ${EXTENDPKGV})"
> > > >  # Allow machines to override this dependency if kernel image files are
> > > > @@ -716,7 +717,9 @@ ALLOW_EMPTY:${KERNEL_PACKAGE_NAME} = "1"
> > > >  ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-base = "1"
> > > >  ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-image = "1"
> > > >  ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-modules = "1"
> > > > +ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-initrd-modules = "1"
> > > >  DESCRIPTION:${KERNEL_PACKAGE_NAME}-modules = "Kernel modules meta
> > package"
> > > > +DESCRIPTION:${KERNEL_PACKAGE_NAME}-initrd-modules = "Kernel initrd
> > modules meta package"
> > > >
> > > >  pkg_postinst:${KERNEL_PACKAGE_NAME}-base () {
> > > >     if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
> > > > diff --git a/meta/classes-recipe/module.bbclass
> > b/meta/classes-recipe/module.bbclass
> > > > index f2f0b25a2d..51f864f1f9 100644
> > > > --- a/meta/classes-recipe/module.bbclass
> > > > +++ b/meta/classes-recipe/module.bbclass
> > > > @@ -86,3 +86,40 @@ EXPORT_FUNCTIONS do_compile do_install
> > > >  KERNEL_MODULES_META_PACKAGE = "${PN}"
> > > >  FILES:${PN} = ""
> > > >  ALLOW_EMPTY:${PN} = "1"
> > > > +
> > > > +# subset of kernel modules needed in initrd, to e.g. mount rootfs
> > from block device
> > > > +KERNEL_INITRD_MODULES_META_PACKAGE ?= "${@
> > d.getVar("KERNEL_PACKAGE_NAME") or "kernel" }-initrd-modules"
> > > > +
> > > > +# match regex to path or file name. E.g. include all drivers with
> > files in path /drivers/ata/
> > > > +KERNEL_INITRD_MODULES_REGEX ?= "(.*)(\
> > > > +/drivers/acpi/|\
> > > > +/drivers/ata/|\
> > > > +/drivers/block/|\
> > > > +/drivers/cdrom/|\
> > > > +/drivers/char/hw_random/|\
> > > > +/drivers/char/tpm/|\
> > > > +/drivers/char/|\
> > > > +/drivers/crypto/|\
> > > > +/drivers/dax/|\
> > > > +/drivers/firmware/arm_scmi/|\
> > > > +/drivers/gpu/drm/|\
> > > > +/drivers/md/|\
> > > > +/drivers/mmc/|\
> > > > +/drivers/mtd/|\
> > > > +/drivers/nvdimm/|\
> > > > +/drivers/nvme/|\
> > > > +/drivers/pci/|\
> > > > +/drivers/scsi/|\
> > > > +/drivers/tee/|\
> > > > +/drivers/tty/serial/|\
> > > > +/drivers/virtio/|\
> > > > +/drivers/watchdog/|\
> > > > +/kernel/arch/|\
> > > > +/kernel/block/|\
> > > > +/kernel/crypto/|\
> > > > +/kernel/fs/|\
> > > > +/kernel/lib/\
> > > > +)(.*)"
> > > > +
> > > > +FILES:${PN}-initrd = ""
> > > > +ALLOW_EMPTY:${PN}-initrd = "1"
> > >
> > > What is the difference between the variable defined in kernel-module-
> > > split.bbclass and this one in module.bbclass? Do we need/want to
> > > separate but seemingly similar definitions?
> >
> > One is for kernel compilation and in-tree drivers, the other is for
> > out-of-tree modules.
> >
> > The "kernel-modules" meta package is handled this way too, with
> > duplication in both.
> >
> > Bruce says this should be moved to linux-yocto kernel recipe,
> > which IMO breaks the use of kernel-initrd-modules for vendor kernel recipes
> > outside of oe-core. I'd rather support them too to e.g. more easily boot
> > qemu or run oeqa selftests with qemu.
> >
> 
> That's not quite what I said (but it is close), I said it shouldn't be
> defined
> at the base with no requirement opt-in from a recipe (even if this way
> of constructing an initrd with the modules is not the default). It is a (
> weak)
> binding to specific kernel versions and directory layouts, but it is a
> binding
> none the less. If it sits at the base in the classes no one will ever look
> at
> it or even know that it should be considered.
> 
> My suggestion was not that it should only be in linux-yocto (but I'd
> insist on overriding it or doing it slightly differently in linux-yocto),
> I was saying that it I think  that the two definitions are far to similar
> and even if there remain two definitions, they should be moved
> into a .inc file.

Actually the duplication is a bug. All duplication in module.bbclass can be
removed since it includes kernel-module-split.bbclass. Both kernel.bbclass and
module.bbclass include kernel-module-split.bbclass. Sorry about this.
I must have stopped half way when moving things there.

Sending v4 with this fixed soon.

> Any kernel recipe that wants to build an initrd like this can opt-in by
> including the .inc, and/or creating their own definition.

This I don't get. I think the kernel.bbclass and module.bbclass should
work out of the box with sane defaults. The kernel recipes can override
and adjust these as they see fit. Yes there is a dependency to some kernel
APIs (kernel module install paths) which can change, but those have been
stable for, over 25 years (as long as I have been compiling kernels)?

For full control, initrd recipe maintainers can define the exact set
of kernel and other binary packages to install which makes the recipe
kernel config and machine specific.

I don't think moving the definitions to a linux-yocto side .inc file
and then using that as basis in non-core kernel recipes is good. The
kernel.bbclass and module.bbclass would not work independently anymore
and require meta/recipes-kernel/linux/ side .inc file for working defaults.
Or should the .inc file live in meta/conf/distro/include?

I think the defaults belong to kernel-module-split.bbclass used by both
kernel and modules bbclasses.

Cheers,

-Mikko


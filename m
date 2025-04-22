Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07125C369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 10:18:15 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.36506.1745317085270539772
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 03:18:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=rbioC+CJ;
 spf=pass (domain: linaro.org, ip: 209.85.167.47, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso6463505e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 03:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745317083; x=1745921883; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bQz6mV21JHELDGS9iebMDCbIIlmn4sHj6DhHQe3e33s=;
        b=rbioC+CJhgYqsvjRwPTpeC2DXSrCWg9UsROSko+3aiQcuIjBk8cpkwhsymkvA4APpo
         y6oCzrzKliN2BD93yPcwCYqQmpVYsMAy77XBtcXDLTnokonNopgqu3WhYAoYLY29EE6p
         ueG914E5MSGrAvBi6g+8uc2t4fRbN6juCFaJqPt8cYFTfDVfFTfcDa36n8eVQQR2KfDa
         stgCSuPb/o7Q2b13tyNIlGl3vFGEnmm9S2uk+MC8bISPR8ZurqYYS6AEosJiSL9fyL2F
         ZCnuU5psgso+5Ym+2kR9dHaCrEhwVS5rhpgJ6BDNo9EZooOEcw/SEp8QjlHIH9bQPaB/
         xnlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745317083; x=1745921883;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bQz6mV21JHELDGS9iebMDCbIIlmn4sHj6DhHQe3e33s=;
        b=v4YqbtpwexE0bcYV7zO0wuW1ZMbrSttE7TOsBJgeGyWYpzoe0yl4POrXAuwWWtzRO4
         R+x0ww2nBCwkNl7o0kuIf5/qYixIhFMAmiPCf0qtSb2hi7ovV3PTitG+RLTIq5/JWbep
         5NWeQ934IVRZ1hXDrX3dxzwBbjPbqi925GEivz2Ch/61mzIOaHl80Ow/RKRkDISa7JAE
         gaKGwOw51wGxWiy+mcMPzEc7wOTNGBPg7n0EOou/nDTyWhRksGtB60RQq5KN8hsd2Ikz
         e1QsL6a2xvlN+A5I7k+h/rQQigfn92yx7crkwAET/PeyvMysghbUj8BKh54cdDbP7WdN
         2szA==
X-Gm-Message-State: AOJu0YxpAv6oPDGCMKx2LtsxCQ2d4YRxpPFQI8p841p2ZL+s0AVKfsWo
	c711oPEF2W/RbCh/nUcSxkMdJuGvckG9iQFJ7fQqKltIk0diUhJ9KIvy/WvsDPs=
X-Gm-Gg: ASbGncvW9qUIHIhXgTR5q5K5a+NV7ty/LPxjpyk7MARv15cHULJkHVEcAnrXkT7GBK+
	D8kBYYYmwP+TDOxZ0Rjc/g/GqzELZY1ucusX9kGZYl4Edj1FR90P9PbcOSG8SjkX8Fjj8LYzDDl
	GdVYFzNnqUh2SfPiIB4oONRW9AelahEae6LcXHf69R0Rq4nqivvpYDABKEtXuvzQIrPxY1sVUqE
	xp5UBNPxMtDTTxm4RK9yxdJc3N+XNnwsUxcqTuDaZkHmVLoZnIZEd0OSlmLVzaSl3ycmOM7inHy
	GFBHOcpMXBcmjFCZhMzozcMuiB2G3xB+ZxXvASGYITget5aC5ygh0zzAxs12mJ3foSpnvCGfvQ=
	=
X-Google-Smtp-Source: AGHT+IE0kkEmiuN3PLTNasc3tI0VMwuw45Pz6Le5HW+vGLsM5GuGYeXhNJgzB3oZMMM5g8fzm07ksQ==
X-Received: by 2002:a05:6512:1088:b0:549:9044:94ac with SMTP id 2adb3069b0e04-54d6e62c6bdmr4381146e87.23.1745317082925;
        Tue, 22 Apr 2025 03:18:02 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5d0133sm1173779e87.122.2025.04.22.03.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 03:18:02 -0700 (PDT)
Date: Tue, 22 Apr 2025 13:18:00 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3 03/11] kernel.bbclass: add
 kernel-initrd-modules meta package
Message-ID: <aAds2P16lTH1qPFB@nuoska>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-4-mikko.rapeli@linaro.org>
 <1c55e7536de5f36fa37076ad04ff35588b6b5f1e.camel@linuxfoundation.org>
 <Z_fBAsbV-hY-x_SC@nuoska>
 <CADkTA4MamOxjfPE8uHhFDmZ12OhxpJ9dfhxbsxKGZxwQ4_cCkQ@mail.gmail.com>
 <Z_jJX05RuRTcFf4P@nuoska>
 <CADkTA4MWWtMXdRhvmdXhoS38SVpqXUz=p5G5H1i820QaV4CR0A@mail.gmail.com>
 <Z_kVI4bN7xWOyUi-@nuoska>
 <CADkTA4O9JXtr6XFO_rdzoAumtmp=5YUUkwgKMJyOtDBau7MEDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADkTA4O9JXtr6XFO_rdzoAumtmp=5YUUkwgKMJyOtDBau7MEDQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 10:18:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215197

Hi,

On Fri, Apr 11, 2025 at 09:39:31AM -0400, Bruce Ashfield wrote:
> On Fri, Apr 11, 2025 at 9:12 AM Mikko Rapeli <mikko.rapeli@linaro.org>
> wrote:
> > On Fri, Apr 11, 2025 at 08:52:24AM -0400, Bruce Ashfield wrote:
> > > On Fri, Apr 11, 2025 at 3:48 AM Mikko Rapeli <mikko.rapeli@linaro.org>
> > > wrote:
> > > > On Thu, Apr 10, 2025 at 09:15:02AM -0400, Bruce Ashfield wrote:
> > > > > On Thu, Apr 10, 2025 at 9:00 AM Mikko Rapeli via
> > lists.openembedded.org
> > > > > <mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
> > > > >
> > > > > > On Thu, Apr 10, 2025 at 01:42:12PM +0100, Richard Purdie wrote:
> > > > > > > On Fri, 2025-04-04 at 19:29 +0300, Mikko Rapeli via
> > > > > > lists.openembedded.org wrote:
> > > > > > > > At the moment linux-yocto kernels for various architectures
> > > > > > > > are not very modular and a lot of drivers are built into the
> > kernel
> > > > > > > > even when they are not needed at runtime. These make the main
> > > > kernel
> > > > > > > > binary big and slow to boot. This also impacts udev in
> > userspace
> > > > > > > > which takes a long time processing events from all these built
> > in
> > > > > > drivers,
> > > > > > > > for example when udev runs in initrd.
> > > > > > > >
> > > > > > > > Then constructing the initrd is very device and kernel
> > > > configuration
> > > > > > specific.
> > > > > > > > initrd image needs explicitly define which binary packages to
> > > > install
> > > > > > > > to avoid pulling in complex dependencies. A full set of kernel
> > > > modules
> > > > > > > > via kernel-modules meta package is too big for initrd and most
> > of
> > > > the
> > > > > > > > drivers are not needed for use cases like "just load modules to
> > > > mount
> > > > > > > > main rootfs". Then the initrd configuration breaks if kernel
> > driver
> > > > > > > > is built into the kernel since the binary package doesn't
> > exist.
> > > > > > > >
> > > > > > > > Introduce kernel-initrd-modules meta package to solve these
> > > > problems.
> > > > > > > > The meta package adds dependencies to real kernel modules
> > based on
> > > > > > > > the kernel module file paths so that it will include several
> > > > > > > > kernel subsystems and their drivers which are often needed to
> > find
> > > > > > > > main rootfs from some block device. This works when drivers are
> > > > built
> > > > > > > > as modules but does not break if drivers are built into the
> > kernel.
> > > > > > > >
> > > > > > > > The resulting initrd is also smaller since only a subset of
> > drivers
> > > > > > > > are needed for "mount the rootfs" usecase. Tested on
> > genericarm64
> > > > > > > > kernel and qemu and AMD KV260 HW.
> > > > > > > >
> > > > > > > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > > > > > > ---
> > > > > > > >  .../kernel-module-split.bbclass               | 48
> > > > +++++++++++++++++++
> > > > > > > >  meta/classes-recipe/kernel.bbclass            |  5 +-
> > > > > > > >  meta/classes-recipe/module.bbclass            | 37
> > ++++++++++++++
> > > > > > > >  3 files changed, 89 insertions(+), 1 deletion(-)
> > > > > > > >
> > > > > > > > diff --git a/meta/classes-recipe/kernel-module-split.bbclass
> > > > > > b/meta/classes-recipe/kernel-module-split.bbclass
> > > > > > > > index 9487365eb7..101c5cd959 100644
> > > > > > > > --- a/meta/classes-recipe/kernel-module-split.bbclass
> > > > > > > > +++ b/meta/classes-recipe/kernel-module-split.bbclass
> > > > > > > > @@ -42,6 +42,40 @@ KERNEL_MODULE_PACKAGE_PREFIX ?= ""
> > > > > > > >  KERNEL_MODULE_PACKAGE_SUFFIX ?= "-${KERNEL_VERSION}"
> > > > > > > >  KERNEL_MODULE_PROVIDE_VIRTUAL ?= "1"
> > > > > > > >
> > > > > > > > +# subset of kernel modules needed in initrd, to e.g. mount
> > rootfs
> > > > > > from block device
> > > > > > > > +KERNEL_INITRD_MODULES_META_PACKAGE ?= "${@
> > > > > > d.getVar("KERNEL_PACKAGE_NAME") or "kernel" }-initrd-modules"
> > > > > > > > +
> > > > > > > > +# match regex to path or file name. E.g. include all drivers
> > with
> > > > > > files in path /drivers/ata/
> > > > > > > > +KERNEL_INITRD_MODULES_REGEX ?= "(.*)(\
> > > > > > > > +/drivers/acpi/|\
> > > > > > > > +/drivers/ata/|\
> > > > > > > > +/drivers/block/|\
> > > > > > > > +/drivers/cdrom/|\
> > > > > > > > +/drivers/char/hw_random/|\
> > > > > > > > +/drivers/char/tpm/|\
> > > > > > > > +/drivers/char/|\
> > > > > > > > +/drivers/crypto/|\
> > > > > > > > +/drivers/dax/|\
> > > > > > > > +/drivers/firmware/arm_scmi/|\
> > > > > > > > +/drivers/gpu/drm/|\
> > > > > > > > +/drivers/md/|\
> > > > > > > > +/drivers/mmc/|\
> > > > > > > > +/drivers/mtd/|\
> > > > > > > > +/drivers/nvdimm/|\
> > > > > > > > +/drivers/nvme/|\
> > > > > > > > +/drivers/pci/|\
> > > > > > > > +/drivers/scsi/|\
> > > > > > > > +/drivers/tee/|\
> > > > > > > > +/drivers/tty/serial/|\
> > > > > > > > +/drivers/virtio/|\
> > > > > > > > +/drivers/watchdog/|\
> > > > > > > > +/kernel/arch/|\
> > > > > > > > +/kernel/block/|\
> > > > > > > > +/kernel/crypto/|\
> > > > > > > > +/kernel/fs/|\
> > > > > > > > +/kernel/lib/\
> > > > > > > > +)(.*)"
> > > > > > > > +
> > > > > > > >  python split_kernel_module_packages () {
> > > > > > > >      import re
> > > > > > > >
> > > > > > > > @@ -183,6 +217,20 @@ python split_kernel_module_packages () {
> > > > > > > >      modules = do_split_packages(d,
> > > > > > root='${nonarch_base_libdir}/modules', file_regex=module_regex,
> > > > > > output_pattern=module_pattern, description='%s kernel module',
> > > > > > postinst=postinst, postrm=postrm, recursive=True,
> > hook=frob_metadata,
> > > > > > extra_depends='%s-%s' % (kernel_package_name, kernel_version))
> > > > > > > >      if modules:
> > > > > > > >          d.appendVar('RDEPENDS:' + metapkg, ' '+'
> > '.join(modules))
> > > > > > > > +
> > > > > > > > +    initrd_metapkg =
> > > > d.getVar('KERNEL_INITRD_MODULES_META_PACKAGE')
> > > > > > or ""
> > > > > > > > +    initrd_module_regex =
> > d.getVar('KERNEL_INITRD_MODULES_REGEX')
> > > > or
> > > > > > ""
> > > > > > > > +    if (initrd_metapkg != "") and (initrd_module_regex != ""):
> > > > > > > > +        initrd_module_regex = re.compile(initrd_module_regex)
> > > > > > > > +        initrd_modules = []
> > > > > > > > +        for module in modules:
> > > > > > > > +            files = d.getVar('FILES:' + module)
> > > > > > > > +            m = re.match(initrd_module_regex, files)
> > > > > > > > +            if m:
> > > > > > > > +                initrd_modules.append(module)
> > > > > > > > +
> > > > > > > > +        if initrd_modules:
> > > > > > > > +            d.appendVar('RDEPENDS:' + initrd_metapkg, ' '+'
> > > > > > '.join(initrd_modules))
> > > > > > > >  }
> > > > > > > >
> > > > > > > >  do_package[vardeps] += '${@" ".join(map(lambda s:
> > "module_conf_"
> > > > + s,
> > > > > > (d.getVar("KERNEL_MODULE_PROBECONF") or "").split()))}'
> > > > > > > > diff --git a/meta/classes-recipe/kernel.bbclass
> > > > > > b/meta/classes-recipe/kernel.bbclass
> > > > > > > > index 36ce659762..3dcaebcaed 100644
> > > > > > > > --- a/meta/classes-recipe/kernel.bbclass
> > > > > > > > +++ b/meta/classes-recipe/kernel.bbclass
> > > > > > > > @@ -695,13 +695,14 @@ EXPORT_FUNCTIONS do_compile
> > > > do_transform_kernel
> > > > > > do_transform_bundled_initramfs d
> > > > > > > >
> > > > > > > >  # kernel-base becomes kernel-${KERNEL_VERSION}
> > > > > > > >  # kernel-image becomes kernel-image-${KERNEL_VERSION}
> > > > > > > > -PACKAGES = "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base
> > > > > > ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image
> > > > > > ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules
> > > > > > ${KERNEL_PACKAGE_NAME}-dbg"
> > > > > > > > +PACKAGES = "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base
> > > > > > ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image
> > > > > > ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules
> > > > > > ${KERNEL_PACKAGE_NAME}-initrd-modules ${KERNEL_PACKAGE_NAME}-dbg"
> > > > > > > >  FILES:${PN} = ""
> > > > > > > >  FILES:${KERNEL_PACKAGE_NAME}-base =
> > > > > > "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.order
> > > > > > ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin
> > > > > >
> > > >
> > ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin.modinfo"
> > > > > > > >  FILES:${KERNEL_PACKAGE_NAME}-image = ""
> > > > > > > >  FILES:${KERNEL_PACKAGE_NAME}-dev =
> > > > "/${KERNEL_IMAGEDEST}/System.map*
> > > > > > /${KERNEL_IMAGEDEST}/Module.symvers* /${KERNEL_IMAGEDEST}/config*
> > > > > > ${KERNEL_SRC_PATH}
> > > > ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
> > > > > > > >  FILES:${KERNEL_PACKAGE_NAME}-vmlinux =
> > > > > > "/${KERNEL_IMAGEDEST}/vmlinux-${KERNEL_VERSION_NAME}"
> > > > > > > >  FILES:${KERNEL_PACKAGE_NAME}-modules = ""
> > > > > > > > +FILES:${KERNEL_PACKAGE_NAME}-initrd-modules = ""
> > > > > > > >  FILES:${KERNEL_PACKAGE_NAME}-dbg = "/usr/lib/debug
> > /usr/src/debug"
> > > > > > > >  RDEPENDS:${KERNEL_PACKAGE_NAME} =
> > "${KERNEL_PACKAGE_NAME}-base (=
> > > > > > ${EXTENDPKGV})"
> > > > > > > >  # Allow machines to override this dependency if kernel image
> > > > files are
> > > > > > > > @@ -716,7 +717,9 @@ ALLOW_EMPTY:${KERNEL_PACKAGE_NAME} = "1"
> > > > > > > >  ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-base = "1"
> > > > > > > >  ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-image = "1"
> > > > > > > >  ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-modules = "1"
> > > > > > > > +ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-initrd-modules = "1"
> > > > > > > >  DESCRIPTION:${KERNEL_PACKAGE_NAME}-modules = "Kernel modules
> > meta
> > > > > > package"
> > > > > > > > +DESCRIPTION:${KERNEL_PACKAGE_NAME}-initrd-modules = "Kernel
> > initrd
> > > > > > modules meta package"
> > > > > > > >
> > > > > > > >  pkg_postinst:${KERNEL_PACKAGE_NAME}-base () {
> > > > > > > >     if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
> > > > > > > > diff --git a/meta/classes-recipe/module.bbclass
> > > > > > b/meta/classes-recipe/module.bbclass
> > > > > > > > index f2f0b25a2d..51f864f1f9 100644
> > > > > > > > --- a/meta/classes-recipe/module.bbclass
> > > > > > > > +++ b/meta/classes-recipe/module.bbclass
> > > > > > > > @@ -86,3 +86,40 @@ EXPORT_FUNCTIONS do_compile do_install
> > > > > > > >  KERNEL_MODULES_META_PACKAGE = "${PN}"
> > > > > > > >  FILES:${PN} = ""
> > > > > > > >  ALLOW_EMPTY:${PN} = "1"
> > > > > > > > +
> > > > > > > > +# subset of kernel modules needed in initrd, to e.g. mount
> > rootfs
> > > > > > from block device
> > > > > > > > +KERNEL_INITRD_MODULES_META_PACKAGE ?= "${@
> > > > > > d.getVar("KERNEL_PACKAGE_NAME") or "kernel" }-initrd-modules"
> > > > > > > > +
> > > > > > > > +# match regex to path or file name. E.g. include all drivers
> > with
> > > > > > files in path /drivers/ata/
> > > > > > > > +KERNEL_INITRD_MODULES_REGEX ?= "(.*)(\
> > > > > > > > +/drivers/acpi/|\
> > > > > > > > +/drivers/ata/|\
> > > > > > > > +/drivers/block/|\
> > > > > > > > +/drivers/cdrom/|\
> > > > > > > > +/drivers/char/hw_random/|\
> > > > > > > > +/drivers/char/tpm/|\
> > > > > > > > +/drivers/char/|\
> > > > > > > > +/drivers/crypto/|\
> > > > > > > > +/drivers/dax/|\
> > > > > > > > +/drivers/firmware/arm_scmi/|\
> > > > > > > > +/drivers/gpu/drm/|\
> > > > > > > > +/drivers/md/|\
> > > > > > > > +/drivers/mmc/|\
> > > > > > > > +/drivers/mtd/|\
> > > > > > > > +/drivers/nvdimm/|\
> > > > > > > > +/drivers/nvme/|\
> > > > > > > > +/drivers/pci/|\
> > > > > > > > +/drivers/scsi/|\
> > > > > > > > +/drivers/tee/|\
> > > > > > > > +/drivers/tty/serial/|\
> > > > > > > > +/drivers/virtio/|\
> > > > > > > > +/drivers/watchdog/|\
> > > > > > > > +/kernel/arch/|\
> > > > > > > > +/kernel/block/|\
> > > > > > > > +/kernel/crypto/|\
> > > > > > > > +/kernel/fs/|\
> > > > > > > > +/kernel/lib/\
> > > > > > > > +)(.*)"
> > > > > > > > +
> > > > > > > > +FILES:${PN}-initrd = ""
> > > > > > > > +ALLOW_EMPTY:${PN}-initrd = "1"
> > > > > > >
> > > > > > > What is the difference between the variable defined in
> > kernel-module-
> > > > > > > split.bbclass and this one in module.bbclass? Do we need/want to
> > > > > > > separate but seemingly similar definitions?
> > > > > >
> > > > > > One is for kernel compilation and in-tree drivers, the other is for
> > > > > > out-of-tree modules.
> > > > > >
> > > > > > The "kernel-modules" meta package is handled this way too, with
> > > > > > duplication in both.
> > > > > >
> > > > > > Bruce says this should be moved to linux-yocto kernel recipe,
> > > > > > which IMO breaks the use of kernel-initrd-modules for vendor kernel
> > > > recipes
> > > > > > outside of oe-core. I'd rather support them too to e.g. more easily
> > > > boot
> > > > > > qemu or run oeqa selftests with qemu.
> > > > > >
> > > > >
> > > > > That's not quite what I said (but it is close), I said it shouldn't
> > be
> > > > > defined
> > > > > at the base with no requirement opt-in from a recipe (even if this
> > way
> > > > > of constructing an initrd with the modules is not the default). It
> > is a (
> > > > > weak)
> > > > > binding to specific kernel versions and directory layouts, but it is
> > a
> > > > > binding
> > > > > none the less. If it sits at the base in the classes no one will ever
> > > > look
> > > > > at
> > > > > it or even know that it should be considered.
> > > > >
> > > > > My suggestion was not that it should only be in linux-yocto (but I'd
> > > > > insist on overriding it or doing it slightly differently in
> > linux-yocto),
> > > > > I was saying that it I think  that the two definitions are far to
> > similar
> > > > > and even if there remain two definitions, they should be moved
> > > > > into a .inc file.
> > > >
> > > > Actually the duplication is a bug. All duplication in module.bbclass
> > can be
> > > > removed since it includes kernel-module-split.bbclass. Both
> > kernel.bbclass
> > > > and
> > > > module.bbclass include kernel-module-split.bbclass. Sorry about this.
> > > > I must have stopped half way when moving things there.
> > > >
> > > > Sending v4 with this fixed soon.
> > > >
> > > > > Any kernel recipe that wants to build an initrd like this can opt-in
> > by
> > > > > including the .inc, and/or creating their own definition.
> > > >
> > > > This I don't get. I think the kernel.bbclass and module.bbclass should
> > > > work out of the box with sane defaults. The kernel recipes can override
> > > > and adjust these as they see fit. Yes there is a dependency to some
> > kernel
> > > > APIs (kernel module install paths) which can change, but those have
> > been
> > > > stable for, over 25 years (as long as I have been compiling kernels)?
> > > >
> > > > For full control, initrd recipe maintainers can define the exact set
> > > > of kernel and other binary packages to install which makes the recipe
> > > > kernel config and machine specific.
> > > >
> > > > I don't think moving the definitions to a linux-yocto side .inc file
> > > > and then using that as basis in non-core kernel recipes is good. The
> > > > kernel.bbclass and module.bbclass would not work independently anymore
> > > > and require meta/recipes-kernel/linux/ side .inc file for working
> > defaults.
> > > > Or should the .inc file live in meta/conf/distro/include?
> > > >
> > >
> > > Let me be clear. I am not saying "linux-yocto" here. I said a ".inc"
> > file.
> > >
> > > Put that .inc file in a common directory and call it something like
> > > initrd-kernel-<foo>.inc, recipes include that .inc file to opt into the
> > > behaviour and get the base definition if they want it.
> >
> > Ok I will do this in v5.
> >
> > > This modular based initrd isn't going to be the default, so it has
> > > to be opt-in anyway. So put the opt-in and the definitions in a .inc
> > > file, a recipe including it, opts-in.
> >
> > I think this should be the default on most machines which use
> > core-image-initramfs-boot in oe-core.
> 
> 
> I'll disagree on that point, but in the end, it isn't a hill that
> is worth climbing (for me). If that's the way the default policy
> goes, I'll just roll with it.
> 
> > genericarm64, beagleplay etc machines already for install of
> > "kernel-modules"
> > to all images, including core-image-initramfs-boot:
> >
> > $ git grep MACHINE_EXTRA_RRECOMMENDS meta/conf/machine
> > meta-yocto-bsp/conf/machine/ | grep kernel-modules
> > meta-yocto-bsp/conf/machine/beaglebone-yocto.conf:MACHINE_EXTRA_RRECOMMENDS
> > = "kernel-modules"
> > meta-yocto-bsp/conf/machine/genericarm64.conf:MACHINE_EXTRA_RRECOMMENDS +=
> > "kernel-modules"
> > meta-yocto-bsp/conf/machine/include/genericx86-common.inc:MACHINE_EXTRA_RRECOMMENDS
> > += "kernel-modules linux-firmware"
> > meta/conf/machine/include/loongarch/qemuloongarch.inc:MACHINE_EXTRA_RRECOMMENDS
> > += " kernel-modules"
> > meta/conf/machine/include/riscv/qemuriscv.inc:MACHINE_EXTRA_RRECOMMENDS +=
> > " kernel-modules"
> > meta/conf/machine/qemuppc64.conf:MACHINE_EXTRA_RRECOMMENDS += "
> > kernel-modules"
> >
> Right, and that was by design.
> 
> The philosophy has been that the kernel provider should understand
> and control its configuration (since we are talking about embedded
> devices here). Sure, those examples took the simplest path, and that
> was their decision / tradeoff.
> 
> We package all the modules individually (I'm stating the obvious,
> since we all know this) so that they can be individually installed
> and required for something that really wants to control the configuration
> tightly.
> 
> In any machine / BSP that I build, the configuration is on purpose
> and if I want to install individual modules, I'll do that, otherwise,
> I trust my configuration and take all the modules.
> 
> What you have is something in the middle, and why I still think it
> needs to be opt-in. BSP creators need to understand their
> configuration and tune it. Having something down at the packaging
> level pick and choose which modules on their behalf means that
> they are relying on something that needs to be discovered and
> tweaked (versus the "all of it" or "you chose your own" as it was
> before).

By making the kernel-initrd-modules meta package optional and opt-in,
we again make the initrd image recipe depend on the opt-in feature.

I need to bind the initrd recipe to a distro level feature and
then the same for kernel side changes because the "kernel-initrd-modules"
meta package may not exist and thus it can break the build. Solution
is another abstraction in distro features. I think producing the
"kernel-initrd-modules" meta package should be default in the kernel
bbclasses. It may not get used but the overhead is really small.

This is similar to "kernel-modules" meta package. It is always there
and can safely be in MACHINE_EXTRA_RRECOMMENDS without any additional
guards like a machine or distro feature. Also BSP layer image recipes
use this.

This is the interface between kernel recipes providing kernel and module
packages and the image recipe consuming them. I'd like the image recipe
consumer to be simpler and less dependent kernel config and driver packaging
details.

> > Some qemu machines don't and that causes issues since
> > initrd is not flexible to boot even slightly different configurations,
> > like block device emulation moved from scsi to virtio.
> > This causes issues with oeqa selftests when small kernel or qemuboot
> > differences break tests.
> >
> 
> And we'll continue to do that, as all the boot methods and kernels
> need to be tested. But I agree, there are pros and cons to the
> various methods.
> 
> > initrd itself is optional, but in core-image-initramfs-boot I made
> > including "kernel-initrd-modules" the default. To me this makes sense.
> >
> > Kernels for different machines can enable drivers as modules or as built-in
> > but the initrd config stays the same and will mostly just work. I think
> > this is a good default.
> >
> >
> It is just that behaviour which is why I'm saying it should be
> explicit and opt-in. If they change their configuration it should
> be with a direct line of sight to how the various components
> consume it.
> 
> Preferably not "I have a custom driver, I need it to boot, I'm
> now building it as a module" .. and then wondering why it isn't
> picked up in the initrd. If they had to opt-in, they'll already be
> aware of the mechanism that is selecting their modules over
> and above what their kernel configuration dictates.

If the custom and vendor specific driver installs to correct paths
which fall into block etc driver regex then these already get picked up by the
initrd regex then everything will just work by default. Compiling the driver
built-in or as module will just work with the default core-image-initramfs-boot
initrd and core-image-base etc images. Boot without initrd may fail but with it
things just work.

If this feature is opt-in or specific to linux-yocto recipe, it again makes the
initrd's machine and kernel config specific. The opt-in setup needs to be made
for kernel and for initrd.

For real products all details need to be reviewed and customized but developers
need "good enough and simple" starting points and that's where the
"kernel-modules" and "kernel-initrd-modules" meta packages help.

They can more easily boot the generic images, see what drivers got loaded at boot
and remove all the rest. Then move that setup into kernel config etc. They can
also test different block devices and file systems.

The amount of optimisation done depends on what the priorities are. Gain vs effort.

> > And then "kernel-initrd-modules" are much smaller than "kernel-modules".
> > Still too big for real products but better than nothing. For
> > genericarm64 this reduced initrd image size from 200 Mb to 54 Mb.
> 
> Definitely a valid point / improvement. I'm again back to saying it
> just has to be explicit. The same way that many (most?) people
> don't want or use linux-yocto as production, we have to design
> our configurations as something to be opt-in and something that
> is clear it needs to be tweaked for production.
> 
> We aren't far off in our view on this.  Most of this looks really
> good to me, and is a good step forward. I think that our
> different point of view is about the breadth of the types of
> kernels, machines, boot methods, products, etc, that are built
> on top and how to enable this mechanism.

If this feature is opt-in and not the default in kernel.bbclass, then IMO
the result is again machine/build/config specific initrd image recipes
which I wanted to avoid.

Cheers,

-Mikko


Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F009DC369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 12:49:06 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.7862.1745412537925937062
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 05:48:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Gz2KGmDQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2264aefc45dso101002615ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 05:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745412537; x=1746017337; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BycMURF5j87VOW1GAP57Bu4jA54T/+KBtFYgyajl1Fs=;
        b=Gz2KGmDQlFilotqzKGviJBcsr97V+GHFXFEbn/5UaNhHmSkg/4HddcBRcUcGOTKImr
         jnHsyyaB53RGNDj/TEJ7gzsZ2ISlx0kqEkRYL5TCEjIFMi7cQ+xHFjJ9ZmtVr5q+kw+N
         RDvr+OOJX0ifaYQ8eCFTMb61kYFUZk14jqPSEpwqY6rF/G1PIZf/Ki9ZDhveDylMgEB4
         DbAbZMpGokqPzhIZenvtWQA8tuBUHoAL3lyP1goMPk0G4VqPH4odIcD6wzjxu2Mh0LoW
         0C8Hm1f4d2p7c/5lsiQdZEMrAYSwHSEf9k/gOLcwqh/q77IGeuYvFvBMoJCD/xjgIWfH
         fTAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745412537; x=1746017337;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BycMURF5j87VOW1GAP57Bu4jA54T/+KBtFYgyajl1Fs=;
        b=VFI6z6ZdrOTjEiTT4h9d91chr5aSHnzZ/cdqIB/ib+aDAS0a/ivotwHLsUasxSdvI+
         lYaSknUHN1Hgvs4Rrm1MlI+yMAJZHmkNx86r9crl9sv0G27+OKKpsPxwQ5L42laZ4nOm
         2/Uj9E+iTFJzGJJfOLpitbIZjUrwoGP97aX5xOChVZZbcZTEMXxNjsow5NrZPxbSdyWN
         S7qcUN4Nz+bzn70MCRxCVx5x0vSLotGU/XR191qifHF2JHMtYIt4V5JXSixrjrxSogCZ
         B7X4saSavv/piYBH4XdAQZoapL6bAz3rZAseeHGTNMMl2gzplatM3y0sFaM2U9/gDzoM
         Uwjg==
X-Gm-Message-State: AOJu0Yw4G+mBuxmRYo/B7WwvPfOQjGYLcLuparpkwbrSO3FQIf3G1fZx
	TaPFPuTRh4XJOOyFbLntD8Djapg/a67l6aaznh7U3s+gkIxSbDZTtQmK7U/5u0ycswLrZZdWu2R
	XQNG3j05jAQuRyqGFq4t8qLUqjLg=
X-Gm-Gg: ASbGncs7vmjklQCLKWaI4TT7ZkaawwI71BikduJmtNjZG8Emi+0uugTJWWb7iLKkrXu
	kp3HUYyNs9XSxTZokdzU6HrYGyzo5bSjvw9t6GtRim5/K31OGQWQQJGxKqYf6QtH7A1rfLPhbww
	XymtcAh3ZfQ2vN4R95BotYMRg=
X-Google-Smtp-Source: AGHT+IEAzzCteFxLhzMdls8aQWIt/Fv0gE+NKhbeI2Pj6fIh2/7A+mSewpQYebmVMTqAtQ2pddEdJiINX5EEcrJdQUM=
X-Received: by 2002:a17:90b:528a:b0:301:6343:1626 with SMTP id
 98e67ed59e1d1-3087bb39650mr26660697a91.1.1745412536974; Wed, 23 Apr 2025
 05:48:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-4-mikko.rapeli@linaro.org> <1c55e7536de5f36fa37076ad04ff35588b6b5f1e.camel@linuxfoundation.org>
 <Z_fBAsbV-hY-x_SC@nuoska> <CADkTA4MamOxjfPE8uHhFDmZ12OhxpJ9dfhxbsxKGZxwQ4_cCkQ@mail.gmail.com>
 <Z_jJX05RuRTcFf4P@nuoska> <CADkTA4MWWtMXdRhvmdXhoS38SVpqXUz=p5G5H1i820QaV4CR0A@mail.gmail.com>
 <Z_kVI4bN7xWOyUi-@nuoska> <CADkTA4O9JXtr6XFO_rdzoAumtmp=5YUUkwgKMJyOtDBau7MEDQ@mail.gmail.com>
 <aAds2P16lTH1qPFB@nuoska>
In-Reply-To: <aAds2P16lTH1qPFB@nuoska>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 23 Apr 2025 08:48:45 -0400
X-Gm-Features: ATxdqUEUg2Pm7_2wpbFq5gLkchxRv4yF1WRbBlSqkDRXs8CX3_a2elVShT_QBvM
Message-ID: <CADkTA4MKCYMct_GApHi9zVBOdLAC1R+ocpJ9Xcat7pE8=HTG-g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 03/11] kernel.bbclass: add
 kernel-initrd-modules meta package
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000040c5e60633718659"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 12:49:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215290

--00000000000040c5e60633718659
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 6:18=E2=80=AFAM Mikko Rapeli <mikko.rapeli@linaro.o=
rg>
wrote:

> Hi,
>
> On Fri, Apr 11, 2025 at 09:39:31AM -0400, Bruce Ashfield wrote:
> > On Fri, Apr 11, 2025 at 9:12=E2=80=AFAM Mikko Rapeli <mikko.rapeli@lina=
ro.org>
> > wrote:
> > > On Fri, Apr 11, 2025 at 08:52:24AM -0400, Bruce Ashfield wrote:
> > > > On Fri, Apr 11, 2025 at 3:48=E2=80=AFAM Mikko Rapeli <
> mikko.rapeli@linaro.org>
> > > > wrote:
> > > > > On Thu, Apr 10, 2025 at 09:15:02AM -0400, Bruce Ashfield wrote:
> > > > > > On Thu, Apr 10, 2025 at 9:00=E2=80=AFAM Mikko Rapeli via
> > > lists.openembedded.org
> > > > > > <mikko.rapeli=3Dlinaro.org@lists.openembedded.org> wrote:
> > > > > >
> > > > > > > On Thu, Apr 10, 2025 at 01:42:12PM +0100, Richard Purdie wrot=
e:
> > > > > > > > On Fri, 2025-04-04 at 19:29 +0300, Mikko Rapeli via
> > > > > > > lists.openembedded.org wrote:
> > > > > > > > > At the moment linux-yocto kernels for various architectur=
es
> > > > > > > > > are not very modular and a lot of drivers are built into
> the
> > > kernel
> > > > > > > > > even when they are not needed at runtime. These make the
> main
> > > > > kernel
> > > > > > > > > binary big and slow to boot. This also impacts udev in
> > > userspace
> > > > > > > > > which takes a long time processing events from all these
> built
> > > in
> > > > > > > drivers,
> > > > > > > > > for example when udev runs in initrd.
> > > > > > > > >
> > > > > > > > > Then constructing the initrd is very device and kernel
> > > > > configuration
> > > > > > > specific.
> > > > > > > > > initrd image needs explicitly define which binary package=
s
> to
> > > > > install
> > > > > > > > > to avoid pulling in complex dependencies. A full set of
> kernel
> > > > > modules
> > > > > > > > > via kernel-modules meta package is too big for initrd and
> most
> > > of
> > > > > the
> > > > > > > > > drivers are not needed for use cases like "just load
> modules to
> > > > > mount
> > > > > > > > > main rootfs". Then the initrd configuration breaks if
> kernel
> > > driver
> > > > > > > > > is built into the kernel since the binary package doesn't
> > > exist.
> > > > > > > > >
> > > > > > > > > Introduce kernel-initrd-modules meta package to solve the=
se
> > > > > problems.
> > > > > > > > > The meta package adds dependencies to real kernel modules
> > > based on
> > > > > > > > > the kernel module file paths so that it will include
> several
> > > > > > > > > kernel subsystems and their drivers which are often neede=
d
> to
> > > find
> > > > > > > > > main rootfs from some block device. This works when
> drivers are
> > > > > built
> > > > > > > > > as modules but does not break if drivers are built into t=
he
> > > kernel.
> > > > > > > > >
> > > > > > > > > The resulting initrd is also smaller since only a subset =
of
> > > drivers
> > > > > > > > > are needed for "mount the rootfs" usecase. Tested on
> > > genericarm64
> > > > > > > > > kernel and qemu and AMD KV260 HW.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > > > > > > > ---
> > > > > > > > >  .../kernel-module-split.bbclass               | 48
> > > > > +++++++++++++++++++
> > > > > > > > >  meta/classes-recipe/kernel.bbclass            |  5 +-
> > > > > > > > >  meta/classes-recipe/module.bbclass            | 37
> > > ++++++++++++++
> > > > > > > > >  3 files changed, 89 insertions(+), 1 deletion(-)
> > > > > > > > >
> > > > > > > > > diff --git
> a/meta/classes-recipe/kernel-module-split.bbclass
> > > > > > > b/meta/classes-recipe/kernel-module-split.bbclass
> > > > > > > > > index 9487365eb7..101c5cd959 100644
> > > > > > > > > --- a/meta/classes-recipe/kernel-module-split.bbclass
> > > > > > > > > +++ b/meta/classes-recipe/kernel-module-split.bbclass
> > > > > > > > > @@ -42,6 +42,40 @@ KERNEL_MODULE_PACKAGE_PREFIX ?=3D ""
> > > > > > > > >  KERNEL_MODULE_PACKAGE_SUFFIX ?=3D "-${KERNEL_VERSION}"
> > > > > > > > >  KERNEL_MODULE_PROVIDE_VIRTUAL ?=3D "1"
> > > > > > > > >
> > > > > > > > > +# subset of kernel modules needed in initrd, to e.g. mou=
nt
> > > rootfs
> > > > > > > from block device
> > > > > > > > > +KERNEL_INITRD_MODULES_META_PACKAGE ?=3D "${@
> > > > > > > d.getVar("KERNEL_PACKAGE_NAME") or "kernel" }-initrd-modules"
> > > > > > > > > +
> > > > > > > > > +# match regex to path or file name. E.g. include all
> drivers
> > > with
> > > > > > > files in path /drivers/ata/
> > > > > > > > > +KERNEL_INITRD_MODULES_REGEX ?=3D "(.*)(\
> > > > > > > > > +/drivers/acpi/|\
> > > > > > > > > +/drivers/ata/|\
> > > > > > > > > +/drivers/block/|\
> > > > > > > > > +/drivers/cdrom/|\
> > > > > > > > > +/drivers/char/hw_random/|\
> > > > > > > > > +/drivers/char/tpm/|\
> > > > > > > > > +/drivers/char/|\
> > > > > > > > > +/drivers/crypto/|\
> > > > > > > > > +/drivers/dax/|\
> > > > > > > > > +/drivers/firmware/arm_scmi/|\
> > > > > > > > > +/drivers/gpu/drm/|\
> > > > > > > > > +/drivers/md/|\
> > > > > > > > > +/drivers/mmc/|\
> > > > > > > > > +/drivers/mtd/|\
> > > > > > > > > +/drivers/nvdimm/|\
> > > > > > > > > +/drivers/nvme/|\
> > > > > > > > > +/drivers/pci/|\
> > > > > > > > > +/drivers/scsi/|\
> > > > > > > > > +/drivers/tee/|\
> > > > > > > > > +/drivers/tty/serial/|\
> > > > > > > > > +/drivers/virtio/|\
> > > > > > > > > +/drivers/watchdog/|\
> > > > > > > > > +/kernel/arch/|\
> > > > > > > > > +/kernel/block/|\
> > > > > > > > > +/kernel/crypto/|\
> > > > > > > > > +/kernel/fs/|\
> > > > > > > > > +/kernel/lib/\
> > > > > > > > > +)(.*)"
> > > > > > > > > +
> > > > > > > > >  python split_kernel_module_packages () {
> > > > > > > > >      import re
> > > > > > > > >
> > > > > > > > > @@ -183,6 +217,20 @@ python split_kernel_module_packages
> () {
> > > > > > > > >      modules =3D do_split_packages(d,
> > > > > > > root=3D'${nonarch_base_libdir}/modules', file_regex=3Dmodule_=
regex,
> > > > > > > output_pattern=3Dmodule_pattern, description=3D'%s kernel mod=
ule',
> > > > > > > postinst=3Dpostinst, postrm=3Dpostrm, recursive=3DTrue,
> > > hook=3Dfrob_metadata,
> > > > > > > extra_depends=3D'%s-%s' % (kernel_package_name, kernel_versio=
n))
> > > > > > > > >      if modules:
> > > > > > > > >          d.appendVar('RDEPENDS:' + metapkg, ' '+'
> > > '.join(modules))
> > > > > > > > > +
> > > > > > > > > +    initrd_metapkg =3D
> > > > > d.getVar('KERNEL_INITRD_MODULES_META_PACKAGE')
> > > > > > > or ""
> > > > > > > > > +    initrd_module_regex =3D
> > > d.getVar('KERNEL_INITRD_MODULES_REGEX')
> > > > > or
> > > > > > > ""
> > > > > > > > > +    if (initrd_metapkg !=3D "") and (initrd_module_regex=
 !=3D
> ""):
> > > > > > > > > +        initrd_module_regex =3D
> re.compile(initrd_module_regex)
> > > > > > > > > +        initrd_modules =3D []
> > > > > > > > > +        for module in modules:
> > > > > > > > > +            files =3D d.getVar('FILES:' + module)
> > > > > > > > > +            m =3D re.match(initrd_module_regex, files)
> > > > > > > > > +            if m:
> > > > > > > > > +                initrd_modules.append(module)
> > > > > > > > > +
> > > > > > > > > +        if initrd_modules:
> > > > > > > > > +            d.appendVar('RDEPENDS:' + initrd_metapkg, '
> '+'
> > > > > > > '.join(initrd_modules))
> > > > > > > > >  }
> > > > > > > > >
> > > > > > > > >  do_package[vardeps] +=3D '${@" ".join(map(lambda s:
> > > "module_conf_"
> > > > > + s,
> > > > > > > (d.getVar("KERNEL_MODULE_PROBECONF") or "").split()))}'
> > > > > > > > > diff --git a/meta/classes-recipe/kernel.bbclass
> > > > > > > b/meta/classes-recipe/kernel.bbclass
> > > > > > > > > index 36ce659762..3dcaebcaed 100644
> > > > > > > > > --- a/meta/classes-recipe/kernel.bbclass
> > > > > > > > > +++ b/meta/classes-recipe/kernel.bbclass
> > > > > > > > > @@ -695,13 +695,14 @@ EXPORT_FUNCTIONS do_compile
> > > > > do_transform_kernel
> > > > > > > do_transform_bundled_initramfs d
> > > > > > > > >
> > > > > > > > >  # kernel-base becomes kernel-${KERNEL_VERSION}
> > > > > > > > >  # kernel-image becomes kernel-image-${KERNEL_VERSION}
> > > > > > > > > -PACKAGES =3D "${KERNEL_PACKAGE_NAME}
> ${KERNEL_PACKAGE_NAME}-base
> > > > > > > ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image
> > > > > > > ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules
> > > > > > > ${KERNEL_PACKAGE_NAME}-dbg"
> > > > > > > > > +PACKAGES =3D "${KERNEL_PACKAGE_NAME}
> ${KERNEL_PACKAGE_NAME}-base
> > > > > > > ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image
> > > > > > > ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules
> > > > > > > ${KERNEL_PACKAGE_NAME}-initrd-modules
> ${KERNEL_PACKAGE_NAME}-dbg"
> > > > > > > > >  FILES:${PN} =3D ""
> > > > > > > > >  FILES:${KERNEL_PACKAGE_NAME}-base =3D
> > > > > > > "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.ord=
er
> > > > > > >
> ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin
> > > > > > >
> > > > >
> > >
> ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin.modinfo"
> > > > > > > > >  FILES:${KERNEL_PACKAGE_NAME}-image =3D ""
> > > > > > > > >  FILES:${KERNEL_PACKAGE_NAME}-dev =3D
> > > > > "/${KERNEL_IMAGEDEST}/System.map*
> > > > > > > /${KERNEL_IMAGEDEST}/Module.symvers*
> /${KERNEL_IMAGEDEST}/config*
> > > > > > > ${KERNEL_SRC_PATH}
> > > > > ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
> > > > > > > > >  FILES:${KERNEL_PACKAGE_NAME}-vmlinux =3D
> > > > > > > "/${KERNEL_IMAGEDEST}/vmlinux-${KERNEL_VERSION_NAME}"
> > > > > > > > >  FILES:${KERNEL_PACKAGE_NAME}-modules =3D ""
> > > > > > > > > +FILES:${KERNEL_PACKAGE_NAME}-initrd-modules =3D ""
> > > > > > > > >  FILES:${KERNEL_PACKAGE_NAME}-dbg =3D "/usr/lib/debug
> > > /usr/src/debug"
> > > > > > > > >  RDEPENDS:${KERNEL_PACKAGE_NAME} =3D
> > > "${KERNEL_PACKAGE_NAME}-base (=3D
> > > > > > > ${EXTENDPKGV})"
> > > > > > > > >  # Allow machines to override this dependency if kernel
> image
> > > > > files are
> > > > > > > > > @@ -716,7 +717,9 @@ ALLOW_EMPTY:${KERNEL_PACKAGE_NAME} =
=3D
> "1"
> > > > > > > > >  ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-base =3D "1"
> > > > > > > > >  ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-image =3D "1"
> > > > > > > > >  ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-modules =3D "1"
> > > > > > > > > +ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-initrd-modules =3D "1=
"
> > > > > > > > >  DESCRIPTION:${KERNEL_PACKAGE_NAME}-modules =3D "Kernel
> modules
> > > meta
> > > > > > > package"
> > > > > > > > > +DESCRIPTION:${KERNEL_PACKAGE_NAME}-initrd-modules =3D
> "Kernel
> > > initrd
> > > > > > > modules meta package"
> > > > > > > > >
> > > > > > > > >  pkg_postinst:${KERNEL_PACKAGE_NAME}-base () {
> > > > > > > > >     if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
> > > > > > > > > diff --git a/meta/classes-recipe/module.bbclass
> > > > > > > b/meta/classes-recipe/module.bbclass
> > > > > > > > > index f2f0b25a2d..51f864f1f9 100644
> > > > > > > > > --- a/meta/classes-recipe/module.bbclass
> > > > > > > > > +++ b/meta/classes-recipe/module.bbclass
> > > > > > > > > @@ -86,3 +86,40 @@ EXPORT_FUNCTIONS do_compile do_install
> > > > > > > > >  KERNEL_MODULES_META_PACKAGE =3D "${PN}"
> > > > > > > > >  FILES:${PN} =3D ""
> > > > > > > > >  ALLOW_EMPTY:${PN} =3D "1"
> > > > > > > > > +
> > > > > > > > > +# subset of kernel modules needed in initrd, to e.g. mou=
nt
> > > rootfs
> > > > > > > from block device
> > > > > > > > > +KERNEL_INITRD_MODULES_META_PACKAGE ?=3D "${@
> > > > > > > d.getVar("KERNEL_PACKAGE_NAME") or "kernel" }-initrd-modules"
> > > > > > > > > +
> > > > > > > > > +# match regex to path or file name. E.g. include all
> drivers
> > > with
> > > > > > > files in path /drivers/ata/
> > > > > > > > > +KERNEL_INITRD_MODULES_REGEX ?=3D "(.*)(\
> > > > > > > > > +/drivers/acpi/|\
> > > > > > > > > +/drivers/ata/|\
> > > > > > > > > +/drivers/block/|\
> > > > > > > > > +/drivers/cdrom/|\
> > > > > > > > > +/drivers/char/hw_random/|\
> > > > > > > > > +/drivers/char/tpm/|\
> > > > > > > > > +/drivers/char/|\
> > > > > > > > > +/drivers/crypto/|\
> > > > > > > > > +/drivers/dax/|\
> > > > > > > > > +/drivers/firmware/arm_scmi/|\
> > > > > > > > > +/drivers/gpu/drm/|\
> > > > > > > > > +/drivers/md/|\
> > > > > > > > > +/drivers/mmc/|\
> > > > > > > > > +/drivers/mtd/|\
> > > > > > > > > +/drivers/nvdimm/|\
> > > > > > > > > +/drivers/nvme/|\
> > > > > > > > > +/drivers/pci/|\
> > > > > > > > > +/drivers/scsi/|\
> > > > > > > > > +/drivers/tee/|\
> > > > > > > > > +/drivers/tty/serial/|\
> > > > > > > > > +/drivers/virtio/|\
> > > > > > > > > +/drivers/watchdog/|\
> > > > > > > > > +/kernel/arch/|\
> > > > > > > > > +/kernel/block/|\
> > > > > > > > > +/kernel/crypto/|\
> > > > > > > > > +/kernel/fs/|\
> > > > > > > > > +/kernel/lib/\
> > > > > > > > > +)(.*)"
> > > > > > > > > +
> > > > > > > > > +FILES:${PN}-initrd =3D ""
> > > > > > > > > +ALLOW_EMPTY:${PN}-initrd =3D "1"
> > > > > > > >
> > > > > > > > What is the difference between the variable defined in
> > > kernel-module-
> > > > > > > > split.bbclass and this one in module.bbclass? Do we
> need/want to
> > > > > > > > separate but seemingly similar definitions?
> > > > > > >
> > > > > > > One is for kernel compilation and in-tree drivers, the other
> is for
> > > > > > > out-of-tree modules.
> > > > > > >
> > > > > > > The "kernel-modules" meta package is handled this way too, wi=
th
> > > > > > > duplication in both.
> > > > > > >
> > > > > > > Bruce says this should be moved to linux-yocto kernel recipe,
> > > > > > > which IMO breaks the use of kernel-initrd-modules for vendor
> kernel
> > > > > recipes
> > > > > > > outside of oe-core. I'd rather support them too to e.g. more
> easily
> > > > > boot
> > > > > > > qemu or run oeqa selftests with qemu.
> > > > > > >
> > > > > >
> > > > > > That's not quite what I said (but it is close), I said it
> shouldn't
> > > be
> > > > > > defined
> > > > > > at the base with no requirement opt-in from a recipe (even if
> this
> > > way
> > > > > > of constructing an initrd with the modules is not the default).
> It
> > > is a (
> > > > > > weak)
> > > > > > binding to specific kernel versions and directory layouts, but
> it is
> > > a
> > > > > > binding
> > > > > > none the less. If it sits at the base in the classes no one wil=
l
> ever
> > > > > look
> > > > > > at
> > > > > > it or even know that it should be considered.
> > > > > >
> > > > > > My suggestion was not that it should only be in linux-yocto (bu=
t
> I'd
> > > > > > insist on overriding it or doing it slightly differently in
> > > linux-yocto),
> > > > > > I was saying that it I think  that the two definitions are far =
to
> > > similar
> > > > > > and even if there remain two definitions, they should be moved
> > > > > > into a .inc file.
> > > > >
> > > > > Actually the duplication is a bug. All duplication in
> module.bbclass
> > > can be
> > > > > removed since it includes kernel-module-split.bbclass. Both
> > > kernel.bbclass
> > > > > and
> > > > > module.bbclass include kernel-module-split.bbclass. Sorry about
> this.
> > > > > I must have stopped half way when moving things there.
> > > > >
> > > > > Sending v4 with this fixed soon.
> > > > >
> > > > > > Any kernel recipe that wants to build an initrd like this can
> opt-in
> > > by
> > > > > > including the .inc, and/or creating their own definition.
> > > > >
> > > > > This I don't get. I think the kernel.bbclass and module.bbclass
> should
> > > > > work out of the box with sane defaults. The kernel recipes can
> override
> > > > > and adjust these as they see fit. Yes there is a dependency to so=
me
> > > kernel
> > > > > APIs (kernel module install paths) which can change, but those ha=
ve
> > > been
> > > > > stable for, over 25 years (as long as I have been compiling
> kernels)?
> > > > >
> > > > > For full control, initrd recipe maintainers can define the exact
> set
> > > > > of kernel and other binary packages to install which makes the
> recipe
> > > > > kernel config and machine specific.
> > > > >
> > > > > I don't think moving the definitions to a linux-yocto side .inc
> file
> > > > > and then using that as basis in non-core kernel recipes is good.
> The
> > > > > kernel.bbclass and module.bbclass would not work independently
> anymore
> > > > > and require meta/recipes-kernel/linux/ side .inc file for working
> > > defaults.
> > > > > Or should the .inc file live in meta/conf/distro/include?
> > > > >
> > > >
> > > > Let me be clear. I am not saying "linux-yocto" here. I said a ".inc=
"
> > > file.
> > > >
> > > > Put that .inc file in a common directory and call it something like
> > > > initrd-kernel-<foo>.inc, recipes include that .inc file to opt into
> the
> > > > behaviour and get the base definition if they want it.
> > >
> > > Ok I will do this in v5.
> > >
> > > > This modular based initrd isn't going to be the default, so it has
> > > > to be opt-in anyway. So put the opt-in and the definitions in a .in=
c
> > > > file, a recipe including it, opts-in.
> > >
> > > I think this should be the default on most machines which use
> > > core-image-initramfs-boot in oe-core.
> >
> >
> > I'll disagree on that point, but in the end, it isn't a hill that
> > is worth climbing (for me). If that's the way the default policy
> > goes, I'll just roll with it.
> >
> > > genericarm64, beagleplay etc machines already for install of
> > > "kernel-modules"
> > > to all images, including core-image-initramfs-boot:
> > >
> > > $ git grep MACHINE_EXTRA_RRECOMMENDS meta/conf/machine
> > > meta-yocto-bsp/conf/machine/ | grep kernel-modules
> > >
> meta-yocto-bsp/conf/machine/beaglebone-yocto.conf:MACHINE_EXTRA_RRECOMMEN=
DS
> > > =3D "kernel-modules"
> > >
> meta-yocto-bsp/conf/machine/genericarm64.conf:MACHINE_EXTRA_RRECOMMENDS +=
=3D
> > > "kernel-modules"
> > >
> meta-yocto-bsp/conf/machine/include/genericx86-common.inc:MACHINE_EXTRA_R=
RECOMMENDS
> > > +=3D "kernel-modules linux-firmware"
> > >
> meta/conf/machine/include/loongarch/qemuloongarch.inc:MACHINE_EXTRA_RRECO=
MMENDS
> > > +=3D " kernel-modules"
> > >
> meta/conf/machine/include/riscv/qemuriscv.inc:MACHINE_EXTRA_RRECOMMENDS +=
=3D
> > > " kernel-modules"
> > > meta/conf/machine/qemuppc64.conf:MACHINE_EXTRA_RRECOMMENDS +=3D "
> > > kernel-modules"
> > >
> > Right, and that was by design.
> >
> > The philosophy has been that the kernel provider should understand
> > and control its configuration (since we are talking about embedded
> > devices here). Sure, those examples took the simplest path, and that
> > was their decision / tradeoff.
> >
> > We package all the modules individually (I'm stating the obvious,
> > since we all know this) so that they can be individually installed
> > and required for something that really wants to control the configurati=
on
> > tightly.
> >
> > In any machine / BSP that I build, the configuration is on purpose
> > and if I want to install individual modules, I'll do that, otherwise,
> > I trust my configuration and take all the modules.
> >
> > What you have is something in the middle, and why I still think it
> > needs to be opt-in. BSP creators need to understand their
> > configuration and tune it. Having something down at the packaging
> > level pick and choose which modules on their behalf means that
> > they are relying on something that needs to be discovered and
> > tweaked (versus the "all of it" or "you chose your own" as it was
> > before).
>
> By making the kernel-initrd-modules meta package optional and opt-in,
> we again make the initrd image recipe depend on the opt-in feature.
>
>
That's exactly what I'm looking for and consider it a good thing :)

I need to bind the initrd recipe to a distro level feature and
> then the same for kernel side changes because the "kernel-initrd-modules"
> meta package may not exist and thus it can break the build. Solution
> is another abstraction in distro features. I think producing the
> "kernel-initrd-modules" meta package should be default in the kernel
> bbclasses. It may not get used but the overhead is really small.
>
> This is similar to "kernel-modules" meta package. It is always there
> and can safely be in MACHINE_EXTRA_RRECOMMENDS without any additional
> guards like a machine or distro feature. Also BSP layer image recipes
> use this.
>

Except that it is much different in that it is not the BSP kernel
configuration
that is controlling what is chosen for the meta-package. It is not the
meta package itself that I have an issue with.


>
> This is the interface between kernel recipes providing kernel and module
> packages and the image recipe consuming them. I'd like the image recipe
> consumer to be simpler and less dependent kernel config and driver
> packaging
> details.
>

It is the selection mechanism that I disagree with. This is one
area that we need to be very explicit and have that fine grained control.


>
> > > Some qemu machines don't and that causes issues since
> > > initrd is not flexible to boot even slightly different configurations=
,
> > > like block device emulation moved from scsi to virtio.
> > > This causes issues with oeqa selftests when small kernel or qemuboot
> > > differences break tests.
> > >
> >
> > And we'll continue to do that, as all the boot methods and kernels
> > need to be tested. But I agree, there are pros and cons to the
> > various methods.
> >
> > > initrd itself is optional, but in core-image-initramfs-boot I made
> > > including "kernel-initrd-modules" the default. To me this makes sense=
.
> > >
> > > Kernels for different machines can enable drivers as modules or as
> built-in
> > > but the initrd config stays the same and will mostly just work. I thi=
nk
> > > this is a good default.
> > >
> > >
> > It is just that behaviour which is why I'm saying it should be
> > explicit and opt-in. If they change their configuration it should
> > be with a direct line of sight to how the various components
> > consume it.
> >
> > Preferably not "I have a custom driver, I need it to boot, I'm
> > now building it as a module" .. and then wondering why it isn't
> > picked up in the initrd. If they had to opt-in, they'll already be
> > aware of the mechanism that is selecting their modules over
> > and above what their kernel configuration dictates.
>
> If the custom and vendor specific driver installs to correct paths
> which fall into block etc driver regex then these already get picked up b=
y
> the
> initrd regex then everything will just work by default. Compiling the
> driver
> built-in or as module will just work with the default
> core-image-initramfs-boot
> initrd and core-image-base etc images. Boot without initrd may fail but
> with it
> things just work.
>

That vendor needs to understand what they are relying on. The same
way that their packages from any other recipe don't automatically get
built and used in an image with them explicitly asking for them in their
image recipes.

That is my point, I don't think this should just "automatically work". It
should have a simple way to opt-in, but behind the scenes magic in
this particular area is just going to cause support issues.


> If this feature is opt-in or specific to linux-yocto recipe, it again
> makes the
> initrd's machine and kernel config specific. The opt-in setup needs to be
> made
> for kernel and for initrd.


> For real products all details need to be reviewed and customized but
> developers
> need "good enough and simple" starting points and that's where the
> "kernel-modules" and "kernel-initrd-modules" meta packages help.
>

After 14 years of working for an OSV, I'm familiar with how a real
product is put together. I've also supported many customers through
the issues I'm describing above. I'm not just describing this theoretically=
,
I've also spent the hours trying to figure out silent boot death, and
the zillion variations of that.


> They can more easily boot the generic images, see what drivers got loaded
> at boot
> and remove all the rest. Then move that setup into kernel config etc. The=
y
> can
> also test different block devices and file systems.
>
> The amount of optimisation done depends on what the priorities are. Gain
> vs effort.
>
> > > And then "kernel-initrd-modules" are much smaller than
> "kernel-modules".
> > > Still too big for real products but better than nothing. For
> > > genericarm64 this reduced initrd image size from 200 Mb to 54 Mb.
> >
> > Definitely a valid point / improvement. I'm again back to saying it
> > just has to be explicit. The same way that many (most?) people
> > don't want or use linux-yocto as production, we have to design
> > our configurations as something to be opt-in and something that
> > is clear it needs to be tweaked for production.
> >
> > We aren't far off in our view on this.  Most of this looks really
> > good to me, and is a good step forward. I think that our
> > different point of view is about the breadth of the types of
> > kernels, machines, boot methods, products, etc, that are built
> > on top and how to enable this mechanism.
>
> If this feature is opt-in and not the default in kernel.bbclass, then IMO
> the result is again machine/build/config specific initrd image recipes
> which I wanted to avoid.
>

Having a distro feature that enables it, and then having the defaults
kick in, shouldn't be too high of a bar for someone to look, read the
descriptions and decide that's what they want. After that opt-in, everythin=
g
should look pretty much like you are proposing.

Bruce


> Cheers,
>
> -Mikko
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000040c5e60633718659
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 22, 2025 at 6:18=
=E2=80=AFAM Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@linaro.org">mik=
ko.rapeli@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Hi,<br>
<br>
On Fri, Apr 11, 2025 at 09:39:31AM -0400, Bruce Ashfield wrote:<br>
&gt; On Fri, Apr 11, 2025 at 9:12=E2=80=AFAM Mikko Rapeli &lt;<a href=3D"ma=
ilto:mikko.rapeli@linaro.org" target=3D"_blank">mikko.rapeli@linaro.org</a>=
&gt;<br>
&gt; wrote:<br>
&gt; &gt; On Fri, Apr 11, 2025 at 08:52:24AM -0400, Bruce Ashfield wrote:<b=
r>
&gt; &gt; &gt; On Fri, Apr 11, 2025 at 3:48=E2=80=AFAM Mikko Rapeli &lt;<a =
href=3D"mailto:mikko.rapeli@linaro.org" target=3D"_blank">mikko.rapeli@lina=
ro.org</a>&gt;<br>
&gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt; On Thu, Apr 10, 2025 at 09:15:02AM -0400, Bruce Ashfiel=
d wrote:<br>
&gt; &gt; &gt; &gt; &gt; On Thu, Apr 10, 2025 at 9:00=E2=80=AFAM Mikko Rape=
li via<br>
&gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targ=
et=3D"_blank">lists.openembedded.org</a><br>
&gt; &gt; &gt; &gt; &gt; &lt;mikko.rapeli=3D<a href=3D"mailto:linaro.org@li=
sts.openembedded.org" target=3D"_blank">linaro.org@lists.openembedded.org</=
a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; On Thu, Apr 10, 2025 at 01:42:12PM +0100, Ric=
hard Purdie wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; On Fri, 2025-04-04 at 19:29 +0300, Mikko=
 Rapeli via<br>
&gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"http://lists.openembedded.org" rel=
=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; At the moment linux-yocto kernels f=
or various architectures<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; are not very modular and a lot of d=
rivers are built into the<br>
&gt; &gt; kernel<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; even when they are not needed at ru=
ntime. These make the main<br>
&gt; &gt; &gt; &gt; kernel<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; binary big and slow to boot. This a=
lso impacts udev in<br>
&gt; &gt; userspace<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; which takes a long time processing =
events from all these built<br>
&gt; &gt; in<br>
&gt; &gt; &gt; &gt; &gt; &gt; drivers,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; for example when udev runs in initr=
d.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Then constructing the initrd is ver=
y device and kernel<br>
&gt; &gt; &gt; &gt; configuration<br>
&gt; &gt; &gt; &gt; &gt; &gt; specific.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; initrd image needs explicitly defin=
e which binary packages to<br>
&gt; &gt; &gt; &gt; install<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; to avoid pulling in complex depende=
ncies. A full set of kernel<br>
&gt; &gt; &gt; &gt; modules<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; via kernel-modules meta package is =
too big for initrd and most<br>
&gt; &gt; of<br>
&gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; drivers are not needed for use case=
s like &quot;just load modules to<br>
&gt; &gt; &gt; &gt; mount<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; main rootfs&quot;. Then the initrd =
configuration breaks if kernel<br>
&gt; &gt; driver<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; is built into the kernel since the =
binary package doesn&#39;t<br>
&gt; &gt; exist.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Introduce kernel-initrd-modules met=
a package to solve these<br>
&gt; &gt; &gt; &gt; problems.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; The meta package adds dependencies =
to real kernel modules<br>
&gt; &gt; based on<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; the kernel module file paths so tha=
t it will include several<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; kernel subsystems and their drivers=
 which are often needed to<br>
&gt; &gt; find<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; main rootfs from some block device.=
 This works when drivers are<br>
&gt; &gt; &gt; &gt; built<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; as modules but does not break if dr=
ivers are built into the<br>
&gt; &gt; kernel.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; The resulting initrd is also smalle=
r since only a subset of<br>
&gt; &gt; drivers<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; are needed for &quot;mount the root=
fs&quot; usecase. Tested on<br>
&gt; &gt; genericarm64<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; kernel and qemu and AMD KV260 HW.<b=
r>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Signed-off-by: Mikko Rapeli &lt;<a =
href=3D"mailto:mikko.rapeli@linaro.org" target=3D"_blank">mikko.rapeli@lina=
ro.org</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 .../kernel-module-split.bbcla=
ss=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 48<br>
&gt; &gt; &gt; &gt; +++++++++++++++++++<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 meta/classes-recipe/kernel.bb=
class=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 +-<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 meta/classes-recipe/module.bb=
class=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 37<br>
&gt; &gt; ++++++++++++++<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 3 files changed, 89 insertion=
s(+), 1 deletion(-)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; diff --git a/meta/classes-recipe/ke=
rnel-module-split.bbclass<br>
&gt; &gt; &gt; &gt; &gt; &gt; b/meta/classes-recipe/kernel-module-split.bbc=
lass<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; index 9487365eb7..101c5cd959 100644=
<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; --- a/meta/classes-recipe/kernel-mo=
dule-split.bbclass<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +++ b/meta/classes-recipe/kernel-mo=
dule-split.bbclass<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; @@ -42,6 +42,40 @@ KERNEL_MODULE_PA=
CKAGE_PREFIX ?=3D &quot;&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 KERNEL_MODULE_PACKAGE_SUFFIX =
?=3D &quot;-${KERNEL_VERSION}&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 KERNEL_MODULE_PROVIDE_VIRTUAL=
 ?=3D &quot;1&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +# subset of kernel modules needed =
in initrd, to e.g. mount<br>
&gt; &gt; rootfs<br>
&gt; &gt; &gt; &gt; &gt; &gt; from block device<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +KERNEL_INITRD_MODULES_META_PACKAGE=
 ?=3D &quot;${@<br>
&gt; &gt; &gt; &gt; &gt; &gt; d.getVar(&quot;KERNEL_PACKAGE_NAME&quot;) or =
&quot;kernel&quot; }-initrd-modules&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +# match regex to path or file name=
. E.g. include all drivers<br>
&gt; &gt; with<br>
&gt; &gt; &gt; &gt; &gt; &gt; files in path /drivers/ata/<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +KERNEL_INITRD_MODULES_REGEX ?=3D &=
quot;(.*)(\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/acpi/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/ata/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/block/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/cdrom/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/char/hw_random/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/char/tpm/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/char/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/crypto/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/dax/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/firmware/arm_scmi/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/gpu/drm/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/md/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/mmc/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/mtd/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/nvdimm/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/nvme/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/pci/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/scsi/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/tee/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/tty/serial/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/virtio/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/watchdog/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/kernel/arch/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/kernel/block/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/kernel/crypto/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/kernel/fs/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/kernel/lib/\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +)(.*)&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 python split_kernel_module_pa=
ckages () {<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 import re<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; @@ -183,6 +217,20 @@ python split_k=
ernel_module_packages () {<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 modules =3D do_=
split_packages(d,<br>
&gt; &gt; &gt; &gt; &gt; &gt; root=3D&#39;${nonarch_base_libdir}/modules&#3=
9;, file_regex=3Dmodule_regex,<br>
&gt; &gt; &gt; &gt; &gt; &gt; output_pattern=3Dmodule_pattern, description=
=3D&#39;%s kernel module&#39;,<br>
&gt; &gt; &gt; &gt; &gt; &gt; postinst=3Dpostinst, postrm=3Dpostrm, recursi=
ve=3DTrue,<br>
&gt; &gt; hook=3Dfrob_metadata,<br>
&gt; &gt; &gt; &gt; &gt; &gt; extra_depends=3D&#39;%s-%s&#39; % (kernel_pac=
kage_name, kernel_version))<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 if modules:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d=
.appendVar(&#39;RDEPENDS:&#39; + metapkg, &#39; &#39;+&#39;<br>
&gt; &gt; &#39;.join(modules))<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 initrd_metapkg =3D<b=
r>
&gt; &gt; &gt; &gt; d.getVar(&#39;KERNEL_INITRD_MODULES_META_PACKAGE&#39;)<=
br>
&gt; &gt; &gt; &gt; &gt; &gt; or &quot;&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 initrd_module_regex =
=3D<br>
&gt; &gt; d.getVar(&#39;KERNEL_INITRD_MODULES_REGEX&#39;)<br>
&gt; &gt; &gt; &gt; or<br>
&gt; &gt; &gt; &gt; &gt; &gt; &quot;&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 if (initrd_metapkg !=
=3D &quot;&quot;) and (initrd_module_regex !=3D &quot;&quot;):<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 initrd=
_module_regex =3D re.compile(initrd_module_regex)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 initrd=
_modules =3D []<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for mo=
dule in modules:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 files =3D d.getVar(&#39;FILES:&#39; + module)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 m =3D re.match(initrd_module_regex, files)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if m:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 initrd_modules.append(module)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ini=
trd_modules:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 d.appendVar(&#39;RDEPENDS:&#39; + initrd_metapkg, &#39; &#39;+&#39;=
<br>
&gt; &gt; &gt; &gt; &gt; &gt; &#39;.join(initrd_modules))<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 do_package[vardeps] +=3D &#39=
;${@&quot; &quot;.join(map(lambda s:<br>
&gt; &gt; &quot;module_conf_&quot;<br>
&gt; &gt; &gt; &gt; + s,<br>
&gt; &gt; &gt; &gt; &gt; &gt; (d.getVar(&quot;KERNEL_MODULE_PROBECONF&quot;=
) or &quot;&quot;).split()))}&#39;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; diff --git a/meta/classes-recipe/ke=
rnel.bbclass<br>
&gt; &gt; &gt; &gt; &gt; &gt; b/meta/classes-recipe/kernel.bbclass<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; index 36ce659762..3dcaebcaed 100644=
<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; --- a/meta/classes-recipe/kernel.bb=
class<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +++ b/meta/classes-recipe/kernel.bb=
class<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; @@ -695,13 +695,14 @@ EXPORT_FUNCTI=
ONS do_compile<br>
&gt; &gt; &gt; &gt; do_transform_kernel<br>
&gt; &gt; &gt; &gt; &gt; &gt; do_transform_bundled_initramfs d<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 # kernel-base becomes kernel-=
${KERNEL_VERSION}<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 # kernel-image becomes kernel=
-image-${KERNEL_VERSION}<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -PACKAGES =3D &quot;${KERNEL_PACKAG=
E_NAME} ${KERNEL_PACKAGE_NAME}-base<br>
&gt; &gt; &gt; &gt; &gt; &gt; ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKA=
GE_NAME}-image<br>
&gt; &gt; &gt; &gt; &gt; &gt; ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_N=
AME}-modules<br>
&gt; &gt; &gt; &gt; &gt; &gt; ${KERNEL_PACKAGE_NAME}-dbg&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +PACKAGES =3D &quot;${KERNEL_PACKAG=
E_NAME} ${KERNEL_PACKAGE_NAME}-base<br>
&gt; &gt; &gt; &gt; &gt; &gt; ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKA=
GE_NAME}-image<br>
&gt; &gt; &gt; &gt; &gt; &gt; ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_N=
AME}-modules<br>
&gt; &gt; &gt; &gt; &gt; &gt; ${KERNEL_PACKAGE_NAME}-initrd-modules ${KERNE=
L_PACKAGE_NAME}-dbg&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 FILES:${PN} =3D &quot;&quot;<=
br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 FILES:${KERNEL_PACKAGE_NAME}-=
base =3D<br>
&gt; &gt; &gt; &gt; &gt; &gt; &quot;${nonarch_base_libdir}/modules/${KERNEL=
_VERSION}/modules.order<br>
&gt; &gt; &gt; &gt; &gt; &gt; ${nonarch_base_libdir}/modules/${KERNEL_VERSI=
ON}/modules.builtin<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin.=
modinfo&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 FILES:${KERNEL_PACKAGE_NAME}-=
image =3D &quot;&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 FILES:${KERNEL_PACKAGE_NAME}-=
dev =3D<br>
&gt; &gt; &gt; &gt; &quot;/${KERNEL_IMAGEDEST}/System.map*<br>
&gt; &gt; &gt; &gt; &gt; &gt; /${KERNEL_IMAGEDEST}/Module.symvers* /${KERNE=
L_IMAGEDEST}/config*<br>
&gt; &gt; &gt; &gt; &gt; &gt; ${KERNEL_SRC_PATH}<br>
&gt; &gt; &gt; &gt; ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build&=
quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 FILES:${KERNEL_PACKAGE_NAME}-=
vmlinux =3D<br>
&gt; &gt; &gt; &gt; &gt; &gt; &quot;/${KERNEL_IMAGEDEST}/vmlinux-${KERNEL_V=
ERSION_NAME}&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 FILES:${KERNEL_PACKAGE_NAME}-=
modules =3D &quot;&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +FILES:${KERNEL_PACKAGE_NAME}-initr=
d-modules =3D &quot;&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 FILES:${KERNEL_PACKAGE_NAME}-=
dbg =3D &quot;/usr/lib/debug<br>
&gt; &gt; /usr/src/debug&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 RDEPENDS:${KERNEL_PACKAGE_NAM=
E} =3D<br>
&gt; &gt; &quot;${KERNEL_PACKAGE_NAME}-base (=3D<br>
&gt; &gt; &gt; &gt; &gt; &gt; ${EXTENDPKGV})&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 # Allow machines to override =
this dependency if kernel image<br>
&gt; &gt; &gt; &gt; files are<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; @@ -716,7 +717,9 @@ ALLOW_EMPTY:${K=
ERNEL_PACKAGE_NAME} =3D &quot;1&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 ALLOW_EMPTY:${KERNEL_PACKAGE_=
NAME}-base =3D &quot;1&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 ALLOW_EMPTY:${KERNEL_PACKAGE_=
NAME}-image =3D &quot;1&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 ALLOW_EMPTY:${KERNEL_PACKAGE_=
NAME}-modules =3D &quot;1&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}=
-initrd-modules =3D &quot;1&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 DESCRIPTION:${KERNEL_PACKAGE_=
NAME}-modules =3D &quot;Kernel modules<br>
&gt; &gt; meta<br>
&gt; &gt; &gt; &gt; &gt; &gt; package&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +DESCRIPTION:${KERNEL_PACKAGE_NAME}=
-initrd-modules =3D &quot;Kernel<br>
&gt; &gt; initrd<br>
&gt; &gt; &gt; &gt; &gt; &gt; modules meta package&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 pkg_postinst:${KERNEL_PACKAGE=
_NAME}-base () {<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0if [ ! -e &quot;=
$D/lib/modules/${KERNEL_VERSION}&quot; ]; then<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; diff --git a/meta/classes-recipe/mo=
dule.bbclass<br>
&gt; &gt; &gt; &gt; &gt; &gt; b/meta/classes-recipe/module.bbclass<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; index f2f0b25a2d..51f864f1f9 100644=
<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; --- a/meta/classes-recipe/module.bb=
class<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +++ b/meta/classes-recipe/module.bb=
class<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; @@ -86,3 +86,40 @@ EXPORT_FUNCTIONS=
 do_compile do_install<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 KERNEL_MODULES_META_PACKAGE =
=3D &quot;${PN}&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 FILES:${PN} =3D &quot;&quot;<=
br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 ALLOW_EMPTY:${PN} =3D &quot;1=
&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +# subset of kernel modules needed =
in initrd, to e.g. mount<br>
&gt; &gt; rootfs<br>
&gt; &gt; &gt; &gt; &gt; &gt; from block device<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +KERNEL_INITRD_MODULES_META_PACKAGE=
 ?=3D &quot;${@<br>
&gt; &gt; &gt; &gt; &gt; &gt; d.getVar(&quot;KERNEL_PACKAGE_NAME&quot;) or =
&quot;kernel&quot; }-initrd-modules&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +# match regex to path or file name=
. E.g. include all drivers<br>
&gt; &gt; with<br>
&gt; &gt; &gt; &gt; &gt; &gt; files in path /drivers/ata/<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +KERNEL_INITRD_MODULES_REGEX ?=3D &=
quot;(.*)(\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/acpi/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/ata/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/block/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/cdrom/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/char/hw_random/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/char/tpm/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/char/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/crypto/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/dax/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/firmware/arm_scmi/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/gpu/drm/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/md/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/mmc/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/mtd/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/nvdimm/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/nvme/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/pci/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/scsi/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/tee/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/tty/serial/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/virtio/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/drivers/watchdog/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/kernel/arch/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/kernel/block/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/kernel/crypto/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/kernel/fs/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +/kernel/lib/\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +)(.*)&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +FILES:${PN}-initrd =3D &quot;&quot=
;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +ALLOW_EMPTY:${PN}-initrd =3D &quot=
;1&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; What is the difference between the varia=
ble defined in<br>
&gt; &gt; kernel-module-<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; split.bbclass and this one in module.bbc=
lass? Do we need/want to<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; separate but seemingly similar definitio=
ns?<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; One is for kernel compilation and in-tree dri=
vers, the other is for<br>
&gt; &gt; &gt; &gt; &gt; &gt; out-of-tree modules.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; The &quot;kernel-modules&quot; meta package i=
s handled this way too, with<br>
&gt; &gt; &gt; &gt; &gt; &gt; duplication in both.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Bruce says this should be moved to linux-yoct=
o kernel recipe,<br>
&gt; &gt; &gt; &gt; &gt; &gt; which IMO breaks the use of kernel-initrd-mod=
ules for vendor kernel<br>
&gt; &gt; &gt; &gt; recipes<br>
&gt; &gt; &gt; &gt; &gt; &gt; outside of oe-core. I&#39;d rather support th=
em too to e.g. more easily<br>
&gt; &gt; &gt; &gt; boot<br>
&gt; &gt; &gt; &gt; &gt; &gt; qemu or run oeqa selftests with qemu.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; That&#39;s not quite what I said (but it is close)=
, I said it shouldn&#39;t<br>
&gt; &gt; be<br>
&gt; &gt; &gt; &gt; &gt; defined<br>
&gt; &gt; &gt; &gt; &gt; at the base with no requirement opt-in from a reci=
pe (even if this<br>
&gt; &gt; way<br>
&gt; &gt; &gt; &gt; &gt; of constructing an initrd with the modules is not =
the default). It<br>
&gt; &gt; is a (<br>
&gt; &gt; &gt; &gt; &gt; weak)<br>
&gt; &gt; &gt; &gt; &gt; binding to specific kernel versions and directory =
layouts, but it is<br>
&gt; &gt; a<br>
&gt; &gt; &gt; &gt; &gt; binding<br>
&gt; &gt; &gt; &gt; &gt; none the less. If it sits at the base in the class=
es no one will ever<br>
&gt; &gt; &gt; &gt; look<br>
&gt; &gt; &gt; &gt; &gt; at<br>
&gt; &gt; &gt; &gt; &gt; it or even know that it should be considered.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; My suggestion was not that it should only be in li=
nux-yocto (but I&#39;d<br>
&gt; &gt; &gt; &gt; &gt; insist on overriding it or doing it slightly diffe=
rently in<br>
&gt; &gt; linux-yocto),<br>
&gt; &gt; &gt; &gt; &gt; I was saying that it I think=C2=A0 that the two de=
finitions are far to<br>
&gt; &gt; similar<br>
&gt; &gt; &gt; &gt; &gt; and even if there remain two definitions, they sho=
uld be moved<br>
&gt; &gt; &gt; &gt; &gt; into a .inc file.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Actually the duplication is a bug. All duplication in m=
odule.bbclass<br>
&gt; &gt; can be<br>
&gt; &gt; &gt; &gt; removed since it includes kernel-module-split.bbclass. =
Both<br>
&gt; &gt; kernel.bbclass<br>
&gt; &gt; &gt; &gt; and<br>
&gt; &gt; &gt; &gt; module.bbclass include kernel-module-split.bbclass. Sor=
ry about this.<br>
&gt; &gt; &gt; &gt; I must have stopped half way when moving things there.<=
br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Sending v4 with this fixed soon.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Any kernel recipe that wants to build an initrd li=
ke this can opt-in<br>
&gt; &gt; by<br>
&gt; &gt; &gt; &gt; &gt; including the .inc, and/or creating their own defi=
nition.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; This I don&#39;t get. I think the kernel.bbclass and mo=
dule.bbclass should<br>
&gt; &gt; &gt; &gt; work out of the box with sane defaults. The kernel reci=
pes can override<br>
&gt; &gt; &gt; &gt; and adjust these as they see fit. Yes there is a depend=
ency to some<br>
&gt; &gt; kernel<br>
&gt; &gt; &gt; &gt; APIs (kernel module install paths) which can change, bu=
t those have<br>
&gt; &gt; been<br>
&gt; &gt; &gt; &gt; stable for, over 25 years (as long as I have been compi=
ling kernels)?<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; For full control, initrd recipe maintainers can define =
the exact set<br>
&gt; &gt; &gt; &gt; of kernel and other binary packages to install which ma=
kes the recipe<br>
&gt; &gt; &gt; &gt; kernel config and machine specific.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I don&#39;t think moving the definitions to a linux-yoc=
to side .inc file<br>
&gt; &gt; &gt; &gt; and then using that as basis in non-core kernel recipes=
 is good. The<br>
&gt; &gt; &gt; &gt; kernel.bbclass and module.bbclass would not work indepe=
ndently anymore<br>
&gt; &gt; &gt; &gt; and require meta/recipes-kernel/linux/ side .inc file f=
or working<br>
&gt; &gt; defaults.<br>
&gt; &gt; &gt; &gt; Or should the .inc file live in meta/conf/distro/includ=
e?<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Let me be clear. I am not saying &quot;linux-yocto&quot; her=
e. I said a &quot;.inc&quot;<br>
&gt; &gt; file.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Put that .inc file in a common directory and call it somethi=
ng like<br>
&gt; &gt; &gt; initrd-kernel-&lt;foo&gt;.inc, recipes include that .inc fil=
e to opt into the<br>
&gt; &gt; &gt; behaviour and get the base definition if they want it.<br>
&gt; &gt;<br>
&gt; &gt; Ok I will do this in v5.<br>
&gt; &gt;<br>
&gt; &gt; &gt; This modular based initrd isn&#39;t going to be the default,=
 so it has<br>
&gt; &gt; &gt; to be opt-in anyway. So put the opt-in and the definitions i=
n a .inc<br>
&gt; &gt; &gt; file, a recipe including it, opts-in.<br>
&gt; &gt;<br>
&gt; &gt; I think this should be the default on most machines which use<br>
&gt; &gt; core-image-initramfs-boot in oe-core.<br>
&gt; <br>
&gt; <br>
&gt; I&#39;ll disagree on that point, but in the end, it isn&#39;t a hill t=
hat<br>
&gt; is worth climbing (for me). If that&#39;s the way the default policy<b=
r>
&gt; goes, I&#39;ll just roll with it.<br>
&gt; <br>
&gt; &gt; genericarm64, beagleplay etc machines already for install of<br>
&gt; &gt; &quot;kernel-modules&quot;<br>
&gt; &gt; to all images, including core-image-initramfs-boot:<br>
&gt; &gt;<br>
&gt; &gt; $ git grep MACHINE_EXTRA_RRECOMMENDS meta/conf/machine<br>
&gt; &gt; meta-yocto-bsp/conf/machine/ | grep kernel-modules<br>
&gt; &gt; meta-yocto-bsp/conf/machine/beaglebone-yocto.conf:MACHINE_EXTRA_R=
RECOMMENDS<br>
&gt; &gt; =3D &quot;kernel-modules&quot;<br>
&gt; &gt; meta-yocto-bsp/conf/machine/genericarm64.conf:MACHINE_EXTRA_RRECO=
MMENDS +=3D<br>
&gt; &gt; &quot;kernel-modules&quot;<br>
&gt; &gt; meta-yocto-bsp/conf/machine/include/genericx86-common.inc:MACHINE=
_EXTRA_RRECOMMENDS<br>
&gt; &gt; +=3D &quot;kernel-modules linux-firmware&quot;<br>
&gt; &gt; meta/conf/machine/include/loongarch/qemuloongarch.inc:MACHINE_EXT=
RA_RRECOMMENDS<br>
&gt; &gt; +=3D &quot; kernel-modules&quot;<br>
&gt; &gt; meta/conf/machine/include/riscv/qemuriscv.inc:MACHINE_EXTRA_RRECO=
MMENDS +=3D<br>
&gt; &gt; &quot; kernel-modules&quot;<br>
&gt; &gt; meta/conf/machine/qemuppc64.conf:MACHINE_EXTRA_RRECOMMENDS +=3D &=
quot;<br>
&gt; &gt; kernel-modules&quot;<br>
&gt; &gt;<br>
&gt; Right, and that was by design.<br>
&gt; <br>
&gt; The philosophy has been that the kernel provider should understand<br>
&gt; and control its configuration (since we are talking about embedded<br>
&gt; devices here). Sure, those examples took the simplest path, and that<b=
r>
&gt; was their decision / tradeoff.<br>
&gt; <br>
&gt; We package all the modules individually (I&#39;m stating the obvious,<=
br>
&gt; since we all know this) so that they can be individually installed<br>
&gt; and required for something that really wants to control the configurat=
ion<br>
&gt; tightly.<br>
&gt; <br>
&gt; In any machine / BSP that I build, the configuration is on purpose<br>
&gt; and if I want to install individual modules, I&#39;ll do that, otherwi=
se,<br>
&gt; I trust my configuration and take all the modules.<br>
&gt; <br>
&gt; What you have is something in the middle, and why I still think it<br>
&gt; needs to be opt-in. BSP creators need to understand their<br>
&gt; configuration and tune it. Having something down at the packaging<br>
&gt; level pick and choose which modules on their behalf means that<br>
&gt; they are relying on something that needs to be discovered and<br>
&gt; tweaked (versus the &quot;all of it&quot; or &quot;you chose your own&=
quot; as it was<br>
&gt; before).<br>
<br>
By making the kernel-initrd-modules meta package optional and opt-in,<br>
we again make the initrd image recipe depend on the opt-in feature.<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">That&#39;s exactly what I&#39;m looking for and consider i=
t a good thing :)</div></div><div><br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
I need to bind the initrd recipe to a distro level feature and<br>
then the same for kernel side changes because the &quot;kernel-initrd-modul=
es&quot;<br>
meta package may not exist and thus it can break the build. Solution<br>
is another abstraction in distro features. I think producing the<br>
&quot;kernel-initrd-modules&quot; meta package should be default in the ker=
nel<br>
bbclasses. It may not get used but the overhead is really small.<br>
<br>
This is similar to &quot;kernel-modules&quot; meta package. It is always th=
ere<br>
and can safely be in MACHINE_EXTRA_RRECOMMENDS without any additional<br>
guards like a machine or distro feature. Also BSP layer image recipes<br>
use this.<br></blockquote><div><br></div><div><div class=3D"gmail_default" =
style=3D"font-size:small">Except that it is much different in that it is no=
t the BSP kernel configuration</div><div class=3D"gmail_default" style=3D"f=
ont-size:small">that is controlling what is=C2=A0chosen for the meta-packag=
e. It is not the</div><div class=3D"gmail_default" style=3D"font-size:small=
">meta package itself that I have an issue with.</div></div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
This is the interface between kernel recipes providing kernel and module<br=
>
packages and the image recipe consuming them. I&#39;d like the image recipe=
<br>
consumer to be simpler and less dependent kernel config and driver packagin=
g<br>
details.<br></blockquote><div><br></div><div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">It is the selection mechanism that I disagree with=
. This is one</div><div class=3D"gmail_default" style=3D"font-size:small">a=
rea that we need to be very explicit and have that fine grained control.</d=
iv></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
<br>
&gt; &gt; Some qemu machines don&#39;t and that causes issues since<br>
&gt; &gt; initrd is not flexible to boot even slightly different configurat=
ions,<br>
&gt; &gt; like block device emulation moved from scsi to virtio.<br>
&gt; &gt; This causes issues with oeqa selftests when small kernel or qemub=
oot<br>
&gt; &gt; differences break tests.<br>
&gt; &gt;<br>
&gt; <br>
&gt; And we&#39;ll continue to do that, as all the boot methods and kernels=
<br>
&gt; need to be tested. But I agree, there are pros and cons to the<br>
&gt; various methods.<br>
&gt; <br>
&gt; &gt; initrd itself is optional, but in core-image-initramfs-boot I mad=
e<br>
&gt; &gt; including &quot;kernel-initrd-modules&quot; the default. To me th=
is makes sense.<br>
&gt; &gt;<br>
&gt; &gt; Kernels for different machines can enable drivers as modules or a=
s built-in<br>
&gt; &gt; but the initrd config stays the same and will mostly just work. I=
 think<br>
&gt; &gt; this is a good default.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; It is just that behaviour which is why I&#39;m saying it should be<br>
&gt; explicit and opt-in. If they change their configuration it should<br>
&gt; be with a direct line of sight to how the various components<br>
&gt; consume it.<br>
&gt; <br>
&gt; Preferably not &quot;I have a custom driver, I need it to boot, I&#39;=
m<br>
&gt; now building it as a module&quot; .. and then wondering why it isn&#39=
;t<br>
&gt; picked up in the initrd. If they had to opt-in, they&#39;ll already be=
<br>
&gt; aware of the mechanism that is selecting their modules over<br>
&gt; and above what their kernel configuration dictates.<br>
<br>
If the custom and vendor specific driver installs to correct paths<br>
which fall into block etc driver regex then these already get picked up by =
the<br>
initrd regex then everything will just work by default. Compiling the drive=
r<br>
built-in or as module will just work with the default core-image-initramfs-=
boot<br>
initrd and core-image-base etc images. Boot without initrd may fail but wit=
h it<br>
things just work.<br></blockquote><div><br></div><div><div class=3D"gmail_d=
efault" style=3D"font-size:small">That vendor needs to understand what they=
 are relying on. The same</div><div class=3D"gmail_default" style=3D"font-s=
ize:small">way that their packages from any other recipe don&#39;t automati=
cally get</div><div class=3D"gmail_default" style=3D"font-size:small">built=
 and used in an image with them explicitly asking for them in their</div><d=
iv class=3D"gmail_default" style=3D"font-size:small">image recipes.</div><b=
r></div><div><div class=3D"gmail_default" style=3D"font-size:small">That is=
 my point, I don&#39;t think this should just &quot;automatically=C2=A0work=
&quot;. It</div></div><div class=3D"gmail_default" style=3D"font-size:small=
">should have a simple way to opt-in, but behind the scenes magic in</div><=
div class=3D"gmail_default" style=3D"font-size:small">this particular area =
is just going to cause support issues.</div><div><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
If this feature is opt-in or specific to linux-yocto recipe, it again makes=
 the<br>
initrd&#39;s machine and kernel config specific. The opt-in setup needs to =
be made<br>
for kernel and for initrd.=C2=A0</blockquote><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
For real products all details need to be reviewed and customized but develo=
pers<br>
need &quot;good enough and simple&quot; starting points and that&#39;s wher=
e the<br>
&quot;kernel-modules&quot; and &quot;kernel-initrd-modules&quot; meta packa=
ges help.<br></blockquote><div><br></div><div><div class=3D"gmail_default" =
style=3D"font-size:small">After 14 years of working for an OSV, I&#39;m fam=
iliar with how a real</div><div class=3D"gmail_default" style=3D"font-size:=
small">product is put together. I&#39;ve also supported many customers thro=
ugh</div><div class=3D"gmail_default" style=3D"font-size:small">the issues =
I&#39;m describing above. I&#39;m not just describing this theoretically,</=
div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;ve also sp=
ent the hours trying to figure out silent boot death, and=C2=A0</div><div c=
lass=3D"gmail_default" style=3D"font-size:small">the zillion variations of =
that.<br></div></div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
They can more easily boot the generic images, see what drivers got loaded a=
t boot<br>
and remove all the rest. Then move that setup into kernel config etc. They =
can<br>
also test different block devices and file systems.<br>
<br>
The amount of optimisation done depends on what the priorities are. Gain vs=
 effort.<br>
<br>
&gt; &gt; And then &quot;kernel-initrd-modules&quot; are much smaller than =
&quot;kernel-modules&quot;.<br>
&gt; &gt; Still too big for real products but better than nothing. For<br>
&gt; &gt; genericarm64 this reduced initrd image size from 200 Mb to 54 Mb.=
<br>
&gt; <br>
&gt; Definitely a valid point / improvement. I&#39;m again back to saying i=
t<br>
&gt; just has to be explicit. The same way that many (most?) people<br>
&gt; don&#39;t want or use linux-yocto as production, we have to design<br>
&gt; our configurations as something to be opt-in and something that<br>
&gt; is clear it needs to be tweaked for production.<br>
&gt; <br>
&gt; We aren&#39;t far off in our view on this.=C2=A0 Most of this looks re=
ally<br>
&gt; good to me, and is a good step forward. I think that our<br>
&gt; different point of view is about the breadth of the types of<br>
&gt; kernels, machines, boot methods, products, etc, that are built<br>
&gt; on top and how to enable this mechanism.<br>
<br>
If this feature is opt-in and not the default in kernel.bbclass, then IMO<b=
r>
the result is again machine/build/config specific initrd image recipes<br>
which I wanted to avoid.<br></blockquote><div><br></div><div><div class=3D"=
gmail_default" style=3D"font-size:small">Having a distro feature that enabl=
es it, and then having the defaults</div><div class=3D"gmail_default" style=
=3D"font-size:small">kick in, shouldn&#39;t be too high of a bar for someon=
e to look, read the</div><div class=3D"gmail_default" style=3D"font-size:sm=
all">descriptions and decide that&#39;s what they want. After that opt-in, =
everything</div><div class=3D"gmail_default" style=3D"font-size:small">shou=
ld look pretty much like you are proposing.</div><div class=3D"gmail_defaul=
t" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">Bruce</div></div><div><br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
-Mikko<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--00000000000040c5e60633718659--


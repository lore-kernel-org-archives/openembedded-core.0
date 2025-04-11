Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15482C36010
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 13:39:51 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.26239.1744378784323286300
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 06:39:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WHYMUdoi;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-301918a4e1bso1591108a91.1
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 06:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744378784; x=1744983584; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sHhLWPDN1h9b+qyPzxQw1M5KVYX+NhQoPrMULuGeUF8=;
        b=WHYMUdoijd1fvOSg246/dBnMo+58Y/otGvnAGQxdmPkYWz4uHnonkNaUJsn0YF6oTh
         zegUtxjk6uxgJ2pzg7/imggdEG3DkIsDHppri/qea0ysRaLL/cdIahIbdwlMulbEof5J
         /k1WINAZ2paytgxMvJAgRvky1sYMa8lQLDBG3OZv/PXibpm/W2Jw6xW0pHOK5iPiEVeL
         5GG6CNyFUWIaz/bUaprIvKKHyhVefr6xT5+CYEf4SL5e2oKmPVA58ux+fFGRq8SZATwy
         mJ+eQCXvlET6hZffAdnUD+rUFOb6Yd04i6A9dFchKgzDhPXO846ltEkAqPKjEDxoPtDp
         7z0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744378784; x=1744983584;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sHhLWPDN1h9b+qyPzxQw1M5KVYX+NhQoPrMULuGeUF8=;
        b=MCv+/6cvMlvizOPRU4NKZdziONWIaA6ZaCSowabBk/SSWlBXpsyOr6HFC4VfcVr0Pk
         0Q5Ox1G4vxoo0rOJ6O7DVvIXS1eeKBvrpdtCCl2prAc1Me+h7bWGapR0gix1SM6OAPPN
         drpF4Iw3sXX0MEFMCeJwkOmEIHYaCX8aJdrfxVBrFY44vIf8LJfKVmtSW2jDoJ1AHj30
         Qf6z94OBwllVZ7GmCNboVyVBNjIni/bODEBMRQJ+aoGmiQWS8AhWqwa5QPa7jIyV00Nq
         XFHv/o5qvp1TiWUx0+8T0LOoHtEpAqZ0Pv3ticUFUAiIOFiqZUIbnWcjPwujUqFCfwNi
         FjeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHVwQh2dopn6jpWOoc8YG3BsRd3yQUcohX28MxXV1FX3Fdp0o4PK/P9JmNEfbsKP/VtJX+QKsYbiTw2V2ykL5FsQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz+JYxuwnPCGMKpgyej+Cjn6O7PFNRhNTwKVLmkSPKh5lfMHcw5
	/VkSRABf7h/dsRkwf/CmuKtuEB+An6081LiwPgstz/JY3pXbDejDK9T0DSQL7DzEvR2KVU0ekeW
	ZMs/o+GECIGNIRQToz4MCUGVqKKU=
X-Gm-Gg: ASbGncuzHZiG7MW8KgNWXTufyB4L12ChoL5aDNb+MluO/5pNtlCQVfooQoO5NVDWDND
	gvCh5pubUFwZxA0g2M1eFprbHMDi0+sFA9JMrtMdmCEKVU2laSI0ZVPgMLlNhfsQgYH0owtQs+3
	8JMC2uj5WVV4kZlJH37C8YqcI=
X-Google-Smtp-Source: AGHT+IHkMjsNDVxD6p4Lw+fLPIvDFb4qYBnhdn/cyKOxUXdWpkrK7ktvxFaNAz4IkAfdrYwzjnEXx8YgP+6zYFm6Spo=
X-Received: by 2002:a17:90b:5444:b0:2f7:e201:a8cc with SMTP id
 98e67ed59e1d1-3082367e2femr5014686a91.18.1744378783286; Fri, 11 Apr 2025
 06:39:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-4-mikko.rapeli@linaro.org> <1c55e7536de5f36fa37076ad04ff35588b6b5f1e.camel@linuxfoundation.org>
 <Z_fBAsbV-hY-x_SC@nuoska> <CADkTA4MamOxjfPE8uHhFDmZ12OhxpJ9dfhxbsxKGZxwQ4_cCkQ@mail.gmail.com>
 <Z_jJX05RuRTcFf4P@nuoska> <CADkTA4MWWtMXdRhvmdXhoS38SVpqXUz=p5G5H1i820QaV4CR0A@mail.gmail.com>
 <Z_kVI4bN7xWOyUi-@nuoska>
In-Reply-To: <Z_kVI4bN7xWOyUi-@nuoska>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 11 Apr 2025 09:39:31 -0400
X-Gm-Features: ATxdqUFSE7KmUiP5TrM0rsypr7tmei74KtVst6Xr3JGneoOvIR1pePipy2JILa0
Message-ID: <CADkTA4O9JXtr6XFO_rdzoAumtmp=5YUUkwgKMJyOtDBau7MEDQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 03/11] kernel.bbclass: add
 kernel-initrd-modules meta package
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000bb4d0f063280d5e7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 13:39:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214742

--000000000000bb4d0f063280d5e7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 9:12=E2=80=AFAM Mikko Rapeli <mikko.rapeli@linaro.o=
rg>
wrote:

> Hi,
>
> On Fri, Apr 11, 2025 at 08:52:24AM -0400, Bruce Ashfield wrote:
> > On Fri, Apr 11, 2025 at 3:48=E2=80=AFAM Mikko Rapeli <mikko.rapeli@lina=
ro.org>
> > wrote:
> >
> > > Hi,
> > >
> > > On Thu, Apr 10, 2025 at 09:15:02AM -0400, Bruce Ashfield wrote:
> > > > On Thu, Apr 10, 2025 at 9:00=E2=80=AFAM Mikko Rapeli via
> lists.openembedded.org
> > > > <mikko.rapeli=3Dlinaro.org@lists.openembedded.org> wrote:
> > > >
> > > > > On Thu, Apr 10, 2025 at 01:42:12PM +0100, Richard Purdie wrote:
> > > > > > On Fri, 2025-04-04 at 19:29 +0300, Mikko Rapeli via
> > > > > lists.openembedded.org wrote:
> > > > > > > At the moment linux-yocto kernels for various architectures
> > > > > > > are not very modular and a lot of drivers are built into the
> kernel
> > > > > > > even when they are not needed at runtime. These make the main
> > > kernel
> > > > > > > binary big and slow to boot. This also impacts udev in
> userspace
> > > > > > > which takes a long time processing events from all these buil=
t
> in
> > > > > drivers,
> > > > > > > for example when udev runs in initrd.
> > > > > > >
> > > > > > > Then constructing the initrd is very device and kernel
> > > configuration
> > > > > specific.
> > > > > > > initrd image needs explicitly define which binary packages to
> > > install
> > > > > > > to avoid pulling in complex dependencies. A full set of kerne=
l
> > > modules
> > > > > > > via kernel-modules meta package is too big for initrd and mos=
t
> of
> > > the
> > > > > > > drivers are not needed for use cases like "just load modules =
to
> > > mount
> > > > > > > main rootfs". Then the initrd configuration breaks if kernel
> driver
> > > > > > > is built into the kernel since the binary package doesn't
> exist.
> > > > > > >
> > > > > > > Introduce kernel-initrd-modules meta package to solve these
> > > problems.
> > > > > > > The meta package adds dependencies to real kernel modules
> based on
> > > > > > > the kernel module file paths so that it will include several
> > > > > > > kernel subsystems and their drivers which are often needed to
> find
> > > > > > > main rootfs from some block device. This works when drivers a=
re
> > > built
> > > > > > > as modules but does not break if drivers are built into the
> kernel.
> > > > > > >
> > > > > > > The resulting initrd is also smaller since only a subset of
> drivers
> > > > > > > are needed for "mount the rootfs" usecase. Tested on
> genericarm64
> > > > > > > kernel and qemu and AMD KV260 HW.
> > > > > > >
> > > > > > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > > > > > ---
> > > > > > >  .../kernel-module-split.bbclass               | 48
> > > +++++++++++++++++++
> > > > > > >  meta/classes-recipe/kernel.bbclass            |  5 +-
> > > > > > >  meta/classes-recipe/module.bbclass            | 37
> ++++++++++++++
> > > > > > >  3 files changed, 89 insertions(+), 1 deletion(-)
> > > > > > >
> > > > > > > diff --git a/meta/classes-recipe/kernel-module-split.bbclass
> > > > > b/meta/classes-recipe/kernel-module-split.bbclass
> > > > > > > index 9487365eb7..101c5cd959 100644
> > > > > > > --- a/meta/classes-recipe/kernel-module-split.bbclass
> > > > > > > +++ b/meta/classes-recipe/kernel-module-split.bbclass
> > > > > > > @@ -42,6 +42,40 @@ KERNEL_MODULE_PACKAGE_PREFIX ?=3D ""
> > > > > > >  KERNEL_MODULE_PACKAGE_SUFFIX ?=3D "-${KERNEL_VERSION}"
> > > > > > >  KERNEL_MODULE_PROVIDE_VIRTUAL ?=3D "1"
> > > > > > >
> > > > > > > +# subset of kernel modules needed in initrd, to e.g. mount
> rootfs
> > > > > from block device
> > > > > > > +KERNEL_INITRD_MODULES_META_PACKAGE ?=3D "${@
> > > > > d.getVar("KERNEL_PACKAGE_NAME") or "kernel" }-initrd-modules"
> > > > > > > +
> > > > > > > +# match regex to path or file name. E.g. include all drivers
> with
> > > > > files in path /drivers/ata/
> > > > > > > +KERNEL_INITRD_MODULES_REGEX ?=3D "(.*)(\
> > > > > > > +/drivers/acpi/|\
> > > > > > > +/drivers/ata/|\
> > > > > > > +/drivers/block/|\
> > > > > > > +/drivers/cdrom/|\
> > > > > > > +/drivers/char/hw_random/|\
> > > > > > > +/drivers/char/tpm/|\
> > > > > > > +/drivers/char/|\
> > > > > > > +/drivers/crypto/|\
> > > > > > > +/drivers/dax/|\
> > > > > > > +/drivers/firmware/arm_scmi/|\
> > > > > > > +/drivers/gpu/drm/|\
> > > > > > > +/drivers/md/|\
> > > > > > > +/drivers/mmc/|\
> > > > > > > +/drivers/mtd/|\
> > > > > > > +/drivers/nvdimm/|\
> > > > > > > +/drivers/nvme/|\
> > > > > > > +/drivers/pci/|\
> > > > > > > +/drivers/scsi/|\
> > > > > > > +/drivers/tee/|\
> > > > > > > +/drivers/tty/serial/|\
> > > > > > > +/drivers/virtio/|\
> > > > > > > +/drivers/watchdog/|\
> > > > > > > +/kernel/arch/|\
> > > > > > > +/kernel/block/|\
> > > > > > > +/kernel/crypto/|\
> > > > > > > +/kernel/fs/|\
> > > > > > > +/kernel/lib/\
> > > > > > > +)(.*)"
> > > > > > > +
> > > > > > >  python split_kernel_module_packages () {
> > > > > > >      import re
> > > > > > >
> > > > > > > @@ -183,6 +217,20 @@ python split_kernel_module_packages () {
> > > > > > >      modules =3D do_split_packages(d,
> > > > > root=3D'${nonarch_base_libdir}/modules', file_regex=3Dmodule_rege=
x,
> > > > > output_pattern=3Dmodule_pattern, description=3D'%s kernel module'=
,
> > > > > postinst=3Dpostinst, postrm=3Dpostrm, recursive=3DTrue,
> hook=3Dfrob_metadata,
> > > > > extra_depends=3D'%s-%s' % (kernel_package_name, kernel_version))
> > > > > > >      if modules:
> > > > > > >          d.appendVar('RDEPENDS:' + metapkg, ' '+'
> '.join(modules))
> > > > > > > +
> > > > > > > +    initrd_metapkg =3D
> > > d.getVar('KERNEL_INITRD_MODULES_META_PACKAGE')
> > > > > or ""
> > > > > > > +    initrd_module_regex =3D
> d.getVar('KERNEL_INITRD_MODULES_REGEX')
> > > or
> > > > > ""
> > > > > > > +    if (initrd_metapkg !=3D "") and (initrd_module_regex !=
=3D ""):
> > > > > > > +        initrd_module_regex =3D re.compile(initrd_module_reg=
ex)
> > > > > > > +        initrd_modules =3D []
> > > > > > > +        for module in modules:
> > > > > > > +            files =3D d.getVar('FILES:' + module)
> > > > > > > +            m =3D re.match(initrd_module_regex, files)
> > > > > > > +            if m:
> > > > > > > +                initrd_modules.append(module)
> > > > > > > +
> > > > > > > +        if initrd_modules:
> > > > > > > +            d.appendVar('RDEPENDS:' + initrd_metapkg, ' '+'
> > > > > '.join(initrd_modules))
> > > > > > >  }
> > > > > > >
> > > > > > >  do_package[vardeps] +=3D '${@" ".join(map(lambda s:
> "module_conf_"
> > > + s,
> > > > > (d.getVar("KERNEL_MODULE_PROBECONF") or "").split()))}'
> > > > > > > diff --git a/meta/classes-recipe/kernel.bbclass
> > > > > b/meta/classes-recipe/kernel.bbclass
> > > > > > > index 36ce659762..3dcaebcaed 100644
> > > > > > > --- a/meta/classes-recipe/kernel.bbclass
> > > > > > > +++ b/meta/classes-recipe/kernel.bbclass
> > > > > > > @@ -695,13 +695,14 @@ EXPORT_FUNCTIONS do_compile
> > > do_transform_kernel
> > > > > do_transform_bundled_initramfs d
> > > > > > >
> > > > > > >  # kernel-base becomes kernel-${KERNEL_VERSION}
> > > > > > >  # kernel-image becomes kernel-image-${KERNEL_VERSION}
> > > > > > > -PACKAGES =3D "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-=
base
> > > > > ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image
> > > > > ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules
> > > > > ${KERNEL_PACKAGE_NAME}-dbg"
> > > > > > > +PACKAGES =3D "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-=
base
> > > > > ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image
> > > > > ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules
> > > > > ${KERNEL_PACKAGE_NAME}-initrd-modules ${KERNEL_PACKAGE_NAME}-dbg"
> > > > > > >  FILES:${PN} =3D ""
> > > > > > >  FILES:${KERNEL_PACKAGE_NAME}-base =3D
> > > > > "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.order
> > > > > ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin
> > > > >
> > >
> ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin.modinfo"
> > > > > > >  FILES:${KERNEL_PACKAGE_NAME}-image =3D ""
> > > > > > >  FILES:${KERNEL_PACKAGE_NAME}-dev =3D
> > > "/${KERNEL_IMAGEDEST}/System.map*
> > > > > /${KERNEL_IMAGEDEST}/Module.symvers* /${KERNEL_IMAGEDEST}/config*
> > > > > ${KERNEL_SRC_PATH}
> > > ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
> > > > > > >  FILES:${KERNEL_PACKAGE_NAME}-vmlinux =3D
> > > > > "/${KERNEL_IMAGEDEST}/vmlinux-${KERNEL_VERSION_NAME}"
> > > > > > >  FILES:${KERNEL_PACKAGE_NAME}-modules =3D ""
> > > > > > > +FILES:${KERNEL_PACKAGE_NAME}-initrd-modules =3D ""
> > > > > > >  FILES:${KERNEL_PACKAGE_NAME}-dbg =3D "/usr/lib/debug
> /usr/src/debug"
> > > > > > >  RDEPENDS:${KERNEL_PACKAGE_NAME} =3D
> "${KERNEL_PACKAGE_NAME}-base (=3D
> > > > > ${EXTENDPKGV})"
> > > > > > >  # Allow machines to override this dependency if kernel image
> > > files are
> > > > > > > @@ -716,7 +717,9 @@ ALLOW_EMPTY:${KERNEL_PACKAGE_NAME} =3D "1=
"
> > > > > > >  ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-base =3D "1"
> > > > > > >  ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-image =3D "1"
> > > > > > >  ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-modules =3D "1"
> > > > > > > +ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-initrd-modules =3D "1"
> > > > > > >  DESCRIPTION:${KERNEL_PACKAGE_NAME}-modules =3D "Kernel modul=
es
> meta
> > > > > package"
> > > > > > > +DESCRIPTION:${KERNEL_PACKAGE_NAME}-initrd-modules =3D "Kerne=
l
> initrd
> > > > > modules meta package"
> > > > > > >
> > > > > > >  pkg_postinst:${KERNEL_PACKAGE_NAME}-base () {
> > > > > > >     if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
> > > > > > > diff --git a/meta/classes-recipe/module.bbclass
> > > > > b/meta/classes-recipe/module.bbclass
> > > > > > > index f2f0b25a2d..51f864f1f9 100644
> > > > > > > --- a/meta/classes-recipe/module.bbclass
> > > > > > > +++ b/meta/classes-recipe/module.bbclass
> > > > > > > @@ -86,3 +86,40 @@ EXPORT_FUNCTIONS do_compile do_install
> > > > > > >  KERNEL_MODULES_META_PACKAGE =3D "${PN}"
> > > > > > >  FILES:${PN} =3D ""
> > > > > > >  ALLOW_EMPTY:${PN} =3D "1"
> > > > > > > +
> > > > > > > +# subset of kernel modules needed in initrd, to e.g. mount
> rootfs
> > > > > from block device
> > > > > > > +KERNEL_INITRD_MODULES_META_PACKAGE ?=3D "${@
> > > > > d.getVar("KERNEL_PACKAGE_NAME") or "kernel" }-initrd-modules"
> > > > > > > +
> > > > > > > +# match regex to path or file name. E.g. include all drivers
> with
> > > > > files in path /drivers/ata/
> > > > > > > +KERNEL_INITRD_MODULES_REGEX ?=3D "(.*)(\
> > > > > > > +/drivers/acpi/|\
> > > > > > > +/drivers/ata/|\
> > > > > > > +/drivers/block/|\
> > > > > > > +/drivers/cdrom/|\
> > > > > > > +/drivers/char/hw_random/|\
> > > > > > > +/drivers/char/tpm/|\
> > > > > > > +/drivers/char/|\
> > > > > > > +/drivers/crypto/|\
> > > > > > > +/drivers/dax/|\
> > > > > > > +/drivers/firmware/arm_scmi/|\
> > > > > > > +/drivers/gpu/drm/|\
> > > > > > > +/drivers/md/|\
> > > > > > > +/drivers/mmc/|\
> > > > > > > +/drivers/mtd/|\
> > > > > > > +/drivers/nvdimm/|\
> > > > > > > +/drivers/nvme/|\
> > > > > > > +/drivers/pci/|\
> > > > > > > +/drivers/scsi/|\
> > > > > > > +/drivers/tee/|\
> > > > > > > +/drivers/tty/serial/|\
> > > > > > > +/drivers/virtio/|\
> > > > > > > +/drivers/watchdog/|\
> > > > > > > +/kernel/arch/|\
> > > > > > > +/kernel/block/|\
> > > > > > > +/kernel/crypto/|\
> > > > > > > +/kernel/fs/|\
> > > > > > > +/kernel/lib/\
> > > > > > > +)(.*)"
> > > > > > > +
> > > > > > > +FILES:${PN}-initrd =3D ""
> > > > > > > +ALLOW_EMPTY:${PN}-initrd =3D "1"
> > > > > >
> > > > > > What is the difference between the variable defined in
> kernel-module-
> > > > > > split.bbclass and this one in module.bbclass? Do we need/want t=
o
> > > > > > separate but seemingly similar definitions?
> > > > >
> > > > > One is for kernel compilation and in-tree drivers, the other is f=
or
> > > > > out-of-tree modules.
> > > > >
> > > > > The "kernel-modules" meta package is handled this way too, with
> > > > > duplication in both.
> > > > >
> > > > > Bruce says this should be moved to linux-yocto kernel recipe,
> > > > > which IMO breaks the use of kernel-initrd-modules for vendor kern=
el
> > > recipes
> > > > > outside of oe-core. I'd rather support them too to e.g. more easi=
ly
> > > boot
> > > > > qemu or run oeqa selftests with qemu.
> > > > >
> > > >
> > > > That's not quite what I said (but it is close), I said it shouldn't
> be
> > > > defined
> > > > at the base with no requirement opt-in from a recipe (even if this
> way
> > > > of constructing an initrd with the modules is not the default). It
> is a (
> > > > weak)
> > > > binding to specific kernel versions and directory layouts, but it i=
s
> a
> > > > binding
> > > > none the less. If it sits at the base in the classes no one will ev=
er
> > > look
> > > > at
> > > > it or even know that it should be considered.
> > > >
> > > > My suggestion was not that it should only be in linux-yocto (but I'=
d
> > > > insist on overriding it or doing it slightly differently in
> linux-yocto),
> > > > I was saying that it I think  that the two definitions are far to
> similar
> > > > and even if there remain two definitions, they should be moved
> > > > into a .inc file.
> > >
> > > Actually the duplication is a bug. All duplication in module.bbclass
> can be
> > > removed since it includes kernel-module-split.bbclass. Both
> kernel.bbclass
> > > and
> > > module.bbclass include kernel-module-split.bbclass. Sorry about this.
> > > I must have stopped half way when moving things there.
> > >
> > > Sending v4 with this fixed soon.
> > >
> > > > Any kernel recipe that wants to build an initrd like this can opt-i=
n
> by
> > > > including the .inc, and/or creating their own definition.
> > >
> > > This I don't get. I think the kernel.bbclass and module.bbclass shoul=
d
> > > work out of the box with sane defaults. The kernel recipes can overri=
de
> > > and adjust these as they see fit. Yes there is a dependency to some
> kernel
> > > APIs (kernel module install paths) which can change, but those have
> been
> > > stable for, over 25 years (as long as I have been compiling kernels)?
> > >
> > > For full control, initrd recipe maintainers can define the exact set
> > > of kernel and other binary packages to install which makes the recipe
> > > kernel config and machine specific.
> > >
> > > I don't think moving the definitions to a linux-yocto side .inc file
> > > and then using that as basis in non-core kernel recipes is good. The
> > > kernel.bbclass and module.bbclass would not work independently anymor=
e
> > > and require meta/recipes-kernel/linux/ side .inc file for working
> defaults.
> > > Or should the .inc file live in meta/conf/distro/include?
> > >
> >
> > Let me be clear. I am not saying "linux-yocto" here. I said a ".inc"
> file.
> >
> > Put that .inc file in a common directory and call it something like
> > initrd-kernel-<foo>.inc, recipes include that .inc file to opt into the
> > behaviour and get the base definition if they want it.
>
> Ok I will do this in v5.
>
> > This modular based initrd isn't going to be the default, so it has
> > to be opt-in anyway. So put the opt-in and the definitions in a .inc
> > file, a recipe including it, opts-in.
>
> I think this should be the default on most machines which use
> core-image-initramfs-boot in oe-core.


I'll disagree on that point, but in the end, it isn't a hill that
is worth climbing (for me). If that's the way the default policy
goes, I'll just roll with it.




>
> genericarm64, beagleplay etc machines already for install of
> "kernel-modules"
> to all images, including core-image-initramfs-boot:
>
> $ git grep MACHINE_EXTRA_RRECOMMENDS meta/conf/machine
> meta-yocto-bsp/conf/machine/ | grep kernel-modules
> meta-yocto-bsp/conf/machine/beaglebone-yocto.conf:MACHINE_EXTRA_RRECOMMEN=
DS
> =3D "kernel-modules"
> meta-yocto-bsp/conf/machine/genericarm64.conf:MACHINE_EXTRA_RRECOMMENDS +=
=3D
> "kernel-modules"
> meta-yocto-bsp/conf/machine/include/genericx86-common.inc:MACHINE_EXTRA_R=
RECOMMENDS
> +=3D "kernel-modules linux-firmware"
> meta/conf/machine/include/loongarch/qemuloongarch.inc:MACHINE_EXTRA_RRECO=
MMENDS
> +=3D " kernel-modules"
> meta/conf/machine/include/riscv/qemuriscv.inc:MACHINE_EXTRA_RRECOMMENDS +=
=3D
> " kernel-modules"
> meta/conf/machine/qemuppc64.conf:MACHINE_EXTRA_RRECOMMENDS +=3D "
> kernel-modules"
>
>
Right, and that was by design.

The philosophy has been that the kernel provider should understand
and control its configuration (since we are talking about embedded
devices here). Sure, those examples took the simplest path, and that
was their decision / tradeoff.

We package all the modules individually (I'm stating the obvious,
since we all know this) so that they can be individually installed
and required for something that really wants to control the configuration
tightly.

In any machine / BSP that I build, the configuration is on purpose
and if I want to install individual modules, I'll do that, otherwise,
I trust my configuration and take all the modules.

What you have is something in the middle, and why I still think it
needs to be opt-in. BSP creators need to understand their
configuration and tune it. Having something down at the packaging
level pick and choose which modules on their behalf means that
they are relying on something that needs to be discovered and
tweaked (versus the "all of it" or "you chose your own" as it was
before).


> Some qemu machines don't and that causes issues since
> initrd is not flexible to boot even slightly different configurations,
> like block device emulation moved from scsi to virtio.
> This causes issues with oeqa selftests when small kernel or qemuboot
> differences break tests.
>

And we'll continue to do that, as all the boot methods and kernels
need to be tested. But I agree, there are pros and cons to the
various methods.


> initrd itself is optional, but in core-image-initramfs-boot I made
> including "kernel-initrd-modules" the default. To me this makes sense.
>
> Kernels for different machines can enable drivers as modules or as built-=
in
> but the initrd config stays the same and will mostly just work. I think
> this is a good default.
>
>
It is just that behaviour which is why I'm saying it should be
explicit and opt-in. If they change their configuration it should
be with a direct line of sight to how the various components
consume it.

Preferably not "I have a custom driver, I need it to boot, I'm
now building it as a module" .. and then wondering why it isn't
picked up in the initrd. If they had to opt-in, they'll already be
aware of the mechanism that is selecting their modules over
and above what their kernel configuration dictates.


> And then "kernel-initrd-modules" are much smaller than "kernel-modules".
> Still too big for real products but better than nothing. For
> genericarm64 this reduced initrd image size from 200 Mb to 54 Mb.


Definitely a valid point / improvement. I'm again back to saying it
just has to be explicit. The same way that many (most?) people
don't want or use linux-yocto as production, we have to design
our configurations as something to be opt-in and something that
is clear it needs to be tweaked for production.

We aren't far off in our view on this.  Most of this looks really
good to me, and is a good step forward. I think that our
different point of view is about the breadth of the types of
kernels, machines, boot methods, products, etc, that are built
on top and how to enable this mechanism.


> > I don't like the directory listings at all, but that's the best way to
> > not hide them and again, you can't get a general enough set of
> > definitions in a base class to serve all possible use cases. It needs
> > to come from top down.
>
> Yes, improvements welcome. At least this doesn't break when drivers
> change from built-in or as modules and new features added to linux-yocto
> configs don't bloat the kernel so much anymore. Like the pmem patches
> which just got in. They work as modules.
>
>
I'm still working on this part, but trying to get this release out
the door has my time mostly chewed up.  I'd still like to explore
a way that either the kernel configuration or the packaging of the
modules is how a recipe indicates that something belongs in
this essential module list for the initrd (or whatever else).

Richard: If you are reading this and get this far, is there any way
to add some sort of RPROVIDES to a package that is almost a
wild card ?  I just haven't had time to think it through or experiment.
Rather than the directory listings, if the new initrd kernel module
meta-package could be constructed (or just the image doing the
installs) from something like IMAGE_INSTALL +=3D "kernel-essential-boot-*'
and that RPROVIDES was put into the packages when they were
created .. we'd have the top down control and explicit configuration
I'm looking for.

Bruce



> Cheers,
>
> -Mikko
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000bb4d0f063280d5e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 11, 2025 at 9:12=
=E2=80=AFAM Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@linaro.org">mik=
ko.rapeli@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Hi,<br>
<br>
On Fri, Apr 11, 2025 at 08:52:24AM -0400, Bruce Ashfield wrote:<br>
&gt; On Fri, Apr 11, 2025 at 3:48=E2=80=AFAM Mikko Rapeli &lt;<a href=3D"ma=
ilto:mikko.rapeli@linaro.org" target=3D"_blank">mikko.rapeli@linaro.org</a>=
&gt;<br>
&gt; wrote:<br>
&gt; <br>
&gt; &gt; Hi,<br>
&gt; &gt;<br>
&gt; &gt; On Thu, Apr 10, 2025 at 09:15:02AM -0400, Bruce Ashfield wrote:<b=
r>
&gt; &gt; &gt; On Thu, Apr 10, 2025 at 9:00=E2=80=AFAM Mikko Rapeli via <a =
href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank"=
>lists.openembedded.org</a><br>
&gt; &gt; &gt; &lt;mikko.rapeli=3D<a href=3D"mailto:linaro.org@lists.openem=
bedded.org" target=3D"_blank">linaro.org@lists.openembedded.org</a>&gt; wro=
te:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Thu, Apr 10, 2025 at 01:42:12PM +0100, Richard Purdi=
e wrote:<br>
&gt; &gt; &gt; &gt; &gt; On Fri, 2025-04-04 at 19:29 +0300, Mikko Rapeli vi=
a<br>
&gt; &gt; &gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"norefe=
rrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; At the moment linux-yocto kernels for various=
 architectures<br>
&gt; &gt; &gt; &gt; &gt; &gt; are not very modular and a lot of drivers are=
 built into the kernel<br>
&gt; &gt; &gt; &gt; &gt; &gt; even when they are not needed at runtime. The=
se make the main<br>
&gt; &gt; kernel<br>
&gt; &gt; &gt; &gt; &gt; &gt; binary big and slow to boot. This also impact=
s udev in userspace<br>
&gt; &gt; &gt; &gt; &gt; &gt; which takes a long time processing events fro=
m all these built in<br>
&gt; &gt; &gt; &gt; drivers,<br>
&gt; &gt; &gt; &gt; &gt; &gt; for example when udev runs in initrd.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Then constructing the initrd is very device a=
nd kernel<br>
&gt; &gt; configuration<br>
&gt; &gt; &gt; &gt; specific.<br>
&gt; &gt; &gt; &gt; &gt; &gt; initrd image needs explicitly define which bi=
nary packages to<br>
&gt; &gt; install<br>
&gt; &gt; &gt; &gt; &gt; &gt; to avoid pulling in complex dependencies. A f=
ull set of kernel<br>
&gt; &gt; modules<br>
&gt; &gt; &gt; &gt; &gt; &gt; via kernel-modules meta package is too big fo=
r initrd and most of<br>
&gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; drivers are not needed for use cases like &qu=
ot;just load modules to<br>
&gt; &gt; mount<br>
&gt; &gt; &gt; &gt; &gt; &gt; main rootfs&quot;. Then the initrd configurat=
ion breaks if kernel driver<br>
&gt; &gt; &gt; &gt; &gt; &gt; is built into the kernel since the binary pac=
kage doesn&#39;t exist.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Introduce kernel-initrd-modules meta package =
to solve these<br>
&gt; &gt; problems.<br>
&gt; &gt; &gt; &gt; &gt; &gt; The meta package adds dependencies to real ke=
rnel modules based on<br>
&gt; &gt; &gt; &gt; &gt; &gt; the kernel module file paths so that it will =
include several<br>
&gt; &gt; &gt; &gt; &gt; &gt; kernel subsystems and their drivers which are=
 often needed to find<br>
&gt; &gt; &gt; &gt; &gt; &gt; main rootfs from some block device. This work=
s when drivers are<br>
&gt; &gt; built<br>
&gt; &gt; &gt; &gt; &gt; &gt; as modules but does not break if drivers are =
built into the kernel.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; The resulting initrd is also smaller since on=
ly a subset of drivers<br>
&gt; &gt; &gt; &gt; &gt; &gt; are needed for &quot;mount the rootfs&quot; u=
secase. Tested on genericarm64<br>
&gt; &gt; &gt; &gt; &gt; &gt; kernel and qemu and AMD KV260 HW.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Signed-off-by: Mikko Rapeli &lt;<a href=3D"ma=
ilto:mikko.rapeli@linaro.org" target=3D"_blank">mikko.rapeli@linaro.org</a>=
&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 .../kernel-module-split.bbclass=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 48<br>
&gt; &gt; +++++++++++++++++++<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 meta/classes-recipe/kernel.bbclass=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 +-<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 meta/classes-recipe/module.bbclass=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 37 ++++++++++++++<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 3 files changed, 89 insertions(+), 1 de=
letion(-)<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; diff --git a/meta/classes-recipe/kernel-modul=
e-split.bbclass<br>
&gt; &gt; &gt; &gt; b/meta/classes-recipe/kernel-module-split.bbclass<br>
&gt; &gt; &gt; &gt; &gt; &gt; index 9487365eb7..101c5cd959 100644<br>
&gt; &gt; &gt; &gt; &gt; &gt; --- a/meta/classes-recipe/kernel-module-split=
.bbclass<br>
&gt; &gt; &gt; &gt; &gt; &gt; +++ b/meta/classes-recipe/kernel-module-split=
.bbclass<br>
&gt; &gt; &gt; &gt; &gt; &gt; @@ -42,6 +42,40 @@ KERNEL_MODULE_PACKAGE_PREF=
IX ?=3D &quot;&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 KERNEL_MODULE_PACKAGE_SUFFIX ?=3D &quot=
;-${KERNEL_VERSION}&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 KERNEL_MODULE_PROVIDE_VIRTUAL ?=3D &quo=
t;1&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; +# subset of kernel modules needed in initrd,=
 to e.g. mount rootfs<br>
&gt; &gt; &gt; &gt; from block device<br>
&gt; &gt; &gt; &gt; &gt; &gt; +KERNEL_INITRD_MODULES_META_PACKAGE ?=3D &quo=
t;${@<br>
&gt; &gt; &gt; &gt; d.getVar(&quot;KERNEL_PACKAGE_NAME&quot;) or &quot;kern=
el&quot; }-initrd-modules&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; +# match regex to path or file name. E.g. inc=
lude all drivers with<br>
&gt; &gt; &gt; &gt; files in path /drivers/ata/<br>
&gt; &gt; &gt; &gt; &gt; &gt; +KERNEL_INITRD_MODULES_REGEX ?=3D &quot;(.*)(=
\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/acpi/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/ata/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/block/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/cdrom/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/char/hw_random/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/char/tpm/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/char/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/crypto/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/dax/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/firmware/arm_scmi/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/gpu/drm/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/md/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/mmc/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/mtd/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/nvdimm/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/nvme/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/pci/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/scsi/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/tee/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/tty/serial/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/virtio/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/watchdog/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/kernel/arch/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/kernel/block/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/kernel/crypto/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/kernel/fs/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/kernel/lib/\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +)(.*)&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 python split_kernel_module_packages () =
{<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 import re<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; @@ -183,6 +217,20 @@ python split_kernel_modu=
le_packages () {<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 modules =3D do_split_pack=
ages(d,<br>
&gt; &gt; &gt; &gt; root=3D&#39;${nonarch_base_libdir}/modules&#39;, file_r=
egex=3Dmodule_regex,<br>
&gt; &gt; &gt; &gt; output_pattern=3Dmodule_pattern, description=3D&#39;%s =
kernel module&#39;,<br>
&gt; &gt; &gt; &gt; postinst=3Dpostinst, postrm=3Dpostrm, recursive=3DTrue,=
 hook=3Dfrob_metadata,<br>
&gt; &gt; &gt; &gt; extra_depends=3D&#39;%s-%s&#39; % (kernel_package_name,=
 kernel_version))<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 if modules:<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar=
(&#39;RDEPENDS:&#39; + metapkg, &#39; &#39;+&#39; &#39;.join(modules))<br>
&gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 initrd_metapkg =3D<br>
&gt; &gt; d.getVar(&#39;KERNEL_INITRD_MODULES_META_PACKAGE&#39;)<br>
&gt; &gt; &gt; &gt; or &quot;&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 initrd_module_regex =3D d.getV=
ar(&#39;KERNEL_INITRD_MODULES_REGEX&#39;)<br>
&gt; &gt; or<br>
&gt; &gt; &gt; &gt; &quot;&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 if (initrd_metapkg !=3D &quot;=
&quot;) and (initrd_module_regex !=3D &quot;&quot;):<br>
&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 initrd_module_re=
gex =3D re.compile(initrd_module_regex)<br>
&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 initrd_modules =
=3D []<br>
&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for module in mo=
dules:<br>
&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi=
les =3D d.getVar(&#39;FILES:&#39; + module)<br>
&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m =
=3D re.match(initrd_module_regex, files)<br>
&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if=
 m:<br>
&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 initrd_modules.append(module)<br>
&gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if initrd_module=
s:<br>
&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.=
appendVar(&#39;RDEPENDS:&#39; + initrd_metapkg, &#39; &#39;+&#39;<br>
&gt; &gt; &gt; &gt; &#39;.join(initrd_modules))<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 do_package[vardeps] +=3D &#39;${@&quot;=
 &quot;.join(map(lambda s: &quot;module_conf_&quot;<br>
&gt; &gt; + s,<br>
&gt; &gt; &gt; &gt; (d.getVar(&quot;KERNEL_MODULE_PROBECONF&quot;) or &quot=
;&quot;).split()))}&#39;<br>
&gt; &gt; &gt; &gt; &gt; &gt; diff --git a/meta/classes-recipe/kernel.bbcla=
ss<br>
&gt; &gt; &gt; &gt; b/meta/classes-recipe/kernel.bbclass<br>
&gt; &gt; &gt; &gt; &gt; &gt; index 36ce659762..3dcaebcaed 100644<br>
&gt; &gt; &gt; &gt; &gt; &gt; --- a/meta/classes-recipe/kernel.bbclass<br>
&gt; &gt; &gt; &gt; &gt; &gt; +++ b/meta/classes-recipe/kernel.bbclass<br>
&gt; &gt; &gt; &gt; &gt; &gt; @@ -695,13 +695,14 @@ EXPORT_FUNCTIONS do_com=
pile<br>
&gt; &gt; do_transform_kernel<br>
&gt; &gt; &gt; &gt; do_transform_bundled_initramfs d<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 # kernel-base becomes kernel-${KERNEL_V=
ERSION}<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 # kernel-image becomes kernel-image-${K=
ERNEL_VERSION}<br>
&gt; &gt; &gt; &gt; &gt; &gt; -PACKAGES =3D &quot;${KERNEL_PACKAGE_NAME} ${=
KERNEL_PACKAGE_NAME}-base<br>
&gt; &gt; &gt; &gt; ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-i=
mage<br>
&gt; &gt; &gt; &gt; ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modul=
es<br>
&gt; &gt; &gt; &gt; ${KERNEL_PACKAGE_NAME}-dbg&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; +PACKAGES =3D &quot;${KERNEL_PACKAGE_NAME} ${=
KERNEL_PACKAGE_NAME}-base<br>
&gt; &gt; &gt; &gt; ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-i=
mage<br>
&gt; &gt; &gt; &gt; ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modul=
es<br>
&gt; &gt; &gt; &gt; ${KERNEL_PACKAGE_NAME}-initrd-modules ${KERNEL_PACKAGE_=
NAME}-dbg&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 FILES:${PN} =3D &quot;&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 FILES:${KERNEL_PACKAGE_NAME}-base =3D<b=
r>
&gt; &gt; &gt; &gt; &quot;${nonarch_base_libdir}/modules/${KERNEL_VERSION}/=
modules.order<br>
&gt; &gt; &gt; &gt; ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/module=
s.builtin<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin.=
modinfo&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 FILES:${KERNEL_PACKAGE_NAME}-image =3D =
&quot;&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 FILES:${KERNEL_PACKAGE_NAME}-dev =3D<br=
>
&gt; &gt; &quot;/${KERNEL_IMAGEDEST}/System.map*<br>
&gt; &gt; &gt; &gt; /${KERNEL_IMAGEDEST}/Module.symvers* /${KERNEL_IMAGEDES=
T}/config*<br>
&gt; &gt; &gt; &gt; ${KERNEL_SRC_PATH}<br>
&gt; &gt; ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 FILES:${KERNEL_PACKAGE_NAME}-vmlinux =
=3D<br>
&gt; &gt; &gt; &gt; &quot;/${KERNEL_IMAGEDEST}/vmlinux-${KERNEL_VERSION_NAM=
E}&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 FILES:${KERNEL_PACKAGE_NAME}-modules =
=3D &quot;&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; +FILES:${KERNEL_PACKAGE_NAME}-initrd-modules =
=3D &quot;&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 FILES:${KERNEL_PACKAGE_NAME}-dbg =3D &q=
uot;/usr/lib/debug /usr/src/debug&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 RDEPENDS:${KERNEL_PACKAGE_NAME} =3D &qu=
ot;${KERNEL_PACKAGE_NAME}-base (=3D<br>
&gt; &gt; &gt; &gt; ${EXTENDPKGV})&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 # Allow machines to override this depen=
dency if kernel image<br>
&gt; &gt; files are<br>
&gt; &gt; &gt; &gt; &gt; &gt; @@ -716,7 +717,9 @@ ALLOW_EMPTY:${KERNEL_PACK=
AGE_NAME} =3D &quot;1&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-base=
 =3D &quot;1&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-imag=
e =3D &quot;1&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-modu=
les =3D &quot;1&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; +ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-initrd-mo=
dules =3D &quot;1&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 DESCRIPTION:${KERNEL_PACKAGE_NAME}-modu=
les =3D &quot;Kernel modules meta<br>
&gt; &gt; &gt; &gt; package&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; +DESCRIPTION:${KERNEL_PACKAGE_NAME}-initrd-mo=
dules =3D &quot;Kernel initrd<br>
&gt; &gt; &gt; &gt; modules meta package&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 pkg_postinst:${KERNEL_PACKAGE_NAME}-bas=
e () {<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0if [ ! -e &quot;$D/lib/mod=
ules/${KERNEL_VERSION}&quot; ]; then<br>
&gt; &gt; &gt; &gt; &gt; &gt; diff --git a/meta/classes-recipe/module.bbcla=
ss<br>
&gt; &gt; &gt; &gt; b/meta/classes-recipe/module.bbclass<br>
&gt; &gt; &gt; &gt; &gt; &gt; index f2f0b25a2d..51f864f1f9 100644<br>
&gt; &gt; &gt; &gt; &gt; &gt; --- a/meta/classes-recipe/module.bbclass<br>
&gt; &gt; &gt; &gt; &gt; &gt; +++ b/meta/classes-recipe/module.bbclass<br>
&gt; &gt; &gt; &gt; &gt; &gt; @@ -86,3 +86,40 @@ EXPORT_FUNCTIONS do_compil=
e do_install<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 KERNEL_MODULES_META_PACKAGE =3D &quot;$=
{PN}&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 FILES:${PN} =3D &quot;&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; +# subset of kernel modules needed in initrd,=
 to e.g. mount rootfs<br>
&gt; &gt; &gt; &gt; from block device<br>
&gt; &gt; &gt; &gt; &gt; &gt; +KERNEL_INITRD_MODULES_META_PACKAGE ?=3D &quo=
t;${@<br>
&gt; &gt; &gt; &gt; d.getVar(&quot;KERNEL_PACKAGE_NAME&quot;) or &quot;kern=
el&quot; }-initrd-modules&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; +# match regex to path or file name. E.g. inc=
lude all drivers with<br>
&gt; &gt; &gt; &gt; files in path /drivers/ata/<br>
&gt; &gt; &gt; &gt; &gt; &gt; +KERNEL_INITRD_MODULES_REGEX ?=3D &quot;(.*)(=
\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/acpi/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/ata/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/block/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/cdrom/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/char/hw_random/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/char/tpm/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/char/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/crypto/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/dax/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/firmware/arm_scmi/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/gpu/drm/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/md/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/mmc/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/mtd/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/nvdimm/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/nvme/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/pci/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/scsi/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/tee/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/tty/serial/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/virtio/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/drivers/watchdog/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/kernel/arch/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/kernel/block/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/kernel/crypto/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/kernel/fs/|\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +/kernel/lib/\<br>
&gt; &gt; &gt; &gt; &gt; &gt; +)(.*)&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; +FILES:${PN}-initrd =3D &quot;&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; +ALLOW_EMPTY:${PN}-initrd =3D &quot;1&quot;<b=
r>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; What is the difference between the variable define=
d in kernel-module-<br>
&gt; &gt; &gt; &gt; &gt; split.bbclass and this one in module.bbclass? Do w=
e need/want to<br>
&gt; &gt; &gt; &gt; &gt; separate but seemingly similar definitions?<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; One is for kernel compilation and in-tree drivers, the =
other is for<br>
&gt; &gt; &gt; &gt; out-of-tree modules.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; The &quot;kernel-modules&quot; meta package is handled =
this way too, with<br>
&gt; &gt; &gt; &gt; duplication in both.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Bruce says this should be moved to linux-yocto kernel r=
ecipe,<br>
&gt; &gt; &gt; &gt; which IMO breaks the use of kernel-initrd-modules for v=
endor kernel<br>
&gt; &gt; recipes<br>
&gt; &gt; &gt; &gt; outside of oe-core. I&#39;d rather support them too to =
e.g. more easily<br>
&gt; &gt; boot<br>
&gt; &gt; &gt; &gt; qemu or run oeqa selftests with qemu.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; That&#39;s not quite what I said (but it is close), I said i=
t shouldn&#39;t be<br>
&gt; &gt; &gt; defined<br>
&gt; &gt; &gt; at the base with no requirement opt-in from a recipe (even i=
f this way<br>
&gt; &gt; &gt; of constructing an initrd with the modules is not the defaul=
t). It is a (<br>
&gt; &gt; &gt; weak)<br>
&gt; &gt; &gt; binding to specific kernel versions and directory layouts, b=
ut it is a<br>
&gt; &gt; &gt; binding<br>
&gt; &gt; &gt; none the less. If it sits at the base in the classes no one =
will ever<br>
&gt; &gt; look<br>
&gt; &gt; &gt; at<br>
&gt; &gt; &gt; it or even know that it should be considered.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; My suggestion was not that it should only be in linux-yocto =
(but I&#39;d<br>
&gt; &gt; &gt; insist on overriding it or doing it slightly differently in =
linux-yocto),<br>
&gt; &gt; &gt; I was saying that it I think=C2=A0 that the two definitions =
are far to similar<br>
&gt; &gt; &gt; and even if there remain two definitions, they should be mov=
ed<br>
&gt; &gt; &gt; into a .inc file.<br>
&gt; &gt;<br>
&gt; &gt; Actually the duplication is a bug. All duplication in module.bbcl=
ass can be<br>
&gt; &gt; removed since it includes kernel-module-split.bbclass. Both kerne=
l.bbclass<br>
&gt; &gt; and<br>
&gt; &gt; module.bbclass include kernel-module-split.bbclass. Sorry about t=
his.<br>
&gt; &gt; I must have stopped half way when moving things there.<br>
&gt; &gt;<br>
&gt; &gt; Sending v4 with this fixed soon.<br>
&gt; &gt;<br>
&gt; &gt; &gt; Any kernel recipe that wants to build an initrd like this ca=
n opt-in by<br>
&gt; &gt; &gt; including the .inc, and/or creating their own definition.<br=
>
&gt; &gt;<br>
&gt; &gt; This I don&#39;t get. I think the kernel.bbclass and module.bbcla=
ss should<br>
&gt; &gt; work out of the box with sane defaults. The kernel recipes can ov=
erride<br>
&gt; &gt; and adjust these as they see fit. Yes there is a dependency to so=
me kernel<br>
&gt; &gt; APIs (kernel module install paths) which can change, but those ha=
ve been<br>
&gt; &gt; stable for, over 25 years (as long as I have been compiling kerne=
ls)?<br>
&gt; &gt;<br>
&gt; &gt; For full control, initrd recipe maintainers can define the exact =
set<br>
&gt; &gt; of kernel and other binary packages to install which makes the re=
cipe<br>
&gt; &gt; kernel config and machine specific.<br>
&gt; &gt;<br>
&gt; &gt; I don&#39;t think moving the definitions to a linux-yocto side .i=
nc file<br>
&gt; &gt; and then using that as basis in non-core kernel recipes is good. =
The<br>
&gt; &gt; kernel.bbclass and module.bbclass would not work independently an=
ymore<br>
&gt; &gt; and require meta/recipes-kernel/linux/ side .inc file for working=
 defaults.<br>
&gt; &gt; Or should the .inc file live in meta/conf/distro/include?<br>
&gt; &gt;<br>
&gt; <br>
&gt; Let me be clear. I am not saying &quot;linux-yocto&quot; here. I said =
a &quot;.inc&quot; file.<br>
&gt; <br>
&gt; Put that .inc file in a common directory and call it something like<br=
>
&gt; initrd-kernel-&lt;foo&gt;.inc, recipes include that .inc file to opt i=
nto the<br>
&gt; behaviour and get the base definition if they want it.<br>
<br>
Ok I will do this in v5.<br>
<br>
&gt; This modular based initrd isn&#39;t going to be the default, so it has=
<br>
&gt; to be opt-in anyway. So put the opt-in and the definitions in a .inc<b=
r>
&gt; file, a recipe including it, opts-in.<br>
<br>
I think this should be the default on most machines which use<br>
core-image-initramfs-boot in oe-core.<span class=3D"gmail_default" style=3D=
"font-size:small"></span></blockquote><div><br></div><div><div class=3D"gma=
il_default" style=3D"font-size:small">I&#39;ll disagree on that point, but =
in the end, it isn&#39;t a hill that</div></div><div class=3D"gmail_default=
" style=3D"font-size:small">is worth climbing (for me). If that&#39;s the w=
ay the default policy</div><div class=3D"gmail_default" style=3D"font-size:=
small">goes, I&#39;ll just roll with it.</div><div class=3D"gmail_default" =
style=3D"font-size:small"><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">=C2=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><br>
<br>
genericarm64, beagleplay etc machines already for install of &quot;kernel-m=
odules&quot;<br>
to all images, including core-image-initramfs-boot:<br>
<br>
$ git grep MACHINE_EXTRA_RRECOMMENDS meta/conf/machine meta-yocto-bsp/conf/=
machine/ | grep kernel-modules<br>
meta-yocto-bsp/conf/machine/beaglebone-yocto.conf:MACHINE_EXTRA_RRECOMMENDS=
 =3D &quot;kernel-modules&quot;<br>
meta-yocto-bsp/conf/machine/genericarm64.conf:MACHINE_EXTRA_RRECOMMENDS +=
=3D &quot;kernel-modules&quot;<br>
meta-yocto-bsp/conf/machine/include/genericx86-common.inc:MACHINE_EXTRA_RRE=
COMMENDS +=3D &quot;kernel-modules linux-firmware&quot;<br>
meta/conf/machine/include/loongarch/qemuloongarch.inc:MACHINE_EXTRA_RRECOMM=
ENDS +=3D &quot; kernel-modules&quot;<br>
meta/conf/machine/include/riscv/qemuriscv.inc:MACHINE_EXTRA_RRECOMMENDS +=
=3D &quot; kernel-modules&quot;<br>
meta/conf/machine/qemuppc64.conf:MACHINE_EXTRA_RRECOMMENDS +=3D &quot; kern=
el-modules&quot;<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">Right, and that was by design.</div><div class=3D"gmail_de=
fault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" sty=
le=3D"font-size:small">The philosophy has been that the kernel provider sho=
uld understand</div><div class=3D"gmail_default" style=3D"font-size:small">=
and control its configuration (since we are talking about embedded</div><di=
v class=3D"gmail_default" style=3D"font-size:small">devices here). Sure, th=
ose examples took the simplest path, and that</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">was their decision / tradeoff.</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmai=
l_default" style=3D"font-size:small">We package all the modules individuall=
y (I&#39;m stating the obvious,</div><div class=3D"gmail_default" style=3D"=
font-size:small">since we all know this) so that they can be individually i=
nstalled</div><div class=3D"gmail_default" style=3D"font-size:small">and re=
quired for something that really wants to control the configuration</div><d=
iv class=3D"gmail_default" style=3D"font-size:small">tightly.</div><br></di=
v><div><div class=3D"gmail_default" style=3D"font-size:small">In any machin=
e / BSP that I build, the configuration is on purpose</div><div class=3D"gm=
ail_default" style=3D"font-size:small">and if I want to install individual =
modules, I&#39;ll do that, otherwise,=C2=A0</div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">I trust my configuration and take all the modu=
les.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small">What you have is som=
ething in the middle, and why I still think it</div><div class=3D"gmail_def=
ault" style=3D"font-size:small">needs to be opt-in. BSP creators need to un=
derstand their</div><div class=3D"gmail_default" style=3D"font-size:small">=
configuration and tune it. Having something down at the packaging</div><div=
 class=3D"gmail_default" style=3D"font-size:small">level pick and choose wh=
ich modules on their behalf means that</div><div class=3D"gmail_default" st=
yle=3D"font-size:small">they are relying on something that needs to be disc=
overed and</div><div class=3D"gmail_default" style=3D"font-size:small">twea=
ked (versus the &quot;all of it&quot; or &quot;you chose your own&quot; as =
it was</div><div class=3D"gmail_default" style=3D"font-size:small">before).=
</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
Some qemu machines don&#39;t and that causes issues since<br>
initrd is not flexible to boot even slightly different configurations,<br>
like block device emulation moved from scsi to virtio.<br>
This causes issues with oeqa selftests when small kernel or qemuboot<br>
differences break tests.<br></blockquote><div><br><div class=3D"gmail_defau=
lt" style=3D"font-size:small">And we&#39;ll continue to do that, as all the=
 boot methods and kernels</div><div class=3D"gmail_default" style=3D"font-s=
ize:small">need to be tested. But I agree, there are pros and cons to the</=
div><div class=3D"gmail_default" style=3D"font-size:small">various methods.=
</div></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
initrd itself is optional, but in core-image-initramfs-boot I made<br>
including &quot;kernel-initrd-modules&quot; the default. To me this makes s=
ense.<br>
<br>
Kernels for different machines can enable drivers as modules or as built-in=
<br>
but the initrd config stays the same and will mostly just work. I think<br>
this is a good default.<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">It is just that behaviour which is why I&#39;m saying it s=
hould be</div><div class=3D"gmail_default" style=3D"font-size:small">explic=
it and opt-in. If they change their configuration it should</div><div class=
=3D"gmail_default" style=3D"font-size:small">be with a direct line of sight=
 to how the various components</div><div class=3D"gmail_default" style=3D"f=
ont-size:small">consume it.=C2=A0</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">Preferably not &quot;I have a custom driver, I need it to boot, =
I&#39;m</div><div class=3D"gmail_default" style=3D"font-size:small">now bui=
lding it as a module&quot; .. and then wondering why it isn&#39;t</div><div=
 class=3D"gmail_default" style=3D"font-size:small">picked up in the initrd.=
 If they had to opt-in, they&#39;ll already be</div><div class=3D"gmail_def=
ault" style=3D"font-size:small">aware of the mechanism that is selecting th=
eir modules over</div><div class=3D"gmail_default" style=3D"font-size:small=
">and above what their kernel configuration dictates.</div></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
And then &quot;kernel-initrd-modules&quot; are much smaller than &quot;kern=
el-modules&quot;.<br>
Still too big for real products but better than nothing. For<br>
genericarm64 this reduced initrd image size from 200 Mb to 54 Mb.=C2=A0</bl=
ockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-siz=
e:small">Definitely a valid point / improvement. I&#39;m again back to sayi=
ng it</div><div class=3D"gmail_default" style=3D"font-size:small">just has =
to be explicit. The same way that many (most?) people</div><div class=3D"gm=
ail_default" style=3D"font-size:small">don&#39;t want or use linux-yocto as=
 production, we have to design</div><div class=3D"gmail_default" style=3D"f=
ont-size:small">our configurations as something to be opt-in and something =
that</div><div class=3D"gmail_default" style=3D"font-size:small">is clear i=
t needs to be tweaked for production.</div></div><div><br></div><div><div c=
lass=3D"gmail_default" style=3D"font-size:small">We aren&#39;t far off in o=
ur view on this.=C2=A0 Most of this looks really</div><div class=3D"gmail_d=
efault" style=3D"font-size:small">good to me, and is a good step forward. I=
 think that our</div><div class=3D"gmail_default" style=3D"font-size:small"=
>different point of view is about the breadth of the types of</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">kernels, machines, boot meth=
ods, products, etc, that are built</div><div class=3D"gmail_default" style=
=3D"font-size:small">on top and how to enable this mechanism.</div></div><d=
iv><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; I don&#39;t like the directory listings at all, but that&#39;s the bes=
t way to<br>
&gt; not hide them and again, you can&#39;t get a general enough set of<br>
&gt; definitions in a base class to serve all possible use cases. It needs<=
br>
&gt; to come from top down.<br>
<br>
Yes, improvements welcome. At least this doesn&#39;t break when drivers<br>
change from built-in or as modules and new features added to linux-yocto<br=
>
configs don&#39;t bloat the kernel so much anymore. Like the pmem patches<b=
r>
which just got in. They work as modules.<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">I&#39;m still working on this part, but trying to get this=
 release out</div><div class=3D"gmail_default" style=3D"font-size:small">th=
e door has my time mostly chewed up.=C2=A0 I&#39;d still like to explore</d=
iv><div class=3D"gmail_default" style=3D"font-size:small">a way that either=
 the kernel configuration or the packaging of the</div><div class=3D"gmail_=
default" style=3D"font-size:small">modules is how a recipe indicates that s=
omething belongs in</div><div class=3D"gmail_default" style=3D"font-size:sm=
all">this essential module list for the initrd (or whatever else).</div><di=
v class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D=
"gmail_default" style=3D"font-size:small">Richard: If you are reading this =
and get this far, is there any way</div><div class=3D"gmail_default" style=
=3D"font-size:small">to add some sort of RPROVIDES to a package that is alm=
ost a</div><div class=3D"gmail_default" style=3D"font-size:small">wild card=
 ?=C2=A0 I just haven&#39;t had time to think it through or experiment.</di=
v><div class=3D"gmail_default" style=3D"font-size:small">Rather than the di=
rectory listings, if the new initrd kernel module</div><div class=3D"gmail_=
default" style=3D"font-size:small">meta-package could be constructed (or ju=
st the image doing the</div><div class=3D"gmail_default" style=3D"font-size=
:small">installs) from something like IMAGE_INSTALL=C2=A0<a class=3D"gmail_=
plusreply" id=3D"plusReplyChip-1">+=3D &quot;kernel-essential-boot-*&#39;</=
a></div><div class=3D"gmail_default" style=3D"font-size:small">and that RPR=
OVIDES was put into the packages when they were</div><div class=3D"gmail_de=
fault" style=3D"font-size:small">created .. we&#39;d have the top down cont=
rol and explicit configuration</div><div class=3D"gmail_default" style=3D"f=
ont-size:small">I&#39;m looking for.</div><div class=3D"gmail_default" styl=
e=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-=
size:small">Bruce<br><a class=3D"gmail_plusreply"><br></a></div></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Cheers,<br>
<br>
-Mikko<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000bb4d0f063280d5e7--


Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E54EFC3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 13:15:20 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.33838.1744290915594453033
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 06:15:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fOGp14r1;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2243803b776so11105225ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 06:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744290915; x=1744895715; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eO71BXb5qCodQdFaDZ1R7IBX8pGVrGYFq69dLwgEIYY=;
        b=fOGp14r1dDl8cUbCVHOxwigZT3i24K2hccBdssGuqg6oodAUtq1dRTjyAdH1Ij3JQe
         T7y3nSijkScnxoTrj/o42NQc6U0xYkfwNajiSBgiGi0rU781eZtOFiCu4Fhbp4EhIqCG
         y0DUwCI/5R3teUU3Gok7cxncuR+1MqusPmRxLScB0kxmQzWinGUnDYv523qVw2yVGTtX
         usnLlriyUbWUyHX4ioE9xgz3nWSCkd4koZ7scCDFfSMguK8ikFuzcIIvXTBK2B5TgO9G
         rzJzEQnVB0CSf/Azwc7qaI8GZtPzYtpGdL98pTzSF6MhgMn30grGOK6Kep5cY8iUriKc
         1Yww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744290915; x=1744895715;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eO71BXb5qCodQdFaDZ1R7IBX8pGVrGYFq69dLwgEIYY=;
        b=NY5iTSd5wUhUNiZfrPxzRNjt3mTZnGAmN8Mxx9jtjB+yNXx1mPlI8Q1k/Y6UAD9wO8
         uEGidCa1wP3GUjJ6SxUDCP4B6lb5dc6bkxywzjrnKRkERqPhbiTwBp0du21+dQ8rsOqY
         mVBm2PflsX0sFKSZ6MjmKPjEQCfcV8MTp7fa7EJQpWPxog6XVsVrKAtDNy3GY7nyiy+b
         2QoIqhIy+cAu1QeU6x+G7KZpXY9hiievXsl8aM/tigQU48OhpTgD8NctzPMpNjt6eu7U
         CKtwvfygj4aRydzhZuanu+WPSNxLGrMPVxXaXW/3H+oTkOGOL8zzeH1C/0dgspyQtHAh
         2+UQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzCgVuf0IfQWX17bNofNaKA0rmcOQ4BGgLDTt5eGdeThNQRYx3W3UcZA5P2rDquEvZKjmUfH1pw4i0wmfi58xAFw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx+tC0y3FkzUyTjTgpSVENZLcqMAyAPK5cdp2Nnm916YfMq/Q7u
	iOI5dY6sA1zHCW1ZEu00M8p4NWpMLMgT+8/v0eukMnYyEx43VBDoCvOyCM2WUzOSvyBGE9dwD+7
	qSW9L+e4NghVz3wmJGu5vRn7vBIA=
X-Gm-Gg: ASbGnctDv7E5oWv5MDBqmpuslHEh8S1oGjcEL0E5XIyOBnQK603Y8lzUqL59Ro6ImF/
	XOgwQKMjunQRtx0Lt/Y54uQaTbocUwhcb4umEfzJ2KpD9AogTPCF6BeL4vb7gNwBlqukFA/faos
	TtkB/TN/mD+em5V5MMY8rtafY=
X-Google-Smtp-Source: AGHT+IEQJCQIJkvV/6T9mRhsdjYB0Nod8YYwge+Oh18C7DFtAtAdNdP6N8jUvkHpjrjL22R0BmiTfjPIe9Hnx4teD18=
X-Received: by 2002:a17:902:c408:b0:224:b60:3ce0 with SMTP id
 d9443c01a7336-22b2eda46a6mr34549955ad.5.1744290914024; Thu, 10 Apr 2025
 06:15:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-4-mikko.rapeli@linaro.org> <1c55e7536de5f36fa37076ad04ff35588b6b5f1e.camel@linuxfoundation.org>
 <Z_fBAsbV-hY-x_SC@nuoska>
In-Reply-To: <Z_fBAsbV-hY-x_SC@nuoska>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 10 Apr 2025 09:15:02 -0400
X-Gm-Features: ATxdqUEEQZFSdwjQZy0ftoyozqjemV4XyDIqaDegd6ZLXBuiekQuXq8iinMtM94
Message-ID: <CADkTA4MamOxjfPE8uHhFDmZ12OhxpJ9dfhxbsxKGZxwQ4_cCkQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 03/11] kernel.bbclass: add
 kernel-initrd-modules meta package
To: mikko.rapeli@linaro.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000050ca5806326c60a8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 13:15:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214668

--00000000000050ca5806326c60a8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 9:00=E2=80=AFAM Mikko Rapeli via lists.openembedded=
.org
<mikko.rapeli=3Dlinaro.org@lists.openembedded.org> wrote:

> Hi,
>
> On Thu, Apr 10, 2025 at 01:42:12PM +0100, Richard Purdie wrote:
> > On Fri, 2025-04-04 at 19:29 +0300, Mikko Rapeli via
> lists.openembedded.org wrote:
> > > At the moment linux-yocto kernels for various architectures
> > > are not very modular and a lot of drivers are built into the kernel
> > > even when they are not needed at runtime. These make the main kernel
> > > binary big and slow to boot. This also impacts udev in userspace
> > > which takes a long time processing events from all these built in
> drivers,
> > > for example when udev runs in initrd.
> > >
> > > Then constructing the initrd is very device and kernel configuration
> specific.
> > > initrd image needs explicitly define which binary packages to install
> > > to avoid pulling in complex dependencies. A full set of kernel module=
s
> > > via kernel-modules meta package is too big for initrd and most of the
> > > drivers are not needed for use cases like "just load modules to mount
> > > main rootfs". Then the initrd configuration breaks if kernel driver
> > > is built into the kernel since the binary package doesn't exist.
> > >
> > > Introduce kernel-initrd-modules meta package to solve these problems.
> > > The meta package adds dependencies to real kernel modules based on
> > > the kernel module file paths so that it will include several
> > > kernel subsystems and their drivers which are often needed to find
> > > main rootfs from some block device. This works when drivers are built
> > > as modules but does not break if drivers are built into the kernel.
> > >
> > > The resulting initrd is also smaller since only a subset of drivers
> > > are needed for "mount the rootfs" usecase. Tested on genericarm64
> > > kernel and qemu and AMD KV260 HW.
> > >
> > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > ---
> > >  .../kernel-module-split.bbclass               | 48 +++++++++++++++++=
++
> > >  meta/classes-recipe/kernel.bbclass            |  5 +-
> > >  meta/classes-recipe/module.bbclass            | 37 ++++++++++++++
> > >  3 files changed, 89 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta/classes-recipe/kernel-module-split.bbclass
> b/meta/classes-recipe/kernel-module-split.bbclass
> > > index 9487365eb7..101c5cd959 100644
> > > --- a/meta/classes-recipe/kernel-module-split.bbclass
> > > +++ b/meta/classes-recipe/kernel-module-split.bbclass
> > > @@ -42,6 +42,40 @@ KERNEL_MODULE_PACKAGE_PREFIX ?=3D ""
> > >  KERNEL_MODULE_PACKAGE_SUFFIX ?=3D "-${KERNEL_VERSION}"
> > >  KERNEL_MODULE_PROVIDE_VIRTUAL ?=3D "1"
> > >
> > > +# subset of kernel modules needed in initrd, to e.g. mount rootfs
> from block device
> > > +KERNEL_INITRD_MODULES_META_PACKAGE ?=3D "${@
> d.getVar("KERNEL_PACKAGE_NAME") or "kernel" }-initrd-modules"
> > > +
> > > +# match regex to path or file name. E.g. include all drivers with
> files in path /drivers/ata/
> > > +KERNEL_INITRD_MODULES_REGEX ?=3D "(.*)(\
> > > +/drivers/acpi/|\
> > > +/drivers/ata/|\
> > > +/drivers/block/|\
> > > +/drivers/cdrom/|\
> > > +/drivers/char/hw_random/|\
> > > +/drivers/char/tpm/|\
> > > +/drivers/char/|\
> > > +/drivers/crypto/|\
> > > +/drivers/dax/|\
> > > +/drivers/firmware/arm_scmi/|\
> > > +/drivers/gpu/drm/|\
> > > +/drivers/md/|\
> > > +/drivers/mmc/|\
> > > +/drivers/mtd/|\
> > > +/drivers/nvdimm/|\
> > > +/drivers/nvme/|\
> > > +/drivers/pci/|\
> > > +/drivers/scsi/|\
> > > +/drivers/tee/|\
> > > +/drivers/tty/serial/|\
> > > +/drivers/virtio/|\
> > > +/drivers/watchdog/|\
> > > +/kernel/arch/|\
> > > +/kernel/block/|\
> > > +/kernel/crypto/|\
> > > +/kernel/fs/|\
> > > +/kernel/lib/\
> > > +)(.*)"
> > > +
> > >  python split_kernel_module_packages () {
> > >      import re
> > >
> > > @@ -183,6 +217,20 @@ python split_kernel_module_packages () {
> > >      modules =3D do_split_packages(d,
> root=3D'${nonarch_base_libdir}/modules', file_regex=3Dmodule_regex,
> output_pattern=3Dmodule_pattern, description=3D'%s kernel module',
> postinst=3Dpostinst, postrm=3Dpostrm, recursive=3DTrue, hook=3Dfrob_metad=
ata,
> extra_depends=3D'%s-%s' % (kernel_package_name, kernel_version))
> > >      if modules:
> > >          d.appendVar('RDEPENDS:' + metapkg, ' '+' '.join(modules))
> > > +
> > > +    initrd_metapkg =3D d.getVar('KERNEL_INITRD_MODULES_META_PACKAGE'=
)
> or ""
> > > +    initrd_module_regex =3D d.getVar('KERNEL_INITRD_MODULES_REGEX') =
or
> ""
> > > +    if (initrd_metapkg !=3D "") and (initrd_module_regex !=3D ""):
> > > +        initrd_module_regex =3D re.compile(initrd_module_regex)
> > > +        initrd_modules =3D []
> > > +        for module in modules:
> > > +            files =3D d.getVar('FILES:' + module)
> > > +            m =3D re.match(initrd_module_regex, files)
> > > +            if m:
> > > +                initrd_modules.append(module)
> > > +
> > > +        if initrd_modules:
> > > +            d.appendVar('RDEPENDS:' + initrd_metapkg, ' '+'
> '.join(initrd_modules))
> > >  }
> > >
> > >  do_package[vardeps] +=3D '${@" ".join(map(lambda s: "module_conf_" +=
 s,
> (d.getVar("KERNEL_MODULE_PROBECONF") or "").split()))}'
> > > diff --git a/meta/classes-recipe/kernel.bbclass
> b/meta/classes-recipe/kernel.bbclass
> > > index 36ce659762..3dcaebcaed 100644
> > > --- a/meta/classes-recipe/kernel.bbclass
> > > +++ b/meta/classes-recipe/kernel.bbclass
> > > @@ -695,13 +695,14 @@ EXPORT_FUNCTIONS do_compile do_transform_kernel
> do_transform_bundled_initramfs d
> > >
> > >  # kernel-base becomes kernel-${KERNEL_VERSION}
> > >  # kernel-image becomes kernel-image-${KERNEL_VERSION}
> > > -PACKAGES =3D "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base
> ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image
> ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules
> ${KERNEL_PACKAGE_NAME}-dbg"
> > > +PACKAGES =3D "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base
> ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image
> ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules
> ${KERNEL_PACKAGE_NAME}-initrd-modules ${KERNEL_PACKAGE_NAME}-dbg"
> > >  FILES:${PN} =3D ""
> > >  FILES:${KERNEL_PACKAGE_NAME}-base =3D
> "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.order
> ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin
> ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin.modinfo"
> > >  FILES:${KERNEL_PACKAGE_NAME}-image =3D ""
> > >  FILES:${KERNEL_PACKAGE_NAME}-dev =3D "/${KERNEL_IMAGEDEST}/System.ma=
p*
> /${KERNEL_IMAGEDEST}/Module.symvers* /${KERNEL_IMAGEDEST}/config*
> ${KERNEL_SRC_PATH} ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build=
"
> > >  FILES:${KERNEL_PACKAGE_NAME}-vmlinux =3D
> "/${KERNEL_IMAGEDEST}/vmlinux-${KERNEL_VERSION_NAME}"
> > >  FILES:${KERNEL_PACKAGE_NAME}-modules =3D ""
> > > +FILES:${KERNEL_PACKAGE_NAME}-initrd-modules =3D ""
> > >  FILES:${KERNEL_PACKAGE_NAME}-dbg =3D "/usr/lib/debug /usr/src/debug"
> > >  RDEPENDS:${KERNEL_PACKAGE_NAME} =3D "${KERNEL_PACKAGE_NAME}-base (=
=3D
> ${EXTENDPKGV})"
> > >  # Allow machines to override this dependency if kernel image files a=
re
> > > @@ -716,7 +717,9 @@ ALLOW_EMPTY:${KERNEL_PACKAGE_NAME} =3D "1"
> > >  ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-base =3D "1"
> > >  ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-image =3D "1"
> > >  ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-modules =3D "1"
> > > +ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-initrd-modules =3D "1"
> > >  DESCRIPTION:${KERNEL_PACKAGE_NAME}-modules =3D "Kernel modules meta
> package"
> > > +DESCRIPTION:${KERNEL_PACKAGE_NAME}-initrd-modules =3D "Kernel initrd
> modules meta package"
> > >
> > >  pkg_postinst:${KERNEL_PACKAGE_NAME}-base () {
> > >     if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
> > > diff --git a/meta/classes-recipe/module.bbclass
> b/meta/classes-recipe/module.bbclass
> > > index f2f0b25a2d..51f864f1f9 100644
> > > --- a/meta/classes-recipe/module.bbclass
> > > +++ b/meta/classes-recipe/module.bbclass
> > > @@ -86,3 +86,40 @@ EXPORT_FUNCTIONS do_compile do_install
> > >  KERNEL_MODULES_META_PACKAGE =3D "${PN}"
> > >  FILES:${PN} =3D ""
> > >  ALLOW_EMPTY:${PN} =3D "1"
> > > +
> > > +# subset of kernel modules needed in initrd, to e.g. mount rootfs
> from block device
> > > +KERNEL_INITRD_MODULES_META_PACKAGE ?=3D "${@
> d.getVar("KERNEL_PACKAGE_NAME") or "kernel" }-initrd-modules"
> > > +
> > > +# match regex to path or file name. E.g. include all drivers with
> files in path /drivers/ata/
> > > +KERNEL_INITRD_MODULES_REGEX ?=3D "(.*)(\
> > > +/drivers/acpi/|\
> > > +/drivers/ata/|\
> > > +/drivers/block/|\
> > > +/drivers/cdrom/|\
> > > +/drivers/char/hw_random/|\
> > > +/drivers/char/tpm/|\
> > > +/drivers/char/|\
> > > +/drivers/crypto/|\
> > > +/drivers/dax/|\
> > > +/drivers/firmware/arm_scmi/|\
> > > +/drivers/gpu/drm/|\
> > > +/drivers/md/|\
> > > +/drivers/mmc/|\
> > > +/drivers/mtd/|\
> > > +/drivers/nvdimm/|\
> > > +/drivers/nvme/|\
> > > +/drivers/pci/|\
> > > +/drivers/scsi/|\
> > > +/drivers/tee/|\
> > > +/drivers/tty/serial/|\
> > > +/drivers/virtio/|\
> > > +/drivers/watchdog/|\
> > > +/kernel/arch/|\
> > > +/kernel/block/|\
> > > +/kernel/crypto/|\
> > > +/kernel/fs/|\
> > > +/kernel/lib/\
> > > +)(.*)"
> > > +
> > > +FILES:${PN}-initrd =3D ""
> > > +ALLOW_EMPTY:${PN}-initrd =3D "1"
> >
> > What is the difference between the variable defined in kernel-module-
> > split.bbclass and this one in module.bbclass? Do we need/want to
> > separate but seemingly similar definitions?
>
> One is for kernel compilation and in-tree drivers, the other is for
> out-of-tree modules.
>
> The "kernel-modules" meta package is handled this way too, with
> duplication in both.
>
> Bruce says this should be moved to linux-yocto kernel recipe,
> which IMO breaks the use of kernel-initrd-modules for vendor kernel recip=
es
> outside of oe-core. I'd rather support them too to e.g. more easily boot
> qemu or run oeqa selftests with qemu.
>

That's not quite what I said (but it is close), I said it shouldn't be
defined
at the base with no requirement opt-in from a recipe (even if this way
of constructing an initrd with the modules is not the default). It is a (
weak)
binding to specific kernel versions and directory layouts, but it is a
binding
none the less. If it sits at the base in the classes no one will ever look
at
it or even know that it should be considered.

My suggestion was not that it should only be in linux-yocto (but I'd
insist on overriding it or doing it slightly differently in linux-yocto),
I was saying that it I think  that the two definitions are far to similar
and even if there remain two definitions, they should be moved
into a .inc file.

Any kernel recipe that wants to build an initrd like this can opt-in by
including the .inc, and/or creating their own definition.

Bruce



>
> Cheers,
>
> -Mikko
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214664):
> https://lists.openembedded.org/g/openembedded-core/message/214664
> Mute This Topic: https://lists.openembedded.org/mt/112087526/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000050ca5806326c60a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 10, 2025 at 9:00=
=E2=80=AFAM Mikko Rapeli via <a href=3D"http://lists.openembedded.org">list=
s.openembedded.org</a> &lt;mikko.rapeli=3D<a href=3D"mailto:linaro.org@list=
s.openembedded.org">linaro.org@lists.openembedded.org</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
On Thu, Apr 10, 2025 at 01:42:12PM +0100, Richard Purdie wrote:<br>
&gt; On Fri, 2025-04-04 at 19:29 +0300, Mikko Rapeli via <a href=3D"http://=
lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembe=
dded.org</a> wrote:<br>
&gt; &gt; At the moment linux-yocto kernels for various architectures<br>
&gt; &gt; are not very modular and a lot of drivers are built into the kern=
el<br>
&gt; &gt; even when they are not needed at runtime. These make the main ker=
nel<br>
&gt; &gt; binary big and slow to boot. This also impacts udev in userspace<=
br>
&gt; &gt; which takes a long time processing events from all these built in=
 drivers,<br>
&gt; &gt; for example when udev runs in initrd.<br>
&gt; &gt; <br>
&gt; &gt; Then constructing the initrd is very device and kernel configurat=
ion specific.<br>
&gt; &gt; initrd image needs explicitly define which binary packages to ins=
tall<br>
&gt; &gt; to avoid pulling in complex dependencies. A full set of kernel mo=
dules<br>
&gt; &gt; via kernel-modules meta package is too big for initrd and most of=
 the<br>
&gt; &gt; drivers are not needed for use cases like &quot;just load modules=
 to mount<br>
&gt; &gt; main rootfs&quot;. Then the initrd configuration breaks if kernel=
 driver<br>
&gt; &gt; is built into the kernel since the binary package doesn&#39;t exi=
st.<br>
&gt; &gt; <br>
&gt; &gt; Introduce kernel-initrd-modules meta package to solve these probl=
ems.<br>
&gt; &gt; The meta package adds dependencies to real kernel modules based o=
n<br>
&gt; &gt; the kernel module file paths so that it will include several<br>
&gt; &gt; kernel subsystems and their drivers which are often needed to fin=
d<br>
&gt; &gt; main rootfs from some block device. This works when drivers are b=
uilt<br>
&gt; &gt; as modules but does not break if drivers are built into the kerne=
l.<br>
&gt; &gt; <br>
&gt; &gt; The resulting initrd is also smaller since only a subset of drive=
rs<br>
&gt; &gt; are needed for &quot;mount the rootfs&quot; usecase. Tested on ge=
nericarm64<br>
&gt; &gt; kernel and qemu and AMD KV260 HW.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@li=
naro.org" target=3D"_blank">mikko.rapeli@linaro.org</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =C2=A0.../kernel-module-split.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 48 ++++++++++++=
+++++++<br>
&gt; &gt; =C2=A0meta/classes-recipe/kernel.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 +-<br>
&gt; &gt; =C2=A0meta/classes-recipe/module.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 37 ++++++++++++++<br>
&gt; &gt; =C2=A03 files changed, 89 insertions(+), 1 deletion(-)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/me=
ta/classes-recipe/kernel-module-split.bbclass<br>
&gt; &gt; index 9487365eb7..101c5cd959 100644<br>
&gt; &gt; --- a/meta/classes-recipe/kernel-module-split.bbclass<br>
&gt; &gt; +++ b/meta/classes-recipe/kernel-module-split.bbclass<br>
&gt; &gt; @@ -42,6 +42,40 @@ KERNEL_MODULE_PACKAGE_PREFIX ?=3D &quot;&quot;=
<br>
&gt; &gt; =C2=A0KERNEL_MODULE_PACKAGE_SUFFIX ?=3D &quot;-${KERNEL_VERSION}&=
quot;<br>
&gt; &gt; =C2=A0KERNEL_MODULE_PROVIDE_VIRTUAL ?=3D &quot;1&quot;<br>
&gt; &gt; =C2=A0<br>
&gt; &gt; +# subset of kernel modules needed in initrd, to e.g. mount rootf=
s from block device<br>
&gt; &gt; +KERNEL_INITRD_MODULES_META_PACKAGE ?=3D &quot;${@ d.getVar(&quot=
;KERNEL_PACKAGE_NAME&quot;) or &quot;kernel&quot; }-initrd-modules&quot;<br=
>
&gt; &gt; +<br>
&gt; &gt; +# match regex to path or file name. E.g. include all drivers wit=
h files in path /drivers/ata/<br>
&gt; &gt; +KERNEL_INITRD_MODULES_REGEX ?=3D &quot;(.*)(\<br>
&gt; &gt; +/drivers/acpi/|\<br>
&gt; &gt; +/drivers/ata/|\<br>
&gt; &gt; +/drivers/block/|\<br>
&gt; &gt; +/drivers/cdrom/|\<br>
&gt; &gt; +/drivers/char/hw_random/|\<br>
&gt; &gt; +/drivers/char/tpm/|\<br>
&gt; &gt; +/drivers/char/|\<br>
&gt; &gt; +/drivers/crypto/|\<br>
&gt; &gt; +/drivers/dax/|\<br>
&gt; &gt; +/drivers/firmware/arm_scmi/|\<br>
&gt; &gt; +/drivers/gpu/drm/|\<br>
&gt; &gt; +/drivers/md/|\<br>
&gt; &gt; +/drivers/mmc/|\<br>
&gt; &gt; +/drivers/mtd/|\<br>
&gt; &gt; +/drivers/nvdimm/|\<br>
&gt; &gt; +/drivers/nvme/|\<br>
&gt; &gt; +/drivers/pci/|\<br>
&gt; &gt; +/drivers/scsi/|\<br>
&gt; &gt; +/drivers/tee/|\<br>
&gt; &gt; +/drivers/tty/serial/|\<br>
&gt; &gt; +/drivers/virtio/|\<br>
&gt; &gt; +/drivers/watchdog/|\<br>
&gt; &gt; +/kernel/arch/|\<br>
&gt; &gt; +/kernel/block/|\<br>
&gt; &gt; +/kernel/crypto/|\<br>
&gt; &gt; +/kernel/fs/|\<br>
&gt; &gt; +/kernel/lib/\<br>
&gt; &gt; +)(.*)&quot;<br>
&gt; &gt; +<br>
&gt; &gt; =C2=A0python split_kernel_module_packages () {<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0 import re<br>
&gt; &gt; =C2=A0<br>
&gt; &gt; @@ -183,6 +217,20 @@ python split_kernel_module_packages () {<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0 modules =3D do_split_packages(d, root=3D=
&#39;${nonarch_base_libdir}/modules&#39;, file_regex=3Dmodule_regex, output=
_pattern=3Dmodule_pattern, description=3D&#39;%s kernel module&#39;, postin=
st=3Dpostinst, postrm=3Dpostrm, recursive=3DTrue, hook=3Dfrob_metadata, ext=
ra_depends=3D&#39;%s-%s&#39; % (kernel_package_name, kernel_version))<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0 if modules:<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVar(&#39=
;RDEPENDS:&#39; + metapkg, &#39; &#39;+&#39; &#39;.join(modules))<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0 initrd_metapkg =3D d.getVar(&#39;KERNEL_INITR=
D_MODULES_META_PACKAGE&#39;) or &quot;&quot;<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0 initrd_module_regex =3D d.getVar(&#39;KERNEL_=
INITRD_MODULES_REGEX&#39;) or &quot;&quot;<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0 if (initrd_metapkg !=3D &quot;&quot;) and (in=
itrd_module_regex !=3D &quot;&quot;):<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 initrd_module_regex =
=3D re.compile(initrd_module_regex)<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 initrd_modules =3D []=
<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for module in modules=
:<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 files =3D d.getVar(&#39;FILES:&#39; + module)<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 m =3D re.match(initrd_module_regex, files)<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if m:<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 initrd_modules.append(module)<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if initrd_modules:<br=
>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 d.appendVar(&#39;RDEPENDS:&#39; + initrd_metapkg, &#39; &#39;+&#39; &#3=
9;.join(initrd_modules))<br>
&gt; &gt; =C2=A0}<br>
&gt; &gt; =C2=A0<br>
&gt; &gt; =C2=A0do_package[vardeps] +=3D &#39;${@&quot; &quot;.join(map(lam=
bda s: &quot;module_conf_&quot; + s, (d.getVar(&quot;KERNEL_MODULE_PROBECON=
F&quot;) or &quot;&quot;).split()))}&#39;<br>
&gt; &gt; diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-re=
cipe/kernel.bbclass<br>
&gt; &gt; index 36ce659762..3dcaebcaed 100644<br>
&gt; &gt; --- a/meta/classes-recipe/kernel.bbclass<br>
&gt; &gt; +++ b/meta/classes-recipe/kernel.bbclass<br>
&gt; &gt; @@ -695,13 +695,14 @@ EXPORT_FUNCTIONS do_compile do_transform_ke=
rnel do_transform_bundled_initramfs d<br>
&gt; &gt; =C2=A0<br>
&gt; &gt; =C2=A0# kernel-base becomes kernel-${KERNEL_VERSION}<br>
&gt; &gt; =C2=A0# kernel-image becomes kernel-image-${KERNEL_VERSION}<br>
&gt; &gt; -PACKAGES =3D &quot;${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}=
-base ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image ${KERNEL_=
PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules ${KERNEL_PACKAGE_NAME}-dbg=
&quot;<br>
&gt; &gt; +PACKAGES =3D &quot;${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}=
-base ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image ${KERNEL_=
PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules ${KERNEL_PACKAGE_NAME}-ini=
trd-modules ${KERNEL_PACKAGE_NAME}-dbg&quot;<br>
&gt; &gt; =C2=A0FILES:${PN} =3D &quot;&quot;<br>
&gt; &gt; =C2=A0FILES:${KERNEL_PACKAGE_NAME}-base =3D &quot;${nonarch_base_=
libdir}/modules/${KERNEL_VERSION}/modules.order ${nonarch_base_libdir}/modu=
les/${KERNEL_VERSION}/modules.builtin ${nonarch_base_libdir}/modules/${KERN=
EL_VERSION}/modules.builtin.modinfo&quot;<br>
&gt; &gt; =C2=A0FILES:${KERNEL_PACKAGE_NAME}-image =3D &quot;&quot;<br>
&gt; &gt; =C2=A0FILES:${KERNEL_PACKAGE_NAME}-dev =3D &quot;/${KERNEL_IMAGED=
EST}/System.map* /${KERNEL_IMAGEDEST}/Module.symvers* /${KERNEL_IMAGEDEST}/=
config* ${KERNEL_SRC_PATH} ${nonarch_base_libdir}/modules/${KERNEL_VERSION}=
/build&quot;<br>
&gt; &gt; =C2=A0FILES:${KERNEL_PACKAGE_NAME}-vmlinux =3D &quot;/${KERNEL_IM=
AGEDEST}/vmlinux-${KERNEL_VERSION_NAME}&quot;<br>
&gt; &gt; =C2=A0FILES:${KERNEL_PACKAGE_NAME}-modules =3D &quot;&quot;<br>
&gt; &gt; +FILES:${KERNEL_PACKAGE_NAME}-initrd-modules =3D &quot;&quot;<br>
&gt; &gt; =C2=A0FILES:${KERNEL_PACKAGE_NAME}-dbg =3D &quot;/usr/lib/debug /=
usr/src/debug&quot;<br>
&gt; &gt; =C2=A0RDEPENDS:${KERNEL_PACKAGE_NAME} =3D &quot;${KERNEL_PACKAGE_=
NAME}-base (=3D ${EXTENDPKGV})&quot;<br>
&gt; &gt; =C2=A0# Allow machines to override this dependency if kernel imag=
e files are<br>
&gt; &gt; @@ -716,7 +717,9 @@ ALLOW_EMPTY:${KERNEL_PACKAGE_NAME} =3D &quot;=
1&quot;<br>
&gt; &gt; =C2=A0ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-base =3D &quot;1&quot;<b=
r>
&gt; &gt; =C2=A0ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-image =3D &quot;1&quot;<=
br>
&gt; &gt; =C2=A0ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-modules =3D &quot;1&quot=
;<br>
&gt; &gt; +ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-initrd-modules =3D &quot;1&qu=
ot;<br>
&gt; &gt; =C2=A0DESCRIPTION:${KERNEL_PACKAGE_NAME}-modules =3D &quot;Kernel=
 modules meta package&quot;<br>
&gt; &gt; +DESCRIPTION:${KERNEL_PACKAGE_NAME}-initrd-modules =3D &quot;Kern=
el initrd modules meta package&quot;<br>
&gt; &gt; =C2=A0<br>
&gt; &gt; =C2=A0pkg_postinst:${KERNEL_PACKAGE_NAME}-base () {<br>
&gt; &gt; =C2=A0=C2=A0 =C2=A0if [ ! -e &quot;$D/lib/modules/${KERNEL_VERSIO=
N}&quot; ]; then<br>
&gt; &gt; diff --git a/meta/classes-recipe/module.bbclass b/meta/classes-re=
cipe/module.bbclass<br>
&gt; &gt; index f2f0b25a2d..51f864f1f9 100644<br>
&gt; &gt; --- a/meta/classes-recipe/module.bbclass<br>
&gt; &gt; +++ b/meta/classes-recipe/module.bbclass<br>
&gt; &gt; @@ -86,3 +86,40 @@ EXPORT_FUNCTIONS do_compile do_install<br>
&gt; &gt; =C2=A0KERNEL_MODULES_META_PACKAGE =3D &quot;${PN}&quot;<br>
&gt; &gt; =C2=A0FILES:${PN} =3D &quot;&quot;<br>
&gt; &gt; =C2=A0ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +# subset of kernel modules needed in initrd, to e.g. mount rootf=
s from block device<br>
&gt; &gt; +KERNEL_INITRD_MODULES_META_PACKAGE ?=3D &quot;${@ d.getVar(&quot=
;KERNEL_PACKAGE_NAME&quot;) or &quot;kernel&quot; }-initrd-modules&quot;<br=
>
&gt; &gt; +<br>
&gt; &gt; +# match regex to path or file name. E.g. include all drivers wit=
h files in path /drivers/ata/<br>
&gt; &gt; +KERNEL_INITRD_MODULES_REGEX ?=3D &quot;(.*)(\<br>
&gt; &gt; +/drivers/acpi/|\<br>
&gt; &gt; +/drivers/ata/|\<br>
&gt; &gt; +/drivers/block/|\<br>
&gt; &gt; +/drivers/cdrom/|\<br>
&gt; &gt; +/drivers/char/hw_random/|\<br>
&gt; &gt; +/drivers/char/tpm/|\<br>
&gt; &gt; +/drivers/char/|\<br>
&gt; &gt; +/drivers/crypto/|\<br>
&gt; &gt; +/drivers/dax/|\<br>
&gt; &gt; +/drivers/firmware/arm_scmi/|\<br>
&gt; &gt; +/drivers/gpu/drm/|\<br>
&gt; &gt; +/drivers/md/|\<br>
&gt; &gt; +/drivers/mmc/|\<br>
&gt; &gt; +/drivers/mtd/|\<br>
&gt; &gt; +/drivers/nvdimm/|\<br>
&gt; &gt; +/drivers/nvme/|\<br>
&gt; &gt; +/drivers/pci/|\<br>
&gt; &gt; +/drivers/scsi/|\<br>
&gt; &gt; +/drivers/tee/|\<br>
&gt; &gt; +/drivers/tty/serial/|\<br>
&gt; &gt; +/drivers/virtio/|\<br>
&gt; &gt; +/drivers/watchdog/|\<br>
&gt; &gt; +/kernel/arch/|\<br>
&gt; &gt; +/kernel/block/|\<br>
&gt; &gt; +/kernel/crypto/|\<br>
&gt; &gt; +/kernel/fs/|\<br>
&gt; &gt; +/kernel/lib/\<br>
&gt; &gt; +)(.*)&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +FILES:${PN}-initrd =3D &quot;&quot;<br>
&gt; &gt; +ALLOW_EMPTY:${PN}-initrd =3D &quot;1&quot;<br>
&gt; <br>
&gt; What is the difference between the variable defined in kernel-module-<=
br>
&gt; split.bbclass and this one in module.bbclass? Do we need/want to<br>
&gt; separate but seemingly similar definitions?<br>
<br>
One is for kernel compilation and in-tree drivers, the other is for<br>
out-of-tree modules.<br>
<br>
The &quot;kernel-modules&quot; meta package is handled this way too, with<b=
r>
duplication in both.<br>
<br>
Bruce says this should be moved to linux-yocto kernel recipe,<br>
which IMO breaks the use of kernel-initrd-modules for vendor kernel recipes=
<br>
outside of oe-core. I&#39;d rather support them too to e.g. more easily boo=
t<br>
qemu or run oeqa selftests with qemu.<br></blockquote><div><br></div><div>T=
hat&#39;s not quite what I said<span class=3D"gmail_default" style=3D"font-=
size:small"> (but it is close)</span>, I said it shouldn&#39;t be defined</=
div><div>at the base <span class=3D"gmail_default" style=3D"font-size:small=
"></span>w<span class=3D"gmail_default" style=3D"font-size:small">ith=C2=A0=
</span>no requirement opt-in from a recipe (even if this way</div><div>of c=
onstructing an<span class=3D"gmail_default" style=3D"font-size:small">=C2=
=A0</span>initrd with the modules is not the default). It is a <span class=
=3D"gmail_default" style=3D"font-size:small">(</span>weak<span class=3D"gma=
il_default" style=3D"font-size:small">)</span></div><div>binding to specifi=
c<span class=3D"gmail_default" style=3D"font-size:small">=C2=A0</span>kerne=
l versions and directory layouts, but it is a binding</div><div>none the le=
ss.<span class=3D"gmail_default" style=3D"font-size:small"> If it sits at t=
he base in the classes no one will ever look at</span></div><div><span clas=
s=3D"gmail_default" style=3D"font-size:small">it or even know that it shoul=
d be considered.</span></div><div><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">My suggestion was not that it should only be in linux-yocto (but I&#39;=
d=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:small">insist =
on overriding it or doing it slightly differently in linux-yocto),</div><di=
v class=3D"gmail_default" style=3D"font-size:small">I was saying that it I =
think=C2=A0 that the two definitions are far to similar</div><div class=3D"=
gmail_default" style=3D"font-size:small">and even if there remain two defin=
itions, they should be moved</div><div class=3D"gmail_default" style=3D"fon=
t-size:small">into a .inc file.</div><div class=3D"gmail_default" style=3D"=
font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:=
small">Any kernel recipe that wants to build an initrd=C2=A0like this can o=
pt-in by</div><div class=3D"gmail_default" style=3D"font-size:small">includ=
ing the .inc, and/or creating their own definition.</div><div class=3D"gmai=
l_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default"=
 style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
-Mikko<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#214664): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/214664" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/214664</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/112087526/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/112087526/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--00000000000050ca5806326c60a8--


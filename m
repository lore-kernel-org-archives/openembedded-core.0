Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C9BC36002
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 12:33:42 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.38226.1742819618550734506
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 05:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l9PVqyQk;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-30332dfc820so2622505a91.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 05:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742819618; x=1743424418; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eZwRIBq4brxycSSvUTKpO/bVaB9ZsktCZBTqs1yfMJQ=;
        b=l9PVqyQkqAAHzFDiEubSPcEfo5zMFNseiYc371VHu5/YQ8C9Nkaair56WtDgYuBJv+
         gniykOkVNM80Kp2CknNlLEr3OjZzI/+H3TJfYv008JJ027sLjsfT5UHnWrjmkbqIgpSo
         nSyyInQRfWDBU4T89btv65ZPo159BF1zVwVLKPyCBwFuyDvSgfaeAhHnNWD+LOjsXuHW
         PRIkGU1k2kkFBtXY0Yt7fTgmrvsN4Qx3E+eoaS6RDCbeAcg3DGoKewiZ96E9m3xUhgup
         po2jF/k8OJKjxa1SV0+x8Hdw7c2iHhUGDS3Otvad+icsA3BmTciHrm4mpcfShrcx/qsz
         9aKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742819618; x=1743424418;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eZwRIBq4brxycSSvUTKpO/bVaB9ZsktCZBTqs1yfMJQ=;
        b=xBoEVDnL22JX262pTHTMpMW5fXPK7Q9FMphuabWd1gkKZJSorZ6yBPHhv2pdDEmRS7
         XiicTGkgAqIBieDHD96BE94s9g/3r8VrQoiNVNswcWpL4dJ9/bdJvDqIj1VNLWZsNDwi
         zJEegoOkXVdsX9b0naRdKwtsXwqfCyyAUONjBSokyW8kWG2lEwYwd/Tn4/egDmabhVNz
         Knryzxef2ZN61vBJ6zNEHbkViGxhPhWGGHD281Cd822tdwSUEXLhlKn5NJ43+mvMAE00
         +kJalLGvKsRz+jLsQgIyBSyAfSSJs3ZoQwHT2tJxzneuLnS15DYmoVixmZVJRaxh3U8l
         KTgg==
X-Gm-Message-State: AOJu0YxHI7ZdJ2n4Yd4nrdPXb0+9VrmcuwlfwW96x2s8zME4OQh7Bdh4
	ThaM0Z7vQpEBqSc0FCK95kAg7nj2g7/O//XDKsHiFNxH6VR4Yc2Nzx6qZIcbBKDqAn1vaL+XVP3
	nbY9YK2B+FEaxrLknBfWHdpltABs=
X-Gm-Gg: ASbGncsJqI3ikVTdxr/TtyC4vYaRpyzHZtxpOmieOBoafQ5LxZTwkx6CSOjyyDDdHX3
	RFo1ex/+3xCgpIL1OyCRm8/ZBW7rGYTax/Mx8eh9Vs52Xpp8/oOanGSFgMtvw4Dh76ScxHD6OpI
	e8Lo04o7DvpvqXuHgPCJpeCf4F1Ho=
X-Google-Smtp-Source: AGHT+IFxixu4RogSPUz+KLpFV7VMsJP4y+zdM0QUIXjjgAUqiFvIDPSVkJzQ5GJ4geaW0h5h6U9Y5BRB0/jWoD6IFlg=
X-Received: by 2002:a17:90b:4c43:b0:2fc:c262:ef4b with SMTP id
 98e67ed59e1d1-3030feb2497mr24039557a91.18.1742819617574; Mon, 24 Mar 2025
 05:33:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250321132517.670372-1-mikko.rapeli@linaro.org>
 <20250321132517.670372-4-mikko.rapeli@linaro.org> <Z91+5mpCocPjYM+F@gmail.com>
 <Z-EMdEo0l_nVVWVv@nuoska>
In-Reply-To: <Z-EMdEo0l_nVVWVv@nuoska>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 24 Mar 2025 08:33:24 -0400
X-Gm-Features: AQ5f1JreITxtN4Kn69zLgaVDTzuFGq1vDtvxmQBBUtnxFldlCRkQWbp-r9dWUMs
Message-ID: <CADkTA4Mw=kCk60cAEXqp0DsA+bEi_a9AFSgtnf7+i+C+XY1jxg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 03/11] kernel.bbclass: add
 kernel-initrd-modules meta package
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000369877063115d051"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 12:33:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213527

--000000000000369877063115d051
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2025 at 3:40=E2=80=AFAM Mikko Rapeli <mikko.rapeli@linaro.o=
rg>
wrote:

> Hi,
>
> On Fri, Mar 21, 2025 at 10:59:50AM -0400, Bruce Ashfield wrote:
> > I was going to reply to v1, but v2 came out before I got to it!
> >
> > In message: [OE-core] [PATCH v2 03/11] kernel.bbclass: add
> kernel-initrd-modules meta package
> > on 21/03/2025 Mikko Rapeli via lists.openembedded.org wrote:
> >
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
> >
> > The list of paths gives me the nagging feeling that there's
> > a better way. With the paths, it is just something else to
> > maintain and has to work against an undefined set of kernel and
> > kernel versions (not that major directories in the kernel change,
> > so I don't think it is a big issue).
> >
> > There won't be a way to do this generically, but I'd prefer that
> > this was driven from the kernel recipes down to the packaging,
> > instead of the packaging (the classes) coming along after and
> > trying to serve the needs of those undefined sets of recipes and
> > configurations.
> >
> > The simplest would be to have the kernel recipes provide that
> > regex. That way the coupling of directories to the kernel
> > version and provider is explicit. Sure, that means the regex
> > is in recipes (and possibly repeated), but individual layers
> > and kernel providers can figure out how to minimize that
> > themselvs (.inc or whatever), so it is a solvable problem.
> >
> > The other way that I was thinking was an annotation in the
> > module meta-data that could do the same thing. i.e. it could
> > tag a configuration option's purpose and then use that to
> > generate the list of modules (versus the directories), but
> > again, that would just go in the recipe versus the base classes
> > and would allow different providers to have different ways
> > of specifying what is for the initrd.
> >
> > I honestly wouldn't provide a default in the bbclass as we
> > just have no way to test it for all the different kernels
> > and kernel providers in the ecosystem. Make the opt-in
> > explicit by requiring it in the kernel recipe to start
> > building the meta-package.
>
> I can move the regexp to kernel recipe. That makes sense.
>
> Tagging for custom kernel modules could be done, maybe
> through another variable which lists other kernel
> modules to include. But then this should not be specific
> to kernel as there may be other extra packages that
> may need to be added. Since the regex with paths creates
> generally usable initrd which are obviously not optimised
> for specific usecases or HW or machine/distro config, I
> omitted those for now.
>

I agree that it is a good starting point. With the regex moved
to the recipes, it fundamentally doesn't matter if it is done by
the regex, some sort of tagging or as you added, someone
just doing their own complete recipe.

Trying to get it too precise at the start is a waste of effort.

I'm taking a close look at the kernel configuration bits and
the tooling early this week, hopefully that will be about the
same time as your v3 for easier testing for anyone interested.

Cheers,

Bruce



>
> For the best result, users can change everything in the
> core-image-initramfs-boot recipe or replace with their own
> recipe.
>
> > > The resulting initrd is also smaller since only a subset of drivers
> > > are needed for "mount the rootfs" usecase. Tested on genericarm64
> > > kernel and qemu and AMD KV260 HW.
> > >
> > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > ---
> > >  .../kernel-module-split.bbclass               | 46 +++++++++++++++++=
++
> > >  meta/classes-recipe/kernel.bbclass            |  5 +-
> > >  meta/classes-recipe/module.bbclass            | 37 +++++++++++++++
> > >  3 files changed, 87 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta/classes-recipe/kernel-module-split.bbclass
> b/meta/classes-recipe/kernel-module-split.bbclass
> > > index 9487365eb7..06e8fbed6e 100644
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
> >
> > Is that the same regex in both files ? We probably should unify them or
> > maintainence will be harder, which is why I'm suggesting that this
> > should come from the recipes, not the bbclass itself.
>
> ACK, movint to kernel recipe and reducing to single variable.
>
> > >  python split_kernel_module_packages () {
> > >      import re
> > >
> > > @@ -183,6 +217,18 @@ python split_kernel_module_packages () {
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
> > > +    initrd_module_regex =3D
> re.compile(d.getVar('KERNEL_INITRD_MODULES_REGEX'))
> > > +    initrd_modules =3D []
> > > +    for module in modules:
> > > +        files =3D d.getVar('FILES:' + module)
> > > +        m =3D re.match(initrd_module_regex, files)
> > > +        if m:
> > > +            initrd_modules.append(module)
> > > +
> > > +    if initrd_modules:
> > > +        d.appendVar('RDEPENDS:' + initrd_metapkg, ' '+'
> '.join(initrd_modules))
> >
> > I'd suggest that we could also have a flag to completely skip the
> > processing. It isn't a particularly expensive set of operations, but
> > we tend to not do processing for boot modes that won't be used.
> >
> > If it was driven top-down from a kernel recipe like I mentioned
> > above, just testing if the KERNEL_INITRD_MODULES_REGEX was defined
> > might be a good flag for the job.
>
> Thanks, will do this in v3.
>
> Cheers,
>
> -Mikko
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000369877063115d051
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 24, 2025 at 3:40=
=E2=80=AFAM Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@linaro.org">mik=
ko.rapeli@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Hi,<br>
<br>
On Fri, Mar 21, 2025 at 10:59:50AM -0400, Bruce Ashfield wrote:<br>
&gt; I was going to reply to v1, but v2 came out before I got to it!<br>
&gt;<br>
&gt; In message: [OE-core] [PATCH v2 03/11] kernel.bbclass: add kernel-init=
rd-modules meta package<br>
&gt; on 21/03/2025 Mikko Rapeli via <a href=3D"http://lists.openembedded.or=
g" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<b=
r>
&gt; <br>
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
&gt; <br>
&gt; The list of paths gives me the nagging feeling that there&#39;s<br>
&gt; a better way. With the paths, it is just something else to<br>
&gt; maintain and has to work against an undefined set of kernel and<br>
&gt; kernel versions (not that major directories in the kernel change,<br>
&gt; so I don&#39;t think it is a big issue).<br>
&gt; <br>
&gt; There won&#39;t be a way to do this generically, but I&#39;d prefer th=
at<br>
&gt; this was driven from the kernel recipes down to the packaging,<br>
&gt; instead of the packaging (the classes) coming along after and<br>
&gt; trying to serve the needs of those undefined sets of recipes and<br>
&gt; configurations.<br>
&gt; <br>
&gt; The simplest would be to have the kernel recipes provide that<br>
&gt; regex. That way the coupling of directories to the kernel<br>
&gt; version and provider is explicit. Sure, that means the regex<br>
&gt; is in recipes (and possibly repeated), but individual layers<br>
&gt; and kernel providers can figure out how to minimize that<br>
&gt; themselvs (.inc or whatever), so it is a solvable problem.<br>
&gt; <br>
&gt; The other way that I was thinking was an annotation in the<br>
&gt; module meta-data that could do the same thing. i.e. it could<br>
&gt; tag a configuration option&#39;s purpose and then use that to<br>
&gt; generate the list of modules (versus the directories), but<br>
&gt; again, that would just go in the recipe versus the base classes<br>
&gt; and would allow different providers to have different ways<br>
&gt; of specifying what is for the initrd.<br>
&gt; <br>
&gt; I honestly wouldn&#39;t provide a default in the bbclass as we<br>
&gt; just have no way to test it for all the different kernels<br>
&gt; and kernel providers in the ecosystem. Make the opt-in<br>
&gt; explicit by requiring it in the kernel recipe to start<br>
&gt; building the meta-package.<br>
<br>
I can move the regexp to kernel recipe. That makes sense.<br>
<br>
Tagging for custom kernel modules could be done, maybe<br>
through another variable which lists other kernel<br>
modules to include. But then this should not be specific<br>
to kernel as there may be other extra packages that<br>
may need to be added. Since the regex with paths creates<br>
generally usable initrd which are obviously not optimised<br>
for specific usecases or HW or machine/distro config, I<br>
omitted those for now.<br></blockquote><div><br></div><div><div class=3D"gm=
ail_default" style=3D"font-size:small">I agree that it is a good starting p=
oint. With the regex moved</div><div class=3D"gmail_default" style=3D"font-=
size:small">to the recipes, it fundamentally doesn&#39;t matter if it is do=
ne by</div><div class=3D"gmail_default" style=3D"font-size:small">the regex=
, some sort of tagging or as you added, someone</div><div class=3D"gmail_de=
fault" style=3D"font-size:small">just doing their own complete recipe.</div=
><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div clas=
s=3D"gmail_default" style=3D"font-size:small">Trying to get it too precise =
at the start is a waste of effort.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">I&#39;m taking a close look at the kernel configuration bits and=
</div><div class=3D"gmail_default" style=3D"font-size:small">the tooling ea=
rly this week, hopefully that will be about the</div><div class=3D"gmail_de=
fault" style=3D"font-size:small">same time as your v3 for easier testing fo=
r anyone interested.</div><div class=3D"gmail_default" style=3D"font-size:s=
mall"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Chee=
rs,</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
For the best result, users can change everything in the<br>
core-image-initramfs-boot recipe or replace with their own<br>
recipe.<br>
<br>
&gt; &gt; The resulting initrd is also smaller since only a subset of drive=
rs<br>
&gt; &gt; are needed for &quot;mount the rootfs&quot; usecase. Tested on ge=
nericarm64<br>
&gt; &gt; kernel and qemu and AMD KV260 HW.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@li=
naro.org" target=3D"_blank">mikko.rapeli@linaro.org</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 .../kernel-module-split.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 46 +++++++++++++++++++<br>
&gt; &gt;=C2=A0 meta/classes-recipe/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 5 +-<br>
&gt; &gt;=C2=A0 meta/classes-recipe/module.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 37 +++++++++++++++<br>
&gt; &gt;=C2=A0 3 files changed, 87 insertions(+), 1 deletion(-)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/me=
ta/classes-recipe/kernel-module-split.bbclass<br>
&gt; &gt; index 9487365eb7..06e8fbed6e 100644<br>
&gt; &gt; --- a/meta/classes-recipe/kernel-module-split.bbclass<br>
&gt; &gt; +++ b/meta/classes-recipe/kernel-module-split.bbclass<br>
&gt; &gt; @@ -42,6 +42,40 @@ KERNEL_MODULE_PACKAGE_PREFIX ?=3D &quot;&quot;=
<br>
&gt; &gt;=C2=A0 KERNEL_MODULE_PACKAGE_SUFFIX ?=3D &quot;-${KERNEL_VERSION}&=
quot;<br>
&gt; &gt;=C2=A0 KERNEL_MODULE_PROVIDE_VIRTUAL ?=3D &quot;1&quot;<br>
&gt; &gt;=C2=A0 <br>
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
&gt; <br>
&gt; Is that the same regex in both files ? We probably should unify them o=
r<br>
&gt; maintainence will be harder, which is why I&#39;m suggesting that this=
<br>
&gt; should come from the recipes, not the bbclass itself.<br>
<br>
ACK, movint to kernel recipe and reducing to single variable.<br>
<br>
&gt; &gt;=C2=A0 python split_kernel_module_packages () {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 import re<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; @@ -183,6 +217,18 @@ python split_kernel_module_packages () {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 modules =3D do_split_packages(d, root=3D&#39;=
${nonarch_base_libdir}/modules&#39;, file_regex=3Dmodule_regex, output_patt=
ern=3Dmodule_pattern, description=3D&#39;%s kernel module&#39;, postinst=3D=
postinst, postrm=3Dpostrm, recursive=3DTrue, hook=3Dfrob_metadata, extra_de=
pends=3D&#39;%s-%s&#39; % (kernel_package_name, kernel_version))<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if modules:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;RDEPENDS:&#39;=
 + metapkg, &#39; &#39;+&#39; &#39;.join(modules))<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 initrd_metapkg =3D d.getVar(&#39;KERNEL_INITRD_MOD=
ULES_META_PACKAGE&#39;)<br>
&gt; &gt; +=C2=A0 =C2=A0 initrd_module_regex =3D re.compile(d.getVar(&#39;K=
ERNEL_INITRD_MODULES_REGEX&#39;))<br>
&gt; &gt; +=C2=A0 =C2=A0 initrd_modules =3D []<br>
&gt; &gt; +=C2=A0 =C2=A0 for module in modules:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 files =3D d.getVar(&#39;FILES:&#39; =
+ module)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 m =3D re.match(initrd_module_regex, =
files)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if m:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 initrd_modules.append(=
module)<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 if initrd_modules:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;RDEPENDS:&#39; + in=
itrd_metapkg, &#39; &#39;+&#39; &#39;.join(initrd_modules))<br>
&gt; <br>
&gt; I&#39;d suggest that we could also have a flag to completely skip the<=
br>
&gt; processing. It isn&#39;t a particularly expensive set of operations, b=
ut<br>
&gt; we tend to not do processing for boot modes that won&#39;t be used.<br=
>
&gt; <br>
&gt; If it was driven top-down from a kernel recipe like I mentioned<br>
&gt; above, just testing if the KERNEL_INITRD_MODULES_REGEX was defined<br>
&gt; might be a good flag for the job.<br>
<br>
Thanks, will do this in v3.<br>
<br>
Cheers,<br>
<br>
-Mikko<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000369877063115d051--


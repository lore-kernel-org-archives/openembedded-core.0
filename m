Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F332DC3DA7A
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 11:27:59 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.11471.1673004473108857831
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 03:27:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MbnDN2Mv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id h16so985303wrz.12
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 03:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I0Ee2PHeiox4peDc/5k2kbLIdzfylJ+pfdJlTu6byWs=;
        b=MbnDN2MvjEUkAM21XFtcBOubLwBnSrOKyxzIvng7tiE863vZLlvJYhLwD8wigUNsuO
         PAqnp9yRFtsWFPEkC6thFhKNkL1DuxsEhyAjxntkh4OIaTJtPFggbcw8SbyD4HPadPH0
         VE/8vxRlCWCz2mR5YCxRL9yOkSeEQJpG+ylqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I0Ee2PHeiox4peDc/5k2kbLIdzfylJ+pfdJlTu6byWs=;
        b=Zde4wS1NZkz+GSHeqN7S9z82S7F/9fo96tPxnxFw9ItrKUj79i/sGYP65w/cB+TtHW
         cO6HUkx8K4L6GkL5+tnY9V2fOUWNly0zjtzf//A+YCAFq5ATzhnfnNwgyPnQH7gKkWbm
         TsIq39nHnYHKl4Xj6p0O2Mwb6Fy6eq4pvLlF8thVUYANjQScY8ojswsKYfcDXRA3y766
         o1hyx7ujgASGEUyHgo91NrC4f5QPxFoPdFDSHe/JlWPv75wH/l98iBg5j5lj6nDBTNoT
         MzsQsxVhemxvvA8v6j494JXVvpnOeNCrvxDoV4p3AgixT2FgW1v+1nCO4SUuRuNs7KPe
         BX7w==
X-Gm-Message-State: AFqh2kqvkwdjjKS6YMgc4+k1r2zr2qeXYyYNZU0n2I6pHVXK2F5y/TQh
	70OioA9p638lAySsuHHtZeI51g==
X-Google-Smtp-Source: AMrXdXs3wsMpulIvsjEh4CMlQaJcdO+T4AN/5Ajhae0T9v3Xd5TKKo4gMgmg64SQGfxb9iNi4QYcWQ==
X-Received: by 2002:adf:9dd1:0:b0:242:165c:95ed with SMTP id q17-20020adf9dd1000000b00242165c95edmr33557443wre.48.1673004471376;
        Fri, 06 Jan 2023 03:27:51 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:49cf:c46d:e32d:e951? ([2001:8b0:aba:5f3c:49cf:c46d:e32d:e951])
        by smtp.gmail.com with ESMTPSA id k2-20020a5d5182000000b00236545edc91sm920286wrv.76.2023.01.06.03.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 03:27:51 -0800 (PST)
Message-ID: <a305ae31f8b440d79f66e63b38d1c42c8c6960b6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] linux-yocto: Autoload sound driver on
 QEMU x86
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Jonas <toertel@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org, michael.opdenacker@bootlin.com
Date: Fri, 06 Jan 2023 11:27:49 +0000
In-Reply-To: <CAEE5dN09OUTNQXNaDBBmVmrC9N2+r96chz4Q8NhtsF7vqZkMcg@mail.gmail.com>
References: <20230104121808.1065203-1-toertel@gmail.com>
	 <20230104121808.1065203-3-toertel@gmail.com>
	 <CADkTA4OBb1J9Ld19rzvuQntdj04rRUdH9sP=cPSKwvO=U1s-Tw@mail.gmail.com>
	 <CAEE5dN1jL4KYpYMz9En=NqiEE-Bu8HsCXhTSUgECekktmjr78A@mail.gmail.com>
	 <CADkTA4NhVxONZONVWd9yP4g735Mr5cVThLPcWRUv0vBYkXmc3A@mail.gmail.com>
	 <CAEE5dN09OUTNQXNaDBBmVmrC9N2+r96chz4Q8NhtsF7vqZkMcg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 11:27:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175577

On Fri, 2023-01-06 at 11:13 +0100, Mark Jonas wrote:
> Hi Bruce,
>=20
> On Thu, Jan 5, 2023 at 3:57 PM Bruce Ashfield <bruce.ashfield@gmail.com> =
wrote:
> >=20
> > On Thu, Jan 5, 2023 at 8:42 AM Mark Jonas <toertel@gmail.com> wrote:
> > >=20
> > > Hi Bruce,
> > >=20
> > > On Wed, Jan 4, 2023 at 5:07 PM Bruce Ashfield <bruce.ashfield@gmail.c=
om> wrote:
> > > >=20
> > > > On Wed, Jan 4, 2023 at 7:18 AM Mark Jonas <toertel@gmail.com> wrote=
:
> > > > >=20
> > > > > From: Mark Jonas <toertel@gmail.com>
> > > > >=20
> > > > > If DISTRO_FEATURES includes ALSA then automatically load the
> > > > > snd-intel8x0 kernel module on qemux86 and qemux86-64. This matche=
s the
> > > > > machine configurations conf/machine/qemux86.conf and qemux86-64.c=
onf.
> > > > >=20
> > > > > Signed-off-by: Mark Jonas <toertel@gmail.com>
> > > > > ---
> > > > >  meta/recipes-kernel/linux/linux-yocto.inc | 5 +++++
> > > > >  1 file changed, 5 insertions(+)
> > > > >=20
> > > > > diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/rec=
ipes-kernel/linux/linux-yocto.inc
> > > > > index 091003ed82..c8a9b0a1e3 100644
> > > > > --- a/meta/recipes-kernel/linux/linux-yocto.inc
> > > > > +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> > > > > @@ -37,6 +37,11 @@ KERNEL_FEATURES:append =3D " ${@bb.utils.conta=
ins('MACHINE_FEATURES', 'efi', 'cfg/
> > > > >  KERNEL_FEATURES:append =3D " ${@bb.utils.contains('MACHINE_FEATU=
RES', 'numa', 'features/numa/numa.scc', '', d)}"
> > > > >  KERNEL_FEATURES:append =3D " ${@bb.utils.contains('MACHINE_FEATU=
RES', 'vfat', 'cfg/fs/vfat.scc', '', d)}"
> > > > >=20
> > > > > +# sound driver recommended by conf/machine/qemux86*.conf
> > > > > +ALSA_MODULES =3D "${@bb.utils.contains("DISTRO_FEATURES", "alsa"=
, "snd-intel8x0", "", d)}"
> > > > > +KERNEL_MODULE_AUTOLOAD:qemux86 +=3D "${ALSA_MODULES}"
> > > > > +KERNEL_MODULE_AUTOLOAD:qemux86-64 +=3D "${ALSA_MODULES}"
> > > >=20
> > > > This gets us most of the way, but if we are going to do this we sho=
uld
> > > > complete the job.
> > > >=20
> > > > We really need to make sure there's a configuration fragment that
> > > > explicitly enables
> > > > the modules we need (and not count on defaults, or other selects). =
That would go
> > > > into the kernel-cache.
> > > >=20
> > > > It would then be something we'd add to the KERNEL_FEATRES triggered=
 off the
> > > > distro feature. Just like we are doing with numa and vfat that is v=
isible in the
> > > > context of the patch.
> > >=20
> > > In my understanding this is already the case. See for example
> > > linux-yocto_5.19.bb which contains the following lines.
> > >=20
> > > KERNEL_FEATURES:append:qemux86=3D" cfg/sound.scc cfg/paravirt_kvm.scc=
"
> > > KERNEL_FEATURES:append:qemux86-64=3D" cfg/sound.scc cfg/paravirt_kvm.=
scc"
> > >=20
> > > Does that maybe mean I should better add the KERNEL_MODULE_AUTOLOAD
> > > into the same file where the corresponding configuration fragment is
> > > added? But that would mean to duplicate the lines over five recipes.
> > >=20
> > > Alternatively I could move the cfg/sound.scc out of the recipes into
> > > the linux-yocto.inc. But then linux-yocto-tiny_*.bb recipes would als=
o
> > > get it.
> >=20
> > I definitely wasn't clear. Sorry about that, I'm still partially on
> > holidays and didn't have enough coffee when I wrote that.
> >=20
> > That is close to what I meant. It is one thing to define the options
> > in our generic sound "buckets" and another to put a specific module
> > into the autoload.
> >=20
> > If we are going to autoload a module, the option really should be
> > pulled out of the generic bucket, and put into something smaller /
> > specific to what we are trying to do, and trigger the inclusion of
> > that fragment only when the appropriate distro feature is set. The
> > machine conf files specifying specific modules isn't ideal, since it
> > is largely "aspirational" unless it is coupled with a KERNEL_FEATURE
> > that is set based on a machine or distro feature.
>=20
> I have to admit that I feel a bit lost. I am not really sure I
> understood what you meant.
>=20
> Is the "generic bucket" cfg/sound.scc? But why should we break that
> up? A module only ends up in an image if the module is installed. And
> the installation is controlled e.g. by MACHINE_EXTRA_RRECOMMENDS in
> the machine file.

I might also be misunderstanding but I think what Bruce is asking is
that the qemux86 sound pieces be broken out of cfg/sound.scc. In case
you didn't find them, the files are here:

https://git.yoctoproject.org/yocto-kernel-cache/tree/cfg/sound.scc
https://git.yoctoproject.org/yocto-kernel-cache/tree/cfg/sound.cfg

and the question is which of the options in sound.cfg are the drivers
which qemu needs on x86.

I think Bruce would like a patch which splits those items out and
triggers them on qemux86 specifically.

This means if things change in future, we know exactly which module
options we need for sound on qemux86.

Bruce can correct me if I misunderstand! :)

> > If you search the mailing list archives, you'll see me musing about
> > how I need to change those unconditional appends of option to qemu, as
> > it makes defining a new qemu machine problematic (if the options are
> > causing issues). The tweak I'm describing is a small step in that
> > direction.
>=20
> What I understood is that you propose to change the existing
>=20
> KERNEL_FEATURES:append:qemux86=3D" cfg/sound.scc cfg/paravirt_kvm.scc"
> KERNEL_FEATURES:append:qemux86-64=3D" cfg/sound.scc cfg/paravirt_kvm.scc"
>=20
> in e.g. linux-yocto_5.19.bb to (remove cfg/sound.scc)
>=20
> KERNEL_FEATURES:append:qemux86=3D" cfg/paravirt_kvm.scc"
> KERNEL_FEATURES:append:qemux86-64=3D" cfg/paravirt_kvm.scc"
>=20
> and add (move) the following into linux-yocto.inc
>=20
> KERNEL_FEATURES:append:qemuall=3D"
> ${@bb.utils.contains('MACHINE_FEATURES', 'alsa', 'cfg/sound.scc', '',
> d)}"
>=20
> That is, instead of coupling the compilation of QEMU sound driver
> modules based on machine name qemux86 and qemux86-64 we activate it
> for all QEMU machines which also have alsa as a MACHINE_FEATURE. And
> that is set in machine/include/qemu.inc.
>=20
> > One new question comes to mind, what init system were you testing with
> > (default poky and sysvinit ?) ? If we now have the proper init system,
> > are no events being triggered to load the modules now that the proper
> > ones are in the machine files ?
>=20
> I was testing on Poky with the default init system i.e, sysvinit.
> Without the KERNEL_MODULE_AUTOLOAD line the snd-intel8x0 module is not
> loaded.
>=20
> And it seems you are right: The KERNEL_MODULE_AUTOLOAD is superfluous.
> Even when I remove the second patch the modules are still loaded. I am
> a little puzzled why it originally seemed to me that it was necessary.

I'm not sure on that. The kernel will try and autoprobe for drivers for
hardware it has present where it can though.

Cheers,

Richard




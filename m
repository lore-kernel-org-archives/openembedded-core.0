Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E14CA1005
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 17:04:59 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web10.83034.1756832694434533827
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 10:04:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PteBa5vq;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.180, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e96ff518c08so4741206276.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 10:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756832693; x=1757437493; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUH0Eyrs/WBuswmVgSMg4mEr27tgZI8q+SyhubOdsFE=;
        b=PteBa5vqmS9FNGHXR+agf28+2OiPgMLYTorWbsOUFfN828Le7WACSzXpS9t7epdd/+
         aNgARuU+kY/pirkIz5UNr9NzclUFnEhWbuPt84HTxJVc26lTVBppJPjp9coDZ3fZy7oq
         p8IqnOvdhGC2DuIsAiuwnDdBYiu1rWKhNgCvG8zwLZ93g8t1WMmVm/qUCOy0l0VUTpQT
         Ag47+8bjzBNqbJf25NWoNcUw2Km/9zKEcobCwCKRXKyNE9x2hrLJyRn//yDL/5kXmri9
         pCZO3hZSpsLrv5Cdw5XB4+v3GR6nrsuOGy7X/IHAvB4tTQ9C35p4yUQV61b10bajfETo
         Jt9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756832693; x=1757437493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zUH0Eyrs/WBuswmVgSMg4mEr27tgZI8q+SyhubOdsFE=;
        b=sLkXVRcNW3CheIKXJP/ddL9ae30NqymJvmFb9FsFLaL8m54nPa8SF1Q7ac6qkMhuiW
         Kubbw4lYrIJ+M+Q8fIAySoJLIPEiaqCQz3D1hwGoLwVPwaQhzJPG4sfjE/eeqfv3AH2W
         frJUNA+94yuAHwb37qQvULIhfS+BhhLjkcFGB0iGeCyqRPXC0eQkMld58XpN4EwNkeE9
         i48Lbn0wN0hbyhuNh1+q/z3NkFdt9Rmk4rouTZ8CXAVQU+/0c/lPadIXwso8zOKQ/IRx
         znV4GFJvsWj513+oXBbx66eQKw3IXlDWLJlkFtatthzPdupgW23jYbZBX9lWi7Qr3Ghe
         9W9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXmy/K7Lx0LublqpGGCx3civ6K+RK2AAQk5dYth6RVI1h0zhBAxX9pIl0EWAZwxP1zvOcNyfqymMgfypxnIQWCjDw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyAPjCDxShZKAhRAsIZj6ZqBmxuleL8DNZ6H7DYJRinpGXl4okG
	73ofy4CzsrLSSCa6vAe8V30906oVJ7LuTp5p8THy0YqEjijFvBL0eppcF2Vb8OtA+lYSAmq4HYB
	6CtydToslBvNt7oJ6SFzWhxFOz53xQBWm7EYlyD07DQ==
X-Gm-Gg: ASbGncsvtMifd0VCnkf/MNO+6mEUxBn/c0mKZpIRZTSGa9gj8B+Nn54juXsESD6bl59
	rS6DHo4RggfwVcj5kJJNNXHE5bCq+62pTVfgDZvpQEXjtjcYcFyi/jti7aThDSlksfg6/qKFlSR
	87/CQrs/5p0N4QsVEq4ZfHNkg2DgWvJsOkQqVsd8tBbKiFLs/ITOwtlII8D614X2PLQZOeGzDmi
	VsPydGSv13fTQUINMYBXa9wUbAzFWt/A/hmZEN43Tlg9EHwpA==
X-Google-Smtp-Source: AGHT+IHrp41lcLp9iFRAj7ISGFZPs8oO90hKtwaRl0mWf1QwN87Vj+ryDNgXBCTZgx6qVX3eCbbUnyDgT27ABeZfrcw=
X-Received: by 2002:a05:6902:4004:b0:e98:a86f:65f6 with SMTP id
 3f1490d57ef6-e98a86f6d78mr13924373276.44.1756832693011; Tue, 02 Sep 2025
 10:04:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1753041740.git.steve@sakoman.com> <850949594410a9a228e164977c9e8a08f4a52876.1753041740.git.steve@sakoman.com>
 <356fbb5d-9212-473b-8a9a-fd2f57e5d064@gmail.com> <CAMKF1so=yDdLjNvxuPF6xO1+LQG2=RUAjs+mtpU-MWkY0yk8oQ@mail.gmail.com>
In-Reply-To: <CAMKF1so=yDdLjNvxuPF6xO1+LQG2=RUAjs+mtpU-MWkY0yk8oQ@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 2 Sep 2025 10:04:42 -0700
X-Gm-Features: Ac12FXx4BpHANGldO1XFNuoMam27sxysTqUE1HdLmdgAeoE35dXz3QIQ9Yqfn08
Message-ID: <CAOSpxdad5rMUoZBAfdcSVSdng1jJ7g3WpXRPS0D+FWP6F=_78w@mail.gmail.com>
Subject: Re: [OE-core][walnascar 10/12] linux-yocto/6.12: riscv: Enable
 TUNE_FEATURES based KERNEL_FEATURES
To: Khem Raj <raj.khem@gmail.com>
Cc: skandigraun@gmail.com, openembedded-core@lists.openembedded.org, 
	mark.hatle@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 17:04:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222744

On Fri, Aug 29, 2025 at 9:34=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On Fri, Aug 29, 2025 at 7:11=E2=80=AFAM Gyorgy Sarvari via
> lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > Since this patch, it looks like qemuriscv64 doesn't boot in Walnascar.
> >
> > I'm using a vanilla core-image-sato with some extra added applications.
> > I can't really figure out how to save the console output from qemu, so
> > all I offer is a useless screenshot that is not showing anything becaus=
e
> > it scrolled too far: https://postimg.cc/G8sqjK0b
> >
> > Once I remove this patch, it boots again. Am I missing something on my
> > end, or is this something with the combo of Walnascar and this patch?
> >
> > On 7/20/25 22:04, Steve Sakoman via lists.openembedded.org wrote:
> > > From: Mark Hatle <mark.hatle@amd.com>
> > >
> > > Allow the risc-v TUNE_FEATURES to select specific ISA (kconfig) selec=
tions
> > > in the kernel config via config fragments selected by KERNEL_FEATURES=
.
> > >
> > > This allows the following items to be selected dynamically:
> > >
> > >     CONFIG_ARCH_RV32I
> > >     CONFIG_ARCH_RV64I
> > >     CONFIG_FPU
> > >     CONFIG_RISCV_ISA_C
> > >     CONFIG_RISCV_ISA_V
> > >     CONFIG_RISCV_ISA_ZBB
> > >     CONFIG_RISCV_ISA_ZICBOM
> > >     CONFIG_RISCV_ISA_ZICBOZ
> > >     CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
> > >
> > > Note: Some ISA options, such as CONFIG_RISCV_ISA_C may be reenabled b=
y other
> > > options such as CONFIG_EFI.  This is properly reported by the configu=
ration
> > > tooling.
> > >
> > > Signed-off-by: Mark Hatle <mark.hatle@amd.com>
> > > Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > (cherry picked from commit 45a1b5aa6abc9007d0d87efc2d740b5564a209dd)
> > > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > > ---
> > >  meta/recipes-kernel/linux/linux-yocto.inc | 16 ++++++++++++++++
> > >  1 file changed, 16 insertions(+)
> > >
> > > diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes=
-kernel/linux/linux-yocto.inc
> > > index 389329030d..4d0a726bb6 100644
> > > --- a/meta/recipes-kernel/linux/linux-yocto.inc
> > > +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> > > @@ -37,6 +37,22 @@ KERNEL_FEATURES:append =3D " ${@bb.utils.contains(=
'MACHINE_FEATURES', 'efi', 'cfg/
> > >  KERNEL_FEATURES:append =3D " ${@bb.utils.contains('MACHINE_FEATURES'=
, 'numa', 'features/numa/numa.scc', '', d)}"
> > >  KERNEL_FEATURES:append =3D " ${@bb.utils.contains('MACHINE_FEATURES'=
, 'vfat', 'cfg/fs/vfat.scc', '', d)}"
> > >
> > > +KERNEL_FEATURES_RISCV =3D "\
> > > +    arch/riscv/tunes/riscv-isa-clear.scc \
> > > +    ${@bb.utils.contains(    'TUNE_FEATURES', 'rv 32 i m a', 'arch/r=
iscv/tunes/riscv-isa-rv32i.scc',  '', d)} \
> > > +    ${@bb.utils.contains(    'TUNE_FEATURES', 'rv 64 i m a', 'arch/r=
iscv/tunes/riscv-isa-rv64i.scc',  '', d)} \
> > > +    ${@bb.utils.contains(    'TUNE_FEATURES', 'f d',         'arch/r=
iscv/tunes/riscv-isa-fpu.scc',    '', d)} \
> > > +    ${@bb.utils.contains(    'TUNE_FEATURES', 'c',           'arch/r=
iscv/tunes/riscv-isa-c.scc',      '', d)} \
> > > +    ${@bb.utils.contains(    'TUNE_FEATURES', 'v',           'arch/r=
iscv/tunes/riscv-isa-v.scc',      '', d)} \
> > > +    ${@bb.utils.contains_any('TUNE_FEATURES', 'b zba',       'arch/r=
iscv/tunes/riscv-isa-zba.scc',    '', d)} \
> > > +    ${@bb.utils.contains_any('TUNE_FEATURES', 'b zbb',       'arch/r=
iscv/tunes/riscv-isa-zbb.scc',    '', d)} \
> > > +    ${@bb.utils.contains(    'TUNE_FEATURES', 'zbc',         'arch/r=
iscv/tunes/riscv-isa-zbc.scc',    '', d)} \
> > > +    ${@bb.utils.contains(    'TUNE_FEATURES', 'zicbom',      'arch/r=
iscv/tunes/riscv-isa-zicbom.scc', '', d)} \
> > > +    "
> > > +
> > > +KERNEL_FEATURES:append:riscv32 =3D " ${KERNEL_FEATURES_RISCV}"
> > > +KERNEL_FEATURES:append:riscv64 =3D " ${KERNEL_FEATURES_RISCV}"
> > > +
>
> I think this patch needs [1] backported as well which I would not
> recommend. Its better to revert this
> patch from walnascar.

Thanks for reviewing.

I have reverted the patch as you suggested.

Steve
>
> [1] https://git.yoctoproject.org/poky/commit/?id=3D3c5c4cfa6bf4aa88bcd69e=
2688fdceea6a655165
>
> > >  # A KMACHINE is the mapping of a yocto $MACHINE to what is built
> > >  # by the kernel. This is typically the branch that should be built,
> > >  # and it can be specific to the machine or shared
> > >
> > >
> > >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#222615): https://lists.openembedded.org/g/openembed=
ded-core/message/222615
> > Mute This Topic: https://lists.openembedded.org/mt/114257145/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >


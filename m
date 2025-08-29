Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91D0FCA0FF0
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 16:34:42 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.18767.1756485279418578445
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Aug 2025 09:34:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Po3j8gwj;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-71d71bcab6fso19487417b3.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Aug 2025 09:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756485278; x=1757090078; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a++kCKi17TxCmvIdfp0yCMMJ2V5DHCMSSt3FxpHlLrs=;
        b=Po3j8gwjwSvmylV2rDL6Ni9GnNNUWdEoIVKGpwOr6ZmJzkQkRMUuYds9XRy3Gu9U9c
         FcI3BhbumpzWRF2rwDxY7VHtOW7oF/Lhzzg50sRt8yvoElGFs1LiBSb1pzLMcnBJFFMH
         ULogJazB95qq8v/Fm0Emo/YI4xgpk/5VqaCeGHvlDkUo5fXrPCOBO/ft6D63wDR6OzgF
         J/jHAhHfdSa8g/bmLMBj+V6cKWNexjMuselQWFjbNSNAT+H1T8Pe5zn3JWh5Zhrn6rB8
         G5OoOJv+iT/zq5uLXKN/5itBkBx94bOkHfrb4cZq3FmFEDGPp0QO+d/z6t8obrCjHO0j
         L4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756485278; x=1757090078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a++kCKi17TxCmvIdfp0yCMMJ2V5DHCMSSt3FxpHlLrs=;
        b=PWUKu0XxpQvVX3iduVvqQPidCtmkPTx5Bqz/JaAmqlmq8ySyjDaoC4LcCXJffziRJT
         AC0DwD7EodIWI1cf7wtOmsMZkrSGa9eol4WK3ecDoKg40Tk1jIf35yck/Qb4+WoAiqdL
         6ee74MO9ZrII/0SQS7AW/Rx9EN/iRi+uct79b1V5X1xs+gXsZ81Yzb5fVuVnWjTB2lP8
         oRoG9nSuMV9+KBL2Fy7hTsjYPERc6MbR/A96tYQETCCW6T9x3CibeTx3bTorCEymhqOL
         ClccYSLhBVNOWKpaWW8atJZd6Ig9Dc9kN/oaPc3M0wmTJ9p/NTzbSuAZRE1vMURvmcu9
         9QBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmR0dT4RWlP2AEhGJ/aTKjLyDU0Im97HVyGnkyPj2UuucQU+xguVN/XbzncxzF2mv9ejhs2hffhl7KQGdpA12WYg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz8SIEzdSeGBw7nxj65wsqkqVW7rSfQfRJvSHb2RQFyEXqFVKp5
	S/Ng7C4epa+T0QvNmPNAmMFUUV5QxrzHZn9K2RtpFbDDe7IOLUi2xBs+uQC0SyyKQXHT9aYl1mt
	SDOAXNvIZoGQdRo5xOEy8CedJo/w0L2M=
X-Gm-Gg: ASbGncsOwdbAAF3nTLoO7mc5HrMTsKDz2e7Ck5WzmklbuM41BcBfK+FMkP0SUufLRaj
	ofEgmLqFxj4s40udtKNNd9yOZ8laeQp7pWqg78qYM0EoUViS7bu/YOCbC+ilZbrLtR7wCEw5VPj
	X7JBYE8rY8Na8USRPldG3W+QLyJ1tIC3zL/IB9YKPbyUttfRMiSmOYcRycK4uKgI9LkZLfxMk/1
	76yrzImy+oNHWJpPWnpszNe05W+pwONSAS2xSfvxyqgR+A4xxO1Q3w5wctD75flSE7EchemEoy1
	IX6Elm51gf3AYfQ9ShCCNLmmFaYYUyM0mLVxF3kqo2/cr9KLF4iZ84K92iF9/SSF2qA+
X-Google-Smtp-Source: AGHT+IFXHm8UU1vIHnoWJDj8IjQA+a5pmhjhEnVUU3FKp6IJJA5y8jZiSDXk/LiLyF9A8HWjSydqZpI4QC5YERYvLBs=
X-Received: by 2002:a05:690c:6083:b0:722:6a6c:c018 with SMTP id
 00721157ae682-7226a6cc291mr24212147b3.22.1756485277446; Fri, 29 Aug 2025
 09:34:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1753041740.git.steve@sakoman.com> <850949594410a9a228e164977c9e8a08f4a52876.1753041740.git.steve@sakoman.com>
 <356fbb5d-9212-473b-8a9a-fd2f57e5d064@gmail.com>
In-Reply-To: <356fbb5d-9212-473b-8a9a-fd2f57e5d064@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 29 Aug 2025 09:34:11 -0700
X-Gm-Features: Ac12FXyQKY9VMLPrPd3R4kEbhI0PWFbY_MgipCI_pVBcmE8ufyG2fhfi6SOaHlc
Message-ID: <CAMKF1so=yDdLjNvxuPF6xO1+LQG2=RUAjs+mtpU-MWkY0yk8oQ@mail.gmail.com>
Subject: Re: [OE-core][walnascar 10/12] linux-yocto/6.12: riscv: Enable
 TUNE_FEATURES based KERNEL_FEATURES
To: skandigraun@gmail.com
Cc: steve@sakoman.com, openembedded-core@lists.openembedded.org, 
	mark.hatle@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Aug 2025 16:34:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222619

On Fri, Aug 29, 2025 at 7:11=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Since this patch, it looks like qemuriscv64 doesn't boot in Walnascar.
>
> I'm using a vanilla core-image-sato with some extra added applications.
> I can't really figure out how to save the console output from qemu, so
> all I offer is a useless screenshot that is not showing anything because
> it scrolled too far: https://postimg.cc/G8sqjK0b
>
> Once I remove this patch, it boots again. Am I missing something on my
> end, or is this something with the combo of Walnascar and this patch?
>
> On 7/20/25 22:04, Steve Sakoman via lists.openembedded.org wrote:
> > From: Mark Hatle <mark.hatle@amd.com>
> >
> > Allow the risc-v TUNE_FEATURES to select specific ISA (kconfig) selecti=
ons
> > in the kernel config via config fragments selected by KERNEL_FEATURES.
> >
> > This allows the following items to be selected dynamically:
> >
> >     CONFIG_ARCH_RV32I
> >     CONFIG_ARCH_RV64I
> >     CONFIG_FPU
> >     CONFIG_RISCV_ISA_C
> >     CONFIG_RISCV_ISA_V
> >     CONFIG_RISCV_ISA_ZBB
> >     CONFIG_RISCV_ISA_ZICBOM
> >     CONFIG_RISCV_ISA_ZICBOZ
> >     CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
> >
> > Note: Some ISA options, such as CONFIG_RISCV_ISA_C may be reenabled by =
other
> > options such as CONFIG_EFI.  This is properly reported by the configura=
tion
> > tooling.
> >
> > Signed-off-by: Mark Hatle <mark.hatle@amd.com>
> > Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > (cherry picked from commit 45a1b5aa6abc9007d0d87efc2d740b5564a209dd)
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  meta/recipes-kernel/linux/linux-yocto.inc | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-k=
ernel/linux/linux-yocto.inc
> > index 389329030d..4d0a726bb6 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto.inc
> > +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> > @@ -37,6 +37,22 @@ KERNEL_FEATURES:append =3D " ${@bb.utils.contains('M=
ACHINE_FEATURES', 'efi', 'cfg/
> >  KERNEL_FEATURES:append =3D " ${@bb.utils.contains('MACHINE_FEATURES', =
'numa', 'features/numa/numa.scc', '', d)}"
> >  KERNEL_FEATURES:append =3D " ${@bb.utils.contains('MACHINE_FEATURES', =
'vfat', 'cfg/fs/vfat.scc', '', d)}"
> >
> > +KERNEL_FEATURES_RISCV =3D "\
> > +    arch/riscv/tunes/riscv-isa-clear.scc \
> > +    ${@bb.utils.contains(    'TUNE_FEATURES', 'rv 32 i m a', 'arch/ris=
cv/tunes/riscv-isa-rv32i.scc',  '', d)} \
> > +    ${@bb.utils.contains(    'TUNE_FEATURES', 'rv 64 i m a', 'arch/ris=
cv/tunes/riscv-isa-rv64i.scc',  '', d)} \
> > +    ${@bb.utils.contains(    'TUNE_FEATURES', 'f d',         'arch/ris=
cv/tunes/riscv-isa-fpu.scc',    '', d)} \
> > +    ${@bb.utils.contains(    'TUNE_FEATURES', 'c',           'arch/ris=
cv/tunes/riscv-isa-c.scc',      '', d)} \
> > +    ${@bb.utils.contains(    'TUNE_FEATURES', 'v',           'arch/ris=
cv/tunes/riscv-isa-v.scc',      '', d)} \
> > +    ${@bb.utils.contains_any('TUNE_FEATURES', 'b zba',       'arch/ris=
cv/tunes/riscv-isa-zba.scc',    '', d)} \
> > +    ${@bb.utils.contains_any('TUNE_FEATURES', 'b zbb',       'arch/ris=
cv/tunes/riscv-isa-zbb.scc',    '', d)} \
> > +    ${@bb.utils.contains(    'TUNE_FEATURES', 'zbc',         'arch/ris=
cv/tunes/riscv-isa-zbc.scc',    '', d)} \
> > +    ${@bb.utils.contains(    'TUNE_FEATURES', 'zicbom',      'arch/ris=
cv/tunes/riscv-isa-zicbom.scc', '', d)} \
> > +    "
> > +
> > +KERNEL_FEATURES:append:riscv32 =3D " ${KERNEL_FEATURES_RISCV}"
> > +KERNEL_FEATURES:append:riscv64 =3D " ${KERNEL_FEATURES_RISCV}"
> > +

I think this patch needs [1] backported as well which I would not
recommend. Its better to revert this
patch from walnascar.

[1] https://git.yoctoproject.org/poky/commit/?id=3D3c5c4cfa6bf4aa88bcd69e26=
88fdceea6a655165

> >  # A KMACHINE is the mapping of a yocto $MACHINE to what is built
> >  # by the kernel. This is typically the branch that should be built,
> >  # and it can be specific to the machine or shared
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222615): https://lists.openembedded.org/g/openembedde=
d-core/message/222615
> Mute This Topic: https://lists.openembedded.org/mt/114257145/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


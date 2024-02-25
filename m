Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2245FC47DD9
	for <webhook@archiver.kernel.org>; Sun, 25 Feb 2024 14:55:20 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.40176.1708872910981983444
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Feb 2024 06:55:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LqrDe2L3;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-29a378040daso1656681a91.1
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 06:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708872910; x=1709477710; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNST3+jrRU6/5mWCUDp2980egBrgxC7LTfXVDpKc9os=;
        b=LqrDe2L3X9aPqV5QFZmxCrvI18tQ11xSCqSQyWoOJYrSygwJERwI50/8qadTZ0TbOf
         8ukXBGZBxnKPk1jOjwZKSYuAPoQ3EE7xcy13lpllWxYSX4r3ZgZWHBEJxTdYGYcoT3gN
         jH+orNspi++Xc5qCYNa/CgFjONjwy29gAodlw3+WBmk/QdVHKXviHWRYQW7qzoMGg2jz
         sfaK3Hk85/8VZ7XzQBqN29V0tn2ZYXHSL0DZdt/KrMugOCIxgwNX0c/7jpJxisryB8er
         /78QSSsOPE9ndSfn2EEtSsLrfP3lxf0dtOPF8b6jjdZ4AXguvnM6DP/kN0CarUr+Ppd/
         c8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708872910; x=1709477710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FNST3+jrRU6/5mWCUDp2980egBrgxC7LTfXVDpKc9os=;
        b=RHGlrVEvmyWUBQrM/NcuEBw91UsCN6Du9Q/Q1FHAtjmg0RZHPAKV+PBiaY2MnLaiOH
         kC9Yzt/ypI6TczU+ch2Hl6oGOEvfDPmoGP4IgyH5WghqLS8ZUidsOZEsvfJVEUpIjVfJ
         sLXq9tHZzuY+YaTeF1a+CXCA/qymK629+1ALvNWSTsyH21Gr8hgJJxWLVTysfJVHiPtO
         SxSLmmzO38QPtXdy48Bgi3cNCBfj1gsG0u5W6/YE8vlEKQpLGEfR/PMIzIPMpkQHkFKG
         ADYK82YuVdW9EzfBm/er2UcdA7UxKnEWQ/NG9Rm7GfOwu/+5KY+wRdHC54Q95JgZbSQd
         oEYQ==
X-Gm-Message-State: AOJu0YzFu8XZuMtD7iaghi21n659703P8xaUZuK44p/pExsFkuP5R7+Y
	uQ9hivVWeIZ5VdHmBb1C/efJCgZqicQIfkOoNordM4bxFzQgkYTaRRu0Z3ZI/7be+K+Ln+WAmyL
	eAzlf3kWQK7GpVbi174WPf2n0K+g=
X-Google-Smtp-Source: AGHT+IHEg8qqa82vGOk+om3kknQ9ovVO7xkti6i2qPvq4B3oFMbcRpRZ1ofWgqMXR5/7o+rwy3BeSnIpjgEp8OnJrc0=
X-Received: by 2002:a17:90a:ad8a:b0:29a:a38c:8262 with SMTP id
 s10-20020a17090aad8a00b0029aa38c8262mr1881635pjq.48.1708872910175; Sun, 25
 Feb 2024 06:55:10 -0800 (PST)
MIME-Version: 1.0
References: <CADkTA4OD_rO2CPSHjA240-oGGzn9OPTd+=LT4Ne3t2yFFSQtjA@mail.gmail.com>
 <20240224072106.2702207-1-kamatam@amazon.com>
In-Reply-To: <20240224072106.2702207-1-kamatam@amazon.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 25 Feb 2024 09:54:58 -0500
Message-ID: <CADkTA4Pmv7cL2LTSYvhXv905T6_MpsZxCgXnUZqvSS2E6BhTuQ@mail.gmail.com>
Subject: Re: [PATCH v2] kernel.bbclass: Set pkg-config variables for building modules
To: Munehisa Kamata <kamatam@amazon.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 14:55:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196142

On Sat, Feb 24, 2024 at 2:21=E2=80=AFAM Munehisa Kamata <kamatam@amazon.com=
> wrote:
>
> Hi Bruce,
>
> > That is indeed not a simple workflow!
> >
> > In the past, we've always had the existing packageconfig results picked=
 up and
> > used by later stages of the kernel build which prevented things like th=
is from
> > happening.
> >
> > Have you figured out exactly which packageconfig is triggering the rebu=
ild, and
> > had a look to see if something change such that the existing results
> > aren't used ?
>
> The missing of libcrypto.pc and libelf.pc triggers the rebuild of
> certs/extract-cert and objtool respectively. When PKG_CONFIG_DIR is set t=
o
> recipe-sysroot at module build time, it points to a non-existent director=
y
> and therefore pkg-config can't find .pc for the requested library whereas
> they are present in the recipe-sysroot-native, then it causes make to
> rebuild the target.
>
> Although I admit that I don't fully understand how make particularly
> decides to trigger the rebuild in this case.

Fair enough. I can't say that I always understand how the kernel's
Makefiles are triggering difficult builds without significant hacking
up of the Makefiles, and it isn't worth doing for this.

At a minimum, it is good to know that the .pc files are being consulted
so we do have something reproducible between builds when everything
is full defined.

>
> > All that being said, rather than repeating the exports, it would be
> > better to have
> > them in a common place, since eventually everything but the HOSTPKG_CON=
FIG
> > definition will be dropped.
> >
> > Have you tried a more class-global export of the values ? We have a
> > few of those,
> > but admittedly, we have way more exports that are duplicated between do=
_compile
> > and do_compile_kernelmodules(), so the duplicated exports aren't a big =
issue.
>
> Yes, I actually tried it first and it worked at lesat for simple kernel
> building. But I wasn't entirely sure if it was safe enough for the
> ecosystem and came up with the change that is hopefully less impact. That
> said, if you think it's fine, I'm happy to submit v3 with the class-globa=
l
> export. It would be better indeed.
>

It is something that should be safe, since really, whenever we build
anything in the kernel having a consistent environment should be in
place. The kernel modules build has expanded over the years and
more of the kernel tools and common build components are coming
into play, so things we didn't previously need .. are now needed in
the modules compilation.

I had recommended that this go into test on Friday via IRC, but
there's no harm in doing a cleaned up v3 with a class global set
of exports. We can always apply it post release if it is decided there
is extra risk .. but at least it will be a reference to how we should
start consolidating some of the exports.

Bruce

>
> Thanks,
> Munehisa
>
> > Bruce
> >
> > >
> > > Signed-off-by: Munehisa Kamata <kamatam@amazon.com>
> > > ---
> > >
> > > v1 -> v2: Rewrote the commit message with the repro steps
> > >
> > >  meta/classes-recipe/kernel.bbclass | 12 +++++++++---
> > >  1 file changed, 9 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe=
/kernel.bbclass
> > > index a76aaee5ba..db4461e551 100644
> > > --- a/meta/classes-recipe/kernel.bbclass
> > > +++ b/meta/classes-recipe/kernel.bbclass
> > > @@ -239,6 +239,8 @@ KERNEL_EXTRA_ARGS ?=3D ""
> > >  EXTRA_OEMAKE +=3D ' CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" OBJCOPY=
=3D"${KERNEL_OBJCOPY}" STRIP=3D"${KERNEL_STRIP}"'
> > >  EXTRA_OEMAKE +=3D ' HOSTCC=3D"${BUILD_CC}" HOSTCFLAGS=3D"${BUILD_CFL=
AGS}" HOSTLDFLAGS=3D"${BUILD_LDFLAGS}" HOSTCPP=3D"${BUILD_CPP}"'
> > >  EXTRA_OEMAKE +=3D ' HOSTCXX=3D"${BUILD_CXX}" HOSTCXXFLAGS=3D"${BUILD=
_CXXFLAGS}"'
> > > +# Only for newer kernels (5.19+), native pkg-config variables are se=
t for older kernels when building kernel and modules
> > > +EXTRA_OEMAKE +=3D ' HOSTPKG_CONFIG=3D"pkg-config-native"'
> > >
> > >  KERNEL_ALT_IMAGETYPE ??=3D ""
> > >
> > > @@ -356,9 +358,6 @@ kernel_do_compile() {
> > >         export PKG_CONFIG_LIBDIR=3D"$PKG_CONFIG_DIR"
> > >         export PKG_CONFIG_SYSROOT_DIR=3D""
> > >
> > > -       # for newer kernels (5.19+) there's a dedicated variable
> > > -       export HOSTPKG_CONFIG=3D"pkg-config-native"
> > > -
> > >         if [ "${KERNEL_DEBUG_TIMESTAMPS}" !=3D "1" ]; then
> > >                 # kernel sources do not use do_unpack, so SOURCE_DATE=
_EPOCH may not
> > >                 # be set....
> > > @@ -408,6 +407,13 @@ addtask transform_kernel after do_compile before=
 do_install
> > >
> > >  do_compile_kernelmodules() {
> > >         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> > > +
> > > +       # setup native pkg-config variables (kconfig scripts call pkg=
-config directly, cannot generically be overriden to pkg-config-native)
> > > +       export PKG_CONFIG_DIR=3D"${STAGING_DIR_NATIVE}${libdir_native=
}/pkgconfig"
> > > +       export PKG_CONFIG_PATH=3D"$PKG_CONFIG_DIR:${STAGING_DATADIR_N=
ATIVE}/pkgconfig"
> > > +       export PKG_CONFIG_LIBDIR=3D"$PKG_CONFIG_DIR"
> > > +       export PKG_CONFIG_SYSROOT_DIR=3D""
> > > +
> > >         if [ "${KERNEL_DEBUG_TIMESTAMPS}" !=3D "1" ]; then
> > >                 # kernel sources do not use do_unpack, so SOURCE_DATE=
_EPOCH may not
> > >                 # be set....
> > > --
> > > 2.34.1
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
> >



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


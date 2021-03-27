Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web12.7599.1616857541967529719
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Mar 2021 08:05:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VY9tYx3F;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id u9so12769194ejj.7
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Mar 2021 08:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qFbeg61Lm1KcGqPpj78YWgwCLHMpGlYpZ54avDGiTFg=;
        b=VY9tYx3F1IEvDuzM/LYWZBfPcvSXU0/sSdEr06BUbL9JQXj0nsfgFFLTxMkwttQt4h
         kPLb+QBUPlqxsUgClWeOlBzTmXSYX1H1QA6ev9Rmkj3+aM8GMQZGhyPbh7ZSSBY3IoJI
         7jPOZiSME9TM6dACxLjY9tdclVAgYk08zc12I25ASOs2QuuGlS+DiYJBYcOrzSzzM5J9
         Dwz0GVXsyUt5AMue8FqW8Wn0pkc9r/M46VomQbJARoXuYhMZaT0r91SerWYS4oqFXcM4
         qHGjU2RtxXw/OImemae4BKAU/h9bxx9Cobw2lWtMuo4KDijn0p/QuGbldry4qMAb9QVw
         TIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qFbeg61Lm1KcGqPpj78YWgwCLHMpGlYpZ54avDGiTFg=;
        b=CqQ1tObSLIr3TpAK21zZUg7vjPHrQZe7glYMhHbPbiwXMfbUUW55dSgvh3xu+r3DsG
         OwsYT2m5apegdgto9LEt3NoTEguwoA3Grx4yklQ8MWbt/LfNqNEpXpzSscmNys+kdys+
         dW0Xv5VLRvmzsVyqkL+0v0y2srSfB+ae7b6kDZYDjuyC4MFF2mB5+hEQNDacdsHxCDZ3
         e9hhUuUwOyfy5ANLIUuVrttSdfxre5Ys6hx7pZGcqUD2lJGmYFugogrZ6tCtCjn+58Zp
         6cANSrVNE+pIoH+OA5asXhzE4X7kdYaAeVysX5U8tDYfHLbvPWwcEod+XKLQeu1epjHR
         NGTg==
X-Gm-Message-State: AOAM530XjNkerRsuen+XtQlw8wat3qyj3QFdnOJaOeADXOXc6s3iUVX+
	NzjKNtkTBICwJXfFk+47+6hY14wU5yr3sq31gcc=
X-Google-Smtp-Source: ABdhPJwN4EOb4igOfBfMfPP8jwKDT/y7jjrUC4CfinRF3vWE8dvUo+vWwuBjbuTKPJHHy7jSyTKmvTozF535nhe77VY=
X-Received: by 2002:a17:906:11d1:: with SMTP id o17mr20705055eja.517.1616857540407;
 Sat, 27 Mar 2021 08:05:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210326011304.25640-1-nm@ti.com> <20210327042523.GY18041@denix.org>
In-Reply-To: <20210327042523.GY18041@denix.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Sat, 27 Mar 2021 11:05:29 -0400
Message-ID: <CADkTA4N9OxMX+kRKyz_2zV5_vP1AiEKhXiLXsXRLGmLSL1fkEg@mail.gmail.com>
Subject: Re: [PATCH] make-mod-scripts: Provide the correct objcopy to kernel make
To: Denys Dmytriyenko <denis@denix.org>
Cc: Nishanth Menon <nm@ti.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, praneeth@ti.com
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 27, 2021 at 12:25 AM Denys Dmytriyenko <denis@denix.org> wrote:
>
> Hi, Bruce,
>
> Would you mind taking a look at this? Have you seen any issues building latest
> kernel 5.12-rc for aarch64 and seeing host objcopy being used instead of cross
> compile one? Please let us know. Thanks!

I've been able to build and boot all arches on v5.12-rc4, and I did
run into something similar on 5.4 kernel's, but it was addressed in
-stable backports.

That being said, let me test this over the next couple of days and
follow up. I may not have had Ross' changes in my tree when I was
sanity testing 5.12.

Bruce


>
> --
> Denys
>
>
> On Thu, Mar 25, 2021 at 08:13:04PM -0500, Nishanth Menon wrote:
> > When cross-compiling with v5.12-rc3, prepare fails[1] build of vdso at
> > the objcopy stage since it seems to be using the local host's objcopy
> > rather than the cross-compile version we want it to use.
> >
> > This can be trivially reproduced in a localbuild of the kernel
> > following the build parameters provided in the process[2]
> >
> > Lets fix this by passing OBJCOPY over to the kernel.
> >
> > [1] https://pastebin.ubuntu.com/p/pNcQtb93wr/
> > [2] https://pastebin.ubuntu.com/p/vZGqgh9Sq5/
> > Signed-off-by: Nishanth Menon <nm@ti.com>
> > ---
> >
> > NOTE:
> > 1. This is a different problem and is not resolved with
> > https://lists.openembedded.org/g/openembedded-core/message/149943
> >
> > 2. Though reproduced during a dunfell build, this should probably
> > apply else where as well.
> >
> > 3. I have'nt been able to cleanly bisect things, but my best guess was
> > that this might be a consequence of kernel fixup exposing this.
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a5b8ca97fbf8300a5e21c393df25ce6f521e7939
> >
> >  meta/classes/kernel-arch.bbclass                             | 3 +++
> >  meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 2 +-
> >  2 files changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
> > index 07ec242e63bb..3d25fc7ac531 100644
> > --- a/meta/classes/kernel-arch.bbclass
> > +++ b/meta/classes/kernel-arch.bbclass
> > @@ -60,9 +60,12 @@ TARGET_LD_KERNEL_ARCH ?= ""
> >  HOST_LD_KERNEL_ARCH ?= "${TARGET_LD_KERNEL_ARCH}"
> >  TARGET_AR_KERNEL_ARCH ?= ""
> >  HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
> > +TARGET_OBJCOPY_KERNEL_ARCH ?= ""
> > +HOST_OBJCOPY_KERNEL_ARCH ?= "${TARGET_OBJCOPY_KERNEL_ARCH}"
> >
> >  KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} -fuse-ld=bfd ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH}"
> >  KERNEL_LD = "${CCACHE}${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
> >  KERNEL_AR = "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
> > +KERNEL_OBJCOPY = "${CCACHE}${HOST_PREFIX}objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"
> >  TOOLCHAIN = "gcc"
> >
> > diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> > index 87b7d240f51a..2d73e8093c2e 100644
> > --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> > +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> > @@ -25,7 +25,7 @@ EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="
> >  do_configure() {
> >       unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> >       for t in prepare scripts_basic scripts; do
> > -             oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
> > +             oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" OBJCOPY="${KERNEL_OBJCOPY}"\
> >               -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} $t
> >       done
> >  }
> > --
> > 2.31.0
> >



--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

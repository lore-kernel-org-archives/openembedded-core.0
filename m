Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web11.4835.1590608095041392415
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 12:34:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Aax/a1bQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id gl26so1111636ejb.11
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2020 12:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6CnaK4OTkWf1CgtuoIueaVgRQ/lp/A81pdbBJccnmHA=;
        b=Aax/a1bQ+YyRIW4q3vqZ82822C0S4JP85/2oTNqhsLxiUzIcz6Npx81dTBXJ9aR9Sa
         OgupBhdfPSKpFj824hv5aZEJnZJOsPgdNuKs5ef/bSiSC+HQPlZldWwJP6qJuWy2SrvL
         BA1bDawM2fkRjBAkKyjLn0m9QvW+KzK2t50+Gl4jRndSYUhXSctewRw8FhwU0Coxj1Do
         8tbKBtEsyGgKMO3uCifRRswgmykC6f7wZlgtrQGKtU7RuEMai7oxW/56rxgPLlQi6TqZ
         irsXyZk1KBwymkAm/19VUGd49qICTbmLPK2wqsWoTc6oA0L38OZOhhocKTBjOt8M83LV
         b3CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6CnaK4OTkWf1CgtuoIueaVgRQ/lp/A81pdbBJccnmHA=;
        b=bGaUUnWuCJjOlEuK2tAWiomYWf2WrBABxqDduGLwC0bbTPBk+uqQf1ds8bKhHBtvzZ
         9WNXD+y7MZxNO1GSesjPodEUSNFcKnKDsbr17hSkfGtxTHxYfIL2e885GogpScFcqbET
         ltVPDuZZIII/vEnGYgtP/5HuE0IZqN6Q/PJxJ9pP8MvcGIu6abWrxnFEE7GbjXAMdpxO
         mQUfb9lgTQZirGA3BSwZShmWL3RWVj43pQ8m1m0xvWE65Vi7qknvR7X6F+I1Bsk9z06N
         An95l4JIkBjM/7C2VnhOvvuzTSOf8v7bjpjj0BXPR0gaGVqmuBj4wSvlJXjwzpANlAc8
         xIOA==
X-Gm-Message-State: AOAM533I5vzm7FDCVj7BNTvnzZEfN7c6dKUKc+h48eSZIoTo+9Vs2flT
	ab1UGEoWbqAejU9Xz62OirShS7heED5UfNMhaj0=
X-Google-Smtp-Source: ABdhPJzwtYan7YMvUyPR7rCVj4zyqSUD73eMTDET+FERpvkW9sUdTWa7FP4WS7D1bfrlb4PIB9YWPsN0F2Qs6OTR72Y=
X-Received: by 2002:a17:906:d8d7:: with SMTP id re23mr4206229ejb.22.1590608093450;
 Wed, 27 May 2020 12:34:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200527160355.3169339-1-raj.khem@gmail.com> <CADkTA4O77VD2pYx6ySDOeOcUAr5nE8ZmTKGLJtn0cX2EKJ887w@mail.gmail.com>
 <CAMKF1sqxekhk7d+tZ8vWJ44haRv801v+ydp9BjhL0+w5M=2h9w@mail.gmail.com>
 <CADkTA4P2GpH2b_zWCHgyGk-ZCBNxmD2925wR-F6PEMGrPYPU3w@mail.gmail.com> <CAMKF1so1Boch8nfj4eP8Q_RJgkNb9Kd_sr=FqcAusmyLtWNEcA@mail.gmail.com>
In-Reply-To: <CAMKF1so1Boch8nfj4eP8Q_RJgkNb9Kd_sr=FqcAusmyLtWNEcA@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 27 May 2020 15:34:42 -0400
Message-ID: <CADkTA4Ptm3nuweqweRioJW1CSZ-cgRoWhAWpGtvW9d4zSrDnCg@mail.gmail.com>
Subject: Re: [PATCH] make-mod-scripts: Fix a rare build race condition
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 27, 2020 at 3:23 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, May 27, 2020 at 11:05 AM Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
> >
> > On Wed, May 27, 2020 at 1:46 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On Wed, May 27, 2020 at 9:57 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > > >
> > > > On Wed, May 27, 2020 at 12:03 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > > >
> > > > > There is a build break which often happens whem using 4.1 kernel
> > > > >
> > > > > /bin/sh: 1: scripts/basic/fixdep: Permission denied
> > > > > scripts/Makefile.host:124: recipe for target 'scripts/dtc/srcpos.o' failed
> > > > > make[3]: *** [scripts/dtc/srcpos.o] Error 126
> > > > >
> > > > > this patch sequences the build targets so it can work reliably with
> > > > > different kernel versions
> > > > >
> > > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > > Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > > ---
> > > > >  .../make-mod-scripts/make-mod-scripts_1.0.bb               | 7 ++++---
> > > > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> > > > > index 0be1422a24..c7edb20ee4 100644
> > > > > --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> > > > > +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> > > > > @@ -23,7 +23,8 @@ EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="
> > > > >  #
> > > > >  do_configure() {
> > > > >         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> > > > > -       oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
> > > > > -                  -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} scripts prepare
> > > > > -
> > > > > +       for t in prepare scripts_basic scripts; do
> > > >
> > > > Last I checked, we don't actually need scripts_basic.
> > > >
> > > > Isn't just sequencing prepare, followed by 'scripts' enough ?
> > > >
> > > > If not, we really should put in the long log why we need that new
> > > > target when sequencing, when we didn't need it before.
> > > >
> > >
> > > in a way you are right that scripts should cover it, but calling it
> > > out explicitly avoids any weird races if any and it does not
> > > hurt until this target is removed. I really have not debugged kernel
> > > build to see what is causing this, so there is not much
> > > details to add other than this that we are handing some race
> > > conditions which ideally should be in the makery
> > >
> >
> > But the race condition is handled with the two targets, no ? I realize
> > it doesn't hurt, but you are implying that you need all three to be
> > sure, but that really isn't the case from what I've seen.
> >
> > I just think simpler is better, but don't take my comments as an objection.
>
> Since it is a random failure that means validating any changes to fix
> it is as hard as reproducing it.
> This solution has worked over a number of builds, testing anything
> else would take as much long and I am reluctant to do that
> without a potential gain.

Minimizing the amount of change is definitely consider a gain by many
(me included).

But I'm happy enough if you can just amend the message to indicate
that it isn't strictly necessary and was simply what was used for
testing.

Since I guarantee, someday, I'll be staring at that change wondering
why it was added :D

Bruce

>
> >
> > Cheers,
> >
> > Bruce
> >
> > > > Bruce
> > > >
> > > > > +               oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
> > > > > +               -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} $t
> > > > > +       done
> > > > >  }
> > > > > --
> > > > > 2.26.2
> > > > >
> > > >
> > > >
> > > > --
> > > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > > thee at its end
> > > > - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web11.4595.1590607438680697853
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 12:23:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=avQodrPg;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id 205so719762qkg.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2020 12:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uvORamBQFZxRlKYCLB2FViRm++JU8QSOHvDerxG2E/I=;
        b=avQodrPgc9YB0n6GMfvv0LgdYza4pu1qzpbAcZK6C+WGDp0MhsEzW6WrTDD7Y30hu4
         FFAYjhX4iMKGsd863zsL1WQtqX7iOxNQygghFovnsad+8XlUB3AXMuwFUG/7p+xtbFXa
         /aVBoMsFQfDtntVgwUJ76dK8Ss/kPh2wtlHd71xKYovjZ4DbswK2MhwCsZ3QoHAgX2Qk
         98A+YK/PR4I4eER7s0D0NWR2qqL7SUEItIrxBAbcOHndCCqu0EWnW/9O6pv5trEZs8gR
         tUpTIK7eCpIzY8ByfsZ/GlZ+tn/P2YjN/6CQl2Au1PBjY34iLN0cW9Fg5UmSTzKlvlrT
         +2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uvORamBQFZxRlKYCLB2FViRm++JU8QSOHvDerxG2E/I=;
        b=Yfx5R2NedUWi/4oCTo0e9S7rHWTQnXe1r4EQ3m9xv2wcWrAA8ggq1lWVZdVGSS43Db
         N6Cr4DeOPGYpkwOT9y3xFv0bnQQL38A4U1j85My4sxCPnZRxQO4jB2lQFH7FLUxHdciI
         acYXElNuPjgV7cZ9wmMwnR/ODzJxlGbTn4PE3VI7NnEkVorS2N0+jFfSZmkg+TrPi+s/
         GbateIGjpYIJdq83XkZx7xqrX2B9T0GumwAJXLu7UY0MLw6fTbJHJuGAf39H3ZnejO9f
         YZ3gbVeEAZprhXG4ZTmTian3JjhGYie+8/oUDLGeJM3qDuhWnFSn4LGTUBTI5v83Eprx
         4UVA==
X-Gm-Message-State: AOAM533B4qZSnOFWM/iToZ4iXpRna9Vg9+N5FuQZuTYIWkTtiCmzNkGJ
	xp3w5FJ4VKDywC/3qNSZougNJHTSAuZS7sCjYqU=
X-Google-Smtp-Source: ABdhPJxD+MDL1PbFSQhh3pVWGpW/0Xo9G+2NkFy2o4+FQxIWpk/ltk29AtyKQmIEuRw5mQNlrde7ft52nS2HtEnevMY=
X-Received: by 2002:a37:7143:: with SMTP id m64mr6066743qkc.215.1590607437580;
 Wed, 27 May 2020 12:23:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200527160355.3169339-1-raj.khem@gmail.com> <CADkTA4O77VD2pYx6ySDOeOcUAr5nE8ZmTKGLJtn0cX2EKJ887w@mail.gmail.com>
 <CAMKF1sqxekhk7d+tZ8vWJ44haRv801v+ydp9BjhL0+w5M=2h9w@mail.gmail.com> <CADkTA4P2GpH2b_zWCHgyGk-ZCBNxmD2925wR-F6PEMGrPYPU3w@mail.gmail.com>
In-Reply-To: <CADkTA4P2GpH2b_zWCHgyGk-ZCBNxmD2925wR-F6PEMGrPYPU3w@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 27 May 2020 12:23:31 -0700
Message-ID: <CAMKF1so1Boch8nfj4eP8Q_RJgkNb9Kd_sr=FqcAusmyLtWNEcA@mail.gmail.com>
Subject: Re: [PATCH] make-mod-scripts: Fix a rare build race condition
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 27, 2020 at 11:05 AM Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
> On Wed, May 27, 2020 at 1:46 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Wed, May 27, 2020 at 9:57 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > >
> > > On Wed, May 27, 2020 at 12:03 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > There is a build break which often happens whem using 4.1 kernel
> > > >
> > > > /bin/sh: 1: scripts/basic/fixdep: Permission denied
> > > > scripts/Makefile.host:124: recipe for target 'scripts/dtc/srcpos.o' failed
> > > > make[3]: *** [scripts/dtc/srcpos.o] Error 126
> > > >
> > > > this patch sequences the build targets so it can work reliably with
> > > > different kernel versions
> > > >
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > ---
> > > >  .../make-mod-scripts/make-mod-scripts_1.0.bb               | 7 ++++---
> > > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> > > > index 0be1422a24..c7edb20ee4 100644
> > > > --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> > > > +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> > > > @@ -23,7 +23,8 @@ EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="
> > > >  #
> > > >  do_configure() {
> > > >         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> > > > -       oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
> > > > -                  -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} scripts prepare
> > > > -
> > > > +       for t in prepare scripts_basic scripts; do
> > >
> > > Last I checked, we don't actually need scripts_basic.
> > >
> > > Isn't just sequencing prepare, followed by 'scripts' enough ?
> > >
> > > If not, we really should put in the long log why we need that new
> > > target when sequencing, when we didn't need it before.
> > >
> >
> > in a way you are right that scripts should cover it, but calling it
> > out explicitly avoids any weird races if any and it does not
> > hurt until this target is removed. I really have not debugged kernel
> > build to see what is causing this, so there is not much
> > details to add other than this that we are handing some race
> > conditions which ideally should be in the makery
> >
>
> But the race condition is handled with the two targets, no ? I realize
> it doesn't hurt, but you are implying that you need all three to be
> sure, but that really isn't the case from what I've seen.
>
> I just think simpler is better, but don't take my comments as an objection.

Since it is a random failure that means validating any changes to fix
it is as hard as reproducing it.
This solution has worked over a number of builds, testing anything
else would take as much long and I am reluctant to do that
without a potential gain.

>
> Cheers,
>
> Bruce
>
> > > Bruce
> > >
> > > > +               oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
> > > > +               -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} $t
> > > > +       done
> > > >  }
> > > > --
> > > > 2.26.2
> > > >
> > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

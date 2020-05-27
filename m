Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web10.2848.1590602706406435426
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 11:05:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Sa6yBJCn;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id e2so29105689eje.13
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2020 11:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3bzracp4HQdUE4IFzK1PatZZUWtliAI1ICj18Uwthug=;
        b=Sa6yBJCntOWHp6n47qc3nUgkRr/KtPXOY1i3mnZL9kbVkOhg5qc2DIR/Ih/vcJQpuq
         hKAdjWzNE+wicdkut8BJqxY87fTWwkG609NsuFafbT+mO3VYXlwCZ9MAZnm8de7aEsAM
         LhVERCeck7s68C6ezFAFD92CuLJL95zRSZejt0hqK/+pH4rdswzy/cV1nCg7FUhdmTwR
         mtzGBN2VFsmaJ8PpcY/lH8Ncgiorl3TJ2y3GVl8gS2PIhYlUx6kwimgXlTxpRvkgCZfm
         UhyU490463DgI2oN5cLD4x7YKXBUYcxoVOC2kKEAvO4xdNlmqukN/Nq1iWa/8R37i7am
         PWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3bzracp4HQdUE4IFzK1PatZZUWtliAI1ICj18Uwthug=;
        b=l/VMGD9opB94y13nctKwNFIvidiW16hEWh928HOEB+FeNzDwHbN27AQy/QTr75HXFZ
         gmfRylmEXxaUWtdjoVlCpCmAISWVsu+FuoXwlh5cGRFTo5IHqd3kTcA0e0GNDnXRSatq
         AtqyllRner7hfnHdAn84mPwt4GLOWlNvyvFtyF5Z0KmJyZlWS1enLMKARKEvsiVs/GNM
         0TzL9GWOh5gQCsul8iQ7u6D4Lh1kbtfv5UzrBhe1sFdQVago53RH2+pkoKO4TYNLLKFZ
         H9eznwTXgLcqdGvmS7L3/JwR30ffSu9VK78b1GPIRJvjwNcZ2tRu7tf/xN2KsLCJDp9q
         os1Q==
X-Gm-Message-State: AOAM531zsQwuSb8/vg7JPPy0OxzA7o1BjkOczy1IhFg86HwuSiqSbUIU
	WbJJ/ENghC5poI/km8lnQ7HXt4Wh3FcJh3wZm4k=
X-Google-Smtp-Source: ABdhPJyoqKVEuGHO9pXcMazfs/W1WsOyKHMIQFpRUfVN9pJXdpbxJio4NXBFNcFCDHmswNrsUN22xZhtkVpTs7/fgsA=
X-Received: by 2002:a17:906:4356:: with SMTP id z22mr7091132ejm.334.1590602704338;
 Wed, 27 May 2020 11:05:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200527160355.3169339-1-raj.khem@gmail.com> <CADkTA4O77VD2pYx6ySDOeOcUAr5nE8ZmTKGLJtn0cX2EKJ887w@mail.gmail.com>
 <CAMKF1sqxekhk7d+tZ8vWJ44haRv801v+ydp9BjhL0+w5M=2h9w@mail.gmail.com>
In-Reply-To: <CAMKF1sqxekhk7d+tZ8vWJ44haRv801v+ydp9BjhL0+w5M=2h9w@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 27 May 2020 14:04:53 -0400
Message-ID: <CADkTA4P2GpH2b_zWCHgyGk-ZCBNxmD2925wR-F6PEMGrPYPU3w@mail.gmail.com>
Subject: Re: [PATCH] make-mod-scripts: Fix a rare build race condition
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 27, 2020 at 1:46 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, May 27, 2020 at 9:57 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >
> > On Wed, May 27, 2020 at 12:03 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > There is a build break which often happens whem using 4.1 kernel
> > >
> > > /bin/sh: 1: scripts/basic/fixdep: Permission denied
> > > scripts/Makefile.host:124: recipe for target 'scripts/dtc/srcpos.o' failed
> > > make[3]: *** [scripts/dtc/srcpos.o] Error 126
> > >
> > > this patch sequences the build targets so it can work reliably with
> > > different kernel versions
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > ---
> > >  .../make-mod-scripts/make-mod-scripts_1.0.bb               | 7 ++++---
> > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> > > index 0be1422a24..c7edb20ee4 100644
> > > --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> > > +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> > > @@ -23,7 +23,8 @@ EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="
> > >  #
> > >  do_configure() {
> > >         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> > > -       oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
> > > -                  -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} scripts prepare
> > > -
> > > +       for t in prepare scripts_basic scripts; do
> >
> > Last I checked, we don't actually need scripts_basic.
> >
> > Isn't just sequencing prepare, followed by 'scripts' enough ?
> >
> > If not, we really should put in the long log why we need that new
> > target when sequencing, when we didn't need it before.
> >
>
> in a way you are right that scripts should cover it, but calling it
> out explicitly avoids any weird races if any and it does not
> hurt until this target is removed. I really have not debugged kernel
> build to see what is causing this, so there is not much
> details to add other than this that we are handing some race
> conditions which ideally should be in the makery
>

But the race condition is handled with the two targets, no ? I realize
it doesn't hurt, but you are implying that you need all three to be
sure, but that really isn't the case from what I've seen.

I just think simpler is better, but don't take my comments as an objection.

Cheers,

Bruce

> > Bruce
> >
> > > +               oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
> > > +               -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} $t
> > > +       done
> > >  }
> > > --
> > > 2.26.2
> > >
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

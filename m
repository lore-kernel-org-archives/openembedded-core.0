Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web12.2504.1590601586113202365
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 10:46:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lrcLGm95;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id i68so19918720qtb.5
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2020 10:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K1Ie51YlloDrHgoBA3bH+eHnflmIzcuPRLQ+W+HxS00=;
        b=lrcLGm95kIMVEtV/ok8P6aEA59B6DVMnNFGsxtH/6r2n9H4BeO+///tfCyrxov5AYH
         eCRM7v6epRI7HWwUgrl6HAqBGEC7slc5QW4HyleAP0SObJuT1esqVVzFUgOBTNyMUJQn
         Xv5CdoMgZ4X+2CNPNWWvDOFQyb4wtUWJ/d1yJgP04AO/nXV3Jd3q5E3KK5pHXld69SUS
         yFHpNTmuzRsruwjtvd0g643KwT62gamYOMh0rqg9LL3G8B8vcR9rDpZeTyTP8zIqz5KA
         Kq/L0dI2WYTs9TjGPWRqMZ7PQGm3oceynzaT8d82l95sjqTMTgcMLTqxYbm04xbuXi5C
         ex3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K1Ie51YlloDrHgoBA3bH+eHnflmIzcuPRLQ+W+HxS00=;
        b=MhM0rwSENtYW5NKKm7fcUiKMEhrux9sTjZL4ZMSOWxHLgD8i5zJ9KEKOxAUl0GKzak
         f1tspE2TT2BbMqOKxU7dYBbpL8dUan/jrDZhcOzKVlGx3DLLmFcaQ76Hviwbg1PVmMtG
         /sV0kAvWxYB10LnqyCj5DM1Ftd3ifJlUwwu1Hfs8DD5dVSuCyjd9PGZzMiDynNMcvWeL
         MTUz8s044vaR4i8nT/LSq/hXNJ7DtHDSsDcUF4b3kkkJzpRFbd4stz82f8wxE4JVM9+R
         empzyTybtySY+bFHmHgPZEHRBS3PAAE2gFsBctZygTmjtRTIoWth6BBO15Ltd1Otonpo
         9jDA==
X-Gm-Message-State: AOAM530EZ5YptOIOSwoinURpIs2ztldf4lLaM3TI0EGtswnnFqEvbi0L
	oGeAZRIiNDhKgbjsVT9p4dy4bpCQ2Ybu9cUc8wc=
X-Google-Smtp-Source: ABdhPJxRwvzK8H8U9mH+QqeDyfszvxNVLfdeQcPqGY8NpNv6QoLhN1GsrFW07OpAkGlTktUinP2KneyCPcLAD+HoIVQ=
X-Received: by 2002:aed:308e:: with SMTP id 14mr5564562qtf.146.1590601584963;
 Wed, 27 May 2020 10:46:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200527160355.3169339-1-raj.khem@gmail.com> <CADkTA4O77VD2pYx6ySDOeOcUAr5nE8ZmTKGLJtn0cX2EKJ887w@mail.gmail.com>
In-Reply-To: <CADkTA4O77VD2pYx6ySDOeOcUAr5nE8ZmTKGLJtn0cX2EKJ887w@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 27 May 2020 10:45:58 -0700
Message-ID: <CAMKF1sqxekhk7d+tZ8vWJ44haRv801v+ydp9BjhL0+w5M=2h9w@mail.gmail.com>
Subject: Re: [PATCH] make-mod-scripts: Fix a rare build race condition
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 27, 2020 at 9:57 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Wed, May 27, 2020 at 12:03 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > There is a build break which often happens whem using 4.1 kernel
> >
> > /bin/sh: 1: scripts/basic/fixdep: Permission denied
> > scripts/Makefile.host:124: recipe for target 'scripts/dtc/srcpos.o' failed
> > make[3]: *** [scripts/dtc/srcpos.o] Error 126
> >
> > this patch sequences the build targets so it can work reliably with
> > different kernel versions
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >  .../make-mod-scripts/make-mod-scripts_1.0.bb               | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> > index 0be1422a24..c7edb20ee4 100644
> > --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> > +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> > @@ -23,7 +23,8 @@ EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="
> >  #
> >  do_configure() {
> >         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> > -       oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
> > -                  -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} scripts prepare
> > -
> > +       for t in prepare scripts_basic scripts; do
>
> Last I checked, we don't actually need scripts_basic.
>
> Isn't just sequencing prepare, followed by 'scripts' enough ?
>
> If not, we really should put in the long log why we need that new
> target when sequencing, when we didn't need it before.
>

in a way you are right that scripts should cover it, but calling it
out explicitly avoids any weird races if any and it does not
hurt until this target is removed. I really have not debugged kernel
build to see what is causing this, so there is not much
details to add other than this that we are handing some race
conditions which ideally should be in the makery

> Bruce
>
> > +               oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
> > +               -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} $t
> > +       done
> >  }
> > --
> > 2.26.2
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

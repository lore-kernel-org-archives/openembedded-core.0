Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web12.3941.1587523142457416148
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2020 19:39:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=togCiy/g;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id p16so365928edm.10
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2020 19:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ibJ9ua6QPfq3FB/zlBIhGj2DbqiPRoOR0w7ffkE4lWE=;
        b=togCiy/gDxS+fXli1+iXjTfRfjKEysUN0vq2fFAazaVzdVaF1NIIzXZilD6T7N+TKj
         eI7p0gK73Q01HylSW0efpdQQCNer/Drw/wWexOYhvTtoj2RozjzasHbkLLSFmZjHlYY4
         C2vR8XFqzdjca3In+lxBgaZrRrX7GKX9GIWa1V5RaT6PzIC5mzxWtPpqiwHElthmCXJB
         m11SvM8J1f7bINbWNeVPxQLyV81GOgsvAs1C+j/O2yuPaZ1Ha9Ar9Fpfrh3vl5Y9StUJ
         /4qxCiiC4BcsMpLGJ2+I7HAjrGc7X1w59hjn2Lkw6SwmX4AwdLMx9WmNIqGnefeW7sy4
         n40g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ibJ9ua6QPfq3FB/zlBIhGj2DbqiPRoOR0w7ffkE4lWE=;
        b=PutQcp5oXxdrZlkzco9nZjharku+EBMjbZGuLsONHsX3n/JlndUBw9PdoaKCSMMXXy
         FVu/gSjjpozzk9guo09fTWgCiC1325WxwS6+5Egve3WLVw5ZuPB9j2R0HSV5ptQg2NIn
         5VsvPLwil/r7To/JlewfUd7p3EWhV9mGhH6103nXgizdiTA3FR1NqgXuRAMufoZxrBCn
         zgmqAy4CuTvQBhCRo5nI5KB4vHL5xMQY6FmuBq6qUqFj09KLs2SrFUU6CsIvFOHLl3uX
         1plsuhvyGyvmQuiiTwbe+D5wI3piR8owGfSMbJcgngsppeme4o83jrB9IwhwPxw5xwTr
         6ETA==
X-Gm-Message-State: AGi0PubDX31EYXkjWuBv1mx4POJa5fU+2zFfReNVQvYDPvw7IqfmHvzF
	IxDhc4ILLiEXM8maZsMuRfM5+KsgGXd5sBU+qig=
X-Google-Smtp-Source: APiQypLoHpyG+MUNz0V7PA5Nqdsq6Ch+ixHKfwjjS4sHJLDhVexPrOvrhGmJl43yEHQWG5q1sImAPsBfTTUD84pE5oE=
X-Received: by 2002:a05:6402:558:: with SMTP id i24mr20688995edx.347.1587523140740;
 Tue, 21 Apr 2020 19:39:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200421093732.29192-1-dan.callaghan@opengear.com>
 <CADkTA4NGkRXf-jmvX9TooAEAr9RiA+0dWr01icYAKkp0yZZPCg@mail.gmail.com> <1587518872-sup-9466@galangal.danc.bne.opengear.com>
In-Reply-To: <1587518872-sup-9466@galangal.danc.bne.opengear.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 21 Apr 2020 22:38:48 -0400
Message-ID: <CADkTA4O8a0z-WToK85uBh6MCAru_foJqbZmu1-hj=JxE0RTr0Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: copy some more needed files in do_shared_workdir
To: Dan Callaghan <dan.callaghan@opengear.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 21, 2020 at 9:32 PM Dan Callaghan
<dan.callaghan@opengear.com> wrote:
>
> Excerpts from Bruce Ashfield's message of 2020-04-21 08:33:34 -04:00:
> > On Tue, Apr 21, 2020 at 5:37 AM Dan Callaghan
> > <dan.callaghan@opengear.com> wrote:
> > >
> > > We need to copy include/config/auto.conf into ${STAGING_KERNEL_BUILDDIR}
> > > to avoid module compilation errors like this:
> > >
> > >     | make[1]: Entering directory 'build/tmp-glibc/work-shared/machine/kernel-source'
> > >     | make[2]: Entering directory 'build/tmp-glibc/work-shared/machine/kernel-build-artifacts'
> > >     |
> > >     |   ERROR: Kernel configuration is invalid.
> > >     |          include/generated/autoconf.h or include/config/auto.conf are missing.
> > >     |          Run 'make oldconfig && make prepare' on kernel src to fix it.
> > >     |
> > >     | make[2]: *** [build/tmp-glibc/work-shared/machine/kernel-source/Makefile:641: include/config/auto.conf] Error 1
> > >
> > > We also need scripts/basic/fixdep to avoid errors like this:
> > >
> > >     | make[1]: Entering directory 'build/tmp-glibc/work-shared/machine/kernel-source'
> > >     | make[2]: Entering directory 'build/tmp-glibc/work-shared/machine/kernel-build-artifacts'
> > >     |   CC [M]  build/tmp-glibc/work/vendor-linux/tehuti-module/0.3.6-r0/git/TLK10232_phy_Linux.o
> > >     | /bin/sh: scripts/basic/fixdep: No such file or directory
> > >     | make[3]: *** [build/tmp-glibc/work-shared/machine/kernel-source/scripts/Makefile.build:303: build/tmp-glibc/work/vendor-linux/tehuti-module/0.3.6-r0/git/TLK10232_phy_Linux.o] Error 127
> > >
> > > And scripts/mod/modpost to avoid errors like this:
> > >
> > >     |   Building modules, stage 2.
> > >     |   MODPOST 1 modules
> > >     | /bin/sh: scripts/mod/modpost: No such file or directory
> > >     | make[3]: *** [build/tmp-glibc/work-shared/machine/kernel-source/scripts/Makefile.modpost:92: __modpost] Error 127
> > >
> > > Most of the time, the absence of these files is masked by the
> > > make-mod-scripts recipe's do_configure task, which causes a whole bunch
> > > of extra files to be built into ${STAGING_KERNEL_BUILDDIR} (including
> > > these two). Typically make-mod-scripts will be built before any kernel
> > > modules, and so it didn't matter that do_shared_workdir was missing
> > > these files.
> > >
> >
> > The design is that, make-mod-scripts is what provides those files, we
> > don't want to copy them, since it is an ever incomplete list (more so
> > in the past, but the concept still holds).
>
> Okay, I think you're saying that what do_shared_workdir claims to do
> (populate ${STAGING_KERNEL_BUILDDIR} with whatever files are needed to
> build kernel modules) should actually be handled by make-mod-scripts
> instead.
>
> Does that mean, do_shared_workdir has no purpose? Or is it doing
> something else I don't realise?

How would what populates it change the purpose of what it does ?
Just like our SDK and on target module support, those files are generated
by the kernel build itself, not copied.

shared-workdir was created to stop slinging around the sheer number of
files in a kernel build, it was causing us severe build performance issues.

Having the smallest possible list of explicitly copied files is the goal.
The lists are fragile, and inevitably need constant tweaking. Witness
the messing around with kernel-devsrc that I have to do, and the only
reason that is tolerated is to make the minimal possible development
components.

>
> > > However the problem will be evident if you do certain sequences of
> > > tasks, for example a complete build first (so that make-mod-scripts is
> > > already built), then:
> > >
> > >     bitbake linux-yocto my-kernel-module -c clean
> > >     bitbake my-kernel-module -c install
> >
> > Why can't we fix the dependency ? We chased a few of these around when
> > the mod-scripts recipe was introduced, and this just looks like a
> > variant we missed.
>
> Right, so there *is* already a correct dependency on
> make-mod-scripts:do_compile. The problem is, in the scenario I gave
> above, that task is already done and Bitbake is not going to run it
> again. But in fact, the stuff it left behind in
> ${STAGING_KERNEL_BUILDDIR} was cleaned out when I cleaned the
> linux-yocto recipe.

Yes, and that clean is supposed to invalidate things, and trigger the
re-run.

>
> I guess the real issue is that we have this "shared" work directory
> which a bunch of different recipes contribute files to, but can be
> cleaned out by running the "clean" task on any one of several different
> recipes.

We've solved that issue in the past, I'll have a look on Wednesday to
see what may have changed and (re)broken it. There may be a bugzilla
floating around for that, I'll see if I can track it down as well.

Bruce

>
> --
> Dan Callaghan <dan.callaghan@opengear.com>
> Software Engineer
> Opengear <https://opengear.com/>



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BBE7C433F5
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 14:04:47 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.11554.1637676279589696395
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 06:04:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DmoowSpG;
 spf=pass (domain: gmail.com, ip: 209.85.208.54,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id w1so92752742edc.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 06:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4rhT3PGcNzm25dWYihnj0/kw+5MQ9M6vws5n4q7VDmM=;
        b=DmoowSpGsIY6TpM3EWEvO5m2Jny8w6v5qz0vBacsXdFcbJjtbrgxy90yk2DH7c2Re1
         obymGRUsGFKjV1pdrnijVry1pTJyF55WWG+dZ4K0EXbJFiQrWLpVxrOi/WAUQMibooyx
         fP7o+kywyj6hj0XYx9vQ1vFSSanfpelnntGZxZT/IWeeY5nj4Rc+Ol2b8J0D4mGdjJLH
         KIcj6/VO+r8LVuCTYOGNb8FH04jWQz7hYrNElstnFa6jtPSHr2aCFyouCveXJGEKJaY5
         ypn2qAJJgVOIBWoo0J5ZtlK3ZbV1e4a+c/r9fBenw9mFr6wYndZTb4UpZdHcFC317w1F
         0k1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4rhT3PGcNzm25dWYihnj0/kw+5MQ9M6vws5n4q7VDmM=;
        b=uMVOzrQlTj7BFHe4z0UqbFsQ4lrliP1r6AxduqOg0o5Ak8FbRJv8KyIJQWGL007BE/
         StcE772UX7QcDBhUjH8Opohe+S9paQY77ZteBdOMQ83PdUv6UpG2Ha3ONJbbRzHmrvEm
         Fze9zQKHPhOFlebYa9JHLj5bwZs/8I9ffdVfO/tjhRnttQ4Rm5Q3xojmwqL7aBxcSJTB
         76nbokKvxLomFo1uQCgi4JW+jgBVmd/h1SUmCUhsuF+Pn2ONk5x/sWmz4iWTYT0imn/2
         CPpVg7x7NeKn7q0jmHJ7aEEZtgP5IhmncPX1Zjnaj6TtsWsxH6CLXzV3HfqRed9SEp4Q
         QIMQ==
X-Gm-Message-State: AOAM533Aceqp6Bw4eQ0mZ2vJ3lJ7xuJK777rNXiSkuCsIBUNH4zZVIti
	zZLzGB/cRGEQIuldekTkM+5timoqXT1kVj22IPY=
X-Google-Smtp-Source: 
 ABdhPJwZAsVD/wuDIS7cAxYylnP1MgcMAOyryOnKTn9vdTRLocgJ1MMnAtUkqoHplM2KnHu4AhTpcfWLrT03gMFiO4A=
X-Received: by 2002:aa7:cd99:: with SMTP id x25mr9357232edv.249.1637676277640;
 Tue, 23 Nov 2021 06:04:37 -0800 (PST)
MIME-Version: 1.0
References: <20211122163459.41079-1-max.krummenacher@toradex.com>
 <CADkTA4PdbYSU+DMsh_wd58zsrKo0xVOTCAroZhvXHiVR2BNE5g@mail.gmail.com>
 <CAEHkU3VPPcoZ=ekGu80-Kft3ZWvCsZQcNyQNWAeaS=1CKMJz-w@mail.gmail.com>
 <CADkTA4PPDrPZ-m8gOT8V9DqoAb92c+Fv-=jDLgzht6mOYaokwA@mail.gmail.com>
 <CAEHkU3X0Rrkw=Qbpmc7k8_+-NLeyM5C_KEE8gxsxpMHvX0k-RQ@mail.gmail.com>
In-Reply-To: 
 <CAEHkU3X0Rrkw=Qbpmc7k8_+-NLeyM5C_KEE8gxsxpMHvX0k-RQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 23 Nov 2021 09:04:26 -0500
Message-ID: 
 <CADkTA4N8fRtABoqJ2iRRA6jMDXw9DiUbTf4NtzD_S+OwsoaLmg@mail.gmail.com>
Subject: Re: [oe][OE-core][Patch 0/2] perf: sort-pmuevents: some fixes
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 14:04:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158604

On Tue, Nov 23, 2021 at 8:58 AM Max Krummenacher <max.oss.09@gmail.com> wrote:
>
> Let me know if there is anything I can do/provide from my side.
> I know you already did, but does 'bitbake perf -c cleansstate' help?

The builds were clean, but to rule out old artifacts, I just started a
new build on a separate server, without my normal sstate sharing
configuration. Fingers crossed :D

Bruce

>
> Max
>
> On Tue, Nov 23, 2021 at 2:55 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >
> > On Tue, Nov 23, 2021 at 8:48 AM Max Krummenacher <max.oss.09@gmail.com> wrote:
> > >
> > > Hi Bruce,
> > >
> > > On Tue, Nov 23, 2021 at 2:41 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > > >
> > > > On Mon, Nov 22, 2021 at 11:35 AM Max Krummenacher <max.oss.09@gmail.com> wrote:
> > > > >
> > > > > I am trying out a kernel recipe using linux master, 5.16-rc2. I found
> > > > > that perf fails to build in do_compile with such a setup.
> > > > > Root cause is that the kernel did add 'static' and 'const' to the
> > > > > arrays of structs which sort-pmuevents does sort.
> > > > > This is addressed in the second commit.
> > > > >
> > > > > While at it I noticed that there are some struct arrays which neither
> > > > > have a name or cpuid element with 1 array element. That 1 element was
> > > > > dropped. I did not verify if that causes any issues at runtime, however
> > > > > that behaviour was improved with the first commit.
> > > >
> > > > What MACHINE were you testing against ? When I build perf against my
> > > > -rc2 dev kernel, I still run into the build issues with these commits
> > > > in place.
> > > >
> > > > I just want to make sure that I'm not seeing something different .. so
> > > > I can do some runs against a similar config as you are using.
> > > >
> > >
> > > I did the inital work against a Toradex machine, apalis-imx6.
> > > However I built before sending the patches with qemuarm64 qemuarm qemux86-64
> > > with the following modification to use my 'master' kernel recipe:
> > > +PREFERRED_PROVIDER_virtual/kernel = "linux-toradex-mainline"
> > > +KBUILD_DEFCONFIG:arm = "tegra_defconfig"
> > > +KBUILD_DEFCONFIG:aarch64 = "defconfig"
> > > +KBUILD_DEFCONFIG:qemux86-64 = "x86_64_defconfig"
> > >
> > > I tried again. With the patches perf builds for all three machines,
> > > reverting the patches and it fails again.
> > > The x86 compiles forever, for the two ARM machines I get:
> > > ...
> > > Traceback (most recent call last):
> > >   File "/build/krm/oe-core_master/build/tmp/work/qemuarm64-tdx-linux/perf/1.0-r9/perf-1.0/sort-pmuevents.py",
> > > line 83, in <module>
> > >     print( preamble.group(1) )
> > > AttributeError: 'NoneType' object has no attribute 'group'
> >
> > Definitely still fails here for some of my configurations. I'll look
> > into it more today, and see if there's something in my reference
> > kernel configurations that are causing it.
> >
> > I need to sort this out, and can put it in a queue with my -dev
> > upgrades to 5.16, since without those version bumps, we have nothing
> > in core that exercises the change.
> >
> > Cheers,
> >
> > Bruce
> >
> > > ...
> > >
> > > Max
> > >
> > > >
> > > > >
> > > > > Note that the kernel itself doesn't build either as after 5.15 it now
> > > > > does try to run the dt_binding_check for which the kernel recipe does
> > > > > not provide whatever stuff is needed.
> > > > > I just did a revert patch for commit 53182e81f47d ("kbuild: Enable
> > > > > DT schema checks for %.dtb targets") to get over that.
> > > > >
> > > > > Max Krummenacher (2):
> > > > >   perf: sort-pmuevents: don't drop elements
> > > > >   perf: sort-pmuevents: allow for additional type qualifiers and storage
> > > > >     class
> > > > >
> > > > >  .../perf/perf/sort-pmuevents.py               | 28 +++++++++++--------
> > > > >  1 file changed, 16 insertions(+), 12 deletions(-)
> > > > >
> > > > > --
> > > > > 2.20.1
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


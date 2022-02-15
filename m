Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 575D3C433F5
	for <webhook@archiver.kernel.org>; Tue, 15 Feb 2022 14:31:21 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.10039.1644935480346960759
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 06:31:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qMhHaneJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id p14so20386073ejf.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 06:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gKHdgIC/cOEgLW+5GNgN7Z9MDhctAFPM7HGzltPMaYk=;
        b=qMhHaneJMMLMn68BmrNlsxS1X+jtHAMaz8paYyuuUW49sH3pc9yEPX2h5YSLTfhWNE
         tlUe5UtG7oJHiT7XEX+1A/ugXdhLKH6oP3aq2iLtCwvKjcIul+vZGtTOQKMSWl2fTnjS
         dQztUbsmoad2pMw9i+3oCB4trWeRVkQA/7x2YXYhB0oQdRurA42fmQpw441epmcN9dv2
         G18gmCip0PjcDD3HRX9XoM91kSI3C4HsRyqMhrL3S33JNhpv6sEe73IbJZqp8U8Ga0Lf
         Xh6Ydz1cFooRaIyqilqh2SME+xv4mF7+ENZ4ZTNzR3kC/bT1Yiv4KRelwCUiaNkD2B1K
         pGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gKHdgIC/cOEgLW+5GNgN7Z9MDhctAFPM7HGzltPMaYk=;
        b=psIURZTEqOs2W7tLpFW3hJL4Rmaf0p5jF6Pf5KFJ/oazuFNZObzYSLUcUJVXnEmFHX
         TCdQPJMGWCstEyMR1puYKPK41bQVwFHNvVNC4C5BQMf6xCBQ5AUVzNQicxhzcHOYvV7/
         oaAdLS5XB17+XfZ3mgQ/DtyZnGqlFJp6D18xiZc3befVUBOA7wGgh0dWnDZoto/Z74YQ
         8tRgyY3HsTry8+iwmyD6sMXXjLsV+97FA9FwoX/vyzoTtmhJxP1HqhyPYWsX0dhVRwrL
         p1f6AVY6V7pizhlnfiysJcha9SK29TPjmnY4RSrATz7PhX4kZPoMZjWTYU48ZgNUgVps
         kZPA==
X-Gm-Message-State: AOAM530+pXOXeokbYKJDLINKw2MHMO3PUgK4WP8BcEkvGOXXJwsmBaEG
	gfDrY7A7OmKYFE3RgRP0aiKV3uCMm2NO4k68F0U=
X-Google-Smtp-Source: 
 ABdhPJxh9BEyiwdbAabVQQCNBUEUSJH9qaoFxOl84rMLFIGYkqVN/T7/3kxokhporJd6/oGR+HBrwtSkyGI3w2KnVEU=
X-Received: by 2002:a17:906:6a93:: with SMTP id
 p19mr3302539ejr.711.1644935478545;
 Tue, 15 Feb 2022 06:31:18 -0800 (PST)
MIME-Version: 1.0
References: <20220210183719.3213809-1-raj.khem@gmail.com>
 <708e70534079e11e5db614f43e314aef62587a3c.camel@linuxfoundation.org>
 <CAMKF1sqrEhQWAv7UzK7OwP7mR17nc3UxufnxcV05tLzr+G29wg@mail.gmail.com>
 <CADkTA4Nj137Tn58UQkZvDJVUjts5+OQtJ_6TuiWEq3GKQ7V2bw@mail.gmail.com>
 <c33e356bc1429ff6b8175dd056603a21cae833d4.camel@linuxfoundation.org>
 <CADkTA4N-yxzSMuhVpPWyddcaOLkmBpEwgs4TECr8SNup8tE__Q@mail.gmail.com>
 <f757b86e660f932075e03658a50de4e10b348f35.camel@linuxfoundation.org>
In-Reply-To: 
 <f757b86e660f932075e03658a50de4e10b348f35.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 15 Feb 2022 09:31:07 -0500
Message-ID: 
 <CADkTA4PU7twdDR+0Fte=8juPNUxnccvatRnb2vbPeVhy4VrUqw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] binutils: Upgrade to 2.38 release
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Feb 2022 14:31:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161750

On Sun, Feb 13, 2022 at 3:31 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sun, 2022-02-13 at 11:27 -0500, Bruce Ashfield wrote:
> > On Sun, Feb 13, 2022 at 9:27 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Sat, 2022-02-12 at 20:25 -0500, Bruce Ashfield wrote:
> > > > On Sat, Feb 12, 2022 at 12:27 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > > >
> > > > > On Sat, Feb 12, 2022 at 5:27 AM Richard Purdie
> > > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > >
> > > > > > On Thu, 2022-02-10 at 10:37 -0800, Khem Raj wrote:
> > > > > > > Release Notes are here [1]
> > > > > > >
> > > > > > > [1] https://lists.gnu.org/archive/html/info-gnu/2022-02/msg00009.html
> > > > > > >
> > > > > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > > >
> > > > > > So far there was a mingw failure:
> > > > > >
> > > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/4729
> > > > >
> > > > > This seems a race
> > > > >
> > > > > > i686-w64-mingw32-dlltool: lib32/libd3dcompiler_35.a: error reading
> > > > > D3DCompiler_dll_t.o: No such file or directory
> > > > > > Assembler messages:
> > > > > > Error: can't open D3DCompiler_dll_h.s for reading: No such file or directory
> > > > > > i686-w64-mingw32-dlltool: i686-w64-mingw32-as exited with status 1
> > > > > > i686-w64-mingw32-dlltool: failed to open temporary head file:
> > > > > D3DCompiler_dll_h.o: No such file or directory
> > > > > > Makefile:82403: recipe for target 'lib32/libd3dcompiler_35.a' failed
> > > > > > make[1]: *** [lib32/libd3dcompiler_35.a] Error 1
> > > > >
> > > > >
> > > > >
> > > > > >
> > > > > > and a qemuppc kernel build issue:
> > > > > >
> > > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/4688
> > > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/2632
> > > > > >
> > > > >
> > > > > this needs a kernel patch backported ( looking towards Bruce to include it)
> > > > >
> > > > > https://lore.kernel.org/lkml/20220211005113.1361436-1-anders.roxell@linaro.org/T/
> > > >
> > > > I've grabbed this change, and the riscv one, and applied them to 5.10 and 5.15.
> > > >
> > > > The pull request is on the list for the binutils fixes and -stable updates.
> > >
> > > Thanks Bruce. Unfortunately this doesn't seem to fix the qemuppc build issues:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/4691
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/2634
> >
> > I see a patch from January on lkml with the shortlog: "powerpc/mm:
> > Switch obsolete dssall to .long", which may be related.
> >
> > But I'm not setup to see the build issues myself this weekend, but can
> > start looking more closely on Monday.
>
> I can confirm that cherry-picking:
>
> From d51f86cfd8e378d4907958db77da3074f6dce3ba Mon Sep 17 00:00:00 2001
> From: Alexey Kardashevskiy <aik@ozlabs.ru>
> Date: Tue, 21 Dec 2021 16:59:03 +1100
> Subject: powerpc/mm: Switch obsolete dssall to .long
>
> into 5.15 locally did fix my qemuppc build.
>

I managed to miss this on the weekend. I've grabbed it for 5.15, and
have had to tweak it a bit for 5.10. Once my 5.10 builds are done,
I'll send SRCREV updates for linux-yocto.

Bruce

> Cheers,
>
> Richard
>
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


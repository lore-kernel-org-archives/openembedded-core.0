Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78D09C433EF
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 13:55:22 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.11262.1637675720784009640
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 05:55:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BNIMZlPL;
 spf=pass (domain: gmail.com, ip: 209.85.208.48,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id t5so92872692edd.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 05:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WCefCS+mOw5A0+eiyFeU+BP0VrctqaBP3y/Yf1TacFU=;
        b=BNIMZlPLdDmurfIu4rwdL9YTfaImO9NvBOrYzEWOAgUUqUBT6m2pZ24lmoG+UfAY6e
         OfeJu2PXslPdMbpftysPA6pUfmZvtsc6KR150cPj1f7GBJsC+aFEAPMuQ20BN6nQNbP9
         5nt/PHbSa/e0Y8QJ8r90WiE0Oa284saSdbyp3UnRbnQEW8vghBDliwXuCemNKfDu6PRJ
         nGX9pp8/5LITWum56PhAX0Q7qD5WSmEzABYVKKmhUlmwVF2qZNMfovURPbajU9LYxkoV
         huzY7eR/CM3A+HUOeIjyaDK1YKKFGsbylthoG5Giea3doSAnUJxBtMD5uwlt1gyGlf+o
         4yfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WCefCS+mOw5A0+eiyFeU+BP0VrctqaBP3y/Yf1TacFU=;
        b=0nfyeZPUweZRw2aJd5LkGZ3Bh5i1nXvQkryzuQX7oTccI7BUBX1FIZuRhXhguhykOP
         w/K0qzBeJR/2CW84iiqmHm6iFn+y2ezh8H+AL20jJhfsgDmAii8Qnn//S64Up0e4VS46
         ml1e+/3g5ygTDqe//NP8H6ztQUMUqM+kXS1vo34fSSNMo1fXdoAa+tdontjGhk25Jndj
         sH4gQSyoOTtgU7MmjCTk6ZFodtYnMGMaPlgZt0mk7xQoexj6R0sDZI3lqWid/PeHwxKY
         qtFTMcfDJBOsmPnzfgm1BiaTcJrQdZqlr8YefzdU/xM2QkSQnTUwh0Bl4KxGmx4pii7i
         oGwA==
X-Gm-Message-State: AOAM531Vpyk3rqADtG0KANOo4Q4gMAzDTwEx2I9OOHjNCSNhWWwi2VEg
	wt56btSAIyqzMmu5FVdQ6zl99xhQIHbo4Jy4PjE=
X-Google-Smtp-Source: 
 ABdhPJwfwEEEnrpA/eryiehGyZ51zMk7BdG+g5842IvHROlUDsqtTTZcrnuySq5Au7ystYGekYcsbrASbEHNxw2XDKE=
X-Received: by 2002:a17:906:314e:: with SMTP id
 e14mr7952815eje.165.1637675719109;
 Tue, 23 Nov 2021 05:55:19 -0800 (PST)
MIME-Version: 1.0
References: <20211122163459.41079-1-max.krummenacher@toradex.com>
 <CADkTA4PdbYSU+DMsh_wd58zsrKo0xVOTCAroZhvXHiVR2BNE5g@mail.gmail.com>
 <CAEHkU3VPPcoZ=ekGu80-Kft3ZWvCsZQcNyQNWAeaS=1CKMJz-w@mail.gmail.com>
In-Reply-To: 
 <CAEHkU3VPPcoZ=ekGu80-Kft3ZWvCsZQcNyQNWAeaS=1CKMJz-w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 23 Nov 2021 08:55:08 -0500
Message-ID: 
 <CADkTA4PPDrPZ-m8gOT8V9DqoAb92c+Fv-=jDLgzht6mOYaokwA@mail.gmail.com>
Subject: Re: [oe][OE-core][Patch 0/2] perf: sort-pmuevents: some fixes
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 13:55:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158601

On Tue, Nov 23, 2021 at 8:48 AM Max Krummenacher <max.oss.09@gmail.com> wrote:
>
> Hi Bruce,
>
> On Tue, Nov 23, 2021 at 2:41 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >
> > On Mon, Nov 22, 2021 at 11:35 AM Max Krummenacher <max.oss.09@gmail.com> wrote:
> > >
> > > I am trying out a kernel recipe using linux master, 5.16-rc2. I found
> > > that perf fails to build in do_compile with such a setup.
> > > Root cause is that the kernel did add 'static' and 'const' to the
> > > arrays of structs which sort-pmuevents does sort.
> > > This is addressed in the second commit.
> > >
> > > While at it I noticed that there are some struct arrays which neither
> > > have a name or cpuid element with 1 array element. That 1 element was
> > > dropped. I did not verify if that causes any issues at runtime, however
> > > that behaviour was improved with the first commit.
> >
> > What MACHINE were you testing against ? When I build perf against my
> > -rc2 dev kernel, I still run into the build issues with these commits
> > in place.
> >
> > I just want to make sure that I'm not seeing something different .. so
> > I can do some runs against a similar config as you are using.
> >
>
> I did the inital work against a Toradex machine, apalis-imx6.
> However I built before sending the patches with qemuarm64 qemuarm qemux86-64
> with the following modification to use my 'master' kernel recipe:
> +PREFERRED_PROVIDER_virtual/kernel = "linux-toradex-mainline"
> +KBUILD_DEFCONFIG:arm = "tegra_defconfig"
> +KBUILD_DEFCONFIG:aarch64 = "defconfig"
> +KBUILD_DEFCONFIG:qemux86-64 = "x86_64_defconfig"
>
> I tried again. With the patches perf builds for all three machines,
> reverting the patches and it fails again.
> The x86 compiles forever, for the two ARM machines I get:
> ...
> Traceback (most recent call last):
>   File "/build/krm/oe-core_master/build/tmp/work/qemuarm64-tdx-linux/perf/1.0-r9/perf-1.0/sort-pmuevents.py",
> line 83, in <module>
>     print( preamble.group(1) )
> AttributeError: 'NoneType' object has no attribute 'group'

Definitely still fails here for some of my configurations. I'll look
into it more today, and see if there's something in my reference
kernel configurations that are causing it.

I need to sort this out, and can put it in a queue with my -dev
upgrades to 5.16, since without those version bumps, we have nothing
in core that exercises the change.

Cheers,

Bruce

> ...
>
> Max
>
> >
> > >
> > > Note that the kernel itself doesn't build either as after 5.15 it now
> > > does try to run the dt_binding_check for which the kernel recipe does
> > > not provide whatever stuff is needed.
> > > I just did a revert patch for commit 53182e81f47d ("kbuild: Enable
> > > DT schema checks for %.dtb targets") to get over that.
> > >
> > > Max Krummenacher (2):
> > >   perf: sort-pmuevents: don't drop elements
> > >   perf: sort-pmuevents: allow for additional type qualifiers and storage
> > >     class
> > >
> > >  .../perf/perf/sort-pmuevents.py               | 28 +++++++++++--------
> > >  1 file changed, 16 insertions(+), 12 deletions(-)
> > >
> > > --
> > > 2.20.1
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


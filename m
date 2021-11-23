Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 555ABC433EF
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 13:58:52 +0000 (UTC)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web10.11490.1637675931664867581
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 05:58:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=anBo2Gdc;
 spf=pass (domain: gmail.com, ip: 209.85.222.42,
 mailfrom: max.oss.09@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id a14so415045uak.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 05:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OZsLBHSzKHjksw2Dulwbu1qn1CoOA3m7yu7qzl8Tb+U=;
        b=anBo2GdcLhZPr3f3gRLjvaLFQV9ucxh2LjKngmXypwLJb2V2bLlaehZBLC+P0KMbr/
         3XsPw+Nsd/qvkw5CoBM4G8uBwwEJ5gItsyYwSLgF7fSpiP52m/1CllJuyWIpEKrYdPwL
         rpXLAX9JKDQ8riqUJ9r8XBKxY0MCIjmqqP0rTiunApVPW4dkaWIwwkvHgz/eAL0SzEN/
         WOYyoAg2yBDJYaECjxMf08EMA0voTQYwbP6oiCkMgFNZgnoUuTQ1jmteUhocM8+eWojS
         u9qmpoivyKf+Vtuyli3naIBQlLqGftttivpCBPurJYNa7of+arVYdy97ktrpNbo+CVtS
         wkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OZsLBHSzKHjksw2Dulwbu1qn1CoOA3m7yu7qzl8Tb+U=;
        b=wu9tyBXpfst4A10GaR8p9YnK2hUp+w9o1AS9FhYZ1JNZ0TeTWXmkhLrK7jrdP10CGF
         J6vdZhjbpbtgz1iqOjXFvsfsyZ75YDTv04N8zxLExbx3w4nFUeA/ialgUZXYmmE4QS1K
         4HtzLKKY6ZRwlI1rqwD1nBQgfDlBLjaNy7Nq7nAjfbf5MKt1OTw6zbYkTL0K0fff0Skw
         vUDDdMTB13gb6Ys8YvNFwnoEPMbZq3aqDpgXpFOqOBZFTfgl0pyD0VBBXWWg8jFAKzgL
         EKod9VvsSmu0/nhIhJAK/SEIowXh9m9P0+CmBD+GDAiBzsol5VtFVMz4Y+fAaPxjEXfz
         7ftQ==
X-Gm-Message-State: AOAM532IzaOpkoDfQpVdEgKB0cm8RjmyGUYpDXwsMysvq+i9OnxUc1IM
	duPlPh1cumOkgKZxYw+yiM2KyZ32rRGdjBKcwhQ=
X-Google-Smtp-Source: 
 ABdhPJzG9GW/XTx51MsIS7JxGBEO5WfalJl8FOpV+epyM9JPYz6SmH+u6vR6vbAJSvErmzq+F4yCdQCIxABOIG/HxSE=
X-Received: by 2002:a67:6ac6:: with SMTP id f189mr8901433vsc.44.1637675930724;
 Tue, 23 Nov 2021 05:58:50 -0800 (PST)
MIME-Version: 1.0
References: <20211122163459.41079-1-max.krummenacher@toradex.com>
 <CADkTA4PdbYSU+DMsh_wd58zsrKo0xVOTCAroZhvXHiVR2BNE5g@mail.gmail.com>
 <CAEHkU3VPPcoZ=ekGu80-Kft3ZWvCsZQcNyQNWAeaS=1CKMJz-w@mail.gmail.com>
 <CADkTA4PPDrPZ-m8gOT8V9DqoAb92c+Fv-=jDLgzht6mOYaokwA@mail.gmail.com>
In-Reply-To: 
 <CADkTA4PPDrPZ-m8gOT8V9DqoAb92c+Fv-=jDLgzht6mOYaokwA@mail.gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Tue, 23 Nov 2021 14:58:39 +0100
Message-ID: 
 <CAEHkU3X0Rrkw=Qbpmc7k8_+-NLeyM5C_KEE8gxsxpMHvX0k-RQ@mail.gmail.com>
Subject: Re: [oe][OE-core][Patch 0/2] perf: sort-pmuevents: some fixes
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 13:58:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158602

Let me know if there is anything I can do/provide from my side.
I know you already did, but does 'bitbake perf -c cleansstate' help?

Max

On Tue, Nov 23, 2021 at 2:55 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Tue, Nov 23, 2021 at 8:48 AM Max Krummenacher <max.oss.09@gmail.com> wrote:
> >
> > Hi Bruce,
> >
> > On Tue, Nov 23, 2021 at 2:41 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > >
> > > On Mon, Nov 22, 2021 at 11:35 AM Max Krummenacher <max.oss.09@gmail.com> wrote:
> > > >
> > > > I am trying out a kernel recipe using linux master, 5.16-rc2. I found
> > > > that perf fails to build in do_compile with such a setup.
> > > > Root cause is that the kernel did add 'static' and 'const' to the
> > > > arrays of structs which sort-pmuevents does sort.
> > > > This is addressed in the second commit.
> > > >
> > > > While at it I noticed that there are some struct arrays which neither
> > > > have a name or cpuid element with 1 array element. That 1 element was
> > > > dropped. I did not verify if that causes any issues at runtime, however
> > > > that behaviour was improved with the first commit.
> > >
> > > What MACHINE were you testing against ? When I build perf against my
> > > -rc2 dev kernel, I still run into the build issues with these commits
> > > in place.
> > >
> > > I just want to make sure that I'm not seeing something different .. so
> > > I can do some runs against a similar config as you are using.
> > >
> >
> > I did the inital work against a Toradex machine, apalis-imx6.
> > However I built before sending the patches with qemuarm64 qemuarm qemux86-64
> > with the following modification to use my 'master' kernel recipe:
> > +PREFERRED_PROVIDER_virtual/kernel = "linux-toradex-mainline"
> > +KBUILD_DEFCONFIG:arm = "tegra_defconfig"
> > +KBUILD_DEFCONFIG:aarch64 = "defconfig"
> > +KBUILD_DEFCONFIG:qemux86-64 = "x86_64_defconfig"
> >
> > I tried again. With the patches perf builds for all three machines,
> > reverting the patches and it fails again.
> > The x86 compiles forever, for the two ARM machines I get:
> > ...
> > Traceback (most recent call last):
> >   File "/build/krm/oe-core_master/build/tmp/work/qemuarm64-tdx-linux/perf/1.0-r9/perf-1.0/sort-pmuevents.py",
> > line 83, in <module>
> >     print( preamble.group(1) )
> > AttributeError: 'NoneType' object has no attribute 'group'
>
> Definitely still fails here for some of my configurations. I'll look
> into it more today, and see if there's something in my reference
> kernel configurations that are causing it.
>
> I need to sort this out, and can put it in a queue with my -dev
> upgrades to 5.16, since without those version bumps, we have nothing
> in core that exercises the change.
>
> Cheers,
>
> Bruce
>
> > ...
> >
> > Max
> >
> > >
> > > >
> > > > Note that the kernel itself doesn't build either as after 5.15 it now
> > > > does try to run the dt_binding_check for which the kernel recipe does
> > > > not provide whatever stuff is needed.
> > > > I just did a revert patch for commit 53182e81f47d ("kbuild: Enable
> > > > DT schema checks for %.dtb targets") to get over that.
> > > >
> > > > Max Krummenacher (2):
> > > >   perf: sort-pmuevents: don't drop elements
> > > >   perf: sort-pmuevents: allow for additional type qualifiers and storage
> > > >     class
> > > >
> > > >  .../perf/perf/sort-pmuevents.py               | 28 +++++++++++--------
> > > >  1 file changed, 16 insertions(+), 12 deletions(-)
> > > >
> > > > --
> > > > 2.20.1
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


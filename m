Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F3C8C433F5
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 21:40:57 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.696.1637703656059219795
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 13:40:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lTalDJ9W;
 spf=pass (domain: gmail.com, ip: 209.85.208.53,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id y13so819194edd.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 13:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gkBfuNw3Citfisw0/IrVB2j+aGt0Vd/WKHqrni/S4i4=;
        b=lTalDJ9WFDiVidzkSlvaVpETSZGE341kTEEvBncwUFRuZwKYS4i17l0uV/TeXwOMZi
         5iqPOpDc3stuvHAJoYlkx9dQTChmar5ScxWQA4kXGkxa1DV9+HIWKifFSvT6z6ijijWp
         V92f/0y+Afzod96hAVxs8uN1EHMYKEgEqFrKWisEPnU6n4JpA4WADba6zVSNmEWN/ziy
         CQyK8zuJ7BuSERZLuxyyrrxL3RuZlSDUzx2tekk3W8ZX0LI2OJo5Y2rNWS9UKUcHdMFI
         cLRSkRWPlpfxhiovUKSMycSIbRm4a3VnsPYvij8gNML8uLEXOgefjuNZC8QUVpQLO9UO
         XRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gkBfuNw3Citfisw0/IrVB2j+aGt0Vd/WKHqrni/S4i4=;
        b=uWjf/i03GuJa+twCCJ6Vtko0GdXOQ5h3I7P7/HCVHqMOY5jSb3ZCeYV+/himPJQA/t
         fSNAv4n8RCZlQrHtvfu1ZinIlL+AwU+AWMHXZVftTvXsFdfJQ+hvH7sSkEB15yJXAMAJ
         6Czj9N82tHNPXzmfvJhSI9oeHpla4H4d48z/DRiTv7nJlzeCwh5zfILlzGDi4MKIXpic
         yciEVCTVYdU6hiveQ5GKkfKu1TAMCm97rYZZklSeBVMxHdeJinFwLKccZgQtijKboTwj
         TOy1JfpN6zNbObW0NcjRra6u2maugBdyfKHNuqJfhrbyuGng3Mx/ap94hwfZHrjcH8n7
         Dd4g==
X-Gm-Message-State: AOAM532sCZYaNk4g97n+bWT/mwYMhR1kwBIzxDqylqQjINVNxyFYVXxT
	4SZXtabHBW/NCcFGXfdy8c6wp6OODKheYH9E+4k=
X-Google-Smtp-Source: 
 ABdhPJxpx3qP6+IXOF2FNpiLNGsvJzhKTnr//7JAVbQX7nLaRBge+lhvuy6GmKSAFirqbfuNwOOXWdcXv2fS6nRJy28=
X-Received: by 2002:a17:907:94d4:: with SMTP id
 dn20mr12164860ejc.379.1637703654149;
 Tue, 23 Nov 2021 13:40:54 -0800 (PST)
MIME-Version: 1.0
References: <20211122163459.41079-1-max.krummenacher@toradex.com>
 <CADkTA4PdbYSU+DMsh_wd58zsrKo0xVOTCAroZhvXHiVR2BNE5g@mail.gmail.com>
 <CAEHkU3VPPcoZ=ekGu80-Kft3ZWvCsZQcNyQNWAeaS=1CKMJz-w@mail.gmail.com>
 <CADkTA4PPDrPZ-m8gOT8V9DqoAb92c+Fv-=jDLgzht6mOYaokwA@mail.gmail.com>
 <CAEHkU3X0Rrkw=Qbpmc7k8_+-NLeyM5C_KEE8gxsxpMHvX0k-RQ@mail.gmail.com>
 <16BA31E66A619EB2.13215@lists.openembedded.org>
In-Reply-To: <16BA31E66A619EB2.13215@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 23 Nov 2021 16:40:43 -0500
Message-ID: 
 <CADkTA4O1tqSsiuM7vinGoDp9mm__25FgKbJGddeQogZ5=Ccfww@mail.gmail.com>
Subject: Re: [oe][OE-core][Patch 0/2] perf: sort-pmuevents: some fixes
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Max Krummenacher <max.oss.09@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 21:40:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158620

On Tue, Nov 23, 2021 at 9:05 AM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
>
> On Tue, Nov 23, 2021 at 8:58 AM Max Krummenacher <max.oss.09@gmail.com> wrote:
> >
> > Let me know if there is anything I can do/provide from my side.
> > I know you already did, but does 'bitbake perf -c cleansstate' help?
>
> The builds were clean, but to rule out old artifacts, I just started a
> new build on a separate server, without my normal sstate sharing
> configuration. Fingers crossed :D

It is building on my completely fresh box. Which does imply I was
getting the old script before .. but I can't say for sure why.

Regardless, I'm sending a consolidated pull request shortly with some
v5.16 fixes, and have these stacked on top, just to confirm they are
working in my setup and that I've tested them.

Bruce

>
> Bruce
>
> >
> > Max
> >
> > On Tue, Nov 23, 2021 at 2:55 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > >
> > > On Tue, Nov 23, 2021 at 8:48 AM Max Krummenacher <max.oss.09@gmail.com> wrote:
> > > >
> > > > Hi Bruce,
> > > >
> > > > On Tue, Nov 23, 2021 at 2:41 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > > > >
> > > > > On Mon, Nov 22, 2021 at 11:35 AM Max Krummenacher <max.oss.09@gmail.com> wrote:
> > > > > >
> > > > > > I am trying out a kernel recipe using linux master, 5.16-rc2. I found
> > > > > > that perf fails to build in do_compile with such a setup.
> > > > > > Root cause is that the kernel did add 'static' and 'const' to the
> > > > > > arrays of structs which sort-pmuevents does sort.
> > > > > > This is addressed in the second commit.
> > > > > >
> > > > > > While at it I noticed that there are some struct arrays which neither
> > > > > > have a name or cpuid element with 1 array element. That 1 element was
> > > > > > dropped. I did not verify if that causes any issues at runtime, however
> > > > > > that behaviour was improved with the first commit.
> > > > >
> > > > > What MACHINE were you testing against ? When I build perf against my
> > > > > -rc2 dev kernel, I still run into the build issues with these commits
> > > > > in place.
> > > > >
> > > > > I just want to make sure that I'm not seeing something different .. so
> > > > > I can do some runs against a similar config as you are using.
> > > > >
> > > >
> > > > I did the inital work against a Toradex machine, apalis-imx6.
> > > > However I built before sending the patches with qemuarm64 qemuarm qemux86-64
> > > > with the following modification to use my 'master' kernel recipe:
> > > > +PREFERRED_PROVIDER_virtual/kernel = "linux-toradex-mainline"
> > > > +KBUILD_DEFCONFIG:arm = "tegra_defconfig"
> > > > +KBUILD_DEFCONFIG:aarch64 = "defconfig"
> > > > +KBUILD_DEFCONFIG:qemux86-64 = "x86_64_defconfig"
> > > >
> > > > I tried again. With the patches perf builds for all three machines,
> > > > reverting the patches and it fails again.
> > > > The x86 compiles forever, for the two ARM machines I get:
> > > > ...
> > > > Traceback (most recent call last):
> > > >   File "/build/krm/oe-core_master/build/tmp/work/qemuarm64-tdx-linux/perf/1.0-r9/perf-1.0/sort-pmuevents.py",
> > > > line 83, in <module>
> > > >     print( preamble.group(1) )
> > > > AttributeError: 'NoneType' object has no attribute 'group'
> > >
> > > Definitely still fails here for some of my configurations. I'll look
> > > into it more today, and see if there's something in my reference
> > > kernel configurations that are causing it.
> > >
> > > I need to sort this out, and can put it in a queue with my -dev
> > > upgrades to 5.16, since without those version bumps, we have nothing
> > > in core that exercises the change.
> > >
> > > Cheers,
> > >
> > > Bruce
> > >
> > > > ...
> > > >
> > > > Max
> > > >
> > > > >
> > > > > >
> > > > > > Note that the kernel itself doesn't build either as after 5.15 it now
> > > > > > does try to run the dt_binding_check for which the kernel recipe does
> > > > > > not provide whatever stuff is needed.
> > > > > > I just did a revert patch for commit 53182e81f47d ("kbuild: Enable
> > > > > > DT schema checks for %.dtb targets") to get over that.
> > > > > >
> > > > > > Max Krummenacher (2):
> > > > > >   perf: sort-pmuevents: don't drop elements
> > > > > >   perf: sort-pmuevents: allow for additional type qualifiers and storage
> > > > > >     class
> > > > > >
> > > > > >  .../perf/perf/sort-pmuevents.py               | 28 +++++++++++--------
> > > > > >  1 file changed, 16 insertions(+), 12 deletions(-)
> > > > > >
> > > > > > --
> > > > > > 2.20.1
> > > > > >
> > > > >
> > > > >
> > > > > --
> > > > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > > > thee at its end
> > > > > - "Use the force Harry" - Gandalf, Star Trek II
> > >
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
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158604): https://lists.openembedded.org/g/openembedded-core/message/158604
> Mute This Topic: https://lists.openembedded.org/mt/87238903/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


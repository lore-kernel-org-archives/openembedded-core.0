Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26574C05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 18:20:55 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web11.81786.1674757248028020593
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 10:20:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TXXq9XWw;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id p133so2119325oig.8
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 10:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HceOd+DeLf46K8oD4cZ9M1dPZaKrlCD/QmQ05+LInJc=;
        b=TXXq9XWwjU8241djbdtLU80CduMCaxqWTT0F/d/6FjXoTIAAADntYBU7vRbvKIHDRU
         195YL4iam+C6g6WDTtlLKF6bTH6xs+l2qvgxlt7R7pycguTII9Uh7HafgENoK3K0/p5z
         OHyW1tA5EcB0GUSUsXSPIiDg6m50VNDlTtSSFsNtRIN01gIkW1a80mk8RbsdHIXCSelm
         61VfviFtahhwCPOUjT19ovbqh/xJYJ8B51P/wGtatsUxJ0o2fnxL/abD/bzVIaw7SNNM
         VkCtIdSlonujhWREqTjb76sGnAK1z+rGC0m+Q7SssQ/DwwHr9vSIjQzhaNSkIny8q0X+
         Qn5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HceOd+DeLf46K8oD4cZ9M1dPZaKrlCD/QmQ05+LInJc=;
        b=LheQhTYdZuBbgCKgAggPRI6rYixaggHX20wbXTlZfKhs1jfQd2DrkhDU5as9yLlJ7Q
         YfBl8lEUgXPS+3Kx3yZHfofuGJ7utN0qAgketu2NOx9JUlfWFLGQTFl8aHd83AzMNhDb
         PC6V0mGr1gkv7Mq7XRaxvdsvwYFHNUB5SMV4rK/7MMo5J+JZbdEcjQIPCyAUlHMUJN+t
         FL6vnAWxa/A/XqgQOhDtebFsAFO/+4PdLZiE+cQApK7hH2xcf4xay7ofGnGlrUw2nB+l
         x5YLGWzk4aLiT//9Fppnmx+OGIAsTPibQJ3MGHukZV7aWn2gMnJXYdnSN852XwXh1EDO
         Mz/w==
X-Gm-Message-State: AFqh2kqehI/P3IzWsdsrb15GlJtKWptXqztkaHjEtvsp9q62B9FvG7O8
	14qnwZEnLJDRoA6aXLxxZEld6/L/l/X27BV8FOk=
X-Google-Smtp-Source: AMrXdXsyfwTSWubIr9a7BExOqyX43MCXnrwZDBMs8TUtr0DYQPep9AjNXYg+ZGmcxsaZakE54zFW2QFxhQ+Oq/6J5GM=
X-Received: by 2002:a05:6808:120a:b0:364:bd84:ca34 with SMTP id
 a10-20020a056808120a00b00364bd84ca34mr2344908oil.262.1674757247240; Thu, 26
 Jan 2023 10:20:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674597466.git.bruce.ashfield@gmail.com>
 <030b78056586e38cbaca26055da1af61a9786e0d.camel@linuxfoundation.org>
 <Y9Kol1jla2OQMzOa@mail.local> <a5a031e840a8af1b5c6f71c5747898ea420457e5.camel@linuxfoundation.org>
 <CADkTA4OBwOEc5ubqWb+zdk=ESv=eLXo1_X8hEfyX9o2GX4XcEg@mail.gmail.com>
 <7fe4aec8467d9300169904c6e43431057ce3c017.camel@linuxfoundation.org>
 <CAMKF1sr4-4b0SE01WjsJv7miHJ-W-8C90S8xphXkpK2BXndKpg@mail.gmail.com> <CADkTA4OrOCF190uUV+9Np7ZzwexONMo1B0XHbmhM41oi7fu02g@mail.gmail.com>
In-Reply-To: <CADkTA4OrOCF190uUV+9Np7ZzwexONMo1B0XHbmhM41oi7fu02g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Jan 2023 10:20:21 -0800
Message-ID: <CAMKF1soMnvJybEmfm0pz-zvTQmfdubTQ=2hxKsXA_R0PFf8Zzw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/2] kernel-yocto: drop 5.19 recipes and make
 6.1 default
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 18:20:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176419

On Thu, Jan 26, 2023 at 10:06 AM Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
> On Thu, Jan 26, 2023 at 12:58 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > we need to define
> >
> > KBUILD_BUILD_USER=3D"yocto"
> > KBUILD_BUILD_HOST=3D"yocto"
> >
> > in linux-yocto defconfigs
> >
>
> No, we really don't want to do that.
>
> There's an environment variable that is supposed to be reflected in
> the build. Which we already set.

a better location would be distro config defining it and derived
distros can override it if needed.

>
> If that has changed in 6.1, then I'll come up with a patch as required.
>
> Bruce
>
> > You can use my name too :)
> >
> > On Thu, Jan 26, 2023 at 9:34 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Thu, 2023-01-26 at 12:07 -0500, Bruce Ashfield wrote:
> > > > On Thu, Jan 26, 2023 at 11:36 AM Richard Purdie
> > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > >
> > > > > On Thu, 2023-01-26 at 17:21 +0100, Alexandre Belloni wrote:
> > > > > > On 26/01/2023 12:39:02+0000, Richard Purdie wrote:
> > > > > > > On Tue, 2023-01-24 at 16:59 -0500, bruce.ashfield@gmail.com w=
rote:
> > > > > > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > > > > >
> > > > > > > > Richard,
> > > > > > > >
> > > > > > > > As promised, here are the commits to switch us over to 6.1 =
as the
> > > > > > > > default.
> > > > > > > >
> > > > > > > > I'll also send a series for poky to bump things there as we=
ll.
> > > > > > > >
> > > > > > > > Also, if there are any significant problems, we'll just she=
lve this
> > > > > > > > while I look at any issues. But at this point, it is worth =
getting
> > > > > > > > the patches out there to move the needle to 6.1
> > > > > > >
> > > > > > > Thanks!
> > > > > > >
> > > > > > > I think the issues are:
> > > > > > >
> > > > > > > a) two selftest failures:
> > > > > > >
> > > > > > >   oe-selftest -r devtool.DevtoolUpgradeTests.test_devtool_vir=
tual_kernel_modify
> > > > > > >   oe-selftest -r efibootpartition.GenericEFITest.test_boot_ef=
i
> > > > > > >
> > > > > > > b) meta-arm issues
> > > > > > >
> > > > > > > c) meta-virt issue (which you have a patch pending for in -ne=
xt)
> > > > > > >
> > > > > >
> > > > > > Unfortunately, I have to add
> > > > > >
> > > > > > d) perf reproducibility issues:
> > > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/117/bui=
lds/2294/steps/13/logs/stdio
> > > > >
> > > > > Ahrrg.
> > > > >
> > > > > http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-202301=
26-poma_o8v/packages/diff-html/
> > > > >
> > > > >
> > > > > /lib/modules/6.1.5-yocto-standard/build/include/generated/compile=
.h
> > > > >
> > > > > from
> > > > >
> > > > > #define=C2=B7LINUX_COMPILE_HOST=C2=BB      "alma8-ty-2.yocto.io
> > > > >
> > > > > to
> > > > >
> > > > > #define=C2=B7LINUX_COMPILE_HOST=C2=BB      "ubuntu2004-ty-1"
> > > > >
> > > > > Bruce: Any idea if we can set that to some specific value?
> > > > >
> > > > > We probably should start by fixing that and then see if that impr=
oves
> > > > > things...
> > > >
> > > > Interesting. In my local builds:
> > > >
> > > > #define LINUX_COMPILE_HOST      "oe-host"
> > > >
> > > > I'm building 6.1.7, but that shouldn't be the difference.
> > > >
> > > > The value comes from: classes-recipe/kernel.bbclass:export
> > > > KBUILD_BUILD_HOST ?=3D "oe-host",
> > > > and has been that way for a while.
> > > >
> > > > I'm also grepping for other BUILDPATHS references, but the QA test
> > > > should have caught
> > > > those if that was the issue.
> > >
> > >
> > > I just realised that there are two issues, one is perf, the other is
> > > kernel-devsrc. The compile.h issue is in kernel-devsrc and that did
> > > reproduce for my locally just now. I'm not sure what is wrong with
> > > perf...
> > >
> > > Cheers,
> > >
> > > Richard
> > >
> > >
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#176414): https://lists.openembedded.org/g/openemb=
edded-core/message/176414
> > > Mute This Topic: https://lists.openembedded.org/mt/96508797/1997914
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II


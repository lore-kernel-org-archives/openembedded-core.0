Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D7CC61DA3
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 18:06:55 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web10.81249.1674756413630061310
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 10:06:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gHww1id6;
 spf=pass (domain: gmail.com, ip: 209.85.166.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f182.google.com with SMTP id g15so1113921ild.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 10:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=msgHl0FftaqWQoXaTLkbEc9zoP/oxCcxiy6WtLJPPT8=;
        b=gHww1id6GJcQ5cgM5R25EPiMspwnfsR8ph+ExNHa28oCDSzi2Vh/BOtO2v4FIhc3Wu
         YMvNNV8ct8+E/lGoevJvPAXhMLe2Vksbrfk4rlzqIXzlGZorAVG/+dXrTdZ0csCgqbdV
         y1G6J7ZI+X7zqoGmtn1zQHsml3ZeklXHJHy6v07usINI5c+9envnmeIzeaB31+/gk/av
         9NUEpomj5KLM2AJdg13S1ZVhtZQHhUVhLgfeHD6PundZE+VvfECWiekSrIKYcOIrdmK2
         cP4a+EWW8k45LKYQJcgQ6zBVxUfVN2pSaaQfarszwtbxAB/pnkSzDE/+RIYjg6Tb7Ydr
         9fWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=msgHl0FftaqWQoXaTLkbEc9zoP/oxCcxiy6WtLJPPT8=;
        b=ULujjosHY+X2yzydl3vL1DTV4D+64idLMSe1MbMzAfVYb5LYxg65pEtV4hF19aZoGN
         a/i9j0qMHv+ZyqBsDgnl95X84zuhZZo4SAi1tf1MflLhpTncXoVrhr/fvr02TuCHp+vO
         jA50Ms+K7U9EiwNhHFoUX3pWVnWxcmI9y+HuWMmxgl9TXjdnUwqMtD77e/8gnB8gMl2B
         AzhMv3eW4icNnm3cJ1xA2qEBrHpf+5AQQt0LODDBYbBdMNxZ0bhSj+oAV7uU5MdJ0ydc
         Wu0WggampNqVvwILTCY4QkRWBrK5DIxyjeKvvz8woF+iZ/Oev/HsMU3DkjsG7IgfqLlf
         nICg==
X-Gm-Message-State: AFqh2kpS2tTB+iS4bWBqj0ebU4AqXxMKIQeC3UNOmvOxkKVV5BjLL1wv
	eXpXv0EuH7gTZ81g3ygAEI1InxpldMnJ3JBiwks=
X-Google-Smtp-Source: AMrXdXtf+VdL1k0xGtHFfJ+lzk33gdtLV+b/+L+Euxd6TW5Az7nwkhJKLZglDlK6cAGPv69Zf+4/ELCt5UNh8PJGlqA=
X-Received: by 2002:a92:7311:0:b0:30f:37f5:8520 with SMTP id
 o17-20020a927311000000b0030f37f58520mr3181755ilc.63.1674756412908; Thu, 26
 Jan 2023 10:06:52 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674597466.git.bruce.ashfield@gmail.com>
 <030b78056586e38cbaca26055da1af61a9786e0d.camel@linuxfoundation.org>
 <Y9Kol1jla2OQMzOa@mail.local> <a5a031e840a8af1b5c6f71c5747898ea420457e5.camel@linuxfoundation.org>
 <CADkTA4OBwOEc5ubqWb+zdk=ESv=eLXo1_X8hEfyX9o2GX4XcEg@mail.gmail.com>
 <7fe4aec8467d9300169904c6e43431057ce3c017.camel@linuxfoundation.org> <CAMKF1sr4-4b0SE01WjsJv7miHJ-W-8C90S8xphXkpK2BXndKpg@mail.gmail.com>
In-Reply-To: <CAMKF1sr4-4b0SE01WjsJv7miHJ-W-8C90S8xphXkpK2BXndKpg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 26 Jan 2023 13:06:41 -0500
Message-ID: <CADkTA4OrOCF190uUV+9Np7ZzwexONMo1B0XHbmhM41oi7fu02g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/2] kernel-yocto: drop 5.19 recipes and make
 6.1 default
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 18:06:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176418

On Thu, Jan 26, 2023 at 12:58 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> we need to define
>
> KBUILD_BUILD_USER=3D"yocto"
> KBUILD_BUILD_HOST=3D"yocto"
>
> in linux-yocto defconfigs
>

No, we really don't want to do that.

There's an environment variable that is supposed to be reflected in
the build. Which we already set.

If that has changed in 6.1, then I'll come up with a patch as required.

Bruce

> You can use my name too :)
>
> On Thu, Jan 26, 2023 at 9:34 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Thu, 2023-01-26 at 12:07 -0500, Bruce Ashfield wrote:
> > > On Thu, Jan 26, 2023 at 11:36 AM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >
> > > > On Thu, 2023-01-26 at 17:21 +0100, Alexandre Belloni wrote:
> > > > > On 26/01/2023 12:39:02+0000, Richard Purdie wrote:
> > > > > > On Tue, 2023-01-24 at 16:59 -0500, bruce.ashfield@gmail.com wro=
te:
> > > > > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > > > >
> > > > > > > Richard,
> > > > > > >
> > > > > > > As promised, here are the commits to switch us over to 6.1 as=
 the
> > > > > > > default.
> > > > > > >
> > > > > > > I'll also send a series for poky to bump things there as well=
.
> > > > > > >
> > > > > > > Also, if there are any significant problems, we'll just shelv=
e this
> > > > > > > while I look at any issues. But at this point, it is worth ge=
tting
> > > > > > > the patches out there to move the needle to 6.1
> > > > > >
> > > > > > Thanks!
> > > > > >
> > > > > > I think the issues are:
> > > > > >
> > > > > > a) two selftest failures:
> > > > > >
> > > > > >   oe-selftest -r devtool.DevtoolUpgradeTests.test_devtool_virtu=
al_kernel_modify
> > > > > >   oe-selftest -r efibootpartition.GenericEFITest.test_boot_efi
> > > > > >
> > > > > > b) meta-arm issues
> > > > > >
> > > > > > c) meta-virt issue (which you have a patch pending for in -next=
)
> > > > > >
> > > > >
> > > > > Unfortunately, I have to add
> > > > >
> > > > > d) perf reproducibility issues:
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/117/build=
s/2294/steps/13/logs/stdio
> > > >
> > > > Ahrrg.
> > > >
> > > > http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230126=
-poma_o8v/packages/diff-html/
> > > >
> > > >
> > > > /lib/modules/6.1.5-yocto-standard/build/include/generated/compile.h
> > > >
> > > > from
> > > >
> > > > #define=C2=B7LINUX_COMPILE_HOST=C2=BB      "alma8-ty-2.yocto.io
> > > >
> > > > to
> > > >
> > > > #define=C2=B7LINUX_COMPILE_HOST=C2=BB      "ubuntu2004-ty-1"
> > > >
> > > > Bruce: Any idea if we can set that to some specific value?
> > > >
> > > > We probably should start by fixing that and then see if that improv=
es
> > > > things...
> > >
> > > Interesting. In my local builds:
> > >
> > > #define LINUX_COMPILE_HOST      "oe-host"
> > >
> > > I'm building 6.1.7, but that shouldn't be the difference.
> > >
> > > The value comes from: classes-recipe/kernel.bbclass:export
> > > KBUILD_BUILD_HOST ?=3D "oe-host",
> > > and has been that way for a while.
> > >
> > > I'm also grepping for other BUILDPATHS references, but the QA test
> > > should have caught
> > > those if that was the issue.
> >
> >
> > I just realised that there are two issues, one is perf, the other is
> > kernel-devsrc. The compile.h issue is in kernel-devsrc and that did
> > reproduce for my locally just now. I'm not sure what is wrong with
> > perf...
> >
> > Cheers,
> >
> > Richard
> >
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#176414): https://lists.openembedded.org/g/openembed=
ded-core/message/176414
> > Mute This Topic: https://lists.openembedded.org/mt/96508797/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


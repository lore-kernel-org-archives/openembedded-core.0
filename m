Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10933C05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 17:58:45 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.81124.1674755920109350297
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 09:58:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CblAJBCu;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1442977d77dso3353595fac.6
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 09:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/SxOJB1nyYmAVJhvmLY/y7pR83uwTlRlG8MC6FNgaP0=;
        b=CblAJBCue7pzbShp8bT2Ma9CqtYYnkeM0hFkPYKdEtp/jI/bSrOauRgxIPpvAPSBir
         aExP4Hjn60SoDv6SrL9WZSNW5lT/n1LSn2qrjlWeXR/wtk8CsCVPyfojSAwDPDRKPwkx
         fpN1xbEgyaT7+WeZ91P+POwks23DpC2P5JEXx2beX6fZNpX3+e+wXz8I7OlUCJdb6sJW
         0xrvH4s0g8NNVCLU+FcO8qkizSl0DDCZggzZ3w8fiQJ3yOtzw/dByt4YL/6zsJkL4JYw
         5B4I47id6yRPbMDlqJ/+5HpWDPkeeXY5Wef2/LZdjeGCipB/53nUfgA9646h+3tobc9W
         YoGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/SxOJB1nyYmAVJhvmLY/y7pR83uwTlRlG8MC6FNgaP0=;
        b=HRbl8hTtzTkgp2po+IW5Es9C2xyosN73vRd8qn1MelJO3mztqat1RQ0dzft2EpVKcj
         AVNXwSu0RuyRm4xblQBbwT9kBM0m90KMN1pdujoZAu/sfnPBvK5Z3S1Wv+ZsUXnRT8Qm
         bVePIk+ChzQAmOjkHap08OAYMc+01OYQFgnI4bHInkYGc8JwgPLwIwVc8eUi7OiGrb9E
         tZ7lR0VRe0eHoLO/RnqhOPFm8zJbDM3rDVzKJn6BcU4f8gVif9JXk62zdzh04bFA2NlW
         DYsIk1bXjZSy2n+TDEKkenh78OlVOf2BYjHtKGnEy6i5LgWFS+WT1Yo4GNahL8brjLfm
         1vCw==
X-Gm-Message-State: AO0yUKWm1qeiezufww+jxrx7qT5yIT2IQnUGQCig4w+qF3hn1JimeeAo
	8DVezC9iXjL1d2VKPZ3z8MntxBG+t73eWLpKN2I=
X-Google-Smtp-Source: AK7set9kWB6hfKw1GQO7tn2hCasXN1P5LM9DYG/iWrBG3DCFW6pQw6ZyJfljaNCvbJtstzkfNywisPJ5mzLTiiG8LGc=
X-Received: by 2002:a05:6870:6488:b0:163:573b:3eca with SMTP id
 cz8-20020a056870648800b00163573b3ecamr191338oab.55.1674755919198; Thu, 26 Jan
 2023 09:58:39 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674597466.git.bruce.ashfield@gmail.com>
 <030b78056586e38cbaca26055da1af61a9786e0d.camel@linuxfoundation.org>
 <Y9Kol1jla2OQMzOa@mail.local> <a5a031e840a8af1b5c6f71c5747898ea420457e5.camel@linuxfoundation.org>
 <CADkTA4OBwOEc5ubqWb+zdk=ESv=eLXo1_X8hEfyX9o2GX4XcEg@mail.gmail.com> <7fe4aec8467d9300169904c6e43431057ce3c017.camel@linuxfoundation.org>
In-Reply-To: <7fe4aec8467d9300169904c6e43431057ce3c017.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Jan 2023 09:58:13 -0800
Message-ID: <CAMKF1sr4-4b0SE01WjsJv7miHJ-W-8C90S8xphXkpK2BXndKpg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/2] kernel-yocto: drop 5.19 recipes and make
 6.1 default
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 17:58:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176417

we need to define

KBUILD_BUILD_USER=3D"yocto"
KBUILD_BUILD_HOST=3D"yocto"

in linux-yocto defconfigs

You can use my name too :)

On Thu, Jan 26, 2023 at 9:34 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2023-01-26 at 12:07 -0500, Bruce Ashfield wrote:
> > On Thu, Jan 26, 2023 at 11:36 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Thu, 2023-01-26 at 17:21 +0100, Alexandre Belloni wrote:
> > > > On 26/01/2023 12:39:02+0000, Richard Purdie wrote:
> > > > > On Tue, 2023-01-24 at 16:59 -0500, bruce.ashfield@gmail.com wrote=
:
> > > > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > > >
> > > > > > Richard,
> > > > > >
> > > > > > As promised, here are the commits to switch us over to 6.1 as t=
he
> > > > > > default.
> > > > > >
> > > > > > I'll also send a series for poky to bump things there as well.
> > > > > >
> > > > > > Also, if there are any significant problems, we'll just shelve =
this
> > > > > > while I look at any issues. But at this point, it is worth gett=
ing
> > > > > > the patches out there to move the needle to 6.1
> > > > >
> > > > > Thanks!
> > > > >
> > > > > I think the issues are:
> > > > >
> > > > > a) two selftest failures:
> > > > >
> > > > >   oe-selftest -r devtool.DevtoolUpgradeTests.test_devtool_virtual=
_kernel_modify
> > > > >   oe-selftest -r efibootpartition.GenericEFITest.test_boot_efi
> > > > >
> > > > > b) meta-arm issues
> > > > >
> > > > > c) meta-virt issue (which you have a patch pending for in -next)
> > > > >
> > > >
> > > > Unfortunately, I have to add
> > > >
> > > > d) perf reproducibility issues:
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/=
2294/steps/13/logs/stdio
> > >
> > > Ahrrg.
> > >
> > > http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230126-p=
oma_o8v/packages/diff-html/
> > >
> > >
> > > /lib/modules/6.1.5-yocto-standard/build/include/generated/compile.h
> > >
> > > from
> > >
> > > #define=C2=B7LINUX_COMPILE_HOST=C2=BB      "alma8-ty-2.yocto.io
> > >
> > > to
> > >
> > > #define=C2=B7LINUX_COMPILE_HOST=C2=BB      "ubuntu2004-ty-1"
> > >
> > > Bruce: Any idea if we can set that to some specific value?
> > >
> > > We probably should start by fixing that and then see if that improves
> > > things...
> >
> > Interesting. In my local builds:
> >
> > #define LINUX_COMPILE_HOST      "oe-host"
> >
> > I'm building 6.1.7, but that shouldn't be the difference.
> >
> > The value comes from: classes-recipe/kernel.bbclass:export
> > KBUILD_BUILD_HOST ?=3D "oe-host",
> > and has been that way for a while.
> >
> > I'm also grepping for other BUILDPATHS references, but the QA test
> > should have caught
> > those if that was the issue.
>
>
> I just realised that there are two issues, one is perf, the other is
> kernel-devsrc. The compile.h issue is in kernel-devsrc and that did
> reproduce for my locally just now. I'm not sure what is wrong with
> perf...
>
> Cheers,
>
> Richard
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176414): https://lists.openembedded.org/g/openembedde=
d-core/message/176414
> Mute This Topic: https://lists.openembedded.org/mt/96508797/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


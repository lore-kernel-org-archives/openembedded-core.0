Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C54A1C05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 17:08:14 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web10.79419.1674752890287661394
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 09:08:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o/JaY8C9;
 spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id y69so830706iof.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 09:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50gQ8rNGJBXN8DroHmFBsJZnb2utXX2HIQTFWUmdU9M=;
        b=o/JaY8C9wAdJO/j34Q30DJ5+wMoatOTnWV7t4lliN0jp825MrvtMejYcLclIWsB0FV
         z0UxqglD0+1NizFI4jBsHD6y3sMS+QnbkD2fS6ajyT+1LuxAaiNcqengyPY45utVpi5a
         njOgXvE3n/yuK6clAbBvNEYbqJ8/JNkZEJatrVyzaUMG1l4123amavaXi3CyzoIBymdH
         DUwhIfotSALJB7VI7ckhooLxfoNTkYehLL/mEfey7SaTz0vS4RP7slRDzrka7mLZE2M4
         ozOIxjt71C+nXSCgalDBA8L2lURKpXYRkJ/Yr0iLJVtH5xL57LcIyv+JrjAP0zED4RVH
         dtbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=50gQ8rNGJBXN8DroHmFBsJZnb2utXX2HIQTFWUmdU9M=;
        b=fQRmJVEpau+KZpe5i9psNXBgmdNCQahnbkoEoFm/0CHfvaxs8gp8LMo397R3NkGZcm
         G/rK9tnonqIjMW8hjH8TbedVYQnIBjkB5Zi/EL7BtHrAvkbO3QWFSp1bLylfGra48432
         0xAaAwWTCIjVRKo6Q52e32i3PjyvLnRJIQQxHwyXXeP90/EcigwqapwFX4+ukGH4lvMI
         UXH1a9zRprtRmaZSbU5pua6GNDJA84bO0WyV/EHTW8/SpukDH79E36ACQxhAZbjGk5ZF
         lxuwhIxTiDtGggzXV1Jf1c5QJdp1POU+n0HZHm7hg63KErZgp438CLsHNYXpMkJbiIkp
         PLYg==
X-Gm-Message-State: AFqh2krWTUwlhRP4Y4kJ5k81eySvbJuec8UP0uVquZco0g2PJJhunz4N
	ruUJF966RoPotKjNZTczFNAysVaZa53wKL/byPU=
X-Google-Smtp-Source: AMrXdXsIMrw5vQdA0WS8kWZj3MMtkrdlr34gXQ0n0YgGU+kqcRH6OjJq9GjyT0yhLPMVoHf0zuAu56IW2Eyf1Vyo+VQ=
X-Received: by 2002:a02:cc96:0:b0:39e:5dc6:eba5 with SMTP id
 s22-20020a02cc96000000b0039e5dc6eba5mr4112487jap.115.1674752889455; Thu, 26
 Jan 2023 09:08:09 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674597466.git.bruce.ashfield@gmail.com>
 <030b78056586e38cbaca26055da1af61a9786e0d.camel@linuxfoundation.org>
 <Y9Kol1jla2OQMzOa@mail.local> <a5a031e840a8af1b5c6f71c5747898ea420457e5.camel@linuxfoundation.org>
In-Reply-To: <a5a031e840a8af1b5c6f71c5747898ea420457e5.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 26 Jan 2023 12:07:58 -0500
Message-ID: <CADkTA4OBwOEc5ubqWb+zdk=ESv=eLXo1_X8hEfyX9o2GX4XcEg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/2] kernel-yocto: drop 5.19 recipes and make
 6.1 default
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 17:08:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176410

On Thu, Jan 26, 2023 at 11:36 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2023-01-26 at 17:21 +0100, Alexandre Belloni wrote:
> > On 26/01/2023 12:39:02+0000, Richard Purdie wrote:
> > > On Tue, 2023-01-24 at 16:59 -0500, bruce.ashfield@gmail.com wrote:
> > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > >
> > > > Richard,
> > > >
> > > > As promised, here are the commits to switch us over to 6.1 as the
> > > > default.
> > > >
> > > > I'll also send a series for poky to bump things there as well.
> > > >
> > > > Also, if there are any significant problems, we'll just shelve this
> > > > while I look at any issues. But at this point, it is worth getting
> > > > the patches out there to move the needle to 6.1
> > >
> > > Thanks!
> > >
> > > I think the issues are:
> > >
> > > a) two selftest failures:
> > >
> > >   oe-selftest -r devtool.DevtoolUpgradeTests.test_devtool_virtual_ker=
nel_modify
> > >   oe-selftest -r efibootpartition.GenericEFITest.test_boot_efi
> > >
> > > b) meta-arm issues
> > >
> > > c) meta-virt issue (which you have a patch pending for in -next)
> > >
> >
> > Unfortunately, I have to add
> >
> > d) perf reproducibility issues:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/2294=
/steps/13/logs/stdio
>
> Ahrrg.
>
> http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230126-poma_=
o8v/packages/diff-html/
>
>
> /lib/modules/6.1.5-yocto-standard/build/include/generated/compile.h
>
> from
>
> #define=C2=B7LINUX_COMPILE_HOST=C2=BB      "alma8-ty-2.yocto.io
>
> to
>
> #define=C2=B7LINUX_COMPILE_HOST=C2=BB      "ubuntu2004-ty-1"
>
> Bruce: Any idea if we can set that to some specific value?
>
> We probably should start by fixing that and then see if that improves
> things...

Interesting. In my local builds:

#define LINUX_COMPILE_HOST      "oe-host"

I'm building 6.1.7, but that shouldn't be the difference.

The value comes from: classes-recipe/kernel.bbclass:export
KBUILD_BUILD_HOST ?=3D "oe-host",
and has been that way for a while.

I'm also grepping for other BUILDPATHS references, but the QA test
should have caught
those if that was the issue.

Bruce

>
> Cheers,
>
> Richard
>
>
>
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB0A7C52D11
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 16:58:04 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web10.79119.1674752283969071308
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 08:58:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b7bKg4SU;
 spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id h184so808507iof.9
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 08:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aylaMhNkoISDT49dPg/4rk2HFABlyjcaNyMxCIPWuDY=;
        b=b7bKg4SUtkS/Lgjv/XwpIFM5gaTrLMf/dC9PcHB37m6Nak5D0E5U59cJ8N0zrm0Bfc
         JbFpg5ADAfIf+b8GsRXytkmsU9rmIx0+/rDg7auMVAMxWw5H001BuFC/sY4Jd/S5uPbg
         53V+2rILE34+ZeMKDHyhpqqAVG6PElYSTOh1s/DKuTLm9EiB1lekF3C/6WSbNDRlAlXG
         ZESjbt9Btq9NyIZI5bgQUaQoAYhfHEVcF+sEqZcpPXW0Z8uTN1Cs/b8zkRXx3QZtd5Hj
         C2zRRQ2LdK3K8uTuPxslHYMf2NldIDNDn1k8k3fhZjFODJcd+SkOqf7pjJThnoNzFZir
         cKtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aylaMhNkoISDT49dPg/4rk2HFABlyjcaNyMxCIPWuDY=;
        b=5RXCzMA5R0ziZrp5NDkFWQTRFEHiy+RLNzWQQ0WVpaxfAGkEWwrMh20QN5A7t27SGa
         wAilvvBH42hRx9Pjm9We8xJE2leahCuogcqzCoqbFR5VJ6ktoMcbMXKoqMYNgxvjHmEf
         JP6b6d8yF/dBx6oYQwGpXimY1iJ35aFIEpySzPxNkGd3EydGxtU8h2ZAYrXwsjiRoNa/
         T96ld4JqxQ9pFR5yRo93lUKhmwtN3oT6iTy0X0moRgTP41xddiOCI3qENsZAiA0jzk+9
         y3J1NC7qd+RkC7JvXA1GdkD4l7UPeH2Vy/0B232z6vHuP+6ozTpfxhZKl9CIK+D+07GS
         vYMg==
X-Gm-Message-State: AFqh2krqiMsINJjlG+lW3nVHx1PJG4QLiC/24EqPgdK4JqcOFNpif1ST
	qK2SNcg7pbtLlMCh7YPNsWB9z0CXExfuJZAxuqM=
X-Google-Smtp-Source: AMrXdXuV6ntBSZA04hygCogQyO7WhTA5tXoaFtjS/2ZqsK760wnym9sHFTEcyORIKztSxDlADAZaCeYFHVhY0+ZvEmA=
X-Received: by 2002:a5e:8619:0:b0:704:c353:7f98 with SMTP id
 z25-20020a5e8619000000b00704c3537f98mr2919461ioj.61.1674752283285; Thu, 26
 Jan 2023 08:58:03 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674597466.git.bruce.ashfield@gmail.com>
 <030b78056586e38cbaca26055da1af61a9786e0d.camel@linuxfoundation.org>
 <Y9Kol1jla2OQMzOa@mail.local> <a5a031e840a8af1b5c6f71c5747898ea420457e5.camel@linuxfoundation.org>
In-Reply-To: <a5a031e840a8af1b5c6f71c5747898ea420457e5.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 26 Jan 2023 11:57:52 -0500
Message-ID: <CADkTA4Mb5t1Favh9Zkq3GX-9vh48DVVn_cHDrwx4Pt8DhQvxHA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/2] kernel-yocto: drop 5.19 recipes and make
 6.1 default
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 16:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176409

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

My perf build just finished and I was just starting to poke into it.

I'll have a look now.

Let me know if you come up with anything in the meantime, I'll do the same.

At the worst, I imagine we can sed the value to something consistent.

Bruce

> We probably should start by fixing that and then see if that improves
> things...
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


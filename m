Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAEF3C54E4A
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 14:01:51 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.12838.1709042505990958501
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 06:01:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=auuDfJtl;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-607eefeea90so41196607b3.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 06:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709042505; x=1709647305; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BG1H2mUmCzUhwGQp+at5x0/Cg8gN/I/MEyNxhOthSdc=;
        b=auuDfJtl6jlb1yJO2jLk/sTYI8MMt9QAggnfN6BtL4yGHH0CTC6CKOSqEGvfBhf1qb
         f7w43c11F4H8cQlH7Nf7xAJY3S/6AKPqWlN4xAryXxLIuWxmCJSWuX4ICzG4FTUAEy2G
         12zBDzESgl2IhUa/UtLwVQtcvI4ZZYsKExgRGQYxjmXoLQhwiIRoETdVeHRaQS5ZYo+V
         yLG8x3nxUQmQ7pA70GcCAhWS8jEkAvZV61hdsy/OBLkpOzpEw/JZj9SzJKBmsUaiZdCS
         jivTcH+V+sIip3PSZAWKh0MURpQtS8h/bLFAoDxsFWAYdavPZkag//s7uQcDeuSeGIRd
         Jyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709042505; x=1709647305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BG1H2mUmCzUhwGQp+at5x0/Cg8gN/I/MEyNxhOthSdc=;
        b=g87SiCGHUiDavbeKqqRMtOm9FXovJUpuQCuj1XvSbEQpdicEOpik+vHoi9wYLyfAaH
         sIDqbzTAfuoE8a+ln96J21824PBQHsh8++B+7UpXZ9hsFehZawsX/d0WX18R2HuTy6Zi
         AHu5ypd3fXCHsTg2offtVHpD5B6PhdS29+/2Z3T28zogFvhDtixArzQBOEiWsN+/y07T
         N0PDjP+dU7Mway1BrG1uti3rcvD9mIulo+pFOdaZmKvRS9lqCp+92X0N867rv6BKT14M
         6YTfFBmupWC8/IWBRshNh/pmJNnQskIqA/rqAT9Py8qmZunTg4Pf/axZ1zoV9ows5EdW
         fpfw==
X-Forwarded-Encrypted: i=1; AJvYcCU9TVP9DIuQ7tE3fXRwYNHOJsf5LAKS0TGtBwrsLtc++/2nRoSGBedDRyErFfypRT3YiqZ7ineehnACMnruL6m4qmUr04pIrmZfVCumTQ8jTLeMAsIUTNsI
X-Gm-Message-State: AOJu0YyCCC7e2Tl3FVIpVQj5kGoY+/uQUwreUt8t7LNM1mwXAYULXpmM
	wb5duSQ+W6eR7UfpZngCYHRpr2LPKL8Y9BNh8tjXvOZRU0AYhlXS21GCoZG6VfLXfFAjj71ATcS
	PRCWrpIULo+xK5YEECg42m92j77w=
X-Google-Smtp-Source: AGHT+IF929P46+hvy3yIxfNQ0uPU8pzxqc1E3aKBh+0THmjGw251EuD5k1dqhJN15s64y40eag8cSwoTg6uzdABC1c8=
X-Received: by 2002:a81:848e:0:b0:609:3726:42eb with SMTP id
 u136-20020a81848e000000b00609372642ebmr148529ywf.10.1709042505064; Tue, 27
 Feb 2024 06:01:45 -0800 (PST)
MIME-Version: 1.0
References: <20240227100709.1154-1-jose.quaresma@foundries.io>
 <17B7B05748A57C25.14830@lists.openembedded.org> <CANPvuRkPCgyBY43BH7S=azRCKum51NVk2ikQ4jwU9V6ezUQWGg@mail.gmail.com>
 <b6a799de1f0e8df4c117ce5dec0bd08243878e68.camel@linuxfoundation.org>
In-Reply-To: <b6a799de1f0e8df4c117ce5dec0bd08243878e68.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 27 Feb 2024 09:01:33 -0500
Message-ID: <CADkTA4M_C-83rQueM7L5FOemO6_D-dj066E28FHZp8Q8GQYUyw@mail.gmail.com>
Subject: Re: [OE-core] [RFC OE-core][PATCH 3/3] goarch: disable dynamic
 linking globally
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Jose Quaresma <quaresma.jose@gmail.com>, openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 14:01:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196272

On Tue, Feb 27, 2024 at 8:57=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2024-02-27 at 10:13 +0000, Jose Quaresma wrote:
> > Hi,
> >
> > I would like to ask if this patchset could be exercised in the
> > autobuilder?
> > I only got it working yesterday and today I'm going to do a more
> > exhaustive test.
> > This is still missing the update to 1.22, which I'll do later, but
> > testing this would be a good help.
>
> I did put this in for testing. The build is still running but so far
> there were two issues:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6466/st=
eps/14/logs/stdio
>
> from oe-selftest -r gotoolchain.oeGoToolchainSelfTest.test_go_dep_build
>
> and meta-clang:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/142/builds/39
>
> meta-virt did pass our testing but I've copied Bruce so he's aware of
> this and can comment. Copying Khem for meta-clang too.

I'm running into some golang issues linking with my latest updates to
meta-virt .

I'll apply these locally and see if they help, make things worse or have
no impact on my upcoming recipe bumps for m-virt.

Bruce


>
> Cheers,
>
> Richard



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


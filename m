Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01C9EC3DA59
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 20:41:23 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.2383.1721076075025239200
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 13:41:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MpEx6WqV;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: jpewhacker@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2eecd2c6432so66703871fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 13:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721076073; x=1721680873; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FJAasIkcincLFBrBebmnaA8q3faQeX4bWcaC5k5nZM=;
        b=MpEx6WqVfEjTclWedcYCwtF34g8z8dAWX20d09Curtl85kJQpJtmBDP/LSS/cjPWBe
         IwzVPc7AS6uJQT17BSnUvzoDyy8T13eE6NdXdQU+XZDi+zYQYShFgB8a+TLmE9G9W1vX
         LOYHjkwZNN5s7gydl0Niopb8f/FWrixXroncVcAORADLiai40TxK+2NPIGoLGgDPQ9/V
         78aqfIDyiW3hE+Ypl8ikyCSUbrqSvTWZIOWvI6FZ7+aIbrky93FxMPedWcWsXGPUu3Y0
         r8OXZ7sONXSIGryfRfKb61o6E87i333Zq6ZVkrO5+XKgbDrF62U2kK+rYy8nc0l4eNtL
         VA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721076073; x=1721680873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8FJAasIkcincLFBrBebmnaA8q3faQeX4bWcaC5k5nZM=;
        b=ormocMorxLtafOlq793fPlKURt3tiCMAJiLejIAPL8+KQp2ocs0JHitrY4N81N4285
         w7S+snSmqK3VCLpVaowpps7AkwjSrO5+6zSDEDPOlIgCifJA9otAofmPt4lFS4qyu78j
         8aDwmmybOP/LI5A9QmFGve5AlNjTZK2zlzhpNTKiomrnCTtDeA4KhwJRzDNI3o3JRtCn
         QQt73BTJ0Y7E7uQndoAwJGYnOmIIHToUKc122BdQIg7cdiTOM0NALfXR3a/6ZqAOG+Ik
         V3qvqC4xh+ocbdXkP24nOR4OZt7B2rB3wq/Axh7B7I+kcWQZm3nkosNGe4kmeiEQR3iG
         aI4w==
X-Gm-Message-State: AOJu0YyjSO4fbUQmWM+s0mI54JmXFCugueRw6ZLKZrQcwddJl7Cy81AS
	1z3OPiEebwinIoYZVZEnc6Prg+zGuopLBgAA6YUksQy7lXwLsiWc7rDp07xI1NuK6YLi7rq3oOi
	KklwUdzb/Ivw+bL2zcbiIOVR8Y6I=
X-Google-Smtp-Source: AGHT+IG6d1hca0xeFfqAakpnLCEKe2NmEdjKL9phgNzjix+mK9E8YwONruxawE/fGbElH2naUH0a9wMWd+CtWgAMwLc=
X-Received: by 2002:a2e:93c9:0:b0:2ec:4d8a:785a with SMTP id
 38308e7fff4ca-2eef4156db0mr1683961fa.4.1721076072781; Mon, 15 Jul 2024
 13:41:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240703140059.4096394-1-JPEWhacker@gmail.com>
 <20240712160304.3514496-1-JPEWhacker@gmail.com> <54c574fdb35ef25b71baaf1e1adfa8bd909a5f39.camel@linuxfoundation.org>
In-Reply-To: <54c574fdb35ef25b71baaf1e1adfa8bd909a5f39.camel@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 15 Jul 2024 14:40:59 -0600
Message-ID: <CAJdd5GaA4tByvK04pNycoApWYHeznYVe=y1ckSWsUVu=jwmjnQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v6 00/12] Add SPDX 3.0 support
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 20:41:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202069

On Sat, Jul 13, 2024 at 12:44=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2024-07-12 at 09:58 -0600, Joshua Watt via
> lists.openembedded.org wrote:
> > This patch series add support for SPDX 3.0 and sets it as the
> > default.
> > Currently it is not possible to have SPDX 2.2 and SPDX 3.0 enabled at
> > the same time
> >
> > v2: Added tests and addressed feedback
> > v3: Fixed several oe-selftest and build failures
> > v4: Fixed silly typo mistake in staging.bbclass
> > v5: Reworked to make SPDX 3 output reproducible by default. Variables
> >     that introduce non-reproducible output are documented as such.
> > v6: Many changes:
> >   * Fixed bug where building baremetal images would break SPDX 2.2
> >   * Most SPDX code is now in python library files instead of tasks
> >   * Removed dependency on pacakge_write_* tasks
> >   * Fixed sstate selftest cases to account for SPDX 3.0 task names
>
> This had a lot of failures in testing I'm afraid:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7134

This appears to be caused because the SPDX tasks are not running for
some recipes (e.g. automake). It looks like this like:

  do_create_rootfs_spdx[recrdeptask] +=3D "do_create_spdx do_create_package=
_spdx"

is not actually strong enough to make sure the SPDX tasks for automake
run for e.g. core-image-sato-sdk, but I don't know why. I'll keep
looking, but if anyone happens to know off the top of their head let
me know

>
> Cheers,
>
> Richard


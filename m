Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00C99C10F1A
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 20:37:46 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web11.96.1715114260382582424
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 May 2024 13:37:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DyC39PHt;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6f08df79b9bso920466a34.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 13:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715114259; x=1715719059; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zpM06R3ythm768Dht4ClkRG7H2y3Vj+t5ZAI38FU258=;
        b=DyC39PHtMjnF5JFNWibNZrJ3RY8p2Xxc4qdbWUX+UiuSxYggApS2pFgsbx5vbnI7QG
         079DCojp8IPAsaA8wbYtBKtk0pPt6426HvswjXt9zn7QgzugQGWqXMNMD059SLtASPXO
         qF1f1vr7UyslOLAp5LeIxIyZFDxR/EScuPdhbr1txkPCWCFXdJdOicGL2vC8YdErTn4T
         i59ti4QbiQeWm+ijkv2rTvNVt6/3lwYUleQDjqOU1IAH8XthBEe129w2zru+ZJoHCNCF
         shczeVYWm7pRaEviNcK9fMx/NC56QJTi1GJPxTcN8q5tvzjvZwkL08YG8pVDsT6/KnRu
         Sqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715114259; x=1715719059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zpM06R3ythm768Dht4ClkRG7H2y3Vj+t5ZAI38FU258=;
        b=jUGad5uH5AKJWSXRwbcnR2od7cupizsZFmDruROwaa++zPs68/NajwxGYdLCKuYEGA
         YVu5W5OtWw/tUevjY4WLFyzaz1NFCbN5Rf4y9kCkVHYt/W/xfdIrpClFTSyNUQddbKSG
         /lFUpZ80qoVMl/WLTcb1zeIzx9IzYJoFsDhWqs2xw/VqvY+wjBKuYjzSJb9xXR/rb/MV
         4qFThQ5X4RZjw4RcDETbhegpqpiEnssZV3Ne34seH+S7hKKK++Fw65+phwN2zjsOv7V0
         FAfbFBx8q5QrEaw1mo/D9Ti1VFuLYXiw4d1YYvCmBEWeUHCdHEIJ5zb46ckXQFVUWz9i
         RX8A==
X-Gm-Message-State: AOJu0Yyy4zu2EX4WfmEJrVWQ+RW/jPJI/l3lnd+gQySn5fdEvXGRgwy+
	BJ5VvkMN+uaiSDZGlwkYDcsCrx5gUWGc7NNQt1naQuZ7d0vYAJ0oZnxQYzd6X8YNJwoXMIXQLxN
	e0B8VqjsTW5jokFRbUeQtp0BANQs=
X-Google-Smtp-Source: AGHT+IGTVm2WpnZBClFhI42L1jJJTBbmDUrB3YiWt5dNaeyMMgg/1cWruSF2NYC8CiHLPWtr6U4XzUrJAhoD24i7Hf8=
X-Received: by 2002:a05:6870:a113:b0:23b:f2d0:7b9c with SMTP id
 586e51a60fabf-24097c704admr847143fac.24.1715114259453; Tue, 07 May 2024
 13:37:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240507053320.1566814-1-raj.khem@gmail.com> <20240507053320.1566814-7-raj.khem@gmail.com>
 <CANNYZj_w95u_j3XTgAMzHJ3_dYKyBzqL4tj6V3pS=sAXFjyP_g@mail.gmail.com>
 <CAMKF1soraS1+kfj9jkSqOo6LiaZnOOqzj9PimZXssfDu0kuHqw@mail.gmail.com> <CANNYZj_dZEQgVtihxZ-PtiBHBB44OqMF7ebLKQTEg7Bt+rrJCw@mail.gmail.com>
In-Reply-To: <CANNYZj_dZEQgVtihxZ-PtiBHBB44OqMF7ebLKQTEg7Bt+rrJCw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 May 2024 13:37:13 -0700
Message-ID: <CAMKF1sqc3Bk5CRjnzmMyw3T0C7J1wW-h0P70BE8Bj3uTrm2MTg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 07/11] kea: Remove -fvisibility-inlines-hidden
 from C++ flags
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Martin Jansa <martin.jansa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 20:37:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199106

On Tue, May 7, 2024 at 12:56=E2=80=AFPM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Tue, 7 May 2024 at 18:13, Khem Raj <raj.khem@gmail.com> wrote:
> > Firstly I am inclined towards removing it if we can, since I think it s=
hould be
> > packages to decide to use it, then they can maintain it better from tes=
ting POV,
> > However, there is something
> > to consider w.r.t. to this option. This does help in optimizing loading=
 DSOs
> > by reducing the number of PLTs and improves loading time for DSOs which=
 might
> > be quite meaningful for embedded devices that we target. However, we on=
ly
> > enable hidden visibility only for inlines so it won't be full benefits =
but we do
> > have better default compatibility.
> >
> > Since we have had this option for a long time and it still seems
> > relevant, I would
> > think it would make sense to do some benchmarking on a sizeable C++ pro=
gram
> > perhaps chromium or webkit, and see the difference in DSOs sizes with
> > and without
> > this option and also benchmark the loading time of the resulting
> > chromium package.
> >
> > maybe we will find that the gains are not as significant, in that case
> > we might drop
> > it from defaults.
>
> I digged deeper and this is where I think it originated:
> https://git.openembedded.org/openembedded/commit/?id=3Dddd6d1fd26416a3766=
d754eeda4237a680a65520
>
> Ah the simpler times of oe-classic, when one could bundle four
> unrelated changes into one commit and explain none of them.
>
> Benchmarking I have no time for right now, just wanted to point out
> that adding the flag was never justified in commit log. Can you
> experiment with webkit?
>

Yes, I have added it to my backlog.

> Alex


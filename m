Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67733C83F1A
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 15:55:14 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web11.44837.1753113313448431703
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 08:55:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KhdJMa8m;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e8d96ff2dfaso1428346276.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 08:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753113312; x=1753718112; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=swpv2fsMzLnYw8M7VtEnmYAkoRasD2qRg8W4bKM3a1o=;
        b=KhdJMa8mvJ5JZkvtpX7L51o92oK6N3YMuUi53QTmXPwcxBXPXuL5//KPS1T9zVkqKN
         VNKYhJ6TbZ91LYH6Vc4nJYz33nu8Pc+K8mPRm7PMGvOlqFRGbUf2x7l+I2CH8LIA/j3n
         zV4ETbCo/qPGXDfzNq3tmkfvkxqrs+gfzlQH+z9jAhqrerhAll3DimU6vZqJYrWuTQN/
         yjWWZXZKVV5ytX6Klt2/p5RTO283ni500qJcT51mq6+je2lxCxl8wJ9LzWroI3qD/6bg
         s2r8RIxdckPMai7zGD8+zqbUwdq3hqGMxO0lgygvzUosVVOpK3HbB34AYMk8GZe3yaaI
         ObJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753113312; x=1753718112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=swpv2fsMzLnYw8M7VtEnmYAkoRasD2qRg8W4bKM3a1o=;
        b=F1iA14B3NpOwSNvohmWQym9dByRDsCBdNsbzv9rGL5r28kvFIbDyrkAeMk7XSqDS5B
         zhTRr6s/qwqdkP4YZxKJPlrTcCWa+29Tfz/W217z/tO9xQ4pb5B1cyasy74TGKtnUFAK
         m5lO4kBynR4nvyVlSL7TgvvDKb6rhIqXHAyurM/bJ/cvOpwfsmnw+mCrFRRIVh0WBcIz
         DcXL2iQ1jLptPA2IMJQ1QhzQJPU0SjumP0gREtDqAFPNO3V4w/WukKsIjRrxkbnt+2bb
         y4k1sjxQn+f3u5r9m0IgICdFKxBE9Sa2KlFtd52Cyvc9FrZp/jhTs0lKJNdDR2SHJ9XQ
         vvSg==
X-Gm-Message-State: AOJu0Yx+IXobgY0L3tC+TTH5geXx/r6GJJxcwNFQ4fY4J+StEf9oJoPs
	jKh3COyAPMd5UjSsnCJ4nlraNcSh7dX6ZFsJWzhkHZ6kRpBxnB1kP7Vc8rnnoP6WUgb5jQUpKVT
	HxD0uZnosRl+Dd08KH/RIzarPiDJFY64=
X-Gm-Gg: ASbGncu3SOH5y9cK+UkJR3/7OlUV10DP5K5XeY9Rknhd1f0StRa7xaxZiGOjoo7ODti
	SzLrnvbiFp06tNjR4ztoGBMo/zpJ8xDZw2PRlzHwM5O6lhH9vRh9qAxG/EZq6iA/PTt8KYzNkvT
	Nu5zXbHnGIcr2t6mktjd63I18jHbkw69Iz4Iu8te8bS9DvJZcOhW5haWH7CPynq8i5m6tsw3V99
	dSU9lI=
X-Google-Smtp-Source: AGHT+IFljXXdTOS8GroT2bH5nISoiHTn1gJ5H9Gg2RIERW4dW3IIrksXeB9hC1aqXDuJqjofRdc0E5AWWqRhikFat6Y=
X-Received: by 2002:a05:690c:ecd:b0:719:635b:a037 with SMTP id
 00721157ae682-719635ba0f1mr118619047b3.21.1753113312333; Mon, 21 Jul 2025
 08:55:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250721054721.261911-1-raj.khem@gmail.com> <fdee61be-8ea3-46df-8292-c912727ec087@cherry.de>
In-Reply-To: <fdee61be-8ea3-46df-8292-c912727ec087@cherry.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 Jul 2025 08:54:46 -0700
X-Gm-Features: Ac12FXzYSq9Ikgen6zvNWNFe2z-moifflh8DZnSKYoF5_ln1jwchfSBydSXSa8E
Message-ID: <CAMKF1spmS_dOHnE4x=1tZ7R0qzqThGsmeQnuA-5JHijDiVDR5g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] tune-cortexa53,tune-cortexa72: Add +nocrypto to -mcpu
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 15:55:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220702

On Mon, Jul 21, 2025 at 1:25=E2=80=AFAM Quentin Schulz <quentin.schulz@cher=
ry.de> wrote:
>
> Hi Khem,
>
> On 7/21/25 7:47 AM, Khem Raj via lists.openembedded.org wrote:
> > When crypto is not in tune features then add +nocryto to
> > -mcpu explicitly. This makes the behavior between clang
> > and gcc match. Currently -mcpu=3Dcortex-a72 has different
> > behavior in clang and gcc in terms of what features are
> > considered default. Clang's philosophy to enable common
> > features but maximally, gcc on other hand takes minimal.
> > Clang therefore enables crypto with default set but gcc
> > does not. crypto is optional on cortext-a53 and cortex-a72
> > while, this is not as common but Broadcom SOCs in
> > raspberrypi3/4 have dropped crypto for cost reasons [1]
> > This results in illegal instruction traps [2] [3] when building
> > components e.g. chromium, qtwebengine, weston etc
> > with clang using -mcpu=3Dcortex-a72 for rpi4 target.
> >
> > Adding +nocrypto makes it behave like gcc does today. We
> > do have separate tune if crypto enabled cortex-a72 cores
> > are to be targeted (cortexa72-cryto) as DEFAULTTUNE
> >
> > [1] https://forums.raspberrypi.com/viewtopic.php?f=3D63&t=3D207888#p133=
2960
> > [2] https://github.com/llvm/llvm-project/issues/85699
> > [3] https://github.com/llvm/llvm-project/issues/90365
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >   meta/conf/machine/include/arm/armv8a/tune-cortexa53.inc | 2 ++
> >   meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc | 2 ++
> >   2 files changed, 4 insertions(+)
> >
> > diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa53.inc b/=
meta/conf/machine/include/arm/armv8a/tune-cortexa53.inc
> > index a88575eb156..65fd6333198 100644
> > --- a/meta/conf/machine/include/arm/armv8a/tune-cortexa53.inc
> > +++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa53.inc
> > @@ -2,6 +2,8 @@ DEFAULTTUNE ?=3D "cortexa53"
> >
> >   TUNEVALID[cortexa53] =3D "Enable Cortex-A53 specific processor optimi=
zations"
> >   TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'cortexa53', =
' -mcpu=3Dcortex-a53', '', d)}"
> > +# See  https://github.com/llvm/llvm-project/issues/85699
> > +TUNE_CCARGS_MARCH_OPTS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'cr=
ypto', '', '+nocrypto', d)}"
> >
> >   require conf/machine/include/arm/arch-armv8a.inc
> >
> > diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc b/=
meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
> > index cbb6418c069..cf09db00664 100644
> > --- a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
> > +++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
> > @@ -2,6 +2,8 @@ DEFAULTTUNE ?=3D "cortexa72"
> >
> >   TUNEVALID[cortexa72] =3D "Enable Cortex-A72 specific processor optimi=
zations"
> >   TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'cortexa72', =
' -mcpu=3Dcortex-a72', '', d)}"
> > +# See  https://github.com/llvm/llvm-project/issues/85699
> > +TUNE_CCARGS_MARCH_OPTS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'cr=
ypto', '', '+nocrypto', d)}"
> >
>
> I'm very unfamiliar with the tuning part of the machine configuration
> files, but isn't that something we could add in
>
> meta/conf/machine/include/arm/feature-arm-crypto.inc
>
> in the counterpart of +crypto?
>
> I'm just a bit confused by the decision to only touch cortex a53 and a72
> tuning files? Reading the DTs and the commit log it seems those are the
> cores in the RPi 3 and 4 which do not have crypto, but I assume this
> would be applicable to any SoC without the crypto block anyway no? So
> should be generic instead?

Yes we could and I think its a better way as well. I was just focussed on r=
pi
but there might be more implementations of these cortex cpus without crypto
will send a v2.

Are you aware of the RPi5 having done the
> same cost-cutting measure? It's sporting a76 cores so maybe we need to
> do something with that too?

pi5 uses BCM2712 SoC which has Armv8 crypto extensions

>
> Cheers,
> Quentin


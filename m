Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5798C04FCC
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 18:04:48 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.2585.1695233081018420324
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 11:04:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=DYdFmOmF;
 spf=pass (domain: baylibre.com, ip: 209.85.208.171, mailfrom: jstephan@baylibre.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2b703a0453fso1018711fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 11:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695233079; x=1695837879; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H4lggiWIM8SFuthejfNlxLD7xTofZXjIAn1soeIKFus=;
        b=DYdFmOmF+hoT9jBtxDsJpf++F0TiK83Sc8zb48jXw6wV19mBtiQAEcDZmgmD9lE0Di
         DdAeN4tnHK/X4JAcsJYh3y4Ab1hygA/3Eor6OcQEj/ZWdaLvmNqmqpMoN2sQ93BzN5m7
         Z02/juddJrE4xPTYbz/13Sv8GlTdccACCZ4siHPVSx/W1H0A+KiCfNDu1naN8dKS4Ca3
         fgui17IQbBzoGHnnuWMHeJkFuX2/P4NHTtbQETPnX1G3AcD1cjMYD0n6gPBLWcsc/D9c
         N4Svc3yIEvHzSQc9vRwyO1TJGtlYCoaaFkjY5HliGxoG2rCxGoidJGaNCl666XGotTlq
         taxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695233079; x=1695837879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H4lggiWIM8SFuthejfNlxLD7xTofZXjIAn1soeIKFus=;
        b=MgPXClvzx52804fZ0BDhYeycRWLlaFPW4bojQPjc6SbctBXu17x/hkAXUBuS4ANT4f
         KgrKA7ykCyL6iSlD+GLWyQshzZW+ZLUzG9+qIYc9x2lGUtCVZ8Y8Ru0+5yyrbsiVVtB2
         9s3HqzELCT83cj8XjsCVFt866QpTWrsFIlqwOxbIp8xGmijJ+a0ysP6uFFvpM7az0GVT
         Xiny4BtXT6SClOUKwrbsiSdRZoIya8wClIMRqLZuL7Plri9yVxqArG97TGNHESLO0i9P
         JbzWgWbZO41KQxWz6WixfDiwmGoE5xNOw1dY76hQAsoGkx1/mgVgkD+HZpPyAEoQvXee
         hzmQ==
X-Gm-Message-State: AOJu0YwW4tzmRcKDH+EVBLZwSvWkrKiOU+8GcuBTA6cA7fAQ9ji2D5F4
	LG2zM4oTvpAtaLpGXLXu0SpEOfz0cyZFEp8xf/B4Wg==
X-Google-Smtp-Source: AGHT+IFaZWKRntl4G+DQgA0boF9S7Hz2WJE6OpJbNu+likyYDxuqcYvIAYkDdM8EfpYc22Ta2f2OWoxYjWwhTWQ/ME8=
X-Received: by 2002:a2e:8959:0:b0:2bc:e2bc:81ff with SMTP id
 b25-20020a2e8959000000b002bce2bc81ffmr2921723ljk.51.1695233079134; Wed, 20
 Sep 2023 11:04:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAK5yBb9gO+WOJrv4TArzXK_1Bxu5AORp2oi=P-v=2nn6PgJE5Q@mail.gmail.com>
 <CANNYZj9QpstUj_A8Vb2RbiaFGZkHkFjHkUfF=E1HR-nDJ_Vk6w@mail.gmail.com>
 <81f4c191fe6dead1feec6bfc0d36aa328af1f7d4.camel@linuxfoundation.org>
 <CANNYZj_uSknujoQUK2yV7U4N+WW_RkUH=sJnFDBfZgV0G5fv7Q@mail.gmail.com>
 <5ef99df95ab74e74df6f1e07ef4877487230d9fe.camel@linuxfoundation.org>
 <CANNYZj9mekKZwHs839m3r8sYbTiTLPaqzP=8C_-9=4w6MiJTaA@mail.gmail.com>
 <CAEHHSvbb9O_5zOBWvae+sCCouW+RyjMY+J8wOdtx2jixwFqN5A@mail.gmail.com> <CANNYZj_7zmvsZ1fJHoxkN-YgspaTD6Cei1qp-TS5Axw2D-0HLA@mail.gmail.com>
In-Reply-To: <CANNYZj_7zmvsZ1fJHoxkN-YgspaTD6Cei1qp-TS5Axw2D-0HLA@mail.gmail.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Wed, 20 Sep 2023 20:04:25 +0200
Message-ID: <CAEHHSvZpdsY+ZBVnT8yYCy_AwimHUE3ii03m2qgZtGpZr6ynXw@mail.gmail.com>
Subject: Re: Core workflow: sstate for all, bblock/bbunlock, tools for why is
 sstate not being reused?
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: ",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Michael Halstead <mhalstead@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 18:04:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187937

Unless I missed something, I think I fixed all comments from RP on the
branch I force pushed :)

Cheers
Julien

Le mer. 20 sept. 2023 =C3=A0 16:31, Alexander Kanavin
<alex.kanavin@gmail.com> a =C3=A9crit :
>
> That=E2=80=99s great to hear! When you have a new patch set please post i=
t here. I think there=E2=80=99s also a new reply from RP that you need to c=
onsider.
>
> Alex
>
> On Wed 20. Sep 2023 at 16.25, Julien Stephan <jstephan@baylibre.com> wrot=
e:
>>
>> Hi Alexander,
>> About bblock tool: I just force pushed my branch on poky-contrib
>> (https://git.yoctoproject.org/poky-contrib/log/?h=3Djstephan/bblock),
>> trying to fix an autobuilder issue reported by Alexandre Belloni.
>> I am still working on this, and I would be very happy to get this merged=
 :)
>>
>> Cheers
>> Julien
>>
>> Le ven. 15 sept. 2023 =C3=A0 10:28, Alexander Kanavin
>> <alex.kanavin@gmail.com> a =C3=A9crit :
>> >
>> > On Thu, 14 Sept 2023 at 21:54, Richard Purdie
>> > <richard.purdie@linuxfoundation.org> wrote:
>> >
>> > > Effectively those "configs" are what the eSDK is, you're just propos=
ing
>> > > a server side set of them rather than a built copy. In many ways tha=
t
>> > > could be useful way of possibly rethinking the way the eSDK works.
>> > >
>> > > So in that sense I like the idea, we should just be clear the proble=
m
>> > > it solves as it doesn't solve the "why is my build not using the cac=
he"
>> > > question specifically but it potentially solves other issues.
>> >
>> > Right, I didn't make it clear that this idea is not about 'why sstate
>> > is not being reused', but rather something I thought of to avoid
>> > placing people in that situation to begin with - offering them
>> > 'pre-fabricated builds' with guaranteed sstate availability. I have a
>> > hunch there'll be plenty, for whom this is just fine, and eventually
>> > this could be the basis of that oe-setup holy grail :)
>> >
>> > I'll start with the simplest enhancement of printing what would be
>> > rebuilt. There's a lot of code I need to understand, so this needs to
>> > be in manageable chunks :)
>> >
>> > Alex


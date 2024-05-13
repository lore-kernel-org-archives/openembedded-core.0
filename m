Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AB65C25B10
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 14:42:20 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.62287.1715611334127804850
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 May 2024 07:42:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gOXkOp4o;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2dfb4ea2bbfso51768501fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 07:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715611332; x=1716216132; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLTFFoI+O3ZHwUfaMBNoQ1NXuoC7LGXOJz99eC1ja7A=;
        b=gOXkOp4oAia6WLIJCanP/EnZF7ihb6aw2YvTnsxwIoE+kxsOoeycjHmObR50LTfM2j
         kS/FlW47IjJ2Ghi7RMYLF44iTgnbqyfrPHTRfZZX2itheld3/Iml0DTamwqQPMfrlwwj
         Em5BmtMdrpa8p7J/PpDVoWvg5lvTFJwBmH2eaRlL3cHB5GwHYpDiaUXeXFZiZszPD+is
         ZlFkV1CHZtg5knd+Yk8P/LwcYf9XojYkCckhs1r3YZJ29+TXURSaJuu7r5+I1oGGqY1Q
         9r0rPXVSHLfDXLzPNDpZso/IM3AtDGnUPIr2DNYJmgk8YWvwv+ek6XEc6Hm6jnwUuExi
         m6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715611332; x=1716216132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WLTFFoI+O3ZHwUfaMBNoQ1NXuoC7LGXOJz99eC1ja7A=;
        b=Frb6rzVQv0wTl1tqj8gC6mNom5ax73UxKIuvrjoyzdPwO38ODQm1sAiPkiMU1+WxLd
         hj1FBea5ClX3RA9CiDinkotUHd15OKgP6s7DJWgePXjzWNEkcWsNuWdLk/nevzFFKASo
         3t8NOyhlrHiMpbCtwdx6/ekEmeVpaUF3k248BEukSJx570gZV37ey00mybOOrsIFIIlP
         88i+9XxG6J3y9ueGWg7t51nZ6jd3PsVubcVstGjIFOrFqSYsvRAeiEi641359ygRzl6R
         cb/0s3L+UDnoKqmbD5i+6PZuMMMoJz1dqPaoWlchBO8TSADZ/GiOXILZ9FJ4W0sHrIUC
         crsQ==
X-Gm-Message-State: AOJu0YzljN6BL4lR2fpNPX0luubz39miZN/YxIjSL0qks5csGv/hV7Zo
	3KudnrarfCBs/WPMxMX86RdLh1QgvyySsVZQ8rBRMgl6ji/2qXC2W8lhAruEIBYEymC11uNPt0m
	c4MWfi+Hg0pabmoVJyLeqfDg8zC8=
X-Google-Smtp-Source: AGHT+IGxrWRtXf60MDwucRo3xO0hkDpN6sl8CfJ5LQIt1Gn8ekNiznj7+6hqJK9m6dWtsdsQepN94DOGTv5Ct4uoZ64=
X-Received: by 2002:a2e:8ec4:0:b0:2dd:97e:3481 with SMTP id
 38308e7fff4ca-2e5205f6f3amr59170331fa.51.1715611332068; Mon, 13 May 2024
 07:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240502103252.1102710-1-alex.kanavin@gmail.com> <1d0d45e7-b12b-4f9f-be5f-89b85b9d0b41@gmail.com>
In-Reply-To: <1d0d45e7-b12b-4f9f-be5f-89b85b9d0b41@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 May 2024 16:42:00 +0200
Message-ID: <CANNYZj_M1e+wAbvyvn5dAfxmKrzcrC3tX2TcWNum5CqmJ0Hruw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] glib/gobject-introspection: update 2.78.4 ->
 2.80.0, 1.78.1 -> 1.80.0
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 14:42:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199241

On Mon, 13 May 2024 at 16:28, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbosz=
or@gmail.com> wrote:

> >   BBCLASSEXTEND =3D "native"
>
> This needs to be BBCLASSEXTEND =3D "native nativesdk" to match glib.inc. =
An image build may
> contain this dependency chain now: nativesdk-glib-2.0 -> nativesdk-gobjec=
t-introspection
> -> nativesdk-glib-2.0-initial

That chain happens only when gobject-introspection-data is in distro
features, and that is only present for target builds, not native or
nativesdk.

Alex


Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EC28C02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 09:35:28 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.84159.1738575319621896285
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 01:35:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=legW50kD;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54024aa9febso4178934e87.1
        for <Openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 01:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738575317; x=1739180117; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQkIpmvXVB3Mu597gGe0IFaJDLsqofyUGS+zS4tYPks=;
        b=legW50kD00greqimlfp4p6vsgnAzNecuK3yW0tjcZ4D7xTF8Kl3Ol1lV6+geQ3mkc5
         VQVvw9xZoXJSXxsVExwHYLLiJGOLqKhtfjBL6mYUCncR8HjOd0wRLdoeQSnp4DshQE7z
         z6V4L0GqZf/3FybM/dMyGkYc904jlgp1waw8V/J80W6TQwcWVM2bkLuIfVtV/2CRO6ff
         RA5dBC9YfHozlc/i6RH1OhiYS6gA1xoFYqs98vw1h8gdLeUQrrKsyJqpsuDVGndWnQTz
         80IqKQv2w/1VlEPyiRhxvZjbiXkDjO5WxPtz+2D1la52gCjjXn+dw9B2ECVlvac/XASF
         6Ftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738575317; x=1739180117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQkIpmvXVB3Mu597gGe0IFaJDLsqofyUGS+zS4tYPks=;
        b=UehE1kH8x6gsBUmw6+mVKLiWMTOVd5N2GQm5vczlwgs2ZdRbu354jLQ5Lv5kGYiHhU
         zuk0FKe8f7DxDWqhFu1OsSPpTjf00Q+zM5u3chLrX313uZ/ALiFUCPbEA/f56cPuMUOM
         fWrkt/8giTziVE3192CxofeCt2aZMtvl0TaF2rjHSShBEO1g8pNkXiDJFj2HSuYd95LW
         giwJHMO+Re3kts4ZZy3WMHI0cwwEEiD9m5GzyzHbeQ7Fvvy/cOrqNlgIPDdDtMqxPuTN
         I2U85SanKXt0xDFn8XCZbOsYe7FYd/6l2L7naHstcF3r87EX/WrKn8mWYJTN9yal1l1B
         rF3A==
X-Forwarded-Encrypted: i=1; AJvYcCWM3p4Kycof26ZoVDDyykkwe0dUnkqQvRj2CcUzJki5t32021Saf3tsYV1sazBk0g+99R9HsaqeM1HwENyA+QT2bw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxCzqoY32Ew0qFK35hTF8mkcbATwzcwZMK0KmgV2id2yo2p3IjG
	+rrpy01AqXtqbDHJYQvtAOhSY6IF1uJGoQ/O9hhP6udz5uKb/4r060Gl4ndb1j4MFfnodTAioaL
	sC2ciAiYsjZ4cESEgEnAaKWlMiuEWvg==
X-Gm-Gg: ASbGncu+CWbcubPi4xM8VtqTXb3Ok0lAzmLi2wjGPHTHiamcieSLPWYgmrB7D5FA/Lm
	JAQs64MJ9w5ihsa20lJw2o2ni+qB+As4LZ/iJYQbu1EeDh3MDlwAh26aoWBYSwGQmbSjCHsvX
X-Google-Smtp-Source: AGHT+IEhSxZE/SkrqwX7sj6EJWD+7RjS6wu5oJF0nvhf3fjUzih42EynUgPl13vyPebWG4AWx6xlGs7DU5rslX8T22k=
X-Received: by 2002:a05:6512:234c:b0:543:9b35:5ac7 with SMTP id
 2adb3069b0e04-543e4bdff63mr7046491e87.4.1738575317158; Mon, 03 Feb 2025
 01:35:17 -0800 (PST)
MIME-Version: 1.0
References: <20250202200319.82231-1-uvv.mail@gmail.com> <20250202200319.82231-3-uvv.mail@gmail.com>
 <A9D2F87B-3A31-4CDA-AF52-F30B926260B5@arm.com>
In-Reply-To: <A9D2F87B-3A31-4CDA-AF52-F30B926260B5@arm.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 3 Feb 2025 09:35:05 +0000
X-Gm-Features: AWEUYZkDlAiFteOaibkLZaLKCtIefiBlf4YZETQvyD36evu5ZI5soOWgIcTdXdo
Message-ID: <CAO5Uq5QR_JYDq7oyHRwqTy6arEqp43bECsC=yZ3MNN4v0iWoqw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] systemd: Build the systemctl executable
To: ross.burton@arm.com
Cc: "uvv.mail@gmail.com" <uvv.mail@gmail.com>, 
	"Openembedded-core@lists.openembedded.org" <Openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 09:35:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210635

On Mon, Feb 3, 2025 at 8:54=E2=80=AFAM Ross Burton via lists.openembedded.o=
rg
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> On 2 Feb 2025, at 21:03, Vyacheslav Yurkov via lists.openembedded.org <uv=
v.mail=3Dgmail.com@lists.openembedded.org> wrote:
> > Instead of the python re-implementation build the actual systemctl from
> > the systemd source tree.
>
> Very glad to see this - I tried some time ago but the dependency tree at =
the time was quite invasive to remove so I gave up.
>

As did I, before I did the shell -> python port. In theory I agree
this is a good thing.

> Have you verified that the final rootfs is identical (or in fact better) =
with those compared to our reimplementation?
>
> > +DEPENDS =3D "gperf-native libcap-native util-linux-native python3-jinj=
a2-native"
>
> I=E2=80=99d hope you can remove some more of those dependencies as we jus=
t need systemctl?
>

The getent HOSTTOOLS in the other patch concerns me - that feels like
it could easily be a host contamination problem.

> > +Upstream-Status: Submitted
>
> Submitted where?
>

A nervousness I have with this, is this makes a systemd enabled image
significantly dependent on systemd at build time, and the history of
systemd taking patches which don't match their use cases (which I
don't believe this does) is frankly very poor.

--=20
Alex Kiernan


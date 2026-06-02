Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74BA3CD5BD1
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 17:43:30 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.918.1780422204587543838
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 10:43:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AAiEIwLB;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5174a1da4b2so25585331cf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 10:43:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780422203; cv=none;
        d=google.com; s=arc-20240605;
        b=caJclRYXBytV+T2n2G4Q6aAce2R9RgIRxzexbAbKniSVIyB9q+2e85eplscZ9ez1GJ
         qYxst13m6+wfvUhWM0yATGs0S+Qz2CmFI3laG56PIED7Kmb8cVE86UcCjqgGqrh7UUXl
         h48koaLNG3MO+lVc0YKSpBZkyTLQabD1XLKzp+qszVdewRQJu/8bstWNN6KXwwDnYzjD
         y+Xw5mXVwLH6vapCq7SOAcO+qQ0t8OvkKBfg7yWe5tAyMVdAajEJo+evZH/6BLFck9FV
         ibKoPzDl8ivCQ5srH4i6HFa6w0FkAtvAWNmj/pOUr1SfC0Fw1TQ9Vf04HalE5Jx4wPib
         9F4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FSuYz8Pt7JRvAD5USALnQuYcdzvG8YdgFdQKnwL/nNA=;
        fh=2s71mZ+XjRJoxmsBAMb1m+mNM7leI0OiWG2rMuJ4tcE=;
        b=MDt5KYVC+LqUHI335EAZbGwMN4xtg/fJBZl/4LK0MUXX3tT7ld8opQokNBjiRNQFTY
         V3YcYWWrqzNM8pBrwCmIfMK+Ag9gIKIB6JNe2BG65KNIR+4muj9yjm+UrUrMpBb25e8S
         YTeI/A0abPcXN5/+qWFSpgp2ZV/AMotwVAlXdEjhKKrOcb64n74LVjaNPZyC92yk35qY
         fqLCbSDfswAVKoj6K/lkiR9teUKrziKfw6UPGf73F4Y6KfLtf0hDM9Qti9VvBsqyHPdU
         2+Cs0K3wzq1+4GOPxfUp3LnNJGYrw4RXK3Y9lZJAFAQ/sNZDj08R9xiiI1vCTeu28yER
         xZUg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780422203; x=1781027003; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FSuYz8Pt7JRvAD5USALnQuYcdzvG8YdgFdQKnwL/nNA=;
        b=AAiEIwLBTG3LhLdWBQNHlWdeZLWW1cAPwEMaB8B9j+4EFGGUNtOxBtvGUYbeC5k8lU
         TG9P56YMl7K1ncvPEHBP0PoTeUG8w5S8PCvDM0VawhS6YeJyTkl5GVVAsfKbTkKbh6NK
         fj78mQoNulsfyIDsgduoEQIGzdITW6IEuRJoNHyggKNtbUzoIKPBfmYmrhzbuqhfoe3m
         qxzkhGN1xlzZ9oWHnzutYwtWiYV6O3v0d4cqogIZq3t92QWIv6NbSo8xkUZziwNkAnAt
         8F/5l/vellK5JsQKwCUjK2Gua3ZtTnG6F7dguw7tolrHe1AEqG3BtVkba4UKTVebUAf1
         yjuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780422203; x=1781027003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FSuYz8Pt7JRvAD5USALnQuYcdzvG8YdgFdQKnwL/nNA=;
        b=boj6JLV4IrcIPxQy+c5DHlF+Sf6iGEJK511ikSJo48o+WVXhwdAP1yhshDhNrp5UU2
         qISDp0bBVeZqA2UZoFbNmbpQDbZ0PPkpi+KdupJqZta7Z/6OQCno6oqKhf1fjEE6g4cK
         XvNdF0LrSm1DV4WejYN3Vdzqg5wADAGmm2qchlbyf+ne04Up8DGjtJ4cBLQu34mUjC93
         tjfADjjG7lFl5OC7BM6simlVz4gYMjCUcGD+1lmb+D0/mnuCRHzIWeOg9mqxEqk72/BM
         7nqr/nHoYC73YcMK1bsB5koQvlr0wRu5Lvo1KCTYS8JmQWAqz8HtPnQIw8IavXM55ukt
         V6mA==
X-Forwarded-Encrypted: i=1; AFNElJ/rzUPAV50n+9dX++pJ0Hkn75N152jo3GHkpwkK5lB8lKh2BZwHiaX2QKMvCbgo62SmmpgFvQI7rJSf9l7aJfuCcw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yykro8l/7vybGiao4N/IRzEtJx3U1KiJP4xDPKBM0M5Z8YkGhkx
	ys5hk9InE6KrI4sAXLJxsyDN1ZTyHznm3L5raU1ViocANC8QNGfwBBzKKLfHqxOVNrrq4bEiwE4
	6FKWGdLCBujMJfEzElQJYdEfnefMkYlA=
X-Gm-Gg: Acq92OFXz/JRvmAuV7Fm/vRh+8UU29ItreVDgHU9q9oDF0SlzwqSx4Rbg6UzwTvW00T
	tUi1q6SIb4hgHYphN7RyFubgog4cNLQ44LzefHqyIxou3GofyJefx0f1xMJ11r4JhZg5nvO7BE7
	+c/QmYwgCDOxeDlGDYpdlPT/B0WNwKDKI0qouEiK72PPe6kJCEJCCuQ4OfG4RMt7s08nVFE9hRQ
	1IAaapEW4MjArOJwg47xOvUdPuMNSSMrRcWtqAq03E7QoiEP/Myotr2hingr06la4gOo0mhXs7h
	02doVMHYXWVM87yHpgz8V+T5yrRVrCVHqFvkuVi/6krQhszyOgkU
X-Received: by 2002:a05:622a:205:b0:50e:60a0:acb4 with SMTP id
 d75a77b69052e-51778738b44mr143551cf.44.1780422203590; Tue, 02 Jun 2026
 10:43:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260514133748.219486-1-ross.burton@arm.com> <CAMKF1soV8G-LLutq=9Ba-pkz=XyEJ=5812eQnaYOP834pvBNDg@mail.gmail.com>
 <8FD4DA19-AA50-430F-9B77-0B79D6E70F26@arm.com>
In-Reply-To: <8FD4DA19-AA50-430F-9B77-0B79D6E70F26@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 2 Jun 2026 19:43:11 +0200
X-Gm-Features: AVHnY4IgneIxYJBIJHef-n1gRz2G41f_qUObGaNAfpydjfS5NJm-UiWpGTtkcOM
Message-ID: <CANNYZj_2Ky4KYra153oe85KSArHOe5Uawi4aK=SZe+-c5zvuaA@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] avahi: upgrade 0.8 -> 0.9-rc4
To: ross.burton@arm.com
Cc: Khem Raj <raj.khem@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 17:43:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238067

On Thu, 14 May 2026 at 18:33, Ross Burton via lists.openembedded.org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
> > How confident are we with the release happening on time before we relea=
se in next 5 months time
>
> There=E2=80=99s a lot of distros leaning on this to happen but indeed it=
=E2=80=99s a long time coming=E2=80=A6

*rant*

I wish upstream developers, and I don't just mean avahi, would
remember that 'rc' stands for 'release candidate'. And 'release
candidate' means a candidate for release, a source snapshot that is
deemed ready, and becomes the actual release, unless any embarrassing
last minute issues are reported in a limited timeframe (e.g. days).

What is avahi's track record with those 'rc' tags?

https://github.com/avahi/avahi/tags

*end rant*

That said, we probably should just take it, as long as PV of the
actual 0.9 would sort higher than this rc.

Alex


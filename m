Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63699C6FD1D
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 14:58:12 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.27708.1680188290680949688
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 07:58:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BDU6qCCB;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id o20so16982418ljp.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 07:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680188288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YL1qOIjBij2IQNnkCJOAdqam3K2vScVmnr92bjat8io=;
        b=BDU6qCCB+THJZx3AEOMP7UjSLUtcx8W4YTmG6YZZrANM5uuMezq8+OQ+WfYdW/Q+yX
         3HC2Z/QZDrokvinx6yHvxCM9NE36+GvSbVmzyOQEs+C1wKiVqjsrvbQ0CE5hhfoAg71s
         M1rC5X8B20JHE6ZdnkO9aJFTAfU8TBEjMIKVKw2/P5D8zF2pCvQnvkEKUagS3lT22s2B
         k9umAsMBY45+dfKrwkmW5XR7+gFJ8KHYt1j/05SIlhrg5jlvlunF04YCYL6B3T3XdpvU
         eB+8utEenwvT/JJOrd7zOdKjK9evsGDXA6nhamFQllO2qfB7CC487e/hBW2PKCPFpW/1
         z5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680188288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YL1qOIjBij2IQNnkCJOAdqam3K2vScVmnr92bjat8io=;
        b=rJ46M+UO+3GAlDXpfF3qD+Wl4NzoRQWt67dx7ikSPJ8PXS5s+jsH4iCNvR/a9raiVx
         7RW6/LIXlmQdnfw7ZN8VzCPJBgEzGVjNdsMTsc/wLwyNvhmtmjQjkXnyfWeKYo9mqYyO
         DauCLJgD8xWDnGuHCYmmXBt+Kx/j5zhA/lMfZUHXnT7iWTmOqHp3UMyhLZpDRFrOLF3i
         uw7Ms2fWwrda1KFzICZy22/9bcPq84h26SggPMs257IUwM7bO0HaJW2h+aNxXsCl2A3O
         vb80JT7xQeiDh0WC3lh9NCNoWnPflL7Zobk+V/Y8WZLJSekn52pnCNdi+yIKKSyoIWuU
         xxDg==
X-Gm-Message-State: AAQBX9ffultOcnYgCgwFjMEUl08DPqeiZNuI/KLs1rzuKganD/0iSo3B
	HgBUHwbGA1iDssrILuuBbKIgNQOIVA17fyibypU=
X-Google-Smtp-Source: AKy350a5ijR9i+GP1l8E9sbF82izAXV9P4Uz7r7WGyy7W6gET6EDVsib4DwUxoJkU3tbH3Rh3rZ+dUFrLVK7vVmChBQ=
X-Received: by 2002:a2e:910d:0:b0:2a3:5c1c:ec20 with SMTP id
 m13-20020a2e910d000000b002a35c1cec20mr6982193ljg.7.1680188288405; Thu, 30 Mar
 2023 07:58:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230330134214.2772913-1-zboszor@gmail.com> <a25c3a41d623242edf004723dc94518228cfc1da.camel@linuxfoundation.org>
 <869f611a-1645-52b6-1f3b-e4b605f2ddd4@gmail.com> <CANNYZj9uYcBaDHgBABrnjCuH9AGTEQ8PhkxuJBm+FaTTNkwaPw@mail.gmail.com>
 <1deaad30-4816-af4d-910d-ef2242952033@gmail.com> <CANNYZj_RSRs=e5NS4QT=BnyYasf8-PrpFjSkfhPZCPLqtwZ1+w@mail.gmail.com>
 <7eb81976-7603-e6c5-264f-19f20724cbc4@gmail.com>
In-Reply-To: <7eb81976-7603-e6c5-264f-19f20724cbc4@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 30 Mar 2023 16:57:57 +0200
Message-ID: <CANNYZj-GQ7ui_XbXevSb7tj54Kc5kh=x3C8rkwmPyMKRM1wZUg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] systemd: Allow native build
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 14:58:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179334

On Thu, 30 Mar 2023 at 16:51, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbosz=
or@gmail.com> wrote:

> >>> TODO? The new natively built systemctl binary may replace
> >>> the script in systemd-systemctl-native, as it supports
> >>> more options and works better than the script. For example,
> >>> the current script does not create the symlinks in
> >>> /etc/systemd/system for WantedBy=3D and RequiredBy=3D settings
> >>> and does not support systemctl set-default some.target.
> > This is a separate concern, and needs to be proposed as such.
>
> I can extend this patchset to remove systemd-systemctl-native.bb
> and use the native build fixing these problems.

That would make a stronger case for it. But you'd likely be asked to
make systemd-native really minimal, and ideally produce the systemctl
executable and nothing else.

Alex


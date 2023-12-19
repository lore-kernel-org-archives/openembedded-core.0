Return-Path: <alex.bennee@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DC1DC46CCD
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 15:25:50 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.15975.1702999545145344929
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 07:25:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=WzJTEzig;
 spf=pass (domain: linaro.org, ip: 209.85.128.41, mailfrom: alex.bennee@linaro.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40c29f7b068so51757255e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 07:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702999543; x=1703604343; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UPTcSyFVbR6QVpmd/6sDcuWNndl/cO5BiJy4Cn4R72Y=;
        b=WzJTEzigTh59AGJbhIuyccVg0PZ8Rf2MNGJN0B8bh6QRNU+gCuhqNAGVQgRFhM1gmj
         0PKRcHGGyZ6yjqWk39Rxul0PUQLpn8Fdwa+W5RJt+bUOYV7nq0I5HdopBwIsG2AeMDp3
         jXdaaddrb/A+KmCZ2ZUrNJgWIdz282hxO0MDKNVf6tiFnUjqaeGJ7mJKNvgdazwaZzkV
         2pRi1LB6o9GbO0QvsOkI7ZeW7ecci1k5ayK5vAzVMeP0oXT1FR3U+wxgq/R1wKJytRH8
         NjPM4fghs4HkDEpjcpkhidJXTFjMeGta1BsPwLAjEb8ECUpIqRYPhfRBkIGqQ1ajJ5bu
         vzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702999543; x=1703604343;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UPTcSyFVbR6QVpmd/6sDcuWNndl/cO5BiJy4Cn4R72Y=;
        b=PCQO5YajTj1UM6o35JSH6MnHMAOHMC2xI+/ZLY9JuFv2kzizGfNbWrtZSI/XVBc2Y3
         2cx+G8VA8lrQRrtg8E4bh2gxaXwoK2ycMGkqdld+EmoRe4UA6YI6n20CkfI8P0pYV4xb
         hw61uw4prOvRaxpoQJ8TppyllhEUI2Ik6l+hYxkx6Jsb+Ez5FPcRMQ6ZeqF54AyONnUF
         e+BaIkpMal1vi7nN7YNVjOTvlCl/ljeSIc8gPulMyIChvAt2ggoLsr1z9c/L47LruOt/
         +KnnFtQ6j8jaapNtaZzcD2k9YjsCEl5aKWiPAAGL3jAGS2fZhm5/kx2McFdo2j6wIzlB
         Gv0Q==
X-Gm-Message-State: AOJu0YzDKkkukVjOh0PoS6ifC82kMcMkKaEhYOZdz42wpoafcQyxvrK5
	mXwlO7nDYCEuaBDNgVRucuwdofJymFpumPDatM4=
X-Google-Smtp-Source: AGHT+IHA1Qf/Jmcwd8p//UatvAyuCbREOrBGw3zGmXlS9RnDGYWKCuZCIF2rF86fPn3wp7Xh7j7KnA==
X-Received: by 2002:a05:600c:4c1a:b0:40c:d4d:68ec with SMTP id d26-20020a05600c4c1a00b0040c0d4d68ecmr9264415wmp.183.1702999543258;
        Tue, 19 Dec 2023 07:25:43 -0800 (PST)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id j7-20020a05600c190700b0040c31bb66dcsm3243864wmq.20.2023.12.19.07.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 07:25:43 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 9DF0F5F8B9;
	Tue, 19 Dec 2023 15:25:42 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>,  openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/2] qemurunner: Impove stdout logging handling
In-Reply-To: <434f6172a28349e51e834b503be2c353bfa45720.camel@linuxfoundation.org>
	(Richard Purdie's message of "Mon, 18 Dec 2023 23:01:13 +0000")
References: <20231218152951.3398964-1-richard.purdie@linuxfoundation.org>
	<CAMKF1sqkizk++vW++TsyiOBSsHhM7euMNWGs8KHBJq_2yB=dFw@mail.gmail.com>
	<09096b377fb5ac72d118926a861c9d70265b0f6d.camel@linuxfoundation.org>
	<CAMKF1srWbpjj7ojaQ-0fdtu5XAW3qA04bbjvqZWekYRqp0s=5A@mail.gmail.com>
	<434f6172a28349e51e834b503be2c353bfa45720.camel@linuxfoundation.org>
User-Agent: mu4e 1.11.26; emacs 29.1
Date: Tue, 19 Dec 2023 15:25:42 +0000
Message-ID: <878r5q43k9.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 15:25:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192750

"Richard Purdie" <richard.purdie@linuxfoundation.org> writes:

> On Mon, 2023-12-18 at 10:07 -0800, Khem Raj wrote:
>> On Mon, Dec 18, 2023 at 9:58=E2=80=AFAM Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> >=20
>> > On Mon, 2023-12-18 at 09:45 -0800, Khem Raj wrote:
>> > > I tried the two patches in this series. It did improve the situation
>> > > but I am still getting SSH timeouts. But this time its 13 tests
>> > > earlier it used to be 40+
>> > > btw. my images are using systemd. So it might be good to see if we s=
ee
>> > > this with poky-altcfg as well or not.
>> >=20
>> > Do you have the log.do_testimage and the ${WORKDIR}/testimage/ files?
>>=20
>> yes, further I ran the failing tests in loop one after another still
>> one test gzip fails with ssh timeouts
>>=20
>> https://busybox.net/~kraj/log.do_testimage.503
>> https://busybox.net/~kraj/testimage/
>>=20
>> there are two runs in the testimages folder. In one you see the RCU
>> stall and in second you do not
>> but it fails with same ssh timeout issue.
>>=20
>> >=20
>> > Did you still see rcu stalls in the logs?
>
> What is interesting is there is ~3MB of nulls in the .2 serial log. The
> rcu stall is also:
>
> [   88.261687]  serial8250_tx_chars+0xea/0x2b0
> [   88.261689]  serial8250_handle_irq+0x1e9/0x330
> [   88.261691]  serial8250_default_handle_irq+0x4a/0x90
> [   88.261693]  serial8250_interrupt+0x66/0xc0
> [   88.261696]  __handle_irq_event_percpu+0x54/0x1c0
> [   88.261701]  handle_irq_event+0x3d/0x80
>
> i.e. it is stalled in the serial TX path.
>
> The big question is why is there so many nulls on the serial port. I
> see a few on my local x86 test runs but only ~4kb, not megabytes of
> them. I hadn't worked out where/what they are from yet.
>
> I suspect something in the serial/kernel/qemu space isn't interacting
> correctly.

We generally don't model FIFOs in QEMU and also we will block the main
thread if we can't write data out.

>
> Find the cause of the nulls and we might make progress on this.
>
> Cheers,
>
> Richard
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192681): https://lists.openembedded.org/g/openembedde=
d-core/message/192681
> Mute This Topic: https://lists.openembedded.org/mt/103244414/5085169
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.bennee@linaro.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro


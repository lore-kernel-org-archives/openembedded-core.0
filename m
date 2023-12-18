Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 473EDC35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 23:01:24 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.4890.1702940475951356463
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 15:01:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MSVjbouI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40c256ffdbcso46652115e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 15:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702940474; x=1703545274; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=r/33wUy2HlF03P9w5F5Jm3RyG6vtm8fei8o3x1JhP3g=;
        b=MSVjbouIZ32g1omRUW77CdCn1Olz5CHna2X0CmmAQWBGBTvN2Q6+lndsV3sC4f26Zm
         1X5BErBSx4SV/JOLvRKHWXCIs5mGmuWYEBElPWx2kkqFTWt89sOfvWH514/rRkCEpyYd
         uLflFhzA2RJ2rFQYBca4SqGak15mXqx9VZxcw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702940474; x=1703545274;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r/33wUy2HlF03P9w5F5Jm3RyG6vtm8fei8o3x1JhP3g=;
        b=dIds1L/oRlmS6yFKiQQe/7q0TMNbMN44t2HJ2GSW8anT6W125MIoj3UNyN9rg16ZAW
         FP7oTRE8Fyb++U/zVOAeYGkNdJQqKy/GOvYGnuD0ZZqGp5guKqsQ9dGz0cOG7Bj4GUHi
         U1QF4VE3tSUWeVugvYlZSt+/4/DRK1h/f1geibus1VLES1wAsN9bBvpbklAY9i9Dz2Ot
         ad0AvUBkvG16h0R9i6fD/rxwF/4X2ZVhhaiR65VSmWTw1k6a143vFTESUucH15CPQ9X8
         dJHu84jsKL09xIWLMyhOByjq+1eIMNRcwbrYU2LY7zXmEEprMDyXTp46wGKImsuDI7+2
         KZQQ==
X-Gm-Message-State: AOJu0YxU6UqY3FoGz9ZnIhJb5uhMz4Yfayr4YOqu/85VQIjc0lYd2gBE
	P7HGEltANNhjelSctlS9wNZnY+tqBnTJ8I1r4vI=
X-Google-Smtp-Source: AGHT+IHhnIEfdv2JI6JahAXS7ZT2f9l03x0rCM48bLRRer/HZHAQJj2FQqEDW5hpuwwJcIEIGT0Zrw==
X-Received: by 2002:a05:600c:2296:b0:40c:3103:2ecb with SMTP id 22-20020a05600c229600b0040c31032ecbmr9273491wmf.43.1702940474421;
        Mon, 18 Dec 2023 15:01:14 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:b87d:537f:7c6:e419? ([2001:8b0:aba:5f3c:b87d:537f:7c6:e419])
        by smtp.gmail.com with ESMTPSA id r19-20020a05600c459300b0040d128e9c62sm190977wmo.18.2023.12.18.15.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 15:01:14 -0800 (PST)
Message-ID: <434f6172a28349e51e834b503be2c353bfa45720.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] qemurunner: Impove stdout logging handling
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 18 Dec 2023 23:01:13 +0000
In-Reply-To: <CAMKF1srWbpjj7ojaQ-0fdtu5XAW3qA04bbjvqZWekYRqp0s=5A@mail.gmail.com>
References: <20231218152951.3398964-1-richard.purdie@linuxfoundation.org>
	 <CAMKF1sqkizk++vW++TsyiOBSsHhM7euMNWGs8KHBJq_2yB=dFw@mail.gmail.com>
	 <09096b377fb5ac72d118926a861c9d70265b0f6d.camel@linuxfoundation.org>
	 <CAMKF1srWbpjj7ojaQ-0fdtu5XAW3qA04bbjvqZWekYRqp0s=5A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 23:01:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192681

On Mon, 2023-12-18 at 10:07 -0800, Khem Raj wrote:
> On Mon, Dec 18, 2023 at 9:58=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Mon, 2023-12-18 at 09:45 -0800, Khem Raj wrote:
> > > I tried the two patches in this series. It did improve the situation
> > > but I am still getting SSH timeouts. But this time its 13 tests
> > > earlier it used to be 40+
> > > btw. my images are using systemd. So it might be good to see if we se=
e
> > > this with poky-altcfg as well or not.
> >=20
> > Do you have the log.do_testimage and the ${WORKDIR}/testimage/ files?
>=20
> yes, further I ran the failing tests in loop one after another still
> one test gzip fails with ssh timeouts
>=20
> https://busybox.net/~kraj/log.do_testimage.503
> https://busybox.net/~kraj/testimage/
>=20
> there are two runs in the testimages folder. In one you see the RCU
> stall and in second you do not
> but it fails with same ssh timeout issue.
>=20
> >=20
> > Did you still see rcu stalls in the logs?

What is interesting is there is ~3MB of nulls in the .2 serial log. The
rcu stall is also:

[   88.261687]  serial8250_tx_chars+0xea/0x2b0
[   88.261689]  serial8250_handle_irq+0x1e9/0x330
[   88.261691]  serial8250_default_handle_irq+0x4a/0x90
[   88.261693]  serial8250_interrupt+0x66/0xc0
[   88.261696]  __handle_irq_event_percpu+0x54/0x1c0
[   88.261701]  handle_irq_event+0x3d/0x80

i.e. it is stalled in the serial TX path.

The big question is why is there so many nulls on the serial port. I
see a few on my local x86 test runs but only ~4kb, not megabytes of
them. I hadn't worked out where/what they are from yet.

I suspect something in the serial/kernel/qemu space isn't interacting
correctly.

Find the cause of the nulls and we might make progress on this.

Cheers,

Richard




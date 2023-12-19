Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D88DC41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 12:03:19 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.10368.1702987390480184597
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 04:03:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FLKHoyC1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-336437ae847so4703760f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 04:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702987389; x=1703592189; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rJQtlaL0tPaUf9GvqjFUK+gEVvg2JQ2ddNbaedz3JVo=;
        b=FLKHoyC18FfWw0FMB9tUUYEs6rA6BQfHdVzf6sBjUi14DsTCPIWUoQrKeA05djjSqK
         qHxIvzPLlyzGP/SoZeLU81QHOJp1rnHaCQd+F9UbeEmVNthuxQj4fsTNEUu7V0QVI79o
         EK+FAKbOT0cv8TwOOsYzrLCHRX8kWmOZT534s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702987389; x=1703592189;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rJQtlaL0tPaUf9GvqjFUK+gEVvg2JQ2ddNbaedz3JVo=;
        b=hXv3bqWYyLyQAeXQFimjIvTadIwCdczTSbbwm6Mvrd03W91aiVLVth/ZaIvt/pszH7
         e+nQsb8kQtga7MANiZWbObY0uomfCRR9RrbCbQx+5yv4z+Xa/h0Yssp+WKDbPWtG92JL
         dM0q64/4pfQ52OyzFcIsxVYGhd3+j5ah/DkyNzcKvPW2/z6jVLjqWxUjmeIOclcDIPTR
         xLJvZSEVjcdyI5yHHw2ziwrZ0decpeqe/fDHdPyelwzimbIulPkJJ3XkU/ZpD/PA2QdF
         9cx23xGA8f8FhobNPN6jheBqFlladnnbGNWLdY+l7hyK0yh3CKH6y5LuaJ0/T2Aftjf0
         Ht4g==
X-Gm-Message-State: AOJu0Yz7vkcsC8Gh0jWfoJBLvjgE+yVbgOGwyhcpDnBX14fY+RHzo3RP
	THMUZsNqdPQG4+c4BiiPhas0+g==
X-Google-Smtp-Source: AGHT+IHbzm/Sur+wP/TuuogkWmbk+a7C7lvxfDSyPU9Aoa7/p2Gn9aFlal9oqjEwPeaWcPloytbd9A==
X-Received: by 2002:a5d:4ac3:0:b0:336:73e4:33b2 with SMTP id y3-20020a5d4ac3000000b0033673e433b2mr409156wrs.93.1702987388787;
        Tue, 19 Dec 2023 04:03:08 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:b87d:537f:7c6:e419? ([2001:8b0:aba:5f3c:b87d:537f:7c6:e419])
        by smtp.gmail.com with ESMTPSA id bl2-20020adfe242000000b0033668ac65ddsm4996229wrb.25.2023.12.19.04.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 04:03:08 -0800 (PST)
Message-ID: <8ba14102f0ea38d9bb691538e3b2171e82aead33.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] qemurunner: Impove stdout logging handling
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 19 Dec 2023 12:03:07 +0000
In-Reply-To: <17A20F573E606BC3.25349@lists.openembedded.org>
References: <20231218152951.3398964-1-richard.purdie@linuxfoundation.org>
	 <CAMKF1sqkizk++vW++TsyiOBSsHhM7euMNWGs8KHBJq_2yB=dFw@mail.gmail.com>
	 <09096b377fb5ac72d118926a861c9d70265b0f6d.camel@linuxfoundation.org>
	 <CAMKF1srWbpjj7ojaQ-0fdtu5XAW3qA04bbjvqZWekYRqp0s=5A@mail.gmail.com>
	 <17A20F573E606BC3.25349@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 12:03:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192724

On Mon, 2023-12-18 at 23:01 +0000, Richard Purdie via
lists.openembedded.org wrote:
> On Mon, 2023-12-18 at 10:07 -0800, Khem Raj wrote:
> > On Mon, Dec 18, 2023 at 9:58=E2=80=AFAM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >=20
> > > On Mon, 2023-12-18 at 09:45 -0800, Khem Raj wrote:
> > > > I tried the two patches in this series. It did improve the situatio=
n
> > > > but I am still getting SSH timeouts. But this time its 13 tests
> > > > earlier it used to be 40+
> > > > btw. my images are using systemd. So it might be good to see if we =
see
> > > > this with poky-altcfg as well or not.
> > >=20
> > > Do you have the log.do_testimage and the ${WORKDIR}/testimage/ files?
> >=20
> > yes, further I ran the failing tests in loop one after another still
> > one test gzip fails with ssh timeouts
> >=20
> > https://busybox.net/~kraj/log.do_testimage.503
> > https://busybox.net/~kraj/testimage/
> >=20
> > there are two runs in the testimages folder. In one you see the RCU
> > stall and in second you do not
> > but it fails with same ssh timeout issue.
> >=20
> > >=20
> > > Did you still see rcu stalls in the logs?
>=20
> What is interesting is there is ~3MB of nulls in the .2 serial log. The
> rcu stall is also:
>=20
> [   88.261687]  serial8250_tx_chars+0xea/0x2b0
> [   88.261689]  serial8250_handle_irq+0x1e9/0x330
> [   88.261691]  serial8250_default_handle_irq+0x4a/0x90
> [   88.261693]  serial8250_interrupt+0x66/0xc0
> [   88.261696]  __handle_irq_event_percpu+0x54/0x1c0
> [   88.261701]  handle_irq_event+0x3d/0x80
>=20
> i.e. it is stalled in the serial TX path.
>=20
> The big question is why is there so many nulls on the serial port. I
> see a few on my local x86 test runs but only ~4kb, not megabytes of
> them. I hadn't worked out where/what they are from yet.
>=20
> I suspect something in the serial/kernel/qemu space isn't interacting
> correctly.
>=20
> Find the cause of the nulls and we might make progress on this.

I went digging and it is a mess. That 3MB file is actually a wtmp file
from /var/log. The reason is a failure of the "target_dumper" commands
and that the simplistic serial command handling doesn't like binary
files.

I've a few patches which should improve the situation but we're clearly
multiple issues at play here where issues are stacking on top of other
issues. My rough list of issues:

a) stdout logging from qemu wasn't being read and could overflow
buffers locking qemu
b) serial data from commands wasn't being fully read and could overflow
buffers locking qemu
c) the dumper log reading command is reading binary files like wtmp
d) the dumper logs overwrite each other so are useless anyway
e) the dumper logs run on every failed command
f) qmp monitor dump command also run on every failed command

I think we'd be much better off if we drop the dumper/monitor stuff and
qemu runs might be quite a bit faster too.

Cheers,

Richard







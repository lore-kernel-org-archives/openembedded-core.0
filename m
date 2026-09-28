Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64119CA5FA2
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 19:09:50 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.65729.1790622584954575231
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 12:09:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=erk2qwE/;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 932931A103C;
	Mon, 28 Sep 2026 19:09:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5E259601BD;
	Mon, 28 Sep 2026 19:09:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 719551032972F;
	Mon, 28 Sep 2026 21:09:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790622577; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=w1vDr1gAoGkwuQaYVl8dZwr9j1cVTqn3kGhcCuI0Sp0=;
	b=erk2qwE/ryKUnyb6gp8ykA71WO54gpzpDrz3nvW46xDWwmrGlQcpdDAKXdt/yutGjgLoH5
	cmvKi8Ze/gITk358ByoS0i7bM3PdnQJqqHGQmkc/2H9zj/T2Ty65wG/MVmyQIgGxlH/dEb
	B0WxYw7feQPjHuIUQIHLKSeaXfSitRvh1ZIOw6vS4ogYVuvX1iu3vcD1yHqb2z6tHh6Oex
	qalvIlTPfPpEb9BLRIeV3m9YAf6wppG97kyFadQ9arlR3YdZaxxiZnpJdyj4zhWgDv0A5w
	Fq7YDRER1Wugxx2IThLcJzqiYDyG5SXDQ13G8OgaCTk5ppokK6r3zhg0X5QluA==
Message-ID: <3e52db64-1a47-45da-b357-83044c711f10@bootlin.com>
Date: Mon, 28 Sep 2026 21:09:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 1/1] recipes-support/gnutls: disable slow
 tests for RISCV64
To: Trevor Gamblin <tgamblin@baylibre.com>,
 openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com
References: <20260928162614.1685239-1-joaomarcos.costa@bootlin.com>
 <20260928162614.1685239-2-joaomarcos.costa@bootlin.com>
 <DLR4232VEGLK.D4805FQMYD9Z@baylibre.com>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <DLR4232VEGLK.D4805FQMYD9Z@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 19:09:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246792

Hello,

On 9/28/26 7:04 PM, Trevor Gamblin wrote:
> On Mon Sep 28, 2026 at 12:26 PM EDT, Jo=C3=A3o Marcos Costa wrote:
>> Timeouts have been observed (very frequently in the past weeks)
>> in the autobuilder, and a bug [1] was filed at Bugzilla.
>>
>> After some investigation [2] was performed by Trevor Gamblin, we now h=
ave a
>> list of the most time consuming test cases:
>>
>> - mini-record-2 (187880ms)
>> - record-retvals (145390ms)
>> - rng-op-key (63820ms)
>> - rng-op-random (63330ms)
>> - rng-op-nonce (63260ms)
>> - dtls-rehandshake-cert (61360ms)
>> - dtls-rehandshake-cert-2 (61230ms)
>> - dtls-rehandshake-anon (61030ms)
>> - mini-loss-time (60130ms)
>> - mini-dtls-hello-verify-48 (30050ms)
>> - tls12-ffdhe (27790ms)
>> - x509sign-verify-rsa (18460ms)
>> - x509sign-verify-ecdsa (16050ms)
>>
>> Disable them to avoid so many timeouts in qemuriscv64-ptest runs.
>=20
> Thanks for submitting this. I'm sorry if I wasn't clear before, but I t=
hink we
> should only disable mini-record-2 and record-retvals to start, since th=
ey are
> significantly longer than all of the others. If gnutls remains a proble=
m
> afterward then the others should be considered, but for now we want to =
try
> retaining the others to maximize test coverage.
>=20
> Trevor

In that case, I'd rather remove at least the cases that take > 60000ms=20
to run, and avoid getting back to this again when the runners are more=20
loaded than usual. What do you think?

--=20
Best regards,
Jo=C3=A3o Marcos Costa



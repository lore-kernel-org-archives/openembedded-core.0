Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C74ACD98CE
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 14:48:01 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.72397.1781275677583010296
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 07:47:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hkHZ0CDm;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45eeea039ebso612931f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 07:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781275676; x=1781880476; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pu/yiHcv7PGfxTa3TxJYEciq9gIGF5zYElB9keIOjaw=;
        b=hkHZ0CDmw3Hyg/3B8knvSaF/wnWZayS+13833CXSX2yvr6fSKL/+sx+h4Io/mj8pvq
         kvdvZu2LR+NXZ3qYW8Y9ZPmILsP/AZWVxIfR8o+A55bUa5olPyEfKeHGXGrI/BrmyKL8
         1oDWTMAHEK2cIbMVWo6djpMPlJ6oPgx4jGAWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781275676; x=1781880476;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pu/yiHcv7PGfxTa3TxJYEciq9gIGF5zYElB9keIOjaw=;
        b=OaleF3msCrwzlwBeGbi3wtH9p5ypCzMKaNyF82ZicfTIjsOb9HKQWzs8/Si/YfqC3O
         f9ar22BYPGVISGzbQiABH6sLjwDyOJtBxhMtAhkH4iy535fyU76/vU4YgJbMhaYPr3Zs
         Tzx0FDSYAq+6EX4u27D0oOtJUriUIjeYYC8YTmadLFMLXQMvDLh94qH8ozjhehfsPXen
         2BfpTe5GgmdEBAyF03W/EAg4bpvDjNoJxdACBclmMhmL3BXMimuumJt/MfycAinw6Um0
         LI1U7BuXaMclx8Vu+7NfmtREw89xqaJIZm7EO3kQKfW8WfEHsInZQUOrdYardU1iKBX8
         v3Zw==
X-Forwarded-Encrypted: i=1; AFNElJ+Le3Dt0pKyL17IGWbtIaaARDnK2nkFVK5NgYxG1Yw6mVdrnWsjPzFMywbnsWoFHafCZyt5tDagLiA2na29uvJ9sg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzvtEUG7m+IGvcYDqGYPwzbxWLqByO2OChpr1GZl+AvR0EXtVD9
	0Hn2Tev0xqHxRDNt50rEkZxc8V98SKu2xX+LYhWqkwATy/Mn49+WJoj/WqZV7VUIBn0lFUoUFx7
	nme9k
X-Gm-Gg: Acq92OGSNpYUe7fHSohb7D+cv40I2uao9CZ9iRQ18ZtksexWqJsATsETjMhq7Da8+Rg
	yH7kCmWHTm1FvvGD3XWBh+GjdsFInTNCrn85gZ3DWbZkFmpONMpqvzj3ZtcRLXQ+mhX/h8usb6L
	rqWwmxqM1itPRMV6ZdUx7hAQHLyKNFjQEEa4m8/iDVuSGWEJ1NZ95WOlWe1muvg+SbykQyBI0oN
	fXHN0085f+6TAx9h/O8KcvC/YA4BA3y+Z5zchgwFAVOP1wWJJjeWbaucDcyMhgfbfk3oNHAR1rE
	7lVZYhgf2TyMzaehgYiekmX0GeEkqv501fcXD1qYitAODdX1gWd6d0Tr5O2oRYtYEYiKTMPhtkf
	jQMM8d3Uz9wxQH3+q4MCuJZX23ngbOWaj5feNyXSl5yHRtEVAAogtv8rqIjUW6KUnbILd9G+ORR
	u3diuTybNeth274ndaHpISLWsIVbqAxbPyc9jsmLxG0Aff6tHlsMsTIPVzaUaiSoK8zkZzBSA4B
	oq9lzx82NBzOTQM
X-Received: by 2002:a05:6000:2381:b0:45e:9420:ed16 with SMTP id ffacd0b85a97d-4606da69a8dmr4785397f8f.10.1781275675812;
        Fri, 12 Jun 2026 07:47:55 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a71583d8af7a53fb.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a715:83d8:af7a:53fb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2e592csm6645153f8f.36.2026.06.12.07.47.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 07:47:55 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Jun 2026 16:47:54 +0200
Message-Id: <DJ75J05DW9Y8.397UAAVTF0HKR@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>, "Paul Barker"
 <paul@pbarker.dev>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose 18/21] python3: use SKIPPED_TESTS instead of
 test skip patches
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <cover.1781132051.git.yoann.congal@smile.fr>
 <c9df7ab1678751caa8c5195fd366d3058a3cc6fa.1781132051.git.yoann.congal@smile.fr> <ccf309b775b890e94e6cc0d5e8c13ffc4d4218ce.camel@pbarker.dev> <DJ65ME2CV03O.291OM3MDV8SQL@smile.fr>
In-Reply-To: <DJ65ME2CV03O.291OM3MDV8SQL@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 14:48:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238644

On Thu Jun 11, 2026 at 12:39 PM CEST, Yoann Congal wrote:
> On Thu Jun 11, 2026 at 10:58 AM CEST, Paul Barker wrote:
>> On Thu, 2026-06-11 at 00:55 +0200, Yoann Congal via
>> lists.openembedded.org wrote:
>>> From: Trevor Gamblin <tgamblin@baylibre.com>
>>>=20
>>> Drop all 13 patches carried for skipping various known ptest failures
>>> and replace them with usage of the SKIPPED_TESTS variable, which we hav=
e
>>> started doing in recent commits (e.g. 40b0815dc9). Most but not all of
>>> the test skips are due to load variability, distinguish between them by
>>> using multiple SKIPPED_TESTS:append blocks with comments taken from the
>>> patch files indicating their purpose. This adds 62 lines to the Python =
3
>>> recipe, but it also means that we no longer have to maintain the patch
>>> files across version upgrades, where they often break due to changes in
>>> the test modules upstream.
>>
>> Hi Yoann,
>>
>> What's the reason for backporting this (and the following patch) to the
>> stable branch?
>
> Hello,
>
> Mainly, it was to make future backports easier to hopefully fix the
> AB-INTs we have on python (as it would align wrynose & master for the
> python recipe). But I admit this is a weak argument. I don't mind
> dropping those now and revisit when we have an actual fix to backport.

Hello Paul,

I'll send a pull request with those patches included but feel free to
not merge it if you disagree. In that case, I would respin the series
without those and send a new pull request.

Regards,

>
>>
>> Best regards,


--=20
Yoann Congal
Smile ECS



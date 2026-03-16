Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88DD3EFCBD4
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 07:21:53 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45110.1773645706015372761
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 00:21:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=107fFHWn;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439c9bdc1eeso4321032f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 00:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773645704; x=1774250504; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUCLScxOeV9awNQe/TwkQKpspnJshQeZa5dWS/le3jM=;
        b=107fFHWnO4cuHL3C8dkZLsaYPqVoor2C2+peI5u+/QwYmAdTzSaH6xBSu4i1Euk1Pg
         NQ58GHsA+sWq4M/NHn5xhxHkYNpEVS/S17bzYIH4lpPQ3LTijyfAUhtSRFWLC/pVAOHO
         iyPNFnGXPf7Izpq9fUJ5JQhGHFuewLXZ/gxkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773645704; x=1774250504;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gUCLScxOeV9awNQe/TwkQKpspnJshQeZa5dWS/le3jM=;
        b=UGnL2DkQOeAH09PHUYxLJGHMA2otRFGM7yUPAqnjoM832ciD8D9f/LOjey4uhTYq0p
         4u5MadONQOm83J0uWJ2R2swIdg3fBxaoiQBqIUqv4CzHQnIM0SUGyRrPTjMfeQBWP3qM
         lgA6gE2meNPkGsmCUcGDzqnAiPibLZIIrLuNhlLS9dGHpYypjANPIDqh9oRDFanWsJG+
         W1euB9H2ANmHVJIrV1QNyruqK6+3Mte/YCg+SC3UEgTc2OLxABJePyXnNN+KPwqhwSFl
         sCWbSiZm646z6g6AX5LUDhSgCMX/0paOGPIAs54+d2po00nNlCz0fYBqPpkodN9ToJAc
         Jygg==
X-Forwarded-Encrypted: i=1; AJvYcCU9aaF/RsfWFUqhHbBYUOV0IwQK+5GlcjijAzCr5SSj1bRgUs7K6tDTRyEfeW8wWbsqLhYU5DikpEZ1E/2hgatRPg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywdln6qNJa6pm0cQLy0T3L7v/5/aCFV9G+ldOhwIxd3FSAjv5PM
	fBc7pGJyns+9H2mOoYXgmpthXZlvn90GZp5bZMHxLKTrukCyijd1pxE5FsfCFaeY8MA=
X-Gm-Gg: ATEYQzxadxnOJCJAAnHAx+WrJ+vAgD6Wzlji68L/yyLAeXkVS0praR20R4vao/uVXik
	PxOze2VpPCAGKt2Ctuonzs//3LxvRGHhtAdpPkiOzUgjPbEgiM09bLZpIweTWBkUaSU1SPcxX+4
	vS+I0JnErTQ3jGSQ+qTbKkSjgubWgIf09nt3QT25Qn1oILu+EnJCbPfNwWqvjEx7LGylfXdnI1q
	VnlWhLrlpl2aBSj71fjZaJdvR2Kalwqw8Ys9NHoNsb31tIH8vD+/L4oOVp7Nl7l2Q76/fm3Orfp
	RL+zo8j7IdYTlodIkiSLvpOAsGnRZO5mJuho0/Hqk7rwONWqBVClf/m2sSXVTjBrj7YctD8/sbn
	wnkXxR9ctDeMoaP4BrOTp3EdH9CsZdy43bSmD+N8GlD2icr2WqlgZWcv04L88lTVN4nvzNhHg3+
	0dG3OfOYGwzf/uz8660mrT9Gpsp6oY7pkIEVei+sGelp5rbIiauuArSLtGjmbAy0u3NrVLnO1h4
	YYBjxC6y7+zpQ==
X-Received: by 2002:a05:6000:2dca:b0:439:ddf9:a205 with SMTP id ffacd0b85a97d-43a04d78da1mr21813610f8f.10.1773645704267;
        Mon, 16 Mar 2026 00:21:44 -0700 (PDT)
Received: from localhost (2a02-8440-2509-819e-bcc9-bfb5-d85a-bcf1.rev.sfr.net. [2a02:8440:2509:819e:bcc9:bfb5:d85a:bcf1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20bd9csm39524937f8f.21.2026.03.16.00.21.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 00:21:43 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Mar 2026 08:21:41 +0100
Message-Id: <DH40XEX28Y63.KLICO9046OZY@smile.fr>
Subject: Re: [OE-core][master][PATCH] libpcre2: Enabling Ptest support
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <mathieu.dubois-briand@bootlin.com>, <careers.myinfo@gmail.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260211080135.92891-1-moins@kpit.com>
 <DH40I2J3OKEX.13AXWCLYL6EF4@bootlin.com>
In-Reply-To: <DH40I2J3OKEX.13AXWCLYL6EF4@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 07:21:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233215

On Mon Mar 16, 2026 at 8:01 AM CET, Mathieu Dubois-Briand via lists.openemb=
edded.org wrote:
> On Wed Feb 11, 2026 at 9:01 AM CET, Shaik Moin via lists.openembedded.org=
 wrote:
>> Install libpcre2 test suite and run it as ptest.
>>
>> Add tests for POSIX wrapper (pcre2posix_test), core PCRE2 engine (RunTes=
t), and grep utility (RunGrepTest).
>>
>> pcre2posix_test: Verifies the POSIX wrapper API
>> RunTest: Executes the core PCRE2 test suite through pcre2test
>> RunGrepTest: Checks pcre2grep to ensure its grepping style matching work=
s as expected with various patterns and input files.
>>
>> Signed-off-by: Shaik Moin <moins@kpit.com>
>> ---
>
> Hi Shaik,
>
> Thanks for your patch.
>
> Can you confirm the oe-core version your are based on? I believe the
> modified file does not exist in master branch:
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-support/=
libpcre

Hello,

For stable branches, I answered[0]:
> I'm sorry but we decided that standalone tests like this one are not
> acceptable for stable inclusion.
>=20
> For more detail, see "Clarification on ptest/selftest backports for stabl=
e branches"
> https://lore.kernel.org/openembedded-core/DGVX4XQ6VLWT.1HOMXA78ZXLBG@smil=
e.fr/T/#u

[0]: https://lore.kernel.org/all/DGVXD029L9TG.2EMNRFUGNCBVF@smile.fr/

Regards,
--=20
Yoann Congal
Smile ECS



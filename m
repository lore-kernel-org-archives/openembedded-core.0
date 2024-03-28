Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D9ECD11DD
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 16:37:15 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.1213.1711643826108318385
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 09:37:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q7SW5UmF;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-515c61a74e4so958068e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 09:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711643824; x=1712248624; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aWDhQvv/G2fCTGWIraUpzEjONPOZyBt2iw5zWilcvEU=;
        b=Q7SW5UmFa0H+/H9EMgxbIFk43l7Q/ecnx3Bjh23yTDLf1SFYfRNgLEfJsCzyOOnWrj
         mM1sPSFjK4A37n1JETFNqtlzqv1jwIyBdTG8SAjrSk8BgKd4lP7IUAPclZGTMFeAoq+c
         IlaSLtZ1SbYlK10JFbIsHK+Tvwp/cO52S1MhT015vuGXWerjRY4H2eEizNdN5c7mcwHW
         xoETaO9LAoonX1RjlKDQdcA139w863Mcr1eH6vswyddQzz7o3sjpLyAlig9He3wNESn2
         z6czyIOWcsOm9Dj8MBDmlyXtTrLOePC6St0xJYuGnS3tTSHjeBi/pxs0SGYsP3dAECg5
         JIjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711643824; x=1712248624;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aWDhQvv/G2fCTGWIraUpzEjONPOZyBt2iw5zWilcvEU=;
        b=M78xVEFBP9H3KdC1R3ufS6zp9YKdCt+RjnCrAsa2BqBB7s85LGPtOmN3Ac87lP8gJ3
         kz1Z+EFNXJzoLmxIIcQ+Hyz89OMOK4X62hEjIlu1aJsWprgINN1MXDdN0S5MYqGwDBpO
         xOcSV/ytpcEJEBMZaDL6rUMuKaCeTpzTtYof/dRW5BDbA9CCbb+BqLsv9vb3rx/F10mf
         CXX1U0Zzo6em8gIqlnBDDQ2uMO77l8V8HakOaTHOFvZ+G/9Q6D3O8x+8NkjR3HvqOl2Q
         yX6XMpqno3LZOrg2vurA/JLn1SaII/nKMjkQipWykHuGbaP2Xwx0uudBWd+v1240HM07
         pBKg==
X-Forwarded-Encrypted: i=1; AJvYcCWgunjYrNWTKzf01G3Rk2jLHpVxG1Jl2qx07vhjv8ew2nZWv2X67D6qtY1M5FGKtCJAcnoVX0ddmzG34IiR3Gpn8OkDzmym9GJPUpNQtbyWlNn5M6PoZ05q
X-Gm-Message-State: AOJu0Yy9wdO0KNeoMuO68ulLuZPKL4MIGtakyxRVt6ET94c42DE54Tbt
	uNjRG5sDoiB6S3f/f5lZ9OWhFliPtIOCJybHJPmWVxGIIzDgBUsc+LOZ4GAZylURnxywfOa56Q1
	QtJO0uJdbGf7Ro/GoebLJ24kVa5U=
X-Google-Smtp-Source: AGHT+IETRMYF0O1B1qvmcpKpiU8qUZQBWO2ENYPDSLrmaT7VyptQH0Gs38WMou0WzBBVLqsAvXOiyzkasGjDuCHeGoY=
X-Received: by 2002:ac2:58d5:0:b0:515:90e5:4555 with SMTP id
 u21-20020ac258d5000000b0051590e54555mr1761961lfo.16.1711643823891; Thu, 28
 Mar 2024 09:37:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240324111853.237AD1068FC@builder.sakoman.com>
 <CANNYZj_4S4KWy0YMdQuvnjEX5rMXO+rGyUemMDWQgw1z4+1OyA@mail.gmail.com> <CAApg2=RLShi99noHxjR4Rr7nVr84of0xk=7EhsjoXLJ=eA7fuQ@mail.gmail.com>
In-Reply-To: <CAApg2=RLShi99noHxjR4Rr7nVr84of0xk=7EhsjoXLJ=eA7fuQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 28 Mar 2024 17:36:52 +0100
Message-ID: <CANNYZj8sReO2GF_sG42c7SmjK0o8RrZ=BDsTcrfguBZf=6JgyQ@mail.gmail.com>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 24 Mar
 2024 01:00:01 AM HST
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: Steve Sakoman <steve@sakoman.com>, openembedded-core@lists.openembedded.org, 
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 16:37:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197593

On Thu, 28 Mar 2024 at 17:28, Marta Rybczynska <rybczynska@gmail.com> wrote:
> I think you weren't there at the weekly meeting when we discussed
> that: it started around Feb 14th and I see that in my data
> (I have a daily report).
>
> To make the story short: NVD is close to 0 activity since mid-February
> and there is no communication for now on why, what are the reasons
> etc.
> The security community is concerned and there are multiple ideas:
> amending/replacing the database, there is an open letter in the works
> etc.
> From our practical view there's no automated solutions we can
> implement right now. I have some ideas and it would be good to discuss
> them,
> the next weekly meeting might be a good occasion.

Probably alternatives to NVD will get increased attention too, which
is not a bad thing. This exposes NVD as the single point of failure,
and I can't see how they're going to restore trust.

Alex


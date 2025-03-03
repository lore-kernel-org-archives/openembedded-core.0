Return-Path: <alexis.cellier@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D9CDC282D1
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 16:24:06 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.57822.1741019043858383857
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Mar 2025 08:24:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=XOGlAz32;
 spf=pass (domain: smile.fr, ip: 209.85.218.49, mailfrom: alexis.cellier@smile.fr)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-abf628d653eso279026966b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 08:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1741019042; x=1741623842; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BT1UwzPNYDKqIt9RXf7VQ2A+VZv17rP9PY1gCOJJvKc=;
        b=XOGlAz32K1DeyBg0T2gaSm8zg6RKiEsmphs+dsSyuFpQ/8y3MxFni1R04TwGbBY0Bu
         VDInFQfDo4HI24SPp0SRZvjLluLNI0Pq2Y/n0oDS8PxjWstQJ7YC7tnq6mibEVWsLgED
         REVo1lq6rwNpnGe51OM7WgePyKe5JyDMOi714=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741019042; x=1741623842;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BT1UwzPNYDKqIt9RXf7VQ2A+VZv17rP9PY1gCOJJvKc=;
        b=oOBSyplxfBTcZPJDwPdRZtky+Mc94PuQF60x9Syo7OlioJWwiAUUZKbRSnv9GZTCzT
         lzdyxb9/Kws3ujyl7pC+M9AlUj5cY5whQfZz56hau0HyTiK36OPrUQotTdzeBT093Mq5
         LHftAiGTmMCm0pMfTVcsiDlVEBUG0SbJTNdBGhA0mVE47O1MWARyhGiNbIA+2RZYIh4g
         LkX5axHFOkmTbZVHnPImPU9nLKrAsivGsJCfI+mpIUGzf6OaL93E1phjihyJZttEhl0/
         26giHprUouvjplF1HZ9SpyUSgV2YXjV/8dixQSRTyOxbIig0UOtAGYsnHEk9yfF/KlPD
         8ZFA==
X-Gm-Message-State: AOJu0Yzz4WtdGrKii1QLPv+W0YtTBvlPKS8N3r06sjKhJT/REZjuHyzp
	pLj5Y1+boDlSJl35nwBxXIr6zXoHB6U9dv91h4vi3tUFrCQsmjRi2bvyBRNbI++fdjxfEcEnpVg
	fgE1R4IAmh6kXDNR4I7VkSn50PZGI2EsQZaF7WQ==
X-Gm-Gg: ASbGncvQ5j87WRZGxqwKu38nGa7zGv57NMPior3I1+yd7/da+dYNy6IsYUzpAKNeXR5
	8UfaVkf/vhAziQoV42hT9Yhh8LQ+Nh1hla2ItL4na8UJBDN3iT2KK+AGN98NjB5hu0F0+8s64jy
	21gtd2NKlJSeA8rjbChP8eadTgqTM=
X-Google-Smtp-Source: AGHT+IGgdDwzlc1nAqUgvVxsk6XH3f/5Pzr7RUItSzQKsBp+4idhKf1MHUHZV8OwFhIOmtypkNPl9v1Q7UVQj1TCDPg=
X-Received: by 2002:a17:907:7213:b0:abf:75ba:c999 with SMTP id
 a640c23a62f3a-abf75bacd3dmr661732966b.41.1741019042308; Mon, 03 Mar 2025
 08:24:02 -0800 (PST)
MIME-Version: 1.0
References: <20250303134038.102355-1-alexis.cellier@smile.fr> <c33ab1f9-9235-4076-98bf-c8bd163c6464@cherry.de>
In-Reply-To: <c33ab1f9-9235-4076-98bf-c8bd163c6464@cherry.de>
From: Alexis CELLIER <alexis.cellier@smile.fr>
Date: Mon, 3 Mar 2025 17:23:51 +0100
X-Gm-Features: AQ5f1JoUxwY5FL8RHNgbxd0m9Sq2MMjOYIxhtsOGc_wLrvBEs0iKJ1rvxcuveXU
Message-ID: <CAEs58j4staKXtJSoWkj8kauQVhz9NbUFZSR8YuV4tHFfqzBqNg@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] systemd: add libpcre2 as RRECOMMENDS
 if pcre2 is enabled
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org, 
	Yoann Congal <yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 16:24:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212220

Hi Quentin,

> On 3/3/25 2:40 PM, Alexis Cellier via lists.openembedded.org wrote:
> > [You don't often get email from alexis.cellier=smile.fr@lists.openembedded.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > The libpcre2 is now dlopen'ed, so it is not automatically added to the
> > DEPENDS anymore. Add it to the RRECOMMENDS list.
>
> Should read RDEPENDS I believe instead of DEPENDS, with the automagic
> mechanism that detects shlib dependencies and insert their packages if
> the recipe building those packages is part of DEPENDS?

The library is dlopen'd, so shlib does not work here.

> Also, why adding to RRECOMMENDS and not RDEPENDS?

Because systemd says libpcre2 is "suggest" (with its tool on master),
and I've asked on IRC.

Regards,

-- 
Alexis Cellier
Smile ECS Developer


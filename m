Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C696C4450A
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 11:25:11 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10574.1784201103959324649
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 04:25:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FaK4F7DZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso9418665e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 04:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1784201102; x=1784805902; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LzXHtqQNdlQzlcefUnqILgaDq5gpU2/OEbKm/8MW0EY=;
        b=FaK4F7DZ5PCbiHLiS2V3vSN+uxGXajceiedmf+4S0GVNbm9tETvzvj20sMilt/Mh1A
         81rK+hbZOqXJOtpgUxVb4qEwaMvKpvf73UqSzHIENyGXFeMxfeZcx1L+eVi9BrZa3uXI
         9PIxP6CDuDr3WJRcUj9qc0RfWS+jZOa1vgj6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784201102; x=1784805902;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LzXHtqQNdlQzlcefUnqILgaDq5gpU2/OEbKm/8MW0EY=;
        b=ION3OAccrNoPRC1FLtsywdkNa5gpZ0mLIfTNmez7b7jr+svQel/xLT3tEhCqFCILCV
         BdAnT8wzNGFRfro1r8pPjJ+N0za42Ib2nCOa1mS39xts9cxVPQ4DzE71u4PhERcKRcLp
         1P3V4olYCa0lZ7MIj0mpGavjv9hEmNYnXAFs2Rvh2ljHBC0T2273KvZeRWqyIdVk9H3P
         rQdeFLE/YII8j8mkWNYeibkm25HbotV6YYmoTD4QYQaChNT5tVTJ4WYNoBiQqoWIsjOe
         ulXMxhzC3+kB0mC/DJqRld2u6jKgV9rc9i75niQ+EFc11NTNthGxSBKKNBNKQ5g0ANsS
         z6ww==
X-Forwarded-Encrypted: i=1; AHgh+RpDj5TC8yCpxEfpbci3nRLyTCgznFnJbrztxOqeJhP9jNshFgSDel3KuV5J2rX0KomVm3TlOuApFxBACI0BNkWz3w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyBx+UtcozRqF+RKPc84BjgbJkVAq4WZKd+qdPXKOpe2q4KoBnh
	Es5P1m2cLpHzGEEiR8UOlGYmo7lsNywd+b/QcnnvWwUF6PhLeSH/bV3de/mBkJfICHk=
X-Gm-Gg: AfdE7clOd8P2AUgFRxddB9Fjp5bRP+HvlGD1kgZc1bsSu5IJXfNm2/YMAxaCBdNTCzN
	+xmHpEGgvt5FMlSJIO0abTZL8Hkqr0RUX9aVNJnB19GbYrmGK3CO5jSHgtabI87/W/xOK/aHjYO
	3n3QTIsyR/EZcuzGlvL3rGsi7fLfu0kp5KRTcD3r0KClu+Niq42PQZHqx4xilNCChKKw+BpJCk6
	dT1X9fu9UWe2OEPIJ1tyVn0bMegMW6kz93uzfUvrF1VvQhcMJ7rbHTn4Q+YG17VH2s+T+WuL+d4
	VBAghQvQRAuYjm7EqBPEmXjeilVXkoLCepiuDxhDDrNjUqqoMg3ElF8WtKyAv0IceCY4xuWNmpE
	3XArBKRwsReZnM3JN9MkfAFxl5b3MczfrifYCYTAZN5wWGp7P3qGk3OY2rD1RLxtB9ZvKa1ZMYS
	Os5W4EMb0jLiT45SPnWpy/lGgkM1f1n6NPra4rLTc/cnFqlhNqp5ZpWlKtH2EZblyoknGowTIW9
	utNgA==
X-Received: by 2002:a05:600c:564b:b0:493:e79e:da98 with SMTP id 5b1f17b1804b1-493f8837fdbmr160800255e9.39.1784201102061;
        Thu, 16 Jul 2026 04:25:02 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a03c:6417:d88d:c21a? ([2001:8b0:aba:5f3c:a03c:6417:d88d:c21a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541eb7372sm71390615e9.13.2026.07.16.04.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 04:25:00 -0700 (PDT)
Message-ID: <7e6827804a7b8da37204e54171d8fb9f7b490b35.camel@linuxfoundation.org>
Subject: Re: [OE-core] [[PATCHv3] meta: Add pam to the defaults if using
 systemd
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: leon.anavi@konsulko.com, openembedded-core@lists.openembedded.org
Date: Thu, 16 Jul 2026 12:25:00 +0100
In-Reply-To: <20260708143704.2643050-1-leon.anavi@konsulko.com>
References: <20260708143704.2643050-1-leon.anavi@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 11:25:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241082

On Wed, 2026-07-08 at 17:37 +0300, Leon Anavi via lists.openembedded.org wr=
ote:
> This fixes issues with test_machine_world when running the
> yocto-check-layer script for BSP layers that include weston in the
> dependency chain, for example meta-tegra:
>=20
> ERROR: Required build target 'meta-world-pkgdata' has no buildable
> providers.
> Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
> 'l4t-graphics-demos', 'weston']

Why wouldn't l4t-graphics-demos just list pam as a required distro
feature for that recipe?

Cheers,

Richard


Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D51C001B0
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 10:39:49 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.58516.1691491186518283345
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Aug 2023 03:39:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Tzt20/aE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3fbea147034so46935745e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 03:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691491185; x=1692095985;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lkjvm0bn5KZ1Zmk7dXJ7khJOmZbIWeq7QTn2DxZmZGk=;
        b=Tzt20/aEIHGwc3M3JXfl+OqJnicqmzv72Qu2/zMiNzsSWZUytHxtEkbn8KNGCxGWPP
         mcGVY6c1XwP6gLgaLEh/PiR0R0CZL5198lle6uU+krxLx8SzyQc9wYlOJ3acHohlZHvx
         6f/MvZ+tzh5f4+OVJyaJiTBR2YXrPg69CsRJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691491185; x=1692095985;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lkjvm0bn5KZ1Zmk7dXJ7khJOmZbIWeq7QTn2DxZmZGk=;
        b=WrNPF5VQkxYldgqkHR8FkX/TSjIKdeAUtb9FmCZgptXj0oWtTN2D80yurkEgFXnveC
         /+4fN0BLUYBUhBOixRvTyP9K2i/rbPpzajf1eicf9CLyQF1ASc0HdtU+uuyn52eiMZPQ
         dvrtED0lbui+eH76NzBfNXG+BrM1TGamxvBFW51ZDeGJfnx7BsoIqMzaTfkexoltCE3p
         kZvlZf2swWaICGzRZbAGkeXJwL9+7QTOhFVwnPLwANKAExKtmNr/70Nus+zwNeeTztLP
         QFOWLcqVdLChtEt0jUpO7QPkvAdhz5C5c/JsA90uahWL5RHBqkQgHbP3UdYoc8k5St/Z
         3YTg==
X-Gm-Message-State: AOJu0Yzh1jpOc1sVze+MQHTwj2ONznCN6QgP9doXQU3fV+9uFOkpabEC
	dEo5slhWMa2uIGgAFpmEd3t+oA==
X-Google-Smtp-Source: AGHT+IExnAr4PWO72NgA1kyt4Rx5RVjBSXk6uUMC/rIxrO4SIFrHI1mDsYBSNCIy4mzSYD5fyd98EA==
X-Received: by 2002:a05:6000:10f:b0:317:597b:9f92 with SMTP id o15-20020a056000010f00b00317597b9f92mr7550916wrx.57.1691491184886;
        Tue, 08 Aug 2023 03:39:44 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8c9a:4256:d8e9:42e2? ([2001:8b0:aba:5f3c:8c9a:4256:d8e9:42e2])
        by smtp.gmail.com with ESMTPSA id f6-20020adff586000000b0030fd03e3d25sm13139921wro.75.2023.08.08.03.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 03:39:44 -0700 (PDT)
Message-ID: <5811f5c5d0f051523649f29298b1757838b660e9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4] sstatesig: Fix pn and taskname derivation
 in find_siginfo
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yang Xu =?UTF-8?Q?=28=E5=BE=90=E6=89=AC=29?= <Yang.Xu@mediatek.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: "Ross.Burton@arm.com" <Ross.Burton@arm.com>, 
	"alexandre.belloni@bootlin.com"
	 <alexandre.belloni@bootlin.com>
Date: Tue, 08 Aug 2023 11:39:43 +0100
In-Reply-To: <5b4a1b35758598da483ae1d711150f892c89e612.camel@mediatek.com>
References: <20230713021659.23130-1-yang.xu@mediatek.com>
	 <17783A2A112CFD7F.19347@lists.openembedded.org>
	 <89e8391834fb349cff2b603545aee7a2742561ba.camel@linuxfoundation.org>
	 <5b4a1b35758598da483ae1d711150f892c89e612.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 10:39:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185657

On Tue, 2023-08-08 at 10:15 +0000, Yang Xu (=E5=BE=90=E6=89=AC) wrote:
> It is a elegant solution for current issue. I will test and update my
> patch to only include testcase part soon.
>=20
> Thank you

I did end up tweaking your patch to this:

https://git.yoctoproject.org/poky/commit/?h=3Dmaster-next&id=3D3a7945250784=
6756f6d78cab4dc4adafa0cb2be7

Cheers,

Richard


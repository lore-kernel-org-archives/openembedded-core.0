Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABE31C02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 15:07:11 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.12358.1737644823262532302
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jan 2025 07:07:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IBlgkf4m;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-437a92d7b96so10563495e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 07:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1737644821; x=1738249621; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zJ4lFofbUAnmCXgsja6hiGaPJz2VJtJIhgZJsCQJIVM=;
        b=IBlgkf4mCZNSXBMDoW50eR3tOH9D25cN1gTpuxfwwp7ZxDJrumd6G+FV72yJQqjZDC
         iY1Z2j5eaS9F3b1L08yvvgx+CliH7DR+hbsrmqUrh7wYPEnfGFWEbPiKhw6inRVEEhrZ
         UROvcAD1u+hPUW6B9Xte7S45uYdMIw2dHgG24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737644821; x=1738249621;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zJ4lFofbUAnmCXgsja6hiGaPJz2VJtJIhgZJsCQJIVM=;
        b=PjDgrMkPOPoXfEviyBgJbaMjhbaL5T4Z2y2ih18WsPz2gGU+Eu00NW/vR0kCRIEs22
         2FpccOoaccUjNu6/cORP4gmSt/OoDotYX3Th1mxNU/kUzaF1a4z2YqS2SPNWTwLS9iPe
         ykjp2UQ71oDiO5y1vFDiAMIfVBwWHYMgtta34+hWH0+Z0VUKlH5FQH7+B3etG25N/2ue
         jKBQiUwf7Tx96stnGqvPrNjOP0RC9MJa5Hebw8WkN9YPKdfovPMVgvIveQXF2Jk0daM8
         H12GdDqMlpAvYQbWrmJJ3IzvPv4CmnaKc1mTALJwx/H5TGJ9PpIzsDBaDwfjiCsHh+Yi
         VrSw==
X-Forwarded-Encrypted: i=1; AJvYcCUGQAhmg4ni6aDojO/L9z5cPm4VKZRI/6BlcfUjvFtoQj9EzDfObnuMSy5a75cpHrzBTVkjXs8gc+A+lXVL4rqJXA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwQAsAb/8pALG8cW/otRjAL6sHoz2iIZ1urJqz4BQ3QGS+PkPXf
	KU94db3Wwh8/eAvW78c83ux81xQsF0SivjMsGLIaLAmVQy8RQO/vbIChivRen9c=
X-Gm-Gg: ASbGncuBy0Rh3X+nJuDg2XZB7Pe5HxE9f5AiYOjAtauHxqOwTh1xZxtNu/L20CF3YPm
	9e9tapEmRC5kZPtjGEUS8EN7GtsxUFpLIoR1KbAX1SDrmq4V3u4/aKqilErKWbJ4upHAfsQPUJa
	EvcMowFyrMDDkYSgqpYyvD5ys+zj84h+zzMkza9jsW9cq0ErgMreMX0eLftsxrGNhVNHWnMY2t9
	OrA8DPq5BpFETTwj1HeH5P6ooQ3arCv1DQP7NhLbQlWYWUdhYf9tNatwzK94fyzIeinbrE/CDqc
	u8qFudzHbyp/nYJeEBLuNOLs9pm2uDW6glZpKdOsNkmac4wXO29+f9KQFyDdF4Qb5Dc7Rg==
X-Google-Smtp-Source: AGHT+IFLwK0MiP8NQ47S76dN6FFEqoN0DV/CHBj9fWKIKxGVMZVX5EoJhseQ7V5GTVDV4fWQhsuWlw==
X-Received: by 2002:a05:600c:3b26:b0:434:a0bf:98ea with SMTP id 5b1f17b1804b1-438913cd4a1mr228864565e9.9.1737644821377;
        Thu, 23 Jan 2025 07:07:01 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e9f3:6482:e693:9d62? ([2001:8b0:aba:5f3c:e9f3:6482:e693:9d62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31afb70sm66182605e9.19.2025.01.23.07.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 07:07:00 -0800 (PST)
Message-ID: <2e7ba5852015b3bc94c6e4a7d0acae2169ac0bdf.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] add basic b4 config file
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: foss@0leil.net, openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
Date: Thu, 23 Jan 2025 15:06:58 +0000
In-Reply-To: <20250117-b4-support-v1-1-fe74a5f50eb6@cherry.de>
References: <20250117-b4-support-v1-1-fe74a5f50eb6@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 15:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210192

On Fri, 2025-01-17 at 12:59 +0100, Quentin Schulz via lists.openembedded.or=
g wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
>=20
> b4[1] is a very nice tool for mail-based contribution. A config[2] file
> exists to set up a few defaults. We can use it to set the Cc recipients
> to always add, in our case the mailing list.
>=20
> Because we do not have anything to check for now, disable needs-checking
> so patches can be sent without running b4 prep --check.
>=20
> Because we do not have any auto-to-cc support (and the implicit one
> using scripts/get_maintainer.pl cannot work for us), also disable
> needs-auto-to-cc so patches can be sent without running b4 prep
> --auto-to-cc.
>=20
> [1] https://pypi.org/project/b4/
> [2] https://b4.docs.kernel.org/en/latest/config.html
>=20
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
> Note that this file should be overridden by the one that I'll send for
> poky by the merging script (no clue how that would work), i.e. an update
> of .b4-config from OE-Core should not override the one from poky OE-Core
> when we merge/cherry-pick OE-Core patches later on.

Did you send one for poky? I was waiting to see what that looked like
so I could work out how to handle files. There are ways to do that but
I could do with knowing how things will ultimately look before I merge
anything.

Cheers,

Richard


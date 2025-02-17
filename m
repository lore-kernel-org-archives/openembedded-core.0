Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62BE2C021AA
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 22:07:55 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.5955.1739830066705513352
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 14:07:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fPIlB7nT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-439350f1a0bso28974475e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 14:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739830065; x=1740434865; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DnGigU9//ezjOgxGzBY+CTZaQGyVX5Ff/6fOFoJPYSI=;
        b=fPIlB7nTxirHuz7Lf8+lnYpRQhtBaPbooTWdA02ZJ06gL21kejekpzF2DDJcMaQXFB
         GGpKCxMorkeqqHEnvJJSwI3lTb9PFU9RCSo4Vbvsb4x/7tEW7XdZYyOsIcmqQXoHN4hc
         PCpZSoHx4OzQEB6RxJ4weZn6qPHDT/KKNiPMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739830065; x=1740434865;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DnGigU9//ezjOgxGzBY+CTZaQGyVX5Ff/6fOFoJPYSI=;
        b=WCn+ak0zLVvi/FKUjX4iecTsDIRjpp9J6K8gfqUmizYhkmQlXK/9cP9wP/K6nnQlix
         z1x499IjLXFKqX2pM1dc1g6zcxs9nIfNOzq3exRAC97jH64PhosBfDaW/+OnwadUVrGc
         qUYvTnTPajNTG0NgJoAv+f5feM9+VIn9n72dIb01FXD9/ItwIA2lgfMVdEY9HkB/aByz
         VqB2fpO87Tdynt3UvwHxWlaZ9k+gQfJHzqZLwRfEgd+olEUAoBoXmVQ9IfRdp7lQfZe0
         p7dwE0l9Sjwruy0SnQyQfweS4CQgxlRFYR/QZ0g7jiX2zZNB1n+VIoAGB8WihwANgnU0
         IRvw==
X-Forwarded-Encrypted: i=1; AJvYcCUGZf8PptjA5RWemxjVdIbK7P94tvWexWM0d2O5J2SCLG6d7JyCkGpyJIhUi7+JUkxJpzTPQo/OfEVYUsim61xQRQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxvg3CTfrHnllIX3u/+sIOlYy04WOdlcPL1NTu65YRg50XqBPGg
	RUgaGEn4Y601GxkWSWdc2B18h9lLI+eIQyWmktl0sGCQn7KLdzZA3XvROAhPP3PtEJ9JOG+nX5B
	b
X-Gm-Gg: ASbGnctByr/xXsGY3YAUAzLKJytwqOVPt/42uCeTsIrFU70pU/5IG4KjYIKuWdM7Fg9
	khHjlB8COxERDHgMaT7kbgNLDkWKj3OpUZp/BPSUi+DaR+TUmDubKYLSRdzdasEjRFndZ1t/GJK
	Q8N8UNSyS2UX7fKdg8ghnEEf3JO74/WSskkabiXxvxbFz1kpsnBQkj2dmWl8MYC2XQdrcUj292J
	xcTKUt9s2Lqx9XLaehFKPJIBa0K8EinfSth1GQ4bs8JkXRGpW+OSyhsh6cR4AxmO6dzz/r+H4mx
	vpCf5TUWjrxr2tgA620Lltd6z/2bPALc1L70E+mGQwX14vbzX2rSk02MpxW0JsnDPQ3j+3L5BWi
	g/Oxd
X-Google-Smtp-Source: AGHT+IGywhQmq3PZLHnZNRu+KaStLOdR/K18DJw5iTQGaxzZ0m/I5krS/mZXAZ92xe+BaAT52OXUoA==
X-Received: by 2002:a05:600c:3516:b0:436:1b86:f05 with SMTP id 5b1f17b1804b1-4396ec7cb6fmr105559155e9.11.1739830065090;
        Mon, 17 Feb 2025 14:07:45 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:f127:df56:488b:353b? ([2001:8b0:aba:5f3c:f127:df56:488b:353b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439831f626dsm33068555e9.0.2025.02.17.14.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 14:07:44 -0800 (PST)
Message-ID: <53056017c68ec09e1ee4f5c580f021f6503ca11f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] linux-firmware: drop the Lenovo T14s compat
 package
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: dbaryshkov@gmail.com, openembedded-core@lists.openembedded.org
Date: Mon, 17 Feb 2025 22:07:42 +0000
In-Reply-To: <20250217152053.2164104-1-dmitry.baryshkov@linaro.org>
References: <20250217152053.2164104-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 22:07:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211555

On Mon, 2025-02-17 at 17:20 +0200, Dmitry Baryshkov via
lists.openembedded.org wrote:
> There are no backwards-compatibility links for the Lenovo T14s
> firmware,
> drop the empty compat package.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>=20
> ---
> Note, this is a fixup for a patch in master-next. I'm fine with this
> patch going in separately or with it being squashed into the
> corresponding commit.

Thanks, that helps and I've squashed it in.

Cheers,

Richard


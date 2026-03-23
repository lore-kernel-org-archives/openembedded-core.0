Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F00DFC72D2
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 07:43:34 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12145.1774251803350834462
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 00:43:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=LH1gjbaj;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43b3f91a7abso2239883f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 00:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774251802; x=1774856602; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=09RTxrqIeWcPXS/7BSaO/e7wZ5yajKjCPh4tmJDFwKg=;
        b=LH1gjbajc+gscNHK2kasBAFntWBL69BV/n/q0cGoi7rcABJOpxJ2BeWN9Pp3hWB0qy
         RPa8RPnl6nwWCWH95T+wdKmIhcQry5OvB3+CEpl3qF8qx/eb7PQucy7t5veogoDBOuVn
         HYd4gUqgtIBojlVElg0GvJd52K7+PdKQNrRaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774251802; x=1774856602;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=09RTxrqIeWcPXS/7BSaO/e7wZ5yajKjCPh4tmJDFwKg=;
        b=q+XQpJTAzDtjcTjY3US9HsI1ejFBmlDjq+nHNQYtNv4ZXRQNh0+/IqtJ4SIomn65bq
         oK8fJpsHJVekmOgz9nhslwN8JLaS+QPhM9D/qUuTxZbT4lQbEIGiuc4gyqVoRPYqf8XJ
         4chTH+2pseS1RHBIaJpm1cTqbfmJSZ+DKa+wcXcnWint6vff8f2DbNmQjElnMcPWd319
         rLWaXSRAnThalWQH8rk7V7Mqs/hdSsN5CHxRyglPvEqyVhBsHtS+Cu/xzPOcKB3t4vu9
         56LTp6uADnOFU89J0K7JZ6KLzcM2UfgIOkyqOYUedxgSwh5Ur4Hy2ecQJyxLRERXVcT1
         zFzA==
X-Gm-Message-State: AOJu0YxxkEEevs8eOlJJkFzyU0ggzsQIBnFr5iMsvnKusGf4SLjM2TOj
	ZXbZXwrF04FqPp2/frtcZADubwTlmfS7h5QGGzifPNtpk95pjrJkTskjITr33G9FBlU=
X-Gm-Gg: ATEYQzxVJrrqHYDz0dLv1J6e/y160qWDBL6TTQ8IJhU9BQvNCSN/VT1Ux1QMxq5eRAX
	fMw7qCgLmZh4CTwB4bv3fcarmM4TQSEdUhYLvrgL3CPdMRlGe5QngggoWgS3BhO/G67KAzlGwmt
	D0aYgO0eeqnsM9cyx/yR3OcUzEgoNdgD5mhFdwmNQpukHeHOZ8G+6hznnYSTcJI66PJpCbBezUf
	wuKa3d1eAZRwl2NRzC7J4YNJ2w6NRUOGYWIN+glKHv6vb6PQu4Rb7y16Ep+i54X/hTkC3KbXfg1
	rDpFzC/DNcLVtTIEWZw5Rxjzip8wrvNqyQExqghZ46uaqRnenkwPnwTenTa2+CGrcPyBLTHEhtf
	GPn73XOi9r4yEbB3QB/pZep0oonADyyZbu8Z23pcrGCBZLmyQvtxqHJoalBoClkJDjERu59eM7K
	KAfoUlOE/vZv94xbKnyyN6OSSWXWfv3JJTp3OymCweZoD17azL0Oyw7kwX3pC89w4fplPwsgCHj
	poIsuu2Mzmn
X-Received: by 2002:a05:6000:2086:b0:43b:48e3:fbee with SMTP id ffacd0b85a97d-43b64286faemr19733221f8f.37.1774251801601;
        Mon, 23 Mar 2026 00:43:21 -0700 (PDT)
Received: from localhost (2a02-8440-2603-37a6-106d-0af5-cfe1-5996.rev.sfr.net. [2a02:8440:2603:37a6:106d:af5:cfe1:5996])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644bd38bsm27523167f8f.10.2026.03.23.00.43.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 00:43:21 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 08:43:19 +0100
Message-Id: <DH9ZRSCWASPN.1MAMGGWBWH8WO@smile.fr>
Subject: Re: [kirkstone][PATCH 0/2] linux-yocto: -stable updates
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>
To: <bruce.ashfield@gmail.com>
X-Mailer: aerc 0.20.0
References: <20260323032509.1590084-1-bruce.ashfield@gmail.com>
In-Reply-To: <20260323032509.1590084-1-bruce.ashfield@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 07:43:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233704

On Mon Mar 23, 2026 at 4:25 AM CET, bruce.ashfield wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> I saw Yoann's message about the last kirkstone LTS release.
>
> Here are the -stable updates I have pending for 5.15.

Thanks Bruce,

I'll include it in my next cycle.

>
> Bruce
>
> poky (2):
>   linux-yocto/5.15: update to v5.15.200
>   linux-yocto/5.15: update to v5.15.201
>
>  poky:
>  meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb   |  6 +++---
>  meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb |  6 +++---
>  meta/recipes-kernel/linux/linux-yocto_5.15.bb      | 26 +++++++++++++---=
----------
>  3 files changed, 19 insertions(+), 19 deletions(-)


--=20
Yoann Congal
Smile ECS



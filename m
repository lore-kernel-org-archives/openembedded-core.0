Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE879C982D2
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 07:25:59 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5995.1789716355311848543
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2026 00:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SFFcQjwg;
 spf=pass (domain: smile.fr, ip: 74.125.225.76, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c2790ccso201068f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 00:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789716353; x=1790321153; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8iumHY1RS32l8e+SPDO3KjczAeaA7W7a6JBuv6Dq638=;
        b=SFFcQjwgtT8JUhJIYk3cXffDAnE0/TeYs63/lqf4uF1KZT3o/HUxVoq45xiBC3WxvN
         /1oFEMOZLoLDxOoLnGT9/td4Imnj2HNOIQNkWfcBtQSia8ZLDEPz0Adh30arSfs3514z
         k+uykqml4Q31aik554SjhOR0zn8dNh07v1fgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789716353; x=1790321153;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8iumHY1RS32l8e+SPDO3KjczAeaA7W7a6JBuv6Dq638=;
        b=LD9QTuIGS6gLFxk71lkmyx9X8L6J7BEY4nf7BUJirqskV503sJVVIcfbAmDmi7kWNh
         0v3I16PiKWiK22SsX7MOO9I0iYxb4uhQmJAvWu1WZASJW7/EHXulatoYL9ehsudKhCAr
         foGhmUhFnQFEjlYCCyDd+07II7qkhe9PmGqKh142w65988sKcnXgdiSwN9ZUTq8znHgA
         bDV7LE9Ya1p7tiGsxybanZ5IWSCYvLd0zpBwSM9zI58jU1C6bIIg1Y4J59ei05CzWFeH
         n1YsajWzOSL3r7tqSVSpLKNZfCa3KdlC0E3wUnp+NVIyjR2BLT8av9/yP+pprVZx9hCL
         WUwA==
X-Forwarded-Encrypted: i=1; AKwUvBxPDeklz5cwZ7NzpJ3T1LK5edXb9jbkK+zLIWwnWmlyr6PW5lkChORkgSGneIs2CKKWtuyp8Am6FIHgeoyG7F3tSg==@lists.openembedded.org
X-Gm-Message-State: AFuF++m9DNC9rC4KUPlN3QXLC/3GRHf6I5Xtf7gLtKilr+TfE+AgAl2T
	7V0gsev1lMInv5KifcUAB6KlOZDfLn14LpCp9dGS/v6vqF7Mg9CXhGtXwXyDl7/pkEc=
X-Gm-Gg: AYBFou1usZ/jPuv/Ep4wcWVwoBjBG772Hh7gbm03rVExHX1cJKXno9Qc9us6NJaDZ6+
	443tPAzXvZ5JzvQqB5aU3cKt+g5A8ujtqSzcgmFgP1I055VFVB2YsKI0vv9SXbmWv69bKAtQghB
	bUTj0pzzFFqYv/aPdiP7J0X4fF+0dR/7Bqf9ckj5iaMa2wvxVr93Kl8WMGWPFqdaKjXNIUI1U2+
	gqQoOvpfb1PEMHj/fFZJkPsMu0h+qbm0KphLI1ioMXyc8+2pTCGP9eh42kah2kRUJbGPTCeU86b
	cZyrHenET8MtF6iSWG+U5re4lUThWyvfHA7mdN3FLvXaQACaFMpbTpbxwm/nXHzk+GPQLvgW1S0
	PDwVvwChWV9Xxp8YI/sjEQoO/Q/dnOGCeC6Yjq7BEMWGbc/70+fBhCbC7UH9wGZNd/GKaJbmlyX
	P90PS5OMvrMdBu5Mgk84SwtkFLyn0vuWQDm64HNTszLzdkz+5FUyMOhdCHNcuE6tKoVD1U40t9c
	gN/WNQmSYDtQB3RU7LFi4NeigCBUqWO/EuGeyh10nsiNGv7gpBsXvUxAHWWDky+ymDbg7fI7Q==
X-Received: by 2002:a05:6000:2084:b0:487:1266:628c with SMTP id ffacd0b85a97d-4871e20d088mr3528035f8f.2.1789716353508;
        Fri, 18 Sep 2026 00:25:53 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487203f077fsm1485413f8f.26.2026.09.18.00.25.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 00:25:53 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Sep 2026 09:25:52 +0200
Message-Id: <DLI9HY4Q4MXH.3C05W2ZIU6AMU@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH] linux-firmware: split out iwlwifi-ty
 firmware into separate package
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <danishanwar@ti.com>
To: <a-garg7@ti.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260918044632.172417-1-a-garg7@ti.com>
In-Reply-To: <20260918044632.172417-1-a-garg7@ti.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 07:25:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246192

On Fri Sep 18, 2026 at 6:46 AM CEST, Aksh Garg via lists.openembedded.org w=
rote:
> Add a dedicated iwlwifi-ty package to allow users to install this
> specific firmware variant without pulling in the entire iwlwifi-misc
> package.
>
> Signed-off-by: Aksh Garg <a-garg7@ti.com>
> ---
>  .../linux-firmware/linux-firmware_20260410.bb              | 7 +++++++
>  1 file changed, 7 insertions(+)

Hello,

This kind of optimisation/cleanup change is not usualy acceptable on
stable branches. So, unless there is a compeling reason, I have to
reject this patch for wrynose, sorry.

Regards,
--=20
Yoann Congal
Smile ECS



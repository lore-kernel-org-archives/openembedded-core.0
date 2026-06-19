Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E21ECD98F8
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 07:51:32 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37762.1781855491026836769
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 00:51:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=fT9CxBNI;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-462342ac290so2061578f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 00:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781855489; x=1782460289; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0vf7vjfSMX1vzR8t3Qo2FakQGRt50nsPLba9EsSa1UQ=;
        b=fT9CxBNI6h1O985QARRU33xwYbIJ2fg59IhN/ndkInhhStVvAN5mnZt8CdbeM8J94h
         TUE4TzO73WOtFeMBS8cR8J1ulnOIuSccaq+evDYgSVEqGRNcfpOLG4i+mFC/Iz7xkwRA
         EghH8a9ZDbV4/Jra8MXtNigIeAQWOzfFQTUFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781855489; x=1782460289;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0vf7vjfSMX1vzR8t3Qo2FakQGRt50nsPLba9EsSa1UQ=;
        b=h60GNOPCiDGJowFK8gj2OFogbzTwbBd7knZzdPXeCVmn+K+c2OVxqjP83RLR4I1ntq
         URRBg0grMgf8WaX7Jl6azHMFpN5GAMqglRssWjw9gAew2KaDyJQD6Nn58lV7davIjnoH
         RxGZLYGVbTSGFJcXqqZ1YEOb+LjNrezZ32fncC32O6+9QLA0KJpeuxOu1mL1ecNN59k4
         v4+72N+oZmAz/Yl8x9xN5/lCIHJJZMnzNnpZiLo7IBNO3YdpYWCIBo5BkJnFY7yNbBjw
         euRcrcwwz+RoHAIZlAqGxefWpbBWqdInWk604xFkGQFFgCk4a18zT1dVpB7d8bCsSQYT
         ZsgA==
X-Forwarded-Encrypted: i=1; AFNElJ/7tlfKQJHEkoIt+rUmA0aLVxrTY/HJUkBwNrsKAd6HaNxHmrzEQB2ruw9TJGJbpXCmiSK3/Irk4tZvyOGPj43zVw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzKjXT34cRDTclcK7AfELcwTuJe2kTZWDFY17CBEhw4MvUkeqJK
	6z2C6ExAohcGO5P3cDYQ+tWMNJo4QeUul05KEwD3KItM7wyhNPrs4Y3iYxNeIoszhJE=
X-Gm-Gg: AfdE7cknnva0wF/sjfqgzoviJ94dgyxGIHT/GpwAkBKDBvdogzCE6Uh2KVHS2P9mkfZ
	lgxKDk3n0CbsBstCQlZirSStiuORIBMCNh8pU0Q3e62P0jlcmIqD4soIzoygtubdXfJEau/dooh
	gmH3GhAxngSYVTC2/t562Zn1DNUjUwm6S3uncp+2x4KVhyGWI+CG2J1iYzCbMsoYDKF1HIcLAxm
	/SofcGErbrpcqvnyIEkqwVY+lTEJrXzmFHgn57IipvTzJyP8WdOW+Eo3BL/AIwjN1VHzYgLDvwr
	YPv/aoSR00nF1o8HN5kErXR+5uBmbj+Sge2Ev9UWMmnL62VG/zWVmtIsCAT0wn2Qm9MJe22bHan
	FfWI3scgSNiaJblyqIrCDY/mbRfbJ7Jyjp0V5W/FANuS+tRKGGdOE3jQLMqEawfP8tUSIobQkrF
	OniZbMW2CMNt9m1q3wj++3VNep7Z2GDuMD7fzhDRiJ9nY21u4bswf9L165HFj3Eoo4t2DjjYGXH
	kLgxwLr/aSaRzU=
X-Received: by 2002:a05:6000:400d:b0:463:dc04:a848 with SMTP id ffacd0b85a97d-4656c69b9bcmr2141827f8f.16.1781855489173;
        Fri, 19 Jun 2026 00:51:29 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46508a0546fsm5672708f8f.2.2026.06.19.00.51.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 00:51:28 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Jun 2026 09:51:28 +0200
Message-Id: <DJCV1YSQQZEZ.2A0D7446B7SLQ@smile.fr>
Cc: "Richard Purdie" <richard.purdie@linuxfoundation.org>, "Antonin Godard"
 <antonin.godard@bootlin.com>
To: <vanusuri@mvista.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][patch 2/5] scripts: Fix typo in
 pull-spdx-licenses script name
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260618070328.650509-1-vanusuri@mvista.com>
 <20260618070328.650509-2-vanusuri@mvista.com>
In-Reply-To: <20260618070328.650509-2-vanusuri@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 07:51:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239132

On Thu Jun 18, 2026 at 9:03 AM CEST, Vijay Anusuri via lists.openembedded.o=
rg wrote:
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> Fix the typo in the script name since I can't unsee it now!
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 2776008404eebb58bb24e02140ed18760492752b)
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---

Hello,

That kind of cleanup is not generally suitable for stable branches. Is
there a particular reason to backport this?

Thanks!

>  scripts/{pull-sdpx-licenses.py =3D> pull-spdx-licenses.py} | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename scripts/{pull-sdpx-licenses.py =3D> pull-spdx-licenses.py} (100%)
>
> diff --git a/scripts/pull-sdpx-licenses.py b/scripts/pull-spdx-licenses.p=
y
> similarity index 100%
> rename from scripts/pull-sdpx-licenses.py
> rename to scripts/pull-spdx-licenses.py


--=20
Yoann Congal
Smile ECS



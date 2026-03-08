Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 305CDEA853A
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 17:28:15 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43661.1772990892248444647
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Mar 2026 10:28:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=eAKezwQn;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4852f73d0a3so8680455e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 10:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772990891; x=1773595691; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=umLK/zqaTYzGPgwk1BwySB0ak1QerKfSQN6wp1aXe+c=;
        b=eAKezwQn+Ca8ZsJEicooXaekALZbMWPrztm9Zwm6ObslFabLgnKhECIgzvepYFPrV6
         /7KKEXNEuccteyC/nkSv+yTA+MJ44NW97wI51fd2znUD9HPi03WJ4ek+YVDEwLXZ2/9z
         yscU+WQGDESYuR8zI2P7s9HRW9fVJ7UJ4WWFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772990891; x=1773595691;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=umLK/zqaTYzGPgwk1BwySB0ak1QerKfSQN6wp1aXe+c=;
        b=gN3D7JTz74teJ9aY9RYBt3hSdC9G0AyQLnKSAMoPoTpiaYj2hkCPHlcmwCn1E9kLY8
         uZH7KEcCpQ5tB1F8dI+onQe9qFbhYLiTHHkX2B44GOLeMNUgryQWa9J3MzvboJM5DzgX
         r7+J0fOmycxAqPnZix6CB50ERIlD6yIFJqVBwHvAj/WfUlCF1z/CqqGzV78iC5be0o2B
         RG0LThnv4YI2LV31dKPTKpaiFzc71FCicyRnxdAbh4NR5znTg0th709ZX4Yy67nVGdBn
         6UKRPkpnN0k9040l015qc8+YJaEk9kkItvSTiQea+k0utH0ondc3kz7cmP4mU/9bjvWV
         zpZA==
X-Forwarded-Encrypted: i=1; AJvYcCU2Iwsro1OSj1lyNB1NQ/2ZU8DJ2X1p9pTLnfcsIAm9gaCgPyfX9047aGMRWfaqLPlWNsosFOpYMDmYjp6etwVPUw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz8uzuJS3m63rKQvPLa396Wew3nKwYsLJHlYMs5Dv0zAzHh9l3t
	mcnaZSqC9UbpsTEnqH0uxjKhxjYLqCo+EoKdbADdI4VCDipFuJ6WoBjL2/6k0ZvF/hhJOOENmLo
	KE+eB
X-Gm-Gg: ATEYQzxgmjHmul+rz2MAGr3YalmQSpPRaEmUXhGs2Y+4bdhqza2g2Dqy3K4yifaMsAg
	KtKSuSamKfNv/NAWbWlyh88in1FWs7kIgKOWdv/mS8aMEKQIRWV4hTsVfmRGdmofSuQ+tgi5Xr8
	pbZ0U1VsJYSt9RQIK0GUzMFth1sA+RntJ+4WxEgUT8i8yRSSSOCflOglNgTjBPV3j7asq+Vw7Ys
	LSzEy9lKB0zULJYGTA+hcD2d0TYtL3EPj8cNgOquwrd94KvSZ604I9TDpO/9y9Vr/nlNBaJ0G5S
	J51TGKdmbrBLMA9rs0+vgkm/pTY1iJ11hdiPreUN5t30HuZOfashSRGOPlldwnUnmxPiJCRkwsm
	ecPvg60TCpaykTffW/svPqQ6q9Kl7iTI0NDtCXdDRfVf+xXFMq2xWw5NPPlkQ/GK2keFERqXWzL
	R5DLNKqmiTydwGjwAeQwc0rhsOQFSiZ6FXdWIeAOHlvJpWnilpwmeUeXHtKQb5iNv2gwsLZSi1d
	XqnRwcaNrZHwsewbwN2ZQXsdw==
X-Received: by 2002:a05:600c:4445:b0:46e:32dd:1b1a with SMTP id 5b1f17b1804b1-4852691c6d8mr142979295e9.7.1772990890464;
        Sun, 08 Mar 2026 10:28:10 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4853a310b8fsm37226145e9.11.2026.03.08.10.28.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 10:28:09 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 08 Mar 2026 18:28:09 +0100
Message-Id: <DGXKTE7E7WL1.2Z7PP9EG0X8QV@smile.fr>
Subject: Re: [OE-core] [kirkstone][PATCH] perl: fix CVE-2025-40909
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260227083801.544222-1-hprajapati@mvista.com>
 <245205.1772799390337939697@lists.openembedded.org>
In-Reply-To: <245205.1772799390337939697@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 17:28:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232668

On Fri Mar 6, 2026 at 1:16 PM CET, Hitendra Prajapati via lists.openembedde=
d.org wrote:
> Hi Team,
>
> Any update ?

Hello, I'll get to it this week.

In the futur, please wait for 2 weeks before pinging a patch. Depending
on when it is received in review cycles, it will most likely take a week
before I look a it. Two weeks before a ping seems reasonnable.

Thanks!

>
> Regards,
> Hitendra


--=20
Yoann Congal
Smile ECS



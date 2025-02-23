Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCDEFC021B2
	for <webhook@archiver.kernel.org>; Sun, 23 Feb 2025 23:14:32 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.77674.1740352463512848409
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Feb 2025 15:14:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DPyWYgBy;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38f1e8efef5so2204476f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Feb 2025 15:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740352462; x=1740957262; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kLohfX6gSgP6HHNBBJ6x74mYprn14024UE5B8T2AY2o=;
        b=DPyWYgBy9snenWICEVv0LDnSHxLGt4cxjcxm1qfxRg21cixMjPl0pEjRHTvwMxLsOo
         WWjIAVL3BOaZKmHWdtrduYDsuvwEjktt25pI0FkF0BXu6EUxSfVKackDIw1JRAreumma
         GCkK9MPAavj9MRpdQ7wQrMcnpi90U78MfSuHjyxPe/Kyh+Ewn17ruNRHiQo7rqfY23KK
         rlG8kiMPLufy99/gr+EqiwWAn59BPOt4R6eqXaYpR51Oqoy71mmCSTws1tS6xa4Ueu8n
         bmkYC/jrd4XjeH4tNWFLieAZcbXiY2YWsFzwbwGf3cSLYhrMMBf9y4AOofEQOf6pJguT
         ADCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740352462; x=1740957262;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kLohfX6gSgP6HHNBBJ6x74mYprn14024UE5B8T2AY2o=;
        b=s0FcsAWPMNNPbiHIZWcqbc9lOvukDeY3l6Fm4oadTtNyPcLWH5EWBNw7b5wmdAdv1K
         uQjfRMUMGRdglhSCkfb+iSWQBKX+NYwST6oxOsQXrhVRu0ErJobZw0CtBn8iOtlUH4en
         nniYPlvxYG2nvVwpR9l0IGQ+KSwzzyVWajATW70IB6EI5SStpDphOUWFxEwU7mbX4oKE
         6RVY2W4cloQzOVjcn+6qw3wSBG3U8RJkAevMyCt8j91JxOXcR6ygegvNmrURk/XPI2uX
         A/+8pjeKlYpDrFRKpiSq0c8APXTPnY6CRQgllVO7MxNEkrnyFBicr24MOgADEnykJg0Z
         O+eQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCwLELMJcoPhL27C+DEdHKkQoO3SrGraBW/pftWCz/oKqm/vZtGXtyyXLmjv6rbLllJLNLl8KneGB8Rgx+KBq6ow==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyD2h9u8mk8O5FIwLWA4e3Dn2XML186QgQk60VFdE0SVilyJwKg
	WUppJMWsW8MVojtX8LtvtHHqGbuYvSsRYB9ApDIGNydLJeE4nkyN
X-Gm-Gg: ASbGncvEvf0Annp1mnGYyMxkMm0oBrOzRQ0LR0SLxOUo7/JuiAVmBIOJdGPuKCKiZRv
	NRYRVWloP6IMbAl/Y8twNunm24hj+wVB3uqwuW+ArNaNWA3tQHLh1V6HK9UYBhQkTP++crKL+5x
	vxXAtQDQIUS1Mxcq66jpFGt/Gj3qBNw6HPqmVc8b1Uv4A5cJmOOTJPBRf2ZjVxZnuzRHcAUBGs0
	/ozjlbxP+BVmqE9CMro+wvkHP/MiAgdi9TQpBX/UPH8z/urQziffIHmwbYTvfrj5qtjS08i1Ovu
	ipgrvrD6M7l1J3MQh3S27vSyZ2wbIXjAIHTsr8fWCI7ISu87JlW+wdHR9KdjmG9UWTuYeH8W7rk
	/
X-Google-Smtp-Source: AGHT+IF/3O5Xj/ysay6x0k0xKQnp0dqS2YUqdfF4crMvEszdXneym+eSnCGFdPKfuvoEE59N517d9g==
X-Received: by 2002:a05:6000:1fa9:b0:38f:3aae:3a0f with SMTP id ffacd0b85a97d-38f6e95fe2emr8900480f8f.22.1740352461755;
        Sun, 23 Feb 2025 15:14:21 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5ee2sm29586987f8f.80.2025.02.23.15.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 15:14:21 -0800 (PST)
Message-ID: <595e728dc77eadf27430628e2ce701577774df7f.camel@gmail.com>
Subject: Re: [OE-core] [PATCH] u-boot: kernel-fitimage: Restore
 FIT_SIGN_INDIVIDUAL="1" behavior
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: marex@denx.de, openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, Jose Quaresma	
 <quaresma.jose@gmail.com>, Leonard Anderweit <L.Anderweit@phytec.de>, 
 Quentin Schulz <quentin.schulz@cherry.de>, Richard Purdie
 <richard.purdie@linuxfoundation.org>, Rogerio Guerra Borin
 <rogerio.borin@toradex.com>, Sean Anderson <seanga2@gmail.com>
Date: Mon, 24 Feb 2025 00:14:19 +0100
In-Reply-To: <20250222002047.319479-1-marex@denx.de>
References: <20250222002047.319479-1-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41app1) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Feb 2025 23:14:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211831

Hi Marek

Thank you for the patch!

Signing first the image nodes and then the configuration nodes looks
more reasonable to me than the other way round as done
by=C2=A0https://lists.openembedded.org/g/openembedded-core/message/211761.

Here is a branch where I am trying to improve the related oe-selftests:
https://git.yoctoproject.org/poky-contrib/log/?h=3Dadrianf/oe-selftest-fiti=
mage-cleanup
So far it is unfinished. The kernel part is already in a usable state.
The u-boot related test cases need more work.

Regards,
Adrian

> =C2=A0
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211814):
> https://lists.openembedded.org/g/openembedded-core/message/211814
> Mute This Topic: https://lists.openembedded.org/mt/111319286/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> adrian.freihofer@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20



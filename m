Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85276C02187
	for <webhook@archiver.kernel.org>; Sun, 19 Jan 2025 20:05:37 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.22381.1737317131583923537
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jan 2025 12:05:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jgceZiZy;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385d7b4da2bso3416958f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Jan 2025 12:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737317130; x=1737921930; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1BlLXUOhGSGw2XrN1YZ5YoAqeGJWZrFq5MQWn/glYL8=;
        b=jgceZiZyAEfb5zH1iWA2NKbqPqsRBRsoVZLGTf3U0Y/vyLd+mw55Fxtu1BH0tU3X8u
         xflj2fqKDnV5/CUJ007miUpmwpBY490UGbePaomxRwVszlk2q0V5mFykxRk5RZyw6E+e
         MqZZ6aeViEaCshq/DnCkgQKA881QNmTms3G3eiZk+ll4RUbs4MOX0UtUUGt0t7BeK5lt
         hT26j53/iuA76y5c+0b9unJ0zCM0hZNWmrSzlEtKR6fqn+p3JQ66C1xYW6Z1nfa5YAHl
         yzEEwxpdALDGmYwmLV9m3x2Nf10w0nCPwSFRDdEoGrVoADorsCuEW/P+gR5dKtTn1L+N
         ydcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737317130; x=1737921930;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1BlLXUOhGSGw2XrN1YZ5YoAqeGJWZrFq5MQWn/glYL8=;
        b=XPqLkv8j5m2mMftyWeE5iYkoVwrn4D4cDbTLRpOnKHgzi99Z+u5hQzhGhIKeZHK8g5
         mY+9i6KpuUu0CNRlLO/EcuMHlNPGAITzjYOyLRxMrzLbC7iPdgkqxH79GWoO8YJJlI2Y
         8soUcHPgEEKwA5RK5A+Iw/k/nmNw1rBEC7V5H7/wAsSeA4BdZ06cGMJBYA8F0/0we8WN
         0Nr+zmaq6nW3Cl3LPr2/qEsCutzaGlEAwCZdNNVyKJn8hOX2CW9HqAxOaY5Tjs9S6aQu
         gEZrChdRQE0BecosRbjXZp0emI58dKKeJAXUk/BTByll4uuBzlGkyOTFYE6U2lgBVBpv
         F+5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVo7RPVIp4rlz0QHQOGS5aYclmp2mgcttbnd9Pca3mkMyilp2Js7AAgH9hSyUkt4hKOsWtLsuwYAs2ZFtFhXDlFGg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyLil0IH5MX8JNjhJWiN0u54E1AcxS+RrbyeK4eJNh9fywD5YQo
	i7KmRdf9z/Ngnfx2v1WYoLqsf/LFY0vgNUEX6Uksf8uRAtqOWbqb
X-Gm-Gg: ASbGncuEY1J0ptV6VYoZq84wqwKuGrL0rPSO/iV1VpGGRA0fziBqAxxTGk2g/mPLMXU
	5grbNi7cHu0/Tp8F2bLnVIJ1iaiPfpA3a0f43a95thVSTtSKM+JKAA4PocfNJi4YNnbSZsdr4v0
	Dp2Cc51gjvnrtoCvGPUCPG3BToBNsV5FWod+3+f0QKw+maidNpQM2cecL7XSHlNZQ7n0CWyJJ+d
	2JAiqc35S2DZHD97RmoZ7OY7icC/rZIcciFroHcHtxZs2m3oYTfbZ5XvmDDWdZLtNztRQh6Rz9w
	s2mFSshxoQWyynSb1JdQx3oanQbv3cRqVFopiL22z+s=
X-Google-Smtp-Source: AGHT+IFceuYXyhpsBgtxVDRg8fAWYSYsw/HAi373/5/RB4Ja//fScvOmNFg7WZa0niA39kIZZDEvpg==
X-Received: by 2002:a05:6000:2a9:b0:38a:50f7:24fa with SMTP id ffacd0b85a97d-38bf57bed8emr9784973f8f.54.1737317129640;
        Sun, 19 Jan 2025 12:05:29 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf321505asm8313557f8f.7.2025.01.19.12.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 12:05:28 -0800 (PST)
Message-ID: <aa7cdc322dd11dfa7942e7306c111b7918132ced.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v5] u-boot: kernel-fitimage: Fix dependency
 loop if UBOOT_SIGN_ENABLE and UBOOT_ENV enabled
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: marex@denx.de, openembedded-core@lists.openembedded.org
Date: Sun, 19 Jan 2025 21:05:27 +0100
In-Reply-To: <20250119180926.41739-1-marex@denx.de>
References: <20250119180926.41739-1-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41app1) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jan 2025 20:05:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210019

Hi Marek,

Thank you for fixing this bug. I think this v5 looks really nice.

Not sure how to add my
Reviewed-by: Adrian Freihofer <adrian.freihofer@siemens.com>
but if via E-Mail is fine, here it is.

Regards,
Adrian

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210018):
> https://lists.openembedded.org/g/openembedded-core/message/210018
> Mute This Topic: https://lists.openembedded.org/mt/110702086/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> adrian.freihofer@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20



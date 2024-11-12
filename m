Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A2DD32D7D
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:35:46 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.82585.1731404141966544680
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:35:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OMbVp4hK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43163667f0eso46300135e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 01:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1731404140; x=1732008940; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2a6twBpy/OMiSnNigIT9qh626H47kEy2PxV3tSLsTI=;
        b=OMbVp4hKNIc9T3hVPvDQrpPgxmypdS0qVfULROR4ZPAmWI0xKCi10A8UYbeR9aaQyl
         SLAkJGWZoPxO/p97D6Gwb0NoC3vJX0bN2U7LPHfo1yykG+dBj9T2DfqBSxLK+c3OfHep
         m5OicYgR5n27qSbu88R2+/4ouSazIa3lq1who=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731404140; x=1732008940;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J2a6twBpy/OMiSnNigIT9qh626H47kEy2PxV3tSLsTI=;
        b=J0YdhhkGV3WTxXllNQHgbx0kCi80FlMShMk11sqDXp2IHZdXkHQzTdbKN3OFWtRq3y
         lMlrbiW6EjJ3dfF0ViNJDt2onLOZKrRCXcndA/I2uFcjrX13HcPAVi9vGOYIwbEhyIQF
         cZHdoOLoNixtHEbJ8vUknVsp/rSgt/Lcsit8SIyvhUjQAiAM8IU7jGucGWJLoUQ5/ti7
         3Aqbb8tNv/GzUF2CcGtOs0AsI7RSuGyFFrqwtxxvB6t3CfpNe0bjLOzAh9YllHPHNaE4
         WJObLJi1cM36IQTX+/W41LOtfBVYTNhdtctm64ix/E/vThFPDtKK4VXXK5gdSc7EMGtX
         ao0g==
X-Forwarded-Encrypted: i=1; AJvYcCXKcBKORCgcelJ7H9xKfMBFqtkji5wq0E+CZ7Au3QNmEydWOCc6U5JP5jeqTJBCEDmEmnZiNyUs0W5A0m692/Hj/Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxk3HHSfc2izK1GJKC7RNp+HDPG4JU+VcudVqUArbKmv6OS+STZ
	sM2KNjzQ2lK0BzaedXxiHmTZ19ZJ2m4LOUxQDnQkNGlJFVYx0TAB+kteAFdLUbuAlTiQiuxS7CH
	9Y04=
X-Google-Smtp-Source: AGHT+IF2bAWdJNq2xvn+cLxAkGcyFgGXtzFzhXwErIiBMbr89JaUUGhn9lss0W76K5KR2Cn90o3AZw==
X-Received: by 2002:a05:600c:3b9d:b0:431:612f:189b with SMTP id 5b1f17b1804b1-432b7505ae9mr139440485e9.12.1731404140252;
        Tue, 12 Nov 2024 01:35:40 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:aeea:2252:f7a4:6a05? ([2001:8b0:aba:5f3c:aeea:2252:f7a4:6a05])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa6b3611sm234751885e9.13.2024.11.12.01.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 01:35:39 -0800 (PST)
Message-ID: <621a6b4ca59c8035218d47c2194d19aecc922ff6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH 1/5] attr: Fix the ptest path to
 test-driver
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: olani@axis.com, openembedded-core@lists.openembedded.org
Date: Tue, 12 Nov 2024 09:35:39 +0000
In-Reply-To: <20241111083541.291594-2-olani@axis.com>
References: <20241111083541.291594-1-olani@axis.com>
	 <20241111083541.291594-2-olani@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:35:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207036

On Mon, 2024-11-11 at 09:35 +0100, Ola x Nilsson via lists.openembedded.org=
 wrote:
> From: Ola x Nilsson <olani@axis.com>
>=20
> Add a sed substitution for ${PTEST_PATH}/Makefile that transforms
> =C2=A0TEST_LOG_DRIVER =3D $(SHELL) $(top_srcdir)/build-aux/test-driver
> to
> =C2=A0TEST_LOG_DRIVER =3D $(SHELL) $(top_builddir)/build-aux/test-driver
> which is where the test-driver script can be found when installed.
>=20
> There used to be an oe-core automake patch to do this, but it
> broke non-ptest use of automake.
>=20
> Relates to [YOCTO #15635]
> ---
> =C2=A0meta/recipes-support/attr/attr.inc | 11 +++++++----
> =C2=A01 file changed, 7 insertions(+), 4 deletions(-)

Your patches are missing Signed-off-by lines. There is also a
consistent ptest failure in acl:

https://valkyrie.yoctoproject.org/#/builders/61/builds/366
https://valkyrie.yoctoproject.org/#/builders/73/builds/366
https://valkyrie.yoctoproject.org/#/builders/73/builds/367

Cheers,

Richard


Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66A07C3ABC0
	for <webhook@archiver.kernel.org>; Thu,  8 May 2025 07:19:41 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.9813.1746688777643733869
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 00:19:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AN7x3uVH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cfe574976so4183465e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 00:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746688776; x=1747293576; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SLrnQvFkv+1fvvggwjgLFZbVRrqkQqe2Tgis3Rwi/EM=;
        b=AN7x3uVHrRxhLnig1LqrM5zIc+A+1QbreISY1zgVkKjcy8/S5Mw7DjWxCE8urG0H9l
         Lj5efR3yslUPKs4X08ZAUl2YXywTdiedh9dmD57878IjfQ8YRJdQG5PiRKrD/04nweTo
         A1aWR4thl8q/eQn+sSoVRPHSJBrQD9P2oRzrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746688776; x=1747293576;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SLrnQvFkv+1fvvggwjgLFZbVRrqkQqe2Tgis3Rwi/EM=;
        b=llCG0fGL3h6Bq6GLk4SmrEY8LW2eyHpEY2ROR1q17nc8da9trRbqrIxfVMd5MRnekK
         WEAbdeYXMArapoKIC3Xqnny7sjIcukjWGxHPm6MLHckplVcJF/n0AiXJaBM1uOAxZ6rQ
         VzGBOWz+a8iHFpT8dM7CNbGyIHDclbKBT1Zy7QoK4C8sz6arzaXz6OZQPn7q8oH4NF8T
         ycHuSN0d27xjjnmyPhLre8lM4l25jk44sjVgHyEf5PQlrfYXoEC+6tiW1SmoF9N50umS
         PGOEt5Y+HPqx1/LmGoXv5v/lxWKIqNzWsZfeDtmsJ9R26tWW8YXXBQm7JUZR3jZVor+7
         3MfA==
X-Gm-Message-State: AOJu0YyM8Td7gbEa74gSB0xQGz+pIBqQK2BYu7Z/fHOQ5tlObULLZF8W
	HaC2NbngjHuaYJ0gH8dZzkJDo0eFIt5JiOie/k7SlAZUUQ6PtToP9p17qUslNGk=
X-Gm-Gg: ASbGncu+JogDM7q9l7o4Gkd7IN1bRg0NdwouQ5bjdBLdafEJNkdEMu6cjzqCovPTYjl
	kzzgFq27gMY7PFBCBvy9pgekAnz5qM6n0oMyy1fBSEpMtsOgdOcvGAB69lCyB21oSmXPKkYIn2G
	loV8SIS3BZcg8FeN/UHnFCZUo9SSU/ceVWfqOCqsrTzUKDZWNEtjPb3N+yL4ZyG450sppuCIdZ8
	vWtM58/WPmjQz2GI+3LozzIXQ/Ycia0Roixj/V0p2I8dyRirMdOOQbnD7B8V3W5r6tRm4NYh0/H
	mHQsv5BL82es8gb/YWcSgqfJByH3X8O3WT8UIRD+MAp0J/fiimnl+Gi7p2ICifzPdKotHQ3Px/w
	pKsSmzm0CNQWbhqAHGgUh15OQBOsvwg==
X-Google-Smtp-Source: AGHT+IGm2b67bDvzRDQO6nqcToNqXZRFA9D1ACJ8zXl6Ti5JPN6sWlsICBd5SfXDjY1Uj+odUQ/bcQ==
X-Received: by 2002:a05:600c:6749:b0:43d:2313:7b49 with SMTP id 5b1f17b1804b1-441d44c4547mr56837415e9.12.1746688775842;
        Thu, 08 May 2025 00:19:35 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6070:4c30:227a:4e77? ([2001:8b0:aba:5f3c:6070:4c30:227a:4e77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0bc05b7f1sm1136769f8f.101.2025.05.08.00.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 00:19:35 -0700 (PDT)
Message-ID: <76eb7a8c593616cb502e7ed42084b105b5016f52.camel@linuxfoundation.org>
Subject: Re: [PATCH] linux-yoto/6.12: bsp/arm: fix CONFIG_CRYPTO_LIB_CHACHA
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 08 May 2025 08:19:33 +0100
In-Reply-To: <20250507151109.654312-1-bruce.ashfield@gmail.com>
References: <20250507151109.654312-1-bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 07:19:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216142

On Wed, 2025-05-07 at 11:11 -0400, bruce.ashfield@gmail.com wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>=20
> Integrating the following commit(s) to linux-yocto/.:
>=20
> 1/2 [
> =C2=A0=C2=A0=C2=A0 Author: Mikko Rapeli
> =C2=A0=C2=A0=C2=A0 Email: mikko.rapeli@linaro.org
> =C2=A0=C2=A0=C2=A0 Subject: genericarm64: add CONFIG_CRYPTO_LIB_CHACHA=3D=
m
> =C2=A0=C2=A0=C2=A0 Date: Wed, 7 May 2025 14:43:40 +0300
>=20
> =C2=A0=C2=A0=C2=A0 Fixes CONFIG_CRYPTO_CHACHA20_NEON build as module:
>=20
> =C2=A0=C2=A0=C2=A0 WARNING: [kernel config]: specified values did not mak=
e it into the kernel's final configuration:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [NOTE]: 'CONFIG_CRYPTO_CHACHA2=
0_NEON' last val (m) and .config val (n) do not match
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [INFO]: CONFIG_CRYPTO_CHACHA20=
_NEON : n
>=20
> =C2=A0=C2=A0=C2=A0 Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> =C2=A0=C2=A0=C2=A0 Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.co=
m>
> ]
>=20
> 2/2 [
> =C2=A0=C2=A0=C2=A0 Author: Mikko Rapeli
> =C2=A0=C2=A0=C2=A0 Email: mikko.rapeli@linaro.org
> =C2=A0=C2=A0=C2=A0 Subject: qemuarma15.cfg: enable CONFIG_CRYPTO_LIB_CHAC=
HA
> =C2=A0=C2=A0=C2=A0 Date: Wed, 7 May 2025 14:43:41 +0300
>=20
> =C2=A0=C2=A0=C2=A0 It's a dependency of CONFIG_CRYPTO_CHACHA20_NEON.
> =C2=A0=C2=A0=C2=A0 Fixes:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [NOTE]: 'CONFIG_CRYPTO_CHACHA2=
0_NEON' last val (y) and .config val (n) do not match
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [INFO]: CONFIG_CRYPTO_CHACHA20=
_NEON : n
>=20
> =C2=A0=C2=A0=C2=A0 Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> =C2=A0=C2=A0=C2=A0 Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.co=
m>
> ]
>=20
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>=20
> Apply this on top of my recent kernel series and the warnings
> should be gone from the various arm builds.

I think there is a push to yocto-kernel-cache missing as these revisions ar=
en't in the repo.

Cheers,

Richard


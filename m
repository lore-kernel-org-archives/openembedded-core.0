Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9FB5C5AD49
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 09:22:55 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.16882.1748510566976493570
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 02:22:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IAz7taf7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a4dba2c767so1234174f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 02:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748510565; x=1749115365; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WgoMURK+C3UCSVwQHVXvTTb5zSCU9f7rW0umJz0A2UI=;
        b=IAz7taf7sqvtK7lWqf5wxEAnK/uC42zDyOZKBJdN6Gdmw+Bnlq4axY/ER1jU1z+Jnh
         AGAbzA6iPF6+7H/NyS12RNvnt72RXn8DII81udwX9gyfMiSEfw7SAQsp6yJJh6tOC6iq
         WlPP+trgD9ZgCCBawReIdHNgnEO0nbbmssiyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748510565; x=1749115365;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WgoMURK+C3UCSVwQHVXvTTb5zSCU9f7rW0umJz0A2UI=;
        b=lVgeKsnhVgWbcShcaPo6m9jTAgw3JRlhi2HxeyHQF8VB/5VJGJwLEnlc0MvX3q5j4c
         2zyuBp0NDlImvu5ktDsWypL9iBg9JzWE9cpFtr4iCXuje7esQ4LiErULAeEImsimyKkJ
         9KPfGs7npwbJjbwYjTFu1F6t+X+VncxNwQxhQ2lR/A+jUgVRNu9j2uSJLKkmLgCPIFSj
         dnffC6yALBIBdNRS8nCnRHXuIzSP6O0Mea8unqDJQsb1sqPT20E73WGeddp2M9AbZDzb
         BRIA3mdM/vaYcUyLqrrRJcjV4AjRRJPQCaTMyYxBWms442ddEYIa89S4WAkxiXqpdqXR
         awDw==
X-Forwarded-Encrypted: i=1; AJvYcCWlvcNgvcjTf9+eoOhJA5JKxMQHyMnz6d9hG7dMINHO1ge6BwHqM1UDZEFbXMdwKydQJP2vUTbooG9LA3hwmR6bZw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxb58q+DOCXXuBka9OLQ9fHaKg3BUNzDPjSM+pVz4tJre4jz/FB
	SuuTXWpXKnDLYN6wC8ChP6DV4tQL7KWyeGDYXMj0pcz52eOuHUMJnxIcVZTHwPz/VtCISOZo1lq
	we5ZN5JM=
X-Gm-Gg: ASbGncvXAw3EgoVo7gMarKXnxGlJcgLANRqvf4O/smxUWs9zrTl3tvp2r8mMKPwTo3M
	RgB54N9JohKk0QaPABouHtUj/FlqvyD9BCaVThKqF7Quq7SNg7q4L3rCiX2P4Z0vBmvepCFcUXX
	Dl5m/MVBhSCIhY+YDrjEftUvb68Y/twHSNzTCuj0E1tAfgYZ66iO46XuphrGboRPWAFoacPUUDJ
	V+Yu/uHzGNuYxt3ZF5nplEdeKk8LKg9Q7sRRECLRS0Wfzvdvco8s/gHtqcaelK0KM+aR+R6lrNa
	i2H7mbE61cau7ewHq4C3dlU5h89+8J0ekjKEvBEgXNC3g8bolumn4DawGzWgp19BpbUca3i7yn6
	Oj/13h69MzZcsQhUzNi+Cbhl0EVeAlYXkIJg=
X-Google-Smtp-Source: AGHT+IHQb69K+qJU1tC69cOBu7ARqfUTmyhy9DdwWoa1copqNxk32JPAJDNKjR7IP6aAvsAMalUIsg==
X-Received: by 2002:a05:6000:1a89:b0:3a3:76e2:ccb7 with SMTP id ffacd0b85a97d-3a4eed912bcmr2174395f8f.5.1748510565310;
        Thu, 29 May 2025 02:22:45 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1a5e:81:40ad:9da7? ([2001:8b0:aba:5f3c:1a5e:81:40ad:9da7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f009fd7csm1380361f8f.88.2025.05.29.02.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 02:22:44 -0700 (PDT)
Message-ID: <8779472af099d97425a52fe97f63f5c5e13e9655.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 06/13] libjpeg-turbo: Fix build on
 mips/clang
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Date: Thu, 29 May 2025 10:22:43 +0100
In-Reply-To: <20250522-clang-toolchain-v3-6-16cfc6d9891b@gmail.com>
References: <20250522-clang-toolchain-v3-0-16cfc6d9891b@gmail.com>
	 <20250522-clang-toolchain-v3-6-16cfc6d9891b@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 09:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217403

On Thu, 2025-05-22 at 20:52 -0700, Khem Raj via lists.openembedded.org
wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb | 6 ++++++
> =C2=A01 file changed, 6 insertions(+)
>=20
> diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb
> b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb
> index
> 8533bd8525311e783572cbafb6fccf240db9e0e8..90aa2ef43956f0a1e64f8e08e47
> d953bf5773e19 100644
> --- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb
> +++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb
> @@ -47,6 +47,12 @@ EXTRA_OECMAKE:append:class-target:powerpc64le =3D "
> ${@bb.utils.contains("TUNE_FEA
> =C2=A0DEBUG_OPTIMIZATION:append:armv4 =3D "
> ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-
> pointer', '', d)}"
> =C2=A0DEBUG_OPTIMIZATION:append:armv5 =3D "
> ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-
> pointer', '', d)}"
> =C2=A0
> +# libjpeg-turbo-2.0.2/simd/mips/jsimd_dspr2.S
> +# <instantiation>:13:5: error: invalid token in expression
> +# .if $17 !=3D 0
> +# ^
> +CFLAGS:append:toolchain-clang:mipsarch =3D " -no-integrated-as"
> +
> =C2=A0PACKAGES =3D+ "jpeg-tools libturbojpeg"

I noticed you use "-no-integrated-as" but in the next patch in pixman,
you use "-fno-integrated-as". Should we be consistent or are these
different?

Cheers,

Richard


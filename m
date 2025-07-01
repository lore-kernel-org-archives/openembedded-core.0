Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 301BAC83038
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 19:23:18 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.5857.1751397796133208935
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 12:23:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X/tEf6zr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4537fdec33bso23893005e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 12:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751397794; x=1752002594; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XzI9TsVoWgzdbqh2wYUO5csLQFTkcImB9NJPtvVWC1s=;
        b=X/tEf6zrIvHQGOo4gQvoM3xtUHXPfSxTpiAXy+iEj2j+q9hdjFv8UW2mU6d5W3exL8
         FoeKCihzORLupCAZMtLW9fpwIAc1zWw9nLNqpst5PaPvUbfHFS0F9bQK8JwPITZ63JRY
         Rv02BgfXYx+NqZyohHoptvse22li2gv124NPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751397794; x=1752002594;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XzI9TsVoWgzdbqh2wYUO5csLQFTkcImB9NJPtvVWC1s=;
        b=WKMxFxoVTFVCj8q9dYEeUyqjl87XmA1R1PnXFht1JtJ5WOkhsavRccLrnM82VR4knU
         SxK7s7C/py/A6KjNy2GQA47R05iVQu9j5rzIfX+xERxCYxvk+4TpgUoHyxqSaCEjp3Cp
         mtOcomEYNqvUdRv22td+Kw3dCmH5/VSrFAK+Ehul5AvjeF4MKv/JROLcf5SkFU/9KQ10
         0nWqqy4axwDFt5ggXJoNKndWnodqyToihHwag3EhE68D2UhxFCDrDk7q9LlOkmuz6pYS
         LHRjvnQZiUVbTLHgkFhtks+h/wsoJ98SyVfB2GrvE3JSjqJgX9dvzjcI95xZnwnJJlKw
         HIIA==
X-Forwarded-Encrypted: i=1; AJvYcCXbHQnRyW66las7Jlg8MLnskCiyOmSzIGuYVIYpA/m0Ef/iWlkdY9BpWu4A70bs2zVbTccgD737udoIEZ+GcoK99g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YypJdmQMZYfR9E2IkP7k2KZetpsYkwcrxedllXs+zTETI5rWKCb
	Lqi0//bBJlVr6fNjnDABYbKjrPjZw9WEyDhkz73h6EOSY5EssJoaE4ZzdBfeZjrQsQI=
X-Gm-Gg: ASbGncvbvKuQybsv+q75abuxmAUvD6cnLT33DMYTb9J0mc/ocK+GjlYBX5YB1h42VOZ
	sBaiIeWM70kZfpaoWRCcIQ/kyC8yIcrkoJGsOwPIfX4Eix9KfUUdcX6O5Zq/kNw1eaY6zzzodeK
	tzUeUP3IrbC3LbTXwvKfyYgLEn9FEhtNCIyz7FSBX4WVo/huIjLh0Ov9JzalqvuN4kRxQpV4Q/G
	iQoVA7FdOSwS5qcGjEmQll2cVl1Xn4ZiwPNunsWSKScgCz9QdLyHGvW+gJc3ql+pgudPllt7HyL
	sBEEIJal3yXt7iidkdc9AHZ4maUeAGbBA/stnj2ok0+6QJBfEZpHaLe401oDELlpp+NIqzCze1y
	idfKl8TONRia8aR7HECam0lnVpP0+FViQCc86UA6rSq46BSPsyvILlpnvR1KT9Q==
X-Google-Smtp-Source: AGHT+IFD9VFQRp/nECQ4wJdZYauUgv22NLxyaweNZHhEzKtZmIGdqX0pV5dtdiHUbHNeaoySvz2mmQ==
X-Received: by 2002:a05:600c:638e:b0:453:59c2:e4f8 with SMTP id 5b1f17b1804b1-454a36d80d6mr3074795e9.1.1751397794398;
        Tue, 01 Jul 2025 12:23:14 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:62fa:d15d:397d:870e? ([2001:8b0:aba:5f3c:62fa:d15d:397d:870e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538f754326sm149498125e9.18.2025.07.01.12.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 12:23:13 -0700 (PDT)
Message-ID: <8f41ff44bec932b72a5f9c0b5e9687b9ccec37f6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] base.bbclass: Deferred inherit native
 toolchain class
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Date: Tue, 01 Jul 2025 20:23:12 +0100
In-Reply-To: <20250701190633.2324784-2-raj.khem@gmail.com>
References: <20250701190633.2324784-1-raj.khem@gmail.com>
	 <20250701190633.2324784-2-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 19:23:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219717

On Tue, 2025-07-01 at 12:06 -0700, Khem Raj via lists.openembedded.org
wrote:
> This helps build native recipe with clang as native compiler.
> when PREFERRED_TOOLCHAIN_NATIVE =3D "clang", otherwise it will
> inherit gcc-native, this is a bit redundant when gcc native
> is used, ideally we should defer_inherit it always but there
> is some code in classes assuming gcc as native compiler e.g.
>=20
> oe.utils.host_gcc_version function expects BUILD_CC early during
> parsing.
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0meta/classes-global/base.bbclass | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/meta/classes-global/base.bbclass b/meta/classes-
> global/base.bbclass
> index ac145d9fd64..1fa09b6a16b 100644
> --- a/meta/classes-global/base.bbclass
> +++ b/meta/classes-global/base.bbclass
> @@ -32,6 +32,7 @@ PREFERRED_TOOLCHAIN:class-nativesdk =3D
> "${PREFERRED_TOOLCHAIN_SDK}"
> =C2=A0TOOLCHAIN ??=3D "${PREFERRED_TOOLCHAIN}"
> =C2=A0
> =C2=A0inherit toolchain/gcc-native
> +inherit_defer toolchain/${PREFERRED_TOOLCHAIN_NATIVE}-native
> =C2=A0inherit_defer toolchain/${TOOLCHAIN}
> =C2=A0
> =C2=A0def lsb_distro_identifier(d):

The trouble with doing it this way is that a recipe which says
TOOLCHAIN =3D "gcc" will end up getting compiled by clang.

We could avoid this by using:

TOOLCHAIN_NATIVE ??=3D "${PREFERRED_TOOLCHAIN_NATIVE}"

inherit_defer toolchain/${TOOLCHAIN_NATIVE}-native

and then having recipes set:

TOOLCHAIN =3D "gcc"
TOOLCHAIN_NATIVE =3D "gcc"

I really want to avoid inheriting both gcc-native and clang-native. If
we have to remove the host_gcc_version function, that is probably ok. I
think it is mostly used for the uninative gcc 4.8 and 4.9 issue but I
doubt we have any distro with those older gcc versions on now?

Cheers,

Richard




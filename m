Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FA3BC3DA6D
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 14:41:53 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.22578.1747752111047679485
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 07:41:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=U5SqET0a;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso35266415e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 07:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747752109; x=1748356909; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C6lemEyD0ftmWOOZ2rgF3gDKS1VqNr6h02A8BVmg8rI=;
        b=U5SqET0aKbuImhtLbEPNOAiQ5czimFRb6LFsDFz/IC/AvoSFkm8xm0j7PAB69co2qX
         qLwB66VA0Wz3/eCIPHoki9/Q53AwM8QUWr/DqzrfFPUI8mrPzO+7IZPcBf3MmULBtbtL
         R+wAp4xwhz3uuunBehz9lb5R/r1b2c4sN8xgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747752109; x=1748356909;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C6lemEyD0ftmWOOZ2rgF3gDKS1VqNr6h02A8BVmg8rI=;
        b=e5+smpDvvF7BiwcP2ASsBE9K9fb1Wbp9qLzOwMLjSil3ERRcmHMY4Y4vPCQ4Mbvx0F
         BWg2+AMCNIhTIp8GKdXjsRNTRpVKWHMKLtd7T3o19IZoyX8PVpTzSq/4gzJsfzul0K5H
         oFNjwRxcZz3ac7vWEDMhctKxloD4Jna6BvVKyUZToW5AndGfLgl4CxBDz+7QumCarhtJ
         833h2oooEWo5SNpljUVNgDay7WGXSRjyckb8CHkgw59H4NXZON35mlydQYXQGsuQq+l4
         Tu3tPol/rHmke5vX8kRie5p3zWOYEuy5IA4eNCmirgmGB8MaNjPpY/e+hPvhwpXNQI3V
         ddXg==
X-Forwarded-Encrypted: i=1; AJvYcCVHtRrH6KRzihWY2XUYLi/9sLwiYX01iOdZgCVNeof6LIh69Ia/S5vFBxXWMc0KYjW98WXAL/GkE393YLBkBc8mqw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyu3aN+6wq7nWiEyZk1mCc9drVaHCQPqHsY/C4AU3smUX5LYlBj
	zBMVppEq90WIbGk5vqw3iCfB9F8Xyz7hW8/IXpjBQo5jW22aeD5nSIOdLM8hMT2oTmc=
X-Gm-Gg: ASbGnctI7Sw2N9w1fJ79uqYsZWuYgEFA91zHbk2cCEg+FwVZn9F2ms9dK9JtjzQSvPJ
	nONuwvPRnnZGuoGtmXchldnvPsdiaqyCWZBYA1kngk9GuW8wJFaOl8iWtgvHbLawj90O6Pka7Fi
	mPlOAIS9qt3dHlpK7XAv55IuFkdGo+5rFgJVU5Z8YExhF2yPsOqlEKiMdf8kklyypC1UcmloDLQ
	Ta5RO6TltLKmm8UxgOGKn6xlL7FN9+t7zfDsLIJ6N7MN5O7U/OcOibHJg5fi7GwZeOfwCE5HgOh
	r8jlagzk2i57E+XTJxhhNKqdDCcpQWy6KY6akYpu57kqRNVD/PCxxDAQVpMkIwS7+cg1D3/jaBd
	qlX2gJbWFhgJFZuSGg5dZL7L1HCFfUSB8MABvNA==
X-Google-Smtp-Source: AGHT+IFZvNOP6J7PYia5HRtOjKSW4RaclpmYTz4Ry1gRAeN09z/7B6oia1WgMOqIWUYdbWWEhIOAZw==
X-Received: by 2002:a05:600c:548e:b0:442:dc6f:7a21 with SMTP id 5b1f17b1804b1-442fefd5f18mr162212425e9.3.1747752109189;
        Tue, 20 May 2025 07:41:49 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:685:a6df:9777:90ca? ([2001:8b0:aba:5f3c:685:a6df:9777:90ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d25b8sm35006725e9.17.2025.05.20.07.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 07:41:48 -0700 (PDT)
Message-ID: <b141f2387a2a83d27ba1d5872b0a83568f486573.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 02/21] default-toolchains.inc: Add a global
 file to pin TOOLCHAIN variable
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Date: Tue, 20 May 2025 15:41:47 +0100
In-Reply-To: <20250518-clang-toolchain-v1-2-5be46f8c4af5@gmail.com>
References: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
	 <20250518-clang-toolchain-v1-2-5be46f8c4af5@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 14:41:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216921

On Sun, 2025-05-18 at 14:30 -0700, Khem Raj via lists.openembedded.org
wrote:
> Some recipes demand either gcc or clang, they can not be compiled
> with
> both compilers e.g. glibc, gcc, libgcc etc all exclusively need gcc
> to
> build and similarily, libcxx, compiler-rt need clang compiler to
> build
>=20
> This header will contain the pinned TOOLCHAIN variable defintions for
> such cases
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0meta/conf/distro/include/default-toolchains.inc | 14 ++++++++++++++
> =C2=A01 file changed, 14 insertions(+)
>=20
> diff --git a/meta/conf/distro/include/default-toolchains.inc
> b/meta/conf/distro/include/default-toolchains.inc
> new file mode 100644
> index
> 0000000000000000000000000000000000000000..691570a7a9f28187a5c7f6d0a6a
> d80761c777e3d
> --- /dev/null
> +++ b/meta/conf/distro/include/default-toolchains.inc
> @@ -0,0 +1,14 @@
> +TOOLCHAIN:pn-gcc =3D "gcc"
> +TOOLCHAIN:pn-gcc-runtime =3D "gcc"
> +TOOLCHAIN:pn-gcc-sanitizers =3D "gcc"
> +TOOLCHAIN:pn-glibc =3D "gcc"
> +TOOLCHAIN:pn-glibc-initial =3D "gcc"
> +TOOLCHAIN:pn-glibc-locale =3D "gcc"
> +TOOLCHAIN:pn-glibc-mtrace =3D "gcc"
> +TOOLCHAIN:pn-glibc-scripts =3D "gcc"
> +TOOLCHAIN:pn-glibc-testsuite =3D "gcc"
> +TOOLCHAIN:pn-glibc-y2038-tests =3D "gcc"
> +TOOLCHAIN:pn-libgcc-initial =3D "gcc"
> +TOOLCHAIN:pn-libgcc =3D "gcc"
> +TOOLCHAIN:pn-libgfortran =3D "gcc"
> +TOOLCHAIN:pn-libssp-nonshared =3D "gcc"

This format made sense when this was in a separate layer but should we
be adding this markup directly to the recipes now?

Does this markup work in recipes without overrides? I'm a bit worried
that our variable syntax doesn't make this work too well at the recipe
level.

This approach is much more aligned with the direction I think we need
to go, we just need to sort the final details like this...

Cheers,

Richard


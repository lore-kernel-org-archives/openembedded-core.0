Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3436C77B7C
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 22:27:25 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.1690.1750804037567368932
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 15:27:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R9sXkfJY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a51481a598so3020713f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 15:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750804036; x=1751408836; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=724TqlMs8Z+uG3NQ4tbogzUAK8yPc37v7oZ5FjgyomA=;
        b=R9sXkfJY6XJpQtA1avCm/Afvv7pDl5HCm83cDVq90jT5zQHqvRj/SrEDLVw5Bj6bht
         8/iqtc4keHm5mgtk7Mbulhk6MrbxgoWdqIo9juu6f3P36Mv0sRlIORdg/IEwxUvWC2lE
         R58BqtH9TEz6d08hEKDJ/l6/VVOzZ4HjOSH70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750804036; x=1751408836;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=724TqlMs8Z+uG3NQ4tbogzUAK8yPc37v7oZ5FjgyomA=;
        b=FtHl/oaJkldN/GokcTvFe9kDE5iHeKI5Vd1Flj80gBRMIdqrX38Xuw5RKC1zuY5Pka
         YO+lAdYpZSR9p+CYN0g1o5hLkOLoJy9/o65BCKyu5N/xuC9bPN3mImq3uIm3L4uGSo1J
         RBDcXhJfKZ+KDD4cQujNLKw7J117W6T9AjfcsT1Kl3+g9ABwH9ZzhvMFTHq7P7wvavpU
         t2KnUacMAhZOuljg5sgxbLz7sq0Pw/9ezyMan1LU5A/2PTcvGdetoR9R1FhUPxbTzbUL
         9jIaXK3jBKHToonFnPlnN0xXjJc4HcU9O1wpxfaUsjurpF+hTljvOooKl1iducfn4L8J
         gLEA==
X-Forwarded-Encrypted: i=1; AJvYcCVezxip8MGVZgEDjzyfKphum/eZXclw3ZsZ0AY1AJI+TZ8KlwcBNot/TsxMVHNKFIuGYxCTbFgevmln9H8PruAhLg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxc4rB85Rjoq2V27tK+4NXEu4OmUxSV+5wJ+iJHx/iDV1RnuVIY
	zeYR4E7FsYRM13KkS5ay2B8oocXiYEPail9Nv1jJwlIftX5u89HOkryFNOEP4Cs5xuw=
X-Gm-Gg: ASbGncvxyPEqwoVduCjVlUUJjHo7f3Q8fFXcDYT2ZcKztaAzkvp+t/z4uPpvjzUKcXV
	FNo7z0tFiLvoU1qW652RfORGWGuX3tfKFD9rc8fh8rsHcNLLPNYeNTf1jhNQsPiAGwgWmL7/EmB
	DmTBiK9zPBHAIHRwgJPorKlrG2581NCZrjdz8vc58m02MTFqVOL3dbygWKxXhcfRoELfJU3FtRH
	lLqPuEifQ9+9iCi7jHFQULSEY4+OCjTPUZI6v/Cy8H7mHTYEZ7L9zCCMEJle5aCAwtJaD9S2Elm
	bTyE1xlGfmNuh/ZspIYtanVhc1P8OUBWllVFqKzM4VoLtMj4gTZqdVX+qTls8gtIkDq14J0vre/
	z8jADUPgVTuC4v7QzMNCvlu4nQV5SSRBLcU1XCauwzBvJItkwpfo=
X-Google-Smtp-Source: AGHT+IF7L1OHB91sZK7n3pLS2fmXumPQwWMRhU0ZPrgFrcZJ5n6xkWeB6hxgKhMIi34bjyTMEeIxlg==
X-Received: by 2002:a05:6000:200e:b0:3a4:ed1e:405b with SMTP id ffacd0b85a97d-3a6ed67514cmr282593f8f.46.1750804035807;
        Tue, 24 Jun 2025 15:27:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2382:c379:cbb0:17a7? ([2001:8b0:aba:5f3c:2382:c379:cbb0:17a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80f264esm2908802f8f.47.2025.06.24.15.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 15:27:15 -0700 (PDT)
Message-ID: <66ad34980bea73369408af8719d9a1ecb464baba.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] glibc: Use :append to add to CC
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: peter.kjellerstedt@axis.com, openembedded-core@lists.openembedded.org
Date: Tue, 24 Jun 2025 23:27:14 +0100
In-Reply-To: <20250624215053.3162975-1-pkj@axis.com>
References: <20250624215053.3162975-1-pkj@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 22:27:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219286

On Tue, 2025-06-24 at 23:50 +0200, Peter Kjellerstedt via
lists.openembedded.org wrote:
> Due to the recent changes to how the toolchain variables are
> initialized
> via inherit_defer, it is no longer possible to add to CC using the +=3D
> operator. Instead, CC:append needs to be used.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
> =C2=A0meta/recipes-core/glibc/glibc_2.41.bb | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/glibc/glibc_2.41.bb b/meta/recipes-
> core/glibc/glibc_2.41.bb
> index 7771fac041..2ef738f5b4 100644
> --- a/meta/recipes-core/glibc/glibc_2.41.bb
> +++ b/meta/recipes-core/glibc/glibc_2.41.bb
> @@ -111,7 +111,7 @@ do_configure () {
> =C2=A0}
> =C2=A0
> =C2=A0LDFLAGS +=3D "-fuse-ld=3Dbfd"
> -CC +=3D "-fuse-ld=3Dbfd"
> +CC:append =3D " -fuse-ld=3Dbfd"


Given my hatred of using append, is it not possible to put this in
CFLAGS?

Cheers,

RIchard


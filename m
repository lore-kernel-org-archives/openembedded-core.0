Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D86F4105A591
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 11:59:09 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19806.1773316746824286421
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 04:59:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hf801SJD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so7753825e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 04:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773316745; x=1773921545; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TP6osAiLBJwTAihufN6WLbM6hk2JU1DMLiNFfkKD4lw=;
        b=hf801SJDyfSGU3BUjpwXr1I3mIDFnuKzIILnhCRfk+LIMV9q1C5T4qmfZRUxpHTBE0
         cGiflDGeiUnLSG5fBC38SSLqne79AgLQQmhyrAjdbPBY+eAswEh+DxBxqccy4JFy6T8b
         J2QRFsZLlK4nSXYKl1YsDUQLHWZ0PZaZnmjIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773316745; x=1773921545;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TP6osAiLBJwTAihufN6WLbM6hk2JU1DMLiNFfkKD4lw=;
        b=REQ6IABTt1j9OraHhzTjKf/eIndeOSRt1/NVchZoQnzfwZgOzGXeGM0QM6m7OYcyiT
         AFNUp2zK//wVUlfSoQ1usEFII+EDWTHu30f9P0Uwfesrveyajz1062nKH9fHPIm/bY2g
         VaM2X2tt7QeJfGfk+XgKWvAsNL01/TrCjS56pBQ2oLmgg7ytDz+kiYLSpOd8EEoQO/c5
         3DQdTIgQWedUHzWBhIn7XYqLVoKi5zMiRJGUPuAs5OhcHmI44Hk0uNQjSFemp8AJeK3v
         XlJq2o4cJ2xXnl55+k8R8jxOygiuIaysNNublxRyh7x988H2cKmYKt6qkXfKWGsxPZzZ
         m1fw==
X-Forwarded-Encrypted: i=1; AJvYcCUS41tb6DDqpndjeZZprm+XnUSeF8ft/fao1DpsrqLalMzRUfxVIdY+onNkBPaX8erlI62u4qBy3cIxpXPb2XrKrw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwErQIKLBYHCIV+QSH7sn/F0xmVufGl4jG3Cn1aMdkUvNbulLMt
	JP4dyyxe0t+fUyQ0B4JcskaDISxjPtcfwE8IIW0nrMfcND8/AB3lnWdTP6JVCWzul5zZLEPG8s5
	4JFEpw98=
X-Gm-Gg: ATEYQzytM08u9CgB3SPCNktSXrlUiZqgU6u/0t4Fcawp3KZjHsJYFRc3IYYg4zTA8lX
	Yjh3I0HfTiOerDIqj58HIyOI+ElCzX5+Z92rU+Y6rF7XzN+9tbCwoWayxBwsYWTcRDefunPcQpl
	ZvMgDk554J7zUBScv+3coBWHLmRZfuSVoJdwqHCCTE/A/Bi0owCQ1r6d+CDXsB4Fm7xrh4GAr7o
	1LQB+qlRQV2/qsLmQ0RJ6lj+KYkOVCfj77KsvKkxJN7CVObDRlrN2L3uDmAmgNjXa2Bzk3QP1em
	rNO3VQ62w24q2a+z5BAZJBQLHnLOM/lW7Gt+v8IvTI9V8X8cP2Cua1W7Kqa5yZUtX7uKqfpfJ+X
	S7R5iCQChL9f03jZEjx0qPvCsK/yYRpxHO/8xVAqUzo1mGZDaFNOthvtoh9dz3D0MKpqc5OPM2w
	aN8q3SZTWbdbx7r4cTIKvi+/4UbK+1ILPWoHacSSy83HqErFe9QJ1NO0LT6kmDM6ujzQNHKd6tz
	9TH2++FPktF
X-Received: by 2002:a05:600c:1f8e:b0:485:2ce2:4c87 with SMTP id 5b1f17b1804b1-4854b0cbdefmr104603135e9.4.1773316745138;
        Thu, 12 Mar 2026 04:59:05 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:215f:5162:d0b:8f1d? ([2001:8b0:aba:5f3c:215f:5162:d0b:8f1d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe19acc6sm7855358f8f.8.2026.03.12.04.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 04:59:04 -0700 (PDT)
Message-ID: <a437698a4d24a835440e282d0d744f5b3ff669a3.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v6 10/15] dummy-sdk-package: Disable SPDX
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: JPEWhacker@gmail.com, openembedded-core@lists.openembedded.org
Date: Thu, 12 Mar 2026 11:59:03 +0000
In-Reply-To: <20260310184058.533343-11-JPEWhacker@gmail.com>
References: <20260304164835.3072507-1-JPEWhacker@gmail.com>
	 <20260310184058.533343-1-JPEWhacker@gmail.com>
	 <20260310184058.533343-11-JPEWhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 11:59:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232945

On Tue, 2026-03-10 at 12:38 -0600, Joshua Watt via lists.openembedded.org w=
rote:
> The dummy SDK packages do not need SPDX support, and since they play
> some games with allarch that cause problems, it's simplest to disable
> their SPDX output.
>=20
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
> =C2=A0meta/recipes-core/meta/dummy-sdk-package.inc | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-core/meta/dummy-sdk-package.inc b/meta/recipes-=
core/meta/dummy-sdk-package.inc
> index bf453cac9b..71e788b0b9 100644
> --- a/meta/recipes-core/meta/dummy-sdk-package.inc
> +++ b/meta/recipes-core/meta/dummy-sdk-package.inc
> @@ -4,6 +4,7 @@ LICENSE =3D "MIT"
> =C2=A0PACKAGE_ARCH =3D "all"
> =C2=A0
> =C2=A0inherit allarch
> +inherit nospdx
> =C2=A0
> =C2=A0INHIBIT_DEFAULT_DEPS =3D "1"

I know why you did this, but after thinking about this, I'm worried and
I'm not sure this is the right move.

The SDK dummy packages are "odd" but they are actual package files that
are generated and would be present in manifests and as such, if they're
missing from the SPDX manifests and docs, this is going to raise
questions. I appreciate they don't have content and their main use is
their 'provides'.

Taking a step back, we do support generic/multiple levels of package
arch and since we support that, the SPDX code does need to handle that
too. I'm therefore starting to worry that SPDX can't cope with the
multiple package levels. Can you remind me what the issue is with the
"all" arch here?

Cheers,

Richard



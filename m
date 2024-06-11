Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B3FDC25B76
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 10:40:46 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.6329.1718102441547520574
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 03:40:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=agW/5OKd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5295eb47b48so6459210e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 03:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1718102439; x=1718707239; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IuT0YyiHpJsrXbW/RYJFbOgYD6dYqSdbHO/TbPSSx2A=;
        b=agW/5OKdpdB8lXJ7ZImjGawVgHQu2otueLSp0woFlwcvhsQTwD10JWtjNuphyz6kY1
         rodk44HXoePY6kZEtAOWy5MujsKOlD+ntFiSL3/6Kx7q6zLMJLaCgbAFgFA7rPM6y8+x
         iPPBGbIpv1nY/uxIvI8JSZnLta7txXG6tDblA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718102439; x=1718707239;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IuT0YyiHpJsrXbW/RYJFbOgYD6dYqSdbHO/TbPSSx2A=;
        b=TvzLDy/PYbDYEp6P1k33lImvVb9eiyvWea8IwBApxWUAYWeNMbGotV89c3NN73zZ3r
         U9gGb70l5gj+i+2oonUn3akfrLeII6d2ARd0RZ7GmqYHK3ExjctCWkPX549qnTEWW9d/
         b4sPmH0XOWNWjgLDzInQbElQVe90xtTqcAugpD7xQhDRRSfD9m1P1MA+4cM2CGo++U7C
         tt06w0dhdtFLOJ9bf5ZIcSKhzBn464XlxzL7SK/auacX/NJOWd2CsKz3I94YFAjh/5+a
         JFXc3lVJsed1f+IhEp8ZW3TCPL2z4cFZUXCBzBu9jumt7b0Osuvr/rKCLh4VZLSOYhdD
         VqUw==
X-Forwarded-Encrypted: i=1; AJvYcCX3bs8hLVBHU0JbJenXGMhh90utnFczUU5gbqJ1q+ocf37ui1BI0BuzlANT4RLGwrbxPXvcageulcikJxqpPQDYJg8j8KT8f3DlZX/Ss265J3U0fK0aLWGT
X-Gm-Message-State: AOJu0YwmJffsv1ykblRP1SRn4Zl/CKlDRAJA3sF04ydqGS279tTCR96q
	3w25aTmYmaREvzjnoUy6xIxtERTQBUfvWsh7N5AeXK8EeS6yHiNkbM/EyUyIAeU=
X-Google-Smtp-Source: AGHT+IGh/ffiNk82JcrrjFmKhAxiXVpEhWOYpLk3w5E7lm2l+9Cp3iX8fVS6kQUYsYmBH4CO63y3iQ==
X-Received: by 2002:a05:6512:3a8a:b0:52c:93f9:e757 with SMTP id 2adb3069b0e04-52c93f9f4e2mr1321302e87.34.1718102439529;
        Tue, 11 Jun 2024 03:40:39 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d58d:9b4d:d265:3c2e? ([2001:8b0:aba:5f3c:d58d:9b4d:d265:3c2e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f27600519sm3950555f8f.32.2024.06.11.03.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 03:40:39 -0700 (PDT)
Message-ID: <f92d6abb21f57454942351ff10ae808c5d109e64.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 0/6] Add SPDX 3.0 support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: JPEWhacker@gmail.com, openembedded-core@lists.openembedded.org
Date: Tue, 11 Jun 2024 11:40:38 +0100
In-Reply-To: <20240610214456.2757397-1-JPEWhacker@gmail.com>
References: <20240610214456.2757397-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 10:40:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200502

On Mon, 2024-06-10 at 15:41 -0600, Joshua Watt via
lists.openembedded.org wrote:
> This patch series add support for SPDX 3.0. Currently it is not
> possible
> to have SPDX 2.2 and SPDX 3.0 enabled at the same time; users may
> choose
> to specifically use SPDX 3.0 instead of 2.2 by doing INHERIT +=3D
> "create-spdx-3.0"
>=20
> The default version is not changed yet, although that will likely
> happen
> soon
>=20
> Joshua Watt (6):
> =C2=A0 classes-recipe/image: Add image file manifest
> =C2=A0 classes/spdx-common: Move common SPDX to new class
> =C2=A0 classes/spdx-common: Add SPDX version to path
> =C2=A0 classes/spdx-common: Return empty list from extract_licenses
> =C2=A0 classes/create-spdx-3.0: Add class
> =C2=A0 classes-recipe/image_types: Add SPDX_IMAGE_PURPOSE to images

I set 3.0 to the default for testing and there were some interesting
looking failures:

https://valkyrie.yoctoproject.org/#/builders/43/builds/52/steps/11/logs/std=
io

I'm guessing:

https://valkyrie.yoctoproject.org/#/builders/37/builds/60

is due to a missing patch?

Other failures:

https://valkyrie.yoctoproject.org/#/builders/74/builds/44/steps/13/logs/std=
io
https://valkyrie.yoctoproject.org/#/builders/93/builds/51/steps/11/logs/std=
io

but I stopped the build at this point.

Cheers,

Richard


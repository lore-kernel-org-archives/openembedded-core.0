Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0659BC3ABCC
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 15:36:01 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.105674.1747236959132161060
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 08:35:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Q/neAsgj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a0b6aa08e5so793031f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 08:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747236957; x=1747841757; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BaTmhg911/uGLYK7rnRIX003XrYAWS1RXlkQoRmE8So=;
        b=Q/neAsgjfHKXO2Dok1tR5lC9LndlIU2pOyP9fWzVQgZ+YcLNBbV0Gs/l2+vA0Vucn8
         YIqu6UL1yQgfiy+im2iilTfQXAxRrXLRKoJbldWXisb8dkz3b7JAbZMc+vYXyM61kx2t
         9qx+MA1jK4YMKHI5/edX6DoIbnB+nxmrR6Z7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747236957; x=1747841757;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BaTmhg911/uGLYK7rnRIX003XrYAWS1RXlkQoRmE8So=;
        b=B1u0ITPdYz/Dw1cxVRK5dfP0VsKO3kQjyB7Dsp1EKkrxt5twi7pq76jiMniA3AJoT4
         b7GB3GYzKQHAPNeEh98fyjoWnCuKzPtOvTMjaJqpNJzcr6TxOsbY3mgN8kZi0LdQJ4tg
         a2WOhGxlRJAangSRhzm0eyEIobc62kiI7QeWiFy2AZIUYJ+GK15MoQMOc86i8x/tNh0G
         LI6NoxoPe1rrv0NsjCtLovPIl6zCsgPWQzKR/bhCI7S4PHN6By0AjFwAAHOPXFy4mzOy
         o+rlf09d39d63+rJMaSfauMcotlBgAdkZUeiIarsADOYKphybQwgSQqvSzgGK+FcvGQc
         QPdw==
X-Gm-Message-State: AOJu0YzG/S2Pm7BUwg8+IRjZazxRgmgmQfkCXw9eFctSJhQVjR65cEhH
	Xw5/JtqDzo5b3+GVru8uLIQA/9rBn8HDrXm0OZi/nwZG2brHWDGs0rwX7h1E8/Qu6qpl2EB7IzD
	n
X-Gm-Gg: ASbGncsPQOaVLpNQJoziUetEaGQUbj2EE5JtnP0RMwfZ8Ra22hUAS58tgqqAl5nJl9N
	kWTXY/xHML32drxAEeL/hbMEucsX31tMNIX11829OtdSD0vRSd5/2Z6hIrptkzyamf6dry2eYtm
	QdpF5DOu3JUYRZX65sCapFYzMOvFzIJFoJn1//mAyJyoso+jauo4ycsVqoAarP9blKFBjE7N0F7
	sTg01Ck1gQ5XgafZud4EsSNHIGTQlUOcYMNAyKTp+Wq3kQpSRQ1au2ZS3191gNZxleGdZ5ne5x+
	u1jIEglxUdqpjtt6owtdKoAhA2DghGgFI0aBhflZBsm3WJKXs4nbX0U6TIP4gYt6cbEx1381ZlC
	aUD3ra998O/PFZ4EILZXr/mocci9dLxMX1YYOmMrrPvxf9LIp/M8=
X-Google-Smtp-Source: AGHT+IEyz6HQYrk+O6MoY8wcLOaI1LNLNqp9KFoNqbjcWyFA6+qCR8sHQ1vnoZ2UI2BL1IIuOuysjg==
X-Received: by 2002:a05:6000:2a5:b0:3a0:b84f:46de with SMTP id ffacd0b85a97d-3a340d2d410mr7532391f8f.21.1747236957315;
        Wed, 14 May 2025 08:35:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ac80:8bbf:3444:fa34? ([2001:8b0:aba:5f3c:ac80:8bbf:3444:fa34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3368f92sm36659485e9.7.2025.05.14.08.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 08:35:56 -0700 (PDT)
Message-ID: <9c0d9729ceca627da3295d4ff5ddcd1ab763d9c5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gcc: Fix riscv multilib issues in plain
 toolchains
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 14 May 2025 16:35:56 +0100
In-Reply-To: <CAMKF1soFWL9+SntQjv_JOPWLmAiNRxvc5nyqPAQ_ed1cHXyNfA@mail.gmail.com>
References: <20250514151718.1495233-1-richard.purdie@linuxfoundation.org>
	 <CAMKF1soFWL9+SntQjv_JOPWLmAiNRxvc5nyqPAQ_ed1cHXyNfA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 15:36:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216502

On Wed, 2025-05-14 at 08:32 -0700, Khem Raj wrote:
> On Wed, May 14, 2025 at 8:17=E2=80=AFAM Richard Purdie via
> lists.openembedded.org
> <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
> >=20
> > RISC-V multilib currently doesn't work at all. We could disable multili=
b for
> > the riscv platform but that would then behave differently to all our ot=
hers.
> > Instead, copy the non-multilib config over the multilib config for now =
for
> > riscv, meaning we can keep the platforms similar.
> >=20
> > This isn't quite enough as the triplet specific c++ headers are in the =
wrong
> > place leading to compiler issues and testimage failures. Work around th=
at too
> > until someone adds full multilib support for the platform (if desired).
> >=20
>=20
> This is in-line with what we have done so far so I am good that way.
> The multilib mapping
> makes me nervous though, it just keeps growing and it might not be
> sufficient for bare metal
> multilib cases. I think we need some re-doing to accommodate it.

Agreed, this will need further work but it at least puts things in line
with what we have already. The multilib code could probably do with
rethinking in general. The c++ header changes in the gcc-runtime recipe
are depressing.

Cheers,

Richard


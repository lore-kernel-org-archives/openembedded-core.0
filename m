Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E05D6C54E90
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 15:38:00 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web10.26829.1747928272802615668
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 08:37:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jD77hyCk;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2dfb991cb45so3208834fac.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 08:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747928272; x=1748533072; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=32lsP1WZdDkPtYZu4kD0flNvDxDqFGKzB54ElkvDDe0=;
        b=jD77hyCkzdp0A2m4XGlhnfHOXQfFRSnB78qdoNjKalUAPD4cMe3ksvcgeLoxq7x6Yf
         JCUaOhUojEyogahyvzZtoPdjlzIWC/LWF7Q2UoTS+tpD7iPqtB6jT405O36At56XY2Pa
         FPylWZPyuTZzSK9cXYRcyowTnke4pxzRbc80aU7s76POa65MFIvmrmGyCqB64sDYTLQY
         hg/JoXEKgJGSOq9dv1wfyMR3O+XSKinfpJjqLuLErm2NRPGoB21rDNYU6m5LCyXCp9ZK
         1HcYHGegZiLrrxqnfme0YkCzljqnkmJBnXJxusUNEjv7srY5hr1tpOrGVQIw1fotHLG9
         NxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747928272; x=1748533072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=32lsP1WZdDkPtYZu4kD0flNvDxDqFGKzB54ElkvDDe0=;
        b=vCBglx9PBdaxhjLm/DOLVzyC7zsSS81q7cush4dtDyNDsQuUheYna37hZZ303QGeDs
         9OeqLyHtajzG8UCvY04UI+T8swtMH2RR6pH503/DnuEZMEuHKufly9ypag7i+OakdTc8
         0/YjDOo0Z/5vcp7tSeGOhkISJq9SvayWxX4bpmG0PR0oU2s9ExOnQcigjfGBkjJN1pd1
         Mqme/mZSFakie7R2TzS5NUUcURkPDxhm+b2RKF7gHaEaaVP/RZpzRlugszJ9INlzvgcJ
         UUwLj7gKRh+wg4s7ClCLVA2A/DbtadlNpwWozoDCv1RT5gSuI5Fuc47tF2MvXXLff64f
         uKKw==
X-Gm-Message-State: AOJu0YwjAlaIE+fGsxKAGkHBZW2WTlRgs42isOqcopJJL3jKLQnGoBkG
	NhQU8rW8oSYE7c4XcUBAC7klpB8IUd90/bPzKl6FCIJCD6hOVRfPCvWsJpj/x7bM53kjVOh4N5p
	dVw5njgBbT/eFLHtY6u3i78mpnlvat1FcLnB3
X-Gm-Gg: ASbGncu2exgdp6dOZAHjh7ITM8mpBv0DWONZIQ3S4e/NH/GzxSYtPZY0EkLoKAQNKy9
	yKCOLhxpBXWjxaMMy8wVYbCUCCcC3SvXvpG0ORIqUa871/6JiV7WshFhBsLo3Ie8XlucmLv3ZRF
	wv/9bqj1qvsa8LD9cwkm5x6e5qkdwF+mluGwn3VXb/rfE=
X-Google-Smtp-Source: AGHT+IG7+yWSjQk2kGyOVCOggLXI926Rwe1X2ihBj21e2QsIDVt7qsndl/GU69vI/qlyRTmmIyoSW2hA7WaKLDA5BT8=
X-Received: by 2002:a05:6871:33a0:b0:2c2:519e:d9a9 with SMTP id
 586e51a60fabf-2e3c1ecff1bmr14667823fac.24.1747928271655; Thu, 22 May 2025
 08:37:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
 <20250520-clang-toolchain-v2-11-db97c2eb3756@gmail.com> <BC7C69FC-ABCD-4A5F-9405-BE36F857F193@arm.com>
In-Reply-To: <BC7C69FC-ABCD-4A5F-9405-BE36F857F193@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 May 2025 08:37:25 -0700
X-Gm-Features: AX0GCFsIZ5s7sdg6urU-y3Q4-YHDuOeP5-ddUwwyOPxP3Es5Earz3mKmmrRO2vk
Message-ID: <CAMKF1socSwx205F+As1u2Sf_8M9eitg3uKeOeTQ-qKRapG0A5Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 11/28] vulkan-samples: Disable
 overriding-option as error
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 15:38:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217129

On Thu, May 22, 2025 at 2:55=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:
>
>
>
> > On 21 May 2025, at 07:19, Khem Raj via lists.openembedded.org <raj.khem=
=3Dgmail.com@lists.openembedded.org> wrote:
> > +# Clang is fussy about incompatible options on aarch64/x86_64
> > +# x86_64-poky-linux-clang++: error: overriding '-ffp-model=3Dprecise' =
option with '-ffp-contract=3Dfast' [-Werror,-Woverriding-option]
> > +CXXFLAGS:append:toolchain-clang =3D " -Wno-error=3Doverriding-option"
>
> Where are these conflicting flags coming from? Feels like we should be fi=
xing the upstream Makefiles instead?

Maybe, the end effect is that the last option wins and that is correct
here so I did not see a need to fix it. If someone wants to
that is appreciated,

>
> Ross


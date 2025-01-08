Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA800E77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 13:23:51 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.18687.1736342623717650398
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 05:23:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=f78/p9Rk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso5515845e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 05:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736342622; x=1736947422; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cIvqG8tcsDTcxWTuoiJB2e1bpYRv0aWUXh6T795JVBs=;
        b=f78/p9Rkf9SgB06Ui6g1Wc3Kedcs/HBU9F6qp/6fkys870QEY0zW2io541U2q8KL33
         Wu1R1NcSnCQRKxAhog2WmHL9VpO3yz+jSqarpEHKefzA4Nvqxny51qcJKhT6ZDahj/sz
         br7Hn8Np/coAiT08ZIMAXfNTk0pnvPmgfYjkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736342622; x=1736947422;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cIvqG8tcsDTcxWTuoiJB2e1bpYRv0aWUXh6T795JVBs=;
        b=daBX4oEWsdiwSG+JMRQOYRhwO/pnbiueQjzhJDDjMO8kFEW720847+vTFb57OBuGQk
         uxVWWj2Gu8tUYBBBMN7Bz9ZdCyIfMXCnOQk4ofL9jT3C2vmwnU6RrWkcoU35AViYWe3A
         n+kcOP9x5KSut5/+QgnmKDIyG2/l+Jj5UepcMndOaF8kCPDJRphZTIEdbwzHMTfXJcnI
         BVypomVEZ8JzUamJgx8J2apQeUqr2XUbms1Kajezxp1RNN19owjkauYve25dKCiVpBr6
         3JEd4b+iHPSeNDztyEsrFWrw3M6XXWhHs5L5bl2jH0p/GoJ5IOjAS/SdICm9hiCJnJCc
         lNaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVj2/7bhXZ54/J6HZtzBgOXBWiGBE3+/wZq9vHZ45DeiuRnNFzh0wlL+4e5MEILCE9iqv+CbQJRYc0ZspONAE3wPg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzEVqNeqZoeoldS8OtVx0SC5UjgihfD65UwrAsNv+PnMQnuLl/e
	jQZU9ZWyNwk20Zrg87SJqkeDbdgE3kYbXODC3sTHmGLOqrdd7FTn4jz6mGZckag=
X-Gm-Gg: ASbGncvKJ+7bVpNa9NEplSxSrbAsy+cY6Ca8QojOIKWdYufVFfNLg9wLtGPb42CtOHd
	tItEttgw1fp1682k0I+iAIzifZqRiAgjXcMKmRjcxONQ5SiIrDe3CiD8Ke62/SQzWH6/RoNYojl
	4QSjVZwvbifaZfWOBRurPP5c6I/a/DQGYpQ9lPdte08maQQbLYPhuHWfnk4dqNNjHfC2fuVlelR
	ixuZ6iVyzcN0sr6ZZxYDc1vEYXs39gYm/24JCF5PvTk9/lb/DcVhjpW1WFGAAl96HNtra6lquDR
	P4XEoeLwX6KR+VM8UtgID2v2Qm/lrKZtzZP6tSde7AsinA==
X-Google-Smtp-Source: AGHT+IECRmbzr8ok0w8IroLOazeBiMEljkQPh8zgfdhTeBxgMOJom1S9nDJzBn2v5Q8452tXj8KxGA==
X-Received: by 2002:a05:600c:5252:b0:436:e3ea:64dd with SMTP id 5b1f17b1804b1-436e3ea65a1mr17118385e9.11.1736342622119;
        Wed, 08 Jan 2025 05:23:42 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:906a:f5af:b180:de5a? ([2001:8b0:aba:5f3c:906a:f5af:b180:de5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2ddc5f5sm20652935e9.18.2025.01.08.05.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 05:23:41 -0800 (PST)
Message-ID: <a1862f6aa78a3b74025451f3d5872cdd2859200f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] glibc: Revert clang float128 patch
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Date: Wed, 08 Jan 2025 13:23:39 +0000
In-Reply-To: <20250108033627.2889555-1-raj.khem@gmail.com>
References: <20250108033627.2889555-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 13:23:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209559

On Tue, 2025-01-07 at 19:36 -0800, Khem Raj via lists.openembedded.org wrot=
e:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0...e-__HAVE_FLOAT128-for-Clang-and-use-.patch | 87 ++++++++++++++++=
+++
> =C2=A0meta/recipes-core/glibc/glibc_2.41.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A02 files changed, 88 insertions(+)
> =C2=A0create mode 100644 meta/recipes-core/glibc/glibc/0001-Revert-x86-De=
fine-__HAVE_FLOAT128-for-Clang-and-use-.patch
>=20
> diff --git a/meta/recipes-core/glibc/glibc/0001-Revert-x86-Define-__HAVE_=
FLOAT128-for-Clang-and-use-.patch b/meta/recipes-core/glibc/glibc/0001-Reve=
rt-x86-Define-__HAVE_FLOAT128-for-Clang-and-use-.patch
> new file mode 100644
> index 00000000000..88823cb95bc
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0001-Revert-x86-Define-__HAVE_FLOAT12=
8-for-Clang-and-use-.patch
> @@ -0,0 +1,87 @@
> +From b662179d7c679e423b8595e0509253688544a4fd Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Thu, 26 Dec 2024 18:59:26 -0800
> +Subject: [PATCH] Revert "x86: Define __HAVE_FLOAT128 for Clang and use
> + __builtin_*f128 code path"
> +
> +This reverts commit d773aff467840f5ed305e40c180466e90bd88183.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + sysdeps/x86/bits/floatn.h | 24 ++++++++----------------
> + 1 file changed, 8 insertions(+), 16 deletions(-)
> +

Why?

Neither the commit message or the patch header have any information
about why we need to do this...

Cheers,

Richard


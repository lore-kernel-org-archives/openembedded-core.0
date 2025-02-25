Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC9F3C021BB
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 22:36:24 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.1163.1740522976949557526
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 14:36:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZCOkXOJB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-439a1e8ba83so58505655e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 14:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1740522975; x=1741127775; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=r4kFuXnePZa0iJltaEYZ6DmAOgadV+22jy52v0aQnSE=;
        b=ZCOkXOJBrFpLdPoT5Nhk+q3Kadn+dubfZ0IOrnaHtqfa1PtXA6WAEmrpczrECxBlxW
         c9zBRax5HR6QU4ZWKN2dzihtQNytKnBBLN2dLedxEhJNpdg014QGPaZzxLBIDOd2KTUL
         3NYuYkHGOWEf1D0T1VGR3AV/1NSsvjeZdFylc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740522975; x=1741127775;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r4kFuXnePZa0iJltaEYZ6DmAOgadV+22jy52v0aQnSE=;
        b=FSiLKeH0VzJTDsP/7ZMB9TEu95gGa4/6F9EvKb1YKfW8UpzmSzc6lJmJnjU2LPbgbz
         0GysdzzgZrtLBME1mp7SVklX9G+mipZ6qo+OSyJC81w/hyCxXRcxuLoUPoigKMxblYeK
         Y82v9bE7hYXBaiH0N4F+I+Ma3jdjIO6E90B1FQa5GZCfxNfcFtjOWYUURJCvqhHpIUBj
         LQ2CF1o9YE8vYa1x0IRA5zwY+7/6hahgSXNfoEhXFBQ6dFOCkLKed67NEASGM44hZu3a
         3Z8ea+5xvucePWBmf6tU1Y39gqVGnAL9m4NirHugPG3qGEXdN3NBQB4zDmpCLcHB1z3F
         4/KA==
X-Forwarded-Encrypted: i=1; AJvYcCVgP8QLRuBl9cK/EJLoXGG5ShoyQQXUOKdHRRY+A2EXji5+y2hVygPg4pGknVqYUPOwtu6ovWYsPQRTeTmL926a9Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz0c4DXTS8o2P+4r1vzNimMeOP/tGvVSr0U9KMNX7oxWKnui2d8
	JFdRu/byEeS/jlojsMZo/1ikZEmtiB3+L5CifUEcsl2mntyTJSoWZDAB6syJmGE=
X-Gm-Gg: ASbGncsGHODiC9aAYxK4VLsV/nuyKqogR6jgVrIi/YQn4LmA0xoy+UZtIJvaCHqpdar
	myfPseWqXmsNPHs0GM90q1qdm6RouyAD4ZtNWVtfozEgk4jhme/pfP1exzJgoJjmgneGkJMghag
	cZQuEyNfQxzX5CZ4weZBPgOENGz0pPaPulkGeKY8oWLB+TBs+GxQXXjSfpdd7swJkSeoDBIZJNx
	b3s7vFgcfnpgViuKifstMLJRWPViMEfjIqp0LfXjAsRXsV8RSy25KoYYd7G2J5W7cP7AOz+B0x+
	5t6biDwN6iEQcPD95LFzHNuvUjDAgCeEWAdAZQFeAYS642NJu01iGOV1MZ+9Uts40gtFlqiA4tK
	Hy8xVfGlLimbF/j0=
X-Google-Smtp-Source: AGHT+IFS1aB/5BAczyQiqKSBQsi8P7vYuGa+tV47IwPSfMioLMCrNyl/dtzJZhMg30aVgWWzDiwngA==
X-Received: by 2002:a05:600c:1d1a:b0:439:9537:e96b with SMTP id 5b1f17b1804b1-439aeb34990mr189296015e9.14.1740522975326;
        Tue, 25 Feb 2025 14:36:15 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:22f0:312b:471e:e7f1? ([2001:8b0:aba:5f3c:22f0:312b:471e:e7f1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba58760bsm1447445e9.38.2025.02.25.14.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 14:36:13 -0800 (PST)
Message-ID: <6b39f92c9a5422a5155e2f3c7bec64a886858e58.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rpm-sequoia-crypto-policy: clean up
 dependencies
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: zboszor@gmail.com, openembedded-core@lists.openembedded.org
Cc: Ross Burton <Ross.Burton@arm.com>
Date: Tue, 25 Feb 2025 22:36:12 +0000
In-Reply-To: <20250224050848.2216918-1-zboszor@gmail.com>
References: <20250224050848.2216918-1-zboszor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 22:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211935

On Mon, 2025-02-24 at 06:08 +0100, Zoltan Boszormenyi via lists.openembedde=
d.org wrote:
> Rely on host-provided python3, coreutils and make.
>=20
> openssl-native is not needed either, as the build scripts
> use crypto functionality via python.
>=20
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
> =C2=A0.../rpm-sequoia/rpm-sequoia-crypto-policy_git.bb=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 +---
> =C2=A01 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_=
git.bb b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
> index 098881e3da..dcc0c7264c 100644
> --- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
> +++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
> @@ -5,9 +5,7 @@ LICENSE =3D "LGPL-2.1-or-later"
> =C2=A0
> =C2=A0LIC_FILES_CHKSUM =3D "file://COPYING.LESSER;md5=3Da6f89e2100d9b6cdf=
fcea4f398e37343"
> =C2=A0
> -DEPENDS =3D "coreutils-native openssl-native make-native"
> -
> -inherit allarch python3native
> +inherit allarch
> =C2=A0
> =C2=A0SRC_URI =3D "git://gitlab.com/redhat-crypto/fedora-crypto-policies.=
git;protocol=3Dhttps;branch=3Dmaster"
> =C2=A0


It looks like the python script in there needs python 3.11 for tomllib;

https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/1100

so the other pieces are good but we probably need the python dependency
unfortunately. Could you tweak the patch please?

It may be worth leaving a comment that we can use python from the host
system when we have 3.11 as the min version.

Cheers,

Richard


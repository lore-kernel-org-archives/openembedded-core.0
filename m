Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1BDCC5AE59
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 09:40:37 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.7242.1748943635440514469
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 02:40:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OCJ3el3/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a35c894313so4847506f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 02:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748943634; x=1749548434; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4ZvI6I03g4KNjleLCnrMHhkhhpytsirZtnsEzRjhR4=;
        b=OCJ3el3/QMjxLUAag2yC+xOepRG13+eER3N79LMVxdigAf5aNig7FoaufPR9rea8Ft
         5E9LwrVHilUC/woW6FuWTJZjvc6N5D0m/5GgdXESn35xXNFZhv2qa5qdr0YmEnKPj0rI
         /eLUPttlCbq+twSi2UUSg5S3NICQh0YgfEtMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748943634; x=1749548434;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R4ZvI6I03g4KNjleLCnrMHhkhhpytsirZtnsEzRjhR4=;
        b=ewQ1JssBr3BUKU2KPabBM6+WVlpdpfQfUll/ZQFd0CBaKV+NEqM5pqHfnZ0Pd+51GU
         IKh4qZKN3A12XA/HhmRvapTGwxngTvTLOfeulkcGUHaso7w3r+BCTcbVDIqDO9goouh7
         aRfBGqYeThFYN/2se1ml8q0Pjny/mPxARjpzLYzag0UDfc2EjufknqhWRfcLwZBlsXv/
         nPooO4bvxmzWp9L8hH0ho7Tw87UEeJEPjUyj6U9uCcLLEjQnbmrSnhd6TFD0dEKsLfYO
         cSEOHxsSx7nllNi0YR5ezlMkre7A+kQoPA0YV8V0eWaQZl3IuhkZJzbwWQ6kLBokXpzH
         CnXg==
X-Forwarded-Encrypted: i=1; AJvYcCUl7+2Tpy72diTMR+NPj0dVVs3/dA+kKZzANoG9Q7a0/RWeJJyAv1juWVZglQ7PdNWcUv+xrfpm2VoWKol2Pril6g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyEYgo7wUw6wtsmTbHcKVx4mKjLoGKiWQ3JayyFdSfZmi/BBgeV
	X1UqP8Cl5jaRvxv+0U5Yg2PDU4FXywdUbBMlXPIvZDrfCKHKs5RZR9VPHApQN0kP6gE=
X-Gm-Gg: ASbGnctD7w+Ry+bpzJxbyLJAT5oV8bVp+tkH5m7Yd4uIZrzf2w177KhoGSZ9p74fpsh
	/YrKE2c4YyDKdaKSikJ5MqhQ4cz1zDND8nfuDG+wK/TqawmjsCjvdLYVnvtzovHTSv+U8XSmBkD
	GIlS31EsJ0CqFjJxn0ohIQiBe9KrXTvWdyEN0NtOHMXn8uPjWeFS1zYNaxBAArRvncWOy1Tjjyo
	ETO3uz5WZVYMv1vEFme2WoaiPw2QHaoI2956vVKs/ufARiY01dVZ9R1uxYRjeQoxbuq1WNdj6ON
	qOPqKl7QJlzR7078nvtgwjSQVbzKNjPdUmvF4DLOpoLTGhYCgWv5DCEQ0StHXriVgDp2R191edQ
	v4VUF6ICqcWOr6tK++JDOTGsvnKHeCb9xLSpRQ2j7
X-Google-Smtp-Source: AGHT+IHRGj4+jYMHHVVkA3euNWlxIfMKByONENHXmP9EsJZfnGHsBOIrxbopdNfr7FLxL/qW+3sSqA==
X-Received: by 2002:a05:6000:2283:b0:3a3:652d:1640 with SMTP id ffacd0b85a97d-3a4fe160ba5mr9560288f8f.2.1748943633750;
        Tue, 03 Jun 2025 02:40:33 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3864:8101:3606:8242? ([2001:8b0:aba:5f3c:3864:8101:3606:8242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f8f1adsm156801545e9.7.2025.06.03.02.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 02:40:33 -0700 (PDT)
Message-ID: <b535bfb0baaa86f325ff88e21b8bf3a8378b4635.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/1] icecc: calculate pn and bpn from FILE
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: peter.suti@streamunlimited.com, openembedded-core@lists.openembedded.org
Date: Tue, 03 Jun 2025 10:40:32 +0100
In-Reply-To: <20250603085808.4045687-1-peter.suti@streamunlimited.com>
References: <20250603085808.4045687-1-peter.suti@streamunlimited.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 09:40:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217795

On Tue, 2025-06-03 at 10:58 +0200, Peter Suti via lists.openembedded.org wr=
ote:
> Starting with Yocto Mickledore the PN and BPN variables are set to "no-pn=
"
> at this point in the `use_icecc()` function, so instead we need to
> re-parse them from the file again as a workaround otherwise icecc is brok=
en.
>=20
> Fixes: 3be00ad9052de ("bitbake.conf: Add BB_HASH_CODEPARSER_VALS")
> Where "PN=3Dnopn" is set to optimise the codeparser cache's size.
>=20
> [0] https://lists.yoctoproject.org/g/yocto/topic/icecc_support_broken/103=
429714
>=20
> Signed-off-by: Peter Suti <peter.suti@streamunlimited.com>
> ---
> =C2=A0meta/classes/icecc.bbclass | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
> index 8a48f2ad63..e3b07028b8 100644
> --- a/meta/classes/icecc.bbclass
> +++ b/meta/classes/icecc.bbclass
> @@ -143,8 +143,8 @@ def use_icecc(bb,d):
> =C2=A0=C2=A0=C2=A0=C2=A0 if icecc_is_cross_canadian(bb, d):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return "no"
> =C2=A0
> -=C2=A0=C2=A0=C2=A0 pn =3D d.getVar('PN')
> -=C2=A0=C2=A0=C2=A0 bpn =3D d.getVar('BPN')
> +=C2=A0=C2=A0=C2=A0 pn =3D bb.parse.vars_from_file(d.getVar('FILE', False=
),d)[0] or 'defaultpkgname'
> +=C2=A0=C2=A0=C2=A0 bpn =3D oe.utils.prune_suffix(pn, d.getVar('SPECIAL_P=
KGSUFFIX').split(), d)
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 # Enable/disable checks are made against BPN, be=
cause there is a good
> =C2=A0=C2=A0=C2=A0=C2=A0 # chance that if icecc should be skipped for a r=
ecipe, it should be skipped

Unfortunately PN could be set differently to that, or set through class
extensions so I don't think this is a good way to fix the issue. It
does highlight that icecc probably just worked through luck anyway. It
would get it approximately right most of the time but I'm not sure we
want to rely on that.

To be honest, I'm more tempted to simply remove icecc since it would
seem not a lot of people are using it if it takes this long for fixes
to get sent :/.

Cheers,

Richard


Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 219D6C531CA
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 13:28:01 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23435.1784813275112215488
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 06:27:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QlSPOlGX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so4489875e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 06:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1784813273; x=1785418073; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ggk4Kgttslmb3tbdrRzgt5ySlwukFIahlWHX9W4QNiI=;
        b=QlSPOlGXYKVo0zMZ5IF8mLlU3lMKfpeBJFecNTn7P39ky2tBGnfp16QfQoi3jH+hT4
         QguYvTG8ueoMdXlXxyNDNmyE0q4tOgC7WZa37xruCjhbiyOFzrP5xtfl1J0/OZAqq1wn
         cPIe7KeHlhdNUOqofr//g4NldO9SRpqlT2azc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784813273; x=1785418073;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ggk4Kgttslmb3tbdrRzgt5ySlwukFIahlWHX9W4QNiI=;
        b=ojiy+ZzWRqDWxgZc4/z2AtTa2ez5K8AGyQrnUq+13foxNfPpyG4qILs9lIIBMaEYeZ
         9KxJQeK880xN+GyUt3v6wkfmBhJh3IRzhFe7bS5kp9goNeAq/mpjtpSYPVtz+YsSbG86
         ZcXw8qeHrArBMtkoRkLH62i2gdS7bZikB/OXPML3PAq4twQrJrpAv6kGY9YXE0429oiq
         jl3v0o53IforMnb6Y+UIHiIdw0+v15gohwHD8igF5gjqELa/08rV8IsRcZH+yTi9ypSd
         o/wuIjGDdO8lh902amKTd2udqvU9UwQdRrYjzVFVmQUUoi0W2qc96ix+9iIKo0n8pxbV
         vVow==
X-Forwarded-Encrypted: i=1; AHgh+RoSHpi1dRhCJDPgQcLJkqs0cwFIBR6kGfAgjrRu7RlEjGsuSbE6JZRIDQjL7nkabBe+W032x6mrTed/9tcEj/qWNQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwRy5jOE4Y2jkqK/wbBS/sQ0IlLqjVCK14J/Qjuxbb2FJFFIQlK
	Ozd+QFnYusjmmkvuHe+oNDFwcRbivHKpdRnGmw0hvy2wF8el2xI+zgsAzJxq35WlPwc=
X-Gm-Gg: AR+sD101zHC6+Gv98xnlJzKJCSUhCv9Ef/RkKClFvZY+d+0ERxyGv19CRvREKU+AHc0
	ND0vYzP7zZ4/PYG1u1nbJLoVX55XTDyivN6mElrtlr4N8u1XgOnscsCZAPk5pad6zPTSNAxnbxt
	imyxgwGVc7uLWs9Qu5DFrGa9ucDafWW9SDxG472c/jUA0R5VQPlrH0ozXR0Yu8eGWwhGpLTj1Nq
	YsHnFFF506hpmhwKa3EzwRDDwtof0WyN0t3NxGXAUV0VPjzYZQsnFf20Jp4n3wrThMzXKWjHfT2
	uDtEq4GfXPUZjv3+ArhsHG7UdXLTvkMK/tCEyskETkXRc4djlImHRciFOPQIgrmx82FIDg6PCF2
	a+b9ssVF1VDVeb3kHFRAGB4Cs2O6enKzny9AJhbb0JJN2j0jEp49TLdosn7V8rDDSxjh2M1kp44
	3l+oO5TpDILADJ5f70FU2kPBBO5boyVap01K/rgXzPgjEQR8WVlC5It0SCN1PLuSYrWSQ=
X-Received: by 2002:a05:600c:c05a:b0:495:5eca:f9b3 with SMTP id 5b1f17b1804b1-49573d0ccf7mr37433865e9.26.1784813273249;
        Thu, 23 Jul 2026 06:27:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2205:d253:2df6:b9d5? ([2001:8b0:aba:5f3c:2205:d253:2df6:b9d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956bc68d4esm94498055e9.0.2026.07.23.06.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 06:27:51 -0700 (PDT)
Message-ID: <80a142f35e9362deda84c93537bde34b44caf0c0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] devtool: standard: guess srcrev update
 mode for gitsm:// recipes too
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bbnpreetsingh@gmail.com, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Chris Laplante
	 <chris.laplante@agilent.com>, Peter Kjellerstedt <pkj@axis.com>, Adrian
 Freihofer <adrian.freihofer@siemens.com>
Date: Thu, 23 Jul 2026 14:27:50 +0100
In-Reply-To: <20260723060209.8-1-bbnpreetsingh@gmail.com>
References: <20260723060209.8-1-bbnpreetsingh@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 13:28:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241838

On Thu, 2026-07-23 at 06:02 +0000, Baban via lists.openembedded.org wrote:
> 'devtool update-recipe' and 'devtool finish' default to guessing the
> recipe update mode: 'srcrev' when the source tree HEAD sits on the
> upstream branch (the "checked out another upstream revision" workflow),
> 'patch' otherwise. The guesser matches SRC_URI entries against a
> literal 'git://' prefix, so a gitsm:// recipe never has any git URIs
> from its point of view and always falls into patch mode.
>=20
> In that case there are no local commits to export either, so checking
> out a different upstream revision and running update-recipe reports
> "No patches or files need updating" and silently leaves the recipe's
> SRCREV untouched, while the same operation on a git:// recipe updates
> SRCREV. Forcing -m srcrev works, since _update_recipe_srcrev() is
> scheme-agnostic; only the guess is broken.
>=20
> Accept gitsm:// URIs the same way e7076f1742 ("devtool: gitsm://
> should be handled same as git:// in upgrades") did for the upgrade
> path, where the same omission was fixed; the guesser itself dates from
> 9b9733b7d7 (2015), before gitsm handling was a consideration.
>=20
> Note this changes the guessed mode for existing gitsm:// recipes from
> 'patch' to 'srcrev' when HEAD is on the upstream branch =E2=80=94 the beh=
avior
> git:// recipes have had since 2015. Trees carrying local commits still
> guess 'patch', because their HEAD is not reachable from the upstream
> branch.
>=20
> AI-Generated: Uses Claude (claude-sonnet-5)
> Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
> ---
> =C2=A0scripts/lib/devtool/standard.py | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standa=
rd.py
> index b2b27c7ced..2dff62a7ca 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -1816,7 +1816,7 @@ def _guess_recipe_update_mode(srctree, rdata):
> =C2=A0=C2=A0=C2=A0=C2=A0 """Guess the recipe update mode to use"""
> =C2=A0=C2=A0=C2=A0=C2=A0 import bb.process
> =C2=A0=C2=A0=C2=A0=C2=A0 src_uri =3D (rdata.getVar('SRC_URI') or '').spli=
t()
> -=C2=A0=C2=A0=C2=A0 git_uris =3D [uri for uri in src_uri if uri.startswit=
h('git://')]
> +=C2=A0=C2=A0=C2=A0 git_uris =3D [uri for uri in src_uri if uri.startswit=
h('git://') or uri.startswith('gitsm://')]

There is a slightly neater python syntax for that:

    git_uris =3D [uri for uri in src_uri if uri.startswith(('git://', 'gits=
m://'))]

as startswith can take a tuple.

Cheers,

Richard


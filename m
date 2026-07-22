Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64934C44512
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 06:49:22 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42407.1784702961552369527
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 23:49:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=e4LU4tux;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4954afac04bso44511985e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 23:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1784702960; x=1785307760; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5POEc3BAbkRRSutdyOlneW0svq9HB9dhIXzvK5g8Wog=;
        b=e4LU4tux28pp3xN+a3D2Uww/y6BNBn+XW/LUUxPU21gAC4tYR03V/Ydh8H8Iq8OB5E
         t1rG/yowCbtqUE2bp3mMxuxgIPimf0OxVz2Oy7UkjsLtEMpt1FUIKbbqsjr1UdvT1Y/b
         Sj7DThWOKpXMQNgjnicQPZMhp4gwqTikgLdCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784702960; x=1785307760;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5POEc3BAbkRRSutdyOlneW0svq9HB9dhIXzvK5g8Wog=;
        b=PdfA0bacvlEY1AZuI8sJLvqp6SnOiz+3m5MuiAocQHIf0SmeFfYm1FGUuzIvlD6E96
         OwFE1Iu94xaNekkmRFbA1rmADPMg4XA8GgDEI6Ze0mxBajcozSEZrtpI10Drbw/xCIWv
         GZOSMhossoGiV3SbtjLYoeFAhRZYc2e5hxUMR3/UlYpaJv/oeb4Jefi0/qXwHj3v19tv
         iECEJiNyEqG2MgbnDCLaW01mrFOlEwsxc6aaOuhomGLPxoGKPp/SwbRTITdNZiaunjnc
         hb5JnEvOqabQmhIXjGh2ZFCEoS/4Z7SC4/qv2j+ZmXMNGN0OjprklPGsBox0fP/tQtGT
         /mXA==
X-Gm-Message-State: AOJu0YwGuadnNTd9KQdMhuNTUc2+uV12U83PJpiTfXhbYtbQEDYSemcP
	Qh25o4+hVqLHmgT0ICs6Sm2a3h56yr/YCf8QO1XNG4r6rTVmlrX4PMmjwbSwS1pOwwM=
X-Gm-Gg: AR+sD12ubaCVLXoBiebHb95tKddtpykmSZ5z4vZpIFfYQdLPHEabakFEte46cy7Ag80
	7WbjQs19rKUTPc9yuC3G9efkxo6N5+RvIGpiuUFrc+4fyHMmhaEmeo0ugbXNrjwhkQOZG6bJ8j2
	S0jJSefkikWDFVvJIDIAMEzs152xhmplChMI7OldQsv+W/t3snekDh7k+Wy1edHHm264Gph03Rb
	RoCkxRlHtMGruJAdXaN1APhPitmWuW34MpDhuXVw+mlaQ+j3B4mS2mKFrL2BJzJYZ+WOxi/oaEx
	EBF+PA+kTQE1VRiHA/kAfI6g/4lbMx6HWD0Q1rtvfHhDd1XkW7Sir9F8L2LYNJOuuBkgC90xkrh
	yNgy6t3jc+LQ5RZInqNAJc7zVnRT+ipmimQt8Y+BlNQ0SyixzLvsqSOz5PDoDBGidysX4DJQO6U
	OiVIv63rMnZn/SlPMx0PgrfSv9EGWFgTaH1Rh70/SlIhZUWYNe25Oj9938pUlLNhJfuVg=
X-Received: by 2002:a05:600c:2156:b0:493:f822:ac5e with SMTP id 5b1f17b1804b1-4954a411570mr200145075e9.23.1784702959758;
        Tue, 21 Jul 2026 23:49:19 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2add:73ee:28e7:c242? ([2001:8b0:aba:5f3c:2add:73ee:28e7:c242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a508aa6sm48302125e9.7.2026.07.21.23.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:49:18 -0700 (PDT)
Message-ID: <e0b6b290108ede092a5601fb5b1e2dbc07891266.camel@linuxfoundation.org>
Subject: Re: [PATCH 2/2] linux-yocto-dev: enable BSP config audit reporting
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jul 2026 07:49:18 +0100
In-Reply-To: <20260722035139.1349872-2-bruce.ashfield@gmail.com>
References: <20260722035139.1349872-1-bruce.ashfield@gmail.com>
	 <20260722035139.1349872-2-bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 06:49:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241601

On Tue, 2026-07-21 at 23:51 -0400, bruce.ashfield@gmail.com wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>=20
> linux-yocto-dev did not set KCONF_BSP_AUDIT_LEVEL, so it inherited the
> kernel-yocto.bbclass default of 0. That silently suppresses the 'invalid
> fragment elements' and 'redefinition' audit categories: do_kernel_configc=
heck
> still runs and still writes .kernel-meta/cfg/{invalid,redefinition}.txt, =
but
> nothing is ever reported to the user.
>=20
> This was hiding real breakage. Five config options removed upstream in v7=
.1
> (CONFIG_HAMRADIO, CONFIG_CRYPTO_MICHAEL_MIC, CONFIG_ISDN, CONFIG_ISDN_CAP=
I,
> CONFIG_NF_CT_PROTO_UDPLITE) sat stale in the kernel-cache fragments for a
> full release cycle without a single warning.
>=20
> The versioned recipes already set this (linux-yocto and linux-yocto-rt us=
e
> 1, linux-yocto-tiny uses 2); the dev recipe being the sole exception is
> backwards, since the dev kernel tracks a moving upstream and is precisely
> where dropped symbols should surface first.
>=20
> Set it to 1 to match linux-yocto.
>=20
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
> =C2=A0meta/recipes-kernel/linux/linux-yocto-dev.bb | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-=
kernel/linux/linux-yocto-dev.bb
> index f82f3c326b..ef6e1e0759 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> @@ -16,6 +16,7 @@ include recipes-kernel/linux/linux-yocto-dev-revisions.=
inc
> =C2=A0
> =C2=A0KBRANCH =3D "v7.2/standard/base"
> =C2=A0KMETA =3D "kernel-meta"
> +KCONF_BSP_AUDIT_LEVEL =3D "1"


Should we change the default now this is well established?

Cheers,

Richard



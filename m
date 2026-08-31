Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46878C624A4
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 14:21:11 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30723.1788186063706208658
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 07:21:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dl/TIPq3;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso49697155e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 07:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788186062; x=1788790862; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=urWNEQ5sTM09c0MzVGy++IrIxtshjcWu1b4Z7VzfbEg=;
        b=dl/TIPq3fRTOou89gW6k2VMV5qK7qIiFxb5YHcv6jDLsEMfd9iALBaPFklNZRyntfF
         rT+FXAd58ywaOr0xUhautXCvaltv1TdsIH9EslNC1sPxHIKnNlTT0G4Cb8Z+VVhH1LLe
         zbVGDc0jskb2cidluMUpLydbIQZk0UR1qjJyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788186062; x=1788790862;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=urWNEQ5sTM09c0MzVGy++IrIxtshjcWu1b4Z7VzfbEg=;
        b=bMdy+3sXyOgjRQ75QK6pSzv/Ng37R3k0cP9lwsIim/IF7wQ/BB1Du5iTKo0MU2T1fr
         vTAD06/E/GH8SCah1M2cPmCLSxrRY94NZHvtcqRbT9rX1b13Kh7sT+OJ0whE8U2W+qad
         AgwkKT9Ur3lt+ub48BzSGKdtJmkVSZlqXk6d6VAwdeO94c1wFn6/K2LXZjn88qLmmjJX
         V2KzKffYR6Pgx4sgkMH/EBekrEPXNPc7Si+BvTOOUlpzx5glsxdsSWFzBh2Pc6Kw1w7f
         ZdKmEewmiG+K+Z1P08NNwT4UPT308UoEHycJe2vXjjBQIX8LpSrKPJuprcOpaqQQbmJH
         2mRg==
X-Forwarded-Encrypted: i=1; AHgh+RplF3O3YE6sTsYAXLttTS50d7r//zkO1OeHMWWqD8tFGuKna9jsIDISZm/RfZ095Vl/wqK2Hmkm7tE2zNw4Zw4pjw==@lists.openembedded.org
X-Gm-Message-State: AFuF++kPGO7uFU9ILulG1qh+XRQRiK6Ohh6m8TJNuu8GTwsgKL9p/vEA
	5N7YGCy7olZp0w+97mT2+eGWDs1eDvBRCj3KRWz60QLOXmdRe8uRjulaZylfiGy2+K4=
X-Gm-Gg: AR+sD12V+KCueMO6cvdmxhkpZbNgvY9kM3yG/JKRF13bwe1SsNbeAmeg2v2UvWQ+FuS
	2+dR7DsI/YBACFZFSNgVCi6xoUvA8GMQdVqjJZnvcpptpYyYzXIWKTqsPbJnMMfNcUvPG3fsS0f
	6K8EcSmZ1ny4tF9t8sVN28qBskcof/N2bVTdvlbvoOH6zfRhYsKoUQKxMDTdn2pAdVGFGZVvvzx
	ZYPWN0ShCM74V6VL5gpiQJxLfenYIB3OerPoV2nCgrEaJyiy17nQaoQC6f3OHOK0nJX3FnRNngv
	OMxYNC8P51xZ53Ey9vjQmQPSucw5QrINUpZ2MDdhRMQp8T9Ez1BPzsL+txalf6FjbeWsrvKE/UI
	grmFj98NafamO0B9ZZMVuRI4lfTryc4vK/NHQNbNcm4CS3eeTVF4p7V0DQutgUKuAS0w0yO8J9v
	wtYw8ppqbsrV9Dtu/rEBtkWdNpXUoCmgjJKOauIYt4Ojy88KPsez9wQC68x1jMjxOkA7RjwIZxp
	jsrvp405TNP3IJ/HXLKlV/V3UfhkbidzyqRMJJuD4M74Rwn
X-Received: by 2002:a05:600c:4f8b:b0:49a:2c4b:403f with SMTP id 5b1f17b1804b1-49b91c46494mr350203505e9.13.1788186061782;
        Mon, 31 Aug 2026 07:21:01 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c5790csm242112955e9.0.2026.08.31.07.21.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 07:21:01 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Aug 2026 16:21:00 +0200
Message-Id: <DL371ZPMRYMX.3Q2T6B000L34F@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH v2] gnupg: Mark CVE-2025-68972 as
 upstream-wontfix
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <roland.kovacs@est.tech>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260821093052.1174778-1-roland.kovacs@est.tech>
In-Reply-To: <20260821093052.1174778-1-roland.kovacs@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 14:21:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244766

On Fri Aug 21, 2026 at 11:30 AM CEST, Roland Kov=C3=A1cs via lists.openembe=
dded.org wrote:
> Mark CVE-2025-68972 as upstream-wontfix based on mailing list discussion,
> where the maintainer states that "[...] this is wrong usage of a tool or =
social
> engineering".
>
> Link: https://lists.gnupg.org/pipermail/gnupg-devel/2026-January/036154.h=
tml
>
> Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
> ---
> v1: https://lists.openembedded.org/g/openembedded-core/message/243897
> v1 -> v2:
> 	- Fix patchtest complaint about empty commit message.
>  meta/recipes-support/gnupg/gnupg_2.4.9.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-support/gnupg/gnupg_2.4.9.bb b/meta/recipes-sup=
port/gnupg/gnupg_2.4.9.bb
> index c85de6047f..3ebea399d7 100644
> --- a/meta/recipes-support/gnupg/gnupg_2.4.9.bb
> +++ b/meta/recipes-support/gnupg/gnupg_2.4.9.bb
> @@ -85,3 +85,4 @@ lcl_maybe_fortify:mipsarch =3D ""
> =20
>  CVE_STATUS[CVE-2022-3219] =3D "upstream-wontfix: Upstream doesn't seem t=
o be keen on merging the proposed commit - https://dev.gnupg.org/T5993"
>  CVE_STATUS[CVE-2025-30258] =3D "cpe-stable-backport: fir for this CVE wa=
s backported to version 2.4.8"
> +CVE_STATUS[CVE-2025-68972] =3D "upstream-wontfix: Upstream considers thi=
s CVE invalid - https://lists.gnupg.org/pipermail/gnupg-devel/2026-January/=
036154.html"

Hello,

I don't think we need this fix since MITRE data shows CVE-2025-68972 only
affect <=3D 2.4.8 and we are at 2.4.9.

Regards,
--=20
Yoann Congal
Smile ECS



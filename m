Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E12F6CD4F24
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 09:47:35 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3877.1778665649327907684
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 02:47:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hzq0kh9s;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so63352115e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 02:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1778665648; x=1779270448; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vtE1ql1gCqEks8XYepdpduukzcNQk5zx/42+V9VEobw=;
        b=hzq0kh9ssqPfB7hGjl3ET4PHox7qRQWqFpcGr7Ivj/fS/EtaxlN44LKmBOKomIog+G
         l/1ElmMayEwxxyBDKnc0w200QfZ0DCX8MLlzQl+AlQa1RTvfDQEP2NRrRZlmMuZPCZCu
         qm4J7ZyWJUZi5Ne8lUCy/7BjRHyN2dmzyFVEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778665648; x=1779270448;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vtE1ql1gCqEks8XYepdpduukzcNQk5zx/42+V9VEobw=;
        b=Pu9tQ+mI+8meMVDofHU7HwhSEISHCSkrnPIy4LD6zYXSOLx2UCOGScOvWaPDv6ESFN
         IK4aXwQRH88aVE9h6gtwuwY48cZUgdVeodlVBXm1PdYk0j6XjUH0YP7znBkBLMIl9xMv
         1TMY9eJlPIdVyT2SqJMJlxS4+BWFCDnVkUYzhSwi20S7l0fxqGQM2ystvFFlDvwsLvTc
         1jYO98wY5fqUMmCb/RlrY0L0+GVibtF5rtoblWXCKZmw/zD4gxf3U/2sE8W3jhgFcT/f
         gJrDFTchHcivOTEPc0x1h6wKEG0GzXrRgIpFrJl8FxcWMweSf7GukzmM8b+1lRqsM/8C
         MkSg==
X-Forwarded-Encrypted: i=1; AFNElJ+/V66rby2bNyDvb9nfYIhapDNKZ5usCdsZvjFc8IAnf25SKEGMO7a6elaGBEZNUbupQIP4L8fEGEX5dUUQ0g2qlQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw/wrRun/gKRb5kvT7MIvRvJmCtjwqRpsnLtmxYJ6zvxp6iMbCa
	WxL7F8nHNeR3JN9zJs4hyNU6z4OYciShz876RSkRpeLPZTj+ET5/7qfvk1HlnKgWAgc=
X-Gm-Gg: Acq92OFg0ZCOv4ZujMycMYuIxqeapMK7s2OfgDK00mfjShG4WlylDauFEmdsPSsB+3m
	eMk+wP+9obnadyNyZkWTbXwW/1p9f+4Cakjl5pze9mhcxLHkXlOXj6qgaJVSjN/YJe2iSJYLs2f
	Cl24u3p9qh3I4kkNFc0n0lLvZ4WlG/pVCSjD3RoVQCVx5M2bMtgTV+rd9su3p1cjDJYPQPC1UUP
	7c9IqklHMRQgKVxP0W9RxTHaAU1OlkRaTwwXpq541n8jjWnZKtBjsEaMUGx1ZeemkP6uWp54n8r
	uExlve3bT8MB7GLIUF+3YJNG97zN8jreRBborIa1rj7tFi7NZ1QkMlLk+cxWSVWQwRJijFxyhQW
	wjLhNFsyJ4SjjXWWul0gEkDADQzKitLU9d2j1D2kkfbW5TEWST6P+xECQStuTAvd1uwTZGeHhlZ
	xu9Cm4LTFE3fD/3AefPOGEko7+f50kFlVR3TqGW+/25C3B2ZW30lm6gxcsvS0fS4NZZ1hPZLDHM
	I5mjQYVOFIrqF+H
X-Received: by 2002:a05:600c:190f:b0:487:1fb4:7e1 with SMTP id 5b1f17b1804b1-48fc9a4480emr37015345e9.22.1778665647691;
        Wed, 13 May 2026 02:47:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b7ef:b234:c010:91da? ([2001:8b0:aba:5f3c:b7ef:b234:c010:91da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8e7491edsm40080165e9.13.2026.05.13.02.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:47:27 -0700 (PDT)
Message-ID: <0c93fac040dec007b8555ac93258c41e141c215d.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] compiler-rt: fix DESCRIPTION variable name typo
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: thomas.perrot@bootlin.com, openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com
Date: Wed, 13 May 2026 10:47:25 +0100
In-Reply-To: <20260513090751.888177-1-thomas.perrot@bootlin.com>
References: <20260513090751.888177-1-thomas.perrot@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 09:47:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236954

On Wed, 2026-05-13 at 11:07 +0200, Thomas Perrot via
lists.openembedded.org wrote:
> From: Thomas Perrot <thomas.perrot@bootlin.com>
>=20
> Fix a typo in the variable name: "DESCRIPTIOM" -> "DESCRIPTION".
> This misspelling caused BitBake to silently ignore the description
> assignment.
>=20
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> ---
> =C2=A0meta/recipes-devtools/clang/compiler-rt_git.bb | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/clang/compiler-rt_git.bb
> b/meta/recipes-devtools/clang/compiler-rt_git.bb
> index a265c2aa9387..a35af99ff615 100644
> --- a/meta/recipes-devtools/clang/compiler-rt_git.bb
> +++ b/meta/recipes-devtools/clang/compiler-rt_git.bb
> @@ -2,7 +2,7 @@
> =C2=A0# Released under the MIT license (see COPYING.MIT for the terms)
> =C2=A0
> =C2=A0SUMMARY =3D "LLVM based C/C++ compiler Runtime"
> -DESCRIPTIOM =3D "Simple builtin library that provides an \
> +DESCRIPTION =3D"Simple builtin library that provides an \
> =C2=A0				implementation of the low-level
> target-specific \
> =C2=A0				hooks required by code generation
> and other runtime \
> =C2=A0				components"

That has a whitespace typo! (the =3D")

Cheers,

Richard


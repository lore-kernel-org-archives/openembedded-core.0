Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 732A6C02182
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 11:02:22 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.13486.1737457339775193021
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 03:02:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bqe2Xu8y;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436249df846so37142155e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 03:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1737457338; x=1738062138; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c9/ilpFgKjGKghNbkkUV/JqathvcR2iwyshhIgEi9XU=;
        b=bqe2Xu8yPjMRtX7AcRRnyfE7OelIC8Es7tGxbkYX8NJuSYvM2CDOjqeYtIjpEXt+RF
         +98QgWt9mXJ5TIWLF/w4b+wC9Tx/J26LwRtwZPyvC3wraiC8+nNVpH16GAvpGRTxRmLP
         OQZdK2F8nOq2snLp7O0jzEs5LjZdqHAYGZKmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737457338; x=1738062138;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c9/ilpFgKjGKghNbkkUV/JqathvcR2iwyshhIgEi9XU=;
        b=rr1W1JLt2CdP5b96+rC3BREkyBYbd5K/wz2SxPINPXagzZmRpeRut8Exrca46//y/I
         70WpjUYf76K9npAVTUtkm5JQX/cbDgXOZZgG5a94c7rwCphP5+RF4cZNJefYh/5mpJPO
         u6bv4TlOY4yzjF/uKF/PIPE36W8s3aF1MWfN7pwu/vvhhwDY8hMtC4bzGBcARm32p0Mx
         DayrEc7pRGzYH9wu2XACXljfnD5CBAqSF/YDUWfVoG+nSxM+qoF6h61NmdkggizQn4zI
         PK4QSJXCntNXMQ8CJcuvSgsWhzgNXsrFbjG2aLs8PrfiCfD7dIX93tUF3SUJBWWLz/aQ
         840g==
X-Forwarded-Encrypted: i=1; AJvYcCVGoeahQixMQ95YUcY1T9ObwhWpO3FBBelm+sUIzL+1nBmcK05qfV1joRseNlb+1OXrkCdmoKoJKYF+XuqpO1jKqA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YweBmbeP4fVmUdxWq+7a5TdgS54STHCidXMnYf2jYeK8bE2KaMo
	oeVFIXfYvTkoy9oSUEVsVY4ijrzCbJsc9WbGIt5sSTdhdCUNJ7/QFkGqXHfnDXQ=
X-Gm-Gg: ASbGnctb5Vu2/YUkRECOm8jB5SPK9kqbRffz3i1lS51vzjg5KG2N0Lv26tFAeP69+hx
	M6ntwrMJR0H8Gf7FOPjmsyKCSn7bz11U0Id0ODPXdNsrKH2VKVpp9w5gADyQHGJHzqEavIE+m7q
	EVomDXfLsQccWuK2se1LLcpXIx+2q0R0FfK3rbomJhVGIaWzMTMu7S+sHek280bnkDGruMIQMaj
	YXsTx5HQvIXNgNWICjIxzrjYUQ884CXKGNi0eR0ghltasPME+vXKHFGHnBpGM/1wBzyCCSTnegm
	b2WCKdXziz4Oic550uMTuPUISG9tmBXEo+GY/roYUtE4RCFEE9BbZDoxx4w=
X-Google-Smtp-Source: AGHT+IFVis8QindrTh1AnHQkwIyrytYP0/jnHcLxsQXRdJNW4hWJAbZlLR/c5ls9+KeuW0hn5BJFng==
X-Received: by 2002:a05:600c:3d85:b0:436:488f:4f3 with SMTP id 5b1f17b1804b1-438913f8926mr164755015e9.17.1737457337689;
        Tue, 21 Jan 2025 03:02:17 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e272:e8bb:f22e:9203? ([2001:8b0:aba:5f3c:e272:e8bb:f22e:9203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c75290a2sm237052825e9.29.2025.01.21.03.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 03:02:16 -0800 (PST)
Message-ID: <9aedbeaccf400910bd83d5b9e4405ce5eaa173d7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cargo: Drop cargo wrapper to ensure
 successfull cargo builds in SDK
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com
Date: Tue, 21 Jan 2025 11:02:16 +0000
In-Reply-To: <20250121105402.733009-1-Yash.Shinde@windriver.com>
References: <20250121105402.733009-1-Yash.Shinde@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 11:02:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210089

On Tue, 2025-01-21 at 02:54 -0800, Yash Shinde via lists.openembedded.org w=
rote:
> From: Yash Shinde <Yash.Shinde@windriver.com>
>=20
> - The SDK uses a cargo wrapper that sets LD_LIBRARY_PATH to point to SDK =
target library directory.
> =C2=A0 This wrapper was added to resolve library path errors by including=
 libdir and base_dir paths
> =C2=A0 in LD_LIBRARY_PATH for tumbleweed-ty-3 distro.
> =C2=A0 (https://git.openembedded.org/openembedded-core/commit/?id=3D388e7=
cac9f90e79ce8c3c1683d8ee0f4df1bc907)
>=20
> - But, a simple 'cargo build' in SDK env caused failures for certain crat=
es due to
> =C2=A0 undefined symbol and broken C compiler in SDK. Removing the cargo =
wrapper builds the crate
> =C2=A0 successfully.
>=20
> - With tumbleweed no longer being part of the tested distributions, drop =
the cargo wrapper that was
> =C2=A0 previously added to address library loading issues on it.
> =C2=A0 This resolves the errors seen with 'cargo build' in SDK env.
>=20
> References:
> Tumbleweed removal: https://git.yoctoproject.org/yocto-autobuilder2/commi=
t/?id=3D96e82ce670c02b166398500435c2df455b09b951
> List of tested distros: https://git.yoctoproject.org/yocto-autobuilder2/t=
ree/config.py?id=3D694d2a9bae523d9396b37da9cc6535a558e04d81#n168
>=20
> Fixes [YOCTO #15579]
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15579
>=20
> Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> ---
> =C2=A0meta/recipes-devtools/rust/cargo_1.81.0.bb | 8 --------
> =C2=A01 file changed, 8 deletions(-)

Even if we're not testing on tumbleweed, there is an interaction issue
here and this interaction is going to come back and bite us with some
new combination of host and nativesdk glibc.

I'm therefore not convinced that simply removing this is a great idea,
we need to find a way to address the underlying issue.

Cheers,

Richard


Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB830CCF2E5
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 14:18:46 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35652.1792419526185161386
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 07:18:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Cd1Jh4o2;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1267159f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 07:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792419524; x=1793024324; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aAsVlaEi12uzaWMvfhpM6E2ZjGg3vd2pXGpq2ALh/GY=;
        b=Cd1Jh4o2m584euKFEuvDj0HKOtQHNqoDgNOdozpA3Xi7cWNrGdCEa58y4psjcuhLSt
         Qq6WibsXKvIXKUZUyt8lenDYYgTAsAzwqb+cOXEPjLNhWziBD/E24ICrE1W+RWK4iazA
         bBKTc54EnrjL1iuhOGTP87bpRTfzhxNuqIhtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792419524; x=1793024324;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aAsVlaEi12uzaWMvfhpM6E2ZjGg3vd2pXGpq2ALh/GY=;
        b=yTnb+FhF8wTPdBWS5UEBVjgyt4esrvuwN+3aIwgh4TA6RaQmPaXcWKYgII39IDlJDm
         6Ny0HkdB8sg1YD1GD7QG1DG9I3kjWzwMYzFBgVDcZjWEMILNOvmR8U8wApQsKluR9Y+D
         OdVlo42blmw9Bvfy2ULd+dhpqf99Xa5KqlKeUcjztfv6nYETTqR2k+8L6sKGEJns/nB+
         G43t2Joh+W4JdKUh7kbSkI4N8YHbr2zIW8p3bE53YQZkFgvVVdmRVwB+3owTy6ek6f6Y
         qEGnGfMVWNUQRJVbqv3oRh1ILSHKafgOmEkIhrVhCguCtg/cdYcMwpJ4uqBAYpsCxhcM
         ndqw==
X-Forwarded-Encrypted: i=1; AKwUvBwWE4NE0IwsBtvpKacr86M+eNm2vp2fLocaJ+O15aqj1CJ/Q4qa5jpwUKT88ObVGi+zSkUFGDRUBeeWze+FspHxbg==@lists.openembedded.org
X-Gm-Message-State: AFq9FYI2ptC9h+8ruGn1SNuYbmtHZvmGFzUy1/2awjQ8DNZDWhv82tmf
	9KQhOhlur05R+Nk7RDz906wpSs6OLaaGWfh1mdju1yVLDLYXMfUJw4GX1y9EYvk2V1o=
X-Gm-Gg: AYBFou1jU9vrTiufKrxTYGoybirhQXcoAGZ6NTRDPsTYMkvfRLEJffQqCsvP5wpkDXM
	Z7mU20ETKm/s/J8DYr/GCU/KmZ/ap2iUKft8NX6qM3kj7Cv+0LzALbcOmeF2EkK9bab8kLbE4JN
	+nJI6I06wpE+OUzcywC7LrUSpLR0I/T7yBPGUiCitxeCqdcSpt/FUc1tZPEuC0bJ7g+xb56Ejr2
	WBVmm4EOPyA3cyNwjN3xOlchry/2JldA6B25kDHSGjNlWxz9uzlL3CwFknA7gNSqstf4wAETbB6
	5mS4nEVm9KOZS+QxePe9H2IQR4rCv4uoIhMY0VGtJmRJz8uWYpp24WphhL7u0UO/o80tMraL6AX
	Bz6oI0yq33UPozotYzJ2d+ng3oMWegRXM5+b0pqTlaizzrLpiPuVAmQ4cCvXF/cpUomb6BENDQ9
	jwRElsw0D/RrWLL4zzMq6HpSJhEKKbg3GkW/ehmM8ogoKXKhOu4zg/BzxNJDg4FvpQ4VHzMKZWw
	Zz83dtsmpeiaoTnx+mI4QRa/FczemYKVoV1hdzTMSxqdVsuSRVKb6JDR6Vc9A==
X-Received: by 2002:a05:6000:1ac9:b0:488:8bc1:a2eb with SMTP id ffacd0b85a97d-48e07f99197mr16249839f8f.39.1792419524275;
        Mon, 19 Oct 2026 07:18:44 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1afbf534sm1988341f8f.35.2026.10.19.07.18.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:18:43 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 16:18:43 +0200
Message-Id: <DM8VOXLTFEIS.6MCCPMLQ3EI@smile.fr>
To: <dkelaiya@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH 1/3] python3: upgrade 3.14.7 -> 3.14.8
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Vijay Anusuri" <vanusuri@mvista.com>
X-Mailer: aerc 0.20.0
References: <20261016053944.3835603-1-dkelaiya@cisco.com>
 <20261016053944.3835603-2-dkelaiya@cisco.com>
In-Reply-To: <20261016053944.3835603-2-dkelaiya@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 14:18:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248172

On Fri Oct 16, 2026 at 7:39 AM CEST, Darsh Kelaiya -X (dkelaiya - E INFOCHI=
PS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Vijay Anusuri <vanusuri@mvista.com>
>
> Release information:
> * https://www.python.org/downloads/release/python-3148/
> * Python 3.14.8 is an expedited security release and the eighth
>   maintenance release of 3.14, containing around 354 bugfixes,
>   build improvements and documentation changes from 142 contributors
>   since 3.14.7.
>
> Handles CVE-2026-19445 CVE-2026-19553 CVE-2026-19672 CVE-2026-15310
> CVE-2026-15806 CVE-2026-17084
>
> Changelog: https://docs.python.org/3/whatsnew/changelog.html#python-3-14-=
8-final
>
> Backport Changes:
> - The new test_append_limited_history ptest fails on musl with the
>   default libedit backend. libedit opens the history file for
>   appending, then emits a header if ftell() reports offset zero.
>   musl leaves the initial append stream at that offset, so a second
>   _HiStOrY_V2_ header is appended and CPython's truncation keeps it
>   in place of the expected history entry. Skip only that test on musl
>   until the libedit interaction is fixed.
>
> OE-Core failure report:
> https://patchwork.yoctoproject.org/project/oe-core/patch/010101a0f6296539=
-d5cd290b-b68d-4632-a774-5263fa10249e-000000@us-west-2.amazonses.com/
>
> Upstream issue:
> https://github.com/python/cpython/issues/123018
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> ---
>  .../python/{python3_3.14.7.bb =3D> python3_3.14.8.bb}          | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>  rename meta/recipes-devtools/python/{python3_3.14.7.bb =3D> python3_3.14=
.8.bb} (98%)

This series can only be reviewed for wrynose once python3 upgraded on
master and blacksail (both 3.14.7 right now)

I think I saw 2 attempts to upgrade on master and none yet for blacksail:
* python3: upgrade 3.14.7 -> 3.14.8 - Patchwork
  https://patchwork.yoctoproject.org/project/oe-core/patch/20261008090135.1=
485765-1-vanusuri@mvista.com/
* [v2,2/2] python3: upgrade 3.14.7 -> 3.15.0 - Patchwork
  https://patchwork.yoctoproject.org/project/oe-core/patch/20261012103426.3=
090-2-jaipaul.cheernam@est.tech/

Maybe you can help by reviewing master's patch and, then, sending
blacksail backports?

Regards,
--=20
Yoann Congal
Smile ECS



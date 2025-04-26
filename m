Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA692C369CB
	for <webhook@archiver.kernel.org>; Sat, 26 Apr 2025 08:44:49 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.5770.1745657081088039683
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Apr 2025 01:44:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Lv65MHh/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39c1efc457bso2051183f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 01:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745657079; x=1746261879; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vr/gFvFthEsZMS6Z8Cdogv4oH2V/XNYs471w0fHcam0=;
        b=Lv65MHh/cagFUIN/ybGhChq7cA2iKGRWgoxZ1gVh/P4dVsfyzGC/pkOyVxzNz4FlmG
         x0Dew+wHyEqTlauxAN0Jl7rAmQY5x5AEk5P/eIDAPc4277Eo5Pz40BV6grjWI0RizJyg
         wO7R5RqT8X+DwO90pz3/iJZJ6z9YGm12Jhrf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745657079; x=1746261879;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vr/gFvFthEsZMS6Z8Cdogv4oH2V/XNYs471w0fHcam0=;
        b=SYaEcqf9VmNKXICQl31e/vCWHVEayNnOVQpklyNuIN0vs/hjh0Tk107zcfoedrjtFk
         SU9O3DLokyBgbKy5AfPrUB1BtGANqzwpxVsuxGOW1jpG2SXI/jFW6sSlyvsZQAlwgA8y
         3VlIk4ey42+o1MUATkRMm+d3Cyp5oSelAf5Lf+8xb1V0PgD5S2VqCw9Ezq22nI52pZ+/
         3uY5nfq6O8PJeuRduxeyrf3GHN7lbxYehMJy/Gezqu6Jfm2QQL/58Vv7l6pHARnYYjpB
         MITRix0Z6q//99QYYIZ9Q/8l9d1D0mOm+ZCdUlgz0bWrxuFUMzQOjaY8A4gTZ6UL2rtm
         brQA==
X-Forwarded-Encrypted: i=1; AJvYcCVa1jy1zF6+Mle8mjxK4F5duCMleC4M1NSg5FMVpxRKl8hOZt10+++UPJMxn8jWTGQW+r0bqPrrijUm7NNnUC9mrA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwiPsdlM4Qsx/evLtoyjwGqpDmqNOcjQU1tvCyOpIrztLHDKmxO
	jz3EWbkvWqiBFkqDCcw8/XZLFKv9+mptonhF3xoRicpjFeRSJ63lnST2jIKvTMk=
X-Gm-Gg: ASbGnct1rkEPCVNM9dVKf6RvRDDSZ8pjX2sheM076eYNgH4vOpwNNUCjF/S2PBlJO9z
	N5wb51ld7dqyIpOY5s06zrNC3e5CnNyfWH6ovY9M+g3l+bFsUc00Okjv3wzcEbK2SZZdFMQK8BU
	amZOM6L8cXTpulZ3AJ7w4Ks5N9MfU9IjUvbl8YlwAYuc5daKfnF8LM08ydEzCfdEneFcTCCeByd
	0zGFI43s6M2YtO7ahe13glne7h9d4NoabkEZtJpIZugjKzm0X+aAAY32MtWC1JyezXVwHBT5RSQ
	YA0rRtM5FntbZDKftIhZtmNgD7+pMYfEq0WIBjr+EZfOCbXzZ7V6Hea7V+PflEJWnaDgUd7lwG5
	6m/VezrZTVlvgoz//XpVAFIDC0F4BgQ==
X-Google-Smtp-Source: AGHT+IEB4yPuVMaIs+WM1Fe4po9f2rhuV9f48P+HtNEI/yZQILdzCZ8TKl0E2iB2aqbASOy11fP7mQ==
X-Received: by 2002:a05:6000:40e0:b0:39c:3107:d68d with SMTP id ffacd0b85a97d-3a07adb1894mr1533309f8f.49.1745657078729;
        Sat, 26 Apr 2025 01:44:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e99f:653c:59fa:297d? ([2001:8b0:aba:5f3c:e99f:653c:59fa:297d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46a49sm4768929f8f.61.2025.04.26.01.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 01:44:37 -0700 (PDT)
Message-ID: <ac75dceaa2685abbd18fe4005f35d561e4ee75a1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] harfbuzz: remove meson flag work-around
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: twoerner@gmail.com, openembedded-core@lists.openembedded.org
Date: Sat, 26 Apr 2025 09:44:35 +0100
In-Reply-To: <20250425174215.19853-1-twoerner@gmail.com>
References: <20250425174215.19853-1-twoerner@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 08:44:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215515

On Fri, 2025-04-25 at 13:42 -0400, Trevor Woerner via lists.openembedded.or=
g wrote:
> The issue is committed and resolved upstream, therefore remove the
> work-around of explicitly having to set the meson flag 'cpp_std=3Dc++17' =
when
> using icu >=3D 75.
>=20
> https://github.com/harfbuzz/harfbuzz/issues/4671
> https://github.com/harfbuzz/harfbuzz/pull/4734
>=20
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
> =C2=A0meta/recipes-graphics/harfbuzz/harfbuzz_11.0.1.bb | 3 ---
> =C2=A01 file changed, 3 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_11.0.1.bb b/meta/rec=
ipes-graphics/harfbuzz/harfbuzz_11.0.1.bb
> index 8945467a001d..2febcbecda31 100644
> --- a/meta/recipes-graphics/harfbuzz/harfbuzz_11.0.1.bb
> +++ b/meta/recipes-graphics/harfbuzz/harfbuzz_11.0.1.bb
> @@ -32,9 +32,6 @@ PACKAGES =3D+ "${PN}-icu ${PN}-icu-dev ${PN}-subset"
> =C2=A0
> =C2=A0LEAD_SONAME =3D "libharfbuzz.so"
> =C2=A0
> -# Remove when https://github.com/harfbuzz/harfbuzz/issues/4671=C2=A0is r=
esolved
> -EXTRA_OEMESON +=3D "-Dcpp_std=3Dc++17"
> -
> =C2=A0do_install:append() {
> =C2=A0=C2=A0=C2=A0=C2=A0 # If no tools are installed due to PACKAGECONFIG=
 then this directory might
> =C2=A0=C2=A0=C2=A0=C2=A0 # still be installed, so remove it to stop packa=
ging warnings.
>=20

Removing this caused failures on the autobuilder with gcc 15 e.g.:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/1474

but there were more in that build.

Cheers,

Richard


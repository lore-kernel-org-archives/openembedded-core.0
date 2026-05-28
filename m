Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85109CD5BD5
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 22:21:36 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22179.1780006888199193573
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 15:21:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X/PjQOxl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45e9f4a3510so4383572f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 15:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1780006886; x=1780611686; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l8HDzGpuNPyfc0O0c3YG2ZqCafCrLq4n+qKL+95L4cY=;
        b=X/PjQOxl4cP/COdG/Ny2rOgKRO4PuwjUsZerBEWNVRtkWWqVUQa7buRHIFxMCVZ41j
         67fp/naBb6G70RIDXO5ZGupC8kpERAaJ8x/OVnEySR0Gijo+VjRPAzBHybp8b41hYaIg
         Xx6E0w1xE3ff0ifRZoPLMsG9mqmkPSw2CBqSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780006886; x=1780611686;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l8HDzGpuNPyfc0O0c3YG2ZqCafCrLq4n+qKL+95L4cY=;
        b=okGh9D9ZnoQuNqgCC+copoLLBt8vmDbnjYF8na/m7cTpMXVDTednyTB0rV/42dtNe1
         tZT1HxqlXFcTCDx70dT0J7C6D8Rz42vuWIZQwPmphrONxn7zR1lzEUKVazD0/E7WL008
         2Gyz2pGPhucC8sLCcKSGq8wfbKPbFeG43e+j8vdnDp6hDpxFurEHcfLHMlx57b8sn069
         n4AgrkbVvYBw+2hwq20q1dC7ciVXzw2saDuw2CnAk/Rxn16hD3R8WjEJf8YtmPKfe41y
         4IWQQRZ8YrkIAkc2Xa5aHy4skSzBF1bg+V1ZfTt6djGwX5BNo3KadBpJMNNXdVpQMcBk
         QcjQ==
X-Forwarded-Encrypted: i=1; AFNElJ9EFWR712oBVakeZPpaYuPkvaE/MGwKfKoysiKc5RFwTOXURtbsAc9NQklk2DPs8f+tHTHgrwnu13dk9ykVe8DIbA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyLODZJwvGtpPZbMQvvhEXJ2OHwV4H5A4MGhSpLKOn62tKvI+jl
	WHA7yNDf3IWaJcROe6IuGDJ6Az0O8yVDBvqCPLBUo5AsYjsMT1GD72ssspXZJc7JZPdxBdTZO/3
	MfHT4
X-Gm-Gg: Acq92OFoYbhiUtzmBtql2zpR0nNS04zQKn1wSMBbzy/ipH0+yJXBBldlBzkvCyM8F0M
	Jd/2YHjcMNnJZytP0RnBkRjFGV4xhc94r5NoDIer9EgFUovJdwHq/1Ojw+yqUfpInfqvhTEPayC
	v9/ZCnkrT+VxbJQS0x1KvU5nMhDywBZScNaAw+P2JFBF/Ef3cliamJriUR6hLV4tofEwwP37hTh
	uJnVrS2jzYgxQN2t2u+H5pziODWIXyQZ5N3oBGsIzRbqiW6q+lx6a6AM6Tf0GeY44gC/LI+rb63
	2VrDOSIM3yXkGePnYw8eJEX2aQ7vhSg+rMEanfjuzsalCkdhkY/+r4sWT+miNdKWIKOuIHvzU7q
	EyzW+zKIWyCERlBCdsX6vJbEvNhOv6KmOCVnD7H4B636VVxLumrhm/Y5h4wG67u85U2z3vPuPTD
	mhwSK2WcFs3QojYujq/BjDib0K9P4HZtQg6O637AFutfL3YFNQBvWRFDiNW9elIx788MShFR3sn
	OYDAnn2V5jfO8jHPwIWuDUDBKs=
X-Received: by 2002:a05:6000:618:b0:452:273:5cd6 with SMTP id ffacd0b85a97d-45ef13ee98amr385029f8f.1.1780006886473;
        Thu, 28 May 2026 15:21:26 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d836:be25:77c4:6416? ([2001:8b0:aba:5f3c:d836:be25:77c4:6416])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5a2c87sm16408283f8f.17.2026.05.28.15.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 15:21:25 -0700 (PDT)
Message-ID: <a7955e1e85859bf7c6a4a5f3c7a2f08f97ab5e81.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] populate_sdk_base: Add Rust-in-kernel
 dependent packages for SDK
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Date: Thu, 28 May 2026 23:21:25 +0100
In-Reply-To: <20260528172211.2652140-2-Harish.Sadineni@windriver.com>
References: <20260528172211.2652140-1-Harish.Sadineni@windriver.com>
	 <20260528172211.2652140-2-Harish.Sadineni@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 22:21:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237737

On Thu, 2026-05-28 at 10:22 -0700, Sadineni, Harish via lists.openembedded.=
org wrote:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>=20
> When KERNEL_FEATURES includes 'rust', add the required host and target
> packages to the SDK to support Rust kernel module development.
>=20
> Host side (TOOLCHAIN_HOST_TASK):
> =C2=A0 - nativesdk-bindgen-cli
> =C2=A0 - nativesdk-libclang
> =C2=A0 - nativesdk-rust-src-lib
> =C2=A0 - packagegroup-rust-cross-canadian-${MACHINE}
>=20
> Target side (TOOLCHAIN_TARGET_TASK):
> =C2=A0 - kernel-devsrc
>=20
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
> =C2=A0meta/classes-recipe/populate_sdk_base.bbclass | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes=
-recipe/populate_sdk_base.bbclass
> index b427ff2761..b345a65db7 100644
> --- a/meta/classes-recipe/populate_sdk_base.bbclass
> +++ b/meta/classes-recipe/populate_sdk_base.bbclass
> @@ -74,12 +74,14 @@ TOOLCHAIN_HOST_TASK ?=3D " \
> =C2=A0=C2=A0=C2=A0=C2=A0 packagegroup-cross-canadian-${MACHINE} \
> =C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'go'=
, 'packagegroup-go-cross-canadian-${MACHINE}', '', d)} \
> =C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'rus=
t', 'packagegroup-rust-cross-canadian-${MACHINE}', '', d)} \
> +=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('KERNEL_FEATURES', 'rust', 'nati=
vesdk-bindgen-cli nativesdk-libclang nativesdk-rust-src-lib packagegroup-ru=
st-cross-canadian-${MACHINE}', '', d)} \
> =C2=A0"

Similarly to the other patch, I think we need to define these things in
a packagegroup, then perhaps just include them when SDK_TOOLCHAIN_LANGS
contains rust?


> =C2=A0TOOLCHAIN_HOST_TASK_ATTEMPTONLY ?=3D ""
> =C2=A0TOOLCHAIN_TARGET_TASK ?=3D " \
> =C2=A0=C2=A0=C2=A0=C2=A0 ${@multilib_pkg_extend(d, 'packagegroup-core-sta=
ndalone-sdk-target')} \
> =C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'go'=
, multilib_pkg_extend(d, 'packagegroup-go-sdk-target'), '', d)} \
> =C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'rus=
t', multilib_pkg_extend(d, 'libstd-rs'), '', d)} \
> +=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('KERNEL_FEATURES', 'rust', 'kern=
el-devsrc', '', d)} \

This seems a bit odd. Just because you've enabled rust support in the
kernel, it doesn't mean you want kernel-devsrc in the SDK?

A better way of doing this might be something like "kernel" in
SDK_TOOLCHAIN_LANGS to trigger kernel-devsrc?

Cheers,

Richard


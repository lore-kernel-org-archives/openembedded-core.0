Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2D9FCD5BD5
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 06:45:40 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5224.1779950735549407072
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 23:45:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KOt5GGWq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-452169ae568so8039894f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 23:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1779950734; x=1780555534; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EhtR7E4WoP50iEQqbAOd9iwkr4stxnPrSB3w5jo5bc0=;
        b=KOt5GGWqqmf6zytRvINV9jmPvTeKPqB/TxJZUv8yXwuaaOhfA5qjDhzSt06vZUx/+2
         /koc5628uNy6WR9nnvjEo95UxXnUMmpXj3rQyPaSxjHs20JzqOYaCsN3vq6VFaqbCGPO
         OJ77jMh9VZ2rDj3vACIwATE40MevFhdRR6H3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779950734; x=1780555534;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EhtR7E4WoP50iEQqbAOd9iwkr4stxnPrSB3w5jo5bc0=;
        b=G92BZVMgOL+iJK0kodhotiYMMx8qzgPI+wPSCAKeWk51745uArpPA81wsShBKTkHVW
         fEIE/rnJQIKZykmNeI+L/mkAwBPXn2aKKM3/HjQ+9cKJD1ifEhFAxqjOJDtPydA58ote
         UMLNRPiTa57jdyB7JE+dT1BPdiEYxl7BMd9rCIS08r42DLIkPV4LQYu+uLecf9Eltu7i
         rvJwFm4NmRfX/Efi71wJooMNTrQUJ9R/hvmmrZCsD8JynPx4Q+95dLcZ9/To6bsB/831
         p6Dr9Lw8/TkNZkh2ZfBaTJ2TulgnKZSVsQsBK+kl+N/ADY/N65WkHsU9oDvcJ7jvtdNI
         FGow==
X-Forwarded-Encrypted: i=1; AFNElJ8gy+B4fPxXHqm8rBXX3yEKrdKmwCnFpGFvvSJ6lZPWcrQRyJvou8bpwaZDNrgzn1RpH5CuMxu57TwlynzrqkVV0g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyxBYrpTvMFqU9RoNrsVk3pzSzG7e8Ll2QwKjG7Efem5d6Cih3N
	szq2cc0WF53WDt0fQ+UxDn/+Dnab03kvSzJG4JPGDSfSdCm8CGR+HrkOGWD7tTmEOmo=
X-Gm-Gg: Acq92OFAi2ZNpS6ZsEglKDq2uXBcbcFtCO95TuVqhqt/Zu0aEUdEWDa6SlAv1Qg4tJT
	NDIz70AxPob4pRQL3roMNP8FRdX+zN7g/KJT6gfaHgIS3jlSbp30gBChfxIP2yV8uXGma1MmX7b
	62O7nQDDUmGxIdqNFDXRwHfYIJsTncuhWCFUJktV2PvdWFNcrBEiWUN+S9Nt6FwwJSVU3cizKxe
	YFmkh2IbVop3GZR43eiCDqVFc3yMhJ+qXQ2AmkUQrB6eJH5lYl1xS4HIc4bm61a8+4jxjW/YUwo
	p9v+cgtuC5cqz5edLyQ5NiZW2+OFSOEIfawt4rOMrrufSaxXVrVJABxBFsNqTOKOuCOb70YDH7W
	Th8j4++Q/I23TvLQeK9udEbsnSQC9JJshnFFdOlYHKBMWQJc2H4bbcY6qbYI+N3W961Z/EpVRY6
	iqoe+RMNh8AmT7mhpzzeYK1hROVhR8mIs+CQQcy50b7dyNCI/TqDY551lVrrVDy6k0OIpqhKFgw
	l0fyMwJiGtkOTJNCFwvMQ==
X-Received: by 2002:a05:6000:4692:b0:45e:e224:6397 with SMTP id ffacd0b85a97d-45ee224646bmr2139679f8f.2.1779950733652;
        Wed, 27 May 2026 23:45:33 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:78a4:a234:125:a55? ([2001:8b0:aba:5f3c:78a4:a234:125:a55])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ee5a84e92sm2983639f8f.35.2026.05.27.23.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 23:45:32 -0700 (PDT)
Message-ID: <28eb74335ef9e6539b7f321abb444be4919209a1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v5 6/7] glibc: disable automatic libatomic
 linking
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hemanth.KumarMD@windriver.com, openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Date: Thu, 28 May 2026 07:45:30 +0100
In-Reply-To: <20260527133516.2337150-7-Hemanth.KumarMD@windriver.com>
References: <20260527133516.2337150-1-Hemanth.KumarMD@windriver.com>
	 <20260527133516.2337150-7-Hemanth.KumarMD@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 06:45:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237694

On Wed, 2026-05-27 at 06:35 -0700, Hemanth Kumar M D via lists.openembedded=
.org wrote:
> From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
>=20
> GCC 16 introduced -flink-libatomic which automatically injects
> -latomic_asneeded into link commands via LINK_LIBATOMIC_SPEC.
> When glibc is built with a GCC 16 cross-compiler, the compiler
> would attempt to link against libatomic which does not exist yet
> at this stage.(libatomic is built later as part of gcc-runtime)
>=20
> Link: https://github.com/gcc-mirror/gcc/commit/e63cf4b130b86dd7dde1bf499d=
3d40faca10ea2e
>=20
> Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
> ---
> =C2=A0meta/recipes-core/glibc/glibc.inc | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/=
glibc.inc
> index dae087d53f..91fabe14a8 100644
> --- a/meta/recipes-core/glibc/glibc.inc
> +++ b/meta/recipes-core/glibc/glibc.inc
> @@ -46,6 +46,9 @@ EXTRA_OEMAKE +=3D "SHELL=3D/bin/bash"
> =C2=A0# bash but it can be configured by setting KSHELL Makefile variable
> =C2=A0EXTRA_OEMAKE +=3D "KSHELL=3D/bin/sh"
> =C2=A0
> +TARGET_CC_ARCH:toolchain-gcc +=3D "-fno-link-libatomic"
> +SDK_CC_ARCH:toolchain-gcc +=3D "-fno-link-libatomic"
> +
> =C2=A0do_configure:prepend() {
> =C2=A0	sed -e "s#/bin/bash#/bin/sh#" -i ${S}/elf/ldd.bash.in
> =C2=A0}

I think using the override is causing the default flags in TARGET_CC_ARCH t=
o be lost, resulting in errors like:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3912
https://autobuilder.yoctoproject.org/valkyrie/#/builders/16/builds/3837
https://autobuilder.yoctoproject.org/valkyrie/#/builders/40/builds/3790
https://autobuilder.yoctoproject.org/valkyrie/#/builders/42/builds/3768

I think it needs to be:

TARGET_CC_ARCH:append:toolchain-gcc =3D " -fno-link-libatomic"
SDK_CC_ARCH:append:toolchain-gcc =3D " -fno-link-libatomic"

I will retest with that.

Cheers,

Richard


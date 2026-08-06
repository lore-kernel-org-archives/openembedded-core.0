Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2B56C5AC67
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 21:26:46 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29862.1786051596435618501
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 14:26:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MREfarkx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4720f3bf164so955474f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 14:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786051594; x=1786656394; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5ds8PN7DqHxl0XK/4wCf9tYR6YVYyUvm6HVFUcdBUNE=;
        b=MREfarkxaDU+VgK8c4tc+RxjcZ1DB6NJE/EoF8/NGmikPTAtUJySFaVBUUQdk1rMnV
         fugRSROU/aX51rU7BH6HYgE1kr+AE8l8UfSk2jo4sf8dxWeTcI4g7BuRJkbmqwk/HOOt
         4kazS/Fqm0RgYohyGWE541ss4CLHvzYEt3pcY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786051594; x=1786656394;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ds8PN7DqHxl0XK/4wCf9tYR6YVYyUvm6HVFUcdBUNE=;
        b=CuYDrYYQVikDH6vyWHiitaFaB7cCzuYldq/hslUCeXH52QEoZellyXrE22sAok7SIC
         lU248uCadkGFi2zKw65yqAwkXli/oJAe76TfvV+mpGR0l9saEP7qZq77Dw4aQrcwzpww
         P7t+xSSq2/GAxkVTetpr2LV+itqZslYpLRhOU2U6MaMGCEEDxLinwh3CnNs8yeKjKswl
         mO30cQVLQpt/OzaKbGLHBCgkevw84c+e8LP6WaLyGUOeGSLjSHoQYb0f/SikkSUxm0KN
         I3ZRrS0Fb7QDO2ukpKpQNlDrzV4XrkjFixRIlBh2wZdKbV4MWI2vGFFAcHUQrhP1B+Yc
         7czg==
X-Forwarded-Encrypted: i=1; AHgh+RpWWXT6+5PSVx4QgQYDZas/cdTLaagXMje5kxt9JqFtfTgqApcEvwNkTRd2qUTSq4zCxyduwdm4P4MErQKDuhbbnw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwEd9JL2BXFhTgg+w1Z2hCySXLKbrMDkIvDAbkGvGfcXa5KKZaw
	7vB9vacy6ONw419ICM8h5CFLBjiLywB9u8FR87HMsWX34kIv7KZex9ZJhdb4CQ2dCSY=
X-Gm-Gg: AR+sD10M3tpEVSci70B0arJi8+8NPfKDvdNGXQhGZGJacNCqXtfFSz2s9fyD2s80CAX
	VRdeSYqYrk4mF3f+J8UivUPOM6NUb3lPlO3uNIWHnfvtYYBTQ8gvlqRTmGXi53MfO66N7oETrzL
	z1HbMy1yv+rgQCp8Ox2bVmAyumz/8LwtYAUTyv49miQtldFwRRfica1NJW3WHCdnfXDbQC/lg97
	E6RQMPE6nWKfeI1KADa5JztVR667iR/dmf1ZAEYAWfRSdPM0nSogvAvrIAb4AmBWE8591RVfvHW
	K55Jtq3OlUBJEBkwoxbpdxhb7tuvUHUYyCpKUNPVF+DHPAqY2pMhchkHN6ebju1PrlgxiD2hoxh
	1Pkn2ZhidtvWNLuGAyzzPnK2mHluU/mz4B/kNdXDY+Qmj8LTGG65CUgLTdNkDi+DcFu9yQckrNL
	8dng8s9QhCwnn6IoUlHN6nKDAQKIB0uMYW2itgozRtybm/a2hnW/xvYVFKbwcEMovMwoNaaPTkQ
	AKTcaN2ENpc279p90Ul/GX2miw4Dox64TgV4/pG3RLJwYnzBkv4fA==
X-Received: by 2002:a05:600c:811b:b0:493:f478:4c71 with SMTP id 5b1f17b1804b1-499553e60d8mr85179435e9.7.1786051594587;
        Thu, 06 Aug 2026 14:26:34 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:eaa9:3aab:7057:3a99? ([2001:8b0:aba:5f3c:eaa9:3aab:7057:3a99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c7b4499sm6248515e9.3.2026.08.06.14.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 14:26:33 -0700 (PDT)
Message-ID: <8569f35daf6584ca49d9d7b0a599847266494869.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 5/9] libtool: 2.5.4 -> 2.6.2
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jaipaul Cheernam <jaipaul.cheernam@est.tech>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: Khem Raj <raj.khem@gmail.com>
Date: Thu, 06 Aug 2026 22:26:31 +0100
In-Reply-To: <DU7PPF66507B2D7F686F5CF25824702B130F3D42@DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM>
References: <20260804122335.3094065-1-richard.purdie@linuxfoundation.org>
			 <18C899AE0F118A3D.1990914@lists.openembedded.org>
		 <18C8A8C4FB56E625.3417489@lists.openembedded.org>
	 <19f7ec53e3ecdf3dece894a2049acd408ac6ef9b.camel@linuxfoundation.org>
	 <DU7PPF66507B2D7F686F5CF25824702B130F3D42@DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 21:26:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242970

On Tue, 2026-08-04 at 21:36 +0000, Jaipaul Cheernam wrote:
> Actually , I also sent a patch for lib tool upgrade on
> masterhttps://lists.openembedded.org/g/openembedded-core/message/2427
> 34=C2=A0
> =C2=A0=C2=A0
> =C2=A0=C2=A0I reproduced it locally and dug into why. The root cause is t=
hat -
> WCClinker=C2=A0was never a valid libtool flag (only -XCClinker=C2=A0is).
> =C2=A0=C2=A0It worked in 2.5.4 by accident, but 2.6.2 widened the passthr=
ough
> pattern from -Wa,*|-Werror|-Werror=3D*=C2=A0to -W*=C2=A0(for LTO warnings=
),
> =C2=A0=C2=A0so now -WCClinker=C2=A0gets passed directly to gcc which reje=
cts it.

It was fixed upstream here:

https://github.com/libunwind/libunwind/commit/8e6a348b94a1b8e77ec2a086ff27e=
a9b78357d71

> =C2=A0=C2=A0I'd go with --disable-cxx-exceptions for riscv64 =E2=80=94 co=
nsistent with
> all other arches. The -WCClinker typo can be reported upstream to
> libunwind separately.
>=20

and upstream do unconditionally disable it now:

https://github.com/libunwind/libunwind/commit/bda7a2267b8385b869b4eef6a2fcd=
d696b887ed8

:)

Cheers,

Richard


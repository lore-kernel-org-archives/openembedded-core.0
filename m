Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0888BC8303C
	for <webhook@archiver.kernel.org>; Sat,  5 Jul 2025 19:04:56 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.23313.1751742287545162716
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Jul 2025 12:04:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cMCbG6WH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso13713835e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Jul 2025 12:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751742286; x=1752347086; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o5qw1WcfTcvbdp6tipbw7lU7eg2WH3TNVJksrVaHM20=;
        b=cMCbG6WHQLKniKlyKUQSDfQpPiXDmGNaJVIPunbldl+DrPpoCuqGN1kJ3ULkIBC49c
         ebiaL8G/hkgTcxLnBb2lW4m919qJLfWdy3B70v/Fya9W4/bzKierfg+Wdx8jd9cylwLE
         YZauA+cZxMflcocE+loSOVOhe+osRK03TdPOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751742286; x=1752347086;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o5qw1WcfTcvbdp6tipbw7lU7eg2WH3TNVJksrVaHM20=;
        b=U4i0CwHHbYfBNNJNGeM0VNAmx3d9zPcxRrMBcZJ2qanrfchou7bCPj6j3OVvtyiofZ
         ygcfcCLFBBfZnEF+jq8xy7JTHG7RH4k82m44LpI7ARLh7lHzT2z5JMIZZrhGpDnnlKBA
         G5HLXt+eA3loVz8T9xIwLvQZ0OHhnT7/SDQdmf12mU6EcxfvjGFhpbQoKt7sPfBWIi86
         rBnhuL0ISrQqXQE8CskNML/5jDjIg2lQZK0NP6FBuOGeTJCf4UbRmr7cOywGAlFZiSFs
         JkZpJEOyh/EIoNEa7rW542YVtCdAouKCvFWPfPbZGv8nTQuQxKsVtLjIpO2f+uZydgbj
         fA1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVkP6YnQZUZzBZCxZzHlN3JLrrKcs9OKJuKxzd1BUU7zxQHfrKBOn0oEpUghD24EqPqEZ65+Wk1LDY4amJLcNX/Uw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxa5OwXjVK5kXGZpYa313sna5MT+friMR2gH1wu3XJ/WUSkb1KX
	l7LVeERdGisYGAbibFkXqGG+ZWjp83LnR3hS3vXo6IQY4hJvsjfT2EQsnLAPJ/9rGOE=
X-Gm-Gg: ASbGncvuqUWtfCW795/UBhhmVFFUICh2KyS77rjWJ0DzUg+C3a5toCx+wxDH7qc5Vwx
	TNjWaRWFewRe48WYcBK4nMHiUrPvzbwpBW7i+v0YJmBnimFiDj2H5p4gyP5V9x7eimD46+u6ZdV
	BPSePIKCYlG892/UTXzBHsifAQBPtCZBeYVn8UBTy6Oh3BtN4eiMWumEWMgxFjoFX6bjSNf08ZG
	M8pitTmUWTCV8cCup6ADaMTf9fiz/JeZxfSmqbnhMSWr4rNlICvnG3ehKtMku5+iM/Gog/HVzd0
	qMg6LY35KJgMwGEr8rXmNjKXVG1xyLLlj6mfRsXM9cNr7LaFfLO1Kvpr82zli4KZeNBp6kGtNKZ
	rlQUucBjgAYkD0LTKDfQjyIOs/8hFIMfUE2wkxVC87W8nx14zbjk=
X-Google-Smtp-Source: AGHT+IGrHlB7DCNsyoxGgS3g7H5HFz/tPOfXVUMssIvQ579FbIhm5wbABV3qwjvd8WL9Y+HrLJ7LFQ==
X-Received: by 2002:a05:600c:4692:b0:453:9bf:6f79 with SMTP id 5b1f17b1804b1-454bb8775bfmr23720405e9.26.1751742285847;
        Sat, 05 Jul 2025 12:04:45 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:44e5:6183:e700:8e38? ([2001:8b0:aba:5f3c:44e5:6183:e700:8e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9be5bbfsm89400635e9.34.2025.07.05.12.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 12:04:45 -0700 (PDT)
Message-ID: <30ec5f57f0be328fb0a1ae21b1eb299af91777f7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 19/37] libpng: upgrade 1.6.48 -> 1.6.49
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wangmy@fujitsu.com, openembedded-core@lists.openembedded.org
Date: Sat, 05 Jul 2025 20:04:44 +0100
In-Reply-To: <20250630091315.1897-19-wangmy@fujitsu.com>
References: <20250630091315.1897-1-wangmy@fujitsu.com>
	 <20250630091315.1897-19-wangmy@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Jul 2025 19:04:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219960

On Mon, 2025-06-30 at 17:12 +0800, wangmy via lists.openembedded.org wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
>=20
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - Added SIMD-optimized code for the RISC-V Vector Extension (RVV).
> - Added various fixes and improvements to the build scripts and to
> =C2=A0 the sample code.
>=20
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
> =C2=A0.../libpng/{libpng_1.6.48.bb =3D> libpng_1.6.49.bb}=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +=
-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> =C2=A0rename meta/recipes-multimedia/libpng/{libpng_1.6.48.bb =3D> libpng=
_1.6.49.bb} (97%)
>=20
> diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.48.bb b/meta/recip=
es-multimedia/libpng/libpng_1.6.49.bb
> similarity index 97%
> rename from meta/recipes-multimedia/libpng/libpng_1.6.48.bb
> rename to meta/recipes-multimedia/libpng/libpng_1.6.49.bb
> index e603df1edd..c4af30be80 100644
> --- a/meta/recipes-multimedia/libpng/libpng_1.6.48.bb
> +++ b/meta/recipes-multimedia/libpng/libpng_1.6.49.bb
> @@ -14,7 +14,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}=
/${BP}.tar.xz \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/run-ptest=C2=A0\
> =C2=A0"
> =C2=A0
> -SRC_URI[sha256sum] =3D "46fd06ff37db1db64c0dc288d78a3f5efd23ad9ac4156119=
3f983e20937ece03"
> +SRC_URI[sha256sum] =3D "43182aa48e39d64b1ab4ec6b71ab3e910b67eed3a0fff377=
7cf8cf40d6ef7024"
> =C2=A0
> =C2=A0MIRRORS +=3D "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ $=
{SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
> =C2=A0

This breaks qemuriscv64:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/builds/207

Cheers,

Richard


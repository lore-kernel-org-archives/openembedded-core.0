Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66827C56205
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 12:26:35 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18087.1786019190999013942
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 05:26:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OitFdOcc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so1606677f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 05:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786019189; x=1786623989; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oqooFQB1c/fQuorjw7dX1gZ1in7dbeshrqBRJFTdjSc=;
        b=OitFdOccx41TSsXoccedwE2Fs2C/kx6n3L8VwTGojL+zSGs96OPsLJpJfiuUStEpsf
         HylR68xOCTTM6mCZsT8z4yHkV8cvhmAWafKV/93DuHS3sfz/rrhRnC87nf0j7kz6sxF8
         YP4/rfsYZUlCS/ROE51i9q82fa8lqi27gGpFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786019189; x=1786623989;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oqooFQB1c/fQuorjw7dX1gZ1in7dbeshrqBRJFTdjSc=;
        b=OZy1bDJH33Je16E/DxRc2dgpU9y4ak9ymqOnbHBbh11PuZnp0g5FryyZ6JaiRlXJgL
         9Gi3tKv/lZ5Iu7isjL23sU8oeCzcN+7hKF9fnhEFRAViDLilCv2ARJQIz2YNK3AhSmhT
         hkI0Z0QVO9rXxvxgCr0lSBvKmAtDUqRu+yjlB2Koitv6RAUEpNtU2pFRb+mHd+WDWYtV
         1C1cm6V7TbxxYm5e80kmSoflhy2UkAcvJAI8leg+wVCFUIWzG1ViMiR7BoqCRLKu0LDh
         wQMq4GOe3BsbxzRPMWqRFcYR177A+7+3seZFqGTUrtHhPAxJew9lAnGXQjxrqAvHUbez
         A1Bw==
X-Forwarded-Encrypted: i=1; AHgh+Rr+smgffzsUY47OQ6Pm20XAgcCBtrN/ng2rxdVDmcGSYd7dMeVM2u4bU0Eldn7twbpqrej2YeYvjQNShcu5mOM0FQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyFqY3qegTVPnAB5etw3AqtTmbzcm6zapLrORoJRJvxJSxSZCbx
	T0RPJDrwqymofJV6gW3ArWzvl9kNtS0e7ZNhikwGk5jZDxEihtg7rDZ+Si6HyC8r6h4=
X-Gm-Gg: AR+sD13Xc5kQ8v7Kn+0RgwPU88np7KYQWVvenddNS8AmW3Mmc3mUPbOtdAQCVl2lk9Z
	Sj0qbLqAW9qcGgM5m4Rk7HqtkMoxUuc5TKV5lvJCVGuIC2sobultipi7PuM7wXkRsiUt8WnDui5
	Mr8beDSccrJ8AE4+vRx4ksh9XXgiaEN2k3fINg2QJKD7mDlZVEd3atrvO2+ffDL6loZZta3TTxy
	5kwOHzTCGtBB0tXOv4x5TsLR3gF8XTfjuzDGKPbV+sUAKb5DeHrUqAN+gh3AsDm6WZ7n4umLFm0
	l1fk99NcTalKSuhiZyPKJ11HAaa6m1pBRhyh1PY0bGxeuK6aHEAmMj+lY42anBU7hBkdZrRCJJ2
	iZ127M6YvzYKoq+2Y3YudJQ0jphHX4N00LBKdn/3uRg9eaJapIkBkMAWeqbHF8D4COD3aTLp4Lr
	aXaxNuloyd5OaPOM0DYg8YXOfGgvMVNli8+GW/ItQpgAyzrCiypC5ck1LnqdClFKOYPwh0oMAKm
	HtFgYTekPyAq1B+8/95pepz7lOq3MZiKDXzXvuL/e6RmK5G5XQu/A==
X-Received: by 2002:a05:6000:25ca:b0:47f:8480:4abd with SMTP id ffacd0b85a97d-47fec62f995mr21026351f8f.29.1786019188940;
        Thu, 06 Aug 2026 05:26:28 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9366:921d:f7c4:9ad6? ([2001:8b0:aba:5f3c:9366:921d:f7c4:9ad6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b1809csm5523503f8f.18.2026.08.06.05.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 05:26:27 -0700 (PDT)
Message-ID: <a863f3a0f5304826bf15afe3fb0767d43d378477.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/4] python_pep517.bbclass: always export
 _PYTHON_HOST_PLATFORM for wheel tag
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alhe@linux.microsoft.com, openembedded-core@lists.openembedded.org
Date: Thu, 06 Aug 2026 13:26:26 +0100
In-Reply-To: <20260804220456.2342710-3-alhe@linux.microsoft.com>
References: <20260804220456.2342710-1-alhe@linux.microsoft.com>
	 <20260804220456.2342710-3-alhe@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 12:26:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242937

On Tue, 2026-08-04 at 22:04 +0000, Alejandro Hernandez Samaniego via lists.=
openembedded.org wrote:
> python distutils/sysconfig.get_platform() falls back to
> distutils.util.get_platform() when the _PYTHON_HOST_PLATFORM
> environment variable is unset, and returns the *build host* arch.
> The result is baked into the produced wheel's filename
> (pkg-<ver>-cp3XX-cp3XX-<PLAT>.whl) and its <pkg>.dist-info/WHEEL
> metadata.
>=20
> Without this export, extension-module wheels tag themselves with
> whichever arch the autobuilder worker happens to have, which makes
> the resulting rpm non-reproducible across mixed-arch autobuilder
> pools.
>=20
> Since python 3.14 + wheel >=3D0.44 also rejects wheels with an empty
> platform tag ("Bad wheel filename"), the value has to be non-empty
> in every class scope. HOST_ARCH is class-scoped by bitbake
> (target/native/cross/nativesdk), so `linux-${HOST_ARCH}` covers
> every case with a single unconditional assignment. Setting per-class
> overrides to "" (as an earlier draft did) trips the wheel filename
> check and must be avoided.
>=20
> Pure-python wheels ignore _PYTHON_HOST_PLATFORM and remain tagged
> "any", so this change only affects wheels that ship compiled
> extensions (cffi, cryptography, numpy, bcrypt, markupsafe, psutil,
> rpds-py, websockets, ...).
>=20
> Assisted-by: AI - OpenAI
> Signed-off-by: Alejandro Hernandez <alhe@linux.microsoft.com>
> ---
> =C2=A0meta/classes-recipe/python_pep517.bbclass | 16 ++++++++++++++++
> =C2=A01 file changed, 16 insertions(+)
>=20
> diff --git a/meta/classes-recipe/python_pep517.bbclass b/meta/classes-rec=
ipe/python_pep517.bbclass
> index d6246af5c2..06b23d3cba 100644
> --- a/meta/classes-recipe/python_pep517.bbclass
> +++ b/meta/classes-recipe/python_pep517.bbclass
> @@ -30,6 +30,22 @@ PEP517_INSTALL_PYTHON:class-native =3D "nativepython3"
> =C2=A0# pypa/installer option to control the bytecode compilation
> =C2=A0INSTALL_WHEEL_COMPILE_BYTECODE ?=3D "--compile-bytecode=3D0"
> =C2=A0
> +# Force the wheel's platform tag to reflect the target machine rather th=
an the
> +# build host. Without this, extension-module wheels bake the build host'=
s arch
> +# (e.g. linux_x86_64) into <pkg>.dist-info/WHEEL via distutils/sysconfig=
's
> +# get_platform(), which breaks reproducibility across autobuilder worker=
s of
> +# different architectures. Pure-python wheels ignore this variable and r=
emain
> +# tagged "any".
> +#
> +# HOST_ARCH is class-scoped by bitbake:
> +#=C2=A0=C2=A0 - target:=C2=A0=C2=A0=C2=A0=C2=A0 HOST_ARCH =3D=3D TARGET_=
ARCH (reproducible across workers)
> +#=C2=A0=C2=A0 - native:=C2=A0=C2=A0=C2=A0=C2=A0 HOST_ARCH =3D=3D BUILD_A=
RCH=C2=A0 (matches worker arch, unpackaged)
> +#=C2=A0=C2=A0 - cross:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 HOST_ARCH =3D=3D BU=
ILD_ARCH
> +#=C2=A0=C2=A0 - nativesdk:=C2=A0 HOST_ARCH =3D=3D SDK_ARCH
> +# so a single expression covers every class without producing an empty t=
ag
> +# (which python 3.14 + wheel >=3D0.44 rejects with "Bad wheel filename")=
.
> +export _PYTHON_HOST_PLATFORM =3D "linux-${HOST_ARCH}"

The fix looks right, thanks!

I'm not sure we need the 10+ lines of explanation from AI ;-) The
commit message could be more concise too. We're seening way too much
text being added by AI in general and it will make the codebase harder
to understand in the long run :(.

Cheers,

Richard




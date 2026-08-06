Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 447F0C56208
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 16:10:00 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22964.1786032595819399379
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 09:09:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fXVArLp5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso12517045e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 09:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786032594; x=1786637394; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/xU1p6pGIkTR4Lj7KmcijctlBcmbSghqKKkscughWkM=;
        b=fXVArLp5EFMTV0XJ8eKNGrc2PMwD9Kn6giw1u7RVOtIrhxMHiatCOF7R9FVVV3AZzW
         37IIHQjZT/1hg6+CJf5kaj9q/uUfQ60mJXC5Tr+Zi0KfRzu+JcskhFXrBGU5w2vBTi+C
         qCRIEvwtPezyErCFdcBt1joruiwp11uoBaa5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786032594; x=1786637394;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/xU1p6pGIkTR4Lj7KmcijctlBcmbSghqKKkscughWkM=;
        b=jnp4P/SYK7yGKlKM85aJBXUfHtcob4pLQnjJYPBXdLecdATscwNlNwjNF06yjkKnGJ
         n8yQAV27fE7pwoWTXUTkQCWBHDulNM2szN5WkvIJioFkxtSloACtEa/qYSRcB53WmSur
         PJ739CbHMpUhVPqMC9Jo77kln4A4YgM/B1t7LPDPn6qshUfveVQ1N3OaLdanpgEo9yxh
         caeyaQxZcdZAAE+u9/yKA6yxSsOmcTLIbTuvYFbyGwHbHkBO+4frTOEZaHIAyzk+QnlL
         QlzU1OFTuvnU0YiD6yKmSxcjczT+NXqKxvFXCKKT80bdZKC0X9NUM5dLbaWJB4E9MYBY
         6AiA==
X-Forwarded-Encrypted: i=1; AHgh+RqsqokiQU67iKtMFtNDKGqHl/rs+Y+x11w+v5WrqmzSszXMuayBmm5UBMkXLXRmBKtkZuAPOsbdSnON7MRglMGtuA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyvNMwjblOH8XnwBro2/Zuwy/VoqznYEZA9rd1Y+XUWwCpbB5Ve
	Nv7mE6ogsSI4Atz07Is2fxpVQJLdg/skZH1Kb3F98+O+PrV0RMjiKJkI720Wl04rjvA=
X-Gm-Gg: AR+sD13U1CmQzcYxSjutUwbxZKbQyaoJLk7+IdWBs5G4jgY37Gx8467iZHmwIAsQeDv
	Hqk4s9fRY+0qFLML6A47S991rquE0ZSSvqzPI+bK3RxjwKWf+AQ84cmyrPDzlWA7sN71PiZaz8Z
	D2fY4Otm1UXcM9PYefShS3yGtNjouqtIMFfLQ4M9oEK8teJ4bwIqYR0zX/EGT7cj/96CReCzXR9
	XRyx9bLSnS3FmUGzKuC2OJDIvQvrwDEm9v7mk6EsAOy0n4XSx8Bgu68yl2VtkGHquF0x8UNwfen
	JcMiX2DBsnWpPXAhSaeDunA88giOmQNSLCduwkNT3KnVwcsLtMoQE8Dr8H1hQ/9WQvEI2Jem7YQ
	rwPHrfQgz47qQCTSwPnrTJeEgBQSZQGupfwJaYl3TQbXL0l3HSKaJvsYOCiHaZUf1lUM17+2dhS
	JmjYBrJ097Nftfat7f46dgJ6Znyo7Km8U7orpGrQtjEpzJg2DQcZYSuw+3BnbLrvTa3Os1j3bP9
	ZQZikqg14YMUWDsnJRLYurkbVMO6X5Zn8C6lEHSYr32P2qdHqJrT+Wb/4GRUIb+ZQ==
X-Received: by 2002:a05:600c:474a:b0:495:7888:281c with SMTP id 5b1f17b1804b1-4994e6d4a13mr186181965e9.0.1786032593909;
        Thu, 06 Aug 2026 09:09:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9366:921d:f7c4:9ad6? ([2001:8b0:aba:5f3c:9366:921d:f7c4:9ad6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499541b525dsm85744405e9.0.2026.08.06.09.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 09:09:53 -0700 (PDT)
Message-ID: <c5594afab73a3a5627aa694bb4b879e38f855382.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/4] python_pep517.bbclass: always export
 _PYTHON_HOST_PLATFORM for wheel tag
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alejandro Hernandez <alhe@linux.microsoft.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 06 Aug 2026 17:09:52 +0100
In-Reply-To: <12ac583b-cb68-48ca-9fdc-28216d706713@linux.microsoft.com>
References: <20260804220456.2342710-1-alhe@linux.microsoft.com>
	 <20260804220456.2342710-3-alhe@linux.microsoft.com>
	 <a863f3a0f5304826bf15afe3fb0767d43d378477.camel@linuxfoundation.org>
	 <12ac583b-cb68-48ca-9fdc-28216d706713@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 16:10:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242955

On Thu, 2026-08-06 at 09:51 -0600, Alejandro Hernandez wrote:
> =C2=A0
>=20
>=20
> =C2=A0
>=20
> =C2=A0
>=20
> On 8/6/2026 6:26 AM, Richard Purdie via lists.openembedded.org wrote:
> =C2=A0
>=20
> =C2=A0
>=20
> > =C2=A0
> >=20
> > On Tue, 2026-08-04 at 22:04 +0000, Alejandro Hernandez Samaniego via li=
sts.openembedded.org wrote:
> > =C2=A0
> >=20
> > > =C2=A0
> > >=20
> > > python distutils/sysconfig.get_platform() falls back to
> > > distutils.util.get_platform() when the _PYTHON_HOST_PLATFORM
> > > environment variable is unset, and returns the *build host* arch.
> > > The result is baked into the produced wheel's filename
> > > (pkg-<ver>-cp3XX-cp3XX-<PLAT>.whl) and its <pkg>.dist-info/WHEEL
> > > metadata.
> > >=20
> > > Without this export, extension-module wheels tag themselves with
> > > whichever arch the autobuilder worker happens to have, which makes
> > > the resulting rpm non-reproducible across mixed-arch autobuilder
> > > pools.
> > >=20
> > > Since python 3.14 + wheel >=3D0.44 also rejects wheels with an empty
> > > platform tag ("Bad wheel filename"), the value has to be non-empty
> > > in every class scope. HOST_ARCH is class-scoped by bitbake
> > > (target/native/cross/nativesdk), so `linux-${HOST_ARCH}` covers
> > > every case with a single unconditional assignment. Setting per-class
> > > overrides to "" (as an earlier draft did) trips the wheel filename
> > > check and must be avoided.
> > >=20
> > > Pure-python wheels ignore _PYTHON_HOST_PLATFORM and remain tagged
> > > "any", so this change only affects wheels that ship compiled
> > > extensions (cffi, cryptography, numpy, bcrypt, markupsafe, psutil,
> > > rpds-py, websockets, ...).
> > >=20
> > > Assisted-by: AI - OpenAI
> > > Signed-off-by: Alejandro Hernandez <alhe@linux.microsoft.com>
> > > ---
> > > =C2=A0meta/classes-recipe/python_pep517.bbclass | 16 ++++++++++++++++
> > > =C2=A01 file changed, 16 insertions(+)
> > >=20
> > > diff --git a/meta/classes-recipe/python_pep517.bbclass b/meta/classes=
-recipe/python_pep517.bbclass
> > > index d6246af5c2..06b23d3cba 100644
> > > --- a/meta/classes-recipe/python_pep517.bbclass
> > > +++ b/meta/classes-recipe/python_pep517.bbclass
> > > @@ -30,6 +30,22 @@ PEP517_INSTALL_PYTHON:class-native =3D "nativepyth=
on3"
> > > =C2=A0# pypa/installer option to control the bytecode compilation
> > > =C2=A0INSTALL_WHEEL_COMPILE_BYTECODE ?=3D "--compile-bytecode=3D0"
> > > =C2=A0
> > > +# Force the wheel's platform tag to reflect the target machine rathe=
r than the
> > > +# build host. Without this, extension-module wheels bake the build h=
ost's arch
> > > +# (e.g. linux_x86_64) into <pkg>.dist-info/WHEEL via distutils/sysco=
nfig's
> > > +# get_platform(), which breaks reproducibility across autobuilder wo=
rkers of
> > > +# different architectures. Pure-python wheels ignore this variable a=
nd remain
> > > +# tagged "any".
> > > +#
> > > +# HOST_ARCH is class-scoped by bitbake:
> > > +#=C2=A0=C2=A0 - target:=C2=A0=C2=A0=C2=A0=C2=A0 HOST_ARCH =3D=3D TAR=
GET_ARCH (reproducible across workers)
> > > +#=C2=A0=C2=A0 - native:=C2=A0=C2=A0=C2=A0=C2=A0 HOST_ARCH =3D=3D BUI=
LD_ARCH=C2=A0 (matches worker arch, unpackaged)
> > > +#=C2=A0=C2=A0 - cross:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 HOST_ARCH =3D=
=3D BUILD_ARCH
> > > +#=C2=A0=C2=A0 - nativesdk:=C2=A0 HOST_ARCH =3D=3D SDK_ARCH
> > > +# so a single expression covers every class without producing an emp=
ty tag
> > > +# (which python 3.14 + wheel >=3D0.44 rejects with "Bad wheel filena=
me").
> > > +export _PYTHON_HOST_PLATFORM =3D "linux-${HOST_ARCH}"
> > > =C2=A0
> > >=20
> > =C2=A0
> >=20
> > The fix looks right, thanks!
> >=20
> > I'm not sure we need the 10+ lines of explanation from AI ;-) The
> > commit message could be more concise too. We're seening way too much
> > text being added by AI in general and it will make the codebase harder
> > to understand in the long run :(.
> >=20
> > Cheers,
> >=20
> > Richard
> > =C2=A0
> >=20
> =C2=A0
>=20
> I agree, I can send a v2 or just keep it in mind for next time, let me kn=
ow.

v2 please, it is too verbose and I would have to manually trim it...

Cheers,

Richard


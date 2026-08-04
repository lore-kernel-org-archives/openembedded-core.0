Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8836CC55172
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 06:20:16 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10676.1785824414662889865
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 23:20:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iUElEIMt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso2553952f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 23:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785824413; x=1786429213; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HzM9gf+/j0IIu5KnW3eIFkIo/UXd6K0xA7ikIHpq48o=;
        b=iUElEIMtAQa6sbOH+Y1x4QIio5EhAn0KbNDNAAR2iBZH6/Rbutrai4YS9xnrTvcqtB
         c0hcR9nZJavEIpYy88LXVIaIk06TJulmtfDfD3CU6x4+Z4pZsjAAQJz8OW1PqNjzS3dx
         d+9H0u3IaojyeSKq471OJzqcWiJ8w+ZmYUwhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785824413; x=1786429213;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HzM9gf+/j0IIu5KnW3eIFkIo/UXd6K0xA7ikIHpq48o=;
        b=P+30fYmmSvZxM19xtUde+HvXy0YL/zWsWJkrtYW+ePWKflQSWcktITpa3dcZEz8dN+
         d58fo2RgDp2WuhIZQ6eg3iSMrBJTg/uFLJRXzIFIIEKD0y3VBk9DXVieOoNufAenf/ir
         7OCfyzh4CQ62o7gT3uoZfljxuJfJNbwfdfH0LtxoXcuzVzn8ZmdE2wWDOpJgFGIUZGF9
         SCiVuRP8Z11+EtD6oNPsz2AVdMFnuAFkUdkQWWOGt9bV13fe5+9+WKbTTFn1aBK8NQtO
         vL0m0FCoALFirscf5MohzaOiafDxp2xkvO9EVSuxtqgW/RGCTYo7/q7Aa4uTnklbhLWm
         2ebQ==
X-Forwarded-Encrypted: i=1; AHgh+RrE0SENjpsACybLVFm7XY82xFQdp5LCMNQhND9bxaPRib1jW7zGdCQgVL1CJM5J+nx2k7lv+tXGO3p1xZbTQuf0cQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx+N43fuSJGSl0xqAhB92yCwRWNhNB7mOGDhUeJbUshi9IAwd9L
	t7hGsZKb9goGbJ0rf4frI8YvX1jyL+8yJvwsvqG5Qr7sIDEtpoS5ranu7uQnTPrU2Oracb0Fg93
	xpctSgcA=
X-Gm-Gg: AR+sD10lGg6GV5JLHrQsnAnogo/gi0FuLgJ7ePIFo1EG7BvKsUckJMjqeX+9qRPLx9N
	5OlgsxT9kwlfPtwPU52iBfUoRRISjnmwulM1xeMWe2xLvPB2wZGHM5ieJkByIpTWE2rV3Afi2pT
	Yc4UncWWbqdwxAGQVDT+XgCQitpOBd20ZLexA2D/SjZ1Vhsc4oc3ylHJyyA0TwFRUwpHHstaDbd
	+piXJ51/zVrhxXrX7DA6DNV8VdDvd2Hdnns6qG8gUXdUicPgYnjQNEUToNjJRP5dZA5gkTJtXOY
	4ec50yuQMqA2quhwPZLx6C4+zt4dW8NQavGHZJE2NH4w6HS39azUo9Sa4INof8ptktDeHDJZIrX
	Px+smISaqh6OJ+pxnJ6TrUJQG1Ra7nCy4Pr1DXkT0NCRUkJgH+6Dvh13TlIlh/vLrNHePoUAU2E
	fOTl8li2/L1Af85/ZJhJocEIHFtucEnc7+hMuUik7Ebo5ParpE8GdnrPuxI2oIMDCmWTShEkvdC
	zqr24eKm7WVRVFfgy39OkwkJdeUbt3UweQ4HfM+aYVHKFNzwHQJrQ==
X-Received: by 2002:a05:600c:840f:b0:495:7888:281c with SMTP id 5b1f17b1804b1-4980c6020b8mr253230745e9.0.1785824412059;
        Mon, 03 Aug 2026 23:20:12 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ce15:a763:9e16:7bb4? ([2001:8b0:aba:5f3c:ce15:a763:9e16:7bb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1a58sm39939618f8f.7.2026.08.03.23.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 23:20:11 -0700 (PDT)
Message-ID: <158bd2adc4fa1b0e88d0d506ec2e2a566968b725.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH] libva: update 2.23.0 -> 2.24.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: f_l_k@t-online.de, openembedded-core@lists.openembedded.org
Date: Tue, 04 Aug 2026 07:20:09 +0100
In-Reply-To: <20260803134915.8676-1-f_l_k@t-online.de>
References: <20260803134915.8676-1-f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 06:20:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242701

On Mon, 2026-08-03 at 15:49 +0200, Markus Volk via lists.openembedded.org w=
rote:
> version 2.24.1
> va: include <unistd.h> for getuid/getgid in secure_getenv fallback
>=20
> version 2.24.0
> va: Add VA_PICTURE_H264_NON_EXISTING flag
> va: use secure_getenv instead of getenv in va_x11.c
> doc: fix libva av1 link for doxygen
> trace: dump input/output data in va_TraceProtectedSessionExecute
> trace: Add ProtectedSession Related Log in Trace
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
> =C2=A0.../{libva-initial_2.23.0.bb =3D> libva-initial_2.24.1.bb}=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 0
> =C2=A0.../libva/{libva-utils_2.23.0.bb =3D> libva-utils_2.24.1.bb}=C2=A0=
=C2=A0=C2=A0 | 0
> =C2=A0meta/recipes-graphics/libva/libva.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++--
> =C2=A0.../libva/{libva_2.23.0.bb =3D> libva_2.24.1.bb}=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
0
> =C2=A04 files changed, 2 insertions(+), 2 deletions(-)
> =C2=A0rename meta/recipes-graphics/libva/{libva-initial_2.23.0.bb =3D> li=
bva-initial_2.24.1.bb} (100%)
> =C2=A0rename meta/recipes-graphics/libva/{libva-utils_2.23.0.bb =3D> libv=
a-utils_2.24.1.bb} (100%)
> =C2=A0rename meta/recipes-graphics/libva/{libva_2.23.0.bb =3D> libva_2.24=
.1.bb} (100%)
>=20
> diff --git a/meta/recipes-graphics/libva/libva-initial_2.23.0.bb b/meta/r=
ecipes-graphics/libva/libva-initial_2.24.1.bb
> similarity index 100%
> rename from meta/recipes-graphics/libva/libva-initial_2.23.0.bb
> rename to meta/recipes-graphics/libva/libva-initial_2.24.1.bb
> diff --git a/meta/recipes-graphics/libva/libva-utils_2.23.0.bb b/meta/rec=
ipes-graphics/libva/libva-utils_2.24.1.bb
> similarity index 100%
> rename from meta/recipes-graphics/libva/libva-utils_2.23.0.bb
> rename to meta/recipes-graphics/libva/libva-utils_2.24.1.bb
> diff --git a/meta/recipes-graphics/libva/libva.inc b/meta/recipes-graphic=
s/libva/libva.inc
> index b3ec4f61d1..8e784c1ad1 100644
> --- a/meta/recipes-graphics/libva/libva.inc
> +++ b/meta/recipes-graphics/libva/libva.inc
> @@ -18,8 +18,8 @@ LICENSE =3D "MIT"
> =C2=A0
> =C2=A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2e48940f94acb0af582e5ef0=
3537800f"
> =C2=A0
> -SRC_URI =3D "git://github.com/intel/libva.git;branch=3Dv2.23-branch;prot=
ocol=3Dhttps;tag=3D${PV}"
> -SRCREV =3D "dbf83dc3b1ce6bad46e1628aaf2da5ef731157b8"
> +SRC_URI =3D "git://github.com/intel/libva.git;branch=3Dv2.24-branch;prot=
ocol=3Dhttps;tag=3D${PV}"
> +SRCREV =3D "710eb465c6277ee2cac3e6948767b01eebe7e77a"
> =C2=A0
> =C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D "^(?P<pver>(\d+(\.\d+)+))$"
> =C2=A0
> diff --git a/meta/recipes-graphics/libva/libva_2.23.0.bb b/meta/recipes-g=
raphics/libva/libva_2.24.1.bb
> similarity index 100%
> rename from meta/recipes-graphics/libva/libva_2.23.0.bb
> rename to meta/recipes-graphics/libva/libva_2.24.1.bb

This breaks libva-utils since it doesn't change the branch or revision
in that bb file and there is no 2.24.1 libva-utils release.

I've pulled that bit of the patch out, updated that recipe separately
and will retest.

Cheers,

Richard


Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A38AFC77B7C
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 22:54:11 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.8328.1750719243680762175
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jun 2025 15:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QbZBXG1k;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so47912295e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Jun 2025 15:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750719242; x=1751324042; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjoS9DVK87CBB+xLo+bkBDgs9MS3AphsXzG/gqRO+eY=;
        b=QbZBXG1khecI5cx+dcWhTwf81a0txK/LgqX2NxcgOJzfkWsNglzfV2wMq9Fxb1LDic
         nnhfc9Ek39okvpH0LHR/2kw89lVSQueX12170Pp4hl8fS7wHrc5PoqBPBXVxkZb9oyvu
         gKy7CiNfWe+Af0Uc2P+4km42EmfLR1sHQqv9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750719242; x=1751324042;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SjoS9DVK87CBB+xLo+bkBDgs9MS3AphsXzG/gqRO+eY=;
        b=vuTUZra8q+90i3WJmfFJgGgOlUVCL3SXuVg0RrQWGZNfgH5TPX6jzUaLiLcIDmcLwQ
         dyuYenwtwbxThNkC9xSfsY8cyHBie39EQw7IXlIrviVostPja+aNplUc+t9gb1y5D4RN
         QpisrDwknenMmmpsOqOsQ2ECUcgq2bxjlRDLdem6zBLFozAIh89EkOnuYx6OMIA6sbop
         ZceYn6nHPepkjAsJ2pMIwGvYJEU25xoyQ2iVG20ur6xNqs3yFBYeQyXxDDLOiyxuxxJV
         wV0AoK6t1zQini7TCMDV9dMEy9/SjK7D6rNZDFbFrk6CGAx4bHzVNw/QOIxTbP+/cWvt
         6EeA==
X-Forwarded-Encrypted: i=1; AJvYcCUlwfW+hD+4W9S2UaLoVc2SnqRTkEblTg1+n7odeDrH1OjDhe+gx9gdD/H5/bCVTqcVNRYnduKMkIYXk32GtzFUMw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywva83Tl/xIJf6AME4RucnMwzMcQe5ss0vuffXo7C/uYeVtqRoB
	yS/R6QU3wE4ySLzeJ87v9dlJ0zyX6DAIK4qtICIsDyLuBG6Pcz/3CMt5ySYRGcnkWX0=
X-Gm-Gg: ASbGnctOG0ty8ZKCaFkEP/2O7BJlCnWaVXdSniYaYSLgEo7O2GtNoQGhaQZVbV4w3u4
	ercqcj0fnIW1pBS/vRHAW7pwQ+J9zcSkkGPfSIIF4jg/i4HBAR2Qzk7/Ff2I0OkEaSDItbVsjVz
	0jagTiy+G/xewnvWN2qTNPwIECZSFcGMwM7aQ5VEszWZiDKCyd5AP9zc5TjauDqDmQ6Wu1AieGN
	TNf683QcKQv5RIygbnQnWVPHrlP8aRyanHcyqAGLs0xMuOuMyoAhMRhU4+FMDDjKxVJJKT3rImV
	ZGLT/mqddSCnArXCVkjw+xoWofkkemjUhmobpS8CDnuN1pN2fbAJ6vVfsVmG70Mr0STBUZj05FL
	e1hTHtRlG2yDn2CD8JLsEp143PSRilOgUzA7z9aEsdfK6qKVo0HU=
X-Google-Smtp-Source: AGHT+IE2mL6/ggRdSEwdmXuCFL2wC183x3yjvI8lniLPO3w6nwmk3QdqL/wv5evWfuTpXr/l9BDRbg==
X-Received: by 2002:a05:600c:3513:b0:450:cde3:f266 with SMTP id 5b1f17b1804b1-453659cb94bmr120282915e9.22.1750719241779;
        Mon, 23 Jun 2025 15:54:01 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8bf4:3d1b:6949:400a? ([2001:8b0:aba:5f3c:8bf4:3d1b:6949:400a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646cb692sm124610905e9.2.2025.06.23.15.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 15:54:01 -0700 (PDT)
Message-ID: <fc222f5e73157930877983d4c7865c4051536e41.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] dnf: upgrade 4.22.0 -> 4.23.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Moritz.Haase@bmw.de, openembedded-core@lists.openembedded.org
Date: Mon, 23 Jun 2025 23:54:00 +0100
In-Reply-To: <20250623095808.2953467-1-Moritz.Haase@bmw.de>
References: <20250623095808.2953467-1-Moritz.Haase@bmw.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jun 2025 22:54:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219224

On Mon, 2025-06-23 at 11:58 +0200, Moritz Haase via lists.openembedded.org =
wrote:
> New version includes support to build against CMake 4+, see [0].
>=20
> Release notes are available at [1].
>=20
> [0]: https://github.com/rpm-software-management/dnf/pull/2217
> [1]: https://github.com/rpm-software-management/dnf/releases/tag/4.23.0
>=20
> Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
> ---
> changes in v2:
> - Add missing 'Signed-off-by' footer
>=20
> ---
> =C2=A0meta/recipes-devtools/dnf/{dnf_4.22.0.bb =3D> dnf_4.23.0.bb} | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> =C2=A0rename meta/recipes-devtools/dnf/{dnf_4.22.0.bb =3D> dnf_4.23.0.bb}=
 (98%)

This works in many cases but this did show up:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/1951

Traceback (most recent call last):
  File "/usr/bin/dnf", line 56, in <module>
    from dnf.cli import main
  File "/usr/lib/python3.13/site-packages/dnf/__init__.py", line 30, in <mo=
dule>
    import dnf.base
  File "/usr/lib/python3.13/site-packages/dnf/base.py", line 32, in <module=
>
    from dnf.comps import CompsQuery
  File "/usr/lib/python3.13/site-packages/dnf/comps.py", line 27, in <modul=
e>
    from dnf.exceptions import CompsError
  File "/usr/lib/python3.13/site-packages/dnf/exceptions.py", line 22, in <=
module>
    import dnf.util
  File "/usr/lib/python3.13/site-packages/dnf/util.py", line 28, in <module=
>
    import ctypes
ModuleNotFoundError: No module named 'ctypes'

As well as:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/80/builds/1745
https://autobuilder.yoctoproject.org/valkyrie/#/builders/11/builds/1874

Not sure what the pattern is...

Cheers,

Richard


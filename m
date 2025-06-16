Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEE31C7115C
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 11:42:34 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.28387.1750074146306193875
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 04:42:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WRZky6XC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso4316053f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 04:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750074144; x=1750678944; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iBxrzs/LPE+uUgTLJLz6ryU5HoB+rx8D9zLhyaWnrVs=;
        b=WRZky6XCJD17g8U3/s8XabsD2bwt8LbwElyUtBq4j0dBX8pXsvEKiZw94gaAmwFVMl
         kpJBjuCBziLlSw0uDOuCkV/KWiWVzxJKbf4cw/27An//A4Wz06fFiHncHHD0LFUVmquL
         kPz2tGNf2GydvDeCkKMwxlSvzwyr2DwUAxHw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750074144; x=1750678944;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iBxrzs/LPE+uUgTLJLz6ryU5HoB+rx8D9zLhyaWnrVs=;
        b=PVER7Ec3/Pg+k/lyiKojv811QgLslsP3b1Hxyr52pmpsnmfqcOJr4Sr3G6PsvPD3kD
         dsGFR3yItNXolQtMx3Pa9v728oJV3lKAruUuq4uarHb74GcVd8ptK7G0tA4Nfrt2+ML+
         yC0ZaPgWU4azPPTRr1mGR6vZJcFITvFIjzB76RUM2LCqj4DQByV7AJyyTpcMQH0oaCuy
         jJ2Otl4It8GiwCGK5GewwdT0oy1XonODfBSWmfHa+NHaF3poitEwmSGjzQ+/ZMZ8/S+K
         bfb4mkVkdR5Xa3aGn+cr/DUJE0bp+7aX2K57zo7vnBvR0vJ9V6H7N2v7Ht41yo2/Uhbd
         6ZIw==
X-Forwarded-Encrypted: i=1; AJvYcCUAAmzzFOLavvYwFiM6svD/XYoQmctWfbR4QdX6DJV87Em+Dk+9TLjOmTphjttRi7dHboAhiS01TRuI9mJTxpUm2g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YytmpMUutD1Vsb48r1uwm7uxFv0TkVGM0Ri4+S779u7v/j5ltLe
	DaXKuELwM1zeGxbJvuFk43aGaTbh1HQ3WpAW8mtxgJQ6CVgm88nk8/GJ+o4bje83eNA=
X-Gm-Gg: ASbGncsOexE3dBaEJVuEbV1OkIP21bfHidtgjiIiolb7BzUQ3TJ+OeXMK51zOGTzrJ7
	KAokmi7UpmBuSDsYodGzHBGD52wYdUygBXvJgxQMWCdMy4RM4+lD4Ym3aP+pnhhUTL0YQkZHR00
	50TV9Z/egFKU197vCXSYFp0o9qqamPR7KSEKkkcX9dk6dvcf7+kH3XK8KT7hrwgygoFreYATyji
	oszUQrW6CqT1uRbdPeaafAHsa+vwAkkjBJV6mXx1vZJew9I2I3ad49EnI0PVCqwGVlzl5ud5MbB
	TOZHP+asFmDmGNijQHC3zwRfRirFsDZtQ0jE4//8WvySfdh7P/TKjsbY8yG+S0mSiujR6UCvlXI
	aUjNYevwb3Lri1DRbG6gMIr38hNZlqq7xsxVYJ5x89T4T46nI
X-Google-Smtp-Source: AGHT+IEFWCMYuc4faRXuMqjaJnE3m5MXgtIXfemmEL/MOG4SqqS0hFdCqABXaMD/LOlK5HgXs9OQrg==
X-Received: by 2002:a05:6000:4211:b0:3a4:dc42:a0ac with SMTP id ffacd0b85a97d-3a572e4b6eemr7477250f8f.49.1750074144523;
        Mon, 16 Jun 2025 04:42:24 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a03:fc99:2a4c:41a2? ([2001:8b0:aba:5f3c:a03:fc99:2a4c:41a2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b28240sm10898616f8f.72.2025.06.16.04.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 04:42:23 -0700 (PDT)
Message-ID: <19216fd3887717be59f8f2028d52000b8da039ce.camel@linuxfoundation.org>
Subject: Re: [bitbake-devel] [RFC PATCH] bitbake: add support for 'built-in'
 fragments
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, bitbake-devel@lists.openembedded.org, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Mon, 16 Jun 2025 12:42:23 +0100
In-Reply-To: <20250616105552.2939169-1-alex.kanavin@gmail.com>
References: <20250616105552.2939169-1-alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 11:42:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218815

On Mon, 2025-06-16 at 12:55 +0200, Alexander Kanavin via lists.openembedded=
.org wrote:
> From: Alexander Kanavin <alex@linutronix.de>
>=20
> Note: this deliberately puts bitbake and core changes into one commit
> to make RFC review easier.
>=20
> When reviewing proposed fragments to add settings for DISTRO and MACHINE,
> RP noted that such fragments only add clutter and overhead, and there's
> no need to maintain them as separate files.
>=20
> Rather when bitbake sees 'fragmentvar/fragmentvalue' it can expand that i=
nto
> FRAGMENTVAR =3D "fragmentvalue".
>=20
> This is a RFC proposal to add such 'built-in' fragments; I had to pick a
> name for the concept, and open to alternative suggestions.
>=20
> The centerpiece is the
>=20
> OE_FRAGMENTS_BUILTIN ?=3D "machine:MACHINE distro:DISTRO"
>=20
> setting in bitbake.conf, which acts as both a definition and an allowlist
> for such fragments.
>=20
> With that in place, it's possible to set
>=20
> OE_FRAGMENTS +=3D "distro/poky machine/qemuarm"
>=20
> and bitbake will interpret that as
>=20
> DISTRO =3D "poky"
> MACHINE =3D "qemuarm"
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
> =C2=A0.../bitbake-user-manual-metadata.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 19 ++++++++++++++--
> =C2=A0bitbake/lib/bb/parse/ast.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 16 =
++++++++++++--
> =C2=A0bitbake/lib/bb/parse/parse_py/ConfHandler.py=C2=A0 |=C2=A0 2 +-
> =C2=A0meta/conf/bitbake.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++-
> =C2=A0meta/lib/bbconfigbuild/configfragments.py=C2=A0=C2=A0=C2=A0=C2=A0 |=
 22 ++++++++++++++++++-
> =C2=A05 files changed, 55 insertions(+), 7 deletions(-)

FWIW at a first glance I like this a lot. I need to have a think about
the details but in general I'm very happy to see this.

Cheers,

Richard


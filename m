Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56B44EA3F25
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 08:33:23 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15582.1770712393727010413
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 00:33:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VTj1/NU2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-437711e9195so1184628f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 00:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1770712392; x=1771317192; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rj/nxx+rGg3HxtFah9mC6/uppglB40XtmxeyR30Io4g=;
        b=VTj1/NU27ZmdTuLTrr4YoWn/mlYImaiFYk/Y8dTPtgwTEcv9+VQstQnKaFX7xVu+3r
         +6l9z63pM2AgwcIQkv8E440zNh4c4JcNkhdcXcUXP9ttNCJl3fLGp9dcPKYDq3qM+YGF
         XG4FwnCTVHLKz6Ko6CisJKsb7IymiEGOFR1wI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770712392; x=1771317192;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rj/nxx+rGg3HxtFah9mC6/uppglB40XtmxeyR30Io4g=;
        b=EL1IFFpezSvVUVzbFP1ezObU16TV3v5kxetch9Q022B94Z1kk/jpfviVceCa8KNati
         A0kLWbCNL8n/ng8xf1cnG6TBTO9DYdR5OLg/edWVIYfblMVJATrOXCdzdZ1J8U5Cqp3K
         ObpzjZjp2Mn1NZHUX5NwhF2dBIVvT7WSx8ZXPWLqORcfSM89C3GSpM+aJi3WX7tbrElb
         CgKFU0dcYUS4mjf3HmLW6C6DbVA8LuQzgQqtbIk8PJbzCpND5hrEJN+yFya7R6S3h8We
         qThOAwpEhCZA7W9FvE64MumrPizmOIRqXjfAiomtQ5WhG9kHBntLMijaR8puA4+Qjp7Q
         aJVA==
X-Forwarded-Encrypted: i=1; AJvYcCXLlH7KKuiobZhGbEYaY7SoWeKcmHmz1FTw8xn0iEulzKHOMFK2E/JskgIEFcsQrOqAim1ubbojY97jbcRQOno/jg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxt+lDHy4wM/uGIGH2Gy9zhRJ8TdaPv8XMq9Iuhwfqd7L2+jwNF
	W6kzB4KExJ6zA6gcnW0bvaGB1hd8K2KY1zXghgBD7fnINUjmydHlQB60NOsM/6+kkWg=
X-Gm-Gg: AZuq6aLk7dgyanq9rpn4OtWq2yiFNjXtla5zEwmywuXxRmFDzYLEOsGHCg0vSJ/Znmu
	H9/za+OE7DJwREh/Nc2YvbkYxE0cE1tnP7rxn8zp61zezowL87F2xvr1lKxLdJ4H9ssq7cVHlqY
	yfXPEPFYVKQLuMU9+d+Ld2HoRb11RHTOCgVY7ptCvYjZsFqbSPExRiRBjrn3ko07sI5WgzLLGPm
	HRXRQkGRxuH7HQYbBWKpROw2o3B1ODcrTB2UKHBA1LaIktyxwBHJA8Od1KGTZWA5Kha1tgo4gk4
	T8kwuR6pCjOIg5ImQQoIzSqOvxauNtJmA2xmuB63n11w6h6q3vHbK2qzpoK5WlDuxFDEo97huPQ
	NtKRrX9UHBk+VbJF2WRpg5fF7SXft2wJzDlygaFzaL990OkBNZBvPPjEcetaF1paK0nbRV0vuDo
	6NxaMHzWIeyLRlspG5hZNI0eeB8qRFTy/aPCv4sKMs+BgAH+KxKvqK0jDW6Q/uqqne+InwZV27e
	Ppm+9Xd6Q==
X-Received: by 2002:a05:6000:25c4:b0:436:32ea:6ac7 with SMTP id ffacd0b85a97d-4377a57d899mr1594614f8f.40.1770712392005;
        Tue, 10 Feb 2026 00:33:12 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:847e:ef7e:e5c4:fa? ([2001:8b0:aba:5f3c:847e:ef7e:e5c4:fa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376b62b835sm19541127f8f.12.2026.02.10.00.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 00:33:11 -0800 (PST)
Message-ID: <9f46cb53a43c6f01135b8a8e18269e92cceb1725.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] systemd: fix libsystemd LICENSE for multilib
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jaeyoon.jung@lge.com, openembedded-core@lists.openembedded.org
Date: Tue, 10 Feb 2026 08:33:10 +0000
In-Reply-To: <20260210054147.838158-1-jaeyoon.jung@lge.com>
References: <20260210054147.838158-1-jaeyoon.jung@lge.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 08:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230863

On Tue, 2026-02-10 at 14:41 +0900, Jaeyoon Jung (LGE) via lists.openembedde=
d.org wrote:
> From: Jaeyoon Jung <jaeyoon.jung@lge.com>
>=20
> Prepend ${MLPREFIX} to LICENSE for libsystemd.
>=20
> Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
> ---
> =C2=A0meta/recipes-core/systemd/systemd.inc | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/sy=
stemd/systemd.inc
> index daf37060d7..80a527dd25 100644
> --- a/meta/recipes-core/systemd/systemd.inc
> +++ b/meta/recipes-core/systemd/systemd.inc
> @@ -11,7 +11,7 @@ elaborate transactional dependency-based service contro=
l logic. It can \
> =C2=A0work as a drop-in replacement for sysvinit."
> =C2=A0
> =C2=A0LICENSE =3D "GPL-2.0-only & LGPL-2.1-or-later"
> -LICENSE:libsystemd =3D "LGPL-2.1-or-later"
> +LICENSE:${MLPREFIX}libsystemd =3D "LGPL-2.1-or-later"
> =C2=A0LIC_FILES_CHKSUM =3D "file://LICENSE.GPL2;md5=3Dc09786363500a9acc29=
b147e6e72d2c6=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://LICENSE.LGPL2.1;md5=
=3Dbe0aaf4a380f73f7e00b420a007368f2"
> =C2=A0

The commit message doesn't explain why.

In most cases the code should automatically handle MLPREFIX. Are there
other similar issues elsewhere and should we be fixing something in the
multilib class extension code instead?

Cheers,

Richard



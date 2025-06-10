Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9CBDC5B543
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 12:24:16 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.85008.1749558246239125001
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 05:24:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BSCEVgoL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so4117947f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 05:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749558245; x=1750163045; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mOZ71HMO6WMfFfCxoatBTewuVvWHua2ZdCozG68pI9o=;
        b=BSCEVgoL8JTaRNBs5gvdo62Sr0Q18jJ12MTR6Ae6F5bT4JwfRE4Aetp6+/AS1W/J/r
         ibL+WEMgwLcKhUInlaIPd8aXSRNSn6ONTC+HvBXAg5iy/EfGCJVv5Xf+rJwmYGc3fiDO
         lBhxXP3tzT6t/7KmRFqbte/mK1Up/Sh0SoykM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558245; x=1750163045;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mOZ71HMO6WMfFfCxoatBTewuVvWHua2ZdCozG68pI9o=;
        b=cZxcJjFmA27bxnKvFUOd0Ykq2TmgEKTuMSJIomaRTF6Ha8twEGsxHGxcSxLk4ZIZej
         aYIGpiadBTVmmyZXeTpIql1euE6k57149S6bljjTh1nHe22j8Kenit0nrT8OgHP7gFwE
         p1VPuknDPTPJ7l/uXC7a6YIusHxAuLgxcSkgiVjDAgAmz13RjoSiaMX8mr8ADCQf21W6
         rG1CFVwWPnpC1/94ePjoBV3IyyS7M8+EIBUxkbqtT9ohDSryKhE1PPdAbok/naAWxQHd
         0gv2T5ekGubjxTbcqv7cjYFmfcnWFJSet2NSelQ2pZj/Otaa0dLi7fkUMCKWXIa3tXq8
         S9sQ==
X-Forwarded-Encrypted: i=1; AJvYcCWH1/WUmP9NgLYJ4/eJ+UNh8JSqShD8iXpXgVmMKuzPqkbIQ5BaeihurbFFmJ1qkvABnp48Kwc8zy2f6MJdq+2C6Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywu8dHT6ZD9Jl391rhd5lV6M1BLxeHv+ApwfWnHCP0RTedqfNqJ
	qZahbYJWMXGq+Dy1rwkccbHgi+iLN1T6Vw+4A2JDL985inlcMApnXXusOxom8DvS2zI=
X-Gm-Gg: ASbGncsmzBR+g1QUCrLMuPkXTlzEsVeRyLI1BZWhme1XN5MMjzP383KbyHzcH/CW3VR
	stdl+FcbH6HtXPEoXyxiMSXUHGcyIWyYBKrOYnLjQrXyhpjkIGiVNj3BjtYy7ezT6mqfc5pdDTn
	S3p5GwH87QF0vQWCtJ3mT628UKVinlH/CuRW7lfKPg3fc8zMGUnXvGrSyy6WFnJUOg2M6JfdBav
	DmUIjhvbLMBM+Ify5Hc/OuEmwZaz6fYFraRP8zlE3nX+cqWU0JgdCDs+SvnjHlxVFh276S+QD0L
	vsue7uxuIiVx+ZRCKHNDgLWTJIUlssV7F2pNoqCXrRCefD/T4UlbE5v/8m0RC1Djg23wYpwt9pI
	5PYzj5WWBeoOZRAC3nJeilXHaU8uew8ZbLcNdhWH3PZTIq6VT
X-Google-Smtp-Source: AGHT+IEvJp+Vhxx+ECtH409kmVLEFHcx9dd14jHTh5uoQheytDyVLs3JITBfpgordg4AuycjzDFG6A==
X-Received: by 2002:a05:6000:178f:b0:3a4:da0e:5170 with SMTP id ffacd0b85a97d-3a551427ce2mr3020835f8f.27.1749558244654;
        Tue, 10 Jun 2025 05:24:04 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f2b:2750:8c03:51f7? ([2001:8b0:aba:5f3c:f2b:2750:8c03:51f7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244d10asm12365155f8f.67.2025.06.10.05.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:24:03 -0700 (PDT)
Message-ID: <68172307754c290abb2f0ea59aea4e161d55ccb2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH 2/9] bitbake.conf: set UNPACKDIR to just
 'sources' and not 'sources-unpack'
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Tue, 10 Jun 2025 13:24:03 +0100
In-Reply-To: <20250610094400.1653931-2-alex.kanavin@gmail.com>
References: <20250610094400.1653931-1-alex.kanavin@gmail.com>
	 <20250610094400.1653931-2-alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 12:24:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218349

On Tue, 2025-06-10 at 11:43 +0200, Alexander Kanavin via lists.openembedded=
.org wrote:
> From: Alexander Kanavin <alex@linutronix.de>
>=20
> This is shorter and doesn't include the unnecessary task name, just the
> result of it: source trees and files.
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
> =C2=A0meta/conf/bitbake.conf | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 4fa72b3d3ac..780de10ba35 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -407,7 +407,7 @@ STAMP =3D "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN=
}/${PV}"
> =C2=A0STAMPCLEAN =3D "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/*-*"
> =C2=A0BASE_WORKDIR ?=3D "${TMPDIR}/work"
> =C2=A0WORKDIR =3D "${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}/${PN}/${PV}"
> -UNPACKDIR ??=3D "${WORKDIR}/sources-unpack"
> +UNPACKDIR ??=3D "${WORKDIR}/sources"
> =C2=A0BB_GIT_DEFAULT_DESTSUFFIX =3D "${BP}"
> =C2=A0T =3D "${WORKDIR}/temp"
> =C2=A0D =3D "${WORKDIR}/image"

FWIW this was previously rejected due to confusion with the default for
DL_DIR often being "sources".

Cheers,

Richard


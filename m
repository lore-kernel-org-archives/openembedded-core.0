Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60005C0219D
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 13:42:50 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.50957.1739194965186272300
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Feb 2025 05:42:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Zdx3nwqn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38dc33931d3so1832597f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 05:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739194963; x=1739799763; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kq44o2WCUd8kdlOCSqJRi80P/ij5n40t0LDLP2ZHAr4=;
        b=Zdx3nwqnlJ28805DzIUiatbcmogegbj3cI4i4pJSk0U4tsSlddjpRNz72piL8GqDvP
         UX4ys4r/4zPw1fLaZz3s9p/WCff9R3tKpIM6iA8WMk1Pr1k5c29BMbqAQSEgNZxDy/O4
         1jyc+W9w1Af2IP9ylU6Vfh/qXVA9x2/30VMfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739194963; x=1739799763;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kq44o2WCUd8kdlOCSqJRi80P/ij5n40t0LDLP2ZHAr4=;
        b=QTATwh8vCR2cR/D3HRvFM6DB3vyqKmY7n6prgJmuDl/M9oy3MyKePVSghWIda2msEg
         ZqDfhXZWlp2Z0Q7Xyq385fCs2EECI6jhkcxRQEgaGSv6ht+SwR+IQ67NikGaBnaxt8v6
         475JyydMM6fyMaMhQXIaISO8V/RhR6rUETzFCeNF/4XWJjjbc3wiFO2nhhdmptwkjDOA
         C3oSBPTucH2ZmET92JqxRseHTlh/NRXTGIbM/MqRK2N9BVdIzB2F74fnWhELzwF58um2
         Szia4ldAzqwJv01nXuqVo+zSB4qSitRaa5S2I2DnnMKWe1/LQ01emUNM7H2xuJe7MnSi
         1S8g==
X-Forwarded-Encrypted: i=1; AJvYcCXMlResZlk1/KExRRC4RmYLv9CfRmkontqNKcqerzoYbGAeBzSvIGRga7pTbc9qC6sxacdZ3Gl14O41mhUbkdFpYg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwpI6H2rwoTXvGy9p+NpcEEa6kiq2RpsCwWZH0vdw6VWCiRGtOR
	y//THII4RsGX8BVNCyXLYlf31kvXlSzFAM2vtuprkPaaqkTDr4xwLstqEwphHsE=
X-Gm-Gg: ASbGncvuhM9yawGgm7vzJeG/BQ51wyRe/IgQgeb7jIOtw+eRDq5MtJrRew61WvloNSE
	qB2iD4zbmSqAeuhBeDkc231er6IhwBJ7LU/PkOo+tWsmiuLoYJNPV7nR0f/TGZ9TdzEVFg0WmrW
	1fQsV7SLA8TTwwdqPVmLjvHdSqA1/CpMY6Ma5J9etld78o6n3eioeYTdBXgG76Q/NpcZC6ublbk
	EzzPAfbmODj884OI7vUfBiN7MYZpJRuX/dDLpxUDxckQx7gpxjRO+btXVZTbOAv6I9a/KCDXx5l
	Tz6Mbf29qmOkyJ3ebghFbqgVwlKNi4AXDsQAOwviQYTczUlIsAjSh+A5Yyc6vweIilK3og0z8wK
	fAQ==
X-Google-Smtp-Source: AGHT+IHXIQCkPkjDNubwl/Ib5r9gRSCw3RHDZEStj8vbHOpxvL2J65/2uJq7YdIZXgj93GrMpX1UAg==
X-Received: by 2002:a5d:64eb:0:b0:38d:a69a:a132 with SMTP id ffacd0b85a97d-38dc90f1282mr8967979f8f.32.1739194963322;
        Mon, 10 Feb 2025 05:42:43 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d33a:26d6:1846:991? ([2001:8b0:aba:5f3c:d33a:26d6:1846:991])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc5e6f027sm10526111f8f.4.2025.02.10.05.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 05:42:42 -0800 (PST)
Message-ID: <3980bb85057c3c2402714d4c51676d628bf2ef52.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] classes/create-spdx-2.2: Fix SPDXDIR affecting
 multiconfig machines
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: pio.lobacz@gmail.com, openembedded-core@lists.openembedded.org, 
	JPEWhacker@gmail.com
Date: Mon, 10 Feb 2025 13:42:41 +0000
In-Reply-To: <20250210125047.2644290-1-pio.lobacz@gmail.com>
References: <20250210125047.2644290-1-pio.lobacz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 13:42:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211098

On Mon, 2025-02-10 at 13:50 +0100, Piotr =C5=81obacz via lists.openembedded=
.org wrote:
> Currently SPDXDIR is pointing to `${WORKDIR}/spdx` which means that the b=
y-id
> and by-namespace SPDX files are created without differentiation between m=
achines.
> This means that for two machines using a common package architecture
> (e.g. genericx86-64 and qqemux86-64), there would be overlapping files. T=
his means
> that the build of one can remove files from the other leading to build fa=
ilures. An
> example would be:
>=20
> MACHINE=3Dqemux86-64 bitbake core-image-minimal
> MACHINE=3Dgenericx86-64 bitbake core-image-minimal
> MACHINE=3Dqemux86-64 bitbake linux-yocto -c clean
> MACHINE=3Dgenericx86-64 bitbake core-image-minimal -C rootfs
>=20
> To fix this, add MACHINE_ARCH to the SPDXDIR path used for the files in o=
rder
> to differentiate packages' dependencies between machines.
>=20
> This commit fixes issue repored by Khem [1]
>=20
> [1] https://patchwork.yoctoproject.org/comment/13577/
>=20
> Signed-off-by: Piotr =C5=81obacz <pio.lobacz@gmail.com>
> ---
> =C2=A0meta/classes/create-spdx-2.2.bbclass | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-s=
pdx-2.2.bbclass
> index ade1a04be3..9e228891ab 100644
> --- a/meta/classes/create-spdx-2.2.bbclass
> +++ b/meta/classes/create-spdx-2.2.bbclass
> @@ -11,7 +11,7 @@ DEPLOY_DIR_SPDX ??=3D "${DEPLOY_DIR}/spdx"
> =C2=A0CVE_PRODUCT ??=3D "${BPN}"
> =C2=A0CVE_VERSION ??=3D "${PV}"
> =C2=A0
> -SPDXDIR ??=3D "${WORKDIR}/spdx"
> +SPDXDIR ??=3D "${WORKDIR}/spdx/${MACHINE_ARCH}"
> =C2=A0SPDXDEPLOY =3D "${SPDXDIR}/deploy"
> =C2=A0SPDXWORK =3D "${SPDXDIR}/work"
> =C2=A0SPDXIMAGEWORK =3D "${SPDXDIR}/image-work"

I suspect this is going to cause other challenges since the task stamp
isn't machine specific as far as I know but this change would require
it to be and force all of the SPDX tasks to be machine specific.

Cheers,

Richard


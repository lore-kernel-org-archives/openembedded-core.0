Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01754C28B2E
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 13:01:41 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.8287.1741698095397565933
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 06:01:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cxOTDAb0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43d0782d787so2945255e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 06:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1741698094; x=1742302894; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mmSThGeEeClp2XT8C1MsbJfvKxHTadzai53pYK6Dzq4=;
        b=cxOTDAb0Y0QDs6YMV4jDrjpra+/gAN0LSyPmR6woI2cmHhLZG7Gdc56BPC7eJmV3x8
         6wlfaSquzIV3JKGMOoyt3y10pziaAn6poU/ymBghjMrRsSc7FRYLPNWRqcrmN9MgEJd2
         eCKwCV+gcmpB9gtI6mhgcJYQNiZk3MxNaThAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741698094; x=1742302894;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mmSThGeEeClp2XT8C1MsbJfvKxHTadzai53pYK6Dzq4=;
        b=ulK1ck/nc2v4Lf5pC7wUG9BaJLx5qGIfnxt96oz94wiK/GRPoV3t4nXISgFoWhySrF
         1G9omcmKvLfxCq9Dd3HCaTP3WgD5KkNi2caVSOF3MxkZGORwMguN1CzcNOS+vdZQsIUg
         5i2cyXDdLat3JcEGsP3EGrRMbzc6KlhH2F/vREsPTCFfvwPCO00dPaFF165flwNnJgRu
         hb4jGpuYN/lGxO3ZFBySlTpPMOXZkHbe90soqYQrHSw7rApPcEbVrXxdRIa18Phn0eFC
         2YoM8d2y800L54jv8/2cVUc4VPa6URHsQA6V/qLrVbeFdTT3sUJWZUMsnsuXwa95a8us
         5a6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVYJToKwD19NgHOoF4Al7NzkLGGIvfNjQdkKgCl5DQLBCJBo4U31utJ6yauBydvz2Eh6rQ7k2RQVfdZEsLv9r0CzQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwQSAsZ3Y+i/CzG7zk+B2VuB43+Jkz4XtjipSzhDULQSmLZhSyo
	+ga89V8dySj9JxtLlqNIEazW6U01+PeE6lpfMZr4mvDlstQJZ579LYxGHDPgcTc=
X-Gm-Gg: ASbGncsKzwsBn+YjnTe8x0Bfmh/KdY1d3DF771Ai+qVv6/qu9RQAKd6RLwiqCrFSbXX
	sTUKg8MndDhMVrQkhlM4g2OWuFxPk/MqXIlnaDG+7ac6CXy9FIPb3Vg8dII+8QqCqgxE+u0KhXD
	OABEK1rZN65yqVaYfV51Wysar/EAHM9kNcUY0/oDmouB1BoBnHt0siexTH7y4UyL5LlRVlT3mHp
	BFBsGJCeDT2xJciawqHBuroToNyvj5jL33afcjUWKVhMGwVQ/fjDK1m0tz7iIU2vQ9mJkFSJ2Nx
	X03JWKUw5qjfInavJ7NUp2mBQ1JTrhbbEm/+1w4+oees66gu3HU+021ZVagK7fBwukZ9VHA9ZiM
	k55sVvVQzDHpuFrOFDay/vx/EXyqCE1Sq5QR1kg9JUw==
X-Google-Smtp-Source: AGHT+IFsOtqkmKeYHA5YQ2tPZ9tuxYC3CtT1OG9T5ftMHRKFWCfEGeVnndGqeuOkBUNQaJDhSh8aoA==
X-Received: by 2002:a05:600c:4e8e:b0:43d:83a:417d with SMTP id 5b1f17b1804b1-43d083a43ebmr7760715e9.12.1741698093305;
        Tue, 11 Mar 2025 06:01:33 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:98ce:619b:b74:b8c9? ([2001:8b0:aba:5f3c:98ce:619b:b74:b8c9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c01d2cdsm18309439f8f.57.2025.03.11.06.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 06:01:32 -0700 (PDT)
Message-ID: <76e6fb1b98cc7269d4290bb4e92d0adf2d3567d7.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] lib: spdx30_tasks: Handle patched CVEs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: JPEWhacker@gmail.com, openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>
Date: Tue, 11 Mar 2025 13:01:29 +0000
In-Reply-To: <20250306212007.44880-1-JPEWhacker@gmail.com>
References: <20250306212007.44880-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 13:01:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212567

On Thu, 2025-03-06 at 14:20 -0700, Joshua Watt via
lists.openembedded.org wrote:
> The code to iterate over patched CVEs (e.g. those patched by a .patch
> file in SRC_URI) was accidentally omitted when writing the SPDX 3
> handling. Add it in now
>=20
> [YOCTO #15789]
>=20
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
> =C2=A0meta/lib/oe/spdx30_tasks.py | 10 ++++++++++
> =C2=A01 file changed, 10 insertions(+)
>=20
> diff --git a/meta/lib/oe/spdx30_tasks.py
> b/meta/lib/oe/spdx30_tasks.py
> index e3e5dbc7427..e20bb0c86f3 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -498,6 +498,16 @@ def create_spdx(d):
> =C2=A0=C2=A0=C2=A0=C2=A0 # Add CVEs
> =C2=A0=C2=A0=C2=A0=C2=A0 cve_by_status =3D {}
> =C2=A0=C2=A0=C2=A0=C2=A0 if include_vex !=3D "none":
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for cve in oe.cve_check.get_p=
atched_cves(d):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spdx_=
cve =3D build_objset.new_cve_vuln(cve)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 build=
_objset.set_element_alias(spdx_cve)
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cve_b=
y_status.setdefault("Patched", {})[cve] =3D (
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 spdx_cve,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "patched",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 )
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for cve in d.getVarFlags=
("CVE_STATUS") or {}:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
decoded_status =3D oe.cve_check.decode_cve_status(d, cve)
> =C2=A0

I worry this has increased the build time by around 10 mins (~25%):

https://valkyrie.yocto.io/pub/non-release/20250311-54/testresults/buildperf=
-alma8/perf-alma8-vk_master_20250311090119_046a92d351.html

Cheers,

Richard




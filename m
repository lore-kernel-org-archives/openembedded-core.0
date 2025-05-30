Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C60B1C3ABB2
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 04:05:09 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web10.3399.1748577909475861035
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 21:05:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m5qL1QGm;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2e541e0b974so1159275fac.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 21:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748577909; x=1749182709; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SE8/6dtrvUE2tpjA+n0cZtkY9bjRwvxcYS/1YmAKgbo=;
        b=m5qL1QGme66OHaTGKhvcYFY6W2yKhzEAF/hTfIBN6UbmKkSkYyzwgZGhmPzLzy+y8L
         dAZDmhYHiEwh7x6+jOHBUOzV1oXTO/lY6Iv64IK8nJeFnDMowZAdk1cPlSRkT3k6qdHo
         AFnDp41o72oN5ixSET/VECHMXzZY9QG86kpQeAaBA54QdWX7rWLsMTdM7yYj77yR3mCA
         gLLiH5qvSRiEwTWlMec8oK+a5hHXE9e8WvP3hwo/tRefkVb1Ldl5WT3wGtjHShbS8xXj
         8LwV9gJ38nqdNVUUjZVZuy2r19aZqS/2r3BJZwofIyj2bKafuo3aIYizQPiUfd+k07in
         uQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748577909; x=1749182709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SE8/6dtrvUE2tpjA+n0cZtkY9bjRwvxcYS/1YmAKgbo=;
        b=HSxitSYjOQrxQPxBSj87Pqmdrjmj27NkyXr64GUhlQqKCpGY+0LBN+T38dvpW8tFI/
         rklgkEP1XH5Oh5eyCWglo3GtubjszCij8iNbC+u01HM7GedK0JU+SYsEVSB+Xr3jdDoh
         /dQXOhozfDLAY2fN/yumQTbJYUiMFo5eAOD4bYDQBRG5bizO8wNST0IONSrVuNFHQ6od
         1dC3Zo7hwesXIGwxT6HP9DW7VAQ4D/SBOZdWiNTT6+W+YDCSG0XVw08SqO+YYBl1maJI
         S8ZKBBlYJ40Uwhq/ez36H1AsXEJQuTvJTvYU9//SmQVQWek8cEr/h0bQrMfP3fhH1qcP
         T3tw==
X-Gm-Message-State: AOJu0YxjMtnvjwrVZ8y9lX+iA7B637Mm7t8tRusMIPYuoP/fLVwq6Xhy
	THnYtXWoZDJiblrIf9Xb67eLIDRjoEKZoRxXIqfrWKDKAgZ5j6xdPmz7+BfXGJ3ZFx8WiwOl3nq
	jMEQygijtvttHLIVJ8DLMEH3S8+Em1z4U4aOu
X-Gm-Gg: ASbGncu9K5pfNoNHYAbrqlskxKswGnEMW8TQ1G4LwEqL819IQvFQxffU4Wvujhts6aB
	BgYOEd8sfdjp2NzqPbZ0zGkSa9BmSj6b6+1fFIS92av4OiPGo9ChxnoWBZyDOL9TPdb5pc0+RA8
	bo7rhY09tzSmZYh4EkiTJt5qJRcOk/NKY=
X-Google-Smtp-Source: AGHT+IE1ZGyd+JjsRQBQPQ6MSp9v2Og5fMSM17TKQso5Ii8+H25BvlR/x+NziW+/iEgdg3YF5RPNaEFuSswPoFPDQeU=
X-Received: by 2002:a05:6871:3a0a:b0:2e8:f216:7b23 with SMTP id
 586e51a60fabf-2e9216849d2mr932097fac.37.1748577908651; Thu, 29 May 2025
 21:05:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250530032047.1369164-1-sandeep.gundlupet-raju@amd.com>
In-Reply-To: <20250530032047.1369164-1-sandeep.gundlupet-raju@amd.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 May 2025 21:04:42 -0700
X-Gm-Features: AX0GCFvMdZvTfxG-Zel3aud-KaU97YQMaJeKWePWT9QifIZv1FuDnUhQERaSRXY
Message-ID: <CAMKF1soCvnBtU1XzHudqNyayrt1qv824Y39pvW6ZY1H4rEie8g@mail.gmail.com>
Subject: Re: [OE-core][scarthgap,master][PATCH] tune-cortexr52: Add support
 for ARM Cortex-R52 32-bit
To: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
Cc: openembedded-core@lists.openembedded.org, jon.mason@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 04:05:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217463

LGTM

On Thu, May 29, 2025 at 8:20=E2=80=AFPM Sandeep Gundlupet Raju
<sandeep.gundlupet-raju@amd.com> wrote:
>
> Add tune variant for ARM Cortex-R52 32-bit in GCC as there is no
> support for Cortex-R52 32-bit toolchain.
>
> Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
> Signed-off-by: Sandeep Gundlupet Raju <grsandeep85@gmail.com>
> ---
>  meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc b/me=
ta/conf/machine/include/arm/armv8r/tune-cortexr52.inc
> index 89f0e09450..ba1c2ffa28 100644
> --- a/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc
> +++ b/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc
> @@ -18,3 +18,8 @@ AVAILTUNES                             +=3D "cortexr52h=
f"
>  ARMPKGARCH:tune-cortexr52hf             =3D "cortexr52"
>  TUNE_FEATURES:tune-cortexr52hf          =3D "${TUNE_FEATURES:tune-cortex=
r52} callconvention-hard"
>  PACKAGE_EXTRA_ARCHS:tune-cortexr52hf    =3D "cortexr52hf"
> +
> +AVAILTUNES                             +=3D "cortexr52-32"
> +ARMPKGARCH:tune-cortexr52-32            =3D "cortexr52"
> +TUNE_FEATURES:tune-cortexr52-32         =3D "${TUNE_FEATURES:tune-armv8r=
-crc-simd} cortexr52"
> +PACKAGE_EXTRA_ARCHS:tune-cortexr52-32   =3D "${PACKAGE_EXTRA_ARCHS:tune-=
armv8r-crc-simd} cortexr52 cortexr52-32"
> --
> 2.34.1
>


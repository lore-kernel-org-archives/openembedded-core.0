Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4855C3064D
	for <webhook@archiver.kernel.org>; Tue,  2 Jul 2024 14:08:39 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.25378.1719929315735837494
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jul 2024 07:08:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Np8385Ll;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52ce674da85so4594379e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jul 2024 07:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1719929314; x=1720534114; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K1H5ryrZcHOImB8QjWexZKtlJFuoz7alZN+97hdodho=;
        b=Np8385LlXMb1E5w6tRUk2WWpRMefLLkxifZI6eUBL2iqtN2GSDMcuSfKqYmntElkAn
         IwuKsYCPNo077pTK7n2gl+8RhYbrYSo5EZ1MdCmMJtm0igJFrU9eaududhKX+Pnbdn24
         lusRh3RA3qObQ0akfaEcTzAXgd3kDX0vOFcNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719929314; x=1720534114;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K1H5ryrZcHOImB8QjWexZKtlJFuoz7alZN+97hdodho=;
        b=fSd/DULZ5Tw7ATGZuN/mbtLiPs8BexbuKsynWWcTLMbBfdf6AEN7dctYBteUl4lfiU
         W3A2ZaQiXfJoDBDf/I6/gZqdPBzbMRXydjHsbMMOu8n+zyQN6N2NtgmgA+ILlyiakDl+
         mbYm5XVxX7GFhuURZ+2nTVCP3tQFCubEaF2ISTGPZZsj/ChXWd5dKxWjaiMdqNT5S/Et
         7WRAh0ZiH0/dcom1fkm5KTiSffdxTJQd6AZjsZBkGhzJRLjx+tweH9mmc5qkpAo+K5me
         md1VW2qbiKUbz/zpTgNsIVFaPP4dIn5Q2JLT9P7b2QrmHXPGvolOYjrg58zs6GNazG+V
         MMRg==
X-Forwarded-Encrypted: i=1; AJvYcCWavR+0RvAYd7YdrUcVEUC7Dr7t+Wy1VRZcuJRhsUYVKfukxZkv6FiwafgN8zC7G5B0/Xi9nnOTgS6dlmWPDVThDY92SMzdxUmxhY04+sPJ7AzH0ray4NS1
X-Gm-Message-State: AOJu0YwNLJH4C85mTbwue5TZBr81PSNLH6ardvWa4WbHIWYelB+gfw8q
	HH/5FYIhmTtB7wLpWSxy4uRiRfi23cyPmWNUyUpV9U2Hhr1E/Suw6fp0gyxv+HY=
X-Google-Smtp-Source: AGHT+IEswpvdlF+yieWTLAOsNOCRJHDDsL3vTEJbmlMwUuW/fiS3V7Wd4cRKvYr8N+bcW6vdBejKvA==
X-Received: by 2002:a05:6512:ea8:b0:52c:8e00:486a with SMTP id 2adb3069b0e04-52e82708fc9mr7025212e87.55.1719929311565;
        Tue, 02 Jul 2024 07:08:31 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e0e2:4d33:6557:e74f? ([2001:8b0:aba:5f3c:e0e2:4d33:6557:e74f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b0c0f1bsm196746935e9.44.2024.07.02.07.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 07:08:31 -0700 (PDT)
Message-ID: <ac3423d6ff2810eb2e5b80cd234801e34ae14bf7.camel@linuxfoundation.org>
Subject: Re: [OE-core][Patch v1] devicetree.bbclass: fix setting S
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: max.oss.09@gmail.com, openembedded-core@lists.openembedded.org
Cc: Andrey Zhizhikin <andrey.z@gmail.com>, Max Krummenacher
	 <max.krummenacher@toradex.com>
Date: Tue, 02 Jul 2024 15:08:30 +0100
In-Reply-To: <20240625183047.240309-1-max.oss.09@gmail.com>
References: <20240625183047.240309-1-max.oss.09@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jul 2024 14:08:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201427

On Tue, 2024-06-25 at 20:30 +0200, Max Krummenacher via
lists.openembedded.org wrote:
> From: Max Krummenacher <max.krummenacher@toradex.com>
>=20
> When a user of devicetree.bbclass overrides setting S, e.g. to
> git/overlays then having UNPACKDIR set to S results in that
> git repo unpacked inside UNPACKDIR. Thus the sources are actually
> in git/overlays/git/overlays rather than the expected git/overlays.
>=20
> Change the logic, so that S by default is set to UNPACKDIR,
> but a user can change S to point to were the sources actually
> will be.
>=20
> Fixes: 7a06069a041a ("devicetree.bbclass: switch away from S =3D
> WORKDIR")
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> ---
> =C2=A0meta/classes-recipe/devicetree.bbclass | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes-recipe/devicetree.bbclass b/meta/classes-
> recipe/devicetree.bbclass
> index 1806cb62cbf7..e5dbd9a85714 100644
> --- a/meta/classes-recipe/devicetree.bbclass
> +++ b/meta/classes-recipe/devicetree.bbclass
> @@ -40,8 +40,8 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> =C2=A0SYSROOT_DIRS +=3D "/boot/devicetree"
> =C2=A0FILES:${PN} =3D "/boot/devicetree/*.dtb /boot/devicetree/*.dtbo"
> =C2=A0
> -S =3D "${WORKDIR}/sources"
> -UNPACKDIR =3D "${S}"
> +UNPACKDIR =3D "${WORKDIR}/sources"
> +S =3D "${UNPACKDIR}"
> =C2=A0B =3D "${WORKDIR}/build"
> =C2=A0
> =C2=A0# Default kernel includes, these represent what are normally used
> for in-kernel

This doesn't seem to be the right thing to do to me. These settings are
really closely related to SRC_URI so I think they probably shouldn't be
in the class at all but in the recipes alongside SRC_URI?

Cheers,

Richard


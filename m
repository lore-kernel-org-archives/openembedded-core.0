Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6BFAC369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 10:37:23 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.11914.1745491029439349631
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 03:37:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Gyn23mA6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so5517665e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 03:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745491028; x=1746095828; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D9FIOHkjxOiY6UoO91Dmd9HEy92VY6/Dk9xZlJaBlQc=;
        b=Gyn23mA61pUHY2dM5d+vbW67wPhnYBtC9TLQqKkdIolawmATxm7XjDxzvdchx+9OGg
         wFBuvNAeehE7Ww/dP//Lykj2nXy+FaP9mu9uQhWvJurVdrsCoVzsclBpKsjO7m9nES5R
         kEXbLJcOATRuXzZ+KytJPDazgtj886Qgs3ZSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745491028; x=1746095828;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D9FIOHkjxOiY6UoO91Dmd9HEy92VY6/Dk9xZlJaBlQc=;
        b=cl/Mq8sb9B6c85YUhi2JhZwkfzlD7mEEK4zYWJK9kvXemZyvwNrWYiRe5sZyt+SMJj
         gdOMOXnJWJnMPSM70+jD/McZM4dCB4ODhZEczEBav2ZeRG4svzgY0gry6mSvJvp9oiON
         Bc8J95Eh2VhPSm3VBcAK8XA27IYwYycn+B4DILcDHTj1Wd4lL2zqXOzG2qrvPeZ/C9Mq
         vA7QcpX4aG47aoiGSbzcwrwUGTtbhNRc3Bw9y2m2shm7JehrzDObG30RsO0AM01WZpPY
         0DrTRQRFeH2YAzKCcXZqSKHCJglxiuYjVSYwW8Y6fwowytdkXop91XvHMLErHU0ImS30
         ingQ==
X-Forwarded-Encrypted: i=1; AJvYcCWds+KMxMIGh2h3nnQGaPjBEH4McqA0VNp49htsaNY6yhKK+QubQ8WJTrASpctg1lDAJsIKNBeLkRZYBRxat2grpA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyWTETRmIuaqyWizgZT+7tEQ5GcGzE1aNO38pY5+LU/NE61/K82
	vbjTvOntmecuGm3obGzyrDw6iCD4o6s73AgkDyry2aIvFuEaEjVGPb+J1+SeAwk=
X-Gm-Gg: ASbGncuATNM0BYkh5SDJGXwOo0bbb1wKuap3dLmFxJSicvT3ckSB2CsggTFNjRurfcg
	PoE+HaEejfTAYxrCpqc37PKp0HS4VtSetUSebPZwGYydnYVT7z304MVpCBQMG7dBRZ5JveadEIf
	+9Yzygp2eg/C7CuENMIrUy2EelEYFCoXvV0SRdWclntP93AlZkHPGmFPlZMZRVbo1VTFSz7FT9f
	ALEXbXZ6IymSp/bQCVnSJYI8qL/Jx93OkDgZlNoY1NHUk6s02A21eMdnSeWvCor/zqSqLpJJ9qy
	o1zwUkwt/056H9WY0q/DUS7d8/v/r65k+35RtUY0HgcjARKrR+IfiB3mzm7SN/Ghr+VkEUUmdax
	ACxws+t4X4ctfl4MMhnW3CgYRhG1Rag==
X-Google-Smtp-Source: AGHT+IHu9VPj6QsDPTEyu0EygwFw+08yFnr2RW47QbeGN2Pz2MKbpf1iij82l4b3AKJBS+y3mM5AcA==
X-Received: by 2002:a05:600c:208:b0:43b:bb72:1dce with SMTP id 5b1f17b1804b1-4409c460740mr15371335e9.5.1745491027630;
        Thu, 24 Apr 2025 03:37:07 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:94cb:8780:19ce:62be? ([2001:8b0:aba:5f3c:94cb:8780:19ce:62be])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2ac27dsm15546605e9.22.2025.04.24.03.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:37:06 -0700 (PDT)
Message-ID: <09ccfc3dc4a536d5712d360addadbe31556cc909.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4 1/9] poky-altcfg.conf: enable "efi" in
 DISTRO_FEATURES
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Date: Thu, 24 Apr 2025 11:37:06 +0100
In-Reply-To: <20250422143501.99565-2-mikko.rapeli@linaro.org>
References: <20250422143501.99565-1-mikko.rapeli@linaro.org>
	 <20250422143501.99565-2-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 10:37:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215351

On Tue, 2025-04-22 at 17:34 +0300, Mikko Rapeli via lists.openembedded.org =
wrote:
> oe-core machines like genericarm64 already enable "efi" in
> MACHINE_FEATURES but this does not enable systemd side
> "efi" support and thus systemd does not mount ESP
> partition for example.
>=20
> Enabling "efi" in systemd PACKAGECONFIG got negative comments
> in review. Also enabling systemd "efi" support via MACHINE_FEATURES
> was rejected. Thus enabling this as distro feature for "poky-altcfg".
>=20
> Many HW targets come with UEFI compatible firmware by default.
> For example u-boot enables UEFI support by default on all targets.
>=20
> This enables seeing UEFI firmware interfaces and data
> in userspace since "efivars" is now mounted by systemd
> to /sys/firmware/efi/efivars. Things like UEFI bootloader
> (grub, systemd-boot etc) selections and secure boot status
> can be queried from there.
>=20
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
> =C2=A0meta-poky/conf/distro/poky-altcfg.conf | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/meta-poky/conf/distro/poky-altcfg.conf b/meta-poky/conf/dist=
ro/poky-altcfg.conf
> index 3d64bdd1fe..e56c4f0a37 100644
> --- a/meta-poky/conf/distro/poky-altcfg.conf
> +++ b/meta-poky/conf/distro/poky-altcfg.conf
> @@ -14,4 +14,7 @@ POKY_INIT_MANAGER:poky-altcfg =3D "systemd"
> =C2=A0# systemd isn't suitable with musl
> =C2=A0POKY_INIT_MANAGER:poky-altcfg:libc-musl =3D "sysvinit"
> =C2=A0
> +# for systemd etc UEFI support
> +DISTRO_FEATURES:append =3D " efi"
> +
> =C2=A0require conf/distro/include/poky-distro-alt-test-config.inc

Having thought a bit about this, I think we should just add this by
default to nodistro. I'm trying to keep the delta between poky and
nodistro minimal if/where we can.

Cheers,

Richard


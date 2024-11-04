Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65EF7D132B5
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 11:31:52 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.55604.1730719902172778308
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Nov 2024 03:31:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YkB5EQV9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43158625112so35162355e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Nov 2024 03:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1730719900; x=1731324700; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I26FFIAF00rOeOn7ovgbBKTBGD176LqYUlhk+K46CxQ=;
        b=YkB5EQV9HVC8YHV0ZapwyXak/SZGL5TFfmkY9E+EFFqBqFqehAh4tWcBp+yG249lJP
         xXDIozacSivLHiuKDyLh8h7U7pflOxBbMZWSKDDaJQ+rczmD8RHBOK80c4gzmbpA0Kkm
         tkoxFgJWMR07lTqNGPgUGNZnA3hsJ0kdsd2yM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730719900; x=1731324700;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I26FFIAF00rOeOn7ovgbBKTBGD176LqYUlhk+K46CxQ=;
        b=uvHeCtg29ilI25a0jE99+8cYCax/dNrxrI0JNMK+L/1JdasFs/9dEy5VCrzFDi7iym
         TNI92knATqePXxQMzvFdqE6mggTyP7eheZEqMT8tkTfMqsbVWIr6m7sroffTfhukwLDJ
         40Blb4lTsusl6+av3g1kDZmO59RisDrTx2mImmdEpYE123bHO/79ZyePhBNjcw/E5lY3
         0hNGW7OifyMFj+ltpIiQHzulWA+Adibq77AER7br9tGv/sy8kjXLz0Bu6EY6Hx1Z+Cwz
         MQg0VIZ5jZ6ADApaTLLEtXqrsQHijEn7j/mBG4Qdf8jBFZvkNQRq5hGxZ/VpDUL3Co4Z
         YEZg==
X-Forwarded-Encrypted: i=1; AJvYcCXx3sEp8b8fpmuqbDdGPg135mrz8YYk5V2YosXOZAaKFa4Sq6nv7JBTb+COD1fRoZ/idkHnnuiNGN4WmOSzSDyWsQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzj8/wD4Bl6qw/UaT7TsDRF5LIQsK919gPofw1uvBd7NwMNLYiw
	pfXgh9OrAc1vogd7rA9BxT9d9SDeTejfpIsRTQw+/9LNXM7KjOg2ZRdmyNSMRLY=
X-Google-Smtp-Source: AGHT+IF7VrT8AWvRZAylLeCrxHkvW5EUTGm5KtFkJYoGKMeDz4l7lHDMal7gQddyL9wkeZysqUeC3g==
X-Received: by 2002:a05:600c:5493:b0:431:5533:8f0c with SMTP id 5b1f17b1804b1-43285649fe6mr94991045e9.29.1730719899946;
        Mon, 04 Nov 2024 03:31:39 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:ce35:7d7b:4b91:8e7d? ([2001:8b0:aba:5f3c:ce35:7d7b:4b91:8e7d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd9a99d3sm181756275e9.38.2024.11.04.03.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 03:31:39 -0800 (PST)
Message-ID: <2327725595e605a33a36a877a08c29fd668121cd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V4] rust-cross-canadian: Fix file conflicts
 for arm and aarch64
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Deepthi.Hemraj@windriver.com, openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com, 
	Sundeep.Kokkonda@windriver.com
Date: Mon, 04 Nov 2024 11:31:38 +0000
In-Reply-To: <20241104112128.1548308-1-Deepthi.Hemraj@windriver.com>
References: <20241104112128.1548308-1-Deepthi.Hemraj@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Nov 2024 11:31:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206678

On Mon, 2024-11-04 at 03:21 -0800, Hemraj, Deepthi via lists.openembedded.o=
rg wrote:
> From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
>=20
> [YOCTO #15061]
> Rust multilib sdks broken because of the conflicts between attempted inst=
alls of rust-cross-canadian for arm and aarch64.
>=20
> Arm and aarch64 target architectures are trying to install cargo.sh and r=
ust.sh in the same path which resulted in the issue
>=20
> The modification installs the scripts in different folders based on the t=
arget acrhitecture and hence prevents the conflicts.
>=20
> Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> ---
> =C2=A0meta/recipes-devtools/rust/rust-cross-canadian.inc | 6 +++---
> =C2=A01 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/re=
cipes-devtools/rust/rust-cross-canadian.inc
> index c34b839d15..81d46a45e0 100644
> --- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
> +++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
> @@ -52,8 +52,8 @@ do_install () {
> =C2=A0=C2=A0=C2=A0=C2=A0 chmod +x "$outfile"
> =C2=A0=C2=A0=C2=A0=C2=A0 create_sdk_wrapper "${SYS_BINDIR}/target-rust-cc=
ld-wrapper" "CC"
> =C2=A0
> -=C2=A0=C2=A0=C2=A0 ENV_SETUP_DIR=3D${D}${base_prefix}/environment-setup.=
d
> -=C2=A0=C2=A0=C2=A0 mkdir "${ENV_SETUP_DIR}"
> +=C2=A0=C2=A0=C2=A0 ENV_SETUP_DIR=3D${D}${base_prefix}/environment-setup.=
d/${TRANSLATED_TARGET_ARCH}
> +=C2=A0=C2=A0=C2=A0 mkdir -p "${ENV_SETUP_DIR}"
> =C2=A0=C2=A0=C2=A0=C2=A0 RUST_ENV_SETUP_SH=3D"${ENV_SETUP_DIR}/rust.sh"
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 RUST_TARGET_TRIPLE=3D`echo ${RUST_TARGET_SYS} | =
tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
> @@ -89,5 +89,5 @@ do_install () {
> =C2=A0	EOF
> =C2=A0}
> =C2=A0
> -FILES:${PN} +=3D "${base_prefix}/environment-setup.d"
> +FILES:${PN} +=3D "${base_prefix}/environment-setup.d/${TRANSLATED_TARGET=
_ARCH}"

This has the same issue as the original patch. Instead of renaming the
file, it is being placed in a different directory. This avoids
conflicts but means two scripts are still being installed in a given
environment.

I'm still not seeing an explaintion of which one should "win" in such
cases or how the selection is made.

As far as I can tell the patch "papers over" a build issue and creates
a runtime usage issue instead.

Cheers,

Richard






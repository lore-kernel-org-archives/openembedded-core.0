Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74899C5DF81
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 08:54:18 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2902.1787216053581324510
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 01:54:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Db3lbV/6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-499acf0fb55so11156035e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 01:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787216052; x=1787820852; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ApnIcMXowaVCE0O3MJUjw+3vGZwdXtviL2t8FPTu1+k=;
        b=Db3lbV/6rYODdDcBOnlaBMvlvc1WLR8G2uvroiNzrguCbcGpc+PTd1qgk3gOUsbi7p
         kWeHA1FG5PjkENTOxxW8+rwiqDmjihuBn1o/JGCNxVFIIbkELqG9hXuDhdWr53m5cxyt
         aI15K2LTCDCnoVEXpdZNp9/Px/IE83edA2mcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787216052; x=1787820852;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ApnIcMXowaVCE0O3MJUjw+3vGZwdXtviL2t8FPTu1+k=;
        b=UBtWiAF6SCg6PtwkfjOPQ/70zogddN26TDb1TqxuQk9+pzIwHi972xrgtGTXLXbyji
         NNbg/qdRSRKK6QfLNvrNmoYINmdwY+3E3YFjTqcCkzojX+W05O50Lp7UbB3yFEUl3E09
         anQ11udCfc/9Adj8yWId/q6hRYZOHz96ZPhMJCrmDe4LsjxA1Rxv5sdf9Usxxc/ByVso
         MCiidfHAsAYNqox0Q3dcPRSrnkcH281FV/gP617TIETzQea/Av7WSmrdC70pmIcXB1gF
         UL1xF925tPtljPWgbFQcWT079oRMt77A5NyDy/wVMwtlgJx/fTrxkGrY5RXwFb0ih19k
         9ZTw==
X-Forwarded-Encrypted: i=1; AHgh+RoIXopJoLzM9CoyECXJUpuYgEMJTU6MQoE09FhfOI+fkdtUxaTCd7tEWXRtZvWgWYLFF8QElj/OBL65d3eVpIH7Gg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw0OXB+j6ZjDmuPyAb5zBJYpdRpU6HbpDhCuUyioVGPp8cmDQxy
	OOftQapvwirLRPpskPDv9j92XjPYMOHdbZIjUCMfTPNdqyBf235//SorCD9qYWUZ9V7Ti7SpAAs
	eoRVD+2U=
X-Gm-Gg: AR+sD12sD4+W7F0BnilKZ5eqQfrSbJJMh2fZAFSg4Zpv+vg9J4zt+J7jO7I2fkRQn6S
	+Fh/arkADRr+Fi5dPIFGzhIPR8eEubOAwqFd/JgDLNPc+t1qlABRvoxTjWzyfMDm3k+tnFpcqKB
	Og7uEjgXe1pTnjETLzn+JZr0ATMM1AOaeDqM+HIb7ZTaYuEEWUDiAC7oVrP80j8BJQ0LPrjFxs9
	A22z49SEmsbPmpMLZO+fnAzIWKmO5iCVTQdLrPsnJHRAXjsRD2I4ayOESWm51KV0VtDs6pMJOm9
	zyd4NmkVz9qfJa7ZY5ou3pcL3cHoLiCwBFJoc2DlF4gsffl8gkKHbJJKT3W9MYOV1VqNWJfaoQU
	FjZy5ohUle6y0M56QAHZHJ3Z2PIb4tr6fPZtaRVyZqbZCbVJQo8XifkylBuP5EvQb+Id6blyq23
	0uIKitq22cvnXA3ekz9sD9ikwI6dlr1FXv1kCqijEBFIcTEDGptM/RoEFU9EhgtaAPOUp7kispK
	KdYYtroWlEMBDXFC1hjQtGhk6tnf6I90xEJd44IoDq+VadmOMJn6g==
X-Received: by 2002:a05:600c:34d1:b0:499:49f3:77b1 with SMTP id 5b1f17b1804b1-499aa14a6a6mr191747025e9.3.1787216051760;
        Thu, 20 Aug 2026 01:54:11 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9334:47ad:4624:539c? ([2001:8b0:aba:5f3c:9334:47ad:4624:539c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa09b199sm112558555e9.0.2026.08.20.01.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 01:54:10 -0700 (PDT)
Message-ID: <d489c96976fb770d0499ef325cedf7e085dcc775.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/3] rust-cross-canadian: install
 target-specific env scripts and fix rustlib lookup
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Date: Thu, 20 Aug 2026 09:54:09 +0100
In-Reply-To: <20260807093116.3680514-1-Harish.Sadineni@windriver.com>
References: <20260807093116.3680514-1-Harish.Sadineni@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 08:54:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243823

On Fri, 2026-08-07 at 02:31 -0700, Sadineni, Harish via lists.openembedded.=
org wrote:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>=20
> YOCTO [#15061]
>=20
> Fixes 32-bit Cargo build failures when using multilib-enabled SDKs.
>=20
> Store the generated environment setup script in a target-specific
> subdirectory so that sourcing the SDK environment always loads the
> matching script for the selected target, avoiding accidental reuse of
> the 64-bit configuration when building for a 32-bit target.
>=20
> Also update `CARGO_TARGET_<TRIPLE>_RUSTFLAGS` to add an explicit
> `-L` search path to the target `rustlib` directory inside the sysroot.
> This ensures Cargo can locate the correct target-specific Rust libraries
> during cross-compilation with the cross-canadian toolchain.
>=20
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
> =C2=A0meta/recipes-devtools/rust/rust-cross-canadian.inc | 10 ++++++----
> =C2=A01 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/re=
cipes-devtools/rust/rust-cross-canadian.inc
> index f083bcda82..bdc63e221f 100644
> --- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
> +++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
> @@ -51,15 +51,17 @@ do_install () {
> =C2=A0=C2=A0=C2=A0=C2=A0 chmod +x "$outfile"
> =C2=A0=C2=A0=C2=A0=C2=A0 create_sdk_wrapper "${SYS_BINDIR}/target-rust-cc=
ld-wrapper" "CC"
> =C2=A0
> -=C2=A0=C2=A0=C2=A0 ENV_SETUP_DIR=3D${D}${base_prefix}/environment-setup.=
d
> -=C2=A0=C2=A0=C2=A0 mkdir "${ENV_SETUP_DIR}"
> +=C2=A0=C2=A0=C2=A0 ENV_SETUP_DIR=3D${D}${base_prefix}/environment-setup.=
d/${TARGET_SYS}
> +=C2=A0=C2=A0=C2=A0 mkdir -p "${ENV_SETUP_DIR}"
> =C2=A0=C2=A0=C2=A0=C2=A0 RUST_ENV_SETUP_SH=3D"${ENV_SETUP_DIR}/${RUST_TAR=
GET_SYS}_rust.sh"
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 RUST_TARGET_TRIPLE=3D`echo ${RUST_TARGET_SYS} | =
tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 cat <<- EOF > "${RUST_ENV_SETUP_SH}"
> -	export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS=3D"--sysroot=3D\$OE=
CORE_TARGET_SYSROOT/usr -C link-arg=3D--sysroot=3D\$OECORE_TARGET_SYSROOT"
> -	export CARGO_BUILD_TARGET=3D"${RUST_TARGET_SYS}"
> +	export RUST_TARGET_SYS_VALUE=3D"${RUST_TARGET_SYS}"
> +	LIB_PATH=3D"\$OECORE_TARGET_SYSROOT/usr/${baselib}/rustlib/${RUST_TARGE=
T_SYS}/lib"
> +	export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS=3D"--sysroot=3D\$OE=
CORE_TARGET_SYSROOT/usr -C link-arg=3D--sysroot=3D\$OECORE_TARGET_SYSROOT -=
L \$LIB_PATH"
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 export CARGO_BUILD_TARGET=3D"=
${RUST_TARGET_SYS}"
> =C2=A0	export RUST_TARGET_PATH=3D"\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGE=
T_SYS}/rustlib"
> =C2=A0	EOF

I'm a bit confused here. The script in question already has
${RUST_TARGET_SYS} in its name, so it is already target specific. Why
do we need to move it to a target specific directory?

Cheers,

Richard



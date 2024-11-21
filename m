Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F36CD78795
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 16:45:59 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.3042.1732207556591261221
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 08:45:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fNlb1MJa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43152b79d25so9385825e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 08:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1732207555; x=1732812355; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MO+KKKlnnTsELPRj/3ypFsuRHN8UGZp/zdy16R9tthQ=;
        b=fNlb1MJaMNKvAtdTXULEiEw2WlW1rEeKpMsFEEoa2fJo5darwmmeWbdr3rhTtSUAJF
         NW+4QnOhOT8V9NQbGAGkG86X1xr7ZnErZCYk4qx3YymainyQMKHoSCGayS+m0WJC+io3
         o412j9ZPE0H1jggoTSfY8gBU/mFBeIR/NYmD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732207555; x=1732812355;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MO+KKKlnnTsELPRj/3ypFsuRHN8UGZp/zdy16R9tthQ=;
        b=tyPq62kmlHiIfnuozDVt2/OK+gxigYeAIJ5tWpOcMVgMArNaNbMB9uIqUcKNjzUB7j
         nu0cMwwL9Mudiej0fMlv6xHbal6cS65nBrmBM/kIIkWTB2g05VySrg/SWuw5osmoXVv8
         PUVA+gcXqE1CAN/NBBYKzCyP9a659GY5AIYoTHRZ4LLoLEcV363M1Sd7B5oRWjnOEv+U
         U12gppSccVGeIPljQJ2NyRNWmV7zBwqqdVe63/XgEm0GR/syUx2aR4daXNf7sdaf33D7
         AJP5Bo67Xt+8HZNj/Bo8I/NAJ28JaMK/Owk9TeTBxIqhzG50KtPdX94CIvVOp6Pulnam
         gdAw==
X-Forwarded-Encrypted: i=1; AJvYcCVhKF5pa/U7FZfXY/6KXBEh2o9QwSgo2qzosSV/V/7TEEdJ1FKtzSNUoHqrIiNanHrK372eDQfE7mAMg5fySJShCw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxb3bE2Feje8L9X7/qXtSJ4zfPRAnp+oNT1jD28yeVJyEF5u9Fn
	EaAKx5+Vh3A5WgWgHZm35uKlQeg8EKZzVPZt7Nn3ApTJtmC0F4Twtc9Lbp9CX5Q=
X-Gm-Gg: ASbGncv+SCVCSt1v85pLT1ivbBuSzxnqq9llrcFg1xKDhKGgm4tmHzKWwrGB6wA/7wg
	w8ZoqbTvELQgRTlbhvmiEesvjYc9qupMsOzoTTWOwsljlwr0iJUxk8amNzDsa9BpsR7CndEIvly
	Giy/DfGCGuPuuERSMx4CI/U4aP2dq+cJi96ovNEa46h1jszvn44pALCE+S5F883KoYhGjegtNys
	uqypApCvGc7dmfFhuT1jMrYCGYmrH0lQr1jvSQ3wjSPyoIkNbE9B0BuaVfI3dsvQcOJPB0hWmvw
	KO7vCS/RpkZD5lf75Bm6O0ps2b71nD0hlef5tPo=
X-Google-Smtp-Source: AGHT+IFT41UWnfqHmO2DWgnQSASiNB3cCqfI1x6rI92T4McTg3MtBafW7jKalic7ajKVU646stR8Rw==
X-Received: by 2002:a05:6000:2b0d:b0:382:6f2:df7a with SMTP id ffacd0b85a97d-38254afc6cfmr4287346f8f.34.1732207554686;
        Thu, 21 Nov 2024 08:45:54 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a4ee:c091:1f03:6404? ([2001:8b0:aba:5f3c:a4ee:c091:1f03:6404])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fb30590sm2373f8f.57.2024.11.21.08.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 08:45:54 -0800 (PST)
Message-ID: <8daadbbba54fb4cc3c026f0eb1a25785e076e11e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rust-cross-canadian: Fix environment setup
 script conflicts for multilibs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Deepthi.Hemraj@windriver.com, openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com, 
	Sundeep.Kokkonda@windriver.com
Date: Thu, 21 Nov 2024 16:45:52 +0000
In-Reply-To: <20241121143418.3142224-1-Deepthi.Hemraj@windriver.com>
References: <20241121143418.3142224-1-Deepthi.Hemraj@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 16:45:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207550

Hi Deepthi,

Thanks for working through this. This is the right direction but there
are still some issues.

On Thu, 2024-11-21 at 06:34 -0800, Hemraj, Deepthi via lists.openembedded.o=
rg wrote:
> From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
>=20
> YOCTO [#15061]
> Rust multilib sdks broken because of the conflicts between attempted
> installs of rust-cross-canadian for arm and aarch64.
>=20
> Multilibs trying to install cargo.sh
> and rust.sh in the same path which resulted in the issue
>=20
> This patch implements architecture specific environment setup scripts
> using RUST_TARGET_SYS to create unique filenames.
> The changes ensure that these scripts do not overwrite each other.
> Additionally, all target-independent variables previously defined in the
> rust and cargo scripts have been moved to their respective nativesdk reci=
pe files
>=20
> Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> ---
> =C2=A0meta/recipes-devtools/rust/cargo_1.80.0.bb=C2=A0=C2=A0=C2=A0 | 24 +=
++++++++++++++++++
> =C2=A0.../rust/rust-cross-canadian.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 24 ++++---------------
> =C2=A0meta/recipes-devtools/rust/rust_1.80.0.bb=C2=A0=C2=A0=C2=A0=C2=A0 |=
 14 +++++++++++
> =C2=A03 files changed, 43 insertions(+), 19 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/rust/cargo_1.80.0.bb b/meta/recipes-de=
vtools/rust/cargo_1.80.0.bb
> index 123032cdf7..2246ce2534 100644
> --- a/meta/recipes-devtools/rust/cargo_1.80.0.bb
> +++ b/meta/recipes-devtools/rust/cargo_1.80.0.bb
> @@ -50,7 +50,31 @@ do_install:append:class-nativesdk() {
> =C2=A0	# sets to libdir but not base_libdir leading to symbol mismatches =
depending on the
> =C2=A0	# host OS. Fully set LD_LIBRARY_PATH to contain both to avoid this=
.
> =C2=A0	create_wrapper ${D}/${bindir}/cargo LD_LIBRARY_PATH=3D${libdir}:${=
base_libdir}
> +
> +=C2=A0=C2=A0=C2=A0 ENV_SETUP_DIR=3D${D}${base_prefix}/environment-setup.=
d
> +=C2=A0=C2=A0=C2=A0 mkdir "${ENV_SETUP_DIR}"
> +=C2=A0=C2=A0=C2=A0 CARGO_ENV_SETUP_SH=3D"${ENV_SETUP_DIR}/${RUST_TARGET_=
SYS}_cargo.sh"

This should just be called cargo.sh, with no "${RUST_TARGET_SYS}_"
prefix?

> +=C2=A0=C2=A0=C2=A0=20
> +=C2=A0=C2=A0=C2=A0 RUST_HOST_TRIPLE=3D`echo ${RUST_HOST_SYS} | tr '[:low=
er:]' '[:upper:]' | sed 's/-/_/g'`
> +=C2=A0=C2=A0=C2=A0=20
> +=C2=A0=C2=A0=C2=A0 cat <<- EOF > "${CARGO_ENV_SETUP_SH}"
> +	export CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER=3D"\$OECORE_NATIVE_SYSRO=
OT/lib/${SDKLOADER}"
> +	export CARGO_HOME=3D"\$OECORE_TARGET_SYSROOT/home/cargo"
> +	mkdir -p "\$CARGO_HOME"
> +	if ! grep -q '^\[build\]' "\$CARGO_HOME/config"; then
> +		touch "\$CARGO_HOME/config"
> +		echo "[build]" >> "\$CARGO_HOME/config"
> +		echo 'linker =3D "target-rust-ccld"' >> "\$CARGO_HOME/config"
> +=C2=A0=C2=A0=C2=A0 fi
> +=09
> +=09
> +	# Keep the below off as long as HTTP/2 is disabled.
> +	export CARGO_HTTP_MULTIPLEXING=3Dfalse
> +	export CARGO_HTTP_CAINFO=3D"\$OECORE_NATIVE_SYSROOT/etc/ssl/certs/ca-ce=
rtificates.crt"
> +	EOF
> +
> =C2=A0}
> +FILES:${PN} +=3D "${base_prefix}/environment-setup.d"

I'd suggest in the interests of getting some parts of this merged, this
cargo change be separated out from the rest of the change (removing
just these bits from rust-cross-canadian and adding as above). We can
then handle the other pieces in a second patch.
> =C2=A0
> =C2=A0# Disabled due to incompatibility with libgit2 0.28.x (https://gith=
ub.com/rust-lang/git2-rs/issues/458, https://bugs.gentoo.org/707746#c1)
> =C2=A0# as shipped by Yocto Dunfell.
> diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/re=
cipes-devtools/rust/rust-cross-canadian.inc
> index c34b839d15..1ef14e5e6d 100644
> --- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
> +++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
> @@ -54,39 +54,25 @@ do_install () {
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 ENV_SETUP_DIR=3D${D}${base_prefix}/environment-s=
etup.d
> =C2=A0=C2=A0=C2=A0=C2=A0 mkdir "${ENV_SETUP_DIR}"
> -=C2=A0=C2=A0=C2=A0 RUST_ENV_SETUP_SH=3D"${ENV_SETUP_DIR}/rust.sh"
> +=C2=A0=C2=A0=C2=A0 RUST_ENV_SETUP_SH=3D"${ENV_SETUP_DIR}/${RUST_TARGET_S=
YS}_rust.sh"
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 RUST_TARGET_TRIPLE=3D`echo ${RUST_TARGET_SYS} | =
tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
> -=C2=A0=C2=A0=C2=A0 RUST_HOST_TRIPLE=3D`echo ${RUST_HOST_SYS} | tr '[:low=
er:]' '[:upper:]' | sed 's/-/_/g'`
> =C2=A0=C2=A0=C2=A0=C2=A0 SDKLOADER=3D${@bb.utils.contains('SDK_ARCH', 'x8=
6_64', 'ld-linux-x86-64.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'i68=
6', 'ld-linux.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'aarch64', 'ld=
-linux-aarch64.so.1', '', d)}${@bb.utils.contains('SDK_ARCH', 'ppc64le', 'l=
d64.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'riscv64', 'ld-linux-ris=
cv64-lp64d.so.1', '', d)}
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 cat <<- EOF > "${RUST_ENV_SETUP_SH}"
> =C2=A0	export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS=3D"--sysroot=
=3D\$OECORE_TARGET_SYSROOT/usr -C link-arg=3D--sysroot=3D\$OECORE_TARGET_SY=
SROOT"
> -	export CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER=3D"\$OECORE_NATIVE_SYSRO=
OT/lib/${SDKLOADER}"
> -	export RUST_TARGET_PATH=3D"\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS=
}/rustlib"
> -	EOF
> -
> -=C2=A0=C2=A0=C2=A0 chown -R root.root ${D}
> -
> -=C2=A0=C2=A0=C2=A0 CARGO_ENV_SETUP_SH=3D"${ENV_SETUP_DIR}/cargo.sh"
> -=C2=A0=C2=A0=C2=A0 cat <<- EOF > "${CARGO_ENV_SETUP_SH}"
> =C2=A0	export CARGO_HOME=3D"\$OECORE_TARGET_SYSROOT/home/cargo"
> =C2=A0	mkdir -p "\$CARGO_HOME"
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Init the default target onc=
e, it might be otherwise user modified.
> -	if [ ! -f "\$CARGO_HOME/config" ]; then
> -		touch "\$CARGO_HOME/config"
> -		echo "[build]" >> "\$CARGO_HOME/config"
> +	if ! grep -q '^\[target\.' "\$CARGO_HOME/config"; then

This needs to search for the item with RUST_TARGET_SYS included.

> =C2=A0		echo 'target =3D "'${RUST_TARGET_SYS}'"' >> "\$CARGO_HOME/config"
> =C2=A0		echo '# TARGET_SYS' >> "\$CARGO_HOME/config"
> =C2=A0		echo '[target.'${RUST_TARGET_SYS}']' >> "\$CARGO_HOME/config"
> -		echo 'linker =3D "target-rust-ccld"' >> "\$CARGO_HOME/config"
> =C2=A0=C2=A0=C2=A0=C2=A0 fi
> =C2=A0
> -	# Keep the below off as long as HTTP/2 is disabled.
> -	export CARGO_HTTP_MULTIPLEXING=3Dfalse
> -
> -	export CARGO_HTTP_CAINFO=3D"\$OECORE_NATIVE_SYSROOT/etc/ssl/certs/ca-ce=
rtificates.crt"
> =C2=A0	EOF
> +
> +=C2=A0=C2=A0=C2=A0 chown -R root.root ${D}
> +
> =C2=A0}
> =C2=A0
> =C2=A0FILES:${PN} +=3D "${base_prefix}/environment-setup.d"
> diff --git a/meta/recipes-devtools/rust/rust_1.80.0.bb b/meta/recipes-dev=
tools/rust/rust_1.80.0.bb
> index eae1f28bb8..8a8aad5a8d 100644
> --- a/meta/recipes-devtools/rust/rust_1.80.0.bb
> +++ b/meta/recipes-devtools/rust/rust_1.80.0.bb
> @@ -271,8 +271,22 @@ rust_do_install:class-nativesdk() {
> =C2=A0=C2=A0=C2=A0=C2=A0 rm ${D}${libdir}/rustlib/uninstall.sh
> =C2=A0=C2=A0=C2=A0=C2=A0 rm ${D}${libdir}/rustlib/install.log
> =C2=A0=C2=A0=C2=A0=C2=A0 rm ${D}${libdir}/rustlib/manifest*
> +
> +=C2=A0=C2=A0=C2=A0 ENV_SETUP_DIR=3D${D}${base_prefix}/environment-setup.=
d
> +=C2=A0=C2=A0=C2=A0 mkdir "${ENV_SETUP_DIR}"
> +=C2=A0=C2=A0=C2=A0 RUST_ENV_SETUP_SH=3D"${ENV_SETUP_DIR}/${RUST_TARGET_S=
YS}_rust.sh"
> +
> +=C2=A0=C2=A0=C2=A0 cat <<- EOF > "${RUST_ENV_SETUP_SH}"
> +	export RUST_TARGET_PATH=3D"\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS=
}/rustlib"

I think this may need to append to RUST_TARGET_PATH, i.e.:

export RUST_TARGET_PATH=3D"${RUST_TARGET_PATH}:\$OECORE_NATIVE_SYSROOT/usr/=
lib/${TARGET_SYS}/rustlib"

but I'm unsure how rust is using this or if than makes sense...

Cheers,

Richard


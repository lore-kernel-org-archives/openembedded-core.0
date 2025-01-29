Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EBBFC02192
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 09:06:05 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.8690.1738141561638046241
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 01:06:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fp7PGYbb;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6d8e8445219so57220526d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 01:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738141560; x=1738746360; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SDR59lLoVGb+CqWA7zr14odhf6iBwxCdSyo0FyyWXNw=;
        b=Fp7PGYbbm4oVk4yh2jRbhlq+1J/SCIBI7TPAW9kEjLv9NcNkdjaIk0gDwuPY6x+JcL
         3nBIVLdP1nxl6+J1AnnsQ9uMSyij+kruxkXrZ2P2SeE1A7vFqxDJylamEHluXIZK5lcR
         vwW8dxQs52yUBo23CgyF1/w2S76hUm0OBs6CYBHrqTGDyNmjKglXQZoni7Uy9tzS1C3Y
         l1hoIsTQFb8B0suKxujIoEaO3p2rh6GjdU0B08Uw6UbCdAU6uqRWdknvdaFqBs6Ra7R/
         9IW4mjciMitkkn/ghNsKxZfn04xNzcitASaQW5woyXPaP7uq7/8JkiMT23yj3f/3iJ2V
         jY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738141560; x=1738746360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SDR59lLoVGb+CqWA7zr14odhf6iBwxCdSyo0FyyWXNw=;
        b=M4RBNuBD9y3S0dYh8nOA9MJFSL0KRv+jIhCYd9p5JH1KA7EIUeQr4z6wxm0kWenL66
         Oi5+uYsjS+1T0GX2yyjcvlZpNYfLd5mDRrjnnKZ5UOzXUtH5AU91e6OKfwOR0zm5flDm
         h0tvcXcovhbiwkJWYvgwtfvkDi+utiyjkmujv4pGcY5hrLQgitO9ftMGp++HfQYjJaCt
         cFprijXe6qGOUoJyGwqVZs5BXSj7g6OqMnsXSjpdbMc+szQ/1cdZ9nu5ycQDF2EparQY
         QWkviLBLIJwKRyU6UAKibYMEha38VUipKsTTipiBqCM8iHRr43itGKL4n26EXs9enZi4
         OUGQ==
X-Gm-Message-State: AOJu0YwkqRgPf16Ixu6C9PAlVaE8Nheh4x7AqDIg74f3mI4tphKnfeL0
	NkLpHmgb+BBL88VJn2oBmRpTsdy02MBGgiXSH9I1UOqdtZF3YlVnXKjkJ/+WVvGe9LKLbH+C4DS
	T8eyXzcWIxPZXPXNAIYcVQBwDg9E=
X-Gm-Gg: ASbGncu5FOZpNCvHjUEO6lGqJY3Mnktx3JkmiEyCXQZcVLZdMNZKOSI14g//vPCfpyN
	Z3EcbACijucu5tKLyST1P5EIsp+TxKj5mv0Y1J9VBoMTiENYnSnqy4KJCwzW3apJiXI8USq1zDt
	x86NS7p6pKceGsJNcRTvVhjdAf2syKN34=
X-Google-Smtp-Source: AGHT+IEQ+QLVjkR8SfEfh3JBbNYldrNl2OVVPl2abl9w3ogYiLmIpixGiI/94bEPEBUJ1ygDlxbROPmlpQkxzbYS2/I=
X-Received: by 2002:a05:6214:1944:b0:6d8:8874:2131 with SMTP id
 6a1803df08f44-6e243bbc1a2mr33320416d6.13.1738141560642; Wed, 29 Jan 2025
 01:06:00 -0800 (PST)
MIME-Version: 1.0
References: <20250129080902.1863054-1-zboszor@gmail.com> <20250129080902.1863054-2-zboszor@gmail.com>
In-Reply-To: <20250129080902.1863054-2-zboszor@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 29 Jan 2025 10:05:49 +0100
X-Gm-Features: AWEUYZnfWuJLqNSGvqmOflv0u8yh3zmqQLUwSbjXiMbdpHpVKQZelt7g62YATc0
Message-ID: <CANNYZj-pUVu_vp7DERcSF__LcRWi3oA4hocfEqfKPW_KxmrGZg@mail.gmail.com>
Subject: Re: [OE-core][PATCH 2/3] rpm-sequoia: New recipe for version 1.6.0
To: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 09:06:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210354

On Wed, 29 Jan 2025 at 09:09, Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zbosz=
or@gmail.com> wrote:
> +Subject: [PATCH 1/2] Make openssl the default signing crypto
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Idea taken from the Fedora 41 rpm specfile, extended to build.rs
> +to make it actually build. Give credit where credit is due: the
> +Cargo.toml part of this patch is identical to the Fedora version.
> +
> +Signed-off-by: Fabio Valentini <decathorpe@gmail.com>
> +Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com=
>
> +Upstream-Status: Inappropriate [Yocto specific]
> +---
> + Cargo.toml | 5 +----
> + build.rs   | 8 +-------
> + 2 files changed, 2 insertions(+), 11 deletions(-)
> +
> +diff --git a/Cargo.toml b/Cargo.toml
> +index 7832878..1024cad 100644
> +--- a/Cargo.toml
> ++++ b/Cargo.toml
> +@@ -43,11 +43,8 @@ crate-type =3D ["cdylib"]
> +
> + # We explicitly do not want to enable Sequoia's decompression support.
> + # Hence we only select a crypto backend.
> +-default =3D ["crypto-nettle"]
> ++default =3D ["crypto-openssl"]
> + crypto-nettle =3D ["sequoia-openpgp/crypto-nettle"]
> + crypto-rust =3D ["sequoia-openpgp/crypto-rust"]
> +-crypto-cng =3D ["sequoia-openpgp/crypto-cng"]
> + crypto-openssl =3D ["sequoia-openpgp/crypto-openssl"]
> +-crypto-botan =3D ["sequoia-openpgp/crypto-botan"]
> +-crypto-botan2 =3D ["sequoia-openpgp/crypto-botan2"]
> +
> +diff --git a/build.rs b/build.rs
> +index 1fdef4e..cdbbe88 100644
> +--- a/build.rs
> ++++ b/build.rs
> +@@ -30,16 +30,10 @@ impl PkgConfigTemplate {
> +             ("VERSION".to_string(), env!("CARGO_PKG_VERSION").to_string=
()),
> +             ("HOMEPAGE".to_string(), env!("CARGO_PKG_HOMEPAGE").to_stri=
ng()),
> +             ("REQUIRES".to_string(),
> +-             if cfg!(feature =3D "crypto-botan") {
> +-                 "botan-3"
> +-             } else if cfg!(feature =3D "crypto-botan2") {
> +-                 "botan-2"
> +-             } else if cfg!(feature =3D "crypto-nettle") {
> ++             if cfg!(feature =3D "crypto-nettle") {
> +                  "nettle"
> +              } else if cfg!(feature =3D "crypto-openssl") {
> +                  "libssl"
> +-             } else if cfg!(feature =3D "crypto-cng") {
> +-                 ""
> +              } else if cfg!(feature =3D "crypto-rust") {
> +                  ""
> +              } else {

I don't understand. It seems like this changes the default crypto
choice, but why not simply pass openssl selection as a parameter from
the recipe?

> + Cargo.lock | 1049 +++++++++++++++++++++++++++++++---------------------

If this is updated correctly, then the change to cargo class in
another patch should not be necessary.

Also, this file is going to be a royal pain to keep updated with
sequoia version updates. Another reason not to patch rust sources when
it can be avoided.



> +++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.6.0.bb
> @@ -0,0 +1,40 @@
> +SUMMARY =3D "An OpenPGP backend for rpm using Sequoia PGP"
> +HOMEPAGE =3D "https://sequoia-pgp.org/"
> +LICENSE =3D "LGPL-2.0-or-later & Apache-2.0 & BSL-1.0 & MIT & Unicode-DF=
S-2016 & (Apache-2.0 | MIT) & (MIT | Apache-2.0 | Zlib) & (Unlicense | MIT)=
"

This is very elaborate, how was it determined? How to ensure it remains cor=
rect?

> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Df0ff5ff7747cf7d394079c6ae=
87f5f0c"
> +
> +DEPENDS =3D "openssl"
> +
> +inherit pkgconfig rust cargo cargo-update-recipe-crates
> +
> +CARGO_USE_OFFLINE_FLAG =3D "1"

As explained above, this should not be needed if Cargo.lock is correct.

> +export CARGO_PROFILE_RELEASE_BUILD_OVERRIDE_DEBUG =3D "true"

Why? Things like this need a comment in the recipe.

> +do_compile:prepend () {
> +       mkdir -p ${S}/target/release
> +}

Why?

> +do_install () {
> +       mkdir -p ${D}${libdir}
> +       install -m0755 ${B}/target/${RUST_TARGET_SYS}/release/librpm_sequ=
oia.so ${D}${libdir}/librpm_sequoia.so.1
> +       ln -s librpm_sequoia.so.1 ${D}${libdir}/librpm_sequoia.so
> +
> +       mkdir -p ${D}${libdir}/pkgconfig
> +       install -m644 ${S}/target/release/rpm-sequoia.pc ${D}${libdir}/pk=
gconfig
> +}

Why can't we use upstream's standard install procedure? Also,
cargo.bbclass has an install function, why is it completely replaced?

Alex


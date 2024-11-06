Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B1F2D59F5D
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 18:14:38 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.52947.1730916877265711482
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 10:14:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R0JW+X9z;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-37d447de11dso21428f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 10:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1730916876; x=1731521676; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GyFfgUdU+r+tfuUtB7kucroUAsS5F1A+wcIlximAr+s=;
        b=R0JW+X9zsGndTpnKzqi/4rZBXnS9JDvztBnOLj3t4fAi5M/r/dBojhIHVMQsR47YF2
         rxplZqWSRQtWT9Egw2PuUfpj6c9hC5OMs6puzcIzSZj60RrM2cpgjco3+T9iiExj4ThM
         AqG2f4iT6E7Gb3IC3C/1ofgW3I7JrI30ix7ps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730916876; x=1731521676;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GyFfgUdU+r+tfuUtB7kucroUAsS5F1A+wcIlximAr+s=;
        b=RC4spkbx4NKXH9DwQYxunqnkM4RRG40e4M95wSNbjm1hml1BzcyUnViBWRaTJnV2Gl
         dZ34WqZvjveZqTIu1WckplXJ5x0wF1pU4XBu7v8LaFgxO2BJ54VtPaWf+w8Q5Bm90Rgu
         dr5kNtxFfYjgr8hXGi6wyNlCGPCNHx+v72yB4h1fz/MGXVHEN3savFk+9fFa7RLe4j5L
         PeWvbP3kWi1INX/UB3i57bjQ9CBmEn5r30EaMSAP94AP84WZjbRpdc6gpa7KlxY8dBZq
         8NVMS2BsvXV8V4OeiFeaQuAPvrz+l8eDW1IbRuJx56jGZYbMF3wnHYRw8VOr08qe3Ww0
         RoeA==
X-Forwarded-Encrypted: i=1; AJvYcCXPr8MpvBfIjXlcppOLG0OmH7gDho2TrhNrT/kYJVYSYuYDIO3uXukcEqTUzycknA7/z3AChcN/4vArKydVkxgPyw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzl0+61JQXEeI2zPMgrtusYTJxmL13Ve8BUu48n4tg+2CM2v9Q0
	IMusLZyGkJbFb82u+oDcggEyL5yTKN+PuRz3EcaKBItWGNxbuKRtPYTVB6aFDvM=
X-Google-Smtp-Source: AGHT+IFIfBWUCQw8sSiqhNPRMIEI1bwISfPsbvIwjNNSQey2Q1Dx8ZKpiwmjdUjowho1aZqajVxfXg==
X-Received: by 2002:a05:6000:2cf:b0:37d:47f9:be8a with SMTP id ffacd0b85a97d-381be577f72mr20930536f8f.0.1730916875403;
        Wed, 06 Nov 2024 10:14:35 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:5f26:5175:55ad:9264? ([2001:8b0:aba:5f3c:5f26:5175:55ad:9264])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10d4b82sm19889167f8f.43.2024.11.06.10.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 10:14:35 -0800 (PST)
Message-ID: <2bf14f44516899c3de8b6f95eec9ff7c2f6b5ca3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V4] rust-cross-canadian: Fix file conflicts
 for arm and aarch64
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Deepthi.Hemraj@windriver.com, openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com, 
	Sundeep.Kokkonda@windriver.com
Date: Wed, 06 Nov 2024 18:14:34 +0000
In-Reply-To: <20241104112128.1548308-1-Deepthi.Hemraj@windriver.com>
References: <20241104112128.1548308-1-Deepthi.Hemraj@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 18:14:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206797

On Mon, 2024-11-04 at 03:21 -0800, Hemraj, Deepthi via
lists.openembedded.org wrote:
> From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
>=20
> [YOCTO #15061]
> Rust multilib sdks broken because of the conflicts between attempted
> installs of rust-cross-canadian for arm and aarch64.
>=20
> Arm and aarch64 target architectures are trying to install cargo.sh
> and rust.sh in the same path which resulted in the issue
>=20
> The modification installs the scripts in different folders based on
> the target acrhitecture and hence prevents the conflicts.
>=20
> Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> ---
> =C2=A0meta/recipes-devtools/rust/rust-cross-canadian.inc | 6 +++---
> =C2=A01 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc
> b/meta/recipes-devtools/rust/rust-cross-canadian.inc
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
> +=C2=A0=C2=A0=C2=A0 ENV_SETUP_DIR=3D${D}${base_prefix}/environment-
> setup.d/${TRANSLATED_TARGET_ARCH}
> +=C2=A0=C2=A0=C2=A0 mkdir -p "${ENV_SETUP_DIR}"
> =C2=A0=C2=A0=C2=A0=C2=A0 RUST_ENV_SETUP_SH=3D"${ENV_SETUP_DIR}/rust.sh"
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 RUST_TARGET_TRIPLE=3D`echo ${RUST_TARGET_SYS} | =
tr '[:lower:]'
> '[:upper:]' | sed 's/-/_/g'`
> @@ -89,5 +89,5 @@ do_install () {
> =C2=A0	EOF
> =C2=A0}
> =C2=A0
> -FILES:${PN} +=3D "${base_prefix}/environment-setup.d"
> +FILES:${PN} +=3D "${base_prefix}/environment-
> setup.d/${TRANSLATED_TARGET_ARCH}"

I was asked for more information about how to solve this problem. It
isn't something I can easily just answer, I need to go and look at
exactly what is going on.

In a qemux86-64 multilib build, looking at:

rust-cross-canadian-i686/1.79.0/image/usr/local/oe-sdk-hardcoded-buildpath/=
sysroots/x86_64-pokysdk-linux/environment-setup.d/cargo.sh=20

we have:

"""
export CARGO_HOME=3D"$OECORE_TARGET_SYSROOT/home/cargo"
mkdir -p "$CARGO_HOME"
        # Init the default target once, it might be otherwise user modified=
.
if [ ! -f "$CARGO_HOME/config" ]; then
touch "$CARGO_HOME/config"
echo "[build]" >> "$CARGO_HOME/config"
echo 'target =3D "'i686-pokymllib32-linux-gnu'"' >> "$CARGO_HOME/config"
echo '# TARGET_SYS' >> "$CARGO_HOME/config"
echo '[target.'i686-pokymllib32-linux-gnu']' >> "$CARGO_HOME/config"
echo 'linker =3D "target-rust-ccld"' >> "$CARGO_HOME/config"
    fi

# Keep the below off as long as HTTP/2 is disabled.
export CARGO_HTTP_MULTIPLEXING=3Dfalse

export CARGO_HTTP_CAINFO=3D"$OECORE_NATIVE_SYSROOT/etc/ssl/certs/ca-certifi=
cates.crt"
"""

and then at:

rust-cross-canadian-x86-64/1.79.0/image/usr/local/oe-sdk-hardcoded-buildpat=
h/sysroots/x86_64-pokysdk-linux/environment-setup.d/cargo.sh=20

we have:

"""
export CARGO_HOME=3D"$OECORE_TARGET_SYSROOT/home/cargo"
mkdir -p "$CARGO_HOME"
        # Init the default target once, it might be otherwise user modified=
.
if [ ! -f "$CARGO_HOME/config" ]; then
touch "$CARGO_HOME/config"
echo "[build]" >> "$CARGO_HOME/config"
echo 'target =3D "'x86_64-poky-linux-gnu'"' >> "$CARGO_HOME/config"
echo '# TARGET_SYS' >> "$CARGO_HOME/config"
echo '[target.'x86_64-poky-linux-gnu']' >> "$CARGO_HOME/config"
echo 'linker =3D "target-rust-ccld"' >> "$CARGO_HOME/config"
    fi

# Keep the below off as long as HTTP/2 is disabled.
export CARGO_HTTP_MULTIPLEXING=3Dfalse

export CARGO_HTTP_CAINFO=3D"$OECORE_NATIVE_SYSROOT/etc/ssl/certs/ca-certifi=
cates.crt"
"""

I think I'd argue here that several bits of this are not target
specific (CARGO_HTTP_MULTIPLEXING, CARGO_HTTP_CAINFO) so these should
be being written out by nativesdk-cargo and not by a cross canadian
recipe. The build section of the cargo config file is also not target
specific so that could be handled there too.

The hard part is going to be to collect up the target specific pieces.
These are=C2=A0specific to the cross canadian variant so these do belong in
rust-cross-canadian. The target pieces don't contain paths or change at
runtime so I'd suggest they get written into files with
${RUST_TARGET_SYS} in their name so they don't clash. The script in
nativesdk-cargo can then collect up the entries from the multiple files
if it generates the CARGO_HOME/config file.

The rust.sh issue is similar:

$ cat rust-cross-canadian-x86-64/1.79.0/image/usr/local/oe-sdk-hardcoded-bu=
ildpath/sysroots/x86_64-pokysdk-linux/environment-setup.d/rust.sh=20
export CARGO_TARGET_X86_64_POKY_LINUX_GNU_RUSTFLAGS=3D"--sysroot=3D$OECORE_=
TARGET_SYSROOT/usr -C link-arg=3D--sysroot=3D$OECORE_TARGET_SYSROOT"
export CARGO_TARGET_X86_64_POKYSDK_LINUX_GNU_RUNNER=3D"$OECORE_NATIVE_SYSRO=
OT/lib/ld-linux-x86-64.so.2"
export RUST_TARGET_PATH=3D"$OECORE_NATIVE_SYSROOT/usr/lib/x86_64-poky-linux=
/rustlib"
$ cat rust-cross-canadian-i686/1.79.0/image/usr/local/oe-sdk-hardcoded-buil=
dpath/sysroots/x86_64-pokysdk-linux/environment-setup.d/rust.sh=20
export CARGO_TARGET_I686_POKYMLLIB32_LINUX_GNU_RUSTFLAGS=3D"--sysroot=3D$OE=
CORE_TARGET_SYSROOT/usr -C link-arg=3D--sysroot=3D$OECORE_TARGET_SYSROOT"
export CARGO_TARGET_X86_64_POKYSDK_LINUX_GNU_RUNNER=3D"$OECORE_NATIVE_SYSRO=
OT/lib/ld-linux-x86-64.so.2"
export RUST_TARGET_PATH=3D"$OECORE_NATIVE_SYSROOT/usr/lib/i686-pokymllib32-=
linux/rustlib"

One variable is the same in both cases so that could move to nativesdk-
rust. One has a different name so can easily handled by two different
filenames like your original patch here since those values don't
overlap. The problem is likely then RUST_TARGET_PATH. I'm not sure if
something like:

export RUST_TARGET_PATH=3D"${RUST_TARGET_PATH}:$OECORE_NATIVE_SYSROOT/usr/l=
ib/i686-pokymllib32-linux/rustlib"

works and makes sense or whether these do need to be set depending upon
which SDK environment is being selected.

I'd also probably suggesting just having rust.sh and dropping cargo.sh
since having both doesn't really make much sense.

Hopefully that gives a better idea of how this should be fixed.

Cheers,

Richard











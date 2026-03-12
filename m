Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B5A81049509
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 13:34:21 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21479.1773322457091070632
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 06:34:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HOXEz1IP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439cd6b0aedso843373f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 06:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773322455; x=1773927255; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1pA6SULuXd7kZdEZbAfFOITexSG48H76ZCgI/M6QInA=;
        b=HOXEz1IPIYL0pXBp4uxp9YevvDCLUwJvLakwcABkuKFPFyHKP6G/uDjjAKAX6zdlI5
         faofxs7VXGEZZ/hxcANNQ9FM61GGzJY2wyfh5vqMhiMhOnYmZHn6nba3EECUUiy8as3P
         lODVbG5SydoxtlytoU2jdxXFkalPC4FrETZEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773322455; x=1773927255;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1pA6SULuXd7kZdEZbAfFOITexSG48H76ZCgI/M6QInA=;
        b=jBcjrr8swZDgjiqksK6x0JbtVwwB/YAu5eQoDFgLv5V+4SfVFzyVZ/9JjBkhyz2lEE
         EOOG+QnBe5cR5ux5Y17sBwjnbmany+0hNDjw4JrhiLUj7ncIY8IRn33wvp/6tM+zYxPE
         Xi1FGN4lOUgSjfJPYdnhork5Am+3bXsViraPjh6AbtRGlbNr5OzLgG+msQvDYG6rsBgz
         uk2xEVvP954dQyXdpWoa0PsG5Gk0M9d5a46a2oj4j7NOsajv77tBvimSbIwcQ3lpjZDe
         pZJI55+Wx0QUlBFpR9Hyn8xQruNoLlvjrXi8rqs4eoG3L/4n65o2c/vSXwVeE49l/979
         V+Kw==
X-Forwarded-Encrypted: i=1; AJvYcCUA38K2OiCXioHyePSH4py5NAXGIsw+8ZEYy/1xC3OLtwlMMKCXsgif8qXS4KDxwXk4u1zJdqCFMLzyAJf884taAg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx90sfZ5v3fEy4cvOk0+Q4NlG6JLpq8lzrDRLYr/tyykE8w+fVO
	FKOWwpR7/7NXyNnststsPdqInNrEIBCjKWg26Ma8l8p/knyqH6gnBdjyvsDXrWDO5EQ=
X-Gm-Gg: ATEYQzzo9EjfUq9yT72btNgZ26S5pFOiyv33mqPJM1WMJJD2YTh0kbLEQOBUKgm43+q
	B9NZgQusgDjusf7lZL3/gUIAERu31WJfXmU0X/OrQNcNd82/u0dE2GKjeAeR2ciKwN+bkQW/IOv
	E2R17hCw7tthwHtQvcUW5qtEFgIBs2dwAiQ847YATyWJAxH8lyV4M1wU0W50/tfwzSo6QWj3K4U
	ZWeK4GXV8lNeC0o1yz2m4gG7XvVVXvCmoYKewfN7fIbqCDXWcasJgszr+FmKJsWy18RdURYXpwL
	QFdqdorjui9Ym9kq85/1bmZ5gtrlx6EKW/wtRhOmZxG7vnW6JoWKLrHQzxP6Tot7+UrmAR82J82
	ByXtzuuj/VH/ACYVCq+rdf7GauBv/HgZOVB7hjoWbjfmrBjxm+nFxM+8vZerCLnFPhcfUZlcNpb
	nZc94L16anDbeTWuAgje5PwkR6Qkk+cYkTeC4kOmdyLNfmD1cuvq2FMgdH3DDBha0UwRZjmyCHu
	7rPscGu/2mb
X-Received: by 2002:a05:6000:2486:b0:439:f612:9a58 with SMTP id ffacd0b85a97d-439f8222da0mr11941788f8f.30.1773322455353;
        Thu, 12 Mar 2026 06:34:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:215f:5162:d0b:8f1d? ([2001:8b0:aba:5f3c:215f:5162:d0b:8f1d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20c0b4sm9457334f8f.25.2026.03.12.06.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:34:14 -0700 (PDT)
Message-ID: <3cc131eb7aae470b98fdbb1bf8c3476685505d2f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v7 01/14] linux-yocto: conditionally add
 clang/rust/bindgen-cli-native to DEPENDS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org,
  Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com, 
	paul@pbarker.dev, yoann.congal@smile.fr
Date: Thu, 12 Mar 2026 13:34:13 +0000
In-Reply-To: <20260304174324.1186644-2-Harish.Sadineni@windriver.com>
References: <20260304174324.1186644-1-Harish.Sadineni@windriver.com>
	 <20260304174324.1186644-2-Harish.Sadineni@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 13:34:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232954

On Wed, 2026-03-04 at 09:43 -0800, Sadineni, Harish via lists.openembedded.=
org wrote:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>=20
> Conditionally add 'clang-native', 'rust-native' and 'bindgen-cli-native' =
to 'DEPENDS'
> when Kernel Rust Support is enabled.
>=20
> These tools are required for building Rust-enabled kernels and for
> generating Rust FFI bindings via bindgen during the kernel build.
>=20
> This ensures the additional dependencies are only pulled in when
> Rust support is explicitly enabled, avoiding unnecessary native
> dependencies for non-Rust kernel builds.
>=20
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
> =C2=A0meta/recipes-kernel/linux/linux-yocto.inc | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-ker=
nel/linux/linux-yocto.inc
> index 4d0a726bb6..b7961bbcdf 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -76,11 +76,14 @@ do_install:append(){
> =C2=A0KERNEL_FEATURES:append:qemuall =3D " features/kernel-sample/kernel-=
sample.scc"
> =C2=A0
> =C2=A0KERNEL_DEBUG ?=3D ""
> +KERNEL_RUST_SUPPORT ?=3D ""
> =C2=A0# These used to be version specific, but are now common dependencie=
s.=C2=A0 New
> =C2=A0# tools / dependencies will continue to be added in version specifi=
c recipes.
> =C2=A0DEPENDS +=3D '${@bb.utils.contains_any("ARCH", [ "x86", "arm64", "p=
owerpc" ], "elfutils-native", "", d)}'
> =C2=A0DEPENDS +=3D "openssl-native util-linux-native"
> =C2=A0DEPENDS +=3D "gmp-native libmpc-native"
> +RUST_KERNEL_DEPENDS ?=3D "${@bb.utils.contains('KERNEL_RUST_SUPPORT', 'T=
rue', 'clang-native rust-native bindgen-cli-native', '', d)}"
> +DEPENDS +=3D "${RUST_KERNEL_DEPENDS}"
> =C2=A0
> =C2=A0# Some options depend on CONFIG_PAHOLE_VERSION, so need to make pah=
ole-native available before do_kernel_configme
> =C2=A0do_kernel_configme[depends] +=3D '${@bb.utils.contains("KERNEL_DEBU=
G", "True", "pahole-native:do_populate_sysroot", "", d)}'

I get the feeling we're still not quite agreeing on how to make the
enabling of the feature work. I'm suggesting we do something like this:

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe=
/kernel-yocto.bbclass
index e53bf151941..9cc7568ab09 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -269,6 +269,9 @@ do_kernel_metadata() {
        KERNEL_FEATURES_FINAL=3D""
        if [ -n "${KERNEL_FEATURES}" ]; then
                for feature in ${KERNEL_FEATURES}; do
+                        if [ "$feature" =3D "rust" ]; then
+                                feature=3D"features/kernel-rust/kernel-rus=
t.scc"
+                        fi
                        feature_as_specified=3D"$feature"
                        feature=3D"$(echo $feature_as_specified | cut -d: -=
f1)"
                        feature_specifier=3D"$(echo $feature_as_specified |=
 cut -d: -f2)"

which means you can then simply add to your config:

KERNEL_FEATURES +=3D "rust"

and things should be enabled. This patch would then become:

RUST_KERNEL_DEPENDS ?=3D "${@bb.utils.contains('KERNEL_FEATURES', 'rust', '=
clang-native rust-native bindgen-cli-native', '', d)}"

Is there some reason we can't do something like this?

Cheers,

Richard




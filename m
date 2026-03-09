Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDDE7EFCD9B
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 11:26:44 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11968.1773055598972491481
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 04:26:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XoZb8xRJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso6052155e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 04:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773055597; x=1773660397; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+019Ttg2RTDDD/cFjHVCJnE5hmTeL93qRPUeMrKoZsM=;
        b=XoZb8xRJQMXBhVeLxldQ4lkrPHVE7OjOe7hDPiOStPsCD6iFSmA0kXS392kjBZW6hc
         7iKOIVN/t6R3Bqor5LTnI68DsPvnVZIt+qqXFPWKEjXuxbNS/jlh0j+4XFtGoMwoWKi9
         39ag5hfH7diYGv6zNf0maEb7/ukBRl4hSll6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773055597; x=1773660397;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+019Ttg2RTDDD/cFjHVCJnE5hmTeL93qRPUeMrKoZsM=;
        b=ZVMO4b8V0L50JA5c7XLOxGi7lEfDGZ5bcn5uEtOlCY5bs6mICX0FWNEr+LP5u/oQf6
         9bZzfKqSU5kFqd8Xt/Wq6DrM3MjXdb5WhutvrIjsiWayk6Z5M0qVTl66iAeIR31B3iX3
         WByEnHZrQYqTMHtjGR6WOey0vv5ZTtIIX1LJcZhiXsIAmX8rrtspt2kypUv6iIKv4NbW
         SDumBXhc9uMiGo7tjVx5XV/bj3mkJHUTVif4rB31wtmKD3rLob744glN9+yyBjNOhFXD
         xo3kSt9MHO4x0AsvP24JSWPpe0bxbJ79AqFCZGpit4nL+yPqR/8jiakQyRUGBu+is2/E
         ByCg==
X-Forwarded-Encrypted: i=1; AJvYcCUD86Cj+WnoUVsiBoDuxrq0tjePqWxJ4ENwpkmX+j0UG4/2UuVupe9HDK7HU7tQKDVxNTQpQ/OSuSl5Sm14UNy6Lg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzS5VMBtYscvMBkwZi/83Mod/9XmXJlvZ6xS0l+dtmCFNtODaV0
	hJb0Z+nf8Ft+FaDHiwHAD2nc0k5fpFV6viTE7E/kScs8MOGJlDMa2kGfzEUUqsOSyVM=
X-Gm-Gg: ATEYQzzUmEUaUXwtaH3NQ29Nvhj6j+LPYSPgSzBQfEgheGTMHVbTIoA0Le5Z+p3/tOw
	ZT1t6GklQeXiUpDSl7+nlAT965gSDKb2gk8RDS9E9/B3HYN9vq/2lmDXdCO9/0RFcgVdJnciFAZ
	E1N499nyIeMOJShrpJKrJwRmVdDrGiOvDUGzsko4BO1WD/zEnpcDIoW1tYdqdwunWUfjFhA5KNg
	cGFtkI1lY3hWhUbREARoe+aQlx8/5q41112Vyr+LdxUd6NIuQb7thOn3qaA5ylCx5Ix6DA38nIm
	TuL3wXIMPujqaE3XbtWQJSctmYOtoLGwo/EagL+H/7FkXerMYhlS8BOJsKfMaol+MqouMzLKm6/
	QGt9mRy631Dmuel+R6aV+Kt5dVatsp+3dSjB+YPRLSSuFIqqOAZWPrLw3JhUNIkVxz5gRNakTjY
	XUFUmS3by9CcT0McBMyi8cNFCnV8fz/SxbKtJdeu0AFwb8zyn5kLSBIAT29jsfwdk59htNZBvOO
	3+v8mYb1XWIY94=
X-Received: by 2002:a05:600c:4f55:b0:485:3c66:e230 with SMTP id 5b1f17b1804b1-4853c66e4eamr38265785e9.29.1773055597238;
        Mon, 09 Mar 2026 04:26:37 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:24aa:67b9:6ef1:bd24? ([2001:8b0:aba:5f3c:24aa:67b9:6ef1:bd24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48539e574b5sm103401495e9.8.2026.03.09.04.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:26:36 -0700 (PDT)
Message-ID: <da48a9fc8556f2a54e44f7e029be64182b0e8cf9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v7 01/14] linux-yocto: conditionally add
 clang/rust/bindgen-cli-native to DEPENDS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com, 
	paul@pbarker.dev, yoann.congal@smile.fr, Bruce Ashfield
 <bruce.ashfield@gmail.com>
Date: Mon, 09 Mar 2026 11:26:35 +0000
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
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 11:26:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232695

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

I thought we were going to try and use KERNEL_FEATURES for this?

The implementation of KERNEL_RUST_SUPPORT is problematic as it only
works for the value of "True", not "true", or "1" or 1 or any other
thing people might dream up. "Contains" isn't really an appropriate
mechanism for a boolean either.

You can use bb.utils.to_boolean() as a way to better obtain a boolean
value from a random variable.

Cheers,

Richard







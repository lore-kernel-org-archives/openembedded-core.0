Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36515C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 13:20:06 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.79115.1705324799159688798
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 05:19:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eqe6mz1/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40e7e2e04f0so4554415e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 05:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1705324797; x=1705929597; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yecjz+JQdGe5GDd5sL2qAwJueVUKyevX8J58kweF6Ns=;
        b=eqe6mz1/6pA4ZKpjcoMRnC/WWiq4eBvgHmgl35YTA4bsBK7uJfndBRBGbMFWIKM0xC
         9FTjOUtSgR+avLeaJmXCkMzFsCzpfz+uV7lkq4lxB4B+PXnLFjVgq1GIqw4iiYlayE+P
         cdPJoxIjEev7bWsyT22Q5hulivkWK8/vnINg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705324797; x=1705929597;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yecjz+JQdGe5GDd5sL2qAwJueVUKyevX8J58kweF6Ns=;
        b=B8n7GB/o+sbqYi/fKCyd7zzdO8Qyg7MHpLosli3upp7TcC8dgx9jCT6uojBv7nO294
         3Bww/cjrrZm0J4iPO1/RVMtjeGtl8UZW5aPnuFwuCvTGpQWsE+hGOZiGHO1vktoZYWsw
         JrxYhsXZ6lhkVMATNhJxpNDPgrKy34AKxB/4Kg9jDC0gO3mqF0Fe1qQ8yodlHXS1MC9k
         KBmUK4x9Qtco6/HdAzcIFolHuaT7tt0U16as7fOWUA2aRWrXPMt5Vsh4DC7Sd6TvuepQ
         H9B+4Be3uVTWACXsOfsUPjg/2/WQxEljfJOonADEZCjEyHWPWE6KVMKbvokEXqzngCxh
         oZug==
X-Gm-Message-State: AOJu0Yyf59lZxYxfvyw5Pp5v34lsNrKUFIPXukLZ4afLgXNfCXByk8g5
	2TwGXQuoFMvVWia7Zqu7mP1E3gDZEQZ5Tg==
X-Google-Smtp-Source: AGHT+IHOqgH/p7Y73cf5ZVj8uthfQ9M1A2JXDjRWZvMZ1Hs5dTcqo4rfDM0bWC6q8sWwtb0hAHQc6A==
X-Received: by 2002:a05:600c:4503:b0:40e:67e9:af1 with SMTP id t3-20020a05600c450300b0040e67e90af1mr2318830wmo.3.1705324797469;
        Mon, 15 Jan 2024 05:19:57 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:72a4:a6e5:bd33:85bd? ([2001:8b0:aba:5f3c:72a4:a6e5:bd33:85bd])
        by smtp.gmail.com with ESMTPSA id c12-20020a5d528c000000b00337ac2db87csm1734355wrv.36.2024.01.15.05.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 05:19:56 -0800 (PST)
Message-ID: <cd7e909003596bb4db2b3a946e2b846aad5e9de9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rust: Use llvm-config from native llvm-rust
 on rust target builds
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Mon, 15 Jan 2024 13:19:56 +0000
In-Reply-To: <20240114055844.2301337-1-raj.khem@gmail.com>
References: <20240114055844.2301337-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 13:20:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193671

On Sat, 2024-01-13 at 21:58 -0800, Khem Raj wrote:
> target rust recipe builds ( cross compile ) calls llvm-config from
> target sysroot which works ok as long as C++ runtime it needs is
> available on build host e.g. libstdc++ etc. which is commonly the
> case, however when using clang and llvm runtime this falters since
> it should be using libc++ from native sysroot and if this does not
> exist on build machine this fails to find libc++ shared object and
> llvm-config fails to run. This ensures that llvm-config version in
> use is correctly relocated and can use shared libraries from native
> sysroot correctly. Adding ORIGIN to sysroot will look for the .so in
> same dir as the binary and there is the libc++.so.1 copied in place
>=20
> Fixes rust build with clang compiler.
>=20
> > /mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/rust/1.74.1/recipe-s=
ysroot/usr/lib/llvm-rust/bin/llvm-config: error while loading shared librar=
ies: libc++.so.1: cannot open shared object file: No such file or director
> y
> > thread 'main' panicked at llvm.rs:551:19:
> > command did not execute successfully: "/mnt/b/yoe/master/build/tmp/work=
/riscv64-yoe-linux/rust/1.74.1/recipe-sysroot/usr/lib/llvm-rust/bin/llvm-co=
nfig" "--version"
> > expected success, got: exit status: 127
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/rust/rust_1.74.1.bb | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/rust/rust_1.74.1.bb b/meta/recipes-dev=
tools/rust/rust_1.74.1.bb
> index 30543ada7db..2dffe009827 100644
> --- a/meta/recipes-devtools/rust/rust_1.74.1.bb
> +++ b/meta/recipes-devtools/rust/rust_1.74.1.bb
> @@ -198,9 +198,13 @@ rust_runx () {
>      # Copy the natively built llvm-config into the target so we can run =
it. Horrible,
>      # but works!
>      if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} !=3D ${RUST_ALTERNATE_EXE_PAT=
H} -a ! -f ${RUST_ALTERNATE_EXE_PATH} ]; then
> -        mkdir -p `dirname ${RUST_ALTERNATE_EXE_PATH}`
> +        tgtdir=3D`dirname ${RUST_ALTERNATE_EXE_PATH}`
> +        mkdir -p ${tgtdir}
>          cp ${RUST_ALTERNATE_EXE_PATH_NATIVE} ${RUST_ALTERNATE_EXE_PATH}
> -        chrpath -d ${RUST_ALTERNATE_EXE_PATH}
> +        if [ -e ${STAGING_LIBDIR_NATIVE}/libc++.so.1 ]; then
> +            cp ${STAGING_LIBDIR_NATIVE}/libc++.so.1 ${tgtdir}/
> +        fi
> +        chrpath -r \$ORIGIN ${RUST_ALTERNATE_EXE_PATH}
>      fi
> =20
>      oe_cargo_fix_env

Copying a native library into the target sysroot goes beyond what I'm
comfortable with even for this horrible hack with llvm-config.

Since it seems to be finding it by RPATH, can you not just add an RPATH
to the native sysroot in the binary?

Cheers,

Richard


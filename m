Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E995BC4167B
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 15:44:02 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.15785.1699976636238355937
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 07:43:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cpz7xhWK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40839807e82so34239095e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 07:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699976634; x=1700581434; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=suuYcG4I8s0sgINhLGNVa0m8E/Qjlnlguww9vlgmriw=;
        b=cpz7xhWKfuw4BszuYtHVThy+ehNj6PtMdpyTB55A+fPlXBPREzyPoLiZKVrUhLAszc
         MEreVqPF6BRHcVFUul77vmrs7P7HV8n7R8uWMZGGyD0xtcM4MbYr0shV1RbjDj6sBcc9
         PnfhbfzgjiPpRsvnxRySGmeOQst8uKf6LJRvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699976634; x=1700581434;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=suuYcG4I8s0sgINhLGNVa0m8E/Qjlnlguww9vlgmriw=;
        b=uvpsZ4JDeqRVwBxGyyJPpoDxu1zOGzIJyK/jGS2bI9Zgo49bMOLb9quWDyN3XyGiFf
         e+pXc/wbPmMAPaewNPQkMQeO2LmQs1gwmZ+dxHPkL+PKrYUNJNQjXzceVWnvWbFAUFp6
         Jb0BXowZW7ANnl92b1k3QQHdwNeEF+Fn9dNORIQhYBFwaXUlef2l2sF5RZTFE7eGCOvz
         VJq3sXliN35PwBwqkPnlrSxrwJpCKQboTD6B3w4fy0TFT30p7ilUrWMZfSpmzmFFsZRo
         FxoSmx91qBLy4OIEAhODU+mH+cGrrahO61RBs2q0b03cZAvThVv0lvuj19VpzSYxOuEN
         XBGw==
X-Gm-Message-State: AOJu0Yzw7vPi2YF6WN2jB48IgEuCysXDyE4vDT2HAqjIjTcO+iOVTleb
	drbSKHmxNa/SFv/QjAMYNAznow==
X-Google-Smtp-Source: AGHT+IEgpMGp5qFPWYEDlgtTWBBN/hDhM08dsRLxozi0HlZRVAdM1Hy7LKBRxlDbub/7kRbH6ZjDEw==
X-Received: by 2002:a05:600c:35d4:b0:407:4701:f9e with SMTP id r20-20020a05600c35d400b0040747010f9emr2916482wmq.17.1699976634554;
        Tue, 14 Nov 2023 07:43:54 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:c86b:91bb:bc1f:9d3f? ([2001:8b0:aba:5f3c:c86b:91bb:bc1f:9d3f])
        by smtp.gmail.com with ESMTPSA id p15-20020a05600c358f00b0040596352951sm17724715wmq.5.2023.11.14.07.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 07:43:54 -0800 (PST)
Message-ID: <a226a852c2d0555780f9e21006f30c3f42a217a0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rust: Avoid removing origin from llvm-config
 binary with chrpath
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2023 15:43:53 +0000
In-Reply-To: <20231114-rust-with-clang-v1-1-d05ed1f7387c@gmail.com>
References: <20231114-rust-with-clang-v1-1-d05ed1f7387c@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 15:44:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190512

On Tue, 2023-11-14 at 07:29 -0800, Khem Raj wrote:
> If these directories are removed from binary, it does not find the
> needed libraries it may need from recipe-sysroot-native, e.g. when
> building with clang+llvm-runtime, it also builds rust-native with
> clang-native and links to libc++.so.1 which will be part of
> native sysroot but may not be available on build host system install
> and it loses that ability to find it in native sysroot and we see errors
> like
> llvm-config: libc++.so.1 not found.
>=20
> during rust bootstrap execution.
>=20
> This patch stops editing the binary, so it can find the dependencies in
> native sysroot it
> needs for running itself when placed in target directory ( target sysroot=
 )
> yet when llvm-config is invoked the reported paths are relative to
> taregt sysroot which is what we expect, so functionality remains as it is=
.
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> When using libc++ instead of libstdc++, llvm-config is unable to find
> libc++.so.1 from native sysroot due to llvm-config copying dance we do.
> ---
>  meta/recipes-devtools/rust/rust_1.70.0.bb | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/rust/rust_1.70.0.bb b/meta/recipes-dev=
tools/rust/rust_1.70.0.bb
> index 16d433910f8..98cc56c0c91 100644
> --- a/meta/recipes-devtools/rust/rust_1.70.0.bb
> +++ b/meta/recipes-devtools/rust/rust_1.70.0.bb
> @@ -205,7 +205,6 @@ rust_runx () {
>      if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} !=3D ${RUST_ALTERNATE_EXE_PAT=
H} -a ! -f ${RUST_ALTERNATE_EXE_PATH} ]; then
>          mkdir -p `dirname ${RUST_ALTERNATE_EXE_PATH}`
>          cp ${RUST_ALTERNATE_EXE_PATH_NATIVE} ${RUST_ALTERNATE_EXE_PATH}
> -        chrpath -d ${RUST_ALTERNATE_EXE_PATH}
>      fi
> =20
>      oe_cargo_fix_env
>=20

We had to do that since we're moving the binary and the relative paths
no longer work? It depends on your layout iirc so some will work, some
won't and it sounds like you're just getting lucky :(.

Put another way, that was put there for a reason so we can't just
remove it.

Cheers,

Richard


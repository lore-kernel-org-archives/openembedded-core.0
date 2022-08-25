Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81FA7C04AA5
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 09:46:18 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web08.22034.1661420772668087815
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 02:46:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=doY7JkAT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id
 n23-20020a7bc5d7000000b003a62f19b453so2356579wmk.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 02:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
        bh=ETkNVDXCyhnC73fNHN3lFprca7jDXVL5hKcnm+ab7y8=;
        b=doY7JkATFLBmOTsPwoUOCjFH9o5A9R4ZdnaTlb1M9r5cr+xaGBnHjB2/olm+A77yvD
         vdrXidKxB1yW+247dX5L/BGBAM4rb1oDlEHRfDjFlrKpur8nRR2v2xkj45IsJwt9Pm0+
         atlsKGXS8nSUkVxh7PCGzOiXHwS29TjUsttxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc;
        bh=ETkNVDXCyhnC73fNHN3lFprca7jDXVL5hKcnm+ab7y8=;
        b=pyNvhRbaeWlHLjjUh85drJfgqMjfC6F+eh7uruoVrL7Q1fVJhF+m2hCqt4FJI8voEo
         F0djjK4eXP337Kxy674mps8EiW2ogbH3ihdbX2HeOHlFysVtTMAFT0FG2H23q1/opsHM
         7t9Lu3G6/kyz60NYZbm13yXIC+6vcyAlTeIp4n+0qwbBiRT6h3cvCnGfJ8NFhv8bs+Xx
         NufqC7oPI/vYm58+eWdF/kD3sdtTudFTj45Pdk5vnI+EQqBcbqOlJin6ZGVn7KlPfloo
         KUHO14QrSBptPpUVhZY2mmMPJcaKQ/0wzLz3K0LGi9E3oHezU4Ag4ITldgIVISdXIies
         y6HQ==
X-Gm-Message-State: ACgBeo1ZVo9NjbTjUKZXHYb5s8foFkJo/UuQ0WcgL8JGY+ZthGVuHUEc
	QG4+jfQErG+HyaV/my8Q2yud9Q==
X-Google-Smtp-Source: 
 AA6agR52Z7k5MZZQik3UjLxwJdvFfBXQzMvdMJyDXC4Cro2K+Vmafmw5tZlctQT2VvmQHGv2rpY4qg==
X-Received: by 2002:a1c:7708:0:b0:3a5:5543:cec4 with SMTP id
 t8-20020a1c7708000000b003a55543cec4mr7796695wmi.47.1661420770944;
        Thu, 25 Aug 2022 02:46:10 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8059:8737:891c:87d?
 ([2001:8b0:aba:5f3c:8059:8737:891c:87d])
        by smtp.gmail.com with ESMTPSA id
 n12-20020a5d67cc000000b0022584c82c80sm464144wrw.19.2022.08.25.02.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 02:46:10 -0700 (PDT)
Message-ID: 
 <902d4b02a35afb561892760deb3084221e688bf5.camel@linuxfoundation.org>
Subject: Re: [PATCH] rust: conditionally copy tools like rustfmt
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <Randy.MacLeod@windriver.com>,
	openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com
Date: Thu, 25 Aug 2022 10:46:09 +0100
In-Reply-To: <20220820022910.173452-1-Randy.MacLeod@windriver.com>
References: <20220819072727.2236928-39-alex@linutronix.de>
	 <20220820022910.173452-1-Randy.MacLeod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 09:46:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169840

On Fri, 2022-08-19 at 19:29 -0700, Randy MacLeod wrote:
> For qemuppc/mips, rustfmt isn't being built so check
> that it and related tools exist before copying them.
> qemuppc/mips are not well-supported in the Rust world
> but will work to get the build to fixed later.
>=20
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  meta/recipes-devtools/rust/rust_1.63.0.bb | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/rust/rust_1.63.0.bb b/meta/recipes-dev=
tools/rust/rust_1.63.0.bb
> index 3081cd5ef3..050f398794 100644
> --- a/meta/recipes-devtools/rust/rust_1.63.0.bb
> +++ b/meta/recipes-devtools/rust/rust_1.63.0.bb
> @@ -43,8 +43,10 @@ rust_do_install:class-nativesdk() {
> =20
>      install -d ${D}${bindir}
>      for i in cargo-clippy clippy-driver rustfmt; do
> -        cp build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/release=
/$i ${D}${bindir}
> -        chrpath -r "\$ORIGIN/../lib" ${D}${bindir}/$i
> +        if [ -e build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/re=
lease/$i ]; then
> +            cp build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/rel=
ease/$i ${D}${bindir}
> +            chrpath -r "\$ORIGIN/../lib" ${D}${bindir}/$i
> +        fi
>      done
> =20
>      chown root:root ${D}/ -R
> @@ -60,8 +62,10 @@ rust_do_install:class-target() {
> =20
>      install -d ${D}${bindir}
>      for i in cargo-clippy clippy-driver rustfmt; do
> -        cp build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/release=
/$i ${D}${bindir}
> -        chrpath -r "\$ORIGIN/../lib" ${D}${bindir}/$i
> +        if [ -e build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/re=
lease/$i ]; then
> +            cp build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/rel=
ease/$i ${D}${bindir}
> +            chrpath -r "\$ORIGIN/../lib" ${D}${bindir}/$i
> +        fi
>      done
> =20
>      chown root:root ${D}/ -R


I did look into this a bit. The compile logs for ppc are full of
horrible warnings and I have patches to clean that up. Once that is
done, it comes down to crossbeam-utils trying to use AtomicI64 which
doesn't exist on mips or powerpc 32 bit.

https://github.com/tikv/rust-prometheus/issues/315

has some interesting info.

error[E0412]: cannot find type `AtomicU64` in module `core::sync::atomic`
  --> /usr/src/debug/rust/1.63.0-r0/rustc-1.63.0-src/vendor/crossbeam-utils=
/src/atomic/consume.rs:78:14
   |
78 |   impl_atomic!(AtomicU64, u64);
   |                ^^^^^^^^^ help: a struct with a similar name exists: `A=
tomicU16`

error[E0412]: cannot find type `AtomicI64` in module `core::sync::atomic`

Digging further crossbeam-utils has a no_atomics.rs file listing all
the triplets that can't use atomic or have limited 64 bit ones.

Sadly those triplets don't match the ones were using as we have
TARGET_VENDOR in ours, for reasons. That will be why it breaks.

I'm trying a patch which changes TARGET_VENDOR -> "-unknown" but I've
never written rust code and it takes an age to cycle through so we'll
see...

Cheers,

Richard






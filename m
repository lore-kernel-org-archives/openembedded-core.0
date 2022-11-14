Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A81AC4332F
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 13:41:10 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.5580.1668433261743898376
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Nov 2022 05:41:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ggz/cDu2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id j15so18337871wrq.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 05:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MNDWJ9/WzUkARyxPdkGMk8iVl/mF7/5o4nFoewLabSc=;
        b=Ggz/cDu2qqDDE01sN3Z36TGZvRLSKSsxqrMssPBqmK+/Z2LHW8MmD5xGfIwrB/yozU
         /2g3bGoJ5o05kswOJapp/9/J+qsBCoDHT7ptyq+gr/AiMiloqf/BEq1bzYwNUkNA6JN9
         iVUXlwxzcrPzhmFRV75om9HDfxAvTeD3hT7WE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MNDWJ9/WzUkARyxPdkGMk8iVl/mF7/5o4nFoewLabSc=;
        b=jR5jUaA94NZ+kt1rF14bK9rCZLTihbHLmEUHQ8+fIg00Bg/Re4x53AsLW6yJH6w1c1
         yQpzHryGYQuW0w8Uh1vKuBZGTePGZabfv6PcecvSHePqa9TJdr1RtHhYMuZ4PG2jOhE+
         t62ZfdvBFagfa2U2oeDyR17krm3V9ccbtKfnwEVopJB3KxiuC1D1jLTO26K5D2K2MFoi
         304BPHRXBaKg3n3iNTQtWKDYXh2i3mR2t0CAG/mvTwU7GeIhjF/cfAXBYxYWXh/o5nZV
         DS0ITIIxmQauXOdaqxMbRR6figOdc/xYctEy5/IO6jXt+KLAhBKmzqhuwJ3afmSQgQma
         nIQg==
X-Gm-Message-State: ANoB5pnv4aNVXKoxgSon7N+7lkZXoH9LaSYE+9V4E7m9SFlc0x06TzBw
	b5BPDzn32j6xO+EGTr9IEF1a5g==
X-Google-Smtp-Source: AA0mqf7uQn8NUVScWOhkybVGtLi4SRpG2rc5vfKdRrdIWKMQCYBb5gP3VQBTS2FeRcLJGk9SxcGFcA==
X-Received: by 2002:adf:a481:0:b0:236:9067:40db with SMTP id g1-20020adfa481000000b00236906740dbmr7778033wrb.695.1668433259922;
        Mon, 14 Nov 2022 05:40:59 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:aa29:f8ea:3483:371a? ([2001:8b0:aba:5f3c:aa29:f8ea:3483:371a])
        by smtp.gmail.com with ESMTPSA id bd10-20020a05600c1f0a00b003cfbe1da539sm13123010wmb.36.2022.11.14.05.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 05:40:59 -0800 (PST)
Message-ID: <9417858a6829fc4dc81546e94a78542fea51989c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] mesa: do not rely on native llvm-config in
 target sysroot
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Mon, 14 Nov 2022 13:40:57 +0000
In-Reply-To: <20221114133504.2392154-1-alex@linutronix.de>
References: <20221114133504.2392154-1-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 13:41:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173242

On Mon, 2022-11-14 at 14:35 +0100, Alexander Kanavin wrote:
> Sadly the magic is not perfect: llvm-config contains a hardcoded
> value for the libdir from the native configuration, and things will
> break if the target build installs libraries somewhere else (e.g. lib64).
>=20
> llvm-config in target bindir also needs a rpath adjustment,
> otherwise it simply won't even run when e.g. building for arm on x86.
>=20
> To avoid patching llvm-source let's simply add more cases to the
> llvm-config wrapper script, so that falling through to llvm-config binary
> is avoided. Fortunately those cases are all static in what they return,
> even though llvm-config binary does poke around the file tree to arrive
> at them (which is where breakage happens if native and target don't match
> exactly wrt libdir).
>=20
> I verified that this works by building mesa with llvm enabled for
> qemuarm64 and with baselib set to 'lib64' - so that both the target
> architecture and target libdir differ from native ones.
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/recipes-devtools/llvm/llvm/llvm-config |  9 +++++++++
>  meta/recipes-graphics/mesa/mesa.inc         | 10 ----------
>  2 files changed, 9 insertions(+), 10 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/llvm/llvm/llvm-config b/meta/recipes-d=
evtools/llvm/llvm/llvm-config
> index a45f38c650..5e4ded2da5 100644
> --- a/meta/recipes-devtools/llvm/llvm/llvm-config
> +++ b/meta/recipes-devtools/llvm/llvm/llvm-config
> @@ -29,6 +29,15 @@ for arg in "$@"; do
>      --ldflags)
>        output=3D"${output} ${LDFLAGS}"
>        ;;
> +    --shared-mode)
> +      output=3D"${output} shared"
> +      ;;
> +    --libs)
> +      output=3D"${output} -lLLVM"
> +      ;;
> +    --link-shared)
> +      break
> +      ;;
>      *)
>        remain=3D"${remain} ${arg}"
>        ;;
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
> index 7dbca5876a..5839b6d6a7 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -55,17 +55,7 @@ ANY_OF_DISTRO_FEATURES:class-target =3D "opengl vulkan=
"
> =20
>  PLATFORMS ??=3D "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)}"
> =20
> -# By placing llvm-config in the target sysroot bindir, it will then map =
values
> -# to the target libdir magically. We can safely add to path as there are=
 no other binaries
> -# there.
> -PATH:prepend =3D "${STAGING_BINDIR_CROSS}:${STAGING_BINDIR}:"
>  MESA_LLVM_RELEASE ?=3D "${LLVMVERSION}"
> -do_configure:prepend () {
> -	if [ -e ${STAGING_BINDIR_NATIVE}/llvm-config${MESA_LLVM_RELEASE} ]; the=
n
> -		cp ${STAGING_BINDIR_NATIVE}/llvm-config${MESA_LLVM_RELEASE} ${STAGING_=
BINDIR}
> -		cp ${STAGING_BINDIR_NATIVE}/llvm-config ${STAGING_BINDIR}
> -	fi
> -}
> =20
>  # set the MESA_BUILD_TYPE to either 'release' (default) or 'debug'
>  # by default the upstream mesa sources build a debug release

The trouble is how many people are ever going to check whether the
output of llvm-config changes? We really need to work with upstream to
make this util cross safe...

Cheers,

Richard



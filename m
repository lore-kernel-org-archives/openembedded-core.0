Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CF6ECD98C5
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 21:42:08 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31957.1781127727011321167
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 14:42:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fmzBbinq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490ac357c55so76565245e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 14:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781127725; x=1781732525; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9dqsCVimaXamzApRPVnrL3bJ8ZWyF66voGZU/mda2oY=;
        b=fmzBbinqIgkLiJnYF7Z3L4j7D93ppDiAJmdmIuZ9NmOKkWxZjkUFJXSP1rS7b3jFoU
         WHRODAC+DWcKs4eum4kvkXZVvnKBkI3kIQpg8i4aqbM0NelYVgD2VDOASCViV4M5dHCK
         R9tFmekSXwtIulCXpeDgGI6c3gFX9MQVp42Hk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781127725; x=1781732525;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9dqsCVimaXamzApRPVnrL3bJ8ZWyF66voGZU/mda2oY=;
        b=ly+yAqOAWkIZOmPQvEH44OBEwGtJ0DzN8WwoxWerPTFaUXYC18f3Is+nZ0P2M+UM+M
         tiFJREcdHDnkzabLbBu3JxfCX6pr9LFPgp7vAkylTzCsT3xPUw5TYPdmbFq0G2SzkLWJ
         ARSw+SlAbHGXyX6Mxh9W2VIt+Ac+i3kbGdMox7I7wuZkfAQM6HXuODSGLErwAxXKkA4d
         AMWW6S8JfeM3Qvn34Y4Rzx997tkdqkv+qFX/7oXfhws6gwmqo1qYC12c6aOOlzwpkO2t
         emBy4BwEJlp2CwlT/ZoaFYWLXGyPqXFpm8Y8pcdJeFHxy4uinamSVB7wZ8AuO49zfovx
         +1fw==
X-Forwarded-Encrypted: i=1; AFNElJ99vOZ1XZsGbqzXUWKScW53EOKcMwvDOU19gO5urbaj2aeTTV2ORDq1yg9+FFRBPVQvWX5un7RCY6sW3HUzEwuoew==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxce3Ig1IEJ9oLtv+GbGojHEn7l1OzBzRtMN/cUBEJtIIhCY5n7
	c3G9WjaGGX2gXDgUC6UNZdwwCGbhIXliCkSx7LZ4Ev6R85Od3V788Uz3BJOqzhLgie6P5PQNjrH
	v0EQM
X-Gm-Gg: Acq92OFk8DU2uhx2ivPsfa2XXkj4tZLPOlcMXycrhOvTVuff+c+61asvKCdcrPIXncE
	T+Hs19A4GKNu+vcyqSkAvOgZ3DfQ4onchI3JOY0lwiJdnqaj/fGIa3z77D1fLZMPx8NZg2MkdYs
	hYclU9pOy1RGombeOTy+tkUn+aSUsB1nYROPpfupqv3GLfgy0jMy+xw8fvtTbP8fklkMQiW3a08
	0V1M9Kx2KQqZ5nqB9cWGczDer3tbEG57+TACm5DTbGhyaR51RyU9BG9Jr38Fjks6fzxCepvaX5c
	QvHUi/gyoGIKnOxALGV8etNao6UlpdOW6NIqao9gBLc0lcxrsNUzPNz17V0bxXlUk4OEw1tEYMs
	J3HxJJZq2rW+D6txfdxwOhC3EwGN9CLJN1B5ZcXcAUPny5+BhpE/8j9CVpaY8/7BYdkGHDWix4S
	HYkuw67h5aZqX1WtOQQaHmL0xIo/5kR+N6ZbjI84uI6jXZkW1xkeeuXKNOj5LAsA3okKG4IhR4s
	y7qSgoMCEsquNP2qG+3FW8P
X-Received: by 2002:a05:600c:83c3:b0:490:b355:9c70 with SMTP id 5b1f17b1804b1-490c25a5970mr454509005e9.11.1781127725414;
        Wed, 10 Jun 2026 14:42:05 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e996:5a7:2609:813f? ([2001:8b0:aba:5f3c:e996:5a7:2609:813f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f35133csm72203861f8f.25.2026.06.10.14.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 14:42:04 -0700 (PDT)
Message-ID: <342ed2eed3ffa5038d6b57a3daafcdf9c2066190.camel@linuxfoundation.org>
Subject: Re: [PATCH v2] llvm/mesa/rust: simplify llvm-config handling
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Deepesh.Varatharajan@windriver.com, 
	openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Randy.Macleod@windriver.com
Date: Wed, 10 Jun 2026 22:42:04 +0100
In-Reply-To: <20260610112611.649074-1-Deepesh.Varatharajan@windriver.com>
References: <20260610112611.649074-1-Deepesh.Varatharajan@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 21:42:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238394

On Wed, 2026-06-10 at 04:26 -0700, Deepesh.Varatharajan@windriver.com wrote=
:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>=20
> Replace PATH-based llvm-config discovery with explicit sysroot-native
> resolution and simplify the target llvm-config wrapper to act as a pure
> pass-through while preserving Yocto alternate path handling.
>=20
> The previous implementation relied on:
>=20
> * `which -a llvm-config | sed -n 2p`
> =C2=A0=C2=A0 which is unreliable in cross-build environments because it o=
nly
> =C2=A0=C2=A0 searches executables present in $PATH. Native sysroot tools
> =C2=A0=C2=A0 (e.g. recipe-sysroot-native llvm-config) are not guaranteed =
to be
> =C2=A0=C2=A0 exposed via PATH, so they may not be discovered at all.
>=20
> * `echo $base_libdir | sed -n '/lib64/p'`
> =C2=A0=C2=A0 which depends on a BitBake variable that may be empty or uns=
et
> =C2=A0=C2=A0 in certain build contexts, leading to incorrect libdir selec=
tion.
>=20
> Update the wrapper to:
>=20
> * Use an @LLVM_CONFIG_PATH@ placeholder that is replaced during the
> =C2=A0 build with the appropriate native llvm-config path.
> * Detect libdir using filesystem inspection rather than variable
> =C2=A0 parsing.
> * Preserve `YOCTO_ALTERNATE_EXE_PATH` and
> =C2=A0 `YOCTO_ALTERNATE_LIBDIR` handling.
> * Delegate all arguments directly to the native llvm-config.
>=20
> Update rust and mesa recipes to replace the placeholder with the native
> llvm-config path during target and nativesdk builds.
>=20
> Also remove the native llvm-config copy logic and lib/lib64 symlink
> workarounds, relying instead on explicit native tool resolution.
>=20
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
> =C2=A0...unwind.pc.in-and-llvm-config-scripts.patch | 52 +++-------------=
---
> =C2=A0meta/recipes-devtools/rust/rust_1.96.0.bb=C2=A0=C2=A0=C2=A0=C2=A0 |=
 51 +++++-------------
> =C2=A0meta/recipes-graphics/mesa/mesa.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 16 ++++++
> =C2=A03 files changed, 38 insertions(+), 81 deletions(-)

Thanks, this looks better in testing but we did see:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/42/builds/3864

which mentions:

"/srv/pokybuild/yocto-worker/qemuarm-tc/build/build-st-3903846/tmp/work/cor=
texa15t2hf-neon-poky-linux-gnueabi/rust/1.96.0/recipe-sysroot/usr/bin/cross=
scripts/llvm-config: line 15: exec: @LLVM_CONFIG_PATH@: not found"

The rest of the build is ongoing.

Cheers,

Richard


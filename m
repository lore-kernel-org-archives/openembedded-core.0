Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5717AC282EC
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 13:45:01 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.14939.1741873497810826289
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 06:44:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LCxiPYUz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so8768475e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 06:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1741873496; x=1742478296; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kVESxqyMnsvSTdMS/JKqwctZMT6nAKmuPv+iXTbece8=;
        b=LCxiPYUzGsh8enn985AQcaXw5C7Drl8feaJpo2dnIjezHLnZgjhFLSjGN1wItY+Zlx
         gEnB+V1CLj4sD3jjCmZC+MJu01/mTzhM+pxfz4YpYVu8W7uhVmw48F50aEmNe9erFrYB
         2pIWT4/aSY8ccpxX+V+8vMqNyQL2IeQ/B4LQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741873496; x=1742478296;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kVESxqyMnsvSTdMS/JKqwctZMT6nAKmuPv+iXTbece8=;
        b=sk9HJqCNKq4dxIrQ+3yNFLTjpn+gH2MTFzG3K7bHzRjlWKNOs8d03C2NKhXVV6FToX
         2LjRRsIRenofr7LC7zPHEp7FohljdiKbeEWE+IQdAxAROrBsWoFGBHfPO0a1Jr4Zut5M
         C3zMveZiYnYfqHHLkHgd1mdILtziE26KQFIe1gwfDxj7mEgVC7jwM/uHabOKA2iGoCCp
         FhfwBa1zjlFvXP7kNYs7EocGyq43qWqV1x3bdvba54Fl1RrQvtGnCR3N1flhPESE/skA
         Fx1r4IjyroQzkskAqdv+3DV3sYzcJJgQWEmGQ63aSXqe4/rkFSJi2f3JVUzb+B12fICv
         W+xw==
X-Forwarded-Encrypted: i=1; AJvYcCXdMJ1pneT803fMZwnnFiO2hKFbvVLGgxmO/Rmoj7sASs7Y6yiwbnoPdZjpmfsiMKSzITKWnac746FgLyoAnhgixg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw9/5iynRG9dltYNuTMEKdWmnqQQknYEY43qMcVtVDzXcBLWWol
	7qM1Dns6EPX9xg0he8iuKUJi+YBh8KhAG5dkEgWUq/tR1jmpbIJZKL/nJhRVkAc=
X-Gm-Gg: ASbGncu0D+w7MlqOMnD8xsvJzgz2miWDKOHwSEl1dSo6xUMm9xW8Lts43U+wJK3YFoH
	OgtcxWiQbPFqu3WnAPWfwbniPwA4uhSmEuIlpNwTULXaP5FDBV/IdOS3wWAB6LzcWCoQ4MamcF3
	jxwx8BUmm0usoWQOzYMROMjfsWRfojpIMh5FfgEWLi/kueUsGvcjjaaQ+ww9PgDEwAsEjD72Tcp
	wCNt5HrLGP2YDO3RK67DEcwpaTAF98SDazBdVvRBkRANNyloJDIF6+SNQMJBWZ+ltZTVMnwtoYf
	873elAs49UWXq9zDQUpTu4xDtbu4rAMFKYPFDcKKP0uiYw3P16d6dEOn5NI1XIC6Pzoa5axHMvN
	4zrboZLLrd0gcU6f4QR1U83vyIJ4dcC/diQ==
X-Google-Smtp-Source: AGHT+IGflX6Ec98zZCRDuUcxUOIWeyJznKlI6/eeafVEoaYhWZ8/xWMl6BDXNg1GcjayRgD2BHHrMg==
X-Received: by 2002:a05:600c:3b1a:b0:43c:fe5e:f03b with SMTP id 5b1f17b1804b1-43cfe5ef197mr145697125e9.30.1741873495996;
        Thu, 13 Mar 2025 06:44:55 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:cc37:5f80:1a41:4bc8? ([2001:8b0:aba:5f3c:cc37:5f80:1a41:4bc8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d0a74cfa5sm54205965e9.10.2025.03.13.06.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 06:44:55 -0700 (PDT)
Message-ID: <81d7c05f0a4e1e3f8615e4b7f1dfd2d736d6dd13.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rpm: fix redudant slash remove and add
 lacking dependency
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: artemiy.romanov@yadro.com, openembedded-core@lists.openembedded.org
Date: Thu, 13 Mar 2025 13:44:54 +0000
In-Reply-To: <20250313091557.4153150-1-artemiy.romanov@yadro.com>
References: <20250313091557.4153150-1-artemiy.romanov@yadro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 13:45:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212770

On Thu, 2025-03-13 at 12:15 +0300, Artemiy Romanov via lists.openembedded.o=
rg wrote:
> do_install:append() formats paths using sed in macro files incorrectly
> causing resulting paths to have format 'usr/*' instead of=C2=A0 '/usr/*'.
>=20
> Absence of debugedit-native recipe in DEPEDS variable results in
> incorrect expansion of '%__find_debuginfo' in usr/lib/rpm/macro file
> which looks like this:
>=20
> %__find_debuginfo	__FIND_DEBUGINFO-NOTFOUND
>=20
> Adding debugedit-native in DEPENDS:append:class-native is not fixing
> the problem while adding it in DEPENDS fixes that:
>=20
> %__find_debuginfo	/usr/bin/find-debuginfo
>=20
> Signed-off-by: Artemiy Romanov <artemiy.romanov@yadro.com>
> ---
> =C2=A0meta/recipes-devtools/rpm/rpm_4.20.0.bb | 8 ++++----
> =C2=A01 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/rpm/rpm_4.20.0.bb b/meta/recipes-devto=
ols/rpm/rpm_4.20.0.bb
> index 281fde1c82..004c847fb8 100644
> --- a/meta/recipes-devtools/rpm/rpm_4.20.0.bb
> +++ b/meta/recipes-devtools/rpm/rpm_4.20.0.bb
> @@ -46,7 +46,7 @@ SRCREV =3D "b3323786668cf99bc9aed7e60ccdab0bc25e19da"
> =C2=A0
> =C2=A0S =3D "${WORKDIR}/git"
> =C2=A0
> -DEPENDS =3D "lua libgcrypt file popt xz bzip2 elfutils python3 sqlite3 z=
std"
> +DEPENDS =3D "lua libgcrypt file popt xz bzip2 elfutils python3 sqlite3 z=
std debugedit-native"
> =C2=A0DEPENDS:append:class-native =3D " file-replacement-native bzip2-rep=
lacement-native"

Adding a build time dependency just to set a path correctly seems a bit
heavy. Can we configure the path instead?

The reason is we don't want to slow down builds unnecessarily and this
kind of addition will affect performance.

Cheers,

Richard


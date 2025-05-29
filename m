Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE4C5C54FB3
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 14:10:56 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.22022.1748527854852607817
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 07:10:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d2t98eMl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-450cfb6a794so4902955e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 07:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748527853; x=1749132653; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXHij1UAGiJCjfle4dYda3RXz97iejntW/PWoxrAUSA=;
        b=d2t98eMl3O0mbapgR73KogoxTeIxr3NUs7sQdzCrVLJnR13mXg5+uotg5JqMcxlDve
         sZfdH93bmXoEkwutovknVraFze1siCJixyqi78CzMIGC3MxyJYp0uSXo7M7r4D8fNqL+
         cApRY+5VSDD1BieExEsJ7pEdEYYrBhkKmB/yM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748527853; x=1749132653;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wXHij1UAGiJCjfle4dYda3RXz97iejntW/PWoxrAUSA=;
        b=W3SkeS8TP47iKbvQXHMyBnHgL+T2hJPv5+yHIKuhQKQ4ElZaM/Mmjs9YZqVMJOIdIU
         +oXxhXc7DWKWxk7NiW66oF2s0tYZf4Oa3LG11+fbBN6vz+HACpS7AnoJKhb2NqTULS83
         kAr7YpoNFlLOYaOUFdfJh4nw6g/OPqln/0Nzn5JxZDGoVn5gxTJiBJjEpYvWELl26j4z
         W5KWrH14YKM/7BucS8ZsxXEurK1Vk62wkfokgwmQobhoEBEbV+UrODfE/Czj92wc90X1
         09q7F5tpsxBTD5GB0RpqFq8DyfxQZMGd4/CCbHN71eTtcktbNx5R/q6T/Vn8ZCgBQAdA
         lTeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFlEGZN/534EVYksriXScGmQqniDEOiTGIMVnX2Z88Dae6nD20g2ovG92ElNeb5N/hXvEwKBOOlCA3tUJ63c7z3Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzr4mQNg+U96i+68Ss9P3pFTn2GfJzbRnMsmUt7H9mw0xSF+Jeu
	+G9XuIVnvtivGiSulf13oovRBlp47wr0EylcrnrsTSmzVQ/zMfi49ioL9W6teqDRdHQ=
X-Gm-Gg: ASbGncs+ET+fkrvYweuoeIUCF6DnfC2jSKHiGEYrpqBu8h2lXnZt4MZy5B+OnKFTiLV
	Wfew+5avBf85NIT9tZZFSoscnWHNPAFo0G5OQ1J0eKcwIDOuh7QNIRQsqUBplnOvkxhVc1lyyeG
	YXWa7+ioHyl32NIANW7QTqjSVDcHvrO/1tF+KOq+0ZnUZckWHErMDrCXUEy3LVaYdssQ0B6MqAR
	GrqgeE1eeGPB3n013qwIX0lbV1e29QFeGGyXRjUg+xyp1fA0szwYlwZsj+RgT1q+umpnhMqZWEU
	ztfErUvn/Rk2lLdh8taqa0hPefmpRBaeMgMavNa2nHauoWPYUydZCLqJ9x9Z8vtS0D2y9u2Jlvj
	Ou+Pq4uUXUmsoGKWCszGAjMuEtWa21r0aLwuxhsqBATahXg==
X-Google-Smtp-Source: AGHT+IGDQTYGUagROvRFExChTpwOy7Y/QIcmHEvJ8fNgnopv/kJgD6LJreqofd+Mz0FeqhTdaVgipA==
X-Received: by 2002:a05:600c:5116:b0:450:c210:a01b with SMTP id 5b1f17b1804b1-450d051587amr25475295e9.17.1748527852941;
        Thu, 29 May 2025 07:10:52 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1a5e:81:40ad:9da7? ([2001:8b0:aba:5f3c:1a5e:81:40ad:9da7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450cfc2d383sm21115165e9.32.2025.05.29.07.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 07:10:52 -0700 (PDT)
Message-ID: <49561b17ed66b3ac9872da5d5ea578317da40877.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 01/13] toolchain: Provide abstraction for
 choosing per-recipe toolchain
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Date: Thu, 29 May 2025 15:10:51 +0100
In-Reply-To: <20250522-clang-toolchain-v3-1-16cfc6d9891b@gmail.com>
References: <20250522-clang-toolchain-v3-0-16cfc6d9891b@gmail.com>
	 <20250522-clang-toolchain-v3-1-16cfc6d9891b@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 14:10:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217415

On Thu, 2025-05-22 at 20:52 -0700, Khem Raj via lists.openembedded.org wrot=
e:
> This implements a toolchain selection mechanism with existing defaults
> unchanged.
>=20
> It introduces a variable called TOOLCHAIN, which denotes the familiar
> name for toolchain e.g. "gcc" which selects GNU compiler + binutils
> as default C/C++ toolchain or "clang" which will use LLVM/Clang Compiler
>=20
> Additionally build-gcc is used for selecting native compiler
>=20
> TOOLCHAIN variable has a global fallback to "gcc" in configuration
> metadata. A distro can switch to using say "clang" as default system
> compiler by defining
>=20
> TOOLCHAIN ?=3D "clang"
>=20
> In local.conf or other distro specific global configuration metadata
>=20
> It is also selectable at recipe scope, since not all packages are
> buildable with either clang or gcc, a recipe can explicitly demand
> a given toolchain e.g. glibc can not be built with clang therefore
> glibc recipe sets.
>=20
> TOOLCHAIN =3D "gcc"
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0meta/classes-global/base.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 4 ++++
> =C2=A0meta/classes-recipe/cross-canadian.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0meta/classes-recipe/cross.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 1 +
> =C2=A0meta/classes-recipe/crosssdk.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0meta/classes-recipe/native.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0meta/classes-recipe/nativesdk.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0meta/classes/toolchain/clang-native.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 28 ++++++++++++++++++++++
> =C2=A0.../clang.inc =3D> classes/toolchain/clang.bbclass}=C2=A0 |=C2=A0 8=
 +++----
> =C2=A0.../toolchain/gcc-native.bbclass}=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 1 -
> =C2=A0.../gcc.inc =3D> classes/toolchain/gcc.bbclass}=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 1 -
> =C2=A0meta/conf/bitbake.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 ++--
> =C2=A011 files changed, 43 insertions(+), 9 deletions(-)
>=20
> diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.=
bbclass
> index 8215969c7bb37c1a1b91e260cd31714fee2db87c..1e7d6fe9b6ac34c17820d9f63=
78a5aa50f00dff4 100644
> --- a/meta/classes-global/base.bbclass
> +++ b/meta/classes-global/base.bbclass
> @@ -19,6 +19,10 @@ PACKAGECONFIG_CONFARGS ??=3D ""
> =C2=A0
> =C2=A0inherit metadata_scm
> =C2=A0
> +inherit toolchain/gcc-native
> +inherit toolchain/gcc
> +inherit_defer ${@oe.utils.ifelse(d.getVar('TOOLCHAIN') =3D=3D 'clang', '=
toolchain/clang', '')}

The fact we can't conditionally inherit gcc is bothering me quite a
bit. I did experiment a bit locally and I can certainly see the
challenge. The trouble is that even with the approach in this patch, I
think we're going to run into trouble as soon as we want to use clang
for native or sdk recipes.

The big problem is the ordering of the two deferred inherits (e.g.
native and toolchain/gcc) and how that interacts with class overrides.
You couldn't do something like:

TOOLCHAIN =3D "clang"
TOOLCHAIN:class-native =3D "gcc"

for example, since the class-native override isn't set until after
TOOLCHAIN is expanded in the deferred inherit.

I'll continue to give this some thought but I wanted to at least give a
headsup warning that this isn't going to scale as we might need it to.

Cheers,

Richard




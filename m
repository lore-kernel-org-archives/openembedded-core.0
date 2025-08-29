Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45B6CC8303F
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 08:59:10 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.9201.1756457943389523620
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Aug 2025 01:59:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dfqkA5BO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45b7da4101fso3616625e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Aug 2025 01:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1756457942; x=1757062742; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h1wM9G1ZbmRk3Web5KmyHDRaWlurNQxayTYErFErfpw=;
        b=dfqkA5BOIhuymGQvl8aXikjPXWZ3NvvA2RRD4Ggw2D75lKmBaDGsWhi9C1PwfmmHlb
         uXmCRTV523rx3fOb14VVtr3RfDCFoSRlj8yuO76MjvaOaISIv5qrpdO/VMGh84qqus8q
         DapRiesu9wbtAi97744OY5eSnJOTBjhLwsmEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756457942; x=1757062742;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h1wM9G1ZbmRk3Web5KmyHDRaWlurNQxayTYErFErfpw=;
        b=JVZY+ZdkaNg743fIwQqY5Xjdz2DXAaPeLXuV/nWGvo56QIXmT1FkwDwJeIVJHPHsZs
         v2O5s1fF6ez++LZUX0UoOLC9zpvWIi6tt1ziug6dNAfh69ybTJedVjcANjUJYgHdRqdn
         HzealSSDMJ+IQzHDh0kYY4LSm+9rfmpMuu2JWAE/bm05dk4J+16mdSWcvJVGnafJLZP6
         mXkb5mqCSD1kN2jOwvmiZrK6PpaTjRQ5bRwCkuUePnlvBWzsHqdN4Lhae8Q1gS/kgB4V
         RorkWNu8NzYbhPlSRMFPuCW4HESOJqLPnW1RQQz5QUIPaVC1SUuapn1x2QgyDlBNntD4
         xNtQ==
X-Gm-Message-State: AOJu0Yx3z3haqz0efGHwQUZvEjcHAoJQRaxBR93RUxZPnqorLLMw6AT6
	K6CidMs6jzUE2fMTLUVXc29BUj6mQ7r8KBXBo7Pr01pofln0cViWeSxQyktX2LNhciE=
X-Gm-Gg: ASbGncuvYwVAFLogTiHkZ+6nuxcybN1uBvaaACBbwxVolAoQ4JrI3yBNkuklUX4vtZ5
	aHc7wSkMqQWa+eRCYuRwbJLv/Nnu5cgGjKf7NJkSjzcxFUPg6/LI4ST3GYItvMGPwgHkIHqbrsV
	Ozp4r5gDdKlFVWPy8t9yKMMdgVpHSKcLGwpQzh3xxE+16J3ZqUmWDfuZ9F5S0Zecy76Z/iRLT1/
	BVKRFquitxBHjLx1i7wpE3CoenyKbqC8Kd4cDjRFeixdElapabmfdq0+4eQKm7ihH9ms35RIZ+h
	85wuLvltMsL/gQuhUYc0QaXe3YboRway+9aGgC5gqcq0JPNsT7wihcpxzdZ4rPRcrcXSwB+VSmO
	Sofb+7PSqw2FR2P3lVHTfHLxxj74KO9gr7jWwCCaxnz0I6OWrXAMeFqWgyZZwviQ6gwvPU3+Ht7
	pAFMcIvhSRFTU0CFkuL47DgTP/GFEVp9qG
X-Google-Smtp-Source: AGHT+IFoRdy72KrD3V9cT3LU/H/5505UsB5wJrFHLiA+z/F6kfE3jMG+wh0jGD8CYVoy47Dm82aR/A==
X-Received: by 2002:a05:6000:25ee:b0:3c7:44eb:dd77 with SMTP id ffacd0b85a97d-3c744ebe211mr18917966f8f.12.1756457941541;
        Fri, 29 Aug 2025 01:59:01 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fdba:6e3f:4f54:8499? ([2001:8b0:aba:5f3c:fdba:6e3f:4f54:8499])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d0c344f6e3sm1333461f8f.35.2025.08.29.01.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 01:59:00 -0700 (PDT)
Message-ID: <6562a0acac32a126076bf4d18f93779b1be5522e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gcc: remove .gnu_debuglink from SDK toolchain
 binaries
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: deepesh.varatharajan@windriver.com, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Sundeep.Kokkonda@windriver.com, 	SunilKumar.Dora@windriver.com
Date: Fri, 29 Aug 2025 09:58:59 +0100
In-Reply-To: <da5ba304-1f41-4e30-8c17-5ae597bd348e@windriver.com>
References: <20250825165026.681972-1-Deepesh.Varatharajan@windriver.com>
	 <CAMKF1so8YHaBFxw1SJq87Q4siPcTSY9kaoXzDqhOTcAGyWH8ZA@mail.gmail.com>
	 <da5ba304-1f41-4e30-8c17-5ae597bd348e@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Aug 2025 08:59:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222605

On Thu, 2025-08-28 at 17:09 +0530, Varatharajan, Deepesh via lists.openembe=
dded.org wrote:
> =C2=A0
> On 26-08-2025 08:29, Khem Raj wrote:
> > On Mon, Aug 25, 2025 at 9:51=E2=80=AFAM Varatharajan, Deepesh via
> > lists.openembedded.org
> > <deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
> > =C2=A0
> > > =C2=A0
> > > From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> > >=20
> > > SDK toolchain binaries (nativesdk and cross-canadian gcc) currently
> > > contain a .gnu_debuglink section pointing to separate debug symbols.
> > > These symbols are not required in SDK builds, as SDK users do not
> > > need production debug information on the target, only the compiler
> > > and headers for development.
> > >=20
> > > Including .gnu_debuglink increases disk usage for distributed SDKs
> > > without providing any benefit for SDK consumers and so removed.
> > > =C2=A0
> > =C2=A0
> > I need to understand the problem a bit better. Is the system not able t=
o
> > specify ignoring debug info from SDK, if we include debuginfo with the
> > =C2=A0binaries how does it change things ?
> > =C2=A0

> The meta-mingw layer currently sets INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1" i=
n its=C2=A0
> =C2=A0"gcc-cross-canadian_%.bbappend", which results in the ".gnu_debugli=
nk" section being=20
> =C2=A0stripped from the cross-canadian GCC binaries. This behavior leads =
to inconsistencies
> =C2=A0in the generated SDKs depending on whether the meta-mingw layer is =
included or not.
> =C2=A0
> =C2=A0So the idea is to make this behaviour as default in the gcc-common.=
inc file for both nativesdk=20
> =C2=A0and cross-canadian GCC. To ensure consistent SDK behavior and to re=
duce SDK size.
> =C2=A0
> =C2=A0
> =C2=A0The below are the differences in binaries :
> =C2=A0
> =C2=A0=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 Binary=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 Before=C2=A0=C2=A0=C2=A0 =C2=A0 After=C2=A0=C2=A0 =C2=A0=C2=A0 Di=
ff (bytes)
> =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -----------------------=
---=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 --------- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --------=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -----------
> =C2=A0nativesdk=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 x86_6=
4-pokysdk-linux-gcc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2165192=C2=A0=C2=A0=C2=A0=
 2165080=C2=A0=C2=A0=C2=A0=C2=A0 -112
> =C2=A0nativesdk=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =
x86_64-pokysdk-linux-g++=C2=A0=C2=A0 =C2=A0 2169288=C2=A0=C2=A0=C2=A0 21691=
76=C2=A0=C2=A0=C2=A0=C2=A0 -112
> =C2=A0cross-canadian =C2=A0 x86_64-poky-linux-gcc=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 2165216=C2=A0=C2=A0=C2=A0 2165112=C2=A0=C2=A0=
=C2=A0=C2=A0 -104
> =C2=A0cross-canadian=C2=A0=C2=A0 x86_64-poky-linux-g++=C2=A0=C2=A0=C2=A0=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 2173408=C2=A0=C2=A0=C2=A0 2173304=C2=A0=C2=A0=
=C2=A0=C2=A0 -104


Please do not use the mingw layer as a reference for anything! It takes
various shortcuts to make things work on a problematic and quite
different platform and it's hacks shouldn't be taken and applied
generically.

The debug link sections are only a handful of bytes and the size of
these should not matter compared to the size of the SDK. They do
provide valuable information about which debug symbols match the
binaries so "after the fact" you could find debug symbols to debug a
segfault thanks to our reproducible builds (for example).

In general we always generate debug symbols and package them separately
for target binaries (which includes nativesdk). Mingw doesn't do this
for various reasons, probably breakage if it's binaries are stripped.

Cheers,

Richard





Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A07C5AD49
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 22:09:58 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.7879.1748902194002512586
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 15:09:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OnbVzLAN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-451e24dfe1aso6122325e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 15:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748902192; x=1749506992; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4Z2VwDEa+mI7mzGUkxySD1/xV+hXBlZ2ARgi7cn7d9A=;
        b=OnbVzLANjfd0R4vArEK8y3pSVwQGmjTM2Ukzlgfx1zjeYJGpBIXmXMqe+RRTP2a93q
         83zOncu1b6KU8SDlY+zyRfQgSn2pX/Y1i0EdK7GGPw3cT4Q0mF8RmGR0kCHuZXtd46ib
         JeUCGRWVMwdjhXMBc71pzNSpsMeNgTITVZlPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748902192; x=1749506992;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Z2VwDEa+mI7mzGUkxySD1/xV+hXBlZ2ARgi7cn7d9A=;
        b=v2AyfiwuztrA//AVDSav85/pJqyzoAKcmBoUXTs6vIUUeesb5606ShBN+AHRpTyhuF
         blxlv5hnbG6j0X62SY+uTWQKNFDlhjKphrNy10104WVdAFjZg/hcM0frKSii/7LX9UBt
         9iYKtfpStNj59I1SxqFRsLQyAt6wzlscO4SOZddZBxFe7tEob/a3x26RQjVxKN7+mWw5
         cR8IZAp0LVFooDeMtcTM+z+UO4LMvgYCUmbA6LtRaD75SJsI/9iS+0CWW4QAhYYNDAZv
         r7x7IcMRVIH7J47FX4Uo2oHl9l3AqXBtAYkHLy2b6Fv/OinZqyXJdamEKxuvj+h/Ob0Q
         pLtA==
X-Gm-Message-State: AOJu0YyqSbRfUQKEALNBU/UTeC+5TzqdvhSoQxXqO1lIseWqUWHh/PgA
	YnQYZB5kWLMn8WJkee/rlviBKaEK9ebf7/e6Yza1mp0K8vcjykKGW2jXH0lzyIxJhDQ=
X-Gm-Gg: ASbGncsTvqjomYPI4vkg75QQjZAcHqKz835kr+niBXvQKg1rJSD4UMzj6ANjVN+fxWy
	ipHKg+piJIUPFBfDe22eOmdAMHHxZ2kradCeH0vaLoyT4HSJZfe9Ss2xWXvCuaJ7YSQLUEMI6Bw
	wb7mWdvOTSyWSs1y+BK66TSeaEZn/y5OKtbSTnp/F/ZN59usR8Sv4DqfzhfkrUibxy9HYOVYdlG
	P4xmqLxTniM9lSWEHSSrmIePje1837EIoKevJbP1BrU+oEJtmBf/OQr5nJcJJy9RLDgdaIKW5it
	7rehSUc8Q/bbwtXaC73SIuifLBXgK38D6qIpmKXLeSFRfoYkRHfhrLVQ6t0+0BedZog8O5iYisp
	W2htwtb4DYv8EBpn35azUDMEx+j9dG1yUH2i5O39PiIehXWK2c5s=
X-Google-Smtp-Source: AGHT+IFr8ShtdY+mmc9P5Lks+hS/G163qQTPeBa3AVmQb2RD/AVuvaN6ygxdAs0QJu1/0RR569vBag==
X-Received: by 2002:a05:600c:190a:b0:43c:fa24:8721 with SMTP id 5b1f17b1804b1-450d64f99b6mr158650635e9.17.1748902192206;
        Mon, 02 Jun 2025 15:09:52 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f190:efe6:7bd4:a92a? ([2001:8b0:aba:5f3c:f190:efe6:7bd4:a92a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d8000e3esm137036165e9.22.2025.06.02.15.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 15:09:51 -0700 (PDT)
Message-ID: <91a79864b7b9248c47f64365bdcd741c2a47ea0b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v5] pixmap: Enable openmp support with clang
 compiler
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 02 Jun 2025 23:09:50 +0100
In-Reply-To: <CAMKF1sp5W5f=s19nELw_3=6Mqd6iFAnROjCAiB+0grso+cX3Ow@mail.gmail.com>
References: <20250530205609.3185264-1-raj.khem@gmail.com>
	 <765485fbbd229582a973ccb8e9119eec21fb2cbf.camel@linuxfoundation.org>
	 <CAMKF1sp5W5f=s19nELw_3=6Mqd6iFAnROjCAiB+0grso+cX3Ow@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 22:09:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217742

On Mon, 2025-06-02 at 15:07 -0700, Khem Raj wrote:
> On Mon, Jun 2, 2025 at 2:41=E2=80=AFPM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Fri, 2025-05-30 at 13:56 -0700, Khem Raj via
> > lists.openembedded.org wrote:
> > > pixman's meson detects openmp support and if it finds it in
> > > runtime then
> > > enables it, this happens for gcc via gcc-runtime, however for
> > > clang, it
> > > does not. In some cases e.g. mips it enables it during configure
> > > only to
> > > find that clang can not find the libomp during linking.
> > > Therefore, add
> > > the dependency on openmp when using clang compiler. This ensures
> > > consistent
> > > behaviour across architectures.
> > >=20
> > > Disable internal assembler on mips since it can not handle the
> > > inline assembly
> > >=20
> > > Turn openmp into a packageconfig
> > >=20
> > > openmp is not yet ported to all architectures e.g. RISCV32/PPC32
> > > does not have it
> > >=20
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > > v5: Remove openmp on rv32 and ppc32
> > >=20
> > > =C2=A0meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb | 13
> > > ++++++++++++-
> > > =C2=A01 file changed, 12 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb
> > > b/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb
> > > index c1c71fd4202..925a7d7b29b 100644
> > > --- a/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb
> > > +++ b/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb
> > > @@ -23,6 +23,17 @@ LIC_FILES_CHKSUM =3D
> > > "file://COPYING;md5=3D14096c769ae0cbb5fcb94ec468be11b3=C2=A0\
> > > =C2=A0
> > > =C2=A0inherit meson pkgconfig
> > > =C2=A0
> > > +OPENMP ?=3D ""
> > > +OPENMP:toolchain-clang =3D "openmp"
> > > +# openmp is not yet ported to rv32/ppc
> > > +OPENMP:remove:riscv32 =3D "openmp"
> > > +OPENMP:remove:powerpc =3D "openmp"
> > > +
> > > +PACKAGECONFIG ??=3D "openmp"
> > > +PACKAGECONFIG:class-native ?=3D ""
> > > +
> > > +PACKAGECONFIG[openmp] =3D ",-Dopenmp=3Ddisabled,${OPENMP}"
> > > +
> > > =C2=A0# These are for the tests and demos, which we don't install
> > > =C2=A0EXTRA_OEMESON =3D "-Dgtk=3Ddisabled -Dlibpng=3Ddisabled"
> > > =C2=A0# ld: pixman/libpixman-mmx.a(pixman-mmx.c.o):
> > > @@ -36,7 +47,7 @@ EXTRA_OEMESON:append:class-target:powerpc64le =3D
> > > " ${@bb.utils.contains("TUNE_FEA
> > > =C2=A0EXTRA_OEMESON:append:armv7a =3D
> > > "${@bb.utils.contains("TUNE_FEATURES","neon",""," -
> > > Dneon=3Ddisabled",d)}"
> > > =C2=A0EXTRA_OEMESON:append:armv7ve =3D
> > > "${@bb.utils.contains("TUNE_FEATURES","neon",""," -
> > > Dneon=3Ddisabled",d)}"
> > > =C2=A0
> > > -EXTRA_OEMESON:append:class-native =3D " -Dopenmp=3Ddisabled"
> > > +CFLAGS:append:toolchain-clang:mipsarch =3D " -fno-integrated-as"
> > > =C2=A0
> > > =C2=A0BBCLASSEXTEND =3D "native nativesdk"
> >=20
> > I think this needs more discussion or potentially a better fix.
> >=20
> > Potentially the test for openmp in pixman is wrong and it shouldn't
> > build if it can find the header but not the library.
> >=20
>=20
> This is worth exploring more and if we can make the test robust it
> will benefit overall

Agreed.

> > Alternatively, if the openmp library can't be built, why are we
> > shipping the header? Should we delete it in that case?
> >=20
>=20
>=20
> Header is installed by gcc-runtime package

We could delete it if the library isn't present...

You have to wonder why the code is installing it if the lib doesn't
exist. Is that standard upstream behaviour?

Cheers,

Richard


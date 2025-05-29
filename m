Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 064C4C54FB3
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 20:06:19 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.2415.1748549173606698949
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 13:06:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dBxYz5Kt;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2e3dea42465so860354fac.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 13:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748549173; x=1749153973; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MJxcyYy1OdxHX6oPqxwMmXcj2bTi17HPKZ+KBa6grM8=;
        b=dBxYz5KtAnAk9XI30aTZ7T5hr8qXedUUzGgPZrFuD9cIlzp1PxevQj7TIkNWTLGmht
         67SqQ2fLW+0/Wt/gpkA/fcKiSKxIARCommE8UYUdpUK8+1AOgePzxgdaW9+vw6rbTU6T
         TUR/f1cjlYtddG6QJbCb4Fz4Uf7rO/n/ll4TFuAXO1fibVZzaUp/9OG9N7WjomtD1K1L
         z20IG0AFyrXEIdNBYzyo9+XVvgi/EQ9bDMECYNYMn4bdS6Vt3RifLWnnpvtuVvmUBqwD
         bE3JAa1kUVCR8QgWfHsiJeGIy9rLxFpWDIPYSUJPUttAgfmhopIzFYwEFYRsjllYj/bx
         3KTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748549173; x=1749153973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MJxcyYy1OdxHX6oPqxwMmXcj2bTi17HPKZ+KBa6grM8=;
        b=d3tFG1wYcqRnL2MFSNphC2PkhWWke3iSaICZHGIqL4XnIGWwPgGHLUyKb5ABLytDOi
         c4uZjf2k2lOoxpytHEy2x7k+obnRhvs57qFf88QKcz8VnOnzkqQGZREobyOHD/uAzNfY
         v2132f9KUxHxpnlZt9qQB8265hsqKSj8skw8vEoymecgdpSDKl+x+csE7vSfWmHtsk4i
         8fKnoXxN8t63N8Z2uo/i70V0o+Afws6ZjwV3V1A5U/YlX9FXvv/2+kIw6vsPKy7UOOc+
         svIqhli6CGL/KN4vQYprxk0ewYF9iNucbqonjo4+mec3IbYB6siJDFogf+f+NQv2G6dq
         10uQ==
X-Gm-Message-State: AOJu0YyVkLlTV8fsbCXxsOmzqxX/+5BHGXGrse+KdHSP/V3L6w6cu/xz
	hFffLkp0ubfdPkrANa+t1OVoZySrvl1UzueMTxrw8TFmRVHX+aFgzYg38GLXb0n1qhS3fgJSKzJ
	+R0z03SzNJ3iX5Bk4inmuqbkC7JXdLt0=
X-Gm-Gg: ASbGncs4+gbEa0hyRtDFNUmqk9A4NispTdIBlvplPgnBTfy7ACz+Yfq/egMDQZ/zN3Q
	U+34HAlY1LqahVaVEIITJ9dK3JHhjElG1BXVCeBCGglazUTGiVrj9xEXuv5HI8HkiO8wYJdviL0
	HuVDeio6ocGZQA5FxliQ9CmY5B2c6zwoFZ
X-Google-Smtp-Source: AGHT+IEErv8dRQpo2nwGBEfXasqHquPirmBVtyUM0dBCh8G/WtQLS6koyS4WPuhpb+FRB/CGI711XeTdbyjx2hLfiKs=
X-Received: by 2002:a05:6870:70a:b0:2c1:4d18:383a with SMTP id
 586e51a60fabf-2e8fc82f147mr1968654fac.3.1748549172728; Thu, 29 May 2025
 13:06:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250522-clang-toolchain-v3-0-16cfc6d9891b@gmail.com>
 <20250522-clang-toolchain-v3-7-16cfc6d9891b@gmail.com> <2b0c3c19b6800989d7ebdd1b693a54ac0e111b44.camel@linuxfoundation.org>
In-Reply-To: <2b0c3c19b6800989d7ebdd1b693a54ac0e111b44.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 May 2025 13:05:46 -0700
X-Gm-Features: AX0GCFtzhe9F31gSA8MtSK_syusIeyQko7EaPChphW-8llec16_yYu2MnKGckvU
Message-ID: <CAMKF1so0ByoBJOJ1sVO8Whtmsqx4m0woZcPB1ijTnqB5diwkQQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 07/13] pixman: Fix build with mips/clang
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 20:06:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217434

On Thu, May 29, 2025 at 2:23=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2025-05-22 at 20:52 -0700, Khem Raj via lists.openembedded.org wr=
ote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb b/meta/rec=
ipes-graphics/xorg-lib/pixman_0.46.0.bb
> > index c1c71fd42023fbd8c82d49ff623a981139f5ac7e..0c779ac3b4e6d035d9105c9=
8aea0560a71d57ba3 100644
> > --- a/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb
> > +++ b/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb
> > @@ -6,6 +6,7 @@ including trapezoids, triangles, and rectangles."
> >  HOMEPAGE =3D "http://www.pixman.org"
> >  SECTION =3D "x11/libs"
> >  DEPENDS =3D "zlib"
> > +DEPENDS:append:toolchain-clang:mipsarch =3D " openmp"
> >
> >  SRC_URI =3D "https://www.cairographics.org/releases/${BP}.tar.gz"
> >  SRC_URI[sha256sum] =3D "02d9ff7b8458ef61731c3d355f854bbf461fd0a4d3563c=
51f1c1c7b00638050d"
> > @@ -38,6 +39,8 @@ EXTRA_OEMESON:append:armv7ve =3D "${@bb.utils.contain=
s("TUNE_FEATURES","neon","","
> >
> >  EXTRA_OEMESON:append:class-native =3D " -Dopenmp=3Ddisabled"
> >
> > +CFLAGS:append:toolchain-clang:mipsarch =3D " -fno-integrated-as"
> > +
> >  BBCLASSEXTEND =3D "native nativesdk"
>
> See the comment on libjpeg-turbo. Should there be a -f here or not?
>

right, we will fix libjpeg-turbo to match what we have here.

> Cheers,
>
> Richard
>
>


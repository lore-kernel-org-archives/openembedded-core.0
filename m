Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC8F8C36014
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 10:36:29 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.5005.1743590186277606903
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 03:36:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S8wBC/LN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39149bccb69so5757438f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 03:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743590185; x=1744194985; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AOsbiRx1tgu9js4H5pD89xfni0FtYxW15Z0SinqsBMk=;
        b=S8wBC/LN0blMhPhcoWttqx5TG0gElsOd/sz7Z7hbunORlf//NcD1xWNjc3SwwBniDF
         te2L5BZb/JzknzLuwAKLvuj1KuZsKG5KSaSjfFJPdfgcR5HTXsMtwjKxfRqp+MVjgMbN
         l9j4P+oH8SBoSojCgCwbyw52EGwfh9YMJuTYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743590185; x=1744194985;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AOsbiRx1tgu9js4H5pD89xfni0FtYxW15Z0SinqsBMk=;
        b=A9JF4NfOIKr6ByuBIJo/PNcB8W6KTggOXmbPBPkLn6HPenKIoFWiHGiOW6NzlPiCfV
         l7cTRMH+iSewJ9ozWbcqsHxGWEgxgtfe6y0qvfME4wJ+yp4W3DpzBC2w/ayn7A2xIf8G
         sfgl3MpY5PJfdrcCwbgytDeZdkz88a2iUqm16MOFNyE5+Or3tP82fY3fe8a2bXFFWI24
         qyqwZTrzRCm/S0gPqVnCx9Qi7HgpXimqx/YIsm24UFw4ayWj/3D7RH7MnEkjyQSFUbrV
         teuzbNpmaoWjZghNXuv2mHKrmn75by6BXlDTVLZOHOEiM/D/QXxpOuatSGcydAAsEj/R
         NrLw==
X-Forwarded-Encrypted: i=1; AJvYcCUZm85CCWVBiBXxCFpNFxBG1QRROodP6OwKW6vfCxIXrJI4W3+7lIO0qD24VLnRligY/caPD0X4MicfWgs9S2cnXw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzMptSnvrfFhu5tJvssfM6kZAEhLWlvtyBadDjoe4Nc4qt38lOc
	kLFa0F84H8qOKa5TqvfxDKnYWuhGJFBPdRSo1+FZxUJeW2suMcgkWAbYgzQ8AIL5E6DbO9aw0PI
	H
X-Gm-Gg: ASbGncumnqc/OYGFhKomsOg6G3u8RRWElh9wgcLtWVo3wy48yZf4vDgoi6QbVZMjhNG
	NHGLUt0Bogw9kbE1AOLq097jbyehbVACMMxyZnpWOS/DCWfaqTaJ+XwLz2OXwfwSy1RC+1oLc+k
	aHjahHvTZwdDR1Bp3x88XXcE00xSnS0suql/7QkEatuh0t8NtrInYu0C2bIW+3PGl12IKK3dENj
	u5vbvFEKs8puc8cc2qjNR/ubcqr1eSFbKQsX46dLh7h+Z6E+RbXrBL8OJgSmwVjWGxGVUQfo1Td
	/CQxl/zmaCmjmgrcafdW4PGXbe+CiMJ6Elkm0Ccu2MJzoqMid9EP0spqYHo+HjEOVNSz2T6JtyW
	jiyuN76UzM40QSv/MjC2fkYLBNno113r8X7WffiQwOz/K
X-Google-Smtp-Source: AGHT+IFE8qQAxifRxK3Hptumgr1ED3j2plPEACCiU5cVu8xGWw3DCtWR3KjpIVwYKKw3McQ3LKZEOQ==
X-Received: by 2002:a05:6000:4006:b0:391:2fe4:de0a with SMTP id ffacd0b85a97d-39c29737f7cmr1607645f8f.2.1743590184616;
        Wed, 02 Apr 2025 03:36:24 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:24b8:b374:749c:8558? ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb60cba2dsm16440825e9.18.2025.04.02.03.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 03:36:23 -0700 (PDT)
Message-ID: <bfad7cbea9b1fe1bda1d59261508beecbd6ee7bf.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/1] libunwind: update 1.6.2 -> 1.8.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: adriaan.schmidt@siemens.com, openembedded-core@lists.openembedded.org
Date: Wed, 02 Apr 2025 11:36:22 +0100
In-Reply-To: <20250327141258.2690906-1-adriaan.schmidt@siemens.com>
References: <20250327141258.2690906-1-adriaan.schmidt@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 10:36:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214259

On Thu, 2025-03-27 at 15:12 +0100, Adriaan Schmidt via lists.openembedded.o=
rg wrote:
> Releases >1.6.2 are not hosted on the savannah server, so changing downlo=
ad location to github.
>=20
> Signed-off-by: Adriaan Schmidt <adriaan.schmidt@siemens.com>
> ---
> =C2=A0.../libunwind/{libunwind_1.6.2.bb =3D> libunwind_1.8.1.bb}=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
> =C2=A0rename meta/recipes-support/libunwind/{libunwind_1.6.2.bb =3D> libu=
nwind_1.8.1.bb} (92%)
>=20
> diff --git a/meta/recipes-support/libunwind/libunwind_1.6.2.bb b/meta/rec=
ipes-support/libunwind/libunwind_1.8.1.bb
> similarity index 92%
> rename from meta/recipes-support/libunwind/libunwind_1.6.2.bb
> rename to meta/recipes-support/libunwind/libunwind_1.8.1.bb
> index b2e7ec7719..faf056762f 100644
> --- a/meta/recipes-support/libunwind/libunwind_1.6.2.bb
> +++ b/meta/recipes-support/libunwind/libunwind_1.8.1.bb
> @@ -6,14 +6,14 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d80c8ed4062=
b8339b715f90fa68cc9f"
> =C2=A0DEPENDS +=3D "libatomic-ops"
> =C2=A0DEPENDS:append:libc-musl =3D " libucontext"
> =C2=A0
> -SRC_URI =3D "http://download.savannah.nongnu.org/releases/libunwind/libu=
nwind-${PV}.tar.gz=C2=A0\
> +SRC_URI =3D "https://github.com/libunwind/libunwind/releases/download/v$=
{PV}/libunwind-${PV}.tar.gz=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/mips-byte-order.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/mips-coredump-register.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/0005-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/0001-src-Gtrace-remove-unguarded-print-calls.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> =C2=A0
> -SRC_URI[sha256sum] =3D "4a6aec666991fb45d0889c44aede8ad6eb108071c3554fcd=
ff671f9c94794976"
> +SRC_URI[sha256sum] =3D "ddf0e32dd5fafe5283198d37e4bf9decf7ba1770b6e7e006=
c33e6df79e6a6157"
> =C2=A0
> =C2=A0inherit autotools multilib_header

I tried adding this into a build for testing which showed:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/1334

ERROR: libunwind-1.8.1-r0 do_patch: Applying patch '0005-ppc32-Consider-uco=
ntext-mismatches-between-glibc-and.patch' on target directory '/srv/pokybui=
ld/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/=
libunwind/1.8.1/libunwind-1.8.1'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/musl-qemux86/build/bu=
ild/tmp/work/core2-32-poky-linux-musl/libunwind/1.8.1/recipe-sysroot-native=
/etc/quiltrc push', 0, 'stdout: Applying patch 0005-ppc32-Consider-ucontext=
-mismatches-between-glibc-and.patch
patching file src/ppc32/Ginit.c
Hunk #1 FAILED at 48.
Hunk #2 FAILED at 76.
2 out of 2 hunks FAILED -- rejects in file src/ppc32/Ginit.c
patching file src/ppc32/ucontext_i.h
Hunk #1 FAILED at 46.
1 out of 1 hunk FAILED -- rejects in file src/ppc32/ucontext_i.h
patching file src/ptrace/_UPT_reg_offset.c
Patch 0005-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch does =
not apply (enforce with -f)


Cheers,

Richard


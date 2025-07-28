Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE5FCC83F17
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 17:22:18 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.86991.1753723330721202158
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jul 2025 10:22:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YOC8HRB3;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7183dae670dso41691007b3.2
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 10:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753723330; x=1754328130; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xFrqTJIwFtFoCLAJ4nbsZP58s2vHgyVQ9s8jtEg20VI=;
        b=YOC8HRB3WsVy9mno8AZaCPlXZ+1cC/KCSj0MsqEwRfRfx9ey8S/5O2X2lVx5PO9cfa
         Irh8xq5xblbrGMbya1NSCNO1oDvekjFBwlcoXNFvsxXsi6frvvQJKhv7YChNdrXbXVk3
         O2vzqS28u7uYc1Lscn9wgdN8vqpdfDMz9A1H5vnZF3HO5VfBlgxZeOwhbkVcFlS0j8Q2
         x+P79k1ER9gFeYqPGQTlDMX8yB/rZzkyb+RS0ZNFLhisnI+t0Cj3/fE5lq93nIJeUpJV
         tGur4O7YfeLwdMu1ceuQ8xwX0AJs495fOxB86kGCyNYSCZbhDFzeCZEv9rYCwmXOPDwG
         6PKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753723330; x=1754328130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xFrqTJIwFtFoCLAJ4nbsZP58s2vHgyVQ9s8jtEg20VI=;
        b=H9uUCIBuNm2Q1PRUPBrWxgKlCp1b39lozBJJ1nNiT6goZtGx+R9tXHrRxDEiGfW5II
         hXIKecaMwUCSyg7pjn3RimuCJueooBF80Q27Im+9qzXMsm1SIyGrIyLWyYG6ofBxLPF0
         piAVnKlLu34SSIsN67YBkrrUn5qfEaOkC+c49SktF73pKqqSu0yoLwm9iRO0CvOZryX3
         wnDDFNWNct9eTOvBp5+NzxySo6V84X7JXCb38WcJ6UlVwCC+hXbeLCrGbpqNsXhxadut
         ew8ujnowlMGcAb6iGGR6MyRs7trptwzLm0AhFJIuSL0sqv4Q4ogkbv4Aol8e4tt6cQ/f
         9zHQ==
X-Gm-Message-State: AOJu0YzmO6NDCL3bUE9bXJR4N8NIuoS1vtJ0XpklZmqA0U8K9qRo1A3R
	dYx3pQru0KPS2XCWjwuxSbklEWOwMkpW9OGxD5NMjbjloETQbIh3LKF+w/CsEaMjohlWyFquA4/
	IBw6m+fvtRc2YOXxppKJ4djP72FU1TEWB1rASjWw=
X-Gm-Gg: ASbGncvbXu7iJVpFtQaJ/SnwuaoFNEgQ0zWpkCoONYSYhj4vFb0n9Wy3dHhEH/vC1NW
	0KzD/UQT0a3f382XcpWytLKzFZlwQwCoPvDXhznqEH2RNR1bTnOvVBjomZoZIs4615mLQT+oFOx
	B50MRH241JiZPMorupTKXXWnfDmTvLB/uAfgzBfTbaDXa6C3yGZBHCkgOor1lsycBxk8/CLOG+8
	c0zrs/1wML0Pt9GUkHDZ6UHD8tnti8X4ZvCWSaq0ZLVqg==
X-Google-Smtp-Source: AGHT+IGh+4EzhKyMfDNHh8C6F0ocFrxwhESmfO/Q4bVEeRTJ+zmKl/nga5r4tlsXroqkhCaulWue1ZV7moZ+YRl0kCQ=
X-Received: by 2002:a05:690c:7306:b0:70e:7a67:b4c5 with SMTP id
 00721157ae682-719e3471502mr151736287b3.36.1753723329677; Mon, 28 Jul 2025
 10:22:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250728032045.2783514-1-raj.khem@gmail.com> <20250728032045.2783514-2-raj.khem@gmail.com>
 <ABC201DB-B815-4F6B-B22E-A54446FA2FEE@arm.com>
In-Reply-To: <ABC201DB-B815-4F6B-B22E-A54446FA2FEE@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Jul 2025 10:21:42 -0700
X-Gm-Features: Ac12FXyHSbalYi0ObS3Ff6NRFdYJjnHHQgITlTXCESbPitWvBty5D6ZxdVwuzOw
Message-ID: <CAMKF1srz1x8hN++hiGpUJqJvUsPbUPEe1QWukHEejwq162kMnw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/5] clang: Drop dependency on spirv-tools-native
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 17:22:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221020

On Mon, Jul 28, 2025 at 7:30=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:
>
> On 28 Jul 2025, at 04:20, Khem Raj via lists.openembedded.org <raj.khem=
=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > spirv is now a separate recipe.
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > meta/recipes-devtools/clang/clang_git.bb | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-de=
vtools/clang/clang_git.bb
> > index 830c0282cd6..5f0ddd1a2db 100644
> > --- a/meta/recipes-devtools/clang/clang_git.bb
> > +++ b/meta/recipes-devtools/clang/clang_git.bb
> > @@ -185,7 +185,7 @@ EXTRA_OECMAKE:append:class-target =3D "\
> >                   -DLLVM_LIBDIR_SUFFIX=3D${LLVM_LIBDIR_SUFFIX} \
> > "
> >
> > -DEPENDS =3D "binutils zlib zstd libffi libxml2 libxml2-native ninja-na=
tive swig-native spirv-tools-native llvm-tblgen-native"
> > +DEPENDS =3D "binutils zlib zstd libffi libxml2 libxml2-native ninja-na=
tive swig-native llvm-tblgen-native"
> > DEPENDS:append:class-nativesdk =3D " clang-crosssdk-${SDK_SYS} virtual/=
nativesdk-cross-binutils nativesdk-python3"
> > DEPENDS:append:class-target =3D " clang-cross-${TARGET_ARCH} python3 ${=
@bb.utils.contains('TC_CXX_RUNTIME', 'llvm', 'compiler-rt libcxx', '', d)}=
=E2=80=9D
>
> Have you verified there=E2=80=99s no change to the output after this? I t=
hought that spirv piece was used by the codegen for optional backends.
>

it was used when libclc was being built as part of clang recipe

> Ross


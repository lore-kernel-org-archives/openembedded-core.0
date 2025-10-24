Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB2DCCCD1BF
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 02:26:56 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.745.1761272814655937906
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 19:26:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VIfNeI3f;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7815092cd0bso18168697b3.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 19:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761272814; x=1761877614; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/wRvE19MCoqraMmQgRs3fcHetpZRucOJtDwViWztiEQ=;
        b=VIfNeI3fix2q+c+24/JjEiQn7FR1PbkZowFhOHh8eVcHKkYAOodImoyJqHQB9tFkuc
         ZxsmM2jHZeOswGzzSRMx4LdOATYp6V7K5+Ur/yBlIxvORke2o3UmOP6xLm5dn2sH1FWN
         9q9PB3V7F72JnUaQNon4McQINWc66D/QltXdkoTzle8UQhCmQU9GJ6Mip/vqKK7hkHny
         Tz/Mk87wxxIcTXFKL7+h3ra0/AGd2ie/kNguI0gluLVCsvhwEPM2I6Xkl2FIXNiDBaZw
         3PSqevqCj/UpBjZoxn9mc3xvL8iaSfS4/hTfuwai65aRcEpPmMfY7s4rki9Ni7Pn6+bc
         VLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761272814; x=1761877614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/wRvE19MCoqraMmQgRs3fcHetpZRucOJtDwViWztiEQ=;
        b=Z5gqR/1P0MOH5pWUoiEyM5gqCMmn3mZGzJNiPVrjTlys1iXTX0zXCO7K+uyUhPbv8u
         EL/JQgw+TrrvbgUjNaDTjXqrdqrgJH0c0BYre6XxN+BawoVB0QbXvYzLk0LSUdIUWnXc
         2JU85hOqJEAzqr4w1SxhuH7so/XCOwx+ntl0V/R7TdRLRZP6tMIV19hZ+uGTtt3g/UUR
         eHEKWgkr17Q58bEj1F5fDi7qXcnYJpz3+AvcT6nCuNtfMm+zwM+dx5n9Ss29UsifJcwm
         h3cO6pVx2qOyuAeQHBsecrLkLVucEOuEYqQBEn7fgJssZ2IXhP1Wpys4tydqNqB/hVvD
         d4xA==
X-Gm-Message-State: AOJu0YzvkD+YVKvEScXS3+VAH7V+HJaO7FVWzpNmzMXBtmL54tgvkq7r
	DbFWMU9GIvkAGNKvzrmTpFhU4obKGo3J+lXMRbCMxZypxvNqW+4wsbwkW6i0i/K82fakphe+pkD
	I6fs+QlOHjOU/fFAGGYZTILxdqJcRRBA=
X-Gm-Gg: ASbGnctp1hfA3k4OmubGjBju1hWzjJPPlELeNL2zFZnQCfjOUD2K0fX2NXs3B+CMdIJ
	6azW77oyQJsGumzXJBbui5v3LqmD2DyxUo/H5XF0+8TRMmV22GFEy17GlugH6iIearp7KRwxR1d
	6hN2nzdt7Z7+/lzjuylG8aw3DOEPHzwswFQP25OUpKD2mKX+MNg1vGczjSRqT06Yil73bGGTQ4n
	9YL/9m9mC3n0VcY+1N7/IavqX9kXOZO4mA8NuWYYm7UxPR+f4y2AsIKpHYMD/l85/Omew0KQENz
	lLYwKpDrLVkOupH+TS5s5bHyd6us7tb9cdKxZ95NvSPwTAcx8k+tFl0ekmR6zLyWyvJ+J64FXui
	w
X-Google-Smtp-Source: AGHT+IG2VmXM0Jgn9HeSW1xdegpsD/J0FfMR7wSNNGQ46BaRnapDeuNsd+Ql8SGIAIdqy40yp/xXpt6Fk2MZJVq/zCY=
X-Received: by 2002:a05:690c:6011:b0:785:c086:aa51 with SMTP id
 00721157ae682-785c086ad9bmr128042667b3.25.1761272813712; Thu, 23 Oct 2025
 19:26:53 -0700 (PDT)
MIME-Version: 1.0
References: <20251018070621.3456800-1-raj.khem@gmail.com> <94242022-56F6-4ECB-8B60-28B76B643F8A@arm.com>
In-Reply-To: <94242022-56F6-4ECB-8B60-28B76B643F8A@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Oct 2025 19:26:27 -0700
X-Gm-Features: AS18NWDet8xN2m_qlehPA4V46RJjddhl5vs9NkOJ_GCv8KAYCbmIsmx5PpNMF7M
Message-ID: <CAMKF1sobxPUsVOH11+-K_x2x-GPvt_hvYSbhGx8Qvqp2vVLpwg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] classes/toolchain/clang: Add placeholder for
 dynamic linker in cross-canadian packages
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 02:26:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225278

On Thu, Oct 23, 2025 at 5:53=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:
>
> On 18 Oct 2025, at 08:06, Khem Raj via lists.openembedded.org <raj.khem=
=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > clang-cross-canadian is just symlinking into nativesdk-clang unlike gcc=
 which
> > has separate binaries and they have inbuilt dynamic linker specs. To he=
lp clang
> > built cross-canadian binaries add it via cmdline option here, cross-can=
adian
> > binaries are only usable on installed SDKs, and these paths get re-writ=
ten with
> > correct SDK specific linker during SDK install relocation process.
> >
> > This helps clang built cross-canadian tools e.g. from binutils-cross-ca=
nadian
> > be relocated correctly on SDK install.
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > meta/classes/toolchain/clang.bbclass | 1 +
> > 1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/classes/toolchain/clang.bbclass b/meta/classes/toolch=
ain/clang.bbclass
> > index b4a1c180f6a..9c1204171fe 100644
> > --- a/meta/classes/toolchain/clang.bbclass
> > +++ b/meta/classes/toolchain/clang.bbclass
> > @@ -32,6 +32,7 @@ TUNE_CCARGS +=3D "${@bb.utils.contains("DISTRO_FEATUR=
ES", "usrmerge", " --dyld-pre
> >
> > LDFLAGS:append:class-nativesdk:x86-64 =3D " -Wl,-dynamic-linker,${base_=
libdir}/ld-linux-x86-64.so.2"
> > LDFLAGS:append:class-nativesdk:aarch64 =3D " -Wl,-dynamic-linker,${base=
_libdir}/ld-linux-aarch64.so.1"
> > +LDFLAGS:append:class-cross-canadian =3D " -Wl,-dynamic-linker,${base_l=
ibdir}/ld-linux-x86-64.so.2=E2=80=9D
>
> You=E2=80=99re missing a second line and arch overrides for aarch64, yes?

well no, ldso gets re-written by SDK installer and it does the right
thing when it replaces it on arm64 SDK host.

>
> Ross


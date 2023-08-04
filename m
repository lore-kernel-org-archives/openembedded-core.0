Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DCFFC001DF
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 14:19:49 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web10.12234.1691158784046199536
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Aug 2023 07:19:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=nzJtaxnQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6bcd455fc88so645021a34.2
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 07:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691158783; x=1691763583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6bb1n0uu6V9wDc5+qWXk/kMXV5G7+Jyo85IOb6Nj9Bg=;
        b=nzJtaxnQ1G+p4EOfaQIwd55BB+2kjkb5VDcCH77tdaOhe2N1MaRgUtnlmjBQmc5TI4
         nNrRB5PHJEUSJetlt5zifPPZcUFqmLamaRBpPIf01YB2CFO0Xpk2/RANta0KrxOJTpX0
         SuQx3jfBzmjnn+5lIhzQPqcfXiyplHtfA7m4t2ZiDly+BG2XPRbgj3MTKeybfwrqy30M
         x9iymxi/4nZL61dW1Z1nBrU+6HaOEhVyZdhp1muDXl4Xih653hDbq0aPTxDYVaupObX0
         VJw2X7NFG2lXwGdD2Ejj3Tyi+PtNObB+XZhIMc3u39GqccS4s6YNjPVewHt9CUjQGLL7
         r2Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691158783; x=1691763583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6bb1n0uu6V9wDc5+qWXk/kMXV5G7+Jyo85IOb6Nj9Bg=;
        b=DpQxLo6O7FV+NEGxtVnELb1AndLIWWGUgm4z2ckpgpbhosrJZnbDjXrGumf42PL9ai
         0915k8+RnyM0hn1hVcRjnDKCQbZeZAn9bYBvhOsbKJRcgc/w3+5D6uo6MOoWVQVrAWQc
         JrknokI1ohA20iBGqazmAt/tDfEBhFfOXfhi2SPY49IYFV7PK5j9UMvBnRILvLF2NkF9
         ew0rh/muWmdx4ESVBDWSvJAJ2TOS7xGZwzPZhrOiBQ9aM7Hnvnn+qRIavEeWtNJ8LmOn
         bUHT5QNTW/cPm3J+WFGLtC0wy0FgaL2NBnM/oG9WfRTp42qG8wByzLUAbcFxvD4fLT+S
         KCiw==
X-Gm-Message-State: AOJu0Yycqdsw3PbiwREz8/bMklP9yv9oaIfLdWR/A92EnznSDjHFp2qN
	7SSLI9qfD4+wT2EZ0cfYFoaGoKGwjamIqURbKrT6m/VEhJA=
X-Google-Smtp-Source: AGHT+IF99b0cpKuQBmbcbk/IYDdKqJTIyhggZ9/jArP9t/krw4QC+yKPOxlsbuCInTM10qrMWOEqJ+2U7KvldLB17I0=
X-Received: by 2002:a05:6871:814:b0:1b7:5ede:ddd6 with SMTP id
 q20-20020a056871081400b001b75ededdd6mr1957355oap.25.1691158783157; Fri, 04
 Aug 2023 07:19:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230725035626.984709-1-raj.khem@gmail.com> <20230725035626.984709-2-raj.khem@gmail.com>
 <EAAEAFD4-C39B-4812-B021-2E7157BD9D9F@arm.com>
In-Reply-To: <EAAEAFD4-C39B-4812-B021-2E7157BD9D9F@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 Aug 2023 07:19:16 -0700
Message-ID: <CAMKF1spcYc7UDA79Y0OioqBP5Pwaf57gnSAYh_b19rEpTNwwZw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] glibc: Enable mathvec when sve is available
 as tune feature
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 14:19:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185523

On Fri, Aug 4, 2023 at 4:40=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> wr=
ote:
>
> On 25 Jul 2023, at 04:56, Khem Raj via lists.openembedded.org <raj.khem=
=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > meta/recipes-core/glibc/glibc_2.37.bb | 3 ++-
> > 1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/glibc/glibc_2.37.bb b/meta/recipes-core/=
glibc/glibc_2.37.bb
> > index 8ff9801ed4b..4290f3e6e4f 100644
> > --- a/meta/recipes-core/glibc/glibc_2.37.bb
> > +++ b/meta/recipes-core/glibc/glibc_2.37.bb
> > @@ -85,7 +85,8 @@ EXTRA_OECONF +=3D "${@get_libc_fpu_setting(bb, d)}"
> > EXTRA_OECONF:append:x86 =3D " ${@bb.utils.contains_any('TUNE_FEATURES',=
 'i586 c3', '--disable-cet', '--enable-cet', d)}"
> > EXTRA_OECONF:append:x86-64 =3D " --enable-cet"
> >
> > -PACKAGECONFIG ??=3D "nscd memory-tagging"
> > +PACKAGECONFIG ??=3D "nscd memory-tagging ${@bb.utils.filter('TUNE_FEAT=
URES', 'sve', d)}"
> > +
> > PACKAGECONFIG[nscd] =3D "--enable-nscd,--disable-nscd"
> > PACKAGECONFIG[memory-tagging] =3D "--enable-memory-tagging,--disable-me=
mory-tagging"
> > PACKAGECONFIG[sve] =3D "--enable-mathvec,--disable-mathvec"
>
> This is the wrong thing to do, imho.
>
> mathvec has existed since glibc 2.22 for x86-64 and only with 2.38 did it=
 gain aarch64 support, where it has both NEON and SVE (optional in 8.2+) im=
plementations.
>
> Fedora 38 and Debian 11 both have a libmvec.so, so it looks like we shoul=
d be turning it on by default for the relevant architectures (x86-64 for <2=
.38, x86-64 and aarch64 for 2.38+).

these distros do not specify -mcpu like OE does and it lets glibc
override these options which it does when detecting SVE
but it fails for OE due to compiler flags because it inserts itself on
top of glibc defaults

>
> Ross


Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBA74C83038
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 13:24:33 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web10.10575.1751376268869983239
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 06:24:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=IFK2MF+j;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.161.47, mailfrom: jdmason@kudzu.us)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-610db3f3f90so2651065eaf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 06:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1751376268; x=1751981068; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mDr05dFb/+8Fx/UH+MUUY7Z2N13F4fBv49dQvgMxK2s=;
        b=IFK2MF+jy+it37r2ZBY2mxKxjrTxqHDtwkhMAOuwIQysjFtoo0xC/zIZHz1fF3cvB3
         sfE3LWwRekbfzLCaL8jGag2kCtBq5+oYGTvsrKVdS3G16mhkxt3c73dZs84Jxb8NSt4I
         GHiecdecgX7ZWUhD5/KzveDr+zoprJH9ojYM9eBgGgAipBQuMojST4F2PoVe0Tcr0MOi
         nw1SOXU7zTYHW2+HN0d/sYMlDcHHldN8NEGT/bfQqiA6dYNMo9AboQEhQHNML7jMOZT9
         8J5oukR6jjuebmzA5cGfxQQ/v+8jJbfXAW7zqxbcq0c2iZ5ddLITnPeVWRykCqzUkvXI
         Jyqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751376268; x=1751981068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mDr05dFb/+8Fx/UH+MUUY7Z2N13F4fBv49dQvgMxK2s=;
        b=Zq2j62rj3ZtzPPOGZBjGPBhzMBnkQVq23EPqEhRkfziNSuIJrxj/2S3V3LsJr5weXm
         5UonI3pLAzhG0HoR+xuXZ5l13lwWrP0wthUG03w12GMICeBuuFavoZtKqeHdJM0OCUu8
         XCD0RGdNc2X4BxvxCtMs726jWOyM6MtRWHVstAeP6wcnqqYZQNxFmDsmmFKV3YLZBF6d
         49Nct4kFkot3kTdj8185qa0E3gTIl8+ziRRHonQS+Jlt+xD2NuQQPrWzMbLl+b8mnJP/
         hS2TacYWSDh7yrnV23kPW0kX+iDarus8sxLezxdDkHEd2nR1TzqTn38uyel59tXafWiv
         BRyg==
X-Gm-Message-State: AOJu0YzRU6lIKGrX6IdD+1EigItDtZS79n5bZGdEAbiQN/e6uXJAeBUE
	p5oTS4ydVx37MTiWVjhiksmAEnyfnPr10cEXxDqayCYQcG0yCvqRSQAld5W8yp5hjRtgQluWEU4
	IFEbiUckTupS2ZkMAXoAzyK0haLIXolkufbRRMWBmwW4Fxd5eMag=
X-Gm-Gg: ASbGncvdSfiDU9ZP/BjMbKbqQtt1StNUHeRB2+3oqmLkRr3RZKvotBJSaKVBM/AkSmG
	/mr0Me6nKnn0lhLKzMLTQSpEArQ8BSR+cR+ly77InRCHpe+hsR0znMRGNGjwH16ynL6cnDlQA18
	/dWPOiXuBrwytUaaiR2SVBfW46rAp5Awy8OFZqtNFoKbc=
X-Google-Smtp-Source: AGHT+IFOacnAlKY667Fr+y23dpH2W+0zf7aYnI2jt83JC5nPL6MZsocTkapDcm/kR4ywEgZuGxxE0N8/qIt8e+NcOcg=
X-Received: by 2002:a05:6820:994:b0:611:aabf:2b7d with SMTP id
 006d021491bc7-611b91b8ba5mr13385827eaf.7.1751376267939; Tue, 01 Jul 2025
 06:24:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250630144814.255656-1-jdmason@kudzu.us> <5f3c3690-ae0f-4faf-8e6b-4e0c7b2d8eb6@kernel.crashing.org>
In-Reply-To: <5f3c3690-ae0f-4faf-8e6b-4e0c7b2d8eb6@kernel.crashing.org>
From: Jon Mason <jdmason@kudzu.us>
Date: Tue, 1 Jul 2025 09:24:15 -0400
X-Gm-Features: Ac12FXzN4XiXYW5W3xwA8YdG0U4vEKSI6ZAQat7daszScTZ3X6x2vhhPPLRXfNg
Message-ID: <CAPoiz9yNoyxxGCzJU4bo7h1XYFjqNFeh1iX15CnLdkZz3025HQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libucontext: use hard/soft float
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 13:24:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219569

On Mon, Jun 30, 2025 at 12:32=E2=80=AFPM Mark Hatle
<mark.hatle@kernel.crashing.org> wrote:
>
>
>
> On 6/30/25 9:48 AM, Jon Mason wrote:
> > From: Jon Mason <jon.mason@arm.com>
> >
> > When building for qemuarm-secureboot in meta-arn with musl and clang,
> > the following compile error is seen:
> > - | ../sources/libucontext-1.3.2/arch/arm/swapcontext.S:23:11: error: u=
nknown token in expression
> > - |  ldr r4, =3D#0x56465001
> > - |           ^
> >
> > This is happening because 1.3 added ifdefs for assembly code for both
> > hard and soft float, and bcause neither is being defined, it is taking
> > this path with the issue.
> >
> > Since we can tell if soft or hard float is being used via the TARGET_FP=
U
> > variable, use that and set the relevant makefile flag.
> >
> > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > ---
> >   meta/recipes-core/musl/libucontext_1.3.2.bb | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/recipes-core/musl/libucontext_1.3.2.bb b/meta/recipes=
-core/musl/libucontext_1.3.2.bb
> > index 2362cba5c8a2..92001bbe7bb5 100644
> > --- a/meta/recipes-core/musl/libucontext_1.3.2.bb
> > +++ b/meta/recipes-core/musl/libucontext_1.3.2.bb
> > @@ -48,3 +48,6 @@ def map_kernel_arch(a, d):
> >
> >   EXTRA_OEMESON =3D "-Dcpu=3D${@map_kernel_arch(d.getVar('TARGET_ARCH')=
, d)}"
> >   inherit meson
> > +
> > +TARGET_CPPFLAGS:arm +=3D "${@bb.utils.contains('TARGET_FPU', 'hard', '=
-DFORCE_HARD_FLOAT', '', d)}"
> > +TARGET_CPPFLAGS:arm +=3D "${@bb.utils.contains('TARGET_FPU', 'soft', '=
-DFORCE_SOFT_FLOAT', '', d)}"
>
> The above doesn't +=3D to TARGET_CPPFLAGS, it _replaces_ TARGET_CPPFLAGS.
>
> This is probably not what you want.
>
> What I've done in the past is:
>
> ARM_TARGET_CPPFLAGS =3D ""
> ARM_TARGET_CPPFLAGS:append:arm =3D "${@bb.utils.contains('TARGET_FPU', 'h=
ard', '-
> DFORCE_HARD_FLOAT', '', d)}"
> ARM_TARGET_CPPFLAGS:append:arm =3D "${@bb.utils.contains('TARGET_FPU', 's=
oft', '
> -DFORCE_SOFT_FLOAT', '', d)}"
>
> TARGET_CPPFLAGS .=3D "${ARM_TARGET_CPPFLAGS}"

Thanks for the insight Mark, I will happily steal your changes and
throw it as a v2 :)

Is there a place I can look (documentation or code) that will help me
understand why this is necessary?

Thanks,
Jon

> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#219524): https://lists.openembedded.org/g/openembed=
ded-core/message/219524
> > Mute This Topic: https://lists.openembedded.org/mt/113909237/3616948
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
mark.hatle@kernel.crashing.org]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >


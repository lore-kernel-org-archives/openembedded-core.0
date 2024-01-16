Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5771C4706C
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 08:30:33 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.8518.1705393825120391796
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 00:30:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b2twGuDb;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2cdb50d8982so25084951fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 00:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705393823; x=1705998623; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IsS/C80XOlbB700HRODhGWf7GEByOzJ+uArYlFBUF4s=;
        b=b2twGuDbsJdgiVOyJpB4cwFe+KdZt8EUNM2wGMrOaEw6nLWCU8/xJG4/z62ddMTzUm
         8dpTE5nw2zezCKrKvcGycVjiDe4AbDLB87pK+M/PSJKTcf8KFLQ8fqBMRq4fhpgIDSgR
         gxlEcvxPkeLqNiI4oXlBI+fCvF8Mx0NkAa5OdKQ2idVMuIy64hnKLy78Zl6JhKCDP4Fv
         6257l0X+rHjqalaME04A03U+9+Mx+Eaze23iVBL6jlXqSNvRqL+j84CAGbYWTJ2KksuY
         xW9DvxaZcjMMbQ2mVlta8guStEk2B+vEwSLwAt9llP5rUquz/CE9oqyMnvN8Y9SbZArH
         nTOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705393823; x=1705998623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IsS/C80XOlbB700HRODhGWf7GEByOzJ+uArYlFBUF4s=;
        b=ONN6ogCNHSZS86CgLwWQCmBwaUGeRyaAKMIsFGyDDNBu3dOw249opat5+dMZTdgUUg
         7N5vUesBoRT1r+zSljxpsr2+4mLqUZpabzOGdQNZq1CXhgAI6U1RVtK2hyAi6jWqvXww
         zul10gZymSXE4x+GG0lRUn3ERPktgO6vonlrnOxEIIRMhKbkaDEly/4ZpJZpoDcTcfH/
         mWD55a7KhXY4Dce8i7X01qqIs3wzW/V0D49riLAO8HmfHk8dYVKItVIYx4hxuyqbPldw
         FKRZog8BknQGWn60mbXUdljEIir0oMPCg1x9NK+en58wy4y4Y0L+tgIuftmBpq1wYd9D
         tfXQ==
X-Gm-Message-State: AOJu0YzLQ71ibU/NGnkiQdyAfdJOS1oFKAOEBkJI3ppfM3Kpipzfd4sE
	fu4vqYe+xOBA4bDTAruRYh3iO3/reLz2QTv2bCTT3HdS
X-Google-Smtp-Source: AGHT+IFlFpXi/j2banT0KdQYTn5SiID4+1ibEc7813+6PH20xuQhs/ZpsYt6Zz+q+k2gh/CQ/tydm5aen95JJdg7/og=
X-Received: by 2002:a05:6512:32a4:b0:50b:fa1d:aecc with SMTP id
 q4-20020a05651232a400b0050bfa1daeccmr2937337lfe.29.1705393823096; Tue, 16 Jan
 2024 00:30:23 -0800 (PST)
MIME-Version: 1.0
References: <CY5PR11MB634272E04107134EBD25ED0EEE732@CY5PR11MB6342.namprd11.prod.outlook.com>
In-Reply-To: <CY5PR11MB634272E04107134EBD25ED0EEE732@CY5PR11MB6342.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 16 Jan 2024 09:30:11 +0100
Message-ID: <CANNYZj-zOrw=n_bEoA7d3o1cEsd0u740-yhVg9uivaS79rAyDw@mail.gmail.com>
Subject: Re: [OE-core] "ptest-pkgs" image feature misses ptest package
 dependencies due to COMPLEMENTARY_GLOB ignoring all RRECOMMENDS
To: william.lyu@windriver.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 08:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193835

Yes, ptest-pkgs is not tested anywhere, and so isn't guaranteed to
work. But if you can fix it, that'd be welcome.

Alex

On Tue, 16 Jan 2024 at 01:07, Lyu, William via lists.openembedded.org
<william.lyu=3Dwindriver.com@lists.openembedded.org> wrote:
>
> When I try to build a core-image-minimal image with ptest for openssl ins=
talled using the following conf/local.conf modifications, the openssl-ptest=
 is installed but with missing runtime dependencies.
>
>     DISTRO_FEATURES:append =3D " ptest"
>     EXTRA_IMAGE_FEATURES +=3D " ptest-pkgs"
>     PTEST_ENABLED =3D "1"
>     IMAGE_INSTALL:append =3D " openssl"
>
> When I boot the image and try to run the ptest for openssl, I get the fol=
lowing error complaining about missing dependencies in the output:
>
>     # ptest-runner openssl -t 3000
>     BEGIN: /usr/lib/openssl/ptest
>     Can't locate File/Spec/Functions.pm in @INC ...
>     ...
>
> This error is due to package perl-module-file-spec-functions, along with =
some other perl-module-* packages, not being installed - these packages are=
 missing in the .manifest file in the directory containing the built image.=
 The dependency for these packages is as follows.
>
> openssl-ptest --(RDEPENDS)--> perl-modules --(RRECOMMENDS)--> perl-module=
-file-spec-functions
>                                            \-(RRECOMMENDS)--> some other =
perl-module-* packages
>
> "ptest-pkgs" along with various other image features are defined as COMPL=
EMENTARY_GLOB in meta/classes-recipe/populate_sdk_base.bbclass in openembed=
ded-core:
>
>     COMPLEMENTARY_GLOB[ptest-pkgs] =3D '*-ptest ${MLPREFIX}ptest-runner'
>
> Following this patch to package_manager referenced by link https://lists.=
openembedded.org/g/openembedded-core/message/167303, recommends relationshi=
ps (set via RRECOMMENDS) are always ignored when installing complementary p=
ackages [1]. This causes the necessary runtime dependencies for openssl-pte=
st not being installed. I am not sure if this issue only pertains to openss=
l-ptest.
>
> Note that, if I follow the alternative "more selective" [2] way to includ=
e the tests (see the following sample conf/local.conf), I can properly inst=
all openssl-ptest with all dependencies, as openssl-ptest is now explicitly=
 declared as package-to-be-installed instead of implicitly discovered via t=
he COMPLEMENTARY_GLOB "ptest-pkgs". I would say that this means that "ptest=
-pkgs" is not very robust to use.
>
>     DISTRO_FEATURES:append =3D " ptest"
>     PTEST_ENABLED =3D "1"
>     IMAGE_INSTALL:append =3D " openssl openssl-ptest"
>
> [1] https://docs.yoctoproject.org/dev/ref-manual/variables.html#term-COMP=
LEMENTARY_GLOB
> [2] https://wiki.yoctoproject.org/wiki/Ptest#Adding_ptest_to_your_build
>
> William
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193807): https://lists.openembedded.org/g/openembedde=
d-core/message/193807
> Mute This Topic: https://lists.openembedded.org/mt/103752398/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E06C83F17
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 17:15:08 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.87244.1753722906283545298
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jul 2025 10:15:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g0o+LOKz;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-71a27d982f1so8384097b3.2
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 10:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753722905; x=1754327705; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GIf85xJYmfyMVj1bcnxA2G3iarCEwrfYQSCdiURT3Rs=;
        b=g0o+LOKzVAqho5sLIsPg3znLxteYqKV0oOzOBFBWpWhxD6KEQ2PUcRIVyZ93icEvBE
         QVFIkevooSQn96ghPD0mfiFI78lOQIVHvde4NCT78MoRu1V7E9Ypt1t0w/TH2i2QUNLK
         2w6/vbMlKyXicvvA+zC77IauARuisoPPnuEc9b68+k2a6Vfz97CbY5R5vvXi3Pdp8uUA
         rMdxxH26E03oikTQ7rUAUABjOThvAnAw4SWgMvAntYZXMXSrlDRool5Gly9ZX7YKcY2p
         xZXQlkM9wgAS2boQj12w5hy4Zr3suAdY36TKgyfcUUegitW6mtFIAjdOCFIE5+z7GAzd
         VdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753722905; x=1754327705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GIf85xJYmfyMVj1bcnxA2G3iarCEwrfYQSCdiURT3Rs=;
        b=oFBZlOpOZHQoGHhbD3SWpIZqxM+fTuSwps4iGU/IAMVPnwlcX9DTx7OZ0FdP/3Rxpn
         czSFFrocFBjlnpixFt+LTJNqpwF0QPi1N2sYs2SHvI2PvJTvmp44/WrxP4mQ8BWOlr0N
         FedFJNorrc/8FwbtbzyKP2cr6A25SX1d5J9KojZahp1FziUwQmaAulLXAdAPKeOR2ipu
         c0eH7alpWJVsgMsH5UQqui8JGx7xOLayrahuXS/xzecM2cTm/QAEvtzhZMP55oU4zNvv
         Ky24lLZeB4xunRS31G1XSmTy/7kpQx+IszvCUvF9YkTkhfCyVZI1RiGhpl6y8yAY5mQh
         Po0A==
X-Gm-Message-State: AOJu0YwXffn3WTTRddB8Mpsn6L3YOF/zv5nGj5Al8wxbZ8stIYJMU9Pp
	Nbs7i4KXXhtgHh1aGPdZCN/mDIDyB+BgIWompgycgjFmwUyd9ev3qn1FlNSF1qxdkxdEa3rdpjB
	gSt8IasMCByk9O6CgamD6MCdIjkVLGCI=
X-Gm-Gg: ASbGnctKg4ipB7SHKqdQ3PBblVWC/eaLWBoj2sTYoUflgh3a/iL1iIosYM5K2B4RPuS
	ZS+rx0J/6OJbSmQ2AaEMfRfMR/mqzG4KwxO0zGYSKcuRJjxy/R59tY6WXpmX1/O1mOw3iZRexea
	2ahPnyP16vxYh4lkHEUf+0EIKLj8InA1ODEkY+8an4cRgNBKgqiEWx8ABGH9cDj1VP+Om/I+R7s
	YQyAairVaST7eqiXnK6TBcLrXawBsE+zgg=
X-Google-Smtp-Source: AGHT+IE1/z6fp46U3RxTS4RZfThIppr1Fs7GjIjSVlQgLavY3uOOlIhw+yLKXc1Avog2l4SpHyh0sTu36Uw+aZFgNe4=
X-Received: by 2002:a05:690c:9989:b0:70c:a854:8384 with SMTP id
 00721157ae682-719e35acd67mr131887677b3.11.1753722905084; Mon, 28 Jul 2025
 10:15:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250728032045.2783514-1-raj.khem@gmail.com> <CANNYZj-KztVkyJc_3-cm5T=MtJasYoJkidku2J=7rA5BTysEqw@mail.gmail.com>
In-Reply-To: <CANNYZj-KztVkyJc_3-cm5T=MtJasYoJkidku2J=7rA5BTysEqw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Jul 2025 10:14:38 -0700
X-Gm-Features: Ac12FXzqKipbZXvP5SDgjpxb46DyKxpkdjFpzxy978DpklWvYVqJKV5mLZMVnRg
Message-ID: <CAMKF1sqjDpXSBB5TZGF4-YGeS_XUJArGVjnoo2CFLEW+6VvLdQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] spirv-headers,spirv-tools: Upgrade to
 1.4.321.0 release
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 17:15:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221017

On Mon, Jul 28, 2025 at 2:02=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> These need to be updated in lockstep with other vulkan items:
> $ find . -name *1.4.3*
> ./meta/recipes-graphics/glslang/glslang_1.4.313.0.bb
> ./meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb
> ./meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb
> ./meta/recipes-graphics/vulkan/vulkan-tools_1.4.313.0.bb
> ./meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.313.0.bb
> ./meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.313.0.bb
> ./meta/recipes-graphics/vulkan/vulkan-volk_1.4.313.0.bb
> ./meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb
> ./meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb
>

Yes thats reasonable. Although what worries me is the spread of dependencie=
s for
atomic upgrades now, libclc is built from clang sources and libclc has
dependencies
into these via spirv-tools, this is adding quite a bit of sundry
dependency upgrades
that compiler upgrade will have to do. Thats my worry all along when
we spun packages
out of clang, It would make it hard to do version upgrades in future.

> Alex
>
> On Mon, 28 Jul 2025 at 05:20, Khem Raj via lists.openembedded.org
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  ...{spirv-headers_1.4.313.0.bb =3D> spirv-headers_1.4.321.0.bb} | 4 ++=
--
> >  .../{spirv-tools_1.4.313.0.bb =3D> spirv-tools_1.4.321.0.bb}    | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >  rename meta/recipes-graphics/spir/{spirv-headers_1.4.313.0.bb =3D> spi=
rv-headers_1.4.321.0.bb} (84%)
> >  rename meta/recipes-graphics/spir/{spirv-tools_1.4.313.0.bb =3D> spirv=
-tools_1.4.321.0.bb} (97%)
> >
> > diff --git a/meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb b/me=
ta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb
> > similarity index 84%
> > rename from meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb
> > rename to meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb
> > index a551814689c..1da2e74f93b 100644
> > --- a/meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb
> > +++ b/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb
> > @@ -2,9 +2,9 @@ SUMMARY =3D "Machine-readable files for the SPIR-V Regi=
stry"
> >  SECTION =3D "graphics"
> >  HOMEPAGE =3D "https://www.khronos.org/registry/spir-v"
> >  LICENSE =3D "MIT"
> > -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd14ee3b13f42e9c9674acc5925c=
3d741"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da0dcaa512cc2dee95fe0fd791ee=
83a18"
> >
> > -SRCREV =3D "aa6cef192b8e693916eb713e7a9ccadf06062ceb"
> > +SRCREV =3D "2a611a970fdbc41ac2e3e328802aed9985352dca"
> >  SRC_URI =3D "git://github.com/KhronosGroup/SPIRV-Headers;protocol=3Dht=
tps;branch=3Dmain"
> >  PE =3D "1"
> >  # These recipes need to be updated in lockstep with each other:
> > diff --git a/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb b/meta=
/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
> > similarity index 97%
> > rename from meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb
> > rename to meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
> > index 4594a1a9426..319b25b7f43 100644
> > --- a/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb
> > +++ b/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
> > @@ -7,7 +7,7 @@ SECTION =3D "graphics"
> >  LICENSE  =3D "Apache-2.0"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c=
6bd57"
> >
> > -SRCREV =3D "a62abcb402009b9ca5975e6167c09f237f630e0e"
> > +SRCREV =3D "33e02568181e3312f49a3cf33df470bf96ef293a"
> >  SRC_URI =3D "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=3Dma=
in;protocol=3Dhttps \
> >             "
> >  PE =3D "1"
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#220984): https://lists.openembedded.org/g/openembed=
ded-core/message/220984
> > Mute This Topic: https://lists.openembedded.org/mt/114408564/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >


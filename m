Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACB4EC54E58
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 05:55:16 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.544.1711000510642397772
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 22:55:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kPKzgJ2p;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-21fed501addso302517fac.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 22:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711000510; x=1711605310; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=adGnV84bw/loCtOJCc0Gq7NdZU7kh9RXeddke7mad44=;
        b=kPKzgJ2pGlHnrHl8rypJZl2/jU1zLf7h8fn1hknE6KZt+f+Za8Qj9eK0VlIO9zr2rR
         oyNOu5ev25G9UuTWtQH2t7LaRm9LuGajCo1EjkCg9i+IlsuWdvmD7qX9bDsW2T3jaaf0
         0i0CH6raXdEmPJuBT6aoP6HKmF195TDoJsXm6/AOB8lFoCG/zd8OG3vpl+cijhj3K2HI
         V3cw0iD/+jzWt3iEva/XmEspqy0VpOSy+xSI1qj/jtt9BNTzyK0e+cyRadIWE3Jjlgnt
         RwTnFXTq0fUhtNfylx6f76SBpJQkP9OB8kNpYFCx/ZKfSBUH8ByPZ2GQFyIa84yLW3Pr
         +jcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711000510; x=1711605310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=adGnV84bw/loCtOJCc0Gq7NdZU7kh9RXeddke7mad44=;
        b=TIgYyzm0dOy4bVoUqQPJ5/2S1btE91WyAQ/XhxgVwPTVuPltK7k3y5h1oZk9BgODQQ
         g10MymbdHNib/zVyv9lSxetk52op16WZ8AdUT1GmqF8lHZ6WU4tCE01hyZiJEyoCKgSC
         Ead83qbSwUYmzQljEouJvw/DlvihpIctachCuWfotoIWb8LziscqnrnVMGEuuLbEfu7I
         g/4mzKtVgU8q+xV+ysa2b/oAYg+kbbNZTqT5rkU9w20q6WtQm0SMR9y/EYkrZLyk+ojo
         1Qnsm5iziPCt1wQqZ3vrqnOv5XbYhmRSM7hH2Nw1PWm/Qeu5rN1sCQlKzE/UcZmcsm71
         K/sw==
X-Gm-Message-State: AOJu0YyoauO2fo7Hmp5A/IKt3Zz58l6995MdzA1GWUvl/ZuNMU3IxKOp
	5mUdbVfJ2AiTQbQRmvq9FQFfqhcQ8bi/oc/zWEWbhwkcKv92HdSdtciTvQt08uNwPSDAdaLHxjz
	QgclFn6R9YG1/Pg4eUo3ABZRfmsI=
X-Google-Smtp-Source: AGHT+IEZW7qn1Ubz601sCkDLkjpgCvVTqARHZSh8v8DDdBEoaIRP+Kc3vC7K8b1p5TC2lLHbhqAtxMWGzhcFUqeGPnQ=
X-Received: by 2002:a05:6870:b14b:b0:21f:1fcf:8c24 with SMTP id
 a11-20020a056870b14b00b0021f1fcf8c24mr4231826oal.57.1711000509844; Wed, 20
 Mar 2024 22:55:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240319004524.1270639-1-leimaohui@fujitsu.com>
 <CAMKF1sp69BBJjUCFZ2Jnk3jE8O-kmhFfLg0CjxodykmZbvP_Vw@mail.gmail.com>
 <TY3PR01MB110567C69384E6A28000C11FEA0322@TY3PR01MB11056.jpnprd01.prod.outlook.com>
 <CAMKF1srfhd0_iMxwxxJhmwiRGNr7pptOpQq4isJW5yDU5R9Eew@mail.gmail.com> <TY3PR01MB11056BA0B2F986D0C72F972DCA0322@TY3PR01MB11056.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11056BA0B2F986D0C72F972DCA0322@TY3PR01MB11056.jpnprd01.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Mar 2024 22:54:43 -0700
Message-ID: <CAMKF1srBHz+obAZSRfppqVv5KF_jcf2=2pwB1RfxSmUb-B1aDA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libbsd: Fix conflict error when enable multlib.
To: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Mar 2024 05:55:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197410

On Wed, Mar 20, 2024 at 10:38=E2=80=AFPM Maohui Lei (Fujitsu)
<leimaohui@fujitsu.com> wrote:
>
> Hi,
>
> > I guess you might need to throw in meta-clang into layers and use TOOLC=
HAIN =3D
> > "clang" perhaps.
>
> I tried again with the following steps. Bit I still didn't reproduced the=
 error. Is there anything I missed?
>
> $ grep clang conf/local.conf
> TOOLCHAIN =3D "clang"
> $ grep clang conf/bblayers.conf
>   /dev/common/home/leimh/community/meta-clang \
> $ bitbake libbsd
> Build Configuration:
> BB_VERSION           =3D "2.7.3"
> BUILD_SYS            =3D "x86_64-linux"
> NATIVELSBSTRING      =3D "universal"
> TARGET_SYS           =3D "i686-poky-linux"
> MACHINE              =3D "qemux86"
> DISTRO               =3D "poky"
> DISTRO_VERSION       =3D "4.3+snapshot-08d0544be3e1881b623f18931631e412a9=
a0158d"
> TUNE_FEATURES        =3D "m32 core2"
> TARGET_FPU           =3D ""
> meta
> meta-poky
> meta-yocto-bsp       =3D "master:08d0544be3e1881b623f18931631e412a9a0158d=
"
> meta-clang           =3D "master:81e5f4eef93b5e1d6507daaf74fce28a2ccd7cf7=
"
> ......
> $
>

That may not be sufficient. You need to run
bitbake mg

secondly, Set TOOLCHAIN =3D "clang" perhaps first try setting it just
for mg and then for mg and libbsd
if it still does not reproduce then set it in local.conf

>
> Best regards
> Lei
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org
> > <openembedded-core@lists.openembedded.org> On Behalf Of Khem Raj
> > Sent: Thursday, March 21, 2024 10:20 AM
> > To: Lei, Maohui <leimaohui@fujitsu.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH] libbsd: Fix conflict error when enable m=
ultlib.
> >
> > On Wed, Mar 20, 2024 at 6:20=E2=80=AFPM Maohui Lei (Fujitsu) <leimaohui=
@fujitsu.com>
> > wrote:
> > >
> > > Hi.
> > >
> > > > This causes mg build failures see
> > > > https://errors.yoctoproject.org/Errors/Details/759473/
> > >
> > > I'm sorry that I can't reproduce this error. I used the default qemux=
86.conf,
> > and bitbake libbsd. There is no error.
> > > So, can you show me your config of i686-yoe-linux?
> >
> > I guess you might need to throw in meta-clang into layers and use TOOLC=
HAIN =3D
> > "clang" perhaps.
> >
> > >
> > > Best regards
> > > Lei
> > >
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: Khem Raj <raj.khem@gmail.com>
> > > > Sent: Wednesday, March 20, 2024 1:22 PM
> > > > To: Lei, Maohui <leimaohui@fujitsu.com>
> > > > Cc: openembedded-core@lists.openembedded.org
> > > > Subject: Re: [OE-core] [PATCH] libbsd: Fix conflict error when enab=
le multlib.
> > > >
> > > > This causes mg build failures see
> > > > https://errors.yoctoproject.org/Errors/Details/759473/
> > > >
> > > > On Mon, Mar 18, 2024 at 5:45=E2=80=AFPM leimaohui via lists.openemb=
edded.org
> > > > <leimaohui=3Dfujitsu.com@lists.openembedded.org> wrote:
> > > > >
> > > > > From: Lei Maohui <leimaohui@fujitsu.com>
> > > > >
> > > > > Error: Transaction test error:
> > > > >   file /usr/include/bsd/sys/cdefs.h conflicts between attempted
> > > > > installs of libbsd-dev-0.12.1-r0.core2_64 and
> > > > > lib32-libbsd-dev-0.12.1-r0.core2_32
> > > > >
> > > > > The difference of bsd/sys/cdefs.h between libbsd-dev and
> > > > > lib32-libbsd-dev is as following:
> > > > >
> > > > >  /* Define the ABI for the current system. */  -#define
> > > > > LIBBSD_SYS_TIME_BITS 64  +#define LIBBSD_SYS_TIME_BITS 32
> > #define
> > > > > LIBBSD_SYS_HAS_TIME64 1
> > > > >
> > > > > Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> > > > > ---
> > > > >  meta/recipes-support/libbsd/libbsd_0.12.1.bb | 6 +++++-
> > > > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/meta/recipes-support/libbsd/libbsd_0.12.1.bb
> > > > > b/meta/recipes-support/libbsd/libbsd_0.12.1.bb
> > > > > index 161dc6df43..84edd9bafa 100644
> > > > > --- a/meta/recipes-support/libbsd/libbsd_0.12.1.bb
> > > > > +++ b/meta/recipes-support/libbsd/libbsd_0.12.1.bb
> > > > > @@ -40,8 +40,12 @@ SRC_URI =3D
> > > > "https://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
> > > > >
> > > > >  SRC_URI[sha256sum] =3D
> > > >
> > "d7747f8ec1baa6ff5c096a9dd587c061233dec90da0f1aedd66d830f6db6996a"
> > > > >
> > > > > -inherit autotools pkgconfig
> > > > > +inherit autotools pkgconfig multilib_header
> > > > >
> > > > >  DEPENDS +=3D "libmd"
> > > > >
> > > > > +do_install:append () {
> > > > > +       oe_multilib_header bsd/sys/cdefs.h }
> > > > > +
> > > > >  BBCLASSEXTEND =3D "native nativesdk"
> > > > > --
> > > > > 2.34.1
> > > > >
> > > > >
> > > > >
> > > > >


Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C220C54E67
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 02:20:18 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.5175.1710987612897200701
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 19:20:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ai0jgcta;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-221822a7dc7so299423fac.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 19:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710987612; x=1711592412; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9jfPZaXJRzujRj626FCqJYktii9T2CuJwQbKNm+8PU=;
        b=Ai0jgcta0lnoe4PHL/ghqSwdTRtibMKZW9sih4P1kxNPAj0F7ui1eebdMNBWAnunKA
         HEEk+1jjX7T6K6oXXUHVMe7H8B09Od7LU3VSPEaNrDPPE5MkuLK1ROVNPoHavWiPOjva
         QtMXItLF2+rnbG7CIDM62B1Km5lvsH7fEqEF6ulKOdngpuQjChHMuQVmPkgY2QW1je15
         MU/XbmJzrVmMtbSwFAilImmH+2qmDm8/gEx3niwA/ARPpSA9uXZC4e7HEhKSXBxnzh9S
         Qt3tvav/jLBas7gAHa8LduWnyWerDErwjRHjx3i5z0b41fmV4/IpdpS1QNPw9ozlwUpW
         e3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710987612; x=1711592412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l9jfPZaXJRzujRj626FCqJYktii9T2CuJwQbKNm+8PU=;
        b=GfRQKo3fz2iIhXcaJ7DHWtOHc7erdSKinzcr63JcwDM761lyJl5Ie5V3nlghgdm1GC
         KJxxXQ8mdD5fc09wjiefC9GrbDj+YrR6+gGBXjxliHq6XM4BpCg3cUBMd1TVjN9zpxJ9
         GpPE3nB4ytNMlIEoEoiLgb/xlO2USs6iea14wA4NaGubRU+4ydVRTnICz/WO3ZRILJIj
         vy/QgNlBWH5H48m/JCww4P5R8gBcK0O7mO5MjFEFsQnM8vnme+ZcBs/XBguD1zO4vaHx
         yAeN4IItkshDvpAxL/rrCxdYMdKesHVa21STA2eNqLMcIhyvOthesQIMa9K/b+ya8Jc8
         g/Eg==
X-Gm-Message-State: AOJu0Ywh9dX8DaNy/UJ44zs3LFqFADTVZDP7CeCJ9IdIBqK+o8rJu5dt
	QGIr5UaZguHpZZWkUc2usn0fgpT7M00NL0xv4zWL0Pu2vpM95H9R9iFp6kFxkxVlF/RHAJZ8mCf
	GBiIr6/mawSoabJW2l3s1c1vdkYI=
X-Google-Smtp-Source: AGHT+IFifc9dbOfRnT13unu2yQybl1Dlz+6YmgG50HN7YWguP/BRt9YqW7kSwyoNtCvsE/AliM3c9Rfn5IvNzP8ZEQo=
X-Received: by 2002:a05:6870:3926:b0:220:9f8c:b97b with SMTP id
 b38-20020a056870392600b002209f8cb97bmr23389540oap.4.1710987612103; Wed, 20
 Mar 2024 19:20:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240319004524.1270639-1-leimaohui@fujitsu.com>
 <CAMKF1sp69BBJjUCFZ2Jnk3jE8O-kmhFfLg0CjxodykmZbvP_Vw@mail.gmail.com> <TY3PR01MB110567C69384E6A28000C11FEA0322@TY3PR01MB11056.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB110567C69384E6A28000C11FEA0322@TY3PR01MB11056.jpnprd01.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Mar 2024 19:19:45 -0700
Message-ID: <CAMKF1srfhd0_iMxwxxJhmwiRGNr7pptOpQq4isJW5yDU5R9Eew@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libbsd: Fix conflict error when enable multlib.
To: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Mar 2024 02:20:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197404

On Wed, Mar 20, 2024 at 6:20=E2=80=AFPM Maohui Lei (Fujitsu)
<leimaohui@fujitsu.com> wrote:
>
> Hi.
>
> > This causes mg build failures see
> > https://errors.yoctoproject.org/Errors/Details/759473/
>
> I'm sorry that I can't reproduce this error. I used the default qemux86.c=
onf, and bitbake libbsd. There is no error.
> So, can you show me your config of i686-yoe-linux?

I guess you might need to throw in meta-clang into layers and use
TOOLCHAIN =3D "clang" perhaps.

>
> Best regards
> Lei
>
>
>
>
> > -----Original Message-----
> > From: Khem Raj <raj.khem@gmail.com>
> > Sent: Wednesday, March 20, 2024 1:22 PM
> > To: Lei, Maohui <leimaohui@fujitsu.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH] libbsd: Fix conflict error when enable m=
ultlib.
> >
> > This causes mg build failures see
> > https://errors.yoctoproject.org/Errors/Details/759473/
> >
> > On Mon, Mar 18, 2024 at 5:45=E2=80=AFPM leimaohui via lists.openembedde=
d.org
> > <leimaohui=3Dfujitsu.com@lists.openembedded.org> wrote:
> > >
> > > From: Lei Maohui <leimaohui@fujitsu.com>
> > >
> > > Error: Transaction test error:
> > >   file /usr/include/bsd/sys/cdefs.h conflicts between attempted
> > > installs of libbsd-dev-0.12.1-r0.core2_64 and
> > > lib32-libbsd-dev-0.12.1-r0.core2_32
> > >
> > > The difference of bsd/sys/cdefs.h between libbsd-dev and
> > > lib32-libbsd-dev is as following:
> > >
> > >  /* Define the ABI for the current system. */  -#define
> > > LIBBSD_SYS_TIME_BITS 64  +#define LIBBSD_SYS_TIME_BITS 32  #define
> > > LIBBSD_SYS_HAS_TIME64 1
> > >
> > > Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> > > ---
> > >  meta/recipes-support/libbsd/libbsd_0.12.1.bb | 6 +++++-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-support/libbsd/libbsd_0.12.1.bb
> > > b/meta/recipes-support/libbsd/libbsd_0.12.1.bb
> > > index 161dc6df43..84edd9bafa 100644
> > > --- a/meta/recipes-support/libbsd/libbsd_0.12.1.bb
> > > +++ b/meta/recipes-support/libbsd/libbsd_0.12.1.bb
> > > @@ -40,8 +40,12 @@ SRC_URI =3D
> > "https://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
> > >
> > >  SRC_URI[sha256sum] =3D
> > "d7747f8ec1baa6ff5c096a9dd587c061233dec90da0f1aedd66d830f6db6996a"
> > >
> > > -inherit autotools pkgconfig
> > > +inherit autotools pkgconfig multilib_header
> > >
> > >  DEPENDS +=3D "libmd"
> > >
> > > +do_install:append () {
> > > +       oe_multilib_header bsd/sys/cdefs.h }
> > > +
> > >  BBCLASSEXTEND =3D "native nativesdk"
> > > --
> > > 2.34.1
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#197315):
> > > https://lists.openembedded.org/g/openembedded-core/message/197315
> > > Mute This Topic: https://lists.openembedded.org/mt/105016171/1997914
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> > > [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >


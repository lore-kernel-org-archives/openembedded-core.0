Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF468C46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 03:54:17 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.9580.1704772457333092991
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jan 2024 19:54:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jP133+3m;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-20451ecbb80so1373616fac.2
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 19:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704772456; x=1705377256; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AaKkrKX2VfkPFrdCZP8EDbH+3mfqfZtee9t95mi+xI=;
        b=jP133+3mXnEPUpCPUEPoo6AVUowaEPSktzLFdRZobI1drVxf49KT+B5KOnzt15GHYY
         blqJ/H7fa3wayJOsEJ8cCThEBCFUIagfLLHPfVY7AxApr5IP8T34k9LytPzPS/jHyxy+
         ucKvuAom+ewHGyU50QX6gDUy8k541VxIM7X1XIPfJDz6d4YUbDA0Fppv72AYiS1q4tOm
         glSv/LHJEFPXJvGerVNrqoKqFCwyZrFRNF7rQQ5TEQ8jNXelTvUS8TPZswCYDFPwpLcM
         BKEIDvo/qgtVG8mJzq+W2QkNPPGtjA5AWbvgwNNENp2WlRuLJmSVKiP+Ii7X2mTRg0Va
         52tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704772456; x=1705377256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0AaKkrKX2VfkPFrdCZP8EDbH+3mfqfZtee9t95mi+xI=;
        b=YalpepvnEbs2Vrd+cV3cC7IlL3YrvoJWP3dYG2mvK8LbsVO1IbYVTjC8+DfIP/kXR0
         jCsW2bYpz07Cg1u7Toi74kGVrv4WbevwBL2OIL37udxRjFJLszRbD1Y8d98QBH+gG+we
         mkR4BydrAmqtRGbEaMbuvxMKnAxYoCbrX7SzW9t4i+IKIOIwxaRb9sHF/HjnFlqb/UQc
         m0yMy2r/pUFMIFkAVPHw61ERMIc/AC/1yg/r1fhFDrgbKefpZ2+z+qBVaFSNci0gsa08
         MKXIiekFaAkrjbUlmGSNaNeRcUkdek8lK12vAImkDfbNUyHTHTQWg21agMHjhXZX2SiP
         QkKQ==
X-Gm-Message-State: AOJu0YwTSjNZqzfoASdw/hkqE+BXthbb8hZeAtID/25WVrPYoDn3nUrd
	UXEKs+yOQy6nrC5wSmWh6Z80KYH6T7mVbAAQi8qRjw7uZ5w=
X-Google-Smtp-Source: AGHT+IF5OcwVyTggbgM4aUgSMo/fOnjZ6WNTPMQax8kSWALvqXaGO1zBEF2lILqs+x9CVXCTed4tJ3iJBDojtDvtxVE=
X-Received: by 2002:a05:6870:9c85:b0:204:1561:eb01 with SMTP id
 pq5-20020a0568709c8500b002041561eb01mr5302732oab.66.1704772455118; Mon, 08
 Jan 2024 19:54:15 -0800 (PST)
MIME-Version: 1.0
References: <20240103145902.2124110-1-richard.purdie@linuxfoundation.org>
 <20240103145902.2124110-4-richard.purdie@linuxfoundation.org>
 <A0382FB4-C99B-4558-8B8B-D5A3A248C862@arm.com> <62591061a843999d470506252d6044f50ac81228.camel@linuxfoundation.org>
 <CAMKF1srS6EfRxA5ZSGAxZ7nLT9=wF2_DoP0EDNhbSWNyRwxhVg@mail.gmail.com>
In-Reply-To: <CAMKF1srS6EfRxA5ZSGAxZ7nLT9=wF2_DoP0EDNhbSWNyRwxhVg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Jan 2024 19:53:48 -0800
Message-ID: <CAMKF1sqz0-uE978BeQUsJ3RpGyh6a4LK3nbjBxhSHiuSZJw0fg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/4] classes/recipes: Switch to use inherit_defer
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 03:54:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193441

On Mon, Jan 8, 2024 at 7:49=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Jan 8, 2024 at 2:39=E2=80=AFPM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Mon, 2024-01-08 at 17:14 +0000, Ross Burton wrote:
> > > On 3 Jan 2024, at 14:59, Richard Purdie via lists.openembedded.org <r=
ichard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
> > > > --- a/meta/classes-recipe/gnomebase.bbclass
> > > > +++ b/meta/classes-recipe/gnomebase.bbclass
> > > > @@ -28,7 +28,7 @@ FILES:${PN} +=3D "${datadir}/application-registry=
  \
> > > > FILES:${PN}-doc +=3D "${datadir}/devhelp"
> > > >
> > > > GNOMEBASEBUILDCLASS ??=3D "meson"
> > > > -inherit ${GNOMEBASEBUILDCLASS} pkgconfig
> > > > +inherit_defer ${GNOMEBASEBUILDCLASS} pkgconfig
> > >
> > > Feels like this should be split into inherit pkgconfig and inher_defe=
r ${GNOMEBASEBUILDCLASS}.
> >
> > I guess did it this way for ease in the patch, it won't really make
> > much difference either way, particularly for pkgconfig given how simple
> > that class is.
> >
> > >
> > > > +inherit populate_sdk_base
> > > > +IMGCLASSES +=3D "${@['', 'populate_sdk_ext']['linux' in d.getVar("=
SDK_OS")]}"
> > >
> > > Whilst you=E2=80=99re here change this to foo if bar else flob, this =
boolean subsetting idiom drives me insane.
> >
> > I don't really mixing up changes as it just makes review harder so
> > whilst I don't mind changing that, I think it should be done
> > separately.
> >
> > > > --- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> > > > +++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> > > > @@ -14,7 +14,7 @@ SRC_URI =3D "${XORG_MIRROR}/individual/driver/${B=
PN}-${PV}${XORG_DRIVER_COMPRESSOR
> > > > FILES:${PN} +=3D " ${libdir}/xorg/modules/drivers/*.so"
> > > >
> > > > XORGBUILDCLASS ??=3D "autotools"
> > > > -inherit ${XORGBUILDCLASS} pkgconfig features_check
> > > > +inherit_defer ${XORGBUILDCLASS} pkgconfig features_check
> > >
> > > As above.
> > >
> > > > -inherit autotools texinfo binconfig-disabled pkgconfig ${PYTHON_IN=
HERIT} python3native multilib_header
> > > > +inherit autotools texinfo binconfig-disabled pkgconfig multilib_he=
ader
> > > > +inherit_defer ${PYTHON_INHERIT} python3native
> > >
> > > Why is python3native defered?
> >
> > In the past there were some ordering issues around the python classes
> > so I was just being careful not to cause more problems in the patchset
> > than I was already trying to debug. It probably isn't necessary but at
> > the time I wasn't 100% sure and there were bigger issues.
> >
> > I can make the above tweaks if they really bother you...
> >
>
> Look into evolution-data-server-native.bb from meta-gnome
> it inherits native and provides own default do_compile/do_install functio=
ns
>
> it now needs to use
> inherit_defer native
>
> which parses but then the functions provided by the recipe are overridden
> by ones from autotools class perhaps because it is deferred too ?
>

To add a bit more
diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-=
server-native.bb
b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server-nati=
ve.bb
index 8f5c9ffb67..e163576c02 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server-=
native.bb
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server-=
native.bb
@@ -5,7 +5,7 @@ inherit_defer native
 DEPENDS =3D "glib-2.0-native"

 # build native helpers
-do_compile() {
+do_compile:class-native() {
     cd ${S}/src/camel
     sed -i 's:#include "evolution-data-server-config.h"::g' camel-gen-tabl=
es.c
     ${CC} -o ${B}/camel-gen-tables camel-gen-tables.c ${CFLAGS} ${LDFLAGS}
@@ -17,7 +17,7 @@ do_compile() {
     ${CC} -o ${B}/gen-western-table gen-western-table.c ${CFLAGS}
${CFLAGS_glib} ${LDFLAGS} ${LDFLAGS_glib}
 }

-do_install() {
+do_install:class-native() {
     install -d ${D}${bindir}
     install -m 755 ${B}/* ${D}${bindir}
 }

works, but it seems wrong to do it like this

> > Cheers,
> >
> > Richard
> >
> >
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#193434): https://lists.openembedded.org/g/openembed=
ded-core/message/193434
> > Mute This Topic: https://lists.openembedded.org/mt/103502916/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >


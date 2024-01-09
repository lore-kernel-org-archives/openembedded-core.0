Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E6A6C46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 11:31:50 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.14506.1704799900670910939
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jan 2024 03:31:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=btJVLoZd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40e52ebd63dso269555e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 03:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1704799899; x=1705404699; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e4LLanetryquqgPr2yfiDjSoEbnJCLCjrvwYyFWV44k=;
        b=btJVLoZd6OjtG7T7FPOlRdYeDyl1e7Jbfyx9uSBz+teuzJtriAWJuxhbtkqCGG6XAI
         nj2SWzOuXWpLJD00T+C2uyzL82IRgOk2f9TgruRYJcp8sYUQs8g+v2PpZhEllzYBvxhc
         Bp4fFyMIoke/ctRqqrH8du2o92IF5W4ExxsoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704799899; x=1705404699;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e4LLanetryquqgPr2yfiDjSoEbnJCLCjrvwYyFWV44k=;
        b=bndVEpp5cLY3BNLotmmUzkjbZCBC7/hAtvTagkiNL1wUnIbK0mmW3AkK/B5h66zVEG
         30oi8XNQ34vSPbw3Y0XpDPnsK1ukofWAPyGqY1Iieg4TFNpxetdNfkc6sZNkKU1JT9sb
         kmKTF/ezGDzZNjBHqv3V7K6P1u0d0PwiCA/nZfRL6qqRU4LS+0rXzeePhsF/aGHI3XVW
         sJtwCFqlkYIGV3NveGc7BtvwrMi96zwGwPHpYqBec+puCiXkf7/IWPWjXAOBEBgLwtf+
         wMg87LNKxYIxwfm2dTVVFxlRCSRiW67OaK2UWTK4qJ1OHUp+Vl5qG/eEwn1izrdoqfMp
         XYsw==
X-Gm-Message-State: AOJu0Yy4apmYd+InT0QTWHr8PFNFQs20wPrWnKvp4DWyBUKweph0U9aU
	ebJHvZOPdnpnZAKOm3v4SXmlI+Xz8rIi/A==
X-Google-Smtp-Source: AGHT+IH04B+vgyi53s754ZEF4k4ByZKg3poUz/bfh1SCUTIletA2VTcS15eTWh0mh/wP7j8NsTe+Ug==
X-Received: by 2002:a05:600c:a42:b0:40d:8f82:79bb with SMTP id c2-20020a05600c0a4200b0040d8f8279bbmr2855474wmq.182.1704799899012;
        Tue, 09 Jan 2024 03:31:39 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:494c:2c49:a717:e3aa? ([2001:8b0:aba:5f3c:494c:2c49:a717:e3aa])
        by smtp.gmail.com with ESMTPSA id n43-20020a05600c502b00b0040e4abebaf7sm3234946wmr.34.2024.01.09.03.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 03:31:38 -0800 (PST)
Message-ID: <5ca39e406457c11db233d9dfc570548f0643c2b0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 4/4] classes/recipes: Switch to use
 inherit_defer
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 09 Jan 2024 11:31:37 +0000
In-Reply-To: <CAMKF1sqz0-uE978BeQUsJ3RpGyh6a4LK3nbjBxhSHiuSZJw0fg@mail.gmail.com>
References: <20240103145902.2124110-1-richard.purdie@linuxfoundation.org>
	 <20240103145902.2124110-4-richard.purdie@linuxfoundation.org>
	 <A0382FB4-C99B-4558-8B8B-D5A3A248C862@arm.com>
	 <62591061a843999d470506252d6044f50ac81228.camel@linuxfoundation.org>
	 <CAMKF1srS6EfRxA5ZSGAxZ7nLT9=wF2_DoP0EDNhbSWNyRwxhVg@mail.gmail.com>
	 <CAMKF1sqz0-uE978BeQUsJ3RpGyh6a4LK3nbjBxhSHiuSZJw0fg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 11:31:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193453

On Mon, 2024-01-08 at 19:53 -0800, Khem Raj wrote:
> On Mon, Jan 8, 2024 at 7:49=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:
> >=20
> > On Mon, Jan 8, 2024 at 2:39=E2=80=AFPM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >=20
> > > On Mon, 2024-01-08 at 17:14 +0000, Ross Burton wrote:
> > > > On 3 Jan 2024, at 14:59, Richard Purdie via lists.openembedded.org =
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
> > > > > --- a/meta/classes-recipe/gnomebase.bbclass
> > > > > +++ b/meta/classes-recipe/gnomebase.bbclass
> > > > > @@ -28,7 +28,7 @@ FILES:${PN} +=3D "${datadir}/application-regist=
ry  \
> > > > > FILES:${PN}-doc +=3D "${datadir}/devhelp"
> > > > >=20
> > > > > GNOMEBASEBUILDCLASS ??=3D "meson"
> > > > > -inherit ${GNOMEBASEBUILDCLASS} pkgconfig
> > > > > +inherit_defer ${GNOMEBASEBUILDCLASS} pkgconfig
> > > >=20
> > > > Feels like this should be split into inherit pkgconfig and inher_de=
fer ${GNOMEBASEBUILDCLASS}.
> > >=20
> > > I guess did it this way for ease in the patch, it won't really make
> > > much difference either way, particularly for pkgconfig given how simp=
le
> > > that class is.
> > >=20
> > > >=20
> > > > > +inherit populate_sdk_base
> > > > > +IMGCLASSES +=3D "${@['', 'populate_sdk_ext']['linux' in d.getVar=
("SDK_OS")]}"
> > > >=20
> > > > Whilst you=E2=80=99re here change this to foo if bar else flob, thi=
s boolean subsetting idiom drives me insane.
> > >=20
> > > I don't really mixing up changes as it just makes review harder so
> > > whilst I don't mind changing that, I think it should be done
> > > separately.
> > >=20
> > > > > --- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> > > > > +++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> > > > > @@ -14,7 +14,7 @@ SRC_URI =3D "${XORG_MIRROR}/individual/driver/$=
{BPN}-${PV}${XORG_DRIVER_COMPRESSOR
> > > > > FILES:${PN} +=3D " ${libdir}/xorg/modules/drivers/*.so"
> > > > >=20
> > > > > XORGBUILDCLASS ??=3D "autotools"
> > > > > -inherit ${XORGBUILDCLASS} pkgconfig features_check
> > > > > +inherit_defer ${XORGBUILDCLASS} pkgconfig features_check
> > > >=20
> > > > As above.
> > > >=20
> > > > > -inherit autotools texinfo binconfig-disabled pkgconfig ${PYTHON_=
INHERIT} python3native multilib_header
> > > > > +inherit autotools texinfo binconfig-disabled pkgconfig multilib_=
header
> > > > > +inherit_defer ${PYTHON_INHERIT} python3native
> > > >=20
> > > > Why is python3native defered?
> > >=20
> > > In the past there were some ordering issues around the python classes
> > > so I was just being careful not to cause more problems in the patchse=
t
> > > than I was already trying to debug. It probably isn't necessary but a=
t
> > > the time I wasn't 100% sure and there were bigger issues.
> > >=20
> > > I can make the above tweaks if they really bother you...
> > >=20
> >=20
> > Look into evolution-data-server-native.bb from meta-gnome
> > it inherits native and provides own default do_compile/do_install funct=
ions
> >=20
> > it now needs to use
> > inherit_defer native
> >=20
> > which parses but then the functions provided by the recipe are overridd=
en
> > by ones from autotools class perhaps because it is deferred too ?
> >=20
>=20
> To add a bit more
> diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-dat=
a-server-native.bb
> b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server-na=
tive.bb
> index 8f5c9ffb67..e163576c02 100644
> --- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r-native.bb
> +++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r-native.bb
> @@ -5,7 +5,7 @@ inherit_defer native
>  DEPENDS =3D "glib-2.0-native"
>=20
>  # build native helpers
> -do_compile() {
> +do_compile:class-native() {
>      cd ${S}/src/camel
>      sed -i 's:#include "evolution-data-server-config.h"::g' camel-gen-ta=
bles.c
>      ${CC} -o ${B}/camel-gen-tables camel-gen-tables.c ${CFLAGS} ${LDFLAG=
S}
> @@ -17,7 +17,7 @@ do_compile() {
>      ${CC} -o ${B}/gen-western-table gen-western-table.c ${CFLAGS}
> ${CFLAGS_glib} ${LDFLAGS} ${LDFLAGS_glib}
>  }
>=20
> -do_install() {
> +do_install:class-native() {
>      install -d ${D}${bindir}
>      install -m 755 ${B}/* ${D}${bindir}
>  }
>=20
> works, but it seems wrong to do it like this

This is the unfortunate corner case this change triggers unfortunately.

The gnomebase class has a conditional variable for whether to use
autotools or meson. This means meson/autotools are put into
inherit_defer since they depend on the value of GNOMEBASEBUILDCLASS.

This means autotools is deferred to after these variables are set and
the values from the class override the originals. That said, autotools
uses EXPORT_FUNCTIONS against do_compile this so it should not happen.

I did dive into what is actually going on and the issue is that
do_compile is an EXPORT_FUNCTION from both base.bbclass and from
autotools.bbclass.

export functions overwrite their own versions, the issue looks to be
that the setting from base.bbclass sets the magic flag to say it is
special and the new value from the recipe doesn't clear the magic flag.
That would be a separate bug. I think we can improve the
export_functions logic to fix that.

I do agree this kind of issue isn't optimal however I think some of the
current behaviours are probably worse and if we can move core classes
away from deferred inherits (e.g. let gnome recipes pick autotools or
meson directly), these issues should be rare.

Cheers,

Richard







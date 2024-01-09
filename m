Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01A34C46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 14:17:41 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.17806.1704809859690811011
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jan 2024 06:17:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=On7oR7Wo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3367a304091so2841171f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 06:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1704809858; x=1705414658; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xcNclTH0OK/TodyIprqT5b+V7KtFEC5bPgYBy3Go2eY=;
        b=On7oR7WoS+FPoPVghaSzSRZjQyHURMGFmr0WS9OZucLRS09Q2CR/yWgfsWpvp4qFgK
         Z7ZJpkG9VMt287a1JoaJlXHCY9wKymsjlMsgxYn+yCt+eoSx8F8/lWxS99LYe+Y8DTbI
         BllCEz6LvyUWEfnyMwlvMcyoFMifDnIM02y4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704809858; x=1705414658;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xcNclTH0OK/TodyIprqT5b+V7KtFEC5bPgYBy3Go2eY=;
        b=ixHv2GInU5xepqdueRTTkWCcv48h3jGUN8l7s19j+dhWcQl2vJniwmth5UqNMnOio2
         2GAdp8g0pLeRV42k2s0xIBYXbV9sXhdSeBqjFmxNE9WK3QRar6Su3vLOiqe2G60lViWs
         KvXyF8kXbAhtVZcbv77QPKlqEFl6ORaT1JxIM7aGPDJt2EkC8gynjNJzcPYbPjz5eyar
         PYj/IJ/LGNCeoply8SWEuPgtl6N4+5IMDicS8+sMKRV+MIwhl24tNurOyhrFWPWlynE/
         rw2P7jk3VILvWCesRpGVOo3U+fqWky8SSJc1i7wZnPiHvqK2YGfEuZkrnoW+8SIGLdt2
         v0jg==
X-Gm-Message-State: AOJu0Yx9FBkpDzDNCPe/qNW7+BwFPfqbJmwDWcAu5nRguMJH42X9AU10
	OtKlvvz9QV/rzGVUxLdxQc1D/u+5XvZD9g==
X-Google-Smtp-Source: AGHT+IEhbIUeT4H33bdlZQkW6QF8VqQTME1+z2y6LkrBkdpG+pVsVTIvBcYPgPXTSwRlckpyLGJ0VQ==
X-Received: by 2002:a5d:5046:0:b0:336:599a:5dd9 with SMTP id h6-20020a5d5046000000b00336599a5dd9mr402886wrt.196.1704809858037;
        Tue, 09 Jan 2024 06:17:38 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:494c:2c49:a717:e3aa? ([2001:8b0:aba:5f3c:494c:2c49:a717:e3aa])
        by smtp.gmail.com with ESMTPSA id z14-20020a5d4c8e000000b00336ebf27d59sm2527104wrs.78.2024.01.09.06.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 06:17:37 -0800 (PST)
Message-ID: <99137b26dcbf86a7d9573694f98d69e96fbcddd7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 4/4] classes/recipes: Switch to use
 inherit_defer
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 09 Jan 2024 14:17:36 +0000
In-Reply-To: <17A8AA7A46DC51F8.24350@lists.openembedded.org>
References: <20240103145902.2124110-1-richard.purdie@linuxfoundation.org>
	 <20240103145902.2124110-4-richard.purdie@linuxfoundation.org>
	 <A0382FB4-C99B-4558-8B8B-D5A3A248C862@arm.com>
	 <62591061a843999d470506252d6044f50ac81228.camel@linuxfoundation.org>
	 <CAMKF1srS6EfRxA5ZSGAxZ7nLT9=wF2_DoP0EDNhbSWNyRwxhVg@mail.gmail.com>
	 <CAMKF1sqz0-uE978BeQUsJ3RpGyh6a4LK3nbjBxhSHiuSZJw0fg@mail.gmail.com>
	 <17A8AA7A46DC51F8.24350@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 14:17:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193460

On Tue, 2024-01-09 at 11:31 +0000, Richard Purdie via
lists.openembedded.org wrote:
> On Mon, 2024-01-08 at 19:53 -0800, Khem Raj wrote:
> > On Mon, Jan 8, 2024 at 7:49=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wr=
ote:
> > >=20
> > > On Mon, Jan 8, 2024 at 2:39=E2=80=AFPM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >=20
> > > > On Mon, 2024-01-08 at 17:14 +0000, Ross Burton wrote:
> > > > > On 3 Jan 2024, at 14:59, Richard Purdie via lists.openembedded.or=
g <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
> > > > > > --- a/meta/classes-recipe/gnomebase.bbclass
> > > > > > +++ b/meta/classes-recipe/gnomebase.bbclass
> > > > > > @@ -28,7 +28,7 @@ FILES:${PN} +=3D "${datadir}/application-regi=
stry  \
> > > > > > FILES:${PN}-doc +=3D "${datadir}/devhelp"
> > > > > >=20
> > > > > > GNOMEBASEBUILDCLASS ??=3D "meson"
> > > > > > -inherit ${GNOMEBASEBUILDCLASS} pkgconfig
> > > > > > +inherit_defer ${GNOMEBASEBUILDCLASS} pkgconfig
> > > > >=20
> > > > > Feels like this should be split into inherit pkgconfig and inher_=
defer ${GNOMEBASEBUILDCLASS}.
> > > >=20
> > > > I guess did it this way for ease in the patch, it won't really make
> > > > much difference either way, particularly for pkgconfig given how si=
mple
> > > > that class is.
> > > >=20
> > > > >=20
> > > > > > +inherit populate_sdk_base
> > > > > > +IMGCLASSES +=3D "${@['', 'populate_sdk_ext']['linux' in d.getV=
ar("SDK_OS")]}"
> > > > >=20
> > > > > Whilst you=E2=80=99re here change this to foo if bar else flob, t=
his boolean subsetting idiom drives me insane.
> > > >=20
> > > > I don't really mixing up changes as it just makes review harder so
> > > > whilst I don't mind changing that, I think it should be done
> > > > separately.
> > > >=20
> > > > > > --- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> > > > > > +++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> > > > > > @@ -14,7 +14,7 @@ SRC_URI =3D "${XORG_MIRROR}/individual/driver=
/${BPN}-${PV}${XORG_DRIVER_COMPRESSOR
> > > > > > FILES:${PN} +=3D " ${libdir}/xorg/modules/drivers/*.so"
> > > > > >=20
> > > > > > XORGBUILDCLASS ??=3D "autotools"
> > > > > > -inherit ${XORGBUILDCLASS} pkgconfig features_check
> > > > > > +inherit_defer ${XORGBUILDCLASS} pkgconfig features_check
> > > > >=20
> > > > > As above.
> > > > >=20
> > > > > > -inherit autotools texinfo binconfig-disabled pkgconfig ${PYTHO=
N_INHERIT} python3native multilib_header
> > > > > > +inherit autotools texinfo binconfig-disabled pkgconfig multili=
b_header
> > > > > > +inherit_defer ${PYTHON_INHERIT} python3native
> > > > >=20
> > > > > Why is python3native defered?
> > > >=20
> > > > In the past there were some ordering issues around the python class=
es
> > > > so I was just being careful not to cause more problems in the patch=
set
> > > > than I was already trying to debug. It probably isn't necessary but=
 at
> > > > the time I wasn't 100% sure and there were bigger issues.
> > > >=20
> > > > I can make the above tweaks if they really bother you...
> > > >=20
> > >=20
> > > Look into evolution-data-server-native.bb from meta-gnome
> > > it inherits native and provides own default do_compile/do_install fun=
ctions
> > >=20
> > > it now needs to use
> > > inherit_defer native
> > >=20
> > > which parses but then the functions provided by the recipe are overri=
dden
> > > by ones from autotools class perhaps because it is deferred too ?
> > >=20
> >=20
> > To add a bit more
> > diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-d=
ata-server-native.bb
> > b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server-=
native.bb
> > index 8f5c9ffb67..e163576c02 100644
> > --- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-ser=
ver-native.bb
> > +++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-ser=
ver-native.bb
> > @@ -5,7 +5,7 @@ inherit_defer native
> >  DEPENDS =3D "glib-2.0-native"
> >=20
> >  # build native helpers
> > -do_compile() {
> > +do_compile:class-native() {
> >      cd ${S}/src/camel
> >      sed -i 's:#include "evolution-data-server-config.h"::g' camel-gen-=
tables.c
> >      ${CC} -o ${B}/camel-gen-tables camel-gen-tables.c ${CFLAGS} ${LDFL=
AGS}
> > @@ -17,7 +17,7 @@ do_compile() {
> >      ${CC} -o ${B}/gen-western-table gen-western-table.c ${CFLAGS}
> > ${CFLAGS_glib} ${LDFLAGS} ${LDFLAGS_glib}
> >  }
> >=20
> > -do_install() {
> > +do_install:class-native() {
> >      install -d ${D}${bindir}
> >      install -m 755 ${B}/* ${D}${bindir}
> >  }
> >=20
> > works, but it seems wrong to do it like this
>=20
> This is the unfortunate corner case this change triggers unfortunately.
>=20
> The gnomebase class has a conditional variable for whether to use
> autotools or meson. This means meson/autotools are put into
> inherit_defer since they depend on the value of GNOMEBASEBUILDCLASS.
>=20
> This means autotools is deferred to after these variables are set and
> the values from the class override the originals. That said, autotools
> uses EXPORT_FUNCTIONS against do_compile this so it should not happen.
>=20
> I did dive into what is actually going on and the issue is that
> do_compile is an EXPORT_FUNCTION from both base.bbclass and from
> autotools.bbclass.
>=20
> export functions overwrite their own versions, the issue looks to be
> that the setting from base.bbclass sets the magic flag to say it is
> special and the new value from the recipe doesn't clear the magic flag.
> That would be a separate bug. I think we can improve the
> export_functions logic to fix that.
>=20
> I do agree this kind of issue isn't optimal however I think some of the
> current behaviours are probably worse and if we can move core classes
> away from deferred inherits (e.g. let gnome recipes pick autotools or
> meson directly), these issues should be rare.

There is a patch for bitbake on master-next which fixes
EXPORT_FUNCTIONS and adds tests for it. That should fix the issue here.

Cheers,

Richard


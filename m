Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC14C77B7C
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 12:47:16 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.57795.1683809233013415679
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 May 2023 05:47:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=XsrzNXC0;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: max.oss.09@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3064099f9b6so5580183f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 05:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683809231; x=1686401231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5WKYXojpBIoluLWN1+oYPEtTVHzvjr3m0kfL7JFBoP8=;
        b=XsrzNXC0+o2jOnLXpdff0lEl3KA6a2EXiQxXlgaHpIBuQZjTT5C+dFROVbTiXwU7U8
         yvXi+hkJEBfUBDW1WhgIOCxEiYEaIQgH94bTSt1ld5Lb/iq5rrfxlUSCtI3NOYrdYSO3
         UXnPfuNAX20g0zIooGUMW3nV2n+9v88zJM8zywVlwFw/W4H+99lCft1XzpVf85AOOKEA
         R99TWykBo7JUyNixXUqD2FS/am83OqgmTBGnW8n3q/014I3/FwcnwZNb/Pquvd9WkU9R
         Tcu4sUCuw0wOItEHOH3Wj/FAGlM+sCCHpvSDxyvgTK+7jImOqqxdE8o4LHIJwdTwa/u6
         55hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683809231; x=1686401231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5WKYXojpBIoluLWN1+oYPEtTVHzvjr3m0kfL7JFBoP8=;
        b=a6CBJ5zfG9ZzIPO2OO9mqzX/Y9eBAeqArvrT5PEDui3x1zT9qObA9PiiGJrkRdNkGv
         s2C8JJLIUqbbaJPJWinlyeErzo/Ex8QspsjAoiT0gslS/WhAwGo6R3K18nUDH8a4BPhX
         OnstUf+4jTr0lvzVNrStzYUWHi83Y2AzkwSt4cFf/j7xxtnCmCRrlh4qdoWVzrzrUCeU
         IV5y3c5jsyLW5eIjNlb+znmIBLTS3GR1go8DZIiLRqPhQ3+9N6dr/EusEbSlmx+CYSR3
         FTlHVTCybPAfXGHUQ2NYaVNzJtFdQnrj+/OFjOVq5MuqXd+RNgWbS3iXzRe12kLsfxJY
         TyAQ==
X-Gm-Message-State: AC+VfDzzFqmB6fMxolu0b6dONYZyWW5O/FoMBJ44kh+9L8T0ZOvqwFUa
	k5o0Z7CY025PXPiwx8xuxLzdVEJ8g94rbjZupC8=
X-Google-Smtp-Source: ACHHUZ6cUTcJg1YIybcPMaJdRALcKC9CO2z/EFXkW6M453uAchZm38vizmARHG8Eh6JmVHETUl5mJeafWQaNZgLlyRQ=
X-Received: by 2002:adf:e7ca:0:b0:306:a780:83fd with SMTP id
 e10-20020adfe7ca000000b00306a78083fdmr16713155wrn.47.1683809231224; Thu, 11
 May 2023 05:47:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230509161310.3839898-1-max.oss.09@gmail.com>
 <20230509161310.3839898-2-max.oss.09@gmail.com> <CANPvuR=RD3POyxB1cbYaBG_4Vq3gprCPYQNwZZxRQyuKPGxZbQ@mail.gmail.com>
 <CADkTA4O6VaBt9qgb4oOhsFGhmnEQB04uxe7HuqEgLOi3a8WzZg@mail.gmail.com>
In-Reply-To: <CADkTA4O6VaBt9qgb4oOhsFGhmnEQB04uxe7HuqEgLOi3a8WzZg@mail.gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Thu, 11 May 2023 14:47:00 +0200
Message-ID: <CAEHkU3WsJ6cgszxybwUyLYKPGvaknTf3jrZ6T=GwBYfVEqB9eQ@mail.gmail.com>
Subject: Re: [OE-core][Patch v2 1/3] libtraceevent: import from meta-openembedded
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Jose Quaresma <quaresma.jose@gmail.com>, openembedded-core@lists.openembedded.org, 
	raj.khem@gmail.com, Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 12:47:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181131

Hi all

Thanks for volunteering Bruce.
As there is no other feedback I will prepare a V3 in a minute.

Regards,
Max

On Wed, May 10, 2023 at 10:00=E2=80=AFPM Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
> On Tue, May 9, 2023 at 1:09=E2=80=AFPM Jose Quaresma <quaresma.jose@gmail=
.com> wrote:
> >
> > Hi Max,
> >
> > This also needs an entry on meta/conf/distro/include/maintainers.inc
> >
>
> Max,
>
> I'm already maintaining perf, so if you want to put my name beside
> libraceevent for a v3, that's fine with me.
>
> Bruce
>
> > Jose
> >
> > Max Krummenacher <max.oss.09@gmail.com> escreveu no dia ter=C3=A7a, 9/0=
5/2023 =C3=A0(s) 17:13:
> >>
> >> From: Max Krummenacher <max.krummenacher@toradex.com>
> >>
> >> Import from meta-openembedded at commit d250a0dc0 ("libtraceevent:
> >> upgrade 1.7.1 -> 1.7.2").
> >> Starting with kernel 6.4 libtraceevent is a dependency of perf. While
> >> one can still build perf without it by opting out one would loose its
> >> functionality compared with building perf from kernels before 6.4
> >>
> >> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> >> ---
> >>  ...not-preserve-ownership-in-cp-command.patch | 40 ++++++++++++++++++=
+
> >>  .../libtraceevent/libtraceevent_1.7.2.bb      | 25 ++++++++++++
> >>  2 files changed, 65 insertions(+)
> >>  create mode 100644 meta/recipes-kernel/libtraceevent/libtraceevent/00=
01-makefile-Do-not-preserve-ownership-in-cp-command.patch
> >>  create mode 100644 meta/recipes-kernel/libtraceevent/libtraceevent_1.=
7.2.bb
> >>
> >> diff --git a/meta/recipes-kernel/libtraceevent/libtraceevent/0001-make=
file-Do-not-preserve-ownership-in-cp-command.patch b/meta/recipes-kernel/li=
btraceevent/libtraceevent/0001-makefile-Do-not-preserve-ownership-in-cp-com=
mand.patch
> >> new file mode 100644
> >> index 0000000000..5e88048817
> >> --- /dev/null
> >> +++ b/meta/recipes-kernel/libtraceevent/libtraceevent/0001-makefile-Do=
-not-preserve-ownership-in-cp-command.patch
> >> @@ -0,0 +1,40 @@
> >> +From ed0a31000305d937abe47c44d705b5b52bb36f79 Mon Sep 17 00:00:00 200=
1
> >> +From: Khem Raj <raj.khem@gmail.com>
> >> +Date: Thu, 22 Dec 2022 18:32:17 -0800
> >> +Subject: [PATCH] makefile: Do not preserve ownership in cp command
> >> +
> >> +Fixes
> >> +
> >> +ERROR: libtraceevent-1.7.0-r0 do_package_qa: QA Issue: libtraceevent:=
 /usr/lib/libtraceevent.a is owned by uid 1000, which is the same as the us=
er running bitbake. This may be due to host contamination [host-user-contam=
inated]
> >> +
> >> +Upstream-Status: Pending
> >> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> +---
> >> + Makefile | 4 ++--
> >> + 1 file changed, 2 insertions(+), 2 deletions(-)
> >> +
> >> +diff --git a/Makefile b/Makefile
> >> +index 965ff47..0e782cb 100644
> >> +--- a/Makefile
> >> ++++ b/Makefile
> >> +@@ -287,7 +287,7 @@ $(BUILD_PREFIX): force
> >> +       $(Q)$(call build_prefix,$(prefix))
> >> +
> >> + define do_make_pkgconfig_file
> >> +-      cp -f ${PKG_CONFIG_SOURCE_FILE}.template ${PKG_CONFIG_FILE};  =
  \
> >> ++      install -m 0644 ${PKG_CONFIG_SOURCE_FILE}.template ${PKG_CONFI=
G_FILE};  \
> >> +       sed -i "s|INSTALL_PREFIX|${1}|g" ${PKG_CONFIG_FILE};          =
  \
> >> +       sed -i "s|LIB_VERSION|${EVENT_PARSE_VERSION}|g" ${PKG_CONFIG_F=
ILE}; \
> >> +       sed -i "s|LIB_DIR|${libdir_relative}|g" ${PKG_CONFIG_FILE}; \
> >> +@@ -335,7 +335,7 @@ install: install_libs install_plugins
> >> +
> >> + install_libs: libs install_headers install_pkgconfig
> >> +       $(Q)$(call do_install,$(LIBTRACEEVENT_SHARED),$(libdir_SQ)); \
> >> +-              cp -fpR $(LIB_INSTALL) $(DESTDIR)$(libdir_SQ)
> >> ++              cp --no-preserve=3Downership --recursive $(LIB_INSTALL=
) $(DESTDIR)$(libdir_SQ)
> >> +       $(Q)$(call install_ld_config)
> >> +
> >> + install_pkgconfig: $(PKG_CONFIG_FILE)
> >> +--
> >> +2.39.0
> >> +
> >> diff --git a/meta/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb =
b/meta/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb
> >> new file mode 100644
> >> index 0000000000..089b6814c7
> >> --- /dev/null
> >> +++ b/meta/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb
> >> @@ -0,0 +1,25 @@
> >> +# Copyright (C) 2022 Khem Raj <raj.khem@gmail.com>
> >> +# Released under the MIT license (see COPYING.MIT for the terms)
> >> +
> >> +SUMMARY =3D "API to access the kernel tracefs directory"
> >> +HOMEPAGE =3D "https://git.kernel.org/pub/scm/libs/libtrace/libtracefs=
.git/"
> >> +LICENSE =3D "GPL-2.0-or-later & LGPL-2.1-or-later"
> >> +LIC_FILES_CHKSUM =3D "file://LICENSES/GPL-2.0;md5=3De6a75371ba4d16749=
254a51215d13f97 \
> >> +                    file://LICENSES/LGPL-2.1;md5=3Db370887980db5dd406=
59b50909238dbd"
> >> +SECTION =3D "libs"
> >> +
> >> +SRCREV =3D "1c6f0f3b2bb47571fc455dc565dc343152517d98"
> >> +SRC_URI =3D "git://git.kernel.org/pub/scm/libs/libtrace/libtraceevent=
.git;branch=3D${BPN};protocol=3Dhttps \
> >> +           file://0001-makefile-Do-not-preserve-ownership-in-cp-comma=
nd.patch"
> >> +
> >> +S =3D "${WORKDIR}/git"
> >> +
> >> +inherit pkgconfig
> >> +
> >> +do_install() {
> >> +    oe_runmake install DESTDIR=3D${D} pkgconfig_dir=3D${libdir}/pkgco=
nfig
> >> +}
> >> +
> >> +PACKAGES +=3D "${PN}-plugins"
> >> +
> >> +FILES:${PN}-plugins +=3D "${libdir}/traceevent/plugins"
> >> --
> >> 2.35.3
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#181050): https://lists.openembedded.org/g/openembe=
dded-core/message/181050
> >> Mute This Topic: https://lists.openembedded.org/mt/98787450/5052612
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[quaresma.jose@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
> >
> >
> > --
> > Best regards,
> >
> > Jos=C3=A9 Quaresma
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II


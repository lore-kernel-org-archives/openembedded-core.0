Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4628C7EE29
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 16:35:50 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web10.16864.1685032541423002184
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 09:35:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=MW/X5Rqy;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5557b621ceeso217735eaf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 09:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685032540; x=1687624540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W53lhj1aqMyKn0r34lbDzobV8WUHBpK+7QG8mpfs3J8=;
        b=MW/X5RqylI1C94DKypAHG4dY9Wi6ucranY7bJdkkwUHGKHetNGBThk8stOKlfQRXUV
         NVfFCekg55HCWdnTNEisrqaEKrRU6RbJ8LghevY0lLuPlacujT3TKLnTjz0r6SRdbOwI
         C6XXNG0wjJj/CKIiruBVOzZc0phEQk2nykyaf/2C4xiB3sDy1cdZWcerX4zxRYsuK4kP
         0XCfkN4Shn7/o4BNeYAmGKhpaN9xACEfLycMQlZVvNTcODr/bS/iUxG2frPV5NwCahMn
         RSJXPgwFauA2NPs6H5yKk0gcndhrYcGKG1UdoGpLCA2veUoA1ieKKXOSaZwRGNIZY5Fu
         m5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685032540; x=1687624540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W53lhj1aqMyKn0r34lbDzobV8WUHBpK+7QG8mpfs3J8=;
        b=aJZxgyitLpD1FLRfzUMhBrd1SrcACXoKjWyaDdKaGjbT1MEE3u/tP1Msp8ijxfHQWU
         QeU0p78zht3a2qUPFUvfZ1qJrzw/s4/DiVD6S0kzfIKgCzMu+QMskyRCNYPdb/6U0FRZ
         oNngCsVPpkIGjWOwk36ZOLEQs81Cy83JRZSxK0T/PDuwsHzABmeXWHaYs30AD6WRPlY2
         9sIR/j4eOzb+A44unVWFiB2qoad40rc4Tep9U/oBlDvKkdopTbrtlFHjG/yQVC5W+7Vg
         Gtmlc9eC3RX0vw6BXcCU/lCLLywdPeolyTJtbQpGscsN+8QUAhlEI9S8lBOseRrLvENS
         w3nA==
X-Gm-Message-State: AC+VfDxTVGintpbP752C50WLoLvUTWE5Un8zyJh1wzLOoGmRv5qi/cAc
	c+Zd26M3XaMaREqNyGjVgDsmqbY97VUJyiMTIBE=
X-Google-Smtp-Source: ACHHUZ6OJxFuOWmysAukkPDNqlatdX+/ijdzHdmuvUVOk76/o2wGN2sL6t8BoLR+WEO61w9lCH4YjByojjxzWp+3CZE=
X-Received: by 2002:a4a:3947:0:b0:555:ccd3:6e9a with SMTP id
 x7-20020a4a3947000000b00555ccd36e9amr1485359oog.9.1685032540431; Thu, 25 May
 2023 09:35:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230511232214.993328-1-max.oss.09@gmail.com> <20230511232214.993328-2-max.oss.09@gmail.com>
 <CAMKF1sro1exZADTnwjuTPXsU8otXuk86ZThF4uU6DePFQ0AP6w@mail.gmail.com> <CAEHkU3X+sXAa-dgvDfgbS0ChSiQ74V8JG80ucX+xX-ft3hJKYw@mail.gmail.com>
In-Reply-To: <CAEHkU3X+sXAa-dgvDfgbS0ChSiQ74V8JG80ucX+xX-ft3hJKYw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 25 May 2023 09:35:14 -0700
Message-ID: <CAMKF1sqr2X5ogkNMrzE1WmBhvyKGh6kJq4RiFDn6F4W6cJnWhw@mail.gmail.com>
Subject: Re: [OE-core][Patch v4 1/4] libtraceevent: import from meta-openembedded
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>, 
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, 
	"quaresma.jose@gmail.com" <quaresma.jose@gmail.com>, Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 16:35:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181722

On Thu, May 25, 2023 at 12:14=E2=80=AFAM Max Krummenacher <max.oss.09@gmail=
.com> wrote:
>
> Hi Khem
>
> On Thursday, May 25, 2023, Khem Raj <raj.khem@gmail.com> wrote:
> > Hi Max
> >
> > I am seeing
> >
> > The file /usr/lib/traceevent/plugins/plugin_cfg80211.so is installed
> > by both perf and libtraceevent, aborting
> >
> > When building sdk with both libtraceevent and perf added to image.
>
>
> I didn't test anything SDK with this patchset. Sorry.
>
> I'm currently on vacation and not able to do real OE work.
>
> I guess the quickest way out would be to remove in perf.bb libtraceevent =
from the enabled packageconfigs.
>
> I expect perf from kernels before 6.4 to work as before the patchset and =
perf at 6.4 to not fail to build, albeit without traceevent support.
>
> Does this sound like a plan?

I think it might make sense to package them in

/usr/lib/${BPN}/plugins/

That makes space for both.

> Max
> >
> > On Thu, May 11, 2023 at 4:22=E2=80=AFPM Max Krummenacher <max.oss.09@gm=
ail.com> wrote:
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
> >>  meta/conf/distro/include/maintainers.inc      |  1 +
> >>  ...not-preserve-ownership-in-cp-command.patch | 40 ++++++++++++++++++=
+
> >>  .../libtraceevent/libtraceevent_1.7.2.bb      | 25 ++++++++++++
> >>  3 files changed, 66 insertions(+)
> >>  create mode 100644 meta/recipes-kernel/libtraceevent/libtraceevent/00=
01-makefile-Do-not-preserve-ownership-in-cp-command.patch
> >>  create mode 100644 meta/recipes-kernel/libtraceevent/libtraceevent_1.=
7.2.bb
> >>
> >> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/dist=
ro/include/maintainers.inc
> >> index ec7ea90d16..3071671850 100644
> >> --- a/meta/conf/distro/include/maintainers.inc
> >> +++ b/meta/conf/distro/include/maintainers.inc
> >> @@ -402,6 +402,7 @@ RECIPE_MAINTAINER:pn-libtirpc =3D "Anuj Mittal <an=
uj.mittal@intel.com>"
> >>  RECIPE_MAINTAINER:pn-libtool =3D "Robert Yang <liezhi.yang@windriver.=
com>"
> >>  RECIPE_MAINTAINER:pn-libtool-cross =3D "Robert Yang <liezhi.yang@wind=
river.com>"
> >>  RECIPE_MAINTAINER:pn-libtool-native =3D "Robert Yang <liezhi.yang@win=
driver.com>"
> >> +RECIPE_MAINTAINER:pn-libtraceevent =3D "Bruce Ashfield <bruce.ashfiel=
d@gmail.com>"
> >>  RECIPE_MAINTAINER:pn-libtry-tiny-perl =3D "Tim Orling <tim.orling@kon=
sulko.com>"
> >>  RECIPE_MAINTAINER:pn-libucontext =3D "Khem Raj <raj.khem@gmail.com>"
> >>  RECIPE_MAINTAINER:pn-libunistring =3D "Anuj Mittal <anuj.mittal@intel=
.com>"
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
> >


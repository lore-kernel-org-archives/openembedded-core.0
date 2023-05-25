Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BE91C77B7C
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 01:43:25 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web11.2608.1684978997493339568
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 May 2023 18:43:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=PHBzA3uf;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6af896f0908so742169a34.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 18:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684978997; x=1687570997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhZ/aiaeuesysBYqbkO5G8CFSulqq6x98yHr0Uw79ps=;
        b=PHBzA3ufHEHN6um53Qt7GcF09nal1Kx4l++RROe1bRlZ+906TDr84fAXON2DZEAxfc
         E7Hi468lB6MYg0RFsCuXXqD0R7RYzwSX0t3XhGIX3yrhZlae3+H1uuF6wIEWMSv8DENP
         PDXRpSqUzMG4jhf8cpSGJ/+J4ZCW+9lDLZ2Si1lloqRutjeylBh+A8NG/QSfDOmma2DC
         fCCtITZvoT2z4zsazsBWHSxqNxJSLuDYHq/ZmrAlGo//h9IliuoasCsLjPC13TeR09qz
         BHovrIfetRSUv94HIO0urI2C0d6VLBmnTbf2wleUFJKYI6gTdo8eVU50JBCqytn/0x5t
         M9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684978997; x=1687570997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qhZ/aiaeuesysBYqbkO5G8CFSulqq6x98yHr0Uw79ps=;
        b=HVOjiXMIV6d6+rZfqTwiXWASUIib23Y6DO4MUB0rnfuYaI/1t26T1p9HlwG4I1EJlJ
         EnGTtMz/UHnm7BOKCelYLFjejebep/rBfh1rchVJQ3wSBiOHtfA7Jp1qVxm6U/0St+7A
         8mDDhlHNe50e3hfQYb0QIvl5JyAVm812oViTxMbRYjR9C4brqxft5a0UkO0Iwm4jQUzx
         OhIoxi53mi+eLCJWt9Ci/+5ohic3oZte5xEH02ndv3cOijMG4dJDUWR0bE+zzIPo4Nf4
         p6iPEsJoDXHzTiTfQgABG/MmZdcRaEiJjs/Z7K1eISlJ+E2PT7Lnl9aR7tGFDM+p0uYJ
         G1rA==
X-Gm-Message-State: AC+VfDyg7t1HUxSGZMw/e5H+24wWXDegTsgCCj0pWHg/eNrZZG3KnTz2
	7NrDJDKiAkcWDXRiJIEfoe2KABz23vCCEyWSSRE=
X-Google-Smtp-Source: ACHHUZ77LEiRiGqTAnPyJh8DpOPjX2wCGN2zwiCh8/5a6NiM6AnostPgQmXAdp+bUFJilHKJEerPfeYcR0xSZhypD70=
X-Received: by 2002:a05:6871:6a87:b0:19e:db32:4918 with SMTP id
 zf7-20020a0568716a8700b0019edb324918mr623018oab.26.1684978996541; Wed, 24 May
 2023 18:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230511232214.993328-1-max.oss.09@gmail.com> <20230511232214.993328-2-max.oss.09@gmail.com>
In-Reply-To: <20230511232214.993328-2-max.oss.09@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 24 May 2023 18:42:50 -0700
Message-ID: <CAMKF1sro1exZADTnwjuTPXsU8otXuk86ZThF4uU6DePFQ0AP6w@mail.gmail.com>
Subject: Re: [OE-core][Patch v4 1/4] libtraceevent: import from meta-openembedded
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: openembedded-core@lists.openembedded.org, bruce.ashfield@gmail.com, 
	alexandre.belloni@bootlin.com, quaresma.jose@gmail.com, 
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 01:43:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181696

Hi Max

I am seeing

The file /usr/lib/traceevent/plugins/plugin_cfg80211.so is installed
by both perf and libtraceevent, aborting

When building sdk with both libtraceevent and perf added to image.

On Thu, May 11, 2023 at 4:22=E2=80=AFPM Max Krummenacher <max.oss.09@gmail.=
com> wrote:
>
> From: Max Krummenacher <max.krummenacher@toradex.com>
>
> Import from meta-openembedded at commit d250a0dc0 ("libtraceevent:
> upgrade 1.7.1 -> 1.7.2").
> Starting with kernel 6.4 libtraceevent is a dependency of perf. While
> one can still build perf without it by opting out one would loose its
> functionality compared with building perf from kernels before 6.4
>
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> ---
>  meta/conf/distro/include/maintainers.inc      |  1 +
>  ...not-preserve-ownership-in-cp-command.patch | 40 +++++++++++++++++++
>  .../libtraceevent/libtraceevent_1.7.2.bb      | 25 ++++++++++++
>  3 files changed, 66 insertions(+)
>  create mode 100644 meta/recipes-kernel/libtraceevent/libtraceevent/0001-=
makefile-Do-not-preserve-ownership-in-cp-command.patch
>  create mode 100644 meta/recipes-kernel/libtraceevent/libtraceevent_1.7.2=
.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index ec7ea90d16..3071671850 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -402,6 +402,7 @@ RECIPE_MAINTAINER:pn-libtirpc =3D "Anuj Mittal <anuj.=
mittal@intel.com>"
>  RECIPE_MAINTAINER:pn-libtool =3D "Robert Yang <liezhi.yang@windriver.com=
>"
>  RECIPE_MAINTAINER:pn-libtool-cross =3D "Robert Yang <liezhi.yang@windriv=
er.com>"
>  RECIPE_MAINTAINER:pn-libtool-native =3D "Robert Yang <liezhi.yang@windri=
ver.com>"
> +RECIPE_MAINTAINER:pn-libtraceevent =3D "Bruce Ashfield <bruce.ashfield@g=
mail.com>"
>  RECIPE_MAINTAINER:pn-libtry-tiny-perl =3D "Tim Orling <tim.orling@konsul=
ko.com>"
>  RECIPE_MAINTAINER:pn-libucontext =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-libunistring =3D "Anuj Mittal <anuj.mittal@intel.co=
m>"
> diff --git a/meta/recipes-kernel/libtraceevent/libtraceevent/0001-makefil=
e-Do-not-preserve-ownership-in-cp-command.patch b/meta/recipes-kernel/libtr=
aceevent/libtraceevent/0001-makefile-Do-not-preserve-ownership-in-cp-comman=
d.patch
> new file mode 100644
> index 0000000000..5e88048817
> --- /dev/null
> +++ b/meta/recipes-kernel/libtraceevent/libtraceevent/0001-makefile-Do-no=
t-preserve-ownership-in-cp-command.patch
> @@ -0,0 +1,40 @@
> +From ed0a31000305d937abe47c44d705b5b52bb36f79 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Thu, 22 Dec 2022 18:32:17 -0800
> +Subject: [PATCH] makefile: Do not preserve ownership in cp command
> +
> +Fixes
> +
> +ERROR: libtraceevent-1.7.0-r0 do_package_qa: QA Issue: libtraceevent: /u=
sr/lib/libtraceevent.a is owned by uid 1000, which is the same as the user =
running bitbake. This may be due to host contamination [host-user-contamina=
ted]
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + Makefile | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 965ff47..0e782cb 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -287,7 +287,7 @@ $(BUILD_PREFIX): force
> +       $(Q)$(call build_prefix,$(prefix))
> +
> + define do_make_pkgconfig_file
> +-      cp -f ${PKG_CONFIG_SOURCE_FILE}.template ${PKG_CONFIG_FILE};    \
> ++      install -m 0644 ${PKG_CONFIG_SOURCE_FILE}.template ${PKG_CONFIG_F=
ILE};  \
> +       sed -i "s|INSTALL_PREFIX|${1}|g" ${PKG_CONFIG_FILE};            \
> +       sed -i "s|LIB_VERSION|${EVENT_PARSE_VERSION}|g" ${PKG_CONFIG_FILE=
}; \
> +       sed -i "s|LIB_DIR|${libdir_relative}|g" ${PKG_CONFIG_FILE}; \
> +@@ -335,7 +335,7 @@ install: install_libs install_plugins
> +
> + install_libs: libs install_headers install_pkgconfig
> +       $(Q)$(call do_install,$(LIBTRACEEVENT_SHARED),$(libdir_SQ)); \
> +-              cp -fpR $(LIB_INSTALL) $(DESTDIR)$(libdir_SQ)
> ++              cp --no-preserve=3Downership --recursive $(LIB_INSTALL) $=
(DESTDIR)$(libdir_SQ)
> +       $(Q)$(call install_ld_config)
> +
> + install_pkgconfig: $(PKG_CONFIG_FILE)
> +--
> +2.39.0
> +
> diff --git a/meta/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb b/m=
eta/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb
> new file mode 100644
> index 0000000000..089b6814c7
> --- /dev/null
> +++ b/meta/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb
> @@ -0,0 +1,25 @@
> +# Copyright (C) 2022 Khem Raj <raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +SUMMARY =3D "API to access the kernel tracefs directory"
> +HOMEPAGE =3D "https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.gi=
t/"
> +LICENSE =3D "GPL-2.0-or-later & LGPL-2.1-or-later"
> +LIC_FILES_CHKSUM =3D "file://LICENSES/GPL-2.0;md5=3De6a75371ba4d16749254=
a51215d13f97 \
> +                    file://LICENSES/LGPL-2.1;md5=3Db370887980db5dd40659b=
50909238dbd"
> +SECTION =3D "libs"
> +
> +SRCREV =3D "1c6f0f3b2bb47571fc455dc565dc343152517d98"
> +SRC_URI =3D "git://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.gi=
t;branch=3D${BPN};protocol=3Dhttps \
> +           file://0001-makefile-Do-not-preserve-ownership-in-cp-command.=
patch"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit pkgconfig
> +
> +do_install() {
> +    oe_runmake install DESTDIR=3D${D} pkgconfig_dir=3D${libdir}/pkgconfi=
g
> +}
> +
> +PACKAGES +=3D "${PN}-plugins"
> +
> +FILES:${PN}-plugins +=3D "${libdir}/traceevent/plugins"
> --
> 2.35.3
>


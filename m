Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 513B0CDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 19:13:54 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.21440.1697138028116164252
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Oct 2023 12:13:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NsKYhAak;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: danismostlikely@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5a7c7262d5eso16673297b3.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 12:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697138027; x=1697742827; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nA76sq9GwP3UaRwapUFmbR+8fxGBO2XuDIIIUG29e9A=;
        b=NsKYhAakj4CpzP1V+63K/j0qKXTAHt5a+W8frFLKymaaQsnbwlDjuEBb7gNXMwjBdx
         mGbk9DqbVLhEHhOmNt4cT4WhUB3XAL+ShdcbepKouhtH8rSOeK0OfaGIi0PP4vSdQe3A
         468SwHdqeSCLT7vwuNKdLSwjdG/yHSFrZhZ+OSVL/R2Sv3moUsOHw5r54FfAYdUYQkgo
         M7LO/iJ1HkBIdEa/FQEEZLWYlRCwz669xhHWquN5PQwCeDs2btZ+UqSF7PH4WUSMxtud
         Q0uqdmRq8jM76uZbN0yOLkObyvMK0i0DT7GMMkMLuizaZVErDOgM7T+0ITkYgQsSUh3y
         NoXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697138027; x=1697742827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nA76sq9GwP3UaRwapUFmbR+8fxGBO2XuDIIIUG29e9A=;
        b=XqPR5A4IFRy6/qxWcBiyEmR+7cUFFF+Lc5Bdtdg/AjgPD1PkAixTy3UrxuvuvLjZis
         3+21cZoV5KHmgYOuVDMxYFip4I4Tp4de4TrLngGLmatqL8zpErggek7Fmg4FKq59mOxO
         BePnD6bfOWH7k7TbZ4x5MmOtbJYgu+se4mr5Pt5lTikj68hY+k+oGRYhEXz6D8QFCQ45
         aoUctVjvrg+wB3l6dc7VjFgOQ8POzP0NT9PztkXmgUxhrf1dL9gUozZT6MTuDHkbYxTw
         C9V/juhNt+wOCqMgNfMaH3JQfVQlIygIO13GnYGR0i9bT7JRln+5H+XWizxwsnzgin3a
         OGxA==
X-Gm-Message-State: AOJu0Yyk7u7IIecZujHxEQB+iDAh6y3Qvg92ztzKtvt47RQXz41U3JI7
	GFjjWCdk2uD672FxQJPYwPavJ5mClYX5jiywDigiRXo3gyw=
X-Google-Smtp-Source: AGHT+IFgSBs6afzzOZNRpF3ZJMHfN2kg5iKs9tuWu/wrXO7fJdBeUMDqy7NsKJ2Mv+2/UFlPDnTfGYYMGg+MxJTyKEY=
X-Received: by 2002:a25:2390:0:b0:d9a:4367:1a92 with SMTP id
 j138-20020a252390000000b00d9a43671a92mr9091219ybj.50.1697138027117; Thu, 12
 Oct 2023 12:13:47 -0700 (PDT)
MIME-Version: 1.0
References: <178D69637BC0FE4A.21112@lists.openembedded.org> <VI1PR0102MB3136ED4E889CF9917E846BABFCD3A@VI1PR0102MB3136.eurprd01.prod.exchangelabs.com>
In-Reply-To: <VI1PR0102MB3136ED4E889CF9917E846BABFCD3A@VI1PR0102MB3136.eurprd01.prod.exchangelabs.com>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Thu, 12 Oct 2023 13:13:35 -0600
Message-ID: <CACS+7ZSSvH5=H0j2EENJ0wYR5p0rsGNEwWLyVYQq-++dfBjuSg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] libtirpc: Support ipv6 in DISTRO_FEATURES
To: joerg.sommer@navimatix.de
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 19:13:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189021

On Thu, 12 Oct 2023 at 11:10, J=C3=B6rg Sommer via lists.openembedded.org
<joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:
>
> This is only a minor change, because oelint-adv had warned about the spac=
e after " of PACKAGECONFIG.
>
> ________________________________
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> on behalf of J=C3=B6rg Sommer via lists.openembedded.org <=
joerg.sommer=3Dnavimatix.de@lists.openembedded.org>
> Sent: Thursday, 12 October 2023 18:34
> To: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>
> Cc: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> Subject: [OE-core] [PATCH v3] libtirpc: Support ipv6 in DISTRO_FEATURES
>
> If the ipv6 feature for the distribution is not set, the package should n=
ot
> contain settings for ipv6. This makes rpcbind doesn't try to bind to a IP=
v6
> socket, and complain that this fails.
>
> Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> ---
>  .../libtirpc/libtirpc/ipv6.patch              | 52 +++++++++++++++++++
>  .../libtirpc/libtirpc_1.3.2.bb                |  6 +++
>  2 files changed, 58 insertions(+)
>  create mode 100644 meta/recipes-extended/libtirpc/libtirpc/ipv6.patch
>
> diff --git a/meta/recipes-extended/libtirpc/libtirpc/ipv6.patch b/meta/re=
cipes-extended/libtirpc/libtirpc/ipv6.patch
> new file mode 100644
> index 0000000000..f746f986f4
> --- /dev/null
> +++ b/meta/recipes-extended/libtirpc/libtirpc/ipv6.patch
> @@ -0,0 +1,52 @@
> +From 077bbd32e8b7474dc5f153997732e1e6aec7fad6 Mon Sep 17 00:00:00 2001
> +Message-Id: <077bbd32e8b7474dc5f153997732e1e6aec7fad6.1697120796.git.joe=
rg.sommer@navimatix.de>
> +From: =3D?UTF-8?q?J=3DC3=3DB6rg=3D20Sommer?=3D <joerg.sommer@navimatix.d=
e>
> +Date: Thu, 12 Oct 2023 16:22:59 +0200
> +Subject: [PATCH] netconfig: remove tcp6, udp6 on --disable-ipv6
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +If the configuration for IPv6 is disabled, the netconfig should not cont=
ain
> +settings for tcp6 and udp6.
> +
> +The test for the configure option didn't work, because it check the wron=
g
> +variable.
> +
> +Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> +Upstream-Status: Submitted [libtirpc-devel@lists.sourceforge.net]
> +Upstream-Status: Submitted [linux-nfs@vger.kernel.org]
> +---
> + configure.ac    | 2 +-
> + doc/Makefile.am | 5 +++++
> + 2 files changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index fe6c517..b687f8d 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -64,7 +64,7 @@ fi
> + AC_ARG_ENABLE(ipv6,
> +        [AC_HELP_STRING([--disable-ipv6], [Disable IPv6 support @<:@defa=
ult=3Dno@:>@])],
> +        [],[enable_ipv6=3Dyes])
> +-AM_CONDITIONAL(INET6, test "x$disable_ipv6" !=3D xno)
> ++AM_CONDITIONAL(INET6, test "x$enable_ipv6" !=3D xno)
> + if test "x$enable_ipv6" !=3D xno; then
> +        AC_DEFINE(INET6, 1, [Define to 1 if IPv6 is available])
> + fi
> +diff --git a/doc/Makefile.am b/doc/Makefile.am
> +index d42ab90..b9678f6 100644
> +--- a/doc/Makefile.am
> ++++ b/doc/Makefile.am
> +@@ -2,3 +2,8 @@ dist_sysconf_DATA      =3D netconfig bindresvport.blackl=
ist
> +
> + CLEANFILES           =3D cscope.* *~
> + DISTCLEANFILES               =3D Makefile.in
> ++
> ++if ! INET6
> ++install-exec-hook:
> ++      $(SED) -i '/^tcp6\|^udp6/d' "$(DESTDIR)$(sysconfdir)"/netconfig
> ++endif
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb b/meta/reci=
pes-extended/libtirpc/libtirpc_1.3.2.bb
> index 6980135a92..edb98082f2 100644
> --- a/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb
> +++ b/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb
> @@ -11,6 +11,7 @@ PROVIDES =3D "virtual/librpc"
>
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
>             file://CVE-2021-46828.patch \
> +          file://ipv6.patch \
>            "
>  UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/libtirpc/files/=
libtirpc/"
>  UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)/"
> @@ -20,6 +21,11 @@ inherit autotools pkgconfig
>
>  EXTRA_OECONF =3D "--disable-gssapi"
>
> +PACKAGECONFIG ??=3D "\
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
> +"
> +PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6"

Looks like this will conflict with recent changes I made to master, so
hopefully those can be resolved automatically.

> +
>  do_install:append() {
>          test -e ${D}${sysconfdir}/netconfig && chown root:root ${D}${sys=
confdir}/netconfig
>  }
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189009): https://lists.openembedded.org/g/openembedde=
d-core/message/189009
> Mute This Topic: https://lists.openembedded.org/mt/101921995/3617261
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [da=
nismostlikely@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


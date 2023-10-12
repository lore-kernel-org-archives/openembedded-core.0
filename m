Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F10CDB47E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 17:26:03 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web11.18453.1697131555928029549
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Oct 2023 10:25:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bc8TdZUO;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1e1b1b96746so694576fac.2
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 10:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697131555; x=1697736355; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TYWA3lhINUSnVrcniNXfck1AhfVODvILIQq7A1eF4c4=;
        b=bc8TdZUOgaj5+tditQin3PJqMBwjWvenmYAeypiFPpagYkK6mvBWEbxcY34B2SayFw
         HOVIym7Ii11mbGE69hEkwolJPBeIk8bnPR1GGCYXfdriRyoPbmwTG9ZCkSULfXmuGFXL
         vppMZsCmKMglFoFplo2Wup70juJFwZQKIcYLjFEqCb9AzvnNwvsFSfEB0DcUSZp/1ba6
         lmoEUxf2mgN31kp4sKmYzIuMHxpsqZgN8zXYZEYLtHprdxoASyVfNrc9krYpJoQhCM+v
         nBscJdSwc49Qb1n6yBwTs/VnaTeO850mV5HE0XWdQbI9+SoJjmE386Y7hSog5537inhy
         WJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697131555; x=1697736355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TYWA3lhINUSnVrcniNXfck1AhfVODvILIQq7A1eF4c4=;
        b=DzevYIQ/ejfFTZFuqfPhZLzpfmG7uqrcgKpKY6WZOC+SwWp/tWV4YP5y3+Igb3/R3q
         i5Cwi34MdC+lAYFAlrfNMdr+vXkmodKL5OyPLn6tpjeZs8YG/ydraZAYWzeUWCJyrt3a
         joebrEc4heBbyAofLHepCczgClgpd91hQXgZTwap0zz7p+1uVR6gX//CRcc7F/w0s1G9
         YxEbP8gwRKJUHdCSU4UzychcTXzpy6DtZXA3Jt/NFdfDE1Y+DZ44c+rFV/gXiYi5g35i
         IfyB27/PEwRLPQ9rZH4b3uVL1mK7PJ9/BSKBujcnw/LEuGSZ0Zd/IvHBT5WqaNFBfUJ9
         farw==
X-Gm-Message-State: AOJu0YxI4JpuUaz/hNPrcciwRPTNZnXd6RlWvxbK+XC+PpP6U3W+UNSI
	7oQrWAOlGKWKExk+YLBhERwGnbzB2To4NfsGixlYOzorM18=
X-Google-Smtp-Source: AGHT+IE4NHtJOW+ygwFu7FZIs+OwKKpS2E30cgk4K82q/nj1/NYSJSJtk86nnJnIAUfGbSfcs/ryLYxO5FQcc1NmCTI=
X-Received: by 2002:a05:6870:d7a7:b0:1d5:a72e:154e with SMTP id
 bd39-20020a056870d7a700b001d5a72e154emr26518711oab.36.1697131554707; Thu, 12
 Oct 2023 10:25:54 -0700 (PDT)
MIME-Version: 1.0
References: <178D69637BC0FE4A.21112@lists.openembedded.org> <VI1PR0102MB3136ED4E889CF9917E846BABFCD3A@VI1PR0102MB3136.eurprd01.prod.exchangelabs.com>
In-Reply-To: <VI1PR0102MB3136ED4E889CF9917E846BABFCD3A@VI1PR0102MB3136.eurprd01.prod.exchangelabs.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 Oct 2023 10:25:28 -0700
Message-ID: <CAMKF1sqA=pzkyjEkqzFPwwGdwYc4XtJt2PYfb2MT0sq35SZTrA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] libtirpc: Support ipv6 in DISTRO_FEATURES
To: joerg.sommer@navimatix.de
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 17:26:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189010

On Thu, Oct 12, 2023 at 10:10=E2=80=AFAM J=C3=B6rg Sommer via
lists.openembedded.org
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

Does this change compiling for native/nativesdk variants in anyway ?

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
> Mute This Topic: https://lists.openembedded.org/mt/101921995/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


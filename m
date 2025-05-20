Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD09C3DA6D
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 19:16:54 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.29396.1747768604772103256
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 12:16:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1uHSSA-0002zZ-1i; Tue, 20 May 2025 21:16:42 +0200
Message-ID: <3bbafcb2f994db5cceeaed7199df3cfdf94532c5.camel@pengutronix.de>
Subject: Re: [OE-core] [PATCH] openssl-native(sdk): poision built in paths
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: danismostlikely@gmail.com, openembedded-core@lists.openembedded.org
Cc: PTX-Internal Yocto List <yocto@pengutronix.de>
Date: Tue, 20 May 2025 21:16:40 +0200
In-Reply-To: <20250228203206.1979714-3-danismostlikely@gmail.com>
References: <20250228203206.1979714-1-danismostlikely@gmail.com>
	 <20250228203206.1979714-3-danismostlikely@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 19:16:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216932

Hi,

Am Freitag, dem 28.02.2025 um 14:32 -0600 schrieb Dan McGregor via lists.op=
enembedded.org:
> From: Dan McGregor <dan.mcgregor@usask.ca>
>=20
> Long ago, in the OpenSSL 1.1 days changing CFLAGS worked to override
> hard-coded paths in the OpenSSL libraries. Even as far back as
> kirkstone this was no longer working.
>=20
> Override make variables instead to poision the paths that get built
> into the native (and nativesdk) libraries so they become relocatable
> again.
>=20
> While here, remove the -isystem<foo> compiler argument from the compiler
> command line stored in the library, just like we already remove the
> prefix-map and sysroot arguments.

while this might be required to bypass some search path automatisms in open=
ssl (to allow
relocation), another effect of forcing the directory variables to be invali=
d is that it renders the
generated native pkg-config file (libcrypto.pc) unusable:

  prefix=3D${pcfiledir}/../../../usr
  exec_prefix=3D${prefix}
  libdir=3D${exec_prefix}/lib
  includedir=3D${prefix}/include=20
  enginesdir=3D${libdir}/../../../../../../../../../../../../../../../../no=
t/builtin
  modulesdir=3D${libdir}/../../../../../../../../../../../../../../../../no=
t/builtin

  Name: OpenSSL-libcrypto
  Description: OpenSSL cryptography library
  Version: 3.4.1
  Libs: -L${libdir} -lcrypto
  Libs.private: -ldl -pthread
  Cflags: -I${includedir}

This will prevent other native tools (like libp11-native) from installing t=
heir (.so) files into
valid OpenSSL directories.

Haven't found a good solution for this, yet. But I'm also unsure if the rel=
ocation is actually an
issue if it has been broken since kirkstone?

Maybe someone has experienced similar issues?


Thanks and regards

Enrico

> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> ---
> =C2=A0...-sysroot-and-debug-prefix-map-from-co.patch | 18 +++++++++++----=
---
> =C2=A0.../openssl/openssl_3.4.1.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 4 ++--
> =C2=A02 files changed, 13 insertions(+), 9 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-str=
ip-sysroot-and-debug-
> prefix-map-from-co.patch b/meta/recipes-connectivity/openssl/openssl/0001=
-buildinfo-strip-sysroot-
> and-debug-prefix-map-from-co.patch
> index b8672735abe..91a95d89290 100644
> --- a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysr=
oot-and-debug-prefix-map-
> from-co.patch
> +++ b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysr=
oot-and-debug-prefix-map-
> from-co.patch
> @@ -30,23 +30,26 @@ Update to fix buildpaths qa issue for '-ffile-prefix-=
map'.
> =C2=A0Signed-off-by: Khem Raj <raj.khem@gmail.com>
> =C2=A0
> =C2=A0---
> - Configurations/unix-Makefile.tmpl | 12 +++++++++++-
> + Configurations/unix-Makefile.tmpl | 16 +++++++++++++++-
> =C2=A0 crypto/build.info=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> - 2 files changed, 12 insertions(+), 2 deletions(-)
> + 2 files changed, 16 insertions(+), 2 deletions(-)
> =C2=A0
> -Index: openssl-3.0.4/Configurations/unix-Makefile.tmpl
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- openssl-3.0.4.orig/Configurations/unix-Makefile.tmpl
> -+++ openssl-3.0.4/Configurations/unix-Makefile.tmpl
> -@@ -502,13 +502,23 @@ BIN_LDFLAGS=3D{- join(' ', $target{bin_lflags} || =
(),
> +diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Mak=
efile.tmpl
> +index 09303c4..011bda1 100644
> +--- a/Configurations/unix-Makefile.tmpl
> ++++ b/Configurations/unix-Makefile.tmpl
> +@@ -502,13 +502,27 @@ BIN_LDFLAGS=3D{- join(' ', $target{bin_lflags} || =
(),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 '$(CNF_LDFLAGS)', '$(LDFLAGS)') -}
> =C2=A0 BIN_EX_LIBS=3D$(CNF_EX_LIBS) $(EX_LIBS)
> =C2=A0=20
> =C2=A0-# CPPFLAGS_Q is used for one thing only: to build up buildinf.h
> =C2=A0+# *_Q variables are used for one thing only: to build up buildinf.=
h
> =C2=A0 CPPFLAGS_Q=3D{- $cppflags1 =3D~ s|([\\"])|\\$1|g;
> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 $cppflags1 =3D~ s|-isystem/[^ ]+/usr/include||g;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 $cppflags2 =3D~ s|([\\"])|\\$1|g;
> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 $cppflags2 =3D~ s|-isystem/[^ ]+/usr/include||g;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 $lib_cppflags =3D~ s|([\\"])|\\$1|g;
> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 $lib_cppflags =3D~ s|-isystem/[^ ]+/usr/include||g;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 join(' ', $lib_cppflags || (), $cppflags2 || (),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 $cppflags1 || ()) -}
> =C2=A0=20
> @@ -54,6 +57,7 @@ Index: openssl-3.0.4/Configurations/unix-Makefile.tmpl
> =C2=A0+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 s|-fdebug-prefix-map=3D[^ ]+|-fdebug-prefix-map=3D|g;
> =C2=A0+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 s|-fmacro-prefix-map=3D[^ ]+|-fmacro-prefix-map=3D|g;
> =C2=A0+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 s|-ffile-prefix-map=3D[^ ]+|-ffile-prefix-map=3D|g;
> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 s|-isystem/[^ ]+/usr/include ||g;
> =C2=A0+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 }
> =C2=A0+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 join(' ', @{$config{CFLAGS}}) -}
> =C2=A0+
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.4.1.bb b/meta/re=
cipes-
> connectivity/openssl/openssl_3.4.1.bb
> index 1a054a36753..8da64aea6a3 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.4.1.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.4.1.bb
> @@ -49,8 +49,8 @@ EXTRA_OECONF:append:class-native =3D " --with-rand-seed=
=3Dos,devrandom"
> =C2=A0EXTRA_OECONF:append:class-nativesdk =3D " --with-rand-seed=3Dos,dev=
random"
> =C2=A0
> =C2=A0# Relying on hardcoded built-in paths causes openssl-native to not =
be relocateable from sstate.
> -CFLAGS:append:class-native =3D " -DOPENSSLDIR=3D/not/builtin -DENGINESDI=
R=3D/not/builtin"
> -CFLAGS:append:class-nativesdk =3D " -DOPENSSLDIR=3D/not/builtin -DENGINE=
SDIR=3D/not/builtin"
> +EXTRA_OEMAKE:append:task-compile:class-native =3D ' OPENSSLDIR=3D"/not/b=
uiltin"
> ENGINESDIR=3D"/not/builtin" MODULESDIR=3D"/not/builtin"'
> +EXTRA_OEMAKE:append:task-compile:class-nativesdk =3D ' OPENSSLDIR=3D"/no=
t/builtin"
> ENGINESDIR=3D"/not/builtin" MODULESDIR=3D"/not/builtin"'
> =C2=A0
> =C2=A0# This allows disabling deprecated or undesirable crypto algorithms=
.
> =C2=A0# The default is to trust upstream choices.
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#212078): https://lists.openembedded.org/g/openembedde=
d-core/message/212078
> Mute This Topic: https://lists.openembedded.org/mt/111441623/3616721
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=C2=
=A0[ejo@pengutronix.de]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Pengutronix e.K.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| Enrico J=C3=B6rns=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
Embedded Linux Consulting & Support=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| https://www.pengutronix.de/ |
Steuerwalder Str. 21=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| Phone: +49-5121-206917-180=C2=A0=C2=A0|
31137 Hildesheim, Germany=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| Fax:=C2=A0=C2=
=A0=C2=A0+49-5121-206917-9=C2=A0=C2=A0=C2=A0=C2=A0|


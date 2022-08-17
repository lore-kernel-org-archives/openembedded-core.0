Return-Path: <mikko.rapeli@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 681D7C25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 14:32:15 +0000 (UTC)
Received: from esa4.hc324-48.eu.iphmx.com (esa4.hc324-48.eu.iphmx.com
 [207.54.71.48])
 by mx.groups.io with SMTP id smtpd.web11.29309.1660746728292447399
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 07:32:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1
 header.b=dx4i+f3f;
 spf=pass (domain: bmw.de, ip: 207.54.71.48,
 mailfrom: prvs=22116a6d0=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1660746728; x=1692282728;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=+gxGe+mtuIQIpM7Z8X0MVYkyZOfqn1ogMLPSNfICnBU=;
  b=dx4i+f3fWVTyU4vFsFZGvAl3orX1voVP1BQBUPSd0vzfwzRKncGm65vt
   OyEJbt5EFvytKY/yM/RgYdzJjIJSX6WFOWK0+Fr8LbvIEBo8d1Y/N28Z/
   vDlJ1hEewiRpp5XMdj2ObzrUY0/bqIqVguQaaljpeZSUffski7E8QUnbs
   0=;
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
 esa4.hc324-48.eu.iphmx.com with ESMTP/TLS; 17 Aug 2022 16:32:05 +0200
Received: from esabb4.muc ([160.50.100.33])  by esagw3.muc with ESMTP/TLS;
 17 Aug 2022 16:32:05 +0200
Received: from smucm30k.bmwgroup.net (HELO SMUCM30K.europe.bmw.corp)
 ([160.46.167.47])
 by esabb4.muc with ESMTP/TLS; 17 Aug 2022 16:32:05 +0200
Received: from SMUCMP08G.europe.bmw.corp (10.30.13.73) by
 SMUCM30K.europe.bmw.corp
 (160.46.167.47) with Microsoft SMTP Server (TLS;
 Wed, 17 Aug 2022 16:32:04 +0200
Received: from SMUCMP08E.europe.bmw.corp (2a03:1e80:a15:58f::1:24) by
 SMUCMP08G.europe.bmw.corp (2a03:1e80:a15:58f::2039) with Microsoft SMTP
 Server (version=TLS; Wed, 17 Aug 2022 16:32:04 +0200
Received: from SMUCMP08E.europe.bmw.corp ([10.30.13.71]) by
 SMUCMP08E.europe.bmw.corp ([10.30.13.71]) with mapi id 15.02.0922.027; Wed,
 17 Aug 2022 16:32:04 +0200
From: <Mikko.Rapeli@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: <steve@sakoman.com>
Subject: Re: [OE-core] [PATCH][kirkstone] boost: fix install of fiber shared
 libraries
Thread-Topic: [OE-core] [PATCH][kirkstone] boost: fix install of fiber shared
 libraries
Thread-Index: AQHYqvANyXbrRRnifEWVvx5gPjjiAq2zFNWA
Date: Wed, 17 Aug 2022 14:32:04 +0000
Message-ID: <Yvz74zSeKsf8e9ky@korppu>
References: <17094AB0976F2F91.7414@lists.openembedded.org>
In-Reply-To: <17094AB0976F2F91.7414@lists.openembedded.org>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="us-ascii"
Content-ID: <17A2A4D652E171439BA28D13CBDD1073@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Aug 2022 14:32:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169486

Hi,

Is there a problem applying this to kirkstone? Master and other
branches are not affected.

Cheers,

-Mikko

On Mon, Aug 08, 2022 at 09:27:19AM +0300, bounce+67612+169014+3616751+99821=
26@lists.openembedded.org wrote:
> From: Mikko Rapeli <mikko.rapeli@bmw.de>
>=20
> For fiber, only CMake modules were installed in boost 1.78.0.
> In 1.79.0 and versions before 1.78.0 also the shared libraries
> are installed. This upstream patch fixes the issue in 1.78.0.
>=20
> Note that boost git repo does not show changes in tools/build
> directory between 1.78.0 and 1.79.0 tags but the release tar balls
> contain a large update of which this one is needed to fix the missing
> shared libraries.
>=20
> Only kirkstone is affected.
>=20
> buildhistory shows the difference in metadata boost-fiber binary package
> without and with this patch:
>=20
>  --- a/packages/core2-64-poky-linux/boost/boost-fiber/latest
>  +++ b/packages/core2-64-poky-linux/boost/boost-fiber/latest
> @@ -1,8 +1,9 @@
>  PV =3D 1.78.0
>  PR =3D r0
> -RPROVIDES =3D
> -RDEPENDS =3D
> +PKG =3D libboost-fiber1.78.0
> +RPROVIDES =3D boost-fiber (=3D1.78.0)
> +RDEPENDS =3D boost-context (>=3D 1.78.0) glibc (>=3D 2.35) libgcc (>=3D =
11.3.0) libstdc++ (>=3D 11.3.0)
>  RRECOMMENDS =3D
> -PKGSIZE =3D 0
> +PKGSIZE =3D 80032
>  FILES =3D /usr/lib/libboost_fiber*.so.*
> -FILELIST =3D
> +FILELIST =3D /usr/lib/libboost_fiber.so.1.78.0
>=20
> Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> ---
>  ...ll-targets-if-there-s-build-no-in-ur.patch | 82 +++++++++++++++++++
>  meta/recipes-support/boost/boost_1.78.0.bb    |  1 +
>  2 files changed, 83 insertions(+)
>  create mode 100644 meta/recipes-support/boost/boost/0001-Don-t-skip-inst=
all-targets-if-there-s-build-no-in-ur.patch
>=20
> diff --git a/meta/recipes-support/boost/boost/0001-Don-t-skip-install-tar=
gets-if-there-s-build-no-in-ur.patch b/meta/recipes-support/boost/boost/000=
1-Don-t-skip-install-targets-if-there-s-build-no-in-ur.patch
> new file mode 100644
> index 0000000000..df8b285700
> --- /dev/null
> +++ b/meta/recipes-support/boost/boost/0001-Don-t-skip-install-targets-if=
-there-s-build-no-in-ur.patch
> @@ -0,0 +1,82 @@
> +From 78fd284a42caabe8815cb0870b46e5567872e75b Mon Sep 17 00:00:00 2001
> +From: Dmitry <grisumbras@gmail.com>
> +Date: Sat, 11 Dec 2021 16:58:23 +0300
> +Subject: [PATCH] Don't skip install targets if there's <build>no in ureq=
s
> + (#113)
> +
> +---
> + src/tools/stage.jam      |  4 ++++
> + test/install_build_no.py | 26 ++++++++++++++++++++++++++
> + test/test_all.py         |  1 +
> + 3 files changed, 31 insertions(+)
> + create mode 100755 test/install_build_no.py
> +
> +Fixes install of boost fiber shared libraries which are missing in 1.78.=
0
> +but working in 1.79.0. Only kirkstone affected by this.
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> +
> +diff --git a/tools/build/src/tools/stage.jam b/tools/build/src/tools/sta=
ge.jam
> +index c5f02e3ba..325129dc8 100644
> +--- a/tools/build/src/tools/stage.jam
> ++++ b/tools/build/src/tools/stage.jam
> +@@ -478,6 +478,10 @@ class install-target-class : basic-target
> +         return [ sequence.unique $(result2) ] ;
> +     }
> +=20
> ++    rule skip-from-usage-requirements ( )
> ++    {
> ++    }
> ++
> +     # Returns true iff 'type' is subtype of some element of 'types-to-i=
nclude'.
> +     #
> +     local rule include-type ( type : types-to-include * )
> +diff --git a/tools/build/test/install_build_no.py b/tools/build/test/ins=
tall_build_no.py
> +new file mode 100755
> +index 000000000..0ccf3c5cc
> +--- /dev/null
> ++++ b/tools/build/test/install_build_no.py
> +@@ -0,0 +1,26 @@
> ++#!/usr/bin/python
> ++
> ++# Copyright 2021 Dmitry Arkhipov (grisumbras@gmail.com)
> ++# Distributed under the Boost Software License, Version 1.0.
> ++# (See accompanying file LICENSE.txt or https://www.bfgroup.xyz/b2/LICE=
NSE.txt)
> ++
> ++# Check that <build>no in usage-requirements of dependencies does not a=
ffect
> ++# install rule, i.e. a skipped installed target does not affect insalla=
tion of
> ++# other targets.
> ++
> ++import BoostBuild
> ++
> ++t =3D BoostBuild.Tester()
> ++
> ++t.write("a.cpp", "int main() {}\n")
> ++
> ++t.write("jamroot.jam", """
> ++make x : : maker : <build>no ;
> ++exe a : a.cpp ;
> ++install install : x a ;
> ++""")
> ++
> ++t.run_build_system()
> ++t.expect_addition("install/a.exe")
> ++
> ++t.cleanup()
> +diff --git a/tools/build/test/test_all.py b/tools/build/test/test_all.py
> +index b7ef5ad70..9ed729d01 100644
> +--- a/tools/build/test/test_all.py
> ++++ b/tools/build/test/test_all.py
> +@@ -250,6 +250,7 @@ tests =3D ["abs_workdir",
> +          "inherit_toolset",
> +          "inherited_dependency",
> +          "inline",
> ++         "install_build_no",
> +          "libjpeg",
> +          "liblzma",
> +          "libpng",
> +--=20
> +2.20.1
> +
> diff --git a/meta/recipes-support/boost/boost_1.78.0.bb b/meta/recipes-su=
pport/boost/boost_1.78.0.bb
> index 58be9dcf12..08364a4c3c 100644
> --- a/meta/recipes-support/boost/boost_1.78.0.bb
> +++ b/meta/recipes-support/boost/boost_1.78.0.bb
> @@ -7,4 +7,5 @@ SRC_URI +=3D "file://boost-CVE-2012-2677.patch \
>             file://0001-dont-setup-compiler-flags-m32-m64.patch \
>             file://de657e01635306085488290ea83de541ec393f8b.patch \
>             file://0001-futex-fix-build-on-32-bit-architectures-using-64-=
bit.patch \
> +           file://0001-Don-t-skip-install-targets-if-there-s-build-no-in=
-ur.patch \
>             "
> --=20
> 2.20.1
>=20

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169014): https://lists.openembedded.org/g/openembedde=
d-core/message/169014
> Mute This Topic: https://lists.openembedded.org/mt/92886894/3616751
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mi=
kko.rapeli@bmw.de]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


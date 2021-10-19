Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD42C433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 20:59:37 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.16143.1634677175342441986
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 13:59:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=i5sChB7M;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1634677175;
  x=1666213175;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=cmbdU7Rf4cfjK01w8NLY5VBykkrFEB2iB1olNbb1jVs=;
  b=i5sChB7Mhl/iEXHlOfQpn/1/7pZFzGEs5VpOZ5a/b+fSG6xFmwsv/lVy
   kHA2EdqhE2HNTTkDDoGxzVx7kVCZLJVTNZ/dTVWItp8dKD/iFXRp6owQL
   zGnIaeUyilatGI0x23tJp7clptgNBg8A6qz9AGm8Vf5A62eyP6uifL2/d
   lDi0DNMfA5dIWpwxbxHqwzc81KasrGHVSOVqXPMMRIx1Cw1UXbZ5z5Nec
   WnzJ2RzNTBEIqLeJm9bn1s4mcbDiem4ZhUljFbZd0f9rvj36Ew4NAnQS0
   RYTcFHdZrFd5kWeFstptQghxJlXZ+GtJglg2mp5CIk+9VTcU9d04Y2dhz
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Martin Jansa <Martin.Jansa@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] boost: allow searching for python310
Thread-Topic: [OE-core] [PATCH] boost: allow searching for python310
Thread-Index: AQHXxOcB7bJJah2r6Em2Q8Ci+/pVH6vay0sA
Date: Tue, 19 Oct 2021 20:59:31 +0000
Message-ID: <fb4a068fa1dc4786be0fb969392d910f@axis.com>
References: <20211019124332.14158-1-Martin.Jansa@gmail.com>
In-Reply-To: <20211019124332.14158-1-Martin.Jansa@gmail.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 20:59:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157245

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Martin Jansa
> Sent: den 19 oktober 2021 14:44
> To: openembedded-core@lists.openembedded.org
> Cc: Martin Jansa <Martin.Jansa@gmail.com>
> Subject: [OE-core] [PATCH] boost: allow searching for python310
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  ....cmake-allow-searching-for-python310.patch | 50 +++++++++++++++++++
>  meta/recipes-support/boost/boost_1.77.0.bb    |  1 +
>  2 files changed, 51 insertions(+)
>  create mode 100644 meta/recipes-support/boost/boost/0001-
> BoostConfig.cmake-allow-searching-for-python310.patch
>=20
> diff --git a/meta/recipes-support/boost/boost/0001-BoostConfig.cmake-allo=
w-searching-for-python310.patch b/meta/recipes-support/boost/boost/0001-Boo=
stConfig.cmake-allow-searching-for-python310.patch
> new file mode 100644
> index 0000000000..0a9ee2cc95
> --- /dev/null
> +++ b/meta/recipes-support/boost/boost/0001-BoostConfig.cmake-allow-searc=
hing-for-python310.patch
> @@ -0,0 +1,50 @@
> +From e193f080c7d209516ac9b712fa0c50bb08026fa2 Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <Martin.Jansa@gmail.com>
> +Date: Tue, 19 Oct 2021 12:24:31 +0000
> +Subject: [PATCH] BoostConfig.cmake: allow searching for python310
> +
> +* accept double digits in Python3_VERSION_MINOR
> +
> +* if someone is using e.g.:
> +  find_package(Python3 REQUIRED)
> +  find_package(Boost REQUIRED python${Python3_VERSION_MAJOR}${Python3_VE=
RSION_MINOR})
> +
> +  with python-3.10 then it currently fails with:
> +
> +  -- Found PythonLibs: /usr/lib/libpython3.10.so (found version "3.10.0"=
)
> +  -- Found Python3: -native/usr/bin/python3-native/python3 (found versio=
n "3.10.0") found components: Interpreter
> +  CMake Error at /usr/lib/cmake/Boost-1.77.0/BoostConfig.cmake:141 (find=
_package):
> +    Could not find a package configuration file provided by "boost_pytho=
n310"
> +    (requested version 1.77.0) with any of the following names:
> +
> +      boost_python310Config.cmake
> +      boost_python310-config.cmake
> +
> +    Add the installation prefix of "boost_python310" to CMAKE_PREFIX_PAT=
H or
> +    set "boost_python310_DIR" to a directory containing one of the above=
 files.
> +    If "boost_python310" provides a separate development package or SDK,=
 be
> +    sure it has been installed.
> +  Call Stack (most recent call first):
> +    /usr/lib/cmake/Boost-1.77.0/BoostConfig.cmake:258 (boost_find_compon=
ent)
> +    /usr/share/cmake-3.21/Modules/FindBoost.cmake:594 (find_package)
> +    CMakeLists.txt:18 (find_package)
> +
> +Upstream-Status: Submitted [https://github.com/boostorg/boost_install/pu=
ll/53]
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +---
> + tools/boost_install/BoostConfig.cmake | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/tools/boost_install/BoostConfig.cmake b/tools/boost_install=
/BoostConfig.cmake
> +index fd17821..5dffa58 100644
> +--- a/tools/boost_install/BoostConfig.cmake
> ++++ b/tools/boost_install/BoostConfig.cmake
> +@@ -113,7 +113,7 @@ macro(boost_find_component comp required quiet)
> +     set(_BOOST_REQUIRED REQUIRED)
> +   endif()
> +
> +-  if("${comp}" MATCHES "^(python|numpy|mpi_python)([1-9])([0-9])$")
> ++  if("${comp}" MATCHES "^(python|numpy|mpi_python)([1-9])([0-9][0-9]?)$=
")

Why not make that:

  if("${comp}" MATCHES "^(python|numpy|mpi_python)([1-9])([0-9]+)$")

or we will have the same problem when Python 3.100 comes around. ;)
Though I guess things will get interesting at version 10.0 as well...

> +
> +     # handle pythonXY and numpyXY versioned components for compatibilit=
y
> +
> diff --git a/meta/recipes-support/boost/boost_1.77.0.bb b/meta/recipes-su=
pport/boost/boost_1.77.0.bb
> index df8e08ad76..ba60281950 100644
> --- a/meta/recipes-support/boost/boost_1.77.0.bb
> +++ b/meta/recipes-support/boost/boost_1.77.0.bb
> @@ -6,4 +6,5 @@ SRC_URI +=3D "file://boost-CVE-2012-2677.patch \
>             file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-tha=
t-o.patch \
>             file://0001-dont-setup-compiler-flags-m32-m64.patch \
>             file://0001-fiber-libs-Define-SYS_futex-if-it-does-not-exist.=
patch \
> +           file://0001-BoostConfig.cmake-allow-searching-for-python310.p=
atch \
>             "
> --
> 2.32.0

//Peter


Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 162D46A8CB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 11:26:20 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id q10so4925892eaj.31
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 04:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=l3RYdOsGGtX2F1oPRMmh7zYVBxSdVAdh1g52NZ1KMgY=;
	b=y3XWFIqCat5pXMXedg3ZeqzLiXWWZLVgoUuIr3vxwmOHGmcaGXsgHtfGuIZ9XYB470
	YILs7tj6v2/2pVcH2JzOtqxiuymIJTtSFPpdu/DniAVXXtp3iUse/6WSJuoXZiybjIk+
	BOHAK7DSfGjNfdP9yiw1vf2tNpNon+03gTi8CIOgwrm8BEG/JNEuFk1ver6yrrz/lTrd
	SLwjP0iqRP5OpguE3dmPyb6UGld2RT+0Pd87/ue0SUz/EapiOpSvkyA80i6IRUTZan5S
	rf2NojwH4f5qOOPpe/uWl8ukEH/szwq73xHMc5j+n+tZN3EP1wo+cS/UGci/VrIwXb4u
	CN8Q==
X-Received: by 10.14.2.73 with SMTP id 49mr35469620eee.118.1373455581088;
	Wed, 10 Jul 2013 04:26:21 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a4sm59276498eez.0.2013.07.10.04.26.19 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 10 Jul 2013 04:26:20 -0700 (PDT)
Date: Wed, 10 Jul 2013 13:26:29 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20130710112629.GY3288@jama>
References: <1372937164-14095-1-git-send-email-paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1372937164-14095-1-git-send-email-paul.eggleton@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] cmake: fix configure error if system Qt installation is broken
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Jul 2013 11:26:22 -0000
X-Groupsio-MsgNum: 41724
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XZLT0nNRngx3qG4/"
Content-Disposition: inline

--XZLT0nNRngx3qG4/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 04, 2013 at 12:26:04PM +0100, Paul Eggleton wrote:
> If the host Qt installation exists but is incomplete or the installed
> qmake architecture doesn't match that of the Qt libraries, cmake was
> failing at do_configure. cmake 2.8.10 failed silently here so we should
> make 2.8.11 do the same.

FWIW: I was seeing this issue in my jenkins builds once and then before
I've included this patch to test it, it was gone and I haven't seen it
anymore. I believe this patch is correct, just saying that building some
recipe (maybe qt4-native) before cmake-native also "hides" this issue.

> Fixes [YOCTO #4565].
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/recipes-devtools/cmake/cmake.inc              |  1 +
>  .../cmake/cmake/qt4-fail-silent.patch              | 55 ++++++++++++++++=
++++++
>  2 files changed, 56 insertions(+)
>  create mode 100644 meta/recipes-devtools/cmake/cmake/qt4-fail-silent.pat=
ch
>=20
> diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtool=
s/cmake/cmake.inc
> index 6144d51..014ff5a 100644
> --- a/meta/recipes-devtools/cmake/cmake.inc
> +++ b/meta/recipes-devtools/cmake/cmake.inc
> @@ -15,6 +15,7 @@ SRC_URI =3D "http://www.cmake.org/files/v${CMAKE_MAJOR_=
VERSION}/cmake-${PV}.tar.gz
>             file://support-oe-qt4-tools-names.patch \
>             file://aarch64-cmake.patch \
>             file://aarch64-kwsys.patch \
> +           file://qt4-fail-silent.patch \
>             "
> =20
>  inherit autotools
> diff --git a/meta/recipes-devtools/cmake/cmake/qt4-fail-silent.patch b/me=
ta/recipes-devtools/cmake/cmake/qt4-fail-silent.patch
> new file mode 100644
> index 0000000..fd39f3f
> --- /dev/null
> +++ b/meta/recipes-devtools/cmake/cmake/qt4-fail-silent.patch
> @@ -0,0 +1,55 @@
> +Fail silently if system Qt installation is broken
> +
> +Fixes a regression in behaviour from 2.8.10 to 2.8.11 resulting in the
> +following error if the system Qt installation is broken:
> +
> +CMake Error at Modules/FindQt4.cmake:1028 (set_property):
> +  set_property could not find TARGET Qt4::QtCore.  Perhaps it has not yet
> +  been created.
> +Call Stack (most recent call first):
> +  Tests/RunCMake/CMakeLists.txt:79 (find_package)
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> +
> +--- cmake-2.8.11/Modules/FindQt4.cmake	2013-07-04 10:20:42.092848274 +01=
00
> ++++ cmake-2.8.11/Modules/FindQt4.cmake	2013-07-04 10:52:15.693380555 +01=
00
> +@@ -1025,21 +1025,22 @@
> +     set(_configs)
> +   endmacro()
> +=20
> +-
> +-  # Set QT_xyz_LIBRARY variable and add
> +-  # library include path to QT_INCLUDES
> +-  _QT4_ADJUST_LIB_VARS(QtCore)
> +-  set_property(TARGET Qt4::QtCore APPEND PROPERTY
> +-    INTERFACE_INCLUDE_DIRECTORIES
> +-      "${QT_MKSPECS_DIR}/default"
> +-      ${QT_INCLUDE_DIR}
> +-  )
> +-  set_property(TARGET Qt4::QtCore PROPERTY
> +-    INTERFACE_QT_MAJOR_VERSION 4
> +-  )
> +-  set_property(TARGET Qt4::QtCore APPEND PROPERTY
> +-    COMPATIBLE_INTERFACE_STRING QT_MAJOR_VERSION
> +-  )
> ++  if(QT_QTCORE_FOUND)
> ++    # Set QT_xyz_LIBRARY variable and add
> ++    # library include path to QT_INCLUDES
> ++    _QT4_ADJUST_LIB_VARS(QtCore)
> ++    set_property(TARGET Qt4::QtCore APPEND PROPERTY
> ++      INTERFACE_INCLUDE_DIRECTORIES
> ++        "${QT_MKSPECS_DIR}/default"
> ++        ${QT_INCLUDE_DIR}
> ++    )
> ++    set_property(TARGET Qt4::QtCore PROPERTY
> ++      INTERFACE_QT_MAJOR_VERSION 4
> ++    )
> ++    set_property(TARGET Qt4::QtCore APPEND PROPERTY
> ++      COMPATIBLE_INTERFACE_STRING QT_MAJOR_VERSION
> ++    )
> ++  endif()
> +=20
> +   foreach(QT_MODULE ${QT_MODULES})
> +     _QT4_ADJUST_LIB_VARS(${QT_MODULE})
> --=20
> 1.8.1.2
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--XZLT0nNRngx3qG4/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHdROUACgkQN1Ujt2V2gBxH3wCgjg86K5ocBExJYeUMLHdwek/5
+w4An1zaEboc1L000g5iT6+CUZdQcYFg
=tYPL
-----END PGP SIGNATURE-----

--XZLT0nNRngx3qG4/--

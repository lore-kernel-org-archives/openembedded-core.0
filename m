Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Ri8ZM-0007NX-Ui
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 18:54:42 +0100
Received: by eeit10 with SMTP id t10so10783467eei.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jan 2012 09:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DK3+UWBvQZTTftWWtDL2ruocCWTPghpz0SuBidt1Rfg=;
	b=FTgjFHClL/r+vhETrUcbcxJ1rp4GAERSbsMkd4PaT3PcuhonAD/v5AYMl1YWk/q8Qh
	B3EEnoHhM+fSGXGaAE68nusypRrfcbp4S6scN9Zurr92go7HqqzadEDZ9VCCvBBpryAJ
	rZ5IRt/V6W72j0QDKFE0T0hKNnIqXetJT5Eoc=
Received: by 10.213.30.2 with SMTP id s2mr567296ebc.8.1325612840054;
	Tue, 03 Jan 2012 09:47:20 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 13sm208419977eeu.1.2012.01.03.09.47.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 03 Jan 2012 09:47:19 -0800 (PST)
Date: Tue, 3 Jan 2012 18:47:17 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120103174717.GH3958@jama.jama.net>
References: <1325612376.28005.14.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1325612376.28005.14.camel@phil-desktop>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] python-native: correct prefix handling for oe-core sysroot layout
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Jan 2012 17:54:42 -0000
X-Groupsio-MsgNum: 15169
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4C6bbPZ6c/S1npyF"
Content-Disposition: inline

--4C6bbPZ6c/S1npyF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 03, 2012 at 05:39:35PM +0000, Phil Blundell wrote:
> Don't try to guess a path based on ${HOST_SYS} since this is not where the
> files in the sysroot are likely to be.  Instead, just use the "plat_speci=
fic"
> approach of taking STAGING_INCDIR and knocking off the trailing "/include=
" for
> all cases.  This is still evidently suboptimal but does at least seem to =
give
> the correct results.
>=20
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>  ...2-distutils-prefix-is-inside-staging-area.patch |   22 ++++++++------=
-----
>  .../recipes-devtools/python/python-native_2.6.6.bb |    2 +-
>  2 files changed, 10 insertions(+), 14 deletions(-)

Where did you get python-native_2.6.6?

That was removed with 2.7.2 upgrade in
commit b284e9a512860b8a8380be80f96cebce6b92ff80
Author: Nitin A Kamble <nitin.a.kamble@intel.com>
Date:   Fri Oct 14 07:06:13 2011 +0000

Cheers,

>=20
> diff --git a/meta/recipes-devtools/python/python-native/12-distutils-pref=
ix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python-nativ=
e/12-distutils-prefix-is-inside-staging-area.patch
> index 8e721fe..b46caf6 100644
> --- a/meta/recipes-devtools/python/python-native/12-distutils-prefix-is-i=
nside-staging-area.patch
> +++ b/meta/recipes-devtools/python/python-native/12-distutils-prefix-is-i=
nside-staging-area.patch
> @@ -2,12 +2,11 @@ Upstream-Status: Inappropriate [embedded specific]
> =20
>  # The proper prefix is inside our staging area.
>  # Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
> +# Signed-off-by: Phil Blundell <philb@gnu.org>
> =20
> -Index: Python-2.6.6/Lib/distutils/sysconfig.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.6.6.orig/Lib/distutils/sysconfig.py
> -+++ Python-2.6.6/Lib/distutils/sysconfig.py
> -@@ -19,8 +19,8 @@ import sys
> +--- Python-2.6.6/Lib/distutils/sysconfig.py.orig	2012-01-03 14:02:03.027=
005296 +0000
> ++++ Python-2.6.6/Lib/distutils/sysconfig.py	2012-01-03 14:02:31.51760108=
1 +0000
> +@@ -19,8 +19,8 @@
>   from distutils.errors import DistutilsPlatformError
>  =20
>   # These are needed in a couple of spots, so just compute them once.
> @@ -18,19 +17,16 @@ Index: Python-2.6.6/Lib/distutils/sysconfig.py
>  =20
>   # Path to the base directory of the project. On Windows the binary may
>   # live in project/PCBuild9.  If we're dealing with an x64 Windows build,
> -@@ -70,7 +70,10 @@ def get_python_inc(plat_specific=3D0, pref
> +@@ -70,7 +70,7 @@
>       sys.exec_prefix -- i.e., ignore 'plat_specific'.
>       """
>       if prefix is None:
>  -        prefix =3D plat_specific and EXEC_PREFIX or PREFIX
> -+        if plat_specific:
> -+            prefix =3D plat_specific and os.environ['STAGING_INCDIR'].r=
strip('include')
> -+        else:
> -+            prefix =3D plat_specific and EXEC_PREFIX or PREFIX
> ++        prefix =3D os.environ['STAGING_INCDIR'].rstrip('include')
>  =20
>       if os.name =3D=3D "posix":
>           if python_build:
> -@@ -115,12 +118,16 @@ def get_python_lib(plat_specific=3D0, stan
> +@@ -115,12 +115,16 @@
>       If 'prefix' is supplied, use it instead of sys.prefix or
>       sys.exec_prefix -- i.e., ignore 'plat_specific'.
>       """
> @@ -49,7 +45,7 @@ Index: Python-2.6.6/Lib/distutils/sysconfig.py
>           if standard_lib:
>               return libpython
>           else:
> -@@ -216,7 +223,7 @@ def get_config_h_filename():
> +@@ -216,7 +220,7 @@
>       else:
>           # The name of the config.h file changed in 2.2
>           config_h =3D 'pyconfig.h'
> @@ -58,7 +54,7 @@ Index: Python-2.6.6/Lib/distutils/sysconfig.py
>  =20
>  =20
>   def get_makefile_filename():
> -@@ -225,7 +232,7 @@ def get_makefile_filename():
> +@@ -225,7 +229,7 @@
>           return os.path.join(os.path.dirname(os.path.realpath(sys.execut=
able)),
>                               "Makefile")
>       lib_dir =3D get_python_lib(plat_specific=3D1, standard_lib=3D1)
> diff --git a/meta/recipes-devtools/python/python-native_2.6.6.bb b/meta/r=
ecipes-devtools/python/python-native_2.6.6.bb
> index e0a4fb3..9293f03 100644
> --- a/meta/recipes-devtools/python/python-native_2.6.6.bb
> +++ b/meta/recipes-devtools/python/python-native_2.6.6.bb
> @@ -1,6 +1,6 @@
>  require python.inc
>  DEPENDS =3D "openssl-native bzip2-full-native zlib-native readline-nativ=
e sqlite3-native"
> -PR =3D "${INC_PR}.4"
> +PR =3D "${INC_PR}.5"
> =20
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D38fdd546420fab09ac6bd3d8a1c83=
eb6"
> =20
> --=20
> 1.7.4.1
>=20
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4C6bbPZ6c/S1npyF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8DPyUACgkQN1Ujt2V2gBzOwgCfV1jqV76ZHAbDJOS6z02ZoMJS
zrYAoIzD+TPP9Kfn9SP+utUodXoxwBBU
=nmKG
-----END PGP SIGNATURE-----

--4C6bbPZ6c/S1npyF--

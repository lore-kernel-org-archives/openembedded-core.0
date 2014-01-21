Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id A971560644
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 13:02:43 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id d49so3300182eek.34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 05:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=QtTNQBpA/fJbVBe/BoN19ekSg5RN2A941rEGkino85I=;
	b=Q2rYyE4KFiF+FlMqnuNH6tfL1MDmJbDMgVuUiBbqYdtp+I7+TIpffgLsGutzSxKA2P
	Ws3jKfCAlWlfIxCWOgT0Q6DATi5Tf3O6Ap76ikCUiAQZEIq+08i9vTwY9jK1Ea0wkeu+
	DvOVMop5WhEmW4SKXQ2frrSQ1L1D1mDOmHlm8m+Nsp+jKnP1JxVwYBjbNNYpOdIH6+5U
	2yh2XuK7mmNq+ZeVSv2PNujeaT+WzXOlYuhWIRLYFwMzinDtfioYysT13bpfgOeniLGi
	uxp2OmCLQBiMhCB35tdT5MiNbTroF3AkZNkDNNb13AbFFwU22bIBIX2QMYdHpic2I17A
	FWLw==
X-Received: by 10.15.24.142 with SMTP id j14mr23914730eeu.52.1390309364303;
	Tue, 21 Jan 2014 05:02:44 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id h3sm14595447eem.15.2014.01.21.05.02.43
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Jan 2014 05:02:43 -0800 (PST)
Date: Tue, 21 Jan 2014 14:02:43 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20140121130243.GD4100@jama>
References: <1389547991-3456-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1389547991-3456-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [PATCH] cmake: Fix freetype detection
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
X-List-Received-Date: Tue, 21 Jan 2014 13:02:44 -0000
X-Groupsio-MsgNum: 49263
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WChQLJJJfbwij+9x"
Content-Disposition: inline

--WChQLJJJfbwij+9x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 12, 2014 at 06:33:11PM +0100, Martin Jansa wrote:
> * since last freetype upgrade cmake cannot detect it
> * e.g. webkit-efl requires freetype and is failing because of this

ping

+ Ross as he is working on cmake as well as freetype

>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-devtools/cmake/cmake.inc              |  1 +
>  .../cmake/cmake/cmake-2.8.11.2-FindFreetype.patch  | 47 ++++++++++++++++=
++++++
>  2 files changed, 48 insertions(+)
>  create mode 100644 meta/recipes-devtools/cmake/cmake/cmake-2.8.11.2-Find=
Freetype.patch
>=20
> diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtool=
s/cmake/cmake.inc
> index 69f4fe2..f76f68b 100644
> --- a/meta/recipes-devtools/cmake/cmake.inc
> +++ b/meta/recipes-devtools/cmake/cmake.inc
> @@ -16,6 +16,7 @@ SRC_URI =3D "http://www.cmake.org/files/v${CMAKE_MAJOR_=
VERSION}/cmake-${PV}.tar.gz
>             file://aarch64-cmake.patch \
>             file://aarch64-kwsys.patch \
>             file://qt4-fail-silent.patch \
> +           file://cmake-2.8.11.2-FindFreetype.patch \
>             "
> =20
>  inherit autotools
> diff --git a/meta/recipes-devtools/cmake/cmake/cmake-2.8.11.2-FindFreetyp=
e.patch b/meta/recipes-devtools/cmake/cmake/cmake-2.8.11.2-FindFreetype.pat=
ch
> new file mode 100644
> index 0000000..1b523c0
> --- /dev/null
> +++ b/meta/recipes-devtools/cmake/cmake/cmake-2.8.11.2-FindFreetype.patch
> @@ -0,0 +1,47 @@
> +From: Julian Ospald <hasufell@gentoo.org>
> +Date: Sun Dec  8 13:38:06 UTC 2013
> +Subject: fix check for freetype-2.5.1
> +
> +Upstream-Status: Submitted http://www.cmake.org/Bug/view.php?id=3D14601
> +
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +
> +--- old/Modules/FindFreetype.cmake
> ++++ new/Modules/FindFreetype.cmake
> +@@ -64,6 +64,19 @@
> +   PATH_SUFFIXES include/freetype2 include
> + )
> +=20
> ++if(NOT FREETYPE_INCLUDE_DIR_freetype2)
> ++  find_path(FREETYPE_INCLUDE_DIR_freetype2 config/ftheader.h
> ++    HINTS
> ++      ENV FREETYPE_DIR
> ++    PATHS
> ++      /usr/X11R6
> ++      /usr/local/X11R6
> ++      /usr/local/X11
> ++      /usr/freeware
> ++    PATH_SUFFIXES include/freetype2 include
> ++  )
> ++endif()
> ++
> + find_library(FREETYPE_LIBRARY
> +   NAMES freetype libfreetype freetype219
> +   HINTS
> +@@ -82,8 +95,14 @@
> + endif()
> + set(FREETYPE_LIBRARIES "${FREETYPE_LIBRARY}")
> +=20
> +-if(FREETYPE_INCLUDE_DIR_freetype2 AND EXISTS "${FREETYPE_INCLUDE_DIR_fr=
eetype2}/freetype/freetype.h")
> +-    file(STRINGS "${FREETYPE_INCLUDE_DIR_freetype2}/freetype/freetype.h=
" freetype_version_str
> ++if(EXISTS "${FREETYPE_INCLUDE_DIR_freetype2}/freetype/freetype.h")
> ++  set(FREETYPE_H "${FREETYPE_INCLUDE_DIR_freetype2}/freetype/freetype.h=
")
> ++elseif(EXISTS "${FREETYPE_INCLUDE_DIR_freetype2}/freetype.h")
> ++  set(FREETYPE_H "${FREETYPE_INCLUDE_DIR_freetype2}/freetype.h")
> ++endif()
> ++
> ++if(FREETYPE_INCLUDE_DIR_freetype2 AND FREETYPE_H)
> ++    file(STRINGS "${FREETYPE_H}" freetype_version_str
> +          REGEX "^#[\t ]*define[\t ]+FREETYPE_(MAJOR|MINOR|PATCH)[\t ]+[=
0-9]+$")
> +=20
> +     unset(FREETYPE_VERSION_STRING)
> --=20
> 1.8.5.2
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WChQLJJJfbwij+9x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLeb/MACgkQN1Ujt2V2gBzdqgCgs+scjl/Wzk2+ICGjy+ML0Lob
+q4AoI5rkHlw3X+CqsvFGeibtWAN6491
=+XED
-----END PGP SIGNATURE-----

--WChQLJJJfbwij+9x--

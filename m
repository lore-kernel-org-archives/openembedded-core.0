Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R7rRA-0001Rt-Mh
	for openembedded-core@lists.openembedded.org;
	Sun, 25 Sep 2011 18:20:16 +0200
Received: by fxi1 with SMTP id 1so5173456fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2011 09:14:53 -0700 (PDT)
Received: by 10.223.18.73 with SMTP id v9mr1623090faa.70.1316967291554;
	Sun, 25 Sep 2011 09:14:51 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id w14sm17434566fae.13.2011.09.25.09.14.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 25 Sep 2011 09:14:50 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <002ad30dae74393120d2391602371116af1bb11d.1316963134.git.richard.purdie@linuxfoundation.org>
Date: Sun, 25 Sep 2011 18:14:48 +0200
Message-Id: <ED60D3CD-738C-4796-B242-F97880DC74FF@dominion.thruhere.net>
References: <8ad24306d8bc9c2fd73f4b814eb1a64c04707da5.1316963134.git.richard.purdie@linuxfoundation.org>
	<002ad30dae74393120d2391602371116af1bb11d.1316963134.git.richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH 6/9] libtool: Fix an issue where unnecessary rpaths were being injected
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
X-List-Received-Date: Sun, 25 Sep 2011 16:20:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 25 sep. 2011, om 17:56 heeft Richard Purdie het volgende geschreven:

> libtool was being to aggressive in adding rpath to binaries. This
> change stops it adding them if that path the default search path.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> meta/recipes-devtools/libtool/libtool-cross_2.4.bb |    2 +-
> .../recipes-devtools/libtool/libtool-native_2.4.bb |    2 +-
> .../libtool/libtool-nativesdk_2.4.bb               |    2 +-
> meta/recipes-devtools/libtool/libtool.inc          |    3 +-
> meta/recipes-devtools/libtool/libtool/1            |   55 =
+++++++++++++++++
> .../libtool/libtool/fix-rpath.patch                |   63 =
++++++++++++++++++++
> meta/recipes-devtools/libtool/libtool_2.4.bb       |    2 +-
> 7 files changed, 124 insertions(+), 5 deletions(-)
> create mode 100644 meta/recipes-devtools/libtool/libtool/1
> create mode 100644 =
meta/recipes-devtools/libtool/libtool/fix-rpath.patch
>=20
> diff --git a/meta/recipes-devtools/libtool/libtool-cross_2.4.bb =
b/meta/recipes-devtools/libtool/libtool-cross_2.4.bb
> index 25ac580..6d512b1 100644
> --- a/meta/recipes-devtools/libtool/libtool-cross_2.4.bb
> +++ b/meta/recipes-devtools/libtool/libtool-cross_2.4.bb
> @@ -1,6 +1,6 @@
> require libtool-${PV}.inc
>=20
> -PR =3D "r2"
> +PR =3D "r4"
> PACKAGES =3D ""
> SRC_URI +=3D "file://prefix.patch"
>=20
> diff --git a/meta/recipes-devtools/libtool/libtool-native_2.4.bb =
b/meta/recipes-devtools/libtool/libtool-native_2.4.bb
> index 423622f..3d0998e 100644
> --- a/meta/recipes-devtools/libtool/libtool-native_2.4.bb
> +++ b/meta/recipes-devtools/libtool/libtool-native_2.4.bb
> @@ -2,7 +2,7 @@ require libtool-${PV}.inc
>=20
> DEPENDS =3D ""
>=20
> -PR =3D "r2"
> +PR =3D "r4"
> SRC_URI +=3D "file://prefix.patch"
>=20
> inherit native
> diff --git a/meta/recipes-devtools/libtool/libtool-nativesdk_2.4.bb =
b/meta/recipes-devtools/libtool/libtool-nativesdk_2.4.bb
> index 4f67fed..a96d1d1 100644
> --- a/meta/recipes-devtools/libtool/libtool-nativesdk_2.4.bb
> +++ b/meta/recipes-devtools/libtool/libtool-nativesdk_2.4.bb
> @@ -1,6 +1,6 @@
> require libtool-${PV}.inc
>=20
> -PR =3D "r2"
> +PR =3D "r4"
> SRC_URI +=3D "file://prefix.patch"
>=20
> inherit nativesdk
> diff --git a/meta/recipes-devtools/libtool/libtool.inc =
b/meta/recipes-devtools/libtool/libtool.inc
> index d423e49..ef9095b 100644
> --- a/meta/recipes-devtools/libtool/libtool.inc
> +++ b/meta/recipes-devtools/libtool/libtool.inc
> @@ -15,7 +15,8 @@ SRC_URI =3D =
"${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
>            file://resolve-sysroot.patch \
>            file://use-sysroot-in-libpath.patch \
>            file://fix-final-rpath.patch \
> -           file://avoid_absolute_paths_for_general_utils.patch "
> +           file://avoid_absolute_paths_for_general_utils.patch \
> +           file://fix-rpath.patch "
>=20
> do_compile_prepend () {
> 	# Sometimes this file doesn't get rebuilt, force the issue
> diff --git a/meta/recipes-devtools/libtool/libtool/1 =
b/meta/recipes-devtools/libtool/libtool/1
> new file mode 100644
> index 0000000..b3ee955
> --- /dev/null
> +++ b/meta/recipes-devtools/libtool/libtool/1

stray file?





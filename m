Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id 40FE47F91B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 02:49:20 +0000 (UTC)
IronPort-SDR: YeFUkrpnKXHhaM4ZPAy1zPa3Ug0zrdLC1LqZsSsL8DaREiLMUd5arLegfPMHOdynSglUQNQOrV
	U8cUxigNojW4C4egJvhOtHfwVIzUyVEsHlIolGJTKg/ItWQEXGrIQH/ko2aShOzybIXpt1cUCg
	0hgQx7703Et0M1Rigmg80n1hLwCxo9IsS6hfzRgAzlXHbMoti+wcPog14TUaS1JJ0ny6j8WnzF
	J/WZ0Ta8l7k3MktD4glBHQyPQoL1a1PW35T5bf0kb2POR3jsmuMzFZMDKlGiG6QK1zKJd77DlO
	K5A=
X-IronPort-AV: E=Sophos;i="5.70,321,1574118000"; 
   d="scan'208";a="4419730"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Carlos Rafael Giani <crg7475@mailbox.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 02/12] gstreamer1.0: Transition to meson based
	builds
Thread-Index: AQHVyVWFsVdRwGr6ukGXEDiBBJGz0afq/wWA
Date: Wed, 15 Jan 2020 02:49:21 +0000
Message-ID: <5f643784a4c74504a4e5339f3a0eef51@XBOX03.axis.com>
References: <20200112135954.23868-1-crg7475@mailbox.org>
	<20200112135954.23868-2-crg7475@mailbox.org>
In-Reply-To: <20200112135954.23868-2-crg7475@mailbox.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Subject: Re: [PATCH 02/12] gstreamer1.0: Transition to meson based	builds
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
X-List-Received-Date: Wed, 15 Jan 2020 02:49:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core=
-
> bounces@lists.openembedded.org> On Behalf Of Carlos Rafael Giani
> Sent: den 12 januari 2020 15:00
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 02/12] gstreamer1.0: Transition to meson based
> builds
>=20
> * Moved 0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch
>   from files/ to gstreamer1.0/ since it is gstreamer1.0 recipe specific.
>=20
> * Removed M4 specific patches:
>   - 0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch
>   - gtk-doc-tweaks.patch
>   - add-a-target-to-compile-tests.patch
>=20
> * Added patches:
>   - 0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch
>     Backport for enabling GIR support in meson based cross compilation
>   - 0002-meson-Add-valgrind-feature.patch
>     Make valgrind support configurable to be able to control it through
>     a "valgrind" packageconfig
>   - 0003-meson-Add-option-for-installed-tests.patch
>     Add support for installable tests and for generating .test and shell
>     scripts which can be used with the gnome-desktop-testing suite runner
>=20
> * PTest support:
>   By default, GStreamer does not allow for installing tests, and requires
>   meson to run its unit tests. The 0003 patch fixes this by installing
>   the binaries themselves and by generating accompanying .test and shell
>   scripts. The scripts set up the required environment files and then
>   call the test binaries. The .test file list the shell scripts as
>   Exec=3D command line.
>=20
> Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
> ---
>  ...der.c-when-env-var-is-set-do-not-fal.patch |   0
>  ...even-when-cross-compiling-if-introsp.patch |  36 +++
>  .../0003-meson-Add-valgrind-feature.patch     |  74 +++++
>  ...meson-Add-option-for-installed-tests.patch | 257 ++++++++++++++++++
>  .../gstreamer/gstreamer1.0_1.16.1.bb          |  93 +++----
>  5 files changed, 404 insertions(+), 56 deletions(-)
>  rename meta/recipes-multimedia/gstreamer/{files =3D> gstreamer1.0}/0001-
> gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch (100%)
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-
> meson-build-gir-even-when-cross-compiling-if-introsp.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-
> meson-Add-valgrind-feature.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-
> meson-Add-option-for-installed-tests.patch

[cut]

> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb b/m=
eta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb
> index ff92f63bac..dc3e8ffafd 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb
> @@ -8,11 +8,7 @@ LICENSE =3D "LGPLv2+"
>=20
>  DEPENDS =3D "glib-2.0 glib-2.0-native libcap libxml2 bison-native flex-n=
ative"
>=20
> -inherit autotools pkgconfig gettext upstream-version-is-even gobject-int=
rospection gtk-doc ptest
> -
> -# This way common/m4/introspection.m4 will come first
> -# (it has a custom INTROSPECTION_INIT macro, and so must be used instead=
 of our common introspection.m4 file)
> -acpaths =3D "-I ${S}/common/m4 -I ${S}/m4"
> +inherit meson pkgconfig gettext upstream-version-is-even gobject-introsp=
ection gtk-doc
>=20
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6762ed442b3822387a51c92d928ea=
d0d \
>=20
> file://gst/gst.h;beginline=3D1;endline=3D21;md5=3De059138481205ee2c6fc1c0=
79c016d0d"
> @@ -21,71 +17,56 @@ S =3D "${WORKDIR}/gstreamer-${PV}"
>=20
>  SRC_URI =3D " \
>      https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.=
xz \
> -    file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.pat=
ch \
> -    file://gtk-doc-tweaks.patch \
>      file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.pat=
ch \
> -    file://add-a-target-to-compile-tests.patch \
> -    file://run-ptest \
> +    file://0002-meson-build-gir-even-when-cross-compiling-if-introsp.pat=
ch \
> +    file://0003-meson-Add-valgrind-feature.patch \
> +    file://0004-meson-Add-option-for-installed-tests.patch \
>  "
>  SRC_URI[md5sum] =3D "c505fb818b36988daaa846e9e63eabe8"
>  SRC_URI[sha256sum] =3D "02211c3447c4daa55919c5c0f43a82a6fbb51740d57fc3af=
0639d46f1cf4377d"
>=20
>  PACKAGECONFIG ??=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests',=
 '', d)} \
> -                   "
> -
> -PACKAGECONFIG[debug] =3D "--enable-debug,--disable-debug"
> -PACKAGECONFIG[tests] =3D "--enable-tests,--disable-tests"
> -PACKAGECONFIG[valgrind] =3D "--enable-valgrind,--disable-valgrind,valgri=
nd,"
> -PACKAGECONFIG[gst-tracer-hooks] =3D "--enable-gst-tracer-hooks,--disable=
-gst-tracer-hooks,"
> -PACKAGECONFIG[unwind] =3D "--with-unwind,--without-unwind,libunwind"
> -PACKAGECONFIG[dw] =3D "--with-dw,--without-dw,elfutils"
> -
> -EXTRA_OECONF =3D " \
> -    --disable-examples \
> +                   tools"
> +
> +PACKAGECONFIG[debug] =3D "-Dgst_debug=3Dtrue,-Dgst_debug=3Dfalse"

To avoid confusion, you might want to call that PACKAGECONFIG=20
"gst-debug" instead since -Dgst_debug=3Dtrue corresponds to the old=20
--enable-gst-debug, not --enable-debug (for which there does not=20
seem to be a corresponding new Meson option).

I find it interesting though that there does not seem to have ever=20
been a PACKAGECONFIG for --enable-gst-debug, which means it used=20
to default to being enabled. (We have always disabled it for our=20
production code due to the performance overhead added by having=20
the GStreamer debug system enabled.)

> +PACKAGECONFIG[tracer-hooks] =3D "-Dtracer_hooks=3Dtrue,-Dtracer_hooks=3D=
false"
> +PACKAGECONFIG[tests] =3D "-Dcheck=3Denabled -Dtests=3Denabled -Dinstalle=
d-tests=3Dtrue,-Dcheck=3Ddisabled -Dtests=3Ddisabled -Dinstalled-tests=3Dfa=
lse"
> +PACKAGECONFIG[valgrind] =3D "-Dvalgrind=3Denabled,-Dvalgrind=3Ddisabled,=
valgrind,"
> +PACKAGECONFIG[unwind] =3D "-Dlibunwind=3Denabled,-Dlibunwind=3Ddisabled,=
libunwind"
> +PACKAGECONFIG[dw] =3D "-Dlibdw=3Denabled,-Dlibdw=3Ddisabled,elfutils"
> +PACKAGECONFIG[bash-completion] =3D "-Dbash-completion=3Denabled,-Dbash-c=
ompletion=3Ddisabled,bash-completion"
> +PACKAGECONFIG[tools] =3D "-Dtools=3Denabled,-Dtools=3Ddisabled"
> +

//Peter



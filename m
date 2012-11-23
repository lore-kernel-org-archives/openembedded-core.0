Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Tc1La-0005WE-V7 for openembedded-core@lists.openembedded.org;
	Fri, 23 Nov 2012 23:03:46 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qANLnUVX028159;
	Fri, 23 Nov 2012 21:49:30 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13444-03; Fri, 23 Nov 2012 21:49:25 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qANLnM1o028126
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 23 Nov 2012 21:49:23 GMT
Message-ID: <1353707361.21863.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Bj=F6rn?= Stenberg <bjst@enea.com>
Date: Fri, 23 Nov 2012 21:49:21 +0000
In-Reply-To: <1353600120-22967-2-git-send-email-bjst@enea.com>
References: <1353600120-22967-1-git-send-email-bjst@enea.com>
	<1353600120-22967-2-git-send-email-bjst@enea.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	qANLnUVX028159
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] Add a new distro feature "ptest".
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Nov 2012 22:03:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-11-22 at 17:01 +0100, Bj=C3=B6rn Stenberg wrote:
> This patch creates a new distro feature "ptest", which creates -ptest
> packages containing the test suite of the package for running on the
> target. Test files are installed in /usr/lib/<pkg>/ptest.
>=20
> The patch also includes a change to automake, splitting the "make check=
"
> target into separate steps for building and running the tests.
>=20
> Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
> ---
>  meta/classes/image.bbclass                         |    6 ++-
>  meta/classes/packagegroup.bbclass                  |    2 +-
>  meta/conf/bitbake.conf                             |   15 ++++++++-
>  .../automake/automake/buildtest.patch              |   33 ++++++++++++=
++++++++
>  meta/recipes-devtools/automake/automake_1.12.3.bb  |    3 +-
>  5 files changed, 54 insertions(+), 5 deletions(-)
>  create mode 100644 meta/recipes-devtools/automake/automake/buildtest.p=
atch
>=20
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 7b24e4e..b574545 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -29,13 +29,13 @@ ROOTFS_BOOTSTRAP_INSTALL =3D "${@base_contains("IMA=
GE_FEATURES", "package-manageme
>  FEATURE_INSTALL =3D "${@' '.join(oe.packagegroup.required_packages(oe.=
data.typed_value('IMAGE_FEATURES', d), d))}"
>  FEATURE_INSTALL_OPTIONAL =3D "${@' '.join(oe.packagegroup.optional_pac=
kages(oe.data.typed_value('IMAGE_FEATURES', d), d))}"
> =20
> -# packages to install from features, excluding dev/dbg/doc
> +# packages to install from features, excluding dev/dbg/doc/ptest
>  NORMAL_FEATURE_INSTALL =3D "${@' '.join(oe.packagegroup.required_packa=
ges(normal_groups(d), d))}"
>  NORMAL_FEATURE_INSTALL_OPTIONAL =3D "${@' '.join(oe.packagegroup.optio=
nal_packages(normal_groups(d), d))}"
> =20
>  def normal_groups(d):
>      """Return all the IMAGE_FEATURES, with the exception of our specia=
l package groups"""
> -    extras =3D set(['dev-pkgs', 'staticdev-pkgs', 'doc-pkgs', 'dbg-pkg=
s'])
> +    extras =3D set(['dev-pkgs', 'staticdev-pkgs', 'doc-pkgs', 'dbg-pkg=
s', 'ptest-pkgs'])
>      features =3D set(oe.data.typed_value('IMAGE_FEATURES', d))
>      return features.difference(extras)
> =20
> @@ -57,6 +57,8 @@ def complementary_globs(featurevar, d):
>              globs.append('*-doc')
>          elif feature =3D=3D 'dbg-pkgs':
>              globs.append('*-dbg')
> +        elif feature =3D=3D 'ptest-pkgs':
> +            globs.append('*-ptest')
>      return ' '.join(globs)
> =20
>  IMAGE_INSTALL_COMPLEMENTARY =3D '${@complementary_globs("IMAGE_FEATURE=
S", d)}'
> diff --git a/meta/classes/packagegroup.bbclass b/meta/classes/packagegr=
oup.bbclass
> index e0e5b1c..b5be048 100644
> --- a/meta/classes/packagegroup.bbclass
> +++ b/meta/classes/packagegroup.bbclass
> @@ -25,7 +25,7 @@ python () {
>      packages =3D d.getVar('PACKAGES', True).split()
>      genpackages =3D []
>      for pkg in packages:
> -        for postfix in ['-dbg', '-dev']:
> +        for postfix in ['-dbg', '-dev', '-ptest']:
>              genpackages.append(pkg+postfix)
>      d.setVar('PACKAGES', ' '.join(packages+genpackages))
>  }
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 450a0ee..d86e999 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -224,6 +224,10 @@ SUMMARY_${PN}-dbg ?=3D "${SUMMARY} - Debugging fil=
es"
>  DESCRIPTION_${PN}-dbg ?=3D "${DESCRIPTION}  \
>  This package contains ELF symbols and related sources for debugging pu=
rposes."
> =20
> +SUMMARY_${PN}-ptest ?=3D "${SUMMARY} - Package test files"
> +DESCRIPTION_${PN}-ptest ?=3D "${DESCRIPTION}  \
> +This package contains a test directory ${PTEST_PATH} for package test =
purposes."
> +
>  SUMMARY_${PN}-dev ?=3D "${SUMMARY} - Development files"
>  DESCRIPTION_${PN}-dev ?=3D "${DESCRIPTION}  \
>  This package contains symbolic links, header files, and \
> @@ -267,7 +271,7 @@ SOLIBSDEV_darwin8 =3D ".dylib"
>  SOLIBSDEV_darwin9 =3D ".dylib"
> =20
>  PACKAGE_BEFORE_PN ?=3D ""
> -PACKAGES =3D "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-loca=
le ${PACKAGE_BEFORE_PN} ${PN}"
> +PACKAGES =3D "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-loca=
le ${PN}-ptest ${PACKAGE_BEFORE_PN} ${PN}"
>  PACKAGES_DYNAMIC =3D "^${PN}-locale-.*"
>  FILES =3D ""
> =20
> @@ -312,6 +316,15 @@ SECTION_${PN}-dbg =3D "devel"
>  ALLOW_EMPTY_${PN}-dbg =3D "1"
>  RRECOMMENDS_${PN}-dbg =3D "${PN} (=3D ${EXTENDPKGV})"
> =20
> +PTEST_PATH ?=3D "${libdir}/${PN}/ptest"
> +FILES_${PN}-ptest =3D "${PTEST_PATH}/*"
> +SECTION_${PN}-ptest =3D "devel"
> +ALLOW_EMPTY_${PN}-ptest =3D "1"
> +RDEPENDS_${PN}-ptest =3D "${PN} (=3D ${EXTENDPKGV})"
> +PTEST_ENABLED =3D "${@base_contains("DISTRO_FEATURES", "ptest", "1", "=
0", d)}"
> +RDEPENDS_${PN}-ptest_virtclass-native =3D ""
> +RDEPENDS_${PN}-ptest_virtclass-nativesdk =3D ""
> +
>  FILES_${PN}-locale =3D "${datadir}/locale"
> =20
>  # File manifest

Whilst we're in bootstrapping mode for this work, how about we make
these changes a "ptest.bbclass" file which we'd inherit in the recipes
where we've got ptest enabled?

This would also solve the package name conflict I suspect you have in
the dbus recipes, making the hack to the main dbus recipe unnecessary.

Cheers,

Richard




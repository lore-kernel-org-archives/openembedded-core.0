Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QG5Tw-0001yS-Ki
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Apr 2011 10:24:52 +0200
Received: by wye20 with SMTP id 20so3704100wye.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Apr 2011 01:22:19 -0700 (PDT)
Received: by 10.216.121.201 with SMTP id r51mr5926852weh.56.1304151737367;
	Sat, 30 Apr 2011 01:22:17 -0700 (PDT)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id m2sm1690961wer.37.2011.04.30.01.22.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 30 Apr 2011 01:22:16 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1304151675-8653-1-git-send-email-koen@dominion.thruhere.net>
Date: Sat, 30 Apr 2011 10:22:14 +0200
Message-Id: <A6996345-EB9D-4298-942F-9CCDBA49BC30@dominion.thruhere.net>
References: <1304151675-8653-1-git-send-email-koen@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] git: make it work on the target
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
X-List-Received-Date: Sat, 30 Apr 2011 08:24:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Saul, this depends on http://patches.openembedded.org/patch/3031/

Op 30 apr 2011, om 10:21 heeft Koen Kooi het volgende geschreven:

> Packaging is synced with OE .dev, but without the -large, thanks to =
pseudo we retain all (hard)links properly:
>=20
> * git-perltools holds all the utils requiring perl and adds =
appropriate RDEPENDS
> * git-tk holds the tcl/tk utils once they get activate
> * git now packages /usr/libexec/git-core
>=20
> The result:
>=20
> 8.5M	ipk/armv7a/git_1.7.4.3-r2_armv7a.ipk
> 3.1M	ipk/armv7a/git-dbg_1.7.4.3-r2_armv7a.ipk
> 4.0K	ipk/armv7a/git-dev_1.7.4.3-r2_armv7a.ipk
> 12K	ipk/armv7a/git-doc_1.7.4.3-r2_armv7a.ipk
> 136K	ipk/armv7a/git-perltools_1.7.4.3-r2_armv7a.ipk
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> meta/recipes-devtools/git/git.inc        |   32 =
++++++++++++++++++++++++++++-
> meta/recipes-devtools/git/git_1.7.4.3.bb |    2 +-
> 2 files changed, 31 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/git/git.inc =
b/meta/recipes-devtools/git/git.inc
> index 843a1d3..7f12859 100644
> --- a/meta/recipes-devtools/git/git.inc
> +++ b/meta/recipes-devtools/git/git.inc
> @@ -14,11 +14,39 @@ EXTRA_OECONF =3D =
"--with-perl=3D${STAGING_BINDIR_NATIVE}/perl --without-tcltk"
> inherit autotools
>=20
> do_install () {
> -	oe_runmake install DESTDIR=3D"${D}" bindir=3D${bindir} =
gitexecdir=3D${gitexecdir} \
> +	oe_runmake install DESTDIR=3D"${D}" bindir=3D${bindir} \
> 		template_dir=3D${datadir}/git-core/templates \
> 		GIT_PYTHON_DIR=3D${D}${datadir}/git-core/python
> }
>=20
> -FILES_${PN} +=3D "${datadir}/git-core"
> +FILES_${PN} +=3D "${datadir}/git-core ${libxecdir}/git-core/"
> +FILES_${PN}-dbg +=3D "${libexecdir}/git-core/.debug"
> +
> +# Git tools requiring perl
> +PACKAGES =3D+ "${PN}-perltools"
> +FILES_${PN}-perltools +=3D " \
> +    ${libexecdir}/git-core/git-add--interactive \
> +    ${libexecdir}/git-core/git-archimport \
> +    ${libexecdir}/git-core/git-cvsexportcommit \
> +    ${libexecdir}/git-core/git-cvsimport \
> +    ${libexecdir}/git-core/git-cvsserver \
> +    ${bindir}/git-cvsserver \
> +    ${libexecdir}/git-core/git-difftool \
> +    ${libexecdir}/git-core/git-relink \
> +    ${libexecdir}/git-core/git-send-email \
> +    ${libexecdir}/git-core/git-svn \
> +    ${datadir}/perl \
> +"
> +RDEPENDS_${PN}-perltools =3D "${PN} perl perl-module-file-path =
findutils"
> +
> +# git-tk package with gitk and git-gui
> +PACKAGES =3D+ "${PN}-tk"
> +RDEPENDS_${PN}-tk =3D "${PN} tk tcl"
> +EXTRA_OEMAKE =3D "TCL_PATH=3D${STAGING_BINDIR_CROSS}/tclsh"
> +FILES_${PN}-tk =3D " \
> +    ${bindir}/gitk \
> +    ${datadir}/gitk \
> +"
> +
>=20
> BBCLASSEXTEND =3D "native"
> diff --git a/meta/recipes-devtools/git/git_1.7.4.3.bb =
b/meta/recipes-devtools/git/git_1.7.4.3.bb
> index 2ff1ed5..45ef61b 100644
> --- a/meta/recipes-devtools/git/git_1.7.4.3.bb
> +++ b/meta/recipes-devtools/git/git_1.7.4.3.bb
> @@ -1,6 +1,6 @@
> require git.inc
>=20
> -PR =3D "r1"
> +PR =3D "r2"
>=20
> EXTRA_OECONF +=3D "ac_cv_snprintf_returns_bogus=3Dno =
ac_cv_c_c99_format=3Dyes \
>                  =
ac_cv_fread_reads_directories=3D${ac_cv_fread_reads_directories=3Dyes} \
> --=20
> 1.6.6.1
>=20




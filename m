Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RO4iv-0002oz-5O
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 10:45:37 +0100
Received: by wyh5 with SMTP id 5so1505287wyh.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Nov 2011 01:39:22 -0800 (PST)
Received: by 10.181.13.84 with SMTP id ew20mr1689715wid.58.1320831562102;
	Wed, 09 Nov 2011 01:39:22 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id hq5sm2495328wib.7.2011.11.09.01.39.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Nov 2011 01:39:20 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Wed, 9 Nov 2011 10:39:12 +0100
In-Reply-To: <9f8d5c15eb59611c86dee83180642f29dcc7a361.1320780004.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1320780004.git.sgw@linux.intel.com>
	<9f8d5c15eb59611c86dee83180642f29dcc7a361.1320780004.git.sgw@linux.intel.com>
Message-Id: <A0EB7E7A-7D90-42FD-8AD7-4173501CE0D8@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [CONSOLIDATED PULL 17/17] python: skip setup.py 'import check' when cross-compiling
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
X-List-Received-Date: Wed, 09 Nov 2011 09:45:37 -0000
X-Groupsio-MsgNum: 12193
Content-Type: multipart/signed;
	boundary="Apple-Mail=_97A09508-3B1F-4DC7-B11D-F5352A8705BF";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_97A09508-3B1F-4DC7-B11D-F5352A8705BF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Missing PR bump!

Op 8 nov. 2011, om 20:22 heeft Saul Wold het volgende geschreven:

> From: Tom Zanussi <tom.zanussi@intel.com>
>=20
> build_extension() in setup.py, as part of the build process, does an
> 'import check' on the built extension.  The import check in turn
> dlopen()'s the shared library associated with the extension, which
> isn't something that makes sense if that library was cross-compiled
> for a different architecture.
>=20
> This was noticed with an x86_64 target that was compiled with avx
> support, because it caused 'illegal instruction' exceptions:
>=20
> | /bin/sh: line 1: 14575 Illegal instruction ... -E ./setup.py -q =
build
>=20
> For other target architectures, it doesn't necessarily cause illegal
> instruction exceptions, but still fails.  For example, on arm, the
> failure pathway causes this warning:
>=20
> *** WARNING: renaming "cmath" since importing it failed: .../cmath.so:
>    wrong ELF class: ELFCLASS32
>=20
> This patch to setup.py and the associated recipe changes allow the
> whole 'import check' logic to be skipped when cross-compiling.
>=20
> Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
> ---
> .../python/setup_py_skip_cross_import_check.patch  |   27 =
++++++++++++++++++++
> meta/recipes-devtools/python/python_2.7.2.bb       |    5 +++
> 2 files changed, 32 insertions(+), 0 deletions(-)
> create mode 100644 =
meta/recipes-devtools/python/python/setup_py_skip_cross_import_check.patch=

>=20
> diff --git =
a/meta/recipes-devtools/python/python/setup_py_skip_cross_import_check.pat=
ch =
b/meta/recipes-devtools/python/python/setup_py_skip_cross_import_check.pat=
ch
> new file mode 100644
> index 0000000..6ccdb94
> --- /dev/null
> +++ =
b/meta/recipes-devtools/python/python/setup_py_skip_cross_import_check.pat=
ch
> @@ -0,0 +1,27 @@
> +This patch skips over the 'import check' setup.py does when building
> +extensions.  This generally won't work when cross-compiling.
> +
> +Upstream-Status: Inappropriate [embedded-specific]
> +
> +Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
> +
> +Index: Python-2.7.2/setup.py
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- Python-2.7.2.orig/setup.py	2011-11-04 16:46:34.553796410 =
-0500
> ++++ Python-2.7.2/setup.py	2011-11-04 16:59:49.692802313 -0500
> +@@ -287,6 +287,15 @@
> +                           (ext.name, sys.exc_info()[1]))
> +             self.failed.append(ext.name)
> +             return
> ++
> ++        # If we're cross-compiling, we want to skip the import check
> ++        # i.e. we shouldn't be dynamically loading target shared =
libs
> ++        if os.environ.get('CROSS_COMPILE') is not None:
> ++            self.announce(
> ++                'WARNING: skipping import check for cross-compiled =
"%s"' %
> ++                ext.name)
> ++            return
> ++
> +         # Workaround for Mac OS X: The Carbon-based modules cannot =
be
> +         # reliably imported into a command-line Python
> +         if 'Carbon' in ext.extra_link_args:
> diff --git a/meta/recipes-devtools/python/python_2.7.2.bb =
b/meta/recipes-devtools/python/python_2.7.2.bb
> index bb088a4..360e64e 100644
> --- a/meta/recipes-devtools/python/python_2.7.2.bb
> +++ b/meta/recipes-devtools/python/python_2.7.2.bb
> @@ -18,6 +18,7 @@ SRC_URI +=3D "\
>   file://multilib.patch \
>   file://cgi_py.patch \
>   file://remove_sqlite_rpath.patch \
> +  file://setup_py_skip_cross_import_check.patch \
> "
>=20
> S =3D "${WORKDIR}/Python-${PV}"
> @@ -57,6 +58,8 @@ do_compile() {
> 	# then call do_install twice we get Makefile.orig =3D=3D =
Makefile.sysroot
> 	install -m 0644 Makefile Makefile.sysroot
>=20
> +	export CROSS_COMPILE=3D"${TARGET_PREFIX}"
> +
> 	oe_runmake HOSTPGEN=3D${STAGING_BINDIR_NATIVE}/pgen \
> 		HOSTPYTHON=3D${STAGING_BINDIR_NATIVE}/python \
> 		STAGING_LIBDIR=3D${STAGING_LIBDIR} \
> @@ -78,6 +81,8 @@ do_install() {
> 	# make install needs the original Makefile, or otherwise the =
inclues would
> 	# go to ${D}${STAGING...}/...
> 	install -m 0644 Makefile.orig Makefile
> +
> +	export CROSS_COMPILE=3D"${TARGET_PREFIX}"
> =09
> 	oe_runmake HOSTPGEN=3D${STAGING_BINDIR_NATIVE}/pgen \
> 		HOSTPYTHON=3D${STAGING_BINDIR_NATIVE}/python \
> --=20
> 1.7.6.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--Apple-Mail=_97A09508-3B1F-4DC7-B11D-F5352A8705BF
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk66SkMACgkQMkyGM64RGpHFSwCgjcsPzKJGKPMYCIjZWvpO1V3C
/UcAoIf+GzlEFg4l85P/trzhA2vr/L/Y
=pOaj
-----END PGP SIGNATURE-----

--Apple-Mail=_97A09508-3B1F-4DC7-B11D-F5352A8705BF--

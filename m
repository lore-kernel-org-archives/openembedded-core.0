Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RO5bR-0005Z7-9D
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 11:41:57 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 09 Nov 2011 02:35:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,483,1315206000"; d="scan'208";a="34820485"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by AZSMGA002.ch.intel.com with ESMTP; 09 Nov 2011 02:35:40 -0800
Received: from pgsmsx151.gar.corp.intel.com (172.30.236.41) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 9 Nov 2011 18:34:53 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX151.gar.corp.intel.com (172.30.236.41) with Microsoft SMTP Server
	(TLS) id 14.1.323.3; Wed, 9 Nov 2011 18:34:52 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi; Wed, 9 Nov 2011
	18:34:51 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 9 Nov 2011 18:34:50 +0800
Thread-Topic: [OE-core] [CONSOLIDATED PULL 17/17] python: skip setup.py
	'import	check' when cross-compiling
Thread-Index: AcyeS/6icNTsjvduQAmdbRTgbbZ0GwAfuUTA
Message-ID: <1865303E0DED764181A9D882DEF65FB6DF1AE8C698@shsmsx502.ccr.corp.intel.com>
References: <cover.1320780004.git.sgw@linux.intel.com>
	<9f8d5c15eb59611c86dee83180642f29dcc7a361.1320780004.git.sgw@linux.intel.com>
In-Reply-To: <9f8d5c15eb59611c86dee83180642f29dcc7a361.1320780004.git.sgw@linux.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [CONSOLIDATED PULL 17/17] python: skip setup.py 'import	check' when cross-compiling
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
X-List-Received-Date: Wed, 09 Nov 2011 10:41:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

How I wish I could notice the patch this morning so I could save 1 day!

Anyway, thanks TomZ for the patch!  :-)

Thanks,
-- Dexuan


> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Saul Wold
> Sent: Wednesday, November 09, 2011 3:23 AM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [CONSOLIDATED PULL 17/17] python: skip setup.py
> 'import check' when cross-compiling
>=20
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
> | /bin/sh: line 1: 14575 Illegal instruction ... -E ./setup.py -q build
>=20
> For other target architectures, it doesn't necessarily cause illegal
> instruction exceptions, but still fails.  For example, on arm, the
> failure pathway causes this warning:
>=20
> *** WARNING: renaming "cmath" since importing it failed: .../cmath.so:
>     wrong ELF class: ELFCLASS32
>=20
> This patch to setup.py and the associated recipe changes allow the
> whole 'import check' logic to be skipped when cross-compiling.
>=20
> Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
> ---
>  .../python/setup_py_skip_cross_import_check.patch  |   27
> ++++++++++++++++++++
>  meta/recipes-devtools/python/python_2.7.2.bb       |    5 +++
>  2 files changed, 32 insertions(+), 0 deletions(-)
>  create mode 100644
> meta/recipes-devtools/python/python/setup_py_skip_cross_import_check.
> patch
>=20
> diff --git
> a/meta/recipes-devtools/python/python/setup_py_skip_cross_import_chec
> k.patch
> b/meta/recipes-devtools/python/python/setup_py_skip_cross_import_chec
> k.patch
> new file mode 100644
> index 0000000..6ccdb94
> --- /dev/null
> +++
> b/meta/recipes-devtools/python/python/setup_py_skip_cross_import_chec
> k.patch
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
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- Python-2.7.2.orig/setup.py	2011-11-04 16:46:34.553796410 -0500
> ++++ Python-2.7.2/setup.py	2011-11-04 16:59:49.692802313 -0500
> +@@ -287,6 +287,15 @@
> +                           (ext.name, sys.exc_info()[1]))
> +             self.failed.append(ext.name)
> +             return
> ++
> ++        # If we're cross-compiling, we want to skip the import check
> ++        # i.e. we shouldn't be dynamically loading target shared libs
> ++        if os.environ.get('CROSS_COMPILE') is not None:
> ++            self.announce(
> ++                'WARNING: skipping import check for cross-compiled
> "%s"' %
> ++                ext.name)
> ++            return
> ++
> +         # Workaround for Mac OS X: The Carbon-based modules cannot
> be
> +         # reliably imported into a command-line Python
> +         if 'Carbon' in ext.extra_link_args:
> diff --git a/meta/recipes-devtools/python/python_2.7.2.bb
> b/meta/recipes-devtools/python/python_2.7.2.bb
> index bb088a4..360e64e 100644
> --- a/meta/recipes-devtools/python/python_2.7.2.bb
> +++ b/meta/recipes-devtools/python/python_2.7.2.bb
> @@ -18,6 +18,7 @@ SRC_URI +=3D "\
>    file://multilib.patch \
>    file://cgi_py.patch \
>    file://remove_sqlite_rpath.patch \
> +  file://setup_py_skip_cross_import_check.patch \
>  "
>=20
>  S =3D "${WORKDIR}/Python-${PV}"
> @@ -57,6 +58,8 @@ do_compile() {
>  	# then call do_install twice we get Makefile.orig =3D=3D Makefile.sysro=
ot
>  	install -m 0644 Makefile Makefile.sysroot
>=20
> +	export CROSS_COMPILE=3D"${TARGET_PREFIX}"
> +
>  	oe_runmake HOSTPGEN=3D${STAGING_BINDIR_NATIVE}/pgen \
>  		HOSTPYTHON=3D${STAGING_BINDIR_NATIVE}/python \
>  		STAGING_LIBDIR=3D${STAGING_LIBDIR} \
> @@ -78,6 +81,8 @@ do_install() {
>  	# make install needs the original Makefile, or otherwise the inclues
> would
>  	# go to ${D}${STAGING...}/...
>  	install -m 0644 Makefile.orig Makefile
> +
> +	export CROSS_COMPILE=3D"${TARGET_PREFIX}"
>=20
>  	oe_runmake HOSTPGEN=3D${STAGING_BINDIR_NATIVE}/pgen \
>  		HOSTPYTHON=3D${STAGING_BINDIR_NATIVE}/python \
> --
> 1.7.6.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



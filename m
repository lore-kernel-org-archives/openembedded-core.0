Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QoGeY-0004iO-5C
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 17:13:06 +0200
Received: by gwb11 with SMTP id 11so4715828gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Aug 2011 08:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to;
	bh=Y5N/v5+JaoQ9jokb6Oywa/sWMs6rAloDdnh7YmGnOqQ=;
	b=SIqhW51LfbzDUoqbepEJ3TjVykTla3FOKHhOwOm3fTtfZ0oxHr+cwKVFXbBPMLcXvH
	IQOiv0iuoE29P++K63cIQ1EKdFd/ZTC7zcViQb7rxoS8j5YcbSC6Mgc6NvhwOt/T+C+K
	08kCGKeZSsSuoE0iGV/pQ7FI+5sRx1dhtMmhc=
Received: by 10.142.232.4 with SMTP id e4mr145142wfh.446.1312297715562;
	Tue, 02 Aug 2011 08:08:35 -0700 (PDT)
Received: from [192.168.1.81] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id s6sm3819344wff.3.2011.08.02.08.08.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 02 Aug 2011 08:08:33 -0700 (PDT)
References: <1312272881-15695-1-git-send-email-galak@kernel.crashing.org>
In-Reply-To: <1312272881-15695-1-git-send-email-galak@kernel.crashing.org>
Mime-Version: 1.0 (iPad Mail 8J2)
Message-Id: <1531D945-BF2E-4E61-8A31-145CC4728865@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPad Mail (8J2)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 Aug 2011 08:09:41 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] automake: Fix issue with tar configure failing with large UID/GIDs
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
X-List-Received-Date: Tue, 02 Aug 2011 15:13:06 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



On Aug 2, 2011, at 1:14 AM, Kumar Gala <galak@kernel.crashing.org> wrote:

> Add a fixup for trying to create ustar archives when the users
> UID or GID is larger than the format allows.
>=20
> Based on a patch from Tom Rini
>=20
> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
> ---
> meta/recipes-devtools/automake/automake.inc        |    2 +-
> .../prefer-cpio-over-pax-for-ustar-archives.patch  |   26 ++++++++++++++++=
++++
> meta/recipes-devtools/automake/automake_1.11.1.bb  |    8 +++++-
> 3 files changed, 34 insertions(+), 2 deletions(-)
> create mode 100644 meta/recipes-devtools/automake/automake/prefer-cpio-ove=
r-pax-for-ustar-archives.patch
>=20
> diff --git a/meta/recipes-devtools/automake/automake.inc b/meta/recipes-de=
vtools/automake/automake.inc
> index beeec7b..96d797f 100644
> --- a/meta/recipes-devtools/automake/automake.inc
> +++ b/meta/recipes-devtools/automake/automake.inc
> @@ -4,7 +4,7 @@ Standards. Automake requires the use of Autoconf."
> LICENSE =3D "GPLv2"
> HOMEPAGE =3D "http://www.gnu.org/software/automake/"
> SECTION =3D "devel"
> -PR =3D "r2"
> +PR =3D "r3"
>=20
> SRC_URI =3D "${GNU_MIRROR}/automake/automake-${PV}.tar.bz2 "
>=20
> diff --git a/meta/recipes-devtools/automake/automake/prefer-cpio-over-pax-=
for-ustar-archives.patch b/meta/recipes-devtools/automake/automake/prefer-cp=
io-over-pax-for-ustar-archives.patch
> new file mode 100644
> index 0000000..3fda937
> --- /dev/null
> +++ b/meta/recipes-devtools/automake/automake/prefer-cpio-over-pax-for-ust=
ar-archives.patch
> @@ -0,0 +1,26 @@
> +Index: automake-1.11.1/m4/tar.m4
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- automake-1.11.1.orig/m4/tar.m4
> ++++ automake-1.11.1/m4/tar.m4
> +@@ -30,7 +30,7 @@ m4_if([$1], [v7],
> +               [m4_fatal([Unknown tar format])])
> + AC_MSG_CHECKING([how to create a $1 tar archive])
> + # Loop over all known methods to create a tar archive until one works.
> +-_am_tools=3D'gnutar m4_if([$1], [ustar], [plaintar]) pax cpio none'
> ++_am_tools=3D'gnutar m4_if([$1], [ustar], [plaintar]) cpio pax none'
> + _am_tools=3D${am_cv_prog_tar_$1-$_am_tools}
> + # Do not fold the above two line into one, because Tru64 sh and
> + # Solaris sh will not grok spaces in the rhs of `-'.
> +Index: automake-1.11.1/Makefile.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- automake-1.11.1.orig/Makefile.in
> ++++ automake-1.11.1/Makefile.in
> +@@ -44,7 +44,7 @@ am__aclocal_m4_deps =3D $(top_srcdir)/m4/a
> +    $(top_srcdir)/m4/missing.m4 $(top_srcdir)/m4/mkdirp.m4 \
> +    $(top_srcdir)/m4/options.m4 $(top_srcdir)/m4/runlog.m4 \
> +    $(top_srcdir)/m4/sanity.m4 $(top_srcdir)/m4/strip.m4 \
> +-    $(top_srcdir)/m4/substnot.m4 $(top_srcdir)/m4/tar.m4 \
> ++    $(top_srcdir)/m4/substnot.m4 \
> +    $(top_srcdir)/configure.ac
> + am__configure_deps =3D $(am__aclocal_m4_deps) $(CONFIGURE_DEPENDENCIES) \=

> +    $(ACLOCAL_M4)
> diff --git a/meta/recipes-devtools/automake/automake_1.11.1.bb b/meta/reci=
pes-devtools/automake/automake_1.11.1.bb
> index b231a94..764b6fc 100644
> --- a/meta/recipes-devtools/automake/automake_1.11.1.bb
> +++ b/meta/recipes-devtools/automake/automake_1.11.1.bb
> @@ -32,11 +32,17 @@ RDEPENDS_automake-native =3D "autoconf-native perl-nat=
ive-runtime"
> PATHFIXPATCH =3D "file://path_prog_fixes.patch;patch=3D1"
> PATHFIXPATCH_virtclass-native =3D ""
>=20
> -SRC_URI +=3D "${PATHFIXPATCH}"
> +SRC_URI +=3D "${PATHFIXPATCH} \
> +        file://prefer-cpio-over-pax-for-ustar-archives.patch;patch=3D1"

Patch level 1 is default so patch=3D1 is not needed here
>=20
> SRC_URI[md5sum] =3D "c2972c4d9b3e29c03d5f2af86249876f"
> SRC_URI[sha256sum] =3D "5b159d3c0e0a1f87de71b68bcb9f1a1c49e9e71749c9b723f1=
7e2e1e0295c7ae"
>=20
> +do_configure () {
> +    touch ${S}/Makefile.in
> +    autotools_do_configure
> +}
> +
> do_install () {
>    oe_runmake 'DESTDIR=3D${D}' install
>    install -d ${D}${datadir}
> --=20
> 1.7.3.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



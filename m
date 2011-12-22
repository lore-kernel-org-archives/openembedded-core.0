Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Rdlc3-0000vY-J1
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 17:35:24 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Dec 2011 08:28:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="90514068"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by orsmga002.jf.intel.com with ESMTP; 22 Dec 2011 08:28:02 -0800
Received: from orsmsx606.amr.corp.intel.com (10.22.226.128) by
	orsmsx604.amr.corp.intel.com (10.22.226.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 22 Dec 2011 08:28:02 -0800
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx606.amr.corp.intel.com ([10.22.226.128]) with mapi;
	Thu, 22 Dec 2011 08:28:02 -0800
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 22 Dec 2011 08:27:59 -0800
Thread-Topic: [OE-core] [PATCH 3/3] binutils: fix building on distros with
	matching binutils version
Thread-Index: AczAMb0Y+0wHc5jbR9CPw4wnjyz3AAAlNo8Q
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94E7922621@orsmsx504.amr.corp.intel.com>
References: <cover.1324495514.git.nitin.a.kamble@intel.com>
	<16df1bc176ad96d8fbe36701a40314bdc5a487dc.1324495514.git.nitin.a.kamble@intel.com>
	<20111221224125.GG12791@jama.jama.net>
In-Reply-To: <20111221224125.GG12791@jama.jama.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] binutils: fix building on distros with matching binutils version
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
X-List-Received-Date: Thu, 22 Dec 2011 16:35:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Martin,
  Thanks for the report.
Nitin
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Martin Jansa
> Sent: Wednesday, December 21, 2011 2:41 PM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 3/3] binutils: fix building on distros
> with matching binutils version
>=20
> On Wed, Dec 21, 2011 at 11:27:14AM -0800, nitin.a.kamble@intel.com
> wrote:
> > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> >
> > x86_64 opensuse 11.4 has bintuils version 2.21, and when
> > binutils_2.21 recipe is built for x86_64 target then, the invocation
> > of distro gcc fails with errors like this:
> >
> > /usr/lib64/gcc/x86_64-suse-linux/4.5/../../../../x86_64-suse-
> linux/bin/as:
> > symbol lookup error: /usr/lib64/gcc/x86_64-suse-linux/4.5/..
> > make[2]: *** [sysinfo.o] Error 1
> >
> > The issue rootcaused as incompatible LD_LIBRARY_PATH while running
> the
> > distro gcc.
> >
> > As per Martin Jansa gentoo also sees similar issue with binutils 2.22
> > recipe.
>=20
> I can confirm that with similar patch based on your fix for 2.21 in
> poky-contrib/nitin/bugfix I was able to build binutils for qemux86-64
> for first time without manual fix :).
>=20
> Cheers,
>=20
> > This commit fixes the issue by clearing the LD_LIBRARY_PATH for
> distro
> > gcc (CC_FOR_BUILD)
> >
> > This Fixes bug: [YOCTO #1833]
> >
> > Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> > ---
> >  .../binutils/binutils-cross-canadian_2.22.bb       |    2 +-
> >  .../binutils/binutils-crosssdk_2.22.bb             |    2 +-
> >  meta/recipes-devtools/binutils/binutils.inc        |    2 +-
> >  meta/recipes-devtools/binutils/binutils_2.22.bb    |    2 +-
> >  4 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git
> > a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.22.bb
> > b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.22.bb
> > index e91e7dc..a49aded 100644
> > --- a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.22.bb
> > +++ b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.22.bb
> > @@ -1,3 +1,3 @@
> >  require binutils_${PV}.bb
> >  require binutils-cross-canadian.inc
> > -PR =3D "r1"
> > +PR =3D "r2"
> > diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.22.bb
> > b/meta/recipes-devtools/binutils/binutils-crosssdk_2.22.bb
> > index 21289cd..0e8b6e4 100644
> > --- a/meta/recipes-devtools/binutils/binutils-crosssdk_2.22.bb
> > +++ b/meta/recipes-devtools/binutils/binutils-crosssdk_2.22.bb
> > @@ -4,7 +4,7 @@ inherit crosssdk
> >
> >  PROVIDES =3D "virtual/${TARGET_PREFIX}binutils-crosssdk"
> >
> > -PR =3D "r1"
> > +PR =3D "r2"
> >
> >  do_configure_prepend () {
> >  	sed -i 's#/usr/local/lib /lib /usr/lib#${SDKPATHNATIVE}/lib
> > ${SDKPATHNATIVE}/usr/lib /usr/local/lib /lib /usr/lib#'
> > ${S}/ld/configure.tgt diff --git
> > a/meta/recipes-devtools/binutils/binutils.inc
> > b/meta/recipes-devtools/binutils/binutils.inc
> > index 5cb2cc9..30a0416 100644
> > --- a/meta/recipes-devtools/binutils/binutils.inc
> > +++ b/meta/recipes-devtools/binutils/binutils.inc
> > @@ -76,7 +76,7 @@ export RANLIB_FOR_TARGET =3D "${TARGET_PREFIX}ranlib"
> >  export CC_FOR_HOST =3D "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}"
> >  export CXX_FOR_HOST =3D "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}"
> >
> > -export CC_FOR_BUILD =3D "${BUILD_CC}"
> > +export CC_FOR_BUILD =3D "LD_LIBRARY_PATH=3D ${BUILD_CC}"
> >  export CPP_FOR_BUILD =3D "${BUILD_CPP}"
> >  export CFLAGS_FOR_BUILD =3D "${BUILD_CFLAGS}"
> >
> > diff --git a/meta/recipes-devtools/binutils/binutils_2.22.bb
> > b/meta/recipes-devtools/binutils/binutils_2.22.bb
> > index f1e7e12..41a30ee 100644
> > --- a/meta/recipes-devtools/binutils/binutils_2.22.bb
> > +++ b/meta/recipes-devtools/binutils/binutils_2.22.bb
> > @@ -1,6 +1,6 @@
> >  require binutils.inc
> >
> > -PR =3D "r1"
> > +PR =3D "r2"
> >
> >  LIC_FILES_CHKSUM=3D"\
> >
> > file://src-release;endline=3D17;md5=3D4830a9ef968f3b18dd5e9f2c00db2d35\
> > --
> > 1.7.6.4
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



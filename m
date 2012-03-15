Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1S8DKH-0007bH-MN
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 17:14:53 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 15 Mar 2012 09:06:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="119373060"
Received: from orsmsx606.amr.corp.intel.com ([10.22.226.128])
	by azsmga001.ch.intel.com with ESMTP; 15 Mar 2012 09:06:05 -0700
Received: from orsmsx105.amr.corp.intel.com (10.22.225.132) by
	orsmsx606.amr.corp.intel.com (10.22.226.128) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 15 Mar 2012 09:06:05 -0700
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.128]) by
	ORSMSX105.amr.corp.intel.com ([169.254.4.199]) with mapi id
	14.01.0355.002; Thu, 15 Mar 2012 09:06:05 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 5/8] python: fix install when libdir is not
	"lib"
Thread-Index: AQHNAk+0kuYt965Ny06M0uScCbELvZZraIOAgAAdlkA=
Date: Thu, 15 Mar 2012 16:06:05 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C01376660@ORSMSX106.amr.corp.intel.com>
References: <cover.1331776831.git.nitin.a.kamble@intel.com>
	<1b743bf3864539a8ce1902a269a5cec7d50dba1b.1331776832.git.nitin.a.kamble@intel.com>
	<20120315071901.GB4973@jama.jama.net>
In-Reply-To: <20120315071901.GB4973@jama.jama.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.138]
MIME-Version: 1.0
Subject: Re: [PATCH 5/8] python: fix install when libdir is not "lib"
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
X-List-Received-Date: Thu, 15 Mar 2012 16:14:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Martin Jansa
> Sent: Thursday, March 15, 2012 12:19 AM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 5/8] python: fix install when libdir is
> not "lib"
>=20
> On Wed, Mar 14, 2012 at 07:02:14PM -0700, nitin.a.kamble@intel.com
> wrote:
> > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> >
> > This commit fixes python's install issue of not finding the native
> > pythong binray modules.
> >
> > Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> > ---
> >  .../python/fix_for_using_different_libdir.patch    |   78
> ++++++++++++++++++++
> >  meta/recipes-devtools/python/python_2.7.2.bb       |    3 +-
> >  2 files changed, 80 insertions(+), 1 deletions(-)  create mode
> 100644
> > meta/recipes-
> devtools/python/python/fix_for_using_different_libdir.pat
> > ch
> >
> > diff --git a/meta/recipes-devtools/python/python_2.7.2.bb
> > b/meta/recipes-devtools/python/python_2.7.2.bb
> > index d2100be..412b294 100644
> > --- a/meta/recipes-devtools/python/python_2.7.2.bb
> > +++ b/meta/recipes-devtools/python/python_2.7.2.bb
> > @@ -20,7 +20,7 @@ SRC_URI +=3D "\
> >    file://setup_py_skip_cross_import_check.patch \
> >    file://add-md5module-support.patch \
> >    file://host_include_contamination.patch \
> > -  file://sys_platform_is_now_always_linux2.patch \
> > +  file://fix_for_using_different_libdir.patch \
>=20
> ^ really?

Martin,
Removing a patch was an accident. It is getting fixed now. Thanks for catch=
ing it.

Nitin

>=20
> >  "
> >
> >  S =3D "${WORKDIR}/Python-${PV}"
> > @@ -99,6 +99,7 @@ do_install() {
> >
> >  	oe_runmake HOSTPGEN=3D${STAGING_BINDIR_NATIVE}/pgen \
> >  		HOSTPYTHON=3D${STAGING_BINDIR_NATIVE}/python \
> > +
> > +CROSSPYTHONPATH=3D${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-
> d
> > +ynload/ \
> >  		STAGING_LIBDIR=3D${STAGING_LIBDIR} \
> >  		STAGING_INCDIR=3D${STAGING_INCDIR} \
> >  		BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} \
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



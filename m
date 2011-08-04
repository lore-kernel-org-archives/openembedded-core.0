Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Qp6UC-0000hM-O6
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 00:33:52 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 Aug 2011 15:29:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,320,1309762800"; d="scan'208";a="37996961"
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by fmsmga001.fm.intel.com with ESMTP; 04 Aug 2011 15:29:27 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx603.amr.corp.intel.com ([10.22.226.49]) with mapi; Thu, 4 Aug 2011
	15:29:27 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 4 Aug 2011 15:29:28 -0700
Thread-Topic: [OE-core] [PATCH 09/10] x86 tune inc files: add x32 abi tune
	parameters
Thread-Index: AcxS8YFWKupu6A+mTL2fM8VJEp9KywAAXF3wAACz8lA=
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94DE85F519@orsmsx504.amr.corp.intel.com>
References: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
	<2c351319afd13acfca1283104172729925cfb696.1312469790.git.nitin.a.kamble@intel.com>
	<1312495032.3169.6.camel@lenovo.internal.reciva.com>
	<9DA5872FEF993D41B7173F58FCF6BE94DE85F4F7@orsmsx504.amr.corp.intel.com>
In-Reply-To: <9DA5872FEF993D41B7173F58FCF6BE94DE85F4F7@orsmsx504.amr.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 09/10] x86 tune inc files: add x32 abi tune parameters
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
X-List-Received-Date: Thu, 04 Aug 2011 22:33:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> >
> > On Thu, 2011-08-04 at 08:01 -0700, nitin.a.kamble@intel.com wrote:
> > >  # ELF32 ABI
> > >  TUNEVALID[m32] =3D "IA32 ELF32 standard ABI"
> > > -TUNECONFLICTS[m32] =3D "m64"
> > > +TUNECONFLICTS[m32] =3D "m64 mx32"
> > >  TUNE_ARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "m32",
> > "${X86ARCH32}", "" ,d)}"
> > > +ABIEXTENSION .=3D "${@bb.utils.contains("TUNE_FEATURES", "m32",
> "32",
> > "" ,d)}"
> > >  TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "m32", "-
> m32",
> > "", d)}"
> >
> > This is going to cause TARGET_OS to change for everyone using the
> i586
> > ABI, right?  That doesn't seem like it is either necessary or
> > desirable,
> > and it isn't mentioned in the checkin comment either.
>=20
> Correct, this will change the TARGET_OS from linux_gnu to linux_gnu32.
> And it is also applicable for x86-64 machine set with x86 tune. This
> change is be needed if multiple tunes are built from the same build
> directory. If such situation is not important then the ABIEXTENSION
> part can be dropped.
>=20
> >
> > >  # ELF64 ABI
> > >  TUNEVALID[m64] =3D "IA32e (x86_64) ELF64 standard ABI"
> > > -TUNECONFLICT[m64] =3D "m32"
> > > +TUNECONFLICT[m64] =3D "m32 mx32"
> > >  TUNE_ARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "m64",
> > "${X86ARCH64}", "" ,d)}"
> > > +ABIEXTENSION .=3D "${@bb.utils.contains("TUNE_FEATURES", "m64",
> "64",
> > "" ,d)}"
> > >  TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "m64", "-
> m64",
> > "", d)}"
> >
> > ... and likewise this for anybody using the x86-64 ABI.
> This is similar to above.
>=20
> >
> > > -PACKAGE_EXTRA_ARCHS_tune-x86-64 =3D "x86_64"
> > > +PACKAGE_EXTRA_ARCHS_tune-x86-64 =3D "x86-64"
> >
> > That change might well be fine, but again it isn't mentioned in the
> > checkin message.
> This is making this consistent with other PACKAGE_EXTRA_ARCHS_tune
> convention elsewhere. I will update the commit message for this.
>=20
> >
> > > diff --git a/meta/conf/machine/include/tune-x86_64.inc
> > b/meta/conf/machine/include/tune-x86_64.inc
> > > index 04b0f96..50f20ba 100644
> > > --- a/meta/conf/machine/include/tune-x86_64.inc
> > > +++ b/meta/conf/machine/include/tune-x86_64.inc
> > > @@ -1,3 +1,3 @@
> > >  require conf/machine/include/ia32/arch-ia32.inc
> > >
> > > -DEFAULTTUNE =3D "x86-64"
> > > +DEFAULTTUNE ?=3D "x86-64"
> >
> > This one is also not mentioned in the checkin message and looks a bit
> > more dubious to me.  Why is this required?
> >
> It was required at one point when multilist support was quiet unstable.
> The reason it is done because the arch-ia32.inc file is included for
> both x86, tune-core, & x86-64 and setting this hard assignment, was
> breaking x86 or x32 targets. Not sure if it is still needed, I will
> check it.
Just checked, this is needed, when qemux86-64 machine is configured with x3=
2 abi, when a different default tune is used.
Nitin

>=20
> > p.
> >
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QGwTZ-00034M-N8
	for openembedded-core@lists.openembedded.org;
	Mon, 02 May 2011 19:00:02 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 May 2011 09:57:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,303,1301900400"; d="scan'208";a="428994390"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by azsmga001.ch.intel.com with ESMTP; 02 May 2011 09:57:23 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx604.amr.corp.intel.com ([10.250.113.17]) with mapi;
	Mon, 2 May 2011 09:57:18 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 2 May 2011 09:57:18 -0700
Thread-Topic: [OE-core] [PATCH]] python: Unbreak Python third-party extensions
Thread-Index: AcwGY2SzLatulOd1QFig6z7iT61TjQChguwA
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94D86872CF@orsmsx504.amr.corp.intel.com>
References: <1304073898-12204-1-git-send-email-michael.lippautz@gmail.com>
	<9AB9810D-F908-4477-888F-056039505DCF@dominion.thruhere.net>
	<BANLkTik1anmE4n7fKMp4uV9ZSLK1Gx_C0g@mail.gmail.com>
In-Reply-To: <BANLkTik1anmE4n7fKMp4uV9ZSLK1Gx_C0g@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH]] python: Unbreak Python third-party extensions
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
X-List-Received-Date: Mon, 02 May 2011 17:00:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> > Op 29 apr 2011, om 12:44 heeft Michael Lippautz het volgende
> geschreven:
> >
> >> This fixes compilation/linking of Python 3rd party extensions.
> >>
> >> ${STAGING_LIBDIR}/python<pyver>/config/Makefile needs the correct
> >> INCDIR and LIBDIR settings to be used in cross compilation for the
> >> target. 3rd party module use distutils.sysconfig which uses this
> >> Makefile to create compiler/linker flags.
> >>
> >> Workflow:
> >> 1) compile needs the staged/sysroot Makefile since it is needed
> >> =A0 for compilation/linking
> >> 2) install needs the unmodified Makefile to install files (i.e.
> >> =A0 headers) into the right directores. (otherwise they would be
> >> =A0 installed in ${D}/${STAGING_...}
> >> 3) staging needs modified Makefile again
> >> 4) packaging needs unmodified to make compilation on the target
> >> =A0 possible
> >
> > Does any of the sysroot leak into the 3rd party extensions after this
> patch? Apart from that question, the patch looks good to me, although I
> needed a cup of coffee to work out the flow.
>=20
> Nothing leaks into the 3rd party extensions as far as I know. The
> Makefile is used by distutils (i.e. distutils.sysconfig) to determine
> the compiler settings.
>=20
> In the case of a 3rd partyextension the flow is as follows:
> * distutils.bbclass uses python-native + distutils-native to generate
> the package
> * distutils-native looks up the compiler settings via
> distutils.sysconfig (-native) in
> ${STAGING_LIBDIR}/python<pyver>/config/Makefile
>   (it is thus important that STAGING_LIBDIR is set by
> distutils.bbclass)
> * 3rd party extension is compiled using the settings from this Makefile
>=20
> The compilation on the target should still be possible (although I
> didn't test it), because the target's Makefile is untouched.
>=20
> The actual problem was that the targets Makefile did get staged and
> the compiler and linker have been invoked with the targets libs, for
> instance -L/usr/lib.
>=20
> > regards,
> >
> > Koen
>=20
> (I needed more than one coffee to figure out this flow)
>=20
> -Michael

Michael,
   This patch is invasive for python recipe but looks fine to me. How much =
testing have you done? We have few python extensions in yocto repo, and non=
e of them were hit by this issue. So which python extensions are seeing the=
 issue?

Thanks,
Nitin


>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



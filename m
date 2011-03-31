Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Q57Rz-0000bE-UY
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Mar 2011 04:17:32 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 30 Mar 2011 19:09:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,271,1299484800"; d="scan'208";a="673538796"
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by fmsmga002.fm.intel.com with ESMTP; 30 Mar 2011 19:09:04 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx603.amr.corp.intel.com ([10.22.226.49]) with mapi;
	Wed, 30 Mar 2011 19:09:03 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 30 Mar 2011 19:09:00 -0700
Thread-Topic: [OE-core] lconfig-native is not endian safe
Thread-Index: Acvu8WDciY2k6meURxqBJo3FoaW/5AAVdTeQAAASnmAAADUm4A==
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94510B84B1@orsmsx504.amr.corp.intel.com>
References: <1301496447.24596.100.camel@rex> <4D934FBC.40802@windriver.com>
	<9DA5872FEF993D41B7173F58FCF6BE94510B849E@orsmsx504.amr.corp.intel.com>
	<9DA5872FEF993D41B7173F58FCF6BE94510B84A7@orsmsx504.amr.corp.intel.com>
In-Reply-To: <9DA5872FEF993D41B7173F58FCF6BE94510B84A7@orsmsx504.amr.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: lconfig-native is not endian safe
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
X-List-Received-Date: Thu, 31 Mar 2011 02:17:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> > I have updated the ldconfig-native to match the version of eglibc
> > 2.12.1, but that still does not solve the endienness problem of cross
> > ppc.
>=20
> BTW ldconfig's endienness issue is also for mips & armeb.

Another solution I was thinking of was:
  Use the target ldconfig in qemu shell. (like the glibc locales were gener=
ated earlier).
Does it make sense to do it that way, or is it better to just not generate =
the ld.so.cache?


>=20
> >
> > Thanks,
> > Nitin
> >
> >
> > > -----Original Message-----
> > > From: openembedded-core-bounces@lists.openembedded.org
> > > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> > Of
> > > Mark Hatle
> > > Sent: Wednesday, March 30, 2011 8:44 AM
> > > To: openembedded-core@lists.openembedded.org
> > > Subject: Re: [OE-core] lconfig-native is not endian safe
> > >
> > > On 3/30/11 9:47 AM, Richard Purdie wrote:
> > > > Hi,
> > > >
> > > > Poky has had a ldconfig-native recipe in for a while. Back in the
> > > times
> > > > our RPATHS were totally broken adding in an ld.so.cache was
> useful.
> > > In
> > > > modern times I'm having trouble working out when this would be
> > useful
> > > on
> > > > a standard system as libraries are pretty much always in one of
> the
> > > two
> > > > default search locations.
> > > >
> > > > ldconfig-native is 32/64 bit safe. I've just been looking at PPC
> > and
> > > it
> > > > is certainly not endian safe though. The endianess of the target
> > > system
> > > > need to match that of the build system for it to work. It
> wouldn't
> > be
> > > > much work to make it endian safe though although the codebase
> will
> > > > diverge further from that in (e)glibc though.
> > > >
> > > > Short term we need to disable it at least for ppc, longer term
> what
> > > > should we do?
> > >
> > > On ARM, are the structures packed in the same way as the target
> > system?
> > >
> > > I know I prefer to NOT use ldconfig in the systems I design, but I
> > > understand
> > > why people want it.
> > >
> > > I suggest we disable it on PPC for now, and work on updating endian
> > > support,
> > > (packing if necessary) and make sure that it supports the latest
> > > ldconfig
> > > features of being able to use referenced directories and such.
> > >
> > > --Mark
> > >
> > > > Cheers,
> > > >
> > > > Richard
> > > >
> > > >
> > > > _______________________________________________
> > > > Openembedded-core mailing list
> > > > Openembedded-core@lists.openembedded.org
> > > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-
> > core
> > >
> > >
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-
> core
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



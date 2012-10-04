Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1TJl06-0006bY-Hn
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Oct 2012 14:58:02 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q94CdTOI025128;
	Thu, 4 Oct 2012 07:39:29 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q94CdTe5028760;
	Thu, 4 Oct 2012 07:39:29 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Thu, 4 Oct 2012 07:39:29 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] libtool: Add missing DEPENDS on libtool-cross
Thread-Index: AQHNohGpIKsqLuL3q0uUHVwyg/BmXZepFSuQ
Date: Thu, 4 Oct 2012 12:39:27 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159242C29@DLEE12.ent.ti.com>
References: <1349213439-14199-1-git-send-email-Chase.Maupin@ti.com>
	<1349342479.18301.68.camel@ted>
In-Reply-To: <1349342479.18301.68.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libtool: Add missing DEPENDS on libtool-cross
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
X-List-Received-Date: Thu, 04 Oct 2012 12:58:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On
> Behalf Of Richard Purdie
> Sent: Thursday, October 04, 2012 4:21 AM
> To: Maupin, Chase
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] libtool: Add missing DEPENDS on
> libtool-cross
>=20
> On Tue, 2012-10-02 at 16:30 -0500, Chase Maupin wrote:
> > * When building with 24 bitbake threads on my system I observed
> >   errors like the following:
> >     | configure.ac:199: error: LT_LANG: unsupported language:
> "Go"
> >     | <tmpdir>/work/armv7a-vfp-neon-oe-linux-gnueabi/libtool-
> 2.4.2-r3.0/libtool-2.4.2/aclocal-copy/libtool.m4:768: LT_LANG is
> expanded from...
> >     | configure.ac:199: the top level
> >     | autom4te: m4 failed with exit status: 1
> > * This could be found by doing a clean build.  If a build had
> >   already been performed then often just cleaning the libtool
> >   package and rebuilding it would resolve the issue.
> > * Adding a DEPENDS on libtool-cross resolves this issue with a
> >   clean build.
> > * Bump the PR
>=20
> So how do I reproduce this bug? In theory I'd just run "bitbake
> libtool"
> in a clean build directory?
>=20
> I've tried that with master and it all works? :/

Richard,

I was able to reproduce this consistently on my build server which has 24 c=
ores running at 3.5 GHz.  I was using:

BB_NUMBER_THREADS =3D "24"

And

PARALLEL_MAKE =3D "-j 24"

I can try a build reducing the number of threads and see if the issue goes =
away as this might be a difference between our builds.  Can you tell me wha=
t you are using?

It seemed like a race condition because after I got the error I was able to=
 do a -c cleanall of libtool and kick off the build again once libtool-cros=
s was built and it would pass.  Likewise I did:

bitbake libtool-cross
bitbake libtool

and that would work but just

bitbake libtool

would fail.

>=20
> Cheers,
>=20
> Richard
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-
> core



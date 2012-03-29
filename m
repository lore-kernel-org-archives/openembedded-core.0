Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SDMJP-0000Jv-1S
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 22:51:15 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 29 Mar 2012 13:42:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="123259231"
Received: from unknown (HELO helios.localnet) ([10.252.123.240])
	by orsmga001.jf.intel.com with ESMTP; 29 Mar 2012 13:42:09 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Thu, 29 Mar 2012 21:42:08 +0100
Message-ID: <4067879.36leZStCMh@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-17-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <alpine.DEB.2.02.1203291533390.5968@oneiric>
References: <alpine.DEB.2.02.1203291505580.4586@oneiric>
	<20120329212924.5d01d792@eb-e6520>
	<alpine.DEB.2.02.1203291533390.5968@oneiric>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: argh ... "_append" versus "+=" and IMAGE_INSTALL confusion
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
X-List-Received-Date: Thu, 29 Mar 2012 20:51:15 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Thursday 29 March 2012 15:35:10 Robert P. J. Day wrote:
> On Thu, 29 Mar 2012, Eric B=E9nard wrote:
> > Le Thu, 29 Mar 2012 15:23:20 -0400 (EDT),
> >=20
> > "Robert P. J. Day" <rpjday@crashcourse.ca> a =E9crit :
> > >   so what is best practise here?
> >=20
> > for this one you have an answer on OE's wiki :
> > http://www.openembedded.org/wiki/I_want_an_image_with_package_XYZ_i=
nstalle
> > d
>=20
>   despite the fact that the current reference manual *explicitly*
> says this?
>=20
> "Using IMAGE_INSTALL with the +=3D operator from the /conf/local.conf=

> file or from within an image recipe is not recommended as it can caus=
e
> ordering issues."

I think what the manual is attempting to mitigate is a situation where =
you do=20
the following in your image recipe:

-------- snip -------
IMAGE_INSTALL +=3D "somepackage1 somepackage2"

inherit core-image
-------- snip -------

In this instance, because IMAGE_INSTALL is set via ?=3D within core-
image.bbclass, IMAGE_INSTALL will only be set to "somepackage1 somepack=
age2"=20
since the value is already set by the time it gets to the ?=3D. This is=
 clearly=20
not what you would want by using +=3D.

Doing the following in an image recipe will work properly however:

-------- snip -------
inherit core-image

IMAGE_INSTALL +=3D "somepackage1 somepackage2"
-------- snip -------

Personally I think the text you quoted from the manual should be adjust=
ed;=20
there's nothing wrong with IMAGE_INSTALL +=3D _in an image recipe_ prov=
ided that=20
you do it _after_ the inherit of core-image.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre



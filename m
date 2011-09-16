Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1R4YSh-0001ja-2w
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 15:28:12 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 16 Sep 2011 06:22:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,393,1312182000"; d="scan'208";a="54459829"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by fmsmga002.fm.intel.com with ESMTP; 16 Sep 2011 06:22:56 -0700
Received: from pgsmsx102.gar.corp.intel.com (10.221.44.80) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 16 Sep 2011 21:22:56 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX102.gar.corp.intel.com (10.221.44.80) with Microsoft SMTP Server
	(TLS) id 14.1.323.3; Fri, 16 Sep 2011 21:22:55 +0800
Received: from shsmsx501.ccr.corp.intel.com ([10.239.4.141]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Fri, 16 Sep 2011 21:22:54 +0800
From: "Xu, Dongxiao" <dongxiao.xu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, Mark Hatle <mark.hatle@windriver.com>
Date: Fri, 16 Sep 2011 21:22:52 +0800
Thread-Topic: Multilib status
Thread-Index: Acx0U43ghLifgdTUTpOZqlYt+SlgWgAFDjRQAALn4wA=
Message-ID: <D5AB6E638E5A3E4B8F4406B113A5A19A12D84DF2C7@shsmsx501.ccr.corp.intel.com>
References: <1316165543.25993.59.camel@ted>
	<D5AB6E638E5A3E4B8F4406B113A5A19A12D84DF2AF@shsmsx501.ccr.corp.intel.com>
In-Reply-To: <D5AB6E638E5A3E4B8F4406B113A5A19A12D84DF2AF@shsmsx501.ccr.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: Multilib status
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
X-List-Received-Date: Fri, 16 Sep 2011 13:28:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Richard and Mark,

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Xu, Dongxiao
> Sent: Friday, September 16, 2011 8:01 PM
> To: Richard Purdie; Mark Hatle
> Cc: openembedded-core
> Subject: Re: [OE-core] Multilib status
>=20
> Hi Richard and Mark,
>=20
> > -----Original Message-----
> > From: Richard Purdie [mailto:richard.purdie@linuxfoundation.org]
> > Sent: Friday, September 16, 2011 5:32 PM
> > To: Mark Hatle
> > Cc: Xu, Dongxiao; openembedded-core
> > Subject: Multilib status
> >
> > Hi Mark/Dongxaio,
> >
> > We really need to get the remainder of the multilib bugs wrapped up. I
> > think there is some confusion about the exact approach to take to fix
> > some of them so I'm hoping to try and summarise the problems here so
> > we can work out some resolutions.
> >
> > Problem A
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > We can have multiple forms of "machine specific" packages now, one for
> > each multilib e.g.:
> >
> > task-core-x11-base-1.0-r34.qemux86_64.rpm ("normal")
> > task-core-x11-base-1.0-r34.qemux86_64.rpm ("lib64")
> > task-core-x11-base-1.0-r34.qemux86_64.rpm ("lib32")
> >
> > (lets assume the first uses /lib/, the second /lib64/ and the thrid
> > /lib32/, an artificial example I realise)
> >
> > I know one proposal was to map:
> >
> > task-core-x11-base-1.0-r34.lib32_qemux86_64.rpm to
> > task-core-x11-base-1.0-r34.lib32_qemux86.rpm but this isn't correct
> > since the library directories are different. In this specific case it
> > might not matter but in general it would. What is also important is
> > that the different versions imply different dependencies. The lib64
> > bit version would pull in and select lib64 bit libs. Its these
> > dependencies which are a key reason these are not "all" arch packages.
> >
> > The end result is therefore we likely want:
> >
> > task-core-x11-base-1.0-r34.qemux86_64.rpm
> > task-core-x11-base-1.0-r34.lib64_qemux86_64.rpm
> > task-core-x11-base-1.0-r34.lib32_qemux86_64.rpm
> >
> > and I believe there are some patches Dongxiao has created which do this=
.
> >
> > Problem B
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > If we install task-core-x11-base-1.0-r34.qemux86_64.rpm which depends
> > on "connman", how does the system figure out to associate this to mean
> > we want the "x86_64" architecture packages installed?
> >
> > As far as I can tell there are two proposals around:
> >
> > 1) Set the architecture in the package provides and depends (a bit
> > ugly)
> >
> > 2) Configure libzypp to understand that qemux86_64 does really map to
> > x86_64 architecture and imply x86_64 dependencies.
>=20
> In our current rootfs_rpm logic, we don't use zypper tool to make the fil=
e
> system, what we use is pure rpm plus db.
> I am not sure whether the rpm database or sat-solver has such kind of bin=
dings
> between different repo folders? (like qemux86_64 and x86_64)

I updated my branch at:
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Ddxu4/ml4

Patch 1/3 is to solve the Problem B by approach 1) that Richard mentioned.
Patch 2/3 is to solve the Problem A which defines a new architecture (lib32=
_qemux86_64) when PACKAGE_ARCH =3D=3D MACHINE_ARCH.
Patch 3/3 is to install MULTILIB_IMAGE_INSTALL packages into final image.

Thanks,
Dongxiao

>=20
> Thanks,
> Dongxiao
>=20
> >
> > Solving problem A above is the first step towards resolving this
> > either way but we don't seem to have a resolution on this second part.
> >
> > For reference, we really do want these task packages to have an
> > associated architecture so the user can easily build up blocks of the
> > system using a given ABI.
> >
> >
> >
> > What I really need now is an idea of which patches you both agree on
> > that we need to merge (I think we have some for problem A) and a
> > resolution on problem B along with some patches so we can close this se=
t of
> issues out.
> >
> > If there are further issues can you reply to this email either with
> > the details or a pointer to the specific additional problems.
> >
> > Cheers,
> >
> > Richard
> >
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



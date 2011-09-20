Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1R6AA2-0006kN-Kz
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 01:55:35 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 Sep 2011 16:50:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="50501485"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by orsmga001.jf.intel.com with ESMTP; 20 Sep 2011 16:50:10 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 21 Sep 2011 07:50:08 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 21 Sep 2011 07:50:07 +0800
Received: from shsmsx501.ccr.corp.intel.com ([10.239.4.141]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Wed, 21 Sep 2011 07:49:29 +0800
From: "Xu, Dongxiao" <dongxiao.xu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 21 Sep 2011 07:49:27 +0800
Thread-Topic: [OE-core] [PATCH 1/7] rootfs_rpm: Use specific MACHINE_ARCH
	for multilib recipes
Thread-Index: Acx333H65bGB2j6IRKS4Q2yJREkRpAAEEypA
Message-ID: <D5AB6E638E5A3E4B8F4406B113A5A19A12D859E3AF@shsmsx501.ccr.corp.intel.com>
References: <cover.1316553828.git.mark.hatle@windriver.com>
	<2539230a1b1e941f43d6b6b3b686d90dac900410.1316553828.git.mark.hatle@windriver.com>
	<1316555432.14488.88.camel@ted>
In-Reply-To: <1316555432.14488.88.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 1/7] rootfs_rpm: Use specific MACHINE_ARCH for multilib recipes
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
X-List-Received-Date: Tue, 20 Sep 2011 23:55:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Richard and Mark,

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Richard Purdie
> Sent: Wednesday, September 21, 2011 5:50 AM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 1/7] rootfs_rpm: Use specific MACHINE_ARCH
> for multilib recipes
>=20
> On Tue, 2011-09-20 at 16:33 -0500, Mark Hatle wrote:
> > From: Dongxiao Xu <dongxiao.xu@intel.com>
> >
> > Currently MACHINE_ARCH deploy folder is unique in multilib system,
> > thus a lib32 version of rpm package will override a normal rpm package
> > if its PACKAGE_ARCH is ${MACHINE_ARCH}.
> >
> > Take netbase as an example, which the PACKAGE_ARCH =3D MACHINE_ARCH.
> > Both the normal version of netbase package and the lib32 version are
> > named as "netbase-4.45-r1.qemux86_64.rpm" putting in
> > tmp/deploy/rpm/qemux86-64 directory, so we need to differentiate them.
> >
> > Here we define spedific MACHINE_virtclass-multilib-lib(xx) to override
> > the default MACHINE value, thus got different MACHINE_ARCH to fix this
> > issue.
>=20
> We simply *cannot* do this and this patch cannot be merged. I thought I'd
> explained this once but I will try and do so again.
>=20
> The problem is MACHINE specific packages can have generic content. They
> may have binaries, libraries or other things contained within them. Lets
> assume we have a strange system which has files in /lib, /lib32 and /lib6=
4. We
> need the following permutations:
>=20
> qemux86 /lib
> qemux86 /lib64
> qemux86 /lib32
>=20
> and these are not equal to:
>=20
> qemux86_64 /lib
> qemux86_64 /lib64
> qemux86_64 /lib32
>=20
> which may or may not have different contents or different optimisations
> applied to the binaries/libraries contained within.
>=20
> You are trying to take a shortcut here and cross link these two sets and =
that
> doesn't scale to generic combinations.
>=20
> Furthermore, MACHINE is meant to be consistent within a given build and
> changing MACHINE for different multilibs will have all kinds of unintende=
d
> consequences (such as the cache file location changing for different reci=
pes).
>=20
> Wasn't there an alternative proposal from Dongxiao that added MLPREFIX to
> MACHINE_ARCH and resolved this issue that way instead? I know that causes
> issues at the package management level but I think we're going to have to=
 run
> with that approach and resolve any issues it leads to...

I have an updated commit in http://git.yoctoproject.org/cgit/cgit.cgi/poky-=
contrib/commit/?h=3Ddxu4/ml4&id=3D6b2ed895e25bf6d76cc362c87661fd66231c4b4a

You can cherry-pick that to your pull request.

Thanks,
Dongxiao

>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



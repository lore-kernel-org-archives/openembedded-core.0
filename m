Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1R38Bh-0005wa-Hi
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Sep 2011 17:12:45 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 Sep 2011 08:07:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="47390076"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by orsmga002.jf.intel.com with ESMTP; 12 Sep 2011 08:07:35 -0700
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Mon, 12 Sep 2011 23:07:35 +0800
Received: from shsmsx501.ccr.corp.intel.com ([10.239.4.141]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Mon, 12 Sep 2011 23:07:34 +0800
From: "Xu, Dongxiao" <dongxiao.xu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 12 Sep 2011 23:07:32 +0800
Thread-Topic: [OE-core] [PATCH 2/3] rpm: add multilib prefix for archs under
	deploy/rpm
Thread-Index: AcxxXDC0Ly5t1N8BSniMZ/5T18oOxAAASAAg
Message-ID: <D5AB6E638E5A3E4B8F4406B113A5A19A12D754AE15@shsmsx501.ccr.corp.intel.com>
References: <cover.1315815933.git.dongxiao.xu@intel.com>
	<57947e84078c2fbd1dde287bd9910cfd95e2ea27.1315815933.git.dongxiao.xu@intel.com>
	<4E6E1D79.80208@windriver.com>
In-Reply-To: <4E6E1D79.80208@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] rpm: add multilib prefix for archs under deploy/rpm
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
X-List-Received-Date: Mon, 12 Sep 2011 15:12:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Mark Hatle
> Sent: Monday, September 12, 2011 10:56 PM
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 2/3] rpm: add multilib prefix for archs und=
er
> deploy/rpm
>=20
> On 9/12/11 3:34 AM, Dongxiao Xu wrote:
> > Currently MACHINE_ARCH deploy folder is unique in multilib system,
> > thus a lib32 version of rpm package will override a normal rpm package
> > if its PACKAGE_ARCH is ${MACHINE_ARCH}.
> >
> > Define different deploy folder for multilib architectures to avoid the
> > confliction.
>=20
> I'm not sure I understand here.  Within the deployment directory is a set=
 of
> directories for each RPM architecture.  Are you saying that we can get tw=
o
> packages that have different contents but the same RPM architecture?
>=20

Yes, for example the netbase recipe, which the PACKAGE_ARCH =3D MACHINE_ARC=
H. Both the normal version of netbase package and the lib32 version are nam=
ed as "netbase-4.45-r1.qemux86_64.rpm" putting in tmp/deploy/rpm/qemux86-64=
 directory, so we need to differentiate them.

Thanks,
Dongxiao

> Can you give me an example of what is going wrong?
>=20
> --Mark
>=20
> > Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> > ---
> >  meta/classes/multilib.bbclass   |    5 +++++
> >  meta/classes/rootfs_rpm.bbclass |    4 +++-
> >  2 files changed, 8 insertions(+), 1 deletions(-)
> >
> > diff --git a/meta/classes/multilib.bbclass
> > b/meta/classes/multilib.bbclass index 76c86b2..6ace1fe 100644
> > --- a/meta/classes/multilib.bbclass
> > +++ b/meta/classes/multilib.bbclass
> > @@ -77,4 +77,9 @@ python __anonymous () {
> >      multilib_map_variable("PACKAGES_DYNAMIC", variant, d)
> >      multilib_map_variable("PACKAGE_INSTALL", variant, d)
> >      multilib_map_variable("INITSCRIPT_PACKAGES", variant, d)
> > +
> > +    package_arch =3D d.getVar("PACKAGE_ARCH", True)
> > +    machine_arch =3D d.getVar("MACHINE_ARCH", True)
> > +    if package_arch =3D=3D machine_arch:
> > +        d.setVar("PACKAGE_ARCH", variant + "_" + package_arch)
> >  }
> > diff --git a/meta/classes/rootfs_rpm.bbclass
> > b/meta/classes/rootfs_rpm.bbclass index 135ca75..7936d77 100644
> > --- a/meta/classes/rootfs_rpm.bbclass
> > +++ b/meta/classes/rootfs_rpm.bbclass
> > @@ -218,7 +218,9 @@ python () {
> >              default_tune =3D
> localdata.getVar("DEFAULTTUNE_virtclass-multilib-" + eext[1], False)
> >              if default_tune:
> >                  localdata.setVar("DEFAULTTUNE", default_tune)
> > -            ml_package_archs +=3D localdata.getVar("PACKAGE_ARCHS",
> True) or ""
> > +            localdata.setVar("MACHINE_ARCH", eext[1] + "_" +
> localdata.getVar("MACHINE_ARCH", False))
> > +            package_archs =3D localdata.getVar("PACKAGE_ARCHS", True)
> or ""
> > +            ml_package_archs +=3D " " + package_archs
> >              #bb.note("ML_PACKAGE_ARCHS %s %s %s" % (eext[1],
> localdata.getVar("PACKAGE_ARCHS", True) or "(none)", overrides))
> >      bb.data.setVar('MULTILIB_PACKAGE_ARCHS', ml_package_archs,
> d)  }
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



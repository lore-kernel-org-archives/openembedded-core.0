Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1Qon4O-0001Qa-1o
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 03:49:56 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 03 Aug 2011 18:45:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,313,1309762800"; d="scan'208";a="34926669"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by azsmga001.ch.intel.com with ESMTP; 03 Aug 2011 18:45:31 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 4 Aug 2011 09:45:00 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 4 Aug 2011 09:45:00 +0800
Received: from shsmsx501.ccr.corp.intel.com ([10.239.4.141]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi; Thu, 4 Aug 2011
	09:44:59 +0800
From: "Xu, Dongxiao" <dongxiao.xu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 4 Aug 2011 09:44:58 +0800
Thread-Topic: [OE-core] [PATCH 6/7] package_rpm: fix strip_multilib function
Thread-Index: AcxR84v2jtoAJcvBRMq6yefo/Uh1wAAU9b4A
Message-ID: <D5AB6E638E5A3E4B8F4406B113A5A19A12D7029D94@shsmsx501.ccr.corp.intel.com>
References: <cover.1312384552.git.dongxiao.xu@intel.com>
	<a59303a5b3249096635224817a6b20c828277132.1312384552.git.dongxiao.xu@intel.com>
	<4E396B8D.9060806@windriver.com>
In-Reply-To: <4E396B8D.9060806@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 6/7] package_rpm: fix strip_multilib function
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
X-List-Received-Date: Thu, 04 Aug 2011 01:49:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Mark Hatle
> Sent: Wednesday, August 03, 2011 11:39 PM
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 6/7] package_rpm: fix strip_multilib functi=
on
>=20
> On 8/3/11 10:19 AM, Dongxiao Xu wrote:
> > The previous logic could only strip MLPREFIX from the first element in
> > an array, take an example, strip_multilib the [lib32-a lib32-b
> > lib32-c] will result in [a lib32-b lib32-c]. This commit change it to
> > strip all elements' multilib prefix.
> >
> > CC: Mark Hatle <mark.hatle@windriver.com>
> > Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> > ---
> >  meta/classes/package_rpm.bbclass |    4 ++--
> >  1 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/classes/package_rpm.bbclass
> > b/meta/classes/package_rpm.bbclass
> > index 9d0eeba..a29ce9d 100644
> > --- a/meta/classes/package_rpm.bbclass
> > +++ b/meta/classes/package_rpm.bbclass
> > @@ -326,7 +326,7 @@ python write_specfile () {
> >  		for ext in multilibs.split():
> >  			eext =3D ext.split(':')
> >  			if len(eext) > 1 and eext[0] =3D=3D 'multilib' and name and
> name.find(eext[1] + '-') =3D=3D 0:
> > -				name =3D (eext[1] + '-').join(name.split(eext[1] + '-', 1)[1:])
> > +				name =3D " ".join(name.split(eext[1] + '-')[1:])
>=20
> This looks incorrect to me, with the " ".join, it's going to join multipl=
e elements
> with a whitespace between them.  The original code was written to work on
> one item at a time within the list of multilibs.
>=20
> How well has this been tested?  Since I don't have all of the context thi=
s very
> well might be correct within the current scope of the multilib implementa=
tion.

The original usage for this strip_multilib() is in translate_vers() functio=
n, which strip the MLPREFIX one by one and then write the value back into v=
ariable "d".

As in the last patch (PATCH 7/7), we move strip_multilib() out of translate=
_vers() to fix the package rename issue we met in multilib.=20

Therefore for our new usage, we need it to remove MLPREFIX for all elements=
 in a list at one time, thus I changed its working style.

Thanks,
Dongxiao

>=20
> >  		return name
> >
> >  #		ml =3D bb.data.getVar("MLPREFIX", d, True)
> > @@ -720,7 +720,7 @@ python do_package_rpm () {
> >  	def strip_multilib(name, d):
> >  		ml =3D bb.data.getVar("MLPREFIX", d, True)
> >  		if ml and name and len(ml) !=3D 0 and name.find(ml) =3D=3D 0:
> > -			return ml.join(name.split(ml, 1)[1:])
> > +			return " ".join(name.split(ml)[1:])
> >  		return name
> >
> >  	workdir =3D bb.data.getVar('WORKDIR', d, True)
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



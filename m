Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QbMb3-0000Wh-8f
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 02:56:09 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 27 Jun 2011 17:52:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,435,1304319600"; d="scan'208";a="23589551"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by fmsmga001.fm.intel.com with ESMTP; 27 Jun 2011 17:52:26 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 28 Jun 2011 08:51:38 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 28 Jun 2011 08:51:38 +0800
Received: from shsmsx501.ccr.corp.intel.com ([10.239.4.141]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Tue, 28 Jun 2011 08:51:34 +0800
From: "Xu, Dongxiao" <dongxiao.xu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 28 Jun 2011 08:51:32 +0800
Thread-Topic: [OE-core] [PATCH 1/1] libc-locale: split locale handling from
	libc recipe.
Thread-Index: Acw0qVF2TNwtin+3QleV1q48UnLrswAg1V1g
Message-ID: <D5AB6E638E5A3E4B8F4406B113A5A19A12D6ADBBD3@shsmsx501.ccr.corp.intel.com>
References: <cover.1309163663.git.dongxiao.xu@intel.com>
	<cdd1860f64f84b58d18d1c6bed1805456d8d3e2e.1309163663.git.dongxiao.xu@intel.com>
	<1309165102.21613.234.camel@phil-desktop>
In-Reply-To: <1309165102.21613.234.camel@phil-desktop>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] libc-locale: split locale handling from libc recipe.
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
X-List-Received-Date: Tue, 28 Jun 2011 00:56:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Phil Blundell
> Sent: Monday, June 27, 2011 4:58 PM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 1/1] libc-locale: split locale handling fro=
m libc
> recipe.
>=20
> On Mon, 2011-06-27 at 16:37 +0800, Dongxiao Xu wrote:
> > -PACKAGES =3D "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX}
> nscd${PKGSUFFIX} ldd${PKGSUFFIX} localedef${PKGSUFFIX} libcidn ${PN}-util=
s
> ${PN}-pic ${PN}-dev eglibc-doc eglibc-locale libmemusage
> libsegfault${PKGSUFFIX} eglibc-extra-nss eglibc-thread-db${PKGSUFFIX}
> eglibc-pcprofile libsotruss${PKGSUFFIX}"
> > -
> > -PACKAGES_DYNAMIC =3D " \
> > -		    glibc-gconv-*${PKGSUFFIX} glibc-charmap-* glibc-localedata-*
> glibc-binary-localedata-* \
> > -		    eglibc-gconv-* eglibc-charmap-* eglibc-localedata-*
> eglibc-binary-localedata-* \
> > -		    locale-base-*${PKGSUFFIX}"
> > +PACKAGES =3D "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX}
> nscd${PKGSUFFIX} ldd${PKGSUFFIX} ${PN}-utils ${PN}-pic ${PN}-dev eglibc-d=
oc
> libcidn libmemusage libsegfault${PKGSUFFIX} eglibc-extra-nss
> eglibc-thread-db${PKGSUFFIX} eglibc-pcprofile"
>=20
> You seem to have made a bunch of changes here that are not related to loc=
ales.
> What are those about?

They are locale related changes.
Locale related stuffs in the above PACKAGES and PACKAGES_DYNAMIC are moved =
to eglibc-locale recipe.

>=20
> > -FILES_${PN}-dbg +=3D "${libexecdir}/*/.debug ${libdir}/gconv/.debug
> ${libdir}/audit/.debug"
> > +FILES_${PN}-dbg +=3D "${libexecdir}/*/.debug"
>=20
> Likewise.
>=20
> Also, why is localedef getting packaged by libc-locale?  Not that I think=
 it's
> necessarily a problem but it seems a little bit strange.

Originally I thought of putting all locale related things to eglibc-locale.
Now actually virtual/libiconv belongs to eglibc.
Thus I am OK to move localedef from eglibc-locale to eglibc, and will inclu=
de this in my next pull request.

Thanks,
Dongxiao

>=20
> p.
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



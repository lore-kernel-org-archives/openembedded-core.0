Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QrjfW-0006fD-OT
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 06:48:27 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Aug 2011 21:43:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,360,1309762800"; d="scan'208";a="37711183"
Received: from orsmsx602.amr.corp.intel.com ([10.22.226.211])
	by azsmga001.ch.intel.com with ESMTP; 11 Aug 2011 21:43:53 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx602.amr.corp.intel.com ([10.22.226.211]) with mapi;
	Thu, 11 Aug 2011 21:43:53 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Aug 2011 21:43:51 -0700
Thread-Topic: [OE-core] [PATCH] libc-package bbclass: fix binary localedata
	dependency code
Thread-Index: AcxXJLqMWsUVekLRR8C3SD+S2FaWwABhI90A
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94DEA22801@orsmsx504.amr.corp.intel.com>
References: <1312296431-18991-1-git-send-email-koen@dominion.thruhere.net>
	<C9D28EB1-CE86-42E9-9825-0A408698FD66@dominion.thruhere.net>
	<1312297317.4325.46.camel@phil-desktop>
	<AD653010-7DD2-4B79-8C80-326646464C00@dominion.thruhere.net>
In-Reply-To: <AD653010-7DD2-4B79-8C80-326646464C00@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH] libc-package bbclass: fix binary localedata dependency code
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
X-List-Received-Date: Fri, 12 Aug 2011 04:48:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Koen,
  Sorry for replying late, I am on vacation now. I looked at my commit 561d=
875404ef1783f94f37314b6e756766db8411, and from it I see that both eglibc & =
glibc package.bbclass has same lines=20
-               if m:
-                       eglibc_name =3D "%s.%s" % (m.group(1), m.group(2).l=
ower().replace("-",""))
-               else:
-                       eglibc_name =3D name
So I am not sure that this is the correct fix. I will look into it further =
and reply later.
Thanks,
Nitin

> -----Original Message-----
> From: Koen Kooi [mailto:koen@dominion.thruhere.net]
> Sent: Tuesday, August 09, 2011 11:14 PM
> To: Patches and discussions about the oe-core layer
> Cc: Kamble, Nitin A
> Subject: Re: [OE-core] [PATCH] libc-package bbclass: fix binary
> localedata dependency code
>=20
> Nitin, any insights on this?
>=20
> Op 2 aug. 2011, om 17:01 heeft Phil Blundell het volgende geschreven:
>=20
> > It does look a bit weird.  That code was introduced in 561d8754,
> > ostensibly as a merger of the eglibc and glibc equivalents.  But, the
> > original code from glibc-package.bbclass did:
> >
> >       def output_locale_binary_rdepends(name, pkgname, locale,
> encoding):
> >               m =3D re.match("(.*)\.(.*)", name)
> >               if m:
> >                       glibc_name =3D "%s.%s" % (m.group(1),
> m.group(2).lower().replace("-",""))
> >               else:
> >                       glibc_name =3D name
> >               bb.data.setVar('RDEPENDS_%s' % pkgname,
> legitimize_package_name('glibc-binary-localedata-%s' % glibc_name), d)
> >
> > ... i.e. it was using the "." separator both for splitting and
> joining,
> > which seems reasonable.  But somehow when it showed up in
> > libc-package.bbclass it had gotten transmogrified so that it split on
> > "_" but joined with "." as you showed below.  That seems bogus to me.
> >
> > p.
> >
> > On Tue, 2011-08-02 at 16:55 +0200, Koen Kooi wrote:
> >> The bug I was seeing was caused by something else, but I'd still
> like feedback on this patch to find out why the dot vs dash difference
> exists
> >>
> >> Op 2 aug. 2011, om 16:47 heeft Koen Kooi het volgende geschreven:
> >>
> >>> When using binary locales rootfs generation fails with:
> >>>
> >>> | Unknown package 'locale-base-en-us'.
> >>> | Collected errors:
> >>> |  * opkg_install_cmd: Cannot install package locale-base-en-us.
> >>>
> >>> This is due to:
> >>>
> >>> $ dpkg-deb -I ipk/armv7a/locale-base-en-us_2.12-r16_armv7a.ipk |
> grep Depends
> >>> Depends: eglibc-binary-localedata-en.us
> >>>
> >>> Note the '.' seperator
> >>>
> >>> $ ls ipk/armv7a/ | grep binary-localedata-en | grep us
> >>> eglibc-binary-localedata-en-us_2.12-r16_armv7a.ipk
> >>>
> >>> Note the '-' seperator vs the '.' in the locale-base packages.
> >>>
> >>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> >>> ---
> >>> meta/classes/libc-package.bbclass |    2 +-
> >>> 1 files changed, 1 insertions(+), 1 deletions(-)
> >>>
> >>> diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-
> package.bbclass
> >>> index de57230..67d08c0 100644
> >>> --- a/meta/classes/libc-package.bbclass
> >>> +++ b/meta/classes/libc-package.bbclass
> >>> @@ -243,7 +243,7 @@ python package_do_split_gconvs () {
> >>> 	def output_locale_binary_rdepends(name, pkgname, locale,
> encoding):
> >>> 		m =3D re.match("(.*)_(.*)", name)
> >>> 		if m:
> >>> -			libc_name =3D "%s.%s" % (m.group(1),
> m.group(2).lower().replace("-",""))
> >>> +			libc_name =3D "%s-%s" % (m.group(1),
> m.group(2).lower().replace("-",""))
> >>> 		else:
> >>> 			libc_name =3D name
> >>> 		bb.data.setVar('RDEPENDS_%s' % pkgname,
> legitimize_package_name('%s-binary-localedata-%s' \
> >>> --
> >>> 1.6.6.1
> >>>
> >>
> >>
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-
> core
> >
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




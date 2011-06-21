Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QYpxI-00005c-MN
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 03:40:40 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 20 Jun 2011 18:37:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,397,1304319600"; d="scan'208";a="16176613"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by orsmga002.jf.intel.com with ESMTP; 20 Jun 2011 18:37:06 -0700
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 21 Jun 2011 09:36:08 +0800
Received: from shsmsx501.ccr.corp.intel.com ([10.239.4.141]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Tue, 21 Jun 2011 09:36:07 +0800
From: "Xu, Dongxiao" <dongxiao.xu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 21 Jun 2011 09:36:06 +0800
Thread-Topic: [OE-core] [PATCH 1/6] connman: Upgrade to version 0.75
Thread-Index: AcwsvmoWts5qiF4mQOGS6DIaGddIdwC8VOJg
Message-ID: <D5AB6E638E5A3E4B8F4406B113A5A19A12D67228C9@shsmsx501.ccr.corp.intel.com>
References: <cover.1308215406.git.dongxiao.xu@intel.com>
	<f590848e2802c1ecd7faedb6f695b8b5203c7aa8.1308215406.git.dongxiao.xu@intel.com>
	<1308216925.25285.4101.camel@phil-desktop>	<4DFA08A2.3010504@gmail.com>
	<ED0EBCC5-D086-4F71-AC7A-F733111C4B6D@dominion.thruhere.net>
	<4DFA8DF5.90401@gmail.com>
	<D5AB6E638E5A3E4B8F4406B113A5A19A12D6721E4B@shsmsx501.ccr.corp.intel.com>
	<E855E3E1-94D9-4EB0-9423-0F3F0F09268D@dominion.thruhere.net>
In-Reply-To: <E855E3E1-94D9-4EB0-9423-0F3F0F09268D@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Cc: "Koen Kooi \(koen@dominion.thruhere.net\)" <koen@dominion.thruhere.net>
Subject: Re: [PATCH 1/6] connman: Upgrade to version 0.75
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
X-List-Received-Date: Tue, 21 Jun 2011 01:40:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Koen,

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Koen Kooi
> Sent: Friday, June 17, 2011 3:15 PM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 1/6] connman: Upgrade to version 0.75
>=20
>=20
> Op 17 jun 2011, om 09:08 heeft Xu, Dongxiao het volgende geschreven:
> >
> >>>>>
> >>>>
> >>>> I would say put ofono as a DISTRO_FEATURE
> >>>
> >>> You don't need to build ofono to have ofono support in connman.
> >>> Angstrom (and hence meta-oe) build with it enabled by default to
> >>> support people who want to use the plugin on their phones. Since
> >>> it's a nicely seperated plugin,
> >
> > Do you mean connman-plugin-ofono could work correctly without the ofono
> recipe?
> > According to my understanding, connman-plugin-ofono controls the teleph=
ony
> device by talking with ofonod daemon through dbus mechanism.
> > On another aspect, ofono project has support for different types of mod=
ems,
> and I don't think connman-plugin-ofono has the ability.
> > Therefore I think the ofono recipe is needed.
>=20
> I'm saying that ofono is not a *build* dependency for the connman-ofono
> plugin.

Yes we don't need ofono to build connman or connman-plugin-ofono, but we ne=
ed to assign ofono as RDEPENDS of connman-plugin-ofono by the following log=
ic:

python populate_packages_prepend() {
        depmap =3D dict( wifi=3D"wpa-supplicant", resolvconf=3D"resolvconf"=
, bluetooth=3D"bluez4", ofono=3D"ofono" )
        packages =3D []
        hook =3D lambda file,pkg,b,c,d:packages.append((file,pkg))

        plugin_dir =3D bb.data.expand('${libdir}/connman/plugins/', d)
        plugin_name =3D bb.data.expand('${PN}-plugin-%s', d)

        do_split_packages(d, plugin_dir, '^(.*).so$', plugin_name, '${PN} p=
lugin for %s', extra_depends=3D'', hook=3Dhook )

        for (file, package) in packages:
                plugintype =3D package.split( '-' )[-1]
                if plugintype in depmap:
                        bb.note( "Adding rdependency on %s to package %s" %=
 ( depmap[plugintype], package ) )
                        bb.data.setVar("RDEPENDS_%s" % package, depmap[plug=
intype], d)
}

Since we didn't assign ofono as any direct build/runtime dependency of conn=
man. Therefore we will face a problem that, while doing rootfs, ofono is no=
t built out while connman-plugin-ofono has runtime dependency on it, and it=
 will cause do_rootfs error.

I saw in meta-oe, there are following lines, I understand it as a workaroun=
d to handle the late added rdepends.

# we need to define the depends here, the dynamic stuff is too late
DEPENDS  =3D "libnl wpa-supplicant dbus glib-2.0 ppp busybox dhcp resolvcon=
f bluez4 iptables gnutls ntp"

Therefore I think we also need to add ofono in the DEPENDS line to solve ou=
r problem.

Thanks,
Dongxiao


>=20
> regards,
>=20
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



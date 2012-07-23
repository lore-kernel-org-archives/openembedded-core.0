Received: from smtp1.ingenico.com ([217.108.148.240])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Matthieu.CRAPET@ingenico.com>) id 1StDCJ-00086X-NG
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 09:36:55 +0200
X-IronPort-AV: E=Sophos;i="4.77,638,1336341600"; d="scan'208";a="13379700"
Received: from frsnprexc1.usr.ingenico.loc ([10.23.2.11])
	by antispam1.usr.ingenico.loc with ESMTP; 23 Jul 2012 09:25:31 +0200
x-mimeole: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Mon, 23 Jul 2012 09:25:29 +0200
Message-ID: <D9D7124626ED1E43963D86B2657D5CCD03A17EB3@FRSNPREXC1.usr.ingenico.loc>
In-Reply-To: <1343027945.21788.81.camel@ted>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [OE-core] Broken gettext/gdbm
Thread-Index: Ac1oo3pZdwmfLRuORwaGhaUE7x+F0wAAK0XA
References: <D9D7124626ED1E43963D86B2657D5CCD03A17BC8@FRSNPREXC1.usr.ingenico.loc><1342796791.21788.30.camel@ted><D9D7124626ED1E43963D86B2657D5CCD03A17E72@FRSNPREXC1.usr.ingenico.loc>
	<1343027945.21788.81.camel@ted>
From: "Matthieu CRAPET" <Matthieu.CRAPET@ingenico.com>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Broken gettext/gdbm
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
X-List-Received-Date: Mon, 23 Jul 2012 07:36:55 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

PREFERRED_PROVIDER_virtual/gettext =3D "gettext" fixes the issue!

So something is wrong with proxy-libintl.
Thanks for help!

Regards,
Matthieu


-----Message d'origine-----
De=A0: openembedded-core-bounces@lists.openembedded.org =
[mailto:openembedded-core-bounces@lists.openembedded.org] De la part de =
Richard Purdie
Envoy=E9=A0: lundi 23 juillet 2012 09:19
=C0=A0: Patches and discussions about the oe-core layer
Objet=A0: Re: [OE-core] Broken gettext/gdbm

On Mon, 2012-07-23 at 08:50 +0200, Matthieu CRAPET wrote:
> Hi,
>=20
> $ bitbake gdbm -e | grep ^DEPENDS
> DEPENDS_GETTEXT=3D"virtual/gettext gettext-native"
> DEPENDS=3D"autoconf-native automake-native libtool-native =
libtool-cross gnu-config-native virtual/gettext gettext-native  =
virtual/arm-ingenico-linux-gnueabi-gcc =
virtual/arm-ingenico-linux-gnueabi-compilerlibs virtual/libc"
>=20
> $ bitbake gettext -e | grep ^DEPENDS
> DEPENDS_virtclass-native=3D"libxml2-native gettext-minimal-native"
> DEPENDS=3D"autoconf-native automake-native libtool-native =
libtool-cross gnu-config-native  virtual/arm-ingenico-linux-gnueabi-gcc =
virtual/arm-ingenico-linux-gnueabi-compilerlibs virtual/libc  =
libxml2-native gettext-native virtual/libiconv ncurses expat"
>=20
> Note: We are using our own external toolchain.

That is an important detail!

> I wasn't clear enough in my previous post. It appear to be a circular =
dependency.

A circular dependency on what?

> Since my update I have this log:
> NOTE: Resolving any missing task queue dependencies
> NOTE: multiple providers are available for virtual/gettext=20
> (proxy-libintl, gettext)
> NOTE: consider defining a PREFERRED_PROVIDER entry to match=20
> virtual/gettext

Have you tried setting:

PREFERRED_PROVIDER_virtual/gettext =3D "gettext"

?

> When I just try to build gettext, It wants to build gdbm.. which =
depends of gettext too.
>=20
> gettext-minimal-native doesn't have config.rpath, gettext-native has =
it.
>=20
> But config.rpath is taken from =
${STAGING_DATADIR}/gettext/config.rpath" and not =
${STAGING_DATADIR_NATIVE}/gettext/config.rpath".
> Patching "meta/classes/autotools.bbclass" would be a proper fix ?

No, that doesn't sound right.

I think the problem is that the system is thinking virtual/gettext is =
provided by proxy-libintl. Adding the line above should convince it =
otherwise and then things should work better.

Cheers,

Richard


_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



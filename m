Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mihai.prica@intel.com>) id 1UNmnW-0003LO-Uq
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 18:13:59 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 04 Apr 2013 08:56:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,410,1363158000"; d="scan'208";a="316941777"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by fmsmga002.fm.intel.com with ESMTP; 04 Apr 2013 08:56:44 -0700
Received: from irsmsx101.ger.corp.intel.com ([169.254.1.73]) by
	IRSMSX103.ger.corp.intel.com ([169.254.3.198]) with mapi id
	14.01.0355.002; Thu, 4 Apr 2013 16:56:42 +0100
From: "Prica, Mihai" <mihai.prica@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH V3] qemu: Enabled SDL when compiling for
	target architecture
Thread-Index: AQHOMS0cfZKP7fIzMEC8ciflCsoAG5jGFtEAgAAcB7A=
Date: Thu, 4 Apr 2013 15:56:43 +0000
Message-ID: <97BD068FB200C44AA73C2B641F162ECF97E89B@IRSMSX101.ger.corp.intel.com>
References: <1365077355-17673-1-git-send-email-mihai.prica@intel.com>
	<E88E88F5-90AE-4280-AE38-735E593E6DC6@gmail.com>
In-Reply-To: <E88E88F5-90AE-4280-AE38-735E593E6DC6@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] qemu: Enabled SDL when compiling for target architecture
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
X-List-Received-Date: Thu, 04 Apr 2013 16:14:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Khem Raj [mailto:raj.khem@gmail.com]
> Sent: Thursday, April 04, 2013 5:59 PM
> To: Prica, Mihai
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH V3] qemu: Enabled SDL when compiling for ta=
rget
> architecture
>=20
>=20
> On Apr 4, 2013, at 5:09 AM, Mihai Prica <mihai.prica@intel.com> wrote:
>=20
> > Enables qemu to run images with video output without the need for vncvi=
ewer.
> >
> > Signed-off-by: Mihai Prica <mihai.prica@intel.com>
> > ---
> > meta/recipes-devtools/qemu/qemu.inc |    4 ++--
> > 1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/qemu/qemu.inc
> > b/meta/recipes-devtools/qemu/qemu.inc
> > index 1b5b569..06fa88b 100644
> > --- a/meta/recipes-devtools/qemu/qemu.inc
> > +++ b/meta/recipes-devtools/qemu/qemu.inc
> > @@ -1,7 +1,7 @@
> > DESCRIPTION =3D "open source processor emulator"
> > HOMEPAGE =3D "http://qemu.org"
> > LICENSE =3D "GPLv2 & LGPLv2.1"
> > -DEPENDS =3D "glib-2.0 zlib alsa-lib virtual/libx11 pixman dtc"
> > +DEPENDS =3D "glib-2.0 zlib alsa-lib virtual/libx11 pixman dtc libsdl"
> > DEPENDS_class-native =3D "zlib-native alsa-lib-native glib-2.0-native p=
ixman-
> native dtc-native"
> > DEPENDS_class-nativesdk =3D "nativesdk-zlib nativesdk-libsdl nativesdk-=
glib-2.0
> nativesdk-pixman nativesdk-dtc"
> > RDEPENDS_${PN}_class-nativesdk =3D "nativesdk-libsdl"
> > @@ -13,7 +13,7 @@ BBCLASSEXTEND =3D "native nativesdk"
> > # QEMU_TARGETS is overridable variable QEMU_TARGETS ?=3D "arm i386 mips
> > mipsel mips64 mips64el ppc sh4 x86_64"
> >
> > -SDL ?=3D "--disable-sdl"
> > +SDL ?=3D ""
>=20
> I think this is not acceptable change. Since many systems are headless an=
d its
> useless for them secondly, converting this to PACKAGECONFIG and keeping t=
he
> behavior as it was would be fine.

I sent a patch to meta-virtualization that just enabled SDL using a bbappen=
d and the
maintainers said I should to integrate this into poky. I talked with Richar=
d and he=20
said I should use a PACKAGECONFIG and enable sdl by default for the target.=
 For=20
headless images the user can disable it. I sent a V2 with this solution. Sa=
ul replied=20
and told me there are some problems with this approach and I should stick w=
ith the
SDL variable.

>=20
>=20
> > SDL_class-native ?=3D ""
> > SDL_class-nativesdk ?=3D ""
> >
> > --
> > 1.7.9.5
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mihai.prica@intel.com>) id 1U3q0i-00006q-6N
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 16:37:16 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 08 Feb 2013 07:20:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,630,1355126400"; d="scan'208";a="282713010"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by orsmga002.jf.intel.com with ESMTP; 08 Feb 2013 07:19:59 -0800
Received: from irsmsx101.ger.corp.intel.com ([169.254.1.60]) by
	IRSMSX102.ger.corp.intel.com ([169.254.2.82]) with mapi id
	14.01.0355.002; Fri, 8 Feb 2013 15:19:58 +0000
From: "Prica, Mihai" <mihai.prica@intel.com>
To: Saul Wold <sgw@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] qemu: Enabled SDL when compiling for target
	architecture
Thread-Index: AQHOBGNASBXwVwAgt0ex0PVNsndwfphtGYgAgABVLXCAAjv0gIAAYtTg
Date: Fri, 8 Feb 2013 15:19:57 +0000
Message-ID: <97BD068FB200C44AA73C2B641F162ECF91D995@IRSMSX101.ger.corp.intel.com>
References: <1360152734-15731-1-git-send-email-mihai.prica@intel.com>
	<511295B8.40109@linux.intel.com>
	<97BD068FB200C44AA73C2B641F162ECF91CC88@IRSMSX101.ger.corp.intel.com>
	<5114BCF5.8090103@linux.intel.com>
In-Reply-To: <5114BCF5.8090103@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: Enabled SDL when compiling for target architecture
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
X-List-Received-Date: Fri, 08 Feb 2013 15:37:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Saul Wold [mailto:sgw@linux.intel.com]
>=20
> On 02/06/2013 02:58 PM, Prica, Mihai wrote:
> >> -----Original Message-----
> >> From: Saul Wold [mailto:sgw@linux.intel.com]
> >> Sent: Wednesday, February 06, 2013 7:41 PM
> >> To: Prica, Mihai
> >> Cc: openembedded-core@lists.openembedded.org
> >> Subject: Re: [OE-core] [PATCH] qemu: Enabled SDL when compiling for
> >> target architecture
> >>
> >> On 02/06/2013 04:12 AM, Mihai Prica wrote:
> >>> - enables qemu to run images with video output without the need for
> >> vncviewer.
> >>> - SDLPACKAGECONFIG is used because there is no need for the
> >>> native-libsdl package when building the qemu-native package.
> >>>
> >>> Signed-off-by: Mihai Prica <mihai.prica@intel.com>
> >>> ---
> >>>    meta/recipes-devtools/qemu/qemu.inc |   19 +++++++++++--------
> >>>    1 file changed, 11 insertions(+), 8 deletions(-)
> >>>
> >>> diff --git a/meta/recipes-devtools/qemu/qemu.inc
> >>> b/meta/recipes-devtools/qemu/qemu.inc
> >>> index 2b60347..4633f47 100644
> >>> --- a/meta/recipes-devtools/qemu/qemu.inc
> >>> +++ b/meta/recipes-devtools/qemu/qemu.inc
> >>> @@ -3,8 +3,7 @@ HOMEPAGE =3D "http://qemu.org"
> >>>    LICENSE =3D "GPLv2 & LGPLv2.1"
> >>>    DEPENDS =3D "glib-2.0 zlib alsa-lib virtual/libx11 pixman"
> >>>    DEPENDS_class-native =3D "zlib-native alsa-lib-native
> >>> glib-2.0-native pixman-
> >> native"
> >>> -DEPENDS_class-nativesdk =3D "nativesdk-zlib nativesdk-libsdl
> >>> nativesdk-glib-2.0
> >> nativesdk-pixman"
> >>> -RDEPENDS_${PN}_class-nativesdk =3D "nativesdk-libsdl"
> >>> +DEPENDS_class-nativesdk =3D "nativesdk-zlib nativesdk-glib-2.0
> >>> +nativesdk-
> >> pixman"
> >>>
> >>>    require qemu-targets.inc
> >>>    inherit autotools
> >>> @@ -13,10 +12,6 @@ BBCLASSEXTEND =3D "native nativesdk"
> >>>    # QEMU_TARGETS is overridable variable
> >>>    QEMU_TARGETS ?=3D "arm i386 mips mipsel mips64 mips64el ppc sh4 x8=
6_64"
> >>>
> >>> -SDL ?=3D "--disable-sdl"
> >>> -SDL_class-native ?=3D ""
> >>> -SDL_class-nativesdk ?=3D ""
> >>> -
> >>>    SRC_URI =3D "\
> >>>        file://powerpc_rom.bin \
> >>>        file://no-strip.patch \
> >>> @@ -32,7 +27,7 @@ SRC_URI_append_class-nativesdk =3D "\
> >>>        file://relocatable_sdk.patch \
> >>>        "
> >>>
> >>> -EXTRA_OECONF +=3D "--target-list=3D${@get_qemu_target_list(d)}
> >>> --disable-
> >> werror --disable-vnc-tls --audio-drv-list=3Doss,alsa
> >> --audio-card-list=3Dac97,es1370 ${SDL} --disable-curl --disable-vnc-jp=
eg --
> disable-bluez --with-system-pixman"
> >>> +EXTRA_OECONF +=3D "--target-list=3D${@get_qemu_target_list(d)}
> >>> +--disable-
> >> werror --disable-vnc-tls --audio-drv-list=3Doss,alsa
> >> --audio-card-list=3Dac97,es1370 -- disable-curl --disable-vnc-jpeg --d=
isable-bluez
> --with-system-pixman"
> >>>
> >>>    EXTRA_OECONF_class-nativesdk =3D
> >>> "--target-list=3D${@get_qemu_target_list(d)}
> >> --disable-werror --disable-vnc-tls \
> >>>    				--disable-curl \
> >>> @@ -83,7 +78,15 @@ do_install_append() {
> >>>    }
> >>>    # END of qemu-mips workaround
> >>>
> >>> -PACKAGECONFIG ??=3D ""
> >> Seems to be left over from a previous patch?
> >
> > Yes, this was already here.
> >
> >>
> >>> +PACKAGECONFIG ??=3D "sdl"
> >>> +PACKAGECONFIG_class-native ??=3D "sdl"
> >> Is this right?  If you only want it for target, why set it for native.
> >
> > SDL was already enabled for native and nativesdk. I just enabled it
> > when building for the target arch.
> >
> Was it really?  I just did a build on my laptop and failed, I reverted th=
is patch and it
> worked, I think this needs some more thought and testing.
>=20
> I am running Fedora 18 with only SDL on my laptop, I get the following
> error:
> > | ERROR
> > | ERROR: User requested feature sdl
> > | ERROR: configure was not able to find it
>=20
> I think the above lines should be PACKAGECONFIG_class-native =3D "" and
> PACKAGECONFIG_class-nativesdk =3D "sdl"

Yes, you are right. The PACKAGECONFIG line should be like:

PACKAGECONFIG[sdl] =3D ",--disable-sdl,${SDLPACKAGECONFIG},${SDLPACKAGECONF=
IG}"

This way, it will install sdl for qemu-native only if it detects libsdl on =
the host. This was how=20
it was configured before my changes. I'll do some tests and send the V2.

>=20
>=20
>=20
> >>
> >>> +PACKAGECONFIG_class-nativesdk ??=3D "sdl"
> >>> +
> >>> +PACKAGECONFIG[sdl] =3D "--enable-sdl,--disable-
> >> sdl,${SDLPACKAGECONFIG},${SDLPACKAGECONFIG}"
> >>> +
> >> If it's disabled, you should not need the SDLPACKAGECONFIG in the
> >> "false" case for DEPENDS.
> >
> > I'm not sure if I understand your question. The second
> > SDLPACKAGECONFIG is for RDEPENDS when sdl is set in PACKAGECONFIG.
> >
> I think the issue is that you bring in the RDEPENDS for both the true and=
 false
> causes above, I think that's wrong upon further review.

The DPENDS and RDEPENDS get set only if the PACKAGECNFIG contains sdl.
I tested using bitbake -e and when PACKAGECONFIG is not set(""), nothing is=
 added to RDEPENDS.

Thanks,
Mihai

>=20
> Sau!
>=20
>=20
> >>
> >>> +SDLPACKAGECONFIG =3D "libsdl"
> >>> +SDLPACKAGECONFIG_class-native =3D ""
> >>> +SDLPACKAGECONFIG_class-nativesdk =3D "nativesdk-libsdl"
> >>>
> >> It might be clearer to have these lines above the PACKAGECONFIG[sdl]
> >> where they are used.
> >
> > I'll put the lines above the PACKAGECONFIG and resend the patch.
> >
> >>
> >>
> >>
> >>>    # Qemu target will not build in world build for ARM or Mips
> >>>    BROKEN_qemuarm =3D "1"
> >>>
> >
> >



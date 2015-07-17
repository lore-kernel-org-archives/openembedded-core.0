Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id B705465CBC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 12:24:02 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.1/8.15.1) with ESMTPS id t6HCNqAK009723
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Fri, 17 Jul 2015 14:23:52 +0200
Received: from DEFTHW99ERKMSX.ww902.siemens.net
	(defthw99erkmsx.ww902.siemens.net [139.22.70.147])
	by mail1.sbs.de (8.15.1/8.15.1) with ESMTPS id t6HCNTvX024836
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Fri, 17 Jul 2015 14:23:52 +0200
Received: from DENBGAT9ERDMSX.ww902.siemens.net (139.22.70.85) by
	DEFTHW99ERKMSX.ww902.siemens.net (139.22.70.147) with Microsoft SMTP
	Server (TLS) id 14.3.248.2; Fri, 17 Jul 2015 14:23:42 +0200
Received: from DEFTHW99EH4MSX.ww902.siemens.net ([169.254.2.90]) by
	DENBGAT9ERDMSX.ww902.siemens.net ([139.22.70.85]) with mapi id
	14.03.0248.002; Fri, 17 Jul 2015 14:23:41 +0200
From: "Bach, Pascal" <pascal.bach@siemens.com>
To: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] cmake.bbclass: set archiver, linker and
	ranlib in toolchain.cmake
Thread-Index: AQHQwH8+zZ+1oMHIgkeuo3fbtceBKZ3flQFA
Date: Fri, 17 Jul 2015 12:23:40 +0000
Message-ID: <355BE46A91031048906B695426A8D8E616C12A50@DEFTHW99EH4MSX.ww902.siemens.net>
References: <1437119073-4788-1-git-send-email-pascal.bach@siemens.com>
	<55A8DF58.4010906@herbrechtsmeier.net>
In-Reply-To: <55A8DF58.4010906@herbrechtsmeier.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [139.22.70.44]
MIME-Version: 1.0
Subject: Re: [PATCH] cmake.bbclass: set archiver, linker and ranlib in toolchain.cmake
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Jul 2015 12:24:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi

> -----Original Message-----
> From: Stefan Herbrechtsmeier [mailto:stefan@herbrechtsmeier.net]
> Sent: Freitag, 17. Juli 2015 12:56
> To: Bach, Pascal; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] cmake.bbclass: set archiver, linker and ra=
nlib
> in toolchain.cmake
>=20
> Am 17.07.2015 um 09:44 schrieb Pascal Bach:
> > Setting CMAKE_AR, CMAKE_LINKER and CMAKE_RANLIB correctly in
> > toolchain.cmake is necessary to correctly build -native packages using
> > CMake.
> >
> > The reason is that CMake is not able to find the above utilities by
> > itself because CMAKE_FIND_ROOT_PATH_MODE_PROGRAM is set to
> ONLY so we
> > need to tell it explicitly where to look.
> Which version do you use? The master sets
> CMAKE_FIND_ROOT_PATH_MODE_PROGRAM to BOTH for native packages.
>=20

I tested it with 1.7.2. I didn't notice that change in master.=20
So I retested with master and it is working there without modifications.

> If this don't work you could set the
> CMAKE_C_COMPILER_EXTERNAL_TOOLCHAIN
> path (without /bin).
>=20
> > Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> > ---
> >   meta/classes/cmake.bbclass | 8 ++++++++
> >   1 file changed, 8 insertions(+)
> >
> > diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> > index 995ddf1..cae0ad2 100644
> > --- a/meta/classes/cmake.bbclass
> > +++ b/meta/classes/cmake.bbclass
> > @@ -13,6 +13,9 @@ inherit autotools
> >   # C/C++ Compiler (without cpu arch/tune arguments)
> >   OECMAKE_C_COMPILER ?=3D "`echo ${CC} | sed 's/^\([^ ]*\).*/\1/'`"
> >   OECMAKE_CXX_COMPILER ?=3D "`echo ${CXX} | sed 's/^\([^ ]*\).*/\1/'`"
> > +OECMAKE_AR ?=3D "`echo ${AR} | sed 's/^\([^ ]*\).*/\1/'`"
> This is already set in master.
>=20

Just saw this.

> > +OECMAKE_LINKER ?=3D "`echo ${LD} | sed 's/^\([^ ]*\).*/\1/'`"
> > +OECMAKE_RANLIB ?=3D "`echo ${RANLIB} | sed 's/^\([^ ]*\).*/\1/'`"
> You don't need the sed for ranlib.
>=20

I wasn't sure it is needed I just keept it to be on the safe side.

The question is if the two above lines are needed at all. As I wrote above =
it is now working without them.
For consistency reasons one could add them but currently I wouldn't do it.

So I think we can drop this patch.
Thanks for the feedback.

> >   # Compiler flags
> >   OECMAKE_C_FLAGS ?=3D "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}
> ${CFLAGS}"
> > @@ -35,6 +38,11 @@ set( CMAKE_SYSTEM_PROCESSOR ${TARGET_ARCH}
> )
> >   set( CMAKE_C_COMPILER ${OECMAKE_C_COMPILER} )
> >   set( CMAKE_CXX_COMPILER ${OECMAKE_CXX_COMPILER} )
> >   set( CMAKE_ASM_COMPILER ${OECMAKE_C_COMPILER} )
> > +# Force the use of cache here otherwise the values will be overridden
> > +(http://www.cmake.org/Bug/view.php?id=3D13038)
> > +set( CMAKE_AR ar CACHE FILEPATH "Archiver" FORCE ) set(
> CMAKE_LINKER
> > +ld CACHE FILEPATH "Linker" FORCE ) set( CMAKE_RANLIB ranlib CACHE
> > +FILEPATH "Ranlib" FORCE )
> > +
> Why you generate OECMAKE_* and don't use them?
>=20
> Furthermore the CMAKE_* should contain the full path and are generated in
> the CMakeFindBinUtils.cmake.
>=20
> >   set( CMAKE_C_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "CFLAGS"
> )
> >   set( CMAKE_CXX_FLAGS "${OECMAKE_CXX_FLAGS}" CACHE STRING
> "CXXFLAGS" )
> >   set( CMAKE_ASM_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "ASM
> FLAGS" )



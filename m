Return-Path: <juro.bystricky@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 498546E668
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 15:47:27 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP; 30 Aug 2016 08:47:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,257,1470726000"; 
   d="scan'208";a="2829515"
Received: from orsmsx109.amr.corp.intel.com ([10.22.240.7])
	by orsmga004.jf.intel.com with ESMTP; 30 Aug 2016 08:47:28 -0700
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.251]) by
	ORSMSX109.amr.corp.intel.com ([169.254.11.150]) with mapi id
	14.03.0248.002; Tue, 30 Aug 2016 08:47:28 -0700
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/1] gcc-runtime.inc: add CPP support for
	mips64-n32 tune
Thread-Index: AQHSAkcR3GB1r9R5Ukq5ITVbXIEP2KBhPAAAgABqzeA=
Date: Tue, 30 Aug 2016 15:47:27 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B611881DDD@ORSMSX112.amr.corp.intel.com>
References: <1472510736-3148-1-git-send-email-juro.bystricky@intel.com>
	<1472510736-3148-2-git-send-email-juro.bystricky@intel.com>
	<91bed634-2b94-5920-65bc-d0844bc6f01d@windriver.com>
In-Reply-To: <91bed634-2b94-5920-65bc-d0844bc6f01d@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] gcc-runtime.inc: add CPP support for mips64-n32 tune
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
X-List-Received-Date: Tue, 30 Aug 2016 15:47:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The way I see it, there are basically three ways to fix this issue:
1. Modify gcc configuration so a different CPP path is searched, one that a=
ctually exists
2. "Create" the folder CPP assumes in the configured search path (via symli=
nks)
3. Use environment variable CPP_INCLUDE_PATH (in modified environment scrip=
ts)

Obviously, option #1 is the cleanest solution, but it is a bit more invasiv=
e
(would require configuring gcc with different --target=3Dxxx).=20
Maybe this should be addressed in the next Yocto release, I think it is too=
 late to do this for this release.

As for option #2:
mip64 multilib creates three distinct toolchains, two of them work fine, bu=
t only because they have already adopted option #2. So using similar approa=
ch to fix the third toolchain is also a matter of consistency. If you insta=
ll the generated SDK, you will see there are three symlinks now (i.e. folde=
r <path>/c++/6.2.0)instead of two.

Using option #3 would fix the problem, but if we use it, we should use it c=
onsistently for all toolchains.

Juro

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of Ma=
rk
> Hatle
> Sent: Monday, August 29, 2016 7:24 PM
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 1/1] gcc-runtime.inc: add CPP support for
> mips64-n32 tune
>=20
> On 8/30/16 6:45 AM, Juro Bystricky wrote:
> > This patch fixes the problem where the CPP compiler cannot find include
> files.
> > The compiler is configured to look for the files in places that do not
> exist.
> > When querying the CPP for search paths, we observe messages such as
> these:
> >
> > multilib configuration:
> >
> > MACHINE=3D"qemumips64"
> > require conf/multilib.conf
> > MULTILIBS =3D "multilib:lib64 multilib:lib32"
> > DEFAULTTUNE =3D "mips64-n32"
> > DEFAULTTUNE_virtclass-multilib-lib64 =3D "mips64"
> > DEFAULTTUNE_virtclass-multilib-lib32 =3D "mips32r2"
> >
> > ignoring nonexistent directory "<path>/sysroots/mips64-n32-poky-linux-
> gnun32/usr/include/c++/6.2.0/mips64-poky-linux/32
> >
> > single lib configuration:
> > MACHINE=3D"qemumips64"
> > DEFAULTTUNE =3D "mips64-n32"
> > ignoring nonexistent directory "<path>/sysroots/mips64-n32-poky-linux-
> gnun32/usr/include/c++/6.2.0/mips64-poky-linux/
> >
> > To fix this, create a symlink of the name CPP expects and point it to t=
he
> corresponding "gnun32" directory.
> >
> > [YOCTO#10142]
> >
> > Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> > ---
> >  meta/recipes-devtools/gcc/gcc-runtime.inc | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-
> devtools/gcc/gcc-runtime.inc
> > index 526be55..9791e21 100644
> > --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> > @@ -82,6 +82,16 @@ do_install_append_class-target () {
> >  	if [ "${TARGET_OS}" =3D "linux-gnuspe" ]; then
> >  		ln -s ${TARGET_SYS}
> ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux
> >  	fi
> > +
> > +	if [ "${TARGET_OS}" =3D "linux-gnun32" ]; then
> > +		if [ "${MULTILIBS}" !=3D "" ]; then
> > +			mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-
> pokymllib64-linux
> > +			ln -s ../${TARGET_SYS}
> ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-pokymllib64-linux/32
> > +		else
> > +			ln -s ${TARGET_SYS}
> ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux
> > +		fi
> > +	fi
> > +
>=20
> It would be better if you can query the compiler that was produced for th=
e
> path
> it is expecting.  (Often you can run it and capture the result with a
> specific
> command.  Then use that path as the input.  Simply verify if the expected
> C++
> path and the compiler path are the same, if not setup the link -- they ar=
e
> the
> same continue on.)
>=20
> There may be a more simple solution however then all of this.
>=20
> In the environment file for the SDK, you can add the CPP_INCLUDE variable
> and
> set it to the right value... this will require a change to the environmen=
t
> setup
> and a way to known the right value and the end location.
>=20
> BTW I believe the problem is the difference between the SDK view and the
> host/cross compile view of the multilibs and such.  Something gets out of
> sync
> and needs to be manually fixed.
>=20
> --Mark
>=20
> >  	if [ "${TCLIBC}" !=3D "glibc" ]; then
> >  		case "${TARGET_OS}" in
> >  			"linux-musl" | "linux-uclibc" | "linux-*spe")
> extra_target_os=3D"linux";;
> >
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


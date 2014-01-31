Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 848226E87D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 19:03:12 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id d17so2469700eek.22
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 11:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=eBGF1Dnf5ykisFKUBqBhj2uog2zfrm42koZ45Yc0NwM=;
	b=oTK931j1l/K4Q+sqI7+dLYgNljyn9NtQ+w8zT8FBPse6D+REUIu6AZfjl11To9Pxcu
	kCH0oEaffx4sdJANBK941MMUj7yFixiwSfyV9Tme+pgEdTzjPI9OGFLGSPYcMQk+Vgrz
	0zLcUXROnKNXkO2WKSFMsMgmxbbw1E2o53DL1Oew0ZIXVCcoFfxrjX5p1akN5ZRbTr5w
	biLyPGUFFKWXB4GCiujttak6ruYcA9gpi4mALBZq1+IXJBFYF9N/WS+Q1X7/8j59z8Mw
	G5ZEOD/jmOOxVUrfWjfmdBYnXtPsCHC6O4oWVeE7joRGNYIVrT1eQhEUUYd/dSAlQpGE
	EWpA==
X-Received: by 10.14.32.132 with SMTP id o4mr26882632eea.14.1391194992849;
	Fri, 31 Jan 2014 11:03:12 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id d9sm13815803eei.9.2014.01.31.11.03.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Jan 2014 11:03:11 -0800 (PST)
Date: Fri, 31 Jan 2014 20:03:20 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20140131190320.GY3718@jama>
References: <cover.1390350823.git.Martin.Jansa@gmail.com>
	<9c945a5fa6dacd392f7b8af2367846450de8e8b2.1390350823.git.Martin.Jansa@gmail.com>
	<20140131173800.GW3718@jama> <20140131184645.GX3718@jama>
MIME-Version: 1.0
In-Reply-To: <20140131184645.GX3718@jama>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [PATCH][RFC][WIP 3/6] feature-arm-thumb.inc: respect ARM_INSTRUCTION_SET when adding thumb suffix
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
X-List-Received-Date: Fri, 31 Jan 2014 19:03:12 -0000
X-Groupsio-MsgNum: 49741
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bgVZo3zXaTQrZhjg"
Content-Disposition: inline

--bgVZo3zXaTQrZhjg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2014 at 07:46:45PM +0100, Martin Jansa wrote:
> On Fri, Jan 31, 2014 at 06:38:00PM +0100, Martin Jansa wrote:
> > On Wed, Jan 22, 2014 at 01:36:08AM +0100, Martin Jansa wrote:
> > > * this means that recipes with ARM_INSTRUCTION_SET explicitly changed
> > >   to arm will be built in feed without thumb suffix
> > > * I'm not sure if the rest of system correctly supports different
> > >   TUNE_PKGARCHs for different recipes, this is one of the reasons why
> > >   this is WIP/RFC
> > >=20
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > >  meta/conf/machine/include/arm/feature-arm-thumb.inc | 17 +++++++++++=
------
> > >  1 file changed, 11 insertions(+), 6 deletions(-)
> > >=20
> > > diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/me=
ta/conf/machine/include/arm/feature-arm-thumb.inc
> > > index d58c4b4..09a127a 100644
> > > --- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
> > > +++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
> > > @@ -5,14 +5,19 @@
> > >  # but requires more instructions (140% for 70% smaller code) so may =
be
> > >  # slower.
> > >  TUNEVALID[thumb] =3D "Use thumb instructions instead of ARM"
> > > -ARM_THUMB_M_OPT =3D "${@['-marm', '-mthumb'][d.getVar('ARM_INSTRUCTI=
ON_SET', True) =3D=3D 'thumb']}"
> > > -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ' $=
{ARM_THUMB_M_OPT}', '', d)}"
> > > +ARM_THUMB_OPT =3D "${@['arm', 'thumb'][d.getVar('ARM_INSTRUCTION_SET=
', True) =3D=3D 'thumb']}"
> > > +ARM_THUMB_SUFFIX .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv4'=
,  't',  '', d)}"
> > > +ARM_THUMB_SUFFIX .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv5'=
,  't',  '', d)}"
> > > +ARM_THUMB_SUFFIX .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv6'=
,  't',  '', d)}"
> > > +ARM_THUMB_SUFFIX .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv7a=
', 't2', '', d)}"
> > > +ARM_THUMB_SUFFIX .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv7r=
', 't2', '', d)}"
> > > +ARM_THUMB_SUFFIX .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv7m=
', 't2', '', d)}"
> > > +
> > > +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ' -=
m${ARM_THUMB_OPT}', '', d)}"
> > >  OVERRIDES .=3D "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ':thu=
mb', '', d)}"
> > > =20
> > > -ARMPKGSFX_THUMB .=3D "${@bb.utils.contains('TUNE_FEATURES', [ 'armv4=
', 'thumb' ], 't', '', d)}"
> > > -ARMPKGSFX_THUMB .=3D "${@bb.utils.contains('TUNE_FEATURES', [ 'armv5=
', 'thumb' ], 't', '', d)}"
> > > -ARMPKGSFX_THUMB .=3D "${@bb.utils.contains('TUNE_FEATURES', [ 'armv6=
', 'thumb' ], 't', '', d)}"
> > > -ARMPKGSFX_THUMB .=3D "${@bb.utils.contains('TUNE_FEATURES', [ 'armv7=
a', 'thumb' ], 't2', '', d)}"
> > > +# Add suffix from ARM_THUMB_SUFFIX only if after all this we still s=
et ARM_THUMB_OPT to thumb
> > > +ARMPKGSFX_THUMB .=3D "${@ d.getVar('ARM_THUMB_SUFFIX', True) if d.ge=
tVar('ARM_THUMB_OPT', True) =3D=3D 'thumb'] else ''}"
> >=20
> > In branch I've removed extra ']' in this line and moved this patch as
> > last in series, because it's really not ready for merge (eglibc-initial
> > fails).
>=20
> Ah, there was another issue in 4/6 and "arm" TUNE_FEATURE wasn't
> inherited by higher architectures, so it was correctly forcing "thumb"
> mode - that's why eglibc-initial was failing and now it isn't.

OMG sorry for noise, yes there is still problem when missing thumb and
arm builds for the same machine with different PKGARCH and
eglibc-initial still fails

| checking build system type... x86_64-pc-linux-gnu
| checking host system type... arm-oe-linux-gnueabi
| checking for arm-oe-linux-gnueabi-gcc... arm-oe-linux-gnueabi-gcc  -march=
=3Darmv5e -marm -mthumb-interwork --sysroot=3D/OE/build/oe-core/tmp-eglibc/=
sysroots/qemuarm
| checking for suffix of object files... configure: error: in `/OE/build/oe=
-core/tmp-eglibc/work/armv5e-oe-linux-gnueabi/eglibc-initial/2.18-r0/build-=
arm-oe-linux-gnueabi':
| configure: error: cannot compute suffix of object files: cannot compile
| See `config.log' for more details
| WARNING: /OE/build/oe-core/tmp-eglibc/work/armv5e-oe-linux-gnueabi/eglibc=
-initial/2.18-r0/temp/run.do_configure.3925:1 exit 1 from
|   /OE/build/oe-core/tmp-eglibc/work/armv5e-oe-linux-gnueabi/eglibc-initia=
l/2.18-r0/eglibc-2.18/libc/configure --host=3Darm-oe-linux-gnueabi --build=
=3Dx86_64-linux --prefix=3D/usr --without-cvs --disable-sanity-checks --wit=
h-headers=3D/OE/build/oe-core/tmp-eglibc/sysroots/qemuarm/usr/include --wit=
h-kconfig=3D/OE/build/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin --en=
able-hacker-mode --enable-addons

config.log:
configure:2768: arm-oe-linux-gnueabi-gcc  -march=3Darmv5e -marm -mthumb-int=
erwork --sysroot=3D/OE/build/oe-core/tmp-eglibc/sysroots/qemuarm -c  -O2 -p=
ipe -g -feliminate-unused-debug-types  conftest.c >&5
/OE/build/oe-core/tmp-eglibc/work/armv5e-oe-linux-gnueabi/eglibc-initial/2.=
18-r0/eglibc-2.18/libc/configure: line 2770: arm-oe-linux-gnueabi-gcc: comm=
and not found
configure:2772: $? =3D 127

and the problem is basically that STAGING_BINDIR_TOOLCHAIN points to
different directory when building recipe with thumb enabled and
disabled, in this case gcc was built with thumb enabled and is installed
in:

sysroots/x86_64-linux/usr/bin/armv5te-oe-linux-gnueabi

OE qemuarm@ ~/build/oe-core $ ls /OE/build/oe-core/tmp-eglibc/sysroots/x86_=
64-linux/usr/bin/armv5te-oe-linux-gnueabi
arm-oe-linux-gnueabi-addr2line  arm-oe-linux-gnueabi-elfedit
arm-oe-linux-gnueabi-nm       arm-oe-linux-gnueabi-readelf
arm-oe-linux-gnueabi-ar         arm-oe-linux-gnueabi-gprof
arm-oe-linux-gnueabi-objcopy  arm-oe-linux-gnueabi-size
arm-oe-linux-gnueabi-as         arm-oe-linux-gnueabi-ld
arm-oe-linux-gnueabi-objdump  arm-oe-linux-gnueabi-strings
arm-oe-linux-gnueabi-c++filt    arm-oe-linux-gnueabi-ld.bfd
arm-oe-linux-gnueabi-ranlib   arm-oe-linux-gnueabi-strip

but when building eglibc-initial with thumb disalbed, TUNE_PKGARCH
becames armv5e and STAGING_BINDIR_TOOLCHAIN in PATH points to wrong dir:

# $STAGING_BINDIR_TOOLCHAIN
#   set conf/bitbake.conf:354
#     "${STAGING_DIR_NATIVE}${bindir_native}/${TUNE_PKGARCH}${TARGET_VENDOR=
}-${TARGET_OS}"
STAGING_BINDIR_TOOLCHAIN=3D"/OE/build/oe-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/bin/armv5e-oe-linux-gnueabi"

OE qemuarm@ ~/build/oe-core $ ls /OE/build/oe-core/tmp-eglibc/sysroots/x86_=
64-linux/usr/bin/armv5e-oe-linux-gnueabi
ls: cannot access /OE/build/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/bi=
n/armv5e-oe-linux-gnueabi: No such file or directory

Any idea how to resolve this correctly?
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bgVZo3zXaTQrZhjg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLr83gACgkQN1Ujt2V2gBz1HwCgiv9E0sHUHc5KwQR9KxPp1dzZ
ABoAnRzCXBxK2wmPIh7QBwFEotNMCbMx
=TJxC
-----END PGP SIGNATURE-----

--bgVZo3zXaTQrZhjg--

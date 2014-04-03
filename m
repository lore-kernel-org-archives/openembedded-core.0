Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7C4606E4CC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Apr 2014 13:13:24 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 Apr 2014 06:13:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,787,1389772800"; d="scan'208";a="513682338"
Received: from pmcgurk-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.138])
	by fmsmga002.fm.intel.com with ESMTP; 03 Apr 2014 06:13:06 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Thu, 03 Apr 2014 14:13:05 +0100
Message-ID: <1696721.rgbfGmBHri@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.3 (Linux/3.13.7-200.fc20.x86_64; KDE/4.12.3; x86_64; ; )
In-Reply-To: <1396526409.2910.86.camel@ted>
References: <1396275649-32352-1-git-send-email-kai.kang@windriver.com>
	<533B7788.7000301@windriver.com> <1396526409.2910.86.camel@ted>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] nss: avoid to use the hardcode kernel version
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
X-List-Received-Date: Thu, 03 Apr 2014 13:13:25 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Thursday 03 April 2014 13:00:09 Richard Purdie wrote:
> On Wed, 2014-04-02 at 10:35 +0800, Kang Kai wrote:
> > On 2014=E5=B9=B403=E6=9C=8831=E6=97=A5 22:20, Kai Kang wrote:
> > > From: Roy Li <rongqing.li@windriver.com>
> > >=20
> > > When native package is built, use the uname to return the kernel
> > > version.
> > >=20
> > > When target is built, read kernel version from
> > > ${STAGING_KERNEL_DIR}/kernel-abiversion to avoid to use the hardc=
ode
> > > kernel version.
> > >=20
> > > Signed-off-by: Roy Li <rongqing.li@windriver.com>
> > > Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > > ---
> > >=20
> > >   meta/recipes-support/nss/nss.inc | 15 +++++++++++++--
> > >   1 file changed, 13 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/meta/recipes-support/nss/nss.inc
> > > b/meta/recipes-support/nss/nss.inc index 404decc..f24da68 100644
> > > --- a/meta/recipes-support/nss/nss.inc
> > > +++ b/meta/recipes-support/nss/nss.inc
> > > @@ -26,6 +26,7 @@ SRC_URI_append_class-target =3D "\
> > >=20
> > >   inherit siteinfo
> > >   PR =3D "r0"
> > >   DEPENDS =3D "sqlite3 nspr zlib nss-native"
> > >=20
> > > +DEPENDS_append_class-target +=3D "virtual/kernel"
> > >=20
> > >   DEPENDS_class-native =3D "sqlite3-native nspr-native zlib-nativ=
e"
> > >   RDEPENDS_${PN} =3D "perl"
> > >=20
> > > @@ -37,12 +38,24 @@ TARGET_CC_ARCH +=3D "${LDFLAGS}"
> > >=20
> > >   do_compile_prepend_class-native() {
> > >  =20
> > >       export NSPR_INCLUDE_DIR=3D${STAGING_INCDIR_NATIVE}
> > >       export NSPR_LIB_DIR=3D${STAGING_LIBDIR_NATIVE}
> > >=20
> > > +    export OS_RELEASE=3D`uname -r`
> > >=20
> > >   }
> > >  =20
> > >   do_compile_prepend_class-nativesdk() {
> > >  =20
> > >       export LDFLAGS=3D""
> > >  =20
> > >   }
> > >=20
> > > +do_compile_prepend_class-target() {
> > > +    export OS_RELEASE=3D`cat ${STAGING_KERNEL_DIR}/kernel-abiver=
sion|sed
> > > 's/-.*//'` +}
> > > +
> > > +do_install_prepend_class-native() {
> > > +    export OS_RELEASE=3D`uname -r`
> > > +}
> > > +
> > > +do_install_prepend_class-target() {
> > > +    export OS_RELEASE=3D`cat ${STAGING_KERNEL_DIR}/kernel-abiver=
sion|sed
> > > 's/-.*//'` +}
> > >=20
> > >   do_compile() {
> > >  =20
> > >       export CROSS_COMPILE=3D1
> > >       export NATIVE_CC=3D"gcc"
> > >=20
> > > @@ -57,7 +70,6 @@ do_compile() {
> > >=20
> > >       export NSS_USE_SYSTEM_SQLITE=3D1
> > >       export NSS_ENABLE_ECC=3D1
> > >=20
> > > -    export OS_RELEASE=3D3.4
> >=20
> > How about use var LINUXLIBCVERSION:
> >=20
> > export OS_RELEASE=3D"${@d.getVar('LINUXLIBCVERSION', True)}"
> >=20
> > it should be the same value with kernel version, right?
>=20
> As others have replied, that is usually much more recent than the old=
est
> kernel we support. What does nss do with this value? Is it about the
> header versions? Would something run on an older kernel with a newer
> value for OS_RELEASE?
>=20
> We also have the OLDEST_KERNEL variable (currently at 2.6.16) FWIW.

Incidentally, I think maybe for 1.7 it's time we bumped OLDEST_KERNEL. =
What a=20
sensible minimum would be though I'm not sure. The minimum version for =
udev=20
182 would be one choice, but I believe there are people still using old=
er=20
kernels even than that.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


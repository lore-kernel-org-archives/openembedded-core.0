Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2BD6560115
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 02:12:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7E2CXMK010658
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Aug 2013 19:12:33 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.66]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.02.0342.003;
	Tue, 13 Aug 2013 19:12:33 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Saul Wold <sgw@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 1/1] coreutils:  allow for acl support
Thread-Index: AQHOmGr8rCxCuIbPJ0uHxVhagnPzr5mUIgwA///TEQA=
Date: Wed, 14 Aug 2013 02:12:32 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF843C4E86F2@ALA-MBB.corp.ad.wrs.com>
References: <1376428851-13845-1-git-send-email-jslater@windriver.com>
	<520AA98C.6020104@linux.intel.com>
In-Reply-To: <520AA98C.6020104@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.152.80]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] coreutils: allow for acl support
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
X-List-Received-Date: Wed, 14 Aug 2013 02:12:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Saul Wold [mailto:sgw@linux.intel.com]
> Sent: Tuesday, August 13, 2013 2:48 PM
> To: Slater, Joseph
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 1/1] coreutils: allow for acl support
>=20
> On 08/13/2013 02:20 PM, Joe Slater wrote:
> > CQID: 430353
> >
> > Define PACKAGECONFIG info for acl assuming it
> > might be a DISTRO_FEATURE.
> >
>=20
> Thanks for the Patch!
>=20
> Will you be doing the same for the GPLv2 version?

I guess I should.

>=20
> I guess this means we should be expecting a set of patches to enable
> other recipes that have --disable-acl by default?

Yeah, but I might not know whether some recipes really never, ever,
want acl support enabled.

Joe

>=20
>=20
> Thanks
> Sau!
> > Signed-off-by: Joe Slater <jslater@windriver.com>
> > ---
> >   meta/recipes-core/coreutils/coreutils_8.21.bb |   14 +++++++++++---
> >   1 files changed, 11 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-core/coreutils/coreutils_8.21.bb b/meta/recip=
es-
> core/coreutils/coreutils_8.21.bb
> > index 26ada48..e784329 100644
> > --- a/meta/recipes-core/coreutils/coreutils_8.21.bb
> > +++ b/meta/recipes-core/coreutils/coreutils_8.21.bb
> > @@ -7,7 +7,7 @@ BUGTRACKER =3D "http://debbugs.gnu.org/coreutils"
> >   LICENSE =3D "GPLv3+"
> >   LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47=
fae504\
> >
> file://src/ls.c;beginline=3D5;endline=3D16;md5=3D38b79785ca88537b75871782=
a2a3c6b8"
> > -PR =3D "r0"
> > +PR =3D "r1"
> >   DEPENDS =3D "gmp libcap"
> >   DEPENDS_class-native =3D ""
> >
> > @@ -22,8 +22,16 @@ SRC_URI =3D "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
> >   SRC_URI[md5sum] =3D "065ba41828644eca5dd8163446de5d64"
> >   SRC_URI[sha256sum] =3D
> "adaa44bdab3fa5eb352e80d8a31fdbf957b78653d0c2cd30d63e161444288e18"
> >
> > -EXTRA_OECONF =3D "--disable-acl"
> > -EXTRA_OECONF_class-native =3D "--disable-acl --without-gmp"
> > +EXTRA_OECONF_class-native =3D "--without-gmp"
> > +
> > +# acl is not a default feature
> > +#
> > +PACKAGECONFIG_class-target ??=3D "${@base_contains('DISTRO_FEATURES', =
'acl', 'acl', '',
> d)}"
> > +PACKAGECONFIG_class-native ??=3D ""
> > +
> > +# with, without, depends, rdepends
> > +#
> > +PACKAGECONFIG[acl] =3D "--enable-acl,--disable-acl,acl,"
> >
> >   # [ df mktemp base64 gets a special treatment and is not included in =
this
> >   bindir_progs =3D "basename chcon cksum comm csplit cut dir dircolors =
dirname du \
> >


Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 8516D6C6B0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 14:55:42 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 20 Sep 2013 07:55:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,944,1371106800"; d="scan'208";a="297320649"
Received: from unknown (HELO helios.localnet) ([10.252.123.234])
	by AZSMGA002.ch.intel.com with ESMTP; 20 Sep 2013 07:55:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 20 Sep 2013 15:55:41 +0100
Message-ID: <4410837.umzcAyviZD@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-30-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <20130920144205.GJ18414@jama>
References: <1379682086-27877-1-git-send-email-paul.eggleton@linux.intel.com>
	<1689545.vp0O8sHNEO@helios> <20130920144205.GJ18414@jama>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qt4-x11-free: disable QGtkStyle
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
X-List-Received-Date: Fri, 20 Sep 2013 14:55:44 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Friday 20 September 2013 16:42:05 Martin Jansa wrote:
> On Fri, Sep 20, 2013 at 03:27:32PM +0100, Paul Eggleton wrote:
> > On Friday 20 September 2013 15:58:26 Andreas M=FCller wrote:
> > > On Fri, Sep 20, 2013 at 3:01 PM, Paul Eggleton
> > >=20
> > > <paul.eggleton@linux.intel.com> wrote:
> > > > This currently leads to a floating dependency on GTK+. Since mo=
st
> > > > users
> > > > in an embedded context won't need this, just disable it by defa=
ult.
> > > >=20
> > > > Fixes [YOCTO #5116].
> > > >=20
> > > > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > > > ---
> > > >=20
> > > >  meta/recipes-qt/qt4/qt4-x11-free.inc | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc
> > > > b/meta/recipes-qt/qt4/qt4-x11-free.inc index 4b29f55..369b3d5 1=
00644
> > > > --- a/meta/recipes-qt/qt4/qt4-x11-free.inc
> > > > +++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
> > > > @@ -12,7 +12,7 @@ INC_PR =3D "r50"
> > > >=20
> > > >  QT_GLFLAGS ?=3D "${@base_contains('DISTRO_FEATURES', 'opengl',=

> > > >  '-opengl',
> > > >  '-no-opengl', d)} " QT_GLFLAGS_qemux86 =3D "-opengl"
> > > >  QT_GLFLAGS_qemuppc =3D "-opengl"
> > > >=20
> > > > -QT_X11_FLAGS ?=3D "-no-xinerama -no-xkb"
> > > > +QT_X11_FLAGS ?=3D "-no-xinerama -no-xkb -no-gtkstyle"
> > > >=20
> > > >  QT_CONFIG_FLAGS +=3D "${QT_X11_FLAGS}"
> > > >  QT_BASE_LIB  ?=3D "libqt"
> > >=20
> > > How about PACKAGECONFIG for this?
> >=20
> > Ultimately I decided against introducing PACKAGECONFIG just for thi=
s,
> > because the Qt recipes currently avoid it (PACKAGECONFIG cannot sup=
port a
> > number of the additional library options for Qt since they are tri-=
state;
> > not to mention that PACKAGECONFIG isn't just a drop-in for Qt becau=
se it
> > doesn't use autotools/cmake and therefore doesn't use
> > EXTRA_OECONF/EXTRA_OECMAKE). I figured that the few users who do wa=
nt
> > QGTKStyle can just set QT_X11_FLAGS as desired.
>=20
> FWIW: I'm using PACKAGECONFIG in meta-qt5, you're right that it canno=
t
> cover all 3 states for each option, but most common scenarios need to=

> select only between 2 and automatically added DEPENDS/RDEPENDS is big=

> plus.

On this wider issue, I have given some thought to how we could expand=20=

PACKAGECONFIG to support multi-state options, although I'm hesitant to =
make=20
the already slightly opaque PACKAGECONFIG syntax any more complicated.=20=

Something to think about further for the next development cycle perhaps=
.
=20
> To support PACKAGECONFIG without autotools/cmake inherit I just add
> generated EXTRA_OECONF to QT_CONFIG_FLAGS.

I didn't try it but Peter reported that this caused a failure when he t=
ried=20
this as a solution (presumably because there is junk in EXTRA_OECONF al=
ready=20
that isn't suitable for passing to Qt4's configure). It ought to be abl=
e to=20
work though.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


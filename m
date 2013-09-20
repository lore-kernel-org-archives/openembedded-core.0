Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id BD9FA60EE1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 14:27:44 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 20 Sep 2013 07:27:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,944,1371106800"; d="scan'208";a="363315974"
Received: from unknown (HELO helios.localnet) ([10.252.123.234])
	by azsmga001.ch.intel.com with ESMTP; 20 Sep 2013 07:27:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 20 Sep 2013 15:27:32 +0100
Message-ID: <1689545.vp0O8sHNEO@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-30-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <CALbNGRTFYp0yJ+Y9yTX8npPQaHmaaZOzet5EEwjSpULDWy3QYA@mail.gmail.com>
References: <1379682086-27877-1-git-send-email-paul.eggleton@linux.intel.com>
	<CALbNGRTFYp0yJ+Y9yTX8npPQaHmaaZOzet5EEwjSpULDWy3QYA@mail.gmail.com>
MIME-Version: 1.0
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
X-List-Received-Date: Fri, 20 Sep 2013 14:27:44 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Friday 20 September 2013 15:58:26 Andreas M=FCller wrote:
> On Fri, Sep 20, 2013 at 3:01 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> > This currently leads to a floating dependency on GTK+. Since most u=
sers
> > in an embedded context won't need this, just disable it by default.=

> >=20
> > Fixes [YOCTO #5116].
> >=20
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > ---
> >=20
> >  meta/recipes-qt/qt4/qt4-x11-free.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc
> > b/meta/recipes-qt/qt4/qt4-x11-free.inc index 4b29f55..369b3d5 10064=
4
> > --- a/meta/recipes-qt/qt4/qt4-x11-free.inc
> > +++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
> > @@ -12,7 +12,7 @@ INC_PR =3D "r50"
> >=20
> >  QT_GLFLAGS ?=3D "${@base_contains('DISTRO_FEATURES', 'opengl', '-o=
pengl',
> >  '-no-opengl', d)} " QT_GLFLAGS_qemux86 =3D "-opengl"
> >  QT_GLFLAGS_qemuppc =3D "-opengl"
> >=20
> > -QT_X11_FLAGS ?=3D "-no-xinerama -no-xkb"
> > +QT_X11_FLAGS ?=3D "-no-xinerama -no-xkb -no-gtkstyle"
> >=20
> >  QT_CONFIG_FLAGS +=3D "${QT_X11_FLAGS}"
> >  QT_BASE_LIB  ?=3D "libqt"
>
> How about PACKAGECONFIG for this?

Ultimately I decided against introducing PACKAGECONFIG just for this, b=
ecause=20
the Qt recipes currently avoid it (PACKAGECONFIG cannot support a numbe=
r of=20
the additional library options for Qt since they are tri-state; not to =
mention=20
that PACKAGECONFIG isn't just a drop-in for Qt because it doesn't use=20=

autotools/cmake and therefore doesn't use EXTRA_OECONF/EXTRA_OECMAKE). =
I=20
figured that the few users who do want QGTKStyle can just set QT_X11_FL=
AGS as=20
desired.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


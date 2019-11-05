Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id 584E07F7E4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 21:59:50 +0000 (UTC)
IronPort-SDR: ofUCNdZ+rO6/0c3b4eyIawGL0WA8tzE4mDYY/7PifW/mow8ylGHj78DhAThEJYghBHRTKA3nzW
	bk+hFVGDlu+TsiUl5hJv90lniyWhp9KuZmnnKKS6UEtK+YxIkfFQQtxeUSGQ8Gfg8D+A/RB7ng
	TMPO6Ll7ca7w8nWBlaKU+ePUl3X2OajmLgw7r1IlZJGE9sFqIXcA4C2v1GeO3HJ/HZ6JLnxV53
	x+oGiuSQrHzLCDABOMSk04r0junRc6gcBZd6TvcPJPNCUOaSQDtsOy1XVFIMQah56WgdSnGKNI
	3tc=
X-IronPort-AV: E=Sophos;i="5.68,271,1569276000"; 
   d="scan'208";a="2115714"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: akuster808 <akuster808@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [warrior][PATCH 0/8] Backport relevant changes from
	Zeus
Thread-Index: AQHVhD8zsfq8DgVlsUSBraPn3NxDL6duJVYAgAuFNXCAA5HUQA==
Date: Tue, 5 Nov 2019 21:59:48 +0000
Message-ID: <3b65fe82aace42dc8b17033fee7b5aa3@XBOX03.axis.com>
References: <cover.1571243326.git.pkj@axis.com>
	<c6db1799-ee15-0843-8325-9996e13dd8c6@gmail.com>
	<cd4d358ec6eb43a397764aebee84105c@XBOX03.axis.com>
In-Reply-To: <cd4d358ec6eb43a397764aebee84105c@XBOX03.axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Subject: Re: [warrior][PATCH 0/8] Backport relevant changes from Zeus
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
X-List-Received-Date: Tue, 05 Nov 2019 21:59:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core=
-
> bounces@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 3 november 2019 16:18
> To: akuster808 <akuster808@gmail.com>; openembedded-
> core@lists.openembedded.org
> Subject: Re: [OE-core] [warrior][PATCH 0/8] Backport relevant changes fro=
m
> Zeus
>=20
> > -----Original Message-----
> > From: akuster808 <akuster808@gmail.com>
> > Sent: den 27 oktober 2019 09:20
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; openembedded-
> > core@lists.openembedded.org
> > Subject: Re: [OE-core] [warrior][PATCH 0/8] Backport relevant changes
> > from Zeus
> >
> > Peter,
> >
> >
> > On 10/16/19 9:30 AM, Peter Kjellerstedt wrote:
> > > This patch set contains backports of our changes from Zeus that are
> > > relevant for Warrior.
> > >
> > > //Peter
> > >
> > > The following changes since commit
> > 79a850a10a4b88a6d20d607b322542f947874323:
> > >
> > >   conf/poky: add Fedora 30 and Opensuse Leap 15.1 to supported
> > distributions (2019-10-14 09:49:27 +0100)
> > >
> > > are available in the Git repository at:
> > >
> > >   git://push.yoctoproject.org/poky-contrib pkj/warrior_sync
> >
> > The series is causing build failures.
> >
> > https://errors.yoctoproject.org/Errors/Details/274748/
> >
> > https://errors.yoctoproject.org/Errors/Details/274757/
> >
> > I have not had the time to figure out which ones giving I have been
> > working on a different build failure. So if you could double check
> > them,
> > that would be great.
> >
> > regards,
> > Armin
>=20
> The problems are caused by the "meson.bbclass: Remove the MESON_*_ARGS
> variables" change. I have not had time to look into why it breaks yet,
> but I can reproduce it so it should hopefully not be too hard to figure
> it out once I have a little time.
>=20
> //Peter

Ok, I have figured it out now. It turns out that the change to=20
meson.bbclass uncovered a misuse of the meson.cross file. Over a year=20
ago, Ross changed meson_array() to return a string instead of an array=20
if only one argument is specified. This was for the benefit of cross=20
tools specified in the meson.cross file, however it also affected=20
properties. Up until now there has always been more than one argument=20
for all properties so this did not change anything. However, my change=20
to meson.bbclass to remove some unnecessary arguments caused the=20
c_link_args for nativesdk to be left with only one argument.=20

Support for specifying a property as a string instead of a list was=20
added to meson in version 0.50, which is why there never was a problem=20
with Zeus due to the change to meson.bbclass. I have now backported=20
the relevant part from meson 0.50 and included it in my patch series.

//Peter

> > > Niclas Svensson (1):
> > >   devtool: finish: Keep patches ordered when updating bbappend
> > >
> > > Peter Kjellerstedt (7):
> > >   meson.bbclass: Remove the MESON_*_ARGS variables
> > >   nativesdk-meson: Remove some unused variables
> > >   devtool: Avoid failure for recipes with S =3D=3D WORKDIR and no loc=
al
> > >     files
> > >   package_rpm.bbclass: Remove a misleading bb.note()
> > >   tzdata: Correct the packaging of /etc/localtime and /etc/timezone
> > >   devtool: finish: Add suppport for the --no-clean option
> > >   lib/oe/lsb: Make sure the distro ID is always lowercased
> > >
> > >  meta/classes/meson.bbclass                      | 15 +++++----------
> > >  meta/classes/package_rpm.bbclass                |  5 ++---
> > >  meta/lib/oe/lsb.py                              |  8 ++++----
> > >  .../meson/nativesdk-meson_0.49.2.bb             |  5 -----
> > >  meta/recipes-extended/timezone/tzdata.bb        |  5 +++--
> > >  scripts/lib/devtool/standard.py                 | 17 +++++++++------
> > --
> > >  6 files changed, 23 insertions(+), 32 deletions(-)



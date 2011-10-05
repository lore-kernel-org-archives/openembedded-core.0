Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RBF0o-0001RR-NJ
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 02:07:02 +0200
Received: (qmail invoked by alias); 05 Oct 2011 00:01:22 -0000
Received: from p4FDF0968.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.9.104]
	by mail.gmx.net (mp006) with SMTP; 05 Oct 2011 02:01:22 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18JBrER2U8JBiveg4myTVZRQy8g0nsm5KqUsj04l3
	acX6DIu/vzAMep
From: Andreas =?utf-8?q?M=C3=BCller?= <schnitzeltony@gmx.de>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 5 Oct 2011 02:05:24 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-96.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <201110031603.31007.schnitzeltony@gmx.de>
	<201110032045.14771.schnitzeltony@gmx.de>
	<1317732057.14671.38.camel@ted>
In-Reply-To: <1317732057.14671.38.camel@ted>
MIME-Version: 1.0
Message-Id: <201110050205.24428.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: bitbake webkit-gtk fails with clean temp dir
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Oct 2011 00:07:02 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday, October 04, 2011 02:40:49 PM Richard Purdie wrote:
> On Mon, 2011-10-03 at 20:45 +0200, Andreas M=C3=BCller wrote:
> > On Monday, October 03, 2011 05:29:52 PM Gary Thomas wrote:
> > > >> NOTE: package webkit-gtk-1.5.1+svnr90727-r0: task do_compile: Fail=
ed
> > > >> ERROR: Task 7 (/home/Superandy/data/oe-core/sources/openembedded-c=
ore/meta/recipes-sato/webkit/webkit-gtk_svn.bb, do_compile) failed with exi=
t code '1'
> > > >>
> > > >> ideas what causes this?
> > > >
> > > > no idea, but I get the same error
> > > >
> > >=20
> > > It builds in Yocto/Poky so you might compare with those recipes.
> > Dit you pull [1] and rebuild webkit-gtk?
> > >=20
> > >=20
> > some investigation later: by diff'ing log files created by working envi=
ronment with the current environment I fell over log.do_configure:=20
> >=20
> > --disable-dependency-tracking=20
> >=20
> > was added in [1]. Tried manual bisecting by
> >=20
> > git reset --hard 288343e30604b944dc18fd82172febd314d9c520
> >=20
> > =C3=A9 voil=C3=A0: webkit-gtk builds again. Will send a patch with --en=
able-dependency-tracking after testing...
> >=20
> > Andreas
>=20
>=20
> I'm planning to add this commit:
>=20
> http://cgit.openembedded.org/cgit.cgi/openembedded-core/commit/?h=3Dmaste=
r-next&id=3Dd53a0282be132a4ced507c0277925ae4a0f2f40d
>=20
> which means you should just be able to set:
>=20
> CONFIGUREOPT_DEPTRACK =3D ""
>=20
> for this recipe rather than having multiple configure options and hoping
> the right one wins.
I thought recipe's EXTRA_OECONF is by design ensured being appended and the=
reby overwriting options of same target.
>=20
> I'd also note this means there is a bug somewhere in the webkit
> makefiles...
Agreed - somebody with time & skills willing to take care?
>=20
If there are no objections I'll send a patch with

CONFIGUREOPT_DEPTRACK =3D ""

for webkit-gtk as soon as d53a0282be132a4ced507c0277925ae4a0f2f40d becomes =
part of master branch

Andreas



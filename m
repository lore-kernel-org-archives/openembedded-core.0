Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RBVzo-0005JK-H3
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 20:15:08 +0200
Received: (qmail invoked by alias); 05 Oct 2011 18:09:33 -0000
Received: from p4FDF0233.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.2.51]
	by mail.gmx.net (mp050) with SMTP; 05 Oct 2011 20:09:33 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19oMvRLoLZoyjSVtd5i3LfO6Hl6pHj0qwl76ZC7jb
	DgFHB9mWz6K4Hr
From: Andreas =?utf-8?q?M=C3=BCller?= <schnitzeltony@gmx.de>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 5 Oct 2011 20:13:37 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-96.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <201110031603.31007.schnitzeltony@gmx.de>
	<201110050205.24428.schnitzeltony@gmx.de>
	<1317821868.14671.154.camel@ted>
In-Reply-To: <1317821868.14671.154.camel@ted>
MIME-Version: 1.0
Message-Id: <201110052013.37982.schnitzeltony@gmx.de>
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
X-List-Received-Date: Wed, 05 Oct 2011 18:15:08 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wednesday, October 05, 2011 03:37:40 PM Richard Purdie wrote:
> On Wed, 2011-10-05 at 02:05 +0200, Andreas M=C3=BCller wrote:
> > On Tuesday, October 04, 2011 02:40:49 PM Richard Purdie wrote:
> > > On Mon, 2011-10-03 at 20:45 +0200, Andreas M=C3=BCller wrote:
> > > > On Monday, October 03, 2011 05:29:52 PM Gary Thomas wrote:
> > > > > >> NOTE: package webkit-gtk-1.5.1+svnr90727-r0: task do_compile: =
=46ailed
> > > > > >> ERROR: Task 7 (/home/Superandy/data/oe-core/sources/openembedd=
ed-core/meta/recipes-sato/webkit/webkit-gtk_svn.bb, do_compile) failed with=
 exit code '1'
> > > > > >>
> > > > > >> ideas what causes this?
> > > > > >
> > > > > > no idea, but I get the same error
> > > > > >
> > > > >=20
> > > > > It builds in Yocto/Poky so you might compare with those recipes.
> > > > Dit you pull [1] and rebuild webkit-gtk?
> > > > >=20
> > > > >=20
> > > > some investigation later: by diff'ing log files created by working =
environment with the current environment I fell over log.do_configure:=20
> > > >=20
> > > > --disable-dependency-tracking=20
> > > >=20
> > > > was added in [1]. Tried manual bisecting by
> > > >=20
> > > > git reset --hard 288343e30604b944dc18fd82172febd314d9c520
> > > >=20
> > > > =C3=A9 voil=C3=A0: webkit-gtk builds again. Will send a patch with =
=2D-enable-dependency-tracking after testing...
> > > >=20
> > > > Andreas
> > >=20
> > >=20
> > > I'm planning to add this commit:
> > >=20
> > > http://cgit.openembedded.org/cgit.cgi/openembedded-core/commit/?h=3Dm=
aster-next&id=3Dd53a0282be132a4ced507c0277925ae4a0f2f40d
> > >=20
> > > which means you should just be able to set:
> > >=20
> > > CONFIGUREOPT_DEPTRACK =3D ""
> > >=20
> > > for this recipe rather than having multiple configure options and hop=
ing
> > > the right one wins.
> > I thought recipe's EXTRA_OECONF is by design ensured being appended and=
 thereby overwriting options of same target.
> > >=20
> > > I'd also note this means there is a bug somewhere in the webkit
> > > makefiles...
> > Agreed - somebody with time & skills willing to take care?
>=20
> I'm not sure I have the time or the right skillset for that one but at
> least we've highighted there is a problem there...
>=20
> > If there are no objections I'll send a patch with
> >=20
> > CONFIGUREOPT_DEPTRACK =3D ""
> >=20
> > for webkit-gtk as soon as d53a0282be132a4ced507c0277925ae4a0f2f40d beco=
mes part of master branch
>=20
> I've gone ahead and added this since I think we're all agreed on what is
> needed here :)
>=20
Thanks :))



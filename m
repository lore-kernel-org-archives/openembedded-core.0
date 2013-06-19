Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7BE9B608CD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 16:48:31 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d49so3283160eek.37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 09:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=EzROwypm4R7dw9yiNpqeeqxDgjxqNUaLUrK7XVrz+1U=;
	b=TlqdUaDU1o14fOjBvUfxw5fVVvaNsKJBJBiqBcRtjpWtgk0ia6NmefwnkzC4+SRNO3
	BvKzNBEhz1J6iJ0grGZTFR3HX1r0+AX3JWbU4O80xqa4ZoysxcwKkOtAO2EAAqHJljbj
	gVjsLGJnYf1nR24Oo/DvBPZ7e/Eu2fvthkytMorB4fyNb8O0CfHDDhYPqqytTiBDzV9s
	4RNBjnQiZtnMAQDGzs9flGR3FtGem6gha2D0vG27TfTGyoLEr9NqzcrJVk1vf23ehoJv
	IXa1/0GFOxSxt4IIeWMF0xpxhAm+eEDAR7BzsVoUb6gAyuP3r3XciIMgea32JhT+P+bp
	0Yjw==
X-Received: by 10.15.99.2 with SMTP id bk2mr3467365eeb.76.1371660511714;
	Wed, 19 Jun 2013 09:48:31 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	y10sm38080892eev.3.2013.06.19.09.48.30 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 19 Jun 2013 09:48:31 -0700 (PDT)
Date: Wed, 19 Jun 2013 18:49:02 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20130619164902.GG14021@jama>
References: <1371653832-2178-1-git-send-email-jate.sujjavanich@myfuelmaster.com>
	<6C2434209962DC46B88345CA85C334A201C9F4A70BF2@Courier.syntech.org>
	<1616148.Gg6ON78uJM@helios> <1409263.tPA0GAOlPL@helios>
MIME-Version: 1.0
In-Reply-To: <1409263.tPA0GAOlPL@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Checksums for local files now stored using partial recipe path
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
X-List-Received-Date: Wed, 19 Jun 2013 16:48:31 -0000
X-Groupsio-MsgNum: 40812
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f5QefDQHtn8hx44O"
Content-Disposition: inline

--f5QefDQHtn8hx44O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2013 at 04:45:55PM +0100, Paul Eggleton wrote:
> On Wednesday 19 June 2013 16:24:53 Paul Eggleton wrote:
> > Hi Jate,
> >=20
> > On Wednesday 19 June 2013 11:08:10 Jate Sujjavanich wrote:
> > > This allows sstate-cache to be shared between builds in different
> > > directories.
> > >=20
> > > Differences in the full path were triggering a false positive when th=
ere
> > > were actually no changes.
> > >=20
> > > Signed-off-by: Jate Sujjavanich <jate.sujjavanich@myfuelmaster.com>
> > > ---
> > >=20
> > >  bitbake/lib/bb/fetch2/__init__.py |   14 +++++++++-----
> > >  bitbake/lib/bb/siggen.py          |    3 ++-
> > >  2 files changed, 11 insertions(+), 6 deletions(-)
> > >=20
> > > diff --git a/bitbake/lib/bb/fetch2/__init__.py
> > > b/bitbake/lib/bb/fetch2/__init__.py index dd1cc93..7ab44d7 100644
> > > --- a/bitbake/lib/bb/fetch2/__init__.py
> > > +++ b/bitbake/lib/bb/fetch2/__init__.py
> > >=20
> > > @@ -900,8 +900,7 @@ def get_checksum_file_list(d):
> > >      return " ".join(filelist)
> > >=20
> > > -
> > > -def get_file_checksums(filelist, pn):
> > >=20
> > > +def get_file_checksums(filelist, pn, topdir):
> > >      """Get a list of the checksums for a list of local files
> > >     =20
> > >      Returns the checksums for a list of local files, caching the res=
ults
> > >      as
> > >=20
> > > @@ -917,7 +916,12 @@ def get_file_checksums(filelist, pn): bb.warn("U=
nable
> > > to get checksum for %s SRC_URI entry %s: %s" % (pn, os.path.basename(=
f),
> > > e)) return None
> > >=20
> > >          return checksum
> > >=20
> > > +
> > > +    (recipe_root, _) =3D os.path.split(topdir)
> > >=20
> > > +    def remove_recipe_parent(data):
> > > +        return data.replace(recipe_root, '').strip('/')
> > > +
> > >=20
> > >      checksums =3D []
> > >     =20
> > >      for pth in filelist.split():
> > >          checksum =3D None
> > >=20
> > > @@ -927,7 +931,7 @@ def get_file_checksums(filelist, pn):
> > >              for f in glob.glob(pth):
> > >                  checksum =3D checksum_file(f)
> > >=20
> > >                  if checksum:
> > > -                    checksums.append((f, checksum))
> > > +                    checksums.append((remove_recipe_parent(f),
> > > + checksum))
> > >=20
> > >          elif os.path.isdir(pth):
> > >              # Handle directories
> > >=20
> > >              for root, dirs, files in os.walk(pth):
> > > @@ -935,12 +939,12 @@ def get_file_checksums(filelist, pn):
> > >                      fullpth =3D os.path.join(root, name)
> > >                      checksum =3D checksum_file(fullpth)
> > >=20
> > >                      if checksum:
> > > -                        checksums.append((fullpth, checksum))
> > > +
> > > + checksums.append((remove_recipe_parent(fullpth), checksum))
> > >=20
> > >          else:
> > >              checksum =3D checksum_file(pth)
> > >         =20
> > >          if checksum:
> > > -            checksums.append((pth, checksum))
> > > +            checksums.append((remove_recipe_parent(pth), checksum))
> > >=20
> > >      checksums.sort(key=3Doperator.itemgetter(1))
> > >      return checksums
> > >=20
> > > diff --git a/bitbake/lib/bb/siggen.py b/bitbake/lib/bb/siggen.py index
> > > 8861337..c64acfe 100644 --- a/bitbake/lib/bb/siggen.py
> > > +++ b/bitbake/lib/bb/siggen.py
> > >=20
> > > @@ -74,6 +74,7 @@ class SignatureGeneratorBasic(SignatureGenerator):
> > >          self.pkgnameextract =3D re.compile("(?P<fn>.*)\..*")
> > >          self.basewhitelist =3D set((data.getVar("BB_HASHBASE_WHITELI=
ST",
> > >=20
> > > True) or "").split()) self.taskwhitelist =3D None
> > > +        self.topdir =3D data.getVar("TOPDIR", True)
> > >=20
> > >          self.init_rundepcheck(data)
> > >     =20
> > >      def init_rundepcheck(self, data):
> > > @@ -187,7 +188,7 @@ class SignatureGeneratorBasic(SignatureGenerator):
> > >              self.runtaskdeps[k].append(dep)
> > >         =20
> > >          if task in dataCache.file_checksums[fn]:
> > > -            checksums =3D
> > > bb.fetch2.get_file_checksums(dataCache.file_checksums[fn][task],
> > > recipename) +            checksums =3D
> > > + bb.fetch2.get_file_checksums(dataCache.file_checksums[fn][task],
> > > + recipename, self.topdir)
> > >=20
> > >              for (f,cs) in checksums:
> > >                  self.file_checksum_values[k][f] =3D cs
> > >                  data =3D data + cs
> >=20
> > Good catch! The only thing is, this will not help for files within diff=
erent
> > layers which may not be underneath TOPDIR; I think we'll need a function
> > that determines which layer the file is under (longest path match from
> > data.getVar('BBLAYERS', True).split()) and then take that path off the
> > beginning.
> >=20
> > Additionally, this is a patch against bitbake so it will need to go to =
the
> > bitbake-devel@lists.openembedded.org mailing list.
>=20
> Actually, looking more closely at this I'm not sure how the full path to =
the=20
> file would be getting into the signature - looking at lib/bb/siggen.py it=
=20
> should only be adding the file checksum value to the signature data and n=
ot the=20
> path. I did a quick test with master by moving some files referred to in=
=20
> SRC_URI to a different valid location (thus changing their full path), cl=
eaning=20
> the recipe and then building it again, and the output was restored from s=
state=20
> rather than rebuilding.
>=20
> Can you explain how you came to the conclusion that this was why the chec=
ksums=20
> were different on different machines?

I sometimes compare signatures between two hosts with different TOPDIR
and I also haven't seen this issue. I'm using sstate-diff-machines.sh scrip=
t.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--f5QefDQHtn8hx44O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHB4P4ACgkQN1Ujt2V2gBxHXwCffd3FH5D7vsg+00yE/gc+V5d4
8XgAmwR+HvBFFxWDk4/Wk4LrH4pXbZ4N
=EZSb
-----END PGP SIGNATURE-----

--f5QefDQHtn8hx44O--

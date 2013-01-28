Received: from mail-we0-f172.google.com ([74.125.82.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tzq2x-0005bU-An
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 15:51:03 +0100
Received: by mail-we0-f172.google.com with SMTP id x10so1570779wey.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2013 06:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=UC6A/AZQhT719fORDAdpxHXsyaEP2yvjSsPmLdwKVv0=;
	b=qh7Pg4kPnPDs7pZBdZNLr3ACCNqKMBv5KJakcBuAFItLyJ81A5cXyftbgnqeOx+h8b
	INE5Ek03TYrCEUlbCHvhhdfAetqaBnBNwpmGUWWzqjDEZlxPj/4a0fWZbddVokhbs0Xo
	QPnYJWWK8/9ViwRSTfSZJ49vnbkgliO5X0EC1IAeZd4JGMfcNHX7b5J3qLZ3UJ5xQQxO
	61HzBRmcgAdLxlNsc5HrJEYv4oAE/j9sWP1zl/RPkG18N4kmZgIgRbzaf2r6l3WR+6fD
	ITrAAh2g1ZhsoQDj5nsbh0WVE0fN9eg5o+YhWmfuDu93gvUrj/ntuEH8g7n0TDWuEwIs
	U4KQ==
X-Received: by 10.180.101.99 with SMTP id ff3mr10234383wib.21.1359383716943;
	Mon, 28 Jan 2013 06:35:16 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id m6sm4606992wic.2.2013.01.28.06.35.15
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 06:35:16 -0800 (PST)
Date: Mon, 28 Jan 2013 15:35:20 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Constantin Musca <constantinx.musca@intel.com>
Message-ID: <20130128143520.GB16904@jama.palm1.palmone.com>
References: <1359363680-4588-1-git-send-email-constantinx.musca@intel.com>
	<20130128125637.GY16904@jama.palm1.palmone.com>
MIME-Version: 1.0
In-Reply-To: <20130128125637.GY16904@jama.palm1.palmone.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] migrate_localcount.bbclass: use PRAUTOINX instead of PN & PV
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jan 2013 14:51:07 -0000
X-Groupsio-MsgNum: 34558
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="03sphU6jKm9HdgU1"
Content-Disposition: inline

--03sphU6jKm9HdgU1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 28, 2013 at 01:56:37PM +0100, Martin Jansa wrote:
> On Mon, Jan 28, 2013 at 11:01:20AM +0200, Constantin Musca wrote:
> > - we need to use PRAUTOINX (it covers all cases)
> > - it addresses bumped PE issues
>=20
> Build is still runing, but entries in prserv db look correct now,
> thanks!

It's already too late for my local build, but maybe it would be
interesting for people still using OEBasic (instead of default
OEBasicHash) to use PRSERV _only_ as LOCALCOUNT replacement as that was
removed completely.

Now I see all packages are upgraded on target because of extra .0=20
in PR.

And it will stay constant .0 with OEBasic if I understood RP's answer
correctly.

"The service works with both OEBasic and OEBasicHash
generators, with the understanding that PR bumps happen when the
checksum changes and the different generator mechanisms change
signatures under different circumstances."

Only manual PE/PV/PR bump will change OEBasic signature, but also use=20
different key in PRMAIN_nohist, so again with '.0'.

Cheers,

>=20
> Cheers,
>=20
> >=20
> > [YOCTO #3071]
> >=20
> > Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> > ---
> >  meta/classes/migrate_localcount.bbclass | 9 ++++-----
> >  1 file changed, 4 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/meta/classes/migrate_localcount.bbclass b/meta/classes/mig=
rate_localcount.bbclass
> > index 59f14e8..3916ad4 100644
> > --- a/meta/classes/migrate_localcount.bbclass
> > +++ b/meta/classes/migrate_localcount.bbclass
> > @@ -18,14 +18,13 @@ python migrate_localcount_handler () {
> >          if not revs or not counts:
> >              return
> > =20
> > -        srcrev =3D bb.fetch2.get_srcrev(e.data)
> > -        bpv =3D pv[:pv.find(srcrev)]
> > -
> >          if len(revs) !=3D len(counts):
> >              bb.warn("The number of revs and localcounts don't match in=
 %s" % pn)
> >              return
> > =20
> > -        version =3D 'AUTOINC-%s-%s' % (pn, bpv)
> > +        version =3D e.data.getVar('PRAUTOINX', True)
> > +        srcrev =3D bb.fetch2.get_srcrev(e.data)
> > +        base_ver =3D 'AUTOINC-%s' % version[:version.find(srcrev)]
> >          pkgarch =3D e.data.getVar('PACKAGE_ARCH', True)
> >          value =3D max(int(count) for count in counts)
> > =20
> > @@ -40,7 +39,7 @@ python migrate_localcount_handler () {
> >          flock =3D bb.utils.lockfile("%s.lock" % df)
> >          with open(df, 'a') as fd:
> >              fd.write('PRAUTO$%s$%s$%s =3D "%s"\n' %
> > -                    (version, pkgarch, srcrev, str(value)))
> > +                    (base_ver, pkgarch, srcrev, str(value)))
> >          bb.utils.unlockfile(flock)
> >  }
> > =20
> > --=20
> > 1.7.11.7
> >=20
> >=20
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--03sphU6jKm9HdgU1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEGjKcACgkQN1Ujt2V2gBxxLACgns+an5dUBog/ajP2K5rA5p8g
/U4AnR3SIeKEwZsSZ5ilGz4INq86MuuW
=1/WG
-----END PGP SIGNATURE-----

--03sphU6jKm9HdgU1--

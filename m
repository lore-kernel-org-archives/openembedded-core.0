Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1TDG3W-00089j-Qi; Sun, 16 Sep 2012 16:42:42 +0200
Received: by weyr6 with SMTP id r6so3441072wey.6
	for <multiple recipients>; Sun, 16 Sep 2012 07:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=PyNiLPPJDKJCZxGNSggmpGi8fHpiZmO5Xd4lFONxjM0=;
	b=O9/q+QNquQAY8Iw5kCK52U9c3Ec72f8LMA6OAvbG/rurq1Vjy5p9BFBXPXgdNordP4
	fp14CDBo6mXjQaQYW2IQVxZCfY6W5gSRnumvelcpm1Apw+K0QEyWDKSS+RqyfK2cxhnB
	VKyEOU6cRP6E+8T/89+JqS0tMRvR5IIM/ZMnpoko+yDG9M/nPeiuT3DPcW4Q045oOBHY
	ei4h5SQt2qu7NcAFTHvZE9hSAlDgWbRN/NBnLnCrZNwr7HPZmaokwZF+rWbbFqhDTbaV
	v5JtAf1n5ZPefh+cnH5czM4HltIQzN7lRwl71Wl78bzlfhm7HvxUgh1ui/+g8O2edlzs
	0bPg==
Received: by 10.180.73.76 with SMTP id j12mr10152310wiv.11.1347805805343;
	Sun, 16 Sep 2012 07:30:05 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b7sm17568903wiz.9.2012.09.16.07.30.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 16 Sep 2012 07:30:03 -0700 (PDT)
Date: Sun, 16 Sep 2012 16:30:10 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Phil Blundell <philb@gnu.org>
Message-ID: <20120916143010.GB3628@jama.jama.net>
References: <20120914085706.2CBFC103C3@opal>
	<20120915162051.GA11051@jama.jama.net>
	<1347729817.4444.52.camel@x121e.pbcl.net>
	<20120915172816.GC11051@jama.jama.net>
	<1347741572.4444.54.camel@x121e.pbcl.net>
MIME-Version: 1.0
In-Reply-To: <1347741572.4444.54.camel@x121e.pbcl.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Andrei Dinu : libffi upgrade to 3.0.11
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
X-List-Received-Date: Sun, 16 Sep 2012 14:42:42 -0000
X-Groupsio-MsgNum: 29359
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="R3G7APHDIzY6R/pk"
Content-Disposition: inline

--R3G7APHDIzY6R/pk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 15, 2012 at 09:39:32PM +0100, Phil Blundell wrote:
> On Sat, 2012-09-15 at 19:28 +0200, Martin Jansa wrote:
> > On Sat, Sep 15, 2012 at 06:23:37PM +0100, Phil Blundell wrote:
> > > On Sat, 2012-09-15 at 18:20 +0200, Martin Jansa wrote:
> > > > This changes .so name from libffi5 to libffi6, breaking every recipe
> > > > depending on libffi when someone is using debian.bbclass.
> > >=20
> > > How exactly do the recipes break?  The whole point of debian.bbclass =
is
> > > to avoid breakage when this happens by making libffi5 and libffi6
> > > parallel installable.  If that isn't working then there is clearly a =
bug
> > > somewhere and we should fix that.
> >=20
> > libffi5 is no longer in feed, so if you try to install something from
> > feed which still has libffi5 in depends it will fail.
>=20
> Ah, right.  So it's not actually the recipes which are broken, it's just
> that something is wrong with whatever maintains the feed and the old
> binaries are no longer installable.  I guess you need to figure out why
> libffi5 is being removed and prevent that from happening.

Old ipk binaries are removed in package_write_ipk task.

Even when I keep those binaries in public feed (rsynced from
deploy/ipk/) then I would have to call opkg-make-index in that public
feed to keep them in Packages too.

So by default you can assume that libffi5*.ipk gets missing as soon as you
bump libffi to version with new .so name like libffi6.

And it's not only someone doing opkg install on target, do_rootfs fails
too if you have any of those affected packages in your image.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--R3G7APHDIzY6R/pk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBV4nIACgkQN1Ujt2V2gByTdwCfTa4731VLBRMvk2SrRLF4Xayz
H9gAoJFO4j2zgkk5TSjBbPJHU1uRjFal
=UtG6
-----END PGP SIGNATURE-----

--R3G7APHDIzY6R/pk--

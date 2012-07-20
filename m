Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Ss9k0-0002Di-TH
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 11:43:20 +0200
Received: by bkcik5 with SMTP id ik5so2594751bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 02:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=gmXOg/v6HHMlTewkqnX//xZnCfnKa41gIj1aSNN7NHM=;
	b=0NyCLtlSZMbDpkgJlyaiwIzMCH41btU/8qOyxrOKvF+/GL5T4oq1ku/fqjG6Tn2q0x
	KInzKz2vTfFEVjDRn/ooSzP4wOlUoVciMfbJuveOFeaxQc4U7RwKoPOTA7U/VpsyS3OP
	cgzERy6uMYZLBTOMBwBHlt4zBzcRfbp36qDj6m++V6PJ/v6KBWsSfvaUAPgLewI7/Mgv
	/Bz/X6sZYl+wHQ4Yh3wSXbaY71JL64LgKJEN7aECqLp6IYwDKKkK2R0lZQ3EBxxqq4F6
	vLR4uRw56y261xHJFzvEe8cBT4hRzRGdB+Izsqnfl6RYtk/gp4TqDAAClVbNMtkYh7DO
	dWxQ==
Received: by 10.204.128.214 with SMTP id l22mr2376174bks.86.1342776717833;
	Fri, 20 Jul 2012 02:31:57 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gq2sm2398984bkc.13.2012.07.20.02.31.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Jul 2012 02:31:56 -0700 (PDT)
Date: Fri, 20 Jul 2012 11:32:08 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120720093208.GD3534@jama.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Yocto style guide change proposal
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
X-List-Received-Date: Fri, 20 Jul 2012 09:43:21 -0000
X-Groupsio-MsgNum: 25833
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VMt1DrMGOVs3KQwf"
Content-Disposition: inline

--VMt1DrMGOVs3KQwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

in "PLEASE READ: Major change landing shortly (python whitespace)"

RP said:
It's become clear we have a horrible mixture of whitespace (tabs and
space) in python functions.

That was resolved in following patches for bitbake, oe-core and other
layers.

Now we have horrible mixture of whitespaces (tabs and space) only in=20
recipe files, because yocto style guide recommends tabs in shell
functions. So if recipe has e.g. do_install_append as well as
populate_packages_prepend (not so uncommon combination as tabs fixing
patches show), then according to yocto style guide it should look like
this:

do_install_append() {
	foo
}
python populate_packages_prepend () {
    libdir =3D bb.data.expand('${libdir}', d)
    do_split_packages(d, libdir, '^lib(.*)\.so\.*', 'lib%s', 'ORC %s librar=
y', extra_depends=3D'', allow_links=3DTrue)
}

especially with default tab width 8 spaces it's ugly and because it
is inconsistent, many devs used spaces in shell functions too. Now when
someone accidentaly use tab also in python function it will show warning
or fail to parse. Some devs are using mix of tabs and spaces even on the
same line (e.g. to indent SRC_URI multiline entries).

Maybe this inconsistence in recipe files is because yocto style guide is
harder to find then openembedded style guide..

First google hit for "openembedded style guide":
http://www.openembedded.org/wiki/Styleguide

says about tabs only this:
- Use spaces for indentation as developers tends to use different amount
  of spaces per one tab.

So only in yocto wiki there are 2 more bullets after that
https://wiki.yoctoproject.org/wiki/Recipe_%26_Patch_Style_Guide
- Use spaces for indentation as developers tends to use different amount
  of spaces per one tab.
- Shell functions should use tabs
- Python functions should use spaces (4 spaces per indent).

And yocto style guide is not in first 5 pages of result when searching
for "openembedded style guide".

If we change the style guild to use 4 spaces per indent also for shell
functions then we can easily update bitbake/contrib/vim to highlight
tabs, so that every tab would be easily spotted in recipe/bbclass.

FWIW: I've prepared patch for whole meta-smartphone to unify that and
I've sent RFC for few bbclasses in meta-oe too.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VMt1DrMGOVs3KQwf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAJJZgACgkQN1Ujt2V2gBz5fACcD6UUn1glgb0RARG9pkdustWM
uTkAnRPIuZ2NeTLVdhtcNFkTVdE///Fr
=NOf7
-----END PGP SIGNATURE-----

--VMt1DrMGOVs3KQwf--

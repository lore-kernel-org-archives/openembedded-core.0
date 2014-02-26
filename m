Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id C6EED6E85E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 19:11:52 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id m10so1202758eaj.39
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 11:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=YpGkfbgh0+vgXA8+QpD8TUL0KMEjQy/kJU71vL45bhU=;
	b=uvRpErtJg8B+L23G8gC9rLlyX3PXxHSsooBIQbgDNQ8ZOGsnzxvrfmuRJAPGZMyNC9
	WNRXXxHucN+qF0LcjyM5j7TuN2lC5FJbrn77Eln3Upf/cCXblX9GMMgtVCRSwq75tEFI
	cpy5VwJ5FrS2P/FpCDBVhWHGko0K5tGVtrlhTxfQH0MQY1IcD+l6gWsSPj242FizCmxH
	KrYNDcRUNKrWupzr9RSMXlPeTZ4lsN+f5Tp8x+uxm4nhZZvIWHyEw/TfBfgwyjnRqOUe
	gv8uUaYraTxEE0LXDbe/KPxHoykSqlvpMOZhM8KkiTduz+uvVzaHJzBSuc77dakiMZMg
	N8Cg==
X-Received: by 10.14.183.71 with SMTP id p47mr8561195eem.61.1393441912537;
	Wed, 26 Feb 2014 11:11:52 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u6sm7206816eep.11.2014.02.26.11.11.50 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Feb 2014 11:11:51 -0800 (PST)
Date: Wed, 26 Feb 2014 20:11:52 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20140226191152.GS26981@jama>
References: <1393253881.31769.6.camel@ted> <20140224152753.GG26981@jama>
	<CAJTo0LYBuZv5NDyM1gsQEL5KQfOvMsRpvOn5kjFaYBi5XL8wCw@mail.gmail.com>
	<20140224160954.GI26981@jama> <1393259224.31769.15.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1393259224.31769.15.camel@ted>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Separate build dir for autotools
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
X-List-Received-Date: Wed, 26 Feb 2014 19:11:54 -0000
X-Groupsio-MsgNum: 50626
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eEYjL7b2m+/uQ8dh"
Content-Disposition: inline

--eEYjL7b2m+/uQ8dh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2014 at 04:27:04PM +0000, Richard Purdie wrote:
> On Mon, 2014-02-24 at 17:09 +0100, Martin Jansa wrote:
> > On Mon, Feb 24, 2014 at 03:41:11PM +0000, Burton, Ross wrote:
> > > On 24 February 2014 15:27, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> > > > Can we start by adding
> > > > include conf/distro/include/seperatebuilddir.inc
> > > > to
> > > > conf/distro/defaultsetup.conf
> > > > ? so that more people start using it and possibly report issues in =
their
> > > > builds?
> > >=20
> > > That list is opt-in and mainly covers oe-core, so this gets tested
> > > every time the YP autobuilder does a world build.  We need a meta-oe
> > > world build where autotools.bbclass sets B=3D"${WORKDIR}/build": it's
> > > literally just this one-line patch.
> >=20
> > But doesn't cover oe-core built with different combinations for
> > PACKAGECONFIGs, .bbappends etc, so including this file in
> > defaultsetup.conf can still reveal few issues in oe-core recipes.
>=20
> Patch out for testing, I'll merge it if nobody objects...

I've added it to my world builds as soon as you sent it.. but only 1
architecture was finished since then :/

Is it supposed to work correctly in incremental builds? Today I've seen
couple of components failing in do_configure and building fine after
manual clean, interesting part of log is that autotools.bbclass was
actually trying to clean them:

Previously configured separate build directory detected, cleaning
/OE/../oprofileui-server/0.0+gitAUTOINC+f168b8bfdc-r0/build
=2E.
checking whether make supports nested variables... yes
configure: error: source directory already configured; run "make distclean"=
 there first
Configure failed. The contents of all config.log files follows to aid debug=
ging
/OE/../oprofileui-server/0.0+gitAUTOINC+f168b8bfdc-r0/git/config.log
This file contains any messages produced by compilers while
running configure, to aid debugging if configure makes a mistake.

It was created by oprofileui configure 0.2.0, which was

The working version also has:
configure.ac:5: warning: AM_INIT_AUTOMAKE: two- and three-arguments forms a=
re deprecated.  For more info, see:
configure.ac:5: http://www.gnu.org/software/automake/manual/automake.html#M=
odernize-AM_005fINIT_005fAUTOMAKE-invocation
configure.ac:8: installing './compile'
configure.ac:5: installing './install-sh'
configure.ac:5: installing './missing'
protocol/Makefile.am: installing './depcomp'

I've seen similar behavior in 3 other components.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--eEYjL7b2m+/uQ8dh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMOPHgACgkQN1Ujt2V2gBzrcACfdjkG6X/PgI9RMT7FySoQcUzD
h+UAnjkm+CNV3kxh+2lc2BT7usBXYAss
=vzF1
-----END PGP SIGNATURE-----

--eEYjL7b2m+/uQ8dh--

Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2401161038
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 16:40:40 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id d41so2920891eek.19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jul 2013 09:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=AuAIHkhsDyQ8ijSTR0zYF7EEXOSYUJRKkL8lcBd4nfg=;
	b=xPDULsdtCfSYV/67lbGFfQFwBRydMgL2LZKda/jDMg/gvCDknJO7Qkzp4tQXsl1pGp
	uSbqAW+UfOyQYo8vVdcq6OggZjkuGI82bnPqA24btGjKjv9jy/QzHA8kX/hwXEfSTxC+
	q8qgy16O5Zwppjf/dyufyBnYBhgIWj0mURnjAJ01L+gbK1YHGndP4sZyYBy0sF6+txM+
	BAsV75M8Ge/fdLTPVl/kYphX29GN8eX+iwqSmR9OaEDvrGAqcxbV3SyNUdP6BJd3zmeb
	9UpfxOrqT3ljWQiO1Qh1y4lXOTtxDzRztfYMctQXxGYGq3Lyj3NiRq49xWwoESw7hJ7h
	R7dw==
X-Received: by 10.15.33.13 with SMTP id b13mr26228549eev.0.1373301641529;
	Mon, 08 Jul 2013 09:40:41 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	c44sm43445003eeb.8.2013.07.08.09.40.40 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 08 Jul 2013 09:40:40 -0700 (PDT)
Date: Mon, 8 Jul 2013 18:40:49 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20130708164049.GN3288@jama>
References: <20130704083054.GA3259@jama>
	<1373105044-30014-1-git-send-email-Martin.Jansa@gmail.com>
	<5517861.pGMakEMcrE@helios>
MIME-Version: 1.0
In-Reply-To: <5517861.pGMakEMcrE@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] buildhistory: Record size of installed package not compressed archive
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
X-List-Received-Date: Mon, 08 Jul 2013 16:40:41 -0000
X-Groupsio-MsgNum: 41614
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EqVOK5mkaJAMmtSx"
Content-Disposition: inline

--EqVOK5mkaJAMmtSx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 08, 2013 at 04:47:57PM +0100, Paul Eggleton wrote:
> On Saturday 06 July 2013 12:04:04 Martin Jansa wrote:
> > * usually it's more important to know how much space will each
> >   package take on target device then size of compressed package
> > * example for libewebkit0 with 4 different architectures, interesting
> >   that om_gta02 .ipk is bigger but it's smaller when installed
> >=20
> >   before:
> >   MACHINE     DEFAULTTUNE       SIZE (.ipk file)
> >   om_gta04    cortexa8t-neon    15996 KiB libewebkit0
> >   qemux86_64  x86-64            16992 KiB libewebkit0
> >   spitz       xscale            16148 KiB libewebkit0
> >   om_gta02    arm920t           16260 KiB libewebkit0
> >=20
> >   after:
> >   MACHINE     DEFAULTTUNE       SIZE (installed)
> >   om_gta04    cortexa8t-neon    60544 KiB libewebkit0
> >   qemux86_64  x86-64            63720 KiB libewebkit0
> >   spitz       xscale            60588 KiB libewebkit0
> >   om_gta02    arm920t           56268 KiB libewebkit0
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/classes/buildhistory.bbclass | 11 ++++----
> >  scripts/oe-pkgdata-util           | 59
> > ++++++++++++++++++++++++++++++++++++--- 2 files changed, 61 insertions(=
+),
> > 9 deletions(-)
> >=20
> > diff --git a/meta/classes/buildhistory.bbclass
> > b/meta/classes/buildhistory.bbclass index 36e7fe1..1ebe68e 100644
> > --- a/meta/classes/buildhistory.bbclass
> > +++ b/meta/classes/buildhistory.bbclass
> > @@ -317,6 +317,8 @@ buildhistory_get_installed() {
> >  	# Get list of installed packages
> >  	pkgcache=3D"$1/installed-packages.tmp"
> >  	list_installed_packages file | sort > $pkgcache
> > +	pkgcachearch=3D"$1/installed-packages-arch.tmp"
> > +	list_installed_packages arch | sort > $pkgcachearch
>=20
> If possible I would prefer to avoid having to query the installed package=
 list=20
> twice; I know that would mean changing every backend. I can look at this =
if=20
> you're short on time.

I was thinking about adding "list_installed_packages filearch" or
something like that, but because of lack of time I could spend on this
one I decided to skip it. Feel free to improve it.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EqVOK5mkaJAMmtSx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHa65EACgkQN1Ujt2V2gBzAIwCfaH3ZKxYTGuMfavGFylx65eSK
l9wAni4Lz2dMSqArD6ryRuJt0Ljt7t5J
=v5BV
-----END PGP SIGNATURE-----

--EqVOK5mkaJAMmtSx--

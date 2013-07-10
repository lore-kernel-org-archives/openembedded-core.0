Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id C43DE60687
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 17:45:07 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id b57so4930464eek.36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 10:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=IrPPb7D2LdKLWC/oI17U5FpB2NPjnqht5mtUnc7uM2o=;
	b=nryZqrP2OhfhKQsIbQUNGCqTK3RdRcbKdrfK2HH/zAXZtDJoGdZr34Wp3FeDM1SWVH
	Rpl1NmZpIqefVjSXlVTf7iJ0BIFk4AwHtzOIWTt1zZT7OOC9b0UnICt77ZLPftpvaHze
	Q29jlmgGOVo6yaBfOl3iitslFWawLtp8m+/RNwaJK348Ps+hCjLQW/3wtRCkMoIIa1mA
	YOu8dklkL57YmnX5qQ94p/F6Szqhyx6tc9Nq8PBJVfZTyD5tC2KDvFG20wDNOZGH8v8w
	ZBHe6KwtmmA9j4ug0X485xv+lAbn1v20gVc8DiLlZq+dphZkkiopWZ8xsWDtBis6+PMy
	uT7w==
X-Received: by 10.15.34.77 with SMTP id d53mr37089265eev.95.1373478307448;
	Wed, 10 Jul 2013 10:45:07 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	ci50sm61669322eeb.12.2013.07.10.10.45.06 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 10 Jul 2013 10:45:06 -0700 (PDT)
Date: Wed, 10 Jul 2013 19:45:17 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20130710174516.GE3288@jama>
References: <20130706213931.GD3288@jama>
	<1373459893-23611-1-git-send-email-Martin.Jansa@gmail.com>
	<51DD5C13.1040701@topic.nl> <2537500.7dBumEqH9t@helios>
MIME-Version: 1.0
In-Reply-To: <2537500.7dBumEqH9t@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: sstate-cache and making a package "host-dependent"
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
X-List-Received-Date: Wed, 10 Jul 2013 17:45:08 -0000
X-Groupsio-MsgNum: 41757
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oIK88BWnNPSddvdK"
Content-Disposition: inline

--oIK88BWnNPSddvdK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2013 at 06:39:20PM +0100, Paul Eggleton wrote:
> Hi Mike,
>=20
> On Wednesday 10 July 2013 15:05:23 Mike Looijmans wrote:
> > I added a buildserver that also exports its "sstate-cache" directory, so
> > that other build machines can grab their stuff from it. This works fine,
> > but I have one problem. Some packages are meant to be dependent on the
> > system that built it. I want to enforce that each build machine creates
> > its own package, and does not grab it from the sstate-cache of the
> > central server.
> >=20
> > For example,
> >=20
> > $ cat recipes-core/meta/distro-feed-configs.bbappend
> > PRINC=3D"1"
> > DISTRO_HOST_NAME ?=3D "${@os.uname()[1]}"
> > DISTRO_FEED_NAME ?=3D "feed"
> > DISTRO_FEED_PREFIX =3D "topic"
> > DISTRO_FEED_URI =3D
> > "http://${DISTRO_HOST_NAME}/${DISTRO_FEED_NAME}/${MACHINE}"
> >=20
> >=20
> > The purpose being that the host name of the machien that built the image
> > ends up in the opkg config files. This works just fine.
> > Now that we have a central server, all images on all build hosts grab
> > the package from the sstate-cache server, resulting in the feed pointing
> > to the central server instead of the private one, which is not what I
> > wanted to happen.
> >=20
> > After reading the documentation, I added the following line to the reci=
pe:
> >=20
> > PACKAGE_ARCHS[vardeps] =3D "DISTRO_FEED_URI"
> >=20
> > This did not have the desired effect. The package is still retrieved
> > from the cache, and not rebuilt locally. Even if I clean and force a
> > rebuild of the distro-feed-configs package, the package that ends up in
> > the image is still the one from the central server.
> >=20
> > What am I missing here?
>=20
> I think distro-feed-configs (from meta-oe, not OE-Core) is for package=20
> installation on the target, and has nothing to do with shared state.
>=20
> I'm not sure if it's entirely appropriate, but you could take a similar=
=20
> approach to the one we use for preventing native sstate packages from mix=
ing=20
> across different distributions (mostly to sidestep host glibc version=20
> dependency problems) - set SSTATE_EXTRAPATH to some value for the recipes=
 you=20
> don't want to share and then the packages will go into a subdirectory nam=
ed=20
> with that value; you could then delete these automatically from the serve=
r.

I would try to add
DISTRO_HOST_NAME[vardepvalue] =3D "${DISTRO_HOST_NAME}"

that way each builder should create own sstate archive.

use bitbake-diffsigs path-to-distro-feeds.sigdata-file to check that
value of os.uname is included in signature.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oIK88BWnNPSddvdK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHdnawACgkQN1Ujt2V2gBySGACgivcS9PFlJxnPSBWz67TIu/63
bpUAoKBbLWXLTjcS6v4qUWsIQEA4LICS
=U6Ew
-----END PGP SIGNATURE-----

--oIK88BWnNPSddvdK--

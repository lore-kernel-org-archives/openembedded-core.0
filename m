Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 069CF617AA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 15:28:14 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id e49so1041687eek.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 07:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=aTYXyotVnE3/BcIlV/UkM1m5df+Q7c41u9yefDU9ilY=;
	b=m2Ff62LEPTxbJYEpnMsgHUCk8KS8W9dt1zdXpgmM06s92N5TnCsz5+Imb0DeCply0y
	JrbqLUqcXJyG2eY6PEkHxWCW5bkVfO+5T4uHIscGZcJsJBD60yS/GVOQu4vxB39jFSmo
	A/MQdydJqsfMbbowezH2n6M51qkQyXkxWHa/gVvNvmtBhVYlRmeEDc4JM+8dRIzTamFe
	43hzkrhEw9Vp9B55tjbD418+ueCOQWMB20xGSzMg56mdyDnjfBN69YXIEpXYKsS9x7h6
	54DvpIsV8jRC9acw7E1NA0NXlsdMiuqKS6jiux/F5LPGBzgD4eqljHypoYe+zRf7Pn9Q
	Zprg==
X-Received: by 10.14.221.4 with SMTP id q4mr24787573eep.47.1393255695144;
	Mon, 24 Feb 2014 07:28:15 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	a2sm49849023eem.18.2014.02.24.07.28.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Feb 2014 07:28:13 -0800 (PST)
Date: Mon, 24 Feb 2014 16:27:53 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20140224152753.GG26981@jama>
References: <1393253881.31769.6.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1393253881.31769.6.camel@ted>
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
X-List-Received-Date: Mon, 24 Feb 2014 15:28:15 -0000
X-Groupsio-MsgNum: 50506
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kadn00tgSopKmJ1H"
Content-Disposition: inline

--kadn00tgSopKmJ1H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2014 at 02:58:01PM +0000, Richard Purdie wrote:
> For a while poky and others have been using the seperatebuilddir.inc
> file. This makes ${S} !=3D ${B} and means that ${B} can be wiped when
> configuration changes.
>=20
> This helps deal with the fact that autotools and friends are not
> particular good at rebuilding things that change. The recent libcheck
> upgrade which broke bluez4 builds is but one example of the kind of
> problem we can hit. Sadly bluez4 doesn't work for S!=3DB so it didn't
> protect against that issue but it does protect other packages.
>=20
> I'd really love to switch the default in autotools.bbclass to make this
> the default and then have broken packages opt out of it.
>=20
> I can deal with OE-Core and make sure the metadata there is updated, my
> bigger worry is what this would do to other layers.
>=20
> The options I can see are therefore basically:
>=20
> a) We change the default in autotools.bbclass and fix things that break

If there is patch to do that, I'm willing to run my world builds with it
to generate updated
www.openembedded.org/wiki/Bitbake_World_Status
so that we have some estimate how many recipes will be broken.

Can we start by adding
include conf/distro/include/seperatebuilddir.inc
to
conf/distro/defaultsetup.conf
? so that more people start using it and possibly report issues in their
builds?

> b) We introduce an "autotools2" class and have recipes inherit that.
> This version would default to separate builddirs. It does mean change to
> all the "good" recipes rather than the broken ones though and hence a
> fair bit of churn.

or introduce "autotools-noseparatebuilddir" as easy to use fix for
broken recipes from a), that will make it easier to search for recipes
to fix (as some kind of janitor task).

> Have we got the willpower to fix a)? is b) an option? Other ideas?

We don't have willpower to fix all issues in Bitbake_World_Status so I
don't expect many people jumping on task of fixing separate B in some
less used recipes/layers (but I can volunteer to replace
"s/autotools/autotools-noseparatebuilddir/g" to keep my World_Status
close to current state).

> One way or another I think we should try and switch things somehow...

Agreed, it went quite smoothly with cmake, qmake5, so autotools is next
:).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kadn00tgSopKmJ1H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMLZPkACgkQN1Ujt2V2gBxBoACaAmEtIcjeTJ88+suthlEKaBQA
tRoAoJVlds1WPVMx7Ilrho7Oba7fHBSG
=1QTK
-----END PGP SIGNATURE-----

--kadn00tgSopKmJ1H--

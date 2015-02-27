Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 1959973745
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 13:57:46 +0000 (UTC)
Received: by wesu56 with SMTP id u56so20542554wes.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 05:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=kLw6UYAHQTsOPc0WfoMuHubr39InmMnUdwFxZwJP+bA=;
	b=Bz/M9QIS9TN0dDL8dbukGy7Z5tJxcn3pnfizLmwqsRVw0ZoaTC0a3mlPannhUALIFS
	3BpoM4vddeWnUUFt6ZO3FUOVkQzQq5SemlxpHSkE3IJ2rh5/jN36E25KVRG+inlZPOUB
	Xr50i5RXU0LZj62DnDI/muI0PEl3NBKwn7p+PJid9tSxxm6ESgN7fmUcInQJEDioNTTP
	l5Fd/THB/GOKM82RmI0mHPrFI074p3E9uA+uN8U2m5nDltylazPBQO337yLRY2bFmkiV
	VMDJBQk9upacW789ezmovJD5FF9oo+Pin19/Bk4EMSoTgFRn3fZu2Z0vGJroIMpFhyaB
	VoLw==
X-Received: by 10.180.73.205 with SMTP id n13mr6711270wiv.64.1425045467612;
	Fri, 27 Feb 2015 05:57:47 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gz3sm2973401wib.1.2015.02.27.05.57.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Feb 2015 05:57:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 27 Feb 2015 14:58:05 +0100
To: Peter Urbanec <openembedded-devel@urbanec.net>
Message-ID: <20150227135805.GM2309@jama>
References: <1424973442-24727-1-git-send-email-openembedded-devel@urbanec.net>
	<CAJTo0La5_Wdf537Ct-ZkLqsx7=5KrYsCCpG9fH8g-hdWNjDQpw@mail.gmail.com>
	<54EFDF33.2000609@urbanec.net> <54F03A47.8020208@opendreambox.org>
	<54F0629A.9080700@urbanec.net>
MIME-Version: 1.0
In-Reply-To: <54F0629A.9080700@urbanec.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0*git: Update to build current AUTOREV from master branch.
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
X-List-Received-Date: Fri, 27 Feb 2015 13:57:47 -0000
X-Groupsio-MsgNum: 62807
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="j3zO+32zXj6UcJCE"
Content-Disposition: inline

--j3zO+32zXj6UcJCE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2015 at 11:27:06PM +1100, Peter Urbanec wrote:
> On 27/02/15 20:35, Andreas Oberritter wrote:
> > as far as I remember, OE-Core policy forbids AUTOREV in recipes, because
> > it would make network access mandatory.
>=20
> Fair enough. If that is the policy, it would probably be appropriate to=
=20
> move the gstreamer1.01-*_git.bb recipes out of oe-core or at least fix=20
> them so that it is possible to use ${AUTOREV} from another layer.
>=20
> > The syntax for enabling it from local.conf is:
> > SRCREV_pn-gstreamer1.0 =3D "${AUTOREV}"
>=20
> This only works for the main gstreamer1.0 recipe. It fails with infinite=
=20
> recursion on any of the gstreamer1.0-plugins-*.bb recipes as I mentioned=
=20
> before. This is because the plugins use a python method for SRC_URI=20
> which references PV. This blows up when you try to use SRCREV=3D"${AUTORE=
V}"
>=20
> I guess the question is what next? Should I just drop this and leave the=
=20
> oe-core gstreamer1.0*git.bb recipes as they are (referencing git commits=
=20
> from circa 2013) or should I put a bit more effort into cleaning up the=
=20

I think the best compromise is to apply your changes, but instead of
setting SRCREV to AUTOREV set it to some recent revision you've tested
locally.

Then someone can apply AUTOREV from distro config or if we cannot work
around infinite recursion, then you can still set it to AUTOREV in
=2Ebbappend.

Cheers,

> issues with infinite recursion when used with AUTOREV? I suspect that=20
> the cleanup will just involve removing the current code and inserting a=
=20
> bunch of conditionals that translate "gstreamer1.0-" to "gst-"
>=20
> In my opinion the current version of the recipes is of limited value. I=
=20
> understand that there has recently been some activity on implementing=20
> something that could deliver the functionality of gitpkgv at the oe-core=
=20
> level. Should I perhaps just wait and see how that pans out?=20
> gstreamer1.0*git.bb could be a good test case. ;-)
>=20
> Cheers and beers,
>=20
> 	Peter
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--j3zO+32zXj6UcJCE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTwd+0ACgkQN1Ujt2V2gBy0+gCfeyahCtLkwzck3Fbsjh0SQWDR
AaAAoJL3rR3xdZuJbAbR6NvG/TlxBT4N
=+H9O
-----END PGP SIGNATURE-----

--j3zO+32zXj6UcJCE--

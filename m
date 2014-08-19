Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 608F365DEB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 19:29:50 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id b13so6893801wgh.22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 12:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=LnyMu7c2dmj1vwYNSJ4do69wEwCFjcimKeR3ZXliauc=;
	b=YLbTP3mFoxmS9mON8/nvv0+d+QuR+HXl9o8NSfvoDESjZowLRpscakZJaEI7poqLyk
	N/JyhvVylFOkj2qYGBinNQb4f3054EarpBq/MV6YfrACxTGtVg+9htF9+hq/mF9ea/n6
	AhPNyQkCpUllr8p/n32fqbm29BQatA21X3no2RKCIcWVN637KubmLFYUNY3E2XOjhBl+
	qI7tPEBupbVleCeDDYc5QOdqojYtFlTMHuBnXaOzcIpfxqUy+RY+bzv4EKtWQ/W2WWzT
	IenIYOUedpHToj0pG/gvNpn2sUcgpKQJdpLdzs2or46b23hu1HLJuAW5V8rB/Jx62WsB
	k6xw==
X-Received: by 10.194.8.35 with SMTP id o3mr52146543wja.3.1408476591698;
	Tue, 19 Aug 2014 12:29:51 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	h3sm52641604wjn.10.2014.08.19.12.29.50 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Aug 2014 12:29:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 19 Aug 2014 21:29:52 +0200
To: Paul Barker <paul@paulbarker.me.uk>
Message-ID: <20140819192952.GV3660@jama>
References: <1407497829-9330-1-git-send-email-paul@paulbarker.me.uk>
	<20140819185526.GG7174@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20140819185526.GG7174@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Fix gpg support in opkg
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
X-List-Received-Date: Tue, 19 Aug 2014 19:29:51 -0000
X-Groupsio-MsgNum: 56759
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="js+/jT5SQQin5+Fm"
Content-Disposition: inline

--js+/jT5SQQin5+Fm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2014 at 06:55:26PM +0000, Paul Barker wrote:
> On Fri, Aug 08, 2014 at 11:37:07AM +0000, Paul Barker wrote:
> > After recent changes to disable binconfig programs, 'gpgme-config' is n=
o longer
> > installed with gpgme. This prevents opkg from finding gpgme which is ne=
eded when
> > 'gpg' is added to PACKAGECONFIG. This is fixed in two stages:
> >=20
> >   - A 'gpgme.pc' file was created and added to openembedded-core to be =
installed
> >     with gpgme. The Cflags and Libs values for this file were found by =
running
> >     'gpgme-config' on my development machine. This patch is included he=
re.
> >=20
> >   - Changes were made to 'configure.ac' in opkg to use pkg-config to fi=
nd gpgme
> >     instead of using 'gpgme-config'. These changes could be added as a =
patch in
> >     openembedded-core but I don't think there's much point. opkg-0.2.3 =
should be
> >     released in the next couple of weeks and I'll include the relevant =
changes
> >     in that.
> >=20
> > Additionally, I found that gpg itself wasn't installed when opkg was in=
stalled
> > with gpg support. The 'opkg-key' program uses gpg to manage the list of=
 trusted
> > keys so without gpg it isn't possible to set up package feed verificati=
on on a
> > device. Therefore, I've added 'gnupg' to RDEPENDS when 'gpg' is in
> > PACKAGECONFIG.
> >=20
> > Paul Barker (2):
> >   gpgme: Add pkg-config file
> >   opkg: Add runtime dep on gnupg if 'gpg' is in PACAKGECONFIG
> >=20
> >  meta/recipes-devtools/opkg/opkg.inc             |  2 +-
> >  meta/recipes-support/gpgme/gpgme-1.4.3/gpgme.pc | 10 ++++++++++
> >  meta/recipes-support/gpgme/gpgme_1.4.3.bb       |  8 +++++++-
> >  3 files changed, 18 insertions(+), 2 deletions(-)
> >  create mode 100644 meta/recipes-support/gpgme/gpgme-1.4.3/gpgme.pc
> >=20
>=20
> Ping on these two patches. I think I've addressed Martin's question on the
> second patch now, they should hopefully be ok to merge.

Yes, it's fine with me.

> Thanks,
>=20
> --=20
> Paul Barker
>=20
> Email: paul@paulbarker.me.uk
> http://www.paulbarker.me.uk



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--js+/jT5SQQin5+Fm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPzpbAACgkQN1Ujt2V2gBy5wwCeJD9MF96cuyx22Q/EvsM0+0p/
bNwAoIpBygjF8HAOiYTSmYiVvbZg4TIU
=WWBr
-----END PGP SIGNATURE-----

--js+/jT5SQQin5+Fm--
